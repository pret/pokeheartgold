#include "global.h"
#include "alph_puzzle.h"
#include "bag_view.h"
#include "certificates_app.h"
#include "choose_starter_app.h"
#include "fashion_case.h"
#include "field_system.h"
#include "field/launch_application.h"
#include "field/launch_application_data.h"
#include "friend_group.h"
#include "frontier_data.h"
#include "game_stats.h"
#include "get_egg.h"
#include "mail_misc.h"
#include "overlay_02.h"
#include "overlay_14.h"
#include "overlay_16.h"
#include "overlay_18.h"
#include "overlay_41.h"
#include "overlay_43.h"
#include "overlay_54.h"
#include "overlay_58.h"
#include "overlay_67.h"
#include "overlay_72.h"
#include "overlay_73.h"
#include "overlay_86.h"
#include "overlay_87.h"
#include "overlay_96.h"
#include "overlay_99.h"
#include "overlay_103.h"
#include "overlay_108.h"
#include "overlay_109.h"
#include "overlay_111.h"
#include "overlay_113.h"
#include "overlay_manager.h"
#include "overlay_trainer_card.h"
#include "pokedex_util.h"
#include "sys_flags.h"
#include "trainer_data.h"
#include "unk_020192D0.h"
#include "unk_0202C034.h"
#include "unk_0202C730.h"
#include "unk_0202CA24.h"
#include "unk_0202D230.h"
#include "unk_0202DB34.h"
#include "unk_02031904.h"
#include "unk_02037C94.h"
#include "unk_0203DFA4.h"
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
#include "unk_02097B78.h"
#include "save_local_field_data.h"
#include "save_pokeathlon.h"
#include "save_special_ribbons.h"
#include "save_trainer_card.h"
#include "battle/battle_022378C0.h"
#include "constants/flags.h"

typedef struct Unk0203E6D4 {
    HeapID heapId;
    PartyMenuArgs *partyMenu;
    u8 unk8[0x4];
} Unk0203E6D4;

typedef struct Unk0203E878 {
    Unk0203E8C8 *unk0;
    u16 *unk4;
    u16 *unk8;
    EasyChatArgs *easyChat;
    int unk10;
} Unk0203E878;

typedef struct Unk0203F0D0 {
    Pokemon *mon;
    SaveFashionDataSub *unk4;
    FashionCase *fashionCase;
    Options *options;
    GAME_STATS *gameStats;
    PlayerProfile *profile;
    int *unk18;
    int unk1C;
    u32 *unk20;
} Unk0203F0D0;

typedef struct Unk0203F134 {
    int state;
    u16 *unk4;
    int unk8;
    Unk0203F0D0 *unkC;
} Unk0203F134;

typedef struct WirelessTradeSelectMonArgs {
    FieldSystem *fieldSystem;
    PlayerProfile *profile;
    Party *party;
    SavePalPad *palPad;
    SaveData *saveData;
    SaveUnk26 *unk14;
    Options *options;
    GAME_STATS *gameStats;
    Pokedex *pokedex;
    int unk24;
    int unk28;
    BOOL natDexEnabled;
    int unk30;
    PlayerProfile *partnerProfile;
    Pokemon *unk38;
    Pokemon *unk3C;
} WirelessTradeSelectMonArgs;

typedef struct TradeSequenceArgs {
    BoxPokemon *unk0;
    BoxPokemon *unk4;
    PlayerProfile *partnerProfile;
    int bgType;
    int unk10;
    Options *options;
    void *unk18;
    u8 unk1C[0x4];
} TradeSequenceArgs;

typedef struct WirelessTradeData {
    int state;
    WirelessTradeSelectMonArgs wirelessTradeSelectMon;
    TradeSequenceArgs tradeSequence;
} WirelessTradeData;

typedef struct Unk0203F4C8 {
    struct UnkStruct_0205AC88 *unk0;
    Options *options;
} Unk0203F4C8;

typedef struct NamingScreenData {
    int state;
    int partyIdx;
    u16 *retVar;
    NamingScreenArgs *args;
    String *unk10;
} NamingScreenData;

typedef struct Unk0203F844 {
    int unk0;
    SysInfo *sysInfo;
    Party *party;
    PCStorage *pcStorage;
    Pokedex *pokedex;
    UnkStruct_021D2230 *unk14;
    void *unk18;
    PlayerProfile *profile;
    SaveData *saveData;
    Options *options;
    GAME_STATS *gameStats;
    Bag *bag;
    BOOL natDexEnabled;
    void *unk34;
    u32 unk38;
    int unk3C;
} Unk0203F844;

typedef struct Unk0203E644 {
    u8 unk0[0x26];
    u8 unk26;
} Unk0203E644;

typedef struct PartyMenuMoveSelectData {
    HeapID unk0;
    Unk0203E644 *unk4;
    PokemonSummaryArgs *pokemonSummary;
} PartyMenuMoveSelectData;

extern u8 _020FA0B0[];

static PartyMenuArgs *CreatePartyMenuArgs(HeapID heapId, FieldSystem *fieldSystem, int a2, int a3);
static BOOL Task_OpenPartyMenuThenMoveSelect(TaskManager *taskman);
static BOOL sub_0203E878(TaskManager *taskman);
static void _LaunchPokegearPhoneApp(FieldSystem *fieldSystem, PokegearArgs *args);
static void _LaunchPokegearTownMapApp(FieldSystem *fieldSystem, PokegearArgs *args);
static void _LaunchSafariAreaCustomizerApp(FieldSystem *fieldSystem, SafariAreaCustomizerArgs *args);
static void _LaunchSafariDecorationApp(FieldSystem *fieldSystem, SafariDecorationArgs *args);
static void _LaunchPhotoAlbumApp(FieldSystem *fieldSystem, PhotoAlbumArgs *args);
static void FieldSystem_LaunchApplication_AlphPuzzle(FieldSystem *fieldSystem, AlphPuzzleArgs *args);
static void _LaunchUnownReportApp(FieldSystem *fieldSystem, UnownReportArgs *args);
static void _LaunchBerryPotsApp(FieldSystem *fieldSystem, BerryPotsArgs *args);
static void _LaunchApricornBoxApp(FieldSystem *fieldSystem, ApricornBoxArgs *args);
static void _LaunchBugContestSwapMonApp(FieldSystem *fieldSystem, BugContestSwapMonArgs *args);
static void _LaunchOptionsMenuApp(FieldSystem *fieldSystem, OptionsMenuArgs *args);
static BOOL sub_0203EE54(SaveData *saveData);
static void _LaunchPokeathlonCourseRecordApp(FieldSystem *fieldSystem, PokeathlonCourseRecordArgs *args);
static void _LaunchPokeathlonMedalsApp(FieldSystem *fieldSystem, PokeathlonMedalsArgs *args);
static void _LaunchPokeathlonEventRecordApp(FieldSystem *fieldSystem, PokeathlonEventRecordArgs *args);
static void _LaunchPokeathlonUnkApp(FieldSystem *fieldSystem, Unk0203EFA0 *args);
static void sub_0203EFD4(FieldSystem *fieldSystem, UseMailArgs *args);
static Unk0203F0D0 *sub_0203F0D0(HeapID heapId, SaveData *saveData, int slot, int *a3, int a4);
static BOOL sub_0203F134(TaskManager *taskman);
static BOOL sub_0203F1E8(FieldSystem *fieldSystem, Unk0203F0D0 *args);
static void InitWirelessTradeSelectMonArgs(WirelessTradeSelectMonArgs *a0, FieldSystem *fieldSystem);
static void FreeWirelessTradeSelectMonArgs(WirelessTradeSelectMonArgs *a0);
static BOOL _Task_WirelessTrade(TaskManager *taskman);
static BOOL _Task_NamingScreen(TaskManager *taskman);
static void SetName(TaskManager *taskman);

