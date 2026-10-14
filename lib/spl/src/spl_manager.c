#include "spl_manager.h"

#include <nitro/fx/fx.h>
#include <nnsys/gfd/VramManager/gfd_PlttVramMan_Types.h>
#include <nnsys/gfd/VramManager/gfd_TexVramMan_Types.h>

#include "spl_behavior.h"
#include "spl_emitter.h"
#include "spl_internal.h"
#include "spl_particle.h"

#define DECODE_WH(X) ((u16)(1 << ((X) + 3)))
// clang-format off
#define EMITTER_SHOULD_TERMINATE(emtr, header)                                                                                      \
    (((header->flags.selfMaintaining && header->emitterLifeTime != 0 && emtr->state.started && emtr->age > header->emitterLifeTime) \
    || emtr->state.terminate)                                                                                                  \
    && emtr->particles.count == 0 && emtr->childParticles.count == 0)
// clang-format on

static u32 SPLUtil_AllocTextureVRAM(u32 size, BOOL is4x4);
static u32 SPLUtil_AllocPaletteVRAM(u32 size, BOOL is4Pltt);

static u32 SPLUtil_AllocTextureVRAM(u32 size, BOOL is4x4)
{
    return (NNS_GfdAllocTexVram(size, is4x4, 0) & 0xFFFF) * 8;
}

static u32 SPLUtil_AllocPaletteVRAM(u32 size, BOOL is4Pltt)
{
    return (NNS_GfdAllocPlttVram(size, is4Pltt, 0) & 0xFFFF) * 8;
}

SPLManager *SPLManager_New(SPLAllocFunc alloc, u16 maxEmitters, u16 maxParticles, u16 fixPolyID, u16 minPolyID, u16 maxPolyID)
{
    int i; // Required to match

    SPLManager *mgr = alloc(sizeof(SPLManager));
    MI_CpuFill8(mgr, 0, sizeof(SPLManager));

    mgr->maxEmitters = maxEmitters;
    mgr->maxParticles = maxParticles;

    mgr->polygonID.min = minPolyID;
    mgr->polygonID.max = maxPolyID;
    mgr->polygonID.current = mgr->polygonID.min;
    mgr->polygonID.fix = fixPolyID;
    mgr->polygonID.drawOrder = SPL_DRAW_ORDER_REVERSE;
    mgr->polygonID.unused = 0;

    mgr->alloc = alloc;

    mgr->activeEmitters.count = 0;
    mgr->inactiveEmitters.count = 0;
    mgr->inactiveParticles.count = 0;

    mgr->activeEmitters.first = NULL;
    mgr->inactiveEmitters.first = NULL;
    mgr->inactiveParticles.first = NULL;

    mgr->miscPolygonAttr = GX_POLYGON_ATTR_MISC_NONE;
    mgr->currentCycle = 0;

    SPLEmitter *emtr = alloc(maxEmitters * sizeof(SPLEmitter));
    MI_CpuFill8(emtr, 0, maxEmitters * sizeof(SPLEmitter));

    for (i = 0; i < maxEmitters; ++i) {
        SPLEmitterList_PushFront(&mgr->inactiveEmitters, &emtr[i]);
    }

    SPLParticle *ptcl = alloc(maxParticles * sizeof(SPLParticle));
    MI_CpuFill8(ptcl, 0, maxParticles * sizeof(SPLParticle));

    for (i = 0; i < maxParticles; ++i) {
        SPLParticleList_PushFront(&mgr->inactiveParticles, &ptcl[i]);
    }

    mgr->resources = NULL;
    mgr->textures = NULL;
    mgr->resCount = mgr->texCount = 0;

    return mgr;
}

