#include "oaks_speech.h"

#include "global.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0219.h"

#include "font.h"
#include "gf_gfx_loader.h"
#include "launch_application.h"
#include "main.h"
#include "math_util.h"
#include "overlay_36.h"
#include "overlay_manager.h"
#include "player_data.h"
#include "render_text.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_020163E0.h"
#include "unk_02082908.h"

FS_EXTERN_OVERLAY(OVY_36);

typedef struct OaksSpeechData_Sub178 {
} OaksSpeechData_Sub178;

typedef struct OakSpeechData_Sub160 {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
    u8 unk_7;
} OakSpeechData_Sub160;

typedef struct OaksSpeechData {
    HeapID heapId;      // 0x000
    SaveData *saveData; // 0x004
    Options *options;   // 0x008
    int unk_00C;
    int unk_010;
    OVY_MANAGER *unk_014;
    BgConfig *bgConfig; // 0x018
    Window window_0;
    Window window_1;
    Window windows_2thru6[4];
    int unk_07C;
    int unk_080;
    u8 filler_084[0x50];
    SpriteGfxHandler *unk_0D4;
    int unk_0D8;
    u8 filler_0DC[0xC];
    int unk_0E8;
    u8 filler_0EC[0x14];
    MsgData *msgData;
    int unk_104;
    int unk_108;
    u32 textPrinter;
    String *string; // 0x110
    UnkStruct_020163E0 *unk_114;
    MessageFormat *msgFormat;
    u8 filler_11C[0x4];
    NamingScreenArgs *namingScreenArgs_Player; // 0x120
    NamingScreenArgs *namingScreenArgs_Rival;  // 0x124
    int unk_128;
    int unk_12C;
    int unk_130;
    u16 playerGender; // 0x134
    u16 unk_136;
    u8 filler_138[0x4];
    int unk_13C;
    int unk_140;
    int unk_144;
    u8 filler_148[0x18];
    OakSpeechData_Sub160 unk_160;
    int unk_168;
    int unk_16C;
    u8 filler_170[0x8];
    OaksSpeechData_Sub178 *unk_178;
    int unk_17C;
} OaksSpeechData; // size: 0x180

void ov53_021E5BCC(void *cbArg);
void ov53_021E5BDC(OaksSpeechData *data);
void ov53_021E5DE0(OaksSpeechData *data);
void ov53_021E5E6C(OaksSpeechData *data);
void ov53_021E5EB8(OaksSpeechData *data);
BOOL ov53_021E5EDC(OaksSpeechData *data, int param, BOOL isFadeOut);
BOOL ov53_021E60CC(OaksSpeechData *data, int a1);
void ov53_021E60E8(OaksSpeechData *data, int bgId, int palette);
BOOL ov53_021E611C(OaksSpeechData *data, int msgNum, int waitButtonMode);
BOOL ov53_021E628C(OaksSpeechData *data, int msgNum, int a2, int a3, int a4);
BOOL ov53_021E64B4(OaksSpeechData *data, int msgNum, int a2);
void ov53_021E64C4(OaksSpeechData *data, int msg1, int msg2, int msg3, int a4);
void ov53_021E65B4(OaksSpeechData *data);
void ov53_021E65E0(OaksSpeechData *data);
void ov53_021E66A8(OaksSpeechData *data, int a1);
void ov53_021E66E8(OaksSpeechData *data, int a1, int a2);
void ov53_021E67C4(OaksSpeechData *data, int a1);
void ov53_021E6824(OaksSpeechData *data, int a1);
void ov53_021E6908(OakSpeechData_Sub160 *dest, int a1);
void ov53_021E6928(OaksSpeechData *data, int a1);
int ov53_021E6988(OaksSpeechData *data, int a1);
u16 ov53_021E6B9C(u16 a0, s8 a1);
void ov53_021E6BEC(OaksSpeechData *data, int a1);
void ov53_021E6CB0(OaksSpeechData *data);
BOOL ov53_021E6CE0(OaksSpeechData *data);
void ov53_021E6DF0(OaksSpeechData *data);
BOOL ov53_021E6E00(OaksSpeechData *data);
int ov53_021E6E7C(OaksSpeechData *data);
BOOL ov53_021E6F9C(OaksSpeechData *data);
void ov53_021E7ECC(OaksSpeechData *data);
void ov53_021E7F24(OaksSpeechData *data);
void ov53_021E7FEC(OaksSpeechData *data);
void ov53_021E8014(OaksSpeechData *data);
void *ov53_021E80F4(BgConfig *bgConfig, int a1, int a2, int a3, int a4, HeapID heapId);
void ov53_021E814C(OaksSpeechData_Sub178 *a0);

