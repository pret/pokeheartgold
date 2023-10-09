#include "global.h"
#include "bag_view.h"
#include "fashion_case.h"
#include "field_system.h"
#include "friend_group.h"
#include "frontier_data.h"
#include "game_stats.h"
#include "get_egg.h"
#include "mail_misc.h"
#include "overlay_02.h"
#include "overlay_manager.h"
#include "pokedex_util.h"
#include "sys_flags.h"
#include "trainer_data.h"
#include "unk_0202C034.h"
#include "unk_0202C730.h"
#include "unk_0202CA24.h"
#include "unk_0202D230.h"
#include "unk_0202DB34.h"
#include "unk_02031904.h"
#include "unk_02037C94.h"
#include "unk_0203DFA4.h"
#include "unk_0203E348.h"
#include "unk_0203E348_data.h"
#include "unk_02054E00.h"
#include "unk_02055244.h"
#include "unk_020552A4.h"
#include "unk_02055418.h"
#include "unk_0206D494.h"
#include "unk_020755E8.h"
#include "unk_02078E30.h"
#include "unk_02082908.h"
#include "unk_02087A78.h"
#include "unk_02088288.h"
#include "unk_0205A44C.h"
#include "unk_020910D8.h"
#include "unk_02092BE8.h"
#include "save_local_field_data.h"
#include "save_pokeathlon.h"
#include "save_special_ribbons.h"
#include "save_trainer_card.h"
#include "battle/battle_022378C0.h"
#include "constants/flags.h"

typedef struct Unk0203E6D4 {
    HeapID unk0;
    PartyMenuAppData *unk4;
    u8 unk8[0x4];
} Unk0203E6D4;

typedef struct Unk0203E8F8 {
    u16 msg_bank;
    u16 msg_no;
} Unk0203E8F8;

typedef struct Unk0203E878 {
    Unk0203E8C8 *unk0;
    u16 *unk4;
    u16 *unk8;
    Unk02090C94 *unkC;
    int unk10;
} Unk0203E878;

typedef struct Unk0203F134 {
    int unk0;
    u16 *unk4;
    int unk8;
    void *unkC;
} Unk0203F134;

typedef struct Unk0203F1E8 {
    u8 unk0[0x20];
    u32 *unk20;
} Unk0203F1E8;

typedef struct Unk0203F218 {
    FieldSystem *unk0;
    PlayerProfile *unk4;
    Party *unk8;
    SavePalPad *unkC;
    SaveData *unk10;
    SaveUnk26 *unk14;
    Options *unk18;
    GAME_STATS *unk1C;
    Pokedex *unk20;
    int unk24;
    int unk28;
    BOOL unk2C;
    int unk30;
    void *unk34;
    Pokemon *unk38;
    Pokemon *unk3C;
} Unk0203F218;

typedef struct Unk0203F308 {
    BoxPokemon *unk0;
    BoxPokemon *unk4;
    void *unk8;
    int unkC;
    int unk10;
    Options *unk14;
    void *unk18;
    u8 unk1C[0x4];
} Unk0203F308;

typedef struct Unk0203F2C8 {
    int unk0;
    Unk0203F218 unk4;
    Unk0203F308 unk44;
} Unk0203F2C8;

typedef struct Unk0203F4C8 {
    struct UnkStruct_0205AC88 *unk0;
    Options *unk4;
} Unk0203F4C8;

typedef struct Unk0203F580 {
    int unk0;
    int unk4;
    u16 *unk8;
    Unk0203F5C0 *unkC;
    String *unk10;
} Unk0203F580;

typedef struct Unk0203F844 {
    int unk0;
    SysInfo *unk4;
    Party *unk8;
    PCStorage *unkC;
    Pokedex *unk10;
    UnkStruct_021D2230 *unk14;
    void *unk18;
    PlayerProfile *unk1C;
    SaveData *unk20;
    Options *unk24;
    GAME_STATS *unk28;
    Bag *unk2C;
    BOOL unk30;
    void *unk34;
    u32 unk38;
    int unk3C;
} Unk0203F844;

extern u8 _020FA0B0[];

static PartyMenuAppData *sub_0203E4FC(HeapID heapId, FieldSystem *fieldSystem, int a2, int a3);
static BOOL sub_0203E604(TaskManager *taskman);
static BOOL sub_0203E878(TaskManager *taskman);
static void SwitchToPokegearApp_Phone(FieldSystem *fieldSystem, void *args);
static void SwitchToPokegearApp_TownMap(FieldSystem *fieldSystem, void *args);
static void sub_0203EAE0(FieldSystem *fieldSystem, Unk0203EB08 *args);
static void sub_0203EB3C(FieldSystem *fieldSystem, UnkStruct_Ov02_0224E4EC *args);
static void sub_0203EB7C(FieldSystem *fieldSystem, Unk0203EC04 *args);
static void FieldSystem_LaunchApplication_AlphPuzzle(FieldSystem *fieldSystem, Unk0203EC04 *a1);
static void sub_0203EC3C(FieldSystem *fieldSystem, UnownReportWork *args);
static void sub_0203EC98(FieldSystem *fieldSystem, BerryPotsArgs *args);
static void sub_0203ECFC(FieldSystem *fieldSystem, ApricornBoxWork *args);
static void sub_0203EDCC(FieldSystem *fieldSystem, void *args);
static void sub_0203EE14(FieldSystem *fieldSystem, void *args);
static BOOL sub_0203EE54(SaveData *saveData);
static void sub_0203EE90(FieldSystem *fieldSystem, Unk0203EEA0 *args);
static void sub_0203EED4(FieldSystem *fieldSystem, Unk0203EEE4 *args);
static void sub_0203EF30(FieldSystem *fieldSystem, Unk0203EF40 *args);
static void sub_0203EF90(FieldSystem *fieldSystem, Unk0203EFA0 *args);
static void sub_0203EFD4(FieldSystem *fieldSystem, UseMailWork *args);
static Unk0203F0D0 *sub_0203F0D0(HeapID heapId, SaveData *saveData, int slot, int *a3, int a4);
static BOOL sub_0203F134(TaskManager *taskman);
static BOOL sub_0203F1E8(FieldSystem *fieldSystem, Unk0203F1E8 *args);
static void sub_0203F218(Unk0203F218 *a0, FieldSystem *fieldSystem);
static void sub_0203F298(Unk0203F218 *a0);
static BOOL sub_0203F2C8(TaskManager *taskman);
static BOOL sub_0203F580(TaskManager *taskman);
static void NamingScreen_SetName(TaskManager *taskman);

void LocationData_BackUp(Location *location) {
    const Location *src = &_020FA17C;
    *location = *src;
}

void LocationData_Restore(Location *location) {
    const Location *src = &_020FA190;
    *location = *src;
}

void Save_CurrentLocation_BackUp(SaveData *saveData) {
    Location *position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(saveData));
    LocationData_BackUp(position);
}

BOOL sub_0203E3A8(OVY_MANAGER *man, int *state) {
    return TRUE;
}

