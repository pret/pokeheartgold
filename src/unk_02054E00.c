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

void sub_02054EB0(FieldSystem *fieldSystem, int a1, BOOL a2) {
    MapPropManager *val;
    for (u8 i = 0; i < 4; i++) {
        ov01_021F630C(i, fieldSystem->mapLoadManager, &val);
        if (val != 0) {
            for (u8 j = 0; j < 32; j++) {
                MapProp *res = MapPropManager_GetMapPropByIndex(val, j);
                if (MapProp_IsActive(res)) {
                    int res2 = MapProp_GetBuildModel(res);
                    if (res2 == a1) {
                        MapProp_SetCulled(res, a2);
                    }
                }
            }
        }
    }
}