void SPLManager_LoadResources(SPLManager *mgr, const void *data)
{
    // Required to match
    int i, offset;
    SPLFileHeader *spa = (SPLFileHeader *)data;
    offset = sizeof(SPLFileHeader);

    mgr->resCount = spa->resCount;
    mgr->texCount = spa->texCount;

    mgr->resources = mgr->alloc(mgr->resCount * sizeof(SPLResource));

    MI_CpuFill8(mgr->resources, 0, mgr->resCount * sizeof(SPLResource));

    for (i = 0; i < mgr->resCount; ++i) {
        SPLResource *res = mgr->resources + i;
        res->header = (SPLResourceHeader *)((u8 *)spa + offset);

        offset += sizeof(SPLResourceHeader);
        SPLResourceFlags flags = res->header->flags;

        if (flags.hasScaleAnim) {
            res->scaleAnim = (SPLScaleAnim *)((u8 *)spa + offset);
            offset += sizeof(SPLScaleAnim);
        } else {
            res->scaleAnim = NULL;
        }

        if (flags.hasColorAnim) {
            res->colorAnim = (SPLColorAnim *)((u8 *)spa + offset);
            offset += sizeof(SPLColorAnim);
        } else {
            res->colorAnim = NULL;
        }

        if (flags.hasAlphaAnim) {
            res->alphaAnim = (SPLAlphaAnim *)((u8 *)spa + offset);
            offset += sizeof(SPLAlphaAnim);
        } else {
            res->alphaAnim = NULL;
        }

        if (flags.hasTexAnim) {
            res->texAnim = (SPLTexAnim *)((u8 *)spa + offset);
            offset += sizeof(SPLTexAnim);
        } else {
            res->texAnim = NULL;
        }

        if (flags.hasChildResource) {
            res->childResource = (SPLChildResource *)((u8 *)spa + offset);
            offset += sizeof(SPLChildResource);
        } else {
            res->childResource = NULL;
        }

        // Sum up all behaviors
        res->behaviorCount = flags.hasGravityBehavior
            + flags.hasRandomBehavior
            + flags.hasMagnetBehavior
            + flags.hasSpinBehavior
            + flags.hasCollisionPlaneBehavior
            + flags.hasConvergenceBehavior;

        if (res->behaviorCount != 0) {
            res->behaviors = (SPLBehavior *)mgr->alloc(res->behaviorCount * sizeof(SPLBehavior));
            SPLBehavior *behavior = res->behaviors;

            if (flags.hasGravityBehavior) {
                behavior->object = (const void *)((u8 *)spa + offset);
                behavior->applyFunc = SPLBehavior_ApplyGravity;
                offset += sizeof(SPLGravityBehavior);
                behavior++;
            }

            if (flags.hasRandomBehavior) {
                behavior->object = (const void *)((u8 *)spa + offset);
                behavior->applyFunc = SPLBehavior_ApplyRandom;
                offset += sizeof(SPLRandomBehavior);
                behavior++;
            }

            if (flags.hasMagnetBehavior) {
                behavior->object = (const void *)((u8 *)spa + offset);
                behavior->applyFunc = SPLBehavior_ApplyMagnet;
                offset += sizeof(SPLMagnetBehavior);
                behavior++;
            }

            if (flags.hasSpinBehavior) {
                behavior->object = (const void *)((u8 *)spa + offset);
                behavior->applyFunc = SPLBehavior_ApplySpin;
                offset += sizeof(SPLSpinBehavior);
                behavior++;
            }

            if (flags.hasCollisionPlaneBehavior) {
                behavior->object = (const void *)((u8 *)spa + offset);
                behavior->applyFunc = SPLBehavior_ApplyCollisionPlane;
                offset += sizeof(SPLCollisionPlaneBehavior);
                behavior++;
            }

            if (flags.hasConvergenceBehavior) {
                behavior->object = (const void *)((u8 *)spa + offset);
                behavior->applyFunc = SPLBehavior_ApplyConvergence;
                offset += sizeof(SPLConvergenceBehavior);
            }
        } else {
            res->behaviors = NULL;
        }
    }

    mgr->textures = (SPLTexture *)mgr->alloc(mgr->texCount * sizeof(SPLTexture));

    MI_CpuFill8(mgr->textures, 0, mgr->texCount * sizeof(SPLTexture));

    for (i = 0; i < mgr->texCount; ++i) {
        SPLTexture *texture = &mgr->textures[i];
        SPLTextureResource *texRes = (SPLTextureResource *)((u8 *)spa + offset);
        texture->resource = texRes;
        texture->width = DECODE_WH(texRes->param.s);
        texture->height = DECODE_WH(texRes->param.t);
        texture->param = texRes->param;
        offset += texRes->resourceSize;
    }
}

