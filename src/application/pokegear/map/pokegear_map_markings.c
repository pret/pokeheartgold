#include "application/pokegear/map/pokegear_map_internal.h"

static void MapMarkingsHeapNode_Reset(MapMarkingsHeapNode *node);
static u8 PokegearMap_GetAvailableMarkingsHeapNode(PokegearMapAppData *mapApp);

static void MapMarkingsHeapNode_Reset(MapMarkingsHeapNode *node) {
    node->active = 0;
    node->index = node->prev = node->next = 0xFF;
    MapMarkingsRAM_Reset(&node->mapMarkings);
}

static u8 PokegearMap_GetAvailableMarkingsHeapNode(PokegearMapAppData *mapApp) {
    u8 i;

    for (i = 0; i < PGMAP_NUM_LOCATIONS; ++i) {
        if (!mapApp->mapMarkingsHeap[i].active) {
            return i;
        }
    }

    return -1;
}

void MapApp_LoadMarkingsListFromSave(PokegearMapAppData *mapApp) {
    u8 i;
    u8 index;
    MapMarkingsSaveArray *mmSave;
    MapMarkingsHeapNode *mmHeap;

    mmSave = SavePokegear_GetMapMarkingsArray(mapApp->pokegear->savePokegear);
    mapApp->mapMarkingsListHead = mapApp->mapMarkingsListTail = 0xFF;
    for (i = 0; i < PGMAP_NUM_LOCATIONS; ++i) {
        MapMarkingsHeapNode_Reset(&mapApp->mapMarkingsHeap[i]);
    }

    index = 0;
    for (i = 0; i < PGMAP_NUM_LOCATIONS; ++i) {
        if (!MapMarkingsSaveArray_EntryIsValid(mmSave, i)) {
            break;
        }
        mmHeap = &mapApp->mapMarkingsHeap[index];
        MapMarkingsSaveArray_CopyEntryToRAM(mmSave, &mmHeap->mapMarkings, i);
        mmHeap->index = index;
        mmHeap->active = TRUE;
        if (mapApp->mapMarkingsListHead == 0xFF) {
            mapApp->mapMarkingsListHead = mmHeap->index;
            mapApp->mapMarkingsListTail = mmHeap->index;
            mmHeap->prev = 0xFF;
        } else {
            mmHeap->prev = mapApp->mapMarkingsListTail;
            mapApp->mapMarkingsHeap[mapApp->mapMarkingsListTail].next = mmHeap->index;
            mapApp->mapMarkingsListTail = mmHeap->index;
        }
        ++index;
    }
    mapApp->mapMarkingsListCount = index;
}

void PokegearMap_SaveMapMarkings(PokegearMapAppData *mapApp) {
    u8 i;
    u8 index;
    MapMarkingsSaveArray *mmSave;
    MapMarkingsHeapNode *mmHeapNode;

    mmSave = SavePokegear_GetMapMarkingsArray(mapApp->pokegear->savePokegear);
    index = 0;
    for (i = mapApp->mapMarkingsListHead; i != 0xFF; i = mmHeapNode->next) {
        mmHeapNode = &mapApp->mapMarkingsHeap[i];
        MapMarkingsSaveArray_CopyEntryFromRAM(mmSave, &mmHeapNode->mapMarkings, index++, TRUE);
    }
    for (i = index; i < mapApp->mapMarkingsListCount; ++i) {
        MapMarkingsSaveArray_ResetEntry(mmSave, i);
    }
}

MapMarkingsHeapNode *MapApp_GetMarkingsHeapNodeByMapID(PokegearMapAppData *mapApp, int mapID) {
    u8 i;
    MapMarkingsHeapNode *ret;

    if (mapID <= 0) {
        return NULL;
    }
    for (i = mapApp->mapMarkingsListHead; i != 0xFF; i = ret->next) {
        ret = &mapApp->mapMarkingsHeap[i];
        if (ret->mapMarkings.mapID == mapID) {
            return ret;
        }
    }
    return NULL;
}

