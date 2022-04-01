#include "scrcmd.h"
#include "map_header.h"
#include "pokedex.h"
#include "script_pokemon_util.h"
#include "player_data.h"
#include "get_egg.h"
#include "constants/balls.h"
#include "item.h"
#include "save_arrays.h"
#include "npc_trade.h"

FS_EXTERN_OVERLAY(npc_trade);

BOOL ScrCmd_GiveMon(SCRIPTCONTEXT *ctx) {
    u16 map = MapHeader_GetMapSec(ctx->fsys->location->mapId);
    FieldSystem *fsys = ctx->fsys;
    POKEDEX *pokedex = Sav2_Pokedex_get(fsys->savedata);

    u16 species = ScriptGetVar(ctx);
    u8 level = ScriptGetVar(ctx);
    u16 heldItem = ScriptGetVar(ctx);
    u8 forme = ScriptGetVar(ctx);
    u16 ability = ScriptGetVar(ctx);
    u16 *retPtr = ScriptGetVarPointer(ctx);

    PARTY *party = SavArray_PlayerParty_get(fsys->savedata);
    *retPtr = GiveMon(11, fsys->savedata, species, level, forme, ability, heldItem, map, 24);

    return FALSE;
}

BOOL ScrCmd_TakeMon(SCRIPTCONTEXT *ctx) {
    u8 slot = ScriptGetVar(ctx);
    PARTY *party = SavArray_PlayerParty_get(ctx->fsys->savedata);
    RemoveMonFromParty(party, slot);
    return FALSE;
}

BOOL ScrCmd_GetPartyMonSpecies(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 slot = ScriptGetVar(ctx);
    u16 *species = ScriptGetVarPointer(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) == 0) {
        *species = GetMonData(pokemon, MON_DATA_SPECIES, 0);
    }
    else {
        *species = 0;
    }

    return FALSE;
}

BOOL ScrCmd_PartymonIsMine(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    SAVEDATA *save = Fsys_GetSaveDataPtr(fsys);
    PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(save);

    u16 *slot = ScriptGetVarPointer(ctx);
    u16 *mine = ScriptGetVarPointer(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), *slot);
    u16 pokemonID = GetMonData(pokemon, MON_DATA_OTID, 0);
    u16 playerID = PlayerProfile_GetTrainerID(profile);

    if (pokemonID == playerID) {
        *mine = 0;
    }
    else {
        *mine = 1;
    }

    return FALSE;
}

BOOL ScrCmd_GiveEgg(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(fsys->savedata);

    u16 species = ScriptGetVar(ctx);
    u16 offset = ScriptGetVar(ctx);

    PARTY *party = SavArray_PlayerParty_get(fsys->savedata);
    u8 partyCount = GetPartyCount(party);
    if (partyCount < 6) {
        POKEMON *pokemon = AllocMonZeroed(11);
        ZeroMonData(pokemon);
        int val = sub_02017FE4(MAPSECTYPE_GIFT, offset);
        SetEggStats(pokemon, species, 1, profile, 3, val);
        AddMonToParty(party, pokemon);
        FreeToHeap(pokemon);
    }

    return FALSE;
}

BOOL ScrCmd_SetMonMove(SCRIPTCONTEXT *ctx) {
    u16 monSlot = ScriptGetVar(ctx);
    u16 moveSlot = ScriptGetVar(ctx);
    u16 moveId = ScriptGetVar(ctx);

    PartyMonSetMoveInSlot(SavArray_PlayerParty_get(ctx->fsys->savedata), monSlot, moveSlot, moveId);

    return FALSE;
}

BOOL ScrCmd_MonHasMove(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *hasMove = ScriptGetVarPointer(ctx);
    u16 move = ScriptGetVar(ctx);
    u16 slot = ScriptGetVar(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    *hasMove = 0;
    if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) != 0) {
        return FALSE;   
    }

    if (GetMonData(pokemon, MON_DATA_MOVE1, 0) == move || GetMonData(pokemon, MON_DATA_MOVE2, 0) == move ||
        GetMonData(pokemon, MON_DATA_MOVE3, 0) == move || GetMonData(pokemon, MON_DATA_MOVE4, 0) == move) {
        *hasMove = 1;
    }

    return FALSE;
}