BOOL sub_0203E3AC(OVY_MANAGER *man, int *state) {
    if (Battle_Main(man, state) != 0) {
        return TRUE;
    }
    return FALSE;
}

BOOL sub_0203E3C0(OVY_MANAGER *man, int *state) {
    return TRUE;
}

void sub_0203E3C4(FieldSystem *fieldSystem, BattleSetup *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA484, args);
}

void sub_0203E3D4(FieldSystem *fieldSystem, BagView *args) {
    const OVY_MGR_TEMPLATE *ptr = &_020FA464;
    OVY_MGR_TEMPLATE template = *ptr;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

BagView *sub_0203E3FC(FieldSystem *fieldSystem, TaskManager *taskman) {
    BagView *uVar1 = Bag_CreateView(Save_Bag_Get(fieldSystem->saveData), _020FA1B8, HEAP_ID_FIELD);
    sub_0207789C(uVar1, fieldSystem->saveData, 0, fieldSystem->unk94, &fieldSystem->unk_10C);
    sub_020778E8(uVar1, fieldSystem->unk70 & 0xffff);
    if (PlayerAvatar_GetState(fieldSystem->playerAvatar) == PLAYER_STATE_CYCLING) {
        sub_020778C8(uVar1);
    }
    sub_020778DC(uVar1, taskman);
    sub_0203E3D4(fieldSystem, uVar1);
    return uVar1;
}

BagView *sub_0203E460(FieldSystem *fieldSystem, u8 a1) {
    Bag *bag = Save_Bag_Get(fieldSystem->saveData);
    switch (a1) {
    case 0:
        _0210F978 = _020FA1A4;
        break;
    case 1:
        _0210F978 = _020FA1AC;
        break;
    default:
        GF_ASSERT(FALSE);
    }

    BagView *bagView = Bag_CreateView(bag, _0210F978, HEAP_ID_32);
    sub_0207789C(bagView, fieldSystem->saveData, 3, fieldSystem->unk94, &fieldSystem->unk_10C);
    sub_0203E3D4(fieldSystem, bagView);
    return bagView;
}

int sub_0203E4CC(BagView *a0) {
    int var1 = sub_02077904(a0);
    GF_ASSERT(var1 == 0 || sub_0207790C(a0) != 5);
    return var1;
}

void sub_0203E4EC(FieldSystem *fieldSystem, void *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_02103A1C, args);
}

static PartyMenuAppData *sub_0203E4FC(HeapID heapId, FieldSystem *fieldSystem, int a2, int a3) {
    PartyMenuAppData *partyMenu = AllocFromHeap(heapId, sizeof(PartyMenuAppData));
    MI_CpuClearFast(partyMenu, sizeof(PartyMenuAppData));
    partyMenu->party = SaveArray_Party_Get(fieldSystem->saveData);
    partyMenu->bag = Save_Bag_Get(fieldSystem->saveData);
    partyMenu->mailbox = Save_Mailbox_Get(fieldSystem->saveData);
    partyMenu->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    partyMenu->unk_25 = a2;
    partyMenu->unk_24 = a3;
    partyMenu->fieldSystem = fieldSystem;
    partyMenu->fieldSystem_unk_10C = &fieldSystem->unk_10C;
    return partyMenu;
}

PartyMenuAppData *sub_0203E550(FieldSystem *fieldSystem, int a1, u8 a2) {
    PartyMenuAppData *args = sub_0203E4FC(HEAP_ID_FIELD, fieldSystem, 0, 0);
    args->unk_18 = a1;
    args->unk_26 = a2;
    FieldSystem_LaunchApplication(fieldSystem, &_0210159C, args);
    
    return args;
}

PartyMenuAppData *sub_0203E580(HeapID heapId, FieldSystem *fieldSystem) {
    PartyMenuAppData *args = sub_0203E4FC(HEAP_ID_FIELD, fieldSystem, 0, 3);
    FieldSystem_LaunchApplication(fieldSystem, &_0210159C, args);
    return args;
}

PartyMenuAppData *sub_0203E5A4(HeapID heapId, FieldSystem *fieldSystem) {
    PartyMenuAppData *args = sub_0203E4FC(HEAP_ID_FIELD, fieldSystem, 0, 19);
    FieldSystem_LaunchApplication(fieldSystem, &_0210159C, args);
    return args;
}

int sub_0203E5C8(PartyMenuAppData *partyWork) {
    return partyWork->unk_26;
}

PartyMenuAppData *sub_0203E5D0(HeapID heapId, FieldSystem *fieldSystem, u16 a2) {
    PartyMenuAppData *args = sub_0203E4FC(HEAP_ID_FIELD, fieldSystem, 0, 18);
    args->unk_26 = a2;
    FieldSystem_LaunchApplication(fieldSystem, &_0210159C, args);
    return args;
}

int sub_0203E5F8(PartyMenuAppData *partyWork) {
    return partyWork->filler_27;
}

u16 sub_0203E600(Unk0203E600 *a0) {
    return a0->unk14;
}

static BOOL sub_0203E604(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    Unk0203E604 *data = TaskManager_GetEnvironment(taskman);
    int *state = TaskManager_GetStatePtr(taskman);
    switch (*state) {
    case 0:
        FieldSystem_LaunchApplication(fieldSystem, &_0210159C, data->unk4);
        *state = 1;
        break;
    case 1:
        if (FieldSystem_ApplicationIsRunning(fieldSystem) == 0) {
            switch (data->unk4->unk26) {
            case 7:
                sub_0205A508(2);
                *state = 4;
                break;
            case 6:
                sub_0205A508(1);
                *state = 4;
                break;
            default:
                *state = 2;
            }
        }
        break;
    case 2:
        data->unk8 = sub_0203E76C(fieldSystem, data->unk0, 0);
        data->unk8->unk14 = data->unk4->unk26;
        sub_0203E4EC(fieldSystem, data->unk8);
        *state = 3;
        break;
    case 3:
        if (FieldSystem_ApplicationIsRunning(fieldSystem) == 0) {
            data->unk4->unk26 = data->unk8->unk14;
            FreeToHeap(data->unk8);
            *state = 0;
        }
        break;
    case 4:
        FreeToHeap(data);
        return TRUE;
    }
    return FALSE;
}

PartyMenuAppData *sub_0203E6D4(TaskManager *taskman, HeapID heapId) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    Unk0203E6D4 *data = AllocFromHeap(heapId, sizeof(Unk0203E6D4));
    data->unk0 = heapId;
    PartyMenuAppData *partyMenu = sub_0203E4FC(heapId, fieldSystem, 0, 2);
    partyMenu->unk_36_0 = 2;
    partyMenu->unk_36_4 = 2;
    partyMenu->unk_37 = 0x1e;
    partyMenu->unk_14 = 0;

    data->unk4 = partyMenu;
    TaskManager_Call(taskman, sub_0203E604, data);
    return partyMenu;
}

PartyMenuAppData *sub_0203E740(FieldSystem *fieldSystem, int a1) {
    PartyMenuAppData *args = sub_0203E4FC(HEAP_ID_FIELD, fieldSystem, 0, 0x15);
    args->unk_26 = a1;
    FieldSystem_LaunchApplication(fieldSystem, &_0210159C, args);
    return args;
}

