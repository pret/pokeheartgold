#ifndef POKEHEARTGOLD_BATTLE_INPUT_H
#define POKEHEARTGOLD_BATTLE_INPUT_H

#include "battle/battle_cursor.h"
#include "battle/battle_finger.h"
#include "battle/battle_system.h"

#include "bg_window.h"
#include "obj_char_transfer.h"
#include "sys_task_api.h"
#include "touchscreen.h"
#include "unk_02013534.h"

typedef struct BattleInputMainScreen {
    u8 battlerType;
    u8 battlerId;
    u8 selectedMon;
    u8 unk3;
    s16 hp;
    u16 maxHp;
    u8 cancelRun;
    u8 unused[3];
} BattleInputMainScreen;

typedef struct BattleInputFightMenu {
    u16 moveNo[4];
    u8 pp[4];
    u8 ppMax[4];
    u8 battlerType;
} BattleInputFightMenu;

typedef struct BattleInputTargetScreen {
    TargetPokemon targetMons[4];
    u8 battlerType;
    u8 selectionType;
} BattleInputTargetScreen;

typedef struct BattleInputYesNoScreen {
    u16 moveNo;
    u16 unused;
} BattleInputYesNoScreen;

typedef union BattleInputMenu {
    BattleInputMainScreen main;
    BattleInputFightMenu fight;
    BattleInputTargetScreen target;
    BattleInputYesNoScreen yesNo;
} BattleInputMenu;

typedef struct BattleInput_UnkSub14 {
    void *unk0;
    u8 unk4;
    s8 unk5;
} BattleInput_UnkSub14;

typedef struct BattleInputMove {
    u16 moveNo[4];
    u16 pp[4];
    u16 ppMax[4];
} BattleInputMove;

typedef struct BattleInput_UnkSub54_Unk28 {
    Window window;
    u16 unkC;
    u16 unkE;
} BattleInput_UnkSub54_Unk28;

typedef struct BattleInputMoveMemory {
    BattleInputMove move;
    u16 *typeIcon[4];
    BattleInput_UnkSub54_Unk28 unkMove[4];
    BattleInput_UnkSub54_Unk28 unkPp[4];
    BattleInput_UnkSub54_Unk28 unkPpMax[4];
} BattleInputMoveMemory;

typedef struct BattleInputTextObject {
    FontOAM *unk0;
    UnkStruct_02021AC8 unk4;
    u16 unk20;
} BattleInputTextObject;
typedef struct {
    BattleInput *battleInput;
    SysTask *unk_04;
    s16 unk_08;
    s16 unk_0A;
    s16 unk_0C;
    s16 unk_0E;
    s16 unk_10;
    u8 battlerId;
    u8 state;
} BattleMenuSlideIn;
typedef struct BallGaugeAnimation {
    s16 xOffset;
    u8 percentExpToNextLevel;
    u8 state;
    u8 animationType;
    u8 delay;
    u8 count;
    u8 countMax;
    u8 loop;
} BallGaugeAnimation;

typedef struct S16Pos {
    s16 x;
    s16 y;
} S16Pos;

typedef struct BattleInputFeedback {
    s16 state;
    s16 delay;
    union {
        struct {
            u8 unk4;
        } param;
        struct {
            int unk4;
        } move;
        struct {
            const s16 *unk4;
            void *unk8;
            int ret;
            u8 unk10;
            u8 unk11;
            u8 unk12;
            u8 unk13;
            u8 unk14;
            S16Pos pos;
        } unk;
        struct {
            void *unk4[4];
            void *unk14;
            NNSG2dCharacterData *unk18;
            void *unk1C;
            int ret;
        } monSelect;
        struct {
            s16 *unk4;
            TouchscreenHitbox *unk8;
        } unkBugContest;
        s16 unk4[2];
    };
} BattleInputFeedback;
typedef struct {
    s8 commandX;
    s8 commandY;
    s8 moveX;
    s8 moveY;
    s8 unk_04;
    s8 unk_05;
    s8 unk_06;
    u8 unk_07[1];
} BattleCursorPosition;
typedef struct BattleInputColor {
    int ret;
    s16 unk4;
    s16 unk6;
    u8 state;
    u8 pal;
} BattleInputColor;

typedef struct BattleMenuCursor {
    u8 enabled;
    s8 menuY;
    s8 menuX;
    u8 unused;
} BattleMenuCursor;
typedef struct BattleInputTutorial {
    BattleFinger *finger;
    u8 state;
    u8 substate;
    u8 delay;
} BattleInputTutorial;

