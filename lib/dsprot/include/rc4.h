#ifndef RC4_H
#define RC4_H

#include "types.h"

typedef struct {
    int i;
    int j;
    u8 S[256];
} RC4_Ctx;

void RC4_Init(RC4_Ctx* ctx, const void* key, u32 key_len);
u8 RC4_Byte(RC4_Ctx* ctx);
u32 RC4_InitSBox(u8* sbox);
u32 RC4_EncryptInstructions(RC4_Ctx* ctx, void* src, void* dst, u32 size);
u32 RC4_DecryptInstructions(RC4_Ctx* ctx, void* src, void* dst, u32 size);
u32 RC4_InitAndEncryptInstructions(void* key, void* dst, void* src, u32 size);
u32 RC4_InitAndDecryptInstructions(void* key, void* dst, void* src, u32 size);

#endif
