#include "voltorb_flip/voltorb_flip.h"

#include "global.h"

#include "constants/game_stats.h"
#include "constants/sndseq.h"

#include "application/voltorb_flip.naix"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0039.h"
#include "voltorb_flip/voltorb_flip_game.h"
#include "voltorb_flip/voltorb_flip_input.h"
#include "voltorb_flip/voltorb_flip_internal.h"
#include "voltorb_flip/voltorb_flip_work.h"
#include "voltorb_flip/voltorb_flip_workflow.h"

#include "bg_window.h"
#include "brightness.h"
#include "coins.h"
#include "font.h"
#include "game_stats.h"
#include "gf_gfx_loader.h"
#include "list_menu_items.h"
#include "math_util.h"
#include "menu_input_state.h"
#include "message_format.h"
#include "options.h"
#include "overlay_manager.h"
#include "render_text.h"
#include "render_window.h"
#include "sound_02004A44.h"
#include "sprite.h"
#include "sprite_system.h"
#include "system.h"
#include "text.h"
#include "touchscreen.h"
#include "touchscreen_list_menu.h"
#include "unk_02005D10.h"
#include "unk_02009D48.h"
#include "unk_0200FA24.h"
#include "yes_no_prompt.h"

typedef enum CoinDisplay {
    COIN_DISPLAY_TOTAL,
    COIN_DISPLAY_PAYOUT,
} CoinDisplay;

#define MEMO_VOLTORB (1 << 0)
#define MEMO_ONE     (1 << 1)
#define MEMO_TWO     (1 << 2)
#define MEMO_THREE   (1 << 3)

#define wMain                     windows[0]
#define wSmall                    windows[1]
#define wMemo                     windows[2]
#define wQuit                     windows[3]
#define wCurrentLevel             windows[4]
#define wFlipCardsAndCollectCoins windows[5]
#define wx1x2x3                   windows[6]
#define wGameOver                 windows[7]
#define wCollectedCoins           windows[8]
#define wPayout                   windows[9]
#define wTutorialQuit             windows[10]
#define wTutorialIfYouFlipCards   windows[11]
#define wTutorialIfYouSelectQuit  windows[12]
#define wTutorialIfYouFindVoltorb windows[13]
#define wHint                     windows[14]
#define wAboutMemoOpen            windows[15]
#define wAboutMemoTouchOpen       windows[16]

typedef void (*RenderScreenCB)(VoltorbFlipAppWork *a0);

typedef struct MsgNoList {
    const u8 *msgNos;
    int size;
} MsgNoList;

typedef struct Ov122_021E6C2C {
    int unk0;
    int unk4;
    int unk8;
} Ov122_021E6C2C;

static void RenderCoinPayoutScreen(VoltorbFlipAppWork *);
static void RenderHowToPlayScreen(VoltorbFlipAppWork *);
static void RenderHintScreen(VoltorbFlipAppWork *);
static void RenderAboutMemoScreen(VoltorbFlipAppWork *);
static BOOL PrintAndAwaitMessage(WorkflowEngine *, VoltorbFlipAppWork *, int);
static BOOL TutorialScreenTransition(WorkflowEngine *, VoltorbFlipAppWork *, RenderScreenCB);
static BOOL ov122_021E5B5C(WorkflowEngine *, VoltorbFlipAppWork *);
static BOOL AddCoinsToPayout(VoltorbFlipAppWork *);
static BOOL AwardPayoutToPlayer(VoltorbFlipAppWork *);
static void ov122_021E6B38(VoltorbFlipAppWork *);
static void PrintCoins(VoltorbFlipAppWork *, CoinDisplay, int);
static void RenderCardMemo(VoltorbFlipAppWork *, int, int);
static void PrintBoardVoltorbs(VoltorbFlipAppWork *);
static void PrintBoardPoints(VoltorbFlipAppWork *);
static int ov122_021E6E10(u8, u8);
static void ov122_021E6E34(u16 *, int);
static void ov122_021E6E60(BgConfig *, VoltorbFlipGameState *, int, int);
static void ov122_021E6F04(BgConfig *, VoltorbFlipGameState *, int, int);
static void ov122_021E6F9C(Ov122_021E70B8 *);
static BOOL ov122_021E6FB0(Ov122_021E70B8 *);
static void ov122_021E6FE4(Ov122_021E70B8 *);
static BOOL ov122_021E7008(Ov122_021E70B8 *);
static void ov122_021E703C(Ov122_021E70B8 *);
static void PrintBoardVoltorbsAndPoints(VoltorbFlipAppWork *);
static void ov122_021E70B8(Ov122_021E70B8 *, int, int, VoltorbFlipAppWork *);
static BOOL ov122_021E7168(Ov122_021E70B8 *);
static void VoltorbFlip_AnimateOpenMenu(VoltorbFlipAppWork *);
static void AnimateCloseMenu(VoltorbFlipAppWork *);
static void ov122_021E7274(VoltorbFlipAppWork *, BOOL);
static void ov122_021E72D0(VoltorbFlipAppWork *);
static BOOL TryToggleCardMemo(VoltorbFlipAppWork *, int, int);
static void VoltorbFlip_CreateListMenuSpawnerAndItems(VoltorbFlipAppWork *);
static void VoltorbFlip_DestroyListMenuSpawnerAndItems(VoltorbFlipAppWork *);
static void VoltorbFlip_CreateListMenu(VoltorbFlipAppWork *, int);
static int VoltorbFlip_HandleListMenuInput(VoltorbFlipAppWork *);
static void VoltorbFlip_RenderTopScreen(VoltorbFlipAppWork *);
static void VoltorbFlip_AddWindows(VoltorbFlipAppWork *);
static void VoltorbFlip_RemoveWindows(VoltorbFlipAppWork *);
static void PaintMessageOnWindow(VoltorbFlipAppWork *, u8, u8, Window *, u8, u8);
static void PrintMessageOnWindow(VoltorbFlipAppWork *, FontID, u8, Window *, u8, u8, u32);
static void PrintMessageToSmallWindow(VoltorbFlipAppWork *, int);
static void VoltorbFlip_PrintTextWindow(VoltorbFlipAppWork *, int, int);
static BOOL IsPrinterFinished(VoltorbFlipAppWork *);
static void FormatGameLevel(VoltorbFlipAppWork *, int);
static void ov122_021E7888(u8 *);
static void ov122_021E78B4(u8 *);
static void ov122_021E78DC(u8 *);
static void ov122_021E7904(u8 *);
static void VoltorbFlip_InitBgs(VoltorbFlipAppWork *);
static void VoltorbFlip_UnloadBgs(VoltorbFlipAppWork *);
static void VoltorbFlip_LoadBgGfx(VoltorbFlipAppWork *);
static void VoltorbFlip_CreateSpriteSystem(VoltorbFlipAppWork *);
static void VoltorbFlip_FreeSpriteSystem(VoltorbFlipAppWork *);
static void VoltorbFlip_LoadObjectGfx(VoltorbFlipAppWork *);
static ManagedSprite *VoltorbFlip_CreateSprite_Main(SpriteSystem *, SpriteManager *, u16, u16, u16, u16);
static ManagedSprite *VoltorbFlip_CreateSprite_Sub(SpriteSystem *, SpriteManager *, u16, u16, u16, u16);
static void VoltorbFlip_CreateSprites(VoltorbFlipAppWork *);
static void VoltorbFlip_DeleteSprites(VoltorbFlipAppWork *);
static void VoltorbFlip_Sprite_SetAnimCtrlTime(Sprite *, fx32);
static BOOL ov122_021E7F70(VoltorbFlipAppWork *);
static CardType VoltorbFlip_GetSelectedCardType(VoltorbFlipAppWork *);
static int MemoFlagToIdx(int);
static void ov122_021E8004(VoltorbFlipAppWork *);
static void SetGXBanks(void);
static void ov122_021E8068(void);
static void ov122_021E8094(OverlayManager *);
static void FreeOverlayData(OverlayManager *);

const u8 sMainMenuMsgNos[] = { msg_0039_00017, msg_0039_00018, msg_0039_00019 };
const u8 sGameInfoMsgNos[] = { msg_0039_00021, msg_0039_00022, msg_0039_00023, msg_0039_00024 };

const u8 ov122_021E9270[] = {
    GF_BG_LYR_MAIN_0,
    GF_BG_LYR_MAIN_1,
    GF_BG_LYR_MAIN_2,
    GF_BG_LYR_MAIN_3,
    GF_BG_LYR_SUB_0,
    GF_BG_LYR_SUB_1,
};

const u8 ov122_021E9278[5][2] = {
    { 0x77, 0x17 },
    { 0x74, 0x14 },
    { 0x71, 0x11 },
    { 0x6E, 0x0E },
    { 0x6B, 0x0B },
};

const TouchscreenListMenuTemplate sListMenuTemplate = {
    1,
    1,
    0,
    GF_BG_LYR_MAIN_3,
    11,
    0,
    0,
    58,
    31,
    104,
};

const u16 ov122_021E92A0[] = {
    0x00A0,
    0x00A1,
    0x00C0,
    0x00C1,
    0x00E0,
    0x00E1,
    0x0100,
    0x0101,
};

const MsgNoList sMenuMsgNos[] = {
    { sMainMenuMsgNos, NELEMS(sMainMenuMsgNos) },
    { sGameInfoMsgNos, NELEMS(sGameInfoMsgNos) },
};

const struct GraphicsModes sVoltorbFlipBgModeSet = {
    GX_DISPMODE_GRAPHICS,
    GX_BGMODE_0,
    GX_BGMODE_0,
    GX_BG0_AS_2D,
};

const u8 ov122_021E92B0[4][4] = {
    // memoOffAnim, memoOnAnim, spriteID, memoMask
    { 12, 8,  VF_SPRITE_TOGGLE_MEMO_VOLTORB, MEMO_VOLTORB },
    { 15, 11, VF_SPRITE_TOGGLE_MEMO_ONE,     MEMO_ONE     },
    { 14, 10, VF_SPRITE_TOGGLE_MEMO_TWO,     MEMO_TWO     },
    { 13, 9,  VF_SPRITE_TOGGLE_MEMO_THREE,   MEMO_THREE   },
};

