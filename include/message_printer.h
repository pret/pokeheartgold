#include "global.h"
#include "string_util.h"

typedef struct MessagePrinter {
    void *charData;
    struct NNSG2dCharacterData *ppCharData;
    u16 string[16];
    u32 color;
} MessagePrinter;

MessagePrinter *MessagePrinter_new(u32 color1, u32 color2, u32 color3, HeapID heap_id);
void MessagePrinter_delete(MessagePrinter *a0);
void sub_0200CDAC(MessagePrinter *string, u8 a1, WINDOW *window, u32 x, u32 y);
void sub_0200CDF0(MessagePrinter *string, u32 value, u32 n, STRCONVMODE mode, WINDOW *window, u32 x, u32 y);
