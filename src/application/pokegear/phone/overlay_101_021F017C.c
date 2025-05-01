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

const UnkStruct_ov101_021F8404 ov101_021F8404[] = {
    {
     // Call; Sort; Quit
        3,
     16,
     msg_0271_00000,
     0x0D,
     0x09,
     },
    {
     // Title; Alphabet; Location; Move; Quit
        5,
     16,
     msg_0271_00003,
     0x0D,
     0x03,
     },
    {
     // Save some money; Don't save money
        2,
     22,
     msg_0271_00008,
     0x07,
     0x0B,
     },
    {
     // Evaluate Pokédex; Quit
        2,
     22,
     msg_0271_00010,
     0x07,
     0x0B,
     },
    {
     // Evaluate Johto Pokédex; Evaluate National Pokédex; Quit
        3,
     22,
     msg_0271_00012,
     0x07,
     0x09,
     },
    {
     // Evaluate National Pokédex; Quit
        2,
     22,
     msg_0271_00015,
     0x07,
     0x0B,
     },
    {
     // Yes; No
        2,
     16,
     msg_0271_00018,
     0x0D,
     0x0B,
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
    sub_0208820C(phoneApp->pokegear->bgConfig, phoneApp->heapId, narc, NARC_a_1_4_6, phoneApp->unk_011 + 28, GF_BG_LYR_MAIN_2, 0, 0, 0);
    sub_0208820C(phoneApp->pokegear->bgConfig, phoneApp->heapId, narc, NARC_a_1_4_6, phoneApp->unk_011 + 16, GF_BG_LYR_SUB_3, 0, 0, 0);
    sub_0208820C(phoneApp->pokegear->bgConfig, phoneApp->heapId, narc, NARC_a_1_4_6, phoneApp->unk_011 + 22, GF_BG_LYR_SUB_3, 1, 0, 0);
    phoneApp->unk_508 = GfGfxLoader_GetScrnDataFromOpenNarc(narc, phoneApp->unk_011 + 34, FALSE, &phoneApp->unk_50C, phoneApp->heapId);
    CopyToBgTilemapRect(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 32, 20, phoneApp->unk_50C->rawData, 0, 0, phoneApp->unk_50C->screenWidth / 8, phoneApp->unk_50C->screenHeight / 8);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
}

void ov101_021F0370(PokegearPhoneAppData *phoneApp) {
    FreeToHeap(phoneApp->unk_508);
    FontID_Release(4);
}

void ov101_021F0388(PokegearPhoneAppData *phoneApp) {
    NARC *narc = NARC_New(NARC_a_1_4_6, phoneApp->heapId);
    PaletteData_LoadFromOpenNarc(phoneApp->pokegear->plttData, narc, phoneApp->unk_011 + 10, phoneApp->heapId, PLTTBUF_MAIN_BG, 0x1C0, 0, 0);
    PaletteData_LoadFromOpenNarc(phoneApp->pokegear->plttData, narc, phoneApp->unk_011 + 4, phoneApp->heapId, PLTTBUF_SUB_BG, 0x180, 0, 0);
    PaletteData_LoadFromOpenNarc(phoneApp->pokegear->plttData, narc, 0, phoneApp->heapId, PLTTBUF_MAIN_OBJ, 0x160, 0x40, 0);
    PaletteData_LoadFromOpenNarc(phoneApp->pokegear->plttData, narc, 0, phoneApp->heapId, PLTTBUF_SUB_OBJ, 0x160, 0x40, 0);
    PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, TRUE);
    PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, RGB_BLACK);
    PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, RGB_BLACK);
    PaletteData_PushTransparentBuffers(phoneApp->pokegear->plttData);
    PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, FALSE);
    NARC_Delete(narc);
}

void ov101_021F0464(PokegearPhoneAppData *phoneApp, BOOL a1) {
    Sprite_SetVisibleFlag(phoneApp->unk_088[13], a1);
    FillWindowPixelBuffer(&phoneApp->unk_048[0], 0);
    FillWindowPixelBuffer(&phoneApp->unk_048[1], 0);
    if (a1) {
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xB0, 8, RGB_BLACK);
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0xE0, 0x20, 8, RGB_BLACK);
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x60, 0x20, 8, RGB_BLACK);
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0, 0x40, 8, RGB_BLACK);
        AddTextPrinterParameterizedWithColor(&phoneApp->unk_048[1], 0, PhoneContact_GetName(phoneApp->unk_0C4, phoneApp->callerID), 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
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
        AddWindowParameterized(phoneApp->pokegear->bgConfig, &phoneApp->unk_048[i], ov101_021F8420[i].bgId, ov101_021F8420[i].left, ov101_021F8420[i].top, ov101_021F8420[i].width, ov101_021F8420[i].height, ov101_021F8420[i].palette, ov101_021F8420[i].baseTile);
        FillWindowPixelBuffer(&phoneApp->unk_048[i], 0);
    }
    TextPrinter_SetDownArrowBaseTile(0x3E1);
}

void ov101_021F05CC(PokegearPhoneAppData *phoneApp) {
    for (int i = 0; i < 4; ++i) {
        ClearWindowTilemapAndCopyToVram(&phoneApp->unk_048[i]);
        RemoveWindow(&phoneApp->unk_048[i]);
    }
}

