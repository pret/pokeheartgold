#include <nitro/gx/g2.h>
#include <nitro/gx/gx_bgcnt.h>
#include <nitro/pad/common/pad.h>
#include "error_message_reset.h"
#include "gx_layers.h"
#include "main.h"
#include "msgdata.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0041.h"
#include "pm_string.h"
#include "system.h"
#include "unk_0200FA24.h"
#include "unk_02035900.h"
#include "unk_02037C94.h"
#include "unk_0200E398.h"
#include "unk_0200B380.h"
#include "text.h"
#include "font.h"
#include "window.h"

static const GF_GXBanksConfig sErrorMessageBanksConfig = {
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

static const struct GFBgModeSet sErrorMessageBgModeSet = {
    .dispMode = GX_DISPMODE_GRAPHICS,
    .bgModeMain = GX_BGMODE_0,
    .bgModeSub = GX_BGMODE_0,
    ._2d3dSwitch = GX_BG0_AS_2D,
};

static const BGTEMPLATE sErrorMessageBgTemplate = {
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

static const WINDOWTEMPLATE sErrorMessageWindowTemplate = {
    .bgId = 0,
    .left = 3,
    .top = 3,
    .width = 26,
    .height = 18,
    .palette = 1,
    .baseBlock = 0x23,
};

static const HEAP_PARAM sErrorMessageHeapParams = {
    .size = 0x20000,
    .arena = OS_ARENA_MAIN,
};

static BOOL sErrorMessagePrinterLock;

static void VBlankIntr() {
    OS_SetIrqCheckFlag(OS_IE_VBLANK);
    MI_WaitDma(GX_DEFAULT_DMAID);
}

void PrintErrorMessageAndReset(void) {
    WINDOW window;

    if (sErrorMessagePrinterLock == TRUE) {
        return;
    }

    sErrorMessagePrinterLock = TRUE;

    OS_SetArenaHi(OS_ARENA_MAIN, OS_GetInitArenaHi(OS_ARENA_MAIN));
    OS_SetArenaLo(OS_ARENA_MAIN, OS_GetInitArenaLo(OS_ARENA_MAIN));
    InitHeapSystem(&sErrorMessageHeapParams, 1, 1, 0);

    sub_0200FBF4(0, 0);
    sub_0200FBF4(1, 0);

    OS_DisableIrqMask(OS_IE_VBLANK);
    OS_SetIrqFunction(OS_IE_VBLANK, VBlankIntr);
    OS_EnableIrqMask(OS_IE_VBLANK);

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
    GX_SetBanks(&sErrorMessageBanksConfig);

    BGCONFIG* bg_config = BgConfig_Alloc(0);
    SetBothScreensModesAndDisable(&sErrorMessageBgModeSet);
    InitBgFromTemplate(bg_config, 0, &sErrorMessageBgTemplate, GX_BGMODE_0);
    BgClearTilemapBufferAndCommit(bg_config, GF_BG_LYR_MAIN_0);
    LoadUserFrameGfx1(bg_config, GF_BG_LYR_MAIN_0, 0x1F7, 2, 0, 0);
    LoadFontPal0(GF_BG_LYR_MAIN_0, 0x20, 0);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, 0);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB(1, 1, 27));
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB(1, 1, 27));

    MSGDATA* error_msgdata = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0041_bin, 0);
    STRING* error_str = String_ctor(384, 0);

    ResetAllTextPrinters();

    AddWindow(bg_config, &window, &sErrorMessageWindowTemplate);
    FillWindowPixelRect(&window, 0xF, 0, 0, 208, 144);
    DrawFrameAndWindow1(&window, FALSE, 0x1F7, 2);

    ReadMsgDataIntoString(error_msgdata, msg_0041_00003, error_str);
    AddTextPrinterParameterized(&window, 0, error_str, 0, 0, 0, NULL);
    String_dtor(error_str);

    GX_BothDispOn();
    SetMasterBrightnessNeutral(0);
    SetMasterBrightnessNeutral(1);
    SetBlendBrightness(0, 0x3F, 3);

    sub_02038D90();

    while (TRUE) {
        HandleDSLidAction();
        sub_02036144();

        if (sub_02039AA4()) {
            break;
        }

        OS_WaitIrq(TRUE, OS_IE_VBLANK);
    }

    while (TRUE) {
        HandleDSLidAction();

        if (PAD_Read() & PAD_BUTTON_A) {
            break;
        }

        OS_WaitIrq(TRUE, OS_IE_VBLANK);
    }

    sub_0200FBF4(0, 0x7FFF);
    sub_0200FBF4(1, 0x7FFF);

    RemoveWindow(&window);
    DestroyMsgData(error_msgdata);
    FreeToHeap(bg_config);

    OS_ResetSystem(0);
}
