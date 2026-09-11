#ifndef POKEHEARTGOLD_OVERLAY_07_H
#define POKEHEARTGOLD_OVERLAY_07_H

#include "battle/battle.h"

void UnkBallData_SetBallAnimation(UnkBallData *data, s32 ballAnim);
BOOL ov07_02232F60(UnkBallData *data, s32 ballAnim_Unused); // IsBallAnimationPlaying?
UnkBallData *ov07_02233DB8(UnkStruct_134 *unkStruct_134);   // unkBallData_Init?
void ov07_02233ECC(UnkBallData *data);                      // unkBallData_Destroy?
s32 ov07_02233F20(UnkBallData *data);

#endif // POKEHEARTGOLD_OVERLAY_07_H
