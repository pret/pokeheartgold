#include "gf_rtc.h"

#include "global.h"

#define MAX_SECONDS (3155759999ll)

struct GFRtcWork {
    BOOL getDateTimeSuccess;
    BOOL getDateTimeLock;
    s32 getDateTimeSleep;
    RTCResult getDateTimeErrorCode;
    RTCDate date;       // 10
    RTCTime time;       // 20
    RTCDate date_async; // 2C
    RTCTime time_async; // 3C

    // used for rendering photos
    s32 frozenTimeState; // 3: in photo state; 0: normal operation
    RTCTime frozenTime;  // when frozenTimeState is 3, this is the time returned
};

struct GFRtcWork sRTCWork;

static void GF_RTC_GetDateTime(struct GFRtcWork *work);
static void GF_RTC_UnfreezeTimeInternal(struct GFRtcWork *work);

static inline RTCDate *getDate(struct GFRtcWork *work) {
    return &work->date;
}

static inline RTCTime *getTime(struct GFRtcWork *work) {
    return (work->frozenTimeState == 3) ? &work->frozenTime : &work->time;
}

void GF_InitRTCWork(void) {
    RTC_Init();
    memset(&sRTCWork, 0, sizeof(sRTCWork));
    sRTCWork.getDateTimeSuccess = FALSE;
    sRTCWork.getDateTimeLock = FALSE;
    sRTCWork.getDateTimeSleep = 0;
    GF_RTC_GetDateTime(&sRTCWork);
    GF_RTC_UnfreezeTimeInternal(&sRTCWork);
}

void GF_RTC_UpdateOnFrame(void) {
    if (!sRTCWork.getDateTimeLock && ++sRTCWork.getDateTimeSleep > 10) {
        sRTCWork.getDateTimeSleep = 0;
        GF_RTC_GetDateTime(&sRTCWork);
    }
}

static void GF_RTC_GetDateTime_Callback(RTCResult result, void *arg) {
    struct GFRtcWork *work = arg;
    work->getDateTimeErrorCode = result;
    GF_ASSERT(result == RTC_RESULT_SUCCESS);
    work->getDateTimeSuccess = TRUE;
    work->date = work->date_async;
    work->time = work->time_async;
    work->getDateTimeLock = FALSE;
}

static void GF_RTC_GetDateTime(struct GFRtcWork *work) {
    work->getDateTimeLock = TRUE;
    work->getDateTimeErrorCode = RTC_GetDateTimeAsync(&work->date_async, &work->time_async, GF_RTC_GetDateTime_Callback, work);
    GF_ASSERT(work->getDateTimeErrorCode == RTC_RESULT_SUCCESS);
}

static void GF_RTC_SetAndFreezeTimeInternal(struct GFRtcWork *work, s32 hour, s32 minute) {
    work->frozenTimeState = 3;
    work->frozenTime.hour = hour;
    work->frozenTime.minute = minute;
}

static void GF_RTC_UnfreezeTimeInternal(struct GFRtcWork *work) {
    work->frozenTimeState = 0;
}

void GF_RTC_CopyDateTime(RTCDate *date, RTCTime *time) {
    GF_ASSERT(sRTCWork.getDateTimeSuccess == TRUE);
    *date = *getDate(&sRTCWork);
    *time = *getTime(&sRTCWork);
}

void GF_RTC_CopyTime(RTCTime *time) {
    GF_ASSERT(sRTCWork.getDateTimeSuccess == TRUE);
    *time = *getTime(&sRTCWork);
}

void GF_RTC_CopyDate(RTCDate *date) {
    GF_ASSERT(sRTCWork.getDateTimeSuccess == TRUE);
    *date = *getDate(&sRTCWork);
}

s32 GF_RTC_TimeToSec(void) {
    RTCTime *time = getTime(&sRTCWork);
    return 60 * time->minute + 3600 * time->hour + time->second;
}

s64 GF_RTC_DateTimeToSec(void) {
    return RTC_ConvertDateTimeToSecond(getDate(&sRTCWork), getTime(&sRTCWork));
}

static inline BOOL IsLeapYear(s32 year) {
    return ((year % 4) == 0 && (year % 100) != 0) || ((year % 400) == 0);
}

