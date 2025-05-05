#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H

#include "constants/phone_scripts.h"

#include "application/pokegear/pokegear_internal.h"

#include "daycare.h"
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

typedef struct UnkStruct_ov101_021F968C {
    u8 type;
    u8 chance;
    u16 scriptType;
    u16 scriptID;
} PhoneScriptGenericHeader;

typedef struct PokegearPhoneAppData PokegearPhoneAppData;

typedef struct PhoneContactListNode PhoneContactListNode;
struct PhoneContactListNode {
    u8 unk_00;                  // 0x00
    PhoneContact contact;       // 0x04
    PhoneContactListNode *prev; // 0x08
    PhoneContactListNode *next; // 0x0C
};

typedef struct PokegearPhoneApp_Sub0E0_Sub00C {
    u8 unk_0;                    // 0x0
    PhoneContactListNode *unk_4; // 0x4
    u8 unk_8;                    // 0x8
} PokegearPhoneApp_Sub0E0_Sub00C;

typedef struct PokegearPhoneCallContextParam {
    HeapID heapId;                     // 0x00
    MenuInputState *menuInputStatePtr; // 0x04
    Sprite *sprite;                    // 0x08
    PokegearPhoneAppData *phoneApp;    // 0x0C
    BgConfig *bgConfig;                // 0x10
    Window *window1;                   // 0x14
    Window *window2;                   // 0x18
    PaletteData *plttData;             // 0x1C
    SaveData *saveData;                // 0x20
    MomsSavings *momsSavings;          // 0x24
    PlayerProfile *playerProfile;      // 0x28
    SaveVarsFlags *saveVarsFlags;      // 0x2C
    SysInfo_RTC *rtc;                  // 0x30
    u16 playerMapSec;                  // 0x34
    u16 playerMapID;                   // 0x36
    u8 textSpeed;                      // 0x38
} PokegearPhoneCallContextParam;

typedef struct PokegearPhoneCallState {
    int state0;                          // 0x00
    int state1;                          // 0x04
    int state2;                          // 0x08
    int state3;                          // 0x0C
    PhoneBookEntry *phoneBookEntry;      // 0x10
    const PhoneCallScriptDef *scriptDef; // 0x14
    u8 callerID;                         // 0x18
    u8 isIncomingCall;                   // 0x19
    u8 unk_1A;                           // 0x1a
    u16 predefinedScriptID;              // 0x1c
    u16 scriptID;                        // 0x1e
    u16 scriptType;                      // 0x20
    u8 menuInputState;                   // 0x22
    u8 timeOfDay;                        // 0x23
    u16 hangupToneTimer;                 // 0x24
    RTCDate date;                        // 0x28
    RTCTime time;                        // 0x38
    u32 momsSavingsBalance;              // 0x44
    u16 breedingCompatibility;           // 0x48
    u8 sharedU8var;                      // 0x4A
    u8 daycareMonsLevelGrowth[2];        // 0x4B
    u8 flag0 : 1;                        // 0x4D
    u8 flag1 : 1;                        // 0x4D
    u8 flag2 : 1;                        // 0x4D
    u8 flag3 : 1;                        // 0x4D
    union {
        Pokedex *pokedex;
        Daycare *daycare;
    } miscPtr;            // 0x50
} PokegearPhoneCallState; // size: 0x54

