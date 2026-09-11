#include "unk_02054E00.h"

#include "field/map_load_manager.h"
#include "field/map_prop.h"

BOOL MapModel_IsHeadbuttTree(u32 mapModelNo) {
    if (mapModelNo == 0xd0) {
        return TRUE;
    }
    return FALSE;
}

u16 MapCoordToMatrixIndex(FieldSystem *fieldSystem, int coordX, int coordY) {
    if (coordX < 0 || coordY < 0) {
        GF_ASSERT(FALSE);
        return 0;
    }
    int width = MapMatrix_GetWidth(fieldSystem->mapMatrix);
    int height = MapMatrix_GetHeight(fieldSystem->mapMatrix);
    int posX = coordX / 32;
    int posY = coordY / 32;
    if (posX >= width && posY >= height) {
        GF_ASSERT(FALSE);
        return 0;
    }
    return posX + posY * width;
}

void sub_02054EB0(FieldSystem *fieldSystem, int buildModel, BOOL culled) {
    MapPropManager *mapPropManager;
    for (u8 i = 0; i < 4; i++) {
        ov01_021F630C(i, fieldSystem->mapLoadManager, &mapPropManager);
        if (mapPropManager != 0) {
            for (u8 j = 0; j < MAP_PROP_MAX; j++) {
                MapProp *mapProp = MapPropManager_GetMapPropByIndex(mapPropManager, j);
                if (MapProp_IsActive(mapProp)) {
                    int curBuildModel = MapProp_GetBuildModel(mapProp);
                    if (curBuildModel == buildModel) {
                        MapProp_SetCulled(mapProp, culled);
                    }
                }
            }
        }
    }
}
