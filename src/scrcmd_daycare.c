#include "scrcmd.h"
#include "bag.h"
#include "field_map_object.h"
#include "get_egg.h"
#include "party.h"
#include "player_data.h"
#include "pokemon.h"

extern void ov01_021F9048(LocalMapObject* map_object);
extern void FollowPokeMapObjectSetParams(LocalMapObject *mapObject, u16 species, u8 forme, BOOL shiny);
extern u32 FollowingPokemon_GetSpriteID(int species, u16 forme, u32 gender);

static LocalMapObject* CreateDayCareMonSpriteInternal(MapObjectMan* object_man, u8 dc_mon_idx, u16 species, u8 forme, u32 gender, u32 direction, u32 x, u32 y, u32 map_no, BOOL shiny);

BOOL ScrCmd_BufferDayCareMonNicks(SCRIPTCONTEXT* ctx) {
    SAVEDATA* savedata = ctx->fsys->savedata;
    MSGFMT** msg_fmt = FieldSysGetAttrAddr(ctx->fsys, UNK80_10_C_MSGFMT);
    DAYCARE* daycare = Sav2_DayCare_get(savedata);

    Sav2_DayCare_BufferStoredMonNicks(daycare, *msg_fmt);

    return FALSE;
}

BOOL ScrCmd_GetDayCareState(SCRIPTCONTEXT* ctx) {
    SAVEDATA* savedata = ctx->fsys->savedata;
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    DAYCARE* daycare = SavArray_get(savedata, SAVE_DAYCARE);

    *ret_ptr = Sav2_DayCare_GetState(daycare);

    return FALSE;
}

BOOL ScrCmd_ResetDayCareEgg(SCRIPTCONTEXT* ctx) {
    DAYCARE* daycare = SavArray_get(ctx->fsys->savedata, SAVE_DAYCARE);

    Sav2_DayCare_ResetEggStats(daycare);

    return FALSE;
}

BOOL ScrCmd_GiveDayCareEgg(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    DAYCARE* daycare = SavArray_get(fsys->savedata, SAVE_DAYCARE);
    PARTY* party = SavArray_PlayerParty_get(fsys->savedata);
    SAVEDATA* savedata = Fsys_GetSav2Ptr(ctx->fsys);
    PLAYERPROFILE* profile = Sav2_PlayerData_GetProfileAddr(savedata);

    GiveEggToPlayer(daycare, party, profile);

    return 0;
}

BOOL ScrCmd_RetrieveDayCareMon(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    MSGFMT** msg_fmt = FieldSysGetAttrAddr(fsys, UNK80_10_C_MSGFMT);
    SAVEDATA* savedata = fsys->savedata;
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    u16 daycare_mon_idx = ScriptGetVar(ctx);
    DAYCARE* daycare = SavArray_get(savedata, SAVE_DAYCARE);
    PARTY* party = SavArray_PlayerParty_get(fsys->savedata);

    *ret_ptr = Sav2_DayCare_RetrieveMon(party, *msg_fmt, daycare, (u8)daycare_mon_idx);

    return FALSE;
}

BOOL ScrCmd_BufferDayCareWithdrawCost(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    MSGFMT** msg_fmt = FieldSysGetAttrAddr(fsys, UNK80_10_C_MSGFMT);
    SAVEDATA* savedata = fsys->savedata;
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    u16 daycare_mon_idx = ScriptGetVar(ctx);
    DAYCARE* daycare = SavArray_get(savedata, SAVE_DAYCARE);

    *ret_ptr = Sav2_DayCare_BufferMonNickAndRetrievalPrice(daycare, (u8)daycare_mon_idx, *msg_fmt);

    return FALSE;
}

BOOL ScrCmd_BufferDayCareMonGrowth(SCRIPTCONTEXT* ctx) {
    SAVEDATA* savedata = ctx->fsys->savedata;
    MSGFMT** msg_fmt = FieldSysGetAttrAddr(ctx->fsys, UNK80_10_C_MSGFMT);
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    u16 daycare_mon_idx = ScriptGetVar(ctx);
    DAYCARE* daycare = SavArray_get(savedata, SAVE_DAYCARE);

    *ret_ptr = Sav2_DayCare_BufferGrowthAndNick(daycare, daycare_mon_idx, *msg_fmt);

    return FALSE;
}

BOOL ScrCmd_GetTailDayCareMonSpeciesAndNick(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    MSGFMT** msg_fmt = FieldSysGetAttrAddr(ctx->fsys, UNK80_10_C_MSGFMT);
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    DAYCARE* daycare = Sav2_DayCare_get(fsys->savedata);

    *ret_ptr = Sav2_DayCare_BufferTailMonNick(daycare, *msg_fmt);

    return FALSE;
}

BOOL ScrCmd_PutMonInDayCare(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    SAVEDATA* savedata = fsys->savedata;
    u16 slot = ScriptGetVar(ctx);
    PARTY* party = SavArray_PlayerParty_get(fsys->savedata);
    DAYCARE* daycare = SavArray_get(savedata, SAVE_DAYCARE);

    Sav2_DayCare_PutMonIn(party, (u8)slot, daycare, savedata);

    return FALSE;
}

