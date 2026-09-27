#include "application/bag_app_internal.h"
#include "graphic/bag/bag_graphics.naix"
#include "graphic/shop_gra.naix"

#include "gf_gfx_loader.h"
#include "move.h"
#include "unk_02077678.h"
#include "vram_transfer_manager.h"

enum BagAppCharTag {
    BAG_APP_CHAR_TAG_01 = 49401,
    BAG_APP_CHAR_TAG_02,
    BAG_APP_CHAR_TAG_03,
    BAG_APP_CHAR_TAG_ITEM_ICON_1,
    BAG_APP_CHAR_TAG_ITEM_ICON_2,
    BAG_APP_CHAR_TAG_ITEM_ICON_3,
    BAG_APP_CHAR_TAG_ITEM_ICON_4,
    BAG_APP_CHAR_TAG_ITEM_ICON_5,
    BAG_APP_CHAR_TAG_ITEM_ICON_6,
    BAG_APP_CHAR_TAG_10,
    BAG_APP_CHAR_TAG_MOVE_TYPE_ICON,
    BAG_APP_CHAR_TAG_MOVE_CATEGORY_ICON,
};

enum BagAppPlttTag {
    BAG_APP_PLTT_TAG_01 = 49401,
    BAG_APP_PLTT_TAG_02,
    BAG_APP_PLTT_TAG_ITEM_ICON_1,
    BAG_APP_PLTT_TAG_ITEM_ICON_2,
    BAG_APP_PLTT_TAG_ITEM_ICON_3,
    BAG_APP_PLTT_TAG_ITEM_ICON_4,
    BAG_APP_PLTT_TAG_ITEM_ICON_5,
    BAG_APP_PLTT_TAG_ITEM_ICON_6,
    BAG_APP_PLTT_TAG_09,
    BAG_APP_PLTT_TAG_MOVE_TYPE_CATEGORY_ICON,
};

enum BagAppCellTag {
    BAG_APP_CELL_TAG_01 = 49401,
    BAG_APP_CELL_TAG_02,
    BAG_APP_CELL_TAG_03,
    BAG_APP_CELL_TAG_ITEM_ICON,
    BAG_APP_CELL_TAG_05,
    BAG_APP_CELL_TAG_MOVE_TYPE_CATEGORY_ICON,
};

enum BagAppAnimTag {
    BAG_APP_ANIM_TAG_01 = 49401,
    BAG_APP_ANIM_TAG_02,
    BAG_APP_ANIM_TAG_03,
    BAG_APP_ANIM_TAG_04,
    BAG_APP_ANIM_TAG_ITEM_ICON,
    BAG_APP_ANIM_TAG_06,
    BAG_APP_ANIM_TAG_MOVE_TYPE_CATEGORY_ICON,
};

static void BagApp_ReplaceItemIconResObjs(BagAppData *appData, int idx, u16 itemId);
static void BagApp_InitSpriteSystem(BagAppData *appData);
static void BagApp_LoadSpriteResObjs(BagAppData *appData);
static void BagApp_CreateSprites(BagAppData *appData);
static void ov15_021FFEC0(BagAppData *appData);
static void BagApp_UpdatePageNavArrowSpritesVisibility(BagAppData *appData);

void BagApp_InitSpriteRendererAndSystem(BagAppData *appData) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GF_CreateVramTransferManager(32, HEAP_ID_BAG);
    BagApp_InitSpriteSystem(appData);
    BagApp_LoadSpriteResObjs(appData);
    BagApp_CreateSprites(appData);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(appData->spriteSystem), 0, FX32_CONST(256));
}

void BagApp_FreeSpriteSystem(BagAppData *appData) {
    for (u32 i = 0; i < 39; ++i) {
        Sprite_DeleteAndFreeResources(appData->sprites[i]);
    }
    SpriteSystem_FreeResourcesAndManager(appData->spriteSystem, appData->spriteManager);
    SpriteSystem_Free(appData->spriteSystem);
    Heap_Free(appData->unk_69C);
}

void ov15_021FF8D4(BagAppData *appData) {
    for (u32 i = 0; i < 39; ++i) {
        ManagedSprite_TickFrame(appData->sprites[i]);
    }
}

static void BagApp_ReplaceItemIconResObjs(BagAppData *appData, int idx, u16 itemId) {
    SpriteSystem_ReplaceCharResObj(appData->spriteSystem, appData->spriteManager, NARC_itemtool_itemdata_item_icon, GetItemIndexMapping(itemId, ITEMNARC_NCGR), FALSE, BAG_APP_CHAR_TAG_ITEM_ICON_1 + idx);
    SpriteSystem_ReplacePlttResObj(appData->spriteSystem, appData->spriteManager, NARC_itemtool_itemdata_item_icon, GetItemIndexMapping(itemId, ITEMNARC_NCLR), FALSE, BAG_APP_PLTT_TAG_ITEM_ICON_1 + idx);
}