const OamCharTransferParam sOamCharTransferParam = {
    0x00000000,
    0x00020000,
    0x00004000,
    GX_OBJVRAMMODE_CHAR_1D_32K,
    GX_OBJVRAMMODE_CHAR_1D_32K,
};

const SpriteResourceCountsListUnion sResourceCounts = { 2, 2, 2, 2, 0, 0 };

const OamManagerParam sOamManagerParam = { 0, 126, 0, 32, 1, 126, 0, 32 };

const GraphicsBanks sVoltorbFlipGraphicsBanks = {
    GX_VRAM_BG_128_B,
    GX_VRAM_BGEXTPLTT_NONE,
    GX_VRAM_SUB_BG_128_C,
    GX_VRAM_SUB_BGEXTPLTT_NONE,
    GX_VRAM_OBJ_128_A,
    GX_VRAM_OBJEXTPLTT_NONE,
    GX_VRAM_SUB_OBJ_16_I,
    GX_VRAM_SUB_OBJEXTPLTT_NONE,
    GX_VRAM_TEX_NONE,
    GX_VRAM_TEXPLTT_NONE,
};

const Ov122_021E6C2C ov122_021E9344[4] = {
    { 0x00, 0x00, 0x21 },
    { 0x02, 0x00, 0x22 },
    { 0x00, 0x02, 0x23 },
    { 0x02, 0x02, 0x24 },
};

const ManagedSpriteTemplate sSpriteTemplate_Sub = {
    0,
    0,
    0,
    0,
    0,
    0xFFFF,
    NNS_G2D_VRAM_TYPE_2DSUB,
    {
      1,
      1,
      1,
      1,
      0,
      0,
      },
    0,
    0,
};

const ManagedSpriteTemplate sSpriteTemplate_Main = {
    0,
    0,
    0,
    0,
    0,
    0xFFFF,
    NNS_G2D_VRAM_TYPE_2DMAIN,
    {
      0,
      0,
      0,
      0,
      0,
      0,
      },
    3,
    0,
};

const WindowTemplate sVoltorbFlipWindowTemplates[17] = {
    {
     .bgId = 0x03,
     .left = 0x02,
     .top = 0x13,
     .width = 0x1B,
     .height = 0x04,
     .palette = 0x0C,
     .baseTile = 0x00A2,

     },
    {
     .bgId = 0x03,
     .left = 0x02,
     .top = 0x15,
     .width = 0x1B,
     .height = 0x02,
     .palette = 0x0C,
     .baseTile = 0x00A2,

     },
    {
     .bgId = 0x01,
     .left = 0x19,
     .top = 0x04,
     .width = 0x06,
     .height = 0x06,
     .palette = 0x0E,
     .baseTile = 0x010E,

     },
    {
     .bgId = 0x01,
     .left = 0x19,
     .top = 0x15,
     .width = 0x06,
     .height = 0x02,
     .palette = 0x0E,
     .baseTile = 0x0132,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x01,
     .width = 0x1E,
     .height = 0x02,
     .palette = 0x0C,
     .baseTile = 0x0001,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x03,
     .width = 0x1E,
     .height = 0x02,
     .palette = 0x0C,
     .baseTile = 0x003D,

     },
    {
     .bgId = 0x05,
     .left = 0x0D,
     .top = 0x06,
     .width = 0x12,
     .height = 0x03,
     .palette = 0x0C,
     .baseTile = 0x0079,

     },
    {
     .bgId = 0x05,
     .left = 0x0D,
     .top = 0x0A,
     .width = 0x12,
     .height = 0x03,
     .palette = 0x0C,
     .baseTile = 0x00AF,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x0E,
     .width = 0x13,
     .height = 0x04,
     .palette = 0x0C,
     .baseTile = 0x00E5,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x13,
     .width = 0x13,
     .height = 0x04,
     .palette = 0x0C,
     .baseTile = 0x0131,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x0F,
     .width = 0x07,
     .height = 0x02,
     .palette = 0x0D,
     .baseTile = 0x0001,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x05,
     .width = 0x1E,
     .height = 0x06,
     .palette = 0x0C,
     .baseTile = 0x000F,

     },
    {
     .bgId = 0x05,
     .left = 0x0A,
     .top = 0x0E,
     .width = 0x15,
     .height = 0x04,
     .palette = 0x0C,
     .baseTile = 0x00C3,

     },
    {
     .bgId = 0x05,
     .left = 0x0A,
     .top = 0x13,
     .width = 0x15,
     .height = 0x04,
     .palette = 0x0C,
     .baseTile = 0x0117,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x11,
     .width = 0x1E,
     .height = 0x06,
     .palette = 0x0C,
     .baseTile = 0x0001,

     },
    {
     .bgId = 0x05,
     .left = 0x02,
     .top = 0x07,
     .width = 0x06,
     .height = 0x06,
     .palette = 0x0D,
     .baseTile = 0x0001,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x0F,
     .width = 0x1E,
     .height = 0x08,
     .palette = 0x0C,
     .baseTile = 0x0025,

     },
};

static void RenderCoinPayoutScreen(VoltorbFlipAppWork *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 5);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000006_NSCR_lz, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, work->heapID);

    int payout = VoltorbFlipGameState_GetGamePayout(work->game);
    u16 coins = (u32)Coins_GetValue(work->coins);

    PrintCoins(work, COIN_DISPLAY_PAYOUT, payout);
    PrintCoins(work, COIN_DISPLAY_TOTAL, coins);

    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_11], 0);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_12], 0);

    VoltorbFlip_RenderTopScreen(work);
}

static void RenderHowToPlayScreen(VoltorbFlipAppWork *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 5);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000008_NSCR_lz, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, work->heapID);

    // "Quit" (on blue button)
    PaintMessageOnWindow(work, 4, msg_0039_00008, &work->wTutorialQuit, 0, 0);
    // "If you flip all the cards in this order..."
    PaintMessageOnWindow(work, 0, msg_0039_00011, &work->wTutorialIfYouFlipCards, 0, 0);
    // "If you select quit, you'll keep those..."
    PaintMessageOnWindow(work, 0, msg_0039_00012, &work->wTutorialIfYouSelectQuit, 0, 0);
    // "But if you find Voltorb, you'll lose all..."
    PaintMessageOnWindow(work, 0, msg_0039_00013, &work->wTutorialIfYouFindVoltorb, 0, 0);
}

static void RenderHintScreen(VoltorbFlipAppWork *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 5);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000007_NSCR_lz, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, work->heapID);

    // "By looking at the numbers on the sides of..."
    PaintMessageOnWindow(work, 0, msg_0039_00009, &work->wHint, 0, 0);
}

static void RenderAboutMemoScreen(VoltorbFlipAppWork *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 5);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000009_NSCR_lz, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, work->heapID);

    // "Open Memo" (text in button)
    PaintMessageOnWindow(work, 4, msg_0039_00006, &work->wAboutMemoOpen, 0, 0);
    // "Touch 'Open Memo' to open the Memo Window..."
    PaintMessageOnWindow(work, 0, msg_0039_00010, &work->wAboutMemoTouchOpen, 0, 0);

    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_11], 1);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_12], 1);
}

static BOOL PrintAndAwaitMessage(WorkflowEngine *workflow, VoltorbFlipAppWork *work, int msgNo) {
    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        ov122_021E7888(&work->unk25C);
        VoltorbFlip_PrintTextWindow(work, msgNo, 1);
        VoltorbFlipWorkflow_IncrementTaskState(workflow);
        break;
    case 1:
        if (IsPrinterFinished(work)) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

// Applies the wiper palette fade and calls callback to render the screen.
static BOOL TutorialScreenTransition(WorkflowEngine *workflow, VoltorbFlipAppWork *work, RenderScreenCB cb) {
    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        BeginNormalPaletteFade(4, 20, 20, RGB_BLACK, 4, 1, work->heapID);
        VoltorbFlipWorkflow_IncrementTaskState(workflow);
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            cb(work);
            BeginNormalPaletteFade(4, 21, 21, RGB_BLACK, 4, 1, work->heapID);
            VoltorbFlipWorkflow_IncrementTaskState(workflow);
        }
        break;
    case 2:
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

static BOOL ov122_021E5B5C(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        if (work->unk238) {
            return TRUE;
        }
        VoltorbFlip_AnimateOpenMenu(work);
        VoltorbFlipWorkflow_IncrementTaskState(workflow);
        break;
    case 1:
        if (ManagedSprite_IsAnimated(work->sprites[VF_SPRITE_04]) == 0) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_InitChecks_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    u32 coins = Coins_GetValue(work->coins);
    if (coins >= 50000) {
        // "You’ve gathered 50,000 Coins. You cannot gather..."
        VoltorbFlip_PrintTextWindow(work, msg_0039_00014, 1);
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_TERMINATE);
    } else {
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_NEW_ROUND);
    }
    return TRUE;
}

BOOL VoltorbFlipWorkflow_InitChecks_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    if (!IsPrinterFinished(work)) {
        return FALSE;
    }
    return TRUE;
}

BOOL VoltorbFlipWorkflow_NewRound_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    VoltorbFlipGameState_NewBoard(work->game);
    VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_SELECT_MAIN_MENU);

    if (!work->hasPlayedOneLeve) {
        return TRUE;
    }

    int levelDiff = VoltorbFlipGameState_CalculateLevelsGained(work->game);
    FormatGameLevel(work, 0);
    // "VOLTORB Flip Lv. {}"
    PrintMessageOnWindow(work, 0, msg_0039_00000, &work->wCurrentLevel, 0, 0, 0x000f0100);
    BgCommitTilemapBufferToVram(work->bgConfig, 5);
    Sound_SetSceneAndPlayBGM(64, 0, 0);

    if (levelDiff != 0) {
        if (levelDiff > 0) {
            ov122_021E7888(&work->unk25C);
            // "Advanced to Game Lv..."
            VoltorbFlip_PrintTextWindow(work, msg_0039_00041, 1);
            PlaySE(SEQ_SE_GS_SLOT01);
        } else {
            ov122_021E7888(&work->unk25C);
            // "Dropped to Game Lv..."
            VoltorbFlip_PrintTextWindow(work, msg_0039_00043, 1);
            PlaySE(SEQ_SE_GS_SLOT03);
        }
    }
    return TRUE;
}

