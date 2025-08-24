#include "gf_3d_render.h"

#include "global.h"

#include "gf_3d_vramman.h"
#include "gf_gfx_planes.h"

static GF3DVramMan *sSimple3DVramManager;

static void getFirstMdlFromSet(NNSG3dResMdl **ppMdl, NNSG3dResFileHeader **ppHeader);
static void initializeSimple3DVramManager(void);

static void getFirstMdlFromSet(NNSG3dResMdl **ppMdl, NNSG3dResFileHeader **ppHeader) {
    NNSG3dResTex *tex = NNS_G3dGetTex(*ppHeader);
    if (tex != NULL && !GF3dRender_ResTexIsLoaded(tex)) {
        DC_FlushRange(*ppHeader, (*ppHeader)->fileSize);
        NNS_G3dResDefaultSetup(*ppHeader);
    }

    NNSG3dResMdlSet *mdlSet = NNS_G3dGetMdlSet(*ppHeader);
    *ppMdl = NNS_G3dGetMdlByIdx(mdlSet, 0);
}

void GF3dRender_InitObjFromHeader(NNSG3dRenderObj *obj, NNSG3dResMdl **p_mdl, NNSG3dResFileHeader **p_header) {
    getFirstMdlFromSet(p_mdl, p_header);
    GF_ASSERT(p_mdl != NULL);
    NNS_G3dRenderObjInit(obj, *p_mdl);
}

BOOL GF3dRender_ResTexIsLoaded(NNSG3dResTex *tex) {
    return (tex->texInfo.flag & NNS_G3D_RESTEX_LOADED) || (tex->tex4x4Info.flag & NNS_G3D_RESTEX_LOADED);
}

void GF3dRender_DrawModel(NNSG3dRenderObj *obj, const VecFx32 *translation, const MtxFx33 *rotation, const VecFx32 *scale) {
    NNS_G3dGlbSetBaseTrans(translation);
    NNS_G3dGlbSetBaseRot(rotation);
    NNS_G3dGlbSetBaseScale(scale);
    NNS_G3dGlbFlushP();
    NNS_G3dDraw(obj);
}

void GF3dRender_InitSimpleManager(enum HeapID heapID) {
    sSimple3DVramManager = GF_3DVramMan_Create(heapID, 0, 2, 0, 4, initializeSimple3DVramManager);
}

static void initializeSimple3DVramManager(void) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
    G2_SetBG0Priority(1);
    G3X_SetShading(GX_SHADING_TOON);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_EdgeMarking(FALSE);
    G3X_SetFog(FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
    G3X_SetClearColor(RGB_BLACK, 0, GF_GX_CLEARCOLORDEPTH_MAX, 0x3F, FALSE);
    G3_ViewPort(0, 0, 255, 191);
}

void GF3dRender_DeleteSimpleManager(void) {
    GF_3DVramMan_Delete(sSimple3DVramManager);
}

BOOL GF3dRender_BindModelSet(NNSG3dResFileHeader *hdr, const NNSG3dResTex *tex) {
    NNSG3dResMdlSet *mdlSet = NNS_G3dGetMdlSet(hdr);
    if (tex != NULL) {
        NNS_G3dBindMdlSet(mdlSet, tex);
        return TRUE;
    }

    return FALSE;
}

BOOL GF3dRender_AllocAndLoadTexResources(NNSG3dResTex *tex) {
    if (tex == NULL) {
        return FALSE;
    }

    tex->texInfo.vramKey = 0;

    u32 texRequiredSize;
    u32 tex4x4RequiredSize;
    u32 plttRequiredSize;
    BOOL hasTexVram = TRUE;
    BOOL hasTex4x4Vram = TRUE;
    BOOL hasPlttVram = TRUE;

    NNSGfdTexKey texKey;
    NNSGfdTexKey tex4x4Key;
    NNSGfdPlttKey plttKey;

    if (tex != NULL) {
        texRequiredSize = NNS_G3dTexGetRequiredSize(tex);
        tex4x4RequiredSize = NNS_G3dTex4x4GetRequiredSize(tex);
        plttRequiredSize = NNS_G3dPlttGetRequiredSize(tex);

        if (texRequiredSize != 0) {
            texKey = NNS_GfdAllocTexVram(texRequiredSize, FALSE, 0);
            if (texKey == 0) {
                hasTexVram = FALSE;
            }
        } else {
            texKey = 0;
        }

        if (tex4x4RequiredSize != 0) {
            tex4x4Key = NNS_GfdAllocTexVram(tex4x4RequiredSize, TRUE, 0);
            if (tex4x4Key == 0) {
                hasTex4x4Vram = FALSE;
            }
        } else {
            tex4x4Key = 0;
        }

        if (plttRequiredSize != 0) {
            // BUG: Should use field .plttInfo instead of .tex4x4Info?
            plttKey = NNS_GfdAllocPlttVram(plttRequiredSize, tex->tex4x4Info.flag & NNS_G3D_RESPLTT_USEPLTT4, 0);
            if (plttKey == 0) {
                hasPlttVram = FALSE;
            }
        } else {
            plttKey = 0;
        }

        if (!hasTexVram) {
            GF_ASSERT(!NNS_GfdFreeTexVram(texKey));
            return FALSE;
        }
        if (!hasTex4x4Vram) {
            GF_ASSERT(!NNS_GfdFreeTexVram(tex4x4Key));
            return FALSE;
        }
        if (!hasPlttVram) {
            GF_ASSERT(!NNS_GfdFreePlttVram(plttKey));
            return FALSE;
        }

        NNS_G3dTexSetTexKey(tex, texKey, tex4x4Key);
        NNS_G3dPlttSetPlttKey(tex, plttKey);
        DC_FlushRange(tex, tex->header.size);
        GF3dRender_LoadTexture(tex, TRUE);
        GF3dRender_LoadPalette(tex, TRUE);
    }
    return TRUE;
}

// temporary routines
void GF3dRender_LoadTexture(NNSG3dResTex *pTex, BOOL exec_begin_end) {
    NNS_G3dTexLoad(pTex, exec_begin_end);
}

void GF3dRender_LoadPalette(NNSG3dResTex *pTex, BOOL exec_begin_end) {
    NNS_G3dPlttLoad(pTex, exec_begin_end);
}
