#ifndef POKEHEARTGOLD_FIELD_BGM_H
#define POKEHEARTGOLD_FIELD_BGM_H

#include "script.h"
#include "field_system.h"
#include "field_types_def.h"

const static u16 sTrainerEncounterMusicParam[][3];

void FieldBGM_Stop();
void FieldBGM_SetOverride(FieldSystem *fieldSystem, u16 seqNo);
u16 FieldBGM_GetOverride(FieldSystem *fieldSystem);
void FieldBGM_ClearOverride(FieldSystem *fieldSystem);
u16 FieldBGM_GetEffective(FieldSystem *fieldSystem, u32 mapId);
u16 FieldBGM_GetForMapHeader(FieldSystem *fieldSystem, int mapId);
BOOL FieldBGM_TryFadeOut(FieldSystem *fieldSystem, u16 seqNo, int mode);
static void FieldBGM_GetFadeOutAndWaitFrames(FieldSystem *fieldSystem, int mode, int *fadeOutFrames, int *waitFrames);
int FieldBGM_GetEyesMeetForTrainer(u16 a0, int regionNo);
void FieldBGM_TryFadeIn(FieldSystem *fieldSystem, u32 mapId);
void FieldBGM_PlayForMapHeader(FieldSystem *fieldSystem, u32 mapId, u32 a2);
BOOL FieldBGM_PlayEffectiveForMapHeader(FieldSystem *fieldSystem, u32 mapId);
BOOL sub_02055198(FieldSystem *fieldSystem, u16 seqNo);

#endif // POKEHEARTGOLD_FIELD_BGM_H
