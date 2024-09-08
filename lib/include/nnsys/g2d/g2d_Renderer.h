#ifndef NNSYS_G2D_G2D_RENDERER_H_
#define NNSYS_G2D_G2D_RENDERER_H_

#include <nnsys/g2d/fmt/g2d_Cell_data.h>
#include <nnsys/g2d/g2d_CellAnimation.h>
#include <nnsys/g2d/g2d_Image.h>
#include <nnsys/g2d/g2d_MultiCellAnimation.h>
#include <nnsys/g2d/g2d_PaletteTable.h>
#include <nnsys/g2d/g2d_RendererCore.h>
#include <nnsys/g2d/g2d_Vec_data.h>

struct NNSG2dRendererInstance;
struct NNSG2dRenderSurface;

typedef enum NNSG2dRendererOverwriteParam {
    NNS_G2D_RND_OVERWRITE_NONE        = 0x0,
    NNS_G2D_RND_OVERWRITE_PRIORITY    = 0x1,
    NNS_G2D_RND_OVERWRITE_PLTTNO      = 0x2,
    NNS_G2D_RND_OVERWRITE_MOSAIC      = 0x4,
    NNS_G2D_RND_OVERWRITE_OBJMODE     = 0x8,
    NNS_G2D_RND_OVERWRITE_PLTTNO_OFFS = 0x10,
    NNS_G2D_RND_OVERWRITE_MAX
} NNSG2dRendererOverwriteParam;

typedef BOOL (*NNSG2dRndCellCullingFunction)(const NNSG2dCellData *pCell, const MtxFx32 *pMtx, const NNSG2dViewRect *pViewRec);

typedef void (*NNSG2dRndDrawCellCallBack)(struct NNSG2dRendererInstance *pRend, struct NNSG2dRenderSurface *pSurface, const NNSG2dCellData *pCell, const MtxFx32 *pMtx);

typedef void (*NNSG2dRndDrawOamCallBack)(struct NNSG2dRendererInstance *pRend, struct NNSG2dRenderSurface *pSurface, const NNSG2dCellData *pCell, u16 oamIdx, const MtxFx32 *pMtx);

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
    void *pNextSurface;
    NNSG2dRndCellCullingFunction pFuncVisibilityCulling;
    NNSG2dRndDrawCellCallBack pBeforeDrawCellBackFunc;
    NNSG2dRndDrawCellCallBack pAfterDrawCellBackFunc;
    NNSG2dRndDrawOamCallBack pBeforeDrawOamBackFunc;
    NNSG2dRndDrawOamCallBack pAfterDrawOamBackFunc;
} NNSG2dRenderSurface;

typedef struct NNSG2dRendererInstance {
    NNSG2dRndCoreInstance rendererCore;
    NNSG2dRenderSurface *pTargetSurfaceList;
    NNSG2dRenderSurface *pCurrentSurface;
    const NNSG2dPaletteSwapTable *pPaletteSwapTbl;
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

static inline void NNS_G2dSetRendererOverwriteEnable(NNSG2dRendererInstance *pRnd, NNSG2dRendererOverwriteParam flag) {
    pRnd->overwriteEnableFlag |= flag;
}

static inline void NNS_G2dSetRendererOverwriteDisable(NNSG2dRendererInstance *pRnd, NNSG2dRendererOverwriteParam flag) {
    pRnd->overwriteEnableFlag &= ~flag;
}

static inline BOOL NNS_G2dIsRendererOverwriteEnable(const NNSG2dRendererInstance *pRnd, NNSG2dRendererOverwriteParam flag) {
    return (BOOL)(pRnd->overwriteEnableFlag & flag);
}

static inline void NNS_G2dSetRendererOverwritePriority(NNSG2dRendererInstance *pRend, u16 Priority) {
    pRend->overwritePriority = Priority;
}

static inline u16 NNS_G2dGetRendererOverwritePriority(const NNSG2dRendererInstance *pRend) {
    return pRend->overwritePriority;
}

static inline void NNS_G2dSetRendererOverwritePlttNo(NNSG2dRendererInstance *pRend, u16 plttNo) {
    pRend->overwritePlttNo = plttNo;
}

static inline u16 NNS_G2dGetRendererOverwritePlttNo(const NNSG2dRendererInstance *pRend) {
    return pRend->overwritePlttNo;
}

static inline void NNS_G2dSetRendererOverwritePlttNoOffset(NNSG2dRendererInstance *pRend, u16 plttNoOffset) {
    pRend->overwritePlttNoOffset = plttNoOffset;
}

static inline u16 NNS_G2dGetRendererOverwritePlttNoOffset(const NNSG2dRendererInstance *pRend) {
    return pRend->overwritePlttNoOffset;
}

static inline void NNS_G2dSetRendererOverwriteMosaicFlag(NNSG2dRendererInstance *pRend, BOOL overwriteMosaicFlag) {
    pRend->overwriteMosaicFlag = overwriteMosaicFlag;
}

static inline BOOL NNS_G2dGetRendererOverwriteMosaicFlag(const NNSG2dRendererInstance *pRend) {
    return pRend->overwriteMosaicFlag;
}

static inline void NNS_G2dSetRendererOverwriteOBJMode(NNSG2dRendererInstance *pRend, GXOamMode overwriteObjMode) {
    pRend->overwriteObjMode = overwriteObjMode;
}

static inline GXOamMode NNS_G2dGetRendererOverwriteOBJMode(const NNSG2dRendererInstance *pRend) {
    return pRend->overwriteObjMode;
}

void NNS_G2dInitRenderer(NNSG2dRendererInstance *pRend);

void NNS_G2dSetRendererImageProxy(NNSG2dRendererInstance *pRend, const NNSG2dImageProxy *pImgProxy, const NNSG2dImagePaletteProxy *pPltProxy);

void NNS_G2dBeginRendering(NNSG2dRendererInstance *pRendererInstance);
void NNS_G2dBeginRenderingEx(NNSG2dRendererInstance *pRendererInstance, u32 opzHint);

void NNS_G2dDrawCell(const NNSG2dCellData *pCell);
void NNS_G2dDrawCellAnimation(const NNSG2dCellAnimation *pCellAnim);
void NNS_G2dDrawMultiCell(const NNSG2dMultiCellInstance *pMC);
void NNS_G2dDrawMultiCellAnimation(const NNSG2dMultiCellAnimation *pMCAnim);

void NNS_G2dEndRendering();

void NNS_G2dPushMtx();
void NNS_G2dPopMtx();
void NNS_G2dTranslate(fx32 x, fx32 y, fx32 z);
void NNS_G2dSetTrans(fx32 x, fx32 y, fx32 z);
void NNS_G2dScale(fx32 x, fx32 y, fx32 z);
void NNS_G2dRotZ(fx32 sin, fx32 cos);

static inline void NNS_G2dSetRendererSpriteZoffset(NNSG2dRendererInstance *pRend, fx32 spriteZoffset) {
    pRend->spriteZoffsetStep = spriteZoffset;
}

#endif // NNSYS_G2D_G2D_RENDERER_H_
