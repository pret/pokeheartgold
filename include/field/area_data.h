#ifndef POKEHEARTGOLD_FIELD_AREA_DATA_H
#define POKEHEARTGOLD_FIELD_AREA_DATA_H

#include "field/map_prop_animation.h"

#include "filesystem.h"

typedef struct AreaDataManager_Sub8AC AreaDataManager_Sub8AC;
typedef struct AreaDataManager AreaDataManager;

AreaDataManager *AreaDataManager_Alloc(u8 areaDataBank);
NARC *ov01_021FB904(AreaDataManager *areaDataManager);
NNSG3dResFileHeader **AreaDataManager_GetMapPropModelFile(AreaDataManager *areaDataManager);
void AreaDataManager_Free(AreaDataManager **areaDataManager);
NNSG3dResTex *AreaDataManager_GetMapTexture(AreaDataManager *areaDataManager);
u32 AreaDataManager_GetAreaLightArchiveID(AreaDataManager *areaDataManager);
AreaDataManager_Sub8AC *ov01_021FB9F4(AreaDataManager *areaDataManager);
void AreaDataManager_Load(AreaDataManager *areaDataManager, void *unkC0, MapPropAnimationManager *mapPropAnimationManager, void *unkCC, void *unk104);

#endif // POKEHEARTGOLD_FIELD_AREA_DATA_H
