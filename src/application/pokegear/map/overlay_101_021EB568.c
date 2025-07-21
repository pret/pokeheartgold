#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"

#include "unk_02005D10.h"

BOOL ov101_021EB654(PokegearMapAppData *mapApp);
int ov101_021EB784(PokegearMapAppData *mapApp, int a1);
int ov101_021EB818(PokegearMapAppData *mapApp);
BOOL ov101_021EA6C4(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1);
int ov101_021EBA44(PokegearMapAppData *mapApp, BOOL *pRetIsTouch);
BOOL ov101_021EBDEC(PokegearMapAppData *mapApp);
s16 ov101_021EBF44(PokegearMapAppData *mapApp, s16 a1);
s16 ov101_021EBF98(PokegearMapAppData *mapApp, s16 a1, s16 a2);
s16 ov101_021EBFF8(PokegearMapAppData *mapApp, s16 a1);
s16 ov101_021EC04C(PokegearMapAppData *mapApp, s16 a1, s16 a2);
void ov101_021EC49C(PokegearMapAppData *mapApp, u16 x, u16 y, int *xRet, int *yRet);
void ov101_021EC778(PokegearMapAppData *mapApp);
void ov101_021EC920(PokegearManagedObject *object, u16 index, s16 y);
void ov101_021EC944(PokegearMapAppData *mapApp);
void ov101_021EC980(PokegearMapAppData *mapApp, s16 *a1, s16 *a2);
BOOL MapApp_MarkingSlotIsSet(PokegearMapAppData *mapApp, u8 a1);
void PokegearMap_MarkingsMenu_SetTrashcanIconState(PokegearMapAppData *mapApp, BOOL a1);
void PokegearMap_MarkingsMenu_ReturnToTopLevel(PokegearMapAppData *mapApp);
void PokegearMap_MarkingsMenu_DeleteSelected(PokegearMapAppData *mapApp, u8 a1, u8 a2);
void ov101_021ED204(PokegearMapAppData *mapApp, u8 a1);

int ov101_021EB568(PokegearMapAppData *mapApp) {
    int ret;

    if ((gSystem.newKeys & PAD_BUTTON_B) && !mapApp->unk_139_2) {
        mapApp->pokegear->cursorInAppSwitchZone = TRUE;
        PokegearAppSwitch_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0, TRUE);
        PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 0, PokegearApp_AppIDtoButtonIndex(mapApp->pokegear));
        PokegearMap_HideMapCursor(mapApp);
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return -1;
    }

    ret = ov101_021EB818(mapApp);
    if (ret == 7) {
        return ret;
    }
    ov101_021EC304(mapApp);
    ov101_021EC778(mapApp);
    return -1;
}

int ov101_021EB5DC(PokegearMapAppData *mapApp, BOOL *pRetIsTouch) {
    int ret = -1;

    if (!mapApp->unk_139_3) {
        ret = PokegearApp_HandleTouchInput_SwitchApps(mapApp->pokegear);
    }
    if (ret != -1) {
        *pRetIsTouch = TRUE;
        return ret;
    }
    if (!mapApp->unk_139_3) {
        ret = ov101_021EBA44(mapApp, pRetIsTouch);
        if (*pRetIsTouch && mapApp->pokegear->cursorInAppSwitchZone == TRUE) {
            mapApp->pokegear->cursorInAppSwitchZone = FALSE;
            PokegearMap_DeselectApp(mapApp);
        }
        if (ret == 7) {
            return ret;
        }
        ov101_021EC778(mapApp);
    } else {
        *pRetIsTouch = TRUE;
        ret = FlyMap_HandleTouchInput_DraggingMap(mapApp);
    }
    return ret;
}

BOOL ov101_021EB654(PokegearMapAppData *mapApp) {
    u8 flag = 0;
    int heldKeys = gSystem.heldKeys;
    PokegearManagedObject *object = &mapApp->objManager->objects[PGMAP_SPRITE_CURSOR];

    if (heldKeys & PAD_KEY_UP) {
        if (mapApp->playerY > mapApp->minYscroll + 1) {
            --mapApp->playerY;
            mapApp->moveCursorDirection |= 1;
            flag = 1;
        }
    } else if (heldKeys & PAD_KEY_DOWN) {
        if (mapApp->playerY < mapApp->maxYscroll) {
            ++mapApp->playerY;
            mapApp->moveCursorDirection |= 2;
            flag = 1;
        }
    }
    if (heldKeys & PAD_KEY_LEFT) {
        if (mapApp->playerX > mapApp->minXscroll + 1) {
            --mapApp->playerX;
            mapApp->moveCursorDirection |= 4;
            flag = 1;
        }
    } else if (heldKeys & PAD_KEY_RIGHT) {
        if (mapApp->playerX < mapApp->maxXscroll - 1) {
            ++mapApp->playerX;
            mapApp->moveCursorDirection |= 8;
            flag = 1;
        }
    }
    if (flag) {
        mapApp->cursorSpeed = 2;
        mapApp->draggingMarking = 1;
        mapApp->unk_139_2 = 1;
        mapApp->unk_114 = object->pos;
        return TRUE;
    }
    return FALSE;
}

int ov101_021EB784(PokegearMapAppData *mapApp, int flyDest) {
    u16 x;
    u16 y;

    if (flyDest < 0) {
        return -1;
    }
    mapApp->pokegear->appReturnCode = GEAR_RETURN_5;
    mapApp->pokegear->args->selectedFlyDest = flyDest;
    mapApp->pokegear->args->mapCursorX = mapApp->playerX;
    mapApp->pokegear->args->mapCursorY = mapApp->playerY - 2;
    if (mapApp->pokegear->menuInputState == MENU_INPUT_STATE_TOUCH) {
        ov101_021E9464(mapApp, gSystem.touchX, gSystem.touchY, &x, &y);
    } else {
        ov101_021E9464(mapApp, mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].pos.x, mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].pos.y, &x, &y);
    }
    PokegearMap_PrintLandmarkNameAndFlavorText(mapApp, mapApp->selectedLoc.locationSpec->mapId);
    PokegearMap_SpawnFlyContextMenu(mapApp, x);
    return 8;
}

