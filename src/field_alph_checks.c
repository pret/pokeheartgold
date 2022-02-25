#include "constants/maps.h"
#include "script.h"

typedef struct FlyPoints FlyPoints;
extern FlyPoints* Save_FlyPoints_get(SAVEDATA*);
extern Location* FlyPoints_GetPosition(FlyPoints*);

BOOL CheckUseEscapeRopeInAlphChamber(FieldSystem* fsys) {
    Location* position = FlyPoints_GetPosition(Save_FlyPoints_get(fsys->savedata));

    if (position->mapId != MAP_D24R0202) {
        return FALSE;
    }

    if (position->x != 6 || position->z != 3 || position->direction != 0) {
        return FALSE;
    }

    return TRUE;
}

BOOL CheckUseFlashInAlphChamber(FieldSystem* fsys) {
    Location* position = FlyPoints_GetPosition(Save_FlyPoints_get(fsys->savedata));

    if (position->mapId != MAP_D24R0204) {
        return FALSE;
    }

    if (position->x != 6 || position->z != 3 || position->direction != 0) {
        return FALSE;
    }

    return TRUE;
}

BOOL CheckUseWaterStoneInAlphChamber(FieldSystem* fsys) {
    Location* position = FlyPoints_GetPosition(Save_FlyPoints_get(fsys->savedata));

    if (position->mapId != MAP_D24R0206) {
        return FALSE;
    }

    if (position->x != 6 || position->z != 3 || position->direction != 0) {
        return FALSE;
    }

    return TRUE;
}
