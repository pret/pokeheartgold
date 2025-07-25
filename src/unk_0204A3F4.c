#include "unk_0204A3F4.h"

#include "global.h"

#include "assert.h"
#include "field_player_avatar.h"
#include "frontier_data.h"
#include "game_stats.h"
#include "heap.h"
#include "launch_application.h"
#include "math_util.h"
#include "party.h"
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

static u32 sub_0204B318(UnkStruct_Fsys_A0 *a0);
static void sub_0204B470(UnkStruct_Fsys_A0 *a0, SaveData *saveData, u32 a2);
static BOOL sub_0204B2B8(SaveData *saveData, u32 ribbon, UnkStruct_Fsys_A0 *a2);

static const u8 _020FBF98[] = { 0, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 0 };
static const u8 _020FBF8C[] = { 0, 5, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0 };
static const u8 _020FBF84[] = { 0, 3, 3, 4, 4, 5, 5, 7 };
static const u8 _020FBF7C[] = { 0, 8, 9, 11, 12, 14, 15, 18 };

static u32 sub_0204A3F4(u32 a0) {
    switch (a0) {
    case 0:
    case 4:
    case 5:
        return 3;
    case 1:
        return 4;
    case 2:
    case 3:
    case 6:
        return 2;
    default:
        return 0;
    }
}

static BOOL sub_0204A424(SpeciesAndItem *validMons, u32 species, u32 item, s32 size) {
    for (s32 i = 0; i < size; i++) {
        if (species == validMons[i].species
            && item != ITEM_NONE
            && item == validMons[i].item) {
            return TRUE;
        }
    }
    return FALSE;
}

static BOOL sub_0204A450(SpeciesAndItem *mons, s32 size) {
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

static BOOL sub_0204A4A0(SpeciesAndItem *validMons, u32 numRequired, s32 numValid, s32 n) {
    // this assumes that numRequired is always either 2, 3, or 4
    SpeciesAndItem mons[4];
    MI_CpuClear8(mons, sizeof(SpeciesAndItem) * NELEMS(mons));
    for (s32 i = 0; i < n; i++) {
        mons[0] = validMons[i];
        for (s32 j = i + 1; j < numValid; j++) {
            mons[1] = validMons[j];
            if (numRequired == 2) {
                if (sub_0204A450(mons, numRequired)) {
                    return TRUE;
                }
                continue;
            }
            for (s32 k = j + 1; k < numValid; k++) {
                mons[2] = validMons[k];
                if (numRequired == 3) {
                    if (sub_0204A450(mons, numRequired)) {
                        return TRUE;
                    }
                    continue;
                }
                for (s32 l = k + 1; l < numValid; l++) {
                    mons[3] = validMons[l];
                    if (sub_0204A450(mons, numRequired)) {
                        return TRUE;
                    }
                }
            }
        }
    }
    return FALSE;
}

BOOL sub_0204A5B0(u16 numRequired, SaveData *saveData, BOOL checkDuplicateItems) {
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
        if (IsPokemonBannedFromBattleFrontier(species, form) == TRUE) {
            continue;
        }
        if (checkDuplicateItems == TRUE && sub_0204A424(validMons, species, item, numValid) == TRUE) {
            continue;
        }
        validMons[numValid].species = species;
        validMons[numValid].item = item;
        numValid++;
    }
    if (numValid < numRequired) {
        return FALSE;
    }
    return sub_0204A4A0(validMons, numRequired, numValid, numValid - numRequired + 1);
}

void sub_0204A68C(void) {
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
    u32 y = GetPlayerZCoord(fieldSystem->playerAvatar);
    u32 x = GetPlayerXCoord(fieldSystem->playerAvatar);
    warp->mapId = fieldSystem->location->mapId;
    warp->warpId = -1;
    warp->x = x;
    warp->y = y;
    warp->direction = DIR_NORTH;
    SetFlag966(Save_VarsFlags_Get(fieldSystem->saveData));
}

void sub_0204A6E8(FieldSystem *fieldSystem) {
    ClearFlag966(Save_VarsFlags_Get(fieldSystem->saveData));
}