void ov15_021FF950(BagAppData *appData) {
    appData->unk_64B = 0;
    appData->unk_648 = 1;
}

void ov15_021FF964(BagAppData *appData) {
    switch (appData->unk_648) {
    case 0:
        break;
    case 1:
        ov15_021FFEC0(appData);
        break;
    }
}

void ov15_021FF97C(BagAppData *appData, u16 itemId, int drawFlag) {
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_MOVE_TYPE_ICON], drawFlag);
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_MOVE_CATEGORY_ICON], drawFlag);
    if (drawFlag) {
        u16 move = TMHMGetMove(itemId);
        u16 type = GetMoveAttr(move, MOVEATTR_TYPE);
        u16 category = GetMoveAttr(move, MOVEATTR_CLASS);
        SpriteSystem_ReplaceCharResObj(appData->spriteSystem, appData->spriteManager, GetTypeIconGfxNarcId(), GetTypeIconGfxCharFileId(type), TRUE, BAG_APP_CHAR_TAG_MOVE_TYPE_ICON);
        ManagedSprite_SetPaletteOverride(appData->sprites[BAG_APP_SPRITE_MOVE_TYPE_ICON], GetTypeIconGfxPlttOverride(type) + 4);
        SpriteSystem_ReplaceCharResObj(appData->spriteSystem, appData->spriteManager, GetMoveCategoryIconGfxNarcId(), GetMoveCategoryIconGfxCharFileId(category), TRUE, BAG_APP_CHAR_TAG_MOVE_CATEGORY_ICON);
        ManagedSprite_SetPaletteOverride(appData->sprites[BAG_APP_SPRITE_MOVE_CATEGORY_ICON], GetMoveCategoryIconGfxPlttOverride(category) + 4);
    }
}

static void BagApp_InitSpriteSystem(BagAppData *appData) {
    SpriteResourceCountsListUnion sp34 = {
        .numChar = 12,
        .numPltt = 10,
        .numCell = 6,
        .numAnim = 7,
    };
    appData->spriteSystem = SpriteSystem_Alloc(HEAP_ID_BAG);
    appData->spriteManager = SpriteManager_New(appData->spriteSystem);
    OamManagerParam sp14 = {
        .fromOBJmain = 0,
        .numOBJmain = 128,
        .fromAffineMain = 0,
        .numAffineMain = 32,
        .fromOBJsub = 0,
        .numOBJsub = 128,
        .fromAffineSub = 0,
        .numAffineSub = 32,
    };
    OamCharTransferParam sp0 = {
        .maxTasks = 39,
        .sizeMain = 131072,
        .sizeSub = 16384,
        .charModeMain = GX_OBJVRAMMODE_CHAR_1D_32K,
        .charModeSub = GX_OBJVRAMMODE_CHAR_1D_32K,
    };
    SpriteSystem_Init(appData->spriteSystem, &sp14, &sp0, 32);
    SpriteSystem_InitSprites(appData->spriteSystem, appData->spriteManager, 39);
    SpriteSystem_InitManagerWithCapacities(appData->spriteSystem, appData->spriteManager, &sp34);
}