BOOL ScrCmd_BufferDayCareMonStats(SCRIPTCONTEXT* ctx) {
    SAVEDATA* savedata = ctx->fsys->savedata;
    MSGFMT** msg_fmt = FieldSysGetAttrAddr(ctx->fsys, UNK80_10_C_MSGFMT);
    u16 nickname_idx = ScriptGetVar(ctx);
    u16 level_idx = ScriptGetVar(ctx);
    u16 gender_idx = ScriptGetVar(ctx);
    u16 slot = ScriptGetVar(ctx);
    DAYCARE* daycare = Sav2_DayCare_get(savedata);

    Sav2_DayCare_BufferMonStats(daycare, (u8)nickname_idx, (u8)level_idx, (u8)gender_idx, (u8)slot, *msg_fmt);

    return FALSE;
}

BOOL ScrCmd_GetDayCareCompatibility(SCRIPTCONTEXT* ctx) {
    SAVEDATA* savedata = ctx->fsys->savedata;
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    DAYCARE* daycare = SavArray_get(savedata, SAVE_DAYCARE);

    *ret_ptr = Sav2_DayCare_CalcCompatibility(daycare);

    return FALSE;
}

BOOL ScrCmd_CheckDayCareEgg(SCRIPTCONTEXT* ctx) {
    SAVEDATA* savedata = ctx->fsys->savedata;
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    DAYCARE* daycare = SavArray_get(savedata, SAVE_DAYCARE);

    *ret_ptr = Sav2_DayCare_HasEgg(daycare);

    return FALSE;
}

BOOL ScrCmd_UpdateDayCareMonObjects(SCRIPTCONTEXT* ctx) {
    DAYCARE* daycare;
    u8 forme;
    u16 species;

    FieldSystem* fsys = ctx->fsys;
    daycare = Sav2_DayCare_get(fsys->savedata);

    for (s32 dc_mon_idx = 0, y = 5, x = 8; dc_mon_idx < 2; dc_mon_idx++, y += 4, x += 2) {
        LocalMapObject* mon_map_object = GetMapObjectByID(fsys->unk3C, obj_daycare_poke_1 + dc_mon_idx);
        if (mon_map_object) {
            DeleteMapObject(mon_map_object);
        }

        BOXMON* dc_box_mon = DayCareMon_GetBoxMon(Sav2_DayCare_GetMonX(daycare, dc_mon_idx));
        if (GetBoxMonData(dc_box_mon, MON_DATA_SPECIES, NULL) == SPECIES_NONE) {
            continue;
        }

        forme = GetBoxMonData(dc_box_mon, MON_DATA_FORME, NULL);
        species = GetBoxMonData(dc_box_mon, MON_DATA_SPECIES, NULL);
        u32 gender = GetBoxMonData(dc_box_mon, MON_DATA_GENDER, NULL);
        BOOL shiny = BoxMonIsShiny(dc_box_mon);

        CreateDayCareMonSpriteInternal(fsys->unk3C, (u8)dc_mon_idx, species, forme, gender, 1, x, y, fsys->location->mapId, shiny);
    }

    return FALSE;
}

static LocalMapObject* CreateDayCareMonSpriteInternal(MapObjectMan* object_man, u8 dc_mon_idx, u16 species, u8 forme, u32 gender, u32 direction, u32 x, u32 y, u32 map_no, BOOL shiny) {
    u32 sprite_id = FollowingPokemon_GetSpriteID(species, forme, gender);
    LocalMapObject* lmo = CreateSpecialFieldObject(object_man, x, y, direction, sprite_id, 11, map_no);
    GF_ASSERT(lmo != NULL);

    MapObject_SetID(lmo, obj_daycare_poke_1 + dc_mon_idx);
    MapObject_SetType(lmo, 0);
    MapObject_SetFlagID(lmo, 0);
    MapObject_SetScript(lmo, 0);
    MapObject_SetParam(lmo, 0, 2);
    FollowPokeMapObjectSetParams(lmo, species, (u32)forme, shiny);
    MapObject_SetXRange(lmo, -1);
    MapObject_SetYRange(lmo, -1);
    MapObject_SetBits(lmo, 4);
    MapObject_ClearBits(lmo, 0);
    sub_0205F89C(lmo, 1);
    ov01_021F9048(lmo);

    return lmo;
}

BOOL ScrCmd_DayCareSanitizeMon(SCRIPTCONTEXT* ctx) {
    POKEMON* party_mon;

    FieldSystem* fsys = ctx->fsys;
    u16 party_slot = ScriptGetVar(ctx);
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    PARTY* party = SavArray_PlayerParty_get(fsys->savedata);
    party_mon = GetPartyMonByIndex(party, party_slot);

    *ret_ptr = 0;

    if (party_slot == 0xFF) {
        return FALSE;
    }

    u32 held_item = GetMonData(party_mon, MON_DATA_HELD_ITEM, NULL);
    if (held_item == ITEM_GRISEOUS_ORB) {
        BAG_DATA* bag = Sav2_Bag_get(fsys->savedata);
        if (!Bag_AddItem(bag, ITEM_GRISEOUS_ORB, 1, 11)) {
            *ret_ptr = 0xFF;
            return FALSE;
        }

        u32 no_item = ITEM_NONE;
        SetMonData(party_mon, MON_DATA_HELD_ITEM, &no_item);
    }

    s32 forme = GetMonData(party_mon, MON_DATA_FORME, NULL);
    if (forme > 0) {
        u32 species = GetMonData(party_mon, MON_DATA_SPECIES, NULL);
        switch (species) {
        case SPECIES_GIRATINA:
            Mon_UpdateGiratinaForme(party_mon);
            break;
        case SPECIES_ROTOM:
            Mon_UpdateRotomForme(party_mon, 0, 0);
            break;
        case SPECIES_SHAYMIN:
            Mon_UpdateShayminForme(party_mon, 0);
            break;
        }
    }

    return FALSE;
}
