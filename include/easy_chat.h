#ifndef POKEHEARTGOLD_EASY_CHAT_H
#define POKEHEARTGOLD_EASY_CHAT_H

#include "pm_string.h"

u16 GetECWordIndexByPair(u16 msgBank, u16 word);
u16 sub_02015DC8(int group);
void GetECWordIntoStringByIndex(u32 ecWord, STRING *dest);

#endif //POKEHEARTGOLD_EASY_CHAT_H
