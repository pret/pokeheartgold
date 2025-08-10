#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H

#include "constants/phone_scripts.h"

#include "application/pokegear/pokegear_internal.h"

#include "daycare.h"
#include "sav_system_info.h"
#include "sprite.h"
#include "touchscreen_list_menu.h"

typedef enum PokegearPhoneMainState {
    PHONE_MAIN_STATE_SETUP,
    PHONE_MAIN_STATE_INPUT_LOOP,
    PHONE_MAIN_STATE_TEARDOWN,
    PHONE_MAIN_STATE_SETUP_CALL,
    PHONE_MAIN_STATE_UNUSED_DEBUG_MAYBE,
    PHONE_MAIN_STATE_CLOSE_SUBMENU_BEFORE_CALL,
    PHONE_MAIN_STATE_PLAY_CALL,
    PHONE_MAIN_STATE_CONTEXT_MENU,
    PHONE_MAIN_STATE_SORT_CONTEXT_MENU,
    PHONE_MAIN_STATE_MOVING_CONTACTS,
    PHONE_MAIN_STATE_FADE_IN,
    PHONE_MAIN_STATE_FADE_GEAR_CLOSE,
    PHONE_MAIN_STATE_WIPE_IN,
    PHONE_MAIN_STATE_WIPE_SWITCH_APP,
    PHONE_MAIN_STATE_QUIT,
} PokegearPhoneMainState;

typedef enum PokegearPhoneContextMenu {
    PHONE_CONTEXT_MENU_CALL_SORT_QUIT,
    PHONE_CONTEXT_MENU_SORT_OPTIONS,
    PHONE_CONTEXT_MENU_SAVE_MONEY,
    PHONE_CONTEXT_MENU_DEX_EVAL,
    PHONE_CONTEXT_MENU_DEX_EVAL_JTO_NTL,
    PHONE_CONTEXT_MENU_DEX_EVAL_NTL,
    PHONE_CONTEXT_MENU_YES_NO,
    PHONE_CONTEXT_MENU_MAX,
} PokegearPhoneContextMenu;

typedef enum PokegearPhoneContextMenuTooltip {
    PHONE_TOOLTIP_SELECT_NEXT_SEARCH,
    PHONE_TOOLTIP_SELECT_WHERE_MOVE,
    PHONE_TOOLTIP_WHAT_DO,
    PHONE_TOOLTIP_SORT_TRAINER_TYPE,
    PHONE_TOOLTIP_SORT_ALPHABET,
    PHONE_TOOLTIP_SORT_LOCATION,
    PHONE_TOOLTIP_SORT_MANUAL,
    PHONE_TOOLTIP_SORT_FINISH,
    PHONE_TOOLTIP_MAX,
} PokegearPhoneContextMenuTooltip;

typedef enum PhoneCallType {
    PHONECALLTYPE_GENERIC,
    PHONECALLTYPE_MOM,
    PHONECALLTYPE_PROF_ELM,
    PHONECALLTYPE_PROF_OAK,
    PHONECALLTYPE_KURT,
    PHONECALLTYPE_BIKE_SHOP,
    PHONECALLTYPE_KENJI,
    PHONECALLTYPE_BILL,
    PHONECALLTYPE_DAYCAREMAN,
    PHONECALLTYPE_DAYCARELADY,
    PHONECALLTYPE_BUENA,
    PHONECALLTYPE_ETHAN_LYRA,
    PHONECALLTYPE_GYMLEADER,
    PHONECALLTYPE_BAOBA,
    PHONECALLTYPE_IRWIN,
    PHONECALLTYPE_UNK15,
} PhoneCallType;

typedef enum GenericPhoneCallType {
    PHONECALLGENERIC_NIL,
    PHONECALLGENERIC_RAND1,
    PHONECALLGENERIC_FIGHTPOSTROCKETS,
    PHONECALLGENERIC_POSTROCKETWEEKTIME,
    PHONECALLGENERIC_BUGCONTESTDAYS,
    PHONECALLGENERIC_DURINGROCKETS,
    PHONECALLGENERIC_RAND6,
    PHONECALLGENERIC_FIGHTPOSTROCKETSNOTBUGCONTEST,
    PHONECALLGENERIC_GIFTNOTBUGCONTEST,
    PHONECALLGENERIC_NONE = 255,
} GenericPoneCallType;

