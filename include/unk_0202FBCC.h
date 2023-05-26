#ifndef POKEHEARTGOLD_UNK_0202FBCC_H
#define POKEHEARTGOLD_UNK_0202FBCC_H

#include "save.h"
#include "heap.h"

struct UnkStruct_0202FBCC {
    u8 filler_0000[0x1D50];
}; // related to Battle Hall, size=0x1D50

void sub_0202FBF0(SAVEDATA *save, HeapID heapId, u32 *out);
BOOL sub_0202FC48(void);

#endif //POKEHEARTGOLD_UNK_0202FBCC_H
