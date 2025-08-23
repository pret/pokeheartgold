#include "global.h"

#include "constants/items.h"
#include "constants/map_sections.h"
#include "constants/maps.h"

#include "application/pokegear/map/pokegear_map_internal.h"

#include "sys_flags.h"
#include "text.h"
#include "touchscreen_list_menu.h"
#include "unk_02068F84.h"
#include "unk_020932A4.h"

static void PokegearMap_LoadState(PokegearMapAppData *mapApp);
static void ov101_021E9848(PokegearMapAppData *mapApp, u16 xIn, u16 yIn, s16 a3, s16 a4, int *xOut, int *yOut);
static BOOL PokegearMap_ShouldLocationBeHidden(PokegearMapAppData *mapApp, int a1);
static int ov101_021EA81C(PokegearMapAppData *mapApp, u16 a1, u16 a2);
static BOOL PokegearMap_MapHasPhoneRematchOrGift(PokegearMapAppData *mapApp, int a1);
static void ov101_021EAA0C(PokegearMapAppData *mapApp, BOOL a1, BOOL a2);
static void PokegearMap_PrintMarkingECWord(PokegearMapAppData *mapApp, u8 a1, u16 a2);
static void PokegearMap_GetLandmarkNameFromMapID(u16 mapno, enum HeapID heapID, String *dest);

const TouchscreenListMenuTemplate sListMenuTemplate = {
    .wrapAround = TRUE,
    .centered = TRUE,
    .xOffset = 0,
    .bgId = GF_BG_LYR_MAIN_0,
    .plttOffset = 14,
    .unk4 = 0,
    .unk5 = 0,
    .baseTile = 0x01C,
    .charOffset = 0x0001,
    .unkA = 0x40,
};

void PokegearMap_VBlankCB(PokegearAppData *pokegear, void *appData) {
    PokegearMapAppData *mapApp = appData;

    if (mapApp->requestAffineUpdate) {
        PokegearMap_OnVBlank_UpdateCursorAffine(mapApp, &mapApp->cursorSpriteState);
    }
}

void PokegearMap_UpdateCursorBounds(PokegearMapAppData *mapApp) {
    if (mapApp->zoomed) {
        mapApp->cursorSpriteState.top = (mapApp->cursorSpriteState.y + mapApp->cursorSpriteState.affineY - 8) / 16 + 1;
        mapApp->cursorSpriteState.left = (mapApp->cursorSpriteState.x + mapApp->cursorSpriteState.affineX - 8) / 16 + 1;
        mapApp->cursorSpriteState.bottom = mapApp->cursorSpriteState.top + 7;
        mapApp->cursorSpriteState.right = mapApp->cursorSpriteState.left + 11;
    } else {
        mapApp->cursorSpriteState.top = (-mapApp->cursorSpriteState.y) / 8 + 1;
        mapApp->cursorSpriteState.left = mapApp->cursorSpriteState.x / 8 + 1;
        mapApp->cursorSpriteState.bottom = mapApp->cursorSpriteState.top + 16;
        mapApp->cursorSpriteState.right = mapApp->cursorSpriteState.left + 23;
    }
}

void PokegearMap_SaveState(PokegearMapAppData *mapApp) {
    MI_CpuClear8(&mapApp->sessionState, sizeof(mapApp->sessionState));
    mapApp->sessionState.word = EC_WORD_NULL;
    mapApp->sessionState.active = 1;
    mapApp->sessionState.zoomed = mapApp->zoomed;
    mapApp->sessionState.playerX = mapApp->playerX;
    mapApp->sessionState.playerY = mapApp->playerY;
    mapApp->sessionState.cursorSpriteX = mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].pos.x;
    mapApp->sessionState.cursorSpriteY = mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].pos.y;
    mapApp->sessionState.cursorX = mapApp->cursorSpriteState.x;
    mapApp->sessionState.cursorY = mapApp->cursorSpriteState.y;
    mapApp->sessionState.cursorAffineX = mapApp->cursorSpriteState.affineX;
    mapApp->sessionState.cursorAffineY = mapApp->cursorSpriteState.affineY;
    mapApp->sessionState.cursorTop = mapApp->cursorSpriteState.top;
    mapApp->sessionState.cursorBottom = mapApp->cursorSpriteState.bottom;
    mapApp->sessionState.cursorLeft = mapApp->cursorSpriteState.left;
    mapApp->sessionState.cursorRight = mapApp->cursorSpriteState.right;
}

static void PokegearMap_LoadState(PokegearMapAppData *mapApp) {
    mapApp->playerX = mapApp->sessionState.playerX;
    mapApp->playerY = mapApp->sessionState.playerY;
    mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].pos.x = mapApp->sessionState.cursorSpriteX;
    mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].pos.y = mapApp->sessionState.cursorSpriteY;
    mapApp->cursorSpriteState.x = mapApp->sessionState.cursorX;
    mapApp->cursorSpriteState.y = mapApp->sessionState.cursorY;
    mapApp->cursorSpriteState.affineX = mapApp->sessionState.cursorAffineX;
    mapApp->cursorSpriteState.affineY = mapApp->sessionState.cursorAffineY;
    mapApp->cursorSpriteState.top = mapApp->sessionState.cursorTop;
    mapApp->cursorSpriteState.bottom = mapApp->sessionState.cursorBottom;
    mapApp->cursorSpriteState.left = mapApp->sessionState.cursorLeft;
    mapApp->cursorSpriteState.right = mapApp->sessionState.cursorRight;
    MI_CpuClear8(&mapApp->sessionState, sizeof(mapApp->sessionState));
    mapApp->sessionState.word = EC_WORD_NULL;
    mapApp->sessionState.active = 0;
}

void ov101_021E9464(PokegearMapAppData *mapApp, s16 xIn, s16 yIn, u16 *xOut, u16 *yOut) {
    s16 x;
    s16 y;

    x = xIn - mapApp->centerX;
    y = yIn - mapApp->centerY;

    if (mapApp->zoomed) {
        *xOut = x / 16;
        *yOut = y / 16;
    } else {
        *xOut = x / 8;
        *yOut = y / 8;
    }
}

void ov101_021E94C0(PokegearMapAppData *mapApp) {
    s16 x;
    s16 y;
    u8 scale;

    scale = mapApp->zoomed + 1;

    x = mapApp->playerX - mapApp->cursorSpriteState.left;
    y = mapApp->playerY - mapApp->cursorSpriteState.top;

    x = x * (8 * scale) + mapApp->centerX + 4 * scale;
    y = y * (8 * scale) + mapApp->centerY + 4 * scale;

    PokegearManagedObject_SetCoordUpdateSprite(&mapApp->objManager->objects[PGMAP_SPRITE_CURSOR], x, y);
}

