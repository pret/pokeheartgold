#include "oaks_speech.h"

#include "global.h"

#include "font.h"
#include "launch_application.h"
#include "main.h"
#include "overlay_36.h"
#include "overlay_manager.h"
#include "player_data.h"
#include "render_text.h"
#include "unk_0200FA24.h"
#include "unk_02082908.h"

FS_EXTERN_OVERLAY(OVY_36);

typedef struct OaksSpeechData_Sub178 {
} OaksSpeechData_Sub178;

typedef struct OaksSpeechData {
    HeapID heapId;      // 0x000
    SaveData *saveData; // 0x004
    Options *options;   // 0x008
    int unk_00C;
    int unk_010;
    OVY_MANAGER *unk_014;
    BgConfig *bgConfig; // 0x018
    u8 filler_01C[0xB8];
    SpriteGfxHandler *unk_0D4;
    int unk_0D8;
    u8 filler_0DC[0xC];
    int unk_0E8;
    u8 filler_0EC[0x34];
    NamingScreenArgs *namingScreenArgs_Player; // 0x120
    NamingScreenArgs *namingScreenArgs_Rival;  // 0x124
    int unk_128;
    u8 filler_12C[0x10];
    int unk_13C;
    u8 filler_140[0x38];
    OaksSpeechData_Sub178 *unk_178;
    int unk_17C;
} OaksSpeechData; // size: 0x180

void ov53_021E5BCC(void *cbArg);
void ov53_021E5BDC(OaksSpeechData *data);
void ov53_021E5DE0(OaksSpeechData *data);
void ov53_021E5EB8(OaksSpeechData *data);
void ov53_021E5E6C(OaksSpeechData *data);
void ov53_021E65E0(OaksSpeechData *data);
BOOL ov53_021E6F9C(OaksSpeechData *data);
void ov53_021E7ECC(OaksSpeechData *data);
void ov53_021E7F24(OaksSpeechData *data);
void ov53_021E7FEC(OaksSpeechData *data);
void ov53_021E8014(OaksSpeechData *data);
void *ov53_021E80F4(BgConfig *bgConfig, int a1, int a2, int a3, int a4, HeapID heapId);
void ov53_021E814C(OaksSpeechData_Sub178 *a0);

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
