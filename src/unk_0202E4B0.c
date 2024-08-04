#include "friend_group.h"
#include "game_stats.h"
#include "global.h"
#include "player_data.h"
#include "save.h"
#include "save_frontier.h"
#include "string_util.h"
#include "unk_0202C730.h"
#include "unk_02030A98.h"
#include "unk_0202E4B0.h"
#include "constants/game_stats.h"
#include "constants/ranking.h"

struct SaveRankingsEntry {
    int groupId;
    u32 stat;
    u16 playerName[PLAYER_NAME_LENGTH + 1];
};

struct SaveRankings {
    SaveRankingsEntry array[26][6];
};

typedef struct UnkStruct_0202E920_sub {
    u8 filler_00[0x90];
} UnkStruct_0202E920_sub;

typedef struct UnkStruct_0202E920 {
    int count_sub2;
    int count_sub1;
    int count_total;
    SaveRankingsEntry *rankings[11];
    SaveRankingsEntry *unk_38[6];
    SaveRankingsEntry unk_50[6];
} UnkStruct_0202E920;

static void RankingEntry_Init(SaveRankingsEntry *a0);
static BOOL sub_0202E4E0(SaveRankingsEntry *a0);
static u32 *Save_RankingSys_GetPlayerStats(SaveData *saveData, HeapID heapId);
static void SaveRankingsEntry_InitArrayOf6(SaveRankingsEntry *a0);
static BOOL SaveRankingsEntry_TestEqual(const SaveRankingsEntry *a0, const SaveRankingsEntry *a1);
static BOOL sub_0202E72C(const UnkStruct_0202E920 *a0, const SaveRankingsEntry *a1);
static void sub_0202E75C(SaveRankings *a0, UnkStruct_0202E920 *a1, int a2, u8 a3, u8 a4, SaveRankingsEntry **a5, u8 a6, HeapID heapId);
static void sub_0202E920(SaveRankings *a0, int a1, u8 a2, SaveRankingsEntry **a3, u8 a4, HeapID heapId);

static const u8 sPageOffsets[][2] = {
    { RANKINGS_RECORD_BATTLE_TOWER_COUNT, RANKINGS_RECORD_BATTLE_TOWER_BEGIN },
    { RANKINGS_RECORD_POKEMON_COUNT, RANKINGS_RECORD_POKEMON_BEGIN },
    { RANKINGS_RECORD_CONTEST_COUNT, RANKINGS_RECORD_CONTEST_BEGIN },
};

