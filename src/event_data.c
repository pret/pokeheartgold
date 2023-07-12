#include "global.h"
#include "event_data.h"

static u8 sTempFlags[NUM_TEMP_FLAGS / 8] = {0};

u32 Save_VarsFlags_sizeof(void) {
    return sizeof(SaveVarsFlags);
}

void Save_VarsFlags_Init(SaveVarsFlags *varsFlags) {
    memset(varsFlags, 0, sizeof(SaveVarsFlags));
}

SaveVarsFlags *Save_VarsFlags_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_FLAGS);
}

BOOL CheckFlagInArray(SaveVarsFlags *varsFlags, u16 flagno) {
    u8 *flagAddr = GetFlagAddr(varsFlags, flagno);
    if (flagAddr != NULL) {
        if (*flagAddr & (1 << (flagno % 8))) {
            return TRUE;
        }
    }
    return FALSE;
}

void SetFlagInArray(SaveVarsFlags *varsFlags, u16 flagno) {
    u8 *flagAddr = GetFlagAddr(varsFlags, flagno);
    if (flagAddr == NULL) {
        return;
    }
    *flagAddr |= 1 << (flagno % 8);
}

void ClearFlagInArray(SaveVarsFlags *varsFlags, u16 flagno) {
    u8 *flagAddr = GetFlagAddr(varsFlags, flagno);
    if (flagAddr == NULL) {
        return;
    }
    *flagAddr &= 0xFF ^ (1 << (flagno % 8));
}

u8 *GetFlagAddr(SaveVarsFlags *varsFlags, u16 flagno) {
    if (flagno == 0) {
        return NULL;
    } else if (flagno < TEMP_FLAG_BASE) {
        GF_ASSERT((flagno / 8) < (NUM_FLAGS / 8));
        return &varsFlags->flags[flagno / 8];
    } else {
        GF_ASSERT(((flagno - TEMP_FLAG_BASE) / 8) < (NUM_TEMP_FLAGS / 8));
        return &sTempFlags[(flagno - TEMP_FLAG_BASE) / 8];
    }
}

u16 *GetVarAddr(SaveVarsFlags *varsFlags, u16 varno) {
    GF_ASSERT((varno - VAR_BASE) < NUM_VARS);
    return &varsFlags->vars[varno - VAR_BASE];
}
