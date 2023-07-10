#include "global.h"
#include <nnsys/g3d.h>
#include <nitro/fx.h>
#include "camera.h"

static void Camera_CalcLookAtPosFromTargetAndAngle(Camera *camera);
static void Camera_CalcLookAtTargetFromPosAndAngle(Camera *camera);
static void Camera_InitInternal(u16 perspectiveAngle, Camera *camera);
static void Camera_VecResetCoordsIfOffsetComponentNotEnabled(Camera *camera, VecFx32 *vec);
static void Camera_GetVecFromSomeRingBufferMaybe(Camera *camera, const VecFx32 *vecDefault, VecFx32 *vecDest);

GXBufferMode gG3dDepthBufferingMode = GX_BUFFERMODE_W;
static Camera *sCameraPtr;

extern void Camera_OffsetLookAtPosAndTarget(const VecFx32 *delta, Camera *camera);
extern fx16 CalcAngleBetweenVecs(VecFx32 *a, VecFx32 *b);

static void Camera_CalcLookAtPosFromTargetAndAngle(Camera *camera) {
    u16 negx = -camera->angle.x;
    camera->lookAt.camPos.x = FX_Mul(FX_Mul(FX_SinIdx(camera->angle.y), camera->distance), FX_CosIdx(camera->angle.x));
    camera->lookAt.camPos.z = FX_Mul(FX_Mul(FX_CosIdx(camera->angle.y), camera->distance), FX_CosIdx(camera->angle.x));
    camera->lookAt.camPos.y = FX_Mul(FX_SinIdx(negx), camera->distance);
    VEC_Add(&camera->lookAt.camPos, &camera->lookAt.camTarget, &camera->lookAt.camPos);
}

static void Camera_CalcLookAtTargetFromPosAndAngle(Camera *camera) {
    u16 negx = -camera->angle.x;
    camera->lookAt.camTarget.x = -FX_Mul(FX_Mul(FX_SinIdx(camera->angle.y), camera->distance), FX_CosIdx(camera->angle.x));
    camera->lookAt.camTarget.z = -FX_Mul(FX_Mul(FX_CosIdx(camera->angle.y), camera->distance), FX_CosIdx(camera->angle.x));
    camera->lookAt.camTarget.y = -FX_Mul(FX_SinIdx(negx), camera->distance);
    VEC_Add(&camera->lookAt.camTarget, &camera->lookAt.camPos, &camera->lookAt.camTarget);
}

static void Camera_InitInternal(u16 perspectiveAngle, Camera *camera) {
    camera->perspectiveAngle = perspectiveAngle;
    camera->perspective.fovySin = FX_SinIdx(perspectiveAngle);
    camera->perspective.fovyCos = FX_CosIdx(perspectiveAngle);
    camera->perspective.aspect = FX32_CONST(1.33333333); // 4x3
    camera->perspective.near = FX32_CONST(150);
    camera->perspective.far = FX32_CONST(900);
    camera->lookAt.camUp.x = 0;
    camera->lookAt.camUp.y = FX32_ONE;
    camera->lookAt.camUp.z = 0;
    camera->curTarget = NULL;
    camera->enableOffsetX = FALSE;
    camera->enableOffsetY = FALSE;
    camera->enableOffsetZ = FALSE;
    camera->history = NULL;
}

static void Camera_VecResetCoordsIfOffsetComponentNotEnabled(Camera *camera, VecFx32 *vec) {
    if (!camera->enableOffsetX) {
        vec->x = 0;
    }
    if (!camera->enableOffsetY) {
        vec->y = 0;
    }
    if (!camera->enableOffsetZ) {
        vec->z = 0;
    }
}

static void Camera_GetVecFromSomeRingBufferMaybe(Camera *camera, const VecFx32 *vecDefault, VecFx32 *vecDest) {
    if (camera->history == NULL) {
        *vecDest = *vecDefault;
    } else if (camera->history->unk24 == FALSE) {
        *vecDest = *vecDefault;
    } else {
        s32 *idxPtr = &camera->history->readIdx;
        s32 *idx2Ptr = &camera->history->writeIdx;
        if (!camera->history->overrideEnabled) {
            *vecDest = *vecDefault;
            if (*idxPtr == camera->history->writeIdxInit) {
                camera->history->overrideEnabled = TRUE;
            }
        } else {
            *vecDest = camera->history->vecs[camera->history->readIdx];
        }
        *idxPtr = (*idxPtr + 1) % camera->history->count;
        camera->history->vecs[*idx2Ptr] = *vecDefault;
        *idx2Ptr = (*idx2Ptr + 1) % camera->history->count;
        if (!camera->history->enableUpdateX) {
            vecDest->x = vecDefault->x;
        }
        if (!camera->history->enableUpdateY) {
            vecDest->y = vecDefault->y;
        }
        if (!camera->history->enableUpdateZ) {
            vecDest->z = vecDefault->z;
        }
    }
}

