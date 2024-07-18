#ifndef POKEHEARTGOLD_GAME_STATS_H
#define POKEHEARTGOLD_GAME_STATS_H

#include "constants/game_stats.h"
#include "pokedex.h"
#include "save.h"

typedef struct GAME_STATS GAME_STATS;

u32 GameStats_sizeof(void);
void GameStats_Init(GAME_STATS *gameStats);
GAME_STATS *Save_GameStats_Get(SaveData *saveData);
u32 GameStats_Inc(GAME_STATS *gameStats, int statIdx);
u32 GameStats_GetCapped(GAME_STATS *gameStats, int statIdx);
u32 GameStats_Add(GAME_STATS *gameStats, int statIdx, u32 addend);
u32 GameStats_AddSpecial(GAME_STATS *gameStats, int statIdx);
void GameStats_IncSpeciesCaught(GAME_STATS *gameStats, const Pokedex *pokedex, u16 species);
u32 GameStats_SetCapped(GAME_STATS *gameStats, int statIdx, u32 value);
u32 GameStats_UpdateBounded(GAME_STATS *gameStats, int statIdx, u32 value);
u32 GameStats_GetStat2(GAME_STATS *gameStat);

#endif //POKEHEARTGOLD_GAME_STATS_H
