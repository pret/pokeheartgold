#include "application/capsule_menu/defs.h"

void ov57_02239814(BgConfig *bgConfig, Window *window, int left, int top, int width, int height, int pltt, int baseTile);

void ov57_022385A4(TouchscreenHitbox *rect, ManagedSprite *sprite, int xOffset, int yOffset) {
    s16 x, y;

    ManagedSprite_GetPositionXY(sprite, &x, &y);

    rect->rect.top = y - yOffset;
    rect->rect.bottom = y + yOffset;
    rect->rect.left = x - xOffset;
    rect->rect.right = x + xOffset;
}

void ov57_022385DC(CapsuleAppManager *appManager) {
    ov57_02239814(appManager->unk_0D4.unk_010, &appManager->unk_0D4.unk_018[0], 1, 1, 21, 30, 2, 0x03A);
    ov57_02239814(appManager->unk_0D4.unk_010, &appManager->unk_0D4.unk_018[3], 1, 1, 21, 20, 2, 0x03A);
    ov57_02239814(appManager->unk_0D4.unk_010, &appManager->unk_0D4.unk_018[2], 1, 23, 21, 8, 2, 0x076);
}

void ov57_0223864C(CapsuleAppManager *appManager) {
    RemoveWindow(&appManager->unk_0D4.unk_018[0]);
    RemoveWindow(&appManager->unk_0D4.unk_018[3]);
    RemoveWindow(&appManager->unk_0D4.unk_018[2]);
}