void Camera_History_New(s32 count, s32 initialWriteIdx, s32 updateEnableFlags, HeapID heapId, Camera *camera) {
    if (camera->curTarget == NULL) {
        return;
    }
    GF_ASSERT(initialWriteIdx + 1 <= count);
    CameraHistory *history = AllocFromHeap(heapId, sizeof(CameraHistory));
    history->vecs = AllocFromHeap(heapId, sizeof(VecFx32) * count);
    for (s32 i = 0; i < count; i++) {
        history->vecs[i].x = 0;
        history->vecs[i].y = 0;
        history->vecs[i].z = 0;
    }
    history->count = count;
    history->readIdx = 0;
    history->writeIdx = initialWriteIdx;
    history->writeIdxInit = initialWriteIdx;
    history->overrideEnabled = FALSE;
    history->enableUpdateX = FALSE;
    history->enableUpdateY = FALSE;
    history->enableUpdateZ = FALSE;
    if (updateEnableFlags & CAMERA_UPDATE_ENABLE_X) {
        history->enableUpdateX = TRUE;
    }
    if (updateEnableFlags & CAMERA_UPDATE_ENABLE_Y) {
        history->enableUpdateY = TRUE;
    }
    if (updateEnableFlags & CAMERA_UPDATE_ENABLE_Z) {
        history->enableUpdateZ = TRUE;
    }
    history->unk24 = TRUE;
    camera->history = history;
}

void Camera_History_Delete(Camera *camera) {
    if (camera->history != NULL) {
        FreeToHeap(camera->history->vecs);
        FreeToHeap(camera->history);
        camera->history = NULL;
    }
}

Camera *Camera_New(HeapID heapId) {
    return AllocFromHeap(heapId, sizeof(Camera));
}

void Camera_Delete(Camera *camera) {
    FreeToHeap(camera);
}

void Camera_Copy(Camera *src, Camera *dest) {
    *dest = *src;
}

void Camera_SetStaticPtr(Camera *camera) {
    sCameraPtr = camera;
}

void Camera_UnsetStaticPtr(void) {
    sCameraPtr = NULL;
}

void Camera_PushLookAtToNNSGlb(void) {
    VecFx32 diff;
    VecFx32 offset;
    if (sCameraPtr == NULL) {
        return;
    }
    if (sCameraPtr->curTarget != NULL) {
        VEC_Subtract(sCameraPtr->curTarget, &sCameraPtr->lastTarget, &diff);
        Camera_VecResetCoordsIfOffsetComponentNotEnabled(sCameraPtr, &diff);
        Camera_GetVecFromSomeRingBufferMaybe(sCameraPtr, &diff, &offset);
        Camera_OffsetLookAtPosAndTarget(&offset, sCameraPtr);
        sCameraPtr->lastTarget = *sCameraPtr->curTarget;
    }
    NNS_G3dGlbLookAt(&sCameraPtr->lookAt.camPos, &sCameraPtr->lookAt.camUp, &sCameraPtr->lookAt.camTarget);
}

void Camera_SetLookAtCamUp(VecFx32 *camUp, Camera *camera) {
    camera->lookAt.camUp = *camUp;
}

void Camera_SetFixedTarget(VecFx32 *target, Camera *camera) {
    camera->curTarget = target;
    camera->lastTarget = *target;
    camera->enableOffsetX = TRUE;
    camera->enableOffsetY = TRUE;
    camera->enableOffsetZ = TRUE;
}

void Camera_ClearFixedTarget(Camera *camera) {
    camera->curTarget = NULL;
    camera->enableOffsetX = FALSE;
    camera->enableOffsetY = FALSE;
    camera->enableOffsetZ = FALSE;
}

