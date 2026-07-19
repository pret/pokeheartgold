#ifndef POKEHEARTGOLD_FIELD_AREA_DATA_H
#define POKEHEARTGOLD_FIELD_AREA_DATA_H

#include "filesystem.h"

typedef struct AreaDataManager AreaDataManager;

AreaDataManager *AreaDataManager_Alloc(u8 areaDataBank);
NARC *ov01_021FB904(AreaDataManager *areaDataManager);
NNSG3dResFileHeader **AreaDataManager_GetMapPropModelFile(AreaDataManager *areaDataManager);
void AreaDataManager_Free(AreaDataManager **areaDataManager);
NNSG3dResTex *AreaDataManager_GetMapTexture(AreaDataManager *areaDataManager);
u32 AreaDataManager_GetAreaLightArchiveID(AreaDataManager *areaDataManager);
// FieldSystemUnkSub54 is void for now until dependencies are resolved
void AreaDataManager_Load(AreaDataManager *areaDataManager, void *unkC0, void *unk54, void *unkCC, void *unk104);

#endif // POKEHEARTGOLD_FIELD_AREA_DATA_H
