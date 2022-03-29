#ifndef POKEHEARTGOLD_UNK_0203E348_H
#define POKEHEARTGOLD_UNK_0203E348_H

#include "script.h"

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
u16* sub_0203EB64(FieldSystem *fsys);
void FieldSys_LaunchChooseStarterApplication(FieldSystem *fsys, struct ChooseStarterAppData *data);

#endif //POKEHEARTGOLD_UNK_0203E348_H
