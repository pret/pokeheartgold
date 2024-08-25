#ifndef POKEHEARTGOLD_FIELD_HEADBUTT_H
#define POKEHEARTGOLD_FIELD_HEADBUTT_H

#include "global.h"

typedef struct HeadbuttSlot {
    u16 species;
    u8 minLevel;
    u8 maxLevel;
} HeadbuttSlot;

typedef struct HeadbuttEncounterData {
    u16 numRegularTrees;
    u16 numSecretTrees;
    HeadbuttSlot common[6];
    HeadbuttSlot rare[6];
    HeadbuttSlot secret[6];
    s16 treeCoords[][2];
} HeadbuttEncounterData;

#endif // POKEHEARTGOLD_FIELD_HEADBUTT_H
