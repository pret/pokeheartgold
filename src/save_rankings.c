#include "save_rankings.h"

#include "global.h"

#include "constants/game_stats.h"
#include "constants/ranking.h"

#include "friend_group.h"
#include "game_stats.h"
#include "player_data.h"
#include "save.h"
#include "save_frontier.h"
#include "string_util.h"
#include "unk_0202C730.h"
#include "unk_02030A98.h"

struct SaveRankingsEntry {
    int groupId;
    u32 stat;
    u16 playerName[PLAYER_NAME_LENGTH + 1];
};

struct SaveRankings {
    SaveRankingsEntry array[2 * RANKINGS_COUNT][RANKINGS_PER_STAT];
};

typedef struct SaveRankingsSortBuffer {
    int rankingsFromSaveCnt;
    int rankingsFromMixingCnt;
    int rankingsTotalCount;
    SaveRankingsEntry *rankings[RANKINGS_PER_STAT * 2 - 1];
    SaveRankingsEntry *rankingsFromSave[RANKINGS_PER_STAT];
    SaveRankingsEntry fromSave[RANKINGS_PER_STAT];
} SaveRankingsSortBuffer;

static void SaveRankingsEntry_Init(SaveRankingsEntry *rankingsEntry);
static BOOL SaveRankingsEntry_IsInit(SaveRankingsEntry *rankingsEntry);
static u32 *Save_RankingSys_GetPlayerStats(SaveData *saveData, enum HeapID heapID);
static void SaveRankingsEntry_InitArrayOf6(SaveRankingsEntry *rankingsEntry);
static BOOL SaveRankingsEntry_TestEqual(const SaveRankingsEntry *lhs, const SaveRankingsEntry *rhs);
static BOOL SaveRankingsSortBuffer_EntryAlreadyExists(const SaveRankingsSortBuffer *sortBuffer, const SaveRankingsEntry *rankingsEntry);
static void SaveRankings_GetSorted(SaveRankings *saveRankings, SaveRankingsSortBuffer *sortBuffer, int groupId, u8 statIdx, u8 scope, SaveRankingsEntry **filteredEntries, u8 filteredEntriesCnt, enum HeapID heapID);
static void SaveRankings_GetSortedScoped(SaveRankings *saveRankings, int groupId, u8 statIdx, SaveRankingsEntry **filteredEntries, u8 filteredEntriesCnt, enum HeapID heapID);

static const u8 sPageOffsets[][2] = {
    { RANKINGS_RECORD_BATTLE_TOWER_COUNT, RANKINGS_RECORD_BATTLE_TOWER_BEGIN },
    { RANKINGS_RECORD_POKEMON_COUNT,      RANKINGS_RECORD_POKEMON_BEGIN      },
    { RANKINGS_RECORD_CONTEST_COUNT,      RANKINGS_RECORD_CONTEST_BEGIN      },
};

static const int sStatIDs[] = {
    // Battle Tower
    0, // Battle Tower singles
    2, // Battle Tower doubles
    4, // Battle Tower multi with NPC partner
    6, // Battle Tower multi with friend
    8, // Battle Tower WiFi
    GAME_STAT_BATTLE_TOWER_WIN_COUNT,

    // Adventure
    GAME_STAT_OPPONENT_MON_FAINTED,
    GAME_STAT_CAUGHT_MON,
    GAME_STAT_HATCHED_EGG,
    GAME_STAT_FISHING_LANDED_MON,

    // Contest (unused in HGSS)
    GAME_STAT_LOCAL_CONTEST_WINS,
    GAME_STAT_LOCAL_CONTEST_ENTRIES,
    GAME_STAT_RIBBONS_EARNED,
};

u8 RankingsViewSys_GetNumRecordsPerPage(int page) {
    return sPageOffsets[page][0];
}

u8 RankingsViewSys_GetFirstRecordIndexOnPage(int page) {
    return sPageOffsets[page][1];
}

static void SaveRankingsEntry_Init(SaveRankingsEntry *entry) {
    entry->groupId = 0;
    entry->stat = 0;
    StringFillEOS(entry->playerName, PLAYER_NAME_LENGTH + 1);
    SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
}

static BOOL SaveRankingsEntry_IsInit(SaveRankingsEntry *entry) {
    return StringLength(entry->playerName) != 0;
}

u32 Save_Rankings_sizeof(void) {
    return sizeof(SaveRankings);
}

