#include "global.h"

#include "field/map_load_manager.h"
#include "field/map_prop.h"
#include "field/overlay_01_021EA6C4.h"

#include "field_system.h"
#include "gf_3d_render.h"
#include "unk_0201F990.h"
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
    int buildModel;
    BOOL unk_04;
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

    mapProp->buildModel = 0;
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

    mapProp->buildModel = 0;
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
            mapProp->buildModel = narcData[i].unk_00;
            mapProp->unk_04 = 1;
            mapProp->unk_0C = 0;
            mapProp->unk_14 = narcData[i].unk_04;
            mapProp->unk_20 = narcData[i].unk_10;
            mapProp->unk_2C = narcData[i].unk_1C;
            if (!ov01_02204154(mapPropManager->fsys_unkC0, mapProp->buildModel)) {
                mapProp->buildModel = 0;
            }
            mapProp->unk_10 = ov01_022040F8(mapPropManager->fsys_unkC0, mapProp->buildModel);
        } else {
            VecFx32 sp8 = { 0, 0, 0 };
            mapProp->buildModel = 0;
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

void ov01_021F3834(NARC *a0, MapPropManager *mapPropManager, int a2, const SAFARIZONE_AREA *safariArea, u16 *a4, BOOL gender) {
#pragma unused(a0)
#pragma unused(a2)

    u32 sp10 = safariArea->active_object_count;
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
            mapProp->buildModel = 0;
            mapProp->unk_04 = 0;
            mapProp->unk_0C = 0;
            mapProp->unk_14 = sp24;
            mapProp->unk_20 = sp24;
            mapProp->unk_2C = sp18;
        } else {
            SafariObjectConfig objectConfig;
            GetSafariObjectConfig(&objectConfig, safariArea->objects[i].id, gender);
            mapProp->buildModel = objectConfig.buildModel;
            s16 x = 16 * safariArea->objects[i].x + 8 * objectConfig.width;
            s16 y = safariArea->objects[i].y;
            s16 z = 16 * safariArea->objects[i].z + 8 * (2 - objectConfig.height);
            mapProp->unk_14.x = FX32_CONST(x - 0x100);
            mapProp->unk_14.y = FX32_CONST(y);
            mapProp->unk_14.z = FX32_CONST(z - 0x100);
            mapProp->unk_20 = sp24;
            mapProp->unk_2C = sp18;
            mapProp->unk_04 = 1;
            mapProp->unk_0C = 0;
            for (int j = safariArea->objects[i].z; j > safariArea->objects[i].z - objectConfig.height; --j) {
                for (int k = safariArea->objects[i].x; k < safariArea->objects[i].x + objectConfig.width; ++k) {
                    a4[j * 32 + k] = 0x8023;
                }
            }
            if (!ov01_02204154(mapPropManager->fsys_unkC0, mapProp->buildModel)) {
                mapProp->buildModel = 0;
            }
            mapProp->unk_10 = ov01_022040F8(mapPropManager->fsys_unkC0, mapProp->buildModel);
        }
    }
}

void ov01_021F3A3C(const VecFx32 *a0, AreaDataManager *a1, BOOL a2, ModelAttributes *a3, MapPropManager *a4) {
    VecFx32 sp3C;
    extern const MtxFx33 ov01_02206A90;
    MtxFx33 sp18 = ov01_02206A90;

    for (int i = 0; i < MAP_PROP_MAX; ++i) {
        MapProp *r5 = &a4->mapProps[i];
        if (!r5->unk_04 || r5->unk_08) {
            continue;
        }
        sp3C = r5->unk_14;
        sp3C.x += a0->x;
        sp3C.z += a0->z;
        if (!sub_0201F990(r5->unk_10->model, &sp3C, &sp18, &r5->unk_2C)) {
            continue;
        }
        AreaDataManager_Sub8AC *r4 = ov01_021FB9F4(a1);
        if (a2 == TRUE) {
            ov01_021EA9B0(a3, r5->unk_10->model, 0xF33);
        }
        u16 sp14;
        ov01_021EA7F8(r5->buildModel, r4, &sp14);
        if (sp14 == 0) {
            GF3dRender_DrawModel(&r5->unk_10->renderObj, &sp3C, &sp18, &r5->unk_2C);
        } else {
            ov01_021F3B84(r5->unk_10->model, &sp3C, &sp18, &r5->unk_2C, r4, r5->buildModel);
        }
    }
}

VecFx32 *ov01_021F3B04(MapProp *mapProp) {
    return &mapProp->unk_2C;
}

VecFx32 *ov01_021F3B08(MapProp *mapProp) {
    return &mapProp->unk_20;
}

void ov01_021F3B0C(VecFx32 *vec, MapProp *mapProp) {
    *vec = mapProp->unk_14;
}

void ov01_021F3B1C(MapProp *mapProp, VecFx32 *vec) {
    mapProp->unk_14 = *vec;
}

void ov01_021F3B2C(MapProp *mapProp, int a1) {
    mapProp->unk_08 = a1;
}

BOOL ov01_021F3B30(MapProp *mapProp) {
    return mapProp->unk_04;
}

int ov01_021F3B34(MapProp *mapProp) {
    return mapProp->buildModel;
}

UnkStruct_FieldSysC0_SubC *ov01_021F3B38(MapProp *mapProp) {
    return mapProp->unk_10;
}

NNSG3dResMdl *ov01_021F3B3C(MapProp *mapProp) {
    return mapProp->unk_10->model;
}

MapProp *ov01_021F3B44(MapPropManager *mapPropManager, u8 index) {
    return &mapPropManager->mapProps[index];
}

MapProp *ov01_021F3B4C(MapPropManager *mapPropManager, int buildModel) {
    for (int i = 0; i < MAP_PROP_MAX; ++i) {
        MapProp *mapProp = &mapPropManager->mapProps[i];
        if (mapProp->buildModel == buildModel) {
            return mapProp;
        }
    }

    return NULL;
}

MapProp *ov01_021F3B60(MapPropManager *mapPropManager, int index) {
    GF_ASSERT(index < MAP_PROP_MAX);
    MapProp *ret = &mapPropManager->mapProps[index];
    GF_ASSERT(ret->unk_04 != 0);
    return ret;
}

void ov01_021F3B84(const NNSG3dResMdl *model, const VecFx32 *baseTrans, const MtxFx33 *prmBaseRot, const VecFx32 *baseScale, AreaDataManager_Sub8AC *a4, int a5) {
    NNS_G3dGlbSetBaseTrans(baseTrans);
    NNS_G3dGlbSetBaseRot(prmBaseRot);
    NNS_G3dGlbSetBaseScale(baseScale);
    NNS_G3dGlbFlush();

    u16 sp2;
    u16 sp0;
    ov01_021EA804(a5, a4, &sp2, &sp0);
    u16 *r6 = ov01_021EA81C(sp0, a4);
    u8 r4;
    u8 r5 = 0xFF;
    for (r4 = 0; r4 < sp2; ++r4) {
        BOOL r3;
        if (r5 != r6[r4 * 2]) {
            r5 = r6[r4 * 2];
            r3 = TRUE;
        } else {
            r3 = FALSE;
        }
        NNS_G3dDraw1Mat1Shp(model, r5, r6[r4 * 2 + 1], r3);
    }
}
