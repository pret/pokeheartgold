#ifndef POKEHEARTGOLD_FIELD_LAUNCH_APPLICATION_H
#define POKEHEARTGOLD_FIELD_LAUNCH_APPLICATION_H

#include "alph_puzzle.h"
#include "bag.h"
#include "battle/battle_setup.h"
#include "certificates_app.h"
#include "choose_starter_app.h"
#include "script.h"
#include "overlay_02.h"
#include "overlay_14.h"
#include "overlay_16.h"
#include "overlay_18.h"
#include "overlay_41.h"
#include "overlay_43.h"
#include "overlay_54.h"
#include "overlay_58.h"
#include "overlay_63.h"
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
#include "overlay_trainer_card.h"
#include "bag.h"
#include "mail.h"
#include "mail_misc.h"
#include "fashion_case.h"
#include "field_blackthorn_tutors.h"
#include "pokemon_types_def.h"
#include "save_palpad.h"
#include "save_pokeathlon.h"
#include "save_special_ribbons.h"
#include "sav_system_info.h"
#include "unk_0202CA24.h"
#include "unk_02078E30.h"
#include "unk_02088288.h"
#include "unk_02092BE8.h"
#include "unk_02097B78.h"
#include "credits/credits.h"
#include "voltorb_flip/voltorb_flip.h"

typedef enum NameScreenType {
    NAME_SCREEN_PLAYER,
    NAME_SCREEN_POKEMON,
    NAME_SCREEN_BOX,
    NAME_SCREEN_RIVAL,
    NAME_SCREEN_GROUP = 5,
} NameScreenType;

struct UnkStruct_ScrCmd230 {
    u8 filler_00[0x30];
    u8 unk_30[6];
};

struct UnkStruct_ScrCmd627 {
    void *unk_0;
    Options *options;
    SaveData *saveData;
    void *unk_0C;
    u8 filler_10[0x8];
    u32 mapId;
    void *unk_1C;
    u8 unk_20;
    u8 filler_21[0x7];
};

typedef struct Unk0203E600 {
    u8 unk0[0x14];
    u8 unk14;
    u8 unk15;
    u8 unk16;
} Unk0203E600;

typedef struct Unk0203E8C8 {
    u16 unk0;
    u16 unk2;
} Unk0203E8C8;

static inline void InitUnkStructScrCmd408(UnkStruct_ScrCmd408 *data, u16 a1, u16 a2, ScriptContext *ctx) {
    MI_CpuClear8(data, sizeof(UnkStruct_ScrCmd408));
    data->unk_4 = a1;
    data->unk_6 = a2;
    data->saveData = ctx->fieldSystem->saveData;
}

static inline PCBoxArgs *PCBoxAppData_New(ScriptContext *ctx) {
    PCBoxArgs *ret = AllocFromHeap(HEAP_ID_FIELD, sizeof(PCBoxArgs));
    ret->saveData = ctx->fieldSystem->saveData;
    ret->unk8 = ScriptReadByte(ctx);
    ret->fieldSystemUnk10C = &ctx->fieldSystem->unk_10C;
    return ret;
}

