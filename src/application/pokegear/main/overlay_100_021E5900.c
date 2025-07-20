#include "global.h"

#include "application/pokegear/pokegear_internal.h"

#include "map_header.h"
#include "system.h"
#include "touch_hitbox_controller.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_020210A0.h"
#include "unk_0208805C.h"

static void ov100_021E5A88(PokegearAppData *pokegearApp);
static BOOL ov100_021E5B4C(PokegearAppData *pokegearApp, u8 selection, u8 a2);
static void ov100_021E5FFC(PokegearAppData *pokegearApp);
static void ov100_021E6094(PokegearAppData *pokegearApp);
static void ov100_021E60C4(PokegearAppData *pokegearApp);
static void ov100_021E6134(PokegearAppData *pokegearApp);
static void ov100_021E616C(PokegearAppData *pokegearApp);
static void ov100_021E6338(PokegearAppData *pokegearApp);
static void Pokegear_AddAppSwitchButtons(PokegearAppData *pokegearApp);
static void Pokegear_RemoveAppSwitchButtons(PokegearAppData *pokegearApp);

static const TouchscreenHitbox sTouchscreenButtonHitboxes[] = {
    { .rect = { 0xA0, 0xC0, 0x08, 0x38 } },
    { .rect = { 0xA0, 0xC0, 0x38, 0x68 } },
    { .rect = { 0xA0, 0xC0, 0x68, 0x98 } },
    { .rect = { 0xA0, 0xC0, 0x98, 0xC8 } },
    { .rect = { 0xA0, 0xC0, 0xCE, 0xFE } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

static const u8 ov100_021E74B4[][4] = {
    { 0x00, 0xFF, 0xFF, 0x01 },
    { 0x00, 0xFF, 0x01, 0x02 },
    { 0x00, 0x01, 0xFF, 0x02 },
    { 0x00, 0x01, 0x02, 0x03 },
};

BOOL PokegearApp_HandleInputModeChangeToButtons(PokegearAppData *pokegearApp) {
    pokegearApp->menuInputStateBak = pokegearApp->menuInputState;
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_RIGHT | PAD_KEY_LEFT | PAD_KEY_UP | PAD_KEY_DOWN | PAD_BUTTON_X | PAD_BUTTON_Y)) {
        pokegearApp->menuInputState = MENU_INPUT_STATE_BUTTONS;
        return TRUE;
    } else {
        return FALSE;
    }
}

int PokegearApp_HandleTouchInput_SwitchApps(PokegearAppData *pokegearApp) {
    // Don't switch if didn't tap an app button
    int newApp = TouchscreenHitbox_FindRectAtTouchNew(sTouchscreenButtonHitboxes);
    if (newApp == TOUCH_MENU_NO_INPUT) {
        return GEAR_APP_NO_INPUT;
    }

    // Don't switch if the button is blanked out
    u16 val = 0;
    if (DoesPixelAtScreenXYMatchPtrVal(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0, gSystem.touchX, gSystem.touchY, &val) == 1) {
        return GEAR_APP_NO_INPUT;
    }

    // Don't switch from an app to itself
    if (newApp == pokegearApp->app) {
        return GEAR_APP_NO_INPUT;
    }

    // Don't switch if the card isn't unlocked
    if ((newApp == GEAR_APP_RADIO && !(pokegearApp->registeredCards & GEARCARD_RADIO)) || (newApp == GEAR_APP_MAP && !(pokegearApp->registeredCards & GEARCARD_MAP))) {
        return GEAR_APP_NO_INPUT;
    }
    ov100_021E5B4C(pokegearApp, newApp, 1);
    PlaySE(newApp != GEAR_APP_CANCEL ? SEQ_SE_GS_GEARAPPLICHANGE : SEQ_SE_GS_GEARCANCEL);
    pokegearApp->cursorInAppSwitchZone = 0;
    pokegearApp->menuInputState = MENU_INPUT_STATE_TOUCH;
    return newApp;
}

