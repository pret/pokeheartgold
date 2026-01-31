#include "field/encounter_check.h"

#include "global.h"

#include "battle/battle_setup.h"
#include "overlay_2/overlay_02_gear_phone.h"

#include "encounter.h"
#include "gf_rtc.h"
#include "map_events.h"
#include "math_util.h"
#include "roamer.h"
#include "script_pokemon_util.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_02054648.h"
#include "unk_02097F6C.h"
#include "wild_encounter.h"

FS_EXTERN_OVERLAY(bug_contest);

typedef struct UnkStruct_ov02_02248618 {
    u32 unk_00;
    BOOL unk_04;
    int unk_08;
    u8 unk_0C;
    u8 unk_0D;
    u8 unk_0E;
    u8 unk_0F;
    u8 unk_10;
    u8 unk_11;
    u8 unk_12;
    int unk_14;
    Pokedex *unk_18;
} UnkStruct_ov02_02248618;

void ov02_02246A84(const ENC_DATA *a0, ENC_SLOT *a1);
void ov02_02246AD4(const ENC_DATA *a0, u8 a1, ENC_SLOT *a2);
void ov02_02246B00(FieldSystem *fieldSystem, const ENC_DATA *a1, ENC_SLOT *a2);
void ov02_02246B58(FieldSystem *fieldSystem, const ENC_DATA *a1, ENC_SLOT *a2, ENC_SLOT *a3);
void ov02_02246B9C(FieldSystem *fieldSystem, const ENC_DATA *a1, ENC_SLOT *a2);
void ov02_02246BD8(FieldSystem *fieldSystem, u8 a1, const ENC_DATA *a2, ENC_SLOT *a3);
BOOL ov02_02247424(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, const ENC_DATA *encData, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5);
BOOL ov02_02247444(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, const ENC_DATA *encData, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5);
BOOL ov02_02247460(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, const ENC_DATA *encData, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5);
BOOL ov02_0224749C(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5);
BOOL ov02_022474E0(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encounterSlots, UnkStruct_ov02_02248618 *a4, BOOL a5);
BOOL ov02_02247514(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4, int rodType, BOOL isSafari);
BOOL ov02_0224754C(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4);
BOOL ov02_02247568(FieldSystem *fieldSystem, u8 a1, u8 metatile);
u8 ov02_0224762C(FieldSystem *fieldSystem, u8 metatileBehavior, u8 *a2);
BOOL ov02_02247B64(Pokemon *leadMon, int rodType, UnkStruct_ov02_02248618 *a2, ENC_SLOT *encSlots, u8 a4, u8 a5, BattleSetup *battleSetup);
BOOL ov02_02247DA0(FieldSystem *fieldSystem, Pokemon *leadMon, int rodType, UnkStruct_ov02_02248618 *a3, u8 a4, u8 a5, BattleSetup *battleSetup);
BOOL ov02_02247ED8(FieldSystem *fieldSystem, Pokemon *leadMon, u8 a2, UnkStruct_ov02_02248618 *a3, u8 a4, u8 a5, BattleSetup *battleSetup);
u8 ov02_02248190(int a0, u8 a1, UnkStruct_ov02_02248618 *a2, u16 a3, Pokemon *a4);
void ov02_02248618(FieldSystem *fieldSystem, Pokemon *pokemon, const ENC_DATA *encData, UnkStruct_ov02_02248618 *a3);
void ov02_02248698(FieldSystem *fieldSystem);
void ApplyFluteEffectToEncounterRate(FieldSystem *fieldSystem, u8 *a1);
void ApplyLeadMonHeldItemEffectToEncounterRate(Pokemon *leadMon, u8 *a1);
BOOL ov02_GetRandomActiveRoamerInCurrMap(FieldSystem *fieldSystem, Roamer **out);
u8 ov02_0224802C(FieldSystem *fieldSystem, u8 a1);
int ov02_022480B4(FieldSystem *fieldSystem);
BOOL ov02_02248290(u8 roamerLevel, UnkStruct_ov02_02248618 *a1);
void ov02_022482BC(u32 otId, Roamer *roamer, BattleSetup *battleSetup);
void ov02_02248244(FieldSystem *fieldSystem, u8 a1, BattleSetup **pBattleSetup);

