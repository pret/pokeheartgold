#ifndef POKEHEARTGOLD_FONT_H
#define POKEHEARTGOLD_FONT_H

#include "font_types_def.h"

enum Font {
    FONT_SYSTEM = 0,
    FONT_MESSAGE,
    FONT_SUBSCREEN,
    FONT_UNOWN,
    FONT_UNK_4,
    FONT_UNK_5,
    FONT_NUM,
};

void FontWork_Init(void);
void FontID_Alloc(enum Font fontId, enum HeapID heapID);
void FontID_SetAccessDirect(enum Font fontId, enum HeapID heapID);
void FontID_SetAccessLazy(enum Font fontId);
void FontID_Release(enum Font fontId);
struct GlyphInfo *FontID_TryLoadGlyph(enum Font fontId, u16 glyphId);
RenderResult FontID_RenderText(enum Font fontId, TextPrinter *printer);
u32 FontID_FlatArray_GetWidth(enum Font fontId, const u16 *string, u32 letterSpacing);
u32 FontID_FlatArray_GetWidthFirstLine(enum Font fontId, const u16 *string, u32 letterSpacing);
u32 FontID_String_GetWidth(enum Font fontId, String *string, u32 letterSpacing);
BOOL FontID_String_AllCharsValid(enum Font fontId, String *str0, String *str1);
u8 GetFontAttribute(u8 fontId, int attr);
void LoadFontPal0(enum GFPalLoadLocation location, enum GFPalSlotOffset palSlotOffset, enum HeapID heapID);
void LoadFontPal1(enum GFPalLoadLocation location, enum GFPalSlotOffset palSlotOffset, enum HeapID heapID);
u32 FontID_String_GetWidthMultiline(enum Font fontId, String *string, u32 letterSpacing);
u32 FontID_String_GetCenterAlignmentX(enum Font fontId, String *string, u32 letterSpacing, u32 windowWidth);
u32 FontID_GetGlyphWidth(enum Font fontId, u16 glyph);

#endif // POKEHEARTGOLD_FONT_H
