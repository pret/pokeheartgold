#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_021E8744_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_021E8744_H

#include <nnsys.h>

typedef struct UnkStruct_ov01_021E8B04 UnkStruct_ov01_021E8B04;

typedef struct UnkStruct_FieldSysC0_SubC {
    NNSG3dRenderObj renderObj;
    NNSG3dResMdl *model;
    NNSG3dResFileHeader *resFileHeader;
} UnkStruct_FieldSysC0_SubC;

void ov01_021E8970(int modelNum, int animNum, int a2, UnkStruct_FieldSysC0_SubC *renderObj, void *fsysUnk54);
UnkStruct_ov01_021E8B04 *ov01_021E8B04(int modelNum, int animNum, void *fsysUnk54);
void ov01_021E8B84(UnkStruct_ov01_021E8B04 *anim, int a1);
void ov01_021E8B6C(UnkStruct_ov01_021E8B04 *anim);
BOOL ov01_021E8B90(UnkStruct_ov01_021E8B04 *anim);
void ov01_021E8A8C(UnkStruct_ov01_021E8B04 *anim, UnkStruct_FieldSysC0_SubC *renderObj, int modelNum, int animNum);

#endif // POKEHEARTGOLD_FIELD_OVERLAY_01_021E8744_H
