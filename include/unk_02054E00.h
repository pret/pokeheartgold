#ifndef POKEHEARTGOLD_UNK_02054E00_H
#define POKEHEARTGOLD_UNK_02054E00_H

#include "script.h"

void sub_02054F14(void);
void FieldSystem_SetSavedMusicId(FieldSystem *fsys, u16 seqNo);
void Fsys_ClearSavedMusicId(FieldSystem *fsys);
u16 FieldSystem_GetSurfOverriddenMusicId(FieldSystem *fsys, u32 mapId);
BOOL FieldSystem_PlayOrFadeToNewMusicId(FieldSystem *fsys, u16 seqNo, int a2);
void Fsys_BeginFadeOutMusic(FieldSystem *fsys, u32 mapId);
void sub_02055110(FieldSystem *fsys, u32 mapId, u32 a2);
int Trainer_GetEncounterMusic(u16 a0, BOOL isKanto);
u16 GetMapMusic(FieldSystem *fsys, int mapId);
void sub_02055198(FieldSystem *fsys, u16 a1);
void Fsys_BeginFadeOutMusic(FieldSystem *fsys, u32 mapId);

#endif //POKEHEARTGOLD_UNK_02054E00_H
