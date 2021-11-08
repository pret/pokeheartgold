#ifndef NITRO_RTC_API_H_
#define NITRO_RTC_API_H_

typedef enum {
    RTC_WEEK_SUNDAY,
    RTC_WEEK_MONDAY,
    RTC_WEEK_TUESDAY,
    RTC_WEEK_WEDNESDAY,
    RTC_WEEK_THURDDAY,
    RTC_WEEK_FRIDAY,
    RTC_WEEK_SATURDAY,
} RTCWeek;

typedef struct {
    u32 year;
    u32 month;
    u32 day;
    RTCWeek week;
} RTCDate;

#endif //NITRO_RTC_API_H_
