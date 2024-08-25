#ifndef POKEHEARTGOLD_ASCII_UTIL_H
#define POKEHEARTGOLD_ASCII_UTIL_H

#include <nnsys.h>

s32 Ascii_StrLen(const s8 *str);
const s8 *Ascii_GetDelim(const s8 *src, s8 *dst, s32 c);
s32 Ascii_StrToL(const s8 *str);
void sub_02020B3C(NNSG3dResName *resName, const s8 *input);
BOOL sub_02020B78(u16 c);

#endif // POKEHEARTGOLD_ASCII_UTIL_H
