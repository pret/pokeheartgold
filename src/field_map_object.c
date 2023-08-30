#include "global.h"
#include "field_player_avatar.h"
#include "field_map_object.h"
#include "filesystem.h"
#include "heap.h"
#include "unk_0200E320.h"
#include "unk_0205FD20.h"

static void sub_0205E934(LocalMapObject* object);
static void sub_0205E954(LocalMapObject* object);
static void sub_0205ED18(LocalMapObject* object);
static void sub_0205EF8C(LocalMapObject* object);

MapObjectManager* sub_0205E0BC(FieldSystem* fieldSystem, int object_count, HeapID heapId) {
    MapObjectManager* ret = MapObjectManager_New(object_count);
    MapObjectManager_SetFieldSysPtr(ret, fieldSystem);
    MapObjectManager_SetCount(ret, object_count);
    MapObjectManager_SetHeapID(ret, heapId);

    return ret;
}

void MapObjectManager_Delete(MapObjectManager* manager) {
    FreeToHeapExplicit(HEAP_ID_FIELD, MapObjectManager_GetObjects(manager));
    FreeToHeapExplicit(HEAP_ID_FIELD, manager);
}

extern void ov01_021F9FB0(MapObjectManager* manager, void*);

void sub_0205E104(MapObjectManager* manager, u32 a1, u32 a2, u32 num_object_events, ObjectEvent* object_events) {
    u32 count = MapObjectManager_GetCount(manager);
    LocalMapObject* objects = MapObjectManager_GetObjects(manager);

    // FIXME(tgsm): Obviously this is a for-loop, and it will match on Compiler Explorer that way,
    //              but it *will not* match here for some reason.
    //              https://ce.athq.de/z/nzvnEP
    if (count != 0) {
        do {
            if (MapObject_IsInUse(objects) != TRUE) {
                goto next;
            }

            switch (sub_0205ED90(objects, a2, num_object_events, object_events)) {
                case 0:
                    if (a2 == sub_0205F254(objects)) {
                        goto next;
                    }

                    if (MapObject_TestFlagsBits(objects, MAPOBJECTFLAG_UNK10) != FALSE) {
                        goto next;
                    }

                    MapObject_Remove(objects);
                case 1:
                case 2:
                    goto next;
            }

        next:
            objects++;
            count--;
        } while (count != 0);
    }

    ov01_021F9FB0(manager, sub_0205F1A0(manager));
}

MapObjectManager* MapObjectManager_New(u32 object_count) {
    LocalMapObject* objects;
    MapObjectManager* manager;

    manager = AllocFromHeap((HeapID)11, sizeof(MapObjectManager));
    GF_ASSERT(manager != NULL);
    memset(manager, 0, sizeof(MapObjectManager));

    objects = AllocFromHeap((HeapID)11, object_count * sizeof(LocalMapObject));
    GF_ASSERT(objects != NULL);
    memset(objects, 0, object_count * sizeof(LocalMapObject));

    MapObjectManager_SetObjects(manager, objects);

    return manager;
}

LocalMapObject* sub_0205E1D0(MapObjectManager* manager, ObjectEvent* object_events, u32 map_no) {
    LocalMapObject* ret;
    ObjectEvent template = *object_events;
    ObjectEvent* ptemplate = &template;

    u32 object_id = ObjectEventTemplate_GetID(ptemplate);
    if (!ObjectEventTemplate_ScriptIdIsFFFF(ptemplate)) {
        ret = sub_0205EA98(manager, object_id, map_no);
        if (ret != NULL) {
            sub_0205F014(ret, ptemplate, map_no);
            return ret;
        }
    } else {
        ret = sub_0205EE10(manager, object_id, ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF(ptemplate));
        if (ret != NULL) {
            sub_0205F058(ret, map_no, ptemplate);
            return ret;
        }
    }
    
    ret = MapObjectManager_GetFirstInactiveObject(manager);
    if (ret == NULL) {
        return ret;
    }

    MapObject_InitFromObjectEventTemplate(ret, ptemplate, MapObjectManager_GetFieldSysPtr(manager));
    sub_0205EC90(ret, manager);
    sub_0205F250(ret, map_no);
    sub_0205EFA4(ret);
    sub_0205EFB4(ret);
    MapObject_SetFlagsBits(ret, MAPOBJECTFLAG_UNK2);
    sub_0205EAF0(manager, ret);
    sub_0205F16C(sub_0205F160(manager));
    return ret;
}

LocalMapObject* CreateSpecialFieldObject(MapObjectManager* manager, u32 x, u32 y, u32 direction, u32 sprite, u32 movement, u32 map_no) {
    return CreateSpecialFieldObjectEx(manager, x, y, direction, sprite, movement, map_no, 0, 0, 0);
}

