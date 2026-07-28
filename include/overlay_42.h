#ifndef POKEHEARTGOLD_OVY_42_H
#define POKEHEARTGOLD_OVY_42_H

#include "global.h"

#include "bg_window.h"
#include "palette.h"
#include "sprite.h"
#include "unk_02009D48.h"

typedef struct UnkStruct_ov44_02232914 {
    s16 unk0;
    s16 unk2;
} UnkStruct_ov44_02232914;

typedef struct UnkStruct_ov42_02228CDC {
    u16 unk0;
    u8 unk2;
    u8 unk3;
} UnkStruct_ov42_02228CDC;

typedef struct UnkStruct_ov42_02228EB0 {
    UnkStruct_ov44_02232914 unk0;
    u16 unk4;
    u8 unk6;
    u8 unk7;
} UnkStruct_ov42_02228EB0;

typedef struct UnkStruct_ov42_02229A40 {
    UnkStruct_ov42_02228CDC *unk0;
    u32 unk4;
    u16 unk8;
    u16 unkA;
} UnkStruct_ov42_02229A40;

typedef struct UnkStruct_ov42_022293B8 {
    G2dRenderer *g2dRenderer;
    BgConfig *bgConfig;
    void *unk8;
    NNSG2dScreenData *nnsg2dScreenData;
    u32 unk10;
    u32 unk14;
    u16 unk18;
    u16 unk1A;
} UnkStruct_ov42_022293B8;

typedef struct UnkStruct_ov44_02232031 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
} UnkStruct_ov44_02232031;

typedef struct UnkStruct_ov42_022299C0 {
    UnkStruct_ov44_02232031 *unk0;
    u32 unk4;
    u16 unk8;
    u16 unkA;
} UnkStruct_ov42_022299C0;

typedef struct UnkStruct_ov42_02228110 {
    u32 unk0;
    UnkStruct_ov44_02232914 unk4;
    UnkStruct_ov44_02232914 unk8;
    u16 unkC;
    u16 unkE;
    u16 unk10;
    u16 unk12;
    u8 unk14;
    u8 unk15;
    u16 unk16;
} UnkStruct_ov42_02228110;

typedef struct UnkStruct_ov42_022280A8 {
    UnkStruct_ov42_02228110 *unk0;
    u32 unk4;
} UnkStruct_ov42_022280A8;

typedef struct UnkStruct_ov42_02227F68 {
    u16 unk0;
    u16 unk2;
    u32 *unk4;
} UnkStruct_ov42_02227F68;

typedef struct UnkStruct_ov42_02122667 {
    s16 unk0;
    s16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
} UnkStruct_ov42_02122667;

typedef struct UnkStruct_ov42_02227114 {
    u32 *unk0;
    Sprite *unk4;
    Sprite *unk8;
    u32 unkC;
    u32 unk10;
    s16 unk14;
    u8 unk16[2];
} UnkStruct_ov42_02227114;

typedef struct UnkStruct_ov42_0222903C {
    UnkStruct_ov42_02228110 *unk0;
    UnkStruct_ov42_02227114 *unk4;
    u16 unk8;
    u16 unkA;
    s16 unkC;
    u16 unkE;
    u16 unk10;
    u8 unk12;
    u8 unk13;
} UnkStruct_ov42_0222903C;

typedef struct UnkStruct_ov42_022272BC {
    u32 unk0;
    SpriteResource *unk4;
    SpriteResource *unk8;
    u32 unkC;
    u32 unk10;
    SpriteResourcesHeader unk14;
} UnkStruct_ov42_022272BC;

typedef struct UnkStruct_ov42_02227C18 {
    SpriteResource *unk0;
    SpriteResource *unk4;
    u8 unk8[8];
} UnkStruct_ov42_02227C18;

typedef struct UnkStruct_ov42_02227060 {
    SpriteList *unk0;
    PaletteData *unk4;
    UnkStruct_ov42_02227114 *unk8;
    u32 unkC;
    UnkStruct_ov42_022272BC unk10[0x99];
    SpriteResource *unk2188[4];
    u8 unk2198[0x20];
    UnkStruct_ov42_02227C18 unk21B8[0x10];
    SpriteResource *unk22B8;
    u8 unk22BC[4];
    SpriteResource *unk22C0[2];
    SpriteResourcesHeader unk22C8;
    u32 unk22EC;
    GF_2DGfxResMan *unk22F0[2];
    GF_2DGfxResMan *unk22F8[2];
    SpriteResource *unk2300;
    NARC *unk2304;
    NARC *unk2308;
} UnkStruct_ov42_02227060;

