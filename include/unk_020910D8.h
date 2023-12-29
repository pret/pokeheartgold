#ifndef POKEHEARTGOLD_UNK_020910D8_H
#define POKEHEARTGOLD_UNK_020910D8_H

#include "options.h"
#include "player_data.h"
#include "pokemon.h"
#include "task.h"

typedef struct Unk02091240 {
    Pokemon *mon;
    Options *options;
    PlayerProfile *profile;
    u16 unkC;
} Unk02091240;

void Task_HatchEggInParty(TaskManager *taskman, Unk02091240 *a1);

#endif //POKEHEARTGOLD_UNK_020910D8_H
