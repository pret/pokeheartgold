#ifndef POKEHEARTGOLD_STRING_H
#define POKEHEARTGOLD_STRING_H

#include "constants/charcode.h"
#include "heap.h"
#include "string_util.h"

typedef struct Strbuf {
    u16 maxsize;
    u16 size;
    u32 magic;
    u16 data[0];
} Strbuf;

Strbuf *String_New(u32 maxsize, HeapID heapId);
void String_Delete(Strbuf *string);
void CopyStringToU16Array(const Strbuf *string, u16 *dest, u32 n);
void CopyU16ArrayToString(Strbuf *string, const u16 *src);
void CopyU16ArrayToStringN(Strbuf *string, const u16 *src, u32 n);
int String_Compare(Strbuf *a, Strbuf *b);
void String_Copy(Strbuf *dest, const Strbuf *src);
void String_SetEmpty(Strbuf *str);
Strbuf *String_Dup(const Strbuf *src, HeapID heapId);
void String_AddChar(Strbuf *str, u16 _char);
void CopyU16ArrayToString(Strbuf *dest, const u16 *src);
void CopyU16ArrayToStringN(Strbuf *dest, const u16 *src, u32 n);
u16 *String_cstr(Strbuf *string);
void String16_FormatInteger(Strbuf * str, int num, u32 ndigits, PrintingMode strConvMode, BOOL whichCharset);
void String_UpperCharN(Strbuf * str, int n);
void String_Cat_HandleTrainerName(Strbuf * dest, Strbuf * src);
void String16_FormatUnsignedLongLong(Strbuf * str, u64 num, u32 ndigits, PrintingMode strConvMode, BOOL whichCharset);
s64 String_atoi(Strbuf * str, BOOL * flag);
u16 String_GetLength(Strbuf * str);
int String_CountLines(volatile Strbuf * str);
void String_GetLineN(Strbuf * dest, volatile Strbuf * src, u32 n);
void String_RadioAddStatic(Strbuf *string, u8 level);
u16 * String_cstr(Strbuf * str);
void String_Cat(Strbuf * dest, Strbuf * src);
BOOL String_IsTrainerName(Strbuf * string);

#endif //POKEHEARTGOLD_STRING_H
