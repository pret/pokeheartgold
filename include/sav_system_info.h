#ifndef POKEHEARTGOLD_SAV_SYSTEM_INFO_H
#define POKEHEARTGOLD_SAV_SYSTEM_INFO_H

#include <nitro/rtc/ARM9/api.h>

#include "save.h"

typedef struct SysInfo_RTC {
    BOOL initialized;
    RTCDate date;
    RTCTime time;
    s32 days_since_nitro_epoch;
    s64 seconds_since_nitro_epoch;
    s64 seconds_at_game_clear;
    u32 unk34;
} SysInfo_RTC;

typedef struct SysInfo {
    s64 rtc_offset;
    u8 mac_address[6];
    u8 birth_month;
    u8 birth_day;
    SysInfo_RTC rtc_info;
    u8 mysteryGiftActive;
    void *unk4C;
    u8 unk50[0xC];
} SysInfo;

u32 Save_SysInfo_sizeof(void);
void Save_SysInfo_Init(SysInfo *sys_info);
SysInfo *Save_SysInfo_Get(SaveData *saveData);
SysInfo_RTC *Save_SysInfo_RTC_Get(SaveData *saveData);
void Save_SysInfo_InitFromSystem(SysInfo *sys_info);
BOOL Save_SysInfo_MacAddressIsMine(SysInfo *sys_info);
BOOL Save_SysInfo_RTCOffsetIsMine(SysInfo *sys_info);
u8 Save_SysInfo_GetBirthMonth(SysInfo *sys_info);
u8 Save_SysInfo_GetBirthDay(SysInfo *sys_info);
u8 Save_SysInfo_GetMysteryGiftActive(SysInfo *sys_info);
void Save_SysInfo_SetMysteryGiftActive(SysInfo *sys_info, u8);
void *Save_SysInfo_GetField4C(SysInfo *sys_info);
void Save_SysInfo_SetField4C(SysInfo *sys_info, void *);
void Save_SysInfo_RTC_Init(SysInfo_RTC *rtc_info);
BOOL sub_02028E1C(SysInfo_RTC *rtc_info);
void Save_SysInfo_RTC_SubField34(SysInfo_RTC *rtc_info, u32);
void SysInfoRTC_HandleContinueOnNewConsole(SysInfo_RTC *rtc_info);

#endif