LocalMapObject* CreateSpecialFieldObjectEx(MapObjectManager* manager, u32 x, u32 y, u32 direction, u32 sprite, u32 movement, u32 map_no, u32 a7, u32 a8, u32 a9) {
    ObjectEvent template;
    ObjectEventTemplate_SetID(&template, 0);
    ObjectEventTemplate_SetSprite(&template, sprite);
    ObjectEventTemplate_SetMovement(&template, movement);
    ObjectEventTemplate_SetType(&template, 0);
    ObjectEventTemplate_SetFlagID(&template, 0);
    ObjectEventTemplate_SetScript(&template, 0);
    ObjectEventTemplate_SetFacing(&template, direction);
    ObjectEventTemplate_SetParam(&template, a7, 0);
    ObjectEventTemplate_SetParam(&template, a8, 1);
    ObjectEventTemplate_SetParam(&template, a9, 2);
    ObjectEventTemplate_SetXRange(&template, 0);
    ObjectEventTemplate_SetYRange(&template, 0);
    ObjectEventTemplate_SetXCoord(&template, x);
    ObjectEventTemplate_SetYCoord(&template, y);
    ObjectEventTemplate_SetHeight(&template, 0);

    return sub_0205E1D0(manager, &template, map_no);
}

LocalMapObject* CreateMapObjectFromTemplate(MapObjectManager* manager, u16 id, u32 num_object_events, u32 map_no, const ObjectEvent* templates) {
    LocalMapObject* ret = NULL;
    ObjectEvent* event = sub_0205FA98(id, num_object_events, (ObjectEvent*)templates);
    if (event != NULL) {
        u32 flag_id = ObjectEventTemplate_GetFlagID(event);
        FieldSystem* fieldSystem = MapObjectManager_GetFieldSysPtr(manager);
        if (FlagGet(fieldSystem, (u16)flag_id) == FALSE) {
            ret = sub_0205E1D0(manager, event, map_no);
        }
    }

    return ret;
}

void sub_0205E38C(LocalMapObject* object, u32 sprite_id) {
    MapObject_SetGfxID(object, sprite_id);
    sub_0205EF48(object);
    MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK14);
    sub_0205EFB4(object);
}

void sub_0205E3AC(LocalMapObject* object, u32 sprite_id) {
    if (sub_0205F73C(object) == TRUE) {
        sub_0205E420(object);
    }
    sub_0205E38C(object, sprite_id);
}

void MapObject_Remove(LocalMapObject* object) {
    if (sub_0205F5D4(MapObject_GetManager(object)) == TRUE) {
        sub_0205F498(object);
    }
    sub_0205F444(object);
    sub_0205F348(object);
    sub_0205F174(sub_0205F364(object));
    sub_0205ED80(object);
}

void DeleteMapObject(LocalMapObject* object) {
    u32 flag_id = MapObject_GetFlagID(object);
    FieldSystem* fieldSystem = MapObject_GetFieldSysPtr(object);
    FlagSet(fieldSystem, (u16)flag_id);
    MapObject_Remove(object);
}

void sub_0205E420(LocalMapObject* object) {
    if (sub_0205F5D4(MapObject_GetManager(object)) == TRUE) {
        if (MapObject_GetFlagsMask(object, MAPOBJECTFLAG_UNK14) != 0) {
            sub_0205F498(object);
        }
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK14);
    }
    MapObject_SetGfxID(object, 0xFFFF);
    sub_0205F468(object, sub_0205FCC4);
    sub_0205F47C(object, sub_0205FCC8);
    sub_0205F490(object, sub_0205FCC8);
    sub_0205F4A4(object, sub_0205FCCC);
    sub_0205F4B8(object, sub_0205FCD0);
}

void MapObjectManager_RemoveAllActiveObjects(MapObjectManager* manager) {
    int i = 0;
    int count = MapObjectManager_GetCount(manager);
    LocalMapObject* objects = MapObjectManager_GetObjects(manager);
    LocalMapObject* object = objects;
    do {
        if (MapObject_GetFlagsMask(object, MAPOBJECTFLAG_ACTIVE) != 0) {
            MapObject_Remove(object);
        }

        i++;
        object++;
    } while (i < count);
}

void sub_0205E4C8(MapObjectManager* manager) {
    GF_ASSERT(sub_0205F5D4(manager) == TRUE);

    int i = 0;
    int count = MapObjectManager_GetCount(manager);
    LocalMapObject* objects = MapObjectManager_GetObjects(manager);

    do {
        if (MapObject_GetFlagsMask(objects, MAPOBJECTFLAG_ACTIVE) != 0 && MapObject_GetFlagsMask(objects, MAPOBJECTFLAG_UNK14) != 0) {
            sub_0205F4AC(objects);
            sub_0205EF6C(objects);
        }

        i++;
        objects++;
    } while (i < count);
}

extern void sub_020611DC(LocalMapObject* object);

void sub_0205E520(MapObjectManager* manager) {
    GF_ASSERT(sub_0205F5D4(manager) == TRUE);

    int i = 0;
    int count = MapObjectManager_GetCount(manager);
    LocalMapObject* objects = MapObjectManager_GetObjects(manager);
    LocalMapObject* object = objects;
    do {
        if (MapObject_IsInUse(object) == TRUE) {
            if (MapObject_CheckFlag14(object) == TRUE) {
                sub_0205F4C0(object);
            } else {
                sub_0205EFB4(object);
            }

            sub_0205EF48(object);
            sub_020611DC(object);
        }

        i++;
        object++;
    } while (i < count);
}

