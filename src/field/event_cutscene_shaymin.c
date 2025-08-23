#include "constants/sprites.h"

#include "overlay_2/event_cutscene.h"

#include "fieldmap.h"
#include "follow_mon.h"
#include "math_util.h"
#include "overlay_01_021F467C.h"
#include "overlay_01_021F944C.h"
#include "overlay_01_022053EC.h"
#include "script_pokemon_util.h"
#include "task.h"
#include "unk_0200FA24.h"
#include "unk_02062108.h"
#include "unk_020689C8.h"

typedef struct UnkStruct_022523D0 {
    int unk0;
    u32 unk4;
    u32 unk8;
} UnkStruct_022523D0;

static BOOL ov02_022523D0(TaskManager *taskMan);

BOOL ov02_02252334(FieldSystem *fieldSystem) {
    if (!MapObject_AreBitsSetForMovementScriptInit(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar))) {
        return FALSE;
    }
    if (FollowMon_IsActive(fieldSystem) && fieldSystem->followMon.species == SPECIES_SHAYMIN) {
        Pokemon *mon = GetFirstAliveMonInParty_CrashIfNone(SaveArray_Party_Get(fieldSystem->saveData));
        u32 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        u32 form = GetMonData(mon, MON_DATA_FORM, NULL);
        GF_ASSERT(species == fieldSystem->followMon.species);
        // yes, this is explicitly checked twice
        if (species != fieldSystem->followMon.species) {
            return FALSE;
        }
        if (fieldSystem->followMon.form == SHAYMIN_SKY && form == SHAYMIN_LAND) {
            return TRUE;
        }
    }
    return FALSE;
}

void ov02_022523B4(TaskManager *taskMan) {
    UnkStruct_022523D0 *data = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnkStruct_022523D0));
    TaskManager_Call(taskMan, ov02_022523D0, data);
}

static BOOL ov02_022523D0(TaskManager *taskMan) {
    int *state = TaskManager_GetStatePtr(taskMan);
    VecFx32 pos;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskMan);
    UnkStruct_022523D0 *env = TaskManager_GetEnvironment(taskMan);
    switch (*state) {
    case 0:
        MapObject_UnpauseMovement(FollowMon_GetMapObject(fieldSystem));
        TaskManager_Call(fieldSystem->taskman, ov01_02205A60, NULL);
        (*state)++;
        break;
    case 1:
        MapObject_CopyPositionVector(FollowMon_GetMapObject(fieldSystem), &pos);
        u32 res;
        if (FollowMon_IsVisible(fieldSystem)) {
            env->unk4 = ov01_022052C4(fieldSystem->unk_44, &pos);
            res = 1;
        } else {
            env->unk4 = 0;
            res = 0;
        }
        env->unk8 = res;
        env->unk0 = 0;
        FollowMon_SetObjectParams(fieldSystem->followMon.mapObject, SPECIES_SHAYMIN, 0, fieldSystem->followMon.shiny);
        (*state)++;
        break;
    case 2:
        if (env->unk8 != 0) {
            if (++env->unk0 >= 4) {
                ov01_021FA930(fieldSystem->followMon.mapObject, SPRITE_FOLLOWER_MON_SHAYMIN);
                (*state)++;
            }
            break;
        }
        MapObjectManager *mapObjectMan = MapObject_GetManager(fieldSystem->followMon.mapObject);
        u32 spriteId = MapObject_GetSpriteID(fieldSystem->followMon.mapObject);
        sub_0205E420(fieldSystem->followMon.mapObject);
        ov01_021FA108(mapObjectMan, spriteId, fieldSystem->followMon.mapObject);
        sub_0205E38C(fieldSystem->followMon.mapObject, SPRITE_FOLLOWER_MON_SHAYMIN);
        (*state)++;
        break;
    case 3:
        if (ov01_021FA2D4(fieldSystem->followMon.mapObject) == 0) {
            fieldSystem->followMon.form = 0;
            (*state)++;
        }
        break;
    case 4:
        u32 var = 0;
        if (env->unk4 == 0) {
            var = 1;
        } else if (ov01_022052F4()) {
            sub_02068B48(env->unk4);
            var = 1;
        }
        if (var != 0) {
            Heap_Free(env);
            MapObject_PauseMovement(FollowMon_GetMapObject(fieldSystem));
            return TRUE;
        }
        break;
    }
    return FALSE;
}
