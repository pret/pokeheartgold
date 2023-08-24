#include "global.h"
#include "get_egg.h"
#include "party.h"
#include "game_stats.h"
#include "math_util.h"
#include "gf_gfx_loader.h"
#include "item.h"
#include "msgdata.h"
#include "unk_0208E600.h"
#include "unk_02055418.h"
#include "unk_02092BE8.h"
#include "map_section.h"
#include "script.h"
#include "constants/moves.h"
#include "constants/items.h"
#include "constants/balls.h"
#include "constants/map_sections.h"
#include "constants/abilities.h"
#include "unk_02055418.h"

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
static void _IVList_Remove(u8 *ptr, int idx);
static void InheritIVs(Pokemon *egg, Daycare *dayCare);
static u8 LoadEggMoves(Pokemon *mon, u16 *dest);
static void InheritMoves(Pokemon *egg, BoxPokemon *father, BoxPokemon *mother);
static u16 Daycare_BreedingIncenseCheck(u16 species, Daycare *dayCare);
static void Daycare_LightBallCheck(Pokemon *egg, Daycare *dayCare);
static u16 Daycare_GetEggSpecies(Daycare *dayCare, u8 *gender_idx);
static void SetBreedEggStats(Pokemon *mon, u16 species, Daycare *dayCare, u32 otId, u8 form);
static u8 GetEggCyclesToSubtract(Party *party);
static BOOL sub_0206CB88(const u16 *a0, const u16 *a1);
static u8 ComputeCompatibilityBetweenBoxMons(BoxPokemon **parents);
static u8 Save_Daycare_CalcCompatibilityInternal(Daycare *dayCare);
static u8 sub_0206CCD8(FieldSystem *fieldSystem);
static u8 ConvertDaycareCompatibilityScore(u32 compatibility);
static void sub_0206D038(Pokemon *mon, HeapID heapId);
static BOOL Daycare_TryGetForcedInheritedIV(Daycare *dayCare, u8 *a1, u8 *a2);
static BOOL PowerItemIdToInheritedIvIdx(u16 itemId, u8 *a1);

BoxPokemon *Daycare_GetBoxMonI(Daycare *daycare, s32 idx) {
    return DaycareMon_GetBoxMon(Save_Daycare_GetMonX(daycare, idx));
}

