#include "global.h"
#include "string_util.h"

struct UnkStruct_0200CC74
{
    void * unk_0;
    struct NNSG2dCharacterData * unk_4;
    u16 data[16];
    u32 unk_28;
};

struct UnkStruct_0200CC74 * MessagePrinter_new(u32 color1, u32 color2, u32 color3, HeapID heap_id);
void MessagePrinter_delete(struct UnkStruct_0200CC74 * a0);
void sub_0200CDAC(struct UnkStruct_0200CC74 * a0, int a1, WINDOW *a2, int a3, int a4);
void sub_0200CDF0(struct UnkStruct_0200CC74 * string, u32 value, u32 n, STRCONVMODE mode, WINDOW *window, int x, int y);