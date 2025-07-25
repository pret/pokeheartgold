#include "overlay_manager.h"

#include "global.h"

OverlayManager *OverlayManager_New(const OverlayManagerTemplate *template, void *args, enum HeapID heapID) {
    OverlayManager *ret;

    ret = Heap_Alloc(heapID, sizeof(OverlayManager));
    ret->template = *template;
    ret->exec_state = 0;
    ret->proc_state = 0;
    ret->args = args;
    ret->data = NULL;
    ret->unk_20 = 0;
    ret->unk_24 = 0;

    return ret;
}

void OverlayManager_Delete(OverlayManager *man) {
    Heap_Free(man);
}

void *OverlayManager_CreateAndGetData(OverlayManager *man, u32 size, enum HeapID heapID) {
    void *data;
    data = Heap_Alloc(heapID, size);
    man->data = data;
    return data;
}

void *OverlayManager_GetData(OverlayManager *man) {
    return man->data;
}

void OverlayManager_FreeData(OverlayManager *man) {
    Heap_Free(man->data);
    man->data = NULL;
}

// Get arguments passed into the application.
void *OverlayManager_GetArgs(OverlayManager *man) {
    return man->args;
}

BOOL OverlayManager_Run(OverlayManager *man) {
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