BOOL VoltorbFlipWorkflow_NewRound_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    if (!work->hasPlayedOneLeve) {
        return TRUE;
    }

    switch (state) {
    case 0: {
        BOOL printerFinished = IsPrinterFinished(work);
        if (printerFinished) {
            if (VoltorbFlipGameState_CalculateLevelsGained(work->game) > 0) {
                if (work->printedCanGetMoreCoinsMessage) {
                    return TRUE;
                }
                work->printedCanGetMoreCoinsMessage = TRUE;
                // "Congratulations! You can receive even more Coins in the next..."
                VoltorbFlip_PrintTextWindow(work, msg_0039_00042, 1);
                VoltorbFlipWorkflow_IncrementTaskState(workflow);
            } else {
                return TRUE;
            }
        }
        break;
    }
    case 1:
        if (IsPrinterFinished(work)) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_NewRound_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        BgClearTilemapBufferAndCommit(work->bgConfig, 3);
        VoltorbFlipWorkflow_IncrementTaskState(workflow);
        // fallthrough
    case 1:
        if (!IsSEPlaying(SEQ_SE_GS_SLOT01) || !IsSEPlaying(SEQ_SE_GS_SLOT02)) {
            Sound_SetSceneAndPlayBGM(70, 0, 0);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_SelectMainMenu_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int msgNo;

    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    if (state == 0) {
        ov122_021E7888(&work->unk25C);
    }

    FormatGameLevel(work, 0);
    if (work->hasPlayedOneLeve) {
        msgNo = msg_0039_00016;
    } else {
        msgNo = msg_0039_00015;
    }

    return PrintAndAwaitMessage(workflow, work, msgNo);
}

BOOL VoltorbFlipWorkflow_SelectMainMenu_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    VoltorbFlip_CreateListMenu(work, 0);
    return TRUE;
}

BOOL VoltorbFlipWorkflow_SelectMainMenu_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int var1 = VoltorbFlip_HandleListMenuInput(work);
    switch (var1 + 2) {
    case 2: // Play
        ov122_021E78B4(&work->unk25C);
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_RENDER_BOARD);
        return TRUE;
    case 1:
        break;
    case 3: // Game Info
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_SELECT_GAME_INFO);
        return TRUE;
    case 0:
    case 4: // Quit
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_TERMINATE);
        return TRUE;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_SelectGameInfo_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    // "Which set of info?"
    return PrintAndAwaitMessage(workflow, work, msg_0039_00020);
}

BOOL VoltorbFlipWorkflow_SelectGameInfo_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    VoltorbFlip_CreateListMenu(work, 1);
    return TRUE;
}

BOOL VoltorbFlipWorkflow_SelectGameInfo_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int var1 = VoltorbFlip_HandleListMenuInput(work);
    switch (var1 + 2) {
    case 1:
        break;
    case 2:
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_HOW_TO_PLAY);
        return TRUE;
    case 3:
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_HINT);
        return TRUE;
    case 4:
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_ABOUT_MEMO);
        return TRUE;
    case 0:
    case 5:
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_SELECT_MAIN_MENU);
        return TRUE;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_HowToPlayScreen_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    return TutorialScreenTransition(workflow, work, RenderHowToPlayScreen);
}

BOOL VoltorbFlipWorkflow_HowToPlayScreen_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    // "VOLTORB Flip is a game in which you flip over..."
    return PrintAndAwaitMessage(workflow, work, msg_0039_00025);
}

BOOL VoltorbFlipWorkflow_HintScreen_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    return TutorialScreenTransition(workflow, work, RenderHintScreen);
}

BOOL VoltorbFlipWorkflow_HintScreen_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    // "The numbers at the side of the board give..."
    return PrintAndAwaitMessage(workflow, work, msg_0039_00026);
}

BOOL VoltorbFlipWorkflow_AboutMemoScreen_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    return TutorialScreenTransition(workflow, work, RenderAboutMemoScreen);
}

BOOL VoltorbFlipWorkflow_AboutMemoScreen_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    // "Select 'Open Memo' to mark the cards. You..."
    return PrintAndAwaitMessage(workflow, work, msg_0039_00027);
}

BOOL VoltorbFlipWorkflow_TutorialScreens_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    if (TutorialScreenTransition(workflow, work, RenderCoinPayoutScreen)) {
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_SELECT_GAME_INFO);
        return TRUE;
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_RenderBoard_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, GF_BG_LYR_MAIN_3);
    PrintBoardVoltorbsAndPoints(work);
    ov122_021E8D8C(work->inputHandler, TRUE);
    VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
    return TRUE;
}

BOOL VoltorbFlipWorkflow_BoardInteraction_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int input = VoltorbFlipInputHandler_HandleInput(work->inputHandler);
    switch (input) {
    case 0:
        break;
    case 1: {
        int cardId = VoltorbFlipInputHandler_GetCursorPos(work->inputHandler);
        if (VoltorbFlipGameState_IsCardFlipped(work->game, cardId)) {
            PlaySE(SEQ_SE_DP_BOX03);
        } else {
            VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_FLIP_CARD);
            return TRUE;
        }
        break;
    }
    case 4:
        PlaySE(SEQ_SE_DP_SELECT);
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_02], 6);
        if (ov122_021E8E70(work->inputHandler)) {
            VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_UNK_13); // open memo
        } else {
            VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_UNK_14);
        }
        return TRUE;
    case 2:
    case 3:
        PlaySE(SEQ_SE_DP_DECIDE);
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_03], 3);
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_QUIT_ROUND);
        return TRUE;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_BoardInteraction_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    if (ov122_021E7F70(work)) {
        return TRUE;
    }
    return FALSE;
}

// If the selected row and column both have Voltorbs and if at least 75% of the
// unflipped cards in the selected row or column are Voltorbs, play suspenseful
// music.
BOOL VoltrbFlipWorkflow_CardFlipEffect_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    switch (state) {
    case 0: {
        int cardId = VoltorbFlipInputHandler_GetCursorPos(work->inputHandler);
        s16 col = cardId % 5;
        s16 row = cardId / 5;

        // Unused
        VoltorbFlipGameState_GetMultiplierCardsFlipped(work->game);
        VoltorbFlipGameState_GetMultiplierCards(work->game);

        int voltorbsInCol = VoltorbFlipGameState_GetVoltorbsAlongAxis(work->game, AXIS_COL, col);
        int voltorbsInRow = VoltorbFlipGameState_GetVoltorbsAlongAxis(work->game, AXIS_ROW, row);

        // Unused
        VoltorbFlipGameStates_GetPointsAlongAxis(work->game, AXIS_COL, col);
        VoltorbFlipGameStates_GetPointsAlongAxis(work->game, AXIS_ROW, row);

        if (voltorbsInCol != 0 && voltorbsInRow != 0) {
            MTRandom(); // unused

            int flippedInCol = VoltorbFlipGameState_CountFlippedCardsAlongAxis(work->game, AXIS_COL, col);
            int flippedInRow = VoltorbFlipGameState_CountFlippedCardsAlongAxis(work->game, AXIS_ROW, row);

            if ((100 * voltorbsInCol / (5 - flippedInCol)) >= 75 || (voltorbsInRow * 100) / (5 - flippedInRow) >= 75) {
                // "Is this what you were expecting?!"
                PrintMessageToSmallWindow(work, msg_0039_00029);
                PlayFanfare(SEQ_ME_CARDGAME1);
            }
        }
        VoltorbFlipWorkflow_IncrementTaskState(workflow);
        break;
    }
    case 1:
        if (!IsSEPlaying(SEQ_SE_GS_PANERU_MEKURUMAE) && !IsFanfarePlaying()) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_CardFlipEffect_Begin(WorkflowEngine *work, VoltorbFlipAppWork *workflow) {
    int cursorPos = VoltorbFlipInputHandler_GetCursorPos(workflow->inputHandler);
    ov122_021E70B8(&workflow->unk248, cursorPos, 0, workflow);
    PlaySE(SEQ_SE_GS_PANERU_MEKURU);
    return TRUE;
}

BOOL VoltorbFlipWorkflow_CardFlipEffect_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        if (ov122_021E7168(&work->unk248)) {
            VoltorbFlipWorkflow_IncrementTaskState(workflow);
        }
        break;
    case 1: {
        int cardId = VoltorbFlipInputHandler_GetCursorPos(work->inputHandler);
        CardType type = VoltorbFlipGameState_GetCardType(work->game, cardId);

        s16 column = ((cardId % 5) * 4 + 1);
        s16 x = column * 8 + 12;

        s16 row = ((cardId / 5) * 4 + 1);
        s16 y = row * 8 + 12;

        ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_FLIPPING_CARD], TRUE);
        VoltorbFlipGameState_FlipCard(work->game, cardId);
        if (type == CARD_TYPE_VOLTORB) {
            ManagedSprite_SetPositionXY(work->sprites[VF_SPRITE_FLIPPING_CARD], x, y);
            ManagedSprite_SetAnim(work->sprites[VF_SPRITE_FLIPPING_CARD], 1);
            // Plays Voltorb explosion SE
            PlaySE(SEQ_SE_GS_COIN_HAZURE);
        } else {
            int payoutBefore = VoltorbFlipGameState_GetGamePayout(work->game);

            VoltorbFlipGameState_MultiplyPayoutAndUpdateCardsFlipped(work->game, type);

            int payoutAfter = VoltorbFlipGameState_GetGamePayout(work->game);

            BufferIntegerAsString(work->msgFmt, 0, type, 1, PRINTING_MODE_LEFT_ALIGN, 1);
            BufferIntegerAsString(work->msgFmt, 1, payoutAfter, 5, PRINTING_MODE_LEFT_ALIGN, 1);
            ManagedSprite_SetPositionXY(work->sprites[VF_SPRITE_FLIPPING_CARD], x, y);
            ManagedSprite_SetAnim(work->sprites[VF_SPRITE_FLIPPING_CARD], 0);

            if (payoutBefore == 0) {
                PrintMessageToSmallWindow(work, msg_0039_00030);
            } else if (IS_NOT_ONE_CARD(VoltorbFlip_GetSelectedCardType(work))) {
                PrintMessageToSmallWindow(work, msg_0039_00031);
            } else {
                return TRUE;
            }
        }
        VoltorbFlipWorkflow_IncrementTaskState(workflow);
        break;
    }
    case 2:
        if (GF_IsAnySEPlaying() == 0) {
            VoltorbFlipWorkflow_IncrementTaskState(workflow);
        }
        break;
    case 3:
        if (VoltorbFlip_GetSelectedCardType(work) == CARD_TYPE_VOLTORB) {
            PlayFanfare(SEQ_ME_CARDGAME2);
            PrintMessageToSmallWindow(work, msg_0039_00032);
            PrintCoins(work, COIN_DISPLAY_PAYOUT, 0);
            VoltorbFlipWorkflow_IncrementTaskState(workflow);
        } else if (AddCoinsToPayout(work)) {
            VoltorbFlipWorkflow_IncrementTaskState(workflow);
        }
        break;
    case 4:
        if (VoltorbFlip_GetSelectedCardType(work) == CARD_TYPE_VOLTORB) {
            if (!IsFanfarePlaying()) {
                return TRUE;
            }
        } else if (System_GetTouchNew() || gSystem.newKeys != 0) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_CardFlipEffect_End(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    if (VoltorbFlip_GetSelectedCardType(work) == CARD_TYPE_VOLTORB) {
        VoltorbFlipGameState_SetRoundOutcome(work->game, ROUND_OUTCOME_LOST);
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_REVEAL_BOARD);
    } else if (VoltorbFlipGameState_HasEarnedMaxPayout(work->game)) {
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_WIN_ROUND);
    } else {
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
    }
    BgClearTilemapBufferAndCommit(work->bgConfig, 3);
    return TRUE;
}

