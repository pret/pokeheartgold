#include "global.h"
#include "gf_gfx_loader.h"
#include "bg_window.h"
#include "nnsys.h"

static u32 GfGfxLoader_LoadCharDataInternal(void *data, BgConfig *bgConfig, enum GFBgLayer layer, u32 tileStart, u32 szByte);
static void GfGfxLoader_LoadScrnDataInternal(void *data, BgConfig *bgConfig, enum GFBgLayer layer, u32 tileStart, u32 szByte);
static void GfGfxLoader_GXLoadPalWithSrcOffsetInternal(void *data, enum GFBgLayer layer, u32 srcOffset, u32 baseAddr, u32 szByte);
static void GfGfxLoader_PartiallyLoadPaletteInternal(void *data, NNS_G2D_VRAM_TYPE type, u32 baseAddr, NNSG2dImagePaletteProxy *pPltProxy);
static u32 GfGfxLoader_LoadImageMappingInternal(void *data, int layout, u32 size, NNS_G2D_VRAM_TYPE type, u32 baseAddr, NNSG2dImageProxy *pImgProxy);
static void *GfGfxLoader_GetCharDataInternal(void *data, NNSG2dCharacterData **ppCharData);
static void *GfGfxLoader_GetScrnDataInternal(void *data, NNSG2dScreenData **ppCharData);
static void *GfGfxLoader_GetPlttDataInternal(void *data, NNSG2dPaletteData **ppPlttData);
static void *GfGfxLoader_GetCellBankInternal(void *data, NNSG2dCellDataBank **ppCellbank);
static void *GfGfxLoader_GetAnimBankInternal(void *data, NNSG2dAnimBankData **ppAnimbank);

u32 GfGfxLoader_LoadCharData(NarcId narcId, s32 memberNo, BgConfig *bgConfig, enum GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapId, FALSE);
    return GfGfxLoader_LoadCharDataInternal(data, bgConfig, layer, tileStart, szByte);
}

void GfGfxLoader_LoadScrnData(NarcId narcId, s32 memberNo, BgConfig *bgConfig, enum GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapId, TRUE);
    GfGfxLoader_LoadScrnDataInternal(data, bgConfig, layer, tileStart, szByte);
}

void GfGfxLoader_GXLoadPal(NarcId narcId, s32 memberNo, enum GFBgLayer layer, u32 baseAddr, u32 szByte, HeapID heapId) {
    GfGfxLoader_GXLoadPalWithSrcOffset(narcId, memberNo, layer, 0, baseAddr, szByte, heapId);
}

void GfGfxLoader_GXLoadPalWithSrcOffset(NarcId narcId, s32 memberNo, enum GFBgLayer layer, u32 srcOffset, u32 baseAddr, u32 szByte, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, FALSE, heapId, TRUE);
    GfGfxLoader_GXLoadPalWithSrcOffsetInternal(data, layer, srcOffset, baseAddr, szByte);
}

void GfGfxLoader_PartiallyLoadPalette(NarcId narcId, s32 memberNo, NNS_G2D_VRAM_TYPE type, u32 baseAddr, HeapID heapId, NNSG2dImagePaletteProxy *pPltProxy) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, FALSE, heapId, TRUE);
    GfGfxLoader_PartiallyLoadPaletteInternal(data, type, baseAddr, pPltProxy);
}

u32 GfGfxLoader_LoadImageMapping(NarcId narcId, s32 memberNo, BOOL isCompressed, enum GFBgLayer layer, u32 szByte,NNS_G2D_VRAM_TYPE type, u32 baseAddr,  HeapID heapId, NNSG2dImageProxy *pImgProxy) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapId, TRUE);
    return GfGfxLoader_LoadImageMappingInternal(data, layer, szByte, type, baseAddr, pImgProxy);
}

void *GfGfxLoader_GetCharData(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dCharacterData ** ppCharData, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapId, FALSE);
    return GfGfxLoader_GetCharDataInternal(data, ppCharData);
}

