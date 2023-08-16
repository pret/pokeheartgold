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

struct UnkStruct_021D4178_sub {
    u16 species;
    u8 unk_2;
    u8 unk_3;
    u16 unk_4;
    u8 type1;
    u8 type2;
};

struct UnkStruct_021D4178 {
    struct UnkStruct_021D4178_sub unk_00[PARTY_SIZE];
    u8 unk_30[PARTY_SIZE];
    u8 filler_36[2];
    s32 unk_38;
    s32 unk_3C;
    s64 timestamp; // 40
    int unk_48;
};

struct UnkStruct_021D4178 _021D4178;

void sub_02055900(u16 species, u8* dest);
void sub_0205592C(FieldSystem* fsys, struct UnkStruct_021D4178* unk);
int sub_020559B4(struct UnkStruct_021D4178* unk);
void sub_020559D0(struct UnkStruct_021D4178* unk);
BOOL sub_020559E8(struct UnkStruct_021D4178* unk);
int sub_02055A00(FieldSystem* fsys, int x, int y);
BOOL sub_02055A48(FieldSystem* fsys, struct UnkStruct_021D4178* unk, int x, int y);
BATTLE_SETUP* sub_02055B1C(FieldSystem* fsys, struct UnkStruct_021D4178* unk);
void sub_02055AF4(FieldSystem *fsys, BATTLE_SETUP *setup, struct UnkStruct_021D4178* unk);
int sub_02055B68(struct UnkStruct_021D4178* unk);
int sub_02055BEC(struct UnkStruct_021D4178* unk);
int sub_02055B7C(struct UnkStruct_021D4178* unk);

void sub_020557E0(FieldSystem* fsys) {
    s32 i;
    struct UnkStruct_021D4178* r3 = &_021D4178;
    for (i = 0; i < 6; ++i) {
        r3->unk_30[i] = 0;
    }
}

void sub_020557F8(FieldSystem* fsys) {
    MI_CpuClearFast(&_021D4178, sizeof _021D4178);
    sub_0205592C(fsys, &_021D4178);
    sub_020559D0(&_021D4178);
    _021D4178.timestamp = GF_RTC_DateTimeToSec();
}

void sub_02055828(FieldSystem* fsys) {
    struct UnkStruct_021D4178* r4 = &_021D4178;
    GAME_STATS* stats = Save_GameStats_Get(fsys->savedata);
    s64 elapsed = GF_RTC_TimeDelta(r4->timestamp, GF_RTC_DateTimeToSec());
    if (elapsed < 1000) {
        r4->unk_48 = 2 * (1000 - elapsed);
    } else {
        r4->unk_48 = 0;
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

int sub_020558F0(FieldSystem *fsys) {
    return sub_02055B7C(&_021D4178);
}

void sub_02055900(u16 species, u8* dest) {
    GF_ASSERT(species != SPECIES_NONE && species <= SPECIES_ARCEUS);
    ReadFromNarcMemberByIdPair(dest, NARC_a_1_2_5, 0, (species - 1) * 6, 6);
}

void sub_0205592C(FieldSystem* fsys, struct UnkStruct_021D4178* unk) {
    struct UnkStruct_0202EB30* sp4 = sub_020270F8(fsys->savedata);
    Pokemon* mon = AllocMonZeroed(HEAP_ID_4);  // r4
    u8 sp8[6];
    u16 species;
    for (int i = 0; i < PARTY_SIZE; ++i) {
        unk->unk_30[i] = 0;
        sub_0202EC70(sp4, i, mon);
        unk->unk_00[i].species = species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        sub_02055900(species, sp8);
        if (sp8[0] != 0) {
            unk->unk_00[i].unk_2 = sp8[0];    
        } else {
            unk->unk_00[i].unk_2 = sp8[1] + 4;
        }
        unk->unk_00[i].unk_3 = sp8[3];
        unk->unk_00[i].unk_4 = sp8[2];
        unk->unk_00[i].type1 = GetMonData(mon, MON_DATA_TYPE_1, NULL);
        unk->unk_00[i].type2 = GetMonData(mon, MON_DATA_TYPE_2, NULL);
    }
    FreeToHeap(mon);
}

int sub_020559B4(struct UnkStruct_021D4178* unk) {
    int i;
    int total = 0;
    for (i = 0; i < PARTY_SIZE; ++i) {
        if (unk->unk_30[i]) {
            ++total;
        }
    }
    return total;
}

void sub_020559D0(struct UnkStruct_021D4178* unk) {
    u16 rnd = LCRandom() % 10;
    unk->unk_38 = rnd + 5;
}

BOOL sub_020559E8(struct UnkStruct_021D4178* unk) {
    if (--unk->unk_38 == 0) {
        sub_020559D0(unk);
        return TRUE;
    }
    return FALSE;
}

int sub_02055A00(FieldSystem* fsys, int x, int y) {
    int behavior = GetMetatileBehaviorAt(fsys, x, y);
    int r5 = (x >= 32 ? 1 : 0);
    r5 += (y < 32 ? 0 : 2);
    if (sub_0205B6E8(behavior)) {
        return r5 + 1;
    }
    if (sub_0205B778(behavior)) {
        return r5 + 5;
    }
    return 0;
}
