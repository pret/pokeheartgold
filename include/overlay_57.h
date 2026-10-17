#ifndef POKEHEARTGOLD_OVERLAY_57_H
#define POKEHEARTGOLD_OVERLAY_57_H

#include "global.h"

#include "options.h"
#include "overlay_manager.h"
#include "pokemon_types_def.h"

typedef struct UnkStruct_0206B984 {
    u32 partyCount;
    Pokemon *mons[PARTY_SIZE];
    Party *party;
    SealCase *sealCase;
    Options *options;
    SaveData *saveData;
    void *menuInputStatePtr;
    u8 unk30;
    u8 unk31;
} UnkStruct_0206B984;

int ov57_022378DC(OverlayManager *manager, int *state);
int ov57_02237AF8(OverlayManager *manager, int *state);
int ov57_02237B20(OverlayManager *manager, int *state);

#endif // POKEHEARTGOLD_OVERLAY_57_H
