#ifndef POKEHEARTGOLD_UNK_02037C94_H
#define POKEHEARTGOLD_UNK_02037C94_H

#include "save.h"
#include "save_wifi_history.h"
#include "unk_0202C034.h"
#include "overlay_44_02232E9C.h"

typedef struct {
	u64 x;
	u64 mul;
	u64 add;
} MATHRandContext32;

BOOL sub_02037D78(void);
void sub_02037FF0(void);
void sub_020380CC(void);
u32 *sub_020392D8(void);
BOOL sub_020393C8(void);
int sub_0203993C(void);
int sub_02039998(void);
BOOL sub_02039AA4(void);
BOOL sub_02038D90(void);
void sub_020398D4(int a0, int a1);
void sub_02039358(void);
BOOL sub_020390C4(void);
void sub_020378E4(int a0);
s32 sub_02039080(s32);
s32 sub_02039264(void);
UnkStruct_ov44_0223197C *sub_020398C8(void);
void sub_020393B4(void);
BOOL sub_02039274(void);
void sub_02039330(void);
BOOL sub_020392A0(void);
UnkStruct_ov44_0223197C* sub_020396FC(SaveData*, int);
void sub_02039378(void);
void sub_020381C0(void (*func)(), int a1);
BOOL sub_02037D78(void);
BOOL sub_02039918(void);
BOOL sub_020393C8(void);
BOOL sub_020395B0(void);
BOOL sub_020397FC(void);

void sub_020399A4(s8 arg0);
u8 sub_020399B8(void);
void sub_020399DC(u32 errorCode);
void sub_020399EC(void);
void sub_020399FC(void);
void sub_02039A00(void);
BOOL sub_02039AD8(int arg0);
void sub_02039AF8(void);
void sub_02039B18(void);
void sub_02039B38(void);
void sub_02039B58(void);
void sub_02039B7C(void);
void sub_02039BA0(void);
void sub_02039C14(void);
void sub_02039C60(void);
s32 sub_02039C6C(s32 arg0);
s32 sub_02039D08(void);
int sub_02039D3C(void);
void sub_02039D54(s32* arg0);
void sub_02039D78(void);
void sub_02039D8C(void);
void sub_02039DC0(void);
void sub_02039DC4(void);
void sub_02039DE4(void);
void sub_02039E30(void);
void sub_02039E7C(void);
void sub_02039E9C(void);
void sub_02039EAC(s32* arg0);
s32 sub_02039EB4(SaveData* arg0, s32 arg1, u32* arg2);
void sub_02039F68(SaveWiFiHistory* arg0);
void sub_02039FB8(SaveWiFiHistory* arg0, s32 arg1, s32 arg2, u8 arg3);
s32 sub_02039FD8(enum HeapID arg0);
s32 sub_02039FFC(enum HeapID arg0);
void sub_0203A01C(UnkStruct_021D2230* arg0);
int sub_0203A040(UnkStruct_021D2230* arg0);
BOOL sub_0203A05C(SaveData* arg0);
s32 sub_0203A084(SaveData* arg0, DWCFriendData* arg1, s32* arg2);
int sub_0203A128(SaveData* arg0, u64 arg1, int* arg2);
s32 sub_0203A1C4(SaveData* arg0, s32* arg1, enum HeapID arg2);
void sub_0203A280(SaveData* arg0, s32 arg1, s32 arg2, enum HeapID arg3, u32 arg4);
s32 sub_0203A378(SaveData* arg0, s32 arg1);

void sub_0203960C(void);
void sub_02038E90(void);
void sub_02038EB4(void);
void sub_02038EB0(void);
void sub_0203847C(void);

#endif // POKEHEARTGOLD_UNK_02037C94_H
