#ifndef POKEHEARTGOLD_TEXT_H
#define POKEHEARTGOLD_TEXT_H

#include "font_types_def.h"
#include "window.h"
#include "options.h"

#define MakeTextColor(fg, sh, bg) ((((fg) & 0xFF) << 16) | (((sh) & 0xFF) << 8) | (((bg) & 0xFF) << 0))

#define TEXT_SPEED_INSTANT           0 // Transfers to VRAM
#define TEXT_SPEED_NOTRANSFER     0xFF // Defers VRAM transfer

void sub_0201FFE0(const struct FontInfo *fontData);
void DecompressGlyphTile(const u8 *src, u8 *dest);
u16 AddTextPrinterParameterized(WINDOW* window, u8 font_id, STRING* text, u8 x, u8 y, u32 speed, void* callback);
u8 AddTextPrinterParameterized2(WINDOW *window, FontID fontId, STRING *string, u8 x, u8 y, u32 textSpeed, u32 color, PrinterCallback_t callback);
u8 AddTextPrinterParameterized3(WINDOW *window, int fontId, STRING *string, u8 x, u8 y, u32 textSpeed, u32 color, u32 letterSpacing, u32 lineSpacing, PrinterCallback_t callback);
BOOL TextPrinterCheckActive(u8 printerId);
void ResetAllTextPrinters(void);
BOOL sub_02020094(u8 a0);
void sub_020200A0(u8 printer_id);

// text_0205B4EC
void sub_0205B514(BGCONFIG *bgConfig, WINDOW *window, int a2);
void sub_0205B564(WINDOW *window, OPTIONS *options);
u8 sub_0205B5B4(WINDOW *window, STRING *string, OPTIONS *options, BOOL speedupFlag);
BOOL sub_0205B624(u8 printerId);

#endif //POKEHEARTGOLD_TEXT_H
