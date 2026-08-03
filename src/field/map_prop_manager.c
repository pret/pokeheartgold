#include "global.h"

#include "field/map_prop.h"

#include "field_system.h"

#define MAP_PROP_MAX 32

struct MapProp {
    int unk_00;
    int unk_04;
    int unk_08;
    int unk_0C;
    int unk_10;
    VecFx32 unk_14;
    VecFx32 unk_20;
    VecFx32 unk_2C;
}; // size: 0x38

struct MapPropManager {
    MapProp mapProps[MAP_PROP_MAX];
    void *unkC0;
}; // size: 0x704

static void MapPropManager_Init(MapPropManager *mapPropManager, void *unkC0);
void MapProp_Init(MapProp *mapProp);

static void MapPropManager_Init(MapPropManager *mapPropManager, void *unkC0) {
    mapPropManager->unkC0 = unkC0;
    for (u8 i = 0; i < MAP_PROP_MAX; ++i) {
        MapProp *mapProp = &mapPropManager->mapProps[i];
        MapProp_Init(mapProp);
        mapProp->unk_10 = 0;
    }
}

MapPropManager *MapPropManager_New(enum HeapID heapID, void *unkC0) {
    MapPropManager *ret = Heap_Alloc(heapID, sizeof(MapPropManager));
    MI_CpuClearFast(ret, sizeof(MapPropManager));
    MapPropManager_Init(ret, unkC0);
    return ret;
}

void MapPropManager_Free(MapPropManager *mapPropManager) {
    Heap_Free(mapPropManager);
}

void MapProp_Init(MapProp *mapProp) {
    VecFx32 sp0 = { 0, 0, 0 };

    mapProp->unk_00 = 0;
    mapProp->unk_04 = 0;
    mapProp->unk_08 = 0;
    mapProp->unk_0C = 0;
    mapProp->unk_14 = sp0;
    mapProp->unk_20 = sp0;
    mapProp->unk_2C = sp0;
}
