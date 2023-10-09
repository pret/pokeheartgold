#ifndef POKEHEARTGOLD_UNK_0203E348_H
#define POKEHEARTGOLD_UNK_0203E348_H

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

struct UnownReportWork;

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

typedef struct PartyMenuAppData {
    Party *party;
    Bag *bag;
    MAILBOX *mailbox;
    Options *options;
    u8 filler_10[0x4];
    int unk_14;
    int unk_18;
    FieldSystem *fieldSystem;
    void *fieldSystem_unk_10C;
    u8 unk_24;
    u8 unk_25;
    u8 unk_26;
    u8 filler_27;
    u8 filler_28[0x8];
    u8 unk_30[3];
    u8 filler_33[3];
    u8 unk_36_0:4;
    u8 unk_36_4:4;
    u8 unk_37;
    u8 filler_38[0xC];
} PartyMenuAppData;

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

typedef struct PCBoxAppData {
    SaveData *saveData;
    void *fieldSystemUnk10C;
    int unk8;
} PCBoxAppData;

typedef struct ScratchCardAppData {
    SaveData *saveData;
    u8 filler_04[4];
    u16 unk_08[3];
    u16 unk_0E[3];
    u8 filler_14[4];
} ScratchCardAppData;

typedef struct UnkStruct_0203EDDC {
    Pokemon *unk00;
    Pokemon *unk04;
    BOOL unk08;
    Options *options;
    Pokemon *unk10;
} UnkStruct_0203EDDC;

typedef struct CertificatesApp_Args {
    SaveData *saveData;
    u32 certificateId;
} CertificatesApp_Args;

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

typedef struct Unk0203E694 {
    Party *unk0;
    Options *unk4;
    u8 unk8[0x8];
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
    u8 unk14;
    u8 unk15[0x3];
    u16 unk18;
    u8 unk1A[0x2];
    BOOL unk1C;
    SaveSpecialRibbons *unk20;
    u8 unk24[0x4];
    int unk28;
    int unk2C;
    u32 *unk30;
    BOOL unk34;
    u8 unk38[0x4];
} Unk0203E694;

typedef struct Unk0203E604 {
    HeapID unk0;
    Unk0203E644 *unk4;
    Unk0203E694 *unk8;
} Unk0203E604;

typedef struct Unk0203E8C8 {
    u16 unk0;
    u16 unk2;
} Unk0203E8C8;

typedef struct Unk0203EB08 {
    SaveData *saveData;
    u32 *unk4;
    u8 unk8[0x1c];
} Unk0203EB08;

typedef struct Unk0203EC04 {
    u8 unk0[0x2];
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6[0x2];
    u32 *unk8;
    SaveData *unkC;
} Unk0203EC04;

typedef struct UnownReportWork {
    u32 *unk0;
    SaveData *unk4;
} UnownReportWork;

typedef struct ApricornBoxWork {
    u8 unk0;
    u8 unk1[0x7];
    u16 *unk8;
    u32 unkC;
    u32 unk10;
    u32 *unk14;
    SaveData *unk18;
} ApricornBoxWork;

typedef struct Unk0203EE24 {
    u8 unk0[0x4];
    Options *unk4;
    u32 *unk8;
} Unk0203EE24;

typedef struct Unk0203EEA0 {
    POKEATHLON_SAV *unk0;
    BOOL unk4;
} Unk0203EEA0;

typedef struct Unk0203EEE4 {
    Pokedex *unk0;
    void *unk4;
    BOOL unk8;
    BOOL unkC;
} Unk0203EEE4;

typedef struct Unk0203EF40 {
    void *unk0;
    void *unk4;
    void *unk8;
    PlayerProfile *unkC;
    BOOL unk10;
} Unk0203EF40;

typedef struct Unk0203EFA0 {
    POKEATHLON_SAV *unk0;
    PlayerProfile *unk4;
} Unk0203EFA0;

