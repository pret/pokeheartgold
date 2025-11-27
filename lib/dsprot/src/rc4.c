#include "rc4.h"

#include "encoding_constants.h"
#include "encryptor.h"

void RC4_Init(RC4_Ctx *ctx, const void *key, u32 keyLen) {
    s32 Ki = 0;
    u8 Si = 0;

    ctx->i = 0;
    ctx->j = 0;

    int i;
    int j;
    for (j = 0; j < 256; j++) {
        ctx->S[j] = j;
    }

    // Modification to RC4: i = 255 -> 0, instead of 0 -> 255
    for (i = 255; i >= 0; i--) {
        u8 tmp1 = ctx->S[i];
        Si = Si + ((u8 *)key)[Ki] + tmp1;
        u8 tmp2 = ctx->S[Si];

        ctx->S[Si] = tmp1;
        ctx->S[i] = tmp2;

        Ki++;
        if (Ki >= keyLen) {
            Ki = 0;
        }
    }
}

u8 RC4_Byte(RC4_Ctx *ctx) {
    u8 i = ctx->i + 1;
    u8 ival = ctx->S[i];
    u8 j = ival + ctx->j;
    u8 jval = ctx->S[j];

    ctx->i = i;
    ctx->j = j;

    ctx->S[j] = ival;
    ctx->S[i] = jval;

    return ctx->S[(ival + jval) & 0xFF];
}

u32 RC4_InitSBox(u8 *sbox) {
    for (s32 i = 0; i < 256; i++) {
        sbox[i] = (u8)i ^ ENC_SBOX_XOR;
    }

    return 0;
}

u32 RC4_EncryptInstructions(RC4_Ctx *ctx, void *src, void *dst, u32 size) {
    if (size & 3) {
        return -1;
    }

    u8 *srcBytes = (u8 *)src;
    u8 *dstBytes = (u8 *)dst;

    u8 sbox[256];
    RC4_InitSBox(&sbox[0]);

    for (u32 offset = 0; offset < size; offset += 4) {
        switch (Encryptor_CategorizeInstruction(*(u32 *)(srcBytes + offset))) {
        case INS_TYPE_BLXIMM:
        case INS_TYPE_BL: {
            u32 *srcAddr = (u32 *)(srcBytes + offset);
            u32 *dstAddr = (u32 *)(dstBytes + offset);

            *dstAddr = *srcAddr;

            u32 opcode = (*dstAddr & INS_OPCODE_MASK) ^ (INS_OPCODE_LINKBIT << INS_OPCODE_SHIFT);
            u32 operands = ((*dstAddr & INS_OPERANDS_MASK) + ENC_VAL_2) & INS_OPERANDS_MASK;

            *dstAddr = opcode | operands;
        }
        break;

        case INS_TYPE_B: {
            u32 *srcAddr = (u32 *)(srcBytes + offset);
            u32 *dstAddr = (u32 *)(dstBytes + offset);

            *dstAddr = *srcAddr;

            u32 opcode = (*dstAddr & INS_OPCODE_MASK) ^ (INS_OPCODE_LINKBIT << INS_OPCODE_SHIFT);
            u32 operands = ((*dstAddr & INS_OPERANDS_MASK) + ENC_VAL_1) & INS_OPERANDS_MASK;

            *dstAddr = opcode | operands;
        }
        break;

        default:
            dstBytes[offset] = srcBytes[offset] ^ RC4_Byte(ctx);
            dstBytes[offset + 1] = srcBytes[offset + 1] ^ RC4_Byte(ctx);
            dstBytes[offset + 2] = sbox[srcBytes[offset + 2]];
            dstBytes[offset + 3] = srcBytes[offset + 3];
            break;
        }
    }

    return 0;
}

u32 RC4_DecryptInstructions(RC4_Ctx *ctx, void *src, void *dst, u32 size) {
    if (size & 3) {
        return -1;
    }

    u8 *srcBytes = (u8 *)src;
    u8 *dstBytes = (u8 *)dst;

    u8 sbox[256];
    RC4_InitSBox(&sbox[0]);

    for (u32 offset = 0; offset < size; offset += 4) {
        switch (Encryptor_CategorizeInstruction(*(u32 *)(srcBytes + offset))) {
        case INS_TYPE_BLXIMM:
        case INS_TYPE_BL: {
            u32 *srcAddr = (u32 *)(srcBytes + offset);
            u32 *dstAddr = (u32 *)(dstBytes + offset);

            *dstAddr = *srcAddr;

            u32 opcode = (*dstAddr & INS_OPCODE_MASK) ^ (INS_OPCODE_LINKBIT << INS_OPCODE_SHIFT);
            u32 operands = ((*dstAddr & INS_OPERANDS_MASK) - ENC_VAL_1) & INS_OPERANDS_MASK;

            *dstAddr = opcode | operands;
        }
        break;

        case INS_TYPE_B: {
            u32 *srcAddr = (u32 *)(srcBytes + offset);
            u32 *dstAddr = (u32 *)(dstBytes + offset);

            *dstAddr = *srcAddr;

            u32 opcode = (*dstAddr & INS_OPCODE_MASK) ^ (INS_OPCODE_LINKBIT << INS_OPCODE_SHIFT);
            u32 operands = ((*dstAddr & INS_OPERANDS_MASK) - ENC_VAL_2) & INS_OPERANDS_MASK;

            *dstAddr = opcode | operands;
        }
        break;

        default:
            dstBytes[offset] = srcBytes[offset] ^ RC4_Byte(ctx);
            dstBytes[offset + 1] = srcBytes[offset + 1] ^ RC4_Byte(ctx);
            dstBytes[offset + 2] = sbox[srcBytes[offset + 2]];
            dstBytes[offset + 3] = srcBytes[offset + 3];
            break;
        }
    }

    return 0;
}

u32 RC4_InitAndEncryptInstructions(void *key, void *dst, void *src, u32 size) {
    RC4_Ctx ctx;
    RC4_Init(&ctx, key, RC4_KEY_SIZE);
    // Must coerce output to -1 or 0 like this to match
    return RC4_EncryptInstructions(&ctx, dst, src, size) == -1 ? -1 : 0;
}

u32 RC4_InitAndDecryptInstructions(void *key, void *dst, void *src, u32 size) {
    RC4_Ctx ctx;
    RC4_Init(&ctx, key, RC4_KEY_SIZE);
    // Must coerce output to -1 or 0 like this to match
    return RC4_DecryptInstructions(&ctx, dst, src, size) == -1 ? -1 : 0;
}