BOOL ScrCmd_GetPartySlotWithMove(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *slot = ScriptGetVarPointer(ctx);
    u16 move = ScriptGetVar(ctx);
    u8 i;

    u8 partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, *slot = 6; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
        if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) != 0) {
            continue;
        }

        if (GetMonData(pokemon, MON_DATA_MOVE1, 0) == move || GetMonData(pokemon, MON_DATA_MOVE2, 0) == move ||
            GetMonData(pokemon, MON_DATA_MOVE3, 0) == move || GetMonData(pokemon, MON_DATA_MOVE4, 0) == move) {
            *slot = i;
            break;
        }
    }

    return FALSE;
}

BOOL ScrCmd_SurvivePoisoning(SCRIPTCONTEXT *ctx) {
    u16 *poison = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), slot);
    *poison = SurvivePoisoning(pokemon);

    return FALSE;
}

BOOL ScrCmd_PartyCountMonsAtOrBelowLevel(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *levelCount = ScriptGetVarPointer(ctx);
    u16 level = ScriptGetVar(ctx);
    u8 i, count;

    u8 partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, count = 0, *levelCount = 0; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
        if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) == 0 && GetMonData(pokemon, MON_DATA_LEVEL, 0) <= level) {
            count++;
        }
    }

    *levelCount = count;
    return FALSE;
}

BOOL ScrCmd_MonGetLevel(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *level = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    *level = 0;
    if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) == 0) {
        *level = GetMonData(pokemon, MON_DATA_LEVEL, 0);
    }

    return FALSE;
}

BOOL ScrCmd_MonGetNature(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *nature = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);

    u8 partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    if (slot >= partyCount) {
        *nature = 0;
        return FALSE;
    }

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) != 0) {
        *nature = 0;
        return FALSE;
    }

    *nature = GetMonNature(pokemon);
    return FALSE;
}

BOOL ScrCmd_GetPartySlotWithNature(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *slot = ScriptGetVarPointer(ctx);
    u16 nature = ScriptGetVar(ctx);
    u8 i;

    u8 partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, *slot = 255; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
        if (GetMonData(pokemon , MON_DATA_IS_EGG, 0) == 0 && GetMonNature(pokemon) == nature) {
            *slot = i;
            break;
        }
    }

    return FALSE;
}

BOOL ScrCmd_MonGetFriendship(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *friendship = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    *friendship = GetMonData(pokemon, MON_DATA_FRIENDSHIP, 0);

    return FALSE;
}

BOOL ScrCmd_MonAddFriendship(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 friendshipModifier = ScriptGetVar(ctx);
    u16 slot = ScriptGetVar(ctx);
    u16 map = MapHeader_GetMapSec(ctx->fsys->location->mapId);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    u16 friendship = GetMonData(pokemon, MON_DATA_FRIENDSHIP, 0);
    if (friendshipModifier != 0) {
        if (GetMonData(pokemon, MON_DATA_POKEBALL, 0) == BALL_LUXURY) {
            friendshipModifier++;
        }
        
        if (map == GetMonData(pokemon, MON_DATA_EGG_MET_LOCATION, 0)) {
            friendshipModifier++;
        }

        if (GetItemAttr(GetMonData(pokemon, MON_DATA_HELD_ITEM, 0), ITEMATTR_HOLD_EFFECT, 11) == HOLD_EFFECT_FRIENDSHIP_UP) {
            friendshipModifier = friendshipModifier * 150 / 100;
        }
    }

    friendship += friendshipModifier;
    if (friendship > FRIENDSHIP_MAX) {
        friendship = FRIENDSHIP_MAX;
    }
    SetMonData(pokemon, MON_DATA_FRIENDSHIP, &friendship);

    return FALSE;
}