void ov02_02246A84(const ENC_DATA *a0, ENC_SLOT *a1) {
    TIMEOFDAY timeOfDay = GF_RTC_GetTimeOfDay();
    const u16 *r3;

    if (timeOfDay == RTC_TIMEOFDAY_MORN) {
        r3 = a0->landSlots.species_morn;
    } else if (timeOfDay == RTC_TIMEOFDAY_DAY || timeOfDay == RTC_TIMEOFDAY_EVE) {
        r3 = a0->landSlots.species_day;
    } else if (timeOfDay == RTC_TIMEOFDAY_NITE || timeOfDay == RTC_TIMEOFDAY_LATE) {
        r3 = a0->landSlots.species_nite;
    } else {
        GF_ASSERT(FALSE);
        r3 = a0->landSlots.species_morn;
    }
    for (int i = 0; i < NUM_ENCOUNTERS_LAND; ++i) {
        a1[i].species = r3[i];
        a1[i].level_max = a0->landSlots.levels[i];
        a1[i].level_min = a0->landSlots.levels[i];
    }
}

void ov02_02246AD4(const ENC_DATA *a0, u8 a1, ENC_SLOT *a2) {
    TIMEOFDAY timeOfDay = GF_RTC_GetTimeOfDay();

    if (timeOfDay == RTC_TIMEOFDAY_NITE || timeOfDay == RTC_TIMEOFDAY_LATE) {
        if (a1 == 1) {
            a2[3].species = a0->swarmSpecies[2];
        } else if (a1 == 2) {
            a2[1].species = a0->swarmSpecies[2];
        }
    }
}

void ov02_02246B00(FieldSystem *fieldSystem, const ENC_DATA *a1, ENC_SLOT *a2) {
    if (GetRadioMusicPlayingSeq() == RADIO_MUSIC_SEQ_HOENN_SOUNDS) {
        a2[2].species = a1->hoennSoundsSpecies[0];
        a2[3].species = a1->hoennSoundsSpecies[0];
        a2[4].species = a1->hoennSoundsSpecies[1];
        a2[5].species = a1->hoennSoundsSpecies[1];
    } else if (GetRadioMusicPlayingSeq() == RADIO_MUSIC_SEQ_SINNOH_SOUNDS) {
        a2[2].species = a1->sinnohSoundsSpecies[0];
        a2[3].species = a1->sinnohSoundsSpecies[0];
        a2[4].species = a1->sinnohSoundsSpecies[1];
        a2[5].species = a1->sinnohSoundsSpecies[1];
    }
}

void ov02_02246B58(FieldSystem *fieldSystem, const ENC_DATA *a1, ENC_SLOT *a2, ENC_SLOT *a3) {
    RoamerSaveData *sp0 = Save_Roamers_Get(fieldSystem->saveData);
    if (RoamerSave_OutbreakActive(sp0) && sub_02097F6C(Roamers_GetRand(sp0, 2), fieldSystem->location->mapId, 0)) {
        a2->species = a1->swarmSpecies[0];
        a3->species = a1->swarmSpecies[0];
    }
}

void ov02_02246B9C(FieldSystem *fieldSystem, const ENC_DATA *a1, ENC_SLOT *a2) {
    RoamerSaveData *r7 = Save_Roamers_Get(fieldSystem->saveData);
    if (RoamerSave_OutbreakActive(r7) && sub_02097F6C(Roamers_GetRand(r7, 2), fieldSystem->location->mapId, 1)) {
        a2->species = a1->swarmSpecies[1];
    }
}

void ov02_02246BD8(FieldSystem *fieldSystem, u8 a1, const ENC_DATA *a2, ENC_SLOT *a3) {
    RoamerSaveData *sp0 = Save_Roamers_Get(fieldSystem->saveData);
    if (RoamerSave_OutbreakActive(sp0) && sub_02097F6C(Roamers_GetRand(sp0, 2), fieldSystem->location->mapId, 2)) {
        extern const int ov02_02253290[1];
        int sp8[1];
        ARRAY_ASSIGN(sp8, ov02_02253290);

        extern const int ov02_02253294[3];
        int sp20[3];
        ARRAY_ASSIGN(sp20, ov02_02253294);

        extern const int ov02_022532A0[5];
        int spC[5];
        ARRAY_ASSIGN(spC, ov02_022532A0);

        const int *r3;
        u32 r1;

        switch (a1) {
        case 0:
            r1 = NELEMS(sp8);
            r3 = sp8;
            break;
        case 1:
            r1 = NELEMS(sp20);
            r3 = sp20;
            break;
        case 2:
            r1 = NELEMS(spC);
            r3 = spC;
            break;
        default:
            GF_ASSERT(FALSE);
            return;
        }

        for (u8 i = 0; i < r1; ++i) {
            a3[r3[i]].species = a2->swarmSpecies[3];
        }
    }
}

