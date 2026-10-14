#ifndef SPL_MANAGER_H
#define SPL_MANAGER_H

#include <nitro/gx/g3.h>
#include <nitro/types.h>

#include "spl_emitter.h"
#include "spl_particle.h"
#include "spl_texture.h"

typedef void *(*SPLAllocFunc)(u32);

enum SPLDrawOrder {
    SPL_DRAW_ORDER_REVERSE = 0,
    SPL_DRAW_ORDER_NORMAL = 1,
};

typedef struct SPLManager {
    SPLAllocFunc alloc;
    SPLEmitterList activeEmitters;
    SPLEmitterList inactiveEmitters;
    SPLParticleList inactiveParticles;
    SPLResource *resources;
    SPLTexture *textures;
    u16 resCount;
    u16 texCount;
    u16 maxEmitters;
    u16 maxParticles;
    struct {
        u32 min : 6;
        u32 max : 6;
        u32 current : 6;
        u32 fix : 6;
        u32 drawOrder : 1;
        u32 unused : 7;
    } polygonID;
    GXPolygonAttrMisc miscPolygonAttr;
    struct {
        SPLEmitter *emitter; // current emitter being processed
        const MtxFx43 *viewMatrix; // current view matrix
    } renderState;
    u16 currentCycle;
    u16 reserved;
} SPLManager;

typedef void (*SPLEmitterCallback)(SPLEmitter *emtr);
typedef void (*SPLEmitterCallbackEx)(SPLEmitter *emtr, void *param);

typedef u32 (*SPLTexVRAMAllocFunc)(u32 size, BOOL is4x4comp);
typedef u32 (*SPLPalVRAMAllocFunc)(u32 size, BOOL is4pal);

SPLManager *SPLManager_New(SPLAllocFunc alloc, u16 maxEmitters, u16 maxParticles, u16 fixPolyID, u16 minPolyID, u16 maxPolyID);
void SPLManager_LoadResources(SPLManager *mgr, const void *data);
BOOL SPLManager_UploadTexturesEx(SPLManager *mgr, SPLTexVRAMAllocFunc vramAlloc);
BOOL SPLManager_UploadPalettesEx(SPLManager *mgr, SPLPalVRAMAllocFunc vramAlloc);
BOOL SPLManager_UploadTextures(SPLManager *mgr);
BOOL SPLManager_UploadPalettes(SPLManager *mgr);
void SPLManager_Update(SPLManager *mgr);
void SPLManager_Draw(SPLManager *mgr, const MtxFx43 *viewMatrix);
SPLEmitter *SPLManager_CreateEmitter(SPLManager *mgr, int resourceID, const VecFx32 *pos);
SPLEmitter *SPLManager_CreateEmitterWithCallback(SPLManager *mgr, int resourceID, SPLEmitterCallback initCallback);
SPLEmitter *SPLManager_CreateEmitterWithCallbackEx(SPLManager *mgr, int resourceID, VecFx32 *pos, void *param, SPLEmitterCallbackEx initCallback);
void SPLManager_DeleteEmitter(SPLManager *mgr, SPLEmitter *emtr);
void SPLManager_DeleteAllEmitters(SPLManager *mgr);
void SPLManager_Emit(SPLManager *mgr, SPLEmitter *emtr);
void SPLManager_EmitAt(SPLManager *mgr, SPLEmitter *emtr, VecFx32 *pos);

#endif // SPL_MANAGER_H
