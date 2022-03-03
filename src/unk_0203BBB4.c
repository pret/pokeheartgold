#include "unk_0203BBB4.h"

const struct MonthDay DiamondDustDates[] = {
    { JANUARY, 1 },
    { JANUARY, 31 },
    { FEBRUARY, 1 },
    { FEBRUARY, 29 },
    { MARCH, 15 },
    { OCTOBER, 10 },
    { DECEMBER, 3 },
    { DECEMBER, 31 },
}; //_020FA09C

u32 sub_0203BBB4(struct UnkStruct0203BBB4* unkStruct, u32 mapId) {
    u8 c = 0;
    u32 weatherType = MapHeader_GetWeatherType(mapId);
    
    if(MT_SILVER != mapId) return weatherType;

    SYSINFO_RTC* sysinfo_rtc = Sav2_SysInfo_RTC_get(unkStruct->savedata);

    for(c = 0; c < 8; c++)
    {
       u8 month = DiamondDustDates[c].month;
       u8 day = DiamondDustDates[c].day;
       if((sysinfo_rtc->date.month == month) && (sysinfo_rtc->date.day == day))
       { 
           if(!sub_02055670(unkStruct))
                weatherType = MAP_WEATHER_DIAMOND_DUST;
                return weatherType;
       }
    }

    return weatherType;
}

