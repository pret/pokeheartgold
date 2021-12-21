#ifndef POKEHEARTGOLD_EVENT_DATA_H_
#define POKEHEARTGOLD_EVENT_DATA_H_

#define NUM_VARS            368
#define NUM_FLAGS          2912
#define NUM_TEMP_FLAGS       64
#define TEMP_FLAG_BASE   0x4000
#define VAR_BASE         0x4000

typedef struct ScriptState {
    u16 vars[NUM_VARS];
    u8 flags[NUM_FLAGS / 8];
} SCRIPT_STATE;

#endif //POKEHEARTGOLD_EVENT_DATA_H_
