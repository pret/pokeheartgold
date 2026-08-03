#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_02204004_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_02204004_H

#include <nnsys.h>

#include "heap.h"

typedef struct FieldSystemUnkSubC8 FieldSystemUnkSubC8;

typedef struct UnkStruct_FieldSysC0_SubC {
    NNSG3dRenderObj renderObj;
    NNSG3dResMdl *model;
    NNSG3dResFileHeader *resFileHeader;
} UnkStruct_FieldSysC0_SubC;

typedef struct UnkStruct_FieldSysC0 {
    u8 *modelNumToLoadedSlot;
    NNSG3dResFileHeader *resFileHeader;
    UnkStruct_FieldSysC0_SubC *objectHeap;
    UnkStruct_FieldSysC0_SubC **objects;
    int numObjects;
    int indexMax;
    int objectMax;
} UnkStruct_FieldSysC0;

UnkStruct_FieldSysC0 *ov01_02204004(enum HeapID heapID, int indexMax, int objectMax, NNSG3dResFileHeader **a3);
UnkStruct_FieldSysC0_SubC *Field3dObjectList_GetRenderObjectByID(UnkStruct_FieldSysC0 *a0, int a1);

void ov01_02204084(UnkStruct_FieldSysC0 *unkC0);
UnkStruct_FieldSysC0_SubC *ov01_022040F8(UnkStruct_FieldSysC0 *unkC0, int a1);
BOOL ov01_0220411C(UnkStruct_FieldSysC0 *unkC0, UnkStruct_FieldSysC0_SubC *a1);
BOOL ov01_02204154(UnkStruct_FieldSysC0 *unkC0, int a1);
void *ov01_022041C4(enum HeapID heapID);
void ov01_02204278(FieldSystemUnkSubC8 *unkSubC8);
void ov01_02204350(FieldSystemUnkSubC8 *unkSubC8);
void ov01_022043D8(FieldSystemUnkSubC8 *unkSubC8);
void ov01_02204424(FieldSystemUnkSubC8 *unkSubC8);
void *ov01_0220460C(FieldSystemUnkSubC8 *unkSubC8);
void ov01_02204634(void *unkCC);
void *ov01_02204744(enum HeapID heapID);
void ov01_02204764(void *unk104);
void ov01_022047DC(void *unk104);

#endif // POKEHEARTGOLD_FIELD_OVERLAY_01_02204004_H