void Save_Rankings_Init(SaveRankings *saveRankings) {
    MI_CpuClear8(saveRankings, sizeof(SaveRankings));
    for (int i = 0; i < 2 * RANKINGS_COUNT; ++i) {
        for (int j = 0; j < RANKINGS_PER_STAT; ++j) {
            SaveRankingsEntry_Init(&saveRankings->array[i][j]);
        }
    }
    SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
}

SaveRankings *Save_Rankings_Get(SaveData *saveData) {
    SaveSubstruct_AssertCRC(SAVE_RANKINGS);
    return SaveArray_Get(saveData, SAVE_RANKINGS);
}

void Save_Rankings_DeleteEntryByIndex(SaveRankings *saveRankings, int stat, u8 index) {
    if (index >= RANKINGS_PER_STAT) {
        GF_ASSERT(index < RANKINGS_PER_STAT);
        return;
    }
    SaveRankingsEntry *curRankings = saveRankings->array[stat];
    for (int i = index; i < RANKINGS_PER_STAT - 1; ++i) {
        curRankings[i] = curRankings[i + 1];
    }
    SaveRankingsEntry_Init(&curRankings[RANKINGS_PER_STAT - 1]);
    SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
}

u32 Save_Rankings_GetMixingSize(void) {
    return RANKINGS_COUNT * sizeof(SaveRankingsEntry);
}

static u32 *Save_RankingSys_GetPlayerStats(SaveData *saveData, enum HeapID heapID) {
    int i;
    u32 val;
    GameStats *gameStats;
    FrontierSave *frontierSave;
    u32 *ret;

    gameStats = Save_GameStats_Get(saveData);
    frontierSave = Save_Frontier_GetStatic(saveData);
    ret = Heap_AllocAtEnd(heapID, RANKINGS_COUNT * sizeof(u32));

    for (i = 0; i < RANKINGS_COUNT; ++i) {
        switch (i) {
        case RANKINGS_RECORD_BATTLE_TOWER_AVG_WIN_STREAK: {
            val = GameStats_GetCapped(gameStats, GAME_STAT_BATTLE_TOWER_BATTLE_COUNT);
            if (val != 0) {
                val = GameStats_GetCapped(gameStats, GAME_STAT_BATTLE_TOWER_WIN_COUNT) / val;
            }
            ret[i] = val;
            break;
        }
        case RANKINGS_RECORD_CONTEST_WIN: {
            val = GameStats_GetCapped(gameStats, GAME_STAT_LOCAL_CONTEST_WINS);
            val += GameStats_GetCapped(gameStats, GAME_STAT_COMM_CONTEST_WINS);
            ret[i] = val;
            break;
        }
        case RANKINGS_RECORD_CONTEST_ENTRY: {
            val = GameStats_GetCapped(gameStats, GAME_STAT_LOCAL_CONTEST_ENTRIES);
            val += GameStats_GetCapped(gameStats, GAME_STAT_COMM_CONTEST_ENTRIES);
            if (val != 0) {
                val = ret[RANKINGS_RECORD_CONTEST_WIN] * 100 / val;
            }
            ret[i] = val;
            break;
        }
        default:
            if (i >= RANKINGS_RECORD_BATTLE_TOWER_SINGLE_WINS && i <= RANKINGS_RECORD_BATTLE_TOWER_WIFI_WINS) {
                ret[i] = FrontierSave_GetStat(frontierSave, sStatIDs[i], 0xFF);
            } else {
                ret[i] = GameStats_GetCapped(gameStats, sStatIDs[i]);
            }
            break;
        }
    }
    SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
    return ret;
}

SaveRankingsEntry *Save_GetPlayerMixingRankingEntry(SaveData *saveData, enum HeapID heapID) {
    int i;
    int groupId;
    SaveRankingsEntry *ret;
    u32 *tmp;
    String *name;
    PlayerProfile *profile;

    profile = Save_PlayerData_GetProfile(saveData);
    ret = Heap_AllocAtEnd(heapID, RANKINGS_COUNT * sizeof(SaveRankingsEntry));
    MI_CpuClear8(ret, RANKINGS_COUNT * sizeof(SaveRankingsEntry));
    groupId = Save_FriendGroup_GetGroupId(Save_FriendGroup_Get(saveData), 1);
    name = PlayerProfile_GetPlayerName_NewString(profile, heapID);
    tmp = Save_RankingSys_GetPlayerStats(saveData, heapID);

    for (i = 0; i < RANKINGS_COUNT; ++i) {
        ret[i].groupId = groupId;
        CopyStringToU16Array(name, ret[i].playerName, PLAYER_NAME_LENGTH + 1);
        ret[i].stat = tmp[i];
    }

    Heap_Free(tmp);
    String_Delete(name);
    SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
    return ret;
}

