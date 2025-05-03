#ifndef POKEHEARTGOLD_GF_RTC_H
#define POKEHEARTGOLD_GF_RTC_H

#include <nitro/rtc/ARM9/api.h>

#include "system.h"

typedef enum RTC_TimeOfDay {
    RTC_TIMEOFDAY_MORN = 0,
    RTC_TIMEOFDAY_DAY,
    RTC_TIMEOFDAY_EVE,
    RTC_TIMEOFDAY_NITE,
    RTC_TIMEOFDAY_LATE,
} TIMEOFDAY;

typedef enum TimeOfDayWildParam {
    TIMEOFDAY_WILD_MORN,
    TIMEOFDAY_WILD_DAY,
    TIMEOFDAY_WILD_NITE,
    TIMEOFDAY_WILD_MAX,
} TimeOfDayWildParam;

struct GF_RTC_DateTime {
    RTCDate date;
    RTCTime time;
};

BOOL IsNighttime(void);
void GF_RTC_CopyTime(RTCTime *time);
void GF_RTC_CopyDate(RTCDate *date);
s64 GF_RTC_DateTimeToSec(void);
void GF_RTC_CopyDateTime(RTCDate *date, RTCTime *time);
TIMEOFDAY GF_RTC_GetTimeOfDay(void);
TIMEOFDAY GF_RTC_GetTimeOfDayByHour(s32 hour);
TimeOfDayWildParam GF_RTC_GetTimeOfDayWildParam(void);
TimeOfDayWildParam GF_RTC_GetTimeOfDayWildParamByHour(s32 hour);
void GF_InitRTCWork(void);
void GF_RTC_UpdateOnFrame(void);
s32 GF_RTC_TimeToSec(void);
s32 GF_RTC_GetDayOfYear(const RTCDate *date);
s64 GF_RTC_TimeDelta(s64 first, s64 last);
void GF_RTC_UnfreezeTime(void);
void GF_RTC_SetAndFreezeTime(s32 hour, s32 minute);

// doesn't match as a static inline
#define RngSeedFromRTC() ({                                                                                                                      \
    RTCDate date;                                                                                                                                \
    RTCTime time;                                                                                                                                \
    GF_RTC_CopyDateTime(&date, &time);                                                                                                           \
    date.year + date.month * 0x100 * date.day * 0x10000 + time.hour * 0x10000 + (time.minute + time.second) * 0x1000000 + gSystem.vblankCounter; \
})

#endif // POKEHEARTGOLD_GF_RTC_H
