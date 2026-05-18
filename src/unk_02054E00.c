#include "unk_02054E00.h"

// functions still in asm:
void ov01_021F630C(int, FieldSystemUnkSub2C*, s32*);
int ov01_021F3B44(int, u8);
int ov01_021F3B30();
int ov01_021F3B34(int);
void ov01_021F3B2C(int, int);

BOOL MapModel_IsHeadbuttTree(u32 mapModelNo) {
    if (mapModelNo == 0xd0) {
        return TRUE;
    } 
    return FALSE;
}

u16 MapCoordToMatrixIndex(FieldSystem* fieldSystem, int coordX, int coordY) {
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
    int val;
    for (u8 i = 0; i < 4; i++) {
        ov01_021F630C(i, fieldSystem->unk2C, &val);
        if (val != 0) {
            for (u8 j = 0; j < 32; j++) {
                int res = ov01_021F3B44(val, j);
                if (ov01_021F3B30() != 0) {
                    int res2 = ov01_021F3B34(res);
                    if (res2 == a1) {
                        ov01_021F3B2C(res, a2);
                    }
                }
            }
        }
    }
}
