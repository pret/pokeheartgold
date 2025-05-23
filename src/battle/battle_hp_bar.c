#include "battle/battle_hp_bar.h"

#include "global.h"

#include "battle/battle_system.h"
#include "msgdata/msg/msg_0197.h"

#include "math_util.h"
#include "unk_0208805C.h"

typedef enum HPBarType {
    HP_BAR_TYPE_SINGLE_PLAYER,
    HP_BAR_TYPE_SINGLE_ENEMY,
    HP_BAR_TYPE_DOUBLE_PLAYER_LHS,
    HP_BAR_TYPE_DOUBLE_ENEMY_LHS,
    HP_BAR_TYPE_DOUBLE_PLAYER_RHS,
    HP_BAR_TYPE_DOUBLE_ENEMY_RHS,
    HP_BAR_TYPE_SAFARI,
    HP_BAR_TYPE_PALPARK,
} HPBarType;

#ifdef FAST_HP_BARS
#define USE_SUBPIXELS_TEST (TRUE)
#else
#define USE_SUBPIXELS_TEST (maxHp < pixelsWide)
#endif // FAST_HP_BARS

ALIGN(4)
static const s8 sHpBarArrowXOffsets[] = {
    72,
    0,
    72,
    0,
    72,
    0,
};

typedef struct UnkStruct_ov12_0226D408 {
    u16 offset;
    u16 size;
} UnkStruct_ov12_0226D408;

static const UnkStruct_ov12_0226D408 ov12_0226D680[][4] = {
    {
     { 0x260, 0xA0 },
     { 0x360, 0xA0 },
     { 0xA00, 0x60 },
     { 0xB00, 0x60 },
     },
    {
     { 0x220, 0xE0 },
     { 0x320, 0xE0 },
     { 0xA00, 0x20 },
     { 0xB00, 0x20 },
     },
    {
     { 0x240, 0xC0 },
     { 0x340, 0xC0 },
     { 0xA00, 0x40 },
     { 0xB00, 0x40 },
     },
    {
     { 0x220, 0xE0 },
     { 0x320, 0xE0 },
     { 0xA00, 0x20 },
     { 0xB00, 0x20 },
     },
    {
     { 0x240, 0xC0 },
     { 0x340, 0xC0 },
     { 0xA00, 0x40 },
     { 0xB00, 0x40 },
     },
    {
     { 0x220, 0xE0 },
     { 0x320, 0xE0 },
     { 0xA00, 0x20 },
     { 0xB00, 0x20 },
     },
};

static const UnkStruct_ov12_0226D408 ov12_0226D4B0[][2] = {
    {
     { 0xA60, 0x40 },
     { 0xB60, 0x40 },
     },
    {
     { 0xA20, 0x40 },
     { 0xB20, 0x40 },
     },
    {
     { 0xA40, 0x40 },
     { 0xB40, 0x40 },
     },
    {
     { 0xA20, 0x40 },
     { 0xB20, 0x40 },
     },
    {
     { 0xA40, 0x40 },
     { 0xB40, 0x40 },
     },
    {
     { 0xA20, 0x40 },
     { 0xB20, 0x40 },
     },
};

static const UnkStruct_ov12_0226D408 ov12_0226D420[][2] = {
    {
     { 0xAA0, 0x60 },
     { 0xBA0, 0x60 },
     },
    {
     { 0xA60, 0x60 },
     { 0xB60, 0x60 },
     },
    {
     { 0xA80, 0x60 },
     { 0xB80, 0x60 },
     },
    {
     { 0xA60, 0x60 },
     { 0xB60, 0x60 },
     },
    {
     { 0xA80, 0x60 },
     { 0xB80, 0x60 },
     },
    {
     { 0xA60, 0x60 },
     { 0xB60, 0x60 },
     },
};

static const UnkStruct_ov12_0226D408 ov12_0226D450[][2] = {
    {
     { 0, 0 },
     { 0xD00, 0x60 },
     },
    {
     { 0x620, 0x60 },
     { 0, 0 },
     },
    {
     { 0, 0 },
     { 0xC00, 0x60 },
     },
    {
     { 0x620, 0x60 },
     { 0, 0 },
     },
    {
     { 0, 0 },
     { 0xC00, 0x60 },
     },
    {
     { 0x620, 0x60 },
     { 0, 0 },
     },
};

static const UnkStruct_ov12_0226D408 ov12_0226D3F0[] = {
    { 0xD80, 0x60 },
    { 0x6A0, 0x60 },
    { 0xC80, 0x60 },
    { 0x6A0, 0x60 },
    { 0xC80, 0x60 },
    { 0x6A0, 0x60 },
};

static const UnkStruct_ov12_0226D408 ov12_0226D480[][2] = {
    {
     { 0x4E0, 0 },
     { 0xC20, 0xC0 },
     },
    {
     { 0x4E0, 0x20 },
     { 0xC00, 0xA0 },
     },
    {
     { 0x4E0, 0 },
     { 0xC00, 0xC0 },
     },
    {
     { 0x4E0, 0x20 },
     { 0xC00, 0xA0 },
     },
    {
     { 0x4E0, 0 },
     { 0xC00, 0xC0 },
     },
    {
     { 0x4E0, 0x20 },
     { 0xC00, 0xA0 },
     },
};

static const UnkStruct_ov12_0226D408 ov12_0226D3C0[] = {
    { 0x460, 0x20 },
    { 0x420, 0x20 },
    { 0x440, 0x20 },
    { 0x420, 0x20 },
    { 0x440, 0x20 },
    { 0x420, 0x20 },
};

static const UnkStruct_ov12_0226D408 ov12_0226D390[] = {
    { 0x480, 0x60 },
    { 0x440, 0x60 },
    { 0x460, 0x60 },
    { 0x440, 0x60 },
    { 0x460, 0x60 },
    { 0x440, 0x60 },
};

static const UnkStruct_ov12_0226D408 ov12_0226D370[] = {
    { 0x240, 0xC0 },
    { 0x340, 0xC0 },
    { 0xA00, 0xE0 },
    { 0xB00, 0xE0 },
};

static const UnkStruct_ov12_0226D408 ov12_0226D380[] = {
    { 0x440, 0xC0 },
    { 0x540, 0xC0 },
    { 0xC00, 0xE0 },
    { 0xD00, 0xE0 },
};

static const UnkStruct_ov12_0226D408 ov12_0226D3A8[] = {
    { 0,     0    },
    { 0,     0    },
    { 0x4C0, 0x40 },
    { 0,     0    },
    { 0x4C0, 0x40 },
    { 0,     0    },
};

static const UnkStruct_ov12_0226D408 ov12_0226D3D8[] = {
    { 0,     0    },
    { 0,     0    },
    { 0xCC0, 0x20 },
    { 0,     0    },
    { 0xCC0, 0x20 },
    { 0,     0    },
};

static const UnkStruct_ov12_0226D408 ov12_0226D408[] = {
    { 0,     0    },
    { 0,     0    },
    { 0xC60, 0x20 },
    { 0,     0    },
    { 0xC60, 0x20 },
    { 0,     0    },
};