Unk0203E694 *sub_0203E76C(FieldSystem *fieldSystem, HeapID heapId, int a2) {
    SaveData *saveData = fieldSystem->saveData;
    Unk0203E694 *ptr = AllocFromHeapAtEnd(heapId, sizeof(Unk0203E694));
    MI_CpuFill8(ptr, 0, sizeof(Unk0203E694));
    ptr->unk4 = Save_PlayerData_GetOptionsAddr(saveData);
    ptr->unk0 = SaveArray_Party_Get(saveData);
    ptr->unk11 = 1;
    ptr->unk14 = 0;
    ptr->unk13 = Party_GetCount(ptr->unk0);
    ptr->unk18 = 0;
    ptr->unk12 = a2;
    ptr->unk1C = SaveArray_IsNatDexEnabled(saveData);
    ptr->unk2C = sub_02088288(saveData);
    ptr->unk20 = Save_SpecialRibbons_Get(saveData);
    ptr->unk30 = &fieldSystem->unk_10C;
    ptr->unk34 = sub_0208828C(fieldSystem->saveData);
    sub_02089D40(ptr, _020FA1B0);

    PlayerProfile *uVar3 = Save_PlayerData_GetProfileAddr(saveData);
    sub_0208AD34(ptr, uVar3);
    return ptr;
}

Unk0203E694 *sub_0203E7F4(HeapID heapId, FieldSystem *fieldSystem, u8 a2, u16 a3) {
    Unk0203E694 *args = AllocFromHeap(heapId, sizeof(Unk0203E694));
    MI_CpuFill8(args, 0, sizeof(Unk0203E694));
    args->unk0 = SaveArray_Party_Get(fieldSystem->saveData);
    args->unk4 = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unk11 = 1;
    args->unk14 = a2;
    args->unk13 = 1;
    args->unk18 = a3;
    args->unk12 = 2;
    args->unk1C = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
    args->unk2C = 0;
    args->unk30 = &fieldSystem->unk_10C;
    sub_02089D40(args, _020FA1A8);
    sub_0208AD34(args, Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
    sub_0203E4EC(fieldSystem, args);
    return args;
}

u16 sub_0203E864(Unk0203E600 *a0) {
    return a0->unk16;
}

void sub_0203E868(FieldSystem *fieldSystem, PCBoxAppData *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA414, args);
}

static BOOL sub_0203E878(TaskManager *taskman) {
    Unk0203E8F8 var1;
    MAIL_MESSAGE mailMessage;

    int *state = TaskManager_GetStatePtr(taskman);
    Unk0203E878 *data = TaskManager_GetEnvironment(taskman);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    switch (*state) {
    case 0:
        sub_0203EA24(fieldSystem, data->unkC);
        (*state)++;
        break;
    case 1:
        if (FieldSystem_ApplicationIsRunning(fieldSystem) == 0) {
            (*state)++;
        }
        break;
    case 2:
        if ((sub_02090D48(data->unkC) != 0) || (sub_02090D4C(data->unkC) == 0)) {
            data->unk0->unk0 = 0;
        } else {
            data->unk0->unk0 = 1;
            switch (data->unk10) {
            default:
                *data->unk4 = sub_02090D50(data->unkC);
                break;
            case 1:
                // TODO: Fix declaration for this function!
                sub_02090D54(data->unkC, (MAIL_MESSAGE *)&var1);
                *data->unk4 = var1.msg_bank;
                *data->unk8 = var1.msg_no;
                break;
            case 2:
            case 3:
            case 4:
            case 5:
                sub_02090D60(data->unkC, &mailMessage);
                sub_0202D640(fieldSystem->saveData, data->unk10 - 2, &mailMessage);
                *data->unk4 = MailMsg_GetFieldI(&mailMessage, 0);
                break;
            }
        }
        sub_02090D0C(data->unkC);
        FreeToHeap(data);
        return TRUE;
    }
    return FALSE;
}

void sub_0203E960(TaskManager *taskman, int a1, Unk0203E8C8 *a2, u16 *a3, u16 *a4) {
    Unk02090C94 *var1;

    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    Unk0203E878 *data = AllocFromHeap(HEAP_ID_32, sizeof(Unk0203E878));
    data->unk0 = a2;
    data->unk4 = a3;
    data->unk8 = a4;
    data->unk10 = a1;
    switch (a1) {
    default:
        var1 = sub_02090C94(0, 0, fieldSystem->saveData, &fieldSystem->unk_10C, HEAP_ID_32);
        data->unkC = var1;
        sub_02090D14(var1, *a3);
        break;
    case 1:
        var1 = sub_02090C94(1, 0, fieldSystem->saveData, &fieldSystem->unk_10C, HEAP_ID_32);
        data->unkC = var1;
        sub_02090D18(var1, *a3, *a4);
        break;
    case 2:
    case 3:
    case 4:
    case 5:
        var1 = sub_02090C94(2, 0, fieldSystem->saveData, &fieldSystem->unk_10C, HEAP_ID_32);
        data->unkC = var1;
        sub_02090D40(var1);
        MAIL_MESSAGE *uVar3 = sub_0202D660(fieldSystem->saveData, a1 - 2);
        sub_02090D20(data->unkC, uVar3);
        sub_02090D34(data->unkC);
    }
    TaskManager_Call(taskman, sub_0203E878, data);
}

void sub_0203EA24(FieldSystem *fieldSystem, Unk02090C94 *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA404, args);
}

static void SwitchToPokegearApp_Phone(FieldSystem *fieldSystem, void *args) {
    OVY_MGR_TEMPLATE template = _020FA3F4;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

static void SwitchToPokegearApp_TownMap(FieldSystem *fieldSystem, void *args) {
    OVY_MGR_TEMPLATE template = _020FA3E4;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

Unk_PokegearSTRUCT_2C *PhoneUI_New(FieldSystem *fieldSystem) {
    Unk_PokegearSTRUCT_2C *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk_PokegearSTRUCT_2C));
    MI_CpuFill8(args, 0, sizeof(Unk_PokegearSTRUCT_2C));
    sub_02092D80(fieldSystem, args);
    SwitchToPokegearApp_Phone(fieldSystem, args);
    return args;
}

Unk_PokegearSTRUCT_2C *TownMap_New(FieldSystem *fieldSystem, int kind) {
    Unk_PokegearSTRUCT_2C *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk_PokegearSTRUCT_2C));
    MI_CpuFill8(args, 0, sizeof(Unk_PokegearSTRUCT_2C));
    sub_02092D8C(fieldSystem, args);
    args->unk00 = kind;
    SwitchToPokegearApp_TownMap(fieldSystem, args);
    return args;
}

static void sub_0203EAE0(FieldSystem *fieldSystem, Unk0203EB08 *args) {
    OVY_MGR_TEMPLATE template = _020FA3D4;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

Unk0203EB08 *sub_0203EB08(FieldSystem *fieldSystem) {
    Unk0203EB08 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203EB08));
    MI_CpuFill8(args, 0, sizeof(Unk0203EB08));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->unk4 = &fieldSystem->unk_10C;
    sub_0203EAE0(fieldSystem, args);
    return args;
}

