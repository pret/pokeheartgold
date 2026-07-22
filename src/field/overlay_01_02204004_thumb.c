#include "field/overlay_01_02204004.h"

#include "global.h"

static BOOL ov01_02204144(UnkStruct_FieldSysC0 *unkC0, int index);
static UnkStruct_FieldSysC0_SubC *ov01_02204168(UnkStruct_FieldSysC0 *unkC0, NNSG3dResFileHeader **resFileHeader, int index);

UnkStruct_FieldSysC0 *ov01_02204004(enum HeapID heapID, int indexMax, int objectMax, NNSG3dResFileHeader **resFileHeaders) { // FieldSysC0_New
    UnkStruct_FieldSysC0 *unkC0 = Heap_Alloc(heapID, sizeof(UnkStruct_FieldSysC0));
    unkC0->numObjects = 0;
    unkC0->indexMax = indexMax;
    unkC0->objectMax = objectMax;
    unkC0->resFileHeaders = resFileHeaders;
    unkC0->modelNumToLoadedSlot = Heap_Alloc(heapID, indexMax);
    int i;
    for (i = 0; i < indexMax; i++) {
        unkC0->modelNumToLoadedSlot[i] = 0xFF;
    }
    int size = objectMax * 0x5C;
    unkC0->objectHeap = Heap_Alloc(heapID, size);
    MIi_CpuClearFast(0, (u32*)unkC0->objectHeap, size);
    unkC0->objects = Heap_Alloc(heapID, objectMax * 4);
    for (i = 0; i < objectMax; i++) {
        unkC0->objects[i] = &unkC0->objectHeap[i];
    }
    return unkC0;
}

void ov01_02204084(UnkStruct_FieldSysC0 *unkC0) { // FieldSysC0_Free
    Heap_Free(unkC0->modelNumToLoadedSlot);
    Heap_Free(unkC0->objectHeap);
    Heap_Free(unkC0->objects);
    Heap_Free(unkC0);
}

UnkStruct_FieldSysC0_SubC *ov01_022040A4(UnkStruct_FieldSysC0 *unkC0, int index) {
    unkC0->modelNumToLoadedSlot[index] = unkC0->numObjects;
    NNSG3dResFileHeader *resFileHeader = unkC0->resFileHeaders[index];
    return ov01_02204168(unkC0, &resFileHeader, index);
}

static void ov01_022040C0(UnkStruct_FieldSysC0 *unkC0, UnkStruct_FieldSysC0_SubC *object) {
    unkC0->numObjects--;
    unkC0->objects[unkC0->numObjects] = object;
}

UnkStruct_FieldSysC0_SubC *Field3dObjectList_GetRenderObjectByID(UnkStruct_FieldSysC0 *unkC0, int id) {
    u8 index = unkC0->modelNumToLoadedSlot[id];
    if (index != 0xFF) {
        return unkC0->objects[index];
    }
    return NULL;
}

static UnkStruct_FieldSysC0_SubC *ov01_022040E4(UnkStruct_FieldSysC0 *unkC0, int index) {
    NNSG3dResFileHeader *resFileHeader = unkC0->resFileHeaders[index];
    return ov01_02204168(unkC0, &resFileHeader, index);
}

UnkStruct_FieldSysC0_SubC *ov01_022040F8(UnkStruct_FieldSysC0 *unkC0, int index) {
    if (ov01_02204144(unkC0, index)) {
        return Field3dObjectList_GetRenderObjectByID(unkC0, index);
    }
    return ov01_022040E4(unkC0, index);
}

BOOL ov01_0220411C(UnkStruct_FieldSysC0 *unkC0, UnkStruct_FieldSysC0_SubC *object) {
    if (object == NULL) {
        return FALSE;
    }
    
    if (ov01_02204144(unkC0, object->index) == FALSE) {
        ov01_022040C0(unkC0, object);
        return TRUE;
    }
    return FALSE;
}

static BOOL ov01_02204144(UnkStruct_FieldSysC0 *unkC0, int index) {
    return unkC0->modelNumToLoadedSlot[index] != 0xFF;
}

BOOL ov01_02204154(UnkStruct_FieldSysC0 *unkC0, int index) {
    return unkC0->resFileHeaders[index] != NULL;
}

static UnkStruct_FieldSysC0_SubC *ov01_02204168(UnkStruct_FieldSysC0 *unkC0, NNSG3dResFileHeader **resFileHeader, int index) {
    unkC0->objects[unkC0->numObjects]->model = NNS_G3dGetMdlByIdx(NNS_G3dGetMdlSet(*resFileHeader), 0);
    
    NNS_G3dRenderObjInit(&unkC0->objects[unkC0->numObjects]->renderObj, unkC0->objects[unkC0->numObjects]->model);
    UnkStruct_FieldSysC0_SubC *object = unkC0->objects[unkC0->numObjects];
    unkC0->numObjects++;
    object->index = index;
    return object;
}

FieldSystemUnkSubC8 *ov01_022041C4(enum HeapID heapID) { // FieldSystemUnkSubC8_New
    FieldSystemUnkSubC8 *unkC8 = Heap_Alloc(heapID, sizeof(FieldSystemUnkSubC8));
    unkC8->unkC = 0;
    unkC8->unk0 = 0;
    unkC8->unk4 = 0;
    unkC8->unk8 = 0;
}