void sub_0205E580(MapObjectManager* manager) {
    GF_ASSERT(sub_0205F5D4(manager) == TRUE);

    int i = 0;
    int count = MapObjectManager_GetCount(manager);
    LocalMapObject* objects = MapObjectManager_GetObjects(manager);
    LocalMapObject* object = objects;
    do {
        if (MapObject_IsInUse(object) == TRUE && MapObject_GetID(object) == 0xFF) {
            if (MapObject_CheckFlag14(object) == TRUE) {
                sub_0205F4C0(object);
            } else {
                sub_0205EFB4(object);
            }

            sub_0205EF48(object);
            sub_020611DC(object);

            return;
        }

        i++;
        object++;
    } while (i < count);
}

void FieldSystem_SyncMapObjectsToSaveEx(FieldSystem* fieldSystem, MapObjectManager* manager, SavedMapObject* list, int count) {
    int index = 0;
    LocalMapObject* local_object;
    SavedMapObject* saved_object = list;
    while (sub_0205EEF4(manager, &local_object, &index, MAPOBJECTFLAG_ACTIVE)) {
        sub_0205E680(fieldSystem, local_object, saved_object);

        count--;
        saved_object++;

        GF_ASSERT(count > 0);
    }

    if (count != 0) {
        memset(saved_object, 0, count * sizeof(SavedMapObject));
    }
}

void MapObjectManager_RestoreFromSave(MapObjectManager* manager, SavedMapObject* list, u32 num_objects) {
    while (num_objects) {
        if ((list->unk0 & MAPOBJECTFLAG_ACTIVE)) {
            LocalMapObject* local_object = MapObjectManager_GetFirstInactiveObject(manager);
            GF_ASSERT(local_object != NULL);

            sub_0205E7C4(local_object, list);
            sub_0205E8EC(manager, local_object);
        }
        list++;
        num_objects--;
    }
}

extern BOOL sub_02061248(FieldSystem* fieldSystem, VecFx32*, BOOL);

void sub_0205E680(FieldSystem* fieldSystem, LocalMapObject* local_object, SavedMapObject* saved_object) {
    saved_object->unk0 = MapObject_GetFlagsWord(local_object);
    saved_object->unk4 = MapObject_GetFlags2Word(local_object);
    saved_object->objId = MapObject_GetID(local_object);
    saved_object->unk10 = sub_0205F254(local_object);
    saved_object->gfxId = MapObject_GetGfxID(local_object);
    saved_object->movement = MapObject_GetMovement(local_object);
    saved_object->type = MapObject_GetType(local_object);
    saved_object->flagId = MapObject_GetFlagID(local_object);
    saved_object->script = MapObject_GetScript(local_object);
    saved_object->initialFacing = MapObject_GetInitialFacing(local_object);
    saved_object->currentFacing = MapObject_GetFacingDirection(local_object);
    saved_object->nextFacing = MapObject_GetNextFacing(local_object);
    saved_object->unk1A = MapObject_GetParam(local_object, 0);
    saved_object->unk1C = MapObject_GetParam(local_object, 1);
    saved_object->unk1E = MapObject_GetParam(local_object, 2);
    saved_object->xRange = MapObject_GetXRange(local_object);
    saved_object->yRange = MapObject_GetYRange(local_object);
    saved_object->initialX = MapObject_GetInitialX(local_object);
    saved_object->initialHeight = MapObject_GetInitialHeight(local_object);
    saved_object->initialY = MapObject_GetInitialY(local_object);
    saved_object->currentX = MapObject_GetCurrentX(local_object);
    saved_object->currentHeight = MapObject_GetCurrentHeight(local_object);
    saved_object->currentY = MapObject_GetCurrentY(local_object);

    VecFx32 coords;
    sub_020611C8(saved_object->currentX, saved_object->currentY, &coords);
    coords.y = MapObject_GetPosVecYCoord(local_object);

    if (!sub_02061248(fieldSystem, &coords, MapObject_CheckFlag29(local_object))) {
        saved_object->unk2C = MapObject_GetPosVecYCoord(local_object);
    } else {
        if (MapObject_CheckIgnoreHeights(local_object) == TRUE) {
            coords.y = MapObject_GetPosVecYCoord(local_object);
        }
        saved_object->unk2C = coords.y;
    }

    memcpy(saved_object->unk30, sub_0205F394(local_object), 16);
    memcpy(saved_object->unk40, sub_0205F3BC(local_object), 16);
}

void sub_0205E7C4(LocalMapObject* local_object, SavedMapObject* saved_object) {
    MapObject_SetFlagsWord(local_object, saved_object->unk0);
    MapObject_SetFlags2Word(local_object, saved_object->unk4);
    MapObject_SetID(local_object, saved_object->objId);
    sub_0205F250(local_object, saved_object->unk10);
    MapObject_SetGfxID(local_object, saved_object->gfxId);
    MapObject_SetMovement(local_object, saved_object->movement);
    MapObject_SetType(local_object, saved_object->type);
    MapObject_SetFlagID(local_object, saved_object->flagId);
    MapObject_SetScript(local_object, saved_object->script);
    MapObject_SetInitialFacing(local_object, saved_object->initialFacing);
    MapObject_ForceSetFacingDirection(local_object, saved_object->currentFacing);
    MapObject_SetNextFacing(local_object, saved_object->nextFacing);
    MapObject_SetParam(local_object, saved_object->unk1A, 0);
    MapObject_SetParam(local_object, saved_object->unk1C, 1);
    MapObject_SetParam(local_object, saved_object->unk1E, 2);
    MapObject_SetXRange(local_object, saved_object->xRange);
    MapObject_SetYRange(local_object, saved_object->yRange);
    MapObject_SetInitialX(local_object, saved_object->initialX);
    MapObject_SetInitialHeight(local_object, saved_object->initialHeight);
    MapObject_SetInitialY(local_object, saved_object->initialY);
    MapObject_SetCurrentX(local_object, saved_object->currentX);
    MapObject_SetCurrentHeight(local_object, saved_object->currentHeight);
    MapObject_SetCurrentY(local_object, saved_object->currentY);

    VecFx32 position_vec = {};
    position_vec.y = saved_object->unk2C;
    MapObject_SetPositionVec(local_object, &position_vec);

    memcpy(sub_0205F394(local_object), saved_object->unk30, 16);
    memcpy(sub_0205F3BC(local_object), saved_object->unk40, 16);
}

