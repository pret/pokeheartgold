#ifndef POKEHEARTGOLD_UNK_020557E0_H
#define POKEHEARTGOLD_UNK_020557E0_H

#include "script.h"
#include "unk_0202EB30.h"
#include "battle_setup.h"

void sub_020557E0(FieldSystem *fsys);
void sub_020557F8(FieldSystem *fsys);
void sub_02055828(FieldSystem *fsys);
void sub_0202EC70(struct UnkStruct_0202EB30 *a0, int i, Pokemon *mon);
int sub_020558D0(FieldSystem *fsys);
int sub_020558E0(FieldSystem *fsys);
int sub_020558F0(FieldSystem *fsys);
BOOL sub_02055874(FieldSystem* fsys, int x, int y);
BATTLE_SETUP* sub_0205589C(FieldSystem* fsys);
void sub_020558AC(FieldSystem *fsys, BATTLE_SETUP *setup);
int sub_020558BC(FieldSystem *fsys);

#endif //POKEHEARTGOLD_UNK_020557E0_H
