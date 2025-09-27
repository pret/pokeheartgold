#ifndef RC4_H
#define RC4_H

#include "nitro_types.h"

u32 RC4_InitAndEncryptInstructions(void *key, void *dst, void *src, u32 size);
u32 RC4_InitAndDecryptInstructions(void *key, void *dst, void *src, u32 size);

#endif
