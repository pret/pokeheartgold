#ifndef POKEHEARTGOLD_OVY_44_H
#define POKEHEARTGOLD_OVY_44_H

#include "global.h"
#include "heap.h"
#include "main.h"
#include "list_menu_2d.h"
#include "render_window.h"
#include "sprite.h"
#include "yes_no_prompt.h"
#include "unk_02009D48.h"

// overlay_44_02232E9C
typedef struct UnkStruct_ov44_02231A28 {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u16 unk6;
} UnkStruct_ov44_02231A28;

typedef struct UnkStruct_ov44_02232E80 {
    void* unk0;
    NNSG2dPaletteData* unk4;
    u8 unk8;
    u8 unk9;
    s16 unkA;
    u8 unkC;
    u8 unkD;
    s16 unkE;
    u8 unk10;
} UnkStruct_ov44_02232E80;

typedef struct UnkStruct_ov44_02232724 {
    s16 unk0;
    s16 unk2;
} UnkStruct_ov44_02232724;

typedef struct UnkStruct_ov44_02232914 {
    u16 unk0;
    u16 unk2;
} UnkStruct_ov44_02232914;

typedef struct UnkStruct_ov44_02232DA0 UnkStruct_ov44_02232DA0;
typedef struct UnkStruct_ov44_02232B74 UnkStruct_ov44_02232B74;

typedef s32 (*func_type_022328E4)(UnkStruct_ov44_02232DA0*, UnkStruct_ov44_02232B74*);
typedef void (*func_type_022328A0)(UnkStruct_ov44_02232DA0*, UnkStruct_ov44_02232B74*);

struct UnkStruct_ov44_02232B74 {
    u32 unk0;
    u32 unk4;
    s16 unk8;
    u8 unkA;
    u8 unkB;
    u16 unkC;
    u16 unkE;
    func_type_022328E4 unk10;
    void* unk14;
    func_type_022328A0 unk18;
};

typedef struct UnkStruct_ov44_02232C4C {
    s16 unk0;
    u8 unk2;
    u8 unk3;
} UnkStruct_ov44_02232C4C;

typedef struct UnkStruct_ov44_02232E2C {
    u32 unk0;
    u32 unk4;
    s16 unk8;
    s16 unkA;
    u32 unkC;
    u32 unk10;
    u32 unk14;
    u8 unk18[9];
    u8 unk21;
} UnkStruct_ov44_02232E2C;

typedef struct UnkStruct_ov44_02231A7C {
    SpriteList* unk0;
    G2dRenderer unk4;
    // u8 unk8[292];
    GF_2DGfxResMan* unk12C[4];
    SpriteResource* unk13C[4];
    SpriteResourcesHeader unk14C;
    Sprite* unk170;
    Sprite* unk174;
} UnkStruct_ov44_02231A7C;

struct UnkStruct_ov44_02232DA0 { 
    u32 unk0;
    enum HeapID unk4;
    u8 unk8;
    u8 unk9;
    s16 unkA;
    u32 unkC;
    BgConfig* unk10;
    UnkStruct_ov44_02231A7C unk14;
    UnkStruct_ov44_02232B74 unk18C[48];
    UnkStruct_ov44_02232B74* unk6CC;
    UnkStruct_ov44_02232E80 unk6D0;
    u16* unk6E4;
    u32 unk6E8;
    u32 unk6EC;
    u32 unk6F0;
    u32 unk6F4;
    u32 unk6F8;
};

typedef struct UnkStruct_ov44_0223197C {
    u8 unk0[33];
    u8 unk21;
    u8 unk22;
    u8 unk23;
    u32 unk24;
} UnkStruct_ov44_0223197C;

typedef struct UnkStruct_ov44_022319EC {
    u32 unk0;
    UnkStruct_ov44_0223197C* unk4;
    u8 unk8[0x384];
    UnkStruct_ov44_02232DA0 unk38C;
    u8 unkA88[0x94];
    MessageFormat* unkB1C;
    u8 unkB20[0x244];
    u32 unkD64;
    u8 unkD68[0x330];
    u32 unk1098;
} UnkStruct_ov44_022319EC;

s32 ov44_02229F44(s32);
void ov44_0222F510(UnkStruct_ov44_022319EC*, s32, s32);
void ov44_0222F7BC(UnkStruct_ov44_022319EC*);
s32 ov44_02231CE8(UnkStruct_ov44_02232DA0* arg0);

