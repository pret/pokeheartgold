#include "global.h"
#include "coins.h"
#include "font.h"
#include "game_stats.h"
#include "global.h"
#include "gf_gfx_loader.h"
#include "list_menu_items.h"
#include "math_util.h"
#include "message_format.h"
#include "options.h"
#include "overlay_manager.h"
#include "player_data.h"
#include "render_text.h"
#include "sound_02004A44.h"
#include "system.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_02009D48.h"
#include "brightness.h"
#include "unk_0200CF18.h"
#include "render_window.h"
#include "unk_0200FA24.h"
#include "unk_0201660C.h"
#include "unk_020183F0.h"
#include "unk_02023694.h"
#include "unk_02025154.h"
#include "bg_window.h"
#include "constants/sndseq.h"
#include "constants/game_stat.h"
#include "msgdata/msg/msg_0039.h"
#include "voltorb_flip/voltorb_flip.h"
#include "voltorb_flip/voltorb_flip_data.h"
#include "voltorb_flip/voltorb_flip_game.h"
#include "voltorb_flip/voltorb_flip_input.h"
#include "voltorb_flip/voltorb_flip_internal.h"
#include "voltorb_flip/voltorb_flip_work.h"
#include "voltorb_flip/voltorb_flip_workflow.h"
#include "msgdata/msg.naix"
#include "application/voltorb_flip.naix"

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
static void ov122_021E6E60(BgConfig *, GameState *, int, int);
static void ov122_021E6F04(BgConfig *, GameState *, int, int);
static void ov122_021E6F9C(Ov122_021E70B8 *);
static BOOL ov122_021E6FB0(Ov122_021E70B8 *);
static void ov122_021E6FE4(Ov122_021E70B8 *);
static BOOL ov122_021E7008(Ov122_021E70B8 *);
static void ov122_021E703C(Ov122_021E70B8 *);
static void PrintBoardVoltorbsAndPoints(VoltorbFlipAppWork *);
static void ov122_021E70B8(Ov122_021E70B8 *, int, int, VoltorbFlipAppWork *);
static BOOL ov122_021E7168(Ov122_021E70B8 *);
static void AnimateOpenMenu(VoltorbFlipAppWork *);
static void AnimateCloseMenu(VoltorbFlipAppWork *);
static void ov122_021E7274(VoltorbFlipAppWork *, int);
static void ov122_021E72D0(VoltorbFlipAppWork *);
static BOOL TryToggleCardMemo(VoltorbFlipAppWork *, int, int);
static void ov122_021E73FC(VoltorbFlipAppWork *);
static void ov122_021E745C(VoltorbFlipAppWork *);
static void ov122_021E7488(VoltorbFlipAppWork *, int);
static int ov122_021E7514(VoltorbFlipAppWork *);
static void RenderTopScreen(VoltorbFlipAppWork *);
static void AddWindows(VoltorbFlipAppWork *);
static void ov122_021E765C(VoltorbFlipAppWork *);
static void PaintMessageOnWindow(VoltorbFlipAppWork *, u8, u8, Window *, u8, u8);
static void PrintMessageOnWindow(VoltorbFlipAppWork *, FontID, u8, Window *, u8, u8, u32);
static void PrintMessageToSmallWindow(VoltorbFlipAppWork *, int);
static void PrintTextWindow(VoltorbFlipAppWork *, int, int);
static BOOL IsPrinterFinished(VoltorbFlipAppWork *);
static void FormatGameLevel(VoltorbFlipAppWork *, int);
static void ov122_021E7888(Ov122_021E7888 *);
static void ov122_021E78B4(Ov122_021E7888 *);
static void ov122_021E78DC(Ov122_021E7888 *);
static void ov122_021E7904(Ov122_021E7888 *);
static void ov122_021E7928(VoltorbFlipAppWork *);
static void ov122_021E79A4(VoltorbFlipAppWork *);
static void ov122_021E79D0(VoltorbFlipAppWork *);
static void ov122_021E7AEC(VoltorbFlipAppWork *);
static void ov122_021E7B94(VoltorbFlipAppWork *);
static void ov122_021E7BD4(VoltorbFlipAppWork *);
static UnkStruct_0200CF18 *ov122_021E7C9C(Unk122_021E7C9C *, void *, u16, u16, u16, u16);
static UnkStruct_0200CF18 *ov122_021E7D04(Unk122_021E7C9C *, void *, u16, u16, u16, u16);
static void ov122_021E7D6C(VoltorbFlipAppWork *);
static void ov122_021E7F48(VoltorbFlipAppWork *);
static void ov122_021E7F64(void *, u32);
static BOOL ov122_021E7F70(VoltorbFlipAppWork *);
static CardType ov122_021E7FA8(VoltorbFlipAppWork *);
static int MemoFlagToIdx(int);
static void ov122_021E8004(VoltorbFlipAppWork *);
static void SetGXBanks(void);
static void ov122_021E8068(void);
static void ov122_021E8094(OVY_MANAGER *);
static void FreeOverlayData(OVY_MANAGER *);

extern const GraphicsBanks sVoltorbFlipGraphicsBanks;
extern const MsgNoList sMenuMsgNos[];
extern const Ov122_021E9278 ov122_021E9278;
extern const u16 ov122_021E92A0[8];
extern const u8 ov122_021E92B0[4][4];
extern const struct GraphicsModes sVoltorbFlipBgModeSet;
extern const Unk122_021E92D0 ov122_021E92D0;
extern const Unk122_021E92E4 ov122_021E92E4;
extern const Unk122_021E92FC ov122_021E92FC;
extern const Ov122_021E6C2C ov122_021E9344[4];
extern const Unk122_021E9374 ov122_021E9374;
extern const Unk122_021E9374 ov122_021E93A8;
extern const WindowTemplate sVoltorbFlipWindowTemplates[];
extern const BgTemplates sVoltorbFlipBgTemplates;
extern VoltorbFlipWorkflows sVoltorbFlipWorkflows;

static void RenderCoinPayoutScreen(VoltorbFlipAppWork *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 5);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000006_bin, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, 1, work->heapId);

    int payout = GamePayout(work->game);
    u16 coins = (u32)CheckCoins(work->coins);

    PrintCoins(work, COIN_DISPLAY_PAYOUT, payout);
    PrintCoins(work, COIN_DISPLAY_TOTAL, coins);

    sub_0200DCE8(work->unk14C[11], 0);
    sub_0200DCE8(work->unk14C[12], 0);

    RenderTopScreen(work);
}

static void RenderHowToPlayScreen(VoltorbFlipAppWork *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 5);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000008_bin, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, 1, work->heapId);

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
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000007_bin, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, 1, work->heapId);

    // "By looking at the numbers on the sides of..."
    PaintMessageOnWindow(work, 0, msg_0039_00009, &work->wHint, 0, 0);
}

static void RenderAboutMemoScreen(VoltorbFlipAppWork *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 5);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000009_bin, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, 1, work->heapId);

    // "Open Memo" (text in button)
    PaintMessageOnWindow(work, 4, msg_0039_00006, &work->wAboutMemoOpen, 0, 0);
    // "Touch 'Open Memo' to open the Memo Window..."
    PaintMessageOnWindow(work, 0, msg_0039_00010, &work->wAboutMemoTouchOpen, 0, 0);

    sub_0200DCE8(work->unk14C[11], 1);
    sub_0200DCE8(work->unk14C[12], 1);
}

