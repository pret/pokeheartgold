#ifndef POKEHEARTGOLD_POKEATHLON_SAVE_H
#define POKEHEARTGOLD_POKEATHLON_SAVE_H

#include "save_pokeathlon.h"

u32 Save_Pokeathlon_sizeof();
void Save_Pokeathlon_Init(POKEATHLON_SAV *dest);
POKEATHLON_SAV *Save_Pokeathlon_Get(SaveData *saveData);
void *Save_Pokeathlon_GetUnkDC(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_2C *Save_Pokeathlon_GetUnk2CC(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_A4 *Save_Pokeathlon_GetUnk484(POKEATHLON_SAV *pokeathlonSave);
void *Save_Pokeathlon_GetUnkAEC(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_B00 *Save_Pokeathlon_GetUnkB00(POKEATHLON_SAV *pokeathlonSave);
POKEATHLON_SAV *Save_Pokeathlon_dummy2(POKEATHLON_SAV *pokeathlon);
BOOL sub_020319A8(POKEATHLON_SAV *pokeathlonSave, int a0, int a1);
Pokeathlon_UnkSubStruct_2C *Save_Pokeathlon_GetAgainUnk2CC(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_A4 *Save_Pokeathlon_GetAgainUnk484(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_B00 *Save_Pokeathlon_GetAgainUnkB00(POKEATHLON_SAV *pokeathlonSave);
void sub_020319F8(POKEATHLON_SAV *pokeathlonSave, int a0, int a1);

void SavePokeathlon_AddAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount);
void SavePokeathlon_SubAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount);
u32 SavePokeathlon_GetAthletePoints(POKEATHLON_SAV *pokeathlonSave);

#endif // POKEHEARTGOLD_POKEATHLON_SAVE_H
