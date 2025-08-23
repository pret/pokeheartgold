#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0271.h"

#include "font.h"
#include "gf_gfx_loader.h"
#include "render_text.h"
#include "text.h"
#include "unk_0208805C.h"

static const WindowTemplate sWindowTemplates[] = {
    {
     .bgId = GF_BG_LYR_SUB_2,
     .left = 2,
     .top = 19,
     .width = 27,
     .height = 4,
     .palette = 1,
     .baseTile = 0x375,
     },
    {
     .bgId = GF_BG_LYR_SUB_2,
     .left = 4,
     .top = 16,
     .width = 9,
     .height = 2,
     .palette = 1,
     .baseTile = 0x363,
     },
    {
     .bgId = GF_BG_LYR_MAIN_3,
     .left = 1,
     .top = 2,
     .width = 27,
     .height = 24,
     .palette = 2,
     .baseTile = 0x177,
     },
    {
     .bgId = GF_BG_LYR_MAIN_1,
     .left = 0,
     .top = 21,
     .width = 32,
     .height = 2,
     .palette = 10,
     .baseTile = 0x3BF,
     },
};

static const UnmanagedSpriteTemplate sSpriteTemplates[] = {
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animation = 2,
     .drawPriority = 1,
     .pal = 6,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animation = 3,
     .drawPriority = 1,
     .pal = 6,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animation = 4,
     .drawPriority = 1,
     .pal = 6,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animation = 5,
     .drawPriority = 1,
     .pal = 6,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 124,
     .y = 8,
     .z = 0,
     .animation = 0,
     .drawPriority = 1,
     .pal = 7,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 124,
     .y = 156,
     .z = 0,
     .animation = 1,
     .drawPriority = 1,
     .pal = 7,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animation = 6,
     .drawPriority = 1,
     .pal = 7,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 128,
     .y = 160,
     .z = 0,
     .animation = 8,
     .drawPriority = 1,
     .pal = 6,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 1,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
};

const PokegearPhoneContextMenuParam sContextMenuParam[] = {
    // Call; Sort; Quit
    {
     .nItems = 3,
     .width = 16,
     .baseMsg = msg_0271_00000,
     .x = 13,
     .y = 9,
     },
    // Title; Alphabet; Location; Move; Quit
    {
     .nItems = 5,
     .width = 16,
     .baseMsg = msg_0271_00003,
     .x = 13,
     .y = 3,
     },
    // Save some money; Don't save money
    {
     .nItems = 2,
     .width = 22,
     .baseMsg = msg_0271_00008,
     .x = 7,
     .y = 11,
     },
    // Evaluate Pokédex; Quit
    {
     .nItems = 2,
     .width = 22,
     .baseMsg = msg_0271_00010,
     .x = 7,
     .y = 11,
     },
    // Evaluate Johto Pokédex; Evaluate National Pokédex; Quit
    {
     .nItems = 3,
     .width = 22,
     .baseMsg = msg_0271_00012,
     .x = 7,
     .y = 9,
     },
    // Evaluate National Pokédex; Quit
    {
     .nItems = 2,
     .width = 22,
     .baseMsg = msg_0271_00015,
     .x = 7,
     .y = 11,
     },
    // Yes; No
    {
     .nItems = 2,
     .width = 16,
     .baseMsg = msg_0271_00018,
     .x = 13,
     .y = 11,
     },
};

void ov101_021F017C(PokegearPhoneAppData *phoneApp) {
    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_0, GX_BG0_AS_2D);

    BgTemplate sBgTemplates[6] = {
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
         .mosaic = 0,
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
         .mosaic = 0,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xe000,
         .charBase = GX_BG_CHARBASE_0x10000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 3,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = 0,
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
         .mosaic = 0,
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
         .mosaic = 0,
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
         .mosaic = 0,
         },
    };

    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, &sBgTemplates[0], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, &sBgTemplates[1], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, &sBgTemplates[2], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, &sBgTemplates[3], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, &sBgTemplates[4], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, &sBgTemplates[5], GF_BG_TYPE_TEXT, FALSE);
    for (int i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(phoneApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_MAIN_1, 0x20, 0, phoneApp->heapID);
        BgClearTilemapBufferAndCommit(phoneApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_SUB_1, 0x20, 0, phoneApp->heapID);
    }
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    BgSetPosTextAndCommit(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0x20);
}

