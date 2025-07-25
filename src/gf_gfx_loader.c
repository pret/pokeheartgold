#include "gf_gfx_loader.h"

#include "global.h"

#include "bg_window.h"
#include "nnsys.h"

static u32 GfGfxLoader_LoadCharDataInternal(void *data, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte);
static void GfGfxLoader_LoadScrnDataInternal(void *data, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte);
static void GfGfxLoader_GXLoadPalWithSrcOffsetInternal(void *data, enum GFPalLoadLocation location, u32 srcOffset, enum GFPalSlotOffset palSlotOffset, u32 szByte);
static void GfGfxLoader_PartiallyLoadPaletteInternal(void *data, NNS_G2D_VRAM_TYPE type, u32 baseAddr, NNSG2dImagePaletteProxy *pPltProxy);
static u32 GfGfxLoader_LoadImageMappingInternal(void *data, int layout, u32 size, NNS_G2D_VRAM_TYPE type, u32 baseAddr, NNSG2dImageProxy *pImgProxy);
static void *GfGfxLoader_GetCharDataInternal(void *data, NNSG2dCharacterData **ppCharData);
static void *GfGfxLoader_GetScrnDataInternal(void *data, NNSG2dScreenData **ppCharData);
static void *GfGfxLoader_GetPlttDataInternal(void *data, NNSG2dPaletteData **ppPlttData);
static void *GfGfxLoader_GetCellBankInternal(void *data, NNSG2dCellDataBank **ppCellbank);
static void *GfGfxLoader_GetAnimBankInternal(void *data, NNSG2dAnimBankData **ppAnimbank);

u32 GfGfxLoader_LoadCharData(NarcId narcId, s32 memberNo, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapID, FALSE);
    return GfGfxLoader_LoadCharDataInternal(data, bgConfig, layer, tileStart, szByte);
}

void GfGfxLoader_LoadScrnData(NarcId narcId, s32 memberNo, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapID, TRUE);
    GfGfxLoader_LoadScrnDataInternal(data, bgConfig, layer, tileStart, szByte);
}

void GfGfxLoader_GXLoadPal(NarcId narcId, s32 memberNo, enum GFPalLoadLocation location, enum GFPalSlotOffset palSlotOffset, u32 szByte, enum HeapID heapID) {
    GfGfxLoader_GXLoadPalWithSrcOffset(narcId, memberNo, location, 0, palSlotOffset, szByte, heapID);
}

void GfGfxLoader_GXLoadPalWithSrcOffset(NarcId narcId, s32 memberNo, enum GFPalLoadLocation location, u32 srcOffset, enum GFPalSlotOffset palSlotOffset, u32 szByte, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, FALSE, heapID, TRUE);
    GfGfxLoader_GXLoadPalWithSrcOffsetInternal(data, location, srcOffset, palSlotOffset, szByte);
}

void GfGfxLoader_PartiallyLoadPalette(NarcId narcId, s32 memberNo, NNS_G2D_VRAM_TYPE type, u32 baseAddr, enum HeapID heapID, NNSG2dImagePaletteProxy *pPltProxy) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, FALSE, heapID, TRUE);
    GfGfxLoader_PartiallyLoadPaletteInternal(data, type, baseAddr, pPltProxy);
}

u32 GfGfxLoader_LoadImageMapping(NarcId narcId, s32 memberNo, BOOL isCompressed, GFBgLayer layer, u32 szByte, NNS_G2D_VRAM_TYPE type, u32 baseAddr, enum HeapID heapID, NNSG2dImageProxy *pImgProxy) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapID, TRUE);
    return GfGfxLoader_LoadImageMappingInternal(data, layer, szByte, type, baseAddr, pImgProxy);
}

void *GfGfxLoader_GetCharData(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dCharacterData **ppCharData, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapID, FALSE);
    return GfGfxLoader_GetCharDataInternal(data, ppCharData);
}

void *GfGfxLoader_GetScrnData(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dScreenData **ppScrnData, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapID, FALSE);
    return GfGfxLoader_GetScrnDataInternal(data, ppScrnData);
}