static void ov12_02264824(SpriteSystem *renderer, SpriteManager *gfxHandler, NARC *narc, PaletteData *plttData, int barType);
static void ov12_022648EC(SpriteSystem *renderer, SpriteManager *gfxHandler, NARC *narc, PaletteData *plttData, int barType);
static ManagedSprite *ov12_02264968(SpriteSystem *renderer, SpriteManager *gfxHandler, int barType);
static void ov12_02264B28(BattleHpBar *hpBar);
static void ov12_02264B4C(BattleHpBar *hpBar);
static void ov12_02264B60(BattleHpBar *hpBar);
static void ov12_02264B94(BattleHpBar *hpBar);
static void ov12_02264F00(BattleHpBar *hpBar, int a1);
static void ov12_02264F44(BattleHpBar *hpBar, int x, int y);
static void ov12_02265054(SysTask *task, void *data);
static void ov12_0226516C(BattleHpBar *hpBar);
static void ov12_022652D0(BattleHpBar *hpBar);
static void ov12_02265354(BattleHpBar *hpBar);
static void ov12_02265474(BattleHpBar *hpBar, u32 num);
static void ov12_02265500(BattleHpBar *hpBar);
static void ov12_02265560(BattleHpBar *hpBar);
static void ov12_022655B0(BattleHpBar *hpBar, int a1);
static void BattleHpBar_PrintSafariOrParkBallsString(BattleHpBar *hpBar, u32 flag);
static void BattleHpBar_PrintNumRemainingSafariOrParkBalls(BattleHpBar *hpBar, u32 flag);
static int ov12_022657E4(BattleHpBar *hpBar, BOOL isExp);
static void ov12_02265878(BattleHpBar *hpBar, u8 isExp);
static int BattleHpBar_CalculatePixelsChangeFrame(s32 maxHp, s32 curHp, s32 deltaHp, s32 *pHpCalc, u8 tilesWide, u16 hpChange);
static u8 BattleHpBar_Util_MakeHpBarPixelBuffer(s32 maxHp, s32 hp, s32 deltaHp, s32 *pHpCalc, u8 *pixelBuf, u8 tilesWide);
static u32 BattleHpBar_Util_GetPixelsToGain(s32 exp, s32 gainedExp, s32 maxExp, u8 tilesWide);
static const u8 *BattleHpBar_Util_GetComponentRawGraphic(int componentId);
static const ManagedSpriteTemplate *BattleHpBar_Util_GetHpBoxSpriteTemplate(u8 barType);
static const ManagedSpriteTemplate *BattleHpBar_Util_GetArrowSpriteTemplate(u8 barType);
static void Task_ExpBarFullFlash(SysTask *task, void *data);
static void ov12_02265D78(BattleHpBar *hpBar);
static void ov12_02265DA0(BattleHpBar *hpBar);
static void ov12_02265DC4(SysTask *task, void *data);

static const ManagedSpriteTemplate sSpriteTemplate_HpBarSinglePlayer = {
    .x = 0xC0,
    .y = 0x74,
    .z = 0,
    .animation = 0,
    .spritePriority = 0x17,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList = {
                  0xBF,
                  20006,
                  0xBE,
                  0xBD,
                  -1,
                  -1,
                  },
    .bgPriority = 0,
    .vramTransfer = 0
};

static const ManagedSpriteTemplate sSpriteTemplate_HpBarSingleEnemy = {
    .x = 0x3A,
    .y = 0x24,
    .z = 0,
    .animation = 0,
    .spritePriority = 0x18,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList = {
                  0xBC,
                  20006,
                  0xBB,
                  0xBA,
                  -1,
                  -1,
                  },
    .bgPriority = 0,
    .vramTransfer = 0
};

static const ManagedSpriteTemplate sSpriteTemplate_HpBarDoublePlayerLHS = {
    .x = 0xC0,
    .y = 0x67,
    .z = 0,
    .animation = 0,
    .spritePriority = 0x1C,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList = {
                  0xC8,
                  20006,
                  0xC7,
                  0xC6,
                  -1,
                  -1,
                  },
    .bgPriority = 0,
    .vramTransfer = 0
};

static const ManagedSpriteTemplate sSpriteTemplate_HpBarDoubleEnemyLHS = {
    .x = 0x40,
    .y = 0x10,
    .z = 0,
    .animation = 0,
    .spritePriority = 0x19,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList = {
                  0xC2,
                  20006,
                  0xC1,
                  0xC0,
                  -1,
                  -1,
                  },
    .bgPriority = 0,
    .vramTransfer = 0
};

static const ManagedSpriteTemplate sSpriteTemplate_HpBarDoublePlayerRHS = {
    .x = 0xC6,
    .y = 0x84,
    .z = 0,
    .animation = 0,
    .spritePriority = 0x1A,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList = {
                  0xCB,
                  20006,
                  0xCA,
                  0xC9,
                  -1,
                  -1,
                  },
    .bgPriority = 0,
    .vramTransfer = 0
};

static const ManagedSpriteTemplate sSpriteTemplate_HpBarDoubleEnemyRHS = {
    .x = 0x3A,
    .y = 0x2D,
    .z = 0,
    .animation = 0,
    .spritePriority = 0x1B,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList = {
                  0xC5,
                  20006,
                  0xC4,
                  0xC3,
                  -1,
                  -1,
                  },
    .bgPriority = 0,
    .vramTransfer = 0
};

static const ManagedSpriteTemplate sSpriteTemplate_Arrow = {
    .x = 0,
    .y = 0,
    .z = 0,
    .animation = 0,
    .spritePriority = 0x11,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList = {
                  0xB9,
                  20006,
                  0xB8,
                  0xB7,
                  -1,
                  -1,
                  },
    .bgPriority = 0,
    .vramTransfer = 0
};

static const ManagedSpriteTemplate sSpriteTemplate_HpBarSafariOrPark = {
    .x = 0xC0,
    .y = 0x74,
    .z = 0,
    .animation = 0,
    .spritePriority = 0x17,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList = {
                  0xFD,
                  20008,
                  0xFE,
                  0xFF,
                  -1,
                  -1,
                  },
    .bgPriority = 0,
    .vramTransfer = 0
};

#include "battle/battle_hp_bar_data.h"

static void ov12_02264824(SpriteSystem *renderer, SpriteManager *gfxHandler, NARC *narc, PaletteData *plttData, int barType) {
    const ManagedSpriteTemplate *pRes = BattleHpBar_Util_GetHpBoxSpriteTemplate(barType);

    SpriteSystem_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CHAR], TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, pRes->resIdList[GF_GFX_RES_TYPE_CHAR]);
    SpriteSystem_LoadPaletteBufferFromOpenNarc(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 71, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20006);
    SpriteSystem_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CELL], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_CELL]);
    SpriteSystem_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_ANIM], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_ANIM]);
    SpriteSystem_LoadPaletteBufferFromOpenNarc(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 71, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20007);
    if (barType == 6 || barType == 7) {
        SpriteSystem_LoadPaletteBufferFromOpenNarc(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 81, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20008);
    }
}

static void ov12_022648EC(SpriteSystem *renderer, SpriteManager *gfxHandler, NARC *narc, PaletteData *plttData, int barType) {
    const ManagedSpriteTemplate *pRes = BattleHpBar_Util_GetArrowSpriteTemplate(barType);

    if (pRes != NULL) {
        SpriteSystem_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CHAR], TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, pRes->resIdList[GF_GFX_RES_TYPE_CHAR]);
        SpriteSystem_LoadPaletteBufferFromOpenNarc(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 71, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20006);
        SpriteSystem_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CELL], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_CELL]);
        SpriteSystem_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_ANIM], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_ANIM]);
    }
}

static ManagedSprite *ov12_02264968(SpriteSystem *renderer, SpriteManager *gfxHandler, int barType) {
    const ManagedSpriteTemplate *pRes = BattleHpBar_Util_GetHpBoxSpriteTemplate(barType);

    ManagedSprite *ret = SpriteSystem_NewSprite(renderer, gfxHandler, pRes);
    Sprite_TickFrame(ret->sprite);
    return ret;
}

