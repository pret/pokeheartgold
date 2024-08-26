#include "global.h"
#include "map_object.h"
#include "field_player_avatar.h"
#include "filesystem.h"
#include "heap.h"
#include "overlay_01_021F944C.h"
#include "constants/sprites.h"
#include "sys_task_api.h"
#include "unk_0205FD20.h"

extern void sub_020611DC(LocalMapObject *object);
extern BOOL sub_02061248(FieldSystem *fieldSystem, VecFx32 *, BOOL);
extern void MapObject_ClearHeldMovement(LocalMapObject *object);

static MapObjectManager *MapObjectManager_New(u32 objectCount);
static LocalMapObject *MapObject_CreateFromObjectEvent(MapObjectManager *manager, ObjectEvent *objectEvent, u32 mapNo);
static void SavedMapObject_InitFromLocalMapObject(FieldSystem *fieldSystem, LocalMapObject *localObject, SavedMapObject *savedObject);
static void LocalMapObject_InitFromSavedMapObject(LocalMapObject *localObject, SavedMapObject *savedObject);
static void sub_0205E8EC(MapObjectManager *manager, LocalMapObject *object);
static void sub_0205E934(LocalMapObject *object);
static void MapObject_ConvertXYToPositionVec(LocalMapObject *object);
static void MapObject_CreateFromInitArgs(MapObjectInitArgs *args);
static LocalMapObject *MapObjectManager_GetFirstInactiveObject(MapObjectManager *manager);
static LocalMapObject *sub_0205EA98(MapObjectManager *manager, u32 id, u32 mapNo);
static void sub_0205EAF0(MapObjectManager *manager, LocalMapObject *object);
static void MapObject_InitFromObjectEvent(LocalMapObject *object, ObjectEvent *objectEvent, FieldSystem *fieldSystem);
static void MapObject_SetPositionVecFromObjectEvent(LocalMapObject *object, ObjectEvent *objectEvent);
static void sub_0205EC90(LocalMapObject *object, MapObjectManager *manager);
static void sub_0205ECE0(LocalMapObject *object);
static void sub_0205ED18(LocalMapObject *object);
static void MapObject_Clear(LocalMapObject *object);
static u32 sub_0205ED90(LocalMapObject *object, u32 flagId, u32 objectEventCount, ObjectEvent *objectEvents);
static LocalMapObject *MapObjectManager_GetFirstObjectWithID(MapObjectManager *manager, u32 objectId, u32 flagId);
static void sub_0205EF48(LocalMapObject *object);
static void sub_0205EF5C(LocalMapObject *object);
static void MapObject_NoOp(LocalMapObject *object);
static u32 FieldSystem_ResolveObjectSpriteID(FieldSystem *fieldSystem, s32 spriteId);
static void sub_0205EFA4(LocalMapObject *object);

static void sub_0205EF8C(LocalMapObject *object);

MapObjectManager *MapObjectManager_Init(FieldSystem *fieldSystem, u32 objectCount, u32 priority) {
    MapObjectManager *ret = MapObjectManager_New(objectCount);
    MapObjectManager_SetFieldSystemPtr(ret, fieldSystem);
    MapObjectManager_SetObjectCount(ret, objectCount);
    MapObjectManager_SetPriority(ret, priority);

    return ret;
}

void MapObjectManager_Delete(MapObjectManager *manager) {
    FreeToHeapExplicit(HEAP_ID_FIELD, MapObjectManager_GetObjects(manager));
    FreeToHeapExplicit(HEAP_ID_FIELD, manager);
}

void sub_0205E104(MapObjectManager *manager, u32 unused, u32 flagId, u32 objectCount, ObjectEvent *objectEvents) {
    u32 count = MapObjectManager_GetObjectCount(manager);
    LocalMapObject *objects = MapObjectManager_GetObjects(manager);

    for (; count != 0; count--) {
        if (MapObject_IsInUse(objects) == TRUE) {
            switch (sub_0205ED90(objects, flagId, objectCount, objectEvents)) {
                case 0:
                    if (sub_0205F254(objects) != flagId && !MapObject_TestFlagsBits(objects, MAPOBJECTFLAG_UNK10)) {
                        MapObject_Remove(objects);
                    }
                    break;

                case 1:
                case 2:
                    break;
                
            }
        }
        objects++;
    }

    ov01_021F9FB0(manager, sub_0205F1A0(manager));
}

static MapObjectManager *MapObjectManager_New(u32 objectCount) {
    LocalMapObject *objects;
    MapObjectManager *manager = AllocFromHeap(HEAP_ID_FIELD, sizeof(MapObjectManager));
    GF_ASSERT(manager != NULL);
    memset(manager, 0, sizeof(MapObjectManager));

    objects = AllocFromHeap(HEAP_ID_FIELD, objectCount * sizeof(LocalMapObject));
    GF_ASSERT(objects != NULL);
    memset(objects, 0, objectCount * sizeof(LocalMapObject));

    MapObjectManager_SetObjects(manager, objects);

    return manager;
}

static LocalMapObject *MapObject_CreateFromObjectEvent(MapObjectManager *manager, ObjectEvent *objectEvent, u32 mapNo) {
    LocalMapObject *ret;
    ObjectEvent event = *objectEvent;
    ObjectEvent *eventPtr = &event;

    u32 objectId = ObjectEvent_GetID(eventPtr);
    if (!ObjectEvent_ScriptIDIsUnset(eventPtr)) {
        ret = sub_0205EA98(manager, objectId, mapNo);
        if (ret != NULL) {
            sub_0205F014(ret, eventPtr, mapNo);
            return ret;
        }
    } else {
        ret = MapObjectManager_GetFirstObjectWithID(manager, objectId, ObjectEvent_GetFlagID_AssertScriptIDIsUnset(eventPtr));
        if (ret != NULL) {
            sub_0205F058(ret, mapNo, eventPtr);
            return ret;
        }
    }

    ret = MapObjectManager_GetFirstInactiveObject(manager);
    if (ret == NULL) {
        return ret;
    }

    MapObject_InitFromObjectEvent(ret, eventPtr, MapObjectManager_GetFieldSystemPtr(manager));
    sub_0205EC90(ret, manager);
    sub_0205F250(ret, mapNo);
    sub_0205EFA4(ret);
    sub_0205EFB4(ret);
    MapObject_SetFlagsBits(ret, MAPOBJECTFLAG_UNK2);
    sub_0205EAF0(manager, ret);
    sub_0205F16C(MapObjectManager_Get(manager));
    return ret;
}

LocalMapObject *MapObject_Create(MapObjectManager *manager, u32 x, u32 y, u32 direction, u32 sprite, u32 movement, u32 mapNo) {
    return MapObject_CreateWithParams(manager, x, y, direction, sprite, movement, mapNo, 0, 0, 0);
}

LocalMapObject *MapObject_CreateWithParams(MapObjectManager *manager, u32 x, u32 y, u32 direction, u32 sprite, u32 movement, u32 mapNo, u32 param0, u32 param1, u32 param2) {
    ObjectEvent objectEvent;
    ObjectEvent_SetId(&objectEvent, 0);
    ObjectEvent_SetSprite(&objectEvent, sprite);
    ObjectEvent_SetMovement(&objectEvent, movement);
    ObjectEvent_SetType(&objectEvent, 0);
    ObjectEvent_SetFlagId(&objectEvent, 0);
    ObjectEvent_SetScript(&objectEvent, 0);
    ObjectEvent_SetFacing(&objectEvent, direction);
    ObjectEvent_SetParam(&objectEvent, param0, 0);
    ObjectEvent_SetParam(&objectEvent, param1, 1);
    ObjectEvent_SetParam(&objectEvent, param2, 2);
    ObjectEvent_SetXRange(&objectEvent, 0);
    ObjectEvent_SetYRange(&objectEvent, 0);
    ObjectEvent_SetXCoord(&objectEvent, x);
    ObjectEvent_SetYCoord(&objectEvent, y);
    ObjectEvent_SetHeight(&objectEvent, 0);

    return MapObject_CreateFromObjectEvent(manager, &objectEvent, mapNo);
}

LocalMapObject *MapObject_CreateFromObjectEventWithId(MapObjectManager *manager, u16 id, u32 objectEventCount, u32 mapNo, const ObjectEvent *events) {
    LocalMapObject *ret = NULL;
    ObjectEvent *objectEvent = ObjectEvent_GetById(id, objectEventCount, (ObjectEvent *)events);
    if (objectEvent != NULL) {
        u32 flagId = ObjectEvent_GetFlagID(objectEvent);
        FieldSystem* fieldSystem = MapObjectManager_GetFieldSystemPtr(manager);
        if (FieldSystem_FlagCheck(fieldSystem, (u16)flagId) == FALSE) {
            ret = MapObject_CreateFromObjectEvent(manager, objectEvent, mapNo);
        }
    }

    return ret;
}

