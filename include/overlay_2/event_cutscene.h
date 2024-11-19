#ifndef POKEHEARTGOLD_OVERLAY_02_EVENT_CUTSCENE_H
#define POKEHEARTGOLD_OVERLAY_02_EVENT_CUTSCENE_H

#include "field_system.h"

BOOL ov02_02252334(FieldSystem *fieldSystem);
void ov02_022523B4(TaskManager *taskMan);
void FieldSystem_BeginCelebiTimeTravelCutsceneTask(FieldSystem *fieldSystem);
void FieldSystem_BeginSinjohCutsceneTask(FieldSystem *fieldSystem);
void FieldSystem_BeginSinjohGetEggCutsceneTask(FieldSystem *fieldSystem, u8 a1);

#endif
