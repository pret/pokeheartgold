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

void ov101_021E93D0(PokegearMapAppData *mapApp);
void ov101_021E9848(PokegearMapAppData *mapApp, u16 a1, u16 a2, s16 a3, s16 a4, int *a5, int *a6);
void ov101_021E990C(PokegearMapAppData *mapApp);
BOOL ov101_021EA664(PokegearMapAppData *mapApp, int a1);
BOOL ov101_021EA6C4(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1);
int ov101_021EA81C(PokegearMapAppData *mapApp, u16 a1, u16 a2);
BOOL PokegearMap_MapHasPhoneRematchOrGift(PokegearMapAppData *mapApp, int a1);
void ov101_021EAA0C(PokegearMapAppData *mapApp, BOOL a1, BOOL a2);
void ov101_021EADC0(PokegearMapAppData *mapApp, u8 a1, u16 a2);
void PokegearMap_GetLandmarkNameFromMapID(u16 mapno, HeapID heapId, String *dest);

const TouchscreenListMenuTemplate ov101_021F7E80 = {
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

void ov101_021E9270(PokegearAppData *pokegear, void *appData) {
    PokegearMapAppData *mapApp = appData;

    if (mapApp->unk_138_7) {
        ov101_021E9B70(mapApp, &mapApp->unk_0C8);
    }
}

void ov101_021E9288(PokegearMapAppData *mapApp) {
    if (mapApp->zoomed) {
        mapApp->unk_0C8.unk_28 = (mapApp->unk_0C8.unk_04 + mapApp->unk_0C8.unk_14 - 8) / 16 + 1;
        mapApp->unk_0C8.unk_2C = (mapApp->unk_0C8.unk_00 + mapApp->unk_0C8.unk_10 - 8) / 16 + 1;
        mapApp->unk_0C8.unk_2A = mapApp->unk_0C8.unk_28 + 7;
        mapApp->unk_0C8.unk_2E = mapApp->unk_0C8.unk_2C + 11;
    } else {
        mapApp->unk_0C8.unk_28 = (-mapApp->unk_0C8.unk_04) / 8 + 1;
        mapApp->unk_0C8.unk_2C = mapApp->unk_0C8.unk_00 / 8 + 1;
        mapApp->unk_0C8.unk_2A = mapApp->unk_0C8.unk_28 + 16;
        mapApp->unk_0C8.unk_2E = mapApp->unk_0C8.unk_2C + 23;
    }
}

void ov101_021E933C(PokegearMapAppData *mapApp) {
    MI_CpuClear8(&mapApp->sessionState, sizeof(mapApp->sessionState));
    mapApp->sessionState.word = EC_WORD_NULL;
    mapApp->sessionState.unk_00 = 1;
    mapApp->sessionState.unk_01 = mapApp->zoomed;
    mapApp->sessionState.playerX = mapApp->cursorX;
    mapApp->sessionState.playerY = mapApp->cursorY;
    mapApp->sessionState.cursorX = mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].pos.x;
    mapApp->sessionState.cursorY = mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].pos.y;
    mapApp->sessionState.unk_14 = mapApp->unk_0C8.unk_00;
    mapApp->sessionState.unk_16 = mapApp->unk_0C8.unk_04;
    mapApp->sessionState.unk_10 = mapApp->unk_0C8.unk_10;
    mapApp->sessionState.unk_12 = mapApp->unk_0C8.unk_14;
    mapApp->sessionState.unk_04 = mapApp->unk_0C8.unk_28;
    mapApp->sessionState.unk_05 = mapApp->unk_0C8.unk_2A;
    mapApp->sessionState.unk_06 = mapApp->unk_0C8.unk_2C;
    mapApp->sessionState.unk_07 = mapApp->unk_0C8.unk_2E;
}

void ov101_021E93D0(PokegearMapAppData *mapApp) {
    mapApp->cursorX = mapApp->sessionState.playerX;
    mapApp->cursorY = mapApp->sessionState.playerY;
    mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].pos.x = mapApp->sessionState.cursorX;
    mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].pos.y = mapApp->sessionState.cursorY;
    mapApp->unk_0C8.unk_00 = mapApp->sessionState.unk_14;
    mapApp->unk_0C8.unk_04 = mapApp->sessionState.unk_16;
    mapApp->unk_0C8.unk_10 = mapApp->sessionState.unk_10;
    mapApp->unk_0C8.unk_14 = mapApp->sessionState.unk_12;
    mapApp->unk_0C8.unk_28 = mapApp->sessionState.unk_04;
    mapApp->unk_0C8.unk_2A = mapApp->sessionState.unk_05;
    mapApp->unk_0C8.unk_2C = mapApp->sessionState.unk_06;
    mapApp->unk_0C8.unk_2E = mapApp->sessionState.unk_07;
    MI_CpuClear8(&mapApp->sessionState, sizeof(mapApp->sessionState));
    mapApp->sessionState.word = EC_WORD_NULL;
    mapApp->sessionState.unk_00 = 0;
}

