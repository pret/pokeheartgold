#include "application/capsule_menu/defs.h"

#include "pokemon.h"

static const TouchscreenHitbox CapsuleUIRects[] = {
    { .rect = { .top = 16, .bottom = 32, .left = 8, .right = 24 } },
    { .rect = { .top = 16, .bottom = 32, .left = 64, .right = 80 } },
    { .rect = { .top = 40, .bottom = 56, .left = 8, .right = 24 } },
    { .rect = { .top = 40, .bottom = 56, .left = 64, .right = 80 } },
    { .rect = { .top = 64, .bottom = 80, .left = 8, .right = 24 } },
    { .rect = { .top = 64, .bottom = 80, .left = 64, .right = 80 } },
    { .rect = { .top = 88, .bottom = 104, .left = 8, .right = 24 } },
    { .rect = { .top = 88, .bottom = 104, .left = 64, .right = 80 } },
    { .rect = { .top = 104, .bottom = 128, .left = 8, .right = 48 } },
    { .rect = { .top = 104, .bottom = 128, .left = 56, .right = 96 } },
    { .rect = { .top = 168, .bottom = 188, .left = 18, .right = 77 } },
    { .rect = { .top = 168, .bottom = 188, .left = 97, .right = 156 } },
    { .rect = { .top = 168, .bottom = 188, .left = 178, .right = 237 } },
};

void ov57_0223BB84(CapsuleAppManager *appMan) {
    int i;
    const TouchscreenHitbox emptyRect = { 0 };

    for (i = 0; i < 13; ++i) {
        appMan->graphicsMan.touchscreenHitboxes[i] = CapsuleUIRects[i];
    }
    for (; i < 21; ++i) {
        appMan->graphicsMan.touchscreenHitboxes[i] = emptyRect;
        appMan->sealRenderInfo[i - 13].touchscreenHitbox = &appMan->graphicsMan.touchscreenHitboxes[i];
    }
    appMan->graphicsMan.touchHitboxController = TouchHitboxController_Create(appMan->graphicsMan.touchscreenHitboxes, 21, CapsuleManager_HandleSpritePress, appMan, HEAP_ID_52);
}

void CapsuleManager_AssignCapsuleMon(CapsuleAppManager *appMan, int capsuleIndex) {
    u32 sp0 = 0;

    if (appMan->capsules[capsuleIndex].partyIdx != 0xFF) {
        SetMonData(appMan->appData->mons[appMan->capsules[capsuleIndex].partyIdx], MON_DATA_BALL_CAPSULE_ID, &sp0);
    }
    appMan->capsules[capsuleIndex].partyIdx = 0xFF;
    CapsuleGraphics_SetCapsuleSpriteAnim(appMan);
}
