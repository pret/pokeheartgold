#include "rc4.h"

#include "encoding_constants.h"
#include "encryptor.h"

#define RC4_KEY_SIZE (16)

void RC4_Init(RC4_Ctx *ctx, const void *key, u32 key_len) {
    s32 Ki = 0;
    s32 Si = 0;

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
        Si = (Si + ((u8 *)key)[Ki] + tmp1) & 0xFF;
        u8 tmp2 = ctx->S[Si];
        ctx->S[Si] = tmp1;
        ctx->S[i] = tmp2;

        Ki++;
        if (Ki >= key_len) {
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
        sbox[i] = (u8)i ^ 1;
    }

    return 0;
}

u32 RC4_EncryptInstructions(RC4_Ctx *ctx, void *src, void *dst, u32 size) {
    if (size & 3) {
        return -1;
    }

    u8 *src_bytes = (u8 *)src;
    u8 *dst_bytes = (u8 *)dst;

    u8 sbox[256];
    RC4_InitSBox(&sbox[0]);

    for (u32 idx = 0; idx < size; idx += 4) {
        switch (Encryptor_CategorizeInstruction(*(u32 *)(src_bytes + idx))) {
        case INS_TYPE_BLXIMM:
        case INS_TYPE_BL: {
            u32 *src_addr = (u32 *)(src_bytes + idx);
            u32 *dst_addr = (u32 *)(dst_bytes + idx);

            *dst_addr = *src_addr;
            *dst_addr = ((*dst_addr & 0xFF000000) ^ (ENC_OPCODE_1 << 24)) | (((*dst_addr & 0x00FFFFFF) + ENC_VAL_2) & 0x00FFFFFF);
        } break;

        case INS_TYPE_B: {
            u32 *src_addr = (u32 *)(src_bytes + idx);
            u32 *dst_addr = (u32 *)(dst_bytes + idx);

            *dst_addr = *src_addr;
            *dst_addr = ((*dst_addr & 0xFF000000) ^ (ENC_OPCODE_1 << 24)) | (((*dst_addr & 0x00FFFFFF) + ENC_VAL_1) & 0x00FFFFFF);
        } break;

        default:
            dst_bytes[idx] = src_bytes[idx] ^ RC4_Byte(ctx);
            dst_bytes[idx + 1] = src_bytes[idx + 1] ^ RC4_Byte(ctx);
            dst_bytes[idx + 2] = sbox[src_bytes[idx + 2]];
            dst_bytes[idx + 3] = src_bytes[idx + 3];
            break;
        }
    }

    return 0;
}

u32 RC4_DecryptInstructions(RC4_Ctx *ctx, void *src, void *dst, u32 size) {
    if (size & 3) {
        return -1;
    }

    u8 *src_bytes = (u8 *)src;
    u8 *dst_bytes = (u8 *)dst;

    u8 sbox[256];
    RC4_InitSBox(&sbox[0]);

    for (u32 idx = 0; idx < size; idx += 4) {
        switch (Encryptor_CategorizeInstruction(*(u32 *)(src_bytes + idx))) {
        case INS_TYPE_BLXIMM:
        case INS_TYPE_BL: {
            u32 *src_addr = (u32 *)(src_bytes + idx);
            u32 *dst_addr = (u32 *)(dst_bytes + idx);

            *dst_addr = *src_addr;
            *dst_addr = ((*dst_addr & 0xFF000000) ^ (ENC_OPCODE_1 << 24)) | (((*dst_addr & 0x00FFFFFF) - ENC_VAL_1) & 0x00FFFFFF);
        } break;

        case INS_TYPE_B: {
            u32 *src_addr = (u32 *)(src_bytes + idx);
            u32 *dst_addr = (u32 *)(dst_bytes + idx);

            *dst_addr = *src_addr;
            *dst_addr = ((*dst_addr & 0xFF000000) ^ (ENC_OPCODE_1 << 24)) | (((*dst_addr & 0x00FFFFFF) - ENC_VAL_2) & 0x00FFFFFF);
        } break;

        default:
            dst_bytes[idx] = src_bytes[idx] ^ RC4_Byte(ctx);
            dst_bytes[idx + 1] = src_bytes[idx + 1] ^ RC4_Byte(ctx);
            dst_bytes[idx + 2] = sbox[src_bytes[idx + 2]];
            dst_bytes[idx + 3] = src_bytes[idx + 3];
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
