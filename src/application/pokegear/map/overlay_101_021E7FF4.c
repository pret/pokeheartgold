#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0273.h"

#include "gf_gfx_loader.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_0208805C.h"

void PokegearMap_InitBGs(PokegearMapAppData *mapApp);
void PokegearMap_UnloadBGs(PokegearMapAppData *mapApp);
void PokegearMap_LoadGraphics(PokegearMapAppData *mapApp, u8 a1);
void PokegearMap_UnloadGraphics(PokegearMapAppData *mapApp);
void ov101_021E84FC(PokegearMapAppData *mapApp);
void ov101_021E857C(PokegearMapAppData *mapApp);
void ov101_021E85A8(PokegearMapAppData *mapApp);
void ov101_021E862C(PokegearMapAppData *mapApp);
void ov101_021E8674(PokegearMapAppData *mapApp);
void ov101_021E8774(PokegearMapAppData *mapApp);
void ov101_021E8790(PokegearMapAppData *mapApp, u8 a1);
void ov101_021E886C(PokegearMapAppData *mapApp);
void ov101_021E88A8(PokegearMapAppData *mapApp);
void ov101_021E88D8(PokegearMapAppData *mapApp);
void ov101_021E8A88(PokegearMapAppData *mapApp);
void ov101_021E8AE4(PokegearMapAppData *mapApp);
void ov101_021E8BB8(PokegearMapAppData *mapApp);
void ov101_021E8BE8(PokegearMapAppData *mapApp);
void ov101_021E8E20(PokegearMapAppData *mapApp);
void ov101_021E8E34(PokegearMapAppData *mapApp);
void ov101_021E8E3C(PokegearMapAppData *mapApp);
void ov101_021E8E4C(PokegearMapAppData *mapApp);
void ov101_021E8E58(PokegearMapAppData *mapApp);
void ov101_021E90A8(PokegearMapAppData *mapApp);
void ov101_021E9264(PokegearMapAppData *mapApp, int a1);

BOOL PokegearMap_GraphicsInit(PokegearMapAppData *mapApp) {
    switch (mapApp->substate) {
    case 0:
        PokegearMap_InitBGs(mapApp);
        break;
    case 1:
        PokegearMap_LoadGraphics(mapApp, mapApp->pokegear->unk_008);
        ov101_021E84FC(mapApp);
        ov101_021E85A8(mapApp);
        break;
    case 2:
        ov101_021E886C(mapApp);
        ov101_021E8790(mapApp, mapApp->pokegear->unk_008);
        ov101_021E8E34(mapApp);
        break;
    case 3:
        if (mapApp->unk_00C == 1) {
            ov101_021E90A8(mapApp);
        } else {
            ov101_021E8E58(mapApp);
        }
        mapApp->pokegear->unk_058 = ov101_021E9270;
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

BOOL PokegearMaps_GraphicsDeinit(PokegearMapAppData *mapApp) {
    mapApp->pokegear->unk_058 = NULL;
    if (mapApp->pokegear->appReturnCode == GEAR_RETURN_CANCEL) {
        ov101_021E8774(mapApp);
        ov101_021E8E20(mapApp);
    }
    ov101_021E8E4C(mapApp);
    ov101_021E88A8(mapApp);
    ov101_021E862C(mapApp);
    ov101_021E857C(mapApp);
    PokegearMap_UnloadGraphics(mapApp);
    PokegearMap_UnloadBGs(mapApp);
    return TRUE;
}

BOOL ov101_021E80B4(PokegearMapAppData *mapApp) {
    BOOL r5;
    BOOL r0;

    switch (mapApp->substate) {
    case 0:
        ov101_021E933C(mapApp);
        ov101_021E9D74(mapApp, 1);
        BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 6, 1, mapApp->heapId);
        break;
    case 1:
        r5 = IsPaletteFadeFinished();
        r0 = ov101_021E9E90(mapApp, 1);
        if (!r5 || !r0) {
            return FALSE;
        }
        ov101_021E8E3C(mapApp);
        break;
    case 2:
        ov101_021E9264(mapApp, 1);
        ov101_021E90A8(mapApp);
        BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 6, 1, mapApp->heapId);
        ov101_021E9FDC(mapApp, 0);
        break;
    case 3:
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        PlaySE(SEQ_SE_GS_GEARYBUTTON);
        break;
    case 4:
        if (!ov101_021EA0D8(mapApp, 0)) {
            return FALSE;
        }
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

BOOL ov101_021E818C(PokegearMapAppData *mapApp) {
    BOOL r5;
    BOOL r0;

    switch (mapApp->substate) {
    case 0:
        ov101_021E9FDC(mapApp, 1);
        PlaySE(SEQ_SE_GS_GEARYBUTTON);
        break;
    case 1:
        if (!ov101_021EA0D8(mapApp, 1)) {
            return FALSE;
        }
        BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 6, 1, mapApp->heapId);
        break;
    case 2:
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        ov101_021E8774(mapApp);
        ov101_021E8E20(mapApp);
        break;
    case 3:
        ov101_021E9264(mapApp, 0);
        ov101_021E8E58(mapApp);
        ov101_021E9D74(mapApp, 0);
        BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 6, 1, mapApp->heapId);
        break;
    case 4:
        r5 = IsPaletteFadeFinished();
        r0 = ov101_021E9E90(mapApp, 0);
        if (!r5 || !r0) {
            return FALSE;
        }
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

void PokegearMap_InitBGs(PokegearMapAppData *mapApp) {
    int i;

    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_5, GX_BG0_AS_2D);

    {
        BgTemplate bgTemplates[6] = {
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
             .mosaic = 0,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_512x512_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_512x512,
             .colorMode = GX_BG_COLORMODE_256,
             .screenBase = GX_BG_SCRBASE_0xd000,
             .charBase = GX_BG_CHARBASE_0x10000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 2,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0,
             .mosaic = 0,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_512x512_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_512x512,
             .colorMode = GX_BG_COLORMODE_256,
             .screenBase = GX_BG_SCRBASE_0xb000,
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
             .charBase = GX_BG_CHARBASE_0x10000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 2,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0,
             .mosaic = 0,
             },
        }; // ov101_021F7D10

        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplates[0], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplates[1], GF_BG_TYPE_256x16PLTT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplates[2], GF_BG_TYPE_256x16PLTT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, &bgTemplates[3], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, &bgTemplates[4], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, &bgTemplates[5], GF_BG_TYPE_TEXT, FALSE);
    }

    for (i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_MAIN_1, 0x40, 0, mapApp->heapId);
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_SUB_1, 0x20, 0, mapApp->heapId);
        BgCommitTilemapBufferToVram(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BgCommitTilemapBufferToVram(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
    }
}