static void sub_0203EB3C(FieldSystem *fieldSystem, UnkStruct_Ov02_0224E4EC *args) {
    OVY_MGR_TEMPLATE template = _020FA3C4;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

UnkStruct_Ov02_0224E4EC *sub_0203EB64(FieldSystem *fieldSystem) {
    UnkStruct_Ov02_0224E4EC *args = ov02_0224E4EC(fieldSystem, HEAP_ID_FIELD);
    sub_0203EB3C(fieldSystem, args);
    return args;
}

static void sub_0203EB7C(FieldSystem *fieldSystem, Unk0203EC04 *args) {
    OVY_MGR_TEMPLATE template = _020FA3B4;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

Unk0203EC04 *sub_0203EBA4(FieldSystem *fieldSystem, int a1, int a2) {
    Unk0203EC04 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203EC04));
    MI_CpuFill8(args, 0, sizeof(Unk0203EC04));
    args->unkC = FieldSystem_GetSaveData(fieldSystem);
    args->unk8 = &fieldSystem->unk_10C;
    args->unk2 = a2;
    sub_0203EB7C(fieldSystem, args);
    return args;
}

static void FieldSystem_LaunchApplication_AlphPuzzle(FieldSystem *fieldSystem, Unk0203EC04 *a1) {
    OVY_MGR_TEMPLATE template = _020FA3A4;
    FieldSystem_LaunchApplication(fieldSystem, &template, a1);
}

Unk0203EC04 *FieldSystem_CreateApplication_AlphPuzzle(FieldSystem *fieldSystem, u8 puzzle) {
    Unk0203EC04 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203EC04));
    MI_CpuFill8(args, 0, sizeof(Unk0203EC04));
    args->unkC = FieldSystem_GetSaveData(fieldSystem);
    args->unk8 = &fieldSystem->unk_10C;
    args->unk5 = puzzle;
    FieldSystem_LaunchApplication_AlphPuzzle(fieldSystem, args);
    return args;
}

static void sub_0203EC3C(FieldSystem *fieldSystem, UnownReportWork *args) {
    OVY_MGR_TEMPLATE template = _020FA394;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

UnownReportWork *CreateUnownReportWork(FieldSystem *fieldSystem) {
    UnownReportWork *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnownReportWork));
    MI_CpuFill8(args, 0, sizeof(UnownReportWork));
    args->unk4 = FieldSystem_GetSaveData(fieldSystem);
    args->unk0 = &fieldSystem->unk_10C;
    sub_0203EC3C(fieldSystem, args);
    return args;
}

static void sub_0203EC98(FieldSystem *fieldSystem, BerryPotsArgs *args) {
    OVY_MGR_TEMPLATE template = _020FA384;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

BerryPotsArgs *BerryPotsArgs_New(FieldSystem *fieldSystem) {
    BerryPotsArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(BerryPotsArgs));
    MI_CpuFill8(args, 0, sizeof(BerryPotsArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->unk4 = &fieldSystem->unk_10C;
    args->cursor = fieldSystem->unk94;
    sub_0203EC98(fieldSystem, args);
    return args;
}

static void sub_0203ECFC(FieldSystem *fieldSystem, ApricornBoxWork *args) {
    OVY_MGR_TEMPLATE template = _020FA374;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

ApricornBoxWork *CreateApricornBoxWork(FieldSystem *fieldSystem, int a1) {
    ApricornBoxWork *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(ApricornBoxWork));
    MI_CpuFill8(args, 0, sizeof(ApricornBoxWork));
    args->unk18 = FieldSystem_GetSaveData(fieldSystem);
    args->unk14 = &fieldSystem->unk_10C;
    args->unk10 = GameStats_GetCapped(Save_GameStats_Get(args->unk18), 0);
    if (a1 == 1 && CheckFlag997(Save_VarsFlags_Get(fieldSystem->saveData)) == 0) {
        args->unk0 = 0;
    } else {
        args->unk0 = a1;
    }
    sub_0203ECFC(fieldSystem, args);
    return args;
}

ApricornBoxWork *sub_0203ED80(FieldSystem *fieldSystem, u32 a1, u16 *a2) {
    ApricornBoxWork *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(ApricornBoxWork));
    MI_CpuFill8(args, 0, sizeof(ApricornBoxWork));
    args->unk18 = FieldSystem_GetSaveData(fieldSystem);
    args->unk14 = &fieldSystem->unk_10C;
    args->unk10 = GameStats_GetCapped(Save_GameStats_Get(args->unk18), 0);
    args->unk0 = 3;
    args->unkC = a1;
    args->unk8 = a2;
    sub_0203ECFC(fieldSystem, args);
    return args;
}

static void sub_0203EDCC(FieldSystem *fieldSystem, void *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA364, args);
}

UnkStruct_0203EDDC *sub_0203EDDC(FieldSystem *fieldSystem, Pokemon *a1, Pokemon *a2, BOOL a3) {
    UnkStruct_0203EDDC *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0203EDDC));
    MI_CpuFill8(args, 0, sizeof(UnkStruct_0203EDDC));
    args->unk00 = a1;
    args->unk04 = a2;
    args->unk08 = a3;
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    sub_0203EDCC(fieldSystem, args);
    return args;
}

static void sub_0203EE14(FieldSystem *fieldSystem, void *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA354, args);
}

Unk0203EE24 *sub_0203EE24(FieldSystem *fieldSystem) {
    Unk0203EE24 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203EE24));
    args->unk4 = Save_PlayerData_GetOptionsAddr(FieldSystem_GetSaveData(fieldSystem));
    args->unk8 = &fieldSystem->unk_10C;
    sub_0203EE14(fieldSystem, args);
    return args;
}

static BOOL sub_0203EE54(SaveData *saveData) {
    return Save_VarsFlags_CheckFlagInArray(Save_VarsFlags_Get(saveData), FLAG_UNK_0EF) &&
           Save_VarsFlags_CheckFlagInArray(Save_VarsFlags_Get(saveData), FLAG_UNK_0F0) &&
           Save_VarsFlags_CheckFlagInArray(Save_VarsFlags_Get(saveData), FLAG_UNK_0F1);
}

static void sub_0203EE90(FieldSystem *fieldSystem, Unk0203EEA0 *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA344, args);
}

Unk0203EEA0 *sub_0203EEA0(FieldSystem *fieldSystem) {
    Unk0203EEA0 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203EEA0));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    POKEATHLON_SAV *pokeathlon = Save_Pokeathlon_Get(saveData);
    args->unk0 = sub_02031974(pokeathlon);
    args->unk4 = sub_0203EE54(saveData);
    sub_0203EE90(fieldSystem, args);
    return args;
}

static void sub_0203EED4(FieldSystem *fieldSystem, Unk0203EEE4 *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA314, args);
}