static BOOL PrintAndAwaitMessage(WorkflowEngine *workflow, VoltorbFlipAppWork *work, int msgNo) {
    int state = CurrentTaskState(workflow);
    switch(state) {
    case 0:
        ov122_021E7888(&work->unk25C);
        PrintTextWindow(work, msgNo, 1);
        IncrementTaskState(workflow);
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
    int state = CurrentTaskState(workflow);
    switch(state) {
    case 0:
        BeginNormalPaletteFade(4, 20, 20, 0, 4, 1, work->heapId);
        IncrementTaskState(workflow);
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            cb(work);
            BeginNormalPaletteFade(4, 21, 21, 0, 4, 1, work->heapId);
            IncrementTaskState(workflow);
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
    int state = CurrentTaskState(workflow);
    switch (state) {
    case 0:
        if (work->unk238 != 0) {
            return TRUE;
        }
        AnimateOpenMenu(work);
        IncrementTaskState(workflow);
        break;
    case 1:
        if (sub_0200DCA0(work->unk14C[4]) == 0) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL ov122_021E5BA8(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    u32 coins = CheckCoins(work->coins);
    if (coins >= 50000) {
        // "You’ve gathered 50,000 Coins. You cannot gather..."
        PrintTextWindow(work, msg_0039_00014, 1);
        EnqueueWorkflow(workflow, WORKFLOW_TERMINATE);
    } else {
        EnqueueWorkflow(workflow, WORKFLOW_NEW_ROUND);
    }
    return TRUE;
}

BOOL ov122_021E5BE4(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    if (!IsPrinterFinished(work)) {
        return FALSE;
    }
    return TRUE;
}

BOOL GenerateBoardAndPrintNewLevel(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    NewBoard(work->game);
    EnqueueWorkflow(workflow, WORKFLOW_SELECT_MAIN_MENU);

    if (work->unk230 == 0) {
        return TRUE;
    }

    int levelDiff = LevelsGained(work->game);
    FormatGameLevel(work, 0);
    // "VOLTORB Flip Lv. {}"
    PrintMessageOnWindow(work, 0, msg_0039_00000, &work->wCurrentLevel, 0, 0, 0x000f0100);
    BgCommitTilemapBufferToVram(work->bgConfig, 5);
    sub_02004EC4(64, 0, 0);

    if (levelDiff != 0) {
        if (levelDiff > 0) {
            ov122_021E7888(&work->unk25C);
            // "Advanced to Game Lv..."
            PrintTextWindow(work, msg_0039_00041, 1);
            PlaySE(SEQ_SE_GS_SLOT01);
        } else {
            ov122_021E7888(&work->unk25C);
            // "Dropped to Game Lv..."
            PrintTextWindow(work, msg_0039_00043, 1);
            PlaySE(SEQ_SE_GS_SLOT03);
        }
    }
    return TRUE;
}

BOOL PrintYouCanEarnEvenMoreCoins(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = CurrentTaskState(workflow);
    if (work->unk230 == 0) {
        return TRUE;
    }

    switch (state) {
    case 0:
        BOOL printerFinished = IsPrinterFinished(work);
        if (printerFinished) {
            if (LevelsGained(work->game) > 0) {
                if (work->unk234 != 0) {
                    return TRUE;
                }
                work->unk234 = 1;
                // "Congratulations! You can receive even more Coins in the next..."
                PrintTextWindow(work, msg_0039_00042, 1);
                IncrementTaskState(workflow);
            } else {
                return TRUE;
            }
        }
        break;
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

BOOL ov122_021E5D24(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = CurrentTaskState(workflow);
    switch(state) {
    case 0:
        BgClearTilemapBufferAndCommit(work->bgConfig, 3);
        IncrementTaskState(workflow);
        // fallthrough
    case 1:
        if (!IsSEPlaying(SEQ_SE_GS_SLOT01) || !IsSEPlaying(SEQ_SE_GS_SLOT02)) {
            sub_02004EC4(70, 0, 0);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL PrintPlayNewRound(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int msgNo;

    int state = CurrentTaskState(workflow);
    if (state == 0) {
        ov122_021E7888(&work->unk25C);
    }

    FormatGameLevel(work, 0);
    if (work->unk230 != 0) {
        msgNo = msg_0039_00016;
    } else {
        msgNo = msg_0039_00015;
    }

    return PrintAndAwaitMessage(workflow, work, msgNo);
}

BOOL ov122_021E5DB4(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    ov122_021E7488(work, 0);
    return TRUE;
}

BOOL AwaitMainMenuSelection(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int var1 = ov122_021E7514(work);
    switch (var1 + 2) {
    case 2: // Play
        ov122_021E78B4(&work->unk25C);
        EnqueueWorkflow(workflow, WORKFLOW_RENDER_BOARD);
        return TRUE;
    case 1:
        break;
    case 3: // Game Info
        EnqueueWorkflow(workflow, WORKFLOW_SELECT_GAME_INFO);
        return TRUE;
    case 0:
    case 4: // Quit
        EnqueueWorkflow(workflow, WORKFLOW_TERMINATE);
        return TRUE;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL PrintWhichSetOfInfo(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    // "Which set of info?"
    return PrintAndAwaitMessage(workflow, work, msg_0039_00020);
}

BOOL ov122_021E5E34(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    ov122_021E7488(work, 1);
    return TRUE;
}

BOOL AwaitGameInfoSelection(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int var1 = ov122_021E7514(work);
    switch (var1 + 2) {
    case 1:
        break;
    case 2:
        EnqueueWorkflow(workflow, WORKFLOW_HOW_TO_PLAY);
        return TRUE;
    case 3:
        EnqueueWorkflow(workflow, WORKFLOW_HINT);
        return TRUE;
    case 4:
        EnqueueWorkflow(workflow, WORKFLOW_ABOUT_MEMO);
        return TRUE;
    case 0:
    case 5:
        EnqueueWorkflow(workflow, WORKFLOW_SELECT_MAIN_MENU);
        return TRUE;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL OpenHowToPlayScreen(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    return TutorialScreenTransition(workflow, work, RenderHowToPlayScreen);
}

BOOL PrintHowToPlayMsg(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    // "VOLTORB Flip is a game in which you flip over..."
    return PrintAndAwaitMessage(workflow, work, msg_0039_00025);
}

BOOL OpenHintScreen(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    return TutorialScreenTransition(workflow, work, RenderHintScreen);
}

BOOL PrintHintMsg(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    // "The numbers at the side of the board give..."
    return PrintAndAwaitMessage(workflow, work, msg_0039_00026);
}

BOOL OpenAboutMemoScreen(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    return TutorialScreenTransition(workflow, work, RenderAboutMemoScreen);
}

BOOL PrintAboutMemoMsg(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    // "Select 'Open Memo' to mark the cards. You..."
    return PrintAndAwaitMessage(workflow, work, msg_0039_00027);
}

BOOL CloseTutorialScreen(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    if (TutorialScreenTransition(workflow, work, RenderCoinPayoutScreen)) {
        EnqueueWorkflow(workflow, WORKFLOW_SELECT_GAME_INFO);
        return TRUE;
    }
    return FALSE;
}

BOOL RenderBoard(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 3);
    PrintBoardVoltorbsAndPoints(work);
    ov122_021E8D8C(work->unk240, 1);
    EnqueueWorkflow(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
    return TRUE;
}

BOOL AwaitBoardInteraction(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int var1 = ov122_021E8D74(work->unk240);
    switch (var1) {
    case 0:
        break;
    case 1:
        int cardId = ov122_021E8DF0(work->unk240);
        if (IsCardFlipped(work->game, cardId)) {
            PlaySE(SEQ_SE_DP_BOX03);
        } else {
            EnqueueWorkflow(workflow, WORKFLOW_FLIP_CARD);
            return TRUE;
        }
        break;
    case 4:
        PlaySE(SEQ_SE_DP_SELECT);
        sub_0200DC4C(work->unk14C[2], 6);
        if (ov122_021E8E70(work->unk240)) {
            EnqueueWorkflow(workflow, WORKFLOW_UNK_13); // open memo
        } else {
            EnqueueWorkflow(workflow, WORKFLOW_UNK_14);
        }
        return TRUE;
    case 2:
    case 3:
        PlaySE(SEQ_SE_DP_DECIDE);
        sub_0200DC4C(work->unk14C[3], 3);
        EnqueueWorkflow(workflow, WORKFLOW_QUIT_ROUND);
        return TRUE;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL ov122_021E6008(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    if (ov122_021E7F70(work)) {
        return TRUE;
    }
    return FALSE;
}

// If the selected row and column both have Voltorbs and if at least 75% of the
// unflipped cards in the selected row or column are Voltorbs, play suspenseful
// music.
BOOL PlaySuspensefulFanfare(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = CurrentTaskState(workflow);
    switch (state) {
    case 0:
        int var2 = ov122_021E8DF0(work->unk240);
        s16 col = var2 % 5;
        s16 row = var2 / 5;

        // Unused
        MultiplierCardsFlipped(work->game);
        MultiplierCards(work->game);

        int voltorbsInCol = VoltorbsAlongAxis(work->game, AXIS_COL, col);
        int voltorbsInRow = VoltorbsAlongAxis(work->game, AXIS_ROW, row);

        // Unused
        PointsAlongAxis(work->game, AXIS_COL, col);
        PointsAlongAxis(work->game, AXIS_ROW, row);

        if (voltorbsInCol != 0 && voltorbsInRow != 0) {
            MTRandom(); // unused

            int flippedInCol = FlippedCardsAlongAxis(work->game, AXIS_COL, col);
            int flippedInRow = FlippedCardsAlongAxis(work->game, AXIS_ROW, row);

            if ((100 * voltorbsInCol / (5 - flippedInCol)) >= 75 || (voltorbsInRow * 100) / (5 - flippedInRow) >= 75) {
                // "Is this what you were expecting?!"
                PrintMessageToSmallWindow(work, msg_0039_00029);
                PlayFanfare(SEQ_ME_CARDGAME1);
            }
        }
        IncrementTaskState(workflow);
        break;
    case 1:
        if (!IsSEPlaying(SEQ_SE_GS_PANERU_MEKURUMAE) && !IsFanfarePlaying()) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

BOOL StartCardFlipEffect(WorkflowEngine *work, VoltorbFlipAppWork *workflow) {
    int var1 = ov122_021E8DF0(workflow->unk240);
    ov122_021E70B8(&workflow->unk248, var1, 0, workflow);
    PlaySE(SEQ_SE_GS_PANERU_MEKURU);
    return TRUE;
}

BOOL AwaitCardFlipAndResult(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = CurrentTaskState(workflow);
    switch (state) {
    case 0:
        if (ov122_021E7168(&work->unk248)) {
            IncrementTaskState(workflow);
        }
        break;
    case 1:
        int cardId = ov122_021E8DF0(work->unk240);
        CardType type = GetCardType(work->game, cardId);

        s16 var4 = ((cardId % 5) * 4 + 1);
        s16 var5 = var4 * 8 + 12;

        s16 var6 = ((cardId / 5) * 4 + 1);
        s16 var7 = var6 * 8 + 12;

        sub_0200DCE8(work->unk14C[1], 1);
        FlipCard(work->game, cardId);
        if (type == CARD_TYPE_VOLTORB) {
            sub_0200DDB8(work->unk14C[1], var5, var7);
            sub_0200DC4C(work->unk14C[1], 1);
            // Plays Voltorb explosion SE
            PlaySE(SEQ_SE_GS_COIN_HAZURE);
        } else {
            int var8 = GamePayout(work->game);

            MultiplyPayoutAndUpdateCardsFlipped(work->game, type);

            int var9 = GamePayout(work->game);

            BufferIntegerAsString(work->msgFmt, 0, type, 1, PRINTING_MODE_LEFT_ALIGN, 1);
            BufferIntegerAsString(work->msgFmt, 1, var9, 5, PRINTING_MODE_LEFT_ALIGN, 1);
            sub_0200DDB8(work->unk14C[1], var5, var7);
            sub_0200DC4C(work->unk14C[1], 0);

            if (var8 == 0) {
                PrintMessageToSmallWindow(work, msg_0039_00030);
            } else if (IS_NOT_ONE_CARD(ov122_021E7FA8(work))) {
                PrintMessageToSmallWindow(work, msg_0039_00031);
            } else {
                return TRUE;
            }
        }
        IncrementTaskState(workflow);
        break;
    case 2:
        if (GF_IsAnySEPlaying() == 0) {
            IncrementTaskState(workflow);
        }
        break;
    case 3:
        if (ov122_021E7FA8(work) == CARD_TYPE_VOLTORB) {
            PlayFanfare(SEQ_ME_CARDGAME2);
            PrintMessageToSmallWindow(work, msg_0039_00032);
            PrintCoins(work, COIN_DISPLAY_PAYOUT, 0);
            IncrementTaskState(workflow);
        } else if (AddCoinsToPayout(work)) {
            IncrementTaskState(workflow);
        }
        break;
    case 4:
        if (ov122_021E7FA8(work) == CARD_TYPE_VOLTORB) {
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

BOOL ov122_021E6358(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    if (ov122_021E7FA8(work) == CARD_TYPE_VOLTORB) {
        SetRoundOutcome(work->game, ROUND_OUTCOME_LOST);
        EnqueueWorkflow(workflow, WORKFLOW_REVEAL_BOARD);
    } else if (EarnedMaxPayout(work->game)) {
        EnqueueWorkflow(workflow, WORKFLOW_UNK_10);
    } else {
        EnqueueWorkflow(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
    }
    BgClearTilemapBufferAndCommit(work->bgConfig, 3);
    return TRUE;
}

BOOL PlayWinRoundFanfare(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = CurrentTaskState(workflow);
    switch (state) {
    case 0:
        // "Game clear! You’ve found all of the hidden x2 and x3 cards..."
        PrintTextWindow(work, msg_0039_00033, 1);
        ov122_021E7888(&work->unk25C);
        PlayFanfare(SEQ_ME_MUSHITORI3);
        IncrementTaskState(workflow);
        // fallthrough
    case 1:
        if (!IsFanfarePlaying() && IsPrinterFinished(work)) {
            SetRoundOutcome(work->game, ROUND_OUTCOME_WON);
            EnqueueWorkflow(workflow, WORKFLOW_AWARD_COINS);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL AwardCoins(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = CurrentTaskState(workflow);
    switch (state) {
    case 0:
        int var2 = GamePayout(work->game);
        BufferIntegerAsString(work->msgFmt, 0, var2, 5, PRINTING_MODE_LEFT_ALIGN, 1);
        BufferPlayersName(work->msgFmt, 1, work->profile);
        // "{} received {} Coin(s)!"
        PrintTextWindow(work, msg_0039_00040, 1);
        ov122_021E7888(&work->unk25C);
        sub_02004EC4(64, 0, 0);
        PlaySE(SEQ_SE_GS_COIN_PAYOUT_ONE);
        IncrementTaskState(workflow);
        // fallthrough
    case 1:
        if (AwardPayoutToPlayer(work)) {
            IncrementTaskState(workflow);
        }
        break;
    case 2:
        if (!GF_IsAnySEPlaying() && IsPrinterFinished(work)) {
            sub_02004EC4(70, 0, 0);
            BgClearTilemapBufferAndCommit(work->bgConfig, 3);
            ov122_021E78B4(&work->unk25C);
            EnqueueWorkflow(workflow, WORKFLOW_REVEAL_BOARD);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL ov122_021E64E8(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = CurrentTaskState(workflow);
    switch (state) {
    case 0:
        ov122_021E70B8(&work->unk248, 0, 1, work);
        PlaySE(SEQ_SE_GS_PANERU_MEKURU);
        IncrementTaskState(workflow);
        break;
    case 1:
        if (ov122_021E7168(&work->unk248)) {
            IncrementTaskState(workflow);
        }
        break;
    case 2:
        if (System_GetTouchNew() != 0 || gSystem.newKeys != 0) {
            ov122_021E70B8(&work->unk248, 0, 2, work);
            IncrementTaskState(workflow);
        }
        break;
    case 3:
        if (ov122_021E7168(&work->unk248)) {
            EnqueueWorkflow(work->workflow, WORKFLOW_UNK_0);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL ov122_021E6594(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    ov122_021E8528(work->game);
    ov122_021E8D8C(work->unk240, 0);
    ov122_021E8E40(work->unk240);

    int payout = GamePayout(work->game);
    u16 coins = (u32)CheckCoins(work->coins);

    PrintCoins(work, COIN_DISPLAY_PAYOUT, payout);
    PrintCoins(work, COIN_DISPLAY_TOTAL, coins);
    PrintBoardVoltorbsAndPoints(work);

    work->unk230 = 1;
    return TRUE;
}

BOOL ov122_021E65F4(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    return ov122_021E5B5C(workflow, work);
}

BOOL ov122_021E65FC(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int var1 = ov122_021E8D74(work->unk240);
    switch (var1) {
    case 1:
        PlaySE(SEQ_SE_DP_SELECT);
        if (!ov122_021E8E70(work->unk240)) {
            EnqueueWorkflow(workflow, WORKFLOW_UNK_14);
            return TRUE;
        }
        break;
    case 3:
    case 4:
        PlaySE(SEQ_SE_DP_SELECT);
        work->unk238 = 0;
        sub_0200DC4C(work->unk14C[2], 6);
        EnqueueWorkflow(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
        return TRUE;
    case 2:
        PlaySE(SEQ_SE_DP_DECIDE);
        work->unk238 = 0;
        sub_0200DC4C(work->unk14C[3], 3);
        EnqueueWorkflow(workflow, WORKFLOW_QUIT_ROUND);
        return TRUE;
    case 5:
    case 6:
    case 7:
    case 8:
        int cardId = ov122_021E8DF0(work->unk240);

        u8 var3 = var1 - 5;
        TryToggleCardMemo(work, cardId, var3);
        break;
    case 0:
        ov122_021E72D0(work);
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL ov122_021E66CC(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int state = CurrentTaskState(workflow);
    if (state == 0) {
        ov122_021E78DC(&work->unk25C);
        SetMemoFocused(work->unk240, TRUE);
    }
    return ov122_021E5B5C(workflow, work);
}

BOOL ov122_021E66FC(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    return TRUE;
}

BOOL ov122_021E6700(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int var1 = ov122_021E8D74(work->unk240);
    switch (var1) {
    case 1:
        int cardId = ov122_021E8DF0(work->unk240);
        int var3 = ov122_021E8E0C(work->unk240);
        if (TryToggleCardMemo(work, cardId, var3)) {
            EnqueueWorkflow(workflow, WORKFLOW_UNK_13);
            return TRUE;
        }
        break;
    case 4:
        PlaySE(SEQ_SE_DP_SELECT);
        work->unk238 = 0;
        sub_0200DC4C(work->unk14C[2], 6);
        EnqueueWorkflow(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
        return TRUE;
    case 3:
        PlaySE(SEQ_SE_DP_BUTTON3);
        sub_0200DC4C(work->unk14C[9], 17);
        EnqueueWorkflow(workflow, WORKFLOW_UNK_13);
        return TRUE;
    case 2:
        PlaySE(SEQ_SE_DP_DECIDE);
        work->unk238 = 0;
        sub_0200DC4C(work->unk14C[3], 3);
        EnqueueWorkflow(workflow, WORKFLOW_QUIT_ROUND);
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
    int state = CurrentTaskState(workflow);
    switch (state) {
    case 0:
        ov122_021E72D0(work);
        IncrementTaskState(workflow);
        // fallthrough
    case 1:
        if (ov122_021E7F70(work)) {
            if (CurrentWorkflow(workflow) == WORKFLOW_UNK_14) {
                ov122_021E8E58(work->unk240);
                SetMemoFocused(work->unk240, FALSE);
                ov122_021E7904(&work->unk25C);
            }
            IncrementTaskState(workflow);
        }
        break;
    case 2:
        if (work->unk238 == 0) {
            AnimateCloseMenu(work);
            IncrementTaskState(workflow);
        } else {
            return TRUE;
        }
        break;
    case 3:
        if (sub_0200DCA0(work->unk14C[4]) == 0) {
            sub_0200DCE8(work->unk14C[4], 0);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL PrintAreYouSureYouWantToQuit(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int msgNo;

    int state = CurrentTaskState(workflow);
    switch (state) {
    case 0:
        int payout = GamePayout(work->game);
        if (payout == 0) {
            // "You haven’t found any Coins! Are you sure you..."
            msgNo = msg_0039_00037;
        } else {
            // "If you quit now, you will receive {} Coin(s)..."
            msgNo = msg_0039_00034;
            BufferIntegerAsString(work->msgFmt, 0, payout, 5, PRINTING_MODE_LEFT_ALIGN, 1);
        }
        ov122_021E7888(&work->unk25C);
        PrintTextWindow(work, msgNo, 1);
        IncrementTaskState(workflow);
        break;
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

BOOL ov122_021E6900(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    Unk122_021E6900 temp1 = {0};

    temp1.unk0 = work->bgConfig;
    temp1.unk4 = 3;
    temp1.unk8 = 31;
    temp1.unkC = 9;
    temp1.unk10 = 25;
    temp1.unk11 = 10;
    temp1.unk12 &= ~0xf0;

    sub_020166FC(work->unk13C, &temp1);
    return TRUE;
}

BOOL AwaitQuitYesNoSelection(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    int var1 = sub_020168F4(work->unk13C);
    switch (var1) {
    case 1: // YES
        int payout = GamePayout(work->game);

        SetRoundOutcome(work->game, ROUND_OUTCOME_QUIT);
        if (payout == 0) {
            BgClearTilemapBufferAndCommit(work->bgConfig, 3);
            ov122_021E78B4(&work->unk25C);
            EnqueueWorkflow(workflow, WORKFLOW_REVEAL_BOARD);
        } else {
            EnqueueWorkflow(workflow, WORKFLOW_AWARD_COINS);
        }
        return TRUE;
    case 2: // NO
        BgClearTilemapBufferAndCommit(work->bgConfig, 3);
        ov122_021E78B4(&work->unk25C);
        if (work->unk238 != 0) {
            EnqueueWorkflow(workflow, WORKFLOW_UNK_13);
        } else {
            EnqueueWorkflow(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
        }
        return TRUE;
    }
    return FALSE;
}

BOOL ov122_021E69DC(WorkflowEngine *workflow, VoltorbFlipAppWork *work) {
    sub_020169CC(work->unk13C);
    return TRUE;
}

static BOOL AddCoinsToPayout(VoltorbFlipAppWork *work) {
    u32 payout = GamePayout(work->game);
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

    u16 coins = (u32)CheckCoins(work->coins);
    u16 payout = GamePayout(work->game);

    if (System_GetTouchNew() || gSystem.newKeys != 0 || coins >= 50000) {
        DeductFromPayout(work->game, (u8)payout);
        GiveCoins(work->coins, payout);

        int newTotal = coins + payout;
        if (newTotal > 50000) {
            newTotal = 50000;
        }

        PrintCoins(work, COIN_DISPLAY_PAYOUT, 0);
        PrintCoins(work, COIN_DISPLAY_TOTAL, (u16)newTotal);
        payoutDeducted = FALSE;
    } else {
        payoutDeducted = DeductFromPayout(work->game, 1);
    }

    if (payoutDeducted) {
        GiveCoins(work->coins, 1);
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

    if (IsCardMemoFlagOn(work->game, cardId, memoFlag) != 0) {
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
        int voltorbs = VoltorbsAlongAxis(work->game, AXIS_ROW, i);
        buf[2] = voltorbs + 203;
        buf[3] = voltorbs + 235;
        LoadRectToBgTilemapRect(work->bgConfig, 2, &buf[2], 23, y, 1, 2);

        y += 4;
    }

    // Columns
    i = 0;
    int x = 3;
    for (; i < 5; i++) {
        int voltorbs = VoltorbsAlongAxis(work->game, AXIS_COL, i);
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
        int points = PointsAlongAxis(work->game, AXIS_ROW, i);

        buf[2] = points / 10 + 1;
        buf[3] = points % 10 + 1;
        LoadRectToBgTilemapRect(work->bgConfig, 2, &buf[2], 22, y, 2, 1);

        y += 4;
    }

    // Columns
    i = 0;
    int x = 2;
    for (; i < 5; i++) {
        int points = PointsAlongAxis(work->game, AXIS_COL, i);

        buf[0] = points / 10 + 1;
        buf[1] = points % 10 + 1;
        LoadRectToBgTilemapRect(work->bgConfig, 2, &buf[0], x, 21, 2, 1);

        x += 4;
    }
}

static int ov122_021E6E10(u8 a0, u8 a1) {
    GF_ASSERT(a1 < 2);
    GF_ASSERT(a0 < 5);

    return ov122_021E9278.unk0[a0][a1];
}

static void ov122_021E6E34(u16 *a0, int a1) {
    for (int i = 0; i < 9; i++) {
        a0[i] = a1 + (i / 3) * 32 + i % 3;
    }
}

static void ov122_021E6E60(BgConfig *a0, GameState *game, int cardId, int a3) {
    u16 temp1[9];

    int var1 = (cardId % 5) * 4 + 1;
    int var2 = (cardId / 5) * 4 + 1;
    int var3 = GetCardType(game, cardId);

    switch (a3) {
    case 0:
        ov122_021E6E34(temp1, 119);
        break;
    case 1:
        ov122_021E6E34(temp1, 26);
        break;
    case 2:
        ov122_021E6E34(temp1, ov122_021E6E10(var3, 0));
        break;
    case 3:
        ov122_021E6E34(temp1, ov122_021E6E10(var3, 1));
        break;
    default:
        GF_ASSERT(FALSE);
    }

    LoadRectToBgTilemapRect(a0, 0, temp1, var1, var2, 3, 3);
}

static void ov122_021E6F04(BgConfig *a0, GameState *game, int cardId, int a3) {
    u16 temp1[9];

    int var1 = (cardId % 5) * 4 + 1;
    int var2 = (cardId / 5) * 4 + 1;
    int var3 = GetCardType(game, cardId);

    switch (a3) {
    case 0:
        ov122_021E6E34(temp1, ov122_021E6E10(var3, 0));
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

    LoadRectToBgTilemapRect(a0, 0, temp1, var1, var2, 3, 3);
}

static void ov122_021E6F9C(Ov122_021E70B8 *a0) {
    ov122_021E6E60(a0->bgConfig, a0->game, a0->unk11, a0->unk10);
}

static BOOL ov122_021E6FB0(Ov122_021E70B8 *a0) {
    BOOL ret = FALSE;

    for (int i = 0; i < 25; i++) {
        if (!IsCardFlipped(a0->game, i & 0xFF)) {
            ret = TRUE;
            ov122_021E6E60(a0->bgConfig, a0->game, (u8)i, a0->unk10);
        }
    }

    return ret;
}

static void ov122_021E6FE4(Ov122_021E70B8 *a0) {
    int i;

    i = 0;
    int var1 = 0;
    for (; i < 5; i++) {
        ov122_021E6F04(a0->bgConfig, a0->game, (u8)(a0->unk13 + var1), a0->unk10);
        var1 += 5;
    }
}

static BOOL ov122_021E7008(Ov122_021E70B8 *a0) {
    BOOL ret = FALSE;

    for (int i = 0; i < 25; i++) {
        if (!IsCardFlipped(a0->game, i & 0xFF)) {
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

    BgCommitTilemapBufferToVram(a0->bgConfig, 0);
}

static void PrintBoardVoltorbsAndPoints(VoltorbFlipAppWork *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 2);
    PrintBoardVoltorbs(work);
    PrintBoardPoints(work);
    BgCommitTilemapBufferToVram(work->bgConfig, 2);
}

static void ov122_021E70B8(Ov122_021E70B8 *a0, int a1, int a2, VoltorbFlipAppWork *work) {
    a0->bgConfig = work->bgConfig;
    a0->unk8 = work->unk240;
    a0->game = work->game;
    a0->unkC = a2;
    a0->unk11 = a1;
    a0->unk10 = 0;
    a0->unk12 = 0;
    a0->unk13 = 5;

    switch (a2) {
    case 0:
        int var1 = (a0->unk11 % 5) * 4 + 1;
        int var2 = (a0->unk11 / 5) * 4 + 1;

        FillBgTilemapRect(work->bgConfig, 2, 0, var1, var2, 3, 3, 0);
        BgCommitTilemapBufferToVram(work->bgConfig, 2);
        return;
    case 1:
        FillBgTilemapRect(work->bgConfig, 2, 0, 1, 1, 20, 20, 0);
        BgCommitTilemapBufferToVram(work->bgConfig, 2);
        return;
    case 2:
        a0->unk13 = 0;
        return;
    default:
        GF_ASSERT(FALSE);
    case 3:
        return;
    }
}

static BOOL ov122_021E7168(Ov122_021E70B8 *a0) {
    if (a0->unk12 % 3 != 0) {
        ov122_021E703C(a0);
        if (++a0->unk10 >= 4) {
            a0->unk10 = 0;
            if (++a0->unk13 >= 5) {
                return TRUE;
            }
        }
    }
    a0->unk12++;
    return FALSE;
}

static void AnimateOpenMenu(VoltorbFlipAppWork *work) {
    GF_ASSERT(work->unk238 == 0);

    ov122_021E8E58(work->unk240);
    SetMemoOpen(work->unk240, TRUE);
    sub_0200DCE8(work->unk14C[4], 1);
    sub_0200DC4C(work->unk14C[4], 20);
    // "Close Memo" (text in button)
    PaintMessageOnWindow(work, 4, msg_0039_00007, &work->wMemo, 0, 0);
    work->unk238 = 1;
    PlaySE(SEQ_SE_DP_CARD2);
}

static void AnimateCloseMenu(VoltorbFlipAppWork *work) {
    GF_ASSERT(work->unk238 == 0);

    SetMemoOpen(work->unk240, FALSE);
    ov122_021E8E58(work->unk240);
    ov122_021E7274(work, 0);
    sub_0200DC4C(work->unk14C[4], 21);
    // "Open Memo" (text in button)
    PaintMessageOnWindow(work, 4, msg_0039_00006, &work->wMemo, 0, 0);
    PlaySE(SEQ_SE_DP_CARD2);
}

static void ov122_021E7274(VoltorbFlipAppWork *work, int a1) {
    sub_0200DCE8(work->unk14C[5], a1);
    sub_0200DCE8(work->unk14C[6], a1);
    sub_0200DCE8(work->unk14C[7], a1);
    sub_0200DCE8(work->unk14C[8], a1);

    if (a1 != 0) {
        if (CurrentWorkflow(work->workflow) == WORKFLOW_UNK_14) {
            a1 = 1;
        } else {
            a1 = 0;
        }
    }

    sub_0200DCE8(work->unk14C[9], a1);
}

static void ov122_021E72D0(VoltorbFlipAppWork *work) {
    int var1 = ov122_021E8DF0(work->unk240);

    if (ov122_021E8E28(work->unk240) != 0) {
        for (int i = 0; i < 4; i++) {
            GF_ASSERT(ov122_021E92B0[i][2] < 13);

            int var3 = ov122_021E92B0[i][2];
            void *var2 = work->unk14C[var3];
            int var4 = IsCardMemoFlagOn(work->game, var1, ov122_021E92B0[i][3]);
            sub_0200DC4C(var2, ov122_021E92B0[i][var4]);
        }
        ov122_021E7274(work, 1);
        return;
    }
    ov122_021E7274(work, 0);
}

// Returns TRUE if the player pressed the Back button.
static BOOL TryToggleCardMemo(VoltorbFlipAppWork *work, int cardId, int a2) {
    if (IsCardFlipped(work->game, cardId)) {
        PlaySE(SEQ_SE_DP_BOX03);
        return FALSE;
    }

    PlaySE(SEQ_SE_DP_BOX01);
    switch (a2) {
    case 4: // Back button
        return TRUE;
    case 0: // Voltorb button
        ToggleCardMemo(work->game, cardId, MEMO_VOLTORB);
        RenderCardMemo(work, cardId, MEMO_VOLTORB);
        break;
    case 1: // 1 button
        ToggleCardMemo(work->game, cardId, MEMO_ONE);
        RenderCardMemo(work, cardId, MEMO_ONE);
        break;
    case 2: // 2 button
        ToggleCardMemo(work->game, cardId, MEMO_TWO);
        RenderCardMemo(work, cardId, MEMO_TWO);
        break;
    case 3: // 3 button
        ToggleCardMemo(work->game, cardId, MEMO_THREE);
        RenderCardMemo(work, cardId, MEMO_THREE);
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

static void ov122_021E73FC(VoltorbFlipAppWork *work) {
    work->unk1C = sub_02018424(work->heapId, 0);

    for (int i = 0; i < 2; i++) {
        work->menuItems[i] = ListMenuItems_New(sMenuMsgNos[i].size, work->heapId);

        for (int j = 0; j < sMenuMsgNos[i].size; j++) {
            const u8 *msgNos = sMenuMsgNos[i].msgNos;
            ListMenuItems_AppendFromMsgData(work->menuItems[i], work->msgData, msgNos[j], j);
        }
    }
}

static void ov122_021E745C(VoltorbFlipAppWork *work) {
    for (int i = 0; i < 2; i++) {
        ListMenuItems_Delete(work->menuItems[i]);
        work->menuItems[i] = NULL;
    }
    sub_02018474(work->unk1C);
}

void ov122_021E7488(VoltorbFlipAppWork *a0, int a1)
{    
    Ov122_021E7488 temp1 = {0};   
    const MsgNoList *ptr = &sMenuMsgNos[a1];
    GF_ASSERT(a0->bgConfig != 0);

    temp1.unk0 = ov122_021E9278.unkA;

    temp1.unkC = a0->menuItems[a1];
    temp1.unk10 = a0->bgConfig;
    temp1.unk14 = ptr->size;
    
    a0->unk20 = sub_020185FC(a0->unk1C, &temp1, a0->unk228, 17, 17 - ptr->size * 3, 13, 0);
}

static int ov122_021E7514(VoltorbFlipAppWork *work) {
    int var1 = sub_020186A4(work->unk20);
    if (var1 == -1) {
        return -1;
    }

    work->unk228 = sub_02018674(work->unk20);
    sub_02018680(work->unk20);
    return var1;
}

static void RenderTopScreen(VoltorbFlipAppWork *work) {
    PaintMessageOnWindow(work, 4, msg_0039_00006, &work->wMemo, 0, 0);
    PaintMessageOnWindow(work, 4, msg_0039_00008, &work->wQuit, 0, 0);
    BgCommitTilemapBufferToVram(work->bgConfig, 1);

    BufferIntegerAsString(work->msgFmt, 0, 1, 1, PRINTING_MODE_LEFT_ALIGN, 1);

    PrintMessageOnWindow(work, 0, msg_0039_00000, &work->wCurrentLevel, 0, 0, 0x000f0100);
    PrintMessageOnWindow(work, 0, msg_0039_00001, &work->wFlipCardsAndCollectCoins, 0, 0, 0x000f0100);
    BufferPlayersName(work->msgFmt, 0, work->profile);

    PrintMessageOnWindow(work, 0, msg_0039_00002, &work->wx1x2x3, 0, 4, 0x000f0100);
    PrintMessageOnWindow(work, 0, msg_0039_00003, &work->wGameOver, 0, 4, 0x000f0100);
    PaintMessageOnWindow(work, 0, msg_0039_00004, &work->wCollectedCoins, 0, 0);
    PaintMessageOnWindow(work, 0, msg_0039_00005, &work->wPayout, 0, 0);
    BgCommitTilemapBufferToVram(work->bgConfig, 5);
}

static void AddWindows(VoltorbFlipAppWork *work) {
    for (int i = 0; i < 17; i++) {
        AddWindow(work->bgConfig, &work->windows[i], &sVoltorbFlipWindowTemplates[i]);
        FillWindowPixelBuffer(&work->windows[i], 0);
    }
    RenderTopScreen(work);
}

static void ov122_021E765C(VoltorbFlipAppWork *work) {
    for (int i = 0; i < 17; i++) {
        ClearWindowTilemapAndCopyToVram(&work->windows[i]);
        RemoveWindow(&work->windows[i]);
    }
}

// Like PrintMessageOnWindow but it gets printed all at once.
static void PaintMessageOnWindow(VoltorbFlipAppWork *work, FontID fontId, u8 msgNo, Window *window, u8 x, u8 y) {
    PrintMessageOnWindow(work, fontId, msgNo, window, x, y, 0x00010200);
}

static void PrintMessageOnWindow(VoltorbFlipAppWork *work, FontID fontId, u8 msgNo, Window *window, u8 x, u8 y, u32 textSpeed) {
    FillWindowPixelBuffer(window, 0);

    String *str = ReadMsgData_ExpandPlaceholders(work->msgFmt, work->msgData, msgNo, work->heapId);
    AddTextPrinterParameterized2(window, fontId, str, x, y, 0xff, textSpeed, 0);

    ScheduleWindowCopyToVram(window);
    String_Delete(str);
}

static void PrintMessageToSmallWindow(VoltorbFlipAppWork *work, int msgNo) {
    Window *window = &work->wSmall;

    FillWindowPixelBuffer(window, 15);

    String *str = ReadMsgData_ExpandPlaceholders(work->msgFmt, work->msgData, msgNo, work->heapId);

    FillBgTilemapRect(work->bgConfig, 3, 0, 0, 20, 32, 4, 0);
    DrawFrameAndWindow2(window, 1, 1, 13);

    AddTextPrinterParameterized(window, 1, str, 0, 0, 0xff, 0);
    ScheduleWindowCopyToVram(window);
    String_Delete(str);
    BgCommitTilemapBufferToVram(work->bgConfig, 3);
}

// Prints a message in the main text window.
static void PrintTextWindow(VoltorbFlipAppWork *work, int msgNo, int a2) {
    String *str;
    Window *window = &work->wMain;

    GF_ASSERT(work->string == NULL);

    FillWindowPixelBuffer(window, 15);
    if (msgNo == 25) {
        str = NewString_ReadMsgData(work->msgData, msgNo);
    } else {
        str = ReadMsgData_ExpandPlaceholders(work->msgFmt, work->msgData, msgNo, work->heapId);
    }

    if (a2 != 0) {
        FillBgTilemapRect(work->bgConfig, 3, 0, 0, 18, 32, 6, 0);
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
    u8 displayLevel = 8 - GameLevel(work->game);

    BufferIntegerAsString(work->msgFmt, idx, displayLevel, 1, PRINTING_MODE_LEFT_ALIGN, 1);
}

static void ov122_021E7888(Ov122_021E7888 *a0) {
    if (a0->unk0 == 0) {
        InitScreenBrightnessData(SCREEN_MASK_MAIN);
        StartBrightnessTransition(4, -8, 0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
        a0->unk0 = 1;
    }
}

static void ov122_021E78B4(Ov122_021E7888 *a0) {
    InitScreenBrightnessData(SCREEN_MASK_MAIN);
    StartBrightnessTransition(4, 0, -8, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
    a0->unk0 = 0;
}

static void ov122_021E78DC(Ov122_021E7888 *a0) {
    if (a0->unk0 == 0) {
        InitScreenBrightnessData(SCREEN_MASK_MAIN);
        StartBrightnessTransition(1, -6, 0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
        a0->unk0 = 1;
    }
}

static void ov122_021E7904(Ov122_021E7888 *a0) {
    InitScreenBrightnessData(SCREEN_MASK_MAIN);
    StartBrightnessTransition(1, 0, -6, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
    a0->unk0 = 0;
}

static void ov122_021E7928(VoltorbFlipAppWork *work) {
    work->bgConfig = BgConfig_Alloc(work->heapId);

    const struct GraphicsModes temp1 = sVoltorbFlipBgModeSet;
    SetBothScreensModesAndDisable(&temp1);

    BgTemplates temp2 = sVoltorbFlipBgTemplates;

    for (int i = 0; i < 6; i++) {
        InitBgFromTemplate(work->bgConfig, ov122_021E9270[i], &temp2.unk0[i], 0);
        BgClearTilemapBufferAndCommit(work->bgConfig, ov122_021E9270[i]);
        BG_FillCharDataRange(work->bgConfig, (enum GFBgLayer)ov122_021E9270[i], 0, 1, 0);
        ToggleBgLayer(ov122_021E9270[i], GX_LAYER_TOGGLE_ON);
    }
}

static void ov122_021E79A4(VoltorbFlipAppWork *work) {
    for (int i = 0; i < 6; i++) {
        FreeBgTilemapBuffer(work->bgConfig, ov122_021E9270[i]);
    }

    FontID_Release(4);
    FreeToHeap(work->bgConfig);
}

static void ov122_021E79D0(VoltorbFlipAppWork *work) {
    FontID_Alloc(4, work->heapId);
    GF_ASSERT(work->narc != 0);

    GfGfxLoader_GXLoadPalFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000000_bin, GF_BG_LYR_MAIN_0, 0, 0, work->heapId);
    GfGfxLoader_GXLoadPal(NARC_graphic_font, 9, GF_BG_LYR_MAIN_0, 0x1c0, 32, work->heapId);
    LoadFontPal1(GF_BG_LYR_MAIN_0, 0x180, work->heapId);
    LoadFontPal0(GF_BG_LYR_SUB_0, 0x180, work->heapId);
    GfGfxLoader_GXLoadPal(NARC_graphic_font, 9, GF_BG_LYR_SUB_0, 0x1a0, 32, work->heapId);
    LoadUserFrameGfx2(work->bgConfig, GF_BG_LYR_MAIN_3, 1, 13, work->unk229, work->heapId);
    GfGfxLoader_LoadCharDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000002_bin, work->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, 1, work->heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000004_bin, work->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, 1, work->heapId);
    GfGfxLoader_LoadCharDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000002_bin, work->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 1, work->heapId);
    GfGfxLoader_GXLoadPalFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000001_bin, GF_BG_LYR_SUB_0, 0, 0, work->heapId);
    GfGfxLoader_LoadCharDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000003_bin, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, 1, work->heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000006_bin, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, 1, work->heapId);
}

static void ov122_021E7AEC(VoltorbFlipAppWork *work) {
    Unk122_021E92E4 temp1 = ov122_021E92E4;
    Unk122_021E92FC temp2 = ov122_021E92FC;
    Unk122_021E92D0 temp3 = ov122_021E92D0;
    temp3.unk0 = 0x80;

    work->unk144 = sub_0200CF18(work->heapId);
    work->unk148 = sub_0200CF38(work->unk144);

    sub_0200CF70(work->unk144, &temp2, &temp3, 32);
    sub_0200CFF4(work->unk144, work->unk148, 0x80);
    sub_0200D3F8(work->unk144, work->unk148, &temp1);

    G2dRenderer_SetSubSurfaceCoords(sub_0200CF6C(work->unk144), 0, 0x20c000);
}

static void ov122_021E7B94(VoltorbFlipAppWork *work) {
    GF_ASSERT(work->unk144 != 0);
    GF_ASSERT(work->unk148 != 0);

    ov122_021E7F48(work);
    sub_0200D998(work->unk144, work->unk148);
    sub_0200D108(work->unk144);
}

// decomp.me: https://decomp.me/scratch/w6ui6
#ifdef NONMATCHING
static void ov122_021E7BD4(VoltorbFlipAppWork *work) {
    GF_ASSERT(work->narc != 0);

    Unk122_021E7C9C *var1 = work->unk144;
    void *var2 = work->unk148;

    sub_0200D5D4(var1, var2, work->narc, NARC_voltorb_flip_voltorb_flip_00000010_bin, 0, 5, 1, 0);
    sub_0200D504(var1, var2, work->narc, NARC_voltorb_flip_voltorb_flip_00000011_bin, 1, 1, 0);
    sub_0200D6EC(var1, var2, work->narc, NARC_voltorb_flip_voltorb_flip_00000012_bin, 1, 0);
    sub_0200D71C(var1, var2, work->narc, NARC_voltorb_flip_voltorb_flip_00000013_bin, 1, 0);

    sub_0200D5D4(var1, var2, work->narc, NARC_voltorb_flip_voltorb_flip_00000014_bin, 0, 1, 2, 1);
    sub_0200D504(var1, var2, work->narc, NARC_voltorb_flip_voltorb_flip_00000015_bin, 1, 2, 1);
    sub_0200D6EC(var1, var2, work->narc, NARC_voltorb_flip_voltorb_flip_00000016_bin, 1, 1);
    sub_0200D71C(var1, var2, work->narc, NARC_voltorb_flip_voltorb_flip_00000017_bin, 1, 1);
}
#else
asm void ov122_021E7BD4(VoltorbFlipAppWork *work) {
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _021E7BE4
	bl GF_AssertFail
_021E7BE4:
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	add r0, r0, #4
	ldr r4, [r5, r0]
	mov r1, #0
	str r1, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r7, #1
	str r7, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0xa
	bl sub_0200D5D4
	add r0, r7, #0
	str r0, [sp]
	str r7, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0xb
	bl sub_0200D504
	add r0, r7, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0xc
	bl sub_0200D6EC
	add r0, r7, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0xd
	bl sub_0200D71C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	mov r7, #2
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0xe
	bl sub_0200D5D4
	mov r0, #1
	str r0, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0xf
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0x10
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0x11
	bl sub_0200D71C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
}
#endif //NONMATCHING

static UnkStruct_0200CF18 *ov122_021E7C9C(Unk122_021E7C9C *a0, void *a1, u16 a2, u16 a3, u16 a4, u16 a5) {
    Unk122_021E9374 temp1 = ov122_021E9374;

    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a1 != NULL);

    temp1.unk0 = a2;
    temp1.unk2 = a3;
    temp1.unk6 = a4;
    temp1.unk8 = a5;

    UnkStruct_0200CF18 *var1 = sub_0200D740(a0, a1, &temp1, 0x20c000);
    sub_0200DC78(var1, 1);
    sub_0200DCE8(var1, 0);
    return var1;
}

static UnkStruct_0200CF18 *ov122_021E7D04(Unk122_021E7C9C *a0, void *a1, u16 a2, u16 a3, u16 a4, u16 a5) {
    Unk122_021E9374 temp1 = ov122_021E93A8;

    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a1 != NULL);

    temp1.unk0 = a2;
    temp1.unk2 = a3;
    temp1.unk6 = a4;
    temp1.unk8 = a5;

    UnkStruct_0200CF18 *var1 = sub_0200D740(a0, a1, &temp1, 0x20c000);
    sub_0200DC78(var1, 1);
    sub_0200DCE8(var1, 0);
    return var1;
}

static void ov122_021E7D6C(VoltorbFlipAppWork *work) {
    work->unk14C[0] = ov122_021E7C9C(work->unk144, work->unk148, 0, 0, 18, 1);
    work->unk14C[1] = ov122_021E7C9C(work->unk144, work->unk148, 0, 0, 0, 0);
    work->unk14C[2] = ov122_021E7C9C(work->unk144, work->unk148, 0xe0, 0x28, 5, 2);
    work->unk14C[3] = ov122_021E7C9C(work->unk144, work->unk148, 0xe0, 0xb0, 2, 2);
    work->unk14C[4] = ov122_021E7C9C(work->unk144, work->unk148, 0x80, 0x60, 20, 5);
    work->unk14C[5] = ov122_021E7C9C(work->unk144, work->unk148, 0xc8, 0x50, 12, 4);
    work->unk14C[6] = ov122_021E7C9C(work->unk144, work->unk148, 0xe0, 0x50, 15, 4);
    work->unk14C[7] = ov122_021E7C9C(work->unk144, work->unk148, 0xc8, 0x68, 14, 4);
    work->unk14C[8] = ov122_021E7C9C(work->unk144, work->unk148, 0xe0, 0x68, 13, 4);
    work->unk14C[9] = ov122_021E7C9C(work->unk144, work->unk148, 0xe0, 0x80, 16, 3);
    work->unk14C[10] = ov122_021E7C9C(work->unk144, work->unk148, 0xc8, 0x50, 18, 1);
    work->unk14C[11] = ov122_021E7D04(work->unk144, work->unk148, 0x48, 0x38, 0, 0);
    work->unk14C[12] = ov122_021E7D04(work->unk144, work->unk148, 0x88, 0x28, 0, 0);

    ov122_021E7F64(work->unk14C[12]->unk_00, 0x20000);

    sub_0200DCE8(work->unk14C[2], 1);
    sub_0200DCE8(work->unk14C[3], 1);
    sub_0200DD54(work->unk14C[1], 1);
    sub_0200DD10(work->unk14C[10], 4);
}

static void ov122_021E7F48(VoltorbFlipAppWork *work) {
    for (int i = 0; i < 13; i++) {
        sub_0200D9DC(work->unk14C[i]);
    }
}

static void ov122_021E7F64(void *a0, u32 a1) {
    Unk122_021E7F64 *ptr = sub_02024CB8(a0);
    ptr->unk10 = a1;
}

static BOOL ov122_021E7F70(VoltorbFlipAppWork *work) {
    return !sub_0200DCA0(work->unk14C[3]) && !sub_0200DCA0(work->unk14C[2]) && !sub_0200DCA0(work->unk14C[9]);
}

static CardType ov122_021E7FA8(VoltorbFlipAppWork *work) {
    return GetCardType(work->game, ov122_021E8DF0(work->unk240));
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
    case 0:
    case 3:
    case 5:
    case 6:
    case 7:
    default:
        GF_ASSERT(FALSE);
        GF_ASSERT(FALSE);
        return 0;
    }
}

static void ov122_021E8004(VoltorbFlipAppWork *work) {
    GF_ASSERT(work != NULL);
    GF_ASSERT(work->unk148 != NULL);

    sub_0200D020(work->unk148);
    sub_0200D034();
    DoScheduledBgGpuUpdates(work->bgConfig);

    REGType32v *regBase = (REGType32v *)0x027e0000;
    *(regBase + 0xffe) |= 1;
}

static void SetGXBanks(void) {
    GraphicsBanks banks = sVoltorbFlipGraphicsBanks;
    GX_SetBanks(&banks);
}

static void ov122_021E8068(void) {
    HBlankInterruptDisable();
    GX_DisableEngineALayers();
    GX_DisableEngineBLayers();

    reg_GX_DISPCNT &= 0xffffe0ff;
    reg_GXS_DB_DISPCNT &= 0xffffe0ff;
}

static void ov122_021E8094(OVY_MANAGER *man) {
    VoltorbFlipAppArgs *args = OverlayManager_GetArgs(man);
    GF_ASSERT(args != NULL);

    Main_SetVBlankIntrCB(NULL, NULL);
    reg_GX_POWCNT &= 0xffff7fff;

    ov122_021E8068();
    SetGXBanks();

    CreateHeap(3, HEAP_ID_VOLTORB_FLIP, 0x50000);

    VoltorbFlipAppWork *work = OverlayManager_CreateAndGetData(man, sizeof(VoltorbFlipAppWork), HEAP_ID_VOLTORB_FLIP);
    MI_CpuFill8(work, 0, sizeof(VoltorbFlipAppWork));
    work->heapId = HEAP_ID_VOLTORB_FLIP;
    work->options = args->options;
    work->coins = args->coins;
    work->unkC = args->unk8;
    work->profile = args->profile;
    work->unk228 = sub_020183F0(work->unkC);
    work->unk229 = Options_GetFrame(work->options);
    work->unk22A = Options_GetTextFrameDelay(work->options);

    work->narc = NARC_New(NARC_application_voltorb_flip, work->heapId);
    work->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0039_bin, work->heapId);
    work->msgFmt = MessageFormat_New(work->heapId);
    work->unk13C = sub_0201660C(work->heapId);

    ov122_021E7928(work);
    ov122_021E79D0(work);
    AddWindows(work);
    ov122_021E73FC(work);
    ov122_021E6B38(work);

    u16 coins = (u32)CheckCoins(work->coins);
    PrintCoins(work, COIN_DISPLAY_TOTAL, coins);
    ov122_021E7AEC(work);
    ov122_021E7BD4(work);
    ov122_021E7D6C(work);

    work->workflow = CreateWorkflowEngine(work->heapId, (VoltorbFlipWorkflows *)&sVoltorbFlipWorkflows, NELEMS(sVoltorbFlipWorkflows), work);
    work->unk240 = ov122_021E8CFC(work->heapId, work->unk14C[0], work->unk14C[10]);
    work->game = CreateGameState(work->heapId);
    PrintBoardVoltorbsAndPoints(work);

    sub_02004EC4(0x46, 0, 0);
    GX_EngineAToggleLayers(16, GX_LAYER_TOGGLE_ON);
    GX_EngineBToggleLayers(16, GX_LAYER_TOGGLE_ON);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
    TextFlags_SetCanABSpeedUpPrint(TRUE);
    sub_02002B8C(TRUE);

    Main_SetVBlankIntrCB((GFIntrCB)ov122_021E8004, work);
    GameStats_AddSpecial(Save_GameStats_Get(args->saveData), GAME_STAT_UNK6);
}

static void FreeOverlayData(OVY_MANAGER *man) {
    VoltorbFlipAppWork *work = OverlayManager_GetData(man);
    Main_SetVBlankIntrCB(NULL, NULL);
    FreeGameState(work->game);
    ov122_021E8D58(work->unk240);
    FreeWorkflowEngine(work->workflow);
    ov122_021E7B94(work);

    sub_02016624(work->unk13C);
    ov122_021E745C(work);
    ov122_021E765C(work);
    ov122_021E79A4(work);

    MessageFormat_Delete(work->msgFmt);
    DestroyMsgData(work->msgData);
    NARC_Delete(work->narc);
    ov122_021E8068();
    OverlayManager_FreeData(man);
    DestroyHeap(HEAP_ID_VOLTORB_FLIP);
}

BOOL VoltorbFlipApp_OvyInit(OVY_MANAGER *man, int *state) {
    switch (*state) {
    case 0:
        ov122_021E8094(man);
        *state += 1;
        break;
    case 1:
        VoltorbFlipAppWork *work = OverlayManager_GetData(man);
        BeginNormalPaletteFade(0, 0x15, 0x15, 0, 6, 1, work->heapId);
        *state += 1;
        break;
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

BOOL VoltorbFlipApp_OvyExit(OVY_MANAGER *man, int *state) {
    VoltorbFlipAppWork *work = OverlayManager_GetData(man);
    switch (*state) {
    case 0:
        BeginNormalPaletteFade(0, 0x14, 0x14, 0, 6, 1, work->heapId);
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

BOOL VoltorbFlipApp_OvyExec(OVY_MANAGER *man, int *state) {
    VoltorbFlipAppWork *work = OverlayManager_GetData(man);
    if (RunWorkflowEngine(work->workflow)) {
        return TRUE;
    }
    return FALSE;
}
