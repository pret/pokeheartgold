
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

extern u16 ov12_0226E0D0[];
extern u16 ov12_0226E0A0[];
extern u16 ov12_0226E168[][3] __attribute__((aligned(4)));
extern ManagedSpriteTemplate ov12_0226E100[];

void ov12_02265E28(UnkBattleSystemSub17C *a0);
void ov12_02265F34(UnkBattleSystemSub17C *arg0);
void ov12_02265F68(UnkBattleSystemSub17C *arg0);
void ov12_02265F7C(UnkBattleSystemSub17C *arg0);
void ov12_02265FC4(UnkBattleSystemSub17C *arg0, s32 flag);
void ov12_02265FD4(UnkBattleSystemSub17C *arg0, BattleSystem *bsys, s32 unk8, s32 unk9);
void ov12_02266008(UnkBattleSystemSub17C *arg0);

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
