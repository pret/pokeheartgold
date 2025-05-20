#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0271.h"

#include "font.h"
#include "gf_gfx_loader.h"
#include "render_text.h"
#include "text.h"
#include "unk_0208805C.h"

static const WindowTemplate ov101_021F8420[] = {
    {
     .bgId = GF_BG_LYR_SUB_2,
     .left = 0x02,
     .top = 0x13,
     .width = 0x1B,
     .height = 0x04,
     .palette = 0x01,
     .baseTile = 0x0375,
     },
    {
     .bgId = GF_BG_LYR_SUB_2,
     .left = 0x04,
     .top = 0x10,
     .width = 0x09,
     .height = 0x02,
     .palette = 0x01,
     .baseTile = 0x0363,
     },
    {
     .bgId = GF_BG_LYR_MAIN_3,
     .left = 0x01,
     .top = 0x02,
     .width = 0x1B,
     .height = 0x18,
     .palette = 0x02,
     .baseTile = 0x0177,
     },
    {
     .bgId = GF_BG_LYR_MAIN_1,
     .left = 0x00,
     .top = 0x15,
     .width = 0x20,
     .height = 0x02,
     .palette = 0x0A,
     .baseTile = 0x03BF,
     },
};

static const UnkStruct_0200D2B4 ov101_021F84E8[] = {
    {
     .resourceSet = 0x00000000,
     .x = 0x0000,
     .y = 0x0000,
     .z = 0x0000,
     .animSeqNo = 0x0002,
     .rotation = 0x00000001,
     .palIndex = 0x00000006,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000000,
     .x = 0x0000,
     .y = 0x0000,
     .z = 0x0000,
     .animSeqNo = 0x0003,
     .rotation = 0x00000001,
     .palIndex = 0x00000006,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000000,
     .x = 0x0000,
     .y = 0x0000,
     .z = 0x0000,
     .animSeqNo = 0x0004,
     .rotation = 0x00000001,
     .palIndex = 0x00000006,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000000,
     .x = 0x0000,
     .y = 0x0000,
     .z = 0x0000,
     .animSeqNo = 0x0005,
     .rotation = 0x00000001,
     .palIndex = 0x00000006,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000000,
     .x = 0x007C,
     .y = 0x0008,
     .z = 0x0000,
     .animSeqNo = 0x0000,
     .rotation = 0x00000001,
     .palIndex = 0x00000007,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000000,
     .x = 0x007C,
     .y = 0x009C,
     .z = 0x0000,
     .animSeqNo = 0x0001,
     .rotation = 0x00000001,
     .palIndex = 0x00000007,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000000,
     .x = 0x0000,
     .y = 0x0000,
     .z = 0x0000,
     .animSeqNo = 0x0006,
     .rotation = 0x00000001,
     .palIndex = 0x00000007,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000000,
     .x = 0x0080,
     .y = 0x00A0,
     .z = 0x0000,
     .animSeqNo = 0x0008,
     .rotation = 0x00000001,
     .palIndex = 0x00000006,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000001,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
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

    BgTemplate ov101_021F8440[6] = {
        {
         .x = 0x00000000,
         .y = 0x00000000,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0x00000000,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xf000,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0x00,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0x00,
         .mosaic = 0x00000000,
         },
        {
         .x = 0x00000000,
         .y = 0x00000000,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0x00000000,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xe800,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0x02,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0x00,
         .mosaic = 0x00000000,
         },
        {
         .x = 0x00000000,
         .y = 0x00000000,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0x00000000,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xe000,
         .charBase = GX_BG_CHARBASE_0x10000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0x03,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0x00,
         .mosaic = 0x00000000,
         },
        {
         .x = 0x00000000,
         .y = 0x00000000,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0x00000000,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xf000,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0x00,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0x00,
         .mosaic = 0x00000000,
         },
        {
         .x = 0x00000000,
         .y = 0x00000000,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0x00000000,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xe800,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0x01,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0x00,
         .mosaic = 0x00000000,
         },
        {
         .x = 0x00000000,
         .y = 0x00000000,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0x00000000,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xe000,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0x02,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0x00,
         .mosaic = 0x00000000,
         },
    };

    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, &ov101_021F8440[0], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, &ov101_021F8440[1], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, &ov101_021F8440[2], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, &ov101_021F8440[3], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, &ov101_021F8440[4], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, &ov101_021F8440[5], GF_BG_TYPE_TEXT, FALSE);
    for (int i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(phoneApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_MAIN_1, 0x20, 0, phoneApp->heapId);
        BgClearTilemapBufferAndCommit(phoneApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_SUB_1, 0x20, 0, phoneApp->heapId);
    }
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    BgSetPosTextAndCommit(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0x20);
}

