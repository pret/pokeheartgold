#include "script.h"
#include "save_flypoints.h"
#include "map_events.h"
#include "system.h"
#include "constants/maps.h"

void sub_02052F30(FieldSystem *fsys) {
    BOOL r2 = FALSE;

    switch (fsys->location->mapId) {
    case MAP_D47R0102:
        fsys->unk70 = 1;
        return;
    case MAP_D31R0201:
    case MAP_D31R0202:
    case MAP_D31R0203:
    case MAP_D31R0204:
    case MAP_D31R0205:
    case MAP_D31R0206:
    case MAP_D31R0207:
        r2 = TRUE;
        break;
    }
    if (fsys->unk70 == 1) {
        fsys->unk70 = 0;
    }
    if (!r2 && fsys->unk70 == 4) {
        fsys->unk70 = 0;
    }
    if (r2) {
        fsys->unk70 = 4;
    }
}

void sub_02052F94(FieldSystem *fsys, Location *location) {
    FLYPOINTS_SAVE *flypointsSave = Save_FlyPoints_get(fsys->savedata);
    Location *r2 = sub_0203B960(flypointsSave);
    const WARP_EVENT *warp;
    if (location != NULL) {
        *r2 = *fsys->location;
        *fsys->location = *location;
    }
    Field_InitMapEvents(fsys, fsys->location->mapId);
    if (fsys->location->warpId != -1) {
        warp = Field_GetWarpEventI(fsys, fsys->location->warpId);
        fsys->location->x = warp->x;
        fsys->location->z = warp->y;
        if (warp->anchor == 0x100) {
            *FlyPoints_GetDynamicWarp(flypointsSave) = *sub_0203B95C(flypointsSave);
        }
    }
}

void sub_02053018(FieldSystem *fsys) {
    GF_ASSERT(fsys->unk70 < 6);
    gSystem.screensFlipped = fsys->unk74->unk0_0C;
}
