#include "global.h"
#include "save_vars_flags.h"

static u8 sTempFlags[NUM_TEMP_FLAGS / 8] = {0};

u32 Save_VarsFlags_sizeof(void) {
    return sizeof(SaveVarsFlags);
}

void Save_VarsFlags_Init(SaveVarsFlags *varsFlags) {
    memset(varsFlags, 0, sizeof(SaveVarsFlags));
}

SaveVarsFlags *Save_VarsFlags_Get(SaveData *saveData) {
    return (SaveVarsFlags *)SaveArray_Get(saveData, SAVE_FLAGS);
}

BOOL Save_VarsFlags_CheckFlagInArray(SaveVarsFlags *varsFlags, u16 flagId) {
    u8 *flagAddr = Save_VarsFlags_GetFlagAddr(varsFlags, flagId);
    if (flagAddr != NULL) {
        if (*flagAddr & (1 << (flagId % 8))) {
            return TRUE;
        }
    }
    return FALSE;
}

void Save_VarsFlags_SetFlagInArray(SaveVarsFlags *varsFlags, u16 flagId) {
    u8 *flagAddr = Save_VarsFlags_GetFlagAddr(varsFlags, flagId);
    if (flagAddr == NULL) {
        return;
    }
    *flagAddr |= 1 << (flagId % 8);
}

void Save_VarsFlags_ClearFlagInArray(SaveVarsFlags *varsFlags, u16 flagId) {
    u8 *flagAddr = Save_VarsFlags_GetFlagAddr(varsFlags, flagId);
    if (flagAddr == NULL) {
        return;
    }
    *flagAddr &= 0xFF ^ (1 << (flagId % 8));
}

u8 *Save_VarsFlags_GetFlagAddr(SaveVarsFlags *varsFlags, u16 flagId) {
    if (flagId == 0) {
        return NULL;
    } else if (flagId < TEMP_FLAG_BASE) {
        GF_ASSERT((flagId / 8) < (NUM_FLAGS / 8));
        return &varsFlags->flags[flagId / 8];
    } else {
        GF_ASSERT(((flagId - TEMP_FLAG_BASE) / 8) < (NUM_TEMP_FLAGS / 8));
        return &sTempFlags[(flagId - TEMP_FLAG_BASE) / 8];
    }
}

u16 *Save_VarsFlags_GetVarAddr(SaveVarsFlags *varsFlags, u16 varId) {
    GF_ASSERT((varId - VAR_BASE) < NUM_VARS);
    return &varsFlags->vars[varId - VAR_BASE];
}
