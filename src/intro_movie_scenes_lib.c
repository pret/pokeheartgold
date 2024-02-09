#include "global.h"
#include "intro_movie_internal.h"
#include "math_util.h"
#include "system.h"
#include "sys_task_api.h"
#include "unk_0200FA24.h"

void ov60_021E6FFC(SysTask *task, void *pVoid);
void ov60_021E71CC(SysTask *task, void *pVoid);
void ov60_021E7264(SysTask *task, void *pVoid);
void ov60_021E7454(SysTask *task, void *pVoid);
void ov60_021E77C0(SysTask *task, void *pVoid);
void ov60_021E7864(void *pVoid);

void ov60_021E6ED8(IntroMovieOvyData *data, const u8 *counts) {
    for (u8 i = 0; i < 4; ++i) {
        data->unk_13C[i] = Create2DGfxResObjMan(counts[i], (GfGfxResType)i, HEAP_ID_INTRO_MOVIE);
    }
}

void ov60_021E6F00(IntroMovieOvyData *data) {
    for (u8 i = 0; i < 4; ++i) {
        Destroy2DGfxResObjMan(data->unk_13C[i]);
    }
}

_2DGfxResMan **ov60_021E6F20(IntroMovieOvyData *data) {
    return data->unk_13C;
}

void ov60_021E6F28(Sprite *sprite, BOOL active) {
    Set2dSpriteAnimActiveFlag(sprite, active);
    Set2dSpriteVisibleFlag(sprite, active);
}

void ov60_021E6F3C(int resId, IntroMovieOvyData *data, int priority, NNS_G2D_VRAM_TYPE whichScreen, SpriteTemplate *template, SpriteResourcesHeader *header) {
    CreateSpriteResourcesHeader(
        header,
        resId,
        resId,
        resId,
        resId,
        -1,
        -1,
        0,
        priority,
        data->unk_13C[0],
        data->unk_13C[1],
        data->unk_13C[2],
        data->unk_13C[3],
        NULL,
        NULL
    );
    template->spriteList = data->unk_010;
    template->header = header;
    SetVec(template->position, 0, 0, 0);
    SetVec(template->scale, FX32_ONE, FX32_ONE, FX32_ONE);
    template->rotation = 0;
    template->priority = 0;
    template->whichScreen = whichScreen;
    template->heapId = HEAP_ID_INTRO_MOVIE;
}

void ov60_021E6FAC(IntroMovieOvyData *data, int mainx, int mainy, int subx, int suby) {
    G2dRenderer_SetSubSurfaceCoords(&data->unk_014, subx * FX32_ONE, suby * FX32_ONE);
    G2dRenderer_SetMainSurfaceCoords(&data->unk_014, mainx * FX32_ONE, mainy * FX32_ONE);
}

void ov60_021E6FD0(IntroMovieSub_46C_000 *data, int plane1, int plane2, u8 rate, int direction, int screen) {
    data->counter = 0;
    data->ev = 0;
    data->stopped = 0;
    data->topScreen = screen;
    data->plane1 = plane1;
    data->plane2 = plane2;
    data->rate = rate;
    data->direction = direction;
    data->task = SysTask_CreateOnMainQueue(ov60_021E6FFC, data, 0);
}

void ov60_021E6FFC(SysTask *task, void *pVoid) {
    IntroMovieSub_46C_000 *data = (IntroMovieSub_46C_000 *)pVoid;

    ++data->counter;
    data->ev = data->counter * 31 / data->rate;
    if (data->ev >= 31) {
        data->ev = 31;
        SysTask_Destroy(data->task);
        data->task = NULL;
        data->stopped = 1;
    }
    int ev;
    if (data->direction == 0) {
        ev = data->ev;
    } else {
        ev = 31 - data->ev;
    }
    if (data->topScreen) {
        G2_SetBlendAlpha(data->plane1, data->plane2, ev, 31 - ev);
    } else {
        G2S_SetBlendAlpha(data->plane1, data->plane2, ev, 31 - ev);
    }
}