typedef struct PokegearPhoneContextMenuParam {
    u8 nItems : 3; // 0x0
    u8 width : 5;  //
    u8 baseMsg;    // 0x1
    u8 x;          // 0x2
    u8 y;          // 0x3
} PokegearPhoneContextMenuParam;

typedef struct PhoneScriptGenericHeader {
    u8 type;
    u8 chance;
    u16 scriptType;
    u16 scriptID;
} PhoneScriptGenericHeader;

typedef struct PokegearPhoneAppData PokegearPhoneAppData;

typedef struct PhoneContactListNode PhoneContactListNode;
struct PhoneContactListNode {
    u8 index;                   // 0x00
    PhoneContact contact;       // 0x04
    PhoneContactListNode *prev; // 0x08
    PhoneContactListNode *next; // 0x0C
};

typedef struct PhoneContactListUISlotData {
    u8 index;                   // 0x0
    PhoneContactListNode *node; // 0x4
    u8 contactID;               // 0x8
} PhoneContactListUISlotData;

typedef struct PokegearPhoneCallContextParam {
    HeapID heapId;                                 // 0x00
    MenuInputState *menuInputStatePtr;             // 0x04
    Sprite *sprite;                                // 0x08
    PokegearPhoneAppData *phoneApp;                // 0x0C
    BgConfig *bgConfig;                            // 0x10
    Window *window1;                               // 0x14
    Window *window2;                               // 0x18
    PaletteData *plttData;                         // 0x1C
    SaveData *saveData;                            // 0x20
    PhoneCallPersistentState *callPersistentState; // 0x24
    PlayerProfile *playerProfile;                  // 0x28
    SaveVarsFlags *saveVarsFlags;                  // 0x2C
    SysInfo_RTC *rtc;                              // 0x30
    u16 playerMapSec;                              // 0x34
    u16 playerMapID;                               // 0x36
    u8 textSpeed;                                  // 0x38
} PokegearPhoneCallContextParam;

typedef struct PokegearPhoneCallState {
    int mainState;                       // 0x00
    int scriptState;                     // 0x04
    int hangupToneState;                 // 0x08
    int unusedState;                     // 0x0C
    PhoneBookEntry *phoneBookEntry;      // 0x10
    const PhoneCallScriptDef *scriptDef; // 0x14
    u8 callerID;                         // 0x18
    u8 isIncomingCall;                   // 0x19
    u8 isScriptedCall;                   // 0x1a
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
    HeapID heapId;                                 // 0x00
    PokegearPhoneAppData *phoneApp;                // 0x04
    BgConfig *bgConfig;                            // 0x08
    Window *phoneCallMsgWindow;                    // 0x0C
    Window *window2;                               // 0x10
    TouchscreenListMenu *touchscreenListMenu;      // 0x14
    PaletteData *plttData;                         // 0x18
    SaveData *saveData;                            // 0x1C
    PhoneCallPersistentState *callPersistentState; // 0x20
    PlayerProfile *playerProfile;                  // 0x24
    SaveVarsFlags *saveVarsFlags;                  // 0x28
    SysInfo_RTC *rtc;                              // 0x2C
    u16 playerMapSec;                              // 0x30
    u16 playerMapID;                               // 0x32
    u8 textSpeed;                                  // 0x34
    u8 textPrinter;                                // 0x35
    u8 playerGender;                               // 0x36
    u8 msgIDs[2];                                  // 0x37
    MenuInputState *menuInputStatePtr;             // 0x3C
    Sprite *sprite;                                // 0x40
    MsgData *msgData_0271;                         // 0x44
    MsgData *msgData_0640;                         // 0x48
    MsgData *msgData_PhoneContact;                 // 0x4C
    MessageFormat *msgFormat;                      // 0x50
    String *msgExpansionBuff;                      // 0x54
    String *contactNameBuf;                        // 0x58
    String *contactClassBuf;                       // 0x5C
    String *buf14String;                           // 0x60
    String *phoneCallMsgReadBuff;                  // 0x64
    String *noSignalMsgs[3];                       // 0x68
    String *hangUpMsgs[3];                         // 0x74
    PhoneBook *phoneBook;                          // 0x80
    PhoneBookEntry *phoneEntries;                  // 0x84
    PokegearPhoneCallState state;                  // 0x88
} PokegearPhoneCallContext;                        // size: 0xDC

