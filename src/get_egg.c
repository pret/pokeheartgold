#include "get_egg.h"

BOXMON *Daycare_GetBoxMonI(DAYCARE *daycare, int idx) {
    return DayCareMon_GetBoxMon(Sav2_DayCare_GetMonX(daycare, idx));
}

u8 Sav2_DayCare_CountMonsInDayCare(DAYCARE *daycare) {
    u8 ct, i;

    ct = 0;

    for (i = 0; i < 2; i++) {
        if (GetBoxMonData(DayCareMon_GetBoxMon(Sav2_DayCare_GetMonX(daycare, i)), MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
            ct++;
        }
    }

    return ct;
}

int Sav2_DayCare_GetAvailableSlot(DAYCARE *daycare) {
    u8 i;
    static DAYCARE *_021D4218;

    _021D4218 = daycare;
    for (i = 0; i < 2; i++) {
        if (GetBoxMonData(DayCareMon_GetBoxMon(Sav2_DayCare_GetMonX(daycare, i)), MON_DATA_SPECIES, NULL) == SPECIES_NONE) {
            return i;
        }
    }

    return -1;
}
