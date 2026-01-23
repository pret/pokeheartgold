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
#include "yes_no_prompt.h"

typedef struct VFCardFlipAnim {
    BgConfig *bgConfig;
    VoltorbFlipGameState *game;
    VoltorbFlipInputHandler *inputHandler;
    int mode;
    u8 step;
    u8 cursorPos;
    u8 frame;
    u8 row;
} VFCardFlipAnim;

typedef struct Ov122_021E7888 {
    u8 unk0;
} Ov122_021E7888;

typedef struct VoltorbFlipAppData {
    enum HeapID heapID;
    Options *options;
    u16 *coins;
    MenuInputStateMgr *menuInputStatePtr;
    PlayerProfile *profile;
    NARC *narc;
    BgConfig *bgConfig;
    void *listMenuSpawner;
    TouchscreenListMenu *menu;
    Window windows[17];
    LISTMENUITEM *menuItems[2];
    YesNoPrompt *yesNoPrompt;
    String *string;
    SpriteSystem *spriteRenderer;
    SpriteManager *spriteGfxHandler;
    ManagedSprite *sprites[13];
    MsgData *msgData;
    MessageFormat *msgFmt;
    u16 unk188[10][8];
    u8 menuInputState;
    u8 unk229;
    u8 unk22A;
    u8 printerId;
    u16 payoutDisplay;
    BOOL hasPlayedOneLeve;
    BOOL printedCanGetMoreCoinsMessage;
    BOOL memoOpen;
    struct VoltorbFlipTaskEngine *workflow;
    VoltorbFlipInputHandler *inputHandler;
    VoltorbFlipGameState *game;
    VFCardFlipAnim cardFlipControl;
    u8 screenIsDimmed;
} VoltorbFlipAppData;

#endif // POKEHEARTGOLD_VOLTORB_FLIP_WORK_H
