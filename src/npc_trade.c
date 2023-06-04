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

struct _NPC_TRADE_WORK {
    NPC_TRADE *trade_dat;
    Pokemon *mon;
    PLAYERPROFILE *profile;
    u32 tradeno;
    HeapID heapId;
};

static STRING *_GetNpcTradeName(HeapID heapId, s32 msgno);
static void _CreateTradeMon(Pokemon *mon, NPC_TRADE *trade_dat, u32 level, u32 tradeno, u32 mapno, u32 met_level_strat, HeapID heapId);

NPC_TRADE_WORK *NPCTrade_AllocWork(HeapID heapId, u32 tradeno) {
    NPC_TRADE_WORK *ret;
    u16 strbuf[128];

    GF_ASSERT(tradeno < TRADE_MAX);
    ret = AllocFromHeap(heapId, sizeof(NPC_TRADE_WORK));
    memset(ret, 0, sizeof(NPC_TRADE_WORK));
    ret->trade_dat = GfGfxLoader_LoadFromNarc(NARC_a_1_1_2, tradeno, FALSE, heapId, FALSE);
    ret->heapId = heapId;
    ret->tradeno = tradeno;
    ret->mon = AllocMonZeroed(heapId);
    ret->profile = PlayerProfile_New(heapId);
    PlayerProfile_init(ret->profile);
    {
        STRING *name;
        name = _GetNpcTradeName(heapId, tradeno + TRADE_MAX);
        CopyStringToU16Array(name, strbuf, 128);
        String_Delete(name);
    }
    Sav2_Profile_PlayerName_set(ret->profile, strbuf);
    PlayerProfile_SetTrainerGender(ret->profile, ret->trade_dat->gender);
    return ret;
}

void NPCTrade_DeleteWork(NPC_TRADE_WORK *work) {
    FreeToHeap(work->trade_dat);
    FreeToHeap(work->mon);
    FreeToHeap(work->profile);
    FreeToHeap(work);
}

void NPCTrade_MakeAndGiveLoanMon(FieldSystem *fsys, u8 tradeno, u8 level, u16 mapno) {
    PARTY *party;
    Pokemon *mon;
    NPC_TRADE *trade_dat;
    Pokemon *kenya;
    STRING *name;
    MAIL *mail;
    u8 mailno;

    mon = AllocMonZeroed(11);
    trade_dat = GfGfxLoader_LoadFromNarc(NARC_a_1_1_2, tradeno, FALSE, 11, TRUE);
    _CreateTradeMon(mon, trade_dat, level, tradeno, mapno, 7, 11);
    UpdatePokedexWithReceivedSpecies(fsys->savedata, mon);
    party = SavArray_PlayerParty_Get(fsys->savedata);
    AddMonToParty(party, mon);
    if (tradeno == 7) {
        kenya = GetPartyMonByIndex(party, GetPartyCount(party) - 1);
        name = _GetNpcTradeName(11, tradeno + TRADE_MAX);
        mailno = ItemToMailId(trade_dat->heldItem);
        mail = CreateKenyaMail(mon, mailno, trade_dat->gender, name, trade_dat->otId);
        SetMonData(kenya, MON_DATA_MAIL_STRUCT, mail);
        String_Delete(name);
        FreeToHeap(mail);
    }
    FreeToHeap(trade_dat);
    FreeToHeap(mon);
}

MAIL *NPCTrade_MakeKenyaMail(void) {
    Pokemon *mon;
    NPC_TRADE *trade_dat;
    STRING *name;
    MAIL *mail;
    u8 mailno;

    mon = AllocMonZeroed(11);
    trade_dat = GfGfxLoader_LoadFromNarc(NARC_a_1_1_2, 7, FALSE, 11, TRUE);
    _CreateTradeMon(mon, trade_dat, 20, 7, MAP_R35R0101, 7, 11);
    name = _GetNpcTradeName(11, 7 + TRADE_MAX);
    mailno = ItemToMailId(trade_dat->heldItem);
    mail = CreateKenyaMail(mon, mailno, trade_dat->gender, name, trade_dat->otId);
    String_Delete(name);
    FreeToHeap(trade_dat);
    FreeToHeap(mon);
    return mail;
}