static void BagApp_LoadSpriteResObjs(BagAppData *appData) {
    SpriteSystem_LoadCharResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_bag_bag_graphics, bag_graphics_00026_NCGR, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, BAG_APP_CHAR_TAG_01);
    SpriteSystem_LoadCharResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_bag_bag_graphics, bag_graphics_00006_NCGR, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, BAG_APP_CHAR_TAG_02);
    SpriteSystem_LoadCharResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_bag_bag_graphics, bag_graphics_00051_NCGR, FALSE, NNS_G2D_VRAM_TYPE_2DSUB, BAG_APP_CHAR_TAG_03);
    SpriteSystem_LoadCharResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_shop_gra, shop_gra_00004_NCGR, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, BAG_APP_CHAR_TAG_10);
    for (int i = 0; i < 6; ++i) {
        SpriteSystem_LoadCharResObj(appData->spriteSystem, appData->spriteManager, NARC_itemtool_itemdata_item_icon, GetItemIndexMapping(ITEM_NONE, ITEMNARC_NCGR), FALSE, NNS_G2D_VRAM_TYPE_2DSUB, BAG_APP_CHAR_TAG_ITEM_ICON_1 + i);
    }
    SpriteSystem_LoadMoveTypeIconCharResObj(appData->spriteSystem, appData->spriteManager, NNS_G2D_VRAM_TYPE_2DMAIN, 0, BAG_APP_CHAR_TAG_MOVE_TYPE_ICON);
    SpriteSystem_LoadMoveCategoryIconCharResObj(appData->spriteSystem, appData->spriteManager, NNS_G2D_VRAM_TYPE_2DMAIN, 0, BAG_APP_CHAR_TAG_MOVE_CATEGORY_ICON);
    SpriteSystem_LoadPlttResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_bag_bag_graphics, bag_graphics_00015_NCLR, FALSE, 2, NNS_G2D_VRAM_TYPE_2DMAIN, BAG_APP_PLTT_TAG_01);
    SpriteSystem_LoadPlttResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_shop_gra, shop_gra_00010_NCLR, FALSE, 2, NNS_G2D_VRAM_TYPE_2DMAIN, BAG_APP_PLTT_TAG_09);
    SpriteSystem_LoadMoveTypeAndCategoryIconsPltt(appData->spriteSystem, appData->spriteManager, NNS_G2D_VRAM_TYPE_2DMAIN, BAG_APP_PLTT_TAG_MOVE_TYPE_CATEGORY_ICON);
    SpriteSystem_LoadPlttResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_bag_bag_graphics, bag_graphics_00047_NCLR, FALSE, 10, NNS_G2D_VRAM_TYPE_2DSUB, BAG_APP_PLTT_TAG_02);
    for (int i = 0; i < 6; ++i) {
        SpriteSystem_LoadPlttResObj(appData->spriteSystem, appData->spriteManager, NARC_itemtool_itemdata_item_icon, GetItemIndexMapping(ITEM_NONE, ITEMNARC_NCLR), 0, TRUE, NNS_G2D_VRAM_TYPE_2DSUB, BAG_APP_PLTT_TAG_ITEM_ICON_1 + i);
    }
    SpriteSystem_LoadCellResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_bag_bag_graphics, bag_graphics_00025_NCER, FALSE, BAG_APP_CELL_TAG_01);
    SpriteSystem_LoadCellResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_bag_bag_graphics, bag_graphics_00005_NCER, FALSE, BAG_APP_CELL_TAG_02);
    SpriteSystem_LoadCellResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_bag_bag_graphics, bag_graphics_00049_NCER, FALSE, BAG_APP_CELL_TAG_03);
    SpriteSystem_LoadCellResObj(appData->spriteSystem, appData->spriteManager, NARC_itemtool_itemdata_item_icon, GetItemIconCell(), FALSE, BAG_APP_CELL_TAG_ITEM_ICON);
    SpriteSystem_LoadCellResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_shop_gra, shop_gra_00005_NCER, FALSE, BAG_APP_CELL_TAG_05);
    SpriteSystem_LoadAnimResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_bag_bag_graphics, bag_graphics_00021_NANR, FALSE, BAG_APP_ANIM_TAG_01);
    SpriteSystem_LoadAnimResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_bag_bag_graphics, bag_graphics_00024_NANR, FALSE, BAG_APP_ANIM_TAG_02);
    SpriteSystem_LoadAnimResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_bag_bag_graphics, bag_graphics_00004_NANR, FALSE, BAG_APP_ANIM_TAG_03);
    SpriteSystem_LoadAnimResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_bag_bag_graphics, bag_graphics_00050_NANR, FALSE, BAG_APP_ANIM_TAG_04);
    SpriteSystem_LoadAnimResObj(appData->spriteSystem, appData->spriteManager, NARC_itemtool_itemdata_item_icon, GetItemIconAnim(), FALSE, BAG_APP_ANIM_TAG_ITEM_ICON);
    SpriteSystem_LoadAnimResObj(appData->spriteSystem, appData->spriteManager, NARC_graphic_shop_gra, shop_gra_00006_NANR, FALSE, BAG_APP_ANIM_TAG_06);
    SpriteSystem_LoadMoveTypeAndCategoryIconsCellAndAnim(appData->spriteSystem, appData->spriteManager, BAG_APP_CELL_TAG_MOVE_TYPE_CATEGORY_ICON, BAG_APP_ANIM_TAG_MOVE_TYPE_CATEGORY_ICON);
    appData->unk_69C = GfGfxLoader_GetPlttData(NARC_graphic_bag_bag_graphics, bag_graphics_00048_NCLR, &appData->unk_6A0, HEAP_ID_BAG);
}