void PokegearMap_UnloadBGs(PokegearMapAppData *mapApp) {
    Pokegear_ClearAppBgLayers(mapApp->pokegear);
    G2_SetBlendAlpha(0, 0, 0, 0);
}

void PokegearMap_LoadGraphics(PokegearMapAppData *mapApp, u8 a1) {
    NARC *narc = NARC_New(NARC_a_1_4_4, mapApp->heapId);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, a1 + 26, GF_BG_LYR_MAIN_1, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 10, GF_BG_LYR_MAIN_2, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, a1 + 50, GF_BG_LYR_SUB_2, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 12, GF_BG_LYR_SUB_3, 0, 0, 0);
    mapApp->unk_154[0] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, a1 + 56, FALSE, &mapApp->unk_16C, mapApp->heapId);
    mapApp->unk_154[1] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 11, FALSE, &mapApp->unk_170, mapApp->heapId);
    mapApp->unk_154[2] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 13, FALSE, &mapApp->unk_174, mapApp->heapId);
    mapApp->unk_154[3] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, a1 + 32, FALSE, &mapApp->unk_178, mapApp->heapId);
    mapApp->unk_154[4] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, a1 + 38, FALSE, &mapApp->unk_17C, mapApp->heapId);
    mapApp->unk_154[5] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, a1 + 44, FALSE, &mapApp->unk_180, mapApp->heapId);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

void PokegearMap_UnloadGraphics(PokegearMapAppData *mapApp) {
    FreeToHeap(mapApp->unk_154[5]);
    FreeToHeap(mapApp->unk_154[4]);
    FreeToHeap(mapApp->unk_154[3]);
    FreeToHeap(mapApp->unk_154[2]);
    FreeToHeap(mapApp->unk_154[1]);
    FreeToHeap(mapApp->unk_154[0]);
}

