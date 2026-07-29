#ifndef POKEHEARTGOLD_UNK_0202C034_H
#define POKEHEARTGOLD_UNK_0202C034_H

#include "save.h"
#include "pm_string.h"
#include "dwcaccount.h"

typedef struct WiFiList WiFiList;

void sub_0202C6FC(SaveData *saveData);
void sub_0202C714(SaveData *saveData);
WiFiList *sub_0202C6F4(SaveData *saveData);
int sub_0202C2F8(struct WiFiList *a0);
DWCUserData *sub_0202C08C(WiFiList *a0);
u16* sub_0202C254(struct WiFiList *a0, s32 a1);
u16* sub_0202C298(struct WiFiList *a0, s32 a1);
s32 sub_0202C090(struct WiFiList *a0, s32 a1, s32 a2);
void sub_0202C46C(struct WiFiList *a0);
void sub_0202C4B0(struct WiFiList *a0, s32 a1);
u16 sub_0202C318(struct WiFiList *a0);
void sub_0202C190(WiFiList* a0, int a1, int a2, u32 a3);
void sub_0202C03C(struct WiFiList *a0);
void sub_0202C2B4(struct WiFiList *a0, int a1, String *a2);
void sub_0202C270(struct WiFiList *a0, int a1, String *a2);
DWCFriendData *sub_0202C23C(struct WiFiList *a0, int a1);

#endif // POKEHEARTGOLD_UNK_0202C034_H
