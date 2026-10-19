#ifndef GUARD_APPLICATION_CAPSULE_MENU_DEFS_H
#define GUARD_APPLICATION_CAPSULE_MENU_DEFS_H

#include "bg_window.h"
#include "gf_3d_vramman.h"
#include "menu_input_state.h"
#include "obj_char_transfer.h"
#include "overlay_57.h"
#include "pokepic.h"
#include "seal_case.h"
#include "sprite_system.h"
#include "touch_hitbox_controller.h"
#include "touchscreen_list_menu.h"
#include "unk_02013534.h"
#include "unk_02016EDC.h"

#define SEALS_PER_PAGE                8
#define CAPSULE_TOUCH_RECTS           21
#define CAPSULE_SELECTION_ARROWS      4
#define CAPSULE_MENU_WINDOW_NUM       11
#define CAPSULE_MENU_EMPTY_CAPSULE    0
#define CAPSULE_MENU_HAS_SEALS        1
#define CAPSULE_MENU_HAS_POKEMON      2
#define CAPSULE_MENU_UNREACHABLE_CASE 3

typedef struct IndexedCapsule {
    int partyIdx;
    BallCapsule *capsule;
} IndexedCapsule;

typedef struct SealPages {
    int page;
    int maxPage;
    u8 sealIDs[SEALS_PER_PAGE];
} SealPages;

typedef struct CapsuleGraphicsManager {
    int unk_000;
    u8 filler_004[4];
    SpriteSystem *unk_008;
    SpriteManager *unk_00C;
    BgConfig *unk_010;
    PaletteData *unk_014;
    Window unk_018[11];
    u8 filler_0C8[0x28];
    PokepicManager *unk_0F0;
    u8 filler_0F4[0x24];
    TouchHitboxController *unk_118;
    u8 filler_11C[0x58];
    TouchscreenListMenuSpawner *unk_174;
    u8 filler_178[12];
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
    u8 filler_068[0x6C];
    CapsuleGraphicsManager unk_0D4;
    u8 filler_28C[0xC0];
    SealRenderInfo unk_34C[8];
    u8 filler_3CC[0x20];
    int unk_3EC;
    int unk_3F0;
    u8 filler_3F4[0x18];
    MenuInputState unk_40C;
    u8 filler_410[0x38];
    SealPages unk_448;
    Pokemon *unk_458;
    NARC *unk_45C;
} CapsuleAppManager; // size: 0x460

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
BOOL ov57_02238260(CapsuleAppManager *appManager, u8 index);
void ov57_022383AC(CapsuleAppManager *appManager);
void ov57_022386F0(CapsuleAppManager *appManager);
void ov57_02238714(CapsuleAppManager *appManager);
GF3DVramMan *ov57_02238B28(void);
void ov57_02238BCC(void);
void ov57_02238C0C(void);
void ov57_02239058(CapsuleGraphicsManager *gfxManager);
void ov57_022390F4(CapsuleGraphicsManager *gfxManager);
void ov57_022395B8(BgConfig *bgConfig, PaletteData *plttData, u32 frame);
void ov57_02239670(BgConfig *bgConfig, PaletteData *plttData, u32 frame);
BOOL ov57_0223A0E0(CapsuleAppManager *appManager);
void ov57_0223BB5C(void);
void ov57_0223BB84(CapsuleAppManager *appManager);

#endif // GUARD_APPLICATION_CAPSULE_MENU_DEFS_H
