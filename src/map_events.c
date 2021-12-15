#include "map_events.h"
#include "filesystem.h"
#include "encounter_tables_narc.h"

void MapEvents_ReadFromNarc(MAP_EVENTS *events, u32 mapno);
void MapEvents_ComputeRamHeader(MAP_EVENTS *events);
void WildEncounters_ReadFromNarc(ENC_DATA *encounters, u32 mapno);
void LevelScripts_ReadFromNarc(MAP_EVENTS *events, u32 mapno);

extern void InitMapObjectsFromEventTemplates(UnkSavStruct80_Sub3C*, int, u32, OBJECT_EVENT*);

void Field_AllocateMapEvents(UnkSavStruct80 *work, HeapID heapId) {
    GF_ASSERT(work->map_events == NULL);
    work->map_events = AllocFromHeap(heapId, sizeof(MAP_EVENTS));
}

void Field_FreeMapEvents(UnkSavStruct80 *work) {
    GF_ASSERT(work->map_events != NULL);
    FreeToHeap(work->map_events);
}

void Field_InitMapEvents(UnkSavStruct80 *work, u32 mapno) {
    GF_ASSERT(work->map_events != NULL);
    MapEvents_ReadFromNarc(work->map_events, mapno);
    MapEvents_ComputeRamHeader(work->map_events);
    WildEncounters_ReadFromNarc(&work->map_events->wildEncounters, mapno);
    LevelScripts_ReadFromNarc(work->map_events, mapno);
}

void MapEvents_ReadFromNarc(MAP_EVENTS *events, u32 mapno) {
    int bank = MapHeader_GetEventsBank(mapno);
    GF_ASSERT(GetNarcMemberSizeByIdPair(NARC_fielddata_eventdata_zone_event, bank) < sizeof(events->event_data));
    ReadWholeNarcMemberByIdPair(events->event_data, NARC_fielddata_eventdata_zone_event, bank);
}

void Field_InitMapObjectsFromZoneEventData(UnkSavStruct80 *fsys) {
    u32 obj_count = fsys->map_events->num_object_events;
    GF_ASSERT(fsys->map_events != NULL);
    if (obj_count != 0) {
        InitMapObjectsFromEventTemplates(fsys->unk3C, fsys->unk20->unk0, obj_count, fsys->map_events->object_events);
    }
}

BG_EVENT *Field_GetBgEvents(UnkSavStruct80 *fsys) {
    return fsys->map_events->bg_events;
}

u32 Field_GetNumBgEvents(const UnkSavStruct80 *fsys) {
    return fsys->map_events->num_bg_events;
}

const WARP_EVENT *Field_GetWarpEventI(const UnkSavStruct80 *fsys, u32 warpno) {
    MAP_EVENTS *events = fsys->map_events;
    if (warpno >= fsys->map_events->num_warp_events) {
        return NULL;
    } else {
        return &fsys->map_events->warp_events[warpno];
    }
}

int Field_GetWarpEventAtXYPos(const UnkSavStruct80 *fsys, int x, int y) {
    int i;

    for (i = 0; i < fsys->map_events->num_warp_events; i++) {
        if (x == fsys->map_events->warp_events[i].x && y == fsys->map_events->warp_events[i].y) {
            return i;
        }
    }

    return -1;
}

u32 Field_GetNumCoordEvents(const UnkSavStruct80 *fsys) {
    return fsys->map_events->num_coord_events;
}

const COORD_EVENT *Field_GetCoordEvents(const UnkSavStruct80 *fsys) {
    return fsys->map_events->coord_events;
}

u32 Field_GetNumObjectEvents(const UnkSavStruct80 *fsys) {
    return fsys->map_events->num_object_events;
}

const OBJECT_EVENT *Field_GetObjectEvents(const UnkSavStruct80 *fsys) {
    return fsys->map_events->object_events;
}

BOOL Field_SetObjectEventXYPos(UnkSavStruct80 *fsys, int id, u16 x, u16 y) {
    int i;
    OBJECT_EVENT *objs = fsys->map_events->object_events;
    u32 num_objs = fsys->map_events->num_object_events;

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

BOOL Field_SetObjectEventFacing(UnkSavStruct80 *fsys, int id, u16 dirn) {
    int i;
    OBJECT_EVENT *objs = fsys->map_events->object_events;
    u32 num_objs = fsys->map_events->num_object_events;

    for (i = 0; i < num_objs; i++) {
        if (objs[i].id == id) {
            objs[i].dirn = dirn;
            return TRUE;
        }
    }

    GF_ASSERT(0);
    return FALSE;
}

BOOL Field_SetObjectEventMovement(UnkSavStruct80 *fsys, int id, u16 mvt) {
    int i;
    OBJECT_EVENT *objs = fsys->map_events->object_events;
    u32 num_objs = fsys->map_events->num_object_events;

    for (i = 0; i < num_objs; i++) {
        if (objs[i].id == id) {
            objs[i].mvt = mvt;
            return TRUE;
        }
    }

    GF_ASSERT(0);
    return FALSE;
}

BOOL Field_SetWarpXYPos(UnkSavStruct80 *fsys, int warpno, u16 x, u16 y) {
    WARP_EVENT *warps = fsys->map_events->warp_events;
    warps[warpno].x = x;
    warps[warpno].y = y;
    return TRUE;
}

BOOL Field_SetBgEventXYPos(UnkSavStruct80 *fsys, int bgno, u32 x, u32 y) {
    BG_EVENT *bgs = Field_GetBgEvents(fsys);
    bgs[bgno].x = x;
    bgs[bgno].y = y;
    return TRUE;
}

void MapEvents_ComputeRamHeader(MAP_EVENTS *events) {
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
        events->object_events = (OBJECT_EVENT *)ptr;
    } else {
        events->object_events = NULL;
    }
    ptr += events->num_object_events * sizeof(OBJECT_EVENT);

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

ENC_DATA *MapEvents_GetLoadedEncTable(UnkSavStruct80 *fsys) {
    return &fsys->map_events->wildEncounters;
}

void LevelScripts_ReadFromNarc(MAP_EVENTS *events, u32 mapno) {
    int bank = MapHeader_GetLevelScriptsBank(mapno);
    MI_CpuClearFast(events->lvscrseq, sizeof(events->lvscrseq));
    GF_ASSERT(GetNarcMemberSizeByIdPair(NARC_fielddata_script_scr_seq, bank) < sizeof(events->lvscrseq));
    ReadWholeNarcMemberByIdPair(events->lvscrseq, NARC_fielddata_script_scr_seq, bank);
}

u8 *MapEvents_GetLoadedLevelScripts(UnkSavStruct80 *fsys) {
    GF_ASSERT(fsys->map_events != NULL);
    return fsys->map_events->lvscrseq;
}
