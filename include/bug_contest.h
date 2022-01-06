#ifndef POKEHEARTGOLD_BUG_CONTEST_H
#define POKEHEARTGOLD_BUG_CONTEST_H

#include "heap.h"
#include "party.h"

typedef struct BUGMON {
    u16 species;
    u8 lvlmin;
    u8 lvlmax;
    u8 rate;
    u8 unk_5[3];
} BUGMON;

#define BUGMON_COUNT        10

typedef struct BUGCONTESTANT_BIN {
    u8 national;
    u8 day;
    u16 species;
    u16 score;
    u16 randmod;
} BUGCONTESTANT_BIN;

typedef struct BUGCONTESTANT {
    u8 id;
    u16 score;
    BUGCONTESTANT_BIN data;
} BUGCONTESTANT;

#define BUGCONTESTANT_PLAYER 5
#define BUGCONTESTANT_COUNT  6

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
    u16 sport_balls;
    u16 prize;
    u32 elapsed_time;
    BUGMON encounters[BUGMON_COUNT];
    BUGCONTESTANT contestants[BUGCONTESTANT_COUNT];
    u8 ranking[BUGCONTESTANT_COUNT];
} BUGCONTEST;

#endif //POKEHEARTGOLD_BUG_CONTEST_H