void ov101_021E9530(PokegearMapAppData *mapApp, u8 zoomed, u16 x0, u16 y0, s16 xIn, s16 yIn) {
    u16 x;
    u16 y;
    s16 xCenter;
    s16 yCenter;
    s16 xOffset;
    s16 yOffset;
    s16 top;
    s16 bottom;
    s16 left;
    s16 right;
    u8 grid;

    if (zoomed) {
        grid = 16;
        ov101_021E9464(mapApp, xIn, yIn, &x, &y);
        xCenter = 5 - x;
        yCenter = 4 - y;
        top = y0 - y - yCenter;
        bottom = y0 + (7 - y) - yCenter;
        left = x0 - x - xCenter;
        right = x0 + (11 - x) - xCenter;
    } else {
        grid = 8;
        x = x0 - (mapApp->cursorSpriteState.x / 8 + 1);
        y = y0 - (mapApp->cursorSpriteState.y / 8 + 1);
        xCenter = 11 - x;
        yCenter = 8 - y;
        top = y0 - y - yCenter;
        bottom = y0 + (16 - y) - yCenter;
        left = x0 - x - xCenter;
        right = x0 + (23 - x) - xCenter;
    }
    if (top < mapApp->minYscroll) {
        yOffset = top - mapApp->minYscroll;
        yCenter += yOffset;
        top -= yOffset;
        bottom -= yOffset;
    } else if (bottom > mapApp->maxYscroll) {
        yOffset = bottom - mapApp->maxYscroll;
        yCenter += yOffset;
        bottom -= yOffset;
        top -= yOffset;
    }
    if (left < mapApp->minXscroll) {
        xOffset = left - mapApp->minXscroll;
        xCenter += xOffset;
        left -= xOffset;
        right -= xOffset;
    } else if (right > mapApp->maxXscroll) {
        xOffset = right - mapApp->maxXscroll;
        xCenter += xOffset;
        right -= xOffset;
        left -= xOffset;
    }
    mapApp->cursorSpriteState.top = top;
    mapApp->cursorSpriteState.bottom = bottom;
    mapApp->cursorSpriteState.left = left;
    mapApp->cursorSpriteState.right = right;
    mapApp->cursorSpriteState.dx = -(xCenter * grid);
    mapApp->cursorSpriteState.dy = -(yCenter * grid);
    mapApp->cursorSpriteState.destX = mapApp->cursorSpriteState.x + mapApp->cursorSpriteState.dx;
    mapApp->cursorSpriteState.destY = mapApp->cursorSpriteState.y + mapApp->cursorSpriteState.dy;
    mapApp->cursorSpriteState.unk_20 = FX32_CONST(mapApp->cursorSpriteState.x);
    mapApp->cursorSpriteState.unk_24 = FX32_CONST(mapApp->cursorSpriteState.y);
    mapApp->cursorSpriteState.dxStep = FX_Div(FX32_CONST(mapApp->cursorSpriteState.dx), FX32_CONST(mapApp->cursorSpeed));
    mapApp->cursorSpriteState.dyStep = FX_Div(FX32_CONST(mapApp->cursorSpriteState.dy), FX32_CONST(mapApp->cursorSpeed));
}

static void ov101_021E9848(PokegearMapAppData *mapApp, u16 xIn, u16 yIn, s16 a3, s16 a4, int *xOut, int *yOut) {
    u8 r2 = 0;
    u8 r1 = 0;
    if (!mapApp->zoomed) {
        r2 = (a3 - mapApp->centerX) / 16;
        r1 = (a4 - mapApp->centerY) / 16;
        if (r2 <= 5) {
            *xOut = xIn * 8 + 8;
        } else {
            *xOut = xIn * 8;
        }
        if (r1 > 4) {
            *yOut = yIn * 8 + 8;
        } else {
            *yOut = yIn * 8;
        }
    } else {
        r2 = ((a3 - mapApp->centerX) / 8) % 2;
        r1 = ((a4 - mapApp->centerY) / 8) % 2;
        *xOut = xIn * 8 + r2 * 8;
        *yOut = yIn * 8 + r1 * 8;
    }
}

void ov101_021E990C(PokegearMapAppData *mapApp) {
    s16 x;
    s16 y;
    u16 ratio;
    u16 grid;
    u16 gridHalf;
    VecFx32 scale;
    PokegearManagedObject *objects = mapApp->objManager->objects;
    if (mapApp->zoomed) {
        ratio = 2;
        grid = 16;
    } else {
        ratio = 1;
        grid = 8;
    }
    mapApp->cursorSpriteState.xRatio = FX32_CONST(ratio);
    mapApp->cursorSpriteState.yRatio = FX32_CONST(ratio);
    gridHalf = grid / 2;
    if (mapApp->sessionState.active) {
        PokegearMap_LoadState(mapApp);
    } else {
        ov101_021E9530(mapApp, FALSE, mapApp->playerX, mapApp->playerY, 0, 0);
        mapApp->cursorSpriteState.x = mapApp->cursorSpriteState.destX;
        mapApp->cursorSpriteState.y = mapApp->cursorSpriteState.destY;
        x = (mapApp->playerX - mapApp->cursorSpriteState.left) * 8 + mapApp->centerX + 4;
        y = (mapApp->playerY - mapApp->cursorSpriteState.top) * 8 + mapApp->centerY + 4;
        if (mapApp->zoomed) {
            ov101_021E9530(mapApp, TRUE, mapApp->playerX, mapApp->playerY, x, y);
            ov101_021E9848(mapApp, mapApp->playerX, mapApp->playerY, x, y, &mapApp->cursorSpriteState.affineX, &mapApp->cursorSpriteState.affineY);
            mapApp->cursorSpriteState.x = mapApp->cursorSpriteState.destX;
            mapApp->cursorSpriteState.y = mapApp->cursorSpriteState.destY;
            x = (mapApp->playerX - mapApp->cursorSpriteState.left) * grid + mapApp->centerX + gridHalf;
            y = (mapApp->playerY - mapApp->cursorSpriteState.top) * grid + mapApp->centerY + gridHalf;
        }
        PokegearManagedObject_SetCoord(&objects[PGMAP_SPRITE_CURSOR], x, y);
    }
    PokegearManagedObject_SetCoord2(&objects[PGMAP_SPRITE_CURSOR], mapApp->playerX, mapApp->playerY);
    scale.x = scale.y = FX32_CONST(ratio);
    scale.z = FX32_ONE;
    Sprite_SetAffineScale(objects[PGMAP_SPRITE_CURSOR].sprite, &scale);
    x = (mapApp->matrixX - mapApp->cursorSpriteState.left) * grid + mapApp->centerX + gridHalf;
    y = (mapApp->matrixY - mapApp->cursorSpriteState.top) * grid + mapApp->centerY + gridHalf;
    PokegearManagedObject_SetCoord(&objects[PGMAP_SPRITE_PLAYER], x, y);
    PokegearManagedObject_SetCoord2(&objects[PGMAP_SPRITE_PLAYER], mapApp->matrixX, mapApp->matrixY);
}