BOOL Battle_OvyInit(OVY_MANAGER *man, int *state) {
    return TRUE;
}

BOOL Battle_OvyExec(OVY_MANAGER *man, int *state) {
    if (Battle_Main(man, state) != 0) {
        return TRUE;
    }
    return FALSE;
}

BOOL Battle_OvyExit(OVY_MANAGER *man, int *state) {
    return TRUE;
}

void LaunchBattleApp(FieldSystem *fieldSystem, BattleSetup *args) {
    FieldSystem_LaunchApplication(fieldSystem, &gOvyTemplate_Battle, args);
}

void LaunchBagApp(FieldSystem *fieldSystem, BagView *args) {
    const OVY_MGR_TEMPLATE *ptr = &sOvyTemplate_Bag;
    OVY_MGR_TEMPLATE template = *ptr;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

BagView *sub_0203E3FC(FieldSystem *fieldSystem, TaskManager *taskman) {
    BagView *bagView = Bag_CreateView(Save_Bag_Get(fieldSystem->saveData), sAllPockets, HEAP_ID_FIELD);
    sub_0207789C(bagView, fieldSystem->saveData, 0, fieldSystem->unk94, &fieldSystem->unk_10C);
    sub_020778E8(bagView, fieldSystem->unk70 & 0xffff);
    if (PlayerAvatar_GetState(fieldSystem->playerAvatar) == PLAYER_STATE_CYCLING) {
        sub_020778C8(bagView);
    }
    sub_020778DC(bagView, taskman);
    LaunchBagApp(fieldSystem, bagView);
    return bagView;
}

BagView *LaunchBagApp_WithPocket(FieldSystem *fieldSystem, u8 pocketType) {
    Bag *bag = Save_Bag_Get(fieldSystem->saveData);
    switch (pocketType) {
    case 0:
        sPockets = sItemPocket;
        break;
    case 1:
        sPockets = sBerryPocket;
        break;
    default:
        GF_ASSERT(FALSE);
    }

    BagView *bagView = Bag_CreateView(bag, sPockets, HEAP_ID_32);
    sub_0207789C(bagView, fieldSystem->saveData, 3, fieldSystem->unk94, &fieldSystem->unk_10C);
    LaunchBagApp(fieldSystem, bagView);
    return bagView;
}

int BagView_SelectResult(BagView *bagView) {
    int result = sub_02077904(bagView);
    GF_ASSERT(result == 0 || sub_0207790C(bagView) != 5);
    return result;
}

void _LaunchLearnForgetMoveApp(FieldSystem *fieldSystem, PokemonSummaryArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &gOvyTemplate_PokemonSummary, args);
}

static PartyMenuArgs *CreatePartyMenuArgs(HeapID heapId, FieldSystem *fieldSystem, int a2, int a3) {
    PartyMenuArgs *partyMenu = AllocFromHeap(heapId, sizeof(PartyMenuArgs));
    MI_CpuClearFast(partyMenu, sizeof(PartyMenuArgs));
    partyMenu->party = SaveArray_Party_Get(fieldSystem->saveData);
    partyMenu->bag = Save_Bag_Get(fieldSystem->saveData);
    partyMenu->mailbox = Save_Mailbox_Get(fieldSystem->saveData);
    partyMenu->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    partyMenu->unk_25 = a2;
    partyMenu->unk_24 = a3;
    partyMenu->fieldSystem = fieldSystem;
    partyMenu->unk20 = &fieldSystem->unk_10C;
    return partyMenu;
}

PartyMenuArgs *LaunchPartyMenuApp_Unk1(FieldSystem *fieldSystem, int a1, u8 a2) {
    PartyMenuArgs *args = CreatePartyMenuArgs(HEAP_ID_FIELD, fieldSystem, 0, 0);
    args->unk_18 = a1;
    args->unk_26 = a2;
    FieldSystem_LaunchApplication(fieldSystem, &gOvyTemplate_PartyMenu, args);
    return args;
}

PartyMenuArgs *LaunchPartyMenuApp_Unk2(HeapID heapId, FieldSystem *fieldSystem) {
    PartyMenuArgs *args = CreatePartyMenuArgs(HEAP_ID_FIELD, fieldSystem, 0, 3);
    FieldSystem_LaunchApplication(fieldSystem, &gOvyTemplate_PartyMenu, args);
    return args;
}

PartyMenuArgs *LaunchPartyMenuApp_Unk3(HeapID heapId, FieldSystem *fieldSystem) {
    PartyMenuArgs *args = CreatePartyMenuArgs(HEAP_ID_FIELD, fieldSystem, 0, 19);
    FieldSystem_LaunchApplication(fieldSystem, &gOvyTemplate_PartyMenu, args);
    return args;
}

int sub_0203E5C8(PartyMenuArgs *partyWork) {
    return partyWork->unk_26;
}

PartyMenuArgs *LaunchPartyMenuApp_Unk4(HeapID heapId, FieldSystem *fieldSystem, u16 a2) {
    PartyMenuArgs *args = CreatePartyMenuArgs(HEAP_ID_FIELD, fieldSystem, 0, 18);
    args->unk_26 = a2;
    FieldSystem_LaunchApplication(fieldSystem, &gOvyTemplate_PartyMenu, args);
    return args;
}

int sub_0203E5F8(PartyMenuArgs *partyWork) {
    return partyWork->unk_27;
}

u16 sub_0203E600(Unk0203E600 *a0) {
    return a0->unk14;
}

static BOOL Task_OpenPartyMenuThenMoveSelect(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    PartyMenuMoveSelectData *data = TaskManager_GetEnvironment(taskman);
    int *state = TaskManager_GetStatePtr(taskman);
    switch (*state) {
    case 0:
        FieldSystem_LaunchApplication(fieldSystem, &gOvyTemplate_PartyMenu, data->unk4);
        *state = 1;
        break;
    case 1:
        if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
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
        data->pokemonSummary = CreatePokemonSummaryArgs(fieldSystem, data->unk0, 0);
        data->pokemonSummary->unk14 = data->unk4->unk26;
        _LaunchLearnForgetMoveApp(fieldSystem, data->pokemonSummary);
        *state = 3;
        break;
    case 3:
        if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
            data->unk4->unk26 = data->pokemonSummary->unk14;
            FreeToHeap(data->pokemonSummary);
            *state = 0;
        }
        break;
    case 4:
        FreeToHeap(data);
        return TRUE;
    }
    return FALSE;
}

