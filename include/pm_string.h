#ifndef POKEHEARTGOLD_STRING_H
#define POKEHEARTGOLD_STRING_H

#include "constants/charcode.h"

#include "heap.h"
#include "string_util.h"

typedef struct String {
    u16 maxsize;
    u16 size;
    u32 magic;
    u16 data[0];
} String;

String *String_New(u32 maxsize, HeapID heapId);
void String_Delete(String *string);
void CopyStringToU16Array(const String *string, u16 *dest, u32 n);
void CopyU16ArrayToString(String *string, const u16 *src);
void CopyU16ArrayToStringN(String *string, const u16 *src, u32 n);
int String_Compare(String *a, String *b);
void String_Copy(String *dest, const String *src);
void String_SetEmpty(String *str);
String *String_Dup(const String *src, HeapID heapId);
void String_AddChar(String *str, u16 _char);
void CopyU16ArrayToString(String *dest, const u16 *src);
void CopyU16ArrayToStringN(String *dest, const u16 *src, u32 n);
u16 *String_cstr(String *string);
void String16_FormatInteger(String *str, int num, u32 ndigits, PrintingMode strConvMode, BOOL whichCharset);
void String_UpperCharN(String *str, int n);
void String_Cat_HandleTrainerName(String *dest, String *src);
void String16_FormatUnsignedLongLong(String *str, u64 num, u32 ndigits, PrintingMode strConvMode, BOOL whichCharset);
s64 String_atoi(String *str, BOOL *flag);
u16 String_GetLength(String *str);
int String_CountLines(volatile String *str);
void String_GetLineN(String *dest, volatile String *src, u32 n);
void String_RadioAddStatic(String *string, u8 level);
u16 *String_cstr(String *str);
void String_Cat(String *dest, String *src);
BOOL String_IsTrainerName(String *string);

#endif // POKEHEARTGOLD_STRING_H