const WindowTemplate ov101_021F7B64[] = {
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x01,
     .top = 0x08,
     .width = 0x05,
     .height = 0x03,
     .palette = 0x01,
     .baseTile = 0x03F0,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x03,
     .top = 0x0C,
     .width = 0x0C,
     .height = 0x02,
     .palette = 0x01,
     .baseTile = 0x03D8,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x01,
     .top = 0x0E,
     .width = 0x1C,
     .height = 0x04,
     .palette = 0x01,
     .baseTile = 0x0368,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x05,
     .top = 0x12,
     .width = 0x0B,
     .height = 0x05,
     .palette = 0x01,
     .baseTile = 0x0331,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x12,
     .top = 0x12,
     .width = 0x0B,
     .height = 0x05,
     .palette = 0x01,
     .baseTile = 0x02FA,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x05,
     .top = 0x14,
     .width = 0x0B,
     .height = 0x02,
     .palette = 0x01,
     .baseTile = 0x02E4,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x12,
     .top = 0x16,
     .width = 0x0B,
     .height = 0x02,
     .palette = 0x01,
     .baseTile = 0x02CE,
     },
    {
     .bgId = GF_BG_LYR_MAIN_1,
     .left = 0x03,
     .top = 0x00,
     .width = 0x0C,
     .height = 0x03,
     .palette = 0x0A,
     .baseTile = 0x03DB,
     },
};

void ov101_021E84FC(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i <= 7; ++i) {
        AddWindowParameterized(mapApp->pokegear->bgConfig, &mapApp->windows[i], ov101_021F7B64[i].bgId, ov101_021F7B64[i].left, ov101_021F7B64[i].top, ov101_021F7B64[i].width, ov101_021F7B64[i].height, ov101_021F7B64[i].palette, ov101_021F7B64[i].baseTile);
        FillWindowPixelBuffer(&mapApp->windows[i], 0);
    }
    InitWindow(&mapApp->windows[8]);
    AddTextWindowTopLeftCorner(mapApp->pokegear->bgConfig, &mapApp->windows[8], 11, 2, 0x3C5, 0);
    FillWindowPixelBufferText_AssumeTileSize32(&mapApp->windows[8], 0);
}

void ov101_021E857C(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 8; ++i) {
        ClearWindowTilemapAndCopyToVram(&mapApp->windows[i]);
        RemoveWindow(&mapApp->windows[i]);
    }
    RemoveWindow(&mapApp->windows[8]);
}

void ov101_021E85A8(PokegearMapAppData *mapApp) {
    mapApp->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0273_bin, mapApp->heapId);
    mapApp->msgFormat = MessageFormat_New_Custom(2, 91, mapApp->heapId);
    mapApp->flavorTextString = String_New(91, mapApp->heapId);
    mapApp->regionNameStrings[0] = NewString_ReadMsgData(mapApp->msgData, msg_0273_00001);
    mapApp->regionNameStrings[1] = NewString_ReadMsgData(mapApp->msgData, msg_0273_00000);
    mapApp->mapNameString = String_New(40, mapApp->heapId);
    mapApp->formatFlavorTextString = NewString_ReadMsgData(mapApp->msgData, msg_0273_00003);
    mapApp->unk_0B8 = 2;
}

void ov101_021E862C(PokegearMapAppData *mapApp) {
    String_Delete(mapApp->formatFlavorTextString);
    String_Delete(mapApp->mapNameString);
    String_Delete(mapApp->regionNameStrings[1]);
    String_Delete(mapApp->regionNameStrings[0]);
    String_Delete(mapApp->flavorTextString);
    MessageFormat_Delete(mapApp->msgFormat);
    DestroyMsgData(mapApp->msgData);
}

const PokegearAppSwitchButtonSpec ov101_021F7B30 = {
    .appId = 0,
    .buttonLeft = 0xFF,
    .buttonRight = 0xFF,
    .buttonUp = 0xFF,
    .buttonDown = 0xFF,
    .x = 0x48,
    .y = 0x54,
    .leftOffset = -18,
    .rightOffset = 18,
    .topOffset = -12,
    .bottomOffset = 6,
};

