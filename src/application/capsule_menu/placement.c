#include "application/capsule_menu/defs.h"

void ov57_02238044(CapsuleAppManager *appManager, u8 index);

void ov57_02237E90(TouchscreenHitbox *rect, u8 x, u8 y) {
    rect->rect.top = y - 10;
    rect->rect.left = x - 10;
    rect->rect.bottom = y + 10;
    rect->rect.right = x + 10;
}

void ov57_02237EA8(TouchscreenHitbox *rect) {
    rect->rect.top = 0;
    rect->rect.left = 0;
    rect->rect.bottom = 192;
    rect->rect.right = 255;
}

void ov57_02237EB8(TouchscreenHitbox *rect, ManagedSprite *sprite, BOOL touchingSprite) {
    s16 x, y;

    if (sprite == NULL) {
        return;
    }

    if (touchingSprite == TRUE) {
        ManagedSprite_SetPositionXY(sprite, gSystem.touchX, gSystem.touchY);
        ManagedSprite_GetPositionXY(sprite, &x, &y);
        ov57_02237EA8(rect);
    } else {
        ManagedSprite_GetPositionXY(sprite, &x, &y);
        ov57_02237E90(rect, x, y);
    }
}

void ov57_02237F14(CapsuleAppManager *appManager) {
    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; ++i) {
        if (appManager->unk_34C[i].sprite == NULL) {
            continue;
        }
        ManagedSprite_OffsetPositionXY(appManager->unk_34C[i].sprite, -56, 16);
    }
}

void ov57_02237F3C(CapsuleAppManager *appManager) {
    BallCapsule *capsule = appManager->unk_004[appManager->unk_3EC].capsule;

    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (capsule->seals[i].kind != SEAL_NONE) {
            appManager->unk_34C[i].type = capsule->seals[i].kind;
            appManager->unk_34C[i].x = capsule->seals[i].x;
            appManager->unk_34C[i].y = capsule->seals[i].y;

            ov57_02238260(appManager, i);
            ov57_02237EB8(appManager->unk_34C[i].touchscreenHitbox, appManager->unk_34C[i].sprite, FALSE);

            appManager->unk_34C[i].shouldRender = 1;
        } else {
            appManager->unk_34C[i].shouldRender = 0;
            appManager->unk_34C[i].type = 0;
        }
    }
}

int ov57_02237FAC(CapsuleAppManager *appMan, u8 sealIndex) {
    u32 touchX, touchY;

    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (appMan->unk_34C[i].shouldRender == 1) {
            continue;
        }

        appMan->unk_34C[i].type = appMan->unk_448.sealIDs[sealIndex];
        appMan->unk_34C[i].x = 190;
        appMan->unk_34C[i].y = 70;

        System_GetTouchHeldCoords(&touchX, &touchY);

        appMan->unk_34C[i].x = touchX;
        appMan->unk_34C[i].y = touchY;

        ov57_02238260(appMan, i);
        ov57_02238044(appMan, i);

        appMan->unk_34C[i].shouldRender = 1;

        return i;
    }

    return 0xFF;
}
