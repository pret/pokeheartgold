#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include "component.h"
#include "compress.h"
#include "digest.h"
#include "global.h"
#include "misc.h"
#include "overlay_table.h"
#include "print.h"
#include "static_module.h"

static int Compress(char *content, int size);
static int LZCompressRV(char *uncompressed, int uncompressedSize, char *compressed, int compressedSize);
static int FindMatched(char *chunk, int chunkSize, char *remainder, int remainderSize, int *optimalRemainderIdx);
static int HowManyMatched(char *buffer1, char *buffer2, int size);
static int CheckOverwrite(int sourceSize, char *compressed, int compressedSize, int *newSourceSize, int *newCompressedSize);

bool CompressOverlayModules(Component *component) {
    OverlayModule *overlayModule = component->overlayModules;
    char *overlayTable = component->overlayTable.table;
    DebugPrintf("Compressing OverlayModules\n");
    if (component->numOverlays == 0 || overlayModule == NULL || overlayTable == NULL) {
        DebugPrintf("No overlay to compress\n");
    } else {
        for (int i = 0; i < component->numOverlays; i++) {
            if ((overlayTable[OT_COMPRESSED_FLAGS_OFFSET] & 1) == 0) {
                if (overlayModule->fileInfo.fileSize < *(uint *)(overlayTable + OT_FILESIZE_OFFSET)) {
                    ErrorPrintf("Overlay module file is shorter than the size reported in the overlay table\n"
                                "FileSize=%d  InOverlayTable=%d\n", overlayModule->fileInfo.fileSize, *(uint *)(overlayTable + OT_FILESIZE_OFFSET));
                    return false;
                }
                int compressResult = Compress(overlayModule->fileInfo.content, *(int *)(overlayTable + OT_FILESIZE_OFFSET));
                if (compressResult < 0) {
                    if (compressResult == -2 || compressResult != -1) return false;

                    printf("OverlayModule[%02d]. Not compressed %9d (enlarged or same size as before)\n", i, overlayModule->fileInfo.fileSize);
                } else {
                    if (compressResult > 0x00ffffff) {
                        ErrorPrintf("Compressed file size too large (over 24bit wide)\n");
                    }
                    printf("OverlayModule[%02d]. Compressed ... %9d -> %9d\n", i, overlayModule->fileInfo.fileSize, compressResult);
                    uint *overlayTableCompressedSize = (uint *)(overlayTable + OT_COMPRESSED_FILESIZE_OFFSET);
                    *overlayTableCompressedSize = (*overlayTableCompressedSize & 0xff000000) | (compressResult & 0x00ffffff);
                    overlayModule->fileInfo.compressedSize = compressResult & 0x00ffffff;
                    overlayModule->fileInfo.compressedSize = compressResult & 0x00ffffff;
                    overlayTable[OT_COMPRESSED_FLAGS_OFFSET] |= 1;
                    overlayModule->fileInfo.rewrite = true;
                    component->overlayTable.fileInfo.rewrite = true;
                }
            } else {
                printf("OverlayModule[%02d]. Already compressed\n", i);
            }
            overlayModule++;
            overlayTable += OVERLAY_ENTRY_SIZE;
        }
    }
    return true;
}

bool CompressStaticModule(Component *component, int headerSize) {
    bool success;

    int staticParamsOffset = *(int *)(component->staticModule.footerContent + 4);
    char *content = component->staticModule.fileInfo.content;
    StaticParams *staticParams = (StaticParams *)(content + staticParamsOffset);
    if (staticParams->compressedStatic == 0 &&
        component->staticModule.fileInfo.compressedSize == 0) {
            if (headerSize < 0) {
              ErrorPrintf("Specified header size is less than 0 (=%d)\n", headerSize);
              success = false;
            } else if (component->staticModule.fileInfo.fileSize < headerSize) {
                printf("StaticModule ..... Not compressed (Module is smaller than the header [%d bytes])\n", headerSize);
                success = true;
            } else {
                int compressResult =
                    Compress(component->staticModule.fileInfo.content + headerSize,
                             component->staticModule.fileInfo.fileSize - headerSize);
                if (compressResult < 0) {
                    if (compressResult == -2 || compressResult != -1) {
                        success = false;
                    } else {
                        printf("StaticModule ..... Not compressed (enlarged or same size as before)\n");
                        success = true;
                    }
                } else {
                    component->staticModule.fileInfo.compressedSize = compressResult + headerSize;
                    printf("StaticModule ..... Compressed ... %9d -> %9d\n",
                           component->staticModule.fileInfo.fileSize, component->staticModule.fileInfo.compressedSize);
                    int *header = (int *)component->overlayDefs.header;
                    header[2] = component->staticModule.fileInfo.compressedSize;
                    staticParams->compressedStatic = component->staticModule.fileInfo.compressedSize + header[0];
                    CopyBuffer(component->staticModule.footerContent,
                               component->staticModule.fileInfo.content + ALIGN_4(component->staticModule.fileInfo.compressedSize),
                               component->staticModule.footerSize);
                    component->overlayDefs.fileInfo.rewrite = true;
                    component->staticModule.fileInfo.rewrite = true;
                    success = true;
                }
            }
    } else {
        printf("StaticModule ..... Already compressed\n");
        success = true;
    }
    return success;
}

