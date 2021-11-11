#ifndef POKEHEARTGOLD_POKEWALKER_H
#define POKEHEARTGOLD_POKEWALKER_H

#include "save.h"
#include "pokemon.h"
#include "constants/pokewalker_courses.h"

typedef struct POKEWALKER {
    u16 unk_000;
    u16 unk_002;
    BOXMON pokemon;
    u8 filler_08C[0x6C];
    u16 unk_0F8;
    u16 unk_0FA;
    u8 unk_0FC[0x28];
    u16 unk_124;
    u8 filler_126[2];
    u32 unk_128;
    u32 unk_12C;
    u32 unlockedCourses;
} POKEWALKER; // size=0x134

void Pokewalker_UnlockCourse(POKEWALKER *pokeWalker, int courseNo);

#endif //POKEHEARTGOLD_POKEWALKER_H
