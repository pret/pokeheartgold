#ifndef POKEHEARTGOLD_UNK_02097B78_H
#define POKEHEARTGOLD_UNK_02097B78_H

#include "overlay_manager.h"
#include "save.h"

typedef struct Unk0203FCC4 {
    int unk0[0x12];
} Unk0203FCC4;

typedef struct LegendaryCinematicArgs {
    SaveData *saveData;
    Unk0203FCC4 unk4;
    u16 unk4C;
    u16 unk4E;
} LegendaryCinematicArgs;

BOOL LegendaryCinematic_OvyInit(OVY_MANAGER *man, int *state);
BOOL LegendaryCinematic_OvyExec(OVY_MANAGER *man, int *state);
BOOL LegendaryCinematic_OvyExit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_UNK_02097B78_H
