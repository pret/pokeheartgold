#include "get_egg.h"

#include "global.h"

#include "constants/abilities.h"
#include "constants/balls.h"
#include "constants/daycare.h"
#include "constants/items.h"
#include "constants/map_sections.h"
#include "constants/moves.h"

#include "game_stats.h"
#include "gf_gfx_loader.h"
#include "item.h"
#include "map_section.h"
#include "math_util.h"
#include "msgdata.h"
#include "party.h"
#include "script.h"
#include "start_menu.h"
#include "trainer_memo.h"
#include "unk_02055418.h"
#include "unk_02092BE8.h"

static u8 Save_Daycare_CountMonsInDaycare(Daycare *daycare);
static int Save_Daycare_GetAvailableSlot(Daycare *daycare);
static void DaycareMon_CopyFromPartySlot(Party *party, int partyIdx, DaycareMon *daycareMon, SaveData *saveData);
static void Save_Daycare_Compaction(Daycare *daycare);
static void Daycare_LearnLevelUpMoves(Pokemon *mon);
static int Save_Daycare_MoveMonToParty(Party *party, DaycareMon *daycareMon, MessageFormat *msgFmt);
static int GetDaycareUpdatedLevel(BoxPokemon *boxMon, u32 steps);
static u8 DaycareMon_BufferLevelGrowthAndNick(DaycareMon *daycareMon, MessageFormat *msgFmt);
static u16 DaycareMon_BufferNickAndRetrievalPrice(DaycareMon *daycareMon, MessageFormat *msgFmt);
static void Daycare_GetBothBoxMonsPtr(Daycare *dayCare, BoxPokemon **boxmons);
static int Daycare_EverstoneCheck(Daycare *dayCare);
static void GenerateEggPID(Daycare *dayCare);
static void _IVList_Remove(u8 *ptr, int statID);
static void InheritIVs(Pokemon *egg, Daycare *dayCare);
static u8 LoadEggMoves(Pokemon *mon, u16 *dest);
static void InheritMoves(Pokemon *egg, BoxPokemon *father, BoxPokemon *mother);
static u16 Daycare_BreedingIncenseCheck(u16 species, Daycare *dayCare);
static void Daycare_LightBallCheck(Pokemon *egg, Daycare *dayCare);
static u16 Daycare_GetEggSpecies(Daycare *dayCare, u8 *gender_idx);
static void SetBreedEggStats(Pokemon *mon, u16 species, Daycare *dayCare, u32 otId, u8 form);
static u8 GetEggCyclesToSubtract(Party *party);
static BOOL EggGroupsHaveMatch(const u16 *eggGroups_1, const u16 *eggGroups_2);
static u8 ComputeCompatibilityBetweenBoxMons(BoxPokemon **parents);
static u8 Save_Daycare_CalcCompatibilityInternal(Daycare *dayCare);
static u8 Daycare_GetEggCycleLength(FieldSystem *fieldSystem);
static u8 ConvertDaycareCompatibilityScore(u32 compatibility);
static void sub_0206D038(Pokemon *mon, enum HeapID heapID);
static BOOL Daycare_TryGetForcedInheritedIV(Daycare *dayCare, u8 *powerItemStat, u8 *daycareSlot);
static BOOL SetStatIdToPowerItemStat(u16 itemId, u8 *statId);

BoxPokemon *Daycare_GetBoxMonI(Daycare *daycare, s32 idx) {
    return DaycareMon_GetBoxMon(Save_Daycare_GetMonX(daycare, idx));
}

