#include "unk_0204A3F4.h"

#include "global.h"

#include "assert.h"
#include "frontier_data.h"
#include "game_stats.h"
#include "heap.h"
#include "launch_application.h"
#include "math_util.h"
#include "party.h"
#include "player_avatar.h"
#include "player_data.h"
#include "pokemon.h"
#include "pokemon_storage_system.h"
#include "save_local_field_data.h"
#include "save_vars_flags.h"
#include "scrcmd_9.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_0202D230.h"
#include "unk_02030A98.h"
#include "unk_0204B538.h"
#include "unk_02066EDC.h"

typedef struct SpeciesAndItem {
    u16 species;
    u16 item;
} SpeciesAndItem;

static u32 FrontierFieldSystem_0204B318(FrontierFieldSystem *frontierFsys);
static void FrontierFieldSystem_0204B470(FrontierFieldSystem *frontierFsys, SaveData *saveData, u32 a2);
static BOOL TryGiveTowerRibbons(SaveData *saveData, u32 ribbon, FrontierFieldSystem *frontierFsys);

static const u8 WifiBattlePointRewards[] = { 0, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 0 };
static const u8 _020FBF8C[] = { 0, 5, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0 };
static const u8 RegularBattlePointRewards[] = { 0, 3, 3, 4, 4, 5, 5, 7 };
static const u8 LinkBattlePointRewards[] = { 0, 8, 9, 11, 12, 14, 15, 18 };

static u32 NumMonsForTowerMode(u32 towerMode) {
    switch (towerMode) {
    case TOWER_MODE_SINGLE:
    case TOWER_MODE_WIFI:
    case TOWER_MODE_WIFI_PRACTICE:
        return 3;
    case TOWER_MODE_DOUBLE:
        return 4;
    case TOWER_MODE_MULTI:
    case TOWER_MODE_LINK:
    case TOWER_MODE_6:
        return 2;
    default:
        return 0;
    }
}

static BOOL PlayerHasDuplicateItem(SpeciesAndItem *validMons, u32 species, u32 item, s32 partySize) {
    for (s32 i = 0; i < partySize; i++) {
        if (species == validMons[i].species
            && item != ITEM_NONE
            && item == validMons[i].item) {
            return TRUE;
        }
    }
    return FALSE;
}

static BOOL PlayerSpeciesAndItemsAreUnique(SpeciesAndItem *mons, s32 size) {
    for (s32 i = 0; i < size - 1; i++) {
        for (s32 j = i + 1; j < size; j++) {
            if (mons[i].species == mons[j].species) {
                return FALSE;
            }
            if (mons[i].item != ITEM_NONE && mons[i].item == mons[j].item) {
                return FALSE;
            }
        }
    }
    return TRUE;
}

static BOOL PlayerHasEnoughValidUniqueSpeciesAndItems(SpeciesAndItem *validMons, u32 numRequired, s32 numValid, s32 n) {
    MI_CpuClear8(mons, sizeof(SpeciesAndItem) * NELEMS(mons));
    for (s32 i = 0; i < n; i++) {
        mons[0] = validMons[i];
        for (s32 j = i + 1; j < numValid; j++) {
            mons[1] = validMons[j];
            if (numRequired == 2) {
                if (PlayerSpeciesAndItemsAreUnique(mons, numRequired)) {
                    return TRUE;
                }
                continue;
            }
            for (s32 k = j + 1; k < numValid; k++) {
                mons[2] = validMons[k];
                if (numRequired == 3) {
                    if (PlayerSpeciesAndItemsAreUnique(mons, numRequired)) {
                        return TRUE;
                    }
                    continue;
                }
                for (s32 l = k + 1; l < numValid; l++) {
                    mons[3] = validMons[l];
                    if (PlayerSpeciesAndItemsAreUnique(mons, numRequired)) {
                        return TRUE;
                    }
                }
            }
        }
    }
    return FALSE;
}

