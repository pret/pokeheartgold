// Copyright (c) 2015 YamaArashi

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "global.h"
#include "lz.h"

static inline int getBlockSize(unsigned char *src, int *srcPos, int extFormat) {
    int blockSize = (src[*srcPos] >> 4);
    if (!extFormat) {
        blockSize += 3;
    } else {
        if (blockSize > 1) {
            blockSize += 1;
        } else {
            int isWide = (blockSize == 1 ? 1 : 0);
            blockSize = (src[(*srcPos)++] & 0xF) << 4;
            if (isWide) {
                blockSize = (blockSize << 8) + (src[(*srcPos)++] << 4) + 0x100;
            }
            blockSize += 0x11 + (src[*srcPos] >> 4);
        }
    }
    return blockSize;
}

unsigned char *LZDecompress(unsigned char *src, int srcSize, int *uncompressedSize)
{
    if (srcSize < 4)
        goto fail;

    if ((src[0] & 0xF0) != 0x10) {
        goto fail;
    }

    int destSize = (src[3] << 16) | (src[2] << 8) | src[1];

    unsigned char *dest = malloc(destSize);

    if (dest == NULL)
        goto fail;

    int srcPos = 4;
    int destPos = 0;

    int extFormat = src[0] & 0xF ? 1 : 0;

    for (;;) {
        if (srcPos >= srcSize)
            goto fail;

        unsigned char flags = src[srcPos++];

        for (int i = 0; i < 8; i++) {
            if (flags & 0x80) {
                if (srcPos + 1 >= srcSize)
                    goto fail;

                int blockSize = getBlockSize(src, &srcPos, extFormat);
                int blockDistance = (((src[srcPos] & 0xF) << 8) | src[srcPos + 1]) + 1;

                srcPos += 2;

                int blockPos = destPos - blockDistance;

                // Some Ruby/Sapphire tilesets overflow.
                if (destPos + blockSize > destSize) {
                    blockSize = destSize - destPos;
                    fprintf(stderr, "Destination buffer overflow.\n");
                }

                if (blockPos < 0)
                    goto fail;

                for (int j = 0; j < blockSize; j++)
                    dest[destPos++] = dest[blockPos + j];
            } else {
                if (srcPos >= srcSize || destPos >= destSize)
                    goto fail;

                dest[destPos++] = src[srcPos++];
            }

            if (destPos == destSize) {
                *uncompressedSize = destSize;
                return dest;
            }

            flags <<= 1;
        }
    }

fail:
    FATAL_ERROR("Fatal error while decompressing LZ file.\n");
}

static void FindBestBlockForwards(unsigned char *src, int srcPos, int srcSize, const int minDistance, int *outBestBlockDistance, int *outBestBlockSize, bool extFormat)
{
    int blockStart = srcPos < 0x1000 ? 0 : srcPos - 0x1000;
    int maxBlockSize = extFormat ? 0xF210 : 18;

    while (blockStart != srcPos) {
        int blockSize = 0;

        while (blockSize < maxBlockSize
            && srcPos + blockSize < srcSize
            && src[blockStart + blockSize] == src[srcPos + blockSize])
            blockSize++;

        if (blockSize > *outBestBlockSize
            && srcPos - blockStart >= minDistance) {
            *outBestBlockDistance = srcPos - blockStart;
            *outBestBlockSize = blockSize;

            if (blockSize == maxBlockSize)
                break;
        }

        blockStart++;
    }
}

static void FindBestBlockBackwards(unsigned char *src, int srcPos, int srcSize, const int minDistance, int *outBestBlockDistance, int *outBestBlockSize, bool extFormat) {
    int blockDistance = minDistance;
    int maxBlockSize = extFormat ? 0xF210 : 18;

    while (blockDistance <= srcPos && blockDistance <= 0x1000) {
        int blockStart = srcPos - blockDistance;
        int blockSize = 0;

        while (blockSize < maxBlockSize
            && srcPos + blockSize < srcSize
            && src[blockStart + blockSize] == src[srcPos + blockSize])
            blockSize++;

        if (blockSize > *outBestBlockSize) {
            *outBestBlockDistance = blockDistance;
            *outBestBlockSize = blockSize;

            if (blockSize == maxBlockSize)
                break;
        }

        blockDistance++;
    }
}