extern const WindowTemplate ov53_021E8500;
extern const int ov53_021E86B0[][4];
extern const WindowTemplate ov53_021E8680[][3];
extern const int ov53_021E8604[][3];
extern const int ov53_021E8508[];

// note: this is an artifact from -ipa file
extern const u32 ov53_021E84F8[];
#define ov53_021E8520 ((const WindowTemplate *)((u32)ov53_021E84F8 + 0x28))

BOOL OakSpeech_Init(OVY_MANAGER *ovyMan, int *pState) {
    CreateHeap(HEAP_ID_3, HEAP_ID_OAKS_SPEECH, 0x40000);
    OaksSpeechData *data = OverlayManager_CreateAndGetData(ovyMan, sizeof(OaksSpeechData), HEAP_ID_OAKS_SPEECH);
    memset(data, 0, sizeof(OaksSpeechData));
    data->heapId                        = HEAP_ID_OAKS_SPEECH;
    UnkStruct_02111868_sub *mainOvyArgs = OverlayManager_GetArgs(ovyMan);
    data->saveData                      = mainOvyArgs->saveData;
    data->options                       = Save_PlayerData_GetOptionsAddr(data->saveData);
    data->unk_00C                       = 0;
    data->unk_010                       = 0;
    data->unk_014                       = NULL;
    data->namingScreenArgs_Player       = NamingScreen_CreateArgs(HEAP_ID_OAKS_SPEECH, NAME_SCREEN_PLAYER, 0, PLAYER_NAME_LENGTH, data->options, NULL);
    data->namingScreenArgs_Rival        = NamingScreen_CreateArgs(HEAP_ID_OAKS_SPEECH, NAME_SCREEN_RIVAL, 0, PLAYER_NAME_LENGTH, data->options, NULL);
    data->unk_17C                       = 0;
    data->unk_13C                       = 0;
    sub_02002B8C(FALSE);
    FontID_Alloc(4, data->heapId);
    return TRUE;
}

BOOL OakSpeech_Main(OVY_MANAGER *ovyMan, int *pState) {
    OaksSpeechData *data = OverlayManager_GetData(ovyMan);
    BOOL ret             = FALSE;
    switch (*pState) {
    case 0:
        sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
        sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);
        Main_SetVBlankIntrCB(NULL, NULL);
        Main_SetHBlankIntrCB(NULL, NULL);
        GfGfx_DisableEngineAPlanes();
        GfGfx_DisableEngineBPlanes();
        GX_SetVisiblePlane(0);
        GXS_SetVisiblePlane(0);
        SetKeyRepeatTimers(4, 8);
        ov53_021E5BDC(data);
        ov53_021E5E6C(data);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
        ov53_021E7F24(data);
        ov53_021E8014(data);
        data->unk_178 = ov53_021E80F4(data->bgConfig, data->unk_0E8, 6, 4, 14, data->heapId);
        Main_SetVBlankIntrCB(ov53_021E5BCC, data);
        GfGfx_BothDispOn();
        *pState = 1;
        break;
    case 1:
        ov53_021E7ECC(data);
        if (ov53_021E6F9C(data) == TRUE) {
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            *pState = 2;
        }
        if (data->unk_014) {
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            *pState = 3;
        }
        break;
    case 2:
        if (IsPaletteFadeFinished() == TRUE) {
            ov53_021E814C(data->unk_178);
            ov53_021E7FEC(data);
            ov53_021E5EB8(data);
            ov53_021E5DE0(data);
            Main_SetVBlankIntrCB(NULL, NULL);
            ret = TRUE;
        }
        break;
    case 3:
        if (IsPaletteFadeFinished() == TRUE) {
            ov53_021E814C(data->unk_178);
            ov53_021E7FEC(data);
            ov53_021E5EB8(data);
            ov53_021E5DE0(data);
            Main_SetVBlankIntrCB(NULL, NULL);
            *pState = 4;
        }
        break;
    case 4:
        if (OverlayManager_Run(data->unk_014) == TRUE) {
            OverlayManager_Delete(data->unk_014);
            data->unk_014 = NULL;
            *pState       = 5;
        }
        break;
    case 5:
        *pState = 0;
        break;
    }

    if (data->unk_014 == NULL && data->unk_0D4 != NULL) {
        sub_0200D020(data->unk_0D4);
    }
    return ret;
}