BOOL PartyIsValidForTower(u16 numRequired, SaveData *saveData, BOOL checkDuplicateItems) {
    u8 i;
    u8 partyCount;
    u8 numValid;
    u16 species, item, form;
    Party *party = SaveArray_Party_Get(saveData);
    partyCount = Party_GetCount(party);
    if (partyCount < numRequired) {
        return FALSE;
    }
    SpeciesAndItem validMons[PARTY_SIZE];
    for (i = 0, numValid = 0; i < partyCount; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);
        species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
        form = GetMonData(mon, MON_DATA_FORM, NULL);
        if (!checkDuplicateItems) {
            item = ITEM_NONE;
        }
        if (GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
            continue;
        }
        if (IsPokemonBannedFromBattleFrontier(species, form)) {
            continue;
        }
        if (checkDuplicateItems && PlayerHasDuplicateItem(validMons, species, item, numValid)) {
            continue;
        }
        validMons[numValid].species = species;
        validMons[numValid].item = item;
        numValid++;
    }
    if (numValid < numRequired) {
        return FALSE;
    }
    return PlayerHasEnoughValidUniqueSpeciesAndItems(validMons, numRequired, numValid, numValid - numRequired + 1);
}

void ResetSystem(void) {
    OS_ResetSystem(0);
}

void sub_0204A698(u32 a0) {
    sub_0202D234(a0);
}

u32 sub_0204A6A0(u32 a0) {
    return sub_0202D3DC();
}

void sub_0204A6A8(FieldSystem *fieldSystem) {
    Location *warp = LocalFieldData_GetDynamicWarp(Save_LocalFieldData_Get(fieldSystem->saveData));
    u32 z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
    u32 x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    warp->mapId = fieldSystem->location->mapId;
    warp->warpId = -1;
    warp->x = x;
    warp->y = z;
    warp->direction = DIR_NORTH;
    SetFlag966(Save_VarsFlags_Get(fieldSystem->saveData));
}

void sub_0204A6E8(FieldSystem *fieldSystem) {
    ClearFlag966(Save_VarsFlags_Get(fieldSystem->saveData));
}

u32 sub_0204A6F8(SaveData *saveData, u32 towerMode) {
    if (towerMode == TOWER_MODE_WIFI_PRACTICE) {
        return FALSE;
    } else if (towerMode == TOWER_MODE_6) {
        return FrontierSave_GetStat(Save_Frontier_GetStatic(saveData), 113, sub_0205C268(113));
    } else {
        return FrontierSave_GetStat(Save_Frontier_GetStatic(saveData), 2 * towerMode + 1, 0xff);
    }
}

void sub_0204A730(SaveData *saveData, u8 a1) {
    FRONTIERDATA *frontierData = Save_FrontierData_Get(saveData);
    if (a1 == 0) {
        sub_0202D5DC(frontierData, 5, 2);
    } else {
        sub_0202D5DC(frontierData, 5, 1);
    }
}

u16 sub_0204A750(SaveData *saveData) {
    return sub_0202D5DC(Save_FrontierData_Get(saveData), 5, 0);
}

u32 sub_0204A764(SaveData *saveData) {
    u32 unk = sub_0202D908(saveData);
    FRONTIERDATA *frontierData = Save_FrontierData_Get(saveData);
    u8 towerMode = sub_0202D284(unk, 0, 0);
    if (towerMode == TOWER_MODE_WIFI_PRACTICE) {
        return towerMode;
    }
    if (towerMode == TOWER_MODE_6) {
        sub_02031108(Save_Frontier_GetStatic(saveData), 100, sub_0205C268(100), 0);
    } else {
        sub_0202D5DC(frontierData, towerMode + 8, 2);
    }
    sub_0202D57C(frontierData, towerMode, 2);
    sub_02031108(Save_Frontier_GetStatic(saveData), sub_0205C310(towerMode), sub_0205C268(sub_0205C310(towerMode)), 0);
    if (towerMode != TOWER_MODE_WIFI && towerMode != TOWER_MODE_6) {
        sub_020674E0(saveData);
    }
    return towerMode;
}

u16 sub_0204A800(SaveData *saveData) {
    return sub_0202D7B0(sub_0202D928(saveData));
}

void FrontierFieldSystem_0204A810(FrontierFieldSystem **frontierFsys) {
    GF_ASSERT(*frontierFsys == NULL);
    *frontierFsys = NULL;
}