PartyMenuArgs *SelectPartyMonAndLearnMove(TaskManager *taskman, HeapID heapId) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    Unk0203E6D4 *data = AllocFromHeap(heapId, sizeof(Unk0203E6D4));
    data->heapId = heapId;
    PartyMenuArgs *partyMenu = CreatePartyMenuArgs(heapId, fieldSystem, 0, 2);
    partyMenu->unk_36_0 = 2;
    partyMenu->unk_36_4 = 2;
    partyMenu->unk_37 = 0x1e;
    partyMenu->unk_14 = 0;

    data->partyMenu = partyMenu;
    TaskManager_Call(taskman, Task_OpenPartyMenuThenMoveSelect, data);
    return partyMenu;
}

PartyMenuArgs *LaunchPartyMenuApp_Unk5(FieldSystem *fieldSystem, int a1) {
    PartyMenuArgs *args = CreatePartyMenuArgs(HEAP_ID_FIELD, fieldSystem, 0, 0x15);
    args->unk_26 = a1;
    FieldSystem_LaunchApplication(fieldSystem, &gOvyTemplate_PartyMenu, args);
    return args;
}

PokemonSummaryArgs *CreatePokemonSummaryArgs(FieldSystem *fieldSystem, HeapID heapId, int a2) {
    SaveData *saveData = fieldSystem->saveData;
    PokemonSummaryArgs *args = AllocFromHeapAtEnd(heapId, sizeof(PokemonSummaryArgs));
    MI_CpuFill8(args, 0, sizeof(PokemonSummaryArgs));
    args->options = Save_PlayerData_GetOptionsAddr(saveData);
    args->party = SaveArray_Party_Get(saveData);
    args->unk11 = 1;
    args->unk14 = 0;
    args->partyCount = Party_GetCount(args->party);
    args->unk18 = 0;
    args->unk12 = a2;
    args->natDexEnabled = SaveArray_IsNatDexEnabled(saveData);
    args->unk2C = sub_02088288(saveData);
    args->ribbons = Save_SpecialRibbons_Get(saveData);
    args->unk30 = &fieldSystem->unk_10C;
    args->isFlag982Set = sub_0208828C(fieldSystem->saveData);
    sub_02089D40(args, _020FA1B0);

    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(saveData);
    sub_0208AD34(args, profile);
    return args;
}

PokemonSummaryArgs *LaunchLearnForgetMoveApp(HeapID heapId, FieldSystem *fieldSystem, u8 a2, u16 a3) {
    PokemonSummaryArgs *args = AllocFromHeap(heapId, sizeof(PokemonSummaryArgs));
    MI_CpuFill8(args, 0, sizeof(PokemonSummaryArgs));
    args->party = SaveArray_Party_Get(fieldSystem->saveData);
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unk11 = 1;
    args->unk14 = a2;
    args->partyCount = 1;
    args->unk18 = a3;
    args->unk12 = 2;
    args->natDexEnabled = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
    args->unk2C = 0;
    args->unk30 = &fieldSystem->unk_10C;
    sub_02089D40(args, _020FA1A8);
    sub_0208AD34(args, Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
    _LaunchLearnForgetMoveApp(fieldSystem, args);
    return args;
}

u16 sub_0203E864(Unk0203E600 *a0) {
    return a0->unk16;
}

void LaunchPCBoxApp(FieldSystem *fieldSystem, PCBoxArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_PCBox, args);
}

static BOOL sub_0203E878(TaskManager *taskman) {
    MsgBankMsgNo msgBankMsgNo;
    MAIL_MESSAGE mailMessage;

    int *state = TaskManager_GetStatePtr(taskman);
    Unk0203E878 *data = TaskManager_GetEnvironment(taskman);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    switch (*state) {
    case 0:
        LaunchEasyChatApp(fieldSystem, data->easyChat);
        (*state)++;
        break;
    case 1:
        if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
            (*state)++;
        }
        break;
    case 2:
        if (sub_02090D48(data->easyChat) || !sub_02090D4C(data->easyChat)) {
            data->unk0->unk0 = 0;
        } else {
            data->unk0->unk0 = 1;
            switch (data->unk10) {
            default:
                *data->unk4 = sub_02090D50(data->easyChat);
                break;
            case 1:
                sub_02090D54(data->easyChat, &msgBankMsgNo);
                *data->unk4 = msgBankMsgNo.msgBank;
                *data->unk8 = msgBankMsgNo.msgNo;
                break;
            case 2:
            case 3:
            case 4:
            case 5:
                sub_02090D60(data->easyChat, &mailMessage);
                sub_0202D640(fieldSystem->saveData, data->unk10 - 2, &mailMessage);
                *data->unk4 = MailMsg_GetFieldI(&mailMessage, 0);
                break;
            }
        }
        FreeEasyChatArgs(data->easyChat);
        FreeToHeap(data);
        return TRUE;
    }
    return FALSE;
}

void sub_0203E960(TaskManager *taskman, int a1, Unk0203E8C8 *a2, u16 *a3, u16 *a4) {
    EasyChatArgs *args;

    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    Unk0203E878 *data = AllocFromHeap(HEAP_ID_32, sizeof(Unk0203E878));
    data->unk0 = a2;
    data->unk4 = a3;
    data->unk8 = a4;
    data->unk10 = a1;
    switch (a1) {
    default:
        args = CreateEasyChatArgs(0, 0, fieldSystem->saveData, &fieldSystem->unk_10C, HEAP_ID_32);
        data->easyChat = args;
        sub_02090D14(args, *a3);
        break;
    case 1:
        args = CreateEasyChatArgs(1, 0, fieldSystem->saveData, &fieldSystem->unk_10C, HEAP_ID_32);
        data->easyChat = args;
        sub_02090D18(args, *a3, *a4);
        break;
    case 2:
    case 3:
    case 4:
    case 5:
        args = CreateEasyChatArgs(2, 0, fieldSystem->saveData, &fieldSystem->unk_10C, HEAP_ID_32);
        data->easyChat = args;
        sub_02090D40(args);
        MAIL_MESSAGE *mailMessage = sub_0202D660(fieldSystem->saveData, a1 - 2);
        sub_02090D20(data->easyChat, mailMessage);
        sub_02090D34(data->easyChat);
    }
    TaskManager_Call(taskman, sub_0203E878, data);
}

void LaunchEasyChatApp(FieldSystem *fieldSystem, EasyChatArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_EasyChat, args);
}