BOOL VoltorbFlipWorkflow_WinRound_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        // "Game clear! You’ve found all of the hidden x2 and x3 cards..."
        VoltorbFlip_PrintTextWindow(work, msg_0039_00033, 1);
        ov122_021E7888(&work->unk25C);
        PlayFanfare(SEQ_ME_MUSHITORI3);
        VoltorbFlipWorkflow_IncrementTaskState(workflow);
        // fallthrough
    case 1:
        if (!IsFanfarePlaying() && IsPrinterFinished(work)) {
            VoltorbFlipGameState_SetRoundOutcome(work->game, ROUND_OUTCOME_WON);
            VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_AWARD_COINS);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_AwardCoins_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    switch (state) {
    case 0: {
        int var2 = VoltorbFlipGameState_GetGamePayout(work->game);
        BufferIntegerAsString(work->msgFmt, 0, var2, 5, PRINTING_MODE_LEFT_ALIGN, 1);
        BufferPlayersName(work->msgFmt, 1, work->profile);
        // "{} received {} Coin(s)!"
        VoltorbFlip_PrintTextWindow(work, msg_0039_00040, 1);
        ov122_021E7888(&work->unk25C);
        Sound_SetSceneAndPlayBGM(64, 0, 0);
        PlaySE(SEQ_SE_GS_COIN_PAYOUT_ONE);
        VoltorbFlipWorkflow_IncrementTaskState(workflow);
    }
        // fallthrough
    case 1:
        if (AwardPayoutToPlayer(work)) {
            VoltorbFlipWorkflow_IncrementTaskState(workflow);
        }
        break;
    case 2:
        if (!GF_IsAnySEPlaying() && IsPrinterFinished(work)) {
            Sound_SetSceneAndPlayBGM(70, 0, 0);
            BgClearTilemapBufferAndCommit(work->bgConfig, 3);
            ov122_021E78B4(&work->unk25C);
            VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_REVEAL_BOARD);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_RevealBoard_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        ov122_021E70B8(&work->unk248, 0, 1, work);
        PlaySE(SEQ_SE_GS_PANERU_MEKURU);
        VoltorbFlipWorkflow_IncrementTaskState(workflow);
        break;
    case 1:
        if (ov122_021E7168(&work->unk248)) {
            VoltorbFlipWorkflow_IncrementTaskState(workflow);
        }
        break;
    case 2:
        if (System_GetTouchNew() != 0 || gSystem.newKeys != 0) {
            ov122_021E70B8(&work->unk248, 0, 2, work);
            VoltorbFlipWorkflow_IncrementTaskState(workflow);
        }
        break;
    case 3:
        if (ov122_021E7168(&work->unk248)) {
            VoltorbFlipWorkflow_Enqueue(work->workflow, WORKFLOW_COIN_CASE_FULL);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_RevealBoard_End(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    VoltorbFlipGameState_UpdateHistoryAndReset(work->game);
    ov122_021E8D8C(work->inputHandler, FALSE);
    ov122_021E8E40(work->inputHandler);

    int payout = VoltorbFlipGameState_GetGamePayout(work->game);
    u16 coins = (u32)Coins_GetValue(work->coins);

    PrintCoins(work, COIN_DISPLAY_PAYOUT, payout);
    PrintCoins(work, COIN_DISPLAY_TOTAL, coins);
    PrintBoardVoltorbsAndPoints(work);

    work->hasPlayedOneLeve = TRUE;
    return TRUE;
}

BOOL ov122_021E65F4(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    return ov122_021E5B5C(workflow, work);
}

BOOL ov122_021E65FC(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int input = VoltorbFlipInputHandler_HandleInput(work->inputHandler);
    switch (input) {
    case 1:
        PlaySE(SEQ_SE_DP_SELECT);
        if (!ov122_021E8E70(work->inputHandler)) {
            VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_UNK_14);
            return TRUE;
        }
        break;
    case 3:
    case 4:
        PlaySE(SEQ_SE_DP_SELECT);
        work->unk238 = FALSE;
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_02], 6);
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
        return TRUE;
    case 2:
        PlaySE(SEQ_SE_DP_DECIDE);
        work->unk238 = FALSE;
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_03], 3);
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_QUIT_ROUND);
        return TRUE;
    case 5:
    case 6:
    case 7:
    case 8: {
        int cardId = VoltorbFlipInputHandler_GetCursorPos(work->inputHandler);

        u8 var3 = input - 5;
        TryToggleCardMemo(work, cardId, var3);
        break;
    }
    case 0:
        ov122_021E72D0(work);
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL ov122_021E66CC(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    if (state == 0) {
        ov122_021E78DC(&work->unk25C);
        VoltorbFlipInputHandler_SetMemoFocused(work->inputHandler, TRUE);
    }
    return ov122_021E5B5C(workflow, work);
}

BOOL ov122_021E66FC(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    return TRUE;
}

BOOL ov122_021E6700(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int input = VoltorbFlipInputHandler_HandleInput(work->inputHandler);
    switch (input) {
    case 1: {
        int cardId = VoltorbFlipInputHandler_GetCursorPos(work->inputHandler);
        int memoId = VoltorbFlipInputHandler_GetMemoButtonID(work->inputHandler);
        if (TryToggleCardMemo(work, cardId, memoId)) {
            VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_UNK_13);
            return TRUE;
        }
        break;
    }
    case 4:
        PlaySE(SEQ_SE_DP_SELECT);
        work->unk238 = FALSE;
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_02], 6);
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
        return TRUE;
    case 3:
        PlaySE(SEQ_SE_DP_BUTTON3);
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_09], 17);
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_UNK_13);
        return TRUE;
    case 2:
        PlaySE(SEQ_SE_DP_DECIDE);
        work->unk238 = FALSE;
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_03], 3);
        VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_QUIT_ROUND);
        return TRUE;
    case 0:
        ov122_021E72D0(work);
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL ov122_021E67DC(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    return TRUE;
}

BOOL ov122_021E67E0(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        ov122_021E72D0(work);
        VoltorbFlipWorkflow_IncrementTaskState(workflow);
        // fallthrough
    case 1:
        if (ov122_021E7F70(work)) {
            if (VoltorbFlipWorkflow_CurrentWorkflow(workflow) == WORKFLOW_UNK_14) {
                ov122_021E8E58(work->inputHandler);
                VoltorbFlipInputHandler_SetMemoFocused(work->inputHandler, FALSE);
                ov122_021E7904(&work->unk25C);
            }
            VoltorbFlipWorkflow_IncrementTaskState(workflow);
        }
        break;
    case 2:
        if (!work->unk238) {
            AnimateCloseMenu(work);
            VoltorbFlipWorkflow_IncrementTaskState(workflow);
        } else {
            return TRUE;
        }
        break;
    case 3:
        if (ManagedSprite_IsAnimated(work->sprites[VF_SPRITE_04]) == 0) {
            ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_04], 0);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_QuitRound_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int msgNo;

    int state = VoltorbFlipWorkflow_CurrentTaskState(workflow);
    switch (state) {
    case 0: {
        int payout = VoltorbFlipGameState_GetGamePayout(work->game);
        if (payout == 0) {
            // "You haven’t found any Coins! Are you sure you..."
            msgNo = msg_0039_00037;
        } else {
            // "If you quit now, you will receive {} Coin(s)..."
            msgNo = msg_0039_00034;
            BufferIntegerAsString(work->msgFmt, 0, payout, 5, PRINTING_MODE_LEFT_ALIGN, 1);
        }
        ov122_021E7888(&work->unk25C);
        VoltorbFlip_PrintTextWindow(work, msgNo, 1);
        VoltorbFlipWorkflow_IncrementTaskState(workflow);
        break;
    }
    case 1:
        if (IsPrinterFinished(work)) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_QuitRound_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    YesNoPromptTemplate temp1 = { 0 };

    temp1.bgConfig = work->bgConfig;
    temp1.bgId = 3;
    temp1.tileStart = 31;
    temp1.plttSlot = 9;
    temp1.x = 25;
    temp1.y = 10;
    temp1.initialCursorPos = 0;

    YesNoPrompt_InitFromTemplate(work->unk13C, &temp1);
    return TRUE;
}

BOOL VoltorbFlipWorkflow_QuitRound_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int var1 = YesNoPrompt_HandleInput(work->unk13C);
    switch (var1) {
    case YESNORESPONSE_YES: {
        int payout = VoltorbFlipGameState_GetGamePayout(work->game);

        VoltorbFlipGameState_SetRoundOutcome(work->game, ROUND_OUTCOME_QUIT);
        if (payout == 0) {
            BgClearTilemapBufferAndCommit(work->bgConfig, 3);
            ov122_021E78B4(&work->unk25C);
            VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_REVEAL_BOARD);
        } else {
            VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_AWARD_COINS);
        }
        return TRUE;
    }
    case YESNORESPONSE_NO:
        BgClearTilemapBufferAndCommit(work->bgConfig, 3);
        ov122_021E78B4(&work->unk25C);
        if (work->unk238) {
            VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_UNK_13);
        } else {
            VoltorbFlipWorkflow_Enqueue(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
        }
        return TRUE;
    }
    return FALSE;
}

