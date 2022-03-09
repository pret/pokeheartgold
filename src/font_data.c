#include "font_data.h"

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

void FontData_Init(struct FontData *fontData, NarcId narcId, int fileId, BOOL isFixedWidth, HeapID heapId);
void FontData_FreeWidthsAndNarc(struct FontData *fontData);
void InitFontResources(struct FontData *fontData, int mode, HeapID heapId);
void InitFontResources_FromPreloaded(struct FontData *fontData, HeapID heapId);
void InitFontResources_LazyFromNarc(struct FontData *fontData, HeapID heapId);
void FreeLoadedFontResources(struct FontData *fontData);
void FreeLoadedFontResources_FromPreloaded(struct FontData *fontData);
void FreeLoadedFontResources_LazyFromNarc(struct FontData *fontData);
void DecompressGlyphTiles_FromPreloaded(struct FontData *fontData, u16 glyphId, struct GlyphInfo *ret);
void DecompressGlyphTile(const u8 *src, u8 *dest);
u32 GetGlyphWidth_FixedWidth(struct FontData *fontData, int glyphId);
u32 GetGlyphWidth_VariableWidth(struct FontData *fontData, int glyphId);
void DecompressGlyphTiles_LazyFromNarc(struct FontData *fontData, u16 glyphId, struct GlyphInfo *ret);

struct FontData *FontData_new(NarcId narcId, int fileId, int mode, BOOL isFixedWidth, HeapID heapId) {
    struct FontData *ret;

    ret = AllocFromHeap(heapId, sizeof(struct FontData));
    if (ret != NULL) {
        FontData_Init(ret, narcId, fileId, isFixedWidth, heapId);
        InitFontResources(ret, mode, heapId);
    }
    return ret;
}

void FontData_delete(struct FontData *fontData) {
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

void FontData_Init(struct FontData *fontData, NarcId narcId, int fileId, BOOL isFixedWidth, HeapID heapId) {
    static const u8 _020F6324[][2] = {
        {0, 1},
        {2, 3}
    };
    fontData->narc = NARC_ctor(narcId, heapId);
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
        fontData->glyphShape = _020F6324[fontData->header.glyphWidth - 1][fontData->header.glyphHeight - 1];
        fontData->glyphSize = 16 * fontData->header.glyphWidth * fontData->header.glyphHeight;
        fontData->fileId = fileId;
    }
}

void FontData_FreeWidthsAndNarc(struct FontData *fontData) {
    if (fontData->glyphWidths != NULL) {
        FreeToHeap(fontData->glyphWidths);
    }
    if (fontData->narc != NULL) {
        NARC_dtor(fontData->narc);
    }
}

void InitFontResources(struct FontData *fontData, int mode, HeapID heapId) {
    static void (*const _020F6328[])(struct FontData *fontData, HeapID heapId) = {
        InitFontResources_FromPreloaded,
        InitFontResources_LazyFromNarc,
    };
    fontData->glyphAccessMode = mode;
    _020F6328[mode](fontData, heapId);
}

void InitFontResources_FromPreloaded(struct FontData *fontData, HeapID heapId) {
    u32 size = fontData->glyphSize * fontData->header.numGlyphs;
    fontData->narcReadBuf = AllocFromHeap(heapId, size);
    fontData->uncompGlyphFunc = DecompressGlyphTiles_FromPreloaded;
    NARC_ReadFromMember(fontData->narc, fontData->fileId, fontData->header.headerSize, size, fontData->narcReadBuf);
}

void InitFontResources_LazyFromNarc(struct FontData *fontData, HeapID heapId) {
    fontData->uncompGlyphFunc = DecompressGlyphTiles_LazyFromNarc;
}

void FreeLoadedFontResources(struct FontData *fontData) {
    static void (*const _020F6330[])(struct FontData *fontData) = {
        FreeLoadedFontResources_FromPreloaded,
        FreeLoadedFontResources_LazyFromNarc,
    };
    _020F6330[fontData->glyphAccessMode](fontData);
}

void FreeLoadedFontResources_FromPreloaded(struct FontData *fontData) {
    FreeToHeap(fontData->narcReadBuf);
    fontData->narcReadBuf = NULL;
}

void FreeLoadedFontResources_LazyFromNarc(struct FontData *fontData) {
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

void DecompressGlyphTiles_FromPreloaded(struct FontData *fontData, u16 glyphId, struct GlyphInfo *ret) {
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

void DecompressGlyphTiles_LazyFromNarc(struct FontData *fontData, u16 glyphId, struct GlyphInfo *ret) {
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
