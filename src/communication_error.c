#include "communication_error.h"

#include "global.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0041.h"

#include "bg_window.h"
#include "brightness.h"
#include "font.h"
#include "gf_gfx_planes.h"
#include "msgdata.h"
#include "overlay_00_thumb.h"
#include "pm_string.h"
#include "render_window.h"
#include "system.h"
#include "text.h"
#include "unk_0200FA24.h"
#include "unk_02037C94.h"

static const GraphicsBanks sCommunicationErrorGraphicsBanks = {
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

static const struct GraphicsModes sCommunicationErrorGraphicsModes = {
    .dispMode = GX_DISPMODE_GRAPHICS,
    .bgMode = GX_BGMODE_0,
    .subMode = GX_BGMODE_0,
    ._2d3dMode = GX_BG0_AS_2D,
};

static const BgTemplate sCommunicationErrorBgTemplate = {
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

static const WindowTemplate sCommunicationErrorWindowTemplate = {
    .bgId = GF_BG_LYR_MAIN_0,
    .left = 3,
    .top = 3,
    .width = 26,
    .height = 18,
    .palette = 1,
    .baseTile = 0x23,
};

static void VBlankIntr(void);

static void VBlankIntr(void) {
    OS_SetIrqCheckFlag(OS_IE_VBLANK);
    MI_WaitDma(GX_DEFAULT_DMAID);
}

static BOOL sub_0203A9FC(u32 *error_code_ptr) {
    if (!sub_020393C8() || !sub_02037D78()) {
        return FALSE;
    }

    // TODO: this is probably a struct.
    u32 *unk = sub_020392D8();
    s32 unk2 = ov00_021E6A70(unk[0], unk[1]);

    *error_code_ptr = unk[0];

    if ((unk2 == 11 || (unk2 >= 14 || unk[0] == 25 || unk[0] == 26)) && unk[1] != 2) {
        return FALSE;
    }

    return TRUE;
}

void ShowCommunicationError(enum HeapID heapID, u32 error, u32 errorCode) {
    Window window;

    u32 msgNo;
    switch (error) {
    default:
    case 0:
        msgNo = msg_0041_00001;
        break;
    case 1:
        msgNo = msg_0041_00002;
        break;
    case 2:
        msgNo = msg_0041_00003;
        break;
    case 3:
        msgNo = msg_0041_00004;
        break;
    case 4:
        msgNo = msg_0041_00005;
        break;
    case 5:
        if (!sub_0203A9FC(&errorCode)) {
            msgNo = msg_0041_00006;
        } else {
            msgNo = msg_0041_00008;
        }
        break;
    case 6:
        if (!sub_0203A9FC(&errorCode)) {
            msgNo = msg_0041_00007;
        } else {
            msgNo = msg_0041_00009;
        }
        break;
    }

    sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);

    OS_DisableIrqMask(OS_IE_VBLANK);
    OS_SetIrqFunction(OS_IE_VBLANK, VBlankIntr);
    OS_EnableIrqMask(OS_IE_VBLANK);

    Main_SetVBlankIntrCB(NULL, NULL);
    Main_SetHBlankIntrCB(NULL, NULL);

    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);

    SetKeyRepeatTimers(4, 8);

    gSystem.screensFlipped = FALSE;

    GfGfx_SwapDisplay();
    G2_BlendNone();
    G2S_BlendNone();
    GX_SetVisibleWnd(GX_WNDMASK_NONE);
    GXS_SetVisibleWnd(0);
    GfGfx_SetBanks(&sCommunicationErrorGraphicsBanks);

    BgConfig *bgConfig = BgConfig_Alloc(heapID);
    SetBothScreensModesAndDisable(&sCommunicationErrorGraphicsModes);
    InitBgFromTemplate(bgConfig, 0, &sCommunicationErrorBgTemplate, GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_0);
    LoadUserFrameGfx1(bgConfig, GF_BG_LYR_MAIN_0, 0x1F7, 2, 0, heapID);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_1_OFFSET, heapID);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, heapID);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, GX_RGB(1, 1, 27));
    BG_SetMaskColor(GF_BG_LYR_SUB_0, GX_RGB(1, 1, 27));

    MsgData *errorMessageData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0041_bin, heapID);
    String *errorMessageStr = String_New(384, heapID);
    String *tmpStr = String_New(384, heapID);
    ResetAllTextPrinters();
    MessageFormat *messageFormat = MessageFormat_New(heapID);

    AddWindow(bgConfig, &window, &sCommunicationErrorWindowTemplate);
    FillWindowPixelRect(&window, 0xF, 0, 0, 208, 144);
    DrawFrameAndWindow1(&window, FALSE, 0x1F7, 2);

    BufferIntegerAsString(messageFormat, 0, errorCode, 5, PRINTING_MODE_LEADING_ZEROS, TRUE);
    ReadMsgDataIntoString(errorMessageData, msgNo, tmpStr);
    StringExpandPlaceholders(messageFormat, errorMessageStr, tmpStr);
    AddTextPrinterParameterized(&window, 0, errorMessageStr, 0, 0, 0, NULL);
    String_Delete(errorMessageStr);
    // BUG: tmp_str is never destroyed.

    GfGfx_BothDispOn();
    SetMasterBrightnessNeutral(PM_LCD_TOP);
    SetMasterBrightnessNeutral(PM_LCD_BOTTOM);
    SetBlendBrightness(0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN | SCREEN_MASK_SUB);

    RemoveWindow(&window);
    DestroyMsgData(errorMessageData);
    MessageFormat_Delete(messageFormat);
    Heap_Free(bgConfig);
}
