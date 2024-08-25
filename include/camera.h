#ifndef POKEHEARTGOLD_CAMERA_H
#define POKEHEARTGOLD_CAMERA_H

#include <nitro/fx.h>

#include "global.h"

#include "heap.h"

#define CAMERA_UPDATE_ENABLE_X 1
#define CAMERA_UPDATE_ENABLE_Y 2
#define CAMERA_UPDATE_ENABLE_Z 4

#define CAMERA_PERSPECTIVE_TYPE_PERSPECTIVE  0
#define CAMERA_PERSPECTIVE_TYPE_ORTHOGRAPHIC 1

typedef struct CameraHistory {
    s32 count;
    s32 readIdx;
    s32 writeIdx;
    s32 writeIdxInit;
    BOOL overrideEnabled;
    BOOL enableUpdateX;
    BOOL enableUpdateY;
    BOOL enableUpdateZ;
    VecFx32 *vecs;
    BOOL unk24;
} CameraHistory;

typedef struct CameraAngle {
    u16 x;
    u16 y;
    u16 z;
    u16 unused;
} CameraAngle;

typedef struct CameraPerspective {
    fx32 fovySin;
    fx32 fovyCos;
    fx32 aspect;
    fx32 near;
    fx32 far;
} CameraPerspective;

typedef struct CameraParam {
    fx32 distance;
    CameraAngle angle;
    u8 perspectiveType;
    u16 perspective;
    u8 dummy; // because gf misaccounted for the previous field's alignment
} CameraParam;

typedef struct CameraLookAt {
    VecFx32 camPos;
    VecFx32 camTarget;
    VecFx32 camUp;
} CameraLookAt;

typedef struct Camera {
    CameraPerspective perspective;
    CameraLookAt lookAt;
    fx32 distance;
    CameraAngle angle;
    u8 perspectiveType;
    u16 perspectiveAngle;
    VecFx32 lastTarget;
    const VecFx32 *curTarget;
    BOOL enableOffsetX;
    BOOL enableOffsetY;
    BOOL enableOffsetZ;
    CameraHistory *history;
} Camera;

void Camera_History_New(s32 count, s32 initialWriteIdx, s32 updateEnableFlags, HeapID heapId, Camera *camera);
void Camera_History_Delete(Camera *camera);
Camera *Camera_New(HeapID heapId);
void Camera_Delete(Camera *camera);
void Camera_Copy(Camera *src, Camera *dest);
void Camera_SetStaticPtr(Camera *camera);
void Camera_UnsetStaticPtr(void);
void Camera_PushLookAtToNNSGlb(void);
void Camera_SetLookAtCamUp(VecFx32 *camUp, Camera *camera);
void Camera_SetFixedTarget(VecFx32 *target, Camera *camera);
void Camera_ClearFixedTarget(Camera *camera);
void Camera_SetPerspectiveClippingPlane(fx32 near, fx32 far, Camera *camera);
void Camera_Init_FromTargetDistanceAndAngle(VecFx32 *target, fx32 distance, const CameraAngle *angle, u16 perspectiveAngle, u8 perspectiveType, BOOL setReference, Camera *camera);
void Camera_Init_FromPosDistanceAndAngle(VecFx32 *pos, fx32 distance, CameraAngle *angle, u16 perspectiveAngle, u8 perspectiveType, Camera *camera);
void Camera_Init_FromTargetAndPos(const VecFx32 *target, const VecFx32 *pos, u16 perspectiveAngle, u8 perspectiveType, BOOL setReference, Camera *camera);
void Camera_ApplyPerspectiveType(u8 perspectiveType, Camera *camera);
void Camera_SetPerspectiveAngle(u16 perspectiveAngle, Camera *camera);
void Camera_AdjustPerspectiveAngle(u16 rotation, Camera *camera);
void Camera_OffsetLookAtPosAndTarget(const VecFx32 *delta, Camera *camera);
void Camera_SetAngleTarget(const CameraAngle *angle, Camera *camera);
void Camera_SetAnglePos(const CameraAngle *delta, Camera *camera);
void Camera_AdjustAngleTarget(const CameraAngle *delta, Camera *camera);
void Camera_AdjustAnglePos(const CameraAngle *delta, Camera *camera);
void Camera_SetDistance(fx32 distance, Camera *camera);
void Camera_SetLookAtTargetAndRecalcPos(const VecFx32 *target, Camera *camera);
void Camera_AdjustDistance(fx32 distance, Camera *camera);
u16 Camera_GetPerspectiveAngle(Camera *camera);
fx32 Camera_GetDistance(Camera *camera);
CameraAngle Camera_GetAngle(Camera *camera);
VecFx32 Camera_GetLookAtCamTarget(const Camera *camera);
VecFx32 Camera_GetLookAtCamPos(const Camera *camera);
fx32 Camera_GetPerspectiveClippingPlaneFar(const Camera *camera);
fx32 Camera_GetPerspectiveClippingPlaneNear(const Camera *camera);
const VecFx32 *Camera_GetCurrentTarget(const Camera *camera);
void Camera_SetLookAtCamTarget(const VecFx32 *target, Camera *camera);
void Camera_SetLookAtCamPos(const VecFx32 *pos, Camera *camera);
void Camera_SetHistoryUnk24(Camera *camera, BOOL param1);

#endif // POKEHEARTGOLD_CAMERA_H
