#ifndef POKEHEARTGOLD_EVENT_DATA_H_
#define POKEHEARTGOLD_EVENT_DATA_H_

#include "save.h"
#include "constants/flags.h"
#include "constants/vars.h"

//TODO: Investigate this struct a bit more and see if we can provide a more descriptive name
typedef struct ScriptState {
    u16 vars[NUM_VARS];
    u8 flags[NUM_FLAGS / 8];
} ScriptState;

u32 SaveArray_Flags_sizeof(void);
void SaveArray_Flags_Init(ScriptState *scriptState);
ScriptState *SaveArray_Flags_Get(SaveData *saveData);
BOOL CheckFlagInArray(ScriptState *scriptState, u16 flagno);
void SetFlagInArray(ScriptState *scriptState, u16 flagno);
void ClearFlagInArray(ScriptState *scriptState, u16 flagno);
u8 *GetFlagAddr(ScriptState *scriptState, u16 flagno);
u16 *GetVarAddr(ScriptState *scriptState, u16 varno);

#endif //POKEHEARTGOLD_EVENT_DATA_H_
