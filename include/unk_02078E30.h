#ifndef POKEHEARTGOLD_UNK_02078E30_H
#define POKEHEARTGOLD_UNK_02078E30_H

#include "bag.h"
#include "mail.h"
#include "overlay_94.h"
#include "party_menu.h"
#include "unk_0202E41C.h"

typedef struct PartyMenuArgs {
    Party *party;
    Bag *bag;
    MAILBOX *mailbox;
    Options *options;
    UnkStruct_0202E474 *unk10;
    int unk_14;
    FieldMoveCheckData *unk_18;
    FieldSystem *fieldSystem;
    u32 *unk20;
    u8 unk_24;
    u8 unk_25;
    u8 unk_26;
    u8 unk_27;
    u16 itemId;
    u16 unk2A;
    u8 unk2C;
    u8 filler_2D[3];
    u8 unk_30[3];
    u8 filler_33[3];
    u8 unk_36_0:4;
    u8 unk_36_4:4;
    u8 unk_37;
    int unk_38;
    u16 unk_3C;
    int unk_40;
} PartyMenuArgs;

extern const OVY_MGR_TEMPLATE gOverlayTemplate_PartyMenu;

void sub_0207991C(PartyMenuStruct *unkPtr, int a1);
u32 sub_0207CA9C(void);
u32 sub_0207CAA0(void);
u32 sub_0207CAA4(void);
u32 sub_0207CAA8(void);

#endif //POKEHEARTGOLD_UNK_02078E30_H
