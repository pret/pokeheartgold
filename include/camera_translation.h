#ifndef POKEHEARTGOLD_CAMERA_TRANSLATION_H
#define POKEHEARTGOLD_CAMERA_TRANSLATION_H

#include "unk_0200E320.h"
#include "camera.h"

struct CameraTranslationPathTemplate {
    u16 angleX;
    u16 perspectiveAngle;
    VecFx32 position;
    fx32 distance;
};

typedef struct GFCameraTranslationWrapper {
    Camera *camera;
    u8 duration;
    u8 step;
    u8 mode;
    u8 active;
    struct CameraTranslationPathTemplate init;
    struct CameraTranslationPathTemplate target;
    SysTask *task; // returned from CreateSysTask
} GFCameraTranslationWrapper;

GFCameraTranslationWrapper *CreateCameraTranslationWrapper(HeapID heapId, Camera *camera);
void DeleteCameraTranslationWrapper(GFCameraTranslationWrapper *wrapper);
void SetCameraTranslationPath(GFCameraTranslationWrapper *wrapper, struct CameraTranslationPathTemplate *template, int duration);
u8 IsCameraTranslationFinished(GFCameraTranslationWrapper *wrapper);

#endif //POKEHEARTGOLD_CAMERA_TRANSLATION_H