void ov101_021E9464(PokegearMapAppData *mapApp, s16 xIn, s16 yIn, u16 *xOut, u16 *yOut) {
    s16 x;
    s16 y;

    x = xIn - mapApp->unk_132;
    y = yIn - mapApp->unk_131;

    if (mapApp->zoomed) {
        *xOut = x / 16;
        *yOut = y / 16;
    } else {
        *xOut = x / 8;
        *yOut = y / 8;
    }
}

void ov101_021E94C0(PokegearMapAppData *mapApp) {
    // this might give me brain damage
    // scratch: https://decomp.me/scratch/tbMr8
    s16 r5;
    s16 r4;
    u8 r1;

    r1 = mapApp->zoomed + 1;

    r5 = mapApp->cursorX - mapApp->unk_0C8.unk_2C;
    r4 = mapApp->cursorY - mapApp->unk_0C8.unk_28;

    r5 = r5 * (8 * r1) + mapApp->unk_132 + 4 * r1;
    r4 = r4 * (8 * r1) + mapApp->unk_131 + 4 * r1;

    PokegearManagedObject_SetCoordUpdateSprite(&mapApp->objManager->objects[PGMAP_SPRITE_CURSOR], r5, r4);
}

void ov101_021E9530(PokegearMapAppData *mapApp, u8 a1, u16 a2, u16 a3, s16 a4, s16 a5) {
    u16 sp16;
    u16 sp14;
    s16 r2;
    s16 ip;
    s16 r0;
    s16 r1;
    s16 sp08;
    s16 r6;
    s16 r3;
    s16 r5;
    u8 sp4;

    if (a1) {
        sp4 = 0x10;
        ov101_021E9464(mapApp, a4, a5, &sp16, &sp14);
        r2 = 5 - sp16;
        ip = 4 - sp14;
        sp08 = a3 - sp14 - ip;
        r6 = a3 + (7 - sp14) - ip;
        r3 = a2 - sp16 - r2;
        r5 = a2 + (11 - sp16) - r2;
    } else {
        sp4 = 0x8;
        sp16 = a2 - (mapApp->unk_0C8.unk_00 / 8 + 1);
        sp14 = a3 - (mapApp->unk_0C8.unk_04 / 8 + 1);
        r2 = 11 - sp16;
        ip = 8 - sp14;
        sp08 = a3 - sp14 - ip;
        r6 = a3 + (16 - sp14) - ip;
        r3 = a2 - sp16 - r2;
        r5 = a2 + (23 - sp16) - r2;
    }
    if (sp08 < mapApp->minYscroll) {
        r1 = sp08 - mapApp->minYscroll;
        ip += r1;
        sp08 -= r1;
        r6 -= r1;
    } else if (r6 > mapApp->maxYscroll) {
        r1 = r6 - mapApp->maxYscroll;
        ip += r1;
        r6 -= r1;
        sp08 -= r1;
    }
    if (r3 < mapApp->minXscroll) {
        r0 = r3 - mapApp->minXscroll;
        r2 += r0;
        r3 -= r0;
        r5 -= r0;
    } else if (r5 > mapApp->maxXscroll) {
        r0 = r5 - mapApp->maxXscroll;
        r2 += r0;
        r5 -= r0;
        r3 -= r0;
    }
    mapApp->unk_0C8.unk_28 = sp08;
    mapApp->unk_0C8.unk_2A = r6;
    mapApp->unk_0C8.unk_2C = r3;
    mapApp->unk_0C8.unk_2E = r5;
    mapApp->unk_0C8.unk_30 = -(r2 * sp4);
    mapApp->unk_0C8.unk_32 = -(ip * sp4);
    mapApp->unk_0C8.unk_34 = mapApp->unk_0C8.unk_00 + mapApp->unk_0C8.unk_30;
    mapApp->unk_0C8.unk_36 = mapApp->unk_0C8.unk_04 + mapApp->unk_0C8.unk_32;
    mapApp->unk_0C8.unk_20 = FX32_CONST(mapApp->unk_0C8.unk_00);
    mapApp->unk_0C8.unk_24 = FX32_CONST(mapApp->unk_0C8.unk_04);
    mapApp->unk_0C8.unk_18 = FX_Div(FX32_CONST(mapApp->unk_0C8.unk_30), FX32_CONST(mapApp->cursorSpeed));
    mapApp->unk_0C8.unk_1C = FX_Div(FX32_CONST(mapApp->unk_0C8.unk_32), FX32_CONST(mapApp->cursorSpeed));
}