int NPCTrade_CanGiveUpLoanMon(FieldSystem *fsys, u8 tradeno, u8 idx) {
    PARTY *party;
    Pokemon *mon, *cur_poke;
    u8 capsule;
    u16 heldItem;
    int i, n, party_count;

    party = SavArray_PlayerParty_Get(fsys->savedata);
    mon = GetPartyMonByIndex(party, idx);
    if (!MonIsInGameTradePoke(mon, tradeno)) {
        return 1;
    }

    capsule = GetMonData(mon, MON_DATA_CAPSULE, NULL);
    if (capsule != 0) {
        return 3;
    }

    n = 0;
    party_count = GetPartyCount(party);
    for (i = 0; i < party_count; i++) {
        cur_poke = GetPartyMonByIndex(party, i);
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

int NPCTradeWork_GetOfferedSpecies(NPC_TRADE_WORK *work) {
    return work->trade_dat->give_species;
}

int NPCTradeWork_GetRequestedSpecies(NPC_TRADE_WORK *work) {
    return work->trade_dat->ask_species;
}

int NPCTradeWork_GetUnusedFlag(NPC_TRADE_WORK *work) {
    return work->trade_dat->unk_50;
}

void NPCTrade_ReceiveMonToSlot(FieldSystem *fsys, NPC_TRADE_WORK *work, int slot) {
    Party_SafeCopyMonToSlot_ResetUnkSub(SavArray_PlayerParty_Get(fsys->savedata), slot, work->mon);
    UpdatePokedexWithReceivedSpecies(fsys->savedata, work->mon);
}

void NPCTrade_CreateTradeAnim(FieldSystem *fsys, NPC_TRADE_WORK *work, int slot, TRADE_ANIM_WORK *anim_work, Pokemon *my_mon_buf, Pokemon *trade_mon_buf) {
    Pokemon *my_poke;
    u32 time_of_day;

    my_poke = GetPartyMonByIndex(SavArray_PlayerParty_Get(fsys->savedata), slot);
    _CreateTradeMon(work->mon, work->trade_dat, GetMonData(my_poke, MON_DATA_LEVEL, NULL), work->tradeno, fsys->location->mapId, 1, work->heapId);
    CopyPokemonToPokemon(my_poke, my_mon_buf);
    CopyPokemonToPokemon(work->mon, trade_mon_buf);
    anim_work->my_boxmon = Mon_GetBoxMon(my_mon_buf);
    anim_work->trade_boxmon = Mon_GetBoxMon(trade_mon_buf);
    anim_work->trade_profile = work->profile;
    anim_work->is_ingame = 1;
    anim_work->options = Sav2_PlayerData_GetOptionsAddr(fsys->savedata);
    time_of_day = Field_GetTimeOfDay(fsys);
    if (time_of_day == RTC_TIMEOFDAY_MORN || time_of_day == RTC_TIMEOFDAY_DAY) {
        anim_work->time_of_day = 0;
    } else if (time_of_day == RTC_TIMEOFDAY_EVE) {
        anim_work->time_of_day = 1;
    } else {
        anim_work->time_of_day = 2;
    }
}

static STRING *_GetNpcTradeName(HeapID heapId, s32 msgno) {
    STRING *ret;
    MSGDATA *msgData;

    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0200_bin, heapId);
    ret = NewString_ReadMsgData(msgData, msgno);
    DestroyMsgData(msgData);
    return ret;
}

static void _CreateTradeMon(Pokemon *mon, NPC_TRADE *trade_dat, u32 level, u32 tradeno, u32 mapno, u32 met_level_strat, HeapID heapId) {
    STRING *name;
    u8 nickname_flag;
    u32 mapsec;
    int heapId_2;

    CreateMon(mon, trade_dat->give_species, level, 32, TRUE, trade_dat->pid, OT_ID_PRESET, trade_dat->otId);

    heapId_2 = heapId;
    name = _GetNpcTradeName(heapId_2, tradeno);
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

    name = _GetNpcTradeName(heapId_2, TRADE_MAX + tradeno);
    SetMonData(mon, MON_DATA_OT_NAME_2, name);
    String_Delete(name);

    SetMonData(mon, MON_DATA_MET_GENDER, &trade_dat->gender);
    SetMonData(mon, MON_DATA_GAME_LANGUAGE, &trade_dat->language);

    mapsec = MapHeader_GetMapSec(mapno);
    MonSetTrainerMemo(mon, NULL, met_level_strat, mapsec, heapId);

    CalcMonLevelAndStats(mon);
    GF_ASSERT(!MonIsShiny(mon));
}
