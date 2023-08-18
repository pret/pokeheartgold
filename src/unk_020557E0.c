#include "global.h"
#include "field_system.h"
#include "gf_rtc.h"
#include "game_stats.h"
#include "save_arrays.h"
#include "math_util.h"
#include "battle_setup.h"
#include "unk_02054648.h"
#include "metatile_behavior.h"
#include "constants/game_stat.h"
#include "unk_020557E0.h"

struct PalParkMon {
    u16 species;
    u8 encounter_tile;
    u8 encounter_rate;
    u16 score;
    u8 type1;
    u8 type2;
};

struct PalParkLocal {
    struct PalParkMon mons[PARTY_SIZE];
    u8 caught_order[PARTY_SIZE];
    s32 unk_38;
    s32 encounter_index;
    s64 timestamp; // 40
    int unk_48;
};

typedef enum UnkEnum_02055A00 {
    UNK_02055A00_0,
    UNK_02055A00_1,
    UNK_02055A00_2,
    UNK_02055A00_3,
    UNK_02055A00_4,
    UNK_02055A00_5,
    UNK_02055A00_6,
    UNK_02055A00_7,
    UNK_02055A00_8,
} UnkEnum_02055A00;

struct PalParkLocal _021D4178;

void sub_02055900(u16 species, u8* dest);
void sub_0205592C(FieldSystem* fsys, struct PalParkLocal* palpark);
int sub_020559B4(struct PalParkLocal* palpark);
void sub_020559D0(struct PalParkLocal* palpark);
BOOL sub_020559E8(struct PalParkLocal* palpark);
UnkEnum_02055A00 sub_02055A00(FieldSystem* fsys, int x, int y);
BOOL sub_02055A48(FieldSystem* fsys, struct PalParkLocal* palpark, int x, int y);
BATTLE_SETUP* sub_02055B1C(FieldSystem* fsys, struct PalParkLocal* palpark);
void sub_02055AF4(FieldSystem *fsys, BATTLE_SETUP *setup, struct PalParkLocal* palpark);
int sub_02055B68(struct PalParkLocal* palpark);
u32 sub_02055B7C(struct PalParkLocal* palpark);
int sub_02055BEC(struct PalParkLocal* palpark);

void sub_020557E0(FieldSystem* fsys) {
    s32 i;
    struct PalParkLocal* local = &_021D4178;
    for (i = 0; i < PARTY_SIZE; ++i) {
        local->caught_order[i] = 0;
    }
}

void sub_020557F8(FieldSystem* fsys) {
    MI_CpuClearFast(&_021D4178, sizeof _021D4178);
    sub_0205592C(fsys, &_021D4178);
    sub_020559D0(&_021D4178);
    _021D4178.timestamp = GF_RTC_DateTimeToSec();
}

void sub_02055828(FieldSystem* fsys) {
    struct PalParkLocal* local = &_021D4178;
    GAME_STATS* stats = Save_GameStats_Get(fsys->savedata);
    s64 elapsed = GF_RTC_TimeDelta(local->timestamp, GF_RTC_DateTimeToSec());
    if (elapsed < 1000) {
        local->unk_48 = 2 * (1000 - elapsed);
    } else {
        local->unk_48 = 0;
    }
    GameStats_AddSpecial(stats, GAME_STAT_UNK17);
}

BOOL sub_02055874(FieldSystem* fsys, int x, int y) {
    if (sub_020559E8(&_021D4178) == TRUE) {
        return sub_02055A48(fsys, &_021D4178, x, y);
    }
    return FALSE;
}

BATTLE_SETUP* sub_0205589C(FieldSystem* fsys) {
    return sub_02055B1C(fsys, &_021D4178);
}

void sub_020558AC(FieldSystem *fsys, BATTLE_SETUP *setup) {
    return sub_02055AF4(fsys, setup, &_021D4178);
}

int sub_020558BC(FieldSystem* fsys) {
    return 6 - sub_020559B4(&_021D4178);
}

int sub_020558D0(FieldSystem* fsys) {
    return sub_02055B68(&_021D4178);
}

int sub_020558E0(FieldSystem *fsys) {
    return sub_02055BEC(&_021D4178);
}

u32 sub_020558F0(FieldSystem *fsys) {
    return sub_02055B7C(&_021D4178);
}

void sub_02055900(u16 species, u8* dest) {
    GF_ASSERT(species != SPECIES_NONE && species <= SPECIES_ARCEUS);
    ReadFromNarcMemberByIdPair(dest, NARC_a_1_2_5, 0, (species - 1) * 6, 6);
}

void sub_0205592C(FieldSystem* fsys, struct PalParkLocal* palpark) {
    struct UnkStruct_0202EB30* sp4 = sub_020270F8(fsys->savedata);
    Pokemon* mon = AllocMonZeroed(HEAP_ID_4);
    u8 narc_data[6];
    u16 species;
    for (int i = 0; i < PARTY_SIZE; ++i) {
        palpark->caught_order[i] = 0;
        sub_0202EC70(sp4, i, mon);
        palpark->mons[i].species = species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        sub_02055900(species, narc_data);
        if (narc_data[0] != 0) {
            palpark->mons[i].encounter_tile = narc_data[0];    
        } else {
            palpark->mons[i].encounter_tile = narc_data[1] + 4;
        }
        palpark->mons[i].encounter_rate = narc_data[3];
        palpark->mons[i].score = narc_data[2];
        palpark->mons[i].type1 = GetMonData(mon, MON_DATA_TYPE_1, NULL);
        palpark->mons[i].type2 = GetMonData(mon, MON_DATA_TYPE_2, NULL);
    }
    FreeToHeap(mon);
}

