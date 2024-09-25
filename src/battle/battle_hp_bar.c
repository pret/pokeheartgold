#include "battle/battle_hp_bar.h"

#include "battle/battle_system.h"

void ov12_02264824(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType);
void ov12_022648EC(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType);
UnkImageStruct *ov12_02264968(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, int barType);
void ov12_02264B28(BattleHpBar *hpBar);
void ov12_02264B4C(BattleHpBar *hpBar);
void ov12_02264B60(BattleHpBar *hpBar);
void ov12_02264B94(BattleHpBar *hpBar);
void ov12_02264DCC(BattleHpBar *hpBar, int a1);
void ov12_02264E34(BattleHpBar *hpBar, int a1);
void ov12_0226516C(BattleHpBar *hpBar);
void ov12_022652D0(BattleHpBar *hpBar);
void ov12_02265354(BattleHpBar *hpBar);
void ov12_02265474(BattleHpBar *hpBar, u32 num);
void ov12_02265500(BattleHpBar *hpBar);
void ov12_02265560(BattleHpBar *hpBar);
void ov12_022655B0(BattleHpBar *hpBar, int a1);
void ov12_022657E4(BattleHpBar *hpBar, int a1);
const UnkTemplate_0200D748 *ov12_02265BB8(u8 barType);
const UnkTemplate_0200D748 *ov12_02265C1C(u8 barType);
void ov12_022655F0(BattleHpBar *hpBar, u32 flag);
void ov12_022656CC(BattleHpBar *hpBar, u32 flag);

extern const s8 ov12_0226D368[];

void ov12_02264824(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType) {
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

void ov12_022648EC(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType) {
    const UnkTemplate_0200D748 *pRes = ov12_02265C1C(barType);

    if (pRes != NULL) {
        SpriteRenderer_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CHAR], TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, pRes->resIdList[GF_GFX_RES_TYPE_CHAR]);
        sub_0200D68C(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 71, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20006);
        SpriteRenderer_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CELL], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_CELL]);
        SpriteRenderer_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_ANIM], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_ANIM]);
    }
}

UnkImageStruct *ov12_02264968(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, int barType) {
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
        ov12_022657E4(hpBar, 0);
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
        ov12_022657E4(hpBar, 1);
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

void ov12_02264B28(BattleHpBar *hpBar) {
    if (hpBar->sysTask != NULL) {
        SysTask_Destroy(hpBar->sysTask);
        hpBar->sysTask = NULL;
    }
    if (hpBar->unk4 != NULL) {
        UnkImageStruct_Delete(hpBar->unk4);
        hpBar->unk4 = NULL;
    }
}

void ov12_02264B4C(BattleHpBar *hpBar) {
    if (hpBar->unk8 != NULL) {
        UnkImageStruct_Delete(hpBar->unk8);
        hpBar->unk8 = NULL;
    }
}

void ov12_02264B60(BattleHpBar *hpBar) {
    const UnkTemplate_0200D748 *tmplate = ov12_02265BB8(hpBar->type);
    SpriteRenderer *renderer            = ov12_0223A8E4(hpBar->bsys);
    SpriteGfxHandler *gfxHandler        = ov12_0223A8EC(hpBar->bsys);
    SpriteGfxHandler_UnloadCharObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_CHAR]);
    SpriteGfxHandler_UnloadCellObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_CELL]);
    SpriteGfxHandler_UnloadAnimObjById(gfxHandler, tmplate->resIdList[GF_GFX_RES_TYPE_ANIM]);
}

void ov12_02264B94(BattleHpBar *hpBar) {
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
    NARC *narc                          = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);
    SpriteRenderer *renderer            = ov12_0223A8E4(hpBar->bsys);
    SpriteGfxHandler *gfxHandler        = ov12_0223A8EC(hpBar->bsys);
    PaletteData *plttData               = BattleSystem_GetPaletteData(hpBar->bsys);
    const UnkTemplate_0200D748 *tmplate = ov12_02265BB8(hpBar->type);

    ov12_02264824(renderer, gfxHandler, narc, plttData, hpBar->type);
    hpBar->unk4 = ov12_02264968(renderer, gfxHandler, hpBar->type);
    ov12_022648EC(renderer, gfxHandler, narc, plttData, hpBar->type);
    if (hpBar->unk8 != NULL) {
        Sprite_SetPositionXY(hpBar->unk8->sprite, tmplate->x - ov12_0226D368[hpBar->type], tmplate->y);
    }
    NARC_Delete(narc);
}

void BattleHpBar_FreeResources(BattleHpBar *hpBar) {
    ov12_02264B28(hpBar);
    ov12_02264B60(hpBar);
    ov12_02264B4C(hpBar);
    ov12_02264B94(hpBar);
}
