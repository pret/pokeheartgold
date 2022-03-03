#include "get_egg.h"
#include "party.h"
#include "game_stats.h"
#include "math_util.h"
#include "gf_gfx_loader.h"
#include "item.h"
#include "msgdata.h"
#include "unk_0208E600.h"
#include "constants/moves.h"
#include "constants/items.h"
#include "constants/balls.h"
#include "constants/map_sections.h"

BOOL _IVList_Sample(DAYCARE *dayCare, u8 *a1, u8 *a2);

BOXMON *Daycare_GetBoxMonI(DAYCARE *daycare, int idx) {
    return DayCareMon_GetBoxMon(Sav2_DayCare_GetMonX(daycare, idx));
}

u8 Sav2_DayCare_CountMonsInDayCare(DAYCARE *daycare) {
    u8 ct, i;

    ct = 0;

    for (i = 0; i < 2; i++) {
        if (GetBoxMonData(DayCareMon_GetBoxMon(Sav2_DayCare_GetMonX(daycare, i)), MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
            ct++;
        }
    }

    return ct;
}

int Sav2_DayCare_GetAvailableSlot(DAYCARE *daycare) {
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

void DayCareMon_CopyFromPartySlot(PARTY *party, int partyIdx, DAYCAREMON *daycareMon, SAVEDATA *saveData) {
    u16 nickname[POKEMON_NAME_LENGTH + 1];
    u8 mood;
    DAYCAREMAIL *daycareMail;
    BOXMON *boxmon;
    POKEMON *partymon;
    const u16 *playerNamePtr;

    partymon = GetPartyMonByIndex(party, partyIdx);
    daycareMail = DayCareMon_GetExtras(daycareMon);
    boxmon = DayCareMon_GetBoxMon(daycareMon);
    playerNamePtr = PlayerProfile_GetNamePtr(Sav2_PlayerData_GetProfileAddr(saveData));
    GetMonData(partymon, MON_DATA_NICKNAME, nickname);
    if (BoxMonIsHoldingMail(Mon_GetBoxMon(partymon))) {
        GetMonData(partymon, MON_DATA_MAIL_STRUCT, DayCareMail_GetMailPtr(daycareMail));
    }
    mood = 0;
    SetMonData(partymon, MON_DATA_MOOD, &mood);
    CopyPokemonToBoxPokemon(partymon, boxmon);
    BoxMon_UpdateShayminForme(boxmon, SHAYMIN_LAND);
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

void Sav2_DayCare_Compaction(DAYCARE *daycare) {
    DAYCAREMON *mon1;
    DAYCAREMON *mon2;
    BOXMON *boxmon1;
    BOXMON *boxmon2;

    mon1 = Sav2_DayCare_GetMonX(daycare, 0);
    mon2 = Sav2_DayCare_GetMonX(daycare, 1);
    boxmon1 = DayCareMon_GetBoxMon(mon1);
    boxmon2 = DayCareMon_GetBoxMon(mon2);

    if (GetBoxMonData(boxmon1, MON_DATA_SPECIES, NULL) == SPECIES_NONE && GetBoxMonData(boxmon2, MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
        DayCareMon_Copy(mon1, mon2);
        DayCareMon_init(mon2);
    }
}

void sub_0206BF60(POKEMON *pokemon) {
    int i;
    int last_i;
    u16 learned;
    int stat;

    for (i = 0, last_i = 0; i < MAX_LEVEL; i++) {
        if (!sub_02070DB4(pokemon)) {
            break;
        }
        last_i = 0;
        for (
            stat = MonTryLearnMoveOnLevelUp(pokemon, &last_i, &learned);
            stat != 0;
            stat = MonTryLearnMoveOnLevelUp(pokemon, &last_i, &learned)
            ) {
            if (stat == WAZA_APPEND_FULL) {
                DeleteMonFirstMoveAndAppend(pokemon, learned);
            }
        }
    }
    CalcMonLevelAndStats(pokemon);
}

int Sav2_DayCare_MoveMonToParty(PARTY *party, DAYCAREMON *daycareMon, MSGFMT *msgFmt) {
    u32 exp;
    POKEMON *pokemon;
    BOXMON *boxmon;
    DAYCAREMAIL *daycareMail;
    u16 species;

    pokemon = AllocMonZeroed(4);
    boxmon = DayCareMon_GetBoxMon(daycareMon);
    daycareMail = DayCareMon_GetExtras(daycareMon);

    BufferBoxMonNickname(msgFmt, 0, boxmon);
    species = GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL);

    CopyBoxPokemonToPokemon(boxmon, pokemon);
    if (GetMonData(pokemon, MON_DATA_LEVEL, NULL) != MAX_LEVEL) {
        exp = GetMonData(pokemon, MON_DATA_EXPERIENCE, NULL);
        exp += DayCareMon_GetSteps(daycareMon);
        SetMonData(pokemon, MON_DATA_EXPERIENCE, &exp);
        sub_0206BF60(pokemon);
    }
    if (BoxMonIsHoldingMail(boxmon)) {
        SetMonData(pokemon, MON_DATA_MAIL_STRUCT, DayCareMail_GetMailPtr(daycareMail));
    }
    AddMonToParty(party, pokemon);
    ZeroBoxMonData(boxmon);
    DayCareMon_SetSteps(daycareMon, 0);
    FreeToHeap(pokemon);
    return species;
}

u16 Sav2_DayCare_RetrieveMon(PARTY *party, MSGFMT *msgFmt, DAYCARE *daycare, u8 whomst) {
    u16 ret;

    ret = Sav2_DayCare_MoveMonToParty(party, Sav2_DayCare_GetMonX(daycare, whomst), msgFmt);
    Sav2_DayCare_Compaction(daycare);
    return ret;
}

u32 GetDayCareUpdatedLevel(BOXMON *boxmon, u32 steps) {
    POKEMON *pokemon_tmp;
    BOXMON *boxmon_tmp;
    u32 exp;
    u32 level;

    pokemon_tmp = AllocMonZeroed(11);
    boxmon_tmp = Mon_GetBoxMon(pokemon_tmp);
    CopyBoxPokemonToBoxPokemon(boxmon, boxmon_tmp);
    exp = GetBoxMonData(boxmon_tmp, MON_DATA_EXPERIENCE, NULL);
    exp += steps;
    SetBoxMonData(boxmon_tmp, MON_DATA_EXPERIENCE, &exp);
    level = CalcBoxMonLevel(boxmon_tmp);
    FreeToHeap(pokemon_tmp);
    return level;
}

int DayCareMon_CalcLevelGrowth(DAYCAREMON *daycareMon) {
    BOXMON *boxmon;
    u8 cur_level;
    u8 new_level;

    boxmon = DayCareMon_GetBoxMon(daycareMon);
    cur_level = CalcBoxMonLevel(boxmon);
    new_level = GetDayCareUpdatedLevel(boxmon, DayCareMon_GetSteps(daycareMon));
    return new_level - cur_level;
}

u8 DayCareMon_BufferLevelGrowthAndNick(DAYCAREMON *daycareMon, MSGFMT *msgFmt) {
    BOXMON *boxmon;
    int levelGrowth;

    boxmon = DayCareMon_GetBoxMon(daycareMon);
    levelGrowth = DayCareMon_CalcLevelGrowth(daycareMon);
    BufferIntegerAsString(msgFmt, 1, levelGrowth, 3, STRCONVMODE_LEFT_ALIGN, TRUE);
    BufferBoxMonNickname(msgFmt, 0, boxmon);
    return levelGrowth;
}

u16 DayCareMon_BufferNickAndRetrievalPrice(DAYCAREMON *daycareMon, MSGFMT *msgFmt) {
    BOXMON *boxmon;
    u16 levelGrowth;
    u16 price;
    boxmon = DayCareMon_GetBoxMon(daycareMon);
    levelGrowth = DayCareMon_CalcLevelGrowth(daycareMon);
    BufferBoxMonNickname(msgFmt, 0, boxmon);
    price = (levelGrowth + 1) * 100;
    BufferIntegerAsString(msgFmt, 1, price, 5, STRCONVMODE_LEFT_ALIGN, TRUE);
    return price;
}

u16 Sav2_DayCare_BufferMonNickAndRetrievalPrice(DAYCARE *dayCare, u8 slot, MSGFMT *msgFmt) {
    return DayCareMon_BufferNickAndRetrievalPrice(Sav2_DayCare_GetMonX(dayCare, slot), msgFmt);
}

u8 Sav2_DayCare_BufferGrowthAndNick(DAYCARE *dayCare, u32 slot, MSGFMT *msgFmt) {
    DAYCAREMON *daycareMon;

    daycareMon = Sav2_DayCare_GetMonX(dayCare, slot);
    if (GetBoxMonData(DayCareMon_GetBoxMon(daycareMon), MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
        return DayCareMon_BufferLevelGrowthAndNick(daycareMon, msgFmt);
    } else {
        return 0;
    }
}

void Daycare_GetBothBoxMonsPtr(DAYCARE *dayCare, BOXMON **boxmons) {
    boxmons[0] = Daycare_GetBoxMonI(dayCare, 0);
    boxmons[1] = Daycare_GetBoxMonI(dayCare, 1);
}

int sub_0206C1E4(DAYCARE *dayCare) {
    BOXMON *boxmons[2];
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

void sub_0206C274(DAYCARE *dayCare) {
    u32 pid;
    int everstone_num;
    int nature;
    int i = 0;

    everstone_num = sub_0206C1E4(dayCare);
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

void _IVList_Remove(u8 *ptr, int idx) {
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

void InheritIVs(POKEMON *egg, DAYCARE *dayCare) {
    u8 sp10[3];
    u8 spA[6];
    u8 sp7[3];
    u8 sp6;
    u8 sp5;
    u8 sp4;
    u8 i;
    u8 r6;
    u8 j;
    BOXMON *boxmon;

    for (i = 0; i < 6; i++) {
        spA[i] = i;
    }
    if (_IVList_Sample(dayCare, &sp5, &sp4)) {
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
        boxmon = Daycare_GetBoxMonI(dayCare, sp7[i]);
        switch (sp10[i]) {
        case 0:
            sp6 = GetBoxMonData(boxmon, MON_DATA_HP_IV, NULL);
            SetMonData(egg, MON_DATA_HP_IV, &sp6);
            break;
        case 1:
            sp6 = GetBoxMonData(boxmon, MON_DATA_ATK_IV, NULL);
            SetMonData(egg, MON_DATA_ATK_IV, &sp6);
            break;
        case 2:
            sp6 = GetBoxMonData(boxmon, MON_DATA_DEF_IV, NULL);
            SetMonData(egg, MON_DATA_DEF_IV, &sp6);
            break;
        case 3:
            sp6 = GetBoxMonData(boxmon, MON_DATA_SPEED_IV, NULL);
            SetMonData(egg, MON_DATA_SPEED_IV, &sp6);
            break;
        case 4:
            sp6 = GetBoxMonData(boxmon, MON_DATA_SPATK_IV, NULL);
            SetMonData(egg, MON_DATA_SPATK_IV, &sp6);
            break;
        case 5:
            sp6 = GetBoxMonData(boxmon, MON_DATA_SPDEF_IV, NULL);
            SetMonData(egg, MON_DATA_SPDEF_IV, &sp6);
            break;
        }
    }
}

u8 sub_0206C488(POKEMON *pokemon, u16 *a1) {
    u16 r4;
    u16 *r5;
    u16 r7;
    u16 species;
    u16 i;

    r5 = GfGfxLoader_LoadFromNarc(NARC_a_2_2_9, 0, FALSE, 4, TRUE);

    r4 = 0;
    r7 = 0;

    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    for (i = 0; i < 0x7FD; i++) {
        if (species + 20000 == r5[i]) {
            r7 = i + 1;
            break;
        }
    }
    for (i = 0; i < 16; i++) {
        if (r5[r7 + i] > 20000) {
            break;
        }
        a1[i] = r5[r7 + i];
        r4++;
    }
    FreeToHeap(r5);
    return r4;
}

struct EggMoveSearch {
    int dad_moves[MON_MOVES];
    int shared_moves[MON_MOVES];
    int mom_moves[MON_MOVES];
    u16 baby_learnset[50];
    u16 baby_egg_moves[16];
};

void InheritMoves(POKEMON *egg, BOXMON *dad, BOXMON *mom) {
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
    for (i = 0; i < MON_MOVES; i++) {
        search->dad_moves[i] = GetBoxMonData(dad, MON_DATA_MOVE1 + i, NULL);
        search->mom_moves[i] = GetBoxMonData(mom, MON_DATA_MOVE1 + i, NULL);
    }
    r5 = sub_0206C488(egg, search->baby_egg_moves);
    for (i = 0; i < MON_MOVES; i++) {
        if (search->dad_moves[i] != MOVE_NONE) {
            for (j = 0; j < r5; j++) {
                if (search->dad_moves[i] == search->baby_egg_moves[j]) {
                    if (TryAppendMonMove(egg, search->dad_moves[i]) == WAZA_APPEND_FULL) {
                        DeleteMonFirstMoveAndAppend(egg, search->dad_moves[i]);
                    }
                    break;
                }
            }
        } else {
            break;
        }
    }
    for (i = 0; i < MON_MOVES; i++) {
        if (search->dad_moves[i] != MOVE_NONE) {
            for (j = 0; j < 100; j++) {
                if (search->dad_moves[i] == TMHMGetMove(j + ITEM_TM01)) {
                    if (GetTMHMCompatBySpeciesAndForme(egg_species, egg_forme, j)) {
                        if (TryAppendMonMove(egg, search->dad_moves[i]) == WAZA_APPEND_FULL) {
                            DeleteMonFirstMoveAndAppend(egg, search->dad_moves[i]);
                        }
                    }
                }
            }
        }
    }
    for (i = 0; i < MON_MOVES; i++) {
        if (search->dad_moves[i] == MOVE_NONE) {
            break;
        }
        for (j = 0; j < MON_MOVES; j++) {
            if (search->dad_moves[i] == search->mom_moves[j] && search->dad_moves[i] != MOVE_NONE) {
                search->shared_moves[sp1C++] = search->dad_moves[i];
            }
        }
    }
    for (i = 0; i < MON_MOVES; i++) {
        if (search->shared_moves[i] == MOVE_NONE) {
            break;
        }
        for (j = 0; j < learnset_size; j++) {
            if (search->baby_learnset[j] != MOVE_NONE) {
                if (search->shared_moves[i] == search->baby_learnset[j]) {
                    if (TryAppendMonMove(egg, search->shared_moves[i]) == WAZA_APPEND_FULL) {
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

extern const u16 _020FF4AE[9][3];

u16 Daycare_BreedingIncenseCheck(u16 species, DAYCARE *dayCare) {
    BOXMON *parents[2];
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

void Daycare_LightBallCheck(POKEMON *egg, DAYCARE *dayCare) {
    BOXMON *parents[2];
    int item1, item2;

    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    item1 = GetBoxMonData(parents[0], MON_DATA_HELD_ITEM, NULL);
    item2 = GetBoxMonData(parents[1], MON_DATA_HELD_ITEM, NULL);

    if (item1 == ITEM_LIGHT_BALL || item2 == ITEM_LIGHT_BALL) {
        if (TryAppendMonMove(egg, MOVE_VOLT_TACKLE) == WAZA_APPEND_FULL) {
            DeleteMonFirstMoveAndAppend(egg, MOVE_VOLT_TACKLE);
        }
    }
}

u16 Daycare_GetEggSpecies(DAYCARE *dayCare, u8 *gender_idx) {
    u16 parent_species[2];
    u16 i;
    u16 mom;
    u16 pms;
    u16 swp;
    BOXMON *parents[2];

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
    mom = parent_species[gender_idx[0]];
    pms = ReadFromPersonalPmsNarc(mom);
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

void SetEggStats(POKEMON *pokemon, int species, u8 metLocation, PLAYERPROFILE *profile, int a4, int a5) {
    u32 otId;
    u32 gender;
    u16 pokeball;
    u8 metLevel;
    u8 isEgg;
    u8 friendship;
    STRING *name;

    friendship = GetMonBaseStat(species, BASE_EGG_CYCLES);
    CreateMon(pokemon, species, 1, 32, FALSE, 0, OT_ID_PLAYER_ID, 0);

    metLevel = 0;
    pokeball = BALL_POKE;

    SetMonData(pokemon, MON_DATA_POKEBALL, &pokeball);
    SetMonData(pokemon, MON_DATA_FRIENDSHIP, &friendship);
    SetMonData(pokemon, MON_DATA_MET_LEVEL, &metLevel);

    if (metLocation != MAPSEC_MYSTERY_ZONE) {
        SetMonData(pokemon, MON_DATA_EGG_MET_LOCATION, &metLocation);
    }
    isEgg = TRUE;
    SetMonData(pokemon, MON_DATA_IS_EGG, &isEgg);
    name = GetSpeciesName(SPECIES_EGG, 4);
    SetMonData(pokemon, MON_DATA_NICKNAME_3, name);
    String_dtor(name);
    if (a4 == 4) {
        otId = PlayerProfile_GetTrainerID(profile);
        gender = PlayerProfile_GetTrainerGender(profile);
        name = PlayerProfile_GetPlayerName_NewString(profile, 32);
        SetMonData(pokemon, MON_DATA_OT_NAME_2, name);
        SetMonData(pokemon, MON_DATA_OTID, &otId);
        SetMonData(pokemon, MON_DATA_MET_GENDER, &gender);
        String_dtor(name);
    }
    MonSetTrainerMemo(pokemon, profile, a4, a5, 0);
}

void SetBreedEggStats(POKEMON *pokemon, u16 species, DAYCARE *dayCare, u32 otId, int forme) {
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
    CreateMon(pokemon, species, 1, 32, TRUE, pid, OT_ID_PLAYER_ID, 0);

    metLevel = 0;
    pokeball = BALL_POKE;

    SetMonData(pokemon, MON_DATA_POKEBALL, &pokeball);
    SetMonData(pokemon, MON_DATA_FRIENDSHIP, &friendship);
    SetMonData(pokemon, MON_DATA_MET_LEVEL, &metLevel);
    SetMonData(pokemon, MON_DATA_FORME, &forme);
    name = GetSpeciesName(SPECIES_EGG, 4);
    SetMonData(pokemon, MON_DATA_NICKNAME_3, name);
    String_dtor(name);
}
