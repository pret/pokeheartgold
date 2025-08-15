#include "global.h"

#include "constants/items.h"
#include "constants/trainer_class.h"

#include "msgdata/msg/msg_0246.h"

#include "bug_contest.h"
#include "field_system.h"
#include "math_util.h"
#include "message_format.h"
#include "pokedex.h"
#include "pokemon_storage_system.h"
#include "save_arrays.h"
#include "unk_02055418.h"
#include "unk_0205BB1C.h"
#include "wild_encounter.h"

const u16 sBugContestOpponentClasses[] = {
    TRAINERCLASS_BUG_CATCHER,   // Don
    TRAINERCLASS_BUG_CATCHER,   // Ed
    TRAINERCLASS_ACE_TRAINER_F, // Abby
    TRAINERCLASS_POKEFAN_M,     // William
    TRAINERCLASS_BUG_CATCHER,   // Benny
    TRAINERCLASS_CAMPER,        // Barry
    TRAINERCLASS_PICNICKER,     // Cindy
    TRAINERCLASS_BUG_CATCHER,   // Josh
    TRAINERCLASS_YOUNGSTER,     // Samuel
    TRAINERCLASS_SCHOOL_KID_M,  // Kipp
};

void BugContest_BackUpParty(BugContest *bugContest);
void BugContest_InitOpponents(BugContest *bugContest);
void BugContest_InitEncounters(BugContest *bugContest);
void BugContest_RestoreParty_RetrieveCaughtPokemon(BugContest *bugContest);
u16 BugContest_JudgePlayerMon(BugContest *bugContest, Pokemon *mon);

BugContest *BugContest_New(FieldSystem *fieldSystem, u32 weekday) {
    BugContest *bugContest;

    bugContest = (BugContest *)Heap_Alloc(HEAP_ID_3, sizeof(BugContest));
    MI_CpuClear8(bugContest, sizeof(BugContest));
    bugContest->heapID = HEAP_ID_3;
    bugContest->saveData = fieldSystem->saveData;
    bugContest->sport_balls = 20;
    bugContest->mon = AllocMonZeroed(bugContest->heapID);
    bugContest->national_dex = Pokedex_GetNatDexFlag(Save_Pokedex_Get(bugContest->saveData));
    bugContest->day_of_week = weekday;
    BugContest_BackUpParty(bugContest);
    BugContest_InitOpponents(bugContest);
    BugContest_InitEncounters(bugContest);
    FieldSystem_StartBugContestTimer(fieldSystem);
    return bugContest;
}

void BugContest_Delete(BugContest *bugContest) {
    BugContest_RestoreParty_RetrieveCaughtPokemon(bugContest);
    Heap_Free(bugContest->mon);
    Heap_Free(bugContest);
}

void BugContest_Judge(BugContest *bugContest) {
    int i, j, cur_max, score, score2;
    u8 temp;
    u8 rand;
    BugContestant *player;

    // Judge the player's caught Pokemon
    player = &bugContest->contestants[BUGCONTESTANT_PLAYER];
    player->id = BUGCONTESTANT_PLAYER;
    player->score = BugContest_JudgePlayerMon(bugContest, bugContest->mon);
    player->data.species = GetMonData(bugContest->mon, MON_DATA_SPECIES, NULL);

    // Init the rankings list
    for (i = 0; i < BUGCONTESTANT_COUNT; i++) {
        bugContest->ranking[i] = i;
    }

    // Sort the rankings list by selection sort
    for (i = 0; i < BUGCONTESTANT_COUNT - 1; i++) {
        temp = bugContest->ranking[i];
        cur_max = i;
        score = bugContest->contestants[bugContest->ranking[i]].score;
        for (j = i + 1; j < BUGCONTESTANT_COUNT; j++) {
            score2 = bugContest->contestants[bugContest->ranking[j]].score;
            if (score2 >= score) {
                cur_max = j;
                score = score2;
            }
        }
        bugContest->ranking[i] = bugContest->ranking[cur_max];
        bugContest->ranking[cur_max] = temp;
    }

    // Did the player win?
    bugContest->placement = 3;
    for (i = 0; i < 3; i++) {
        if (bugContest->ranking[i] == BUGCONTESTANT_PLAYER) {
            bugContest->placement = i;
            break;
        }
    }

    // Assign the player's prize item
    switch (bugContest->placement) {
    case 0: // First Place
        if (bugContest->national_dex) {
            rand = LCRandom() % 10;
        } else {
            rand = 0;
        }
        if (rand < 6) {
            bugContest->prize = ITEM_SUN_STONE + rand;
        } else {
            bugContest->prize = ITEM_SHINY_STONE + rand - 6;
        }
        break;
    case 1:
        bugContest->prize = ITEM_EVERSTONE;
        break;
    case 2:
        bugContest->prize = ITEM_SITRUS_BERRY;
        break;
    default:
        bugContest->prize = ITEM_SHED_SHELL;
        break;
    }
}