BOOL FieldSystem_PerformLandOrSurfEncounterCheck(FieldSystem *fieldSystem) {
    if (fieldSystem->unk7E <= 3) {
        return FALSE;
    }

    ENC_SLOT sp40[NUM_ENCOUNTERS_LAND];
    UnkStruct_ov02_02248618 sp24;
    BattleSetup *sp20;
    Roamer *sp1C;
    u8 sp19;
    u8 sp18;

    u32 x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    u32 z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
    u8 r7 = GetMetatileBehavior(fieldSystem, x, z);
    sp18 = ov02_0224762C(fieldSystem, r7, &sp19);
    if (sp18 == 0) {
        return FALSE;
    }
    ov02_02248698(fieldSystem);
    Party *r6 = SaveArray_Party_Get(fieldSystem->saveData);
    ENC_DATA *r4 = MapEvents_GetLoadedEncTable(fieldSystem);
    Pokemon *sp10 = Party_GetMonByIndex(r6, 0);
    ov02_02248618(fieldSystem, sp10, r4, &sp24);
    if (!RoamerSave_RepelNotInUse(Save_Roamers_Get(fieldSystem->saveData))) {
        Pokemon *mon = GetFirstAliveMonInParty_CrashIfNone(r6);
        sp24.unk_04 = TRUE;
        sp24.unk_0C = GetMonData(mon, MON_DATA_LEVEL, NULL);
    }
    sp18 = ov02_02248190(0, sp18, &sp24, LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)), sp10);
    ApplyFluteEffectToEncounterRate(fieldSystem, &sp18);
    ApplyLeadMonHeldItemEffectToEncounterRate(sp10, &sp18);
    BOOL r7_2 = ov02_02247568(fieldSystem, sp18, r7) ? TRUE : FALSE;
    if (!r7_2) {
        return FALSE;
    }
    BOOL r6_2 = Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(fieldSystem->saveData)) ? TRUE : FALSE;
    if (!r6_2 && ov02_GetRandomActiveRoamerInCurrMap(fieldSystem, &sp1C)) {
        if (!ov02_02248290(GetRoamerData(sp1C, ROAMER_DATA_LEVEL), &sp24)) {
            sp20 = BattleSetup_New(HEAP_ID_FIELD2, BATTLE_TYPE_ROAMER);
            BattleSetup_InitFromFieldSystem(sp20, fieldSystem);
            ov02_022482BC(sp24.unk_00, sp1C, sp20);
            sub_02050B08(fieldSystem, sp20);
            return TRUE;
        }
        return FALSE;
    }

    SaveVarsFlags *sp14 = Save_VarsFlags_Get(fieldSystem->saveData);
    BOOL spC = Save_VarsFlags_CheckSafariSysFlag(sp14);
    BOOL sp8 = Save_VarsFlags_CheckBugContestFlag(sp14);

    if (!r6_2) {
        u8 r1 = 0;
        if (spC) {
            r1 = 1;
        } else if (sp8) {
            r1 = 2;
        }
        ov02_02248244(fieldSystem, r1, &sp20);
    } else {
        sp20 = BattleSetup_New(HEAP_ID_FIELD2, BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI);
    }
    BattleSetup_InitFromFieldSystem(sp20, fieldSystem);
    BOOL r0;
    if (sp19 == 0) {
        ov02_02246A84(r4, sp40);
        ov02_02246B58(fieldSystem, r4, &sp40[0], &sp40[1]);
        ov02_02246B00(fieldSystem, r4, sp40);
        if (!r6_2) {
            if (spC) {
                r0 = ov02_02247444(fieldSystem, sp10, sp20, r4, sp40, &sp24);
            } else if (sp8) {
                r0 = ov02_02247460(fieldSystem, sp10, sp20, r4, sp40, &sp24);
            } else {
                r0 = ov02_02247424(fieldSystem, sp10, sp20, r4, sp40, &sp24);
            }
        } else {
            sp20->trainerId[BATTLER_PLAYER2] = Save_VarsFlags_GetFollowerTrainerNum(Save_VarsFlags_Get(fieldSystem->saveData));
            EnemyTrainerSet_Init(sp20, fieldSystem->saveData, HEAP_ID_FIELD2);
            r0 = ov02_0224749C(fieldSystem, sp10, sp20, sp40, &sp24);
        }
    } else if (sp19 == 1) {
        for (int i = 0; i < NUM_ENCOUNTERS_SURF; ++i) {
            sp40[i].species = r4->surfSlots[i].species;
            sp40[i].level_max = r4->surfSlots[i].level_max;
            sp40[i].level_min = r4->surfSlots[i].level_min;
        }
        ov02_02246B9C(fieldSystem, r4, sp40);
        r0 = ov02_022474E0(fieldSystem, sp10, sp20, sp40, &sp24, spC);
    } else {
        GF_ASSERT(FALSE);
        BattleSetup_Delete(sp20);
        return FALSE;
    }
    if (r0) {
        sub_02050B08(fieldSystem, sp20);
        fieldSystem->unk7E = 0;
        fieldSystem->unk7C = 0;
    } else {
        r7_2 = FALSE;
    }
    GF_ASSERT(GF_heap_c_dummy_return_true(HEAP_ID_FIELD1));
    GF_ASSERT(GF_heap_c_dummy_return_true(HEAP_ID_FIELD2));
    if (!r7_2) {
        BattleSetup_Delete(sp20);
    }
    return r7_2;
}

