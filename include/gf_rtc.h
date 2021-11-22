#ifndef POKEHEARTGOLD_GF_RTC_H
#define POKEHEARTGOLD_GF_RTC_H

s32 IsNighttime(void);
void GF_RTC_CopyTime(RTCTime *time);
void GF_RTC_CopyDate(RTCDate *date);
void GF_RTC_CopyDateTime(RTCDate *date, RTCTime *time);

#endif //POKEHEARTGOLD_GF_RTC_H
