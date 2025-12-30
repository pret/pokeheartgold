#ifndef POKEHEARTGOLD_STRING_H
#define POKEHEARTGOLD_STRING_H

#include "constants/charcode.h"

#include "heap.h"
#include "string_util.h"

typedef struct String {
    u16 maxSize;
    u16 size;
    u32 magic;
    u16 data[0];
} String;

String *String_New(u32 maxsize, enum HeapID heapID);
void String_Free(String *string);
void String_CopyToChars(const String *string, u16 *dest, u32 n);
void String_CopyFromChars(String *string, const u16 *src);
void String_CopyNumChars(String *string, const u16 *src, u32 n);
int String_Compare(String *a, String *b);
void String_Copy(String *dest, const String *src);
void String_Clear(String *string);
String *String_Clone(const String *src, enum HeapID heapID);
void String_AppendChar(String *string, u16 _char);
void String_CopyFromChars(String *dest, const u16 *src);
void String_CopyNumChars(String *dest, const u16 *src, u32 n);
u16 *String_GetChars(String *string);
void String_FormatInt(String *string, int num, u32 ndigits, PrintingMode strConvMode, BOOL whichCharset);
void String_UpperChar(String *string, int n);
void String_ConcatTrainerName(String *dest, String *src);
void String_FormatU64(String *string, u64 num, u32 ndigits, PrintingMode strConvMode, BOOL whichCharset);
s64 String_AtoI(String *string, BOOL *flag);
u16 String_GetLength(String *string);
int String_CountLines(const String *string);
void String_CopyLine(String *dest, const String *src, u32 n);
void String_AddRadioStatic(String *string, u8 level);
u16 *String_GetChars(String *string);
void String_Concat(String *dest, String *src);
BOOL String_IsTrainerName(String *string);

#endif // POKEHEARTGOLD_STRING_H
