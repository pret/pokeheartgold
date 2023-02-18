#include "daycare.h"

u32 Sav2_Daycare_sizeof(void) {
    return sizeof(DAYCARE);
}

void Sav2_Daycare_init(DAYCARE* daycare) {
    memset(daycare, 0, sizeof(DAYCARE));
    ZeroBoxMonData(&daycare->mons[0].mon);
    ZeroBoxMonData(&daycare->mons[1].mon);
    daycare->egg_pid = 0;
    daycare->egg_cycles = 0;
}

DAYCAREMON* Sav2_DayCare_GetMonX(DAYCARE* daycare, int i) {
    return &daycare->mons[i];
}

BoxPokemon *DayCareMon_GetBoxMon(DAYCAREMON* dcmon) {
    return &dcmon->mon;
}

DAYCAREMAIL* DayCareMon_GetExtras(DAYCAREMON* dcmon) {
    return &dcmon->mail;
}

int DayCareMon_GetSteps(DAYCAREMON* dcmon) {
    return dcmon->steps;
}

MAIL* DayCareMail_GetMailPtr(DAYCAREMAIL* dcmail) {
    return &dcmail->mail;
}

BOOL Sav2_DayCare_HasEgg(DAYCARE* daycare) {
    return daycare->egg_pid != 0;
}

u32 Sav2_DayCare_GetEggPID(DAYCARE* daycare) {
    return daycare->egg_pid;
}

u8 Sav2_DayCare_GetEggCycleCounter(DAYCARE* daycare) {
    return daycare->egg_cycles;
}

void DayCareMon_SetSteps(DAYCAREMON* dcmon, u32 steps) {
    dcmon->steps = steps;
}

void DayCareMon_AddSteps(DAYCAREMON* dcmon, u32 steps) {
    dcmon->steps += steps;
}

void Sav2_DayCare_SetEggPID(DAYCARE* daycare, u32 pid) {
    daycare->egg_pid = pid;
}

void Sav2_DayCare_SetEggCycleCounter(DAYCARE* daycare, int count) {
    daycare->egg_cycles = count;
}

BOOL Sav2_DayCare_MasudaCheck(DAYCARE* daycare) {
    // Checks if the pokemon come from different countries.
    // Uses language as a proxy for country, even though it
    // only accounts for European languages and Japanese.
    // If true, shiny odds are increased.
    return GetBoxMonData(&daycare->mons[0].mon, MON_DATA_GAME_LANGUAGE, NULL) !=
           GetBoxMonData(&daycare->mons[1].mon, MON_DATA_GAME_LANGUAGE, NULL);
}

void DayCareMon_Copy(DAYCAREMON* dest, const DAYCAREMON* src) {
    *dest = *src;
}

void DayCareMon_Extras_init(DAYCAREMAIL* mail) {
    int i;

    for (i = 0; i < OT_NAME_LENGTH + 1; i++) {
        mail->ot_name[i] = 0;
    }

    for (i = 0; i < POKEMON_NAME_LENGTH + 1; i++) {
        mail->nickname[i] = 0;
    }

    mail->ot_name[0] = EOS;
    mail->nickname[0] = EOS;
}

void DayCareMon_init(DAYCAREMON* mon) {
    ZeroBoxMonData(&mon->mon);
    mon->steps = 0;
    DayCareMon_Extras_init(&mon->mail);
}

DAYCARE* Sav2_DayCare_get(SAVEDATA* savedata) {
    return SavArray_get(savedata, SAVE_DAYCARE);
}
