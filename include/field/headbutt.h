#ifndef POKEHEARTGOLD_FIELD_HEADBUTT_H
#define POKEHEARTGOLD_FIELD_HEADBUTT_H

#include "global.h"

#define NUM_ENCOUNTERS_HEADBUTT 6

typedef struct HeadbuttSlot {
    u16 species;
    u8 minLevel;
    u8 maxLevel;
} HeadbuttSlot;

typedef struct HeadbuttEncounterData {
    u16 numRegularTrees;
    u16 numSecretTrees;
    HeadbuttSlot common[NUM_ENCOUNTERS_HEADBUTT];
    HeadbuttSlot rare[NUM_ENCOUNTERS_HEADBUTT];
    HeadbuttSlot secret[NUM_ENCOUNTERS_HEADBUTT];
    s16 treeCoords[][2];
} HeadbuttEncounterData;

#endif // POKEHEARTGOLD_FIELD_HEADBUTT_H