const PokegearAppSwitchButtonSpec ov101_021F7BA4[8] = {
    {
     .appId = 0,
     .buttonLeft = 0x07,
     .buttonRight = 0x01,
     .buttonUp = 0xFF,
     .buttonDown = 0xFF,
     .x = 0x28,
     .y = 0x84,
     .leftOffset = -8,
     .rightOffset = 8,
     .topOffset = -8,
     .bottomOffset = 8,
     },
    {
     .appId = 1,
     .buttonLeft = 0x00,
     .buttonRight = 0x02,
     .buttonUp = 0xFF,
     .buttonDown = 0xFF,
     .x = 0x40,
     .y = 0x84,
     .leftOffset = -8,
     .rightOffset = 8,
     .topOffset = -8,
     .bottomOffset = 8,
     },
    {
     .appId = 2,
     .buttonLeft = 0x01,
     .buttonRight = 0x03,
     .buttonUp = 0xFF,
     .buttonDown = 0xFF,
     .x = 0x58,
     .y = 0x84,
     .leftOffset = -8,
     .rightOffset = 8,
     .topOffset = -8,
     .bottomOffset = 8,
     },
    {
     .appId = 3,
     .buttonLeft = 0x02,
     .buttonRight = 0x04,
     .buttonUp = 0xFF,
     .buttonDown = 0xFF,
     .x = 0x70,
     .y = 0x84,
     .leftOffset = -8,
     .rightOffset = 8,
     .topOffset = -8,
     .bottomOffset = 8,
     },
    {
     .appId = 4,
     .buttonLeft = 0x03,
     .buttonRight = 0x05,
     .buttonUp = 0xFF,
     .buttonDown = 0xFF,
     .x = 0x88,
     .y = 0x84,
     .leftOffset = -8,
     .rightOffset = 8,
     .topOffset = -8,
     .bottomOffset = 8,
     },
    {
     .appId = 5,
     .buttonLeft = 0x04,
     .buttonRight = 0x06,
     .buttonUp = 0xFF,
     .buttonDown = 0xFF,
     .x = 0xA0,
     .y = 0x84,
     .leftOffset = -8,
     .rightOffset = 8,
     .topOffset = -8,
     .bottomOffset = 8,
     },
    {
     .appId = 6,
     .buttonLeft = 0x05,
     .buttonRight = 0x07,
     .buttonUp = 0xFF,
     .buttonDown = 0xFF,
     .x = 0xB8,
     .y = 0x84,
     .leftOffset = -8,
     .rightOffset = 8,
     .topOffset = -8,
     .bottomOffset = 8,
     },
    {
     .appId = 7,
     .buttonLeft = 0x06,
     .buttonRight = 0x00,
     .buttonUp = 0xFF,
     .buttonDown = 0xFF,
     .x = 0xD0,
     .y = 0x84,
     .leftOffset = -8,
     .rightOffset = 8,
     .topOffset = -8,
     .bottomOffset = 8,
     },
};

const PokegearAppSwitchButtonSpec ov101_021F7C04[9] = {
    {
     .appId = 0,
     .buttonLeft = 0x03,
     .buttonRight = 0x01,
     .buttonUp = 0x04,
     .buttonDown = 0x04,
     .x = 0x20,
     .y = 0x20,
     .leftOffset = 0xFA,
     .rightOffset = 0x06,
     .topOffset = 0xFA,
     .bottomOffset = 0x06,
     },
    {
     .appId = 1,
     .buttonLeft = 0x00,
     .buttonRight = 0x02,
     .buttonUp = 0x05,
     .buttonDown = 0x05,
     .x = 0x28,
     .y = 0x1F,
     .leftOffset = 0x06,
     .rightOffset = 0x50,
     .topOffset = 0xFA,
     .bottomOffset = 0x06,
     },
    {
     .appId = 2,
     .buttonLeft = 0x01,
     .buttonRight = 0x03,
     .buttonUp = 0x06,
     .buttonDown = 0x06,
     .x = 0x88,
     .y = 0x20,
     .leftOffset = 0xFA,
     .rightOffset = 0x06,
     .topOffset = 0xFA,
     .bottomOffset = 0x06,
     },
    {
     .appId = 3,
     .buttonLeft = 0x02,
     .buttonRight = 0x00,
     .buttonUp = 0x08,
     .buttonDown = 0x07,
     .x = 0x90,
     .y = 0x1F,
     .leftOffset = 0x06,
     .rightOffset = 0x50,
     .topOffset = 0xFA,
     .bottomOffset = 0x06,
     },
    {
     .appId = 4,
     .buttonLeft = 0x07,
     .buttonRight = 0x05,
     .buttonUp = 0x00,
     .buttonDown = 0x00,
     .x = 0x20,
     .y = 0x35,
     .leftOffset = 0xFA,
     .rightOffset = 0x06,
     .topOffset = 0xFA,
     .bottomOffset = 0x06,
     },
    {
     .appId = 5,
     .buttonLeft = 0x04,
     .buttonRight = 0x06,
     .buttonUp = 0x01,
     .buttonDown = 0x01,
     .x = 0x28,
     .y = 0x34,
     .leftOffset = 0x06,
     .rightOffset = 0x50,
     .topOffset = 0xFA,
     .bottomOffset = 0x06,
     },
    {
     .appId = 6,
     .buttonLeft = 0x05,
     .buttonRight = 0x07,
     .buttonUp = 0x02,
     .buttonDown = 0x02,
     .x = 0x88,
     .y = 0x35,
     .leftOffset = 0xFA,
     .rightOffset = 0x06,
     .topOffset = 0xFA,
     .bottomOffset = 0x06,
     },
    {
     .appId = 7,
     .buttonLeft = 0x06,
     .buttonRight = 0x04,
     .buttonUp = 0x03,
     .buttonDown = 0x08,
     .x = 0x90,
     .y = 0x34,
     .leftOffset = 0x06,
     .rightOffset = 0x50,
     .topOffset = 0xFA,
     .bottomOffset = 0x06,
     },
    {
     .appId = 8,
     .buttonLeft = 0xFF,
     .buttonRight = 0xFF,
     .buttonUp = 0x07,
     .buttonDown = 0x03,
     .x = 0xD0,
     .y = 0x54,
     .leftOffset = 0xF0,
     .rightOffset = 0x10,
     .topOffset = 0xF7,
     .bottomOffset = 0x03,
     },
};

