#ifndef GUARD_APPLICATION_CAPSULE_MENU_DEFS_H
#define GUARD_APPLICATION_CAPSULE_MENU_DEFS_H

#include "bg_window.h"
#include "gf_3d_vramman.h"
#include "menu_input_state.h"
#include "overlay_57.h"
#include "pokepic.h"
#include "seal_case.h"
#include "sprite_system.h"
#include "touch_hitbox_controller.h"
#include "touchscreen_list_menu.h"
#include "unk_02016EDC.h"

typedef struct IndexedCapsule {
    int partyIdx;
    BallCapsule *capsule;
} IndexedCapsule;

typedef struct CapsuleGraphicsManager {
    int unk_000;
    u8 filler_004[4];
    SpriteSystem *unk_008;
    SpriteManager *unk_00C;
    BgConfig *unk_010;
    PaletteData *unk_014;
    u8 filler_018[0xD8];
    PokepicManager *unk_0F0;
    u8 filler_0F4[0x24];
    TouchHitboxController *unk_118;
    u8 filler_11C[0x58];
    TouchscreenListMenuSpawner *unk_174;
} CapsuleGraphicsManager;

typedef struct CapsuleAppManager {
    CapsuleAppData *unk_000;
    IndexedCapsule unk_004[MAX_CAPSULES];
    SealCounts *unk_064;
    u8 filler_068[0x6C];
    CapsuleGraphicsManager unk_0D4;
    u8 filler_24C[12];
    GF3DVramMan *unk_258;
    u8 filler_25C[0x28];
    UnkStruct_02016EDC *unk_284;
    u8 filler_288[0x164];
    int unk_3EC;
    int unk_3F0;
    u8 filler_3F4[0x18];
    MenuInputState unk_40C;
    u8 filler_410[0x38];
    int unk_448;
    int unk_44C;
    u8 filler_450[8];
    Pokemon *unk_458;
    NARC *unk_45C;
} CapsuleAppManager; // size: 0x460

#endif // GUARD_APPLICATION_CAPSULE_MENU_DEFS_H
