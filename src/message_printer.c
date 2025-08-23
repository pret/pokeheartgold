#include "message_printer.h"

#include "global.h"

#include "filesystem_files_def.h"
#include "gf_gfx_loader.h"

static const u16 _020F5C24[][2] = {
    { 0x0140, 0x0008 },
    { 0x0160, 0x0010 },
    { 0x01A0, 0x0010 },
    { 0x01E0, 0x0010 },
    { 0x0220, 0x0010 },
    { 0x0260, 0x0010 },
    { 0x02A0, 0x0010 },
};

MessagePrinter *MessagePrinter_New(u32 foreground, u32 shadow, u32 background, HeapID heapId) {
    MessagePrinter *messagePrinter = AllocFromHeap(heapId, sizeof(MessagePrinter));
    if (messagePrinter != NULL) {
        messagePrinter->charData = GfGfxLoader_GetCharData(NARC_graphic_font, 5, TRUE, &messagePrinter->ppCharData, heapId);
        int i;
        u8 *ptr = messagePrinter->ppCharData->pRawData;
        for (i = 0; i < messagePrinter->ppCharData->szByte; i++) {
            switch (ptr[i]) {
            case 0x00:
                ptr[i] = ((background << 4) | background);
                break;
            case 0x01:
                ptr[i] = ((background << 4) | foreground);
                break;
            case 0x02:
                ptr[i] = ((background << 4) | shadow);
                break;
            case 0x10:
                ptr[i] = ((foreground << 4) | background);
                break;
            case 0x11:
                ptr[i] = ((foreground << 4) | foreground);
                break;
            case 0x12:
                ptr[i] = ((foreground << 4) | shadow);
                break;
            case 0x20:
                ptr[i] = ((shadow << 4) | background);
                break;
            case 0x21:
                ptr[i] = ((shadow << 4) | foreground);
                break;
            case 0x22:
                ptr[i] = ((shadow << 4) | shadow);
                break;
            }
        }
        messagePrinter->backgroundColor = background;
    }
    return messagePrinter;
}

void MessagePrinter_Delete(MessagePrinter *messagePrinter) {
    if (messagePrinter != NULL) {
        if (messagePrinter->charData != NULL) {
            Heap_Free(messagePrinter->charData);
        }
        Heap_Free(messagePrinter);
    }
}

void sub_0200CDAC(MessagePrinter *messagePrinter, u8 glyphId, Window *window, u32 x, u32 y) {
    BlitBitmapRectToWindow(window, messagePrinter->ppCharData->pRawData + _020F5C24[glyphId][0], 0, 0, _020F5C24[glyphId][1], 8, x, y, _020F5C24[glyphId][1], 8);
}

void PrintUIntOnWindow(MessagePrinter *messagePrinter, u32 num, u32 ndigits, PrintingMode mode, Window *window, u32 x, u32 y) {
    ConvertUIntToDecimalString(messagePrinter->string, num, mode, ndigits);
    u32 i;
    for (i = 0; messagePrinter->string[i] != EOS; i++) {
        if (messagePrinter->string[i] >= CHAR_JP_0 && messagePrinter->string[i] <= CHAR_JP_9) {
            BlitBitmapRectToWindow(window, messagePrinter->ppCharData->pRawData + (messagePrinter->string[i] - CHAR_JP_0) * 32, 0, 0, 8, 8, x, y, 8, 8);
        } else {
            FillWindowPixelRect(window, messagePrinter->backgroundColor, x, y, 8, 8);
        }
        x += 8;
    }
}
