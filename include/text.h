#ifndef POKEHEARTGOLD_TEXT_H
#define POKEHEARTGOLD_TEXT_H

#include "font_types_def.h"
#include "bg_window.h"
#include "options.h"
#include "text_0205B4EC.h"

#define MakeTextColor(fg, sh, bg) ((((fg) & 0xFF) << 16) | (((sh) & 0xFF) << 8) | (((bg) & 0xFF) << 0))

#define TEXT_SPEED_INSTANT           0 // Transfers to VRAM
#define TEXT_SPEED_NOTRANSFER     0xFF // Defers VRAM transfer

void sub_0201FFE0(const struct FontInfo *fontData);
void DecompressGlyphTile(const u8 *src, u8 *dest);
u16 AddTextPrinterParameterized(Window* window, u8 font_id, String* text, u8 x, u8 y, u32 speed, void* callback);
u8 AddTextPrinterParameterized2(Window *window, FontID fontId, String *string, u8 x, u8 y, u32 textSpeed, u32 color, PrinterCallback_t callback);
u8 AddTextPrinterParameterized3(Window *window, int fontId, String *string, u8 x, u8 y, u32 textSpeed, u32 color, u32 letterSpacing, u32 lineSpacing, PrinterCallback_t callback);
BOOL TextPrinterCheckActive(u8 printerId);
void ResetAllTextPrinters(void);
BOOL sub_02020094(u8 a0);
void sub_020200A0(u8 printer_id);

#endif //POKEHEARTGOLD_TEXT_H
