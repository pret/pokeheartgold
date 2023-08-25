#include "global.h"
#include "friend_group.h"
#include "roamer.h"
#include "sav_system_info.h"
#include "save_misc_data.h"
#include "script.h"
#include "sys_vars.h"
#include "constants/sprites.h"
#include "unk_02055418.h"
#include "unk_02092BE8.h"
#include "unk_02066EDC.h"
#include "unk_0202C730.h"
#include "unk_0202CA24.h"
#include "unk_02031B0C.h"
#include "unk_02097268.h"
#include "unk_02031904.h"
#include "fieldmap.h"
#include "unk_0206D494.h"
#include "overlay_01.h"
#include "apricorn_tree.h"
#include "unk_0201F4C4.h"
#include "field_map_object.h"

void FieldSystem_StartBugContestTimer(FieldSystem* fieldSystem) {
    RTCDate date;
    RTCTime time;
    SysInfo_RTC *sysinfo = Save_SysInfo_RTC_Get(fieldSystem->saveData);
    if (!sysinfo->initialized) {
        return;
    }
    GF_RTC_CopyDateTime(&date, &time);
    sub_02055450(fieldSystem, sysinfo, &date);
    sub_02055478(fieldSystem, sysinfo, &date, &time);
}

void sub_02055450(FieldSystem* fieldSystem, SysInfo_RTC *sysinfo, RTCDate* date) {
    u32 day = RTC_ConvertDateToDay(date);
    if (day < (u32)(sysinfo->days_since_nitro_epoch)) {
        sysinfo->days_since_nitro_epoch = day;
        return;
    }
    if (day <= sysinfo->days_since_nitro_epoch) {
        return;
    }
    sub_02055508(fieldSystem, day - sysinfo->days_since_nitro_epoch);
    sysinfo->days_since_nitro_epoch = day;
}

void sub_02055478(FieldSystem* fieldSystem, SysInfo_RTC *sysinfo, RTCDate* date, RTCTime* time) {
    s64 seconds = RTC_ConvertDateTimeToSecond(date, time);
    s64 sys_seconds = RTC_ConvertDateTimeToSecond(&sysinfo->date, &sysinfo->time);
    if (seconds < sys_seconds) {
        sysinfo->date = *date;
        sysinfo->time = *time;
        return;
    }
    s32 delta_seconds = seconds - sys_seconds;
    if (delta_seconds > 0) {
        sub_02092F30(FieldSystem_GetGearPhoneRingManager(fieldSystem), seconds);
    }
    s32 minutes = delta_seconds / 60;
    if (minutes <= 0) {
        return;
    }
    Save_SysInfo_RTC_SubField34(sysinfo, minutes);
    sub_020555B4(fieldSystem, minutes, time);
    sysinfo->date = *date;
    sysinfo->time = *time;
}

void sub_02055508(FieldSystem* fieldSystem, int unkA) {
    BOOL unkFlag = sub_02055670(fieldSystem);
    ClearDailyFlags(fieldSystem);
    sub_0206759C(fieldSystem->saveData, unkA); //reset badge shininess..?
    sub_0202C78C(Save_FriendGroup_Get(fieldSystem->saveData), unkA);
    Roamers_SetRand(Save_Roamers_Get(fieldSystem->saveData), sub_0202C7DC(Save_FriendGroup_Get(fieldSystem->saveData)));
    Party_UpdatePokerus(SaveArray_Party_Get(fieldSystem->saveData), unkA);
    Save_LCRNGAdvanceLotoID(fieldSystem->saveData, (u16) unkA);
    sub_02066D60(fieldSystem->saveData);
    sub_020674BC(fieldSystem->saveData);
    sub_0202CB6C(sub_0202CA44(fieldSystem->saveData));
    sub_020556B8(fieldSystem);
    sub_0202F294(SaveData_GetMomsSavingsAddr(fieldSystem->saveData), unkA);
    if (!unkFlag) {
        sub_02031CCC(Save_ApricornBox_Get(fieldSystem->saveData), unkA);
        sub_0209730C(fieldSystem->saveData, unkA);
    }
    sub_02031AE4(Save_Pokeathlon_Get(fieldSystem->saveData));
    Save_VarsFlags_UpdateBuenasPasswordSet(Save_VarsFlags_Get(fieldSystem->saveData));
}

void sub_020555B4(FieldSystem* fieldSystem, u32 unkA, RTCTime* time) {
    sub_02092E34(FieldSystem_GetGearPhoneRingManager(fieldSystem), unkA, 0);
    FieldSystem_IncrementBugContestTimer(fieldSystem, unkA);
    Party_TryResetShaymin(SaveArray_Party_Get(fieldSystem->saveData), unkA, time);
}

TIMEOFDAY Field_GetTimeOfDay(FieldSystem* fieldSystem) {
    return GF_RTC_GetTimeOfDayByHour(Save_SysInfo_RTC_Get(fieldSystem->saveData)->time.hour);
}

TimeOfDayWildParam Field_GetTimeOfDayWildParam(FieldSystem* fieldSystem) {
    return GF_RTC_GetTimeOfDayWildParamByHour(Save_SysInfo_RTC_Get(fieldSystem->saveData)->time.hour);
}

