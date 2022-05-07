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
#include "save_pokeathlon.h"
#include "fieldmap.h"
#include "unk_0206D494.h"
#include "overlay_01.h"
#include "apricorn_tree.h"
#include "unk_0201F4C4.h"
#include "field_map_object.h"

void FieldSys_StartBugContestTimer(FieldSystem* fsys) {
    RTCDate date;
    RTCTime time;
    SYSINFO_RTC* sysinfo = Sav2_SysInfo_RTC_get(fsys->savedata); 
    if (!sysinfo->initialized) {
        return;
    }
    GF_RTC_CopyDateTime(&date, &time);
    sub_02055450(fsys, sysinfo, &date);
    sub_02055478(fsys, sysinfo, &date, &time);
}

void sub_02055450(FieldSystem* fsys, SYSINFO_RTC* sysinfo, RTCDate* date) {
    u32 day = RTC_ConvertDateToDay(date);
    if (day < (u32)(sysinfo->days_since_nitro_epoch)) {
        sysinfo->days_since_nitro_epoch = day;
        return;
    }
    if (day <= sysinfo->days_since_nitro_epoch) {
        return;
    }
    sub_02055508(fsys, day - sysinfo->days_since_nitro_epoch);
    sysinfo->days_since_nitro_epoch = day;
}

void sub_02055478(FieldSystem* fsys, SYSINFO_RTC* sysinfo, RTCDate* date, RTCTime* time) {
    s64 seconds = RTC_ConvertDateTimeToSecond(date, time); 
    s64 sys_seconds = RTC_ConvertDateTimeToSecond(&sysinfo->date, &sysinfo->time); 
    if (seconds < sys_seconds) {
        sysinfo->date = *date;
        sysinfo->time = *time;
        return;
    }
    s32 delta_seconds = seconds - sys_seconds;
    if (delta_seconds > 0) {
        sub_02092F30(Fsys_GetGearPhoneRingManager(fsys), seconds);
    }    
    s32 minutes = delta_seconds / 60;
    if (minutes <= 0) {
        return;
    }
    Sav2_SysInfo_RTC_SubField34(sysinfo, minutes);
    sub_020555B4(fsys, minutes, time);
    sysinfo->date = *date;
    sysinfo->time = *time;
}

void sub_02055508(FieldSystem* fsys, int unkA) {
    BOOL unkFlag = sub_02055670(fsys);
    ClearDailyFlags(fsys);
    sub_0206759C(fsys->savedata, unkA); //reset badge shininess..?
    sub_0202C78C(Save_FriendGroup_get(fsys->savedata), unkA);
    Roamers_SetRand(Save_Roamers_get(fsys->savedata), sub_0202C7DC(Save_FriendGroup_get(fsys->savedata)));
    Party_UpdatePokerus(SavArray_PlayerParty_get(fsys->savedata), unkA);
    Save_LCRNGAdvanceLotoID(fsys->savedata, (u16) unkA);
    sub_02066D60(fsys->savedata);
    sub_020674BC(fsys->savedata);
    sub_0202CB6C(sub_0202CA44(fsys->savedata));
    sub_020556B8(fsys);
    sub_0202F294(SaveData_GetMomsSavingsAddr(fsys->savedata), unkA);
    if (!unkFlag) {
        sub_02031CCC(Save_ApricornBox_get(fsys->savedata), unkA);
        sub_0209730C(fsys->savedata, unkA);
    }
    sub_02031AE4(Save_Pokeathlon_get(fsys->savedata));
    ScriptState_UpdateBuenasPasswordSet(SavArray_Flags_get(fsys->savedata));
}

void sub_020555B4(FieldSystem* fsys, u32 unkA, RTCTime* time) {
    sub_02092E34(Fsys_GetGearPhoneRingManager(fsys), unkA, 0);
    FieldSys_IncrementBugContestTimer(fsys, unkA);
    Party_TryResetShaymin(SavArray_PlayerParty_get(fsys->savedata), unkA, time);
}

TIMEOFDAY Field_GetTimeOfDay(FieldSystem* fsys) {
    return GF_RTC_GetTimeOfDayByHour(Sav2_SysInfo_RTC_get(fsys->savedata)->time.hour);
}

TimeOfDayWildParam Field_GetTimeOfDayWildParam(FieldSystem* fsys) {
    return GF_RTC_GetTimeOfDayWildParamByHour(Sav2_SysInfo_RTC_get(fsys->savedata)->time.hour);
}

