#ifndef POKEHEARTGOLD_UNK_02005D10_H
#define POKEHEARTGOLD_UNK_02005D10_H

#include "constants/sndseq.h"

void PlaySE(u16 sndseq);
void StopBGM(u16 sndseq, int a1);
void sub_0200615C(int, int);
BOOL IsCryFinished(void);
void sub_02006300(int);
void PlaySE_SetPitch(int, int);
BOOL IsSEPlaying(u16 sndseq);
void sub_0200616C(int a0);

#endif //POKEHEARTGOLD_UNK_02005D10_H