extern void MapObject_ClearHeldMovement(LocalMapObject* object);

void sub_0205E8EC(MapObjectManager* manager, LocalMapObject* object) {
    sub_0205E934(object);
    sub_0205E954(object);
    sub_0205F354(object, manager);
    sub_0205ECE0(object);
    MapObject_ClearHeldMovement(object);
    sub_0205EFB4(object);
    sub_0205EAF0(manager, object);
    sub_0205F450(object);
    sub_0205F16C(sub_0205F160(manager));
}

static void sub_0205E934(LocalMapObject* object) {
    MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK2 | MAPOBJECTFLAG_ACTIVE);
    MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_IGNORE_HEIGHTS |
                                     MAPOBJECTFLAG_UNK22 |
                                     MAPOBJECTFLAG_UNK21 |
                                     MAPOBJECTFLAG_UNK19 |
                                     MAPOBJECTFLAG_UNK18 |
                                     MAPOBJECTFLAG_UNK17 |
                                     MAPOBJECTFLAG_UNK16 |
                                     MAPOBJECTFLAG_UNK14 |
                                     MAPOBJECTFLAG_VISIBLE |
                                     MAPOBJECTFLAG_MOVEMENT_PAUSED |
                                     MAPOBJECTFLAG_UNK3);
    sub_0205EF5C(object);
}

static void sub_0205E954(LocalMapObject* object) {
    VecFx32 position_vec;
    MapObject_GetPositionVec(object, &position_vec);

    u32 x = MapObject_GetCurrentX(object);
    position_vec.x = x * (16 * FX32_ONE) + (8 * FX32_ONE);
    MapObject_SetPrevX(object, x);

    MapObject_SetPrevHeight(object, MapObject_GetCurrentHeight(object));

    u32 y = MapObject_GetCurrentY(object);
    position_vec.z = y * (16 * FX32_ONE) + (8 * FX32_ONE);
    MapObject_SetPrevY(object, y);

    MapObject_SetPositionVec(object, &position_vec);
}

struct MapObjectInitArgs {
    u32 map_no;
    int num_templates;
    int index;
    MapObjectManager* manager;
    ObjectEvent* templates;
};

void InitMapObjectsFromEventTemplates(MapObjectManager* manager, u32 map_no, u32 num_templates, ObjectEvent* templates_src) {
    GF_ASSERT(num_templates != 0);

    ObjectEvent* templates = AllocFromHeapAtEnd((HeapID)11, num_templates * sizeof(ObjectEvent));
    GF_ASSERT(templates != NULL);
    memcpy(templates, templates_src, num_templates * sizeof(ObjectEvent));

    struct MapObjectInitArgs* args = AllocFromHeapAtEnd((HeapID)11, sizeof(struct MapObjectInitArgs));
    GF_ASSERT(args != NULL);
    args->map_no = map_no;
    args->num_templates = num_templates;
    args->index = 0;
    args->manager = manager;
    args->templates = templates;

    sub_0205EA08(args);
}

void sub_0205EA08(struct MapObjectInitArgs* args) {
    FieldSystem* fieldSystem = MapObjectManager_GetFieldSysPtr(args->manager);
    ObjectEvent* template = args->templates;

    do {
        GF_ASSERT((ObjectEventTemplate_ScriptIdIsFFFF(template) != TRUE && FlagGet(fieldSystem, template->flag) != FALSE) ||
                  sub_0205E1D0(args->manager, template, args->map_no) != NULL);

        template++;
        args->index++;
    } while (args->index < args->num_templates);

    FreeToHeapExplicit((HeapID)11, args->templates);
    FreeToHeapExplicit((HeapID)11, args);
}

LocalMapObject* MapObjectManager_GetFirstInactiveObject(MapObjectManager* manager) {
    int i = 0;
    int count = MapObjectManager_GetCount(manager);
    LocalMapObject* object = MapObjectManager_GetObjects(manager);

    do {
        if (MapObject_GetFlagsMask(object, MAPOBJECTFLAG_ACTIVE) == 0) {
            return object;
        }

        i++;
        object++;
    } while (i < count);

    return NULL;
}

LocalMapObject* sub_0205EA98(MapObjectManager* manager, u32 id, u32 map_no) {
    int index = 0;
    LocalMapObject* object;

    while (sub_0205EEF4(manager, &object, &index, MAPOBJECTFLAG_ACTIVE) == TRUE) {
        if (MapObject_CheckFlag25(object) == TRUE && id == MapObject_GetID(object) && map_no == sub_0205F544(object)) {
            return object;
        }
    }

    return NULL;
}

