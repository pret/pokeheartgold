#include "rc4.h"

#include "encryptor.h"
#include "encoding_constants.h"


void RC4_Init(RC4_Ctx* ctx, const void* key, u32 key_len) {
    u8   tmp1;
    u8   tmp2;
    int  Ki;
    int  Si;
    int  i;
    int  j;

    Ki = 0;
    Si = 0;
    ctx->i = 0;
    ctx->j = 0;

    for (j = 0; j < 256; j++) {
        ctx->S[j] = j;
    }

    // Modification to RC4: i = 255 -> 0, instead of 0 -> 255
    for (i = 255; i >= 0; i--) {
        tmp1 = ctx->S[i];
        Si = (Si + ((u8*)key)[Ki] + tmp1) & 0xFF;
        tmp2 = ctx->S[Si];
        ctx->S[Si] = tmp1;
        ctx->S[i] = tmp2;

        Ki++;
        if (Ki >= key_len) {
            Ki = 0;
        }
    }
}


u8 RC4_Byte(RC4_Ctx* ctx) {
    u8   i;
    u8*  S;
    u8   jval;
    u8   ival;
    u8   j;
    u8   out_idx;

    i = ctx->i + 1;

    S = ctx->S;

    ival = S[i];
    j = ival + ctx->j;
    jval = S[j];

    ctx->i = i;
    ctx->j = j;

    S[j] = ival;
    S[i] = jval;

    out_idx = ival + jval;
    return ctx->S[out_idx];
}


u32 RC4_InitSBox(u8* sbox) {
    int  i;
    int  x;
    for (i = 0; i < 256; i++) {
        x = i & 0xFF;
        sbox[i] = x ^ 1;
    }

    return 0;
}


u32 RC4_EncryptInstructions(RC4_Ctx* ctx, void* src, void* dst, u32 size) {
    u8   sbox[256];
    u8*  src_bytes;
    u8*  dst_bytes;
    u32  idx;

    if (size & 3) {
        return -1;
    }

    src_bytes = (u8*)src;
    dst_bytes = (u8*)dst;

    RC4_InitSBox(&sbox[0]);

    for (idx = 0; idx < size; idx += 4) {
        switch (Encryptor_CategorizeInstruction(*(u32*)(src_bytes + idx))) {
            case 1:
            case 2:
                *(u32*)(dst + idx) = *(u32*)(src_bytes + idx);
                *(u32*)(dst + idx) = ((*(u32*)(dst + idx) & 0xFF000000) ^ (ENC_OPCODE_1 << 24)) |
                                     (((*(u32*)(dst + idx) & 0x00FFFFFF) + ENC_VAL_2) & 0x00FFFFFF);
                break;

            case 3:
                *(u32*)(dst + idx) = *(u32*)(src_bytes + idx);
                *(u32*)(dst + idx) = ((*(u32*)(dst + idx) & 0xFF000000) ^ (ENC_OPCODE_1 << 24)) |
                                     (((*(u32*)(dst + idx) & 0x00FFFFFF) + ENC_VAL_1) & 0x00FFFFFF);
                break;

            default:
                dst_bytes[idx]   = src_bytes[idx]   ^ RC4_Byte(ctx);
                dst_bytes[idx+1] = src_bytes[idx+1] ^ RC4_Byte(ctx);
                dst_bytes[idx+2] = sbox[ src_bytes[idx+2] ];
                dst_bytes[idx+3] = src_bytes[idx+3];
                break;
        }
    }

    return 0;
}


u32 RC4_DecryptInstructions(RC4_Ctx* ctx, void* src, void* dst, u32 size) {
    u8   sbox[256];
    u8*  src_bytes;
    u8*  dst_bytes;
    u32  idx;

    if (size & 3) {
        return -1;
    }

    src_bytes = (u8*)src;
    dst_bytes = (u8*)dst;

    RC4_InitSBox(&sbox[0]);

    for (idx = 0; idx < size; idx += 4) {
        switch (Encryptor_CategorizeInstruction(*(u32*)(src_bytes + idx))) {
            case 1:
            case 2:
                *(u32*)(dst + idx) = *(u32*)(src_bytes + idx);
                *(u32*)(dst + idx) = ((*(u32*)(dst + idx) & 0xFF000000) ^ (ENC_OPCODE_1 << 24)) |
                                     (((*(u32*)(dst + idx) & 0x00FFFFFF) - ENC_VAL_1) & 0x00FFFFFF);
                break;

            case 3:
                *(u32*)(dst + idx) = *(u32*)(src_bytes + idx);
                *(u32*)(dst + idx) = ((*(u32*)(dst + idx) & 0xFF000000) ^ (ENC_OPCODE_1 << 24)) |
                                     (((*(u32*)(dst + idx) & 0x00FFFFFF) - ENC_VAL_2) & 0x00FFFFFF);
                break;

            default:
                dst_bytes[idx]   = src_bytes[idx]   ^ RC4_Byte(ctx);
                dst_bytes[idx+1] = src_bytes[idx+1] ^ RC4_Byte(ctx);
                dst_bytes[idx+2] = sbox[ src_bytes[idx+2] ];
                dst_bytes[idx+3] = src_bytes[idx+3];
                break;
        }
    }

    return 0;
}


u32 RC4_InitAndEncryptInstructions(void* key, void* dst, void* src, u32 size) {
    RC4_Ctx ctx;
    RC4_Init(&ctx, key, 16);
    // Must coerce output to -1 or 0 like this to match
    return RC4_EncryptInstructions(&ctx, dst, src, size) == -1 ? -1 : 0;
}


u32 RC4_InitAndDecryptInstructions(void* key, void* dst, void* src, u32 size) {
    RC4_Ctx ctx;
    RC4_Init(&ctx, key, 16);
    // Must coerce output to -1 or 0 like this to match
    return RC4_DecryptInstructions(&ctx, dst, src, size) == -1 ? -1 : 0;
}
