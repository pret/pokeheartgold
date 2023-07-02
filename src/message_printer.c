#include "global.h"
#include "filesystem_files_def.h"
#include "gf_gfx_loader.h"
#include "message_printer.h"

static const u16 _020F5C24[][2] = {
    { 0x0140, 0x0008 },
    { 0x0160, 0x0010 },
    { 0x01A0, 0x0010 },
    { 0x01E0, 0x0010 },
    { 0x0220, 0x0010 },
    { 0x0260, 0x0010 },
    { 0x02A0, 0x0010 },
};

MessagePrinter *MessagePrinter_New(u32 color1, u32 color2, u32 color3, HeapID heapId)
{
    MessagePrinter *messagePrinter = AllocFromHeap(heapId, sizeof(MessagePrinter));
    if (messagePrinter != NULL) {
        messagePrinter->charData = GfGfxLoader_GetCharData(NARC_graphic_font, 5, 1, &messagePrinter->ppCharData, heapId);
        int i;
        u8 *ptr = messagePrinter->ppCharData->pRawData;
        for (i = 0; i < messagePrinter->ppCharData->szByte; i++) {
            switch (ptr[i]) {
            case 0:
                ptr[i] = ((color3 << 4) | color3);
                break;
            case 1:
                ptr[i] = ((color3 << 4) | color1);
                break;
            case 2:
                ptr[i] = ((color3 << 4) | color2);
                break;
            case 16:
                ptr[i] = ((color1 << 4) | color3);
                break;
            case 17:
                ptr[i] = ((color1 << 4) | color1);
                break;
            case 18:
                ptr[i] = ((color1 << 4) | color2);
                break;
            case 32:
                ptr[i] = ((color2 << 4) | color3);
                break;
            case 33:
                ptr[i] = ((color2 << 4) | color1);
                break;
            case 34:
                ptr[i] = ((color2 << 4) | color2);
                break;
            }
        }
        messagePrinter->color = color3;
    }
    return messagePrinter;
}

void MessagePrinter_Delete(MessagePrinter *messagePrinter)
{
    if (messagePrinter != NULL) {
        if (messagePrinter->charData != NULL) {
            FreeToHeap(messagePrinter->charData);
        }
        FreeToHeap(messagePrinter);
    }
}

void sub_0200CDAC(MessagePrinter *messagePrinter, u8 a1, Window *window, u32 x, u32 y)
{
    BlitBitmapRectToWindow(window, messagePrinter->ppCharData->pRawData + _020F5C24[a1][0], 0, 0, _020F5C24[a1][1], 8, x, y, _020F5C24[a1][1], 8);
}

void PrintUIntOnWindow(MessagePrinter *messagePrinter, u32 num, u32 ndigits, PrintingMode mode, Window *window, u32 x, u32 y)
{
    ConvertUIntToDecimalString(messagePrinter->string, num, mode, ndigits);
    u32 i;
    for (i = 0; messagePrinter->string[i] != EOS; i++) {
        if (messagePrinter->string[i] >= CHAR_JP_0 && messagePrinter->string[i] <= CHAR_JP_9) {
            BlitBitmapRectToWindow(window, messagePrinter->ppCharData->pRawData + (messagePrinter->string[i] - CHAR_JP_0) * 32, 0, 0, 8, 8, x, y, 8, 8);
        }
        else {
            FillWindowPixelRect(window, messagePrinter->color, x, y, 8, 8);
        }
        x += 8;
    }
}