void sub_0205E38C(LocalMapObject *object, u32 sprite) {
    MapObject_SetSpriteID(object, sprite);
    sub_0205EF48(object);
    MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK14);
    sub_0205EFB4(object);
}

void sub_0205E3AC(LocalMapObject *object, u32 sprite) {
    if (sub_0205F73C(object) == TRUE) {
        sub_0205E420(object);
    }
    sub_0205E38C(object, sprite);
}

void MapObject_Remove(LocalMapObject *object) {
    if (sub_0205F5D4(MapObject_GetManager(object)) == TRUE) {
        sub_0205F498(object);
    }
    sub_0205F444(object);
    sub_0205F348(object);
    sub_0205F174(sub_0205F364(object));
    MapObject_Clear(object);
}

void MapObject_Delete(LocalMapObject *object) {
    u32 flagId = MapObject_GetFlagID(object);
    FieldSystem *fieldSystem = MapObject_GetFieldSystem(object);
    FieldSystem_FlagSet(fieldSystem, flagId);
    MapObject_Remove(object);
}

void sub_0205E420(LocalMapObject *object) {
    if (sub_0205F5D4(MapObject_GetManager(object)) == TRUE) {
        if (MapObject_GetFlagsBits(object, MAPOBJECTFLAG_UNK14) != 0) {
            sub_0205F498(object);
        }
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK14);
    }
    MapObject_SetSpriteID(object, MAP_OBJECT_GFX_ID_INVALID);
    sub_0205F468(object, sub_0205FCC4);
    sub_0205F47C(object, sub_0205FCC8);
    sub_0205F490(object, sub_0205FCC8);
    sub_0205F4A4(object, sub_0205FCCC);
    sub_0205F4B8(object, sub_0205FCD0);
}

void MapObjectManager_RemoveAllActiveObjects(MapObjectManager *manager) {
    s32 i = 0;
    s32 count = MapObjectManager_GetObjectCount(manager);
    LocalMapObject *objects = MapObjectManager_GetObjects(manager);

    do { //BUG: does not check for if count is zero, and will always execute at least once
        if (MapObject_GetFlagsBits(objects, MAPOBJECTFLAG_ACTIVE) != 0) {
            MapObject_Remove(objects);
        }

        i++;
        objects++;
    } while (i < count);
}

void sub_0205E4C8(MapObjectManager *manager) {
    GF_ASSERT(sub_0205F5D4(manager) == TRUE);

    s32 i = 0;
    s32 count = MapObjectManager_GetObjectCount(manager);
    LocalMapObject *objects = MapObjectManager_GetObjects(manager);

    do {
        if (MapObject_GetFlagsBits(objects, MAPOBJECTFLAG_ACTIVE) != 0 && MapObject_GetFlagsBits(objects, MAPOBJECTFLAG_UNK14) != 0) {
            sub_0205F4AC(objects);
            MapObject_NoOp(objects);
        }

        i++;
        objects++;
    } while (i < count);
}

void sub_0205E520(MapObjectManager *manager) {
    GF_ASSERT(sub_0205F5D4(manager) == TRUE);

    s32 i = 0;
    s32 count = MapObjectManager_GetObjectCount(manager);
    LocalMapObject *objects = MapObjectManager_GetObjects(manager);

    do {
        if (MapObject_IsInUse(objects) == TRUE) {
            if (MapObject_CheckFlag14(objects) == TRUE) {
                sub_0205F4C0(objects);
            } else {
                sub_0205EFB4(objects);
            }

            sub_0205EF48(objects);
            sub_020611DC(objects);
        }

        i++;
        objects++;
    } while (i < count);
}

//exactly the same as above, except it checks if object id is 0xFF
void sub_0205E580(MapObjectManager *manager) {
    GF_ASSERT(sub_0205F5D4(manager) == TRUE);

    s32 i = 0;
    s32 count = MapObjectManager_GetObjectCount(manager);
    LocalMapObject *objects = MapObjectManager_GetObjects(manager);

    do {
        if (MapObject_IsInUse(objects) == TRUE && MapObject_GetID(objects) == 0xFF) { //todo: const (is this invalid ID? or just max?)
            if (MapObject_CheckFlag14(objects) == TRUE) {
                sub_0205F4C0(objects);
            } else {
                sub_0205EFB4(objects);
            }

            sub_0205EF48(objects);
            sub_020611DC(objects);

            return;
        }

        i++;
        objects++;
    } while (i < count);
}

void FieldSystem_SyncMapObjectsToSaveEx(FieldSystem *fieldSystem, MapObjectManager *manager, SavedMapObject *savedObjects, s32 count) {
    s32 index = 0;
    LocalMapObject *object;

    while (MapObjectManager_GetNextObjectWithFlagFromIndex(manager, &object, &index, MAPOBJECTFLAG_ACTIVE)) { //MapObjectManager_GetNextActiveObject? this is an iterator however
        SavedMapObject_InitFromLocalMapObject(fieldSystem, object, savedObjects);

        count--;
        savedObjects++;

        GF_ASSERT(count > 0);
    }

    if (count != 0) {
        memset(savedObjects, 0, count * sizeof(SavedMapObject));
    }
}

void MapObjectManager_RestoreFromSave(MapObjectManager *manager, SavedMapObject *savedObjects, u32 objectCount) {
    while (objectCount > 0) {
        if ((savedObjects->flags & MAPOBJECTFLAG_ACTIVE)) {
            LocalMapObject *localObject = MapObjectManager_GetFirstInactiveObject(manager);
            GF_ASSERT(localObject != NULL);

            LocalMapObject_InitFromSavedMapObject(localObject, savedObjects);
            sub_0205E8EC(manager, localObject);
        }
        savedObjects++;
        objectCount--;
    }
}

static void SavedMapObject_InitFromLocalMapObject(FieldSystem *fieldSystem, LocalMapObject *localObject, SavedMapObject *savedObject) {
    savedObject->flags = MapObject_GetFlagsWord(localObject);
    savedObject->flags2 = MapObject_GetFlags2Word(localObject);
    savedObject->objId = MapObject_GetID(localObject);
    savedObject->unk10 = sub_0205F254(localObject);
    savedObject->spriteId = MapObject_GetSpriteID(localObject);
    savedObject->movement = MapObject_GetMovement(localObject);
    savedObject->type = MapObject_GetType(localObject);
    savedObject->flagId = MapObject_GetFlagID(localObject);
    savedObject->script = MapObject_GetScript(localObject);
    savedObject->initialFacing = MapObject_GetInitialFacingDirection(localObject);
    savedObject->currentFacing = MapObject_GetFacingDirection(localObject);
    savedObject->nextFacing = MapObject_GetNextFacingDirection(localObject);
    savedObject->param[0] = MapObject_GetParam(localObject, 0);
    savedObject->param[1] = MapObject_GetParam(localObject, 1);
    savedObject->param[2] = MapObject_GetParam(localObject, 2);
    savedObject->xRange = MapObject_GetXRange(localObject);
    savedObject->yRange = MapObject_GetYRange(localObject);
    savedObject->initialX = MapObject_GetInitialX(localObject);
    savedObject->initialHeight = MapObject_GetInitialHeight(localObject);
    savedObject->initialY = MapObject_GetInitialY(localObject);
    savedObject->currentX = MapObject_GetCurrentX(localObject);
    savedObject->currentHeight = MapObject_GetCurrentHeight(localObject);
    savedObject->currentY = MapObject_GetCurrentY(localObject);

    VecFx32 coords;
    sub_020611C8(savedObject->currentX, savedObject->currentY, &coords); //some kind of x y vec copy with convertion between int and fx32
    coords.y = MapObject_GetPosVecYCoord(localObject);

    if (!sub_02061248(fieldSystem, &coords, MapObject_CheckFlag29(localObject))) {
        savedObject->vecY = MapObject_GetPosVecYCoord(localObject);
    } else {
        if (MapObject_CheckIgnoreHeights(localObject) == TRUE) {
            coords.y = MapObject_GetPosVecYCoord(localObject);
        }
        savedObject->vecY = coords.y;
    }

    memcpy(savedObject->unk30, sub_0205F394(localObject), 16);
    memcpy(savedObject->unk40, sub_0205F3BC(localObject), 16);
}

