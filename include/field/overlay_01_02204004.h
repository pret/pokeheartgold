#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_02204004_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_02204004_H

#include <nnsys.h>

#include "field/overlay_01_021E8744.h"

#include "heap.h"

typedef struct UnkStruct_FieldSysC0 {
    u8 *modelNumToLoadedSlot;
    NNSG3dResFileHeader *resFileHeader;
    UnkStruct_FieldSysC0_SubC *objectHeap;
    UnkStruct_FieldSysC0_SubC **objects;
    int numObjects;
    int indexMax;
    int objectMax;
} UnkStruct_FieldSysC0;

UnkStruct_FieldSysC0 ov01_02204004(HeapID heapId, int indexMax, int objectMax, NNSG3dResFileHeader *a3);
UnkStruct_FieldSysC0_SubC *Field3dObjectList_GetRenderObjectByID(UnkStruct_FieldSysC0 *a0, int a1);

#endif // POKEHEARTGOLD_FIELD_OVERLAY_01_02204004_H
