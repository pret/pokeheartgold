#include "voltorb_flip/voltorb_flip_tasks.h"

#include "global.h"

#include "voltorb_flip/voltorb_flip_internal.h"

#include "heap.h"

const VoltorbFlipTasks sVoltorbFlipWorkflows = {
    [WORKFLOW_COIN_CASE_FULL] = {
                                 .setup = NULL,
                                 .begin = VoltorbFlipTaskEngine_InitChecks_Begin,
                                 .main = VoltorbFlipTaskEngine_InitChecks_Main,
                                 .end = NULL,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_NEW_ROUND] = {
                                 .setup = NULL,
                                 .begin = VoltorbFlipTaskEngine_NewRound_Begin,
                                 .main = VoltorbFlipTaskEngine_NewRound_Main,
                                 .end = NULL,
                                 .tidy = VoltorbFlipTaskEngine_NewRound_TidyUp,
                                 },
    [WORKFLOW_SELECT_MAIN_MENU] = {
                                 .setup = VoltorbFlipTaskEngine_SelectMainMenu_SetUp,
                                 .begin = VoltorbFlipTaskEngine_SelectMainMenu_Begin,
                                 .main = VoltorbFlipTaskEngine_SelectMainMenu_Main,
                                 .end = NULL,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_SELECT_GAME_INFO] = {
                                 .setup = VoltorbFlipTaskEngine_SelectGameInfo_SetUp,
                                 .begin = VoltorbFlipTaskEngine_SelectGameInfo_Begin,
                                 .main = VoltorbFlipTaskEngine_SelectGameInfo_Main,
                                 .end = NULL,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_HOW_TO_PLAY] = {
                                 .setup = VoltorbFlipTaskEngine_HowToPlayScreen_SetUp,
                                 .begin = NULL,
                                 .main = VoltorbFlipTaskEngine_HowToPlayScreen_Main,
                                 .end = NULL,
                                 .tidy = VoltorbFlipTaskEngine_TutorialScreens_TidyUp,
                                 },
    [WORKFLOW_HINT] = {
                                 .setup = VoltorbFlipTaskEngine_HintScreen_SetUp,
                                 .begin = NULL,
                                 .main = VoltorbFlipTaskEngine_HintScreen_Main,
                                 .end = NULL,
                                 .tidy = VoltorbFlipTaskEngine_TutorialScreens_TidyUp,
                                 },
    [WORKFLOW_ABOUT_MEMO] = {
                                 .setup = VoltorbFlipTaskEngine_AboutMemoScreen_SetUp,
                                 .begin = NULL,
                                 .main = VoltorbFlipTaskEngine_AboutMemoScreen_Main,
                                 .end = NULL,
                                 .tidy = VoltorbFlipTaskEngine_TutorialScreens_TidyUp,
                                 },
    [WORKFLOW_RENDER_BOARD] = {
                                 .setup = NULL,
                                 .begin = NULL,
                                 .main = VoltorbFlipTaskEngine_RenderBoard_Main,
                                 .end = NULL,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_AWAIT_BOARD_INTERACT] = {
                                 .setup = NULL,
                                 .begin = NULL,
                                 .main = VoltorbFlipTaskEngine_BoardInteraction_Main,
                                 .end = NULL,
                                 .tidy = VoltorbFlipTaskEngine_BoardInteraction_TidyUp,
                                 },
    [WORKFLOW_FLIP_CARD] = {
                                 .setup = VoltrbFlipWorkflow_CardFlipEffect_SetUp,
                                 .begin = VoltorbFlipTaskEngine_CardFlipEffect_Begin,
                                 .main = VoltorbFlipTaskEngine_CardFlipEffect_Main,
                                 .end = VoltorbFlipTaskEngine_CardFlipEffect_End,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_WIN_ROUND] = {
                                 .setup = NULL,
                                 .begin = NULL,
                                 .main = VoltorbFlipTaskEngine_WinRound_Main,
                                 .end = NULL,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_AWARD_COINS] = {
                                 .setup = NULL,
                                 .begin = NULL,
                                 .main = VoltorbFlipTaskEngine_AwardCoins_Main,
                                 .end = NULL,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_REVEAL_BOARD] = {
                                 .setup = NULL,
                                 .begin = NULL,
                                 .main = VoltorbFlipTaskEngine_RevealBoard_Main,
                                 .end = VoltorbFlipTaskEngine_RevealBoard_End,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_MEMO_TOUCH] = {
                                 .setup = VoltorbFlipTaskEngine_MemoTouch_SetUp,
                                 .begin = NULL,
                                 .main = VoltorbFlipTaskEngine_MemoTouch_Run,
                                 .end = NULL,
                                 .tidy = VoltorbFlipTaskEngine_Memo_TidyUp,
                                 },
    [WORKFLOW_MEMO_BUTTONS] = {
                                 .setup = VoltorbFlipTaskEngine_MemoButtons_SetUp,
                                 .begin = VoltorbFlipTaskEngine_MemoButtons_Begin,
                                 .main = VoltorbFlipTaskEngine_MemoTouch_Main,
                                 .end = VoltorbFlipTaskEngine_MemoTouch_End,
                                 .tidy = VoltorbFlipTaskEngine_Memo_TidyUp,
                                 },
    [WORKFLOW_QUIT_ROUND] = {
                                 .setup = VoltorbFlipTaskEngine_QuitRound_SetUp,
                                 .begin = VoltorbFlipTaskEngine_QuitRound_Begin,
                                 .main = VoltorbFlipTaskEngine_QuitRound_Run,
                                 .end = VoltorbFlipTaskEngine_QuitRound_End,
                                 .tidy = NULL,
                                 },
};