BOOL OakSpeech_Exit(OVY_MANAGER *ovyMan, int *pState) {
    OaksSpeechData *data = OverlayManager_GetData(ovyMan);
    HeapID heapId        = data->heapId;
    FontID_Release(4);
    PlayerName_StringToFlat(Save_PlayerData_GetProfileAddr(data->saveData), data->namingScreenArgs_Player->unk18);
    PlayerProfile_SetTrainerGender(Save_PlayerData_GetProfileAddr(data->saveData), data->namingScreenArgs_Player->unk4);
    Save_Misc_RivalName_Set(Save_Misc_Get(data->saveData), data->namingScreenArgs_Rival->unk18);
    sub_0208311C(data->namingScreenArgs_Player);
    sub_0208311C(data->namingScreenArgs_Rival);
    OverlayManager_FreeData(ovyMan);
    DestroyHeap(heapId);
    RegisterMainOverlay(FS_OVERLAY_ID(OVY_36), &ov36_App_InitGameState_AfterOakSpeech);
    sub_02002B8C(FALSE);
    return TRUE;
}

void ov53_021E5BCC(void *cbArg) {
    OaksSpeechData *data = cbArg;

    DoScheduledBgGpuUpdates(data->bgConfig);
    thunk_OamManager_ApplyAndResetBuffers();
}

void ov53_021E5BDC(OaksSpeechData *data) {
    {
        extern const GraphicsBanks ov53_021E8628;
        GraphicsBanks graphicsBanks = ov53_021E8628;
        GfGfx_SetBanks(&graphicsBanks);
    }
    data->bgConfig = BgConfig_Alloc(data->heapId);
    {
        extern const GraphicsModes ov53_021E8548;
        GraphicsModes graphicsModes = ov53_021E8548;
        SetBothScreensModesAndDisable(&graphicsModes);
    }
    {
        extern const BgTemplate ov53_021E85CC;
        BgTemplate bgTemplate = ov53_021E85CC;

        bgTemplate.screenBase = GX_BG_SCRBASE_0x7800;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x18000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x7000;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x14000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_1);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x6800;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x10000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_2);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x6000;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x0c000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_3);

        LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_MAIN_0, 0x3E2, 4, 0, data->heapId);
        LoadUserFrameGfx1(data->bgConfig, GF_BG_LYR_MAIN_0, 0x3D9, 3, 0, data->heapId);
        LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0xA0, data->heapId);
        LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0xC0, data->heapId);
    }
    {
        extern const BgTemplate ov53_021E85E8;
        BgTemplate bgTemplate = ov53_021E85E8;

        bgTemplate.screenBase = GX_BG_SCRBASE_0x7800;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x18000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x7000;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x14000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_1);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x6800;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x10000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_2);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x6000;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x0c000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_3);

        SetBgPriority(GF_BG_LYR_SUB_3, 3);
        LoadFontPal0(GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0x1C0, data->heapId);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_0, 0x20, 0, data->heapId);
    }

    ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_OFF);
    ov53_021E65E0(data);
    data->unk_128 = 0;
}

void ov53_021E5DE0(OaksSpeechData *data) {
    ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_OFF);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_0);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_3);
    FreeToHeap(data->bgConfig);
}

void ov53_021E5E6C(OaksSpeechData *data) {
    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0219_bin, data->heapId);
    ResetAllTextPrinters();
    data->unk_114   = sub_020163E0(NULL, PM_LCD_TOP, 6, data->heapId);
    data->msgFormat = MessageFormat_New(data->heapId);
    data->unk_104   = 0;
    data->unk_108   = 0;
    data->unk_080   = 0;
}

void ov53_021E5EB8(OaksSpeechData *data) {
    MessageFormat_Delete(data->msgFormat);
    sub_020164C4(data->unk_114);
    DestroyMsgData(data->msgData);
}

