#include "global.h"

#include "field/map_load_manager.h"
#include "field/map_prop.h"

#include "field_system.h"
#include "unk_02097268.h"

#define MAP_PROP_MAX 32

typedef struct MapPropArcData {
    int unk_00;
    VecFx32 unk_04;
    VecFx32 unk_10;
    VecFx32 unk_1C;
    u8 padding[8];
} MapPropArcData; // size: 0x30

struct MapProp {
    int unk_00;
    int unk_04;
    int unk_08;
    int unk_0C;
    UnkStruct_FieldSysC0_SubC *unk_10;
    VecFx32 unk_14;
    VecFx32 unk_20;
    VecFx32 unk_2C;
}; // size: 0x38

struct MapPropManager {
    MapProp mapProps[MAP_PROP_MAX];
    UnkStruct_FieldSysC0 *fsys_unkC0;
}; // size: 0x704

static void MapPropManager_Init(MapPropManager *mapPropManager, void *unkC0);
static void MapProp_Init(MapProp *mapProp);

static void MapPropManager_Init(MapPropManager *mapPropManager, void *unkC0) {
    mapPropManager->fsys_unkC0 = unkC0;
    for (u8 i = 0; i < MAP_PROP_MAX; ++i) {
        MapProp *mapProp = &mapPropManager->mapProps[i];
        MapProp_Init(mapProp);
        mapProp->unk_10 = NULL;
    }
}

MapPropManager *MapPropManager_New(enum HeapID heapID, UnkStruct_FieldSysC0 *unkC0) {
    MapPropManager *ret = Heap_Alloc(heapID, sizeof(MapPropManager));
    MI_CpuClearFast(ret, sizeof(MapPropManager));
    MapPropManager_Init(ret, unkC0);
    return ret;
}

void MapPropManager_Free(MapPropManager *mapPropManager) {
    Heap_Free(mapPropManager);
}

static void MapProp_Init(MapProp *mapProp) {
    VecFx32 sp0 = { 0, 0, 0 };

    mapProp->unk_00 = 0;
    mapProp->unk_04 = 0;
    mapProp->unk_08 = 0;
    mapProp->unk_0C = 0;
    mapProp->unk_14 = sp0;
    mapProp->unk_20 = sp0;
    mapProp->unk_2C = sp0;
}

void ov01_021F36AC(MapPropManager *mapPropManager) {
    for (u8 i = 0; i < MAP_PROP_MAX; ++i) {
        MapProp *mapProp = &mapPropManager->mapProps[i];
        MapProp_Init(mapProp);
        ov01_0220411C(mapPropManager->fsys_unkC0, mapProp->unk_10);
        mapProp->unk_10 = NULL;
    }
}

void ov01_021F36DC(int modelID, MapPropManager *mapPropManager) {
    GF_ASSERT(modelID < MAP_PROP_MAX);
    VecFx32 sp0 = { 0, 0, 0 };
    MapProp *mapProp = &mapPropManager->mapProps[modelID];

    mapProp->unk_00 = 0;
    mapProp->unk_04 = 0;
    mapProp->unk_08 = 0;
    mapProp->unk_0C = 0;
    mapProp->unk_14 = sp0;
    mapProp->unk_20 = sp0;
    mapProp->unk_2C = sp0;

    ov01_0220411C(mapPropManager->fsys_unkC0, mapPropManager->mapProps[modelID].unk_10);
    mapPropManager->mapProps[modelID].unk_10 = NULL;
}

// NARC_a_0_6_5
void ov01_021F3744(NARC *narc, u32 size, MapPropManager *mapPropManager, int a3) {
#pragma unused(a3)
    MapPropArcData *narcData = NULL;
    u32 num;

    if (size != 0) {
        narcData = Heap_AllocAtEnd(HEAP_ID_FIELD1, size);
        NARC_ReadFile(narc, size, narcData);
        num = size / sizeof(MapPropArcData);
    } else {
        num = 0;
    }

    for (int i = 0; i < MAP_PROP_MAX; ++i) {
        MapProp *mapProp = &mapPropManager->mapProps[i];
        if (i < num) {
            mapProp->unk_00 = narcData[i].unk_00;
            mapProp->unk_04 = 1;
            mapProp->unk_0C = 0;
            mapProp->unk_14 = narcData[i].unk_04;
            mapProp->unk_20 = narcData[i].unk_10;
            mapProp->unk_2C = narcData[i].unk_1C;
            if (!ov01_02204154(mapPropManager->fsys_unkC0, mapProp->unk_00)) {
                mapProp->unk_00 = 0;
            }
            mapProp->unk_10 = ov01_022040F8(mapPropManager->fsys_unkC0, mapProp->unk_00);
        } else {
            VecFx32 sp8 = { 0, 0, 0 };
            mapProp->unk_00 = 0;
            mapProp->unk_04 = 0;
            mapProp->unk_0C = 0;
            mapProp->unk_14 = sp8;
            mapProp->unk_20 = sp8;
            mapProp->unk_2C = sp8;
        }
    }
    if (narcData != NULL) {
        Heap_Free(narcData);
    }
}

void ov01_021F3834(int a0, MapPropManager *mapPropManager, int a2, const SAFARIZONE_AREA *a3, u16 *a4, BOOL a5) {
#pragma unused(a0)
#pragma unused(a2)

    u32 sp10 = a3->active_object_count;
    if (sp10 > SAFARI_ZONE_MAX_OBJECTS) {
        GF_ASSERT(FALSE);
        sp10 = 0;
    }

    for (int i = 0; i < MAP_PROP_MAX; ++i) {
        VecFx32 sp24 = { 0, 0, 0 };
        extern const VecFx32 ov01_02206A84; // = { FX32_ONE, FX32_ONE, FX32_ONE };
        VecFx32 sp18 = ov01_02206A84;
        MapProp *mapProp = &mapPropManager->mapProps[i];

        if (i >= sp10) {
            mapProp->unk_00 = 0;
            mapProp->unk_04 = 0;
            mapProp->unk_0C = 0;
            mapProp->unk_14 = sp24;
            mapProp->unk_20 = sp24;
            mapProp->unk_2C = sp18;
        } else {
            SafariObjectConfig sp14;
            GetSafariObjectConfig(&sp14, a3->objects[i].unk_0, a5);
            mapProp->unk_00 = sp14.buildModel;
            s16 r1 = 16 * a3->objects[i].unk_1 + 8 * sp14.width;
            s16 r5 = a3->objects[i].unk_2;
            s16 r7 = 16 * a3->objects[i].unk_3 + 8 * (2 - sp14.height);
            mapProp->unk_14.x = FX32_CONST(r1 - 0x100);
            mapProp->unk_14.y = FX32_CONST(r5);
            mapProp->unk_14.z = FX32_CONST(r7 - 0x100);
            mapProp->unk_20 = sp24;
            mapProp->unk_2C = sp18;
            mapProp->unk_04 = 1;
            mapProp->unk_0C = 0;
            for (int j = a3->objects[i].unk_3; j > a3->objects[i].unk_3 - sp14.height; --j) {
                for (int k = a3->objects[i].unk_1; k < a3->objects[i].unk_1 + sp14.width; ++k) {
                    a4[j * 32 + k] = 0x8023;
                }
            }
            if (!ov01_02204154(mapPropManager->fsys_unkC0, mapProp->unk_00)) {
                mapProp->unk_00 = 0;
            }
            mapProp->unk_10 = ov01_022040F8(mapPropManager->fsys_unkC0, mapProp->unk_00);
        }
    }
}
