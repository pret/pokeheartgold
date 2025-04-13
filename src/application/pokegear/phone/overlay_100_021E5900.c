#include "global.h"

#include "application/pokegear/phone.h"

#include "map_header.h"
#include "system.h"
#include "touch_hitbox_controller.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_020210A0.h"
#include "unk_0208805C.h"

int ov100_021E59CC(PokegearPhoneApp *phoneApp);
void ov100_021E5A88(PokegearPhoneApp *phoneApp);
BOOL ov100_021E5B4C(PokegearPhoneApp *phoneApp, u8 selection, u8 a2);
void ov100_021E5CA4(PokegearPhoneApp *phoneApp);
void ov100_021E5FFC(PokegearPhoneApp *phoneApp);
void ov100_021E6094(PokegearPhoneApp *phoneApp);
void ov100_021E60C4(PokegearPhoneApp *phoneApp);
void ov100_021E6134(PokegearPhoneApp *phoneApp);
void ov100_021E616C(PokegearPhoneApp *phoneApp);
void ov100_021E6338(PokegearPhoneApp *phoneApp);
void ov100_021E6374(PokegearPhoneApp *phoneApp);
void ov100_021E63F4(PokegearPhoneApp *phoneApp);

extern void ov100_021E65F4(void *cb_args);

static const TouchscreenHitbox ov100_021E74C4[] = {
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

BOOL ov100_021E5900(PokegearPhoneApp *phoneApp) {
    phoneApp->unk_010 = phoneApp->unk_00C;
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_RIGHT | PAD_KEY_LEFT | PAD_KEY_UP | PAD_KEY_DOWN | PAD_BUTTON_X | PAD_BUTTON_Y)) {
        phoneApp->unk_00C = MENU_INPUT_STATE_BUTTONS;
        return TRUE;
    } else {
        return FALSE;
    }
}

int ov100_021E5924(PokegearPhoneApp *phoneApp) {
    int result = TouchscreenHitbox_FindRectAtTouchNew(ov100_021E74C4);
    if (result == -1) {
        return -1;
    }
    u16 val = 0;
    if (DoesPixelAtScreenXYMatchPtrVal(phoneApp->bgConfig, GF_BG_LYR_MAIN_0, gSystem.touchX, gSystem.touchY, &val) == 1) {
        return -1;
    }
    if (result == phoneApp->unk_004) {
        return -1;
    }
    if ((result == 1 && !(phoneApp->unk_005_0 & 2)) || (result == 2 && !(phoneApp->unk_005_0 & 1))) {
        return -1;
    }
    ov100_021E5B4C(phoneApp, result, 1);
    PlaySE(result != 4 ? SEQ_SE_GS_GEARAPPLICHANGE : SEQ_SE_GS_GEARCANCEL);
    phoneApp->unk_006 = 0;
    phoneApp->unk_00C = MENU_INPUT_STATE_TOUCH;
    return result;
}

int ov100_021E59CC(PokegearPhoneApp *phoneApp) {
    if (gSystem.newKeys & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return 4;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        PokegearPhoneApp_UnkSub07C_Sub8_Sub4 *r4 = &phoneApp->unk_07C->unk_08->unk_04[phoneApp->unk_07C->unk_08->unk_01];
        ov100_021E7128(phoneApp->unk_07C, 0, 0);
        phoneApp->unk_006 = 0;
        PlaySE(r4->unk_00 != 4 ? SEQ_SE_GS_GEARAPPLICHANGE : SEQ_SE_GS_GEARCANCEL);
        if (r4->unk_00 == phoneApp->unk_004) {
            if (phoneApp->unk_05C != NULL) {
                phoneApp->unk_05C(phoneApp->unk_064);
            }
            return -1;
        }
        ov100_021E5B4C(phoneApp, r4->unk_00, 1);
        return r4->unk_00;
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(phoneApp->unk_07C, 0);
        return -1;
    }
    if (gSystem.newKeys & PAD_KEY_RIGHT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(phoneApp->unk_07C, 1);
        return -1;
    }
    return -1;
}