BOOL ov53_021E5EDC(OaksSpeechData *data, int param, BOOL isFadeOut) {
    BOOL ret = FALSE;
    GXBlendPlaneMask plane;
    PMLCDTarget screen;

    switch (param) {
    default:
    case GF_BG_LYR_MAIN_0:
        plane  = GX_BLEND_PLANEMASK_BG0;
        screen = PM_LCD_TOP;
        break;
    case GF_BG_LYR_MAIN_1:
        plane  = GX_BLEND_PLANEMASK_BG1;
        screen = PM_LCD_TOP;
        break;
    case GF_BG_LYR_MAIN_2:
        plane  = GX_BLEND_PLANEMASK_BG2;
        screen = PM_LCD_TOP;
        break;
    case GF_BG_LYR_SUB_0:
        plane  = GX_BLEND_PLANEMASK_BG0;
        screen = PM_LCD_BOTTOM;
        break;
    case GF_BG_LYR_SUB_1:
        plane  = GX_BLEND_PLANEMASK_BG1;
        screen = PM_LCD_BOTTOM;
        break;
    case GF_BG_LYR_SUB_2:
        plane  = GX_BLEND_PLANEMASK_BG2;
        screen = PM_LCD_BOTTOM;
        break;
    case 101: // GF_BG_LYR_MAIN_OBJ
        plane  = GX_BLEND_PLANEMASK_OBJ;
        screen = PM_LCD_TOP;
        break;
    case 102: // GF_BG_LYR_SUB_OBJ
        plane  = GX_BLEND_PLANEMASK_OBJ;
        screen = PM_LCD_BOTTOM;
        break;
    }

    switch (data->unk_128) {
    case 0:
        if (!isFadeOut) {
            data->unk_12C = 0;
            data->unk_130 = 16;
            data->unk_128 = 1;
            if (screen == 0) {
                G2_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->unk_12C,
                    data->unk_130);
            } else {
                G2S_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->unk_12C,
                    data->unk_130);
            }
            if (param == 101) {
                GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
            } else if (param == 102) {
                GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
            } else {
                ToggleBgLayer(param, GF_PLANE_TOGGLE_ON);
            }
        } else {
            data->unk_12C = 16;
            data->unk_130 = 0;
            data->unk_128 = 2;
        }
        break;
    case 1:
        if (data->unk_130 != 0) {
            ++data->unk_12C;
            --data->unk_130;
            if (screen == 0) {
                G2_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->unk_12C,
                    data->unk_130);
            } else {
                G2S_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->unk_12C,
                    data->unk_130);
            }
        } else {
            data->unk_128 = 3;
        }
        break;
    case 2:
        if (data->unk_12C != 0) {
            --data->unk_12C;
            ++data->unk_130;
            if (screen == 0) {
                G2_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->unk_12C,
                    data->unk_130);
            } else {
                G2S_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->unk_12C,
                    data->unk_130);
            }
        } else {
            data->unk_128 = 3;
            if (param == 101) {
                GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
            } else if (param == 102) {
                GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
            } else {
                ToggleBgLayer(param, GF_PLANE_TOGGLE_OFF);
            }
        }
        break;
    case 3:
        G2_BlendNone();
        G2S_BlendNone();
        ret           = TRUE;
        data->unk_128 = 0;
        break;
    }

    return ret;
}

BOOL ov53_021E60CC(OaksSpeechData *data, int a1) {
    if (data->unk_13C < a1) {
        ++data->unk_13C;
        return FALSE;
    } else {
        data->unk_13C = 0;
        return TRUE;
    }
}

void ov53_021E60E8(OaksSpeechData *data, int bgId, int palette) {
    BgTilemapRectChangePalette(data->bgConfig, bgId, 0, 0, 32, 24, palette);
    BgCommitTilemapBufferToVram(data->bgConfig, bgId);
}

BOOL ov53_021E611C(OaksSpeechData *data, int msgNum, int waitButtonMode) {
    BOOL ret = FALSE;

    switch (data->unk_104) {
    case 0: {
        AddWindow(data->bgConfig, &data->window_1, &ov53_021E8500);
        FillWindowPixelRect(&data->window_1, 0xF, 0, 0, 216, 32);
        DrawFrameAndWindow2(&data->window_1, FALSE, 0x3E2, 4);

        TextFlags_SetCanABSpeedUpPrint(TRUE);
        sub_02002B50(FALSE);

        String *temp = String_New(0x400, data->heapId);
        data->string = String_New(0x400, data->heapId);
        ReadMsgDataIntoString(data->msgData, msgNum, temp);
        BufferString(data->msgFormat, 0, data->namingScreenArgs_Player->unk18, data->playerGender, 1, 2);
        BufferString(data->msgFormat, 1, data->namingScreenArgs_Rival->unk18, 0, 1, 2);
        StringExpandPlaceholders(data->msgFormat, data->string, temp);
        String_Delete(temp);

        data->textPrinter = AddTextPrinterParameterized(&data->window_1, 1, data->string, 0, 0, Options_GetTextFrameDelay(data->options), NULL);
        data->unk_104     = 1;
        break;
    }
    case 1:
        if (!TextPrinterCheckActive(data->textPrinter)) {
            String_Delete(data->string);
            data->unk_104 = 2;
        }
        break;
    case 2:
        if (waitButtonMode == 0) {
            if ((gSystem.newKeys & PAD_BUTTON_A) == TRUE) {
                data->unk_16C = 0;
                PlaySE(SEQ_SE_DP_SELECT);
                ret = TRUE;
            }
        } else {
            ret = TRUE;
        }
        if (ret != FALSE) {
            RemoveWindow(&data->window_1);
            data->unk_104 = 0;
        }
        break;
    }

    return ret;
}