int ov101_021EB818(PokegearMapAppData *mapApp) {
    u32 newKeys = gSystem.newKeys;
    if (gSystem.heldKeys == 0 || mapApp->draggingMarking || mapApp->unk_139_1 || mapApp->unk_139_2) {
        return -1;
    }
    if (newKeys & PAD_BUTTON_X) {
        mapApp->zoomed ^= 1;
        mapApp->cursorSpeed = 4;
        ov101_021EC49C(mapApp, mapApp->playerX, mapApp->playerY, &mapApp->cursorSpriteState.affineX, &mapApp->cursorSpriteState.affineY);
        mapApp->draggingMarking = 1;
        mapApp->unk_139_1 = 1;
        ov101_021EB38C(mapApp, 1, mapApp->zoomed);
        if (mapApp->zoomed == 1) {
            PlaySE(SEQ_SE_GS_GEARXBUTTON);
        } else {
            PlaySE(SEQ_SE_GS_XBUTTON_SYUKUSHOU);
        }
        return -1;
    }
    if (newKeys & PAD_BUTTON_Y) {
        if (!ov101_021EA6C4(mapApp, &mapApp->selectedLoc)) {
            return -1;
        }
        ov101_021EB38C(mapApp, 0, 1);
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        return 7;
    }
    if (ov101_021EB654(mapApp)) {
        ov101_021EA794(mapApp, &mapApp->selectedLoc, mapApp->playerX, mapApp->playerY);
        ov101_021EAD90(mapApp, 0);
        ov101_021EB1E0(mapApp, 1);
    }
    return -1;
}

int FlyMap_HandleKeyInput(PokegearMapAppData *mapApp) {
    u32 newKeys = gSystem.newKeys;
    int r5;

    if (gSystem.heldKeys == 0 || mapApp->draggingMarking || mapApp->unk_139_2) {
        return -1;
    }
    if (newKeys & PAD_BUTTON_A) {
        if (mapApp->flyMapState == 1) {
            r5 = PokegearMap_GetFlyDestinationAtCoord(mapApp, mapApp->playerX, mapApp->playerY - 2);
            if (r5 > 0) {
                PlaySE(SEQ_SE_GS_GEARDECIDE);
                return ov101_021EB784(mapApp, r5);
            } else {
                return -1;
            }
        }
    }
    if (newKeys & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return 4;
    }
    if (!ov101_021EB654(mapApp)) {
        return -1;
    }
    if (mapApp->flyMapState == 2) {
        ov101_021EA794(mapApp, &mapApp->selectedLoc, mapApp->playerX, mapApp->playerY);
        ov101_021EAD90(mapApp, 1);
        ov101_021EB1E0(mapApp, 1);
    } else {
        ov101_021EA8A8(mapApp, &mapApp->selectedLoc, mapApp->playerX, mapApp->playerY);
        ov101_021EAD90(mapApp, 0);
        ov101_021EB1E0(mapApp, 1);
    }
    return -1;
}

const TouchscreenHitbox ov101_021F7EA4[2] = {
    { .rect = { 0x08, 0x98, 0x08, 0xc8 } },
    { .rect = { 0x10, 0x90, 0x28, 0xe0 } },
};

int ov101_021EBA44(PokegearMapAppData *mapApp, BOOL *pRetIsTouch) {
    u16 sp4;
    int r6;

    static const TouchscreenHitbox ov101_021F7EAC[] = {
        { .rect = { 0x10, 0x40, 0xd8, 0xf8 } },
        { .rect = { 0x58, 0x98, 0xd8, 0xf8 } },
        { .rect = { TOUCHSCREEN_RECTLIST_END } },
    };

    if (!System_GetTouchHeld()) {
        return -1;
    }
    if (mapApp->draggingMarking || mapApp->unk_139_1) {
        return -1;
    }
    r6 = TouchscreenHitbox_FindRectAtTouchNew(ov101_021F7EAC);
    if (r6 != TOUCH_MENU_NO_INPUT) {
        *pRetIsTouch = TRUE;
        ov101_021E94C0(mapApp);
        if (r6 == 0) {
            if (!ov101_021EA6C4(mapApp, &mapApp->selectedLoc)) {
                return -1;
            }
            ov101_021EB38C(mapApp, 0, 1);
            PlaySE(SEQ_SE_GS_GEARDECIDE);
            return 7;
        } else {
            mapApp->zoomed ^= 1;
            mapApp->cursorSpeed = 4;
            ov101_021EC49C(mapApp, mapApp->playerX, mapApp->playerY, &mapApp->cursorSpriteState.affineX, &mapApp->cursorSpriteState.affineY);
            mapApp->draggingMarking = 1;
            mapApp->unk_139_1 = 1;
            ov101_021EB38C(mapApp, 1, mapApp->zoomed);
            if (mapApp->zoomed == 1) {
                PlaySE(SEQ_SE_GS_GEARXBUTTON);
            } else {
                PlaySE(SEQ_SE_GS_XBUTTON_SYUKUSHOU);
            }
            return -1;
        }
    }
    if (!TouchscreenHitbox_TouchNewIsIn(&ov101_021F7EA4[0])) {
        return -1;
    }
    sp4 = 1;
    if (!DoesPixelAtScreenXYMatchPtrVal(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, gSystem.touchX, gSystem.touchY, &sp4)) {
        return -1;
    }
    PlaySE(SEQ_SE_GS_GEARMAPTOUCH);
    ov101_021EC980(mapApp, &mapApp->playerX, &mapApp->playerY);
    ov101_021EA794(mapApp, &mapApp->selectedLoc, mapApp->playerX, mapApp->playerY);
    ov101_021EAD90(mapApp, 0);
    ov101_021EB1E0(mapApp, 1);
    mapApp->unk_146 = mapApp->unk_142 = gSystem.touchX;
    mapApp->unk_148 = mapApp->unk_144 = gSystem.touchY;
    ov101_021EBDEC(mapApp);
    mapApp->unk_139_3 = 1;
    *pRetIsTouch = TRUE;
    return -1;
}