// At somepoint here my counting was off so some of the listed offsets may be wrong. Due to it being a big and poorly put together struct, it's difficult to find out where that is
struct BattleInput {
    BattleSystem *battleSystem;
    u8 *unk4; //when non-null, allows for keyPressed to be set to unk4[0]; heldKeys?
    SysTask *ballTask;
    SysTask *unkC;
    SysTask *unk10;
    BattleInput_UnkSub14 unk14;
    BattleInputMenu menu;
    u16 *screenBuffer[7];
    u16 *paletteBuffer;
    u16 *bgPalNormal;
    u16 *bgPalTouch;
    SysTask *bgTask; //Handles the subscreen background palette update; only ever set to Task_BattleMenuMessageWaitForTouchResponse
    BattleInputMoveMemory unk54[4]; //Holds the move display info for ALL the currently active pokemon
    void *fontSystem;
    BattleInputTextObject textObj[13];
    void *unk67C; //5B8
    ManagedSprite *spriteBallGauge[6];
    ManagedSprite *spriteBallGaugeOpponent[6];
    ManagedSprite *spriteTypeIcons[4];
    ManagedSprite *spriteCategoryIcons[4]; //Never gets set
    ManagedSprite *unk6C0[4];
    SysTask *unk6D0[4];
    BallGaugeAnimation ballGaugeAnimation[6];
    SysTask *unk6E8;
    u8 unused_668; 
    u8 unused_669; 
    u8 unk6EE; //battler type
    s8 curMenuId;
    u8 unk6F0; //selection type
    u8 gender;
    u8 isTouchDisabled; //touchDisabled?
    u8 unk6F3; //true when cancel is displayed, false when run is displayed
    u8 unk6F4;
    s16 unk6F5;
    u8 unk6F7;
    s16 unk6F8;
    SysTask *unk6FC; //fade task?
    BattleInputFeedback unk700;
    BattleInputColor color;
    s32 scrollXEdge;
    s32 scrollXSpeed;
    s32 scrollXEnd;
    BattleCursor *cursor;
    BattleMenuCursor cursorData;
    u8 keyPressed;
    u8 cancelRun; //needs a better name; controls if cancel or run should be displayed as the bottom middle button in the current menu
    BattleInputTutorial tutorial;
    ManagedSprite *unk_6EC;
    ManagedSprite *spriteBugNet;
    ManagedSprite *spriteSportBall;
};

BattleInput *BattleInput_New();
void BgConfig_InitBattleMenuBackgrounds(BgConfig *config);
void BgConfig_CleanupBattleMenuBackgrounds(BgConfig *config);
void *BattleInput_NewInit(NARC *a0, NARC *a1, BattleSystem *battleSystem, u32 gender, u8 *a4);
void BattleInput_Free(BattleInput *battleInput);
void BattleInput_LoadDefaultResources(BattleInput *battleInput);
void BattleInput_ChangeMenu(NARC *narc0, NARC *narc1, BattleInput *battleInput, int menuId, int a4, int *a5);
void BattleInput_LoadBallGaugeResources(NARC *narc, BattleInput *battleInput);
void BattleInput_SetPartyExpPercents(BattleInput *battleInput, u8 *a1);
void BattleInput_UpdateBallGaugeAnimation(BattleInput *battleInput, u8 *a1, u8 *a2);
void BattleInput_EnableBallGauge(BattleInput *battleInput);
void BattleInput_DisableBallGauge(BattleInput *battleInput);
int BattleInput_CheckTouch(BattleInput *battleInput);
BOOL BattleInput_CheckFeedbackDone(BattleInput *battleInput);
int ov12_02266C84(int moveRange, int battlerId);
void BattleInput_StartMenuScrollHorizontalTask(BattleInput *battleInput, int xSpeed, int xEnd);





