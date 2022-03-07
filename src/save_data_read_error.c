#include <nitro/gx/g2.h>
#include <nitro/gx/gx_bgcnt.h>
#include "gx_layers.h"
#include "main.h"
#include "msgdata.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0008.h"
#include "pm_string.h"
#include "save_data_read_error.h"
#include "system.h"
#include "unk_0200FA24.h"
#include "window.h"

extern void sub_0200E3DC(BGCONFIG* bg_config, enum GFBgLayer layer, u32 a2, u32 a3, u32 a4, HeapID heap_id);
extern void sub_02003030(enum GFBgLayer layer, u32 base_addr, HeapID heap_id);
extern void sub_02020080(void);
extern void DrawFrameAndWindow1(WINDOW* window, BOOL dont_copy_to_vram, u16 a2, u8 palette_num);
extern u16 AddTextPrinterParameterized(WINDOW* window, u8 font_id, STRING* text, u32 x, u32 y, u32 speed, void* callback);
extern void SetMasterBrightnessNeutral(u32 a0);
extern void SetBlendBrightness(fx32 brightness, fx32 surface_mask, u32 screen_mask);

static const GF_GXBanksConfig sDataReadErrorBanksConfig = {
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

static const struct GFBgModeSet sDataReadErrorBgModeSet = {
    .dispMode = GX_DISPMODE_GRAPHICS,
    .bgModeMain = GX_BGMODE_0,
    .bgModeSub = GX_BGMODE_0,
    ._2d3dSwitch = GX_BG0_AS_2D,
};

static const BGTEMPLATE sDataReadErrorBgTemplate = {
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

static const WINDOWTEMPLATE sDataReadErrorWindowTemplate = {
    .bgId = 0,
    .left = 3,
    .top = 3,
    .width = 26,
    .height = 18,
    .palette = 1,
    .baseBlock = 0x23,
};

void ShowSaveDataReadError(HeapID heap_id) {
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
    // TODO: are there SDK functions for these?
    reg_GX_DISPCNT &= ~(REG_GX_DISPCNT_OW_MASK | REG_GX_DISPCNT_W1_MASK | REG_GX_DISPCNT_W0_MASK);
    reg_GXS_DB_DISPCNT &= ~(REG_GXS_DB_DISPCNT_OW_MASK | REG_GXS_DB_DISPCNT_W1_MASK | REG_GXS_DB_DISPCNT_W0_MASK);
    GX_SetBanks(&sDataReadErrorBanksConfig);

    BGCONFIG* bg_config = BgConfig_Alloc(heap_id);
    SetBothScreensModesAndDisable(&sDataReadErrorBgModeSet);
    InitBgFromTemplate(bg_config, 0, &sDataReadErrorBgTemplate, GX_BGMODE_0);
    BgClearTilemapBufferAndCommit(bg_config, GF_BG_LYR_MAIN_0);
    sub_0200E3DC(bg_config, GF_BG_LYR_MAIN_0, 0x1F7, 2, 0, heap_id);
    sub_02003030(GF_BG_LYR_MAIN_0, 0x20, heap_id);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, heap_id);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB(1, 1, 27));
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB(1, 1, 27));

    MSGDATA* error_msgdata = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0008_bin, heap_id);
    STRING* error_str = String_ctor(384, heap_id);

    sub_02020080();

    AddWindow(bg_config, &window, &sDataReadErrorWindowTemplate);
    FillWindowPixelRect(&window, 0xF, 0, 0, 208, 144);
    DrawFrameAndWindow1(&window, FALSE, 0x1F7, 2);

    ReadMsgDataIntoString(error_msgdata, msg_0008_00000, error_str);
    AddTextPrinterParameterized(&window, 0, error_str, 0, 0, 0, NULL);
    String_dtor(error_str);

    GX_BothDispOn();
    SetMasterBrightnessNeutral(0);
    SetMasterBrightnessNeutral(1);
    SetBlendBrightness(0, 0x3F, 3);

    while (TRUE) {
        HandleDSLidAction();
        OS_WaitIrq(TRUE, OS_IE_VBLANK);
    }
}

void ShowGBACartRemovedError(HeapID heap_id) {
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
    // TODO: are there SDK functions for these?
    reg_GX_DISPCNT &= ~(REG_GX_DISPCNT_OW_MASK | REG_GX_DISPCNT_W1_MASK | REG_GX_DISPCNT_W0_MASK);
    reg_GXS_DB_DISPCNT &= ~(REG_GXS_DB_DISPCNT_OW_MASK | REG_GXS_DB_DISPCNT_W1_MASK | REG_GXS_DB_DISPCNT_W0_MASK);
    GX_SetBanks(&sDataReadErrorBanksConfig);

    BGCONFIG* bg_config = BgConfig_Alloc(heap_id);
    SetBothScreensModesAndDisable(&sDataReadErrorBgModeSet);
    InitBgFromTemplate(bg_config, 0, &sDataReadErrorBgTemplate, GX_BGMODE_0);
    BgClearTilemapBufferAndCommit(bg_config, GF_BG_LYR_MAIN_0);
    sub_0200E3DC(bg_config, GF_BG_LYR_MAIN_0, 0x1F7, 2, 0, heap_id);
    sub_02003030(GF_BG_LYR_MAIN_0, 0x20, heap_id);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, heap_id);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB(1, 1, 27));
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB(1, 1, 27));

    MSGDATA* error_msgdata = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0008_bin, heap_id);
    STRING* error_str = String_ctor(384, heap_id);

    sub_02020080();

    AddWindow(bg_config, &window, &sDataReadErrorWindowTemplate);
    FillWindowPixelRect(&window, 0xF, 0, 0, 208, 144);
    DrawFrameAndWindow1(&window, FALSE, 0x1F7, 2);

    ReadMsgDataIntoString(error_msgdata, msg_0008_00001, error_str);
    AddTextPrinterParameterized(&window, 0, error_str, 0, 0, 0, NULL);
    String_dtor(error_str);

    GX_BothDispOn();
    SetMasterBrightnessNeutral(0);
    SetMasterBrightnessNeutral(1);
    SetBlendBrightness(0, 0x3F, 3);

    while (TRUE) {
        HandleDSLidAction();
        OS_WaitIrq(TRUE, OS_IE_VBLANK);
    }
}
