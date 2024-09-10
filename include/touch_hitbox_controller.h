#ifndef POKEHEARTGOLD_TOUCH_HITBOX_CONTROLLER_H
#define POKEHEARTGOLD_TOUCH_HITBOX_CONTROLLER_H

#include "heap.h"
#include "touchscreen.h"

typedef struct TouchHitboxControllerTemplate {
    u8 unkCallbackNum;
    u8 touchActive;      // FIXME: bool8
    u16 numFramesActive; // unused, only read in one place to make sure it doesn't overflow
} TouchHitboxControllerTemplate;

typedef void (*TouchHitboxControllerCallback)(u32 index, u32 event, void *arg);

typedef struct TouchHitboxController {
    const TouchscreenHitbox *hitboxes;
    u32 numTemplates;
    TouchHitboxControllerCallback callback;
    void *callbackArg;
    TouchHitboxControllerTemplate *templates;
} TouchHitboxController;

TouchHitboxController *TouchHitboxController_Create(const TouchscreenHitbox *hitboxes, u32 num_templates, TouchHitboxControllerCallback callback, void *callbackArg, HeapID heapId);
BOOL TouchHitboxController_IsTriggered(TouchHitboxController *controller);
void TouchHitboxController_Destroy(TouchHitboxController *controller);

#endif // POKEHEARTGOLD_TOUCH_HITBOX_CONTROLLER_H
