#include "global.h"
#include "overlay_manager.h"

OVY_MANAGER *OverlayManager_New(const OVY_MGR_TEMPLATE *template, void *args, HeapID heapId) {
    OVY_MANAGER *ret;

    ret = AllocFromHeap(heapId, sizeof(OVY_MANAGER));
    ret->template = *template;
    ret->exec_state = 0;
    ret->proc_state = 0;
    ret->args = args;
    ret->data = NULL;
    ret->unk_20 = 0;
    ret->unk_24 = 0;

    return ret;
}

void OverlayManager_Delete(OVY_MANAGER *man) {
    FreeToHeap(man);
}

void *OverlayManager_CreateAndGetData(OVY_MANAGER *man, u32 size, HeapID heapId) {
    void *data;
    data = AllocFromHeap(heapId, size);
    man->data = data;
    return data;
}

void *OverlayManager_GetData(OVY_MANAGER *man) {
    return man->data;
}

void OverlayManager_FreeData(OVY_MANAGER *man) {
    FreeToHeap(man->data);
    man->data = NULL;
}

// Get arguments passed into the application.
void *OverlayManager_GetArgs(OVY_MANAGER *man) {
    return man->args;
}

BOOL OverlayManager_Run(OVY_MANAGER *man) {
    switch (man->exec_state) {
    case 0:
        if (man->template.ovy_id != FS_OVERLAY_ID_NONE) {
            HandleLoadOverlay(man->template.ovy_id, OVY_LOAD_ASYNC);
        }
        man->exec_state = 1;
        // fallthrough
    case 1:
        if (man->template.init(man, &man->proc_state) == TRUE) {
            man->exec_state = 2;
            man->proc_state = 0;
        }
        break;
    case 2:
        if (man->template.exec(man, &man->proc_state) == TRUE) {
            man->exec_state = 3;
            man->proc_state = 0;
        }
        break;
    case 3:
        if (man->template.exit(man, &man->proc_state) == TRUE) {
            if (man->template.ovy_id != FS_OVERLAY_ID_NONE) {
                UnloadOverlayByID(man->template.ovy_id);
            }
            return TRUE;
        }
        break;
    }
    return FALSE;
}