void ov44_02231918(UnkStruct_ov44_022319EC* arg0, s32 arg1);
s32* ov44_02231958(UnkStruct_ov44_022319EC* arg0, u32 arg1);
void ov44_02231974(void);
void ov44_0223197C(UnkStruct_ov44_022319EC* arg0, s32 arg1, s32 arg2);
void ov44_022319BC(UnkStruct_ov44_022319EC* arg0, s32 arg1);
void ov44_022319EC(UnkStruct_ov44_022319EC* arg0);
YesNoPrompt* ov44_02231A14(BgConfig* arg0, UnkStruct_ov44_02231A28* arg1, u32 arg2);
YesNoPrompt* ov44_02231A28(BgConfig* arg0, UnkStruct_ov44_02231A28* arg1, u32 arg2);
void ov44_02231A7C(UnkStruct_ov44_02232DA0* arg0, enum HeapID heapID, NARC* arg2, BgConfig* arg3, s32 arg4, u32 arg5);
void ov44_02231B4C(UnkStruct_ov44_02232DA0* arg0);
s32 ov44_02231BB0(s32* arg0);
s32 ov44_02231BB4(UnkStruct_ov44_02232DA0* arg0);
void ov44_02231C60(UnkStruct_ov44_02232DA0* arg0);
u8 ov44_02231C70(UnkStruct_ov44_02232DA0* arg0);
void ov44_02231C8C(UnkStruct_ov44_02232DA0* arg0);
void ov44_02231D48(UnkStruct_ov44_02232DA0* arg0, s32* arg1);
void ov44_02231D8C(UnkStruct_ov44_02232DA0* arg0);
void ov44_02231D94(UnkStruct_ov44_02232DA0* arg0, s32 arg1);
s32 ov44_02231D98(UnkStruct_ov44_02232DA0* arg0);
UnkStruct_ov44_02232B74* ov44_02231D9C(UnkStruct_ov44_02232DA0* arg0, s16 arg1);
UnkStruct_ov44_02232B74* ov44_02231E08(UnkStruct_ov44_02232DA0* arg0, s16 arg1, s16 arg2);
void ov44_02231E94(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1);
void ov44_02231ED4(s32* arg0);
u8 ov44_02231EF4(s32* arg0);
void ov44_02231F04(s32* arg0);
void ov44_02231F14(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1, s32 arg2);
void ov44_02231F88(s32 arg0, UnkStruct_ov44_02232B74* arg1);
void ov44_02231FA8(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1, u8 arg2);
void ov44_02231FCC(UnkStruct_ov44_02232DA0* arg0);
void ov44_02232008(UnkStruct_ov44_02232DA0* arg0);
void ov44_02232018(UnkStruct_ov44_02232DA0* arg0);
void ov44_02232028(UnkStruct_ov44_02232DA0* arg0);
s32 ov44_02232050(UnkStruct_ov44_02232DA0* arg0);
s32 ov44_02232070(UnkStruct_ov44_02232DA0* arg0);
void ov44_02232104(UnkStruct_ov44_02232DA0* arg0);
void ov44_02232158(UnkStruct_ov44_02232DA0* arg0);
void ov44_02232194(UnkStruct_ov44_02232DA0* arg0);
UnkStruct_ov44_02232B74* ov44_022321C4(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1, u16 arg2);
void ov44_02232204(UnkStruct_ov44_02232DA0* arg0, s32 arg1, s32 arg2);
void ov44_02232238(UnkStruct_ov44_02232DA0* arg0);
void ov44_02232248(UnkStruct_ov44_02232DA0* arg0, s32 arg1, NARC* arg2, s32 arg3);
void ov44_02232288(UnkStruct_ov44_02232DA0* arg0);
void ov44_02232298(UnkStruct_ov44_02231A7C* arg0, enum HeapID heapID, NARC* narc);
void ov44_022322E8(UnkStruct_ov44_02231A7C* arg0);
void ov44_02232314(UnkStruct_ov44_02231A7C* arg0, enum HeapID heapID , NARC* narc);
void ov44_0223231C(UnkStruct_ov44_02231A7C* arg0);
void ov44_02232324(UnkStruct_ov44_02231A7C* arg1, enum HeapID heapID);
void ov44_0223232C(UnkStruct_ov44_02231A7C* arg0);
void ov44_02232334(BgConfig* arg0, enum HeapID heapID);
void ov44_02232338(BgConfig* arg0);
void ov44_0223233C(BgConfig *bgConfig, enum HeapID heapID, NARC* narc);
void ov44_0223237C(UnkStruct_ov44_02231A7C* arg0, enum HeapID heapID, NARC* narc);
void ov44_0223247C(UnkStruct_ov44_02231A7C* arg0);
void ov44_022324B0(UnkStruct_ov44_02231A7C* arg0, enum HeapID heapID);
void ov44_02232530(UnkStruct_ov44_02231A7C* arg0);
void ov44_0223254C(UnkStruct_ov44_02232DA0* arg0);
void ov44_02232594(UnkStruct_ov44_02232DA0* arg0);
void ov44_022325A4(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232914 arg1, s32 arg2);
void ov44_022325F4(UnkStruct_ov44_02232DA0* arg0);
s32 ov44_02232604(UnkStruct_ov44_02232DA0* arg0);