typedef struct Unk0203F074 {
    SaveData *unk0;
    FieldSystem *unk4;
    u32 *unk8;
} Unk0203F074;

typedef struct Unk0203F0D0 {
    Pokemon *unk0;
    SaveFashionDataSub *unk4;
    FashionCase *unk8;
    Options *unkC;
    GAME_STATS *unk10;
    PlayerProfile *unk14;
    int *unk18;
    int unk1C;
    u8 unk20[0x4];
} Unk0203F0D0;

typedef struct Unk0203F4F8 {
    SaveData *unk0;
    struct UnkStruct_0205AC88 *unk4;
    Options *unk8;
    GAME_STATS *unkC;
    u32 *unk10;
} Unk0203F4F8;

typedef struct PalPadWork {
    SaveData *unk0;
    u32 *unk4;
} PalPadWork;

typedef struct Unk0203F7C2 {
    int *unk0;
    SaveData *unk4;
    int unk8;
    BOOL unkC;
} Unk0203F7C2;

typedef struct Unk0203F7B0 {
    u8 unk0[0x66c];
    Unk0203F7C2 unk66C;
} Unk0203F7B0;

typedef struct Unk0203F8EC {
    FRONTIERDATA *unk0;
    u32 unk4;
    SysInfo *unk8;
    SaveData *unkC;
    Options *unk10;
    void *unk14;
    int unk18;
    void *unk1C;
    int unk20;
    int unk24;
} Unk0203F8EC;

typedef struct Unk0203FAB4 {
    SaveData *unk0;
    u8 unk4;
    u8 unk5;
    u16 unk6;
} Unk0203FAB4;

typedef struct GracideaWork {
    Party *unk0;
    Bag *unk4;
    MAILBOX *unk8;
    Options *unkC;
    UnkStruct_0202E474 *unk10;
    u8 unk14[0x4];
    int unk18;
    FieldSystem *unk1C;
    u32 *unk20;
    u8 unk24;
    u8 unk25;
    u8 unk26;
    u8 unk27;
    u16 unk28;
    u8 unk2A[0x1A];
} GracideaWork;

typedef struct Unk0203FC14 {
    FieldSystem *unk0;
    SaveData *unk4;
    int unk8;
    u8 unkC;
} Unk0203FC14;

typedef struct Unk0203FCC4 {
    int unk0[0x12];
} Unk0203FCC4;

typedef struct Unk0203FCB8 {
    SaveData *unk0;
    Unk0203FCC4 unk4;
    u16 unk4C;
    u16 unk4E;
} Unk0203FCB8;

