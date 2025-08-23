#ifndef GUARD_POKEHEARTGOLD_UNK_0202E4B0_H
#define GUARD_POKEHEARTGOLD_UNK_0202E4B0_H

#include "pm_string.h"
#include "save.h"

#define RANKINGS_PER_STAT 6

typedef struct SaveRankingsEntry SaveRankingsEntry;
typedef struct SaveRankings SaveRankings;

typedef struct ViewRankingsPageEntry {
    int groupId;
    u32 stat;
    String *playerName;
} ViewRankingsPageEntry;

typedef struct ViewRankingsPage {
    int count;
    ViewRankingsPageEntry entries[6];
} ViewRankingsPage;

u8 RankingsViewSys_GetNumRecordsPerPage(int page);
u8 RankingsViewSys_GetFirstRecordIndexOnPage(int page);
u32 Save_Rankings_sizeof(void);
void Save_Rankings_Init(SaveRankings *saveRankings);
SaveRankings *Save_Rankings_Get(SaveData *saveData);
void Save_Rankings_DeleteEntryByIndex(SaveRankings *saveRankings, int stat, u8 index);
u32 Save_Rankings_GetMixingSize(void);
SaveRankingsEntry *Save_GetPlayerMixingRankingEntry(SaveData *saveData, HeapID heapId);
void Save_UpdateRankingsFromMixing(SaveData *saveData, u8 playerIdx, u8 countIn, SaveRankingsEntry **ppEntries, HeapID heapId);
ViewRankingsPage *Save_GetPlayerViewRankingPage(SaveData *saveData, int page, HeapID heapId);
ViewRankingsPage *Save_GetReceivedViewRankingPage(SaveRankings *saveRankings, int page, HeapID heapId);
void ViewRankingsPage_Delete(ViewRankingsPage *viewRankingsPage);

#endif // GUARD_POKEHEARTGOLD_UNK_0202E4B0_H
