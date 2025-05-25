#include "launch_application.h"

#include "global.h"

#include "constants/flags.h"

#include "application/pokegear/pokegear_main.h"
#include "application/view_rankings.h"
#include "battle/battle_022378C0.h"

#include "alph_puzzle.h"
#include "bag_view.h"
#include "certificates_app.h"
#include "choose_starter_app.h"
#include "fashion_case.h"
#include "field_system.h"
#include "friend_group.h"
#include "frontier_data.h"
#include "game_stats.h"
#include "get_egg.h"
#include "hatch_egg_task.h"
#include "launch_application_internal.h"
#include "mail_misc.h"
#include "naming_screen.h"
#include "overlay_02.h"
#include "overlay_102.h"
#include "overlay_103.h"
#include "overlay_104.h"
#include "overlay_105.h"
#include "overlay_108.h"
#include "overlay_109.h"
#include "overlay_111.h"
#include "overlay_113.h"
#include "overlay_14.h"
#include "overlay_15.h"
#include "overlay_16.h"
#include "overlay_18.h"
#include "overlay_37.h"
#include "overlay_41.h"
#include "overlay_43.h"
#include "overlay_54.h"
#include "overlay_55.h"
#include "overlay_58.h"
#include "overlay_64.h"
#include "overlay_65.h"
#include "overlay_67.h"
#include "overlay_68.h"
#include "overlay_69.h"
#include "overlay_70.h"
#include "overlay_71.h"
#include "overlay_72.h"
#include "overlay_73.h"
#include "overlay_86.h"
#include "overlay_87.h"
#include "overlay_96.h"
#include "overlay_99.h"
#include "overlay_manager.h"
#include "overlay_trainer_card.h"
#include "overlay_trainer_card_signature.h"
#include "party_menu.h"
#include "pokedex_util.h"
#include "pokegear_apps.h"
#include "save_local_field_data.h"
#include "save_pokeathlon.h"
#include "save_special_ribbons.h"
#include "save_trainer_card.h"
#include "save_wifi_history.h"
#include "start_menu.h"
#include "sys_flags.h"
#include "trainer_data.h"
#include "unk_020192D0.h"
#include "unk_0202C034.h"
#include "unk_0202C730.h"
#include "unk_0202D230.h"
#include "unk_0202DB34.h"
#include "unk_02031904.h"
#include "unk_02037C94.h"
#include "unk_02054E00.h"
#include "unk_02055244.h"
#include "unk_020552A4.h"
#include "unk_02055418.h"
#include "unk_0205A44C.h"
#include "unk_0206D494.h"
#include "unk_020755E8.h"
#include "unk_02087A78.h"
#include "unk_02088288.h"
#include "unk_02092BE8.h"
#include "unk_02097B78.h"

FS_EXTERN_OVERLAY(certificates_app);
FS_EXTERN_OVERLAY(credits);
FS_EXTERN_OVERLAY(trainer_card);
FS_EXTERN_OVERLAY(trainer_card_signature);
FS_EXTERN_OVERLAY(voltorb_flip);
FS_EXTERN_OVERLAY(OVY_12);
FS_EXTERN_OVERLAY(OVY_14);
FS_EXTERN_OVERLAY(OVY_15);
FS_EXTERN_OVERLAY(OVY_16);
FS_EXTERN_OVERLAY(OVY_18);
FS_EXTERN_OVERLAY(OVY_37);
FS_EXTERN_OVERLAY(OVY_39);
FS_EXTERN_OVERLAY(OVY_41);
FS_EXTERN_OVERLAY(OVY_43);
FS_EXTERN_OVERLAY(options_app);
FS_EXTERN_OVERLAY(OVY_55);
FS_EXTERN_OVERLAY(OVY_58);
FS_EXTERN_OVERLAY(OVY_61);
FS_EXTERN_OVERLAY(OVY_63);
FS_EXTERN_OVERLAY(OVY_64);
FS_EXTERN_OVERLAY(OVY_65);
FS_EXTERN_OVERLAY(OVY_67);
FS_EXTERN_OVERLAY(OVY_68);
FS_EXTERN_OVERLAY(OVY_69);
FS_EXTERN_OVERLAY(OVY_70);
FS_EXTERN_OVERLAY(OVY_71);
FS_EXTERN_OVERLAY(OVY_72);
FS_EXTERN_OVERLAY(OVY_73);
FS_EXTERN_OVERLAY(OVY_86);
FS_EXTERN_OVERLAY(OVY_87);
FS_EXTERN_OVERLAY(OVY_96);
FS_EXTERN_OVERLAY(OVY_99);
FS_EXTERN_OVERLAY(OVY_100);
FS_EXTERN_OVERLAY(OVY_101);
FS_EXTERN_OVERLAY(OVY_102);
FS_EXTERN_OVERLAY(OVY_103);
FS_EXTERN_OVERLAY(OVY_104);
FS_EXTERN_OVERLAY(OVY_105);
FS_EXTERN_OVERLAY(OVY_106);
FS_EXTERN_OVERLAY(OVY_108);
FS_EXTERN_OVERLAY(OVY_109);
FS_EXTERN_OVERLAY(OVY_110);
FS_EXTERN_OVERLAY(OVY_111);
FS_EXTERN_OVERLAY(OVY_113);
FS_EXTERN_OVERLAY(view_rankings_app);

static PartyMenuArgs *PartyMenu_CreateArgs(HeapID heapId, FieldSystem *fieldSystem, int a2, PartyMenuContext context);
static BOOL Task_OpenPartyMenuForUnionRoomBattleSelect(TaskManager *taskman);
static BOOL sub_0203E878(TaskManager *taskman);
static void PokegearPhone_LaunchApp_Impl(FieldSystem *fieldSystem, PokegearArgs *args);
static void PokegearTownMap_LaunchApp_Impl(FieldSystem *fieldSystem, PokegearArgs *args);
static void SafariAreaCustomizer_LaunchApp_Impl(FieldSystem *fieldSystem, SafariAreaCustomizerArgs *args);
static void SafariDecoration_LaunchApp_Impl(FieldSystem *fieldSystem, SafariDecorationArgs *args);
static void PhotoAlbum_LaunchApp_Impl(FieldSystem *fieldSystem, PhotoAlbumArgs *args);
static void AlphPuzzle_LaunchApp_Impl(FieldSystem *fieldSystem, AlphPuzzleArgs *args);
static void UnownReport_LaunchApp_Impl(FieldSystem *fieldSystem, UnownReportArgs *args);
static void BerryPots_LaunchApp_Impl(FieldSystem *fieldSystem, BerryPotsArgs *args);
static void ApricornBox_LaunchApp_Impl(FieldSystem *fieldSystem, ApricornBoxArgs *args);
static void BugContestSwapMon_LaunchApp_Impl(FieldSystem *fieldSystem, BugContestSwapMonArgs *args);
static void OptionsMenu_LaunchApp_Impl(FieldSystem *fieldSystem, OptionsMenuArgs *args);
static BOOL sub_0203EE54(SaveData *saveData);
static void PokeathlonCourseRecord_LaunchApp_Impl(FieldSystem *fieldSystem, PokeathlonCourseRecordArgs *args);
static void PokeathlonMedals_LaunchApp_Impl(FieldSystem *fieldSystem, PokeathlonMedalsArgs *args);
static void PokeathlonEventRecord_LaunchApp_Impl(FieldSystem *fieldSystem, PokeathlonEventRecordArgs *args);
static void PokeathlonUnk_LaunchApp_Impl(FieldSystem *fieldSystem, UnkStruct_0203EFA0 *args);
static void sub_0203EFD4(FieldSystem *fieldSystem, UseMailArgs *args);
static UnkStruct_0203F0D0 *sub_0203F0D0(HeapID heapId, SaveData *saveData, int slot, int *a3, int a4);
static BOOL sub_0203F134(TaskManager *taskman);
static BOOL sub_0203F1E8(FieldSystem *fieldSystem, UnkStruct_0203F0D0 *args);
static void InitWirelessTradeSelectMonArgs(WirelessTradeSelectMonArgs *a0, FieldSystem *fieldSystem);
static void WirelessTradeSelectMon_FreeArgs(WirelessTradeSelectMonArgs *a0);
static BOOL Task_WirelessTrade(TaskManager *taskman);
static BOOL Task_NamingScreen(TaskManager *taskman);
static void SetName(TaskManager *taskman);

