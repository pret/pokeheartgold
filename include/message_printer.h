#ifndef POKEHEARTGOLD_MESSAGE_PRINTER_H
#define POKEHEARTGOLD_MESSAGE_PRINTER_H

#include "global.h"

#include "bg_window.h"
#include "string_util.h"

typedef struct MessagePrinter {
    void *charData;
    struct NNSG2dCharacterData *ppCharData;
    u16 string[16];
    u32 backgroundColor;
} MessagePrinter;

MessagePrinter *MessagePrinter_New(u32 foreground, u32 shadow, u32 background, HeapID heapId);
void MessagePrinter_Delete(MessagePrinter *messagePrinter);
void sub_0200CDAC(MessagePrinter *messagePrinter, u8 glyphId, Window *window, u32 x, u32 y);
void PrintUIntOnWindow(MessagePrinter *messagePrinter, u32 num, u32 ndigits, PrintingMode mode, Window *window, u32 x, u32 y);

#endif // POKEHEARTGOLD_MESSAGE_PRINTER_H
