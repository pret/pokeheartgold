#ifndef POKEHEARTGOLD_PARTICLE_SYSTEM_H
#define POKEHEARTGOLD_PARTICLE_SYSTEM_H

#include <nitro/fx/fx.h>
#include <nnsys.h>

#include "constants/heap.h"

#include "camera.h"
#include "filesystem.h"
#include "spl.h"

#define MAX_PARTICLE_SYSTEMS 16  // Global maximum number of particle systems
#define MAX_EMITTERS         20  // Maximum number of concurrent emitters per particle system
#define MAX_PARTICLES        200 // Maximum number of concurrent particles per particle system
#define MAX_TEXTURE_KEYS     16
#define MAX_PALETTE_KEYS     16

enum VRAMAutoRelease {
    VRAM_AUTO_RELEASE_NONE = 0,

    VRAM_AUTO_RELEASE_TEXTURE_FRM = (1 << 0), // Auto-release VRAM using the Frame Texture VRAM Manager
    VRAM_AUTO_RELEASE_TEXTURE_LNK = (1 << 1), // Auto-release VRAM using the Linked-List Texture VRAM Manager
    VRAM_AUTO_RELEASE_PALETTE_FRM = (1 << 2), // Auto-release VRAM using the Frame Palette VRAM Manager
    VRAM_AUTO_RELEASE_PALETTE_LNK = (1 << 3), // Auto-release VRAM using the Linked-List Palette VRAM Manager
};

typedef struct ParticleSystem {
    SPLManager *manager;
    void *resource;
    SPLEmitter *lastAddedEmitter;
    void *heapStart;
    void *heap;
    void *heapEnd;
    SPLTexVRAMAllocFunc texAllocFunc;
    SPLPalVRAMAllocFunc palAllocFunc;
    Camera *camera;
    VecFx32 unused1;
    u16 cameraFov;
    VecFx32 cameraPos;
    VecFx32 cameraUp;
    VecFx32 cameraTarget;
    union {
        NNSGfdFrmTexVramState textureVRAMState;
        NNSGfdTexKey textureKeys[MAX_TEXTURE_KEYS];
    };
    union {
        NNSGfdFrmPlttVramState paletteVRAMState;
        NNSGfdPlttKey paletteKeys[MAX_PALETTE_KEYS];
    };
    u8 vramAutoRelease;
    u8 unused2;
    u8 id;
    u8 cameraProjection;
} ParticleSystem;

void ParticleSystem_ZeroAll(void);

// When using a custom texture/palette allocator function, be sure to use
// ParticleSystem_RegisterTextureKey or ParticleSystem_RegisterPaletteKey to register
// allocated textures in the particle system.
ParticleSystem *ParticleSystem_New(SPLTexVRAMAllocFunc texAllocFunc, SPLPalVRAMAllocFunc palAllocFunc, void *heap, int heapSize, BOOL hasCamera, enum HeapID heapID);
void ParticleSystem_Free(ParticleSystem *particleSystem);
void ParticleSystem_FreeAll(void);
void *ParticleSystem_LoadResourceFromNARC(enum NarcId narcID, int memberIndex, enum HeapID heapID);
void ParticleSystem_SetResource(ParticleSystem *particleSystem, void *resource, int autoRelease, BOOL uploadImmediately);
void ParticleSystem_RegisterTextureKey(NNSGfdTexKey key);
void ParticleSystem_RegisterPaletteKey(NNSGfdPlttKey key);
void ParticleSystem_Draw(ParticleSystem *particleSystem);
void ParticleSystem_Update(ParticleSystem *particleSystem);
int ParticleSystem_GetActiveAmount(void);
int ParticleSystem_DrawAll(void);
int ParticleSystem_UpdateAll(void);
SPLEmitter *ParticleSystem_CreateEmitter(ParticleSystem *particleSystem, int resourceID, const VecFx32 *position);
SPLEmitter *ParticleSystem_CreateEmitterWithCallback(ParticleSystem *particleSystem, int resourceID, SPLEmitterCallback callback, void *param);
s32 ParticleSystem_GetActiveEmitterCount(ParticleSystem *particleSystem);
void ParticleSystem_DeleteAllEmitters(ParticleSystem *particleSystem);
void ParticleSystem_DeleteEmitter(ParticleSystem *particleSystem, SPLEmitter *emitter);
void *ParticleSystem_GetHeapStart(ParticleSystem *particleSystem);
void ParticleSystem_GetCameraUp(ParticleSystem *particleSystem, VecFx32 *up);
void ParticleSystem_SetCameraUp(ParticleSystem *particleSystem, const VecFx32 *up);
void *ParticleSystem_GetEmitterCallbackParam(void);
void ParticleSystem_GetDefaultCameraUp(VecFx32 *up);
Camera *ParticleSystem_GetCamera(ParticleSystem *particleSystem);
void ParticleSystem_SetCameraProjection(ParticleSystem *particleSystem, enum CameraPerspectiveType projection);
u8 ParticleSystem_GetCameraProjection(ParticleSystem *particleSystem);
void ParticleSystem_GetEmitterAxis(SPLEmitter *emitter, VecFx16 *axis);
void ParticleSystem_SetEmitterEmissionCount(SPLEmitter *emitter, fx32 count);
void ParticleSystem_SetEmitterGravityMagnitude(SPLEmitter *emitter, VecFx16 *maginutde);
void ParticleSystem_SetEmitterMagnetTarget(SPLEmitter *emitter, VecFx32 *target);
void ParticleSystem_GetEmitterMagnetTarget(SPLEmitter *emitter, VecFx32 *target);
void ParticleSystem_SetEmitterMagnetForce(SPLEmitter *emitter, fx16 *force);
void ParticleSystem_GetEmitterMagnetForce(SPLEmitter *emitter, fx16 *force);
void ParticleSystem_SetEmitterSpinAngle(SPLEmitter *emitter, u16 *angle);
void ParticleSystem_GetEmitterSpinAngle(SPLEmitter *emitter, u16 *angle);
void ParticleSystem_SetEmitterSpinAxis(SPLEmitter *emitter, u16 *axis);
void ParticleSystem_GetEmitterSpinAxis(SPLEmitter *emitter, u16 *axis);
void ParticleSystem_SetEmitterConvergenceTarget(SPLEmitter *emitter, VecFx32 *target);
void ParticleSystem_GetEmitterConvergenceTarget(SPLEmitter *emitter, VecFx32 *target);
void ParticleSystem_SetEmitterConvergenceForce(SPLEmitter *emitter, fx16 *force);
void ParticleSystem_GetEmitterConvergenceForce(SPLEmitter *emitter, fx16 *force);

#endif // POKEHEARTGOLD_PARTICLE_SYSTEM_H