BOOL ov53_021E628C(OaksSpeechData *data, int msgNum, int a2, int a3, int a4) {
    BOOL ret = FALSE;
    WindowTemplate sp18;

    switch (data->unk_108) {
    case 0:
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
        data->string = String_New(0x400, data->heapId);
        ReadMsgDataIntoString(data->msgData, msgNum, data->string);
        if (a3 == 0xFFFF) {
            a3 = (24 - (2 * String_CountLines(data->string))) / 2;
        }
        if (a4 == 0xFFFF) {
            a4 = 2 * String_CountLines(data->string);
        }
        switch (a2) {
        case 1:
            sp18        = ov53_021E8520[0];
            sp18.top    = a3;
            sp18.height = a4;
            AddWindow(data->bgConfig, &data->window_0, &sp18);
            FillWindowPixelRect(&data->window_0, 0, 0, 0, 0xC0, 0xC0);
            AddTextPrinterParameterizedWithColor(&data->window_0, 0, data->string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
            break;
        case 0:
        case 2:
        case 3:
            sp18        = ov53_021E8520[1];
            sp18.top    = a3;
            sp18.height = a4;
            if (a2 == 3) {
                sp18.left += 4;
            }
            AddWindow(data->bgConfig, &data->window_0, &sp18);
            FillWindowPixelRect(&data->window_0, 0, 0, 0, 0xC0, 0xC0);
            AddTextPrinterParameterizedWithColor(&data->window_0, 0, data->string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(15, 2, 0), NULL);
            break;
        }
        String_Delete(data->string);
        data->unk_108 = 1;
        break;
    case 1:
        CopyWindowToVram(&data->window_0);
        data->unk_108 = 2;
        break;
    case 2:
        if (ov53_021E5EDC(data, GF_BG_LYR_MAIN_0, FALSE) == TRUE) {
            data->unk_108 = 3;
            if (a2 == 2) {
                data->unk_108 = 4;
                ret           = TRUE;
            }
        }
        break;
    case 3:
        if ((gSystem.newKeys & PAD_BUTTON_A) == PAD_BUTTON_A || (gSystem.newKeys & PAD_BUTTON_B) == PAD_BUTTON_B) {
            data->unk_16C = (gSystem.touchNew) ? TRUE : FALSE;
            PlaySE(SEQ_SE_DP_SELECT);
            data->unk_108 = 4;
        }
        break;
    case 4:
        if (ov53_021E5EDC(data, GF_BG_LYR_MAIN_0, TRUE) == TRUE) {
            data->unk_108 = 5;
        }
        break;
    case 5:
        RemoveWindow(&data->window_0);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
        data->unk_108 = 0;
        ret           = TRUE;
        break;
    }

    return ret;
}

BOOL ov53_021E64B4(OaksSpeechData *data, int msgNum, int a2) {
    return ov53_021E628C(data, msgNum, a2, 0xFFFF, 0xFFFF);
}

void ov53_021E64C4(OaksSpeechData *data, int msg1, int msg2, int msg3, int numChoices) {
    int msgIds[3];
    int i;
    int x;
    int y;
    String *string;

    msgIds[0] = msg1;
    msgIds[1] = msg2;
    msgIds[2] = msg3;

    data->unk_07C = numChoices;
    if (numChoices == 2) {
        y = 4;
    }
    if (numChoices == 3) {
        y = 8;
    }
    for (i = 0; i < numChoices; ++i) {
        string = String_New(0x400, data->heapId);
        ReadMsgDataIntoString(data->msgData, msgIds[i], string);
        x = FontID_String_GetWidth(0, string, 0);
        AddWindow(data->bgConfig, &data->windows_2thru6[i], &ov53_021E8680[numChoices - 2][i]);
        FillWindowPixelRect(&data->windows_2thru6[i], 0, 0, 0, 0xC0, 0xC0);
        AddTextPrinterParameterizedWithColor(&data->windows_2thru6[i], 4, string, (ov53_021E8680[numChoices - 2][i].width * 8 - x) / 2, y, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(15, 1, 0), NULL);
        CopyWindowToVram(&data->windows_2thru6[i]);
        String_Delete(string);
    }
}

void ov53_021E65B4(OaksSpeechData *data) {
    for (int i = 0; i < data->unk_07C; ++i) {
        RemoveWindow(&data->windows_2thru6[i]);
    }
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
}

void ov53_021E65E0(OaksSpeechData *data) {
    int plttId_Main;
    int plttId_Sub;
    NNSG2dPaletteData *plttData;
    void *plttData_raw;

    GfGfxLoader_LoadCharData(NARC_a_1_2_0, 0, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, data->heapId);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, data->heapId);
    GfGfxLoader_LoadCharData(NARC_a_1_2_0, 32, data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, data->heapId);
    if (gGameVersion == VERSION_HEARTGOLD) {
        plttId_Main = 1;
        plttId_Sub  = 30;
    } else {
        plttId_Main = 2;
        plttId_Sub  = 31;
    }
    GfGfxLoader_GXLoadPal(NARC_a_1_2_0, plttId_Main, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x60, data->heapId);
    GfGfxLoader_GXLoadPal(NARC_a_1_2_0, plttId_Sub, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0xA0, data->heapId);

    plttData_raw  = GfGfxLoader_GetPlttData(NARC_a_1_2_0, plttId_Sub, &plttData, data->heapId);
    data->unk_136 = ((const u16 *)plttData->pRawData)[12];
    FreeToHeap(plttData_raw);

    ov53_021E66A8(data, 1);
    ov53_021E66E8(data, 0, 0);
    ov53_021E67C4(data, 0);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB_BLACK);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
}

