#include "battle/battle_hp_bar.h"

#include "battle/battle_system.h"
#include "msgdata/msg/msg_0197.h"

#include "math_util.h"
#include "unk_0208805C.h"

typedef struct UnkStruct_ov12_0226D408 {
    u16 offset;
    u16 size;
} UnkStruct_ov12_0226D408;

typedef struct UnkStruct_ov12_02265C54 {
    BattleHpBar *hpBar;
    u8 *unk_4;
    u8 unk_8;
    u8 unk_9;
    s8 unk_A;
} UnkStruct_ov12_02265C54;

static void ov12_02264824(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType);
static void ov12_022648EC(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType);
static UnkImageStruct *ov12_02264968(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, int barType);
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
static void ov12_022655F0(BattleHpBar *hpBar, u32 flag);
static void ov12_022656CC(BattleHpBar *hpBar, u32 flag);
static int ov12_022657E4(BattleHpBar *hpBar, BOOL a1);
static void ov12_02265878(BattleHpBar *hpBar, u8 a1);
static int ov12_022659E0(s32 maxHp, s32 hp, s32 deltaHP, s32 *pHpCalc, u8 a4, u16 a5);
static u8 ov12_02265A9C(s32 maxHp, s32 hp, s32 deltaHp, s32 *pHpCalc, u8 *a4, u8 a5);
static u32 ov12_02265B18(s32 exp, s32 gainedExp, s32 maxExp, u8 a3);
static const u8 *ov12_02265B58(int a0);
static const UnkTemplate_0200D748 *ov12_02265BB8(u8 barType);
static const UnkTemplate_0200D748 *ov12_02265C1C(u8 barType);
static void ov12_02265C88(SysTask *task, void *data);
static void ov12_02265D78(BattleHpBar *hpBar);
static void ov12_02265DA0(BattleHpBar *hpBar);
static void ov12_02265DC4(SysTask *task, void *data);

ALIGN(4)
static const s8 ov12_0226D368[] = {
    72,
    0,
    72,
    0,
    72,
    0,
};

static const UnkStruct_ov12_0226D408 ov12_0226D680[][4] = {
    {
     { 0x0260, 0x00A0 },
     { 0x0360, 0x00A0 },
     { 0x0A00, 0x0060 },
     { 0x0B00, 0x0060 },
     },
    {
     { 0x0220, 0x00E0 },
     { 0x0320, 0x00E0 },
     { 0x0A00, 0x0020 },
     { 0x0B00, 0x0020 },
     },
    {
     { 0x0240, 0x00C0 },
     { 0x0340, 0x00C0 },
     { 0x0A00, 0x0040 },
     { 0x0B00, 0x0040 },
     },
    {
     { 0x0220, 0x00E0 },
     { 0x0320, 0x00E0 },
     { 0x0A00, 0x0020 },
     { 0x0B00, 0x0020 },
     },
    {
     { 0x0240, 0x00C0 },
     { 0x0340, 0x00C0 },
     { 0x0A00, 0x0040 },
     { 0x0B00, 0x0040 },
     },
    {
     { 0x0220, 0x00E0 },
     { 0x0320, 0x00E0 },
     { 0x0A00, 0x0020 },
     { 0x0B00, 0x0020 },
     },
};

static const UnkStruct_ov12_0226D408 ov12_0226D4B0[][2] = {
    {
     { 0x0A60, 0x0040 },
     { 0x0B60, 0x0040 },
     },
    {
     { 0x0A20, 0x0040 },
     { 0x0B20, 0x0040 },
     },
    {
     { 0x0A40, 0x0040 },
     { 0x0B40, 0x0040 },
     },
    {
     { 0x0A20, 0x0040 },
     { 0x0B20, 0x0040 },
     },
    {
     { 0x0A40, 0x0040 },
     { 0x0B40, 0x0040 },
     },
    {
     { 0x0A20, 0x0040 },
     { 0x0B20, 0x0040 },
     },
};

static const UnkStruct_ov12_0226D408 ov12_0226D420[][2] = {
    {
     { 0x0AA0, 0x0060 },
     { 0x0BA0, 0x0060 },
     },
    {
     { 0x0A60, 0x0060 },
     { 0x0B60, 0x0060 },
     },
    {
     { 0x0A80, 0x0060 },
     { 0x0B80, 0x0060 },
     },
    {
     { 0x0A60, 0x0060 },
     { 0x0B60, 0x0060 },
     },
    {
     { 0x0A80, 0x0060 },
     { 0x0B80, 0x0060 },
     },
    {
     { 0x0A60, 0x0060 },
     { 0x0B60, 0x0060 },
     },
};

static const UnkStruct_ov12_0226D408 ov12_0226D450[][2] = {
    {
     { 0x0000, 0x0000 },
     { 0x0D00, 0x0060 },
     },
    {
     { 0x0620, 0x0060 },
     { 0x0000, 0x0000 },
     },
    {
     { 0x0000, 0x0000 },
     { 0x0C00, 0x0060 },
     },
    {
     { 0x0620, 0x0060 },
     { 0x0000, 0x0000 },
     },
    {
     { 0x0000, 0x0000 },
     { 0x0C00, 0x0060 },
     },
    {
     { 0x0620, 0x0060 },
     { 0x0000, 0x0000 },
     },
};

