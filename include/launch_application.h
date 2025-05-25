#ifndef POKEHEARTGOLD_FIELD_LAUNCH_APPLICATION_H
#define POKEHEARTGOLD_FIELD_LAUNCH_APPLICATION_H

#include "battle/battle_setup.h"
#include "credits/credits.h"
#include "voltorb_flip/voltorb_flip.h"

#include "alph_puzzle.h"
#include "bag.h"
#include "certificates_app.h"
#include "choose_starter_app.h"
#include "fashion_case.h"
#include "mail.h"
#include "mail_misc.h"
#include "move_relearner.h"
#include "overlay_02.h"
#include "overlay_103.h"
#include "overlay_108.h"
#include "overlay_109.h"
#include "overlay_111.h"
#include "overlay_113.h"
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
#include "overlay_trainer_card.h"
#include "party_menu.h"
#include "pokemon_types_def.h"
#include "register_hall_of_fame.h"
#include "sav_system_info.h"
#include "save_palpad.h"
#include "save_pokeathlon.h"
#include "save_special_ribbons.h"
#include "save_wifi_history.h"
#include "script.h"
#include "unk_02088288.h"
#include "unk_02092BE8.h"
#include "unk_02097B78.h"
#include "unk_02097D3C.h"

typedef enum NameScreenType {
    NAME_SCREEN_PLAYER,
    NAME_SCREEN_POKEMON,
    NAME_SCREEN_BOX,
    NAME_SCREEN_RIVAL,
    NAME_SCREEN_UNK4,
    NAME_SCREEN_GROUP,
    NAME_SCREEN_UNK6,
    NAME_SCREEN_UNK7,
} NameScreenType;

typedef enum PocketType {
    POCKET_TYPE_ITEMS,
    POCKET_TYPE_BERRIES,
} PocketType;

struct UnkStruct_ScrCmd230 {
    u8 filler_00[0x30];
    u8 unk_30[6];
};

typedef struct UnkStruct_0203E600 {
    u8 unk0[0x14];
    u8 unk14;
    u8 unk15;
    u8 unk16;
} UnkStruct_0203E600;

typedef struct UnkStruct_0203E8C8 {
    u16 unk0;
    u16 unk2;
} UnkStruct_0203E8C8;

static inline void InitUnkStructScrCmd408(UnkOv67Args *data, u16 a1, u16 a2, ScriptContext *ctx) {
    MI_CpuClear8(data, sizeof(UnkOv67Args));
    data->unk_4 = a1;
    data->unk_6 = a2;
    data->saveData = ctx->fieldSystem->saveData;
}

static inline PCBoxArgs *PCBoxAppData_New(ScriptContext *ctx) {
    PCBoxArgs *ret = AllocFromHeap(HEAP_ID_FIELD, sizeof(PCBoxArgs));
    ret->saveData = ctx->fieldSystem->saveData;
    ret->unk8 = ScriptReadByte(ctx);
    ret->menuInputStatePtr = &ctx->fieldSystem->menuInputState;
    return ret;
}

