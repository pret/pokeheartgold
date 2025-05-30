#ifndef POKEHEARTGOLD_WILD_ENCOUNTER_H
#define POKEHEARTGOLD_WILD_ENCOUNTER_H

#ifdef __cplusplus
extern "C" {
#endif

#include <nitro.h>

#define NUM_ENCOUNTERS_LAND      12
#define NUM_ENCOUNTERS_SOUNDS    2
#define NUM_ENCOUNTERS_SURF      5
#define NUM_ENCOUNTERS_ROCKSMASH 2
#define NUM_ENCOUNTERS_FISH      5
#define NUM_ENCOUNTERS_SWARM     4

typedef struct ENC_SLOT {
    u32 species;
    u16 level_min;
    u16 level_max;
} ENC_SLOT;

typedef struct ENC_DATA_LAND {
    u8 levels[NUM_ENCOUNTERS_LAND]; // shared between times of day
    u16 species_morn[NUM_ENCOUNTERS_LAND];
    u16 species_day[NUM_ENCOUNTERS_LAND];
    u16 species_nite[NUM_ENCOUNTERS_LAND];
} ENC_DATA_LAND;

typedef struct ENC_DATA_SLOT {
    u8 level_min;
    u8 level_max;
    u16 species;
} ENC_DATA_SLOT;

typedef struct ENC_DATA {
    u8 encounterRate_walking;                               // 0x00
    u8 encounterRate_surfing;                               // 0x01
    u8 encounterRate_rockSmash;                             // 0x02
    u8 encounterRate_oldRod;                                // 0x03
    u8 encounterRate_goodRod;                               // 0x04
    u8 encounterRate_superRod;                              // 0x05
    u8 dummy[2];                                            // 0x06
    ENC_DATA_LAND landSlots;                                // 0x08
    u16 hoennSoundsSpecies[NUM_ENCOUNTERS_SOUNDS];          // 0x5C
    u16 sinnohSoundsSpecies[NUM_ENCOUNTERS_SOUNDS];         // 0x60
    ENC_DATA_SLOT surfSlots[NUM_ENCOUNTERS_SURF];           // 0x64
    ENC_DATA_SLOT rockSmashSlots[NUM_ENCOUNTERS_ROCKSMASH]; // 0x78
    ENC_DATA_SLOT oldRodSlots[NUM_ENCOUNTERS_FISH];         // 0x80
    ENC_DATA_SLOT goodRodSlots[NUM_ENCOUNTERS_FISH];        // 0x94
    ENC_DATA_SLOT superRodSlots[NUM_ENCOUNTERS_FISH];       // 0xA8
    u16 swarmSpecies[NUM_ENCOUNTERS_SWARM];                 // 0xBC
} ENC_DATA;                                                 // size=0xC4

#ifdef __cplusplus
};
#endif

#endif // POKEHEARTGOLD_WILD_ENCOUNTER_H
