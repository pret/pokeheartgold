#include "field/encounter_check.h"

#include "global.h"

#include "constants/abilities.h"

#include "battle/battle_setup.h"
#include "overlay_2/overlay_02_gear_phone.h"

#include "encounter.h"
#include "gf_rtc.h"
#include "map_events.h"
#include "math_util.h"
#include "metatile_behavior.h"
#include "overlay_02.h"
#include "roamer.h"
#include "safari_zone.h"
#include "script_pokemon_util.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_02054648.h"
#include "unk_0205CB48.h"
#include "unk_02097268.h"
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
BOOL ov02_022474E0(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4, BOOL a5);
BOOL ov02_02247514(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4, int rodType, BOOL isSafari);
BOOL ov02_0224754C(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4);
BOOL ov02_02247568(FieldSystem *fieldSystem, u8 encounterRate, u8 metatileBehavior);
u8 ov02_02247610(u16 a0);
u8 ov02_0224762C(FieldSystem *fieldSystem, u8 metatileBehavior, u8 *a2);
BOOL ov02_0224766C(FieldSystem *fieldSystem, u16 encounterRate);
u8 EncounterSlot_WildMonSlotRoll_Land(void);
u8 EncounterSlot_WildMonSlotRoll_Surfing(void);
u8 EncounterSlot_WildMonSlotRoll_Fishing(int rodType);
u8 EncounterSlot_WildMonSlotRoll_RockSmash(void);
u8 EncounterSlot_WildMonSlotRoll_Headbutt(void);
void ApplyLeadMonHeldItemEffectToEncounterRate(Pokemon *leadMon, u8 *pEncounterRate);
void ApplyFluteEffectToEncounterRate(FieldSystem *fieldSystem, u8 *pEncounterRate);
u8 ov02_02247854(Pokemon *pokemon, UnkStruct_ov02_02248618 *a1);
u8 EncounterSlot_WildMonLevelRoll(ENC_SLOT *encSlot, UnkStruct_ov02_02248618 *a1);
void ov02_02247910(u16 species, u8 level, int battler, u32 otid, UnkStruct_ov02_02248618 *a4, Pokemon *leadMon, BattleSetup *battleSetup);
void ov02_02247A18(u16 species, u8 level, int battler, BOOL forceOnePerfectIV, UnkStruct_ov02_02248618 *a4, Pokemon *leadMon, BattleSetup *battleSetup);
BOOL ov02_02247B64(Pokemon *leadMon, int rodType, UnkStruct_ov02_02248618 *a2, ENC_SLOT *encSlots, u8 encType, int battler, BattleSetup *battleSetup);
BOOL ov02_02247DA0(FieldSystem *fieldSystem, Pokemon *leadMon, int rodType, UnkStruct_ov02_02248618 *a3, u8 encType, int battler, BattleSetup *battleSetup);
BOOL ov02_02247ED8(FieldSystem *fieldSystem, Pokemon *leadMon, u8 a2, UnkStruct_ov02_02248618 *a3, u8 encType, int battler, BattleSetup *battleSetup);
int ov02_02248014(FieldSystem *fieldSystem);
int ov02_02248020(FieldSystem *fieldSystem);
u8 ov02_0224802C(FieldSystem *fieldSystem, u8 a1);
int ov02_022480B4(FieldSystem *fieldSystem);
BOOL EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(Pokemon *leadMon, UnkStruct_ov02_02248618 *a1, ENC_SLOT *encSlots, u8 numSlots, u8 type, u8 ability, u8 *slotNum);
u8 ov02_02248190(int a0, u8 a1, UnkStruct_ov02_02248618 *a2, u16 a3, Pokemon *leadMon);
BOOL ov02_022481EC(UnkStruct_ov02_02248618 *a0, Pokemon *leadMon, u8 level);
BOOL ov02_02248290(u8 roamerLevel, UnkStruct_ov02_02248618 *a1);
BOOL ov02_022482A4(UnkStruct_ov02_02248618 *a0);
void ov02_022482BC(u32 otId, Roamer *roamer, BattleSetup *battleSetup);
void ov02_02248244(FieldSystem *fieldSystem, u8 a1, BattleSetup **pBattleSetup);
BOOL ov02_0224855C(int battler, UnkStruct_ov02_02248618 *a1, Pokemon *pokemon, BattleSetup *battleSetup);
u8 ov02_022485B0(ENC_SLOT *encSlots, u8 numEncSlots, UnkStruct_ov02_02248618 *a2, u8 chosenSlot);
void ov02_02248618(FieldSystem *fieldSystem, Pokemon *pokemon, const ENC_DATA *encData, UnkStruct_ov02_02248618 *a3);
void ov02_02248698(FieldSystem *fieldSystem);
BOOL ov02_GetRandomActiveRoamerInCurrMap(FieldSystem *fieldSystem, Roamer **pRoamer);

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

    ENC_SLOT encSlots[NUM_ENCOUNTERS_LAND];
    UnkStruct_ov02_02248618 sp24;
    BattleSetup *battleSetup;
    Roamer *roamer;
    u8 encounterType;
    u8 encounterRate;

    u32 x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    u32 z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
    u8 metatileBehavior = GetMetatileBehavior(fieldSystem, x, z);
    encounterRate = ov02_0224762C(fieldSystem, metatileBehavior, &encounterType);
    if (encounterRate == 0) {
        return FALSE;
    }
    ov02_02248698(fieldSystem);
    Party *r6 = SaveArray_Party_Get(fieldSystem->saveData);
    ENC_DATA *encData = MapEvents_GetLoadedEncTable(fieldSystem);
    Pokemon *leadMon = Party_GetMonByIndex(r6, 0);
    ov02_02248618(fieldSystem, leadMon, encData, &sp24);
    if (!RoamerSave_RepelNotInUse(Save_Roamers_Get(fieldSystem->saveData))) {
        Pokemon *mon = GetFirstAliveMonInParty_CrashIfNone(r6);
        sp24.unk_04 = TRUE;
        sp24.unk_0C = GetMonData(mon, MON_DATA_LEVEL, NULL);
    }
    encounterRate = ov02_02248190(0, encounterRate, &sp24, LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)), leadMon);
    ApplyFluteEffectToEncounterRate(fieldSystem, &encounterRate);
    ApplyLeadMonHeldItemEffectToEncounterRate(leadMon, &encounterRate);
    BOOL ret = ov02_02247568(fieldSystem, encounterRate, metatileBehavior) ? TRUE : FALSE;
    if (!ret) {
        return FALSE;
    }
    BOOL followerFlag = Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(fieldSystem->saveData)) ? TRUE : FALSE;
    if (!followerFlag && ov02_GetRandomActiveRoamerInCurrMap(fieldSystem, &roamer)) {
        if (!ov02_02248290(GetRoamerData(roamer, ROAMER_DATA_LEVEL), &sp24)) {
            battleSetup = BattleSetup_New(HEAP_ID_FIELD2, BATTLE_TYPE_ROAMER);
            BattleSetup_InitFromFieldSystem(battleSetup, fieldSystem);
            ov02_022482BC(sp24.unk_00, roamer, battleSetup);
            sub_02050B08(fieldSystem, battleSetup);
            return TRUE;
        }
        return FALSE;
    }

    SaveVarsFlags *saveVarsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    BOOL safariFlag = Save_VarsFlags_CheckSafariSysFlag(saveVarsFlags);
    BOOL bugContetFlag = Save_VarsFlags_CheckBugContestFlag(saveVarsFlags);

    if (!followerFlag) {
        u8 r1 = 0;
        if (safariFlag) {
            r1 = 1;
        } else if (bugContetFlag) {
            r1 = 2;
        }
        ov02_02248244(fieldSystem, r1, &battleSetup);
    } else {
        battleSetup = BattleSetup_New(HEAP_ID_FIELD2, BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI);
    }
    BattleSetup_InitFromFieldSystem(battleSetup, fieldSystem);
    BOOL found;
    if (encounterType == 0) {
        ov02_02246A84(encData, encSlots);
        ov02_02246B58(fieldSystem, encData, &encSlots[0], &encSlots[1]);
        ov02_02246B00(fieldSystem, encData, encSlots);
        if (!followerFlag) {
            if (safariFlag) {
                found = ov02_02247444(fieldSystem, leadMon, battleSetup, encData, encSlots, &sp24);
            } else if (bugContetFlag) {
                found = ov02_02247460(fieldSystem, leadMon, battleSetup, encData, encSlots, &sp24);
            } else {
                found = ov02_02247424(fieldSystem, leadMon, battleSetup, encData, encSlots, &sp24);
            }
        } else {
            battleSetup->trainerId[BATTLER_PLAYER2] = Save_VarsFlags_GetFollowerTrainerNum(Save_VarsFlags_Get(fieldSystem->saveData));
            EnemyTrainerSet_Init(battleSetup, fieldSystem->saveData, HEAP_ID_FIELD2);
            found = ov02_0224749C(fieldSystem, leadMon, battleSetup, encSlots, &sp24);
        }
    } else if (encounterType == 1) {
        for (int i = 0; i < NUM_ENCOUNTERS_SURF; ++i) {
            encSlots[i].species = encData->surfSlots[i].species;
            encSlots[i].level_max = encData->surfSlots[i].level_max;
            encSlots[i].level_min = encData->surfSlots[i].level_min;
        }
        ov02_02246B9C(fieldSystem, encData, encSlots);
        found = ov02_022474E0(fieldSystem, leadMon, battleSetup, encSlots, &sp24, safariFlag);
    } else {
        GF_ASSERT(FALSE);
        BattleSetup_Delete(battleSetup);
        return FALSE;
    }
    if (found) {
        sub_02050B08(fieldSystem, battleSetup);
        fieldSystem->unk7E = 0;
        fieldSystem->unk7C = 0;
    } else {
        ret = FALSE;
    }
    GF_ASSERT(GF_heap_c_dummy_return_true(HEAP_ID_FIELD1));
    GF_ASSERT(GF_heap_c_dummy_return_true(HEAP_ID_FIELD2));
    if (!ret) {
        BattleSetup_Delete(battleSetup);
    }
    return ret;
}

