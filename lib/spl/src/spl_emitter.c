#include "spl_emitter.h"

#include <nitro/fx/fx.h>
#include <nitro/fx/fx_const.h>
#include <nitro/gx/g3.h>
#include <nitro/gx/g3imm.h>

#include "spl_internal.h"
#include "spl_manager.h"
#include "spl_particle.h"
#include "spl_resource.h"
#include "spl_texture.h"

#define ANIM_FUNC_NO_LOOP 0
#define ANIM_FUNC_LOOP    1

typedef void (*DrawFunc)(SPLManager *mgr, SPLParticle *ptcl);
typedef void (*SetTexFunc)(SPLTexture *tex);

typedef struct FieldFunc {
    void (*func)(SPLParticle *, SPLResource *, int);
    BOOL loop;
} AnimFunc;

typedef struct FieldFunc8 {
    void (*func)(SPLParticle *, SPLResource *, u8);
    BOOL loop;
} FieldFunc8;

static void SPLUtil_SetTexture(SPLTexture *tex);
static void SPLUtil_SetTexture_Stub(SPLTexture *tex);
static void SPLManager_DrawParticles(SPLManager *mgr);
static void SPLManager_DrawChildParticles(SPLManager *mgr);

static void SPLUtil_SetTexture(SPLTexture *tex)
{
    SPLTextureParam param = tex->param;

    G3_TexImageParam(
        param.format,
        GX_TEXGEN_TEXCOORD,
        param.s,
        param.t,
        param.repeat,
        param.flip,
        param.palColor0,
        tex->texAddr);

    G3_TexPlttBase(tex->palAddr, param.format);
    G3_MtxMode(GX_MTXMODE_TEXTURE);
    G3_Identity();
    G3_Scale(tex->width * FX32_ONE, tex->height * FX32_ONE, 0);
    G3_MtxMode(GX_MTXMODE_POSITION);
}

static void SPLUtil_SetTexture_Stub(SPLTexture *tex)
{
}

void SPLEmitter_Init(SPLEmitter *emtr, SPLResource *res, const VecFx32 *pos)
{
    emtr->resource = res;
    emtr->state.all = 0;

    emtr->position.x = pos->x + emtr->resource->header->emitterBasePos.x;
    emtr->position.y = pos->y + emtr->resource->header->emitterBasePos.y;
    emtr->position.z = pos->z + emtr->resource->header->emitterBasePos.z;

    emtr->particleInitVelocity.x = 0;
    emtr->particleInitVelocity.y = 0;
    emtr->particleInitVelocity.z = 0;
    emtr->velocity.x = emtr->velocity.y = emtr->velocity.z = 0;

    emtr->age = 0;
    emtr->emissionCountFractional = 0;

    emtr->axis = emtr->resource->header->axis;
    emtr->initAngle = emtr->resource->header->initAngle;
    emtr->emissionCount = emtr->resource->header->emissionCount;
    emtr->radius = emtr->resource->header->radius;
    emtr->length = emtr->resource->header->length;
    emtr->initVelPositionAmplifier = emtr->resource->header->initVelPosAmplifier;
    emtr->initVelAxisAmplifier = emtr->resource->header->initVelAxisAmplifier;
    emtr->baseScale = emtr->resource->header->baseScale;
    emtr->particleLifeTime = emtr->resource->header->particleLifeTime;

    emtr->color = GX_RGB(31, 31, 31);
    emtr->misc.emissionInterval = emtr->resource->header->misc.emissionInterval;
    emtr->misc.baseAlpha = emtr->resource->header->misc.baseAlpha;
    emtr->misc.updateCycle = 0;
    emtr->misc.reserved = 0;
    emtr->collisionPlaneHeight = FX32_MIN;
    emtr->textureS = FX32_ONE << emtr->resource->header->misc.textureTileCountS;
    emtr->textureT = FX32_ONE << emtr->resource->header->misc.textureTileCountT;

    if (emtr->resource->header->misc.flipTextureS) {
        emtr->textureS *= -1;
    }

    if (emtr->resource->header->misc.flipTextureT) {
        emtr->textureT *= -1;
    }

    if (emtr->resource->header->flags.hasChildResource) {
        emtr->childTextureS = FX32_ONE << emtr->resource->childResource->misc.textureTileCountS;
        emtr->childTextureT = FX32_ONE << emtr->resource->childResource->misc.textureTileCountT;

        if (emtr->resource->childResource->misc.flipTextureS) {
            emtr->childTextureS *= -1;
        }

        if (emtr->resource->childResource->misc.flipTextureT) {
            emtr->childTextureT *= -1;
        }
    }

    emtr->next = emtr->prev = NULL;
    emtr->particles.first = emtr->childParticles.first = NULL;
    emtr->particles.count = emtr->childParticles.count = 0;
    emtr->updateCallback = NULL;
    emtr->userDataPtr = NULL;
    emtr->userData.u32 = 0;
}