u32 sub_0204A6F8(SaveData *saveData, u32 a1) {
    if (a1 == 5) {
        return FALSE;
    } else if (a1 == 6) {
        return FrontierSave_GetStat(Save_Frontier_GetStatic(saveData), 113, sub_0205C268(113));
    } else {
        return FrontierSave_GetStat(Save_Frontier_GetStatic(saveData), 2 * a1 + 1, 0xff);
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
    u8 unk4 = sub_0202D284(unk, 0, 0);
    if (unk4 == 5) {
        return unk4;
    }
    if (unk4 == 6) {
        sub_02031108(Save_Frontier_GetStatic(saveData), 100, sub_0205C268(100), 0);
    } else {
        sub_0202D5DC(frontierData, unk4 + 8, 2);
    }
    sub_0202D57C(frontierData, unk4, 2);
    sub_02031108(Save_Frontier_GetStatic(saveData), sub_0205C310(unk4), sub_0205C268(sub_0205C310(unk4)), 0);
    if (unk4 != 4 && unk4 != 6) {
        sub_020674E0(saveData);
    }
    return unk4;
}

u16 sub_0204A800(SaveData *saveData) {
    return sub_0202D7B0(sub_0202D928(saveData));
}

void sub_0204A810(UnkStruct_Fsys_A0 **a0) {
    GF_ASSERT(*a0 == NULL);
    *a0 = NULL;
}

UnkStruct_Fsys_A0 *sub_0204A824(SaveData *saveData, BOOL resumeFromPrevious, u32 a2) {
    UnkStruct_Fsys_A0 *unkStruct = Heap_Alloc(HEAP_ID_FIELD2, sizeof(UnkStruct_Fsys_A0));
    MI_CpuClear8(unkStruct, sizeof(UnkStruct_Fsys_A0));
    unkStruct->heapID = HEAP_ID_FIELD2;
    unkStruct->unk70 = sub_0202D908(saveData);
    unkStruct->unk74 = Save_FrontierData_Get(saveData);
    unkStruct->unk00 = 0x12345678;
    sub_0202D3E4(unkStruct->unk70, 0);
    if (!resumeFromPrevious) {
        unkStruct->unk0f = a2;
        unkStruct->unk0e = sub_0204A3F4(unkStruct->unk0f);
        unkStruct->unk0c = 1;
        unkStruct->curWinStreak = 0;
        for (u16 i = 0; i < 4; i++) {
            unkStruct->unk2a[i] = 0xff;
        }
        for (u16 i = 0; i < 14; i++) {
            unkStruct->unk3e[i] = 0xffff;
        }
        sub_0202D234(unkStruct->unk70);
        u8 unk = unkStruct->unk0f;
        sub_0202D308(unkStruct->unk70, 0, &unk);
    } else {
        unkStruct->unk0f = sub_0202D284(unkStruct->unk70, 0, 0);
        unkStruct->unk0c = sub_0202D284(unkStruct->unk70, 1, 0);
        unkStruct->curWinStreak = unkStruct->unk0c - 1;
        unkStruct->unk0e = sub_0204A3F4(unkStruct->unk0f);
        sub_0202D284(unkStruct->unk70, 5, unkStruct->unk2a);
        sub_0202D284(unkStruct->unk70, 8, unkStruct->unk3e);
        unkStruct->unk08 = sub_0202D284(unkStruct->unk70, 10, 0);
        if (unkStruct->unk0f == 2) {
            unkStruct->unk10_5 = sub_0202D284(unkStruct->unk70, 9, 0);
            sub_0202D284(unkStruct->unk70, 6, &unkStruct->unk7e8[unkStruct->unk10_5]);
            sub_0204BA50(unkStruct,
                &unkStruct->unk298[unkStruct->unk10_5],
                300 + unkStruct->unk10_5,
                sub_0202D284(unkStruct->unk70, 7, 0),
                &unkStruct->unk7e8[unkStruct->unk10_5],
                unkStruct->heapID);
        }
    }
    unkStruct->unk11 = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfile(saveData));
    if (unkStruct->unk0f != 5) {
        FrontierSave *frontierSaveData = Save_Frontier_GetStatic(saveData);
        GameStats *gameStats = Save_GameStats_Get(saveData);
        u16 unk0;
        if (unkStruct->unk0f == 6) {
            unk0 = Save_VarsFlags_GetVar4052(Save_VarsFlags_Get(saveData));
        } else {
            unk0 = sub_0202D5DC(unkStruct->unk74, unkStruct->unk0f + 8, 0);
        }
        if (unk0 != 0) {
            u32 unk0;
            if (unkStruct->unk0f == 6) {
                unk0 = FrontierSave_GetStat(frontierSaveData, 113, sub_0205C268(113));
            } else {
                unk0 = FrontierSave_GetStat(frontierSaveData, 2 * unkStruct->unk0f + 1, 0xff);
            }
            unkStruct->unk1a = unk0;
            unkStruct->unk1c = sub_0202D57C(unkStruct->unk74, unkStruct->unk0f, 0);
        }
        unkStruct->unk20 = GameStats_GetCapped(gameStats, GAME_STAT_BATTLE_TOWER_WIN_COUNT);
    }
    if (unkStruct->unk0f == 6) {
        unkStruct->unk1c = sub_0202D5C4(unkStruct->unk74, 6, unkStruct->unk1a / 7);
    }
    return unkStruct;
}

