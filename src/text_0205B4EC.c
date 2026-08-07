#include "dialog_box.h"
#include "font.h"
#include "render_text.h"
#include "render_window.h"
#include "text.h"

#define BASE_TILE_MAIN             0x237
#define BASE_TILE_SUB              0x194
#define BASE_TILE_MAP_GFX          0x2A3
#define FRAME_BASE_TILE            0x3E2
#define DIALOG_BOX_X               2
#define DIALOG_BOX_Y               19
#define DIALOG_BOX_W               27
#define DIALOG_BOX_H               4
#define DIALOG_BOX_MAP_GFX_W       7
#define DIALOG_BOX_PLTTNUM_DEFAULT 12
#define DIALOG_BOX_PLTTNUM_FRAME   10
#define DIALOG_BOX_PLTTNUM_MAPGFX  9

void FieldMessage_LoadTextPalettes(enum GFPalLoadLocation location, BOOL resetPrinters) {
    if (resetPrinters == TRUE) {
        ResetAllTextPrinters();
    }
    LoadFontPal0(location, GF_PAL_SLOT_13_OFFSET, HEAP_ID_FIELD1);
    LoadFontPal1(location, GF_PAL_SLOT_12_OFFSET, HEAP_ID_FIELD1);
}

void DialogBox_AddWindowToLayer3(BgConfig *bgConfig, Window *window, GFBgLayer layer) {
    if (layer == GF_BG_LYR_MAIN_3) {
        AddWindowParameterized(bgConfig, window, GF_BG_LYR_MAIN_3, DIALOG_BOX_X, DIALOG_BOX_Y, DIALOG_BOX_W, DIALOG_BOX_H, DIALOG_BOX_PLTTNUM_DEFAULT, BASE_TILE_MAIN);
    } else {
        AddWindowParameterized(bgConfig, window, GF_BG_LYR_SUB_3, DIALOG_BOX_X, DIALOG_BOX_Y, DIALOG_BOX_W, DIALOG_BOX_H, DIALOG_BOX_PLTTNUM_DEFAULT, BASE_TILE_SUB);
    }
}

void DialogBox_LoadFrame(Window *window, Options *options) {
    LoadUserFrameGfx2(window->bgConfig, (GFBgLayer)GetWindowBgId(window), FRAME_BASE_TILE, DIALOG_BOX_PLTTNUM_FRAME, Options_GetFrame(options), HEAP_ID_FIELD1);
    DialogBox_Clear(window);
    DrawFrameAndWindow2(window, FALSE, FRAME_BASE_TILE, DIALOG_BOX_PLTTNUM_FRAME);
}

void DialogBox_Clear(Window *window) {
    FillWindowPixelBuffer(window, 15);
}

u8 DialogBox_PrintMessage(Window *window, String *string, Options *options, BOOL speedupFlag) {
    TextFlags_SetCanABSpeedUpPrint(speedupFlag);
    TextFlags_SetAutoScrollParam(0);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    return AddTextPrinterParameterized(window, 1, string, 0, 0, Options_GetTextFrameDelay(options), NULL);
}

u32 DialogBox_PrintMessageEx(Window *window, String *message, FontID fontId, u32 textSpeed, u8 speedUpEnabled, u32 autoScrollParam) {
    TextFlags_SetCanABSpeedUpPrint(speedUpEnabled);
    TextFlags_SetAutoScrollParam(autoScrollParam);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    return AddTextPrinterParameterized(window, fontId, message, 0, 0, textSpeed, NULL);
}

u8 DialogBox_IsPrintFinished(u8 printerId) {
    return !TextPrinterCheckActive(printerId);
}

void DialogBox_AddWindowToLayer3WithXOffset(BgConfig *bgConfig, Window *window, u8 type, GFBgLayer layer) {
    int x;
    int width;

    // types 0 and 1 have an extra graphic to the left
    if (type == 0 || type == 1) {
        x = DIALOG_BOX_X + DIALOG_BOX_MAP_GFX_W;
        width = DIALOG_BOX_W - DIALOG_BOX_MAP_GFX_W;
    } else {
        x = DIALOG_BOX_X;
        width = DIALOG_BOX_W;
    }
    if (layer == GF_BG_LYR_MAIN_3) {
        AddWindowParameterized(bgConfig, window, GF_BG_LYR_MAIN_3, x, DIALOG_BOX_Y, width, DIALOG_BOX_H, DIALOG_BOX_PLTTNUM_MAPGFX, BASE_TILE_MAIN);
    } else {
        AddWindowParameterized(bgConfig, window, GF_BG_LYR_SUB_3, x, DIALOG_BOX_Y, width, DIALOG_BOX_H, DIALOG_BOX_PLTTNUM_MAPGFX, BASE_TILE_SUB);
    }
}

void DialogBox_DrawFrameWithWayfindingGraphic(Window *window, u16 type, u16 map) {
    LoadMapSignpostFrameAndGraphic(window->bgConfig, GetWindowBgId(window), BASE_TILE_MAP_GFX, DIALOG_BOX_PLTTNUM_MAPGFX, type, map, HEAP_ID_FIELD1);
    FillWindowPixelBuffer(window, 15);
    DrawFrameAndWindow3(window, FALSE, BASE_TILE_MAP_GFX, DIALOG_BOX_PLTTNUM_MAPGFX, type);
}
