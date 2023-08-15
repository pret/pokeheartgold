#include "global.h"
#include "field_system.h"
#include "gf_rtc.h"
#include "game_stats.h"
#include "constants/game_stat.h"

struct UnkStruct_021D4178 {
    u8 filler_00[0x30];
    u8 unk_30[6];
    u8 filler_36[0xA];
    s64 timestamp;
    int unk_48;
};

struct UnkStruct_021D4178 _021D4178;

extern void sub_0205592C(FieldSystem* fsys, struct UnkStruct_021D4178* unk);
extern void sub_020559D0(struct UnkStruct_021D4178* unk);

void sub_020557E0(void);
void sub_020557F8(FieldSystem* fsys);
void sub_02055828(FieldSystem* fsys);

void sub_020557E0(void) {
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
