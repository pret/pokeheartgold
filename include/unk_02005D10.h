#ifndef POKEHEARTGOLD_UNK_02005D10_H
#define POKEHEARTGOLD_UNK_02005D10_H

#include "constants/sndseq.h"

void PlaySE(u16 sndseq);
void sub_0200615C(int, int);
BOOL IsCryFinished(void);
void sub_02006300(int);
void PlaySE_SetPitch(int, int);
BOOL IsSEPlaying(u16 sndseq);
u16 sub_02005F94(u16 a0);
void StopBGM(u16 a0, int a1);
void sub_02005E44(u16 a0);
void StopSE(u16 sndseq, int a1);
void PlayFanfare(u16 a0);
BOOL IsFanfarePlaying(void);

#endif //POKEHEARTGOLD_UNK_02005D10_H