void sub_0204AA2C(UnkStruct_Fsys_A0 *a0) {
    if (a0 == NULL) {
        return;
    }
    GF_ASSERT(a0->unk00 == 0x12345678);
    MI_CpuClear8(a0, sizeof(UnkStruct_Fsys_A0));
    Heap_Free(a0);
}

void sub_0204AA58(UnkStruct_Fsys_A0 *a0, TaskManager *taskManager, void *a2) {
    sub_02067118(taskManager, a2, 17, 0, a0->unk0e, a0->unk0e, 100, 0);
}

BOOL sub_0204AA78(UnkStruct_Fsys_A0 *a0, void **a1, SaveData *saveData) {
    Party *party;
    u8 *unk = *a1;
    if (unk[0x27] != 0 || unk[0x26] == 7) {
        Heap_Free(*a1);
        *a1 = NULL;
        return FALSE;
    }
    party = SaveArray_Party_Get(saveData);
    for (u16 i = 0; i < a0->unk0e; i++) {
        a0->unk2a[i] = unk[0x30 + i] - 1;
        Pokemon *mon = Party_GetMonByIndex(party, a0->unk2a[i]);
        a0->unk2e[i] = GetMonData(mon, MON_DATA_SPECIES, NULL);
        a0->unk36[i] = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
    }
    Heap_Free(*a1);
    *a1 = NULL;
    return TRUE;
}