void ov53_021E66A8(OaksSpeechData *data, int a1) {
    extern const int ov53_021E856C[6];
    int sp10[6];
    ARRAY_ASSIGN(sp10, ov53_021E856C);

    if (a1 < 6) {
        GfGfxLoader_LoadScrnData(NARC_a_1_2_0, sp10[a1], data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, data->heapId);
    }
}

void ov53_021E66E8(OaksSpeechData *data, int a1, int a2) {
    extern const int ov53_021E86F0[10][2];
    int sp10[10][2];
    ARRAY_ASSIGN(sp10, ov53_021E86F0);

    if (a1 != 0 && a2 < 12) { // possible typo?
        GfGfxLoader_LoadCharData(NARC_a_1_2_0, sp10[a1][0], data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, data->heapId);
        GfGfxLoader_GXLoadPal(NARC_a_1_2_0, sp10[a1][1], GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0xE0, 32, data->heapId);
        GfGfxLoader_LoadScrnData(NARC_a_1_2_0, 9, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, data->heapId);
        ov53_021E60E8(data, GF_BG_LYR_MAIN_1, 7);
    }

    if (a2 != 0 && a2 < 12) {
        GfGfxLoader_LoadCharData(NARC_a_1_2_0, sp10[a2][0], data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, data->heapId);
        GfGfxLoader_GXLoadPal(NARC_a_1_2_0, sp10[a2][1], GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x100, 32, data->heapId);
        GfGfxLoader_LoadScrnData(NARC_a_1_2_0, 9, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, data->heapId);
        ov53_021E60E8(data, GF_BG_LYR_MAIN_2, 8);
    }
}

void ov53_021E67C4(OaksSpeechData *data, int a1) {
    extern const int ov53_021E8558[5];
    int sp10[5];
    ARRAY_ASSIGN(sp10, ov53_021E8558);

    if (a1 < 5) {
        GfGfxLoader_LoadScrnData(NARC_a_1_2_0, sp10[a1], data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, data->heapId);
        if (a1 == 1) {
            ov53_021E60E8(data, GF_BG_LYR_SUB_3, 3);
        } else if (a1 == 2) {
            ov53_021E60E8(data, GF_BG_LYR_SUB_3, 2);
        }
    }
}

void ov53_021E6824(OaksSpeechData *data, int a1) {
    extern const int ov53_021E8584[3][2];
    int sp10[3][2];
    ARRAY_ASSIGN(sp10, ov53_021E8584);

    GfGfxLoader_LoadScrnData(NARC_a_1_2_0, sp10[a1][0], data->bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, data->heapId);
    ov53_021E60E8(data, GF_BG_LYR_SUB_2, 7);
    GfGfxLoader_GXLoadPal(NARC_a_1_2_0, 33, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0xE0, 0x60, data->heapId);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_2, 0x20, 0, data->heapId);
    GfGfxLoader_LoadCharData(NARC_a_1_2_0, sp10[a1][1], data->bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, data->heapId);
    ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, 0);
    if (a1 == 1) {
        if (data->playerGender == PLAYER_GENDER_MALE) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0x88);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SET_X, 0x88);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_X, 0x88);
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0x00);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SET_X, 0x00);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_X, 0x00);
        }
    }
}