void ov101_021E8674(PokegearMapAppData *mapApp) {
    UnkStruct_ov100_021E6E20_Sub8 *r4 = mapApp->objManager->objects;

    PokegearAppSwitch_AddButtons(mapApp->pokegear->appSwitch, ov101_021F7C04, NELEMS(ov101_021F7C04), 0, FALSE, mapApp->heapId, r4[12].sprite, r4[13].sprite, r4[14].sprite, r4[15].sprite);
    PokegearAppSwitch_AddButtons(mapApp->pokegear->appSwitch, ov101_021F7BA4, NELEMS(ov101_021F7BA4), 0, FALSE, mapApp->heapId, r4[16].sprite, r4[17].sprite, r4[18].sprite, r4[19].sprite);
    PokegearAppSwitch_AddButtons(mapApp->pokegear->appSwitch, &ov101_021F7B30, 1, 0, FALSE, mapApp->heapId, r4[16].sprite, r4[17].sprite, r4[18].sprite, r4[19].sprite);

    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 1, FALSE);
    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 2, FALSE);
    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 3, FALSE);

    if (mapApp->unk_00C == 1) {
        PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 1, mapApp->unk_014.unk_02 * 2 + 1);
    } else {
        PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 1, 0);
    }
}

void ov101_021E8774(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 3; ++i) {
        PokegearAppSwitch_RemoveButtons(mapApp->pokegear->appSwitch, i + 1);
    }
}

void ov101_021E8790(PokegearMapAppData *mapApp, u8 a1) {
    NARC *narc = NARC_New(NARC_a_1_4_4, mapApp->heapId);

    PaletteData_LoadFromOpenNarc(mapApp->pokegear->plttData, narc, 20 + a1, mapApp->heapId, PLTTBUF_MAIN_BG, 0x1C0, 0, 0);
    PaletteData_LoadFromOpenNarc(mapApp->pokegear->plttData, narc, 14 + a1, mapApp->heapId, PLTTBUF_SUB_BG, 0x180, 0, 0);
    PaletteData_LoadFromOpenNarc(mapApp->pokegear->plttData, narc, 0, mapApp->heapId, PLTTBUF_MAIN_OBJ, 0x160, 0x40, 0);
    PaletteData_LoadFromOpenNarc(mapApp->pokegear->plttData, narc, 0, mapApp->heapId, PLTTBUF_SUB_OBJ, 0x160, 0x40, 0);

    PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, TRUE);
    PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, RGB_BLACK);
    PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, RGB_BLACK);
    PaletteData_PushTransparentBuffers(mapApp->pokegear->plttData);
    PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, FALSE);
    NARC_Delete(narc);
}

void ov101_021E886C(PokegearMapAppData *mapApp) {
    PokegearApp_CreateSpriteManager(mapApp->pokegear, 2);
    mapApp->objManager = ov100_021E6E20(111, mapApp->heapId);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(mapApp->pokegear->spriteSystem), 0, FX32_CONST(240));
    mapApp->unk_03C = sub_02013534(4, mapApp->heapId);
}

void ov101_021E88A8(PokegearMapAppData *mapApp) {
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(mapApp->pokegear->spriteSystem), 0, FX32_CONST(192));
    sub_020135AC(mapApp->unk_03C);
    ov100_021E6E58(mapApp->objManager);
    PokegearApp_DestroySpriteManager(mapApp->pokegear);
}

