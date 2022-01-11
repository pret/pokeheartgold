#ifndef POKEHEARTGOLD_UNK_02090C94_H
#define POKEHEARTGOLD_UNK_02090C94_H

#include "heap.h"

struct UnkStruct_02091308 {
    u32 *unk_00;
    u32 *unk_04;
    int unk_08;
    int unk_0C;
    u8 filler_10[8];
}; // size=0x18

struct UnkStruct_02091308 *ZknData_Create(HeapID heapId);
void ZknData_Delete(struct UnkStruct_02091308 *a0);
void ZknData_LoadAll(struct UnkStruct_02091308 *a0, int a1, HeapID a2);
void ZknData_UnloadAll(struct UnkStruct_02091308 *a0);
u32 ZknData_GetHeight(struct UnkStruct_02091308 *a0, int a1);

static inline u32 SpeciesGetDexHeight(int species) {
    u32 ret;
    struct UnkStruct_02091308 *r4_2;

    r4_2 = ZknData_Create((HeapID)4);
    ZknData_LoadAll(r4_2, 0, (HeapID)4);
    ret = ZknData_GetHeight(r4_2, species);
    ZknData_UnloadAll(r4_2);
    ZknData_Delete(r4_2);

    return ret;
}

#define LengthConvertToImperial(metric) ((((metric) * 1000) / 254 + 5) / 10)

#endif //POKEHEARTGOLD_UNK_02090C94_H
