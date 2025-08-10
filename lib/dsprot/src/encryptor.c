#include "encryptor.h"

#include "bss.h"
#include "rc4.h"
#include "encoding_constants.h"

static void clearDataAndInstructionCache(void* start_addr, u32 num_bytes);

static void clearDataAndInstructionCache(void* start_addr, u32 num_bytes) {
    DC_FlushRange(start_addr, num_bytes);
    IC_InvalidateRange(start_addr, num_bytes);
}

u32 Encryptor_CategorizeInstruction(u32 instruction) {
    u8 upper_byte = (instruction >> 24) & 0xFF;

    if ((upper_byte & 0x0E) == 0x0A) {
        if ((upper_byte & 0xF0) == 0xF0) {
            return 1;
        }

        if (upper_byte & 0x01) {
            return 2;
        } else {
            return 3;
        }
    }

    return 0;
}

void Encryptor_DecodeFunctionTable(FuncInfo* functions) {
    if (functions == NULL) {
        return;
    }

    for (; functions->start_addr != NULL; functions++) {
        u32 size = functions->size - (u32)&BSS - ENC_VAL_1;

        u32 addr = (u32)functions->start_addr;
        if (addr == 0) {
            break;
        }

        // Cast required to match. Likely a macro here to remove the obfuscation
        addr = (u32)addr - ENC_VAL_1;

        u32 end_addr = addr + (size & ~3);
        for (; addr < end_addr; addr += 4) {
            switch (Encryptor_CategorizeInstruction(*(u32*)addr)) {
                case 1:
                case 2:
                    *(u32*)addr = ((*(u32*)addr & 0xFF000000) ^ (ENC_OPCODE_1 << 24)) |
                                  (((*(u32*)addr & 0x00FFFFFF) - ENC_VAL_1) & 0x00FFFFFF);
                    break;

                case 3:
                    *(u32*)addr = ((*(u32*)addr & 0xFF000000) ^ (ENC_OPCODE_1 << 24)) |
                                  (((*(u32*)addr & 0x00FFFFFF) - ENC_VAL_2) & 0x00FFFFFF);
                    break;

                default:
                    {
                        u32 a = ((u8*)addr)[0] ^ ENC_BYTE_A;
                        u32 b = ((u8*)addr)[1] ^ ENC_BYTE_B;
                        u32 c = ((u8*)addr)[2] ^ ENC_BYTE_C;
                        u32 d = ((u8*)addr)[3] ^ ENC_OPCODE_2;
                        *(u32*)addr = a | (b << 8) | (c << 16) | (d << 24);
                        break;
                    }
            }
        }

        clearDataAndInstructionCache(functions->start_addr - ENC_VAL_1, size);
    }
}

void* Encryptor_DecryptFunction(u32 obfs_key, void* obfs_func_addr, u32 obfs_size) {
    u32 expanded_key[4];

    u32 literal_obfs_offset = (u32)&BSS + ENC_VAL_1;

    u32 key = obfs_key;
    key -= literal_obfs_offset;

    u32 size = obfs_size;
    size -= literal_obfs_offset;

    expanded_key[0] = key ^ size;
    expanded_key[1] = ((key <<  8) | (key >> 24)) ^ size;
    expanded_key[2] = ((key << 16) | (key >> 16)) ^ size;
    expanded_key[3] = ((key << 24) | (key >>  8)) ^ size;

    void* func_addr = obfs_func_addr;
    func_addr -= ENC_VAL_1;

    RC4_InitAndDecryptInstructions(&expanded_key[0], func_addr, func_addr, size);
    clearDataAndInstructionCache(func_addr, size);

    return func_addr;
}

u32 Encryptor_EncryptFunction(u32 obfs_key, void* obfs_func_addr, u32 obfs_size) {
    u32    expanded_key[4];

    u32 literal_obfs_offset = (u32)&BSS + ENC_VAL_1;

    void* func_addr = obfs_func_addr;

    obfs_size = obfs_size - literal_obfs_offset;
    u32 size = obfs_size;

    obfs_key = obfs_key - literal_obfs_offset + ((u32)func_addr >> 20);
    u32 new_key = obfs_key;

    expanded_key[0] = new_key;
    expanded_key[1] = new_key;
    expanded_key[2] = new_key;
    expanded_key[3] = new_key;

    expanded_key[0] = ((expanded_key[0] <<  0) | (expanded_key[1] >> 32)) ^ size;
    expanded_key[1] = ((expanded_key[1] <<  8) | (expanded_key[1] >> 24)) ^ size;
    expanded_key[2] = ((expanded_key[2] << 16) | (expanded_key[2] >> 16)) ^ size;
    expanded_key[3] = ((expanded_key[3] << 24) | (expanded_key[3] >>  8)) ^ size;

    func_addr -= ENC_VAL_1;

    RC4_InitAndEncryptInstructions(&expanded_key[0], func_addr, func_addr, size);
    clearDataAndInstructionCache(func_addr, size);

    return new_key + literal_obfs_offset;
}