BOOL FieldSystem_PerformFishEncounterCheck(FieldSystem *fieldSystem, u8 rodType, BattleSetup **pBattleSetup) {
    ENC_SLOT sp40[NUM_ENCOUNTERS_LAND];
    UnkStruct_ov02_02248618 sp24;

    u8 r4 = ov02_0224802C(fieldSystem, rodType);
    if (r4 == 0) {
        return FALSE;
    }

    Pokemon *sp1C = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), 0);
    ov02_02248618(fieldSystem, sp1C, NULL, &sp24);
    r4 = ov02_02248190(1, r4, &sp24, LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)), sp1C);
    u16 rnd = LCRandom() % 100;
    if (rnd >= r4) {
        return FALSE;
    }
    BOOL sp18 = Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData));
    if (sp18) {
        ov02_02248244(fieldSystem, 1, pBattleSetup);
    } else {
        ov02_02248244(fieldSystem, 0, pBattleSetup);
    }
    BattleSetup_InitFromFieldSystem(*pBattleSetup, fieldSystem);
    sub_02052544(*pBattleSetup);
    const ENC_DATA *sp14 = MapEvents_GetLoadedEncTable(fieldSystem);
    const ENC_DATA_SLOT *r7;
    switch (rodType) {
    case 0:
        r7 = sp14->oldRodSlots;
        break;
    case 1:
        r7 = sp14->goodRodSlots;
        break;
    case 2:
        r7 = sp14->superRodSlots;
        break;
    }
    // potential UB: r7 is uninitialized on invalid rod type
    for (u8 i = 0; i < NUM_ENCOUNTERS_FISH; ++i) {
        sp40[i].species = r7[i].species;
        sp40[i].level_max = r7[i].level_max;
        sp40[i].level_min = r7[i].level_min;
    }
    ov02_02246AD4(sp14, rodType, sp40);
    ov02_02246BD8(fieldSystem, rodType, sp14, sp40);
    return ov02_02247514(fieldSystem, sp1C, *pBattleSetup, sp40, &sp24, rodType, sp18) ? TRUE : FALSE;
}