BOOL ScrCmd_MonSubtractFriendship(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 friendshipModifier = ScriptGetVar(ctx);
    u16 slot = ScriptGetVar(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    u16 friendship = GetMonData(pokemon, MON_DATA_FRIENDSHIP, 0);
    if (friendshipModifier > friendship) {
        friendship = 0;
    }
    else {
        friendship -= friendshipModifier;
    }
    SetMonData(pokemon, MON_DATA_FRIENDSHIP, &friendship);

    return FALSE;
}

BOOL ScrCmd_MonGetContestValue(SCRIPTCONTEXT *ctx) {
    u16 slot = ScriptGetVar(ctx);
    u16 contestAttribute = ScriptGetVar(ctx);
    u16 *contestValue = ScriptGetVarPointer(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), slot);
    *contestValue = GetMonData(pokemon, contestAttribute + MON_DATA_COOL, 0);

    return FALSE;
}

BOOL ScrCmd_GetPartyLead(SCRIPTCONTEXT *ctx) {
    u16 *slot = ScriptGetVarPointer(ctx);
    *slot = Save_GetPartyLead(ctx->fsys->savedata);
    return FALSE;
}

BOOL ScrCmd_GetPartyLeadAlive(SCRIPTCONTEXT *ctx) {
    u16 *slot = ScriptGetVarPointer(ctx);
    *slot = Save_GetPartyLeadAlive(ctx->fsys->savedata);
    return FALSE;
}

BOOL ScrCmd_GetMonTypes(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *type1 = ScriptGetVarPointer(ctx);
    u16 *type2 = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    *type1 = GetMonData(pokemon, MON_DATA_TYPE_1, 0);
    *type2 = GetMonData(pokemon, MON_DATA_TYPE_2, 0);

    return FALSE; 
}

BOOL ScrCmd_GetPartyCount(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *count = ScriptGetVarPointer(ctx);
    *count = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_PartyCountNotEgg(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *eggCount = ScriptGetVarPointer(ctx);
    int count, i;

    int partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, count = 0; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
        if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) == 0) {
            count++;
        }
    }

    *eggCount = count;
    return FALSE;
}

BOOL ScrCmd_CountAliveMons(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *aliveCount = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);
    int count, i;

    int partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, count = 0; i < partyCount; i++) {
        if (i != slot) {
            POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
            if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) == 0 && GetMonData(pokemon, MON_DATA_HP, 0) != 0) {
                count++;
            }
        }
    }
    *aliveCount = count;

    return FALSE;
}

BOOL ScrCmd_CountAliveMonsAndPC(SCRIPTCONTEXT *ctx) {
    int partyCount, count, i;
    FieldSystem *fsys = ctx->fsys;
    u16 *pokemonCount = ScriptGetVarPointer(ctx);
    PC_STORAGE *pc = GetStoragePCPointer(fsys->savedata);

    partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, count = 0; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
        if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) == 0 && GetMonData(pokemon, MON_DATA_HP, 0) != 0) {
            count++;
        }
    }
    *pokemonCount = count + PCStorage_CountMonsInAllBoxes(pc);

    return FALSE;
}

BOOL ScrCmd_PartyCountEgg(SCRIPTCONTEXT *ctx) {
    int partyCount, count, i;
    FieldSystem *fsys = ctx->fsys;
    u16 *eggCount = ScriptGetVarPointer(ctx);

    partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, count = 0; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
        if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) != 0) {
            count++;
        }
    }
    *eggCount = count;

    return FALSE;
}

BOOL ScrCmd_PartyHasPokerus(SCRIPTCONTEXT *ctx) {
    u16 i, partyCount;
    FieldSystem *fsys = ctx->fsys;
    u16 *slot = ScriptGetVarPointer(ctx);

    partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, *slot = 0; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
        if (GetMonData(pokemon, MON_DATA_POKERUS, 0) != 0) {
            *slot = 1;
            break;
        }
    }

    return FALSE;
}