void SPLEmitter_Update(SPLManager *mgr, SPLEmitter *emtr)
{
    SPLParticle *ptcl;
    SPLParticle *next;
    SPLResource *res;
    SPLResourceHeader *header;
    SPLChildResource *child;
    SPLResourceFlags resFlags;
    AnimFunc animFuncs[4];
    AnimFunc childAnimFuncs[4];
    int i, animCount, behaviorCount;
    int airResistance;
    u8 lifeRates[2];
    VecFx32 acc;

    res = emtr->resource;
    child = res->childResource;
    animCount = 0;
    header = res->header;
    resFlags = header->flags;
    behaviorCount = res->behaviorCount;
    airResistance = header->misc.airResistance + FX32_CONST(0.09375);

    if (emtr->updateCallback) {
        emtr->updateCallback(emtr, SPL_CALLBACK_PRE_UPDATE);
    }

    if (header->emitterLifeTime == 0 || emtr->age < header->emitterLifeTime) {
        if (emtr->age % emtr->misc.emissionInterval == 0) {
            if (!emtr->state.terminate && !emtr->state.emissionPaused && emtr->state.started) {
                SPLEmitter_EmitParticles(emtr, &mgr->inactiveParticles);
            }
        }
    }

    if (resFlags.hasScaleAnim) {
        animFuncs[animCount].func = SPLAnim_Scale;
        animFuncs[animCount++].loop = res->scaleAnim->flags.loop;
    }

    if (resFlags.hasColorAnim && !res->colorAnim->flags.randomStartColor) {
        animFuncs[animCount].func = SPLAnim_Color;
        animFuncs[animCount++].loop = res->colorAnim->flags.loop;
    }

    if (resFlags.hasAlphaAnim) {
        animFuncs[animCount].func = SPLAnim_Alpha;
        animFuncs[animCount++].loop = res->alphaAnim->flags.loop;
    }

    if (resFlags.hasTexAnim && !res->texAnim->param.randomizeInit) {
        animFuncs[animCount].func = SPLAnim_Texture;
        animFuncs[animCount++].loop = res->texAnim->param.loop;
    }

    for (ptcl = emtr->particles.first; ptcl != NULL; ptcl = next) {
        next = ptcl->next;

        // For non-looping particles, "life rate" is a fraction of the particle's lifetime, represented as a u8.
        // where 0 is the start of the particle's life and 255 is the end
        // For looping particles, it's a fraction of the number of frames in the loop
        // See the SPLParticle struct for more info
        lifeRates[ANIM_FUNC_NO_LOOP] = (ptcl->lifeTimeFactor * ptcl->age) >> 8;
        lifeRates[ANIM_FUNC_LOOP] = ptcl->lifeRateOffset + ((ptcl->loopTimeFactor * ptcl->age) >> 8);

        for (i = 0; i < animCount; i++) {
            animFuncs[i].func(ptcl, res, lifeRates[animFuncs[i].loop]);
        }

        acc.x = acc.y = acc.z = 0;

        if (resFlags.followEmitter) {
            ptcl->emitterPos = emtr->position;
        }

        for (i = 0; i < behaviorCount; i++) {
            res->behaviors[i].applyFunc(res->behaviors[i].object, ptcl, &acc, emtr);
        }

        ptcl->rotation += ptcl->angularVelocity;

        ptcl->velocity.x = ptcl->velocity.x * airResistance >> 9;
        ptcl->velocity.y = ptcl->velocity.y * airResistance >> 9;
        ptcl->velocity.z = ptcl->velocity.z * airResistance >> 9;

        ptcl->velocity.x += acc.x;
        ptcl->velocity.y += acc.y;
        ptcl->velocity.z += acc.z;

        ptcl->position.x += ptcl->velocity.x + emtr->velocity.x;
        ptcl->position.y += ptcl->velocity.y + emtr->velocity.y;
        ptcl->position.z += ptcl->velocity.z + emtr->velocity.z;

        if (resFlags.hasChildResource) {
            fx32 emissionDelay = FX_MUL((fx32)ptcl->lifeTime << FX32_SHIFT, (fx32)child->misc.emissionDelay << FX32_SHIFT);

            // The >> 8 here is a division by 256 because emissionDelay is a fraction of the particle's lifetime represented as a u8
            fx32 diff = ((fx32)ptcl->age * FX32_ONE) - (emissionDelay >> 8);

            if (diff >= 0 && ((diff >> FX32_SHIFT) % child->misc.emissionInterval == 0)) {
                SPLEmitter_EmitChildren(ptcl, emtr, &mgr->inactiveParticles);
            }
        }

        if (emtr->resource->header->flags.hasFixedPolygonID) {
            ptcl->visibility.currentPolygonID = mgr->polygonID.fix;
        } else {
            ptcl->visibility.currentPolygonID = mgr->polygonID.current;
            mgr->polygonID.current += 1;

            if (mgr->polygonID.current > mgr->polygonID.max) {
                mgr->polygonID.current = mgr->polygonID.min;
            }
        }

        ptcl->age += 1;

        if (ptcl->age > ptcl->lifeTime) {
            SPLParticle *erased = SPLParticleList_Erase(&emtr->particles, ptcl);
            SPLParticleList_PushFront(&mgr->inactiveParticles, erased);
        }
    }

    if (resFlags.hasChildResource) {
        animCount = 0;
        if (child->flags.hasScaleAnim) {
            childAnimFuncs[animCount].func = SPLAnim_ChildScale;
            childAnimFuncs[animCount++].loop = FALSE;
        }

        if (child->flags.hasAlphaAnim) {
            childAnimFuncs[animCount].func = SPLAnim_ChildAlpha;
            childAnimFuncs[animCount++].loop = FALSE;
        }

        if (!child->flags.usesBehaviors) {
            behaviorCount = 0;
        }

        for (ptcl = emtr->childParticles.first; ptcl != NULL; ptcl = next) {
            next = ptcl->next;

            // "life rate" is a fraction of the particle's lifetime, represented as a u8
            // where 0 is the start of the particle's life and 255 is the end
            lifeRates[0] = (ptcl->age << 8) / ptcl->lifeTime;
            for (i = 0; i < animCount; i++) {
                childAnimFuncs[i].func(ptcl, res, lifeRates[0]);
            }

            acc.x = acc.y = acc.z = 0;

            if (child->flags.followEmitter) {
                ptcl->emitterPos = emtr->position;
            }

            for (i = 0; i < behaviorCount; i++) {
                res->behaviors[i].applyFunc(res->behaviors[i].object, ptcl, &acc, emtr);
            }

            ptcl->rotation += ptcl->angularVelocity;

            ptcl->velocity.x = ptcl->velocity.x * airResistance >> 9;
            ptcl->velocity.y = ptcl->velocity.y * airResistance >> 9;
            ptcl->velocity.z = ptcl->velocity.z * airResistance >> 9;

            ptcl->velocity.x += acc.x;
            ptcl->velocity.y += acc.y;
            ptcl->velocity.z += acc.z;

            ptcl->position.x += ptcl->velocity.x + emtr->velocity.x;
            ptcl->position.y += ptcl->velocity.y + emtr->velocity.y;
            ptcl->position.z += ptcl->velocity.z + emtr->velocity.z;

            if (emtr->resource->header->flags.childHasFixedPolygonID) {
                ptcl->visibility.currentPolygonID = mgr->polygonID.fix;
            } else {
                ptcl->visibility.currentPolygonID = mgr->polygonID.current;
                mgr->polygonID.current += 1;

                if (mgr->polygonID.current > mgr->polygonID.max) {
                    mgr->polygonID.current = mgr->polygonID.min;
                }
            }

            ptcl->age += 1;

            if (ptcl->age > ptcl->lifeTime) {
                SPLParticle *erased = SPLParticleList_Erase(&emtr->childParticles, ptcl);
                SPLParticleList_PushFront(&mgr->inactiveParticles, erased);
            }
        }
    }

    emtr->age += 1;

    if (emtr->updateCallback) {
        emtr->updateCallback(emtr, SPL_CALLBACK_POST_UPDATE);
    }
}

