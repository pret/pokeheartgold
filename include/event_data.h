#ifndef POKEHEARTGOLD_EVENT_DATA_H_
#define POKEHEARTGOLD_EVENT_DATA_H_

#include "save.h"
#include "constants/flags.h"
#include "constants/vars.h"

typedef struct SaveVarsFlags {
    u16 vars[NUM_VARS];
    u8 flags[NUM_FLAGS / 8];
} SaveVarsFlags;

u32 Save_VarsFlags_sizeof(void);
void Save_VarsFlags_Init(SaveVarsFlags *varsFlags);
SaveVarsFlags *Save_VarsFlags_Get(SaveData *saveData);
BOOL CheckFlagInArray(SaveVarsFlags *varsFlags, u16 flagno);
void SetFlagInArray(SaveVarsFlags *varsFlags, u16 flagno);
void ClearFlagInArray(SaveVarsFlags *varsFlags, u16 flagno);
u8 *GetFlagAddr(SaveVarsFlags *varsFlags, u16 flagno);
u16 *GetVarAddr(SaveVarsFlags *varsFlags, u16 varno);

#endif //POKEHEARTGOLD_EVENT_DATA_H_
