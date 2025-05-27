#ifndef POKEHEARTGOLD_VOLTORB_FLIP_WORK_H
#define POKEHEARTGOLD_VOLTORB_FLIP_WORK_H

#include "voltorb_flip/voltorb_flip_game.h"
#include "voltorb_flip/voltorb_flip_input.h"

#include "bg_window.h"
#include "heap.h"
#include "list_menu_items.h"
#include "menu_input_state.h"
#include "options.h"
#include "player_data.h"
#include "sprite_system.h"
#include "touchscreen_list_menu.h"

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
    Options *options;
    u16 *coins;
    MenuInputStateMgr *menuInputStatePtr;
    PlayerProfile *profile;
    NARC *narc;
    BgConfig *bgConfig;
    void *unk1C;
    TouchscreenListMenu *menu;
    Window windows[17];
    LISTMENUITEM *menuItems[2];
    void *unk13C;
    String *string;
    SpriteSystem *spriteRenderer;
    SpriteManager *spriteGfxHandler;
    ManagedSprite *unk14C[0xd];
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

#endif // POKEHEARTGOLD_VOLTORB_FLIP_WORK_H
