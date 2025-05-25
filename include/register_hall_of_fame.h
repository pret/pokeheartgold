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

BOOL RegisterHallOfFame_Init(OverlayManager *man, int *state);
BOOL RegisterHallOfFame_Main(OverlayManager *man, int *state);
BOOL RegisterHallOfFame_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_REGISTER_HALL_OF_FAME_H
