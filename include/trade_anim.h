#ifndef POKEHEARTGOLD_TRADE_ANIM_H
#define POKEHEARTGOLD_TRADE_ANIM_H

#include "player_data.h"
#include "pokemon_types_def.h"

typedef struct TRADE_ANIM_WORK {
    BoxPokemon *my_boxmon;
    BoxPokemon *trade_boxmon;
    PlayerProfile *trade_profile;
    int time_of_day;
    int is_ingame;
    Options *options;
} TRADE_ANIM_WORK;

#endif // POKEHEARTGOLD_TRADE_ANIM_H
