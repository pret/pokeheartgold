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

struct UnkStruct_0202E4B0_sub {
    int unk_00;
    u32 unk_04;
    u16 unk_08[PLAYER_NAME_LENGTH + 1];
};

struct UnkStruct_0202E4B0 {
    UnkStruct_0202E4B0_sub unk_000[26][6];
};

typedef struct UnkStruct_0202E920_sub {
    u8 filler_00[0x90];
} UnkStruct_0202E920_sub;

typedef struct UnkStruct_0202E920 {
    int unk_00;
    int unk_04;
    int unk_08;
    UnkStruct_0202E4B0_sub *unk_0C[11];
    UnkStruct_0202E4B0_sub *unk_38[6];
    UnkStruct_0202E4B0_sub unk_50[6];
} UnkStruct_0202E920;

void sub_0202E4C8(UnkStruct_0202E4B0_sub *a0);
BOOL sub_0202E4E0(UnkStruct_0202E4B0_sub *a0);
u32 *sub_0202E594(SaveData *saveData, HeapID heapId);
void sub_0202E6F0(UnkStruct_0202E4B0_sub *a0);
BOOL sub_0202E708(const UnkStruct_0202E4B0_sub *a0, const UnkStruct_0202E4B0_sub *a1);
BOOL sub_0202E72C(const UnkStruct_0202E920 *a0, const UnkStruct_0202E4B0_sub *a1);
void sub_0202E75C(UnkStruct_0202E4B0 *a0, UnkStruct_0202E920 *a1, u8 a2, u8 a3, u8 a4, UnkStruct_0202E4B0_sub **a5, u8 a6, HeapID heapId);
void sub_0202E920(UnkStruct_0202E4B0 *a0, u8 a1, u8 a2, UnkStruct_0202E4B0_sub **a3, u8 a4, HeapID heapId);

static const u8 _020F684C[][2] = {
    {  6,  0 },
    {  4,  6 },
    {  3, 10 },
};

static const int _020F6854[] = {
    0,
    2,
    4,
    6,
    8,
    GAME_STAT_UNK30,
    GAME_STAT_UNK42,
    GAME_STAT_UNK10,
    GAME_STAT_UNK12,
    GAME_STAT_UNK11,
    GAME_STAT_UNK93,
    GAME_STAT_UNK91,
    GAME_STAT_UNK95,
};

u8 sub_0202E4B0(int a0) {
    return _020F684C[a0][0];
}

u8 sub_0202E4BC(int a0) {
    return _020F684C[a0][1];
}

void sub_0202E4C8(UnkStruct_0202E4B0_sub *a0) {
    a0->unk_00 = 0;
    a0->unk_04 = 0;
    StringFillEOS(a0->unk_08, PLAYER_NAME_LENGTH + 1);
    SaveSubstruct_UpdateCRC(SAVE_UNK_24);
}

BOOL sub_0202E4E0(UnkStruct_0202E4B0_sub *a0) {
    return StringLength(a0->unk_08) != 0;
}

u32 sub_0202E4F4(void) {
    return sizeof(UnkStruct_0202E4B0);
}

void sub_0202E4FC(UnkStruct_0202E4B0 *a0) {
    MI_CpuClear8(a0, sizeof(UnkStruct_0202E4B0));
    for (int i = 0; i < 26; ++i) {
        for (int j = 0; j < 6; ++j) {
            sub_0202E4C8(&a0->unk_000[i][j]);
        }
    }
    SaveSubstruct_UpdateCRC(SAVE_UNK_24);
}

UnkStruct_0202E4B0 *sub_0202E530(SaveData *saveData) {
    SaveSubstruct_AssertCRC(SAVE_UNK_24);
    return SaveArray_Get(saveData, SAVE_UNK_24);
}

void sub_0202E544(UnkStruct_0202E4B0 *a0, int a1, u32 a2) {
    if (a2 >= 6) {
        GF_ASSERT(a2 < 6);
        return;
    }
    UnkStruct_0202E4B0_sub *r6 = a0->unk_000[a1];
    for (int i = a2; i < 5; ++i) {
        r6[i] = r6[i + 1];
    }
    sub_0202E4C8(&r6[5]);
    SaveSubstruct_UpdateCRC(SAVE_UNK_24);
}