static void SPLManager_DrawParticles(SPLManager *mgr)
{
    SPLEmitter *emtr = mgr->renderState.emitter;
    SPLResourceHeader *header = emtr->resource->header;
    DrawFunc drawFunc = NULL;

    SPLUtil_SetTexture(mgr->textures + header->misc.textureIndex);

    switch (header->flags.drawType) {
    case SPL_DRAW_TYPE_BILLBOARD:
        drawFunc = SPLDraw_Billboard;
        break;
    case SPL_DRAW_TYPE_DIRECTIONAL_BILLBOARD:
        drawFunc = SPLDraw_DirectionalBillboard;
        break;
    case SPL_DRAW_TYPE_POLYGON:
        drawFunc = SPLDraw_Polygon;
        break;
    case SPL_DRAW_TYPE_DIRECTIONAL_POLYGON:
        drawFunc = SPLDraw_DirectionalPolygon;
        break;
    case SPL_DRAW_TYPE_DIRECTIONAL_POLYGON_CENTER:
        drawFunc = SPLDraw_DirectionalPolygon;
        break;
    }

    SetTexFunc setTexFunc = header->flags.hasTexAnim ? SPLUtil_SetTexture : SPLUtil_SetTexture_Stub;

    for (SPLParticle *ptcl = emtr->particles.first; ptcl != NULL; ptcl = ptcl->next) {
        setTexFunc(mgr->textures + ptcl->texture);
        drawFunc(mgr, ptcl);
    }
}

