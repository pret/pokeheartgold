#ifndef POKEHEARTGOLD_UNK_02014DA0_H
#define POKEHEARTGOLD_UNK_02014DA0_H

#include "filesystem_files_def.h"
#include "camera.h"
#include "spl.h"

typedef struct ParticleSystem ParticleSystem;

typedef u32 (*texAllocFun)(u32 szByte, BOOL is4x4comp);
typedef u32 (*plttAllocFun)(u32 szByte, BOOL is4pltt);

void sub_02014DA0(void);
ParticleSystem *sub_02014DB4(texAllocFun texAlloc, plttAllocFun plttAlloc, void *particleHeap, u32 workSize, BOOL a4, HeapID heapId);
void sub_02014EBC(ParticleSystem *particleSystem);
Camera *sub_02015524(ParticleSystem *particleSystem);
void *sub_02015264(NarcId narcId, int fileId, HeapID heapId);
void sub_0201526C(ParticleSystem *particleSystem, void *data, u32 flag, BOOL loadNow);
void sub_02015354(NNSGfdTexKey texKey);
void sub_02015394(NNSGfdPlttKey plttKey);
void sub_02015494(ParticleSystem *particleSystem, int res_no, void (*fp_callback)(struct SPLEmitter *), void *arg);
BOOL sub_020154B0(ParticleSystem *particleSystem);
void* sub_02015504(void);
int sub_0201543C(void);
void sub_02015460(void);
void *sub_020154D0(ParticleSystem *particleSystem);
int sub_02015420(void);
void sub_02015528(ParticleSystem *particleSystem, int a1);

#endif //POKEHEARTGOLD_UNK_02014DA0_H