int PokegearApp_HandleKeyInput_SwitchApps(PokegearAppData *pokegearApp) {
    if (gSystem.newKeys & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return GEAR_APP_CANCEL;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        PokegearAppSwitchButtonSpec *buttonSpec = &pokegearApp->appSwitch->lastButton->buttonSpec[pokegearApp->appSwitch->lastButton->cursorPos];
        PokegearAppSwitchCursor_SetCursorSpritesDrawState(pokegearApp->appSwitch, 0, FALSE);
        pokegearApp->cursorInAppSwitchZone = 0;
        PlaySE(buttonSpec->appId != GEAR_APP_CANCEL ? SEQ_SE_GS_GEARAPPLICHANGE : SEQ_SE_GS_GEARCANCEL);
        if (buttonSpec->appId == pokegearApp->app) {
            if (pokegearApp->reselectAppCB != NULL) {
                pokegearApp->reselectAppCB(pokegearApp->childAppdata);
            }
            return GEAR_APP_NO_INPUT;
        }
        ov100_021E5B4C(pokegearApp, buttonSpec->appId, 1);
        return buttonSpec->appId;
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(pokegearApp->appSwitch, 0);
        return GEAR_APP_NO_INPUT;
    }
    if (gSystem.newKeys & PAD_KEY_RIGHT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(pokegearApp->appSwitch, 1);
        return GEAR_APP_NO_INPUT;
    }
    return GEAR_APP_NO_INPUT;
}

static void ov100_021E5A88(PokegearAppData *pokegearApp) {
    u8 registeredCards = pokegearApp->registeredCards;
    CopyToBgTilemapRect(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0, 0, 20, 32, 4, pokegearApp->unk_0C8->rawData, 0, 0, pokegearApp->unk_0C8->screenWidth / 8, pokegearApp->unk_0C8->screenHeight / 8);
    if (!(registeredCards & GEARCARD_MAP)) {
        CopyToBgTilemapRect(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0, 13, 20, 6, 4, pokegearApp->unk_0C8->rawData, 0, 8, pokegearApp->unk_0C8->screenWidth / 8, pokegearApp->unk_0C8->screenHeight / 8);
    }
    if (!(registeredCards & GEARCARD_RADIO)) {
        CopyToBgTilemapRect(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0, 7, 20, 6, 4, pokegearApp->unk_0C8->rawData, 0, 8, pokegearApp->unk_0C8->screenWidth / 8, pokegearApp->unk_0C8->screenHeight / 8);
    }
    ScheduleBgTilemapBufferTransfer(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0);
}

static BOOL ov100_021E5B4C(PokegearAppData *pokegearApp, u8 selection, u8 a2) {
    u8 destX;
    ov100_021E5A88(pokegearApp);
    if (selection == GEAR_APP_CANCEL) {
        destX = 26;
    } else {
        destX = selection * 6 + 1;
    }
    CopyToBgTilemapRect(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0, destX, 20, 6, 4, pokegearApp->unk_0C8->rawData, destX, a2 * 4, pokegearApp->unk_0C8->screenWidth / 8, pokegearApp->unk_0C8->screenHeight / 8);
    ScheduleBgTilemapBufferTransfer(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0);
    return FALSE;
}

BOOL ov100_021E5BB0(PokegearAppData *pokegearApp, BOOL a1) {
    RTCDate date;
    RTCTime time;
    u8 sp0[4];

    GF_RTC_CopyDateTime(&date, &time);
    if (a1 == 0 && pokegearApp->unk_080.second == time.second) {
        return FALSE;
    }

    sp0[0] = time.hour / 10;
    sp0[1] = time.hour % 10;
    sp0[2] = time.minute / 10;
    sp0[3] = time.minute % 10;
    for (u8 i = 0; i < 4; i++) {
        ManagedSprite_SetAnimationFrame(pokegearApp->unk_098[i + 5].managed, sp0[i]);
    }
    ManagedSprite_SetAnimationFrame(pokegearApp->unk_098[4].managed, date.week);
    pokegearApp->unk_080 = time;
    pokegearApp->unk_007 = 0;
    return TRUE;
}

int ov100_021E5C50(u16 x, u16 y) {
    if (x > 21) {
        if (x == 25 && y == 8) {
            return 2;
        } else if ((x == 28 && y == 6) || (x == 28 && y > 8 && y < 13)) {
            return 1;
        } else {
            return 0;
        }
    }

    return 2;
}

int ov100_021E5C80(PokegearAppData *pokegearApp) {
    return ov100_021E5C50(pokegearApp->args->x / 32, pokegearApp->args->y / 32);
}

