#ifndef NNSYS_G2D_G2D_IMAGE_H_
#define NNSYS_G2D_G2D_IMAGE_H_

#include <nitro.h>
#include <nnsys/g2d/fmt/g2d_Character_data.h>

typedef enum NNS_G2D_VRAM_TYPE {
    NNS_G2D_VRAM_TYPE_3DMAIN = 0,
    NNS_G2D_VRAM_TYPE_2DMAIN = 1,
    NNS_G2D_VRAM_TYPE_2DSUB  = 2,
    NNS_G2D_VRAM_TYPE_MAX    = 3
} NNS_G2D_VRAM_TYPE;

typedef struct NNSG2dVRamLocation {
    u32 baseAddrOfVram[NNS_G2D_VRAM_TYPE_MAX];
} NNSG2dVRamLocation; // size: 0xC

typedef struct NNSG2dImageAttr {
    GXTexSizeS sizeS;
    GXTexSizeT sizeT;
    GXTexFmt fmt;
    BOOL bExtendedPlt;
    GXTexPlttColor0 plttUse;
    GXOBJVRamModeChar mappingType;
} NNSG2dImageAttr; // size: 0x18

typedef struct NNSG2dImageProxy {
    NNSG2dVRamLocation vramLocation;
    NNSG2dImageAttr attr;
} NNSG2dImageProxy; // size: 0x24

typedef struct NNSG2dImagePaletteProxy {
    GXTexFmt fmt;
    BOOL bExtendedPlt;
    NNSG2dVRamLocation vramLocation;
} NNSG2dImagePaletteProxy; // size: 0x14

void NNS_G2dInitImageProxy(NNSG2dImageProxy *pImg);
void NNS_G2dLoadPaletteEx(const NNSG2dPaletteData *pSrcData, const NNSG2dPaletteCompressInfo *pCmpInfo, u32 addr, NNS_G2D_VRAM_TYPE type, NNSG2dImagePaletteProxy *pPltProxy);
void NNS_G2dLoadPalette(const NNSG2dPaletteData *pSrcData, u32 addr, NNS_G2D_VRAM_TYPE type, NNSG2dImagePaletteProxy *pPltProxy);
void NNS_G2dLoadImage1DMapping(const NNSG2dCharacterData *pSrcData, u32 baseAddr, NNS_G2D_VRAM_TYPE type, NNSG2dImageProxy *pImgProxy);
void NNS_G2dLoadImage2DMapping(const NNSG2dCharacterData *pSrcData, u32 baseAddr, NNS_G2D_VRAM_TYPE type, NNSG2dImageProxy *pImgProxy);
u32 NNS_G2dGetImageLocation(const NNSG2dImageProxy *pImg, NNS_G2D_VRAM_TYPE type);
u32 NNS_G2dGetImagePaletteLocation(const NNSG2dImagePaletteProxy *pImg, NNS_G2D_VRAM_TYPE type);
void NNS_G2dLoadImageVramTransfer(const NNSG2dCharacterData *pSrcData, u32 baseAddr, NNS_G2D_VRAM_TYPE type, NNSG2dImageProxy *pImgProxy);
void NNS_G2dInitImagePaletteProxy(NNSG2dImagePaletteProxy *pImg);

static inline void NNS_G2dSetImageExtPaletteFlag(NNSG2dImageProxy *pImgProxy, BOOL bUseExtPlt) {
    pImgProxy->attr.bExtendedPlt = bUseExtPlt;
}

#endif // NNSYS_G2D_G2D_IMAGE_H_