void PokegearMap_OnVBlank_UpdateCursorAffine(PokegearMapAppData *mapApp, PokegearMapCursorState *cursorState) {
    int i;
    MtxFx22 affMat;
    fx32 xScale;
    fx32 yScale;

    xScale = FX_Inv(cursorState->xRatio);
    yScale = FX_Inv(cursorState->yRatio);

    affMat._00 = xScale;
    affMat._01 = 0;
    affMat._10 = 0;
    affMat._11 = yScale;

    for (i = 0; i < 2; ++i) {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, cursorState->x + mapApp->xOffset);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, cursorState->y + mapApp->yOffset);
        SetBgAffine(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, &affMat, cursorState->affineX, cursorState->affineY);
    }
    mapApp->requestAffineUpdate = FALSE;
}

void ov101_021E9BF4(PokegearMapAppData *mapApp, s16 dx, s16 dy) {
    u16 i;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    PokegearManagedObject_AddCoord(&objects[PGMAP_SPRITE_PLAYER], dx, dy);

    if (mapApp->unk_139_3) {
        PokegearManagedObject_AddCoord(&objects[PGMAP_SPRITE_CURSOR], dx, dy);
    }
    if (mapApp->type != PGMAP_TYPE_GEAR) {
        for (i = 0; i < PGMAP_NUM_FLYPOINTS; ++i) {
            PokegearManagedObject_AddCoord(&objects[PGMAP_SPRITE_FLY_MENU_WARPS_BEGIN + i], dx, dy);
        }
    } else {
        for (i = 0; i < ROAMER_MAX; ++i) {
            PokegearManagedObject_AddCoord(&objects[PGMAP_SPRITE_ROAMER_RAIKOU + i], dx, dy);
        }
        for (i = 0; i < PGMAP_NUM_LOCATIONS; ++i) {
            PokegearManagedObject_AddCoord(&objects[PGMAP_SPRITE_HAS_MARKINGS_BEGIN + i], dx, dy);
        }
    }
}

BOOL PokegearMap_FadeMapScreen(PokegearMapAppData *mapApp, u8 direction) {
    if (mapApp->fadeStep > 16) {
        return TRUE;
    }
    if (direction == 0) {
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16 - mapApp->fadeStep, RGB_BLACK);
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16 - mapApp->fadeStep, RGB_BLACK);
    } else {
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, mapApp->fadeStep, RGB_BLACK);
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, mapApp->fadeStep, RGB_BLACK);
    }
    if (mapApp->fadeStep >= 16) {
        mapApp->fadeStep += 2;
        return TRUE;
    } else {
        mapApp->fadeStep += 2;
        return FALSE;
    }
}

void PokegearMap_BeginScrollMarkingsPanelTopScreen(PokegearMapAppData *mapApp, u8 direction) {
    int i;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    G2S_SetWnd0Position(0x00, 0x40, 0xFF, 0xC0);
    G2S_SetWnd1Position(0xFF, 0x40, 0x00, 0xC0);
    G2S_SetWndOutsidePlane(0x11, FALSE);
    G2S_SetWnd0InsidePlane(0x1F, FALSE);
    G2S_SetWnd1InsidePlane(0x1F, FALSE);
    GXS_SetVisibleWnd(3);

    if (direction == 0) {
        for (i = 0; i < 3; ++i) {
            BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, -0x80);
            ToggleBgLayer(i + GF_BG_LYR_SUB_1, TRUE);
        }
        for (i = 0; i < 4; ++i) {
            PokegearManagedObject_SetCoord(&objects[PGMAP_SPRITE_MARKER0 + i], (i % 2) * 104 + 32, (i / 2) * 21 + 331);
        }
        PokegearManagedObject_SetCoord(&objects[PGMAP_SPRITE_GEAR_BATTLE], 16, 280);
        PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
    } else {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SUB_Y, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SUB_Y, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SUB_Y, 0);
    }
    mapApp->markingsPanelScrollStep = 0;
    mapApp->markingsPanelScrollActive = 0;
}

BOOL PokegearMap_RunScrollMarkingsPanelTopScreen(PokegearMapAppData *mapApp, u8 direction) {
    PokegearManagedObject *objects = mapApp->objManager->objects;
    int i;

    if (mapApp->markingsPanelScrollActive) {
        return TRUE;
    }
    if (direction == 0) {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_ADD_Y, 32);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_ADD_Y, 32);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_ADD_Y, 32);
        for (i = PGMAP_SPRITE_MARKER0; i <= PGMAP_SPRITE_GEAR_BATTLE; ++i) {
            PokegearManagedObject_AddCoord(&objects[i], 0, -32);
        }
    } else {

        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SUB_Y, 32);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SUB_Y, 32);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SUB_Y, 32);
        for (i = PGMAP_SPRITE_MARKER0; i <= PGMAP_SPRITE_GEAR_BATTLE; ++i) {
            PokegearManagedObject_AddCoord(&objects[i], 0, 32);
        }
    }
    PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
    if (++mapApp->markingsPanelScrollStep < 4) {
        return FALSE;
    }
    mapApp->markingsPanelScrollStep = 0;
    mapApp->markingsPanelScrollActive = 1;
    if (direction == 1) {
        for (i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_SUB_1, FALSE);
            BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
            BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, 0);
            ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
        }
    }

    GXS_SetVisibleWnd(0);
    G2S_SetWnd0Position(0x00, 0x00, 0x00, 0x00);
    G2S_SetWnd1Position(0x00, 0x00, 0x00, 0x00);
    G2S_SetWnd0InsidePlane(0x00, FALSE);
    G2S_SetWnd1InsidePlane(0x00, FALSE);
    G2S_SetWndOutsidePlane(0x00, FALSE);
    return TRUE;
}

