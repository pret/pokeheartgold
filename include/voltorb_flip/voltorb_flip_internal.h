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
    VF_SPRITE_MEMO_CURSOR,
    VF_SPRITE_10,
    VF_SPRITE_11,
    VF_SPRITE_12,
    VF_SPRITE_NUM,
} VoltorbFlipSpriteID;

#include "voltorb_flip/voltorb_flip_work.h"
#include "voltorb_flip/voltorb_flip_workflow.h"

BOOL VoltorbFlipTaskEngine_InitChecks_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_InitChecks_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_NewRound_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_NewRound_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_NewRound_TidyUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_SelectMainMenu_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_SelectMainMenu_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_SelectMainMenu_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_SelectGameInfo_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_SelectGameInfo_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_SelectGameInfo_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_HowToPlayScreen_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_HowToPlayScreen_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_TutorialScreens_TidyUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_HintScreen_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_HintScreen_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_TutorialScreens_TidyUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_AboutMemoScreen_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_AboutMemoScreen_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_TutorialScreens_TidyUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_RenderBoard_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_BoardInteraction_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_BoardInteraction_TidyUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltrbFlipWorkflow_CardFlipEffect_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_CardFlipEffect_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_CardFlipEffect_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_CardFlipEffect_End(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_WinRound_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_AwardCoins_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_RevealBoard_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_RevealBoard_End(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_MemoTouch_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_MemoTouch_Run(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_Memo_TidyUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_MemoButtons_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_MemoButtons_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_MemoTouch_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_MemoTouch_End(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_QuitRound_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_QuitRound_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_QuitRound_Run(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
BOOL VoltorbFlipTaskEngine_QuitRound_End(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);

extern const VoltorbFlipTasks sVoltorbFlipWorkflows;

#endif // POKEHEARTGOLD_VOLTORB_FLIP_INTERNAL_H