void *GfGfxLoader_GetScrnData(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dScreenData ** ppScrnData, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapId, FALSE);
    return GfGfxLoader_GetScrnDataInternal(data, ppScrnData);
}

void *GfGfxLoader_GetPlttData(NarcId narcId, s32 memberNo, NNSG2dPaletteData ** ppPlttData, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, FALSE, heapId, FALSE);
    return GfGfxLoader_GetPlttDataInternal(data, ppPlttData);
}

void *GfGfxLoader_GetCellBank(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dCellDataBank ** ppCellBank, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapId, FALSE);
    return GfGfxLoader_GetCellBankInternal(data, ppCellBank);
}

void *GfGfxLoader_GetAnimBank(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dAnimBankData ** ppAnimBank, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapId, FALSE);
    return GfGfxLoader_GetAnimBankInternal(data, ppAnimBank);
}

void *GfGfxLoader_LoadFromNarc(NarcId narcId, s32 fileId, BOOL isCompressed, HeapID heapId, BOOL atEnd) {
    void *data;
    void *uncompBuf;

    if (isCompressed || atEnd == TRUE) {
        data = AllocFromHeapAtEnd(heapId, GetNarcMemberSizeByIdPair(narcId, fileId));
    } else {
        data = AllocFromHeap(heapId, GetNarcMemberSizeByIdPair(narcId, fileId));
    }
    if (data != NULL) {
        ReadWholeNarcMemberByIdPair(data, narcId, fileId);
        if (isCompressed) {
            if (atEnd == FALSE) {
                uncompBuf = AllocFromHeap(heapId, MI_GetUncompressedSize(data));
            } else {
                uncompBuf = AllocFromHeapAtEnd(heapId, MI_GetUncompressedSize(data));
            }
            if (uncompBuf != NULL) {
                MI_UncompressLZ8(data, uncompBuf);
                FreeToHeap(data);
            }
            data = uncompBuf; // Potential memory leak
        }
    }
    return data;
}

void *GfGfxLoader_LoadFromNarc_GetSizeOut(NarcId narcId, s32 fileId, BOOL isCompressed, HeapID heapId, BOOL atEnd, u32 *sizeOut) {
    void *data;
    void *uncompBuf;

    *sizeOut = GetNarcMemberSizeByIdPair(narcId, fileId);
    if (isCompressed || atEnd == TRUE) {
        data = AllocFromHeapAtEnd(heapId, *sizeOut);
    } else {
        data = AllocFromHeap(heapId, *sizeOut);
    }
    if (data != NULL) {
        ReadWholeNarcMemberByIdPair(data, narcId, fileId);
        if (isCompressed) {
            *sizeOut = MI_GetUncompressedSize(data);
            if (atEnd == FALSE) {
                uncompBuf = AllocFromHeap(heapId, *sizeOut);
            } else {
                uncompBuf = AllocFromHeapAtEnd(heapId, *sizeOut);
            }
            if (uncompBuf != NULL) {
                MI_UncompressLZ8(data, uncompBuf);
                FreeToHeap(data);
            }
            data = uncompBuf; // Potential memory leak
        }
    }
    return data;
}

u32 GfGfxLoader_LoadCharDataFromOpenNarc(NARC *narc, s32 memberNo, BgConfig *bgConfig, enum GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapId, FALSE);
    return GfGfxLoader_LoadCharDataInternal(data, bgConfig, layer, tileStart, szByte);
}

void GfGfxLoader_LoadScrnDataFromOpenNarc(NARC *narc, s32 memberNo, BgConfig *bgConfig, enum GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapId, TRUE);
    GfGfxLoader_LoadScrnDataInternal(data, bgConfig, layer, tileStart, szByte);
}