void *GfGfxLoader_GetPlttData(NarcId narcId, s32 memberNo, NNSG2dPaletteData **ppPlttData, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, FALSE, heapID, FALSE);
    return GfGfxLoader_GetPlttDataInternal(data, ppPlttData);
}

void *GfGfxLoader_GetCellBank(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dCellDataBank **ppCellBank, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapID, FALSE);
    return GfGfxLoader_GetCellBankInternal(data, ppCellBank);
}

void *GfGfxLoader_GetAnimBank(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dAnimBankData **ppAnimBank, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapID, FALSE);
    return GfGfxLoader_GetAnimBankInternal(data, ppAnimBank);
}

void *GfGfxLoader_LoadFromNarc(NarcId narcId, s32 fileId, BOOL isCompressed, enum HeapID heapID, BOOL atEnd) {
    void *data;
    void *uncompBuf;

    if (isCompressed || atEnd == TRUE) {
        data = Heap_AllocAtEnd(heapID, GetNarcMemberSizeByIdPair(narcId, fileId));
    } else {
        data = Heap_Alloc(heapID, GetNarcMemberSizeByIdPair(narcId, fileId));
    }
    if (data != NULL) {
        ReadWholeNarcMemberByIdPair(data, narcId, fileId);
        if (isCompressed) {
            if (atEnd == FALSE) {
                uncompBuf = Heap_Alloc(heapID, MI_GetUncompressedSize(data));
            } else {
                uncompBuf = Heap_AllocAtEnd(heapID, MI_GetUncompressedSize(data));
            }
            if (uncompBuf != NULL) {
                MI_UncompressLZ8(data, uncompBuf);
                Heap_Free(data);
            }
            data = uncompBuf; // Potential memory leak
        }
    }
    return data;
}

void *GfGfxLoader_LoadFromNarc_GetSizeOut(NarcId narcId, s32 fileId, BOOL isCompressed, enum HeapID heapID, BOOL atEnd, u32 *sizeOut) {
    void *data;
    void *uncompBuf;

    *sizeOut = GetNarcMemberSizeByIdPair(narcId, fileId);
    if (isCompressed || atEnd == TRUE) {
        data = Heap_AllocAtEnd(heapID, *sizeOut);
    } else {
        data = Heap_Alloc(heapID, *sizeOut);
    }
    if (data != NULL) {
        ReadWholeNarcMemberByIdPair(data, narcId, fileId);
        if (isCompressed) {
            *sizeOut = MI_GetUncompressedSize(data);
            if (atEnd == FALSE) {
                uncompBuf = Heap_Alloc(heapID, *sizeOut);
            } else {
                uncompBuf = Heap_AllocAtEnd(heapID, *sizeOut);
            }
            if (uncompBuf != NULL) {
                MI_UncompressLZ8(data, uncompBuf);
                Heap_Free(data);
            }
            data = uncompBuf; // Potential memory leak
        }
    }
    return data;
}

u32 GfGfxLoader_LoadCharDataFromOpenNarc(NARC *narc, s32 memberNo, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapID, FALSE);
    return GfGfxLoader_LoadCharDataInternal(data, bgConfig, layer, tileStart, szByte);
}

void GfGfxLoader_LoadScrnDataFromOpenNarc(NARC *narc, s32 memberNo, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapID, TRUE);
    GfGfxLoader_LoadScrnDataInternal(data, bgConfig, layer, tileStart, szByte);
}

void GfGfxLoader_GXLoadPalFromOpenNarc(NARC *narc, s32 memberNo, enum GFPalLoadLocation location, enum GFPalSlotOffset palSlotOffset, u32 szByte, enum HeapID heapID) {
    GfGfxLoader_GXLoadPalWithSrcOffsetFromOpenNarc(narc, memberNo, location, 0, palSlotOffset, szByte, heapID);
}

void GfGfxLoader_GXLoadPalWithSrcOffsetFromOpenNarc(NARC *narc, s32 memberNo, enum GFPalLoadLocation location, u32 srcOffset, enum GFPalSlotOffset palSlotOffset, u32 szByte, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, FALSE, heapID, TRUE);
    GfGfxLoader_GXLoadPalWithSrcOffsetInternal(data, location, srcOffset, palSlotOffset, szByte);
}

