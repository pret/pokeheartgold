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

typedef struct _NPC_TRADE_WORK NPC_TRADE_WORK;

NPC_TRADE_WORK *ov23_022598C0(HeapID heapId, u32 tradeno);
void ov23_02259944(NPC_TRADE_WORK *work);
void ov23_02259964(FieldSystem *fsys, u8 tradeno, u8 level, u16 mapno);
MAIL *ov23_02259A24(void);
int ov23_02259AA0(FieldSystem *fsys, u8 tradeno, u8 idx);
int ov23_02259B50(NPC_TRADE_WORK *work);
int ov23_02259B58(NPC_TRADE_WORK *work);
int ov23_02259B60(NPC_TRADE_WORK *work);
void ov23_02259B68(FieldSystem *fsys, NPC_TRADE_WORK *work, int slot);
void ov23_02259B88(FieldSystem *fsys, NPC_TRADE_WORK *work, int slot, TRADE_ANIM_WORK *anim_work, POKEMON *my_mon_buf, POKEMON *trade_mon_buf);

#endif //POKEHEARTGOLD_NPC_TRADE_H
