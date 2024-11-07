#ifndef POKEHEARTGOLD_HATCH_EGG_TASK_H
#define POKEHEARTGOLD_HATCH_EGG_TASK_H

#include "options.h"
#include "player_data.h"
#include "pokemon.h"
#include "task.h"

typedef struct UnkStruct_02091240 {
    Pokemon *mon;
    Options *options;
    PlayerProfile *profile;
    u16 unkC;
} UnkStruct_02091240;

void CallTask_HatchEggInParty(TaskManager *taskman, UnkStruct_02091240 *a1);

#endif // POKEHEARTGOLD_HATCH_EGG_TASK_H
