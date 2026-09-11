#include "global.h"

#include "field/map_load_manager.h"
#include "field/map_prop.h"
#include "field/overlay_01_021EA6C4.h"

#include "field_system.h"
#include "gf_3d_render.h"
#include "unk_0201F990.h"
#include "unk_02020B8C.h"
#include "unk_02097268.h"

typedef struct MapPropArcData {
    int unk_00;
    VecFx32 translation;
    VecFx32 rotation;
    VecFx32 scale;
    u8 padding[8];
} MapPropArcData; // size: 0x30

struct MapProp {
    int buildModel;
    BOOL active;
    BOOL culled;
    BOOL overrideRotation;
    UnkStruct_FieldSysC0_SubC *render;
    VecFx32 translation;
    VecFx32 rotation;
    VecFx32 scale;
}; // size: 0x38

struct MapPropManager {
    MapProp mapProps[MAP_PROP_MAX];
    UnkStruct_FieldSysC0 *fsys_unkC0;
}; // size: 0x704

static void MapPropManager_Init(MapPropManager *mapPropManager, void *unkC0);
static void MapProp_Init(MapProp *mapProp);
static void DrawModelShapewise(const NNSG3dResMdl *mapPropManager, const VecFx32 *baseTrans, const MtxFx33 *prmBaseRot, const VecFx32 *baseScale, AreaDataManager_Sub8AC *a4, int a5);

static void MapPropManager_Init(MapPropManager *mapPropManager, void *unkC0) {
    mapPropManager->fsys_unkC0 = unkC0;
    for (u8 i = 0; i < MAP_PROP_MAX; ++i) {
        MapProp *mapProp = &mapPropManager->mapProps[i];
        MapProp_Init(mapProp);
        mapProp->render = NULL;
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
    VecFx32 zero = { 0, 0, 0 };

    mapProp->buildModel = 0;
    mapProp->active = FALSE;
    mapProp->culled = FALSE;
    mapProp->overrideRotation = FALSE;
    mapProp->translation = zero;
    mapProp->rotation = zero;
    mapProp->scale = zero;
}

void MapPropManager_Reset(MapPropManager *mapPropManager) {
    for (u8 i = 0; i < MAP_PROP_MAX; ++i) {
        MapProp *mapProp = &mapPropManager->mapProps[i];
        MapProp_Init(mapProp);
        ov01_0220411C(mapPropManager->fsys_unkC0, mapProp->render);
        mapProp->render = NULL;
    }
}

void MapPropManager_RemoveMapPropByIndex(int modelID, MapPropManager *mapPropManager) {
    GF_ASSERT(modelID < MAP_PROP_MAX);
    VecFx32 zero = { 0, 0, 0 };
    MapProp *mapProp = &mapPropManager->mapProps[modelID];

    mapProp->buildModel = 0;
    mapProp->active = FALSE;
    mapProp->culled = FALSE;
    mapProp->overrideRotation = FALSE;
    mapProp->translation = zero;
    mapProp->rotation = zero;
    mapProp->scale = zero;

    ov01_0220411C(mapPropManager->fsys_unkC0, mapPropManager->mapProps[modelID].render);
    mapPropManager->mapProps[modelID].render = NULL;
}

// NARC_a_0_6_5
void MapPropManager_LoadFromNARC(NARC *narc, u32 size, MapPropManager *mapPropManager, int a3) {
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
            mapProp->active = TRUE;
            mapProp->overrideRotation = FALSE;
            mapProp->translation = narcData[i].translation;
            mapProp->rotation = narcData[i].rotation;
            mapProp->scale = narcData[i].scale;
            if (!ov01_02204154(mapPropManager->fsys_unkC0, mapProp->buildModel)) {
                mapProp->buildModel = 0;
            }
            mapProp->render = ov01_022040F8(mapPropManager->fsys_unkC0, mapProp->buildModel);
        } else {
            VecFx32 zero = { 0, 0, 0 };
            mapProp->buildModel = 0;
            mapProp->active = FALSE;
            mapProp->overrideRotation = FALSE;
            mapProp->translation = zero;
            mapProp->rotation = zero;
            mapProp->scale = zero;
        }
    }
    if (narcData != NULL) {
        Heap_Free(narcData);
    }
}

