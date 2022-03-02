#include "overlay_manager.h"
#include "overlay_50.h"
#include "overlay_51.h"
#include "overlay_52.h"
#include "unk_02004A44.h"
#include "unk_0202C9A0.h"

FS_EXTERN_OVERLAY(OVY_51);
FS_EXTERN_OVERLAY(OVY_52);

static BOOL ov50_021E5900(OVY_MANAGER **man);
static int ov50_021E59CC(Unk021E5924 *a0);
static int ov50_021E59E4(Unk021E5924 *a0);
static int ov50_021E5A0C(Unk021E5924 *a0);
static int ov50_021E5A3C(Unk021E5924 *a0);

static const OVY_MGR_TEMPLATE _021E5A8C[];

static BOOL ov50_021E5900(OVY_MANAGER **man) {
    if (*man && OverlayManager_run(*man)) {
        OverlayManager_delete(*man);
        *man = NULL;
        return TRUE;
    }
    return FALSE;
}

BOOL ov50_021E5924(OVY_MANAGER *man) {
    void *ptr = OverlayManager_GetField18(man);
    CreateHeap(3, 94, 4096);

    Unk021E5924 *data = OverlayManager_CreateAndGetData(man, sizeof(Unk021E5924), 94);
    MI_CpuFill8(data, 0, sizeof(Unk021E5924));

    data->heap_id = 94;
    data->unkC = ptr;
    data->unk10 = ptr;
    return TRUE;
}

BOOL ov50_021E595C(OVY_MANAGER *man, int *state) {
    Unk021E5924 *data = OverlayManager_GetData(man);
    switch (*state) {
    case 0:
        *state = ov50_021E59CC(data);
        break;
    case 1:
        *state = ov50_021E59E4(data);
        break;
    case 2:
        *state = ov50_021E5A0C(data);
        break;
    case 3:
        *state = ov50_021E5A3C(data);
        break;
    case 4:
    default:
        return TRUE;
    }
    return FALSE;
}

BOOL ov50_021E59A8(OVY_MANAGER *man) {
    Unk021E5924 *data = OverlayManager_GetData(man);
    MI_CpuFill8(data, 0, sizeof(Unk021E5924));
    OverlayManager_FreeData(man);
    sub_02004B10();
    DestroyHeap(94);
    return TRUE;
}

static int ov50_021E59CC(Unk021E5924 *a0) {
    a0->ov_mgr = OverlayManager_new(&_021E5A8C[0], a0->unkC, a0->heap_id);
    return 1;
}

static int ov50_021E59E4(Unk021E5924 *a0) {
    if (!ov50_021E5900(&a0->ov_mgr)) return 1;

    if (a0->unkC->unk674 != 0) {
        return 2;
    }
    return 4;
}

static int ov50_021E5A0C(Unk021E5924 *a0) {
    OVY_MGR_TEMPLATE template = _021E5A8C[1];
    a0->ov_mgr = OverlayManager_new(&template, a0->unkC->saveData, a0->heap_id);
    return 3;
}

static int ov50_021E5A3C(Unk021E5924 *a0) {
    void *ptr;
    if (!ov50_021E5900(&a0->ov_mgr)) {
        return 3;
    }

    ptr = sub_0202C9D8(a0->unkC->saveData);
    a0->unkC->unk4b = sub_0202C9E8(ptr);
    MI_CpuCopy8(sub_0202C9E4(ptr), a0->unkC->unk68, sizeof(a0->unkC->unk68));
    return 0;
}

static const OVY_MGR_TEMPLATE _021E5A8C[] = {
    { ov51_021E5AC0, ov51_021E5D90, ov51_021E5EC8, FS_OVERLAY_ID(OVY_51) },
    { ov52_021E80C0, ov52_021E8248, ov52_021E82AC, FS_OVERLAY_ID(OVY_52) },
};
