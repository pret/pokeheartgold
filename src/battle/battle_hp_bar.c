#include "battle/battle_hp_bar.h"

#include "battle/battle_system.h"

void ov12_02264824(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType);
void ov12_022648EC(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType);
UnkImageStruct *ov12_02264968(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, int barType);
void ov12_02264B28(BattleHpBar *hpBar);
void ov12_02264B4C(BattleHpBar *hpBar);
void ov12_02264B60(BattleHpBar *hpBar);
void ov12_02264B94(BattleHpBar *hpBar);
void ov12_02264DCC(BattleHpBar *hpBar, int hp);
void ov12_02264E34(BattleHpBar *hpBar, int a1);
void ov12_0226516C(BattleHpBar *hpBar);
void ov12_022652D0(BattleHpBar *hpBar);
void ov12_02265354(BattleHpBar *hpBar);
void ov12_02265474(BattleHpBar *hpBar, u32 num);
void ov12_02265500(BattleHpBar *hpBar);
void ov12_02265560(BattleHpBar *hpBar);
void ov12_022655B0(BattleHpBar *hpBar, int a1);
int ov12_022657E4(BattleHpBar *hpBar, int a1);
void *ov12_02265B58(int a0);
const UnkTemplate_0200D748 *ov12_02265BB8(u8 barType);
const UnkTemplate_0200D748 *ov12_02265C1C(u8 barType);
void ov12_022655F0(BattleHpBar *hpBar, u32 flag);
void ov12_022656CC(BattleHpBar *hpBar, u32 flag);

extern const s8 ov12_0226D368[];
extern const u16 ov12_0226D408[][2];
extern const u16 ov12_0226D3A8[][2];
extern const u16 ov12_0226D3D8[][2];
extern const u16 ov12_0226D6E0[][16];

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
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3A8[hpBar->type][0] + 0x20 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            src = ov12_02265B58(71);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3D8[hpBar->type][0] + 0x20 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
            src = ov12_02265B58(69);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D408[hpBar->type][0] + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D408[hpBar->type][1]);
            ov12_0226498C(hpBar, hpBar->hp, 6);
        } else {
            src = ov12_02265B58(66);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3A8[hpBar->type][0] + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D3A8[hpBar->type][1]);
            src = ov12_02265B58(68);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3D8[hpBar->type][0] + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), ov12_0226D3D8[hpBar->type][1]);
            src = ov12_02265B58(38);
            MI_CpuCopy16(src, (void *)((u32)vramBaseAddr + ov12_0226D3D8[hpBar->type][0] + 0x20 + imgProxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DMAIN]), 0x20);
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
    int r4 = ov12_022657E4(hpBar, 0);
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