static void _LaunchPokegearPhoneApp(FieldSystem *fieldSystem, PokegearArgs *args) {
    OVY_MGR_TEMPLATE template = sOvyTemplate_Phone;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

static void _LaunchPokegearTownMapApp(FieldSystem *fieldSystem, PokegearArgs *args) {
    OVY_MGR_TEMPLATE template = sOvyTemplate_TownMap;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

PokegearArgs *LaunchPokegearPhoneApp(FieldSystem *fieldSystem) {
    PokegearArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(PokegearArgs));
    MI_CpuFill8(args, 0, sizeof(PokegearArgs));
    sub_02092D80(fieldSystem, args);
    _LaunchPokegearPhoneApp(fieldSystem, args);
    return args;
}

PokegearArgs *LaunchPokegearTownMapApp(FieldSystem *fieldSystem, int kind) {
    PokegearArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(PokegearArgs));
    MI_CpuFill8(args, 0, sizeof(PokegearArgs));
    sub_02092D8C(fieldSystem, args);
    args->kind = kind;
    _LaunchPokegearTownMapApp(fieldSystem, args);
    return args;
}

static void _LaunchSafariAreaCustomizerApp(FieldSystem *fieldSystem, SafariAreaCustomizerArgs *args) {
    OVY_MGR_TEMPLATE template = sOvyTemplate_SafariAreaCustomizer;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

SafariAreaCustomizerArgs *LaunchSafariAreaCustomizerApp(FieldSystem *fieldSystem) {
    SafariAreaCustomizerArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(SafariAreaCustomizerArgs));
    MI_CpuFill8(args, 0, sizeof(SafariAreaCustomizerArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->unk4 = &fieldSystem->unk_10C;
    _LaunchSafariAreaCustomizerApp(fieldSystem, args);
    return args;
}

static void _LaunchSafariDecorationApp(FieldSystem *fieldSystem, SafariDecorationArgs *args) {
    OVY_MGR_TEMPLATE template = sOvyTemplate_SafariDecoration;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

SafariDecorationArgs *LaunchSafariDecorationApp(FieldSystem *fieldSystem) {
    SafariDecorationArgs *args = CreateSafariDecorationArgs(fieldSystem, HEAP_ID_FIELD);
    _LaunchSafariDecorationApp(fieldSystem, args);
    return args;
}

static void _LaunchPhotoAlbumApp(FieldSystem *fieldSystem, PhotoAlbumArgs *args) {
    OVY_MGR_TEMPLATE template = sOvyTemplate_PhotoAlbum;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

PhotoAlbumArgs *LaunchPhotoAlbumApp(FieldSystem *fieldSystem, int a1, int a2) {
    PhotoAlbumArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(PhotoAlbumArgs));
    MI_CpuFill8(args, 0, sizeof(PhotoAlbumArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->unk8 = &fieldSystem->unk_10C;
    args->unk2 = a2;
    _LaunchPhotoAlbumApp(fieldSystem, args);
    return args;
}

static void FieldSystem_LaunchApplication_AlphPuzzle(FieldSystem *fieldSystem, AlphPuzzleArgs *args) {
    OVY_MGR_TEMPLATE template = sOvyTemplate_AlphPuzzle;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

AlphPuzzleArgs *FieldSystem_CreateApplication_AlphPuzzle(FieldSystem *fieldSystem, u8 puzzle) {
    AlphPuzzleArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(AlphPuzzleArgs));
    MI_CpuFill8(args, 0, sizeof(AlphPuzzleArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->fieldSystemUnk10Cpointer = &fieldSystem->unk_10C;
    args->puzzle = puzzle;
    FieldSystem_LaunchApplication_AlphPuzzle(fieldSystem, args);
    return args;
}

static void _LaunchUnownReportApp(FieldSystem *fieldSystem, UnownReportArgs *args) {
    OVY_MGR_TEMPLATE template = gOvyTemplate_UnownReport;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

UnownReportArgs *LaunchUnownReportApp(FieldSystem *fieldSystem) {
    UnownReportArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnownReportArgs));
    MI_CpuFill8(args, 0, sizeof(UnownReportArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->unk0 = &fieldSystem->unk_10C;
    _LaunchUnownReportApp(fieldSystem, args);
    return args;
}

static void _LaunchBerryPotsApp(FieldSystem *fieldSystem, BerryPotsArgs *args) {
    OVY_MGR_TEMPLATE template = sOvyTemplate_BerryPots;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

BerryPotsArgs *LaunchBerryPotsApp(FieldSystem *fieldSystem) {
    BerryPotsArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(BerryPotsArgs));
    MI_CpuFill8(args, 0, sizeof(BerryPotsArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->unk4 = &fieldSystem->unk_10C;
    args->cursor = fieldSystem->unk94;
    _LaunchBerryPotsApp(fieldSystem, args);
    return args;
}

static void _LaunchApricornBoxApp(FieldSystem *fieldSystem, ApricornBoxArgs *args) {
    OVY_MGR_TEMPLATE template = sOvyTemplate_ApricornBox;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

ApricornBoxArgs *LaunchApricornBoxApp(FieldSystem *fieldSystem, int a1) {
    ApricornBoxArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(ApricornBoxArgs));
    MI_CpuFill8(args, 0, sizeof(ApricornBoxArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->unk14 = &fieldSystem->unk_10C;
    args->unk10 = GameStats_GetCapped(Save_GameStats_Get(args->saveData), GAME_STAT_UNK0);
    if (a1 == 1 && !CheckFlag997(Save_VarsFlags_Get(fieldSystem->saveData))) {
        args->unk0 = 0;
    } else {
        args->unk0 = a1;
    }
    _LaunchApricornBoxApp(fieldSystem, args);
    return args;
}

ApricornBoxArgs *sub_0203ED80(FieldSystem *fieldSystem, u32 a1, u16 *a2) {
    ApricornBoxArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(ApricornBoxArgs));
    MI_CpuFill8(args, 0, sizeof(ApricornBoxArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->unk14 = &fieldSystem->unk_10C;
    args->unk10 = GameStats_GetCapped(Save_GameStats_Get(args->saveData), GAME_STAT_UNK0);
    args->unk0 = 3;
    args->unkC = a1;
    args->unk8 = a2;
    _LaunchApricornBoxApp(fieldSystem, args);
    return args;
}

static void _LaunchBugContestSwapMonApp(FieldSystem *fieldSystem, BugContestSwapMonArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_BugContestSwapMon, args);
}

BugContestSwapMonArgs *LaunchBugContestSwapMonApp(FieldSystem *fieldSystem, Pokemon *newlyCaughtMon, Pokemon *currentMon, BOOL noPokemonCaught) {
    BugContestSwapMonArgs *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(BugContestSwapMonArgs));
    MI_CpuFill8(args, 0, sizeof(BugContestSwapMonArgs));
    args->newlyCaughtMon = newlyCaughtMon;
    args->currentMon = currentMon;
    args->noPokemonCaught = noPokemonCaught;
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    _LaunchBugContestSwapMonApp(fieldSystem, args);
    return args;
}

static void _LaunchOptionsMenuApp(FieldSystem *fieldSystem, OptionsMenuArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_OptionsMenu, args);
}

OptionsMenuArgs *LaunchOptionsMenuApp(FieldSystem *fieldSystem) {
    OptionsMenuArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(OptionsMenuArgs));
    args->options = Save_PlayerData_GetOptionsAddr(FieldSystem_GetSaveData(fieldSystem));
    args->unk8 = &fieldSystem->unk_10C;
    _LaunchOptionsMenuApp(fieldSystem, args);
    return args;
}

static BOOL sub_0203EE54(SaveData *saveData) {
    return Save_VarsFlags_CheckFlagInArray(Save_VarsFlags_Get(saveData), FLAG_UNK_0EF) &&
           Save_VarsFlags_CheckFlagInArray(Save_VarsFlags_Get(saveData), FLAG_UNK_0F0) &&
           Save_VarsFlags_CheckFlagInArray(Save_VarsFlags_Get(saveData), FLAG_UNK_0F1);
}

static void _LaunchPokeathlonCourseRecordApp(FieldSystem *fieldSystem, PokeathlonCourseRecordArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_PokeathlonCourseRecord, args);
}

PokeathlonCourseRecordArgs *LaunchPokeathlonCourseRecordApp(FieldSystem *fieldSystem) {
    PokeathlonCourseRecordArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(PokeathlonCourseRecordArgs));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    POKEATHLON_SAV *pokeathlon = Save_Pokeathlon_Get(saveData);
    args->pokeathlon = sub_02031974(pokeathlon);
    args->unk4 = sub_0203EE54(saveData);
    _LaunchPokeathlonCourseRecordApp(fieldSystem, args);
    return args;
}

static void _LaunchPokeathlonMedalsApp(FieldSystem *fieldSystem, PokeathlonMedalsArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_PokeathlonMedals, args);
}

PokeathlonMedalsArgs *LaunchPokeathlonMedalsApp(FieldSystem *fieldSystem) {
    PokeathlonMedalsArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(PokeathlonMedalsArgs));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    POKEATHLON_SAV *pokeathlonSave = Save_Pokeathlon_Get(saveData);
    Pokedex *pokedex = Save_Pokedex_Get(saveData);
    args->pokedex = pokedex;
    args->unk4 = sub_02031978(pokeathlonSave);
    args->natDexEnabled = Pokedex_GetNatDexFlag(pokedex);
    args->unkC = sub_0203EE54(saveData);
    _LaunchPokeathlonMedalsApp(fieldSystem, args);
    return args;
}

static void _LaunchPokeathlonEventRecordApp(FieldSystem *fieldSystem, PokeathlonEventRecordArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_PokeathlonEventRecord, args);
}

PokeathlonEventRecordArgs *LaunchPokeathlonEventRecordApp(FieldSystem *fieldSystem) {
    PokeathlonEventRecordArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(PokeathlonEventRecordArgs));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    POKEATHLON_SAV *pokeathlonSave = Save_Pokeathlon_Get(saveData);
    args->unk0 = sub_0203197C(pokeathlonSave);
    args->unk4 = sub_02031984(pokeathlonSave);
    args->profile = Save_PlayerData_GetProfileAddr(saveData);
    args->unk10 = sub_0203EE54(saveData);
    args->unk8 = sub_02031990(pokeathlonSave);
    _LaunchPokeathlonEventRecordApp(fieldSystem, args);
    return args;
}

static void _LaunchPokeathlonUnkApp(FieldSystem *fieldSystem, Unk0203EFA0 *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_PokeathlonUnkApp, args);
}

Unk0203EFA0 *LaunchPokeathlonUnkApp(FieldSystem *fieldSystem) {
    Unk0203EFA0 *args = AllocFromHeapAtEnd(HEAP_ID_3, sizeof(Unk0203EFA0));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(saveData);
    args->pokeathlon = Save_Pokeathlon_Get(saveData);
    args->profile = profile;
    _LaunchPokeathlonUnkApp(fieldSystem, args);
    return args;
}

static void sub_0203EFD4(FieldSystem *fieldSystem, UseMailArgs *args) {
    args->unk1C = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA434, args);
}

UseMailArgs *sub_0203EFEC(FieldSystem *fieldSystem, u16 a1, u8 partyIdx, u8 a3) {
    UseMailArgs *args = sub_02090E68(FieldSystem_GetSaveData(fieldSystem), a1, partyIdx, a3, HEAP_ID_FIELD);
    sub_0203EFD4(fieldSystem, args);
    return args;
}

UseMailArgs *CreateUseMailWork(FieldSystem *fieldSystem, int kind, u8 mailId, HeapID heapId) {
    UseMailArgs *args;

    if (kind == 3) {
        args = sub_02090F38(FieldSystem_GetSaveData(fieldSystem), mailId, heapId);
    } else {
        args = sub_02090EC0(FieldSystem_GetSaveData(fieldSystem), kind, mailId, heapId);
    }
    sub_0203EFD4(fieldSystem, args);
    return args;
}

UseMailArgs *sub_0203F050(FieldSystem *fieldSystem, Pokemon *mon, HeapID heapId) {
    UseMailArgs *args = sub_02090F00(FieldSystem_GetSaveData(fieldSystem), mon, heapId);
    sub_0203EFD4(fieldSystem, args);
    return args;
}

Unk0203F074 *sub_0203F074(FieldSystem *fieldSystem, HeapID heapId) {
    Unk0203F074 *args = AllocFromHeap(heapId, sizeof(Unk0203F074));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->fieldSystem = fieldSystem;
    args->unk8 = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA2F4, args);
    return args;
}

