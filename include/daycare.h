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

u32 Daycare_GetSizeOfDaycare(void);
void Daycare_Init(Daycare *daycare);
DaycareMon *Daycare_GetMonX(Daycare *daycare, s32 i);
BoxPokemon *DaycareMon_GetBoxMon(DaycareMon *dcmon);
DaycareMail *DaycareMon_GetExtras(DaycareMon *dcmon);
u32 DaycareMon_GetSteps(DaycareMon *dcmon);
Mail *DaycareMail_GetMailPtr(DaycareMail *dcmail);
u32 Daycare_GetEggPID(Daycare *daycare);
u8 Daycare_GetEggCycleCounter(Daycare *daycare);
void DaycareMon_SetSteps(DaycareMon *dcmon, u32 steps);
void DaycareMon_AddSteps(DaycareMon *dcmon, u32 steps);
void Save_Daycare_SetEggPID(Daycare *daycare, u32 pid);
void Daycare_SetEggCycleCounter(Daycare *daycare, s32 count);
BOOL Daycare_MasudaCheck(Daycare *daycare);
void DaycareMon_Copy(DaycareMon *dest, const DaycareMon *src);
void DaycareMon_Extras_Init(DaycareMail *mail);
void DaycareMon_Init(DaycareMon *mon);
Daycare *Daycare_GetSaveArray(SaveData *saveData);
BOOL Daycare_HasEgg(Daycare *daycare);

#endif
