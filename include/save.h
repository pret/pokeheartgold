#ifndef POKEHEARTGOLD_SAVE_H
#define POKEHEARTGOLD_SAVE_H

#include "heap.h"
#include "constants/save_arrays.h"

typedef struct SaveBlock2 SAVEDATA;

SAVEDATA *SaveBlock2_new(void);
void *SavArray_get(SAVEDATA *save, int idx);
const void *SavArray_const_get(const SAVEDATA *save, int idx);
void SaveSubstruct_UpdateCRC(int idx);
BOOL SaveSubstruct_AssertCRC(int idx);
BOOL sub_020274D0(SAVEDATA *save);
SAVEDATA *SaveBlock2_get(void);
void sub_020275A4(SAVEDATA *saveData);
void *ReadExtraSaveChunk(SAVEDATA *saveData, HeapID heapId, int idx, int *ret_p);
int WriteExtraSaveChunk(SAVEDATA *saveData, int idx, void *data);
void *sub_020284A4(SAVEDATA *saveData, HeapID heapId, int idx, int *ret_p, int *ret2_p);
int sub_02028230(SAVEDATA *saveData, int idx, void *data);

#endif //POKEHEARTGOLD_SAVE_H
