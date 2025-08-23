#include "text.h"

#include "global.h"

#include "font.h"
#include "gf_gfx_loader.h"
#include "sys_task.h"

static const struct FontInfo *sFonts;

static u8 _021D1F6C;
static u16 sFgColor, sShadowColor, sBgColor;
static SysTask *sTextPrinterTasks[MAX_TEXT_PRINTERS];
static u16 sFontHalfRowLookupTable[4 * 4 * 4 * 4];

static u8 CreateTextPrinterSysTask(SysTaskFunc taskFunc, TextPrinter *printer, u32 priority);
static BOOL TextPrinterSysTaskIsActive(u8 printerId);
static u8 AddTextPrinter(TextPrinterTemplate *template, u32 speed, PrinterCallback_t callback);
static void RunTextPrinter(SysTask *task, TextPrinter *printer);
static RenderResult RenderFont(TextPrinter *printer);
static void sub_020204B8(TextPrinter *printer);
static u16 *LoadScreenFocusIndicatorGraphics(void);
static void sub_02020548(TextPrinter *printer);

void SetFontsPointer(const struct FontInfo *fonts) {
    sFonts = fonts;
}

static u8 CreateTextPrinterSysTask(SysTaskFunc taskFunc, TextPrinter *printer, u32 priority) {
    int i;
    for (i = 0; i < MAX_TEXT_PRINTERS; i++) {
        if (sTextPrinterTasks[i] != NULL) {
            continue;
        }

        sTextPrinterTasks[i] = SysTask_CreateOnPrintQueue(taskFunc, printer, priority);
        if (sTextPrinterTasks[i] == NULL) {
            i = MAX_TEXT_PRINTERS;
        }
        break;
    }
    return i;
}

static void DestroyTextPrinterSysTask(u8 printerId) {
    GF_ASSERT(printerId < MAX_TEXT_PRINTERS);
    GF_ASSERT(sTextPrinterTasks[printerId] != NULL);
    if (printerId >= MAX_TEXT_PRINTERS || sTextPrinterTasks[printerId] == NULL) {
        return;
    }

    TextPrinter *printer = SysTask_GetData(sTextPrinterTasks[printerId]);
    if (printer != NULL) {
        sub_02020548(printer);
        Heap_Free(printer);
    }

    SysTask_Destroy(sTextPrinterTasks[printerId]);
    sTextPrinterTasks[printerId] = NULL;
}

static BOOL TextPrinterSysTaskIsActive(u8 printerId) {
    return sTextPrinterTasks[printerId] != NULL;
}

void ResetAllTextPrinters(void) {
    for (int i = 0; i < MAX_TEXT_PRINTERS; i++) {
        sTextPrinterTasks[i] = NULL;
    }
}

u8 TextPrinterCheckActive(u8 printerId) {
    return TextPrinterSysTaskIsActive(printerId);
}

void RemoveTextPrinter(u8 printerId) {
    DestroyTextPrinterSysTask(printerId);
}

u8 AddTextPrinterParameterized(Window *window, FontID fontId, String *string, u32 x, u32 y, u32 textSpeed, PrinterCallback_t callback) {
    TextPrinterTemplate template;

    template.currentChar.wrapped = string;
    template.window = window;
    template.fontId = fontId;
    template.x = x;
    template.y = y;
    template.currentX = x;
    template.currentY = y;
    template.letterSpacing = sFonts[fontId].letterSpacing;
    template.lineSpacing = sFonts[fontId].lineSpacing;
    template.unk14 = sFonts[fontId].unk;
    template.fgColor = sFonts[fontId].fgColor;
    template.bgColor = sFonts[fontId].bgColor;
    template.shadowColor = sFonts[fontId].shadowColor;
    template.glyphTable = 0;
    template.unk1A = 0;
    template.unk1B = 0xFF;

    return AddTextPrinter(&template, textSpeed, callback);
}

