#ifndef POKEHEARTGOLD_VOLTORB_FLIP_INTERNAL_H
#define POKEHEARTGOLD_VOLTORB_FLIP_INTERNAL_H

typedef enum VoltorbFlipSpriteID {
    VF_SPRITE_00,
    VF_SPRITE_FLIPPING_CARD,
    VF_SPRITE_02,
    VF_SPRITE_03,
    VF_SPRITE_MEMO,
    VF_SPRITE_TOGGLE_MEMO_VOLTORB,
    VF_SPRITE_TOGGLE_MEMO_ONE,
    VF_SPRITE_TOGGLE_MEMO_TWO,
    VF_SPRITE_TOGGLE_MEMO_THREE,
    VF_SPRITE_09,
    VF_SPRITE_10,
    VF_SPRITE_11,
    VF_SPRITE_12,
    VF_SPRITE_NUM,
} VoltorbFlipSpriteID;

#include "voltorb_flip/voltorb_flip_work.h"
#include "voltorb_flip/voltorb_flip_workflow.h"

BOOL VoltorbFlipWorkflow_InitChecks_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_InitChecks_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_NewRound_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_NewRound_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_NewRound_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_SelectMainMenu_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_SelectMainMenu_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_SelectMainMenu_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_SelectGameInfo_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_SelectGameInfo_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_SelectGameInfo_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_HowToPlayScreen_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_HowToPlayScreen_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_TutorialScreens_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_HintScreen_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_HintScreen_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_TutorialScreens_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_AboutMemoScreen_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_AboutMemoScreen_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_TutorialScreens_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_RenderBoard_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_BoardInteraction_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_BoardInteraction_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltrbFlipWorkflow_CardFlipEffect_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_CardFlipEffect_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_CardFlipEffect_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_CardFlipEffect_End(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_WinRound_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_AwardCoins_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_RevealBoard_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_RevealBoard_End(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_MemoTouch_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_MemoTouch_Run(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_Memo_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_MemoButtons_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_MemoButtons_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_MemoTouch_Main(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_MemoTouch_End(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_QuitRound_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_QuitRound_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_QuitRound_Run(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_QuitRound_End(WorkflowEngine *workflow, VoltorbFlipAppWork *work);

extern const VoltorbFlipWorkflows sVoltorbFlipWorkflows;

#endif // POKEHEARTGOLD_VOLTORB_FLIP_INTERNAL_H