UseMailArgs *CreateUseMailWork(FieldSystem *fieldSystem, int kind, u8 mailId, HeapID heapId);
ApricornBoxArgs *LaunchApricornBoxApp(FieldSystem *fieldSystem, int a1);
PalPadArgs *LaunchPalPadApp(FieldSystem *fieldSystem, SaveData *saveData, HeapID heapId);
BerryPotsArgs *LaunchBerryPotsApp(FieldSystem *fieldSystem);
UnownReportArgs *LaunchUnownReportApp(FieldSystem *fieldSystem);
PartyMenuArgs *LaunchPartyMenuApp_Gracidea(FieldSystem *fieldSystem, HeapID heapId, u16 itemId);
PartyMenuArgs *LaunchPartyMenuApp_Unk2(HeapID heapId, FieldSystem *fieldSystem); //todo: party select screen
PartyMenuArgs *LaunchPartyMenuApp_Unk3(HeapID heapId, FieldSystem *fieldSystem); //todo: party trade screen
PartyMenuArgs *SelectPartyMonAndLearnMove(TaskManager *taskManager, HeapID heapId); //todo: union party select screen
int sub_0203E5C8(struct PartyMenuArgs *partyWork);
int sub_0203E5F8(struct PartyMenuArgs *partyWork);
void sub_0203F570(FieldSystem *fieldSystem, SaveData *saveData);
SafariDecorationArgs* LaunchSafariDecorationApp(FieldSystem *fieldSystem);
void LaunchGeonetGlobeApp(FieldSystem *fieldSystem);
void LaunchChooseStarterApp(FieldSystem *fieldSystem, ChooseStarterArgs *args);
u16 sub_0203E864(Unk0203E600 *a0);
u16 sub_0203E600(Unk0203E600 *a0);
PokemonSummaryArgs *LaunchLearnForgetMoveApp(HeapID heapId, FieldSystem *fieldSystem, u8 a2, u16 a3);
ApricornBoxArgs *sub_0203ED80(FieldSystem *fieldSystem, u32 a1, u16 *a2);
BugContestSwapMonArgs *LaunchBugContestSwapMonApp(FieldSystem *fieldSystem, Pokemon *a1, Pokemon *a2, BOOL a3);
PokemonSummaryArgs *LaunchPokemonSummaryApp(HeapID heapId, FieldSystem *fieldSystem, u16 a2, u16 a3);
void sub_0203F198(TaskManager *taskManager, u16 *ret, SaveData *saveData, u16 a3, u16 a4);
BOOL LaunchAccessoryPortraitApp(FieldSystem *fieldSystem, FashionAppData *fashionData);
void sub_0203F0A8(FieldSystem *fieldSystem, UnkStruct_ScrCmd408 *unk);
void LaunchPCBoxApp(FieldSystem *fieldSystem, PCBoxArgs *pcBoxData);
void Task_WirelessTrade(TaskManager *taskManager);
void sub_0203F4C8(FieldSystem *fieldSystem);
Unk0203F4F8 *sub_0203F4F8(FieldSystem *fieldSystem);
HallOfFame *LaunchHallOfFameCongratsApp(FieldSystem *fieldSystem);
void sub_0203F844(FieldSystem *fieldSystem, u16 a1);
BagView *LaunchBagApp_WithPocket(FieldSystem *fieldSystem, u8 pocketType);
int BagView_SelectResult(BagView *a0);
void LaunchMoveRelearnerApp(FieldSystem *fieldSystem, MoveRelearnerArgs *moveRelearner);
BagView *sub_0203E3FC(FieldSystem *a0, TaskManager *a1);
void LaunchBagApp(FieldSystem *a0, BagView *a1);
void _LaunchLearnForgetMoveApp(FieldSystem *a0, PokemonSummaryArgs *a1);
PokemonSummaryArgs *CreatePokemonSummaryArgs(FieldSystem *fieldSystem, HeapID a1, int a2);
PartyMenuArgs *LaunchPartyMenuApp_Unk5(FieldSystem *fieldSystem, int a1);
void LaunchEasyChatApp(FieldSystem *fieldSystem, EasyChatArgs *a1);
void sub_0202D640(SaveData *saveData, int a1, MAIL_MESSAGE *a2);
PokegearArgs *LaunchPokegearTownMapApp(FieldSystem *fieldSystem, int kind);
SafariAreaCustomizerArgs *LaunchSafariAreaCustomizerApp(FieldSystem *fieldSystem);
PhotoAlbumArgs *LaunchPhotoAlbumApp(FieldSystem *fieldSystem, int a1, int a2);
OptionsMenuArgs *LaunchOptionsMenuApp(FieldSystem *fieldSystem);
UseMailArgs *sub_0203EFEC(FieldSystem *fieldSystem, u16 a1, u8 a2, u8 a3);
UseMailArgs *sub_0203F050(FieldSystem *fieldSystem, Pokemon *mon, HeapID heapId);
void LaunchTrainerCardApp(FieldSystem *a0, TrainerCardAppArgs *a1);
int LaunchPokedexApp(FieldSystem *a0, PokedexArgs *a1);
NintendoWifiConnectArgs *LaunchNintendoWifiConnectionApp(FieldSystem *a0, u16 a1, u16 a2);
void LaunchPokeathlonCourseApp(FieldSystem *fieldSystem, PokeathlonCourseArgs *args);
void sub_0203FC68(FieldSystem *fieldSystem, void *args);
void sub_0203FC90(FieldSystem *fieldSystem, void *args);
LegendaryCinematicArgs *LaunchLegendaryCinematicApp(FieldSystem *a0, Unk0203FCC4 *a1, u16 a2, u16 a3, HeapID a4);
void sub_0203FD08(FieldSystem *fieldSystem, void *args);
PartyMenuArgs *LaunchPartyMenuApp_Unk1(FieldSystem *fieldSystem, int a1, u8 a2);
void Task_NamingScreen(TaskManager *taskManager, NameScreenType type, int species, int maxLen, int initPos, const u16 *defaultStr, u16 *retVar);
void sub_0203E960(TaskManager *a0, int a1, Unk0203E8C8 *a2, u16 *a3, u16 *a4);
void LaunchTrainerCardSignatureApp(FieldSystem *fieldSystem);
void HatchEggInParty(FieldSystem *fieldSystem);
Unk0203F074 *sub_0203F074(FieldSystem *fieldSystem, HeapID heapId);
CertificatesArgs *LaunchCertificatesApp(FieldSystem *fieldSystem, HeapID heapId, u16 certificateId);
PartyMenuArgs *LaunchPartyMenuApp_Unk4(HeapID heapId, FieldSystem *fieldSystem, u16 a2);
Unk0203FAB4 *sub_0203FAB4(FieldSystem *fieldSystem, u8 a1, u8 a2, u16 a3, HeapID heapId);
ScratchOffCardsArgs *LaunchScratchOffCardsApp(FieldSystem *fieldSystem, HeapID heapId);
void sub_0203FC14(FieldSystem *fieldSystem, u16 a1, u16 a2);
PokegearArgs *LaunchPokegearPhoneApp(FieldSystem *fieldSystem);
PokeathlonMedalsArgs *LaunchPokeathlonMedalsApp(FieldSystem *fieldSystem);
PokeathlonEventRecordArgs *LaunchPokeathlonEventRecordApp(FieldSystem *fieldSystem);
Unk0203EFA0 *LaunchPokeathlonUnkApp(FieldSystem *fieldSystem);
PokeathlonCourseRecordArgs *LaunchPokeathlonCourseRecordApp(FieldSystem *fieldSystem);
AlphPuzzleArgs *FieldSystem_CreateApplication_AlphPuzzle(FieldSystem *fieldSystem, u8 puzzle);
void LaunchHOFCongratsApp(FieldSystem *fieldSystem, HOFCongratsArgs *args);
void LaunchCreditsApp(FieldSystem *fieldSystem, CreditsArgs *args);
void LaunchBattleApp(FieldSystem *fieldSystem, BattleSetup *battleSetup);
VoltorbFlipArgs *LaunchVoltorbFlipApp(FieldSystem *fieldSystem, u32 luck);

BOOL Battle_OvyInit(OVY_MANAGER *man, int *state);
BOOL Battle_OvyExec(OVY_MANAGER *man, int *state);
BOOL Battle_OvyExit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_FIELD_LAUNCH_APPLICATION_H
