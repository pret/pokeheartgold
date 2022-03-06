#include "unk_0203BBB4.h"
#include "constants/maps.h"

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

u32 sub_0203BBB4(FieldSystem* fsys, u32 mapId) {
    u8 c = 0;
    u32 weatherType = MapHeader_GetWeatherType(mapId);
    
    if(MAP_D41R0108 != mapId) return weatherType;

    SYSINFO_RTC* sysinfo_rtc = Sav2_SysInfo_RTC_get(fsys->savedata);

    for(c = 0; c < 8; c++) {
       u8 month = DiamondDustDates[c].month;
       u8 day = DiamondDustDates[c].day;
       if((sysinfo_rtc->date.month == month) && (sysinfo_rtc->date.day == day)) { 
			if(!sub_02055670(fsys)) weatherType = MAP_WEATHER_DIAMOND_DUST;
			return weatherType;
       }
    }

    return weatherType;
}