const UnmanagedSpriteTemplate ov101_021F7DB8[5] = {
    {
     .resourceSet = 0,
     .x = 0x20,
     .y = 0x60,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 0,
     .palIndex = 4,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0x10,
     .y = 0x98,
     .z = 0,
     .animSeqNo = 1,
     .rotation = 0,
     .palIndex = 4,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 1,
     .x = 0x20,
     .y = 0x80,
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
    {
     .resourceSet = 1,
     .x = 0x20,
     .y = 0x60,
     .z = 0,
     .animSeqNo = 1,
     .rotation = 1,
     .palIndex = 4,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 1,
     .x = 0x20,
     .y = 0x60,
     .z = 0,
     .animSeqNo = 2,
     .rotation = 1,
     .palIndex = 4,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
};

void ov101_021E88D8(PokegearMapAppData *mapApp) {
    int i;
    UnkStruct_ov100_021E6E20_Sub8 *r4 = mapApp->objManager->objects;

    for (i = 0; i < 4; ++i) {
        ov100_021E6EC4(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7DB8[0]));
        Sprite_SetPositionXY(r4[i].sprite, 0x68 * (i % 2) + 0x20, 0x15 * (i / 2) + 0xCB);
        thunk_Sprite_SetPriority(r4[i].sprite, 0);
    }

    ov100_021E6EC4(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7DB8[1]));
    thunk_Sprite_SetPriority(r4[4].sprite, 0);

    ov100_021E6EC4(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7DB8[2]));

    ov100_021E6EC4(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7DB8[3]));

    for (i = 0; i < 4; ++i) {
        ov100_021E6EC4(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7DB8[4]));
        Sprite_UpdateAnim(r4[i + 7].sprite, FX32_CONST(i));
    }

    for (i = 0; i < 11; ++i) {
        UnkStruct_ov100_021E6E20_Sub8 *r6 = &r4[(u16)i];
        Sprite_GetPositionXY(r6->sprite, &r6->unk_04.x, &r6->unk_04.y);
        Sprite_SetDrawFlag(r6->sprite, FALSE);
    }

    Sprite_SetAnimActiveFlag(r4[5].sprite, TRUE);
    Sprite_SetAnimActiveFlag(r4[6].sprite, FALSE);
    Sprite_SetAnimationFrame(r4[6].sprite, mapApp->pokegear->args->playerGender);
    Sprite_SetAffineOverwriteMode(r4[5].sprite, 2);
}

const UnmanagedSpriteTemplate ov101_021F7B3C = {
    .resourceSet = 1,
    .x = 0,
    .y = 0,
    .z = 0,
    .animSeqNo = 4,
    .rotation = 1,
    .palIndex = 4,
    .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
    .unk_18 = 0,
    .unk_1C = 0,
    .unk_20 = 0,
    .unk_24 = 0,
};

void ov101_021E8A88(PokegearMapAppData *mapApp) {
    UnkStruct_ov100_021E6E20_Sub8 *r7 = mapApp->objManager->objects;
    UnkStruct_ov100_021E6E20_Sub8 *r4;
    u16 i;

    for (i = 0; i < 100; ++i) {
        r4 = &r7[ov100_021E6EC4(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7B3C))];
        Sprite_GetPositionXY(r4->sprite, &r4->unk_04.x, &r4->unk_04.y);
        Sprite_SetDrawFlag(r4->sprite, FALSE);
        Sprite_SetAnimActiveFlag(r4->sprite, FALSE);
    }
}

