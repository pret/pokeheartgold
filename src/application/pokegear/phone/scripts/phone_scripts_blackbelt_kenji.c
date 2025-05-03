#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

u16 PhoneCall_GetScriptId_Kenji(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    u8 r6;
    u8 timeOfDay;
    a1->scriptType = 0;
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_086;
    }
    a1->unk_4A = sub_0202F284(a0->momsSavings);
    if (a1->unk_4A > 1) {
        return PHONE_SCRIPT_087;
    } else if (a1->unk_4A == 1) {
        return PHONE_SCRIPT_088;
    }
    r6 = sub_0202F274(a0->momsSavings);
    if (r6 != 0 && !PhoneRematches_IsSeeking(a0->momsSavings, 16)) {
        return PHONE_SCRIPT_087;
    }
    timeOfDay = GF_RTC_GetTimeOfDayByHour(a1->time.hour);
    if (timeOfDay == RTC_TIMEOFDAY_EVE || timeOfDay == RTC_TIMEOFDAY_NITE) {
        return PHONE_SCRIPT_091;
    }
    if (r6 == 0) {
        sub_0202F254(a0->momsSavings, TRUE);
        PhoneRematches_SetSeeking(a0->momsSavings, 16, TRUE);
    }
    if (a1->timeOfDay == TIMEOFDAY_WILD_DAY) {
        return PHONE_SCRIPT_090;
    } else {
        return PHONE_SCRIPT_089;
    }
}
