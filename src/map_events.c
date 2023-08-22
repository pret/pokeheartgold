#include "map_events.h"
#include "filesystem.h"
#include "encounter_tables_narc.h"
#include "field_map_object.h"

static void MapEvents_ReadFromNarc(MapEvents *events, u32 mapno);
static void MapEvents_ComputeRamHeader(MapEvents *events);
static void MapScriptHeader_ReadFromNarc(MapEvents *events, u32 mapno);

void Field_AllocateMapEvents(FieldSystem *work, HeapID heapId) {
    GF_ASSERT(work->mapEvents == NULL);
    work->mapEvents = AllocFromHeap(heapId, sizeof(MapEvents));
}

void Field_FreeMapEvents(FieldSystem *work) {
    GF_ASSERT(work->mapEvents != NULL);
    FreeToHeap(work->mapEvents);
}

void Field_InitMapEvents(FieldSystem *work, u32 mapno) {
    GF_ASSERT(work->mapEvents != NULL);
    MapEvents_ReadFromNarc(work->mapEvents, mapno);
    MapEvents_ComputeRamHeader(work->mapEvents);
    WildEncounters_ReadFromNarc(&work->mapEvents->wildEncounters, mapno);
    MapScriptHeader_ReadFromNarc(work->mapEvents, mapno);
}

static void MapEvents_ReadFromNarc(MapEvents *events, u32 mapno) {
    int bank = MapHeader_GetEventsBank(mapno);
    GF_ASSERT(GetNarcMemberSizeByIdPair(NARC_fielddata_eventdata_zone_event, bank) < sizeof(events->event_data));
    ReadWholeNarcMemberByIdPair(events->event_data, NARC_fielddata_eventdata_zone_event, bank);
}

void Field_InitMapObjectsFromZoneEventData(FieldSystem *fieldSystem) {
    u32 obj_count = fieldSystem->mapEvents->num_object_events;
    GF_ASSERT(fieldSystem->mapEvents != NULL);
    if (obj_count != 0) {
        InitMapObjectsFromEventTemplates(fieldSystem->mapObjectMan, fieldSystem->location->mapId, obj_count, fieldSystem->mapEvents->object_events);
    }
}

BG_EVENT *Field_GetBgEvents(FieldSystem *fieldSystem) {
    return fieldSystem->mapEvents->bg_events;
}

u32 Field_GetNumBgEvents(const FieldSystem *fieldSystem) {
    return fieldSystem->mapEvents->num_bg_events;
}

const WARP_EVENT *Field_GetWarpEventI(const FieldSystem *fieldSystem, u32 warpno) {
    MapEvents *events = fieldSystem->mapEvents;
    if (warpno >= fieldSystem->mapEvents->num_warp_events) {
        return NULL;
    } else {
        return &fieldSystem->mapEvents->warp_events[warpno];
    }
}

int Field_GetWarpEventAtXYPos(const FieldSystem *fieldSystem, int x, int y) {
    int i;

    for (i = 0; i < fieldSystem->mapEvents->num_warp_events; i++) {
        if (x == fieldSystem->mapEvents->warp_events[i].x && y == fieldSystem->mapEvents->warp_events[i].y) {
            return i;
        }
    }

    return -1;
}

u32 Field_GetNumCoordEvents(const FieldSystem *fieldSystem) {
    return fieldSystem->mapEvents->num_coord_events;
}

const COORD_EVENT *Field_GetCoordEvents(const FieldSystem *fieldSystem) {
    return fieldSystem->mapEvents->coord_events;
}

u32 Field_GetNumObjectEvents(const FieldSystem *fieldSystem) {
    return fieldSystem->mapEvents->num_object_events;
}

const ObjectEvent *Field_GetObjectEvents(const FieldSystem *fieldSystem) {
    return fieldSystem->mapEvents->object_events;
}

BOOL Field_SetEventDefaultXYPos(FieldSystem *fieldSystem, int id, u16 x, u16 y) {
    int i;
    ObjectEvent *objs = fieldSystem->mapEvents->object_events;
    u32 num_objs = fieldSystem->mapEvents->num_object_events;

    for (i = 0; i < num_objs; i++) {
        if (objs[i].id == id) {
            objs[i].x = x;
            objs[i].y = y;
            return TRUE;
        }
    }

    GF_ASSERT(0);
    return FALSE;
}