void Pokegear_ClearAppBgLayers(PokegearAppData *pokegearApp) {
    BG_LoadBlankPltt(GF_BG_LYR_MAIN_3, 0x1C0, 0, pokegearApp->heapId);
    BG_LoadBlankPltt(GF_BG_LYR_SUB_3, 0x180, 0, pokegearApp->heapId);
    for (int i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(pokegearApp->bgConfig, i + 1);
        BG_ClearCharDataRange(i + 1, 0x40, 0, pokegearApp->heapId);
        BgCommitTilemapBufferToVram(pokegearApp->bgConfig, i + 1);
        FreeBgTilemapBuffer(pokegearApp->bgConfig, i + 1);
        BgClearTilemapBufferAndCommit(pokegearApp->bgConfig, i + 5);
        BG_ClearCharDataRange(i + 5, 0x40, 0, pokegearApp->heapId);
        BgCommitTilemapBufferToVram(pokegearApp->bgConfig, i + 5);
        FreeBgTilemapBuffer(pokegearApp->bgConfig, i + 5);
    }
}

BOOL Pokegear_RunFadeLayers123(PokegearAppData *pokegearApp, int direction) {
    if (pokegearApp->fadeCounter > 16) {
        return TRUE;
    }
    if (direction == 0) {
        PaletteData_BlendPalette(pokegearApp->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16 - pokegearApp->fadeCounter, RGB_BLACK);
        PaletteData_BlendPalette(pokegearApp->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16 - pokegearApp->fadeCounter, RGB_BLACK);
    } else {
        PaletteData_BlendPalette(pokegearApp->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, pokegearApp->fadeCounter, RGB_BLACK);
        PaletteData_BlendPalette(pokegearApp->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, pokegearApp->fadeCounter, RGB_BLACK);
    }
    if (pokegearApp->fadeCounter >= 16) {
        pokegearApp->fadeCounter += 2;
        return TRUE;
    } else {
        pokegearApp->fadeCounter += 2;
        return FALSE;
    }
}

u8 ov100_021E5DC8(PokegearAppData *pokegearApp) {
    return ov100_021E74B4[pokegearApp->registeredCards][pokegearApp->app];
}

BOOL ov100_021E5DDC(PokegearAppData *pokegearApp) {
    switch (pokegearApp->unk_018) {
    case 0:
        Main_SetVBlankIntrCB(NULL, NULL);
        HBlankInterruptDisable();
        GfGfx_DisableEngineAPlanes();
        GfGfx_DisableEngineBPlanes();
        GX_SetVisiblePlane(0);
        GXS_SetVisiblePlane(0);
        sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
        sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);
        sub_0200FBDC(PM_LCD_TOP);
        sub_0200FBDC(PM_LCD_BOTTOM);
        sub_020210BC();
        sub_02021148(2);
        break;
    case 1:
        ov100_021E5FFC(pokegearApp);
        ov100_021E60C4(pokegearApp);
        break;
    case 2:
        ov100_021E616C(pokegearApp);
        Pokegear_AddAppSwitchButtons(pokegearApp);
        break;
    case 3:
        Main_SetVBlankIntrCB(PokegearApp_VBlankCB, pokegearApp);
        pokegearApp->unk_018 = 0;
        return TRUE;
    }
    ++pokegearApp->unk_018;
    return FALSE;
}

BOOL ov100_021E5E88(PokegearAppData *pokegearApp) {
    sub_02021238();
    Main_SetVBlankIntrCB(NULL, pokegearApp);
    Pokegear_RemoveAppSwitchButtons(pokegearApp);
    ov100_021E6338(pokegearApp);
    ov100_021E6134(pokegearApp);
    ov100_021E6094(pokegearApp);
    return TRUE;
}