static const UnkStruct_ov12_0226D408 ov12_0226D3F0[] = {
    { 0x0D80, 0x0060 },
    { 0x06A0, 0x0060 },
    { 0x0C80, 0x0060 },
    { 0x06A0, 0x0060 },
    { 0x0C80, 0x0060 },
    { 0x06A0, 0x0060 },
};

static const UnkStruct_ov12_0226D408 ov12_0226D480[][2] = {
    {
     { 0x04E0, 0x0000 },
     { 0x0C20, 0x00C0 },
     },
    {
     { 0x04E0, 0x0020 },
     { 0x0C00, 0x00A0 },
     },
    {
     { 0x04E0, 0x0000 },
     { 0x0C00, 0x00C0 },
     },
    {
     { 0x04E0, 0x0020 },
     { 0x0C00, 0x00A0 },
     },
    {
     { 0x04E0, 0x0000 },
     { 0x0C00, 0x00C0 },
     },
    {
     { 0x04E0, 0x0020 },
     { 0x0C00, 0x00A0 },
     },
};

static const UnkStruct_ov12_0226D408 ov12_0226D3C0[] = {
    { 0x0460, 0x0020 },
    { 0x0420, 0x0020 },
    { 0x0440, 0x0020 },
    { 0x0420, 0x0020 },
    { 0x0440, 0x0020 },
    { 0x0420, 0x0020 },
};

static const UnkStruct_ov12_0226D408 ov12_0226D390[] = {
    { 0x0480, 0x0060 },
    { 0x0440, 0x0060 },
    { 0x0460, 0x0060 },
    { 0x0440, 0x0060 },
    { 0x0460, 0x0060 },
    { 0x0440, 0x0060 },
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
    { 0x0000, 0x0000 },
    { 0x0000, 0x0000 },
    { 0x04C0, 0x0040 },
    { 0x0000, 0x0000 },
    { 0x04C0, 0x0040 },
    { 0x0000, 0x0000 },
};

static const UnkStruct_ov12_0226D408 ov12_0226D3D8[] = {
    { 0x0000, 0x0000 },
    { 0x0000, 0x0000 },
    { 0x0CC0, 0x0020 },
    { 0x0000, 0x0000 },
    { 0x0CC0, 0x0020 },
    { 0x0000, 0x0000 },
};

static const UnkStruct_ov12_0226D408 ov12_0226D408[] = {
    { 0x0000, 0x0000 },
    { 0x0000, 0x0000 },
    { 0x0C60, 0x0020 },
    { 0x0000, 0x0000 },
    { 0x0C60, 0x0020 },
    { 0x0000, 0x0000 },
};

static const UnkTemplate_0200D748 ov12_0226D5E4 = {
    .x              = 0x00C0,
    .y              = 0x0074,
    .z              = 0x0000,
    .animation      = 0x0000,
    .spritePriority = 0x00000017,
    .pal            = 0x00000000,
    .vram           = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList      = {
                       0x000000BF,
                       0x00004E26,
                       0x000000BE,
                       0x000000BD,
                       0xFFFFFFFF,
                       0xFFFFFFFF,
                       },
    .bgPriority   = 0x00000000,
    .vramTransfer = 0x00000000
};

static const UnkTemplate_0200D748 ov12_0226D618 = {
    .x              = 0x003A,
    .y              = 0x0024,
    .z              = 0x0000,
    .animation      = 0x0000,
    .spritePriority = 0x00000018,
    .pal            = 0x00000000,
    .vram           = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList      = {
                       0x000000BC,
                       0x00004E26,
                       0x000000BB,
                       0x000000BA,
                       0xFFFFFFFF,
                       0xFFFFFFFF,
                       },
    .bgPriority   = 0x00000000,
    .vramTransfer = 0x00000000
};

static const UnkTemplate_0200D748 ov12_0226D4E0 = {
    .x              = 0x00C0,
    .y              = 0x0067,
    .z              = 0x0000,
    .animation      = 0x0000,
    .spritePriority = 0x0000001C,
    .pal            = 0x00000000,
    .vram           = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList      = {
                       0x000000C8,
                       0x00004E26,
                       0x000000C7,
                       0x000000C6,
                       0xFFFFFFFF,
                       0xFFFFFFFF,
                       },
    .bgPriority   = 0x00000000,
    .vramTransfer = 0x00000000
};

static const UnkTemplate_0200D748 ov12_0226D514 = {
    .x              = 0x0040,
    .y              = 0x0010,
    .z              = 0x0000,
    .animation      = 0x0000,
    .spritePriority = 0x00000019,
    .pal            = 0x00000000,
    .vram           = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList      = {
                       0x000000C2,
                       0x00004E26,
                       0x000000C1,
                       0x000000C0,
                       0xFFFFFFFF,
                       0xFFFFFFFF,
                       },
    .bgPriority   = 0x00000000,
    .vramTransfer = 0x00000000
};