void ov12_0226498C(BattleHpBar *hpBar, u32 num, u32 flag) {
    GF_ASSERT(hpBar->boxObj != NULL);
    if (hpBar->type == HP_BAR_TYPE_SAFARI) {
        flag &= 0xC00;
    } else if (hpBar->type == HP_BAR_TYPE_PALPARK) {
        flag &= 0x3000;
    } else {
        flag &= ~0x3C00;
    }
    switch (hpBar->type) {
    case HP_BAR_TYPE_SINGLE_ENEMY:
    case HP_BAR_TYPE_DOUBLE_ENEMY_LHS:
    case HP_BAR_TYPE_DOUBLE_ENEMY_RHS:
        flag &= ~0x26;
        break;
    case HP_BAR_TYPE_DOUBLE_PLAYER_LHS:
    case HP_BAR_TYPE_DOUBLE_PLAYER_RHS:
        flag &= ~0x220;
        if (hpBar->unk_4F_3 == 0) {
            flag &= ~6;
        } else {
            flag &= ~1;
        }
        break;
    case HP_BAR_TYPE_SINGLE_PLAYER:
        flag &= ~0x200;
        break;
    case HP_BAR_TYPE_SAFARI:
    case HP_BAR_TYPE_PALPARK:
        break;
    }
    if (BattleSystem_GetBattleType(hpBar->bsys) & BATTLE_TYPE_TRAINER) {
        flag &= ~0x200;
    }

    if (flag & 1) {
        ov12_02264DCC(hpBar, 0);
        ov12_022657E4(hpBar, FALSE);
    }

    if (flag & 2) {
        ov12_02265474(hpBar, num);
    }

    if (flag & 4) {
        ov12_02265500(hpBar);
    }

    if (flag & 0x80 || flag & 0x40) {
        ov12_022652D0(hpBar);
    }

    if (flag & 8) {
        ov12_02265354(hpBar);
    }

    if (flag & 0x10) {
        ov12_0226516C(hpBar);
    }

    if (flag & 0x20) {
        ov12_02264E34(hpBar, 0);
        ov12_022657E4(hpBar, TRUE);
    }

    if (flag & 0x200) {
        ov12_02265560(hpBar);
    }

    if (flag & 0x100) {
        switch (hpBar->unk_4A) {
        case 0:
        default:
            ov12_022655B0(hpBar, 38);
            break;
        case 1:
            ov12_022655B0(hpBar, 47);
            break;
        case 2:
            ov12_022655B0(hpBar, 50);
            break;
        case 3:
            ov12_022655B0(hpBar, 53);
            break;
        case 4:
            ov12_022655B0(hpBar, 44);
            break;
        case 5:
            ov12_022655B0(hpBar, 41);
            break;
        }
    }

    if (flag & 0x1400) {
        BattleHpBar_PrintSafariOrParkBallsString(hpBar, flag);
    }

    if (flag & 0x2800) {
        BattleHpBar_PrintNumRemainingSafariOrParkBalls(hpBar, flag);
    }
}

static void ov12_02264B28(BattleHpBar *hpBar) {
    if (hpBar->sysTask != NULL) {
        SysTask_Destroy(hpBar->sysTask);
        hpBar->sysTask = NULL;
    }
    if (hpBar->boxObj != NULL) {
        Sprite_DeleteAndFreeResources(hpBar->boxObj);
        hpBar->boxObj = NULL;
    }
}

static void ov12_02264B4C(BattleHpBar *hpBar) {
    if (hpBar->arrowObj != NULL) {
        Sprite_DeleteAndFreeResources(hpBar->arrowObj);
        hpBar->arrowObj = NULL;
    }
}

static void ov12_02264B60(BattleHpBar *hpBar) {
    const ManagedSpriteTemplate *tmplate = BattleHpBar_Util_GetHpBoxSpriteTemplate(hpBar->type);
    SpriteSystem *renderer = BattleSystem_GetSpriteRenderer(hpBar->bsys);
    SpriteManager *gfxHandler = BattleSystem_GetGfxHandler(hpBar->bsys);
    SpriteManager_UnloadCharObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_CHAR]);
    SpriteManager_UnloadCellObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_CELL]);
    SpriteManager_UnloadAnimObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_ANIM]);
}

static void ov12_02264B94(BattleHpBar *hpBar) {
    const ManagedSpriteTemplate *tmplate = BattleHpBar_Util_GetArrowSpriteTemplate(hpBar->type);
    if (tmplate != NULL) {
        SpriteSystem *renderer = BattleSystem_GetSpriteRenderer(hpBar->bsys);
        SpriteManager *gfxHandler = BattleSystem_GetGfxHandler(hpBar->bsys);
        SpriteManager_UnloadCharObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_CHAR]);
        SpriteManager_UnloadCellObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_CELL]);
        SpriteManager_UnloadAnimObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_ANIM]);
    }
}

