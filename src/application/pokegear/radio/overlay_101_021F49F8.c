#include "global.h"

#include "constants/radio_station.h"

#include "application/pokegear/radio/radio_internal.h"

#include "font.h"
#include "gf_gfx_loader.h"
#include "map_header.h"
#include "sound.h"
#include "text.h"
#include "unk_0208805C.h"

void Radio_InitBGs(PokegearRadioAppData *radioApp);
void Radio_UnloadBGs(PokegearRadioAppData *radioApp);
void Radio_LoadGraphics(PokegearRadioAppData *radioApp);
void Radio_UnloadGraphics(PokegearRadioAppData *radioApp);
void Radio_LoadPalettes(PokegearRadioAppData *radioApp);
void Radio_InitWindows(PokegearRadioAppData *radioApp);
void Radio_UnloadWindows(PokegearRadioAppData *radioApp);
void Radio_CreateSpriteManager(PokegearRadioAppData *radioApp);
void Radio_DestroySpriteManager(PokegearRadioAppData *radioApp);
void Radio_CreateSprites(PokegearRadioAppData *radioApp);
void Radio_UnloadSprites(PokegearRadioAppData *radioApp);
void Radio_InitAppSwitchCursorState(PokegearRadioAppData *radioApp);

static const WindowTemplate sWindowTemplates[] = {
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

static const UnmanagedSpriteTemplate sSpriteTemplates[] = {
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

BOOL Radio_VideoInit(PokegearRadioAppData *radioApp) {
    switch (radioApp->substate) {
    case 0:
        Radio_InitBGs(radioApp);
        Radio_LoadGraphics(radioApp);
        Radio_InitWindows(radioApp);
        Radio_CreateSpriteManager(radioApp);
        Radio_LoadPalettes(radioApp);
        break;
    case 1:
        Radio_CreateSprites(radioApp);
        Radio_InitAppSwitchCursorState(radioApp);
        radioApp->pokegear->unk_058 = Radio_Run;
        radioApp->substate = 0;
        return TRUE;
    }

    ++radioApp->substate;
    return FALSE;
}

BOOL Radio_VideoUnload(PokegearRadioAppData *radioApp) {
    switch (radioApp->substate) {
    case 0:
        if (Radio_GetTunedStationID(radioApp, radioApp->cursorX, radioApp->cursorY, NULL) == 0xFF || radioApp->showData->isPlayingJingle || radioApp->showData->curStation == RADIO_STATION_COMMERCIALS) {
            GF_SndStartFadeOutBGM(0, 4);
        } else {
            radioApp->substate = 2;
            break;
        }
        ++radioApp->substate;
        break;
    case 1:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        PlayBGM(radioApp->pokegear->args->mapMusicID);
        sub_0203E354();
        ++radioApp->substate;
        break;
    case 2:
        radioApp->pokegear->unk_058 = NULL;
        Radio_UnloadSprites(radioApp);
        Radio_DestroySpriteManager(radioApp);
        Radio_UnloadWindows(radioApp);
        Radio_UnloadGraphics(radioApp);
        Radio_UnloadBGs(radioApp);
        radioApp->substate = 0;
        return TRUE;
    }

    return FALSE;
}

void Radio_InitBGs(PokegearRadioAppData *radioApp) {
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

void Radio_UnloadBGs(PokegearRadioAppData *radioApp) {
    Pokegear_ClearAppBgLayers(radioApp->pokegear);
}

void Radio_LoadGraphics(PokegearRadioAppData *radioApp) {
    FontID_Alloc(4, radioApp->heapId);
    NARC *narc = NARC_New(NARC_a_1_4_7, radioApp->heapId);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->backgroundStyle + 16, GF_BG_LYR_MAIN_2, 0, 0, 0);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->backgroundStyle + 34, GF_BG_LYR_SUB_3, 0, 0, 0);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->backgroundStyle + 22, GF_BG_LYR_MAIN_2, 1, 0x800, 0);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->backgroundStyle + 28, GF_BG_LYR_MAIN_3, 1, 0x800, 0);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->backgroundStyle + 40, GF_BG_LYR_SUB_3, 1, 0x800, 0);
    radioApp->pNSCR = GfGfxLoader_GetScrnDataFromOpenNarc(narc, radioApp->backgroundStyle + 22, FALSE, &radioApp->screenData, radioApp->heapId);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
}

void Radio_UnloadGraphics(PokegearRadioAppData *radioApp) {
    Heap_Free(radioApp->pNSCR);
    FontID_Release(4);
}

