#include "global.h"
#include "unk_02013FDC.h"
#include "unk_02007FD8.h"
#include "constants/species.h"

// decomp temp
#ifdef static
#undef static
#endif
#define static

static void sub_02013FDC(const u8 *src, u8 *dest, int *pSrcOffset, int *pDestOffset, u32 destBlockSize, u32 srcBlockSize);
static void sub_0201401C(NarcId narcId, s32 fileId, HeapID heapId, NNSG2dCharacterData **pCharData);
static void sub_02014050(int x, int y, int width, int height, NNSG2dCharacterData *pCharData, void *dest);
static BOOL sub_020140E8(int species);
static void sub_02014128(NarcId narcId, s32 fileId, HeapID heapId, int x, int y, int width, int height, void *dest, u32 pid, BOOL isAnimated, int whichFacing, int species);
static void *sub_02014178(NarcId narcId, s32 fileId, HeapID heapId, int x, int y, int width, int height, u32 pid, BOOL isAnimated, int whichFacing, int species);
static void sub_020142D4(int srcWidth, int a1, int x, int y, int width, int height, int *pDstOffset, const void *src, void *dest);
static void sub_02014350(int srcWidth, int a1, const UnkStruct_02014E30 *template, int *pDstOffset, const void *src, void *dest);

extern const int _020F5F44[2];

static void sub_02013FDC(const u8 *src, u8 *dest, int *pSrcOffset, int *pDestOffset, u32 destBlockSize, u32 srcBlockSize) {
    for (int i = 0; i < 8; ++i) {
        memcpy(dest + *pDestOffset, src + *pSrcOffset, destBlockSize);
        *pSrcOffset += srcBlockSize;
        *pDestOffset += destBlockSize;
    }
}

static void sub_0201401C(NarcId narcId, s32 fileId, HeapID heapId, NNSG2dCharacterData **pCharData) {
    BOOL result;
    void *pRaw = AllocAndReadWholeNarcMemberByIdPair(narcId, fileId, heapId);
    GF_ASSERT(pRaw != NULL);
    result = NNS_G2dGetUnpackedCharacterData(pRaw, pCharData);
    GF_ASSERT(pCharData != NULL);
    GF_ASSERT(result);
    FreeToHeap(pRaw);
}

static void sub_02014050(int x, int y, int width, int height, NNSG2dCharacterData *pCharData, void *dest) {
    int srcOffset;
    int dstOffset;
    const u8 *srcu8;
    u8 *dstu8;
    int srcBlockSize;

    GF_ASSERT(pCharData->W >= x + width);
    GF_ASSERT(pCharData->H >= y + height);

    srcu8 = pCharData->pRawData;
    dstu8 = dest;
    srcBlockSize = pCharData->W * 4;
    srcOffset = 4 * x + y * srcBlockSize;
    dstOffset = 0;

    for (int i = y; i < y + height; ++i) {
        for (int j = x; j < x + width; ++j) {
            srcOffset = j * 4 + i * srcBlockSize * 8;
            sub_02013FDC(srcu8, dstu8, &srcOffset, &dstOffset, 4, srcBlockSize);
        }
    }
}

static BOOL sub_020140E8(int species) {
    // This function is held together with scotch tape and rubber bands.
    int horribleArray[2];
    ARRAY_ASSIGN(horribleArray, _020F5F44);  // { SPECIES_SPINDA, SPECIES_BAD_EGG }
    for (int i = 0; i < SPECIES_BAD_EGG; ++i) {
        int test = horribleArray[i];
        if (test == SPECIES_BAD_EGG) {
            break;
        }
        if (test == species) {
            return TRUE;
        }
    }
    return FALSE;
}

static void sub_02014128(NarcId narcId, s32 fileId, HeapID heapId, int x, int y, int width, int height, void *dest, u32 pid, BOOL isAnimated, int whichFacing, int species) {
    NNSG2dCharacterData *ppCharData = NULL;
    sub_0201401C(narcId, fileId, heapId, &ppCharData);
    sub_02009D28(ppCharData->pRawData, narcId);
    BOOL isSpinda = sub_020140E8(species);
    if (whichFacing == 2 && isSpinda == TRUE) {
        sub_02009B60(ppCharData->pRawData, pid, isAnimated);
    }
    sub_02014050(x, y, width, height, ppCharData, dest);
}

static void *sub_02014178(NarcId narcId, s32 fileId, HeapID heapId, int x, int y, int width, int height, u32 pid, BOOL isAnimated, int whichFacing, int species) {
    void *ret = AllocFromHeap(heapId, width * height * 32);
    sub_02014128(narcId, fileId, heapId, x, y, width, height, ret, pid, isAnimated, whichFacing, species);
    return ret;
}

void sub_020141C4(NarcId narcId, s32 fileId, HeapID heapId, int x, int y, int width, int height, void *dest) {
    NNSG2dCharacterData *ppCharData = NULL;
    int srcOffset;
    int dstOffset;
    void *pNcgrFile = AllocAndReadWholeNarcMemberByIdPair(narcId, fileId, heapId);
    u8 *srcu8;
    u8 *dstu8;
    int srcWidth;

    GF_ASSERT(pNcgrFile != NULL);
    GF_ASSERT(NNS_G2dGetUnpackedCharacterData(pNcgrFile, &ppCharData));
    GF_ASSERT(ppCharData->W >= x + width);
    GF_ASSERT(ppCharData->H >= y + height);

    srcu8 = ppCharData->pRawData;
    sub_02009D28(srcu8, narcId);
    dstu8 = dest;
    srcWidth = ppCharData->W * 4;
    srcOffset = x * 4 + y * srcWidth;
    dstOffset = 0;

    for (int i = y; i < y + height; ++i) {
        for (int j = x; j < x + width; ++j) {
            srcOffset = j * 4 + i * srcWidth * 8;
            sub_02013FDC(srcu8, dstu8, &srcOffset, &dstOffset, 4, srcWidth);
        }
    }
    FreeToHeap(pNcgrFile);
}

void *sub_02014298(NarcId narcId, s32 fileId, HeapID heapId, int x, int y, int width, int height) {
    void *ret = AllocFromHeap(heapId, width * height * 32);
    sub_020141C4(narcId, fileId, heapId, x, y, width, height, ret);
    return ret;
}

static void sub_020142D4(int srcWidth, int a1, int x, int y, int width, int height, int *pDstOffset, const void *src, void *dest) {
    int j, i;
    const u8 *srcu8;
    u8 *dstu8;
    int srcOffset;
    int xmax;
    int ymax;

    srcu8 = src;
    dstu8 = dest;
    xmax = x + width;
    ymax = y + height;
    for (i = y; i < ymax; ++i) {
        for (j = x; j < xmax; ++j) {
            srcOffset = 32 * j + 32 * i * srcWidth;
            memcpy(dstu8 + *pDstOffset, srcu8 + srcOffset, 32);
            *pDstOffset += 32;
        }
    }
}

static void sub_02014350(int srcWidth, int a1, const UnkStruct_02014E30 *template, int *pDstOffset, const void *src, void *dest) {
    sub_020142D4(srcWidth, a1, template->x, template->y, template->w, template->h, pDstOffset, src, dest);
}