typedef struct PokegearPhoneCallContext {
    HeapID heapId;                            // 0x00
    PokegearPhoneAppData *phoneApp;           // 0x04
    BgConfig *bgConfig;                       // 0x08
    Window *phoneCallMsgWindow;               // 0x0C
    Window *window2;                          // 0x10
    TouchscreenListMenu *touchscreenListMenu; // 0x14
    PaletteData *plttData;                    // 0x18
    SaveData *saveData;                       // 0x1C
    MomsSavings *momsSavings;                 // 0x20
    PlayerProfile *playerProfile;             // 0x24
    SaveVarsFlags *saveVarsFlags;             // 0x28
    SysInfo_RTC *rtc;                         // 0x2C
    u16 playerMapSec;                         // 0x30
    u16 playerMapID;                          // 0x32
    u8 textSpeed;                             // 0x34
    u8 textPrinter;                           // 0x35
    u8 playerGender;                          // 0x36
    u8 msgIDs[2];                             // 0x37
    MenuInputState *menuInputStatePtr;        // 0x3C
    Sprite *sprite;                           // 0x40
    MsgData *msgData_0271;                    // 0x44
    MsgData *msgData_0640;                    // 0x48
    MsgData *msgData_PhoneContact;            // 0x4C
    MessageFormat *msgFormat;                 // 0x50
    String *msgExpansionBuff;                 // 0x54
    String *contactNameBuf;                   // 0x58
    String *contactClassBuf;                  // 0x5C
    String *buf14String;                      // 0x60
    String *phoneCallMsgReadBuff;             // 0x64
    String *noSignalMsgs[3];                  // 0x68
    String *hangUpMsgs[3];                    // 0x74
    PhoneBook *phoneBook;                     // 0x80
    PhoneBookEntry *phoneEntries;             // 0x84
    PokegearPhoneCallState state;             // 0x88
} PokegearPhoneCallContext;                   // size: 0xDC

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
    PokegearPhoneCallContext *callContext;                      // 0x3FC
    MenuInputState *unk_400;                                    // 0x400
    u8 *unk_404;                                                // 0x404
} PokegearPhoneApp_Sub0E0;                                      // size 0x408