u32 sub_0202E58C(void) {
    return 0x138;  // TODO: what is this?
}

u32 *sub_0202E594(SaveData *saveData, HeapID heapId) {
    int i;
    u32 val;
    GAME_STATS *gameStats;
    FRONTIER_SAVE *frontierSave;
    u32 *ret;

    gameStats = Save_GameStats_Get(saveData);
    frontierSave = sub_0203107C(saveData);
    ret = AllocFromHeapAtEnd(heapId, 13 * sizeof(u32));

    for (i = 0; i < 13; ++i) {
        switch (i) {
        case 5: {
            val = GameStats_GetCapped(gameStats, GAME_STAT_UNK16);
            if (val != 0) {
                val = GameStats_GetCapped(gameStats, GAME_STAT_UNK30) / val;
            }
            ret[i] = val;
            break;
        }
        case 10: {
            val = GameStats_GetCapped(gameStats, GAME_STAT_UNK93);
            val += GameStats_GetCapped(gameStats, GAME_STAT_UNK94);
            ret[i] = val;
            break;
        }
        case 11: {
            val = GameStats_GetCapped(gameStats, GAME_STAT_UNK91);
            val += GameStats_GetCapped(gameStats, GAME_STAT_UNK92);
            if (val != 0) {
                val = ret[10] * 100 / val;
            }
            ret[i] = val;
            break;
        }
        default:
            if (i >= 0 && i <= 4) {
                ret[i] = sub_020310BC(frontierSave, _020F6854[i], 0xFF);
            } else {
                ret[i] = GameStats_GetCapped(gameStats, _020F6854[i]);
            }
            break;
        }
    }
    SaveSubstruct_UpdateCRC(SAVE_UNK_24);
    return ret;
}

UnkStruct_0202E4B0_sub *sub_0202E66C(SaveData *saveData, HeapID heapId) {
    int i;
    int sp8;
    UnkStruct_0202E4B0_sub *ret;
    u32 *sp0;
    String *name;
    PlayerProfile *profile;

    profile = Save_PlayerData_GetProfileAddr(saveData);
    ret = AllocFromHeapAtEnd(heapId, 13 * sizeof(UnkStruct_0202E4B0_sub));
    MI_CpuClear8(ret, 13 * sizeof(UnkStruct_0202E4B0_sub));
    sp8 = sub_0202C7B4(Save_FriendGroup_Get(saveData), 1);
    name = PlayerProfile_GetPlayerName_NewString(profile, heapId);
    sp0 = sub_0202E594(saveData, heapId);

    for (i = 0; i < 13; ++i) {
        ret[i].unk_00 = sp8;
        CopyStringToU16Array(name, ret[i].unk_08, PLAYER_NAME_LENGTH + 1);
        ret[i].unk_04 = sp0[i];
    }

    FreeToHeap(sp0);
    String_Delete(name);
    SaveSubstruct_UpdateCRC(SAVE_UNK_24);
    return ret;
}

void sub_0202E6F0(UnkStruct_0202E4B0_sub *a0) {
    for (int i = 0; i < 6; ++i) {
        sub_0202E4C8(&a0[i]);
    }
}

BOOL sub_0202E708(const UnkStruct_0202E4B0_sub *a0, const UnkStruct_0202E4B0_sub *a1) {
    if (a0->unk_00 != a1->unk_00) {
        return FALSE;
    }
    return !StringNotEqual(a0->unk_08, a1->unk_08);
}

BOOL sub_0202E72C(const UnkStruct_0202E920 *a0, const UnkStruct_0202E4B0_sub *a1) {
    for (int i = 0; i < a0->unk_04; ++i) {
        if (sub_0202E708(a0->unk_0C[i], a1)) {
            return TRUE;
        }
    }

    return FALSE;
}

