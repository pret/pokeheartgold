#include "global.h"
#include "alph_puzzle.h"
#include "unk_0200FA24.h"
#include "gx_layers.h"
#include "sound_02004A44.h"
#include "system.h"
#include "options.h"
#include "unk_020183F0.h"
#include "player_data.h"
#include "event_data.h"
#include "sys_flags.h"
#include "unk_020210A0.h"
#include "unk_02025154.h"
#include "unk_02005D10.h"
#include "constants/sndseq.h"

static int AlphPuzzleMainSeq_FadeIn(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_FadeOut(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_1(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_2(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_3(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_4(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_5(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_6(AlphPuzzleData *data);
static void ov110_021E5BE4(AlphPuzzleData *data);
//static void ov110_021E5C18(AlphPuzzleData *data);
static void ov110_021E5C3C(AlphPuzzleData *data);

BOOL ov110_AlphPuzzle_OvyInit(OVY_MANAGER *man, int *state) {
    switch (*state) {
    case 0:
        ov110_021E5A24();
        CreateHeap(HEAP_ID_3, HEAP_ID_ALPH_PUZZLE, 0x20000);
        AlphPuzzleData *data = OverlayManager_CreateAndGetData(man, sizeof(AlphPuzzleData), HEAP_ID_ALPH_PUZZLE);
        MI_CpuFill8(data, 0, sizeof(AlphPuzzleData));
        data->heapId = HEAP_ID_ALPH_PUZZLE;
        data->unk10 = OverlayManager_GetArgs(man);
        sub_02004EC4(74, 0, 0);
        ov110_021E5A74(data);
        (*state)++;
        break;
    case 1:
        if (ov110_021E5AD4(OverlayManager_GetData(man))) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

typedef enum AlphPuzzleStates {
    ALPH_PUZZLE_STATE_FADE_IN,
    ALPH_PUZZLE_STATE_1,
    ALPH_PUZZLE_STATE_2,
    ALPH_PUZZLE_STATE_3,
    ALPH_PUZZLE_STATE_4,
    ALPH_PUZZLE_STATE_5,
    ALPH_PUZZLE_STATE_6,
    ALPH_PUZZLE_STATE_FADE_OUT,
    ALPH_PUZZLE_STATE_END
} AlphPuzzleStates;

BOOL ov110_AlphPuzzle_OvyExec(OVY_MANAGER *man, int *state) {
    AlphPuzzleData *data = OverlayManager_GetData(man);
    switch (*state) {
    case ALPH_PUZZLE_STATE_FADE_IN:
        *state = AlphPuzzleMainSeq_FadeIn(data);
        break;
    case ALPH_PUZZLE_STATE_1:
        *state = AlphPuzzleMainSeq_1(data);
        break;
    case ALPH_PUZZLE_STATE_2:
        *state = AlphPuzzleMainSeq_2(data);
        break;
    case ALPH_PUZZLE_STATE_3:
        *state = AlphPuzzleMainSeq_3(data);
        break;
    case ALPH_PUZZLE_STATE_4:
        *state = AlphPuzzleMainSeq_4(data);
        break;
    case ALPH_PUZZLE_STATE_5:
        *state = AlphPuzzleMainSeq_5(data);
        break;
    case ALPH_PUZZLE_STATE_6:
        *state = AlphPuzzleMainSeq_6(data);
        break;
    case ALPH_PUZZLE_STATE_FADE_OUT:
        *state = AlphPuzzleMainSeq_FadeOut(data);
        break;
    case ALPH_PUZZLE_STATE_END:
        return TRUE;
    }
    sub_0200D020(data->unk88);
    return FALSE;
}

BOOL ov110_AlphPuzzle_OvyExit(OVY_MANAGER *man) {
    AlphPuzzleData *data = OverlayManager_GetData(man);
    if (!ov110_021E5B0C(data)) {
        return FALSE;
    }
    ov110_021E5A24();
    ov110_021E5AAC(data);
    OverlayManager_FreeData(man);
    DestroyHeap(HEAP_ID_ALPH_PUZZLE);
    return TRUE;
}

void ov110_021E5A24(void) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GX_DisableEngineALayers();
    GX_DisableEngineBLayers();
    int *ptr = (int *) 0x4000000;
    *ptr = *ptr & 0xFFFFE0FF;
    ptr = (int *) 0x4001000;
    *ptr = *ptr & 0xFFFFE0FF;
    sub_0200FBF4(0, 0);
    sub_0200FBF4(1, 0);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
}

void ov110_021E5A74(AlphPuzzleData *data) {
    data->unk4 = sub_020183F0(data->unk10->unk8);
    OPTIONS *options = Save_PlayerData_GetOptionsAddr(data->unk10->savedata);
    data->textFrameDelay = Options_GetTextFrameDelay(options);
    data->frame = Options_GetFrame(options);
    data->unk19 = data->unk10->unk5;
}

void ov110_021E5AAC(AlphPuzzleData *data) {
    sub_02018410(data->unk10->unk8, data->unk4);
    if (data->unk27) {
        Save_VarsFlags_SetAlphPuzzleFlag(Save_VarsFlags_Get(data->unk10->savedata), data->unk19);
    }
}

BOOL ov110_021E5AD4(AlphPuzzleData *data) {
    switch (data->unkState) {
    case 0:
        ov110_021E5BE4(data);
        data->unkState++;
        break;
    case 1:
        ov110_021E5C3C(data);
        sub_020210BC();
        sub_02021148(1);
        data->unkState = 0;
        return TRUE;
    }
    return FALSE;
}

BOOL ov110_021E5B0C(AlphPuzzleData *data) {
    sub_02021238();
    ov110_021E5C18(data);
    return TRUE;
}

static int AlphPuzzleMainSeq_FadeIn(AlphPuzzleData *data) {
    switch (data->unkState) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, 0, 6, 1, data->heapId);
        data->unkState++;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            data->unkState = 0;
            return ALPH_PUZZLE_STATE_1;
        }
        break;
    }
    return ALPH_PUZZLE_STATE_FADE_IN;
}

static int AlphPuzzleMainSeq_FadeOut(AlphPuzzleData *data) {
    switch (data->unkState) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, data->heapId);
        data->unkState++;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            data->unkState = 0;
            return ALPH_PUZZLE_STATE_END;
        }
        break;
    }
    return ALPH_PUZZLE_STATE_FADE_OUT;
}

static int AlphPuzzleMainSeq_1(AlphPuzzleData *data) {
    return ov110_021E5C60(data);
}

static int AlphPuzzleMainSeq_2(AlphPuzzleData *data) {
    return ov110_021E5CCC(data);
}

static int AlphPuzzleMainSeq_3(AlphPuzzleData *data) {
    return ov110_021E5E1C(data);
}

static int AlphPuzzleMainSeq_4(AlphPuzzleData *data) {
    return ov110_021E5F84(data);
}

static int AlphPuzzleMainSeq_5(AlphPuzzleData *data) {
    return ov110_021E6014(data);
}

static int AlphPuzzleMainSeq_6(AlphPuzzleData *data) {
    return ov110_021E6070(data);
}

static void ov110_021E5BE4(AlphPuzzleData *data) {
    ov110_021E6150(data);
    ov110_021E61D0(data);
    ov110_021E6394(data);
    ov110_021E6580(data);
    ov110_021E6618(data);
    ov110_021E6730(data);
    Main_SetVBlankIntrCB(ov110_021E6110, data);
}

void ov110_021E5C18(AlphPuzzleData *data) {
    ov110_021E6748(data);
    ov110_021E6650(data);
    ov110_021E65DC(data);
    ov110_021E6544(data);
    ov110_021E6348(data);
}

static void ov110_021E5C3C(AlphPuzzleData *data) {
    ov110_021E6904(data, 0);
    ov110_021E6A04(data);
    ScheduleBgTilemapBufferTransfer(data->bgConfig, 2);
    ScheduleBgTilemapBufferTransfer(data->bgConfig, 4);
}

extern STRUCT_0223F90B _021E6D8C;

static int ov110_021E5C60(AlphPuzzleData *data) {
    if (!System_GetTouchNew()) {
        return ALPH_PUZZLE_STATE_1;
    }
    if (!sub_02025224(&_021E6D8C)) {
        data->unk4 = 1;
        ov110_021E6D20(data);
        PlaySE(SEQ_SE_DP_SELECT);
        return ALPH_PUZZLE_STATE_5;
    }
    s32 unk = ov110_021E5D30(data, gSystem.touchX, gSystem.touchY);
    if (unk < 0) {
        return ALPH_PUZZLE_STATE_1;
    }
    ov110_021E6C58(data, unk, 1);
    PlaySE(SEQ_SE_GS_SEKIBAN_SENTAKU);
    data->unk4 = 1;
    return ALPH_PUZZLE_STATE_2;
}