void sub_0203F0A8(FieldSystem *fieldSystem, UnkStruct_ScrCmd408 *args) {
    OVY_MGR_TEMPLATE template = _020FA2E4;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

static Unk0203F0D0 *sub_0203F0D0(HeapID heapId, SaveData *saveData, int partyIdx, int *a3, int a4) {
    Unk0203F0D0 *ptr = AllocFromHeap(heapId, sizeof(Unk0203F0D0));
    memset(ptr, 0, sizeof(Unk0203F0D0));
    ptr->mon = Party_GetMonByIndex(SaveArray_Party_Get(saveData), partyIdx);
    SaveFashionData *fashionSave = Save_FashionData_Get(saveData);
    SaveFashionDataSub *var1 = sub_0202B9B8(fashionSave, 0);
    FashionCase *fashionCase = Save_FashionData_GetFashionCase(fashionSave);
    ptr->unk4 = var1;
    ptr->fashionCase = fashionCase;
    ptr->options = Save_PlayerData_GetOptionsAddr(saveData);
    ptr->gameStats = Save_GameStats_Get(saveData);
    ptr->profile = Save_PlayerData_GetProfileAddr(saveData);
    ptr->unk18 = a3;
    ptr->unk1C = a4;
    return ptr;
}

static BOOL sub_0203F134(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    Unk0203F134 *data = TaskManager_GetEnvironment(taskman);

    switch (data->state) {
    case 0:
        sub_0203F1E8(fieldSystem, data->unkC);
        data->state++;
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

static BOOL sub_0203F1E8(FieldSystem *fieldSystem, Unk0203F0D0 *args) {
    args->unk20 = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &_0210F9AC, args);
    return TRUE;
}

BOOL LaunchAccessoryPortraitApp(FieldSystem *fieldSystem, FashionAppData *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_AccessoryPortrait, args);
    return TRUE;
}

static void InitWirelessTradeSelectMonArgs(WirelessTradeSelectMonArgs *args, FieldSystem *fieldSystem) {
    args->profile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    args->party = SaveArray_Party_Get(fieldSystem->saveData);
    args->palPad = SaveArray_Get(fieldSystem->saveData, SAVE_PALPAD);
    args->unk14 = sub_0202CA44(fieldSystem->saveData);
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->pokedex = Save_Pokedex_Get(fieldSystem->saveData);
    args->natDexEnabled = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
    args->saveData = fieldSystem->saveData;
    args->gameStats = Save_GameStats_Get(fieldSystem->saveData);
    args->partnerProfile = AllocFromHeap(HEAP_ID_32, PlayerProfile_sizeof());
    args->unk38 = AllocFromHeap(HEAP_ID_32, sub_02070D90());
    args->unk3C = AllocFromHeap(HEAP_ID_32, sub_02070D90());
    args->fieldSystem = fieldSystem;
    args->unk30 = 0;
}

static void FreeWirelessTradeSelectMonArgs(WirelessTradeSelectMonArgs *args) {
    if (args->partnerProfile != NULL) {
        FreeToHeap(args->partnerProfile);
        args->partnerProfile = NULL;
    }
    if (args->unk38 != NULL) {
        FreeToHeap(args->unk38);
        args->unk38 = NULL;
    }
    if (args->unk3C != NULL) {
        FreeToHeap(args->unk3C);
        args->unk3C = NULL;
    }
}

static BOOL _Task_WirelessTrade(TaskManager *taskman) {
    u32 evolutionCondition;

    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    WirelessTradeData *data = TaskManager_GetEnvironment(taskman);
    switch (data->state) {
    case 0:
        if (!sub_02039998()) {
            sub_0205525C(taskman);
        }
        data->state++;
        break;
    case 1:
        InitWirelessTradeSelectMonArgs(&data->wirelessTradeSelectMon, fieldSystem);
        data->state++;
    case 2:
        CallApplicationAsTask(taskman, &sOvyTemplate_WirelessTradeSelectMon, &data->wirelessTradeSelectMon);
        data->state++;
        break;
    case 3:
        if (data->wirelessTradeSelectMon.unk24 == 0) {
            FreeWirelessTradeSelectMonArgs(&data->wirelessTradeSelectMon);
            FreeToHeap(data);
            return TRUE;
        }
        data->state++;
        break;
    case 4:
        data->tradeSequence.partnerProfile = data->wirelessTradeSelectMon.partnerProfile;
        data->tradeSequence.unk0 = Mon_GetBoxMon(data->wirelessTradeSelectMon.unk38);
        data->tradeSequence.unk4 = Mon_GetBoxMon(data->wirelessTradeSelectMon.unk3C);
        data->tradeSequence.options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
        data->tradeSequence.unk10 = 1;

        TIMEOFDAY timeOfDay = Field_GetTimeOfDay(fieldSystem);
        switch (timeOfDay) {
        case RTC_TIMEOFDAY_MORN:
        default:
            data->tradeSequence.bgType = 0;
            break;
        case RTC_TIMEOFDAY_EVE:
            data->tradeSequence.bgType = 1;
            break;
        case RTC_TIMEOFDAY_NITE:
        case RTC_TIMEOFDAY_LATE:
            data->tradeSequence.bgType = 2;
            break;
        }
        if (sub_02039998()) {
            data->tradeSequence.bgType = 3;
        }
        CallApplicationAsTask(taskman, &sOvyTemplate_TradeSequence, &data->tradeSequence);
        data->state = 5;
        break;
    case 5:
        int heldItem = GetMonData(data->wirelessTradeSelectMon.unk3C, MON_DATA_HELD_ITEM, NULL);
        int species = GetMonEvolution(NULL, data->wirelessTradeSelectMon.unk3C, EVOCTX_TRADE, heldItem, &evolutionCondition);
        if (species != SPECIES_NONE) {
            CreateHeap(HEAP_ID_3, HEAP_ID_26, 0x30000);
            data->tradeSequence.unk18 = sub_02075A7C(NULL, data->wirelessTradeSelectMon.unk3C, species,
                                            Save_PlayerData_GetOptionsAddr(fieldSystem->saveData),
                                            sub_02088288(fieldSystem->saveData),
                                            Save_Pokedex_Get(fieldSystem->saveData),
                                            Save_Bag_Get(fieldSystem->saveData),
                                            Save_GameStats_Get(fieldSystem->saveData),
                                            evolutionCondition, 4, HEAP_ID_26);
            data->state = 6;
        } else {
            data->state = 7;
        }
        break;
    case 6:
        if (sub_02075D3C(data->tradeSequence.unk18)) {
            CopyPokemonToPokemon(
                data->wirelessTradeSelectMon.unk3C,
                Party_GetMonByIndex(data->wirelessTradeSelectMon.party, data->wirelessTradeSelectMon.unk28));
            sub_02075D4C(data->tradeSequence.unk18);
            DestroyHeap(HEAP_ID_26);
            data->state = 7;
        }
        break;
    case 7:
        data->wirelessTradeSelectMon.unk30++;
        data->state = 2;
        GAME_STATS *gameStats = Save_GameStats_Get(fieldSystem->saveData);
        GameStats_AddSpecial(gameStats, GAME_STAT_UNK16);
        if (sub_02039998()) {
            GameStats_Inc(gameStats, GAME_STAT_UNK114);
        }
        break;
    }
    return FALSE;
}

void Task_WirelessTrade(TaskManager *taskman) {
    WirelessTradeData *data = AllocFromHeap(HEAP_ID_32, sizeof(WirelessTradeData));
    data->state = 0;
    TaskManager_Call(taskman, _Task_WirelessTrade, data);
}

void sub_0203F4C8(FieldSystem *fieldSystem) {
    Unk0203F4C8 *args = AllocFromHeap(HEAP_ID_32, sizeof(Unk0203F4C8));
    args->unk0 = fieldSystem->unk84;
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    FieldSystem_LaunchApplication(fieldSystem, &_020FA2C4, args);
}

Unk0203F4F8 *sub_0203F4F8(FieldSystem *fieldSystem) {
    Unk0203F4F8 *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(Unk0203F4F8));
    args->saveData = fieldSystem->saveData;
    args->unk4 = fieldSystem->unk84;
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->gameStats = Save_GameStats_Get(fieldSystem->saveData);
    args->unk10 = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA2B4, args);
    return args;
}