int FlyMap_HandleTouchInput_NotDragging(PokegearMapAppData *mapApp, BOOL *pRetIsTouch) {
    u16 sp1C;
    int flyDest;
    int r0;

    static const TouchscreenHitbox sTouchscreenHitbox_CloseButton[2] = {
        { .rect = { 0x98, 0xb8, 0xc2, 0xfe } },
        { .rect = { TOUCHSCREEN_RECTLIST_END } },
    };

    if (!System_GetTouchHeld()) {
        return -1;
    }
    if (mapApp->draggingMarking) {
        return -1;
    }
    r0 = TouchscreenHitbox_FindRectAtTouchNew(sTouchscreenHitbox_CloseButton);
    if (r0 != -1) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 24, 20, 8, 4, mapApp->unk_178->rawData, 0, 24, mapApp->unk_178->screenWidth / 8, mapApp->unk_178->screenHeight / 8);
        ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
        ov101_021E94C0(mapApp);
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        *pRetIsTouch = TRUE;
        return 4;
    }
    if (!TouchscreenHitbox_TouchNewIsIn(&ov101_021F7EA4[1])) {
        return -1;
    }
    sp1C = 1;
    if (!DoesPixelAtScreenXYMatchPtrVal(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, gSystem.touchX, gSystem.touchY, &sp1C)) {
        return -1;
    }
    PlaySE(SEQ_SE_GS_GEARMAPTOUCH);
    *pRetIsTouch = TRUE;
    if (mapApp->flyMapState == 2) {
        ov101_021EC980(mapApp, &mapApp->playerX, &mapApp->playerY);
        ov101_021EA794(mapApp, &mapApp->selectedLoc, mapApp->playerX, mapApp->playerY);
        ov101_021EAD90(mapApp, 1);
        ov101_021EB1E0(mapApp, 1);
    } else {
        ov101_021EC980(mapApp, &mapApp->playerX, &mapApp->playerY);
        ov101_021EA8A8(mapApp, &mapApp->selectedLoc, mapApp->playerX, mapApp->playerY);
        ov101_021EAD90(mapApp, 0);
        ov101_021EB1E0(mapApp, 1);
        flyDest = PokegearMap_GetFlyDestinationAtCoord(mapApp, mapApp->playerX, mapApp->playerY - 2);
        if (flyDest > 0) {
            PlaySE(SEQ_SE_GS_GEARDECIDE);
            return ov101_021EB784(mapApp, flyDest);
        }
    }
    mapApp->unk_146 = mapApp->unk_142 = gSystem.touchX;
    mapApp->unk_148 = mapApp->unk_144 = gSystem.touchY;
    ov101_021EBDEC(mapApp);
    mapApp->unk_139_3 = 1;
    return -1;
}

BOOL ov101_021EBDEC(PokegearMapAppData *mapApp) {
    s16 x;
    s16 y;
    s16 xTile;
    s16 yTile;
    s16 xPixel;
    s16 yPixel;
    u8 grid;
    u8 halfGrid;
    u8 width;
    u8 height;
    s16 y0;
    s16 y1;
    s16 x1;
    s16 x0;
    s16 pixelTop;
    s16 pixelBottom;
    s16 pixelRight;
    s16 pixelLeft;

    if (mapApp->zoomed) {
        width = 12;
        height = 8;
    } else {
        width = 24;
        height = 17;
    }
    grid = (8 * (1 + mapApp->zoomed));
    halfGrid = grid / 2;

    x = gSystem.touchX - mapApp->centerX;
    y = gSystem.touchY - mapApp->centerY;

    xPixel = (x % grid) - halfGrid;
    yPixel = (y % grid) - halfGrid;

    xTile = x / grid;
    yTile = y / grid;

    y0 = mapApp->playerY - yTile;
    y1 = mapApp->playerY + (height - 1 - yTile);
    x0 = mapApp->playerX - xTile;
    x1 = mapApp->playerX + (width - 1 - xTile);

    if (y0 < mapApp->minYscroll) {
        y0 = mapApp->minYscroll;
    }
    if (x0 < mapApp->minXscroll) {
        x0 = mapApp->minXscroll;
    }
    if (y1 > mapApp->maxYscroll) {
        y1 = mapApp->maxYscroll;
    }
    if (x1 > mapApp->maxXscroll) {
        x1 = mapApp->maxXscroll;
    }

    pixelTop = (mapApp->playerY - y0) * grid + yPixel;
    pixelLeft = (mapApp->playerX - x0) * grid + xPixel;
    pixelBottom = (y1 - mapApp->playerY) * grid + yPixel;
    pixelRight = (x1 - mapApp->playerX) * grid + xPixel;

    mapApp->unk_14A = pixelTop;
    mapApp->unk_14C = pixelBottom;
    mapApp->unk_14E = pixelLeft;
    mapApp->unk_150 = pixelRight;
    return FALSE;
}

s16 ov101_021EBF44(PokegearMapAppData *mapApp, s16 x) {
    s16 xMax;
    s16 xMin;
    s16 ret;

    xMin = mapApp->cursorSpriteState.left - x + 1;
    xMax = mapApp->cursorSpriteState.right - x - 1;
    if (mapApp->playerX >= xMin && xMax >= mapApp->playerX) {
        return x;
    }
    if (mapApp->playerX <= xMin) {
        ret = x + (xMin - mapApp->playerX);
    } else if (mapApp->playerX >= xMax) {
        // Your language server may flag ret as being conditionally uninitalized.
        // This is technically not UB since logically
        // this block here is the only other possibility.
        ret = x - (mapApp->playerX - xMax);
    }
    return ret;
}

s16 ov101_021EBF98(PokegearMapAppData *mapApp, s16 x, s16 dxMax) {
    s16 dx;

    if (x > 0) {
        dx = mapApp->cursorSpriteState.left - mapApp->minXscroll;
        if (dx <= 0) {
            return 0;
        } else if (dx < dxMax) {
            return ov101_021EBF44(mapApp, dx);
        }
    } else {
        dx = mapApp->maxXscroll - mapApp->cursorSpriteState.right;
        if (dx <= 0) {
            return 0;
        } else if (dx < dxMax) {
            return ov101_021EBF44(mapApp, -dx);
        }
    }
    return ov101_021EBF44(mapApp, x);
}

s16 ov101_021EBFF8(PokegearMapAppData *mapApp, s16 y) {
    s16 ret;
    s16 yMin;
    s16 yMax;

    yMin = mapApp->cursorSpriteState.top - y + 1;
    yMax = mapApp->cursorSpriteState.bottom - y;
    if (mapApp->playerY >= yMin && yMax >= mapApp->playerY) {
        return y;
    }
    if (mapApp->playerY <= yMin) {
        ret = y + (yMin - mapApp->playerY);
    } else if (mapApp->playerY >= yMax) {
        // Your language server may flag ret as being conditionally uninitalized.
        // This is technically not UB since logically
        // this block here is the only other possibility.
        ret = y - (mapApp->playerY - yMax);
    }
    return ret;
}

