#ifndef POKEHEARTGOLD_ROAMER_H
#define POKEHEARTGOLD_ROAMER_H

#include "constants/roamer.h"
#include "save.h"

enum {
    ROAMER_DATA_UNK1        = 1,
    ROAMER_DATA_IVS         = 2,
    ROAMER_DATA_PERSONALITY = 3,
    ROAMER_DATA_SPECIES     = 4,
    ROAMER_DATA_HP          = 5,
    ROAMER_DATA_LEVEL       = 6,
    ROAMER_DATA_STATUS      = 7,
    ROAMER_DATA_UNK8        = 8,
};

typedef struct ROAMER {
    u32 unk_0;
    u32 ivs;
    u32 personality;
    u16 species;
    u16 hp;
    u8 level;
    u8 status;
    u8 unk_12;
    u8 dummy;
} ROAMER;

typedef struct ROAMER_SAVE {
    u32 rand[2];
    u32 unk_8[2];
    ROAMER data[ROAMER_MAX];
    u8 unk_60[ROAMER_MAX];
    u8 unk_64;
    u8 unk_65;
    u8 unk_66;
    u8 flutePlayed;
} ROAMER_SAVE;

#endif //POKEHEARTGOLD_ROAMER_H
