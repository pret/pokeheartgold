#ifndef POKEHEARTGOLD_SAVE_VARS_FLAGS_H
#define POKEHEARTGOLD_SAVE_VARS_FLAGS_H

#include "constants/flags.h"
#include "constants/vars.h"

#include "save.h"

typedef struct SaveVarsFlags {
    u16 vars[NUM_VARS];
    u8 flags[NUM_FLAGS / 8];
} SaveVarsFlags;

u32 Save_VarsFlags_sizeof(void);
void Save_VarsFlags_Init(SaveVarsFlags *varsFlags);
SaveVarsFlags *Save_VarsFlags_Get(SaveData *saveData);
BOOL Save_VarsFlags_CheckFlagInArray(SaveVarsFlags *varsFlags, u16 flagId);
void Save_VarsFlags_SetFlagInArray(SaveVarsFlags *varsFlags, u16 flagId);
void Save_VarsFlags_ClearFlagInArray(SaveVarsFlags *varsFlags, u16 flagId);
u8 *Save_VarsFlags_GetFlagAddr(SaveVarsFlags *varsFlags, u16 flagId);
u16 *Save_VarsFlags_GetVarAddr(SaveVarsFlags *varsFlags, u16 varId);

#endif // POKEHEARTGOLD_SAVE_VARS_FLAGS_H