Unk0203EEE4 *sub_0203EEE4(FieldSystem *fieldSystem) {
    Unk0203EEE4 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203EEE4));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    POKEATHLON_SAV *pokeathlonSave = Save_Pokeathlon_Get(saveData);
    Pokedex *pokedex = Save_Pokedex_Get(saveData);
    args->unk0 = pokedex;
    args->unk4 = sub_02031978(pokeathlonSave);
    args->unk8 = Pokedex_GetNatDexFlag(pokedex);
    args->unkC = sub_0203EE54(saveData);
    sub_0203EED4(fieldSystem, args);
    return args;
}

static void sub_0203EF30(FieldSystem *fieldSystem, Unk0203EF40 *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA324, args);
}

Unk0203EF40 *sub_0203EF40(FieldSystem *fieldSystem) {
    Unk0203EF40 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203EF40));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    POKEATHLON_SAV *pokeathlonSave = Save_Pokeathlon_Get(saveData);
    args->unk0 = sub_0203197C(pokeathlonSave);
    args->unk4 = sub_02031984(pokeathlonSave);
    args->unkC = Save_PlayerData_GetProfileAddr(saveData);
    args->unk10 = sub_0203EE54(saveData);
    args->unk8 = sub_02031990(pokeathlonSave);
    sub_0203EF30(fieldSystem, args);
    return args;
}

static void sub_0203EF90(FieldSystem *fieldSystem, Unk0203EFA0 *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA424, args);
}

Unk0203EFA0 *sub_0203EFA0(FieldSystem *fieldSystem) {
    Unk0203EFA0 *args = AllocFromHeapAtEnd(HEAP_ID_3, sizeof(Unk0203EFA0));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    PlayerProfile *uVar3 = Save_PlayerData_GetProfileAddr(saveData);
    args->unk0 = Save_Pokeathlon_Get(saveData);
    args->unk4 = uVar3;
    sub_0203EF90(fieldSystem, args);
    return args;
}

static void sub_0203EFD4(FieldSystem *fieldSystem, UseMailWork *args) {
    args->unk1C = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA434, args);
}

UseMailWork *sub_0203EFEC(FieldSystem *fieldSystem, u16 a1, u8 a2, u8 a3) {
    UseMailWork *args = sub_02090E68(FieldSystem_GetSaveData(fieldSystem), a1, a2, a3, HEAP_ID_FIELD);
    sub_0203EFD4(fieldSystem, args);
    return args;
}

UseMailWork *CreateUseMailWork(FieldSystem *fieldSystem, int kind, u8 mailId, HeapID heapId) {
    UseMailWork *args;

    if (kind == 3) {
        args = sub_02090F38(FieldSystem_GetSaveData(fieldSystem), mailId, heapId);
    } else {
        args = sub_02090EC0(FieldSystem_GetSaveData(fieldSystem), kind, mailId, heapId);
    }
    sub_0203EFD4(fieldSystem, args);
    return args;
}

UseMailWork *sub_0203F050(FieldSystem *fieldSystem, Pokemon *a1, HeapID heapId) {
    UseMailWork *args = sub_02090F00(FieldSystem_GetSaveData(fieldSystem), a1, heapId);
    sub_0203EFD4(fieldSystem, args);
    return args;
}

Unk0203F074 *sub_0203F074(FieldSystem *fieldSystem, HeapID heapId) {
    Unk0203F074 *args = AllocFromHeap(heapId, sizeof(Unk0203F074));
    args->unk0 = FieldSystem_GetSaveData(fieldSystem);
    args->unk4 = fieldSystem;
    args->unk8 = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA2F4, args);
    return args;
}

void sub_0203F0A8(FieldSystem *fieldSystem, UnkStruct_ScrCmd408 *args) {
    OVY_MGR_TEMPLATE template = _020FA2E4;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

static Unk0203F0D0 *sub_0203F0D0(HeapID heapId, SaveData *saveData, int slot, int *a3, int a4) {
    Unk0203F0D0 *ptr = AllocFromHeap(heapId, sizeof(Unk0203F0D0));
    memset(ptr, 0, sizeof(Unk0203F0D0));
    ptr->unk0 = Party_GetMonByIndex(SaveArray_Party_Get(saveData), slot);
    SaveFashionData *fashionSave = Save_FashionData_Get(saveData);
    SaveFashionDataSub *uVar3 = sub_0202B9B8(fashionSave, 0);
    FashionCase *uVar2 = Save_FashionData_GetFashionCase(fashionSave);
    ptr->unk4 = uVar3;
    ptr->unk8 = uVar2;
    ptr->unkC = Save_PlayerData_GetOptionsAddr(saveData);
    ptr->unk10 = Save_GameStats_Get(saveData);
    ptr->unk14 = Save_PlayerData_GetProfileAddr(saveData);
    ptr->unk18 = a3;
    ptr->unk1C = a4;
    return ptr;
}

static BOOL sub_0203F134(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    Unk0203F134 *data = TaskManager_GetEnvironment(taskman);

    switch (data->unk0) {
    case 0:
        sub_0203F1E8(fieldSystem, data->unkC);
        data->unk0++;
        break;
    case 1:
        if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
            u16 *ptr = data->unk4;
            if (ptr != NULL) {
                if (data->unk8 == 1) {
                    *ptr = 1;
                } else {
                    *ptr = 0;
                }
            }
            FreeToHeap(data->unkC);
            FreeToHeap(data);
            return TRUE;
        }
        break;
    }
    return FALSE;
}

void sub_0203F198(TaskManager *taskman, u16 *ret, SaveData *saveData, u16 a3, u16 a4) {
    u32 size;
    u8 *ptr;

    Unk0203F134 *data = AllocFromHeap(HEAP_ID_32, sizeof(Unk0203F134));

    ptr = (u8 *)data;
    size = sizeof(Unk0203F134);
    while (size) {
        *ptr = 0;
        ptr++;
        size--;
    }
    data->unkC = sub_0203F0D0(HEAP_ID_32, saveData, a3, &data->unk8, a4);
    data->unk4 = ret;
    TaskManager_Call(taskman, sub_0203F134, data);
}

static BOOL sub_0203F1E8(FieldSystem *fieldSystem, Unk0203F1E8 *args) {
    args->unk20 = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &_0210F9AC, args);
    return TRUE;
}

BOOL sub_0203F204(FieldSystem *fieldSystem, FashionAppData *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_0210F99C, args);
    return TRUE;
}

static void sub_0203F218(Unk0203F218 *a0, FieldSystem *fieldSystem) {
    a0->unk4 = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    a0->unk8 = SaveArray_Party_Get(fieldSystem->saveData);
    a0->unkC = SaveArray_Get(fieldSystem->saveData, SAVE_PALPAD);
    a0->unk14 = sub_0202CA44(fieldSystem->saveData);
    a0->unk18 = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    a0->unk20 = Save_Pokedex_Get(fieldSystem->saveData);
    a0->unk2C = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
    a0->unk10 = fieldSystem->saveData;
    a0->unk1C = Save_GameStats_Get(fieldSystem->saveData);
    a0->unk34 = AllocFromHeap(HEAP_ID_32, PlayerProfile_sizeof());
    a0->unk38 = AllocFromHeap(HEAP_ID_32, sub_02070D90());
    a0->unk3C = AllocFromHeap(HEAP_ID_32, sub_02070D90());
    a0->unk0 = fieldSystem;
    a0->unk30 = 0;
}

