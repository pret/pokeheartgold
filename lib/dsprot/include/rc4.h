#ifndef DSPROT_RC4_H
#define DSPROT_RC4_H

#include "sdk.h"

#define RC4_KEY_SIZE (16)

typedef struct RC4_Ctx {
    int i;
    int j;
    u8 S[256];
} RC4_Ctx;

// Functions to be encoded (cannot be static)
void RC4_Init(RC4_Ctx *ctx, const void *key, u32 keyLen);
u8 RC4_Byte(RC4_Ctx *ctx);
u32 RC4_InitSBox(u8 *sbox);
u32 RC4_EncryptInstructions(RC4_Ctx *ctx, void *src, void *dst, u32 size);
u32 RC4_DecryptInstructions(RC4_Ctx *ctx, void *src, void *dst, u32 size);

u32 RC4_InitAndEncryptInstructions(void *key, void *dst, void *src, u32 size);
u32 RC4_InitAndDecryptInstructions(void *key, void *dst, void *src, u32 size);

#endif // DSPROT_RC4_H
