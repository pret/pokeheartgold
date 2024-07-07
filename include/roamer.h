#ifndef POKEHEARTGOLD_ROAMER_H
#define POKEHEARTGOLD_ROAMER_H

#include "constants/roamer.h"

#include "save.h"

enum RoamerDataParam {
    ROAMER_DATA_MET_LOCATION = 1,
    ROAMER_DATA_IVS = 2,
    ROAMER_DATA_PERSONALITY = 3,
    ROAMER_DATA_SPECIES = 4,
    ROAMER_DATA_HP = 5,
    ROAMER_DATA_LEVEL = 6,
    ROAMER_DATA_STATUS = 7,
    ROAMER_DATA_ACTIVE = 8,
};

typedef struct Roamer { // todo: this appears to be used for swarms as well
    u32 met_location;
    u32 ivs;
    u32 personality;
    u16 species;
    u16 hp;
    u8 level;
    u8 status;
    u8 active;
    u8 dummy;
} Roamer;

typedef struct RoamerSaveData { // todo: this appears to be used for swarms as well
    u32 rand[2];
    u32 playerLocationHistory[2];
    Roamer data[ROAMER_MAX];
    u8 locations[ROAMER_MAX];
    u8 outbreak;
    u8 repelSteps;
    u8 unk_66;
    u8 flutePlayed;
} RoamerSaveData;

u32 Save_Roamers_sizeof(void);
void Save_Roamers_Init(RoamerSaveData *roamer);
void Roamers_SetRand(RoamerSaveData *roamer, u32 param);
u32 Roamers_GetRand(RoamerSaveData *roamer, u32 which);
RoamerSaveData *Save_Roamers_Get(SaveData *saveData);
void RoamerSave_SetOutbreakActive(SaveData *saveData);
u8 RoamerSave_OutbreakActive(RoamerSaveData *roamerSave);
void PlayerLocationHistoryPush(RoamerSaveData *roamerSave, u32 mapsec);
u32 PlayerLocationHistoryGetBack(RoamerSaveData *roamerSave);
u8 Roamer_GetLocation(RoamerSaveData *roamerSave, int roamerId);
void Roamer_SetLocation(RoamerSaveData *roamerSave, int roamerId, u8 a2);
u8 GetRoamerIsActiveByIndex(RoamerSaveData *roamerSave, int roamerId);
void RoamerMon_Init(Roamer **roamer_p);
Roamer *Roamers_GetRoamMonStats(RoamerSaveData *roamerSave, int roamerId);
int GetRoamerData(Roamer *roamer, int a1);
void SetRoamerData(Roamer *roamer, int a1, int val);
u8 *RoamerSave_GetRepelAddr(RoamerSaveData *roamerSave);
BOOL RoamerSave_RepelNotInUse(RoamerSaveData *roamerSave);
void RoamerSave_SetFlute(RoamerSaveData *roamerSave, u8 flute);
u8 RoamerSave_GetFlute(RoamerSaveData *roamerSave);

#endif // POKEHEARTGOLD_ROAMER_H