static void sub_0203F298(Unk0203F218 *a0) {
    if (a0->unk34 != NULL) {
        FreeToHeap(a0->unk34);
        a0->unk34 = NULL;
    }
    if (a0->unk38 != NULL) {
        FreeToHeap(a0->unk38);
        a0->unk38 = NULL;
    }
    if (a0->unk3C != NULL) {
        FreeToHeap(a0->unk3C);
        a0->unk3C = NULL;
    }
}

static BOOL sub_0203F2C8(TaskManager *taskman) {
    u32 evolutionCondition;

    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    Unk0203F2C8 *data = TaskManager_GetEnvironment(taskman);
    switch (data->unk0) {
    case 0:
        if (!sub_02039998()) {
            sub_0205525C(taskman);
        }
        data->unk0++;
        break;
    case 1:
        sub_0203F218(&data->unk4, fieldSystem);
        data->unk0++;
    case 2:
        CallApplicationAsTask(taskman, &_0210F98C, &data->unk4);
        data->unk0++;
        break;
    case 3:
        if (data->unk4.unk24 == 0) {
            sub_0203F298(&data->unk4);
            FreeToHeap(data);
            return TRUE;
        }
        data->unk0++;
        break;
    case 4:
        data->unk44.unk8 = data->unk4.unk34;
        data->unk44.unk0 = Mon_GetBoxMon(data->unk4.unk38);
        data->unk44.unk4 = Mon_GetBoxMon(data->unk4.unk3C);
        data->unk44.unk14 = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
        data->unk44.unk10 = 1;

        TIMEOFDAY timeOfDay = Field_GetTimeOfDay(fieldSystem);
        switch (timeOfDay) {
        case RTC_TIMEOFDAY_MORN:
        default:
            data->unk44.unkC = 0;
            break;
        case RTC_TIMEOFDAY_EVE:
            data->unk44.unkC = 1;
            break;
        case RTC_TIMEOFDAY_NITE:
        case RTC_TIMEOFDAY_LATE:
            data->unk44.unkC = 2;
            break;
        }
        if (sub_02039998()) {
            data->unk44.unkC = 3;
        }
        CallApplicationAsTask(taskman, &_020FA2D4, &data->unk44);
        data->unk0 = 5;
        break;
    case 5:
        int heldItem = GetMonData(data->unk4.unk3C, MON_DATA_HELD_ITEM, NULL);
        int species = GetMonEvolution(NULL, data->unk4.unk3C, EVOCTX_TRADE, heldItem, &evolutionCondition);
        if (species != SPECIES_NONE) {
            CreateHeap(HEAP_ID_3, HEAP_ID_26, 0x30000);
            data->unk44.unk18 = sub_02075A7C(NULL, data->unk4.unk3C, species,
                                        Save_PlayerData_GetOptionsAddr(fieldSystem->saveData),
                                        sub_02088288(fieldSystem->saveData),
                                        Save_Pokedex_Get(fieldSystem->saveData),
                                        Save_Bag_Get(fieldSystem->saveData),
                                        Save_GameStats_Get(fieldSystem->saveData),
                                        evolutionCondition, 4, HEAP_ID_26);
            data->unk0 = 6;
        } else {
            data->unk0 = 7;
        }
        break;
    case 6:
        if (sub_02075D3C(data->unk44.unk18)) {
            CopyPokemonToPokemon(data->unk4.unk3C, Party_GetMonByIndex(data->unk4.unk8, data->unk4.unk28));
            sub_02075D4C(data->unk44.unk18);
            DestroyHeap(HEAP_ID_26);
            data->unk0 = 7;
        }
        break;
    case 7:
        data->unk4.unk30++;
        data->unk0 = 2;
        GAME_STATS *gameStats = Save_GameStats_Get(fieldSystem->saveData);
        GameStats_AddSpecial(gameStats, GAME_STAT_UNK16);
        if (sub_02039998()) {
            GameStats_Inc(gameStats, GAME_STAT_UNK114);
        }
        break;
    }
    return FALSE;
}

void sub_0203F4A8(TaskManager *taskman) {
    Unk0203F2C8 *data = AllocFromHeap(HEAP_ID_32, sizeof(Unk0203F2C8));
    data->unk0 = 0;
    TaskManager_Call(taskman, sub_0203F2C8, data);
}

void sub_0203F4C8(FieldSystem *fieldSystem) {
    Unk0203F4C8 *args = AllocFromHeap(HEAP_ID_32, sizeof(Unk0203F4C8));
    args->unk0 = fieldSystem->unk84;
    args->unk4 = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    FieldSystem_LaunchApplication(fieldSystem, &_020FA2C4, args);
}

Unk0203F4F8 *sub_0203F4F8(FieldSystem *fieldSystem) {
    Unk0203F4F8 *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(Unk0203F4F8));
    args->unk0 = fieldSystem->saveData;
    args->unk4 = fieldSystem->unk84;
    args->unk8 = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unkC = Save_GameStats_Get(fieldSystem->saveData);
    args->unk10 = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA2B4, args);
    return args;
}

PalPadWork *CreatePalPadWork(FieldSystem *fieldSystem, SaveData *a1, HeapID heapId) {
    PalPadWork *args = AllocFromHeap(heapId, sizeof(PalPadWork));
    MI_CpuFill8(args, 0, sizeof(PalPadWork));
    args->unk0 = a1;
    args->unk4 = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA2A4, args);
    return args;
}

void sub_0203F570(FieldSystem *fieldSystem, SaveData *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_02102830, fieldSystem);
}

static BOOL sub_0203F580(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    Unk0203F580 *data = TaskManager_GetEnvironment(taskman);
    switch (data->unk0) {
    case 0:
        sub_0205525C(taskman);
        data->unk0++;
        break;
    case 1:
        CallApplicationAsTask(taskman, &_02102610, data->unkC);
        data->unk0++;
        break;
    case 2:
        CallTask_RestoreOverworld(taskman);
        data->unk0++;
        break;
    case 3:
        Unk0203F5C0 *var1 = data->unkC;
        if (var1->unk0 == 1) {
            if (String_Compare(var1->unk18, data->unk10) == 0) {
                data->unkC->unk14 = 1;
            }
        } else if (var1->unk0 == 5) {
            u16 *uVar3 = String_cstr(var1->unk18);
            SAV_FRIEND_GRP *uVar4 = Save_FriendGroup_Get(fieldSystem->saveData);
            if (sub_0202C88C(uVar4, uVar3)) {
                data->unkC->unk14 = 2;
            }
        }
        if (data->unkC->unk14 == 0) {
            NamingScreen_SetName(taskman);
        }
        u16 *ptr = data->unk8;
        if (data->unk8 != NULL) {
            *ptr = data->unkC->unk14;
        }
        sub_0208311C(data->unkC);
        String_Delete(data->unk10);
        FreeToHeap(data);
        return TRUE;
    }
    return FALSE;
}