void ov44_02232680(UnkStruct_ov44_02232DA0* arg0, u16* arg1, u32 arg2);
void ov44_02232724(UnkStruct_ov44_02232DA0* arg0, s16* arg1);
UnkStruct_ov44_02232B74* ov44_02232798(UnkStruct_ov44_02232DA0* arg0);
void ov44_022327C8(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1, s32 arg2);
void ov44_02232800(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1, s16* arg2, s16 arg3, u16 arg4, u8 arg5, s32 arg6);
s32 ov44_02232838(UnkStruct_ov44_02232B74* arg0);
void ov44_02232864(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1);
void ov44_02232884(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1);
void ov44_022328A0(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1);
void ov44_022328E4(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1);
void ov44_02232910(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1);
void ov44_02232914(UnkStruct_ov44_02232DA0 *arg0, UnkStruct_ov44_02232B74* arg1);
void ov44_022329B0(UnkStruct_ov44_02232DA0 *arg0, UnkStruct_ov44_02232B74* arg1);
s32 ov44_02232A60(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1);
s32 ov44_02232B74(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1);
s32 ov44_02232BCC(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1);
s32 ov44_02232BE4(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1);
s32 ov44_02232C30(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1);
s32 ov44_02232C48(void);
void ov44_02232C4C(UnkStruct_ov44_02232DA0* arg0, s16 arg1, u32 arg2, u16 arg3);
void ov44_02232C6C(UnkStruct_ov44_02232DA0* arg0, s16 arg1, UnkStruct_ov44_02232B74* arg2);
s32 ov44_02232C94(UnkStruct_ov44_02232B74* arg0);
void ov44_02232CA8(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1, u8 arg2);
void ov44_02232CCC(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232E80* arg1, NARC* arg2);
void ov44_02232D08(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232E80* arg1);
void ov44_02232D20(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232E80* arg1);
void ov44_02232D34(UnkStruct_ov44_02232E80* arg0);
void ov44_02232DA0(UnkStruct_ov44_02232E80* arg0);
void* ov44_02232E2C(UnkStruct_ov44_02232E80* arg0, s32 arg1);
void ov44_02232E38(UnkStruct_ov44_02232E80* arg0);
void ov44_02232E54(UnkStruct_ov44_02232E80* arg0);
void ov44_02232E5C(UnkStruct_ov44_02232E80* arg0, u8 arg1);
void ov44_02232E80(UnkStruct_ov44_02232E80* arg0);
s32 ov44_02232E90(s32 arg0);
s32 ov44_02232E9C(u32 arg0);

// overlay_44_02235340
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

typedef struct UnkStruct_ov44_022345FC {
    s16 unk0;
    s32 unk2;
} UnkStruct_ov44_022345FC;

typedef struct UnkStruct_ov44_02232F64 {
    BgConfig* bgConfig;
    MessageFormat* msgFmt;
    MsgData* msgData;
    String* string1;
    String* string2;
    u8 printerId;
    u8 unk15;
    u16 textFrameDelay;
    SpriteList* spriteList; // 0x18
    G2dRenderer g2dRenderer;
    GF_2DGfxResMan* gf2DGfxResManList[4];
    u32 unk154;
    u32 unk158;
    UnkStruct_ov44_022341C0 unk15C[4];
    Window windowList[5]; // 0x18C - 0x1DC
    struct ListMenu2D* listMenu2D;
    void* scrnDataRaw;
    NNSG2dScreenData* scrnData;
    WaitingIcon* waitingIcon; //0x218;
    void* plttDataRaw;
    NNSG2dPaletteData* plttData;
    s16 unk1F4;
    s16 unk1F6;
} UnkStruct_ov44_02232F64;

typedef struct UnkStruct_ov44_02235340 {
    u8* unk0;
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

typedef void (*func_type_022341C0)(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1);
typedef s32 (*func_type_02232F64)(UnkStruct_ov44_02235340*, UnkStruct_ov44_args*, enum HeapID);

void ov44_02232EA8(OverlayManager* overlayMananger);
s32 ov44_02232F64(OverlayManager* overlayManager, u32* arg1);
s32 ov44_022330A8(OverlayManager* arg0);
void ov44_02233100(UnkStruct_ov44_02235340* arg0, String* arg1);
void ov44_02233160(UnkStruct_ov44_02235340* arg0);
void ov44_0223317C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1);