static const ManagedSpriteTemplate sSpriteTemplates[39] = {
    [BAG_APP_SPRITE_UNUSED_MOVE_ITEM_CURSOR] = {
                                                .x = 177,
                                                .y = 14,
                                                .z = 0,
                                                .animation = 0,
                                                .drawPriority = 0,
                                                .pal = 0,
                                                .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_01,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_01,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_01,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_02,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_ITEM_ICON_1] = {
                                                .x = 22,
                                                .y = 59,
                                                .z = 0,
                                                .animation = 0,
                                                .drawPriority = 0,
                                                .pal = 0,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_ITEM_ICON_1,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_ITEM_ICON_1,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_ITEM_ICON,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_ITEM_ICON,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_ITEM_ICON_2] = {
                                                .x = 152,
                                                .y = 59,
                                                .z = 0,
                                                .animation = 0,
                                                .drawPriority = 0,
                                                .pal = 0,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_ITEM_ICON_2,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_ITEM_ICON_2,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_ITEM_ICON,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_ITEM_ICON,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_ITEM_ICON_3] = {
                                                .x = 22,
                                                .y = 100,
                                                .z = 0,
                                                .animation = 0,
                                                .drawPriority = 0,
                                                .pal = 0,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_ITEM_ICON_3,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_ITEM_ICON_3,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_ITEM_ICON,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_ITEM_ICON,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_ITEM_ICON_4] = {
                                                .x = 152,
                                                .y = 100,
                                                .z = 0,
                                                .animation = 0,
                                                .drawPriority = 0,
                                                .pal = 0,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_ITEM_ICON_4,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_ITEM_ICON_4,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_ITEM_ICON,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_ITEM_ICON,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_ITEM_ICON_5] = {
                                                .x = 22,
                                                .y = 139,
                                                .z = 0,
                                                .animation = 0,
                                                .drawPriority = 0,
                                                .pal = 0,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_ITEM_ICON_5,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_ITEM_ICON_5,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_ITEM_ICON,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_ITEM_ICON,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_ITEM_ICON_6] = {
                                                .x = 152,
                                                .y = 139,
                                                .z = 0,
                                                .animation = 0,
                                                .drawPriority = 0,
                                                .pal = 0,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_ITEM_ICON_6,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_ITEM_ICON_6,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_ITEM_ICON,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_ITEM_ICON,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_MOVE_TYPE_ICON] = {
                                                .x = 48,
                                                .y = 112,
                                                .z = 0,
                                                .animation = 0,
                                                .drawPriority = 0,
                                                .pal = 0,
                                                .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_MOVE_TYPE_ICON,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_MOVE_TYPE_CATEGORY_ICON,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_MOVE_TYPE_CATEGORY_ICON,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_MOVE_TYPE_CATEGORY_ICON,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_MOVE_CATEGORY_ICON] = {
                                                .x = 144,
                                                .y = 112,
                                                .z = 0,
                                                .animation = 0,
                                                .drawPriority = 0,
                                                .pal = 0,
                                                .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_MOVE_CATEGORY_ICON,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_MOVE_TYPE_CATEGORY_ICON,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_MOVE_TYPE_CATEGORY_ICON,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_MOVE_TYPE_CATEGORY_ICON,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_POCKET_ICON_1] = {
                                                .x = 16,
                                                .y = 16,
                                                .z = 0,
                                                .animation = 0,
                                                .drawPriority = 1,
                                                .pal = 0,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_POCKET_ICON_2] = {
                                                .x = 48,
                                                .y = 16,
                                                .z = 0,
                                                .animation = 1,
                                                .drawPriority = 1,
                                                .pal = 1,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_POCKET_ICON_3] = {
                                                .x = 80,
                                                .y = 16,
                                                .z = 0,
                                                .animation = 2,
                                                .drawPriority = 1,
                                                .pal = 2,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_POCKET_ICON_4] = {
                                                .x = 112,
                                                .y = 16,
                                                .z = 0,
                                                .animation = 3,
                                                .drawPriority = 1,
                                                .pal = 3,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_POCKET_ICON_5] = {
                                                .x = 144,
                                                .y = 16,
                                                .z = 0,
                                                .animation = 4,
                                                .drawPriority = 1,
                                                .pal = 4,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_POCKET_ICON_6] = {
                                                .x = 176,
                                                .y = 16,
                                                .z = 0,
                                                .animation = 5,
                                                .drawPriority = 1,
                                                .pal = 5,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_POCKET_ICON_7] = {
                                                .x = 208,
                                                .y = 16,
                                                .z = 0,
                                                .animation = 6,
                                                .drawPriority = 1,
                                                .pal = 6,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_POCKET_ICON_8] = {
                                                .x = 240,
                                                .y = 16,
                                                .z = 0,
                                                .animation = 7,
                                                .drawPriority = 1,
                                                .pal = 7,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_PAGE_LEFT_BUTTON] = {
                                                .x = 24,
                                                .y = 176,
                                                .z = 0,
                                                .animation = 12,
                                                .drawPriority = 1,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_PAGE_RIGHT_BUTTON] = {
                                                .x = 64,
                                                .y = 176,
                                                .z = 0,
                                                .animation = 13,
                                                .drawPriority = 1,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_B_BUTTON] = {
                                                .x = 224,
                                                .y = 176,
                                                .z = 0,
                                                .animation = 16,
                                                .drawPriority = 1,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_CURSOR] = {
                                                .x = 16,
                                                .y = 16,
                                                .z = 0,
                                                .animation = 8,
                                                .drawPriority = 0,
                                                .pal = 9,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_ITEM_BUTTON_1] = {
                                                .x = 16,
                                                .y = 48,
                                                .z = 0,
                                                .animation = 19,
                                                .drawPriority = 1,
                                                .pal = 9,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_ITEM_BUTTON_2] = {
                                                .x = 144,
                                                .y = 48,
                                                .z = 0,
                                                .animation = 19,
                                                .drawPriority = 1,
                                                .pal = 9,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_ITEM_BUTTON_3] = {
                                                .x = 16,
                                                .y = 88,
                                                .z = 0,
                                                .animation = 19,
                                                .drawPriority = 1,
                                                .pal = 9,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_ITEM_BUTTON_4] = {
                                                .x = 144,
                                                .y = 88,
                                                .z = 0,
                                                .animation = 19,
                                                .drawPriority = 1,
                                                .pal = 9,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_ITEM_BUTTON_5] = {
                                                .x = 16,
                                                .y = 128,
                                                .z = 0,
                                                .animation = 19,
                                                .drawPriority = 1,
                                                .pal = 9,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_ITEM_BUTTON_6] = {
                                                .x = 144,
                                                .y = 128,
                                                .z = 0,
                                                .animation = 19,
                                                .drawPriority = 1,
                                                .pal = 9,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 1,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_UNUSED_CURSOR_2] = {
                                                .x = 16,
                                                .y = 48,
                                                .z = 0,
                                                .animation = 20,
                                                .drawPriority = 0,
                                                .pal = 9,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_CONTEXT_MENU_ICON_1] = {
                                                .x = 48,
                                                .y = 144,
                                                .z = 0,
                                                .animation = 22,
                                                .drawPriority = 0,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_CONTEXT_MENU_ICON_2] = {
                                                .x = 144,
                                                .y = 144,
                                                .z = 0,
                                                .animation = 22,
                                                .drawPriority = 0,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_CONTEXT_MENU_ICON_3] = {
                                                .x = 48,
                                                .y = 176,
                                                .z = 0,
                                                .animation = 22,
                                                .drawPriority = 0,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_CONTEXT_MENU_ICON_4] = {
                                                .x = 144,
                                                .y = 176,
                                                .z = 0,
                                                .animation = 22,
                                                .drawPriority = 0,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_UP] = {
                                                .x = 136,
                                                .y = 104,
                                                .z = 0,
                                                .animation = 25,
                                                .drawPriority = 0,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_TOSS_QUANTITY_TENS_PLACE_UP] = {
                                                .x = 168,
                                                .y = 104,
                                                .z = 0,
                                                .animation = 25,
                                                .drawPriority = 0,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_TOSS_QUANTITY_ONES_PLACE_UP] = {
                                                .x = 200,
                                                .y = 104,
                                                .z = 0,
                                                .animation = 25,
                                                .drawPriority = 0,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_DOWN] = {
                                                .x = 136,
                                                .y = 152,
                                                .z = 0,
                                                .animation = 27,
                                                .drawPriority = 0,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_TOSS_QUANTITY_TENS_PLACE_DOWN] = {
                                                .x = 168,
                                                .y = 152,
                                                .z = 0,
                                                .animation = 27,
                                                .drawPriority = 0,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_TOSS_QUANTITY_ONES_PLACE_DOWN] = {
                                                .x = 200,
                                                .y = 152,
                                                .z = 0,
                                                .animation = 27,
                                                .drawPriority = 0,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
    [BAG_APP_SPRITE_A_BUTTON] = {
                                                .x = 136,
                                                .y = 176,
                                                .z = 0,
                                                .animation = 31,
                                                .drawPriority = 0,
                                                .pal = 8,
                                                .vram = NNS_G2D_VRAM_TYPE_2DSUB,
                                                .resIdList = {
            [GF_GFX_RES_TYPE_CHAR] = BAG_APP_CHAR_TAG_03,
            [GF_GFX_RES_TYPE_PLTT] = BAG_APP_PLTT_TAG_02,
            [GF_GFX_RES_TYPE_CELL] = BAG_APP_CELL_TAG_03,
            [GF_GFX_RES_TYPE_ANIM] = BAG_APP_ANIM_TAG_04,
        },
                                                .bgPriority = 0,
                                                .vramTransfer = 0,
                                                },
};

static void BagApp_CreateSprites(BagAppData *appData) {
    u32 i;

    for (i = 0; i < 39; ++i) {
        appData->sprites[i] = SpriteSystem_NewSpriteWithYOffset(appData->spriteSystem, appData->spriteManager, &sSpriteTemplates[i], FX32_CONST(256));
    }
    ManagedSprite_SetPriority(appData->sprites[BAG_APP_SPRITE_B_BUTTON], 1);
    for (i = 0; i < 4; ++i) {
        ManagedSprite_SetPriority(appData->sprites[BAG_APP_SPRITE_CONTEXT_MENU_ICON_1 + i], 1);
    }
    for (i = 0; i < 8; ++i) {
        ManagedSprite_SetPriority(appData->sprites[BAG_APP_SPRITE_POCKET_ICON_1 + i], 1);
    }
    BagApp_SetPocketIconsDrawFlag(appData, 1);
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_UNUSED_MOVE_ITEM_CURSOR], FALSE);
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_MOVE_TYPE_ICON], FALSE);
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_MOVE_CATEGORY_ICON], FALSE);
    for (i = 0; i < 4; ++i) {
        ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_CONTEXT_MENU_ICON_1 + i], FALSE);
    }
    for (i = 0; i < 6; ++i) {
        ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_UP + i], FALSE);
    }
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_A_BUTTON], FALSE);
    ManagedSprite_SetPriority(appData->sprites[BAG_APP_SPRITE_A_BUTTON], 1);
}