#ifdef NONMATCHING
// https://decomp.me/scratch/v7YMG
static void NamingScreen_SetName(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    Unk0203F580 *data = TaskManager_GetEnvironment(taskman);
    switch (data->unkC->unk0) {
    case 0:
        Save_Profile_PlayerName_Set(Save_PlayerData_GetProfileAddr(fieldSystem->saveData), data->unkC->unk1C);
        return;
    case 3:
        Save_Misc_RivalName_Set(Save_Misc_Get(fieldSystem->saveData), data->unkC->unk18);
        return;
    case 1:
        Pokemon *mon;
        if (data->unk4 == 0xff) {
            BugContest *contest = FieldSystem_BugContest_Get(fieldSystem);
            mon = contest->mon;
        } else {
            mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), data->unk4);
        }
        SetMonData(mon, MON_DATA_NICKNAME_2, data->unkC->unk1C);
        return;
    case 5:
        sub_0202C7F8(Save_FriendGroup_Get(fieldSystem->saveData), 0, 0, data->unkC->unk18);
        return;
    case 4:
    case 2:
    default:
        return;
    }
}
#else
static asm void NamingScreen_SetName(TaskManager *a0) {
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0]
	cmp r0, #5
	bhi _0203F6DC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203F676:
    DCD 0x002a000a
    DCD 0x001a0064
    DCD 0x00520064
_0203F682:
	ldr r0, [r5, #0xc]
	bl Save_PlayerData_GetProfileAddr
	ldr r1, [r4, #0xc]
	add r1, #0x1c
	bl Save_Profile_PlayerName_Set
	pop {r4, r5, r6, pc}
_0203F692:
	ldr r0, [r5, #0xc]
	bl Save_Misc_Get
	ldr r1, [r4, #0xc]
	ldr r1, [r1, #0x18]
	bl Save_Misc_RivalName_Set
	pop {r4, r5, r6, pc}
_0203F6A2:
	ldr r6, [r4, #4]
	cmp r6, #0xff
	bne _0203F6B2
	add r0, r5, #0
	bl FieldSystem_BugContest_Get
	ldr r0, [r0, #0x10]
	b _0203F6BE
_0203F6B2:
	ldr r0, [r5, #0xc]
	bl SaveArray_Party_Get
	add r1, r6, #0
	bl Party_GetMonByIndex
_0203F6BE:
	ldr r2, [r4, #0xc]
	mov r1, #0x76
	add r2, #0x1c
	bl SetMonData
	pop {r4, r5, r6, pc}
_0203F6CA:
	ldr r0, [r5, #0xc]
	bl Save_FriendGroup_Get
	ldr r3, [r4, #0xc]
	mov r1, #0
	ldr r3, [r3, #0x18]
	add r2, r1, #0
	bl sub_0202C7F8
_0203F6DC:
	pop {r4, r5, r6, pc}
}
#endif //NONMATCHING

void CreateNamingScreen(TaskManager *taskman, int a1, int a2, int a3, int a4, const u16 *a5, u16 *a6) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    Unk0203F580 *ptr = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203F580));
    ptr->unk0 = 0;
    ptr->unk4 = a4;
    ptr->unk8 = a6;
    ptr->unkC = sub_020830D8(HEAP_ID_FIELD, a1, a2, a3, Save_PlayerData_GetOptionsAddr(fieldSystem->saveData), &fieldSystem->unk_10C);
    ptr->unk10 = String_New(12, HEAP_ID_FIELD);

    switch (a1) {
    case 1:
        Pokemon *mon;
        if (a4 == 0xff) {
            BugContest *contest = FieldSystem_BugContest_Get(fieldSystem);
            mon = contest->mon;
        } else {
            mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), ptr->unk4);
        }
        ptr->unkC->unk10 = GetMonData(mon, MON_DATA_GENDER, NULL);
        ptr->unkC->unk8 = GetMonData(mon, MON_DATA_FORM, NULL);
        if (a5 != NULL) {
            CopyU16ArrayToString(ptr->unk10, a5);
        }
        break;
    case 5:
        CopyU16ArrayToString(ptr->unk10, a5);
        break;
    default:
        if (a5 != NULL) {
            CopyU16ArrayToString(ptr->unkC->unk18, a5);
        }
        break;
    }
    TaskManager_Call(taskman, sub_0203F580, ptr);
}

void sub_0203F7B0(FieldSystem *fieldSystem, Unk0203F7B0 *a1) {
    a1->unk66C.unk0 = &fieldSystem->unk_10C;
    a1->unk66C.unk4 = fieldSystem->saveData;
    a1->unk66C.unkC = CheckGameClearFlag(Save_VarsFlags_Get(fieldSystem->saveData));
    a1->unk66C.unk8 = 0;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA294, a1);
}

int sub_0203F7F4(FieldSystem *fieldSystem, void *a1) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA284, a1);
    return 1;
}

void LaunchChooseStarterApp(FieldSystem *fieldSystem, ChooseStarterAppArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sAppTemplate_ChooseStarter, args);
}

void sub_0203F818(FieldSystem *fieldSystem) {
    // unused
    Save_TrainerCard_Get(fieldSystem->saveData);

    OVY_MGR_TEMPLATE template = _020FA254;
    FieldSystem_LaunchApplication(fieldSystem, &template, fieldSystem->saveData);
}

void sub_0203F844(FieldSystem *fieldSystem, u16 a1) {
    OVY_MGR_TEMPLATE template = _020FA264;

    Unk0203F844 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203F844));
    args->unk0 = sub_0202DB34(fieldSystem->saveData);
    args->unk4 = Save_SysInfo_Get(fieldSystem->saveData);
    args->unk8 = (Party *)SaveArray_Get(fieldSystem->saveData, SAVE_PARTY);
    args->unkC = SaveArray_PCStorage_Get(fieldSystem->saveData);
    args->unk10 = Save_Pokedex_Get(fieldSystem->saveData);
    args->unk14 = sub_0202C6F4(fieldSystem->saveData);
    args->unk18 = sub_0202CA44(fieldSystem->saveData);
    args->unk1C = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    args->unk24 = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unk28 = Save_GameStats_Get(fieldSystem->saveData);
    args->unk38 = sub_02088288(fieldSystem->saveData);
    args->unk20 = fieldSystem->saveData;
    args->unk30 = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
    args->unk34 = sub_0203A040(args->unk14);
    args->unk2C = Save_Bag_Get(fieldSystem->saveData);
    args->unk3C = a1;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

Unk0203F8EC *sub_0203F8EC(FieldSystem *fieldSystem, u16 a1, u16 a2) {
    OVY_MGR_TEMPLATE template = _020FA334;

    Unk0203F8EC *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203F8EC));
    args->unk0 = Save_FrontierData_Get(fieldSystem->saveData);
    args->unk4 = sub_0202D928(fieldSystem->saveData);
    args->unk8 = Save_SysInfo_Get(fieldSystem->saveData);
    args->unk10 = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unk14 = sub_0202C08C(sub_0202C6F4(fieldSystem->saveData));
    args->unkC = fieldSystem->saveData;
    args->unk1C = sub_0203A040(sub_0202C6F4(fieldSystem->saveData));
    args->unk18 = a1;
    args->unk24 = a2;
    args->unk20 = 1;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
    return args;
}

