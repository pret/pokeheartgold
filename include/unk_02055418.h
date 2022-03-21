#ifndef POKEHEARTGOLD_UNK_02055418_H
#define POKEHEARTGOLD_UNK_02055418_H

#include "sav_system_info.h"
#include "script.h"

typedef struct UnkStruct_020556FC {
    u32 unk0;
    u32 unk4;
    u8 unk8[0x3c];
    u32* unk44;
    u8 unk48[0x10];
    u32 unk58;
    u32 unk5c;
} UnkStruct_020556FC; //size 0x60

void FieldSys_StartBugContestTimer(FieldSystem* fsys);
void sub_02055450(FieldSystem* fsys, SYSINFO_RTC* sysinfo,  RTCDate* date);
void sub_02055478(FieldSystem* fsys, SYSINFO_RTC* sysinfo, RTCDate* date, RTCTime* time);
void sub_02055508(FieldSystem* fsys, int unkA);
void sub_020555B4(FieldSystem* fsys, u32 unkA, RTCTime* time);
TIMEOFDAY Field_GetTimeOfDay(FieldSystem *fsys);
TimeOfDayWildParam Field_GetTimeOfDayWildParam(FieldSystem* fsys);
u32 Field_GetMonth(FieldSystem* fsys);
u32 Field_GetDay(FieldSystem* fsys);
u32 Field_GetHour(FieldSystem* fsys);
void sub_02055624(FieldSystem* fsys, RTCDate* date, RTCTime* time);
void sub_02055640(FieldSystem* fsys, RTCDate* date, RTCTime* time);
void sub_0205565C(FieldSystem* fsys);
BOOL sub_02055670(FieldSystem *fsys);
UnkStruct_020556FC* sub_02055680(UnkStruct_020556FC* unkA, u32 unkB);
void sub_020556A8(UnkStruct_020556FC* unkPtr);
void sub_020556B8(FieldSystem* fsys);
void sub_020556C8(UnkStruct_020556FC* unkPtrA, UnkStruct_020556FC* unkPtrB);
void sub_020556FC(UnkStruct_020556FC* unkPtr);
BOOL sub_02055708(FieldSystem* fsys, LocalMapObject* mapObject);
BOOL sub_02055760(FieldSystem* fsys, LocalMapObject* mapObj);
BOOL sub_02055780(FieldSystem* fsys, LocalMapObject* mapObj);
u32 sub_020557A0(FieldSystem* fsys, LocalMapObject* mapObject);
int FieldSys_ApricornTree_GetApricorn(FieldSystem* fsys, LocalMapObject* mapObject);

#endif //POKEHEARTGOLD_UNK_02055418_H
