#ifndef POKEHEARTGOLD_FIELD_MAP_PROP_H
#define POKEHEARTGOLD_FIELD_MAP_PROP_H

#include "field/area_data.h"
#include "field/model_attributes.h"

#include "field_types_def.h"
#include "safari_zone.h"

typedef struct MapPropManager MapPropManager;
typedef struct MapProp MapProp;

MapPropManager *MapPropManager_New(enum HeapID heapID, UnkStruct_FieldSysC0 *unkC0);
void MapPropManager_Free(MapPropManager *mapPropManager);
void MapPropManager_Reset(MapPropManager *mapPropManager);
void MapPropManager_RemoveMapPropByIndex(int modelID, MapPropManager *mapPropManager);
void MapPropManager_LoadFromNARC(NARC *narc, u32 size, MapPropManager *mapPropManager, int a3);
void MapPropManager_LoadFromSafariZone(NARC *a0, MapPropManager *mapPropManager, int a2, const SAFARIZONE_AREA *safariArea, u16 *a4, BOOL gender);
void ov01_021F3A3C(const VecFx32 *position, AreaDataManager *areaDataManager, BOOL a2, ModelAttributes *modelAttributes, MapPropManager *mapPropManager);
VecFx32 *MapProp_GetScale(MapProp *mapProp);
VecFx32 *MapProp_GetRotation(MapProp *mapProp);
void MapProp_GetTranslation(VecFx32 *vec, MapProp *mapProp);
void MapProp_SetTranslation(MapProp *mapProp, VecFx32 *vec);
void MapProp_SetCulled(MapProp *mapProp, BOOL culled);
BOOL MapProp_IsActive(MapProp *mapProp);
int MapProp_GetBuildModel(MapProp *mapProp);
UnkStruct_FieldSysC0_SubC *MapProp_GetRenderSurface(MapProp *mapProp);
NNSG3dResMdl *MapProp_GetResModel(MapProp *mapProp);
MapProp *MapPropManager_GetMapPropByIndex(MapPropManager *mapPropManager, u8 index);
MapProp *MapPropManager_FindMapPropByBuildModel(MapPropManager *mapPropManager, int buildModel);
MapProp *MapPropManager_GetMapPropByIndex_Checked_RequireActive(MapPropManager *mapPropManager, int index);
u8 MapPropManager_LoadOne(MapPropManager *mapPropManager, int modelID, const VecFx32 *position, const VecFx32 *rotation, MapPropAnimationManager *mapPropAnimationManager);
void ov01_021F3C9C(MapPropManager *mapPropManager, AreaDataManager *areaDataManager);

#endif // POKEHEARTGOLD_FIELD_MAP_PROP_H