BOOL VoltorbFlipWorkflow_QuitRound_End(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    YesNoPrompt_Reset(work->unk13C);
    return TRUE;
}

static BOOL AddCoinsToPayout(VoltorbFlipAppWork *work) {
    u32 payout = VoltorbFlipGameState_GetGamePayout(work->game);
    if (System_GetTouchNew() || gSystem.newKeys != 0) {
        PrintCoins(work, COIN_DISPLAY_PAYOUT, payout);
    } else if (payout > work->payoutDisplay) {
        if ((work->payoutDisplay % 4) == 0) {
            PlaySE(SEQ_SE_GS_OKOZUKAI);
        }
        PrintCoins(work, COIN_DISPLAY_PAYOUT, ++work->payoutDisplay);
    } else {
        PlaySE(SEQ_SE_GS_OKOZUKAI);
        return TRUE;
    }
    return FALSE;
}

// Returns TRUE when all the payout has been given to the player.
static BOOL AwardPayoutToPlayer(VoltorbFlipAppWork *work) {
    BOOL payoutDeducted; // only TRUE for incremental deduction

    u16 coins = (u32)Coins_GetValue(work->coins);
    u16 payout = VoltorbFlipGameState_GetGamePayout(work->game);

    if (System_GetTouchNew() || gSystem.newKeys != 0 || coins >= 50000) {
        VoltorbFlipGameState_DeductFromPayout(work->game, (u8)payout);
        Coins_Add(work->coins, payout);

        int newTotal = coins + payout;
        if (newTotal > 50000) {
            newTotal = 50000;
        }

        PrintCoins(work, COIN_DISPLAY_PAYOUT, 0);
        PrintCoins(work, COIN_DISPLAY_TOTAL, (u16)newTotal);
        payoutDeducted = FALSE;
    } else {
        payoutDeducted = VoltorbFlipGameState_DeductFromPayout(work->game, 1);
    }

    if (payoutDeducted) {
        Coins_Add(work->coins, 1);
        PrintCoins(work, COIN_DISPLAY_PAYOUT, (u16)(payout - 1));
        PrintCoins(work, COIN_DISPLAY_TOTAL, (u16)(coins + 1));
        if (payout % 4 == 0) {
            PlaySE(SEQ_SE_GS_COIN_PAYOUT_ONE);
        }
    } else {
        PlaySE(SEQ_SE_GS_COIN_PAYOUT_LAST);
        return TRUE;
    }
    return FALSE;
}

static void ov122_021E6B38(VoltorbFlipAppWork *work) {
    int i;
    int j;

    for (i = 0; i < 10; i++) {
        for (j = 0; j < 8; j++) {
            work->unk188[i][j] = ov122_021E92A0[j] + i * 2;
        }
    }
}

static void PrintCoins(VoltorbFlipAppWork *work, CoinDisplay type, int amount) {
    int y;
    u8 buf[5];

    buf[0] = amount / 10000;
    buf[1] = (amount / 1000) % 10;
    buf[2] = (amount / 100) % 10;
    buf[3] = (amount / 10) % 10;
    buf[4] = amount % 10;

    int i = 0;
    int x = 21;
    for (; i < 5; i++) {
        if (type != COIN_DISPLAY_TOTAL) {
            y = 19;
        } else {
            y = 14;
        }

        LoadRectToBgTilemapRect(work->bgConfig, 4, &work->unk188[buf[i]][0], x, y, 2, 4);
        x += 2;
    }

    if (type != COIN_DISPLAY_TOTAL) {
        work->payoutDisplay = amount;
    }

    BgCommitTilemapBufferToVram(work->bgConfig, 4);
}

static void RenderCardMemo(VoltorbFlipAppWork *work, int cardId, int memoFlag) {
    u16 temp1[1];

    int idx = MemoFlagToIdx(memoFlag);
    int var3 = (cardId % 5) * 4 + 1 + ov122_021E9344[idx].unk0;
    int var5 = (cardId / 5) * 4 + 1 + ov122_021E9344[idx].unk4;

    if (VoltorbFlipGameState_IsCardMemoFlagOn(work->game, cardId, memoFlag) != 0) {
        temp1[0] = ov122_021E9344[idx].unk8;
        LoadRectToBgTilemapRect(work->bgConfig, 2, temp1, var3, var5, 1, 1);
    } else {
        FillBgTilemapRect(work->bgConfig, 2, 0, var3, var5, 1, 1, 0);
    }

    BgCommitTilemapBufferToVram(work->bgConfig, 2);
}

static void PrintBoardVoltorbs(VoltorbFlipAppWork *work) {
    int i;
    u16 buf[4];

    // Rows
    i = 0;
    int y = 2;
    for (; i < 5; i++) {
        int voltorbs = VoltorbFlipGameState_GetVoltorbsAlongAxis(work->game, AXIS_ROW, i);
        buf[2] = voltorbs + 203;
        buf[3] = voltorbs + 235;
        LoadRectToBgTilemapRect(work->bgConfig, 2, &buf[2], 23, y, 1, 2);

        y += 4;
    }

    // Columns
    i = 0;
    int x = 3;
    for (; i < 5; i++) {
        int voltorbs = VoltorbFlipGameState_GetVoltorbsAlongAxis(work->game, AXIS_COL, i);
        buf[0] = voltorbs + 203;
        buf[1] = voltorbs + 235;
        LoadRectToBgTilemapRect(work->bgConfig, 2, buf, x, 22, 1, 2);

        x += 4;
    }
}

static void PrintBoardPoints(VoltorbFlipAppWork *work) {
    int i;
    u16 buf[4];

    // Rows
    i = 0;
    int y = 1;
    for (; i < 5; i++) {
        int points = VoltorbFlipGameStates_GetPointsAlongAxis(work->game, AXIS_ROW, i);

        buf[2] = points / 10 + 1;
        buf[3] = points % 10 + 1;
        LoadRectToBgTilemapRect(work->bgConfig, 2, &buf[2], 22, y, 2, 1);

        y += 4;
    }

    // Columns
    i = 0;
    int x = 2;
    for (; i < 5; i++) {
        int points = VoltorbFlipGameStates_GetPointsAlongAxis(work->game, AXIS_COL, i);

        buf[0] = points / 10 + 1;
        buf[1] = points % 10 + 1;
        LoadRectToBgTilemapRect(work->bgConfig, 2, &buf[0], x, 21, 2, 1);

        x += 4;
    }
}

static int ov122_021E6E10(u8 cardType, u8 a1) {
    GF_ASSERT(a1 < 2);
    GF_ASSERT(cardType < 5);

    return ov122_021E9278[cardType][a1];
}

static void ov122_021E6E34(u16 *tiles3x3, int baseTile) {
    for (int i = 0; i < 9; i++) {
        tiles3x3[i] = baseTile + (i / 3) * 32 + i % 3;
    }
}

static void ov122_021E6E60(BgConfig *bgConfig, VoltorbFlipGameState *game, int cardId, int mode) {
    u16 temp1[9];

    int x = (cardId % 5) * 4 + 1;
    int y = (cardId / 5) * 4 + 1;
    int cardType = VoltorbFlipGameState_GetCardType(game, cardId);

    switch (mode) {
    case 0:
        ov122_021E6E34(temp1, 119);
        break;
    case 1:
        ov122_021E6E34(temp1, 26);
        break;
    case 2:
        ov122_021E6E34(temp1, ov122_021E6E10(cardType, 0));
        break;
    case 3:
        ov122_021E6E34(temp1, ov122_021E6E10(cardType, 1));
        break;
    default:
        GF_ASSERT(FALSE);
    }

    LoadRectToBgTilemapRect(bgConfig, GF_BG_LYR_MAIN_0, temp1, x, y, 3, 3);
}

static void ov122_021E6F04(BgConfig *bgConfig, VoltorbFlipGameState *game, int cardId, int mode) {
    u16 temp1[9];

    int x = (cardId % 5) * 4 + 1;
    int y = (cardId / 5) * 4 + 1;
    int cardType = VoltorbFlipGameState_GetCardType(game, cardId);

    switch (mode) {
    case 0:
        ov122_021E6E34(temp1, ov122_021E6E10(cardType, 0));
        break;
    case 1:
        ov122_021E6E34(temp1, 26);
        break;
    case 2:
        ov122_021E6E34(temp1, 119);
        break;
    case 3:
        ov122_021E6E34(temp1, 23);
        break;
    default:
        GF_ASSERT(FALSE);
    }

    LoadRectToBgTilemapRect(bgConfig, GF_BG_LYR_MAIN_0, temp1, x, y, 3, 3);
}

static void ov122_021E6F9C(Ov122_021E70B8 *a0) {
    ov122_021E6E60(a0->bgConfig, a0->game, a0->cursorPos, a0->unk10);
}

static BOOL ov122_021E6FB0(Ov122_021E70B8 *a0) {
    BOOL ret = FALSE;

    for (int i = 0; i < 25; i++) {
        if (!VoltorbFlipGameState_IsCardFlipped(a0->game, i & 0xFF)) {
            ret = TRUE;
            ov122_021E6E60(a0->bgConfig, a0->game, (u8)i, a0->unk10);
        }
    }

    return ret;
}

static void ov122_021E6FE4(Ov122_021E70B8 *a0) {
    for (int i = 0; i < 5; i++) {
        ov122_021E6F04(a0->bgConfig, a0->game, (u8)(a0->row + 5 * i), a0->unk10);
    }
}

static BOOL ov122_021E7008(Ov122_021E70B8 *a0) {
    BOOL ret = FALSE;

    for (int i = 0; i < 25; i++) {
        if (!VoltorbFlipGameState_IsCardFlipped(a0->game, i & 0xFF)) {
            ret = TRUE;
            ov122_021E6F04(a0->bgConfig, a0->game, (u8)i, a0->unk10);
        }
    }

    return ret;
}

