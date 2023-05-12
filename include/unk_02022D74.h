#ifndef POKEHEARTGOLD_UNK_02022D74_H
#define POKEHEARTGOLD_UNK_02022D74_H

#include "heap.h"

typedef struct Camera Camera;
typedef struct CameraAngle {
    u16 x;
    u16 y;
    u16 z;
    u16 dummy;
} CameraAngle;

Camera *Camera_Create(HeapID heapId);

void Camera_SetClipBounds(fx32, fx32, Camera *);
void sub_02023120(Camera *unk);
void sub_02023154(void);
void Camera_InitFromTargetDistanceAndAngle(VecFx32 *target, int distance, CameraAngle *angle, u16 a3, u8 a4, BOOL a5, Camera *camera);
void Camera_ShiftBy(const VecFx32 *, Camera *);
void Camera_SetBindTarget(VecFx32 *, Camera *);
void Camera_RegisterToStaticPtr(Camera *);
u16 Camera_GetPerspectiveAngle(Camera *camera);
fx32 Camera_GetDistance(Camera *camera);
CameraAngle Camera_GetAngle(Camera *camera);
VecFx32 Camera_GetTarget(Camera *camera);
VecFx32 *Camera_GetBindTarget(Camera *camera);
void Camera_SetAngle(CameraAngle *angle, Camera *camera);
void Camera_SetPerspectiveAngle(u16 a0, Camera *a1);
void Camera_SetDistance(fx32 a0, Camera *a1);
void sub_02023214(VecFx32 *vec, Camera *a1);

#endif //POKEHEARTGOLD_UNK_02022D74_H
