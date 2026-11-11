#ifndef POKEHEARTGOLD_UNK_02097024_H
#define POKEHEARTGOLD_UNK_02097024_H

#include "field_system.h"
#include "game_stats.h"

typedef struct UnkStruct_0209707C_Sub8 {
    u8 filler_00[0x4];                 // 00
    int textFrame;                     // 04
    SaveData *saveData;                // 08
    struct UnkStruct_0205AC88 *unk_14; // 0C
    Options *options;                  // 10
    GameStats *gameStats;              // 14
    FieldSystem *fieldSystem;          // 18
} UnkStruct_0209707C_Sub8;             // size: 0x1C

typedef struct UnkStruct_02097024 UnkStruct_02097024; // size: 0x3C

typedef struct UnkStruct_0209707C {
    int unk_00;                     // 00
    u8 filler_04[0x4];              // 04
    UnkStruct_0209707C_Sub8 unk_08; // 08
    UnkStruct_02097024 *unk_24;     // 24
    FieldSystem *fieldSystem2;      // 28
    u8 filler_2C[0x8];              // 2C
} UnkStruct_0209707C;

UnkStruct_0209707C *sub_0209707C(FieldSystem *fieldSystem);
BOOL sub_020970C0(UnkStruct_0209707C *);

#endif // POKEHEARTGOLD_UNK_02097024_H