typedef struct UnkStruct_ov42_02228EDC {
    UnkStruct_ov42_02227060 *unk0;
    UnkStruct_ov42_0222903C *unk4;
    u16 unk8;
    u8 unkA;
    u8 unkB;
} UnkStruct_ov42_02228EDC;

typedef struct UnkStruct_ov42_02227FA4 {
    u32 unk0;
} UnkStruct_ov42_02227FA4;

typedef s32 (*func_type_02229E74)(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4);
typedef void (*func_type_022285A4)(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg2, u32 arg3);
typedef s32 (*func_type_02228574)(UnkStruct_ov42_02228110 *arg0);
typedef void (*func_type_02229B48)(UnkStruct_ov42_02227114 *arg0);
typedef void (*func_type_02227504)(UnkStruct_ov42_02227114 *arg0, s32 arg1);

UnkStruct_ov42_02227060 *ov42_02227060(SpriteList *arg0, PaletteData *arg1, s32 arg2, enum HeapID heapID);
void ov42_02227114(UnkStruct_ov42_02227060 *arg0);
void ov42_02227194(UnkStruct_ov42_02227060 *arg0, s32 arg1, u8 arg2, s32 arg3, enum HeapID heapID);
void ov42_022271D0(UnkStruct_ov42_02227060 *arg0, s32 arg1);
s32 ov42_022271E4(UnkStruct_ov42_02227060 *arg0, s32 arg1);
void ov42_022271F8(UnkStruct_ov42_02227060 *arg0);
void ov42_02227228(UnkStruct_ov42_02227060 *arg0, u8 arg1, s32 arg2, enum HeapID heapID);
void ov42_02227274(UnkStruct_ov42_02227060 *arg0);
void ov42_0222729C(UnkStruct_ov42_02227060 *arg0, u8 arg1, s32 arg2, enum HeapID heapID);
void ov42_022272B4(UnkStruct_ov42_02227060 *arg0);
UnkStruct_ov42_02227114 *ov42_022272BC(UnkStruct_ov42_02227060 *arg0, s16 *arg1, s32 arg2, enum HeapID heapID);
void ov42_0222740C(UnkStruct_ov42_02227114 *arg0);
Sprite *ov42_02227430(UnkStruct_ov42_02227114 *arg0);
void ov42_02227434(UnkStruct_ov42_02227114 *arg0, s16 arg1, s16 arg2);
void ov42_02227474(UnkStruct_ov42_02227114 *arg0, u16 arg1);
u16 ov42_02227480(UnkStruct_ov42_02227114 *arg0);
void ov42_02227490(UnkStruct_ov42_02227114 *arg0, u16 arg1);
BOOL ov42_022274AC(UnkStruct_ov42_02227114 *arg0);
s32 ov42_022274B8(UnkStruct_ov42_02227114 *arg0);
u32 ov42_022274C0(UnkStruct_ov42_02227114 *arg0);
void ov42_022274C4(UnkStruct_ov42_02227114 *arg0, u16 arg1);
u16 ov42_022274D0(UnkStruct_ov42_02227114 *arg0);
void ov42_022274DC(UnkStruct_ov42_02227114 *arg0, s16 arg1, s16 arg2);
void ov42_02227504(UnkStruct_ov42_02227114 *arg0, s32 arg1, s32 arg2);
void ov42_02227538(UnkStruct_ov42_02227114 *arg0);
void ov42_02227570(UnkStruct_ov42_02227060 *arg0, s32 arg1, enum HeapID heapID);
void ov42_02227604(UnkStruct_ov42_02227060 *arg0, s32 arg1);
u16 ov42_02227654(s32 arg0);
s32 ov42_02227680(u32 arg0, s32 arg1);
s32 ov42_022276AC(s32 arg0, s32 arg1, s32 arg2);
void ov42_022276DC(UnkStruct_ov42_02227060 *arg0, s32 arg1, u8 arg2, s32 arg3, enum HeapID heapID, s32 arg5);
void ov42_02227720(UnkStruct_ov42_02227060 *arg0, s32 arg1, s32 arg2, s32 arg3, enum HeapID heapID);
void ov42_02227874(UnkStruct_ov42_02227060 *arg0, s32 arg1, s32 arg2, s32 arg3, enum HeapID heapID);
void ov42_02227948(UnkStruct_ov42_02227060 *arg0, s32 arg1);
void ov42_0222797C(UnkStruct_ov42_02227060 *arg0, s32 arg1);
void ov42_022279C0(UnkStruct_ov42_02227060 *arg0, s32 arg1);
BOOL ov42_022279E8(UnkStruct_ov42_02227060 *arg0, s32 arg1);
void ov42_022279FC(UnkStruct_ov42_02227060 *arg0, s32 arg1, enum HeapID heapID);
void ov42_02227B04(UnkStruct_ov42_02227060 *arg0);
s32 ov42_02227B5C(SpriteResource **arg0);
void ov42_02227B6C(UnkStruct_ov42_02227060 *arg0, s32 arg1, enum HeapID heapID);
void ov42_02227BE0(UnkStruct_ov42_02227060 *arg0);
void ov42_02227C18(UnkStruct_ov42_02227060 *arg0, enum HeapID heapID);
void ov42_02227CA8(UnkStruct_ov42_02227060 *arg0);
UnkStruct_ov42_02227114 *ov42_02227CF8(UnkStruct_ov42_02227060 *arg0);
void ov42_02227D30(UnkStruct_ov42_02227114 *arg0);

