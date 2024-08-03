#ifndef POKEHEARTGOLD_UNK_02056680_H
#define POKEHEARTGOLD_UNK_02056680_H

#include "task.h"

typedef struct FieldTransitionUnkEnvironmentA {
    int state;
    int unk4;
} FieldTransitionUnkEnvironmentA;

BOOL sub_02056680(TaskManager *man);
BOOL sub_020566F8(TaskManager *man);
BOOL sub_0205681C(TaskManager *man);
BOOL sub_020567B4(TaskManager *man);
BOOL sub_02056938(TaskManager *man);
void sub_02056A54(FieldSystem *fieldSystem);
void sub_02056AEC(FieldSystem *fieldSystem);
void sub_02056BC8(FieldSystem *fieldSystem);
void sub_02056C64(FieldSystem *fieldSystem);
void sub_02056D00(TaskManager *taskManager, u16 a1);

#endif // POKEHEARTGOLD_UNK_02056680_H