void PokegearMap_BeginScrollMarkingsPanelBottomScreen(PokegearMapAppData *mapApp, u8 direction) {
    PokegearManagedObject *objects = mapApp->objManager->objects;
    int i;

    G2_SetWnd0Position(0x00, 0x00, 0xFF, 0x70);
    G2_SetWnd1Position(0xFF, 0x00, 0x00, 0x70);
    G2_SetWndOutsidePlane(0x18, FALSE);
    G2_SetWnd0InsidePlane(0x1F, FALSE);
    G2_SetWnd1InsidePlane(0x1F, FALSE);
    GX_SetVisibleWnd(3);
    if (direction == 0) {
        for (i = 0; i < 2; ++i) {
            BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1, BG_POS_OP_SET_Y, 112);
        }
        for (i = PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0; i <= PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_3; ++i) {
            PokegearManagedObject_AddCoord(&objects[i], 0, -112);
        }
        PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
        for (i = 0; i < 4; ++i) {
            sub_020136B4(mapApp->unk_044[i].textOBJ, 4, -6);
        }
    } else {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SUB_Y, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_Y, 0);
        Sprite_SetDrawFlag(mapApp->objManager->objects[PGMAP_SPRITE_MARKINGS_BLINKING_ARROW].sprite, FALSE);
    }
    mapApp->markingsPanelScrollStep = 0;
    mapApp->markingsPanelScrollActive = 0;
}

BOOL PokegearMap_RunScrollMarkingsPanelBottomScreen(PokegearMapAppData *mapApp, u8 direction) {
    PokegearManagedObject *objects = mapApp->objManager->objects;
    int i;

    if (mapApp->markingsPanelScrollActive) {
        return TRUE;
    }

    if (!direction) {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SUB_Y, 28);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_Y, 28);
        for (i = PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0; i <= PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_3; ++i) {
            PokegearManagedObject_AddCoord(&objects[i], 0, 28);
        }
    } else {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_ADD_Y, 28);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_ADD_Y, 28);
        for (i = PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0; i <= PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_3; ++i) {
            PokegearManagedObject_AddCoord(&objects[i], 0, -28);
        }
    }
    PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
    for (i = 0; i < 4; ++i) {
        sub_020136B4(mapApp->unk_044[i].textOBJ, 4, -6);
    }
    if (++mapApp->markingsPanelScrollStep < 4) {
        return FALSE;
    }
    mapApp->markingsPanelScrollStep = 0;
    mapApp->markingsPanelScrollActive = 1;
    if (direction == 1) {
        for (i = 0; i < 2; ++i) {
            BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
            ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        }
    }

    GX_SetVisibleWnd(0);
    G2_SetWnd0Position(0x00, 0x00, 0x00, 0x00);
    G2_SetWnd1Position(0x00, 0x00, 0x00, 0x00);
    G2_SetWnd0InsidePlane(0x00, FALSE);
    G2_SetWnd1InsidePlane(0x00, FALSE);
    G2_SetWndOutsidePlane(0x00, FALSE);
    if (direction == 0) {
        Sprite_SetDrawFlag(mapApp->objManager->objects[PGMAP_SPRITE_MARKINGS_BLINKING_ARROW].sprite, TRUE);
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_TOUCH) {
            PokegearCursorManager_SetCursorSpritesDrawState(mapApp->pokegear->cursorManager, 1, TRUE);
        }
    }
    return TRUE;
}

void ov101_021EA238(PokegearMapAppData *mapApp, u8 mode) {
    u16 i;
    u16 index;
    s16 x;
    s16 y;
    u8 grid;
    u8 halfGrid;
    u8 scale;
    const PokegearMapLocationSpec *locationSpec;

    scale = mapApp->zoomed + 1;
    grid = scale * 8;
    halfGrid = grid / 2;

    for (i = 0; i < PGMAP_NUM_LOCATIONS; ++i) {
        locationSpec = &mapApp->locationSpecs[i];
        x = (locationSpec->x - mapApp->cursorSpriteState.left) * grid + mapApp->centerX + halfGrid + locationSpec->objXoffset * scale;
        y = (locationSpec->y - mapApp->cursorSpriteState.top) * grid + mapApp->centerY + halfGrid + locationSpec->objYoffset * scale;
        index = i + PGMAP_SPRITE_HAS_MARKINGS_BEGIN;

        switch (mode) {
        case 0:
            mapApp->objManager->objects[index].pos.x = x;
            mapApp->objManager->objects[index].pos.y = y;
            if (MapApp_GetMarkingsHeapNodeByMapID(mapApp, locationSpec->mapId) != NULL) {
                Sprite_SetDrawFlag(mapApp->objManager->objects[index].sprite, TRUE);
                PokegearManagedObject_SetUnk01(&mapApp->objManager->objects[index], TRUE);
            } else {
                Sprite_SetDrawFlag(mapApp->objManager->objects[index].sprite, FALSE);
                PokegearManagedObject_SetUnk01(&mapApp->objManager->objects[index], FALSE);
            }
            break;
        case 1:
            mapApp->objManager->objects[index].destX = x;
            mapApp->objManager->objects[index].destY = y;
            break;
        case 2:
            Sprite_SetDrawFlag(mapApp->objManager->objects[index].sprite, FALSE);
            PokegearManagedObject_SetUnk01(&mapApp->objManager->objects[index], FALSE);
            break;
        }
    }

    // Roamer icons
    for (i = 0; i < ROAMER_MAX; ++i) {
        index = i + PGMAP_SPRITE_ROAMER_RAIKOU;
        if (mapApp->roamerLocations[i] == MAP_EVERYWHERE) {
            PokegearManagedObject_SetUnk01(&mapApp->objManager->objects[index], FALSE);
            Sprite_SetDrawFlag(mapApp->objManager->objects[index].sprite, FALSE);
            continue;
        }
        locationSpec = PokegearMap_GetLocationSpecByMapID(mapApp, mapApp->roamerLocations[i]);
        x = (locationSpec->x - mapApp->cursorSpriteState.left) * grid + mapApp->centerX + halfGrid + locationSpec->objXoffset * scale;
        y = (locationSpec->y - mapApp->cursorSpriteState.top) * grid + mapApp->centerY + halfGrid + locationSpec->objYoffset * scale;
        switch (mode) {
        case 0:
            mapApp->objManager->objects[index].pos.x = x;
            mapApp->objManager->objects[index].pos.y = y;
            PokegearManagedObject_SetUnk01(&mapApp->objManager->objects[index], TRUE);
            Sprite_SetDrawFlag(mapApp->objManager->objects[index].sprite, TRUE);
            break;
        case 1:
            mapApp->objManager->objects[index].destX = x;
            mapApp->objManager->objects[index].destY = y;
            break;
        case 2:
            PokegearManagedObject_SetUnk01(&mapApp->objManager->objects[index], FALSE);
            Sprite_SetDrawFlag(mapApp->objManager->objects[index].sprite, FALSE);
            break;
        }
    }
}

