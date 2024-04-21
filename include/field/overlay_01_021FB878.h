#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_021FB878_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_021FB878_H

#include "filesystem_files_def.h"
#include "heap.h"

typedef struct Field3dModel {
    void *unk_00;
    NNSG3dResMdlSet *unk_04;
    NNSG3dResMdl *unk_08;
    NNSG3dResTex *unk_0C;
} Field3dModel;

typedef struct Field3DModelAnimation {
    void *unk_00;
    void *unk_04;
    NNSG3dAnmObj *unk_08;
    int unk_0C;
    BOOL unk_10;
} Field3DModelAnimation;

typedef struct Field3dObject {
    NNSG3dRenderObj unk_00;
    VecFx32 unk_54;
    VecFx32 unk_60;
    BOOL unk_6C;
    u16 unk_70[3];
    u16 unk_76;
} Field3dObject;

void Field3dModel_LoadFromFilesystem(Field3dModel *model, NarcId narcId, s32 fileId, HeapID heapId);
void Field3dModel_Unload(Field3dModel *model);
void Field3dModelAnimation_LoadFromFilesystem(Field3DModelAnimation *anim, Field3dModel *model, NarcId narcId, s32 fileId, HeapID heapId, NNSFndAllocator *alloc);
void Field3dModelAnimation_Unload(Field3DModelAnimation *anim, NNSFndAllocator *a1);
BOOL Field3dModelAnimation_FrameAdvanceAndLoop(Field3DModelAnimation *anim, fx32 a1);
BOOL Field3dModelAnimation_FrameAdvanceAndCheck(Field3DModelAnimation *anim, fx32 a1);
void Field3dModelAnimation_FrameSet(Field3DModelAnimation *anim, fx32 a1);
void ov01_021FBF2C(Field3dObject *object, Field3dModel *model);
void ov01_021FBF50(Field3dObject *object, Field3DModelAnimation *anim);
void ov01_021FBF5C(Field3dObject *object, Field3DModelAnimation *anim);
void ov01_021FBF68(Field3dObject *object);
void ov01_021FC004(Field3dObject *object, int a1);
void Field3dObject_SetPos(Field3dObject *object, fx32 x, fx32 y, fx32 z);

#endif //POKEHEARTGOLD_FIELD_OVERLAY_01_021FB878_H
