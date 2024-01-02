#ifndef POKEHEARTGOLD_OVY_108_H
#define POKEHEARTGOLD_OVY_108_H

#include "overlay_manager.h"
#include "save.h"

typedef struct SafariAreaCustomizerArgs {
    SaveData *saveData;
    u32 *unk4;
    u8 unk8[0x1c];
} SafariAreaCustomizerArgs;

BOOL SafariDecoration_OvyInit(OVY_MANAGER *man, int *state);
BOOL SafariDecoration_OvyExec(OVY_MANAGER *man, int *state);
BOOL SafariDecoration_OvyExit(OVY_MANAGER *man, int *state);

BOOL SafariAreaCustomizer_OvyInit(OVY_MANAGER *man, int *state);
BOOL SafariAreaCustomizer_OvyExec(OVY_MANAGER *man, int *state);
BOOL SafariAreaCustomizer_OvyExit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_OVY_108_H
