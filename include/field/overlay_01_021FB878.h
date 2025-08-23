#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_021FB878_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_021FB878_H

#include "filesystem_files_def.h"
#include "heap.h"

typedef struct Field3dModel {
    void *dataRaw;
    NNSG3dResMdlSet *modelSet;
    NNSG3dResMdl *model;
    NNSG3dResTex *texture;
} Field3dModel;

typedef struct Field3DModelAnimation {
    void *fileDataRaw;
    void *animRaw;
    NNSG3dAnmObj *animObj;
    int frame;
    BOOL shouldRetainData; // if FALSE, fileDataRaw is freed on unload
} Field3DModelAnimation;

typedef struct Field3dObject {
    NNSG3dRenderObj renderObj;
    VecFx32 matrix;
    VecFx32 scale;
    BOOL active;
    u16 rotation[3];
    u16 padding;
} Field3dObject;

void Field3dModel_LoadFromFilesystem(Field3dModel *model, NarcId narcId, s32 fileId, HeapID heapId);
void Field3dModel_Unload(Field3dModel *model);
void Field3dModelAnimation_LoadFromFilesystem(Field3DModelAnimation *anim, Field3dModel *model, NarcId narcId, s32 fileId, HeapID heapId, NNSFndAllocator *alloc);
void Field3dModelAnimation_Unload(Field3DModelAnimation *anim, NNSFndAllocator *alloc);
BOOL Field3dModelAnimation_FrameAdvanceAndLoop(Field3DModelAnimation *anim, fx32 ov01_021FC004);
BOOL Field3dModelAnimation_FrameAdvanceAndCheck(Field3DModelAnimation *anim, fx32 framesBy);
void Field3dModelAnimation_FrameSet(Field3DModelAnimation *anim, fx32 frame);
void Field3dObject_InitFromModel(Field3dObject *object, Field3dModel *model);
void Field3dObject_AddAnimation(Field3dObject *object, Field3DModelAnimation *anim);
void Field3dObject_RemoveAnimation(Field3dObject *object, Field3DModelAnimation *anim);
void Field3dObject_Draw(Field3dObject *object);
void Field3dObject_SetActiveFlag(Field3dObject *object, BOOL active);
void Field3dObject_SetPosEx(Field3dObject *object, fx32 x, fx32 y, fx32 z);

#endif // POKEHEARTGOLD_FIELD_OVERLAY_01_021FB878_H
