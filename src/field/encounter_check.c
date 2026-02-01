#include "field/encounter_check.h"

#include "global.h"

#include "constants/abilities.h"
#include "constants/maps.h"
#include "constants/weather.h"

#include "battle/battle_setup.h"
#include "overlay_2/overlay_02_gear_phone.h"

#include "bug_contest.h"
#include "encounter.h"
#include "field_roamer.h"
#include "follow_mon.h"
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
#include "unk_0206D494.h"
#include "unk_02097268.h"
#include "unk_02097F6C.h"
#include "wild_encounter.h"

FS_EXTERN_OVERLAY(bug_contest);

typedef struct UnkStruct_ov02_022532B4 {
    int unk_0;
    const u8 *unk_4;
} UnkStruct_ov02_022532B4;

typedef struct UnkStruct_ov02_02248618 {
    u32 playerId;
    BOOL isRepel;
    BOOL isSweetScent;
    u8 level;
    u8 isEgg;
    u8 ability;
    u8 unk_0F;
    u8 unk_10;
    u8 isSinjohMap;
    u8 unownPuzzleFlags[4];
    Pokedex *pokedex;
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
BOOL FieldSystem_EncounterRateRoll(FieldSystem *fieldSystem, u8 encounterRate, u8 metatileBehavior);
u8 getStepCountEncounterRateBoost(u16 stepCount);
u8 FieldSystem_GetTileEncounterTypeAndRate(FieldSystem *fieldSystem, u8 metatileBehavior, u8 *pEncType);
BOOL FieldSystem_SecondEncounterRoll(FieldSystem *fieldSystem, u16 encounterRate);
u8 EncounterSlot_WildMonSlotRoll_Land(void);
u8 EncounterSlot_WildMonSlotRoll_Surfing(void);
u8 EncounterSlot_WildMonSlotRoll_Fishing(int rodType);
u8 EncounterSlot_WildMonSlotRoll_RockSmash(void);
u8 EncounterSlot_WildMonSlotRoll_Headbutt(void);
void ApplyLeadMonHeldItemEffectToEncounterRate(Pokemon *leadMon, u8 *pEncounterRate);
void ApplyFluteEffectToEncounterRate(FieldSystem *fieldSystem, u8 *pEncounterRate);
u8 getWildMonNature(Pokemon *pokemon, UnkStruct_ov02_02248618 *a1);
u8 EncounterSlot_WildMonLevelRoll(ENC_SLOT *encSlot, UnkStruct_ov02_02248618 *a1);
void ov02_02247910(u16 species, u8 level, int battler, u32 otid, UnkStruct_ov02_02248618 *a4, Pokemon *leadMon, BattleSetup *battleSetup);
void ov02_02247A18(u16 species, u8 level, int battler, BOOL forceOnePerfectIV, UnkStruct_ov02_02248618 *a4, Pokemon *leadMon, BattleSetup *battleSetup);
BOOL ov02_02247B64(Pokemon *leadMon, int rodType, UnkStruct_ov02_02248618 *a2, ENC_SLOT *encSlots, u8 encType, int battler, BattleSetup *battleSetup);
BOOL ov02_02247DA0(FieldSystem *fieldSystem, Pokemon *leadMon, int rodType, UnkStruct_ov02_02248618 *a3, u8 encType, int battler, BattleSetup *battleSetup);
BOOL ov02_02247ED8(FieldSystem *fieldSystem, Pokemon *leadMon, int rodType, UnkStruct_ov02_02248618 *a3, u8 encType, int battler, BattleSetup *battleSetup);
int FieldSystem_GetLandEncounterRate(FieldSystem *fieldSystem);
int FieldSystem_GetSurfingEncounterRate(FieldSystem *fieldSystem);
u8 FieldSystem_GetFishingEncounterRate(FieldSystem *fieldSystem, u8 rodType);
u8 getFriendshipBoostToFishingBiteRate(u8 friendship);
int FieldSystem_GetRockSmashEncounterRate(FieldSystem *fieldSystem);
BOOL ov02_022480C0(ENC_SLOT *encSlots, u8 numEncSlots, u8 type, u8 *slot);
BOOL EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(Pokemon *leadMon, UnkStruct_ov02_02248618 *a1, ENC_SLOT *encSlots, u8 numSlots, u8 type, u8 ability, u8 *slotNum);
u8 ov02_02248190(BOOL isFishing, u8 encounterRate, UnkStruct_ov02_02248618 *a2, u16 weatherType, Pokemon *leadMon);
BOOL ov02_022481EC(UnkStruct_ov02_02248618 *a0, Pokemon *leadMon, u8 level);
void ov02_02248244(FieldSystem *fieldSystem, u8 a1, BattleSetup **pBattleSetup);
BOOL ov02_02248290(u8 roamerLevel, UnkStruct_ov02_02248618 *a1);
BOOL ov02_022482A4(UnkStruct_ov02_02248618 *a0);
void ov02_022482BC(u32 otId, Roamer *roamer, BattleSetup *battleSetup);
BOOL ov02_GetRandomActiveRoamerInCurrMap(FieldSystem *fieldSystem, Roamer **pRoamer);
BOOL ov02_02248418(Pokedex *pokedex, u8 numForms, u8 targetForm);
u8 ov02_02248444(UnkStruct_ov02_02248618 *a0);
BOOL ov02_0224855C(int battler, UnkStruct_ov02_02248618 *a1, Pokemon *pokemon, BattleSetup *battleSetup);
u8 ov02_022485B0(ENC_SLOT *encSlots, int numEncSlots, UnkStruct_ov02_02248618 *a2, u8 chosenSlot);
void ov02_02248618(FieldSystem *fieldSystem, Pokemon *pokemon, const ENC_DATA *encData, UnkStruct_ov02_02248618 *a3);
void ov02_02248698(FieldSystem *fieldSystem);

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
        // ov02_02253290
        int sp8[1] = { 2 };
        // ov02_02253294
        int sp20[3] = { 0, 2, 3 };
        // ov02_022532A0
        int spC[5] = { 0, 1, 2, 3, 4 };

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
    if (fieldSystem->encounterInhibitSteps <= 3) {
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
    encounterRate = FieldSystem_GetTileEncounterTypeAndRate(fieldSystem, metatileBehavior, &encounterType);
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
        sp24.isRepel = TRUE;
        sp24.level = GetMonData(mon, MON_DATA_LEVEL, NULL);
    }
    encounterRate = ov02_02248190(FALSE, encounterRate, &sp24, LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)), leadMon);
    ApplyFluteEffectToEncounterRate(fieldSystem, &encounterRate);
    ApplyLeadMonHeldItemEffectToEncounterRate(leadMon, &encounterRate);
    BOOL ret = FieldSystem_EncounterRateRoll(fieldSystem, encounterRate, metatileBehavior) ? TRUE : FALSE;
    if (!ret) {
        return FALSE;
    }
    BOOL followerFlag = Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(fieldSystem->saveData)) ? TRUE : FALSE;
    if (!followerFlag && ov02_GetRandomActiveRoamerInCurrMap(fieldSystem, &roamer)) {
        if (!ov02_02248290(GetRoamerData(roamer, ROAMER_DATA_LEVEL), &sp24)) {
            battleSetup = BattleSetup_New(HEAP_ID_FIELD2, BATTLE_TYPE_ROAMER);
            BattleSetup_InitFromFieldSystem(battleSetup, fieldSystem);
            ov02_022482BC(sp24.playerId, roamer, battleSetup);
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
        fieldSystem->encounterInhibitSteps = 0;
        fieldSystem->reverseTurnFrameSteps = 0;
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

    u8 encounterRate = FieldSystem_GetFishingEncounterRate(fieldSystem, rodType);
    if (encounterRate == 0) {
        return FALSE;
    }

    Pokemon *leadMon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), 0);
    ov02_02248618(fieldSystem, leadMon, NULL, &sp24);
    encounterRate = ov02_02248190(TRUE, encounterRate, &sp24, LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)), leadMon);
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
    case ROD_TYPE_OLD:
        rodSlots = encData->oldRodSlots;
        break;
    case ROD_TYPE_GOOD:
        rodSlots = encData->goodRodSlots;
        break;
    case ROD_TYPE_SUPER:
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

    u8 encounterRate = FieldSystem_GetRockSmashEncounterRate(fieldSystem);
    if (encounterRate == 0) {
        return FALSE;
    }

    Pokemon *leadMon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), 0);
    ov02_02248618(fieldSystem, leadMon, NULL, &sp10);
    encounterRate = ov02_02248190(FALSE, encounterRate, &sp10, LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)), leadMon);
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
    u8 encType;
    SaveVarsFlags *saveVarsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    u32 x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    u32 z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
    u8 metatileBehavior = GetMetatileBehavior(fieldSystem, x, z);

    if (!FieldSystem_GetTileEncounterTypeAndRate(fieldSystem, metatileBehavior, &encType)) {
        return FALSE;
    }

    Party *party = SaveArray_Party_Get(fieldSystem->saveData);
    const ENC_DATA *encData = MapEvents_GetLoadedEncTable(fieldSystem);
    Pokemon *leadMon = Party_GetMonByIndex(party, 0);
    ov02_02248618(fieldSystem, leadMon, encData, &sp20);
    sp20.isSweetScent = TRUE;
    BOOL followerFlag = Save_VarsFlags_CheckHaveFollower(saveVarsFlags);
    if (!followerFlag && ov02_GetRandomActiveRoamerInCurrMap(fieldSystem, &roamer)) {
        battleSetup = BattleSetup_New(HEAP_ID_FIELD2, BATTLE_TYPE_ROAMER);
        BattleSetup_InitFromFieldSystem(battleSetup, fieldSystem);
        ov02_022482BC(sp20.playerId, roamer, battleSetup);
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
    if (encType == 0) {
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
    } else if (encType == 1) {
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
    fieldSystem->encounterInhibitSteps = 0;
    fieldSystem->reverseTurnFrameSteps = 0;
    return TRUE;
}

BOOL FieldSystem_PerformHeadbuttEncounterCheck(FieldSystem *fieldSystem, BattleSetup **pBattleSetup, const HeadbuttSlot *headbuttSlots) {
    ENC_SLOT encSlots[NUM_ENCOUNTERS_LAND];
    UnkStruct_ov02_02248618 sp2C;
    ENC_DATA_SLOT encDataSlots[NUM_ENCOUNTERS_HEADBUTT];

    Pokemon *leadMon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), 0);
    ov02_02248618(fieldSystem, leadMon, NULL, &sp2C);
    ov02_02248244(fieldSystem, 0, pBattleSetup);
    BattleSetup_InitFromFieldSystem(*pBattleSetup, fieldSystem);
    for (u8 i = 0; i < NUM_ENCOUNTERS_HEADBUTT; ++i) {
        encDataSlots[i].species = headbuttSlots[i].species;
        encDataSlots[i].level_max = headbuttSlots[i].maxLevel;
        encDataSlots[i].level_min = headbuttSlots[i].minLevel;
    }
    for (u8 i = 0; i < NUM_ENCOUNTERS_HEADBUTT; ++i) {
        encSlots[i].species = encDataSlots[i].species;
        encSlots[i].level_max = encDataSlots[i].level_max;
        encSlots[i].level_min = encDataSlots[i].level_min;
    }
    if (!ov02_02247B64(leadMon, ROD_TYPE_NONE, &sp2C, encSlots, ENCOUNTER_TYPE_HEADBUTT, BATTLER_ENEMY, *pBattleSetup)) {
        BattleSetup_Delete(*pBattleSetup);
        return FALSE;
    }

    return TRUE;
}

