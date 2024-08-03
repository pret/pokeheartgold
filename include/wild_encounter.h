#ifndef POKEHEARTGOLD_WILD_ENCOUNTER_H
#define POKEHEARTGOLD_WILD_ENCOUNTER_H

#ifdef __cplusplus
extern "C" {
#endif

typedef struct ENC_SLOT {
    u32 species;
    u16 level_min;
    u16 level_max;
} ENC_SLOT;

typedef struct ENC_DATA_LAND {
    u8 levels[12]; // shared between times of day
    u16 species_morn[12];
    u16 species_day[12];
    u16 species_nite[12];
} ENC_DATA_LAND;

typedef struct ENC_DATA_SLOT {
    u8 level_min;
    u8 level_max;
    u16 species;
} ENC_DATA_SLOT;

typedef struct ENC_DATA {
    /* 0x00 */ u8 encounterRate_walking;
    /* 0x01 */ u8 encounterRate_surfing;
    /* 0x02 */ u8 encounterRate_rockSmash;
    /* 0x03 */ u8 encounterRate_oldRod;
    /* 0x04 */ u8 encounterRate_goodRod;
    /* 0x05 */ u8 encounterRate_superRod;
    u8 dummy[2];
    /* 0x08 */ ENC_DATA_LAND landSlots;
    /* 0x5C */ u16 hoennSoundsSpecies[2];
    /* 0x60 */ u16 sinnohSoundsSpecies[2];
    /* 0x64 */ ENC_DATA_SLOT surfSlots[5];
    /* 0x78 */ ENC_DATA_SLOT rockSmashSlots[2];
    /* 0x80 */ ENC_DATA_SLOT oldRodSlots[5];
    /* 0x94 */ ENC_DATA_SLOT goodRodSlots[5];
    /* 0xA8 */ ENC_DATA_SLOT superRodSlots[5];
    /* 0xBC */ u16 swarmSpecies[4];
} ENC_DATA; // size=0xC4

#ifdef __cplusplus
};
#endif

#endif // POKEHEARTGOLD_WILD_ENCOUNTER_H
