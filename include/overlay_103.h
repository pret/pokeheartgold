#ifndef POKEHEARTGOLD_OVY_103_H
#define POKEHEARTGOLD_OVY_103_H

#include "field_system.h"
#include "overlay_manager.h"
#include "save.h"

typedef struct UnkStruct_0203F074 {
    SaveData *saveData;
    FieldSystem *fieldSystem;
    MenuInputStateMgr *menuInputStatePtr;
} UnkStruct_0203F074;

BOOL ov103_021EC940(OVY_MANAGER *man, int *state);
BOOL ov103_021EC988(OVY_MANAGER *man, int *state);
BOOL ov103_021EC9A4(OVY_MANAGER *man, int *state);

#endif // POKEHEARTGOLD_OVY_103_H