s16 ov101_021EC04C(PokegearMapAppData *mapApp, s16 y, s16 dyMax) {
    s16 dy;

    if (y > 0) {
        dy = mapApp->cursorSpriteState.top - mapApp->minYscroll;
        if (dy <= 0) {
            return 0;
        } else if (dy < dyMax) {
            return ov101_021EBFF8(mapApp, dy);
        }
    } else {
        dy = mapApp->maxYscroll - mapApp->cursorSpriteState.bottom;
        if (dy <= 0) {
            return 0;
        } else if (dy < dyMax) {
            return ov101_021EBFF8(mapApp, -dy);
        }
    }
    return ov101_021EBFF8(mapApp, y);
}

int FlyMap_HandleTouchInput_DraggingMap(PokegearMapAppData *mapApp) {
    s16 touchX;
    s16 touchY;
    s16 x;
    s16 y;
    s16 absX;
    s16 absY;
    s16 xOffset;
    s16 yOffset;
    s16 halfGrid;
    s16 grid;

    touchX = gSystem.touchX;
    touchY = gSystem.touchY;
    grid = (mapApp->zoomed * 8 + 8) / 2;

    if (mapApp->zoomed) {
        halfGrid = 9;
    } else {
        halfGrid = 5;
    }
    if (mapApp->cursorSpeed != 0) {
        mapApp->cursorSpriteState.x -= mapApp->draggingWordX;
        mapApp->cursorSpriteState.y -= mapApp->draggingWordY;
        ov101_021E9BF4(mapApp, mapApp->draggingWordX, mapApp->draggingWordY);
        PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
        mapApp->requestAffineUpdate = TRUE;
        mapApp->cursorSpeed = 0;
        return -1;
    }
    if (!System_GetTouchHeld()) {
        mapApp->unk_139_3 = FALSE;
        return -1;
    }

    x = absX = touchX - mapApp->unk_142;
    y = absY = touchY - mapApp->unk_144;
    if (absX < 0) {
        absX *= -1;
    }
    if (absY < 0) {
        absY *= -1;
    }
    absX /= halfGrid;
    absY /= halfGrid;
    xOffset = x % halfGrid;
    yOffset = y % halfGrid;
    if (absX < 1 && absY < 1) {
        return -1;
    }
    mapApp->draggingWordX = mapApp->draggingWordY = 0;
    if (absX > 0) {
        x = ov101_021EBF98(mapApp, x / halfGrid, absX);
        if (x != 0) {
            mapApp->cursorSpriteState.x -= x * grid;
            mapApp->cursorSpriteState.right -= x;
            mapApp->cursorSpriteState.left -= x;
            mapApp->unk_142 = touchX - xOffset;
            mapApp->cursorSpeed = 1;
            mapApp->draggingWordX = x * grid;
        }
    } else {
        x = 0;
    }
    if (absY > 0) {
        y = ov101_021EC04C(mapApp, y / halfGrid, absY);
        if (y != 0) {
            mapApp->cursorSpriteState.y -= y * grid;
            mapApp->cursorSpriteState.bottom -= y;
            mapApp->cursorSpriteState.top -= y;
            mapApp->unk_144 = touchY - yOffset;
            mapApp->cursorSpeed = 1;
            mapApp->draggingWordY = y * grid;
        }
    } else {
        y = 0;
    }
    if (x != 0 || y != 0) {
        ov101_021E9BF4(mapApp, x * grid, y * grid);
        ov101_021EC944(mapApp);
        PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
        mapApp->requestAffineUpdate = TRUE;
    }
    return -1;
}

void ov101_021EC304(PokegearMapAppData *mapApp) {
    u8 flag = 0;
    s16 dx = 0;
    s16 dy = 0;
    s16 delta = 0;
    u16 x;
    u16 y;
    PokegearManagedObject *cursorObj = &mapApp->objManager->objects[PGMAP_SPRITE_CURSOR];

    static const u8 scrollLimits[][2] = {
        // normal, zoomed
        { 22, 10 }, // x
        { 16, 7  }, // y
    };

    if (!mapApp->unk_139_2) {
        return;
    }
    if (mapApp->zoomed) {
        delta = 8;
    } else {
        delta = 4;
    }
    ov101_021E9464(mapApp, mapApp->unk_114.x, mapApp->unk_114.y, &x, &y);

    // Move the cursor object.
    // Scroll the screen if this would move the cursor out of bounds.
    if (mapApp->moveCursorDirection & 1) {
        if (y <= 1) {
            dy -= delta;
            flag = 1;
        } else {
            cursorObj->pos.y -= delta;
        }
    } else if (mapApp->moveCursorDirection & 2) {
        if (y >= scrollLimits[1][mapApp->zoomed]) {
            dy += delta;
            flag = 1;
        } else {
            cursorObj->pos.y += delta;
        }
    }
    if (mapApp->moveCursorDirection & 4) {
        if (x <= 1) {
            dx -= delta;
            flag = 1;
        } else {
            cursorObj->pos.x -= delta;
        }
    } else if (mapApp->moveCursorDirection & 8) {
        if (x >= scrollLimits[0][mapApp->zoomed]) {
            dx += delta;
            flag = 1;
        } else {
            cursorObj->pos.x += delta;
        }
    }
    if (flag != 0) {
        mapApp->requestAffineUpdate = TRUE;
        mapApp->cursorSpriteState.x += dx;
        mapApp->cursorSpriteState.y += dy;
        ov101_021E9BF4(mapApp, -dx, -dy);
        ov101_021EC944(mapApp);
    }
    PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
    if (--mapApp->cursorSpeed == 0) {
        PokegearMap_UpdateCursorBounds(mapApp);
        mapApp->draggingMarking = 0;
        mapApp->unk_139_2 = 0;
        mapApp->moveCursorDirection = 0;
    }
}

