#include "party.h"
#include "unk_0202ECC0.h"
#include "unk_0206979C.h"
#include "unk_02090C94.h"
#include "script_pokemon_util.h"
#include "constants/items.h"

static BOOL MonNotFaintedOrEgg(POKEMON *pokemon) {
    if (GetMonData(pokemon, MON_DATA_HP, NULL) == 0) {
        return FALSE;
    }
    return !GetMonData(pokemon, MON_DATA_IS_EGG, NULL);
}

BOOL GiveMon(HeapID heapId, SAVEDATA *saveData, int species, int level, int forme, u8 ability, u16 heldItem, int ball, int encounterType) {
    PARTY *party;
    POKEMON *pokemon;
    PLAYERPROFILE *profile;
    u32 sp1C;
    BOOL result;

    profile = Sav2_PlayerData_GetProfileAddr(saveData);
    party = SavArray_PlayerParty_get(saveData);
    {
        pokemon = AllocMonZeroed(heapId);
        ZeroMonData(pokemon);
        CreateMon(pokemon, species, level, 32, FALSE, 0, 0, 0);
        sub_020720FC(pokemon, profile, ITEM_POKE_BALL, ball, encounterType, heapId);
        sp1C = heldItem;
        SetMonData(pokemon, MON_DATA_HELD_ITEM, &sp1C);
        SetMonData(pokemon, MON_DATA_FORME, &forme);
        if (ability != 0) {
            SetMonData(pokemon, MON_DATA_ABILITY, &ability);
        }
        result = AddMonToParty(party, pokemon);
        if (result) {
            UpdatePokedexWithReceivedSpecies(saveData, pokemon);
        }
        FreeToHeap(pokemon);
    }
    return result;
}

BOOL GiveEgg(HeapID heapId, SAVEDATA *saveData, int a2, int a3, MapsecType sp20, int sp24) {
#pragma unused(heapId)
    PLAYERPROFILE *profile;
    PARTY *party;
    POKEMON *pokemon;
    BOOL result;

    profile = Sav2_PlayerData_GetProfileAddr(saveData);
    party = SavArray_PlayerParty_get(saveData);
    pokemon = AllocMonZeroed(32);
    ZeroMonData(pokemon);
    SetEggStats(pokemon, a2, a3, profile, 4, sub_02017FE4(sp20, sp24));
    result = AddMonToParty(party, pokemon);
    FreeToHeap(pokemon);
    return result;
}

void PartyMonSetMoveInSlot(PARTY *party, int mon_slot, int move_slot, u16 moveId) {
    MonSetMoveInSlot_ResetPpUp(GetPartyMonByIndex(party, mon_slot), moveId, move_slot);
}

int GetIdxOfFirstPartyMonWithMove(PARTY *party, u16 move) {
    int i;
    int n;
    POKEMON *pokemon;

    n = GetPartyCount(party);
    for (i = 0; i < n; i++) {
        pokemon = GetPartyMonByIndex(party, i);
        if (GetMonData(pokemon, MON_DATA_IS_EGG, NULL)) {
            continue;
        }
        if (GetMonData(pokemon, MON_DATA_MOVE1, NULL) == move
         || GetMonData(pokemon, MON_DATA_MOVE2, NULL) == move
         || GetMonData(pokemon, MON_DATA_MOVE3, NULL) == move
         || GetMonData(pokemon, MON_DATA_MOVE4, NULL) == move) {
            return i;
        }
    }
    return 0xFF;
}

int CountAlivePokemon(PARTY *party) {
    int i;
    int n;
    int c;
    POKEMON *pokemon;

    n = GetPartyCount(party);
    c = 0;
    for (i = 0; i < n; i++) {
        pokemon = GetPartyMonByIndex(party, i);
        if (MonNotFaintedOrEgg(pokemon)) {
            c++;
        }
    }
    return c;
}

POKEMON *GetFirstAliveMonInParty_CrashIfNone(PARTY *party) {
    int i;
    int n;
    POKEMON *pokemon;

    n = GetPartyCount(party);
    for (i = 0; i < n; i++) {
        pokemon = GetPartyMonByIndex(party, i);
        if (MonNotFaintedOrEgg(pokemon)) {
            return pokemon;
        }
    }
    GF_ASSERT(0);
    return NULL;
}

u8 GetIdxOfFirstAliveMonInParty_CrashIfNone(PARTY *party) {
    int i;
    int n;
    POKEMON *pokemon;

    n = GetPartyCount(party);
    for (i = 0; i < n; i++) {
        pokemon = GetPartyMonByIndex(party, i);
        if (MonNotFaintedOrEgg(pokemon)) {
            return i;
        }
    }
    GF_ASSERT(0);
    return 0;
}

POKEMON *GetFirstNonEggInParty(PARTY *party) {
    u16 i;
    u16 n;
    POKEMON *pokemon;

    n = GetPartyCount(party);
    for (i = 0; i < n; i++) {
        pokemon = GetPartyMonByIndex(party, i);
        if (!GetMonData(pokemon, MON_DATA_IS_EGG, NULL)) {
            return pokemon;
        }
    }
    return NULL;
}

BOOL HasEnoughAlivePokemonForDoubleBattle(PARTY *party) {
    return CountAlivePokemon(party) >= 2;
}

BOOL ApplyPoisonStep(PARTY *party, u16 location) {
    int n;
    int i;
    int n_poisoned;
    int n_fainted;
    u32 hp;
    POKEMON *pokemon;

    n_poisoned = 0;
    n_fainted = 0;
    n = GetPartyCount(party);
    for (i = 0; i < n; i++) {
        pokemon = GetPartyMonByIndex(party, i);
        if (!MonNotFaintedOrEgg(pokemon)) {
            continue;
        }
        if (!(GetMonData(pokemon, MON_DATA_STATUS, NULL) & (STATUS_POISON_ANY))) {
            continue;
        }
        hp = GetMonData(pokemon, MON_DATA_HP, NULL);
        if (hp > 1) {
            hp--;
        }
        SetMonData(pokemon, MON_DATA_HP, &hp);
        if (hp == 1) {
            n_fainted++;
            MonApplyFriendshipMod(pokemon, FRIENDSHIP_EVENT_HEAL_FIELD_PSN, location);
            ApplyMonMoodModifier(pokemon, 5);
        }
        n_poisoned++;
    }
    if (n_fainted != 0) {
        return 2;
    } else if (n_poisoned != 0) {
        return 1;
    } else {
        return 0;
    }
}

BOOL SurvivePoisoning(POKEMON *pokemon) {
    u32 status;
    if ((GetMonData(pokemon, MON_DATA_STATUS, NULL) & STATUS_POISON_ANY) && GetMonData(pokemon, MON_DATA_HP, NULL) == 1) {
        status = 0;
        SetMonData(pokemon, MON_DATA_STATUS, &status);
        return TRUE;
    } else {
        return FALSE;
    }
}
