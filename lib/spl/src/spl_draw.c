
#include "nitro/types.h"
#include <nitro/fx/fx.h>
#include <nitro/fx/fx_const.h>
#include <nitro/fx/fx_mtx43.h>
#include <nitro/fx/fx_trig.h>
#include <nitro/gx/g3.h>
#include <nitro/gx/g3imm.h>

#include "spl_internal.h"
#include "spl_manager.h"
#include "spl_particle.h"
#include "spl_resource.h"

typedef void (*RotFunc)(fx32 sin, fx32 cos, MtxFx43 *rot);
typedef void (*DrawPlaneFunc)(fx16 s, fx16 t, fx16 offsetX, fx16 offsetY);

static void SPLUtil_DrawXYPlane(fx16 s, fx16 t, fx16 offsetX, fx16 offsetY);
static void SPLUtil_DrawXZPlane(fx16 s, fx16 t, fx16 offsetX, fx16 offsetZ);
static void SPLUtil_RotateXYZ(fx32 sin, fx32 cos, MtxFx43 *mat);
static void SPLUtil_RotateY(fx32 sin, fx32 cos, MtxFx43 *mat);

static DrawPlaneFunc sPlaneDrawingFunctions[2] = {
    SPLUtil_DrawXYPlane,
    SPLUtil_DrawXZPlane,
};

static RotFunc sRotationFunctions[2] = {
    SPLUtil_RotateY,
    SPLUtil_RotateXYZ,
};

// Returns `TRUE` if the particle should not be drawn
static inline BOOL SPLDraw_Setup(const SPLParticle *ptcl, const SPLManager *mgr)
{
    fx32 alpha = (fx32)(ptcl->visibility.baseAlpha * (ptcl->visibility.animAlpha + 1)) >> 5;

    G3_PolygonAttr(
        GX_LIGHTMASK_NONE,
        GX_POLYGONMODE_MODULATE,
        GX_CULL_NONE,
        ptcl->visibility.currentPolygonID,
        alpha,
        mgr->miscPolygonAttr);

    reg_G3_POLYGON_ATTR; // No idea why but this is needed to match

    return alpha == 0;
}

static void SPLUtil_DrawXYPlane(fx16 s, fx16 t, fx16 x, fx16 y)
{
    G3_Begin(GX_BEGIN_QUADS);

    G3_TexCoord(0, 0);
    G3_Vtx10(x - FX32_ONE, y + FX32_ONE, 0);

    G3_TexCoord(s, 0);
    G3_Vtx10(x + FX32_ONE, y + FX32_ONE, 0);

    G3_TexCoord(s, t);
    G3_Vtx10(x + FX32_ONE, y - FX32_ONE, 0);

    G3_TexCoord(0, t);
    G3_Vtx10(x - FX32_ONE, y - FX32_ONE, 0);

    G3_End();
}

static void SPLUtil_DrawXZPlane(fx16 s, fx16 t, fx16 x, fx16 z)
{
    G3_Begin(GX_BEGIN_QUADS);

    G3_TexCoord(0, 0);
    G3_Vtx10(x - FX32_ONE, 0, z + FX32_ONE);

    G3_TexCoord(s, 0);
    G3_Vtx10(x + FX32_ONE, 0, z + FX32_ONE);

    G3_TexCoord(s, t);
    G3_Vtx10(x + FX32_ONE, 0, z - FX32_ONE);

    G3_TexCoord(0, t);
    G3_Vtx10(x - FX32_ONE, 0, z - FX32_ONE);

    G3_End();
}

static void SPLUtil_RotateXYZ(fx32 sin, fx32 cos, MtxFx43 *mat)
{
    fx32 C, Sm, Sp;

    C = FX_MUL(FX32_ONE - cos, FX32_CONST(1 / 3.0));
    Sm = C + FX_MUL(sin, FX32_SQRT1_3);
    Sp = C - FX_MUL(sin, FX32_SQRT1_3);
    C += cos;

    mat->m[0][0] = C;
    mat->m[1][0] = Sm;
    mat->m[2][0] = Sp;
    mat->m[3][0] = 0;
    mat->m[0][1] = Sp;
    mat->m[1][1] = C;
    mat->m[2][1] = Sm;
    mat->m[3][1] = 0;
    mat->m[0][2] = Sm;
    mat->m[1][2] = Sp;
    mat->m[2][2] = C;
    mat->m[3][2] = 0;
}

static void SPLUtil_RotateY(fx32 sin, fx32 cos, MtxFx43 *mat)
{
    mat->m[0][0] = cos;
    mat->m[1][0] = 0;
    mat->m[2][0] = sin;
    mat->m[3][0] = 0;
    mat->m[0][1] = 0;
    mat->m[1][1] = FX32_ONE;
    mat->m[2][1] = 0;
    mat->m[3][1] = 0;
    mat->m[0][2] = -sin;
    mat->m[1][2] = 0;
    mat->m[2][2] = cos;
    mat->m[3][2] = 0;
}