static void LocalMapObject_InitFromSavedMapObject(LocalMapObject *localObject, SavedMapObject *savedObject) {
    MapObject_SetFlagsWord(localObject, savedObject->flags);
    MapObject_SetFlags2Word(localObject, savedObject->flags2);
    MapObject_SetID(localObject, savedObject->objId);
    sub_0205F250(localObject, savedObject->unk10);
    MapObject_SetSpriteID(localObject, savedObject->spriteId);
    MapObject_SetMovement(localObject, savedObject->movement);
    MapObject_SetType(localObject, savedObject->type);
    MapObject_SetFlagID(localObject, savedObject->flagId);
    MapObject_SetScript(localObject, savedObject->script);
    MapObject_SetInitialFacingDirection(localObject, savedObject->initialFacing);
    MapObject_SetFacingDirectionDirect(localObject, savedObject->currentFacing);
    MapObject_SetNextFacingDirection(localObject, savedObject->nextFacing);
    MapObject_SetParam(localObject, savedObject->param[0], 0);
    MapObject_SetParam(localObject, savedObject->param[1], 1);
    MapObject_SetParam(localObject, savedObject->param[2], 2);
    MapObject_SetXRange(localObject, savedObject->xRange);
    MapObject_SetYRange(localObject, savedObject->yRange);
    MapObject_SetInitialX(localObject, savedObject->initialX);
    MapObject_SetInitialHeight(localObject, savedObject->initialHeight);
    MapObject_SetInitialY(localObject, savedObject->initialY);
    MapObject_SetCurrentX(localObject, savedObject->currentX);
    MapObject_SetCurrentHeight(localObject, savedObject->currentHeight);
    MapObject_SetCurrentY(localObject, savedObject->currentY);

    VecFx32 coords = {};
    coords.y = savedObject->vecY;
    MapObject_SetPositionVec(localObject, &coords);

    memcpy(sub_0205F394(localObject), savedObject->unk30, 16);
    memcpy(sub_0205F3BC(localObject), savedObject->unk40, 16);
}

static void sub_0205E8EC(MapObjectManager *manager, LocalMapObject *object) {
    sub_0205E934(object);
    MapObject_ConvertXYToPositionVec(object);
    MapObject_SetManager(object, manager);
    sub_0205ECE0(object);
    MapObject_ClearHeldMovement(object);
    sub_0205EFB4(object);
    sub_0205EAF0(manager, object);
    sub_0205F450(object);
    sub_0205F16C(MapObjectManager_Get(manager));
}

static void sub_0205E934(LocalMapObject *object) {
    MapObject_SetFlagsBits(object, (MapObjectFlagBits)(MAPOBJECTFLAG_UNK2 | MAPOBJECTFLAG_ACTIVE));
    MapObject_ClearFlagsBits(object, (MapObjectFlagBits)(MAPOBJECTFLAG_IGNORE_HEIGHTS | MAPOBJECTFLAG_UNK22 |
                                                         MAPOBJECTFLAG_UNK21 | MAPOBJECTFLAG_UNK19 | MAPOBJECTFLAG_UNK18 |
                                                         MAPOBJECTFLAG_UNK17 | MAPOBJECTFLAG_UNK16 | MAPOBJECTFLAG_UNK14 |
                                                         MAPOBJECTFLAG_VISIBLE | MAPOBJECTFLAG_MOVEMENT_PAUSED | MAPOBJECTFLAG_UNK3));
    sub_0205EF5C(object);
}

static void MapObject_ConvertXYToPositionVec(LocalMapObject *object) {
    VecFx32 position;
    MapObject_GetPositionVec(object, &position);

    u32 x = MapObject_GetCurrentX(object);
    position.x = x * FX32_CONST(16) + FX32_CONST(8);
    MapObject_SetPreviousX(object, x);

    MapObject_SetPreviousHeight(object, MapObject_GetCurrentHeight(object));

    u32 y = MapObject_GetCurrentY(object);
    position.z = y * FX32_CONST(16) + FX32_CONST(8);
    MapObject_SetPreviousY(object, y);

    MapObject_SetPositionVec(object, &position);
}

void MapObject_CreateFromMultipleObjectEvents(MapObjectManager *manager, u32 mapNo, u32 objectEventCount, ObjectEvent *objectEvents) {
    GF_ASSERT(objectEventCount != 0);

    ObjectEvent *objectEventsCopy = AllocFromHeapAtEnd(HEAP_ID_FIELD, objectEventCount * sizeof(ObjectEvent));
    GF_ASSERT(objectEventsCopy != NULL);
    memcpy(objectEventsCopy, objectEvents, objectEventCount * sizeof(ObjectEvent));

    MapObjectInitArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(MapObjectInitArgs));
    GF_ASSERT(args != NULL);
    args->mapNo = mapNo;
    args->objectEventCount = objectEventCount;
    args->index = 0;
    args->manager = manager;
    args->objectEvents = objectEventsCopy;

    MapObject_CreateFromInitArgs(args);
}

static void MapObject_CreateFromInitArgs(MapObjectInitArgs *args) {
    FieldSystem *fieldSystem = MapObjectManager_GetFieldSystemPtr(args->manager);
    ObjectEvent *objectEvents = args->objectEvents;

    do {
        GF_ASSERT((ObjectEvent_ScriptIDIsUnset(objectEvents) != TRUE && FieldSystem_FlagCheck(fieldSystem, objectEvents->flag) != FALSE) ||
                  MapObject_CreateFromObjectEvent(args->manager, objectEvents, args->mapNo) != NULL);

        objectEvents++;
        args->index++;
    } while (args->index < args->objectEventCount);

    FreeToHeapExplicit(HEAP_ID_FIELD, args->objectEvents);
    FreeToHeapExplicit(HEAP_ID_FIELD, args);
}

static LocalMapObject *MapObjectManager_GetFirstInactiveObject(MapObjectManager *manager) {
    s32 i = 0;
    s32 count = MapObjectManager_GetObjectCount(manager);
    LocalMapObject *objects = MapObjectManager_GetObjects(manager);

    do {
        if (MapObject_GetFlagsBits(objects, MAPOBJECTFLAG_ACTIVE) == 0) {
            return objects;
        }

        i++;
        objects++;
    } while (i < count);

    return NULL;
}

static LocalMapObject *sub_0205EA98(MapObjectManager *manager, u32 id, u32 mapNo) { //find corresponding LMO with ID and mapNo?
    s32 index = 0;
    LocalMapObject *object;

    while (MapObjectManager_GetNextObjectWithFlagFromIndex(manager, &object, &index, MAPOBJECTFLAG_ACTIVE) == TRUE) {
        if (MapObject_CheckFlag25(object) == TRUE && MapObject_GetID(object) == id && sub_0205F544(object) == mapNo) {
            return object;
        }
    }

    return NULL;
}

static void sub_0205EAF0(MapObjectManager *manager, LocalMapObject *object) {
    u32 priority = MapObjectManager_GetPriority(manager);
    u32 movement = MapObject_GetMovement(object);
    if (movement == 48 || movement == 50) {
        priority += 2;
    }

    SysTask *task = SysTask_CreateOnMainQueue((SysTaskFunc)sub_0205F12C, object, priority);
    GF_ASSERT(task != NULL);

    sub_0205F338(object, task);
}

static void MapObject_InitFromObjectEvent(LocalMapObject *object, ObjectEvent *objectEvent, FieldSystem *fieldSystem) {
    MapObject_SetID(object, ObjectEvent_GetID(objectEvent));
    MapObject_SetSpriteID(object, FieldSystem_ResolveObjectSpriteID(fieldSystem, ObjectEvent_GetSpriteID(objectEvent)));
    MapObject_SetMovement(object, ObjectEvent_GetMovement(objectEvent));
    MapObject_SetType(object, ObjectEvent_GetType(objectEvent));
    MapObject_SetFlagID(object, ObjectEvent_GetFlagID(objectEvent));
    MapObject_SetScript(object, ObjectEvent_GetScript(objectEvent));
    MapObject_SetInitialFacingDirection(object, ObjectEvent_GetInitialFacingDirection(objectEvent));
    MapObject_SetParam(object, ObjectEvent_GetParam(objectEvent, 0), 0);
    MapObject_SetParam(object, ObjectEvent_GetParam(objectEvent, 1), 1);
    MapObject_SetParam(object, ObjectEvent_GetParam(objectEvent, 2), 2);
    MapObject_SetXRange(object, ObjectEvent_GetXRange(objectEvent));
    MapObject_SetYRange(object, ObjectEvent_GetYRange(objectEvent));

    MapObject_SetPositionVecFromObjectEvent(object, objectEvent);
}

static void MapObject_SetPositionVecFromObjectEvent(LocalMapObject *object, ObjectEvent *objectEvent) {
    VecFx32 coords;

    u16 x = ObjectEvent_GetXCoord(objectEvent);
    coords.x = x * FX32_CONST(16) + FX32_CONST(8);
    MapObject_SetInitialX(object, x);
    MapObject_SetPreviousX(object, x);
    MapObject_SetCurrentX(object, x);

    coords.y = ObjectEvent_GetHeight(objectEvent);
    u32 height = (coords.y >> 3) / FX32_ONE;
    MapObject_SetInitialHeight(object, height);
    MapObject_SetPreviousHeight(object, height);
    MapObject_SetCurrentHeight(object, height);

    u16 y = ObjectEvent_GetYCoord(objectEvent);
    coords.z = y * FX32_CONST(16) + FX32_CONST(8);
    MapObject_SetInitialY(object, y);
    MapObject_SetPreviousY(object, y);
    MapObject_SetCurrentY(object, y);

    MapObject_SetPositionVec(object, &coords);
}

