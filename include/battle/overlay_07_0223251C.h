#ifndef POKEHEARTGOLD_BATTLE_OVERLAY_07_0223251C_H
#define POKEHEARTGOLD_BATTLE_OVERLAY_07_0223251C_H

#include "battle.h"
#include "library/spl_emitter.h"

typedef struct BallSeal {
    u8 type;
    u8 x;
    u8 y;
} BallSeal;

typedef struct BallCapsule {
    BallSeal seals[8];
} BallCapsule;

typedef struct BallCapsuleSealEffect {
    enum HeapID heapID;
    BallCapsuleConfig ballCapCfg;
    int sealCount;
    void *sealParticleSystems[9];
    BallSeal *seals[9];
    BOOL sealActiveFlags[9];
    SPLEmitter *emitter;
    SysTask *task;
    BOOL isActive;
    NARC *particleNarc;
    int state;
    int hasCapsule;
    int ballType;
    int capsuleID;
    BallCapsule capsule;
} BallCapsuleSealEffect;

BallCapsuleSealEffect *ov07_02232694(enum HeapID heapID, const BallCapsuleConfig *ballCapCfg);
void ov07_022326C0(BallCapsuleSealEffect *ballCapSealEff, const BallCapsuleConfig *ballCapCfgPtr);

#endif