static u8 Save_Daycare_CountMonsInDaycare(Daycare *daycare) {
    u8 ct, i;

    ct = 0;

    for (i = 0; i < 2; i++) {
        if (GetBoxMonData(DaycareMon_GetBoxMon(Save_Daycare_GetMonX(daycare, i)), MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
            ct++;
        }
    }

    return ct;
}

static int Save_Daycare_GetAvailableSlot(Daycare *daycare) {
    u8 i;
    static Daycare *_021D4218;

    _021D4218 = daycare;
    for (i = 0; i < 2; i++) {
        if (GetBoxMonData(DaycareMon_GetBoxMon(Save_Daycare_GetMonX(daycare, i)), MON_DATA_SPECIES, NULL) == SPECIES_NONE) {
            return i;
        }
    }

    return -1;
}

static void DaycareMon_CopyFromPartySlot(Party *party, int partyIdx, DaycareMon *daycareMon, SaveData *saveData) {
    u16 nickname[POKEMON_NAME_LENGTH + 1];
    u8 mood;
    DaycareMail *daycareMail;
    BoxPokemon *boxMon;
    Pokemon *partyMon;
    const u16 *playerNamePtr;

    partyMon = Party_GetMonByIndex(party, partyIdx);
    daycareMail = DaycareMon_GetExtras(daycareMon);
    boxMon = DaycareMon_GetBoxMon(daycareMon);
    playerNamePtr = PlayerProfile_GetNamePtr(Save_PlayerData_GetProfileAddr(saveData));
    GetMonData(partyMon, MON_DATA_NICKNAME, nickname);
    if (BoxMonIsHoldingMail(Mon_GetBoxMon(partyMon))) {
        GetMonData(partyMon, MON_DATA_MAIL_STRUCT, DaycareMail_GetMailPtr(daycareMail));
    }
    mood = 0;
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
    GameStats_Inc(Save_GameStats_Get(saveData), 41);
    DaycareMon_CopyFromPartySlot(party, partyIdx, Save_Daycare_GetMonX(dayCare, Save_Daycare_GetAvailableSlot(dayCare)), saveData);
}

static void Save_Daycare_Compaction(Daycare *daycare) {
    DaycareMon *mon1;
    DaycareMon *mon2;
    BoxPokemon *boxmon1;
    BoxPokemon *boxmon2;

    mon1 = Save_Daycare_GetMonX(daycare, 0);
    mon2 = Save_Daycare_GetMonX(daycare, 1);
    boxmon1 = DaycareMon_GetBoxMon(mon1);
    boxmon2 = DaycareMon_GetBoxMon(mon2);

    if (GetBoxMonData(boxmon1, MON_DATA_SPECIES, NULL) == SPECIES_NONE && GetBoxMonData(boxmon2, MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
        DaycareMon_Copy(mon1, mon2);
        DaycareMon_Init(mon2);
    }
}

static void Daycare_LearnLevelUpMoves(Pokemon *mon) {
    int i;
    int last_i;
    u16 learned;
    int stat;

    for (i = 0, last_i = 0; i < MAX_LEVEL; i++) {
        if (!Pokemon_TryLevelUp(mon)) {
            break;
        }
        last_i = 0;
        for (
            stat = MonTryLearnMoveOnLevelUp(mon, &last_i, &learned);
            stat != 0;
            stat = MonTryLearnMoveOnLevelUp(mon, &last_i, &learned)
            ) {
            if (stat == MOVE_APPEND_FULL) {
                DeleteMonFirstMoveAndAppend(mon, learned);
            }
        }
    }
    CalcMonLevelAndStats(mon);
}

static int Save_Daycare_MoveMonToParty(Party *party, DaycareMon *daycareMon, MessageFormat *msgFmt) {
    u32 exp;
    Pokemon *mon;
    BoxPokemon *boxMon;
    DaycareMail *daycareMail;
    u16 species;

    mon = AllocMonZeroed(HEAP_ID_4);
    boxMon = DaycareMon_GetBoxMon(daycareMon);
    daycareMail = DaycareMon_GetExtras(daycareMon);

    BufferBoxMonNickname(msgFmt, 0, boxMon);
    species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);

    CopyBoxPokemonToPokemon(boxMon, mon);
    if (GetMonData(mon, MON_DATA_LEVEL, NULL) != MAX_LEVEL) {
        exp = GetMonData(mon, MON_DATA_EXPERIENCE, NULL);
        exp += DaycareMon_GetSteps(daycareMon);
        SetMonData(mon, MON_DATA_EXPERIENCE, &exp);
        Daycare_LearnLevelUpMoves(mon);
    }
    if (BoxMonIsHoldingMail(boxMon)) {
        SetMonData(mon, MON_DATA_MAIL_STRUCT, DaycareMail_GetMailPtr(daycareMail));
    }
    Party_AddMon(party, mon);
    ZeroBoxMonData(boxMon);
    DaycareMon_SetSteps(daycareMon, 0);
    FreeToHeap(mon);
    return species;
}

u16 Save_Daycare_RetrieveMon(Party *party, MessageFormat *msgFmt, Daycare *daycare, u8 whomstdve) {
    u16 ret;

    ret = Save_Daycare_MoveMonToParty(party, Save_Daycare_GetMonX(daycare, whomstdve), msgFmt);
    Save_Daycare_Compaction(daycare);
    return ret;
}

static int GetDaycareUpdatedLevel(BoxPokemon *boxMon, u32 steps) {
    Pokemon *tmpMon;
    BoxPokemon *boxmon_tmp;
    u32 exp;
    u32 level;

    tmpMon = AllocMonZeroed(HEAP_ID_FIELD);
    boxmon_tmp = Mon_GetBoxMon(tmpMon);
    CopyBoxPokemonToBoxPokemon(boxMon, boxmon_tmp);
    exp = GetBoxMonData(boxmon_tmp, MON_DATA_EXPERIENCE, NULL);
    exp += steps;
    SetBoxMonData(boxmon_tmp, MON_DATA_EXPERIENCE, &exp);
    level = CalcBoxMonLevel(boxmon_tmp);
    FreeToHeap(tmpMon);
    return level;
}

int DaycareMon_CalcLevelGrowth(DaycareMon *daycareMon) {
    BoxPokemon *boxMon;
    u8 cur_level;
    u8 new_level;

    boxMon = DaycareMon_GetBoxMon(daycareMon);
    cur_level = CalcBoxMonLevel(boxMon);
    new_level = GetDaycareUpdatedLevel(boxMon, DaycareMon_GetSteps(daycareMon));
    return new_level - cur_level;
}

static u8 DaycareMon_BufferLevelGrowthAndNick(DaycareMon *daycareMon, MessageFormat *msgFmt) {
    BoxPokemon *boxMon;
    int levelGrowth;

    boxMon = DaycareMon_GetBoxMon(daycareMon);
    levelGrowth = DaycareMon_CalcLevelGrowth(daycareMon);
    BufferIntegerAsString(msgFmt, 1, levelGrowth, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    BufferBoxMonNickname(msgFmt, 0, boxMon);
    return levelGrowth;
}

static u16 DaycareMon_BufferNickAndRetrievalPrice(DaycareMon *daycareMon, MessageFormat *msgFmt) {
    BoxPokemon *boxMon;
    u16 levelGrowth;
    u16 price;
    boxMon = DaycareMon_GetBoxMon(daycareMon);
    levelGrowth = DaycareMon_CalcLevelGrowth(daycareMon);
    BufferBoxMonNickname(msgFmt, 0, boxMon);
    price = (levelGrowth + 1) * 100;
    BufferIntegerAsString(msgFmt, 1, price, 5, PRINTING_MODE_LEFT_ALIGN, TRUE);
    return price;
}

u16 Save_Daycare_BufferMonNickAndRetrievalPrice(Daycare *dayCare, u8 slot, MessageFormat *msgFmt) {
    return DaycareMon_BufferNickAndRetrievalPrice(Save_Daycare_GetMonX(dayCare, slot), msgFmt);
}

u8 Save_Daycare_BufferGrowthAndNick(Daycare *dayCare, u32 slot, MessageFormat *msgFmt) {
    DaycareMon *daycareMon;

    daycareMon = Save_Daycare_GetMonX(dayCare, slot);
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
    BoxPokemon *boxmons[2];
    int i;
    u8 everstone_idx;
    u8 num_everstones;

    Daycare_GetBothBoxMonsPtr(dayCare, boxmons);

    num_everstones = 0;
    everstone_idx = 0;
    for (i = 0; i < 2; i++) {
        if (GetBoxMonData(boxmons[i], MON_DATA_HELD_ITEM, NULL) == ITEM_EVERSTONE) {
            everstone_idx = i;
            num_everstones++;
        }
    }
    if (num_everstones == 2) {
        if ((LCRandom() % 2) == 0) {
            everstone_idx = 1;
        } else {
            everstone_idx = 0;
        }
        if (LCRandom() >= 0x7FFF) {
            return -1;
        } else {
            return everstone_idx;
        }
    } else if (num_everstones == 1) {
        if (LCRandom() >= 0x7FFF) {
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
    int everstone_num;
    int nature;
    int i = 0;

    everstone_num = Daycare_EverstoneCheck(dayCare);
    if (everstone_num < 0) {
        Save_Daycare_SetEggPID(dayCare, MTRandom());
    } else {
        nature = GetNatureFromPersonality(GetBoxMonData(Daycare_GetBoxMonI(dayCare, everstone_num), MON_DATA_PERSONALITY, NULL));
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

static void _IVList_Remove(u8 *ptr, int idx) {
    u8 sp0[6];
    int i, j;

    ptr[idx] = 0xFF;
    for (i = 0; i < 6; i++) {
        sp0[i] = ptr[i];
    }
    j = 0;
    for (i = 0; i < 6; i ++) {
        if (sp0[i] != 0xFF) {
            ptr[j] = sp0[i];
            j++;
        }
    }
}

static void InheritIVs(Pokemon *egg, Daycare *dayCare) {
    u8 sp10[3];
    u8 spA[6];
    u8 sp7[3];
    u8 sp6;
    u8 sp5;
    u8 sp4;
    u8 i;
    u8 r6;
    u8 j;
    BoxPokemon *boxMon;

    for (i = 0; i < 6; i++) {
        spA[i] = i;
    }
    if (Daycare_TryGetForcedInheritedIV(dayCare, &sp5, &sp4)) {
        sp10[0] = sp5;
        r6 = 1;
        _IVList_Remove(spA, sp5);
        sp7[0] = sp4;
    } else {
        r6 = 0;
    }
    for (i = r6; i < 3; i++) {
        j = (LCRandom() % (6 - i));
        sp10[i] = spA[j];
        _IVList_Remove(spA, j);
    }
    GF_ASSERT(sp10[0] != sp10[1]);
    GF_ASSERT(sp10[1] != sp10[2]);
    GF_ASSERT(sp10[2] != sp10[0]);
    for (i = r6; i < 3; i++) {
        sp7[i] = LCRandom() % 2;
    }
    for (i = 0; i < 3; i++) {
        boxMon = Daycare_GetBoxMonI(dayCare, sp7[i]);
        switch (sp10[i]) {
        case 0:
            sp6 = GetBoxMonData(boxMon, MON_DATA_HP_IV, NULL);
            SetMonData(egg, MON_DATA_HP_IV, &sp6);
            break;
        case 1:
            sp6 = GetBoxMonData(boxMon, MON_DATA_ATK_IV, NULL);
            SetMonData(egg, MON_DATA_ATK_IV, &sp6);
            break;
        case 2:
            sp6 = GetBoxMonData(boxMon, MON_DATA_DEF_IV, NULL);
            SetMonData(egg, MON_DATA_DEF_IV, &sp6);
            break;
        case 3:
            sp6 = GetBoxMonData(boxMon, MON_DATA_SPEED_IV, NULL);
            SetMonData(egg, MON_DATA_SPEED_IV, &sp6);
            break;
        case 4:
            sp6 = GetBoxMonData(boxMon, MON_DATA_SPATK_IV, NULL);
            SetMonData(egg, MON_DATA_SPATK_IV, &sp6);
            break;
        case 5:
            sp6 = GetBoxMonData(boxMon, MON_DATA_SPDEF_IV, NULL);
            SetMonData(egg, MON_DATA_SPDEF_IV, &sp6);
            break;
        }
    }
}

static u8 LoadEggMoves(Pokemon *mon, u16 *dest) {
    u16 n;
    u16 *kowaza_list;
    u16 offset;
    u16 species;
    u16 i;

    kowaza_list = GfGfxLoader_LoadFromNarc(NARC_fielddata_sodateya_kowaza_list, 0, FALSE, HEAP_ID_4, TRUE);

    n = 0;
    offset = 0;

    species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    for (i = 0; i < 0x7FD; i++) {
        if (species + 20000 == kowaza_list[i]) {
            offset = i + 1;
            break;
        }
    }
    for (i = 0; i < 16; i++) {
        if (kowaza_list[offset + i] > 20000) {
            break;
        }
        dest[i] = kowaza_list[offset + i];
        n++;
    }
    FreeToHeap(kowaza_list);
    return n;
}

struct EggMoveSearch {
    int dad_moves[MAX_MON_MOVES];
    int shared_moves[MAX_MON_MOVES];
    int mom_moves[MAX_MON_MOVES];
    u16 baby_learnset[50];
    u16 baby_egg_moves[16];
};

static void InheritMoves(Pokemon *egg, BoxPokemon *father, BoxPokemon *mother) {
    u16 sp1C;
    u16 egg_species;
    u16 learnset_size;
    u16 egg_form;
    u16 i, j;
    u16 r5;
    struct EggMoveSearch *search;

    search = AllocFromHeap(HEAP_ID_4, sizeof(struct EggMoveSearch));
    sp1C = 0;
    MI_CpuClearFast(search, sizeof(struct EggMoveSearch));

    egg_species = GetMonData(egg, MON_DATA_SPECIES, NULL);
    egg_form = GetMonData(egg, MON_DATA_FORM, NULL);
    learnset_size = Species_LoadLearnsetTable(egg_species, egg_form, search->baby_learnset);
    for (i = 0; i < MAX_MON_MOVES; i++) {
        search->dad_moves[i] = GetBoxMonData(father, MON_DATA_MOVE1 + i, NULL);
        search->mom_moves[i] = GetBoxMonData(mother, MON_DATA_MOVE1 + i, NULL);
    }
    r5 = LoadEggMoves(egg, search->baby_egg_moves);
    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (search->dad_moves[i] != MOVE_NONE) {
            for (j = 0; j < r5; j++) {
                if (search->dad_moves[i] == search->baby_egg_moves[j]) {
                    if (TryAppendMonMove(egg, search->dad_moves[i]) == MOVE_APPEND_FULL) {
                        DeleteMonFirstMoveAndAppend(egg, search->dad_moves[i]);
                    }
                    break;
                }
            }
        } else {
            break;
        }
    }
    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (search->dad_moves[i] != MOVE_NONE) {
            for (j = 0; j < 100; j++) {
                if (search->dad_moves[i] == TMHMGetMove(j + ITEM_TM01)) {
                    if (GetTMHMCompatBySpeciesAndForm(egg_species, egg_form, j)) {
                        if (TryAppendMonMove(egg, search->dad_moves[i]) == MOVE_APPEND_FULL) {
                            DeleteMonFirstMoveAndAppend(egg, search->dad_moves[i]);
                        }
                    }
                }
            }
        }
    }
    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (search->dad_moves[i] == MOVE_NONE) {
            break;
        }
        for (j = 0; j < MAX_MON_MOVES; j++) {
            if (search->dad_moves[i] == search->mom_moves[j] && search->dad_moves[i] != MOVE_NONE) {
                search->shared_moves[sp1C++] = search->dad_moves[i];
            }
        }
    }
    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (search->shared_moves[i] == MOVE_NONE) {
            break;
        }
        for (j = 0; j < learnset_size; j++) {
            if (search->baby_learnset[j] != MOVE_NONE) {
                if (search->shared_moves[i] == search->baby_learnset[j]) {
                    if (TryAppendMonMove(egg, search->shared_moves[i]) == MOVE_APPEND_FULL) {
                        DeleteMonFirstMoveAndAppend(egg, search->shared_moves[i]);
                    }
                    break;
                }
            }
        }
    }
    FreeToHeap(search);
}

void Save_Daycare_ResetEggStats(Daycare *dayCare) {
    Save_Daycare_SetEggPID(dayCare, 0);
    Save_Daycare_SetEggCycleCounter(dayCare, 0);
}

static const u16 _020FF4AE[][3] = {
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
    BoxPokemon *parents[2];
    u16 i;
    u16 row_ndx;
    u16 item1, item2;

    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    for (i = 0; i < NELEMS(_020FF4AE); i++) {
        if (species == _020FF4AE[i][0]) {
            row_ndx = i;
            break;
        }
    }
    if (i == NELEMS(_020FF4AE)) {
        return species;
    }
    item1 = GetBoxMonData(parents[0], MON_DATA_HELD_ITEM, NULL);
    item2 = GetBoxMonData(parents[1], MON_DATA_HELD_ITEM, NULL);
    if (item1 != _020FF4AE[row_ndx][1] && item2 != _020FF4AE[row_ndx][1]) {
        species = _020FF4AE[row_ndx][2];
    }
    return species;
}

static void Daycare_LightBallCheck(Pokemon *egg, Daycare *dayCare) {
    BoxPokemon *parents[2];
    int item1, item2;

    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    item1 = GetBoxMonData(parents[0], MON_DATA_HELD_ITEM, NULL);
    item2 = GetBoxMonData(parents[1], MON_DATA_HELD_ITEM, NULL);

    if (item1 == ITEM_LIGHT_BALL || item2 == ITEM_LIGHT_BALL) {
        if (TryAppendMonMove(egg, MOVE_VOLT_TACKLE) == MOVE_APPEND_FULL) {
            DeleteMonFirstMoveAndAppend(egg, MOVE_VOLT_TACKLE);
        }
    }
}

static u16 Daycare_GetEggSpecies(Daycare *dayCare, u8 *gender_idx) {
    u16 parent_species[2];
    u16 i;
    u16 mother;
    u16 pms;
    u16 swp;
    BoxPokemon *parents[2];

    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    for (i = 0; i < 2; i++) {
        if ((parent_species[i] = GetBoxMonData(parents[i], MON_DATA_SPECIES, NULL)) == SPECIES_DITTO) {
            gender_idx[0] = i ^ 1;
            gender_idx[1] = i;
        } else if (GetBoxMonGender(parents[i]) == MON_FEMALE) {
            gender_idx[0] = i;
            gender_idx[1] = i ^ 1;
        }
    }
    mother = parent_species[gender_idx[0]];
    pms = ReadFromPersonalPmsNarc(mother);
    if (pms == SPECIES_NIDORAN_F) {
        if (Save_Daycare_GetEggPID(dayCare) & 0x8000) {
            pms = SPECIES_NIDORAN_M;
        } else {
            pms = SPECIES_NIDORAN_F;
        }
    }
    if (pms == SPECIES_ILLUMISE) {
        if (Save_Daycare_GetEggPID(dayCare) & 0x8000) {
            pms = SPECIES_VOLBEAT;
        } else {
            pms = SPECIES_ILLUMISE;
        }
    }
    if (pms == SPECIES_MANAPHY) {
        pms = SPECIES_PHIONE;
    }
    if (parent_species[gender_idx[1]] == SPECIES_DITTO && GetBoxMonGender(parents[gender_idx[0]]) != MON_FEMALE) {
        swp = gender_idx[1];
        gender_idx[1] = gender_idx[0];
        gender_idx[0] = swp;
    }
    return pms;
}

void SetEggStats(Pokemon *mon, int species, u8 metLocation, PlayerProfile *profile, int a4, int a5) {
    u32 otId;
    u32 gender;
    u16 pokeball;
    u8 metLevel;
    u8 isEgg;
    u8 friendship;
    String *name;

    friendship = GetMonBaseStat(species, BASE_EGG_CYCLES);
    CreateMon(mon, species, 1, 32, FALSE, 0, OT_ID_PLAYER_ID, 0);

    metLevel = 0;
    pokeball = BALL_POKE;

    SetMonData(mon, MON_DATA_POKEBALL, &pokeball);
    SetMonData(mon, MON_DATA_FRIENDSHIP, &friendship);
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);

    if (metLocation != MAPSEC_MYSTERY_ZONE) {
        SetMonData(mon, MON_DATA_EGG_MET_LOCATION, &metLocation);
    }
    isEgg = TRUE;
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);
    name = GetSpeciesName(SPECIES_EGG, HEAP_ID_4);
    SetMonData(mon, MON_DATA_NICKNAME_3, name);
    String_Delete(name);
    if (a4 == 4) {
        otId = PlayerProfile_GetTrainerID(profile);
        gender = PlayerProfile_GetTrainerGender(profile);
        name = PlayerProfile_GetPlayerName_NewString(profile, HEAP_ID_32);
        SetMonData(mon, MON_DATA_OT_NAME_2, name);
        SetMonData(mon, MON_DATA_OTID, &otId);
        SetMonData(mon, MON_DATA_MET_GENDER, &gender);
        String_Delete(name);
    }
    MonSetTrainerMemo(mon, profile, a4, a5, HEAP_ID_DEFAULT);
}

