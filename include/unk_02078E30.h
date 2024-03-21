#ifndef POKEHEARTGOLD_UNK_02078E30_H
#define POKEHEARTGOLD_UNK_02078E30_H

#include "bag.h"
#include "mail.h"
#include "overlay_94.h"
#include "unk_0202E41C.h"

typedef struct PartyMenuArgs {
    Party *party;
    Bag *bag;
    MAILBOX *mailbox;
    Options *options;
    UnkStruct_0202E474 *unk10;
    int unk_14;
    int unk_18;
    FieldSystem *fieldSystem;
    u32 *unk20;
    u8 unk_24;
    u8 unk_25;
    u8 unk_26;
    u8 unk_27;
    u16 unk28;
    u8 unk2A[0x6];
    u8 unk_30[3];
    u8 filler_33[3];
    u8 unk_36_0:4;
    u8 unk_36_4:4;
    u8 unk_37;
    u8 filler_38[0xC];
} PartyMenuArgs;

extern const OVY_MGR_TEMPLATE gOverlayTemplate_PartyMenu;

void sub_0207991C(PartyMenuStruct *unkPtr, int a1);
u32 sub_0207CA9C(void);
u32 sub_0207CAA0(void);
u32 sub_0207CAA4(void);
u32 sub_0207CAA8(void);

#endif //POKEHEARTGOLD_UNK_02078E30_H