// The following functions are likely static
s32 ov44_02234F60(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
void ov44_0223319C(UnkStruct_ov44_02235340* arg0);
s32 ov44_022331B0(UnkStruct_ov44_02235340* arg0);
void ov44_022331C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
void FreeStructOv44_02235340(UnkStruct_ov44_02235340* arg0, enum HeapID heapID);
void ov44_0223323C(void);
void InitBgAndScrnData(UnkStruct_ov44_02232F64* arg0, enum HeapID heapID);
void FreeBgAndScreenData(UnkStruct_ov44_02232F64* arg0);
void InitWindowList(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
void FreeWindowList(UnkStruct_ov44_02232F64* arg0, enum HeapID heapID);
void InitStringAndMsgData(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
void FreeStringAndMsgData(UnkStruct_ov44_02232F64* arg0);
void ov44_02233698(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
void InitSpritesAnd2DGfxResObjs(UnkStruct_ov44_02232F64* arg0, enum HeapID heapID);
void FreeSpritesAnd2DGfxResObjs(UnkStruct_ov44_02232F64* arg0);
void Wifi_LoadAndPrintTextToWindowWrapper(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 strno, enum HeapID heapID);
void Wifi_LoadAndPrintTextToWindow(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 strno, s32 arg3, enum HeapID heapID);
s32 ov44_02233914(UnkStruct_ov44_02232F64* arg0);
void ov44_02233954(UnkStruct_ov44_02232F64* arg0);
void ov44_0223398C(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, enum HeapID heapID);
void ov44_02233A34(UnkStruct_ov44_02232F64* arg0);
void ov44_02233A50(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
void ov44_02233AB8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02232F64* arg1, UnkStruct_ov44_args* arg2, s32 arg3, enum HeapID heapID);
void ov44_02233C18(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, enum HeapID heapID);
void ov44_02233C88(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, s32 arg3, enum HeapID heapID);
void ov44_02233CA0(UnkStruct_ov44_02232F64* arg0, UnkStruct_ov44_args* arg1, s32 arg2, s32 arg3, enum HeapID heapID);
void ov44_02233CCC(UnkStruct_ov44_02232F64* arg0);
void ov44_02233D08(UnkStruct_ov44_02232F64* arg0, s32 arg1);
u8 ov44_02233D38(UnkStruct_ov44_02235340* arg0, enum HeapID heapID);
void ov44_02233D8C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
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
void ov44_022340BC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
void ov44_022340EC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID);
void ov44_022341C0(UnkStruct_ov44_02235340* arg0);
void ov44_02234204(UnkStruct_ov44_02235340* arg0);
void ov44_02234224(UnkStruct_ov44_02235340* arg0, s32 arg1);
void ov44_02234248(UnkStruct_ov44_02235340* arg0);
void ov44_0223427C(UnkStruct_ov44_02235340* arg0, enum HeapID heapID);
void ov44_022342B8(UnkStruct_ov44_02235340* arg0);
void ov44_022342E0(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
void ov44_02234324(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1);
void ov44_02234328(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1);
void ov44_0223435C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1);
void ov44_02234388(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_022341C0* arg1);
void ov44_0223438C(UnkStruct_ov44_02235340* arg0);
int ov44_0223442C(UnkStruct_ov44_02235340* arg0);
void ov44_02234440(UnkStruct_ov44_02235340* arg0);
void ov44_02234450(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234458(UnkStruct_ov44_02235340* arg0);
s32 ov44_02234474(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptReadyMessage(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022344C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptUserJoinRequest(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022345C8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022345FC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptInsufficientMembers(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022346B4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptConfirmMembers(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022346E8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_0223471C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234764(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_0223479C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022347D4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022347FC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234828(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234858(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022348A8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022348C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptStopFindingMembers(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234904(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234944(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptDropAsLeader(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022349B4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_022349F4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptCancelInvites(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234A68(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234AA8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptMemberDropped(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234B18(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptToggleVoiceChat(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234B80(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234BB4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234BF0(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234C10(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptAwaitingResponse(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234C88(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234CE8(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234D28(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234D4C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234D88(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptAwaitingMembers(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234DE4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234E08(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234EA4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234EF4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234F44(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234F88(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptMemberDrop(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 ov44_02234FDC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
s32 Wifi_PromptToggleVoiceChat_(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_args* arg1, enum HeapID heapID);
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
