#ifndef POKEHEARTGOLD_OVY_67_H
#define POKEHEARTGOLD_OVY_67_H

#include "overlay_manager.h"
#include "save.h"

typedef struct UnkOv67Args {
    SaveData *saveData;
    u16 unk_4;
    u16 unk_6;
} UnkOv67Args;

BOOL ov67_021E5900(OVY_MANAGER *man, int *state);
BOOL ov67_021E5984(OVY_MANAGER *man, int *state);
BOOL ov67_021E5968(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_OVY_67_H
