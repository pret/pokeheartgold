#include "event_data.h"

static u8 sTempFlags[NUM_TEMP_FLAGS / 8] = {0};

u32 SavArray_Flags_Sizeof(void) {
    return sizeof(SCRIPT_STATE);
}

void SavArray_Flags_Init(SCRIPT_STATE *scriptState) {
    memset(scriptState, 0, sizeof(SCRIPT_STATE));
}

SCRIPT_STATE *SavArray_Flags_Get(SAVEDATA *saveData) {
    return SavArray_Get(saveData, SAVE_FLAGS);
}

BOOL CheckFlagInArray(SCRIPT_STATE *scriptState, u16 flagno) {
    u8 *flagAddr = GetFlagAddr(scriptState, flagno);
    if (flagAddr != NULL) {
        if (*flagAddr & (1 << (flagno % 8))) {
            return TRUE;
        }
    }
    return FALSE;
}

void SetFlagInArray(SCRIPT_STATE *scriptState, u16 flagno) {
    u8 *flagAddr = GetFlagAddr(scriptState, flagno);
    if (flagAddr == NULL) {
        return;
    }
    *flagAddr |= 1 << (flagno % 8);
}

void ClearFlagInArray(SCRIPT_STATE *scriptState, u16 flagno) {
    u8 *flagAddr = GetFlagAddr(scriptState, flagno);
    if (flagAddr == NULL) {
        return;
    }
    *flagAddr &= 0xFF ^ (1 << (flagno % 8));
}

u8 *GetFlagAddr(SCRIPT_STATE *scriptState, u16 flagno) {
    if (flagno == 0) {
        return NULL;
    } else if (flagno < TEMP_FLAG_BASE) {
        GF_ASSERT((flagno / 8) < (NUM_FLAGS / 8));
        return &scriptState->flags[flagno / 8];
    } else {
        GF_ASSERT(((flagno - TEMP_FLAG_BASE) / 8) < (NUM_TEMP_FLAGS / 8));
        return &sTempFlags[(flagno - TEMP_FLAG_BASE) / 8];
    }
}

u16 *GetVarAddr(SCRIPT_STATE *scriptState, u16 varno) {
    GF_ASSERT((varno - VAR_BASE) < NUM_VARS);
    return &scriptState->vars[varno - VAR_BASE];
}
