#include "global.h"
#include "font.h"
#include "text.h"
#include "gf_gfx_loader.h"
#include "font_data.h"
#include "render_text.h"

struct FontWork {
    struct GlyphInfo glyph_buffer;
    void *extraData[FONT_NUM];
    struct FontData *fontDataMan[FONT_NUM];
    s8 fontDataRefCount[FONT_NUM];
};

static struct FontWork *sFontWork = NULL;

static const u16 sFontArcParam[][2] = {
    {0x0000, FALSE},
    {0x0001, FALSE},
    {0x0002, FALSE},
    {0x0003, FALSE},
    {0x0004, FALSE},
    {0x000A, FALSE},
};

static const struct FontInfo sFontInfos[] = {
    {0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02},
    {0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02},
    {0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02},
    {0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02},
    {0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02},
    {0x0A, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
};

void FontWork_Init(void) {
    u32 i;
    static struct FontWork work;

    sFontWork = &work;

    for (i = 0; i < FONT_NUM; i++) {
        sFontWork->extraData[i] = NULL;
        sFontWork->fontDataMan[i] = NULL;
        sFontWork->fontDataRefCount[i] = 0;
    }
    sub_0201FFE0(sFontInfos);
}

void FontID_Alloc(FontID fontId, HeapID heapId) {
    if (sFontWork->fontDataMan[fontId] == NULL) {
        sFontWork->fontDataMan[fontId] = FontData_New(NARC_graphic_font, sFontArcParam[fontId][0], FONTARC_MODE_LAZY, sFontArcParam[fontId][1], heapId);
        sFontWork->fontDataRefCount[fontId] = 1;
    } else {
        sFontWork->fontDataRefCount[fontId]++;
    }
}

void FontID_SetAccessDirect(FontID fontId, HeapID heapId) {
    GF_ASSERT((int)fontId < FONT_NUM);
    GF_ASSERT(sFontWork->fontDataMan[fontId] != NULL);
    FontData_ModeSwitch(sFontWork->fontDataMan[fontId], FONTARC_MODE_DIRECT, heapId);
}

void FontID_SetAccessLazy(FontID fontId) {
    GF_ASSERT((int)fontId < FONT_NUM);
    GF_ASSERT(sFontWork->fontDataMan[fontId] != NULL);
    FontData_ModeSwitch(sFontWork->fontDataMan[fontId], FONTARC_MODE_LAZY, HEAP_ID_DEFAULT);
}

void FontID_Release(FontID fontId) {
    u32 i;
    void *ip;
    GF_ASSERT((int)fontId < FONT_NUM);
    GF_ASSERT(sFontWork->fontDataRefCount[fontId] != 0);
    if (sFontWork->fontDataRefCount[fontId] > 0) {
        sFontWork->fontDataRefCount[fontId]--;
    }
    if (sFontWork->fontDataRefCount[fontId] == 0) {
        ip = sFontWork->extraData[fontId];
        if (ip != NULL) {
            for (i = 0; i < FONT_NUM; i++) {
                if (i != fontId && sFontArcParam[i][0] == sFontArcParam[fontId][0] && sFontWork->fontDataMan[i] != NULL) {
                    sFontWork->extraData[i] = ip;
                    break;
                }
            }
            if (i == 6) {
                FreeToHeap(sFontWork->extraData[fontId]);
                sFontWork->extraData[fontId] = NULL;
            }
        }
        if (sFontWork->fontDataMan[fontId] != NULL) {
            FontData_Delete(sFontWork->fontDataMan[fontId]);
            sFontWork->fontDataMan[fontId] = NULL;
        }
    }
}

struct GlyphInfo *FontID_TryLoadGlyph(FontID fontId, u16 glyphId) {
    TryLoadGlyph(sFontWork->fontDataMan[fontId], glyphId, &sFontWork->glyph_buffer);
    return &sFontWork->glyph_buffer;
}

BOOL FontID_RenderText(int fontId, struct TextPrinter *printer) {
    struct TextPrinterSubStruct *sub;

    sub = (struct TextPrinterSubStruct *)printer->subStructFields;

    if (!sub->hasFontIdBeenSet) {
        sub->fontId = fontId;
        sub->hasFontIdBeenSet = TRUE;
    }
    return RenderText(printer);
}

u32 FontID_FlatArray_GetWidth(FontID fontId, const u16 *string, u32 letterSpacing) {
    GF_ASSERT(sFontWork->fontDataMan[fontId] != NULL);
    return GetStringWidth(sFontWork->fontDataMan[fontId], string, letterSpacing);
}

u32 FontID_FlatArray_GetWidthFirstLine(FontID fontId, const u16 *string, u32 letterSpacing) {
    GF_ASSERT(sFontWork->fontDataMan[fontId] != NULL);
    return GetStringWidthFirstLine(sFontWork->fontDataMan[fontId], string, letterSpacing);
}

u32 FontID_String_GetWidth(FontID fontId, String *string, u32 letterSpacing) {
    GF_ASSERT(sFontWork->fontDataMan[fontId] != NULL);
    return GetStringWidth(sFontWork->fontDataMan[fontId], String_cstr(string), letterSpacing);
}

BOOL FontID_String_AllCharsValid(FontID fontId, String *str0, String *str1) {
    GF_ASSERT(sFontWork->fontDataMan[fontId] != NULL);
    String_SetEmpty(str1);
    String_Cat_HandleTrainerName(str1, str0);
    return StringAllCharsValid(sFontWork->fontDataMan[fontId], String_cstr(str1));
}

u8 GetFontAttribute(FontID fontId, int attr) {
    u8 ret = 0;

    switch (attr) {
    case 0:
        ret = sFontInfos[fontId].maxLetterWidth;
        break;
    case 1:
        ret = sFontInfos[fontId].maxLetterHeight;
        break;
    case 2:
        ret = sFontInfos[fontId].letterSpacing;
        break;
    case 3:
        ret = sFontInfos[fontId].lineSpacing;
        break;
    case 4:
        ret = sFontInfos[fontId].unk;
        break;
    case 5:
        ret = sFontInfos[fontId].fgColor;
        break;
    case 6:
        ret = sFontInfos[fontId].bgColor;
        break;
    case 7:
        ret = sFontInfos[fontId].shadowColor;
        break;
    }

    return ret;
}

void LoadFontPal0(enum GFBgLayer layer, u32 baseAddr, HeapID heapId) { //todo sync with diamond
    GfGfxLoader_GXLoadPal(NARC_graphic_font, 7, layer, baseAddr, 0x20, heapId);
}

void LoadFontPal1(enum GFBgLayer layer, u32 baseAddr, HeapID heapId) {
    GfGfxLoader_GXLoadPal(NARC_graphic_font, 8, layer, baseAddr, 0x20, heapId);
}

u32 FontID_String_GetWidthMultiline(FontID fontId, String *string, u32 letterSpacing) {
    GF_ASSERT(sFontWork->fontDataMan[fontId] != NULL);
    return GetStringWidthMultiline(sFontWork->fontDataMan[fontId], String_cstr(string), letterSpacing);
}

u32 FontID_String_GetCenterAlignmentX(FontID fontId, String *string, u32 letterSpacing, u32 windowWidth) {
    u32 stringWidth = FontID_String_GetWidth(fontId, string, letterSpacing);
    if (stringWidth < windowWidth) {
        return (windowWidth - stringWidth) / 2;
    } else {
        return 0;
    }
}

u32 FontID_GetGlyphWidth(FontID fontId, u16 glyph) {
    GF_ASSERT(sFontWork->fontDataMan[fontId] != NULL);
    return GetGlyphWidth(sFontWork->fontDataMan[fontId], glyph);
}