BOOL ScrCmd_MonGetGender(SCRIPTCONTEXT *ctx) {
    u16 slot = ScriptGetVar(ctx);
    u16 *gender = ScriptGetVarPointer(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), slot);
    *gender = GetMonData(pokemon, MON_DATA_GENDER, 0);

    return FALSE;
}

BOOL ScrCmd_CountMonMoves(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *moveCount = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) != 0) {
        *moveCount = 0;
        return FALSE;
    }

    u8 count = 0;
    if (GetMonData(pokemon, MON_DATA_MOVE1, 0) != 0) {
        count++;
    }

    if (GetMonData(pokemon, MON_DATA_MOVE2, 0) != 0) {
        count++;
    }

    if (GetMonData(pokemon, MON_DATA_MOVE3, 0) != 0) {
        count++;
    }

    if (GetMonData(pokemon, MON_DATA_MOVE4, 0) != 0) {
        count++;
    }

    *moveCount = count;
    return FALSE;
}

BOOL ScrCmd_MonForgetMove(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 pokemonSlot = ScriptGetVar(ctx);
    u16 moveSlot = ScriptGetVar(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), pokemonSlot);
    MonDeleteMoveSlot(pokemon, moveSlot);

    return FALSE;
}

BOOL ScrCmd_MonGetMove(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *move = ScriptGetVarPointer(ctx);
    u16 pokemonSlot = ScriptGetVar(ctx);
    u16 moveSlot = ScriptGetVar(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), pokemonSlot);
    *move = GetMonData(pokemon, moveSlot + MON_DATA_MOVE1, 0);

    return FALSE;
}

BOOL ScrCmd_KenyaCheck(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *kenya = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);
    u8 val = ScriptReadByte(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    if (ItemIdIsMail(GetMonData(pokemon, MON_DATA_HELD_ITEM, 0)) == 0) {
        *kenya = 0;
        return FALSE;
    }

    if (val == 0) {
        *kenya = 1;
        return FALSE;
    }

    HandleLoadOverlay(FS_OVERLAY_ID(npc_trade), OVY_LOAD_ASYNC);
    MAIL *kenyaMail = NPCTrade_MakeKenyaMail();
    MAIL *mail = Mail_new(11);
    GetMonData(pokemon, MON_DATA_MAIL_STRUCT, mail);
    *kenya = Mail_compare(kenyaMail, mail);
    FreeToHeap(mail);
    FreeToHeap(kenyaMail);
    UnloadOverlayByID(FS_OVERLAY_ID(npc_trade));

    return FALSE;
}

BOOL ScrCmd_KenyaCheckPartyOrMailbox(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *kenya = ScriptGetVarPointer(ctx);
    *kenya = 0;
    int i;

    PARTY *party = SavArray_PlayerParty_get(fsys->savedata);
    HandleLoadOverlay(FS_OVERLAY_ID(npc_trade), OVY_LOAD_ASYNC);
    MAIL *kenyaMail = NPCTrade_MakeKenyaMail();
    MAIL *mail = Mail_new(11);
    UnloadOverlayByID(FS_OVERLAY_ID(npc_trade));

    for (i = 0; i < GetPartyCount(party); i++) {
        POKEMON *pokemon = GetPartyMonByIndex(party, i);
        if (ItemIdIsMail(GetMonData(pokemon, MON_DATA_HELD_ITEM, 0)) != 0) {
            GetMonData(pokemon, MON_DATA_MAIL_STRUCT, mail);
            if (Mail_compare(kenyaMail, mail) != 0) {
                *kenya = 1;
                FreeToHeap(mail);
                FreeToHeap(kenyaMail);
                return FALSE;
            }
        }
    }

    MAILBOX *mailbox = Sav2_Mailbox_get(fsys->savedata);
    i = 0;
    while (TRUE) {
        Mailbox_FetchMailToBuffer(mailbox->msgs, 0, i, mail);
        if (Mail_TypeIsValid(mail) != 0 && Mail_compare(kenyaMail, mail) != 0) {
            *kenya = 1;
            break;
        }

        i++;
        if (i >= MAILBOX_MSG_COUNT) {
            break;
        }
    }

    FreeToHeap(mail);
    FreeToHeap(kenyaMail);
    return FALSE;
}

