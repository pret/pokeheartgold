#ifndef POKEHEARTGOLD_STRING_H
#define POKEHEARTGOLD_STRING_H

#include "constants/charcode.h"
#include "heap.h"
#include "string_util.h"

typedef struct STRING {
    u16 maxsize;
    u16 size;
    u32 magic;
    u16 data[0];
} STRING;

typedef enum STRCONVMODE {
    STRCONVMODE_LEFT_ALIGN,
    STRCONVMODE_RIGHT_ALIGN,
    STRCONVMODE_LEADING_ZEROS,
} STRCONVMODE;

STRING *String_ctor(u32 maxsize, HeapID heapId);
void String_dtor(STRING *string);
void CopyStringToU16Array(const STRING *string, u16 *dest, u32 n);
void CopyU16ArrayToString(STRING *string, const u16 *src);
void CopyU16ArrayToStringN(STRING *string, const u16 *src, u32 n);
int StringCompare(STRING *a, STRING *b);
void CopyU16StringArray(u16 *dest, const u16 *src);
void StringCopy(STRING *dest, const STRING *src);
void StringSetEmpty(STRING *str);
STRING *StringDup(const STRING *src, HeapID heap_id);
void StrAddChar(STRING *str, u16 _char);
void CopyU16ArrayToString(STRING *dest, const u16 *src);
void CopyU16ArrayToStringN(STRING *dest, const u16 *src, u32 n);

#endif //POKEHEARTGOLD_STRING_H