void ov101_021F0260(PokegearPhoneAppData *phoneApp) {
    SetBgPriority(GF_BG_LYR_MAIN_0, 0);
    BgSetPosTextAndCommit(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
    Pokegear_ClearAppBgLayers(phoneApp->pokegear);
}

void ov101_021F0284(PokegearPhoneAppData *phoneApp) {
    FontID_Alloc(4, phoneApp->heapID);
    NARC *narc = NARC_New(NARC_a_1_4_6, phoneApp->heapID);
    BgConfig_LoadAssetFromOpenNarc(phoneApp->pokegear->bgConfig, phoneApp->heapID, narc, NARC_a_1_4_6, phoneApp->backgroundStyle + 28, GF_BG_LYR_MAIN_2, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(phoneApp->pokegear->bgConfig, phoneApp->heapID, narc, NARC_a_1_4_6, phoneApp->backgroundStyle + 16, GF_BG_LYR_SUB_3, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(phoneApp->pokegear->bgConfig, phoneApp->heapID, narc, NARC_a_1_4_6, phoneApp->backgroundStyle + 22, GF_BG_LYR_SUB_3, GF_BG_GFX_TYPE_SCRN, 0, 0);
    phoneApp->pNscrFile = GfGfxLoader_GetScrnDataFromOpenNarc(narc, phoneApp->backgroundStyle + 34, FALSE, &phoneApp->screenData, phoneApp->heapID);
    CopyToBgTilemapRect(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 32, 20, phoneApp->screenData->rawData, 0, 0, phoneApp->screenData->screenWidth / 8, phoneApp->screenData->screenHeight / 8);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
}

void ov101_021F0370(PokegearPhoneAppData *phoneApp) {
    Heap_Free(phoneApp->pNscrFile);
    FontID_Release(4);
}

void ov101_021F0388(PokegearPhoneAppData *phoneApp) {
    NARC *narc = NARC_New(NARC_a_1_4_6, phoneApp->heapID);
    PaletteData_LoadFromOpenNarc(phoneApp->pokegear->plttData, narc, phoneApp->backgroundStyle + 10, phoneApp->heapID, PLTTBUF_MAIN_BG, 0x1C0, 0, 0);
    PaletteData_LoadFromOpenNarc(phoneApp->pokegear->plttData, narc, phoneApp->backgroundStyle + 4, phoneApp->heapID, PLTTBUF_SUB_BG, 0x180, 0, 0);
    PaletteData_LoadFromOpenNarc(phoneApp->pokegear->plttData, narc, 0, phoneApp->heapID, PLTTBUF_MAIN_OBJ, 0x160, 0x40, 0);
    PaletteData_LoadFromOpenNarc(phoneApp->pokegear->plttData, narc, 0, phoneApp->heapID, PLTTBUF_SUB_OBJ, 0x160, 0x40, 0);
    PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, TRUE);
    PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, RGB_BLACK);
    PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, RGB_BLACK);
    PaletteData_PushTransparentBuffers(phoneApp->pokegear->plttData);
    PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, FALSE);
    NARC_Delete(narc);
}

void PokegearPhone_SetTouchscreenDimState(PokegearPhoneAppData *phoneApp, BOOL shouldDim) {
    Sprite_SetDrawFlag(phoneApp->sprites[13], shouldDim);
    FillWindowPixelBuffer(&phoneApp->windows[0], 0);
    FillWindowPixelBuffer(&phoneApp->windows[1], 0);
    if (shouldDim) {
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xB0, 8, RGB_BLACK);
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0xE0, 0x20, 8, RGB_BLACK);
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x60, 0x20, 8, RGB_BLACK);
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0, 0x40, 8, RGB_BLACK);
        AddTextPrinterParameterizedWithColor(&phoneApp->windows[1], 0, PhoneContact_GetName(phoneApp->callContext, phoneApp->callerID), 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    } else {
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 0, RGB_BLACK);
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0xE0, 0x20, 0, RGB_BLACK);
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 0, RGB_BLACK);
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0, 0x40, 0, RGB_BLACK);
    }
    PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, TRUE);
    PaletteData_PushTransparentBuffers(phoneApp->pokegear->plttData);
    PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, FALSE);
}

void ov101_021F0578(PokegearPhoneAppData *phoneApp) {
    for (int i = 0; i < 4; ++i) {
        AddWindowParameterized(phoneApp->pokegear->bgConfig, &phoneApp->windows[i], sWindowTemplates[i].bgId, sWindowTemplates[i].left, sWindowTemplates[i].top, sWindowTemplates[i].width, sWindowTemplates[i].height, sWindowTemplates[i].palette, sWindowTemplates[i].baseTile);
        FillWindowPixelBuffer(&phoneApp->windows[i], 0);
    }
    TextPrinter_SetDownArrowBaseTile(0x3E1);
}

void ov101_021F05CC(PokegearPhoneAppData *phoneApp) {
    for (int i = 0; i < 4; ++i) {
        ClearWindowTilemapAndCopyToVram(&phoneApp->windows[i]);
        RemoveWindow(&phoneApp->windows[i]);
    }
}

void ov101_021F05EC(PokegearPhoneAppData *phoneApp) {
    phoneApp->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0271_bin, phoneApp->heapID);
    phoneApp->msgFormat = MessageFormat_New_Custom(2, 32, phoneApp->heapID);
    phoneApp->msgFormatBuf = String_New(640, phoneApp->heapID);
    phoneApp->msgReadBuf = String_New(640, phoneApp->heapID);
    for (int i = 0; i < PHONE_TOOLTIP_MAX; ++i) {
        phoneApp->tooltipStrings[i] = NewString_ReadMsgData(phoneApp->msgData, i + msg_0271_00020);
    }
    phoneApp->textFrameDelay = Options_GetTextFrameDelay(phoneApp->pokegear->options);
    TextFlags_SetAlternateDownArrow(TRUE);
    TextFlags_SetCanABSpeedUpPrint(TRUE);
}

