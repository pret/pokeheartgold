#ifndef POKEHEARTGOLD_FONT_H
#define POKEHEARTGOLD_FONT_H

#include "font_types_def.h"

#define FONT_NUM 6

void FontWork_Init(void);
void FontID_Alloc(FontID fontId, HeapID heapId);
void FontID_SetAccessDirect(FontID fontId, HeapID heapId);
void FontID_SetAccessLazy(FontID fontId);
void FontID_Release(FontID fontId);
struct GlyphInfo *FontID_TryLoadGlyph(FontID fontId, u16 glyphId);
RenderResult FontID_RenderText(int fontId, TextPrinter *printer);
u32 FontID_FlatArray_GetWidth(FontID fontId, const u16 *string, u32 letterSpacing);
u32 FontID_FlatArray_GetWidthFirstLine(FontID fontId, const u16 *string, u32 letterSpacing);
u32 FontID_String_GetWidth(FontID fontId, String *string, u32 letterSpacing);
BOOL FontID_String_AllCharsValid(FontID fontId, String *str0, String *str1);
u8 GetFontAttribute(FontID fontId, int attr);
void LoadFontPal0(enum GFPalLoadLocation location, enum GFPalSlotOffset palSlotOffset, HeapID heapId);
void LoadFontPal1(enum GFPalLoadLocation location, enum GFPalSlotOffset palSlotOffset, HeapID heapId);
u32 FontID_String_GetWidthMultiline(u32 fontId, String *string, u32 letterSpacing);
u32 FontID_String_GetCenterAlignmentX(FontID fontId, String *string, u32 letterSpacing, u32 windowWidth);
u32 FontID_GetGlyphWidth(FontID fontId, u16 glyph);

#endif // POKEHEARTGOLD_FONT_H
