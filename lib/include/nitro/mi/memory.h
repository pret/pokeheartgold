#ifndef NITRO_MI_MEMORY_H
#define NITRO_MI_MEMORY_H

#include <nitro/types.h>

void MIi_CpuClear16(register u16 value, register u16 * dst, register u32 size);
void MIi_CpuCopy16(const register u16 * src, register u16 * dst, register u32 size);
void MIi_CpuClear32(register u32 value, register u32 * dst, register u32 size);
void MIi_CpuCopy32(const register u32 * src, register u32 * dst, register u32 size);
void MIi_CpuClearFast(register u32 value, register u32 * dst, register u32 size);
void MIi_CpuCopyFast(const register u32 * src, register u32 * dst, register u32 size);
void MI_CpuFill8(void *dest, u8 data, u32 size);
void MI_CpuCopy8(const void * src, void * dst, u32 size);

static inline void MI_CpuCopy16(const void *src, void *dst, u32 size) {
    MIi_CpuCopy16(src, dst, size);
}

static inline void MI_CpuClear16(void *dest, u32 size) {
    MIi_CpuClear16(0, dest, size);
}

static inline void MI_CpuFill16(void *dest, u16 data, u32 size) {
    MIi_CpuClear16(data, dest, size);
}

static inline void MI_CpuFill32(void *dest, u32 data, u32 size) {
    MIi_CpuClear32(data, dest, size);
}

static inline void MI_CpuClear32(void *dest, u32 size) {
    MI_CpuFill32(dest, 0, size);
}

static inline void MI_CpuCopy32(const void *src, void *dst, u32 size) {
    MIi_CpuCopy32((u32 *)src, (u32 *)dst, size);
}

static inline void MI_CpuClearFast(void *dst, u32 size) {
    MIi_CpuClearFast(0, dst, size);
}

static inline void MI_CpuCopyFast(const void *src, void *dst, u32 size) {
    MIi_CpuCopyFast(src, dst, size);
}

static inline void MI_CpuFillFast(void *dst, int data, u32 size) {
    MIi_CpuClearFast(data, dst, size);
}

static inline void MI_CpuClear8(void *dst, u32 size) {
    MI_CpuFill8(dst, 0, size);
}

void MI_Copy36B(const void *pSrc, void *pDst);
void MI_Copy64B(const void *pSrc, void *pDst);

#endif //NITRO_MI_MEMORY_H
