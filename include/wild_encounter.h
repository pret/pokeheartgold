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

typedef struct EncounterSlot {
    u32 species;
    u16 maxLevel;
    u16 minLevel;
} EncounterSlot;

typedef struct LandEncounterData {
    u8 levels[NUM_ENCOUNTERS_LAND]; // shared between times of day
    u16 species_morn[NUM_ENCOUNTERS_LAND];
    u16 species_day[NUM_ENCOUNTERS_LAND];
    u16 species_nite[NUM_ENCOUNTERS_LAND];
} LandEncounterData;

typedef struct EncounterDataSlot {
    u8 level_min;
    u8 level_max;
    u16 species;
} EncounterDataSlot;

typedef struct EncounterData {
    u8 encounterRate_walking;                                   // 0x00
    u8 encounterRate_surfing;                                   // 0x01
    u8 encounterRate_rockSmash;                                 // 0x02
    u8 encounterRate_oldRod;                                    // 0x03
    u8 encounterRate_goodRod;                                   // 0x04
    u8 encounterRate_superRod;                                  // 0x05
    u8 dummy[2];                                                // 0x06
    LandEncounterData landSlots;                                // 0x08
    u16 hoennSoundsSpecies[NUM_ENCOUNTERS_SOUNDS];              // 0x5C
    u16 sinnohSoundsSpecies[NUM_ENCOUNTERS_SOUNDS];             // 0x60
    EncounterDataSlot surfSlots[NUM_ENCOUNTERS_SURF];           // 0x64
    EncounterDataSlot rockSmashSlots[NUM_ENCOUNTERS_ROCKSMASH]; // 0x78
    EncounterDataSlot oldRodSlots[NUM_ENCOUNTERS_FISH];         // 0x80
    EncounterDataSlot goodRodSlots[NUM_ENCOUNTERS_FISH];        // 0x94
    EncounterDataSlot superRodSlots[NUM_ENCOUNTERS_FISH];       // 0xA8
    u16 landSwarm;                                              // 0xBC
    u16 surfSwarm;                                              // 0xBE
    u16 nightFish;                                              // 0xC0
    u16 fishSwarm;                                              // 0xC2
} EncounterData;                                                // size=0xC4

#ifdef __cplusplus
};
#endif

#endif // POKEHEARTGOLD_WILD_ENCOUNTER_H
