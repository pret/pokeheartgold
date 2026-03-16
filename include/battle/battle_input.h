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

typedef struct BattleInputMainMenu {
    u8 battlerType;
    u8 battlerId;
    u8 selectedMon;
    u8 monIconStatus;
    s16 hp;
    u16 maxHp;
    u8 cancelRunDisplay;
    u8 unused[3];
} BattleInputMainMenu;

typedef struct BattleInputFightMenu {
    u16 moveNo[4];
    u8 pp[4];
    u8 ppMax[4];
    u8 battlerType;
} BattleInputFightMenu;

typedef struct BattleInputTargetMenu {
    TargetPokemon targetMons[4];
    u8 battlerType;
    u8 selectionType;
} BattleInputTargetMenu;

typedef struct BattleInputTwoOptionMenu {
    u16 moveNo;
    u16 unused;
} BattleInputTwoOptionMenu;

typedef union BattleInputMenu {
    BattleInputMainMenu main;
    BattleInputFightMenu fight;
    BattleInputTargetMenu target;
    BattleInputTwoOptionMenu twoOption;
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

typedef struct BattleInputMoveMemory_DisplayObj {
    Window window;
    u16 charLength;
    u16 fontLength;
} BattleInputMoveMemory_DisplayObj;

typedef struct BattleInputMoveMemory {
    BattleInputMove move;
    u16 *typeIcon[4];
    BattleInputMoveMemory_DisplayObj moveDisplay[4];
    BattleInputMoveMemory_DisplayObj ppDisplay[4];
    BattleInputMoveMemory_DisplayObj ppMaxDisplay[4];
} BattleInputMoveMemory;

typedef struct BattleInputTextObject {
    TextOBJ *textObj;
    UnkStruct_02021AC8 unk4;
    u16 fontLength;
} BattleInputTextObject;

typedef struct BattleMenuSlideIn {
    BattleInput *battleInput;
    SysTask *vblankTask;
    s16 x;
    s16 y;
    s16 xSet; // 255 - (x / 100), used in callback to set the x position explicitly
    s16 ySet; // 40 - (y / 100)
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
            const s16 *screenOffsets;
            void *unk8;
            int ret;
            u8 unk10;
            u8 textObjId;
            u8 pokemonIconIndex;
            u8 frameType;
            u8 shouldDeleteAfter;
            S16Pos pos;
        } button;
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
    u8 *unk4; // when non-null, allows for keyPressed to be set to unk4[0]; heldKeys?
    SysTask *ballTask;
    SysTask *feedbackTask;
    SysTask *unk10;
    BattleInput_UnkSub14 unk14;
    BattleInputMenu menu;
    u16 *screenBuffer[7];
    u16 *paletteBuffer;
    u16 *bgPalNormal;
    u16 *bgPalTouch;
    SysTask *bgTask;                     // Handles the subscreen background palette update; only ever set to Task_BattleMenuMessageWaitForTouchResponse
    BattleInputMoveMemory moveMemory[4]; // Holds the move display info for ALL the currently active pokemon
    void *fontSystem;
    BattleInputTextObject textObj[13];
    void *unk5B8;
    ManagedSprite *spriteBallGauge[6];
    ManagedSprite *spriteBallGaugeOpponent[6];
    ManagedSprite *spriteTypeIcons[4];
    ManagedSprite *spriteCategoryIcons[4]; // Never gets set
    ManagedSprite *spritePokemonIcons[4];
    SysTask *taskAnimatePokemonIcon[4];
    BallGaugeAnimation ballGaugeAnimation[6];
    SysTask *unused_664;
    u8 unused_668;
    u8 unused_669;
    u8 battlerType;
    s8 curMenuId;
    u8 monTargetType;
    u8 gender;
    u8 isTouchDisabled;
    u8 unk66F; // true when cancel is displayed, false when run is displayed
    u8 unk670;
    s16 unk671;
    u8 fadeDir;
    s16 fadeCur;
    SysTask *fadeTask;
    BattleInputFeedback feedback;
    BattleInputColor color;
    s32 scrollXEdge;
    s32 scrollXSpeed;
    s32 scrollXEnd;
    BattleCursor *cursor;
    BattleMenuCursor menuCursor;
    u8 keyPressed;
    u8 cancelRunDisplay;
    BattleInputTutorial tutorial;
    ManagedSprite *spriteCaughtBugIcon;
    ManagedSprite *spriteBugNet;
    ManagedSprite *spriteSportBall;
};

BattleInput *BattleInput_New(void);
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
void BattleInput_LoadFightMenuText(BattleInput *battleInput, int battlerId, const BattleInputMove *moveDisplay);
void BattleInput_Deadstriped_022698AC(BattleInput *battleInput, int unused);
int ov12_022698B0(BattleInput *battleInput);
int BattleInput_GetKeyPressed(BattleInput *battleInput);
void BattleInput_SetKeyPressed(BattleInput *battleInput, int key);
void BattleInput_PrintSystemMessage(BattleInput *battleInput, int index);
u8 BattleInput_GetCancelRunFlag(BattleInput *battleInput);

#endif
