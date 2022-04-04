#ifndef NNSYS_G2D_G2D_RENDERER_H_
#define NNSYS_G2D_G2D_RENDERER_H_

struct NNSG2dRendererInstance;
struct NNSG2dRenderSurface;

typedef BOOL(*NNSG2dRndCellCullingFunction)(const NNSG2dCellData* pCell, const MtxFx32* pMtx, const NNSG2dViewRect* pViewRec);

typedef void(*NNSG2dRndDrawCellCallBack)(struct NNSG2dRendererInstance* pRend, struct NNSG2dRenderSurface* pSurface, const NNSG2dCellData* pCell, const MtxFx32* pMtx);

typedef void(*NNSG2dRndDrawOamCallBack)(struct NNSG2dRendererInstance* pRend, struct NNSG2dRenderSurface* pSurface, const NNSG2dCellData* pCell, u16 oamIdx, const MtxFx32* pMtx);

typedef struct NNSG2dRenderSurface {
    union {
        NNSG2dRndCoreSurface coreSurface;
        struct {
            NNSG2dViewRect viewRect;
            BOOL bActive;
            NNSG2dSurfaceType type;
            NNSG2dRndCoreDrawCellCallBack pBeforeCoreDrawCellBack;
            NNSG2dRndCoreDrawCellCallBack pAfterCoreDrawCellBack;
            NNSG2dRndCoreDrawOamCallBack pBeforeCoreDrawOamBack;
            NNSG2dRndCoreDrawOamCallBack pAfterCoreDrawOamBack;
        };
    };
    NNSG2dOamRegisterFunction pFuncOamRegister;
    NNSG2dAffineRegisterFunction pFuncOamAffineRegister;
    void* pNextSurface;
    NNSG2dRndCellCullingFunction pFuncVisibilityCulling;
    NNSG2dRndDrawCellCallBack pBeforeDrawCellBackFunc;
    NNSG2dRndDrawCellCallBack pAfterDrawCellBackFunc;
    NNSG2dRndDrawOamCallBack pBeforeDrawOamBackFunc;
    NNSG2dRndDrawOamCallBack pAfterDrawOamBackFunc;
} NNSG2dRenderSurface;

typedef struct NNSG2dRendererInstance {
    NNSG2dRndCoreInstance rendererCore;
    NNSG2dRenderSurface* pTargetSurfaceList;
    NNSG2dRenderSurface* pCurrentSurface;
    const NNSG2dPaletteSwapTable* pPaletteSwapTbl;
    u32 opzHint;
    fx32 spriteZoffsetStep;
    u32 overwriteEnableFlag;
    u16 overwritePriority;
    u16 overwritePlttNo;
    GXOamMode overwriteObjMode;
    BOOL overwriteMosaicFlag;
    u16 overwritePlttNoOffset;
    u16 pad16_;
} NNSG2dRendererInstance;

#endif //NNSYS_G2D_G2D_RENDERER_H_
