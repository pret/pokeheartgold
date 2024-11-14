#ifndef POKEHEARTGOLD_FONT_TYPES_DEF_H
#define POKEHEARTGOLD_FONT_TYPES_DEF_H

#include "bg_window.h"
#include "pm_string.h"

typedef u8 FontID;
struct FontData;

typedef struct GlyphInfo {
    u8 data[0x80];
    u8 width;
    u8 height;
} GlyphInfo;

struct FontInfo {
    u8 maxLetterWidth;
    u8 maxLetterHeight;
    u8 letterSpacing;
    u8 lineSpacing;
    u8 unk;
    u8 fgColor;
    u8 bgColor;
    u8 shadowColor;
};

union StrbufForPrint {
    String *wrapped;
    const u16 *raw;
};

typedef struct TextPrinterTemplate {
    union StrbufForPrint currentChar;
    Window *window;
    u8 padding[1];
    FontID fontId;
    u8 x, y;
    u16 currentX, currentY;
    u16 letterSpacing, lineSpacing;
    u8 unk14;
    u8 fgColor, bgColor, shadowColor;
    u16 glyphTable;
    u8 unk1A;
    u8 unk1B;
} TextPrinterTemplate;

typedef BOOL (*PrinterCallback_t)(TextPrinterTemplate *template, u16 glyphId);

typedef struct TextPrinter {
    TextPrinterTemplate template;
    PrinterCallback_t callback;

    u8 subStructFields[7]; // x20
    u8 active;
    u8 state;
    u8 textSpeedBottom : 7; // x29
    u8 textSpeedTop : 1;
    u8 delayCounter;
    u8 scrollDistance;
    u8 id;
    u8 unk2D;
    u16 unk2E;
    u16 *unk30;
} TextPrinter;

typedef enum RenderResult {
    RENDER_PRINT,
    RENDER_FINISH,
    RENDER_REPEAT, // Run render function again, if e.g. a control code is encountered.
    RENDER_UPDATE,
} RenderResult;

#endif // POKEHEARTGOLD_FONT_TYPES_DEF_H