BOOL Battle_Init(OVY_MANAGER *man, int *state) {
    return TRUE;
}

BOOL Battle_Main(OVY_MANAGER *man, int *state) {
    if (Battle_Run(man, state) != 0) {
        return TRUE;
    }
    return FALSE;
}

BOOL Battle_Exit(OVY_MANAGER *man, int *state) {
    return TRUE;
}

const OVY_MGR_TEMPLATE gOverlayTemplate_Battle = { Battle_Init, Battle_Main, Battle_Exit, FS_OVERLAY_ID(OVY_12) };

void Battle_LaunchApp(FieldSystem *fieldSystem, BattleSetup *args) {
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_Battle, args);
}

static const u8 sAllPockets[] = { POCKET_ITEMS, POCKET_MEDICINE, POCKET_BALLS, POCKET_TMHMS, POCKET_BERRIES, POCKET_MAIL, POCKET_BATTLE_ITEMS, POCKET_KEY_ITEMS, 0xFF };

void Bag_LaunchApp(FieldSystem *fieldSystem, BagView *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_Bag = { Bag_Init, Bag_Main, Bag_Exit, FS_OVERLAY_ID(OVY_15) };
    OVY_MGR_TEMPLATE template = sOverlayTemplate_Bag;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

BagView *sub_0203E3FC(FieldSystem *fieldSystem, ItemCheckUseData *taskman) {
    BagView *bagView = Bag_CreateView(Save_Bag_Get(fieldSystem->saveData), sAllPockets, HEAP_ID_FIELD);
    sub_0207789C(bagView, fieldSystem->saveData, 0, fieldSystem->bagCursor, &fieldSystem->menuInputState);
    sub_020778E8(bagView, fieldSystem->unk70);
    if (PlayerAvatar_GetState(fieldSystem->playerAvatar) == PLAYER_STATE_CYCLING) {
        sub_020778C8(bagView);
    }
    sub_020778DC(bagView, taskman);
    Bag_LaunchApp(fieldSystem, bagView);
    return bagView;
}

BagView *Bag_LaunchApp_WithPocket(FieldSystem *fieldSystem, u8 pocketType) {
    static const u8 sBerryPocket[] = { POCKET_BERRIES, 0xFF };
    static const u8 sItemPocket[] = { POCKET_ITEMS, 0xFF };
    static const u8 *sPockets = NULL;

    Bag *bag = Save_Bag_Get(fieldSystem->saveData);
    switch (pocketType) {
    case POCKET_TYPE_ITEMS:
        sPockets = sItemPocket;
        break;
    case POCKET_TYPE_BERRIES:
        sPockets = sBerryPocket;
        break;
    default:
        GF_ASSERT(FALSE);
    }

    BagView *bagView = Bag_CreateView(bag, sPockets, HEAP_ID_32);
    sub_0207789C(bagView, fieldSystem->saveData, 3, fieldSystem->bagCursor, &fieldSystem->menuInputState);
    Bag_LaunchApp(fieldSystem, bagView);
    return bagView;
}

int BagView_SelectResult(BagView *bagView) {
    int result = BagView_GetItemId(bagView);
    GF_ASSERT(result == 0 || sub_0207790C(bagView) != 5);
    return result;
}

// fixme: wrong name
void PokemonSummary_LearnForget_LaunchApp(FieldSystem *fieldSystem, PokemonSummaryArgs *args) {
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PokemonSummary, args);
}

static PartyMenuArgs *PartyMenu_CreateArgs(HeapID heapId, FieldSystem *fieldSystem, int a2, PartyMenuContext context) {
    PartyMenuArgs *partyMenu = AllocFromHeap(heapId, sizeof(PartyMenuArgs));
    MI_CpuClearFast(partyMenu, sizeof(PartyMenuArgs));
    partyMenu->party = SaveArray_Party_Get(fieldSystem->saveData);
    partyMenu->bag = Save_Bag_Get(fieldSystem->saveData);
    partyMenu->mailbox = Save_Mailbox_Get(fieldSystem->saveData);
    partyMenu->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    partyMenu->unk_25 = a2;
    partyMenu->context = context;
    partyMenu->fieldSystem = fieldSystem;
    partyMenu->menuInputStatePtr = &fieldSystem->menuInputState;
    return partyMenu;
}

PartyMenuArgs *PartyMenu_LaunchApp_Unk1(FieldSystem *fieldSystem, FieldMoveCheckData *fieldMoveCheckData, u8 partySlot) {
    PartyMenuArgs *args = PartyMenu_CreateArgs(HEAP_ID_FIELD, fieldSystem, 0, PARTY_MENU_CONTEXT_0);
    args->fieldMoveCheckData = fieldMoveCheckData;
    args->partySlot = partySlot;
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, args);
    return args;
}

PartyMenuArgs *PartyMenu_LaunchApp_Unk2(HeapID heapId, FieldSystem *fieldSystem) {
    PartyMenuArgs *args = PartyMenu_CreateArgs(HEAP_ID_FIELD, fieldSystem, 0, PARTY_MENU_CONTEXT_3);
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, args);
    return args;
}

PartyMenuArgs *PartyMenu_LaunchApp_InGameTrade(HeapID heapId, FieldSystem *fieldSystem) {
    PartyMenuArgs *args = PartyMenu_CreateArgs(HEAP_ID_FIELD, fieldSystem, 0, PARTY_MENU_CONTEXT_INGAME_TRADE);
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, args);
    return args;
}

int PartyMenuArgs_GetSlot(PartyMenuArgs *partyMenuArgs) {
    return partyMenuArgs->partySlot;
}

PartyMenuArgs *PartyMenu_LaunchApp_Unk4(HeapID heapId, FieldSystem *fieldSystem, u16 partySlot) {
    PartyMenuArgs *args = PartyMenu_CreateArgs(HEAP_ID_FIELD, fieldSystem, 0, PARTY_MENU_CONTEXT_18);
    args->partySlot = partySlot;
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, args);
    return args;
}

int sub_0203E5F8(PartyMenuArgs *partyWork) {
    return partyWork->selectedAction;
}

u16 sub_0203E600(UnkStruct_0203E600 *a0) {
    return a0->unk14;
}

static BOOL Task_OpenPartyMenuForUnionRoomBattleSelect(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    PartyMenuMoveSelectData *data = TaskManager_GetEnvironment(taskman);
    int *state = TaskManager_GetStatePtr(taskman);
    switch (*state) {
    case PMMS_OPEN_PARTY_MENU:
        FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, data->unk4);
        *state = PMMS_WAIT_PARTY_MENU;
        break;
    case PMMS_WAIT_PARTY_MENU:
        if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
            switch (data->unk4->partySlot) {
            case 7:
                sub_0205A508(2);
                *state = PMMS_FREE;
                break;
            case 6:
                sub_0205A508(1);
                *state = PMMS_FREE;
                break;
            default:
                *state = PMMS_OPEN_SUMMARY;
            }
        }
        break;
    case PMMS_OPEN_SUMMARY:
        data->pokemonSummary = PokemonSummary_CreateArgs(fieldSystem, data->heapId, 0);
        data->pokemonSummary->partySlot = data->unk4->partySlot;
        PokemonSummary_LearnForget_LaunchApp(fieldSystem, data->pokemonSummary);
        *state = PMMS_WAIT_SUMMARY;
        break;
    case PMMS_WAIT_SUMMARY:
        if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
            data->unk4->partySlot = data->pokemonSummary->partySlot;
            FreeToHeap(data->pokemonSummary);
            *state = PMMS_OPEN_PARTY_MENU;
        }
        break;
    case PMMS_FREE:
        FreeToHeap(data);
        return TRUE;
    }
    return FALSE;
}