BOOL ov02_02247424(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, const ENC_DATA *encData, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5) {
    return ov02_02247B64(leadMon, ROD_TYPE_NONE, a5, encSlots, ENCOUNTER_TYPE_LAND, BATTLER_ENEMY, battleSetup);
}

BOOL ov02_02247444(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, const ENC_DATA *encData, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5) {
    return ov02_02247DA0(fieldSystem, leadMon, ROD_TYPE_NONE, a5, ENCOUNTER_TYPE_LAND, BATTLER_ENEMY, battleSetup);
}

BOOL ov02_02247460(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, const ENC_DATA *encData, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5) {
    FSOverlayID ovyId = FS_OVERLAY_ID(bug_contest);

    HandleLoadOverlay(ovyId, OVY_LOAD_ASYNC);
    BOOL ret = ov02_02247ED8(fieldSystem, leadMon, ROD_TYPE_NONE, a5, ENCOUNTER_TYPE_LAND, BATTLER_ENEMY, battleSetup);
    UnloadOverlayByID(ovyId);
    return ret;
}

BOOL ov02_0224749C(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a5) {
    if (ov02_02247B64(leadMon, ROD_TYPE_NONE, a5, encSlots, ENCOUNTER_TYPE_LAND, BATTLER_ENEMY, battleSetup) == FALSE) { // explicit comparison to FALSE required to match
        return FALSE;
    } else {
        return ov02_02247B64(leadMon, ROD_TYPE_NONE, a5, encSlots, ENCOUNTER_TYPE_LAND, BATTLER_ENEMY2, battleSetup);
    }
}

