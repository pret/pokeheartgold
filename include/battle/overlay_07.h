#ifndef POKEHEARTGOLD_BATTLE_OVERLAY_07_H
#define POKEHEARTGOLD_BATTLE_OVERLAY_07_H

#include "battle/battle.h"

void ov07_022344A8(UnkBallData *, s16, s16);
void UnkBallData_SetBallAnimation(UnkBallData *data, s32 ballAnim);
BOOL ov07_02232F60(UnkBallData *data, s32 ballAnim_Unused); // IsBallAnimationPlaying?
UnkBallData *ov07_02233DB8(BallThrow *ballThrow);           // unkBallData_Init?
void ov07_02233ECC(UnkBallData *data);                      // unkBallData_Destroy?
s32 ov07_02233F20(UnkBallData *data);
int ov07_02234B5C(int battlerType, int a1);
void ov07_0223494C(BattlerSpriteContext *battlerSpriteContext, enum HeapID heapId);
void ov07_02234A20(BattlerSpriteContext *battlerSpiteContext, enum HeapID heapId);
void ov07_0221C394(BattleAnimSystem *battleAnimSystem);
void BattleAnimSystem_FreeScriptData(BattleAnimSystem *battleAnimSystem);
BOOL BattleAnimSystem_IsMoveActive(BattleAnimSystem *battleAnimSystem);
void *ov07_0221FDFC(BattleSystem *battleSystem, enum HeapID heapId);
void *ov07_02232694(enum HeapID, BallCapsuleConfig *BallCapsuleConfig);
void ov07_022329B0(void *ballCapsuleSealEffect);
int ov07_02232A04(void *ballCapsuleSealEffect);
int ov07_02233EA0(UnkBallData *ballData);
int ov07_02233E88(UnkBallData *ballData);
void ov07_02232A44(void *ballCapsuleSealEffect);
void ov07_02232AB8(void *ballCapsuleSealEffect);
int ov07_02232A54(void *ballCapsuleSealEffect);
void ov07_0221FE08(void *battleMonObjectData);
void *ov07_0221BEDC(enum HeapID);
void ov07_0221BFE0(BattleAnimSystem *battleAnimSystem);
void ov07_022344C4(UnkBallData *ballData, int a1);
void ov07_022344D0(UnkBallData *ballData, int a1);
void ov07_022344C0(UnkBallData *ballData, int a1);
void ov07_0223449C(UnkBallData *ballData, int a1);
void ov07_02233EFC(UnkBallData *ballData, int a1);
void ov07_022344DC(UnkBallData *ballData, int a1);
void *ov07_0223458C(enum HeapID heapId, void *a1);
void *ov07_022345C8(void *a0, ParticleEffectTemplate *particleEffectTemplate);
void ov07_02234694(void *a0);
void ov07_02234604(void *a0);
int ov07_022346BC(void *a0);
void ov07_02234628(void *a0);
void *ov07_0221FB90(BattleSystem *battleSystem, enum HeapID, int battler);
int ov07_0221FE70(void *a0);
void ov07_0221FE3C(void *a0, int battler);
void ov07_0221C01C(BattleAnimSystem *battleAnimSystem, MoveAnimation *moveAnimation, u16 move, BattleAnimBattlerContext *battlerContext);

#endif