static void SaveRankingsEntry_InitArrayOf6(SaveRankingsEntry *entries) {
    for (int i = 0; i < RANKINGS_PER_STAT; ++i) {
        SaveRankingsEntry_Init(&entries[i]);
    }
}

static BOOL SaveRankingsEntry_TestEqual(const SaveRankingsEntry *lhs, const SaveRankingsEntry *rhs) {
    if (lhs->groupId != rhs->groupId) {
        return FALSE;
    }
    return !StringNotEqual(lhs->playerName, rhs->playerName);
}

static BOOL SaveRankingsSortBuffer_EntryAlreadyExists(const SaveRankingsSortBuffer *sortBuffer, const SaveRankingsEntry *entry) {
    for (int i = 0; i < sortBuffer->rankingsFromMixingCnt; ++i) {
        if (SaveRankingsEntry_TestEqual(sortBuffer->rankings[i], entry)) {
            return TRUE;
        }
    }

    return FALSE;
}

static void SaveRankings_GetSorted(SaveRankings *saveRankings, SaveRankingsSortBuffer *sortBuffer, int groupId, u8 statIdx, u8 scope, SaveRankingsEntry **filteredEntries, u8 filteredEntriesCnt, enum HeapID unused) {
    SaveRankingsEntry *saveRecordsPtr;
    int i;
    int j;

    MI_CpuClear8(sortBuffer, sizeof(SaveRankingsSortBuffer));
    if (scope == RANKINGS_SCOPE_GLOBAL) {
        saveRecordsPtr = saveRankings->array[statIdx];
        MI_CpuCopy8(saveRecordsPtr, sortBuffer->fromSave, RANKINGS_PER_STAT * sizeof(SaveRankingsEntry));
        for (i = 0; i < filteredEntriesCnt; ++i) {
            sortBuffer->rankings[sortBuffer->rankingsFromMixingCnt++] = &filteredEntries[i][statIdx];
        }
        for (i = 0; i < RANKINGS_PER_STAT; ++i) {
            if (SaveRankingsEntry_IsInit(&sortBuffer->fromSave[i]) && !SaveRankingsSortBuffer_EntryAlreadyExists(sortBuffer, &sortBuffer->fromSave[i])) {
                sortBuffer->rankingsFromSave[sortBuffer->rankingsFromSaveCnt++] = &sortBuffer->fromSave[i];
            }
        }
    } else {
        saveRecordsPtr = saveRankings->array[statIdx + RANKINGS_COUNT];
        MI_CpuCopy8(saveRecordsPtr, sortBuffer->fromSave, 6 * sizeof(SaveRankingsEntry));
        for (i = 0; i < filteredEntriesCnt; ++i) {
            if (filteredEntries[i][statIdx].groupId != 0 && groupId == filteredEntries[i][statIdx].groupId) {
                sortBuffer->rankings[sortBuffer->rankingsFromMixingCnt++] = &filteredEntries[i][statIdx];
            }
        }
        for (i = 0; i < RANKINGS_PER_STAT; ++i) {
            if (SaveRankingsEntry_IsInit(&sortBuffer->fromSave[i]) && sortBuffer->fromSave[i].groupId == groupId && !SaveRankingsSortBuffer_EntryAlreadyExists(sortBuffer, &sortBuffer->fromSave[i])) {
                sortBuffer->rankingsFromSave[sortBuffer->rankingsFromSaveCnt++] = &sortBuffer->fromSave[i];
            }
        }
    }
    sortBuffer->rankingsTotalCount = sortBuffer->rankingsFromMixingCnt + sortBuffer->rankingsFromSaveCnt;
    for (i = 0; i < sortBuffer->rankingsFromSaveCnt; ++i) {
        sortBuffer->rankings[i + sortBuffer->rankingsFromMixingCnt] = sortBuffer->rankingsFromSave[i];
    }
    // Bubble-sort
    for (i = 0; i < sortBuffer->rankingsTotalCount - 1; ++i) {
        for (j = sortBuffer->rankingsTotalCount - 1; j > i; --j) {
            if (sortBuffer->rankings[i]->stat < sortBuffer->rankings[j]->stat) {
                SaveRankingsEntry *tmp = sortBuffer->rankings[i];
                sortBuffer->rankings[i] = sortBuffer->rankings[j];
                sortBuffer->rankings[j] = tmp;
            }
        }
    }
    SaveRankingsEntry_InitArrayOf6(saveRecordsPtr);
    for (i = 0; i < RANKINGS_PER_STAT && i < sortBuffer->rankingsTotalCount; ++i) {
        saveRecordsPtr[i] = *sortBuffer->rankings[i];
    }
}