BOOL FieldSystem_PerformRockSmashEncounterCheck(FieldSystem *fieldSystem, BattleSetup **pBattleSetup) {
    ENC_SLOT sp2C[NUM_ENCOUNTERS_LAND];
    UnkStruct_ov02_02248618 sp10;

    u8 r4 = ov02_022480B4(fieldSystem);
    if (r4 == 0) {
        return FALSE;
    }

    Pokemon *sp8 = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), 0);
    ov02_02248618(fieldSystem, sp8, NULL, &sp10);
    r4 = ov02_02248190(0, r4, &sp10, LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)), sp8);
    if ((LCRandom() % 100) >= r4) {
        return FALSE;
    }

    ov02_02248244(fieldSystem, 0, pBattleSetup);
    BattleSetup_InitFromFieldSystem(*pBattleSetup, fieldSystem);
    const ENC_DATA *r5 = MapEvents_GetLoadedEncTable(fieldSystem);
    const ENC_DATA_SLOT *r5_2 = r5->rockSmashSlots;
    for (u8 i = 0; i < NUM_ENCOUNTERS_ROCKSMASH; ++i) {
        sp2C[i].species = r5_2[i].species;
        sp2C[i].level_max = r5_2[i].level_max;
        sp2C[i].level_min = r5_2[i].level_min;
    }
    if (!ov02_0224754C(fieldSystem, sp8, *pBattleSetup, sp2C, &sp10)) {
        BattleSetup_Delete(*pBattleSetup);
        return FALSE;
    }

    return TRUE;
}

BOOL FieldSystem_PerformSweetScentEncounterCheck(FieldSystem *fieldSystem, TaskManager *taskManager) {
    ENC_SLOT sp3C[NUM_ENCOUNTERS_LAND];
    UnkStruct_ov02_02248618 sp20;
    BattleSetup *sp1C;
    Roamer *sp18;
    u8 sp14;
    SaveVarsFlags *r7 = Save_VarsFlags_Get(fieldSystem->saveData);
    u32 x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    u32 z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
    u8 metatileBehavior = GetMetatileBehavior(fieldSystem, x, z);

    if (!ov02_0224762C(fieldSystem, metatileBehavior, &sp14)) {
        return FALSE;
    }

    Party *r6 = SaveArray_Party_Get(fieldSystem->saveData);
    const ENC_DATA *r4 = MapEvents_GetLoadedEncTable(fieldSystem);
    Pokemon *sp10 = Party_GetMonByIndex(r6, 0);
    ov02_02248618(fieldSystem, sp10, r4, &sp20);
    sp20.unk_08 = 1;
    BOOL spC = Save_VarsFlags_CheckHaveFollower(r7);
    if (!spC && ov02_GetRandomActiveRoamerInCurrMap(fieldSystem, &sp18)) {
        sp1C = BattleSetup_New(HEAP_ID_FIELD2, BATTLE_TYPE_ROAMER);
        BattleSetup_InitFromFieldSystem(sp1C, fieldSystem);
        ov02_022482BC(sp20.unk_00, sp18, sp1C);
        FieldSystem_StartForcedWildBattle(fieldSystem, taskManager, sp1C);
        return TRUE;
    }

    BOOL r6_2 = Save_VarsFlags_CheckSafariSysFlag(r7);
    BOOL r7_2 = Save_VarsFlags_CheckBugContestFlag(r7);
    if (!spC) {
        u8 r1 = 0;
        if (r6_2) {
            r1 = 1;
        } else if (r7_2) {
            r1 = 2;
        }
        ov02_02248244(fieldSystem, r1, &sp1C);
    } else {
        sp1C = BattleSetup_New(HEAP_ID_FIELD2, BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI);
    }
    BattleSetup_InitFromFieldSystem(sp1C, fieldSystem);
    BOOL r0;
    if (sp14 == 0) {
        ov02_02246A84(r4, sp3C);
        ov02_02246B58(fieldSystem, r4, &sp3C[0], &sp3C[1]);
        ov02_02246B00(fieldSystem, r4, sp3C);
        if (!spC) {
            if (r6_2) {
                r0 = ov02_02247444(fieldSystem, sp10, sp1C, r4, sp3C, &sp20);
            } else if (r7_2) {
                r0 = ov02_02247460(fieldSystem, sp10, sp1C, r4, sp3C, &sp20);
            } else {
                r0 = ov02_02247424(fieldSystem, sp10, sp1C, r4, sp3C, &sp20);
            }
        } else {
            sp1C->trainerId[BATTLER_PLAYER2] = Save_VarsFlags_GetFollowerTrainerNum(Save_VarsFlags_Get(fieldSystem->saveData));
            EnemyTrainerSet_Init(sp1C, fieldSystem->saveData, HEAP_ID_FIELD2);
            r0 = ov02_0224749C(fieldSystem, sp10, sp1C, sp3C, &sp20);
        }
    } else if (sp14 == 1) {
        for (int i = 0; i < NUM_ENCOUNTERS_SURF; ++i) {
            sp3C[i].species = r4->surfSlots[i].species;
            sp3C[i].level_max = r4->surfSlots[i].level_max;
            sp3C[i].level_min = r4->surfSlots[i].level_min;
        }
        ov02_02246B9C(fieldSystem, r4, sp3C);
        r0 = ov02_022474E0(fieldSystem, sp10, sp1C, sp3C, &sp20, r6_2);
    } else {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    if (r0) {
        FieldSystem_StartForcedWildBattle(fieldSystem, taskManager, sp1C);
    } else {
        GF_ASSERT(FALSE);
    }
    fieldSystem->unk7E = 0;
    fieldSystem->unk7C = 0;
    return TRUE;
}

BOOL FieldSystem_PerformHeadbuttEncounterCheck(FieldSystem *fieldSystem, BattleSetup **pBattleSetup, const HeadbuttSlot *headbuttSlots) {
    ENC_SLOT sp48[NUM_ENCOUNTERS_LAND];
    UnkStruct_ov02_02248618 sp2C;
    ENC_DATA_SLOT sp14[NUM_ENCOUNTERS_HEADBUTT];

    Pokemon *sp10 = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), 0);
    ov02_02248618(fieldSystem, sp10, NULL, &sp2C);
    ov02_02248244(fieldSystem, 0, pBattleSetup);
    BattleSetup_InitFromFieldSystem(*pBattleSetup, fieldSystem);
    for (u8 i = 0; i < NUM_ENCOUNTERS_HEADBUTT; ++i) {
        sp14[i].species = headbuttSlots[i].species;
        sp14[i].level_max = headbuttSlots[i].maxLevel;
        sp14[i].level_min = headbuttSlots[i].minLevel;
    }
    for (u8 i = 0; i < NUM_ENCOUNTERS_HEADBUTT; ++i) {
        sp48[i].species = sp14[i].species;
        sp48[i].level_max = sp14[i].level_max;
        sp48[i].level_min = sp14[i].level_min;
    }
    if (!ov02_02247B64(sp10, 0xFF, &sp2C, sp48, 4, 1, *pBattleSetup)) {
        BattleSetup_Delete(*pBattleSetup);
        return FALSE;
    }

    return TRUE;
}