void ov60_021E7074(BgConfig *bgConfig, IntroMovieSub_46C_030 *data, enum GFBgLayer bgId, fx16 xChange, fx16 yChange, fx32 rate) {
    IntroMovieSub_46C_030 *obj = &data[ov60_021E734C(bgId)];
    if (obj->running) {
        GF_ASSERT(FALSE);
        return;
    }

    if (rate == 0) {
        fx32 x = xChange + Bg_GetXpos(bgConfig, bgId);
        fx32 y = yChange + Bg_GetYpos(bgConfig, bgId);
        BgSetPosTextAndCommit(bgConfig, bgId, BG_POS_OP_SET_X, x);
        BgSetPosTextAndCommit(bgConfig, bgId, BG_POS_OP_SET_Y, y);
        return;
    }

    obj->bgConfig = bgConfig;
    obj->bgId = bgId;
    obj->counter = 0;
    obj->stopped = 0;
    obj->rate = rate;
    obj->xOrig = Bg_GetXpos(bgConfig, bgId);
    obj->yOrig = Bg_GetYpos(bgConfig, bgId);
    obj->xChange = xChange;
    obj->yChange = yChange;
    obj->running = TRUE;
    obj->task = SysTask_CreateOnVBlankQueue(ov60_021E71CC, obj, 0);
}

void ov60_021E7120(BgConfig *bgConfig, IntroMovieSub_46C_030 *data, enum GFBgLayer bgId, fx16 xChange, fx16 yChange, fx32 rate) {
    IntroMovieSub_46C_030 *obj = &data[ov60_021E734C(bgId)];
    if (obj->running) {
        GF_ASSERT(FALSE);
        return;
    }

    if (rate == 0) {
        fx32 x = xChange + Bg_GetXpos(bgConfig, bgId);
        fx32 y = yChange + Bg_GetYpos(bgConfig, bgId);
        BgSetPosTextAndCommit(bgConfig, bgId, BG_POS_OP_SET_X, x);
        BgSetPosTextAndCommit(bgConfig, bgId, BG_POS_OP_SET_Y, y);
        return;
    }

    obj->bgConfig = bgConfig;
    obj->bgId = bgId;
    obj->counter = 0;
    obj->stopped = 0;
    obj->rate = rate;
    obj->xOrig = Bg_GetXpos(bgConfig, bgId);
    obj->yOrig = Bg_GetYpos(bgConfig, bgId);
    obj->xChange = xChange;
    obj->yChange = yChange;
    obj->running = TRUE;
    obj->task = SysTask_CreateOnMainQueue(ov60_021E7264, obj, 0);
}

void ov60_021E71CC(SysTask *task, void *pVoid) {
    IntroMovieSub_46C_030 *data = (IntroMovieSub_46C_030 *)pVoid;
    fx32 x;
    fx32 y;

    if (data->rate < 0) {
        x = data->xChange + Bg_GetXpos(data->bgConfig, data->bgId);
        y = data->yChange + Bg_GetYpos(data->bgConfig, data->bgId);
    } else {
        ++data->counter;
        x = data->xChange * data->counter / data->rate;
        y = data->yChange * data->counter / data->rate;
        x += data->xOrig;
        y += data->yOrig;
        if (data->counter >= data->rate) {
            SysTask_Destroy(data->task);
            data->task = NULL;
            data->stopped = 1;
            data->running = FALSE;
        }
    }
    BgSetPosTextAndCommit(data->bgConfig, data->bgId, BG_POS_OP_SET_X, x);
    BgSetPosTextAndCommit(data->bgConfig, data->bgId, BG_POS_OP_SET_Y, y);
}

void ov60_021E7264(SysTask *task, void *pVoid) {
    IntroMovieSub_46C_030 *data = (IntroMovieSub_46C_030 *)pVoid;
    fx32 x;
    fx32 y;

    if (data->rate < 0) {
        x = data->xChange + Bg_GetXpos(data->bgConfig, data->bgId);
        y = data->yChange + Bg_GetYpos(data->bgConfig, data->bgId);
    } else {
        ++data->counter;
        x = data->xChange * data->counter / data->rate;
        y = data->yChange * data->counter / data->rate;
        x += data->xOrig;
        y += data->yOrig;
        if (data->counter >= data->rate) {
            SysTask_Destroy(data->task);
            data->task = NULL;
            data->stopped = 1;
            data->running = FALSE;
        }
    }
    ScheduleSetBgPosText(data->bgConfig, data->bgId, BG_POS_OP_SET_X, x);
    ScheduleSetBgPosText(data->bgConfig, data->bgId, BG_POS_OP_SET_Y, y);
}