u32 sub_0204AB10(UnkStruct_Fsys_A0 *a0, SaveData *saveData) {
    u16 species[4];
    u16 items[4];
    Party *party = SaveArray_Party_Get(saveData);
    for (u16 i = 0; i < a0->unk0e; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, a0->unk2a[i]);
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

static BOOL sub_0204ABA0(u16 *a0, u32 a1, u16 a2) {
    for (u16 i = 0; i < a2; i++) {
        if (a1 == a0[i]) {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_0204ABC8(UnkStruct_Fsys_A0 *a0, SaveData *saveData) {
    // saveData is unused
    s32 i;
    u32 unk;
    u8 sp00;
    if (a0->unk0f == 2 || a0->unk0f == 6 || a0->unk0f == 3) {
        u32 temp;
        if ((a0->unk0f == 3 && a0->unk14 > a0->unk1c)
            || (a0->unk0f == 6 && a0->unk14 > a0->unk1c)) {
            temp = a0->unk14;
        } else {
            temp = a0->unk1c;
        }
        sp00 = temp;
        for (i = 0; i < 14; i++) {
            do {
                unk = sub_0204B73C(a0, sp00, i / 2, a0->unk0f);
            } while (sub_0204ABA0(a0->unk3e, unk, i));
            a0->unk3e[i] = unk;
        }
    } else {
        for (i = 0; i < 7; i++) {
            do {
                unk = sub_0204B73C(a0, a0->unk1c, i, a0->unk0f);
            } while (sub_0204ABA0(a0->unk3e, unk, i));
            a0->unk3e[i] = unk;
        }
    }
}

u8 sub_0204AC78(UnkStruct_Fsys_A0 *a0) {
    return a0->unk0c;
}

BOOL sub_0204AC7C(UnkStruct_Fsys_A0 *a0) {
    if (a0->unk10_0) {
        return TRUE;
    }
    if (a0->unk0c > 7) {
        a0->unk10_0 = TRUE;
        return TRUE;
    }
    return FALSE;
}

static void sub_0204ACA0(UnkStruct_Fsys_A0 *a0, SaveData *saveData, BOOL a2, u16 a3) {
    // a2 and a3 are unused
    switch (a0->unk0f) {
    case 0:
        sub_0204B470(a0, saveData, 0);
        break;
    case 1:
        break;
    case 4:
        sub_0204B470(a0, saveData, 1);
        sub_0202D3B0(a0->unk70, a0->unk28, a0->unk24, a0->unk26);
        u8 unk = a0->unk0f;
        sub_0202D308(a0->unk70, 0, &unk);
        unk = a0->unk0c;
        sub_0202D308(a0->unk70, 1, &unk);
        sub_0202D4FC(a0->unk74, a0->unk70);
    }
}

void sub_0204AD04(UnkStruct_Fsys_A0 *a0, SaveData *saveData) {
    GameStats *gameStats = Save_GameStats_Get(saveData);
    FrontierSave *frontierSaveData = Save_Frontier_GetStatic(saveData);
    if (a0->unk0f == 5) {
        return;
    }
    u32 unk4 = a0->unk0f == 6 ? 112 : a0->unk0f * 2;
    FrontierSave_GetStat(frontierSaveData, unk4, sub_0205C268(unk4));
    sub_0203126C(frontierSaveData, unk4, sub_0205C268(unk4), a0->unk1a + a0->curWinStreak);
    if (a0->unk0f == 6) {
        FrontierSave_GetStat(Save_Frontier_GetStatic(saveData), 100, sub_0205C268(100));
    } else {
        sub_0202D5DC(a0->unk74, a0->unk0f + 8, 0);
    }
    u32 unk = sub_02031108(frontierSaveData, unk4 + 1, sub_0205C268(unk4 + 1), a0->unk1a + a0->curWinStreak);
    if (a0->unk0f == 6) {
        sub_02031108(Save_Frontier_GetStatic(saveData), 100, sub_0205C268(100), 0);
    } else {
        sub_0202D5DC(a0->unk74, a0->unk0f + 8, 2);
    }
    GameStats_Add(gameStats, GAME_STAT_BATTLE_TOWER_WIN_COUNT, a0->curWinStreak);
    sub_0202D57C(a0->unk74, a0->unk0f, 2);
    if (a0->unk0f != 6) {
        GameStats_Add(Save_GameStats_Get(saveData), GAME_STAT_BATTLE_TOWER_BATTLE_COUNT, 1);
    }
    sub_0204B318(a0);
    unk++;
    if (unk > 9999) {
        unk = 9999;
    }
    sub_0204ACA0(a0, saveData, 0, unk);
}

void sub_0204AE20(UnkStruct_Fsys_A0 *a0, SaveData *saveData) {
    if (a0->unk0f == 5) {
        return;
    }
    GameStats *gameStats = Save_GameStats_Get(saveData);
    FrontierSave *frontierSaveData = Save_Frontier_GetStatic(saveData);
    u32 unk4 = a0->unk0f == 6 ? 112 : a0->unk0f * 2;
    if (a0->unk0f == 6) {
        FrontierSave_GetStat(Save_Frontier_GetStatic(saveData), 100, sub_0205C268(100));
    } else {
        sub_0202D5DC(a0->unk74, a0->unk0f + 8, 0);
    }
    u32 unk6 = sub_02031108(frontierSaveData, unk4 + 1, sub_0205C268(unk4 + 1), a0->unk1a + a0->curWinStreak);
    if (a0->unk0f == 6) {
        sub_02031108(Save_Frontier_GetStatic(saveData), 100, sub_0205C268(100), 1);
    } else {
        sub_0202D5DC(a0->unk74, a0->unk0f + 8, 1);
    }
    FrontierSave_GetStat(frontierSaveData, unk4, sub_0205C268(unk4));
    sub_0203126C(frontierSaveData, unk4, sub_0205C268(unk4), unk6);
    GameStats_Add(gameStats, GAME_STAT_BATTLE_TOWER_WIN_COUNT, 7);
    sub_0202D57C(a0->unk74, a0->unk0f, 3);
    if (a0->unk0f != 6) {
        GameStats_Add(gameStats, GAME_STAT_BATTLE_TOWER_BATTLE_COUNT, 1);
    }
    GameStats_AddScore(gameStats, SCORE_EVENT_14);
    sub_0204B318(a0);
    sub_0204ACA0(a0, saveData, 1, unk6);
}

void sub_0204AF2C(UnkStruct_Fsys_A0 *a0) {
    u8 unk = a0->unk0f;
    sub_0202D308(a0->unk70, 0, &unk);
    unk = a0->unk0c;
    sub_0202D308(a0->unk70, 1, &unk);
    sub_0202D308(a0->unk70, 5, a0->unk2a);
    sub_0202D3B0(a0->unk70, a0->unk28, a0->unk24, a0->unk26);
    sub_0202D308(a0->unk70, 8, a0->unk3e);
    sub_0202D308(a0->unk70, 10, &a0->unk08);
    sub_0202D3E4(a0->unk70, 1);
    if (a0->unk0f == 2) {
        unk = a0->unk10_5;
        sub_0202D308(a0->unk70, 9, &unk);
        sub_0202D308(a0->unk70, 6, &a0->unk7e8[a0->unk10_5]);
        sub_0202D308(a0->unk70, 7, &a0->unk838[a0->unk10_5]);
    }
}

void sub_0204AFE0(UnkStruct_Fsys_A0 *a0) {
    for (s32 i = 0; i < 5; i++) {
        a0->unk838[i] = sub_0204BA04(a0, &a0->unk298[i], 300 + i, a0->unk0e, a0->unk2e, a0->unk36, &a0->unk7e8[i], a0->heapID);
    }
}

u32 sub_0204B044(UnkStruct_Fsys_A0 *a0, u32 a1) {
    sub_0204B5E8(a0->unk78[a1].unk04);
}

u32 sub_0204B05C(UnkStruct_Fsys_A0 *a0) {
    return a0->unk0f;
}

u32 sub_0204B060(UnkStruct_Fsys_A0 *a0) {
    return a0->unk10_1;
}

u32 sub_0204B068(UnkStruct_Fsys_A0 *a0) {
    u32 unk;
    if (a0->unk0f == 5) {
        return 0;
    }
    if (a0->unk0f == 4) {
        unk = _020FBF98[sub_0202D488(a0->unk74, 0)];
    } else {
        if (a0->unk0f == 3 || a0->unk0f == 6) {
            u32 index = sub_0202D57C(a0->unk74, a0->unk0f, 0);
            if (index >= 7) {
                unk = 18;
            } else {
                unk = _020FBF7C[index];
            }
        } else {
            u32 index = sub_0202D57C(a0->unk74, a0->unk0f, 0);
            if (a0->unk10_1) {
                unk = 20;
            } else if (index >= 7) {
                unk = 7;
            } else {
                unk = _020FBF84[index];
            }
        }
    }
    FrontierData_BattlePointAction(a0->unk74, unk, 5);
    return unk;
}

BOOL sub_0204B0E0(UnkStruct_Fsys_A0 *a0, SaveData *saveData) {
    u32 unk = sub_0204A6F8(saveData, a0->unk0f);
    if (unk < 50) {
        return FALSE;
    } else if (unk >= 100) {
        if (sub_0202D5DC(a0->unk74, 1, 0)) {
            return FALSE;
        }
    } else if (sub_0202D5DC(a0->unk74, 0, 0)) {
        return FALSE;
    }
    return TRUE;
}

u32 sub_0204B120(UnkStruct_Fsys_A0 *a0, SaveData *saveData, u32 a2) {
    FRONTIERDATA *frontierData = Save_FrontierData_Get(saveData);
    switch (a2) {
    case 0:
        return sub_0202D488(frontierData, 0);
    case 1: {
        sub_0202D5DC(frontierData, 4, 2);
        s32 unk0 = sub_0202D488(frontierData, 0);
        if (unk0 == 10) {
            a0->unk10_4 = TRUE;
            return 0;
        }
        sub_0202D488(frontierData, 3);
        if (unk0 + 1 >= 5) {
            a0->unk10_4 = TRUE;
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

BOOL sub_0204B1CC(UnkStruct_Fsys_A0 *a0, SaveData *saveData) {
    if (a0->unk0f != 0) {
        return FALSE;
    }
    switch (a0->unk10_1) {
    case 1:
        return sub_0204B2B8(saveData, MON_DATA_ABILITY_RIBBON, a0);
    case 2:
        return sub_0204B2B8(saveData, MON_DATA_GREAT_ABILITY_RIBBON, a0);
    }
    return FALSE;
}

BOOL sub_0204B204(UnkStruct_Fsys_A0 *a0, SaveData *saveData) {
    if (a0->unk0f == 5) {
        return FALSE;
    }
    if (a0->unk0f == 6) {
        return FALSE;
    }
    if (!a0->unk10_4) {
        return FALSE;
    }
    u32 ribbon;
    switch (a0->unk0f) {
    case 1:
        ribbon = MON_DATA_DOUBLE_ABILITY_RIBBON;
        break;
    case 2:
        ribbon = MON_DATA_MULTI_ABILITY_RIBBON;
        break;
    case 3:
        ribbon = MON_DATA_PAIR_ABILITY_RIBBON;
        break;
    case 4:
        ribbon = MON_DATA_WORLD_ABILITY_RIBBON;
        break;
    }
    return sub_0204B2B8(saveData, ribbon, a0);
}

u16 sub_0204B258(UnkStruct_Fsys_A0 *a0, SaveData *saveData) {
    u8 unk;
    if (a0->unk0f == 6) {
        unk = FrontierSave_GetStat(Save_Frontier_GetStatic(saveData), 100, sub_0205C268(100));
    } else {
        unk = sub_0202D5DC(a0->unk74, a0->unk0f + 8, 0);
    }
    if (unk == 0) {
        a0->unk08 = sub_020674E0(saveData);
    } else {
        a0->unk08 = sub_0206751C(saveData);
    }
    return a0->unk08 / 0xffff;
}

static BOOL sub_0204B2B8(SaveData *saveData, u32 ribbon, UnkStruct_Fsys_A0 *a2) {
    u8 value = TRUE;
    Party *party = SaveArray_Party_Get(saveData);
    u8 count = 0;
    for (s32 i = 0; i < a2->unk0e; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, a2->unk2a[i]);
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

static u32 sub_0204B318(UnkStruct_Fsys_A0 *a0) {
    if (a0->unk0f == 5 || a0->unk0f == 0 || a0->unk0f == 6 || a0->unk0f == 4) {
        return FALSE;
    }
    if ((u16)(a0->unk1a + a0->curWinStreak) < 50) {
        return FALSE;
    }
    a0->unk10_4 = TRUE;
    return TRUE;
}

static void sub_0204B34C(UnkStruct_0204B470 *a0, Pokemon *mon) {
    a0->species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    a0->form = GetMonData(mon, MON_DATA_FORM, NULL);
    a0->item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
    for (s32 i = 0; i < MAX_MON_MOVES; i++) {
        a0->moves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
        a0->ppUp |= GetMonData(mon, MON_DATA_MOVE1PPUP + i, NULL) << (i * 2);
    }
    a0->language = GetMonData(mon, MON_DATA_GAME_LANGUAGE, NULL);
    a0->otId = GetMonData(mon, MON_DATA_OTID, NULL);
    a0->pid = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
    a0->ivsWord = GetMonData(mon, MON_DATA_IVS_WORD, NULL);
    for (s32 i = 0; i < NUM_STATS; i++) {
        a0->evs[i] = GetMonData(mon, MON_DATA_HP_EV + i, NULL);
    }
    a0->ability = GetMonData(mon, MON_DATA_ABILITY, NULL);
    a0->friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
    GetMonData(mon, MON_DATA_NICKNAME_FLAT, a0->nickname);
}

static void sub_0204B470(UnkStruct_Fsys_A0 *a0, SaveData *saveData, u32 a2) {
    UnkStruct_0204B470 *unkStructs = Heap_AllocAtEnd(a0->heapID, 3 * sizeof(UnkStruct_0204B470));
    MI_CpuClear8(unkStructs, 3 * sizeof(UnkStruct_0204B470));
    Party *party = SaveArray_Party_Get(saveData);
    for (s32 i = 0; i < 3; i++) {
        sub_0204B34C(&unkStructs[i], Party_GetMonByIndex(party, a0->unk2a[i]));
    }
    sub_0202D4B8(a0->unk74, a2, unkStructs);
    MI_CpuClear8(unkStructs, 3 * sizeof(UnkStruct_0204B470));
    Heap_Free(unkStructs);
}

u8 sub_0204B4D4(u32 frontierTrainerIndex) {
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

u16 sub_0204B510(UnkStruct_Fsys_A0 *a0) {
    if (a0->unk0f == 6) {
        return LCRandom();
    }
    a0->unk08 = sub_020674A4(a0->unk08);
    return a0->unk08 / 0xffff;
}