u8 AddTextPrinterParameterizedWithColor(Window *window, FontID fontId, String *string, u32 x, u32 y, u32 textSpeed, u32 color, PrinterCallback_t callback) {
    TextPrinterTemplate template;

    template.currentChar.wrapped = string;
    template.window = window;
    template.fontId = fontId;
    template.x = x;
    template.y = y;
    template.currentX = x;
    template.currentY = y;
    template.letterSpacing = sFonts[fontId].letterSpacing;
    template.lineSpacing = sFonts[fontId].lineSpacing;
    template.unk14 = sFonts[fontId].unk;
    template.fgColor = (color >> 16) & 0xFF;
    template.shadowColor = (color >> 8) & 0xFF;
    template.bgColor = (color >> 0) & 0xFF;
    template.glyphTable = 0;
    template.unk1A = 0;
    template.unk1B = 0xFF;

    return AddTextPrinter(&template, textSpeed, callback);
}

u8 AddTextPrinterParameterizedWithColorAndSpacing(Window *window, int fontId, String *string, u32 x, u32 y, u32 textSpeed, u32 color, u32 letterSpacing, u32 lineSpacing, PrinterCallback_t callback) {
    TextPrinterTemplate template;

    template.currentChar.wrapped = string;
    template.window = window;
    template.fontId = fontId;
    template.x = x;
    template.y = y;
    template.currentX = x;
    template.currentY = y;
    template.letterSpacing = letterSpacing;
    template.lineSpacing = lineSpacing;
    template.unk14 = sFonts[fontId].unk;
    template.fgColor = (color >> 16) & 0xFF;
    template.shadowColor = (color >> 8) & 0xFF;
    template.bgColor = (color >> 0) & 0xFF;
    template.glyphTable = 0;
    template.unk1A = 0;
    template.unk1B = 0xFF;

    return AddTextPrinter(&template, textSpeed, callback);
}

static u8 AddTextPrinter(TextPrinterTemplate *template, u32 speed, PrinterCallback_t callback) {
    if (sFonts == NULL) {
        return 0xFF;
    }

    TextPrinter *printer = AllocFromHeap(HEAP_ID_DEFAULT, sizeof(TextPrinter));
    printer->active = TRUE;
    printer->state = 0;
    printer->textSpeedBottom = speed;
    printer->delayCounter = 0;
    printer->scrollDistance = 0;
    printer->unk2D = 0;
    for (int i = 0; i < 7; i++) {
        printer->subStructFields[i] = 0;
    }
    printer->template = *template;
    printer->template.currentChar.raw = String_cstr(printer->template.currentChar.wrapped);
    printer->callback = callback;
    _021D1F6C = 0;

    sub_020204B8(printer);

    if (speed != TEXT_SPEED_NOTRANSFER && speed != TEXT_SPEED_INSTANT) {
        printer->textSpeedBottom--;
        printer->textSpeedTop = 1;
        printer->id = CreateTextPrinterSysTask((SysTaskFunc)RunTextPrinter, printer, 1);
        return printer->id;
    }

    u32 i = 0;

    printer->textSpeedBottom = 0;
    printer->textSpeedTop = 0;

    GenerateFontHalfRowLookupTable(template->fgColor, template->bgColor, template->shadowColor);

    for (; i < 0x400; i++) {
        if (RenderFont(printer) == RENDER_FINISH) {
            break;
        }
    }

    if (speed != TEXT_SPEED_NOTRANSFER) {
        CopyWindowToVram(printer->template.window);
    }

    sub_02020548(printer);
    Heap_Free(printer);

    return MAX_TEXT_PRINTERS;
}

static void RunTextPrinter(SysTask *task, TextPrinter *printer) {
    if (_021D1F6C != 0) {
        return;
    }

    if (printer->unk2D == 0) {
        printer->unk2E = 0;

        GenerateFontHalfRowLookupTable(printer->template.fgColor, printer->template.bgColor, printer->template.shadowColor);

        switch (RenderFont(printer)) {
        case RENDER_PRINT:
            CopyWindowToVram(printer->template.window);
            // fallthrough
        case RENDER_UPDATE:
            if (printer->callback != NULL) {
                printer->unk2D = printer->callback(&printer->template, printer->unk2E);
            }
            return;
        case RENDER_FINISH:
            DestroyTextPrinterSysTask(printer->id);
            return;
        }
    } else {
        printer->unk2D = printer->callback(&printer->template, printer->unk2E);
    }
}

