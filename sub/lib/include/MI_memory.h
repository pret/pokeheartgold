#ifndef NITRO_SUB_MI_MEMORY_H
#define NITRO_SUB_MI_MEMORY_H

#include "nitro/types.h"

void MIi_CpuClear16(register u16 value, register u16 * dst, register u32 size);
void MIi_CpuCopy16(register u16 * src, register u16 * dst, register u32 size);
void MIi_CpuClear32(register u32 value, register u32 * dst, register u32 size);
void MIi_CpuCopy32(register u32 * src, register u32 * dst, register u32 size);
void MIi_CpuClearFast(register u32 value, register u32 * dst, register u32 size);
void MIi_CpuCopyFast(register u32 * src, register u32 * dst, register u32 size);
void MI_CpuFill8(register u8 value, register u8 * dst, register u32 size);
void MI_CpuCopy8(register u8 * src, register u8 * dst, register u32 size);

static inline void MI_CpuFill32(void *dest, u32 data, u32 size)
{
    MIi_CpuClear32(data, dest, size);
}

static inline void MI_CpuClear32(void *dest, u32 size)
{
    MI_CpuFill32(dest, 0, size);
}

static inline void MI_CpuCopy32(void *src, void *dst, u32 size)
{
    MIi_CpuCopy32((u32 *)src, (u32 *)dst, size);
}

#endif //NITRO_SUB_MI_MEMORY_H