static void ov122_021E703C(Ov122_021E70B8 *a0) {
    BOOL var1 = TRUE;

    switch (a0->unkC) {
    case 0:
        ov122_021E6F9C(a0);
        break;
    case 1:
        var1 = ov122_021E6FB0(a0);
        break;
    case 2:
        ov122_021E6FE4(a0);
        break;
    case 3:
        var1 = ov122_021E7008(a0);
        break;
    }

    if (a0->unk10 == 0 && var1) {
        PlaySE(SEQ_SE_GS_PANERU_MEKURU);
    }

    BgCommitTilemapBufferToVram(a0->bgConfig, GF_BG_LYR_MAIN_0);
}

static void PrintBoardVoltorbsAndPoints(VoltorbFlipAppWork *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, GF_BG_LYR_MAIN_2);
    PrintBoardVoltorbs(work);
    PrintBoardPoints(work);
    BgCommitTilemapBufferToVram(work->bgConfig, GF_BG_LYR_MAIN_2);
}

static void ov122_021E70B8(Ov122_021E70B8 *a0, int cursorPos, int a2, VoltorbFlipAppWork *work) {
    a0->bgConfig = work->bgConfig;
    a0->unk8 = work->inputHandler;
    a0->game = work->game;
    a0->unkC = a2;
    a0->cursorPos = cursorPos;
    a0->unk10 = 0;
    a0->unk12 = 0;
    a0->row = 5;

    switch (a2) {
    case 0: {
        int x = (a0->cursorPos % 5) * 4 + 1;
        int y = (a0->cursorPos / 5) * 4 + 1;

        FillBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_2, 0, x, y, 3, 3, 0);
        BgCommitTilemapBufferToVram(work->bgConfig, 2);
        break;
    }
    case 1:
        FillBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_2, 0, 1, 1, 20, 20, 0);
        BgCommitTilemapBufferToVram(work->bgConfig, 2);
        break;
    case 2:
        a0->row = 0;
        break;
    default:
        GF_ASSERT(FALSE);
    case 3:
        break;
    }
}

static BOOL ov122_021E7168(Ov122_021E70B8 *a0) {
    if (a0->unk12 % 3 != 0) {
        ov122_021E703C(a0);
        if (++a0->unk10 >= 4) {
            a0->unk10 = 0;
            if (++a0->row >= 5) {
                return TRUE;
            }
        }
    }
    a0->unk12++;
    return FALSE;
}

static void VoltorbFlip_AnimateOpenMenu(VoltorbFlipAppWork *work) {
    GF_ASSERT(!work->unk238);

    ov122_021E8E58(work->inputHandler);
    VoltorbFlipInputHandler_SetMemoOpen(work->inputHandler, TRUE);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_04], TRUE);
    ManagedSprite_SetAnim(work->sprites[VF_SPRITE_04], 20);
    // "Close Memo" (text in button)
    PaintMessageOnWindow(work, 4, msg_0039_00007, &work->wMemo, 0, 0);
    work->unk238 = TRUE;
    PlaySE(SEQ_SE_DP_CARD2);
}

static void AnimateCloseMenu(VoltorbFlipAppWork *work) {
    GF_ASSERT(!work->unk238);

    VoltorbFlipInputHandler_SetMemoOpen(work->inputHandler, FALSE);
    ov122_021E8E58(work->inputHandler);
    ov122_021E7274(work, FALSE);
    ManagedSprite_SetAnim(work->sprites[VF_SPRITE_04], 21);
    // "Open Memo" (text in button)
    PaintMessageOnWindow(work, 4, msg_0039_00006, &work->wMemo, 0, 0);
    PlaySE(SEQ_SE_DP_CARD2);
}

static void ov122_021E7274(VoltorbFlipAppWork *work, BOOL flag) {
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_TOGGLE_MEMO_VOLTORB], flag);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_TOGGLE_MEMO_ONE], flag);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_TOGGLE_MEMO_TWO], flag);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_TOGGLE_MEMO_THREE], flag);

    if (flag) {
        if (VoltorbFlipWorkflow_CurrentWorkflow(work->workflow) == WORKFLOW_UNK_14) {
            flag = TRUE;
        } else {
            flag = FALSE;
        }
    }

    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_09], flag);
}

static void ov122_021E72D0(VoltorbFlipAppWork *work) {
    int cursorPos = VoltorbFlipInputHandler_GetCursorPos(work->inputHandler);

    if (VoltorbFlipInputHandler_IsCursorInGridRange(work->inputHandler)) {
        for (int i = 0; i < 4; i++) {
            GF_ASSERT(ov122_021E92B0[i][2] < VF_SPRITE_NUM);

            int spriteIdx = ov122_021E92B0[i][2];
            ManagedSprite *sprite = work->sprites[spriteIdx];
            BOOL memoFlag = VoltorbFlipGameState_IsCardMemoFlagOn(work->game, cursorPos, ov122_021E92B0[i][3]);
            ManagedSprite_SetAnim(sprite, ov122_021E92B0[i][memoFlag]);
        }
        ov122_021E7274(work, TRUE);
    } else {
        ov122_021E7274(work, FALSE);
    }
}

// Returns TRUE if the player pressed the Back button.
static BOOL TryToggleCardMemo(VoltorbFlipAppWork *work, int cardId, int memoId) {
    if (VoltorbFlipGameState_IsCardFlipped(work->game, cardId)) {
        PlaySE(SEQ_SE_DP_BOX03);
        return FALSE;
    }

    PlaySE(SEQ_SE_DP_BOX01);
    switch (memoId) {
    case 4: // Back button
        return TRUE;
    case 0: // Voltorb button
        VoltorbFlipGameState_ToggleCardMemo(work->game, cardId, MEMO_VOLTORB);
        RenderCardMemo(work, cardId, MEMO_VOLTORB);
        break;
    case 1: // 1 button
        VoltorbFlipGameState_ToggleCardMemo(work->game, cardId, MEMO_ONE);
        RenderCardMemo(work, cardId, MEMO_ONE);
        break;
    case 2: // 2 button
        VoltorbFlipGameState_ToggleCardMemo(work->game, cardId, MEMO_TWO);
        RenderCardMemo(work, cardId, MEMO_TWO);
        break;
    case 3: // 3 button
        VoltorbFlipGameState_ToggleCardMemo(work->game, cardId, MEMO_THREE);
        RenderCardMemo(work, cardId, MEMO_THREE);
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

static void VoltorbFlip_CreateListMenuSpawnerAndItems(VoltorbFlipAppWork *work) {
    work->listMenuSpawner = TouchscreenListMenuSpawner_Create(work->heapID, 0);

    for (int i = 0; i < 2; i++) {
        work->menuItems[i] = ListMenuItems_New(sMenuMsgNos[i].size, work->heapID);

        for (int j = 0; j < sMenuMsgNos[i].size; j++) {
            const u8 *msgNos = sMenuMsgNos[i].msgNos;
            ListMenuItems_AppendFromMsgData(work->menuItems[i], work->msgData, msgNos[j], j);
        }
    }
}

static void VoltorbFlip_DestroyListMenuSpawnerAndItems(VoltorbFlipAppWork *work) {
    for (int i = 0; i < 2; i++) {
        ListMenuItems_Delete(work->menuItems[i]);
        work->menuItems[i] = NULL;
    }
    TouchscreenListMenuSpawner_Destroy(work->listMenuSpawner);
}

void VoltorbFlip_CreateListMenu(VoltorbFlipAppWork *work, int whichList) {
    TouchscreenListMenuHeader header = { 0 };
    const MsgNoList *ptr = &sMenuMsgNos[whichList];
    GF_ASSERT(work->bgConfig != NULL);

    header.template = sListMenuTemplate;

    header.listMenuItems = work->menuItems[whichList];
    header.bgConfig = work->bgConfig;
    header.numWindows = ptr->size;

    work->menu = TouchscreenListMenu_Create(work->listMenuSpawner, &header, work->menuInputState, 17, 17 - ptr->size * 3, 13, 0);
}

static int VoltorbFlip_HandleListMenuInput(VoltorbFlipAppWork *work) {
    int input = TouchscreenListMenu_HandleInput(work->menu);
    if (input == -1) {
        return -1;
    }

    work->menuInputState = TouchscreenListMenu_WasLastInputTouch(work->menu);
    TouchscreenListMenu_Destroy(work->menu);
    return input;
}

static void VoltorbFlip_RenderTopScreen(VoltorbFlipAppWork *work) {
    PaintMessageOnWindow(work, 4, msg_0039_00006, &work->wMemo, 0, 0);
    PaintMessageOnWindow(work, 4, msg_0039_00008, &work->wQuit, 0, 0);
    BgCommitTilemapBufferToVram(work->bgConfig, 1);

    BufferIntegerAsString(work->msgFmt, 0, 1, 1, PRINTING_MODE_LEFT_ALIGN, 1);

    PrintMessageOnWindow(work, 0, msg_0039_00000, &work->wCurrentLevel, 0, 0, MAKE_TEXT_COLOR(15, 1, 0));
    PrintMessageOnWindow(work, 0, msg_0039_00001, &work->wFlipCardsAndCollectCoins, 0, 0, MAKE_TEXT_COLOR(15, 1, 0));
    BufferPlayersName(work->msgFmt, 0, work->profile);

    PrintMessageOnWindow(work, 0, msg_0039_00002, &work->wx1x2x3, 0, 4, MAKE_TEXT_COLOR(15, 1, 0));
    PrintMessageOnWindow(work, 0, msg_0039_00003, &work->wGameOver, 0, 4, MAKE_TEXT_COLOR(15, 1, 0));
    PaintMessageOnWindow(work, 0, msg_0039_00004, &work->wCollectedCoins, 0, 0);
    PaintMessageOnWindow(work, 0, msg_0039_00005, &work->wPayout, 0, 0);
    BgCommitTilemapBufferToVram(work->bgConfig, 5);
}

static void VoltorbFlip_AddWindows(VoltorbFlipAppWork *work) {
    for (int i = 0; i < 17; i++) {
        AddWindow(work->bgConfig, &work->windows[i], &sVoltorbFlipWindowTemplates[i]);
        FillWindowPixelBuffer(&work->windows[i], 0);
    }
    VoltorbFlip_RenderTopScreen(work);
}

static void VoltorbFlip_RemoveWindows(VoltorbFlipAppWork *work) {
    for (int i = 0; i < 17; i++) {
        ClearWindowTilemapAndCopyToVram(&work->windows[i]);
        RemoveWindow(&work->windows[i]);
    }
}

// Like PrintMessageOnWindow but it gets printed all at once.
static void PaintMessageOnWindow(VoltorbFlipAppWork *work, FontID fontId, u8 msgNo, Window *window, u8 x, u8 y) {
    PrintMessageOnWindow(work, fontId, msgNo, window, x, y, 0x00010200);
}

static void PrintMessageOnWindow(VoltorbFlipAppWork *work, FontID fontId, u8 msgNo, Window *window, u8 x, u8 y, u32 textColor) {
    FillWindowPixelBuffer(window, 0);

    String *str = ReadMsgData_ExpandPlaceholders(work->msgFmt, work->msgData, msgNo, work->heapID);
    AddTextPrinterParameterizedWithColor(window, fontId, str, x, y, TEXT_SPEED_NOTRANSFER, textColor, 0);

    ScheduleWindowCopyToVram(window);
    String_Delete(str);
}

static void PrintMessageToSmallWindow(VoltorbFlipAppWork *work, int msgNo) {
    Window *window = &work->wSmall;

    FillWindowPixelBuffer(window, 15);

    String *str = ReadMsgData_ExpandPlaceholders(work->msgFmt, work->msgData, msgNo, work->heapID);

    FillBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 20, 32, 4, 0);
    DrawFrameAndWindow2(window, 1, 1, 13);

    AddTextPrinterParameterized(window, 1, str, 0, 0, 0xff, 0);
    ScheduleWindowCopyToVram(window);
    String_Delete(str);
    BgCommitTilemapBufferToVram(work->bgConfig, 3);
}

// Prints a message in the main text window.
static void VoltorbFlip_PrintTextWindow(VoltorbFlipAppWork *work, int msgNo, int a2) {
    String *str;
    Window *window = &work->wMain;

    GF_ASSERT(work->string == NULL);

    FillWindowPixelBuffer(window, 15);
    if (msgNo == msg_0039_00025) {
        str = NewString_ReadMsgData(work->msgData, msgNo);
    } else {
        str = ReadMsgData_ExpandPlaceholders(work->msgFmt, work->msgData, msgNo, work->heapID);
    }

    if (a2 != 0) {
        FillBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 18, 32, 6, 0);
        DrawFrameAndWindow2(window, 1, 1, 13);
    }

    work->printerId = AddTextPrinterParameterized(window, 1, str, 0, 0, work->unk22A, 0);
    GF_ASSERT(work->printerId != 0xff);

    ScheduleWindowCopyToVram(window);
    work->string = str;
}

