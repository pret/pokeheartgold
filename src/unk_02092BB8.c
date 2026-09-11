#include "unk_02092BB8.h"

#include "global.h"

UnkStruct_02092BB8 *UnkStruct_02092BB8_New(enum HeapID heapID) {
    UnkStruct_02092BB8 *ret = Heap_Alloc(heapID, sizeof(UnkStruct_02092BB8));
    UnkStruct_02092BB8_Set(ret, 0, 2);
    return ret;
}

void UnkStruct_02092BB8_Free(UnkStruct_02092BB8 *data) {
    Heap_Free(data);
}

void UnkStruct_02092BB8_Set(UnkStruct_02092BB8 *data, u16 species, u16 a2) {
    data->species = species;
    data->unk_2 = a2;
}

u16 UnkStruct_02092BB8_GetUnk2(UnkStruct_02092BB8 *data) {
    return data->unk_2;
}

u32 UnkStruct_02092BB8_GetSpecies(UnkStruct_02092BB8 *data) {
    return data->species;
}
