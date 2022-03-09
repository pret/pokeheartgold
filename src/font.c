#include "font.h"
#include "text.h"
#include "gf_gfx_loader.h"
#include "unk_02025E88.h"
#include "render_text.h"

struct FontWork {
    struct GlyphInfo glyph_buffer;
    void *unk_84[FONT_NUM];
    struct FontData *unk_9C[FONT_NUM];
    s8 unk_B4[FONT_NUM];
};

static struct FontWork *_0211188C = NULL;

static const u16 _020F56C0[][2] = {
    {0x0000, 0x0000},
    {0x0001, 0x0000},
    {0x0002, 0x0000},
    {0x0003, 0x0000},
    {0x0004, 0x0000},
    {0x000A, 0x0000},
};

static const struct FontInfo _020F56D8[] = {
    {0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02},
    {0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02},
    {0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02},
    {0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02},
    {0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02},
    {0x0A, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
};

void sub_02002CA8(void) {
    u32 i;
    static struct FontWork _02111890;

    _0211188C = &_02111890;

    for (i = 0; i < FONT_NUM; i++) {
        _0211188C->unk_84[i] = NULL;
        _0211188C->unk_9C[i] = NULL;
        _0211188C->unk_B4[i] = 0;
    }
    sub_0201FFE0(_020F56D8);
}

void sub_02002CEC(FontID fontId, HeapID heapId) {
    if (_0211188C->unk_9C[fontId] == NULL) {
        _0211188C->unk_9C[fontId] = FontData_new(NARC_graphic_font, _020F56C0[fontId][0], FONTARC_MODE_LAZY, _020F56C0[fontId][1], heapId);
        _0211188C->unk_B4[fontId] = 1;
    } else {
        _0211188C->unk_B4[fontId]++;
    }
}

void sub_02002D40(FontID fontId, HeapID heapId) {
    GF_ASSERT((int)fontId < FONT_NUM);
    GF_ASSERT(_0211188C->unk_9C[fontId] != NULL);
    FontData_ModeSwitch(_0211188C->unk_9C[fontId], FONTARC_MODE_DIRECT, heapId);
}

void sub_02002D7C(FontID fontId) {
    GF_ASSERT((int)fontId < FONT_NUM);
    GF_ASSERT(_0211188C->unk_9C[fontId] != NULL);
    FontData_ModeSwitch(_0211188C->unk_9C[fontId], FONTARC_MODE_LAZY, 0);
}

void sub_02002DB4(FontID fontId) {
    u32 i;
    void *ip;
    GF_ASSERT((int)fontId < FONT_NUM);
    GF_ASSERT(_0211188C->unk_B4[fontId] != 0);
    if (_0211188C->unk_B4[fontId] > 0) {
        _0211188C->unk_B4[fontId]--;
    }
    if (_0211188C->unk_B4[fontId] == 0) {
        ip = _0211188C->unk_84[fontId];
        if (ip != NULL) {
            for (i = 0; i < FONT_NUM; i++) {
                if (i != fontId && _020F56C0[i][0] == _020F56C0[fontId][0] && _0211188C->unk_9C[i] != NULL) {
                    _0211188C->unk_84[i] = ip;
                    break;
                }
            }
            if (i == 6) {
                FreeToHeap(_0211188C->unk_84[fontId]);
                _0211188C->unk_84[fontId] = NULL;
            }
        }
        if (_0211188C->unk_9C[fontId] != NULL) {
            FontData_delete(_0211188C->unk_9C[fontId]);
            _0211188C->unk_9C[fontId] = NULL;
        }
    }
}

struct GlyphInfo *sub_02002E7C(FontID fontId, u16 glyphId) {
    TryLoadGlyph(_0211188C->unk_9C[fontId], glyphId, &_0211188C->glyph_buffer);
    return &_0211188C->glyph_buffer;
}

BOOL sub_02002E98(u16 glyphId, struct TextPrinter *printer) {
    struct TextPrinterSubStruct *sub;

    sub = (struct TextPrinterSubStruct *)printer->subStructFields;

    if (!sub->hasGlyphIdBeenSet) {
        sub->glyphId = glyphId;
        sub->hasGlyphIdBeenSet = TRUE;
    }
    return RenderText(printer);
}

u32 sub_02002EC8(FontID fontId, const u16 *string, u32 letterSpacing) {
    GF_ASSERT(_0211188C->unk_9C[fontId] != NULL);
    return GetStringWidth(_0211188C->unk_9C[fontId], string, letterSpacing);
}

u32 sub_02002EFC(FontID fontId, const u16 *string, u32 letterSpacing) {
    GF_ASSERT(_0211188C->unk_9C[fontId] != NULL);
    return GetStringWidthFirstLine(_0211188C->unk_9C[fontId], string, letterSpacing);
}

u32 sub_02002F30(FontID fontId, STRING *string, u32 letterSpacing) {
    GF_ASSERT(_0211188C->unk_9C[fontId] != NULL);
    return GetStringWidth(_0211188C->unk_9C[fontId], String_c_str(string), letterSpacing);
}

BOOL sub_02002F68(FontID fontId, STRING *str0, STRING *str1) {
    GF_ASSERT(_0211188C->unk_9C[fontId] != NULL);
    StringSetEmpty(str1);
    StringCat_HandleTrainerName(str1, str0);
    return StringAllCharsValid(_0211188C->unk_9C[fontId], String_c_str(str1));
}

u8 GetFontAttribute(FontID fontId, int attr) {
    u8 ret = 0;

    switch (attr) {
    case 0:
        ret = _020F56D8[fontId].maxLetterWidth;
        break;
    case 1:
        ret = _020F56D8[fontId].maxLetterHeight;
        break;
    case 2:
        ret = _020F56D8[fontId].letterSpacing;
        break;
    case 3:
        ret = _020F56D8[fontId].lineSpacing;
        break;
    case 4:
        ret = _020F56D8[fontId].unk;
        break;
    case 5:
        ret = _020F56D8[fontId].fgColor;
        break;
    case 6:
        ret = _020F56D8[fontId].bgColor;
        break;
    case 7:
        ret = _020F56D8[fontId].shadowColor;
        break;
    }

    return ret;
}

void sub_02003030(int layer, u32 baseAddr, HeapID heapId) {
    GfGfxLoader_GXLoadPal(NARC_graphic_font, 7, layer, baseAddr, 0x20, heapId);
}

void sub_0200304C(int layer, u32 baseAddr, HeapID heapId) {
    GfGfxLoader_GXLoadPal(NARC_graphic_font, 8, layer, baseAddr, 0x20, heapId);
}

u32 sub_02003068(FontID fontId, STRING *string, u32 letterSpacing) {
    GF_ASSERT(_0211188C->unk_9C[fontId] != NULL);
    return GetStringWidthMultiline(_0211188C->unk_9C[fontId], String_c_str(string), letterSpacing);
}

u32 sub_020030A0(FontID fontId, STRING *string, u32 letterSpacing, u32 windowWidth) {
    u32 stringWidth = sub_02002F30(fontId, string, letterSpacing);
    if (stringWidth < windowWidth) {
        return (windowWidth - stringWidth) / 2;
    } else {
        return 0;
    }
}

u32 FontI_GetGlyphWidth(FontID fontId, u16 glyph) {
    GF_ASSERT(_0211188C->unk_9C[fontId] != NULL);
    return GetGlyphWidth(_0211188C->unk_9C[fontId], glyph);
}

