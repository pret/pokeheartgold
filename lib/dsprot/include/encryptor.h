#ifndef ENCRYPTOR_H
#define ENCRYPTOR_H

#include "nitro_types.h"

typedef struct {
    u32 obfs_addr;
    u32 obfs_size;
} FuncInfo;

enum {
    INS_TYPE_OTHER = 0,
    INS_TYPE_BLXIMM,
    INS_TYPE_BL,
    INS_TYPE_B
};

u32 Encryptor_CategorizeInstruction(u32 instruction);
void Encryptor_DecodeFunctionTable(FuncInfo *functions);
void *Encryptor_DecryptFunction(u32 key, u32 func_addr, u32 size);
u32 Encryptor_EncryptFunction(u32 key, u32 func_addr, u32 size);

#endif