void ov101_021EC49C(PokegearMapAppData *mapApp, u16 x, u16 y, int *xRet, int *yRet) {
    u16 i;
    u8 x2 = 0, y2 = 0, grid, half_grid;
    PokegearManagedObject *cursorObj = &mapApp->objManager->objects[PGMAP_SPRITE_CURSOR];
    PokegearManagedObject *objects = mapApp->objManager->objects;
    grid = 8 * (mapApp->zoomed + 1);
    half_grid = grid / 2;
    ov101_021E9530(mapApp, mapApp->zoomed, mapApp->playerX, mapApp->playerY, cursorObj->pos.x, cursorObj->pos.y);
    if (!mapApp->zoomed) {
        x2 = (cursorObj->pos.x - mapApp->centerX) / 16;
        y2 = (cursorObj->pos.y - mapApp->centerY) / 16;
        if (x2 <= 5) {
            *xRet = x * 8 + 8;
        } else {
            *xRet = x * 8;
        }
        if (y2 > 4) {
            *yRet = y * 8 + 8;
        } else {
            *yRet = y * 8;
        }
    } else {
        x2 = ((cursorObj->pos.x - mapApp->centerX) / 8) % 2;
        y2 = ((cursorObj->pos.y - mapApp->centerY) / 8) % 2;
        *xRet = x * 8 + x2 * 8;
        *yRet = y * 8 + y2 * 8;
    }
    cursorObj->destX = (x - mapApp->cursorSpriteState.left) * grid + mapApp->centerX + half_grid;
    cursorObj->destY = (y - mapApp->cursorSpriteState.top) * grid + mapApp->centerY + half_grid;
    objects[PGMAP_SPRITE_PLAYER].destX = (objects[PGMAP_SPRITE_PLAYER].unk_0C - mapApp->cursorSpriteState.left) * grid + mapApp->centerX + half_grid;
    objects[PGMAP_SPRITE_PLAYER].destY = (objects[PGMAP_SPRITE_PLAYER].unk_0E - mapApp->cursorSpriteState.top) * grid + mapApp->centerY + half_grid;
    ov101_021EA238(mapApp, 1);
    for (i = PGMAP_SPRITE_CURSOR; i < mapApp->objManager->num; ++i) {
        objects[i].unk_18 = FX_Div(FX32_CONST(objects[i].destX - objects[i].pos.x), FX32_CONST(mapApp->cursorSpeed));
        objects[i].unk_1C = FX_Div(FX32_CONST(objects[i].destY - objects[i].pos.y), FX32_CONST(mapApp->cursorSpeed));
        PokegearManagedObject_SetFixCoords(&objects[i], objects[i].pos.x, objects[i].pos.y);
    }
}

void ov101_021EC778(PokegearMapAppData *mapApp) {
    u16 i;
    VecFx32 scale;
    PokegearManagedObject *cursorObj = &mapApp->objManager->objects[PGMAP_SPRITE_CURSOR];
    PokegearManagedObject *objects = mapApp->objManager->objects;
    s16 x;
    s16 y;

    if (!mapApp->unk_139_1) {
        return;
    }
    if (mapApp->zoomed) {
        mapApp->cursorSpriteState.xRatio += FX32_CONST(0.25);
        mapApp->cursorSpriteState.yRatio += FX32_CONST(0.25);
    } else {
        mapApp->cursorSpriteState.xRatio -= FX32_CONST(0.25);
        mapApp->cursorSpriteState.yRatio -= FX32_CONST(0.25);
    }
    scale.x = mapApp->cursorSpriteState.xRatio;
    scale.z = FX32_ONE;
    scale.y = mapApp->cursorSpriteState.yRatio;
    Sprite_SetAffineScale(cursorObj->sprite, &scale);
    if (--mapApp->cursorSpeed == 0) {
        mapApp->cursorSpriteState.x = mapApp->cursorSpriteState.destX;
        mapApp->cursorSpriteState.y = mapApp->cursorSpriteState.destY;
        for (i = PGMAP_SPRITE_CURSOR; i < mapApp->objManager->num; ++i) {
            PokegearManagedObject_SetCoord(&objects[i], objects[i].destX, objects[i].destY);
            ov101_021EC920(&objects[i], i, objects[i].destY);
        }
        mapApp->draggingMarking = 0;
        mapApp->unk_139_1 = 0;
        mapApp->moveCursorDirection = 0;
    } else {
        mapApp->cursorSpriteState.unk_20 += mapApp->cursorSpriteState.dxStep;
        mapApp->cursorSpriteState.unk_24 += mapApp->cursorSpriteState.dyStep;
        mapApp->cursorSpriteState.x = FX_Whole(mapApp->cursorSpriteState.unk_20);
        mapApp->cursorSpriteState.y = FX_Whole(mapApp->cursorSpriteState.unk_24);
        for (i = PGMAP_SPRITE_CURSOR; i < mapApp->objManager->num; ++i) {
            objects[i].unk_10 += objects[i].unk_18;
            objects[i].unk_14 += objects[i].unk_1C;
            x = FX_Whole(objects[i].unk_10);
            y = FX_Whole(objects[i].unk_14);
            PokegearManagedObject_SetCoord(&objects[i], x, y);
            ov101_021EC920(&objects[i], i, y);
        }
    }
    PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
    mapApp->requestAffineUpdate = TRUE;
}

void ov101_021EC920(PokegearManagedObject *object, u16 index, s16 y) {
    if (!object->unk_01) {
        return;
    }
    if (y > 216 || y < 0) {
        Sprite_SetDrawFlag(object->sprite, FALSE);
    } else {
        Sprite_SetDrawFlag(object->sprite, TRUE);
    }
}

void ov101_021EC944(PokegearMapAppData *mapApp) {
    u16 i;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    if (mapApp->flyMapState) {
        return;
    }
    for (i = PGMAP_SPRITE_CURSOR; i < mapApp->objManager->num; ++i) {
        ov101_021EC920(&objects[i], i, objects[i].pos.y);
    }
}

void ov101_021EC980(PokegearMapAppData *mapApp, s16 *a1, s16 *a2) {
    s16 r7;
    s16 r4;

    static const u8 ov101_021F7E9C[][4] = {
        { 1, 16, 1, 22 },
        { 1, 7,  1, 10 },
    };

    const u8 *r6 = ov101_021F7E9C[mapApp->zoomed];

    r7 = gSystem.touchX - mapApp->centerX;
    r4 = gSystem.touchY - mapApp->centerY;
    r7 /= ((mapApp->zoomed + 1) * 8);
    r4 /= ((mapApp->zoomed + 1) * 8);
    if (r4 < r6[0]) {
        r4 = r6[0];
    }
    if (r4 > r6[1]) {
        r4 = r6[1];
    }
    if (r7 < r6[2]) {
        r7 = r6[2];
    }
    if (r7 > r6[3]) {
        r7 = r6[3];
    }
    r7 += mapApp->cursorSpriteState.left;
    r4 += mapApp->cursorSpriteState.top;
    if (a1 != NULL) {
        *a1 = r7;
    }
    if (a2 != NULL) {
        *a2 = r4;
    }
    ov101_021E94C0(mapApp);
}