static const UnkTemplate_0200D748 ov12_0226D57C = {
    .x              = 0x00C6,
    .y              = 0x0084,
    .z              = 0x0000,
    .animation      = 0x0000,
    .spritePriority = 0x0000001A,
    .pal            = 0x00000000,
    .vram           = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList      = {
                       0x000000CB,
                       0x00004E26,
                       0x000000CA,
                       0x000000C9,
                       0xFFFFFFFF,
                       0xFFFFFFFF,
                       },
    .bgPriority   = 0x00000000,
    .vramTransfer = 0x00000000
};

static const UnkTemplate_0200D748 ov12_0226D64C = {
    .x              = 0x003A,
    .y              = 0x002D,
    .z              = 0x0000,
    .animation      = 0x0000,
    .spritePriority = 0x0000001B,
    .pal            = 0x00000000,
    .vram           = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList      = {
                       0x000000C5,
                       0x00004E26,
                       0x000000C4,
                       0x000000C3,
                       0xFFFFFFFF,
                       0xFFFFFFFF,
                       },
    .bgPriority   = 0x00000000,
    .vramTransfer = 0x00000000
};

static const UnkTemplate_0200D748 ov12_0226D548 = {
    .x              = 0x0000,
    .y              = 0x0000,
    .z              = 0x0000,
    .animation      = 0x0000,
    .spritePriority = 0x00000011,
    .pal            = 0x00000000,
    .vram           = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList      = {
                       0x000000B9,
                       0x00004E26,
                       0x000000B8,
                       0x000000B7,
                       0xFFFFFFFF,
                       0xFFFFFFFF,
                       },
    .bgPriority   = 0x00000000,
    .vramTransfer = 0x00000000
};

static const UnkTemplate_0200D748 ov12_0226D5B0 = {
    .x              = 0x00C0,
    .y              = 0x0074,
    .z              = 0x0000,
    .animation      = 0x0000,
    .spritePriority = 0x00000017,
    .pal            = 0x00000000,
    .vram           = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList      = {
                       0x000000FD,
                       0x00004E28,
                       0x000000FE,
                       0x000000FF,
                       0xFFFFFFFF,
                       0xFFFFFFFF,
                       },
    .bgPriority   = 0x00000000,
    .vramTransfer = 0x00000000
};

#include "battle/battle_hp_bar_data.h"

static void ov12_02264824(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType) {
    const UnkTemplate_0200D748 *pRes = ov12_02265BB8(barType);

    SpriteRenderer_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CHAR], TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, pRes->resIdList[GF_GFX_RES_TYPE_CHAR]);
    sub_0200D68C(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 71, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20006);
    SpriteRenderer_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CELL], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_CELL]);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_ANIM], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_ANIM]);
    sub_0200D68C(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 71, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20007);
    if (barType == 6 || barType == 7) {
        sub_0200D68C(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 81, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20008);
    }
}

static void ov12_022648EC(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType) {
    const UnkTemplate_0200D748 *pRes = ov12_02265C1C(barType);

    if (pRes != NULL) {
        SpriteRenderer_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CHAR], TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, pRes->resIdList[GF_GFX_RES_TYPE_CHAR]);
        sub_0200D68C(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 71, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20006);
        SpriteRenderer_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CELL], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_CELL]);
        SpriteRenderer_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_ANIM], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_ANIM]);
    }
}

static UnkImageStruct *ov12_02264968(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, int barType) {
    const UnkTemplate_0200D748 *pRes = ov12_02265BB8(barType);

    UnkImageStruct *ret = SpriteRenderer_LoadResourcesAndCreateSprite(renderer, gfxHandler, pRes);
    TickSpriteAnimation1Frame(ret->sprite);
    return ret;
}

void ov12_0226498C(BattleHpBar *hpBar, u32 num, u32 flag) {
    GF_ASSERT(hpBar->unk4 != NULL);
    if (hpBar->type == 6) {
        flag &= 0xC00;
    } else if (hpBar->type == 7) {
        flag &= 0x3000;
    } else {
        flag &= ~0x3C00;
    }
    switch (hpBar->type) {
    case 1:
    case 3:
    case 5:
        flag &= ~0x26;
        break;
    case 2:
    case 4:
        flag &= ~0x220;
        if (hpBar->unk_4F_3 == 0) {
            flag &= ~6;
        } else {
            flag &= ~1;
        }
        break;
    case 0:
        flag &= ~0x200;
        break;
    case 6:
    case 7:
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
        ov12_022655F0(hpBar, flag);
    }

    if (flag & 0x2800) {
        ov12_022656CC(hpBar, flag);
    }
}

static void ov12_02264B28(BattleHpBar *hpBar) {
    if (hpBar->sysTask != NULL) {
        SysTask_Destroy(hpBar->sysTask);
        hpBar->sysTask = NULL;
    }
    if (hpBar->unk4 != NULL) {
        UnkImageStruct_Delete(hpBar->unk4);
        hpBar->unk4 = NULL;
    }
}