void ov100_021E5EB4(PokegearAppData *pokegearApp, int a1) {
    NARC *narc = NARC_New(NARC_a_1_4_3, pokegearApp->heapId);
    sub_0208820C(pokegearApp->bgConfig, pokegearApp->heapId, narc, NARC_a_1_4_3, a1 + 48, GF_BG_LYR_MAIN_0, 0, 0, 0);
    sub_0208820C(pokegearApp->bgConfig, pokegearApp->heapId, narc, NARC_a_1_4_3, a1 + 36, GF_BG_LYR_SUB_0, 0, 0, 0);
    PaletteData_LoadFromOpenNarc(pokegearApp->plttData, narc, a1 + 30, pokegearApp->heapId, PLTTBUF_MAIN_BG, 0x40, 0xE0, 0xE0);
    PaletteData_LoadFromOpenNarc(pokegearApp->plttData, narc, a1 + 24, pokegearApp->heapId, PLTTBUF_SUB_BG, 0x80, 0xC0, 0xC0);
    PaletteData_LoadFromOpenNarc(pokegearApp->plttData, narc, a1, pokegearApp->heapId, PLTTBUF_MAIN_OBJ, 0x80, 0, 0);
    PaletteData_LoadFromOpenNarc(pokegearApp->plttData, narc, a1, pokegearApp->heapId, PLTTBUF_SUB_OBJ, 0x80, 0, 0);

    NARC_ReadWholeMember(narc, a1 + 54, pokegearApp->unk_0C4);
    NNS_G2dGetUnpackedScreenData(pokegearApp->unk_0C4, &pokegearApp->unk_0C8);
    if (pokegearApp->app == GEAR_APP_CANCEL) {
        ov100_021E5B4C(pokegearApp, 2, 1);
    } else {
        ov100_021E5B4C(pokegearApp, pokegearApp->app, 1);
    }
    sub_0208820C(pokegearApp->bgConfig, pokegearApp->heapId, narc, NARC_a_1_4_3, a1 + 42, GF_BG_LYR_SUB_0, 1, 0, 0);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokegearApp->bgConfig, GF_BG_LYR_SUB_0);
}

void ov100_021E5FDC(void) {
    GraphicsBanks sp0 = {
        .bg = GX_VRAM_BG_128_A,
        .bgextpltt = GX_VRAM_BGEXTPLTT_NONE,
        .subbg = GX_VRAM_SUB_BG_128_C,
        .subbgextpltt = GX_VRAM_SUB_BGEXTPLTT_NONE,
        .obj = GX_VRAM_OBJ_64_E,
        .objextpltt = GX_VRAM_OBJEXTPLTT_NONE,
        .subobj = GX_VRAM_SUB_OBJ_16_I,
        .subobjextpltt = GX_VRAM_SUB_OBJEXTPLTT_NONE,
        .tex = GX_VRAM_TEX_NONE,
        .texpltt = GX_VRAM_TEXPLTT_NONE,
    };
    GfGfx_SetBanks(&sp0);
}

static void ov100_021E5FFC(PokegearAppData *pokegearApp) {
    ov100_021E5FDC();
    pokegearApp->bgConfig = BgConfig_Alloc(pokegearApp->heapId);
    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);
    {
        GraphicsModes modes = {
            GX_DISPMODE_GRAPHICS,
            GX_BGMODE_0,
            GX_BGMODE_0,
            GX_BG0_AS_2D,
        };
        SetBothScreensModesAndDisable(&modes);
    }

    {
        BgTemplate bgTemplates[2] = {
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xf800,
             .charBase = GX_BG_CHARBASE_0x08000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 0,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0,
             .mosaic = FALSE,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xf800,
             .charBase = GX_BG_CHARBASE_0x08000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 3,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0,
             .mosaic = FALSE,
             },
        };
        for (int i = 0; i < 2; ++i) {
            InitBgFromTemplate(pokegearApp->bgConfig, i * 4, &bgTemplates[i], GF_BG_TYPE_TEXT);
            BgClearTilemapBufferAndCommit(pokegearApp->bgConfig, i * 4);
            BG_ClearCharDataRange(i * 4, 0x20, 0, pokegearApp->heapId);
        }
    }

    ToggleBgLayer(GF_BG_LYR_MAIN_0, FALSE);
    ToggleBgLayer(GF_BG_LYR_SUB_0, FALSE);
}

static void ov100_021E6094(PokegearAppData *pokegearApp) {
    FreeBgTilemapBuffer(pokegearApp->bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0);
    Heap_Free(pokegearApp->bgConfig);
    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);
}

static void ov100_021E60C4(PokegearAppData *pokegearApp) {
    NARC *narc = NARC_New(NARC_a_1_4_3, pokegearApp->heapId);
    pokegearApp->plttData = PaletteData_Init(pokegearApp->heapId);
    PaletteData_AllocBuffers(pokegearApp->plttData, PLTTBUF_MAIN_BG, 0x200, pokegearApp->heapId);
    PaletteData_AllocBuffers(pokegearApp->plttData, PLTTBUF_MAIN_OBJ, 0x200, pokegearApp->heapId);
    PaletteData_AllocBuffers(pokegearApp->plttData, PLTTBUF_SUB_BG, 0x200, pokegearApp->heapId);
    PaletteData_AllocBuffers(pokegearApp->plttData, PLTTBUF_SUB_OBJ, 0x200, pokegearApp->heapId);
    pokegearApp->unk_0C4 = AllocFromHeap(pokegearApp->heapId, GetNarcMemberSizeByIdPair(NARC_a_1_4_3, 54));
    ov100_021E5EB4(pokegearApp, pokegearApp->unk_008);
    NARC_Delete(narc); // was never actually used
}