static u8 Save_Daycare_CountMonsInDaycare(Daycare *daycare) {
    u8 mons = 0;
    for (u8 slot = 0; slot < NUM_DAYCARE_MONS; slot++) {
        if (GetBoxMonData(DaycareMon_GetBoxMon(Save_Daycare_GetMonX(daycare, slot)), MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
            mons++;
        }
    }
    return mons;
}

static int Save_Daycare_GetAvailableSlot(Daycare *daycare) {
    static Daycare *_021D4218;
    _021D4218 = daycare;
    for (u8 slot = 0; slot < NUM_DAYCARE_MONS; slot++) {
        if (GetBoxMonData(DaycareMon_GetBoxMon(Save_Daycare_GetMonX(daycare, slot)), MON_DATA_SPECIES, NULL) == SPECIES_NONE) {
            return slot;
        }
    }
    return -1;
}

static void DaycareMon_CopyFromPartySlot(Party *party, int partyIdx, DaycareMon *daycareMon, SaveData *saveData) {
    u16 nickname[POKEMON_NAME_LENGTH + 1];
    Pokemon *partyMon = Party_GetMonByIndex(party, partyIdx);
    DaycareMail *daycareMail = DaycareMon_GetExtras(daycareMon);
    BoxPokemon *boxMon = DaycareMon_GetBoxMon(daycareMon);
    const u16 *playerNamePtr = PlayerProfile_GetNamePtr(Save_PlayerData_GetProfile(saveData));
    GetMonData(partyMon, MON_DATA_NICKNAME, nickname);
    if (BoxMonIsHoldingMail(Mon_GetBoxMon(partyMon))) {
        GetMonData(partyMon, MON_DATA_MAIL, DaycareMail_GetMailPtr(daycareMail));
    }
    u8 mood = 0;
    SetMonData(partyMon, MON_DATA_MOOD, &mood);
    CopyPokemonToBoxPokemon(partyMon, boxMon);
    BoxMon_UpdateShayminForm(boxMon, SHAYMIN_LAND);
    DaycareMon_SetSteps(daycareMon, 0);
    Party_RemoveMon(party, partyIdx);
    if (!Party_HasMon(party, SPECIES_CHATOT)) {
        Chatot_Invalidate(Save_Chatot_Get(saveData));
    }
}

void Save_Daycare_PutMonIn(Party *party, u8 partyIdx, Daycare *dayCare, SaveData *saveData) {
    GameStats_Inc(Save_GameStats_Get(saveData), GAME_STAT_MONS_SENT_TO_DAYCARE);
    DaycareMon_CopyFromPartySlot(party, partyIdx, Save_Daycare_GetMonX(dayCare, Save_Daycare_GetAvailableSlot(dayCare)), saveData);
}

static void Save_Daycare_Compaction(Daycare *daycare) {
    DaycareMon *mon1 = Save_Daycare_GetMonX(daycare, 0);
    DaycareMon *mon2 = Save_Daycare_GetMonX(daycare, 1);
    BoxPokemon *boxmon1 = DaycareMon_GetBoxMon(mon1);
    BoxPokemon *boxmon2 = DaycareMon_GetBoxMon(mon2);

    if (GetBoxMonData(boxmon1, MON_DATA_SPECIES, NULL) == SPECIES_NONE && GetBoxMonData(boxmon2, MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
        DaycareMon_Copy(mon1, mon2);
        DaycareMon_Init(mon2);
    }
}

static void Daycare_LearnLevelUpMoves(Pokemon *mon) {
    int last_i = 0;
    u16 learned;
    for (int level = 0; level < MAX_LEVEL; level++) {
        if (!Pokemon_TryLevelUp(mon)) {
            break;
        }
        last_i = 0;
        for (
            int stat = MonTryLearnMoveOnLevelUp(mon, &last_i, &learned);
            stat != 0;
            stat = MonTryLearnMoveOnLevelUp(mon, &last_i, &learned)) {
            if (stat == MOVE_APPEND_FULL) {
                DeleteMonFirstMoveAndAppend(mon, learned);
            }
        }
    }
    CalcMonLevelAndStats(mon);
}

static int Save_Daycare_MoveMonToParty(Party *party, DaycareMon *daycareMon, MessageFormat *msgFmt) {
    Pokemon *mon = AllocMonZeroed(HEAP_ID_FIELD1);
    BoxPokemon *boxMon = DaycareMon_GetBoxMon(daycareMon);
    DaycareMail *daycareMail = DaycareMon_GetExtras(daycareMon);

    BufferBoxMonNickname(msgFmt, 0, boxMon);
    u16 species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);

    CopyBoxPokemonToPokemon(boxMon, mon);
    if (GetMonData(mon, MON_DATA_LEVEL, NULL) != MAX_LEVEL) {
        u32 exp = GetMonData(mon, MON_DATA_EXPERIENCE, NULL);
        exp += DaycareMon_GetSteps(daycareMon);
        SetMonData(mon, MON_DATA_EXPERIENCE, &exp);
        Daycare_LearnLevelUpMoves(mon);
    }
    if (BoxMonIsHoldingMail(boxMon)) {
        SetMonData(mon, MON_DATA_MAIL, DaycareMail_GetMailPtr(daycareMail));
    }
    Party_AddMon(party, mon);
    ZeroBoxMonData(boxMon);
    DaycareMon_SetSteps(daycareMon, 0);
    Heap_Free(mon);
    return species;
}

u16 Save_Daycare_RetrieveMon(Party *party, MessageFormat *msgFmt, Daycare *daycare, u8 daycareSlot) {
    u16 ret = Save_Daycare_MoveMonToParty(party, Save_Daycare_GetMonX(daycare, daycareSlot), msgFmt);
    Save_Daycare_Compaction(daycare);
    return ret;
}

static int GetDaycareUpdatedLevel(BoxPokemon *boxMon, u32 steps) {
    Pokemon *tempMon = AllocMonZeroed(HEAP_ID_FIELD2);
    BoxPokemon *tempBoxMon = Mon_GetBoxMon(tempMon);
    CopyBoxPokemonToBoxPokemon(boxMon, tempBoxMon);
    u32 exp = GetBoxMonData(tempBoxMon, MON_DATA_EXPERIENCE, NULL);
    exp += steps;
    SetBoxMonData(tempBoxMon, MON_DATA_EXPERIENCE, &exp);
    u32 level = CalcBoxMonLevel(tempBoxMon);
    Heap_Free(tempMon);
    return level;
}

int DaycareMon_CalcLevelGrowth(DaycareMon *daycareMon) {
    BoxPokemon *boxMon = DaycareMon_GetBoxMon(daycareMon);
    u8 cur_level = CalcBoxMonLevel(boxMon);
    u8 new_level = GetDaycareUpdatedLevel(boxMon, DaycareMon_GetSteps(daycareMon));
    return new_level - cur_level;
}

static u8 DaycareMon_BufferLevelGrowthAndNick(DaycareMon *daycareMon, MessageFormat *msgFmt) {
    BoxPokemon *boxMon = DaycareMon_GetBoxMon(daycareMon);
    int levelGrowth = DaycareMon_CalcLevelGrowth(daycareMon);
    BufferIntegerAsString(msgFmt, 1, levelGrowth, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferBoxMonNickname(msgFmt, 0, boxMon);
    return levelGrowth;
}

static u16 DaycareMon_BufferNickAndRetrievalPrice(DaycareMon *daycareMon, MessageFormat *msgFmt) {
    BoxPokemon *boxMon = DaycareMon_GetBoxMon(daycareMon);
    u16 levelGrowth = DaycareMon_CalcLevelGrowth(daycareMon);
    BufferBoxMonNickname(msgFmt, 0, boxMon);
    u16 price = (levelGrowth + 1) * 100;
    BufferIntegerAsString(msgFmt, 1, price, 5, PRINTING_MODE_LEFT_ALIGN, TRUE);
    return price;
}

u16 Save_Daycare_BufferMonNickAndRetrievalPrice(Daycare *dayCare, u8 slot, MessageFormat *msgFmt) {
    return DaycareMon_BufferNickAndRetrievalPrice(Save_Daycare_GetMonX(dayCare, slot), msgFmt);
}

u8 Save_Daycare_BufferGrowthAndNick(Daycare *dayCare, u32 slot, MessageFormat *msgFmt) {
    DaycareMon *daycareMon = Save_Daycare_GetMonX(dayCare, slot);
    if (GetBoxMonData(DaycareMon_GetBoxMon(daycareMon), MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
        return DaycareMon_BufferLevelGrowthAndNick(daycareMon, msgFmt);
    } else {
        return 0;
    }
}

static void Daycare_GetBothBoxMonsPtr(Daycare *dayCare, BoxPokemon **boxmons) {
    boxmons[0] = Daycare_GetBoxMonI(dayCare, 0);
    boxmons[1] = Daycare_GetBoxMonI(dayCare, 1);
}

static int Daycare_EverstoneCheck(Daycare *dayCare) {
    BoxPokemon *boxmons[NUM_DAYCARE_MONS];
    Daycare_GetBothBoxMonsPtr(dayCare, boxmons);

    u8 num_everstones = 0;
    u8 everstone_idx = 0;
    for (int i = 0; i < NUM_DAYCARE_MONS; i++) {
        if (GetBoxMonData(boxmons[i], MON_DATA_HELD_ITEM, NULL) == ITEM_EVERSTONE) {
            everstone_idx = i;
            num_everstones++;
        }
    }
    if (num_everstones == 2) {
        if (LCRandom() % 2 == 0) { // everstone_idx is set to the opposite value for some reason.
            everstone_idx = 1;
        } else {
            everstone_idx = 0;
        }
        if (LCRandom() >= 0x7FFF) { // This is probably supposed to be 50%, but is actually ~50.0015%.
            return -1;
        } else {
            return everstone_idx;
        }
    } else if (num_everstones == 1) {
        if (LCRandom() >= 0x7FFF) { // Same here.
            return -1;
        } else {
            return everstone_idx;
        }
    } else {
        return -1;
    }
}

static void GenerateEggPID(Daycare *dayCare) {
    u32 pid;
    int i = 0;
    int everstone_num = Daycare_EverstoneCheck(dayCare);
    if (everstone_num < 0) {
        Save_Daycare_SetEggPID(dayCare, MTRandom());
    } else {
        int nature = GetNatureFromPersonality(GetBoxMonData(Daycare_GetBoxMonI(dayCare, everstone_num), MON_DATA_PERSONALITY, NULL));
        for (;;) {
            pid = MTRandom();
            if (nature == GetNatureFromPersonality(pid) && pid != 0) {
                break;
            }
            if (++i > 2400) {
                break;
            }
        }
        Save_Daycare_SetEggPID(dayCare, pid);
    }
}

static void _IVList_Remove(u8 *list, int statID) {
    u8 tempList[NUM_STATS];
    int i;
    list[statID] = 0xFF;
    for (i = 0; i < NUM_STATS; i++) {
        tempList[i] = list[i];
    }
    int j = 0;
    for (i = 0; i < NUM_STATS; i++) {
        if (tempList[i] != 0xFF) {
            list[j] = tempList[i];
            j++;
        }
    }
}

static void InheritIVs(Pokemon *egg, Daycare *dayCare) {
    u8 statsToInherit[NUM_INHERITED_IVS];
    u8 statList[NUM_STATS];
    u8 monToInheritFrom[NUM_INHERITED_IVS];
    u8 inheritedIV;
    u8 powerItemStat;
    u8 daycareSlot;
    u8 i;
    u8 startNum;

    for (i = STAT_HP; i < NUM_STATS; i++) {
        statList[i] = i;
    }
    
    if (Daycare_TryGetForcedInheritedIV(dayCare, &powerItemStat, &daycareSlot)) {
        statsToInherit[0] = powerItemStat;
        startNum = 1;
        _IVList_Remove(statList, powerItemStat);
        monToInheritFrom[0] = daycareSlot;
    } else {
        startNum = 0;
    }
    for (i = startNum; i < NUM_INHERITED_IVS; i++) {
        u8 statToInherit = (LCRandom() % (NUM_STATS - i));
        statsToInherit[i] = statList[statToInherit];
        _IVList_Remove(statList, statToInherit);
    }
    GF_ASSERT(statsToInherit[0] != statsToInherit[1]);
    GF_ASSERT(statsToInherit[1] != statsToInherit[2]);
    GF_ASSERT(statsToInherit[2] != statsToInherit[0]);
    for (i = startNum; i < NUM_INHERITED_IVS; i++) {
        monToInheritFrom[i] = LCRandom() % 2;
    }
    for (i = 0; i < NUM_INHERITED_IVS; i++) {
        BoxPokemon *boxMon = Daycare_GetBoxMonI(dayCare, monToInheritFrom[i]);
        switch (statsToInherit[i]) {
        case STAT_HP:
            inheritedIV = GetBoxMonData(boxMon, MON_DATA_HP_IV, NULL);
            SetMonData(egg, MON_DATA_HP_IV, &inheritedIV);
            break;
        case STAT_ATK:
            inheritedIV = GetBoxMonData(boxMon, MON_DATA_ATK_IV, NULL);
            SetMonData(egg, MON_DATA_ATK_IV, &inheritedIV);
            break;
        case STAT_DEF:
            inheritedIV = GetBoxMonData(boxMon, MON_DATA_DEF_IV, NULL);
            SetMonData(egg, MON_DATA_DEF_IV, &inheritedIV);
            break;
        case STAT_SPEED:
            inheritedIV = GetBoxMonData(boxMon, MON_DATA_SPEED_IV, NULL);
            SetMonData(egg, MON_DATA_SPEED_IV, &inheritedIV);
            break;
        case STAT_SPATK:
            inheritedIV = GetBoxMonData(boxMon, MON_DATA_SPATK_IV, NULL);
            SetMonData(egg, MON_DATA_SPATK_IV, &inheritedIV);
            break;
        case STAT_SPDEF:
            inheritedIV = GetBoxMonData(boxMon, MON_DATA_SPDEF_IV, NULL);
            SetMonData(egg, MON_DATA_SPDEF_IV, &inheritedIV);
            break;
        }
    }
}

static u8 LoadEggMoves(Pokemon *mon, u16 *dest) {
    u16 numEggMoves;
    u16 i;
    u16 *eggMoveList = GfGfxLoader_LoadFromNarc(NARC_fielddata_breeding_egg_move_list, 0, FALSE, HEAP_ID_FIELD1, TRUE);
    numEggMoves = 0;
    u16 offset = 0;

    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    for (i = 0; i < 2045; i++) {
        if (species + 20000 == eggMoveList[i]) {
            offset = i + 1;
            break;
        }
    }
    for (i = 0; i < MAX_EGG_MOVES; i++) {
        if (eggMoveList[offset + i] > 20000) {
            break;
        }
        dest[i] = eggMoveList[offset + i];
        numEggMoves++;
    }
    Heap_Free(eggMoveList);
    return numEggMoves;
}

struct EggMoveSearch {
    int dad_moves[MAX_MON_MOVES];
    int shared_moves[MAX_MON_MOVES];
    int mom_moves[MAX_MON_MOVES];
    u16 baby_learnset[50];
    u16 baby_egg_moves[MAX_EGG_MOVES];
};

static void InheritMoves(Pokemon *egg, BoxPokemon *father, BoxPokemon *mother) {
    u16 moveSlot, j;
    struct EggMoveSearch *search = Heap_Alloc(HEAP_ID_FIELD1, sizeof(struct EggMoveSearch));
    u16 sharedMoves = 0;
    MI_CpuClearFast(search, sizeof(struct EggMoveSearch));

    u16 egg_species = GetMonData(egg, MON_DATA_SPECIES, NULL);
    u16 egg_form = GetMonData(egg, MON_DATA_FORM, NULL);
    u16 learnset_size = Species_LoadLearnsetTable(egg_species, egg_form, search->baby_learnset);
    for (moveSlot = 0; moveSlot < MAX_MON_MOVES; moveSlot++) {
        search->dad_moves[moveSlot] = GetBoxMonData(father, MON_DATA_MOVE1 + moveSlot, NULL);
        search->mom_moves[moveSlot] = GetBoxMonData(mother, MON_DATA_MOVE1 + moveSlot, NULL);
    }
    u16 numEggMoves = LoadEggMoves(egg, search->baby_egg_moves);
    for (moveSlot = 0; moveSlot < MAX_MON_MOVES; moveSlot++) {
        if (search->dad_moves[moveSlot] != MOVE_NONE) {
            for (j = 0; j < numEggMoves; j++) {
                if (search->dad_moves[moveSlot] == search->baby_egg_moves[j]) {
                    if (TryAppendMonMove(egg, search->dad_moves[moveSlot]) == MOVE_APPEND_FULL) {
                        DeleteMonFirstMoveAndAppend(egg, search->dad_moves[moveSlot]);
                    }
                    break;
                }
            }
        } else {
            break;
        }
    }
    for (moveSlot = 0; moveSlot < MAX_MON_MOVES; moveSlot++) {
        if (search->dad_moves[moveSlot] != MOVE_NONE) {
            for (j = 0; j < NUM_TMHMS; j++) {
                if (search->dad_moves[moveSlot] == TMHMGetMove(j + ITEM_TM01)) {
                    if (GetTMHMCompatBySpeciesAndForm(egg_species, egg_form, j)) {
                        if (TryAppendMonMove(egg, search->dad_moves[moveSlot]) == MOVE_APPEND_FULL) {
                            DeleteMonFirstMoveAndAppend(egg, search->dad_moves[moveSlot]);
                        }
                    }
                }
            }
        }
    }
    for (moveSlot = 0; moveSlot < MAX_MON_MOVES; moveSlot++) {
        if (search->dad_moves[moveSlot] == MOVE_NONE) {
            break;
        }
        for (j = 0; j < MAX_MON_MOVES; j++) {
            if (search->dad_moves[moveSlot] == search->mom_moves[j] && search->dad_moves[moveSlot] != MOVE_NONE) {
                search->shared_moves[sharedMoves++] = search->dad_moves[moveSlot];
            }
        }
    }
    for (moveSlot = 0; moveSlot < MAX_MON_MOVES; moveSlot++) {
        if (search->shared_moves[moveSlot] == MOVE_NONE) {
            break;
        }
        for (j = 0; j < learnset_size; j++) {
            if (search->baby_learnset[j] != MOVE_NONE) {
                if (search->shared_moves[moveSlot] == search->baby_learnset[j]) {
                    if (TryAppendMonMove(egg, search->shared_moves[moveSlot]) == MOVE_APPEND_FULL) {
                        DeleteMonFirstMoveAndAppend(egg, search->shared_moves[moveSlot]);
                    }
                    break;
                }
            }
        }
    }
    Heap_Free(search);
}

void Save_Daycare_ResetEggStats(Daycare *dayCare) {
    Save_Daycare_SetEggPID(dayCare, 0);
    Save_Daycare_SetEggCycleCounter(dayCare, 0);
}

enum {
    INCENSE_BABY,
    INCENSE_ITEM,
    INCENSE_PARENT,
    INCENSE_TABLE_PARAMS,
};

static const u16 sIncenseMons[][INCENSE_TABLE_PARAMS] = {
    { SPECIES_WYNAUT,    ITEM_LAX_INCENSE,  SPECIES_WOBBUFFET },
    { SPECIES_AZURILL,   ITEM_SEA_INCENSE,  SPECIES_MARILL    },
    { SPECIES_MIME_JR,   ITEM_ODD_INCENSE,  SPECIES_MR_MIME   },
    { SPECIES_BONSLY,    ITEM_ROCK_INCENSE, SPECIES_SUDOWOODO },
    { SPECIES_MUNCHLAX,  ITEM_FULL_INCENSE, SPECIES_SNORLAX   },
    { SPECIES_MANTYKE,   ITEM_WAVE_INCENSE, SPECIES_MANTINE   },
    { SPECIES_BUDEW,     ITEM_ROSE_INCENSE, SPECIES_ROSELIA   },
    { SPECIES_HAPPINY,   ITEM_LUCK_INCENSE, SPECIES_CHANSEY   },
    { SPECIES_CHINGLING, ITEM_PURE_INCENSE, SPECIES_CHIMECHO  },
};

static u16 Daycare_BreedingIncenseCheck(u16 species, Daycare *dayCare) {
    BoxPokemon *parents[NUM_DAYCARE_MONS];
    u16 i;
    u16 row;

    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    for (i = 0; i < NELEMS(sIncenseMons); i++) {
        if (species == sIncenseMons[i][INCENSE_BABY]) {
            row = i;
            break;
        }
    }
    if (i == NELEMS(sIncenseMons)) {
        return species;
    }
    u16 item1 = GetBoxMonData(parents[0], MON_DATA_HELD_ITEM, NULL);
    u16 item2 = GetBoxMonData(parents[1], MON_DATA_HELD_ITEM, NULL);
    if (item1 != sIncenseMons[row][INCENSE_ITEM] && item2 != sIncenseMons[row][INCENSE_ITEM]) {
        species = sIncenseMons[row][INCENSE_PARENT];
    }
    return species;
}

static void Daycare_LightBallCheck(Pokemon *egg, Daycare *dayCare) {
    BoxPokemon *parents[NUM_DAYCARE_MONS];
    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    int item1 = GetBoxMonData(parents[0], MON_DATA_HELD_ITEM, NULL);
    int item2 = GetBoxMonData(parents[1], MON_DATA_HELD_ITEM, NULL);

    if (item1 == ITEM_LIGHT_BALL || item2 == ITEM_LIGHT_BALL) {
        if (TryAppendMonMove(egg, MOVE_VOLT_TACKLE) == MOVE_APPEND_FULL) {
            DeleteMonFirstMoveAndAppend(egg, MOVE_VOLT_TACKLE);
        }
    }
}

static u16 Daycare_GetEggSpecies(Daycare *dayCare, u8 *gender_idx) {
    u16 parent_species[NUM_DAYCARE_MONS];
    BoxPokemon *parents[NUM_DAYCARE_MONS];

    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    for (u16 i = 0; i < NUM_DAYCARE_MONS; i++) {
        if ((parent_species[i] = GetBoxMonData(parents[i], MON_DATA_SPECIES, NULL)) == SPECIES_DITTO) {
            gender_idx[0] = i ^ 1;
            gender_idx[1] = i;
        } else if (GetBoxMonGender(parents[i]) == MON_FEMALE) {
            gender_idx[0] = i;
            gender_idx[1] = i ^ 1;
        }
    }
    u16 mother = parent_species[gender_idx[0]];
    u16 eggSpecies = ReadFromPersonalPmsNarc(mother);
    if (eggSpecies == SPECIES_NIDORAN_F) {
        if (Save_Daycare_GetEggPID(dayCare) & EGG_GENDER_MALE) {
            eggSpecies = SPECIES_NIDORAN_M;
        } else {
            eggSpecies = SPECIES_NIDORAN_F;
        }
    }
    if (eggSpecies == SPECIES_ILLUMISE) {
        if (Save_Daycare_GetEggPID(dayCare) & EGG_GENDER_MALE) {
            eggSpecies = SPECIES_VOLBEAT;
        } else {
            eggSpecies = SPECIES_ILLUMISE;
        }
    }
    if (eggSpecies == SPECIES_MANAPHY) { // Inexplicably, this is not just set in the PMS narc.
        eggSpecies = SPECIES_PHIONE;
    }
    if (parent_species[gender_idx[1]] == SPECIES_DITTO && GetBoxMonGender(parents[gender_idx[0]]) != MON_FEMALE) {
        u16 swap = gender_idx[1];
        gender_idx[1] = gender_idx[0];
        gender_idx[0] = swap;
    }
    return eggSpecies;
}

void SetEggStats(Pokemon *mon, int species, u8 metLocation, PlayerProfile *profile, int trainerMemoStrat, int eggLocation) {
    u16 pokeball;
    u8 metLevel;
    u8 isEgg;

    u8 friendship = GetMonBaseStat(species, BASE_EGG_CYCLES);
    CreateMon(mon, species, 1, 32, FALSE, 0, OT_ID_PLAYER_ID, 0);

    metLevel = 0;
    pokeball = BALL_POKE;

    SetMonData(mon, MON_DATA_POKEBALL, &pokeball);
    SetMonData(mon, MON_DATA_FRIENDSHIP, &friendship);
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);

    if (metLocation != MAPSEC_MYSTERY_ZONE) {
        SetMonData(mon, MON_DATA_EGG_LOCATION, &metLocation);
    }
    isEgg = TRUE;
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);
    String *name = GetSpeciesName(SPECIES_EGG, HEAP_ID_FIELD1);
    SetMonData(mon, MON_DATA_NICKNAME_STRING, name);
    String_Delete(name);
    if (trainerMemoStrat == 4) { // TODO: Trainer memo strat consts?
        u32 otId = PlayerProfile_GetTrainerID(profile);
        u32 gender = PlayerProfile_GetTrainerGender(profile);
        name = PlayerProfile_GetPlayerName_NewString(profile, HEAP_ID_FIELD3);
        SetMonData(mon, MON_DATA_OT_NAME_STRING, name);
        SetMonData(mon, MON_DATA_OT_ID, &otId);
        SetMonData(mon, MON_DATA_OT_GENDER, &gender);
        String_Delete(name);
    }
    MonSetTrainerMemo(mon, profile, trainerMemoStrat, eggLocation, HEAP_ID_DEFAULT);
}

static void SetBreedEggStats(Pokemon *mon, u16 species, Daycare *dayCare, u32 otId, u8 form) {
    u16 pokeball;
    u8 metLevel;
    u8 friendship = GetMonBaseStat(species, BASE_EGG_CYCLES);
    u32 pid = Save_Daycare_GetEggPID(dayCare);
    if (Save_Daycare_MasudaCheck(dayCare)) {
        if (!CalcShininessByOtIdAndPersonality(otId, pid)) {
            for (int i = 0; i < 4; i++) {
                pid = PRandom(pid);
                if (CalcShininessByOtIdAndPersonality(otId, pid)) {
                    break;
                }
            }
        }
    }
    CreateMon(mon, species, 1, 32, TRUE, pid, OT_ID_PLAYER_ID, 0);

    metLevel = 0;
    pokeball = BALL_POKE;

    SetMonData(mon, MON_DATA_POKEBALL, &pokeball);
    SetMonData(mon, MON_DATA_FRIENDSHIP, &friendship);
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);
    SetMonData(mon, MON_DATA_FORM, &form);
    String *name = GetSpeciesName(SPECIES_EGG, HEAP_ID_FIELD1);
    SetMonData(mon, MON_DATA_NICKNAME_STRING, name);
    String_Delete(name);
}

