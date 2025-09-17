#include "sav_system_info.h"

#include <nitro/mi/memory.h>
#include <nitro/os/ownerInfo.h>
#include <nitro/rtc/ARM9/convert.h>

#include "global.h"

#include "gf_rtc.h"

u32 Save_SysInfo_sizeof(void) {
    return sizeof(SysInfo);
}

void Save_SysInfo_Init(SysInfo *sys_info) {
    MI_CpuClearFast(sys_info, sizeof(SysInfo));
    Save_SysInfo_RTC_Init(&sys_info->rtc_info);
}

SysInfo *Save_SysInfo_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_SYSINFO);
}

SysInfo_RTC *Save_SysInfo_RTC_Get(SaveData *saveData) {
    SysInfo *sys_info = Save_SysInfo_Get(saveData);
    return &sys_info->rtc_info;
}

void Save_SysInfo_InitFromSystem(SysInfo *sys_info) {
    OSOwnerInfo owner_info;

    sys_info->rtc_offset = OS_GetOwnerRtcOffset();
    OS_GetMacAddress(sys_info->mac_address);
    OS_GetOwnerInfo(&owner_info);
    sys_info->birth_month = owner_info.birthday.month;
    sys_info->birth_day = owner_info.birthday.day;
}

BOOL Save_SysInfo_MacAddressIsMine(SysInfo *sys_info) {
    u8 mac_address[6];
    OS_GetMacAddress(mac_address);

    for (s32 i = 0; i < (s32)NELEMS(mac_address); i++) {
        if (mac_address[i] != sys_info->mac_address[i]) {
            return FALSE;
        }
    }

    return TRUE;
}

BOOL Save_SysInfo_RTCOffsetIsMine(SysInfo *sys_info) {
    return sys_info->rtc_offset == OS_GetOwnerRtcOffset();
}

u8 Save_SysInfo_GetBirthMonth(SysInfo *sys_info) {
    return sys_info->birth_month;
}

u8 Save_SysInfo_GetBirthDay(SysInfo *sys_info) {
    return sys_info->birth_day;
}

u8 Save_SysInfo_GetMysteryGiftActive(SysInfo *sys_info) {
    return sys_info->mysteryGiftActive;
}

void Save_SysInfo_SetMysteryGiftActive(SysInfo *sys_info, u8 isActive) {
    sys_info->mysteryGiftActive = isActive;
}

s32 Save_SysInfo_GetDwcProfileId(SysInfo *sys_info) {
    return sys_info->dwcProfileId;
}

void Save_SysInfo_SetDwcProfileId(SysInfo *sys_info, s32 profileId) {
    if (sys_info->dwcProfileId == 0) {
        sys_info->dwcProfileId = profileId;
    }
}

void Save_SysInfo_RTC_Init(SysInfo_RTC *rtc_info) {
    rtc_info->initialized = TRUE;
    GF_RTC_CopyDateTime(&rtc_info->date, &rtc_info->time);
    rtc_info->days_since_nitro_epoch = RTC_ConvertDateToDay(&rtc_info->date);
    rtc_info->seconds_since_nitro_epoch = RTC_ConvertDateTimeToSecond(&rtc_info->date, &rtc_info->time);
    rtc_info->seconds_at_game_clear = 0;
    rtc_info->penaltyInMinutes = 0;
}

BOOL Save_SysInfo_RTC_HasPenalty(SysInfo_RTC *rtc_info) {
    return rtc_info->penaltyInMinutes != 0;
}

void Save_SysInfo_RTC_DecrementPenalty(SysInfo_RTC *rtc_info, u32 minutes) {
    if (rtc_info->penaltyInMinutes > 1440) {
        rtc_info->penaltyInMinutes = 1440;
    }

    if (rtc_info->penaltyInMinutes < minutes) {
        rtc_info->penaltyInMinutes = 0;
        return;
    }

    rtc_info->penaltyInMinutes -= minutes;
}

void SysInfoRTC_HandleContinueOnNewConsole(SysInfo_RTC *rtc_info) {
    rtc_info->penaltyInMinutes = 1440;
    GF_RTC_CopyDateTime(&rtc_info->date, &rtc_info->time);
    rtc_info->days_since_nitro_epoch = RTC_ConvertDateToDay(&rtc_info->date);
}