static void ov15_021FFEC0(BagAppData *appData) {
    appData->unk_648 = 0;
}

static const u8 ov15_02200AB8[][4] = {
    // x, y, anim, pltt
    [BAG_APP_CURSOR_POS_POCKET_1] = { 16,  16,  8,  9 },
    [BAG_APP_CURSOR_POS_POCKET_2] = { 48,  16,  8,  9 },
    [BAG_APP_CURSOR_POS_POCKET_3] = { 80,  16,  8,  9 },
    [BAG_APP_CURSOR_POS_POCKET_4] = { 112, 16,  8,  9 },
    [BAG_APP_CURSOR_POS_POCKET_5] = { 144, 16,  8,  9 },
    [BAG_APP_CURSOR_POS_POCKET_6] = { 176, 16,  8,  9 },
    [BAG_APP_CURSOR_POS_POCKET_7] = { 208, 16,  8,  9 },
    [BAG_APP_CURSOR_POS_POCKET_8] = { 240, 16,  8,  9 },
    [BAG_APP_CURSOR_POS_ITEM_1] = { 48,  56,  10, 9 },
    [BAG_APP_CURSOR_POS_ITEM_2] = { 176, 56,  10, 9 },
    [BAG_APP_CURSOR_POS_ITEM_3] = { 48,  96,  10, 9 },
    [BAG_APP_CURSOR_POS_ITEM_4] = { 176, 96,  10, 9 },
    [BAG_APP_CURSOR_POS_ITEM_5] = { 48,  136, 10, 9 },
    [BAG_APP_CURSOR_POS_ITEM_6] = { 176, 136, 10, 9 },
    [BAG_APP_CURSOR_POS_PAGE_LEFT] = { 24,  176, 14, 9 },
    [BAG_APP_CURSOR_POS_PAGE_RIGHT] = { 64,  176, 14, 9 },
    [BAG_APP_CURSOR_POS_CANCEL] = { 224, 176, 17, 9 },
    [BAG_APP_CURSOR_POS_CONTEXT_MENU_1] = { 48,  144, 23, 9 },
    [BAG_APP_CURSOR_POS_CONTEXT_MENU_2] = { 144, 144, 23, 9 },
    [BAG_APP_CURSOR_POS_CONTEXT_MENU_3] = { 48,  176, 23, 9 },
    [BAG_APP_CURSOR_POS_CONTEXT_MENU_4] = { 144, 176, 23, 9 },
};

