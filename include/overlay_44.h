#ifndef POKEHEARTGOLD_OVY_44_H
#define POKEHEARTGOLD_OVY_44_H

#include "global.h"
#include "heap.h"
#include "list_menu_2d.h"
#include "render_window.h"

typedef struct UnkStruct_ov44_02235004 {
    u32 unk0;
    u32 unk4;
    u16 unk8;
    s16 unkA;
    u8 unkC[15];
    u8 unk1B;
    u8 unk1C[2];
    u8 unk1E;
    u8 unk1F[2];
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
    u32 unkC;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
    u8 unk14[4];
    u8 unk18[4];
    u32 unk1C;
    u8 unk20[4];
    u8 unk24;
    u8 unk25;
    u8 unk26;
    u8 unk27;
    u8 unk28[4];
    u8 unk2C;
    u8 unk2D;
    Window window;
    u8 unk40[324];
    u32 unk184;
    u32 unk188;
    s32* unk18C;
    s32* unk190;
    s16 unk194;
    s16 unk196;
    u8 unk198[36];
    Window window_1BC; 
    u8 unk1CC[64];
    struct ListMenu2D* listMenu2D; //0x20C
} UnkStruct_ov44_02235340;

extern const WindowTemplate ov44_0223645C;

void ov44_022340EC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
void ov44_02233FA8(UnkStruct_ov44_02235340* arg0);
void ov44_0223398C(Window* arg0, s32 arg1, s32 arg2, enum HeapID heapID);
s32 ov44_02233E6C(UnkStruct_ov44_02235340* arg0);
void ov44_02233EB4(UnkStruct_ov44_02235340* arg0, s32 arg1);
void ov44_02233FE8(UnkStruct_ov44_02235340* arg0);
void ov44_02234450(UnkStruct_ov44_02235340* arg0);
void ov44_022340BC(UnkStruct_ov44_02235340* arg0, BOOL arg1, enum HeapID heapID);
void ov44_0223386C(Window* arg0, s32 arg1, s32 arg2, s32 arg3, enum HeapID heapID);
void ov44_02234440(UnkStruct_ov44_02235340* arg0);
void ov44_02233F3C(UnkStruct_ov44_02235340* arg0);
void ov44_02233F20(UnkStruct_ov44_02235340* arg0);
s32 ov44_02233F64(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234F60(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
void ov44_02233A34(Window* arg0);
void ov44_022340B4(UnkStruct_ov44_02235340* arg0);
void ov44_02233D38(UnkStruct_ov44_02235340* arg0, enum HeapID heapID);
void ov44_02233954(Window* arg0);
BOOL ov44_0223442C(UnkStruct_ov44_02235340* arg0);
void ov44_02233F6C(UnkStruct_ov44_02235340* arg0, enum HeapID heapID);
void ov44_02233C88(Window* arg0, s32 arg1, s32 arg2, s32 arg3, enum HeapID heapID);
void ov44_022342B8(UnkStruct_ov44_02235340* arg0);
void ov44_02233860(Window* arg0, s32 arg1, s32 arg2, enum HeapID heapID);
int ov44_02233E80(u8 arg0, u8 arg1);
int ov44_02233914(Window* arg0);
void ov44_022342E0(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
void ov44_02233E48();
void ov44_02234204(UnkStruct_ov44_02235340* arg0);
void ov44_02233214(UnkStruct_ov44_02235340* arg0, enum HeapID arg1);
void ov44_02234028(UnkStruct_ov44_02235340* arg0);
void ov44_022331C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340* arg1, enum HeapID heapID);

void ov44_02234324();
void ov44_02234328(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235004* arg1);
void ov44_0223435C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235004* arg1);
void ov44_02234388(void);
void ov44_0223438C(UnkStruct_ov44_02235340* arg0);
int ov44_0223442C(UnkStruct_ov44_02235340* arg0);
void ov44_02234440(UnkStruct_ov44_02235340* arg0);
void ov44_02234450(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234458(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234474(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_022344AC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_022344C4(UnkStruct_ov44_02235340* arg0, u8* arg1);
s32 ov44_022345A0(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_022345C8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_022345FC(UnkStruct_ov44_02235340* arg0, u8* arg1, enum HeapID arg2);
s32 ov44_0223469C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_022346B4(UnkStruct_ov44_02235340* arg0);
s32 ov44_022346D0(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_022346E8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
s32 ov44_0223471C(UnkStruct_ov44_02235340* arg0, u8* arg1, enum HeapID arg2) ;
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
s32 ov44_02234944(UnkStruct_ov44_02235340* arg0, u8* arg1, enum HeapID heapID);
s32 ov44_0223499C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_022349B4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
s32 ov44_022349F4(UnkStruct_ov44_02235340* arg0, u8* arg1, enum HeapID heapID);
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