void GiveEggToPlayer(Daycare *dayCare, Party *party, PlayerProfile *profile) {
    u8 gender_idx[NUM_DAYCARE_MONS];
    Pokemon *mon = AllocMonZeroed(HEAP_ID_FIELD1);
    u16 species = Daycare_BreedingIncenseCheck(Daycare_GetEggSpecies(dayCare, gender_idx), dayCare);
    u32 otId = PlayerProfile_GetTrainerID(profile);
    u8 mom_form = GetBoxMonData(Daycare_GetBoxMonI(dayCare, gender_idx[0]), MON_DATA_FORM, NULL);
    SetBreedEggStats(mon, species, dayCare, otId, mom_form);
    InheritIVs(mon, dayCare);
    InheritMoves(mon, Daycare_GetBoxMonI(dayCare, gender_idx[1]), Daycare_GetBoxMonI(dayCare, gender_idx[0]));
    MonSetTrainerMemo(mon, profile, 3, sub_02017FE4(MAPSECTYPE_GIFT, 0), HEAP_ID_FIELD1);
    if (species == SPECIES_PICHU) {
        Daycare_LightBallCheck(mon, dayCare);
    }
    u8 isEgg = TRUE;
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);
    Party_AddMon(party, mon);
    Save_Daycare_ResetEggStats(dayCare);
    Heap_Free(mon);
}

