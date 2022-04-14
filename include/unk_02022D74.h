#ifndef POKEHEARTGOLD_UNK_02022D74_H
#define POKEHEARTGOLD_UNK_02022D74_H

#include "heap.h"

typedef struct GF_Camera GF_Camera;
typedef struct GF_CameraAngle {
    u16 x;
    u16 y;
    u16 z;
    u16 dummy;
} GF_CameraAngle;

GF_Camera *GF_Camera_Create(HeapID heapId);

void GF_Camera_SetClipBounds(fx32, fx32, GF_Camera *);
void sub_02023120(GF_Camera *unk);
void sub_02023154(void);
void GF_Camera_InitFromTargetDistanceAndAngle(VecFx32 *target, int distance, GF_CameraAngle *angle, u16 a3, u8 a4, BOOL a5, GF_Camera *camera);
void GF_Camera_ShiftBy(const VecFx32 *, GF_Camera *);
void GF_Camera_SetBindTarget(VecFx32 *, GF_Camera *);
void GF_Camera_RegisterToStaticPtr(GF_Camera *);
u16 GF_Camera_GetPerspectiveAngle(GF_Camera *camera);
fx32 GF_Camera_GetDistance(GF_Camera *camera);
GF_CameraAngle GF_Camera_GetAngle(GF_Camera *camera);
VecFx32 GF_Camera_GetTarget(GF_Camera *camera);
VecFx32 *GF_Camera_GetBindTarget(GF_Camera *camera);
void GF_Camera_SetAngle(GF_CameraAngle *angle, GF_Camera *camera);
void GF_Camera_SetPerspectiveAngle(u16 a0, GF_Camera *a1);
void GF_Camera_SetDistance(fx32 a0, GF_Camera *a1);
void sub_02023214(VecFx32 *vec, GF_Camera *a1);

#endif //POKEHEARTGOLD_UNK_02022D74_H
