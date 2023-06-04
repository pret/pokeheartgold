#ifndef POKEHEARTGOLD_SAVE_ARRAYS_H
#define POKEHEARTGOLD_SAVE_ARRAYS_H

#include "save.h"
#include "unk_0202E41C.h"
#include "pokemon_storage_system.h"
#include "mystery_gift.h"
#include "unk_0202EB30.h"
#include "unk_02030A98.h"
#include "hall_of_fame.h"

typedef u32 (*SAVESIZEFN)(void);
typedef void (*SAVEINITFN)(void *);

struct SaveChunkHeader {
    int id;
    u32 block;
    SAVESIZEFN sizeFunc;
    SAVEINITFN initFunc;
};

struct ExtraSaveChunkHeader {
    int id;
    u32 sector;
    SAVESIZEFN sizeFunc;
    SAVEINITFN initFunc;
};

extern const struct SaveChunkHeader gSaveChunkHeaders[];
extern const int gNumSaveChunkHeaders;

extern const struct ExtraSaveChunkHeader gExtraSaveChunkHeaders[];
extern const int gNumExtraSaveChunkHeaders;

struct UnkStruct_0202E474 *sub_020270C4(SAVEDATA *saveData);
PC_STORAGE *GetStoragePCPointer(SAVEDATA *saveData);
MYSTERY_GIFT_SAVE *Save_MysteryGift_Get(SAVEDATA *saveData);
struct UnkStruct_0202EB30 *sub_020270F8(SAVEDATA *saveData);
HALL_OF_FAME *LoadHallOfFame(SAVEDATA *saveData, HeapID heapId, int *ret_p);
int SaveHallOfFame(SAVEDATA *saveData, HALL_OF_FAME *hallOfFame);
struct UnkStruct_0202FBCC *sub_0202711C(SAVEDATA *saveData, HeapID heapId, int *ret_p, int idx);
int sub_02027134(SAVEDATA *saveData, struct UnkStruct_0202FBCC *data, int idx);
struct UnkStruct_02030A98 *sub_02027144(SAVEDATA *saveData, HeapID heapId, int *ret_p);
int sub_02027158(SAVEDATA *saveData, struct UnkStruct_02030A98 *data);
u32 PCStorage_GetSizeOfBox(void);
u32 PCStorage_GetNumBoxes(void);
u32 Save_GetPCBoxModifiedFlags(SAVEDATA *saveData);
void Save_ResetPCBoxModifiedFlags(SAVEDATA *saveData);
void Save_SetAllPCBoxesModified(SAVEDATA *saveData);
void sub_020271A0(SAVEDATA *saveData);

#endif //POKEHEARTGOLD_SAVE_ARRAYS_H