struct PokegearPhoneAppData {
    HeapID heapId;                         // 0x000
    int unk_004;                           // 0x004
    int unk_008;                           // 0x008
    PokegearAppData *pokegear;             // 0x00C
    u8 unk_010;                            // 0x010
    u8 unk_011;                            // 0x011
    u8 filler_012[2];                      // 0x012
    MsgData *unk_014;                      // 0x014
    MessageFormat *unk_018;                // 0x018
    String *unk_01C;                       // 0x01C
    String *unk_020;                       // 0x020
    String *unk_024[8];                    // 0x024
    u8 unk_044;                            // 0x044
    Window unk_048[4];                     // 0x048
    Sprite *unk_088[14];                   // 0x088
    TouchscreenListMenuSpawner *unk_0C0;   // 0x0C0
    PokegearPhoneCallContext *unk_0C4;     // 0x0C4 type pending
    u8 callerID;                           // 0x0C8
    u8 unk_0C9;                            // 0x0C9
    u8 unk_0CA;                            // 0x0CA
    u8 unk_0CB;                            // 0x0CB
    u8 unk_0CC;                            // 0x0CC
    u8 numContacts;                        // 0x0CD
    u8 filler_0CE[2];                      // 0x0CE
    PhoneContact *saveContacts;            // 0x0D0
    PhoneContactListNode *unk_0D4;         // 0x0D4
    PhoneContactListNode *contactListHead; // 0x0D8
    PhoneContactListNode *contactListTail; // 0x0DC
    PokegearPhoneApp_Sub0E0 unk_0E0;       // 0x0E0
    LISTMENUITEM *unk_4E8[7];              // 0x4E8
    TouchscreenListMenu *unk_504;          // 0x504
    void *unk_508;                         // 0x508
    NNSG2dScreenData *unk_50C;             // 0x50C
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
TouchscreenListMenu *PokegearPhoneApp_TouchscreenListMenu_Create(PokegearPhoneAppData *phoneApp, int a1, int a2);
void ov101_021F0ACC(PokegearPhoneAppData *phoneApp, u8 a1, int a2);
void ov101_021F0B84(PokegearPhoneAppData *phoneApp);
int ov101_021F0BA0(PokegearPhoneAppData *phoneApp);
int ov101_021F0C4C(PokegearPhoneAppData *phoneApp);
BOOL ov101_021F0CE4(PokegearPhoneAppData *phoneApp);
void ov101_021F0D6C(PokegearPhoneAppData *phoneApp);
void ov101_021F0D90(PokegearPhoneAppData *phoneApp);
void ov101_021F0E0C(PokegearPhoneAppData *phoneApp, PhoneContactListNode *a1, u8 a2);
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

PokegearPhoneCallContext *PhoneCall_CreateContext(const PokegearPhoneCallContextParam *template);
void PhoneCall_DestroyContext(PokegearPhoneCallContext *ctx);
String *PhoneContact_GetName(PokegearPhoneCallContext *ctx, u8 a1);
String *PhoneContact_GetClass(PokegearPhoneCallContext *ctx, u8 a1);
BOOL PhoneCall_CheckMapPermissionAndGetTimeOfDay(PokegearPhoneCallContext *ctx, u8 a1, u8 a2, u8 a3, u8 a4);
void PhoneCall_GetCallScriptId(PokegearPhoneCallContext *ctx);
BOOL ov101_021F26F8(PokegearPhoneCallContext *ctx);

void PhoneCall_InitMsgDataAndBufferNames(PokegearPhoneCallContext *ctx);
void PhoneCall_AnimateFastForwardButtonOnTouch(PokegearPhoneCallContext *ctx);
void PhoneCallMessagePrint(PokegearPhoneCallContext *ctx, MsgData *msgData, const u8 *a2);
void PhoneCallMessagePrint_Gendered(PokegearPhoneCallContext *ctx, MsgData *msgData, u8 msgIdIfEthan, u8 msgIdIfLyra);
void PhoneCallMessagePrint_Ungendered(PokegearPhoneCallContext *ctx, MsgData *msgData, u8 msgId);
BOOL PhoneCall_IsMessageDonePrinting(PokegearPhoneCallContext *ctx);
void PhoneCall_ApplyGenericNPCcallSideEffect(PokegearPhoneCallContext *ctx, const PhoneCallScriptDef *a1);
void PhoneCall_TouchscreenListMenu_Create(PokegearPhoneCallContext *ctx, u8 a1);
int PhoneCall_TouchscreenListMenu_HandleInput(PokegearPhoneCallContext *ctx);
void PhoneCall_TouchscreenListMenu_Destroy(PokegearPhoneCallContext *ctx);
const PhoneCallScriptDef *PhoneCall_GetScriptDefPtrByID(int scriptID);
void ov101_021F2384(PokegearPhoneCallContext *ctx, BOOL a1);
BOOL ov101_021F23F0(PokegearPhoneCallContext *ctx);
void ov101_021F243C(PokegearPhoneCallContext *ctx, u8 a1, u8 a2);
BOOL ov101_021F2494(PokegearPhoneCallContext *ctx);
BOOL ov101_021F2510(PokegearPhoneCallContext *ctx);
BOOL ov101_021F2598(PokegearPhoneCallContext *ctx);
BOOL PhoneCall_PrintGreeting(PokegearPhoneCallContext *ctx);
BOOL ov101_021F2680(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_Mother(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
BOOL GearPhoneCall_Mother(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_ProfElm(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
u16 PhoneCall_GetScriptId_Generic(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
BOOL GearPhoneCall_Generic(PokegearPhoneCallContext *ctx);
BOOL GearPhoneCall_Generic2(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_ProfOak(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
BOOL GearPhoneCall_ProfOak(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_Kurt(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
BOOL GearPhoneCall_Kurt(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_BikeShop(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
u16 PhoneCall_GetScriptId_Kenji(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
u16 PhoneCall_GetScriptId_Bill(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
BOOL GearPhoneCall_Bill(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_DayCareMan(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
BOOL GearPhoneCall_DayCareMan(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_DayCareLady(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
BOOL GearPhoneCall_DayCareLady(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_Buena(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
BOOL GearPhoneCall_Buena(PokegearPhoneCallContext *ctx);
BOOL GearPhoneCall_Buena2(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_EthanLyra(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
BOOL GearPhoneCall_EthanLyra(PokegearPhoneCallContext *ctx);
u8 ov101_021F3D34(PokegearPhoneCallContext *ctx);
BOOL GearPhoneCall_EthanLyra2(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_GymLeader(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
BOOL GearPhoneCall_GymLeader(PokegearPhoneCallContext *ctx);
BOOL GearPhoneCall_GymLeader2(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_Baoba(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
BOOL GearPhoneCall_Baoba(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_Irwin(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);

extern const TouchscreenHitbox ov101_021F8400;
extern const UnkStruct_ov101_021F8404 ov101_021F8404[];
extern const PhoneScriptGenericHeader ov101_021F968C[];
extern const u8 ov101_021F8760[];

extern const PhoneCallScriptDef gPhoneCallScriptDef[];
extern const u8 ov101_021F962C[][12];

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H
