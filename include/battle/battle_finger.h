#ifndef POKEHEARTGOLD_BATTLE_FINGER_H
#define POKEHEARTGOLD_BATTLE_FINGER_H

#include "battle/battle.h"
#include "unk_0200E320.h"

//This file handles the finger that comes up during the catching tutorial

typedef struct BattleFinger {
    void *unk0;
    SysTask *task;
    int x;
    int y;
    int angle;
    fx32 unk14;
    s16 delay;
    u8 touchRequest;
    u8 touchOccurrence;
    u8 touchAnimationFlag;
    u8 touchAnimationState;
    u8 touchAnimationDelay;
} BattleFinger;

void BattleFinger_LoadResources(void *a0, void *a1, HeapID heapId, void *a3, u32 a4, u32 pal, u32 cell, u32 animation);
void BattleFinger_FreeResources(void *a0, u32 character, u32 pal, u32 cell, u32 animation);
BattleFinger *BattleFinger_New(void *a0, void *a1, HeapID heapId, u32 character, u32 pal, u32 cell, u32 animation, u32 a7, u32 a8);
void BattleFinger_Delete(BattleFinger *finger);
void ov12_0226BCFC(BattleFinger *finger, int x, int y, fx32 a3);
void ov12_0226BD2C(BattleFinger *finger, int x, int y);
void BattleFinger_Disable(BattleFinger *finger);
void ov12_0226BD4C(BattleFinger *finger, int delay);
BOOL ov12_0226BD50(BattleFinger *finger);

#endif
