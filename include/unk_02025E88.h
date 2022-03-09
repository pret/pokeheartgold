#ifndef POKEHEARTGOLD_UNK_02025E88_H
#define POKEHEARTGOLD_UNK_02025E88_H

#include "filesystem.h"
#include "font_types_def.h"

#define FONTARC_MODE_DIRECT   0
#define FONTARC_MODE_LAZY     1

struct FontData *FontData_new(NarcId narcId, int fileId, int mode, int vwf, HeapID heapId);
void FontData_ModeSwitch(struct FontData *fontData, int mode, HeapID heapId);
void FontData_delete(struct FontData *fontData);
void TryLoadGlyph(struct FontData *fontData, u16 glyphId, struct GlyphInfo *dest);
u32 GetStringWidth(struct FontData *fontData, const u16 *string, u32 letterSpacing);
u32 GetStringWidthFirstLine(struct FontData *fontData, const u16 *string, u32 letterSpacing);
u32 GetStringWidthMultiline(struct FontData *fontData, const u16 *string, u32 letterSpacing);
u32 GetGlyphWidth(struct FontData *fontData, u16 glyph);
BOOL StringAllCharsValid(struct FontData *fontData, const u16 *string);

#endif //POKEHEARTGOLD_UNK_02025E88_H
