#include "global.h"
#include "constants/items.h"
#include "bag_cursor.h"
#include "overlay_16.h"
#include "unk_0203E348.h"

FS_EXTERN_OVERLAY(OVY_15);
FS_EXTERN_OVERLAY(OVY_17);

extern BOOL ov15_BagApp_Init(OVY_MANAGER*, int*);
extern BOOL ov15_BagApp_Exec(OVY_MANAGER*, int*);
extern BOOL ov15_BagApp_Exit(OVY_MANAGER*, int*);

extern BOOL ov17_02201C10(OVY_MANAGER*, int*);
extern BOOL ov17_02201C78(OVY_MANAGER*, int*);
extern BOOL ov17_02201D04(OVY_MANAGER*, int*);

extern void ov17_02201BC0(void);

static const u8 ov16_02201B60[] = {
    POCKET_ITEMS, 0xFF
};

static const u8 ov16_02201B64[] = {
    POCKET_BERRIES, 0xFF
};

static const OVY_MGR_TEMPLATE ov16_02201B68 = {
    .init = ov17_02201C10,
    .exec = ov17_02201C78,
    .exit = ov17_02201D04,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

static const OVY_MGR_TEMPLATE ov16_02201B78 = {
    .init = ov15_BagApp_Init,
    .exec = ov15_BagApp_Exec,
    .exit = ov15_BagApp_Exit,
    .ovy_id = FS_OVERLAY_ID(OVY_15),
};

extern u8* unused_02201BA0;

typedef struct UnkStruct_ov16_0220196C {
    HeapID heapId;
    BerryPotsArgs *args;
    OVY_MANAGER *ovyManager;
    u8 unkC[0x10 - 0xC];
    BagView *bagView;
    u8 unk14;
    u16 unk16;
    BagCursor *cursor1;
    BagCursor *cursor2;
} UnkStruct_ov16_0220196C; // size: 0x20

static BOOL ov16_02201948(OVY_MANAGER **manager);
static void ov16_02201A34(UnkStruct_ov16_0220196C *unk);
static void ov16_02201A4C(UnkStruct_ov16_0220196C *unk);
static u32 ov16_02201A60(UnkStruct_ov16_0220196C *unk);
static u32 ov16_02201A78(UnkStruct_ov16_0220196C *unk);
static u32 ov16_02201AA0(UnkStruct_ov16_0220196C *unk);
static u32 ov16_02201B24(UnkStruct_ov16_0220196C *unk);

static BOOL ov16_02201948(OVY_MANAGER **manager) {
    if (*manager != NULL && OverlayManager_Run(*manager)) {
        OverlayManager_Delete(*manager);
        *manager = NULL;
        return TRUE;
    }

    return FALSE;
}

BOOL ov16_0220196C(OVY_MANAGER *manager, int *state) {
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_17), OVY_LOAD_ASYNC);
    ov17_02201BC0();

    CreateHeap(HEAP_ID_3, HEAP_ID_BERRY_POTS, 0x20000);

    UnkStruct_ov16_0220196C *unk = OverlayManager_CreateAndGetData(manager, sizeof(UnkStruct_ov16_0220196C), HEAP_ID_BERRY_POTS);
    MI_CpuFill8(unk, 0, sizeof(UnkStruct_ov16_0220196C));
    unk->heapId = HEAP_ID_BERRY_POTS;
    unk->args = OverlayManager_GetArgs(manager);
    ov16_02201A34(unk);

    return TRUE;
}

BOOL ov16_022019B8(OVY_MANAGER *manager, int *state) {
    UnkStruct_ov16_0220196C *unk = OverlayManager_GetData(manager);

    switch (*state) {
        case 0:
            *state = ov16_02201A60(unk);
            break;
        case 1:
            *state = ov16_02201A78(unk);
            break;
        case 2:
            *state = ov16_02201AA0(unk);
            break;
        case 3:
            *state = ov16_02201B24(unk);
            break;
        case 4:
            return TRUE;
    }

    return FALSE;
}

BOOL ov16_02201A04(OVY_MANAGER *manager, int *state) {
    UnkStruct_ov16_0220196C *unk = OverlayManager_GetData(manager);
    ov17_02201BC0();

    ov16_02201A4C(unk);

    OverlayManager_FreeData(manager);
    DestroyHeap(HEAP_ID_BERRY_POTS);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_17));

    return TRUE;
}

static void ov16_02201A34(UnkStruct_ov16_0220196C *unk) {
    unk->cursor1 = BagCursor_New(unk->heapId);
    unk->cursor2 = BagCursor_New(unk->heapId);
}

static void ov16_02201A4C(UnkStruct_ov16_0220196C *unk) {
    FreeToHeap(unk->cursor2);
    FreeToHeap(unk->cursor1);
}

static u32 ov16_02201A60(UnkStruct_ov16_0220196C *unk) {
    unk->ovyManager = OverlayManager_New(&ov16_02201B68, unk, unk->heapId);
    return 1;
}

static u32 ov16_02201A78(UnkStruct_ov16_0220196C *unk) {
    if (!ov16_02201948(&unk->ovyManager)) {
        return 1;
    }

    if ((u8)(unk->unk14 + 0xFF) <= 1) {
        return 2;
    }

    return 4;
}

static u32 ov16_02201AA0(UnkStruct_ov16_0220196C *unk) {
    Bag *bag = Save_Bag_Get(unk->args->saveData);

    switch (unk->unk14) {
        case 1:
            unused_02201BA0 = (u8*)ov16_02201B60;

            unk->bagView = Bag_CreateView(bag, ov16_02201B60, unk->heapId);
            sub_0207789C(unk->bagView, unk->args->saveData, 6, unk->cursor2, unk->args->unk4);
            break;
        case 2:
            unused_02201BA0 = (u8*)ov16_02201B64;

            unk->bagView = Bag_CreateView(bag, ov16_02201B64, unk->heapId);
            sub_0207789C(unk->bagView, unk->args->saveData, 6, unk->cursor1, unk->args->unk4);
            break;
        default:
            GF_ASSERT(FALSE);
            break;
    }

    unk->ovyManager = OverlayManager_New(&ov16_02201B78, unk->bagView, unk->heapId);
    return 3;
}

static u32 ov16_02201B24(UnkStruct_ov16_0220196C *unk) {
    if (!ov16_02201948(&unk->ovyManager)) {
        return 3;
    }

    unk->unk16 = ((u8)sub_0207790C(unk->bagView) == 4) ? sub_02077904(unk->bagView) : 0xFFFF;
    FreeToHeap(unk->bagView);
    unk->bagView = NULL;

    return 0;
}
