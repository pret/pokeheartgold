#include "gx_layers.h"
#include "main.h"
#include "msgdata.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0800.h"
#include "pm_string.h"
#include "system.h"
#include "unk_0200FA24.h"
#include "wfc_user_info_warning.h"
#include "window.h"
#include "unk_0200E398.h"
#include "unk_0200B380.h"
#include "text.h"
#include "font.h"

static const GF_GXBanksConfig sWFCWarningMsgBanksConfig = {
    .bg = GX_VRAM_BG_256_AB,
    .bgextpltt = GX_VRAM_BGEXTPLTT_NONE,
    .subbg = GX_VRAM_SUB_BG_NONE,
    .subbgextpltt = GX_VRAM_SUB_BGEXTPLTT_NONE,
    .obj = GX_VRAM_OBJ_NONE,
    .objextpltt = GX_VRAM_OBJEXTPLTT_NONE,
    .subobj = GX_VRAM_SUB_OBJ_NONE,
    .subobjextpltt = GX_VRAM_SUB_OBJEXTPLTT_NONE,
    .tex = GX_VRAM_TEX_NONE,
    .texpltt = GX_VRAM_TEXPLTT_NONE,
};

static const struct GFBgModeSet sWFCWarningMsgBgModeSet = {
    .dispMode = GX_DISPMODE_GRAPHICS,
    .bgModeMain = GX_BGMODE_0,
    .bgModeSub = GX_BGMODE_0,
    ._2d3dSwitch = GX_BG0_AS_2D,
};

static const BGTEMPLATE sWFCWarningBgTemplate = {
    .x = 0,
    .y = 0,
    .bufferSize = 0x800,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x0000,
    .charBase = GX_BG_CHARBASE_0x18000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 1,
    .areaOver = GX_BG_AREAOVER_XLU,
    .dummy = 0,
    .mosaic = FALSE,
};

static const WINDOWTEMPLATE sWFCWarningWindowTemplate = {
    .bgId = 0,
    .left = 3,
    .top = 3,
    .width = 26,
    .height = 18,
    .palette = 1,
    .baseBlock = 0x23,
};

void ShowWFCUserInfoWarning(HeapID heap_id, int a1) {
#pragma unused(a1)
    WINDOW window;

    sub_0200FBF4(0, 0);
    sub_0200FBF4(1, 0);

    Main_SetVBlankIntrCB(NULL, NULL);
    Main_SetHBlankIntrCB(NULL, NULL);

    GX_DisableEngineALayers();
    GX_DisableEngineBLayers();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);

    SetKeyRepeatTimers(4, 8);

    gSystem.screensFlipped = FALSE;

    GX_SwapDisplay();
    G2_BlendNone();
    G2S_BlendNone();
    GX_SetVisibleWnd(0);
    GXS_SetVisibleWnd(0);
    GX_SetBanks(&sWFCWarningMsgBanksConfig);

    BGCONFIG* bg_config = BgConfig_Alloc(heap_id);
    SetBothScreensModesAndDisable(&sWFCWarningMsgBgModeSet);
    InitBgFromTemplate(bg_config, 0, &sWFCWarningBgTemplate, GX_BGMODE_0);
    BgClearTilemapBufferAndCommit(bg_config, GF_BG_LYR_MAIN_0);
    LoadUserFrameGfx1(bg_config, GF_BG_LYR_MAIN_0, 0x1F7, 2, 0, heap_id);
    LoadFontPal0(GF_BG_LYR_MAIN_0, 0x20, heap_id);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, heap_id);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB(1, 1, 27));
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB(1, 1, 27));

    MSGDATA* warnings_msgdata = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0800_bin, heap_id);
    STRING* warning_string = String_ctor(384, heap_id);

    ResetAllTextPrinters();

    AddWindow(bg_config, &window, &sWFCWarningWindowTemplate);
    FillWindowPixelRect(&window, 0xF, 0, 0, 208, 144);
    DrawFrameAndWindow1(&window, FALSE, 0x1F7, 2);

    ReadMsgDataIntoString(warnings_msgdata, msg_0800_00016, warning_string);
    AddTextPrinterParameterized(&window, 0, warning_string, 0, 0, 0, NULL);
    String_dtor(warning_string);

    GX_BothDispOn();
    SetMasterBrightnessNeutral(0);
    SetMasterBrightnessNeutral(1);
    SetBlendBrightness(0, 0x3F, 3);

    while (TRUE) {
        u16 pressed_buttons = PAD_Read();

        HandleDSLidAction();

        if (pressed_buttons & PAD_BUTTON_A) {
            break;
        }

        OS_WaitIrq(TRUE, OS_IE_VBLANK);
    }

    RemoveWindow(&window);
    DestroyMsgData(warnings_msgdata);
    ToggleBgLayer(GF_BG_LYR_MAIN_0, GX_LAYER_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_1, GX_LAYER_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GX_LAYER_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_3, GX_LAYER_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_0, GX_LAYER_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_1, GX_LAYER_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_2, GX_LAYER_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_3, GX_LAYER_TOGGLE_OFF);
    FreeBgTilemapBuffer(bg_config, GF_BG_LYR_MAIN_0);
    FreeToHeap(bg_config);
}
