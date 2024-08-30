#ifndef POKEHEARTGOLD_UNK_02054E00_H
#define POKEHEARTGOLD_UNK_02054E00_H

#include "script.h"

void sub_02054F14(void);
void FieldSystem_SetSavedMusicId(FieldSystem *fieldSystem, u16 seqNo);
void FieldSystem_ClearSavedMusicId(FieldSystem *fieldSystem);
u16 FieldSystem_GetOverriddenMusicId(FieldSystem *fieldSystem, u32 mapId);
BOOL FieldSystem_PlayOrFadeToNewMusicId(FieldSystem *fieldSystem, u16 seqNo, int a2);
void FieldSystem_BeginFadeOutMusic(FieldSystem *fieldSystem, u32 mapId);
void sub_02055110(FieldSystem *fieldSystem, u32 mapId, u32 a2);
int Trainer_GetEncounterMusic(u16 a0, BOOL isKanto);
u16 GetMapMusic(FieldSystem *fieldSystem, int mapId);
void sub_02055198(FieldSystem *fieldSystem, u16 a1);
void FieldSystem_BeginFadeOutMusic(FieldSystem *fieldSystem, u32 mapId);
void sub_02054EB0(FieldSystem *fieldSystem, int a1, BOOL a2);
void sub_02055164(FieldSystem *fieldSystem, u32 mapId);

#endif // POKEHEARTGOLD_UNK_02054E00_H
