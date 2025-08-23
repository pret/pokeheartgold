#include "global.h"

#include "intro_movie_internal.h"
#include "math_util.h"
#include "sys_task_api.h"
#include "system.h"
#include "unk_0200FA24.h"

void Task_IntroMovie_BlendFadeEffect(SysTask *task, void *pVoid);
int IntroMovie_BgLayerToScrollEffectSlot(GFBgLayer bgId);
void Task_IntroMovie_BgScroll_VBlank(SysTask *task, void *pVoid);
void Task_IntroMovie_BgScroll_NotVBlank(SysTask *task, void *pVoid);
void Task_IntroMovie_WindowPanEffect(SysTask *task, void *pVoid);
void Task_IntroMovie_CircleWipeEffect(SysTask *task, void *pVoid);
void IntroMovie_CircleWipeEffect_HBlankCB(void *pVoid);

void IntroMovie_CreateSpriteResourceManagers(IntroMovieOverlayData *data, const u8 *counts) {
    for (u8 i = 0; i < 4; ++i) {
        data->spriteResManagers[i] = Create2DGfxResObjMan(counts[i], (GfGfxResType)i, HEAP_ID_INTRO_MOVIE);
    }
}

void IntroMovie_DestroySpriteResourceManagers(IntroMovieOverlayData *data) {
    for (u8 i = 0; i < 4; ++i) {
        Destroy2DGfxResObjMan(data->spriteResManagers[i]);
    }
}

GF_2DGfxResMan **IntroMovie_GetSpriteResourceManagersArray(IntroMovieOverlayData *data) {
    return data->spriteResManagers;
}

void IntroMovie_StartSpriteAnimAndMakeVisible(Sprite *sprite, BOOL active) {
    Sprite_SetAnimActiveFlag(sprite, active);
    Sprite_SetDrawFlag(sprite, active);
}

void IntroMovie_BuildSpriteResourcesHeaderAndTemplate(int resId, IntroMovieOverlayData *data, int priority, NNS_G2D_VRAM_TYPE whichScreen, SpriteTemplate *template, SpriteResourcesHeader *header) {
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
        data->spriteResManagers[GF_GFX_RES_TYPE_CHAR],
        data->spriteResManagers[GF_GFX_RES_TYPE_PLTT],
        data->spriteResManagers[GF_GFX_RES_TYPE_CELL],
        data->spriteResManagers[GF_GFX_RES_TYPE_ANIM],
        NULL,
        NULL);
    template->spriteList = data->spriteList;
    template->header = header;
    SetVec(template->position, 0, 0, 0);
    SetVec(template->scale, FX32_ONE, FX32_ONE, FX32_ONE);
    template->rotation = 0;
    template->drawPriority = 0;
    template->whichScreen = whichScreen;
    template->heapID = HEAP_ID_INTRO_MOVIE;
}

void IntroMovie_RendererSetSurfaceCoords(IntroMovieOverlayData *data, int mainx, int mainy, int subx, int suby) {
    G2dRenderer_SetSubSurfaceCoords(&data->spriteRenderer, subx * FX32_ONE, suby * FX32_ONE);
    G2dRenderer_SetMainSurfaceCoords(&data->spriteRenderer, mainx * FX32_ONE, mainy * FX32_ONE);
}

void IntroMovie_StartBlendFadeEffect(IntroMovieBgBlendAnim *data, int plane1, int plane2, u8 duration, int direction, int screen) {
    data->counter = 0;
    data->ev = 0;
    data->finished = 0;
    data->topScreen = screen;
    data->plane1 = plane1;
    data->plane2 = plane2;
    data->duration = duration;
    data->direction = direction;
    data->task = SysTask_CreateOnMainQueue(Task_IntroMovie_BlendFadeEffect, data, 0);
}

