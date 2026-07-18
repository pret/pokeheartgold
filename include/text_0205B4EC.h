#ifndef POKEHEARTGOLD_TEXT_0205B4EC_H
#define POKEHEARTGOLD_TEXT_0205B4EC_H

#include "bg_window.h"
#include "font_types_def.h"
#include "options.h"
#include "pm_string.h"

void sub_0205B4EC(enum GFPalLoadLocation a0, BOOL a1);
void sub_0205B514(BgConfig *bgConfig, Window *window, GFBgLayer layer);
void sub_0205B564(Window *window, Options *options);
void sub_0205B5A8(Window *window);
u8 sub_0205B5B4(Window *window, String *string, Options *options, BOOL speedupFlag);
u32 sub_0205B5EC(Window *window, String *message, FontID fontId, u32 textSpeed, u8 speedUpEnabled, u32 autoScrollParam);
u8 IsPrintFinished(u8 printerId);
void sub_0205B63C(BgConfig *bgConfig, Window *window, u8 a2, GFBgLayer a3);
void sub_0205B6A0(Window *window, int a1, u16 a2);

#endif // POKEHEARTGOLD_TEXT_0205B4EC_H
