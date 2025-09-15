#include "encryptor.h"

#include "bss.h"
#include "encoding_constants.h"
#include "rc4.h"

#define ROTL(x, a) ((a) == 0 ? (x) : (((x) << (a)) | ((x) >> (32 - (a)))))

static void clearDataAndInstructionCache(void *start_addr, u32 num_bytes);

static void clearDataAndInstructionCache(void *start_addr, u32 num_bytes) {
    DC_FlushRange(start_addr, num_bytes);
    IC_InvalidateRange(start_addr, num_bytes);
}

u32 Encryptor_CategorizeInstruction(u32 instruction) {
    u8 upper_byte = (instruction >> 24) & 0xFF;

    if ((upper_byte & 0x0E) == 0x0A) {
        if ((upper_byte & 0xF0) == 0xF0) {
            return INS_TYPE_BLXIMM;
        }

        if (upper_byte & 0x01) {
            return INS_TYPE_BL;
        } else {
            return INS_TYPE_B;
        }
    }

    return INS_TYPE_OTHER;
}

void Encryptor_DecodeFunctionTable(FuncInfo *functions) {
    if (functions == NULL) {
        return;
    }

    for (; functions->obfs_addr != 0; functions++) {
        u32 size = functions->obfs_size - (u32)&BSS - ENC_VAL_1;

        u32 *addr = (u32 *)functions->obfs_addr;
        if (addr == NULL) {
            break;
        }

        addr = (void *)addr - ENC_VAL_1;
        u32 *end_addr = addr + (size / 4);
        for (; addr < end_addr; addr++) {
            switch (Encryptor_CategorizeInstruction(*addr)) {
            case INS_TYPE_BLXIMM:
            case INS_TYPE_BL:
                *addr = ((*addr & 0xFF000000) ^ (ENC_OPCODE_1 << 24)) | (((*addr & 0x00FFFFFF) - ENC_VAL_1) & 0x00FFFFFF);
                break;

            case INS_TYPE_B:
                *addr = ((*addr & 0xFF000000) ^ (ENC_OPCODE_1 << 24)) | (((*addr & 0x00FFFFFF) - ENC_VAL_2) & 0x00FFFFFF);
                break;

            default: {
                u8 *addr_bytes = (u8 *)addr;
                *addr = (addr_bytes[0] ^ ENC_BYTE_A) | ((addr_bytes[1] ^ ENC_BYTE_B) << 8) | ((addr_bytes[2] ^ ENC_BYTE_C) << 16) | ((addr_bytes[3] ^ ENC_OPCODE_2) << 24);
            } break;
            }
        }

        clearDataAndInstructionCache((void *)(functions->obfs_addr - ENC_VAL_1), size);
    }
}

void *Encryptor_DecryptFunction(u32 obfs_key, u32 obfs_func_addr, u32 obfs_size) {
    u32 expanded_key[4];

    u32 literal_obfs_offset = (u32)&BSS + ENC_VAL_1;

    u32 key = obfs_key;
    key -= literal_obfs_offset;

    u32 size = obfs_size;
    size -= literal_obfs_offset;

    expanded_key[0] = ROTL(key, 0) ^ size;
    expanded_key[1] = ROTL(key, 8) ^ size;
    expanded_key[2] = ROTL(key, 16) ^ size;
    expanded_key[3] = ROTL(key, 24) ^ size;

    void *func_addr = (void *)obfs_func_addr;
    func_addr -= ENC_VAL_1;

    RC4_InitAndDecryptInstructions(&expanded_key[0], func_addr, func_addr, size);
    clearDataAndInstructionCache(func_addr, size);

    return func_addr;
}

u32 Encryptor_EncryptFunction(u32 obfs_key, u32 obfs_func_addr, u32 obfs_size) {
    u32 expanded_key[4];

    u32 literal_obfs_offset = (u32)&BSS + ENC_VAL_1;

    void *func_addr = (void *)obfs_func_addr;

    obfs_size = obfs_size - literal_obfs_offset;
    u32 size = obfs_size;

    obfs_key = obfs_key - literal_obfs_offset + (obfs_func_addr >> 20);
    u32 new_key = obfs_key;

    expanded_key[0] = ROTL(new_key, 0) ^ size;
    expanded_key[1] = ROTL(new_key, 8) ^ size;
    expanded_key[2] = ROTL(new_key, 16) ^ size;
    expanded_key[3] = ROTL(new_key, 24) ^ size;

    func_addr -= ENC_VAL_1;

    RC4_InitAndEncryptInstructions(&expanded_key[0], func_addr, func_addr, size);
    clearDataAndInstructionCache(func_addr, size);

    return new_key + literal_obfs_offset;
}