void SPLDraw_Billboard(SPLManager *mgr, SPLParticle *ptcl)
{
    VecFx32 trs;
    fx32 sclX, sclY;
    MtxFx43 load;

    const MtxFx43 *cmr = mgr->renderState.viewMatrix;
    fx32 aspect = mgr->renderState.emitter->resource->header->aspectRatio;
    fx16 animScale = ptcl->animScale;
    GXRgb ptclCol = ptcl->color;
    GXRgb emtrCol = mgr->renderState.emitter->color;
    u8 scaleAnimDir = mgr->renderState.emitter->resource->header->misc.scaleAnimDir;

    if (SPLDraw_Setup(ptcl, mgr)) {
        return;
    }

    sclY = ptcl->baseScale;
    sclX = FX_MUL(sclY, aspect);

    if (scaleAnimDir == SPL_SCALE_ANIM_DIR_XY) {
        sclX = FX_MUL(sclX, animScale);
        sclY = FX_MUL(sclY, animScale);
    } else if (scaleAnimDir == SPL_SCALE_ANIM_DIR_X) {
        sclX = FX_MUL(sclX, animScale);
    } else { // SPL_SCALE_ANIM_DIR_Y
        sclY = FX_MUL(sclY, animScale);
    }

    if (!mgr->renderState.emitter->resource->header->flags.useViewSpace) {
        trs.x = ptcl->position.x + ptcl->emitterPos.x;
        trs.y = ptcl->position.y + ptcl->emitterPos.y;
        trs.z = ptcl->position.z + ptcl->emitterPos.z;
        MTX_MultVec43(&trs, cmr, &trs);

        fx32 sin = FX_SinIdx(ptcl->rotation);
        fx32 cos = FX_CosIdx(ptcl->rotation);
        load.m[0][0] = FX_MUL(cos, sclX);
        load.m[0][1] = FX_MUL(sin, sclX);
        load.m[0][2] = 0;
        load.m[1][0] = FX_MUL(-sin, sclY);
        load.m[1][1] = FX_MUL(cos, sclY);
        load.m[1][2] = 0;
        load.m[2][0] = 0;
        load.m[2][1] = 0;
        load.m[2][2] = FX32_ONE;
        load.m[3][0] = trs.x;
        load.m[3][1] = trs.y;
        load.m[3][2] = trs.z;

        G3_Identity();
        G3_MultMtx43(&load);
    } else {
        trs.x = ptcl->position.x + ptcl->emitterPos.x - mgr->renderState.emitter->resource->header->emitterBasePos.x;
        trs.y = ptcl->position.y + ptcl->emitterPos.y - mgr->renderState.emitter->resource->header->emitterBasePos.y;
        trs.z = ptcl->position.z + ptcl->emitterPos.z - mgr->renderState.emitter->resource->header->emitterBasePos.z;
        MTX_MultVec43(&trs, cmr, &trs);

        fx32 sin = FX_SinIdx(ptcl->rotation);
        fx32 cos = FX_CosIdx(ptcl->rotation);
        load.m[0][0] = FX_MUL(cos, sclX);
        load.m[0][1] = FX_MUL(sin, sclX);
        load.m[0][2] = 0;
        load.m[1][0] = FX_MUL(-sin, sclY);
        load.m[1][1] = FX_MUL(cos, sclY);
        load.m[1][2] = 0;
        load.m[2][0] = 0;
        load.m[2][1] = 0;
        load.m[2][2] = FX32_ONE;
        load.m[3][0] = trs.x;
        load.m[3][1] = trs.y;
        load.m[3][2] = trs.z;

        G3_Identity();
        G3_Translate(
            mgr->renderState.emitter->resource->header->emitterBasePos.x,
            mgr->renderState.emitter->resource->header->emitterBasePos.y,
            mgr->renderState.emitter->resource->header->emitterBasePos.z);
        G3_MultMtx43(&load);
    }

    G3_Color(GX_RGB(
        GX_RGB_R_(ptclCol) * GX_RGB_R_(emtrCol) >> 5,
        GX_RGB_G_(ptclCol) * GX_RGB_G_(emtrCol) >> 15,
        GX_RGB_B_(ptclCol) * GX_RGB_B_(emtrCol) >> 25));

    SPLUtil_DrawXYPlane(
        mgr->renderState.emitter->textureS,
        mgr->renderState.emitter->textureT,
        mgr->renderState.emitter->resource->header->polygonX,
        mgr->renderState.emitter->resource->header->polygonY);
}

