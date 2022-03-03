#include "get_egg.h"
#include "party.h"
#include "game_stats.h"
#include "constants/moves.h"

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
