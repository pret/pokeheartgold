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
u8 ov02_02251EE8(GearPhoneRingManager *a0, u8 *a1);

// TODO: define the struct, figure out what a1 is
void *ov02_02249458(FieldSystem *fsys, int a1, POKEMON *pokemon, int gender);
BOOL ov02_0224953C(void *work);
void ov02_02249548(void *work);

void ov02_02245B80(TaskManager *taskManager);
void PokecenterAnimCreate(FieldSystem *fsys, u8 kind);
void ov02_0224BDE8(FieldSystem *fsys, u8 direction, u8 length);
int ov02_0224CD38(PLAYERPROFILE *profile, u16 a, u16 b, u16 c, u16 d, HeapID heapId);
int ov02_0224CD74(PLAYERPROFILE *profile, u16 a, u16 b, u16 c, u16 d, HeapID heapId);
void ov02_0224BF58(FieldSystem *fsys, u8 a1);
void ov02_0224BFC0(FieldSystem *fsys, u8 a1);
void ov02_0224BFCC(FieldSystem *fsys, u8 a1);
void ov02_0224CDB0(FieldSystem *fsys, u8 a1);
void ov02_0224E074(FieldSystem *fsys, u16 *p_ret, int a2, HeapID heapId);
void ov02_0224E0BC(LocalMapObject *obj1, LocalMapObject *obj2, TaskManager *taskManager);
void ov02_02251EB8(GearPhoneRingManager *phoneRingManager, u8 a1, u8 a2, u8 a3, u8 a4, u8 a5);
void Fsys_FollowPokeInteract(FieldSystem *fsys);
BOOL ov02_02250780(FieldSystem *fsys, u8 a1);
void ov02_022507B4(FieldSystem *fsys, u8 a1);
void ov02_022508B4(FieldSystem *fsys);
void ov02_02250A60(FieldSystem *fsys);
void ov02_02250AC8(FieldSystem *fsys);
void ov02_02250AE8(FieldSystem *fsys);
void ov02_02250AFC(FieldSystem *fsys, u8 a1);
void ov02_02250B30(FieldSystem *fsys);
void ov02_02250B80(FieldSystem *fsys);
void ov02_02251424(FieldSystem *fsys, u8 a1);
void ov02_022514C8(FieldSystem *fsys, u8 a1);
void ov02_02251554(FieldSystem *fsys);
void ov02_022515A4(FieldSystem *fsys);
void ov02_022518E0(FieldSystem *fsys);
void ov02_02251B14(FieldSystem *fsys);
void ov02_02251CF0(FieldSystem *fsys);
void ov02_02251DC4(FieldSystem *fsys);
void ov02_02251DE8(FieldSystem *fsys);
void ov02_022523B4(TaskManager *taskManager);
void ov02_02252534(FieldSystem *fsys);
void ov02_022529FC(FieldSystem *fsys);
void ov02_02252EE4(FieldSystem *fsys, u8 a1);
BOOL ov02_02253134(SAVEDATA *saveData);
int ov02_0225316C(void);
BOOL ov02_02253188(SAVEDATA *saveData);
int ov02_022531B4(SAVEDATA *saveData);
BOOL ov02_022470A0(FieldSystem *fsys, int *a1);

#endif //POKEHEARTGOLD_OVERLAY_02_H
