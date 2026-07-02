#ifndef POKEHEARTGOLD_UNK_0202C034_H
#define POKEHEARTGOLD_UNK_0202C034_H

#include "save.h"
#include "pm_string.h"
#include "dwcaccount.h"

typedef struct UnkStruct_021D2230 UnkStruct_021D2230;

void sub_0202C6FC(SaveData *saveData);
void sub_0202C714(SaveData *saveData);
UnkStruct_021D2230 *sub_0202C6F4(SaveData *saveData);
int sub_0202C2F8(struct UnkStruct_021D2230 *a0);
DWCUserData *sub_0202C08C(UnkStruct_021D2230 *a0);
u16* sub_0202C254(struct UnkStruct_021D2230 *a0, s32 a1);
u16* sub_0202C298(struct UnkStruct_021D2230 *a0, s32 a1);
s32 sub_0202C090(struct UnkStruct_021D2230 *a0, s32 a1, s32 a2);
void sub_0202C46C(struct UnkStruct_021D2230 *a0);
void sub_0202C4B0(struct UnkStruct_021D2230 *a0, s32 a1);
u16 sub_0202C318(struct UnkStruct_021D2230 *a0);
void sub_0202C190(UnkStruct_021D2230* a0, int a1, int a2, u32 a3);
void sub_0202C03C(struct UnkStruct_021D2230 *a0);
void sub_0202C2B4(struct UnkStruct_021D2230 *a0, int a1, String *a2);
void sub_0202C270(struct UnkStruct_021D2230 *a0, int a1, String *a2);
DWCFriendData *sub_0202C23C(struct UnkStruct_021D2230 *a0, int a1);

#endif // POKEHEARTGOLD_UNK_0202C034_H