UseMailWork *CreateUseMailWork(FieldSystem *fieldSystem, int kind, u8 mailId, HeapID heapId);
ApricornBoxWork *CreateApricornBoxWork(FieldSystem *fieldSystem, int a1);
PalPadWork *CreatePalPadWork(FieldSystem *fieldSystem, SaveData *saveData, HeapID heapId);
BerryPotsArgs *BerryPotsArgs_New(FieldSystem *fieldSystem);
UnownReportWork *CreateUnownReportWork(FieldSystem *fieldSystem);
GracideaWork *sub_0203FAE8(FieldSystem *fieldSystem, HeapID heapId, u16 itemId);
PartyMenuAppData *sub_0203E580(HeapID heapId, FieldSystem *fieldSystem); //todo: party select screen
PartyMenuAppData *sub_0203E5A4(HeapID heapId, FieldSystem *fieldSystem); //todo: party trade screen
PartyMenuAppData *sub_0203E6D4(TaskManager *taskManager, HeapID heapId); //todo: union party select screen
int sub_0203E5C8(struct PartyMenuAppData *partyWork);
int sub_0203E5F8(struct PartyMenuAppData *partyWork);
void sub_0203F570(FieldSystem *fieldSystem, SaveData *saveData);
UnkStruct_Ov02_0224E4EC* sub_0203EB64(FieldSystem *fieldSystem);
void sub_0203F964(FieldSystem *fieldSystem);
void LaunchChooseStarterApp(FieldSystem *fieldSystem, ChooseStarterAppArgs *args);
void Save_CurrentLocation_BackUp(SaveData *saveData);
u16 sub_0203E864(Unk0203E600 *a0);
u16 sub_0203E600(Unk0203E600 *a0);
Unk0203E694 *sub_0203E7F4(HeapID heapId, FieldSystem *fieldSystem, u8 a2, u16 a3);
ApricornBoxWork *sub_0203ED80(FieldSystem *fieldSystem, u32 a1, u16 *a2);
UnkStruct_0203EDDC *sub_0203EDDC(FieldSystem *fieldSystem, Pokemon *a1, Pokemon *a2, BOOL a3);
Unk0203E694 *sub_0203FB94(HeapID heapId, FieldSystem *fieldSystem, u16 a2, u16 a3);
void sub_0203F198(TaskManager *taskManager, u16 *ret, SaveData *saveData, u16 a3, u16 a4);
BOOL sub_0203F204(FieldSystem *fieldSystem, FashionAppData *fashionData);
void sub_0203F0A8(FieldSystem *fieldSystem, UnkStruct_ScrCmd408 *unk);
void sub_0203E868(FieldSystem *fieldSystem, PCBoxAppData *pcBoxData);
void sub_0203F4A8(TaskManager *taskManager);
void sub_0203F4C8(FieldSystem *fieldSystem);
Unk0203F4F8 *sub_0203F4F8(FieldSystem *fieldSystem);
HALL_OF_FAME *sub_0203F984(FieldSystem *fieldSystem);
void sub_0203F844(FieldSystem *fieldSystem, u16 a1);
BagView *sub_0203E460(FieldSystem *fieldSystem, u8 a1);
int sub_0203E4CC(BagView *a0);
void sub_0203F9C4(FieldSystem *fieldSystem, MoveRelearnerAppArgs *moveRelearner);
BagView *sub_0203E3FC(FieldSystem *a0, TaskManager *a1);
void sub_0203E3D4(FieldSystem *a0, BagView *a1);
void sub_0203E4EC(FieldSystem *a0, void *a1);
Unk0203E694 *sub_0203E76C(FieldSystem *fieldSystem, HeapID a1, int a2);
PartyMenuAppData *sub_0203E740(FieldSystem *fieldSystem, int a1);
void sub_0203EA24(FieldSystem *fieldSystem, Unk02090C94 *a1);
void sub_0202D640(SaveData *saveData, int a1, MAIL_MESSAGE *a2);
Unk_PokegearSTRUCT_2C *TownMap_New(FieldSystem *fieldSystem, int kind);
Unk0203EB08 *sub_0203EB08(FieldSystem *fieldSystem);
Unk0203EC04 *sub_0203EBA4(FieldSystem *fieldSystem, int a1, int a2);
Unk0203EE24 *sub_0203EE24(FieldSystem *fieldSystem);
UseMailWork *sub_0203EFEC(FieldSystem *fieldSystem, u16 a1, u8 a2, u8 a3);
UseMailWork *sub_0203F050(FieldSystem *fieldSystem, Pokemon *mon, HeapID heapId);
void sub_0203F7B0(FieldSystem *a0, Unk0203F7B0 *a1);
int sub_0203F7F4(FieldSystem *a0, void *a1);
Unk0203F8EC *sub_0203F8EC(FieldSystem *a0, u16 a1, u16 a2);
void FieldSystem_LaunchPokeathlonCourseApplication(FieldSystem *fieldSystem, void *args);
void sub_0203FC68(FieldSystem *fieldSystem, void *args);
void sub_0203FC90(FieldSystem *fieldSystem, void *args);
Unk0203FCB8 *sub_0203FCB8(FieldSystem *a0, Unk0203FCC4 *a1, u16 a2, u16 a3, HeapID a4);
void sub_0203FD08(FieldSystem *fieldSystem, void *args);
PartyMenuAppData *sub_0203E550(FieldSystem *fieldSystem, int a1, u8 a2);

