#ifndef POKEHEARTGOLD_UNK_02019014_H
#define POKEHEARTGOLD_UNK_02019014_H

#include "unk_02022D74.h"

typedef struct GF_3dCamera GF_3dCamera;

struct UnkStruct_02019040 {
    u16 unk_0;
    u16 unk_2;
    VecFx32 unk_4;
    u32 unk_10;
};

GF_3dCamera *GF_3dCamera_Create(HeapID heapId, UnkStruct_02022D74 *a1);
u8 GF_3dCamera_MovementActive(GF_3dCamera *a0);
void GF_3dCamera_BeginMovement(GF_3dCamera *a0, struct UnkStruct_02019040 *a1, int a2);
void GF_3dCamera_Delete(GF_3dCamera *unk);

#endif //POKEHEARTGOLD_UNK_02019014_H
