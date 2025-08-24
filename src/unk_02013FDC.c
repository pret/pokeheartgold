#include "unk_02013FDC.h"

#include "global.h"

#include "constants/pokemon.h"
#include "constants/species.h"

#include "pokepic.h"

static void sub_02013FDC(const u8 *src, u8 *dest, int *pSrcOffset, int *pDestOffset, u32 destBlockSize, u32 srcBlockSize);
static void sub_0201401C(NarcId narcId, s32 fileId, enum HeapID heapID, NNSG2dCharacterData **pCharData);
static void sub_02014050(int x, int y, int width, int height, NNSG2dCharacterData *pCharData, void *dest);
static BOOL sub_020140E8(int species);
static void sub_02014128(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height, void *dest, u32 pid, BOOL isAnimated, int whichFacing, int species);
static void *sub_02014178(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height, u32 pid, BOOL isAnimated, int whichFacing, int species);
static void sub_020142D4(int srcWidth, int srcHeight, int x, int y, int width, int height, int *pDstOffset, const void *src, void *dest);
static void sub_02014350(int srcWidth, int srcHeight, const UnkStruct_02014E30 *template, int *pDstOffset, const void *src, void *dest);
static void sub_02014374(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height, void *dest);

static void sub_02013FDC(const u8 *src, u8 *dest, int *pSrcOffset, int *pDestOffset, u32 destBlockSize, u32 srcBlockSize) {
    for (int i = 0; i < 8; ++i) {
        memcpy(dest + *pDestOffset, src + *pSrcOffset, destBlockSize);
        *pSrcOffset += srcBlockSize;
        *pDestOffset += destBlockSize;
    }
}

