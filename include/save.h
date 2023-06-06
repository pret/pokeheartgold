#ifndef POKEHEARTGOLD_SAVE_H
#define POKEHEARTGOLD_SAVE_H

#include "heap.h"
#include "constants/save_arrays.h"

#define LOAD_STATUS_NOT_EXIST       0
#define LOAD_STATUS_IS_GOOD         1
#define LOAD_STATUS_SLOT_FAIL       2
#define LOAD_STATUS_TOTAL_FAIL      3

#define WRITE_STATUS_CONTINUE       0
#define WRITE_STATUS_NEXT           1
#define WRITE_STATUS_SUCCESS        2
#define WRITE_STATUS_TOTAL_FAIL     3

typedef struct SaveBlock2 SAVEDATA;

SAVEDATA *SaveBlock2_New(void);
SAVEDATA *SaveBlock2_Get(void);
void *SaveArray_Get(SAVEDATA *saveData, int id);
const void *SaveArray_Const_Get(const SAVEDATA *saveData, int id);
BOOL Save_DeleteAllData(SAVEDATA *saveData);
BOOL SaveData_TryLoadOnContinue(SAVEDATA *saveData);
int SaveGameNormal(SAVEDATA *saveData);
int Save_NowWriteFile_AfterMGInit(SAVEDATA *saveData, int a1);
void Save_InitDynamicRegion(SAVEDATA *saveData);
BOOL Save_FlashChipIsDetected(SAVEDATA *saveData);
u32 Save_GetStatusFlags(SAVEDATA *saveData);
void Save_ClearStatusFlags(SAVEDATA *saveData);
u32 Save_FileExists(SAVEDATA *saveData);
BOOL Save_CheckExtraChunksExist(SAVEDATA *saveData);
BOOL Save_FileDoesNotBelongToPlayer(SAVEDATA *saveData);
BOOL Save_NumModifiedPCBoxesIsMany(SAVEDATA *saveData);
void SetAllPCBoxesModified(void);
void Save_PrepareForAsyncWrite(SAVEDATA *saveData, int a1);
int Save_WriteFileAsync(SAVEDATA *saveData);
void Save_Cancel(SAVEDATA *saveData);
u16 SaveArray_CalcCRC16(SAVEDATA *saveData, const void *data, u32 size);
void Save_WipeExtraChunks(SAVEDATA *saveData);
int WriteExtraSaveChunk(SAVEDATA *saveData, int idx, void *data);
int sub_02028230(SAVEDATA *saveData, int idx, void *data);
void *ReadExtraSaveChunk(SAVEDATA *saveData, HeapID heapId, int idx, int *ret_p);
void *sub_020284A4(SAVEDATA *saveData, HeapID heapId, int idx, int *ret_p, int *ret2_p);
BOOL SaveSubstruct_AssertCRC(int idx);
void SaveSubstruct_UpdateCRC(int idx);

#endif //POKEHEARTGOLD_SAVE_H