BOOL ov02_022474E0(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4, BOOL a5) {
    if (a5) {
        return ov02_02247DA0(fieldSystem, leadMon, ROD_TYPE_NONE, a4, ENCOUNTER_TYPE_SURFING, BATTLER_ENEMY, battleSetup);
    } else {
        return ov02_02247B64(leadMon, ROD_TYPE_NONE, a4, encSlots, ENCOUNTER_TYPE_SURFING, BATTLER_ENEMY, battleSetup);
    }
}

BOOL ov02_02247514(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4, int rodType, BOOL isSafari) {
    if (isSafari) {
        return ov02_02247DA0(fieldSystem, leadMon, rodType, a4, ENCOUNTER_TYPE_FISHING, BATTLER_ENEMY, battleSetup);
    } else {
        return ov02_02247B64(leadMon, rodType, a4, encSlots, ENCOUNTER_TYPE_FISHING, BATTLER_ENEMY, battleSetup);
    }
}

BOOL ov02_0224754C(FieldSystem *fieldSystem, Pokemon *leadMon, BattleSetup *battleSetup, ENC_SLOT *encSlots, UnkStruct_ov02_02248618 *a4) {
    return ov02_02247B64(leadMon, ROD_TYPE_NONE, a4, encSlots, ENCOUNTER_TYPE_ROCK_SMASH, BATTLER_ENEMY, battleSetup);
}

