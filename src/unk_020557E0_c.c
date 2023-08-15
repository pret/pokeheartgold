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

void sub_0205592C(FieldSystem* fsys, struct UnkStruct_021D4178* unk);
void sub_021559D0(struct UnkStruct_021D4178* unk);

void sub_020557E0(void) {
    for (int i = 0; i < 6; ++i) {
        _021D4178.unk_30[i] = 0;
    }
}

void sub_020557F8(FieldSystem* fsys) {
    MI_CpuClearFast(&_021D4178, sizeof _021D4178);
    sub_0205592C(fsys, &_021D4178);
    sub_020559D0(&_021D4178);
    _021D4178.timestamp = GF_RTC_DateTimeToSec();
}

void sub_02055828(FieldSystem* fsys) {
    GAME_STATS* stats = Save_GameStats_Get(fsys->savedata);
    s64 elapsed = GF_RTC_TimeDelta(_021D4178.timestamp, GF_RTC_DateTimeToSec());
    if (elapsed < 1000) {
        _021D4178.unk_48 = 2 * (1000 - elapsed);
    } else {
        _021D4178.unk_48 = 0;
    }
    GameStats_AddSpecial(stats, GAME_STAT_UNK17);
}
