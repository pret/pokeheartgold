#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H

#include "application/pokegear/pokegear_internal.h"

#include "sav_system_info.h"
#include "sprite.h"
#include "touchscreen_list_menu.h"

typedef struct UnkStruct_ov101_021F8404 {
    u8 unk_0_0 : 3;
    u8 unk_0_3 : 5;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
} UnkStruct_ov101_021F8404;

typedef struct PokegearPhoneAppData PokegearPhoneAppData;

typedef struct PokegearPhoneApp_Sub0E0_Sub00C {
    u8 filler_0[4];
    int unk_4;
    u8 unk_8;
} PokegearPhoneApp_Sub0E0_Sub00C;

typedef struct PokegearPhoneApp_Sub0E0 {
    u8 unk_000;
    u8 unk_001;
    u8 unk_002;
    u8 unk_003;
    u8 filler_004[2];
    u8 unk_006_0 : 1;
    u8 filler_07[5];
    PokegearPhoneApp_Sub0E0_Sub00C unk_00C[NUM_PHONE_CONTACTS];
    u8 filler_390[0x5C];
    Sprite *unk_3EC[4];
    u8 filler_3FC[0xC];
} PokegearPhoneApp_Sub0E0; // size 0x408

typedef struct PokegearPhoneApp_Sub0D4 {
    u8 unk_00;
    u8 unk_01;
    int unk_04;
    int unk_08;
} PokegearPhoneApp_Sub0D4;

typedef struct PokegearPhoneApp_Sub0C4Template {
    HeapID unk_00;
    MenuInputState *unk_04;
    Sprite *unk_08;
    PokegearPhoneAppData *unk_0C;
    BgConfig *unk_10;
    Window *unk_14;
    Window *unk_18;
    PaletteData *unk_1C;
    SaveData *unk_20;
    MomsSavings *unk_24;
    PlayerProfile *unk_28;
    SaveVarsFlags *unk_2C;
    SysInfo_RTC *unk_30;
    u16 unk_34;
    u16 unk_36;
    u8 unk_38;
} PokegearPhoneApp_Sub0C4Template;

typedef struct PokegearPhoneApp_Sub0C4 {
} PokegearPhoneApp_Sub0C4;

struct PokegearPhoneAppData {
    HeapID heapId;                       // 0x000
    int unk_004;                         // 0x004
    int unk_008;                         // 0x008
    PokegearAppData *pokegear;           // 0x00C
    u8 unk_010;                          // 0x010
    u8 unk_011;                          // 0x011
    u8 filler_012[2];                    // 0x012
    MsgData *unk_014;                    // 0x014
    MessageFormat *unk_018;              // 0x018
    String *unk_01C;                     // 0x01C
    String *unk_020;                     // 0x020
    String *unk_024[8];                  // 0x024
    u8 unk_044;                          // 0x044
    Window unk_048[4];                   // 0x048
    Sprite *unk_088[14];                 // 0x088
    TouchscreenListMenuSpawner *unk_0C0; // 0x0C0
    PokegearPhoneApp_Sub0C4 *unk_0C4;    // 0x0C4 type pending
    u8 unk_0C8;                          // 0x0C8
    u8 unk_0C9;                          // 0x0C9
    u8 unk_0CA;                          // 0x0CA
    u8 unk_0CB;                          // 0x0CB
    u8 unk_0CC;                          // 0x0CC
    u8 unk_0CD;                          // 0x0CD
    u8 filler_0CE[2];                    // 0x0CE
    PhoneContact *unk_0D0;               // 0x0D0
    PokegearPhoneApp_Sub0D4 *unk_0D4;    // 0x0D4
    u8 filler_0D8[0x8];                  // 0x0D4
    PokegearPhoneApp_Sub0E0 unk_0E0;     // 0x0E0
    LISTMENUITEM *unk_4E8[7];            // 0x4E8
    TouchscreenListMenu *unk_504;        // 0x504
    void *unk_508;                       // 0x508
    NNSG2dScreenData *unk_50C;           // 0x50C
}; // size: 0x510

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
void ov101_021F0464(PokegearPhoneAppData *phoneApp, BOOL a1);
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
void ov101_021F0954(PokegearPhoneAppData *phoneApp);
void ov101_021F0978(void *cb_arg);
TouchscreenListMenu *ov101_021F09B0(PokegearPhoneAppData *phoneApp, int a1, int a2);
void ov101_021F0ACC(PokegearPhoneAppData *phoneApp, u8 a1, int a2);
void ov101_021F0B84(PokegearPhoneAppData *phoneApp);
int ov101_021F0BA0(PokegearPhoneAppData *phoneApp);
int ov101_021F0C4C(PokegearPhoneAppData *phoneApp);
BOOL ov101_021F0CE4(PokegearPhoneAppData *phoneApp);
void ov101_021F0D6C(PokegearPhoneAppData *phoneApp);
void ov101_021F0D90(PokegearPhoneAppData *phoneApp);
void ov101_021F0E0C(PokegearPhoneAppData *phoneApp, int a1, u8 a2);
void ov101_021F0EB0(PokegearPhoneAppData *phoneApp, u8 a1);

void ov101_021F0F48(PokegearPhoneAppData *phoneApp);
void ov101_021F11B0(PokegearPhoneAppData *phoneApp);
void ov101_021F11E0(PokegearPhoneAppData *phoneApp, PokegearPhoneApp_Sub0E0 *a1, int a2, int a3);
void ov101_021F1290(PokegearPhoneApp_Sub0E0 *a0, int a1, int a2);
void ov101_021F1338(PokegearPhoneApp_Sub0E0 *a0, int a1);
void ov101_021F1364(PokegearPhoneApp_Sub0E0 *a0, int a1, int a2);
void ov101_021F13C8(PokegearPhoneApp_Sub0E0 *a0, int a1);
int ov101_021F1408(PokegearPhoneApp_Sub0E0 *a0);
int ov101_021F1564(PokegearPhoneApp_Sub0E0 *a0);
int ov101_021F16A8(PokegearPhoneApp_Sub0E0 *a0);
int ov101_021F1768(PokegearPhoneApp_Sub0E0 *a0, int *a1);
int ov101_021F1804(PokegearPhoneApp_Sub0E0 *a0);
void ov101_021F1808(PokegearPhoneApp_Sub0E0 *a0);
void ov101_021F1840(PokegearPhoneAppData *phoneApp);

PokegearPhoneApp_Sub0C4 *ov101_021F1D74(const PokegearPhoneApp_Sub0C4Template *template);
void ov101_021F1E80(PokegearPhoneApp_Sub0C4 *a0);

String *PhoneContact_GetName(PokegearPhoneApp_Sub0C4 *a0, int a1);
BOOL PhoneCall_CheckMapPermissionAndGetTimeOfDay(PokegearPhoneApp_Sub0C4 *a0, int a1, int a2, int a3, int a4);
void PhoneCall_GetCallScriptId(PokegearPhoneApp_Sub0C4 *a0);

BOOL ov101_021F26F8(void *a0);

extern const TouchscreenHitbox ov101_021F8400;
extern const UnkStruct_ov101_021F8404 ov101_021F8404[];

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H
