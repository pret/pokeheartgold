#ifndef POKEHEARTGOLD_STRING_H
#define POKEHEARTGOLD_STRING_H

#include "constants/charcode.h"

#include "heap.h"
#include "string_util.h"

typedef struct String {
    u16 maxSize;
    u16 size;
    u32 integrity;
    u16 data[0];
} String;

enum CharsetMode {
    CHARSET_MODE_JP,
    CHARSET_MODE_EN,
};

String *String_New(u32 maxSize, enum HeapID heapID);
void String_Free(String *string);
void String_CopyToChars(String *src, u16 *dest, u32 destSize);
BOOL String_Compare(String *a, String *b);
void String_Copy(String *dest, String *src);
void String_Clear(String *string);
String *String_Clone(String *src, enum HeapID heapID);
void String_AppendChar(String *string, u16 c);
void String_CopyFromChars(String *dest, const u16 *src);
void String_CopyNumChars(String *dest, const u16 *src, u32 num);
u16 *String_GetChars(String *string);
void String_FormatInt(String *string, int num, u32 maxDigits, enum PaddingMode paddingMode, enum CharsetMode charsetMode);
void String_UpperChar(String *string, int index);
void String_ConcatTrainerName(String *dest, String *src);
void String_FormatU64(String *string, u64 num, u32 maxDigits, enum PaddingMode paddingMode, enum CharsetMode charsetMode);
s64 String_AtoI(String *string, BOOL *success);
u16 String_GetLength(String *string);
int String_CountLines(const String *string);
void String_CopyLine(String *dest, const String *src, u32 lineNum);
void String_AddRadioStatic(String *string, u8 level);
u16 *String_GetChars(String *string);
void String_Concat(String *dest, String *src);
BOOL String_IsTrainerName(String *string);

#endif // POKEHEARTGOLD_STRING_H