void Camera_SetPerspectiveClippingPlane(fx32 near, fx32 far, Camera *camera) {
    camera->perspective.near = near;
    camera->perspective.far = far,
    Camera_ApplyPerspectiveType(camera->perspectiveType, camera);
}

void Camera_Init_FromTargetDistanceAndAngle(VecFx32 *target, fx32 distance, CameraAngle *angle, u16 perspectiveAngle, u8 perspectiveType, BOOL setReference, Camera *camera) {
    Camera_InitInternal(perspectiveAngle, camera);
    camera->lookAt.camTarget = *target;
    camera->distance = distance;
    camera->angle = *angle;
    Camera_CalcLookAtPosFromTargetAndAngle(camera);
    Camera_ApplyPerspectiveType(perspectiveType, camera);
    if (!setReference) {
        return;
    }        
    camera->curTarget = target;
    camera->lastTarget = *target;
    camera->enableOffsetX = TRUE;
    camera->enableOffsetY = TRUE;
    camera->enableOffsetZ = TRUE;
}

void Camera_Init_FromPosDistanceAndAngle(VecFx32 *pos, fx32 distance, CameraAngle *angle, u16 perspectiveAngle, u8 perspectiveType, Camera *camera) {
    Camera_InitInternal(perspectiveAngle, camera);
    camera->lookAt.camPos = *pos;
    camera->distance = distance;
    camera->angle = *angle;
    Camera_CalcLookAtTargetFromPosAndAngle(camera);
    Camera_ApplyPerspectiveType(perspectiveType, camera);
}

void Camera_Init_FromTargetAndPos(const VecFx32 *target, const VecFx32 *pos, u16 perspectiveAngle, u8 perspectiveType, BOOL setReference, Camera *camera) {
    VecFx32 vec_from_pos_to_target;
    Camera_InitInternal(perspectiveAngle, camera);

    camera->lookAt.camTarget = *target;
    camera->lookAt.camPos = *pos;

    VEC_Subtract(pos, target, &vec_from_pos_to_target);
    camera->distance = VEC_Mag(&vec_from_pos_to_target);
    VecFx32 sp24 = {0, 0, 0}; // unused
    VecFx32 sp18 = {0, 0, 0}; // unused
    VecFx32 sp0C = {0, 0, 0};
    VecFx32 sp00;

    sp00.x = 0;
    sp00.y = 0;
    sp00.z = FX32_ONE;
    sp0C = vec_from_pos_to_target;
    sp0C.y = 0;
    camera->angle.y = CalcAngleBetweenVecs(&sp00, &sp0C);

    sp00.x = FX32_ONE;
    sp00.y = 0;
    sp00.z = 0;
    sp0C.x = vec_from_pos_to_target.z;
    sp0C.z = vec_from_pos_to_target.y;
    sp0C.y = 0;
    camera->angle.x = CalcAngleBetweenVecs(&sp00, &sp0C);

    camera->angle.z = 0;
    Camera_ApplyPerspectiveType(perspectiveType, camera);

    if (!setReference) {
        return;
    }
    camera->curTarget = target;
    camera->lastTarget = *target;
    camera->enableOffsetX = TRUE;
    camera->enableOffsetY = TRUE;
    camera->enableOffsetZ = TRUE;
}

void Camera_ApplyPerspectiveType(u8 perspectiveType, Camera *camera) {
    if (perspectiveType == CAMERA_PERSPECTIVE_TYPE_PERSPECTIVE) {
        NNS_G3dGlbPerspective(camera->perspective.fovySin, camera->perspective.fovyCos, camera->perspective.aspect, camera->perspective.near, camera->perspective.far);
        camera->perspectiveType = CAMERA_PERSPECTIVE_TYPE_PERSPECTIVE;
        gG3dDepthBufferingMode = GX_BUFFERMODE_Z;
    } else {
        fx32 y = FX_Mul(FX_Div(camera->perspective.fovySin, camera->perspective.fovyCos), camera->distance);
        fx32 x = FX_Mul(y, camera->perspective.aspect);
        NNS_G3dGlbOrtho(y, -y, -x, x, camera->perspective.near, camera->perspective.far);
        camera->perspectiveType = CAMERA_PERSPECTIVE_TYPE_ORTHOGRAPHIC;
        gG3dDepthBufferingMode = GX_BUFFERMODE_Z;
    }
}

