#include "global.h"
#include "field_system.h"
#include "gymmick.h"
#include "gymmick_init.h"
#include "math_util.h"
#include "player_data.h"
#include "save.h"
#include "save_misc_data.h"
#include "constants/badge.h"

#define NUM_TRASH_CANS 15

typedef struct TrashCan {
    int numNeighbors;
    u8 neighbors[4];
} TrashCan;

static const TrashCan sTrashCans[NUM_TRASH_CANS] = {
    [0]  = {.numNeighbors = 2, .neighbors = { 1,   5,  0xFF, 0xFF }},
    [1]  = {.numNeighbors = 3, .neighbors = { 0,   2,     6, 0xFF }},
    [2]  = {.numNeighbors = 3, .neighbors = { 1,   3,     7, 0xFF }},
    [3]  = {.numNeighbors = 3, .neighbors = { 2,   4,     8, 0xFF }},
    [4]  = {.numNeighbors = 2, .neighbors = { 3,   9,  0xFF, 0xFF }},
    [5]  = {.numNeighbors = 3, .neighbors = { 0,   6,    10, 0xFF }},
    [6]  = {.numNeighbors = 4, .neighbors = { 1,   5,     7,   11 }},
    [7]  = {.numNeighbors = 4, .neighbors = { 2,   6,     8,   12 }},
    [8]  = {.numNeighbors = 4, .neighbors = { 3,   7,     9,   13 }},
    [9]  = {.numNeighbors = 3, .neighbors = { 4,   8,    14, 0xFF }},
    [10] = {.numNeighbors = 2, .neighbors = { 5,   11, 0xFF, 0xFF }},
    [11] = {.numNeighbors = 3, .neighbors = { 6,   10,   12, 0xFF }},
    [12] = {.numNeighbors = 3, .neighbors = { 7,   11,   13, 0xFF }},
    [13] = {.numNeighbors = 3, .neighbors = { 8,   12,   14, 0xFF }},
    [14] = {.numNeighbors = 2, .neighbors = { 9 ,  13, 0xFF, 0xFF }},
};

void InitEcruteakGym(FieldSystem *fieldSystem) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    Save_Gymmick_Init(gymmick, GYMMICK_ECRUTEAK);
    
    GymmickUnion *data = Save_Gymmick_AssertMagic_GetData(gymmick, GYMMICK_ECRUTEAK);
    for (int i = 0; i < 4; i++) {
        data->ecruteak.candles[i] = 0;
    }
}

void InitCianwoodGym(FieldSystem *fieldSystem) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    Save_Gymmick_Init(gymmick, GYMMICK_CIANWOOD);

    GymmickUnion *unused = Save_Gymmick_AssertMagic_GetData(gymmick, GYMMICK_CIANWOOD);
}

void InitVermilionGym(FieldSystem *fieldSystem) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    Save_Gymmick_Init(gymmick, GYMMICK_VERMILION);

    GymmickUnion *data = Save_Gymmick_AssertMagic_GetData(gymmick, GYMMICK_VERMILION);
    if (PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfileAddr(fieldSystem->saveData), BADGE_THUNDER)) {
        data->vermilion.switches[0] = 0;
        data->vermilion.switches[1] = 0;
        data->vermilion.gates[0] = 1;
        data->vermilion.gates[1] = 1;
        return;
    }

    PlaceVermilionGymSwitches(fieldSystem);
    data->vermilion.gates[0] = 0;
    data->vermilion.gates[1] = 0;
}

void PlaceVermilionGymSwitches(FieldSystem *fieldSystem) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    GymmickUnion *data = Save_Gymmick_AssertMagic_GetData(gymmick, GYMMICK_VERMILION);
    data->vermilion.switches[0] = LCRandom() % NUM_TRASH_CANS;

    const TrashCan *trashCan = &sTrashCans[data->vermilion.switches[0]];
    u8 index = LCRandom() % trashCan->numNeighbors;
    data->vermilion.switches[1] = trashCan->neighbors[index];
}

void InitVioletGym(FieldSystem *fieldSystem) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    Save_Gymmick_Init(gymmick, GYMMICK_VIOLET);

    GymmickUnion *data = Save_Gymmick_AssertMagic_GetData(gymmick, GYMMICK_VIOLET);
    data->violet.liftState = 0;
}

void InitAzaleaGym(FieldSystem *fieldSystem) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    Save_Gymmick_Init(gymmick, GYMMICK_AZALEA);

    GymmickUnion *data = Save_Gymmick_AssertMagic_GetData(gymmick, GYMMICK_AZALEA);
    data->azalea.spiders[0] = 0;
    data->azalea.spiders[1] = 1;
    data->azalea.spiders[2] = 2;
    data->azalea.spiders[3] = 7;
    data->azalea.switches = 0;
}

void InitBlackthornGym(FieldSystem *fieldSystem) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    Save_Gymmick_Init(gymmick, GYMMICK_BLACKTHORN);

    GymmickUnion *data = Save_Gymmick_AssertMagic_GetData(gymmick, GYMMICK_BLACKTHORN);

    data->blackthorn.x[0] = 13;
    data->blackthorn.z[0] = 75;
    data->blackthorn.rot[0] = 0;

    data->blackthorn.x[1] = 9;
    data->blackthorn.z[1] = 58;
    data->blackthorn.rot[1] = 1;

    data->blackthorn.x[2] = 14;
    data->blackthorn.z[2] = 32;
    data->blackthorn.rot[2] = 0;
}

void InitFuchsiaGym(FieldSystem *fieldSystem) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    Save_Gymmick_Init(gymmick, GYMMICK_FUCHSIA);
}

void InitViridianGym(FieldSystem *fieldSystem) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    Save_Gymmick_Init(gymmick, GYMMICK_VIRIDIAN);
}

BOOL FieldSystem_IsSaveGymmickTypeEqualTo(FieldSystem *fieldSystem, int kind) {
    return Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem))) == kind;
}
