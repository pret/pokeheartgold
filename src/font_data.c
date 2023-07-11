#include "global.h"
#include "font_data.h"
#include "text.h"
#include "string_control_code.h"

enum GlyphShape {
    GLYPHSHAPE_8x8,
    GLYPHSHAPE_8x16,
    GLYPHSHAPE_16x8,
    GLYPHSHAPE_16x16,
};

struct FontHeader {
    u32 headerSize;
    u32 widthDataStart;
    u32 numGlyphs;
    u8 fixedWidth;
    u8 fixedHeight;
    u8 glyphWidth;
    u8 glyphHeight;
};

struct FontData {
    u32 glyphAccessMode;
    void (*uncompGlyphFunc)(struct FontData *fontData, u16 glyphId, struct GlyphInfo *ret);
    enum GlyphShape glyphShape;
    u32 glyphSize;
    void *narcReadBuf;
    u8 glyphReadBuf[0x40];
    NARC *narc;
    u32 fileId;
    struct FontHeader header;
    BOOL isFixedWidthFont;
    u32 (*glyphWidthFunc)(struct FontData *fontData, int glyphId);
    u8 *glyphWidths;
    u32 gmifOffset;
};

static void FontData_Init(struct FontData *fontData, NarcId narcId, int fileId, BOOL isFixedWidth, HeapID heapId);
static void FontData_FreeWidthsAndNarc(struct FontData *fontData);
static void InitFontResources(struct FontData *fontData, int mode, HeapID heapId);
static void InitFontResources_FromPreloaded(struct FontData *fontData, HeapID heapId);
static void InitFontResources_LazyFromNarc(struct FontData *fontData, HeapID heapId);
static void FreeLoadedFontResources(struct FontData *fontData);
static void FreeLoadedFontResources_FromPreloaded(struct FontData *fontData);
static void FreeLoadedFontResources_LazyFromNarc(struct FontData *fontData);
static void DecompressGlyphTiles_FromPreloaded(struct FontData *fontData, u16 glyphId, struct GlyphInfo *ret);
static void DecompressGlyphTiles_LazyFromNarc(struct FontData *fontData, u16 glyphId, struct GlyphInfo *ret);
static u32 GetGlyphWidth_VariableWidth(struct FontData *fontData, int glyphId);
static u32 GetGlyphWidth_FixedWidth(struct FontData *fontData, int glyphId);

struct FontData *FontData_New(NarcId narcId, int fileId, int mode, BOOL isFixedWidth, HeapID heapId) {
    struct FontData *ret;

    ret = AllocFromHeap(heapId, sizeof(struct FontData));
    if (ret != NULL) {
        FontData_Init(ret, narcId, fileId, isFixedWidth, heapId);
        InitFontResources(ret, mode, heapId);
    }
    return ret;
}

void FontData_Delete(struct FontData *fontData) {
    FreeLoadedFontResources(fontData);
    FontData_FreeWidthsAndNarc(fontData);
    FreeToHeap(fontData);
}

void FontData_ModeSwitch(struct FontData *fontData, int mode, HeapID heapId) {
    if (fontData->glyphAccessMode != mode) {
        FreeLoadedFontResources(fontData);
        InitFontResources(fontData, mode, heapId);
    }
}

static void FontData_Init(struct FontData *fontData, NarcId narcId, int fileId, BOOL isFixedWidth, HeapID heapId) {
    static const u8 _020F6324[][2] = {
        {GLYPHSHAPE_8x8, GLYPHSHAPE_8x16},
        {GLYPHSHAPE_16x8, GLYPHSHAPE_16x16}
    };
    fontData->narc = NARC_New(narcId, heapId);
    if (fontData->narc != NULL) {
        NARC_GetMemberImageStartOffset(fontData->narc, fileId, &fontData->gmifOffset);
        NARC_ReadFromAbsolutePos(fontData->narc, fontData->gmifOffset, sizeof(struct FontHeader), &fontData->header);
        fontData->isFixedWidthFont = isFixedWidth;
        if (isFixedWidth) {
            fontData->glyphWidths = NULL;
            fontData->glyphWidthFunc = GetGlyphWidth_FixedWidth;
        } else {
            GF_ASSERT(fontData->header.widthDataStart != 0);
            fontData->glyphWidths = AllocFromHeap(heapId, fontData->header.numGlyphs);
            fontData->glyphWidthFunc = GetGlyphWidth_VariableWidth;
            NARC_ReadFromAbsolutePos(fontData->narc, fontData->gmifOffset + fontData->header.widthDataStart, fontData->header.numGlyphs, fontData->glyphWidths);
        }
        GF_ASSERT(fontData->header.glyphWidth <= 2 && fontData->header.glyphHeight <= 2);
        fontData->glyphShape = (enum GlyphShape) _020F6324[fontData->header.glyphWidth - 1][fontData->header.glyphHeight - 1];
        fontData->glyphSize = 16 * fontData->header.glyphWidth * fontData->header.glyphHeight;
        fontData->fileId = fileId;
    }
}