static void SPLManager_DrawChildParticles(SPLManager *mgr)
{
    SPLEmitter *emtr = mgr->renderState.emitter;
    SPLResource *res = emtr->resource;
    DrawFunc drawFunc = NULL;

    if (!res->header->flags.hasChildResource) {
        return;
    }

    SPLUtil_SetTexture(mgr->textures + res->childResource->misc.texture);

    switch (res->childResource->flags.drawType) {
    case SPL_DRAW_TYPE_BILLBOARD:
        drawFunc = SPLDraw_Child_Billboard;
        break;
    case SPL_DRAW_TYPE_DIRECTIONAL_BILLBOARD:
        drawFunc = SPLDraw_Child_DirectionalBillboard;
        break;
    case SPL_DRAW_TYPE_POLYGON:
        drawFunc = SPLDraw_Child_Polygon;
        break;
    case SPL_DRAW_TYPE_DIRECTIONAL_POLYGON:
        drawFunc = SPLDraw_Child_DirectionalPolygon;
        break;
    case SPL_DRAW_TYPE_DIRECTIONAL_POLYGON_CENTER:
        drawFunc = SPLDraw_Child_DirectionalPolygon;
        break;
    }

    for (SPLParticle *ptcl = emtr->childParticles.first; ptcl != NULL; ptcl = ptcl->next) {
        drawFunc(mgr, ptcl);
    }
}

void SPLManager_DoDraw(SPLManager *mgr)
{
    SPLResourceHeader *header = mgr->renderState.emitter->resource->header;

    if (header->flags.drawChildrenFirst) {
        SPLManager_DrawChildParticles(mgr);

        if (!header->flags.hideParent) {
            SPLManager_DrawParticles(mgr);
        }
    } else {
        if (!header->flags.hideParent) {
            SPLManager_DrawParticles(mgr);
        }

        SPLManager_DrawChildParticles(mgr);
    }
}

void SPLEmitter_Emit(SPLEmitter *emtr, SPLParticleList *list)
{
    SPLEmitter_EmitParticles(emtr, list);
}

void SPLUtil_SetCylinderEmitterDir(SPLEmitter *emtr, VecFx32 *p1, VecFx32 *p2)
{
    VecFx32 vex;

    if (emtr->resource->header->flags.emissionType == 6 || emtr->resource->header->flags.emissionType == 7) {
        emtr->position.x = (p2->x + p1->x) / 2;
        emtr->position.y = (p2->y + p1->y) / 2;
        emtr->position.z = (p2->z + p1->z) / 2;
        emtr->length = VEC_Distance(p1, p2) / 2;

        vex.x = p2->x - p1->x;
        vex.y = p2->y - p1->y;
        vex.z = p2->z - p1->z;
        VEC_Normalize(&vex, &vex);

        emtr->axis.x = (fx16)vex.x;
        emtr->axis.y = (fx16)vex.y;
        emtr->axis.z = (fx16)vex.z;
    }
}
