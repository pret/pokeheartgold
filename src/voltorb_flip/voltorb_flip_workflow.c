#include "voltorb_flip/voltorb_flip_workflow.h"

#include "global.h"

#include "voltorb_flip/voltorb_flip_internal.h"

#include "heap.h"

const VoltorbFlipWorkflows sVoltorbFlipWorkflows = {
    [WORKFLOW_COIN_CASE_FULL] = {
                                 .setup = NULL,
                                 .begin = VoltorbFlipWorkflow_InitChecks_Begin,
                                 .wait = VoltorbFlipWorkflow_InitChecks_Wait,
                                 .end = NULL,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_NEW_ROUND] = {
                                 .setup = NULL,
                                 .begin = VoltorbFlipWorkflow_NewRound_Begin,
                                 .wait = VoltorbFlipWorkflow_NewRound_Wait,
                                 .end = NULL,
                                 .tidy = VoltorbFlipWorkflow_NewRound_TidyUp,
                                 },
    [WORKFLOW_SELECT_MAIN_MENU] = {
                                 .setup = VoltorbFlipWorkflow_SelectMainMenu_SetUp,
                                 .begin = VoltorbFlipWorkflow_SelectMainMenu_Begin,
                                 .wait = VoltorbFlipWorkflow_SelectMainMenu_Wait,
                                 .end = NULL,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_SELECT_GAME_INFO] = {
                                 .setup = VoltorbFlipWorkflow_SelectGameInfo_SetUp,
                                 .begin = VoltorbFlipWorkflow_SelectGameInfo_Begin,
                                 .wait = VoltorbFlipWorkflow_SelectGameInfo_Wait,
                                 .end = NULL,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_HOW_TO_PLAY] = {
                                 .setup = VoltorbFlipWorkflow_HowToPlayScreen_SetUp,
                                 .begin = NULL,
                                 .wait = VoltorbFlipWorkflow_HowToPlayScreen_Wait,
                                 .end = NULL,
                                 .tidy = VoltorbFlipWorkflow_TutorialScreens_TidyUp,
                                 },
    [WORKFLOW_HINT] = {
                                 .setup = VoltorbFlipWorkflow_HintScreen_SetUp,
                                 .begin = NULL,
                                 .wait = VoltorbFlipWorkflow_HintScreen_Wait,
                                 .end = NULL,
                                 .tidy = VoltorbFlipWorkflow_TutorialScreens_TidyUp,
                                 },
    [WORKFLOW_ABOUT_MEMO] = {
                                 .setup = VoltorbFlipWorkflow_AboutMemoScreen_SetUp,
                                 .begin = NULL,
                                 .wait = VoltorbFlipWorkflow_AboutMemoScreen_Wait,
                                 .end = NULL,
                                 .tidy = VoltorbFlipWorkflow_TutorialScreens_TidyUp,
                                 },
    [WORKFLOW_RENDER_BOARD] = {
                                 .setup = NULL,
                                 .begin = NULL,
                                 .wait = VoltorbFlipWorkflow_RenderBoard_Wait,
                                 .end = NULL,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_AWAIT_BOARD_INTERACT] = {
                                 .setup = NULL,
                                 .begin = NULL,
                                 .wait = VoltorbFlipWorkflow_BoardInteraction_Wait,
                                 .end = NULL,
                                 .tidy = VoltorbFlipWorkflow_BoardInteraction_TidyUp,
                                 },
    [WORKFLOW_FLIP_CARD] = {
                                 .setup = VoltrbFlipWorkflow_CardFlipEffect_SetUp,
                                 .begin = VoltorbFlipWorkflow_CardFlipEffect_Begin,
                                 .wait = VoltorbFlipWorkflow_CardFlipEffect_Wait,
                                 .end = VoltorbFlipWorkflow_CardFlipEffect_End,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_WIN_ROUND] = {
                                 .setup = NULL,
                                 .begin = NULL,
                                 .wait = VoltorbFlipWorkflow_WinRound_Wait,
                                 .end = NULL,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_AWARD_COINS] = {
                                 .setup = NULL,
                                 .begin = NULL,
                                 .wait = VoltorbFlipWorkflow_AwardCoins_Wait,
                                 .end = NULL,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_REVEAL_BOARD] = {
                                 .setup = NULL,
                                 .begin = NULL,
                                 .wait = VoltorbFlipWorkflow_RevealBoard_Wait,
                                 .end = VoltorbFlipWorkflow_RevealBoard_End,
                                 .tidy = NULL,
                                 },
    [WORKFLOW_UNK_13] = {
                                 .setup = ov122_021E65F4,
                                 .begin = NULL,
                                 .wait = ov122_021E65FC,
                                 .end = NULL,
                                 .tidy = ov122_021E67E0,
                                 },
    [WORKFLOW_UNK_14] = {
                                 .setup = ov122_021E66CC,
                                 .begin = ov122_021E66FC,
                                 .wait = ov122_021E6700,
                                 .end = ov122_021E67DC,
                                 .tidy = ov122_021E67E0,
                                 },
    [WORKFLOW_QUIT_ROUND] = {
                                 .setup = VoltorbFlipWorkflow_QuitRound_SetUp,
                                 .begin = VoltorbFlipWorkflow_QuitRound_Begin,
                                 .wait = VoltorbFlipWorkflow_QuitRound_Wait,
                                 .end = VoltorbFlipWorkflow_QuitRound_End,
                                 .tidy = NULL,
                                 },
};

WorkflowEngine *VoltorbFlipWorkflow_Create(enum HeapID heapId, VoltorbFlipWorkflows *workflows, int numWorkFlows, struct VoltorbFlipAppWork *work) {
    WorkflowEngine *ptr = Heap_Alloc(heapId, sizeof(WorkflowEngine));
    MI_CpuFill8(ptr, 0, sizeof(WorkflowEngine));
    ptr->workflows = workflows;
    ptr->size = numWorkFlows;
    ptr->work = work;
    ptr->nextWorkflow = WORKFLOW_NONE;
    return ptr;
}

void VoltorbFlipWorkflow_Free(WorkflowEngine *workflow) {
    Heap_Free(workflow);
}

// Returns TRUE when the Workflow is terminated.
BOOL VoltorbFlipWorkflow_Run(WorkflowEngine *workflow) {
    VoltorbFlipWorkflows *vfWorkflows = workflow->workflows;
    VoltorbFlipWorkflow *vfWorkflow = &(*vfWorkflows)[workflow->curWorkflow];
    VoltorbFlipTask task;

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
        GF_ASSERT(vfWorkflow->wait != NULL);
        task = vfWorkflow->wait;
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

void VoltorbFlipWorkflow_Enqueue(WorkflowEngine *workflow, Workflow next) {
    GF_ASSERT(workflow != 0);
    GF_ASSERT(next == WORKFLOW_TERMINATE || next < workflow->size);
    workflow->nextWorkflow = next;
}

int VoltorbFlipWorkflow_CurrentWorkflow(WorkflowEngine *workflow) {
    return workflow->curWorkflow;
}

int VoltorbFlipWorkflow_CurrentTaskState(WorkflowEngine *workflow) {
    GF_ASSERT(workflow->workflowState != 1);
    return workflow->taskState;
}

int VoltorbFlipWorkflow_IncrementTaskState(WorkflowEngine *workflow) {
    GF_ASSERT(workflow->workflowState != 1);

    int newState = workflow->taskState + 1;
    workflow->taskState = newState;
    return newState;
}
