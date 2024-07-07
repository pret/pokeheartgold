#ifndef POKEHEARTGOLD_FIELD_SYSTEM_RTC_WEATHER_H
#define POKEHEARTGOLD_FIELD_SYSTEM_RTC_WEATHER_H

#include "sav_system_info.h"
#include "save.h"
#include "script.h"

#define JANUARY   1
#define FEBRUARY  2
#define MARCH     3
#define APRIL     4
#define MAY       5
#define JUNE      6
#define JULY      7
#define AUGUST    8
#define SEPTEMBER 9
#define OCTOBER   10
#define NOVEMBER  11
#define DECEMBER  12

#define MAP_WEATHER_DIAMOND_DUST 8

typedef struct MonthDay {
    u8 month;
    u8 day;
} MonthDay;

u32 FieldSystem_GetWeather_HandleDiamondDust(FieldSystem *fieldSystem, u32 mapId);

#endif // POKEHEARTGOLD_FIELD_SYSTEM_RTC_WEATHER_H