BOOL FieldSystem_PerformFishEncounterCheck(FieldSystem *fieldSystem, u8 rodType, BattleSetup **pBattleSetup) {
    ENC_SLOT encSlots[NUM_ENCOUNTERS_LAND];
    UnkStruct_ov02_02248618 sp24;

    u8 encounterRate = ov02_0224802C(fieldSystem, rodType);
    if (encounterRate == 0) {
        return FALSE;
    }

    Pokemon *leadMon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), 0);
    ov02_02248618(fieldSystem, leadMon, NULL, &sp24);
    encounterRate = ov02_02248190(1, encounterRate, &sp24, LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)), leadMon);
    if (LCRandRange(100) >= encounterRate) {
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
    const ENC_DATA *encData = MapEvents_GetLoadedEncTable(fieldSystem);
    const ENC_DATA_SLOT *rodSlots;
    switch (rodType) {
    case 0:
        rodSlots = encData->oldRodSlots;
        break;
    case 1:
        rodSlots = encData->goodRodSlots;
        break;
    case 2:
        rodSlots = encData->superRodSlots;
        break;
    }
    // potential UB: r7 is uninitialized on invalid rod type
    for (u8 i = 0; i < NUM_ENCOUNTERS_FISH; ++i) {
        encSlots[i].species = rodSlots[i].species;
        encSlots[i].level_max = rodSlots[i].level_max;
        encSlots[i].level_min = rodSlots[i].level_min;
    }
    ov02_02246AD4(encData, rodType, encSlots);
    ov02_02246BD8(fieldSystem, rodType, encData, encSlots);
    return ov02_02247514(fieldSystem, leadMon, *pBattleSetup, encSlots, &sp24, rodType, sp18) ? TRUE : FALSE;
}