void GfGfxLoader_GXLoadPalFromOpenNarc(NARC *narc, s32 memberNo, enum GFBgLayer layer, u32 baseAddr, u32 szByte, HeapID heapId) {
    GfGfxLoader_GXLoadPalWithSrcOffsetFromOpenNarc(narc, memberNo, layer, 0, baseAddr, szByte, heapId);
}

void GfGfxLoader_GXLoadPalWithSrcOffsetFromOpenNarc(NARC *narc, s32 memberNo, enum GFBgLayer layer, u32 srcOffset, u32 baseAddr, u32 szByte, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, FALSE, heapId, TRUE);
    GfGfxLoader_GXLoadPalWithSrcOffsetInternal(data, layer, srcOffset, baseAddr, szByte);
}

void GfGfxLoader_PartiallyLoadPaletteFromOpenNarc(NARC *narc, s32 memberNo, NNS_G2D_VRAM_TYPE type, u32 baseAddr, HeapID heapId, struct NNSG2dImagePaletteProxy *pPltProxy) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, FALSE, heapId, TRUE);
    GfGfxLoader_PartiallyLoadPaletteInternal(data, type, baseAddr, pPltProxy);
}

u32 GfGfxLoader_LoadImageMappingFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, enum GFBgLayer layer, u32 szByte, NNS_G2D_VRAM_TYPE type, u32 baseAddr, HeapID heapId, NNSG2dImageProxy *pImgProxy) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapId, TRUE);
    return GfGfxLoader_LoadImageMappingInternal(data, layer, szByte, type, baseAddr, pImgProxy);
}

void *GfGfxLoader_GetCharDataFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dCharacterData ** ppCharData, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapId, FALSE);
    return GfGfxLoader_GetCharDataInternal(data, ppCharData);
}

void *GfGfxLoader_GetScrnDataFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dScreenData ** ppScrnData, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapId, FALSE);
    return GfGfxLoader_GetScrnDataInternal(data, ppScrnData);
}

void *GfGfxLoader_GetPlttDataFromOpenNarc(NARC *narc, s32 memberNo, NNSG2dPaletteData ** ppPlttData, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, FALSE, heapId, FALSE);
    return GfGfxLoader_GetPlttDataInternal(data, ppPlttData);
}

void *GfGfxLoader_GetCellBankFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dCellDataBank ** ppCellBank, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapId, FALSE);
    return GfGfxLoader_GetCellBankInternal(data, ppCellBank);
}

void *GfGfxLoader_GetAnimBankFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dAnimBankData ** ppAnimBank, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapId, FALSE);
    return GfGfxLoader_GetAnimBankInternal(data, ppAnimBank);
}

void *GfGfxLoader_LoadFromOpenNarc(NARC *narc, s32 fileId, BOOL isCompressed, HeapID heapId, BOOL atEnd) {
    u32 size;
    return GfGfxLoader_LoadFromOpenNarc_GetSizeOut(narc, fileId, isCompressed, heapId, atEnd, &size);
}

void *GfGfxLoader_LoadFromOpenNarc_GetSizeOut(NARC *narc, s32 fileId, BOOL isCompressed, HeapID heapId, BOOL atEnd, u32 *sizeOut) {
    void *data;
    void *uncompBuf;

    *sizeOut = NARC_GetMemberSize(narc, fileId);
    if (isCompressed || atEnd == TRUE) {
        data = AllocFromHeapAtEnd(heapId, *sizeOut);
    } else {
        data = AllocFromHeap(heapId, *sizeOut);
    }
    if (data != NULL) {
        NARC_ReadWholeMember(narc, fileId, data);
        if (isCompressed) {
            *sizeOut = MI_GetUncompressedSize(data);
            if (atEnd == FALSE) {
                uncompBuf = AllocFromHeap(heapId, *sizeOut);
            } else {
                uncompBuf = AllocFromHeapAtEnd(heapId, *sizeOut);
            }
            if (uncompBuf != NULL) {
                MI_UncompressLZ8(data, uncompBuf);
                FreeToHeap(data);
            }
            data = uncompBuf; // Potential memory leak
        }
    }
    return data;
}


