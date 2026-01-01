#ifndef POKEHEARTGOLD_STRING_UTIL_H
#define POKEHEARTGOLD_STRING_UTIL_H

#include "global.h"

enum PaddingMode {
    PADDING_MODE_NONE,
    PADDING_MODE_SPACES,
    PADDING_MODE_ZEROES,
};

u16 *CopyU16StringArray(u16 *dest, const u16 *src);
BOOL StringNotEqual(const u16 *a, const u16 *b);
u16 *StringFill(u16 *str, u16 val, u32 n);
u16 *StringFillEOS(u16 *s, u32 n);
u16 *ConvertUIntToDecimalString(u16 *dest, u32 num, enum PaddingMode paddingMode, u32 ndigits);
u16 *CopyU16StringArrayN(u16 *dest, const u16 *src, u32 n);
int StringLength(const u16 *str);
BOOL StringNotEqualN(const u16 *a, const u16 *b, u32 n);

#endif // POKEHEARTGOLD_STRING_UTIL_H