static void ov12_02264B4C(BattleHpBar *hpBar) {
    if (hpBar->unk8 != NULL) {
        UnkImageStruct_Delete(hpBar->unk8);
        hpBar->unk8 = NULL;
    }
}

static void ov12_02264B60(BattleHpBar *hpBar) {
    const UnkTemplate_0200D748 *tmplate = ov12_02265BB8(hpBar->type);
    SpriteRenderer *renderer            = ov12_0223A8E4(hpBar->bsys);
    SpriteGfxHandler *gfxHandler        = ov12_0223A8EC(hpBar->bsys);
    SpriteGfxHandler_UnloadCharObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_CHAR]);
    SpriteGfxHandler_UnloadCellObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_CELL]);
    SpriteGfxHandler_UnloadAnimObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_ANIM]);
}

static void ov12_02264B94(BattleHpBar *hpBar) {
    const UnkTemplate_0200D748 *tmplate = ov12_02265C1C(hpBar->type);
    if (tmplate != NULL) {
        SpriteRenderer *renderer     = ov12_0223A8E4(hpBar->bsys);
        SpriteGfxHandler *gfxHandler = ov12_0223A8EC(hpBar->bsys);
        SpriteGfxHandler_UnloadCharObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_CHAR]);
        SpriteGfxHandler_UnloadCellObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_CELL]);
        SpriteGfxHandler_UnloadAnimObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_ANIM]);
    }
}

void BattleHpBar_LoadResources(BattleHpBar *hpBar) {
    const UnkTemplate_0200D748 *tmplate;
    SpriteRenderer *renderer;
    SpriteGfxHandler *gfxHandler;
    PaletteData *plttData;
    NARC *narc;

    narc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

    renderer   = ov12_0223A8E4(hpBar->bsys);
    gfxHandler = ov12_0223A8EC(hpBar->bsys);
    plttData   = BattleSystem_GetPaletteData(hpBar->bsys);

    tmplate = ov12_02265BB8(hpBar->type);

    ov12_02264824(renderer, gfxHandler, narc, plttData, hpBar->type);
    hpBar->unk4 = ov12_02264968(renderer, gfxHandler, hpBar->type);

    ov12_022648EC(renderer, gfxHandler, narc, plttData, hpBar->type);
    if (hpBar->unk8 != NULL) {
        Sprite_SetPositionXY(hpBar->unk8->sprite, tmplate->x - ov12_0226D368[hpBar->type], tmplate->y + 0);
    }
    NARC_Delete(narc);
}

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
    case 2:
    case 4:
        hpBar->unk_4F_3 ^= 1;
        vramBaseAddr = G2_GetOBJCharPtr();
        imgProxy     = Sprite_GetImageProxy(hpBar->unk4->sprite);
        if (hpBar->unk_4F_3 == 1) {
            src = ov12_02265B58(70);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3A8[hpBar->type].offset + 0x20 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            src = ov12_02265B58(71);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3D8[hpBar->type].offset + 0x20 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            src = ov12_02265B58(69);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D408[hpBar->type].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D408[hpBar->type].size);
            ov12_0226498C(hpBar, hpBar->hp, 6);
        } else {
            src = ov12_02265B58(66);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3A8[hpBar->type].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D3A8[hpBar->type].size);
            src = ov12_02265B58(68);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3D8[hpBar->type].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D3D8[hpBar->type].size);
            src = ov12_02265B58(38);
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
    if (hpBar->unk8 != NULL) {
        Sprite_SetAnimActiveFlag(hpBar->unk8->sprite, TRUE);
        ov12_02264F00(hpBar, 1);
    }
    if (!(BattleSystem_GetBattleType(hpBar->bsys) & (BATTLE_TYPE_PAL_PARK | BATTLE_TYPE_SAFARI))) {
        ov12_02265D78(hpBar);
    }
}

void ov12_02264EB4(BattleHpBar *hpBar) {
    if (hpBar->unk8 != NULL) {
        Sprite_SetAnimActiveFlag(hpBar->unk8->sprite, FALSE);
        Sprite_SetAnimCtrlCurrentFrame(hpBar->unk8->sprite, 0);
        ov12_02264F00(hpBar, 0);
    }
    ov12_02265DA0(hpBar);
}

void ov12_02264EE0(BattleHpBar *hpBar, int prio) {
    if (hpBar->unk4 != NULL) {
        UnkImageStruct_SetSpritePriority(hpBar->unk4, prio);
        if (hpBar->unk8 != NULL) {
            UnkImageStruct_SetSpritePriority(hpBar->unk8, prio);
        }
    }
}

static void ov12_02264F00(BattleHpBar *hpBar, int a1) {
    if (hpBar->unk8 != NULL) {
        if (!(BattleSystem_GetBattleType(hpBar->bsys) & (BATTLE_TYPE_PAL_PARK | BATTLE_TYPE_SAFARI)) || a1 != TRUE) {
            UnkImageStruct_SetSpriteVisibleFlag(hpBar->unk8, a1);
        }
    }
}