BOOL FieldSystem_PerformRockSmashEncounterCheck(FieldSystem *fieldSystem, BattleSetup **pBattleSetup) {
    ENC_SLOT encSlots[NUM_ENCOUNTERS_LAND];
    UnkStruct_ov02_02248618 sp10;

    u8 encounterRate = ov02_022480B4(fieldSystem);
    if (encounterRate == 0) {
        return FALSE;
    }

    Pokemon *leadMon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), 0);
    ov02_02248618(fieldSystem, leadMon, NULL, &sp10);
    encounterRate = ov02_02248190(0, encounterRate, &sp10, LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)), leadMon);
    if ((LCRandom() % 100) >= encounterRate) {
        return FALSE;
    }

    ov02_02248244(fieldSystem, 0, pBattleSetup);
    BattleSetup_InitFromFieldSystem(*pBattleSetup, fieldSystem);
    const ENC_DATA *r5 = MapEvents_GetLoadedEncTable(fieldSystem);
    const ENC_DATA_SLOT *r5_2 = r5->rockSmashSlots;
    for (u8 i = 0; i < NUM_ENCOUNTERS_ROCKSMASH; ++i) {
        encSlots[i].species = r5_2[i].species;
        encSlots[i].level_max = r5_2[i].level_max;
        encSlots[i].level_min = r5_2[i].level_min;
    }
    if (!ov02_0224754C(fieldSystem, leadMon, *pBattleSetup, encSlots, &sp10)) {
        BattleSetup_Delete(*pBattleSetup);
        return FALSE;
    }

    return TRUE;
}