void ov100_021E5A88(PokegearPhoneApp *phoneApp) {
    u8 r4 = phoneApp->unk_005_0;
    CopyToBgTilemapRect(phoneApp->bgConfig, GF_BG_LYR_MAIN_0, 0, 20, 32, 4, phoneApp->unk_0C8->rawData, 0, 0, phoneApp->unk_0C8->screenWidth / 8, phoneApp->unk_0C8->screenHeight / 8);
    if (!(r4 & 1)) {
        CopyToBgTilemapRect(phoneApp->bgConfig, GF_BG_LYR_MAIN_0, 13, 20, 6, 4, phoneApp->unk_0C8->rawData, 0, 8, phoneApp->unk_0C8->screenWidth / 8, phoneApp->unk_0C8->screenHeight / 8);
    }
    if (!(r4 & 2)) {
        CopyToBgTilemapRect(phoneApp->bgConfig, GF_BG_LYR_MAIN_0, 7, 20, 6, 4, phoneApp->unk_0C8->rawData, 0, 8, phoneApp->unk_0C8->screenWidth / 8, phoneApp->unk_0C8->screenHeight / 8);
    }
    ScheduleBgTilemapBufferTransfer(phoneApp->bgConfig, GF_BG_LYR_MAIN_0);
}

BOOL ov100_021E5B4C(PokegearPhoneApp *phoneApp, u8 selection, u8 a2) {
    u8 r2;
    ov100_021E5A88(phoneApp);
    if (selection == 4) {
        r2 = 26;
    } else {
        r2 = selection * 6 + 1;
    }
    CopyToBgTilemapRect(phoneApp->bgConfig, GF_BG_LYR_MAIN_0, r2, 20, 6, 4, phoneApp->unk_0C8->rawData, r2, a2 * 4, phoneApp->unk_0C8->screenWidth / 8, phoneApp->unk_0C8->screenHeight / 8);
    ScheduleBgTilemapBufferTransfer(phoneApp->bgConfig, GF_BG_LYR_MAIN_0);
    return FALSE;
}