typedef struct PhoneContactListUIColors {
    u8 fg1;
    u8 bg1;
    u8 sh1;
    u8 fg3;
    u8 sh3;
    u8 fg2;
    u8 bg2;
    u8 sh2;
    u8 fg4;
    u8 sh4;
    u8 fill1;
    u8 fill2;
    u32 nameColor_Deselected;
    u32 classColor_Deselected;
    u32 nameColor_Selected;
    u32 classColor_Selected;
} PhoneContactListUIColors;

typedef struct PhoneContactListUI {
    u8 numContacts;                                          // 0x000
    u8 cursorPos;                                            // 0x001
    u8 selectedIndex;                                        // 0x002
    u8 firstContactOnPage;                                   // 0x003
    u8 lastContactIndex;                                     // 0x004
    u8 listBottomIndex;                                      // 0x005
    u8 firstBgColor : 1;                                     // 0x006
    u8 movingContacts : 7;                                   // 0x006
    u8 isScrolling : 1;                                      // 0x007
    u8 scrollDirection : 1;                                  // 0x007
    u8 isPageScroll : 1;                                     // 0x007
    u8 scrollTimer : 5;                                      // 0x007
    u8 unk_008_0 : 4;                                        // 0x008
    u8 pageScrollStep : 3;                                   // 0x008
    u8 pageScrollFailed : 1;                                 // 0x008
    PhoneContactListUISlotData slotData[NUM_PHONE_CONTACTS]; // 0x00C
    Window *window;                                          // 0x390
    PhoneContactListUIColors textColors[2];                  // 0x394
    Sprite *listScrollArrowSprites[2];                       // 0x3CC
    Sprite *moveContactArrowSprites[6];                      // 0x3D4
    Sprite *cursorSprites[4];                                // 0x3EC
    PokegearPhoneCallContext *callContext;                   // 0x3FC
    MenuInputState *menuInputStatePtr;                       // 0x400
    u8 *menuInputStateBakPtr;                                // 0x404
} PhoneContactListUI;                                        // size 0x408

struct PokegearPhoneAppData {
    HeapID heapId;                                  // 0x000
    int subtaskState;                               // 0x004
    int subsubtaskState;                            // 0x008
    PokegearAppData *pokegear;                      // 0x00C
    u8 menuInputStateBak;                           // 0x010
    u8 backgroundStyle;                             // 0x011
    MsgData *msgData;                               // 0x014
    MessageFormat *msgFormat;                       // 0x018
    String *msgFormatBuf;                           // 0x01C
    String *msgReadBuf;                             // 0x020
    String *tooltipStrings[PHONE_TOOLTIP_MAX];      // 0x024
    u8 textFrameDelay;                              // 0x044
    Window windows[4];                              // 0x048
    Sprite *sprites[14];                            // 0x088
    TouchscreenListMenuSpawner *contextMenuSpawner; // 0x0C0
    PokegearPhoneCallContext *callContext;          // 0x0C4 type pending
    u8 callerID;                                    // 0x0C8
    u8 isScriptedCall;                              // 0x0C9
    u8 callScriptID;                                // 0x0CA
    u8 isIncomingCall;                              // 0x0CB
    u8 prevMenuCursorPos;                           // 0x0CC set but not read
    u8 numContacts;                                 // 0x0CD
    PhoneContact *saveContacts;                     // 0x0D0
    PhoneContactListNode *phoneContactListNodes;    // 0x0D4
    PhoneContactListNode *contactListHead;          // 0x0D8
    PhoneContactListNode *contactListTail;          // 0x0DC
    PhoneContactListUI contactListUI;               // 0x0E0
    LISTMENUITEM *listMenuItems[7];                 // 0x4E8
    TouchscreenListMenu *touchscreenListMenu;       // 0x504
    void *pNscrFile;                                // 0x508
    NNSG2dScreenData *screenData;                   // 0x50C
}; // size: 0x510

