#ifndef NNSYS_G2D_G2D_RENDERERCORE_H_
#define NNSYS_G2D_G2D_RENDERERCORE_H_

#define MtxCache_NOT_AVAILABLE                  0xFFFF
#define MtxCache_NOT_AVAILABLE_ForMemFill       0xFFFFFFFF
#define NNS_G2D_NUMBER_OF_2DGRAPHICS_ENGINE     2
#define NNS_G2D_RNDCORE_INTERNAL_OAMBUFFER_SIZE 128
#define NNS_G2D_OAMFLIP_PATTERN_NUM             0x04

struct NNSG2dRndCoreInstance;

typedef struct NNSG2dRndCore2DMtxCache {
    MtxFx22 m22;
    u16 affineIndex[NNS_G2D_OAMFLIP_PATTERN_NUM][NNS_G2D_NUMBER_OF_2DGRAPHICS_ENGINE];
} NNSG2dRndCore2DMtxCache;

typedef struct NNSG2dViewRect {
    NNSG2dFVec2 posTopLeft;
    NNSG2dFVec2 sizeView;
} NNSG2dViewRect;

typedef enum NNSG2dSurfaceType {
    NNS_G2D_SURFACETYPE_MAIN3D = 0x00,
    NNS_G2D_SURFACETYPE_MAIN2D = 0x01,
    NNS_G2D_SURFACETYPE_SUB2D  = 0x02,
    NNS_G2D_SURFACETYPE_MAX    = 0x03
} NNSG2dSurfaceType;

typedef enum NNSG2dRendererAffineTypeOverwiteMode {
    NNS_G2D_RND_AFFINE_OVERWRITE_NONE,
    NNS_G2D_RND_AFFINE_OVERWRITE_NORMAL,
    NNS_G2D_RND_AFFINE_OVERWRITE_DOUBLE
} NNSG2dRendererAffineTypeOverwiteMode;

typedef void(*NNSG2dRndCoreDrawCellCallBack)(struct NNSG2dRndCoreInstance* pRend, const NNSG2dCellData* pCell);

typedef void(*NNSG2dRndCoreDrawOamCallBack)(struct NNSG2dRndCoreInstance* pRend, const NNSG2dCellData* pCell, u16 oamIdx);

typedef BOOL (*NNSG2dOamRegisterFunction) (const GXOamAttr* pOam, u16 affineIndex, BOOL bDoubleAffine);

typedef u16 (*NNSG2dAffineRegisterFunction) (const MtxFx22* mtx);

typedef struct NNSG2dRndCoreSurface {
    NNSG2dViewRect viewRect;
    BOOL bActive;
    NNSG2dSurfaceType type;
    NNSG2dRndCoreDrawCellCallBack pBeforeDrawCellBackFunc;
    NNSG2dRndCoreDrawCellCallBack pAfterDrawCellBackFunc;
    NNSG2dRndCoreDrawOamCallBack pBeforeDrawOamBackFunc;
    NNSG2dRndCoreDrawOamCallBack pAfterDrawOamBackFunc;
} NNSG2dRndCoreSurface;

typedef struct NNSG2dRndCoreInstance {
    NNSG2dRndCoreSurface* pCurrentTargetSurface;
    NNSG2dRendererAffineTypeOverwiteMode affineOverwriteMode;
    const struct NNSG2dImageProxy* pImgProxy;
    const struct NNSG2dImagePaletteProxy* pPltProxy;
    u32 base2DCharOffset;
    u32 baseTexAddr3D;
    u32 basePltAddr3D;
    NNSG2dOamRegisterFunction pFuncOamRegister;
    NNSG2dAffineRegisterFunction pFuncOamAffineRegister;
    u32 flipFlag;
    NNSG2dRndCore2DMtxCache* pCurrentMtxCacheFor2D;
    const MtxFx32* pCurrentMxt;
    BOOL bDrawEnable;
    fx32 zFor3DSoftwareSprite;
    GXOamAttr currentOam;
    MtxFx43 mtxFor3DGE;
} NNSG2dRndCoreInstance;

#endif //NNSYS_G2D_G2D_RENDERERCORE_H_