void sub_0205EAF0(MapObjectManager* manager, LocalMapObject* object) {
    u32 priority = MapObjectManager_GetHeapID(manager);
    u32 movement = MapObject_GetMovement(object);
    if (movement == 48 || movement == 50) {
        priority += 2;
    }

    SysTask* task = CreateSysTask((SysTaskFunc)sub_0205F12C, object, priority);
    GF_ASSERT(task != NULL);

    sub_0205F338(object, task);
}

void MapObject_InitFromObjectEventTemplate(LocalMapObject* object, ObjectEvent* template, FieldSystem* fieldSystem) {
    MapObject_SetID(object, ObjectEventTemplate_GetID(template));
    MapObject_SetGfxID(object, ResolveObjectGfxId(fieldSystem, ObjectEventTemplate_GetSprite(template)));
    MapObject_SetMovement(object, ObjectEventTemplate_GetMovement(template));
    MapObject_SetType(object, ObjectEventTemplate_GetType(template));
    MapObject_SetFlagID(object, ObjectEventTemplate_GetFlagID(template));
    MapObject_SetScript(object, ObjectEventTemplate_GetScript(template));
    MapObject_SetInitialFacing(object, ObjectEventTemplate_GetFacing(template));
    MapObject_SetParam(object, ObjectEventTemplate_GetParam(template, 0), 0);
    MapObject_SetParam(object, ObjectEventTemplate_GetParam(template, 1), 1);
    MapObject_SetParam(object, ObjectEventTemplate_GetParam(template, 2), 2);
    MapObject_SetXRange(object, ObjectEventTemplate_GetXRange(template));
    MapObject_SetYRange(object, ObjectEventTemplate_GetYRange(template));

    MapObject_SetPositionVecFromTemplate(object, template);
}

void MapObject_SetPositionVecFromTemplate(LocalMapObject* object, ObjectEvent* template) {
    VecFx32 position_vec;

    u16 x = ObjectEventTemplate_GetXCoord(template);
    position_vec.x = x * (16 * FX32_ONE) + (8 * FX32_ONE);
    MapObject_SetInitialX(object, x);
    MapObject_SetPrevX(object, x);
    MapObject_SetCurrentX(object, x);

    position_vec.y = ObjectEventTemplate_GetHeight(template);
    u32 height = (position_vec.y >> 3) / FX32_ONE;
    MapObject_SetInitialHeight(object, height);
    MapObject_SetPrevHeight(object, height);
    MapObject_SetCurrentHeight(object, height);

    u16 y = ObjectEventTemplate_GetYCoord(template);
    position_vec.z = y * (16 * FX32_ONE) + (8 * FX32_ONE);
    MapObject_SetInitialY(object, y);
    MapObject_SetPrevY(object, y);
    MapObject_SetCurrentY(object, y);

    MapObject_SetPositionVec(object, &position_vec);
}

void sub_0205EC90(LocalMapObject* object, MapObjectManager* manager) {
    MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK12 | MAPOBJECTFLAG_UNK11 | MAPOBJECTFLAG_ACTIVE);
    if (MapObject_ScriptIdIsFFFF(object) == TRUE) {
        MapObject_SetFlag25(object, TRUE);
    }
    sub_0205F354(object, manager);
    MapObject_ForceSetFacingDirection(object, MapObject_GetInitialFacing(object));
    MapObject_SetNextFacing(object, MapObject_GetInitialFacing(object));
    MapObject_ClearHeldMovement(object);
}

void sub_0205ECE0(LocalMapObject* object) {
    u32 movement = MapObject_GetMovement(object);
    UnkLMOCallbackStruct* unk = sub_0205FB00(movement);
    sub_0205F414(object, sub_0205FB18(unk));
    sub_0205F428(object, sub_0205FB1C(unk));
    sub_0205F43C(object, sub_0205FB20(unk));
}

extern const UnkLMOCallbackStruct2 ov01_0220724C;

static void sub_0205ED18(LocalMapObject* object) {
    u32 gfx_id = MapObject_GetGfxID(object);
    UnkLMOCallbackStruct2* unk = (gfx_id == 0x2000) ? (UnkLMOCallbackStruct2*)&ov01_0220724C : sub_0205FB38(gfx_id);

    sub_0205F468(object, sub_0205FB24(unk));
    sub_0205F47C(object, sub_0205FB28(unk));
    sub_0205F490(object, sub_0205FB2C(unk));
    sub_0205F4A4(object, sub_0205FB30(unk));
    sub_0205F4B8(object, sub_0205FB34(unk));
}

void sub_0205ED80(LocalMapObject* object) {
    memset(object, 0, sizeof(LocalMapObject));
}

u32 sub_0205ED90(LocalMapObject* object, u32 a1, u32 a2, ObjectEvent* templates) {
    for (; a2 != 0; a2--, templates++) {
        if (ObjectEventTemplate_GetID(templates) != MapObject_GetID(object)) {
            continue;
        }

        if (ObjectEventTemplate_ScriptIdIsFFFF(templates) == TRUE) {
            u16 flag_id = ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF(templates);
            if (MapObject_CheckFlag25(object) == TRUE) {
                if (flag_id == sub_0205F544(object)) {
                    return 1;
                }
            } else if (flag_id == sub_0205F254(object)) {
                return 2;
            }
        } else if (MapObject_CheckFlag25(object) == TRUE && a1 == sub_0205F544(object)) {
            return 2;
        }
    }

    return 0;
}

