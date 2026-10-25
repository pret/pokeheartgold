#ifndef GUARD_APPLICATION_CAPSULE_MENU_DEFS_H
#define GUARD_APPLICATION_CAPSULE_MENU_DEFS_H

#include "battle/battle.h"

#include "bg_window.h"
#include "gf_3d_vramman.h"
#include "menu_input_state.h"
#include "obj_char_transfer.h"
#include "overlay_07.h"
#include "overlay_57.h"
#include "pokepic.h"
#include "seal_case.h"
#include "sprite_system.h"
#include "touch_hitbox_controller.h"
#include "touchscreen_list_menu.h"
#include "unk_02013534.h"
#include "unk_02016EDC.h"
#include "yes_no_prompt.h"

#define SEALS_PER_PAGE                8
#define CAPSULE_TOUCH_RECTS           21
#define CAPSULE_SELECTION_ARROWS      4
#define CAPSULE_MENU_WINDOW_NUM       13
#define CAPSULE_MENU_EMPTY_CAPSULE    0
#define CAPSULE_MENU_HAS_SEALS        1
#define CAPSULE_MENU_HAS_POKEMON      2
#define CAPSULE_MENU_UNREACHABLE_CASE 3

typedef struct IndexedCapsule {
    int partyIdx;
    BallCapsule *capsule;
} IndexedCapsule;

typedef struct CapsuleSprites {
    int pokemonIndex;
    int animIdx;
    ManagedSprite *sprite;
} CapsuleSprites;

typedef struct SealPages {
    int page;
    int maxPage;
    u8 sealIDs[SEALS_PER_PAGE];
} SealPages;

typedef struct CapsuleGraphicsManager {
    int unk_000;
    int unk_004;
    SpriteSystem *unk_008;
    SpriteManager *unk_00C;
    BgConfig *unk_010;
    PaletteData *unk_014;
    Window unk_018[CAPSULE_MENU_WINDOW_NUM];
    ListMenuItem *unk_0E8;
    u8 filler_0EC[0x4];
    PokepicManager *unk_0F0;
    Pokepic *unk_0F4;
    int unk_0F8;
    u8 filler_0FC[0x1C];
    TouchHitboxController *unk_118;
    TouchscreenHitbox unk_11C[21];
    YesNoPrompt *unk_170;
    TouchscreenListMenuSpawner *unk_174;
    TouchscreenListMenu *unk_178;
    BallCapsuleSealEffect *unk_17C;
    UnkBallData *unk_180;
    GF3DVramMan *unk_184;
    UnkStruct_02013534 *unk_188;
    TextOBJ *unk_18C[2];
    UnkStruct_02021AC8 unk_194[2];
    BOOL unk_1AC;
    UnkStruct_02016EDC *unk_1B0;
    BOOL unk_1B4;
} CapsuleGraphicsManager;

typedef struct SealRenderInfo {
    BOOL shouldRender;
    u8 type;
    u8 x;
    u8 y;
    u8 unk_7;
    ManagedSprite *sprite;
    TouchscreenHitbox *touchscreenHitbox;
} SealRenderInfo;

typedef struct CapsuleAppManager {
    CapsuleAppData *unk_000;
    IndexedCapsule unk_004[MAX_CAPSULES];
    SealCounts *unk_064;
    BallCapsule unk_068;
    u8 unk_080[SEAL_MAX + 1];
    CapsuleGraphicsManager unk_0D4;
    CapsuleSprites unk_28C[MAX_CAPSULES];
    ManagedSprite *unk_31C[2];
    ManagedSprite *unk_324[PARTY_SIZE];
    ManagedSprite *unk_33C[CAPSULE_SELECTION_ARROWS];
    SealRenderInfo unk_34C[MAX_SEALS_ON_CAPSULE];
    u8 filler_3CC[0x20];
    int unk_3EC[2];
    int unk_3F4;
    int unk_3F8;
    int unk_3FC;
    int unk_400;
    int unk_404;
    YesNoResponse unk_408;
    MenuInputState unk_40C;
    int unk_410;
    ManagedSprite *unk_414[13];
    SealPages unk_448;
    Pokemon *unk_458;
    NARC *unk_45C;
} CapsuleAppManager; // size: 0x460

