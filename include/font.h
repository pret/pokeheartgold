#ifndef POKEHEARTGOLD_FONT_H
#define POKEHEARTGOLD_FONT_H

#include "font_types_def.h"

#define FONT_NUM    6

void sub_02002CA8(void);
void sub_02002CEC(FontID fontId, HeapID heapId);
void sub_02002D40(FontID fontId, HeapID heapId);
void sub_02002D7C(FontID fontId);
void sub_02002DB4(FontID fontId);
struct GlyphInfo *sub_02002E7C(FontID fontId, u16 glyphId);
BOOL sub_02002E98(u16 glyphId, struct TextPrinter *printer);
u32 sub_02002EC8(FontID fontId, const u16 *string, u32 letterSpacing);
u32 sub_02002EFC(FontID fontId, const u16 *string, u32 letterSpacing);
u32 sub_02002F30(FontID fontId, STRING *string, u32 letterSpacing);
BOOL sub_02002F68(FontID fontId, STRING *str0, STRING *str1);
u8 GetFontAttribute(FontID fontId, int attr);
void sub_02003030(int layer, u32 baseAddr, HeapID heapId);
void sub_0200304C(int layer, u32 baseAddr, HeapID heapId);
u32 sub_02003068(FontID fontId, STRING *string, u32 letterSpacing);
u32 sub_020030A0(FontID fontId, STRING *string, u32 letterSpacing, u32 windowWidth);
u32 FontI_GetGlyphWidth(FontID fontId, u16 glyph);

#endif //POKEHEARTGOLD_FONT_H
