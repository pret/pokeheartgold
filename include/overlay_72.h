#ifndef POKEHEARTGOLD_OVY_72_H
#define POKEHEARTGOLD_OVY_72_H

#include "frontier_data.h"
#include "options.h"
#include "overlay_manager.h"
#include "sav_system_info.h"
#include "save.h"

typedef struct NintendoWifiConnectArgs {
    FRONTIERDATA *frontierData;
    u32 unk4;
    SysInfo *sysInfo;
    SaveData *saveData;
    Options *options;
    void *unk14;
    int unk18;
    void *unk1C;
    int unk20;
    int unk24;
} NintendoWifiConnectArgs;

BOOL NintendoWfc_Init(OverlayManager *man, int *state);
BOOL NintendoWfc_Main(OverlayManager *man, int *state);
BOOL NintendoWfc_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_72_H