LocalMapObject* sub_0205EE10(MapObjectManager* manager, u32 object_id, u32 object_flag_id) {
    int index = 0;
    LocalMapObject* object;

    while (sub_0205EEF4(manager, &object, &index, MAPOBJECTFLAG_ACTIVE) == TRUE) {
        if (object_id == MapObject_GetID(object) && object_flag_id == sub_0205F254(object)) {
            return object;
        }
    }

    return NULL;
}

LocalMapObject* GetMapObjectByID(MapObjectManager* manager, u32 id) {
    GF_ASSERT(manager != NULL);

    int count = MapObjectManager_GetCount(manager);
    LocalMapObject* objects = (LocalMapObject*)MapObjectManager_GetConstObjects(manager);
    LocalMapObject* object = objects;
    do {
        if (MapObject_TestFlagsBits(object, MAPOBJECTFLAG_ACTIVE) == TRUE &&
            MapObject_CheckFlag25(object) == FALSE &&
            id == MapObject_GetID(object))
        {
            return object;
        }

        count--;
        object++;
    } while (count > 0);

    return NULL;
}

LocalMapObject* sub_0205EEB4(MapObjectManager* manager, u32 movement) {
    int count = MapObjectManager_GetCount(manager);
    LocalMapObject* objects = (LocalMapObject*)MapObjectManager_GetConstObjects(manager);

    do {
        if (MapObject_TestFlagsBits(objects, MAPOBJECTFLAG_ACTIVE) == TRUE && movement == MapObject_GetMovement(objects)) {
            return objects;
        }

        count--;
        objects++;
    } while (count > 0);

    return NULL;
}

BOOL sub_0205EEF4(MapObjectManager* manager, LocalMapObject** object_dest, int* index, u32 bits) {
    int count = MapObjectManager_GetCount(manager);
    if (*index >= count) {
        return FALSE;
    }

    LocalMapObject* objects = (LocalMapObject*)MapObjectManager_GetConstObjects(manager);
    LocalMapObject* object = objects + *index;
    do {
        (*index)++;

        if (bits == MapObject_GetFlagsMask(object, bits)) {
            *object_dest = object;
            return TRUE;
        }

        object++;
    } while (*index < count);

    return FALSE;
}

void sub_0205EF48(LocalMapObject* object) {
    MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK2);
    sub_0205EF5C(object);
}

void sub_0205EF5C(LocalMapObject* object) {
    MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK26 |
                                     MAPOBJECTFLAG_UNK24 |
                                     MAPOBJECTFLAG_UNK20 |
                                     MAPOBJECTFLAG_UNK15);
}

void sub_0205EF6C(LocalMapObject* object) {
    // No-op
}

u32 ResolveObjectGfxId(FieldSystem* fieldSystem, int a1) {
    if (a1 >= 101 && a1 <= 117) {
        a1 = VarGetObjectEventGraphicsId(fieldSystem, (u16)(a1 - 101));
    }
    return a1;
}

static void sub_0205EF8C(LocalMapObject* object) {
    if (MapObject_GetFlagsMask(object, MAPOBJECTFLAG_UNK12) != 0) {
        sub_02061070(object);
    }
}

void sub_0205EFA4(LocalMapObject* object) {
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
    MapObject_SetScript(object, ObjectEventTemplate_GetScript(template));
    MapObject_SetFlagID(object, ObjectEventTemplate_GetFlagID(template));
}

