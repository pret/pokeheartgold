#ifndef POKEHEARTGOLD_FRONTIER_DATA_H
#define POKEHEARTGOLD_FRONTIER_DATA_H

#include "save.h"

typedef struct FRONTIERDATA FRONTIERDATA;

FRONTIERDATA *Save_FrontierData_get(SAVEDATA *saveData);
u32 FrontierData_BattlePointAction(FRONTIERDATA *frontierData, u32 param, u32 action);

#endif //POKEHEARTGOLD_FRONTIER_DATA_H