bool CalculateHMAC_OverlayModules(Component *component, int digestType, char *digestKey) {
    bool success;

    OverlayModule *overlayModule = component->overlayModules;
    char *overlayTable = component->overlayTable.table;
    int numOverlays = component->numOverlays;
    if (numOverlays == 0 || overlayModule == NULL || overlayTable == NULL) {
        DebugPrintf("No overlay to calculate HMAC\n");
        success = true;
    } else {
        bool initDigestSuccess = Init_Digest(digestType, digestKey);
        if (!initDigestSuccess) {
            ErrorPrintf("Cannot setup digest library\n");
            success = false;
        } else {
            DebugPrintf("Calculating HMAC for OverlayModules\n");
            int digestParamsOffset = *(int *)(component->staticModule.footerContent + STATIC_FOOTER_DIGEST_PARAM_OFFSET);
            char *content = component->staticModule.fileInfo.content;
            char *digestParams = (char *)(content + digestParamsOffset);
            for (int i = 0; i < numOverlays; i++) {
                if ((overlayTable[OT_COMPRESSED_FLAGS_OFFSET] & 2U) != 0) {
                    printf("OverlayModule[%02d]: HMAC already calculated - do it again.\n", i);
                }
                if ((uint)overlayModule->fileInfo.fileSize < *(uint *)(overlayTable + OT_FILESIZE_OFFSET)) {
                    ErrorPrintf("Overlay module file is shorter than the size reported in overlay table\n"
                                "    File size=%d  InOverlayTabe=%d\n", overlayModule->fileInfo.fileSize, *(uint *)(overlayTable + OT_FILESIZE_OFFSET));
                    return false;
                }
                uint overlaySize = *(uint *)(overlayTable + OT_COMPRESSED_FILESIZE_OFFSET) & 0x00ffffff;
                if (overlaySize == 0) {
                    overlaySize = *(uint *)(overlayTable + OT_FILESIZE_OFFSET);
                }

                printf("OverlayModule[%02d]", i);
                Calc_Digest(overlayModule->fileInfo.content, overlaySize, digestParams, false);
                overlayTable[OT_COMPRESSED_FLAGS_OFFSET] |= 2;
                component->staticModule.fileInfo.rewrite = true;
                component->overlayTable.fileInfo.rewrite = true;
                digestParams += DIGEST_HASH_SIZE;
                overlayModule++;
                overlayTable += OVERLAY_ENTRY_SIZE;
            }
            printf("OverlayTable     ");
            Calc_Digest(component->overlayTable.table, numOverlays * OVERLAY_ENTRY_SIZE, content + digestParamsOffset - DIGEST_HASH_SIZE, true);
            success = true;
        }
    }
    return success;
}

static int Compress(char *content, int size) {
    int ret;
    int sourceOffset;
    int compressedOffset;

    char *compressed = malloc(size);
    char *compressedCpy = compressed;
    if (compressed == NULL) {
        ErrorPrintf("Cannot allocate memory size=%d\n", size);
        ret = -2;
    } else if (((size_t)content % 4) == 0)  {
        char *contentCpy = content;
        int sizeCpy = size;
        int compressedSize = size;
        int lzResult = LZCompressRV(content, size, compressed, size);
        if (lzResult < 0) {
            DebugPrintf("Compressed buffer size exceeds original data size.\n");
            free(compressedCpy);
            ret = -1;
        } else {
            compressedSize -= lzResult;
            compressed += lzResult;
            DebugPrintf("1: source size = %d  compressed = %d\n", size, compressedSize);
            int overwriteResult = CheckOverwrite(sizeCpy, compressed, compressedSize, &sourceOffset, &compressedOffset);
            if (overwriteResult == 0) {
                contentCpy += sourceOffset;
                sizeCpy -= sourceOffset;
                compressed += compressedOffset;
                compressedSize -= compressedOffset;
                DebugPrintf("  !! Shrink back Compressed region to avoid overwriting.\n"
                            "  !! Expand non-compressed region = +%d\n"
                            "2: source size = %d  compressed = %d\n", sourceOffset, sizeCpy, compressedSize);
            }
            int compressedEnd = compressedSize + sourceOffset;
            uint compressedEndAligned = ALIGN_4(compressedEnd);
            ret = compressedEndAligned + 8;
            if (ret < size) {
                CopyBuffer(compressed, contentCpy, compressedSize);
                free(compressedCpy);
                for (int i = compressedEnd; i < (int)compressedEndAligned; i++) {
                    content[i] = -1;
                }
                char *contentEnd = content + compressedEndAligned;
                *(uint *)contentEnd = (*(uint *)contentEnd & 0xff000000) | (ret - sourceOffset) & 0xffffff;
                char compressedEndU8 = (char)compressedEnd;
                char retU8 = (char)ret;
                *(contentEnd + 3) = retU8 - compressedEndU8;
                *(int *)(contentEnd + 4) = size - ret;
            } else {
                DebugPrintf("Compressed buffer size exceeds or equals original data size.\n");
                free(compressedCpy);
                ret = -1;
            }
        }
    } else {
        ErrorPrintf("Top of buffer is not aligned by 4.\n");
        ret = -2;
    }
    return ret;
}

