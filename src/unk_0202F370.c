#include "unk_0202F370.h"

#include "constants/easy_chat.h"
#include "constants/maps.h"

static BOOL MapMarkingsSave_MapIDisValid(MapMarkingsSave *unk);
static void MapMarkingsSave_Reset(MapMarkingsSave *unk);

static BOOL MapMarkingsSave_MapIDisValid(MapMarkingsSave *unk) {
    if (unk->mapID == MAP_EVERYWHERE || unk->mapID >= MAP_ID_MAX) {
        return FALSE;
    } else {
        return TRUE;
    }
}

static void MapMarkingsSave_Reset(MapMarkingsSave *unk) {
    int i;

    unk->mapID = 0;
    unk->icon0 = MAP_MARKING_ICON_NULL;
    unk->icon1 = MAP_MARKING_ICON_NULL;
    unk->icon2 = MAP_MARKING_ICON_NULL;
    unk->icon3 = MAP_MARKING_ICON_NULL;
    for (i = 0; i < 4; i++) {
        unk->words[i] = EC_WORD_NULL;
    }
}

void MapMarkingsRAM_Reset(MapMarkingsRAM *mmRam) {
    int i;

    mmRam->mapID = 0;
    for (i = 0; i < 4; i++) {
        mmRam->icons[i] = MAP_MARKING_ICON_NULL;
        mmRam->words[i] = EC_WORD_NULL;
    }
}

BOOL MapMarkingsRAM_IsInUse_EraseIfNot(MapMarkingsRAM *mmRam) {
    int i;

    for (i = 0; i < 4; i++) {
        if (mmRam->icons[i] != MAP_MARKING_ICON_NULL || mmRam->words[i] != EC_WORD_NULL) {
            return TRUE;
        }
    }

    mmRam->mapID = 0;
    return FALSE;
}

void MapMarkings_CopyRAMtoSave(MapMarkingsRAM *src, MapMarkingsSave *dest) {
    int i;
    dest->mapID = src->mapID;
    // The explicit masks are required to match
    dest->icon0 = src->icons[0] & 0xF;
    dest->icon1 = src->icons[1] & 0xF;
    dest->icon2 = src->icons[2] & 0xF;
    dest->icon3 = src->icons[3] & 0xF;
    for (i = 0; i < 4; i++) {
        dest->words[i] = src->words[i];
    }
}

void MapMarkings_CopySaveToRAM(MapMarkingsSave *src, MapMarkingsRAM *dest) {
    int i;
    dest->mapID = src->mapID;
    dest->icons[0] = src->icon0;
    dest->icons[1] = src->icon1;
    dest->icons[2] = src->icon2;
    dest->icons[3] = src->icon3;
    for (i = 0; i < 4; i++) {
        dest->words[i] = src->words[i];
    }
}

BOOL MapMarkingsSaveArray_EntryIsValid(MapMarkingsSaveArray *list, u8 index) {
    if (index >= 100) {
        return FALSE;
    } else {
        return MapMarkingsSave_MapIDisValid(&list->list[index]);
    }
}

void MapMarkingsSaveArray_ResetEntry(MapMarkingsSaveArray *list, u8 index) {
    if (index < 100) {
        MapMarkingsSave_Reset(&list->list[index]);
    }
}

BOOL MapMarkingsSaveArray_CopyEntryToRAM(MapMarkingsSaveArray *list, MapMarkingsRAM *dest, u8 index) {
    if (index >= 100) {
        MapMarkingsRAM_Reset(dest);
        return FALSE;
    } else {
        MapMarkings_CopySaveToRAM(&list->list[index], dest);
        return MapMarkingsSave_MapIDisValid(&list->list[index]);
    }
}

BOOL MapMarkingsSaveArray_CopyEntryFromRAM(MapMarkingsSaveArray *list, MapMarkingsRAM *src, u8 index, BOOL noCheck) {
    if (index >= 100) {
        return FALSE;
    }
    if (!noCheck) {
        if (MapMarkingsSave_MapIDisValid(&list->list[index]) == TRUE) {
            return FALSE;
        }
    }
    MapMarkings_CopyRAMtoSave(src, &list->list[index]);
    return TRUE;
}