MapMarkingsHeapNode *MapApp_GetOrCreateMarkingsHeapNodeByMapID(PokegearMapAppData *mapApp, u16 mapID) {
    u8 index;
    MapMarkingsHeapNode *ret;

    ret = MapApp_GetMarkingsHeapNodeByMapID(mapApp, mapID);
    if (ret != NULL) {
        return ret;
    }
    index = PokegearMap_GetAvailableMarkingsHeapNode(mapApp);
    if (index == 0xFF) {
        GF_ASSERT(FALSE);
        return NULL;
    }
    ret = &mapApp->mapMarkingsHeap[index];
    ret->index = index;
    ret->active = TRUE;
    ret->mapMarkings.mapID = mapID;
    if (mapApp->mapMarkingsListHead == 0xFF) {
        mapApp->mapMarkingsListHead = mapApp->mapMarkingsListTail = index;
        ret->prev = 0xFF;
    } else {
        mapApp->mapMarkingsHeap[mapApp->mapMarkingsListTail].next = index;
        ret->prev = mapApp->mapMarkingsListTail;
        mapApp->mapMarkingsListTail = index;
    }
    return ret;
}

BOOL MapApp_RemoveMarkingsHeapNodeFromList(PokegearMapAppData *mapApp, MapMarkingsHeapNode *node) {
    if (node == NULL) {
        return FALSE;
    }
    if (node->index == mapApp->mapMarkingsListHead) {
        if (node->next == 0xFF) {
            mapApp->mapMarkingsListHead = mapApp->mapMarkingsListTail = 0xFF;
        } else {
            mapApp->mapMarkingsListHead = mapApp->mapMarkingsHeap[node->next].index;
            mapApp->mapMarkingsHeap[node->next].prev = 0xFF;
        }
    } else if (node->index == mapApp->mapMarkingsListTail) {
        mapApp->mapMarkingsHeap[node->prev].next = 0xFF;
        mapApp->mapMarkingsListTail = mapApp->mapMarkingsHeap[node->prev].index;
    } else {
        mapApp->mapMarkingsHeap[node->prev].next = node->next;
        mapApp->mapMarkingsHeap[node->next].prev = node->prev;
    }
    MapMarkingsHeapNode_Reset(node);
    return TRUE;
}

BOOL MapMarkingsHeapNode_SetIcon(MapMarkingsHeapNode *node, u8 index, u8 icon) {
    if (node == NULL) {
        return FALSE;
    }
    node->mapMarkings.icons[index] = icon;
    return TRUE;
}

BOOL MapMarkingsHeapNode_RemoveIcon(MapMarkingsHeapNode *node, u8 index) {
    if (node == NULL) {
        return FALSE;
    }
    node->mapMarkings.icons[index] = MAP_MARKING_ICON_NULL;
    if (MapMarkingsRAM_IsInUse_EraseIfNot(&node->mapMarkings)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL MapMarkingsHeapNode_SwapIcons(MapMarkingsHeapNode *node, u8 index1, u8 index2) {
    u8 tmp;
    if (node == NULL) {
        return FALSE;
    }
    tmp = node->mapMarkings.icons[index1];
    node->mapMarkings.icons[index1] = node->mapMarkings.icons[index2];
    node->mapMarkings.icons[index2] = tmp;
    return TRUE;
}

BOOL MapMarkingsHeapNode_SetWord(MapMarkingsHeapNode *node, u8 index, u16 word) {
    if (node == NULL) {
        return FALSE;
    }
    node->mapMarkings.words[index] = word;
    return TRUE;
}

BOOL MapMarkingsHeapNode_RemoveWord(MapMarkingsHeapNode *node, u8 index) {
    if (node == NULL) {
        return FALSE;
    }
    node->mapMarkings.words[index] = EC_WORD_NULL;
    if (MapMarkingsRAM_IsInUse_EraseIfNot(&node->mapMarkings)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL MapMarkingsHeapNode_SwapWords(MapMarkingsHeapNode *node, u8 index1, u8 index2) {
    u16 tmp;
    if (node == NULL) {
        return FALSE;
    }
    tmp = node->mapMarkings.words[index1];
    node->mapMarkings.words[index1] = node->mapMarkings.words[index2];
    node->mapMarkings.words[index2] = tmp;
    return TRUE;
}