void Camera_SetPerspectiveAngle(u16 perspectiveAngle, Camera *camera) {
    camera->perspectiveAngle = perspectiveAngle;
    camera->perspective.fovySin = FX_SinIdx(camera->perspectiveAngle);
    camera->perspective.fovyCos = FX_CosIdx(camera->perspectiveAngle);
    Camera_ApplyPerspectiveType(camera->perspectiveType, camera);
}

void Camera_AdjustPerspectiveAngle(u16 rotation, Camera *camera) {
    camera->perspectiveAngle += rotation;
    camera->perspective.fovySin = FX_SinIdx(camera->perspectiveAngle);
    camera->perspective.fovyCos = FX_CosIdx(camera->perspectiveAngle);
    Camera_ApplyPerspectiveType(camera->perspectiveType, camera);
}

void Camera_OffsetLookAtPosAndTarget(const VecFx32 *delta, Camera *camera) {
    VEC_Add(&camera->lookAt.camPos, delta, &camera->lookAt.camPos);
    VEC_Add(&camera->lookAt.camTarget, delta, &camera->lookAt.camTarget);
}

void Camera_SetAngleTarget(const CameraAngle *angle, Camera *camera) {
    camera->angle = *angle;
    Camera_CalcLookAtTargetFromPosAndAngle(camera);
}

void Camera_SetAnglePos(const CameraAngle *angle, Camera *camera) {
    camera->angle = *angle;
    Camera_CalcLookAtPosFromTargetAndAngle(camera);
}

void Camera_AdjustAngleTarget(const CameraAngle *delta, Camera *camera) {
    camera->angle.x += delta->x;
    camera->angle.y += delta->y;
    camera->angle.z += delta->z;
    Camera_CalcLookAtTargetFromPosAndAngle(camera);
}

void Camera_AdjustAnglePos(const CameraAngle *delta, Camera *camera) {
    camera->angle.x += delta->x;
    camera->angle.y += delta->y;
    camera->angle.z += delta->z;
    Camera_CalcLookAtPosFromTargetAndAngle(camera);
}

void Camera_SetDistance(fx32 distance, Camera *camera) {
    camera->distance = distance;
    Camera_CalcLookAtPosFromTargetAndAngle(camera);
}

void Camera_SetLookAtTargetAndRecalcPos(const VecFx32 *target, Camera *camera) {
    camera->lookAt.camTarget = *target;
    Camera_CalcLookAtPosFromTargetAndAngle(camera);
}

void Camera_AdjustDistance(fx32 distance, Camera *camera) {
    camera->distance += distance;
    Camera_CalcLookAtPosFromTargetAndAngle(camera);
}

u16 Camera_GetPerspectiveAngle(Camera *camera) {
    return camera->perspectiveAngle;
}

fx32 Camera_GetDistance(Camera *camera) {
    return camera->distance;
}

CameraAngle Camera_GetAngle(Camera *camera) {
    CameraAngle angle = camera->angle;
    return angle;
}

VecFx32 Camera_GetLookAtCamTarget(const Camera *camera) {
    VecFx32 target = camera->lookAt.camTarget;
    return target;
}

VecFx32 Camera_GetLookAtCamPos(const Camera *camera) {
    VecFx32 pos = camera->lookAt.camPos;
    return pos;
}

fx32 Camera_GetPerspectiveClippingPlaneFar(const Camera *camera) {
    return camera->perspective.far;
}

fx32 Camera_GetPerspectiveClippingPlaneNear(const Camera *camera) {
    return camera->perspective.near;
}

const VecFx32 *Camera_GetCurrentTarget(const Camera *camera) {
    return camera->curTarget;
}

void Camera_SetLookAtCamTarget(const VecFx32 *target, Camera *camera) {
    camera->lookAt.camTarget = *target;
}

void Camera_SetLookAtCamPos(const VecFx32 *pos, Camera *camera) {
    camera->lookAt.camPos = *pos;
}

void Camera_SetHistoryUnk24(Camera *camera, BOOL param1) {
    if (camera->history == NULL) {
        return;
    }
    if (param1) {
        camera->history->unk24 = TRUE;
    } else {
        camera->history->unk24 = FALSE;
    }
}
