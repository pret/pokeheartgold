#include "global.h"
#include "field_system.h"
#include "location_backup.h"
#include "save_local_field_data.h"
#include "constants/maps.h"

static const Location sLocation_PlayerRoom = {
    .mapId     = MAP_T20R0202,
    .warpId    = 0xFFFFFFFF,
    .x         = 0x00000006,
    .y         = 0x00000006,
    .direction = 0x00000001,
};

static const Location sLocation_OutsidePlayerHome = {
    .mapId     = MAP_T20,
    .warpId    = 0xFFFFFFFF,
    .x         = 0x000002B7,
    .y         = 0x0000018D,
    .direction = 0x00000001,
};

void Location_SetToPlayerRoom(Location *dest) {
    const Location *src = &sLocation_PlayerRoom;
    *dest = *src;
}

void Location_SetToOutsidePlayerHome(Location *dest) {
    const Location *src = &sLocation_OutsidePlayerHome;
    *dest = *src;
}

void Save_SetPositionToPlayerRoom(SaveData *saveData) {
    Location *position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(saveData));
    Location_SetToPlayerRoom(position);
}
