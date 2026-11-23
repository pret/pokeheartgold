#ifndef POKEHEARTGOLD_BATTLE_OVERLAY_07_H
#define POKEHEARTGOLD_BATTLE_OVERLAY_07_H

#include "battle/battle.h"
#include "battle/battle_message_structs.h"

typedef struct {
    int battlerType;
    int ballTypeOverride;
    Pokemon *mon;
} BallCapsuleConfig;

void ov07_022344A8(BallRotation *, s16, s16);
BallRotation *ov07_02233DB8(BallThrow *ballThrow); // unkBallData_Init?
void ov07_02233ECC(BallRotation *data);            // unkBallData_Destroy?
int ov07_02234B5C(int battlerType, int a1);
void ov07_0223494C(BattlerSpriteContext *battlerSpriteContext, enum HeapID heapId);
void ov07_02234A20(BattlerSpriteContext *battlerSpiteContext, enum HeapID heapId);
void ov07_0221C394(BattleAnimSystem *battleAnimSystem);
void BattleAnimSystem_FreeScriptData(BattleAnimSystem *battleAnimSystem);
BOOL BattleAnimSystem_IsMoveActive(BattleAnimSystem *battleAnimSystem);
void *ov07_0221FDFC(BattleSystem *battleSystem, enum HeapID heapId);
int ov07_02233EA0(BallRotation *ballData);
int ov07_02233E88(BallRotation *ballData);
void ov07_0221FE08(void *battleMonObjectData);
void *ov07_0221BEDC(enum HeapID);
void ov07_0221BFE0(BattleAnimSystem *battleAnimSystem);
void ov07_022344D0(BallRotation *ballData, int a1);
void ov07_0223449C(BallRotation *ballData, int a1);
void ov07_022344DC(BallRotation *ballData, int a1);
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
int ov07_022344E4(s16 x1, s16 y1, s16 x2, s16 y2);
void *ov07_0221FEE4(NARC *narc, enum HeapID heapID, int a2, int a3);
void *ov07_0221FEB0(enum HeapID heapID, int a1, int a2, int a3);
void ov07_0221C69C(void);
void ov07_0221FF2C(void *a0);
int ov07_02234530(SEAL *a0);
void ov07_02231DE0(int a0, VecFx32 *a1, u32 a2, u32 a3);
void ov07_02222268(XYTransformContext *xyTransform, s16, s16, s16, s16, u32);
int ov07_022222F0(XYTransformContext *xyTransform, ManagedSprite *managedSprite);
void ov07_02222338(XYTransformContext *a0, XYTransformContext *a1, s16 a2, s16 a3, s16 a4, s16 a5, u16 a6, int a7);
PaletteFadeContext *ov07_02222F10(PaletteData *palette, enum HeapID heapID, int a2, u16 a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10);
int ov07_022223CC(XYTransformContext *a0, XYTransformContext *a1, ManagedSprite *ManagedSprite);
int ov07_02222EE8(PaletteFadeContext *paletteFadeContext);
void ov07_02222EF8(PaletteFadeContext *paletteFadeContext);
void ov07_022223F0(ValueLerpContext *valueLerpContext, int a1, int a2, int a3);
int ov07_02222440(ValueLerpContext *valueLerpContext);
void ov07_02221F04(u32 a0, u32 a1, s16 *a2, s16 *a3);

#endif
