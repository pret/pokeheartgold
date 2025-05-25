#include "global.h"

#include "application/pokegear/radio/radio_internal.h"

#include "font.h"
#include "gf_gfx_loader.h"
#include "map_header.h"
#include "sound.h"
#include "text.h"
#include "unk_0208805C.h"

void ov101_021F4AEC(PokegearRadioAppData *radioApp);
void ov101_021F4BBC(PokegearRadioAppData *radioApp);
void ov101_021F4BC8(PokegearRadioAppData *radioApp);
void ov101_021F4CD8(PokegearRadioAppData *radioApp);
void ov101_021F4CE8(PokegearRadioAppData *radioApp);
void ov101_021F4DC8(PokegearRadioAppData *radioApp);
void ov101_021F4E48(PokegearRadioAppData *radioApp);
void ov101_021F4E6C(PokegearRadioAppData *radioApp);
void ov101_021F4E78(PokegearRadioAppData *radioApp);
void ov101_021F4E84(PokegearRadioAppData *radioApp);
void ov101_021F4EE8(PokegearRadioAppData *radioApp);
void ov101_021F4F00(PokegearRadioAppData *radioApp);

static const WindowTemplate ov101_021F87DC[] = {
    {
     .bgId = GF_BG_LYR_SUB_2,
     .left = 2,
     .top = 19,
     .width = 28,
     .height = 4,
     .palette = 0,
     .baseTile = 0x38F,
     },
    {
     .bgId = GF_BG_LYR_SUB_2,
     .left = 4,
     .top = 16,
     .width = 14,
     .height = 2,
     .palette = 0,
     .baseTile = 0x373,
     },
    {
     .bgId = GF_BG_LYR_MAIN_1,
     .left = 5,
     .top = 1,
     .width = 22,
     .height = 2,
     .palette = 0,
     .baseTile = 0x3D3,
     },
};

static const UnmanagedSpriteTemplate ov101_021F889C[] = {
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animSeqNo = 1,
     .rotation = 1,
     .palIndex = 5,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animSeqNo = 2,
     .rotation = 1,
     .palIndex = 5,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animSeqNo = 3,
     .rotation = 1,
     .palIndex = 5,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animSeqNo = 4,
     .rotation = 1,
     .palIndex = 5,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 128,
     .y = 128,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 1,
     .palIndex = 4,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
};

BOOL ov101_021F49F8(PokegearRadioAppData *radioApp) {
    switch (radioApp->unk_08) {
    case 0:
        ov101_021F4AEC(radioApp);
        ov101_021F4BC8(radioApp);
        ov101_021F4DC8(radioApp);
        ov101_021F4E6C(radioApp);
        ov101_021F4CE8(radioApp);
        break;
    case 1:
        ov101_021F4E84(radioApp);
        ov101_021F4F00(radioApp);
        radioApp->pokegear->unk_058 = ov101_021F50D8;
        radioApp->unk_08 = 0;
        return TRUE;
    }

    ++radioApp->unk_08;
    return FALSE;
}

BOOL ov101_021F4A4C(PokegearRadioAppData *radioApp) {
    switch (radioApp->unk_08) {
    case 0:
        if (ov101_021F54AC(radioApp, radioApp->unk_28, radioApp->unk_2A, NULL) == 0xFF || radioApp->showData->unk_66_3 || radioApp->showData->curStation == 11) {
            GF_SndStartFadeOutBGM(0, 4);
        } else {
            radioApp->unk_08 = 2;
            break;
        }
        ++radioApp->unk_08;
        break;
    case 1:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        PlayBGM(radioApp->pokegear->args->mapMusicID);
        sub_0203E354();
        ++radioApp->unk_08;
        break;
    case 2:
        radioApp->pokegear->unk_058 = NULL;
        ov101_021F4EE8(radioApp);
        ov101_021F4E78(radioApp);
        ov101_021F4E48(radioApp);
        ov101_021F4CD8(radioApp);
        ov101_021F4BBC(radioApp);
        radioApp->unk_08 = 0;
        return TRUE;
    }

    return FALSE;
}

void ov101_021F4AEC(PokegearRadioAppData *radioApp) {
    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_0, GX_BG0_AS_2D);

    {
        BgTemplate bgTemplates[] = {
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xf000,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 1,
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
             .screenBase = GX_BG_SCRBASE_0xe800,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 2,
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
             .screenBase = GX_BG_SCRBASE_0xe000,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 3,
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
             .screenBase = GX_BG_SCRBASE_0xf000,
             .charBase = GX_BG_CHARBASE_0x00000,
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
             .screenBase = GX_BG_SCRBASE_0xe800,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 1,
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
             .screenBase = GX_BG_SCRBASE_0xe000,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 2,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0,
             .mosaic = FALSE,
             },
        };

        InitBgFromTemplateEx(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplates[0], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplates[1], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplates[2], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, &bgTemplates[3], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, &bgTemplates[4], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, &bgTemplates[5], GF_BG_TYPE_TEXT, FALSE);
    }

    for (int i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1 + i);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_1 + i, 0x20, 0, radioApp->heapId);
        BgClearTilemapBufferAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1 + i);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_1 + i, 0x20, 0, radioApp->heapId);
    }
}

void ov101_021F4BBC(PokegearRadioAppData *radioApp) {
    ov100_021E5CA4(radioApp->pokegear);
}

