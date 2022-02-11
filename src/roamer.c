#include "roamer.h"
#include "math_util.h"
#include "constants/roamer.h"

u32 Save_Roamers_sizeof(void) {
    return sizeof(ROAMER_SAVE);
}

void Save_Roamers_init(ROAMER_SAVE *roamer) {
    memset(roamer, 0, sizeof(ROAMER_SAVE));
    roamer->rand[0] = MTRandom();
    roamer->rand[1] = MTRandom();
    roamer->unk_64 = 0;
    roamer->repelSteps = 0;
    roamer->unk_66 = 0;
    roamer->flutePlayed = 0;
}

void Roamers_SetRand(ROAMER_SAVE *roamer, u32 param) {
    roamer->rand[0] = param;
    roamer->rand[1] = param;
}

u32 Roamers_GetRand(ROAMER_SAVE *roamer, u32 which) {
    switch (which) {
    case 1:
        return roamer->rand[0];
    case 2:
        return roamer->rand[1];
    default:
        GF_ASSERT(0);
        return 0;
    }
}

ROAMER_SAVE *Save_Roamers_get(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_ROAMER);
}

void sub_0202D9D0(SAVEDATA *saveData) {
    ROAMER_SAVE *roamer = Save_Roamers_get(saveData);
    roamer->unk_64 = 1;
}

u8 sub_0202D9E0(ROAMER_SAVE *roamerSave) {
    return roamerSave->unk_64;
}

void PlayerLocationHistoryPush(ROAMER_SAVE *roamerSave, u32 mapsec) {
    if (roamerSave->playerLocationHistory[0] != mapsec) {
        roamerSave->playerLocationHistory[1] = roamerSave->playerLocationHistory[0];
        roamerSave->playerLocationHistory[0] = mapsec;
    }
}

u32 PlayerLocationHistoryGetBack(ROAMER_SAVE *roamerSave) {
    return roamerSave->playerLocationHistory[1];
}

u8 Roamer_GetLocation(ROAMER_SAVE *roamerSave, int a1) {
    GF_ASSERT(a1 < ROAMER_MAX);
    return roamerSave->unk_60[a1];
}

void Roamer_SetLocation(ROAMER_SAVE *roamerSave, int a1, u8 a2) {
    GF_ASSERT(a1 < ROAMER_MAX);
    roamerSave->unk_60[a1] = a2;
}

u8 GetRoamerIsActiveByIndex(ROAMER_SAVE *roamerSave, int a1) {
    GF_ASSERT(a1 < ROAMER_MAX);
    return roamerSave->data[a1].active;
}

void RoamerMon_init(ROAMER ** roamer_p) {
    memset(*roamer_p, 0, sizeof(ROAMER));
}

ROAMER *Roamers_GetRoamMonStats(ROAMER_SAVE *roamerSave, int a1) {
    GF_ASSERT(a1 < ROAMER_MAX);
    return &roamerSave->data[a1];
}

int GetRoamerData(ROAMER *roamer, int a1) {
    switch (a1) {
    case ROAMER_DATA_UNK1:
        return roamer->unk_0;
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
    case ROAMER_DATA_UNK8:
        return roamer->active;
    default:
        GF_ASSERT(0);
        return 0;
    }
}

void SetRoamerData(ROAMER *roamer, int a1, int val) {
    switch (a1) {
    case ROAMER_DATA_UNK1:
        roamer->unk_0 = val;
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
    case ROAMER_DATA_UNK8:
        roamer->active = val;
        break;
    default:
        GF_ASSERT(0);
        break;
    }
}

u8 *RoamerSave_GetRepelAddr(ROAMER_SAVE *roamerSave) {
    return &roamerSave->repelSteps;
}

BOOL RoamerSave_RepelNotInUse(ROAMER_SAVE *roamerSave) {
    return roamerSave->repelSteps == 0;
}

void RoamerSave_SetFlute(ROAMER_SAVE *roamerSave, u8 a1) {
    GF_ASSERT(a1 <= 2);
    roamerSave->flutePlayed = a1;
}

u8 RoamerSave_GetFlute(ROAMER_SAVE *roamerSave) {
    return roamerSave->flutePlayed;
}