static RenderResult RenderFont(TextPrinter *printer) {
    RenderResult result;
    do {
        result = FontID_RenderText(printer->template.fontId, printer);
    } while (result == RENDER_REPEAT);
    return result;
}

void GenerateFontHalfRowLookupTable(u8 fgColor, u8 bgColor, u8 shadowColor) {
    u32 colors[4];
    colors[0] = 0;
    colors[1] = fgColor;
    colors[2] = shadowColor;
    colors[3] = bgColor;

    sBgColor = bgColor;
    sFgColor = fgColor;
    sShadowColor = shadowColor;

    u32 index = 0;
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            for (int k = 0; k < 4; k++) {
                for (int l = 0; l < 4; l++) {
                    sFontHalfRowLookupTable[index++] = (colors[l] << 12) | (colors[k] << 8) | (colors[j] << 4) | colors[i];
                }
            }
        }
    }
}

void DecompressGlyphTile(const u8 *src, u8 *dest) {
    const u16 *src16 = (u16 *)src;
    u16 *dest16 = (u16 *)dest;
    dest16[0] = sFontHalfRowLookupTable[(u32)src16[0] >> 8];
    dest16[1] = sFontHalfRowLookupTable[(u32)src16[0] & 0xFF];
    dest16[2] = sFontHalfRowLookupTable[(u32)src16[1] >> 8];
    dest16[3] = sFontHalfRowLookupTable[(u32)src16[1] & 0xFF];
    dest16[4] = sFontHalfRowLookupTable[(u32)src16[2] >> 8];
    dest16[5] = sFontHalfRowLookupTable[(u32)src16[2] & 0xFF];
    dest16[6] = sFontHalfRowLookupTable[(u32)src16[3] >> 8];
    dest16[7] = sFontHalfRowLookupTable[(u32)src16[3] & 0xFF];
    dest16[8] = sFontHalfRowLookupTable[(u32)src16[4] >> 8];
    dest16[9] = sFontHalfRowLookupTable[(u32)src16[4] & 0xFF];
    dest16[10] = sFontHalfRowLookupTable[(u32)src16[5] >> 8];
    dest16[11] = sFontHalfRowLookupTable[(u32)src16[5] & 0xFF];
    dest16[12] = sFontHalfRowLookupTable[(u32)src16[6] >> 8];
    dest16[13] = sFontHalfRowLookupTable[(u32)src16[6] & 0xFF];
    dest16[14] = sFontHalfRowLookupTable[(u32)src16[7] >> 8];
    dest16[15] = sFontHalfRowLookupTable[(u32)src16[7] & 0xFF];
}

static void sub_020204B8(TextPrinter *printer) {
    printer->unk30 = NULL;
}

static u16 *LoadScreenFocusIndicatorGraphics(void) {
    u16 *ret = AllocFromHeap(HEAP_ID_DEFAULT, 32 * 24 * sizeof(u16));

    NNSG2dCharacterData *g2dCharData;
    void *charData = GfGfxLoader_GetCharData(NARC_graphic_font, 6, FALSE, &g2dCharData, HEAP_ID_DEFAULT);
    MI_CpuCopy32(g2dCharData->pRawData, ret, 32 * 24 * sizeof(u16));
    Heap_Free(charData);

    return ret;
}

void RenderScreenFocusIndicatorTile(TextPrinter *printer, u32 unusedX, u32 unusedY, u16 fieldNum) {
    Window *window = printer->template.window;

    if (printer->unk30 == NULL) {
        printer->unk30 = LoadScreenFocusIndicatorGraphics();
    }

    u16 *startAddr = (void *)printer->unk30 + (fieldNum * (24 * 8 * sizeof(u16)));
    u16 destX = (GetWindowWidth(window) - 3) * 8;
    BlitBitmapRectToWindow(window, startAddr, 0, 0, 24, 32, destX, 0, 24, 32);
}

static void sub_02020548(TextPrinter *printer) {
    if (printer->unk30 != NULL) {
        Heap_Free(printer->unk30);
        printer->unk30 = NULL;
    }
}
