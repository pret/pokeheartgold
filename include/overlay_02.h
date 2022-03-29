#ifndef POKEHEARTGOLD_OVERLAY_02_H
#define POKEHEARTGOLD_OVERLAY_02_H

#include "script.h"
#include "unk_0201F79C.h"
#include "unk_0203BC10.h"

struct FieldLongWarpTaskData;

typedef struct UnkStruct_Ov02_0224E4EC {
    SAVEDATA *saveData;
    void *unk04; // points to fsys->unk_10C
    u8 unk08;
    u8 deltaX;
    u8 unk0A;
    u8 deltaY;
    u8 unk0C;
    u8 unk0D;
    u8 unk0E; // not set
    u8 unk0F;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
    u8 unk14;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;
    u8 unk1A;
    u8 unk1B;
    u16 unk1C; // known from what's decompiled
    u8 *unk20; // points to fsys->unk_111
} UnkStruct_Ov02_0224E4EC;


UNK_0201F79C_Sub *ov02_0224B418(FieldSystem *fsys, int gender);
BOOL ov02_0224B43C(UNK_0201F79C_Sub *unk);
void ov02_0224B448(UNK_0201F79C_Sub *unk);
struct FieldLongWarpTaskData *CreateFieldEscapeRopeTaskEnv(FieldSystem *fsys, HeapID heapId);
struct FieldLongWarpTaskData *CreateFieldTeleportTaskEnv(FieldSystem *fsys, POKEMON *pokemon, u8 slotno, HeapID heapId);
struct FieldLongWarpTaskData *CreateFieldDigTaskEnv(FieldSystem *fsys, POKEMON *pokemon, u8 slotno, HeapID heapId);
BOOL Task_FieldEscapeRope(TaskManager *taskManager);
BOOL Task_FieldTeleport(TaskManager *taskManager);
BOOL Task_FieldDig(TaskManager *taskManager);
BOOL ov02_0224C1F8(TaskManager *taskManager);
void *ov02_0224C1D8(FieldSystem *fsys, int a1, int a2);

#endif //POKEHEARTGOLD_OVERLAY_02_H
