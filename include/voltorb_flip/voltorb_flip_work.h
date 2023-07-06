#ifndef POKEHEARTGOLD_VOLTORB_FLIP_WORK_H
#define POKEHEARTGOLD_VOLTORB_FLIP_WORK_H

#include "heap.h"
#include "list_menu_items.h"
#include "options.h"
#include "player_data.h"
#include "unk_0200CF18.h"
#include "bg_window.h"
#include "voltorb_flip/voltorb_flip_game.h"
#include "voltorb_flip/voltorb_flip_input.h"

typedef struct Ov122_021E70B8 {
    BgConfig *bgConfig;
    GameState *game;
    Ov122_021E8CFC *unk8;
    int unkC;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
} Ov122_021E70B8;

typedef struct Ov122_021E7888 {
    u8 unk0;
    u8 unk1[0x3];
} Ov122_021E7888;

typedef struct VoltorbFlipAppWork {
    HeapID heapId;
    OPTIONS *options;
    u16 *coins;
    u32 *unkC;
    PlayerProfile *profile;
    NARC *narc;
    BgConfig *bgConfig;
    void *unk1C;
    void *unk20;
    Window windows[17];
    LISTMENUITEM *menuItems[2];
    void *unk13C;
    String *string;
    Unk122_021E7C9C *unk144;
    void *unk148;
    UnkStruct_0200CF18 *unk14C[0xd];
    MsgData *msgData;
    MessageFormat *msgFmt;
    u16 unk188[10][8];
    u8 unk228;
    u8 unk229;
    u8 unk22A;
    u8 printerId;
    u16 payoutDisplay;
    u8 unk22E[0x2];
    int unk230;
    int unk234;
    int unk238;
    struct WorkflowEngine *workflow;
    struct Ov122_021E8CFC *unk240;
    GameState *game;
    Ov122_021E70B8 unk248;
    Ov122_021E7888 unk25C;
} VoltorbFlipAppWork;

#endif //POKEHEARTGOLD_VOLTORB_FLIP_WORK_H
