#include "global.h"

#include "msgdata/msg.naix"

#include "bg_window.h"
#include "filesystem.h"
#include "font.h"
#include "gf_gfx_planes.h"
#include "launch_application.h"
#include "message_format.h"
#include "msgdata.h"
#include "pokemon_icon_idx.h"
#include "sound_02004A44.h"
#include "system.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_020163E0.h"
#include "unk_02082908.h"

typedef struct NamingScreenAppData {
    int unk_000;
    int unk_004;
    int unk_008;
    u8 filler_00C[0x28];
    int unk_034;
    u8 unk_038[0xA0];
    u16 unk_0D8[0x40];
    u16 unk_158;
    u16 unk_15A;
    u8 filler_15C[0x4];
    BgConfig *bgConfig; // 0x160
    u8 filler_164[4];
    MessageFormat *msgFormat; // 0x168
    MsgData *msgData;         // 0x16C
    MsgData *msgData2;        // 0x170
    MsgData *msgData3;        // 0x174
    u8 filler_178[0x4];
    int unk_17C;
    String *unk_180;
    u8 unk_184[0x4];
    SpriteList *unk_188;
    u8 unk_18C[0x1A0];
    u8 unk_32C[0x8C];
    u8 unk_3B8[0x40];
    u8 unk_3F8[0x50];
    Window unk_448;
    int unk_458;
    int unk_45C;
    int unk_460;
    u8 unk_464[4];
    u8 unk_468[4];
    u8 filler_46C[0x24];
    u8 unk_490[0x18];
    int unk_4A8;
    u8 filler_4AC[4];
    NNSG2dCharacterData *unk_4B0;
    u8 filler_4B4[4];
    NNSG2dCharacterData *unk_4B8;
    u8 filler_4BC[0x4];
    NNSG2dPaletteData *unk_4C0;
    u8 unk_4C4[0x100];
    UnkStruct_020163E0 *unk_5C4;
    u8 filler_5C8[0x4];
    int unk_5CC;
    u8 filler_5D0[0x4];
} NamingScreenAppData; // size: 0x5D4

BOOL NamingScreenApp_Init(OVY_MANAGER *ovyMan, int *pState);
void sub_02082AEC(NNSG2dCharacterData *pCharData, NNSG2dPaletteData *pPlttData, int species, int form);
BOOL NamingScreenApp_Main(OVY_MANAGER *ovyMan, int *pState);
void sub_02083140(void *param);
void sub_02083184(void);
void sub_020831A4(BgConfig *bgConfig);
void sub_02083160(NamingScreenAppData *data, NamingScreenArgs *args);
void sub_020832E4(int a0);
void sub_02083334(NamingScreenAppData *data, OVY_MANAGER *ovyMan);
void sub_02083654(NamingScreenAppData *data, NARC *narc);
void sub_0208377C(void);
void sub_020837AC(NamingScreenAppData *data, NARC *narc);
void sub_020839EC(NamingScreenAppData *data);
void sub_02083F9C(NamingScreenAppData *data, OVY_MANAGER *ovyMan, NARC *narc);
void sub_02084740(void *a0, u16 *a1, u16 a2, void *a3, void *a4, int a5);
int sub_02082CF8(NamingScreenAppData *data, int a1);
void sub_020834FC(NamingScreenAppData *data, OVY_MANAGER *ovyMan);
void sub_02084FCC(NamingScreenAppData *data);
void sub_02084F3C(void *a0, void *a1, int a2);
void sub_02083D34(BgConfig *bgConfig, void *a1, void *a2, int a3, void *a4, void *a5, void *a6, const u16 *a7);
void sub_02084500(void *a0);

static NamingScreenAppData *_021D43B0;