BOOL ov60_021E72FC(IntroMovieSub_46C_030 *data, enum GFBgLayer bgId) {
    BOOL ret = FALSE;
    IntroMovieSub_46C_030 *obj = &data[ov60_021E734C(bgId)];
    if (!obj->running) {
        return TRUE;
    }
    if (obj->stopped) {
        ret = TRUE;
    }
    return ret;
}

void ov60_021E7324(IntroMovieSub_46C_030 *data, enum GFBgLayer bgId) {
    IntroMovieSub_46C_030 *obj = &data[ov60_021E734C(bgId)];
    if (obj->running) {
        SysTask_Destroy(obj->task);
        obj->task = NULL;
        obj->stopped = TRUE;
        obj->running = FALSE;
    }
}

int ov60_021E734C(enum GFBgLayer bgId) {
    int ret = 0;
    switch (bgId) {
    case GF_BG_LYR_MAIN_0:
        ret = 0;
        break;
    case GF_BG_LYR_MAIN_1:
        ret = 1;
        break;
    case GF_BG_LYR_MAIN_2:
        ret = 2;
        break;
    case GF_BG_LYR_MAIN_3:
        ret = 3;
        break;
    case GF_BG_LYR_SUB_0:
        ret = 4;
        break;
    case GF_BG_LYR_SUB_1:
        ret = 5;
        break;
    case GF_BG_LYR_SUB_2:
        ret = 6;
        break;
    case GF_BG_LYR_SUB_3:
        ret = 7;
        break;
    default:
        GF_ASSERT(FALSE);
    }

    return ret;
}

IntroMovieSub_46C_110 *ov60_021E7398(IntroMovieSub_46C_110 *data, int a1, int a2, const IntroMovieSub_46C_110_template *a3) {
    ov60_021E74F0(a3->unk_20, a3->unk_24, a3->unk_28, a3->unk_2A, a2);
    if (a1 <= 0) {
        ov60_021E75C4(a3->unk_10, a3->unk_14, a3->unk_18, a3->unk_1C, a2);
        return NULL;
    }
    IntroMovieSub_46C_110 *ret = a2 == 0 ? &data[1] : &data[0];
    ret->unk_10 = *a3;
    ret->unk_08 = a1;
    ret->unk_0A = 0;
    ret->unk_0B = TRUE;
    ret->unk_00 = TRUE;
    ret->unk_04 = a2;
    ret->unk_3C = a3->unk_00;
    ret->unk_40 = a3->unk_04;
    ret->unk_44 = a3->unk_08;
    ret->unk_48 = a3->unk_0C;
    ov60_021E75C4(a3->unk_00, a3->unk_04, a3->unk_08, a3->unk_0C, a2);
    ret->unk_0C = SysTask_CreateOnVBlankQueue(ov60_021E7454, ret, 0);
    return ret;
}

BOOL ov60_021E7434(IntroMovieSub_46C_110 *data, int a1) {
    IntroMovieSub_46C_110 *which = a1 == 0 ? &data[1] : &data[0];
    if (which->unk_00 == 0) {
        return TRUE;
    }
    return which->unk_0B != 0;
}

