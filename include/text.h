#ifndef POKEHEARTGOLD_TEXT_H
#define POKEHEARTGOLD_TEXT_H

#include "font_types_def.h"
#include "window.h"

void sub_0201FFE0(const struct FontInfo *fontData);
void DecompressGlyphTile(const u8 *src, u8 *dest);
void AddTextPrinterParameterized2(WINDOW *window, FontID fontId, STRING *string, u8 x, u8 y, u8 textSpeed, u32 color, u8 a7);

#endif //POKEHEARTGOLD_TEXT_H
