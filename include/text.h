#ifndef POKEHEARTGOLD_TEXT_H
#define POKEHEARTGOLD_TEXT_H

#include "bg_window.h"
#include "font_types_def.h"
#include "options.h"
#include "sys_task_api.h"
#include "text_0205B4EC.h"

#define MAKE_TEXT_COLOR(fg, sh, bg) ((((fg) & 0xFF) << 16) | (((sh) & 0xFF) << 8) | (((bg) & 0xFF) << 0))

#define TEXT_SPEED_INSTANT    0    // Transfers to VRAM
#define TEXT_SPEED_NOTRANSFER 0xFF // Defers VRAM transfer

#define MAX_TEXT_PRINTERS 8

void SetFontsPointer(const struct FontInfo *fonts);
void RemoveTextPrinter(u8 printerId);
void ResetAllTextPrinters(void);
u8 TextPrinterCheckActive(u8 printerId); // FIXME: bool8
u8 AddTextPrinterParameterized(Window *window, FontID fontId, String *text, u32 x, u32 y, u32 textSpeed, PrinterCallback_t callback);
u8 AddTextPrinterParameterizedWithColor(Window *window, FontID fontId, String *string, u32 x, u32 y, u32 textSpeed, u32 color, PrinterCallback_t callback);
u8 AddTextPrinterParameterizedWithColorAndSpacing(Window *window, int fontId, String *string, u32 x, u32 y, u32 textSpeed, u32 color, u32 letterSpacing, u32 lineSpacing, PrinterCallback_t callback);
void GenerateFontHalfRowLookupTable(u8 fgColor, u8 bgColor, u8 shadowColor);
void DecompressGlyphTile(const u8 *src, u8 *dest);
void RenderScreenFocusIndicatorTile(TextPrinter *printer, u32 unusedX, u32 unusedY, u16 fieldNum);

#endif // POKEHEARTGOLD_TEXT_H