void ov101_021F0658(PokegearPhoneAppData *phoneApp) {
    for (int i = 0; i < PHONE_TOOLTIP_MAX; ++i) {
        String_Delete(phoneApp->tooltipStrings[i]);
    }
    String_Delete(phoneApp->msgReadBuf);
    String_Delete(phoneApp->msgFormatBuf);
    MessageFormat_Delete(phoneApp->msgFormat);
    DestroyMsgData(phoneApp->msgData);
    TextFlags_SetAlternateDownArrow(FALSE);
    TextFlags_SetCanABSpeedUpPrint(FALSE);
}

void ov101_021F0694(PokegearPhoneAppData *phoneApp) {
    PokegearPhoneCallContextParam param;
    MI_CpuClear8(&param, sizeof(PokegearPhoneCallContextParam));
    param.heapID = phoneApp->heapID;
    param.menuInputStatePtr = &phoneApp->pokegear->menuInputState;
    param.sprite = phoneApp->sprites[13];
    param.phoneApp = phoneApp;
    param.bgConfig = phoneApp->pokegear->bgConfig;
    param.window1 = &phoneApp->windows[0];
    param.window2 = &phoneApp->windows[1];
    param.plttData = phoneApp->pokegear->plttData;
    param.textSpeed = phoneApp->textFrameDelay;
    param.playerMapSec = phoneApp->pokegear->args->mapID;
    param.playerMapID = phoneApp->pokegear->args->mapHeader;
    param.saveData = phoneApp->pokegear->saveData;
    param.callPersistentState = SaveData_GetPhoneCallPersistentState(phoneApp->pokegear->saveData);
    param.playerProfile = phoneApp->pokegear->profile;
    param.saveVarsFlags = phoneApp->pokegear->saveVarsFlags;
    param.rtc = Save_SysInfo_RTC_Get(phoneApp->pokegear->saveData);
    phoneApp->callContext = PhoneCall_CreateContext(&param);
}

void ov101_021F0720(PokegearPhoneAppData *phoneApp) {
    PhoneCall_DestroyContext(phoneApp->callContext);
}

void ov101_021F072C(PokegearPhoneAppData *phoneApp) {
    PokegearApp_CreateSpriteManager(phoneApp->pokegear, GEAR_APP_PHONE);
    phoneApp->contextMenuSpawner = TouchscreenListMenuSpawner_Create(phoneApp->heapID, phoneApp->pokegear->plttData);
}

void ov101_021F0748(PokegearPhoneAppData *phoneApp) {
    TouchscreenListMenuSpawner_Destroy(phoneApp->contextMenuSpawner);
    PokegearApp_DestroySpriteManager(phoneApp->pokegear);
}

void ov101_021F075C(PokegearPhoneAppData *phoneApp) {
    int i;
    for (i = 0; i <= 5; ++i) {
        phoneApp->sprites[i] = SpriteSystem_CreateSpriteFromResourceHeader(phoneApp->pokegear->spriteSystem, phoneApp->pokegear->spriteManager, &sSpriteTemplates[i]);
        thunk_Sprite_SetPriority(phoneApp->sprites[i], 1);
        Sprite_SetDrawFlag(phoneApp->sprites[i], FALSE);
        Sprite_SetAnimActiveFlag(phoneApp->sprites[i], TRUE);
    }

    for (i = 6; i <= 12; ++i) {
        phoneApp->sprites[i] = SpriteSystem_CreateSpriteFromResourceHeader(phoneApp->pokegear->spriteSystem, phoneApp->pokegear->spriteManager, &sSpriteTemplates[6]);
        thunk_Sprite_SetPriority(phoneApp->sprites[i], 0);
        thunk_Sprite_SetDrawPriority(phoneApp->sprites[i], 0);
        Sprite_SetDrawFlag(phoneApp->sprites[i], FALSE);
        Sprite_SetAnimActiveFlag(phoneApp->sprites[i], FALSE);
        Sprite_SetPositionXY(phoneApp->sprites[i], 12, (int)(i * 24) - 128);
    }

    phoneApp->sprites[13] = SpriteSystem_CreateSpriteFromResourceHeader(phoneApp->pokegear->spriteSystem, phoneApp->pokegear->spriteManager, &sSpriteTemplates[7]);
    thunk_Sprite_SetPriority(phoneApp->sprites[13], 0);
    Sprite_SetDrawFlag(phoneApp->sprites[13], FALSE);
    Sprite_SetAnimActiveFlag(phoneApp->sprites[13], FALSE);
}

void ov101_021F0864(PokegearPhoneAppData *phoneApp) {
    for (int i = 0; i < 14; ++i) {
        thunk_Sprite_Delete(phoneApp->sprites[i]);
    }
}