BOOL MapApp_MarkingSlotIsSet(PokegearMapAppData *mapApp, u8 slot) {
    MapMarkingsRAM *markings;
    if (mapApp->selectedLoc.markingsNode == NULL || slot >= 8) {
        return FALSE;
    }

    markings = &mapApp->selectedLoc.markingsNode->mapMarkings;
    if (slot % 2 == 0) {
        if (markings->icons[slot / 2] != MAP_MARKING_ICON_NULL) {
            return TRUE;
        }
    } else {
        if (markings->words[slot / 2] != EC_WORD_NULL) {
            return TRUE;
        }
    }

    return FALSE;
}

void PokegearMap_MarkingsMenu_SetTrashcanIconState(PokegearMapAppData *mapApp, BOOL state) {
    mapApp->trashcanIconState = state;
    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 5, 8, 8, 5, mapApp->unk_17C->rawData, 8 * mapApp->trashcanIconState + 14, 16, mapApp->unk_17C->screenWidth / 8, mapApp->unk_17C->screenHeight / 8);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

int PokegearMap_HandleKeyInput_SelectMarkingsSlot(PokegearMapAppData *mapApp) {
    u8 input;

    if (gSystem.newKeys & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        PokegearAppSwitch_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, FALSE);
        return PGMAP_MAIN_STATE_EXIT_MARKING_MODE;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        input = PokegearAppSwitch_GetCursorPos(mapApp->pokegear->appSwitch);
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        if (input == 8) { // cancel
            PokegearAppSwitch_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, FALSE);
            return PGMAP_MAIN_STATE_EXIT_MARKING_MODE;
        }
        if (MapApp_MarkingSlotIsSet(mapApp, input)) {
            PokegearAppSwitch_SetCursorSpritesAnimateFlag(mapApp->pokegear->appSwitch, 0xFFFF, FALSE);
            PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 3, 0);
            PokegearAppSwitch_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, TRUE);
            PokegearMap_MarkingsMenu_SetTrashcanIconState(mapApp, TRUE);
            mapApp->draggingType = PGMAP_DRAG_FROM_SET;
            return -1;
        } else {
            if (input % 2 == 0) {
                PokegearAppSwitch_SetCursorSpritesAnimateFlag(mapApp->pokegear->appSwitch, 0xFFFF, FALSE);
                PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 2, 0);
                PokegearAppSwitch_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, TRUE);
                mapApp->draggingType = PGMAP_DRAG_FROM_POOL;
                return -1;
            } else {
                mapApp->sessionState.index = input / 2;
                mapApp->sessionState.mapID = mapApp->selectedLoc.locationSpec->mapId;
                return PGMAP_MAIN_STATE_FADE_OUT_FOR_WORD_SELECT;
            }
        }
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        PokegearAppSwitch_MoveActiveCursor(mapApp->pokegear->appSwitch, 0);
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        PokegearAppSwitch_MoveActiveCursor(mapApp->pokegear->appSwitch, 1);
    } else if (gSystem.newKeys & PAD_KEY_UP) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        PokegearAppSwitch_MoveActiveCursor(mapApp->pokegear->appSwitch, 2);
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        PokegearAppSwitch_MoveActiveCursor(mapApp->pokegear->appSwitch, 3);
    }
    return -1;
}

int PokegearMap_HandleTouchInput_SelectMarkingsSlot(PokegearMapAppData *mapApp, BOOL *pRetIsTouch) {
    int slot;
    u16 index;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    static const TouchscreenHitbox hitboxes[] = {
        // set markings
        { .rect = { 0x18, 0x2c, 0x18, 0x28 } },
        { .rect = { 0x18, 0x2c, 0x28, 0x80 } },
        { .rect = { 0x18, 0x2c, 0x80, 0x90 } },
        { .rect = { 0x18, 0x2c, 0x90, 0xe8 } },
        { .rect = { 0x2c, 0x40, 0x18, 0x28 } },
        { .rect = { 0x2c, 0x40, 0x28, 0x80 } },
        { .rect = { 0x2c, 0x40, 0x80, 0x90 } },
        { .rect = { 0x2c, 0x40, 0x90, 0xe8 } },
        // icons pool
        { .rect = { 0x7c, 0x8c, 0x20, 0x30 } },
        { .rect = { 0x7c, 0x8c, 0x38, 0x48 } },
        { .rect = { 0x7c, 0x8c, 0x50, 0x60 } },
        { .rect = { 0x7c, 0x8c, 0x68, 0x78 } },
        { .rect = { 0x7c, 0x8c, 0x80, 0x90 } },
        { .rect = { 0x7c, 0x8c, 0x98, 0xa8 } },
        { .rect = { 0x7c, 0x8c, 0xb0, 0xc0 } },
        { .rect = { 0x7c, 0x8c, 0xc8, 0xd8 } },
        // back button
        { .rect = { 0x40, 0x68, 0xc0, 0xe8 } },
        { .rect = { TOUCHSCREEN_RECTLIST_END } },
    };

    // unused but needed to match
    static const TouchscreenHitbox dummy = { .rect = { TOUCHSCREEN_RECTLIST_END } };

    if (!System_GetTouchHeld()) {
        return -1;
    }

    if (mapApp->draggingMarking) {
        return -1;
    }

    slot = TouchscreenHitbox_FindRectAtTouchNew(hitboxes);
    if (slot != -1) {
        *pRetIsTouch = TRUE;
        if (slot == 16) {
            CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 23, 8, 6, 5, mapApp->unk_17C->rawData, 7, 16, mapApp->unk_17C->screenWidth / 8, mapApp->unk_17C->screenHeight / 8);
            ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            return PGMAP_MAIN_STATE_EXIT_MARKING_MODE;
        } else if (slot >= 8) {
            mapApp->draggingIcon = slot - 8;
            mapApp->draggingType = PGMAP_DRAG_FROM_POOL;
            PokegearManagedObject_SetPriority(&objects[slot + PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0], 1);
            PlaySE(SEQ_SE_GS_GEARSEALGRAB);
            return -1;
        } else if (MapApp_MarkingSlotIsSet(mapApp, slot)) {
            index = slot / 2;
            if (slot % 2 == 0) { // icon
                mapApp->draggingIcon = index;
                mapApp->draggingWordX = mapApp->draggingWordY = 0;
                PokegearManagedObject_SetPriority(&objects[index + PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0], 1);
            } else { // word
                mapApp->draggingIcon = index + 4;
                mapApp->draggingWordX = ((index % 2) * 0x68 + 0x28) - gSystem.touchX;
                mapApp->draggingWordY = ((index / 2) * 0x15 + 0x1F) - gSystem.touchY;
                PokegearManagedObject_SetPriority(&objects[index + PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_0], 1);
                sub_02013820(mapApp->unk_044[index].textOBJ, 0);
            }
            mapApp->draggingType = PGMAP_DRAG_FROM_SET;
            PlaySE(SEQ_SE_GS_GEARSEALGRAB);
            return -1;
        } else if (slot % 2 == 1) {
            mapApp->sessionState.index = slot / 2;
            mapApp->sessionState.mapID = mapApp->selectedLoc.locationSpec->mapId;
            PlaySE(SEQ_SE_GS_GEARDECIDE);
            return PGMAP_MAIN_STATE_FADE_OUT_FOR_WORD_SELECT;
        } else {
            return -1;
        }
    }

    return -1;
}

