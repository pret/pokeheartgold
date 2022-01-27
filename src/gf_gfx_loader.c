#include "gf_gfx_loader.h"
#include "window.h"

void *GfGfxLoader_LoadFromNarc(NarcId narcId, s32 memberNo, BOOL isCompressed, HeapID heapId, BOOL atEnd);
u32 GfGfxLoader_LoadCharDataInternal(void *data, BGCONFIG *bgConfig, enum GFBgLayer layer, u32 tileStart, u32 szByte);
u32 GfGfxLoader_LoadScrnDataInternal(void *data, BGCONFIG *bgConfig, enum GFBgLayer layer, u32 tileStart, u32 szByte);
u32 GfGfxLoader_GXLoadPalWithSrcOffset(NarcId narcId, s32 memberNo, enum GFBgLayer layer, u32 srcOffset, u32 baseAddr, u32 szByte, HeapID heapId);
u32 GfGfxLoader_GXLoadPalWithSrcOffsetInternal(void *data, enum GFBgLayer layer, u32 srcOffset, u32 baseAddr, u32 szByte);
u32 GfGfxLoader_PartiallyLoadPaletteInternal(void *data, enum GFBgLayer layer, u32 baseAddr, u32 szByte);
u32 GfGfxLoader_LoadImageMappingInternal(void *data, enum GFBgLayer layer, u32 baseAddr, u32 szByte, NNS_G2D_VRAM_TYPE type, NNSG2dImageProxy *pImgProxy);
void *GfGfxLoader_GetCharDataInternal(void *data, NNSG2dCharacterData **ppCharData);
void *GfGfxLoader_GetScrnDataInternal(void *data, NNSG2dScreenData **ppCharData);
void *GfGfxLoader_GetPlttDataInternal(void *data, NNSG2dPaletteData **ppPlttData);
void *GfGfxLoader_GetCellBankInternal(void *data, NNSG2dCellDataBank **ppCellbank);
void *GfGfxLoader_GetAnimBankInternal(void *data, NNSG2dAnimBankData **ppAnimbank);

u32 GfGfxLoader_LoadCharData(NarcId narcId, s32 memberNo, BGCONFIG *bgConfig, enum GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapId, FALSE);
    return GfGfxLoader_LoadCharDataInternal(data, bgConfig, layer, tileStart, szByte);
}

u32 GfGfxLoader_LoadScrnData(NarcId narcId, s32 memberNo, BGCONFIG *bgConfig, enum GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapId, TRUE);
    return GfGfxLoader_LoadScrnDataInternal(data, bgConfig, layer, tileStart, szByte);
}

u32 GfGfxLoader_GXLoadPal(NarcId narcId, s32 memberNo, enum GFBgLayer layer, u32 baseAddr, u32 szByte, HeapID heapId) {
    return GfGfxLoader_GXLoadPalWithSrcOffset(narcId, memberNo, layer, 0, baseAddr, szByte, heapId);
}

u32 GfGfxLoader_GXLoadPalWithSrcOffset(NarcId narcId, s32 memberNo, enum GFBgLayer layer, u32 srcOffset, u32 baseAddr, u32 szByte, HeapID heapId) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, FALSE, heapId, TRUE);
    return GfGfxLoader_GXLoadPalWithSrcOffsetInternal(data, layer, srcOffset, baseAddr, szByte);
}

u32 GfGfxLoader_PartiallyLoadPalette(NarcId narcId, s32 memberNo, enum GFBgLayer layer, u32 baseAddr, HeapID heapId, u32 szByte) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, FALSE, heapId, TRUE);
    return GfGfxLoader_PartiallyLoadPaletteInternal(data, layer, baseAddr, szByte);
}

u32 GfGfxLoader_LoadImageMapping(NarcId narcId, s32 memberNo, BOOL isCompressed, enum GFBgLayer layer, u32 baseAddr, u32 szByte, NNS_G2D_VRAM_TYPE type, HeapID heapId, NNSG2dImageProxy *pImgProxy) {
    void *data;
    data = GfGfxLoader_LoadFromNarc(narcId, memberNo, isCompressed, heapId, TRUE);
    return GfGfxLoader_LoadImageMappingInternal(data, layer, baseAddr, szByte, type, pImgProxy);
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
