#ifndef POKEHEARTGOLD_OVERLAY_04_H
#define POKEHEARTGOLD_OVERLAY_04_H

#include "script.h"

void GymmickFree_Ecruteak(FieldSystem *fieldSystem);
void GymmickFree_Cianwood(FieldSystem *fieldSystem);
void GymmickFree_Vermilion(FieldSystem *fieldSystem);
void GymmickFree_Azalea(FieldSystem *fieldSystem);
void GymmickFree_Blackthorn(FieldSystem *fieldSystem);
BOOL ov04_02255090(FieldSystem *fieldSystem);
void GymmickFree_Fuchsia(FieldSystem *fieldSystem);
void GymmickFree_Fuchsia(FieldSystem *fieldSystem);
void GymmickFree_Viridian(FieldSystem *fieldSystem);
void ov04_02256BE4(FieldSystem *fieldSystem, u8 arg1);
void GymmickFree_Sinjoh(FieldSystem *fieldSystem);

void GymmickInit_Ecruteak(FieldSystem *fieldSystem);
void GymmickInit_Cianwood(FieldSystem *fieldSystem);
void GymmickInit_Vermilion(FieldSystem *fieldSystem);
void GymmickInit_Violet(FieldSystem *fieldSystem);
void GymmickInit_Azalea(FieldSystem *fieldSystem);
void GymmickInit_Blackthorn(FieldSystem *fieldSystem);
void GymmickInit_Fuchsia(FieldSystem *fieldSystem);
void GymmickInit_Viridian(FieldSystem *fieldSystem);
void GymmickInit_Sinjoh(FieldSystem *fieldSystem);
void EcruteakGymmick_BindCandleToTrainerObject(FieldSystem *fieldSystem);
void EcruteakGymmick_UnbindCandleFromTrainerObject(FieldSystem *fieldSystem);
void EcruteakGymmick_ExtinguishCandle(FieldSystem *fieldSystem, ScriptEnvField field);
int ov04_02256058(FieldSystem *fieldSystem);
void ov04_0225640C(FieldSystem *fieldSystem, u8 lockno, u8 relock);
BOOL ov04_022563C4(FieldSystem *fieldSystem, u8 canId);
void VioletGymmick_ElevatorAction(FieldSystem *fieldSystem);
void BeginAzaleaGymSpinarakRide(FieldSystem *fieldSystem, u8 spinarakNo);
void FlipAzaleaGymSwitch(FieldSystem *fieldSystem, u8 switchNo);

BOOL GymmickCheckCollision_Blackthorn(FieldSystem *fieldSystem, u32 a1, u32 a2, u32 a3, u32 a4);
void ov04_02256ED8(FieldSystem *fieldSystem);
void ov04_02256F00(FieldSystem *fieldSystem, u8 a1);

#endif // POKEHEARTGOLD_OVERLAY_04_H
