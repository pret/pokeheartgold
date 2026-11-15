#ifndef POKEHEARTGOLD_BATTLE_OVERLAY_07_0223251C_H
#define POKEHEARTGOLD_BATTLE_OVERLAY_07_0223251C_H

#include "battle/overlay_07.h"

#include "battle.h"

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
    BallCapsule capsule;
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

BallCapsuleSealEffect *ov07_02232694(enum HeapID heapID, const BallCapsuleConfig *ballCapCfg);
void ov07_022326C0(BallCapsuleSealEffect *ballCapSealEff, const BallCapsuleConfig *ballCapCfgPtr);
void ov07_02233EB8(BallRotation *param0, int param1);
void ov07_022344B4(BallRotation *param0, u16 param1);
void ov07_022344C0(BallRotation *param0, BOOL param1);
void BallCapsuleSealEffect_Free(BallCapsuleSealEffect *ballCapsuleSealEffect);
void ov07_02232730(SysTask *task, void *data);
void ov07_022329B0(BallCapsuleSealEffect *ballCapSealEff);
BOOL ov07_02232A04(BallCapsuleSealEffect *ballCapSealEff);
void ov07_02232A14(BallCapsuleSealEffect *ballCapSealEff, void *param1);
void ov07_02232A44(BallCapsuleSealEffect *ballCapSealEff);
BOOL BallCapsuleSealEffect_IsActive(BallCapsuleSealEffect *ballCapSealEff);
UnkStruct_ov12_02236648 *ov07_02232D20(UnkStruct_ov12_02236690 *param0);
void ov07_02232D80(UnkStruct_ov12_02236648 *param0);
BOOL ov07_02232DF4(UnkStruct_ov12_02236648 *param0);
void ov07_02232E10(UnkStruct_ov12_02236648 *param0);
void UnkBallData_SetBallAnimation(BallRotation *param0, int param1);
BOOL ov07_02232F60(BallRotation *param0, int param1);
void ov07_02233EFC(BallRotation *ballData, enum BallThrowMode a1);
enum BallThrowMode ov07_02233F20(BallRotation *param0);
void ov07_022344C4(BallRotation *param0, u16 param1);

// The following are static functions that are referenced in data still in asm
BOOL ov07_022325BC(int param0);
BOOL ov07_02232E18(BallRotation *param0);
BOOL ov07_02232E40(BallRotation *param0);
BOOL ov07_02232E68(BallRotation *param0);
BOOL ov07_02232E90(BallRotation *param0);
BOOL ov07_02232EB8(BallRotation *param0);
BOOL ov07_02232EE0(BallRotation *param0);
BOOL ov07_02232F08(BallRotation *param0);
BOOL ov07_02232F30(BallRotation *param0);
BOOL ov07_02232F80(BallRotation *param0);
BOOL ov07_02232F84(BallRotation *param0);
BOOL ov07_02232F9C(BallRotation *param0);
BOOL ov07_02232FA8(BallRotation *param0);
BOOL ov07_0223308C(BallRotation *param0);
BOOL ov07_022330E0(BallRotation *param0);
BOOL ov07_022330E4(BallRotation *param0);
BOOL ov07_022330F0(BallRotation *param0);
BOOL ov07_022330FC(BallRotation *param0);
BOOL ov07_02233088(BallRotation *param0);
BOOL ov07_022331A4(BallRotation *param0);
BOOL ov07_022331B0(BallRotation *param0);
BOOL ov07_02233224(BallRotation *param0);
BOOL ov07_02233228(BallRotation *param0);
BOOL ov07_022332C4(BallRotation *param0);
BOOL ov07_022332C8(BallRotation *param0);
BOOL ov07_022332E8(BallRotation *param0);
BOOL ov07_022332F4(BallRotation *param0);
BOOL ov07_0223338C(BallRotation *param0);
BOOL ov07_02233390(BallRotation *param0);
BOOL ov07_0223339C(BallRotation *param0);
BOOL ov07_022333A8(BallRotation *param0);
BOOL ov07_02233498(BallRotation *param0);
BOOL ov07_0223349C(BallRotation *param0);
BOOL ov07_02233500(BallRotation *param0);
BOOL ov07_0223350C(BallRotation *param0);
BOOL ov07_02233590(BallRotation *param0);
BOOL ov07_0223359C(BallRotation *param0);
BOOL ov07_022335A0(BallRotation *param0);
BOOL ov07_022335B4(BallRotation *param0);
BOOL ov07_02233874(BallRotation *param0);
BOOL ov07_02233B04(BallRotation *param0);
BOOL ov07_02233C98(BallRotation *param0);
BOOL ov07_02233D24(BallRotation *param0);

#endif
