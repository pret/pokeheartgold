#ifndef POKEHEARTGOLD_FIELD_MAP_PROP_H
#define POKEHEARTGOLD_FIELD_MAP_PROP_H

#include "field/area_data.h"

typedef struct MapPropManager MapPropManager;
typedef struct MapProp MapProp;

MapPropManager *MapPropManager_New(enum HeapID heapID, UnkStruct_FieldSysC0 *unkC0);
void MapPropManager_Free(MapPropManager *mapPropManager);
void ov01_021F36AC(MapPropManager *mapPropManager);
void ov01_021F36DC(int modelID, MapPropManager *mapPropManager);
void ov01_021F3744(NARC *narc, u32 size, MapPropManager *mapPropManager);
void MapPropManager_LoadOne(MapPropManager *mapPropManager, int modelID, const VecFx32 *position, const VecFx32 *rotation, MapPropAnimationManager *mapPropAnimationManager);
void ov01_021F3C9C(MapPropManager *mapPropManager, AreaDataManager *areaDataManager);
void ov01_021F3B0C(VecFx32 *vec, int);
BOOL ov01_021F3B30();
void ov01_021F3B2C(int, int);
int ov01_021F3B34(int);
int ov01_021F3B44(int, u8 index);

#endif // POKEHEARTGOLD_FIELD_MAP_PROP_H
