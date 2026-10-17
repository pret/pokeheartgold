#ifndef POKEHEARTGOLD_UNK_02014DA0_H
#define POKEHEARTGOLD_UNK_02014DA0_H

#include "library/spl.h"

#include "camera.h"
#include "filesystem_files_def.h"

typedef u32 (*texAllocFun)(u32 szByte, BOOL is4x4comp);
typedef u32 (*plttAllocFun)(u32 szByte, BOOL is4pltt);

void ParticleSystem_ZeroAll(void);
SPLEmitter *ParticleSystem_New(texAllocFun texAlloc, plttAllocFun plttAlloc, void *particleHeap, u32 workSize, BOOL a4, enum HeapID heapID);
void ParticleSystem_Free(SPLEmitter *emitter);
Camera *ParticleSystem_GetCamera(SPLEmitter *emitter);
void *ParticleSystem_LoadResourceFromNARC(NarcId narcId, int fileId, enum HeapID heapID);
void ParticleSystem_SetResource(SPLEmitter *emitter, void *data, u32 flag, BOOL loadNow);
void ParticleSystem_RegisterTextureKey(NNSGfdTexKey texKey);
void ParticleSystem_RegisterPaletteKey(NNSGfdPlttKey plttKey);
void ParticleSystem_CreateEmitterWithCallback(SPLEmitter *emitter, int res_no, void (*fp_callback)(struct SPLEmitter *), void *arg);
BOOL ParticleSystem_GetActiveEmitterCount(SPLEmitter *emitter);
void *ParticleSystem_GetEmitterCallbackParam(void);
int ParticleSystem_DrawAll(void);
void ParticleSystem_UpdateAll(void);
void *ParticleSystem_GetHeapStart(SPLEmitter *emitter);
int ParticleSystem_GetActiveAmount(void);
void ParticleSystem_GetEmitterAxis(SPLEmitter *emitter, VecFx16 *axis);
void ParticleSystem_SetCameraProjection(SPLEmitter *emitter, int a1);

#endif // POKEHEARTGOLD_UNK_02014DA0_H