static u8 GetEggCyclesToSubtract(Party *party) {
    int partySize = Party_GetCount(party);
    for (u8 i = 0; i < partySize; i++) {
        if (!GetMonData(Party_GetMonByIndex(party, i), MON_DATA_SANITY_IS_EGG, NULL)) {
            u8 ability = GetMonData(Party_GetMonByIndex(party, i), MON_DATA_ABILITY, NULL);
            if (ability == ABILITY_MAGMA_ARMOR || ability == ABILITY_FLAME_BODY) {
                return 2;
            }
        }
    }
    return 1;
}

static BOOL EggGroupsHaveMatch(const u16 *eggGroups_1, const u16 *eggGroups_2) {
    for (int i = 0; i < EGG_GROUPS_PER_MON; i++) {
        for (int j = 0; j < EGG_GROUPS_PER_MON; j++) {
            if (eggGroups_1[i] == eggGroups_2[j]) {
                return TRUE;
            }
        }
    }
    return FALSE;
}

static u8 ComputeCompatibilityBetweenBoxMons(BoxPokemon **parents) {
    u16 eggGroups[NUM_DAYCARE_MONS][EGG_GROUPS_PER_MON];
    u16 species[NUM_DAYCARE_MONS];
    u32 otIds[NUM_DAYCARE_MONS];
    u32 genders[NUM_DAYCARE_MONS];

    for (u32 i = 0; i < NUM_DAYCARE_MONS; i++) {
        species[i] = GetBoxMonData(parents[i], MON_DATA_SPECIES, NULL);
        otIds[i] = GetBoxMonData(parents[i], MON_DATA_OT_ID, NULL);
        genders[i] = GetGenderBySpeciesAndPersonality(species[i], GetBoxMonData(parents[i], MON_DATA_PERSONALITY, NULL));
        eggGroups[i][0] = GetMonBaseStat(species[i], BASE_EGG_GROUP_1);
        eggGroups[i][1] = GetMonBaseStat(species[i], BASE_EGG_GROUP_2);
    }
    // The Undiscovered egg group cannot breed.
    if (eggGroups[0][0] == EGG_GROUP_UNDISCOVERED || eggGroups[1][0] == EGG_GROUP_UNDISCOVERED) {
        return PARENTS_INCOMPATIBLE;
    }
    // Two Ditto cannot breed.
    if (eggGroups[0][0] == EGG_GROUP_DITTO && eggGroups[1][0] == EGG_GROUP_DITTO) {
        return PARENTS_INCOMPATIBLE;
    }
    // If one of the two Pokemon is a Ditto, treat them as different species. See below.
    if (eggGroups[0][0] == EGG_GROUP_DITTO || eggGroups[1][0] == EGG_GROUP_DITTO) {
        if (otIds[0] == otIds[1]) {
            return PARENTS_LOW_COMPATIBILITY;
        } else {
            return PARENTS_MED_COMPATIBILITY;
        }
    }
    // Same-gender pairs cannot breed.
    if (genders[0] == genders[1]) {
        return PARENTS_INCOMPATIBLE;
    }
    // Genderless Pokemon cannot breed (without Ditto).
    if (genders[0] == MON_GENDERLESS || genders[1] == MON_GENDERLESS) {
        return PARENTS_INCOMPATIBLE;
    }
    // Nonmatching egg groups are incompatible.
    if (!EggGroupsHaveMatch(eggGroups[0], eggGroups[1])) {
        return PARENTS_INCOMPATIBLE;
    }
    // Compatibility is higher if both Pokemon are the same species and/or from two different OTs.
    if (species[0] == species[1]) {
        if (otIds[0] != otIds[1]) {
            return PARENTS_MAX_COMPATIBILITY;
        } else {
            return PARENTS_MED_COMPATIBILITY;
        }
    } else {
        if (otIds[0] != otIds[1]) {
            return PARENTS_MED_COMPATIBILITY;
        } else {
            return PARENTS_LOW_COMPATIBILITY;
        }
    }
}

