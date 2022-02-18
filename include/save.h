#ifndef POKEHEARTGOLD_SAVE_H
#define POKEHEARTGOLD_SAVE_H

#include "heap.h"
#include "constants/save_arrays.h"

typedef struct SaveBlock2 SAVEDATA;

SAVEDATA *SaveBlock2_new(void);
SAVEDATA *SaveBlock2_get(void);
void *SavArray_get(SAVEDATA *saveData, int id);
const void *SavArray_const_get(const SAVEDATA *saveData, int id);
BOOL sub_020272F4(SAVEDATA *saveData);
BOOL sub_020273B0(SAVEDATA *saveData);
int sub_020273F0(SAVEDATA *saveData);
int sub_0202746C(SAVEDATA *saveData, int a1);
void Sav2_InitDynamicRegion(SAVEDATA *saveData);
BOOL sub_020274D0(SAVEDATA *saveData);
u32 sub_020274D4(SAVEDATA *saveData);
void sub_020274D8(SAVEDATA *saveData);
u32 sub_020274E0(SAVEDATA *saveData);
BOOL sub_020274E8(SAVEDATA *saveData);
BOOL sub_02027500(SAVEDATA *saveData);
BOOL sub_02027520(SAVEDATA *saveData);
void SetAllPCBoxesModified(void);
void sub_02027550(SAVEDATA *saveData, int a1);
int sub_02027564(SAVEDATA *saveData);
void Save_Cancel(SAVEDATA *saveData);
u16 SavArray_CalcCRC16(SAVEDATA *saveData, const void *data, u32 size);
void sub_02027FFC(SAVEDATA *saveData);
int WriteExtraSaveChunk(SAVEDATA *saveData, int idx, void *data);
int sub_02028230(SAVEDATA *saveData, int idx, void *data);
void *ReadExtraSaveChunk(SAVEDATA *saveData, HeapID heapId, int idx, int *ret_p);
void *sub_020284A4(SAVEDATA *saveData, HeapID heapId, int idx, int *ret_p, int *ret2_p);
BOOL SaveSubstruct_AssertCRC(int idx);
void SaveSubstruct_UpdateCRC(int idx);

#endif //POKEHEARTGOLD_SAVE_H
