#ifndef POKEHEARTGOLD_UNK_02020654_H
#define POKEHEARTGOLD_UNK_02020654_H

#include "heap.h"

typedef struct UnkStruct_02020654 {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
    u8 unk_7;
} UnkStruct_02020654;

NNSG2dCellTransferState *sub_02020654(int a0, HeapID heapId);
void sub_02020A0C(const UnkStruct_02020654 *a0, u8 *a1, u8 *a2);
void thunk_UpdateCellTransferStateManager(void);
void sub_0202067C(NNSG2dCellTransferState *state);
u8 sub_02020A24(const UnkStruct_02020654 *a0, u8 *px, u8 *py, int a3, int a4, int partyMonIndex, int direction);

#endif // POKEHEARTGOLD_UNK_02020654_H