PalPadArgs *LaunchPalPadApp(FieldSystem *fieldSystem, SaveData *saveData, HeapID heapId) {
    PalPadArgs *args = AllocFromHeap(heapId, sizeof(PalPadArgs));
    MI_CpuFill8(args, 0, sizeof(PalPadArgs));
    args->saveData = saveData;
    args->unk4 = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_PalPad, args);
    return args;
}

void sub_0203F570(FieldSystem *fieldSystem, SaveData *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_02102830, fieldSystem);
}

static BOOL _Task_NamingScreen(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    NamingScreenData *data = TaskManager_GetEnvironment(taskman);
    switch (data->state) {
    case 0:
        sub_0205525C(taskman);
        data->state++;
        break;
    case 1:
        CallApplicationAsTask(taskman, &_02102610, data->args);
        data->state++;
        break;
    case 2:
        CallTask_RestoreOverworld(taskman);
        data->state++;
        break;
    case 3:
        NamingScreenArgs *args = data->args;
        if (args->unk0 == 1) {
            if (String_Compare(args->unk18, data->unk10) == 0) {
                data->args->unk14 = 1;
            }
        } else if (args->unk0 == 5) {
            u16 *var2 = String_cstr(args->unk18);
            SAV_FRIEND_GRP *friendGroup = Save_FriendGroup_Get(fieldSystem->saveData);
            if (sub_0202C88C(friendGroup, var2)) {
                data->args->unk14 = 2;
            }
        }
        if (data->args->unk14 == 0) {
            SetName(taskman);
        }
        u16 *retVar = data->retVar;
        if (data->retVar != NULL) {
            *retVar = data->args->unk14;
        }
        sub_0208311C(data->args);
        String_Delete(data->unk10);
        FreeToHeap(data);
        return TRUE;
    }
    return FALSE;
}

