#include "global.h"
#include "heap.h"
#include "voltorb_flip/voltorb_flip.h"
#include "voltorb_flip/voltorb_flip_workflow.h"

WorkflowEngine *CreateWorkflowEngine(HeapID a0, VoltorbFlipWorkflows *workflows, int numWorkFlows, struct VoltorbFlipAppWork *work) {
    WorkflowEngine *ptr = AllocFromHeap(a0, sizeof(WorkflowEngine));
    MI_CpuFill8(ptr, 0, sizeof(WorkflowEngine));
    ptr->workflows = workflows;
    ptr->size = numWorkFlows;
    ptr->work = work;
    ptr->nextWorkflow = WORKFLOW_NONE;
    return ptr;
}

void FreeWorkflowEngine(WorkflowEngine *workflow) {
    FreeToHeap(workflow);
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
