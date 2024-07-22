#ifndef POKEHEARTGOLD_REGISTER_HALL_OF_FAME_H
#define POKEHEARTGOLD_REGISTER_HALL_OF_FAME_H

#include "igt.h"
#include "overlay_manager.h"
#include "party.h"
#include "player_data.h"

typedef struct RegisterHallOfFameArgs {
    PlayerProfile *profile;
    Party *party;
    IGT *igt;
} RegisterHallOfFameArgs;

BOOL RegisterHallOfFame_Init(OVY_MANAGER *man, int *state);
BOOL RegisterHallOfFame_Main(OVY_MANAGER *man, int *state);
BOOL RegisterHallOfFame_Exit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_REGISTER_HALL_OF_FAME_H
