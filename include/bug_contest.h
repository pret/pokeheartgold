#ifndef POKEHEARTGOLD_BUG_CONTEST_H
#define POKEHEARTGOLD_BUG_CONTEST_H

#include "heap.h"
#include "party.h"

typedef struct BUGMON {
    u16 species;
    u8 lvlmin;
    u8 lvlmax;
    u8 unk_4[4];
} BUGMON;

#define BUGMON_COUNT        10

typedef struct BUGCONTESTANT {
    u8 filler_00[0xC];
} BUGCONTESTANT;

typedef struct BUGCONTEST {
    HeapID heapId;
    SAVEDATA *saveData;
    PARTY *party_bak;
    PARTY *party_cur;
    POKEMON *pokemon;
    u8 lead_mon_idx;
    u8 party_cur_num;
    u8 day_of_week;
    u8 caught_poke:1;
    u8 national_dex:1;
    u8 placement:6;
    u16 unk_18;
    u16 prize;
    u32 minutes;
    BUGMON encounters[BUGMON_COUNT];
    BUGCONTESTANT contestants[6];
    u8 filler_B8[8];
} BUGCONTEST;

#endif //POKEHEARTGOLD_BUG_CONTEST_H
