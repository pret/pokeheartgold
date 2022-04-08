#ifndef NITRO_RTC_CONVERT_H_
#define NITRO_RTC_CONVERT_H_

s64 RTC_ConvertDateTimeToSecond(const RTCDate *date, const RTCTime *time);
s32 RTC_ConvertDateToDay(const RTCDate *date);
void RTC_ConvertSecondToDateTime(RTCDate *date, RTCTime *time, s64 sec);

#endif //NITRO_RTC_CONVERT_H_