void ov101_021E8AE4(PokegearMapAppData *mapApp) {
    UnkTemplate_02013950 sp18;
    u32 sp14;
    int i;

    mapApp->unk_040 = sub_02013910(&mapApp->windows[8], mapApp->heapId);
    sp14 = sub_02013948(mapApp->unk_040, NNS_G2D_VRAM_TYPE_2DMAIN);
    AddTextPrinterParameterizedWithColor(&mapApp->windows[8], 0, mapApp->regionNameStrings[1], 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

    sp18.unk_00 = mapApp->unk_03C;
    sp18.unk_04 = &mapApp->windows[8];
    sp18.unk_08 = SpriteManager_GetSpriteList(mapApp->pokegear->spriteManager);
    sp18.unk_0C = SpriteManager_FindPlttResourceProxy(mapApp->pokegear->spriteManager, 0);
    sp18.unk_20 = 0;
    sp18.unk_24 = 3;
    sp18.unk_18 = 4;
    sp18.unk_1C = -6;
    sp18.unk_28 = 1;
    sp18.unk_2C = mapApp->heapId;

    for (i = 0; i < 4; ++i) {
        sub_02021AC8(sp14, TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, &mapApp->unk_044[i].unk_4);
        sp18.unk_14 = mapApp->unk_044[i].unk_4.offset;
        sp18.unk_10 = mapApp->objManager->objects[24 + i].sprite;
        mapApp->unk_044[i].unk_0 = sub_02013950(&sp18, mapApp->unk_040);
        sub_020137C0(mapApp->unk_044[i].unk_0, 0);
        sub_02013850(mapApp->unk_044[i].unk_0, 7);
    }
}

void ov101_021E8BB8(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 4; ++i) {
        sub_020139C8(mapApp->unk_044[i].unk_0);
        sub_02021B5C(&mapApp->unk_044[i].unk_4);
        mapApp->unk_044[i].unk_0 = NULL;
    }
    sub_02013938(mapApp->unk_040);
}

const UnmanagedSpriteTemplate ov101_021F7C70[4] = {
    {
     .resourceSet = 1,
     .x = 0,
     .y = 0,
     .z = 0,
     .animSeqNo = 3,
     .rotation = 4,
     .palIndex = 4,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 1,
     .x = 0,
     .y = 0,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 4,
     .palIndex = 6,
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
     .animSeqNo = 0,
     .rotation = 4,
     .palIndex = 4,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 2,
     .x = 0,
     .y = 0,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 4,
     .palIndex = 5,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
};

void ov101_021E8BE8(PokegearMapAppData *mapApp) {
    u16 i;
    UnkStruct_ov100_021E6E20_Sub8 *r7 = mapApp->objManager->objects;

    ov100_021E6EC4(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7C70[0]));
    r7[11].unk_04.x = 0x80;
    r7[11].unk_04.y = 0x6C;
    Sprite_SetDrawFlag(r7[11].sprite, TRUE);

    for (i = 0; i < 8; ++i) {
        ov100_021E6EC4(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7C70[1]));
        r7[12 + i].unk_04.x = 0;
        r7[12 + i].unk_04.y = 0;
        Sprite_SetAnimCtrlSeq(r7[12 + i].sprite, 5 + (i % 4));
        Sprite_SetAnimActiveFlag(r7[12 + i].sprite, TRUE);
        Sprite_SetDrawFlag(r7[12 + i].sprite, FALSE);
        Sprite_SetPriority(r7[12 + i].sprite, 0);
        r7[12 + i].unk_02 = 1;
    }

    for (i = 0; i < 4; ++i) {
        ov100_021E6EC4(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7C70[2]));
        r7[20 + i].unk_04.x = 32 + (i % 2) * 104;
        r7[20 + i].unk_04.y = 32 + (i / 2) * 21;
        Sprite_SetPriority(r7[20 + i].sprite, 0);
    }

    for (i = 0; i < 4; ++i) {
        ov100_021E6EC4(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7C70[3]));
        r7[24 + i].unk_04.x = 40 + (i % 2) * 104;
        r7[24 + i].unk_04.y = 31 + (i / 2) * 21;
        Sprite_SetPriority(r7[24 + i].sprite, 0);
    }

    for (i = 0; i < 8; ++i) {
        ov100_021E6EC4(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F7C70[2]));
        r7[28 + i].unk_04.x = 40 + i * 24;
        r7[28 + i].unk_04.y = 132;
        Sprite_SetAnimationFrame(r7[28 + i].sprite, i);
        Sprite_SetPriority(r7[28 + i].sprite, 0);
    }

    for (i = 20; i <= 35; ++i) {
        Sprite_SetDrawFlag(r7[i].sprite, TRUE);
        Sprite_SetAnimActiveFlag(r7[i].sprite, FALSE);
    }

    Sprite_SetAnimActiveFlag(r7[11].sprite, TRUE);
    ov100_021E6E84(mapApp->objManager);
    ov101_021E8AE4(mapApp);
}

void ov101_021E8E20(PokegearMapAppData *mapApp) {
    ov101_021E8BB8(mapApp);
    ov100_021E6F34(mapApp->objManager, 11);
}

void ov101_021E8E34(PokegearMapAppData *mapApp) {
    ov101_021E88D8(mapApp);
}

void ov101_021E8E3C(PokegearMapAppData *mapApp) {
    ov100_021E6F34(mapApp->objManager, 11);
}

