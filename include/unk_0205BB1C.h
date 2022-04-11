#ifndef POKEHEARTGOLD_UNK_0205BB1C_H
#define POKEHEARTGOLD_UNK_0205BB1C_H

#include "save.h"

u16 Save_GetPartyLead(SAVEDATA *saveData);
u16 Save_GetPartyLeadAlive(SAVEDATA *saveData);
u32 sub_0205BB1C(u32 num);
u16 sub_0205BBD0(u16 numCaught, u16 gender, u16 *var_p);
u16 sub_0205BC78(u16 numCaught, u16 gender, u16 *var_p);
BOOL Save_PlayerHasRegiInParty(SAVEDATA *saveData);
void sub_0205BED8(TaskManager *taskManager, LocalMapObject  *object, u16 a2, u16 a3, u16 a4, u16 a5);
void sub_0205BFB4(TaskManager *taskManager, LocalMapObject  *object, u16 a2, u16 a3);

#endif //POKEHEARTGOLD_UNK_0205BB1C_H