static int LZCompressRV(char *uncompressed, int uncompressedSize, char *compressed, int compressedSize) {
    int optimalRemainderIdx;
    ushort optimalRemainderIdx16;
    int bytesLeft = uncompressedSize;
    while (true) {
        if (bytesLeft < 1) return compressedSize;
        if (compressedSize < 1) break;

        uint bitVector = 0;
        int compressedPtr = compressedSize - 1;
        compressedSize = compressedPtr;
        for (int i = 0; i < 8; i++) {
            bitVector <<= 1;
            if (bytesLeft > 0) {
                char *remainder = uncompressed + bytesLeft;
                int bytesRead = uncompressedSize - bytesLeft;
                int chunkSize = MIN(bytesLeft, 0x12);
                char *chunk = remainder - chunkSize;
                bytesRead = MIN(bytesRead, 0x1002);
                int numMatches = FindMatched(chunk, chunkSize, remainder, bytesRead, &optimalRemainderIdx);
                if (numMatches < 3) {
                    if (compressedSize < 1) return -1;

                    compressedSize--;
                    bytesLeft--;
                    compressed[compressedSize] = uncompressed[bytesLeft];
                } else {
                    if (compressedSize < 2) return -1;

                    bytesLeft -= numMatches;
                    optimalRemainderIdx -= 2;
                    optimalRemainderIdx16 = (ushort)optimalRemainderIdx & 0xfff;
                    compressed[compressedSize - 1] =
                        (char)((ushort)(((short)numMatches - 3) * 0x1000) >> 8) | (char)(optimalRemainderIdx16 >> 8);
                    compressedSize -= 2;
                    compressed[compressedSize] = (char)optimalRemainderIdx16;
                    bitVector |= 1;
                }
            }
        }
        compressed[compressedPtr] = (char)bitVector;
    }
    return -1;
}

// `chunk` is a pointer to a section of the uncompressed byte array
// of size `chunkSize`. `remainder` is a pointer to the remainder of the
// byte array of size `remainderSize`.
//
// This function iterates over all the bytes after the chunk to find another
// chunk with the most bytes matching `chunk`. It returns the number of
// byte-wise matches found in the optimal chunk.
//
// `optimalRemainderIdx` points to the end of the optimal chunk.
static int FindMatched(char *chunk, int chunkSize, char *remainder, int remainderSize, int *optimalRemainderIdx) {
    char lastChar = chunk[chunkSize - 1];
    int maxMatches = 0;
    for (int i = 0; i < remainderSize; i++) {
        if (lastChar == remainder[i]) {
            int bufferSize = MIN(i + 1, chunkSize);
            int numMatches = HowManyMatched(chunk + chunkSize - 1, remainder + i, bufferSize);
            if (numMatches > maxMatches) {
                *optimalRemainderIdx = i;
                maxMatches = numMatches;
            }
        }
    }
    return maxMatches;
}

// Returns the number of consecutive bytes that match in both buffers, starting
// from the end of each buffer.
static int HowManyMatched(char *buffer1, char *buffer2, int size) {
    int i = 0;
    for (; i < size && *buffer1 == *buffer2; buffer1--) {
        buffer2--;
        i++;
    }
    return i;
}

static int CheckOverwrite(int sourceSize, char *compressed, int compressedSize, int *sourceOffset, int *compressedOffset) {
    do {
        if (sourceSize < 1) {
            *sourceOffset = 0;
            *compressedOffset = 0;
            return 1;
        }
        compressedSize--;
        uint bitVector = compressed[compressedSize];
        for (int i = 0; i < 8; i++) {
            if (sourceSize > 0) {
                if ((bitVector & 0x80) == 0) {
                    compressedSize--;
                    sourceSize--;
                } else {
                    int nextCompressedSize = compressedSize - 2;
                    sourceSize -= ((byte)compressed[compressedSize - 1] >> 4) + 3;
                    if (sourceSize < 0) {
                        ErrorPrintf("System error in CheckOverwrite???\n");
                        exit(-1);
                    }
                    compressedSize = nextCompressedSize;
                    if (sourceSize < nextCompressedSize) {
                        *sourceOffset = sourceSize;
                        *compressedOffset = compressedSize;
                        return 0;
                    }
                }
                bitVector <<= 1;
            }
        }

    } while (true);
}
