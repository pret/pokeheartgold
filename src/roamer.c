#include "global.h"
#include "roamer.h"
#include "math_util.h"
#include "constants/roamer.h"

u32 Save_Roamers_sizeof(void) {
    return sizeof(RoamerSaveData);
}

void Save_Roamers_Init(RoamerSaveData *roamer) {
    memset(roamer, 0, sizeof(RoamerSaveData));
    roamer->rand[0] = MTRandom();
    roamer->rand[1] = MTRandom();
    roamer->outbreak = FALSE;
    roamer->repelSteps = 0;
    roamer->unk_66 = 0;
    roamer->flutePlayed = 0;
}

void Roamers_SetRand(RoamerSaveData *roamer, u32 param) {
    roamer->rand[0] = param;
    roamer->rand[1] = param;
}

u32 Roamers_GetRand(RoamerSaveData *roamer, u32 which) {
    switch (which) {
    case 1:
        return roamer->rand[0];
    case 2:
        return roamer->rand[1];
    default:
        GF_ASSERT(FALSE);
        return 0;
    }
}

RoamerSaveData *Save_Roamers_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_ROAMER);
}

void RoamerSave_SetOutbreakActive(SaveData *saveData) {
    RoamerSaveData *roamer = Save_Roamers_Get(saveData);
    roamer->outbreak = TRUE;
}

u8 RoamerSave_OutbreakActive(RoamerSaveData *roamerSave) {
    return roamerSave->outbreak;
}

void PlayerLocationHistoryPush(RoamerSaveData *roamerSave, u32 mapsec) {
    if (roamerSave->playerLocationHistory[0] != mapsec) {
        roamerSave->playerLocationHistory[1] = roamerSave->playerLocationHistory[0];
        roamerSave->playerLocationHistory[0] = mapsec;
    }
}

u32 PlayerLocationHistoryGetBack(RoamerSaveData *roamerSave) {
    return roamerSave->playerLocationHistory[1];
}

u8 Roamer_GetLocation(RoamerSaveData *roamerSave, int roamerId) {
    GF_ASSERT(roamerId < ROAMER_MAX);
    return roamerSave->locations[roamerId];
}

void Roamer_SetLocation(RoamerSaveData *roamerSave, int roamerId, u8 a2) {
    GF_ASSERT(roamerId < ROAMER_MAX);
    roamerSave->locations[roamerId] = a2;
}

u8 GetRoamerIsActiveByIndex(RoamerSaveData *roamerSave, int roamerId) {
    GF_ASSERT(roamerId < ROAMER_MAX);
    return roamerSave->data[roamerId].active;
}

void RoamerMon_Init(Roamer ** roamer_p) {
    memset(*roamer_p, 0, sizeof(Roamer));
}

Roamer *Roamers_GetRoamMonStats(RoamerSaveData *roamerSave, int roamerId) {
    GF_ASSERT(roamerId < ROAMER_MAX);
    return &roamerSave->data[roamerId];
}

int GetRoamerData(Roamer *roamer, int a1) {
    switch (a1) {
    case ROAMER_DATA_MET_LOCATION:
        return roamer->met_location;
    case ROAMER_DATA_IVS:
        return roamer->ivs;
    case ROAMER_DATA_PERSONALITY:
        return roamer->personality;
    case ROAMER_DATA_SPECIES:
        return roamer->species;
    case ROAMER_DATA_HP:
        return roamer->hp;
    case ROAMER_DATA_LEVEL:
        return roamer->level;
    case ROAMER_DATA_STATUS:
        return roamer->status;
    case ROAMER_DATA_ACTIVE:
        return roamer->active;
    default:
        GF_ASSERT(FALSE);
        return 0;
    }
}

void SetRoamerData(Roamer *roamer, int a1, int val) {
    switch (a1) {
    case ROAMER_DATA_MET_LOCATION:
        roamer->met_location = val;
        break;
    case ROAMER_DATA_IVS:
        roamer->ivs = val;
        break;
    case ROAMER_DATA_PERSONALITY:
        roamer->personality = val;
        break;
    case ROAMER_DATA_SPECIES:
        roamer->species = val;
        break;
    case ROAMER_DATA_HP:
        roamer->hp = val;
        break;
    case ROAMER_DATA_LEVEL:
        roamer->level = val;
        break;
    case ROAMER_DATA_STATUS:
        roamer->status = val;
        break;
    case ROAMER_DATA_ACTIVE:
        roamer->active = val;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }
}

u8 *RoamerSave_GetRepelAddr(RoamerSaveData *roamerSave) {
    return &roamerSave->repelSteps;
}

BOOL RoamerSave_RepelNotInUse(RoamerSaveData *roamerSave) {
    return roamerSave->repelSteps == 0;
}

void RoamerSave_SetFlute(RoamerSaveData *roamerSave, u8 flute) {
    GF_ASSERT(flute <= 2);
    roamerSave->flutePlayed = flute;
}

u8 RoamerSave_GetFlute(RoamerSaveData *roamerSave) {
    return roamerSave->flutePlayed;
}
