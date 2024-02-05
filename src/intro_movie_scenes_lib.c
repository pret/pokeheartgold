#include "global.h"
#include "intro_movie_internal.h"
#include "math_util.h"
#include "sys_task_api.h"

void ov60_021E6FFC(SysTask *task, void *pVoid);
void ov60_021E71CC(SysTask *task, void *pVoid);
void ov60_021E7264(SysTask *task, void *pVoid);

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