static u8 Save_Daycare_CalcCompatibilityInternal(Daycare *dayCare) {
    BoxPokemon *parents[NUM_DAYCARE_MONS];
    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    return ComputeCompatibilityBetweenBoxMons(parents);
}

static const u16 sEggCycleSpecialDates[] = {
    112,  // Jan. 1st,  New Year's Day
    214,  // Feb. 14th, Valentine's Day
    303,  // Mar. 3rd,  Hinamatsuri (Dolls' Day)
    401,  // Apr. 1st,  April Fools' Day
    501,  // May. 1st,  Emerald US release date
    611,  // Jun. 11th  Sanno Festival?
    707,  // Jul. 7th,  Tanabata (Star Festival)
    821,  // Aug. 21st, Obon?
    907,  // Sep. 7th
    928,  // Sep. 28th, Diamond/Pearl JP release date
    1031, // Oct. 31st, Halloween
    1121, // Nov. 21st, Ruby/Sapphire JP release date
    1214, // Dec. 14th, Crystal JP release date
    1224, // Dec. 24th, Christmas Eve
    1225, // Dec. 25th, Christmas Day
};

static u8 Daycare_GetEggCycleLength(FieldSystem *fieldSystem) {
    int day = Field_GetDay(fieldSystem) + Field_GetMonth(fieldSystem) * 100;
    if (FieldSystem_HasPenalty(fieldSystem)) {
        return 255;
    }
    for (int i = 0; i < NELEMS(sEggCycleSpecialDates); i++) {
        if (day == sEggCycleSpecialDates[i]) {
            return 230;
        }
    }
    return 255;
}

