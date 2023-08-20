#include "global.h"
#include "battle_setup.h"
#include "system.h"
#include "gf_rtc.h"
#include "unk_02035900.h"
#include "constants/battle.h"

BATTLE_SETUP* BattleSetup_New(HeapID heapId, u32 battleTypeFlags) {
    int i;
    BATTLE_SETUP* setup = AllocFromHeap(heapId, sizeof(BATTLE_SETUP));
    MI_CpuClear8(setup, sizeof(BATTLE_SETUP));
    setup->flags = battleTypeFlags;
    setup->unk_18C = 0;
    setup->winFlag = 0;
    setup->unk_14C = 0;
    setup->unk_150 = 24;
    setup->unk_154 = 0;
    setup->unk_15C = 0;
    setup->evolutionLocation = 0;
    setup->unk_164 = 1;
    setup->unk_168 = 1;
    setup->unk_174 = 0;
    for (i = 0; i < 4; ++i) {
        setup->trainerId[i] = 0;
        MI_CpuClear32(&setup->trainer[i], sizeof(TRAINER));
        setup->party[i] = SaveArray_Party_Alloc(heapId);
        setup->profile[i] = PlayerProfile_New(heapId);
        setup->chatot[i] = Chatot_New(heapId);
        setup->unk1CC[i] = 0xFF;
    }
    setup->bag = Save_Bag_New(heapId);
    setup->pokedex = Pokedex_New(heapId);
    setup->options = Options_New(heapId);
    setup->unk_134 = sub_02067A60(heapId);
    setup->unk_10C = NULL;
    setup->unk1B8 = NULL;
    setup->safariBalls = 0;
    setup->unk_12C = NULL;
    setup->unk_144 = NULL;
    setup->unk_194 = NULL;
    setup->bugContestMon = AllocMonZeroed(heapId);

    {
    RTCDate date;
    RTCTime time;
    GF_RTC_CopyDateTime(&date, &time);
    setup->unk_19C = date.year 
        + date.month * 0x100
        * date.day * 0x10000  // BUG: should this be a +?
        + time.hour * 0x10000
        + (time.minute + time.second) * 0x1000000
        + gSystem.vblankCounter;
    }

    if (sub_02037474() == TRUE) {
        for (i = 0; i < sub_02037454(); ++i) {
            setup->unk_1A0[i] = sub_020378AC(i);
        }
        setup->unk1B0 = sub_0203769C();
    }
    MI_CpuClear8(&setup->unk138, sizeof(setup->unk138));
    return setup;
}

BATTLE_SETUP* BattleSetup_New_SafariZone(HeapID heapId, int balls) {
    BATTLE_SETUP* setup = BattleSetup_New(heapId, BATTLE_TYPE_SAFARI);
    setup->safariBalls = balls;
    return setup;
}

BATTLE_SETUP* BattleSetup_New_BugContest(HeapID heapId, int balls, Pokemon* bugmon) {
    BATTLE_SETUP* setup = BattleSetup_New(heapId, BATTLE_TYPE_BUG_CONTEST);
    setup->safariBalls = balls;
    CopyPokemonToPokemon(bugmon, setup->bugContestMon);
    return setup;
}

BATTLE_SETUP* BattleSetup_New_PalPark(HeapID heapId, int balls) {
    BATTLE_SETUP* setup = BattleSetup_New(heapId, BATTLE_TYPE_PAL_PARK);
    setup->safariBalls = balls;
    return setup;
}
