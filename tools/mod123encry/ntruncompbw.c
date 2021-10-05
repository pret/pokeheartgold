#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "ntruncompbw.h"

static inline uint32_t READ32(const unsigned char * ptr)
{
    return ptr[0] | (ptr[1] << 8) | (ptr[2] << 16) | (ptr[3] << 24);
}

uint32_t MIi_UncompressBackwards(unsigned char ** out_p, size_t compsize)
{
    unsigned char * out = *out_p;

    // Read the pointer to the end of the compressed image
    uint8_t * endptr = out + compsize - 8;
    uint32_t size = READ32(endptr);
    uint32_t offset = READ32(endptr + 4);
    out = realloc(out, compsize + offset);
    if (out == NULL)
        return -1u;
    endptr = out + compsize;
    uint8_t * dest_p = endptr + offset;
    uint8_t * end = endptr - ((uint8_t)(size >> 24));
    uint8_t * start = endptr - (size & ~0xFF000000);
    while (dest_p > end && end > start) {
        uint8_t r5 = *--end;
        for (int i = 0; i < 8; i++) {
            if ((r5 & 0x80) == 0)
                *--dest_p = *--end;
            else {
                int ip = *--end;
                int r7 = *--end;


                r7 = ((r7 | (ip << 8)) & ~0xF000) + 2;
                ip += 0x20;
                while (ip >= 0) {
                    dest_p[-1] = dest_p[r7];
                    dest_p--;
                    ip -= 0x10;
                }
            }
            if (end <= start)
                break;
                r5 <<= 1;
        }
    }
    *out_p = out;
    return compsize + offset;
}