void ov42_02227D48(UnkStruct_ov42_02227114 *arg0, s32 arg1);
void ov42_02227D54(UnkStruct_ov42_02227114 *arg0, s32 arg1);
void ov42_02227D64(UnkStruct_ov42_02227114 *arg0, s32 arg1);
void ov42_02227D74(UnkStruct_ov42_02227114 *arg0, s32 arg1);
void ov42_02227D88(UnkStruct_ov42_02227114 *arg0, s32 arg1);
void ov42_02227D98(UnkStruct_ov42_02227114 *arg0, s32 arg1);
void ov42_02227DA8(UnkStruct_ov42_02227114 *arg0, s32 arg1);
void ov42_02227DB8(UnkStruct_ov42_02227114 *arg0, s32 arg1);
void ov42_02227DC8(UnkStruct_ov42_02227114 *arg0, s32 arg1);
void ov42_02227DD8(UnkStruct_ov42_02227114 *arg0);
void ov42_02227DE8(UnkStruct_ov42_02227114 *arg0);
void ov42_02227DF8(UnkStruct_ov42_02227114 *arg0);
void ov42_02227E18(UnkStruct_ov42_02227114 *arg0);
void ov42_02227E28(UnkStruct_ov42_02227114 *arg0);
void ov42_02227E38(UnkStruct_ov42_02227114 *arg0);
void ov42_02227E48(UnkStruct_ov42_02227114 *arg0);
void ov42_02227E58(UnkStruct_ov42_02227114 *arg0);
s32 ov42_02227E68(UnkStruct_ov42_02227114 *arg0);
void ov42_02227E78(UnkStruct_ov42_02227060 *arg0, SpriteResource *arg1, s32 arg2);
void *ov42_02227EE0(u16 arg0, u16 arg1, enum HeapID heapID);
void ov42_02227F28(UnkStruct_ov42_02227F68 *arg0);
u16 ov42_02227F40(UnkStruct_ov42_02227F68 *arg0);
u16 ov42_02227F44(UnkStruct_ov42_02227F68 *arg0);
void ov42_02227F48(UnkStruct_ov42_02227F68 *arg0, void *arg1);

