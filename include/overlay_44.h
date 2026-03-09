#ifndef POKEHEARTGOLD_OVY_44_H
#define POKEHEARTGOLD_OVY_44_H

#include "global.h"
#include "heap.h"
#include "main.h"
#include "list_menu_2d.h"
#include "render_window.h"
#include "unk_02009D48.h"

typedef struct UnkStruct_ov44_022341C0 {
    u32 unk0;
    u32 unk4;
    u16 unk8;
    s16 unkA;
} UnkStruct_ov44_022341C0;

typedef struct UnkStruct_ov44_args {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    SaveData* unk8;
} UnkStruct_ov44_args;

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
    u8 unk22;
} UnkStruct_ov44_02235004;

typedef struct UnkStruct_ov44_02233100 {
    u16 unk0;
    u16 unk2;
    u32 unk4;
} UnkStruct_ov44_02233100;

typedef struct UnkStruct_ov44_022345FC {
    s16 unk0;
    s32 unk2;
} UnkStruct_ov44_022345FC;

typedef struct UnkStruct_ov44_02232F64 {
    BgConfig* bgConfig;
    MessageFormat* unk4;
    MsgData* unk8;
    String* unkC;
    String* unk10;
    u8 unk14;
    u8 unk15;
    u16 unk16;
    SpriteList* spriteList; // 0x18
    G2dRenderer unk1C;
    GF_2DGfxResMan* unk144[4];
    u32 unk154;
    u32 unk158;
    UnkStruct_ov44_022341C0 unk15C[4];
    Window window_list[5]; // 0x18C - 0x1DC
    struct ListMenu2D* unk1DC;
    void* unk1E0;
    NNSG2dScreenData* unk1E4;
    WaitingIcon* unk1E8; //0x218;
    void* unk1EC;
    NNSG2dPaletteData* unk1F0;
    u16 unk1F4;
    s16 unk1F6;
    u8 unk1F8[36];
} UnkStruct_ov44_02232F64;

typedef struct UnkStruct_ov44_02235340 {
    UnkStruct_ov44_02235004* unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    s32 unk8;
    s32 unkC;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
    u8 unk14[4];
    u8 unk18[4];
    u8 unk1C[4];
    u8 unk20[4];
    u8 unk24;
    u8 unk25;
    u8 unk26;
    u8 unk27;
    u8 unk28[4];
    u8 unk2C;
    u8 unk2D;
    UnkStruct_ov44_02232F64 unk30;
} UnkStruct_ov44_02235340;

typedef void (*func_type)(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1);
typedef s32 (*func_type_1)(UnkStruct_ov44_02235340*, UnkStruct_ov44_args*, enum HeapID);

