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
static void ov100_021E6374(PokegearAppData *pokegearApp);
static void ov100_021E63F4(PokegearAppData *pokegearApp);

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

BOOL ov100_021E5900(PokegearAppData *pokegearApp) {
    pokegearApp->unk_010 = pokegearApp->unk_00C;
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_RIGHT | PAD_KEY_LEFT | PAD_KEY_UP | PAD_KEY_DOWN | PAD_BUTTON_X | PAD_BUTTON_Y)) {
        pokegearApp->unk_00C = MENU_INPUT_STATE_BUTTONS;
        return TRUE;
    } else {
        return FALSE;
    }
}

int PokegearApp_HandleTouchInput_SwitchApps(PokegearAppData *pokegearApp) {
    // Don't switch if didn't tap an app button
    int newApp = TouchscreenHitbox_FindRectAtTouchNew(sTouchscreenButtonHitboxes);
    if (newApp == -1) {
        return -1;
    }

    // Don't switch if the button is blanked out
    u16 val = 0;
    if (DoesPixelAtScreenXYMatchPtrVal(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0, gSystem.touchX, gSystem.touchY, &val) == 1) {
        return -1;
    }

    // Don't switch from an app to itself
    if (newApp == pokegearApp->app) {
        return -1;
    }

    // Don't switch if the card isn't unlocked
    if ((newApp == GEAR_APP_RADIO && !(pokegearApp->registeredCards & 2)) || (newApp == GEAR_APP_MAP && !(pokegearApp->registeredCards & 1))) {
        return -1;
    }
    ov100_021E5B4C(pokegearApp, newApp, 1);
    PlaySE(newApp != GEAR_APP_CANCEL ? SEQ_SE_GS_GEARAPPLICHANGE : SEQ_SE_GS_GEARCANCEL);
    pokegearApp->unk_006 = 0;
    pokegearApp->unk_00C = MENU_INPUT_STATE_TOUCH;
    return newApp;
}

int PokegearApp_HandleKeyInput_SwitchApps(PokegearAppData *pokegearApp) {
    if (gSystem.newKeys & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return GEAR_APP_CANCEL;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        PokegearApp_UnkSub07C_Sub4_Sub4 *r4 = &pokegearApp->appSwitchCursor->unk_08->unk_04[pokegearApp->appSwitchCursor->unk_08->unk_01];
        ov100_021E7128(pokegearApp->appSwitchCursor, 0, FALSE);
        pokegearApp->unk_006 = 0;
        PlaySE(r4->appId != GEAR_APP_CANCEL ? SEQ_SE_GS_GEARAPPLICHANGE : SEQ_SE_GS_GEARCANCEL);
        if (r4->appId == pokegearApp->app) {
            if (pokegearApp->unk_05C != NULL) {
                pokegearApp->unk_05C(pokegearApp->unk_064);
            }
            return -1;
        }
        ov100_021E5B4C(pokegearApp, r4->appId, 1);
        return r4->appId;
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(pokegearApp->appSwitchCursor, 0);
        return -1;
    }
    if (gSystem.newKeys & PAD_KEY_RIGHT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(pokegearApp->appSwitchCursor, 1);
        return -1;
    }
    return -1;
}

static void ov100_021E5A88(PokegearAppData *pokegearApp) {
    u8 r4 = pokegearApp->registeredCards;
    CopyToBgTilemapRect(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0, 0, 20, 32, 4, pokegearApp->unk_0C8->rawData, 0, 0, pokegearApp->unk_0C8->screenWidth / 8, pokegearApp->unk_0C8->screenHeight / 8);
    if (!(r4 & 1)) {
        CopyToBgTilemapRect(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0, 13, 20, 6, 4, pokegearApp->unk_0C8->rawData, 0, 8, pokegearApp->unk_0C8->screenWidth / 8, pokegearApp->unk_0C8->screenHeight / 8);
    }
    if (!(r4 & 2)) {
        CopyToBgTilemapRect(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0, 7, 20, 6, 4, pokegearApp->unk_0C8->rawData, 0, 8, pokegearApp->unk_0C8->screenWidth / 8, pokegearApp->unk_0C8->screenHeight / 8);
    }
    ScheduleBgTilemapBufferTransfer(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0);
}