UnkStruct_ov42_02227FA4 ov42_02227F68(UnkStruct_ov42_02227F68 *arg0, u32 arg1, u32 arg2);
s32 ov42_02227FA4(UnkStruct_ov42_02227F68 *arg0, u16 arg1, u16 arg2);
u32 ov42_02227FDC(UnkStruct_ov42_02227F68 *arg0, u16 arg1, u16 arg2);
UnkStruct_ov42_022280A8 *ov42_02228010(u32 a0, enum HeapID heapID);
void ov42_02228050(UnkStruct_ov42_022280A8 *arg0);
void ov42_02228068(UnkStruct_ov42_022280A8 *arg0, UnkStruct_ov42_02228EB0 *arg1);
void ov42_0222807C(UnkStruct_ov42_022280A8 *arg0);
u32 ov42_022280A8(UnkStruct_ov42_022280A8 *arg0);
UnkStruct_ov42_02228110 *ov42_022280B8(UnkStruct_ov42_022280A8 *arg0, UnkStruct_ov42_02122667 *arg1);
void ov42_02228100(void *arg0);
UnkStruct_ov42_02228110 *ov42_02228110(UnkStruct_ov42_022280A8 *arg0, u8 arg1);
UnkStruct_ov42_02228110 *ov42_02228148(UnkStruct_ov42_022280A8 *arg0, u16 arg1);
UnkStruct_ov42_02228110 *ov42_02228178(UnkStruct_ov42_022280A8 *arg0, u8 arg1);
UnkStruct_ov42_02228110 *ov42_02228180(UnkStruct_ov42_022280A8 *arg0, u16 arg1);
s32 ov42_02228188(UnkStruct_ov42_02228110 *arg0, s32 arg1);
void ov42_022281F8(UnkStruct_ov42_02228110 *arg0, u32 arg1, s32 arg2);
UnkStruct_ov44_02232914 ov42_02228270(UnkStruct_ov44_02232914 arg0, s32 arg1);
u8 ov42_022282A4(s32 arg0);
UnkStruct_ov42_02228110 *ov42_022282B0(UnkStruct_ov42_022280A8 *arg0);
UnkStruct_ov44_02232914 ov42_022282DC(UnkStruct_ov42_02228110 *arg0);
UnkStruct_ov44_02232914 ov42_022282E8(UnkStruct_ov42_02228110 *arg0);
UnkStruct_ov44_02232914 ov42_022282F4(UnkStruct_ov42_02228110 *arg0);
void ov42_0222839C(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1);
void ov42_022283AC(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1);
UnkStruct_ov42_02228110 *ov42_022283BC(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_022280A8 *arg1, s32 arg2);
UnkStruct_ov42_02228110 *ov42_022284A4(UnkStruct_ov42_022280A8 *arg0, UnkStruct_ov44_02232914 arg1);
void ov42_02228548(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02228EB0 *arg1);
void ov42_02228574(UnkStruct_ov42_02228110 *arg0);
void ov42_022285A4(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2);
void ov42_022285FC(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2);
void ov42_02228668(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2);
void ov42_02228700(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2);
void ov42_02228798(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2);
void ov42_022287F0(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2);
void ov42_0222885C(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2);
void ov42_022288F4(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2);
void ov42_0222898C(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2);
void ov42_022289F8(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2);
void ov42_02228A64(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2);
void ov42_02228AD0(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2);
s32 ov42_02228B3C(UnkStruct_ov42_02228110 *arg0);
s32 ov42_02228B40(UnkStruct_ov42_02228110 *arg0);
s32 ov42_02228B48(UnkStruct_ov42_02228110 *arg0);
s32 ov42_02228B88(UnkStruct_ov42_02228110 *arg0);
s32 ov42_02228BC8(UnkStruct_ov42_02228110 *arg0);
s32 ov42_02228BCC(UnkStruct_ov42_02228110 *arg0);
s32 ov42_02228BD4(UnkStruct_ov42_02228110 *arg0);
UnkStruct_ov44_02232914 ov42_02228BDC(UnkStruct_ov44_02232914 arg0, s32 arg1);
s32 ov42_02228C0C(UnkStruct_ov42_02228110 *arg0);
void ov42_02228C40(UnkStruct_ov42_02228110 *arg0);
s32 ov42_02228C80(UnkStruct_ov42_02227F68 *arg0, UnkStruct_ov42_022280A8 *arg1, UnkStruct_ov42_02228CDC *arg2, UnkStruct_ov42_02228EB0 *arg3);

