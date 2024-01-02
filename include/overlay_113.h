#ifndef POKEHEARTGOLD_OVY_113_H
#define POKEHEARTGOLD_OVY_113_H

#include "overlay_manager.h"
#include "save.h"

typedef struct UnownReportArgs {
    u32 *unk0;
    SaveData *saveData;
} UnownReportArgs;

BOOL UnownReport_OvyInit(OVY_MANAGER *man, int *state);
BOOL UnownReport_OvyExec(OVY_MANAGER *man, int *state);
BOOL UnownReport_OvyExit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_OVY_113_H