FrontierFieldSystem *FrontierFieldSystem_New(SaveData *saveData, BOOL resumeFromPrevious, u32 towerMode) {
    FrontierFieldSystem *frontierFsys = Heap_Alloc(HEAP_ID_FIELD2, sizeof(FrontierFieldSystem));
    MI_CpuClear8(frontierFsys, sizeof(FrontierFieldSystem));
    frontierFsys->heapID = HEAP_ID_FIELD2;
    frontierFsys->unk70 = sub_0202D908(saveData);
    frontierFsys->frontierData = Save_FrontierData_Get(saveData);
    frontierFsys->unk00 = 0x12345678;
    sub_0202D3E4(frontierFsys->unk70, 0);
    if (!resumeFromPrevious) {
        frontierFsys->towerMode = towerMode;
        frontierFsys->numMons = NumMonsForTowerMode(frontierFsys->towerMode);
        frontierFsys->currentBattleNumber = 1;
        frontierFsys->curWinStreak = 0;
        for (u16 i = 0; i < 4; i++) {
            frontierFsys->partyMonIndexes[i] = 0xff;
        }
        for (u16 i = 0; i < 14; i++) {
            frontierFsys->trainersInCurrentRound[i] = 0xffff;
        }
        sub_0202D234(frontierFsys->unk70);
        u8 towerMode = frontierFsys->towerMode;
        sub_0202D308(frontierFsys->unk70, 0, &towerMode);
    } else {
        frontierFsys->towerMode = sub_0202D284(frontierFsys->unk70, 0, 0);
        frontierFsys->currentBattleNumber = sub_0202D284(frontierFsys->unk70, 1, 0);
        frontierFsys->curWinStreak = frontierFsys->currentBattleNumber - 1;
        frontierFsys->numMons = NumMonsForTowerMode(frontierFsys->towerMode);
        sub_0202D284(frontierFsys->unk70, 5, frontierFsys->partyMonIndexes);
        sub_0202D284(frontierFsys->unk70, 8, frontierFsys->trainersInCurrentRound);
        frontierFsys->unk08 = sub_0202D284(frontierFsys->unk70, 10, 0);
        if (frontierFsys->towerMode == TOWER_MODE_MULTI) {
            frontierFsys->multiBattleAllyID = sub_0202D284(frontierFsys->unk70, 9, 0);
            sub_0202D284(frontierFsys->unk70, 6, &frontierFsys->multiBattleAllyData[frontierFsys->multiBattleAllyID]);
            FrontierFieldSystem_GenerateAllyFrontierMons(frontierFsys,
                &frontierFsys->frontierStatTrainers[frontierFsys->multiBattleAllyID],
                300 + frontierFsys->multiBattleAllyID,
                sub_0202D284(frontierFsys->unk70, 7, 0),
                &frontierFsys->multiBattleAllyData[frontierFsys->multiBattleAllyID],
                frontierFsys->heapID);
        }
    }
    frontierFsys->trainerGender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfile(saveData));
    if (frontierFsys->towerMode != TOWER_MODE_WIFI_PRACTICE) {
        FrontierSave *frontierSaveData = Save_Frontier_GetStatic(saveData);
        GameStats *gameStats = Save_GameStats_Get(saveData);
        u16 unk0;
        if (frontierFsys->towerMode == TOWER_MODE_6) {
            unk0 = Save_VarsFlags_GetVar4052(Save_VarsFlags_Get(saveData));
        } else {
            unk0 = sub_0202D5DC(frontierFsys->frontierData, frontierFsys->towerMode + 8, 0);
        }
        if (unk0 != 0) {
            u32 unk0;
            if (frontierFsys->towerMode == TOWER_MODE_6) {
                unk0 = FrontierSave_GetStat(frontierSaveData, 113, sub_0205C268(113));
            } else {
                unk0 = FrontierSave_GetStat(frontierSaveData, 2 * frontierFsys->towerMode + 1, 0xff);
            }
            frontierFsys->currentBattleInSession = unk0;
            frontierFsys->currentRound = sub_0202D57C(frontierFsys->frontierData, frontierFsys->towerMode, 0);
        }
        frontierFsys->totalTowerWins = GameStats_GetCapped(gameStats, GAME_STAT_BATTLE_TOWER_WIN_COUNT);
    }
    if (frontierFsys->towerMode == TOWER_MODE_6) {
        frontierFsys->currentRound = sub_0202D5C4(frontierFsys->frontierData, 6, frontierFsys->currentBattleInSession / 7);
    }
    return frontierFsys;
}

void FrontierFieldSystem_0204AA2C(FrontierFieldSystem *frontierFsys) {
    if (frontierFsys == NULL) {
        return;
    }
    GF_ASSERT(frontierFsys->unk00 == 0x12345678);
    MI_CpuClear8(frontierFsys, sizeof(FrontierFieldSystem));
    Heap_Free(frontierFsys);
}

void FrontierFieldSystem_0204AA58(FrontierFieldSystem *frontierFsys, TaskManager *taskManager, void *a2) {
    sub_02067118(taskManager, a2, 17, 0, frontierFsys->numMons, frontierFsys->numMons, 100, 0);
}