void BagApp_SetCursorSpritePos_PocketsItemsContext(BagAppData *appData, BagAppCursorPos cursorPos) {
    ManagedSprite_SetPositionXYWithSubscreenOffset(appData->sprites[BAG_APP_SPRITE_CURSOR], ov15_02200AB8[cursorPos][0], ov15_02200AB8[cursorPos][1], FX32_CONST(256));
    ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_CURSOR], ov15_02200AB8[cursorPos][2]);
    ManagedSprite_SetPaletteOverride(appData->sprites[BAG_APP_SPRITE_CURSOR], ov15_02200AB8[cursorPos][3]);
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_CURSOR], TRUE);
}

void BagApp_HideCursorSprite(BagAppData *appData) {
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_CURSOR], FALSE);
}

static const u8 ov15_02200A34[][4] = {
    // x, y, anim, pltt
    [BAG_APP_CURSOR_POS_ITEM_1 - 8] = { 48,  56,  20, 9 },
    [BAG_APP_CURSOR_POS_ITEM_2 - 8] = { 176, 56,  20, 9 },
    [BAG_APP_CURSOR_POS_ITEM_3 - 8] = { 48,  96,  20, 9 },
    [BAG_APP_CURSOR_POS_ITEM_4 - 8] = { 176, 96,  20, 9 },
    [BAG_APP_CURSOR_POS_ITEM_5 - 8] = { 48,  136, 20, 9 },
    [BAG_APP_CURSOR_POS_ITEM_6 - 8] = { 176, 136, 20, 9 },
    [BAG_APP_CURSOR_POS_PAGE_LEFT - 8] = { 24,  176, 14, 9 },
    [BAG_APP_CURSOR_POS_PAGE_RIGHT - 8] = { 64,  176, 14, 9 },
    [BAG_APP_CURSOR_POS_CANCEL - 8] = { 224, 176, 17, 9 },
};

