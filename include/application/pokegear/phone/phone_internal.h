#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H

#include "application/pokegear/pokegear_internal.h"

#include "sav_system_info.h"
#include "sprite.h"
#include "touchscreen_list_menu.h"

typedef struct UnkStruct_ov101_021F8404 {
    u8 unk_0_0 : 3; // 0x0
    u8 unk_0_3 : 5; //
    u8 unk_1;       // 0x1
    u8 unk_2;       // 0x2
    u8 unk_3;       // 0x3
} UnkStruct_ov101_021F8404;

typedef struct PokegearPhoneAppData PokegearPhoneAppData;

typedef struct PokegearPhoneApp_Sub0D8 PokegearPhoneApp_Sub0D8;
struct PokegearPhoneApp_Sub0D8 {
    u8 unk_00;                     // 0x00
    PhoneContact contact;          // 0x04
    PokegearPhoneApp_Sub0D8 *prev; // 0x08
    PokegearPhoneApp_Sub0D8 *next; // 0x0C
};

typedef struct PokegearPhoneApp_Sub0E0_Sub00C {
    u8 unk_0;                       // 0x0
    PokegearPhoneApp_Sub0D8 *unk_4; // 0x4
    u8 unk_8;                       // 0x8
} PokegearPhoneApp_Sub0E0_Sub00C;

typedef struct PokegearPhoneApp_Sub0C4Template {
    HeapID unk_00;                // 0x00
    MenuInputState *unk_04;       // 0x04
    Sprite *unk_08;               // 0x08
    PokegearPhoneAppData *unk_0C; // 0x0C
    BgConfig *unk_10;             // 0x10
    Window *unk_14;               // 0x14
    Window *unk_18;               // 0x18
    PaletteData *unk_1C;          // 0x1C
    SaveData *unk_20;             // 0x20
    MomsSavings *unk_24;          // 0x24
    PlayerProfile *unk_28;        // 0x28
    SaveVarsFlags *unk_2C;        // 0x2C
    SysInfo_RTC *unk_30;          // 0x30
    u16 unk_34;                   // 0x34
    u16 unk_36;                   // 0x36
    u8 unk_38;                    // 0x38
} PokegearPhoneApp_Sub0C4Template;

typedef struct PokegearPhoneApp_Sub0C4_Sub88 {
    int unk_00;                       // 0x00
    u8 filler_04[4];                  // 0x04
    int unk_08;                       // 0x08
    u8 filler_0c[4];                  // 0x0C
    PhoneBookEntry *unk_10;           // 0x10
    const PhoneCallScriptDef *unk_14; // 0x14
    u8 unk_18;                        // 0x18
    u8 unk_19;                        // 0x19
    u8 unk_1A;                        // 0x1a
    u16 unk_1C;                       // 0x1c
    u16 unk_1E;                       // 0x1e
    u16 unk_20;                       // 0x20
    u8 unk_22;                        // 0x22
    u8 unk_23;                        // 0x23
    u16 unk_24;                       // 0x24
    RTCDate unk_28;                   // 0x28
    RTCTime unk_38;                   // 0x38
    u8 filler_44[0x10];               // 0x44
} PokegearPhoneApp_Sub0C4_Sub88;      // size: 0x54

typedef struct PokegearPhoneApp_Sub0C4 {
    HeapID heapId;
    PokegearPhoneAppData *unk_04;         // 0x04
    BgConfig *unk_08;                     // 0x08
    Window *unk_0C;                       // 0x0C
    Window *unk_10;                       // 0x10
    TouchscreenListMenu *unk_14;          // 0x14
    PaletteData *unk_18;                  // 0x18
    SaveData *unk_1C;                     // 0x1C
    MomsSavings *unk_20;                  // 0x20
    PlayerProfile *unk_24;                // 0x24
    SaveVarsFlags *unk_28;                // 0x28
    SysInfo_RTC *unk_2C;                  // 0x2C
    u16 unk_30;                           // 0x30
    u16 unk_32;                           // 0x32
    u8 unk_34;                            // 0x34
    u8 unk_35;                            // 0x35
    u8 unk_36;                            // 0x36
    u8 unk_37[2];                         // 0x37
    MenuInputState *unk_3C;               // 0x3C
    Sprite *unk_40;                       // 0x40
    MsgData *unk_44;                      // 0x44
    MsgData *unk_48;                      // 0x48
    MsgData *unk_4C;                      // 0x4C
    MessageFormat *unk_50;                // 0x50
    String *unk_54;                       // 0x54
    String *unk_58;                       // 0x58
    String *unk_5C;                       // 0x5C
    String *unk_60;                       // 0x60
    String *unk_64;                       // 0x64
    String *unk_68[3];                    // 0x68
    String *unk_74[3];                    // 0x74
    PhoneBook *unk_80;                    // 0x80
    PhoneBookEntry *unk_84;               // 0x84
    PokegearPhoneApp_Sub0C4_Sub88 unk_88; // 0x88
} PokegearPhoneApp_Sub0C4;                // size: 0xDC