BOOL FrontierFieldSystem_0204AA78(FrontierFieldSystem *frontierFsys, void **a1, SaveData *saveData) {
    Party *party;
    u8 *unk = *a1;
    if (unk[0x27] != 0 || unk[0x26] == 7) {
        Heap_Free(*a1);
        *a1 = NULL;
        return FALSE;
    }
    party = SaveArray_Party_Get(saveData);
    for (u16 i = 0; i < frontierFsys->numMons; i++) {
        frontierFsys->partyMonIndexes[i] = unk[0x30 + i] - 1;
        Pokemon *mon = Party_GetMonByIndex(party, frontierFsys->partyMonIndexes[i]);
        frontierFsys->partyMonSpecies[i] = GetMonData(mon, MON_DATA_SPECIES, NULL);
        frontierFsys->partyMonItems[i] = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
    }
    Heap_Free(*a1);
    *a1 = NULL;
    return TRUE;
}

u32 FrontierFieldSystem_SelectedPartyHasDuplicateSpeciesOrItem(FrontierFieldSystem *frontierFsys, SaveData *saveData) {
    u16 species[4];
    u16 items[4];
    Party *party = SaveArray_Party_Get(saveData);
    for (u16 i = 0; i < frontierFsys->numMons; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, frontierFsys->partyMonIndexes[i]);
        species[i] = GetMonData(mon, MON_DATA_SPECIES, NULL);
        items[i] = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
        if (i == 0) {
            continue;
        }
        for (u16 j = 0; j < i; j++) {
            if (species[i] == species[j]) {
                return 1;
            }
            if (items[i] != ITEM_NONE && items[i] == items[j]) {
                return 2;
            }
        }
    }
    return 0;
}

static BOOL FrontierTrainerAlreadyInCurrentRound(u16 *existingIDs, u32 frontierTrainerID, u16 comparisons) {
    for (u16 i = 0; i < comparisons; i++) {
        if (frontierTrainerID == existingIDs[i]) {
            return TRUE;
        }
    }
    return FALSE;
}

void FrontierFieldSystem_SetRandomFrontierTrainers(FrontierFieldSystem *frontierFsys, SaveData *saveData) {
    // saveData is unused
    s32 i;
    u32 frontierTrainerID;
    u8 difficultyBracket;
    if (frontierFsys->towerMode == TOWER_MODE_MULTI || frontierFsys->towerMode == TOWER_MODE_6 || frontierFsys->towerMode == TOWER_MODE_LINK) {
        u32 temp;
        if ((frontierFsys->towerMode == TOWER_MODE_LINK && frontierFsys->linkAllyRound > frontierFsys->currentRound)
            || (frontierFsys->towerMode == TOWER_MODE_6 && frontierFsys->linkAllyRound > frontierFsys->currentRound)) {
            temp = frontierFsys->linkAllyRound;
        } else {
            temp = frontierFsys->currentRound;
        }
        difficultyBracket = temp;
        for (i = 0; i < 14; i++) {
            do {
                frontierTrainerID = FrontierFieldSystem_GetRandomFrontierTrainerID(frontierFsys, difficultyBracket, i / 2, frontierFsys->towerMode);
            } while (FrontierTrainerAlreadyInCurrentRound(frontierFsys->trainersInCurrentRound, frontierTrainerID, i));
            frontierFsys->trainersInCurrentRound[i] = frontierTrainerID;
        }
    } else {
        for (i = 0; i < 7; i++) {
            do {
                frontierTrainerID = FrontierFieldSystem_GetRandomFrontierTrainerID(frontierFsys, frontierFsys->currentRound, i, frontierFsys->towerMode);
            } while (FrontierTrainerAlreadyInCurrentRound(frontierFsys->trainersInCurrentRound, frontierTrainerID, i));
            frontierFsys->trainersInCurrentRound[i] = frontierTrainerID;
        }
    }
}

u8 FrontierFieldSystem_GetFrontierBattleNumber(FrontierFieldSystem *frontierFsys) {
    return frontierFsys->currentBattleNumber;
}

BOOL FrontierFieldSystem_0204AC7C(FrontierFieldSystem *frontierFsys) {
    if (frontierFsys->unk10_0) {
        return TRUE;
    }
    if (frontierFsys->currentBattleNumber > 7) {
        frontierFsys->unk10_0 = TRUE;
        return TRUE;
    }
    return FALSE;
}

