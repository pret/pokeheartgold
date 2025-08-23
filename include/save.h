#ifndef POKEHEARTGOLD_SAVE_H
#define POKEHEARTGOLD_SAVE_H

#include "constants/save_arrays.h"

#include "heap.h"

#define LOAD_STATUS_NOT_EXIST  0
#define LOAD_STATUS_IS_GOOD    1
#define LOAD_STATUS_SLOT_FAIL  2
#define LOAD_STATUS_TOTAL_FAIL 3

#define WRITE_STATUS_CONTINUE   0
#define WRITE_STATUS_NEXT       1
#define WRITE_STATUS_SUCCESS    2
#define WRITE_STATUS_TOTAL_FAIL 3

#define SAVE_CHUNK_MAGIC 0x20060623

struct SaveArrayHeader {
    int id;
    u32 size;
    u32 offset;
    u16 crc;
    u16 slot;
}; // size=0x10

struct SaveArrayFooter {
    u32 magic;
    u32 saveno;
    u32 size;
    u16 idx;
    u16 crc;
};

struct SaveChunkFooter {
    u32 count;
    u32 size;
    u32 magic;
    u16 slot;
    u16 crc;
};

struct SaveSlotSpec {
    u8 id;
    u8 firstPage;
    u8 numPages;
    u8 padding_3;
    u32 offset;
    u32 size;
}; // size=0xC

struct AsyncWriteManager {
    int rollbackCounter;
    int unk_4;
    int curSector;
    int numSectors;
    int lockId;
    u32 state;
    u32 count;
    BOOL waitingAsync;
    u32 state_sub;
};

typedef struct SaveData {
    BOOL flashChipDetected;
    BOOL saveFileExists;
    BOOL isNewGame;
    u32 statusFlags;
    u8 dynamic_region[SAVE_PAGE_MAX * SAVE_SECTOR_SIZE];
    u32 saveCounter;
    struct SaveArrayHeader arrayHeaders[SAVE_BLOCK_NUM]; // 23014
    struct SaveSlotSpec saveSlotSpecs[2];                // 232B4
    struct AsyncWriteManager asyncWriteMan;
    u32 lastGoodSaveSlot;
    u32 lastGoodSaveNo;
    int boxModifiedFlags;
    u32 newBoxModifiedFlags;
    u16 pcStorageLastCRC;
    u16 pcStorageCRC;
    u16 numModifiedBoxes;
    u16 nextBoxToWrite;
    u8 sectorCleanFlag[2];
    u16 lastGoodSector;
} SaveData; // size=0x2330C

struct SaveSlotCheck {
    BOOL valid;
    u32 count;
};

SaveData *SaveData_New(void);
SaveData *SaveData_Get(void);
void *SaveArray_Get(SaveData *saveData, int id);
const void *SaveArray_Const_Get(const SaveData *saveData, int id);
BOOL Save_DeleteAllData(SaveData *saveData);
BOOL SaveData_TryLoadOnContinue(SaveData *saveData);
int SaveGameNormal(SaveData *saveData);
int Save_NowWriteFile_AfterMGInit(SaveData *saveData, int a1);
void Save_InitDynamicRegion(SaveData *saveData);
BOOL Save_FlashChipIsDetected(SaveData *saveData);
u32 Save_GetStatusFlags(SaveData *saveData);
void Save_ClearStatusFlags(SaveData *saveData);
u32 Save_FileExists(SaveData *saveData);
BOOL Save_CheckExtraChunksExist(SaveData *saveData);
BOOL Save_FileDoesNotBelongToPlayer(SaveData *saveData);
BOOL Save_NumModifiedPCBoxesIsMany(SaveData *saveData);
void SetAllPCBoxesModified(void);
void Save_PrepareForAsyncWrite(SaveData *saveData, int a1);
int Save_WriteFileAsync(SaveData *saveData);
void Save_Cancel(SaveData *saveData);
u16 SaveArray_CalcCRC16(SaveData *saveData, const void *data, u32 size);
void Save_WipeExtraChunks(SaveData *saveData);
int WriteExtraSaveChunk(SaveData *saveData, int idx, void *data);
int sub_02028230(SaveData *saveData, int idx, void *data);
void *ReadExtraSaveChunk(SaveData *saveData, HeapID heapId, int idx, int *ret_p);
void *sub_020284A4(SaveData *saveData, HeapID heapId, int idx, int *ret_p, int *ret2_p);
BOOL SaveSubstruct_AssertCRC(int idx);
void SaveSubstruct_UpdateCRC(int idx);

#endif // POKEHEARTGOLD_SAVE_H
