#include "bug_contest.h"
#include "pokedex.h"
#include "math_util.h"
#include "msgfmt.h"
#include "wild_encounter.h"
#include "pokemon_storage_system.h"
#include "constants/items.h"
#include "constants/trainer_class.h"
#include "msgdata/msg/msg_0246.h"
#include "unk_02055418.h"
#include "unk_0205BB1C.h"
#include "save_arrays.h"

const u16 sBugContestOpponentClasses[] = {
    TRAINERCLASS_BUG_CATCHER,      // Don
    TRAINERCLASS_BUG_CATCHER,      // Ed
    TRAINERCLASS_ACE_TRAINER_F,    // Abby
    TRAINERCLASS_POKEFAN_M,        // William
    TRAINERCLASS_BUG_CATCHER,      // Benny
    TRAINERCLASS_CAMPER,           // Barry
    TRAINERCLASS_PICNICKER,        // Cindy
    TRAINERCLASS_BUG_CATCHER,      // Josh
    TRAINERCLASS_YOUNGSTER,        // Samuel
    TRAINERCLASS_SCHOOL_KID_M,     // Kipp
};

void BugContest_BackUpParty(BUGCONTEST *bugContest);
void BugContest_InitOpponents(BUGCONTEST *bugContest);
void BugContest_InitEncounters(BUGCONTEST *bugContest);
void BugContest_RestoreParty_RetrieveCaughtPokemon(BUGCONTEST *bugContest);
u16 BugContest_JudgePlayerMon(BUGCONTEST *bugContest, POKEMON *pokemon);

BUGCONTEST *BugContest_new(FieldSystem *fsys, u8 weekday) {
    BUGCONTEST *bugContest;

    bugContest = (BUGCONTEST *)AllocFromHeap(3, sizeof(BUGCONTEST));
    MI_CpuClear8(bugContest, sizeof(BUGCONTEST));
    bugContest->heapId = 3;
    bugContest->saveData = fsys->savedata;
    bugContest->sport_balls = 20;
    bugContest->pokemon = AllocMonZeroed(bugContest->heapId);
    bugContest->national_dex = Pokedex_GetNatDexFlag(Sav2_Pokedex_get(bugContest->saveData));
    bugContest->day_of_week = weekday;
    BugContest_BackUpParty(bugContest);
    BugContest_InitOpponents(bugContest);
    BugContest_InitEncounters(bugContest);
    FieldSys_StartBugContestTimer(fsys);
    return bugContest;
}

void BugContest_delete(BUGCONTEST *bugContest) {
    BugContest_RestoreParty_RetrieveCaughtPokemon(bugContest);
    FreeToHeap(bugContest->pokemon);
    FreeToHeap(bugContest);
}

