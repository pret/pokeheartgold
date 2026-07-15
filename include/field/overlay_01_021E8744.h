#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_021E8744_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_021E8744_H

#include <nnsys.h>
#include "field_system.h"

typedef struct UnkStruct_FieldSysC0_SubC {
    NNSG3dRenderObj renderObj;
    NNSG3dResMdl *model;
    NNSG3dResFileHeader *resFileHeader;
} UnkStruct_FieldSysC0_SubC;

void ov01_021E8970(int modelNum, int animNum, int a2, UnkStruct_FieldSysC0_SubC *renderObj, FieldSystemUnkSub54 *fsysUnk54);
FieldSystemUnkSub54 *ov01_021E8B04(int modelNum, int animNum, FieldSystemUnkSub54 *fsysUnk54);
void ov01_021E8B84(FieldSystemUnkSub54 *anim, int a1);
void ov01_021E8B6C(FieldSystemUnkSub54 *anim);
BOOL ov01_021E8B90(FieldSystemUnkSub54 *anim);
void ov01_021E8A8C(FieldSystemUnkSub54 *anim, UnkStruct_FieldSysC0_SubC *renderObj, int modelNum, int animNum);

#endif // POKEHEARTGOLD_FIELD_OVERLAY_01_021E8744_H
