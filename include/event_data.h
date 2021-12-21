#ifndef POKEHEARTGOLD_EVENT_DATA_H_
#define POKEHEARTGOLD_EVENT_DATA_H_

#include "save.h"
#include "constants/flags.h"

#define NUM_VARS            368
#define VAR_BASE         0x4000

typedef struct ScriptState {
    u16 vars[NUM_VARS];
    u8 flags[NUM_FLAGS / 8];
} SCRIPT_STATE;

u32 SavArray_Flags_sizeof(void);
void SavArray_Flags_init(SCRIPT_STATE *scriptState);
SCRIPT_STATE *SavArray_Flags_get(SAVEDATA *saveData);
BOOL CheckFlagInArray(SCRIPT_STATE *scriptState, u16 flagno);
void SetFlagInArray(SCRIPT_STATE *scriptState, u16 flagno);
void ClearFlagInArray(SCRIPT_STATE *scriptState, u16 flagno);
u8 *GetFlagAddr(SCRIPT_STATE *scriptState, u16 flagno);
u16 *GetVarAddr(SCRIPT_STATE *scriptState, u16 varno);

#endif //POKEHEARTGOLD_EVENT_DATA_H_
