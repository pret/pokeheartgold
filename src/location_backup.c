#include "global.h"
#include "field_system.h"
#include "location_backup.h"
#include "save_local_field_data.h"
#include "constants/maps.h"

static const Location _020FA17C = {
    .mapId     = MAP_T20R0202,
    .warpId    = 0xFFFFFFFF,
    .x         = 0x00000006,
    .y         = 0x00000006,
    .direction = 0x00000001,
};

static const Location _020FA190 = {
    .mapId     = MAP_T20,
    .warpId    = 0xFFFFFFFF,
    .x         = 0x000002B7,
    .y         = 0x0000018D,
    .direction = 0x00000001,
};

void LocationData_BackUp(Location *location) {
    const Location *src = &_020FA17C;
    *location = *src;
}

void LocationData_Restore(Location *location) {
    const Location *src = &_020FA190;
    *location = *src;
}

void Save_CurrentLocation_BackUp(SaveData *saveData) {
    Location *position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(saveData));
    LocationData_BackUp(position);
}
