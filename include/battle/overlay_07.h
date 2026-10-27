#ifndef POKEHEARTGOLD_BATTLE_OVERLAY_07_H
#define POKEHEARTGOLD_BATTLE_OVERLAY_07_H

#include "battle.h"

void ov07_022344A8(UnkBallData *, s16, s16);
void UnkBallData_SetBallAnimation(UnkBallData *data, s32 ballAnim);
BOOL ov07_02232F60(UnkBallData *data, s32 ballAnim_Unused); // IsBallAnimationPlaying?
UnkBallData *ov07_02233DB8(BallThrow *ballThrow);           // unkBallData_Init?
void ov07_02233ECC(UnkBallData *data);                      // unkBallData_Destroy?
s32 ov07_02233F20(UnkBallData *data);
int ov07_02234B5C(int battlerType, int a1);

#endif
