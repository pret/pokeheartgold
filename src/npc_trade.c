#include "global.h"
#include "npc_trade.h"
#include "pokemon.h"
#include "gf_gfx_loader.h"
#include "update_dex_received.h"
#include "item.h"
#include "mail.h"
#include "unk_0206D494.h"
#include "unk_02055418.h"
#include "unk_0208E600.h"
#include "map_header.h"
#include "constants/maps.h"
#include "constants/items.h"
#include "unk_02055418.h"
#include "msgdata/msg.naix"

static String *_GetNpcTradeName(HeapID heapId, s32 msgno);
static void _CreateTradeMon(Pokemon *mon, NPCTrade *trade_dat, u32 level, u32 tradeno, u32 mapno, u32 met_level_strat, HeapID heapId);

NPCTradeAppData *NPCTradeApp_Init(HeapID heapId, u32 tradeno) {
    NPCTradeAppData *ret;
    u16 strbuf[128];

    GF_ASSERT(tradeno < TRADE_MAX);
    ret = AllocFromHeap(heapId, sizeof(NPCTradeAppData));
    memset(ret, 0, sizeof(NPCTradeAppData));
    ret->trade_dat = GfGfxLoader_LoadFromNarc(NARC_a_1_1_2, tradeno, FALSE, heapId, FALSE);
    ret->heapId = heapId;
    ret->tradeno = tradeno;
    ret->mon = AllocMonZeroed(heapId);
    ret->profile = PlayerProfile_New(heapId);
    PlayerProfile_Init(ret->profile);
    {
        String *name;
        name = _GetNpcTradeName(heapId, tradeno + TRADE_MAX);
        CopyStringToU16Array(name, strbuf, 128);
        String_Delete(name);
    }
    Save_Profile_PlayerName_Set(ret->profile, strbuf);
    PlayerProfile_SetTrainerGender(ret->profile, ret->trade_dat->gender);
    return ret;
}

void NPCTradeApp_Delete(NPCTradeAppData *work) {
    FreeToHeap(work->trade_dat);
    FreeToHeap(work->mon);
    FreeToHeap(work->profile);
    FreeToHeap(work);
}

void NPCTrade_MakeAndGiveLoanMon(FieldSystem *fieldSystem, u8 tradeno, u8 level, u16 mapno) {
    Party *party;
    Pokemon *mon;
    NPCTrade *trade_dat;
    Pokemon *kenya;
    String *name;
    Mail *mail;
    u8 mailno;

    mon = AllocMonZeroed(HEAP_ID_FIELD);
    trade_dat = GfGfxLoader_LoadFromNarc(NARC_a_1_1_2, tradeno, FALSE, HEAP_ID_FIELD, TRUE);
    _CreateTradeMon(mon, trade_dat, level, tradeno, mapno, 7, HEAP_ID_FIELD);
    UpdatePokedexWithReceivedSpecies(fieldSystem->saveData, mon);
    party = SaveArray_Party_Get(fieldSystem->saveData);
    Party_AddMon(party, mon);
    if (tradeno == 7) {
        kenya = Party_GetMonByIndex(party, Party_GetCount(party) - 1);
        name = _GetNpcTradeName(HEAP_ID_FIELD, tradeno + TRADE_MAX);
        mailno = ItemToMailId(trade_dat->heldItem);
        mail = CreateKenyaMail(mon, mailno, trade_dat->gender, name, trade_dat->otId);
        SetMonData(kenya, MON_DATA_MAIL_STRUCT, mail);
        String_Delete(name);
        FreeToHeap(mail);
    }
    FreeToHeap(trade_dat);
    FreeToHeap(mon);
}

Mail *NPCTrade_MakeKenyaMail(void) {
    Pokemon *mon;
    NPCTrade *trade_dat;
    String *name;
    Mail *mail;
    u8 mailno;

    mon = AllocMonZeroed(HEAP_ID_FIELD);
    trade_dat = GfGfxLoader_LoadFromNarc(NARC_a_1_1_2, 7, FALSE, HEAP_ID_FIELD, TRUE);
    _CreateTradeMon(mon, trade_dat, 20, 7, MAP_R35R0101, 7, HEAP_ID_FIELD);
    name = _GetNpcTradeName(HEAP_ID_FIELD, 7 + TRADE_MAX);
    mailno = ItemToMailId(trade_dat->heldItem);
    mail = CreateKenyaMail(mon, mailno, trade_dat->gender, name, trade_dat->otId);
    String_Delete(name);
    FreeToHeap(trade_dat);
    FreeToHeap(mon);
    return mail;
}

int NPCTrade_CanGiveUpLoanMon(FieldSystem *fieldSystem, u8 tradeno, u8 idx) {
    Party *party;
    Pokemon *mon, *cur_poke;
    u8 capsule;
    u16 heldItem;
    int i, n, party_count;

    party = SaveArray_Party_Get(fieldSystem->saveData);
    mon = Party_GetMonByIndex(party, idx);
    if (!MonIsInGameTradePoke(mon, tradeno)) {
        return 1;
    }

    capsule = GetMonData(mon, MON_DATA_CAPSULE, NULL);
    if (capsule != 0) {
        return 3;
    }

    n = 0;
    party_count = Party_GetCount(party);
    for (i = 0; i < party_count; i++) {
        cur_poke = Party_GetMonByIndex(party, i);
        if (GetMonData(cur_poke, MON_DATA_CHECKSUM_FAILED, NULL) != TRUE && GetMonData(cur_poke, MON_DATA_HP, NULL) != 0 && !GetMonData(cur_poke, MON_DATA_IS_EGG, NULL)) {
            n++;
        }
    }
    if (n < 2) {
        return 4;
    }

    heldItem = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
    if (heldItem != ITEM_NONE) {
        return 2;
    }

    return 0;
}

