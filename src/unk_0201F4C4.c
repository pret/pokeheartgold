#include "global.h"
#include "unk_0201F4C4.h"
#include "gf_3d_vramman.h"
#include "gf_gfx_planes.h"

static GF3DVramMan *_021D15A0;

static void sub_0201F4C4(NNSG3dResMdl **ppMdl, NNSG3dResFileHeader **ppHeader);
static void sub_0201F5B8(void);

static void sub_0201F4C4(NNSG3dResMdl **ppMdl, NNSG3dResFileHeader **ppHeader) {
    NNSG3dResTex *tex = NNS_G3dGetTex(*ppHeader);
    if (tex != NULL && !sub_0201F53C(tex)) {
        DC_FlushRange(*ppHeader, (*ppHeader)->fileSize);
        NNS_G3dResDefaultSetup(*ppHeader);
    }

    NNSG3dResMdlSet *mdlSet = NNS_G3dGetMdlSet(*ppHeader);
    *ppMdl = NNS_G3dGetMdlByIdx(mdlSet, 0);
}

void sub_0201F51C(NNSG3dRenderObj *obj, NNSG3dResMdl **p_mdl, NNSG3dResFileHeader **p_header) {
    sub_0201F4C4(p_mdl, p_header);
    GF_ASSERT(p_mdl != NULL);
    NNS_G3dRenderObjInit(obj, *p_mdl);
}

BOOL sub_0201F53C(NNSG3dResTex *tex) {
    return (tex->texInfo.flag & NNS_G3D_RESTEX_LOADED) || (tex->tex4x4Info.flag & NNS_G3D_RESTEX_LOADED);
}

void Draw3dModel(NNSG3dRenderObj *obj, const VecFx32 *translation, const MtxFx33 *rotation, const VecFx32 *scale) {
    NNS_G3dGlbSetBaseTrans(translation);
    NNS_G3dGlbSetBaseRot(rotation);
    NNS_G3dGlbSetBaseScale(scale);
    NNS_G3dGlbFlushP();
    NNS_G3dDraw(obj);
}

void sub_0201F590(HeapID heapID) {
    _021D15A0 = GF_3DVramMan_Create(heapID, 0, 2, 0, 4, sub_0201F5B8);
}

static void sub_0201F5B8(void) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
    G2_SetBG0Priority(1);
    G3X_SetShading(GX_SHADING_TOON);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_EdgeMarking(FALSE);
    G3X_SetFog(FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
    G3X_SetClearColor(RGB_BLACK, 0, 0x7FFF, 0x3F, FALSE);
    G3_ViewPort(0, 0, 255, 191);
}

void sub_0201F63C(void) {
    GF_3DVramMan_Delete(_021D15A0);
}

BOOL Bind3dModelSet(NNSG3dResFileHeader *hdr, const NNSG3dResTex *tex) {
    NNSG3dResMdlSet *mdlSet = NNS_G3dGetMdlSet(hdr);
    if (tex != NULL) {
        NNS_G3dBindMdlSet(mdlSet, tex);
        return TRUE;
    }

    return FALSE;
}

BOOL AllocAndLoad3dTexResources(NNSG3dResTex *tex) {
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
        Call_NNS_G3dTexLoad(tex, TRUE);
        Call_NNS_G3dPlttLoad(tex, TRUE);
    }
    return TRUE;
}

// temporary routines
void Call_NNS_G3dTexLoad(NNSG3dResTex *pTex, BOOL exec_begin_end) {
    NNS_G3dTexLoad(pTex, exec_begin_end);
}
void Call_NNS_G3dPlttLoad(NNSG3dResTex *pTex, BOOL exec_begin_end) {
    NNS_G3dPlttLoad(pTex, exec_begin_end);
}
