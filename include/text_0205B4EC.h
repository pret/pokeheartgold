#ifndef POKEHEARTGOLD_TEXT_0205B4EC_H
#define POKEHEARTGOLD_TEXT_0205B4EC_H

#include "bg_window.h"
#include "options.h"
#include "pm_string.h"

void sub_0205B514(BgConfig *bgConfig, Window *window, int a2);
void sub_0205B564(Window *window, Options *options);
u8 sub_0205B5B4(Window *window, String *string, Options *options, BOOL speedupFlag);
BOOL IsPrintFinished(u8 printerId);
void sub_0205B5A8(Window *window);
u32 sub_0205B5EC(Window *window, String *message, FontID fontId, u32 textFrame, u8 speedUpEnabled, u32 a4);

#endif // POKEHEARTGOLD_TEXT_0205B4EC_H
