#ifndef POKEHEARTGOLD_STRING_H
#define POKEHEARTGOLD_STRING_H

#include "constants/charcode.h"
#include "heap.h"
#include "string_util.h"

typedef struct STRING {
    u16 maxsize;
    u16 size;
    u32 magic;
    u16 data[1];
    u8 padding[2];
} STRING;

STRING *String_ctor(u32 maxsize, HeapID heapId);
void String_dtor(STRING *string);
void CopyStringToU16Array(const STRING *string, u16 *dest, u32 n);
void CopyU16ArrayToString(STRING *string, const u16 *src);
int StringCompare(STRING *a, STRING *b);

#endif //POKEHEARTGOLD_STRING_H
