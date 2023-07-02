#ifndef POKEHEARTGOLD_DAYCARE_H
#define POKEHEARTGOLD_DAYCARE_H

#include "mail.h"
#include "pokemon.h"

typedef struct DaycareMail {
    Mail mail;
    u16 ot_name[PLAYER_NAME_LENGTH + 1];
    u16 nickname[POKEMON_NAME_LENGTH + 1];
    u8 padding_5E[2];
} DaycareMail;

typedef struct DaycareMon {
    BoxPokemon mon;
    DaycareMail mail;
    u32 steps;
} DaycareMon;

typedef struct Daycare {
    DaycareMon mons[2];
    u32 egg_pid;
    u8 egg_cycles;
    u8 padding_1DD[3];
} Daycare;

u32 Save_Daycare_sizeof(void);
void Save_Daycare_Init(Daycare* daycare);
DaycareMon* Save_DayCare_GetMonX(Daycare* daycare, int i);
BoxPokemon *DayCareMon_GetBoxMon(DaycareMon* dcmon);
DaycareMail* DayCareMon_GetExtras(DaycareMon* dcmon);
int DayCareMon_GetSteps(DaycareMon* dcmon);
Mail* DayCareMail_GetMailPtr(DaycareMail* dcmail);
u32 Save_DayCare_GetEggPID(Daycare* daycare);
u8 Save_DayCare_GetEggCycleCounter(Daycare* daycare);
void DayCareMon_SetSteps(DaycareMon* dcmon, u32 steps);
void DayCareMon_AddSteps(DaycareMon* dcmon, u32 steps);
void Save_DayCare_SetEggPID(Daycare* daycare, u32 pid);
void Save_DayCare_SetEggCycleCounter(Daycare* daycare, int count);
BOOL Save_DayCare_MasudaCheck(Daycare* daycare);
void DayCareMon_Copy(DaycareMon* dest, const DaycareMon* src);
void DayCareMon_Extras_Init(DaycareMail* mail);
void DayCareMon_Init(DaycareMon* mon);
Daycare* Save_DayCare_Get(SaveData* savedata);
BOOL Save_DayCare_HasEgg(Daycare* daycare);

#endif
