#ifndef NITRO_MI_UNCOMPRESS_H_
#define NITRO_MI_UNCOMPRESS_H_

typedef struct {
    u16 srcNum;
    u16 srcBitNum:8;
    u16 destBitNum:8;
    u32 destOffset:31;
    u32 destOffset0_on:1;
} MIUnpackBitsParam;

void MI_UncompressLZ8(const void *srcp, void *destp);

static inline u32 MI_GetUncompressedSize(const void *srcp) {
    return (*(u32 *)srcp >> 8);
}

#endif //NITRO_MI_UNCOMPRESS_H_
