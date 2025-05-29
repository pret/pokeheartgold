#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_POKEGEAR_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_POKEGEAR_INTERNAL_H

#include "global.h"

#include "mail_misc.h"
#include "unk_02092BE8.h"

typedef enum PokegearAppId {
    GEAR_APP_CONFIGURE,
    GEAR_APP_RADIO,
    GEAR_APP_MAP,
    GEAR_APP_PHONE,
    GEAR_APP_CANCEL,

    GEAR_APP_NO_INPUT = -1,
} PokegearAppId;

typedef enum PokegearReturnCode {
    GEAR_RETURN_CONFIGURE,
    GEAR_RETURN_RADIO,
    GEAR_RETURN_MAP,
    GEAR_RETURN_PHONE,
    GEAR_RETURN_4,
    GEAR_RETURN_5,
    GEAR_RETURN_CANCEL,
    GEAR_RETURN_7,
    GEAR_RETURN_8,
} PokegearReturnCode;

typedef struct PokegearAppSwitchButtonSpec {
    u16 appId;
    u8 buttonLeft;
    u8 buttonRight;
    u8 buttonUp;
    u8 buttonDown;
    u8 x;
    u8 y;
    s8 leftOffset;
    s8 rightOffset;
    s8 topOffset;
    s8 bottomOffset;
} PokegearAppSwitchButtonSpec;

typedef union PokegearSpriteUnion {
    ManagedSprite *managed;
    Sprite *sprite;
} PokegearSpriteUnion;

typedef struct PokegearAppSwitchButton {
    u8 buttonsAreActive : 1;
    u8 buttonsAreManagedSprite : 1;
    u8 buttonsAre4Tiles : 1;
    u8 cursorPos;
    u8 count;
    u8 lastIndex;
    PokegearAppSwitchButtonSpec *buttonSpec;
    u8 filler_08[0x8];
    PokegearSpriteUnion cursorSprites[4];
} PokegearAppSwitchButton;

typedef struct PokegearAppSwitch {
    u16 count;
    u16 lastButtonIndex;
    PokegearAppSwitchButton *buttons;
    PokegearAppSwitchButton *lastButton;
} PokegearAppSwitch;

typedef struct UnkStruct_ov100_021E6E20_Sub8 {
    u8 unk_00;
    u8 unk_01;
    u16 unk_02;
    s16 unk_04;
    s16 unk_06;
    u8 filler_08[0x18];
    Sprite *sprite;
    u8 filler_24[0x4];
} UnkStruct_ov100_021E6E20_Sub8;

typedef struct UnkStruct_ov100_021E6E20 {
    u16 max;
    u16 num;
    u8 *unk_04; // char buffer?
    UnkStruct_ov100_021E6E20_Sub8 *unk_08;
} UnkStruct_ov100_021E6E20;

typedef struct PokegearApp_UnkSub094 {
    HeapID heapId;
    int unk_004;
    u16 unk_008;
    u16 unk_00A;
    u16 unk_00C;
    u16 unk_00E;
    SpriteList *spriteList;
    G2dRenderer unk_014;
    u8 filler_13C[4];
    GF_2DGfxResMan *unk_140[4];
    GF_2DGfxResObjList *spriteResources[4];
} PokegearApp_UnkSub094; // size: 0x160

typedef struct PokegearAppData PokegearAppData;
struct PokegearAppData {
    HeapID heapId;                              // 0x000
    u8 app;                                     // 0x004
    u8 registeredCards : 7;                     // 0x005
    u8 isSwitchApp : 1;                         // 0x005
    u8 cursorInAppSwitchZone;                   // 0x006
    u8 unk_007;                                 // 0x007
    u8 unk_008;                                 // 0x008
    u8 fadeCounter;                             // 0x009
    MenuInputState menuInputState;              // 0x00C
    MenuInputState menuInputStateBak;           // 0x010
    u8 filler_014[0x4];                         // 0x014
    int unk_018;                                // 0x018
    int appReturnCode;                          // 0x01C
    PokegearArgs *args;                         // 0x020
    SaveData *saveData;                         // 0x024
    SavePokegear *savePokegear;                 // 0x028
    SaveVarsFlags *saveVarsFlags;               // 0x02C
    Options *options;                           // 0x030
    PlayerProfile *profile;                     // 0x034
    u8 unk_038;                                 // 0x038
    u8 filler_039[0x1D];                        // 0x039
    u16 unk_056;                                // 0x056
    void (*unk_058)(PokegearAppData *, void *); // 0x058
    void (*reselectAppCB)(void *);              // 0x05C
    void (*unknownCB)(void *);                  // 0x060
    void *childAppdata;                         // 0x064
    u8 filler_068[0x4];                         // 0x068
    EasyChatArgs *easyChatArgs;                 // 0x06C
    OverlayManager *childApplication;           // 0x070
    BgConfig *bgConfig;                         // 0x074
    PaletteData *plttData;                      // 0x078
    PokegearAppSwitch *appSwitch;               // 0x07C
    RTCTime unk_080;                            // 0x080
    SpriteSystem *spriteSystem;                 // 0x08C
    SpriteManager *spriteManager;               // 0x090
    PokegearApp_UnkSub094 *unk_094;             // 0x094
    PokegearSpriteUnion unk_098[11];            // 0x098
    u16 *unk_0C4;                               // 0x0C4
    NNSG2dScreenData *unk_0C8;                  // 0x0C8
}; // size: 0xCC