BOOL HandleDaycareStep(Daycare *dayCare, Party *party, FieldSystem *fieldSystem) {
    u32 friendship;
    BoxPokemon *parents[NUM_DAYCARE_MONS];
    u32 slot;

    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    u32 monsInDaycare = 0;
    for (slot = 0; slot < NUM_DAYCARE_MONS; slot++) {
        if (GetBoxMonData(parents[slot], MON_DATA_SPECIES_EXISTS, NULL)) {
            DaycareMon_AddSteps(Save_Daycare_GetMonX(dayCare, slot), 1);
            monsInDaycare++;
        }
    }
    if (!Save_Daycare_HasEgg(dayCare) && monsInDaycare == NUM_DAYCARE_MONS) {
        u8 steps = DaycareMon_GetSteps(Save_Daycare_GetMonX(dayCare, 1));
        if (steps == 255) {
            u8 compat = Save_Daycare_CalcCompatibilityInternal(dayCare);
            if (compat > (LCRandom() * 100 / 0xFFFFu)) {
                GenerateEggPID(dayCare);
                sub_0209316C(fieldSystem);
            }
        }
    }
    int cycleCounter = Save_Daycare_GetEggCycleCounter(dayCare);
    Save_Daycare_SetEggCycleCounter(dayCare, cycleCounter + 1);
    if (cycleCounter + 1 == Daycare_GetEggCycleLength(fieldSystem)) {
        Save_Daycare_SetEggCycleCounter(dayCare, 0);
        u8 to_sub = GetEggCyclesToSubtract(party);
        for (slot = 0; slot < Party_GetCount(party); slot++) {
            Pokemon *mon = Party_GetMonByIndex(party, slot);
            if (GetMonData(mon, MON_DATA_IS_EGG, NULL) && !GetMonData(mon, MON_DATA_CHECKSUM_FAILED, NULL)) {
                friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
                if (friendship != 0) {
                    if (friendship >= to_sub) {
                        friendship -= to_sub;
                    } else {
                        friendship -= 1;
                    }
                    SetMonData(mon, MON_DATA_FRIENDSHIP, &friendship);
                } else {
                    return TRUE;
                }
            }
        }
    }
    return FALSE;
}

