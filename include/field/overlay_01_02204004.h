#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_02204004_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_02204004_H

#include <nnsys.h>

#include "heap.h"

typedef struct FieldSystemUnkSubCC_Sub0_SubStruct {
    NNSG3dAnmObj *animObj;
    void *res;
    int unk8;
    u32 unkC;
    u32 unk10;
    u32 unk14;
    int unk18;
    u32 unk1C;
} FieldSystemUnkSubCC_Sub0_SubStruct;

typedef struct FieldSystemUnkSubCC_Sub0 FieldSystemUnkSubCC_Sub0;

typedef struct FieldSystemUnkSubCC {
    FieldSystemUnkSubCC_Sub0 *unk0;
    FieldSystemUnkSubCC_Sub0_SubStruct *unk4;
} FieldSystemUnkSubCC;

struct FieldSystemUnkSubCC_Sub0 {
    NNSFndAllocator unk0;
    FieldSystemUnkSubCC_Sub0_SubStruct *unk10;
    FieldSystemUnkSubCC_Sub0_SubStruct **unk14;
    FieldSystemUnkSubCC_Sub0 *next;
    void *unk1C;
    u16 unk20;
    u16 unk22;
};

typedef struct FieldSystemUnkSubC8 {
    FieldSystemUnkSubCC_Sub0 *unk0;
    FieldSystemUnkSubCC_Sub0 *unk4;
    FieldSystemUnkSubCC_Sub0 *unk8;
    int unkC;
} FieldSystemUnkSubC8;

typedef struct UnkStruct_FieldSysC0_SubC {
    NNSG3dRenderObj renderObj;
    NNSG3dResMdl *model;
    int index;
} UnkStruct_FieldSysC0_SubC;

typedef struct UnkStruct_FieldSysC0 {
    u8 *modelNumToLoadedSlot;
    NNSG3dResFileHeader **resFileHeaders;
    UnkStruct_FieldSysC0_SubC *objectHeap;
    UnkStruct_FieldSysC0_SubC **objects;
    int numObjects;
    int indexMax;
    int objectMax;
} UnkStruct_FieldSysC0;

UnkStruct_FieldSysC0 *ov01_02204004(enum HeapID heapID, int indexMax, int objectMax, NNSG3dResFileHeader **fileResHeader); // FieldSysC0_New
void ov01_02204084(UnkStruct_FieldSysC0 *unkC0); // FieldSysC0_Free
UnkStruct_FieldSysC0_SubC *ov01_022040A4(UnkStruct_FieldSysC0 *unkC0, int index);
UnkStruct_FieldSysC0_SubC *Field3dObjectList_GetRenderObjectByID(UnkStruct_FieldSysC0 *unkC0, int index);
UnkStruct_FieldSysC0_SubC *ov01_022040F8(UnkStruct_FieldSysC0 *unkC0, int index);
BOOL ov01_0220411C(UnkStruct_FieldSysC0 *unkC0, UnkStruct_FieldSysC0_SubC *object);
BOOL ov01_02204154(UnkStruct_FieldSysC0 *unkC0, int index);
FieldSystemUnkSubC8 *ov01_022041C4(enum HeapID heapID);
FieldSystemUnkSubCC_Sub0 *ov01_022041D8(FieldSystemUnkSubC8 *unkC8, enum HeapID heapID, u16 count);
void ov01_02204278(FieldSystemUnkSubC8 *unkSubC8); // UnkSubC8_Free
FieldSystemUnkSubCC_Sub0_SubStruct *ov01_022042FC(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0);
void ov01_0220431C(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, FieldSystemUnkSubCC_Sub0_SubStruct *substruct);
void ov01_02204350(FieldSystemUnkSubC8 *unkSubC8);
void ov01_022043D8(FieldSystemUnkSubC8 *unkSubC8);
void ov01_02204424(FieldSystemUnkSubC8 *unkSubC8);
void ov01_02204470(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, FieldSystemUnkSubCC_Sub0_SubStruct *substruct, void *res, NNSG3dResMdl *model, NNSG3dResTex *texture);
void ov01_022044C8(FieldSystemUnkSubCC_Sub0_SubStruct *substruct, int unk8, int unkC, int unk10);
void ov01_022044E0(FieldSystemUnkSubCC_Sub0_SubStruct *substruct);
void ov01_02204500(FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, FieldSystemUnkSubCC_Sub0_SubStruct *substruct);
void ov01_0220450C(UnkStruct_FieldSysC0_SubC *unkC0_SubC, FieldSystemUnkSubCC_Sub0_SubStruct *substruct);
BOOL ov01_02204518(UnkStruct_FieldSysC0_SubC *unkC0_SubC, FieldSystemUnkSubCC_Sub0_SubStruct *substruct);
u16 ov01_02204554(FieldSystemUnkSubCC_Sub0_SubStruct *substruct);
void ov01_0220455C(FieldSystemUnkSubCC_Sub0_SubStruct *substruct, int unkC);
BOOL ov01_02204560(FieldSystemUnkSubCC_Sub0_SubStruct *substruct);
void ov01_02204570(FieldSystemUnkSubCC_Sub0_SubStruct *substruct);
void ov01_02204590(FieldSystemUnkSubCC_Sub0_SubStruct *substruct, int unk8);
FieldSystemUnkSubCC *ov01_0220460C(FieldSystemUnkSubC8 *unkSubC8); // UnkCC_Init
void ov01_02204634(FieldSystemUnkSubCC *unkCC); // UnkCC_Free
void ov01_0220463C(FieldSystemUnkSubCC *unkCC, int fileID); // UnkCC_Load
void ov01_02204678(FieldSystemUnkSubCC *unkCC, UnkStruct_FieldSysC0_SubC *unkC0_SubC);
void ov01_02204688(FieldSystemUnkSubCC *unkCC, UnkStruct_FieldSysC0_SubC *unkC0_SubC);
void ov01_02204698(FieldSystemUnkSubCC *unkCC);
void *ov01_02204744(enum HeapID heapID);
void ov01_02204764(void *unk104);
void ov01_022047DC(void *unk104);

#endif // POKEHEARTGOLD_FIELD_OVERLAY_01_02204004_H