void BattleHpBar_SetEnabled(BattleHpBar *hpBar, BOOL a1) {
    if (hpBar->unk4 != NULL) {
        UnkImageStruct_SetSpriteVisibleFlag(hpBar->unk4, a1);
        ov12_02264F00(hpBar, a1);
    }
}

static void ov12_02264F44(BattleHpBar *hpBar, int x, int y) {
    const UnkTemplate_0200D748 *r4;

    GF_ASSERT(hpBar->unk4 != NULL);

    r4 = ov12_02265BB8(hpBar->type);

    Sprite_SetPositionXY(hpBar->unk4->sprite, r4->x + x, r4->y + y);
    if (hpBar->unk8 != NULL) {
        Sprite_SetPositionXY(hpBar->unk8->sprite,
            r4->x + x - ov12_0226D368[hpBar->type],
            r4->y + y + 0);
    }
}

SysTask *ov12_02264FB0(BattleHpBar *hpBar, BOOL a1) {
    GF_ASSERT(hpBar != NULL);
    GF_ASSERT(hpBar->unk4 != NULL);
    hpBar->unk_4F_1 = FALSE;
    hpBar->unk_4F_0 = a1;
    if (!a1) {
        switch (hpBar->type) {
        case 0:
        case 2:
        case 4:
        case 6:
        case 7:
            ov12_02264F44(hpBar, 160, 0);
            break;
        default:
            ov12_02264F44(hpBar, -160, 0);
            break;
        }
    } else {
        ov12_02264F44(hpBar, 0, 0);
    }
    return SysTask_CreateOnMainQueue(ov12_02265054, hpBar, 990);
}

