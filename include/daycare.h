#ifndef POKEHEARTGOLD_DAYCARE_H
#define POKEHEARTGOLD_DAYCARE_H

#include "mail.h"
#include "pokemon.h"

typedef struct DAYCAREMAIL {
    MAIL mail;
    u16 ot_name[PLAYER_NAME_LENGTH + 1];
    u16 nickname[POKEMON_NAME_LENGTH + 1];
    u8 padding_5E[2];
} DAYCAREMAIL;

typedef struct DAYCAREMON {
    BoxPokemon mon;
    DAYCAREMAIL mail;
    u32 steps;
} DAYCAREMON;

typedef struct DAYCARE {
    DAYCAREMON mons[2];
    u32 egg_pid;
    u8 egg_cycles;
    u8 padding_1DD[3];
} DAYCARE;

u32 Save_Daycare_sizeof(void);
void Save_Daycare_Init(DAYCARE* daycare);
DAYCAREMON* Save_DayCare_GetMonX(DAYCARE* daycare, int i);
BoxPokemon *DayCareMon_GetBoxMon(DAYCAREMON* dcmon);
DAYCAREMAIL* DayCareMon_GetExtras(DAYCAREMON* dcmon);
int DayCareMon_GetSteps(DAYCAREMON* dcmon);
MAIL* DayCareMail_GetMailPtr(DAYCAREMAIL* dcmail);
u32 Save_DayCare_GetEggPID(DAYCARE* daycare);
u8 Save_DayCare_GetEggCycleCounter(DAYCARE* daycare);
void DayCareMon_SetSteps(DAYCAREMON* dcmon, u32 steps);
void DayCareMon_AddSteps(DAYCAREMON* dcmon, u32 steps);
void Save_DayCare_SetEggPID(DAYCARE* daycare, u32 pid);
void Save_DayCare_SetEggCycleCounter(DAYCARE* daycare, int count);
BOOL Save_DayCare_MasudaCheck(DAYCARE* daycare);
void DayCareMon_Copy(DAYCAREMON* dest, const DAYCAREMON* src);
void DayCareMon_Extras_Init(DAYCAREMAIL* mail);
void DayCareMon_Init(DAYCAREMON* mon);
DAYCARE* Save_DayCare_Get(SaveData* savedata);
BOOL Save_DayCare_HasEgg(DAYCARE* daycare);

#endif