BOOL FieldSystem_EncounterRateRoll(FieldSystem *fieldSystem, u8 encounterRate, u8 metatileBehavior) {
    if (encounterRate > 100) {
        encounterRate = 100;
    }
    int avatarState = PlayerAvatar_GetState(fieldSystem->playerAvatar);
    u8 modifiedRate = 40;
    if (avatarState != PLAYER_STATE_CYCLING && avatarState != PLAYER_STATE_SURFING && !sub_0205DE98(fieldSystem->playerAvatar)) {
        modifiedRate -= 20;
    }
    if (sub_0205B6F4(metatileBehavior)) {
        modifiedRate += 40;
    } else if (avatarState == PLAYER_STATE_CYCLING) {
        modifiedRate += 30;
    }
    modifiedRate += getStepCountEncounterRateBoost(fieldSystem->reverseTurnFrameSteps);
    if (GetRadioMusicPlayingSeq() == RADIO_MUSIC_SEQ_MARCH) {
        modifiedRate += 25;
    } else if (GetRadioMusicPlayingSeq() == RADIO_MUSIC_SEQ_LULLABY) {
        modifiedRate -= 25;
    }
    if (modifiedRate > 100) {
        modifiedRate = 100;
    }
    if (LCRandRange(100) < modifiedRate && FieldSystem_SecondEncounterRoll(fieldSystem, encounterRate)) {
        return TRUE;
    }

    return FALSE;
}

u8 getStepCountEncounterRateBoost(u16 stepCount) {
    u8 result = 0;

    if (stepCount >= 4) {
        result = 60;
    } else if (stepCount >= 3) {
        result = 40;
    } else if (stepCount >= 2) {
        result = 30;
    }

    return result;
}

u8 FieldSystem_GetTileEncounterTypeAndRate(FieldSystem *fieldSystem, u8 metatileBehavior, u8 *pEncType) {
    if (MetatileBehavior_CanGenerateWalkingEncounters(metatileBehavior)) {
        if (MetatileBehavior_IsSurfableWater(metatileBehavior)) {
            *pEncType = ENCOUNTER_TYPE_SURFING;
            return FieldSystem_GetSurfingEncounterRate(fieldSystem);
        } else {
            *pEncType = ENCOUNTER_TYPE_LAND;
            return FieldSystem_GetLandEncounterRate(fieldSystem);
        }
    }

    return 0;
}

