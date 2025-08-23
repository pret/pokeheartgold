#ifndef POKEHEARTGOLD_GF_GFX_LOADER_H
#define POKEHEARTGOLD_GF_GFX_LOADER_H

#include "bg_window.h"
#include "filesystem.h"

// These functions load (perhap-compressed) graphics resources to VRAM.
// A temporary file handle is used to read the data from the card.
u32 GfGfxLoader_LoadCharData(NarcId narcId, s32 memberNo, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, HeapID heapId);
void GfGfxLoader_LoadScrnData(NarcId narcId, s32 memberNo, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, HeapID heapId);
void GfGfxLoader_GXLoadPal(NarcId narcId, s32 memberNo, enum GFPalLoadLocation location, enum GFPalSlotOffset palSlotOffset, u32 szByte, HeapID heapId);
void GfGfxLoader_GXLoadPalWithSrcOffset(NarcId narcId, s32 memberNo, enum GFPalLoadLocation location, u32 srcOffset, enum GFPalSlotOffset palSlotOffset, u32 szByte, HeapID heapId);
void GfGfxLoader_PartiallyLoadPalette(NarcId narcId, s32 memberNo, NNS_G2D_VRAM_TYPE type, u32 baseAddr, HeapID heapId, NNSG2dImagePaletteProxy *pPltProxy);
u32 GfGfxLoader_LoadImageMapping(NarcId narcId, s32 memberNo, BOOL isCompressed, GFBgLayer layer, u32 szByte, NNS_G2D_VRAM_TYPE type, u32 baseAddr, HeapID heapId, NNSG2dImageProxy *pImgProxy);

// These functions return a pointer to the raw data in addition to populating
// the NitroSystem structs pointed to.
void *GfGfxLoader_GetCharData(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dCharacterData **ppCharData, HeapID heapId);
void *GfGfxLoader_GetScrnData(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dScreenData **ppScrnData, HeapID heapId);
void *GfGfxLoader_GetPlttData(NarcId narcId, s32 memberNo, NNSG2dPaletteData **ppPlttData, HeapID heapId);
void *GfGfxLoader_GetCellBank(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dCellDataBank **ppCellBank, HeapID heapId);
void *GfGfxLoader_GetAnimBank(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dAnimBankData **ppAnimBank, HeapID heapId);

// Opens a new file handle to read (perhaps compressed) data from a NARC.
void *GfGfxLoader_LoadFromNarc(NarcId narcId, s32 fileId, BOOL isCompressed, HeapID heapId, BOOL atEnd);

// Opens a new file handle to read (perhaps compressed) data from a NARC.
// The number of bytes read is returned to the sizeOut parameter.
void *GfGfxLoader_LoadFromNarc_GetSizeOut(NarcId narcId, s32 fileId, BOOL isCompressed, HeapID heapId, BOOL atEnd, u32 *sizeOut);

// These functions are the same as above, but they use an existing file handle.
u32 GfGfxLoader_LoadCharDataFromOpenNarc(NARC *narc, s32 memberNo, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, HeapID heapId);
void GfGfxLoader_LoadScrnDataFromOpenNarc(NARC *narc, s32 memberNo, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, HeapID heapId);
void GfGfxLoader_GXLoadPalFromOpenNarc(NARC *narc, s32 memberNo, enum GFPalLoadLocation location, enum GFPalSlotOffset palSlotOffset, u32 szByte, HeapID heapId);
void GfGfxLoader_GXLoadPalWithSrcOffsetFromOpenNarc(NARC *narc, s32 memberNo, enum GFPalLoadLocation location, u32 srcOffset, enum GFPalSlotOffset palSlotOffset, u32 szByte, HeapID heapId);
void GfGfxLoader_PartiallyLoadPaletteFromOpenNarc(NARC *narc, s32 memberNo, NNS_G2D_VRAM_TYPE type, u32 baseAddr, HeapID heapId, struct NNSG2dImagePaletteProxy *pPltProxy);
u32 GfGfxLoader_LoadImageMappingFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, GFBgLayer layer, u32 szByte, NNS_G2D_VRAM_TYPE type, u32 baseAddr, HeapID heapId, NNSG2dImageProxy *pImgProxy);
void *GfGfxLoader_GetCharDataFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dCharacterData **ppCharData, HeapID heapId);
void *GfGfxLoader_GetScrnDataFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dScreenData **ppScrnData, HeapID heapId);
void *GfGfxLoader_GetPlttDataFromOpenNarc(NARC *narc, s32 memberNo, NNSG2dPaletteData **ppPlttData, HeapID heapId);
void *GfGfxLoader_GetCellBankFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dCellDataBank **ppCellBank, HeapID heapId);
void *GfGfxLoader_GetAnimBankFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dAnimBankData **ppAnimBank, HeapID heapId);
void *GfGfxLoader_LoadFromOpenNarc(NARC *narc, s32 fileId, BOOL isCompressed, HeapID heapId, BOOL atEnd);
void *GfGfxLoader_LoadFromOpenNarc_GetSizeOut(NARC *narc, s32 fileId, BOOL isCompressed, HeapID heapId, BOOL atEnd, u32 *sizeOut);

#endif // POKEHEARTGOLD_GF_GFX_LOADER_H