static u32 GfGfxLoader_LoadCharDataInternal(void *data, BgConfig *bgConfig, enum GFBgLayer layer, u32 tileStart, u32 szByte) {
    NNSG2dCharacterData* pCharData;

    if (data != NULL) {
        if (NNS_G2dGetUnpackedBGCharacterData(data, &pCharData)) {
            if (szByte == 0) {
                szByte = pCharData->szByte;
            }
            BG_LoadCharTilesData(bgConfig, (u8)layer, pCharData->pRawData, szByte, tileStart);
        }
        FreeToHeap(data);
    }
    return szByte;
}

static void GfGfxLoader_LoadScrnDataInternal(void *data, BgConfig *bgConfig, enum GFBgLayer layer, u32 tileStart, u32 szByte) {
    NNSG2dScreenData* pScrnData;
    void *bgTilemapBuffer;

    if (data != NULL) {
        if (NNS_G2dGetUnpackedScreenData(data, &pScrnData)) {
            if (szByte == 0) {
                szByte = pScrnData->szByte;
            }
            bgTilemapBuffer = GetBgTilemapBuffer(bgConfig, layer);
            if (bgTilemapBuffer != NULL) {
                BG_LoadScreenTilemapData(bgConfig, (u8)layer, pScrnData->rawData, szByte);
            }
            BgCopyOrUncompressTilemapBufferRangeToVram(bgConfig, (u8)layer, pScrnData->rawData, szByte, tileStart);
        }
        FreeToHeap(data);
    }
}

static void GfGfxLoader_GXLoadPalWithSrcOffsetInternal(void *data, enum GFBgLayer layer, u32 srcOffset, u32 baseAddr, u32 szByte) {
    static void (*const _020F5968[])(const void *pSrc, u32 offset, u32 szByte) = {
        GX_LoadBGPltt,
        GX_LoadOBJPltt,
        GX_LoadBGExtPltt,
        GX_LoadOBJExtPltt,
        GXS_LoadBGPltt,
        GXS_LoadOBJPltt,
        GXS_LoadBGExtPltt,
        GXS_LoadOBJExtPltt,
    };
    NNSG2dPaletteData *pPlttData;
    if (data != NULL) {
        if (NNS_G2dGetUnpackedPaletteData(data, &pPlttData)) {
            pPlttData->pRawData = (void *)((u32)pPlttData->pRawData + srcOffset);
            if (szByte == 0) {
                szByte = pPlttData->szByte - srcOffset;
            }
            DC_FlushRange(pPlttData->pRawData, szByte);
            switch (layer) {
            case 2:
                GX_BeginLoadBGExtPltt();
                _020F5968[layer](pPlttData->pRawData, baseAddr, szByte);
                GX_EndLoadBGExtPltt();
                break;
            case 6:
                GXS_BeginLoadBGExtPltt();
                _020F5968[layer](pPlttData->pRawData, baseAddr, szByte);
                GXS_EndLoadBGExtPltt();
                break;
            case 3:
                GX_BeginLoadOBJExtPltt();
                _020F5968[layer](pPlttData->pRawData, baseAddr, szByte);
                GX_EndLoadOBJExtPltt();
                break;
            case 7:
                GXS_BeginLoadOBJExtPltt();
                _020F5968[layer](pPlttData->pRawData, baseAddr, szByte);
                GXS_EndLoadOBJExtPltt();
                break;
            default:
                _020F5968[layer](pPlttData->pRawData, baseAddr, szByte);
                break;
            }
        }
        FreeToHeap(data);
    }
}

