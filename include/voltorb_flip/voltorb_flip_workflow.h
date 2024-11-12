#ifndef POKEHEARTGOLD_VOLTORB_FLIP_WORKFLOW_H
#define POKEHEARTGOLD_VOLTORB_FLIP_WORKFLOW_H

#include "voltorb_flip/voltorb_flip_work.h"

typedef enum Workflow {
    WORKFLOW_UNK_0,
    WORKFLOW_NEW_ROUND,
    WORKFLOW_SELECT_MAIN_MENU,
    WORKFLOW_SELECT_GAME_INFO,
    WORKFLOW_HOW_TO_PLAY,
    WORKFLOW_HINT,
    WORKFLOW_ABOUT_MEMO,
    WORKFLOW_RENDER_BOARD,
    WORKFLOW_AWAIT_BOARD_INTERACT,
    WORKFLOW_FLIP_CARD,
    WORKFLOW_UNK_10,
    WORKFLOW_AWARD_COINS,
    WORKFLOW_REVEAL_BOARD,
    WORKFLOW_UNK_13,
    WORKFLOW_UNK_14,
    WORKFLOW_QUIT_ROUND,
    WORKFLOW_UNK_16,

    WORKFLOW_TERMINATE = 65534,
    WORKFLOW_NONE = 65535,
} Workflow;

typedef BOOL (*VoltorbFlipTask)(struct WorkflowEngine *a0, VoltorbFlipAppWork *a1);

// A list of Tasks which will be executed synchronously and in order by the
// WorkflowEngine.
//
// The WorkflowEngine starts with the first non-NULL task provided.
typedef struct VoltorbFlipWorkflow {
    // Optional. Runs over multiple frames.
    VoltorbFlipTask task1;
    // Optional. Runs over 1 frame.
    VoltorbFlipTask task2;
    // Required. Runs over multiple frames.
    VoltorbFlipTask task3;
    // Optional. Runs over 1 frame.
    VoltorbFlipTask task4;
    // Optional. Runs over multiple frames.
    VoltorbFlipTask task5;
} VoltorbFlipWorkflow;

typedef VoltorbFlipWorkflow VoltorbFlipWorkflows[16];

// A Workflow is a series of Tasks that run sequentially. The WorkflowEngine
// handles the transitions between a Workflow's Tasks automatically.
//
// The WorkflowEngine has a method for the caller to enqueue a new Workflow or
// terminate the WorkflowEngine. The caller is expected to do one of these
// during the execution of a Workflow.
//
// At a given time, only one Workflow and one Task within that Workflow will
// be active. An enqueued Workflow starts once the current Workflow finishes.
typedef struct WorkflowEngine {
    VoltorbFlipWorkflows *workflows;
    struct VoltorbFlipAppWork *work;
    u16 curWorkflow;
    u16 nextWorkflow;
    u8 size;          // The number of workflows registered
    u8 workflowState; // The internal state of the WorkflowEngine (as it manages Task transitions)
    u8 taskState;     // The state of the Task that is currently being executed
} WorkflowEngine;

WorkflowEngine *CreateWorkflowEngine(HeapID, VoltorbFlipWorkflows *, int, struct VoltorbFlipAppWork *);
void FreeWorkflowEngine(WorkflowEngine *);
BOOL RunWorkflowEngine(struct WorkflowEngine *);
void EnqueueWorkflow(WorkflowEngine *, Workflow);
int CurrentWorkflow(WorkflowEngine *);
int CurrentTaskState(WorkflowEngine *);
int IncrementTaskState(WorkflowEngine *);

#endif // POKEHEARTGOLD_VOLTORB_FLIP_WORKFLOW_H