void ov101_021E8E4C(PokegearMapAppData *mapApp) {
    ov100_021E6EF4(mapApp->objManager);
}

void ov101_021E8E58(PokegearMapAppData *mapApp) {
    int i;
    UnkStruct_ov100_021E6E20_Sub8 *sp1C = mapApp->objManager->objects;

    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_5, GX_BG0_AS_2D);

    for (i = 0; i < 2; ++i) {
        SetBgControlParam(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, GF_BG_CNT_SET_SCREEN_SIZE, GF_BG_SCR_SIZE_256x512);
        SetBgControlParam(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, GF_BG_CNT_SET_CHAR_BASE, GX_BG_CHARBASE_0x10000);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
    }

    G2_SetBlendAlpha(4, 8, 10, 6);
    ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);

    for (i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1, BG_POS_OP_SET_Y, 0);
    }

    mapApp->pokegear->reselectAppCB = ov101_021EB338;
    mapApp->pokegear->unknownCB = ov101_021EB2FC;
    ov101_021E990C(mapApp);
    ov101_021E9B70(mapApp, &mapApp->unk_0C8);
    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, 32, 20, mapApp->unk_178->rawData, 0, 0, mapApp->unk_178->screenWidth / 8, mapApp->unk_178->screenHeight / 8);

    ov101_021EAF40(mapApp);
    ov101_021EB38C(mapApp, 1, mapApp->unk_138_0);
    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 0, 7, 32, 17, mapApp->unk_16C->rawData, 0, 7, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);

    ov101_021EA794(mapApp, &mapApp->unk_118, mapApp->matrixX_2, mapApp->matrixY_2);
    ov101_021EAD90(mapApp, 0);
    ov101_021EB1E0(mapApp, 1);
    ov101_021E8A88(mapApp);
    ov101_021EA238(mapApp, 0);
    ov101_021EA608(mapApp, 1);
    if (mapApp->pokegear->cursorInAppSwitchZone == TRUE) {
        PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0, TRUE);
        Sprite_SetDrawFlag(sp1C[5].sprite, FALSE);
    } else {
        PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0, FALSE);
        Sprite_SetDrawFlag(sp1C[5].sprite, TRUE);
    }

    PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 0, ov100_021E5DC8(mapApp->pokegear));
    if (mapApp->pokegear->isSwitchApp) {
        ov101_021E9D74(mapApp, 0);
    }
    ov100_021E6E84(mapApp->objManager);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
}

void ov101_021E90A8(PokegearMapAppData *mapApp) {
    int i;

    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_0, GX_BG0_AS_2D);

    for (i = 0; i < 2; ++i) {
        SetBgControlParam(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, GF_BG_CNT_SET_SCREEN_SIZE, GF_BG_SCR_SIZE_128x128);
        SetBgControlParam(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, GF_BG_CNT_SET_CHAR_BASE, GX_BG_CHARBASE_0x00000);
        SetBgControlParam(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, GF_BG_CNT_SET_COLOR_MODE, GX_BG_COLORMODE_16);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
    }

    ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
    G2_SetBlendAlpha(0, 0, 0, 0);

    for (i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
    }

    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 32, 14, mapApp->unk_17C->rawData, 0, 0, mapApp->unk_17C->screenWidth / 8, mapApp->unk_17C->screenHeight / 8);
    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 32, 24, mapApp->unk_180->rawData, 0, 0, mapApp->unk_180->screenWidth / 8, mapApp->unk_180->screenHeight / 8);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GF_PLANE_TOGGLE_ON);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
    ov101_021E8BE8(mapApp);
    ov101_021E8674(mapApp);
    ov101_021EA608(mapApp, 0);

    if (mapApp->unk_00C == 1) {
        ov101_021EA794(mapApp, &mapApp->unk_118, mapApp->unk_014.unk_08, mapApp->unk_014.unk_0A);
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_TOUCH) {
            PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 1, TRUE);
        } else {
            PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 1, FALSE);
        }
    }

    ov101_021EAE54(mapApp, 1);
    mapApp->unk_13C_0 = 0;
    mapApp->unk_13C_7 = FALSE;
    mapApp->pokegear->reselectAppCB = ov101_021EB378;
    mapApp->pokegear->unknownCB = ov101_021EB364;
}

void ov101_021E9264(PokegearMapAppData *mapApp, int a1) {
    if (!a1) {
        mapApp->unk_014.unk_02 = 0;
        mapApp->unk_00C = 0;
    }
}
