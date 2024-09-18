#ifndef POKEHEARTGOLD_BATTLE_INPUT_H
#define POKEHEARTGOLD_BATTLE_INPUT_H

#include "battle/battle_cursor.h"
#include "battle/battle_finger.h"
#include "battle/battle_system.h"

#include "bg_window.h"
#include "sys_task_api.h"

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

typedef struct BattleInputFightScreen {
    u16 moveNo[4];
    u8 pp[4];
    u8 ppMax[4];
    u8 battlerType;
} BattleInputFightScreen;

typedef struct BattleInputTargetScreen {
    TargetPokemon targetMons[4];
    u8 battlerType;
    u8 selectionType;
} BattleInputTargetScreen;

typedef struct BattleInputYesNoScreen {
    u16 moveNo;
    u16 unused;
} BattleInputYesNoScreen;

typedef union BattleInputScreen {
    BattleInputMainScreen main;
    BattleInputFightScreen fight;
    BattleInputTargetScreen target;
    BattleInputYesNoScreen yesNo;
} BattleInputScreen;

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

typedef struct BattleInput_UnkSub54 {
    BattleInputMove move;
    u16 *typeIcon[4];
    BattleInput_UnkSub54_Unk28 unkMove[4];
    BattleInput_UnkSub54_Unk28 unkPp[4];
    BattleInput_UnkSub54_Unk28 unkPpMax[4];
} BattleInput_UnkSub54;

typedef struct BattleInput_UnkSub578_Unk4 {
    u32 unk0;
    u32 unk4;
    u16 type;
    u16 unkA;
} BattleInput_UnkSub578_Unk4;

typedef struct BattleInput_UnkSub578 {
    void *unk0;
    BattleInput_UnkSub578_Unk4 unk4;
    u16 unk20;
} BattleInput_UnkSub578;

typedef struct BattleInput_UnkSub6E0 {
    s16 xOffset;
    u8 unk3;
    u8 state;
    u8 animationType;
    u8 delay;
    u8 count;
    u8 countMax;
    u8 loop;
} BattleInput_UnkSub6E0;

typedef struct BattleInputEffect {
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
            s16 *unk4;
            void *unk8;
            int ret;
            u8 unk10;
            u8 unk11;
            u8 unk12;
            u8 unk13;
            u8 unk14;
            s16 x;
            s16 y;
        } unk;
        struct {
            void *unk4[4];
            void *unk14;
            NNSG2dCharacterData *unk18;
            void *unk1C;
            int ret;
        } monSelect;
        s16 unk4[2];
    };
} BattleInputEffect;

typedef struct BattleInputColor {
    int ret;
    s16 unk4;
    s16 unk6;
    u8 state;
    u8 pal;
} BattleInputColor;

typedef struct BattleInputCurosrData {
    u8 enabled;
    u8 menuX;
    u8 menuY;
    u8 unused;
} BattleInputCurosrData;

typedef struct BattleInputTutorial {
    BattleFinger *finger;
    u8 state;
    u8 substate;
    u8 delay;
} BattleInputTutorial;

// At somepoint here my counting was off so some of the listed offsets may be wrong. Due to it being a big and poorly put together struct, it's difficult to find out where that is
typedef struct BattleInput {
    BattleSystem *bsys;
    u8 *unk4;
    SysTask *ballTask;
    SysTask *unkC;
    SysTask *unk10;
    BattleInput_UnkSub14 unk14;
    BattleInputScreen screen;
    u16 *screenBuffer[7];
    u16 *paletteBuffer;
    u16 *bgPalNormal;
    u16 *bgPalTouch;
    SysTask *bgTask;
    BattleInput_UnkSub54 unk54[4];
    void *unk574;
    BattleInput_UnkSub578 unk578[13];
    void *unk67C;
    void *unk680[6];
    void *unk698[6];
    void *unk6A0[4];
    void *unk6B0[4];
    void *unk6C0[4];
    SysTask *unk6D0[4];
    BattleInput_UnkSub6E0 unk6E0;
    SysTask *unk6E8;
    u8 unkFillerA[0x30];
    u8 unk6EC;
    u8 unk6ED;
    u8 unk6EE;
    s8 unk6EF;
    u8 unk6F0;
    u8 gender;
    u8 invalidTouch;
    u8 unk6F3;
    u8 unk6F4;
    s16 unk6F5;
    u8 unk6F7;
    s16 unk6F8;
    SysTask *unk6FC;
    BattleInputEffect unk700;
    BattleInputColor color;
    s32 unk710;
    s32 unk714;
    s32 unk718;
    BattleCursor *cursor;
    BattleInputCurosrData cursorData;
    u8 downKey;
    u8 cancelRun;
    BattleInputTutorial tutorial;
    u8 unkFiller[0xc];
} BattleInput;
void ov12_0226604C(BgConfig *config);
void ov12_022660A8(BgConfig *config);

// static functions
BattleInput *BattleInput_New();
void ov12_022698C4(SysTask *task, void *data);
void ov12_02269954(SysTask *task, void *data);

#endif