void MapPropManager_LoadFromSafariZone(NARC *a0, MapPropManager *mapPropManager, int a2, const SAFARIZONE_AREA *safariArea, u16 *a4, BOOL gender) {
    u32 numSafariObjects = safariArea->active_object_count;
    if (numSafariObjects > SAFARI_ZONE_MAX_OBJECTS) {
        GF_ASSERT(FALSE);
        numSafariObjects = 0;
    }

    for (int i = 0; i < MAP_PROP_MAX; ++i) {
        VecFx32 rotation = { 0, 0, 0 };
        VecFx32 scale = { FX32_ONE, FX32_ONE, FX32_ONE };
        MapProp *mapProp = &mapPropManager->mapProps[i];

        if (i >= numSafariObjects) {
            mapProp->buildModel = 0;
            mapProp->active = FALSE;
            mapProp->overrideRotation = FALSE;
            mapProp->translation = rotation;
            mapProp->rotation = rotation;
            mapProp->scale = scale;
        } else {
            SafariObjectConfig objectConfig;
            GetSafariObjectConfig(&objectConfig, safariArea->objects[i].id, gender);
            mapProp->buildModel = objectConfig.buildModel;
            s16 x = 16 * safariArea->objects[i].x + 8 * objectConfig.width;
            s16 y = safariArea->objects[i].y;
            s16 z = 16 * safariArea->objects[i].z + 8 * (2 - objectConfig.height);
            mapProp->translation.x = FX32_CONST(x - 0x100);
            mapProp->translation.y = FX32_CONST(y);
            mapProp->translation.z = FX32_CONST(z - 0x100);
            mapProp->rotation = rotation;
            mapProp->scale = scale;
            mapProp->active = TRUE;
            mapProp->overrideRotation = FALSE;
            for (int j = safariArea->objects[i].z; j > safariArea->objects[i].z - objectConfig.height; --j) {
                for (int k = safariArea->objects[i].x; k < safariArea->objects[i].x + objectConfig.width; ++k) {
                    a4[j * 32 + k] = 0x8023;
                }
            }
            if (!ov01_02204154(mapPropManager->fsys_unkC0, mapProp->buildModel)) {
                mapProp->buildModel = 0;
            }
            mapProp->render = ov01_022040F8(mapPropManager->fsys_unkC0, mapProp->buildModel);
        }
    }
}

void ov01_021F3A3C(const VecFx32 *position, AreaDataManager *areaDataManager, BOOL a2, ModelAttributes *modelAttributes, MapPropManager *mapPropManager) {
    VecFx32 translation;
    MtxFx33 rotation = { FX32_ONE, 0, 0, 0, FX32_ONE, 0, 0, 0, FX32_ONE };

    for (int i = 0; i < MAP_PROP_MAX; ++i) {
        MapProp *mapProp = &mapPropManager->mapProps[i];
        if (!mapProp->active || mapProp->culled) {
            continue;
        }
        translation = mapProp->translation;
        translation.x += position->x;
        translation.z += position->z;
        if (!sub_0201F990(mapProp->render->model, &translation, &rotation, &mapProp->scale)) {
            continue;
        }
        AreaDataManager_Sub8AC *r4 = ov01_021FB9F4(areaDataManager);
        if (a2 == TRUE) {
            ov01_021EA9B0(modelAttributes, mapProp->render->model, 0xF33);
        }
        u16 sp14;
        ov01_021EA7F8(mapProp->buildModel, r4, &sp14);
        if (sp14 == 0) {
            GF3dRender_DrawModel(&mapProp->render->renderObj, &translation, &rotation, &mapProp->scale);
        } else {
            DrawModelShapewise(mapProp->render->model, &translation, &rotation, &mapProp->scale, r4, mapProp->buildModel);
        }
    }
}

VecFx32 *MapProp_GetScale(MapProp *mapProp) {
    return &mapProp->scale;
}

VecFx32 *MapProp_GetRotation(MapProp *mapProp) {
    return &mapProp->rotation;
}

void MapProp_GetTranslation(VecFx32 *translation, MapProp *mapProp) {
    *translation = mapProp->translation;
}

void MapProp_SetTranslation(MapProp *mapProp, VecFx32 *translation) {
    mapProp->translation = *translation;
}

void MapProp_SetCulled(MapProp *mapProp, BOOL culled) {
    mapProp->culled = culled;
}

BOOL MapProp_IsActive(MapProp *mapProp) {
    return mapProp->active;
}

int MapProp_GetBuildModel(MapProp *mapProp) {
    return mapProp->buildModel;
}