void sub_0205F058(LocalMapObject* object, u32 map_no, ObjectEvent* template) {
    GF_ASSERT(ObjectEventTemplate_ScriptIdIsFFFF(template) == TRUE);

    MapObject_SetFlag25(object, TRUE);
    MapObject_SetScript(object, ObjectEventTemplate_GetScript(template));
    MapObject_SetFlagID(object, ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF(template));
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

BOOL sub_0205F0F8(LocalMapObject* object, u32 gfx_id, u32 id, u32 a3) {
    if (!MapObject_TestFlagsBits(object, MAPOBJECTFLAG_ACTIVE)) {
        return FALSE;
    }

    u32 object_gfx_id = MapObject_GetGfxID(object);
    if (object_gfx_id != gfx_id) {
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

// ?
MapObjectManager* sub_0205F160(MapObjectManager* manager) {
    return manager;
}

void MapObjectManager_SetCount(MapObjectManager* manager, u32 count) {
    manager->object_count = count;
}

u32 MapObjectManager_GetCount(MapObjectManager* manager) {
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

void MapObjectManager_SetHeapID(MapObjectManager* manager, HeapID heapId) {
    manager->heapId = heapId;
}

HeapID MapObjectManager_GetHeapID(MapObjectManager* manager) {
    return manager->heapId;
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

void MapObjectManager_SetFieldSysPtr(MapObjectManager* manager, FieldSystem* fieldSystem) {
    manager->fieldSystem = fieldSystem;
}

FieldSystem* MapObjectManager_GetFieldSysPtr(MapObjectManager* manager) {
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

void MapObject_SetFlagsBits(LocalMapObject* object, u32 bits) {
    object->flags |= bits;
}

void MapObject_ClearFlagsBits(LocalMapObject* object, u32 bits) {
    object->flags &= ~bits;
}

u32 MapObject_GetFlagsMask(LocalMapObject* object, u32 mask) {
    return object->flags & mask;
}

BOOL MapObject_TestFlagsBits(LocalMapObject* object, u32 bits) {
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

void sub_0205F250(LocalMapObject* object, u32 a1) {
    object->unkC = a1;
}

u32 sub_0205F254(LocalMapObject* object) {
    return object->unkC;
}

void MapObject_SetGfxID(LocalMapObject* object, u32 gfx_id) {
    object->gfxId = gfx_id;
}

u32 MapObject_GetGfxID(LocalMapObject* object) {
    return object->gfxId;
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

void MapObject_SetInitialFacing(LocalMapObject* object, u32 initial_facing) {
    object->initialFacing = initial_facing;
}

u32 MapObject_GetInitialFacing(LocalMapObject* object) {
    return object->initialFacing;
}

void MapObject_ForceSetFacingDirection(LocalMapObject* object, u32 direction) {
    object->currentFacingBak = object->currentFacing;
    object->currentFacing = direction;
}

void MapObject_SetFacingDirection(LocalMapObject* object, u32 direction) {
    if (MapObject_GetFlagsMask(object, MAPOBJECTFLAG_UNK7) == 0) {
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

void MapObject_SetNextFacing(LocalMapObject* object, u32 direction) {
    object->nextFacingBak = object->nextFacing;
    object->nextFacing = direction;
}

u32 MapObject_GetNextFacing(LocalMapObject* object) {
    return object->nextFacing;
}

void MapObject_SetOrQueueFacing(LocalMapObject* object, u32 direction) {
    MapObject_SetFacingDirection(object, direction);
    MapObject_SetNextFacing(object, direction);
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
    DestroySysTask(sub_0205F340(object));
}

void sub_0205F354(LocalMapObject* object, MapObjectManager* manager) {
    object->manager = manager;
}

MapObjectManager* MapObject_GetManager(LocalMapObject* object) {
    return object->manager;
}

MapObjectManager* sub_0205F364(LocalMapObject* object) {
    return sub_0205F160(object->manager);
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

FieldSystem* MapObject_GetFieldSysPtr(LocalMapObject* object) {
    return MapObjectManager_GetFieldSysPtr(sub_0205F364(object));
}

void* sub_0205F538(LocalMapObject* object) {
    return (void*)MapObjectManager_GetHeapID(MapObject_GetManager(object));
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
    u32 count = MapObjectManager_GetCount(manager);
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
    u32 count = MapObjectManager_GetCount(manager);
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

    if (MapObject_GetFlagsMask(object, MAPOBJECTFLAG_UNK14) != 0) {
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
    return MapObject_GetFlagsMask(object, MAPOBJECTFLAG_IGNORE_HEIGHTS) != 0;
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
    return MapObject_GetFlagsMask(object, MAPOBJECTFLAG_UNK25) != 0;
}

void MapObject_SetFlag26(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK26);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK26);
    }
}

BOOL MapObject_CheckFlag26(LocalMapObject* object) {
    return MapObject_GetFlagsMask(object, MAPOBJECTFLAG_UNK26) != 0;
}

void MapObject_SetFlag28(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK28);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK28);
    }
}

BOOL MapObject_CheckFlag28(LocalMapObject* object) {
    return MapObject_GetFlagsMask(object, MAPOBJECTFLAG_UNK28) != 0;
}

void MapObject_SetFlag24(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK24);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK24);
    }
}

BOOL MapObject_CheckFlag24(LocalMapObject* object) {
    return MapObject_GetFlagsMask(object, MAPOBJECTFLAG_UNK24) != 0;
}

BOOL MapObject_CheckFlag4(LocalMapObject* object) {
    return MapObject_GetFlagsMask(object, MAPOBJECTFLAG_UNK4) != 0;
}

void MapObject_SetFlag29(LocalMapObject* object, BOOL set) {
    if (set == TRUE) {
        MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK29);
    } else {
        MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK29);
    }
}

BOOL MapObject_CheckFlag29(LocalMapObject* object) {
    return MapObject_GetFlagsMask(object, MAPOBJECTFLAG_UNK29) != 0;
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

void MapObject_SetPrevX(LocalMapObject* object, u32 previous_x) {
    object->previousX = previous_x;
}

u32 MapObject_GetPrevHeight(LocalMapObject* object) {
    return object->previousHeight;
}

void MapObject_SetPrevHeight(LocalMapObject* object, u32 previous_height) {
    object->previousHeight = previous_height;
}

u32 MapObject_GetPrevY(LocalMapObject* object) {
    return object->previousY;
}

void MapObject_SetPrevY(LocalMapObject* object, u32 previous_y) {
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

void ObjectEventTemplate_SetID(ObjectEvent* template, u16 id) {
    template->id = id;
}

u16 ObjectEventTemplate_GetID(ObjectEvent* template) {
    return template->id;
}

void ObjectEventTemplate_SetSprite(ObjectEvent* template, u32 sprite) {
    template->ovid = sprite;
}

u16 ObjectEventTemplate_GetSprite(ObjectEvent* template) {
    return template->ovid;
}

void ObjectEventTemplate_SetMovement(ObjectEvent* template, u32 movement) {
    template->mvt = movement;
}

u16 ObjectEventTemplate_GetMovement(ObjectEvent* template) {
    return template->mvt;
}

void ObjectEventTemplate_SetType(ObjectEvent* template, u16 type) {
    template->type = type;
}

u16 ObjectEventTemplate_GetType(ObjectEvent* template) {
    return template->type;
}

void ObjectEventTemplate_SetFlagID(ObjectEvent* template, u16 flag) {
    template->flag = flag;
}

u16 ObjectEventTemplate_GetFlagID(ObjectEvent* template) {
    return template->flag;
}

void ObjectEventTemplate_SetScript(ObjectEvent* template, u16 script) {
    template->scr = script;
}

u16 ObjectEventTemplate_GetScript(ObjectEvent* template) {
    return template->scr;
}

void ObjectEventTemplate_SetFacing(ObjectEvent* template, u32 direction) {
    template->dirn = direction;
}

s16 ObjectEventTemplate_GetFacing(ObjectEvent* template) {
    return template->dirn;
}

void ObjectEventTemplate_SetParam(ObjectEvent* template, u32 value, int param) {
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

u16 ObjectEventTemplate_GetParam(ObjectEvent* template, int param) {
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

void ObjectEventTemplate_SetXRange(ObjectEvent* template, s16 x_range) {
    template->xrange = x_range;
}

s16 ObjectEventTemplate_GetXRange(ObjectEvent* template) {
    return template->xrange;
}

void ObjectEventTemplate_SetYRange(ObjectEvent* template, s16 y_range) {
    template->yrange = y_range;
}

s16 ObjectEventTemplate_GetYRange(ObjectEvent* template) {
    return template->yrange;
}

void ObjectEventTemplate_SetXCoord(ObjectEvent* template, u32 x) {
    template->x = x;
}

u16 ObjectEventTemplate_GetXCoord(ObjectEvent* template) {
    return template->x;
}

void ObjectEventTemplate_SetHeight(ObjectEvent* template, u32 height) {
    template->z = height;
}

u32 ObjectEventTemplate_GetHeight(ObjectEvent* template) {
    return template->z;
}

void ObjectEventTemplate_SetYCoord(ObjectEvent* template, u32 y) {
    template->y = y;
}

u16 ObjectEventTemplate_GetYCoord(ObjectEvent* template) {
    return template->y;
}

ObjectEvent* sub_0205FA98(u16 id, int num_templates, ObjectEvent* templates) {
    int i = 0;
    ObjectEvent* template = templates;
    do {
        if (!ObjectEventTemplate_ScriptIdIsFFFF(template) && id == ObjectEventTemplate_GetID(template)) {
            return templates + i;
        }

        i++;
        template++;
    } while (i < num_templates);

    return NULL;
}

BOOL ObjectEventTemplate_ScriptIdIsFFFF(ObjectEvent* template) {
    u16 script = (u16)(u32)ObjectEventTemplate_GetScript(template);
    return script == 0xFFFF;
}

u16 ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF(ObjectEvent* template) {
    GF_ASSERT(ObjectEventTemplate_ScriptIdIsFFFF(template) == TRUE);
    return ObjectEventTemplate_GetFlagID(template);
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

extern ObjectEventGraphicsInfo* GetObjectEventGfxInfoPtr(u32 gfx_id);
extern UnkLMOCallbackStruct2* ov01_02209A38[20];

UnkLMOCallbackStruct2* sub_0205FB38(u32 gfx_id) {
    ObjectEventGraphicsInfo* unk = GetObjectEventGfxInfoPtr(gfx_id);
    if (unk == NULL) {
        return NULL;
    }

    return ov01_02209A38[unk->unk4_5];
}

LocalMapObject* sub_0205FB58(MapObjectManager* manager, u32 x, u32 y, BOOL a3) {
    u32 count = MapObjectManager_GetCount(manager);
    LocalMapObject* objects = MapObjectManager_GetObjects(manager);

    LocalMapObject* object = objects;
    do {
        if (MapObject_GetFlagsMask(object, MAPOBJECTFLAG_ACTIVE) != 0) {
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
    MapObject_ForceSetFacingDirection(object, direction);
    MapObject_ClearHeldMovement(object);
    MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK2);
    MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK3 | MAPOBJECTFLAG_SINGLE_MOVEMENT);
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
    MapObject_ForceSetFacingDirection(object, direction);
    MapObject_SetFlagsBits(object, MAPOBJECTFLAG_UNK2);
    MapObject_ClearFlagsBits(object, MAPOBJECTFLAG_UNK3 | MAPOBJECTFLAG_SINGLE_MOVEMENT);
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
    u32 gfx_id = MapObject_GetGfxID(object);
    UnkLMOCallbackStruct2* unk = (gfx_id == 0x2000) ? (UnkLMOCallbackStruct2*)&ov01_0220724C : sub_0205FB38(gfx_id);
    sub_0205F47C(object, sub_0205FB28(unk));
}

SavedMapObject* SaveMapObjects_SearchSpriteId(SavedMapObject* list, u32 num_objects, u16 sprite_id) {
    SavedMapObject* object = list;
    for (; num_objects > 0; object++, num_objects--) {
        if ((object->unk0 & MAPOBJECTFLAG_ACTIVE) != 0 && object->gfxId == sprite_id) {
            return object;
        }
    }

    return NULL;
}
