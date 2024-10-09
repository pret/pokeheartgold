#include "global.h"

#include "msgdata/msg.naix"

#include "bg_window.h"
#include "filesystem.h"
#include "font.h"
#include "gf_gfx_planes.h"
#include "launch_application.h"
#include "message_format.h"
#include "msgdata.h"
#include "sound_02004A44.h"
#include "system.h"
#include "unk_0200FA24.h"
#include "unk_020163E0.h"
#include "unk_02082908.h"

typedef struct NamingScreenAppData {
    int unk_000;
    int unk_004;
    int unk_008;
    u8 filler_00C[0xCC];
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
    u8 unk_180[0x278];
    u8 unk_3F8[0xC0];
    NNSG2dCharacterData *unk_4B8;
    u8 filler_4BC[0x4];
    NNSG2dPaletteData *unk_4C0;
    u8 unk_4C4[0x100];
    UnkStruct_020163E0 *unk_5C4;
    u8 filler_5C8[0xC];
} NamingScreenAppData; // size: 0x5D4

BOOL NamingScreenApp_Init(OVY_MANAGER *ovyMan, int *pState);
void sub_02083184(void);
void sub_020831A4(BgConfig *bgConfig);
void sub_02083160(NamingScreenAppData *data, NamingScreenArgs *args);
void sub_02083654(NamingScreenAppData *data, NARC *narc);
void sub_02083140(void *param);
void sub_02083334(NamingScreenAppData *data, OVY_MANAGER *ovyMan);
void sub_0208377C(void);
void sub_020837AC(NamingScreenAppData *data, NARC *narc);
void sub_020839EC(NamingScreenAppData *data);
void sub_02083F9C(NamingScreenAppData *data, OVY_MANAGER *ovyMan, NARC *narc);
void sub_02084740(void *a0, u16 *a1, u16 a2, void *a3, void *a4, int a5);
void sub_020832E4(int a0);
void sub_02082AEC(NNSG2dCharacterData *pCharData, NNSG2dPaletteData *pPlttData, int species, int form);

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
