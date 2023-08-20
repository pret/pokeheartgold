#include "global.h"
#include "party.h"
#include "update_dex_received.h"
#include "unk_0206979C.h"
#include "pokemon_mood.h"
#include "script_pokemon_util.h"
#include "constants/items.h"
#include "constants/battle.h"

static BOOL MonNotFaintedOrEgg(Pokemon *mon) {
    if (GetMonData(mon, MON_DATA_HP, NULL) == 0) {
        return FALSE;
    }
    return !GetMonData(mon, MON_DATA_IS_EGG, NULL);
}

BOOL GiveMon(HeapID heapId, SaveData *saveData, int species, int level, int form, u8 ability, u16 heldItem, int ball, int encounterType) {
    Party *party;
    Pokemon *mon;
    PlayerProfile *profile;
    u32 sp1C;
    BOOL result;

    profile = Save_PlayerData_GetProfileAddr(saveData);
    party = SaveArray_Party_Get(saveData);
    {
        mon = AllocMonZeroed(heapId);
        ZeroMonData(mon);
        CreateMon(mon, species, level, 32, FALSE, 0, 0, 0);
        sub_020720FC(mon, profile, ITEM_POKE_BALL, ball, encounterType, heapId);
        sp1C = heldItem;
        SetMonData(mon, MON_DATA_HELD_ITEM, &sp1C);
        SetMonData(mon, MON_DATA_FORM, &form);
        if (ability != 0) {
            SetMonData(mon, MON_DATA_ABILITY, &ability);
        }
        result = Party_AddMon(party, mon);
        if (result) {
            UpdatePokedexWithReceivedSpecies(saveData, mon);
        }
        FreeToHeap(mon);
    }
    return result;
}

BOOL GiveEgg(HeapID heapId, SaveData *saveData, int species, u8 metLocation, MapsecType sp20, int sp24) {
#pragma unused(heapId)
    PlayerProfile *profile;
    Party *party;
    Pokemon *mon;
    BOOL result;

    profile = Save_PlayerData_GetProfileAddr(saveData);
    party = SaveArray_Party_Get(saveData);
    mon = AllocMonZeroed(HEAP_ID_32);
    ZeroMonData(mon);
    SetEggStats(mon, species, metLocation, profile, 4, sub_02017FE4(sp20, sp24));
    result = Party_AddMon(party, mon);
    FreeToHeap(mon);
    return result;
}

void PartyMonSetMoveInSlot(Party *party, int mon_slot, int move_slot, u16 moveId) {
    MonSetMoveInSlot_ResetPpUp(Party_GetMonByIndex(party, mon_slot), moveId, move_slot);
}

int GetIdxOfFirstPartyMonWithMove(Party *party, u16 move) {
    int i;
    int n;
    Pokemon *mon;

    n = Party_GetCount(party);
    for (i = 0; i < n; i++) {
        mon = Party_GetMonByIndex(party, i);
        if (GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
            continue;
        }
        if (GetMonData(mon, MON_DATA_MOVE1, NULL) == move
         || GetMonData(mon, MON_DATA_MOVE2, NULL) == move
         || GetMonData(mon, MON_DATA_MOVE3, NULL) == move
         || GetMonData(mon, MON_DATA_MOVE4, NULL) == move) {
            return i;
        }
    }
    return 0xFF;
}

int CountAlivePokemon(Party *party) {
    int i;
    int n;
    int c;
    Pokemon *mon;

    n = Party_GetCount(party);
    c = 0;
    for (i = 0; i < n; i++) {
        mon = Party_GetMonByIndex(party, i);
        if (MonNotFaintedOrEgg(mon)) {
            c++;
        }
    }
    return c;
}

Pokemon *GetFirstAliveMonInParty_CrashIfNone(Party *party) {
    int i;
    int n;
    Pokemon *mon;

    n = Party_GetCount(party);
    for (i = 0; i < n; i++) {
        mon = Party_GetMonByIndex(party, i);
        if (MonNotFaintedOrEgg(mon)) {
            return mon;
        }
    }
    GF_ASSERT(0);
    return NULL;
}

u8 GetIdxOfFirstAliveMonInParty_CrashIfNone(Party *party) {
    int i;
    int n;
    Pokemon *mon;

    n = Party_GetCount(party);
    for (i = 0; i < n; i++) {
        mon = Party_GetMonByIndex(party, i);
        if (MonNotFaintedOrEgg(mon)) {
            return i;
        }
    }
    GF_ASSERT(0);
    return 0;
}

Pokemon *GetFirstNonEggInParty(Party *party) {
    u16 i;
    u16 n;
    Pokemon *mon;

    n = Party_GetCount(party);
    for (i = 0; i < n; i++) {
        mon = Party_GetMonByIndex(party, i);
        if (!GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
            return mon;
        }
    }
    return NULL;
}

BOOL HasEnoughAlivePokemonForDoubleBattle(Party *party) {
    return CountAlivePokemon(party) >= 2;
}

BOOL ApplyPoisonStep(Party *party, u16 location) {
    int n;
    int i;
    int n_poisoned;
    int n_fainted;
    u32 hp;
    Pokemon *mon;

    n_poisoned = 0;
    n_fainted = 0;
    n = Party_GetCount(party);
    for (i = 0; i < n; i++) {
        mon = Party_GetMonByIndex(party, i);
        if (!MonNotFaintedOrEgg(mon)) {
            continue;
        }
        if (!(GetMonData(mon, MON_DATA_STATUS, NULL) & ((STATUS_POISON | STATUS_BAD_POISON)))) {
            continue;
        }
        hp = GetMonData(mon, MON_DATA_HP, NULL);
        if (hp > 1) {
            hp--;
        }
        SetMonData(mon, MON_DATA_HP, &hp);
        if (hp == 1) {
            n_fainted++;
            MonApplyFriendshipMod(mon, FRIENDSHIP_EVENT_HEAL_FIELD_PSN, location);
            ApplyMonMoodModifier(mon, 5);
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

BOOL SurvivePoisoning(Pokemon *mon) {
    u32 status;
    if ((GetMonData(mon, MON_DATA_STATUS, NULL) & (STATUS_POISON | STATUS_BAD_POISON)) && GetMonData(mon, MON_DATA_HP, NULL) == 1) {
        status = 0;
        SetMonData(mon, MON_DATA_STATUS, &status);
        return TRUE;
    } else {
        return FALSE;
    }
}