void GfGfxLoader_PartiallyLoadPaletteFromOpenNarc(NARC *narc, s32 memberNo, NNS_G2D_VRAM_TYPE type, u32 baseAddr, enum HeapID heapID, struct NNSG2dImagePaletteProxy *pPltProxy) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, FALSE, heapID, TRUE);
    GfGfxLoader_PartiallyLoadPaletteInternal(data, type, baseAddr, pPltProxy);
}

u32 GfGfxLoader_LoadImageMappingFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, GFBgLayer layer, u32 szByte, NNS_G2D_VRAM_TYPE type, u32 baseAddr, enum HeapID heapID, NNSG2dImageProxy *pImgProxy) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapID, TRUE);
    return GfGfxLoader_LoadImageMappingInternal(data, layer, szByte, type, baseAddr, pImgProxy);
}

void *GfGfxLoader_GetCharDataFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dCharacterData **ppCharData, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapID, FALSE);
    return GfGfxLoader_GetCharDataInternal(data, ppCharData);
}

void *GfGfxLoader_GetScrnDataFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dScreenData **ppScrnData, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapID, FALSE);
    return GfGfxLoader_GetScrnDataInternal(data, ppScrnData);
}

void *GfGfxLoader_GetPlttDataFromOpenNarc(NARC *narc, s32 memberNo, NNSG2dPaletteData **ppPlttData, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, FALSE, heapID, FALSE);
    return GfGfxLoader_GetPlttDataInternal(data, ppPlttData);
}

void *GfGfxLoader_GetCellBankFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dCellDataBank **ppCellBank, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapID, FALSE);
    return GfGfxLoader_GetCellBankInternal(data, ppCellBank);
}

void *GfGfxLoader_GetAnimBankFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dAnimBankData **ppAnimBank, enum HeapID heapID) {
    void *data;
    data = GfGfxLoader_LoadFromOpenNarc(narc, memberNo, isCompressed, heapID, FALSE);
    return GfGfxLoader_GetAnimBankInternal(data, ppAnimBank);
}

void *GfGfxLoader_LoadFromOpenNarc(NARC *narc, s32 fileId, BOOL isCompressed, enum HeapID heapID, BOOL atEnd) {
    u32 size;
    return GfGfxLoader_LoadFromOpenNarc_GetSizeOut(narc, fileId, isCompressed, heapID, atEnd, &size);
}

void *GfGfxLoader_LoadFromOpenNarc_GetSizeOut(NARC *narc, s32 fileId, BOOL isCompressed, enum HeapID heapID, BOOL atEnd, u32 *sizeOut) {
    void *data;
    void *uncompBuf;

    *sizeOut = NARC_GetMemberSize(narc, fileId);
    if (isCompressed || atEnd == TRUE) {
        data = Heap_AllocAtEnd(heapID, *sizeOut);
    } else {
        data = Heap_Alloc(heapID, *sizeOut);
    }
    if (data != NULL) {
        NARC_ReadWholeMember(narc, fileId, data);
        if (isCompressed) {
            *sizeOut = MI_GetUncompressedSize(data);
            if (atEnd == FALSE) {
                uncompBuf = Heap_Alloc(heapID, *sizeOut);
            } else {
                uncompBuf = Heap_AllocAtEnd(heapID, *sizeOut);
            }
            if (uncompBuf != NULL) {
                MI_UncompressLZ8(data, uncompBuf);
                Heap_Free(data);
            }
            data = uncompBuf; // Potential memory leak
        }
    }
    return data;
}

static u32 GfGfxLoader_LoadCharDataInternal(void *data, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte) {
    NNSG2dCharacterData *pCharData;

    if (data != NULL) {
        if (NNS_G2dGetUnpackedBGCharacterData(data, &pCharData)) {
            if (szByte == 0) {
                szByte = pCharData->szByte;
            }
            BG_LoadCharTilesData(bgConfig, (u8)layer, pCharData->pRawData, szByte, tileStart);
        }
        Heap_Free(data);
    }
    return szByte;
}

static void GfGfxLoader_LoadScrnDataInternal(void *data, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte) {
    NNSG2dScreenData *pScrnData;
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
        Heap_Free(data);
    }
}