void Radio_LoadPalettes(PokegearRadioAppData *radioApp) {
    NARC *narc = NARC_New(NARC_a_1_4_7, radioApp->heapId);

    PaletteData_LoadFromOpenNarc(radioApp->pokegear->plttData, narc, radioApp->backgroundStyle + 10, radioApp->heapId, PLTTBUF_MAIN_BG, 0x1C0, 0, 0);
    PaletteData_LoadFromOpenNarc(radioApp->pokegear->plttData, narc, radioApp->backgroundStyle + 4, radioApp->heapId, PLTTBUF_SUB_BG, 0x180, 0, 0);
    PaletteData_LoadFromOpenNarc(radioApp->pokegear->plttData, narc, 0, radioApp->heapId, PLTTBUF_MAIN_OBJ, 0x180, 0x40, 0);
    PaletteData_LoadFromOpenNarc(radioApp->pokegear->plttData, narc, 0, radioApp->heapId, PLTTBUF_SUB_OBJ, 0x180, 0x40, 0);
    PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, TRUE);
    PaletteData_BlendPalette(radioApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, RGB_BLACK);
    PaletteData_BlendPalette(radioApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, RGB_BLACK);
    PaletteData_PushTransparentBuffers(radioApp->pokegear->plttData);
    PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, FALSE);
    NARC_Delete(narc);
}

void Radio_InitWindows(PokegearRadioAppData *radioApp) {
    for (int i = 0; i < 3; ++i) {
        AddWindowParameterized(radioApp->pokegear->bgConfig, &radioApp->windows[i], sWindowTemplates[i].bgId, sWindowTemplates[i].left, sWindowTemplates[i].top, sWindowTemplates[i].width, sWindowTemplates[i].height, sWindowTemplates[i].palette, sWindowTemplates[i].baseTile);
        FillWindowPixelBuffer(&radioApp->windows[i], 0);
    }

    radioApp->showData = RadioShow_Create(radioApp->pokegear->saveData, radioApp->pokegear->args->mapID, radioApp->pokegear->args->mapHeader, MapHeader_IsInKanto(radioApp->pokegear->args->mapID), &radioApp->windows[0], &radioApp->windows[2], &radioApp->windows[1], MAKE_TEXT_COLOR(1, 2, 0), radioApp->heapId);
}

void Radio_UnloadWindows(PokegearRadioAppData *radioApp) {
    RadioShow_Delete(radioApp->showData);
    for (int i = 0; i < 3; ++i) {
        ClearWindowTilemapAndCopyToVram(&radioApp->windows[i]);
        RemoveWindow(&radioApp->windows[i]);
    }
}

void Radio_CreateSpriteManager(PokegearRadioAppData *radioApp) {
    PokegearApp_CreateSpriteManager(radioApp->pokegear, 1);
}

void Radio_DestroySpriteManager(PokegearRadioAppData *radioApp) {
    PokegearApp_DestroySpriteManager(radioApp->pokegear);
}

void Radio_CreateSprites(PokegearRadioAppData *radioApp) {
    for (int i = 0; i < 5; ++i) {
        radioApp->sprites[i] = SpriteSystem_CreateSpriteFromResourceHeader(radioApp->pokegear->spriteSystem, radioApp->pokegear->spriteManager, &sSpriteTemplates[i]);
        thunk_Sprite_SetPriority(radioApp->sprites[i], 1);
        Sprite_SetDrawFlag(radioApp->sprites[i], FALSE);
        Sprite_SetAnimActiveFlag(radioApp->sprites[i], TRUE);
    }
    thunk_Sprite_SetPriority(radioApp->sprites[4], 3);
    Sprite_SetDrawFlag(radioApp->sprites[4], TRUE);
    Sprite_SetPositionXY(radioApp->sprites[4], radioApp->cursorX, radioApp->cursorY);
}

void Radio_UnloadSprites(PokegearRadioAppData *radioApp) {
    for (int i = 0; i < 5; ++i) {
        thunk_Sprite_Delete(radioApp->sprites[i]);
    }
}

void Radio_InitAppSwitchCursorState(PokegearRadioAppData *radioApp) {
    if (radioApp->pokegear->cursorInAppSwitchZone == TRUE) {
        PokegearAppSwitchCursor_SetCursorSpritesDrawState(radioApp->pokegear->appSwitch, 0, TRUE);
        PokegearAppSwitch_SetSpecIndexAndCursorPos(radioApp->pokegear->appSwitch, 0, ov100_021E5DC8(radioApp->pokegear));
    } else {
        PokegearAppSwitchCursor_SetCursorSpritesDrawState(radioApp->pokegear->appSwitch, 0, FALSE);
    }
}
