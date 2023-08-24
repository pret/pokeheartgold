#include "global.h"
#include "field_system_rtc_weather.h"
#include "map_header.h"
#include "unk_02055418.h"
#include "constants/maps.h"

const MonthDay DiamondDustDates[] = {
    { JANUARY, 1 },
    { JANUARY, 31 },
    { FEBRUARY, 1 },
    { FEBRUARY, 29 },
    { MARCH, 15 },
    { OCTOBER, 10 },
    { DECEMBER, 3 },
    { DECEMBER, 31 },
}; //_020FA09C

u32 FieldSystem_GetWeather_HandleDiamondDust(FieldSystem *fieldSystem, u32 mapId) {
    u8 c;
    u32 weatherType = MapHeader_GetWeatherType(mapId);
    if (mapId != MAP_D41R0108) {
        return weatherType;
    }
    SysInfo_RTC *sysinfo_rtc = Save_SysInfo_RTC_Get(fieldSystem->saveData);
    for (c = 0; c < NELEMS(DiamondDustDates); c++) {
       u8 month = DiamondDustDates[c].month;
       u8 day = DiamondDustDates[c].day;
       if ((sysinfo_rtc->date.month == month) && (sysinfo_rtc->date.day == day)) {
            if (!sub_02055670(fieldSystem)) {
                weatherType = MAP_WEATHER_DIAMOND_DUST;
            }
            return weatherType;
       }
    }
    return weatherType;
}
