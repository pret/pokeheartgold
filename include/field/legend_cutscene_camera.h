#ifndef POKEHEARTGOLD_FIELD_LEGEND_CUTSCENE_CAMERA_H
#define POKEHEARTGOLD_FIELD_LEGEND_CUTSCENE_CAMERA_H

#include "global.h"

#include "field_system.h"

void LegendCutscene_BeginClearBellAnim(FieldSystem *fieldSystem);
void LegendCutscene_EndClearBellAnim(FieldSystem *fieldSystem);
void LegendCutscene_ClearBellRiseFromBag(FieldSystem *fieldSystem);
void LegendCutscene_ClearBellShimmer(FieldSystem *fieldSystem, u8 shimmerClearBellOnly);
void ov02_02250B30(FieldSystem *fieldSystem);
void LegendCutscene_LugiaEyeGlimmerEffect(FieldSystem *fieldSystem);
void LegendCutscene_MoveCamera(FieldSystem *fieldSystem, u8 destIndex);
void LegendCutscene_StartPanCameraTo(FieldSystem *fieldSystem, u8 destIndex);
void LegendCutscene_WaitCameraPan(FieldSystem *fieldSystem);
void LegendCutscene_BirdFinalApproach(FieldSystem *fieldSystem);
void LegendCutscene_BeginWavesOrLeavesEffect(FieldSystem *fieldSystem);
void LegendCutscene_EndWavesOrLeavesEffect(FieldSystem *fieldSystem);
void LegendCutscene_BeginLugiaArrivesEffect(FieldSystem *fieldSystem);
void LegendCutscene_EndLugiaArrivesEffect(FieldSystem *fieldSystem);
void LegendCutscene_LugiaArrivesEffectCameraPan(FieldSystem *fieldSystem);

#endif // POKEHEARTGOLD_FIELD_LEGEND_CUTSCENE_CAMERA_H
