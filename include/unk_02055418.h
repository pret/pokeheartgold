#ifndef POKEHEARTGOLD_UNK_02055418_H
#define POKEHEARTGOLD_UNK_02055418_H

#include "heap.h"
#include "sav_system_info.h"
#include "script.h"

typedef struct UnkStruct_020556FC {
    HeapID heapID;
    NNSG3dRenderObj unk4;
    NNSG3dResMdl *unk58;
    NNSG3dResFileHeader *unk5c;
} UnkStruct_020556FC; // size 0x60

void FieldSystem_StartBugContestTimer(FieldSystem *fieldSystem);
void sub_02055450(FieldSystem *fieldSystem, SysInfo_RTC *sysinfo, RTCDate *date);
void sub_02055478(FieldSystem *fieldSystem, SysInfo_RTC *sysinfo, RTCDate *date, RTCTime *time);
void sub_02055508(FieldSystem *fieldSystem, int unkA);
void sub_020555B4(FieldSystem *fieldSystem, u32 unkA, RTCTime *time);
TIMEOFDAY Field_GetTimeOfDay(FieldSystem *fieldSystem);
TimeOfDayWildParam Field_GetTimeOfDayWildParam(FieldSystem *fieldSystem);
u32 Field_GetMonth(FieldSystem *fieldSystem);
u32 Field_GetDay(FieldSystem *fieldSystem);
u32 Field_GetHour(FieldSystem *fieldSystem);
void sub_02055624(FieldSystem *fieldSystem, RTCDate *date, RTCTime *time);
void FieldSystem_GetGameClearTime(FieldSystem *fieldSystem, RTCDate *date, RTCTime *time);
void FieldSystem_SetGameClearTime(FieldSystem *fieldSystem);
BOOL sub_02055670(FieldSystem *fieldSystem);
UnkStruct_020556FC *sub_02055680(FieldSystem *fieldSystem, HeapID heapID);
void sub_020556A8(UnkStruct_020556FC *unkPtr);
void sub_020556B8(FieldSystem *fieldSystem);
void sub_020556C8(FieldSystem *fieldSystem, UnkStruct_020556FC *unkPtrB);
void sub_020556FC(struct UnkStruct_020556FC *unkPtr);
BOOL sub_02055708(FieldSystem *fieldSystem, LocalMapObject *mapObject);
BOOL sub_02055760(FieldSystem *fieldSystem, LocalMapObject *mapObj);
BOOL sub_02055780(FieldSystem *fieldSystem, LocalMapObject *mapObj);
u32 FieldSystem_ApricornTree_TryGetApricorn(FieldSystem *fieldSystem, LocalMapObject *mapObject);
int FieldSystem_ApricornTree_GetApricorn(FieldSystem *fieldSystem, LocalMapObject *mapObject);

#endif // POKEHEARTGOLD_UNK_02055418_H