Pokemon *Party_GetMonToHatch(Party *party) {
    int partySize = Party_GetCount(party);
    for (int partySlot = 0; partySlot < partySize; partySlot++) {
        Pokemon *mon = Party_GetMonByIndex(party, partySlot);
        if (!GetMonData(mon, MON_DATA_CHECKSUM_FAILED, NULL) && GetMonData(mon, MON_DATA_IS_EGG, NULL) && GetMonData(mon, MON_DATA_EGG_CYCLES, NULL) == 0) {
            return mon;
        }
    }
    return NULL;
}

void Save_Daycare_BufferStoredMonNicks(Daycare *dayCare, MessageFormat *msgFmt) {
    BoxPokemon *parents[NUM_DAYCARE_MONS];
    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    if (GetBoxMonData(parents[0], MON_DATA_SPECIES, NULL)) {
        BufferBoxMonNickname(msgFmt, 0, parents[0]);
        BufferBoxMonOTName(msgFmt, 2, parents[0]);
    }
    if (GetBoxMonData(parents[1], MON_DATA_SPECIES, NULL)) {
        BufferBoxMonNickname(msgFmt, 1, parents[1]);
    }
}

void Save_Daycare_BufferMonStats(Daycare *dayCare, u32 nickname_idx, u32 level_idx, u32 gender_idx, u8 slot, MessageFormat *msgFmt) {
    DaycareMon *daycareMon = Save_Daycare_GetMonX(dayCare, slot);
    BoxPokemon *boxMon = Daycare_GetBoxMonI(dayCare, slot);
    BufferBoxMonNickname(msgFmt, nickname_idx, boxMon);

    u8 level = GetDaycareUpdatedLevel(boxMon, DaycareMon_GetSteps(daycareMon));
    BufferIntegerAsString(msgFmt, level_idx, level, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);

    u8 gender = GetBoxMonData(boxMon, MON_DATA_GENDER, NULL);
    if (gender != MON_GENDERLESS) {
        u16 species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
        if ((species == SPECIES_NIDORAN_F || species == SPECIES_NIDORAN_M) && !GetBoxMonData(boxMon, MON_DATA_HAS_NICKNAME, NULL)) {
            gender = MON_GENDERLESS;
        }
    }
    BufferGenderSymbol(msgFmt, gender_idx, gender);
}

u16 Save_Daycare_BufferTailMonNick(Daycare *dayCare, MessageFormat *msgFmt) {
    BoxPokemon *boxMon1 = DaycareMon_GetBoxMon(Save_Daycare_GetMonX(dayCare, 0));
    BoxPokemon *boxMon2 = DaycareMon_GetBoxMon(Save_Daycare_GetMonX(dayCare, 1));
    u16 species1 = GetBoxMonData(boxMon1, MON_DATA_SPECIES, NULL);
    u16 species2 = GetBoxMonData(boxMon2, MON_DATA_SPECIES, NULL);
    if (species2 == SPECIES_NONE) {
        BufferBoxMonNickname(msgFmt, 0, boxMon1);
        return species1;
    } else {
        BufferBoxMonNickname(msgFmt, 0, boxMon2);
        return species2;
    }
}

u8 Save_Daycare_GetState(Daycare *dayCare) {
    if (Save_Daycare_HasEgg(dayCare)) {
        return DAYCARE_EGG_WAITING;
    }
    u8 count = Save_Daycare_CountMonsInDaycare(dayCare);
    if (count != 0) {
        return count + 1; // DAYCARE_ONE_MON or DAYCARE_TWO_MONS.
    }
    return DAYCARE_NO_MONS;
}

static u8 ConvertDaycareCompatibilityScore(u32 compatibility) {
    switch (compatibility) {
    case PARENTS_INCOMPATIBLE:
        return 3;
    case PARENTS_LOW_COMPATIBILITY:
        return 2;
    case PARENTS_MED_COMPATIBILITY:
        return 1;
    case PARENTS_MAX_COMPATIBILITY:
        return 0;
    default:
        return 0;
    }
}

u8 Save_Daycare_CalcCompatibility(Daycare *dayCare) {
    return ConvertDaycareCompatibilityScore(Save_Daycare_CalcCompatibilityInternal(dayCare));
}

