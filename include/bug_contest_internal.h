#ifndef POKEHEARTGOLD_BUG_CONTEST_INTERNAL_H
#define POKEHEARTGOLD_BUG_CONTEST_INTERNAL_H

#include "heap.h"
#include "party.h"
#include "pokemon.h"

typedef struct BUGMON {
    u16 species;
    u8 lvlmin;
    u8 lvlmax;
    u8 rate;
    u8 score;
    u8 dummy[2];
} BUGMON;

#define BUGMON_COUNT 10

typedef struct BugContestantData {
    u8 national;
    u8 day;
    u16 species;
    u16 score;
    u16 randmod;
} BugContestantData;

typedef struct BugContestant {
    u8 id;
    u16 score;
    BugContestantData data;
} BugContestant;

#define BUGCONTESTANT_NPC_COUNT 5
#define BUGCONTESTANT_PLAYER    BUGCONTESTANT_NPC_COUNT
#define BUGCONTESTANT_COUNT     (BUGCONTESTANT_NPC_COUNT + 1)

typedef struct BugContest {
    HeapID heapId;                                  // Always set to 3
    SaveData *saveData;                             // Pointer to save data
    Party *party_bak;                               // Player's party is held for the contest
    Party *party_cur;                               // Only the lead Pokemon
    Pokemon *mon;                                   // The Pokemon you caught in the contest
    u8 lead_mon_idx;                                // Slot number of the Pokemon you battled with
    u8 party_cur_num;                               // Size of the party pre-contest
    u8 day_of_week;                                 // Used to choose NPCs and encounters
    u8 caught_poke : 1;                             // If you've caught a Pokemon in the contest
    u8 national_dex : 1;                            // Used to choose NPCs and encounters
    u8 placement : 6;                               // 0: First, 1: Second, 2: Third, 3: Consolation
    u16 sport_balls;                                // Set to 20, decremented on use
    u16 prize;                                      // Item ID
    u32 elapsed_time;                               // Used to determine when the contest ends
    BUGMON encounters[BUGMON_COUNT];                // Which wild Pokemon you can find
    BugContestant contestants[BUGCONTESTANT_COUNT]; // 5 NPCs + player
    u8 ranking[BUGCONTESTANT_COUNT];                // Index sorting by score at the end
} BugContest;

#endif // POKEHEARTGOLD_BUG_CONTEST_INTERNAL_H
