#ifndef POKEHEARTGOLD_GF_GFX_LOADER_H
#define POKEHEARTGOLD_GF_GFX_LOADER_H

#include "bg_window.h"
#include "filesystem.h"

// These functions load (perhap-compressed) graphics resources to VRAM.
// A temporary file handle is used to read the data from the card.
u32 GfGfxLoader_LoadCharData(NarcId narcId, s32 memberNo, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, enum HeapID heapID);
void GfGfxLoader_LoadScrnData(NarcId narcId, s32 memberNo, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, enum HeapID heapID);
void GfGfxLoader_GXLoadPal(NarcId narcId, s32 memberNo, enum GFPalLoadLocation location, enum GFPalSlotOffset palSlotOffset, u32 szByte, enum HeapID heapID);
void GfGfxLoader_GXLoadPalWithSrcOffset(NarcId narcId, s32 memberNo, enum GFPalLoadLocation location, u32 srcOffset, enum GFPalSlotOffset palSlotOffset, u32 szByte, enum HeapID heapID);
void GfGfxLoader_PartiallyLoadPalette(NarcId narcId, s32 memberNo, NNS_G2D_VRAM_TYPE type, u32 baseAddr, enum HeapID heapID, NNSG2dImagePaletteProxy *pPltProxy);
u32 GfGfxLoader_LoadImageMapping(NarcId narcId, s32 memberNo, BOOL isCompressed, GFBgLayer layer, u32 szByte, NNS_G2D_VRAM_TYPE type, u32 baseAddr, enum HeapID heapID, NNSG2dImageProxy *pImgProxy);

// These functions return a pointer to the raw data in addition to populating
// the NitroSystem structs pointed to.
void *GfGfxLoader_GetCharData(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dCharacterData **ppCharData, enum HeapID heapID);
void *GfGfxLoader_GetScrnData(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dScreenData **ppScrnData, enum HeapID heapID);
void *GfGfxLoader_GetPlttData(NarcId narcId, s32 memberNo, NNSG2dPaletteData **ppPlttData, enum HeapID heapID);
void *GfGfxLoader_GetCellBank(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dCellDataBank **ppCellBank, enum HeapID heapID);
void *GfGfxLoader_GetAnimBank(NarcId narcId, s32 memberNo, BOOL isCompressed, NNSG2dAnimBankData **ppAnimBank, enum HeapID heapID);

// Opens a new file handle to read (perhaps compressed) data from a NARC.
void *GfGfxLoader_LoadFromNarc(NarcId narcId, s32 fileId, BOOL isCompressed, enum HeapID heapID, BOOL atEnd);

// Opens a new file handle to read (perhaps compressed) data from a NARC.
// The number of bytes read is returned to the sizeOut parameter.
void *GfGfxLoader_LoadFromNarc_GetSizeOut(NarcId narcId, s32 fileId, BOOL isCompressed, enum HeapID heapID, BOOL atEnd, u32 *sizeOut);

// These functions are the same as above, but they use an existing file handle.
u32 GfGfxLoader_LoadCharDataFromOpenNarc(NARC *narc, s32 memberNo, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, enum HeapID heapID);
void GfGfxLoader_LoadScrnDataFromOpenNarc(NARC *narc, s32 memberNo, BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 szByte, BOOL isCompressed, enum HeapID heapID);
void GfGfxLoader_GXLoadPalFromOpenNarc(NARC *narc, s32 memberNo, enum GFPalLoadLocation location, enum GFPalSlotOffset palSlotOffset, u32 szByte, enum HeapID heapID);
void GfGfxLoader_GXLoadPalWithSrcOffsetFromOpenNarc(NARC *narc, s32 memberNo, enum GFPalLoadLocation location, u32 srcOffset, enum GFPalSlotOffset palSlotOffset, u32 szByte, enum HeapID heapID);
void GfGfxLoader_PartiallyLoadPaletteFromOpenNarc(NARC *narc, s32 memberNo, NNS_G2D_VRAM_TYPE type, u32 baseAddr, enum HeapID heapID, struct NNSG2dImagePaletteProxy *pPltProxy);
u32 GfGfxLoader_LoadImageMappingFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, GFBgLayer layer, u32 szByte, NNS_G2D_VRAM_TYPE type, u32 baseAddr, enum HeapID heapID, NNSG2dImageProxy *pImgProxy);
void *GfGfxLoader_GetCharDataFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dCharacterData **ppCharData, enum HeapID heapID);
void *GfGfxLoader_GetScrnDataFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dScreenData **ppScrnData, enum HeapID heapID);
void *GfGfxLoader_GetPlttDataFromOpenNarc(NARC *narc, s32 memberNo, NNSG2dPaletteData **ppPlttData, enum HeapID heapID);
void *GfGfxLoader_GetCellBankFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dCellDataBank **ppCellBank, enum HeapID heapID);
void *GfGfxLoader_GetAnimBankFromOpenNarc(NARC *narc, s32 memberNo, BOOL isCompressed, NNSG2dAnimBankData **ppAnimBank, enum HeapID heapID);
void *GfGfxLoader_LoadFromOpenNarc(NARC *narc, s32 fileId, BOOL isCompressed, enum HeapID heapID, BOOL atEnd);
void *GfGfxLoader_LoadFromOpenNarc_GetSizeOut(NARC *narc, s32 fileId, BOOL isCompressed, enum HeapID heapID, BOOL atEnd, u32 *sizeOut);

#endif // POKEHEARTGOLD_GF_GFX_LOADER_H
