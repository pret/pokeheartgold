#ifndef POKEHEARTGOLD_UNK_0202FBCC_H
#define POKEHEARTGOLD_UNK_0202FBCC_H

#include "heap.h"
#include "save.h"

struct UnkStruct_0202FBCC {
    u8 filler_0000[0x1D50];
}; // related to Battle Hall, size=0x1D50

void sub_0202FBF0(SaveData *save, HeapID heapId, u32 *out);
BOOL sub_0202FC48(void);
void sub_02030260(int battlerId, u32 a1, u8 data);
u8 sub_0203027C(int battlerId, u32 a1);

#endif // POKEHEARTGOLD_UNK_0202FBCC_H