void ov53_021E6908(OakSpeechData_Sub160 *dest, int a1) {
    dest->unk_3 = 0;
    dest->unk_0 = 0;
    dest->unk_1 = ov53_021E86B0[a1][1];
    dest->unk_6 = 0;
    dest->unk_4 = 0;
    dest->unk_5 = 16;
    dest->unk_2 = 0;
}

void ov53_021E6928(OaksSpeechData *data, int a1) {
    data->unk_160.unk_0 = 0;
    data->unk_160.unk_1 = ov53_021E86B0[a1][1];
    data->unk_160.unk_4 = 0;
    data->unk_160.unk_5 = 16;
    GfGfxLoader_LoadScrnData(NARC_a_1_2_0, ov53_021E86B0[a1][0], data->bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, data->heapId);
    GfGfxLoader_LoadCharData(NARC_a_1_2_0, 42, data->bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, data->heapId);
}

int ov53_021E6988(OaksSpeechData *data, int a1) {
    int ret = -1;
    int r6;

    extern const TouchscreenHitbox ov53_021E8650[3][4];
    TouchscreenHitbox sp0[3][4];
    ARRAY_ASSIGN(sp0, ov53_021E8650);

    if (data->unk_160.unk_6 != 0) {
        ++data->unk_160.unk_6;
        if (data->unk_160.unk_6 > 20) {
            data->unk_160.unk_6 = 0;
            ret                 = data->unk_160.unk_3;
        }
    } else if (gSystem.touchNew) {
        r6 = TouchscreenHitbox_FindRectAtTouchNew(sp0[a1]);
        if (r6 != -1) {
            ov53_021E6928(data, a1);
            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_ON);
            data->unk_160.unk_3 = r6;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, ov53_021E8604[a1][data->unk_160.unk_3]);
            data->unk_160.unk_6 = 1;
            data->unk_160.unk_5 = 2;
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (data->unk_160.unk_2 == 0) {
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN)) {
            PlaySE(SEQ_SE_DP_SELECT);
            ov53_021E6928(data, a1);
            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_ON);
            data->unk_160.unk_2 = 1;
        }
    } else if (gSystem.newKeys & PAD_KEY_UP) {
        if (data->unk_160.unk_3 != 0) {
            --data->unk_160.unk_3;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, ov53_021E8604[a1][data->unk_160.unk_3]);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        if (data->unk_160.unk_3 != data->unk_160.unk_1 - 1) {
            ++data->unk_160.unk_3;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, ov53_021E8604[a1][data->unk_160.unk_3]);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        data->unk_160.unk_6 = 1;
        data->unk_160.unk_5 = 2;
        PlaySE(SEQ_SE_DP_SELECT);
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        data->unk_160.unk_3 = data->unk_160.unk_1 - 1;
        data->unk_160.unk_6 = 1;
        data->unk_160.unk_5 = 2;
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, ov53_021E8604[a1][data->unk_160.unk_3]);
        PlaySE(SEQ_SE_DP_SELECT);
    }
    if (data->unk_160.unk_6) {
        ++data->unk_160.unk_4;
        if (data->unk_160.unk_4 > data->unk_160.unk_5) {
            data->unk_160.unk_7 ^= 1;
            data->unk_160.unk_4 = 0;
            if (data->unk_160.unk_7 != 0) {
                ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_ON);
            } else {
                ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
            }
        }
    }

    return ret;
}

u16 ov53_021E6B9C(u16 a0, s8 a1) {
    int r = a0 & 0x1F;
    int g = (a0 >> 5) & 0x1F;
    int b = (a0 >> 10);

    r += a1;
    g += a1;
    b += a1;

    if (r > 31) {
        r = 31;
    } else if (r < 0) {
        r = 0;
    }
    if (g > 31) {
        g = 31;
    } else if (g < 0) {
        g = 0;
    }
    if (b > 31) {
        b = 31;
    } else if (b < 0) {
        b = 0;
    }
    return (b << 10) | (g << 5) | r;
}

void ov53_021E6BEC(OaksSpeechData *data, int a1) {
    int r4 = 0;
    u16 sp0[2];

    GF_ASSERT(data->unk_160.unk_3 == 0 || data->unk_160.unk_3 == 1);
    if (a1 == 0) {
        r4 = (GF_SinDeg((data->unk_168++) * 10) * 8) >> FX32_SHIFT;
    } else {
        data->unk_168 = 0;
    }
    sp0[0] = ov53_021E6B9C(data->unk_136, r4);
    sp0[1] = ov53_021E6B9C(RGB(31, 7, 7), 0);
    BG_LoadPlttData(6, sp0, 4, ov53_021E8508[data->unk_160.unk_3] * 2);
    sp0[0] = data->unk_136;
    sp0[1] = RGB(27, 28, 28);
    BG_LoadPlttData(6, sp0, 4, ov53_021E8508[!data->unk_160.unk_3] * 2);
}