PartyMenuArgs *TaskManager_LaunchPartyMenu_UnionRoomBattleSelect(TaskManager *taskman, HeapID heapId) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    UnkStruct_0203E6D4 *data = AllocFromHeap(heapId, sizeof(UnkStruct_0203E6D4));
    data->heapId = heapId;
    PartyMenuArgs *args = PartyMenu_CreateArgs(heapId, fieldSystem, 0, PARTY_MENU_CONTEXT_UNION_ROOM_BATTLE_SELECT);
    args->minMonsToSelect = 2;
    args->maxMonsToSelect = 2;
    args->maxLevel = 30;
    args->linkBattleRuleset = NULL;

    data->partyMenu = args;
    TaskManager_Call(taskman, Task_OpenPartyMenuForUnionRoomBattleSelect, data);
    return args;
}

PartyMenuArgs *PartyMenu_LaunchApp_Unk5(FieldSystem *fieldSystem, int partySlot) {
    PartyMenuArgs *args = PartyMenu_CreateArgs(HEAP_ID_FIELD, fieldSystem, 0, PARTY_MENU_CONTEXT_SPIN_TRADE);
    args->partySlot = partySlot;
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, args);
    return args;
}

PokemonSummaryArgs *PokemonSummary_CreateArgs(FieldSystem *fieldSystem, HeapID heapId, int a2) {
    static const u8 _020FA1B0[] = { 0x00, 0x01, 0x02, 0x03, 0x04 };
    SaveData *saveData = fieldSystem->saveData;
    PokemonSummaryArgs *args = AllocFromHeapAtEnd(heapId, sizeof(PokemonSummaryArgs));
    MI_CpuFill8(args, 0, sizeof(PokemonSummaryArgs));
    args->options = Save_PlayerData_GetOptionsAddr(saveData);
    args->party = SaveArray_Party_Get(saveData);
    args->unk11 = 1;
    args->partySlot = 0;
    args->partyCount = Party_GetCount(args->party);
    args->moveToLearn = MOVE_NONE;
    args->unk12 = a2;
    args->natDexEnabled = SaveArray_IsNatDexEnabled(saveData);
    args->unk2C = sub_02088288(saveData);
    args->ribbons = Save_SpecialRibbons_Get(saveData);
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    args->isFlag982Set = sub_0208828C(fieldSystem->saveData);
    sub_02089D40(args, _020FA1B0);

    PlayerProfile *profile = Save_PlayerData_GetProfile(saveData);
    sub_0208AD34(args, profile);
    return args;
}

PokemonSummaryArgs *LearnForgetMove_LaunchApp(HeapID heapId, FieldSystem *fieldSystem, u8 partySlot, u16 moveToLearn) {
    static const u8 _020FA1A8[] = { 0x01, 0x04 };
    PokemonSummaryArgs *args = AllocFromHeap(heapId, sizeof(PokemonSummaryArgs));
    MI_CpuFill8(args, 0, sizeof(PokemonSummaryArgs));
    args->party = SaveArray_Party_Get(fieldSystem->saveData);
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unk11 = 1;
    args->partySlot = partySlot;
    args->partyCount = 1;
    args->moveToLearn = moveToLearn;
    args->unk12 = 2;
    args->natDexEnabled = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
    args->unk2C = 0;
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    sub_02089D40(args, _020FA1A8);
    sub_0208AD34(args, Save_PlayerData_GetProfile(fieldSystem->saveData));
    PokemonSummary_LearnForget_LaunchApp(fieldSystem, args);
    return args;
}

u16 sub_0203E864(UnkStruct_0203E600 *a0) {
    return a0->unk16;
}

void PCBox_LaunchApp(FieldSystem *fieldSystem, PCBoxArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_PCBox = { PCBox_Init, PCBox_Main, PCBox_Exit, FS_OVERLAY_ID(OVY_14) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_PCBox, args);
}

static BOOL sub_0203E878(TaskManager *taskman) {
    MsgBankMsgNo msgBankMsgNo;
    MailMessage mailMessage;

    int *state = (int *)TaskManager_GetStatePtr(taskman);
    UnkStruct_0203E878 *data = TaskManager_GetEnvironment(taskman);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    switch (*state) {
    case UNK_0203E878_STATE_0:
        EasyChat_LaunchApp(fieldSystem, data->easyChat);
        (*state)++;
        break;
    case UNK_0203E878_STATE_1:
        if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
            (*state)++;
        }
        break;
    case UNK_0203E878_STATE_2:
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
        EasyChat_FreeArgs(data->easyChat);
        FreeToHeap(data);
        return TRUE;
    }
    return FALSE;
}

void sub_0203E960(TaskManager *taskman, int a1, UnkStruct_0203E8C8 *a2, u16 *a3, u16 *a4) {
    EasyChatArgs *args;

    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    UnkStruct_0203E878 *data = AllocFromHeap(HEAP_ID_32, sizeof(UnkStruct_0203E878));
    data->unk0 = a2;
    data->unk4 = a3;
    data->unk8 = a4;
    data->unk10 = a1;
    switch (a1) {
    default:
        args = EasyChat_CreateArgs(0, 0, fieldSystem->saveData, &fieldSystem->menuInputState, HEAP_ID_32);
        data->easyChat = args;
        sub_02090D14(args, *a3);
        break;
    case 1:
        args = EasyChat_CreateArgs(1, 0, fieldSystem->saveData, &fieldSystem->menuInputState, HEAP_ID_32);
        data->easyChat = args;
        sub_02090D18(args, *a3, *a4);
        break;
    case 2:
    case 3:
    case 4:
    case 5:
        args = EasyChat_CreateArgs(2, 0, fieldSystem->saveData, &fieldSystem->menuInputState, HEAP_ID_32);
        data->easyChat = args;
        sub_02090D40(args);
        MailMessage *mailMessage = sub_0202D660(fieldSystem->saveData, a1 - 2);
        sub_02090D20(data->easyChat, mailMessage);
        sub_02090D34(data->easyChat);
    }
    TaskManager_Call(taskman, sub_0203E878, data);
}

void EasyChat_LaunchApp(FieldSystem *fieldSystem, EasyChatArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_EasyChat = { EasyChat_Init, EasyChat_Main, EasyChat_Exit, FS_OVERLAY_ID(OVY_102) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_EasyChat, args);
}