static void sub_0205EC90(LocalMapObject *object, MapObjectManager *manager) { //setup facing and flags? also sets manager?
    MapObject_SetFlagsBits(object, (MapObjectFlagBits)(MAPOBJECTFLAG_UNK12 | MAPOBJECTFLAG_UNK11 | MAPOBJECTFLAG_ACTIVE));
    if (MapObject_ScriptIdIsFFFF(object) == TRUE) {
        MapObject_SetFlag25(object, TRUE);
    }
    MapObject_SetManager(object, manager);
    MapObject_SetFacingDirectionDirect(object, MapObject_GetInitialFacingDirection(object));
    MapObject_SetNextFacingDirection(object, MapObject_GetInitialFacingDirection(object));
    MapObject_ClearHeldMovement(object);
}

static void sub_0205ECE0(LocalMapObject *object) {
    UnkLMOCallbackStruct *unk = sub_0205FB00(MapObject_GetMovement(object));
    sub_0205F414(object, sub_0205FB18(unk));
    sub_0205F428(object, sub_0205FB1C(unk));
    sub_0205F43C(object, sub_0205FB20(unk));
}

extern const UnkLMOCallbackStruct2 ov01_0220724C;

static void sub_0205ED18(LocalMapObject *object) {
    u32 spriteId = MapObject_GetSpriteID(object);
    UnkLMOCallbackStruct2 *unk = (spriteId == SPRITE_CAMERA_FOCUS) ? (UnkLMOCallbackStruct2 *)&ov01_0220724C : sub_0205FB38(spriteId);

    sub_0205F468(object, sub_0205FB24(unk));
    sub_0205F47C(object, sub_0205FB28(unk));
    sub_0205F490(object, sub_0205FB2C(unk));
    sub_0205F4A4(object, sub_0205FB30(unk));
    sub_0205F4B8(object, sub_0205FB34(unk));
}

static void MapObject_Clear(LocalMapObject *object) {
    memset(object, 0, sizeof(LocalMapObject));
}

static u32 sub_0205ED90(LocalMapObject *object, u32 flagId, u32 objectEventCount, ObjectEvent *objectEvents) {
    for (; objectEventCount != 0; objectEventCount--, objectEvents++) {
        if (ObjectEvent_GetID(objectEvents) != MapObject_GetID(object)) {
            continue;
        }

        if (ObjectEvent_ScriptIDIsUnset(objectEvents) == TRUE) {
            u16 flagIdUnset = ObjectEvent_GetFlagID_AssertScriptIDIsUnset(objectEvents);
            if (MapObject_CheckFlag25(object) == TRUE) { //this and the one below cannot be combined as it doesn't match
                if (sub_0205F544(object) == flagIdUnset) {
                    return 1;
                }
            } else if (sub_0205F254(object) == flagIdUnset) {
                return 2;
            }
        } else if (MapObject_CheckFlag25(object) == TRUE && sub_0205F544(object) == flagId) {
            return 2;
        }
    }

    return 0;
}

//TODO: this also gets based on the second param, which is currently labelled as flagId, but is not
//see the note attached to sub_0205F254
static LocalMapObject *MapObjectManager_GetFirstObjectWithID(MapObjectManager *manager, u32 objectId, u32 flagId) {
    s32 index = 0;
    LocalMapObject *object;

    while (MapObjectManager_GetNextObjectWithFlagFromIndex(manager, &object, &index, MAPOBJECTFLAG_ACTIVE) == TRUE) {
        if (MapObject_GetID(object) == objectId && sub_0205F254(object) == flagId) {
            return object;
        }
    }

    return NULL;
}

LocalMapObject *MapObjectManager_GetFirstActiveObjectByID(MapObjectManager *manager, u32 id) {
    GF_ASSERT(manager != NULL);

    s32 count = MapObjectManager_GetObjectCount(manager);
    LocalMapObject *objects = (LocalMapObject *)MapObjectManager_GetConstObjects(manager);
    do {
        if (MapObject_TestFlagsBits(objects, MAPOBJECTFLAG_ACTIVE) == TRUE &&
            MapObject_CheckFlag25(objects) == FALSE && MapObject_GetID(objects) == id)
        {
            return objects;
        }

        count--;
        objects++;
    } while (count > 0);

    return NULL;
}

LocalMapObject *MapObjectManager_GetFirstActiveObjectWithMovement(MapObjectManager *manager, u32 movement) {
    s32 count = MapObjectManager_GetObjectCount(manager);
    LocalMapObject *objects = (LocalMapObject *)MapObjectManager_GetConstObjects(manager);

    do {
        if (MapObject_TestFlagsBits(objects, MAPOBJECTFLAG_ACTIVE) == TRUE && MapObject_GetMovement(objects) == movement) {
            return objects;
        }

        count--;
        objects++;
    } while (count > 0);

    return NULL;
}

BOOL MapObjectManager_GetNextObjectWithFlagFromIndex(MapObjectManager *manager, LocalMapObject **objectDest, s32 *index, MapObjectFlagBits flag) {
    s32 count = MapObjectManager_GetObjectCount(manager);
    if (*index >= count) {
        return FALSE;
    }

    LocalMapObject *objects = (LocalMapObject *)MapObjectManager_GetConstObjects(manager);
    LocalMapObject *object = objects + *index;
    do {
        (*index)++;

        if (flag == (MapObjectFlagBits)MapObject_GetFlagsBits(object, flag)) {
            *objectDest = object;
            return TRUE;
        }

        object++;
    } while (*index < count);

    return FALSE;
}

static void sub_0205EF48(LocalMapObject *object) {
    MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK2);
    sub_0205EF5C(object);
}

static void sub_0205EF5C(LocalMapObject *object) {
    MapObject_ClearFlagsBits(object, (MapObjectFlagBits)(MAPOBJECTFLAG_UNK26 | MAPOBJECTFLAG_UNK24 |
                                                         MAPOBJECTFLAG_UNK20 | MAPOBJECTFLAG_UNK15));
}

static void MapObject_NoOp(LocalMapObject *object) {
    // NoOp
}

static u32 FieldSystem_ResolveObjectSpriteID(FieldSystem *fieldSystem, s32 spriteId) {
    //BUG: index out of range, should be < not <=
    //TODO: check these with sprite constants, these should be variable sprites but this starts at 101 not 100
    if (spriteId >= 101 && spriteId <= 117) {
        spriteId = FieldSystem_VarGetObjectEventGraphicsId(fieldSystem, (u16)(spriteId - 101));
    }
    return spriteId;
}

static void sub_0205EF8C(LocalMapObject *object) {
    if (MapObject_GetFlagsBits(object, MAPOBJECTFLAG_UNK12) != 0) {
        sub_02061070(object);
    }
}

static void sub_0205EFA4(LocalMapObject *object) {
    sub_0205ECE0(object);
    sub_0205FD20(object);
}

extern void ov01_021FA2B8(LocalMapObject*, BOOL set);

void sub_0205EFB4(LocalMapObject* object) {
    if (!sub_0205F5D4(MapObject_GetManager(object))) {
        return;
    }

    sub_0205EF8C(object);
    sub_0205F328(object, 0);
    ov01_021FA2B8(object, FALSE);
    if (!MapObject_CheckFlag14(object)) {
        sub_0205ED18(object);
        sub_0205F470(object);
        MapObject_SetFlag14(object);
    }
}

BOOL MapObject_ScriptIdIsFFFF(LocalMapObject* object) {
    u16 script = MapObject_GetScript(object);
    return script == 0xFFFF;
}

void sub_0205F014(LocalMapObject* object, ObjectEvent* template, u32 map_no) {
    GF_ASSERT(MapObject_CheckFlag25(object) == TRUE);

    MapObject_SetFlag25(object, FALSE);
    sub_0205F250(object, map_no);
    MapObject_SetScript(object, ObjectEvent_GetScript(template));
    MapObject_SetFlagID(object, ObjectEvent_GetFlagID(template));
}

void sub_0205F058(LocalMapObject* object, u32 map_no, ObjectEvent* template) {
    GF_ASSERT(ObjectEvent_ScriptIDIsUnset(template) == TRUE);

    MapObject_SetFlag25(object, TRUE);
    MapObject_SetScript(object, ObjectEvent_GetScript(template));
    MapObject_SetFlagID(object, ObjectEvent_GetFlagID_AssertScriptIDIsUnset(template));
    sub_0205F250(object, map_no);
}

u32 sub_0205F09C(LocalMapObject* object, u32 a1) {
    return (u32)(sub_0205F538(object) + a1);
}