BOOL FieldSystem_PerformSweetScentEncounterCheck(FieldSystem *fieldSystem, TaskManager *taskManager) {
    ENC_SLOT encSlots[NUM_ENCOUNTERS_LAND];
    UnkStruct_ov02_02248618 sp20;
    BattleSetup *battleSetup;
    Roamer *roamer;
    u8 sp14;
    SaveVarsFlags *saveVarsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    u32 x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    u32 z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
    u8 metatileBehavior = GetMetatileBehavior(fieldSystem, x, z);

    if (!ov02_0224762C(fieldSystem, metatileBehavior, &sp14)) {
        return FALSE;
    }

    Party *party = SaveArray_Party_Get(fieldSystem->saveData);
    const ENC_DATA *encData = MapEvents_GetLoadedEncTable(fieldSystem);
    Pokemon *leadMon = Party_GetMonByIndex(party, 0);
    ov02_02248618(fieldSystem, leadMon, encData, &sp20);
    sp20.unk_08 = 1;
    BOOL followerFlag = Save_VarsFlags_CheckHaveFollower(saveVarsFlags);
    if (!followerFlag && ov02_GetRandomActiveRoamerInCurrMap(fieldSystem, &roamer)) {
        battleSetup = BattleSetup_New(HEAP_ID_FIELD2, BATTLE_TYPE_ROAMER);
        BattleSetup_InitFromFieldSystem(battleSetup, fieldSystem);
        ov02_022482BC(sp20.unk_00, roamer, battleSetup);
        FieldSystem_StartForcedWildBattle(fieldSystem, taskManager, battleSetup);
        return TRUE;
    }

    BOOL safariFlag = Save_VarsFlags_CheckSafariSysFlag(saveVarsFlags);
    BOOL bugContestFlag = Save_VarsFlags_CheckBugContestFlag(saveVarsFlags);
    if (!followerFlag) {
        u8 r1 = 0;
        if (safariFlag) {
            r1 = 1;
        } else if (bugContestFlag) {
            r1 = 2;
        }
        ov02_02248244(fieldSystem, r1, &battleSetup);
    } else {
        battleSetup = BattleSetup_New(HEAP_ID_FIELD2, BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI);
    }
    BattleSetup_InitFromFieldSystem(battleSetup, fieldSystem);
    BOOL found;
    if (sp14 == 0) {
        ov02_02246A84(encData, encSlots);
        ov02_02246B58(fieldSystem, encData, &encSlots[0], &encSlots[1]);
        ov02_02246B00(fieldSystem, encData, encSlots);
        if (!followerFlag) {
            if (safariFlag) {
                found = ov02_02247444(fieldSystem, leadMon, battleSetup, encData, encSlots, &sp20);
            } else if (bugContestFlag) {
                found = ov02_02247460(fieldSystem, leadMon, battleSetup, encData, encSlots, &sp20);
            } else {
                found = ov02_02247424(fieldSystem, leadMon, battleSetup, encData, encSlots, &sp20);
            }
        } else {
            battleSetup->trainerId[BATTLER_PLAYER2] = Save_VarsFlags_GetFollowerTrainerNum(Save_VarsFlags_Get(fieldSystem->saveData));
            EnemyTrainerSet_Init(battleSetup, fieldSystem->saveData, HEAP_ID_FIELD2);
            found = ov02_0224749C(fieldSystem, leadMon, battleSetup, encSlots, &sp20);
        }
    } else if (sp14 == 1) {
        for (int i = 0; i < NUM_ENCOUNTERS_SURF; ++i) {
            encSlots[i].species = encData->surfSlots[i].species;
            encSlots[i].level_max = encData->surfSlots[i].level_max;
            encSlots[i].level_min = encData->surfSlots[i].level_min;
        }
        ov02_02246B9C(fieldSystem, encData, encSlots);
        found = ov02_022474E0(fieldSystem, leadMon, battleSetup, encSlots, &sp20, safariFlag);
    } else {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    if (found) {
        FieldSystem_StartForcedWildBattle(fieldSystem, taskManager, battleSetup);
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
    if (!ov02_02247B64(sp10, 0xFF, &sp2C, sp48, 4, BATTLER_ENEMY, *pBattleSetup)) {
        BattleSetup_Delete(*pBattleSetup);
        return FALSE;
    }

    return TRUE;
}

BOOL ov02_02247424(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, const ENC_DATA *encData, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5) {
    return ov02_02247B64(leadMon, 0xFF, a5, encSlots, 0, BATTLER_ENEMY, battleSetup);
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
    if (ov02_02247B64(leadMon, 0xFF, a5, encSlots, 0, BATTLER_ENEMY, battleSetup) == FALSE) { // explicit comparison to FALSE required to match
        return FALSE;
    } else {
        return ov02_02247B64(leadMon, 0xFF, a5, encSlots, 0, BATTLER_ENEMY2, battleSetup);
    }
}

BOOL ov02_022474E0(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4, BOOL a5) {
    if (a5) {
        return ov02_02247DA0(fieldSystem, leadMon, 0xFF, a4, 1, 1, battleSetup);
    } else {
        return ov02_02247B64(leadMon, 0xFF, a4, encSlots, 1, BATTLER_ENEMY, battleSetup);
    }
}

BOOL ov02_02247514(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4, int rodType, BOOL isSafari) {
    if (isSafari) {
        return ov02_02247DA0(fieldSystem, leadMon, rodType, a4, 2, 1, battleSetup);
    } else {
        return ov02_02247B64(leadMon, rodType, a4, encSlots, 2, BATTLER_ENEMY, battleSetup);
    }
}

BOOL ov02_0224754C(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4) {
    return ov02_02247B64(leadMon, 0xFF, a4, encSlots, 3, BATTLER_ENEMY, battleSetup);
}

BOOL ov02_02247568(FieldSystem *fieldSystem, u8 encounterRate, u8 metatileBehavior) {
    if (encounterRate > 100) {
        encounterRate = 100;
    }
    int avatarState = PlayerAvatar_GetState(fieldSystem->playerAvatar);
    u8 r4 = 40;
    if (avatarState != 1 && avatarState != 2 && !sub_0205DE98(fieldSystem->playerAvatar)) {
        r4 -= 20;
    }
    if (sub_0205B6F4(metatileBehavior)) {
        r4 += 40;
    } else if (avatarState == 1) {
        r4 += 30;
    }
    r4 += ov02_02247610(fieldSystem->unk7C);
    if (GetRadioMusicPlayingSeq() == RADIO_MUSIC_SEQ_MARCH) {
        r4 += 25;
    } else if (GetRadioMusicPlayingSeq() == RADIO_MUSIC_SEQ_LULLABY) {
        r4 -= 25;
    }
    if (r4 > 100) {
        r4 = 100;
    }
    if (LCRandRange(100) < r4 && ov02_0224766C(fieldSystem, encounterRate)) {
        return TRUE;
    }

    return FALSE;
}

u8 ov02_02247610(u16 a0) {
    u8 result = 0;

    if (a0 >= 4) {
        result = 60;
    } else if (a0 >= 3) {
        result = 40;
    } else if (a0 >= 2) {
        result = 30;
    }

    return result;
}

u8 ov02_0224762C(FieldSystem *fieldSystem, u8 metatileBehavior, u8 *a2) {
    if (sub_0205B994(metatileBehavior)) {
        if (MetatileBehavior_IsSurfableWater(metatileBehavior)) {
            *a2 = 1;
            return ov02_02248020(fieldSystem);
        } else {
            *a2 = 0;
            return ov02_02248014(fieldSystem);
        }
    }

    return 0;
}

BOOL ov02_0224766C(FieldSystem *fieldSystem, u16 encounterRate) {
    if (LCRandRange(100) < encounterRate) {
        return TRUE;
    }
    return FALSE;
}

u8 EncounterSlot_WildMonSlotRoll_Land(void) {
    u8 rnd = LCRandRange(100);

    if (rnd < 20) {
        return 0;
    } else if (rnd >= 20 && rnd < 40) {
        return 1;
    } else if (rnd >= 40 && rnd < 50) {
        return 2;
    } else if (rnd >= 50 && rnd < 60) {
        return 3;
    } else if (rnd >= 60 && rnd < 70) {
        return 4;
    } else if (rnd >= 70 && rnd < 80) {
        return 5;
    } else if (rnd >= 80 && rnd < 85) {
        return 6;
    } else if (rnd >= 85 && rnd < 90) {
        return 7;
    } else if (rnd >= 90 && rnd < 94) {
        return 8;
    } else if (rnd >= 94 && rnd < 98) {
        return 9;
    } else if (rnd == 98) {
        return 10;
    } else {
        return 11;
    }
}

u8 EncounterSlot_WildMonSlotRoll_Surfing(void) {
    u8 rnd = LCRandRange(100);

    if (rnd < 60) {
        return 0;
    } else if (rnd >= 60 && rnd < 90) {
        return 1;
    } else if (rnd >= 90 && rnd < 95) {
        return 2;
    } else if (rnd >= 95 && rnd < 99) {
        return 3;
    } else {
        return 4;
    }
}

u8 EncounterSlot_WildMonSlotRoll_Fishing(int rodType) {
    u8 rnd = LCRandRange(100);

    if (rnd < 40) {
        return 0;
    } else if (rnd < 70) {
        return 1;
    } else if (rnd < 85) {
        return 2;
    } else if (rnd < 95) {
        return 3;
    } else {
        return 4;
    }
}

u8 EncounterSlot_WildMonSlotRoll_RockSmash(void) {
    u8 rnd = LCRandRange(100);

    return rnd >= 80 ? 1 : 0;
}

u8 EncounterSlot_WildMonSlotRoll_Headbutt(void) {
    u8 rnd = LCRandRange(100);

    if (rnd < 50) {
        return 0;
    } else if (rnd < 65) {
        return 1;
    } else if (rnd < 80) {
        return 2;
    } else if (rnd < 90) {
        return 3;
    } else if (rnd < 95) {
        return 4;
    } else {
        return 5;
    }
}

void ApplyLeadMonHeldItemEffectToEncounterRate(Pokemon *leadMon, u8 *pEncounterRate) {
    u16 heldItem = GetMonData(leadMon, MON_DATA_HELD_ITEM, NULL);
    if (heldItem == ITEM_CLEANSE_TAG || heldItem == ITEM_PURE_INCENSE) {
        *pEncounterRate = *pEncounterRate * 2 / 3;
    }
}

void ApplyFluteEffectToEncounterRate(FieldSystem *fieldSystem, u8 *pEncounterRate) {
    u8 flute = RoamerSave_GetFlute(Save_Roamers_Get(fieldSystem->saveData));
    if (flute == 1) { // black flute
        *pEncounterRate /= 2;
    } else if (flute == 2) { // white flute
        *pEncounterRate += *pEncounterRate / 2;
    }
}

u8 ov02_02247854(Pokemon *pokemon, UnkStruct_ov02_02248618 *a1) {
    if (a1->unk_0D == 0 && a1->unk_0E == ABILITY_SYNCHRONIZE && LCRandRange(2) == 0) {
        return GetMonData(pokemon, MON_DATA_PERSONALITY, NULL) % 25;
    } else {
        return LCRandRange(25);
    }
}

u8 EncounterSlot_WildMonLevelRoll(ENC_SLOT *encSlot, UnkStruct_ov02_02248618 *a1) {
    u8 hi;
    u8 lo;

    if (encSlot->level_max >= encSlot->level_min) {
        lo = encSlot->level_min;
        hi = encSlot->level_max;
    } else {
        lo = encSlot->level_max;
        hi = encSlot->level_min;
    }

    u8 range = hi - lo + 1;
    u8 lvl = LCRandom() % range;
    if (a1->unk_0D == 0 && (a1->unk_0E == ABILITY_HUSTLE || a1->unk_0E == ABILITY_VITAL_SPIRIT || a1->unk_0E == ABILITY_PRESSURE)) {
        if (LCRandRange(2) == 0) {
            return lo + lvl;
        }
        return hi;
    }

    return lo + lvl;
}

void ov02_02247910(u16 species, u8 level, int battler, u32 otid, UnkStruct_ov02_02248618 *a4, Pokemon *leadMon, BattleSetup *battleSetup) {
    u8 monGender;
    u8 monNature;
    Pokemon *wildMon = AllocMonZeroed(HEAP_ID_FIELD2);
    BOOL overrideGenderOrNature;
    u32 personality;

    ZeroMonData(wildMon);

    overrideGenderOrNature = FALSE;
    if (a4->unk_0D == 0) {
        if (a4->unk_0E == ABILITY_CUTE_CHARM) {
            switch (GetMonBaseStat(species, BASE_GENDER_RATIO)) {
            case MON_RATIO_MALE:
            case MON_RATIO_FEMALE:
            case MON_RATIO_UNKNOWN:
                break;
            default:
                if (LCRandRange(3) != 0) {
                    monGender = GetMonData(leadMon, MON_DATA_GENDER, NULL);
                    overrideGenderOrNature = TRUE;
                }
                break;
            }
        } else if (a4->unk_0E == ABILITY_SYNCHRONIZE) {
            if (LCRandRange(2) == 0) {
                monNature = GetMonNature(leadMon);
                overrideGenderOrNature = TRUE;
            }
        }
    }
    personality = GenerateShinyPersonality(otid);
    if (overrideGenderOrNature) {
        do {
            if (a4->unk_0E == ABILITY_CUTE_CHARM) {
                u8 generatedGender = GetGenderBySpeciesAndPersonality(species, personality);
                GF_ASSERT(generatedGender != MON_GENDERLESS);
                if (generatedGender != monGender) {
                    break;
                }
                personality = GenerateShinyPersonality(otid);
            } else if (a4->unk_0E == ABILITY_SYNCHRONIZE) {
                u8 generatedNature = GetNatureFromPersonality(personality);
                if (generatedNature == monNature) {
                    break;
                }
                personality = GenerateShinyPersonality(otid);
            }
        } while (TRUE);
    }

    CreateMon(wildMon, species, level, 0x20, TRUE, personality, OT_ID_PRESET, a4->unk_00);
    GF_ASSERT(ov02_0224855C(battler, a4, wildMon, battleSetup));
    Heap_Free(wildMon);
}

static inline BOOL canCoerceGender(u16 species) {
    switch (GetMonBaseStat(species, BASE_GENDER_RATIO)) {
    case MON_RATIO_MALE:
    case MON_RATIO_FEMALE:
    case MON_RATIO_UNKNOWN:
        return FALSE;
    default:
        return TRUE;
    }
}

void ov02_02247A18(u16 species, u8 level, int battler, BOOL forceOnePerfectIV, UnkStruct_ov02_02248618 *a4, Pokemon *leadMon, BattleSetup *battleSetup) {
    u8 monGender;
    u8 canCoerceGender;
    Pokemon *wildMon = AllocMonZeroed(HEAP_ID_FIELD2);
    ZeroMonData(wildMon);

    canCoerceGender = TRUE;
    switch (GetMonBaseStat(species, BASE_GENDER_RATIO)) {
    case MON_RATIO_MALE:
    case MON_RATIO_FEMALE:
    case MON_RATIO_UNKNOWN:
        canCoerceGender = FALSE;
    default:
        break;
    }

    if (canCoerceGender && a4->unk_0D == 0 && a4->unk_0E == ABILITY_CUTE_CHARM && LCRandRange(3) != 0) {
        monGender = GetMonData(leadMon, MON_DATA_GENDER, NULL);
        if (monGender == MON_FEMALE) {
            monGender = MON_MALE;
        } else if (monGender == MON_MALE) {
            monGender = MON_FEMALE;
        } else {
            GF_ASSERT(FALSE); // can't put cute charm on a genderless pokemon
        }
        CreateMonWithGenderNatureLetter(wildMon, species, level, 0x20, monGender, ov02_02247854(leadMon, a4), 0);
        SetMonData(wildMon, MON_DATA_OT_ID, &a4->unk_00);
        GF_ASSERT(ov02_0224855C(battler, a4, wildMon, battleSetup));
        Heap_Free(wildMon);
        return;
    }

    if (forceOnePerfectIV) {
        int i;
        BOOL sp18 = FALSE;
        for (i = 0; i < 4; ++i) {
            CreateMonWithNature(wildMon, species, level, 0x20, ov02_02247854(leadMon, a4));
            for (int j = 0; j < 6; ++j) {
                if (GetMonData(wildMon, MON_DATA_HP_IV + j, NULL) == 31) {
                    sp18 = TRUE;
                    break;
                }
            }
            if (sp18) {
                break;
            }
        }
    } else {
        CreateMonWithNature(wildMon, species, level, 0x20, ov02_02247854(leadMon, a4));
    }

    SetMonData(wildMon, MON_DATA_OT_ID, &a4->unk_00);
    GF_ASSERT(ov02_0224855C(battler, a4, wildMon, battleSetup));
    Heap_Free(wildMon);
}

BOOL ov02_02247B64(Pokemon *leadMon, int rodType, UnkStruct_ov02_02248618 *a2, ENC_SLOT *encSlots, u8 a4, int battler, BattleSetup *battleSetup) {
    u8 slot = 0;
    u8 level = 0;

    switch (a4) {
    case 0:
        if (!EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a2, encSlots, NUM_ENCOUNTERS_LAND, TYPE_STEEL, ABILITY_MAGNET_PULL, &slot) && !EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a2, encSlots, NUM_ENCOUNTERS_LAND, TYPE_ELECTRIC, ABILITY_STATIC, &slot)) {
            slot = EncounterSlot_WildMonSlotRoll_Land();
        }
        slot = ov02_022485B0(encSlots, NUM_ENCOUNTERS_LAND, a2, slot);
        level = encSlots[slot].level_max;
        break;
    case 3:
        if (!EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a2, encSlots, NUM_ENCOUNTERS_ROCKSMASH, TYPE_STEEL, ABILITY_MAGNET_PULL, &slot) && !EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a2, encSlots, NUM_ENCOUNTERS_ROCKSMASH, TYPE_ELECTRIC, ABILITY_STATIC, &slot)) {
            slot = EncounterSlot_WildMonSlotRoll_RockSmash();
        }
        level = EncounterSlot_WildMonLevelRoll(&encSlots[slot], a2);
        break;
    case 1:
        if (!EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a2, encSlots, NUM_ENCOUNTERS_SURF, TYPE_STEEL, ABILITY_MAGNET_PULL, &slot) && !EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a2, encSlots, NUM_ENCOUNTERS_SURF, TYPE_ELECTRIC, ABILITY_STATIC, &slot)) {
            slot = EncounterSlot_WildMonSlotRoll_Surfing();
        }
        level = EncounterSlot_WildMonLevelRoll(&encSlots[slot], a2);
        break;
    case 2:
        if (!EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a2, encSlots, NUM_ENCOUNTERS_FISH, TYPE_STEEL, ABILITY_MAGNET_PULL, &slot) && !EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a2, encSlots, NUM_ENCOUNTERS_FISH, TYPE_ELECTRIC, ABILITY_STATIC, &slot)) {
            slot = EncounterSlot_WildMonSlotRoll_Fishing(rodType);
        }
        level = EncounterSlot_WildMonLevelRoll(&encSlots[slot], a2);
        break;
    case 4:
        if (!EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a2, encSlots, NUM_ENCOUNTERS_HEADBUTT, TYPE_STEEL, ABILITY_MAGNET_PULL, &slot) && !EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a2, encSlots, NUM_ENCOUNTERS_HEADBUTT, TYPE_ELECTRIC, ABILITY_STATIC, &slot)) {
            slot = EncounterSlot_WildMonSlotRoll_Headbutt();
        }
        level = EncounterSlot_WildMonLevelRoll(&encSlots[slot], a2);
        break;
    default:
        GF_ASSERT(FALSE);
    }

    if (encSlots[slot].species == SPECIES_UNOWN && !ov02_022482A4(a2)) {
        return FALSE;
    }
    if (ov02_022481EC(a2, leadMon, level)) {
        return FALSE;
    }
    if (ov02_02248290(level, a2) == TRUE) {
        return FALSE;
    }
    ov02_02247A18(encSlots[slot].species, level, battler, FALSE, a2, leadMon, battleSetup);
    return TRUE;
}