void BugContest_BufferContestWinnerNames(BugContest *bugContest, MsgData *msgData, MessageFormat *msgFmt, u8 place) {
    BugContestant *contestant;
    String *string;

    contestant = &bugContest->contestants[bugContest->ranking[place]];
    if (place == bugContest->placement) {
        BufferPlayersName(msgFmt, 0, Save_PlayerData_GetProfile(bugContest->saveData));
    } else {
        string = NewString_ReadMsgData(msgData, contestant->id + msg_0246_00078);
        BufferString(msgFmt, 0, string, 2, 1, 2);
        String_Delete(string);
        BufferTrainerClassName(msgFmt, 2, sBugContestOpponentClasses[contestant->id]);
    }
    BufferSpeciesName(msgFmt, 1, contestant->data.species);
    BufferIntegerAsString(msgFmt, 3, contestant->score, 3, PRINTING_MODE_LEFT_ALIGN, 1);
}

BOOL BugContest_ContestantIsRegistered(BugContest *bugContest, u8 id) {
    int i;
    for (i = 0; i < BUGCONTESTANT_NPC_COUNT; i++) {
        if (id == bugContest->contestants[i].id) {
            return TRUE;
        }
    }
    return FALSE;
}

BOOL BugContest_BufferCaughtMonNick(BugContest *bugContest, MessageFormat *msgFmt, u8 slot) {
    String *string;

    if (!bugContest->caught_poke) {
        return FALSE;
    }

    string = String_New(POKEMON_NAME_LENGTH + 1 + 1, bugContest->heapID);
    GetMonData(bugContest->mon, MON_DATA_NICKNAME_STRING, string);
    BufferString(msgFmt, slot, string, 2, 1, 2);
    String_Delete(string);
    return bugContest->party_cur_num >= PARTY_SIZE;
}

ENC_SLOT *BugContest_GetEncounterSlot(BugContest *bugContest, enum HeapID heapID) {
    ENC_SLOT *slot;
    u16 roll;
    int i;
    u8 modulo;

    slot = Heap_AllocAtEnd(heapID, sizeof(ENC_SLOT));
    roll = LCRandom() % 100;
    for (i = 0; i < BUGMON_COUNT; i++) {
        if ((int)roll >= bugContest->encounters[i].rate) {
            break;
        }
    }
    slot->species = bugContest->encounters[i].species;
    modulo = bugContest->encounters[i].lvlmax - bugContest->encounters[i].lvlmin + 1;
    slot->level_min = (LCRandom() % modulo) + bugContest->encounters[i].lvlmin;
    slot->level_max = 0;
    return slot;
}

void BugContest_BackUpParty(BugContest *bugContest) {
    int i;
    bugContest->party_bak = SaveArray_Party_Alloc(bugContest->heapID);
    bugContest->party_cur = SaveArray_Party_Get(bugContest->saveData);
    Party_Copy(bugContest->party_cur, bugContest->party_bak);
    bugContest->party_cur_num = Party_GetCount(bugContest->party_cur);
    bugContest->lead_mon_idx = Save_GetPartyLeadAlive(bugContest->saveData);
    // You can only enter the contest with one pokemon, so
    // remove any Pokemon other than the first that can battle.
    for (i = 0; i < bugContest->party_cur_num - 1; i++) {
        if (i < bugContest->lead_mon_idx) {
            Party_RemoveMon(bugContest->party_cur, 0);
        } else {
            Party_RemoveMon(bugContest->party_cur, 1);
        }
    }
}

void BugContest_RestoreParty_RetrieveCaughtPokemon(BugContest *bugContest) {
    Pokemon *mon;
    PartyExtraSub sub;

    // Restore the player's party to its prior state, but keep the
    // state of the Pokemon you used intact.
    mon = AllocMonZeroed(bugContest->heapID);
    CopyPokemonToPokemon(Party_GetMonByIndex(bugContest->party_cur, 0), mon);
    Party_GetUnkSubSlot(bugContest->party_cur, &sub, 0);
    Party_Copy(bugContest->party_bak, bugContest->party_cur);
    Party_SafeCopyMonToSlot_ResetUnkSub(bugContest->party_cur, bugContest->lead_mon_idx, mon);
    Party_SetUnkSubSlot(bugContest->party_cur, &sub, bugContest->lead_mon_idx);
    Heap_Free(mon);
    Heap_Free(bugContest->party_bak);
    bugContest->party_bak = NULL;

    if (bugContest->caught_poke) {
        if (bugContest->party_cur_num >= PARTY_SIZE) {
            PCStorage_PlaceMonInFirstEmptySlotInAnyBox(SaveArray_PCStorage_Get(bugContest->saveData), Mon_GetBoxMon(bugContest->mon));
        } else {
            Party_AddMon(bugContest->party_cur, bugContest->mon);
        }
    }
}