void BattleInput_CreateMenuObjectsInitial(BattleInput *battleInput, int a1, int a2);
void ov12_02266F84(BattleInput *battleInput, int a1, int a2);
void ov12_02267388(BattleInput *battleInput, int param1, int param2);
void ov12_0226739C(BattleInput *battleInput, int a1, int a2);
void ov12_02267404(BattleInput *battleInput, int param1, int param2);
void ov12_02267418(BattleInput *battleInput, int param1, int param2);
void ov12_0226748C(BattleInput *battleInput, int param1, int param2);
void ov12_02267760(BattleInput *battleInput, int param1, int param2);
void ov12_022677FC(BattleInput *battleInput, int param1, int param2);
void ov12_02267984(BattleInput *battleInput, int param1, int param2);
void ov12_02267A58(BattleInput *battleInput, int param1, int param2);
void ov12_02267B40(BattleInput *battleInput, int param1, int param2);
void ov12_02267C24(BattleInput *battleInput, int param1, int param2);
int ov12_02267E14(BattleInput *battleInput, int param1, int param2);
int ov12_02267EF0(BattleInput *battleInput, int param1, int param2);
int ov12_02267FA0(BattleInput *battleInput, int param1, int param2);
int ov12_02268024(BattleInput *battleInput, int param1, int param2);
int ov12_02268130(BattleInput *battleInput, int param1, int param2);
void ov12_02268194(BattleInput *battleInput);
void ov12_02268214(BattleInput *battleInput);
void ov12_02268264(BattleInput *battleInput);
ManagedSprite *ov12_022682BC(BattleInput *battleInput, Pokemon *pokemon, int a2, int hp, int maxHp, int a5);
ManagedSprite *ov12_02268440(BattleInput *battleInput, Pokemon *pokemon);
void ov12_022684EC(SysTask *, void *);
int ov12_022684F8(u8 a1);
void ov12_02268520(String *str, u32 fontId, int *param2, int *param3);
void BattleInput_CreateTextObject(BattleInput *battleInput, BattleInputTextObject *textObj, String *str, u32 fontId, int textColor, int param5, int param6, int x, int y, int param9, BattleInput_UnkSub54_Unk28 *param10);
void ov12_02268684(BattleInput *battleInput);
void ov12_022686BC(BattleInput *battleInput);
BattleInputMoveMemory *ov12_02268798(BattleInput *battleInput, int battlerId);
void ov12_022687AC(BattleInput *battleInput);
void ov12_0226885C(BattleInput *battleInput, int battlerId, const BattleInputMove *moveDisplay);
void ov12_02268A64(BattleInput *battleInput, String *moveName, u32 a2, BattleInput_UnkSub54_Unk28 *a3, int color);
void BattleInput_DeleteAndFreeTypeIconGraphics(BattleInput *battleInput);
void BattleInput_DeleteAndFreeCategoryIconGraphics(BattleInput *battleInput);
void ov12_02268C30(BattleInput *battleInput, int moveType, int a2);
void ov12_02268C4C(BattleInput *battleInput, int a1);
void ov12_02268CA0(BattleInput *battleInput, int param1);
void ov12_02268D5C(void);
void ov12_02268D88(BattleInput *battleInput, int param1, int param2);
void ov12_02268DD4(BattleInput *battleInput, u8 *param1, int param2);
void ov12_02268E2C(BattleInput *battleInput, int a1, u8 *a2, int a3);
void ov12_02268E84(SysTaskFunc taskFunc, BattleInput *battleInput);
void ov12_02268EB8(BattleInput *battleInput);
void ov12_02268EE4(BattleInput *battleInput, const s16 *param1, const TouchscreenHitbox *param2, int param3, int param4);
void ov12_02268F58(SysTask *task, void *data);
void ov12_022690A8(SysTask *task, void *data);
void ov12_02269360(SysTask *task, void *data);
int ov12_02269504(int pp, int maxPp);
void ov12_02269668(SysTask *task, void *data);
int ov12_02269A9C(BattleInput *battleInput, int param1);
void ov12_02269C7C(BattleInput *battleInput, int param1);
int ov12_02269CDC(BattleInput *battleInput, int param1);
int ov12_02269DD4(BattleInput *battleInput, int param1);
u32 ov12_0226A6EC(BattleMenuCursor *cursorMove, int xMax, int yMax, const u8 *moveData);
int ov12_0226A960(BattleInput *battleInput);
int ov12_0226A9B8(BattleInput *battleInput);
void ov12_0226AA8C(BattleInput *battleInput, int index);
u8 ov12_0226AC64(BattleInput *battleInput);
void BattleInput_CreateBugContestGraphics(BattleInput *battleInput);
// static functions
void ov12_022698C4(SysTask *task, void *data);
void Task_BattleMenuMessageWaitForTouchResponse(SysTask *task, void *data);
BOOL BattleSystem_IsInFrontier(BattleSystem *battleSystem);
void ov12_02268DAC(BattleInput *battleInput);
void BattleInput_FreeDefaultResources(BattleInput *battleInput);
void ov12_02269830(SysTask *task, void *data);
void Task_AnimateBallGauge(SysTask *, void *);
void BattleInput_DisableBallGauge(BattleInput *);
int BattleInput_CatchingTutorialMain(BattleInput *battleInput);
int ov12_02269A24(BattleInput *battleInput);
int ov12_022698B0(BattleInput *battleInput);
void Task_BattleMenuScrollHorizontal(SysTask *task, void *data);
void ov12_02269568(SysTask *task, void *data);
void ov12_02269774(void *data);
void ov12_02269668(SysTask *task, void *data);
void BattleInput_CreateBugContestGraphics(BattleInput *battleInput);
BattleInputMoveMemory *ov12_02268798(BattleInput *battleInput, int battlerType);
void ov12_02268AD0(BattleInput *battleInput);
void ov12_0226789C(BattleInput *battleInput, int param1, int param2);
void ov12_02268EE0(BattleInput *battleInput, int a1);
void ov12_02268EDC(BattleInput *battleInput, int a1);
void ov12_0226989C(SysTask *task, void *data);
void ov12_0226AD60(BattleInput *battleInput);
void ov12_022698AC(BattleInput *battleInput, int a1);
BattleCursorPosition *ov12_02261280(OpponentData *data);
void ov12_02269F54(BattleInput *battleInput, int param1);
int ov12_02269FA4(BattleInput *battleInput, int param1);
void ov12_0226A594(BattleInput *battleInput, int param1);
int ov12_0226A5F0(BattleInput *battleInput, int param1);
int ov12_0226A8E4(BattleInput *battleInput);
void ov12_0226A8EC(BattleInput *battleInput, int key);
int ov12_0226AA10(BattleInput *battleInput);

#endif