static BOOL IsPrinterFinished(VoltorbFlipAppWork *work) {
    if (!TextPrinterCheckActive(work->printerId)) {
        if (work->string != NULL) {
            String_Delete(work->string);
            work->string = NULL;
        }
        return TRUE;
    }
    return FALSE;
}

static void FormatGameLevel(VoltorbFlipAppWork *work, int idx) {
    u8 displayLevel = 8 - VoltorbFlipGameState_GetGameLevel(work->game);

    BufferIntegerAsString(work->msgFmt, idx, displayLevel, 1, PRINTING_MODE_LEFT_ALIGN, 1);
}

static void ov122_021E7888(u8 *a0) {
    if (!*a0) {
        InitScreenBrightnessData(SCREEN_MASK_MAIN);
        StartBrightnessTransition(4, -8, 0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
        *a0 = TRUE;
    }
}

static void ov122_021E78B4(u8 *a0) {
    InitScreenBrightnessData(SCREEN_MASK_MAIN);
    StartBrightnessTransition(4, 0, -8, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
    *a0 = FALSE;
}

static void ov122_021E78DC(u8 *a0) {
    if (!*a0) {
        InitScreenBrightnessData(SCREEN_MASK_MAIN);
        StartBrightnessTransition(1, -6, 0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
        *a0 = TRUE;
    }
}

static void ov122_021E7904(u8 *a0) {
    InitScreenBrightnessData(SCREEN_MASK_MAIN);
    StartBrightnessTransition(1, 0, -6, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
    *a0 = FALSE;
}

static void VoltorbFlip_InitBgs(VoltorbFlipAppWork *work) {
    work->bgConfig = BgConfig_Alloc(work->heapID);

    const struct GraphicsModes temp1 = sVoltorbFlipBgModeSet;
    SetBothScreensModesAndDisable(&temp1);

    BgTemplate temp2[] = {
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x0800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x0000,
         .charBase = GX_BG_CHARBASE_0x04000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 3,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x0800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x0800,
         .charBase = GX_BG_CHARBASE_0x08000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 2,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x0800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x1000,
         .charBase = GX_BG_CHARBASE_0x0c000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 1,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x0800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x1800,
         .charBase = GX_BG_CHARBASE_0x10000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x0800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x0000,
         .charBase = GX_BG_CHARBASE_0x04000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 1,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x0800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x0800,
         .charBase = GX_BG_CHARBASE_0x08000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = FALSE,
         },
    };

    for (int i = 0; i < 6; i++) {
        InitBgFromTemplate(work->bgConfig, ov122_021E9270[i], &temp2[i], 0);
        BgClearTilemapBufferAndCommit(work->bgConfig, ov122_021E9270[i]);
        BG_FillCharDataRange(work->bgConfig, (GFBgLayer)ov122_021E9270[i], 0, 1, 0);
        ToggleBgLayer(ov122_021E9270[i], GF_PLANE_TOGGLE_ON);
    }
}

static void VoltorbFlip_UnloadBgs(VoltorbFlipAppWork *work) {
    for (int i = 0; i < 6; i++) {
        FreeBgTilemapBuffer(work->bgConfig, ov122_021E9270[i]);
    }

    FontID_Release(4);
    Heap_Free(work->bgConfig);
}

static void VoltorbFlip_LoadBgGfx(VoltorbFlipAppWork *work) {
    FontID_Alloc(4, work->heapID);
    GF_ASSERT(work->narc != 0);

    GfGfxLoader_GXLoadPalFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000000_NCLR, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0, work->heapID);
    GfGfxLoader_GXLoadPal(NARC_graphic_font, 9, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_14_OFFSET, 32, work->heapID);
    LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_12_OFFSET, work->heapID);
    LoadFontPal0(GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_12_OFFSET, work->heapID);
    GfGfxLoader_GXLoadPal(NARC_graphic_font, 9, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_13_OFFSET, 32, work->heapID);
    LoadUserFrameGfx2(work->bgConfig, GF_BG_LYR_MAIN_3, 1, 13, work->unk229, work->heapID);
    GfGfxLoader_LoadCharDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000002_NCGR_lz, work->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, work->heapID);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000004_NSCR_lz, work->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, work->heapID);
    GfGfxLoader_LoadCharDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000002_NCGR_lz, work->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, work->heapID);
    GfGfxLoader_GXLoadPalFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000001_NCLR, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 0, work->heapID);
    GfGfxLoader_LoadCharDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000003_NCGR_lz, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, work->heapID);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000006_NSCR_lz, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, work->heapID);
}

static void VoltorbFlip_CreateSpriteSystem(VoltorbFlipAppWork *work) {
    SpriteResourceCountsListUnion resourceCounts = sResourceCounts;
    OamManagerParam oamManagerParam = sOamManagerParam;
    OamCharTransferParam oamCharTransferParam = sOamCharTransferParam;
    oamCharTransferParam.maxTasks = 0x80;

    work->spriteRenderer = SpriteSystem_Alloc(work->heapID);
    work->spriteGfxHandler = SpriteManager_New(work->spriteRenderer);

    SpriteSystem_Init(work->spriteRenderer, &oamManagerParam, &oamCharTransferParam, 32);
    SpriteSystem_InitSprites(work->spriteRenderer, work->spriteGfxHandler, 0x80);
    SpriteSystem_InitManagerWithCapacities(work->spriteRenderer, work->spriteGfxHandler, &resourceCounts);

    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(work->spriteRenderer), 0, 0x20c000);
}

static void VoltorbFlip_FreeSpriteSystem(VoltorbFlipAppWork *work) {
    GF_ASSERT(work->spriteRenderer != 0);
    GF_ASSERT(work->spriteGfxHandler != 0);

    VoltorbFlip_DeleteSprites(work);
    SpriteSystem_FreeResourcesAndManager(work->spriteRenderer, work->spriteGfxHandler);
    SpriteSystem_Free(work->spriteRenderer);
}

static void VoltorbFlip_LoadObjectGfx(VoltorbFlipAppWork *work) {
    GF_ASSERT(work->narc != 0);

    SpriteSystem *renderer = work->spriteRenderer;
    SpriteManager *gfxHandler = work->spriteGfxHandler;
    NNS_G2D_VRAM_TYPE vram;

    vram = NNS_G2D_VRAM_TYPE_2DMAIN;

    SpriteSystem_LoadPlttResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000010_NCLR, FALSE, 5, vram, 0);
    SpriteSystem_LoadCharResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000011_NCGR_lz, TRUE, vram, 0);
    SpriteSystem_LoadCellResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000012_NCER_lz, TRUE, 0);
    SpriteSystem_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000013_NANR_lz, TRUE, 0);

    vram = NNS_G2D_VRAM_TYPE_2DSUB;
    SpriteSystem_LoadPlttResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000014_NCLR, FALSE, 1, vram, 1);
    SpriteSystem_LoadCharResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000015_NCGR_lz, TRUE, vram, 1);
    SpriteSystem_LoadCellResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000016_NCER_lz, TRUE, 1);
    SpriteSystem_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000017_NANR_lz, TRUE, 1);
}

static ManagedSprite *VoltorbFlip_CreateSprite_Main(SpriteSystem *spriteSystem, SpriteManager *spriteManager, u16 x, u16 y, u16 animation, u16 drawPriority) {
    ManagedSpriteTemplate spriteTemplate = sSpriteTemplate_Main;

    GF_ASSERT(spriteSystem != NULL);
    GF_ASSERT(spriteManager != NULL);

    spriteTemplate.x = x;
    spriteTemplate.y = y;
    spriteTemplate.animation = animation;
    spriteTemplate.drawPriority = drawPriority;

    ManagedSprite *sprite = SpriteSystem_NewSpriteWithYOffset(spriteSystem, spriteManager, &spriteTemplate, FX32_CONST(524));
    ManagedSprite_SetAnimateFlag(sprite, TRUE);
    ManagedSprite_SetDrawFlag(sprite, FALSE);
    return sprite;
}

