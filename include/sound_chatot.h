#ifndef POKEHEARTGOLD_SOUND_CHATOT_H
#define POKEHEARTGOLD_SOUND_CHATOT_H

typedef struct SOUND_CHATOT SOUND_CHATOT;

void ChatotSoundMain(void);
extern void PlayCryEx(u32, u16, u32, u32, u32, u8);
BOOL sub_02006F30(int);
void sub_02006E3C(int);
void sub_02006E4C(SOUND_CHATOT *, int, int, int);
void sub_02006920(int, u16, int, int, int, u8, u8);
void sub_02006EA0(SOUND_CHATOT *, int, int, int, u8);
void PlayCry(u16 species, u8 forme);

#endif //POKEHEARTGOLD_SOUND_CHATOT_H
