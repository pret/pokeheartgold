#ifndef POKEHEARTGOLD_FONT_H
#define POKEHEARTGOLD_FONT_H

typedef u8 FontID;

u32 FontI_GetGlyphWidth(FontID fontId, u16 character);
void sub_02002CA8(void);
void sub_02002CEC(int a0, HeapID heapId);
u32 sub_02002F30(u8 fontno, STRING *string, u32 letterSpacing);

#endif //POKEHEARTGOLD_FONT_H
