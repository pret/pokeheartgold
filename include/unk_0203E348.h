#ifndef POKEHEARTGOLD_UNK_0203E348_H
#define POKEHEARTGOLD_UNK_0203E348_H

#include "battle/battle_setup.h"
#include "script.h"
#include "overlay_02.h"
#include "overlay_63.h"
#include "bag.h"
#include "mail.h"
#include "fashion_case.h"
#include "field_blackthorn_tutors.h"
#include "credits/credits.h"

struct UseMailWork;
struct ApricornBoxWork;
struct PalPadWork;
struct UnownReportWork;
struct GracideaWork;

typedef struct BerryPotsArgs {
    u8 unk0[4];
    u32 unk4;
    BagCursor *cursor;
    SaveData *saveData;
} BerryPotsArgs;

typedef struct PartyMenuAppData {
    Party *party;
    Bag *bag;
    MAILBOX *mailbox;
    OPTIONS *options;
    u8 filler_10[0xC];
    FieldSystem *fieldSystem;
    void *fieldSystem_unk_10C;
    u8 unk_24;
    u8 unk_25;
    u8 unk_26;
    u8 filler_27[9];
    u8 unk_30[3];
    u8 filler_33[3];
    u8 unk_36_0:4;
    u8 unk_36_4:4;
    u8 unk_37;
    u8 filler_38[0xC];
} PartyMenuAppData;

struct ChooseStarterAppArgs {
    int cursorPos;
    OPTIONS *options;
    Pokemon starters[3];
};

typedef struct FashionAppData {
    SaveFashionData *saveFashionData;
    int unk_4;
    int unk_8;
} FashionAppData;

struct UnkStruct_ScrCmd408 {
    SaveData *saveData;
    u16 unk_4;
    u16 unk_6;
};

struct UnkStruct_ScrCmd230 {
    u8 filler_00[0x30];
    u8 unk_30[6];
};

struct UnkStruct_ScrCmd627 {
    void *unk_0;
    OPTIONS *options;
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

struct UseMailWork *CreateUseMailWork(FieldSystem *fieldSystem, int kind, int mailId, HeapID heapId);
struct ApricornBoxWork *CreateApricornBoxWork(FieldSystem *fieldSystem, int a1);
struct PalPadWork *CreatePalPadWork(FieldSystem *fieldSystem, SaveData *saveData, HeapID heapId);
struct BerryPotsArgs *BerryPotsArgs_New(FieldSystem *fieldSystem);
struct UnownReportWork *CreateUnownReportWork(FieldSystem *fieldSystem);
struct GracideaWork *sub_0203FAE8(FieldSystem *fieldSystem, HeapID heapId, u16 itemId);
PartyMenuAppData *sub_0203E580(HeapID heapId, FieldSystem *fieldSystem); //todo: party select screen
PartyMenuAppData *sub_0203E5A4(HeapID heapId, FieldSystem *fieldSystem); //todo: party trade screen
PartyMenuAppData *sub_0203E6D4(TaskManager *taskManager, HeapID heapId); //todo: union party select screen
int sub_0203E5C8(struct PartyMenuAppData *partyWork);
int sub_0203E5F8(struct PartyMenuAppData *partyWork);
void sub_0203F570(FieldSystem *fieldSystem, SaveData *saveData);
UnkStruct_Ov02_0224E4EC* sub_0203EB64(FieldSystem *fieldSystem);
void sub_0203F964(FieldSystem *fieldSystem);
void LaunchChooseStarterApp(FieldSystem *fieldSystem, struct ChooseStarterAppArgs *args);
void Save_CurrentLocation_BackUp(SaveData *saveData);
u16 sub_0203E864(void *a0);
u16 sub_0203E600(void *a0);
void *sub_0203E7F4(HeapID heapId, FieldSystem *fieldSystem, u8 a2, u16 a3);
u32 *sub_0203ED80(FieldSystem *fieldSystem, u32 a1, u16 *a2);
void *sub_0203FB94(HeapID heapId, FieldSystem *fieldSystem, u16 a2, u16 a3);
void sub_0203F198(TaskManager *taskManager, u16 *ret_p, SaveData *saveData, u16 a3, u16 a4);
void sub_0203F204(FieldSystem *fieldSystem, FashionAppData *fashionData);
void sub_0203F0A8(FieldSystem *fieldSystem, struct UnkStruct_ScrCmd408 *unk);
void sub_0203E868(FieldSystem *fieldSystem, PCBoxAppData *pcBoxData);
void sub_0203F4A8(TaskManager *taskManager);
void sub_0203F4C8(FieldSystem *fieldSystem);
void *sub_0203F4F8(FieldSystem *fieldSystem);
void *sub_0203F984(FieldSystem *fieldSystem);
void *sub_0203F844(FieldSystem *fieldSystem, u16 a1);
void *sub_0203E460(FieldSystem *fieldSystem, u8 a1);
u16 sub_0203E4CC(void *a0);
void sub_0203F9C4(FieldSystem *fieldSystem, struct MoveRelearner *moveRelearner);

static inline void InitUnkStructScrCmd408(struct UnkStruct_ScrCmd408 *data, u16 a1, u16 a2, ScriptContext *ctx) {
    MI_CpuClear8(data, sizeof(struct UnkStruct_ScrCmd408));
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
void sub_0203E960(TaskManager *taskManager, int a1, u16 *a2, u16 *a3, u16 *a4);
void sub_0203F818(FieldSystem *fieldSystem);
void HatchEggInParty(FieldSystem *fieldSystem);
void *sub_0203F074(FieldSystem *fieldSystem, HeapID heapId);
void *sub_0203FA8C(FieldSystem *fieldSystem, HeapID heapId, u16 a2);
void *sub_0203E5D0(HeapID heapId, FieldSystem *fieldSystem, u16 a2);
void *sub_0203FAB4(FieldSystem *fieldSystem, u8 a1, u8 a2, u16 a3, HeapID heapId);
ScratchCardAppData *ScratchOffCards_Create(FieldSystem *fieldSystem, HeapID heapId);
void sub_0203FC14(FieldSystem *fieldSystem, u16 a1, u16 a2);
void *PhoneUI_New(FieldSystem *fieldSystem);
void *sub_0203EEE4(FieldSystem *fieldSystem);
void *sub_0203EF40(FieldSystem *fieldSystem);
void *sub_0203EFA0(FieldSystem *fieldSystem);
void *sub_0203EEA0(FieldSystem *fieldSystem);
void *FieldSystem_CreateApplication_AlphPuzzle(FieldSystem *fieldSystem, u8 puzzle);
void LaunchHOFCongratsApp(FieldSystem *fieldSystem, HOFCongratsAppArgs *args);
void LaunchCreditsApp(FieldSystem *fieldSystem, CreditsAppArgs *args);
void LocationData_BackUp(Location *data);
void LocationData_Restore(Location *data);
void sub_0203E3C4(FieldSystem *fieldSystem, BattleSetup *battleSetup);
u32 *LaunchVoltorbFlipApp(FieldSystem *fieldSystem, u32 luck);

#endif //POKEHEARTGOLD_UNK_0203E348_H