static void SetName(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    NamingScreenData *data = TaskManager_GetEnvironment(taskman);
    switch (data->args->unk0) {
    case 0:
        PlayerProfile *profile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
        Save_Profile_PlayerName_Set(profile, data->args->unk1C);
        break;
    case 3:
        SAVE_MISC_DATA *miscData = Save_Misc_Get(fieldSystem->saveData);
        Save_Misc_RivalName_Set(miscData, data->args->unk18);
        break;
    case 1:
        Pokemon *mon;
        if (data->partyIdx == 0xff) {
            BugContest *contest = FieldSystem_BugContest_Get(fieldSystem);
            mon = contest->mon;
        } else {
            mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), data->partyIdx);
        }
        SetMonData(mon, MON_DATA_NICKNAME_2, data->args->unk1C);
        break;
    case 5:
        SAV_FRIEND_GRP *friendGroup = Save_FriendGroup_Get(fieldSystem->saveData);
        sub_0202C7F8(friendGroup, 0, 0, data->args->unk18);
        break;
    case 2:
    case 4:
    default:
        break;
    }
}

void Task_NamingScreen(TaskManager *taskman, NameScreenType type, int species, int maxLen, int partyIdx, const u16 *defaultStr, u16 *retVar) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    NamingScreenData *data = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(NamingScreenData));
    data->state = 0;
    data->partyIdx = partyIdx;
    data->retVar = retVar;
    data->args = CreateNamingScreenArgs(HEAP_ID_FIELD, type, species, maxLen, Save_PlayerData_GetOptionsAddr(fieldSystem->saveData), &fieldSystem->unk_10C);
    data->unk10 = String_New(12, HEAP_ID_FIELD);

    switch (type) {
    case NAME_SCREEN_POKEMON:
        Pokemon *mon;
        if (partyIdx == 0xff) {
            BugContest *contest = FieldSystem_BugContest_Get(fieldSystem);
            mon = contest->mon;
        } else {
            mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), data->partyIdx);
        }
        data->args->gender = GetMonData(mon, MON_DATA_GENDER, NULL);
        data->args->form = GetMonData(mon, MON_DATA_FORM, NULL);
        if (defaultStr != NULL) {
            CopyU16ArrayToString(data->unk10, defaultStr);
        }
        break;
    case NAME_SCREEN_GROUP:
        CopyU16ArrayToString(data->unk10, defaultStr);
        break;
    default:
        if (defaultStr != NULL) {
            CopyU16ArrayToString(data->args->unk18, defaultStr);
        }
        break;
    }
    TaskManager_Call(taskman, _Task_NamingScreen, data);
}

void LaunchTrainerCardApp(FieldSystem *fieldSystem, TrainerCardAppArgs *args) {
    args->unk66C.unk0 = &fieldSystem->unk_10C;
    args->unk66C.saveData = fieldSystem->saveData;
    args->unk66C.gameCleared = CheckGameClearFlag(Save_VarsFlags_Get(fieldSystem->saveData));
    args->unk66C.unk8 = 0;
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_TrainerCard, args);
}

int LaunchPokedexApp(FieldSystem *fieldSystem, PokedexArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_Pokedex, args);
    return 1;
}

void LaunchChooseStarterApp(FieldSystem *fieldSystem, ChooseStarterArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_ChooseStarter, args);
}

void LaunchTrainerCardSignatureApp(FieldSystem *fieldSystem) {
    Save_TrainerCard_Get(fieldSystem->saveData); // unused

    OVY_MGR_TEMPLATE template = sOvyTemplate_TrainerCardSignature;
    FieldSystem_LaunchApplication(fieldSystem, &template, fieldSystem->saveData);
}

void sub_0203F844(FieldSystem *fieldSystem, u16 a1) {
    OVY_MGR_TEMPLATE template = _020FA264;

    Unk0203F844 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203F844));
    args->unk0 = sub_0202DB34(fieldSystem->saveData);
    args->sysInfo = Save_SysInfo_Get(fieldSystem->saveData);
    args->party = (Party *)SaveArray_Get(fieldSystem->saveData, SAVE_PARTY);
    args->pcStorage = SaveArray_PCStorage_Get(fieldSystem->saveData);
    args->pokedex = Save_Pokedex_Get(fieldSystem->saveData);
    args->unk14 = sub_0202C6F4(fieldSystem->saveData);
    args->unk18 = sub_0202CA44(fieldSystem->saveData);
    args->profile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->gameStats = Save_GameStats_Get(fieldSystem->saveData);
    args->unk38 = sub_02088288(fieldSystem->saveData);
    args->saveData = fieldSystem->saveData;
    args->natDexEnabled = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
    args->unk34 = sub_0203A040(args->unk14);
    args->bag = Save_Bag_Get(fieldSystem->saveData);
    args->unk3C = a1;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

NintendoWifiConnectArgs *LaunchNintendoWifiConnectionApp(FieldSystem *fieldSystem, u16 a1, u16 a2) {
    OVY_MGR_TEMPLATE template = sOvyTemplate_NintendoWifiConnect;

    NintendoWifiConnectArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(NintendoWifiConnectArgs));
    args->frontierData = Save_FrontierData_Get(fieldSystem->saveData);
    args->unk4 = sub_0202D928(fieldSystem->saveData);
    args->sysInfo = Save_SysInfo_Get(fieldSystem->saveData);
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unk14 = sub_0202C08C(sub_0202C6F4(fieldSystem->saveData));
    args->saveData = fieldSystem->saveData;
    args->unk1C = sub_0203A040(sub_0202C6F4(fieldSystem->saveData));
    args->unk18 = a1;
    args->unk24 = a2;
    args->unk20 = 1;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
    return args;
}

