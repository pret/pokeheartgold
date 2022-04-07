#ifndef POKEHEARTGOLD_UNK_0203E348_H
#define POKEHEARTGOLD_UNK_0203E348_H

#include "script.h"
#include "overlay_02.h"
#include "bag.h"
#include "mail.h"

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
void sub_0203F570(FieldSystem *fsys, SAVEDATA *saveData);
UnkStruct_Ov02_0224E4EC* sub_0203EB64(FieldSystem *fsys);
void FieldSys_LaunchChooseStarterApplication(FieldSystem *fsys, struct ChooseStarterAppData *data);
void Save_CurrentLocation_BackUp(SAVEDATA *saveData);
u16 sub_0203E864(void *a0);
u16 sub_0203E600(void *a0);
void *sub_0203E7F4(HeapID heapId, FieldSystem *fsys, u8 a2, u16 a3);
void *sub_0203FB94(HeapID heapId, FieldSystem *fsys, u16 a2, u16 a3);

#endif //POKEHEARTGOLD_UNK_0203E348_H
