#ifndef POKEHEARTGOLD_CREDITS_CREDITS_H
#define POKEHEARTGOLD_CREDITS_CREDITS_H

#include "global.h"
#include "overlay_manager.h"

#define NUM_CREDIT_PAGES 43

#define NUM_CUTSCENES               16
#define SPRITES_PER_CUTSCENE        16
#define UNIQUE_SPRITES_PER_CUTSCENE  6

typedef struct {
    int gender;
    BOOL gameCleared;
} CreditsAppArgs;

typedef struct {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
} UnkOv021E60F6;

BOOL CreditsApp_OvyInit(OVY_MANAGER *man, int *state);
BOOL CreditsApp_OvyExit(OVY_MANAGER *man, int *state);
BOOL CreditsApp_OvyExec(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_CREDITS_CREDITS_H
