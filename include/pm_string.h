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

STRING *String_New(u32 maxsize, HeapID heapId);
void String_Delete(STRING *string);
void CopyStringToU16Array(const STRING *string, u16 *dest, u32 n);
void CopyU16ArrayToString(STRING *string, const u16 *src);
void CopyU16ArrayToStringN(STRING *string, const u16 *src, u32 n);
int String_Compare(STRING *a, STRING *b);
void String_Copy(STRING *dest, const STRING *src);
void String_SetEmpty(STRING *str);
STRING *String_Dup(const STRING *src, HeapID heap_id);
void String_AddChar(STRING *str, u16 _char);
void CopyU16ArrayToString(STRING *dest, const u16 *src);
void CopyU16ArrayToStringN(STRING *dest, const u16 *src, u32 n);
u16 *String_C_Str(STRING *string);
void String16_FormatInteger(STRING * str, int num, u32 ndigits, STRCONVMODE strConvMode, BOOL whichCharset);
void String_UpperCharN(STRING * str, int n);
void String_Cat_HandleTrainerName(STRING * dest, STRING * src);
void String16_FormatUnsignedLongLong(STRING * str, u64 num, u32 ndigits, STRCONVMODE strConvMode, BOOL whichCharset);
s64 String_Atoi(STRING * str, BOOL * flag);
u16 String_GetLength(STRING * str);
int String_CountLines(volatile STRING * str);
void String_GetLineN(STRING * dest, volatile STRING * src, u32 n);
void String_RadioAddStatic(STRING *string, u8 level);
u16 * String_C_Str(STRING * str);
void String_Cat(STRING * dest, STRING * src);
BOOL String_IsTrainerName(STRING * string);

#endif //POKEHEARTGOLD_STRING_H
