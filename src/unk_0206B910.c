#include "unk_0206B910.h"

#include "global.h"

#include "assert.h"
#include "bag.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "heap.h"
#include "launch_application.h"
#include "mail.h"
#include "map_header.h"
#include "overlay_57.h"
#include "party.h"
#include "party_menu.h"
#include "player_data.h"
#include "pokemon.h"
#include "render_text.h"
#include "save_arrays.h"
#include "scrcmd.h"
#include "script.h"
#include "seal_case.h"
#include "task.h"
#include "unk_020379A0.h"
#include "unk_02055244.h"
#include "unk_020552A4.h"
#include "unk_02091054.h"

FS_EXTERN_OVERLAY(OVY_57);

typedef struct UnkStruct_0206B984 {
    u32 partyCount;
    Pokemon *mons[PARTY_SIZE];
    Party *party;
    SealCase *sealCase;
    Options *options;
    SaveData *saveData;
    void *menuInputStatePtr;
    u8 unk30;
    u8 unk31;
} UnkStruct_0206B984;

typedef struct UnkStruct_0206B910 {
    u8 filler00[4];
    UnkStruct_0206B984 *unk04;
    PartyMenuArgs *partyMenu;
    SaveData *saveData;
    u32 state;
} UnkStruct_0206B910;

typedef struct UnkStruct_0206BCEC {
    u8 unk00;
    u8 unk01;
    u8 unk02;
    u8 filler03[21];
    SaveData *unk18;
} UnkStruct_0206BCEC;

typedef struct UnkStruct_0206BCD4 {
    u8 filler00[4];
    u8 unk04;
    u8 filler05[15];
} UnkStruct_0206BCD4;

static const OverlayManagerTemplate _020FF480 = {
    .init = ov57_022378DC,
    .exec = ov57_02237AF8,
    .exit = ov57_02237B20,
    .ovy_id = FS_OVERLAY_ID(OVY_57),
};

static BOOL sub_0206B984(TaskManager *taskManager);
static BOOL sub_0206BB90(ScriptContext *ctx);
static void sub_0206BCA4(UnkStruct_0206BCD4 *a0, u8 a1);
static BOOL sub_0206BCB4(UnkStruct_0206BCD4 *a0, u8 a1);
static UnkStruct_0206BCD4 *sub_0206BCD4(void);
static UnkStruct_0206BCD4 *sub_0206BCEC(UnkStruct_0206BCEC *unused);
static void sub_0206BD00(UnkStruct_0206BCD4 *a0);

void sub_0206B910(TaskManager *taskManager, SaveData *saveData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_0206B910 *r4 = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(UnkStruct_0206B910));
    memset(r4, 0, sizeof(UnkStruct_0206B910));
    r4->saveData = saveData;
    r4->unk04 = Heap_Alloc(HEAP_ID_FIELD2, sizeof(UnkStruct_0206B984));
    memset(r4->unk04, 0, sizeof(UnkStruct_0206B984));
    r4->unk04->options = Save_PlayerData_GetOptionsAddr(saveData);
    r4->unk04->saveData = saveData;
    r4->unk04->menuInputStatePtr = &fieldSystem->menuInputState;
    r4->partyMenu = Heap_Alloc(HEAP_ID_FIELD2, sizeof(PartyMenuArgs));
    memset(r4->partyMenu, 0, sizeof(PartyMenuArgs));
    TaskManager_Call(taskManager, sub_0206B984, r4);
}

