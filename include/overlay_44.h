#ifndef POKEHEARTGOLD_OVY_44_H
#define POKEHEARTGOLD_OVY_44_H

#include "global.h"
#include "heap.h"
#include "list_menu_2d.h"

typedef struct UnkStruct_ov44_02235004 {
    u8 unk0[27];
    u8 unk1B;
    u8 unk1C[5];
    u8 unk21;
} UnkStruct_ov44_02235004;

typedef struct UnkStruct_ov44_022345FC {
    s16 unk0;
    s32 unk2;
} UnkStruct_ov44_022345FC;

typedef struct UnkStruct_ov44_02235340 {
    UnkStruct_ov44_02235004* unk0;
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
    BgConfig* bgConfig;
    u8 unk34[472];
    struct ListMenu2D* listMenu2D;
} UnkStruct_ov44_02235340;

typedef struct UnkStruct_ov44_02235340_sub {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
} UnkStruct_ov44_02235340_sub;

extern const WindowTemplate ov44_0223645C;

void ov44_02233FA8(UnkStruct_ov44_02235340* arg0);
void ov44_0223398C(BgConfig** arg0, s32 arg1, s32 arg2, enum HeapID heapID);
s32 ov44_02233E6C(UnkStruct_ov44_02235340* arg0);
void ov44_02233EB4(UnkStruct_ov44_02235340* arg0, s32 arg1);
void ov44_02233FE8(UnkStruct_ov44_02235340* arg0);
void ov44_02234450(UnkStruct_ov44_02235340* arg0);
void ov44_022340BC(UnkStruct_ov44_02235340* arg0, BOOL arg1, enum HeapID heapID);
void ov44_0223386C(BgConfig** arg0, s32 arg1, s32 arg2, s32 arg3, enum HeapID heapID);
void ov44_02234440(UnkStruct_ov44_02235340* arg0);
void ov44_02233F3C(UnkStruct_ov44_02235340* arg0);
void ov44_02233F20(UnkStruct_ov44_02235340* arg0);
s32 ov44_02233F64(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234F60(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
void ov44_02233A34(BgConfig** arg0);
void ov44_022340B4(UnkStruct_ov44_02235340* arg0);
void ov44_02233D38(UnkStruct_ov44_02235340* arg0, enum HeapID heapID);
void ov44_02233954(BgConfig** arg0);
BOOL ov44_0223442C(UnkStruct_ov44_02235340* arg0);
void ov44_02233F6C(UnkStruct_ov44_02235340* arg0, enum HeapID heapID);
void ov44_02233C88(BgConfig** arg0, s32 arg1, s32 arg2, s32 arg3, enum HeapID heapID);
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

s32 ov44_022344AC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_022344C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340_sub* arg1);
s32 ov44_022345A0(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_022345C8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_022345FC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340_sub* arg1, enum HeapID arg2);
s32 ov44_0223469C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_022346B4(UnkStruct_ov44_02235340* arg0);
s32 ov44_022346D0(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_022346E8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_0223471C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340_sub* arg1, enum HeapID arg2) ;
s32 ov44_02234764(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_0223479C(UnkStruct_ov44_02235340* arg0);
s32 ov44_022347D4(UnkStruct_ov44_02235340* arg0);
s32 ov44_022347FC(UnkStruct_ov44_02235340* arg0, s32 arg1);
s32 ov44_02234828(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234858(UnkStruct_ov44_02235340* arg0);
s32 ov44_022348A8(UnkStruct_ov44_02235340* arg0);
s32 ov44_022348C4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_022348EC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234904(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234944(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340_sub* arg1, enum HeapID heapID);
s32 ov44_0223499C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_022349B4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_022349F4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340_sub* arg1, enum HeapID heapID);
s32 ov44_02234A4C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234A68(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234AA8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234AE4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234B18(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234B58(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234B80(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234BB4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234BF0(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234C10(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234C48(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234C88(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234CE8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234D28(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234D4C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234D88(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234DA8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_02234DE4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
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