#ifdef NONMATCHING
void BattleHpBar_LoadResources(BattleHpBar *hpBar) {
    const ManagedSpriteTemplate *tmplate;
    SpriteSystem *renderer;
    SpriteManager *gfxHandler;
    PaletteData *plttData;
    NARC *narc;

    narc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

    renderer = BattleSystem_GetSpriteRenderer(hpBar->bsys);
    gfxHandler = BattleSystem_GetGfxHandler(hpBar->bsys);
    plttData = BattleSystem_GetPaletteData(hpBar->bsys);

    tmplate = BattleHpBar_Util_GetHpBoxSpriteTemplate(hpBar->type);

    ov12_02264824(renderer, gfxHandler, narc, plttData, hpBar->type);
    hpBar->boxObj = ov12_02264968(renderer, gfxHandler, hpBar->type);

    ov12_022648EC(renderer, gfxHandler, narc, plttData, hpBar->type);
    if (hpBar->arrowObj != NULL) {
        Sprite_SetPositionXY(hpBar->arrowObj->sprite, tmplate->x - sHpBarArrowXOffsets[hpBar->type], tmplate->y + 0);
    }
    NARC_Delete(narc);
}
#else
// clang-format off
asm void BattleHpBar_LoadResources(BattleHpBar *hpBar) {
    push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl BattleSystem_GetSpriteRenderer
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	bl BattleSystem_GetGfxHandler
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	bl BattleSystem_GetPaletteData
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0, #0]
	bl BattleHpBar_Util_GetHpBoxSpriteTemplate
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0, #0]
	ldr r1, [sp, #4]
	ldr r3, [sp, #8]
	str r0, [sp, #0]
	add r0, r7, #0
	add r2, r6, #0
	bl ov12_02264824
	add r2, r5, #0
	add r2, #0x25
	ldrb r2, [r2, #0]
	ldr r1, [sp, #4]
	add r0, r7, #0
	bl ov12_02264968
	str r0, [r5, #4]
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0, #0]
	ldr r1, [sp, #4]
	ldr r3, [sp, #8]
	str r0, [sp, #0]
	add r0, r7, #0
	add r2, r6, #0
	bl ov12_022648EC
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02264C5A
	add r5, #0x25
	ldrb r3, [r5, #0]
	ldr r2, =sHpBarArrowXOffsets
	mov r1, #0
	ldrsh r1, [r4, r1]
	ldrsb r2, [r2, r3]
	ldr r0, [r0, #0]
	sub r1, r1, r2
	mov r2, #2
	lsl r1, r1, #0x10
	ldrsh r2, [r4, r2]
	asr r1, r1, #0x10
	bl Sprite_SetPositionXY
_02264C5A:
	add r0, r6, #0
	bl NARC_Delete
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
}
// clang-format on
#endif // NONMATCHING

void BattleHpBar_FreeResources(BattleHpBar *hpBar) {
    ov12_02264B28(hpBar);
    ov12_02264B60(hpBar);
    ov12_02264B4C(hpBar);
    ov12_02264B94(hpBar);
}

void ov12_02264C84(BattleHpBar *hpBar) {
    const u8 *src;
    void *vramBaseAddr;
    NNSG2dImageProxy *imgProxy;

    switch (hpBar->type) {
    case HP_BAR_TYPE_DOUBLE_PLAYER_LHS:
    case HP_BAR_TYPE_DOUBLE_PLAYER_RHS:
        hpBar->unk_4F_3 ^= 1;
        vramBaseAddr = G2_GetOBJCharPtr();
        imgProxy = Sprite_GetImageProxy(hpBar->boxObj->sprite);
        if (hpBar->unk_4F_3 == 1) {
            src = BattleHpBar_Util_GetComponentRawGraphic(70);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3A8[hpBar->type].offset + 0x20 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            src = BattleHpBar_Util_GetComponentRawGraphic(71);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3D8[hpBar->type].offset + 0x20 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            src = BattleHpBar_Util_GetComponentRawGraphic(69);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D408[hpBar->type].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D408[hpBar->type].size);
            ov12_0226498C(hpBar, hpBar->hp, 6);
        } else {
            src = BattleHpBar_Util_GetComponentRawGraphic(66);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3A8[hpBar->type].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D3A8[hpBar->type].size);
            src = BattleHpBar_Util_GetComponentRawGraphic(68);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3D8[hpBar->type].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D3D8[hpBar->type].size);
            src = BattleHpBar_Util_GetComponentRawGraphic(38);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3D8[hpBar->type].offset + 0x20 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            ov12_0226498C(hpBar, hpBar->hp, 1);
        }
    }
}

void ov12_02264DCC(BattleHpBar *hpBar, int hp) {
    hpBar->hpCalc = 0x80000000;
    if (hpBar->hp + hp < 0) {
        hp -= (hpBar->hp + hp);
    }
    if (hpBar->hp + hp > hpBar->maxHp) {
        hp -= ((hpBar->hp + hp) - hpBar->maxHp);
    }
    hpBar->gainedHp = -hp;
    if (hpBar->hp < 0) {
        hpBar->hp = 0;
    }
    if (hpBar->hp > hpBar->maxHp) {
        hpBar->hp = hpBar->maxHp;
    }
}

int ov12_02264E00(BattleHpBar *hpBar) {
    int r4 = ov12_022657E4(hpBar, FALSE);
    if (r4 == -1) {
        hpBar->hp -= hpBar->gainedHp;
        ov12_0226498C(hpBar, hpBar->hp, 2);
    } else {
        ov12_0226498C(hpBar, r4, 2);
    }
    return r4;
}

void ov12_02264E34(BattleHpBar *hpBar, int exp) {
    hpBar->expCalc = 0x80000000;
    if (hpBar->exp + exp < 0) {
        exp -= (hpBar->exp + exp);
    }
    if (hpBar->exp + exp > hpBar->maxExp) {
        exp -= ((hpBar->exp + exp) - hpBar->maxExp);
    }
    hpBar->gainedExp = -exp;
    if (hpBar->exp < 0) {
        hpBar->exp = 0;
    }
    if (hpBar->exp > hpBar->maxExp) {
        hpBar->exp = hpBar->maxExp;
    }
}

int ov12_02264E68(BattleHpBar *hpBar) {
    int ret = ov12_022657E4(hpBar, TRUE);
    if (ret == -1) {
        hpBar->exp -= hpBar->gainedExp;
    }
    return ret;
}

void ov12_02264E84(BattleHpBar *hpBar) {
    if (hpBar->arrowObj != NULL) {
        Sprite_SetAnimActiveFlag(hpBar->arrowObj->sprite, TRUE);
        ov12_02264F00(hpBar, 1);
    }
    if (!(BattleSystem_GetBattleType(hpBar->bsys) & (BATTLE_TYPE_PAL_PARK | BATTLE_TYPE_SAFARI))) {
        ov12_02265D78(hpBar);
    }
}

void ov12_02264EB4(BattleHpBar *hpBar) {
    if (hpBar->arrowObj != NULL) {
        Sprite_SetAnimActiveFlag(hpBar->arrowObj->sprite, FALSE);
        Sprite_SetAnimationFrame(hpBar->arrowObj->sprite, 0);
        ov12_02264F00(hpBar, 0);
    }
    ov12_02265DA0(hpBar);
}

void ov12_02264EE0(BattleHpBar *hpBar, int prio) {
    if (hpBar->boxObj != NULL) {
        ManagedSprite_SetPriority(hpBar->boxObj, prio);
        if (hpBar->arrowObj != NULL) {
            ManagedSprite_SetPriority(hpBar->arrowObj, prio);
        }
    }
}

static void ov12_02264F00(BattleHpBar *hpBar, int a1) {
    if (hpBar->arrowObj != NULL) {
        if (!(BattleSystem_GetBattleType(hpBar->bsys) & (BATTLE_TYPE_PAL_PARK | BATTLE_TYPE_SAFARI)) || a1 != TRUE) {
            ManagedSprite_SetDrawFlag(hpBar->arrowObj, a1);
        }
    }
}

void BattleHpBar_SetEnabled(BattleHpBar *hpBar, BOOL a1) {
    if (hpBar->boxObj != NULL) {
        ManagedSprite_SetDrawFlag(hpBar->boxObj, a1);
        ov12_02264F00(hpBar, a1);
    }
}

#ifdef NONMATCHING
static void ov12_02264F44(BattleHpBar *hpBar, int x, int y) {
    const ManagedSpriteTemplate *tmplate;

    GF_ASSERT(hpBar->boxObj != NULL);

    tmplate = BattleHpBar_Util_GetHpBoxSpriteTemplate(hpBar->type);

    Sprite_SetPositionXY(hpBar->boxObj->sprite, tmplate->x + x, tmplate->y + y);
    if (hpBar->arrowObj != NULL) {
        Sprite_SetPositionXY(hpBar->arrowObj->sprite,
            tmplate->x + x - sHpBarArrowXOffsets[hpBar->type],
            tmplate->y + y + 0);
    }
}
#else
// clang-format off
asm static void ov12_02264F44(BattleHpBar *hpBar, int x, int y) {
    push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r6, r1, #0
	add r7, r2, #0
	cmp r0, #0
	bne _02264F56
	bl GF_AssertFail
_02264F56:
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0, #0]
	bl BattleHpBar_Util_GetHpBoxSpriteTemplate
	add r4, r0, #0
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #4]
	add r1, r1, r6
	add r2, r2, r7
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r0, #0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02264FA8
	add r5, #0x25
	ldrb r3, [r5, #0]
	mov r1, #0
	ldr r2, =sHpBarArrowXOffsets
	ldrsh r1, [r4, r1]
	ldrsb r2, [r2, r3]
	ldr r0, [r0, #0]
	add r1, r1, r6
	sub r1, r1, r2
	mov r2, #2
	ldrsh r2, [r4, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r2, r7
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
_02264FA8:
	pop {r3, r4, r5, r6, r7, pc}
}
// clang-format on
#endif // NONMATCHING

void ov12_02264FB0(BattleHpBar *hpBar, BOOL a1) {
    GF_ASSERT(hpBar != NULL);
    GF_ASSERT(hpBar->boxObj != NULL);
    hpBar->unk_4F_1 = FALSE;
    hpBar->unk_4F_0 = a1;
    if (!a1) {
        switch (hpBar->type) {
        case HP_BAR_TYPE_SINGLE_PLAYER:
        case HP_BAR_TYPE_DOUBLE_PLAYER_LHS:
        case HP_BAR_TYPE_DOUBLE_PLAYER_RHS:
        case HP_BAR_TYPE_SAFARI:
        case HP_BAR_TYPE_PALPARK:
            ov12_02264F44(hpBar, 160, 0);
            break;
        default:
            ov12_02264F44(hpBar, -160, 0);
            break;
        }
    } else {
        ov12_02264F44(hpBar, 0, 0);
    }
    SysTask_CreateOnMainQueue(ov12_02265054, hpBar, 990);
}

#ifdef NONMATCHING
static void ov12_02265054(SysTask *task, void *data) {
    BattleHpBar *hpBar = data;
    s16 x, y;
    const ManagedSpriteTemplate *r6;
    int r4;

    r4 = 0;
    r6 = BattleHpBar_Util_GetHpBoxSpriteTemplate(hpBar->type);
    ManagedSprite_GetPositionXY(hpBar->boxObj, &x, &y);

    switch (hpBar->type) {
    case HP_BAR_TYPE_SINGLE_PLAYER:
    case HP_BAR_TYPE_DOUBLE_PLAYER_LHS:
    case HP_BAR_TYPE_DOUBLE_PLAYER_RHS:
    case HP_BAR_TYPE_SAFARI:
    case HP_BAR_TYPE_PALPARK:
        if (hpBar->unk_4F_0 == 0) {
            x -= 24;
            if (x < r6->x) {
                x = r6->x;
                r4++;
            }
        } else {
            x += 24;
            if (x > r6->x + 160) {
                x = r6->x + 160;
                r4++;
            }
        }
        break;
    default:
        if (hpBar->unk_4F_0 == 0) {
            x += 24;
            if (x > r6->x) {
                x = r6->x;
                r4++;
            }
        } else {
            x -= 24;
            if (x < r6->x - 24) {
                x = r6->x - 24;
                r4++;
            }
        }
        break;
    }
    ManagedSprite_SetPositionXY(hpBar->boxObj, x, y);
    if (hpBar->arrowObj != NULL) {
        ManagedSprite_SetPositionXY(hpBar->arrowObj, x - sHpBarArrowXOffsets[hpBar->type], y + 0);
    }

    if (r4 > 0) {
        hpBar->unk_4F_1 = TRUE;
        SysTask_Destroy(task);
        return;
    }
}
#else
// clang-format off
asm static void ov12_02265054(SysTask *task, void *data) {
    push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0, #0]
	mov r4, #0
	bl BattleHpBar_Util_GetHpBoxSpriteTemplate
	add r6, r0, #0
	add r1, sp, #0
	ldr r0, [r5, #4]
	add r1, #2
	add r2, sp, #0
	bl ManagedSprite_GetPositionXY
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0, #0]
	cmp r0, #7
	bhi _022650DA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226508A:
	lsl r6, r1, #0  // .short _0226509A - _0226508A - 2 ; case 0
	lsl r6, r1, #1  // .short _022650DA - _0226508A - 2 ; case 1
	lsl r6, r1, #0  // .short _0226509A - _0226508A - 2 ; case 2
	lsl r6, r1, #1  // .short _022650DA - _0226508A - 2 ; case 3
	lsl r6, r1, #0  // .short _0226509A - _0226508A - 2 ; case 4
	lsl r6, r1, #1  // .short _022650DA - _0226508A - 2 ; case 5
	lsl r6, r1, #0  // .short _0226509A - _0226508A - 2 ; case 6
	lsl r6, r1, #0  // .short _0226509A - _0226508A - 2 ; case 7
_0226509A:
	add r0, r5, #0
	add r0, #0x4f
	ldrb r0, [r0, #0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	add r0, sp, #0
	bne _022650C0
	mov r1, #2
	ldrsh r2, [r0, r1]
	sub r2, #0x18
	strh r2, [r0, #2]
	add r2, r4, #0
	ldrsh r1, [r0, r1]
	ldrsh r2, [r6, r2]
	cmp r1, r2
	bge _02265118
	strh r2, [r0, #2]
	add r4, r4, #1
	b _02265118
_022650C0:
	mov r1, #2
	ldrsh r2, [r0, r1]
	add r2, #0x18
	strh r2, [r0, #2]
	add r2, r4, #0
	ldrsh r2, [r6, r2]
	ldrsh r1, [r0, r1]
	add r2, #0xa0
	cmp r1, r2
	ble _02265118
	strh r2, [r0, #2]
	add r4, r4, #1
	b _02265118
_022650DA:
	add r0, r5, #0
	add r0, #0x4f
	ldrb r0, [r0, #0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	add r0, sp, #0
	bne _02265100
	mov r1, #2
	ldrsh r2, [r0, r1]
	add r2, #0x18
	strh r2, [r0, #2]
	mov r2, #0
	ldrsh r1, [r0, r1]
	ldrsh r2, [r6, r2]
	cmp r1, r2
	ble _02265118
	strh r2, [r0, #2]
	add r4, r4, #1
	b _02265118
_02265100:
	mov r1, #2
	ldrsh r2, [r0, r1]
	sub r2, #0x18
	strh r2, [r0, #2]
	mov r2, #0
	ldrsh r2, [r6, r2]
	ldrsh r1, [r0, r1]
	sub r2, #0x18
	cmp r1, r2
	bge _02265118
	strh r2, [r0, #2]
	add r4, r4, #1
_02265118:
	add r2, sp, #0
	mov r1, #2
	mov r3, #0
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	ldr r0, [r5, #4]
	bl ManagedSprite_SetPositionXY
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0226514C
	add r6, sp, #0
	mov r1, #2
	ldrsh r3, [r6, r1]
	add r1, r5, #0
	add r1, #0x25
	ldrb r2, [r1, #0]
	ldr r1, =sHpBarArrowXOffsets
	ldrsb r1, [r1, r2]
	mov r2, #0
	ldrsh r2, [r6, r2]
	sub r1, r3, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl ManagedSprite_SetPositionXY
_0226514C:
	cmp r4, #0
	ble _02265164
	add r0, r5, #0
	add r0, #0x4f
	ldrb r1, [r0, #0]
	mov r0, #2
	add r5, #0x4f
	orr r0, r1
	strb r0, [r5, #0]
	add r0, r7, #0
	bl SysTask_Destroy
_02265164:
	pop {r3, r4, r5, r6, r7, pc}
}
// clang-format on
#endif // NONMATCHING

static void ov12_0226516C(BattleHpBar *hpBar) {
    BgConfig *bgConfig;
    u8 *srcBuf;
    NNSG2dImageProxy *imgProxy;
    Window window;
    MsgData *msgData;
    String *string;
    String *string2;
    Pokemon *mon;
    BoxPokemon *boxMon;
    MessageFormat *msgFormat;

    bgConfig = BattleSystem_GetBgConfig(hpBar->bsys);
    msgData = BattleSystem_GetMessageData(hpBar->bsys);
    msgFormat = BattleSystem_GetMessageFormat(hpBar->bsys);
    string = String_New(22, HEAP_ID_BATTLE);
    string2 = NewString_ReadMsgData(msgData, msg_0197_00964);

    mon = BattleSystem_GetPartyMon(hpBar->bsys, hpBar->battlerId, hpBar->monId);
    boxMon = Mon_GetBoxMon(mon);
    BufferBoxMonNickname(msgFormat, 0, boxMon);
    StringExpandPlaceholders(msgFormat, string, string2);

    AddTextWindowTopLeftCorner(bgConfig, &window, 8, 2, 0, 15);
    AddTextPrinterParameterizedWithColorAndSpacing(&window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(14, 2, 15), 0, 0, NULL);
    srcBuf = window.pixelBuffer;

    {
        void *vramAddr;
        u8 *pixelBuffer;
        u8 *pixelBuffer2;

        vramAddr = G2_GetOBJCharPtr();
        imgProxy = Sprite_GetImageProxy(hpBar->boxObj->sprite);
        pixelBuffer = srcBuf;
        pixelBuffer2 = srcBuf + 0x100;

        MI_CpuCopy16(pixelBuffer, (void *)((u32)vramAddr + ov12_0226D680[hpBar->type][0].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D680[hpBar->type][0].size);
        MI_CpuCopy16(pixelBuffer2, (void *)((u32)vramAddr + ov12_0226D680[hpBar->type][1].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D680[hpBar->type][1].size);
        MI_CpuCopy16(pixelBuffer + ov12_0226D680[hpBar->type][0].size, (void *)((u32)vramAddr + ov12_0226D680[hpBar->type][2].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D680[hpBar->type][2].size);
        MI_CpuCopy16(pixelBuffer2 + ov12_0226D680[hpBar->type][1].size, (void *)((u32)vramAddr + ov12_0226D680[hpBar->type][3].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D680[hpBar->type][3].size);
    }
    RemoveWindow(&window);
    String_Delete(string);
    String_Delete(string2);
}

static void ov12_022652D0(BattleHpBar *hpBar) {
    int r0, r4;

    if (hpBar->unk49 == 0) {
        r0 = 74;
        r4 = 62;
    } else if (hpBar->unk49 == 1) {
        r0 = 72;
        r4 = 60;
    } else {
        r0 = 76;
        r4 = 64;
    }
    const u8 *sp0 = BattleHpBar_Util_GetComponentRawGraphic(r0);
    const u8 *r7 = BattleHpBar_Util_GetComponentRawGraphic(r4);
    NNSG2dImageProxy *imgProxy = Sprite_GetImageProxy(hpBar->boxObj->sprite);
    void *vramAddr = G2_GetOBJCharPtr();
    MI_CpuCopy16(r7, (void *)((u32)vramAddr + ov12_0226D4B0[hpBar->type][0].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D4B0[hpBar->type][0].size);
    MI_CpuCopy16(sp0, (void *)((u32)vramAddr + ov12_0226D4B0[hpBar->type][1].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D4B0[hpBar->type][1].size);
}

static void ov12_02265354(BattleHpBar *hpBar) {
    int j, i, k;
    u8 *r4 = AllocFromHeap(HEAP_ID_BATTLE, 0x60);
    u8 *r7 = AllocFromHeap(HEAP_ID_BATTLE, 0xC0);
    MI_CpuFill8(r4, 0xFF, 0x60);
    sub_0200CEB0(BattleSystem_GetLevelNumPrinter(hpBar->bsys), hpBar->level, 3, PRINTING_MODE_LEFT_ALIGN, (void *)r4);
    NNSG2dImageProxy *imgProxy = Sprite_GetImageProxy(hpBar->boxObj->sprite);
    void *vramAddr = G2_GetOBJCharPtr();
    MI_CpuCopy16((void *)((u32)vramAddr + ov12_0226D420[hpBar->type][0].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), r7, ov12_0226D420[hpBar->type][0].size);
    MI_CpuCopy16((void *)((u32)vramAddr + ov12_0226D420[hpBar->type][1].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), r7 + 0x60, ov12_0226D420[hpBar->type][1].size);
    k = 0;
    for (i = 0; i < 0x60; i += 0x20) {
        for (j = 0; j < 0x10; ++j) {
            r7[i + 0x10 + j] = r4[k];
            r7[i + j + 0x60] = r4[k + 0x10];
            ++k;
        }
        k += 0x10;
    }
    u8 *buf1 = r7;
    u8 *buf2 = r7 + 0x60;
    MI_CpuCopy16(buf1, (void *)((u32)vramAddr + ov12_0226D420[hpBar->type][0].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D420[hpBar->type][0].size);
    MI_CpuCopy16(buf2, (void *)((u32)vramAddr + ov12_0226D420[hpBar->type][1].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D420[hpBar->type][1].size);
    FreeToHeap(r4);
    FreeToHeap(r7);
}

static void ov12_02265474(BattleHpBar *hpBar, u32 num) {
    u8 *r4 = AllocFromHeap(HEAP_ID_BATTLE, 0x60);
    MI_CpuFill8(r4, 0xFF, 0x60);
    sub_0200CEB0(BattleSystem_GetHpNumPrinter(hpBar->bsys), num, 3, PRINTING_MODE_RIGHT_ALIGN, (void *)r4);
    NNSG2dImageProxy *imgProxy = Sprite_GetImageProxy(hpBar->boxObj->sprite);
    void *vramAddr = G2_GetOBJCharPtr();

    MI_CpuCopy16(r4, (void *)((u32)vramAddr + ov12_0226D450[hpBar->type][0].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D450[hpBar->type][0].size);
    MI_CpuCopy16(r4 + ov12_0226D450[hpBar->type][0].size, (void *)((u32)vramAddr + ov12_0226D450[hpBar->type][1].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D450[hpBar->type][1].size);
    FreeToHeap(r4);
}

static void ov12_02265500(BattleHpBar *hpBar) {
    u8 *r4 = AllocFromHeap(HEAP_ID_BATTLE, 0x60);
    MI_CpuFill8(r4, 0xFF, 0x60);
    sub_0200CEB0(BattleSystem_GetHpNumPrinter(hpBar->bsys), hpBar->maxHp, 3, PRINTING_MODE_LEFT_ALIGN, (void *)r4);
    NNSG2dImageProxy *imgProxy = Sprite_GetImageProxy(hpBar->boxObj->sprite);
    void *vramAddr = G2_GetOBJCharPtr();

    MI_CpuCopy16(r4, (void *)((u32)vramAddr + ov12_0226D3F0[hpBar->type].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D3F0[hpBar->type].size);
    FreeToHeap(r4);
}

static void ov12_02265560(BattleHpBar *hpBar) {
    const u8 *r4;
    if (hpBar->unk4B == 1) {
        r4 = BattleHpBar_Util_GetComponentRawGraphic(59);
    } else {
        r4 = BattleHpBar_Util_GetComponentRawGraphic(38);
    }
    NNSG2dImageProxy *imgProxy = Sprite_GetImageProxy(hpBar->boxObj->sprite);
    void *vramAddr = G2_GetOBJCharPtr();

    MI_CpuCopy16(r4, (void *)((u32)vramAddr + ov12_0226D3C0[hpBar->type].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D3C0[hpBar->type].size);
}

static void ov12_022655B0(BattleHpBar *hpBar, int a1) {
    const u8 *r4 = BattleHpBar_Util_GetComponentRawGraphic(a1);
    NNSG2dImageProxy *imgProxy = Sprite_GetImageProxy(hpBar->boxObj->sprite);
    void *vramAddr = G2_GetOBJCharPtr();

    MI_CpuCopy16(r4, (void *)((u32)vramAddr + ov12_0226D390[hpBar->type].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D390[hpBar->type].size);
}

static void BattleHpBar_PrintSafariOrParkBallsString(BattleHpBar *hpBar, u32 flag) {
    BgConfig *bgConfig;
    u8 *windowBuf;
    NNSG2dImageProxy *imgProxy;
    Window window;
    MsgData *msgData;
    String *string;

    bgConfig = BattleSystem_GetBgConfig(hpBar->bsys);
    msgData = BattleSystem_GetMessageData(hpBar->bsys);

    if (flag & 0x400) {
        string = NewString_ReadMsgData(msgData, msg_0197_00950); // SAFARI BALLS
    } else {
        string = NewString_ReadMsgData(msgData, msg_0197_01220); // PARK BALLS
    }
    AddTextWindowTopLeftCorner(bgConfig, &window, 13, 2, 0, 15);
    AddTextPrinterParameterizedWithColorAndSpacing(&window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(14, 2, 15), 0, 0, NULL);
    windowBuf = window.pixelBuffer;

    {
        void *vramAddr;
        u8 *ptr1;
        u8 *ptr2;

        vramAddr = G2_GetOBJCharPtr();
        imgProxy = Sprite_GetImageProxy(hpBar->boxObj->sprite);
        ptr1 = windowBuf;
        ptr2 = windowBuf + 0x1A0;
        MI_CpuCopy16(ptr1, (void *)((u32)vramAddr + ov12_0226D370[0].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D370[0].size);
        MI_CpuCopy16(ptr2, (void *)((u32)vramAddr + ov12_0226D370[1].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D370[1].size);
        MI_CpuCopy16(ptr1 + ov12_0226D370[0].size, (void *)((u32)vramAddr + ov12_0226D370[2].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D370[2].size);
        MI_CpuCopy16(ptr2 + ov12_0226D370[1].size, (void *)((u32)vramAddr + ov12_0226D370[3].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D370[3].size);
    }

    RemoveWindow(&window);
    String_Delete(string);
}

static void BattleHpBar_PrintNumRemainingSafariOrParkBalls(BattleHpBar *hpBar, u32 flag) {
    BgConfig *bgConfig;
    u8 *windowBuf;
    NNSG2dImageProxy *imgProxy;
    Window window;
    MsgData *msgData;
    MessageFormat *msgFormat;
    String *string;
    String *string2;

    bgConfig = BattleSystem_GetBgConfig(hpBar->bsys);
    msgData = BattleSystem_GetMessageData(hpBar->bsys);
    msgFormat = BattleSystem_GetMessageFormat(hpBar->bsys);

    string = String_New(30, HEAP_ID_BATTLE);
    if (flag & 0x400) {
        string2 = NewString_ReadMsgData(msgData, msg_0197_00951); // Left: $1
    } else {
        string2 = NewString_ReadMsgData(msgData, msg_0197_01221); // Left: $1
    }
    BufferIntegerAsString(msgFormat, 0, hpBar->unk27, 2, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    StringExpandPlaceholders(msgFormat, string, string2);
    AddTextWindowTopLeftCorner(bgConfig, &window, 13, 2, 0, 15);
    AddTextPrinterParameterizedWithColorAndSpacing(&window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(14, 2, 15), 0, 0, NULL);
    windowBuf = window.pixelBuffer;

    {
        void *vramAddr;
        u8 *ptr1;
        u8 *ptr2;

        vramAddr = G2_GetOBJCharPtr();
        imgProxy = Sprite_GetImageProxy(hpBar->boxObj->sprite);
        ptr1 = windowBuf;
        ptr2 = windowBuf + 0x1A0;
        MI_CpuCopy16(ptr1, (void *)((u32)vramAddr + ov12_0226D380[0].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D380[0].size);
        MI_CpuCopy16(ptr2, (void *)((u32)vramAddr + ov12_0226D380[1].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D380[1].size);
        MI_CpuCopy16(ptr1 + ov12_0226D380[0].size, (void *)((u32)vramAddr + ov12_0226D380[2].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D380[2].size);
        MI_CpuCopy16(ptr2 + ov12_0226D380[1].size, (void *)((u32)vramAddr + ov12_0226D380[3].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D380[3].size);
    }

    RemoveWindow(&window);
    String_Delete(string);
    String_Delete(string2);
}

static int ov12_022657E4(BattleHpBar *hpBar, BOOL isExp) {
    int ret;
    if (isExp == FALSE) {
        ret = BattleHpBar_CalculatePixelsChangeFrame(hpBar->maxHp, hpBar->hp, hpBar->gainedHp, &hpBar->hpCalc, 6, 1);
    } else {
        // Supposedly this will make the exp bar move at a consistent speed regardless of the gauge size.
        int denom = BattleHpBar_Util_GetPixelsToGain(hpBar->exp, hpBar->gainedExp, hpBar->maxExp, 12);
        if (denom == 0) {
            denom = 1;
        }
        ret = BattleHpBar_CalculatePixelsChangeFrame(hpBar->maxExp, hpBar->exp, hpBar->gainedExp, &hpBar->expCalc, 12, abs(hpBar->gainedExp / denom));
    }
    if (isExp != FALSE || hpBar->unk_4F_3 != TRUE) {
        ov12_02265878(hpBar, isExp);
    }
    if (ret == -1) {
        // we done
        if (isExp == FALSE) {
            hpBar->hpCalc = 0;
        } else {
            hpBar->expCalc = 0;
        }
    }
    return ret;
}

static void ov12_02265878(BattleHpBar *hpBar, u8 isExp) {
    u8 i;
    u8 pixelBuffer[12];
    u8 tmp;
    const u8 *src;
    void *vramAddr;
    NNSG2dImageProxy *imgProxy;
    int sizeTop;

    vramAddr = G2_GetOBJCharPtr();
    imgProxy = Sprite_GetImageProxy(hpBar->boxObj->sprite);
    switch (isExp) {
    case FALSE:
        // hp
        switch (HpBar_GetColorIdx(BattleHpBar_Util_MakeHpBarPixelBuffer(hpBar->maxHp, hpBar->hp, hpBar->gainedHp, &hpBar->hpCalc, pixelBuffer, 6), 0x30)) {
        case 3: // Green
            tmp = 2;
            break;
        case 2: // Yellow
            tmp = 11;
            break;
        case 1: // Red
        default:
            tmp = 20;
            break;
        }
        src = BattleHpBar_Util_GetComponentRawGraphic(tmp);
        sizeTop = ov12_0226D480[hpBar->type][0].size / 32;
        for (i = 0; i < 6; ++i) {
            if (i < sizeTop) {
                MI_CpuCopy16(src + pixelBuffer[i] * 32, (void *)((u32)vramAddr + ov12_0226D480[hpBar->type][0].offset + i * 32 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            } else {
                MI_CpuCopy16(src + pixelBuffer[i] * 32, (void *)((u32)vramAddr + ov12_0226D480[hpBar->type][1].offset + (i - sizeTop) * 32 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            }
        }
        break;
    case TRUE:
        // exp
        BattleHpBar_Util_MakeHpBarPixelBuffer(hpBar->maxExp, hpBar->exp, hpBar->gainedExp, &hpBar->expCalc, pixelBuffer, 12);
        if (hpBar->level == 100) {
            // Don't fill an exp bar for a level 100 mon
            for (i = 0; i < 12; ++i) {
                pixelBuffer[i] = 0;
            }
        }
        src = BattleHpBar_Util_GetComponentRawGraphic(29);
        for (i = 0; i < 12; ++i) {
            if (i < 5) {
                MI_CpuCopy16(src + pixelBuffer[i] * 32, (void *)((u32)vramAddr + 0x660 + i * 32 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            } else {
                MI_CpuCopy16(src + pixelBuffer[i] * 32, (void *)((u32)vramAddr + 0xE00 + (i - 5) * 32 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            }
        }
        break;
    }
}

static int BattleHpBar_CalculatePixelsChangeFrame(s32 maxHp, s32 curHp, s32 deltaHp, s32 *pHpCalc, u8 tilesWide, u16 hpChange) {
    s32 nowHp;
    s32 ret;
    u8 pixelsWide;
    s32 hpPerPixel;

    pixelsWide = tilesWide * 8;
    if (*pHpCalc == 0x80000000) {
        // Initialize
        if (USE_SUBPIXELS_TEST) {
            *pHpCalc = curHp << 8;
        } else {
            *pHpCalc = curHp;
        }
    }
    nowHp = curHp - deltaHp;
    if (nowHp < 0) {
        nowHp = 0;
    } else if (nowHp > maxHp) {
        nowHp = maxHp;
    }
    if (USE_SUBPIXELS_TEST) {
        // Use subpixel mode
        if (nowHp == (*pHpCalc >> 8) && (*pHpCalc & 0xFF) == 0) {
            return -1;
        }
    } else {
        // Use integer pixel mode
        if (nowHp == *pHpCalc) {
            return -1;
        }
    }
    if (USE_SUBPIXELS_TEST) {
        hpPerPixel = (maxHp << 8) / pixelsWide;
        if (deltaHp < 0) {
            *pHpCalc += hpPerPixel;
            ret = *pHpCalc >> 8;
            if (ret >= nowHp) {
                *pHpCalc = nowHp << 8;
                ret = nowHp;
            }
        } else {
            *pHpCalc -= hpPerPixel;
            ret = *pHpCalc >> 8;
            if ((*pHpCalc & 0xFF) > 0) {
                ++ret;
            }
            if (ret <= nowHp) {
                *pHpCalc = nowHp << 8;
                ret = nowHp;
            }
        }
    } else {
        if (deltaHp < 0) {
            *pHpCalc += hpChange;
            if (*pHpCalc > nowHp) {
                *pHpCalc = nowHp;
            }
        } else {
            *pHpCalc -= hpChange;
            if (*pHpCalc < nowHp) {
                *pHpCalc = nowHp;
            }
        }
        ret = *pHpCalc;
    }
    return ret;
}

static u8 BattleHpBar_Util_MakeHpBarPixelBuffer(s32 maxHp, s32 hp, s32 deltaHp, s32 *pHpCalc, u8 *pixelBuf, u8 tilesWide) {
    int i;
    int targetHp;
    u32 pixelsWide;
    u32 curPixels;
    u32 ret;

    targetHp = hp - deltaHp;
    if (targetHp < 0) {
        targetHp = 0;
    } else if (targetHp > maxHp) {
        targetHp = maxHp;
    }
    pixelsWide = tilesWide * 8;
    for (i = 0; i < tilesWide; ++i) {
        pixelBuf[i] = 0;
    }
    if (USE_SUBPIXELS_TEST) {
        curPixels = (*pHpCalc * pixelsWide / maxHp) >> 8;
    } else {
        curPixels = *pHpCalc * pixelsWide / maxHp;
    }
    ret = curPixels;
    if (curPixels == 0 && targetHp > 0) {
        pixelBuf[0] = 1;
        ret = 1;
    } else {
        for (i = 0; i < tilesWide; ++i) {
            if (curPixels >= 8) {
                pixelBuf[i] = 8;
                curPixels -= 8;
            } else {
                pixelBuf[i] = curPixels;
                break;
            }
        }
    }
    return ret;
}

static u32 BattleHpBar_Util_GetPixelsToGain(s32 exp, s32 gainedExp, s32 maxExp, u8 tilesWide) {
    s8 curPixels, targetPixels;
    u8 pixelsWide;
    s32 targetExp;

    pixelsWide = tilesWide * 8;

    targetExp = exp - gainedExp;
    if (targetExp < 0) {
        targetExp = 0;
    } else if (targetExp > maxExp) {
        targetExp = maxExp;
    }
    curPixels = exp * pixelsWide / maxExp;
    targetPixels = targetExp * pixelsWide / maxExp;
    return abs(curPixels - targetPixels);
}

static const u8 *BattleHpBar_Util_GetComponentRawGraphic(int componentId) {
    return gBattleHpBar_RawGraphicComponents + componentId * 32;
}

u8 BattleHpBar_Util_GetBarTypeFromBattlerSide(u8 bside, u32 battleType) {
    switch (bside) {
    case 0:
        if (battleType & BATTLE_TYPE_PAL_PARK) {
            return HP_BAR_TYPE_PALPARK;
        }
        if (battleType & BATTLE_TYPE_SAFARI) {
            return HP_BAR_TYPE_SAFARI;
        }
        return HP_BAR_TYPE_SINGLE_PLAYER;
    case 1:
        return HP_BAR_TYPE_SINGLE_ENEMY;
    case 2:
        return HP_BAR_TYPE_DOUBLE_PLAYER_LHS;
    case 3:
        return HP_BAR_TYPE_DOUBLE_ENEMY_LHS;
    case 4:
        return HP_BAR_TYPE_DOUBLE_PLAYER_RHS;
    case 5:
        return HP_BAR_TYPE_DOUBLE_ENEMY_RHS;
    default:
        GF_ASSERT(FALSE);
        return HP_BAR_TYPE_SINGLE_PLAYER;
    }
}

static const ManagedSpriteTemplate *BattleHpBar_Util_GetHpBoxSpriteTemplate(u8 barType) {
    const ManagedSpriteTemplate *ret;
    switch (barType) {
    case HP_BAR_TYPE_SINGLE_PLAYER:
        ret = &sSpriteTemplate_HpBarSinglePlayer;
        break;
    case HP_BAR_TYPE_SINGLE_ENEMY:
        ret = &sSpriteTemplate_HpBarSingleEnemy;
        break;
    case HP_BAR_TYPE_DOUBLE_PLAYER_LHS:
        ret = &sSpriteTemplate_HpBarDoublePlayerLHS;
        break;
    case HP_BAR_TYPE_DOUBLE_ENEMY_LHS:
        ret = &sSpriteTemplate_HpBarDoubleEnemyLHS;
        break;
    case HP_BAR_TYPE_DOUBLE_PLAYER_RHS:
        ret = &sSpriteTemplate_HpBarDoublePlayerRHS;
        break;
    case HP_BAR_TYPE_DOUBLE_ENEMY_RHS:
        ret = &sSpriteTemplate_HpBarDoubleEnemyRHS;
        break;
    case HP_BAR_TYPE_SAFARI:
    case HP_BAR_TYPE_PALPARK:
        ret = &sSpriteTemplate_HpBarSafariOrPark;
        break;
    default:
        GF_ASSERT(FALSE);
        return NULL;
    }
    return ret;
}

static const ManagedSpriteTemplate *BattleHpBar_Util_GetArrowSpriteTemplate(u8 barType) {
    switch (barType) {
    case HP_BAR_TYPE_SINGLE_PLAYER:
    case HP_BAR_TYPE_DOUBLE_PLAYER_LHS:
    case HP_BAR_TYPE_DOUBLE_PLAYER_RHS:
    case HP_BAR_TYPE_SAFARI:
    case HP_BAR_TYPE_PALPARK:
        return &sSpriteTemplate_Arrow;
    case HP_BAR_TYPE_SINGLE_ENEMY:
    case HP_BAR_TYPE_DOUBLE_ENEMY_LHS:
    case HP_BAR_TYPE_DOUBLE_ENEMY_RHS:
        return NULL;
    default:
        GF_ASSERT(FALSE);
        return NULL;
    }
}

typedef struct BattleHpBarExpBarFullFlashEffectTaskData {
    BattleHpBar *hpBar;
    u8 *pDoneFlag;
    u8 state;
    u8 plttNum;
    s8 ev;
} BattleHpBarExpBarFullFlashEffectTaskData;

SysTask *BattleHpBar_BeginExpBarFullFlashEffect(BattleHpBar *hpBar, u8 *a1) {
    *a1 = 0;
    BattleHpBarExpBarFullFlashEffectTaskData *taskData = AllocFromHeap(HEAP_ID_BATTLE, sizeof(BattleHpBarExpBarFullFlashEffectTaskData));
    MI_CpuFill8(taskData, 0, sizeof(BattleHpBarExpBarFullFlashEffectTaskData));
    taskData->hpBar = hpBar;
    taskData->pDoneFlag = a1;
    return SysTask_CreateOnMainQueue(Task_ExpBarFullFlash, taskData, 1000);
}

static void Task_ExpBarFullFlash(SysTask *task, void *data) {
    BattleHpBarExpBarFullFlashEffectTaskData *taskData = data;
    SpriteManager *gfxHandler = BattleSystem_GetGfxHandler(taskData->hpBar->bsys);
    int plttNum;
    PaletteData *plttData = BattleSystem_GetPaletteData(taskData->hpBar->bsys);

    switch (taskData->state) {
    case 0:
        plttNum = SpriteManager_FindPlttResourceOffset(gfxHandler, 20007, NNS_G2D_VRAM_TYPE_2DMAIN);
        ManagedSprite_SetPaletteOverride(taskData->hpBar->boxObj, plttNum);
        taskData->plttNum = plttNum;
        ++taskData->state;
        // break;
    case 1:
        taskData->ev += 2;
        if (taskData->ev >= 10) {
            taskData->ev = 10;
            ++taskData->state;
        }
        PaletteData_BlendPalette(plttData, PLTTBUF_MAIN_OBJ, 16 * taskData->plttNum, 0x10, taskData->ev, RGB(5, 29, 28));
        break;
    case 2:
        taskData->ev -= 2;
        if (taskData->ev <= 0) {
            taskData->ev = 0;
            ++taskData->state;
        }
        PaletteData_BlendPalette(plttData, PLTTBUF_MAIN_OBJ, 16 * taskData->plttNum, 0x10, taskData->ev, RGB(5, 29, 28));
        break;
    default:
        plttNum = SpriteManager_FindPlttResourceOffset(gfxHandler, 20006, NNS_G2D_VRAM_TYPE_2DMAIN);
        ManagedSprite_SetPaletteOverride(taskData->hpBar->boxObj, plttNum);
        *taskData->pDoneFlag = 1;
        FreeToHeap(taskData);
        SysTask_Destroy(task);
        break;
    }
}

void ov12_02265D70(BattleHpBar *hpBar) {
}

void ov12_02265D74(BattleHpBar *hpBar) {
}

static void ov12_02265D78(BattleHpBar *hpBar) {
    if (hpBar->sysTask == NULL) {
        hpBar->unk54 = 0;
        hpBar->sysTask = SysTask_CreateOnMainQueue(ov12_02265DC4, hpBar, 1010);
    }
}

static void ov12_02265DA0(BattleHpBar *hpBar) {
    if (hpBar->sysTask != NULL) {
        SysTask_Destroy(hpBar->sysTask);
        hpBar->sysTask = NULL;
    }
    hpBar->unk54 = 0;
    ov12_02264F44(hpBar, 0, 0);
}

static void ov12_02265DC4(SysTask *task, void *data) {
    BattleHpBar *hpBar = data;
    hpBar->unk54 += 20;
    if (hpBar->unk54 >= 360) {
        hpBar->unk54 -= 360;
    }
    ov12_02264F44(hpBar, 0, FX_Mul(GF_SinDegNoWrap(hpBar->unk54), FX32_CONST(1.5)) / FX32_ONE);
}
