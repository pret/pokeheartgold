#include "global.h"
#include "igt.h"

void InitIGT(struct IGT* igt) {
    igt->hours = 0;
    igt->minutes = 0;
    igt->seconds = 0;
}

void AddIGTSeconds(struct IGT* igt, u32 seconds_to_add) {
    if (igt->hours == 999 && igt->minutes == 59 && igt->seconds == 59) {
        return;
    }

    u32 seconds = igt->seconds + seconds_to_add;
    u32 minutes = igt->minutes;
    u32 hours = igt->hours;
    if (seconds > 59) {
        minutes += seconds / 60;
        seconds %= 60;
        if (minutes > 59) {
            hours += minutes / 60;
            minutes %= 60;
            // Bug: 998:59:59 rolls over to 999:59:59
#ifdef BUGFIX_IGT_MAX
            if (hours > 999) {
#else
            if (hours >= 999) {
#endif //BUGFIX_IGT_MAX
                hours = 999;
                minutes = 59;
                seconds = 59;
            }
        }
    }

    igt->hours = hours;
    igt->minutes = minutes;
    igt->seconds = seconds;
}

u16 GetIGTHours(struct IGT* igt) {
    return igt->hours;
}

u8 GetIGTMinutes(struct IGT* igt) {
    return igt->minutes;
}

u8 GetIGTSeconds(struct IGT* igt) {
    return igt->seconds;
}