s32 ov44_02234F60(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02232F64(OverlayManager* arg0, u32* arg1);
s32 ov44_022330A8(OverlayManager* arg0);
void ov44_02233100(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02233100* arg1);
void ov44_02233160(UnkStruct_ov44_02235340* arg0);
void ov44_0223317C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1);
void ov44_0223319C(UnkStruct_ov44_02235340* arg0);
s32 ov44_022331B0(void);
void ov44_022331C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
void ov44_02233214(UnkStruct_ov44_02235340* arg0, enum HeapID arg1);
void ov44_0223323C(void);
void ov44_0223325C(UnkStruct_ov44_02232F64* arg0, enum HeapID arg1);
void ov44_0223340C(UnkStruct_ov44_02232F64* arg0);
void ov44_02233444(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
void ov44_022335AC(UnkStruct_ov44_02232F64* arg0, enum HeapID arg1);
void ov44_0223362C(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
void ov44_02233678(UnkStruct_ov44_02232F64* arg0);
void ov44_02233698(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
void ov44_0223376C(UnkStruct_ov44_02232F64* arg0, enum HeapID arg1);
void ov44_02233820(UnkStruct_ov44_02232F64* arg0);
void ov44_02233860(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, enum HeapID heapID);
void ov44_0223386C(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, s32 arg3, enum HeapID heapID);
s32 ov44_02233914(UnkStruct_ov44_02232F64* arg0);
void ov44_02233954(UnkStruct_ov44_02232F64* arg0);
void ov44_0223398C(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, enum HeapID heapID);
void ov44_02233A34(UnkStruct_ov44_02232F64* arg0);
void ov44_02233A50(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
void ov44_02233AB8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02232F64* arg1, UnkStruct_ov44_args* arg2, s32 arg3, enum HeapID arg4);
void ov44_02233C18(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, enum HeapID arg3);
void ov44_02233C88(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, s32 arg3, enum HeapID heapID);
void ov44_02233CA0(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, s32 arg3, enum HeapID heapID);
void ov44_02233CCC(UnkStruct_ov44_02232F64* arg0);
void ov44_02233D08(UnkStruct_ov44_02232F64* arg0, s32 arg1);
u8 ov44_02233D38(UnkStruct_ov44_02235340* arg0, enum HeapID heapID);
void ov44_02233D8C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
void ov44_02233E48(UnkStruct_ov44_02235340* arg0);
s32 ov44_02233E6C(UnkStruct_ov44_02235340* arg0);
s32 ov44_02233E80(u32 arg0, u32 arg1);
void ov44_02233EB4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1);
s32 ov44_02233EF8(UnkStruct_ov44_02235340* arg0);
s32 ov44_02233F20(UnkStruct_ov44_02235340* arg0);
void ov44_02233F3C(UnkStruct_ov44_02235340* arg0);
void ov44_02233F50(UnkStruct_ov44_02235340* arg0);
s32 ov44_02233F64(UnkStruct_ov44_02235340* arg0);
s32 ov44_02233F6C(UnkStruct_ov44_02235340* arg0, enum HeapID heapID);
void ov44_02233FA8(UnkStruct_ov44_02235340* arg0);
void ov44_02233FE8(UnkStruct_ov44_02235340* arg0);
void ov44_02234028(UnkStruct_ov44_02235340* arg0);
void ov44_02234038(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234044(UnkStruct_ov44_02235340* arg0);
void ov44_02234070(u8 arg0, UnkStruct_ov44_02235340* arg1, s32 arg2);
s32 ov44_0223407C(UnkStruct_ov44_02235340* arg0);
void ov44_022340B4(UnkStruct_ov44_02235340* arg0);
void ov44_022340BC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
void ov44_022340EC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2);
void ov44_022341C0(UnkStruct_ov44_02235340* arg0);
void ov44_02234204(UnkStruct_ov44_02235340* arg0);
void ov44_02234224(UnkStruct_ov44_02235340* arg0, s32 arg1);
void ov44_02234248(UnkStruct_ov44_02235340* arg0);
void ov44_0223427C(UnkStruct_ov44_02235340* arg0, enum HeapID arg1);
void ov44_022342B8(UnkStruct_ov44_02235340* arg0);
void ov44_022342E0(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
void ov44_02234324(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1);
void ov44_02234328(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1);
void ov44_0223435C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1);
void ov44_02234388(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1);
void ov44_0223438C(UnkStruct_ov44_02235340* arg0);
int ov44_0223442C(UnkStruct_ov44_02235340* arg0);
void ov44_02234440(UnkStruct_ov44_02235340* arg0);
void ov44_02234450(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234458(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234474(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
s32 ov44_022344AC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
s32 ov44_022344C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
s32 ov44_022345A0(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
s32 ov44_022345C8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
s32 ov44_022345FC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
s32 ov44_0223469C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
s32 ov44_022346B4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022346D0(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
s32 ov44_022346E8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
s32 ov44_0223471C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
s32 ov44_02234764(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID arg2);
s32 ov44_0223479C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022347D4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022347FC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234828(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234858(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022348A8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022348C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022348EC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234904(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234944(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_0223499C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022349B4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022349F4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234A4C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234A68(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234AA8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234AE4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234B18(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234B58(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234B80(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234BB4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234BF0(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234C10(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234C48(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234C88(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234CE8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234D28(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234D4C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234D88(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234DA8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234DE4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234E08(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234EA4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234EF4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234F44(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234F88(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234FC4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234FDC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02235004(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02235038(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02235090(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02235100(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02235158(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_0223518C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022351BC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022351DC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02235218(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02235268(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_0223532C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02235340(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);

#endif // POKEHEARTGOLD_OVY_44_H
