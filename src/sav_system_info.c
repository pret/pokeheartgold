#include <nitro/mi/memory.h>
#include <nitro/os/ownerInfo.h>
#include <nitro/rtc/ARM9/convert.h>
#include "gf_rtc.h"
#include "sav_system_info.h"

u32 Sav2_SysInfo_sizeof(void) {
    return sizeof(SYSINFO);
}

void Sav2_SysInfo_init(SYSINFO* sys_info) {
    MI_CpuClearFast(sys_info, sizeof(SYSINFO));
    Sav2_SysInfo_RTC_init(&sys_info->rtc_info);
}

SYSINFO* Sav2_SysInfo_get(SAVEDATA* savedata) {
    return SavArray_get(savedata, SAVE_SYSINFO);
}

SYSINFO_RTC* Sav2_SysInfo_RTC_get(SAVEDATA* savedata) {
    SYSINFO* sys_info = Sav2_SysInfo_get(savedata);
    return &sys_info->rtc_info;
}

void Sav2_SysInfo_InitFromSystem(SYSINFO* sys_info) {
    OSOwnerInfo owner_info;

    sys_info->rtc_offset = OS_GetOwnerRtcOffset();
    OS_GetMacAddress(sys_info->mac_address);
    OS_GetOwnerInfo(&owner_info);
    sys_info->birth_month = owner_info.birthday.month;
    sys_info->birth_day = owner_info.birthday.day;
}

BOOL Sav2_SysInfo_MacAddressIsMine(SYSINFO* sys_info) {
    u8 mac_address[6];
    OS_GetMacAddress(mac_address);

    for (s32 i = 0; i < (s32)NELEMS(mac_address); i++) {
        if (mac_address[i] != sys_info->mac_address[i]) {
            return FALSE;
        }
    }

    return TRUE;
}

BOOL Sav2_SysInfo_RTCOffsetIsMine(SYSINFO* sys_info) {
    return sys_info->rtc_offset == OS_GetOwnerRtcOffset();
}

u8 Sav2_SysInfo_GetBirthMonth(SYSINFO* sys_info) {
    return sys_info->birth_month;
}

u8 Sav2_SysInfo_GetBirthDay(SYSINFO* sys_info) {
    return sys_info->birth_day;
}

u8 Sav2_SysInfo_GetField48(SYSINFO* sys_info) {
    return sys_info->unk48;
}

void Sav2_SysInfo_SetField48(SYSINFO* sys_info, u8 a1) {
    sys_info->unk48 = a1;
}

void* Sav2_SysInfo_GetField4C(SYSINFO* sys_info) {
    return sys_info->unk4C;
}

void Sav2_SysInfo_SetField4C(SYSINFO* sys_info, void* a1) {
    if (sys_info->unk4C == NULL) {
        sys_info->unk4C = a1;
    }
}

void Sav2_SysInfo_RTC_init(SYSINFO_RTC* rtc_info) {
    rtc_info->initialized = TRUE;
    GF_RTC_CopyDateTime(&rtc_info->date, &rtc_info->time);
    rtc_info->days_since_nitro_epoch = RTC_ConvertDateToDay(&rtc_info->date);
    rtc_info->seconds_since_nitro_epoch = RTC_ConvertDateTimeToSecond(&rtc_info->date, &rtc_info->time);
    rtc_info->unk2C = 0;
    rtc_info->unk34 = 0;
}

BOOL sub_02028E1C(SYSINFO_RTC* rtc_info) {
    return rtc_info->unk34 != 0;
}

void Sav2_SysInfo_RTC_SubField34(SYSINFO_RTC* rtc_info, u32 a1) {
    if (rtc_info->unk34 > 1440) {
        rtc_info->unk34 = 1440;
    }

    if (rtc_info->unk34 < a1) {
        rtc_info->unk34 = 0;
        return;
    }

    rtc_info->unk34 -= a1;
}

void SysInfoRTC_HandleContinueOnNewConsole(SYSINFO_RTC* rtc_info) {
    rtc_info->unk34 = 1440;
    GF_RTC_CopyDateTime(&rtc_info->date, &rtc_info->time);
    rtc_info->days_since_nitro_epoch = RTC_ConvertDateToDay(&rtc_info->date);
}