BOOL sub_0205F0A8(LocalMapObject* object, u32 id, u32 a2) {
    if (!MapObject_TestFlagsBits(object, MAPOBJECTFLAG_ACTIVE)) {
        return FALSE;
    }

    if (id != MapObject_GetID(object)) {
        return FALSE;
    }

    if (a2 != sub_0205F254(object)) {
        if (!MapObject_CheckFlag25(object)) {
            return FALSE;
        }

        if (a2 != sub_0205F544(object)) {
            return FALSE;
        }
    }

    return TRUE;
}

BOOL sub_0205F0F8(LocalMapObject* object, u32 spriteId, u32 id, u32 a3) {
    if (!MapObject_TestFlagsBits(object, MAPOBJECTFLAG_ACTIVE)) {
        return FALSE;
    }

    u32 objectSpriteId = MapObject_GetSpriteID(object);
    if (objectSpriteId != spriteId) {
        return FALSE;
    }

    return sub_0205F0A8(object, id, a3);
}

extern void sub_0205FD30(LocalMapObject*);

void sub_0205F12C(SysTask* task, LocalMapObject* object) {
    sub_0205FD30(object);
    if (MapObject_IsInUse(object)) {
        sub_0205F148(object);
    }
}

extern void ov01_021F92A0(LocalMapObject* object);

void sub_0205F148(LocalMapObject* object) {
    if (sub_0205F5D4(MapObject_GetManager(object)) == TRUE) {
        ov01_021F92A0(object);
    }
}

// Likely a scrubbed debug func, but WTF is GF smoking?
MapObjectManager* MapObjectManager_Get(MapObjectManager* manager) {
    return manager;
}

void MapObjectManager_SetObjectCount(MapObjectManager* manager, u32 count) {
    manager->object_count = count;
}

u32 MapObjectManager_GetObjectCount(MapObjectManager* manager) {
    return manager->object_count;
}

void sub_0205F16C(MapObjectManager* manager) {
    manager->unk8++;
}

void sub_0205F174(MapObjectManager* manager) {
    manager->unk8--;
}

void MapObjectManager_SetFlagsBits(MapObjectManager* manager, u32 bits) {
    manager->flags |= bits;
}

void MapObjectManager_ClearFlagsBits(MapObjectManager* manager, u32 bits) {
    manager->flags &= ~bits;
}

u32 MapObjectManager_GetFlagsBitsMask(MapObjectManager* manager, u32 bits) {
    return manager->flags & bits;
}

void MapObjectManager_SetPriority(MapObjectManager* manager, u32 priority) {
    manager->priority = priority;
}

u32 MapObjectManager_GetPriority(MapObjectManager* manager) {
    return manager->priority;
}

void* sub_0205F1A0(MapObjectManager* manager) {
    return manager->unk18;
}

void MapObjectManager_SetObjects(MapObjectManager* manager, LocalMapObject* objects) {
    manager->objects = objects;
}

LocalMapObject* sub_0205F1AC(MapObjectManager* manager) {
    return manager->objects;
}

const LocalMapObject* MapObjectManager_GetConstObjects(MapObjectManager* manager) {
    return manager->objects;
}

LocalMapObject* MapObjectManager_GetObjects(MapObjectManager* manager) {
    return manager->objects;
}

void sub_0205F1C4(LocalMapObject** objects) {
    (*objects)++;
}

void sub_0205F1D0(LocalMapObject** objects) {
    (*objects)++;
}

void MapObjectManager_SetFieldSystemPtr(MapObjectManager* manager, FieldSystem* fieldSystem) {
    manager->fieldSystem = fieldSystem;
}

FieldSystem* MapObjectManager_GetFieldSystemPtr(MapObjectManager* manager) {
    return manager->fieldSystem;
}

void FldObjSys_SetMModelNarc(MapObjectManager* manager, NARC* mmodel_narc) {
    manager->mmodel_narc = mmodel_narc;
}

NARC* FldObjSys_GetMModelNarc(MapObjectManager* manager) {
    GF_ASSERT(manager->mmodel_narc != NULL);
    return manager->mmodel_narc;
}

void MapObject_SetFlagsWord(LocalMapObject* object, u32 bits) {
    object->flags = bits;
}

u32 MapObject_GetFlagsWord(LocalMapObject* object) {
    return object->flags;
}

void MapObject_SetFlagsBits(LocalMapObject* object, MapObjectFlagBits bits) {
    object->flags |= bits;
}

void MapObject_ClearFlagsBits(LocalMapObject* object, MapObjectFlagBits bits) {
    object->flags &= ~bits;
}

u32 MapObject_GetFlagsBits(LocalMapObject* object, MapObjectFlagBits mask) {
    return object->flags & mask;
}

BOOL MapObject_TestFlagsBits(LocalMapObject* object, MapObjectFlagBits bits) {
    return (object->flags & bits) != 0;
}

void MapObject_SetFlags2Word(LocalMapObject* object, u32 bits) {
    object->flags2 = bits;
}

u32 MapObject_GetFlags2Word(LocalMapObject* object) {
    return object->flags2;
}

u32 MapObject_GetFlags2Mask(LocalMapObject* object, u32 mask) {
    return object->flags2 & mask;
}

void MapObject_SetID(LocalMapObject* object, u32 id) {
    object->id = id;
}

u32 MapObject_GetID(LocalMapObject* object) {
    return object->id;
}

/*
 * Something is very wrong here. One of the variables is mislabelled or misnamed.
 * Both of the following two functions access LMO's unkC, Initially I thought to
 * rename unkC to objectEventFlags, as in MapObjectManager_GetFirstObjectWithID 
 * sub_0205F254 is used to compare to OE's flags in MapObject_CreateFromObjectEvent.
 * However, sub_0205F250 is often used (again in MapObject_CreateFromObjectEvent) for
 * assignment of the mapNo to unkC, which of course conflicts with the other
 * established uses for unkC. Someone with more understanding of this, potentially
 * from binary land may do better than me at figuring out what is going on here
 * - red031000
 */
void sub_0205F250(LocalMapObject* object, u32 a1) {
    object->unkC = a1;
}

u32 sub_0205F254(LocalMapObject* object) {
    return object->unkC;
}

void MapObject_SetSpriteID(LocalMapObject* object, u32 spriteId) {
    object->spriteId = spriteId;
}

u32 MapObject_GetSpriteID(LocalMapObject* object) {
    return object->spriteId;
}

void MapObject_SetMovement(LocalMapObject* object, u32 movement) {
    object->movement = movement;
}

u32 MapObject_GetMovement(LocalMapObject* object) {
    return object->movement;
}

void MapObject_SetType(LocalMapObject* object, u32 type) {
    object->type = type;
}

u32 MapObject_GetType(LocalMapObject* object) {
    return object->type;
}

void MapObject_SetFlagID(LocalMapObject* object, u32 flag_id) {
    object->evFlagId = flag_id;
}

u32 MapObject_GetFlagID(LocalMapObject* object) {
    return object->evFlagId;
}

void MapObject_SetScript(LocalMapObject* object, u32 script) {
    object->scriptId = script;
}

u32 MapObject_GetScript(LocalMapObject* object) {
    return object->scriptId;
}

void MapObject_SetInitialFacingDirection(LocalMapObject* object, u32 initial_facing) {
    object->initialFacing = initial_facing;
}

u32 MapObject_GetInitialFacingDirection(LocalMapObject* object) {
    return object->initialFacing;
}

void MapObject_SetFacingDirectionDirect(LocalMapObject* object, u32 direction) {
    object->currentFacingBak = object->currentFacing;
    object->currentFacing = direction;
}

void MapObject_SetFacingDirection(LocalMapObject* object, u32 direction) {
    if (MapObject_GetFlagsBits(object, MAPOBJECTFLAG_UNK7) == 0) {
        object->currentFacingBak = object->currentFacing;
        object->currentFacing = direction;
    }
}

u32 MapObject_GetFacingDirection(LocalMapObject* object) {
    return object->currentFacing;
}

u32 MapObject_GetPreviousFacing(LocalMapObject* object) {
    return object->currentFacingBak;
}

void MapObject_SetNextFacingDirection(LocalMapObject* object, u32 direction) {
    object->nextFacingBak = object->nextFacing;
    object->nextFacing = direction;
}

u32 MapObject_GetNextFacingDirection(LocalMapObject* object) {
    return object->nextFacing;
}

void MapObject_SetOrQueueFacing(LocalMapObject* object, u32 direction) {
    MapObject_SetFacingDirection(object, direction);
    MapObject_SetNextFacingDirection(object, direction);
}

void MapObject_SetParam(LocalMapObject* object, u32 value, int param) {
    switch (param) {
        case 0:
            object->param[0] = value;
            return;
        case 1:
            object->param[1] = value;
            return;
        case 2:
            object->param[2] = value;
            return;
        default:
            GF_ASSERT(FALSE);
            return;
    }
}

