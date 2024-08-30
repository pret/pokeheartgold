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
u16 sub_02005F94(u16 a0);
void StopBGM(u16 a0, int a1);
void sub_02005E44(u16 a0);
void StopSE(u16 sndseq, int a1);
void PlayFanfare(u16 a0);
BOOL IsFanfarePlaying(void);
BOOL GF_IsAnySEPlaying();
void Sound_Stop();
void Sound_SetMasterVolume(int volume);
void sub_020062E0(u16 species, u8 a1, u8 form);

#endif // POKEHEARTGOLD_UNK_02005D10_H
