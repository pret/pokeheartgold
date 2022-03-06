#ifndef POKEHEARTGOLD_UNK_0203BBB4_H
#define POKEHEARTGOLD_UNK_0203BBB4_H

#include "save.h"
#include "sav_system_info.h"
#include "script.h"

#define JANUARY 1
#define FEBRUARY 2
#define MARCH 3
#define APRIL 4
#define MAY 5
#define JUNE 6
#define JULY 7
#define AUGUST 8
#define SEPTEMBER 9
#define OCTOBER 10
#define NOVEMBER 11
#define DECEMBER 12

#define MAP_WEATHER_DIAMOND_DUST 8

typedef struct MonthDay {
    u8 month;
    u8 day;
};

u32 sub_0203BBB4(FieldSystem* fsys, u32 mapId);

#endif //POKEHEARTGOLD_UNK_0203BBB4_H
