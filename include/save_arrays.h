#ifndef POKEHEARTGOLD_SAVE_ARRAYS_H
#define POKEHEARTGOLD_SAVE_ARRAYS_H

#include "hall_of_fame.h"
#include "mystery_gift.h"
#include "pokemon_storage_system.h"
#include "save.h"
#include "unk_0202E41C.h"
#include "unk_0202EB30.h"
#include "unk_02030A98.h"

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

UnkStruct_0202E474 *sub_020270C4(SaveData *saveData);
PCStorage *SaveArray_PCStorage_Get(SaveData *saveData);
MysteryGiftSave *Save_MysteryGift_Get(SaveData *saveData);
struct MigratedPokemonSav *Save_MigratedPokemon_Get(SaveData *saveData);
HallOfFame *LoadHallOfFame(SaveData *saveData, HeapID heapId, int *ret_p);
int SaveHallOfFame(SaveData *saveData, HallOfFame *hallOfFame);
struct UnkStruct_0202FBCC *sub_0202711C(SaveData *saveData, HeapID heapId, int *ret_p, int idx);
int sub_02027134(SaveData *saveData, struct UnkStruct_0202FBCC *data, int idx);
struct UnkStruct_02030A98 *sub_02027144(SaveData *saveData, HeapID heapId, int *ret_p);
int sub_02027158(SaveData *saveData, struct UnkStruct_02030A98 *data);
u32 PCStorage_GetSizeOfBox(void);
u32 PCStorage_GetNumBoxes(void);
u32 Save_GetPCBoxModifiedFlags(SaveData *saveData);
void Save_ResetPCBoxModifiedFlags(SaveData *saveData);
void Save_SetAllPCBoxesModified(SaveData *saveData);
void sub_020271A0(SaveData *saveData);

#endif // POKEHEARTGOLD_SAVE_ARRAYS_H