int MapObject_GetParam(LocalMapObject* object, int param) {
    switch (param) {
        case 0:
            return object->param[0];
        case 1:
            return object->param[1];
        case 2:
            return object->param[2];
        default:
            GF_ASSERT(FALSE);
            return 0;
    }
}

void MapObject_SetXRange(LocalMapObject* object, u32 x_range) {
    object->xrange = x_range;
}

u32 MapObject_GetXRange(LocalMapObject* object) {
    return object->xrange;
}

void MapObject_SetYRange(LocalMapObject* object, u32 y_range) {
    object->yrange = y_range;
}

u32 MapObject_GetYRange(LocalMapObject* object) {
    return object->yrange;
}

void sub_0205F328(LocalMapObject* object, u32 a1) {
    object->unkA0 = a1;
}

u32 sub_0205F330(LocalMapObject* object) {
    return object->unkA0;
}

void sub_0205F338(LocalMapObject* object, SysTask* a1) {
    object->unkB0 = a1;
}

SysTask* sub_0205F340(LocalMapObject* object) {
    return object->unkB0;
}

void sub_0205F348(LocalMapObject* object) {
    SysTask_Destroy(sub_0205F340(object));
}

void MapObject_SetManager(LocalMapObject* object, MapObjectManager* manager) {
    object->manager = manager;
}

MapObjectManager* MapObject_GetManager(LocalMapObject* object) {
    return object->manager;
}

MapObjectManager* sub_0205F364(LocalMapObject* object) {
    return MapObjectManager_Get(object->manager);
}

u8* sub_0205F370(LocalMapObject* object, s32 size) {
    GF_ASSERT(size <= 16);

    u8* ret = sub_0205F394(object);
    memset(ret, 0, size);
    return ret;
}

u8* sub_0205F394(LocalMapObject* object) {
    return object->unkD8;
}

u8* sub_0205F398(LocalMapObject* object, s32 size) {
    GF_ASSERT(size <= 16);

    u8* ret = sub_0205F3BC(object);
    memset(ret, 0, size);
    return ret;
}

u8* sub_0205F3BC(LocalMapObject* object) {
    return object->unkE8;
}

u8* sub_0205F3C0(LocalMapObject* object, s32 size) {
    GF_ASSERT(size <= 16);

    u8* ret = sub_0205F3E4(object);
    memset(ret, 0, size);
    return ret;
}

u8* sub_0205F3E4(LocalMapObject* object) {
    return object->unkF8;
}

u8* sub_0205F3E8(LocalMapObject* object, s32 size) {
    GF_ASSERT(size <= 32);

    u8* ret = sub_0205F40C(object);
    memset(ret, 0, size);
    return ret;
}

u8* sub_0205F40C(LocalMapObject* object) {
    return object->unk108;
}

void sub_0205F414(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkB8 = callback;
}

void sub_0205F41C(LocalMapObject* object) {
    object->unkB8(object);
}

void sub_0205F428(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkBC = callback;
}

void sub_0205F430(LocalMapObject* object) {
    object->unkBC(object);
}

void sub_0205F43C(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkC0 = callback;
}

void sub_0205F444(LocalMapObject* object) {
    object->unkC0(object);
}

void sub_0205F450(LocalMapObject* object) {
    UnkLMOCallbackStruct* unk = sub_0205FB00(MapObject_GetMovement(object));
    unk->unk10(object);
}

void sub_0205F468(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkC4 = callback;
}

void sub_0205F470(LocalMapObject* object) {
    object->unkC4(object);
}

void sub_0205F47C(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkC8 = callback;
}

void sub_0205F484(LocalMapObject* object) {
    object->unkC8(object);
}

void sub_0205F490(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkCC = callback;
}

void sub_0205F498(LocalMapObject* object) {
    object->unkCC(object);
}

void sub_0205F4A4(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkD0 = callback;
}

void sub_0205F4AC(LocalMapObject* object) {
    object->unkD0(object);
}

void sub_0205F4B8(LocalMapObject* object, LocalMapObject_UnkCallback callback) {
    object->unkD4 = callback;
}

void sub_0205F4C0(LocalMapObject* object) {
    object->unkD4(object);
}

void MapObject_SetMovementCommand(LocalMapObject* object, u32 command) {
    object->movementCmd = command;
}

u32 MapObject_GetMovementCommand(LocalMapObject* object) {
    return object->movementCmd;
}

void MapObject_SetMovementStep(LocalMapObject* object, u32 step) {
    object->movementStep = step;
}

void MapObject_IncMovementStep(LocalMapObject* object) {
    object->movementStep++;
}

u32 MapObject_GetMovementStep(LocalMapObject* object) {
    return object->movementStep;
}

void sub_0205F4FC(LocalMapObject* object, u16 a1) {
    object->unkAC = a1;
}

u16 sub_0205F504(LocalMapObject* object) {
    return object->unkAC;
}

void sub_0205F50C(LocalMapObject* object, u16 a1) {
    object->unkAE = a1;
}

u16 sub_0205F514(LocalMapObject* object) {
    return object->unkAE;
}

void sub_0205F51C(LocalMapObject* object, u16 a1) {
    object->unk128 = a1;
}

u16 sub_0205F524(LocalMapObject* object) {
    return object->unk128;
}

FieldSystem* MapObject_GetFieldSystem(LocalMapObject* object) {
    return MapObjectManager_GetFieldSystemPtr(sub_0205F364(object));
}

void* sub_0205F538(LocalMapObject* object) { //TODO: this is not void
    return (void*)MapObjectManager_GetPriority(MapObject_GetManager(object));
}

u32 sub_0205F544(LocalMapObject* object) {
    GF_ASSERT(MapObject_CheckFlag25(object) == TRUE);
    return MapObject_GetFlagID(object);
}

void sub_0205F55C(MapObjectManager* manager) {
    MapObjectManager_SetFlagsBits(manager, (1 << 2) | (1 << 1));
}

void sub_0205F568(MapObjectManager* manager) {
    MapObjectManager_ClearFlagsBits(manager, (1 << 2) | (1 << 1));
}

void MapObjectManager_PauseAllMovement(MapObjectManager* manager) {
    u32 count = MapObjectManager_GetObjectCount(manager);
    LocalMapObject* objects = MapObjectManager_GetObjects(manager);
    LocalMapObject* object = objects;
    do {
        if (MapObject_IsInUse(object)) {
            MapObject_PauseMovement(object);
        }

        object++;
        count--;
    } while (count > 0);
}

void MapObjectManager_UnpauseAllMovement(MapObjectManager* manager) {
    u32 count = MapObjectManager_GetObjectCount(manager);
    LocalMapObject* objects = MapObjectManager_GetObjects(manager);
    LocalMapObject* object = objects;
    do {
        if (MapObject_IsInUse(objects)) {
            MapObject_UnpauseMovement(objects);
        }

        objects++;
        count--;
    } while (count > 0);
}

BOOL sub_0205F5D4(MapObjectManager* manager) {
    return MapObjectManager_GetFlagsBitsMask(manager, (1 << 0)) != 0;
}

u32 sub_0205F5E8(LocalMapObject* object, u32 bits) {
    return MapObjectManager_GetFlagsBitsMask(MapObject_GetManager(object), bits);
}

void sub_0205F5F8(MapObjectManager* manager, BOOL clear) {
    if (clear == FALSE) {
        MapObjectManager_SetFlagsBits(manager, (1 << 3));
    } else {
        MapObjectManager_ClearFlagsBits(manager, (1 << 3));
    }
}

BOOL sub_0205F610(MapObjectManager* manager) {
    return MapObjectManager_GetFlagsBitsMask(manager, (1 << 3)) == 0;
}

BOOL MapObject_IsInUse(LocalMapObject* object) {
    return MapObject_TestFlagsBits(object, MAPOBJECTFLAG_ACTIVE);
}

void MapObject_SingleMovementSetActive(LocalMapObject* object) {
    MapObject_SetFlagsBits(object, MAPOBJECTFLAG_SINGLE_MOVEMENT);
}

void MapObject_SingleMovementSetInactive(LocalMapObject* object) {
    MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_SINGLE_MOVEMENT);
}

BOOL MapObject_IsSingleMovementActive(LocalMapObject* object) {
    return MapObject_TestFlagsBits(object, MAPOBJECTFLAG_SINGLE_MOVEMENT);
}

void MapObject_SetFlag2(LocalMapObject* object) {
    MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK2);
}

void MapObject_ClearFlag3(LocalMapObject* object) {
    MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK3);
}

void MapObject_SetFlag14(LocalMapObject* object) {
    MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK14);
}

BOOL MapObject_CheckFlag14(LocalMapObject* object) {
    return MapObject_TestFlagsBits(object, MAPOBJECTFLAG_UNK14);
}