VoltorbFlipTaskEngine *VoltorbFlipTaskEngine_Create(enum HeapID heapId, VoltorbFlipTasks *workflows, int numWorkFlows, struct VoltorbFlipAppData *work) {
    VoltorbFlipTaskEngine *ptr = Heap_Alloc(heapId, sizeof(VoltorbFlipTaskEngine));
    MI_CpuFill8(ptr, 0, sizeof(VoltorbFlipTaskEngine));
    ptr->tasks = workflows;
    ptr->size = numWorkFlows;
    ptr->work = work;
    ptr->nextWorkflow = WORKFLOW_NONE;
    return ptr;
}

void VoltorbFlipTaskEngine_Free(VoltorbFlipTaskEngine *workflow) {
    Heap_Free(workflow);
}

// Returns TRUE when the Workflow is terminated.
BOOL VoltorbFlipTaskEngine_Run(VoltorbFlipTaskEngine *workflow) {
    VoltorbFlipTasks *vfWorkflows = workflow->tasks;
    VoltorbFlipTask *vfWorkflow = &(*vfWorkflows)[workflow->curWorkflow];
    VoltorbFlipTaskFunc task;

    switch (workflow->workflowState) {
    case 0:
        task = vfWorkflow->setup;
        if (task == NULL) {
            workflow->workflowState = 1;
        } else {
            if (task(workflow, workflow->work)) {
                workflow->taskState = 0;
                workflow->workflowState = 1;
            }
            break;
        }
    case 1:
        task = vfWorkflow->begin;
        if (task != NULL) {
            task(workflow, workflow->work);
        }
        workflow->workflowState = 2;
    case 2:
        GF_ASSERT(vfWorkflow->main != NULL);
        task = vfWorkflow->main;
        if (task(workflow, workflow->work)) {
            workflow->taskState = 0;
            if (vfWorkflow->end != NULL) {
                task = vfWorkflow->end;
                task(workflow, workflow->work);
            }
            workflow->workflowState = 3;
        }
        break;
    case 3:
        task = vfWorkflow->tidy;
        if (task == NULL) {
            workflow->workflowState = 4;
        } else {
            if (task(workflow, workflow->work)) {
                workflow->taskState = 0;
                workflow->workflowState = 4;
            }
            break;
        }
    case 4:
        GF_ASSERT(workflow->nextWorkflow != WORKFLOW_NONE);
        workflow->curWorkflow = workflow->nextWorkflow;
        workflow->nextWorkflow = WORKFLOW_NONE;

        if (workflow->curWorkflow == WORKFLOW_TERMINATE) {
            return TRUE;
        }

        workflow->workflowState = 0;
        workflow->taskState = 0;
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

void VoltorbFlipTaskEngine_Enqueue(VoltorbFlipTaskEngine *workflow, VoltorbFlipTaskId next) {
    GF_ASSERT(workflow != 0);
    GF_ASSERT(next == WORKFLOW_TERMINATE || next < workflow->size);
    workflow->nextWorkflow = next;
}

int VoltorbFlipTaskEngine_CurrentWorkflow(VoltorbFlipTaskEngine *workflow) {
    return workflow->curWorkflow;
}

int VoltorbFlipTaskEngine_CurrentTaskState(VoltorbFlipTaskEngine *workflow) {
    GF_ASSERT(workflow->workflowState != 1);
    return workflow->taskState;
}

int VoltorbFlipTaskEngine_IncrementTaskState(VoltorbFlipTaskEngine *workflow) {
    GF_ASSERT(workflow->workflowState != 1);

    int newState = workflow->taskState + 1;
    workflow->taskState = newState;
    return newState;
}
