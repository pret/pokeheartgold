#ifndef POKEHEARTGOLD_UNK_02031904_H
#define POKEHEARTGOLD_UNK_02031904_H

#include "save_pokeathlon.h"

Pokeathlon_UnkSubStruct_B00 *sub_020319F0(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_B00 *sub_0203199C(POKEATHLON_SAV *pokeathlonSave);
void SavePokeathlon_AddAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount);
void SavePokeathlon_SubAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount);
u32 SavePokeathlon_GetAthletePoints(POKEATHLON_SAV *pokeathlonSave);
POKEATHLON_SAV *Save_Pokeathlon_Get(SaveData *saveData);
void *sub_02031978(POKEATHLON_SAV *pokeathlonSave);
void *sub_0203197C(POKEATHLON_SAV *pokeathlonSave);
void *sub_02031984(POKEATHLON_SAV *pokeathlonSave);
void *sub_02031990(POKEATHLON_SAV *pokeathlonSave);

#endif // POKEHEARTGOLD_UNK_02031904_H
