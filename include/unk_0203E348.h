#ifndef POKEHEARTGOLD_UNK_0203E348_H
#define POKEHEARTGOLD_UNK_0203E348_H

#include "script.h"
#include "overlay_02.h"

struct UseMailWork;
struct ApricornBoxWork;
struct PalPadWork;
struct BerryPotsWork;
struct UnownReportWork;
struct GracideaWork;

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
void sub_0203F570(FieldSystem *fsys, SAVEDATA *saveData);
UnkStruct_Ov02_0224E4EC* sub_0203EB64(FieldSystem *fsys);
void FieldSys_LaunchChooseStarterApplication(FieldSystem *fsys, struct ChooseStarterAppData *data);
void Save_CurrentLocation_BackUp(SAVEDATA *saveData);

#endif //POKEHEARTGOLD_UNK_0203E348_H