BOOL Field_SetEventDefaultDirection(FieldSystem *fieldSystem, int id, u16 dirn) {
    int i;
    ObjectEvent *objs = fieldSystem->mapEvents->object_events;
    u32 num_objs = fieldSystem->mapEvents->num_object_events;

    for (i = 0; i < num_objs; i++) {
        if (objs[i].id == id) {
            objs[i].dirn = dirn;
            return TRUE;
        }
    }

    GF_ASSERT(0);
    return FALSE;
}

BOOL Field_SetEventDefaultMovement(FieldSystem *fieldSystem, int id, u16 mvt) {
    int i;
    ObjectEvent *objs = fieldSystem->mapEvents->object_events;
    u32 num_objs = fieldSystem->mapEvents->num_object_events;

    for (i = 0; i < num_objs; i++) {
        if (objs[i].id == id) {
            objs[i].mvt = mvt;
            return TRUE;
        }
    }

    GF_ASSERT(0);
    return FALSE;
}

BOOL Field_SetWarpXYPos(FieldSystem *fieldSystem, int warpno, u16 x, u16 y) {
    WARP_EVENT *warps = fieldSystem->mapEvents->warp_events;
    warps[warpno].x = x;
    warps[warpno].y = y;
    return TRUE;
}

BOOL Field_SetBgEventXYPos(FieldSystem *fieldSystem, int bgno, u32 x, u32 y) {
    BG_EVENT *bgs = Field_GetBgEvents(fieldSystem);
    bgs[bgno].x = x;
    bgs[bgno].y = y;
    return TRUE;
}

static void MapEvents_ComputeRamHeader(MapEvents *events) {
    u8 *ptr = events->event_data;

    events->num_bg_events = *(u32 *)ptr;
    ptr += sizeof(u32);
    if (events->num_bg_events != 0) {
        events->bg_events = (BG_EVENT *)ptr;
    } else {
        events->bg_events = NULL;
    }
    ptr += events->num_bg_events * sizeof(BG_EVENT);

    events->num_object_events = *(u32 *)ptr;
    ptr += sizeof(u32);
    if (events->num_object_events != 0) {
        events->object_events = (ObjectEvent *)ptr;
    } else {
        events->object_events = NULL;
    }
    ptr += events->num_object_events * sizeof(ObjectEvent);

    events->num_warp_events = *(u32 *)ptr;
    ptr += sizeof(u32);
    if (events->num_warp_events != 0) {
        events->warp_events = (WARP_EVENT *)ptr;
    } else {
        events->warp_events = NULL;
    }
    ptr += events->num_warp_events * sizeof(WARP_EVENT);

    events->num_coord_events = *(u32 *)ptr;
    ptr += sizeof(u32);
    if (events->num_coord_events != 0) {
        events->coord_events = (COORD_EVENT *)ptr;
    } else {
        events->coord_events = NULL;
    }
}

void WildEncounters_ReadFromNarc(ENC_DATA *encData, u32 mapno) {
    memset(encData, 0, sizeof(ENC_DATA));
    if (MapHeader_HasWildEncounters(mapno)) {
        int bank = MapHeader_GetWildEncounterBank(mapno);
        ReadWholeNarcMemberByIdPair(encData, ENCDATA_NARC, bank);
    }
}

ENC_DATA *MapEvents_GetLoadedEncTable(FieldSystem *fieldSystem) {
    return &fieldSystem->mapEvents->wildEncounters;
}

static void MapScriptHeader_ReadFromNarc(MapEvents *events, u32 mapno) {
    int bank = MapHeader_GetScriptHeaderBank(mapno);
    MI_CpuClearFast(events->script_header, sizeof(events->script_header));
    GF_ASSERT(GetNarcMemberSizeByIdPair(NARC_fielddata_script_scr_seq, bank) < sizeof(events->script_header));
    ReadWholeNarcMemberByIdPair(events->script_header, NARC_fielddata_script_scr_seq, bank);
}

u8 *MapEvents_GetScriptHeader(FieldSystem *fieldSystem) {
    GF_ASSERT(fieldSystem->mapEvents != NULL);
    return fieldSystem->mapEvents->script_header;
}
