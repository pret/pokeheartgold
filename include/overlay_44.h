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