int sub_020559B4(struct PalParkLocal* palpark) {
    int i;
    int total = 0;
    for (i = 0; i < PARTY_SIZE; ++i) {
        if (palpark->caught_order[i] != 0) {
            ++total;
        }
    }
    return total;
}

void sub_020559D0(struct PalParkLocal* palpark) {
    u16 rnd = LCRandom() % 10;
    palpark->unk_38 = rnd + 5;
}

BOOL sub_020559E8(struct PalParkLocal* palpark) {
    if (--palpark->unk_38 == 0) {
        sub_020559D0(palpark);
        return TRUE;
    }
    return FALSE;
}

UnkEnum_02055A00 sub_02055A00(FieldSystem* fsys, int x, int y) {
    int behavior = GetMetatileBehaviorAt(fsys, x, y);
    int r5 = (x >= 32 ? 1 : 0);
    r5 += (y < 32 ? 0 : 2);
    if (sub_0205B6E8(behavior)) {
        return (UnkEnum_02055A00)(r5 + UNK_02055A00_1);
    }
    if (sub_0205B778(behavior)) {
        return (UnkEnum_02055A00)(r5 + UNK_02055A00_5);
    }
    return UNK_02055A00_0;
}

BOOL sub_02055A48(FieldSystem* fsys, struct PalParkLocal* palpark, int x, int y) {
    int i;
    int rnd, total_rate = 0;
    UnkEnum_02055A00 standing_tile = sub_02055A00(fsys, x, y);

    if (standing_tile == UNK_02055A00_0) {
        return FALSE;
    }
    for (i = 0; i < PARTY_SIZE; ++i) {
        if (palpark->caught_order[i] == 0 && palpark->mons[i].encounter_tile == standing_tile) {
            total_rate += palpark->mons[i].encounter_rate;
        }
    }
    if (total_rate == 0) {
        return FALSE;
    }
    rnd = LCRandRange(total_rate + 20);
    if (rnd < 20) {
        return FALSE;
    }
    rnd -= 20;
    for (i = 0; i < PARTY_SIZE; ++i) {
        if (palpark->caught_order[i] == 0 && palpark->mons[i].encounter_tile == standing_tile) {
            if (rnd < palpark->mons[i].encounter_rate) {
                palpark->encounter_index = i;
                return TRUE;
            } else {
                rnd -= palpark->mons[i].encounter_rate;
            }
        }
    }
    GF_ASSERT(0);
    return FALSE;
}

void sub_02055AF4(FieldSystem *fsys, BATTLE_SETUP *setup, struct PalParkLocal* palpark) {
    switch (setup->winFlag) {
    case 4:
        palpark->caught_order[palpark->encounter_index] = sub_020559B4(palpark) + 1;
        break;
    case 5:
        break;
    default:
        GF_ASSERT(0);
    }
}

BATTLE_SETUP* sub_02055B1C(FieldSystem* fsys, struct PalParkLocal* palpark) {
    Pokemon* mon = AllocMonZeroed(HEAP_ID_32);
    struct UnkStruct_0202EB30* migratedMons = sub_020270F8(fsys->savedata);
    BATTLE_SETUP* ret = sub_02051A98(HEAP_ID_FIELD, sub_020558BC(fsys));
    BattleSetup_InitFromFsys(ret, fsys);
    sub_0202EC70(migratedMons, palpark->encounter_index, mon);
    sub_02051C9C(ret, mon, 1);
    FreeToHeap(mon);
    return ret;
}

int sub_02055B68(struct PalParkLocal* palpark) {
    int i, score = 0;
    for (i = 0; i < PARTY_SIZE; ++i) {
        score += palpark->mons[i].score;
    }
    return score;
}

u32 sub_02055B7C(struct PalParkLocal* palpark) {
    int j, i;
    u8 type1, type2, last_type1, last_type2;
    u32 seen_types = 0, score = 0;
    for (i = 1; i < PARTY_SIZE + 1; ++i) {
        for (j = 0; j < PARTY_SIZE; ++j) {
            if (palpark->caught_order[j] == i) {
                type1 = palpark->mons[j].type1;
                type2 = palpark->mons[j].type2;
                if (i != 1 && last_type1 != type1 && last_type1 != type2 && last_type2 != type1 && last_type2 != type2) {
                    score += 200;
                }
                last_type1 = type1;
                last_type2 = type2;
                seen_types |= 1 << type1;
                seen_types |= 1 << type2;
                break;
            }
        }
    }
    while (seen_types != 0) {
        if (seen_types & 1) {
            score += 50;
        }
        seen_types >>= 1;
    }
    return score;
}

int sub_02055BEC(struct PalParkLocal* palpark) {
    return palpark->unk_48;
}
