#include "scrcmd.h"
#include "bag.h"
#include "field_map_object.h"
#include "get_egg.h"
#include "party.h"
#include "player_data.h"
#include "pokemon.h"

extern void ov01_021F9048(LocalMapObject* map_object);
extern void FollowPokeMapObjectSetParams(LocalMapObject *mapObject, u16 species, u8 form, BOOL shiny);
extern u32 FollowingPokemon_GetSpriteID(int species, u16 form, u32 gender);

static LocalMapObject* CreateDaycareMonSpriteInternal(MapObjectManager* object_man, u8 dc_mon_idx, u16 species, u8 form, u32 gender, u32 direction, u32 x, u32 y, u32 map_no, BOOL shiny);

BOOL ScrCmd_BufferDaycareMonNicks(ScriptContext* ctx) {
    SaveData* saveData = ctx->fieldSystem->saveData;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    Daycare* daycare = Save_Daycare_Get(saveData);

    Save_Daycare_BufferStoredMonNicks(daycare, *msg_fmt);

    return FALSE;
}

BOOL ScrCmd_GetDaycareState(ScriptContext* ctx) {
    SaveData* saveData = ctx->fieldSystem->saveData;
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    Daycare* daycare = SaveArray_Get(saveData, SAVE_DAYCARE);

    *ret_ptr = Save_Daycare_GetState(daycare);

    return FALSE;
}

BOOL ScrCmd_ResetDaycareEgg(ScriptContext* ctx) {
    Daycare* daycare = SaveArray_Get(ctx->fieldSystem->saveData, SAVE_DAYCARE);

    Save_Daycare_ResetEggStats(daycare);

    return FALSE;
}

BOOL ScrCmd_GiveDaycareEgg(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    Daycare* daycare = SaveArray_Get(fieldSystem->saveData, SAVE_DAYCARE);
    Party* party = SaveArray_Party_Get(fieldSystem->saveData);
    SaveData* saveData = FieldSystem_GetSaveData(ctx->fieldSystem);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(saveData);

    GiveEggToPlayer(daycare, party, profile);

    return 0;
}

BOOL ScrCmd_RetrieveDaycareMon(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    SaveData* saveData = fieldSystem->saveData;
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    u16 daycare_mon_idx = ScriptGetVar(ctx);
    Daycare* daycare = SaveArray_Get(saveData, SAVE_DAYCARE);
    Party* party = SaveArray_Party_Get(fieldSystem->saveData);

    *ret_ptr = Save_Daycare_RetrieveMon(party, *msg_fmt, daycare, (u8)daycare_mon_idx);

    return FALSE;
}

BOOL ScrCmd_BufferDaycareWithdrawCost(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    SaveData* saveData = fieldSystem->saveData;
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    u16 daycare_mon_idx = ScriptGetVar(ctx);
    Daycare* daycare = SaveArray_Get(saveData, SAVE_DAYCARE);

    *ret_ptr = Save_Daycare_BufferMonNickAndRetrievalPrice(daycare, (u8)daycare_mon_idx, *msg_fmt);

    return FALSE;
}

BOOL ScrCmd_BufferDaycareMonGrowth(ScriptContext* ctx) {
    SaveData* saveData = ctx->fieldSystem->saveData;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    u16 daycare_mon_idx = ScriptGetVar(ctx);
    Daycare* daycare = SaveArray_Get(saveData, SAVE_DAYCARE);

    *ret_ptr = Save_Daycare_BufferGrowthAndNick(daycare, daycare_mon_idx, *msg_fmt);

    return FALSE;
}

BOOL ScrCmd_GetTailDaycareMonSpeciesAndNick(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    Daycare* daycare = Save_Daycare_Get(fieldSystem->saveData);

    *ret_ptr = Save_Daycare_BufferTailMonNick(daycare, *msg_fmt);

    return FALSE;
}

BOOL ScrCmd_PutMonInDaycare(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    SaveData* saveData = fieldSystem->saveData;
    u16 slot = ScriptGetVar(ctx);
    Party* party = SaveArray_Party_Get(fieldSystem->saveData);
    Daycare* daycare = SaveArray_Get(saveData, SAVE_DAYCARE);

    Save_Daycare_PutMonIn(party, (u8)slot, daycare, saveData);

    return FALSE;
}

BOOL ScrCmd_BufferDaycareMonStats(ScriptContext* ctx) {
    SaveData* saveData = ctx->fieldSystem->saveData;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u16 nickname_idx = ScriptGetVar(ctx);
    u16 level_idx = ScriptGetVar(ctx);
    u16 gender_idx = ScriptGetVar(ctx);
    u16 slot = ScriptGetVar(ctx);
    Daycare* daycare = Save_Daycare_Get(saveData);

    Save_Daycare_BufferMonStats(daycare, (u8)nickname_idx, (u8)level_idx, (u8)gender_idx, (u8)slot, *msg_fmt);

    return FALSE;
}