BOOL BugContest_ContestantIsRegisteredN(BugContest *bugContest, u8 id, u8 n) {
    int i;
    for (i = 0; i < n; i++) {
        if (id == bugContest->contestants[i].id) {
            return TRUE;
        }
    }
    return FALSE;
}

void BugContest_InitOpponents(BugContest *bugContest) {
    FSFile file;
    u32 flen;
    BugContestantData *bin, *curbin;
    u8 *idxs;
    int i, j, k;
    u8 rand;
    s16 score;

    FS_InitFile(&file);
    if (!FS_OpenFile(&file, "data/mushi/mushi_trainer.bin")) {
        GF_ASSERT(FALSE);
        return;
    }
    flen = FS_GetLength(&file);
    bin = Heap_AllocAtEnd(bugContest->heapID, flen);
    idxs = Heap_AllocAtEnd(bugContest->heapID, 8);
    FS_ReadFile(&file, bin, flen);
    for (i = 0; i < BUGCONTESTANT_NPC_COUNT; i++) {
        bugContest->contestants[i].id = 0xFF;
    }
    for (i = 0; i < BUGCONTESTANT_NPC_COUNT; i++) {
        do {
            rand = LCRandom() % 10;
        } while (BugContest_ContestantIsRegisteredN(bugContest, rand, i));
        bugContest->contestants[i].id = rand;
        curbin = &bin[8 * bugContest->contestants[i].id];
        k = 0;
        for (j = 0; j < 8; j++) {
            if (curbin[j].national && !bugContest->national_dex) {
                continue;
            }
            if (curbin[j].day < RTC_WEEK_MAX && bugContest->day_of_week != curbin[j].day) {
                continue;
            }
            idxs[k++] = j;
        }
        MI_CpuCopy8(&curbin[idxs[LCRandom() % k]], &bugContest->contestants[i].data, sizeof(BugContestantData));
        score = (LCRandom() % (2 * bugContest->contestants[i].data.randmod)) - bugContest->contestants[i].data.randmod;
        bugContest->contestants[i].score = score + bugContest->contestants[i].data.score;
    }
    Heap_Free(idxs);
    Heap_Free(bin);
    FS_CloseFile(&file);
}

void BugContest_InitEncounters(BugContest *bugContest) {
    FSFile file;
    u32 flen;
    BUGMON *bugmon;
    int set;

    FS_InitFile(&file);
    if (!FS_OpenFile(&file, "data/mushi/mushi_encount.bin")) {
        GF_ASSERT(FALSE);
        return;
    }
    flen = FS_GetLength(&file);
    bugmon = Heap_AllocAtEnd(bugContest->heapID, flen);
    FS_ReadFile(&file, bugmon, flen);
    if (bugContest->national_dex) {
        set = bugContest->day_of_week / 2; // Tuesday -> 1, Thursday -> 2, Saturday -> 3
    } else {
        set = 0;
    }
    MI_CpuCopy8(&bugmon[set * BUGMON_COUNT], bugContest->encounters, BUGMON_COUNT * sizeof(BUGMON));
    Heap_Free(bugmon);
    FS_CloseFile(&file);
}

u16 BugContest_JudgePlayerMon(BugContest *bugContest, Pokemon *mon) {
    u16 score = 0;
    int i;
    u16 species;
    BUGMON *bugmon = NULL;
    u16 stat_total;

    if (!bugContest->caught_poke) {
        return score;
    }
    species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    for (i = 0; i < BUGMON_COUNT; i++) {
        if (bugContest->encounters[i].species == species) {
            bugmon = &bugContest->encounters[i];
            score += bugContest->encounters[i].score;
            break;
        }
    }
    if (bugmon == NULL) {
        GF_ASSERT(FALSE);
        return 0;
    }

    score += GetMonData(mon, MON_DATA_LEVEL, NULL) * 100 / bugmon->lvlmax;
    stat_total = 0;
    for (i = 0; i < NUM_STATS; i++) {
        stat_total += GetMonData(mon, MON_DATA_HP_IV + i, NULL);
    }
    score += stat_total * 100 / (31 * NUM_STATS);
    score += GetMonData(mon, MON_DATA_HP, NULL) * 100 / GetMonData(mon, MON_DATA_MAXHP, NULL);
    return score;
}