void ov101_021E9848(PokegearMapAppData *mapApp, u16 a1, u16 a2, s16 a3, s16 a4, int *a5, int *a6) {
    u8 r2 = 0;
    u8 r1 = 0;
    if (!mapApp->zoomed) {
        r2 = (a3 - mapApp->unk_132) / 16;
        r1 = (a4 - mapApp->unk_131) / 16;
        if (r2 <= 5) {
            *a5 = a1 * 8 + 8;
        } else {
            *a5 = a1 * 8;
        }
        if (r1 > 4) {
            *a6 = a2 * 8 + 8;
        } else {
            *a6 = a2 * 8;
        }
    } else {
        r2 = ((a3 - mapApp->unk_132) / 8) % 2;
        r1 = ((a4 - mapApp->unk_131) / 8) % 2;
        *a5 = a1 * 8 + r2 * 8;
        *a6 = a2 * 8 + r1 * 8;
    }
}

void ov101_021E990C(PokegearMapAppData *mapApp) {
    s16 sp18;
    s16 sp14;
    u16 r7;
    u16 r6;
    u16 sp10;
    VecFx32 sp1C;
    PokegearManagedObject *objects = mapApp->objManager->objects;
    if (mapApp->zoomed) {
        r7 = 2;
        r6 = 16;
    } else {
        r7 = 1;
        r6 = 8;
    }
    mapApp->unk_0C8.unk_08 = FX32_CONST(r7);
    mapApp->unk_0C8.unk_0C = FX32_CONST(r7);
    sp10 = r6 / 2;
    if (mapApp->sessionState.unk_00) {
        ov101_021E93D0(mapApp);
    } else {
        ov101_021E9530(mapApp, 0, mapApp->cursorX, mapApp->cursorY, 0, 0);
        mapApp->unk_0C8.unk_00 = mapApp->unk_0C8.unk_34;
        mapApp->unk_0C8.unk_04 = mapApp->unk_0C8.unk_36;
        sp18 = (mapApp->cursorX - mapApp->unk_0C8.unk_2C) * 8 + mapApp->unk_132 + 4;
        sp14 = (mapApp->cursorY - mapApp->unk_0C8.unk_28) * 8 + mapApp->unk_131 + 4;
        if (mapApp->zoomed) {
            ov101_021E9530(mapApp, 1, mapApp->cursorX, mapApp->cursorY, sp18, sp14);
            ov101_021E9848(mapApp, mapApp->cursorX, mapApp->cursorY, sp18, sp14, &mapApp->unk_0C8.unk_10, &mapApp->unk_0C8.unk_14);
            mapApp->unk_0C8.unk_00 = mapApp->unk_0C8.unk_34;
            mapApp->unk_0C8.unk_04 = mapApp->unk_0C8.unk_36;
            sp18 = (mapApp->cursorX - mapApp->unk_0C8.unk_2C) * r6 + mapApp->unk_132 + sp10;
            sp14 = (mapApp->cursorY - mapApp->unk_0C8.unk_28) * r6 + mapApp->unk_131 + sp10;
        }
        PokegearManagedObject_SetCoord(&objects[PGMAP_SPRITE_CURSOR], sp18, sp14);
    }
    PokegearManagedObject_SetCoord2(&objects[PGMAP_SPRITE_CURSOR], mapApp->cursorX, mapApp->cursorY);
    sp1C.x = sp1C.y = FX32_CONST(r7);
    sp1C.z = FX32_ONE;
    Sprite_SetAffineScale(objects[PGMAP_SPRITE_CURSOR].sprite, &sp1C);
    sp18 = (mapApp->matrixX - mapApp->unk_0C8.unk_2C) * r6 + mapApp->unk_132 + sp10;
    sp14 = (mapApp->matrixY - mapApp->unk_0C8.unk_28) * r6 + mapApp->unk_131 + sp10;
    PokegearManagedObject_SetCoord(&objects[PGMAP_SPRITE_PLAYER], sp18, sp14);
    PokegearManagedObject_SetCoord2(&objects[PGMAP_SPRITE_PLAYER], mapApp->matrixX, mapApp->matrixY);
}

