#ifndef GUARD_POKEHEARTGOLD_UNK_0202E4B0_H
#define GUARD_POKEHEARTGOLD_UNK_0202E4B0_H

#include "pm_string.h"
#include "save.h"

typedef struct SaveRankingsEntry SaveRankingsEntry;
typedef struct SaveRankings SaveRankings;

typedef struct UnkStruct_0202E9FC_sub {
    int groupId;
    u32 stat;
    String *playerName;
} UnkStruct_0202E9FC_sub;

typedef struct UnkStruct_0202E9FC {
    int count;
    UnkStruct_0202E9FC_sub unk_04[6];
} UnkStruct_0202E9FC;

u8 RankingsViewSys_GetNumRecordsPerPage(int a0);
u8 RankingsViewSys_GetFirstRecordIndexOnPage(int a0);
u32 Save_Rankings_sizeof(void);  // ???_sizeof
void Save_Rankings_Init(SaveRankings *a0);  // ???_Init
SaveRankings *sub_0202E530(SaveData *saveData);  // ???_Get
void sub_0202E544(SaveRankings *a0, int a1, u8 a2);
u32 sub_0202E58C(void);
SaveRankingsEntry *Save_GetPlayerRankingEntry(SaveData *saveData, HeapID heapId);
void sub_0202E97C(SaveData *saveData, u8 a1, u8 a2, SaveRankingsEntry **a3, HeapID heapId);
UnkStruct_0202E9FC *sub_0202E9FC(SaveData *saveData, int a1, HeapID heapId);
UnkStruct_0202E9FC *sub_0202EA80(SaveRankings *a0, int a1, HeapID heapId);
void sub_0202EAFC(UnkStruct_0202E9FC *a0);

#endif //GUARD_POKEHEARTGOLD_UNK_0202E4B0_H
