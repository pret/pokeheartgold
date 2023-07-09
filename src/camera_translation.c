#include "camera_translation.h"
#include "unk_0200E320.h"

static void sysTask_MoveCameraAlongTrack(SysTask *unk, GFCameraTranslationWrapper *wrapper);
static void stepCamera(Camera *camera, struct CameraTranslationPathTemplate *first, struct CameraTranslationPathTemplate *last, u8 step, u8 duration);
static void resetWrapper(GFCameraTranslationWrapper *wrapper);
static void stepAngleX(Camera *camera, const u16 *first, const u16 *last, u8 step, u8 duration);
static void stepDistance(Camera *camera, const fx32 *first, const fx32 *last, u8 step, u8 duration);
static void stepPerspective(Camera *camera, const u16 *first, const u16 *last, u8 step, u8 duration);
static void stepPosition(Camera *camera, const VecFx32 *first, const VecFx32 *last, u8 step, u8 duration);
static fx32 calcPositionComponentStep(fx32 component, u8 step, u8 duration);

GFCameraTranslationWrapper *CreateCameraTranslationWrapper(HeapID heapId, Camera *camera) {
    GFCameraTranslationWrapper *ret = AllocFromHeap(heapId, sizeof(GFCameraTranslationWrapper));
    MI_CpuClear8(ret, sizeof(GFCameraTranslationWrapper));
    ret->camera = camera;
    return ret;
}

void DeleteCameraTranslationWrapper(GFCameraTranslationWrapper *wrapper) {
    resetWrapper(wrapper);
    FreeToHeap(wrapper);
}

static inline CameraAngle getBoundCameraAngle(GFCameraTranslationWrapper *wrapper) {
    return Camera_GetAngle(wrapper->camera);
}

static inline VecFx32 getBoundCameraTarget(GFCameraTranslationWrapper *wrapper) {
    return Camera_GetLookAtCamTarget(wrapper->camera);
}

void SetCameraTranslationPath(GFCameraTranslationWrapper *wrapper, struct CameraTranslationPathTemplate *template, int duration) {
    VecFx32 target;
    CameraAngle angle;
    const VecFx32 *bindTarget;
    if (!wrapper->active && duration != 0) {
        wrapper->active = TRUE;
        wrapper->target = *template;
        angle = getBoundCameraAngle(wrapper);
        target = getBoundCameraTarget(wrapper);
        bindTarget = Camera_GetCurrentTarget(wrapper->camera);

        wrapper->init.angleX = angle.x;
        wrapper->init.perspectiveAngle = Camera_GetPerspectiveAngle(wrapper->camera);
        if (bindTarget != NULL) {
            VEC_Subtract(&target, bindTarget, &wrapper->init.position);
        } else {
            wrapper->init.position.x = 0;
            wrapper->init.position.y = 0;
            wrapper->init.position.z = 0;
        }
        wrapper->init.distance = Camera_GetDistance(wrapper->camera);
        wrapper->duration = duration;
        wrapper->step = 0;
        wrapper->task = CreateSysTask((SysTaskFunc)sysTask_MoveCameraAlongTrack, wrapper, 0);
    }
}

u8 IsCameraTranslationFinished(GFCameraTranslationWrapper *wrapper) {
    return (wrapper->active == FALSE);
}

static void sysTask_MoveCameraAlongTrack(SysTask *unk, GFCameraTranslationWrapper *wrapper) {
    if (wrapper->mode == 0) {
        wrapper->step++;
        stepCamera(wrapper->camera, &wrapper->init, &wrapper->target, wrapper->step, wrapper->duration);
        if (wrapper->step >= wrapper->duration) {
            resetWrapper(wrapper);
        }
    } else {
        stepCamera(wrapper->camera, &wrapper->target, &wrapper->init, wrapper->duration - wrapper->step, wrapper->duration);
        wrapper->step--;
        if (wrapper->step == 0) {
            resetWrapper(wrapper);
        }
    }
}

static void resetWrapper(GFCameraTranslationWrapper *wrapper) {
    if (wrapper->task != NULL) {
        DestroySysTask(wrapper->task);
        wrapper->task = NULL;
    }
    wrapper->duration = 0;
    wrapper->step = 0;
    wrapper->mode = 0;
    wrapper->active = FALSE;
}

static void stepCamera(Camera *camera, struct CameraTranslationPathTemplate *first, struct CameraTranslationPathTemplate *last, u8 step, u8 duration) {
    stepDistance(camera, &first->distance, &last->distance, step, duration);
    stepAngleX(camera, &first->angleX, &last->angleX, step, duration);
    stepPerspective(camera, &first->perspectiveAngle, &last->perspectiveAngle, step, duration);
    stepPosition(camera, &first->position, &last->position, step, duration);
}

static void stepAngleX(Camera *camera, const u16 *first, const u16 *last, u8 step, u8 duration) {
    CameraAngle cameraAngle = {};
    u16 diff;
    int scaled;
    if (*last >= *first) {
        diff = *last - *first;
        scaled = (diff * step) / duration;
    } else {
        diff = *first - *last;
        scaled = -((diff * step) / duration);
    }
    cameraAngle.x = *first + scaled;
    Camera_SetAnglePos(&cameraAngle, camera);
}

static void stepDistance(Camera *camera, const fx32 *first, const fx32 *last, u8 step, u8 duration) {
    fx32 diff = *last - *first;
    int scaled = (diff * step) / duration;
    fx32 new = *first + scaled;
    Camera_SetDistance(new, camera);
}

static void stepPerspective(Camera *camera, const u16 *first, const u16 *last, u8 step, u8 duration) {
    int diff = *last - *first;
    int scaled = (diff * step) / duration;
    int new = *first + scaled;
    Camera_SetPerspectiveAngle(new, camera);
}

static void stepPosition(Camera *camera, const VecFx32 *first, const VecFx32 *last, u8 step, u8 duration) {
    VecFx32 scaled;
    VecFx32 diff;
    VEC_Subtract(last, first, &diff);
    scaled.x = calcPositionComponentStep(diff.x, step, duration);
    scaled.y = calcPositionComponentStep(diff.y, step, duration);
    scaled.z = calcPositionComponentStep(diff.z, step, duration);
    Camera_OffsetLookAtPosAndTarget(&scaled, camera);
}

static fx32 calcPositionComponentStep(fx32 component, u8 step, u8 duration) {
    GF_ASSERT(step != 0);
    return (component * step) / duration - (component * (step - 1)) / duration;
}
