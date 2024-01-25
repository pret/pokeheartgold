#ifndef POKEHEARTGOLD_UNK_02026C44_H
#define POKEHEARTGOLD_UNK_02026C44_H

#include "heap.h"
#include "touchscreen.h"

typedef struct TouchHitboxController TouchHitboxController;

TouchHitboxController *TouchHitboxController_Create(const TouchscreenHitbox *hitboxes, u32 num_templates, void (*callback)(u32, u32, void *), void *arg, HeapID heapId);
BOOL TouchHitboxController_IsTriggered(TouchHitboxController *controller);
void TouchHitboxController_Destroy(TouchHitboxController *controller);

#endif //POKEHEARTGOLD_UNK_02026C44_H