static ManagedSprite *VoltorbFlip_CreateSprite_Sub(SpriteSystem *spriteSystem, SpriteManager *spriteManager, u16 x, u16 y, u16 animation, u16 drawPriority) {
    ManagedSpriteTemplate spriteTemplate = sSpriteTemplate_Sub;

    GF_ASSERT(spriteSystem != NULL);
    GF_ASSERT(spriteManager != NULL);

    spriteTemplate.x = x;
    spriteTemplate.y = y;
    spriteTemplate.animation = animation;
    spriteTemplate.drawPriority = drawPriority;

    ManagedSprite *sprite = SpriteSystem_NewSpriteWithYOffset(spriteSystem, spriteManager, &spriteTemplate, FX32_CONST(524));
    ManagedSprite_SetAnimateFlag(sprite, TRUE);
    ManagedSprite_SetDrawFlag(sprite, FALSE);
    return sprite;
}

static void VoltorbFlip_CreateSprites(VoltorbFlipAppWork *work) {
    work->sprites[VF_SPRITE_00] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0, 0, 18, 1);
    work->sprites[VF_SPRITE_FLIPPING_CARD] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0, 0, 0, 0);
    work->sprites[VF_SPRITE_02] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xe0, 0x28, 5, 2);
    work->sprites[VF_SPRITE_03] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xe0, 0xb0, 2, 2);
    work->sprites[VF_SPRITE_04] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0x80, 0x60, 20, 5);
    work->sprites[VF_SPRITE_TOGGLE_MEMO_VOLTORB] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xc8, 0x50, 12, 4);
    work->sprites[VF_SPRITE_TOGGLE_MEMO_ONE] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xe0, 0x50, 15, 4);
    work->sprites[VF_SPRITE_TOGGLE_MEMO_TWO] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xc8, 0x68, 14, 4);
    work->sprites[VF_SPRITE_TOGGLE_MEMO_THREE] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xe0, 0x68, 13, 4);
    work->sprites[VF_SPRITE_09] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xe0, 0x80, 16, 3);
    work->sprites[VF_SPRITE_10] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xc8, 0x50, 18, 1);
    work->sprites[VF_SPRITE_11] = VoltorbFlip_CreateSprite_Sub(work->spriteRenderer, work->spriteGfxHandler, 0x48, 0x38, 0, 0);
    work->sprites[VF_SPRITE_12] = VoltorbFlip_CreateSprite_Sub(work->spriteRenderer, work->spriteGfxHandler, 0x88, 0x28, 0, 0);

    VoltorbFlip_Sprite_SetAnimCtrlTime(work->sprites[VF_SPRITE_12]->sprite, FX32_CONST(32));

    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_02], TRUE);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_03], TRUE);
    ManagedSprite_SetPriority(work->sprites[VF_SPRITE_FLIPPING_CARD], 1);
    ManagedSprite_SetPaletteOverride(work->sprites[VF_SPRITE_10], 4);
}

static void VoltorbFlip_DeleteSprites(VoltorbFlipAppWork *work) {
    for (int i = 0; i < 13; i++) {
        Sprite_DeleteAndFreeResources(work->sprites[i]);
    }
}

static void VoltorbFlip_Sprite_SetAnimCtrlTime(Sprite *sprite, fx32 animCtrlTime) {
    NNSG2dCellAnimation *ptr = Sprite_GetCellAnim(sprite);
    ptr->animCtrl.currentTime = animCtrlTime;
}

static BOOL ov122_021E7F70(VoltorbFlipAppWork *work) {
    return !ManagedSprite_IsAnimated(work->sprites[VF_SPRITE_03]) && !ManagedSprite_IsAnimated(work->sprites[VF_SPRITE_02]) && !ManagedSprite_IsAnimated(work->sprites[VF_SPRITE_09]);
}

static CardType VoltorbFlip_GetSelectedCardType(VoltorbFlipAppWork *work) {
    return VoltorbFlipGameState_GetCardType(work->game, VoltorbFlipInputHandler_GetCursorPos(work->inputHandler));
}

static int MemoFlagToIdx(int memoFlag) {
    switch (memoFlag) {
    case MEMO_VOLTORB:
        return 0;
    case MEMO_ONE:
        return 1;
    case MEMO_TWO:
        return 2;
    case MEMO_THREE:
        return 3;
    default:
        GF_ASSERT(FALSE);
        GF_ASSERT(FALSE);
        return 0;
    }
}

static void ov122_021E8004(VoltorbFlipAppWork *work) {
    GF_ASSERT(work != NULL);
    GF_ASSERT(work->spriteGfxHandler != NULL);

    SpriteSystem_DrawSprites(work->spriteGfxHandler);
    SpriteSystem_TransferOam();
    DoScheduledBgGpuUpdates(work->bgConfig);

    REGType32v *regBase = (REGType32v *)0x027e0000;
    *(regBase + 0xffe) |= 1;
}

static void SetGXBanks(void) {
    GraphicsBanks banks = sVoltorbFlipGraphicsBanks;
    GfGfx_SetBanks(&banks);
}

static void ov122_021E8068(void) {
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();

    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
}

static void ov122_021E8094(OverlayManager *man) {
    VoltorbFlipArgs *args = OverlayManager_GetArgs(man);
    GF_ASSERT(args != NULL);

    Main_SetVBlankIntrCB(NULL, NULL);
    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);

    ov122_021E8068();
    SetGXBanks();

    Heap_Create(HEAP_ID_3, HEAP_ID_VOLTORB_FLIP, 0x50000);

    VoltorbFlipAppWork *work = OverlayManager_CreateAndGetData(man, sizeof(VoltorbFlipAppWork), HEAP_ID_VOLTORB_FLIP);
    MI_CpuFill8(work, 0, sizeof(VoltorbFlipAppWork));
    work->heapID = HEAP_ID_VOLTORB_FLIP;
    work->options = args->options;
    work->coins = args->coins;
    work->menuInputStatePtr = args->menuInputStatePtr;
    work->profile = args->profile;
    work->menuInputState = MenuInputStateMgr_GetState(work->menuInputStatePtr);
    work->unk229 = Options_GetFrame(work->options);
    work->unk22A = Options_GetTextFrameDelay(work->options);

    work->narc = NARC_New(NARC_application_voltorb_flip, work->heapID);
    work->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0039_bin, work->heapID);
    work->msgFmt = MessageFormat_New(work->heapID);
    work->unk13C = YesNoPrompt_Create(work->heapID);

    VoltorbFlip_InitBgs(work);
    VoltorbFlip_LoadBgGfx(work);
    VoltorbFlip_AddWindows(work);
    VoltorbFlip_CreateListMenuSpawnerAndItems(work);
    ov122_021E6B38(work);

    u16 coins = (u32)Coins_GetValue(work->coins);
    PrintCoins(work, COIN_DISPLAY_TOTAL, coins);
    VoltorbFlip_CreateSpriteSystem(work);
    VoltorbFlip_LoadObjectGfx(work);
    VoltorbFlip_CreateSprites(work);

    work->workflow = VoltorbFlipWorkflow_Create(work->heapID, (VoltorbFlipWorkflows *)&sVoltorbFlipWorkflows, NELEMS(sVoltorbFlipWorkflows), work);
    work->inputHandler = VoltorbFlipInputHandler_Create(work->heapID, work->sprites[VF_SPRITE_00], work->sprites[VF_SPRITE_10]);
    work->game = VoltorbFlip_CreateGameState(work->heapID);
    PrintBoardVoltorbsAndPoints(work);

    Sound_SetSceneAndPlayBGM(0x46, 0, 0);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
    TextFlags_SetCanABSpeedUpPrint(TRUE);
    TextFlags_SetCanTouchSpeedUpPrint(TRUE);

    Main_SetVBlankIntrCB((GFIntrCB)ov122_021E8004, work);
    GameStats_AddScore(Save_GameStats_Get(args->saveData), SCORE_EVENT_6);
}

static void FreeOverlayData(OverlayManager *man) {
    VoltorbFlipAppWork *work = OverlayManager_GetData(man);
    Main_SetVBlankIntrCB(NULL, NULL);
    VoltorbFlip_FreeGameState(work->game);
    VoltorbFlipInputHandler_Free(work->inputHandler);
    VoltorbFlipWorkflow_Free(work->workflow);
    VoltorbFlip_FreeSpriteSystem(work);

    YesNoPrompt_Destroy(work->unk13C);
    VoltorbFlip_DestroyListMenuSpawnerAndItems(work);
    VoltorbFlip_RemoveWindows(work);
    VoltorbFlip_UnloadBgs(work);

    MessageFormat_Delete(work->msgFmt);
    DestroyMsgData(work->msgData);
    NARC_Delete(work->narc);
    ov122_021E8068();
    OverlayManager_FreeData(man);
    Heap_Destroy(HEAP_ID_VOLTORB_FLIP);
}

BOOL VoltorbFlip_Init(OverlayManager *man, int *state) {
    switch (*state) {
    case 0:
        ov122_021E8094(man);
        *state += 1;
        break;
    case 1: {
        VoltorbFlipAppWork *work = OverlayManager_GetData(man);
        BeginNormalPaletteFade(0, 0x15, 0x15, RGB_BLACK, 6, 1, work->heapID);
        *state += 1;
        break;
    }
    case 2:
        if (IsPaletteFadeFinished() != 0) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlip_Exit(OverlayManager *man, int *state) {
    VoltorbFlipAppWork *work = OverlayManager_GetData(man);
    switch (*state) {
    case 0:
        BeginNormalPaletteFade(0, 0x14, 0x14, RGB_BLACK, 6, 1, work->heapID);
        *state += 1;
        break;
    case 1:
        if (IsPaletteFadeFinished() != 0) {
            FreeOverlayData(man);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }
    return FALSE;
}

BOOL VoltorbFlip_Main(OverlayManager *man, int *state) {
    VoltorbFlipAppWork *work = OverlayManager_GetData(man);
    if (VoltorbFlipWorkflow_Run(work->workflow)) {
        return TRUE;
    }
    return FALSE;
}