void PokegearMap_MarkingsMenu_ReturnToTopLevel(PokegearMapAppData *mapApp) {
    PokegearAppSwitch_SetActiveCursorPosition(mapApp->pokegear->appSwitch, 0);
    PokegearAppSwitch_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, FALSE);
    PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 1, PokegearAppSwitch_GetSpecCursorPos(mapApp->pokegear->appSwitch, 1));
    PokegearAppSwitch_SetCursorSpritesAnimateFlag(mapApp->pokegear->appSwitch, 0xFFFF, TRUE);
    mapApp->draggingType = PGMAP_DRAG_NONE;
}

int PokegearMap_HandleKeyInput_SelectedIconFromPool(PokegearMapAppData *mapApp) {
    u8 iconID;
    u8 iconIndex;

    if (gSystem.newKeys & PAD_BUTTON_A) {
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        iconID = PokegearAppSwitch_GetCursorPos(mapApp->pokegear->appSwitch);
        iconIndex = PokegearAppSwitch_GetSpecCursorPos(mapApp->pokegear->appSwitch, 1);
        if (mapApp->selectedLoc.markingsNode == NULL) {
            mapApp->selectedLoc.markingsNode = MapApp_GetOrCreateMarkingsHeapNodeByMapID(mapApp, mapApp->selectedLoc.locationSpec->mapId);
        }
        MapMarkingsHeapNode_SetIcon(mapApp->selectedLoc.markingsNode, iconIndex / 2, iconID);
        PokegearMap_PrintSelectedMapDetail(mapApp, FALSE);
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        PokegearMap_MarkingsMenu_ReturnToTopLevel(mapApp);
        return -1;
    }
    if (System_GetTouchNew()) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        PokegearMap_MarkingsMenu_ReturnToTopLevel(mapApp);
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_TOUCH) {
            PokegearMap_InMarkingsMode_HideCursor(mapApp);
            mapApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
        }
        return -1;
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        PokegearAppSwitch_MoveActiveCursor(mapApp->pokegear->appSwitch, 0);
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        PokegearAppSwitch_MoveActiveCursor(mapApp->pokegear->appSwitch, 1);
    }
    return -1;
}

int PokegearMap_HandleTouchInput_DragItemFromPool(PokegearMapAppData *mapApp) {
    int input;

    static const TouchscreenHitbox touchscreenHitboxes[] = {
        { .rect = { 0x18, 0x2c, 0x18, 0x28 } },
        { .rect = { 0x18, 0x2c, 0x80, 0x90 } },
        { .rect = { 0x2c, 0x40, 0x18, 0x28 } },
        { .rect = { 0x2c, 0x40, 0x80, 0x90 } },
        { .rect = { TOUCHSCREEN_RECTLIST_END } },
    };

    if (!System_GetTouchHeld()) { // not dragging
        input = TouchscreenHitbox_FindHitboxAtPoint(touchscreenHitboxes, gSystem.touchX, gSystem.touchY);
        PlaySE(SEQ_SE_GS_GEARSEALHAMERU);
        if (input == -1) { // no input
            PokegearManagedObject_SetCoordUpdateSprite(&mapApp->objManager->objects[PGMAP_SPRITE_MARKINGS_MENU_ICON_POKEBALL + mapApp->draggingIcon], mapApp->draggingIcon * 24 + 40, 132);
            PokegearManagedObject_SetPriority(&mapApp->objManager->objects[PGMAP_SPRITE_MARKINGS_MENU_ICON_POKEBALL + mapApp->draggingIcon], 4);
            mapApp->draggingType = PGMAP_DRAG_NONE;
            return -1;
        }

        // Handle new tap
        if (mapApp->selectedLoc.markingsNode == NULL) {
            mapApp->selectedLoc.markingsNode = MapApp_GetOrCreateMarkingsHeapNodeByMapID(mapApp, mapApp->selectedLoc.locationSpec->mapId);
        }
        MapMarkingsHeapNode_SetIcon(mapApp->selectedLoc.markingsNode, input, mapApp->draggingIcon);
        PokegearMap_PrintSelectedMapDetail(mapApp, FALSE);
        PokegearManagedObject_SetCoordUpdateSprite(&mapApp->objManager->objects[PGMAP_SPRITE_MARKINGS_MENU_ICON_POKEBALL + mapApp->draggingIcon], mapApp->draggingIcon * 24 + 40, 132);
        PokegearManagedObject_SetPriority(&mapApp->objManager->objects[PGMAP_SPRITE_MARKINGS_MENU_ICON_POKEBALL + mapApp->draggingIcon], 4);
        mapApp->draggingType = PGMAP_DRAG_NONE;
        return -1;
    }

    // Dragging
    PokegearManagedObject_SetCoordUpdateSprite(&mapApp->objManager->objects[PGMAP_SPRITE_MARKINGS_MENU_ICON_POKEBALL + mapApp->draggingIcon], gSystem.touchX, gSystem.touchY);
    return -1;
}

