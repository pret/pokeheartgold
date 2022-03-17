#ifndef POKEHEARTGOLD_TEXT_H
#define POKEHEARTGOLD_TEXT_H

#include "font_types_def.h"
#include "window.h"

#define MakeTextColor(fg, sh, bg) ((((fg) & 0xFF) << 16) | (((sh) & 0xFF) << 8) | (((bg) & 0xFF) << 0))

#define TEXT_SPEED_INSTANT           0 // Transfers to VRAM
#define TEXT_SPEED_NOTRANSFER     0xFF // Defers VRAM transfer

void sub_0201FFE0(const struct FontInfo *fontData);
void DecompressGlyphTile(const u8 *src, u8 *dest);
void AddTextPrinterParameterized2(WINDOW *window, FontID fontId, STRING *string, u8 x, u8 y, u8 textSpeed, u32 color, PrinterCallback_t callback);

#endif //POKEHEARTGOLD_TEXT_H