BOOL FieldSystem_SecondEncounterRoll(FieldSystem *fieldSystem, u16 encounterRate) {
    // This may have been used for some additional logic, but it's essentially
    // just an encounter roll against the unmodified rate.
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

u8 getWildMonNature(Pokemon *pokemon, UnkStruct_ov02_02248618 *a1) {
    if (!a1->isEgg && a1->ability == ABILITY_SYNCHRONIZE && LCRandRange(2) == 0) {
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
    if (!a1->isEgg && (a1->ability == ABILITY_HUSTLE || a1->ability == ABILITY_VITAL_SPIRIT || a1->ability == ABILITY_PRESSURE)) {
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
    if (a4->isEgg == 0) {
        if (a4->ability == ABILITY_CUTE_CHARM) {
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
        } else if (a4->ability == ABILITY_SYNCHRONIZE) {
            if (LCRandRange(2) == 0) {
                monNature = GetMonNature(leadMon);
                overrideGenderOrNature = TRUE;
            }
        }
    }
    personality = GenerateShinyPersonality(otid);
    if (overrideGenderOrNature) {
        do {
            if (a4->ability == ABILITY_CUTE_CHARM) {
                u8 generatedGender = GetGenderBySpeciesAndPersonality(species, personality);
                GF_ASSERT(generatedGender != MON_GENDERLESS);
                if (generatedGender != monGender) {
                    break;
                }
                personality = GenerateShinyPersonality(otid);
            } else if (a4->ability == ABILITY_SYNCHRONIZE) {
                u8 generatedNature = GetNatureFromPersonality(personality);
                if (generatedNature == monNature) {
                    break;
                }
                personality = GenerateShinyPersonality(otid);
            }
        } while (TRUE);
    }

    CreateMon(wildMon, species, level, 0x20, TRUE, personality, OT_ID_PRESET, a4->playerId);
    GF_ASSERT(ov02_0224855C(battler, a4, wildMon, battleSetup));
    Heap_Free(wildMon);
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

    if (canCoerceGender && a4->isEgg == 0 && a4->ability == ABILITY_CUTE_CHARM && LCRandRange(3) != 0) {
        monGender = GetMonData(leadMon, MON_DATA_GENDER, NULL);
        if (monGender == MON_FEMALE) {
            monGender = MON_MALE;
        } else if (monGender == MON_MALE) {
            monGender = MON_FEMALE;
        } else {
            GF_ASSERT(FALSE); // can't put cute charm on a genderless pokemon
        }
        CreateMonWithGenderNatureLetter(wildMon, species, level, 0x20, monGender, getWildMonNature(leadMon, a4), 0);
        SetMonData(wildMon, MON_DATA_OT_ID, &a4->playerId);
        GF_ASSERT(ov02_0224855C(battler, a4, wildMon, battleSetup));
        Heap_Free(wildMon);
        return;
    }

    if (forceOnePerfectIV) {
        int i;
        BOOL sp18 = FALSE;
        for (i = 0; i < 4; ++i) {
            CreateMonWithNature(wildMon, species, level, 0x20, getWildMonNature(leadMon, a4));
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
        CreateMonWithNature(wildMon, species, level, 0x20, getWildMonNature(leadMon, a4));
    }

    SetMonData(wildMon, MON_DATA_OT_ID, &a4->playerId);
    GF_ASSERT(ov02_0224855C(battler, a4, wildMon, battleSetup));
    Heap_Free(wildMon);
}

BOOL ov02_02247B64(Pokemon *leadMon, int rodType, UnkStruct_ov02_02248618 *a2, ENC_SLOT *encSlots, u8 encType, int battler, BattleSetup *battleSetup) {
    u8 slot = 0;
    u8 level = 0;

    switch (encType) {
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
    BOOL encSlotModified = EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a3, encSlots, NUM_ENCOUNTERS_SAFARI, TYPE_STEEL, ABILITY_MAGNET_PULL, &slot);
    if (!encSlotModified) {
        encSlotModified = EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(leadMon, a3, encSlots, NUM_ENCOUNTERS_SAFARI, TYPE_ELECTRIC, ABILITY_STATIC, &slot);
    }
    if (!encSlotModified) {
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

BOOL ov02_02247ED8(FieldSystem *fieldSystem, Pokemon *leadMon, int rodType, UnkStruct_ov02_02248618 *a3, u8 encType, int battler, BattleSetup *battleSetup) {
    ENC_SLOT *encSlot = BugContest_GetEncounterSlot(FieldSystem_BugContest_Get(fieldSystem), HEAP_ID_FIELD1);
    if (ov02_02248290(encSlot->level_max, a3) == TRUE) {
        Heap_Free(encSlot);
        return FALSE;
    }

    ov02_02247A18(encSlot->species, encSlot->level_max, battler, TRUE, a3, leadMon, battleSetup);
    Heap_Free(encSlot);
    return TRUE;
}

void ov02_02247F30(FieldSystem *fieldSystem, u16 species, u8 level, BOOL shiny, BattleSetup *battleSetup) {
    UnkStruct_ov02_02248618 sp10;
    Pokemon *leadMon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), 0);
    ov02_02248618(fieldSystem, leadMon, NULL, &sp10);
    if (shiny) {
        u32 otid = PlayerProfile_GetTrainerID(Save_PlayerData_GetProfile(fieldSystem->saveData));
        ov02_02247910(species, level, BATTLER_ENEMY, otid, &sp10, leadMon, battleSetup);
    } else {
        ov02_02247A18(species, level, BATTLER_ENEMY, FALSE, &sp10, leadMon, battleSetup);
    }
}

BOOL ov02_02247F9C(FieldSystem *fieldSystem, u8 metatileBehavior) {
    int encounterRate = 0;

    if (MetatileBehavior_CanGenerateWalkingEncounters(metatileBehavior)) {
        if (MetatileBehavior_IsSurfableWater(metatileBehavior)) {
            encounterRate = FieldSystem_GetSurfingEncounterRate(fieldSystem);
        } else {
            encounterRate = FieldSystem_GetLandEncounterRate(fieldSystem);
        }
    }

    if (encounterRate != 0) {
        if (fieldSystem->location->mapId == MAP_RUINS_OF_ALPH_UNDERGROUND_HALL
            || fieldSystem->location->mapId == MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT
            || fieldSystem->location->mapId == MAP_RUINS_OF_ALPH_HALL_ENTRANCE_SINJOH_EVENT
            || fieldSystem->location->mapId == MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2) {
            SaveVarsFlags *varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
            for (u8 i = 0; i < 4; ++i) {
                if (Save_VarsFlags_CheckAlphPuzzleFlag(varsFlags, i)) {
                    return TRUE;
                }
            }
            return FALSE;
        }
        return TRUE;
    }

    return FALSE;
}

int FieldSystem_GetLandEncounterRate(FieldSystem *fieldSystem) {
    const ENC_DATA *encData = MapEvents_GetLoadedEncTable(fieldSystem);
    return encData->encounterRate_walking;
}

int FieldSystem_GetSurfingEncounterRate(FieldSystem *fieldSystem) {
    const ENC_DATA *encData = MapEvents_GetLoadedEncTable(fieldSystem);
    return encData->encounterRate_surfing;
}

u8 FieldSystem_GetFishingEncounterRate(FieldSystem *fieldSystem, u8 rodType) {
    const ENC_DATA *encData = MapEvents_GetLoadedEncTable(fieldSystem);
    u8 ret;

    switch (rodType) {
    case ROD_TYPE_OLD:
        ret = encData->encounterRate_oldRod;
        break;
    case ROD_TYPE_GOOD:
        ret = encData->encounterRate_goodRod;
        break;
    case ROD_TYPE_SUPER:
        ret = encData->encounterRate_superRod;
        break;
    default:
        GF_ASSERT(FALSE);
        return 0;
    }
    if (ret == 0) {
        return 0;
    }
    if (FollowMon_IsActive(fieldSystem)) {
        ret += getFriendshipBoostToFishingBiteRate(GetMonData(GetFirstAliveMonInParty_CrashIfNone(SaveArray_Party_Get(fieldSystem->saveData)), MON_DATA_FRIENDSHIP, NULL));
    }
    return ret;
}

u8 getFriendshipBoostToFishingBiteRate(u8 friendship) {
    if (friendship <= 99) {
        return 0;
    }
    if (friendship <= 149) {
        return 20;
    }
    if (friendship <= 199) {
        return 30;
    }
    if (friendship <= 249) {
        return 40;
    }
    return 50;
}

int FieldSystem_GetRockSmashEncounterRate(FieldSystem *fieldSystem) {
    const ENC_DATA *encData = MapEvents_GetLoadedEncTable(fieldSystem);
    return encData->encounterRate_rockSmash;
}

BOOL ov02_022480C0(ENC_SLOT *encSlots, u8 numEncSlots, u8 type, u8 *slot) {
    u8 foundSlots[NUM_ENCOUNTERS_LAND];
    u8 i;
    u8 numFoundSlots;

    for (i = 0; i < NUM_ENCOUNTERS_LAND; ++i) {
        foundSlots[i] = 0;
    }
    numFoundSlots = 0;
    for (i = 0; i < numEncSlots; ++i) {
        u8 type1 = GetMonBaseStat(encSlots[i].species, BASE_TYPE1);
        u8 type2 = GetMonBaseStat(encSlots[i].species, BASE_TYPE2);
        if (type1 == type || type2 == type) {
            foundSlots[numFoundSlots++] = i;
        }
    }
    if (numFoundSlots == 0 || numFoundSlots == numEncSlots) {
        return FALSE;
    }
    *slot = foundSlots[LCRandom() % numFoundSlots];
    return TRUE;
}

BOOL EncounterSlot_AbilityInfluenceOnSlotChoiceCheck(Pokemon *leadMon, UnkStruct_ov02_02248618 *a1, ENC_SLOT *encSlots, u8 numSlots, u8 type, u8 ability, u8 *slotNum) {
    if (!a1->isEgg && a1->ability == ability && LCRandRange(2) == 0) {
        return ov02_022480C0(encSlots, numSlots, type, slotNum);
    }

    return FALSE;
}

u8 ov02_02248190(BOOL isFishing, u8 encounterRate, UnkStruct_ov02_02248618 *a2, u16 weatherType, Pokemon *leadMon) {
    int ret = encounterRate;

    if (a2->isEgg == 0) {
        if (isFishing) {
            if (a2->ability == ABILITY_STICKY_HOLD || a2->ability == ABILITY_SUCTION_CUPS) {
                ret *= 2;
            }
        } else if (a2->ability == ABILITY_ARENA_TRAP || a2->ability == ABILITY_NO_GUARD || a2->ability == ABILITY_ILLUMINATE) {
            ret *= 2;
        } else if (a2->ability == ABILITY_SNOW_CLOAK) {
            if (weatherType == WEATHER_SNOW) {
                ret /= 2;
            }
        } else if (a2->ability == ABILITY_WHITE_SMOKE || a2->ability == ABILITY_QUICK_FEET || a2->ability == ABILITY_STENCH) {
            ret /= 2;
        }
        if (ret > 100) {
            ret = 100;
        }
    }

    return ret;
}

BOOL ov02_022481EC(UnkStruct_ov02_02248618 *a0, Pokemon *leadMon, u8 level) {
    if (a0->isSweetScent) {
        return FALSE;
    }
    if (a0->isEgg == 0) {
        if (a0->ability == ABILITY_KEEN_EYE || a0->ability == ABILITY_INTIMIDATE) {
            u8 leadMonLevel = GetMonData(leadMon, MON_DATA_LEVEL, NULL);
            if (leadMonLevel <= 5) {
                return FALSE;
            } else if (level <= leadMonLevel - 5 && LCRandRange(2) == 0) {
                return TRUE;
            }
        }
    }

    return FALSE;
}

void ov02_02248244(FieldSystem *fieldSystem, u8 a1, BattleSetup **pBattleSetup) {
    switch (a1) {
    case 1: {
        LocalFieldData *localFieldData = Save_LocalFieldData_Get(fieldSystem->saveData);
        u16 *pSafariBalls = LocalFieldData_GetSafariBallsCounter(localFieldData);
        *pBattleSetup = BattleSetup_New_SafariZone(HEAP_ID_FIELD2, *pSafariBalls);
    } break;
    case 2: {
        BugContest *bugContest = FieldSystem_BugContest_Get(fieldSystem);
        u16 *pSportBalls = BugContest_GetSportBallsAddr(bugContest);
        *pBattleSetup = BattleSetup_New_BugContest(HEAP_ID_FIELD2, *pSportBalls, bugContest->mon);
    } break;
    default:
        *pBattleSetup = BattleSetup_New(HEAP_ID_FIELD2, BATTLE_TYPE_NONE);
        break;
    }
}

BOOL ov02_02248290(u8 roamerLevel, UnkStruct_ov02_02248618 *a1) {
    if (a1->isRepel && a1->level > roamerLevel) {
        return TRUE;
    }

    return FALSE;
}

BOOL ov02_022482A4(UnkStruct_ov02_02248618 *a0) {
    for (int i = 0; i < 4; ++i) {
        if (a0->unownPuzzleFlags[i]) {
            return TRUE;
        }
    }

    return FALSE;
}

void ov02_022482BC(u32 otId, Roamer *roamer, BattleSetup *battleSetup) {
    Pokemon *pokemon = AllocMonZeroed(HEAP_ID_FIELD1);
    u32 species = GetRoamerData(roamer, ROAMER_DATA_SPECIES);
    u8 level = GetRoamerData(roamer, ROAMER_DATA_LEVEL);
    u32 ivs = GetRoamerData(roamer, ROAMER_DATA_IVS);
    u32 pid = GetRoamerData(roamer, ROAMER_DATA_PERSONALITY);
    u32 status = GetRoamerData(roamer, ROAMER_DATA_STATUS);
    u16 hp = GetRoamerData(roamer, ROAMER_DATA_HP);

    CreateMonWithFixedIVs(pokemon, species, level, ivs, pid);
    SetMonData(pokemon, MON_DATA_OT_ID, &otId);
    SetMonData(pokemon, MON_DATA_STATUS, &status);
    SetMonData(pokemon, MON_DATA_HP, &hp);
    GF_ASSERT(Party_AddMon(battleSetup->party[BATTLER_ENEMY], pokemon));
    Heap_Free(pokemon);
}

BOOL ov02_GetRandomActiveRoamerInCurrMap(FieldSystem *fieldSystem, Roamer **pRoamer) {
    Roamer *foundRoamers[ROAMER_MAX];
    u8 nRoamers = 0;
    RoamerSaveData *saveRoamers = Save_Roamers_Get(fieldSystem->saveData);

    for (u8 i = 0; i < ROAMER_MAX; ++i) {
        u32 mapId = GetRoamMapByLocationIdx(Roamer_GetLocation(saveRoamers, i));
        if (GetRoamerIsActiveByIndex(saveRoamers, i) && mapId == fieldSystem->location->mapId) {
            foundRoamers[nRoamers] = Roamers_GetRoamMonStats(saveRoamers, i);
            ++nRoamers;
        }
    }
    if (nRoamers == 0) {
        return FALSE;
    }
    if (LCRandRange(2) == 0) {
        return FALSE;
    }
    if (nRoamers > 1) {
        u16 chosenRoamer = LCRandRange(nRoamers);
        *pRoamer = foundRoamers[chosenRoamer];
    } else {
        *pRoamer = foundRoamers[0];
    }
    return TRUE;
}

BOOL ov02_02248418(Pokedex *pokedex, u8 numForms, u8 targetForm) {
    for (int i = 0; i < numForms; ++i) {
        if (targetForm == Pokedex_GetSeenFormByIdx_Unown(pokedex, i, TRUE)) {
            return TRUE;
        }
    }

    return FALSE;
}

static const u8 ov02_022532EC[] = {
    UNOWN_A,
    UNOWN_B,
    UNOWN_C,
    UNOWN_D,
    UNOWN_E,
    UNOWN_F,
    UNOWN_G,
    UNOWN_H,
    UNOWN_I,
    UNOWN_J,
};
static const u8 ov02_022532DC[] = {
    UNOWN_R,
    UNOWN_S,
    UNOWN_T,
    UNOWN_U,
    UNOWN_V,
};
static const u8 ov02_022532E4[] = {
    UNOWN_K,
    UNOWN_L,
    UNOWN_M,
    UNOWN_N,
    UNOWN_O,
    UNOWN_P,
    UNOWN_Q,
};
static const u8 ov02_0225328C[] = {
    UNOWN_W,
    UNOWN_X,
    UNOWN_Y,
    UNOWN_Z,
};
static const u8 ov02_02253288[] = {
    UNOWN_EXCLAMATION_MARK,
    UNOWN_QUESTION_MARK,
};

static const UnkStruct_ov02_022532B4 ov02_022532B4[] = {
    { NELEMS(ov02_022532EC), ov02_022532EC },
    { NELEMS(ov02_022532DC), ov02_022532DC },
    { NELEMS(ov02_022532E4), ov02_022532E4 },
    { NELEMS(ov02_0225328C), ov02_0225328C },
    { NELEMS(ov02_02253288), ov02_02253288 },
};

u8 ov02_02248444(UnkStruct_ov02_02248618 *a0) {
    u8 ret;
    int i;
    int j;
    int r6;
    int r7;
    int sp14;
    BOOL spC = FALSE;
    u8 *sp8;
    u8 *sp4;
    const UnkStruct_ov02_022532B4 *r4;

    if (a0->isSinjohMap) {
        return ov02_022532B4[4].unk_4[LCRandom() % 2];
    }

    sp8 = Heap_AllocAtEnd(HEAP_ID_FIELD1, UNOWN_FORM_MAX);
    sp4 = Heap_AllocAtEnd(HEAP_ID_FIELD1, UNOWN_FORM_MAX);
    MI_CpuClear8(sp8, UNOWN_FORM_MAX);
    MI_CpuClear8(sp4, UNOWN_FORM_MAX);
    if (GetRadioMusicPlayingSeq() == RADIO_MUSIC_SEQ_UNOWN) {
        spC = TRUE;
    }
    r6 = 0;
    r7 = 0;
    sp14 = Pokedex_GetSeenFormNum_Unown(a0->pokedex, TRUE);
    for (i = 0; i < 4; ++i) {
        if (!a0->unownPuzzleFlags[i]) {
            continue;
        }
        r4 = &ov02_022532B4[i];
        for (j = 0; j < r4->unk_0; ++j) {
            if (!ov02_02248418(a0->pokedex, sp14, r4->unk_4[j])) {
                sp4[r6] = r4->unk_4[j];
                ++r6;
            }
            sp8[r7] = r4->unk_4[j];
            ++r7;
        }
    }
    if (spC && r6 > 0 && (LCRandom() % 100) < 50) {
        ret = sp4[LCRandom() % r6];
    } else {
        ret = sp8[LCRandom() % r7];
    }
    Heap_Free(sp4);
    Heap_Free(sp8);
    return ret;
}

BOOL ov02_0224855C(int battler, UnkStruct_ov02_02248618 *a1, Pokemon *pokemon, BattleSetup *battleSetup) {
    WildMonSetRandomHeldItem(pokemon, battleSetup->battleType, !a1->isEgg && a1->ability == ABILITY_COMPOUNDEYES ? 1 : 0);
    if (GetMonData(pokemon, MON_DATA_SPECIES, NULL) == SPECIES_UNOWN) {
        u8 form = ov02_02248444(a1);
        SetMonData(pokemon, MON_DATA_FORM, &form);
    }
    return Party_AddMon(battleSetup->party[battler], pokemon);
}

u8 ov02_022485B0(ENC_SLOT *encSlots, int numEncSlots, UnkStruct_ov02_02248618 *a2, u8 chosenSlot) {
    if (a2->isEgg == 0 && (a2->ability == ABILITY_VITAL_SPIRIT || a2->ability == ABILITY_HUSTLE || a2->ability == ABILITY_PRESSURE)) {
        if (LCRandRange(2) == 0) {
            return chosenSlot;
        }
        for (u8 i = 0; i < numEncSlots; ++i) {
            if (encSlots[i].species == encSlots[chosenSlot].species && encSlots[i].level_max > encSlots[chosenSlot].level_max) {
                chosenSlot = i;
            }
        }
        return chosenSlot;
    }

    return chosenSlot;
}

void ov02_02248618(FieldSystem *fieldSystem, Pokemon *pokemon, const ENC_DATA *encData, UnkStruct_ov02_02248618 *a3) {
    if (!GetMonData(pokemon, MON_DATA_IS_EGG, NULL)) {
        a3->isEgg = FALSE;
        a3->ability = GetMonData(pokemon, MON_DATA_ABILITY, NULL);
    } else {
        a3->isEgg = TRUE;
        a3->ability = NUM_ABILITIES;
    }
    a3->level = 0;
    a3->isRepel = FALSE;
    a3->isSweetScent = FALSE;
    a3->unk_0F = 0;
    a3->unk_10 = 0;
    SaveVarsFlags *saveVarsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    a3->isSinjohMap = fieldSystem->location->mapId == MAP_RUINS_OF_ALPH_HALL_ENTRANCE_SINJOH_EVENT;
    for (int i = 0; i < 4; ++i) {
        a3->unownPuzzleFlags[i] = Save_VarsFlags_CheckAlphPuzzleFlag(saveVarsFlags, i);
    }
    a3->pokedex = Save_Pokedex_Get(fieldSystem->saveData);
    a3->playerId = PlayerProfile_GetTrainerID(Save_PlayerData_GetProfile(fieldSystem->saveData));
}

void ov02_02248698(FieldSystem *fieldSystem) {
    u8 facingDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    BOOL r1 = FALSE;
    switch (facingDirection) {
    case DIR_NORTH:
        if (fieldSystem->lastFacingDirection == DIR_SOUTH) {
            r1 = TRUE;
        }
        break;
    case DIR_SOUTH:
        if (fieldSystem->lastFacingDirection == DIR_NORTH) {
            r1 = TRUE;
        }
        break;
    case DIR_WEST:
        if (fieldSystem->lastFacingDirection == DIR_EAST) {
            r1 = TRUE;
        }
        break;
    case DIR_EAST:
        if (fieldSystem->lastFacingDirection == DIR_WEST) {
            r1 = TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
        return;
    }
    if (r1 && fieldSystem->reverseTurnFrameSteps < 0xFFFF) {
        ++fieldSystem->reverseTurnFrameSteps;
    }
    fieldSystem->lastFacingDirection = facingDirection;
}