void ov101_021E9B70(PokegearMapAppData *mapApp, PokegearMapAppData_Sub0C8 *a1) {
    int i;
    MtxFx22 sp04;
    fx32 r5;
    fx32 r0;

    r5 = FX_Inv(a1->unk_08);
    r0 = FX_Inv(a1->unk_0C);

    sp04._00 = r5;
    sp04._01 = 0;
    sp04._10 = 0;
    sp04._11 = r0;

    for (i = 0; i < 2; ++i) {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, a1->unk_00 + mapApp->unk_134);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, a1->unk_04 + mapApp->unk_133);
        SetBgAffine(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, &sp04, a1->unk_10, a1->unk_14);
    }
    mapApp->unk_138_7 = FALSE;
}

void ov101_021E9BF4(PokegearMapAppData *mapApp, s16 dx, s16 dy) {
    u16 i;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    PokegearManagedObject_AddCoord(&objects[PGMAP_SPRITE_PLAYER], dx, dy);

    if (mapApp->unk_139_3) {
        PokegearManagedObject_AddCoord(&objects[PGMAP_SPRITE_CURSOR], dx, dy);
    }
    if (mapApp->unk_00D) {
        for (i = 0; i < 27; ++i) {
            PokegearManagedObject_AddCoord(&objects[15 + i], dx, dy);
        }
    } else {
        for (i = 0; i < 4; ++i) {
            PokegearManagedObject_AddCoord(&objects[7 + i], dx, dy);
        }
        for (i = 0; i < 100; ++i) {
            PokegearManagedObject_AddCoord(&objects[11 + i], dx, dy);
        }
    }
}

BOOL ov101_021E9CD4(PokegearMapAppData *mapApp, u8 direction) {
    if (mapApp->unk_135 > 16) {
        return TRUE;
    }
    if (direction == 0) {
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16 - mapApp->unk_135, RGB_BLACK);
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16 - mapApp->unk_135, RGB_BLACK);
    } else {
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, mapApp->unk_135, RGB_BLACK);
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, mapApp->unk_135, RGB_BLACK);
    }
    if (mapApp->unk_135 >= 16) {
        mapApp->unk_135 += 2;
        return TRUE;
    } else {
        mapApp->unk_135 += 2;
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
            PokegearManagedObject_SetCoord(&objects[i], (i % 2) * 0x68 + 0x20, (i / 2) * 0x15 + 0x14B);
        }
        PokegearManagedObject_SetCoord(&objects[4], 0x10, 0x118);
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
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_ADD_Y, 0x20);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_ADD_Y, 0x20);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_ADD_Y, 0x20);
        for (i = 0; i <= 4; ++i) {
            PokegearManagedObject_AddCoord(&objects[i], 0, -0x20);
        }
    } else {

        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SUB_Y, 0x20);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SUB_Y, 0x20);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SUB_Y, 0x20);
        for (i = 0; i <= 4; ++i) {
            PokegearManagedObject_AddCoord(&objects[i], 0, 0x20);
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
            BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1, BG_POS_OP_SET_Y, 0x70);
        }
        for (i = 20; i <= 27; ++i) {
            PokegearManagedObject_AddCoord(&objects[i], 0, -0x70);
        }
        PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
        for (i = 0; i < 4; ++i) {
            sub_020136B4(mapApp->unk_044[i].unk_0, 4, -6);
        }
    } else {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SUB_Y, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_Y, 0);
        Sprite_SetDrawFlag(mapApp->objManager->objects[11].sprite, FALSE);
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
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SUB_Y, 0x1C);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_Y, 0x1C);
        for (i = 20; i <= 27; ++i) {
            PokegearManagedObject_AddCoord(&objects[i], 0, 0x1C);
        }
    } else {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_ADD_Y, 0x1C);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_ADD_Y, 0x1C);
        for (i = 20; i <= 27; ++i) {
            PokegearManagedObject_AddCoord(&objects[i], 0, -0x1C);
        }
    }
    PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
    for (i = 0; i < 4; ++i) {
        sub_020136B4(mapApp->unk_044[i].unk_0, 4, -6);
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
        Sprite_SetDrawFlag(mapApp->objManager->objects[11].sprite, TRUE);
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_TOUCH) {
            PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 1, TRUE);
        }
    }
    return TRUE;
}