static void FontData_FreeWidthsAndNarc(struct FontData *fontData) {
    if (fontData->glyphWidths != NULL) {
        FreeToHeap(fontData->glyphWidths);
    }
    if (fontData->narc != NULL) {
        NARC_Delete(fontData->narc);
    }
}

static void InitFontResources(struct FontData *fontData, int mode, HeapID heapId) {
    static void (*const _020F6328[])(struct FontData *fontData, HeapID heapId) = {
        InitFontResources_FromPreloaded,
        InitFontResources_LazyFromNarc,
    };
    fontData->glyphAccessMode = mode;
    _020F6328[mode](fontData, heapId);
}

static void InitFontResources_FromPreloaded(struct FontData *fontData, HeapID heapId) {
    u32 size = fontData->glyphSize * fontData->header.numGlyphs;
    fontData->narcReadBuf = AllocFromHeap(heapId, size);
    fontData->uncompGlyphFunc = DecompressGlyphTiles_FromPreloaded;
    NARC_ReadFromMember(fontData->narc, fontData->fileId, fontData->header.headerSize, size, fontData->narcReadBuf);
}

static void InitFontResources_LazyFromNarc(struct FontData *fontData, HeapID heapId) {
    fontData->uncompGlyphFunc = DecompressGlyphTiles_LazyFromNarc;
}

static void FreeLoadedFontResources(struct FontData *fontData) {
    static void (*const _020F6330[])(struct FontData *fontData) = {
        FreeLoadedFontResources_FromPreloaded,
        FreeLoadedFontResources_LazyFromNarc,
    };
    _020F6330[fontData->glyphAccessMode](fontData);
}

static void FreeLoadedFontResources_FromPreloaded(struct FontData *fontData) {
    FreeToHeap(fontData->narcReadBuf);
    fontData->narcReadBuf = NULL;
}

static void FreeLoadedFontResources_LazyFromNarc(struct FontData *fontData) {
#pragma unused(fontData)
}

void TryLoadGlyph(struct FontData *fontData, u16 glyphId, struct GlyphInfo *ret) {
    if (glyphId <= fontData->header.numGlyphs) {
        glyphId--;
    } else {
        glyphId = 428 - 1;
    }
    fontData->uncompGlyphFunc(fontData, glyphId, ret);
}

static void DecompressGlyphTiles_FromPreloaded(struct FontData *fontData, u16 glyphId, struct GlyphInfo *ret) {
    u32 offset = glyphId * fontData->glyphSize;
    u8 *tileData = fontData->narcReadBuf;
    switch (fontData->glyphShape) {
    case GLYPHSHAPE_8x8:
        DecompressGlyphTile(tileData + offset + 0, ret->data + 0);
        break;
    case GLYPHSHAPE_8x16:
        DecompressGlyphTile(tileData + offset + 0, ret->data + 0);
        DecompressGlyphTile(tileData + offset + 0x10, ret->data + 0x40);
        break;
    case GLYPHSHAPE_16x8:
        DecompressGlyphTile(tileData + offset + 0, ret->data + 0);
        DecompressGlyphTile(tileData + offset + 0x10, ret->data + 0x20);
        break;
    case GLYPHSHAPE_16x16:
        DecompressGlyphTile(tileData + offset + 0, ret->data + 0);
        DecompressGlyphTile(tileData + offset + 0x10, ret->data + 0x20);
        DecompressGlyphTile(tileData + offset + 0x20, ret->data + 0x40);
        DecompressGlyphTile(tileData + offset + 0x30, ret->data + 0x60);
        break;
    }
    ret->width = fontData->glyphWidthFunc(fontData, glyphId);
    ret->height = fontData->header.fixedHeight;
}