static BOOL ov100_021E5B4C(PokegearAppData *pokegearApp, u8 selection, u8 a2) {
    u8 r2;
    ov100_021E5A88(pokegearApp);
    if (selection == 4) {
        r2 = 26;
    } else {
        r2 = selection * 6 + 1;
    }
    CopyToBgTilemapRect(pokegearApp->bgConfig, GF_BG_LYR_MAIN_0, r2, 20, 6, 4, pokegearApp->unk_0C8->rawData, r2, a2 * 4, pokegearApp->unk_0C8->screenWidth / 8, pokegearApp->unk_0C8->screenHeight / 8);
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
        UnkImageStruct_SetSpriteAnimCtrlCurrentFrame(pokegearApp->unk_098[i + 5].unk_image_struct, sp0[i]);
    }
    UnkImageStruct_SetSpriteAnimCtrlCurrentFrame(pokegearApp->unk_098[4].unk_image_struct, date.week);
    pokegearApp->unk_080 = time;
    pokegearApp->unk_007 = 0;
    return TRUE;
}

int ov100_021E5C50(u16 a0, u16 a1) {
    if (a0 > 21) {
        if (a0 == 25 && a1 == 8) {
            return 2;
        } else if ((a0 == 28 && a1 == 6) || (a0 == 28 && a1 > 8 && a1 < 13)) {
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

void ov100_021E5CA4(PokegearAppData *pokegearApp) {
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

BOOL ov100_021E5D3C(PokegearAppData *pokegearApp, int a1) {
    if (pokegearApp->unk_009 > 16) {
        return TRUE;
    }
    if (a1 == 0) {
        PaletteData_BlendPalette(pokegearApp->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16 - pokegearApp->unk_009, RGB_BLACK);
        PaletteData_BlendPalette(pokegearApp->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16 - pokegearApp->unk_009, RGB_BLACK);
    } else {
        PaletteData_BlendPalette(pokegearApp->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, pokegearApp->unk_009, RGB_BLACK);
        PaletteData_BlendPalette(pokegearApp->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, pokegearApp->unk_009, RGB_BLACK);
    }
    if (pokegearApp->unk_009 >= 16) {
        pokegearApp->unk_009 += 2;
        return TRUE;
    } else {
        pokegearApp->unk_009 += 2;
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
        ov100_021E6374(pokegearApp);
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
    ov100_021E63F4(pokegearApp);
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
    if (pokegearApp->app == 4) {
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
    FreeToHeap(pokegearApp->bgConfig);
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
    FreeToHeap(pokegearApp->unk_0C4);
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
        pokegearApp->unk_098[i].unk_image_struct = ov100_021E6AC0(pokegearApp->unk_094, 0x40, 0x40, 0, 0, 0, i, i + 4, 0);
    }
    pokegearApp->unk_098[4].unk_image_struct = ov100_021E6AC0(pokegearApp->unk_094, 0xAD, 0x30, 0, 0, 0, 4, 2, 1);
    pokegearApp->unk_098[5].unk_image_struct = ov100_021E6AC0(pokegearApp->unk_094, 0x46, 0x2E, 0, 0, 0, 5, 0, 1);
    pokegearApp->unk_098[6].unk_image_struct = ov100_021E6AC0(pokegearApp->unk_094, 0x56, 0x2E, 0, 0, 0, 6, 0, 1);
    pokegearApp->unk_098[7].unk_image_struct = ov100_021E6AC0(pokegearApp->unk_094, 0x6E, 0x2E, 0, 0, 0, 7, 0, 1);
    pokegearApp->unk_098[8].unk_image_struct = ov100_021E6AC0(pokegearApp->unk_094, 0x7E, 0x2E, 0, 0, 0, 8, 0, 1);
    pokegearApp->unk_098[9].unk_image_struct = ov100_021E6AC0(pokegearApp->unk_094, 0x62, 0x2E, 0, 0, 0, 9, 1, 1);
    pokegearApp->unk_098[10].unk_image_struct = ov100_021E6AC0(pokegearApp->unk_094, 0xC5, 0x30, 0, 0, 0, 10, 3, 1);
    ov100_021E5BB0(pokegearApp, TRUE);

    UnkImageStruct_SetSpriteAnimActiveFlag(pokegearApp->unk_098[9].unk_image_struct, TRUE);
    if (!MapHeader_GetField14_1D(pokegearApp->args->mapID)) {
        UnkImageStruct_SetSpriteAnimCtrlCurrentFrame(pokegearApp->unk_098[10].unk_image_struct, 1);
    }

    for (int i = 0; i <= 3; ++i) {
        UnkImageStruct_SetSpriteVisibleFlag(pokegearApp->unk_098[i].unk_image_struct, FALSE);
        UnkImageStruct_SetSpriteAnimActiveFlag(pokegearApp->unk_098[i].unk_image_struct, TRUE);
    }

    for (int i = 4; i < 11; ++i) {
        UnkImageStruct_SetSpriteVisibleFlag(pokegearApp->unk_098[i].unk_image_struct, TRUE);
    }
}

static void ov100_021E6338(PokegearAppData *pokegearApp) {
    for (int i = 0; i < 11; ++i) {
        UnkImageStruct_SetSpriteVisibleFlag(pokegearApp->unk_098[i].unk_image_struct, FALSE);
        ov100_021E6C44(pokegearApp->unk_098[i].unk_image_struct);
    }
    ov100_021E6A3C(pokegearApp->unk_094);
    ov100_021E6950(pokegearApp);
}

static void ov100_021E6374(PokegearAppData *pokegearApp) {
    // This data has to be scoped to the function in order to match
    static const PokegearApp_UnkSub07C_Sub4_Sub4 ov100_021E74DC[] = {
        {
         0,
         0x02,
         0x01,
         0xFF,
         0xFF,
         0x20,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
        {
         3,
         0x00,
         0x02,
         0xFF,
         0xFF,
         0xB0,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
        {
         4,
         0x01,
         0x00,
         0xFF,
         0xFF,
         0xE6,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
    };

    static const PokegearApp_UnkSub07C_Sub4_Sub4 ov100_021E7528[] = {
        {
         0,
         0x03,
         0x01,
         0xFF,
         0xFF,
         0x20,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
        {
         2,
         0x00,
         0x02,
         0xFF,
         0xFF,
         0x80,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
        {
         3,
         0x01,
         0x03,
         0xFF,
         0xFF,
         0xB0,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
        {
         4,
         0x02,
         0x00,
         0xFF,
         0xFF,
         0xE6,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
    };

    static const PokegearApp_UnkSub07C_Sub4_Sub4 ov100_021E7558[] = {
        {
         0,
         0x03,
         0x01,
         0xFF,
         0xFF,
         0x20,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
        {
         1,
         0x00,
         0x02,
         0xFF,
         0xFF,
         0x50,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
        {
         3,
         0x01,
         0x03,
         0xFF,
         0xFF,
         0xB0,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
        {
         4,
         0x02,
         0x00,
         0xFF,
         0xFF,
         0xE6,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
    };

    static const PokegearApp_UnkSub07C_Sub4_Sub4 ov100_021E75C0[] = {
        {
         0,
         0x04,
         0x01,
         0xFF,
         0xFF,
         0x20,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
        {
         1,
         0x00,
         0x02,
         0xFF,
         0xFF,
         0x50,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
        {
         2,
         0x01,
         0x03,
         0xFF,
         0xFF,
         0x80,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
        {
         3,
         0x02,
         0x04,
         0xFF,
         0xFF,
         0xB0,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
        {
         4,
         0x03,
         0x00,
         0xFF,
         0xFF,
         0xE6,
         0xB0,
         0xF0,
         0x10,
         0xF6,
         0x0A,
         },
    };

    static const PokegearApp_UnkSub07C_Sub4_Sub4 *ov100_021E7720[] = {
        ov100_021E74DC,
        ov100_021E7528,
        ov100_021E7558,
        ov100_021E75C0,
    };

    static const u8 ov100_021E74A0[] = {
        NELEMS(ov100_021E74DC),
        NELEMS(ov100_021E7528),
        NELEMS(ov100_021E7558),
        NELEMS(ov100_021E75C0),
    };

    pokegearApp->appSwitchCursor = ov100_021E6F88(4, pokegearApp->heapId);
    ov100_021E7014(pokegearApp->appSwitchCursor, ov100_021E7720[pokegearApp->registeredCards], ov100_021E74A0[pokegearApp->registeredCards], 0, 1, pokegearApp->heapId, pokegearApp->unk_098[0], pokegearApp->unk_098[1], pokegearApp->unk_098[2], pokegearApp->unk_098[3]);
    if (pokegearApp->app == 4) {
        ov100_021E72F8(pokegearApp->appSwitchCursor, 0, 2);
    } else {
        ov100_021E72F8(pokegearApp->appSwitchCursor, 0, ov100_021E5DC8(pokegearApp));
    }
}

static void ov100_021E63F4(PokegearAppData *pokegearApp) {
    ov100_021E70A4(pokegearApp->appSwitchCursor, 0);
    ov100_021E6FBC(pokegearApp->appSwitchCursor);
}