static BOOL sub_0206B984(TaskManager *taskManager) {
    UnkStruct_0206B910 *r7 = TaskManager_GetEnvironment(taskManager);
    UnkStruct_0206B984 *r6 = r7->unk04;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    switch (r7->state) {
    case 0:
        CallTask_LeaveOverworld(taskManager);
        SealCase *sealCase = Save_SealCase_Get(r7->saveData);
        r6->sealCase = sealCase;
        r6->unk31 = 0;
        r6->menuInputStatePtr = &fieldSystem->menuInputState;
        Party *party = SaveArray_Party_Get(r7->saveData);
        r6->party = party;
        s32 partyCount = Party_GetCount(party);
        r6->partyCount = partyCount;
        s32 i;
        for (i = 0; i < partyCount; i++) {
            r6->mons[i] = Party_GetMonByIndex(r6->party, i);
        }
        for (; i < PARTY_SIZE; i++) {
            r6->mons[i] = NULL;
        }
        r7->state = 1;
        break;
    case 1:
        CallApplicationAsTask(taskManager, &_020FF480, r6);
        r7->state = 2;
        break;
    case 2:
        switch (r7->unk04->unk31) {
        default:
            GF_ASSERT(FALSE);
        case 0:
            r7->state = 5;
            break;
        case 1:
            r7->state = 3;
            break;
        }
        break;
    case 3:
        PartyMenuArgs *partyMenu = r7->partyMenu;
        partyMenu->party = r6->party;
        partyMenu->bag = Save_Bag_Get(r7->saveData);
        partyMenu->mailbox = Save_Mailbox_Get(r7->saveData);
        partyMenu->partySlot = 0;
        partyMenu->unk_25 = 0;
        partyMenu->context = PARTY_MENU_CONTEXT_ATTACH_CAPSULE;
        partyMenu->options = r6->options;
        partyMenu->fieldSystem = fieldSystem;
        partyMenu->menuInputStatePtr = &(fieldSystem->menuInputState);
        CallApplicationAsTask(taskManager, &gOverlayTemplate_PartyMenu, partyMenu);
        r7->state = 4;
        break;
    case 4: {
        PartyMenuArgs *partyMenu = r7->partyMenu;
        u32 index = r7->unk04->unk30 + 1;
        if (partyMenu->partySlot != 7) {
            Pokemon *mon = r7->unk04->mons[partyMenu->partySlot];
            SetMonData(mon, MON_DATA_CAPSULE, &index);
            SetMonData(mon, MON_DATA_SEAL_COORDS, SealCase_GetCapsuleI(r6->sealCase, index - 1));
            sub_0209106C(SealOnCapsuleGetID(CapsuleGetSealI(SealCase_GetCapsuleI(r6->sealCase, index - 1), 0)));
            sub_020270C4(fieldSystem->saveData);
        }
        r7->state = 1;
        break;
    }
    case 5:
        CallTask_RestoreOverworld(taskManager);
        r7->state = 6;
        break;
    case 6:
        Heap_Free(r7->partyMenu);
        Heap_Free(r7->unk04);
        Heap_Free(r7);
        return TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_232(ScriptContext *ctx) {
    UnkStruct_0206BCD4 **unkStruct = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    sub_0206BCA4(*unkStruct, ScriptGetVar(ctx));
    return FALSE;
}

BOOL ScrCmd_233(ScriptContext *ctx) {
    void *unused = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    ctx->data[0] = ScriptGetVar(ctx);
    SetupNativeScript(ctx, sub_0206BB90);
    return TRUE;
}

static BOOL sub_0206BB90(ScriptContext *ctx) {
    UnkStruct_0206BCD4 **unkStruct = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    return sub_0206BCB4(*unkStruct, ctx->data[0]);
}

BOOL ScrCmd_234(ScriptContext *ctx) {
    UnkStruct_0206BCD4 **unkStruct = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 arg1 = ScriptGetVar(ctx);
    u16 arg2 = ScriptGetVar(ctx);
    u16 arg3 = ScriptGetVar(ctx);
    u16 unused = ScriptGetVar(ctx);
    UnkStruct_0206BCEC unusedStruct;
    unusedStruct.unk00 = arg2;
    unusedStruct.unk01 = arg1;
    unusedStruct.unk02 = arg3;
    unusedStruct.unk18 = ctx->fieldSystem->saveData;
    *unkStruct = sub_0206BCEC(&unusedStruct);
    return FALSE;
}

BOOL ScrCmd_235(ScriptContext *ctx) {
    UnkStruct_0206BCD4 **unkStruct = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 unused = ScriptGetVar(ctx);
    u32 unused2 = MapHeader_GetMapSec(ctx->fieldSystem->location->mapId);
    sub_0206BD00(*unkStruct);
    return FALSE;
}

BOOL ScrCmd_236(ScriptContext *ctx) {
    void **unused = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 *result = ScriptGetVarPointer(ctx);
    *result = 0;
    return FALSE;
}

BOOL ScrCmd_237(ScriptContext *ctx) {
    void **unused = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    TextFlags_BeginAutoScroll(TRUE);
    return FALSE;
}

static void sub_0206BCA4(UnkStruct_0206BCD4 *a0, u8 a1) {
    if (a0->unk04 != 0) {
        sub_02037AC0(a1);
    }
}

static BOOL sub_0206BCB4(UnkStruct_0206BCD4 *a0, u8 a1) {
    if (a0->unk04 == 0) {
        return TRUE;
    }
    return sub_02037B38(a1) == TRUE;
}

static UnkStruct_0206BCD4 *sub_0206BCD4(void) {
    UnkStruct_0206BCD4 *unkStruct = Heap_Alloc(HEAP_ID_20, sizeof(UnkStruct_0206BCD4));
    MI_CpuFill8(unkStruct, 0, sizeof(UnkStruct_0206BCD4));
    return unkStruct;
}

static UnkStruct_0206BCD4 *sub_0206BCEC(UnkStruct_0206BCEC *unused) {
    Heap_Create(HEAP_ID_FIELD2, HEAP_ID_20, 0x4000);
    return sub_0206BCD4();
}

static void sub_0206BD00(UnkStruct_0206BCD4 *a0) {
    Heap_Free(a0);
    Heap_Destroy(HEAP_ID_20);
}
