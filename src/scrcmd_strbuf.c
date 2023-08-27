#include "scrcmd.h"
#include "event_data.h"
#include "filesystem.h"
#include "item.h"
#include "msgdata/msg.naix"
#include "party.h"
#include "player_data.h"
#include "pokemon_storage_system.h"
#include "save_arrays.h"
#include "unk_0205B3DC.h"
#include "unk_02068F84.h"
#include "ribbon.h"
#include "sys_vars.h"
#include "unk_0205BB1C.h"
#include "msgdata/msg.naix"

static String* _get_species_name(u16 species, HeapID heapId);

BOOL ScrCmd_BufferStatName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u8 stat_id = ScriptGetVar(ctx);

    BufferStatName(*msg_fmt, idx, stat_id);

    return FALSE;
}

BOOL ScrCmd_BufferPlayersName(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(fieldSystem));

    BufferPlayersName(*msg_fmt, idx, profile);

    return FALSE;
}

BOOL ScrCmd_BufferRivalsName(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);

    BufferRivalsName(*msg_fmt, idx, fieldSystem->saveData);

    return FALSE;
}

BOOL ScrCmd_BufferFriendsName(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);

    BufferFriendsName(*msg_fmt, idx, fieldSystem->saveData);

    return FALSE;
}

BOOL ScrCmd_BufferMonSpeciesName(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 party_mon_idx = ScriptGetVar(ctx);

    Party* party = SaveArray_Party_Get(fieldSystem->saveData);
    Pokemon *mon = Party_GetMonByIndex(party, party_mon_idx);
    BufferBoxMonSpeciesName(*msg_fmt, idx, &mon->box);

    return FALSE;
}

BOOL ScrCmd_BufferTypeName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 type_id = ScriptGetVar(ctx);

    BufferTypeName(*msg_fmt, idx, type_id);

    return FALSE;
}

BOOL ScrCmd_BufferItemName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 item_id = ScriptGetVar(ctx);

    BufferItemName(*msg_fmt, idx, item_id);

    return FALSE;
}

BOOL ScrCmd_BufferPocketName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 pocket_id = ScriptGetVar(ctx);

    BufferPocketName(*msg_fmt, idx, pocket_id);

    return FALSE;
}

BOOL ScrCmd_BufferTMHMMoveName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 move_id = ScriptGetVar(ctx);

    BufferMoveName(*msg_fmt, idx, TMHMGetMove(move_id));

    return FALSE;
}

BOOL ScrCmd_BufferMoveName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 move_id = ScriptGetVar(ctx);

    BufferMoveName(*msg_fmt, idx, move_id);

    return FALSE;
}

BOOL ScrCmd_BufferInt(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 number = ScriptGetVar(ctx);

    BufferIntegerAsString(*msg_fmt, idx, number, CountDigits(number), PRINTING_MODE_RIGHT_ALIGN, TRUE);

    return FALSE;
}

BOOL ScrCmd_BufferIntEx(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 number = ScriptGetVar(ctx);
    u8 str_conv_mode = ScriptReadByte(ctx);
    u8 unk2 = ScriptReadByte(ctx);

    u8 digits = unk2;
    if (str_conv_mode == PRINTING_MODE_LEFT_ALIGN) {
        digits = CountDigits(number);
    }

    BufferIntegerAsString(*msg_fmt, idx, number, digits, (PrintingMode)str_conv_mode, TRUE);

    return FALSE;
}

BOOL ScrCmd_661(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u32 number = ScriptReadWord(ctx);
    u8 str_conv_mode = ScriptReadByte(ctx);
    u8 unk2 = ScriptReadByte(ctx);

    u8 digits = unk2;
    if (str_conv_mode == PRINTING_MODE_LEFT_ALIGN) {
        digits = CountDigits(number);
    }

    BufferIntegerAsString(*msg_fmt, idx, number, digits, (PrintingMode)str_conv_mode, TRUE);

    return FALSE;
}

BOOL ScrCmd_BufferPartyMonNick(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 party_mon_idx = ScriptGetVar(ctx);

    Party* party = SaveArray_Party_Get(fieldSystem->saveData);
    Pokemon *mon = Party_GetMonByIndex(party, party_mon_idx);
    BufferBoxMonNickname(*msg_fmt, idx, &mon->box);

    return FALSE;
}

