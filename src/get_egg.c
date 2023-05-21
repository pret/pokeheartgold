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

static u8 Sav2_DayCare_CountMonsInDayCare(DAYCARE *daycare);
static int Sav2_DayCare_GetAvailableSlot(DAYCARE *daycare);
static void DayCareMon_CopyFromPartySlot(PARTY *party, int partyIdx, DAYCAREMON *daycareMon, SAVEDATA *saveData);
static void Sav2_DayCare_Compaction(DAYCARE *daycare);
static void Daycare_LearnLevelUpMoves(Pokemon *mon);
static int Sav2_DayCare_MoveMonToParty(PARTY *party, DAYCAREMON *daycareMon, MessageFormat *msgFmt);
static int GetDayCareUpdatedLevel(BoxPokemon *boxMon, u32 steps);
static u8 DayCareMon_BufferLevelGrowthAndNick(DAYCAREMON *daycareMon, MessageFormat *msgFmt);
static u16 DayCareMon_BufferNickAndRetrievalPrice(DAYCAREMON *daycareMon, MessageFormat *msgFmt);
static void Daycare_GetBothBoxMonsPtr(DAYCARE *dayCare, BoxPokemon **boxmons);
static int Daycare_EverstoneCheck(DAYCARE *dayCare);
static void GenerateEggPID(DAYCARE *dayCare);
static void _IVList_Remove(u8 *ptr, int idx);
static void InheritIVs(Pokemon *egg, DAYCARE *dayCare);
static u8 LoadEggMoves(Pokemon *mon, u16 *dest);
static void InheritMoves(Pokemon *egg, BoxPokemon *father, BoxPokemon *mother);
static u16 Daycare_BreedingIncenseCheck(u16 species, DAYCARE *dayCare);
static void Daycare_LightBallCheck(Pokemon *egg, DAYCARE *dayCare);
static u16 Daycare_GetEggSpecies(DAYCARE *dayCare, u8 *gender_idx);
static void SetBreedEggStats(Pokemon *mon, u16 species, DAYCARE *dayCare, u32 otId, u8 forme);
static u8 GetEggCyclesToSubtract(PARTY *party);
static BOOL sub_0206CB88(const u16 *a0, const u16 *a1);
static u8 ComputeCompatibilityBetweenBoxMons(BoxPokemon **parents);
static u8 Sav2_DayCare_CalcCompatibilityInternal(DAYCARE *dayCare);
static u8 sub_0206CCD8(FieldSystem *fsys);
static u8 ConvertDayCareCompatibilityScore(u32 compatibility);
static void sub_0206D038(Pokemon *mon, HeapID heapId);
static BOOL DayCare_TryGetForcedInheritedIV(DAYCARE *dayCare, u8 *a1, u8 *a2);
static BOOL PowerItemIdToInheritedIvIdx(u16 itemId, u8 *a1);

BoxPokemon *Daycare_GetBoxMonI(DAYCARE *daycare, int idx) {
    return DayCareMon_GetBoxMon(Sav2_DayCare_GetMonX(daycare, idx));
}

