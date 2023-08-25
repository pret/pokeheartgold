#include "global.h"
#include "daycare.h"

u32 Save_Daycare_sizeof(void) {
    return sizeof(Daycare);
}

void Save_Daycare_Init(Daycare *daycare) {
    memset(daycare, 0, sizeof(Daycare));
    ZeroBoxMonData(&daycare->mons[0].mon);
    ZeroBoxMonData(&daycare->mons[1].mon);
    daycare->egg_pid = 0;
    daycare->egg_cycles = 0;
}

DaycareMon *Save_Daycare_GetMonX(Daycare *daycare, s32 i) {
    return &daycare->mons[i];
}

BoxPokemon *DaycareMon_GetBoxMon(DaycareMon *dcmon) {
    return &dcmon->mon;
}

DaycareMail *DaycareMon_GetExtras(DaycareMon *dcmon) {
    return &dcmon->mail;
}

u32 DaycareMon_GetSteps(DaycareMon *dcmon) {
    return dcmon->steps;
}

Mail *DaycareMail_GetMailPtr(DaycareMail *dcmail) {
    return &dcmail->mail;
}

BOOL Save_Daycare_HasEgg(Daycare *daycare) {
    return daycare->egg_pid != 0;
}

u32 Save_Daycare_GetEggPID(Daycare *daycare) {
    return daycare->egg_pid;
}

u8 Save_Daycare_GetEggCycleCounter(Daycare *daycare) {
    return daycare->egg_cycles;
}

void DaycareMon_SetSteps(DaycareMon *dcmon, u32 steps) {
    dcmon->steps = steps;
}

void DaycareMon_AddSteps(DaycareMon *dcmon, u32 steps) {
    dcmon->steps += steps;
}

void Save_Daycare_SetEggPID(Daycare *daycare, u32 pid) {
    daycare->egg_pid = pid;
}

void Save_Daycare_SetEggCycleCounter(Daycare *daycare, s32 count) {
    daycare->egg_cycles = count;
}

BOOL Save_Daycare_MasudaCheck(Daycare *daycare) {
    // Checks if the pokemon come from different countries.
    // Uses language as a proxy for country, even though it
    // only accounts for European languages and Japanese.
    // If true, shiny odds are increased.
    return GetBoxMonData(&daycare->mons[0].mon, MON_DATA_GAME_LANGUAGE, NULL) !=
           GetBoxMonData(&daycare->mons[1].mon, MON_DATA_GAME_LANGUAGE, NULL);
}

void DaycareMon_Copy(DaycareMon *dest, const DaycareMon *src) {
    *dest = *src;
}

void DaycareMon_Extras_Init(DaycareMail *mail) {
    int i;

    for (i = 0; i < PLAYER_NAME_LENGTH + 1; i++) {
        mail->ot_name[i] = 0;
    }

    for (i = 0; i < POKEMON_NAME_LENGTH + 1; i++) {
        mail->nickname[i] = 0;
    }

    mail->ot_name[0] = EOS;
    mail->nickname[0] = EOS;
}

void DaycareMon_Init(DaycareMon *mon) {
    ZeroBoxMonData(&mon->mon);
    mon->steps = 0;
    DaycareMon_Extras_Init(&mon->mail);
}

Daycare *Save_Daycare_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_DAYCARE);
}
