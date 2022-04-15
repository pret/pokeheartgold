#include "communication_error.h"
#include "gx_layers.h"
#include "msgdata.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0041.h"
#include "pm_string.h"
#include "system.h"
#include "unk_0200FA24.h"
#include "window.h"
#include "font.h"
#include "text.h"
#include "unk_0200E398.h"
#include "unk_0200B380.h"
#include "unk_02037C94.h"
#include "overlay_00_thumb.h"

static const GF_GXBanksConfig sCommunicationErrorBanksConfig = {
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

static const struct GFBgModeSet sCommunicationErrorBgModeSet = {
    .dispMode = GX_DISPMODE_GRAPHICS,
    .bgModeMain = GX_BGMODE_0,
    .bgModeSub = GX_BGMODE_0,
    ._2d3dSwitch = GX_BG0_AS_2D,
};

static const BGTEMPLATE sCommunicationErrorBgTemplate = {
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

static const WINDOWTEMPLATE sCommunicationErrorWindowTemplate = {
    .bgId = 0,
    .left = 3,
    .top = 3,
    .width = 26,
    .height = 18,
    .palette = 1,
    .baseBlock = 0x23,
};

static void VBlankIntr(void) {
    OS_SetIrqCheckFlag(OS_IE_VBLANK);
    MI_WaitDma(GX_DEFAULT_DMAID);
}

static BOOL sub_0203A9FC(u32* error_code_ptr) {
    if (!sub_020393C8() || !sub_02037D78()) {
        return FALSE;
    }

    // TODO: this is probably a struct.
    u32* unk = sub_020392D8();
    s32 unk2 = ov00_021E6A70(unk[0], unk[1]);

    *error_code_ptr = unk[0];

    if ((unk2 == 11 || (unk2 >= 14 || unk[0] == 25 || unk[0] == 26)) && unk[1] != 2) {
        return FALSE;
    }

    return TRUE;
}

void ShowCommunicationError(HeapID heap_id, u32 error, u32 error_code) {
    WINDOW window;

    s32 msg_no;
    switch (error) {
    default:
        msg_no = msg_0041_00001;
        break;
    case 1:
        msg_no = msg_0041_00002;
        break;
    case 2:
        msg_no = msg_0041_00003;
        break;
    case 3:
        msg_no = msg_0041_00004;
        break;
    case 4:
        msg_no = msg_0041_00005;
        break;
    case 5:
        if (!sub_0203A9FC(&error_code)) {
            msg_no = msg_0041_00006;
        } else {
            msg_no = msg_0041_00008;
        }
        break;
    case 6:
        if (!sub_0203A9FC(&error_code)) {
            msg_no = msg_0041_00007;
        } else {
            msg_no = msg_0041_00009;
        }
        break;
    }

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
    GX_SetBanks(&sCommunicationErrorBanksConfig);

    BGCONFIG* bg_config = BgConfig_Alloc(heap_id);
    SetBothScreensModesAndDisable(&sCommunicationErrorBgModeSet);
    InitBgFromTemplate(bg_config, 0, &sCommunicationErrorBgTemplate, GX_BGMODE_0);
    BgClearTilemapBufferAndCommit(bg_config, GF_BG_LYR_MAIN_0);
    LoadUserFrameGfx1(bg_config, GF_BG_LYR_MAIN_0, 0x1F7, 2, 0, heap_id);
    LoadFontPal0(GF_BG_LYR_MAIN_0, 0x20, heap_id);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, heap_id);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB(1, 1, 27));
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB(1, 1, 27));

    MSGDATA* errors_msgdata = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0041_bin, heap_id);
    STRING* error_str = String_ctor(384, heap_id);
    STRING* tmp_str = String_ctor(384, heap_id);

    ResetAllTextPrinters();

    MSGFMT* msg_fmt = ScrStrBufs_new(heap_id);

    AddWindow(bg_config, &window, &sCommunicationErrorWindowTemplate);
    FillWindowPixelRect(&window, 0xF, 0, 0, 208, 144);
    DrawFrameAndWindow1(&window, FALSE, 0x1F7, 2);

    BufferIntegerAsString(msg_fmt, 0, error_code, 5, STRCONVMODE_LEADING_ZEROS, TRUE);
    ReadMsgDataIntoString(errors_msgdata, msg_no, tmp_str);
    StringExpandPlaceholders(msg_fmt, error_str, tmp_str);
    AddTextPrinterParameterized(&window, 0, error_str, 0, 0, 0, NULL);
    String_dtor(error_str);
    // BUG: tmp_str is never destroyed.

    GX_BothDispOn();
    SetMasterBrightnessNeutral(0);
    SetMasterBrightnessNeutral(1);
    SetBlendBrightness(0, 0x3F, 3);

    RemoveWindow(&window);
    DestroyMsgData(errors_msgdata);
    ScrStrBufs_delete(msg_fmt);
    FreeToHeap(bg_config);
}