BOOL MapObject_CheckVisible(LocalMapObject* object) {
    return MapObject_TestFlagsBits(object, MAPOBJECTFLAG_VISIBLE);
}

void MapObject_SetVisible(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_VISIBLE);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_VISIBLE);
    }
}

void MapObject_ClearFlag18(LocalMapObject* object, BOOL clear) {
    if (clear == TRUE) {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK18);
    } else {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK18);
    }
}

BOOL MapObject_CheckFlag19Is0(LocalMapObject* object) {
    return MapObject_TestFlagsBits(object, MAPOBJECTFLAG_UNK19) != TRUE;
}

void MapObject_SetFlag19(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK19);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK19);
    }
}

void MapObject_PauseMovement(LocalMapObject* object) {
    MapObject_SetFlagsBits(object, MAPOBJECTFLAG_MOVEMENT_PAUSED);
}

void MapObject_UnpauseMovement(LocalMapObject* object) {
    MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_MOVEMENT_PAUSED);
}

BOOL sub_0205F714(LocalMapObject* object) {
    if (MapObject_TestFlagsBits(object, MAPOBJECTFLAG_UNK30) == TRUE) {
        return TRUE;
    }

    if (MapObject_TestFlagsBits(object, MAPOBJECTFLAG_MOVEMENT_PAUSED) == TRUE) {
        return TRUE;
    }

    return FALSE;
}

BOOL sub_0205F73C(LocalMapObject* object) {
    if (!sub_0205F5D4(MapObject_GetManager(object))) {
        return FALSE;
    }

    if (MapObject_GetFlagsBits(object, MAPOBJECTFLAG_UNK14) != 0) {
        return TRUE;
    }

    return FALSE;
}

void MapObject_SetIgnoreHeights(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_IGNORE_HEIGHTS);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_IGNORE_HEIGHTS);
    }
}

BOOL MapObject_CheckIgnoreHeights(LocalMapObject* object) {
    return MapObject_GetFlagsBits(object, MAPOBJECTFLAG_IGNORE_HEIGHTS) != 0;
}

void MapObject_SetFlag10(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK10);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK10);
    }
}

void MapObject_SetFlag25(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK25);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK25);
    }
}

BOOL MapObject_CheckFlag25(LocalMapObject* object) {
    return MapObject_GetFlagsBits(object, MAPOBJECTFLAG_UNK25) != 0;
}

void MapObject_SetFlag26(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK26);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK26);
    }
}

BOOL MapObject_CheckFlag26(LocalMapObject* object) {
    return MapObject_GetFlagsBits(object, MAPOBJECTFLAG_UNK26) != 0;
}

void MapObject_SetFlag28(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK28);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK28);
    }
}

BOOL MapObject_CheckFlag28(LocalMapObject* object) {
    return MapObject_GetFlagsBits(object, MAPOBJECTFLAG_UNK28) != 0;
}

void MapObject_SetFlag24(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK24);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK24);
    }
}

BOOL MapObject_CheckFlag24(LocalMapObject* object) {
    return MapObject_GetFlagsBits(object, MAPOBJECTFLAG_UNK24) != 0;
}

BOOL MapObject_CheckFlag4(LocalMapObject* object) {
    return MapObject_GetFlagsBits(object, MAPOBJECTFLAG_UNK4) != 0;
}

void MapObject_SetFlag29(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK29);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK29);
    }
}

BOOL MapObject_CheckFlag29(LocalMapObject* object) {
    return MapObject_GetFlagsBits(object, MAPOBJECTFLAG_UNK29) != 0;
}

BOOL sub_0205F8D0(LocalMapObject* object) {
    return MapObject_GetFlags2Mask(object, (1 << 2)) != FALSE;
}

u32 MapObject_GetInitialX(LocalMapObject* object) {
    return object->initialX;
}

void MapObject_SetInitialX(LocalMapObject* object, u32 initial_x) {
    object->initialX = initial_x;
}

u32 MapObject_GetInitialHeight(LocalMapObject* object) {
    return object->initialHeight;
}

void MapObject_SetInitialHeight(LocalMapObject* object, u32 initial_height) {
    object->initialHeight = initial_height;
}

u32 MapObject_GetInitialY(LocalMapObject* object) {
    return object->initialY;
}

void MapObject_SetInitialY(LocalMapObject* object, u32 initial_y) {
    object->initialY = initial_y;
}

u32 MapObject_GetPrevX(LocalMapObject* object) {
    return object->previousX;
}

void MapObject_SetPreviousX(LocalMapObject* object, u32 previous_x) {
    object->previousX = previous_x;
}

u32 MapObject_GetPrevHeight(LocalMapObject* object) {
    return object->previousHeight;
}

void MapObject_SetPreviousHeight(LocalMapObject* object, u32 previous_height) {
    object->previousHeight = previous_height;
}

u32 MapObject_GetPrevY(LocalMapObject* object) {
    return object->previousY;
}

void MapObject_SetPreviousY(LocalMapObject* object, u32 previous_y) {
    object->previousY = previous_y;
}

u32 MapObject_GetCurrentX(LocalMapObject* object) {
    return object->currentX;
}

void MapObject_SetCurrentX(LocalMapObject* object, u32 x) {
    object->currentX = x;
}

void MapObject_AddCurrentX(LocalMapObject* object, u32 x) {
    object->currentX += x;
}

int MapObject_GetCurrentHeight(LocalMapObject* object) {
    return object->currentHeight;
}

void MapObject_SetCurrentHeight(LocalMapObject* object, u32 height) {
    object->currentHeight = height;
}

void MapObject_AddCurrentHeight(LocalMapObject* object, u32 height) {
    object->currentHeight += height;
}

u32 MapObject_GetCurrentY(LocalMapObject* object) {
    return object->currentY;
}

void MapObject_SetCurrentY(LocalMapObject* object, u32 y) {
    object->currentY = y;
}

void MapObject_AddCurrentY(LocalMapObject* object, u32 y) {
    object->currentY += y;
}

void MapObject_GetPositionVec(LocalMapObject* object, VecFx32* pos_vec_dest) {
    *pos_vec_dest = object->positionVec;
}

void MapObject_SetPositionVec(LocalMapObject* object, VecFx32* pos_vec) {
    object->positionVec = *pos_vec;
}

VecFx32* MapObject_GetPositionVecPtr(LocalMapObject* object) {
    return &object->positionVec;
}

fx32 MapObject_GetPosVecYCoord(LocalMapObject* object) {
    return object->positionVec.y;
}

void MapObject_GetFacingVec(LocalMapObject* object, VecFx32* face_vec_dest) {
    *face_vec_dest = object->facingVec;
}

void MapObject_SetFacingVec(LocalMapObject* object, VecFx32* face_vec) {
    object->facingVec = *face_vec;
}

VecFx32* MapObject_GetFacingVecPtr(LocalMapObject* object) {
    return &object->facingVec;
}

void sub_0205F990(LocalMapObject* object, VecFx32* a1_dest) {
    *a1_dest = object->unk88;
}

void sub_0205F9A0(LocalMapObject* object, const VecFx32* a1) {
    object->unk88 = *a1;
}

void sub_0205F9B0(LocalMapObject* object, VecFx32* a1_dest) {
    *a1_dest = object->unk94;
}

void sub_0205F9C0(LocalMapObject* object, VecFx32* a1) {
    object->unk94 = *a1;
}

u32 sub_0205F9D0(LocalMapObject* object) {
    fx32 y = MapObject_GetPosVecYCoord(object);
    return (y >> 3) / FX32_ONE;
}

void ObjectEvent_SetId(ObjectEvent* template, u16 id) {
    template->id = id;
}

u16 ObjectEvent_GetID(ObjectEvent* template) {
    return template->id;
}

void ObjectEvent_SetSprite(ObjectEvent* template, u32 sprite) {
    template->spriteId = sprite;
}

u16 ObjectEvent_GetSpriteID(ObjectEvent* template) {
    return template->spriteId;
}

void ObjectEvent_SetMovement(ObjectEvent* template, u32 movement) {
    template->movement = movement;
}

u16 ObjectEvent_GetMovement(ObjectEvent* template) {
    return template->movement;
}

void ObjectEvent_SetType(ObjectEvent* template, u16 type) {
    template->type = type;
}

u16 ObjectEvent_GetType(ObjectEvent* template) {
    return template->type;
}

void ObjectEvent_SetFlagId(ObjectEvent* template, u16 flag) {
    template->flag = flag;
}

u16 ObjectEvent_GetFlagID(ObjectEvent* template) {
    return template->flag;
}

void ObjectEvent_SetScript(ObjectEvent* template, u16 script) {
    template->scr = script;
}

u16 ObjectEvent_GetScript(ObjectEvent* template) {
    return template->scr;
}

void ObjectEvent_SetFacing(ObjectEvent* template, u32 direction) {
    template->dirn = direction;
}

