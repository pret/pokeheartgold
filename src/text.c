#include "global.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "text.h"
#include "unk_0201F79C.h"

struct Unk21D1F6C {
    u8 unk0;
    u16 fgColor;
    u16 shadowColor;
    u16 bgColor;
};

const struct FontInfo *_0210F6D8;

struct Unk21D1F6C _021D1F6C;
SysTask *sTextPrinterTasks[MAX_TEXT_PRINTERS];
u16 _021D1F94[4 * 4 * 4 * 4];

static u8 CreateTextPrinterSysTask(SysTaskFunc taskFunc, TextPrinter *printer, u32 priority);
static BOOL sub_02020068(u8 printerId);
static u8 AddTextPrinter(TextPrinterTemplate *template, u32 speed, PrinterCallback_t callback);
static void sub_020202EC(SysTask *task, TextPrinter *printer);
static u32 sub_02020358(TextPrinter *printer);
static void sub_020204B8(TextPrinter *printer);
static u16 *sub_020204C0(void);
static void sub_02020548(TextPrinter *printer);

void sub_0201FFE0(const struct FontInfo *fontData) {
    _0210F6D8 = fontData;
}

static u8 CreateTextPrinterSysTask(SysTaskFunc taskFunc, TextPrinter *printer, u32 priority) {
    int i;
    for (i = 0; i < MAX_TEXT_PRINTERS; i++) {
        if (sTextPrinterTasks[i] != NULL) {
            continue;
        }

        sTextPrinterTasks[i] = sub_0200E358(taskFunc, printer, priority);
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

    TextPrinter *printer = sub_0201F988(sTextPrinterTasks[printerId]);
    if (printer != NULL) {
        sub_02020548(printer);
        FreeToHeap(printer);
    }

    DestroySysTask(sTextPrinterTasks[printerId]);
    sTextPrinterTasks[printerId] = NULL;
}

static BOOL sub_02020068(u8 printerId) {
    return sTextPrinterTasks[printerId] != NULL;
}

void ResetAllTextPrinters(void) {
    for (int i = 0; i < MAX_TEXT_PRINTERS; i++) {
        sTextPrinterTasks[i] = NULL;
    }
}

u8 TextPrinterCheckActive(u8 printerId) {
    return sub_02020068(printerId);
}

void sub_020200A0(u8 printerId) {
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
    template.letterSpacing = _0210F6D8[fontId].letterSpacing;
    template.lineSpacing = _0210F6D8[fontId].lineSpacing;
    template.unk14 = _0210F6D8[fontId].unk;
    template.fgColor = _0210F6D8[fontId].fgColor;
    template.bgColor = _0210F6D8[fontId].bgColor;
    template.shadowColor = _0210F6D8[fontId].shadowColor;
    template.unk18 = 0;
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
    template.letterSpacing = _0210F6D8[fontId].letterSpacing;
    template.lineSpacing = _0210F6D8[fontId].lineSpacing;
    template.unk14 = _0210F6D8[fontId].unk;
    template.fgColor = (color >> 16) & 0xFF;
    template.shadowColor = (color >> 8) & 0xFF;
    template.bgColor = (color >> 0) & 0xFF;
    template.unk18 = 0;
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
    template.unk14 = _0210F6D8[fontId].unk;
    template.fgColor = (color >> 16) & 0xFF;
    template.shadowColor = (color >> 8) & 0xFF;
    template.bgColor = (color >> 0) & 0xFF;
    template.unk18 = 0;
    template.unk1A = 0;
    template.unk1B = 0xFF;

    return AddTextPrinter(&template, textSpeed, callback);
}

static u8 AddTextPrinter(TextPrinterTemplate *template, u32 speed, PrinterCallback_t callback) {
    if (_0210F6D8 == NULL) {
        return 0xFF;
    }

    TextPrinter *printer = AllocFromHeap(HEAP_ID_DEFAULT, sizeof(TextPrinter));
    printer->active = 1;
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
    _021D1F6C.unk0 = 0;

    sub_020204B8(printer);

    if (speed != TEXT_SPEED_NOTRANSFER && speed != TEXT_SPEED_INSTANT) {
        printer->textSpeedBottom--;
        printer->textSpeedTop = 1;
        printer->id = CreateTextPrinterSysTask((SysTaskFunc)sub_020202EC, printer, 1);
        return printer->id;
    }

    u32 i = 0;

    printer->textSpeedBottom = 0;
    printer->textSpeedTop = 0;

    sub_0202036C(template->fgColor, template->bgColor, template->shadowColor);

    for (; i < 0x400; i++) {
        if (sub_02020358(printer) == 1) {
            break;
        }
    }

    if (speed != TEXT_SPEED_NOTRANSFER) {
        CopyWindowToVram(printer->template.window);
    }

    sub_02020548(printer);
    FreeToHeap(printer);

    return MAX_TEXT_PRINTERS;
}

static void sub_020202EC(SysTask *task, TextPrinter *printer) {
    if (_021D1F6C.unk0 != 0) {
        return;
    }

    if (printer->unk2D == 0) {
        printer->unk2E = 0;

        sub_0202036C(printer->template.fgColor, printer->template.bgColor, printer->template.shadowColor);

        switch (sub_02020358(printer)) {
            case 0:
                CopyWindowToVram(printer->template.window);
                // fallthrough
            case 3:
                if (printer->callback != NULL) {
                    printer->unk2D = printer->callback(&printer->template, printer->unk2E);
                }
                return;
            case 1:
                DestroyTextPrinterSysTask(printer->id);
                return;
        }
    } else {
        printer->unk2D = printer->callback(&printer->template, printer->unk2E);
    }
}

static u32 sub_02020358(TextPrinter *printer) {
    u32 ret;
    do {
        ret = FontID_RenderText(printer->template.fontId, printer);
    } while (ret == 2);
    return ret;
}

// https://decomp.me/scratch/YCL75
#ifdef NONMATCHING
void sub_0202036C(u8 fgColor, u8 bgColor, u8 shadowColor) {
    u32 colors[4];
    colors[0] = 0;
    colors[1] = fgColor;
    colors[2] = shadowColor;
    colors[3] = bgColor;

    _021D1F6C.bgColor = bgColor;
    _021D1F6C.fgColor = fgColor;
    _021D1F6C.shadowColor = shadowColor;

    u32 index = 0;
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            for (int k = 0; k < 4; k++) {
                for (int l = 0; l < 4; l++) {
                    _021D1F94[index++] = (colors[l] << 12) | (colors[k] << 8) | (colors[j] << 4) | colors[i];
                }
            }
        }
    }
}
#else
asm void sub_0202036C(u8 fgColor, u8 bgColor, u8 shadowColor) {
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r3, [pc, #0x94] // _02020408 ; =_021D1F6C
	mov r5, #0
	str r5, [sp, #0x20]
	str r0, [sp, #0x24]
	str r2, [sp, #0x28]
	str r1, [sp, #0x2c]
	strh r1, [r3, #6]
	strh r0, [r3, #2]
	add r0, sp, #0x20
	strh r2, [r3, #4]
	str r5, [sp, #0x14]
	str r0, [sp, #8]
	mov ip, r0
	mov lr, r0
	str r0, [sp, #0x18]
_0202038E:
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r0, [r0, #0]
	str r0, [sp, #0x1c]
_0202039C:
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, lr
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0]
	lsl r7, r0, #4
_020203AA:
	ldr r0, [sp]
	mov r3, #0
	ldr r0, [r0, #0]
	mov r4, ip
	lsl r6, r0, #8
_020203B4:
	ldr r0, [r4, #0]
	add r1, r7, #0
	lsl r0, r0, #0xc
	orr r0, r6
	orr r1, r0
	ldr r0, [sp, #0x1c]
	add r3, r3, #1
	add r2, r0, #0
	orr r2, r1
	lsl r1, r5, #1
	ldr r0, [pc, #0x40] // _0202040C ; =_021D1F94
	add r5, r5, #1
	add r4, r4, #4
	strh r2, [r0, r1]
	cmp r3, #4
	blt _020203B4
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #4
	blt _020203AA
	ldr r0, [sp, #4]
	add r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _0202039C
	ldr r0, [sp, #8]
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _0202038E
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_02020408: DCD _021D1F6C
_0202040C: DCD _021D1F94
}
#endif

void DecompressGlyphTile(const u8* src, u8* dest) {
    const u16 *src16 = (u16*)src;
    u16 *dest16 = (u16*)dest;
    dest16[0] = _021D1F94[src16[0] / 256];
    dest16[1] = _021D1F94[src16[0] & 0xFF];
    dest16[2] = _021D1F94[src16[1] / 256];
    dest16[3] = _021D1F94[src16[1] & 0xFF];
    dest16[4] = _021D1F94[src16[2] / 256];
    dest16[5] = _021D1F94[src16[2] & 0xFF];
    dest16[6] = _021D1F94[src16[3] / 256];
    dest16[7] = _021D1F94[src16[3] & 0xFF];
    dest16[8] = _021D1F94[src16[4] / 256];
    dest16[9] = _021D1F94[src16[4] & 0xFF];
    dest16[10] = _021D1F94[src16[5] / 256];
    dest16[11] = _021D1F94[src16[5] & 0xFF];
    dest16[12] = _021D1F94[src16[6] / 256];
    dest16[13] = _021D1F94[src16[6] & 0xFF];
    dest16[14] = _021D1F94[src16[7] / 256];
    dest16[15] = _021D1F94[src16[7] & 0xFF];
}

static void sub_020204B8(TextPrinter *printer) {
    printer->unk30 = NULL;
}

static u16 *sub_020204C0(void) {
    u16 *ret = AllocFromHeap(HEAP_ID_DEFAULT, 0x300 * sizeof(u16));

    NNSG2dCharacterData *g2dCharData;
    void *charData = GfGfxLoader_GetCharData(NARC_graphic_font, 6, FALSE, &g2dCharData, HEAP_ID_DEFAULT);
    MI_CpuCopy32(g2dCharData->pRawData, ret, 0x300 * sizeof(u16));
    FreeToHeap(charData);

    return ret;
}

void sub_020204FC(TextPrinter *printer, u32 x, u32 y, u16 fieldNum) {
    (void)x;
    (void)y;

    Window *window = printer->template.window;

    if (printer->unk30 == NULL) {
        printer->unk30 = sub_020204C0();
    }

    void *startAddr = (void*)printer->unk30 + (fieldNum * 0x180);
    u16 destX = (GetWindowWidth(window) - 3) * 8;
    BlitBitmapRectToWindow(window, startAddr, 0, 0, 24, 32, destX, 0, 24, 32);
}

static void sub_02020548(TextPrinter *printer) {
    if (printer->unk30 != NULL) {
        FreeToHeap(printer->unk30);
        printer->unk30 = NULL;
    }
}