static void GfGfxLoader_PartiallyLoadPaletteInternal(void *data, NNS_G2D_VRAM_TYPE type, u32 baseAddr, NNSG2dImagePaletteProxy *pPltProxy) {
    NNSG2dPaletteData *pPlttData;
    NNSG2dPaletteCompressInfo *pCompressInfo;
    BOOL gotInfo;
    if (data != NULL) {
        gotInfo = NNS_G2dGetUnpackedPaletteCompressInfo(data, &pCompressInfo);
        if (NNS_G2dGetUnpackedPaletteData(data, &pPlttData)) {
            if (gotInfo) {
                NNS_G2dLoadPaletteEx(pPlttData, pCompressInfo, baseAddr, type, pPltProxy);
            } else {
                NNS_G2dLoadPalette(pPlttData, baseAddr, type, pPltProxy);
            }
        }
        FreeToHeap(data);
    }
}

#pragma require_prototypes off
// The two functions below represent routines that were deadstripped in hgss.
// However, there is a bug in mwcc which causes static objects defined inside
// the scope of a deadstripped routine to not themselves be deadstripped.
void foo() {
    static void (*const _020F5958[])(const NNSG2dCharacterData *pSrcData, u32 baseAddr, NNS_G2D_VRAM_TYPE type, NNSG2dImageProxy *pImgProxy) = {
        NNS_G2dLoadImage1DMapping,
        NNS_G2dLoadImage2DMapping,
    };
}

void bar() {
    static void (*const _020F5960[])(const void *data, u32 offset, u32 size) = {
        GX_LoadOBJ,
        GXS_LoadOBJ,
    };
}
#pragma require_prototypes on

static u32 GfGfxLoader_LoadImageMappingInternal(void *data, int layout, u32 szByte, NNS_G2D_VRAM_TYPE type, u32 baseAddr, NNSG2dImageProxy *pImgProxy) {
    u32 size = 0;
    static void (*const _020F5950[])(const NNSG2dCharacterData* pSrcData, u32 baseAddr, NNS_G2D_VRAM_TYPE type, NNSG2dImageProxy* pImgProxy) = {
        NNS_G2dLoadImage1DMapping,
        NNS_G2dLoadImage2DMapping,
    };
    NNSG2dCharacterData *pCharData;

    if (data != NULL) {
        if (NNS_G2dGetUnpackedCharacterData(data, &pCharData)) {
            if (szByte != 0) {
                pCharData->szByte = szByte;
            }
            _020F5950[layout](pCharData, baseAddr, type, pImgProxy);
            size = pCharData->szByte;
        }
        FreeToHeap(data);
    }
    return size;
}

static void *GfGfxLoader_GetCharDataInternal(void *data, NNSG2dCharacterData **ppCharData) {
    if (data != NULL) {
        if (!NNS_G2dGetUnpackedBGCharacterData(data, ppCharData)) {
            FreeToHeap(data);
            return NULL;
        }
    }
    return data;
}

static void *GfGfxLoader_GetScrnDataInternal(void *data, NNSG2dScreenData **ppScrnData) {
    if (data != NULL) {
        if (!NNS_G2dGetUnpackedScreenData(data, ppScrnData)) {
            FreeToHeap(data);
            return NULL;
        }
    }
    return data;
}

static void *GfGfxLoader_GetPlttDataInternal(void *data, NNSG2dPaletteData **ppPlttData) {
    if (data != NULL) {
        if (!NNS_G2dGetUnpackedPaletteData(data, ppPlttData)) {
            FreeToHeap(data);
            return NULL;
        }
    }
    return data;
}

static void *GfGfxLoader_GetCellBankInternal(void *data, NNSG2dCellDataBank **ppCellBank) {
    if (data != NULL) {
        if (!NNS_G2dGetUnpackedCellBank(data, ppCellBank)) {
            FreeToHeap(data);
            return NULL;
        }
    }
    return data;
}

static void *GfGfxLoader_GetAnimBankInternal(void *data, NNSG2dAnimBankData **ppAnimBank) {
    if (data != NULL) {
        if (!NNS_G2dGetUnpackedAnimBank(data, ppAnimBank)) {
            FreeToHeap(data);
            return NULL;
        }
    }
    return data;
}