BOOL SPLManager_UploadTexturesEx(SPLManager *mgr, SPLTexVRAMAllocFunc vramAlloc)
{
    GX_BeginLoadTex();

    for (int i = 0; i < mgr->texCount; i++) {
        SPLTexture *textures = mgr->textures;
        SPLTexture *tex = &textures[i];
        SPLTextureResource *texRes = (SPLTextureResource *)tex->resource;

        if (texRes->param.useSharedTexture) {
            tex->texAddr = textures[texRes->param.sharedTexID].texAddr;
        } else {
            u32 addr = vramAlloc(texRes->textureSize, texRes->param.format == GX_TEXFMT_COMP4x4);
            const void *data = SPLTextureResource_GetTexData((SPLTextureResource *)tex->resource);
            GX_LoadTex(data, addr, texRes->textureSize);
            tex->texAddr = addr;
        }
    }

    GX_EndLoadTex();
    return TRUE;
}

BOOL SPLManager_UploadPalettesEx(SPLManager *mgr, SPLPalVRAMAllocFunc vramAlloc)
{
    // Required to match
    s32 i;
    SPLTexture *tex;
    SPLTextureResource *texRes;

    GX_BeginLoadTexPltt();

    for (i = 0; i < mgr->texCount; i++) {
        u32 addr = 0;
        tex = &mgr->textures[i];
        texRes = (SPLTextureResource *)tex->resource;

        if (texRes->paletteSize != 0) {
            addr = vramAlloc(texRes->paletteSize, texRes->param.format == GX_TEXFMT_PLTT4);
            GX_LoadTexPltt((u8 *)tex->resource + texRes->paletteOffset, addr, texRes->paletteSize);
        }

        tex->palAddr = addr;
    }

    GX_EndLoadTexPltt();
    return TRUE;
}

BOOL SPLManager_UploadTextures(SPLManager *mgr)
{
    return SPLManager_UploadTexturesEx(mgr, SPLUtil_AllocTextureVRAM);
}

BOOL SPLManager_UploadPalettes(SPLManager *mgr)
{
    return SPLManager_UploadPalettesEx(mgr, SPLUtil_AllocPaletteVRAM);
}

void SPLManager_Update(SPLManager *mgr)
{
    // Required to match
    SPLEmitter *emtr;
    SPLEmitter *next;

    emtr = mgr->activeEmitters.first;
    while (emtr != NULL) {
        SPLResourceHeader *header = emtr->resource->header;
        next = emtr->next;

        if (!emtr->state.started && emtr->age >= header->startDelay) {
            emtr->state.started = TRUE;
            emtr->age = 0;
        }

        if (!emtr->state.paused) {
            if (emtr->misc.updateCycle == 0 || mgr->currentCycle == emtr->misc.updateCycle - 1) {
                SPLEmitter_Update(mgr, emtr);
            }
        }

        if (EMITTER_SHOULD_TERMINATE(emtr, header)) {
            SPLEmitter *terminatedEmitter = SPLEmitterList_Erase(&mgr->activeEmitters, emtr);
            SPLEmitterList_PushFront(&mgr->inactiveEmitters, terminatedEmitter);
        }

        emtr = next;
    }

    mgr->currentCycle += 1;
    if (mgr->currentCycle > 1) {
        mgr->currentCycle = 0;
    }
}

void SPLManager_Draw(SPLManager *mgr, const MtxFx43 *viewMatrix)
{
    G3X_AlphaBlend(TRUE);

    mgr->renderState.viewMatrix = viewMatrix;
    if (mgr->polygonID.drawOrder == SPL_DRAW_ORDER_REVERSE) {
        for (SPLEmitter *emtr = mgr->activeEmitters.first; emtr != NULL; emtr = emtr->next) {
            mgr->renderState.emitter = emtr;
            if (!emtr->state.renderingDisabled) {
                SPLManager_DoDraw(mgr);
            }
        }
    } else {
        for (SPLEmitter *emtr = mgr->activeEmitters.last; emtr != NULL; emtr = emtr->prev) {
            mgr->renderState.emitter = emtr;
            if (!emtr->state.renderingDisabled) {
                SPLManager_DoDraw(mgr);
            }
        }
    }
}

