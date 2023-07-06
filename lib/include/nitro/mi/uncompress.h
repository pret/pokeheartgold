#ifndef NITRO_MI_UNCOMPRESS_H_
#define NITRO_MI_UNCOMPRESS_H_

void MI_UncompressLZ8(const void *srcp, void *destp);

inline u32 MI_GetUncompressedSize(const void *srcp) {
    return (*(u32 *)srcp >> 8);
}

#endif //NITRO_MI_UNCOMPRESS_H_