s16 ObjectEvent_GetInitialFacingDirection(ObjectEvent* template) {
    return template->dirn;
}

void ObjectEvent_SetParam(ObjectEvent* template, u32 value, int param) {
    switch (param) {
        case 0:
            template->eye = value;
            return;
        case 1:
            template->unk10 = value;
            return;
        case 2:
            template->tsure_poke_color = value;
            return;
        default:
            GF_ASSERT(FALSE);
            return;
    }
}

u16 ObjectEvent_GetParam(ObjectEvent* template, int param) {
    switch (param) {
        case 0:
            return template->eye;
        case 1:
            return template->unk10;
        case 2:
            return template->tsure_poke_color;
        default:
            GF_ASSERT(FALSE);
            return 0;
    }
}

void ObjectEvent_SetXRange(ObjectEvent* template, s16 x_range) {
    template->xrange = x_range;
}

s16 ObjectEvent_GetXRange(ObjectEvent* template) {
    return template->xrange;
}

void ObjectEvent_SetYRange(ObjectEvent* template, s16 y_range) {
    template->yrange = y_range;
}

s16 ObjectEvent_GetYRange(ObjectEvent* template) {
    return template->yrange;
}

void ObjectEvent_SetXCoord(ObjectEvent* template, u32 x) {
    template->x = x;
}

u16 ObjectEvent_GetXCoord(ObjectEvent* template) {
    return template->x;
}

void ObjectEvent_SetHeight(ObjectEvent* template, u32 height) {
    template->z = height;
}

u32 ObjectEvent_GetHeight(ObjectEvent* template) {
    return template->z;
}

void ObjectEvent_SetYCoord(ObjectEvent* template, u32 y) {
    template->y = y;
}

u16 ObjectEvent_GetYCoord(ObjectEvent* template) {
    return template->y;
}

ObjectEvent* ObjectEvent_GetById(u16 id, int num_templates, ObjectEvent* templates) {
    int i = 0;
    ObjectEvent* template = templates;
    do {
        if (!ObjectEvent_ScriptIDIsUnset(template) && id == ObjectEvent_GetID(template)) {
            return templates + i;
        }

        i++;
        template++;
    } while (i < num_templates);

    return NULL;
}

BOOL ObjectEvent_ScriptIDIsUnset(ObjectEvent* template) {
    u16 script = (u16)(u32)ObjectEvent_GetScript(template);
    return script == 0xFFFF;
}

u16 ObjectEvent_GetFlagID_AssertScriptIDIsUnset(ObjectEvent* template) {
    GF_ASSERT(ObjectEvent_ScriptIDIsUnset(template) == TRUE);
    return ObjectEvent_GetFlagID(template);
}

extern UnkLMOCallbackStruct* _020FD1F4[57];

UnkLMOCallbackStruct* sub_0205FB00(u32 movement) {
    GF_ASSERT(movement < NELEMS(_020FD1F4));
    return _020FD1F4[movement];
}

LocalMapObject_UnkCallback sub_0205FB18(UnkLMOCallbackStruct* unk) {
    return unk->unk4;
}

LocalMapObject_UnkCallback sub_0205FB1C(UnkLMOCallbackStruct* unk) {
    return unk->unk8;
}

LocalMapObject_UnkCallback sub_0205FB20(UnkLMOCallbackStruct* unk) {
    return unk->unkC;
}

LocalMapObject_UnkCallback sub_0205FB24(UnkLMOCallbackStruct2* unk) {
    return unk->unk0;
}

LocalMapObject_UnkCallback sub_0205FB28(UnkLMOCallbackStruct2* unk) {
    return unk->unk4;
}

LocalMapObject_UnkCallback sub_0205FB2C(UnkLMOCallbackStruct2* unk) {
    return unk->unk8;
}

LocalMapObject_UnkCallback sub_0205FB30(UnkLMOCallbackStruct2* unk) {
    return unk->unkC;
}

LocalMapObject_UnkCallback sub_0205FB34(UnkLMOCallbackStruct2* unk) {
    return unk->unk10;
}

typedef struct ObjectEventGraphicsInfo {
    u16 sprite_no;
    u16 mmodel_no;
    u16 unk4_0:5; // Unknown actual size
    u16 unk4_5:5;
    u16 unk4_10:6; // Unknown actual size
} ObjectEventGraphicsInfo;

extern ObjectEventGraphicsInfo* GetObjectEventGfxInfoPtr(u32 spriteId);
extern UnkLMOCallbackStruct2* ov01_02209A38[20];

UnkLMOCallbackStruct2* sub_0205FB38(u32 spriteId) {
    ObjectEventGraphicsInfo* unk = GetObjectEventGfxInfoPtr(spriteId);
    if (unk == NULL) {
        return NULL;
    }

    return ov01_02209A38[unk->unk4_5];
}

LocalMapObject* sub_0205FB58(MapObjectManager* manager, u32 x, u32 y, BOOL a3) {
    u32 count = MapObjectManager_GetObjectCount(manager);
    LocalMapObject* objects = MapObjectManager_GetObjects(manager);

    LocalMapObject* object = objects;
    do {
        if (MapObject_GetFlagsBits(object, MAPOBJECTFLAG_ACTIVE) != 0) {
            if (a3 && x == MapObject_GetPrevX(object) && y == MapObject_GetPrevY(object)) {
                return object;
            }

            if (x == MapObject_GetCurrentX(object) && y == MapObject_GetCurrentY(object)) {
                return object;
            }
        }

        object++;
        count--;
    } while (count > 0);

    return NULL;
}

extern void sub_02060F78(LocalMapObject* object);

void sub_0205FBC0(LocalMapObject* object, VecFx32* position_vec, u32 direction) {
    MapObject_SetCurrentX(object, (position_vec->x >> 4) / FX32_ONE);
    MapObject_SetCurrentHeight(object, (position_vec->y >> 3) / FX32_ONE);
    MapObject_SetCurrentY(object, (position_vec->z >> 4) / FX32_ONE);
    MapObject_SetPositionVec(object, position_vec);
    sub_02060F78(object);
    MapObject_SetFacingDirectionDirect(object, direction);
    MapObject_ClearHeldMovement(object);
    MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK2);
    MapObject_ClearFlagsBits(object, (MapObjectFlagBits)(MAPOBJECTFLAG_UNK3 | MAPOBJECTFLAG_SINGLE_MOVEMENT));
}

void sub_0205FC2C(LocalMapObject* object, u32 x, u32 height, u32 y, u32 direction) {
    VecFx32 position_vec;
    position_vec.x = x * (16 * FX32_ONE) + (8 * FX32_ONE);
    MapObject_SetCurrentX(object, x);
    position_vec.y = height * (8 * FX32_ONE);
    MapObject_SetCurrentHeight(object, height);
    position_vec.z = y * (16 * FX32_ONE) + (8 * FX32_ONE);
    MapObject_SetCurrentY(object, y);

    MapObject_SetPositionVec(object, &position_vec);
    sub_02060F78(object);
    MapObject_SetFacingDirectionDirect(object, direction);
    MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK2);
    MapObject_ClearFlagsBits(object, (MapObjectFlagBits)(MAPOBJECTFLAG_UNK3 | MAPOBJECTFLAG_SINGLE_MOVEMENT));
    MapObject_ClearHeldMovement(object);
}

void sub_0205FC94(LocalMapObject* object, u32 movement) {
    sub_0205F444(object);
    MapObject_SetMovement(object, movement);
    sub_0205ECE0(object);
    sub_0205FD20(object);
}

/*static*/ void sub_0205FCB4(LocalMapObject* object) {

}

void sub_0205FCB8(LocalMapObject* object) {

}

void sub_0205FCBC(LocalMapObject* object) {

}

void sub_0205FCC0(LocalMapObject* object) {

}

void sub_0205FCC4(LocalMapObject* object) {

}

void sub_0205FCC8(LocalMapObject* object) {

}

void sub_0205FCCC(LocalMapObject* object) {

}

void sub_0205FCD0(LocalMapObject* object) {

}

void sub_0205FCD4(LocalMapObject* object) {
    u32 spriteId = MapObject_GetSpriteID(object);
    UnkLMOCallbackStruct2* unk = (spriteId == 0x2000) ? (UnkLMOCallbackStruct2*)&ov01_0220724C : sub_0205FB38(spriteId);
    sub_0205F47C(object, sub_0205FB28(unk));
}

SavedMapObject* SaveMapObjects_SearchSpriteId(SavedMapObject* list, u32 num_objects, u16 sprite_id) {
    SavedMapObject* object = list;
    for (; num_objects > 0; object++, num_objects--) {
        if ((object->flags & MAPOBJECTFLAG_ACTIVE) != 0 && object->spriteId == sprite_id) {
            return object;
        }
    }

    return NULL;
}
