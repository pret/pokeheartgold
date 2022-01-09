#ifndef POKEHEARTGOLD_GF_RTC_H
#define POKEHEARTGOLD_GF_RTC_H

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
} TimeOfDayWildParam;

BOOL IsNighttime(void);
void GF_RTC_CopyTime(RTCTime *time);
void GF_RTC_CopyDate(RTCDate *date);
s64 GF_RTC_DateTimeToSec(void);
void GF_RTC_CopyDateTime(RTCDate *date, RTCTime *time);
TIMEOFDAY GF_RTC_GetTimeOfDay(void);
TIMEOFDAY GF_RTC_GetTimeOfDayByHour(s32 hour);
TimeOfDayWildParam GF_RTC_GetTimeOfDayWildParam(void);
TimeOfDayWildParam GF_RTC_GetTimeOfDayWildParamByHour(s32 hour);

#endif //POKEHEARTGOLD_GF_RTC_H
