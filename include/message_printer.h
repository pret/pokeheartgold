#ifndef POKEHEARTGOLD_MESSAGE_PRINTER_H
#define POKEHEARTGOLD_MESSAGE_PRINTER_H

#include "global.h"
#include "string_util.h"

typedef struct MessagePrinter {
    void *charData;
    struct NNSG2dCharacterData *ppCharData;
    u16 string[16];
    u32 color;
} MessagePrinter;

MessagePrinter *MessagePrinter_New(u32 color1, u32 color2, u32 color3, HeapID heapId);
void MessagePrinter_Delete(MessagePrinter *messagePrinter);
void sub_0200CDAC(MessagePrinter *messagePrinter, u8 a1, Window *window, u32 x, u32 y);
void PrintUIntOnWindow(MessagePrinter *messagePrinter, u32 num, u32 ndigits, PrintingMode mode, Window *window, u32 x, u32 y);

#endif //POKEHEARTGOLD_MESSAGE_PRINTER_H
