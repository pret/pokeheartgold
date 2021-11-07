#ifndef POKEHEARTGOLD_PLAYER_DATA_H
#define POKEHEARTGOLD_PLAYER_DATA_H

#include "save.h"

typedef struct PLAYERDATA PLAYERDATA;

u16 *Sav2_PlayerData_GetCoinsAddr(SAVEDATA *saveData);

#endif //POKEHEARTGOLD_PLAYER_DATA_H