static void ov100_021E6134(PokegearAppData *pokegearApp) {
    Heap_Free(pokegearApp->unk_0C4);
    PaletteData_FreeBuffers(pokegearApp->plttData, PLTTBUF_SUB_OBJ);
    PaletteData_FreeBuffers(pokegearApp->plttData, PLTTBUF_SUB_BG);
    PaletteData_FreeBuffers(pokegearApp->plttData, PLTTBUF_MAIN_OBJ);
    PaletteData_FreeBuffers(pokegearApp->plttData, PLTTBUF_MAIN_BG);
    PaletteData_Free(pokegearApp->plttData);
    pokegearApp->plttData = NULL;
}

static void ov100_021E616C(PokegearAppData *pokegearApp) {
    ov100_021E6914(pokegearApp);
    pokegearApp->unk_094 = ov100_021E69F8(pokegearApp->heapId, 11, 1, pokegearApp->unk_008, 3, 2);
    for (int i = 0; i < 4; ++i) {
        pokegearApp->unk_098[i].managed = ov100_021E6AC0(pokegearApp->unk_094, 0x40, 0x40, 0, 0, 0, i, i + 4, 0);
    }
    pokegearApp->unk_098[4].managed = ov100_021E6AC0(pokegearApp->unk_094, 0xAD, 0x30, 0, 0, 0, 4, 2, 1);
    pokegearApp->unk_098[5].managed = ov100_021E6AC0(pokegearApp->unk_094, 0x46, 0x2E, 0, 0, 0, 5, 0, 1);
    pokegearApp->unk_098[6].managed = ov100_021E6AC0(pokegearApp->unk_094, 0x56, 0x2E, 0, 0, 0, 6, 0, 1);
    pokegearApp->unk_098[7].managed = ov100_021E6AC0(pokegearApp->unk_094, 0x6E, 0x2E, 0, 0, 0, 7, 0, 1);
    pokegearApp->unk_098[8].managed = ov100_021E6AC0(pokegearApp->unk_094, 0x7E, 0x2E, 0, 0, 0, 8, 0, 1);
    pokegearApp->unk_098[9].managed = ov100_021E6AC0(pokegearApp->unk_094, 0x62, 0x2E, 0, 0, 0, 9, 1, 1);
    pokegearApp->unk_098[10].managed = ov100_021E6AC0(pokegearApp->unk_094, 0xC5, 0x30, 0, 0, 0, 10, 3, 1);
    ov100_021E5BB0(pokegearApp, TRUE);

    ManagedSprite_SetAnimateFlag(pokegearApp->unk_098[9].managed, TRUE);
    if (!MapHeader_CanPlacePhoneCalls(pokegearApp->args->mapID)) {
        ManagedSprite_SetAnimationFrame(pokegearApp->unk_098[10].managed, 1);
    }

    for (int i = 0; i <= 3; ++i) {
        ManagedSprite_SetDrawFlag(pokegearApp->unk_098[i].managed, FALSE);
        ManagedSprite_SetAnimateFlag(pokegearApp->unk_098[i].managed, TRUE);
    }

    for (int i = 4; i < 11; ++i) {
        ManagedSprite_SetDrawFlag(pokegearApp->unk_098[i].managed, TRUE);
    }
}

static void ov100_021E6338(PokegearAppData *pokegearApp) {
    for (int i = 0; i < 11; ++i) {
        ManagedSprite_SetDrawFlag(pokegearApp->unk_098[i].managed, FALSE);
        ov100_021E6C44(pokegearApp->unk_098[i].managed);
    }
    ov100_021E6A3C(pokegearApp->unk_094);
    ov100_021E6950(pokegearApp);
}