BOOL PokegearPhone_SetUp(PokegearPhoneAppData *phoneApp);
BOOL PokegearPhone_TearDown(PokegearPhoneAppData *phoneApp);
int PokegearPhone_HandleSubmenuInput(PokegearPhoneAppData *phoneApp);
int PokegearPhone_HandleSortMenuInput(PokegearPhoneAppData *phoneApp);
int PokegearPhone_HandleMoveContactsInput(PokegearPhoneAppData *phoneApp);
BOOL ov101_021EFF14(PokegearPhoneAppData *phoneApp);
BOOL ov101_021EFFBC(PokegearPhoneAppData *phoneApp);
BOOL PokegearPhone_SetUpCallData(PokegearPhoneAppData *phoneApp);
BOOL PhoneCall_Exit(PokegearPhoneAppData *phoneApp);
void ov101_021F0080(PokegearPhoneAppData *phoneApp);
BOOL ov101_021F00BC(PokegearPhoneAppData *phoneApp);

void ov101_021F017C(PokegearPhoneAppData *phoneApp);
void ov101_021F0260(PokegearPhoneAppData *phoneApp);
void ov101_021F0284(PokegearPhoneAppData *phoneApp);
void ov101_021F0370(PokegearPhoneAppData *phoneApp);
void ov101_021F0388(PokegearPhoneAppData *phoneApp);
void PokegearPhone_SetTouchscreenDimState(PokegearPhoneAppData *phoneApp, BOOL a1);
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

void PokegearPhone_InitContextMenus(PokegearPhoneAppData *phoneApp);
void PokegearPhone_DeleteContextMenus(PokegearPhoneAppData *phoneApp);
void ov101_021F0900(PokegearPhoneAppData *phoneApp);
void PokegearPhone_OnReselectApp(void *cb_arg);
void ov101_021F0954(PokegearPhoneAppData *phoneApp);
void ov101_021F0978(void *cb_arg);
TouchscreenListMenu *PokegearPhoneApp_TouchscreenListMenu_Create(PokegearPhoneAppData *phoneApp, int prevMenuCursorPos, int menuID);
void PokegearPhone_PrintContextMenuTooltip(PokegearPhoneAppData *phoneApp, u8 tooltipId, BOOL draw);
void PokegearPhone_ReturnToContactList(PokegearPhoneAppData *phoneApp);
int PokegearPhone_HandleKeyInput_ContactList(PokegearPhoneAppData *phoneApp);
int PokegearPhone_HandleTouchInput(PokegearPhoneAppData *phoneApp);
BOOL PokegearPhone_HandleInput_MovingContacts(PokegearPhoneAppData *phoneApp);
void PokegearPhone_ContactList_CreateLinkedList(PokegearPhoneAppData *phoneApp);
void PokegearPhone_ContactList_FlushAndDestroyLinkedList(PokegearPhoneAppData *phoneApp);
void PokegearPhone_ContactList_InsertNode(PokegearPhoneAppData *phoneApp, PhoneContactListNode *newNode, u8 index);
void PokegearPhone_SortList(PokegearPhoneAppData *phoneApp, u8 sortParam);

void PokegearPhone_InitContactListUI(PokegearPhoneAppData *phoneApp);
void PokegearPhone_ContactLinkedListToSlotsArray(PokegearPhoneAppData *phoneApp);
void PokegearPhone_SetContactListUIAndDraw(PokegearPhoneAppData *phoneApp, PhoneContactListUI *ui, u8 firstContactOnPage, u8 cursorPos);
void PhoneContactListUI_SetCursorSpritePos(PhoneContactListUI *ui, u8 position, u8 visible);
void PhoneContactListUI_ShowMainListCursorSprites(PhoneContactListUI *ui, BOOL animate);
void PhoneContactListUI_UpdateMoveContactArrowSprites(PhoneContactListUI *ui, int cursorPos, BOOL show);
void PhoneContactListUI_SetMovingContactsState(PhoneContactListUI *ui, BOOL moving);
int PhoneContactListUI_HandleKeyInput(PhoneContactListUI *ui);
int PhoneContactListUI_HandleKeyInput2(PhoneContactListUI *ui);
int PhoneContactListUI_HandleTouchInput(PhoneContactListUI *ui);
int PhoneContactListUI_HandleTouchInput2(PhoneContactListUI *ui, int *gotTouch);
int PhoneContactListUI_GetCursorPos(PhoneContactListUI *ui);
void PhoneContactListUI_DeselectContact(PhoneContactListUI *ui);
void PokegearPhone_InitContactsLinkedList(PokegearPhoneAppData *phoneApp);

