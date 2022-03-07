#ifndef POKEHEARTGOLD_GAME_STATS_H
#define POKEHEARTGOLD_GAME_STATS_H

#include "save.h"

typedef struct GAME_STATS GAME_STATS;

u32 Sav2_GameStats_sizeof(void);
void Sav2_GameStats_init(GAME_STATS *gameStats);
GAME_STATS *Sav2_GameStats_get(SAVEDATA *saveData);
void GameStats_Inc(GAME_STATS *gameStats, int which);

#endif //POKEHEARTGOLD_GAME_STATS_H
