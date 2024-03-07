#ifndef POKEHEARTGOLD_HEADBUTT_ENCOUNTER_H
#define POKEHEARTGOLD_HEADBUTT_ENCOUNTER_H

typedef struct HeadbuttSlot {
    u16 species;
    u8 minLevel;
    u8 maxLevel;
} HeadbuttSlot;

typedef struct HeadbuttEncounterData {
    u16 numUncommon;
    u16 numRare;
    HeadbuttSlot common[6];
    HeadbuttSlot uncommon[6];
    HeadbuttSlot rare[6];
    s16 treeCoords[][2];
} HeadbuttEncounterData;

#endif //POKEHEARTGOLD_HEADBUTT_ENCOUNTER_H