// https://decomp.me/scratch/b19bs
#ifdef NONMATCHING
void ov60_021E7454(SysTask *task, void *pVoid) {
    IntroMovieSub_46C_110 *data = (IntroMovieSub_46C_110 *)pVoid;
    ++data->unk_0A;
    int spC = data->unk_10.unk_00 + (data->unk_10.unk_10 - data->unk_10.unk_00) * data->unk_0A / data->unk_08;
    int sp8 = data->unk_10.unk_04 + (data->unk_10.unk_14 - data->unk_10.unk_04) * data->unk_0A / data->unk_08;
    int r7 = data->unk_10.unk_08 + (data->unk_10.unk_18 - data->unk_10.unk_08) * data->unk_0A / data->unk_08;
    int r4 = data->unk_10.unk_0C + (data->unk_10.unk_1C - data->unk_10.unk_0C) * data->unk_0A / data->unk_08;
    data->unk_3C = spC;
    data->unk_40 = sp8;
    data->unk_44 = r7;
    data->unk_48 = r4;
    if (data->unk_0A >= data->unk_08) {
        SysTask_Destroy(data->unk_0C);
        data->unk_0C = NULL;
        data->unk_0B = TRUE;
        data->unk_00 = FALSE;
    }
    ov60_021E75C4(spC, sp8, r7, r4, data->unk_04);
}
#else
extern s32 _s32_div_f(s32, s32);
asm void ov60_021E7454(SysTask *task, void *pVoid) {
    push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	ldrb r0, [r5, #0xa]
	add r0, r0, #1
	strb r0, [r5, #0xa]
	ldr r7, [r5, #0x10]
	ldr r0, [r5, #0x20]
	ldrb r4, [r5, #0xa]
	sub r1, r0, r7
	mov r0, #8
	ldrsh r6, [r5, r0]
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	add r0, r7, r0
	str r0, [sp, #0xc]
	ldr r7, [r5, #0x14]
	ldr r0, [r5, #0x24]
	sub r1, r0, r7
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	add r0, r7, r0
	str r0, [sp, #8]
	ldr r7, [r5, #0x18]
	ldr r0, [r5, #0x28]
	sub r1, r0, r7
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	add r7, r7, r0
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x2c]
	str r0, [sp, #4]
	sub r1, r1, r0
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	ldr r1, [sp, #4]
	add r4, r1, r0
	ldr r0, [sp, #0xc]
	str r0, [r5, #0x3c]
	ldr r0, [sp, #8]
	str r0, [r5, #0x40]
	str r7, [r5, #0x44]
	str r4, [r5, #0x48]
	mov r0, #8
	ldrb r1, [r5, #0xa]
	ldrsh r0, [r5, r0]
	cmp r1, r0
	blt @_021E74DC
	ldr r0, [r5, #0xc]
	bl SysTask_Destroy
	mov r1, #0
	str r1, [r5, #0xc]
	mov r0, #1
	strb r0, [r5, #0xb]
	str r1, [r5]
@_021E74DC:
	ldr r0, [r5, #4]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r2, r7, #0
	add r3, r4, #0
	bl ov60_021E75C4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
}
#endif //NONMATCHING

void ov60_021E74F0(int winIn, int winOut, u8 topScreenEffect, u8 bottomScreenEffect, int whichScreen) {
    if (whichScreen) {
        GX_SetVisibleWnd(3);  // both
        G2_SetWnd0InsidePlane(winIn, topScreenEffect);
        G2_SetWnd1InsidePlane(winIn, topScreenEffect);
        G2_SetWndOutsidePlane(winOut, topScreenEffect);
    } else {
        GXS_SetVisibleWnd(3);  // both
        G2S_SetWnd0InsidePlane(winIn, bottomScreenEffect);
        G2S_SetWnd1InsidePlane(winIn, bottomScreenEffect);
        G2S_SetWndOutsidePlane(winOut, bottomScreenEffect);
    }
}

void ov60_021E75C4(int x1, int y1, int x2, int y2, int whichScreen) {
    if (x1 == 0 && x2 == 0xFF) {
        if (whichScreen) {
            G2_SetWnd1Position(0, y1, 1, y2);
            G2_SetWnd0Position(1, y1, 0, y2);
        } else {
            G2S_SetWnd1Position(0, y1, 1, y2);
            G2S_SetWnd0Position(1, y1, 0, y2);
        }
    } else {
        if (whichScreen) {
            G2_SetWnd0Position(x1, y1, x2, y2);
        } else {
            G2S_SetWnd0Position(x1, y1, x2, y2);
        }
    }
}

BgConfig *IntroMovie_GetBgConfig(IntroMovieOvyData *data) {
    return data->bgConfig;
}

IntroMovieSub_46C *ov60_021E768C(IntroMovieOvyData *data) {
    return &data->unk_46C;
}

BOOL ov60_021E7698(IntroMovieOvyData *data) {
    return data->introSkipped;
}

int ov60_021E769C(IntroMovieOvyData *data) {
    return data->unk_004;
}

void ov60_021E76A0(IntroMovieOvyData *data) {
    G2_BlendNone();
    G2S_BlendNone();
    GX_SetVisibleWnd(0);
    GXS_SetVisibleWnd(0);
    for (int i = 0; i < 8; ++i) {
        BgSetPosTextAndCommit(data->bgConfig, i, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(data->bgConfig, i, BG_POS_OP_SET_Y, 0);
    }
}

void ov60_021E76F4(IntroMovieOvyData *data, int a1, int a2, int a3) {
    int sp8 = 0x1F;
    IntroMovieSub_614 *r4 = &data->unk_614;
    BOOL r5 = 0;
    PMLCDTarget r7 = PM_LCD_BOTTOM;
    int sp4 = 0;
    r4->active = 1;
    r4->finished = 0;
    r4->duration = a3;
    r4->counter = 0;
    r4->whichScreen = a2;
    r4->x = FX16_ONE;
    r4->y = 0;
    r4->kind = a1;
    int r2;
    int color;
    if (a2) {
        r2 = GF_BG_LYR_MAIN_0;
        r7 = PM_LCD_TOP;
    } else {
        r2 = GF_BG_LYR_SUB_0;
        r7 = PM_LCD_BOTTOM;
    }
    if (r4->kind == 0 || r4->kind == 1) {
        color = RGB_WHITE;
    } else {
        color = RGB_BLACK;
    }
    BG_SetMaskColor(r2, color);
    if (r4->kind == 0 || r4->kind == 2) {
        sp8 = 0;
        sp4 = 0x1F;
        r5 = TRUE;
    }
    ov60_021E75C4(0, 0, 255, 192, a2);
    ov60_021E74F0(sp8, sp4, 1, 1, a2);
    if (r5) {
        SetMasterBrightnessNeutral(r7);
    }
    r4->task = SysTask_CreateOnMainQueue(ov60_021E77C0, r4, 0);
    Main_SetHBlankIntrCB(ov60_021E7864, r4);
}

BOOL ov60_021E77A0(IntroMovieOvyData *data) {
    IntroMovieSub_614 *unk_614 = &data->unk_614;
    if (!unk_614->active) {
        return TRUE;
    }
    if (unk_614->finished) {
        return TRUE;
    }
    return FALSE;
}

void ov60_021E77C0(SysTask *task, void *pVoid) {
    IntroMovieSub_614 *data = (IntroMovieSub_614 *)pVoid;

    u16 idx = FX32_CONST(8) * data->counter / data->duration;
    data->x = FX_CosIdx(idx);
    data->y = FX_SinIdx(idx);
    ++data->counter;
    if (data->counter >= data->duration) {
        SysTask_Destroy(data->task);
        data->task = NULL;
        data->finished = 1;
        data->active = 0;

        u8 screen = data->whichScreen == 0 ? PM_LCD_BOTTOM : PM_LCD_TOP;
        if (data->kind == 1) {
            sub_0200FBF4(screen, RGB_WHITE);
        } else if (data->kind == 3) {
            sub_0200FBF4(screen, RGB_BLACK);
        } else {
            if (data->whichScreen) {
                GX_SetVisibleWnd(0);
            } else {
                GXS_SetVisibleWnd(0);
            }
            SetMasterBrightnessNeutral(screen);
        }
        Main_SetHBlankIntrCB(NULL, NULL);
    }
}

void ov60_021E7864(void *pVoid) {
    IntroMovieSub_614 *data = (IntroMovieSub_614 *)pVoid;

    int vcount = GX_GetVCount();
    if (vcount > 0xBF) {
        ov60_021E75C4(0, 0, 0x7F, 0xC0, data->whichScreen);
    } else if (data->x == FX16_ONE) {
        ov60_021E75C4(0, 0, 0xFF, 0xC0, data->whichScreen);
    } else if (data->x == -FX16_ONE) {
        ov60_021E75C4(0, 0, 0, 0xC0, data->whichScreen);
    } else {
        int y = data->y <= 0 ? 0 : vcount * data->x / data->y;
        y += 0x7F;
        if (y > 0xFF) {
            y = 0xFF;
        } else if (y < 0) {
            y = 0;
        }
        ov60_021E75C4(0, 0, y, 0xC0, data->whichScreen);
    }
}

void *IntroMovie_GetSceneDataPtr(IntroMovieOvyData *data) {
    void *ret = NULL;
    switch (data->sceneNumber) {
    case 0:
        ret = &data->scene1Data;
        break;
    case 1:
        ret = &data->scene2Data;
        break;
    case 2:
        ret = &data->scene3Data;
        break;
    case 3:
        ret = &data->scene4Data;
        break;
    case 4:
        ret = &data->scene5Data;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }
    return ret;
}

void IntroMovie_AdvanceSceneStep(IntroMovieOvyData *data) {
    ++data->sceneStep;
    data->sceneTimer = 0;
}

u8 IntroMovie_GetSceneStep(IntroMovieOvyData *data) {
    return data->sceneStep;
}

u8 IntroMovie_GetSceneStepTimer(IntroMovieOvyData *data) {
    return data->sceneTimer;
}