void ov101_021F0260(PokegearPhoneAppData *phoneApp) {
    SetBgPriority(GF_BG_LYR_MAIN_0, 0);
    BgSetPosTextAndCommit(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
    ov100_021E5CA4(phoneApp->pokegear);
}

void ov101_021F0284(PokegearPhoneAppData *phoneApp) {
    FontID_Alloc(4, phoneApp->heapId);
    NARC *narc = NARC_New(NARC_a_1_4_6, phoneApp->heapId);
    sub_0208820C(phoneApp->pokegear->bgConfig, phoneApp->heapId, narc, NARC_a_1_4_6, phoneApp->backgroundStyle + 28, GF_BG_LYR_MAIN_2, 0, 0, 0);
    sub_0208820C(phoneApp->pokegear->bgConfig, phoneApp->heapId, narc, NARC_a_1_4_6, phoneApp->backgroundStyle + 16, GF_BG_LYR_SUB_3, 0, 0, 0);
    sub_0208820C(phoneApp->pokegear->bgConfig, phoneApp->heapId, narc, NARC_a_1_4_6, phoneApp->backgroundStyle + 22, GF_BG_LYR_SUB_3, 1, 0, 0);
    phoneApp->pNscrFile = GfGfxLoader_GetScrnDataFromOpenNarc(narc, phoneApp->backgroundStyle + 34, FALSE, &phoneApp->screenData, phoneApp->heapId);
    CopyToBgTilemapRect(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 32, 20, phoneApp->screenData->rawData, 0, 0, phoneApp->screenData->screenWidth / 8, phoneApp->screenData->screenHeight / 8);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
}

void ov101_021F0370(PokegearPhoneAppData *phoneApp) {
    FreeToHeap(phoneApp->pNscrFile);
    FontID_Release(4);
}

void ov101_021F0388(PokegearPhoneAppData *phoneApp) {
    NARC *narc = NARC_New(NARC_a_1_4_6, phoneApp->heapId);
    PaletteData_LoadFromOpenNarc(phoneApp->pokegear->plttData, narc, phoneApp->backgroundStyle + 10, phoneApp->heapId, PLTTBUF_MAIN_BG, 0x1C0, 0, 0);
    PaletteData_LoadFromOpenNarc(phoneApp->pokegear->plttData, narc, phoneApp->backgroundStyle + 4, phoneApp->heapId, PLTTBUF_SUB_BG, 0x180, 0, 0);
    PaletteData_LoadFromOpenNarc(phoneApp->pokegear->plttData, narc, 0, phoneApp->heapId, PLTTBUF_MAIN_OBJ, 0x160, 0x40, 0);
    PaletteData_LoadFromOpenNarc(phoneApp->pokegear->plttData, narc, 0, phoneApp->heapId, PLTTBUF_SUB_OBJ, 0x160, 0x40, 0);
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
        AddWindowParameterized(phoneApp->pokegear->bgConfig, &phoneApp->windows[i], ov101_021F8420[i].bgId, ov101_021F8420[i].left, ov101_021F8420[i].top, ov101_021F8420[i].width, ov101_021F8420[i].height, ov101_021F8420[i].palette, ov101_021F8420[i].baseTile);
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
    phoneApp->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0271_bin, phoneApp->heapId);
    phoneApp->msgFormat = MessageFormat_New_Custom(2, 32, phoneApp->heapId);
    phoneApp->msgFormatBuf = String_New(640, phoneApp->heapId);
    phoneApp->msgReadBuf = String_New(640, phoneApp->heapId);
    for (int i = 0; i < 8; ++i) {
        phoneApp->contextMenuStrings[i] = NewString_ReadMsgData(phoneApp->msgData, i + msg_0271_00020);
    }
    phoneApp->textFrameDelay = Options_GetTextFrameDelay(phoneApp->pokegear->options);
    TextFlags_SetAlternateDownArrow(TRUE);
    TextFlags_SetCanABSpeedUpPrint(TRUE);
}