static void sub_0201401C(NarcId narcId, s32 fileId, enum HeapID heapID, NNSG2dCharacterData **pCharData) {
    BOOL result;
    void *pRaw = AllocAndReadWholeNarcMemberByIdPair(narcId, fileId, heapID);
    GF_ASSERT(pRaw != NULL);
    result = NNS_G2dGetUnpackedCharacterData(pRaw, pCharData);
    GF_ASSERT(pCharData != NULL);
    GF_ASSERT(result);
    Heap_Free(pRaw);
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
    int horribleArray[2] = {
        SPECIES_SPINDA,
        SPECIES_BAD_EGG,
    };
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

static void sub_02014128(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height, void *dest, u32 pid, BOOL isAnimated, int whichFacing, int species) {
    NNSG2dCharacterData *ppCharData = NULL;
    sub_0201401C(narcId, fileId, heapID, &ppCharData);
    UnscanPokepic(ppCharData->pRawData, narcId);
    BOOL isSpinda = sub_020140E8(species);
    if (whichFacing == MON_PIC_FACING_FRONT && isSpinda == TRUE) {
        RawChardata_PlaceSpindaSpots(ppCharData->pRawData, pid, isAnimated);
    }
    sub_02014050(x, y, width, height, ppCharData, dest);
}

static void *sub_02014178(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height, u32 pid, BOOL isAnimated, int whichFacing, int species) {
    void *ret = Heap_Alloc(heapID, width * height * 32);
    sub_02014128(narcId, fileId, heapID, x, y, width, height, ret, pid, isAnimated, whichFacing, species);
    return ret;
}

void sub_020141C4(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height, void *dest) {
    NNSG2dCharacterData *ppCharData = NULL;
    int srcOffset;
    int dstOffset;
    void *pNcgrFile = AllocAndReadWholeNarcMemberByIdPair(narcId, fileId, heapID);
    u8 *srcu8;
    u8 *dstu8;
    int srcWidth;

    GF_ASSERT(pNcgrFile != NULL);
    GF_ASSERT(NNS_G2dGetUnpackedCharacterData(pNcgrFile, &ppCharData));
    GF_ASSERT(ppCharData->W >= x + width);
    GF_ASSERT(ppCharData->H >= y + height);

    srcu8 = ppCharData->pRawData;
    UnscanPokepic(srcu8, narcId);
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
    Heap_Free(pNcgrFile);
}

void *sub_02014298(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height) {
    void *ret = Heap_Alloc(heapID, width * height * 32);
    sub_020141C4(narcId, fileId, heapID, x, y, width, height, ret);
    return ret;
}

static void sub_020142D4(int srcWidth, int srcHeight, int x, int y, int width, int height, int *pDstOffset, const void *src, void *dest) {
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

static void sub_02014350(int srcWidth, int srcHeight, const UnkStruct_02014E30 *template, int *pDstOffset, const void *src, void *dest) {
    sub_020142D4(srcWidth, srcHeight, template->x, template->y, template->w, template->h, pDstOffset, src, dest);
}

static void sub_02014374(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height, void *dest) {
    UnkStruct_02014E30 sp1C[6] = {
        { 0, 0, 8, 8 },
        { 8, 0, 2, 4 },
        { 8, 4, 2, 4 },
        { 0, 8, 4, 2 },
        { 4, 8, 4, 2 },
        { 8, 8, 2, 2 },
    };

    int sp18 = 0;
    void *sp14 = sub_02014298(narcId, fileId, heapID, x, y, width, height);
    for (int i = 0; i < 6; ++i) {
        sub_02014350(width, height, &sp1C[i], &sp18, sp14, dest);
    }
    Heap_Free(sp14);
}

void sub_020143E0(NarcId narcId, s32 fileId, enum HeapID heapID, UnkStruct_02014E30 *a3, void *dest) {
    sub_02014374(narcId, fileId, heapID, a3->x, a3->y, a3->w, a3->h, dest);
}

void sub_02014400(NarcId narcId, s32 fileId, enum HeapID heapID, void *dest) {
    UnkStruct_02014E30 sp4 = { 0, 0, 10, 10 };
    sub_020143E0(narcId, fileId, heapID, &sp4, dest);
}

void *sub_0201442C(NarcId narcId, s32 fileId, enum HeapID heapID) {
    void *ret = Heap_Alloc(heapID, 3200);
    sub_02014400(narcId, fileId, heapID, ret);
    return ret;
}

void *sub_02014450(NarcId narcId, s32 fileId, enum HeapID heapID) {
    void *ret = Heap_Alloc(heapID, 0x20);
    void *pNclrFile = AllocAndReadWholeNarcMemberByIdPair(narcId, fileId, heapID);
    NNSG2dPaletteData *pPlttData;
    GF_ASSERT(NNS_G2dGetUnpackedPaletteData(pNclrFile, &pPlttData) == TRUE);
    MI_CpuCopy16(pPlttData->pRawData, ret, 0x20);
    Heap_Free(pNclrFile);
    return ret;
}

void sub_02014494(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height, void *dest, u32 pid, BOOL isAnimated, int whichFacing, int species) {
    UnkStruct_02014E30 sp2C[6] = {
        { 0, 0, 8, 8 },
        { 8, 0, 2, 4 },
        { 8, 4, 2, 4 },
        { 0, 8, 4, 2 },
        { 4, 8, 4, 2 },
        { 8, 8, 2, 2 },
    };

    int sp28 = 0;
    void *sp24 = sub_02014178(narcId, fileId, heapID, x, y, width, height, pid, isAnimated, whichFacing, species);
    for (int i = 0; i < 6; ++i) {
        sub_02014350(width, height, &sp2C[i], &sp28, sp24, dest);
    }
    Heap_Free(sp24);
}

void sub_02014510(NarcId narcId, s32 fileId, enum HeapID heapID, UnkStruct_02014E30 *a3, void *dest, u32 personality, BOOL isAnimated, int whichFacing, int species) {
    sub_02014494(narcId, fileId, heapID, a3->x, a3->y, a3->w, a3->h, dest, personality, isAnimated, whichFacing, species);
}

void sub_02014540(NarcId narcId, s32 fileId, enum HeapID heapID, void *dest, u32 personality, BOOL isAnimated, int whichFacing, int species) {
    UnkStruct_02014E30 sp14 = { 0, 0, 10, 10 };
    sub_02014510(narcId, fileId, heapID, &sp14, dest, personality, isAnimated, whichFacing, species);
}

void *sub_0201457C(NarcId narcId, s32 fileId, enum HeapID heapID, u32 personality, BOOL isAnimated, int whichFacing, int species) {
    void *ret = Heap_Alloc(heapID, 3200);
    sub_02014540(narcId, fileId, heapID, ret, personality, isAnimated, whichFacing, species);
    return ret;
}

void sub_020145B4(const void *texSrc, int texDim, int x, int y, int w, int h, void *dest) {
    int srcOffset;
    int dstOffset;
    const u8 *srcu8;
    u8 *dstu8;
    int srcBlockSize;

    srcu8 = texSrc;
    dstu8 = dest;
    srcBlockSize = texDim * 4;
    srcOffset = 4 * x + y * srcBlockSize;
    dstOffset = 0;

    for (int i = y; i < y + h; ++i) {
        for (int j = x; j < x + w; ++j) {
            srcOffset = j * 4 + i * srcBlockSize * 8;
            sub_02013FDC(srcu8, dstu8, &srcOffset, &dstOffset, 4, srcBlockSize);
        }
    }
}