BOOL ScrCmd_MonGiveMail(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 slot = ScriptGetVar(ctx);
    u16 item;

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), slot);
    if (ItemIdIsMail(GetMonData(pokemon, MON_DATA_HELD_ITEM, 0)) == 0) {
        return FALSE;
    }

    item = 0;
    MAIL *mail = Mail_new(11);
    Mail_init(mail);
    SetMonData(pokemon, MON_DATA_MAIL_STRUCT, mail);
    SetMonData(pokemon, MON_DATA_HELD_ITEM, &item);
    FreeToHeap(mail);

    return FALSE;
}

BOOL ScrCmd_PlayerHasSpecies(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *playerHasSpecies = ScriptGetVarPointer(ctx);
    u16 species = ScriptGetVar(ctx);
    u8 i;

    u8 partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, *playerHasSpecies = 0; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
        if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) == 0 && (u16)GetMonData(pokemon, MON_DATA_SPECIES, 0) == species) {
            *playerHasSpecies = 1;
            break;
        }
    }

    return FALSE;
}

BOOL ScrCmd_CountPartyMonsOfSpecies(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *speciesCount = ScriptGetVarPointer(ctx);
    u16 species = ScriptGetVar(ctx);
    u16 array[6];
    u8 i, j;

    for (i = 0; i < 6; i++) {
        array[i] = 0;
    }

    u8 partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, *speciesCount = 0; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
        if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) == 0) {
            u16 monSpecies = GetMonData(pokemon, MON_DATA_SPECIES, 0);
            if (species == 0) {
                array[i] = monSpecies;
                for (j = 0; j < i; j++) {
                    if (array[j] == array[i]) {
                        *speciesCount = 1;
                        return FALSE;
                    }
                }
            }
            else if (species == monSpecies) {
                *speciesCount = *speciesCount + 1;
            }
        }
    }

    return FALSE;
}

BOOL ScrCmd_GetPartySlotWithSpecies(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *slot = ScriptGetVarPointer(ctx);
    u16 species = ScriptGetVar(ctx);
    u8 i;

    u8 partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, *slot = 255; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
        if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) == 0 && (u16)GetMonData(pokemon, MON_DATA_SPECIES, 0) == species) {
            *slot = i;
            break;
        }
    }

    return FALSE;
}

BOOL ScrCmd_MonGetRibbonCount(SCRIPTCONTEXT *ctx) {
    u16 *ribbons = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);
    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), slot);

    u16 i, count;
    for (i = 0, count = 0; i < 80; i++) {
        if (GetMonData(pokemon, sub_0208E55C((u8)i, 0), 0) != 0) {
            count++;
        }
    }
    *ribbons = count;

    return FALSE;
}

BOOL ScrCmd_GetPartyRibbonCount(SCRIPTCONTEXT *ctx) {
    PARTY *party;
    u16 i, count;

    u16 *ribbons = ScriptGetVarPointer(ctx);
    u16 partyCount = GetPartyCount(SavArray_PlayerParty_get(ctx->fsys->savedata));
    party = SavArray_PlayerParty_get(ctx->fsys->savedata);

    for (i = 0, count = 0; i < 80; i++) {
        for (u16 j = 0; j < partyCount; j++) {
            POKEMON *pokemon = GetPartyMonByIndex(party, j);
            if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) == 0 && GetMonData(pokemon, sub_0208E55C((u8)i, 0), 0) != 0) {
                count++;
                break;
            }
        }
    }
    *ribbons = count;

    return FALSE;
}

