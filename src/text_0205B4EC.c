#include "text_0205B4EC.h"

#include "font.h"
#include "render_text.h"
#include "render_window.h"
#include "text.h"

#define BASE_TILE_MAIN  0x237
#define BASE_TILE_SUB   0x194
#define FRAME_BASE_TILE 0x3E2

void sub_0205B4EC(enum GFPalLoadLocation a0, BOOL a1) {
    if (a1 == TRUE) {
        ResetAllTextPrinters();
    }
    LoadFontPal0(a0, GF_PAL_SLOT_13_OFFSET, HEAP_ID_FIELD1);
    LoadFontPal1(a0, GF_PAL_SLOT_12_OFFSET, HEAP_ID_FIELD1);
}

void sub_0205B514(BgConfig *bgConfig, Window *window, GFBgLayer layer) {
    if (layer == GF_BG_LYR_MAIN_3) {
        AddWindowParameterized(bgConfig, window, GF_BG_LYR_MAIN_3, 2, 19, 27, 4, 12, BASE_TILE_MAIN);
    } else {
        AddWindowParameterized(bgConfig, window, GF_BG_LYR_SUB_3, 2, 19, 27, 4, 12, BASE_TILE_SUB);
    }
}

void sub_0205B564(Window *window, Options *options) {
    LoadUserFrameGfx2(window->bgConfig, (GFBgLayer)GetWindowBgId(window), FRAME_BASE_TILE, 10, Options_GetFrame(options), HEAP_ID_FIELD1);
    sub_0205B5A8(window);
    DrawFrameAndWindow2(window, FALSE, FRAME_BASE_TILE, 10);
}

void sub_0205B5A8(Window *window) {
    FillWindowPixelBuffer(window, 15);
}

u8 sub_0205B5B4(Window *window, String *string, Options *options, BOOL speedupFlag) {
    TextFlags_SetCanABSpeedUpPrint(speedupFlag);
    TextFlags_SetAutoScrollParam(0);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    return AddTextPrinterParameterized(window, 1, string, 0, 0, Options_GetTextFrameDelay(options), NULL);
}

u32 sub_0205B5EC(Window *window, String *message, FontID fontId, u32 textSpeed, u8 speedUpEnabled, u32 autoScrollParam) {
    TextFlags_SetCanABSpeedUpPrint(speedUpEnabled);
    TextFlags_SetAutoScrollParam(autoScrollParam);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    return AddTextPrinterParameterized(window, fontId, message, 0, 0, textSpeed, NULL);
}

u8 IsPrintFinished(u8 printerId) {
    return !TextPrinterCheckActive(printerId);
}

void sub_0205B63C(BgConfig *bgConfig, Window *window, u8 a2, GFBgLayer a3) {
    int x;
    int width;

    if (a2 == 0 || a2 == 1) {
        x = 9;
        width = 20;
    } else {
        x = 2;
        width = 27;
    }
    if (a3 == GF_BG_LYR_MAIN_3) {
        AddWindowParameterized(bgConfig, window, GF_BG_LYR_MAIN_3, x, 19, width, 4, 9, BASE_TILE_MAIN);
    } else {
        AddWindowParameterized(bgConfig, window, GF_BG_LYR_SUB_3, x, 19, width, 4, 9, BASE_TILE_SUB);
    }
}

void sub_0205B6A0(Window *window, int a1, u16 a2) {
    sub_0200EC0C(window->bgConfig, GetWindowBgId(window), 0x2A3, 9, a1, a2, 4);
    FillWindowPixelBuffer(window, 15);
    DrawFrameAndWindow3(window, 0, 0x2A3, 9, a1);
}