typedef struct UnkStruct_ov57_0223BECC {
    s32 index;
    BOOL (*func)(CapsuleAppManager *appMan);
} UnkStruct_ov57_0223BECC;

extern const UnkStruct_ov57_0223BECC ov57_0223BECC[];

void ov57_02237CA8(enum HeapID heapId);
void ov57_02237CDC(enum HeapID heapId);
void ov57_02237CEC(BgConfig *bgConfig);
void ov57_02237E38(void *cbArg);
u8 ov57_02237E78(CapsuleAppData *appData);
void ov57_02237E80(CapsuleAppData *appData, u8 a1);
void ov57_02237E88(CapsuleAppData *appData, u8 a1);

void ov57_02237E90(TouchscreenHitbox *rect, u8 x, u8 y);
void ov57_02237EA8(TouchscreenHitbox *rect);
void ov57_02237EB8(TouchscreenHitbox *rect, ManagedSprite *sprite, BOOL touchingSprite);
void ov57_02237F14(CapsuleAppManager *appManager);
void ov57_02237F3C(CapsuleAppManager *appManager);
int ov57_02237FAC(CapsuleAppManager *appMan, u8 sealIndex);
BOOL ov57_02238028(CapsuleAppManager *appMan);
void ov57_02238044(CapsuleAppManager *appMan, u8 index);
void ov57_0223809C(CapsuleAppManager *appMan, u8 type, u8 sealIndex);
void ov57_02238134(CapsuleAppManager *appMan);
BOOL ov57_02238260(CapsuleAppManager *appMan, u8 index);
BOOL ov57_022382F8(CapsuleAppManager *appMan, u32 touchscreenState, u8 index);
void ov57_022383AC(CapsuleAppManager *appMan);
void ov57_022383D0(CapsuleAppManager *appMan, int flag);
BOOL ov57_022383F8(CapsuleAppManager *appMan, int index);
void ov57_02238438(CapsuleAppManager *appMan, int sealIndex);
void ov57_0223848C(CapsuleAppManager *appMan, int index);
BOOL ov57_022384C0(CapsuleAppManager *appMan);
void ov57_02238508(CapsuleAppManager *appMan, int sealIndex);
void ov57_0223853C(CapsuleAppManager *appMan);
void ov57_0223857C(BallCapsule *capsule, CapsuleAppManager *appMan);

