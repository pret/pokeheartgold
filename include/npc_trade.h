#ifndef POKEHEARTGOLD_NPC_TRADE_H
#define POKEHEARTGOLD_NPC_TRADE_H

#include "heap.h"
#include "trade_anim.h"
#include "script.h"

#define TRADE_MAX          13

typedef struct NPCTrade {
    int give_species;
    int hpIv;
    int atkIv;
    int defIv;
    int speedIv;
    int spAtkIv;
    int spDefIv;
    int ability;
    int otId;
    int cool;
    int beauty;
    int cute;
    int smart;
    int tough;
    int pid;
    int heldItem;
    int gender;
    int sheen;
    int language;
    int ask_species;
    int unk_50;
} NPCTrade; // size=0x54

typedef struct NPCTradeAppData {
    NPCTrade *trade_dat;
    Pokemon *mon;
    PlayerProfile *profile;
    u32 tradeno;
    HeapID heapId;
} NPCTradeAppData;

NPCTradeAppData *NPCTradeApp_Init(HeapID heapId, u32 tradeno);
void NPCTradeApp_Delete(NPCTradeAppData *work);
void NPCTrade_MakeAndGiveLoanMon(FieldSystem *fieldSystem, u8 tradeno, u8 level, u16 mapno);
Mail *NPCTrade_MakeKenyaMail(void);
int NPCTrade_CanGiveUpLoanMon(FieldSystem *fieldSystem, u8 tradeno, u8 idx);
int NPCTradeApp_GetOfferedSpecies(NPCTradeAppData *work);
int NPCTradeApp_GetRequestedSpecies(NPCTradeAppData *work);
int NPCTradeApp_GetUnusedFlag(NPCTradeAppData *work);
void NPCTrade_ReceiveMonToSlot(FieldSystem *fieldSystem, NPCTradeAppData *work, int slot);
void NPCTrade_CreateTradeAnim(FieldSystem *fieldSystem, NPCTradeAppData *work, int slot, TRADE_ANIM_WORK *anim_work, Pokemon *my_mon_buf, Pokemon *trade_mon_buf);

#endif //POKEHEARTGOLD_NPC_TRADE_H
