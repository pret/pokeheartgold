#ifndef POKEHEARTGOLD_APPLICATION_CAPSULE_MENU_CAPSULE_MENU_H
#define POKEHEARTGOLD_APPLICATION_CAPSULE_MENU_CAPSULE_MENU_H

#include "options.h"
#include "overlay_manager.h"
#include "pokemon_types_def.h"

typedef struct CapsuleAppData {
    int partyCount;
    Pokemon *mons[PARTY_SIZE];
    Party *party;
    SealCase *sealCase;
    Options *options;
    SaveData *saveData;
    void *menuInputStatePtr;
    u8 capsuleIndex;
    u8 action;
} CapsuleAppData;

int CapsuleMenu_Init(OverlayManager *manager, int *state);
int CapsuleMenu_Main(OverlayManager *manager, int *state);
int CapsuleMenu_Exit(OverlayManager *manager, int *state);

u8 CapsuleMenu_GetSealMemberIdx(u32 idx);
u8 CapsuleMenu_GetSealNameIndex(u8 idx);
u8 CapsuleMenu_GetSealParticleIndex(u32 idx);
BOOL CapsuleMenu_IsAlphabetSeal(u32 idx);
u32 CapsuleMenu_GetSealNonAlphabetIndex(u8 idx);

#endif
