#ifndef POKEHEARTGOLD_FIELD_LAUNCH_APPLICATION_H
#define POKEHEARTGOLD_FIELD_LAUNCH_APPLICATION_H

#include "bag.h"
#include "battle/battle_setup.h"
#include "script.h"
#include "overlay_02.h"
#include "overlay_63.h"
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
#include "unk_02092BE8.h"
#include "credits/credits.h"
#include "voltorb_flip/voltorb_flip.h"

typedef struct BerryPotsArgs {
    void *unk0;
    u32 *unk4;
    BagCursor *cursor;
    SaveData *saveData;
} BerryPotsArgs;

typedef struct BerryPotsAppArgs_UnkSub4 {
    u8 unk0[4];
    u32 *unk4;
    u8 unk8[4];
    SaveData *savedata;
} BerryPotsAppArgs_UnkSub4;

typedef struct BerryPotsAppArgs {
    u8 unk0[4];
    BerryPotsAppArgs_UnkSub4 *unk4;
    u8 unk8[0xC];
    u8 unk14;
    u8 unk15;
    u16 itemId;
} BerryPotsAppArgs;

typedef struct PartyMenuArgs {
    Party *party;
    Bag *bag;
    MAILBOX *mailbox;
    Options *options;
    UnkStruct_0202E474 *unk10;
    int unk_14;
    int unk_18;
    FieldSystem *fieldSystem;
    u32 *unk20;
    u8 unk_24;
    u8 unk_25;
    u8 unk_26;
    u8 unk_27;
    u16 unk28;
    u8 unk2A[0x6];
    u8 unk_30[3];
    u8 filler_33[3];
    u8 unk_36_0:4;
    u8 unk_36_4:4;
    u8 unk_37;
    u8 filler_38[0xC];
} PartyMenuArgs;

typedef struct ChooseStarterAppArgs {
    int cursorPos;
    Options *options;
    Pokemon starters[3];
} ChooseStarterAppArgs;

typedef struct FashionAppData {
    SaveFashionData *saveFashionData;
    int unk_4;
    int unk_8;
} FashionAppData;

typedef struct UnkStruct_ScrCmd408 {
    SaveData *saveData;
    u16 unk_4;
    u16 unk_6;
} UnkStruct_ScrCmd408;

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

typedef struct PCBoxArgs {
    SaveData *saveData;
    void *fieldSystemUnk10C;
    int unk8;
} PCBoxArgs;

typedef struct ScratchOffCardsArgs {
    SaveData *saveData;
    u8 filler_04[4];
    u16 unk_08[3];
    u16 unk_0E[3];
    u8 filler_14[4];
} ScratchOffCardsArgs;

typedef struct BugContestSwapMonArgs {
    Pokemon *newlyCaughtMon;
    Pokemon *currentMon;
    BOOL noPokemonCaught;
    Options *options;
    Pokemon *unk10;
} BugContestSwapMonArgs;

typedef struct CertificatesArgs {
    SaveData *saveData;
    u32 certificateId;
} CertificatesArgs;

typedef struct Unk0203E600 {
    u8 unk0[0x14];
    u8 unk14;
    u8 unk15;
    u8 unk16;
} Unk0203E600;

typedef struct Unk0203E644 {
    u8 unk0[0x26];
    u8 unk26;
} Unk0203E644;

typedef struct PokemonSummaryArgs {
    Party *party;
    Options *options;
    u8 unk8[0x8];
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 partyCount;
    u8 unk14;
    u8 unk15[0x3];
    u16 unk18;
    u8 unk1A[0x2];
    BOOL natDexEnabled;
    SaveSpecialRibbons *ribbons;
    u8 unk24[0x4];
    int unk28;
    int unk2C;
    u32 *unk30;
    BOOL unk34;
    u8 unk38[0x4];
} PokemonSummaryArgs;

typedef struct Unk0203E604 {
    HeapID unk0;
    Unk0203E644 *unk4;
    PokemonSummaryArgs *pokemonSummary;
} Unk0203E604;

typedef struct Unk0203E8C8 {
    u16 unk0;
    u16 unk2;
} Unk0203E8C8;

typedef struct SafariAreaCustomizerArgs {
    SaveData *saveData;
    u32 *unk4;
    u8 unk8[0x1c];
} SafariAreaCustomizerArgs;

typedef struct PhotoAlbumArgs {
    u8 unk0[0x2];
    u8 unk2;
    u8 unk3[0x2];
    u8 unk5;
    u8 unk6[0x2];
    u32 *unk8;
    SaveData *saveData;
} PhotoAlbumArgs;

typedef struct AlphPuzzleArgs {
    u8 unk0[0x5];
    u8 puzzle;
    u8 unk6[0x2];
    u32 *unk8;
    SaveData *saveData;
} AlphPuzzleArgs;

typedef struct UnownReportArgs {
    u32 *unk0;
    SaveData *saveData;
} UnownReportArgs;

typedef struct ApricornBoxArgs {
    u8 unk0;
    u8 unk1[0x7];
    u16 *unk8;
    u32 unkC;
    u32 unk10;
    u32 *unk14;
    SaveData *saveData;
} ApricornBoxArgs;

