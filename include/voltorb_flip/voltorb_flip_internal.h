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

#include "voltorb_flip/voltorb_flip_app_data.h"
#include "voltorb_flip/voltorb_flip_tasks.h"

BOOL VoltorbFlipTaskEngine_InitChecks_Begin(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_InitChecks_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_NewRound_Begin(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_NewRound_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_NewRound_TidyUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_SelectMainMenu_SetUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_SelectMainMenu_Begin(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_SelectMainMenu_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_SelectGameInfo_SetUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_SelectGameInfo_Begin(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_SelectGameInfo_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_HowToPlayScreen_SetUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_HowToPlayScreen_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_TutorialScreens_TidyUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_HintScreen_SetUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_HintScreen_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_TutorialScreens_TidyUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_AboutMemoScreen_SetUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_AboutMemoScreen_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_TutorialScreens_TidyUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_RenderBoard_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_BoardInteraction_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_BoardInteraction_TidyUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltrbFlipWorkflow_CardFlipEffect_SetUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_CardFlipEffect_Begin(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_CardFlipEffect_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_CardFlipEffect_End(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_WinRound_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_AwardCoins_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_RevealBoard_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_RevealBoard_End(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_MemoTouch_SetUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_MemoTouch_Run(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_Memo_TidyUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_MemoButtons_SetUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_MemoButtons_Begin(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_MemoTouch_Main(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_MemoTouch_End(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_QuitRound_SetUp(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_QuitRound_Begin(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_QuitRound_Run(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);
BOOL VoltorbFlipTaskEngine_QuitRound_End(VoltorbFlipTaskEngine *taskEngine, VoltorbFlipAppData *voltorbFlip);

extern const VoltorbFlipTasks sVoltorbFlipWorkflows;

#endif // POKEHEARTGOLD_VOLTORB_FLIP_INTERNAL_H
