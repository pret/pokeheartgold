
#include "battle/battle_02265E28.h"

#include "global.h"

#include "constants/heap.h"

#include "battle/battle.h"
#include "battle/battle_system.h"
#include "battle/overlay_12_02265E28.h"

#include "filesystem.h"
#include "filesystem_files_def.h"
#include "sprite_system.h"

#define UNK_RES_4E2D 0x4E2D
#define UNK_RES_4E2E 0x4E2E
#define UNK_RES_4E29 0x4E29
#define UNK_RES_4E25 0x4E25
#define UNK_RES_4E26 0x4E26

void ov12_02265E28(UnkBattleSystemSub17C *a0);
void ov12_02265F34(UnkBattleSystemSub17C *arg0);
void ov12_02265F68(UnkBattleSystemSub17C *arg0);
void ov12_02265F7C(UnkBattleSystemSub17C *arg0);

static const u16 ov12_0226E0A0[] = {
    0x88,
    0x92,
    0x82,
    0x98,
    0x8C,
    0x96,
    0x8E,
    0x86,
    0x8A,
    0x90,
    0x94,
    0x94,
    0x9A,
    0x9C,
    0x9E,
    0xA0,
    0xA2,
    0xA4,
    0xA6,
    0xA8,
    0xAA,
    0xAC,
    0xAE,
    0xB0
};

static const u16 ov12_0226E0D0[] = {
    0x87,
    0x91,
    0x7F,
    0x97,
    0x8B,
    0x95,
    0x8D,
    0x85,
    0x89,
    0x8F,
    0x93,
    0x97,
    0x99,
    0x9B,
    0x9D,
    0x9F,
    0xA1,
    0xA3,
    0xA5,
    0xA7,
    0xA9,
    0xAB,
    0xAD,
    0xAF
};

static const ManagedSpriteTemplate ov12_0226E100[] = {
    { .x = 0x150,  .y = 0x88, .z = 0, .animation = 0, .drawPriority = 0x3E8, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { UNK_RES_4E2D, UNK_RES_4E29, UNK_RES_4E25, UNK_RES_4E25, -1, -1 }, .bgPriority = 3, .vramTransfer = 0 },
    { .x = 0xFFB0, .y = 0x58, .z = 0, .animation = 0, .drawPriority = 0x3E8, .pal = 0, .vram = NNS_G2D_VRAM_TYPE_2DMAIN, .resIdList = { UNK_RES_4E2E, UNK_RES_4E29, UNK_RES_4E26, UNK_RES_4E26, -1, -1 }, .bgPriority = 3, .vramTransfer = 0 }
};

static const u16 ov12_0226E168[][3] __attribute__((aligned(4))) = {
    { 0x07, 0x08, 0x09 },
    { 0x16, 0x17, 0x18 },
    { 0x01, 0x02, 0x03 },
    { 0x1F, 0x20, 0x21 },
    { 0x0D, 0x0E, 0x0F },
    { 0x1C, 0x1D, 0x1E },
    { 0x10, 0x11, 0x12 },
    { 0x04, 0x05, 0x06 },
    { 0x0A, 0x0B, 0x0C },
    { 0x13, 0x14, 0x15 },
    { 0x19, 0x1A, 0x1B },
    { 0x19, 0x1A, 0x1B },
    { 0x22, 0x23, 0x24 },
    { 0x25, 0x26, 0x27 },
    { 0x28, 0x29, 0x2A },
    { 0x2B, 0x2C, 0x2D },
    { 0x2E, 0x2F, 0x30 },
    { 0x31, 0x32, 0x33 },
    { 0x34, 0x35, 0x36 },
    { 0x37, 0x38, 0x39 },
    { 0x3A, 0x3B, 0x3C },
    { 0x3D, 0x3E, 0x3F },
    { 0x40, 0x41, 0x42 },
    { 0x43, 0x44, 0x45 }
};