void ov101_021EA4D0(PokegearMapAppData *mapApp, u8 mode) {
    u16 i;
    u16 objIndex;
    s16 x;
    s16 y;
    s16 halfWidth;
    s16 halfHeight;
    const MapFlypointParam *flypointParam;

    for (i = 0; i < PGMAP_NUM_FLYPOINTS; ++i) {
        flypointParam = &gMapFlypointParams[i];
        halfWidth = flypointParam->width * 4;
        halfHeight = flypointParam->height * 4;
        x = (flypointParam->x - mapApp->cursorSpriteState.left) * 8 + mapApp->centerX + halfWidth;
        y = ((flypointParam->y + 2) - mapApp->cursorSpriteState.top) * 8 + mapApp->centerY + halfHeight;
        objIndex = i + PGMAP_SPRITE_FLY_MENU_WARPS_BEGIN;

        switch (mode) {
        case 0:
            mapApp->objManager->objects[objIndex].pos.x = x;
            mapApp->objManager->objects[objIndex].pos.y = y;
            if (Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, flypointParam->flypoint)) {
                Sprite_SetDrawFlag(mapApp->objManager->objects[objIndex].sprite, TRUE);
            } else {
                Sprite_SetDrawFlag(mapApp->objManager->objects[objIndex].sprite, FALSE);
            }
            if (ov101_021EA804(mapApp, flypointParam->mapIDforWarp, flypointParam->x, flypointParam->y)) {
                Sprite_SetAnimCtrlSeq(mapApp->objManager->objects[objIndex].sprite, 10);
            }
            break;
        case 1:
            mapApp->objManager->objects[objIndex].destX = x;
            mapApp->objManager->objects[objIndex].destY = y;
            break;
        case 2:
            Sprite_SetDrawFlag(mapApp->objManager->objects[objIndex].sprite, FALSE);
            break;
        }
    }
}

void ov101_021EA608(PokegearMapAppData *mapApp, u8 enable) {
    int i;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    if (enable == FALSE) {
        Sprite_SetDrawFlag(objects[PGMAP_SPRITE_CURSOR].sprite, FALSE);
        Sprite_SetDrawFlag(objects[PGMAP_SPRITE_PLAYER].sprite, FALSE);
        for (i = PGMAP_SPRITE_ROAMER_RAIKOU; i <= PGMAP_SPRITE_ROAMER_LATIAS; ++i) {
            Sprite_SetDrawFlag(objects[i].sprite, FALSE);
        }
    } else {
        Sprite_SetDrawFlag(objects[PGMAP_SPRITE_CURSOR].sprite, TRUE);
        Sprite_SetDrawFlag(objects[PGMAP_SPRITE_PLAYER].sprite, TRUE);
    }
}

