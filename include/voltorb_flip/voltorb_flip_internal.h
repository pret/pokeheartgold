#ifndef POKEHEARTGOLD_VOLTORB_FLIP_INTERNAL_H
#define POKEHEARTGOLD_VOLTORB_FLIP_INTERNAL_H

typedef enum VoltorbFlipSpriteID {
    VF_SPRITE_00,
    VF_SPRITE_FLIPPING_CARD,
    VF_SPRITE_02,
    VF_SPRITE_03,
    VF_SPRITE_04,
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
BOOL VoltorbFlipWorkflow_InitChecks_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_NewRound_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_NewRound_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_NewRound_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_SelectMainMenu_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_SelectMainMenu_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_SelectMainMenu_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_SelectGameInfo_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_SelectGameInfo_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_SelectGameInfo_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_HowToPlayScreen_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_HowToPlayScreen_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_TutorialScreens_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_HintScreen_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_HintScreen_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_TutorialScreens_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_AboutMemoScreen_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_AboutMemoScreen_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_TutorialScreens_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_RenderBoard_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_BoardInteraction_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_BoardInteraction_TidyUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltrbFlipWorkflow_CardFlipEffect_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_CardFlipEffect_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_CardFlipEffect_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_CardFlipEffect_End(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_WinRound_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_AwardCoins_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_RevealBoard_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_RevealBoard_End(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL ov122_021E65F4(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL ov122_021E65FC(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL ov122_021E67E0(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL ov122_021E66CC(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL ov122_021E66FC(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL ov122_021E6700(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL ov122_021E67DC(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_QuitRound_SetUp(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_QuitRound_Begin(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_QuitRound_Wait(WorkflowEngine *workflow, VoltorbFlipAppWork *work);
BOOL VoltorbFlipWorkflow_QuitRound_End(WorkflowEngine *workflow, VoltorbFlipAppWork *work);

extern const VoltorbFlipWorkflows sVoltorbFlipWorkflows;

#endif // POKEHEARTGOLD_VOLTORB_FLIP_INTERNAL_H