void ov12_02265E28(UnkBattleSystemSub17C *a0) {
    u32 r6;
    void *narc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

    SpriteSystem *spriteSystem = BattleSystem_GetSpriteRenderer(a0->bsys);
    SpriteManager *spriteManager = BattleSystem_GetGfxHandler(a0->bsys);
    u32 subfile = ov12_0223B52C(a0->bsys);

    u16 charFile;
    u32 charResId;
    u32 cellFile;
    u32 animFile;
    if (a0->unk8 == 0) {
        charFile = ov12_0226E0D0[a0->unk9];
        charResId = UNK_RES_4E2D;
        cellFile = 0x80;
        r6 = charResId - 8;
        animFile = 0x81;
    } else {
        charFile = ov12_0226E0A0[a0->unk9];
        charResId = UNK_RES_4E2E;
        cellFile = 0x83;
        r6 = charResId - 8;
        animFile = 0x84;
    }
    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, charFile, TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, charResId);

    void *palette = BattleSystem_GetPaletteData(a0->bsys);
    SpriteSystem_LoadPaletteBufferFromOpenNarc(palette, PLTTBUF_MAIN_OBJ, spriteSystem, spriteManager, narc, ov12_0226E168[a0->unk9][subfile], FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, UNK_RES_4E29);

    palette = BattleSystem_GetPaletteData(a0->bsys);
    PaletteData_LoadNarc(palette, NARC_a_0_0_8, ov12_0226E168[a0->unk9][subfile], HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 0x20, 0x70);

    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, cellFile, TRUE, r6);

    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, animFile, TRUE, r6);

    NARC_Delete(narc);
}

void ov12_02265F34(UnkBattleSystemSub17C *arg0) {
    SpriteSystem *spriteSystem; // r5
    ManagedSprite *managed;

    spriteSystem = BattleSystem_GetSpriteRenderer(arg0->bsys);
    managed = SpriteSystem_NewSprite(spriteSystem, BattleSystem_GetGfxHandler(arg0->bsys), &ov12_0226E100[arg0->unk8]);
    arg0->unk0 = managed;
    Sprite_TickFrame(managed->sprite);
}

void ov12_02265F68(UnkBattleSystemSub17C *arg0) {
    if (arg0->unk0) {
        Sprite_DeleteAndFreeResources(arg0->unk0);
        arg0->unk0 = NULL;
    }
}

void ov12_02265F7C(UnkBattleSystemSub17C *arg0) {
    SpriteManager *manager = BattleSystem_GetGfxHandler(arg0->bsys);
    s32 resId = arg0->unk8 == 0 ? UNK_RES_4E2D : UNK_RES_4E2E;
    u32 temp = resId - 8;
    SpriteManager_UnloadCharObjById(manager, resId);
    SpriteManager_UnloadPlttObjById(manager, UNK_RES_4E29);
    SpriteManager_UnloadCellObjById(manager, temp);
    SpriteManager_UnloadAnimObjById(manager, temp);
}

void ov12_02265FC4(UnkBattleSystemSub17C *arg0, s32 flag) {
    ManagedSprite *sprite = arg0->unk0;
    if (sprite) {
        ManagedSprite_SetDrawFlag(sprite, flag);
    }
}

void ov12_02265FD4(UnkBattleSystemSub17C *arg0, BattleSystem *bsys, s32 unk8, s32 unk9) {
    MIi_CpuClearFast(0, (void *)arg0, sizeof(UnkBattleSystemSub17C));
    arg0->bsys = bsys;
    arg0->unk8 = unk8;
    arg0->unk9 = unk9;
    if (unk9 >= 0x18) {
        GF_AssertFail();
        arg0->unk9 = 0;
    }
    ov12_02265E28(arg0);
    ov12_02265F34(arg0);
}

void ov12_02266008(UnkBattleSystemSub17C *arg0) {
    ov12_02265F68(arg0);
    ov12_02265F7C(arg0);
    MIi_CpuClearFast(0, (void *)arg0, sizeof(UnkBattleSystemSub17C));
}