typedef struct PokegearPhoneApp_Sub0E0_Sub394 {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u8 unk_03;
    u8 unk_04;
    u8 unk_05;
    u8 unk_06;
    u8 unk_07;
    u8 unk_08;
    u8 unk_09;
    u8 unk_0A;
    u8 unk_0B;
    u32 unk_0C;
    u32 unk_10;
    u32 unk_14;
    u32 unk_18;
} PokegearPhoneApp_Sub0E0_Sub394;

typedef struct PokegearPhoneApp_Sub0E0 {
    u8 unk_000;                                                 // 0x000
    u8 unk_001;                                                 // 0x001
    u8 unk_002;                                                 // 0x002
    u8 unk_003;                                                 // 0x003
    u8 unk_004;                                                 // 0x004
    u8 unk_005;                                                 // 0x005
    u8 unk_006_0 : 1;                                           // 0x006
    u8 unk_006_1 : 7;                                           // 0x006
    u8 unk_007_0 : 1;                                           // 0x007
    u8 unk_007_1 : 1;                                           // 0x007
    u8 unk_007_2 : 1;                                           // 0x007
    u8 unk_007_3 : 5;                                           // 0x007
    u8 unk_008_0 : 4;                                           // 0x008
    u8 unk_008_4 : 3;                                           // 0x008
    u8 unk_008_7 : 1;                                           // 0x008
    PokegearPhoneApp_Sub0E0_Sub00C unk_00C[NUM_PHONE_CONTACTS]; // 0x00C
    Window *unk_390;                                            // 0x390
    PokegearPhoneApp_Sub0E0_Sub394 unk_394[2];                  // 0x394
    Sprite *unk_3CC[2];                                         // 0x3CC
    Sprite *unk_3D4[6];                                         // 0x3D4
    Sprite *unk_3EC[4];                                         // 0x3EC
    PokegearPhoneApp_Sub0C4 *unk_3FC;                           // 0x3FC
    MenuInputState *unk_400;                                    // 0x400
    u8 *unk_404;                                                // 0x404
} PokegearPhoneApp_Sub0E0;                                      // size 0x408

struct PokegearPhoneAppData {
    HeapID heapId;                            // 0x000
    int unk_004;                              // 0x004
    int unk_008;                              // 0x008
    PokegearAppData *pokegear;                // 0x00C
    u8 unk_010;                               // 0x010
    u8 unk_011;                               // 0x011
    u8 filler_012[2];                         // 0x012
    MsgData *unk_014;                         // 0x014
    MessageFormat *unk_018;                   // 0x018
    String *unk_01C;                          // 0x01C
    String *unk_020;                          // 0x020
    String *unk_024[8];                       // 0x024
    u8 unk_044;                               // 0x044
    Window unk_048[4];                        // 0x048
    Sprite *unk_088[14];                      // 0x088
    TouchscreenListMenuSpawner *unk_0C0;      // 0x0C0
    PokegearPhoneApp_Sub0C4 *unk_0C4;         // 0x0C4 type pending
    u8 unk_0C8;                               // 0x0C8
    u8 unk_0C9;                               // 0x0C9
    u8 unk_0CA;                               // 0x0CA
    u8 unk_0CB;                               // 0x0CB
    u8 unk_0CC;                               // 0x0CC
    u8 numContacts;                           // 0x0CD
    u8 filler_0CE[2];                         // 0x0CE
    PhoneContact *saveContacts;               // 0x0D0
    PokegearPhoneApp_Sub0D8 *unk_0D4;         // 0x0D4
    PokegearPhoneApp_Sub0D8 *contactListHead; // 0x0D8
    PokegearPhoneApp_Sub0D8 *contactListTail; // 0x0DC
    PokegearPhoneApp_Sub0E0 unk_0E0;          // 0x0E0
    LISTMENUITEM *unk_4E8[7];                 // 0x4E8
    TouchscreenListMenu *unk_504;             // 0x504
    void *unk_508;                            // 0x508
    NNSG2dScreenData *unk_50C;                // 0x50C
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
void ov101_021F0E0C(PokegearPhoneAppData *phoneApp, PokegearPhoneApp_Sub0D8 *a1, u8 a2);
void ov101_021F0EB0(PokegearPhoneAppData *phoneApp, u8 a1);

void ov101_021F0F48(PokegearPhoneAppData *phoneApp);
void ov101_021F11B0(PokegearPhoneAppData *phoneApp);
void ov101_021F11E0(PokegearPhoneAppData *phoneApp, PokegearPhoneApp_Sub0E0 *a1, u8 a2, u8 a3);
void ov101_021F1290(PokegearPhoneApp_Sub0E0 *a0, u8 a1, u8 a2);
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
String *PhoneContact_GetName(PokegearPhoneApp_Sub0C4 *a0, u8 a1);
String *PhoneContact_GetClass(PokegearPhoneApp_Sub0C4 *a0, u8 a1);
BOOL PhoneCall_CheckMapPermissionAndGetTimeOfDay(PokegearPhoneApp_Sub0C4 *a0, u8 a1, u8 a2, u8 a3, u8 a4);
void PhoneCall_GetCallScriptId(PokegearPhoneApp_Sub0C4 *a0);

BOOL ov101_021F26F8(void *a0);

extern const TouchscreenHitbox ov101_021F8400;
extern const UnkStruct_ov101_021F8404 ov101_021F8404[];

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H