void LaunchGeonetGlobeApp(FieldSystem *fieldSystem) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_GeonetGlobe, fieldSystem->saveData);
}

void LaunchHOFCongratsApp(FieldSystem *fieldSystem, HOFCongratsArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA214, args);
}

HallOfFame *LaunchHallOfFameCongratsApp(FieldSystem *fieldSystem) {
    int loadResult;
    HallOfFame *hallOfFame = LoadHallOfFame(fieldSystem->saveData, HEAP_ID_FIELD, &loadResult);
    if (loadResult == 2) {
        FreeToHeap(hallOfFame);
        return NULL;
    }
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_HallOfFameCongrats, hallOfFame);
    return hallOfFame;
}

void LaunchCreditsApp(FieldSystem *fieldSystem, CreditsArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_Credits, args);
}

void LaunchMoveRelearnerApp(FieldSystem *fieldSystem, MoveRelearnerArgs *args) {
    OVY_MGR_TEMPLATE template = sOvyTemplate_MoveRelearner;
    args->unkC = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

void HatchEggInParty(FieldSystem *fieldSystem) {
    Unk02091240 data;

    Pokemon *mon = sub_0206CE44(SaveArray_Party_Get(fieldSystem->saveData));
    GF_ASSERT(mon != NULL);

    data.mon = mon;
    data.options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    data.profile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    data.unkC = FieldSystem_GetOverriddenMusicId(fieldSystem, fieldSystem->location->mapId);
    Task_HatchEggInParty(fieldSystem->taskman, &data);
}

VoltorbFlipArgs *LaunchVoltorbFlipApp(FieldSystem *fieldSystem, u32 luck) {
    VoltorbFlipArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(VoltorbFlipArgs));
    MI_CpuFill8(args, 0, sizeof(VoltorbFlipArgs));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    args->coins = Save_PlayerData_GetCoinsAddr(saveData);
    args->options = Save_PlayerData_GetOptionsAddr(saveData);
    args->unk8 = &fieldSystem->unk_10C;
    args->profile = Save_PlayerData_GetProfileAddr(saveData);
    args->saveData = fieldSystem->saveData;
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_VoltorbFlip, args);
    return args;
}

CertificatesArgs *LaunchCertificatesApp(FieldSystem *fieldSystem, HeapID heapId, u16 certificateId) {
    CertificatesArgs *args = AllocFromHeap(heapId, sizeof(CertificatesArgs));
    args->certificateId = certificateId;
    args->saveData = fieldSystem->saveData;
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_Certificates, args);
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

PartyMenuArgs *LaunchPartyMenuApp_Gracidea(FieldSystem *fieldSystem, HeapID heapId, u16 itemId) {
    PartyMenuArgs *args = AllocFromHeap(heapId, sizeof(PartyMenuArgs));
    memset(args, 0, sizeof(PartyMenuArgs));
    args->party = SaveArray_Party_Get(fieldSystem->saveData);
    args->bag = Save_Bag_Get(fieldSystem->saveData);
    args->mailbox = Save_Mailbox_Get(fieldSystem->saveData);
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unk10 = sub_020270C4(fieldSystem->saveData);
    args->unk_18 = 0;
    args->unk_25 = 0;
    args->unk_24 = 5;
    args->unk28 = itemId;
    args->unk_26 = 0;
    args->fieldSystem = fieldSystem;
    args->unk20 = &fieldSystem->unk_10C;
    FieldSystem_LaunchApplication(fieldSystem, &gOvyTemplate_PartyMenu, args);
    return args;
}

ScratchOffCardsArgs *LaunchScratchOffCardsApp(FieldSystem *fieldSystem, HeapID heapId) {
    u32 size;
    u8 *ptr;

    ScratchOffCardsArgs *args = AllocFromHeap(heapId, sizeof(ScratchOffCardsArgs));

    ptr = (u8 *)args;
    for (size = sizeof(ScratchOffCardsArgs); size != 0; size--) {
        *ptr++ = 0;
    }
    args->saveData = fieldSystem->saveData;

    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_ScratchOffCards, args);
    return args;
}

PokemonSummaryArgs *LaunchPokemonSummaryApp(HeapID heapId, FieldSystem *fieldSystem, u16 a2, u16 a3) {
    PokemonSummaryArgs *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(PokemonSummaryArgs));
    args->party = SaveArray_Party_Get(fieldSystem->saveData);
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unk11 = 1;
    args->unk14 = a2;
    args->partyCount = Party_GetCount(args->party);
    args->unk18 = 0;
    args->unk12 = 0;
    args->ribbons = Save_SpecialRibbons_Get(fieldSystem->saveData);
    args->natDexEnabled = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
    args->unk2C = 0;
    args->unk28 = 0;
    args->isFlag982Set = sub_0208828C(fieldSystem->saveData);
    sub_02089D40(args, _020FA0B0);

    sub_0208AD34(args, Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
    FieldSystem_LaunchApplication(fieldSystem, &gOvyTemplate_PokemonSummary, args);
    return args;
}

void sub_0203FC14(FieldSystem *fieldSystem, u16 a1, u16 a2) {
    OVY_MGR_TEMPLATE template = _020FA1C4;

    Unk0203FC14 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Unk0203FC14));
    MI_CpuFill8(args, 0, sizeof(Unk0203FC14));
    args->fieldSystem = fieldSystem;
    args->saveData = fieldSystem->saveData;
    args->unk8 = a1;
    args->unkC = a2;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

void LaunchPokeathlonCourseApp(FieldSystem *fieldSystem, PokeathlonCourseArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_PokeathlonCourse, args);
}

void sub_0203FC68(FieldSystem *fieldSystem, void *args) {
    OVY_MGR_TEMPLATE template = _020FA454;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

void sub_0203FC90(FieldSystem *fieldSystem, void *args) {
    OVY_MGR_TEMPLATE template = _020FA1D4;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

LegendaryCinematicArgs *LaunchLegendaryCinematicApp(FieldSystem *fieldSystem, Unk0203FCC4 *a1, u16 a2, u16 a3, HeapID heapId) {
    LegendaryCinematicArgs *args = AllocFromHeap(heapId, sizeof(LegendaryCinematicArgs));
    memset(args, 0, sizeof(LegendaryCinematicArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->unk4 = *a1;
    args->unk4C = a2;
    args->unk4E = a3;
    FieldSystem_LaunchApplication(fieldSystem, &sOvyTemplate_LegendaryCinematic, args);
    return args;
}

void sub_0203FD08(FieldSystem *fieldSystem, void *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_020FA494, args);
}
