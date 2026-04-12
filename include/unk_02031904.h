#ifndef POKEHEARTGOLD_UNK_02031904_H
#define POKEHEARTGOLD_UNK_02031904_H

#include "save_pokeathlon.h"

u32 Save_Pokeathlon_sizeof(void);
void Save_Pokeathlon_Init(POKEATHLON_SAV *pokeathlonSave);
POKEATHLON_SAV *Save_Pokeathlon_Get(SaveData *saveData);
void *sub_02031978(POKEATHLON_SAV *pokeathlonSave);
void *sub_0203197C(POKEATHLON_SAV *pokeathlonSave);
void *sub_02031984(POKEATHLON_SAV *pokeathlonSave);
void *sub_02031990(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_B00 *sub_0203199C(POKEATHLON_SAV *pokeathlonSave);
void sub_020319A4(POKEATHLON_SAV *pokeathlonSave);
BOOL sub_020319A8(POKEATHLON_SAV *pokeathlonSave, int bitIdx, int pokemonIdx);
void *sub_020319DC(POKEATHLON_SAV *pokeathlonSave);
void *sub_020319E4(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_B00 *sub_020319F0(POKEATHLON_SAV *pokeathlonSave);
void sub_020319F8(POKEATHLON_SAV *pokeathlonSave, u8 mask, int pokemonIdx);
void SavePokeathlon_AddAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount);
void SavePokeathlon_SubAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount);
u32 SavePokeathlon_GetAthletePoints(POKEATHLON_SAV *pokeathlonSave);
void sub_02031A98(POKEATHLON_SAV *pokeathlonSave, int idx);
void sub_02031ACC(POKEATHLON_SAV *pokeathlonSave, int idx);

#endif // POKEHEARTGOLD_UNK_02031904_H