UseMailArgs *UseMail_CreateArgs(FieldSystem *fieldSystem, int n, u8 mailId, HeapID heapId);
ApricornBoxArgs *ApricornBox_LaunchApp(FieldSystem *fieldSystem, int a1);
PalPadArgs *PalPad_LaunchApp(FieldSystem *fieldSystem, SaveData *saveData, HeapID heapId);
BerryPotsArgs *BerryPots_LaunchApp(FieldSystem *fieldSystem);
UnownReportArgs *UnownReport_LaunchApp(FieldSystem *fieldSystem);
PartyMenuArgs *PartyMenu_LaunchApp_Gracidea(FieldSystem *fieldSystem, HeapID heapId, u16 itemId);
PartyMenuArgs *PartyMenu_LaunchApp_Unk2(HeapID heapId, FieldSystem *fieldSystem);        // todo: party select screen
PartyMenuArgs *PartyMenu_LaunchApp_InGameTrade(HeapID heapId, FieldSystem *fieldSystem); // todo: party trade screen
PartyMenuArgs *SelectPartyMonAndLearnMove(TaskManager *taskManager, HeapID heapId);      // todo: union party select screen
int PartyMenuArgs_GetSlot(struct PartyMenuArgs *partyWork);
int sub_0203E5F8(struct PartyMenuArgs *partyWork);
void sub_0203F570(FieldSystem *fieldSystem, SaveData *saveData);
SafariDecorationArgs *SafariDecoration_LaunchApp(FieldSystem *fieldSystem);
void GeonetGlobe_LaunchApp(FieldSystem *fieldSystem);
void ChooseStarter_LaunchApp(FieldSystem *fieldSystem, ChooseStarterArgs *args);
u16 sub_0203E864(UnkStruct_0203E600 *a0);
u16 sub_0203E600(UnkStruct_0203E600 *a0);
PokemonSummaryArgs *LearnForgetMove_LaunchApp(HeapID heapId, FieldSystem *fieldSystem, u8 partySlot, u16 moveToLearn);
ApricornBoxArgs *sub_0203ED80(FieldSystem *fieldSystem, u32 a1, u16 *a2);
BugContestSwapMonArgs *BugContestSwapMon_LaunchApp(FieldSystem *fieldSystem, Pokemon *a1, Pokemon *a2, BOOL a3);
PokemonSummaryArgs *PokemonSummary_LaunchApp(HeapID heapId, FieldSystem *fieldSystem, u16 partySlot, u16 moveToLearn);
void sub_0203F198(TaskManager *taskManager, u16 *ret, SaveData *saveData, u16 a3, u16 a4);
BOOL AccessoryPortrait_LaunchApp(FieldSystem *fieldSystem, FashionAppData *fashionData);
void sub_0203F0A8(FieldSystem *fieldSystem, UnkOv67Args *unk);
void PCBox_LaunchApp(FieldSystem *fieldSystem, PCBoxArgs *pcBoxData);
void CallTask_WirelessTrade(TaskManager *taskManager);
void sub_0203F4C8(FieldSystem *fieldSystem);
UnkStruct_0203F4F8 *sub_0203F4F8(FieldSystem *fieldSystem);
HallOfFame *HallOfFameShowcase_LaunchApp(FieldSystem *fieldSystem);
void sub_0203F844(FieldSystem *fieldSystem, u16 a1);
BagView *Bag_LaunchApp_WithPocket(FieldSystem *fieldSystem, u8 pocketType);
int BagView_SelectResult(BagView *bagView);
void MoveRelearner_LaunchApp(FieldSystem *fieldSystem, MoveRelearnerArgs *moveRelearner);
BagView *sub_0203E3FC(FieldSystem *fieldSystem, ItemCheckUseData *itemCheckUseData);
void Bag_LaunchApp(FieldSystem *fieldSystem, BagView *bagView);
void PokemonSummary_LearnForget_LaunchApp(FieldSystem *fieldSystem, PokemonSummaryArgs *pokemonSummayArgs);
PokemonSummaryArgs *PokemonSummary_CreateArgs(FieldSystem *fieldSystem, HeapID heapId, int a2);
PartyMenuArgs *TaskManager_LaunchPartyMenu_UnionRoomBattleSelect(TaskManager *taskman, HeapID heapId);
PartyMenuArgs *PartyMenu_LaunchApp_Unk5(FieldSystem *fieldSystem, int partySlot);
void EasyChat_LaunchApp(FieldSystem *fieldSystem, EasyChatArgs *args);
PokegearArgs *PokegearTownMap_LaunchApp(FieldSystem *fieldSystem, int kind);
SafariAreaCustomizerArgs *SafariAreaCustomizer_LaunchApp(FieldSystem *fieldSystem);
PhotoAlbumArgs *PhotoAlbum_LaunchApp(FieldSystem *fieldSystem, int unused, int initialCursorPos);
OptionsMenuArgs *OptionsMenu_LaunchApp(FieldSystem *fieldSystem);
UseMailArgs *sub_0203EFEC(FieldSystem *fieldSystem, u16 a1, u8 partyIdx, u8 mailType, HeapID heapId);
UseMailArgs *sub_0203F050(FieldSystem *fieldSystem, Pokemon *mon, HeapID heapId);
void TrainerCard_LaunchApp(FieldSystem *fieldSystem, TrainerCardAppArgs *a1);
int Pokedex_LaunchApp(FieldSystem *fieldSystem, PokedexArgs *a1);
NintendoWifiConnectArgs *NintendoWifiConnection_LaunchApp(FieldSystem *fieldSystem, u16 a1, u16 a2);
void PokeathlonCourse_LaunchApp(FieldSystem *fieldSystem, PokeathlonCourseArgs *args);
void sub_0203FC68(FieldSystem *fieldSystem, void *args);
void sub_0203FC90(FieldSystem *fieldSystem, void *args);
LegendaryCinematicArgs *LegendaryCinematic_LaunchApp(FieldSystem *a0, UnkStruct_0203FCC4 *a1, u16 a2, u16 a3, HeapID a4);
void LaunchApp_ViewRankings(FieldSystem *fieldSystem, ViewRankingsArgs *args);
PartyMenuArgs *PartyMenu_LaunchApp_Unk1(FieldSystem *fieldSystem, FieldMoveCheckData *fieldMoveCheckData, u8 partySlot);
void CallTask_NamingScreen(TaskManager *taskManager, NameScreenType type, int species, int maxLen, int initPos, const u16 *defaultStr, u16 *retVar);
void sub_0203E960(TaskManager *a0, int a1, UnkStruct_0203E8C8 *a2, u16 *a3, u16 *a4);
void TrainerCardSignature_LaunchApp(FieldSystem *fieldSystem);
void HatchEggInParty(FieldSystem *fieldSystem);
UnkStruct_0203F074 *sub_0203F074(FieldSystem *fieldSystem, HeapID heapId);
CertificatesArgs *Certificates_LaunchApp(FieldSystem *fieldSystem, HeapID heapId, u16 certificateId);
PartyMenuArgs *PartyMenu_LaunchApp_Unk4(HeapID heapId, FieldSystem *fieldSystem, u16 partySlot);
UnkStruct_0203FAB4 *sub_0203FAB4(FieldSystem *fieldSystem, u8 a1, u8 a2, u16 a3, HeapID heapId);
ScratchOffCardsArgs *ScratchOffCards_LaunchApp(FieldSystem *fieldSystem, HeapID heapId);
void sub_0203FC14(FieldSystem *fieldSystem, u16 a1, u16 a2);
PokegearArgs *PokegearPhone_LaunchApp(FieldSystem *fieldSystem);
PokeathlonMedalsArgs *PokeathlonMedals_LaunchApp(FieldSystem *fieldSystem);
PokeathlonEventRecordArgs *PokeathlonEventRecord_LaunchApp(FieldSystem *fieldSystem);
UnkStruct_0203EFA0 *PokeathlonUnk_LaunchApp(FieldSystem *fieldSystem);
PokeathlonCourseRecordArgs *PokeathlonCourseRecord_LaunchApp(FieldSystem *fieldSystem);
AlphPuzzleArgs *AlphPuzzle_LaunchApp(FieldSystem *fieldSystem, u8 puzzle);
void RegisterHallOfFame_LaunchApp(FieldSystem *fieldSystem, RegisterHallOfFameArgs *args);
void Credits_LaunchApp(FieldSystem *fieldSystem, CreditsArgs *args);
void Battle_LaunchApp(FieldSystem *fieldSystem, BattleSetup *battleSetup);
VoltorbFlipArgs *VoltorbFlip_LaunchApp(FieldSystem *fieldSystem, u32 luck);

BOOL Battle_Init(OverlayManager *man, int *state);
BOOL Battle_Main(OverlayManager *man, int *state);
BOOL Battle_Exit(OverlayManager *man, int *state);

void LaunchApplication_DeadstrippedFunction(FieldSystem *fieldSystem);
extern const OverlayManagerTemplate gOverlayTemplate_UnownReport;
extern const OverlayManagerTemplate gOverlayTemplate_Battle;

#endif // POKEHEARTGOLD_FIELD_LAUNCH_APPLICATION_H