static void SaveRankings_GetSortedScoped(SaveRankings *saveRankings, int groupId, u8 statIdx, SaveRankingsEntry **filteredEntries, u8 filteredEntriesCnt, enum HeapID heapID) {
    SaveRankingsSortBuffer *temp = Heap_AllocAtEnd(heapID, sizeof(SaveRankingsSortBuffer));
    SaveRankings_GetSorted(saveRankings, temp, groupId, statIdx, RANKINGS_SCOPE_GLOBAL, filteredEntries, filteredEntriesCnt, heapID);
    if (groupId != 0) {
        SaveRankings_GetSorted(saveRankings, temp, groupId, statIdx, RANKINGS_SCOPE_GROUP, filteredEntries, filteredEntriesCnt, heapID);
    }
    Heap_Free(temp);
}

void Save_UpdateRankingsFromMixing(SaveData *saveData, u8 playerIdx, u8 countIn, SaveRankingsEntry **ppEntries, enum HeapID heapID) {
    u8 i;
    u8 cnt;
    SaveRankingsEntry *filteredEntries[RANKINGS_PER_STAT - 1];
    int groupId;
    SaveRankings *saveRankings;

    saveRankings = Save_Rankings_Get(saveData);
    groupId = Save_FriendGroup_GetGroupId(Save_FriendGroup_Get(saveData), 1);
    cnt = 0;
    for (i = 0; i < countIn; ++i) {
        if (i != playerIdx && ppEntries[i] != NULL) {
            filteredEntries[cnt++] = ppEntries[i];
        }
    }
    if (cnt != 0) {
        for (i = 0; i < RANKINGS_COUNT; ++i) {
            SaveRankings_GetSortedScoped(saveRankings, groupId, i, filteredEntries, cnt, heapID);
        }
        SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
    }
}

ViewRankingsPage *Save_GetPlayerViewRankingPage(SaveData *saveData, int page, enum HeapID heapID) {
    int i;
    int pageOffset;
    ViewRankingsPage *ret;
    int groupId;
    u32 *tmp;
    PlayerProfile *profile;

    profile = Save_PlayerData_GetProfile(saveData);
    ret = Heap_Alloc(heapID, sizeof(ViewRankingsPage));
    MI_CpuClear8(ret, sizeof(ViewRankingsPage));
    groupId = Save_FriendGroup_GetGroupId(Save_FriendGroup_Get(saveData), 1);
    tmp = Save_RankingSys_GetPlayerStats(saveData, heapID);
    ret->count = RankingsViewSys_GetNumRecordsPerPage(page);
    pageOffset = RankingsViewSys_GetFirstRecordIndexOnPage(page);
    for (i = 0; i < ret->count; ++i) {
        ret->entries[i].groupId = groupId;
        ret->entries[i].stat = tmp[i + pageOffset];
        ret->entries[i].playerName = PlayerProfile_GetPlayerName_NewString(profile, heapID);
    }
    Heap_Free(tmp);
    return ret;
}

ViewRankingsPage *Save_GetReceivedViewRankingPage(SaveRankings *saveRankings, int page, enum HeapID heapID) {
    int i;
    ViewRankingsPage *ret;

    ret = Heap_Alloc(heapID, sizeof(ViewRankingsPage));
    MI_CpuClear8(ret, sizeof(ViewRankingsPage));
    for (i = 0; i < RANKINGS_PER_STAT; ++i) {
        if (SaveRankingsEntry_IsInit(&saveRankings->array[page][i])) {
            ret->entries[ret->count].groupId = saveRankings->array[page][i].groupId;
            ret->entries[ret->count].stat = saveRankings->array[page][i].stat;
            ret->entries[ret->count].playerName = String_New(PLAYER_NAME_LENGTH + 1, heapID);
            CopyU16ArrayToString(ret->entries[ret->count].playerName, saveRankings->array[page][i].playerName);
            ++ret->count;
        }
    }
    return ret;
}

void ViewRankingsPage_Delete(ViewRankingsPage *viewRankingsPage) {
    int i;

    for (i = 0; i < RANKINGS_PER_STAT; ++i) {
        if (viewRankingsPage->entries[i].playerName != NULL) {
            String_Delete(viewRankingsPage->entries[i].playerName);
        }
    }
    MI_CpuClear8(viewRankingsPage, sizeof(ViewRankingsPage));
    Heap_Free(viewRankingsPage);
    SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
}