typedef struct OptionsMenuArgs {
    u8 unk0[0x4];
    Options *options;
    u32 *unk8;
} OptionsMenuArgs;

typedef struct PokeathlonCourseRecordArgs {
    POKEATHLON_SAV *pokeathlon;
    BOOL unk4;
} PokeathlonCourseRecordArgs;

typedef struct PokeathlonMedalsArgs {
    Pokedex *pokedex;
    void *unk4;
    BOOL natDexEnabled;
    BOOL unkC;
} PokeathlonMedalsArgs;

typedef struct PokeathlonRecordsArgs {
    void *unk0;
    void *unk4;
    void *unk8;
    PlayerProfile *profile;
    BOOL unk10;
} PokeathlonRecordsArgs;

typedef struct Unk0203EFA0 {
    POKEATHLON_SAV *pokeathlon;
    PlayerProfile *profile;
} Unk0203EFA0;

typedef struct Unk0203F074 {
    SaveData *saveData;
    FieldSystem *fieldSystem;
    u32 *unk8;
} Unk0203F074;

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

typedef struct Unk0203F4F8 {
    SaveData *saveData;
    struct UnkStruct_0205AC88 *unk4;
    Options *options;
    GAME_STATS *gameStats;
    u32 *unk10;
} Unk0203F4F8;

typedef struct PalPadArgs {
    SaveData *saveData;
    u32 *unk4;
} PalPadArgs;

typedef struct Unk0203F7C2 {
    int *unk0;
    SaveData *saveData;
    int unk8;
    BOOL gameCleared;
} Unk0203F7C2;

typedef struct TrainerCardAppArgs {
    u8 unk0[0x66c];
    Unk0203F7C2 unk66C;
} TrainerCardAppArgs;

typedef struct NintendoWifiConnectArgs {
    FRONTIERDATA *frontierData;
    u32 unk4;
    SysInfo *sysInfo;
    SaveData *saveData;
    Options *options;
    void *unk14;
    int unk18;
    void *unk1C;
    int unk20;
    int unk24;
} NintendoWifiConnectArgs;

typedef struct Unk0203FAB4 {
    SaveData *unk0;
    u8 unk4;
    u8 unk5;
    u16 unk6;
} Unk0203FAB4;

typedef struct Unk0203FC14 {
    FieldSystem *fieldSystem;
    SaveData *saveData;
    int unk8;
    u8 unkC;
} Unk0203FC14;

typedef struct Unk0203FCC4 {
    int unk0[0x12];
} Unk0203FCC4;

typedef struct LegendaryCinematicArgs {
    SaveData *saveData;
    Unk0203FCC4 unk4;
    u16 unk4C;
    u16 unk4E;
} LegendaryCinematicArgs;

typedef struct PokedexArgs PokedexArgs;
typedef struct PokeathlonCourseArgs PokeathlonCourseArgs;

UseMailWork *CreateUseMailWork(FieldSystem *fieldSystem, int kind, u8 mailId, HeapID heapId);
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
void LaunchChooseStarterApp(FieldSystem *fieldSystem, ChooseStarterAppArgs *args);
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
HALL_OF_FAME *LaunchHallOfFameCongratsApp(FieldSystem *fieldSystem);
void sub_0203F844(FieldSystem *fieldSystem, u16 a1);
BagView *LaunchBagApp_WithPocket(FieldSystem *fieldSystem, u8 pocketType);
int BagSelectResult(BagView *a0);
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
UseMailWork *sub_0203EFEC(FieldSystem *fieldSystem, u16 a1, u8 a2, u8 a3);
UseMailWork *sub_0203F050(FieldSystem *fieldSystem, Pokemon *mon, HeapID heapId);
void LaunchTrainerCardApp(FieldSystem *a0, TrainerCardAppArgs *a1);
int LaunchPokedexApp(FieldSystem *a0, PokedexArgs *a1);
NintendoWifiConnectArgs *LaunchNintendoWifiConnectionApp(FieldSystem *a0, u16 a1, u16 a2);
void LaunchPokeathlonCourseApp(FieldSystem *fieldSystem, PokeathlonCourseArgs *args);
void sub_0203FC68(FieldSystem *fieldSystem, void *args);
void sub_0203FC90(FieldSystem *fieldSystem, void *args);
LegendaryCinematicArgs *LaunchLegendaryCinematicApp(FieldSystem *a0, Unk0203FCC4 *a1, u16 a2, u16 a3, HeapID a4);
void sub_0203FD08(FieldSystem *fieldSystem, void *args);
PartyMenuArgs *LaunchPartyMenuApp_Unk1(FieldSystem *fieldSystem, int a1, u8 a2);

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

typedef enum NameScreenType {
    NAME_SCREEN_PLAYER,
    NAME_SCREEN_POKEMON,
    NAME_SCREEN_BOX,
    NAME_SCREEN_RIVAL,
    NAME_SCREEN_GROUP = 5,
} NameScreenType;

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
PokeathlonRecordsArgs *LaunchPokeathlonEventRecordApp(FieldSystem *fieldSystem);
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