SPLEmitter *SPLManager_CreateEmitter(SPLManager *mgr, int resourceID, const VecFx32 *pos)
{
    SPLEmitter *emtr = NULL;

    if (mgr->inactiveEmitters.first != NULL) {
        emtr = SPLEmitterList_PopFront(&mgr->inactiveEmitters);
        SPLEmitter_Init(emtr, mgr->resources + resourceID, pos);
        SPLEmitterList_PushFront(&mgr->activeEmitters, emtr);

        if (emtr->resource->header->flags.selfMaintaining) { // Self-maintaining emitters are not returned to the user
            emtr = NULL;
        }
    }

    return emtr;
}

SPLEmitter *SPLManager_CreateEmitterWithCallback(SPLManager *mgr, int resourceID, SPLEmitterCallback initCallback)
{
    SPLEmitter *emtr = NULL;
    if (mgr->inactiveEmitters.first != NULL) {
        VecFx32 pos = { 0, 0, 0 };
        emtr = SPLEmitterList_PopFront(&mgr->inactiveEmitters);
        SPLEmitter_Init(emtr, mgr->resources + resourceID, &pos);

        if (initCallback != NULL) {
            initCallback(emtr);
        }

        SPLEmitterList_PushFront(&mgr->activeEmitters, emtr);

        if (emtr->resource->header->flags.selfMaintaining) { // Self-maintaining emitters are not returned to the user
            emtr = NULL;
        }
    }

    return emtr;
}

SPLEmitter *SPLManager_CreateEmitterWithCallbackEx(SPLManager *mgr, int resourceID, VecFx32 *pos, void *param, SPLEmitterCallbackEx initCallback)
{
    SPLEmitter *emtr = NULL;
    if (mgr->inactiveEmitters.first != NULL) {
        emtr = SPLEmitterList_PopFront(&mgr->inactiveEmitters);
        SPLEmitter_Init(emtr, mgr->resources + resourceID, pos);

        if (initCallback != NULL) {
            initCallback(emtr, param);
        }

        SPLEmitterList_PushFront(&mgr->activeEmitters, emtr);

        if (emtr->resource->header->flags.selfMaintaining) { // Self-maintaining emitters are not returned to the user
            emtr = NULL;
        }
    }

    return emtr;
}

void SPLManager_DeleteEmitter(SPLManager *mgr, SPLEmitter *emtr)
{
    SPLParticle *ptcl = SPLParticleList_PopFront(&emtr->particles);
    while (ptcl != NULL) {
        SPLParticleList_PushFront(&mgr->inactiveParticles, ptcl);
        ptcl = SPLParticleList_PopFront(&emtr->particles);
    }

    ptcl = SPLParticleList_PopFront(&emtr->childParticles);
    while (ptcl != NULL) {
        SPLParticleList_PushFront(&mgr->inactiveParticles, ptcl);
        ptcl = SPLParticleList_PopFront(&emtr->childParticles);
    }

    SPLEmitterList_Erase(&mgr->activeEmitters, emtr);
    SPLEmitterList_PushFront(&mgr->inactiveEmitters, emtr);
}

void SPLManager_DeleteAllEmitters(SPLManager *mgr)
{
    SPLEmitter *emtr = mgr->activeEmitters.first;
    while (emtr != NULL) {
        SPLEmitter *next = emtr->next;
        SPLManager_DeleteEmitter(mgr, emtr);
        emtr = next;
    }
}

void SPLManager_Emit(SPLManager *mgr, SPLEmitter *emtr)
{
    SPLEmitter_Emit(emtr, &mgr->inactiveParticles);
}

void SPLManager_EmitAt(SPLManager *mgr, SPLEmitter *emtr, VecFx32 *pos)
{
    emtr->position.x = pos->x + emtr->resource->header->emitterBasePos.x;
    emtr->position.y = pos->y + emtr->resource->header->emitterBasePos.y;
    emtr->position.z = pos->z + emtr->resource->header->emitterBasePos.z;
    SPLEmitter_Emit(emtr, &mgr->inactiveParticles);
}