void ov101_021F4BC8(PokegearRadioAppData *radioApp) {
    FontID_Alloc(4, radioApp->heapId);
    NARC *narc = NARC_New(NARC_a_1_4_7, radioApp->heapId);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->unk_25 + 16, GF_BG_LYR_MAIN_2, 0, 0, 0);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->unk_25 + 34, GF_BG_LYR_SUB_3, 0, 0, 0);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->unk_25 + 22, GF_BG_LYR_MAIN_2, 1, 0x800, 0);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->unk_25 + 28, GF_BG_LYR_MAIN_3, 1, 0x800, 0);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->unk_25 + 40, GF_BG_LYR_SUB_3, 1, 0x800, 0);
    radioApp->unk_64 = GfGfxLoader_GetScrnDataFromOpenNarc(narc, radioApp->unk_25 + 22, FALSE, &radioApp->unk_68, radioApp->heapId);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
}

void ov101_021F4CD8(PokegearRadioAppData *radioApp) {
    FreeToHeap(radioApp->unk_64);
    FontID_Release(4);
}

void ov101_021F4CE8(PokegearRadioAppData *radioApp) {
    NARC *narc = NARC_New(NARC_a_1_4_7, radioApp->heapId);

    PaletteData_LoadFromOpenNarc(radioApp->pokegear->plttData, narc, radioApp->unk_25 + 10, radioApp->heapId, PLTTBUF_MAIN_BG, 0x1C0, 0, 0);
    PaletteData_LoadFromOpenNarc(radioApp->pokegear->plttData, narc, radioApp->unk_25 + 4, radioApp->heapId, PLTTBUF_SUB_BG, 0x180, 0, 0);
    PaletteData_LoadFromOpenNarc(radioApp->pokegear->plttData, narc, 0, radioApp->heapId, PLTTBUF_MAIN_OBJ, 0x180, 0x40, 0);
    PaletteData_LoadFromOpenNarc(radioApp->pokegear->plttData, narc, 0, radioApp->heapId, PLTTBUF_SUB_OBJ, 0x180, 0x40, 0);
    PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, TRUE);
    PaletteData_BlendPalette(radioApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, RGB_BLACK);
    PaletteData_BlendPalette(radioApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, RGB_BLACK);
    PaletteData_PushTransparentBuffers(radioApp->pokegear->plttData);
    PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, FALSE);
    NARC_Delete(narc);
}

void ov101_021F4DC8(PokegearRadioAppData *radioApp) {
    for (int i = 0; i < 3; ++i) {
        AddWindowParameterized(radioApp->pokegear->bgConfig, &radioApp->unk_30[i], ov101_021F87DC[i].bgId, ov101_021F87DC[i].left, ov101_021F87DC[i].top, ov101_021F87DC[i].width, ov101_021F87DC[i].height, ov101_021F87DC[i].palette, ov101_021F87DC[i].baseTile);
        FillWindowPixelBuffer(&radioApp->unk_30[i], 0);
    }

    radioApp->showData = ov101_021F57B8(radioApp->pokegear->saveData, radioApp->pokegear->args->mapID, radioApp->pokegear->args->mapHeader, MapHeader_IsInKanto(radioApp->pokegear->args->mapID), &radioApp->unk_30[0], &radioApp->unk_30[2], &radioApp->unk_30[1], MAKE_TEXT_COLOR(1, 2, 0), radioApp->heapId);
}

void ov101_021F4E48(PokegearRadioAppData *radioApp) {
    ov101_021F58A0(radioApp->showData);
    for (int i = 0; i < 3; ++i) {
        ClearWindowTilemapAndCopyToVram(&radioApp->unk_30[i]);
        RemoveWindow(&radioApp->unk_30[i]);
    }
}

void ov101_021F4E6C(PokegearRadioAppData *radioApp) {
    PokegearApp_CreateSpriteManager(radioApp->pokegear, 1);
}

void ov101_021F4E78(PokegearRadioAppData *radioApp) {
    PokegearApp_DestroySpriteManager(radioApp->pokegear);
}

void ov101_021F4E84(PokegearRadioAppData *radioApp) {
    for (int i = 0; i < 5; ++i) {
        radioApp->unk_10[i] = SpriteSystem_CreateSpriteFromResourceHeader(radioApp->pokegear->spriteSystem, radioApp->pokegear->spriteManager, &ov101_021F889C[i]);
        thunk_Sprite_SetPriority(radioApp->unk_10[i], 1);
        Sprite_SetDrawFlag(radioApp->unk_10[i], FALSE);
        Sprite_SetAnimActiveFlag(radioApp->unk_10[i], TRUE);
    }
    thunk_Sprite_SetPriority(radioApp->unk_10[4], 3);
    Sprite_SetDrawFlag(radioApp->unk_10[4], TRUE);
    Sprite_SetPositionXY(radioApp->unk_10[4], radioApp->unk_28, radioApp->unk_2A);
}

void ov101_021F4EE8(PokegearRadioAppData *radioApp) {
    for (int i = 0; i < 5; ++i) {
        thunk_Sprite_Delete(radioApp->unk_10[i]);
    }
}

void ov101_021F4F00(PokegearRadioAppData *radioApp) {
    if (radioApp->pokegear->cursorInAppSwitchZone == TRUE) {
        PokegearAppSwitchCursor_SetCursorSpritesDrawState(radioApp->pokegear->appSwitch, 0, TRUE);
        PokegearAppSwitch_SetSpecIndexAndCursorPos(radioApp->pokegear->appSwitch, 0, ov100_021E5DC8(radioApp->pokegear));
    } else {
        PokegearAppSwitchCursor_SetCursorSpritesDrawState(radioApp->pokegear->appSwitch, 0, FALSE);
    }
}
