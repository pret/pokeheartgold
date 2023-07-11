#include "global.h"
#include "voltorb_flip/voltorb_flip_internal.h"
#include "voltorb_flip/voltorb_flip_workflow.h"

const VoltorbFlipWorkflows sVoltorbFlipWorkflows = {
    [WORKFLOW_UNK_0]                = { NULL, ov122_021E5BA8, ov122_021E5BE4, NULL, NULL },
    [WORKFLOW_NEW_ROUND]            = { NULL, GenerateBoardAndPrintNewLevel, PrintYouCanEarnEvenMoreCoins, NULL, ov122_021E5D24 },
    [WORKFLOW_SELECT_MAIN_MENU]     = { PrintPlayNewRound, ov122_021E5DB4, AwaitMainMenuSelection, NULL, NULL },
    [WORKFLOW_SELECT_GAME_INFO]     = { PrintWhichSetOfInfo, ov122_021E5E34, AwaitGameInfoSelection, NULL, NULL },
    [WORKFLOW_HOW_TO_PLAY]          = { OpenHowToPlayScreen, NULL, PrintHowToPlayMsg, NULL, CloseTutorialScreen },
    [WORKFLOW_HINT]                 = { OpenHintScreen, NULL, PrintHintMsg, NULL, CloseTutorialScreen },
    [WORKFLOW_ABOUT_MEMO]           = { OpenAboutMemoScreen, NULL, PrintAboutMemoMsg, NULL, CloseTutorialScreen },
    [WORKFLOW_RENDER_BOARD]         = { NULL, NULL, RenderBoard, NULL, NULL },
    [WORKFLOW_AWAIT_BOARD_INTERACT] = { NULL, NULL, AwaitBoardInteraction, NULL, ov122_021E6008 },
    [WORKFLOW_FLIP_CARD]            = { PlaySuspensefulFanfare, StartCardFlipEffect, AwaitCardFlipAndResult, ov122_021E6358, NULL },
    [WORKFLOW_UNK_10]               = { NULL, NULL, PlayWinRoundFanfare, NULL, NULL },
    [WORKFLOW_AWARD_COINS]          = { NULL, NULL, AwardCoins, NULL, NULL },
    [WORKFLOW_REVEAL_BOARD]         = { NULL, NULL, ov122_021E64E8, ov122_021E6594, NULL },
    [WORKFLOW_UNK_13]               = { ov122_021E65F4, NULL, ov122_021E65FC, NULL, ov122_021E67E0 },
    [WORKFLOW_UNK_14]               = { ov122_021E66CC, ov122_021E66FC, ov122_021E6700, ov122_021E67DC, ov122_021E67E0 },
    [WORKFLOW_QUIT_ROUND]           = { PrintAreYouSureYouWantToQuit, ov122_021E6900, AwaitQuitYesNoSelection, ov122_021E69DC, NULL },
};
