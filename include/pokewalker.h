#ifndef POKEHEARTGOLD_POKEWALKER_H
#define POKEHEARTGOLD_POKEWALKER_H

#include "constants/pokewalker_courses.h"

#include "pokemon.h"
#include "save.h"

typedef struct POKEWALKER {
    u16 unk_000;
    u16 unk_002;
    BoxPokemon pokemon;
    u8 filler_08C[0x6C];
    u16 unk_0F8;
    u16 unk_0FA;
    u32 unk_0FC[10];
    u16 unk_124;
    u8 filler_126[2];
    u32 unk_128;
    u32 unk_12C;
    u32 unlockedCourses;
} POKEWALKER; // size=0x134

void Pokewalker_UnlockCourse(POKEWALKER *pokeWalker, int courseNo);
POKEWALKER *Save_Pokewalker_Get(SaveData *saveData);
u32 Pokewalker_sizeof(void);
void Pokewalker_Init(POKEWALKER *pokeWalker);
void sub_02032624(POKEWALKER *pokeWalker);
u16 sub_0203263C(const POKEWALKER *pokeWalker);
void sub_02032644(POKEWALKER *pokeWalker);
void sub_02032650(POKEWALKER *pokeWalker, u32 a1, u32 a2);
void sub_02032674(POKEWALKER *pokeWalker, u32 *a1, u32 *a2);
void sub_02032688(POKEWALKER *pokeWalker, u16 *a1, u16 *a2);
void sub_020326A4(POKEWALKER *pokeWalker, u16 a1, u16 a2);
void Pokewalker_SetBoxMon(POKEWALKER *pokeWalker, BoxPokemon *boxMon);
void Pokewalker_ClearBoxMon(POKEWALKER *pokeWalker);
BOOL Pokewalker_TryGetBoxMon(POKEWALKER *pokeWalker, BoxPokemon *boxMon);
u16 sub_02032718(POKEWALKER *pokeWalker);
void sub_02032720(POKEWALKER *pokeWalker, u16 a1);
void *sub_02032728(POKEWALKER *pokeWalker);
BOOL Pokewalker_CourseIsUnlocked(POKEWALKER *pokeWalker, int courseNo);
u16 sub_02032764(POKEWALKER *pokeWalker);
void sub_0203276C(POKEWALKER *pokeWalker);

#endif // POKEHEARTGOLD_POKEWALKER_H