void BagApp_SetCursorSpritePos_ItemsOnly(BagAppData *appData, int offset) {
    GF_ASSERT(offset < 9);
    if (offset == BAG_APP_CURSOR_POS_CANCEL - 8) {
        ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_CURSOR], ov15_02200A34[offset][2]);
    } else {
        BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
        int itemSlot = pocket->scroll + offset;
        if (itemSlot == appData->moveItemOriginalSlot) {
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_CURSOR], 10);
        } else if (itemSlot >= pocket->count) {
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_CURSOR], 40);
        } else {
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_CURSOR], 20);
        }
    }
    ManagedSprite_SetPositionXYWithSubscreenOffset(appData->sprites[BAG_APP_SPRITE_CURSOR], ov15_02200A34[offset][0], ov15_02200A34[offset][1], FX32_CONST(256));
    ManagedSprite_SetPaletteOverride(appData->sprites[BAG_APP_SPRITE_CURSOR], ov15_02200A34[offset][3]);
}

static const u8 ov15_022009D4[][4] = {
    // x, y, anim, pltt
    { 136, 104, 29, 9 },
    { 168, 104, 29, 9 },
    { 200, 104, 29, 9 },
    { 136, 160, 29, 9 },
    { 168, 160, 29, 9 },
    { 200, 160, 29, 9 },
    { 160, 176, 17, 9 },
    { 224, 176, 17, 9 },
};

void BagApp_SetCursorSpritePos_QuantitySelect(BagAppData *appData, int a1) {
    GF_ASSERT(a1 < 8);
    ManagedSprite_SetPositionXYWithSubscreenOffset(appData->sprites[BAG_APP_SPRITE_CURSOR], ov15_022009D4[a1][0], ov15_022009D4[a1][1], FX32_CONST(256));
    ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_CURSOR], ov15_022009D4[a1][2]);
    ManagedSprite_SetPaletteOverride(appData->sprites[BAG_APP_SPRITE_CURSOR], ov15_022009D4[a1][3]);
}

void ov15_02200030(BagAppData *appData, int pocket) {
    if (pocket <= 7) {
        u16 *pRawData = appData->unk_6A0->pRawData;
        GXS_LoadOBJPltt(pRawData + 128, 0, 128 * 2);
        GXS_LoadOBJPltt(pRawData + 16 * pocket, 16 * pocket * 2, 16 * 2);
    }
}

void ov15_0220005C(BagAppData *appData, int itemsOnPage, int hideItemSlot, int hideCursor) {
    int i;

    if (itemsOnPage == 0) {
        for (i = 0; i < 6; ++i) {
            ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_ITEM_BUTTON_1 + i], FALSE);
        }
        ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_UNUSED_CURSOR_2], FALSE);
    } else {
        for (i = 0; i < 6; ++i) {
            if (i < itemsOnPage) {
                ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_ITEM_BUTTON_1 + i], TRUE);
            } else {
                ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_ITEM_BUTTON_1 + i], FALSE);
            }
        }
        if (hideItemSlot >= 0) {
            ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_ITEM_BUTTON_1 + hideItemSlot], FALSE);
        }
        if (hideCursor) {
            ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_UNUSED_CURSOR_2], FALSE);
        }
    }
}

static void BagApp_UpdatePageNavArrowSpritesVisibility(BagAppData *appData) {
    if (appData->bagView->pockets[appData->bagView->curPocket].count <= 6) {
        ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_PAGE_LEFT_BUTTON], FALSE);
        ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_PAGE_RIGHT_BUTTON], FALSE);
    } else {
        ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_PAGE_LEFT_BUTTON], TRUE);
        ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_PAGE_RIGHT_BUTTON], TRUE);
    }
}

void BagApp_UpdateItemIconsVisibility(BagAppData *appData, BagViewPocket *pocket, int numShown, BOOL replaceIcon) {
    for (int i = 0; i < 6; ++i) {
        ManagedSprite_SetPositionXYWithSubscreenOffset(appData->sprites[BAG_APP_SPRITE_ITEM_ICON_1 + i], sSpriteTemplates[BAG_APP_SPRITE_ITEM_ICON_1 + i].x, sSpriteTemplates[BAG_APP_SPRITE_ITEM_ICON_1 + i].y, FX32_CONST(256));
        if (i < numShown) {
            if (replaceIcon) {
                BagApp_ReplaceItemIconResObjs(appData, i, appData->itemsInPocket[pocket->scroll + i]);
            }
            ManagedSprite_SetDrawFlag(appData->sprites[i + 1], TRUE);
        } else {
            ManagedSprite_SetDrawFlag(appData->sprites[i + 1], FALSE);
        }
    }
    BagApp_UpdatePageNavArrowSpritesVisibility(appData);
}

