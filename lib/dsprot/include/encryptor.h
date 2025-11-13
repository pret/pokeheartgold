#ifndef DSPROT_ENCRYPTOR_H
#define DSPROT_ENCRYPTOR_H

#include "sdk.h"

typedef struct FuncInfo {
    u32 obfsAddr;
    u32 obfsSize;
} FuncInfo;

typedef enum InsType {
    INS_TYPE_OTHER = 0,
    INS_TYPE_BLXIMM,
    INS_TYPE_BL,
    INS_TYPE_B
} InsType;

InsType Encryptor_CategorizeInstruction(u32 instruction);
void Encryptor_DecodeFunctionTable(FuncInfo *functions);
void *Encryptor_DecryptFunction(u32 key, u32 funcAddr, u32 size);
u32 Encryptor_EncryptFunction(u32 key, u32 funcAddr, u32 size);

#endif // DSPROT_ENCRYPTOR_H
