
#include "constants/items.h"

#include "application/bag_app.h"

#include "bag_cursor.h"
#include "bag_view.h"
#include "berry_pots_app.h"
#include "overlay_16.h"
#include "poke_overlay.h"

FS_EXTERN_OVERLAY(OVY_15);
FS_EXTERN_OVERLAY(OVY_17);

extern BOOL BerryPotsApp_Initialize(OverlayManager *, int *);
extern BOOL BerryPotsApp_Run(OverlayManager *, int *);
extern BOOL BerryPotsApp_Exit(OverlayManager *, int *);

static const u8 sPocketList_Berries[] = {
    POCKET_BERRIES, 0xFF
};

static const u8 sPocketList_Mulch[] = {
    POCKET_ITEMS, 0xFF
};

static const OverlayManagerTemplate ov16_02201B68 = {
    .init = BerryPotsApp_Initialize,
    .exec = BerryPotsApp_Run,
    .exit = BerryPotsApp_Exit,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

static const OverlayManagerTemplate ov16_02201B78 = {
    .init = Bag_Init,
    .exec = Bag_Main,
    .exit = Bag_Exit,
    .ovy_id = FS_OVERLAY_ID(OVY_15),
};

static const u8 *sDebug_PocketsList;

typedef struct UnkStruct_ov16_0220196C {
    enum HeapID heapID;
    BerryPotsArgs *args;
    OverlayManager *ovyManager;
    u8 unkC[0x10 - 0xC];
    BagView *bagView;
    u8 unk14;
    u16 unk16;
    BagCursor *berriesPocketCursor;
    BagCursor *itemsPocketCursor;
} UnkStruct_ov16_0220196C; // size: 0x20

static BOOL ov16_02201948(OverlayManager **manager);
static void ov16_02201A34(UnkStruct_ov16_0220196C *unk);
static void ov16_02201A4C(UnkStruct_ov16_0220196C *unk);
static u32 ov16_02201A60(UnkStruct_ov16_0220196C *unk);
static u32 ov16_02201A78(UnkStruct_ov16_0220196C *unk);
static u32 ov16_02201AA0(UnkStruct_ov16_0220196C *unk);
static u32 ov16_02201B24(UnkStruct_ov16_0220196C *unk);

static BOOL ov16_02201948(OverlayManager **manager) {
    if (*manager != NULL && OverlayManager_Run(*manager)) {
        OverlayManager_Delete(*manager);
        *manager = NULL;
        return TRUE;
    }

    return FALSE;
}

BOOL BerryPots_Init(OverlayManager *manager, int *state) {
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_17), OVY_LOAD_ASYNC);
    ov17_02201BC0();

    Heap_Create(HEAP_ID_3, HEAP_ID_BERRY_POTS, 0x20000);

    UnkStruct_ov16_0220196C *unk = OverlayManager_CreateAndGetData(manager, sizeof(UnkStruct_ov16_0220196C), HEAP_ID_BERRY_POTS);
    MI_CpuFill8(unk, 0, sizeof(UnkStruct_ov16_0220196C));
    unk->heapID = HEAP_ID_BERRY_POTS;
    unk->args = OverlayManager_GetArgs(manager);
    ov16_02201A34(unk);

    return TRUE;
}

BOOL BerryPots_Main(OverlayManager *manager, int *state) {
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

BOOL BerryPots_Exit(OverlayManager *manager, int *state) {
    UnkStruct_ov16_0220196C *unk = OverlayManager_GetData(manager);
    ov17_02201BC0();

    ov16_02201A4C(unk);

    OverlayManager_FreeData(manager);
    Heap_Destroy(HEAP_ID_BERRY_POTS);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_17));

    return TRUE;
}

static void ov16_02201A34(UnkStruct_ov16_0220196C *unk) {
    unk->berriesPocketCursor = BagCursor_New(unk->heapID);
    unk->itemsPocketCursor = BagCursor_New(unk->heapID);
}

static void ov16_02201A4C(UnkStruct_ov16_0220196C *unk) {
    Heap_Free(unk->itemsPocketCursor);
    Heap_Free(unk->berriesPocketCursor);
}

static u32 ov16_02201A60(UnkStruct_ov16_0220196C *unk) {
    unk->ovyManager = OverlayManager_New(&ov16_02201B68, unk, unk->heapID);
    return 1;
}

static u32 ov16_02201A78(UnkStruct_ov16_0220196C *unk) {
    if (!ov16_02201948(&unk->ovyManager)) {
        return 1;
    }

    if (unk->unk14 == 1 || unk->unk14 == 2) {
        return 2;
    }

    return 4;
}

static u32 ov16_02201AA0(UnkStruct_ov16_0220196C *unk) {
    Bag *bag = Save_Bag_Get(unk->args->saveData);

    switch (unk->unk14) {
    case 1:
        sDebug_PocketsList = sPocketList_Mulch;

        unk->bagView = Bag_CreateView(bag, sPocketList_Mulch, unk->heapID);
        BagView_Init(unk->bagView, unk->args->saveData, BAG_VIEW_CONTEXT_BERRY_POTS, unk->itemsPocketCursor, unk->args->menuInputStatePtr);
        break;
    case 2:
        sDebug_PocketsList = sPocketList_Berries;

        unk->bagView = Bag_CreateView(bag, sPocketList_Berries, unk->heapID);
        BagView_Init(unk->bagView, unk->args->saveData, BAG_VIEW_CONTEXT_BERRY_POTS, unk->berriesPocketCursor, unk->args->menuInputStatePtr);
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    unk->ovyManager = OverlayManager_New(&ov16_02201B78, unk->bagView, unk->heapID);
    return 3;
}

static u32 ov16_02201B24(UnkStruct_ov16_0220196C *unk) {
    if (!ov16_02201948(&unk->ovyManager)) {
        return 3;
    }

    unk->unk16 = ((u8)BagView_GetReturnCode(unk->bagView) == 4) ? BagView_GetItemId(unk->bagView) : 0xFFFF;
    Heap_Free(unk->bagView);
    unk->bagView = NULL;

    return 0;
}
