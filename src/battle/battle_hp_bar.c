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
void ov12_02264F00(BattleHpBar *hpBar, int a1);
void ov12_02264F44(BattleHpBar *hpBar, int x, int y);
void ov12_02265054(SysTask *task, void *data);
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
void ov12_02265D78(BattleHpBar *hpBar);
void ov12_02265DA0(BattleHpBar *hpBar);
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

int ov12_02264E68(BattleHpBar *hpBar) {
    int ret = ov12_022657E4(hpBar, 1);
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

void ov12_02264F00(BattleHpBar *hpBar, int a1) {
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

void ov12_02264F44(BattleHpBar *hpBar, int x, int y) {
    GF_ASSERT(hpBar->unk4 != NULL);

    const UnkTemplate_0200D748 *r4 = ov12_02265BB8(hpBar->type);
    Sprite_SetPositionXY(hpBar->unk4->sprite, r4->x + x, r4->y + y);
    if (hpBar->unk8 != NULL) {
        Sprite_SetPositionXY(hpBar->unk8->sprite, r4->x + x - ov12_0226D368[hpBar->type], r4->y + y);
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

#ifdef NONMATCHING // https://decomp.me/scratch/Q0zRs
void ov12_02265054(SysTask *task, void *data) {
    BattleHpBar *hpBar             = data;
    int r4                         = 0;
    const UnkTemplate_0200D748 *r6 = ov12_02265BB8(hpBar->type);
    s16 x, y;

    UnkImageStruct_GetSpritePositionXY(hpBar->unk4, &x, &y);

    switch (hpBar->type) {
    case 0:
    case 2:
    case 4:
    case 6:
    case 7:
        if (!hpBar->unk_4F_0) {
            x -= 24;
            if (x < r6->x) {
                x = r6->x;
                ++r4;
            }
        } else {
            x += 24;
            if (x > r6->x + 160) {
                x = r6->x + 160;
                ++r4;
            }
        }
        break;
    default:
        if (!hpBar->unk_4F_0) {
            x += 24;
            if (x > r6->x) {
                x = r6->x;
                ++r4;
            }
        } else {
            x -= 24;
            if (x < r6->x - 24) {
                x = r6->x - 24;
                ++r4;
            }
        }
        break;
    }
    UnkImageStruct_SetSpritePositionXY(hpBar->unk4, x, y);
    if (hpBar->unk8 != NULL) {
        UnkImageStruct_SetSpritePositionXY(hpBar->unk8, x - ov12_0226D368[hpBar->type], y);
    }
    if (r4 > 0) {
        hpBar->unk_4F_1 = TRUE;
        SysTask_Destroy(task);
    }
}
#else
// clang-format off
asm void ov12_02265054(SysTask *task, void *data) {
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	mov r4, #0
	bl ov12_02265BB8
	add r6, r0, #0
	add r1, sp, #0
	ldr r0, [r5, #4]
	add r1, #2
	add r2, sp, #0
	bl UnkImageStruct_GetSpritePositionXY
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	cmp r0, #7
	bhi _022650DA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226508A: // jump table
    lsl r6, r1, #0
    DCD 0x000E004E
    DCD 0x000E004E
    DCD 0x000E004E
    lsl r6, r1, #0
_0226509A:
	add r0, r5, #0
	add r0, #0x4f
	ldrb r0, [r0]
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
	ldrb r0, [r0]
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
	bl UnkImageStruct_SetSpritePositionXY
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0226514C
	add r6, sp, #0
	mov r1, #2
	ldrsh r3, [r6, r1]
	add r1, r5, #0
	add r1, #0x25
	ldrb r2, [r1]
	ldr r1, =ov12_0226D368
	ldrsb r1, [r1, r2]
	mov r2, #0
	ldrsh r2, [r6, r2]
	sub r1, r3, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl UnkImageStruct_SetSpritePositionXY
_0226514C:
	cmp r4, #0
	ble _02265164
	add r0, r5, #0
	add r0, #0x4f
	ldrb r1, [r0]
	mov r0, #2
	add r5, #0x4f
	orr r0, r1
	strb r0, [r5]
	add r0, r7, #0
	bl SysTask_Destroy
_02265164:
	pop {r3, r4, r5, r6, r7, pc}
}
//clang-format on
#endif //NONMATCHING