void BugContest_Judge(BUGCONTEST *bugContest) {
    int i, j, cur_max, score, score2;
    u8 temp;
    u8 rand;
    BUGCONTESTANT *player;

    // Judge the player's caught Pokemon
    player = &bugContest->contestants[BUGCONTESTANT_PLAYER];
    player->id = BUGCONTESTANT_PLAYER;
    player->score = BugContest_JudgePlayerMon(bugContest, bugContest->pokemon);
    player->data.species = GetMonData(bugContest->pokemon, MON_DATA_SPECIES, NULL);

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

void BugContest_BufferContestWinnerNames(BUGCONTEST *bugContest, MSGDATA *msgData, MSGFMT *msgFmt, u8 place) {
    BUGCONTESTANT *contestant;
    STRING *string;

    contestant = &bugContest->contestants[bugContest->ranking[place]];
    if (place == bugContest->placement) {
        BufferPlayersName(msgFmt, 0, Sav2_PlayerData_GetProfileAddr(bugContest->saveData));
    } else {
        string = NewString_ReadMsgData(msgData, contestant->id + msg_0246_00078);
        BufferString(msgFmt, 0, string, 2, 1, 2);
        String_dtor(string);
        BufferTrainerClassName(msgFmt, 2, sBugContestOpponentClasses[contestant->id]);
    }
    BufferSpeciesName(msgFmt, 1, contestant->data.species);
    BufferIntegerAsString(msgFmt, 3, contestant->score, 3, STRCONVMODE_LEFT_ALIGN, 1);
}

BOOL BugContest_ContestantIsRegistered(BUGCONTEST *bugContest, u8 id) {
    int i;
    for (i = 0; i < BUGCONTESTANT_NPC_COUNT; i++) {
        if (id == bugContest->contestants[i].id) {
            return TRUE;
        }
    }
    return FALSE;
}

BOOL BugContest_BufferCaughtMonNick(BUGCONTEST *bugContest, MSGFMT *msgFmt, u8 slot) {
    STRING *string;

    if (!bugContest->caught_poke) {
        return FALSE;
    }

    string = String_ctor(POKEMON_NAME_LENGTH+1+1, bugContest->heapId);
    GetMonData(bugContest->pokemon, MON_DATA_NICKNAME_3, string);
    BufferString(msgFmt, slot, string, 2, 1, 2);
    String_dtor(string);
    return bugContest->party_cur_num >= PARTY_SIZE;
}

ENC_SLOT *BugContest_GetEncounterSlot(BUGCONTEST *bugContest, HeapID heapId) {
    ENC_SLOT *slot;
    u16 roll;
    int i;
    u8 modulo;

    slot = AllocFromHeapAtEnd(heapId, sizeof(ENC_SLOT));
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

void BugContest_BackUpParty(BUGCONTEST *bugContest) {
    int i;
    bugContest->party_bak = SavArray_Party_alloc(bugContest->heapId);
    bugContest->party_cur = SavArray_PlayerParty_get(bugContest->saveData);
    Party_copy(bugContest->party_cur, bugContest->party_bak);
    bugContest->party_cur_num = GetPartyCount(bugContest->party_cur);
    bugContest->lead_mon_idx = Save_GetPartyLeadAlive(bugContest->saveData);
    // You can only enter the contest with one pokemon, so
    // remove any Pokemon other than the first that can battle.
    for (i = 0; i < bugContest->party_cur_num - 1; i++) {
        if (i < bugContest->lead_mon_idx) {
            RemoveMonFromParty(bugContest->party_cur, 0);
        } else {
            RemoveMonFromParty(bugContest->party_cur, 1);
        }
    }
}

void BugContest_RestoreParty_RetrieveCaughtPokemon(BUGCONTEST *bugContest) {
    POKEMON *pokemon;
    PARTY_EXTRA_SUB sub;

    // Restore the player's party to its prior state, but keep the
    // state of the Pokemon you used intact.
    pokemon = AllocMonZeroed(bugContest->heapId);
    CopyPokemonToPokemon(GetPartyMonByIndex(bugContest->party_cur, 0), pokemon);
    Party_GetUnkSubSlot(bugContest->party_cur, &sub, 0);
    Party_copy(bugContest->party_bak, bugContest->party_cur);
    Party_SafeCopyMonToSlot_ResetUnkSub(bugContest->party_cur, bugContest->lead_mon_idx, pokemon);
    Party_SetUnkSubSlot(bugContest->party_cur, &sub, bugContest->lead_mon_idx);
    FreeToHeap(pokemon);
    FreeToHeap(bugContest->party_bak);
    bugContest->party_bak = NULL;

    if (bugContest->caught_poke) {
        if (bugContest->party_cur_num >= PARTY_SIZE) {
            PCStorage_PlaceMonInFirstEmptySlotInAnyBox(GetStoragePCPointer(bugContest->saveData), Mon_GetBoxMon(bugContest->pokemon));
        } else {
            AddMonToParty(bugContest->party_cur, bugContest->pokemon);
        }
    }
}

BOOL BugContest_ContestantIsRegisteredN(BUGCONTEST *bugContest, u8 id, u8 n) {
    int i;
    for (i = 0; i < n; i++) {
        if (id == bugContest->contestants[i].id) {
            return TRUE;
        }
    }
    return FALSE;
}

void BugContest_InitOpponents(BUGCONTEST *bugContest) {
    FSFile file;
    u32 flen;
    BUGCONTESTANT_BIN *bin, *curbin;
    u8 *idxs;
    int i, j, k;
    u8 rand;
    s16 score;

    FS_InitFile(&file);
    if (!FS_OpenFile(&file, "data/mushi/mushi_trainer.bin")) {
        GF_ASSERT(0);
        return;
    }
    flen = FS_GetLength(&file);
    bin = AllocFromHeapAtEnd(bugContest->heapId, flen);
    idxs = AllocFromHeapAtEnd(bugContest->heapId, 8);
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
        MI_CpuCopy8(&curbin[idxs[LCRandom() % k]], &bugContest->contestants[i].data, sizeof(BUGCONTESTANT_BIN));
        score = (LCRandom() % (2 * bugContest->contestants[i].data.randmod)) - bugContest->contestants[i].data.randmod;
        bugContest->contestants[i].score = score + bugContest->contestants[i].data.score;
    }
    FreeToHeap(idxs);
    FreeToHeap(bin);
    FS_CloseFile(&file);
}

void BugContest_InitEncounters(BUGCONTEST *bugContest) {
    FSFile file;
    u32 flen;
    BUGMON *bugmon;
    int set;

    FS_InitFile(&file);
    if (!FS_OpenFile(&file, "data/mushi/mushi_encount.bin")) {
        GF_ASSERT(0);
        return;
    }
    flen = FS_GetLength(&file);
    bugmon = AllocFromHeapAtEnd(bugContest->heapId, flen);
    FS_ReadFile(&file, bugmon, flen);
    if (bugContest->national_dex) {
        set = bugContest->day_of_week / 2; // Tuesday -> 1, Thursday -> 2, Saturday -> 3
    } else {
        set = 0;
    }
    MI_CpuCopy8(&bugmon[set * BUGMON_COUNT], bugContest->encounters, BUGMON_COUNT * sizeof(BUGMON));
    FreeToHeap(bugmon);
    FS_CloseFile(&file);
}

u16 BugContest_JudgePlayerMon(BUGCONTEST *bugContest, POKEMON *pokemon) {
    u16 score = 0;
    int i;
    u16 species;
    BUGMON *bugmon = NULL;
    u16 stat_total;

    if (!bugContest->caught_poke) {
        return score;
    }
    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    for (i = 0; i < BUGMON_COUNT; i++) {
        if (bugContest->encounters[i].species == species) {
            bugmon = &bugContest->encounters[i];
            score += bugContest->encounters[i].score;
            break;
        }
    }
    if (bugmon == NULL) {
        GF_ASSERT(0);
        return 0;
    }

    score += GetMonData(pokemon, MON_DATA_LEVEL, NULL) * 100 / bugmon->lvlmax;
    stat_total = 0;
    for (i = 0; i < NUM_STATS; i++) {
        stat_total += GetMonData(pokemon, MON_DATA_HP_IV + i, NULL);
    }
    score += stat_total * 100 / (31 * NUM_STATS);
    score += GetMonData(pokemon, MON_DATA_HP, NULL) * 100 / GetMonData(pokemon, MON_DATA_MAXHP, NULL);
    return score;
}
