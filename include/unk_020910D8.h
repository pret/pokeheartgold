#ifndef POKEHEARTGOLD_UNK_020910D8_H
#define POKEHEARTGOLD_UNK_020910D8_H

#include "options.h"
#include "player_data.h"
#include "pokemon.h"
#include "task.h"

typedef struct Unk02091240 {
    Pokemon *unk0;
    Options *unk4;
    PlayerProfile *unk8;
    u16 unkC;
} Unk02091240;

void sub_02091240(TaskManager *taskman, Unk02091240 *a1);

#endif //POKEHEARTGOLD_UNK_020910D8_H