BOOL ScrCmd_MonHasRibbon(SCRIPTCONTEXT *ctx) {
    u16 *hasRibbon = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);
    u16 ribbon = ScriptGetVar(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), slot);
    *hasRibbon = GetMonData(pokemon, sub_0208E55C((u8)ribbon, 0), 0);

    return FALSE;
}

BOOL ScrCmd_GiveRibbon(SCRIPTCONTEXT *ctx) {
    u16 slot = ScriptGetVar(ctx);
    u16 ribbon = ScriptGetVar(ctx);
    u8 hasRibbon = TRUE;

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), slot);
    SetMonData(pokemon, sub_0208E55C((u8)ribbon, 0), &hasRibbon);

    return FALSE;
}

BOOL ScrCmd_PartyLegalCheck(SCRIPTCONTEXT *ctx) {
    u16 i;

    u16 *legal = ScriptGetVarPointer(ctx);
    u16 partyCount = GetPartyCount(SavArray_PlayerParty_get(ctx->fsys->savedata));
    PARTY *party = SavArray_PlayerParty_get(ctx->fsys->savedata);

    for (i = 0; i < 80; i++) {
        for (u16 j = 0; j < partyCount; j++) {
            POKEMON *pokemon = GetPartyMonByIndex(party, j);
            if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) != 0 && GetMonData(pokemon, MON_DATA_CHECKSUM_FAILED, 0) != 0) {
                *legal = 1;
                return FALSE;
            }
        }
    }

    *legal = 0;
    return FALSE;
}

BOOL ScrCmd_GetPartySlotWithFatefulEncounter(SCRIPTCONTEXT *ctx) {
    u8 partyCount, i;
    FieldSystem *fsys = ctx->fsys;
    u16 *slot = ScriptGetVarPointer(ctx);
    u16 species = ScriptGetVar(ctx);

    partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, *slot = 255; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
        if (GetMonData(pokemon, MON_DATA_IS_EGG, 0) == 0) {
            if ((u16)GetMonData(pokemon, MON_DATA_SPECIES, 0) == species && GetMonData(pokemon, MON_DATA_FATEFUL_ENCOUNTER, 0) == 1) {
                *slot = i;
                break;
            }
        }
    }

    return FALSE;
}

BOOL ScrCmd_MonHasItem(SCRIPTCONTEXT *ctx) {
    int i;
    FieldSystem *fsys = ctx->fsys;
    u16 item = ScriptGetVar(ctx);
    u16 *hasItem = ScriptGetVarPointer(ctx);

    int partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    for (i = 0, *hasItem = 0; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), i);
        if (GetMonData(pokemon, MON_DATA_HELD_ITEM, 0) == item) {
            *hasItem = 1;
            break;
        }
    }

    return FALSE; 
}

BOOL ScrCmd_GetPartymonForme(SCRIPTCONTEXT *ctx) {
    u16 slot = ScriptGetVar(ctx);
    u16 *forme = ScriptGetVarPointer(ctx);

    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), slot);
    *forme = GetMonData(pokemon, MON_DATA_FORME, 0);

    return FALSE;
}


BOOL ScrCmd_MonAddContestValue(SCRIPTCONTEXT *ctx) {
    POKEMON *pokemon;
    u8 contestValue = 0;
    u16 slot = ScriptGetVar(ctx);
    u8 contestAttribute = ScriptReadByte(ctx);
    int contestModifier = ScriptGetVar(ctx);

    if (contestAttribute >= 6) {
        return FALSE;
    }

    pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), slot);
    if (GetMonData(pokemon, MON_DATA_SHEEN, 0) == 255) {
        return FALSE;
    }

    contestAttribute += MON_DATA_COOL;
    contestValue = GetMonData(pokemon, contestAttribute, 0);

    if ((contestModifier + contestValue) > 255) {
        contestValue = 255;
    }
    else {
        contestValue += contestModifier;
    }
    SetMonData(pokemon, contestAttribute, &contestValue);

    return FALSE;
}