static void DecompressGlyphTiles_LazyFromNarc(struct FontData *fontData, u16 glyphId, struct GlyphInfo *ret) {
    NARC_ReadFromAbsolutePos(fontData->narc, fontData->gmifOffset + fontData->header.headerSize + glyphId * fontData->glyphSize, fontData->glyphSize, fontData->glyphReadBuf);
    switch (fontData->glyphShape) {
    case GLYPHSHAPE_8x8:
        DecompressGlyphTile(fontData->glyphReadBuf + 0, ret->data + 0);
        break;
    case GLYPHSHAPE_8x16:
        DecompressGlyphTile(fontData->glyphReadBuf + 0, ret->data + 0);
        DecompressGlyphTile(fontData->glyphReadBuf + 0x10, ret->data + 0x40);
        break;
    case GLYPHSHAPE_16x8:
        DecompressGlyphTile(fontData->glyphReadBuf + 0, ret->data + 0);
        DecompressGlyphTile(fontData->glyphReadBuf + 0x10, ret->data + 0x20);
        break;
    case GLYPHSHAPE_16x16:
        DecompressGlyphTile(fontData->glyphReadBuf + 0, ret->data + 0);
        DecompressGlyphTile(fontData->glyphReadBuf + 0x10, ret->data + 0x20);
        DecompressGlyphTile(fontData->glyphReadBuf + 0x20, ret->data + 0x40);
        DecompressGlyphTile(fontData->glyphReadBuf + 0x30, ret->data + 0x60);
        break;
    }
    ret->width = fontData->glyphWidthFunc(fontData, glyphId);
    ret->height = fontData->header.fixedHeight;
}

u32 GetStringWidth(struct FontData *fontData, const u16 *string, u32 letterSpacing) {
    u32 ret = 0;

    while (*string != EOS) {
        if (*string == EXT_CTRL_CODE_BEGIN) {
            string = MsgArray_SkipControlCode(string);
            if (*string != EOS) {
                continue;
            }
            break;
        } else {
            ret += fontData->glyphWidthFunc(fontData, *string - 1) + letterSpacing;
            string++;
        }
    }
    return ret - letterSpacing;
}

u32 GetStringWidthFirstLine(struct FontData *fontData, const u16 *string, u32 letterSpacing) {
    u32 ret = 0;

    while (*string != EOS && *string != CHAR_LF) {
        if (*string == EXT_CTRL_CODE_BEGIN) {
            string = MsgArray_SkipControlCode(string);
            if (*string != EOS && *string != CHAR_LF) {
                continue;
            }
            break;
        } else {
            ret += fontData->glyphWidthFunc(fontData, *string - 1) + letterSpacing;
            string++;
        }
    }
    return ret - letterSpacing;
}

BOOL StringAllCharsValid(struct FontData *fontData, const u16 *string) {
    while (*string != EOS) {
        if (*string == EXT_CTRL_CODE_BEGIN) {
            string = MsgArray_SkipControlCode(string);
            if (*string == EOS) {
                return TRUE;
            }
            // bug: if multiple ext ctrl codes in tandem,
            // incorrectly returns false
        }
        if (*string - 1 >= fontData->header.numGlyphs) {
            return FALSE;
        }
        string++;
    }
    return TRUE;
}

static u32 GetGlyphWidth_VariableWidth(struct FontData *fontData, int glyphId) {
    if (glyphId < fontData->header.numGlyphs) {
        return fontData->glyphWidths[glyphId];
    } else {
        return fontData->glyphWidths[428 - 1];
    }
}

static u32 GetGlyphWidth_FixedWidth(struct FontData *fontData, int glyphId) {
    return fontData->header.fixedWidth;
}

u32 GetStringWidthMultiline(struct FontData *fontData, const u16 *string, u32 letterSpacing) {
    u32 cur = 0, ret = 0;

    while (*string != EOS) {
        if (*string == EXT_CTRL_CODE_BEGIN) {
            string = MsgArray_SkipControlCode(string);
        } else if (*string == CHAR_LF) {
            if (ret < cur - letterSpacing) {
                ret = cur - letterSpacing;
            }
            cur = 0;
            string++;
        } else {
            cur += fontData->glyphWidthFunc(fontData, *string - 1) + letterSpacing;
            string++;
        }
    }
    if (ret < cur - letterSpacing) {
        ret = cur - letterSpacing;
    }
    return ret;
}

u32 GetGlyphWidth(struct FontData *fontData, u16 glyph) {
    if (glyph != 0) {
        return fontData->glyphWidthFunc(fontData, glyph - 1);
    } else {
        GF_ASSERT(glyph != 0);
        return 0;
    }
}