static void FrontierFieldSystem_0204ACA0(FrontierFieldSystem *frontierFsys, SaveData *saveData, BOOL a2, u16 a3) {
    // a2 and a3 are unused
    switch (frontierFsys->towerMode) {
    case TOWER_MODE_SINGLE:
        FrontierFieldSystem_0204B470(frontierFsys, saveData, 0);
        break;
    case TOWER_MODE_DOUBLE:
        break;
    case TOWER_MODE_WIFI:
        FrontierFieldSystem_0204B470(frontierFsys, saveData, 1);
        sub_0202D3B0(frontierFsys->unk70, frontierFsys->unk28, frontierFsys->unk24, frontierFsys->unk26);
        u8 temp = frontierFsys->towerMode;
        sub_0202D308(frontierFsys->unk70, 0, &temp);
        temp = frontierFsys->currentBattleNumber;
        sub_0202D308(frontierFsys->unk70, 1, &temp);
        sub_0202D4FC(frontierFsys->frontierData, frontierFsys->unk70);
    }
}

void FrontierFieldSystem_0204AD04(FrontierFieldSystem *frontierFsys, SaveData *saveData) {
    GameStats *gameStats = Save_GameStats_Get(saveData);
    FrontierSave *frontierSaveData = Save_Frontier_GetStatic(saveData);
    if (frontierFsys->towerMode == TOWER_MODE_WIFI_PRACTICE) {
        return;
    }
    u32 unk4 = frontierFsys->towerMode == TOWER_MODE_6 ? 112 : frontierFsys->towerMode * 2;
    FrontierSave_GetStat(frontierSaveData, unk4, sub_0205C268(unk4));
    sub_0203126C(frontierSaveData, unk4, sub_0205C268(unk4), frontierFsys->currentBattleInSession + frontierFsys->curWinStreak);
    if (frontierFsys->towerMode == TOWER_MODE_6) {
        FrontierSave_GetStat(Save_Frontier_GetStatic(saveData), 100, sub_0205C268(100));
    } else {
        sub_0202D5DC(frontierFsys->frontierData, frontierFsys->towerMode + 8, 0);
    }
    u32 unk = sub_02031108(frontierSaveData, unk4 + 1, sub_0205C268(unk4 + 1), frontierFsys->currentBattleInSession + frontierFsys->curWinStreak);
    if (frontierFsys->towerMode == TOWER_MODE_6) {
        sub_02031108(Save_Frontier_GetStatic(saveData), 100, sub_0205C268(100), 0);
    } else {
        sub_0202D5DC(frontierFsys->frontierData, frontierFsys->towerMode + 8, 2);
    }
    GameStats_Add(gameStats, GAME_STAT_BATTLE_TOWER_WIN_COUNT, frontierFsys->curWinStreak);
    sub_0202D57C(frontierFsys->frontierData, frontierFsys->towerMode, 2);
    if (frontierFsys->towerMode != TOWER_MODE_6) {
        GameStats_Add(Save_GameStats_Get(saveData), GAME_STAT_BATTLE_TOWER_BATTLE_COUNT, 1);
    }
    FrontierFieldSystem_0204B318(frontierFsys);
    unk++;
    if (unk > 9999) {
        unk = 9999;
    }
    FrontierFieldSystem_0204ACA0(frontierFsys, saveData, 0, unk);
}

void FrontierFieldSystem_0204AE20(FrontierFieldSystem *frontierFsys, SaveData *saveData) {
    if (frontierFsys->towerMode == TOWER_MODE_WIFI_PRACTICE) {
        return;
    }
    GameStats *gameStats = Save_GameStats_Get(saveData);
    FrontierSave *frontierSaveData = Save_Frontier_GetStatic(saveData);
    u32 unk4 = frontierFsys->towerMode == TOWER_MODE_6 ? 112 : frontierFsys->towerMode * 2;
    if (frontierFsys->towerMode == TOWER_MODE_6) {
        FrontierSave_GetStat(Save_Frontier_GetStatic(saveData), 100, sub_0205C268(100));
    } else {
        sub_0202D5DC(frontierFsys->frontierData, frontierFsys->towerMode + 8, 0);
    }
    u32 unk6 = sub_02031108(frontierSaveData, unk4 + 1, sub_0205C268(unk4 + 1), frontierFsys->currentBattleInSession + frontierFsys->curWinStreak);
    if (frontierFsys->towerMode == TOWER_MODE_6) {
        sub_02031108(Save_Frontier_GetStatic(saveData), 100, sub_0205C268(100), 1);
    } else {
        sub_0202D5DC(frontierFsys->frontierData, frontierFsys->towerMode + 8, 1);
    }
    FrontierSave_GetStat(frontierSaveData, unk4, sub_0205C268(unk4));
    sub_0203126C(frontierSaveData, unk4, sub_0205C268(unk4), unk6);
    GameStats_Add(gameStats, GAME_STAT_BATTLE_TOWER_WIN_COUNT, 7);
    sub_0202D57C(frontierFsys->frontierData, frontierFsys->towerMode, 3);
    if (frontierFsys->towerMode != TOWER_MODE_6) {
        GameStats_Add(gameStats, GAME_STAT_BATTLE_TOWER_BATTLE_COUNT, 1);
    }
    GameStats_AddScore(gameStats, SCORE_EVENT_14);
    FrontierFieldSystem_0204B318(frontierFsys);
    FrontierFieldSystem_0204ACA0(frontierFsys, saveData, 1, unk6);
}