s32 ov42_02228CDC(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4);
s32 ov42_02228D08(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4);
s32 ov42_02228D44(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4);
s32 ov42_02228DB8(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4);
s32 ov42_02228DC8(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4);
s32 ov42_02228DF0(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4);
s32 ov42_02228DFC(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4);
s32 ov42_02228E0C(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4);
s32 ov42_02228E34(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, u8 arg2);
BOOL ov42_02228E9C(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_022280A8 *arg1, u8 arg2);
void ov42_02228EB0(UnkStruct_ov42_02228EB0 *arg0, UnkStruct_ov42_02228110 *arg1, u16 arg2, u8 arg3, s32 arg4);
UnkStruct_ov42_02228EDC *ov42_02228EDC(SpriteList *arg0, PaletteData *arg1, u16 arg2, s8 arg3, enum HeapID heapID);
UnkStruct_ov42_02228EDC *ov42_02228F24(SpriteList *arg0, PaletteData *arg1, u16 arg2, s32 arg3, s32 arg4, s32 arg5, enum HeapID heapID);
void ov42_02228F94(UnkStruct_ov42_02228EDC *arg0);
void ov42_02228FE0(UnkStruct_ov42_02228EDC *arg0, s32 arg1, s32 arg2, enum HeapID heapID);
void ov42_02229004(UnkStruct_ov42_02228EDC *arg0, s32 arg1);
s32 ov42_02229010(UnkStruct_ov42_02228EDC *arg0, s32 arg1);
void ov42_0222901C(UnkStruct_ov42_02228EDC *arg0);
void ov42_02229028(UnkStruct_ov42_02228EDC *arg0, s32 arg1, enum HeapID heapID);
UnkStruct_ov42_0222903C *ov42_0222903C(UnkStruct_ov42_02228EDC *arg0, UnkStruct_ov42_02228110 *arg1, u32 arg2, enum HeapID heapID);
void ov42_022290C4(UnkStruct_ov42_0222903C *arg0);
void ov42_022290DC(UnkStruct_ov42_02228EDC *arg0);
void ov42_0222910C(UnkStruct_ov42_0222903C *arg0);
void ov42_0222919C(UnkStruct_ov42_0222903C *arg0, s8 arg1);
void ov42_022291A0(UnkStruct_ov42_0222903C *arg0);
void ov42_022291AC(UnkStruct_ov42_0222903C *arg0);
void ov42_022291B8(UnkStruct_ov42_0222903C *arg0);
void ov42_022291D8(UnkStruct_ov42_0222903C *arg0, UnkStruct_ov44_02232914 arg1);
s32 ov42_022291F4(UnkStruct_ov42_0222903C *arg0);
void ov42_02229200(UnkStruct_ov42_0222903C *arg0, u16 arg1);
u16 ov42_0222920C(UnkStruct_ov42_0222903C *arg0);
void ov42_02229218(UnkStruct_ov42_0222903C *arg0, s32 arg1);
u32 ov42_0222922C(s16 arg0, u8 arg1);
u8 ov42_02229248(UnkStruct_ov42_0222903C *arg0);
void ov42_02229258(UnkStruct_ov42_0222903C *arg0, UnkStruct_ov44_02232914 arg1);
s32 ov42_02229274(UnkStruct_ov42_0222903C *arg0);
UnkStruct_ov42_0222903C *ov42_02229284(UnkStruct_ov42_02228EDC *arg0);
u8 ov42_022292BC(UnkStruct_ov42_02227114 *arg0, s32 arg1);
void ov42_022292D8(UnkStruct_ov42_0222903C *arg0, s16 *arg1, s16 *arg2);
void ov42_02229308(UnkStruct_ov42_0222903C *arg0, u8 arg1, s32 arg2);
void ov42_02229358(UnkStruct_ov44_02232914 *arg0, UnkStruct_ov42_02228110 *arg1);
void ov42_02229394(UnkStruct_ov44_02232914 *arg0);
void ov42_022293A0(UnkStruct_ov44_02232914 *arg0, s16 arg1, s16 arg2);
s16 ov42_022293A8(UnkStruct_ov44_02232914 *arg0);
s16 ov42_022293B0(UnkStruct_ov44_02232914 *arg0);
UnkStruct_ov42_022293B8 *ov42_022293B8(G2dRenderer *g2dRenderer, BgConfig *bgConfig, u8 *arg2, enum HeapID heapID);
void ov42_0222940C(UnkStruct_ov42_022293B8 *arg0);
void ov42_02229420(UnkStruct_ov42_022293B8 *arg0, UnkStruct_ov44_02232914 *arg1);
void ov42_02229514(BgConfig *bgConfig, s32 arg1, u8 *arg2);
void ov42_02229570(UnkStruct_ov42_022293B8 *arg0, s16 arg1, s16 arg2);
void ov42_02229600(BgConfig *bgConfig, s32 arg1, NNSG2dScreenData *nnsg2dScreenData, s16 arg3, s16 arg4);
void ov42_022296F0(BgConfig *bgConfig, u8 arg1, u8 arg2, u8 arg3, u8 arg4, u8 arg5, void *arg6, u8 arg7, u8 arg8, u8 arg9, u8 argA);
u8 ov42_02229880(u8 arg0, u8 arg1);
void *ov42_022298B4(void *arg0, u8 arg1, u8 arg2, u8 arg3, u8 arg4, u8 arg5, UnkStruct_ov44_02232914 *arg6);
UnkStruct_ov42_02229A40 *ov42_02229974(s32 arg0, enum HeapID heapID);
void ov42_022299AC(u32 *arg0);
void ov42_022299C0(UnkStruct_ov42_022299C0 *arg0, UnkStruct_ov44_02232031 *arg1);
s32 ov42_02229A08(UnkStruct_ov42_022299C0 *arg0, UnkStruct_ov44_02232031 *arg1);
UnkStruct_ov42_02229A40 *ov42_02229A40(s32 arg0, enum HeapID heapID);
void ov42_02229A78(UnkStruct_ov42_02229A40 *arg0);
void ov42_02229A8C(UnkStruct_ov42_02229A40 *arg0, UnkStruct_ov42_02228CDC *arg1);
u32 ov42_02229AC8(UnkStruct_ov42_02229A40 *arg0, UnkStruct_ov42_02228CDC *arg1);

#endif // POKEHEARTGOLD_OVY_42_H
