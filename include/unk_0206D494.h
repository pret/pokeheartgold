#ifndef POKEHEARTGOLD_UNK_0206D494_H
#define POKEHEARTGOLD_UNK_0206D494_H

#include "pokemon_types_def.h"

BOOL MonIsInGameTradePoke(POKEMON *pokemon, u8 tradeno);
BOOL sub_0206D8D0(POKEMON *pokemon, SAVEDATA *saveData);
BUGCONTEST *FieldSys_BugContest_get(FieldSystem *fsys);
void FieldSys_IncrementBugContestTimer(FieldSystem *fsys, int a1);
void Fsys_InitMystriStageGymmick(FieldSystem *fsys);

#endif //POKEHEARTGOLD_UNK_0206D494_H