void ov101_021F05EC(PokegearPhoneAppData *phoneApp) {
    phoneApp->unk_014 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0271_bin, phoneApp->heapId);
    phoneApp->unk_018 = MessageFormat_New_Custom(2, 32, phoneApp->heapId);
    phoneApp->unk_01C = String_New(640, phoneApp->heapId);
    phoneApp->unk_020 = String_New(640, phoneApp->heapId);
    for (int i = 0; i < 8; ++i) {
        phoneApp->unk_024[i] = NewString_ReadMsgData(phoneApp->unk_014, i + msg_0271_00020);
    }
    phoneApp->unk_044 = Options_GetTextFrameDelay(phoneApp->pokegear->options);
    TextFlags_SetAlternateDownArrow(TRUE);
    TextFlags_SetCanABSpeedUpPrint(TRUE);
}

void ov101_021F0658(PokegearPhoneAppData *phoneApp) {
    for (int i = 0; i < 8; ++i) {
        String_Delete(phoneApp->unk_024[i]);
    }
    String_Delete(phoneApp->unk_020);
    String_Delete(phoneApp->unk_01C);
    MessageFormat_Delete(phoneApp->unk_018);
    DestroyMsgData(phoneApp->unk_014);
    TextFlags_SetAlternateDownArrow(FALSE);
    TextFlags_SetCanABSpeedUpPrint(FALSE);
}

void ov101_021F0694(PokegearPhoneAppData *phoneApp) {
    PokegearPhoneApp_Sub0C4Template sp00;
    MI_CpuClear8(&sp00, sizeof(PokegearPhoneApp_Sub0C4Template));
    sp00.heapId = phoneApp->heapId;
    sp00.menuInputStatePtr = &phoneApp->pokegear->unk_00C;
    sp00.sprite = phoneApp->unk_088[13];
    sp00.phoneApp = phoneApp;
    sp00.bgConfig = phoneApp->pokegear->bgConfig;
    sp00.window1 = &phoneApp->unk_048[0];
    sp00.window2 = &phoneApp->unk_048[1];
    sp00.plttData = phoneApp->pokegear->plttData;
    sp00.textSpeed = phoneApp->unk_044;
    sp00.playerMapSec = phoneApp->pokegear->args->mapID;
    sp00.playerMapID = phoneApp->pokegear->args->mapHeader;
    sp00.saveData = phoneApp->pokegear->saveData;
    sp00.momsSavings = SaveData_GetMomsSavingsAddr(phoneApp->pokegear->saveData);
    sp00.playerProfile = phoneApp->pokegear->profile;
    sp00.saveVarsFlags = phoneApp->pokegear->saveVarsFlags;
    sp00.rtc = Save_SysInfo_RTC_Get(phoneApp->pokegear->saveData);
    phoneApp->unk_0C4 = ov101_021F1D74(&sp00);
}

void ov101_021F0720(PokegearPhoneAppData *phoneApp) {
    ov101_021F1E80(phoneApp->unk_0C4);
}

void ov101_021F072C(PokegearPhoneAppData *phoneApp) {
    ov100_021E6978(phoneApp->pokegear, 3);
    phoneApp->unk_0C0 = TouchscreenListMenuSpawner_Create(phoneApp->heapId, phoneApp->pokegear->plttData);
}

void ov101_021F0748(PokegearPhoneAppData *phoneApp) {
    TouchscreenListMenuSpawner_Destroy(phoneApp->unk_0C0);
    ov100_021E69C8(phoneApp->pokegear);
}

void ov101_021F075C(PokegearPhoneAppData *phoneApp) {
    int i;
    for (i = 0; i <= 5; ++i) {
        phoneApp->unk_088[i] = SpriteRenderer_CreateSprite(phoneApp->pokegear->gfxRenderer, phoneApp->pokegear->gfxHandler, &ov101_021F84E8[i]);
        thunk_Sprite_SetPriority(phoneApp->unk_088[i], 1);
        Sprite_SetVisibleFlag(phoneApp->unk_088[i], FALSE);
        Sprite_SetAnimActiveFlag(phoneApp->unk_088[i], TRUE);
    }

    for (i = 6; i <= 12; ++i) {
        phoneApp->unk_088[i] = SpriteRenderer_CreateSprite(phoneApp->pokegear->gfxRenderer, phoneApp->pokegear->gfxHandler, &ov101_021F84E8[6]);
        thunk_Sprite_SetPriority(phoneApp->unk_088[i], 0);
        thunk_Sprite_SetDrawPriority(phoneApp->unk_088[i], 0);
        Sprite_SetVisibleFlag(phoneApp->unk_088[i], FALSE);
        Sprite_SetAnimActiveFlag(phoneApp->unk_088[i], FALSE);
        Sprite_SetPositionXY(phoneApp->unk_088[i], 12, (int)(i * 24) - 128);
    }

    phoneApp->unk_088[13] = SpriteRenderer_CreateSprite(phoneApp->pokegear->gfxRenderer, phoneApp->pokegear->gfxHandler, &ov101_021F84E8[7]);
    thunk_Sprite_SetPriority(phoneApp->unk_088[13], 0);
    Sprite_SetVisibleFlag(phoneApp->unk_088[13], FALSE);
    Sprite_SetAnimActiveFlag(phoneApp->unk_088[13], FALSE);
}

void ov101_021F0864(PokegearPhoneAppData *phoneApp) {
    for (int i = 0; i < 14; ++i) {
        thunk_Sprite_Delete(phoneApp->unk_088[i]);
    }
}