void PokegearMap_MarkingsMenu_DeleteSelected(PokegearMapAppData *mapApp, u8 kind, u8 index) {
    u8 result;
    if (kind == 0) {
        result = MapMarkingsHeapNode_RemoveIcon(mapApp->selectedLoc.markingsNode, index);
    } else {
        result = MapMarkingsHeapNode_RemoveWord(mapApp->selectedLoc.markingsNode, index);
    }
    if (result == 0) {
        MapApp_RemoveMarkingsHeapNodeFromList(mapApp, mapApp->selectedLoc.markingsNode);
        mapApp->selectedLoc.markingsNode = NULL;
    }
    PokegearMap_PrintSelectedMapDetail(mapApp, FALSE);
}

int PokegearMap_HandleKeyInput_SelectedMarkingSlot(PokegearMapAppData *mapApp) {
    u8 cursorPos;
    if (gSystem.newKeys & PAD_BUTTON_A) {
        PlaySE(SEQ_SE_GS_GEARGOMIBAKO);
        cursorPos = PokegearAppSwitch_GetSpecCursorPos(mapApp->pokegear->appSwitch, 1);
        PokegearMap_MarkingsMenu_DeleteSelected(mapApp, cursorPos % 2, cursorPos / 2);
        PokegearMap_MarkingsMenu_ReturnToTopLevel(mapApp);
        PokegearMap_MarkingsMenu_SetTrashcanIconState(mapApp, FALSE);
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        PokegearMap_MarkingsMenu_ReturnToTopLevel(mapApp);
        PokegearMap_MarkingsMenu_SetTrashcanIconState(mapApp, FALSE);
    } else if (System_GetTouchNew()) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        PokegearMap_MarkingsMenu_ReturnToTopLevel(mapApp);
        PokegearMap_MarkingsMenu_SetTrashcanIconState(mapApp, FALSE);
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_TOUCH) {
            PokegearMap_InMarkingsMode_HideCursor(mapApp);
            mapApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
        }
    }
    return -1;
}

void ov101_021ED204(PokegearMapAppData *mapApp, u8 slot) {
    u8 index;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    if (slot < 4) {
        index = mapApp->draggingIcon;
        PokegearManagedObject_SetCoordUpdateSprite(&objects[index + PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0], 104 * (mapApp->draggingIcon % 2) + 32, 21 * (mapApp->draggingIcon / 2) + 32);
        PokegearManagedObject_SetPriority(&objects[index + PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0], 4);
    } else {
        index = slot - 4;
        PokegearManagedObject_SetCoordUpdateSprite(&objects[index + PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_0], 104 * (index % 2) + 40, 21 * (index / 2) + 31);
        PokegearManagedObject_SetPriority(&objects[index + PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_0], 4);
        sub_020136B4(mapApp->unk_044[index].textOBJ, 4, -6);
        sub_02013820(mapApp->unk_044[index].textOBJ, 3);
    }
}

int PokegearMap_HandleTouchInput_DragMarkingSlot(PokegearMapAppData *mapApp) {
    int input;

    static const TouchscreenHitbox touchscreenHitboxes[] = {
        { .rect = { 0x18, 0x2c, 0x18, 0x28 } },
        { .rect = { 0x18, 0x2c, 0x80, 0x90 } },
        { .rect = { 0x2c, 0x40, 0x18, 0x28 } },
        { .rect = { 0x2c, 0x40, 0x80, 0x90 } },
        { .rect = { 0x18, 0x2c, 0x28, 0x80 } },
        { .rect = { 0x18, 0x2c, 0x90, 0xe8 } },
        { .rect = { 0x2c, 0x40, 0x28, 0x80 } },
        { .rect = { 0x2c, 0x40, 0x90, 0xe8 } },
        { .rect = { 0x44, 0x60, 0x2c, 0x64 } },
        { .rect = { TOUCHSCREEN_RECTLIST_END } },
    };

    if (!System_GetTouchHeld()) {
        input = TouchscreenHitbox_FindHitboxAtPoint(touchscreenHitboxes, gSystem.touchX, gSystem.touchY);
        if (input == 8) {
            PokegearMap_MarkingsMenu_DeleteSelected(mapApp, mapApp->draggingIcon / 4, mapApp->draggingIcon % 4);
            ov101_021ED204(mapApp, mapApp->draggingIcon);
            PokegearMap_MarkingsMenu_SetTrashcanIconState(mapApp, FALSE);
            PlaySE(SEQ_SE_GS_GEARGOMIBAKO);
            mapApp->draggingType = PGMAP_DRAG_NONE;
            return -1;
        } else if (input == -1 || mapApp->draggingIcon / 4 != input / 4 || mapApp->draggingIcon == input) {
            ov101_021ED204(mapApp, mapApp->draggingIcon);
            PlaySE(SEQ_SE_GS_GEARSEALHAMERU);
            mapApp->draggingType = PGMAP_DRAG_NONE;
            return -1;
        } else if (input / 4 == 0) {
            MapMarkingsHeapNode_SwapIcons(mapApp->selectedLoc.markingsNode, mapApp->draggingIcon % 4, input % 4);
        } else {
            MapMarkingsHeapNode_SwapWords(mapApp->selectedLoc.markingsNode, mapApp->draggingIcon % 4, input % 4);
        }
        PokegearMap_PrintSelectedMapDetail(mapApp, FALSE);
        ov101_021ED204(mapApp, mapApp->draggingIcon);
        PlaySE(SEQ_SE_GS_GEARSEALHAMERU);
        mapApp->draggingType = PGMAP_DRAG_NONE;
        return -1;
    }
    PokegearManagedObject_SetCoordUpdateSprite(&mapApp->objManager->objects[mapApp->draggingIcon + PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0], gSystem.touchX + mapApp->draggingWordX, gSystem.touchY + mapApp->draggingWordY);
    if (mapApp->draggingIcon >= 4) {
        sub_020136B4(mapApp->unk_044[mapApp->draggingIcon - 4].textOBJ, 4, -6);
    }
    if (TouchscreenHitbox_PointIsIn(&touchscreenHitboxes[8], gSystem.touchX, gSystem.touchY) != mapApp->trashcanIconState) {
        PokegearMap_MarkingsMenu_SetTrashcanIconState(mapApp, mapApp->trashcanIconState ^ TRUE);
    }
    return -1;
}
