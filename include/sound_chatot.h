#ifndef POKEHEARTGOLD_SOUND_CHATOT_H
#define POKEHEARTGOLD_SOUND_CHATOT_H

#include "global.h"

#include "sav_chatot.h"

BOOL ChatotSoundMain(void);
BOOL Chatot_CheckCry(SOUND_CHATOT *a0);
BOOL sub_02006D04(SOUND_CHATOT *a0, u32 a1, s32 a2, s32 a3);
void sub_02006DB8();
BOOL Chatot_StartRecording(void);
void Chatot_StopRecording();
void Chatot_SaveRecording(SOUND_CHATOT *a0);
void sub_02006E3C(u8 a0);
void sub_02006E4C(SOUND_CHATOT *a0, u32 a1, u32 a2, s32 a3);
BOOL sub_02006EA0(SOUND_CHATOT *a0, u32 a1, u32 a2, s32 a3, u8 a4);
u32 sub_02006EFC(SOUND_CHATOT *chatot);
BOOL sub_02006F30(int a0);

void PlayCry(u16 species, u8 form);
void sub_02006920(int, u16, int, int, int, u8, u8);

#endif // POKEHEARTGOLD_SOUND_CHATOT_H