u32 Field_GetMonth(FieldSystem* fsys) {
    return Sav2_SysInfo_RTC_get(fsys->savedata)->date.month;
}

u32 Field_GetDay(FieldSystem* fsys) { 
    return Sav2_SysInfo_RTC_get(fsys->savedata)->date.day;
}

u32 Field_GetHour(FieldSystem* fsys) {
    return Sav2_SysInfo_RTC_get(fsys->savedata)->time.hour;
}

void sub_02055624(FieldSystem* fsys, RTCDate* date, RTCTime* time) {
    SYSINFO_RTC* sysinfo = Sav2_SysInfo_RTC_get(fsys->savedata);
    RTC_ConvertSecondToDateTime(date, time, sysinfo->seconds_since_nitro_epoch);
}

void sub_02055640(FieldSystem* fsys, RTCDate* date, RTCTime* time) {
    SYSINFO_RTC* sysinfo = Sav2_SysInfo_RTC_get(fsys->savedata);
    RTC_ConvertSecondToDateTime(date, time, sysinfo->unk2C);
}

void sub_0205565C(FieldSystem* fsys) {
    SYSINFO_RTC* sysinfo = Sav2_SysInfo_RTC_get(fsys->savedata);
    sysinfo->unk2C = GF_RTC_DateTimeToSec();
}

BOOL sub_02055670(FieldSystem* fsys) {
    SYSINFO_RTC* sysinfo = Sav2_SysInfo_RTC_get(fsys->savedata);
    return sub_02028E1C(sysinfo);
}

UnkStruct_020556FC * sub_02055680(FieldSystem *fsys, HeapID heapID) {
    UnkStruct_020556FC* unkPtr = AllocFromHeap(heapID, sizeof(UnkStruct_020556FC));
    MI_CpuClear8(unkPtr, sizeof(UnkStruct_020556FC));
    unkPtr->heapID = heapID;
    sub_020556C8(fsys, unkPtr);
    return unkPtr;
}

void sub_020556A8(UnkStruct_020556FC *unkPtr) {
    sub_020556FC(unkPtr);
    FreeToHeap(unkPtr);
}

void sub_020556B8(FieldSystem* fsys) {
    APRICORN_TREE* trees = Sav2_FieldApricornTrees_get(fsys->savedata);
    sub_0202AE74(trees); 
}

void sub_020556C8(FieldSystem *fsys, UnkStruct_020556FC *unkPtrB) {
    void* unkB = fsys->unk_44;
    unkPtrB->unk5c = AllocFromHeap(unkPtrB->heapID, ov01_021F149C(unkB, 31));
    ov01_021F14A8(unkB, 31, unkPtrB->unk5c);
    sub_0201F51C(&unkPtrB->unk4, &unkPtrB->unk58, &unkPtrB->unk5c);
}

void sub_020556FC(struct UnkStruct_020556FC *unkPtr) {
    ov01_021F1448(unkPtr->unk5c); //function frees unk5c to heap
}

BOOL sub_02055708(FieldSystem* fsys, LocalMapObject* mapObject) {
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
    if (sub_02055780(fsys, mapObject) != TRUE) {
        return FALSE;
    }
    return TRUE;
}

BOOL sub_02055760(FieldSystem* fsys, LocalMapObject* mapObj) {
    sub_0202AE68(Sav2_FieldApricornTrees_get(fsys->savedata), MapObject_GetParam(mapObj, 0));
    return TRUE;
}

BOOL sub_02055780(FieldSystem* fsys, LocalMapObject* mapObj) {
    APRICORN_TREE* trees = Sav2_FieldApricornTrees_get(fsys->savedata);
    int idx = MapObject_GetParam(mapObj, 0);
    return sub_0202AE38(trees, idx);
}

u32 FieldSys_ApricornTree_TryGetApricorn(FieldSystem* fsys, LocalMapObject* mapObject) {
    return ApricornTrees_TryGetApricorn(Sav2_FieldApricornTrees_get(fsys->savedata), MapObject_GetParam(mapObject, 0));
}

int FieldSys_ApricornTree_GetApricorn(FieldSystem* fsys, LocalMapObject* mapObject) {
    return ApricornTrees_GetApricorn(Sav2_FieldApricornTrees_get(fsys->savedata), MapObject_GetParam(mapObject, 0));
}