typedef void (*FindBestBlockFunc)(unsigned char *src, int srcPos, int srcSize, const int minDistance, int *outBestBlockDistance, int *outBestBlockSize, bool extFormat);

unsigned char *LZCompress(unsigned char *src, int srcSize, int *compressedSize, const int minDistance, bool forwardIteration, bool pad, bool extFormat) {
    if (srcSize <= 0)
        goto fail;

    int worstCaseDestSize = 4 + srcSize + ((srcSize + 7) / 8);

    // Round up to the next multiple of four.
    worstCaseDestSize = (worstCaseDestSize + 3) & ~3;

    unsigned char *dest = malloc(worstCaseDestSize);

    if (dest == NULL)
        goto fail;

    // header
    dest[0] = 0x10 | extFormat; // LZ compression type
    dest[1] = (unsigned char)srcSize;
    dest[2] = (unsigned char)(srcSize >> 8);
    dest[3] = (unsigned char)(srcSize >> 16);

    int srcPos = 0;
    int destPos = 4;
    FindBestBlockFunc FindBestBlock = forwardIteration ? FindBestBlockForwards : FindBestBlockBackwards;

    for (;;) {
        unsigned char *flags = &dest[destPos++];
        *flags = 0;

        for (int i = 0; i < 8; i++) {
            int bestBlockDistance = 0;
            int bestBlockSize = 0;

            FindBestBlock(src, srcPos, srcSize, minDistance, &bestBlockDistance, &bestBlockSize, extFormat);

            if (extFormat) {
                if (bestBlockSize >= 272) {
                    *flags |= (0x80 >> i);
                    srcPos += bestBlockSize;
                    bestBlockSize -= 273;
                    bestBlockDistance--;
                    dest[destPos++] = ((bestBlockSize >> 12) & 0xF) | 0x10;
                    dest[destPos++] = bestBlockSize >> 4;
                    dest[destPos++] = (bestBlockSize << 4) | ((unsigned int)bestBlockDistance >> 8);
                    dest[destPos++] = (unsigned char)bestBlockDistance;
                } else if (bestBlockSize >= 17) {
                    *flags |= (0x80 >> i);
                    srcPos += bestBlockSize;
                    bestBlockSize -= 17;
                    bestBlockDistance--;
                    dest[destPos++] = (bestBlockSize >> 4) & 0xF;
                    dest[destPos++] = (bestBlockSize << 4) | ((unsigned int)bestBlockDistance >> 8);
                    dest[destPos++] = (unsigned char)bestBlockDistance;
                } else if (bestBlockSize >= 3) {
                    *flags |= (0x80 >> i);
                    srcPos += bestBlockSize;
                    bestBlockSize -= 1;
                    bestBlockDistance--;
                    dest[destPos++] = (bestBlockSize << 4) | ((unsigned int)bestBlockDistance >> 8);
                    dest[destPos++] = (unsigned char)bestBlockDistance;
                } else {
                    dest[destPos++] = src[srcPos++];
                }
            } else {
                if (bestBlockSize >= 3) {
                    *flags |= (0x80 >> i);
                    srcPos += bestBlockSize;
                    bestBlockSize -= 3;
                    bestBlockDistance--;
                    dest[destPos++] = (bestBlockSize << 4) | ((unsigned int)bestBlockDistance >> 8);
                    dest[destPos++] = (unsigned char)bestBlockDistance;
                } else {
                    dest[destPos++] = src[srcPos++];
                }
            }

            if (srcPos == srcSize) {
                if (pad) {
                    // Pad to multiple of 4 bytes.
                    int remainder = destPos % 4;

                    if (remainder != 0) {
                        for (int i = 0; i < 4 - remainder; i++) {
                            dest[destPos++] = 0;
                        }
                    }
                }

                *compressedSize = destPos;
                return dest;
            }
        }
    }

fail:
    FATAL_ERROR("Fatal error while compressing LZ file.\n");
}
