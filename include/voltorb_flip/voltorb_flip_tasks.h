#ifndef POKEHEARTGOLD_VOLTORB_FLIP_WORKFLOW_H
#define POKEHEARTGOLD_VOLTORB_FLIP_WORKFLOW_H

#include "voltorb_flip/voltorb_flip_app_data.h"

typedef enum VoltorbFlipTaskId {
    WORKFLOW_COIN_CASE_FULL,
    WORKFLOW_NEW_ROUND,
    WORKFLOW_SELECT_MAIN_MENU,
    WORKFLOW_SELECT_GAME_INFO,
    WORKFLOW_HOW_TO_PLAY,
    WORKFLOW_HINT,
    WORKFLOW_ABOUT_MEMO,
    WORKFLOW_RENDER_BOARD,
    WORKFLOW_AWAIT_BOARD_INTERACT,
    WORKFLOW_FLIP_CARD,
    WORKFLOW_WIN_ROUND,
    WORKFLOW_AWARD_COINS,
    WORKFLOW_REVEAL_BOARD,
    WORKFLOW_MEMO_TOUCH,
    WORKFLOW_MEMO_BUTTONS,
    WORKFLOW_QUIT_ROUND,

    WORKFLOW_TERMINATE = 65534,
    WORKFLOW_NONE = 65535,
} VoltorbFlipTaskId;

typedef BOOL (*VoltorbFlipTaskFunc)(struct VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *voltorbFlip);

// A list of Tasks which will be executed synchronously and in order by the
// WorkflowEngine.
//
// The WorkflowEngine starts with the first non-NULL task provided.
typedef struct VoltorbFlipTask {
    // Optional. Runs over multiple frames.
    VoltorbFlipTaskFunc setup;
    // Optional. Runs over 1 frame.
    VoltorbFlipTaskFunc begin;
    // Required. Runs over multiple frames.
    VoltorbFlipTaskFunc main;
    // Optional. Runs over 1 frame.
    VoltorbFlipTaskFunc end;
    // Optional. Runs over multiple frames.
    VoltorbFlipTaskFunc tidy;
} VoltorbFlipTask;

typedef VoltorbFlipTask VoltorbFlipTasks[16];

// A Workflow is a series of Tasks that run sequentially. The WorkflowEngine
// handles the transitions between a Workflow's Tasks automatically.
//
// The WorkflowEngine has a method for the caller to enqueue a new Workflow or
// terminate the WorkflowEngine. The caller is expected to do one of these
// during the execution of a Workflow.
//
// At a given time, only one Workflow and one Task within that Workflow will
// be active. An enqueued Workflow starts once the current Workflow finishes.
typedef struct VoltorbFlipTaskEngine {
    VoltorbFlipTasks *tasks;
    struct VoltorbFlipAppData *work;
    u16 curWorkflow;
    u16 nextWorkflow;
    u8 size;          // The number of workflows registered
    u8 workflowState; // The internal state of the WorkflowEngine (as it manages Task transitions)
    u8 taskState;     // The state of the Task that is currently being executed
} VoltorbFlipTaskEngine;

VoltorbFlipTaskEngine *VoltorbFlipTaskEngine_Create(enum HeapID heapId, VoltorbFlipTasks *tasks, int, VoltorbFlipAppData *voltorbFlip);
void VoltorbFlipTaskEngine_Free(VoltorbFlipTaskEngine *engine);
BOOL VoltorbFlipTaskEngine_Run(VoltorbFlipTaskEngine *engine);
void VoltorbFlipTaskEngine_Enqueue(VoltorbFlipTaskEngine *engine, VoltorbFlipTaskId taskId);
int VoltorbFlipTaskEngine_CurrentWorkflow(VoltorbFlipTaskEngine *engine);
int VoltorbFlipTaskEngine_CurrentTaskState(VoltorbFlipTaskEngine *engine);
int VoltorbFlipTaskEngine_IncrementTaskState(VoltorbFlipTaskEngine *engine);

#endif // POKEHEARTGOLD_VOLTORB_FLIP_WORKFLOW_H