typedef struct PhoneCallScriptDef {
    u8 msgIds[2];
    u16 scriptType : 4;
    u16 param0 : 12;
    u16 param1;
} PhoneCallScriptDef;

int ov100_021E5C50(u16 a0, u16 a1);
int ov100_021E5C80(PokegearAppData *pokegearApp);
BOOL PokegearApp_HandleInputModeChangeToButtons(PokegearAppData *pokegearApp);
int PokegearApp_HandleTouchInput_SwitchApps(PokegearAppData *pokegearApp);
int PokegearApp_HandleKeyInput_SwitchApps(PokegearAppData *pokegearApp);
BOOL ov100_021E5BB0(PokegearAppData *pokegearApp, BOOL a1);
void Pokegear_ClearAppBgLayers(PokegearAppData *pokegearApp);
BOOL Pokegear_RunFadeLayers123(PokegearAppData *pokegearApp, int a1);
u8 ov100_021E5DC8(PokegearAppData *pokegearApp);
BOOL ov100_021E5DDC(PokegearAppData *pokegearApp);
BOOL ov100_021E5E88(PokegearAppData *pokegearApp);
void ov100_021E5EB4(PokegearAppData *pokegearApp, int a1);
void ov100_021E5FDC(void);

void PokegearApp_VBlankCB(void *cb_args);

void ov100_021E6914(PokegearAppData *pokegearApp);
void ov100_021E6950(PokegearAppData *pokegearApp);
void PokegearApp_CreateSpriteManager(PokegearAppData *pokegearApp, int a1);
void PokegearApp_DestroySpriteManager(PokegearAppData *pokegearApp);
void PokegearApp_DrawSprites(PokegearAppData *pokegearApp);

PokegearApp_UnkSub094 *ov100_021E69F8(HeapID heapId, u16 a1, u16 a2, u16 a3, u16 a4, int a5);
void ov100_021E6A3C(PokegearApp_UnkSub094 *a0);
void ov100_021E6AB0(PokegearApp_UnkSub094 *a0);
ManagedSprite *ov100_021E6AC0(PokegearApp_UnkSub094 *a0, u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7, int a8);
void ov100_021E6C44(ManagedSprite *a0);

UnkStruct_ov100_021E6E20 *ov100_021E6E20(int a1, HeapID heapId);
void ov100_021E6E58(UnkStruct_ov100_021E6E20 *a0);
void ov100_021E6E84(UnkStruct_ov100_021E6E20 *a0);
u16 ov100_021E6EC4(UnkStruct_ov100_021E6E20 *a0, Sprite *a1);
void ov100_021E6EF4(UnkStruct_ov100_021E6E20 *a0);
void ov100_021E6F34(UnkStruct_ov100_021E6E20 *a0, u8 a1);

PokegearAppSwitch *PokegearAppSwitch_Alloc(int count, HeapID heapId);
void PokegearAppSwitch_Free(PokegearAppSwitch *appSwitch);
u16 PokegearAppSwitch_AddButtons(PokegearAppSwitch *appSwitch, const PokegearAppSwitchButtonSpec *buttonSpec, u8 numSpecs, u8 cursorPos, BOOL managedSprites, HeapID heapId, PokegearSpriteUnion cursorSprite1, PokegearSpriteUnion cursorSprite2, PokegearSpriteUnion cursorSprite3, PokegearSpriteUnion cursorSprite4);
BOOL PokegearAppSwitch_RemoveButtons(PokegearAppSwitch *appSwitch, u16 a1);
u16 PokegearAppSwitchCursor_SetCursorSpritesDrawState(PokegearAppSwitch *appSwitch, u16 index, BOOL draw);
u16 PokegearAppSwitch_SetSpecIndexAndCursorPos(PokegearAppSwitch *appSwitch, u16 index, u8 cursorPos);
u8 PokegearAppSwitch_GetCursorPos(PokegearAppSwitch *appSwitch);
u8 PokegearAppSwitch_GetSpecCursorPos(PokegearAppSwitch *appSwitch, u16 index);
u8 ov100_021E73AC(PokegearAppSwitch *appSwitch, u8 move);
u8 ov100_021E73C8(PokegearAppSwitch *appSwitch, u8 newIndex);
void PokegearAppSwitch_SetCursorSpritesAnimateFlag(PokegearAppSwitch *appSwitch, u16 index, BOOL active);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_POKEGEAR_INTERNAL_H
