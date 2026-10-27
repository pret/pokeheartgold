#ifndef POKEHEARTGOLD_BATTLE_OVERLAY_07_0223251C_H
#define POKEHEARTGOLD_BATTLE_OVERLAY_07_0223251C_H

#include "battle.h"
#include "library/spl_emitter.h"

typedef struct BallCapsuleSealEffect {
    enum HeapID heapID;
    BallCapsuleConfig ballCapCfg;
    int sealCount;
    void *sealParticleSystems[9];
    SEAL *seals[9];
    BOOL sealActiveFlags[9];
    SPLEmitter *emitter;
    SysTask *task;
    BOOL isActive;
    NARC *particleNarc;
    int state;
    int hasCapsule;
    int ballType;
    int capsuleID;
    CAPSULE capsule;
} BallCapsuleSealEffect;

typedef struct {
    int unk_00;
    int unk_04;
    int unk_08;
    BOOL *unk_0C;
    void *unk_10;
    SEAL *unk_14;
    void *unk_18;
} UnkStruct_02236430;

typedef struct {
    s16 unk_00;
    s16 unk_02;
    int unk_04;
    enum HeapID heapID;
    int unk_0C;
    int unk_10;
} UnkStruct_ov12_02236690;

typedef struct UnkStruct_ov12_02236648 {
    UnkStruct_ov12_02236690 unk_00;
    SPLEmitter *unk_14;
    void *unk_18;
    int unk_1C;
    int unk_20;
} UnkStruct_ov12_02236648;

typedef struct ValueLerpContext {
    s32 value;
    s32 data[4];
} ValueLerpContext;

typedef struct XYTransformContext {
    s16 x;
    s16 y;
    s32 data[8];
} XYTransformContext;

typedef struct {
    s16 unk_00;
    s16 unk_02;
    s16 unk_04;
    s16 unk_06;
    int unk_08;
    int unk_0C;
    int unk_10;
} UnkStruct_ov12_02237C54_sub1;

typedef struct PaletteFadeContext {
    BOOL active;
    SysTask *task;
    u32 bufferID;
    u16 index;
    u16 count;
    u16 color;
    u8 startFrac;
    u8 endFrac;
    u8 fraction;
    s8 step;
    s8 stepFrames;
    s8 timer;
    PaletteData *paletteData;
} PaletteFadeContext;

typedef struct BallRotation {
    int unk_00;
    int unk_04;
    int unk_08;
    int unk_0C;
    int unk_10;
    int unk_14;
    int unk_18;
    BOOL unk_1C;
    u8 unk_20;
    u8 unk_21;
    s8 unk_22;
    BOOL unk_24;
    BOOL unk_28;
    SpriteManager *unk_2C;
    ManagedSprite *unk_30;
    ValueLerpContext unk_34;
    XYTransformContext unk_48[2];
    BallThrow unk_90;
    UnkStruct_ov12_02237C54_sub1 unk_B8;
    SysTask *unk_CC;
    UnkStruct_ov12_02236648 *unk_D0;
    PaletteFadeContext *unk_D4;
    void *unk_D8;
    int unk_DC;
} BallRotation;

BallCapsuleSealEffect *ov07_02232694(enum HeapID heapID, const BallCapsuleConfig *ballCapCfg);
void ov07_022326C0(BallCapsuleSealEffect *ballCapSealEff, const BallCapsuleConfig *ballCapCfgPtr);
void ov07_02233EB8(BallRotation *param0, int param1);
void ov07_022344B4(BallRotation *param0, u16 param1);
void ov07_022344C0(BallRotation *param0, BOOL param1);

#endif