void ov53_021E6CB0(OaksSpeechData *data) {
    u16 sp0[2];

    sp0[0] = data->unk_136;
    sp0[1] = RGB(27, 28, 28);
    BG_LoadPlttData(6, sp0, 4, 0x18);
    BG_LoadPlttData(6, sp0, 4, 0x1C);
}

BOOL ov53_021E6CE0(OaksSpeechData *data) {
    BOOL ret = FALSE;
    int r6;

    extern const TouchscreenHitbox ov53_021E8530[3];
    TouchscreenHitbox sp0[3];
    ARRAY_ASSIGN(sp0, ov53_021E8530);

    if (gSystem.touchNew) {
        r6 = TouchscreenHitbox_FindRectAtTouchNew(sp0);
        if (r6 != -1) {
            data->unk_160.unk_3 = r6;
            data->unk_160.unk_6 = 1;
            data->unk_160.unk_5 = 2;
            ov53_021E6BEC(data, 1);
            PlaySE(SEQ_SE_DP_SELECT);
            data->unk_17C = r6;
            ret           = TRUE;
        }
    } else if (!data->unk_160.unk_2) {
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_KEY_LEFT | PAD_KEY_RIGHT)) {
            PlaySE(SEQ_SE_DP_SELECT);
            data->unk_160.unk_2 = 1;
            ov53_021E6BEC(data, 1);
        }
    } else {
        ov53_021E6BEC(data, 0);
        if (gSystem.newKeys & PAD_KEY_LEFT) {
            if (data->unk_160.unk_3 != 0) {
                --data->unk_160.unk_3;
                PlaySE(SEQ_SE_DP_SELECT);
            }
        } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
            if (data->unk_160.unk_3 != data->unk_160.unk_1 - 1) {
                ++data->unk_160.unk_3;
                PlaySE(SEQ_SE_DP_SELECT);
            }
        } else if (gSystem.newKeys & PAD_BUTTON_A) {
            data->unk_160.unk_2 = 0;
            data->unk_160.unk_6 = 1;
            data->unk_160.unk_5 = 2;
            ov53_021E6BEC(data, 1);
            PlaySE(SEQ_SE_DP_SELECT);
            ret           = TRUE;
            data->unk_17C = data->unk_160.unk_3;
        }
    }

    return ret;
}

void ov53_021E6DF0(OaksSpeechData *data) {
    data->unk_140 = 0;
    data->unk_144 = 0;
}

BOOL ov53_021E6E00(OaksSpeechData *data) {
    BOOL ret = FALSE;
    int r1;

    if (data->unk_144 != 0) {
        --data->unk_144;
    } else {
        ++data->unk_140;
        data->unk_144 = 8;
    }
    if (data->playerGender == PLAYER_GENDER_MALE) {
        extern const int ov53_021E859C[6];
        int sp28[6];
        ARRAY_ASSIGN(sp28, ov53_021E859C);
        r1 = sp28[data->unk_140];
    } else {
        extern const int ov53_021E85B4[6];
        int sp10[6];
        ARRAY_ASSIGN(sp10, ov53_021E85B4);
        r1 = sp10[data->unk_140];
    }
    if (r1 == 0xFF) {
        ret = TRUE;
    } else {
        GfGfxLoader_LoadCharData(NARC_a_1_2_0, r1, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, data->heapId);
    }

    return ret;
}

int ov53_021E6E7C(OaksSpeechData *data) {
    RTCDate date;
    RTCTime time;
    int ret = msg_0219_00001;
    GF_RTC_CopyDateTime(&date, &time);
    u32 time_hhmm = time.minute + time.hour * 100;
    if (time_hhmm >= 400 && time_hhmm <= 1059) {
        ret = msg_0219_00001;
    } else if (time_hhmm >= 1100 && time_hhmm <= 1559) {
        ret = msg_0219_00002;
    } else if (time_hhmm >= 1600 && time_hhmm <= 1859) {
        ret = msg_0219_00003;
    } else if (time_hhmm >= 1900 && time_hhmm <= 2359) {
        ret = msg_0219_00004;
    } else if (time_hhmm >= 0 && time_hhmm <= 359) {
        ret = msg_0219_00005;
    }
    return ret;
}
