#ifndef POKEHEARTGOLD_GAME_STATS_H
#define POKEHEARTGOLD_GAME_STATS_H

#include "constants/game_stats.h"

#include "pokedex.h"
#include "save.h"

typedef struct GameStats GameStats;

u32 GameStats_sizeof(void);
void GameStats_Init(GameStats *gameStats);
GameStats *Save_GameStats_Get(SaveData *saveData);
u32 GameStats_Inc(GameStats *gameStats, int statIdx);
u32 GameStats_GetCapped(GameStats *gameStats, int statIdx);
u32 GameStats_Add(GameStats *gameStats, int statIdx, u32 addend);
u32 GameStats_AddScore(GameStats *gameStats, int statIdx);
void GameStats_IncSpeciesCaught(GameStats *gameStats, const Pokedex *pokedex, u16 species);
u32 GameStats_SetCapped(GameStats *gameStats, int statIdx, u32 value);
u32 GameStats_UpdateBounded(GameStats *gameStats, int statIdx, u32 value);
u32 GameStats_GetScore(GameStats *gameStat);

#endif // POKEHEARTGOLD_GAME_STATS_H