int NPCTradeApp_GetOfferedSpecies(NPCTradeAppData *work) {
    return work->trade_dat->give_species;
}

int NPCTradeApp_GetRequestedSpecies(NPCTradeAppData *work) {
    return work->trade_dat->ask_species;
}

int NPCTradeApp_GetUnusedFlag(NPCTradeAppData *work) {
    return work->trade_dat->unk_50;
}

void NPCTrade_ReceiveMonToSlot(FieldSystem *fieldSystem, NPCTradeAppData *work, int slot) {
    Party_SafeCopyMonToSlot_ResetUnkSub(SaveArray_Party_Get(fieldSystem->saveData), slot, work->mon);
    UpdatePokedexWithReceivedSpecies(fieldSystem->saveData, work->mon);
}

void NPCTrade_CreateTradeAnim(FieldSystem *fieldSystem, NPCTradeAppData *work, int slot, TRADE_ANIM_WORK *anim_work, Pokemon *my_mon_buf, Pokemon *trade_mon_buf) {
    Pokemon *my_poke;
    u32 time_of_day;

    my_poke = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), slot);
    _CreateTradeMon(work->mon, work->trade_dat, GetMonData(my_poke, MON_DATA_LEVEL, NULL), work->tradeno, fieldSystem->location->mapId, 1, work->heapId);
    CopyPokemonToPokemon(my_poke, my_mon_buf);
    CopyPokemonToPokemon(work->mon, trade_mon_buf);
    anim_work->my_boxmon = Mon_GetBoxMon(my_mon_buf);
    anim_work->trade_boxmon = Mon_GetBoxMon(trade_mon_buf);
    anim_work->trade_profile = work->profile;
    anim_work->is_ingame = 1;
    anim_work->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    time_of_day = Field_GetTimeOfDay(fieldSystem);
    if (time_of_day == RTC_TIMEOFDAY_MORN || time_of_day == RTC_TIMEOFDAY_DAY) {
        anim_work->time_of_day = 0;
    } else if (time_of_day == RTC_TIMEOFDAY_EVE) {
        anim_work->time_of_day = 1;
    } else {
        anim_work->time_of_day = 2;
    }
}

static String *_GetNpcTradeName(HeapID heapId, s32 msgno) {
    String *ret;
    MsgData *msgData;

    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0200_bin, heapId);
    ret = NewString_ReadMsgData(msgData, msgno);
    DestroyMsgData(msgData);
    return ret;
}

static void _CreateTradeMon(Pokemon *mon, NPCTrade *trade_dat, u32 level, u32 tradeno, u32 mapno, u32 met_level_strat, HeapID heapId) {
    String *name;
    u8 nickname_flag;
    u32 mapsec;
    int heapId_2;

    CreateMon(mon, trade_dat->give_species, level, 32, TRUE, trade_dat->pid, OT_ID_PRESET, trade_dat->otId);

    heapId_2 = (int)heapId;
    name = _GetNpcTradeName((HeapID)heapId_2, tradeno);
    SetMonData(mon, MON_DATA_NICKNAME_3, name);
    String_Delete(name);

    nickname_flag = TRUE;
    SetMonData(mon, MON_DATA_HAS_NICKNAME, &nickname_flag);

    SetMonData(mon, MON_DATA_HP_IV, &trade_dat->hpIv);
    SetMonData(mon, MON_DATA_ATK_IV, &trade_dat->atkIv);
    SetMonData(mon, MON_DATA_DEF_IV, &trade_dat->defIv);
    SetMonData(mon, MON_DATA_SPEED_IV, &trade_dat->speedIv);
    SetMonData(mon, MON_DATA_SPATK_IV, &trade_dat->spAtkIv);
    SetMonData(mon, MON_DATA_SPDEF_IV, &trade_dat->spDefIv);

    SetMonData(mon, MON_DATA_COOL, &trade_dat->cool);
    SetMonData(mon, MON_DATA_BEAUTY, &trade_dat->beauty);
    SetMonData(mon, MON_DATA_CUTE, &trade_dat->cute);
    SetMonData(mon, MON_DATA_SMART, &trade_dat->smart);
    SetMonData(mon, MON_DATA_TOUGH, &trade_dat->tough);

    SetMonData(mon, MON_DATA_HELD_ITEM, &trade_dat->heldItem);

    name = _GetNpcTradeName((HeapID)heapId_2, TRADE_MAX + tradeno);
    SetMonData(mon, MON_DATA_OT_NAME_2, name);
    String_Delete(name);

    SetMonData(mon, MON_DATA_MET_GENDER, &trade_dat->gender);
    SetMonData(mon, MON_DATA_GAME_LANGUAGE, &trade_dat->language);

    mapsec = MapHeader_GetMapSec(mapno);
    MonSetTrainerMemo(mon, NULL, met_level_strat, mapsec, heapId);

    CalcMonLevelAndStats(mon);
    GF_ASSERT(!MonIsShiny(mon));
}