BOOL ScrCmd_BufferBoxMonNick(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    PC_STORAGE* pc = SaveArray_PCStorage_Get(fieldSystem->saveData);
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 box_mon_slot = ScriptGetVar(ctx);

    BoxPokemon *box_mon = PCStorage_GetMonByIndexPair(pc, box_mon_slot / MONS_PER_BOX, box_mon_slot % MONS_PER_BOX);
    BufferBoxMonNickname(*msg_fmt, idx, box_mon);

    return FALSE;
}

BOOL ScrCmd_BufferTrainerClassName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 trainer_class_id = ScriptGetVar(ctx);

    BufferTrainerClassName(*msg_fmt, idx, trainer_class_id);

    return FALSE;
}

BOOL ScrCmd_BufferPlayerUnionAvatarClassName(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    SaveData* saveData = FieldSystem_GetSaveData(fieldSystem);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(saveData);
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u32 gender = PlayerProfile_GetTrainerGender(profile);
    u8 avatar = PlayerProfile_GetAvatar(profile);

    BufferTrainerClassNameWithArticle(*msg_fmt, idx, GetUnionRoomAvatarAttrBySprite(gender, avatar, 2));

    return FALSE;
}

BOOL ScrCmd_BufferSpeciesName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 species = ScriptGetVar(ctx);
    u16 unk2 = ScriptReadHalfword(ctx);
    u8 unk3 = ScriptReadByte(ctx);

    String* species_name = _get_species_name(species, HEAP_ID_4);
    BufferString(*msg_fmt, idx, species_name, unk2, unk3, 2);
    String_Delete(species_name);

    return FALSE;
}

String* _get_species_name(u16 species, HeapID heapId) {
    MsgData* msg_data = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0237_bin, heapId);
    String* name = NewString_ReadMsgData(msg_data, species);
    DestroyMsgData(msg_data);
    return name;
}

BOOL ScrCmd_BufferStarterSpeciesName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 species = Save_VarsFlags_GetStarter(Save_VarsFlags_Get(ctx->fieldSystem->saveData));

    String* species_name = _get_species_name(species, HEAP_ID_4);
    BufferString(*msg_fmt, idx, species_name, 0, 1, 2);
    String_Delete(species_name);

    return FALSE;
}

BOOL ScrCmd_BufferDPPtRivalStarterSpeciesName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 species = DPPtLeftover_GetRivalSpecies(Save_VarsFlags_Get(ctx->fieldSystem->saveData));

    String* species_name = _get_species_name(species, HEAP_ID_4);
    BufferString(*msg_fmt, idx, species_name, 0, 1, 2);
    String_Delete(species_name);

    return FALSE;
}

BOOL ScrCmd_BufferDPPtFriendStarterSpeciesName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 species = DPPtLeftover_GetFriendStarterSpecies(Save_VarsFlags_Get(ctx->fieldSystem->saveData));

    String* species_name = _get_species_name(species, HEAP_ID_4);
    BufferString(*msg_fmt, idx, species_name, 0, 1, 2);
    String_Delete(species_name);

    return FALSE;
}

BOOL ScrCmd_BufferDecorationName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 decoration_id = ScriptGetVar(ctx);

    BufferDecorationName(*msg_fmt, idx, decoration_id);

    return FALSE;
}

// This may be what's left of ScrCmd_GetUndergroundTrapName from D/P/Pt.
BOOL ScrCmd_208(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 unused_id = ScriptGetVar(ctx);

    return FALSE;
}

// This may be what's left of ScrCmd_GetUndergroundItemName from D/P/Pt.
BOOL ScrCmd_209(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 unused_id = ScriptGetVar(ctx);

    return FALSE;
}

BOOL ScrCmd_BufferMapSecName(ScriptContext* ctx) {
    String* str = String_New(22, HEAP_ID_4);
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 mapno = ScriptGetVar(ctx);

    sub_02068F98(mapno, HEAP_ID_4, str);
    BufferString(*msg_fmt, idx, str, 0, 1, 2);
    String_Delete(str);

    return FALSE;
}

BOOL ScrCmd_BufferBerryName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 berry_id = ScriptGetVar(ctx);
    u16 unk = ScriptGetVar(ctx);

    String* str = GetNutName((u16)(berry_id - FIRST_BERRY_IDX), HEAP_ID_32);
    BufferString(*msg_fmt, idx, str, 0, unk < 2, 2);
    String_Delete(str);

    return FALSE;
}