BOOL ov02_02247DA0(FieldSystem *fieldSystem, Pokemon *leadMon, int rodType, UnkStruct_ov02_02248618 *a3, u8 encType, int battler, BattleSetup *battleSetup) {
    u8 slot;
    SAFARIZONE_AREASET *sp14 = SafariZone_GetAreaSet(Save_SafariZone_Get(fieldSystem->saveData), 3);
    u16 species;
    u8 level;
    ENC_SLOT *encSlots;
    int r7 = ov02_0224E340(fieldSystem);
    TimeOfDayWildParam r3 = GF_RTC_GetTimeOfDayWildParam();

    switch (encType) {
    case 0:
        encSlots = sub_020974C4(sp14, r7, 0, r3, 4);
        break;
    case 1:
        encSlots = sub_020974C4(sp14, r7, 1, r3, 4);
        break;
    case 2:
        encSlots = sub_020974C4(sp14, r7, rodType + 2, r3, 4);
        break;
    default:
        GF_ASSERT(FALSE);
    }

    slot = 0;
    BOOL r0 = EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a3, encSlots, NUM_ENCOUNTERS_SAFARI, TYPE_STEEL, ABILITY_MAGNET_PULL, &slot);
    if (!r0) {
        r0 = EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a3, encSlots, NUM_ENCOUNTERS_SAFARI, TYPE_ELECTRIC, ABILITY_STATIC, &slot);
    }
    if (!r0) {
        slot = LCRandom() % NUM_ENCOUNTERS_SAFARI;
    }
    if (encType == 0) {
        slot = ov02_022485B0(encSlots, NUM_ENCOUNTERS_SAFARI, a3, slot);
    }
    species = encSlots[slot].species;
    level = encSlots[slot].level_max;
    if (ov02_022481EC(a3, leadMon, level) || ov02_02248290(level, a3) == TRUE) {
        Heap_Free(encSlots);
        return FALSE;
    }

    ov02_02247A18(species, level, battler, TRUE, a3, leadMon, battleSetup);
    Heap_Free(encSlots);
    return TRUE;
}
