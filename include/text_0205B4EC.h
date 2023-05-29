#ifndef POKEHEARTGOLD_TEXT_0205B4EC_H
#define POKEHEARTGOLD_TEXT_0205B4EC_H

#include "options.h"
#include "pm_string.h"
#include "window.h"

void sub_0205B514(BGCONFIG *bgConfig, WINDOW *window, int a2);
void sub_0205B564(WINDOW *window, OPTIONS *options);
u8 sub_0205B5B4(WINDOW *window, STRING *string, OPTIONS *options, BOOL speedupFlag);
BOOL IsPrintFinished(u8 printerId);
void sub_0205B5A8(WINDOW *window);
u32 sub_0205B5EC(WINDOW *window, STRING *message, FontID fontId, u32 textFrame, u8 speedUpEnabled, u32 a4);

#endif //POKEHEARTGOLD_TEXT_0205B4EC_H
