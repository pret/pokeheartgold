#ifndef ENCRYPTOR_H
#define ENCRYPTOR_H

#include "types.h"

typedef struct {
    void* start_addr;
    u32 size;
} FuncInfo;

// Nitro functions
// <nitro/os.h>
extern void DC_FlushRange(const void* start_addr, u32 num_bytes);
extern void IC_InvalidateRange(void* start_addr, u32 num_bytes);

u32 Encryptor_CategorizeInstruction(u32 instruction);
void Encryptor_DecodeFunctionTable(FuncInfo* functions);
void* Encryptor_DecryptFunction(u32 obfs_key, void* obfs_func_addr, u32 obfs_size);
u32 Encryptor_EncryptFunction(u32 obfs_key, void* obfs_func_addr, u32 obfs_size);

#endif