void FrontierFieldSystem_0204AF2C(FrontierFieldSystem *frontierFsys) {
    u8 temp = frontierFsys->towerMode;
    sub_0202D308(frontierFsys->unk70, 0, &temp);
    temp = frontierFsys->currentBattleNumber;
    sub_0202D308(frontierFsys->unk70, 1, &temp);
    sub_0202D308(frontierFsys->unk70, 5, frontierFsys->partyMonIndexes);
    sub_0202D3B0(frontierFsys->unk70, frontierFsys->unk28, frontierFsys->unk24, frontierFsys->unk26);
    sub_0202D308(frontierFsys->unk70, 8, frontierFsys->trainersInCurrentRound);
    sub_0202D308(frontierFsys->unk70, 10, &frontierFsys->unk08);
    sub_0202D3E4(frontierFsys->unk70, 1);
    if (frontierFsys->towerMode == TOWER_MODE_MULTI) {
        temp = frontierFsys->multiBattleAllyID;
        sub_0202D308(frontierFsys->unk70, 9, &temp);
        sub_0202D308(frontierFsys->unk70, 6, &frontierFsys->multiBattleAllyData[frontierFsys->multiBattleAllyID]);
        sub_0202D308(frontierFsys->unk70, 7, &frontierFsys->unk838[frontierFsys->multiBattleAllyID]);
    }
}

void FrontierFieldSystem_0204AFE0(FrontierFieldSystem *frontierFsys) {
    for (s32 i = 0; i < 5; i++) {
        frontierFsys->unk838[i] = FrontierFieldSystem_0204BA04(frontierFsys, &frontierFsys->frontierStatTrainers[i], 300 + i, frontierFsys->numMons, frontierFsys->partyMonSpecies, frontierFsys->partyMonItems, &frontierFsys->multiBattleAllyData[i], frontierFsys->heapID);
    }
}

u32 FrontierFieldSystem_0204B044(FrontierFieldSystem *frontierFsys, u32 a1) {
    sub_0204B5E8(frontierFsys->unk78[a1].unk04);
}

u32 FrontierFieldSystem_GetBattleTowerMode(FrontierFieldSystem *frontierFsys) {
    return frontierFsys->towerMode;
}

u32 FrontierFieldSystem_GetPalmerDefeated(FrontierFieldSystem *frontierFsys) {
    return frontierFsys->palmerDefeated;
}

u32 FrontierFieldSystem_AwardTowerBattlePoints(FrontierFieldSystem *frontierFsys) {
    u32 battlePoints;
    if (frontierFsys->towerMode == TOWER_MODE_WIFI_PRACTICE) {
        return 0;
    }
    if (frontierFsys->towerMode == TOWER_MODE_WIFI) {
        battlePoints = WifiBattlePointRewards[sub_0202D488(frontierFsys->frontierData, 0)];
    } else {
        if (frontierFsys->towerMode == TOWER_MODE_LINK || frontierFsys->towerMode == TOWER_MODE_6) {
            u32 round = sub_0202D57C(frontierFsys->frontierData, frontierFsys->towerMode, 0);
            if (round >= 7) {
                battlePoints = 18;
            } else {
                battlePoints = LinkBattlePointRewards[round];
            }
        } else {
            u32 round = sub_0202D57C(frontierFsys->frontierData, frontierFsys->towerMode, 0);
            if (frontierFsys->palmerDefeated) {
                battlePoints = 20;
            } else if (round >= 7) {
                battlePoints = 7;
            } else {
                battlePoints = RegularBattlePointRewards[round];
            }
        }
    }
    FrontierData_BattlePointAction(frontierFsys->frontierData, battlePoints, 5);
    return battlePoints;
}

