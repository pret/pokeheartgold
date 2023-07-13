#ifndef POKEHEARTGOLD_OVERLAY_TRAINER_CARD_H
#define POKEHEARTGOLD_OVERLAY_TRAINER_CARD_H

#include "save.h"

#define HEAP_ID_TRAINER_CARD        ((HeapID)94)

typedef struct {
    u8 unk0[4];
    u8 unk4a:4;
    u8 signatureExists:1;
    u8 unk5[0x63];
    u8 signature[0x600];
    u8 unk668[6];
    SaveData *saveData;
    u32 reqUpdateSignature;
} Ov50_021E5A3C;

typedef struct {
    HeapID heapId;
    u8 unk4[4];
    OVY_MANAGER *ov_mgr;
    Ov50_021E5A3C *parentData;
    void *unk10;
} TrainerCardAppState;

BOOL TrainerCardApp_OvyInit(OVY_MANAGER *man, int *state);
BOOL TrainerCardApp_OvyExec(OVY_MANAGER *man, int *state);
BOOL TrainerCardApp_OvyExit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_OVERLAY_TRAINER_CARD_H