GF3DVramMan *ov57_02238B28(void);
void ov57_022385A4(TouchscreenHitbox *rect, ManagedSprite *sprite, int xOffset, int yOffset);
void ov57_022385DC(CapsuleAppManager *appManager);
void ov57_0223864C(CapsuleAppManager *appManager);
void ov57_0223866C(CapsuleAppManager *appManager, BOOL show);
void ov57_022386F0(CapsuleAppManager *appMan);
void ov57_02238714(CapsuleAppManager *appMan);
void ov57_02238758(CapsuleAppManager *appMan);
void ov57_02238794(CapsuleAppManager *appMan);
void ov57_022387C0(CapsuleAppManager *appMan, BOOL flag);
void ov57_022387E0(CapsuleAppManager *appMan, int index, int x, int y, int palette);
void ov57_022387E0(CapsuleAppManager *appMan, int index, int x, int y, int palette);
void ov57_022388E4(CapsuleAppManager *appMan, int pageCutoff);
void ov57_02238958(CapsuleAppManager *appMan);
void ov57_02238A00(CapsuleAppManager *appMan);
void ov57_02238AC0(CapsuleAppManager *appMan);
void ov57_02238AF0(CapsuleAppManager *appMan, s16 a1);
void ov57_02238AF0(CapsuleAppManager *appMan, s16 a1);
void ov57_02238B48(void);
void ov57_02238B48(void);
void ov57_02238BCC(void);
void ov57_02238C0C(void);
void ov57_02238C30(BgConfig *bgConfig, Window *window, int bgLayer, CapsuleAppManager *appMan, int capsuleIndex);
void ov57_02238D80(CapsuleAppManager *appMan);
void ov57_02238DAC(int index, s16 *x, s16 *y);
void ov57_02238DD0(CapsuleAppManager *appMan);
void ov57_02238E48(CapsuleAppManager *appMan);
void ov57_02238F48(CapsuleAppManager *appMan);
void ov57_02238FC4(CapsuleAppManager *appMan);
void ov57_02238FEC(CapsuleAppManager *appMan);
void ov57_02239014(CapsuleAppManager *appMan);
void ov57_02239058(CapsuleGraphicsManager *unk_0D4);
void ov57_022390F4(CapsuleGraphicsManager *unk_0D4);
void ov57_02239114(CapsuleAppManager *appMan, NARC *narc);
void ov57_02239184(CapsuleAppManager *appMan);
void ov57_0223921C(CapsuleAppManager *appMan);
void ov57_02239240(CapsuleAppManager *appMan, int flag);
void ov57_02239260(CapsuleAppManager *appMan);
void ov57_0223927C(SpriteSystem *spriteSystem, SpriteManager *spriteManager, PaletteData *paletteData, int charFileId, int plttFileId, int cellFileId, int animFileId, int vramType, int bufferId, int paletteIdx, NARC *narc);
void ov57_022392F4(CapsuleAppManager *appMan, NARC *narc);
void ov57_022394AC(CapsuleAppManager *appMan);
void ov57_022394D8(CapsuleAppManager *appMan, int capsuleIdx1, int capsuleIdx2);
void ov57_02239558(CapsuleAppManager *appMan);
void ov57_02239588(CapsuleAppManager *appMan);
void ov57_022395B8(BgConfig *bgConfig, PaletteData *paletteData, int messageBoxFrame);
void ov57_02239670(BgConfig *bgConfig, PaletteData *paletteData, int messageBoxFrame);
void ov57_02239728(Window *window, int frame, int entryID, BOOL drawFrame);
void ov57_022397B0(BgConfig *bgConfig, Window *window, int bgLayer, int tilemapLeft, int tilemapTop, int width, int height, int baseTile);
void ov57_02239814(BgConfig *bgConfig, Window *window, int bgLayer, int left, int top, int width, int height, int baseTile);
void ov57_02239814(BgConfig *bgConfig, Window *window, int bgLayer, int left, int top, int width, int height, int baseTile);
void ov57_02239868(BgConfig *bgConfig, Window *window, int bgLayer, int tilemapLeft, int tilemapTop, int width, int height, int baseTile, int palette);
void ov57_022398C4(CapsuleAppManager *appMan);
void ov57_022399F8(CapsuleAppManager *appMan);
void ov57_02239A8C(CapsuleAppManager *appMan, int index);
void ov57_02239B0C(CapsuleAppManager *appMan);
void ov57_02239B2C(Window *window, int entryID);
void ov57_02239B94(void);
void ov57_02239BAC(void);
void ov57_02239BCC(void);
void ov57_02239BEC(CapsuleAppManager *appMan, NARC *narc);
void ov57_02239C88(CapsuleAppManager *appMan, NARC *narc);
void ov57_02239CE8(CapsuleAppManager *appMan, NARC *narc);
void ov57_02239D48(CapsuleAppManager *appMan, NARC *narc);
void ov57_02239EB4(CapsuleAppManager *appMan);
void ov57_0223A034(CapsuleAppManager *appMan, int flag);
void ov57_0223A058(CapsuleAppManager *appMan);
void ov57_0223A05C(CapsuleAppManager *appMan);
int ov57_0223A07C(BallCapsule *capsule);
int ov57_0223A0A8(CapsuleAppManager *appMan, int capsuleIndex);
BOOL ov57_0223A0E0(CapsuleAppManager *appMan);
void ov57_0223BB84(CapsuleAppManager *appMan);
void ov57_0223BB5C(void);
void ov57_0223BC4C(CapsuleAppManager *appMan, int capsuleIndex);

#endif // GUARD_APPLICATION_CAPSULE_MENU_DEFS_H