static void Pokegear_AddAppSwitchButtons(PokegearAppData *pokegearApp) {
    // This data has to be scoped to the function in order to match
    static const PokegearAppSwitchButtonSpec sAppButtonSpec_NoCards[] = {
        {
         GEAR_APP_CONFIGURE,
         0x02,
         0x01,
         0xFF,
         0xFF,
         0x20,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
        {
         GEAR_APP_PHONE,
         0x00,
         0x02,
         0xFF,
         0xFF,
         0xB0,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
        {
         GEAR_APP_CANCEL,
         0x01,
         0x00,
         0xFF,
         0xFF,
         0xE6,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
    };

    static const PokegearAppSwitchButtonSpec sAppButtonSpec_MapOnly[] = {
        {
         GEAR_APP_CONFIGURE,
         0x03,
         0x01,
         0xFF,
         0xFF,
         0x20,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
        {
         GEAR_APP_MAP,
         0x00,
         0x02,
         0xFF,
         0xFF,
         0x80,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
        {
         GEAR_APP_PHONE,
         0x01,
         0x03,
         0xFF,
         0xFF,
         0xB0,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
        {
         GEAR_APP_CANCEL,
         0x02,
         0x00,
         0xFF,
         0xFF,
         0xE6,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
    };

    static const PokegearAppSwitchButtonSpec sAppButtonSpec_RadioOnly[] = {
        {
         GEAR_APP_CONFIGURE,
         0x03,
         0x01,
         0xFF,
         0xFF,
         0x20,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
        {
         GEAR_APP_RADIO,
         0x00,
         0x02,
         0xFF,
         0xFF,
         0x50,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
        {
         GEAR_APP_PHONE,
         0x01,
         0x03,
         0xFF,
         0xFF,
         0xB0,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
        {
         GEAR_APP_CANCEL,
         0x02,
         0x00,
         0xFF,
         0xFF,
         0xE6,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
    };

    static const PokegearAppSwitchButtonSpec sAppButtonSpec_BothCards[] = {
        {
         GEAR_APP_CONFIGURE,
         0x04,
         0x01,
         0xFF,
         0xFF,
         0x20,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
        {
         GEAR_APP_RADIO,
         0x00,
         0x02,
         0xFF,
         0xFF,
         0x50,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
        {
         GEAR_APP_MAP,
         0x01,
         0x03,
         0xFF,
         0xFF,
         0x80,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
        {
         GEAR_APP_PHONE,
         0x02,
         0x04,
         0xFF,
         0xFF,
         0xB0,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
        {
         GEAR_APP_CANCEL,
         0x03,
         0x00,
         0xFF,
         0xFF,
         0xE6,
         0xB0,
         -0x10,
         0x10,
         -0x0A,
         0x0A,
         },
    };

    static const PokegearAppSwitchButtonSpec *sAppSwitchButtonSpecs[] = {
        sAppButtonSpec_NoCards,
        sAppButtonSpec_MapOnly,
        sAppButtonSpec_RadioOnly,
        sAppButtonSpec_BothCards,
    };

    static const u8 sAppSwitchButtonCounts[] = {
        NELEMS(sAppButtonSpec_NoCards),
        NELEMS(sAppButtonSpec_MapOnly),
        NELEMS(sAppButtonSpec_RadioOnly),
        NELEMS(sAppButtonSpec_BothCards),
    };

    pokegearApp->appSwitch = PokegearAppSwitch_Alloc(4, pokegearApp->heapId);
    PokegearAppSwitch_AddButtons(pokegearApp->appSwitch, sAppSwitchButtonSpecs[pokegearApp->registeredCards], sAppSwitchButtonCounts[pokegearApp->registeredCards], 0, TRUE, pokegearApp->heapId, pokegearApp->unk_098[0], pokegearApp->unk_098[1], pokegearApp->unk_098[2], pokegearApp->unk_098[3]);
    if (pokegearApp->app == GEAR_APP_CANCEL) {
        PokegearAppSwitch_SetSpecIndexAndCursorPos(pokegearApp->appSwitch, 0, 2);
    } else {
        PokegearAppSwitch_SetSpecIndexAndCursorPos(pokegearApp->appSwitch, 0, ov100_021E5DC8(pokegearApp));
    }
}

static void Pokegear_RemoveAppSwitchButtons(PokegearAppData *pokegearApp) {
    PokegearAppSwitch_RemoveButtons(pokegearApp->appSwitch, 0);
    PokegearAppSwitch_Free(pokegearApp->appSwitch);
}
