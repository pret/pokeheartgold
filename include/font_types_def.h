#ifndef POKEHEARTGOLD_FONT_TYPES_DEF_H
#define POKEHEARTGOLD_FONT_TYPES_DEF_H

#include "pm_string.h"
#include "bg_window.h"

typedef u8 FontID;
struct FontData;

struct GlyphInfo {
    u8 data[0x80];
    u8 width;
    u8 height;
};

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

struct TextPrinterTemplate {
    union StrbufForPrint currentChar;
    Window *window;
    u8 padding[1];
    FontID fontId;
    u8 x, y;
    u16 currentX, currentY;
    u16 letterSpacing, lineSpacing;
    u8 unk14;
    u8 fgColor, bgColor, shadowColor;
    u16 unk18;
    u8 unk1A;
    u8 unk1B;
};

typedef BOOL (*PrinterCallback_t)(struct TextPrinterTemplate *template, u16 glyphId);

struct TextPrinter {
    struct TextPrinterTemplate template;
    PrinterCallback_t calback;

    u8 subStructFields[7]; // x20
    u8 active;
    u8 state;
    u8 textSpeedBottom:7; // x29
    u8 textSpeedTop:1;
    u8 delayCounter;
    u8 scrollDistance;
    u8 minLetterSpacing;
    u8 Unk2D;
    u16 Unk2E;
    u16 *Unk30;
};

#endif //POKEHEARTGOLD_FONT_TYPES_DEF_H