static void PokegearPhone_LaunchApp_Impl(FieldSystem *fieldSystem, PokegearArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_Pokegear = { Pokegear_Init, Pokegear_Main, Pokegear_Exit, FS_OVERLAY_ID(OVY_100) };
    OVY_MGR_TEMPLATE template = sOverlayTemplate_Pokegear;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

static void PokegearTownMap_LaunchApp_Impl(FieldSystem *fieldSystem, PokegearArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_TownMap = { TownMap_Init, TownMap_Main, TownMap_Exit, FS_OVERLAY_ID(OVY_101) };
    OVY_MGR_TEMPLATE template = sOverlayTemplate_TownMap;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

PokegearArgs *PokegearPhone_LaunchApp(FieldSystem *fieldSystem) {
    PokegearArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(PokegearArgs));
    MI_CpuFill8(args, 0, sizeof(PokegearArgs));
    sub_02092D80(fieldSystem, args);
    PokegearPhone_LaunchApp_Impl(fieldSystem, args);
    return args;
}

PokegearArgs *PokegearTownMap_LaunchApp(FieldSystem *fieldSystem, int kind) {
    PokegearArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(PokegearArgs));
    MI_CpuFill8(args, 0, sizeof(PokegearArgs));
    sub_02092D8C(fieldSystem, args);
    args->incomingPhoneCall = kind;
    PokegearTownMap_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void SafariAreaCustomizer_LaunchApp_Impl(FieldSystem *fieldSystem, SafariAreaCustomizerArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_SafariAreaCustomizer = { SafariAreaCustomizer_Init, SafariAreaCustomizer_Main, SafariAreaCustomizer_Exit, FS_OVERLAY_ID(OVY_108) };
    OVY_MGR_TEMPLATE template = sOverlayTemplate_SafariAreaCustomizer;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

SafariAreaCustomizerArgs *SafariAreaCustomizer_LaunchApp(FieldSystem *fieldSystem) {
    SafariAreaCustomizerArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(SafariAreaCustomizerArgs));
    MI_CpuFill8(args, 0, sizeof(SafariAreaCustomizerArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    SafariAreaCustomizer_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void SafariDecoration_LaunchApp_Impl(FieldSystem *fieldSystem, SafariDecorationArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_SafariDecoration = { SafariDecoration_Init, SafariDecoration_Main, SafariDecoration_Exit, FS_OVERLAY_ID(OVY_108) };
    OVY_MGR_TEMPLATE template = sOverlayTemplate_SafariDecoration;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

SafariDecorationArgs *SafariDecoration_LaunchApp(FieldSystem *fieldSystem) {
    SafariDecorationArgs *args = SafariDecoration_CreateArgs(fieldSystem, HEAP_ID_FIELD);
    SafariDecoration_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void PhotoAlbum_LaunchApp_Impl(FieldSystem *fieldSystem, PhotoAlbumArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_PhotoAlbum = { PhotoAlbum_Init, PhotoAlbum_Main, PhotoAlbum_Exit, FS_OVERLAY_ID(OVY_109) };
    OVY_MGR_TEMPLATE template = sOverlayTemplate_PhotoAlbum;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

PhotoAlbumArgs *PhotoAlbum_LaunchApp(FieldSystem *fieldSystem, int unused, int initialCursorPos) {
    PhotoAlbumArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(PhotoAlbumArgs));
    MI_CpuFill8(args, 0, sizeof(PhotoAlbumArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    args->cursorPos = initialCursorPos;
    PhotoAlbum_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void AlphPuzzle_LaunchApp_Impl(FieldSystem *fieldSystem, AlphPuzzleArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_AlphPuzzle = { AlphPuzzle_Init, AlphPuzzle_Main, AlphPuzzle_Exit, FS_OVERLAY_ID(OVY_110) };
    OVY_MGR_TEMPLATE template = sOverlayTemplate_AlphPuzzle;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

AlphPuzzleArgs *AlphPuzzle_LaunchApp(FieldSystem *fieldSystem, u8 puzzle) {
    AlphPuzzleArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(AlphPuzzleArgs));
    MI_CpuFill8(args, 0, sizeof(AlphPuzzleArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    args->puzzle = puzzle;
    AlphPuzzle_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void UnownReport_LaunchApp_Impl(FieldSystem *fieldSystem, UnownReportArgs *args) {
    static const OVY_MGR_TEMPLATE gOverlayTemplate_UnownReport = { UnownReport_Init, UnownReport_Main, UnownReport_Exit, FS_OVERLAY_ID(OVY_113) };
    OVY_MGR_TEMPLATE template = gOverlayTemplate_UnownReport;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

UnownReportArgs *UnownReport_LaunchApp(FieldSystem *fieldSystem) {
    UnownReportArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnownReportArgs));
    MI_CpuFill8(args, 0, sizeof(UnownReportArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    UnownReport_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void BerryPots_LaunchApp_Impl(FieldSystem *fieldSystem, BerryPotsArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_BerryPots = { BerryPots_Init, BerryPots_Main, BerryPots_Exit, FS_OVERLAY_ID(OVY_16) };
    OVY_MGR_TEMPLATE template = sOverlayTemplate_BerryPots;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

BerryPotsArgs *BerryPots_LaunchApp(FieldSystem *fieldSystem) {
    BerryPotsArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(BerryPotsArgs));
    MI_CpuFill8(args, 0, sizeof(BerryPotsArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    args->cursor = fieldSystem->bagCursor;
    BerryPots_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void ApricornBox_LaunchApp_Impl(FieldSystem *fieldSystem, ApricornBoxArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_ApricornBox = { ApricornBox_Init, ApricornBox_Main, ApricornBox_Exit, FS_OVERLAY_ID(OVY_58) };
    OVY_MGR_TEMPLATE template = sOverlayTemplate_ApricornBox;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

ApricornBoxArgs *ApricornBox_LaunchApp(FieldSystem *fieldSystem, int a1) {
    ApricornBoxArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(ApricornBoxArgs));
    MI_CpuFill8(args, 0, sizeof(ApricornBoxArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    args->unk10 = GameStats_GetCapped(Save_GameStats_Get(args->saveData), GAME_STAT_UNK0);
    if (a1 == 1 && !CheckFlag997(Save_VarsFlags_Get(fieldSystem->saveData))) {
        args->unk0 = 0;
    } else {
        args->unk0 = a1;
    }
    ApricornBox_LaunchApp_Impl(fieldSystem, args);
    return args;
}

ApricornBoxArgs *sub_0203ED80(FieldSystem *fieldSystem, u32 a1, u16 *a2) {
    ApricornBoxArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(ApricornBoxArgs));
    MI_CpuFill8(args, 0, sizeof(ApricornBoxArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    args->unk10 = GameStats_GetCapped(Save_GameStats_Get(args->saveData), GAME_STAT_UNK0);
    args->unk0 = 3;
    args->unkC = a1;
    args->unk8 = a2;
    ApricornBox_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void BugContestSwapMon_LaunchApp_Impl(FieldSystem *fieldSystem, BugContestSwapMonArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_BugContestSwapMon = { BugContestSwapMon_Init, BugContestSwapMon_Main, BugContestSwapMon_Exit, FS_OVERLAY_ID(OVY_111) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_BugContestSwapMon, args);
}

BugContestSwapMonArgs *BugContestSwapMon_LaunchApp(FieldSystem *fieldSystem, Pokemon *newlyCaughtMon, Pokemon *currentMon, BOOL noPokemonCaught) {
    BugContestSwapMonArgs *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(BugContestSwapMonArgs));
    MI_CpuFill8(args, 0, sizeof(BugContestSwapMonArgs));
    args->newlyCaughtMon = newlyCaughtMon;
    args->currentMon = currentMon;
    args->noPokemonCaught = noPokemonCaught;
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    BugContestSwapMon_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void OptionsMenu_LaunchApp_Impl(FieldSystem *fieldSystem, OptionsMenuArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_OptionsMenu = { OptionsMenu_Init, OptionsMenu_Main, OptionsMenu_Exit, FS_OVERLAY_ID(options_app) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_OptionsMenu, args);
}

OptionsMenuArgs *OptionsMenu_LaunchApp(FieldSystem *fieldSystem) {
    OptionsMenuArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(OptionsMenuArgs));
    args->options = Save_PlayerData_GetOptionsAddr(FieldSystem_GetSaveData(fieldSystem));
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    OptionsMenu_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static BOOL sub_0203EE54(SaveData *saveData) {
    return Save_VarsFlags_CheckFlagInArray(Save_VarsFlags_Get(saveData), FLAG_UNK_0EF) && Save_VarsFlags_CheckFlagInArray(Save_VarsFlags_Get(saveData), FLAG_UNK_0F0) && Save_VarsFlags_CheckFlagInArray(Save_VarsFlags_Get(saveData), FLAG_UNK_0F1);
}

static void PokeathlonCourseRecord_LaunchApp_Impl(FieldSystem *fieldSystem, PokeathlonCourseRecordArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_PokeathlonCourseRecord = { PokeathlonCourseRecord_Init, PokeathlonCourseRecord_Main, PokeathlonCourseRecord_Exit, FS_OVERLAY_ID(OVY_99) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_PokeathlonCourseRecord, args);
}

PokeathlonCourseRecordArgs *PokeathlonCourseRecord_LaunchApp(FieldSystem *fieldSystem) {
    PokeathlonCourseRecordArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(PokeathlonCourseRecordArgs));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    POKEATHLON_SAV *pokeathlon = Save_Pokeathlon_Get(saveData);
    args->pokeathlon = sub_02031974(pokeathlon);
    args->unk4 = sub_0203EE54(saveData);
    PokeathlonCourseRecord_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void PokeathlonMedals_LaunchApp_Impl(FieldSystem *fieldSystem, PokeathlonMedalsArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_PokeathlonMedals = { PokeathlonMedals_Init, PokeathlonMedals_Main, PokeathlonMedals_Exit, FS_OVERLAY_ID(OVY_99) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_PokeathlonMedals, args);
}

PokeathlonMedalsArgs *PokeathlonMedals_LaunchApp(FieldSystem *fieldSystem) {
    PokeathlonMedalsArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(PokeathlonMedalsArgs));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    POKEATHLON_SAV *pokeathlonSave = Save_Pokeathlon_Get(saveData);
    Pokedex *pokedex = Save_Pokedex_Get(saveData);
    args->pokedex = pokedex;
    args->unk4 = sub_02031978(pokeathlonSave);
    args->natDexEnabled = Pokedex_GetNatDexFlag(pokedex);
    args->unkC = sub_0203EE54(saveData);
    PokeathlonMedals_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void PokeathlonEventRecord_LaunchApp_Impl(FieldSystem *fieldSystem, PokeathlonEventRecordArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_PokeathlonEventRecord = { PokeathlonEventRecord_Init, PokeathlonEventRecord_Main, PokeathlonEventRecord_Exit, FS_OVERLAY_ID(OVY_99) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_PokeathlonEventRecord, args);
}

PokeathlonEventRecordArgs *PokeathlonEventRecord_LaunchApp(FieldSystem *fieldSystem) {
    PokeathlonEventRecordArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(PokeathlonEventRecordArgs));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    POKEATHLON_SAV *pokeathlonSave = Save_Pokeathlon_Get(saveData);
    args->unk0 = sub_0203197C(pokeathlonSave);
    args->unk4 = sub_02031984(pokeathlonSave);
    args->profile = Save_PlayerData_GetProfile(saveData);
    args->unk10 = sub_0203EE54(saveData);
    args->unk8 = sub_02031990(pokeathlonSave);
    PokeathlonEventRecord_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void PokeathlonUnk_LaunchApp_Impl(FieldSystem *fieldSystem, UnkStruct_0203EFA0 *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_PokeathlonUnkApp = { ov99_021E677C, ov99_021E6888, ov99_021E6840, FS_OVERLAY_ID(OVY_99) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_PokeathlonUnkApp, args);
}

UnkStruct_0203EFA0 *PokeathlonUnk_LaunchApp(FieldSystem *fieldSystem) {
    UnkStruct_0203EFA0 *args = AllocFromHeapAtEnd(HEAP_ID_3, sizeof(UnkStruct_0203EFA0));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    PlayerProfile *profile = Save_PlayerData_GetProfile(saveData);
    args->pokeathlon = Save_Pokeathlon_Get(saveData);
    args->profile = profile;
    PokeathlonUnk_LaunchApp_Impl(fieldSystem, args);
    return args;
}

static void sub_0203EFD4(FieldSystem *fieldSystem, UseMailArgs *args) {
    static const OVY_MGR_TEMPLATE _020FA434 = { ov55_UnkApp_Init, ov55_UnkApp_Main, ov55_UnkApp_Exit, FS_OVERLAY_ID(OVY_55) };
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA434, args);
}

UseMailArgs *sub_0203EFEC(FieldSystem *fieldSystem, u16 a1, u8 partyIdx, u8 mailType, HeapID heapId) {
    UseMailArgs *args = sub_02090E68(FieldSystem_GetSaveData(fieldSystem), a1, partyIdx, mailType, HEAP_ID_FIELD);
    sub_0203EFD4(fieldSystem, args);
    return args;
}

UseMailArgs *UseMail_CreateArgs(FieldSystem *fieldSystem, int n, u8 mailId, HeapID heapId) {
    UseMailArgs *args;

    if (n == 3) {
        args = sub_02090F38(FieldSystem_GetSaveData(fieldSystem), mailId, heapId);
    } else {
        args = sub_02090EC0(FieldSystem_GetSaveData(fieldSystem), n, mailId, heapId);
    }
    sub_0203EFD4(fieldSystem, args);
    return args;
}

UseMailArgs *sub_0203F050(FieldSystem *fieldSystem, Pokemon *mon, HeapID heapId) {
    UseMailArgs *args = sub_02090F00(FieldSystem_GetSaveData(fieldSystem), mon, heapId);
    sub_0203EFD4(fieldSystem, args);
    return args;
}

UnkStruct_0203F074 *sub_0203F074(FieldSystem *fieldSystem, HeapID heapId) {
    static const OVY_MGR_TEMPLATE _020FA2F4 = { ov103_021EC940, ov103_021EC988, ov103_021EC9A4, FS_OVERLAY_ID(OVY_103) };
    UnkStruct_0203F074 *args = AllocFromHeap(heapId, sizeof(UnkStruct_0203F074));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->fieldSystem = fieldSystem;
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA2F4, args);
    return args;
}

void sub_0203F0A8(FieldSystem *fieldSystem, UnkOv67Args *args) {
    static const OVY_MGR_TEMPLATE _020FA2E4 = { ov67_021E5900, ov67_021E5984, ov67_021E5968, FS_OVERLAY_ID(OVY_67) };
    OVY_MGR_TEMPLATE template = _020FA2E4;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

static UnkStruct_0203F0D0 *sub_0203F0D0(HeapID heapId, SaveData *saveData, int partyIdx, int *a3, int a4) {
    UnkStruct_0203F0D0 *ptr = AllocFromHeap(heapId, sizeof(UnkStruct_0203F0D0));
    memset(ptr, 0, sizeof(UnkStruct_0203F0D0));
    ptr->mon = Party_GetMonByIndex(SaveArray_Party_Get(saveData), partyIdx);
    SaveFashionData *fashionSave = Save_FashionData_Get(saveData);
    SaveFashionDataSub *var1 = sub_0202B9B8(fashionSave, 0);
    FashionCase *fashionCase = Save_FashionData_GetFashionCase(fashionSave);
    ptr->unk4 = var1;
    ptr->fashionCase = fashionCase;
    ptr->options = Save_PlayerData_GetOptionsAddr(saveData);
    ptr->gameStats = Save_GameStats_Get(saveData);
    ptr->profile = Save_PlayerData_GetProfile(saveData);
    ptr->unk18 = a3;
    ptr->unk1C = a4;
    return ptr;
}

static BOOL sub_0203F134(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    UnkStruct_0203F134 *data = TaskManager_GetEnvironment(taskman);

    switch (data->state) {
    case UNK_0203F134_STATE_0:
        sub_0203F1E8(fieldSystem, data->unkC);
        data->state++;
        break;
    case UNK_0203F134_STATE_1:
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
    UnkStruct_0203F134 *data = AllocFromHeap(HEAP_ID_32, sizeof(UnkStruct_0203F134));
    memset(data, 0, sizeof(UnkStruct_0203F134));
    data->unkC = sub_0203F0D0(HEAP_ID_32, saveData, a3, &data->unk8, a4);
    data->unk4 = ret;
    TaskManager_Call(taskman, sub_0203F134, data);
}

static BOOL sub_0203F1E8(FieldSystem *fieldSystem, UnkStruct_0203F0D0 *args) {
    static OVY_MGR_TEMPLATE _0210F9AC = { ov41_02246DE0, ov41_02246F08, ov41_02247150, FS_OVERLAY_ID(OVY_41) };
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    FieldSystem_LaunchApplication(fieldSystem, &_0210F9AC, args);
    return TRUE;
}

BOOL AccessoryPortrait_LaunchApp(FieldSystem *fieldSystem, FashionAppData *args) {
    static OVY_MGR_TEMPLATE sOverlayTemplate_AccessoryPortrait = { AccessoryPortrait_Init, AccessoryPortrait_Main, AccessoryPortrait_Exit, FS_OVERLAY_ID(OVY_41) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_AccessoryPortrait, args);
    return TRUE;
}

static OVY_MGR_TEMPLATE sOverlayTemplate_WirelessTradeSelectMon = { WirelessTradeSelectMon_Init, WirelessTradeSelectMon_Main, WirelessTradeSelectMon_Exit, FS_OVERLAY_ID(OVY_65) };

static const OVY_MGR_TEMPLATE sOverlayTemplate_TradeSequence = { TradeSequence_Init, TradeSequence_Main, TradeSequence_Exit, FS_OVERLAY_ID(OVY_71) };

static void InitWirelessTradeSelectMonArgs(WirelessTradeSelectMonArgs *args, FieldSystem *fieldSystem) {
    args->profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
    args->party = SaveArray_Party_Get(fieldSystem->saveData);
    args->palPad = SaveArray_Get(fieldSystem->saveData, SAVE_PALPAD);
    args->wifiHistory = Save_WiFiHistory_Get(fieldSystem->saveData);
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

static void WirelessTradeSelectMon_FreeArgs(WirelessTradeSelectMonArgs *args) {
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

static BOOL Task_WirelessTrade(TaskManager *taskman) {
    u32 evolutionCondition;

    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    WirelessTradeData *data = TaskManager_GetEnvironment(taskman);
    switch (data->state) {
    case WIRELESS_TRADE_STATE_0:
        if (!sub_02039998()) {
            CallTask_LeaveOverworld(taskman);
        }
        data->state++;
        break;
    case WIRELESS_TRADE_STATE_1:
        InitWirelessTradeSelectMonArgs(&data->wirelessTradeSelectMon, fieldSystem);
        data->state++;
    case WIRELESS_TRADE_STATE_2:
        CallApplicationAsTask(taskman, &sOverlayTemplate_WirelessTradeSelectMon, &data->wirelessTradeSelectMon);
        data->state++;
        break;
    case WIRELESS_TRADE_STATE_3:
        if (data->wirelessTradeSelectMon.unk24 == 0) {
            WirelessTradeSelectMon_FreeArgs(&data->wirelessTradeSelectMon);
            FreeToHeap(data);
            return TRUE;
        }
        data->state++;
        break;
    case WIRELESS_TRADE_STATE_4:
        data->tradeSequence.partnerProfile = data->wirelessTradeSelectMon.partnerProfile;
        data->tradeSequence.unk0 = Mon_GetBoxMon(data->wirelessTradeSelectMon.unk38);
        data->tradeSequence.unk4 = Mon_GetBoxMon(data->wirelessTradeSelectMon.unk3C);
        data->tradeSequence.options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
        data->tradeSequence.unk10 = 1;

        TIMEOFDAY timeOfDay = Field_GetTimeOfDay(fieldSystem);
        switch (timeOfDay) {
        case RTC_TIMEOFDAY_MORN:
        default:
            data->tradeSequence.bgType = TS_BG_DAY;
            break;
        case RTC_TIMEOFDAY_EVE:
            data->tradeSequence.bgType = TS_BG_EVENING;
            break;
        case RTC_TIMEOFDAY_NITE:
        case RTC_TIMEOFDAY_LATE:
            data->tradeSequence.bgType = TS_BG_NIGHT;
            break;
        }
        if (sub_02039998()) {
            data->tradeSequence.bgType = TS_BG_UNK_3;
        }
        CallApplicationAsTask(taskman, &sOverlayTemplate_TradeSequence, &data->tradeSequence);
        data->state = WIRELESS_TRADE_STATE_5;
        break;
    case WIRELESS_TRADE_STATE_5:
        int heldItem = GetMonData(data->wirelessTradeSelectMon.unk3C, MON_DATA_HELD_ITEM, NULL);
        int species = GetMonEvolution(NULL, data->wirelessTradeSelectMon.unk3C, EVOCTX_TRADE, heldItem, (int *)&evolutionCondition);
        if (species != SPECIES_NONE) {
            CreateHeap(HEAP_ID_3, HEAP_ID_26, 0x30000);
            data->tradeSequence.evolutionTaskData = sub_02075A7C(NULL, data->wirelessTradeSelectMon.unk3C, species, Save_PlayerData_GetOptionsAddr(fieldSystem->saveData), sub_02088288(fieldSystem->saveData), Save_Pokedex_Get(fieldSystem->saveData), Save_Bag_Get(fieldSystem->saveData), Save_GameStats_Get(fieldSystem->saveData), evolutionCondition, 4, HEAP_ID_26);
            data->state = WIRELESS_TRADE_STATE_6;
        } else {
            data->state = WIRELESS_TRADE_STATE_7;
        }
        break;
    case WIRELESS_TRADE_STATE_6:
        if (sub_02075D3C(data->tradeSequence.evolutionTaskData)) {
            CopyPokemonToPokemon(
                data->wirelessTradeSelectMon.unk3C,
                Party_GetMonByIndex(data->wirelessTradeSelectMon.party, data->wirelessTradeSelectMon.unk28));
            sub_02075D4C(data->tradeSequence.evolutionTaskData);
            DestroyHeap(HEAP_ID_26);
            data->state = WIRELESS_TRADE_STATE_7;
        }
        break;
    case WIRELESS_TRADE_STATE_7:
        data->wirelessTradeSelectMon.unk30++;
        data->state = 2;
        GameStats *gameStats = Save_GameStats_Get(fieldSystem->saveData);
        GameStats_AddScore(gameStats, SCORE_EVENT_16);
        if (sub_02039998()) {
            GameStats_Inc(gameStats, GAME_STAT_UNK114);
        }
        break;
    }
    return FALSE;
}

void CallTask_WirelessTrade(TaskManager *taskman) {
    WirelessTradeData *data = AllocFromHeap(HEAP_ID_32, sizeof(WirelessTradeData));
    data->state = 0;
    TaskManager_Call(taskman, Task_WirelessTrade, data);
}

static const OVY_MGR_TEMPLATE _020FA2C4 = { ov37_021E5900, ov37_021E5A84, ov37_021E5B94, FS_OVERLAY_ID(OVY_37) };
static const OVY_MGR_TEMPLATE _020FA2B4 = { ov73_021E5900, ov73_021E5AB8, ov73_021E5BAC, FS_OVERLAY_ID(OVY_73) };

void sub_0203F4C8(FieldSystem *fieldSystem) {
    UnkStruct_0203F4C8 *args = AllocFromHeap(HEAP_ID_32, sizeof(UnkStruct_0203F4C8));
    args->unk0 = fieldSystem->unk84;
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    FieldSystem_LaunchApplication(fieldSystem, &_020FA2C4, args);
}

UnkStruct_0203F4F8 *sub_0203F4F8(FieldSystem *fieldSystem) {
    UnkStruct_0203F4F8 *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0203F4F8));
    args->saveData = fieldSystem->saveData;
    args->unk4 = fieldSystem->unk84;
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->gameStats = Save_GameStats_Get(fieldSystem->saveData);
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    FieldSystem_LaunchApplication(fieldSystem, &_020FA2B4, args);
    return args;
}

static const OVY_MGR_TEMPLATE sOverlayTemplate_PalPad = { PalPad_Init, PalPad_Main, PalPad_Exit, FS_OVERLAY_ID(OVY_43) };

PalPadArgs *PalPad_LaunchApp(FieldSystem *fieldSystem, SaveData *saveData, HeapID heapId) {
    PalPadArgs *args = AllocFromHeap(heapId, sizeof(PalPadArgs));
    MI_CpuFill8(args, 0, sizeof(PalPadArgs));
    args->saveData = saveData;
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_PalPad, args);
    return args;
}

void sub_0203F570(FieldSystem *fieldSystem, SaveData *args) {
    FieldSystem_LaunchApplication(fieldSystem, &_02102830, fieldSystem);
}

static BOOL Task_NamingScreen(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    NamingScreenData *data = TaskManager_GetEnvironment(taskman);
    switch (data->state) {
    case 0:
        CallTask_LeaveOverworld(taskman);
        data->state++;
        break;
    case 1:
        CallApplicationAsTask(taskman, &gOverlayTemplate_NamingScreen, data->args);
        data->state++;
        break;
    case 2:
        CallTask_RestoreOverworld(taskman);
        data->state++;
        break;
    case 3:
        NamingScreenArgs *args = data->args;
        if (args->kind == 1) {
            if (String_Compare(args->nameInputString, data->unk10) == 0) {
                data->args->noInput = 1;
            }
        } else if (args->kind == 5) {
            u16 *var2 = String_cstr(args->nameInputString);
            SAV_FRIEND_GRP *friendGroup = Save_FriendGroup_Get(fieldSystem->saveData);
            if (sub_0202C88C(friendGroup, var2)) {
                data->args->noInput = 2;
            }
        }
        if (data->args->noInput == 0) {
            SetName(taskman);
        }
        u16 *retVar = data->retVar;
        if (data->retVar != NULL) {
            *retVar = data->args->noInput;
        }
        NamingScreen_DeleteArgs(data->args);
        String_Delete(data->unk10);
        FreeToHeap(data);
        return TRUE;
    }
    return FALSE;
}

static void SetName(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    NamingScreenData *data = TaskManager_GetEnvironment(taskman);
    switch (data->args->kind) {
    case NAME_SCREEN_PLAYER:
        PlayerProfile *profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
        Save_Profile_PlayerName_Set(profile, data->args->nameInputFlat);
        break;
    case NAME_SCREEN_RIVAL:
        SAVE_MISC_DATA *miscData = Save_Misc_Get(fieldSystem->saveData);
        Save_Misc_RivalName_Set(miscData, data->args->nameInputString);
        break;
    case NAME_SCREEN_POKEMON:
        Pokemon *mon;
        if (data->partyIdx == 0xff) {
            BugContest *contest = FieldSystem_BugContest_Get(fieldSystem);
            mon = contest->mon;
        } else {
            mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), data->partyIdx);
        }
        SetMonData(mon, MON_DATA_NICKNAME_FLAT_COMPARE, data->args->nameInputFlat);
        break;
    case NAME_SCREEN_GROUP:
        SAV_FRIEND_GRP *friendGroup = Save_FriendGroup_Get(fieldSystem->saveData);
        sub_0202C7F8(friendGroup, 0, 0, data->args->nameInputString);
        break;
    case NAME_SCREEN_BOX:
    case NAME_SCREEN_UNK4:
    default:
        break;
    }
}

void CallTask_NamingScreen(TaskManager *taskman, NameScreenType type, int species, int maxLen, int partyIdx, const u16 *defaultStr, u16 *retVar) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    NamingScreenData *data = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(NamingScreenData));
    data->state = 0;
    data->partyIdx = partyIdx;
    data->retVar = retVar;
    data->args = NamingScreen_CreateArgs(HEAP_ID_FIELD, type, species, maxLen, Save_PlayerData_GetOptionsAddr(fieldSystem->saveData), &fieldSystem->menuInputState);
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
        data->args->monGender = GetMonData(mon, MON_DATA_GENDER, NULL);
        data->args->monForm = GetMonData(mon, MON_DATA_FORM, NULL);
        if (defaultStr != NULL) {
            CopyU16ArrayToString(data->unk10, defaultStr);
        }
        break;
    case NAME_SCREEN_GROUP:
        CopyU16ArrayToString(data->unk10, defaultStr);
        break;
    default:
        if (defaultStr != NULL) {
            CopyU16ArrayToString(data->args->nameInputString, defaultStr);
        }
        break;
    }
    TaskManager_Call(taskman, Task_NamingScreen, data);
}

void TrainerCard_LaunchApp(FieldSystem *fieldSystem, TrainerCardAppArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_TrainerCard = { TrainerCard_Init, TrainerCard_Main, TrainerCard_Exit, FS_OVERLAY_ID(trainer_card) };
    args->unk66C.menuInputStatePtr = &fieldSystem->menuInputState;
    args->unk66C.saveData = fieldSystem->saveData;
    args->unk66C.gameCleared = CheckGameClearFlag(Save_VarsFlags_Get(fieldSystem->saveData));
    args->unk66C.unk8 = 0;
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_TrainerCard, args);
}

int Pokedex_LaunchApp(FieldSystem *fieldSystem, PokedexArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_Pokedex = { Pokedex_Init, Pokedex_Main, Pokedex_Exit, FS_OVERLAY_ID(OVY_18) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_Pokedex, args);
    return 1;
}

void ChooseStarter_LaunchApp(FieldSystem *fieldSystem, ChooseStarterArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_ChooseStarter = { ChooseStarter_Init, ChooseStarter_Main, ChooseStarter_Exit, FS_OVERLAY_ID(OVY_61) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_ChooseStarter, args);
}

void TrainerCardSignature_LaunchApp(FieldSystem *fieldSystem) {
    Save_TrainerCard_Get(fieldSystem->saveData); // unused

    static const OVY_MGR_TEMPLATE sOverlayTemplate_TrainerCardSignature = { TrainerCardSignature_Init, TrainerCardSignature_Main, TrainerCardSignature_Exit, FS_OVERLAY_ID(trainer_card_signature) };
    OVY_MGR_TEMPLATE template = sOverlayTemplate_TrainerCardSignature;
    FieldSystem_LaunchApplication(fieldSystem, &template, fieldSystem->saveData);
}

void sub_0203F844(FieldSystem *fieldSystem, u16 a1) {
    static const OVY_MGR_TEMPLATE _020FA264 = { ov70_02238430, ov70_022385C0, ov70_022386F4, FS_OVERLAY_ID(OVY_70) };
    OVY_MGR_TEMPLATE template = _020FA264;

    UnkStruct_0203F844 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnkStruct_0203F844));
    args->unk0 = sub_0202DB34(fieldSystem->saveData);
    args->sysInfo = Save_SysInfo_Get(fieldSystem->saveData);
    args->party = (Party *)SaveArray_Get(fieldSystem->saveData, SAVE_PARTY);
    args->pcStorage = SaveArray_PCStorage_Get(fieldSystem->saveData);
    args->pokedex = Save_Pokedex_Get(fieldSystem->saveData);
    args->unk14 = sub_0202C6F4(fieldSystem->saveData);
    args->wifiHistory = Save_WiFiHistory_Get(fieldSystem->saveData);
    args->profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
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

NintendoWifiConnectArgs *NintendoWifiConnection_LaunchApp(FieldSystem *fieldSystem, u16 a1, u16 a2) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_NintendoWifiConnect = { NintendoWfc_Init, NintendoWfc_Main, NintendoWfc_Exit, FS_OVERLAY_ID(OVY_72) };
    OVY_MGR_TEMPLATE template = sOverlayTemplate_NintendoWifiConnect;

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

void LaunchApplication_DeadstrippedFunction(FieldSystem *fieldSystem) {
    static const OVY_MGR_TEMPLATE _020FA444 = { ov73_021E7E4C, ov73_021E7FB8, ov73_021E808C, FS_OVERLAY_ID(OVY_72) };
    FieldSystem_LaunchApplication(fieldSystem, &_020FA444, NULL);
}

static const OVY_MGR_TEMPLATE sOverlayTemplate_GeonetGlobe = { GeonetGlobe_Init, GeonetGlobe_Main, GeonetGlobe_Exit, FS_OVERLAY_ID(OVY_69) };

void GeonetGlobe_LaunchApp(FieldSystem *fieldSystem) {
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_GeonetGlobe, fieldSystem->saveData);
}

void RegisterHallOfFame_LaunchApp(FieldSystem *fieldSystem, RegisterHallOfFameArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_RegisterHallOfFame = { RegisterHallOfFame_Init, RegisterHallOfFame_Main, RegisterHallOfFame_Exit, FS_OVERLAY_ID(OVY_63) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_RegisterHallOfFame, args);
}

HallOfFame *HallOfFameShowcase_LaunchApp(FieldSystem *fieldSystem) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_HallOfFameShowcase = { HallOfFameShowcase_Init, HallOfFameShowcase_Main, HallOfFameShowcase_Exit, FS_OVERLAY_ID(OVY_64) };
    int loadResult;
    HallOfFame *hallOfFame = LoadHallOfFame(fieldSystem->saveData, HEAP_ID_FIELD, &loadResult);
    if (loadResult == 2) {
        FreeToHeap(hallOfFame);
        return NULL;
    }
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_HallOfFameShowcase, hallOfFame);
    return hallOfFame;
}

void Credits_LaunchApp(FieldSystem *fieldSystem, CreditsArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_Credits = { Credits_Init, Credits_Main, Credits_Exit, FS_OVERLAY_ID(credits) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_Credits, args);
}

void MoveRelearner_LaunchApp(FieldSystem *menuInputStatePtr, MoveRelearnerArgs *args) {
    OVY_MGR_TEMPLATE template = { MoveRelearner_Init, MoveRelearner_Main, MoveRelearner_Exit, FS_OVERLAY_ID(OVY_68) };
    args->menuInputStatePtr = &menuInputStatePtr->menuInputState;
    FieldSystem_LaunchApplication(menuInputStatePtr, &template, args);
}

void HatchEggInParty(FieldSystem *fieldSystem) {
    UnkStruct_02091240 data;

    Pokemon *mon = sub_0206CE44(SaveArray_Party_Get(fieldSystem->saveData));
    GF_ASSERT(mon != NULL);

    data.mon = mon;
    data.options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    data.profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
    data.unkC = FieldSystem_GetOverriddenMusicId(fieldSystem, fieldSystem->location->mapId);
    CallTask_HatchEggInParty(fieldSystem->taskman, &data);
}

VoltorbFlipArgs *VoltorbFlip_LaunchApp(FieldSystem *fieldSystem, u32 luck) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_VoltorbFlip = { VoltorbFlip_Init, VoltorbFlip_Main, VoltorbFlip_Exit, FS_OVERLAY_ID(voltorb_flip) };
    VoltorbFlipArgs *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(VoltorbFlipArgs));
    MI_CpuFill8(args, 0, sizeof(VoltorbFlipArgs));
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    args->coins = Save_PlayerData_GetCoinsAddr(saveData);
    args->options = Save_PlayerData_GetOptionsAddr(saveData);
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    args->profile = Save_PlayerData_GetProfile(saveData);
    args->saveData = fieldSystem->saveData;
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_VoltorbFlip, args);
    return args;
}

CertificatesArgs *Certificates_LaunchApp(FieldSystem *fieldSystem, HeapID heapId, u16 certificateId) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_Certificates = { Certificates_Init, Certificates_Main, Certificates_Exit, FS_OVERLAY_ID(certificates_app) };
    CertificatesArgs *args = AllocFromHeap(heapId, sizeof(CertificatesArgs));
    args->certificateId = certificateId;
    args->saveData = fieldSystem->saveData;
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_Certificates, args);
    return args;
}

UnkStruct_0203FAB4 *sub_0203FAB4(FieldSystem *fieldSystem, u8 a1, u8 a2, u16 a3, HeapID heapId) {
    static OVY_MGR_TEMPLATE _0210F9BC = { ov86_021E5900, ov86_021E5A40, ov86_021E5AA4, FS_OVERLAY_ID(OVY_86) };
    UnkStruct_0203FAB4 *args = AllocFromHeap(heapId, sizeof(UnkStruct_0203FAB4));
    args->unk4 = a1;
    args->unk5 = a2;
    args->unk6 = a3;
    args->unk0 = fieldSystem->saveData;
    FieldSystem_LaunchApplication(fieldSystem, &_0210F9BC, args);
    return args;
}

PartyMenuArgs *PartyMenu_LaunchApp_Gracidea(FieldSystem *fieldSystem, HeapID heapId, u16 itemId) {
    PartyMenuArgs *args = AllocFromHeap(heapId, sizeof(PartyMenuArgs));
    memset(args, 0, sizeof(PartyMenuArgs));
    args->party = SaveArray_Party_Get(fieldSystem->saveData);
    args->bag = Save_Bag_Get(fieldSystem->saveData);
    args->mailbox = Save_Mailbox_Get(fieldSystem->saveData);
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unk_10 = sub_020270C4(fieldSystem->saveData);
    args->fieldMoveCheckData = NULL;
    args->unk_25 = 0;
    args->context = PARTY_MENU_CONTEXT_USE_ITEM;
    args->itemId = itemId;
    args->partySlot = 0;
    args->fieldSystem = fieldSystem;
    args->menuInputStatePtr = &fieldSystem->menuInputState;
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, args);
    return args;
}

ScratchOffCardsArgs *ScratchOffCards_LaunchApp(FieldSystem *fieldSystem, HeapID heapId) {
    u32 size;
    u8 *ptr;

    static OVY_MGR_TEMPLATE sOverlayTemplate_ScratchOffCards = { ScratchOffCards_Init, ScratchOffCards_Main, ScratchOffCards_Exit, FS_OVERLAY_ID(OVY_87) };

    ScratchOffCardsArgs *args = AllocFromHeap(heapId, sizeof(ScratchOffCardsArgs));

    ptr = (u8 *)args;
    for (size = sizeof(ScratchOffCardsArgs); size != 0; size--) {
        *ptr++ = 0;
    }
    args->saveData = fieldSystem->saveData;

    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_ScratchOffCards, args);
    return args;
}

PokemonSummaryArgs *PokemonSummary_LaunchApp(HeapID heapId, FieldSystem *fieldSystem, u16 partySlot, u16 moveToLearn) {
    PokemonSummaryArgs *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(PokemonSummaryArgs));
    args->party = SaveArray_Party_Get(fieldSystem->saveData);
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->unk11 = 1;
    args->partySlot = partySlot;
    args->partyCount = Party_GetCount(args->party);
    args->moveToLearn = MOVE_NONE;
    args->unk12 = 0;
    args->ribbons = Save_SpecialRibbons_Get(fieldSystem->saveData);
    args->natDexEnabled = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
    args->unk2C = 0;
    args->unk28 = 0;
    args->isFlag982Set = sub_0208828C(fieldSystem->saveData);
    sub_02089D40(args, _020FA0B0);

    sub_0208AD34(args, Save_PlayerData_GetProfile(fieldSystem->saveData));
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PokemonSummary, args);
    return args;
}

void sub_0203FC14(FieldSystem *fieldSystem, u16 a1, u16 a2) {
    static const OVY_MGR_TEMPLATE _020FA1C4 = { sub_020192D0, sub_0201935C, sub_02019490, FS_OVERLAY_ID(OVY_39) };
    OVY_MGR_TEMPLATE template = _020FA1C4;

    UnkStruct_0203FC14 *args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnkStruct_0203FC14));
    MI_CpuFill8(args, 0, sizeof(UnkStruct_0203FC14));
    args->fieldSystem = fieldSystem;
    args->saveData = fieldSystem->saveData;
    args->unk8 = a1;
    args->unkC = a2;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