static u8 Sav2_DayCare_CountMonsInDayCare(DAYCARE *daycare) {
    u8 ct, i;

    ct = 0;

    for (i = 0; i < 2; i++) {
        if (GetBoxMonData(DayCareMon_GetBoxMon(Sav2_DayCare_GetMonX(daycare, i)), MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
            ct++;
        }
    }

    return ct;
}

static int Sav2_DayCare_GetAvailableSlot(DAYCARE *daycare) {
    u8 i;
    static DAYCARE *_021D4218;

    _021D4218 = daycare;
    for (i = 0; i < 2; i++) {
        if (GetBoxMonData(DayCareMon_GetBoxMon(Sav2_DayCare_GetMonX(daycare, i)), MON_DATA_SPECIES, NULL) == SPECIES_NONE) {
            return i;
        }
    }

    return -1;
}

static void DayCareMon_CopyFromPartySlot(PARTY *party, int partyIdx, DAYCAREMON *daycareMon, SAVEDATA *saveData) {
    u16 nickname[POKEMON_NAME_LENGTH + 1];
    u8 mood;
    DAYCAREMAIL *daycareMail;
    BoxPokemon *boxMon;
    Pokemon *partyMon;
    const u16 *playerNamePtr;

    partyMon = GetPartyMonByIndex(party, partyIdx);
    daycareMail = DayCareMon_GetExtras(daycareMon);
    boxMon = DayCareMon_GetBoxMon(daycareMon);
    playerNamePtr = PlayerProfile_GetNamePtr(Sav2_PlayerData_GetProfileAddr(saveData));
    GetMonData(partyMon, MON_DATA_NICKNAME, nickname);
    if (BoxMonIsHoldingMail(Mon_GetBoxMon(partyMon))) {
        GetMonData(partyMon, MON_DATA_MAIL_STRUCT, DayCareMail_GetMailPtr(daycareMail));
    }
    mood = 0;
    SetMonData(partyMon, MON_DATA_MOOD, &mood);
    CopyPokemonToBoxPokemon(partyMon, boxMon);
    BoxMon_UpdateShayminForme(boxMon, SHAYMIN_LAND);
    DayCareMon_SetSteps(daycareMon, 0);
    RemoveMonFromParty(party, partyIdx);
    if (!PartyHasMon(party, SPECIES_CHATOT)) {
        Chatot_invalidate(Sav2_Chatot_get(saveData));
    }
}

void Sav2_DayCare_PutMonIn(PARTY *party, u8 partyIdx, DAYCARE *dayCare, SAVEDATA *saveData) {
    GameStats_Inc(Sav2_GameStats_get(saveData), 41);
    DayCareMon_CopyFromPartySlot(party, partyIdx, Sav2_DayCare_GetMonX(dayCare, Sav2_DayCare_GetAvailableSlot(dayCare)), saveData);
}

static void Sav2_DayCare_Compaction(DAYCARE *daycare) {
    DAYCAREMON *mon1;
    DAYCAREMON *mon2;
    BoxPokemon *boxmon1;
    BoxPokemon *boxmon2;

    mon1 = Sav2_DayCare_GetMonX(daycare, 0);
    mon2 = Sav2_DayCare_GetMonX(daycare, 1);
    boxmon1 = DayCareMon_GetBoxMon(mon1);
    boxmon2 = DayCareMon_GetBoxMon(mon2);

    if (GetBoxMonData(boxmon1, MON_DATA_SPECIES, NULL) == SPECIES_NONE && GetBoxMonData(boxmon2, MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
        DayCareMon_Copy(mon1, mon2);
        DayCareMon_init(mon2);
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

static int Sav2_DayCare_MoveMonToParty(PARTY *party, DAYCAREMON *daycareMon, MessageFormat *msgFmt) {
    u32 exp;
    Pokemon *mon;
    BoxPokemon *boxMon;
    DAYCAREMAIL *daycareMail;
    u16 species;

    mon = AllocMonZeroed(4);
    boxMon = DayCareMon_GetBoxMon(daycareMon);
    daycareMail = DayCareMon_GetExtras(daycareMon);

    BufferBoxMonNickname(msgFmt, 0, boxMon);
    species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);

    CopyBoxPokemonToPokemon(boxMon, mon);
    if (GetMonData(mon, MON_DATA_LEVEL, NULL) != MAX_LEVEL) {
        exp = GetMonData(mon, MON_DATA_EXPERIENCE, NULL);
        exp += DayCareMon_GetSteps(daycareMon);
        SetMonData(mon, MON_DATA_EXPERIENCE, &exp);
        Daycare_LearnLevelUpMoves(mon);
    }
    if (BoxMonIsHoldingMail(boxMon)) {
        SetMonData(mon, MON_DATA_MAIL_STRUCT, DayCareMail_GetMailPtr(daycareMail));
    }
    AddMonToParty(party, mon);
    ZeroBoxMonData(boxMon);
    DayCareMon_SetSteps(daycareMon, 0);
    FreeToHeap(mon);
    return species;
}

u16 Sav2_DayCare_RetrieveMon(PARTY *party, MessageFormat *msgFmt, DAYCARE *daycare, u8 whomstdve) {
    u16 ret;

    ret = Sav2_DayCare_MoveMonToParty(party, Sav2_DayCare_GetMonX(daycare, whomstdve), msgFmt);
    Sav2_DayCare_Compaction(daycare);
    return ret;
}

static int GetDayCareUpdatedLevel(BoxPokemon *boxMon, u32 steps) {
    Pokemon *tmpMon;
    BoxPokemon *boxmon_tmp;
    u32 exp;
    u32 level;

    tmpMon = AllocMonZeroed(11);
    boxmon_tmp = Mon_GetBoxMon(tmpMon);
    CopyBoxPokemonToBoxPokemon(boxMon, boxmon_tmp);
    exp = GetBoxMonData(boxmon_tmp, MON_DATA_EXPERIENCE, NULL);
    exp += steps;
    SetBoxMonData(boxmon_tmp, MON_DATA_EXPERIENCE, &exp);
    level = CalcBoxMonLevel(boxmon_tmp);
    FreeToHeap(tmpMon);
    return level;
}

int DayCareMon_CalcLevelGrowth(DAYCAREMON *daycareMon) {
    BoxPokemon *boxMon;
    u8 cur_level;
    u8 new_level;

    boxMon = DayCareMon_GetBoxMon(daycareMon);
    cur_level = CalcBoxMonLevel(boxMon);
    new_level = GetDayCareUpdatedLevel(boxMon, DayCareMon_GetSteps(daycareMon));
    return new_level - cur_level;
}

static u8 DayCareMon_BufferLevelGrowthAndNick(DAYCAREMON *daycareMon, MessageFormat *msgFmt) {
    BoxPokemon *boxMon;
    int levelGrowth;

    boxMon = DayCareMon_GetBoxMon(daycareMon);
    levelGrowth = DayCareMon_CalcLevelGrowth(daycareMon);
    BufferIntegerAsString(msgFmt, 1, levelGrowth, 3, STRCONVMODE_LEFT_ALIGN, TRUE);
    BufferBoxMonNickname(msgFmt, 0, boxMon);
    return levelGrowth;
}

static u16 DayCareMon_BufferNickAndRetrievalPrice(DAYCAREMON *daycareMon, MessageFormat *msgFmt) {
    BoxPokemon *boxMon;
    u16 levelGrowth;
    u16 price;
    boxMon = DayCareMon_GetBoxMon(daycareMon);
    levelGrowth = DayCareMon_CalcLevelGrowth(daycareMon);
    BufferBoxMonNickname(msgFmt, 0, boxMon);
    price = (levelGrowth + 1) * 100;
    BufferIntegerAsString(msgFmt, 1, price, 5, STRCONVMODE_LEFT_ALIGN, TRUE);
    return price;
}

u16 Sav2_DayCare_BufferMonNickAndRetrievalPrice(DAYCARE *dayCare, u8 slot, MessageFormat *msgFmt) {
    return DayCareMon_BufferNickAndRetrievalPrice(Sav2_DayCare_GetMonX(dayCare, slot), msgFmt);
}

u8 Sav2_DayCare_BufferGrowthAndNick(DAYCARE *dayCare, u32 slot, MessageFormat *msgFmt) {
    DAYCAREMON *daycareMon;

    daycareMon = Sav2_DayCare_GetMonX(dayCare, slot);
    if (GetBoxMonData(DayCareMon_GetBoxMon(daycareMon), MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
        return DayCareMon_BufferLevelGrowthAndNick(daycareMon, msgFmt);
    } else {
        return 0;
    }
}

static void Daycare_GetBothBoxMonsPtr(DAYCARE *dayCare, BoxPokemon **boxmons) {
    boxmons[0] = Daycare_GetBoxMonI(dayCare, 0);
    boxmons[1] = Daycare_GetBoxMonI(dayCare, 1);
}

static int Daycare_EverstoneCheck(DAYCARE *dayCare) {
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

static void GenerateEggPID(DAYCARE *dayCare) {
    u32 pid;
    int everstone_num;
    int nature;
    int i = 0;

    everstone_num = Daycare_EverstoneCheck(dayCare);
    if (everstone_num < 0) {
        Sav2_DayCare_SetEggPID(dayCare, MTRandom());
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
        Sav2_DayCare_SetEggPID(dayCare, pid);
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

static void InheritIVs(Pokemon *egg, DAYCARE *dayCare) {
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
    if (DayCare_TryGetForcedInheritedIV(dayCare, &sp5, &sp4)) {
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

    kowaza_list = GfGfxLoader_LoadFromNarc(NARC_fielddata_sodateya_kowaza_list, 0, FALSE, 4, TRUE);

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
    u16 egg_forme;
    u16 i, j;
    u16 move;
    u16 r5;
    struct EggMoveSearch *search;

    search = AllocFromHeap(4, sizeof(struct EggMoveSearch));
    sp1C = 0;
    MI_CpuClearFast(search, sizeof(struct EggMoveSearch));

    egg_species = GetMonData(egg, MON_DATA_SPECIES, NULL);
    egg_forme = GetMonData(egg, MON_DATA_FORME, NULL);
    learnset_size = Species_LoadLearnsetTable(egg_species, egg_forme, search->baby_learnset);
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
                    if (GetTMHMCompatBySpeciesAndForme(egg_species, egg_forme, j)) {
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

void Sav2_DayCare_ResetEggStats(DAYCARE *dayCare) {
    Sav2_DayCare_SetEggPID(dayCare, 0);
    Sav2_DayCare_SetEggCycleCounter(dayCare, 0);
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

static u16 Daycare_BreedingIncenseCheck(u16 species, DAYCARE *dayCare) {
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

static void Daycare_LightBallCheck(Pokemon *egg, DAYCARE *dayCare) {
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

static u16 Daycare_GetEggSpecies(DAYCARE *dayCare, u8 *gender_idx) {
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
        if (Sav2_DayCare_GetEggPID(dayCare) & 0x8000) {
            pms = SPECIES_NIDORAN_M;
        } else {
            pms = SPECIES_NIDORAN_F;
        }
    }
    if (pms == SPECIES_ILLUMISE) {
        if (Sav2_DayCare_GetEggPID(dayCare) & 0x8000) {
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

void SetEggStats(Pokemon *mon, int species, u8 metLocation, PLAYERPROFILE *profile, int a4, int a5) {
    u32 otId;
    u32 gender;
    u16 pokeball;
    u8 metLevel;
    u8 isEgg;
    u8 friendship;
    STRING *name;

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
    name = GetSpeciesName(SPECIES_EGG, 4);
    SetMonData(mon, MON_DATA_NICKNAME_3, name);
    String_dtor(name);
    if (a4 == 4) {
        otId = PlayerProfile_GetTrainerID(profile);
        gender = PlayerProfile_GetTrainerGender(profile);
        name = PlayerProfile_GetPlayerName_NewString(profile, 32);
        SetMonData(mon, MON_DATA_OT_NAME_2, name);
        SetMonData(mon, MON_DATA_OTID, &otId);
        SetMonData(mon, MON_DATA_MET_GENDER, &gender);
        String_dtor(name);
    }
    MonSetTrainerMemo(mon, profile, a4, a5, 0);
}

static void SetBreedEggStats(Pokemon *mon, u16 species, DAYCARE *dayCare, u32 otId, u8 forme) {
    u16 pokeball;
    u8 metLevel;
    u8 friendship;
    STRING *name;
    u32 pid;
    int i;

    friendship = GetMonBaseStat(species, BASE_EGG_CYCLES);
    pid = Sav2_DayCare_GetEggPID(dayCare);
    if (Sav2_DayCare_MasudaCheck(dayCare)) {
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
    SetMonData(mon, MON_DATA_FORME, &forme);
    name = GetSpeciesName(SPECIES_EGG, 4);
    SetMonData(mon, MON_DATA_NICKNAME_3, name);
    String_dtor(name);
}

void GiveEggToPlayer(DAYCARE *dayCare, PARTY *party, PLAYERPROFILE* profile) {
    Pokemon *mon;
    u16 species;
    u8 gender_idx[2];
    u8 isEgg;
    u32 otId;
    u8 mom_forme;

    mon = AllocMonZeroed(4);
    species = Daycare_GetEggSpecies(dayCare, gender_idx);
    species = Daycare_BreedingIncenseCheck(species, dayCare);
    otId = PlayerProfile_GetTrainerID(profile);
    mom_forme = GetBoxMonData(Daycare_GetBoxMonI(dayCare, gender_idx[0]), MON_DATA_FORME, NULL);
    SetBreedEggStats(mon, species, dayCare, otId, mom_forme);
    InheritIVs(mon, dayCare);
    InheritMoves(mon, Daycare_GetBoxMonI(dayCare, gender_idx[1]), Daycare_GetBoxMonI(dayCare, gender_idx[0]));
    MonSetTrainerMemo(mon, profile, 3, sub_02017FE4(1, 0), 4);
    if (species == SPECIES_PICHU) {
        Daycare_LightBallCheck(mon, dayCare);
    }
    isEgg = TRUE;
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);
    AddMonToParty(party, mon);
    Sav2_DayCare_ResetEggStats(dayCare);
    FreeToHeap(mon);
}

static u8 GetEggCyclesToSubtract(PARTY *party) {
    int party_n;
    u8 i;
    u8 ability;

    party_n = GetPartyCount(party);
    for (i = 0; i < party_n; i++) {
        if (!GetMonData(GetPartyMonByIndex(party, i), MON_DATA_SANITY_IS_EGG, NULL)) {
            ability = GetMonData(GetPartyMonByIndex(party, i), MON_DATA_ABILITY, NULL);
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

static u8 Sav2_DayCare_CalcCompatibilityInternal(DAYCARE *dayCare) {
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

static u8 sub_0206CCD8(FieldSystem *fsys) {
    int day, i;

    day = Field_GetDay(fsys) + Field_GetMonth(fsys) * 100;
    if (sub_02055670(fsys)) {
        return 255;
    }
    for (i = 0; i < NELEMS(_020FF490); i++) {
        if (day == _020FF490[i]) {
            return 230;
        }
    }
    return 255;
}

BOOL HandleDayCareStep(DAYCARE *dayCare, PARTY *party, FieldSystem *fsys) {
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
            DayCareMon_AddSteps(Sav2_DayCare_GetMonX(dayCare, i), 1);
            n++;
        }
    }
    if (!Sav2_DayCare_HasEgg(dayCare) && n == 2) {
        steps = DayCareMon_GetSteps(Sav2_DayCare_GetMonX(dayCare, 1));
        if (steps == 255) {
            compat = Sav2_DayCare_CalcCompatibilityInternal(dayCare);
            if (compat > (LCRandom() * 100u / 0xFFFFu)) {
                GenerateEggPID(dayCare);
                sub_0209316C(fsys);
            }
        }
    }
    cycle_ctr = Sav2_DayCare_GetEggCycleCounter(dayCare);
    Sav2_DayCare_SetEggCycleCounter(dayCare, cycle_ctr + 1);
    if (cycle_ctr + 1 == sub_0206CCD8(fsys)) {
        Sav2_DayCare_SetEggCycleCounter(dayCare, 0);
        to_sub = GetEggCyclesToSubtract(party);
        for (i = 0; i < GetPartyCount(party); i++) {
            mon = GetPartyMonByIndex(party, i);
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

Pokemon *sub_0206CE44(PARTY *party) {
    int i, n;
    Pokemon *mon;

    n = GetPartyCount(party);
    for (i = 0; i < n; i++) {
        mon = GetPartyMonByIndex(party, i);
        if (!GetMonData(mon, MON_DATA_CHECKSUM_FAILED, NULL) && GetMonData(mon, MON_DATA_IS_EGG, NULL) &&
            GetMonData(mon, MON_DATA_FRIENDSHIP, NULL) == 0) {
            return mon;
        }
    }
    return NULL;
}

void Sav2_DayCare_BufferStoredMonNicks(DAYCARE *dayCare, MessageFormat *msgFmt) {
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

void Sav2_DayCare_BufferMonStats(DAYCARE *dayCare, u32 nickname_idx, u32 level_idx, u32 gender_idx, u8 slot, MessageFormat *msgFmt) {
    DAYCAREMON *daycareMon;
    BoxPokemon *boxMon;
    u8 level;
    u8 gender;
    u16 species;

    daycareMon = Sav2_DayCare_GetMonX(dayCare, slot);
    boxMon = Daycare_GetBoxMonI(dayCare, slot);
    BufferBoxMonNickname(msgFmt, nickname_idx, boxMon);

    level = GetDayCareUpdatedLevel(boxMon, DayCareMon_GetSteps(daycareMon));
    BufferIntegerAsString(msgFmt, level_idx, level, 3, STRCONVMODE_LEFT_ALIGN, TRUE);

    gender = GetBoxMonData(boxMon, MON_DATA_GENDER, NULL);
    if (gender != MON_GENDERLESS) {
        species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
        if ((species == SPECIES_NIDORAN_F || species == SPECIES_NIDORAN_M) && !GetBoxMonData(boxMon, MON_DATA_HAS_NICKNAME, NULL)) {
            gender = MON_GENDERLESS;
        }
    }
    BufferGenderSymbol(msgFmt, gender_idx, gender);
}

u16 Sav2_DayCare_BufferTailMonNick(DAYCARE *dayCare, MessageFormat *msgFmt) {
    BoxPokemon *boxMon1;
    BoxPokemon *boxMon2;
    u16 species1;
    u16 species2;

    boxMon1 = DayCareMon_GetBoxMon(Sav2_DayCare_GetMonX(dayCare, 0));
    boxMon2 = DayCareMon_GetBoxMon(Sav2_DayCare_GetMonX(dayCare, 1));
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

u8 Sav2_DayCare_GetState(DAYCARE *dayCare) {
    u8 count;
    if (Sav2_DayCare_HasEgg(dayCare)) {
        return 1;
    }
    count = Sav2_DayCare_CountMonsInDayCare(dayCare);
    if (count != 0) {
        return count + 2 - 1;
    }
    return 0;
}

static u8 ConvertDayCareCompatibilityScore(u32 compatibility) {
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

u8 Sav2_DayCare_CalcCompatibility(DAYCARE *dayCare) {
    return ConvertDayCareCompatibilityScore(Sav2_DayCare_CalcCompatibilityInternal(dayCare));
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
    u8 forme;
    u8 otGender;
    u8 metYear;
    u8 metMonth;
    u8 metDay;
    u32 species;
    STRING *string;
    u8 i;
    u32 pid;
    Pokemon *tmpMon;

    string = String_ctor(PLAYER_NAME_LENGTH + 1, heapId);
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
    forme = GetMonData(mon, MON_DATA_FORME, NULL);
    if (species == SPECIES_MANAPHY && GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == sub_02017FE4(2, 1)) {
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
    SetMonData(tmpMon, MON_DATA_FORME, &forme);
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
    String_dtor(string);
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
    GetSpeciesNameIntoArray(GetMonData(mon, MON_DATA_SPECIES, NULL), 0, nickname);
    SetMonData(mon, MON_DATA_NICKNAME, nickname);
    SetMonData(mon, MON_DATA_HAS_NICKNAME, &hasNickname);
    SetMonData(mon, MON_DATA_POKEBALL, &pokeball);
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);
    CalcMonLevelAndStats(mon);
}

static BOOL DayCare_TryGetForcedInheritedIV(DAYCARE *dayCare, u8 *a1, u8 *a2) {
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