static void GfGfxLoader_GXLoadPalWithSrcOffsetInternal(void *data, enum GFPalLoadLocation location, u32 srcOffset, enum GFPalSlotOffset palSlotOffset, u32 szByte) {
    static void (*const _020F5968[])(const void *pSrc, u32 offset, u32 szByte) = {
        GX_LoadBGPltt,
        GX_LoadOBJPltt,
        GX_LoadBGExtPltt,
        GX_LoadOBJExtPltt,
        GXS_LoadBGPltt,
        GXS_LoadOBJPltt,
        GXS_LoadBGExtPltt,
        GXS_LoadOBJExtPltt,
    }; // todo: make these funcs use the pal slot offset
    NNSG2dPaletteData *pPlttData;
    if (data != NULL) {
        if (NNS_G2dGetUnpackedPaletteData(data, &pPlttData)) {
            pPlttData->pRawData = (void *)((u32)pPlttData->pRawData + srcOffset);
            if (szByte == 0) {
                szByte = pPlttData->szByte - srcOffset;
            }
            DC_FlushRange(pPlttData->pRawData, szByte);
            switch (location) {
            case GF_PAL_LOCATION_MAIN_BGEXT:
                GX_BeginLoadBGExtPltt();
                _020F5968[location](pPlttData->pRawData, palSlotOffset, szByte);
                GX_EndLoadBGExtPltt();
                break;
            case GF_PAL_LOCATION_SUB_BGEXT:
                GXS_BeginLoadBGExtPltt();
                _020F5968[location](pPlttData->pRawData, palSlotOffset, szByte);
                GXS_EndLoadBGExtPltt();
                break;
            case GF_PAL_LOCATION_MAIN_OBJEXT:
                GX_BeginLoadOBJExtPltt();
                _020F5968[location](pPlttData->pRawData, palSlotOffset, szByte);
                GX_EndLoadOBJExtPltt();
                break;
            case GF_PAL_LOCATION_SUB_OBJEXT:
                GXS_BeginLoadOBJExtPltt();
                _020F5968[location](pPlttData->pRawData, palSlotOffset, szByte);
                GXS_EndLoadOBJExtPltt();
                break;
            default:
                _020F5968[location](pPlttData->pRawData, palSlotOffset, szByte);
                break;
            }
        }
        Heap_Free(data);
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
        Heap_Free(data);
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
    static void (*const _020F5950[])(const NNSG2dCharacterData *pSrcData, u32 baseAddr, NNS_G2D_VRAM_TYPE type, NNSG2dImageProxy *pImgProxy) = {
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
        Heap_Free(data);
    }
    return size;
}

static void *GfGfxLoader_GetCharDataInternal(void *data, NNSG2dCharacterData **ppCharData) {
    if (data != NULL) {
        if (!NNS_G2dGetUnpackedBGCharacterData(data, ppCharData)) {
            Heap_Free(data);
            return NULL;
        }
    }
    return data;
}

static void *GfGfxLoader_GetScrnDataInternal(void *data, NNSG2dScreenData **ppScrnData) {
    if (data != NULL) {
        if (!NNS_G2dGetUnpackedScreenData(data, ppScrnData)) {
            Heap_Free(data);
            return NULL;
        }
    }
    return data;
}

static void *GfGfxLoader_GetPlttDataInternal(void *data, NNSG2dPaletteData **ppPlttData) {
    if (data != NULL) {
        if (!NNS_G2dGetUnpackedPaletteData(data, ppPlttData)) {
            Heap_Free(data);
            return NULL;
        }
    }
    return data;
}

static void *GfGfxLoader_GetCellBankInternal(void *data, NNSG2dCellDataBank **ppCellBank) {
    if (data != NULL) {
        if (!NNS_G2dGetUnpackedCellBank(data, ppCellBank)) {
            Heap_Free(data);
            return NULL;
        }
    }
    return data;
}

static void *GfGfxLoader_GetAnimBankInternal(void *data, NNSG2dAnimBankData **ppAnimBank) {
    if (data != NULL) {
        if (!NNS_G2dGetUnpackedAnimBank(data, ppAnimBank)) {
            Heap_Free(data);
            return NULL;
        }
    }
    return data;
}