static const int sStatIDs[] = {
    // Battle Tower
    0,  // Battle Tower singles
    2,  // Battle Tower doubles
    4,  // Battle Tower multi with NPC partner
    6,  // Battle Tower multi with friend
    8,  // Battle Tower WiFi
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

static void RankingEntry_Init(SaveRankingsEntry *a0) {
    a0->groupId = 0;
    a0->stat = 0;
    StringFillEOS(a0->playerName, PLAYER_NAME_LENGTH + 1);
    SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
}

static BOOL sub_0202E4E0(SaveRankingsEntry *a0) {
    return StringLength(a0->playerName) != 0;
}

u32 Save_Rankings_sizeof(void) {
    return sizeof(SaveRankings);
}

void Save_Rankings_Init(SaveRankings *a0) {
    MI_CpuClear8(a0, sizeof(SaveRankings));
    for (int i = 0; i < 26; ++i) {
        for (int j = 0; j < 6; ++j) {
            RankingEntry_Init(&a0->array[i][j]);
        }
    }
    SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
}

SaveRankings *sub_0202E530(SaveData *saveData) {
    SaveSubstruct_AssertCRC(SAVE_RANKINGS);
    return SaveArray_Get(saveData, SAVE_RANKINGS);
}

void sub_0202E544(SaveRankings *a0, int a1, u8 a2) {
    if (a2 >= 6) {
        GF_ASSERT(a2 < 6);
        return;
    }
    SaveRankingsEntry *r6 = a0->array[a1];
    for (int i = a2; i < 5; ++i) {
        r6[i] = r6[i + 1];
    }
    RankingEntry_Init(&r6[5]);
    SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
}

u32 sub_0202E58C(void) {
    return 0x138;  // TODO: what is this?
}

static u32 *Save_RankingSys_GetPlayerStats(SaveData *saveData, HeapID heapId) {
    int i;
    u32 val;
    GAME_STATS *gameStats;
    FRONTIER_SAVE *frontierSave;
    u32 *ret;

    gameStats = Save_GameStats_Get(saveData);
    frontierSave = Save_Frontier_GetStatic(saveData);
    ret = AllocFromHeapAtEnd(heapId, 13 * sizeof(u32));

    for (i = 0; i < RANKINGS_COUNT; ++i) {
        switch (i) {
        case RANKINGS_RECORD_BATTLE_TOWER_AVG_WIN_STREAK: {
            val = GameStats_GetCapped(gameStats, GAME_STAT_UNK16);
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
                val = ret[10] * 100 / val;
            }
            ret[i] = val;
            break;
        }
        default:
            if (i >= 0 && i <= 4) {
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

SaveRankingsEntry *Save_GetPlayerRankingEntry(SaveData *saveData, HeapID heapId) {
    int i;
    int groupId;
    SaveRankingsEntry *ret;
    u32 *tmp;
    String *name;
    PlayerProfile *profile;

    profile = Save_PlayerData_GetProfileAddr(saveData);
    ret = AllocFromHeapAtEnd(heapId, 13 * sizeof(SaveRankingsEntry));
    MI_CpuClear8(ret, 13 * sizeof(SaveRankingsEntry));
    groupId = Save_FriendGroup_GetGroupId(Save_FriendGroup_Get(saveData), 1);
    name = PlayerProfile_GetPlayerName_NewString(profile, heapId);
    tmp = Save_RankingSys_GetPlayerStats(saveData, heapId);

    for (i = 0; i < RANKINGS_COUNT; ++i) {
        ret[i].groupId = groupId;
        CopyStringToU16Array(name, ret[i].playerName, PLAYER_NAME_LENGTH + 1);
        ret[i].stat = tmp[i];
    }

    FreeToHeap(tmp);
    String_Delete(name);
    SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
    return ret;
}

static void SaveRankingsEntry_InitArrayOf6(SaveRankingsEntry *entries) {
    for (int i = 0; i < 6; ++i) {
        RankingEntry_Init(&entries[i]);
    }
}

static BOOL SaveRankingsEntry_TestEqual(const SaveRankingsEntry *lhs, const SaveRankingsEntry *rhs) {
    if (lhs->groupId != rhs->groupId) {
        return FALSE;
    }
    return !StringNotEqual(lhs->playerName, rhs->playerName);
}

static BOOL sub_0202E72C(const UnkStruct_0202E920 *a0, const SaveRankingsEntry *a1) {
    for (int i = 0; i < a0->count_sub1; ++i) {
        if (SaveRankingsEntry_TestEqual(a0->rankings[i], a1)) {
            return TRUE;
        }
    }

    return FALSE;
}

static void sub_0202E75C(SaveRankings *saveRankings, UnkStruct_0202E920 *a1, int a2, u8 statIdx, u8 scope, SaveRankingsEntry **a5, u8 a6, HeapID unused) {
    SaveRankingsEntry *saveRecordsPtr;
    int i;
    int j;

    MI_CpuClear8(a1, sizeof(UnkStruct_0202E920));
    if (scope == RANKINGS_SCOPE_GLOBAL) {
        saveRecordsPtr = saveRankings->array[statIdx];
        MI_CpuCopy8(saveRecordsPtr, a1->unk_50, 6 * sizeof(SaveRankingsEntry));
        for (i = 0; i < a6; ++i) {
            a1->rankings[a1->count_sub1++] = &a5[i][statIdx];
        }
        for (i = 0; i < 6; ++i) {
            if (sub_0202E4E0(&a1->unk_50[i]) && !sub_0202E72C(a1, &a1->unk_50[i])) {
                a1->unk_38[a1->count_sub2++] = &a1->unk_50[i];
            }
        }
    } else {
        saveRecordsPtr = saveRankings->array[statIdx + RANKINGS_COUNT];
        MI_CpuCopy8(saveRecordsPtr, a1->unk_50, 6 * sizeof(SaveRankingsEntry));
        for (i = 0; i < a6; ++i) {
            if (a5[i][statIdx].groupId != 0 && a2 == a5[i][statIdx].groupId) {
                a1->rankings[a1->count_sub1++] = &a5[i][statIdx];
            }
        }
        for (i = 0; i < 6; ++i) {
            if (sub_0202E4E0(&a1->unk_50[i]) && a1->unk_50[i].groupId == a2 && !sub_0202E72C(a1, &a1->unk_50[i])) {
                a1->unk_38[a1->count_sub2++] = &a1->unk_50[i];
            }
        }
    }
    a1->count_total = a1->count_sub1 + a1->count_sub2;
    for (i = 0; i < a1->count_sub2; ++i) {
        a1->rankings[i + a1->count_sub1] = a1->unk_38[i];
    }
    for (i = 0; i < a1->count_total - 1; ++i) {
        for (j = a1->count_total - 1; j > i; --j) {
            if (a1->rankings[i]->stat < a1->rankings[j]->stat) {
                SaveRankingsEntry *tmp = a1->rankings[i];
                a1->rankings[i] = a1->rankings[j];
                a1->rankings[j] = tmp;
            }
        }
    }
    SaveRankingsEntry_InitArrayOf6(saveRecordsPtr);
    for (i = 0; i < 6 && i < a1->count_total; ++i) {
        saveRecordsPtr[i] = *a1->rankings[i];
    }
}

static void sub_0202E920(SaveRankings *a0, int a1, u8 a2, SaveRankingsEntry **a3, u8 a4, HeapID heapId) {
    UnkStruct_0202E920 *temp = AllocFromHeapAtEnd(heapId, sizeof(UnkStruct_0202E920));
    sub_0202E75C(a0, temp, a1, a2, 0, a3, a4, heapId);
    if (a1 != 0) {
        sub_0202E75C(a0, temp, a1, a2, 1, a3, a4, heapId);
    }
    FreeToHeap(temp);
}

void sub_0202E97C(SaveData *saveData, u8 a1, u8 a2, SaveRankingsEntry **a3, HeapID heapId) {
    u8 i;
    u8 cnt;
    SaveRankingsEntry *sp10[5];
    int groupId;
    SaveRankings *sp8;

    sp8 = sub_0202E530(saveData);
    groupId = Save_FriendGroup_GetGroupId(Save_FriendGroup_Get(saveData), 1);
    cnt = 0;
    for (i = 0; i < a2; ++i) {
        if (i != a1 && a3[i] != NULL) {
            sp10[cnt++] = a3[i];
        }
    }
    if (cnt != 0) {
        for (i = 0; i < 13; ++i) {
            sub_0202E920(sp8, groupId, i, sp10, cnt, heapId);
        }
        SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
    }
}

UnkStruct_0202E9FC *sub_0202E9FC(SaveData *saveData, int page, HeapID heapId) {
    int i;
    int pageOffset;
    UnkStruct_0202E9FC *ret;
    int groupId;
    u32 *tmp;
    PlayerProfile *profile;

    profile = Save_PlayerData_GetProfileAddr(saveData);
    ret = AllocFromHeap(heapId, sizeof(UnkStruct_0202E9FC));
    MI_CpuClear8(ret, sizeof(UnkStruct_0202E9FC));
    groupId = Save_FriendGroup_GetGroupId(Save_FriendGroup_Get(saveData), 1);
    tmp = Save_RankingSys_GetPlayerStats(saveData, heapId);
    ret->count = RankingsViewSys_GetNumRecordsPerPage(page);
    pageOffset = RankingsViewSys_GetFirstRecordIndexOnPage(page);
    for (i = 0; i < ret->count; ++i) {
        ret->unk_04[i].groupId = groupId;
        ret->unk_04[i].stat = tmp[i + pageOffset];
        ret->unk_04[i].playerName = PlayerProfile_GetPlayerName_NewString(profile, heapId);
    }
    FreeToHeap(tmp);
    return ret;
}

UnkStruct_0202E9FC *sub_0202EA80(SaveRankings *saveRankings, int a1, HeapID heapId) {
    int i;
    UnkStruct_0202E9FC *ret;

    ret = AllocFromHeap(heapId, sizeof(UnkStruct_0202E9FC));
    MI_CpuClear8(ret, sizeof(UnkStruct_0202E9FC));
    for (i = 0; i < 6; ++i) {
        if (sub_0202E4E0(&saveRankings->array[a1][i])) {
            ret->unk_04[ret->count].groupId = saveRankings->array[a1][i].groupId;
            ret->unk_04[ret->count].stat = saveRankings->array[a1][i].stat;
            ret->unk_04[ret->count].playerName = String_New(PLAYER_NAME_LENGTH + 1, heapId);
            CopyU16ArrayToString(ret->unk_04[ret->count].playerName, saveRankings->array[a1][i].playerName);
            ++ret->count;
        }
    }
    return ret;
}

void sub_0202EAFC(UnkStruct_0202E9FC *a0) {
    int i;

    for (i = 0; i < 6; ++i) {
        if (a0->unk_04[i].playerName != NULL) {
            String_Delete(a0->unk_04[i].playerName);
        }
    }
    MI_CpuClear8(a0, sizeof(UnkStruct_0202E9FC));
    FreeToHeap(a0);
    SaveSubstruct_UpdateCRC(SAVE_RANKINGS);
}
