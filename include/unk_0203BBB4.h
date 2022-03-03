#ifndef UNK_0203BBB4_H
#define UNK_0203BBB4_H

#include "save.h"
#include "sav_system_info.h"

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

#define MT_SILVER 0x000001D1

#define MAP_WEATHER_DIAMOND_DUST 8

typedef struct MonthDay {
    u8 month;
    u8 day;
};

typedef struct UnkStruct0203BBB4
{
    u8 unk0[0xc];
    SAVEDATA* savedata;
};

u32 sub_0203BBB4(struct UnkStruct0203BBB4* unkStruct, u32 mapId);

#endif //UNK_0203BBB4_H