void BagApp_ShowOnlySelectedItemIcon(BagAppData *appData, BagViewPocket *pocket, int itemSlot) {
    int slotOnPage = -1;
    int scroll = (itemSlot / 6) * 6;
    if (pocket->scroll == scroll) {
        slotOnPage = itemSlot % 6;
    }
    for (int i = 0; i < 6; ++i) {
        ManagedSprite_SetPositionXYWithSubscreenOffset(appData->sprites[BAG_APP_SPRITE_ITEM_ICON_1 + i], sSpriteTemplates[BAG_APP_SPRITE_ITEM_ICON_1 + i].x, sSpriteTemplates[BAG_APP_SPRITE_ITEM_ICON_1 + i].y, FX32_CONST(256));
        if (i == slotOnPage) {
            ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_ITEM_ICON_1 + i], TRUE);
        } else {
            ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_ITEM_ICON_1 + i], FALSE);
        }
    }
    BagApp_UpdatePageNavArrowSpritesVisibility(appData);
}

void ov15_0220023C(BagAppData *appData, u8 *a1) {
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_CURSOR], TRUE);
    for (int i = 0; i < 4; ++i) {
        if (a1[i] != 0xFF) {
            ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_CONTEXT_MENU_ICON_1 + i], TRUE);
        } else {
            ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_CONTEXT_MENU_ICON_1 + i], FALSE);
        }
    }
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_PAGE_LEFT_BUTTON], FALSE);
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_PAGE_RIGHT_BUTTON], FALSE);
}

void BagApp_HideContextMenuIcons(BagAppData *appData) {
    for (int i = 0; i < 4; ++i) {
        ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_CONTEXT_MENU_ICON_1 + i], FALSE);
    }
}

void BagApp_CenterSelectedItemIconSprite(BagAppData *appData, int cursorPos) {
    for (int i = 0; i < 6; ++i) {
        if (cursorPos != i) {
            ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_ITEM_ICON_1 + i], FALSE);
        } else {
            ManagedSprite_SetPositionXYWithSubscreenOffset(appData->sprites[BAG_APP_SPRITE_ITEM_ICON_1 + i], 86, 76, FX32_CONST(256));
        }
    }
}

int BagApp_GetNumberWidthType(int a0) {
    int result = 0;
    if (a0 < 100) {
        result = 1;
    }
    if (a0 < 10) {
        result = 2;
    }
    return result;
}

static const int ov15_02200A58[2][6] = {
    { 0, 1, 3, 4 },
    { 0, 1, 2, 3, 4, 5 },
};

static const int ov15_02200A88[2][6] = {
    { 25, 25, 27, 27 },
    { 25, 25, 25, 27, 27, 27 },
};

static const int ov15_02200998[2] = { 4, 6 };

static const int ov15_02200A14[2][4] = {
    { 0, 3 },
    { 0, 1, 3, 4 },
};

static const int ov15_022009A0[2] = { 2, 4 };

void BagApp_ShowQuantitySelectSpritesUI(BagAppData *appData, int a1, int a2) {
    int i;
    if (a1 == 2 && a2 > 99) {
        a2 = 99;
    }
    for (i = 0; i < ov15_02200998[a1 - 2]; ++i) {
        ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_UP + ov15_02200A58[a1 - 2][i]], TRUE);
        ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_UP + ov15_02200A58[a1 - 2][i]], ov15_02200A88[a1 - 2][i]);
    }
    int r0 = BagApp_GetNumberWidthType(a2);
    if (r0 != 0) {
        if (a1 - 2 == 0 && r0 == 2) {
            ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_UP], FALSE);
            ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_DOWN], FALSE);
        } else if (a1 - 2 == 1) {
            for (i = 0; i < ov15_022009A0[r0 - 1]; ++i) {
                ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_UP + ov15_02200A14[r0 - 1][i]], FALSE);
            }
        }
    }
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_A_BUTTON], TRUE);
    ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_A_BUTTON], 0);
    ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_A_BUTTON], 37);
    ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_B_BUTTON], 0);
    ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_B_BUTTON], 39);
}

void ov15_02200428(BagAppData *appData) {
    for (int i = 0; i < 6; ++i) {
        ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_UP + i], FALSE);
    }
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_A_BUTTON], FALSE);
}

void BagApp_SetPocketIconsDrawFlag(BagAppData *appData, int drawState) {
    int i;
    u8 enabledPocketFlags[POCKETS_COUNT];

    GF_ASSERT(drawState == 1 || drawState == 0);

    MI_CpuClear8(enabledPocketFlags, POCKETS_COUNT);
    for (i = 0; i < POCKETS_COUNT; ++i) {
        GF_ASSERT(appData->bagView->pockets[i].pocketId < POCKETS_COUNT);
        if (appData->bagView->pockets[i].slots != NULL) {
            enabledPocketFlags[appData->bagView->pockets[i].pocketId] = 1;
        }
    }
    for (i = 0; i < POCKETS_COUNT; ++i) {
        if (enabledPocketFlags[i]) {
            ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_POCKET_ICON_1 + i], drawState);
        } else {
            ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_POCKET_ICON_1 + i], FALSE);
        }
    }
}

void BagApp_SetBButtonSpriteDrawFlag(BagAppData *appData, int flag) {
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_B_BUTTON], flag);
}