PokegearPhoneCallContext *PhoneCall_CreateContext(const PokegearPhoneCallContextParam *template);
void PhoneCall_DestroyContext(PokegearPhoneCallContext *ctx);
String *PhoneContact_GetName(PokegearPhoneCallContext *ctx, u8 callerID);
String *PhoneContact_GetClass(PokegearPhoneCallContext *ctx, u8 callerID);
BOOL PhoneCall_InitContext(PokegearPhoneCallContext *ctx, u8 callerId, u8 incomingCall, u8 scriptedFlag, u8 scriptID);
void PhoneCall_GetCallScriptId(PokegearPhoneCallContext *ctx);
BOOL PhoneCall_Main(PokegearPhoneCallContext *ctx);

void PhoneCall_InitMsgDataAndBufferNames(PokegearPhoneCallContext *ctx);
void PhoneCall_AnimateFastForwardButtonOnTouch(PokegearPhoneCallContext *ctx);
void PhoneCallMessagePrint(PokegearPhoneCallContext *ctx, MsgData *msgData, const u8 *msgIDs);
void PhoneCallMessagePrint_Gendered(PokegearPhoneCallContext *ctx, MsgData *msgData, u8 msgIdIfEthan, u8 msgIdIfLyra);
void PhoneCallMessagePrint_Ungendered(PokegearPhoneCallContext *ctx, MsgData *msgData, u8 msgId);
BOOL PhoneCall_IsMessageDonePrinting(PokegearPhoneCallContext *ctx);
void PhoneCall_ApplyGenericNPCcallSideEffect(PokegearPhoneCallContext *ctx, const PhoneCallScriptDef *scriptDef);
void PhoneCall_TouchscreenListMenu_Create(PokegearPhoneCallContext *ctx, u8 menuID);
int PhoneCall_TouchscreenListMenu_HandleInput(PokegearPhoneCallContext *ctx);
void PhoneCall_TouchscreenListMenu_Destroy(PokegearPhoneCallContext *ctx);
const PhoneCallScriptDef *PhoneCall_GetScriptDefPtrByID(int scriptID);
void ov101_021F2384(PokegearPhoneCallContext *ctx, BOOL undim);
BOOL PhoneCall_WaitButtonBeforeHangup(PokegearPhoneCallContext *ctx);
void PhoneCall_NoSignalMessage(PokegearPhoneCallContext *ctx, u8 kind, u8 stage);
BOOL PhoneCall_InitialRing(PokegearPhoneCallContext *ctx);
BOOL PhoneCall_HangupTone(PokegearPhoneCallContext *ctx);
BOOL PhoneCall_HangupNoTone(PokegearPhoneCallContext *ctx);
BOOL PhoneCall_PrintGreeting(PokegearPhoneCallContext *ctx);
BOOL GearPhoneCall_Simple(PokegearPhoneCallContext *ctx);
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
BOOL GearPhoneCall_GymLeader_Outgoing(PokegearPhoneCallContext *ctx);
BOOL GearPhoneCall_GymLeader_Incoming(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_Baoba(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
BOOL GearPhoneCall_Baoba(PokegearPhoneCallContext *ctx);
u16 PhoneCall_GetScriptId_Irwin(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);

extern const TouchscreenHitbox ov101_021F8400;
extern const PokegearPhoneContextMenuParam sContextMenuParam[];
extern const PhoneScriptGenericHeader sGenericPhoneCallHeaders[];
extern const u8 ov101_021F8760[];

extern const PhoneCallScriptDef gPhoneCallScriptDef[];
extern const u8 sGreetingMsgIDs[][12];

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_PHONE_INTERNAL_H
