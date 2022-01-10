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

STRING *String_ctor(u32 maxsize, HeapID heapId);
void String_dtor(STRING *string);
void CopyStringToU16Array(const STRING *string, u16 *dest, u32 n);
void CopyU16ArrayToString(STRING *string, const u16 *src);
void CopyU16ArrayToStringN(STRING *string, const u16 *src, u32 n);
int StringCompare(STRING *a, STRING *b);
void StringCopy(STRING *dest, const STRING *src);
void StringSetEmpty(STRING *str);
STRING *StringDup(const STRING *src, HeapID heap_id);
void StrAddChar(STRING *str, u16 _char);
void CopyU16ArrayToString(STRING *dest, const u16 *src);
void CopyU16ArrayToStringN(STRING *dest, const u16 *src, u32 n);
u16 *String_c_str(STRING *string);
void String16_FormatInteger(STRING * str, int num, u32 ndigits, STRCONVMODE strConvMode, BOOL whichCharset);
void StrUpperCharN(STRING * str, int n);
void StringCat_HandleTrainerName(STRING * dest, STRING * src);
void String16_FormatUnsignedLongLong(STRING * str, u64 num, u32 ndigits, STRCONVMODE strConvMode, BOOL whichCharset);
s64 String_atoi(STRING * str, BOOL * flag);
u16 StringGetLength(STRING * str);
int StringCountLines(volatile STRING * str);
void StringGetLineN(STRING * dest, volatile STRING * src, u32 n);
void String_RadioAddStatic(STRING *string, u8 level);
u16 * String_c_str(STRING * str);
void StringCat(STRING * dest, STRING * src);
BOOL String_IsTrainerName(STRING * string);

#endif //POKEHEARTGOLD_STRING_H
