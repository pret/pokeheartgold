#ifndef POKEHEARTGOLD_UNK_0205BB1C_H
#define POKEHEARTGOLD_UNK_0205BB1C_H

#include "field_types_def.h"
#include "save.h"

u16 Save_GetPartyLead(SaveData *saveData);
u16 Save_GetPartyLeadAlive(SaveData *saveData);
u32 CountDigits(u32 num);
u16 GetOakJohtoDexRating(u16 numCaught, u16 gender, u16 *var_p);
u16 GetOakNationalDexRating(u16 numCaught, u16 gender, u16 *var_p);
BOOL Save_PlayerHasAllRegisInParty(SaveData *saveData);
void sub_0205BED8(TaskManager *taskManager, LocalMapObject *object, u16 a2, u16 a3, u16 a4, u16 a5);
void sub_0205BFB4(TaskManager *taskManager, LocalMapObject *object, u16 a2, u16 a3);

#endif // POKEHEARTGOLD_UNK_0205BB1C_H
