#ifndef POKEHEARTGOLD_VOLTORB_FLIP_DATA_H
#define POKEHEARTGOLD_VOLTORB_FLIP_DATA_H

#include "unk_0200CF18.h"
#include "unk_020183F0.h"
#include "bg_window.h"

typedef struct Ov122_021E9278 {
    u8 unk0[5][2];
    Ov122_021E9282 unkA;
} Ov122_021E9278;

typedef struct MsgNoList {
    const u8 *msgNos;
    int size;
} MsgNoList;

typedef struct Ov122_021E6C2C {
    int unk0;
    int unk4;
    int unk8;
} Ov122_021E6C2C;

typedef struct BgTemplates {
    BgTemplate unk0[6];
} BgTemplates;

const u8 sMainMenuMsgNos[];
const u8 sGameInfoMsgNos[];
const u8 ov122_021E9270[];

#endif //POKEHEARTGOLD_VOLTORB_FLIP_DATA_H
