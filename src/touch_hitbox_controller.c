#include "touch_hitbox_controller.h"

#include "global.h"

static void TouchHitboxControllerTemplate_Init(TouchHitboxControllerTemplate *template);
static int sub_02026D88(TouchHitboxControllerTemplate *template, u32 unused, u32 touchNew);
static int sub_02026DA4(TouchHitboxControllerTemplate *template, u32 touchHeld, u32 unused);
static void sub_02026DD8(TouchHitboxControllerTemplate *template, u8 a1);

TouchHitboxController *TouchHitboxController_Create(const TouchscreenHitbox *hitboxes, u32 numTemplates, TouchHitboxControllerCallback callback, void *callbackArg, enum HeapID heapID) {
    GF_ASSERT(numTemplates != 0);

    TouchHitboxController *controller = Heap_Alloc(heapID, sizeof(TouchHitboxController));
    if (controller != NULL) {
        controller->hitboxes = hitboxes;
        controller->numTemplates = numTemplates;
        controller->callback = callback;
        controller->callbackArg = callbackArg;

        controller->templates = Heap_Alloc(heapID, numTemplates * sizeof(TouchHitboxControllerTemplate));
        if (controller->templates != NULL) {
            for (u32 i = 0; i < numTemplates; i++) {
                TouchHitboxControllerTemplate_Init(&controller->templates[i]);
            }
        } else {
            Heap_Free(controller);
            controller = NULL;
        }
    }
    return controller;
}

static void TouchHitboxControllerTemplate_Init(TouchHitboxControllerTemplate *template) {
    template->unkCallbackNum = 0;
    template->touchActive = FALSE;
    template->numFramesActive = 0;
}

void TouchHitboxController_Destroy(TouchHitboxController *controller) {
    GF_ASSERT(controller != NULL);
    Heap_Free(controller->templates);
    Heap_Free(controller);
}

typedef int (*TouchHitboxControllerTemplate_UnkCallback)(TouchHitboxControllerTemplate *template, u32 touchHeld, u32 touchNew);
static const TouchHitboxControllerTemplate_UnkCallback _020F6450[] = {
    sub_02026D88,
    sub_02026DA4,
};

BOOL TouchHitboxController_IsTriggered(TouchHitboxController *controller) {
    u32 i;
    u32 touchNew, touchHeld; // these are BOOLs but they have to be unsigned to match

    BOOL triggered = FALSE;
    touchHeld = System_GetTouchHeld();
    if (touchHeld) {
        touchNew = System_GetTouchNew();
        for (i = 0; i < controller->numTemplates; i++) {
            if (controller->templates[i].touchActive) {
                controller->templates[i].touchActive = TouchscreenHitbox_TouchHeldIsIn(&controller->hitboxes[i]);
            } else {
                controller->templates[i].touchActive = TouchscreenHitbox_TouchNewIsIn(&controller->hitboxes[i]);
                if (controller->templates[i].touchActive) {
                    triggered = TRUE;
                }
            }
        }
    } else {
        touchNew = FALSE;
        for (i = 0; i < controller->numTemplates; i++) {
            controller->templates[i].touchActive = FALSE;
        }
    }

    for (i = 0; i < controller->numTemplates; i++) {
        int event = _020F6450[controller->templates[i].unkCallbackNum](&controller->templates[i], touchHeld, touchNew);
        if (event != -1) {
            controller->callback(i, event, controller->callbackArg);
        }
    }

    return triggered;
}

static int sub_02026D88(TouchHitboxControllerTemplate *template, u32 unused, u32 touchNew) {
    if (template->touchActive && touchNew) {
        sub_02026DD8(template, 1);
        return 0;
    }

    return -1;
}

static int sub_02026DA4(TouchHitboxControllerTemplate *template, u32 touchHeld, u32 unused) {
    if (template->touchActive) {
        if (template->numFramesActive < 0xFFFF) {
            template->numFramesActive++;
        }
        return 2;
    }

    if (touchHeld) {
        sub_02026DD8(template, 0);
        return 3;
    } else {
        sub_02026DD8(template, 0);
        return 1;
    }
}

static void sub_02026DD8(TouchHitboxControllerTemplate *template, u8 a1) {
    template->unkCallbackNum = a1;
    template->numFramesActive = 0;
}
