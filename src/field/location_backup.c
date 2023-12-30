#include "global.h"
#include "field_system.h"
#include "field/location_backup.h"
#include "save_local_field_data.h"

static const Location _020FA17C = {
    .mapId     = 0x00000040,
    .warpId    = 0xFFFFFFFF,
    .x         = 0x00000006,
    .y         = 0x00000006,
    .direction = 0x00000001,
};

static const Location _020FA190 = {
    .mapId     = 0x0000003C,
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
