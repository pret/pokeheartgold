#ifndef POKEHEARTGOLD_FIELD_MAP_PROP_H
#define POKEHEARTGOLD_FIELD_MAP_PROP_H

#include "field/area_data.h"

typedef struct MapPropManager MapPropManager;

MapPropManager *MapPropManager_New(enum HeapID heapID, void *unkC0);
void ov01_021F3660(MapPropManager *mapPropManager);
void MapPropManager_LoadOne(MapPropManager *mapPropManager, int modelID, const VecFx32 *position, const VecFx32 *rotation, MapPropAnimationManager *mapPropAnimationManager);
void ov01_021F3C9C(MapPropManager *mapPropManager, AreaDataManager *areaDataManager);

#endif // POKEHEARTGOLD_FIELD_MAP_PROP_H