UnkStruct_FieldSysC0_SubC *MapProp_GetRenderSurface(MapProp *mapProp) {
    return mapProp->render;
}

NNSG3dResMdl *MapProp_GetResModel(MapProp *mapProp) {
    return mapProp->render->model;
}

MapProp *MapPropManager_GetMapPropByIndex(MapPropManager *mapPropManager, u8 index) {
    return &mapPropManager->mapProps[index];
}

MapProp *MapPropManager_FindMapPropByBuildModel(MapPropManager *mapPropManager, int buildModel) {
    for (int i = 0; i < MAP_PROP_MAX; ++i) {
        MapProp *mapProp = &mapPropManager->mapProps[i];
        if (mapProp->buildModel == buildModel) {
            return mapProp;
        }
    }

    return NULL;
}

MapProp *MapPropManager_GetMapPropByIndex_Checked_RequireActive(MapPropManager *mapPropManager, int index) {
    GF_ASSERT(index < MAP_PROP_MAX);
    MapProp *ret = &mapPropManager->mapProps[index];
    GF_ASSERT(ret->active);
    return ret;
}

static void DrawModelShapewise(const NNSG3dResMdl *model, const VecFx32 *baseTrans, const MtxFx33 *prmBaseRot, const VecFx32 *baseScale, AreaDataManager_Sub8AC *a4, int buildModel) {
    NNS_G3dGlbSetBaseTrans(baseTrans);
    NNS_G3dGlbSetBaseRot(prmBaseRot);
    NNS_G3dGlbSetBaseScale(baseScale);
    NNS_G3dGlbFlush();

    u16 num;
    u16 sp0;
    ov01_021EA804(buildModel, a4, &num, &sp0);
    u16(*shpDat)[2] = ov01_021EA81C(sp0, a4);
    u8 i;
    u8 matID = 0xFF;
    for (i = 0; i < num; ++i) {
        BOOL sendMat;
        if (matID != shpDat[i][0]) {
            matID = shpDat[i][0];
            sendMat = TRUE;
        } else {
            sendMat = FALSE;
        }
        NNS_G3dDraw1Mat1Shp(model, matID, shpDat[i][1], sendMat);
    }
}

u8 MapPropManager_LoadOne(MapPropManager *mapPropManager, int modelID, const VecFx32 *position, const VecFx32 *rotation, MapPropAnimationManager *mapPropAnimationManager) {
    VecFx32 scale = { FX32_ONE, FX32_ONE, FX32_ONE };

    for (u8 i = 0; i < MAP_PROP_MAX; ++i) {
        MapProp *mapProp = &mapPropManager->mapProps[i];
        if (mapProp->active) {
            continue;
        }
        mapProp->active = TRUE;
        mapProp->translation = *position;
        if (rotation != NULL) {
            mapProp->overrideRotation = TRUE;
            mapProp->rotation = *rotation;
        } else {
            mapProp->overrideRotation = FALSE;
        }
        mapProp->scale = scale;
        mapProp->buildModel = modelID;
        mapProp->render = ov01_022040F8(mapPropManager->fsys_unkC0, modelID);
        return i;
    }

    GF_ASSERT(FALSE);
    return MAP_PROP_MAX;
}

void ov01_021F3C9C(MapPropManager *mapPropManager, AreaDataManager *areaDataManager) {
    MtxFx33 baseRot = { FX32_ONE, 0, 0, 0, FX32_ONE, 0, 0, 0, FX32_ONE };

    for (u8 i = 0; i < MAP_PROP_MAX; ++i) {
        MapProp *mapProp = &mapPropManager->mapProps[i];
        if (!mapProp->active || mapProp->culled) {
            continue;
        }
        AreaDataManager_Sub8AC *r6 = ov01_021FB9F4(areaDataManager);
        u16 sp10;
        ov01_021EA7F8(mapProp->buildModel, r6, &sp10);
        if (mapProp->overrideRotation) {
            sub_02020D2C(&baseRot, &mapProp->rotation);
        }
        if (sp10 == 0) {
            GF3dRender_DrawModel(&mapProp->render->renderObj, &mapProp->translation, &baseRot, &mapProp->scale);
        } else {
            DrawModelShapewise(mapProp->render->model, &mapProp->translation, &baseRot, &mapProp->scale, r6, mapProp->buildModel);
        }
    }
}