static void ov12_02265054(SysTask *task, void *data) {
    BattleHpBar *hpBar = data;
    s16 x, y;
    const UnkTemplate_0200D748 *r6;
    int r4;

    r4 = 0;
    r6 = ov12_02265BB8(hpBar->type);
    UnkImageStruct_GetSpritePositionXY(hpBar->unk4, &x, &y);

    switch (hpBar->type) {
    case 0:
    case 2:
    case 4:
    case 6:
    case 7:
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
    UnkImageStruct_SetSpritePositionXY(hpBar->unk4, x, y);
    if (hpBar->unk8 != NULL) {
        UnkImageStruct_SetSpritePositionXY(hpBar->unk8, x - ov12_0226D368[hpBar->type], y + 0);
    }

    if (r4 > 0) {
        hpBar->unk_4F_1 = TRUE;
        SysTask_Destroy(task);
        return;
    }
}

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

    bgConfig  = BattleSystem_GetBgConfig(hpBar->bsys);
    msgData   = BattleSystem_GetMessageData(hpBar->bsys);
    msgFormat = BattleSystem_GetMessageFormat(hpBar->bsys);
    string    = String_New(22, HEAP_ID_BATTLE);
    string2   = NewString_ReadMsgData(msgData, msg_0197_00964);

    mon    = BattleSystem_GetPartyMon(hpBar->bsys, hpBar->battlerId, hpBar->monId);
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

        vramAddr     = G2_GetOBJCharPtr();
        imgProxy     = Sprite_GetImageProxy(hpBar->unk4->sprite);
        pixelBuffer  = srcBuf;
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
    const u8 *sp0              = ov12_02265B58(r0);
    const u8 *r7               = ov12_02265B58(r4);
    NNSG2dImageProxy *imgProxy = Sprite_GetImageProxy(hpBar->unk4->sprite);
    void *vramAddr             = G2_GetOBJCharPtr();
    MI_CpuCopy16(r7, (void *)((u32)vramAddr + ov12_0226D4B0[hpBar->type][0].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D4B0[hpBar->type][0].size);
    MI_CpuCopy16(sp0, (void *)((u32)vramAddr + ov12_0226D4B0[hpBar->type][1].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D4B0[hpBar->type][1].size);
}

static void ov12_02265354(BattleHpBar *hpBar) {
    int j, i, k;
    u8 *r4 = AllocFromHeap(HEAP_ID_BATTLE, 0x60);
    u8 *r7 = AllocFromHeap(HEAP_ID_BATTLE, 0xC0);
    MI_CpuFill8(r4, 0xFF, 0x60);
    sub_0200CEB0(BattleSystem_GetLevelNumPrinter(hpBar->bsys), hpBar->unk48, 3, PRINTING_MODE_LEFT_ALIGN, (void *)r4);
    NNSG2dImageProxy *imgProxy = Sprite_GetImageProxy(hpBar->unk4->sprite);
    void *vramAddr             = G2_GetOBJCharPtr();
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
    NNSG2dImageProxy *imgProxy = Sprite_GetImageProxy(hpBar->unk4->sprite);
    void *vramAddr             = G2_GetOBJCharPtr();

    MI_CpuCopy16(r4, (void *)((u32)vramAddr + ov12_0226D450[hpBar->type][0].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D450[hpBar->type][0].size);
    MI_CpuCopy16(r4 + ov12_0226D450[hpBar->type][0].size, (void *)((u32)vramAddr + ov12_0226D450[hpBar->type][1].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D450[hpBar->type][1].size);
    FreeToHeap(r4);
}

static void ov12_02265500(BattleHpBar *hpBar) {
    u8 *r4 = AllocFromHeap(HEAP_ID_BATTLE, 0x60);
    MI_CpuFill8(r4, 0xFF, 0x60);
    sub_0200CEB0(BattleSystem_GetHpNumPrinter(hpBar->bsys), hpBar->maxHp, 3, PRINTING_MODE_LEFT_ALIGN, (void *)r4);
    NNSG2dImageProxy *imgProxy = Sprite_GetImageProxy(hpBar->unk4->sprite);
    void *vramAddr             = G2_GetOBJCharPtr();

    MI_CpuCopy16(r4, (void *)((u32)vramAddr + ov12_0226D3F0[hpBar->type].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D3F0[hpBar->type].size);
    FreeToHeap(r4);
}

static void ov12_02265560(BattleHpBar *hpBar) {
    const u8 *r4;
    if (hpBar->unk4B == 1) {
        r4 = ov12_02265B58(59);
    } else {
        r4 = ov12_02265B58(38);
    }
    NNSG2dImageProxy *imgProxy = Sprite_GetImageProxy(hpBar->unk4->sprite);
    void *vramAddr             = G2_GetOBJCharPtr();

    MI_CpuCopy16(r4, (void *)((u32)vramAddr + ov12_0226D3C0[hpBar->type].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D3C0[hpBar->type].size);
}

static void ov12_022655B0(BattleHpBar *hpBar, int a1) {
    const u8 *r4               = ov12_02265B58(a1);
    NNSG2dImageProxy *imgProxy = Sprite_GetImageProxy(hpBar->unk4->sprite);
    void *vramAddr             = G2_GetOBJCharPtr();

    MI_CpuCopy16(r4, (void *)((u32)vramAddr + ov12_0226D390[hpBar->type].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D390[hpBar->type].size);
}

static void ov12_022655F0(BattleHpBar *hpBar, u32 flag) {
    BgConfig *bgConfig;
    u8 *windowBuf;
    NNSG2dImageProxy *imgProxy;
    Window window;
    MsgData *msgData;
    String *string;

    bgConfig = BattleSystem_GetBgConfig(hpBar->bsys);
    msgData  = BattleSystem_GetMessageData(hpBar->bsys);

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
        imgProxy = Sprite_GetImageProxy(hpBar->unk4->sprite);
        ptr1     = windowBuf;
        ptr2     = windowBuf + 0x1A0;
        MI_CpuCopy16(ptr1, (void *)((u32)vramAddr + ov12_0226D370[0].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D370[0].size);
        MI_CpuCopy16(ptr2, (void *)((u32)vramAddr + ov12_0226D370[1].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D370[1].size);
        MI_CpuCopy16(ptr1 + ov12_0226D370[0].size, (void *)((u32)vramAddr + ov12_0226D370[2].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D370[2].size);
        MI_CpuCopy16(ptr2 + ov12_0226D370[1].size, (void *)((u32)vramAddr + ov12_0226D370[3].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D370[3].size);
    }

    RemoveWindow(&window);
    String_Delete(string);
}

static void ov12_022656CC(BattleHpBar *hpBar, u32 flag) {
    BgConfig *bgConfig;
    u8 *windowBuf;
    NNSG2dImageProxy *imgProxy;
    Window window;
    MsgData *msgData;
    MessageFormat *msgFormat;
    String *string;
    String *string2;

    bgConfig  = BattleSystem_GetBgConfig(hpBar->bsys);
    msgData   = BattleSystem_GetMessageData(hpBar->bsys);
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
        imgProxy = Sprite_GetImageProxy(hpBar->unk4->sprite);
        ptr1     = windowBuf;
        ptr2     = windowBuf + 0x1A0;
        MI_CpuCopy16(ptr1, (void *)((u32)vramAddr + ov12_0226D380[0].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D380[0].size);
        MI_CpuCopy16(ptr2, (void *)((u32)vramAddr + ov12_0226D380[1].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D380[1].size);
        MI_CpuCopy16(ptr1 + ov12_0226D380[0].size, (void *)((u32)vramAddr + ov12_0226D380[2].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D380[2].size);
        MI_CpuCopy16(ptr2 + ov12_0226D380[1].size, (void *)((u32)vramAddr + ov12_0226D380[3].offset + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D380[3].size);
    }

    RemoveWindow(&window);
    String_Delete(string);
    String_Delete(string2);
}

static int ov12_022657E4(BattleHpBar *hpBar, BOOL a1) {
    int ret;
    if (!a1) {
        ret = ov12_022659E0(hpBar->maxHp, hpBar->hp, hpBar->gainedHp, &hpBar->hpCalc, 6, 1);
    } else {
        int denom = ov12_02265B18(hpBar->exp, hpBar->gainedExp, hpBar->maxExp, 12);
        if (denom == 0) {
            denom = 1;
        }
        ret = ov12_022659E0(hpBar->maxExp, hpBar->exp, hpBar->gainedExp, &hpBar->expCalc, 12, abs(hpBar->gainedExp / denom));
    }
    if (a1 || hpBar->unk_4F_3 != TRUE) {
        ov12_02265878(hpBar, a1);
    }
    if (ret == -1) {
        if (!a1) {
            hpBar->hpCalc = 0;
        } else {
            hpBar->expCalc = 0;
        }
    }
    return ret;
}

static void ov12_02265878(BattleHpBar *hpBar, u8 a1) {
    u8 i;
    u8 sp10[12];
    u8 tmp;
    const u8 *spC;
    void *vramAddr;
    NNSG2dImageProxy *imgProxy;
    int r7;

    vramAddr = G2_GetOBJCharPtr();
    imgProxy = Sprite_GetImageProxy(hpBar->unk4->sprite);
    switch (a1) {
    case 0:
        switch (sub_02088080(ov12_02265A9C(hpBar->maxHp, hpBar->hp, hpBar->gainedHp, &hpBar->hpCalc, sp10, 6), 0x30)) {
        case 3:
            tmp = 2;
            break;
        case 2:
            tmp = 11;
            break;
        case 1:
        default:
            tmp = 20;
            break;
        }
        spC = ov12_02265B58(tmp);
        r7  = ov12_0226D480[hpBar->type][0].size / 32;
        for (i = 0; i < 6; ++i) {
            if (i < r7) {
                MI_CpuCopy16(spC + sp10[i] * 32, (void *)((u32)vramAddr + ov12_0226D480[hpBar->type][0].offset + i * 32 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            } else {
                MI_CpuCopy16(spC + sp10[i] * 32, (void *)((u32)vramAddr + ov12_0226D480[hpBar->type][1].offset + (i - r7) * 32 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            }
        }
        break;
    case 1:
        ov12_02265A9C(hpBar->maxExp, hpBar->exp, hpBar->gainedExp, &hpBar->expCalc, sp10, 12);
        if (hpBar->unk48 == 100) {
            for (i = 0; i < 12; ++i) {
                sp10[i] = 0;
            }
        }
        spC = ov12_02265B58(29);
        for (i = 0; i < 12; ++i) {
            if (i < 5) {
                MI_CpuCopy16(spC + sp10[i] * 32, (void *)((u32)vramAddr + 0x660 + i * 32 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            } else {
                MI_CpuCopy16(spC + sp10[i] * 32, (void *)((u32)vramAddr + 0xE00 + (i - 5) * 32 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            }
        }
        break;
    }
}

static int ov12_022659E0(s32 maxHp, s32 curHp, s32 deltaHp, s32 *pHpCalc, u8 a4, u16 a5) {
    s32 r4;
    s32 ret;
    u8 r2;
    s32 r0;

    r2 = a4 * 8;
    if (*pHpCalc == 0x80000000) {
        if (maxHp < r2) {
            *pHpCalc = curHp << 8;
        } else {
            *pHpCalc = curHp;
        }
    }
    r4 = curHp - deltaHp;
    if (r4 < 0) {
        r4 = 0;
    } else if (r4 > maxHp) {
        r4 = maxHp;
    }
    if (maxHp < r2) {
        if (r4 == (*pHpCalc >> 8) && (*pHpCalc & 0xFF) == 0) {
            return -1;
        }
    } else {
        if (r4 == *pHpCalc) {
            return -1;
        }
    }
    if (maxHp < r2) {
        r0 = (maxHp << 8) / r2;
        if (deltaHp < 0) {
            *pHpCalc += r0;
            ret = *pHpCalc >> 8;
            if (ret >= r4) {
                *pHpCalc = r4 << 8;
                ret      = r4;
            }
        } else {
            *pHpCalc -= r0;
            ret = *pHpCalc >> 8;
            if ((*pHpCalc & 0xFF) > 0) {
                ++ret;
            }
            if (ret <= r4) {
                *pHpCalc = r4 << 8;
                ret      = r4;
            }
        }
    } else {
        if (deltaHp < 0) {
            *pHpCalc += a5;
            if (*pHpCalc > r4) {
                *pHpCalc = r4;
            }
        } else {
            *pHpCalc -= a5;
            if (*pHpCalc < r4) {
                *pHpCalc = r4;
            }
        }
        ret = *pHpCalc;
    }
    return ret;
}

static u8 ov12_02265A9C(s32 maxHp, s32 hp, s32 deltaHp, s32 *pHpCalc, u8 *a4, u8 a5) {
    int i;
    int r7;
    u32 r2;
    u32 r0;
    u32 ret;

    r7 = hp - deltaHp;
    if (r7 < 0) {
        r7 = 0;
    } else if (r7 > maxHp) {
        r7 = maxHp;
    }
    r2 = a5 * 8;
    for (i = 0; i < a5; ++i) {
        a4[i] = 0;
    }
    if (maxHp < r2) {
        r0 = (*pHpCalc * r2 / maxHp) >> 8;
    } else {
        r0 = *pHpCalc * r2 / maxHp;
    }
    ret = r0;
    if (r0 == 0 && r7 > 0) {
        a4[0] = 1;
        ret   = 1;
    } else {
        for (i = 0; i < a5; ++i) {
            if (r0 >= 8) {
                a4[i] = 8;
                r0 -= 8;
            } else {
                a4[i] = r0;
                break;
            }
        }
    }
    return ret;
}

static u32 ov12_02265B18(s32 exp, s32 gainedExp, s32 maxExp, u8 a3) {
    s8 r7, r0;
    u8 r6;
    s32 r4;

    r6 = a3 * 8;

    r4 = exp - gainedExp;
    if (r4 < 0) {
        r4 = 0;
    } else if (r4 > maxExp) {
        r4 = maxExp;
    }
    r7 = exp * r6 / maxExp;
    r0 = r4 * r6 / maxExp;
    return abs(r7 - r0);
}

static const u8 *ov12_02265B58(int a0) {
    return ov12_0226D6E0 + a0 * 32;
}

u8 ov12_02265B64(u8 a0, u32 battleType) {
    switch (a0) {
    case 0:
        if (battleType & BATTLE_TYPE_PAL_PARK) {
            return 7;
        }
        if (battleType & BATTLE_TYPE_SAFARI) {
            return 6;
        }
        return 0;
    case 1:
        return 1;
    case 2:
        return 2;
    case 3:
        return 3;
    case 4:
        return 4;
    case 5:
        return 5;
    default:
        GF_ASSERT(FALSE);
        return 0;
    }
}

static const UnkTemplate_0200D748 *ov12_02265BB8(u8 barType) {
    switch (barType) {
    case 0:
        return &ov12_0226D5E4;
    case 1:
        return &ov12_0226D618;
    case 2:
        return &ov12_0226D4E0;
    case 3:
        return &ov12_0226D514;
    case 4:
        return &ov12_0226D57C;
    case 5:
        return &ov12_0226D64C;
    case 6:
    case 7:
        return &ov12_0226D5B0;
    default:
        GF_ASSERT(FALSE);
        return NULL;
    }
}

static const UnkTemplate_0200D748 *ov12_02265C1C(u8 barType) {
    switch (barType) {
    case 0:
    case 2:
    case 4:
    case 6:
    case 7:
        return &ov12_0226D548;
    case 1:
    case 3:
    case 5:
        return NULL;
    default:
        GF_ASSERT(FALSE);
        return NULL;
    }
}

SysTask *ov12_02265C54(BattleHpBar *hpBar, u8 *a1) {
    *a1                               = 0;
    UnkStruct_ov12_02265C54 *taskData = AllocFromHeap(HEAP_ID_BATTLE, sizeof(UnkStruct_ov12_02265C54));
    MI_CpuFill8(taskData, 0, sizeof(UnkStruct_ov12_02265C54));
    taskData->hpBar = hpBar;
    taskData->unk_4 = a1;
    return SysTask_CreateOnMainQueue(ov12_02265C88, taskData, 1000);
}

static void ov12_02265C88(SysTask *task, void *data) {
    UnkStruct_ov12_02265C54 *taskData = data;
    SpriteGfxHandler *gfxHandler      = ov12_0223A8EC(taskData->hpBar->bsys);
    int plttNum;
    PaletteData *plttData = BattleSystem_GetPaletteData(taskData->hpBar->bsys);

    switch (taskData->unk_8) {
    case 0:
        plttNum = sub_0200D944(gfxHandler, 20007, NNS_G2D_VRAM_TYPE_2DMAIN);
        UnkImageStruct_SetSpritePalIndex(taskData->hpBar->unk4, plttNum);
        taskData->unk_9 = plttNum;
        ++taskData->unk_8;
        // break;
    case 1:
        taskData->unk_A += 2;
        if (taskData->unk_A >= 10) {
            taskData->unk_A = 10;
            ++taskData->unk_8;
        }
        PaletteData_BlendPalette(plttData, PLTTBUF_MAIN_OBJ, 16 * taskData->unk_9, 0x10, taskData->unk_A, RGB(5, 29, 28));
        break;
    case 2:
        taskData->unk_A -= 2;
        if (taskData->unk_A <= 0) {
            taskData->unk_A = 0;
            ++taskData->unk_8;
        }
        PaletteData_BlendPalette(plttData, PLTTBUF_MAIN_OBJ, 16 * taskData->unk_9, 0x10, taskData->unk_A, RGB(5, 29, 28));
        break;
    default:
        plttNum = sub_0200D944(gfxHandler, 20006, NNS_G2D_VRAM_TYPE_2DMAIN);
        UnkImageStruct_SetSpritePalIndex(taskData->hpBar->unk4, plttNum);
        *taskData->unk_4 = 1;
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
        hpBar->unk54   = 0;
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