static void sub_0206D038(Pokemon *mon, enum HeapID heapID) {
    u16 moves[MAX_MON_MOVES];
    u8 pp[MAX_MON_MOVES];
    u32 otId;
    u8 ivs[NUM_STATS];
    u16 metLoc;
    u8 pokerus;
    u8 language;
    u8 version;
    u8 markings;
    u8 friendship;
    u8 fateful;
    u8 form;
    u8 otGender;
    u8 metYear;
    u8 metMonth;
    u8 metDay;
    u16 species;
    u8 i;

    String *string = String_New(PLAYER_NAME_LENGTH + 1, heapID);
    Pokemon *tempMon = AllocMonZeroed(heapID);
    species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    for (i = 0; i < MAX_MON_MOVES; i++) {
        moves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
        pp[i] = GetMonData(mon, MON_DATA_MOVE1_PP + i, NULL);
    }
    u32 pid = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
    for (i = 0; i < NUM_STATS; i++) {
        ivs[i] = GetMonData(mon, MON_DATA_HP_IV + i, NULL);
    }
    language = GetMonData(mon, MON_DATA_LANGUAGE, NULL);
    version = GetMonData(mon, MON_DATA_MET_GAME, NULL);
    markings = GetMonData(mon, MON_DATA_MARKINGS, NULL);
    pokerus = GetMonData(mon, MON_DATA_POKERUS, NULL);
    fateful = GetMonData(mon, MON_DATA_FATEFUL_ENCOUNTER, NULL);
    GetMonData(mon, MON_DATA_OT_NAME_STRING, string);
    otGender = GetMonData(mon, MON_DATA_OT_GENDER, NULL);
    otId = GetMonData(mon, MON_DATA_OT_ID, NULL);
    form = GetMonData(mon, MON_DATA_FORM, NULL);
    if (species == SPECIES_MANAPHY && GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_EXTERNAL, 1)) {
        if (CalcShininessByOtIdAndPersonality(otId, pid)) {
            do {
                pid = PRandom(pid);
            } while (CalcShininessByOtIdAndPersonality(otId, pid));
        }
    }
    CreateMon(tempMon, species, 1, 32, TRUE, pid, OT_ID_PLAYER_ID, 0);
    for (i = 0; i < MAX_MON_MOVES; i++) {
        SetMonData(tempMon, MON_DATA_MOVE1 + i, &moves[i]);
        SetMonData(tempMon, MON_DATA_MOVE1_PP + i, &pp[i]);
    }
    for (i = 0; i < NUM_STATS; i++) {
        SetMonData(tempMon, MON_DATA_HP_IV + i, &ivs[i]);
    }
    SetMonData(tempMon, MON_DATA_LANGUAGE, &language);
    SetMonData(tempMon, MON_DATA_MET_GAME, &version);
    SetMonData(tempMon, MON_DATA_MARKINGS, &markings);
    friendship = 120;
    SetMonData(tempMon, MON_DATA_FRIENDSHIP, &friendship);
    SetMonData(tempMon, MON_DATA_POKERUS, &pokerus);
    SetMonData(tempMon, MON_DATA_FATEFUL_ENCOUNTER, &fateful);
    SetMonData(tempMon, MON_DATA_OT_NAME_STRING, string);
    SetMonData(tempMon, MON_DATA_OT_GENDER, &otGender);
    SetMonData(tempMon, MON_DATA_OT_ID, &otId);
    SetMonData(tempMon, MON_DATA_FORM, &form);
    metLoc = GetMonData(mon, MON_DATA_EGG_LOCATION, NULL);
    metYear = GetMonData(mon, MON_DATA_EGG_YEAR, NULL);
    metMonth = GetMonData(mon, MON_DATA_EGG_MONTH, NULL);
    metDay = GetMonData(mon, MON_DATA_EGG_DAY, NULL);
    SetMonData(tempMon, MON_DATA_EGG_LOCATION, &metLoc);
    SetMonData(tempMon, MON_DATA_EGG_YEAR, &metYear);
    SetMonData(tempMon, MON_DATA_EGG_MONTH, &metMonth);
    SetMonData(tempMon, MON_DATA_EGG_DAY, &metDay);
    metLoc = GetMonData(mon, MON_DATA_MET_LOCATION, NULL);
    metYear = GetMonData(mon, MON_DATA_MET_YEAR, NULL);
    metMonth = GetMonData(mon, MON_DATA_MET_MONTH, NULL);
    metDay = GetMonData(mon, MON_DATA_MET_DAY, NULL);
    SetMonData(tempMon, MON_DATA_MET_LOCATION, &metLoc);
    SetMonData(tempMon, MON_DATA_MET_YEAR, &metYear);
    SetMonData(tempMon, MON_DATA_MET_MONTH, &metMonth);
    SetMonData(tempMon, MON_DATA_MET_DAY, &metDay);
    CopyPokemonToPokemon(tempMon, mon);
    String_Delete(string);
    Heap_Free(tempMon);
}

void sub_0206D328(Pokemon *mon, enum HeapID heapID) {
    u16 nickname[POKEMON_NAME_LENGTH + 1];
    u8 isEgg = 70;
    u8 hasNickname = FALSE;
    u8 pokeball = BALL_POKE;
    u8 metLevel = 0;
    sub_0206D038(mon, heapID);
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);
    GetSpeciesNameIntoArray(GetMonData(mon, MON_DATA_SPECIES, NULL), HEAP_ID_DEFAULT, nickname);
    SetMonData(mon, MON_DATA_NICKNAME, nickname);
    SetMonData(mon, MON_DATA_HAS_NICKNAME, &hasNickname);
    SetMonData(mon, MON_DATA_POKEBALL, &pokeball);
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);
    CalcMonLevelAndStats(mon);
}

static BOOL Daycare_TryGetForcedInheritedIV(Daycare *dayCare, u8 *powerItemStat, u8 *daycareSlot) {
    u8 powerItemStats[NUM_DAYCARE_MONS];
    u8 i;
    u8 powerItemParents = 0;
    u8 slotToInheritFrom = 0;
    for (i = 0; i < NUM_DAYCARE_MONS; i++) {
        if (SetStatIdToPowerItemStat(GetBoxMonData(Daycare_GetBoxMonI(dayCare, i), MON_DATA_HELD_ITEM, NULL), &powerItemStats[i])) {
            slotToInheritFrom = i;
            powerItemParents++;
        }
    }
    if (powerItemParents == NUM_DAYCARE_MONS) {
        if (LCRandom() % 2 != 0) {
            *powerItemStat = powerItemStats[0];
            *daycareSlot = 0;
            return TRUE;
        } else {
            *powerItemStat = powerItemStats[1];
            *daycareSlot = 1;
            return TRUE;
        }
    } else if (powerItemParents == 1) {
        *powerItemStat = powerItemStats[slotToInheritFrom];
        *daycareSlot = slotToInheritFrom;
        return TRUE;
    } else {
        *powerItemStat = 0;
        *daycareSlot = 0;
        return FALSE;
    }
}

static BOOL SetStatIdToPowerItemStat(u16 itemId, u8 *statId) {
    switch (itemId) {
    case ITEM_POWER_WEIGHT:
        *statId = STAT_HP;
        return TRUE;
    case ITEM_POWER_BRACER:
        *statId = STAT_ATK;
        return TRUE;
    case ITEM_POWER_BELT:
        *statId = STAT_DEF;
        return TRUE;
    case ITEM_POWER_ANKLET:
        *statId = STAT_SPEED;
        return TRUE;
    case ITEM_POWER_LENS:
        *statId = STAT_SPATK;
        return TRUE;
    case ITEM_POWER_BAND:
        *statId = STAT_SPDEF;
        return TRUE;
    default:
        return FALSE;
    }
}