BOOL ov02_02247424(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, const ENC_DATA *encData, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5) {
    return ov02_02247B64(leadMon, 0xFF, a5, encSlots, 0, 1, battleSetup);
}

BOOL ov02_02247444(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, const ENC_DATA *encData, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5) {
    return ov02_02247DA0(fieldSystem, leadMon, 0xFF, a5, 0, 1, battleSetup);
}

BOOL ov02_02247460(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, const ENC_DATA *encData, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5) {
    FSOverlayID ovyId = FS_OVERLAY_ID(bug_contest);

    HandleLoadOverlay(ovyId, OVY_LOAD_ASYNC);
    BOOL ret = ov02_02247ED8(fieldSystem, leadMon, 0xFF, a5, 0, 1, battleSetup);
    UnloadOverlayByID(ovyId);
    return ret;
}

BOOL ov02_0224749C(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5) {
    if (ov02_02247B64(leadMon, 0xFF, a5, encSlots, 0, 1, battleSetup) == FALSE) { // explicit comparison to FALSE required to match
        return FALSE;
    } else {
        return ov02_02247B64(leadMon, 0xFF, a5, encSlots, 0, 3, battleSetup);
    }
}

BOOL ov02_022474E0(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encounterSlots, UnkStruct_ov02_02248618 *a4, BOOL a5) {
    if (a5) {
        return ov02_02247DA0(fieldSystem, leadMon, 0xFF, a4, 1, 1, battleSetup);
    } else {
        return ov02_02247B64(leadMon, 0xFF, a4, encounterSlots, 1, 1, battleSetup);
    }
}

BOOL ov02_02247514(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4, int rodType, BOOL isSafari) {
    if (isSafari) {
        return ov02_02247DA0(fieldSystem, leadMon, rodType, a4, 2, 1, battleSetup);
    } else {
        return ov02_02247B64(leadMon, rodType, a4, encSlots, 2, 1, battleSetup);
    }
}

BOOL ov02_0224754C(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4) {
    return ov02_02247B64(leadMon, 0xFF, a4, encSlots, 3, 1, battleSetup);
}