BOOL NamingScreenApp_Init(OVY_MANAGER *ovyMan, int *pState) {
    NamingScreenAppData *data;
    NARC *narc;
    switch (*pState) {
    case 0:
        Main_SetVBlankIntrCB(NULL, NULL);
        HBlankInterruptDisable();
        GfGfx_DisableEngineAPlanes();
        GfGfx_DisableEngineBPlanes();
        GX_SetVisiblePlane(0);
        GXS_SetVisiblePlane(0);
        CreateHeap(HEAP_ID_3, HEAP_ID_NAMING_SCREEN, 0x28000);

        data = OverlayManager_CreateAndGetData(ovyMan, sizeof(NamingScreenAppData), HEAP_ID_NAMING_SCREEN);
        memset(data, 0, sizeof(NamingScreenAppData));
        data->bgConfig  = BgConfig_Alloc(HEAP_ID_NAMING_SCREEN);
        narc            = NARC_New(NARC_a_0_3_1, HEAP_ID_NAMING_SCREEN);
        data->msgFormat = MessageFormat_New(HEAP_ID_NAMING_SCREEN);
        data->msgData   = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0249_bin, HEAP_ID_NAMING_SCREEN);
        data->msgData2  = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0254_bin, HEAP_ID_NAMING_SCREEN);
        data->msgData3  = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0197_bin, HEAP_ID_NAMING_SCREEN);
        SetKeyRepeatTimers(4, 8);
        sub_02083184();
        sub_020831A4(data->bgConfig);
        sub_02083160(data, OverlayManager_GetArgs(ovyMan));
        sub_02083654(data, narc);
        FontID_Alloc(2, HEAP_ID_NAMING_SCREEN);
        Main_SetVBlankIntrCB(sub_02083140, NULL);
        sub_02083334(data, ovyMan);
        FontID_SetAccessDirect(0, HEAP_ID_NAMING_SCREEN);
        sub_0208377C();
        sub_020837AC(data, narc);
        sub_020839EC(data);
        sub_02083F9C(data, ovyMan, narc);
        sub_02084740(data->unk_3F8, data->unk_0D8, data->unk_158, &data->unk_15A, data->unk_4C4, data->unk_17C);
        sub_02004EC4(0x34, 0, 0);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 16, 1, HEAP_ID_NAMING_SCREEN);
        sub_020832E4(1);
        gSystem.screensFlipped = TRUE;
        GfGfx_SwapDisplay();
        NARC_Delete(narc);
        ++(*pState);
        break;
    case 1:
        data = OverlayManager_GetData(ovyMan);
        if (data->unk_000 == NAME_SCREEN_POKEMON) {
            sub_02082AEC(data->unk_4B8, data->unk_4C0, data->unk_004, data->unk_008);
        }
        _021D43B0     = data;
        data->unk_5C4 = sub_020163E0(NULL, PM_LCD_BOTTOM, 12, HEAP_ID_NAMING_SCREEN);
        *pState       = 0;
        return TRUE;
    }

    return FALSE;
}

void sub_02082AEC(NNSG2dCharacterData *pCharData, NNSG2dPaletteData *pPlttData, int species, int form) {
    GX_LoadOBJ(pCharData->pRawData, 0x57E0, 0x200);
    const u16 *rawPltt = pPlttData->pRawData;
    u32 plttNo         = GetMonIconPaletteEx(species, form, FALSE);
    GX_LoadOBJPltt(rawPltt + 16 * plttNo, 0xC0, 0x20);
}

BOOL NamingScreenApp_Main(OVY_MANAGER *ovyMan, int *pState) {
    NamingScreenAppData *data = OverlayManager_GetData(ovyMan);

    switch (*pState) {
    case 0:
        if (IsPaletteFadeFinished()) {
            *pState       = 1;
            data->unk_5CC = 0;
        }
        break;
    case 1:
        ++data->unk_5CC;
        sub_02084FCC(data);
        sub_02084F3C(data->unk_490, data->unk_32C, data->unk_460);
        if (data->unk_5CC > 5) {
            *pState       = 2;
            data->unk_5CC = 0;
        }
        break;
    case 2:
        switch (data->unk_45C) {
        case 0:
        case 1:
        case 2:
        case 3:
            break;
        case 4:
            if (data->unk_034 == 0) {
                *pState = sub_02082CF8(data, *pState);
            }
            sub_02084FCC(data);
            break;
        case 5:
            sub_020834FC(data, ovyMan);
            FillWindowPixelBuffer(&data->unk_448, 15);
            DrawFrameAndWindow2(&data->unk_448, FALSE, 256, 10);
            data->unk_458 = AddTextPrinterParameterized(&data->unk_448, 1, data->unk_180, 0, 0, 1, NULL);
            CopyWindowToVram(&data->unk_448);
            data->unk_45C = 6;
            break;
        case 6:
            if (!TextPrinterCheckActive(data->unk_458)) {
                PlaySE(SEQ_SE_DP_PIRORIRO);
                ++data->unk_4A8;
                data->unk_5CC = 0;
                data->unk_45C = 7;
            }
            break;
        case 7:
            ++data->unk_5CC;
            if (data->unk_5CC > 30) {
                BeginNormalPaletteFade(2, 0, 0, RGB_BLACK, 16, 1, HEAP_ID_NAMING_SCREEN);
                *pState = 3;
            }
            break;
        }
        sub_02083D34(data->bgConfig, data->unk_3B8, &data->unk_45C, data->unk_460, data->unk_464, data->unk_468, data->unk_32C, data->unk_4B0->pRawData);
        sub_02084F3C(data->unk_490, data->unk_32C, data->unk_460);
        sub_02084500(data->unk_038);
        break;
    case 3:
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
        break;
    }

    SpriteList_RenderAndAnimateSprites(data->unk_188);
    return FALSE;
}