void sub_0203F964(FieldSystem *fieldSystem) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA224, fieldSystem->saveData);
}

void LaunchHOFCongratsApp(FieldSystem *fieldSystem, HOFCongratsAppArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA214, args);
}

HALL_OF_FAME *sub_0203F984(FieldSystem *fieldSystem) {
    int loadResult;
    HALL_OF_FAME *hof = LoadHallOfFame(fieldSystem->saveData, HEAP_ID_FIELD, &loadResult);
    if (loadResult == 2) {
        FreeToHeap(hof);
        return NULL;
    }
    FieldSystem_LaunchApplication(fieldSystem, &_020FA204, hof);
    return hof;
}

void LaunchCreditsApp(FieldSystem *fieldSystem, CreditsAppArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA1F4, args);
}

void sub_0203F9C4(FieldSystem *fieldSystem, MoveRelearnerAppArgs *args) {
    OVY_MGR_TEMPLATE template = _020FA1E4;
    args->unkC = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

void HatchEggInParty(FieldSystem *fieldSystem) {
    Unk02091240 args;

    Pokemon *mon = sub_0206CE44(SaveArray_Party_Get(fieldSystem->saveData));
    GF_ASSERT(mon != NULL);

    args.unk0 = mon;
    args.unk4 = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args.unk8 = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    args.unkC = FieldSystem_GetOverriddenMusicId(fieldSystem, fieldSystem->location->mapId);
    sub_02091240(fieldSystem->taskman, &args);
}

VoltorbFlipAppArgs *LaunchVoltorbFlipApp(FieldSystem *fieldSystem, u32 luck) {
    VoltorbFlipAppArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(VoltorbFlipAppArgs));
    MI_CpuFill8(args, 0, sizeof(VoltorbFlipAppArgs));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    args->coins = Save_PlayerData_GetCoinsAddr(saveData);
    args->options = Save_PlayerData_GetOptionsAddr(saveData);
    args->unk8 = &fieldSystem->unk_10C;
    args->profile = Save_PlayerData_GetProfileAddr(saveData);
    args->saveData = fieldSystem->saveData;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA234, args);
    return args;
}

CertificatesApp_Args *LaunchCertificatesApp(FieldSystem *fieldSystem, HeapID heapId, u16 a2) {
    CertificatesApp_Args *args = AllocFromHeap(heapId, sizeof(CertificatesApp_Args));
    args->certificateId = a2;
    args->saveData = fieldSystem->saveData;
    FieldSystem_LaunchApplication(fieldSystem, &sAppTemplate_Certificates, args);
    return args;
}

Unk0203FAB4 *sub_0203FAB4(FieldSystem *fieldSystem, u8 a1, u8 a2, u16 a3, HeapID heapId) {
    Unk0203FAB4 *args = AllocFromHeap(heapId, sizeof(Unk0203FAB4));
    args->unk4 = a1;
    args->unk5 = a2;
    args->unk6 = a3;
    args->unk0 = fieldSystem->saveData;
    FieldSystem_LaunchApplication(fieldSystem, &_0210F9BC, args);
    return args;
}

GracideaWork *sub_0203FAE8(FieldSystem *fieldSystem, HeapID heapId, u16 a2) {
    GracideaWork *args = AllocFromHeap(heapId, sizeof(GracideaWork));
    memset(args, 0, sizeof(GracideaWork));
    args->unk0 = SaveArray_Party_Get(fieldSystem->saveData);
    args->unk4 = Save_Bag_Get(fieldSystem->saveData);
    args->unk8 = Save_Mailbox_Get(fieldSystem->saveData);
    args->unkC = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unk10 = sub_020270C4(fieldSystem->saveData);
    args->unk18 = 0;
    args->unk25 = 0;
    args->unk24 = 5;
    args->unk28 = a2;
    args->unk26 = 0;
    args->unk1C = fieldSystem;
    args->unk20 = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &_0210159C, args);
    return args;
}

ScratchCardAppData *ScratchOffCards_Create(FieldSystem *fieldSystem, HeapID heapId) {
    u32 size;
    u8 *ptr;

    ScratchCardAppData *args = AllocFromHeap(heapId, sizeof(ScratchCardAppData));

    ptr = (u8 *)args;
    for (size = sizeof(ScratchCardAppData); size != 0; size--) {
        *ptr++ = 0;
    }
    args->saveData = fieldSystem->saveData;

    FieldSystem_LaunchApplication(fieldSystem, &_0210F97C, args);
    return args;
}

Unk0203E694 *sub_0203FB94(HeapID heapId, FieldSystem *fieldSystem, u16 a2, u16 a3) {
    Unk0203E694 *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(Unk0203E694));
    args->unk0 = SaveArray_Party_Get(fieldSystem->saveData);
    args->unk4 = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unk11 = 1;
    args->unk14 = a2;
    args->unk13 = Party_GetCount(args->unk0);
    args->unk18 = 0;
    args->unk12 = 0;
    args->unk20 = Save_SpecialRibbons_Get(fieldSystem->saveData);
    args->unk1C = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
    args->unk2C = 0;
    args->unk28 = 0;
    args->unk34 = sub_0208828C(fieldSystem->saveData);
    sub_02089D40(args, _020FA0B0);

    sub_0208AD34(args, Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
    FieldSystem_LaunchApplication(fieldSystem, &_02103A1C, args);
    return args;
}

void sub_0203FC14(FieldSystem *fieldSystem, u16 a1, u16 a2) {
    OVY_MGR_TEMPLATE template = _020FA1C4;

    Unk0203FC14 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203FC14));
    MI_CpuFill8(args, 0, sizeof(Unk0203FC14));
    args->unk0 = fieldSystem;
    args->unk4 = fieldSystem->saveData;
    args->unk8 = a1;
    args->unkC = a2;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

void FieldSystem_LaunchPokeathlonCourseApplication(FieldSystem *fieldSystem, void *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA244, args);
}

void sub_0203FC68(FieldSystem *fieldSystem, void *args) {
    OVY_MGR_TEMPLATE template = _020FA454;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

void sub_0203FC90(FieldSystem *fieldSystem, void *args) {
    OVY_MGR_TEMPLATE template = _020FA1D4;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

Unk0203FCB8 *sub_0203FCB8(FieldSystem *fieldSystem, Unk0203FCC4 *a1, u16 a2, u16 a3, HeapID heapId) {
    Unk0203FCB8 *args = AllocFromHeap(heapId, sizeof(Unk0203FCB8));
    memset(args, 0, sizeof(Unk0203FCB8));
    args->unk0 = FieldSystem_GetSaveData(fieldSystem);
    args->unk4 = *a1;
    args->unk4C = a2;
    args->unk4E = a3;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA474, args);
    return args;
}

void sub_0203FD08(FieldSystem *fieldSystem, void *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA494, args);
}
