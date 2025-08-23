#ifndef POKEHEARTGOLD_FONT_DATA_H
#define POKEHEARTGOLD_FONT_DATA_H

#include "filesystem.h"
#include "font_types_def.h"

#define FONTARC_MODE_DIRECT 0
#define FONTARC_MODE_LAZY   1

struct FontData *FontData_New(NarcId narcId, int fileId, int mode, BOOL isFixedWidth, HeapID heapId);
void FontData_Delete(struct FontData *fontData);
void FontData_ModeSwitch(struct FontData *fontData, int mode, HeapID heapId);
void TryLoadGlyph(struct FontData *fontData, u16 glyphId, struct GlyphInfo *dest);
u32 GetStringWidth(struct FontData *fontData, const u16 *string, u32 letterSpacing);
u32 GetStringWidthFirstLine(struct FontData *fontData, const u16 *string, u32 letterSpacing);
BOOL StringAllCharsValid(struct FontData *fontData, const u16 *string);
u32 GetStringWidthMultiline(struct FontData *fontData, const u16 *string, u32 letterSpacing);
u32 GetGlyphWidth(struct FontData *fontData, u16 glyph);

#endif // POKEHEARTGOLD_FONT_DATA_H
