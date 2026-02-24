#ifndef POKEHEARTGOLD_OVY_44_H
#define POKEHEARTGOLD_OVY_44_H

#include "global.h"
#include "heap.h"
#include "list_menu_2d.h"

typedef struct UnkStruct_ov44_02235340_1 {
    u8 unk0[27];
    u8 unk1B;
    u8 unk1C[5];
    u8 unk21;
} UnkStruct_ov44_02235340_1;

typedef struct UnkStruct_ov44_02235340 {
    UnkStruct_ov44_02235340_1* unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    s32 unk8;
    u8 unkC[6];
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
    u32 unk1C;
    u8 unk20[4];
    u8 unk24;
    u8 unk25;
    u8 unk26;
    u8 unk27;
    u8 unk28;
    u8 unk29;
    u8 unk2A;
    u8 unk2B;
    u8 unk2C;
    u8 unk2D;
    u8 unk2E;
    u8 unk2F;
    BgConfig* unk30;
    u8 unk34[472];
    struct ListMenu2D* unk20C;
} UnkStruct_ov44_02235340;

typedef struct sub_struct {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
} sub_struct;

extern const struct WindowTemplate ov44_0223645C;

void ov44_02234440(UnkStruct_ov44_02235340* arg0);
void ov44_02233F3C(UnkStruct_ov44_02235340* arg0);
void ov44_02233F20(UnkStruct_ov44_02235340* arg0);
s32 ov44_02233F64();
s32 ov44_02234F60(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
void ov44_02233A34(BgConfig** arg0);
void ov44_022340B4(UnkStruct_ov44_02235340* arg0);
void ov44_02233D38(UnkStruct_ov44_02235340* arg0, enum HeapID heapID);
void ov44_02233954(BgConfig** arg0);
BOOL ov44_0223442C(UnkStruct_ov44_02235340* arg0);
void ov44_02233F6C(UnkStruct_ov44_02235340* arg0, enum HeapID heapID);
void ov44_02233C88(BgConfig** arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4);
void ov44_022342B8(UnkStruct_ov44_02235340* arg0);
void ov44_02233860(BgConfig** arg0, s32 arg1, s32 arg2, enum HeapID heapID);
int ov44_02233E80(u8 arg0, u8 arg1);
int ov44_02233914(BgConfig** arg0);
void ov44_022342E0(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
void ov44_02233E48();
void ov44_02234204(UnkStruct_ov44_02235340* arg0);
void ov44_02233214(UnkStruct_ov44_02235340* arg0, enum HeapID arg1);
void ov44_02234028(UnkStruct_ov44_02235340* arg0);
void ov44_022331C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340* arg1, enum HeapID heapID);

s32 ov44_02234E08(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234EA4(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234EF4(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234F44(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234F88(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234FC4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234FDC(UnkStruct_ov44_02235340* arg0);
s32 ov44_02235004(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02235038(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02235090(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02235100(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02235158(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_0223518C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_022351BC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_022351DC(UnkStruct_ov44_02235340* arg0, u8* arg1);
s32 ov44_02235218(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02235268(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340* arg1, enum HeapID heapID);
s32 ov44_0223532C(UnkStruct_ov44_02235340* arg0);
s32 ov44_02235340(UnkStruct_ov44_02235340* arg0);

#endif // POKEHEARTGOLD_OVY_44_H