static BOOL PokegearMap_ShouldLocationBeHidden(PokegearMapAppData *mapApp, int mapID) {
    switch (mapID) {
    case MAP_ROUTE_47:
    case MAP_ROUTE_48:
    case MAP_SAFARI_ZONE_GATE:
        if (!mapApp->canSeeSafariZone) {
            return TRUE;
        }
        break;
    case MAP_SINJOH_RUINS_EXTERIOR:
        if (!mapApp->isMapSinjoh) {
            return TRUE;
        }
        break;
    case MAP_SS_AQUA_1F:
        if (!mapApp->isMapSSAqua) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

BOOL ov101_021EA6C4(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1) {
    if (!a1->locationSpec) {
        return FALSE;
    }
    if (a1->locationSpec->mapId == MAP_SINJOH_RUINS_EXTERIOR || a1->locationSpec->mapId == MAP_SS_AQUA_1F) {
        return FALSE;
    }
    return TRUE;
}

const PokegearMapLocationSpec *PokegearMap_GetLocationSpecByCoord(PokegearMapAppData *mapApp, u8 x, u8 y) {
    const PokegearMapLocationSpec *ret;
    u16 i;

    for (i = 0; i < mapApp->numLocationSpecs; ++i) {
        ret = &mapApp->locationSpecs[i];
        if (x >= ret->x && y >= ret->y && x < ret->x + ret->width && y < ret->y + ret->height) {
            if (PokegearMap_ShouldLocationBeHidden(mapApp, ret->mapId)) {
                ret = NULL;
            }
            return ret;
        }
    }
    return NULL;
}

const PokegearMapLocationSpec *PokegearMap_GetLocationSpecByMapID(PokegearMapAppData *mapApp, u16 mapID) {
    const PokegearMapLocationSpec *locationSpec;
    u16 i;

    for (i = 0; i < mapApp->numLocationSpecs; ++i) {
        locationSpec = &mapApp->locationSpecs[i];
        if (locationSpec->mapId == mapID) {
            if (PokegearMap_ShouldLocationBeHidden(mapApp, locationSpec->mapId)) {
                locationSpec = NULL;
            }
            return locationSpec;
        }
    }
    return NULL;
}

void ov101_021EA794(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1, u8 x, u8 y) {
    a1->locationSpec = PokegearMap_GetLocationSpecByCoord(mapApp, x, y);
    if (mapApp->mapUnlockLevel == 0) {
        // New Bark is at x=21, anything east is Kanto. Hide if haven't unlocked it yet.
        // Carve out an exception for Mt. Silver which is at (25, 10)
        if (!(x == 25 && y == 10) && x >= 22) {
            a1->locationSpec = NULL;
        }
    }
    if (a1->locationSpec == NULL) {
        a1->markingsNode = NULL;
    } else {
        a1->markingsNode = MapApp_GetMarkingsHeapNodeByMapID(mapApp, mapApp->selectedLoc.locationSpec->mapId);
    }
    a1->x = x;
    a1->y = y;
}

BOOL ov101_021EA7E4(PokegearMapAppData *mapApp, u16 x, u16 y) {
    PokegearRegion region = Pokegear_RegionFromCoords(x, y);
    if (mapApp->curRegion == POKEGEAR_REGION_INDIGO || region == mapApp->curRegion) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ov101_021EA804(PokegearMapAppData *mapApp, u16 mapID, u16 x, u16 y) {
    if (mapID == MAP_INDIGO_PLATEAU || mapID == MAP_ROUTE_26) {
        return TRUE;
    } else {
        return ov101_021EA7E4(mapApp, x, y);
    }
}

static int ov101_021EA81C(PokegearMapAppData *mapApp, u16 x, u16 y) {
    int i;
    const MapFlypointParam *flypoint;

    for (i = 0; i < PGMAP_NUM_FLYPOINTS; ++i) {
        flypoint = &gMapFlypointParams[i];
        if (x < flypoint->x || x >= flypoint->x + flypoint->width || y < flypoint->y || y >= flypoint->y + flypoint->height) {
            continue;
        }
        if (!Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, flypoint->flypoint)) {
            continue;
        }
        return i;
    }

    return -1;
}

int PokegearMap_GetFlyDestinationAtCoord(PokegearMapAppData *mapApp, u16 x, u16 y) {
    int idx;

    idx = ov101_021EA81C(mapApp, x, y);
    if (idx < 0 || !ov101_021EA804(mapApp, gMapFlypointParams[idx].mapIDforWarp, x, y)) {
        return 0;
    }
    return gMapFlypointParams[idx].mapIDforWarp;
}

int ov101_021EA8A8(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1, u8 x, u8 y) {
    int mapID;
    int idx;

    idx = ov101_021EA81C(mapApp, x, y - 2);
    if (idx < 0) {
        ov101_021EA794(mapApp, a1, x, y);
        if (mapApp->flyDestination >= 0) {
            Sprite_SetAnimCtrlSeq(mapApp->objManager->objects[PGMAP_SPRITE_FLY_MENU_WARPS_BEGIN + mapApp->flyDestination].sprite, 10);
            mapApp->flyDestination = -1;
        }
        return -1;
    }

    mapID = gMapFlypointParams[idx].mapIDforName;
    a1->x = x;
    a1->y = y;
    a1->locationSpec = PokegearMap_GetLocationSpecByMapID(mapApp, mapID);
    if (mapApp->flyDestination != idx) {
        if (mapApp->flyDestination >= 0) {
            Sprite_SetAnimCtrlSeq(mapApp->objManager->objects[PGMAP_SPRITE_FLY_MENU_WARPS_BEGIN + mapApp->flyDestination].sprite, 10);
            mapApp->flyDestination = -1;
        }
        if (ov101_021EA804(mapApp, mapID, x, y - 2)) {
            Sprite_SetAnimCtrlSeq(mapApp->objManager->objects[PGMAP_SPRITE_FLY_MENU_WARPS_BEGIN + idx].sprite, 11);
            mapApp->flyDestination = idx;
        }
    }
    a1->markingsNode = MapApp_GetMarkingsHeapNodeByMapID(mapApp, mapID);
    return mapID;
}

static BOOL PokegearMap_MapHasPhoneRematchOrGift(PokegearMapAppData *mapApp, int mapID) {
    int i;
    TimeOfDayWildParam timeOfDay;
    PhoneBookEntry *phonebookEntry;

    timeOfDay = GF_RTC_GetTimeOfDayWildParam();
    for (i = 0; i < mapApp->numPhonebookSlots; ++i) {
        phonebookEntry = &mapApp->phoneBook->entries[mapApp->phoneContact[i].id];
        if (phonebookEntry->mapId != mapID) {
            continue;
        }
        if (phonebookEntry->type != 0) {
            continue;
        }
        if (PhoneBookTrainerGetRematchInfo(mapApp->phoneContact[i].id, mapApp->pokegear->saveData, mapApp->phoneBook, timeOfDay) != 0) {
            return TRUE;
        }
        if (PhoneCallPersistentState_PhoneRematches_GiftItemIdGet(mapApp->phoneCallSave, mapApp->phoneContact[i].id) != ITEM_NONE) {
            return TRUE;
        }
    }
    return FALSE;
}

static void ov101_021EAA0C(PokegearMapAppData *mapApp, BOOL a1, BOOL isKanto) {
    u32 mapNameY;
    u32 i;
    u32 tilemap174blockId;
    u8 tilemap16CsrcX;
    PokegearMapAppData_Sub118 *selectedLoc;
    const PokegearMapLocationSpec *locationSpec;
    MapMarkingsHeapNode *markersHeap;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    selectedLoc = &mapApp->selectedLoc;
    locationSpec = selectedLoc->locationSpec;
    markersHeap = selectedLoc->markingsNode;

    String_SetEmpty(mapApp->mapNameString);
    for (i = 0; i < 3; ++i) {
        FillWindowPixelBuffer(&mapApp->windows[i], 0);
    }
    AddTextPrinterParameterizedWithColor(&mapApp->windows[0], 0, mapApp->regionNameStrings[isKanto], 2, 4, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    if (mapApp->type == PGMAP_TYPE_GEAR) {
        if (!ov101_021EA6C4(mapApp, selectedLoc)) {
            ov101_021EB38C(mapApp, 0, 2);
        } else {
            ov101_021EB38C(mapApp, 0, 0);
        }
    }
    if (locationSpec != NULL) {
        PokegearMap_GetLandmarkNameFromMapID(locationSpec->mapId, mapApp->heapID, mapApp->mapNameString);
        if (mapApp->type == PGMAP_TYPE_TOWN_MAP) {
            mapNameY = 1;
        } else {
            mapNameY = 0;
        }
        AddTextPrinterParameterizedWithColor(&mapApp->windows[1], 0, mapApp->mapNameString, 0, mapNameY, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        if (a1) {
            for (i = 0; i <= 1; ++i) {
                CopyWindowToVram(&mapApp->windows[i]);
            }
            CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 23, 11, 8, 7, mapApp->unk_16C->rawData, 0, 0, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
            ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1);
            ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2);
            return;
        }
        if (locationSpec->tilemapUnk174BlockID != 0) {
            tilemap16CsrcX = 8;
            tilemap174blockId = locationSpec->tilemapUnk174BlockID - 1;
        } else {
            tilemap16CsrcX = 0;
            tilemap174blockId = 0;
        }
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 23, 11, 8, 7, mapApp->unk_16C->rawData, tilemap16CsrcX, 0, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, 24, 11, 7, 7, mapApp->unk_174->rawData, (tilemap174blockId % 4) * 7, (tilemap174blockId / 4) * 7, mapApp->unk_174->screenWidth / 8, mapApp->unk_174->screenHeight / 8);
        String_SetEmpty(mapApp->flavorTextString);
        ReadMsgDataIntoString(mapApp->msgData, locationSpec->flavorText, mapApp->flavorTextString);
        AddTextPrinterParameterizedWithColor(&mapApp->windows[2], 0, mapApp->flavorTextString, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        Sprite_SetDrawFlag(objects[PGMAP_SPRITE_GEAR_BATTLE].sprite, PokegearMap_MapHasPhoneRematchOrGift(mapApp, locationSpec->mapId));
    } else {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 23, 11, 8, 7, mapApp->unk_16C->rawData, 0, 0, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
        Sprite_SetDrawFlag(objects[PGMAP_SPRITE_GEAR_BATTLE].sprite, FALSE);
    }
    if (markersHeap != NULL) {
        FillWindowPixelBuffer(&mapApp->windows[3], 0);
        FillWindowPixelBuffer(&mapApp->windows[4], 0);
        for (i = 0; i < 4; ++i) {
            if (markersHeap->mapMarkings.icons[i] != MAP_MARKING_ICON_NULL) {
                Sprite_SetDrawFlag(objects[i + PGMAP_SPRITE_MARKER0].sprite, TRUE);
                Sprite_SetAnimationFrame(objects[i + PGMAP_SPRITE_MARKER0].sprite, markersHeap->mapMarkings.icons[i]);
            } else {
                Sprite_SetDrawFlag(objects[i + PGMAP_SPRITE_MARKER0].sprite, FALSE);
            }
            if (markersHeap->mapMarkings.words[i] != EC_WORD_NULL) {
                BufferECWord(mapApp->msgFormat, 0, markersHeap->mapMarkings.words[i]);
                StringExpandPlaceholders(mapApp->msgFormat, mapApp->flavorTextString, mapApp->formatFlavorTextString);
                AddTextPrinterParameterizedWithColor(&mapApp->windows[(i % 2) + 3], 0, mapApp->flavorTextString, 4, (i / 2) * 21 + 2, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 4, 0), NULL);
            }
        }
    } else {
        for (i = 0; i < 4; ++i) {
            Sprite_SetDrawFlag(objects[i + PGMAP_SPRITE_MARKER0].sprite, FALSE);
            FillWindowPixelBuffer(&mapApp->windows[i + 3], 0);
        }
    }
    for (i = 0; i <= 4; ++i) {
        CopyWindowToVram(&mapApp->windows[i]);
    }
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
}

void ov101_021EAD90(PokegearMapAppData *mapApp, BOOL a1) {
    // Pokegear_RegionFromCoords returning 0 and 1 are considered Kanto, 2 is Johto
    ov101_021EAA0C(mapApp, a1, (Pokegear_RegionFromCoords(mapApp->playerX, mapApp->playerY - 2) / 2) ^ TRUE);
}

static void PokegearMap_PrintMarkingECWord(PokegearMapAppData *mapApp, u8 index, u16 word) {
    if (word == EC_WORD_NULL) {
        TextOBJ_SetSpritesDrawFlag(mapApp->unk_044[index].textOBJ, FALSE);
    } else {
        BufferECWord(mapApp->msgFormat, 0, word);
        StringExpandPlaceholders(mapApp->msgFormat, mapApp->flavorTextString, mapApp->formatFlavorTextString);
        FillWindowPixelBufferText_AssumeTileSize32(&mapApp->windows[8], 0);
        AddTextPrinterParameterizedWithColor(&mapApp->windows[8], 0, mapApp->flavorTextString, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 4, 0), NULL);
        TextOBJ_CopyFromBGWindow(mapApp->unk_044[index].textOBJ, mapApp->unk_040, &mapApp->windows[8], mapApp->heapID);
        TextOBJ_SetSpritesDrawFlag(mapApp->unk_044[index].textOBJ, TRUE);
    }
}

