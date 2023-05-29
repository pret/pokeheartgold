#ifndef POKEHEARTGOLD_NPC_TRADE_H
#define POKEHEARTGOLD_NPC_TRADE_H

#include "heap.h"
#include "trade_anim.h"
#include "script.h"

#define TRADE_MAX          13

typedef struct NPC_TRADE {
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
} NPC_TRADE; // size=0x54

NPC_TRADE_WORK *NPCTrade_AllocWork(HeapID heapId, u32 tradeno);
void NPCTrade_DeleteWork(NPC_TRADE_WORK *work);
void NPCTrade_MakeAndGiveLoanMon(FieldSystem *fsys, u8 tradeno, u8 level, u16 mapno);
MAIL *NPCTrade_MakeKenyaMail(void);
int NPCTrade_CanGiveUpLoanMon(FieldSystem *fsys, u8 tradeno, u8 idx);
int NPCTradeWork_GetOfferedSpecies(NPC_TRADE_WORK *work);
int NPCTradeWork_GetRequestedSpecies(NPC_TRADE_WORK *work);
int NPCTradeWork_GetUnusedFlag(NPC_TRADE_WORK *work);
void NPCTrade_ReceiveMonToSlot(FieldSystem *fsys, NPC_TRADE_WORK *work, int slot);
void NPCTrade_CreateTradeAnim(FieldSystem *fsys, NPC_TRADE_WORK *work, int slot, TRADE_ANIM_WORK *anim_work, Pokemon *my_mon_buf, Pokemon *trade_mon_buf);

#endif //POKEHEARTGOLD_NPC_TRADE_H