u32 Field_GetMonth(FieldSystem* fieldSystem) {
    return Save_SysInfo_RTC_Get(fieldSystem->saveData)->date.month;
}

u32 Field_GetDay(FieldSystem* fieldSystem) {
    return Save_SysInfo_RTC_Get(fieldSystem->saveData)->date.day;
}

u32 Field_GetHour(FieldSystem* fieldSystem) {
    return Save_SysInfo_RTC_Get(fieldSystem->saveData)->time.hour;
}

void sub_02055624(FieldSystem* fieldSystem, RTCDate* date, RTCTime* time) {
    SysInfo_RTC *sysinfo = Save_SysInfo_RTC_Get(fieldSystem->saveData);
    RTC_ConvertSecondToDateTime(date, time, sysinfo->seconds_since_nitro_epoch);
}

void FieldSystem_GetGameClearTime(FieldSystem* fieldSystem, RTCDate* date, RTCTime* time) {
    SysInfo_RTC *sysinfo = Save_SysInfo_RTC_Get(fieldSystem->saveData);
    RTC_ConvertSecondToDateTime(date, time, sysinfo->seconds_at_game_clear);
}

void FieldSystem_SetGameClearTime(FieldSystem* fieldSystem) {
    SysInfo_RTC *sysinfo = Save_SysInfo_RTC_Get(fieldSystem->saveData);
    sysinfo->seconds_at_game_clear = GF_RTC_DateTimeToSec();
}

BOOL sub_02055670(FieldSystem* fieldSystem) {
    SysInfo_RTC *sysinfo = Save_SysInfo_RTC_Get(fieldSystem->saveData);
    return sub_02028E1C(sysinfo);
}

UnkStruct_020556FC * sub_02055680(FieldSystem *fieldSystem, HeapID heapID) {
    UnkStruct_020556FC* unkPtr = AllocFromHeap(heapID, sizeof(UnkStruct_020556FC));
    MI_CpuClear8(unkPtr, sizeof(UnkStruct_020556FC));
    unkPtr->heapID = heapID;
    sub_020556C8(fieldSystem, unkPtr);
    return unkPtr;
}

void sub_020556A8(UnkStruct_020556FC *unkPtr) {
    sub_020556FC(unkPtr);
    FreeToHeap(unkPtr);
}

void sub_020556B8(FieldSystem* fieldSystem) {
    APRICORN_TREE* trees = Save_FieldApricornTrees_Get(fieldSystem->saveData);
    sub_0202AE74(trees);
}

void sub_020556C8(FieldSystem *fieldSystem, UnkStruct_020556FC *unkPtrB) {
    void* unkB = fieldSystem->unk_44;
    unkPtrB->unk5c = AllocFromHeap(unkPtrB->heapID, ov01_021F149C(unkB, 31));
    ov01_021F14A8(unkB, 31, unkPtrB->unk5c);
    sub_0201F51C(&unkPtrB->unk4, &unkPtrB->unk58, &unkPtrB->unk5c);
}

void sub_020556FC(struct UnkStruct_020556FC *unkPtr) {
    ov01_021F1448(unkPtr->unk5c); //function frees unk5c to heap
}

BOOL sub_02055708(FieldSystem* fieldSystem, LocalMapObject* mapObject) {
    if (mapObject == NULL) {
        return FALSE;
    }
    u32 id = MapObject_GetGfxID(mapObject);
    if (id != SPRITE_BONGURI_R &&
        id != SPRITE_BONGURI_Y &&
        id != SPRITE_BONGURI_B &&
        id != SPRITE_BONGURI_G &&
        id != SPRITE_BONGURI_P &&
        id != SPRITE_BONGURI_W &&
        id != SPRITE_BONGURI_BK) {
        return FALSE;
    }
    if (sub_02055780(fieldSystem, mapObject) != TRUE) {
        return FALSE;
    }
    return TRUE;
}

BOOL sub_02055760(FieldSystem* fieldSystem, LocalMapObject* mapObj) {
    sub_0202AE68(Save_FieldApricornTrees_Get(fieldSystem->saveData), MapObject_GetParam(mapObj, 0));
    return TRUE;
}

BOOL sub_02055780(FieldSystem* fieldSystem, LocalMapObject* mapObj) {
    APRICORN_TREE* trees = Save_FieldApricornTrees_Get(fieldSystem->saveData);
    int idx = MapObject_GetParam(mapObj, 0);
    return sub_0202AE38(trees, idx);
}

u32 FieldSystem_ApricornTree_TryGetApricorn(FieldSystem* fieldSystem, LocalMapObject* mapObject) {
    return ApricornTrees_TryGetApricorn(Save_FieldApricornTrees_Get(fieldSystem->saveData), MapObject_GetParam(mapObject, 0));
}

int FieldSystem_ApricornTree_GetApricorn(FieldSystem* fieldSystem, LocalMapObject* mapObject) {
    return ApricornTrees_GetApricorn(Save_FieldApricornTrees_Get(fieldSystem->saveData), MapObject_GetParam(mapObject, 0));
}