void ov101_021F0658(PokegearPhoneAppData *phoneApp) {
    for (int i = 0; i < 8; ++i) {
        String_Delete(phoneApp->contextMenuStrings[i]);
    }
    String_Delete(phoneApp->msgReadBuf);
    String_Delete(phoneApp->msgFormatBuf);
    MessageFormat_Delete(phoneApp->msgFormat);
    DestroyMsgData(phoneApp->msgData);
    TextFlags_SetAlternateDownArrow(FALSE);
    TextFlags_SetCanABSpeedUpPrint(FALSE);
}

void ov101_021F0694(PokegearPhoneAppData *phoneApp) {
    PokegearPhoneCallContextParam sp00;
    MI_CpuClear8(&sp00, sizeof(PokegearPhoneCallContextParam));
    sp00.heapId = phoneApp->heapId;
    sp00.menuInputStatePtr = &phoneApp->pokegear->menuInputState;
    sp00.sprite = phoneApp->sprites[13];
    sp00.phoneApp = phoneApp;
    sp00.bgConfig = phoneApp->pokegear->bgConfig;
    sp00.window1 = &phoneApp->windows[0];
    sp00.window2 = &phoneApp->windows[1];
    sp00.plttData = phoneApp->pokegear->plttData;
    sp00.textSpeed = phoneApp->textFrameDelay;
    sp00.playerMapSec = phoneApp->pokegear->args->mapID;
    sp00.playerMapID = phoneApp->pokegear->args->mapHeader;
    sp00.saveData = phoneApp->pokegear->saveData;
    sp00.momsSavings = SaveData_GetMomsSavingsAddr(phoneApp->pokegear->saveData);
    sp00.playerProfile = phoneApp->pokegear->profile;
    sp00.saveVarsFlags = phoneApp->pokegear->saveVarsFlags;
    sp00.rtc = Save_SysInfo_RTC_Get(phoneApp->pokegear->saveData);
    phoneApp->callContext = PhoneCall_CreateContext(&sp00);
}

void ov101_021F0720(PokegearPhoneAppData *phoneApp) {
    PhoneCall_DestroyContext(phoneApp->callContext);
}

void ov101_021F072C(PokegearPhoneAppData *phoneApp) {
    ov100_021E6978(phoneApp->pokegear, 3);
    phoneApp->contextMenuSpawner = TouchscreenListMenuSpawner_Create(phoneApp->heapId, phoneApp->pokegear->plttData);
}

void ov101_021F0748(PokegearPhoneAppData *phoneApp) {
    TouchscreenListMenuSpawner_Destroy(phoneApp->contextMenuSpawner);
    ov100_021E69C8(phoneApp->pokegear);
}

void ov101_021F075C(PokegearPhoneAppData *phoneApp) {
    int i;
    for (i = 0; i <= 5; ++i) {
        phoneApp->sprites[i] = SpriteSystem_CreateSpriteFromResourceHeader(phoneApp->pokegear->gfxRenderer, phoneApp->pokegear->gfxHandler, &ov101_021F84E8[i]);
        thunk_Sprite_SetPriority(phoneApp->sprites[i], 1);
        Sprite_SetDrawFlag(phoneApp->sprites[i], FALSE);
        Sprite_SetAnimActiveFlag(phoneApp->sprites[i], TRUE);
    }

    for (i = 6; i <= 12; ++i) {
        phoneApp->sprites[i] = SpriteSystem_CreateSpriteFromResourceHeader(phoneApp->pokegear->gfxRenderer, phoneApp->pokegear->gfxHandler, &ov101_021F84E8[6]);
        thunk_Sprite_SetPriority(phoneApp->sprites[i], 0);
        thunk_Sprite_SetDrawPriority(phoneApp->sprites[i], 0);
        Sprite_SetDrawFlag(phoneApp->sprites[i], FALSE);
        Sprite_SetAnimActiveFlag(phoneApp->sprites[i], FALSE);
        Sprite_SetPositionXY(phoneApp->sprites[i], 12, (int)(i * 24) - 128);
    }

    phoneApp->sprites[13] = SpriteSystem_CreateSpriteFromResourceHeader(phoneApp->pokegear->gfxRenderer, phoneApp->pokegear->gfxHandler, &ov101_021F84E8[7]);
    thunk_Sprite_SetPriority(phoneApp->sprites[13], 0);
    Sprite_SetDrawFlag(phoneApp->sprites[13], FALSE);
    Sprite_SetAnimActiveFlag(phoneApp->sprites[13], FALSE);
}

void ov101_021F0864(PokegearPhoneAppData *phoneApp) {
    for (int i = 0; i < 14; ++i) {
        thunk_Sprite_Delete(phoneApp->sprites[i]);
    }
}