static inline void InitUnkStructScrCmd408(UnkStruct_ScrCmd408 *data, u16 a1, u16 a2, ScriptContext *ctx) {
    MI_CpuClear8(data, sizeof(UnkStruct_ScrCmd408));
    data->unk_4 = a1;
    data->unk_6 = a2;
    data->saveData = ctx->fieldSystem->saveData;
}

static inline PCBoxAppData *PCBoxAppData_New(ScriptContext *ctx) {
    PCBoxAppData *ret = AllocFromHeap(HEAP_ID_FIELD, sizeof(PCBoxAppData));
    ret->saveData = ctx->fieldSystem->saveData;
    ret->unk8 = ScriptReadByte(ctx);
    ret->fieldSystemUnk10C = &ctx->fieldSystem->unk_10C;
    return ret;
}

//todo convert these to an enum
#define NAMINGSCREEN_PLAYER             0
#define NAMINGSCREEN_POKEMON            1
#define NAMINGSCREEN_BOX                2
#define NAMINGSCREEN_RIVAL              3
#define NAMINGSCREEN_GROUP              5

void CreateNamingScreen(TaskManager *taskManager, int kind, int param, int maxLen, int initPos, const u16 *defaultStr, u16 *retVar);
void sub_0203E960(TaskManager *a0, int a1, Unk0203E8C8 *a2, u16 *a3, u16 *a4);
void sub_0203F818(FieldSystem *fieldSystem);
void HatchEggInParty(FieldSystem *fieldSystem);
Unk0203F074 *sub_0203F074(FieldSystem *fieldSystem, HeapID heapId);
CertificatesApp_Args *LaunchCertificatesApp(FieldSystem *fieldSystem, HeapID heapId, u16 certificateId);
PartyMenuAppData *sub_0203E5D0(HeapID heapId, FieldSystem *fieldSystem, u16 a2);
Unk0203FAB4 *sub_0203FAB4(FieldSystem *fieldSystem, u8 a1, u8 a2, u16 a3, HeapID heapId);
ScratchCardAppData *ScratchOffCards_Create(FieldSystem *fieldSystem, HeapID heapId);
void sub_0203FC14(FieldSystem *fieldSystem, u16 a1, u16 a2);
Unk_PokegearSTRUCT_2C *PhoneUI_New(FieldSystem *fieldSystem);
Unk0203EEE4 *sub_0203EEE4(FieldSystem *fieldSystem);
Unk0203EF40 *sub_0203EF40(FieldSystem *fieldSystem);
Unk0203EFA0 *sub_0203EFA0(FieldSystem *fieldSystem);
Unk0203EEA0 *sub_0203EEA0(FieldSystem *fieldSystem);
Unk0203EC04 *FieldSystem_CreateApplication_AlphPuzzle(FieldSystem *fieldSystem, u8 puzzle);
void LaunchHOFCongratsApp(FieldSystem *fieldSystem, HOFCongratsAppArgs *args);
void LaunchCreditsApp(FieldSystem *fieldSystem, CreditsAppArgs *args);
void LocationData_BackUp(Location *data);
void LocationData_Restore(Location *data);
void sub_0203E3C4(FieldSystem *fieldSystem, BattleSetup *battleSetup);
VoltorbFlipAppArgs *LaunchVoltorbFlipApp(FieldSystem *fieldSystem, u32 luck);

BOOL sub_0203E3A8(OVY_MANAGER *man, int *state);
BOOL sub_0203E3AC(OVY_MANAGER *man, int *state);
BOOL sub_0203E3C0(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_UNK_0203E348_H