void PokeathlonCourse_LaunchApp(FieldSystem *fieldSystem, PokeathlonCourseArgs *args) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_PokeathlonCourse = { PokeathlonCourse_Init, PokeathlonCourse_Main, PokeathlonCourse_Exit, FS_OVERLAY_ID(OVY_96) };
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_PokeathlonCourse, args);
}

void sub_0203FC68(FieldSystem *fieldSystem, void *args) {
    static const OVY_MGR_TEMPLATE _020FA454 = { ov104_021E5900, ov104_021E59E4, ov104_021E5B14, FS_OVERLAY_ID(OVY_104) };
    OVY_MGR_TEMPLATE template = _020FA454;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

void sub_0203FC90(FieldSystem *fieldSystem, void *args) {
    static const OVY_MGR_TEMPLATE _020FA1D4 = { ov105_021E5900, ov105_021E59DC, ov105_021E5B14, FS_OVERLAY_ID(OVY_105) };
    OVY_MGR_TEMPLATE template = _020FA1D4;
    FieldSystem_LaunchApplication(fieldSystem, &template, args);
}

LegendaryCinematicArgs *LegendaryCinematic_LaunchApp(FieldSystem *fieldSystem, UnkStruct_0203FCC4 *a1, u16 a2, u16 a3, HeapID heapId) {
    static const OVY_MGR_TEMPLATE sOverlayTemplate_LegendaryCinematic = { LegendaryCinematic_Init, LegendaryCinematic_Main, LegendaryCinematic_Exit, FS_OVERLAY_ID(OVY_106) };
    LegendaryCinematicArgs *args = AllocFromHeap(heapId, sizeof(LegendaryCinematicArgs));
    memset(args, 0, sizeof(LegendaryCinematicArgs));
    args->saveData = FieldSystem_GetSaveData(fieldSystem);
    args->unk4 = *a1;
    args->unk4C = a2;
    args->unk4E = a3;
    FieldSystem_LaunchApplication(fieldSystem, &sOverlayTemplate_LegendaryCinematic, args);
    return args;
}

void LaunchApp_ViewRankings(FieldSystem *fieldSystem, ViewRankingsArgs *args) {
    static const OVY_MGR_TEMPLATE sViewRankingsAppTemplate = { ViewRankingsApp_Init, ViewRankingsApp_Main, ViewRankingsApp_Exit, FS_OVERLAY_ID(view_rankings_app) };
    FieldSystem_LaunchApplication(fieldSystem, &sViewRankingsAppTemplate, args);
}