BOOL ov100_021E5BB0(PokegearPhoneApp *phoneApp, BOOL a1) {
    RTCDate date;
    RTCTime time;
    u8 sp0[4];

    GF_RTC_CopyDateTime(&date, &time);
    if (a1 == 0 && phoneApp->unk_080.second == time.second) {
        return FALSE;
    }

    sp0[0] = time.hour / 10;
    sp0[1] = time.hour % 10;
    sp0[2] = time.minute / 10;
    sp0[3] = time.minute % 10;
    for (u8 i = 0; i < 4; i++) {
        UnkImageStruct_SetSpriteAnimCtrlCurrentFrame(phoneApp->unk_098[i + 5], sp0[i]);
    }
    UnkImageStruct_SetSpriteAnimCtrlCurrentFrame(phoneApp->unk_098[4], date.week);
    phoneApp->unk_080 = time;
    phoneApp->unk_007 = 0;
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

int ov100_021E5C80(PokegearPhoneApp *phoneApp) {
    return ov100_021E5C50(phoneApp->args->x / 32, phoneApp->args->y / 32);
}

void ov100_021E5CA4(PokegearPhoneApp *phoneApp) {
    BG_LoadBlankPltt(GF_BG_LYR_MAIN_3, 0x1C0, 0, phoneApp->heapId);
    BG_LoadBlankPltt(GF_BG_LYR_SUB_3, 0x180, 0, phoneApp->heapId);
    for (int i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(phoneApp->bgConfig, i + 1);
        BG_ClearCharDataRange(i + 1, 0x40, 0, phoneApp->heapId);
        BgCommitTilemapBufferToVram(phoneApp->bgConfig, i + 1);
        FreeBgTilemapBuffer(phoneApp->bgConfig, i + 1);
        BgClearTilemapBufferAndCommit(phoneApp->bgConfig, i + 5);
        BG_ClearCharDataRange(i + 5, 0x40, 0, phoneApp->heapId);
        BgCommitTilemapBufferToVram(phoneApp->bgConfig, i + 5);
        FreeBgTilemapBuffer(phoneApp->bgConfig, i + 5);
    }
}

BOOL ov100_021E5D3C(PokegearPhoneApp *phoneApp, int a1) {
    if (phoneApp->unk_009 > 16) {
        return TRUE;
    }
    if (a1 == 0) {
        PaletteData_BlendPalette(phoneApp->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16 - phoneApp->unk_009, RGB_BLACK);
        PaletteData_BlendPalette(phoneApp->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16 - phoneApp->unk_009, RGB_BLACK);
    } else {
        PaletteData_BlendPalette(phoneApp->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, phoneApp->unk_009, RGB_BLACK);
        PaletteData_BlendPalette(phoneApp->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, phoneApp->unk_009, RGB_BLACK);
    }
    if (phoneApp->unk_009 >= 16) {
        phoneApp->unk_009 += 2;
        return TRUE;
    } else {
        phoneApp->unk_009 += 2;
        return FALSE;
    }
}

u8 ov100_021E5DC8(PokegearPhoneApp *phoneApp) {
    return ov100_021E74B4[phoneApp->unk_005_0][phoneApp->unk_004];
}

BOOL ov100_021E5DDC(PokegearPhoneApp *phoneApp) {
    switch (phoneApp->unk_018) {
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
        ov100_021E5FFC(phoneApp);
        ov100_021E60C4(phoneApp);
        break;
    case 2:
        ov100_021E616C(phoneApp);
        ov100_021E6374(phoneApp);
        break;
    case 3:
        Main_SetVBlankIntrCB(ov100_021E65F4, phoneApp);
        phoneApp->unk_018 = 0;
        return TRUE;
    }
    ++phoneApp->unk_018;
    return FALSE;
}

BOOL ov100_021E5E88(PokegearPhoneApp *phoneApp) {
    sub_02021238();
    Main_SetVBlankIntrCB(NULL, phoneApp);
    ov100_021E63F4(phoneApp);
    ov100_021E6338(phoneApp);
    ov100_021E6134(phoneApp);
    ov100_021E6094(phoneApp);
    return TRUE;
}

void ov100_021E5EB4(PokegearPhoneApp *phoneApp, int a1) {
    NARC *narc = NARC_New(NARC_a_1_4_3, phoneApp->heapId);
    sub_0208820C(phoneApp->bgConfig, phoneApp->heapId, narc, NARC_a_1_4_3, a1 + 48, GF_BG_LYR_MAIN_0, 0, 0, 0);
    sub_0208820C(phoneApp->bgConfig, phoneApp->heapId, narc, NARC_a_1_4_3, a1 + 36, GF_BG_LYR_SUB_0, 0, 0, 0);
    PaletteData_LoadFromOpenNarc(phoneApp->plttData, narc, a1 + 30, phoneApp->heapId, PLTTBUF_MAIN_BG, 0x40, 0xE0, 0xE0);
    PaletteData_LoadFromOpenNarc(phoneApp->plttData, narc, a1 + 24, phoneApp->heapId, PLTTBUF_SUB_BG, 0x80, 0xC0, 0xC0);
    PaletteData_LoadFromOpenNarc(phoneApp->plttData, narc, a1, phoneApp->heapId, PLTTBUF_MAIN_OBJ, 0x80, 0, 0);
    PaletteData_LoadFromOpenNarc(phoneApp->plttData, narc, a1, phoneApp->heapId, PLTTBUF_SUB_OBJ, 0x80, 0, 0);

    NARC_ReadWholeMember(narc, a1 + 54, phoneApp->unk_0C4);
    NNS_G2dGetUnpackedScreenData(phoneApp->unk_0C4, &phoneApp->unk_0C8);
    if (phoneApp->unk_004 == 4) {
        ov100_021E5B4C(phoneApp, 2, 1);
    } else {
        ov100_021E5B4C(phoneApp, phoneApp->unk_004, 1);
    }
    sub_0208820C(phoneApp->bgConfig, phoneApp->heapId, narc, NARC_a_1_4_3, a1 + 42, GF_BG_LYR_SUB_0, 1, 0, 0);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(phoneApp->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(phoneApp->bgConfig, GF_BG_LYR_SUB_0);
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

void ov100_021E5FFC(PokegearPhoneApp *phoneApp) {
    ov100_021E5FDC();
    phoneApp->bgConfig = BgConfig_Alloc(phoneApp->heapId);
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
            InitBgFromTemplate(phoneApp->bgConfig, i * 4, &bgTemplates[i], GF_BG_TYPE_TEXT);
            BgClearTilemapBufferAndCommit(phoneApp->bgConfig, i * 4);
            BG_ClearCharDataRange(i * 4, 0x20, 0, phoneApp->heapId);
        }
    }

    ToggleBgLayer(GF_BG_LYR_MAIN_0, FALSE);
    ToggleBgLayer(GF_BG_LYR_SUB_0, FALSE);
}

void ov100_021E6094(PokegearPhoneApp *phoneApp) {
    FreeBgTilemapBuffer(phoneApp->bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(phoneApp->bgConfig, GF_BG_LYR_MAIN_0);
    FreeToHeap(phoneApp->bgConfig);
    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);
}

void ov100_021E60C4(PokegearPhoneApp *phoneApp) {
    NARC *narc = NARC_New(NARC_a_1_4_3, phoneApp->heapId);
    phoneApp->plttData = PaletteData_Init(phoneApp->heapId);
    PaletteData_AllocBuffers(phoneApp->plttData, PLTTBUF_MAIN_BG, 0x200, phoneApp->heapId);
    PaletteData_AllocBuffers(phoneApp->plttData, PLTTBUF_MAIN_OBJ, 0x200, phoneApp->heapId);
    PaletteData_AllocBuffers(phoneApp->plttData, PLTTBUF_SUB_BG, 0x200, phoneApp->heapId);
    PaletteData_AllocBuffers(phoneApp->plttData, PLTTBUF_SUB_OBJ, 0x200, phoneApp->heapId);
    phoneApp->unk_0C4 = AllocFromHeap(phoneApp->heapId, GetNarcMemberSizeByIdPair(NARC_a_1_4_3, 54));
    ov100_021E5EB4(phoneApp, phoneApp->unk_008);
    NARC_Delete(narc); // was never actually used
}

void ov100_021E6134(PokegearPhoneApp *phoneApp) {
    FreeToHeap(phoneApp->unk_0C4);
    PaletteData_FreeBuffers(phoneApp->plttData, PLTTBUF_SUB_OBJ);
    PaletteData_FreeBuffers(phoneApp->plttData, PLTTBUF_SUB_BG);
    PaletteData_FreeBuffers(phoneApp->plttData, PLTTBUF_MAIN_OBJ);
    PaletteData_FreeBuffers(phoneApp->plttData, PLTTBUF_MAIN_BG);
    PaletteData_Free(phoneApp->plttData);
    phoneApp->plttData = NULL;
}

void ov100_021E616C(PokegearPhoneApp *phoneApp) {
    ov100_021E6914(phoneApp);
    phoneApp->unk_094 = ov100_021E69F8(phoneApp->heapId, 11, 1, phoneApp->unk_008, 3, 2);
    for (int i = 0; i < 4; ++i) {
        phoneApp->unk_098[i] = ov100_021E6AC0(phoneApp->unk_094, 0x40, 0x40, 0, 0, 0, i, i + 4, 0);
    }
    phoneApp->unk_098[4] = ov100_021E6AC0(phoneApp->unk_094, 0xAD, 0x30, 0, 0, 0, 4, 2, 1);
    phoneApp->unk_098[5] = ov100_021E6AC0(phoneApp->unk_094, 0x46, 0x2E, 0, 0, 0, 5, 0, 1);
    phoneApp->unk_098[6] = ov100_021E6AC0(phoneApp->unk_094, 0x56, 0x2E, 0, 0, 0, 6, 0, 1);
    phoneApp->unk_098[7] = ov100_021E6AC0(phoneApp->unk_094, 0x6E, 0x2E, 0, 0, 0, 7, 0, 1);
    phoneApp->unk_098[8] = ov100_021E6AC0(phoneApp->unk_094, 0x7E, 0x2E, 0, 0, 0, 8, 0, 1);
    phoneApp->unk_098[9] = ov100_021E6AC0(phoneApp->unk_094, 0x62, 0x2E, 0, 0, 0, 9, 1, 1);
    phoneApp->unk_098[10] = ov100_021E6AC0(phoneApp->unk_094, 0xC5, 0x30, 0, 0, 0, 10, 3, 1);
    ov100_021E5BB0(phoneApp, TRUE);

    UnkImageStruct_SetSpriteAnimActiveFlag(phoneApp->unk_098[9], TRUE);
    if (!MapHeader_GetField14_1D(phoneApp->args->mapID)) {
        UnkImageStruct_SetSpriteAnimCtrlCurrentFrame(phoneApp->unk_098[10], 1);
    }

    for (int i = 0; i <= 3; ++i) {
        UnkImageStruct_SetSpriteVisibleFlag(phoneApp->unk_098[i], FALSE);
        UnkImageStruct_SetSpriteAnimActiveFlag(phoneApp->unk_098[i], TRUE);
    }

    for (int i = 4; i < 11; ++i) {
        UnkImageStruct_SetSpriteVisibleFlag(phoneApp->unk_098[i], TRUE);
    }
}

void ov100_021E6338(PokegearPhoneApp *phoneApp) {
    for (int i = 0; i < 11; ++i) {
        UnkImageStruct_SetSpriteVisibleFlag(phoneApp->unk_098[i], FALSE);
        ov100_021E6C44(phoneApp->unk_098[i]);
    }
    ov100_021E6A3C(phoneApp->unk_094);
    ov100_021E6950(phoneApp);
}

void ov100_021E6374(PokegearPhoneApp *phoneApp) {
    // This data has to be scoped to the function in order to match
    static const PokegearPhoneApp_UnkSub07C_Sub8_Sub4 ov100_021E74DC[] = {
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

    static const PokegearPhoneApp_UnkSub07C_Sub8_Sub4 ov100_021E7528[] = {
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

    static const PokegearPhoneApp_UnkSub07C_Sub8_Sub4 ov100_021E7558[] = {
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

    static const PokegearPhoneApp_UnkSub07C_Sub8_Sub4 ov100_021E75C0[] = {
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

    static const PokegearPhoneApp_UnkSub07C_Sub8_Sub4 *ov100_021E7720[] = {
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

    phoneApp->unk_07C = ov100_021E6F88(4, phoneApp->heapId);
    ov100_021E7014(phoneApp->unk_07C, ov100_021E7720[phoneApp->unk_005_0], ov100_021E74A0[phoneApp->unk_005_0], 0, 1, phoneApp->heapId, phoneApp->unk_098[0], phoneApp->unk_098[1], phoneApp->unk_098[2], phoneApp->unk_098[3]);
    if (phoneApp->unk_004 == 4) {
        ov100_021E72F8(phoneApp->unk_07C, 0, 2);
    } else {
        ov100_021E72F8(phoneApp->unk_07C, 0, ov100_021E5DC8(phoneApp));
    }
}

void ov100_021E63F4(PokegearPhoneApp *phoneApp) {
    ov100_021E70A4(phoneApp->unk_07C, 0);
    ov100_021E6FBC(phoneApp->unk_07C);
}
