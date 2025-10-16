#include "voltorb_flip/voltorb_flip_workflow.h"

#include "global.h"

#include "voltorb_flip/voltorb_flip.h"
#include "voltorb_flip/voltorb_flip_internal.h"

#include "heap.h"

const VoltorbFlipWorkflows sVoltorbFlipWorkflows = {
    [WORKFLOW_UNK_0] = { NULL,                         ov122_021E5BA8,                ov122_021E5BE4,               NULL,           NULL                },
    [WORKFLOW_NEW_ROUND] = { NULL,                         GenerateBoardAndPrintNewLevel, PrintYouCanEarnEvenMoreCoins, NULL,           ov122_021E5D24      },
    [WORKFLOW_SELECT_MAIN_MENU] = { PrintPlayNewRound,            ov122_021E5DB4,                AwaitMainMenuSelection,       NULL,           NULL                },
    [WORKFLOW_SELECT_GAME_INFO] = { PrintWhichSetOfInfo,          ov122_021E5E34,                AwaitGameInfoSelection,       NULL,           NULL                },
    [WORKFLOW_HOW_TO_PLAY] = { OpenHowToPlayScreen,          NULL,                          PrintHowToPlayMsg,            NULL,           CloseTutorialScreen },
    [WORKFLOW_HINT] = { OpenHintScreen,               NULL,                          PrintHintMsg,                 NULL,           CloseTutorialScreen },
    [WORKFLOW_ABOUT_MEMO] = { OpenAboutMemoScreen,          NULL,                          PrintAboutMemoMsg,            NULL,           CloseTutorialScreen },
    [WORKFLOW_RENDER_BOARD] = { NULL,                         NULL,                          RenderBoard,                  NULL,           NULL                },
    [WORKFLOW_AWAIT_BOARD_INTERACT] = { NULL,                         NULL,                          AwaitBoardInteraction,        NULL,           ov122_021E6008      },
    [WORKFLOW_FLIP_CARD] = { PlaySuspensefulFanfare,       StartCardFlipEffect,           AwaitCardFlipAndResult,       ov122_021E6358, NULL                },
    [WORKFLOW_UNK_10] = { NULL,                         NULL,                          PlayWinRoundFanfare,          NULL,           NULL                },
    [WORKFLOW_AWARD_COINS] = { NULL,                         NULL,                          AwardCoins,                   NULL,           NULL                },
    [WORKFLOW_REVEAL_BOARD] = { NULL,                         NULL,                          ov122_021E64E8,               ov122_021E6594, NULL                },
    [WORKFLOW_UNK_13] = { ov122_021E65F4,               NULL,                          ov122_021E65FC,               NULL,           ov122_021E67E0      },
    [WORKFLOW_UNK_14] = { ov122_021E66CC,               ov122_021E66FC,                ov122_021E6700,               ov122_021E67DC, ov122_021E67E0      },
    [WORKFLOW_QUIT_ROUND] = { PrintAreYouSureYouWantToQuit, ov122_021E6900,                AwaitQuitYesNoSelection,      ov122_021E69DC, NULL                },
};

WorkflowEngine *CreateWorkflowEngine(enum HeapID a0, VoltorbFlipWorkflows *workflows, int numWorkFlows, struct VoltorbFlipAppWork *work) {
    WorkflowEngine *ptr = Heap_Alloc(a0, sizeof(WorkflowEngine));
    MI_CpuFill8(ptr, 0, sizeof(WorkflowEngine));
    ptr->workflows = workflows;
    ptr->size = numWorkFlows;
    ptr->work = work;
    ptr->nextWorkflow = WORKFLOW_NONE;
    return ptr;
}

void FreeWorkflowEngine(WorkflowEngine *workflow) {
    Heap_Free(workflow);
}

// Returns TRUE when the Workflow is terminated.
BOOL RunWorkflowEngine(WorkflowEngine *workflow) {
    VoltorbFlipWorkflows *vfWorkflows = workflow->workflows;
    VoltorbFlipWorkflow *vfWorkflow = &(*vfWorkflows)[workflow->curWorkflow];
    VoltorbFlipTask task;

    switch (workflow->workflowState) {
    case 0:
        task = vfWorkflow->task1;
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
        task = vfWorkflow->task2;
        if (task != NULL) {
            task(workflow, workflow->work);
        }
        workflow->workflowState = 2;
    case 2:
        GF_ASSERT(vfWorkflow->task3 != NULL);
        task = vfWorkflow->task3;
        if (task(workflow, workflow->work)) {
            workflow->taskState = 0;
            if (vfWorkflow->task4 != NULL) {
                task = vfWorkflow->task4;
                task(workflow, workflow->work);
            }
            workflow->workflowState = 3;
        }
        break;
    case 3:
        task = vfWorkflow->task5;
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

void EnqueueWorkflow(WorkflowEngine *workflow, Workflow next) {
    GF_ASSERT(workflow != 0);
    GF_ASSERT(next == WORKFLOW_TERMINATE || next < workflow->size);
    workflow->nextWorkflow = next;
}

int CurrentWorkflow(WorkflowEngine *workflow) {
    return workflow->curWorkflow;
}

int CurrentTaskState(WorkflowEngine *workflow) {
    GF_ASSERT(workflow->workflowState != 1);
    return workflow->taskState;
}

int IncrementTaskState(WorkflowEngine *workflow) {
    GF_ASSERT(workflow->workflowState != 1);

    int newState = workflow->taskState + 1;
    workflow->taskState = newState;
    return newState;
}
