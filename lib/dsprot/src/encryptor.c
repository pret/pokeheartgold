#include "encryptor.h"

#include "bss.h"
#include "encoding_constants.h"
#include "rc4.h"

#define ROTL(x, a) ((a) == 0 ? (x) : (((x) << (a)) | ((x) >> (32 - (a)))))

static void clearDataAndInstructionCache(void *startAddr, u32 numBytes);

static void clearDataAndInstructionCache(void *startAddr, u32 numBytes) {
    DC_FlushRange(startAddr, numBytes);
    IC_InvalidateRange(startAddr, numBytes);
}

InsType Encryptor_CategorizeInstruction(u32 instruction) {
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

    for (; functions->obfsAddr != 0; functions++) {
        u32 *addr = (u32 *)functions->obfsAddr;
        u32 size = functions->obfsSize - (u32)&DSProt_BSS - ENC_VAL_1;

        if (addr == NULL) {
            break;
        }

        addr = (void *)addr - ENC_VAL_1;
        u32 *endAddr = addr + (size / 4);

        for (; addr < endAddr; addr++) {
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
                u8 *addrBytes = (u8 *)addr;
                *addr = (addrBytes[0] ^ ENC_BYTE_A) | ((addrBytes[1] ^ ENC_BYTE_B) << 8) | ((addrBytes[2] ^ ENC_BYTE_C) << 16) | ((addrBytes[3] ^ ENC_BYTE_D) << 24);
            } break;
            }
        }

        clearDataAndInstructionCache((void *)(functions->obfsAddr - ENC_VAL_1), size);
    }
}

static inline void expandRC4Key(u32 seedKey, u32 size, u32 *expandedKey) {
    expandedKey[0] = ROTL(seedKey, 0) ^ size;
    expandedKey[1] = ROTL(seedKey, 8) ^ size;
    expandedKey[2] = ROTL(seedKey, 16) ^ size;
    expandedKey[3] = ROTL(seedKey, 24) ^ size;
}

void *Encryptor_DecryptFunction(u32 key, u32 funcAddr, u32 size) {
    // Deobfuscate arguments
    size -= (u32)&DSProt_BSS + ENC_VAL_1;

    key -= (u32)&DSProt_BSS + ENC_VAL_1;

    void *funcPtr = (void *)funcAddr;
    funcPtr -= ENC_VAL_1;

    u32 expandedKey[4];
    expandRC4Key(key, size, &expandedKey[0]);
    RC4_InitAndDecryptInstructions(&expandedKey[0], funcPtr, funcPtr, size);
    clearDataAndInstructionCache(funcPtr, size);

    return funcPtr;
}

u32 Encryptor_EncryptFunction(u32 key, u32 funcAddr, u32 size) {
    // Deobfuscate arguments and change key
    size -= (u32)&DSProt_BSS + ENC_VAL_1;

    key -= (u32)&DSProt_BSS + ENC_VAL_1;
    key += funcAddr >> 20;

    void *funcPtr = (void *)funcAddr;
    funcPtr -= ENC_VAL_1;

    u32 expandedKey[4];
    expandRC4Key(key, size, &expandedKey[0]);
    RC4_InitAndEncryptInstructions(&expandedKey[0], funcPtr, funcPtr, size);
    clearDataAndInstructionCache(funcPtr, size);

    // Re-obfuscate key
    key += (u32)&DSProt_BSS + ENC_VAL_1;

    return key;
}
