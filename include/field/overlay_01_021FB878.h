#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_021FB878_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_021FB878_H

#include "filesystem_files_def.h"
#include "heap.h"

typedef struct UnkStruct_ov01_021FBCD8 {
    void *unk_00;
    NNSG3dResMdlSet *unk_04;
    NNSG3dResMdl *unk_08;
    NNSG3dResTex *unk_0C;
} UnkStruct_ov01_021FBCD8;

typedef struct UnkStruct_ov01_021FBE44 {
    void *unk_00;
    void *unk_04;
    NNSG3dAnmObj *unk_08;
    int unk_0C;
    BOOL unk_10;
} UnkStruct_ov01_021FBE44;

typedef struct UnkStruct_ov01_021FBF2C {
    NNSG3dRenderObj unk_00;
    VecFx32 unk_54;
    VecFx32 unk_60;
    BOOL unk_6C;
    u16 unk_70[3];
    u16 unk_76;
} UnkStruct_ov01_021FBF2C;

void ov01_021FBCD8(UnkStruct_ov01_021FBCD8 *a0, NarcId narcId, s32 fileId, HeapID heapId);
void ov01_021FBDA8(UnkStruct_ov01_021FBCD8 *a0);
void ov01_021FBE44(UnkStruct_ov01_021FBE44 *a0, UnkStruct_ov01_021FBCD8 *a1, NarcId narcId, s32 fileId, HeapID heapId, NNSFndAllocator *alloc);
void ov01_021FBE80(UnkStruct_ov01_021FBE44 *a0, NNSFndAllocator *a1);
BOOL ov01_021FBEAC(UnkStruct_ov01_021FBE44 *a0, fx32 a1);
BOOL ov01_021FBEE4(UnkStruct_ov01_021FBE44 *a0, fx32 a1);
void ov01_021FBF20(UnkStruct_ov01_021FBE44 *a0, fx32 a1);
void ov01_021FBF2C(UnkStruct_ov01_021FBF2C *a0, UnkStruct_ov01_021FBCD8 *a1);
void ov01_021FBF50(UnkStruct_ov01_021FBF2C *a0, UnkStruct_ov01_021FBE44 *a1);
void ov01_021FBF5C(UnkStruct_ov01_021FBF2C *a0, UnkStruct_ov01_021FBE44 *a1);
void ov01_021FBF68(UnkStruct_ov01_021FBF2C *a0);
void ov01_021FC004(UnkStruct_ov01_021FBF2C *a0, int a1);
void ov01_021FC00C(UnkStruct_ov01_021FBF2C *a0, fx32 x, fx32 y, fx32 z);

#endif //POKEHEARTGOLD_FIELD_OVERLAY_01_021FB878_H
