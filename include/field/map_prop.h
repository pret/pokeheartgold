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
void ov01_021F36AC(MapPropManager *mapPropManager);
void ov01_021F36DC(int modelID, MapPropManager *mapPropManager);
void ov01_021F3744(NARC *narc, u32 size, MapPropManager *mapPropManager, int a3);
void ov01_021F3834(NARC *a0, MapPropManager *mapPropManager, int a2, const SAFARIZONE_AREA *safariArea, u16 *a4, BOOL gender);
void ov01_021F3A3C(const VecFx32 *a0, AreaDataManager *a1, BOOL a2, ModelAttributes *a3, MapPropManager *a4);
VecFx32 *ov01_021F3B04(MapProp *mapProp);
VecFx32 *ov01_021F3B08(MapProp *mapProp);
void ov01_021F3B0C(VecFx32 *vec, MapProp *mapProp);
void ov01_021F3B1C(MapProp *mapProp, VecFx32 *vec);
void ov01_021F3B2C(MapProp *mapProp, int a1);
BOOL ov01_021F3B30(MapProp *mapProp);
int ov01_021F3B34(MapProp *mapProp);
UnkStruct_FieldSysC0_SubC *ov01_021F3B38(MapProp *mapProp);
NNSG3dResMdl *ov01_021F3B3C(MapProp *mapProp);
MapProp *ov01_021F3B44(MapPropManager *mapPropManager, u8 index);
MapProp *ov01_021F3B4C(MapPropManager *mapPropManager, int buildModel);
MapProp *ov01_021F3B60(MapPropManager *mapPropManager, int index);
void ov01_021F3B84(const NNSG3dResMdl *mapPropManager, const VecFx32 *baseTrans, const MtxFx33 *prmBaseRot, const VecFx32 *baseScale, AreaDataManager_Sub8AC *a4, int a5);
void MapPropManager_LoadOne(MapPropManager *mapPropManager, int modelID, const VecFx32 *position, const VecFx32 *rotation, MapPropAnimationManager *mapPropAnimationManager);
void ov01_021F3C9C(MapPropManager *mapPropManager, AreaDataManager *areaDataManager);

#endif // POKEHEARTGOLD_FIELD_MAP_PROP_H