void sub_0202E75C(UnkStruct_0202E4B0 *a0, UnkStruct_0202E920 *a1, u8 a2, u8 a3, u8 a4, UnkStruct_0202E4B0_sub **a5, u8 a6, HeapID unused) {
    UnkStruct_0202E4B0_sub *sp8;
    int i;
    int j;

    MI_CpuClear8(a1, sizeof(UnkStruct_0202E920));
    if (a4 == 0) {
        sp8 = a0->unk_000[a3];
        MI_CpuCopy8(sp8, a1->unk_50, 6 * sizeof(UnkStruct_0202E4B0_sub));
        for (i = 0; i < a6; ++i) {
            a1->unk_0C[a1->unk_04++] = &a5[i][a3];
        }
        for (i = 0; i < 6; ++i) {
            if (sub_0202E4E0(&a1->unk_50[i]) && !sub_0202E72C(a1, &a1->unk_50[i])) {
                a1->unk_38[a1->unk_00++] = &a1->unk_50[i];
            }
        }
    } else {
        sp8 = a0->unk_000[a3 + 13];
        MI_CpuCopy8(sp8, a1->unk_50, 6 * sizeof(UnkStruct_0202E4B0_sub));
        for (i = 0; i < a6; ++i) {
            if (a5[i][a3].unk_00 != 0 && a2 == a5[i][a3].unk_00) {
                a1->unk_0C[a1->unk_04++] = &a5[i][a3];
            }
        }
        for (i = 0; i < 6; ++i) {
            if (sub_0202E4E0(&a1->unk_50[i]) && a1->unk_50[i].unk_00 == a2 && !sub_0202E72C(a1, &a1->unk_50[i])) {
                a1->unk_38[a1->unk_00++] = &a1->unk_50[i];
            }
        }
    }
    a1->unk_08 = a1->unk_04 + a1->unk_00;
    for (i = 0; i < a1->unk_00; ++i) {
        a1->unk_0C[i + a1->unk_04] = a1->unk_38[i];
    }
    for (i = 0; i < a1->unk_08 - 1; ++i) {
        for (j = a1->unk_08 - 1; j > i; --j) {
            if (a1->unk_0C[i]->unk_04 < a1->unk_0C[j]->unk_04) {
                UnkStruct_0202E4B0_sub *tmp = a1->unk_0C[i];
                a1->unk_0C[i] = a1->unk_0C[j];
                a1->unk_0C[j] = tmp;
            }
        }
    }
    sub_0202E6F0(sp8);
    for (i = 0; i < 6 && i < a1->unk_08; ++i) {
        sp8[i] = *a1->unk_0C[i];
    }
}

void sub_0202E920(UnkStruct_0202E4B0 *a0, u8 a1, u8 a2, UnkStruct_0202E4B0_sub **a3, u8 a4, HeapID heapId) {
    UnkStruct_0202E920 *r6 = AllocFromHeapAtEnd(heapId, sizeof(UnkStruct_0202E920));
    sub_0202E75C(a0, r6, a1, a2, 0, a3, a4, heapId);
    if (a1 != 0) {
        sub_0202E75C(a0, r6, a1, a2, 1, a3, a4, heapId);
    }
    FreeToHeap(r6);
}

void sub_0202E97C(SaveData *saveData, u8 a1, u8 a2, UnkStruct_0202E4B0_sub **a3, HeapID heapId) {
    u8 i;
    u8 cnt;
    UnkStruct_0202E4B0_sub *sp10[5];
    u8 spC;
    UnkStruct_0202E4B0 *sp8;

    sp8 = sub_0202E530(saveData);
    spC = sub_0202C7B4(Save_FriendGroup_Get(saveData), 1);
    cnt = 0;
    for (i = 0; i < a2; ++i) {
        if (i != a1 && a3[i] != NULL) {
            sp10[cnt++] = a3[i];
        }
    }
    if (cnt != 0) {
        for (i = 0; i < 13; ++i) {
            sub_0202E920(sp8, spC, i, sp10, cnt, heapId);
        }
        SaveSubstruct_UpdateCRC(SAVE_UNK_24);
    }
}