s32 GF_RTC_GetDayOfYear(const RTCDate *date) {
    s32 days;
    static const u16 sGF_DaysPerMonth[] = {
        0,   // Jan
        31,  // Feb
        59,  // Mar
        90,  // Apr
        120, // May
        151, // Jun
        181, // Jul
        212, // Aug
        243, // Sep
        273, // Oct
        304, // Nov
        334, // Dec
    };
    days = date->day;
    days += sGF_DaysPerMonth[date->month - 1];
    if (date->month >= 3 && IsLeapYear(date->year)) {
        days++;
    }
    //    {
    //        int check;
    //        date_stack = *date;
    //        date_stack.month = 1;
    //        date_stack.day = 1;
    //        check = RTC_ConvertDateToDay(date) - RTC_ConvertDateToDay(&date_stack);
    //        if (check + 1 != days) {
    //            OS_Printf("%d(Nitro) != %d(InHouse)", check + 1, days);
    //        }
    //        GF_ASSERT(check + 1 == days);
    //    }
    return days;
}

BOOL IsNighttime(void) {
    switch (GF_RTC_GetTimeOfDay()) {
    case RTC_TIMEOFDAY_NITE:
    case RTC_TIMEOFDAY_LATE:
        return TRUE;
    default:
        return FALSE;
    }
}

TIMEOFDAY GF_RTC_GetTimeOfDay(void) {
    RTCTime time;
    GF_RTC_CopyTime(&time);
    return GF_RTC_GetTimeOfDayByHour(time.hour);
}

TimeOfDayWildParam GF_RTC_GetTimeOfDayWildParam(void) {
    RTCTime time;
    GF_RTC_CopyTime(&time);
    return GF_RTC_GetTimeOfDayWildParamByHour(time.hour);
}

TIMEOFDAY GF_RTC_GetTimeOfDayByHour(s32 hour) {
    static const u8 sTimeOfDayByHour[24] = {
        RTC_TIMEOFDAY_LATE,
        RTC_TIMEOFDAY_LATE,
        RTC_TIMEOFDAY_LATE,
        RTC_TIMEOFDAY_LATE,
        RTC_TIMEOFDAY_MORN,
        RTC_TIMEOFDAY_MORN,
        RTC_TIMEOFDAY_MORN,
        RTC_TIMEOFDAY_MORN,
        RTC_TIMEOFDAY_MORN,
        RTC_TIMEOFDAY_MORN,
        RTC_TIMEOFDAY_DAY,
        RTC_TIMEOFDAY_DAY,
        RTC_TIMEOFDAY_DAY,
        RTC_TIMEOFDAY_DAY,
        RTC_TIMEOFDAY_DAY,
        RTC_TIMEOFDAY_DAY,
        RTC_TIMEOFDAY_DAY,
        RTC_TIMEOFDAY_EVE,
        RTC_TIMEOFDAY_EVE,
        RTC_TIMEOFDAY_EVE,
        RTC_TIMEOFDAY_NITE,
        RTC_TIMEOFDAY_NITE,
        RTC_TIMEOFDAY_NITE,
        RTC_TIMEOFDAY_NITE,
    };

    GF_ASSERT(hour >= 0 && hour < 24);
    return (TIMEOFDAY)sTimeOfDayByHour[hour];
}

TimeOfDayWildParam GF_RTC_GetTimeOfDayWildParamByHour(s32 hour) {
    switch (GF_RTC_GetTimeOfDayByHour(hour)) {
    case RTC_TIMEOFDAY_MORN:
        return TIMEOFDAY_WILD_MORN;
    case RTC_TIMEOFDAY_DAY:
    case RTC_TIMEOFDAY_EVE:
        return TIMEOFDAY_WILD_DAY;
    default:
        return TIMEOFDAY_WILD_NITE;
    }
}

s64 GF_RTC_TimeDelta(s64 first, s64 last) {
    RTCDate maxDate = { 99, 12, 31, RTC_WEEK_SUNDAY };
    RTCTime maxTime = { 23, 59, 59 };

    s64 check = RTC_ConvertDateTimeToSecond(&maxDate, &maxTime);
    GF_ASSERT(check == MAX_SECONDS);
    if (first < last) {
        return last - first;
    } else {
        return last + (MAX_SECONDS - first);
    }
}

void GF_RTC_UnfreezeTime(void) {
    GF_RTC_UnfreezeTimeInternal(&sRTCWork);
}

void GF_RTC_SetAndFreezeTime(s32 hour, s32 minute) {
    GF_RTC_SetAndFreezeTimeInternal(&sRTCWork, hour, minute);
}