static void SetBreedEggStats(Pokemon *mon, u16 species, Daycare *dayCare, u32 otId, u8 form) {
    u16 pokeball;
    u8 metLevel;
    u8 friendship;
    String *name;
    u32 pid;
    int i;

    friendship = GetMonBaseStat(species, BASE_EGG_CYCLES);
    pid = Save_Daycare_GetEggPID(dayCare);
    if (Save_Daycare_MasudaCheck(dayCare)) {
        if (!CalcShininessByOtIdAndPersonality(otId, pid)) {
            for (i = 0; i < 4; i++) {
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
    name = GetSpeciesName(SPECIES_EGG, HEAP_ID_4);
    SetMonData(mon, MON_DATA_NICKNAME_3, name);
    String_Delete(name);
}

void GiveEggToPlayer(Daycare *dayCare, Party *party, PlayerProfile* profile) {
    Pokemon *mon;
    u16 species;
    u8 gender_idx[2];
    u8 isEgg;
    u32 otId;
    u8 mom_form;

    mon = AllocMonZeroed(HEAP_ID_4);
    species = Daycare_GetEggSpecies(dayCare, gender_idx);
    species = Daycare_BreedingIncenseCheck(species, dayCare);
    otId = PlayerProfile_GetTrainerID(profile);
    mom_form = GetBoxMonData(Daycare_GetBoxMonI(dayCare, gender_idx[0]), MON_DATA_FORM, NULL);
    SetBreedEggStats(mon, species, dayCare, otId, mom_form);
    InheritIVs(mon, dayCare);
    InheritMoves(mon, Daycare_GetBoxMonI(dayCare, gender_idx[1]), Daycare_GetBoxMonI(dayCare, gender_idx[0]));
    MonSetTrainerMemo(mon, profile, 3, sub_02017FE4(MAPSECTYPE_GIFT, 0), HEAP_ID_4);
    if (species == SPECIES_PICHU) {
        Daycare_LightBallCheck(mon, dayCare);
    }
    isEgg = TRUE;
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);
    Party_AddMon(party, mon);
    Save_Daycare_ResetEggStats(dayCare);
    FreeToHeap(mon);
}

static u8 GetEggCyclesToSubtract(Party *party) {
    int party_n;
    u8 i;
    u8 ability;

    party_n = Party_GetCount(party);
    for (i = 0; i < party_n; i++) {
        if (!GetMonData(Party_GetMonByIndex(party, i), MON_DATA_SANITY_IS_EGG, NULL)) {
            ability = GetMonData(Party_GetMonByIndex(party, i), MON_DATA_ABILITY, NULL);
            if (ability == ABILITY_MAGMA_ARMOR || ability == ABILITY_FLAME_BODY) {
                return 2;
            }
        }
    }
    return 1;
}

static BOOL sub_0206CB88(const u16 *a0, const u16 *a1) {
    int i, j;
    for (i = 0; i < 2; i++) {
        for (j = 0; j < 2; j++) {
            if (a0[i] == a1[j]) {
                return TRUE;
            }
        }
    }
    return FALSE;
}

static u8 ComputeCompatibilityBetweenBoxMons(BoxPokemon **parents) {
    u16 eggGroups[2][2];
    u16 species[2];
    u32 otIds[2];
    u32 genders[2];
    u32 i;

    for (i = 0; i < 2; i++) {
        species[i] = GetBoxMonData(parents[i], MON_DATA_SPECIES, NULL);
        otIds[i] = GetBoxMonData(parents[i], MON_DATA_OTID, NULL);
        genders[i] = GetGenderBySpeciesAndPersonality(species[i], GetBoxMonData(parents[i], MON_DATA_PERSONALITY, NULL));
        eggGroups[i][0] = GetMonBaseStat(species[i], BASE_EGG_GROUP_1);
        eggGroups[i][1] = GetMonBaseStat(species[i], BASE_EGG_GROUP_2);
    }
    // Undiscovered cannot mate with any
    if (eggGroups[0][0] == EGG_GROUP_UNDISCOVERED || eggGroups[1][0] == EGG_GROUP_UNDISCOVERED) {
        return 0;
    }
    // Two Ditto cannot mate
    if (eggGroups[0][0] == EGG_GROUP_DITTO && eggGroups[1][0] == EGG_GROUP_DITTO) {
        return 0;
    }
    // If one is a Ditto, treat as not same species. See below
    if (eggGroups[0][0] == EGG_GROUP_DITTO || eggGroups[1][0] == EGG_GROUP_DITTO) {
        if (otIds[0] == otIds[1]) {
            return 20;
        } else {
            return 50;
        }
    }
    // LGBT cannot breed in gen 4
    if (genders[0] == genders[1]) {
        return 0;
    }
    // Nonbinary gender cannot breed in gen 4
    if (genders[0] == MON_GENDERLESS || genders[1] == MON_GENDERLESS) {
        return 0;
    }
    // Nonmatching egg groups cannot breed in gen 4
    if (!sub_0206CB88(eggGroups[0], eggGroups[1])) {
        return 0;
    }
    // Compatibility is higher if same species.
    // Compatibility is higher if from two different OTs.
    if (species[0] == species[1]) {
        if (otIds[0] != otIds[1]) {
            return 70;
        } else {
            return 50;
        }
    } else {
        if (otIds[0] != otIds[1]) {
            return 50;
        } else {
            return 20;
        }
    }
}

static u8 Save_Daycare_CalcCompatibilityInternal(Daycare *dayCare) {
    BoxPokemon *parents[2];
    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    return ComputeCompatibilityBetweenBoxMons(parents);
}

static const u16 _020FF490[] = {
     112,
     214,
     303,
     401,
     501,
     611,
     707,
     821,
     907,
     928,
    1031,
    1121,
    1214,
    1224,
    1225,
};

static u8 sub_0206CCD8(FieldSystem *fieldSystem) {
    int day, i;

    day = Field_GetDay(fieldSystem) + Field_GetMonth(fieldSystem) * 100;
    if (sub_02055670(fieldSystem)) {
        return 255;
    }
    for (i = 0; i < NELEMS(_020FF490); i++) {
        if (day == _020FF490[i]) {
            return 230;
        }
    }
    return 255;
}

BOOL HandleDaycareStep(Daycare *dayCare, Party *party, FieldSystem *fieldSystem) {
    u32 friendship;
    BoxPokemon *parents[2];
    int cycle_ctr;
    u32 i, n;
    u8 steps;
    u8 compat;
    u8 to_sub;
    Pokemon *mon;

    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    n = 0;
    for (i = 0; i < 2; i++) {
        if (GetBoxMonData(parents[i], MON_DATA_SPECIES_EXISTS, NULL)) {
            DaycareMon_AddSteps(Save_Daycare_GetMonX(dayCare, i), 1);
            n++;
        }
    }
    if (!Save_Daycare_HasEgg(dayCare) && n == 2) {
        steps = DaycareMon_GetSteps(Save_Daycare_GetMonX(dayCare, 1));
        if (steps == 255) {
            compat = Save_Daycare_CalcCompatibilityInternal(dayCare);
            if (compat > (LCRandom() * 100u / 0xFFFFu)) {
                GenerateEggPID(dayCare);
                sub_0209316C(fieldSystem);
            }
        }
    }
    cycle_ctr = Save_Daycare_GetEggCycleCounter(dayCare);
    Save_Daycare_SetEggCycleCounter(dayCare, cycle_ctr + 1);
    if (cycle_ctr + 1 == sub_0206CCD8(fieldSystem)) {
        Save_Daycare_SetEggCycleCounter(dayCare, 0);
        to_sub = GetEggCyclesToSubtract(party);
        for (i = 0; i < Party_GetCount(party); i++) {
            mon = Party_GetMonByIndex(party, i);
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

Pokemon *sub_0206CE44(Party *party) {
    int i, n;
    Pokemon *mon;

    n = Party_GetCount(party);
    for (i = 0; i < n; i++) {
        mon = Party_GetMonByIndex(party, i);
        if (!GetMonData(mon, MON_DATA_CHECKSUM_FAILED, NULL) && GetMonData(mon, MON_DATA_IS_EGG, NULL) &&
            GetMonData(mon, MON_DATA_FRIENDSHIP, NULL) == 0) {
            return mon;
        }
    }
    return NULL;
}

void Save_Daycare_BufferStoredMonNicks(Daycare *dayCare, MessageFormat *msgFmt) {
    BoxPokemon *parents[2];

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
    DaycareMon *daycareMon;
    BoxPokemon *boxMon;
    u8 level;
    u8 gender;
    u16 species;

    daycareMon = Save_Daycare_GetMonX(dayCare, slot);
    boxMon = Daycare_GetBoxMonI(dayCare, slot);
    BufferBoxMonNickname(msgFmt, nickname_idx, boxMon);

    level = GetDaycareUpdatedLevel(boxMon, DaycareMon_GetSteps(daycareMon));
    BufferIntegerAsString(msgFmt, level_idx, level, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);

    gender = GetBoxMonData(boxMon, MON_DATA_GENDER, NULL);
    if (gender != MON_GENDERLESS) {
        species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
        if ((species == SPECIES_NIDORAN_F || species == SPECIES_NIDORAN_M) && !GetBoxMonData(boxMon, MON_DATA_HAS_NICKNAME, NULL)) {
            gender = MON_GENDERLESS;
        }
    }
    BufferGenderSymbol(msgFmt, gender_idx, gender);
}

u16 Save_Daycare_BufferTailMonNick(Daycare *dayCare, MessageFormat *msgFmt) {
    BoxPokemon *boxMon1;
    BoxPokemon *boxMon2;
    u16 species1;
    u16 species2;

    boxMon1 = DaycareMon_GetBoxMon(Save_Daycare_GetMonX(dayCare, 0));
    boxMon2 = DaycareMon_GetBoxMon(Save_Daycare_GetMonX(dayCare, 1));
    species1 = GetBoxMonData(boxMon1, MON_DATA_SPECIES, NULL);
    species2 = GetBoxMonData(boxMon2, MON_DATA_SPECIES, NULL);
    if (species2 == SPECIES_NONE) {
        BufferBoxMonNickname(msgFmt, 0, boxMon1);
        return species1;
    } else {
        BufferBoxMonNickname(msgFmt, 0, boxMon2);
        return species2;
    }
}

u8 Save_Daycare_GetState(Daycare *dayCare) {
    u8 count;
    if (Save_Daycare_HasEgg(dayCare)) {
        return 1;
    }
    count = Save_Daycare_CountMonsInDaycare(dayCare);
    if (count != 0) {
        return count + 2 - 1;
    }
    return 0;
}

static u8 ConvertDaycareCompatibilityScore(u32 compatibility) {
    switch (compatibility) {
    case 0:
        return 3;
    case 20:
        return 2;
    case 50:
        return 1;
    case 70:
        return 0;
    default:
        return 0;
    }
}

u8 Save_Daycare_CalcCompatibility(Daycare *dayCare) {
    return ConvertDaycareCompatibilityScore(Save_Daycare_CalcCompatibilityInternal(dayCare));
}

static void sub_0206D038(Pokemon *mon, HeapID heapId) {
    u16 moves[MAX_MON_MOVES];
    u8 pp[MAX_MON_MOVES];
    u32 otId;
    u8 ivs[NUM_STATS];
    u16 metLoc;
    u8 pokerus;
    u8 language;
    u8 version;
    u8 markings;
    u8 eggCycles;
    u8 fateful;
    u8 form;
    u8 otGender;
    u8 metYear;
    u8 metMonth;
    u8 metDay;
    u32 species;
    String *string;
    u8 i;
    u32 pid;
    Pokemon *tmpMon;

    string = String_New(PLAYER_NAME_LENGTH + 1, heapId);
    tmpMon = AllocMonZeroed(heapId);
    species = (u16)GetMonData(mon, MON_DATA_SPECIES, NULL);
    for (i = 0; i < MAX_MON_MOVES; i++) {
        moves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
        pp[i] = GetMonData(mon, MON_DATA_MOVE1PP + i, NULL);
    }
    pid = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
    for (i = 0; i < NUM_STATS; i++) {
        ivs[i] = GetMonData(mon, MON_DATA_HP_IV + i, NULL);
    }
    language = GetMonData(mon, MON_DATA_GAME_LANGUAGE, NULL);
    version = GetMonData(mon, MON_DATA_GAME_VERSION, NULL);
    markings = GetMonData(mon, MON_DATA_MARKINGS, NULL);
    pokerus = GetMonData(mon, MON_DATA_POKERUS, NULL);
    fateful = GetMonData(mon, MON_DATA_FATEFUL_ENCOUNTER, NULL);
    GetMonData(mon, MON_DATA_OT_NAME_2, string);
    otGender = GetMonData(mon, MON_DATA_MET_GENDER, NULL);
    otId = GetMonData(mon, MON_DATA_OTID, NULL);
    form = GetMonData(mon, MON_DATA_FORM, NULL);
    if (species == SPECIES_MANAPHY && GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == sub_02017FE4(MAPSECTYPE_EXTERNAL, 1)) {
        if (CalcShininessByOtIdAndPersonality(otId, pid)) {
            do {
                pid = PRandom(pid);
            } while (CalcShininessByOtIdAndPersonality(otId, pid));
        }
    }
    CreateMon(tmpMon, species, 1, 32, TRUE, pid, OT_ID_PLAYER_ID, 0);
    for (i = 0; i < MAX_MON_MOVES; i++) {
        SetMonData(tmpMon, MON_DATA_MOVE1 + i, &moves[i]);
        SetMonData(tmpMon, MON_DATA_MOVE1PP + i, &pp[i]);
    }
    for (i = 0; i < NUM_STATS; i++) {
        SetMonData(tmpMon, MON_DATA_HP_IV + i, &ivs[i]);
    }
    SetMonData(tmpMon, MON_DATA_GAME_LANGUAGE, &language);
    SetMonData(tmpMon, MON_DATA_GAME_VERSION, &version);
    SetMonData(tmpMon, MON_DATA_MARKINGS, &markings);
    eggCycles = 120;
    SetMonData(tmpMon, MON_DATA_FRIENDSHIP, &eggCycles);
    SetMonData(tmpMon, MON_DATA_POKERUS, &pokerus);
    SetMonData(tmpMon, MON_DATA_FATEFUL_ENCOUNTER, &fateful);
    SetMonData(tmpMon, MON_DATA_OT_NAME_2, string);
    SetMonData(tmpMon, MON_DATA_MET_GENDER, &otGender);
    SetMonData(tmpMon, MON_DATA_OTID, &otId);
    SetMonData(tmpMon, MON_DATA_FORM, &form);
    metLoc = GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL);
    metYear = GetMonData(mon, MON_DATA_EGG_MET_YEAR, NULL);
    metMonth = GetMonData(mon, MON_DATA_EGG_MET_MONTH, NULL);
    metDay = GetMonData(mon, MON_DATA_EGG_MET_DAY, NULL);
    SetMonData(tmpMon, MON_DATA_EGG_MET_LOCATION, &metLoc);
    SetMonData(tmpMon, MON_DATA_EGG_MET_YEAR, &metYear);
    SetMonData(tmpMon, MON_DATA_EGG_MET_MONTH, &metMonth);
    SetMonData(tmpMon, MON_DATA_EGG_MET_DAY, &metDay);
    metLoc = GetMonData(mon, MON_DATA_MET_LOCATION, NULL);
    metYear = GetMonData(mon, MON_DATA_MET_YEAR, NULL);
    metMonth = GetMonData(mon, MON_DATA_MET_MONTH, NULL);
    metDay = GetMonData(mon, MON_DATA_MET_DAY, NULL);
    SetMonData(tmpMon, MON_DATA_MET_LOCATION, &metLoc);
    SetMonData(tmpMon, MON_DATA_MET_YEAR, &metYear);
    SetMonData(tmpMon, MON_DATA_MET_MONTH, &metMonth);
    SetMonData(tmpMon, MON_DATA_MET_DAY, &metDay);
    CopyPokemonToPokemon(tmpMon, mon);
    String_Delete(string);
    FreeToHeap(tmpMon);
}

void sub_0206D328(Pokemon *mon, HeapID heapId) {
    u16 nickname[POKEMON_NAME_LENGTH + 1];
    u8 isEgg = 70;
    u8 hasNickname = FALSE;
    u8 pokeball = BALL_POKE;
    u8 metLevel = 0;
    sub_0206D038(mon, heapId);
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);
    GetSpeciesNameIntoArray(GetMonData(mon, MON_DATA_SPECIES, NULL), HEAP_ID_DEFAULT, nickname);
    SetMonData(mon, MON_DATA_NICKNAME, nickname);
    SetMonData(mon, MON_DATA_HAS_NICKNAME, &hasNickname);
    SetMonData(mon, MON_DATA_POKEBALL, &pokeball);
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);
    CalcMonLevelAndStats(mon);
}

static BOOL Daycare_TryGetForcedInheritedIV(Daycare *dayCare, u8 *a1, u8 *a2) {
    u8 sp8[2];
    u8 i, n, r7;

    n = 0;
    r7 = 0;
    for (i = 0; i < 2; i++) {
        if (PowerItemIdToInheritedIvIdx(GetBoxMonData(Daycare_GetBoxMonI(dayCare, i), MON_DATA_HELD_ITEM, NULL), &sp8[i])) {
            r7 = i;
            n++;
        }
    }
    if (n == 2) {
        if ((LCRandom() % 2) != 0) {
            *a1 = sp8[0];
            *a2 = 0;
            return TRUE;
        } else {
            *a1 = sp8[1];
            *a2 = 1;
            return TRUE;
        }
    } else if (n == 1) {
        *a1 = sp8[r7];
        *a2 = r7;
        return TRUE;
    } else {
        *a1 = 0;
        *a2 = 0;
        return FALSE;
    }
}

static BOOL PowerItemIdToInheritedIvIdx(u16 itemId, u8 *a1) {
    switch (itemId) {
    case ITEM_POWER_WEIGHT:
        *a1 = STAT_HP;
        return TRUE;
    case ITEM_POWER_BRACER:
        *a1 = STAT_ATK;
        return TRUE;
    case ITEM_POWER_BELT:
        *a1 = STAT_DEF;
        return TRUE;
    case ITEM_POWER_ANKLET:
        *a1 = STAT_SPEED;
        return TRUE;
    case ITEM_POWER_LENS:
        *a1 = STAT_SPATK;
        return TRUE;
    case ITEM_POWER_BAND:
        *a1 = STAT_SPDEF;
        return TRUE;
    default:
        return FALSE;
    }
}
