#ifndef POKEHEARTGOLD_OVERLAY_TRAINER_CARD_H
#define POKEHEARTGOLD_OVERLAY_TRAINER_CARD_H

#include "menu_input_state.h"
#include "overlay_manager.h"
#include "save.h"

#define HEAP_ID_TRAINER_CARD ((HeapID)94)

typedef struct UnkStruct_0203F7C2 {
    MenuInputStateMgr *menuInputStatePtr;
    SaveData *saveData;
    int unk8;
    BOOL gameCleared;
} UnkStruct_0203F7C2;

typedef struct TrainerCardAppArgs {
    u8 unk0[0x66c];
    UnkStruct_0203F7C2 unk66C;
} TrainerCardAppArgs;

typedef struct {
    u8 unk0[4];
    u8 unk4a : 4;
    u8 signatureExists : 1;
    u8 unk5[0x63];
    u8 signature[0x600];
    u8 unk668[6];
    SaveData *saveData;
    u32 reqUpdateSignature;
} Ov50_021E5A3C;

typedef struct {
    HeapID heapId;
    u8 unk4[4];
    OverlayManager *ov_mgr;
    Ov50_021E5A3C *parentData;
    void *unk10;
} TrainerCardAppState;

BOOL TrainerCard_Init(OverlayManager *man, int *state);
BOOL TrainerCard_Main(OverlayManager *man, int *state);
BOOL TrainerCard_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVERLAY_TRAINER_CARD_H