void SPLDraw_Child_Billboard(SPLManager *mgr, SPLParticle *ptcl)
{
    VecFx32 trs;
    fx32 sclX, sclY;
    MtxFx43 load;

    const MtxFx43 *cmr = mgr->renderState.viewMatrix;
    fx32 aspect = mgr->renderState.emitter->resource->header->aspectRatio;

    if (SPLDraw_Setup(ptcl, mgr)) {
        return;
    }

    sclY = ptcl->baseScale;
    sclX = FX_MUL(sclY, aspect);

    switch (mgr->renderState.emitter->resource->header->misc.scaleAnimDir) {
    case SPL_SCALE_ANIM_DIR_XY:
        sclX = FX_MUL(sclX, ptcl->animScale);
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_X:
        sclX = FX_MUL(sclX, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_Y:
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;
    }

    if (!mgr->renderState.emitter->resource->header->flags.useViewSpace) {
        trs.x = ptcl->position.x + ptcl->emitterPos.x;
        trs.y = ptcl->position.y + ptcl->emitterPos.y;
        trs.z = ptcl->position.z + ptcl->emitterPos.z;
        MTX_MultVec43(&trs, cmr, &trs);

        fx32 sin = FX_SinIdx(ptcl->rotation);
        fx32 cos = FX_CosIdx(ptcl->rotation);
        load.m[0][0] = FX_MUL(cos, sclX);
        load.m[0][1] = FX_MUL(sin, sclX);
        load.m[0][2] = 0;
        load.m[1][0] = FX_MUL(-sin, sclY);
        load.m[1][1] = FX_MUL(cos, sclY);
        load.m[1][2] = 0;
        load.m[2][0] = 0;
        load.m[2][1] = 0;
        load.m[2][2] = FX32_ONE;
        load.m[3][0] = trs.x;
        load.m[3][1] = trs.y;
        load.m[3][2] = trs.z;

        G3_Identity();
        G3_MultMtx43(&load);
    } else {
        trs.x = ptcl->position.x + ptcl->emitterPos.x - mgr->renderState.emitter->resource->header->emitterBasePos.x;
        trs.y = ptcl->position.y + ptcl->emitterPos.y - mgr->renderState.emitter->resource->header->emitterBasePos.y;
        trs.z = ptcl->position.z + ptcl->emitterPos.z - mgr->renderState.emitter->resource->header->emitterBasePos.z;
        MTX_MultVec43(&trs, cmr, &trs);

        fx32 sin = FX_SinIdx(ptcl->rotation);
        fx32 cos = FX_CosIdx(ptcl->rotation);
        load.m[0][0] = FX_MUL(cos, sclX);
        load.m[0][1] = FX_MUL(sin, sclX);
        load.m[0][2] = 0;
        load.m[1][0] = FX_MUL(-sin, sclY);
        load.m[1][1] = FX_MUL(cos, sclY);
        load.m[1][2] = 0;
        load.m[2][0] = 0;
        load.m[2][1] = 0;
        load.m[2][2] = FX32_ONE;
        load.m[3][0] = trs.x;
        load.m[3][1] = trs.y;
        load.m[3][2] = trs.z;

        G3_Identity();
        G3_Translate(
            mgr->renderState.emitter->resource->header->emitterBasePos.x,
            mgr->renderState.emitter->resource->header->emitterBasePos.y,
            mgr->renderState.emitter->resource->header->emitterBasePos.z);
        G3_MultMtx43(&load);
    }

    G3_Color(GX_RGB(
        GX_RGB_R_(ptcl->color) * GX_RGB_R_(mgr->renderState.emitter->color) >> 5,
        GX_RGB_G_(ptcl->color) * GX_RGB_G_(mgr->renderState.emitter->color) >> 15,
        GX_RGB_B_(ptcl->color) * GX_RGB_B_(mgr->renderState.emitter->color) >> 25));

    SPLUtil_DrawXYPlane(mgr->renderState.emitter->childTextureS, mgr->renderState.emitter->childTextureT, 0, 0);
}

void SPLDraw_DirectionalBillboard(SPLManager *mgr, SPLParticle *ptcl)
{
    VecFx32 vel_dir;
    VecFx32 trs;
    fx32 sclX, sclY;
    VecFx32 dir, look;
    MtxFx33 mat;
    MtxFx43 load;

    const MtxFx43 *cmr = mgr->renderState.viewMatrix;
    fx32 aspect = mgr->renderState.emitter->resource->header->aspectRatio;

    if (SPLDraw_Setup(ptcl, mgr)) {
        return;
    }

    sclY = ptcl->baseScale;
    sclX = FX_MUL(sclY, aspect);

    switch (mgr->renderState.emitter->resource->header->misc.scaleAnimDir) {
    case SPL_SCALE_ANIM_DIR_XY:
        sclX = FX_MUL(sclX, ptcl->animScale);
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_X:
        sclX = FX_MUL(sclX, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_Y:
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;
    }

    if (!mgr->renderState.emitter->resource->header->flags.useViewSpace) {
        trs.x = ptcl->position.x + ptcl->emitterPos.x;
        trs.y = ptcl->position.y + ptcl->emitterPos.y;
        trs.z = ptcl->position.z + ptcl->emitterPos.z;

        dir = ptcl->velocity;

        look.x = cmr->m[0][2];
        look.y = cmr->m[1][2];
        look.z = cmr->m[2][2];

        VEC_CrossProduct(&dir, &look, &dir);
        if (dir.x == 0 && dir.y == 0 && dir.z == 0) {
            return;
        }

        VEC_Normalize(&dir, &dir);
        MTX_Copy43To33(cmr, &mat);
        MTX_MultVec33(&dir, &mat, &dir);
        MTX_MultVec43(&trs, cmr, &trs);

        vel_dir = ptcl->velocity;
        VEC_Normalize(&vel_dir, &vel_dir);

        fx32 dot = FX_MUL(vel_dir.x, -cmr->m[0][2]) + FX_MUL(vel_dir.y, -cmr->m[1][2]) + FX_MUL(vel_dir.z, -cmr->m[2][2]);
        if (dot < 0) {
            dot = -dot;
        }

        dot = FX_MUL(sclY, FX_MUL(FX32_ONE - dot, (fx32)mgr->renderState.emitter->resource->header->misc.dbbScale) + FX32_ONE);
        load.m[0][0] = FX_MUL(dir.x, sclX);
        load.m[1][0] = FX_MUL(-dir.y, dot);
        load.m[2][0] = 0;
        load.m[3][0] = trs.x;
        load.m[0][1] = FX_MUL(dir.y, sclX);
        load.m[1][1] = FX_MUL(dir.x, dot);
        load.m[2][1] = 0;
        load.m[3][1] = trs.y;
        load.m[0][2] = 0;
        load.m[1][2] = 0;
        load.m[2][2] = FX32_ONE;
        load.m[3][2] = trs.z;

        G3_Identity();
        G3_MultMtx43(&load);
    } else {
        trs.x = ptcl->position.x + ptcl->emitterPos.x - mgr->renderState.emitter->resource->header->emitterBasePos.x;
        trs.y = ptcl->position.y + ptcl->emitterPos.y - mgr->renderState.emitter->resource->header->emitterBasePos.y;
        trs.z = ptcl->position.z + ptcl->emitterPos.z - mgr->renderState.emitter->resource->header->emitterBasePos.z;

        dir = ptcl->velocity;

        look.x = cmr->m[0][2];
        look.y = cmr->m[1][2];
        look.z = cmr->m[2][2];

        VEC_CrossProduct(&dir, &look, &dir);
        if (dir.x == 0 && dir.y == 0 && dir.z == 0) {
            return;
        }

        VEC_Normalize(&dir, &dir);
        MTX_Copy43To33(cmr, &mat);
        MTX_MultVec33(&dir, &mat, &dir);
        MTX_MultVec43(&trs, cmr, &trs);

        vel_dir = ptcl->velocity;
        VEC_Normalize(&vel_dir, &vel_dir);

        fx32 dot = FX_MUL(vel_dir.x, -cmr->m[0][2]) + FX_MUL(vel_dir.y, -cmr->m[1][2]) + FX_MUL(vel_dir.z, -cmr->m[2][2]);
        if (dot < 0) {
            dot = -dot;
        }

        dot = FX_MUL(sclY, FX_MUL(FX32_ONE - dot, (fx32)mgr->renderState.emitter->resource->header->misc.dbbScale) + FX32_ONE);
        load.m[0][0] = FX_MUL(dir.x, sclX);
        load.m[1][0] = FX_MUL(-dir.y, dot);
        load.m[2][0] = 0;
        load.m[3][0] = trs.x;
        load.m[0][1] = FX_MUL(dir.y, sclX);
        load.m[1][1] = FX_MUL(dir.x, dot);
        load.m[2][1] = 0;
        load.m[3][1] = trs.y;
        load.m[0][2] = 0;
        load.m[1][2] = 0;
        load.m[2][2] = FX32_ONE;
        load.m[3][2] = trs.z;

        G3_Identity();
        G3_Translate(
            mgr->renderState.emitter->resource->header->emitterBasePos.x,
            mgr->renderState.emitter->resource->header->emitterBasePos.y,
            mgr->renderState.emitter->resource->header->emitterBasePos.z);
        G3_MultMtx43(&load);
    }

    G3_Color(GX_RGB(
        GX_RGB_R_(ptcl->color) * GX_RGB_R_(mgr->renderState.emitter->color) >> 5,
        GX_RGB_G_(ptcl->color) * GX_RGB_G_(mgr->renderState.emitter->color) >> 15,
        GX_RGB_B_(ptcl->color) * GX_RGB_B_(mgr->renderState.emitter->color) >> 25));

    SPLEmitter *emtr = mgr->renderState.emitter;
    SPLUtil_DrawXYPlane(
        emtr->textureS,
        emtr->textureT,
        emtr->resource->header->polygonX,
        emtr->resource->header->polygonY);
}

void SPLDraw_Child_DirectionalBillboard(SPLManager *mgr, SPLParticle *ptcl)
{
    VecFx32 vel_dir;
    VecFx32 trs;
    fx32 sclX, sclY;
    VecFx32 dir, look;
    MtxFx33 mat;
    MtxFx43 load;

    const MtxFx43 *cmr = mgr->renderState.viewMatrix;
    fx32 aspect = mgr->renderState.emitter->resource->header->aspectRatio;

    if (SPLDraw_Setup(ptcl, mgr)) {
        return;
    }

    sclY = ptcl->baseScale;
    sclX = FX_MUL(sclY, aspect);

    switch (mgr->renderState.emitter->resource->header->misc.scaleAnimDir) {
    case SPL_SCALE_ANIM_DIR_XY:
        sclX = FX_MUL(sclX, ptcl->animScale);
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_X:
        sclX = FX_MUL(sclX, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_Y:
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;
    }

    if (!mgr->renderState.emitter->resource->header->flags.useViewSpace) {
        trs.x = ptcl->position.x + ptcl->emitterPos.x;
        trs.y = ptcl->position.y + ptcl->emitterPos.y;
        trs.z = ptcl->position.z + ptcl->emitterPos.z;

        dir = ptcl->velocity;

        look.x = cmr->m[0][2];
        look.y = cmr->m[1][2];
        look.z = cmr->m[2][2];

        VEC_CrossProduct(&dir, &look, &dir);
        if (dir.x == 0 && dir.y == 0 && dir.z == 0) {
            return;
        }

        VEC_Normalize(&dir, &dir);
        MTX_Copy43To33(cmr, &mat);
        MTX_MultVec33(&dir, &mat, &dir);
        MTX_MultVec43(&trs, cmr, &trs);

        vel_dir = ptcl->velocity;
        VEC_Normalize(&vel_dir, &vel_dir);

        fx32 dot = FX_MUL(vel_dir.x, -cmr->m[0][2]) + FX_MUL(vel_dir.y, -cmr->m[1][2]) + FX_MUL(vel_dir.z, -cmr->m[2][2]);
        if (dot < 0) {
            dot = -dot;
        }

        dot = FX_MUL(sclY, FX_MUL(FX32_ONE - dot, (fx32)mgr->renderState.emitter->resource->header->misc.dbbScale) + FX32_ONE);
        load.m[0][0] = FX_MUL(dir.x, sclX);
        load.m[1][0] = FX_MUL(-dir.y, dot);
        load.m[2][0] = 0;
        load.m[3][0] = trs.x;
        load.m[0][1] = FX_MUL(dir.y, sclX);
        load.m[1][1] = FX_MUL(dir.x, dot);
        load.m[2][1] = 0;
        load.m[3][1] = trs.y;
        load.m[0][2] = 0;
        load.m[1][2] = 0;
        load.m[2][2] = FX32_ONE;
        load.m[3][2] = trs.z;

        G3_Identity();
        G3_MultMtx43(&load);
    } else {
        trs.x = ptcl->position.x + ptcl->emitterPos.x - mgr->renderState.emitter->resource->header->emitterBasePos.x;
        trs.y = ptcl->position.y + ptcl->emitterPos.y - mgr->renderState.emitter->resource->header->emitterBasePos.y;
        trs.z = ptcl->position.z + ptcl->emitterPos.z - mgr->renderState.emitter->resource->header->emitterBasePos.z;

        dir = ptcl->velocity;

        look.x = cmr->m[0][2];
        look.y = cmr->m[1][2];
        look.z = cmr->m[2][2];

        VEC_CrossProduct(&dir, &look, &dir);
        if (dir.x == 0 && dir.y == 0 && dir.z == 0) {
            return;
        }

        VEC_Normalize(&dir, &dir);
        MTX_Copy43To33(cmr, &mat);
        MTX_MultVec33(&dir, &mat, &dir);
        MTX_MultVec43(&trs, cmr, &trs);

        vel_dir = ptcl->velocity;
        VEC_Normalize(&vel_dir, &vel_dir);

        fx32 dot = FX_MUL(vel_dir.x, -cmr->m[0][2]) + FX_MUL(vel_dir.y, -cmr->m[1][2]) + FX_MUL(vel_dir.z, -cmr->m[2][2]);
        if (dot < 0) {
            dot = -dot;
        }

        dot = FX_MUL(sclY, FX_MUL(FX32_ONE - dot, (fx32)mgr->renderState.emitter->resource->header->misc.dbbScale) + FX32_ONE);
        load.m[0][0] = FX_MUL(dir.x, sclX);
        load.m[1][0] = FX_MUL(-dir.y, dot);
        load.m[2][0] = 0;
        load.m[3][0] = trs.x;
        load.m[0][1] = FX_MUL(dir.y, sclX);
        load.m[1][1] = FX_MUL(dir.x, dot);
        load.m[2][1] = 0;
        load.m[3][1] = trs.y;
        load.m[0][2] = 0;
        load.m[1][2] = 0;
        load.m[2][2] = FX32_ONE;
        load.m[3][2] = trs.z;

        G3_Identity();
        G3_Translate(
            mgr->renderState.emitter->resource->header->emitterBasePos.x,
            mgr->renderState.emitter->resource->header->emitterBasePos.y,
            mgr->renderState.emitter->resource->header->emitterBasePos.z);
        G3_MultMtx43(&load);
    }

    G3_Color(GX_RGB(
        GX_RGB_R_(ptcl->color) * GX_RGB_R_(mgr->renderState.emitter->color) >> 5,
        GX_RGB_G_(ptcl->color) * GX_RGB_G_(mgr->renderState.emitter->color) >> 15,
        GX_RGB_B_(ptcl->color) * GX_RGB_B_(mgr->renderState.emitter->color) >> 25));

    SPLUtil_DrawXYPlane(mgr->renderState.emitter->childTextureS, mgr->renderState.emitter->childTextureT, 0, 0);
}

void SPLDraw_Polygon(SPLManager *mgr, SPLParticle *ptcl)
{
    fx32 sclX, sclY;
    MtxFx43 load;
    MtxFx43 rotMat;
    MtxFx43 sclMat;
    u32 polygonID, cullMode;

    if (SPLDraw_Setup(ptcl, mgr)) {
        return;
    }

    sRotationFunctions[mgr->renderState.emitter->resource->header->flags.polygonRotAxis](
        FX_SinIdx(ptcl->rotation),
        FX_CosIdx(ptcl->rotation),
        &rotMat);

    sclY = ptcl->baseScale;
    sclX = FX_MUL(sclY, mgr->renderState.emitter->resource->header->aspectRatio);

    switch (mgr->renderState.emitter->resource->header->misc.scaleAnimDir) {
    case SPL_SCALE_ANIM_DIR_XY:
        sclX = FX_MUL(sclX, ptcl->animScale);
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_X:
        sclX = FX_MUL(sclX, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_Y:
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;
    }

    MTX_Scale43(&sclMat, sclX, sclY, sclY);
    MTX_Concat43(&sclMat, &rotMat, &load);

    if (!mgr->renderState.emitter->resource->header->flags.useViewSpace) {
        load.m[3][0] = ptcl->position.x + ptcl->emitterPos.x;
        load.m[3][1] = ptcl->position.y + ptcl->emitterPos.y;
        load.m[3][2] = ptcl->position.z + ptcl->emitterPos.z;

        G3_LoadMtx43(mgr->renderState.viewMatrix);
        G3_MultMtx43(&load);
    } else {
        load.m[3][0] = ptcl->position.x + ptcl->emitterPos.x - mgr->renderState.emitter->resource->header->emitterBasePos.x;
        load.m[3][1] = ptcl->position.y + ptcl->emitterPos.y - mgr->renderState.emitter->resource->header->emitterBasePos.y;
        load.m[3][2] = ptcl->position.z + ptcl->emitterPos.z - mgr->renderState.emitter->resource->header->emitterBasePos.z;

        G3_Identity();
        G3_Translate(
            mgr->renderState.emitter->resource->header->emitterBasePos.x,
            mgr->renderState.emitter->resource->header->emitterBasePos.y,
            mgr->renderState.emitter->resource->header->emitterBasePos.z);
        G3_MultMtx43(mgr->renderState.viewMatrix);
        G3_MultMtx43(&load);
    }

    G3_Color(GX_RGB(
        GX_RGB_R_(ptcl->color) * GX_RGB_R_(mgr->renderState.emitter->color) >> 5,
        GX_RGB_G_(ptcl->color) * GX_RGB_G_(mgr->renderState.emitter->color) >> 15,
        GX_RGB_B_(ptcl->color) * GX_RGB_B_(mgr->renderState.emitter->color) >> 25));

    sPlaneDrawingFunctions[mgr->renderState.emitter->resource->header->flags.polygonReferencePlane](
        mgr->renderState.emitter->textureS,
        mgr->renderState.emitter->textureT,
        mgr->renderState.emitter->resource->header->polygonX,
        mgr->renderState.emitter->resource->header->polygonY);
}

void SPLDraw_Child_Polygon(SPLManager *mgr, SPLParticle *ptcl)
{
    fx32 sclX, sclY;
    MtxFx43 load;
    MtxFx43 rotMat;
    MtxFx43 sclMat;

    if (SPLDraw_Setup(ptcl, mgr)) {
        return;
    }

    sRotationFunctions[mgr->renderState.emitter->resource->childResource->flags.polygonRotAxis](
        FX_SinIdx(ptcl->rotation),
        FX_CosIdx(ptcl->rotation),
        &rotMat);

    sclY = ptcl->baseScale;
    sclX = FX_MUL(sclY, mgr->renderState.emitter->resource->header->aspectRatio);

    switch (mgr->renderState.emitter->resource->header->misc.scaleAnimDir) {
    case SPL_SCALE_ANIM_DIR_XY:
        sclX = FX_MUL(sclX, ptcl->animScale);
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_X:
        sclX = FX_MUL(sclX, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_Y:
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;
    }

    MTX_Scale43(&sclMat, sclX, sclY, sclY);
    MTX_Concat43(&rotMat, &sclMat, &load);

    if (!mgr->renderState.emitter->resource->header->flags.useViewSpace) {
        load.m[3][0] = ptcl->position.x + ptcl->emitterPos.x;
        load.m[3][1] = ptcl->position.y + ptcl->emitterPos.y;
        load.m[3][2] = ptcl->position.z + ptcl->emitterPos.z;

        G3_LoadMtx43(mgr->renderState.viewMatrix);
        G3_MultMtx43(&load);
    } else {
        load.m[3][0] = ptcl->position.x + ptcl->emitterPos.x - mgr->renderState.emitter->resource->header->emitterBasePos.x;
        load.m[3][1] = ptcl->position.y + ptcl->emitterPos.y - mgr->renderState.emitter->resource->header->emitterBasePos.y;
        load.m[3][2] = ptcl->position.z + ptcl->emitterPos.z - mgr->renderState.emitter->resource->header->emitterBasePos.z;

        G3_Identity();
        G3_Translate(
            mgr->renderState.emitter->resource->header->emitterBasePos.x,
            mgr->renderState.emitter->resource->header->emitterBasePos.y,
            mgr->renderState.emitter->resource->header->emitterBasePos.z);
        G3_MultMtx43(mgr->renderState.viewMatrix);
        G3_MultMtx43(&load);
    }

    G3_Color(GX_RGB(
        GX_RGB_R_(ptcl->color) * GX_RGB_R_(mgr->renderState.emitter->color) >> 5,
        GX_RGB_G_(ptcl->color) * GX_RGB_G_(mgr->renderState.emitter->color) >> 15,
        GX_RGB_B_(ptcl->color) * GX_RGB_B_(mgr->renderState.emitter->color) >> 25));

    sPlaneDrawingFunctions[mgr->renderState.emitter->resource->childResource->flags.polygonReferencePlane](
        mgr->renderState.emitter->childTextureS,
        mgr->renderState.emitter->childTextureT,
        0,
        0);
}

void SPLDraw_DirectionalPolygon(SPLManager *mgr, SPLParticle *ptcl)
{
    MtxFx43 load;
    MtxFx43 rotMat;
    MtxFx43 sclMat;
    VecFx32 unitDir, dir1, dir2, dir3, axis;
    MtxFx43 mat;
    fx32 sclX, sclY;

    if (SPLDraw_Setup(ptcl, mgr)) {
        return;
    }

    sRotationFunctions[mgr->renderState.emitter->resource->header->flags.polygonRotAxis](FX_SinIdx(ptcl->rotation), FX_CosIdx(ptcl->rotation), &rotMat);

    MTX_Identity43(&mat);

    if (!mgr->renderState.emitter->resource->header->misc.dpolFaceEmitter) {
        VEC_Normalize(&ptcl->velocity, &unitDir);
    } else {
        VEC_Normalize(&ptcl->position, &unitDir);
        unitDir.x = -unitDir.x;
        unitDir.y = -unitDir.y;
        unitDir.z = -unitDir.z;
    }

    axis.x = 0;
    axis.y = FX32_ONE;
    axis.z = 0;

    fx32 dot = VEC_DotProduct(&unitDir, &axis);
    if (dot > FX32_CONST(0.8) || dot < FX32_CONST(-0.8)) {
        axis.x = FX32_ONE;
        axis.y = 0;
        axis.z = 0;
    }

    VEC_CrossProduct(&unitDir, &axis, &dir1);
    VEC_CrossProduct(&unitDir, &dir1, &dir2);

    mat.m[0][0] = dir1.x;
    mat.m[0][1] = dir1.y;
    mat.m[0][2] = dir1.z;
    mat.m[1][0] = unitDir.x;
    mat.m[1][1] = unitDir.y;
    mat.m[1][2] = unitDir.z;
    mat.m[2][0] = dir2.x;
    mat.m[2][1] = dir2.y;
    mat.m[2][2] = dir2.z;
    MTX_Concat43(&rotMat, &mat, &rotMat);

    sclY = ptcl->baseScale;
    sclX = FX_MUL(sclY, mgr->renderState.emitter->resource->header->aspectRatio);

    switch (mgr->renderState.emitter->resource->header->misc.scaleAnimDir) {
    case SPL_SCALE_ANIM_DIR_XY:
        sclX = FX_MUL(sclX, ptcl->animScale);
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_X:
        sclX = FX_MUL(sclX, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_Y:
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;
    }

    MTX_Scale43(&sclMat, sclX, sclY, sclY);
    MTX_Concat43(&sclMat, &rotMat, &load);

    if (!mgr->renderState.emitter->resource->header->flags.useViewSpace) {
        load.m[3][0] = ptcl->position.x + ptcl->emitterPos.x;
        load.m[3][1] = ptcl->position.y + ptcl->emitterPos.y;
        load.m[3][2] = ptcl->position.z + ptcl->emitterPos.z;

        G3_LoadMtx43(mgr->renderState.viewMatrix);
        G3_MultMtx43(&load);
    } else {
        load.m[3][0] = ptcl->position.x + ptcl->emitterPos.x - mgr->renderState.emitter->resource->header->emitterBasePos.x;
        load.m[3][1] = ptcl->position.y + ptcl->emitterPos.y - mgr->renderState.emitter->resource->header->emitterBasePos.y;
        load.m[3][2] = ptcl->position.z + ptcl->emitterPos.z - mgr->renderState.emitter->resource->header->emitterBasePos.z;

        G3_Identity();
        G3_Translate(
            mgr->renderState.emitter->resource->header->emitterBasePos.x,
            mgr->renderState.emitter->resource->header->emitterBasePos.y,
            mgr->renderState.emitter->resource->header->emitterBasePos.z);
        G3_MultMtx43(mgr->renderState.viewMatrix);
        G3_MultMtx43(&load);
    }

    G3_Color(GX_RGB(
        GX_RGB_R_(ptcl->color) * GX_RGB_R_(mgr->renderState.emitter->color) >> 5,
        GX_RGB_G_(ptcl->color) * GX_RGB_G_(mgr->renderState.emitter->color) >> 15,
        GX_RGB_B_(ptcl->color) * GX_RGB_B_(mgr->renderState.emitter->color) >> 25));

    sPlaneDrawingFunctions[mgr->renderState.emitter->resource->header->flags.polygonReferencePlane](
        mgr->renderState.emitter->textureS,
        mgr->renderState.emitter->textureT,
        mgr->renderState.emitter->resource->header->polygonX,
        mgr->renderState.emitter->resource->header->polygonY);
}

void SPLDraw_Child_DirectionalPolygon(SPLManager *mgr, SPLParticle *ptcl)
{
    MtxFx43 load;
    MtxFx43 rotMat;
    MtxFx43 sclMat;
    VecFx32 unitDir, dir1, dir2, dir3, axis;
    MtxFx43 mat;
    fx32 sclX, sclY;

    if (SPLDraw_Setup(ptcl, mgr)) {
        return;
    }

    sRotationFunctions[mgr->renderState.emitter->resource->childResource->flags.polygonRotAxis](
        FX_SinIdx(ptcl->rotation),
        FX_CosIdx(ptcl->rotation),
        &rotMat);

    MTX_Identity43(&mat);

    if (!mgr->renderState.emitter->resource->childResource->misc.dpolFaceEmitter) {
        VEC_Normalize(&ptcl->velocity, &unitDir);
    } else {
        VEC_Normalize(&ptcl->position, &unitDir);
        unitDir.x = -unitDir.x;
        unitDir.y = -unitDir.y;
        unitDir.z = -unitDir.z;
    }

    axis.x = 0;
    axis.y = FX32_ONE;
    axis.z = 0;

    fx32 dot = VEC_DotProduct(&unitDir, &axis);
    if (dot > FX32_CONST(0.8) || dot < FX32_CONST(-0.8)) {
        axis.x = FX32_ONE;
        axis.y = 0;
        axis.z = 0;
    }

    VEC_CrossProduct(&unitDir, &axis, &dir1);
    VEC_CrossProduct(&unitDir, &dir1, &dir2);

    mat.m[0][0] = dir1.x;
    mat.m[0][1] = dir1.y;
    mat.m[0][2] = dir1.z;
    mat.m[1][0] = unitDir.x;
    mat.m[1][1] = unitDir.y;
    mat.m[1][2] = unitDir.z;
    mat.m[2][0] = dir2.x;
    mat.m[2][1] = dir2.y;
    mat.m[2][2] = dir2.z;
    MTX_Concat43(&rotMat, &mat, &rotMat);

    sclY = ptcl->baseScale;
    sclX = FX_MUL(sclY, mgr->renderState.emitter->resource->header->aspectRatio);

    switch (mgr->renderState.emitter->resource->header->misc.scaleAnimDir) {
    case SPL_SCALE_ANIM_DIR_XY:
        sclX = FX_MUL(sclX, ptcl->animScale);
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_X:
        sclX = FX_MUL(sclX, ptcl->animScale);
        break;

    case SPL_SCALE_ANIM_DIR_Y:
        sclY = FX_MUL(sclY, ptcl->animScale);
        break;
    }

    MTX_Scale43(&sclMat, sclX, sclY, sclY);
    MTX_Concat43(&rotMat, &sclMat, &load);

    if (!mgr->renderState.emitter->resource->header->flags.useViewSpace) {
        load.m[3][0] = ptcl->position.x + ptcl->emitterPos.x;
        load.m[3][1] = ptcl->position.y + ptcl->emitterPos.y;
        load.m[3][2] = ptcl->position.z + ptcl->emitterPos.z;

        G3_LoadMtx43(mgr->renderState.viewMatrix);
        G3_MultMtx43(&load);
    } else {
        load.m[3][0] = ptcl->position.x + ptcl->emitterPos.x - mgr->renderState.emitter->resource->header->emitterBasePos.x;
        load.m[3][1] = ptcl->position.y + ptcl->emitterPos.y - mgr->renderState.emitter->resource->header->emitterBasePos.y;
        load.m[3][2] = ptcl->position.z + ptcl->emitterPos.z - mgr->renderState.emitter->resource->header->emitterBasePos.z;

        G3_Identity();
        G3_Translate(
            mgr->renderState.emitter->resource->header->emitterBasePos.x,
            mgr->renderState.emitter->resource->header->emitterBasePos.y,
            mgr->renderState.emitter->resource->header->emitterBasePos.z);
        G3_MultMtx43(mgr->renderState.viewMatrix);
        G3_MultMtx43(&load);
    }

    G3_Color(GX_RGB(
        GX_RGB_R_(ptcl->color) * GX_RGB_R_(mgr->renderState.emitter->color) >> 5,
        GX_RGB_G_(ptcl->color) * GX_RGB_G_(mgr->renderState.emitter->color) >> 15,
        GX_RGB_B_(ptcl->color) * GX_RGB_B_(mgr->renderState.emitter->color) >> 25));

    sPlaneDrawingFunctions[mgr->renderState.emitter->resource->childResource->flags.polygonReferencePlane](
        mgr->renderState.emitter->childTextureS,
        mgr->renderState.emitter->childTextureT,
        0,
        0);
}
