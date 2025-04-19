#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H

#include "application/pokegear/pokegear_internal.h"

#include "sprite.h"
#include "touchscreen_list_menu.h"

typedef struct PokegearPhoneApp_Sub0E0 {
    u8 unk_00;
    u8 unk_01;
    u8 filler_02[4];
    u8 unk_06_0 : 1;
    u8 filler_08[0x3E4];
    Sprite *unk_3EC[4];
} PokegearPhoneApp_Sub0E0; // size unknown, currently 0x3FC

typedef struct PokegearPhoneApp_Sub0C4 {
} PokegearPhoneApp_Sub0C4;

typedef struct PokegearPhoneAppData {
    HeapID heapId;                    // 0x000
    int unk_004;                      // 0x004
    int unk_008;                      // 0x008
    PokegearAppData *pokegear;        // 0x00C
    u8 unk_010;                       // 0x010
    u8 unk_011;                       // 0x011
    u8 filler_012[2];                 // 0x012
    MsgData *unk_014;                 // 0x014
    u8 filler_018[8];                 // 0x018
    String *unk_020;                  // 0x020
    u8 filler_024[0x24];              // 0x024
    Window unk_048[2];                // 0x048
    u8 filler_068[0x5C];              // 0x068
    PokegearPhoneApp_Sub0C4 *unk_0C4; // 0x0C4 type pending
    u8 unk_0C8;                       // 0x0C8
    u8 unk_0C9;                       // 0x0C9
    u8 unk_0CA;                       // 0x0CA
    u8 unk_0CB;                       // 0x0CB
    u8 unk_0CC;                       // 0x0CC
    u8 unk_0CD;                       // 0x0CD
    u8 filler_0CE[2];                 // 0x0CE
    PhoneContact *unk_0D0;            // 0x0D0
    u8 filler_0D4[0xC];               // 0x0D4
    PokegearPhoneApp_Sub0E0 unk_0E0;  // 0x0E0
    u8 filler_4DC[0x28];              // 0x4DC
    TouchscreenListMenu *unk_504;     // 0x504
    u8 filler_508[0x8];               // 0x508
} PokegearPhoneAppData;               // size: 0x510

BOOL ov101_021EFD20(PokegearPhoneAppData *phoneApp);
BOOL ov101_021EFD7C(PokegearPhoneAppData *phoneApp);
int ov101_021EFDB4(PokegearPhoneAppData *phoneApp);
int ov101_021EFE1C(PokegearPhoneAppData *phoneApp);
int ov101_021EFEC8(PokegearPhoneAppData *phoneApp);
BOOL ov101_021EFF14(PokegearPhoneAppData *phoneApp);
BOOL ov101_021EFFBC(PokegearPhoneAppData *phoneApp);
BOOL ov101_021EFFC8(PokegearPhoneAppData *phoneApp);
BOOL ov101_021F003C(PokegearPhoneAppData *phoneApp);
void ov101_021F0080(PokegearPhoneAppData *phoneApp);
BOOL ov101_021F00BC(PokegearPhoneAppData *phoneApp);

void ov101_021F017C(PokegearPhoneAppData *phoneApp);
void ov101_021F0260(PokegearPhoneAppData *phoneApp);
void ov101_021F0284(PokegearPhoneAppData *phoneApp);
void ov101_021F0370(PokegearPhoneAppData *phoneApp);
void ov101_021F0388(PokegearPhoneAppData *phoneApp);
void ov101_021F0464(PokegearPhoneAppData *phoneApp, int a1);
void ov101_021F0578(PokegearPhoneAppData *phoneApp);
void ov101_021F05CC(PokegearPhoneAppData *phoneApp);
void ov101_021F05EC(PokegearPhoneAppData *phoneApp);
void ov101_021F0658(PokegearPhoneAppData *phoneApp);
void ov101_021F0694(PokegearPhoneAppData *phoneApp);
void ov101_021F0720(PokegearPhoneAppData *phoneApp);
void ov101_021F072C(PokegearPhoneAppData *phoneApp);
void ov101_021F0748(PokegearPhoneAppData *phoneApp);
void ov101_021F075C(PokegearPhoneAppData *phoneApp);
void ov101_021F0864(PokegearPhoneAppData *phoneApp);
void ov101_021F0880(PokegearPhoneAppData *phoneApp);
void ov101_021F08DC(PokegearPhoneAppData *phoneApp);
void ov101_021F0900(PokegearPhoneAppData *phoneApp);
void ov101_021F0944(void *cb_arg);
void ov101_021F0978(void *cb_arg);
void ov101_021F09B0(PokegearPhoneAppData *phoneApp, int a1, int a2);
void ov101_021F0ACC(PokegearPhoneAppData *phoneApp, int a1, int a2);
void ov101_021F0B84(PokegearPhoneAppData *phoneApp);
int ov101_021F0BA0(PokegearPhoneAppData *phoneApp);
int ov101_021F0C4C(PokegearPhoneAppData *phoneApp);
void ov101_021F0D6C(PokegearPhoneAppData *phoneApp);
void ov101_021F0D90(PokegearPhoneAppData *phoneApp);
void ov101_021F0EB0(PokegearPhoneAppData *phoneApp, u8 a1);

void ov101_021F1290(PokegearPhoneApp_Sub0E0 *a0, int a1, int a2);
void ov101_021F13C8(PokegearPhoneApp_Sub0E0 *a0, int a1);
int ov101_021F1804(PokegearPhoneApp_Sub0E0 *a0);
int ov101_021F0CE4(PokegearPhoneAppData *phoneApp);
void ov101_021F1338(PokegearPhoneApp_Sub0E0 *a0, int a1);

BOOL PhoneCall_CheckMapPermissionAndGetTimeOfDay(PokegearPhoneApp_Sub0C4 *a0, int a1, int a2, int a3, int a4);
void PhoneCall_GetCallScriptId(PokegearPhoneApp_Sub0C4 *a0);

BOOL ov101_021F26F8(void *a0);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H
