#include "alph_checks.h"

#include "constants/maps.h"

#include "field_system.h"
#include "save_local_field_data.h"

BOOL CheckUseEscapeRopeInAlphChamber(FieldSystem *fieldSystem) {
    Location *position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(fieldSystem->saveData));

    if (position->mapId != MAP_RUINS_OF_ALPH_NORTHEAST_ENTRANCE_FIRST_ROOM) {
        return FALSE;
    }

    if (position->x != 6 || position->y != 3 || position->direction != DIR_NORTH) {
        return FALSE;
    }

    return TRUE;
}

BOOL CheckUseFlashInAlphChamber(FieldSystem *fieldSystem) {
    Location *position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(fieldSystem->saveData));

    if (position->mapId != MAP_RUINS_OF_ALPH_SOUTHEAST_ENTRANCE_FIRST_ROOM) {
        return FALSE;
    }

    if (position->x != 6 || position->y != 3 || position->direction != DIR_NORTH) {
        return FALSE;
    }

    return TRUE;
}

BOOL CheckUseWaterStoneInAlphChamber(FieldSystem *fieldSystem) {
    Location *position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(fieldSystem->saveData));

    if (position->mapId != MAP_RUINS_OF_ALPH_SOUTHWEST_ENTRANCE_FIRST_ROOM) {
        return FALSE;
    }

    if (position->x != 6 || position->y != 3 || position->direction != DIR_NORTH) {
        return FALSE;
    }

    return TRUE;
}
