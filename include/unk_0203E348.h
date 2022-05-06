#ifndef POKEHEARTGOLD_UNK_0203E348_H
#define POKEHEARTGOLD_UNK_0203E348_H

#include "script.h"
#include "overlay_02.h"
#include "bag.h"
#include "mail.h"
#include "fashion_case.h"
#include "field_blackthorn_tutors.h"

struct UseMailWork;
struct ApricornBoxWork;
struct PalPadWork;
struct BerryPotsWork;
struct UnownReportWork;
struct GracideaWork;

struct PartyMenuAppData {
    PARTY *party;
    BAG_DATA *bag;
    MAILBOX *mailbox;
    OPTIONS *options;
    u8 filler_10[0xC];
    FieldSystem *fsys;
    void *fsys_unk_10C;
    u8 unk_24;
    u8 unk_25;
    u8 filler_26[0xA];
    u8 unk_30;
    u8 unk_31;
    u8 unk_32;
    u8 filler_33[0x11];
};

struct ChooseStarterAppData {
    int cursorPos;
    OPTIONS *options;
    POKEMON starters[3];
};

struct DressupSomethingAppData {
    SaveDressupData *dressupData;
    int unk_4;
    int unk_8;
};

struct UnkStruct_ScrCmd408 {
    SAVEDATA *saveData;
    u16 unk_4;
    u16 unk_6;
};

struct UnkStruct_ScrCmd158 {
    SAVEDATA *saveData;
    void *fsysUnk10C;
    int unk8;
};

struct ScratchCardWork {
    SAVEDATA *saveData;
    u8 filler_04[4];
    u16 unk_08[3];
    u16 unk_0E[3];
    u8 filler_14[4];
};

struct UseMailWork *CreateUseMailWork(FieldSystem *fsys, int kind, int mailId, HeapID heapId);
struct ApricornBoxWork *CreateApricornBoxWork(FieldSystem *fsys, int a1);
struct PalPadWork *CreatePalPadWork(FieldSystem *fsys, SAVEDATA *saveData, HeapID heapId);
struct BerryPotsWork *CreateBerryPotsWork(FieldSystem *fsys);
struct UnownReportWork *CreateUnownReportWork(FieldSystem *fsys);
struct GracideaWork *sub_0203FAE8(FieldSystem *fsys, HeapID heapId, u16 itemId);
struct PartyMenuAppData *sub_0203E580(HeapID heapId, FieldSystem *fsys);
void *sub_0203E5A4(HeapID heapId, FieldSystem *fsys);
void *sub_0203E6D4(TaskManager *taskManager, HeapID heapId);
int sub_0203E5C8(struct PartyMenuAppData *partyWork);
int sub_0203E5F8(struct PartyMenuAppData *partyWork);
void sub_0203F570(FieldSystem *fsys, SAVEDATA *saveData);
UnkStruct_Ov02_0224E4EC* sub_0203EB64(FieldSystem *fsys);
void sub_0203F964(FieldSystem *fsys);
void FieldSys_LaunchChooseStarterApplication(FieldSystem *fsys, struct ChooseStarterAppData *data);
void Save_CurrentLocation_BackUp(SAVEDATA *saveData);
u16 sub_0203E864(void *a0);
u16 sub_0203E600(void *a0);
void *sub_0203E7F4(HeapID heapId, FieldSystem *fsys, u8 a2, u16 a3);
void *sub_0203FB94(HeapID heapId, FieldSystem *fsys, u16 a2, u16 a3);
void sub_0203F198(TaskManager *taskManager, u16 *ret_p, SAVEDATA *saveData, u16 a3, u16 a4);
void sub_0203F204(FieldSystem *fsys, struct DressupSomethingAppData *data);
void sub_0203F0A8(FieldSystem *fsys, struct UnkStruct_ScrCmd408 *unk);
void sub_0203E868(FieldSystem *fsys, struct UnkStruct_ScrCmd158 *unk);
void sub_0203F4A8(TaskManager *taskManager);
void sub_0203F4C8(FieldSystem *fsys);
void *sub_0203F4F8(FieldSystem *fsys);
void *sub_0203F984(FieldSystem *fsys);
void *sub_0203F844(FieldSystem *fsys, u16 a1);
void *sub_0203E460(FieldSystem *fsys, u8 a1);
u16 sub_0203E4CC(void *a0);
void sub_0203F9C4(FieldSystem *fsys, struct MoveRelearner *moveRelearner);

static inline void InitUnkStructScrCmd408(struct UnkStruct_ScrCmd408 *data, u16 a1, u16 a2, SCRIPTCONTEXT *ctx) {
    MI_CpuClear8(data, sizeof(struct UnkStruct_ScrCmd408));
    data->unk_4 = a1;
    data->unk_6 = a2;
    data->saveData = ctx->fsys->savedata;
}

static inline struct UnkStruct_ScrCmd158 *NewUnkStructScrCmd158(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ScrCmd158 *ret = AllocFromHeap(11, sizeof(struct UnkStruct_ScrCmd158));
    ret->saveData = ctx->fsys->savedata;
    ret->unk8 = ScriptReadByte(ctx);
    ret->fsysUnk10C = &ctx->fsys->unk_10C;
    return ret;
}

#define NAMINGSCREEN_PLAYER             0
#define NAMINGSCREEN_POKEMON            1
#define NAMINGSCREEN_BOX                2
#define NAMINGSCREEN_RIVAL              3
#define NAMINGSCREEN_GROUP              5

void CreateNamingScreen(TaskManager *taskManager, int kind, int param, int maxLen, int initPos, const u16 *defaultStr, u16 *retVar);
void sub_0203E960(TaskManager *taskManager, int a1, u16 *a2, u16 *a3, u16 *a4);
void sub_0203F818(FieldSystem *fsys);
void sub_0203F9F4(FieldSystem *fsys);
void *sub_0203F074(FieldSystem *fsys, HeapID heapId);
void *sub_0203FA8C(FieldSystem *fsys, HeapID heapId, u16 a2);
void *sub_0203E5D0(HeapID heapId, FieldSystem *fsys, u16 a2);
void *sub_0203FAB4(FieldSystem *fsys, u8 a1, u8 a2, u16 a3, HeapID heapId);
void *ScratchOffCards_Create(FieldSystem *fsys, HeapID heapId);
void sub_0203FC14(FieldSystem *fsys, u16 a1, u16 a2);
void sub_0203E33C(FieldSystem *fsys, u16 a1);
void *PhoneUI_new(FieldSystem *fsys);
void *sub_0203EEE4(FieldSystem *fsys);
void *sub_0203EF40(FieldSystem *fsys);
void *sub_0203EFA0(FieldSystem *fsys);
void *sub_0203EEA0(FieldSystem *fsys);
void *Fsys_CreateApplication_AlphPuzzle(FieldSystem *fsys, u8 puzzle);

#endif //POKEHEARTGOLD_UNK_0203E348_H