void PokegearMap_PrintSelectedMapDetail(PokegearMapAppData *mapApp, BOOL forceUpdateMapName) {
    u32 i;
    const PokegearMapLocationSpec *locationSpec;
    MapMarkingsHeapNode *markingsNode;
    PokegearMapAppData_Sub118 *selectedLoc;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    selectedLoc = &mapApp->selectedLoc;
    locationSpec = selectedLoc->locationSpec;
    markingsNode = selectedLoc->markingsNode;

    if (forceUpdateMapName) {
        String_SetEmpty(mapApp->mapNameString);
        FillWindowPixelBuffer(&mapApp->windows[7], 0);
        PokegearMap_GetLandmarkNameFromMapID(locationSpec->mapId, mapApp->heapID, mapApp->mapNameString);
        AddTextPrinterParameterizedWithColor(&mapApp->windows[7], 0, mapApp->mapNameString, 0, 5, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    }

    if (markingsNode == NULL) {
        for (i = 0; i < 4; ++i) {
            Sprite_SetDrawFlag(objects[i + PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0].sprite, FALSE);
            PokegearMap_PrintMarkingECWord(mapApp, i, EC_WORD_NULL);
        }
    } else {
        for (i = 0; i < 4; ++i) {
            if (markingsNode->mapMarkings.icons[i] == MAP_MARKING_ICON_NULL) {
                Sprite_SetDrawFlag(objects[i + PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0].sprite, FALSE);
            } else {
                Sprite_SetAnimationFrame(objects[i + PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0].sprite, markingsNode->mapMarkings.icons[i]);
                Sprite_SetDrawFlag(objects[i + PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0].sprite, TRUE);
            }
            PokegearMap_PrintMarkingECWord(mapApp, i, markingsNode->mapMarkings.words[i]);
        }
    }
}

void ov101_021EAF40(PokegearMapAppData *mapApp) {
    int i;
    const MapFlypointParam *flypoint;

    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 47, 20, mapApp->unk_170->rawData, 0, 0, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);

    switch (mapApp->mapUnlockLevel) {
    case 0:
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 22, 0, 6, 20, mapApp->unk_170->rawData, 48, 0, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
        break;
    case 1:
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 29, 0, 3, 20, mapApp->unk_170->rawData, 54, 0, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
        break;
    }

    for (i = 0; i < PGMAP_NUM_FLYPOINTS; ++i) {
        flypoint = &gMapFlypointParams[i];
        if (flypoint->mapIDforName == MAP_CIANWOOD) {
            continue;
        }
        if (flypoint->unk_05 == 0xFF) {
            continue;
        }
        if (mapApp->mapUnlockLevel < 2 && !Pokegear_RegionFromCoords(flypoint->x, flypoint->y)) {
            continue;
        }
        if (Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, flypoint->flypoint)) {
            continue;
        }
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, flypoint->x - flypoint->unk170DestX, flypoint->y - flypoint->unk170DestY + 2, flypoint->unk170DestWidth, flypoint->unk170DestHeight, mapApp->unk_170->rawData, flypoint->unk170SrcX, flypoint->unk170SrcY, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    }

    if (mapApp->canSeeSafariZone) {
        if (!mapApp->canFlyToGoldenrod) {
            CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 1, 9, 5, 6, mapApp->unk_170->rawData, 48, 27, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
        }
    } else if (mapApp->canFlyToGoldenrod) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 1, 9, 5, 6, mapApp->unk_170->rawData, 41, 20, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    } else {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 1, 9, 5, 6, mapApp->unk_170->rawData, 41, 27, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    }
    if (mapApp->isMapSinjoh) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 19, 1, 3, 4, mapApp->unk_170->rawData, 55, 20, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    }
    if (mapApp->isMapSSAqua) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 24, 15, 3, 3, mapApp->unk_170->rawData, 55, 24, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    }
}

