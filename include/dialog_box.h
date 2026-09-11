#ifndef POKEHEARTGOLD_DIALOG_BOX_H
#define POKEHEARTGOLD_DIALOG_BOX_H

#include "bg_window.h"
#include "font_types_def.h"
#include "options.h"
#include "pm_string.h"

void FieldMessage_LoadTextPalettes(enum GFPalLoadLocation location, BOOL resetPrinters);
void DialogBox_AddWindowToLayer3(BgConfig *bgConfig, Window *window, GFBgLayer layer);
void DialogBox_LoadFrame(Window *window, Options *options);
void DialogBox_Clear(Window *window);
u8 DialogBox_PrintMessage(Window *window, String *string, Options *options, BOOL speedupFlag);
u32 DialogBox_PrintMessageEx(Window *window, String *message, FontID fontId, u32 textSpeed, u8 speedUpEnabled, u32 autoScrollParam);
u8 DialogBox_IsPrintFinished(u8 printerId);
void DialogBox_AddWindowToLayer3WithXOffset(BgConfig *bgConfig, Window *window, u8 type, GFBgLayer layer);
void DialogBox_DrawFrameWithWayfindingGraphic(Window *window, u16 type, u16 map);

#endif // POKEHEARTGOLD_DIALOG_BOX_H
