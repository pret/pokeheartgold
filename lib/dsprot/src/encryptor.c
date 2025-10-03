#include "encryptor.h"

#include "bss.h"
#include "encoding_constants.h"
#include "nitro_os.h"
#include "rc4.h"

#define ROTL(x, a) ((a) == 0 ? (x) : (((x) << (a)) | ((x) >> (32 - (a)))))

static void clearDataAndInstructionCache(void *start_addr, u32 num_bytes);

static void clearDataAndInstructionCache(void *start_addr, u32 num_bytes) {
    DC_FlushRange(start_addr, num_bytes);
    IC_InvalidateRange(start_addr, num_bytes);
}

u32 Encryptor_CategorizeInstruction(u32 instruction) {
    u8 opcode = instruction >> INS_OPCODE_SHIFT;

    // Branch instruction
    if ((opcode & 0x0E) == 0x0A) {
        // BLX immediate type
        if ((opcode & 0xF0) == 0xF0) {
            return INS_TYPE_BLXIMM;
        }

        // Link bit
        if (opcode & INS_OPCODE_LINKBIT) {
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
            case INS_TYPE_BL: {
                u32 opcode = (*addr & INS_OPCODE_MASK) ^ (INS_OPCODE_LINKBIT << INS_OPCODE_SHIFT);
                u32 operands = ((*addr & INS_OPERANDS_MASK) - ENC_VAL_1) & INS_OPERANDS_MASK;

                *addr = opcode | operands;
            } break;

            case INS_TYPE_B: {
                u32 opcode = (*addr & INS_OPCODE_MASK) ^ (INS_OPCODE_LINKBIT << INS_OPCODE_SHIFT);
                u32 operands = ((*addr & INS_OPERANDS_MASK) - ENC_VAL_2) & INS_OPERANDS_MASK;

                *addr = opcode | operands;
            } break;

            default: {
                u8 *addr_bytes = (u8 *)addr;
                *addr = (addr_bytes[0] ^ ENC_BYTE_A) | ((addr_bytes[1] ^ ENC_BYTE_B) << 8) | ((addr_bytes[2] ^ ENC_BYTE_C) << 16) | ((addr_bytes[3] ^ ENC_BYTE_D) << 24);
            } break;
            }
        }

        clearDataAndInstructionCache((void *)(functions->obfs_addr - ENC_VAL_1), size);
    }
}

void *Encryptor_DecryptFunction(u32 key, u32 func_addr, u32 size) {
    u32 expanded_key[4];
    void *func_ptr;

    // Deobfuscate arguments
    size -= (u32)&BSS + ENC_VAL_1;

    key -= (u32)&BSS + ENC_VAL_1;

    func_ptr = (void *)func_addr;
    func_ptr -= ENC_VAL_1;

    // Derive RC4 key
    expanded_key[0] = ROTL(key, 0) ^ size;
    expanded_key[1] = ROTL(key, 8) ^ size;
    expanded_key[2] = ROTL(key, 16) ^ size;
    expanded_key[3] = ROTL(key, 24) ^ size;

    RC4_InitAndDecryptInstructions(&expanded_key[0], func_ptr, func_ptr, size);
    clearDataAndInstructionCache(func_ptr, size);

    return func_ptr;
}

u32 Encryptor_EncryptFunction(u32 key, u32 func_addr, u32 size) {
    u32 expanded_key[4];
    void *func_ptr;

    // Deobfuscate arguments and change key
    size -= (u32)&BSS + ENC_VAL_1;

    key -= (u32)&BSS + ENC_VAL_1;
    key += func_addr >> 20;

    func_ptr = (void *)func_addr;
    func_ptr -= ENC_VAL_1;

    // Derive RC4 key
    expanded_key[0] = ROTL(key, 0) ^ size;
    expanded_key[1] = ROTL(key, 8) ^ size;
    expanded_key[2] = ROTL(key, 16) ^ size;
    expanded_key[3] = ROTL(key, 24) ^ size;

    RC4_InitAndEncryptInstructions(&expanded_key[0], func_ptr, func_ptr, size);
    clearDataAndInstructionCache(func_ptr, size);

    // Re-obfuscate key
    key += (u32)&BSS + ENC_VAL_1;

    return key;
}