void ov101_021EA238(PokegearMapAppData *mapApp, u8 a1) {
    u16 i;
    u16 index;
    s16 x;
    s16 y;
    u8 grid;
    u8 halfGrid;
    u8 scale;
    const PokegearMapLocationSpec *r1;

    scale = mapApp->zoomed + 1;
    grid = scale * 8;
    halfGrid = grid / 2;

    for (i = 0; i < 100; ++i) {
        r1 = &mapApp->locationSpecs[i];
        x = (r1->x - mapApp->unk_0C8.unk_2C) * grid + mapApp->unk_132 + halfGrid + r1->objXoffset * scale;
        y = (r1->y - mapApp->unk_0C8.unk_28) * grid + mapApp->unk_131 + halfGrid + r1->objYoffset * scale;
        index = i + 11;

        switch (a1) {
        case 0:
            mapApp->objManager->objects[index].pos.x = x;
            mapApp->objManager->objects[index].pos.y = y;
            if (MapApp_GetMarkingsHeapNodeByMapID(mapApp, r1->mapId) != NULL) {
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
    for (i = 0; i < 4; ++i) {
        index = i + 7;
        if (mapApp->roamerLocations[i] == MAP_EVERYWHERE) {
            PokegearManagedObject_SetUnk01(&mapApp->objManager->objects[index], FALSE);
            Sprite_SetDrawFlag(mapApp->objManager->objects[index].sprite, FALSE);
            continue;
        }
        r1 = PokegearMap_GetLocationSpecByMapID(mapApp, mapApp->roamerLocations[i]);
        x = (r1->x - mapApp->unk_0C8.unk_2C) * grid + mapApp->unk_132 + halfGrid + r1->objXoffset * scale;
        y = (r1->y - mapApp->unk_0C8.unk_28) * grid + mapApp->unk_131 + halfGrid + r1->objYoffset * scale;
        switch (a1) {
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

void ov101_021EA4D0(PokegearMapAppData *mapApp, u8 a1) {
    u16 i;
    u16 objIndex;
    s16 x;
    s16 y;
    s16 halfWidth;
    s16 halfHeight;
    const MapFlypointParam *flypointParam;

    for (i = 0; i < 27; ++i) {
        flypointParam = &gMapFlypointParams[i];
        halfWidth = flypointParam->width * 4;
        halfHeight = flypointParam->height * 4;
        x = (flypointParam->x - mapApp->unk_0C8.unk_2C) * 8 + mapApp->unk_132 + halfWidth;
        y = ((flypointParam->y + 2) - mapApp->unk_0C8.unk_28) * 8 + mapApp->unk_131 + halfHeight;
        objIndex = i + 15;

        switch (a1) {
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

BOOL ov101_021EA664(PokegearMapAppData *mapApp, int mapID) {
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
            if (ov101_021EA664(mapApp, ret->mapId)) {
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
            if (ov101_021EA664(mapApp, locationSpec->mapId)) {
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
        a1->markingsNode = MapApp_GetMarkingsHeapNodeByMapID(mapApp, mapApp->selectedMap.locationSpec->mapId);
    }
    a1->x = x;
    a1->y = y;
}

BOOL ov101_021EA7E4(PokegearMapAppData *mapApp, u16 x, u16 y) {
    PokegearRegion region = Pokegear_Coords2Region(x, y);
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

int ov101_021EA81C(PokegearMapAppData *mapApp, u16 x, u16 y) {
    int i;
    const MapFlypointParam *rflypoint;

    for (i = 0; i < 27; ++i) {
        rflypoint = &gMapFlypointParams[i];
        if (x < rflypoint->x || x >= rflypoint->x + rflypoint->width || y < rflypoint->y || y >= rflypoint->y + rflypoint->height) {
            continue;
        }
        if (!Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, rflypoint->flypoint)) {
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
        if (mapApp->unk_00F >= 0) {
            Sprite_SetAnimCtrlSeq(mapApp->objManager->objects[15 + mapApp->unk_00F].sprite, 10);
            mapApp->unk_00F = -1;
        }
        return -1;
    }

    mapID = gMapFlypointParams[idx].mapIDforName;
    a1->x = x;
    a1->y = y;
    a1->locationSpec = PokegearMap_GetLocationSpecByMapID(mapApp, mapID);
    if (mapApp->unk_00F != idx) {
        if (mapApp->unk_00F >= 0) {
            Sprite_SetAnimCtrlSeq(mapApp->objManager->objects[15 + mapApp->unk_00F].sprite, 10);
            mapApp->unk_00F = -1;
        }
        if (ov101_021EA804(mapApp, mapID, x, y - 2)) {
            Sprite_SetAnimCtrlSeq(mapApp->objManager->objects[15 + idx].sprite, 11);
            mapApp->unk_00F = idx;
        }
    }
    a1->markingsNode = MapApp_GetMarkingsHeapNodeByMapID(mapApp, mapID);
    return mapID;
}

BOOL PokegearMap_MapHasPhoneRematchOrGift(PokegearMapAppData *mapApp, int mapID) {
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

void ov101_021EAA0C(PokegearMapAppData *mapApp, BOOL a1, BOOL isKanto) {
    u32 sp0;
    u32 i;
    u32 tilemap174blockId;
    u8 tilemap16CsrcX;
    PokegearMapAppData_Sub118 *sp30;
    const PokegearMapLocationSpec *sp2C;
    MapMarkingsHeapNode *markersHeap;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    sp30 = &mapApp->selectedMap;
    sp2C = sp30->locationSpec;
    markersHeap = sp30->markingsNode;

    String_SetEmpty(mapApp->mapNameString);
    for (i = 0; i < 3; ++i) {
        FillWindowPixelBuffer(&mapApp->windows[i], 0);
    }
    AddTextPrinterParameterizedWithColor(&mapApp->windows[0], 0, mapApp->regionNameStrings[isKanto], 2, 4, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    if (mapApp->unk_00D == 0) {
        if (!ov101_021EA6C4(mapApp, sp30)) {
            ov101_021EB38C(mapApp, 0, 2);
        } else {
            ov101_021EB38C(mapApp, 0, 0);
        }
    }
    if (sp2C != NULL) {
        PokegearMap_GetLandmarkNameFromMapID(sp2C->mapId, mapApp->heapId, mapApp->mapNameString);
        if (mapApp->unk_00D == 2) {
            sp0 = 1;
        } else {
            sp0 = 0;
        }
        AddTextPrinterParameterizedWithColor(&mapApp->windows[1], 0, mapApp->mapNameString, 0, sp0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        if (a1) {
            for (i = 0; i <= 1; ++i) {
                CopyWindowToVram(&mapApp->windows[i]);
            }
            CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 23, 11, 8, 7, mapApp->unk_16C->rawData, 0, 0, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
            ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1);
            ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2);
            return;
        }
        if (sp2C->tilemapUnk170BlockID != 0) {
            tilemap16CsrcX = 8;
            tilemap174blockId = sp2C->tilemapUnk170BlockID - 1;
        } else {
            tilemap16CsrcX = 0;
            tilemap174blockId = 0;
        }
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 23, 11, 8, 7, mapApp->unk_16C->rawData, tilemap16CsrcX, 0, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, 24, 11, 7, 7, mapApp->unk_174->rawData, (tilemap174blockId % 4) * 7, (tilemap174blockId / 4) * 7, mapApp->unk_174->screenWidth / 8, mapApp->unk_174->screenHeight / 8);
        String_SetEmpty(mapApp->flavorTextString);
        ReadMsgDataIntoString(mapApp->msgData, sp2C->flavorText, mapApp->flavorTextString);
        AddTextPrinterParameterizedWithColor(&mapApp->windows[2], 0, mapApp->flavorTextString, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        Sprite_SetDrawFlag(objects[4].sprite, PokegearMap_MapHasPhoneRematchOrGift(mapApp, sp2C->mapId));
    } else {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 23, 11, 8, 7, mapApp->unk_16C->rawData, 0, 0, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
        Sprite_SetDrawFlag(objects[4].sprite, FALSE);
    }
    if (markersHeap != NULL) {
        FillWindowPixelBuffer(&mapApp->windows[3], 0);
        FillWindowPixelBuffer(&mapApp->windows[4], 0);
        for (i = 0; i < 4; ++i) {
            if (markersHeap->mapMarkings.icons[i] != MAP_MARKING_ICON_NULL) {
                Sprite_SetDrawFlag(objects[i].sprite, TRUE);
                Sprite_SetAnimationFrame(objects[i].sprite, markersHeap->mapMarkings.icons[i]);
            } else {
                Sprite_SetDrawFlag(objects[i].sprite, FALSE);
            }
            if (markersHeap->mapMarkings.words[i] != EC_WORD_NULL) {
                BufferECWord(mapApp->msgFormat, 0, markersHeap->mapMarkings.words[i]);
                StringExpandPlaceholders(mapApp->msgFormat, mapApp->flavorTextString, mapApp->formatFlavorTextString);
                AddTextPrinterParameterizedWithColor(&mapApp->windows[(i % 2) + 3], 0, mapApp->flavorTextString, 4, (i / 2) * 21 + 2, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 4, 0), NULL);
            }
        }
    } else {
        for (i = 0; i < 4; ++i) {
            Sprite_SetDrawFlag(objects[i].sprite, FALSE);
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

void ov101_021EAD90(PokegearMapAppData *mapApp, int a1) {
    ov101_021EAA0C(mapApp, a1, (Pokegear_Coords2Region(mapApp->cursorX, mapApp->cursorY - 2) / 2) ^ TRUE);
}

void ov101_021EADC0(PokegearMapAppData *mapApp, u8 a1, u16 a2) {
    if (a2 == EC_WORD_NULL) {
        sub_020137C0(mapApp->unk_044[a1].unk_0, 0);
    } else {
        BufferECWord(mapApp->msgFormat, 0, a2);
        StringExpandPlaceholders(mapApp->msgFormat, mapApp->flavorTextString, mapApp->formatFlavorTextString);
        FillWindowPixelBufferText_AssumeTileSize32(&mapApp->windows[8], 0);
        AddTextPrinterParameterizedWithColor(&mapApp->windows[8], 0, mapApp->flavorTextString, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 4, 0), NULL);
        sub_020139D0(mapApp->unk_044[a1].unk_0, mapApp->unk_040, &mapApp->windows[8], mapApp->heapId);
        sub_020137C0(mapApp->unk_044[a1].unk_0, 1);
    }
}

void ov101_021EAE54(PokegearMapAppData *mapApp, int a1) {
    u32 i;
    const PokegearMapLocationSpec *r5;
    MapMarkingsHeapNode *markingsNode;
    PokegearMapAppData_Sub118 *r0;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    r0 = &mapApp->selectedMap;
    r5 = r0->locationSpec;
    markingsNode = r0->markingsNode;

    if (a1) {
        String_SetEmpty(mapApp->mapNameString);
        FillWindowPixelBuffer(&mapApp->windows[7], 0);
        PokegearMap_GetLandmarkNameFromMapID(r5->mapId, mapApp->heapId, mapApp->mapNameString);
        AddTextPrinterParameterizedWithColor(&mapApp->windows[7], 0, mapApp->mapNameString, 0, 5, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    }
    if (markingsNode == NULL) {
        for (i = 0; i < 4; ++i) {
            Sprite_SetDrawFlag(objects[i + 20].sprite, FALSE);
            ov101_021EADC0(mapApp, i, 0xFFFF);
        }
    } else {
        for (i = 0; i < 4; ++i) {
            if (markingsNode->mapMarkings.icons[i] == MAP_MARKING_ICON_NULL) {
                Sprite_SetDrawFlag(objects[i + 20].sprite, FALSE);
            } else {
                Sprite_SetAnimationFrame(objects[i + 20].sprite, markingsNode->mapMarkings.icons[i]);
                Sprite_SetDrawFlag(objects[i + 20].sprite, TRUE);
            }
            ov101_021EADC0(mapApp, i, markingsNode->mapMarkings.words[i]);
        }
    }
}

void ov101_021EAF40(PokegearMapAppData *mapApp) {
    int i;
    const MapFlypointParam *r4;

    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 47, 20, mapApp->unk_170->rawData, 0, 0, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);

    switch (mapApp->mapUnlockLevel) {
    case 0:
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 22, 0, 6, 20, mapApp->unk_170->rawData, 48, 0, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
        break;
    case 1:
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 29, 0, 3, 20, mapApp->unk_170->rawData, 54, 0, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
        break;
    }

    for (i = 0; i < 27; ++i) {
        r4 = &gMapFlypointParams[i];
        if (r4->mapIDforName == MAP_CIANWOOD) {
            continue;
        }
        if (r4->unk_05 == 0xFF) {
            continue;
        }
        if (mapApp->mapUnlockLevel < 2 && !Pokegear_Coords2Region(r4->x, r4->y)) {
            continue;
        }
        if (Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, r4->flypoint)) {
            continue;
        }
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, r4->x - r4->unk170DestX, r4->y - r4->unk170DestY + 2, r4->unk170DestWidth, r4->unk170DestHeight, mapApp->unk_170->rawData, r4->unk170SrcX, r4->unk170SrcY, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
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
    const PokegearMapLocationSpec *r0;

    if (mapApp->unk_00D == 1) {
        return;
    }

    if (a1 == 0 || mapApp->selectedMap.locationSpec == NULL) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
        ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
        mapApp->unk_152 = 0;
        return;
    }

    if (mapApp->selectedMap.locationSpec->mapId == mapApp->unk_152) {
        return;
    }
    mapApp->unk_152 = mapApp->selectedMap.locationSpec->mapId;
    BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);

    for (i = 0; i < mapApp->numLocationSpecs; ++i) {
        if (mapApp->selectedMap.locationSpec->mapId != mapApp->locationSpecs[i].mapId) {
            continue;
        }
        r0 = &mapApp->locationSpecs[i];
        if (r0->tilemapUnk170DestWidth * r0->tilemapUnk170DestHeight >= 9) {
            destX = r0->x - 1;
            destY = r0->y - 1;
        } else {
            destX = r0->x;
            destY = r0->y;
        }
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, destX, destY, r0->tilemapUnk170DestWidth, r0->tilemapUnk170DestHeight, mapApp->unk_170->rawData, r0->tilemapUnk170SrcX, r0->tilemapUnk170SrcY, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    }
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

void ov101_021EB2D8(PokegearMapAppData *mapApp) {
    Sprite_SetDrawFlag(mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].sprite, FALSE);
    mapApp->unk_139_3 = FALSE;
}

void ov101_021EB2FC(void *appData) {
    PokegearMapAppData *mapApp = appData;

    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0, FALSE);
    ov101_021E94C0(mapApp);
    Sprite_SetDrawFlag(mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].sprite, TRUE);
    ov101_021EB1E0(mapApp, 1);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GF_PLANE_TOGGLE_ON);
}

void ov101_021EB338(void *appData) {
    PokegearMapAppData *mapApp = appData;

    ov101_021E94C0(mapApp);
    Sprite_SetDrawFlag(mapApp->objManager->objects[PGMAP_SPRITE_CURSOR].sprite, TRUE);
    mapApp->unk_139_3 = FALSE;
}

void ov101_021EB364(void *appData) {
    PokegearMapAppData *mapApp = appData;

    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, FALSE);
}

void ov101_021EB378(void *appData) {
    PokegearMapAppData *mapApp = appData;

    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, TRUE);
}

void ov101_021EB38C(PokegearMapAppData *mapApp, int button, int state) {
    if (button == 0) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 26, 2, 6, 7, mapApp->unk_178->rawData, 6 * state, 21, mapApp->unk_178->screenWidth / 8, mapApp->unk_178->screenHeight / 8);
    } else {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 26, 11, 6, 9, mapApp->unk_178->rawData, 6 * state + 18, 21, mapApp->unk_178->screenWidth / 8, mapApp->unk_178->screenHeight / 8);
    }
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
}

void ov101_021EB428(PokegearMapAppData *mapApp, u32 a1) {
    TouchscreenListMenuHeader spC;

    MI_CpuClear8(&spC, sizeof(TouchscreenListMenuHeader));

    spC.template = ov101_021F7E80;
    spC.listMenuItems = mapApp->listMenuItems;
    spC.bgConfig = mapApp->pokegear->bgConfig;
    spC.numWindows = 2;
    if (a1 < 8 || a1 > 15) {
        mapApp->listMenu = TouchscreenListMenu_Create(mapApp->listMenuSpawner, &spC, mapApp->pokegear->menuInputState, 11, 4, 0, 0);
    } else {
        mapApp->listMenu = TouchscreenListMenu_Create(mapApp->listMenuSpawner, &spC, mapApp->pokegear->menuInputState, 3, 4, 0, 0);
    }
}

void ov101_021EB4C4(PokegearMapAppData *mapApp, int mapID) {
    FillWindowPixelBuffer(&mapApp->windows[7], 0);
    if (mapID < 0) {
        AddTextPrinterParameterizedWithColor(&mapApp->windows[7], 0, mapApp->chooseDestinationString, 8, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(3, 2, 0), NULL);
    } else {
        PokegearMap_GetLandmarkNameFromMapID(mapID, mapApp->heapId, mapApp->mapNameString);
        BufferString(mapApp->msgFormat, 0, mapApp->mapNameString, 0, 0, 2);
        StringExpandPlaceholders(mapApp->msgFormat, mapApp->flavorTextString, mapApp->flyToLocationString);
        AddTextPrinterParameterizedWithColor(&mapApp->windows[7], 0, mapApp->flavorTextString, 8, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(3, 2, 0), NULL);
    }
}

void PokegearMap_GetLandmarkNameFromMapID(u16 mapno, HeapID heapId, String *dest) {
    MapID_GetLandmarkName(mapno, heapId, dest);
}