BOOL FrontierFieldSystem_0204B0E0(FrontierFieldSystem *frontierFsys, SaveData *saveData) {
    u32 unk = sub_0204A6F8(saveData, frontierFsys->towerMode);
    if (unk < 50) {
        return FALSE;
    } else if (unk >= 100) {
        if (sub_0202D5DC(frontierFsys->frontierData, 1, 0)) {
            return FALSE;
        }
    } else if (sub_0202D5DC(frontierFsys->frontierData, 0, 0)) {
        return FALSE;
    }
    return TRUE;
}

u32 FrontierFieldSystem_0204B120(FrontierFieldSystem *frontierFsys, SaveData *saveData, u32 a2) {
    FRONTIERDATA *frontierData = Save_FrontierData_Get(saveData);
    switch (a2) {
    case 0:
        return sub_0202D488(frontierData, 0);
    case 1: {
        sub_0202D5DC(frontierData, 4, 2);
        s32 unk0 = sub_0202D488(frontierData, 0); // Wifi Battle Rank?
        if (unk0 == 10) {
            frontierFsys->unk10_4 = TRUE;
            return 0;
        }
        sub_0202D488(frontierData, 3);
        if (unk0 + 1 >= 5) {
            frontierFsys->unk10_4 = TRUE;
        }
        return 1;
    }
    case 2: {
        u32 unk4 = sub_0202D450(frontierData, 3);
        s32 unk0 = sub_0202D488(frontierData, 0);
        if (unk0 == 1) {
            return 0;
        }
        u32 index = unk0 - 1;
        if (unk4 >= _020FBF8C[index]) {
            sub_0202D488(frontierData, 4);
            sub_0202D450(frontierData, 2);
            sub_0202D5DC(frontierData, 4, 2);
            return 1;
        }
        return 0;
    }
    }
    return 0;
}

BOOL FrontierFieldSystem_TryGivePalmerRibbons(FrontierFieldSystem *frontierFsys, SaveData *saveData) {
    if (frontierFsys->towerMode != TOWER_MODE_SINGLE) {
        return FALSE;
    }
    switch (frontierFsys->palmerDefeated) {
    case 1:
        return TryGiveTowerRibbons(saveData, MON_DATA_ABILITY_RIBBON, frontierFsys);
    case 2:
        return TryGiveTowerRibbons(saveData, MON_DATA_GREAT_ABILITY_RIBBON, frontierFsys);
    }
    return FALSE;
}

BOOL FrontierFieldSystem_TryGiveOtherTowerRibbons(FrontierFieldSystem *frontierFsys, SaveData *saveData) {
    if (frontierFsys->towerMode == TOWER_MODE_WIFI_PRACTICE) {
        return FALSE;
    }
    if (frontierFsys->towerMode == TOWER_MODE_6) {
        return FALSE;
    }
    if (!frontierFsys->unk10_4) {
        return FALSE;
    }
    u32 ribbon;
    switch (frontierFsys->towerMode) {
    case TOWER_MODE_DOUBLE:
        ribbon = MON_DATA_DOUBLE_ABILITY_RIBBON;
        break;
    case TOWER_MODE_MULTI:
        ribbon = MON_DATA_MULTI_ABILITY_RIBBON;
        break;
    case TOWER_MODE_LINK:
        ribbon = MON_DATA_PAIR_ABILITY_RIBBON;
        break;
    case TOWER_MODE_WIFI:
        ribbon = MON_DATA_WORLD_ABILITY_RIBBON;
        break;
    }
    return TryGiveTowerRibbons(saveData, ribbon, frontierFsys);
}

u16 FrontierFieldSystem_0204B258(FrontierFieldSystem *frontierFsys, SaveData *saveData) {
    u8 unk;
    if (frontierFsys->towerMode == TOWER_MODE_6) {
        unk = FrontierSave_GetStat(Save_Frontier_GetStatic(saveData), 100, sub_0205C268(100));
    } else {
        unk = sub_0202D5DC(frontierFsys->frontierData, frontierFsys->towerMode + 8, 0);
    }
    if (unk == 0) {
        frontierFsys->unk08 = sub_020674E0(saveData);
    } else {
        frontierFsys->unk08 = sub_0206751C(saveData);
    }
    return frontierFsys->unk08 / 0xffff; // unk08 is a u32, so this should return between 0-3?
}

