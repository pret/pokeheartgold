#ifndef POKEHEARTGOLD_OVERLAY_63_H
#define POKEHEARTGOLD_OVERLAY_63_H

#include "igt.h"
#include "overlay_manager.h"
#include "party.h"
#include "player_data.h"

typedef struct {
    PlayerProfile *profile;
    Party *party;
    IGT *igt;
} HOFCongratsAppArgs;

BOOL ov63_0221BE20(OVY_MANAGER *man, int *state);
BOOL ov63_0221BF88(OVY_MANAGER *man, int *state);
BOOL ov63_0221BF28(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_OVERLAY_63_H
