#ifndef POKEHEARTGOLD_BERRY_POTS_APP_INTERNAL_H
#define POKEHEARTGOLD_BERRY_POTS_APP_INTERNAL_H

#include "game_stats.h"
#include "launch_application.h"
#include "overlay_16.h"
#include "sprite.h"
#include "touchscreen_list_menu.h"

enum BerryPotsApp_022036FC_Action {
    BERRY_POTS_APP_022036FC_ACTION_0,
    BERRY_POTS_APP_022036FC_ACTION_1,
    BERRY_POTS_APP_022036FC_ACTION_2,
    BERRY_POTS_APP_022036FC_ACTION_3,
    BERRY_POTS_APP_022036FC_ACTION_4,
    BERRY_POTS_APP_022036FC_ACTION_5,
    BERRY_POTS_APP_022036FC_ACTION_6,
    BERRY_POTS_APP_022036FC_ACTION_7,
    BERRY_POTS_APP_022036FC_ACTION_8,
    BERRY_POTS_APP_022036FC_ACTION_9,
    BERRY_POTS_APP_022036FC_ACTION_10,
    BERRY_POTS_APP_022036FC_ACTION_11,
    BERRY_POTS_APP_022036FC_ACTION_12,
    BERRY_POTS_APP_022036FC_ACTION_13,
    BERRY_POTS_APP_022036FC_ACTION_14,
    BERRY_POTS_APP_022036FC_ACTION_15,
    BERRY_POTS_APP_022036FC_ACTION_16,
};

typedef struct BerryPotsAppArgs_UnkSub4 {
    u8 unk0[4];
    MenuInputStateMgr *menuInputPtr;
    u8 unk8[4];
    SaveData *savedata;
} BerryPotsAppArgs_UnkSub4;

typedef struct BerryPotsAppArgs {
    u8 unk0[4];
    BerryPotsAppArgs_UnkSub4 *unk4;
    u8 unk8[0xC];
    u8 unk14;
    u8 unk15;
    u16 itemId;
} BerryPotsAppArgs;

typedef struct BerryPotsAppData_UnkSub20 {
    u8 berryId;
    u8 growthStage;
    u8 unk2;
    u8 moisture;
    u8 mulch;
    u8 quantityOrYieldMaybe;
    u16 unk6;
    u16 unk8;
    u8 soilState;
    u8 unkB;
    u8 unkC;
    u8 unkD;
    Sprite *soilSpriteMaybe;
} BerryPotsAppData_UnkSub20;

typedef struct BerryPotsAppData {
    HeapID heapId;
    BerryPotsAppArgs *args;
    void *unk8;
    Bag *bag;
    GameStats *stats;
    BerryPot *berryPots;
    struct GF_RTC_DateTime *berryDatetime;
    UnkStruct_ov16_022014A0 *berryGrowthProperties;
    BerryPotsAppData_UnkSub20 unk20[MAX_BERRY_POT];
    u16 state70;
    u16 state72;
    MenuInputState fieldMenuState;
    u8 textFrameDelay;
    u8 frame;
    u8 unk7A;
    u8 unk7B;
    u8 unk7C;
    u8 runningTasks;
    u8 unk7E;
    u8 waitFrames;
    u8 unk80;
    u8 unk81;
    u16 totalBerryQuantity;
    u16 totalMulchQuantity;
    BgConfig *bgConfig;
    TouchscreenListMenuSpawner *menuSpawner;
    u8 unk90[12];
    MsgData *msgData;
    MessageFormat *msgFmt;
    String *currentStatusString;
    String *cancelString;
    u8 unkAC[4];
    String *statusStrings[17];
    u8 unkF4[8];
    Window windows[3];
    void *unk12C;
    SpriteSystem *spriteRenderer;
    SpriteManager *spriteGfxHandler1;
    SpriteManager *spriteGfxHandler2;
    u8 unk13C[40];
    Sprite *sprites[11];
    NARC *itemIconNarc;
    NARC *berryPotsAppNarc;
    LISTMENUITEM *listMenuItems[4];
    TouchscreenListMenu *menu;
} BerryPotsAppData;

void ov17_022028B8(BerryPotsAppData *data);
void ov17_02202850(BerryPotsAppData *data, u32 seqNo);
void ov17_02202B58(BerryPotsAppData *data, u8 index);
ManagedSprite *ov17_022034C8(BerryPotsAppData *data, s16 x, s16 y, u8 unused);
void ov17_02202A84(BerryPotsAppData *data, int index);
void ov17_0220351C(BerryPotsAppData *data);
void ov17_02203638(BerryPotsAppData *data);
void ov17_022036FC(BerryPotsAppData *data, enum BerryPotsApp_022036FC_Action action, u8 potIndex);
void ov17_022037C8(BerryPotsAppData *data, BOOL a1);
void ov17_0220387C(BerryPotsAppData *data);
void ov17_02203928(BerryPotsAppData *data);
u32 ov17_02203A34(BerryPotsAppData *data);
BOOL ov17_02203A54(BerryPotsAppData *data);
u32 ov17_02203A74(BerryPotsAppData *data, u32 a1);
u32 ov17_02203AD4(BerryPotsAppData *data);
u32 ov17_02203B68(BerryPotsAppData *data, BOOL *a1);
BOOL ov17_02203B88(BerryPotsAppData *data);
BOOL ov17_02203C20(BerryPotsAppData *data, BOOL *a1);
int ov17_02203C78(BerryPotsAppData *data);
int ov17_02203CC8(BerryPotsAppData *data);
u32 ov17_02203D00(BerryPotsAppData *data);

#endif // POKEHEARTGOLD_BERRY_POTS_APP_INTERNAL_H
