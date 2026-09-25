#ifndef POKEHEARTGOLD_FIELD_AREA_LIGHT_H
#define POKEHEARTGOLD_FIELD_AREA_LIGHT_H

#include "field/model_attributes.h"

typedef struct AreaLightManager AreaLightManager;

AreaLightManager *AreaLightManager_New(ModelAttributes *areaModelAttributes, const u32 archiveID);
void AreaLightManager_Free(AreaLightManager **areaLightManager);
void AreaLightManager_UpdateActiveTemplate(AreaLightManager *areaLightManager);

#endif // POKEHEARTGOLD_FIELD_AREA_LIGHT_H
