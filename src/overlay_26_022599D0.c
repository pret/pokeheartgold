#include "field_map_object.h"
#include "map_events.h"
#include "overlay_26.h"

static LocalMapObject* ov26_02259A24(FieldSystem* fieldSystem, LocalMapObject* a1, BOOL a2);

static void ov26_022599D0(LocalMapObject* last_talked, u16 movement) {
    sub_0205FC94(last_talked, movement);
}

void ov26_022599D8(FieldSystem* fieldSystem, LocalMapObject* last_talked) {
    if (last_talked == NULL) {
        return;
    }

    u32 movement;
    // FIXME: Define proper constants for these movements.
    u32 direction = MapObject_GetFacingDirection(last_talked);
    if (direction == DIR_NORTH) {
        movement = 14;
    } else if (direction == DIR_SOUTH) {
        movement = 15;
    } else if (direction == DIR_WEST) {
        movement = 16;
    } else {
        movement = 17;
    }

    LocalMapObject* unk_lmo = ov26_02259A24(fieldSystem, last_talked, TRUE);
    if (unk_lmo != NULL) {
        ov26_022599D0(unk_lmo, movement);
    }
    ov26_022599D0(last_talked, movement);
}

static LocalMapObject* ov26_02259A24(FieldSystem* fieldSystem, LocalMapObject* a1, BOOL a2) {
    u32 num_events = Field_GetNumObjectEvents(fieldSystem);
    u16 script = MapObject_GetScript(a1);
    u32 trainer = ScriptNumToTrainerNum(script);

    if (!TrainerNumIsDouble(trainer)) {
        return NULL;
    }

    for (int i = 0; i < num_events; i++) {
        LocalMapObject* object = GetMapObjectByID(fieldSystem->mapObjectMan, i);
        if (object == NULL) {
            continue;
        }

        if (!a2 && MapObject_GetMovement(object) == 49) {
            continue;
        }

        switch (MapObject_GetType(object)) {
        // FIXME: Define proper constants for these map object types.
        case 2:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 1:
            u32 script2 = MapObject_GetScript(object);
            u32 trainer2 = ScriptNumToTrainerNum((u16)script2);
            if (script != script2 && (u32)trainer == trainer2) {
                return object;
            }
        }
    }

    return NULL;
}
