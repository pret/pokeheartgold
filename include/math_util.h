#ifndef POKEHEARTGOLD_MATH_UTIL_H
#define POKEHEARTGOLD_MATH_UTIL_H

u16 LCRandom(void);
void _MonEncryptSegment(u16 *data, u32 size, u32 seed);
void _MonDecryptSegment(u16 *data, u32 size, u32 seed);

#endif //POKEHEARTGOLD_MATH_UTIL_H
