#ifndef POKEHEARTGOLD_ASCII_UTIL_H
#define POKEHEARTGOLD_ASCII_UTIL_H

int Ascii_StrLen(const char *s);
const char *Ascii_GetDelim(const char *s, char *d, int c);
int Ascii_StrToL(const char *s);
void sub_02020B3C(NNSG3dResName *resName, const char *input);
BOOL sub_02020B78(u16 c);

#endif //POKEHEARTGOLD_ASCII_UTIL_H
