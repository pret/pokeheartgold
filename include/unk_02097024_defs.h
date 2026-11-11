#ifndef POKEHEARTGOLD_UNK_02097024_DEFS_H
#define POKEHEARTGOLD_UNK_02097024_DEFS_H

#include "field_system.h"
#include "game_stats.h"
#include "party_menu.h"
#include "unk_02088288.h"

typedef struct UnkStruct_02096C88 UnkStruct_02096C88;

typedef struct UnkStruct_0209707C_Sub8 {
    u8 filler_00[4];                   // 00
    int textFrame;                     // 04
    SaveData *saveData;                // 08
    struct UnkStruct_0205AC88 *unk_0C; // 0C
    Options *options;                  // 10
    GameStats *gameStats;              // 14
    FieldSystem *fieldSystem;          // 18
} UnkStruct_0209707C_Sub8;             // size: 0x1C

typedef struct UnkStruct_02097024 {
    int unk_00;
    int unk_04;
    u8 filler_08[0x8];
    BOOL unk_10;
    UnkStruct_0209707C_Sub8 unk_14;
    UnkStruct_02096C88 *unk_30;
    u8 filler_34[0x8];
} UnkStruct_02097024; // size: 0x3C

typedef struct UnkStruct_0209707C {
    int state;                       // 00
    int partySlot;                   // 04
    UnkStruct_0209707C_Sub8 unk_08;  // 08
    UnkStruct_02097024 *unk_24;      // 24
    FieldSystem *fieldSystem;        // 28
    PartyMenuArgs *partyMenuArgs;    // 2C
    PokemonSummaryArgs *summaryArgs; // 30
} UnkStruct_0209707C;

#endif // POKEHEARTGOLD_UNK_02097024_DEFS_H
