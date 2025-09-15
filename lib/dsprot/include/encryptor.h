#ifndef ENCRYPTOR_H
#define ENCRYPTOR_H

#include "types.h"

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

// Nitro functions
// <nitro/os.h>
extern void DC_FlushRange(const void *start_addr, u32 num_bytes);
extern void IC_InvalidateRange(void *start_addr, u32 num_bytes);

u32 Encryptor_CategorizeInstruction(u32 instruction);
void Encryptor_DecodeFunctionTable(FuncInfo *functions);
void *Encryptor_DecryptFunction(u32 obfs_key, u32 obfs_func_addr, u32 obfs_size);
u32 Encryptor_EncryptFunction(u32 obfs_key, u32 obfs_func_addr, u32 obfs_size);

#endif
