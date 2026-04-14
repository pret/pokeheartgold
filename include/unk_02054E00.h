#ifndef POKEHEARTGOLD_UNK_02054E00_H
#define POKEHEARTGOLD_UNK_02054E00_H

#include "script.h"
#include "field_system.h"
#include "field_types_def.h"

const /*static*/ u16 sTrainerEncounterMusicParam[][3];

BOOL MapModel_IsHeadbuttTree(u32 mapModelNo);
u16 MapCoordToMatrixIndex(FieldSystem* fieldSystem, int coordX, int coordY);
void sub_02054EB0(FieldSystem *fieldSystem, int a1, BOOL a2);
void sub_02054F14();
void FieldSystem_SetSavedMusicId(FieldSystem *fieldSystem, u16 seqNo);
u16 FieldSystem_GetSavedMusicId(FieldSystem *fieldSystem);
void FieldSystem_ClearSavedMusicId(FieldSystem *fieldSystem);
u16 FieldSystem_GetOverriddenMusicId(FieldSystem *fieldSystem, u32 mapId);
u16 GetMapMusic(FieldSystem *fieldSystem, int mapId);
BOOL FieldSystem_PlayOrFadeToNewMusicId(FieldSystem *fieldSystem, u16 seqNo, int mode);
void Sound_GetBGMFadeOutAndWaitFrames(FieldSystem *fieldSystem, int mode, int *fadeOutFrames, int *waitFrames);
int Trainer_GetEncounterMusic(u16 a0, int regionNo);
void FieldSystem_BeginFadeOutMusic(FieldSystem *fieldSystem, u32 mapId);
void sub_02055110(FieldSystem *fieldSystem, u32 mapId, u32 a2);
void sub_02055198(FieldSystem *fieldSystem, u16 a1);
void sub_02055164(FieldSystem *fieldSystem, u32 mapId);

#endif // POKEHEARTGOLD_UNK_02054E00_H