BOOL ScrCmd_BufferNatureName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 nature_id = ScriptGetVar(ctx);

    BufferNatureName(*msg_fmt, idx, nature_id);

    return FALSE;
}

BOOL ScrCmd_BufferFashionName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 fashion_id = ScriptGetVar(ctx);

    BufferFashionName(*msg_fmt, idx, fashion_id);

    return FALSE;
}

BOOL ScrCmd_BufferPartyMonMoveName(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 party_slot = ScriptGetVar(ctx);
    u16 move_slot = ScriptGetVar(ctx);

    Party* party = SaveArray_Party_Get(fieldSystem->saveData);
    Pokemon *mon = Party_GetMonByIndex(party, party_slot);
    u16 move_id = GetMonData(mon, MON_DATA_MOVE1 + move_slot, NULL);
    BufferMoveName(*msg_fmt, idx, move_id);

    return FALSE;
}

BOOL ScrCmd_BufferRibbonName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u8 unk = ScriptGetVar(ctx);

    u16 ribbon_id = GetRibbonAttr(unk, RIBBONDAT_NAMEGMM);
    BufferRibbonNameOrDesc(*msg_fmt, idx, ribbon_id);

    return FALSE;
}

BOOL ScrCmd_BufferSealName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 seal_id = ScriptGetVar(ctx);

    BufferSealName(*msg_fmt, idx, seal_id);

    return FALSE;
}

BOOL ScrCmd_BufferTrainerName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 trainer_id = ScriptGetVar(ctx);

    BufferTrainerName(*msg_fmt, idx, trainer_id);

    return FALSE;
}

BOOL ScrCmd_BufferApricornName(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u8 apricorn_id = ScriptGetVar(ctx);

    BufferApricornName(*msg_fmt, idx, apricorn_id);

    return FALSE;
}

BOOL ScrCmd_BufferItemNameIndef(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 item_id = ScriptGetVar(ctx);

    BufferItemNameWithIndefArticle(*msg_fmt, idx, item_id);

    return FALSE;
}

BOOL ScrCmd_BufferItemNamePlural(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 item_id = ScriptGetVar(ctx);

    BufferItemNamePlural(*msg_fmt, idx, item_id);

    return FALSE;
}

BOOL ScrCmd_BufferPartyMonSpeciesNameIndef(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 party_mon_slot = ScriptGetVar(ctx);

    Party* party = SaveArray_Party_Get(fieldSystem->saveData);
    Pokemon *mon = Party_GetMonByIndex(party, party_mon_slot);
    BufferBoxMonSpeciesNameWithArticle(*msg_fmt, idx, &mon->box);

    return FALSE;
}

BOOL ScrCmd_BufferSpeciesNameIndef(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 item_id = ScriptGetVar(ctx);
    u16 unused1 = ScriptReadHalfword(ctx);
    u8 unused2 = ScriptReadByte(ctx);

    BufferSpeciesNameWithArticle(*msg_fmt, idx, item_id);

    return FALSE;
}

BOOL ScrCmd_BufferDPPtFriendStarterSpeciesNameIndef(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 species = DPPtLeftover_GetFriendStarterSpecies(Save_VarsFlags_Get(ctx->fieldSystem->saveData));

    BufferSpeciesNameWithArticle(*msg_fmt, idx, species);

    return FALSE;
}

BOOL ScrCmd_BufferFashionNameIndef(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 fashion_id = ScriptGetVar(ctx);

    BufferFashionNameWithArticle(*msg_fmt, idx, fashion_id);

    return FALSE;
}

BOOL ScrCmd_BufferTrainerClassNameIndef(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 trainer_class_id = ScriptGetVar(ctx);

    BufferTrainerClassNameWithArticle(*msg_fmt, idx, trainer_class_id);

    return FALSE;
}

BOOL ScrCmd_BufferSealNamePlural(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);
    u16 seal_id = ScriptGetVar(ctx);

    BufferSealNamePlural(*msg_fmt, idx, seal_id);

    return FALSE;
}

BOOL ScrCmd_Capitalize(ScriptContext* ctx) {
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 idx = ScriptReadByte(ctx);

    MessageFormat_UpperFirstChar(*msg_fmt, idx);

    return FALSE;
}
