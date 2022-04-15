#ifndef POKEHEARTGOLD_UNK_02054E00_H
#define POKEHEARTGOLD_UNK_02054E00_H

#include "script.h"

void sub_02054F14(void);
void Fsys_SetSavedMusicId(FieldSystem *fsys, u16 seqNo);
void Fsys_ClearSavedMusicId(FieldSystem *fsys);
u16 Fsys_GetSurfOverriddenMusicId(FieldSystem *fsys, u32 mapId);
BOOL Fsys_PlayOrFadeToNewMusicId(FieldSystem *fsys, u16 seqNo, int a2);
void sub_020550E4(FieldSystem *fsys, u32 mapId);
void sub_02055110(FieldSystem *fsys, u32 mapId, u32 a2);
int Trainer_GetEncounterMusic(u16 a0, BOOL isKanto);

#endif //POKEHEARTGOLD_UNK_02054E00_H