static BOOL TryGiveTowerRibbons(SaveData *saveData, u32 ribbon, FrontierFieldSystem *frontierFsys) {
    u8 value = TRUE;
    Party *party = SaveArray_Party_Get(saveData);
    u8 count = 0;
    for (s32 i = 0; i < frontierFsys->numMons; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, frontierFsys->partyMonIndexes[i]);
        if (GetMonData(mon, ribbon, NULL) == FALSE) {
            SetMonData(mon, ribbon, &value);
            count++;
        }
    }
    if (count == 0) {
        return FALSE;
    } else {
        return TRUE;
    }
}

static u32 FrontierFieldSystem_0204B318(FrontierFieldSystem *frontierFsys) {
    if (frontierFsys->towerMode == TOWER_MODE_WIFI_PRACTICE || frontierFsys->towerMode == TOWER_MODE_SINGLE || frontierFsys->towerMode == TOWER_MODE_6 || frontierFsys->towerMode == TOWER_MODE_WIFI) {
        return FALSE;
    }
    if ((u16)(frontierFsys->currentBattleInSession + frontierFsys->curWinStreak) < 50) {
        return FALSE;
    }
    frontierFsys->unk10_4 = TRUE;
    return TRUE;
}

static void SetFrontierMonStruct(FrontierMonStruct *frontierMonStruct, Pokemon *mon) {
    frontierMonStruct->species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    frontierMonStruct->form = GetMonData(mon, MON_DATA_FORM, NULL);
    frontierMonStruct->item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
    for (s32 i = 0; i < MAX_MON_MOVES; i++) {
        frontierMonStruct->moves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
        frontierMonStruct->ppUp |= GetMonData(mon, MON_DATA_MOVE1_PP_UPS + i, NULL) << (i * 2);
    }
    frontierMonStruct->language = GetMonData(mon, MON_DATA_LANGUAGE, NULL);
    frontierMonStruct->otID = GetMonData(mon, MON_DATA_OT_ID, NULL);
    frontierMonStruct->pid = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
    frontierMonStruct->ivsWord = GetMonData(mon, MON_DATA_COMBINED_IVS, NULL);
    for (s32 i = 0; i < NUM_STATS; i++) {
        frontierMonStruct->evs[i] = GetMonData(mon, MON_DATA_HP_EV + i, NULL);
    }
    frontierMonStruct->ability = GetMonData(mon, MON_DATA_ABILITY, NULL);
    frontierMonStruct->friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
    GetMonData(mon, MON_DATA_NICKNAME, frontierMonStruct->nickname);
}

static void FrontierFieldSystem_0204B470(FrontierFieldSystem *frontierFsys, SaveData *saveData, u32 a2) {
    FrontierMonStruct *frontierMonStructs = Heap_AllocAtEnd(frontierFsys->heapID, 3 * sizeof(FrontierMonStruct));
    MI_CpuClear8(frontierMonStructs, 3 * sizeof(FrontierMonStruct));
    Party *party = SaveArray_Party_Get(saveData);
    for (s32 i = 0; i < 3; i++) {
        SetFrontierMonStruct(&frontierMonStructs[i], Party_GetMonByIndex(party, frontierFsys->partyMonIndexes[i]));
    }
    sub_0202D4B8(frontierFsys->frontierData, a2, frontierMonStructs);
    MI_CpuClear8(frontierMonStructs, 3 * sizeof(FrontierMonStruct));
    Heap_Free(frontierMonStructs);
}

u8 GetFrontierTrainerIVs(u32 frontierTrainerIndex) {
    if (frontierTrainerIndex < 100) {
        return 3;
    }
    if (frontierTrainerIndex < 120) {
        return 6;
    }
    if (frontierTrainerIndex < 140) {
        return 9;
    }
    if (frontierTrainerIndex < 160) {
        return 12;
    }
    if (frontierTrainerIndex < 180) {
        return 15;
    }
    if (frontierTrainerIndex < 200) {
        return 18;
    }
    if (frontierTrainerIndex < 220) {
        return 21;
    }
    return 31;
}

u16 FrontierFieldSystem_0204B510(FrontierFieldSystem *frontierFsys) {
    if (frontierFsys->towerMode == TOWER_MODE_6) {
        return LCRandom();
    }
    frontierFsys->unk08 = sub_020674A4(frontierFsys->unk08);
    return frontierFsys->unk08 / 0xffff;
}