void ov101_021EB1E0(PokegearMapAppData *mapApp, u8 a1) {
    int i;
    u16 destX;
    u16 destY;
    const PokegearMapLocationSpec *location;

    if (mapApp->type == PGMAP_TYPE_FLY) {
        return;
    }

    if (a1 == 0 || mapApp->selectedLoc.locationSpec == NULL) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
        ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
        mapApp->lastSelectedMapID = MAP_EVERYWHERE;
        return;
    }

    if (mapApp->selectedLoc.locationSpec->mapId == mapApp->lastSelectedMapID) {
        return;
    }
    mapApp->lastSelectedMapID = mapApp->selectedLoc.locationSpec->mapId;
    BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);

    for (i = 0; i < mapApp->numLocationSpecs; ++i) {
        if (mapApp->selectedLoc.locationSpec->mapId != mapApp->locationSpecs[i].mapId) {
            continue;
        }
        location = &mapApp->locationSpecs[i];
        if (location->tilemapUnk170DestWidth * location->tilemapUnk170DestHeight >= 9) {
            destX = location->x - 1;
            destY = location->y - 1;
        } else {
            destX = location->x;
            destY = location->y;
        }
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, destX, destY, location->tilemapUnk170DestWidth, location->tilemapUnk170DestHeight, mapApp->unk_170->rawData, location->tilemapUnk170SrcX, location->tilemapUnk170SrcY, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    }
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

void PokegearMap_HideMapCursor(PokegearMapAppData *mapApp) {
    Sprite_SetDrawFlag(mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].sprite, FALSE);
    mapApp->unk_139_3 = FALSE;
}

void PokegearMap_DeselectApp(void *appData) {
    PokegearMapAppData *mapApp = appData;

    PokegearCursorManager_SetCursorSpritesDrawState(mapApp->pokegear->cursorManager, 0, FALSE);
    ov101_021E94C0(mapApp);
    Sprite_SetDrawFlag(mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].sprite, TRUE);
    ov101_021EB1E0(mapApp, 1);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GF_PLANE_TOGGLE_ON);
}

void PokegearMap_ShowMapCursor(void *appData) {
    PokegearMapAppData *mapApp = appData;

    ov101_021E94C0(mapApp);
    Sprite_SetDrawFlag(mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].sprite, TRUE);
    mapApp->unk_139_3 = FALSE;
}

void PokegearMap_InMarkingsMode_HideCursor(void *appData) {
    PokegearMapAppData *mapApp = appData;

    PokegearCursorManager_SetCursorSpritesDrawState(mapApp->pokegear->cursorManager, 0xFFFF, FALSE);
}

void PokegearMap_InMarkingsMode_ShowCursor(void *appData) {
    PokegearMapAppData *mapApp = appData;

    PokegearCursorManager_SetCursorSpritesDrawState(mapApp->pokegear->cursorManager, 0xFFFF, TRUE);
}

void ov101_021EB38C(PokegearMapAppData *mapApp, int button, int state) {
    if (button == 0) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 26, 2, 6, 7, mapApp->unk_178->rawData, 6 * state, 21, mapApp->unk_178->screenWidth / 8, mapApp->unk_178->screenHeight / 8);
    } else {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 26, 11, 6, 9, mapApp->unk_178->rawData, 6 * state + 18, 21, mapApp->unk_178->screenWidth / 8, mapApp->unk_178->screenHeight / 8);
    }
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
}

void PokegearMap_SpawnFlyContextMenu(PokegearMapAppData *mapApp, u32 a1) {
    TouchscreenListMenuHeader header;

    MI_CpuClear8(&header, sizeof(TouchscreenListMenuHeader));

    header.template = sListMenuTemplate;
    header.listMenuItems = mapApp->listMenuItems;
    header.bgConfig = mapApp->pokegear->bgConfig;
    header.numWindows = 2;
    if (a1 < 8 || a1 > 15) {
        mapApp->listMenu = TouchscreenListMenu_Create(mapApp->listMenuSpawner, &header, mapApp->pokegear->menuInputState, 11, 4, 0, 0);
    } else {
        mapApp->listMenu = TouchscreenListMenu_Create(mapApp->listMenuSpawner, &header, mapApp->pokegear->menuInputState, 3, 4, 0, 0);
    }
}

void PokegearMap_PrintLandmarkNameAndFlavorText(PokegearMapAppData *mapApp, int mapID) {
    FillWindowPixelBuffer(&mapApp->windows[7], 0);
    if (mapID < 0) {
        AddTextPrinterParameterizedWithColor(&mapApp->windows[7], 0, mapApp->chooseDestinationString, 8, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(3, 2, 0), NULL);
    } else {
        PokegearMap_GetLandmarkNameFromMapID(mapID, mapApp->heapID, mapApp->mapNameString);
        BufferString(mapApp->msgFormat, 0, mapApp->mapNameString, 0, 0, 2);
        StringExpandPlaceholders(mapApp->msgFormat, mapApp->flavorTextString, mapApp->flyToLocationString);
        AddTextPrinterParameterizedWithColor(&mapApp->windows[7], 0, mapApp->flavorTextString, 8, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(3, 2, 0), NULL);
    }
}

static void PokegearMap_GetLandmarkNameFromMapID(u16 mapno, enum HeapID heapID, String *dest) {
    MapID_GetLandmarkName(mapno, heapID, dest);
}
