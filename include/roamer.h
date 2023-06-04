#ifndef POKEHEARTGOLD_ROAMER_H
#define POKEHEARTGOLD_ROAMER_H

#include "constants/roamer.h"
#include "save.h"

enum RoamerDataParam {
    ROAMER_DATA_MET_LOCATION = 1,
    ROAMER_DATA_IVS          = 2,
    ROAMER_DATA_PERSONALITY  = 3,
    ROAMER_DATA_SPECIES      = 4,
    ROAMER_DATA_HP           = 5,
    ROAMER_DATA_LEVEL        = 6,
    ROAMER_DATA_STATUS       = 7,
    ROAMER_DATA_ACTIVE       = 8,
};

typedef struct ROAMER {
    u32 met_location;
    u32 ivs;
    u32 personality;
    u16 species;
    u16 hp;
    u8 level;
    u8 status;
    u8 active;
    u8 dummy;
} ROAMER;

typedef struct ROAMER_SAVE {
    u32 rand[2];
    u32 playerLocationHistory[2];
    ROAMER data[ROAMER_MAX];
    u8 unk_60[ROAMER_MAX];
    u8 unk_64;
    u8 repelSteps;
    u8 unk_66;
    u8 flutePlayed;
} ROAMER_SAVE;

u32 Save_Roamers_sizeof(void);
void Save_Roamers_Init(ROAMER_SAVE *roamer);
void Roamers_SetRand(ROAMER_SAVE *roamer, u32 param);
u32 Roamers_GetRand(ROAMER_SAVE *roamer, u32 which);
ROAMER_SAVE *Save_Roamers_Get(SAVEDATA *saveData);
void RoamerSave_SetOutbreakActive(SAVEDATA *saveData);
u8 RoamerSave_OutbreakActive(ROAMER_SAVE *roamerSave);
void PlayerLocationHistoryPush(ROAMER_SAVE *roamerSave, u32 mapsec);
u32 PlayerLocationHistoryGetBack(ROAMER_SAVE *roamerSave);
u8 Roamer_GetLocation(ROAMER_SAVE *roamerSave, int a1);
void Roamer_SetLocation(ROAMER_SAVE *roamerSave, int a1, u8 a2);
u8 GetRoamerIsActiveByIndex(ROAMER_SAVE *roamerSave, int a1);
void RoamerMon_Init(ROAMER ** roamer_p);
ROAMER *Roamers_GetRoamMonStats(ROAMER_SAVE *roamerSave, int a1);
int GetRoamerData(ROAMER *roamer, int a1);
void SetRoamerData(ROAMER *roamer, int a1, int val);
u8 *RoamerSave_GetRepelAddr(ROAMER_SAVE *roamerSave);
BOOL RoamerSave_RepelNotInUse(ROAMER_SAVE *roamerSave);
void RoamerSave_SetFlute(ROAMER_SAVE *roamerSave, u8 a1);
u8 RoamerSave_GetFlute(ROAMER_SAVE *roamerSave);

#endif //POKEHEARTGOLD_ROAMER_H