void Task_IntroMovie_BlendFadeEffect(SysTask *task, void *pVoid) {
    IntroMovieBgBlendAnim *data = (IntroMovieBgBlendAnim *)pVoid;

    ++data->counter;
    data->ev = data->counter * 31 / data->duration;
    if (data->ev >= 31) {
        data->ev = 31;
        SysTask_Destroy(data->task);
        data->task = NULL;
        data->finished = 1;
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

void IntroMovie_StartBgScroll_VBlank(BgConfig *bgConfig, IntroMovieBgScrollAnim *data, GFBgLayer bgId, s16 xChange, s16 yChange, int duration) {
    IntroMovieBgScrollAnim *obj = &data[IntroMovie_BgLayerToScrollEffectSlot(bgId)];
    if (obj->active) {
        GF_ASSERT(FALSE);
        return;
    }

    if (duration == 0) {
        int x = xChange + Bg_GetXpos(bgConfig, bgId);
        int y = yChange + Bg_GetYpos(bgConfig, bgId);
        BgSetPosTextAndCommit(bgConfig, bgId, BG_POS_OP_SET_X, x);
        BgSetPosTextAndCommit(bgConfig, bgId, BG_POS_OP_SET_Y, y);
        return;
    }

    obj->bgConfig = bgConfig;
    obj->bgId = bgId;
    obj->counter = 0;
    obj->finished = FALSE;
    obj->duration = duration;
    obj->xOrig = Bg_GetXpos(bgConfig, bgId);
    obj->yOrig = Bg_GetYpos(bgConfig, bgId);
    obj->xChange = xChange;
    obj->yChange = yChange;
    obj->active = TRUE;
    obj->task = SysTask_CreateOnVBlankQueue(Task_IntroMovie_BgScroll_VBlank, obj, 0);
}

void IntroMovie_StartBgScroll_NotVBlank(BgConfig *bgConfig, IntroMovieBgScrollAnim *data, GFBgLayer bgId, s16 xChange, s16 yChange, int duration) {
    IntroMovieBgScrollAnim *obj = &data[IntroMovie_BgLayerToScrollEffectSlot(bgId)];
    if (obj->active) {
        GF_ASSERT(FALSE);
        return;
    }

    if (duration == 0) {
        int x = xChange + Bg_GetXpos(bgConfig, bgId);
        int y = yChange + Bg_GetYpos(bgConfig, bgId);
        BgSetPosTextAndCommit(bgConfig, bgId, BG_POS_OP_SET_X, x);
        BgSetPosTextAndCommit(bgConfig, bgId, BG_POS_OP_SET_Y, y);
        return;
    }

    obj->bgConfig = bgConfig;
    obj->bgId = bgId;
    obj->counter = 0;
    obj->finished = FALSE;
    obj->duration = duration;
    obj->xOrig = Bg_GetXpos(bgConfig, bgId);
    obj->yOrig = Bg_GetYpos(bgConfig, bgId);
    obj->xChange = xChange;
    obj->yChange = yChange;
    obj->active = TRUE;
    obj->task = SysTask_CreateOnMainQueue(Task_IntroMovie_BgScroll_NotVBlank, obj, 0);
}

void Task_IntroMovie_BgScroll_VBlank(SysTask *task, void *pVoid) {
    IntroMovieBgScrollAnim *data = (IntroMovieBgScrollAnim *)pVoid;
    int x;
    int y;

    if (data->duration < 0) {
        x = data->xChange + Bg_GetXpos(data->bgConfig, data->bgId);
        y = data->yChange + Bg_GetYpos(data->bgConfig, data->bgId);
    } else {
        ++data->counter;
        x = data->xChange * data->counter / data->duration;
        y = data->yChange * data->counter / data->duration;
        x += data->xOrig;
        y += data->yOrig;
        if (data->counter >= data->duration) {
            SysTask_Destroy(data->task);
            data->task = NULL;
            data->finished = TRUE;
            data->active = FALSE;
        }
    }
    BgSetPosTextAndCommit(data->bgConfig, data->bgId, BG_POS_OP_SET_X, x);
    BgSetPosTextAndCommit(data->bgConfig, data->bgId, BG_POS_OP_SET_Y, y);
}

void Task_IntroMovie_BgScroll_NotVBlank(SysTask *task, void *pVoid) {
    IntroMovieBgScrollAnim *data = (IntroMovieBgScrollAnim *)pVoid;
    int x;
    int y;

    if (data->duration < 0) {
        x = data->xChange + Bg_GetXpos(data->bgConfig, data->bgId);
        y = data->yChange + Bg_GetYpos(data->bgConfig, data->bgId);
    } else {
        ++data->counter;
        x = data->xChange * data->counter / data->duration;
        y = data->yChange * data->counter / data->duration;
        x += data->xOrig;
        y += data->yOrig;
        if (data->counter >= data->duration) {
            SysTask_Destroy(data->task);
            data->task = NULL;
            data->finished = TRUE;
            data->active = FALSE;
        }
    }
    ScheduleSetBgPosText(data->bgConfig, data->bgId, BG_POS_OP_SET_X, x);
    ScheduleSetBgPosText(data->bgConfig, data->bgId, BG_POS_OP_SET_Y, y);
}

BOOL IntroMovie_WaitBgScrollAnim(IntroMovieBgScrollAnim *data, GFBgLayer bgId) {
    BOOL ret = FALSE;
    IntroMovieBgScrollAnim *obj = &data[IntroMovie_BgLayerToScrollEffectSlot(bgId)];
    if (!obj->active) {
        return TRUE;
    }
    if (obj->finished) {
        ret = TRUE;
    }
    return ret;
}

void IntroMovie_CancelBgScrollAnim(IntroMovieBgScrollAnim *data, GFBgLayer bgId) {
    IntroMovieBgScrollAnim *obj = &data[IntroMovie_BgLayerToScrollEffectSlot(bgId)];
    if (obj->active) {
        SysTask_Destroy(obj->task);
        obj->task = NULL;
        obj->finished = TRUE;
        obj->active = FALSE;
    }
}

int IntroMovie_BgLayerToScrollEffectSlot(GFBgLayer bgId) {
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

IntroMovieBgWindowAnim *IntroMovie_StartWindowPanEffect(IntroMovieBgWindowAnim *data, int duration, int whichScreen, const IntroMovieBgWindowAnimParam *param) {
    IntroMovie_WindowsOn_SetInsideOutsidePlanes(param->winIn, param->winOut, param->topScreenEffect, param->bottomScreenEffect, whichScreen);
    if (duration <= 0) {
        IntroMovie_SetBgWindowsPosition(param->x1End, param->y1End, param->x2End, param->y2End, whichScreen);
        return NULL;
    }
    IntroMovieBgWindowAnim *ret = whichScreen == 0 ? &data[1] : &data[0];
    ret->param = *param;
    ret->duration = duration;
    ret->counter = 0;
    ret->finished = TRUE;
    ret->active = TRUE;
    ret->whichScreen = whichScreen;
    ret->x1 = param->x1Start;
    ret->y1 = param->y1Start;
    ret->x2 = param->x2Start;
    ret->y2 = param->y2Start;
    IntroMovie_SetBgWindowsPosition(param->x1Start, param->y1Start, param->x2Start, param->y2Start, whichScreen);
    ret->task = SysTask_CreateOnVBlankQueue(Task_IntroMovie_WindowPanEffect, ret, 0);
    return ret;
}

BOOL IntroMovie_WaitWindowPanEffect(IntroMovieBgWindowAnim *data, int a1) {
    IntroMovieBgWindowAnim *which = a1 == 0 ? &data[1] : &data[0];
    if (which->active == 0) {
        return TRUE;
    }
    return which->finished != 0;
}

#define SCALE_POS(start, end, pos, duration) ({ \
    int diff = (end) - (start);                 \
    diff = diff * (pos) / (duration);           \
    (start) + diff;                             \
})

void Task_IntroMovie_WindowPanEffect(SysTask *task, void *pVoid) {
    IntroMovieBgWindowAnim *data = (IntroMovieBgWindowAnim *)pVoid;
    ++data->counter;
    int x1 = SCALE_POS(data->param.x1Start, data->param.x1End, data->counter, data->duration);
    int y1 = SCALE_POS(data->param.y1Start, data->param.y1End, data->counter, data->duration);
    int x2 = SCALE_POS(data->param.x2Start, data->param.x2End, data->counter, data->duration);
    int y2 = SCALE_POS(data->param.y2Start, data->param.y2End, data->counter, data->duration);
    data->x1 = x1;
    data->y1 = y1;
    data->x2 = x2;
    data->y2 = y2;
    if (data->counter >= data->duration) {
        SysTask_Destroy(data->task);
        data->task = NULL;
        data->finished = TRUE;
        data->active = FALSE;
    }
    IntroMovie_SetBgWindowsPosition(x1, y1, x2, y2, data->whichScreen);
}

#undef SCALE_POS

void IntroMovie_WindowsOn_SetInsideOutsidePlanes(int winIn, int winOut, u8 topScreenEffect, u8 bottomScreenEffect, int whichScreen) {
    if (whichScreen) {
        GX_SetVisibleWnd(GX_WNDMASK_W0 | GX_WNDMASK_W1);
        G2_SetWnd0InsidePlane(winIn, topScreenEffect);
        G2_SetWnd1InsidePlane(winIn, topScreenEffect);
        G2_SetWndOutsidePlane(winOut, topScreenEffect);
    } else {
        GXS_SetVisibleWnd(3); // both
        G2S_SetWnd0InsidePlane(winIn, bottomScreenEffect);
        G2S_SetWnd1InsidePlane(winIn, bottomScreenEffect);
        G2S_SetWndOutsidePlane(winOut, bottomScreenEffect);
    }
}

void IntroMovie_SetBgWindowsPosition(int x1, int y1, int x2, int y2, int whichScreen) {
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

BgConfig *IntroMovie_GetBgConfig(IntroMovieOverlayData *data) {
    return data->bgConfig;
}

IntroMovieBgLinearAnims *IntroMovie_GetBgLinearAnimsController(IntroMovieOverlayData *data) {
    return &data->bgAnimCnt;
}

BOOL IntroMovie_GetIntroSkippedFlag(IntroMovieOverlayData *data) {
    return data->introSkipped;
}

int IntroMovie_GetTotalFrameCount(IntroMovieOverlayData *data) {
    return data->totalFrameCount;
}

void IntroMovie_InitBgAnimGxState(IntroMovieOverlayData *data) {
    G2_BlendNone();
    G2S_BlendNone();
    GX_SetVisibleWnd(GX_WNDMASK_NONE);
    GXS_SetVisibleWnd(0);
    for (int i = 0; i < 8; ++i) {
        BgSetPosTextAndCommit(data->bgConfig, i, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(data->bgConfig, i, BG_POS_OP_SET_Y, 0);
    }
}

void IntroMovie_BeginCircleWipeEffect(IntroMovieOverlayData *data, int kind, BOOL isTopScreen, int duration) {
    int winIn = 0x1F;
    IntroMovieCircleWipeEffect *effectData = &data->circleWipeEffect;
    BOOL setBrightnessNeutral = FALSE;
    PMLCDTarget screenId = PM_LCD_BOTTOM;
    int winOut = 0;
    effectData->active = TRUE;
    effectData->finished = FALSE;
    effectData->duration = duration;
    effectData->counter = 0;
    effectData->whichScreen = isTopScreen;
    effectData->x = FX16_ONE;
    effectData->y = 0;
    effectData->kind = kind;
    int bgId;
    int color;
    if (isTopScreen) {
        bgId = GF_BG_LYR_MAIN_0;
        screenId = PM_LCD_TOP;
    } else {
        bgId = GF_BG_LYR_SUB_0;
        screenId = PM_LCD_BOTTOM;
    }
    if (effectData->kind == 0 || effectData->kind == 1) {
        color = RGB_WHITE;
    } else {
        color = RGB_BLACK;
    }
    BG_SetMaskColor(bgId, color);
    if (effectData->kind == 0 || effectData->kind == 2) {
        winIn = 0;
        winOut = 0x1F;
        setBrightnessNeutral = TRUE;
    }
    IntroMovie_SetBgWindowsPosition(0, 0, 255, 192, isTopScreen);
    IntroMovie_WindowsOn_SetInsideOutsidePlanes(winIn, winOut, 1, 1, isTopScreen);
    if (setBrightnessNeutral) {
        SetMasterBrightnessNeutral(screenId);
    }
    effectData->task = SysTask_CreateOnMainQueue(Task_IntroMovie_CircleWipeEffect, effectData, 0);
    Main_SetHBlankIntrCB(IntroMovie_CircleWipeEffect_HBlankCB, effectData);
}

BOOL IntroMovie_WaitCircleWipeEffect(IntroMovieOverlayData *data) {
    IntroMovieCircleWipeEffect *effectData = &data->circleWipeEffect;
    if (!effectData->active) {
        return TRUE;
    }
    if (effectData->finished) {
        return TRUE;
    }
    return FALSE;
}

void Task_IntroMovie_CircleWipeEffect(SysTask *task, void *pVoid) {
    IntroMovieCircleWipeEffect *effectData = (IntroMovieCircleWipeEffect *)pVoid;

    u16 idx = FX_DEG_TO_IDX(180 * FX32_ONE) * effectData->counter / effectData->duration;
    effectData->x = FX_CosIdx(idx);
    effectData->y = FX_SinIdx(idx);
    ++effectData->counter;
    if (effectData->counter >= effectData->duration) {
        SysTask_Destroy(effectData->task);
        effectData->task = NULL;
        effectData->finished = TRUE;
        effectData->active = FALSE;

        u8 screen = effectData->whichScreen == 0 ? PM_LCD_BOTTOM : PM_LCD_TOP;
        if (effectData->kind == 1) {
            sub_0200FBF4(screen, RGB_WHITE);
        } else if (effectData->kind == 3) {
            sub_0200FBF4(screen, RGB_BLACK);
        } else {
            if (effectData->whichScreen) {
                GX_SetVisibleWnd(GX_WNDMASK_NONE);
            } else {
                GXS_SetVisibleWnd(0);
            }
            SetMasterBrightnessNeutral(screen);
        }
        Main_SetHBlankIntrCB(NULL, NULL);
    }
}

void IntroMovie_CircleWipeEffect_HBlankCB(void *pVoid) {
    IntroMovieCircleWipeEffect *data = (IntroMovieCircleWipeEffect *)pVoid;

    int vcount = GX_GetVCount();
    if (vcount > 0xBF) {
        IntroMovie_SetBgWindowsPosition(0, 0, 0x7F, 0xC0, data->whichScreen);
    } else if (data->x == FX16_ONE) {
        IntroMovie_SetBgWindowsPosition(0, 0, 0xFF, 0xC0, data->whichScreen);
    } else if (data->x == -FX16_ONE) {
        IntroMovie_SetBgWindowsPosition(0, 0, 0, 0xC0, data->whichScreen);
    } else {
        int y = data->y <= 0 ? 0 : vcount * data->x / data->y;
        y += 0x7F;
        if (y > 0xFF) {
            y = 0xFF;
        } else if (y < 0) {
            y = 0;
        }
        IntroMovie_SetBgWindowsPosition(0, 0, y, 0xC0, data->whichScreen);
    }
}

void *IntroMovie_GetSceneDataPtr(IntroMovieOverlayData *data) {
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

void IntroMovie_AdvanceSceneStep(IntroMovieOverlayData *data) {
    ++data->sceneStep;
    data->sceneTimer = 0;
}

u8 IntroMovie_GetSceneStep(IntroMovieOverlayData *data) {
    return data->sceneStep;
}

u8 IntroMovie_GetSceneStepTimer(IntroMovieOverlayData *data) {
    return data->sceneTimer;
}