BOOL ScrCmd_GetDaycareCompatibility(ScriptContext* ctx) {
    SaveData* saveData = ctx->fieldSystem->saveData;
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    Daycare* daycare = SaveArray_Get(saveData, SAVE_DAYCARE);

    *ret_ptr = Save_Daycare_CalcCompatibility(daycare);

    return FALSE;
}

BOOL ScrCmd_CheckDaycareEgg(ScriptContext* ctx) {
    SaveData* saveData = ctx->fieldSystem->saveData;
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    Daycare* daycare = SaveArray_Get(saveData, SAVE_DAYCARE);

    *ret_ptr = Save_Daycare_HasEgg(daycare);

    return FALSE;
}

BOOL ScrCmd_UpdateDaycareMonObjects(ScriptContext* ctx) {
    Daycare* daycare;
    u8 form;
    u16 species;

    FieldSystem* fieldSystem = ctx->fieldSystem;
    daycare = Save_Daycare_Get(fieldSystem->saveData);

    for (s32 dc_mon_idx = 0, y = 5, x = 8; dc_mon_idx < 2; dc_mon_idx++, y += 4, x += 2) {
        LocalMapObject* mon_map_object = GetMapObjectByID(fieldSystem->mapObjectMan, obj_daycare_poke_1 + dc_mon_idx);
        if (mon_map_object) {
            DeleteMapObject(mon_map_object);
        }

        BoxPokemon *boxMon = DaycareMon_GetBoxMon(Save_Daycare_GetMonX(daycare, dc_mon_idx));
        if (GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL) == SPECIES_NONE) {
            continue;
        }

        form = GetBoxMonData(boxMon, MON_DATA_FORM, NULL);
        species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
        u32 gender = GetBoxMonData(boxMon, MON_DATA_GENDER, NULL);
        BOOL shiny = BoxMonIsShiny(boxMon);

        CreateDaycareMonSpriteInternal(fieldSystem->mapObjectMan, (u8)dc_mon_idx, species, form, gender, 1, x, y, fieldSystem->location->mapId, shiny);
    }

    return FALSE;
}

static LocalMapObject* CreateDaycareMonSpriteInternal(MapObjectManager* object_man, u8 dc_mon_idx, u16 species, u8 form, u32 gender, u32 direction, u32 x, u32 y, u32 map_no, BOOL shiny) {
    u32 sprite_id = FollowingPokemon_GetSpriteID(species, form, gender);
    LocalMapObject* lmo = CreateSpecialFieldObject(object_man, x, y, direction, sprite_id, 11, map_no);
    GF_ASSERT(lmo != NULL);

    MapObject_SetID(lmo, obj_daycare_poke_1 + dc_mon_idx);
    MapObject_SetType(lmo, 0);
    MapObject_SetFlagID(lmo, 0);
    MapObject_SetScript(lmo, 0);
    MapObject_SetParam(lmo, 0, 2);
    FollowPokeMapObjectSetParams(lmo, species, (u32)form, shiny);
    MapObject_SetXRange(lmo, -1);
    MapObject_SetYRange(lmo, -1);
    MapObject_SetFlagsBits(lmo, MAPOBJECTFLAG_UNK2);
    MapObject_ClearFlagsBits(lmo, 0);
    MapObject_SetFlag29(lmo, TRUE);
    ov01_021F9048(lmo);

    return lmo;
}

BOOL ScrCmd_DaycareSanitizeMon(ScriptContext* ctx) {
    Pokemon *mon;

    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16 party_slot = ScriptGetVar(ctx);
    u16* ret_ptr = ScriptGetVarPointer(ctx);
    Party* party = SaveArray_Party_Get(fieldSystem->saveData);
    mon = Party_GetMonByIndex(party, party_slot);

    *ret_ptr = 0;

    if (party_slot == 0xFF) {
        return FALSE;
    }

    u32 held_item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
    if (held_item == ITEM_GRISEOUS_ORB) {
        Bag* bag = Save_Bag_Get(fieldSystem->saveData);
        if (!Bag_AddItem(bag, ITEM_GRISEOUS_ORB, 1, HEAP_ID_FIELD)) {
            *ret_ptr = 0xFF;
            return FALSE;
        }

        u32 no_item = ITEM_NONE;
        SetMonData(mon, MON_DATA_HELD_ITEM, &no_item);
    }

    s32 form = GetMonData(mon, MON_DATA_FORM, NULL);
    if (form > 0) {
        u32 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        switch (species) {
        case SPECIES_GIRATINA:
            Mon_UpdateGiratinaForm(mon);
            break;
        case SPECIES_ROTOM:
            Mon_UpdateRotomForm(mon, 0, 0);
            break;
        case SPECIES_SHAYMIN:
            Mon_UpdateShayminForm(mon, 0);
            break;
        }
    }

    return FALSE;
}
