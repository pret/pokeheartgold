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
#include "unk_0200CF18.h"
#include "palette.h"
#include "gf_gfx_loader.h"
#include "render_window.h"
#include "constants/sndseq.h"
#include "text.h"
#include "font.h"
#include "unk_0201660C.h"
#include "vram_transfer_manager.h"
#include "unk_0200B150.h"
#include "unk_02023694.h"
#include "msgdata/msg/msg_0002.h"
#include "msgdata/msg.naix"

typedef enum AlphPuzzleStates {
    ALPH_PUZZLE_STATE_FADE_IN,
    ALPH_PUZZLE_STATE_WAIT_FOR_INPUT,
    ALPH_PUZZLE_STATE_2,
    ALPH_PUZZLE_STATE_3,
    ALPH_PUZZLE_STATE_ROTATE_TILE,
    ALPH_PUZZLE_STATE_5,
    ALPH_PUZZLE_STATE_CLEAR,
    ALPH_PUZZLE_STATE_FADE_OUT,
    ALPH_PUZZLE_STATE_END
} AlphPuzzleStates;

static void ov110_021E5A24(void);
static void ov110_021E5A74(AlphPuzzleData *data);
static void ov110_021E5AAC(AlphPuzzleData *data);
static BOOL ov110_021E5AD4(AlphPuzzleData *data);
static BOOL ov110_021E5B0C(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_FadeIn(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_FadeOut(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_WaitForInput(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_2(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_3(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_RotateTile(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_5(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_Clear(AlphPuzzleData *data);
static void ov110_021E5BE4(AlphPuzzleData *data);
static void ov110_021E5C18(AlphPuzzleData *data);
static void ov110_021E5C3C(AlphPuzzleData *data);
static int AlphPuzzle_CheckInput(AlphPuzzleData *data);
static int ov110_021E5CCC(AlphPuzzleData *data);
static s32 AlphPuzzle_TrySelectTileTouchScreen(AlphPuzzleData *data, u16 touchX, u16 touchY);
static int ov110_021E5D90(AlphPuzzleData *data, u8 *xOut, u8 *yOut);
static int ov110_021E5E1C(AlphPuzzleData *data);
static int ov110_021E5F84(AlphPuzzleData *data);
static int ov110_021E6014(AlphPuzzleData *data);
static int ov110_021E6070(AlphPuzzleData *data);
static void ov110_021E6110(void *dat);
static void AlphPuzzle_InitTileData(AlphPuzzleData *data);
static void ov110_021E61B0();
static void ov110_021E61D0(AlphPuzzleData *data);
static void ov110_021E6348(AlphPuzzleData *data);
static void ov110_021E6394(AlphPuzzleData *data);
static void ov110_021E6544(AlphPuzzleData *data);
static void AlphPuzzle_InitText(AlphPuzzleData *data);
static void AlphPuzzle_DeleteText(AlphPuzzleData *data);
static void ov110_021E6618(AlphPuzzleData *data);
static void ov110_021E6650(AlphPuzzleData *data);
static void ov110_021E6678(AlphPuzzleData *data);
static void ov110_021E66F8(AlphPuzzleData *data);
static void ov110_021E6730(AlphPuzzleData *data);
static void ov110_021E6748(AlphPuzzleData *data);
static void ov110_021E6764(AlphPuzzleData *data);
static void AlphPuzzle_DeleteSprites(AlphPuzzleData *data);
static BOOL AlphPuzzle_CheckComplete(AlphPuzzleData *data);
static void ov110_021E6904(AlphPuzzleData *data, int a1);
static void ov110_021E6988(AlphPuzzleData *data, int a1, int a2, u8 textFrameDelay);
static void ov110_021E6A04(AlphPuzzleData *data);
static void ov110_021E6A44(AlphPuzzleData *data, u8 x, u8 y, int a3);
static void ov110_021E6ABC(AlphPuzzleData *data, u8 x, u8 y);
static void ov110_021E6B38(AlphPuzzleData *data);
static AlphPuzzleStates ov110_021E6B94(AlphPuzzleData *data);
static void ov110_021E6BEC(AlphPuzzleTile *tile, s16 x, s16 y);
static void ov110_021E6C18(AlphPuzzleData *data, s16 tileIndex, u8 x, u8 y, u8 rotation);
static void AlphPuzzle_UpdateSelectedTile(AlphPuzzleData *data, u8 tileIndex, BOOL isSelecting);
static void ov110_021E6D20(AlphPuzzleData *data);
static void ov110_021E6D54(SysTask *task, void *_data);

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

BOOL ov110_AlphPuzzle_OvyExec(OVY_MANAGER *man, int *state) {
    AlphPuzzleData *data = OverlayManager_GetData(man);
    switch (*state) {
    case ALPH_PUZZLE_STATE_FADE_IN:
        *state = AlphPuzzleMainSeq_FadeIn(data);
        break;
    case ALPH_PUZZLE_STATE_WAIT_FOR_INPUT:
        *state = AlphPuzzleMainSeq_WaitForInput(data);
        break;
    case ALPH_PUZZLE_STATE_2:
        *state = AlphPuzzleMainSeq_2(data);
        break;
    case ALPH_PUZZLE_STATE_3:
        *state = AlphPuzzleMainSeq_3(data);
        break;
    case ALPH_PUZZLE_STATE_ROTATE_TILE:
        *state = AlphPuzzleMainSeq_RotateTile(data);
        break;
    case ALPH_PUZZLE_STATE_5:
        *state = AlphPuzzleMainSeq_5(data);
        break;
    case ALPH_PUZZLE_STATE_CLEAR:
        *state = AlphPuzzleMainSeq_Clear(data);
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

BOOL ov110_AlphPuzzle_OvyExit(OVY_MANAGER *man, int *state) {
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

static void ov110_021E5A24(void) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GX_DisableEngineALayers();
    GX_DisableEngineBLayers();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
    sub_0200FBF4(0, 0);
    sub_0200FBF4(1, 0);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
}

static void ov110_021E5A74(AlphPuzzleData *data) {
    data->unk4 = sub_020183F0(data->unk10->unk8);
    Options *options = Save_PlayerData_GetOptionsAddr(data->unk10->savedata);
    data->textFrameDelay = Options_GetTextFrameDelay(options);
    data->frame = Options_GetFrame(options);
    data->puzzleIndex = data->unk10->unk5;
}

static void ov110_021E5AAC(AlphPuzzleData *data) {
    sub_02018410(data->unk10->unk8, data->unk4);
    if (data->unk27) {
        Save_VarsFlags_SetAlphPuzzleFlag(Save_VarsFlags_Get(data->unk10->savedata), data->puzzleIndex);
    }
}

static BOOL ov110_021E5AD4(AlphPuzzleData *data) {
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

static BOOL ov110_021E5B0C(AlphPuzzleData *data) {
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
            return ALPH_PUZZLE_STATE_WAIT_FOR_INPUT;
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

static int AlphPuzzleMainSeq_WaitForInput(AlphPuzzleData *data) {
    return AlphPuzzle_CheckInput(data);
}

static int AlphPuzzleMainSeq_2(AlphPuzzleData *data) {
    return ov110_021E5CCC(data);
}

static int AlphPuzzleMainSeq_3(AlphPuzzleData *data) {
    return ov110_021E5E1C(data);
}

static int AlphPuzzleMainSeq_RotateTile(AlphPuzzleData *data) {
    return ov110_021E5F84(data);
}

static int AlphPuzzleMainSeq_5(AlphPuzzleData *data) {
    return ov110_021E6014(data);
}

static int AlphPuzzleMainSeq_Clear(AlphPuzzleData *data) {
    return ov110_021E6070(data);
}

static void ov110_021E5BE4(AlphPuzzleData *data) {
    AlphPuzzle_InitTileData(data);
    ov110_021E61D0(data);
    ov110_021E6394(data);
    AlphPuzzle_InitText(data);
    ov110_021E6618(data);
    ov110_021E6730(data);
    Main_SetVBlankIntrCB(ov110_021E6110, data);
}

static void ov110_021E5C18(AlphPuzzleData *data) {
    ov110_021E6748(data);
    ov110_021E6650(data);
    AlphPuzzle_DeleteText(data);
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

static int AlphPuzzle_CheckInput(AlphPuzzleData *data) {
    if (!System_GetTouchNew()) {
        return ALPH_PUZZLE_STATE_WAIT_FOR_INPUT;
    }
    if (!sub_02025224(&_021E6D8C)) {
        data->unk4 = 1;
        ov110_021E6D20(data);
        PlaySE(SEQ_SE_DP_SELECT);
        return ALPH_PUZZLE_STATE_5;
    }
    s32 tileIndex = AlphPuzzle_TrySelectTileTouchScreen(data, gSystem.touchX, gSystem.touchY);
    if (tileIndex < 0) {
        return ALPH_PUZZLE_STATE_WAIT_FOR_INPUT;
    }
    AlphPuzzle_UpdateSelectedTile(data, tileIndex, TRUE);
    PlaySE(SEQ_SE_GS_SEKIBAN_SENTAKU);
    data->unk4 = 1;
    return ALPH_PUZZLE_STATE_2;
}

static int ov110_021E5CCC(AlphPuzzleData *data) {
    if (!System_GetTouchHeld()) {
        data->unkE = 0;
        return ALPH_PUZZLE_STATE_ROTATE_TILE;
    }
    if (data->unkE++ >= 2) {
        data->unkE = 0;
        data->unk1C = (data->selectedTile->x * 32) + 64;
        data->unk1E = (data->selectedTile->y * 32) + 32;
        data->unk22 = data->selectedTile->x;
        data->unk23 = data->selectedTile->y;
        ov110_021E6A44(data, data->selectedTile->x, data->selectedTile->y, 3);
        return ALPH_PUZZLE_STATE_3;
    }
    return ALPH_PUZZLE_STATE_2;
}

s32 AlphPuzzle_TrySelectTileTouchScreen(AlphPuzzleData *data, u16 touchX, u16 touchY) {
    u16 x = touchX;
    u16 y = touchY;
    
    if (x < 32 || x >= 224) {
        return -1;
    }

    x = (x - 32) / 32;
    y = y / 32;

    for (s32 i = 0; i < 16; i++) {
        if (data->tileGrid[i].x == x && data->tileGrid[i].y == y) {
            if (data->tileGrid[i].isImmovable) {
                return -1;
            }
            return i;
        } 
    }

    return -1;
}

extern u8 ov110_021E6D9C[4][2];

static int ov110_021E5D90(AlphPuzzleData *data, u8 *xOut, u8 *yOut) { 
    int i;
    
    *xOut = 0;
    *yOut = 0;

    s16 x = data->unk1C;
    u16 x2;
    u16 y2;
    
    if (x < 32 || x >= 224) {
        return FALSE;
    }

    x2 = (x - 32) / 32;
    y2 = data->unk1E / 32;

    for (i = 0; i < 4; i++) {
        if (x2 == ov110_021E6D9C[i][0] && y2 == ov110_021E6D9C[i][1]) {
            return FALSE;
        }
    }

    for (i = 0; i < 16; i++) {
        if (data->unk1B != i && data->tileGrid[i].x == x2 && data->tileGrid[i].y == y2) {
            return FALSE;
        }
    }

    *xOut = x2;
    *yOut = y2;
    
    return TRUE;
}

static int ov110_021E5E1C(AlphPuzzleData *data) {
    if (!System_GetTouchHeld()) {
        ov110_021E6A44(data, data->selectedTile->x, data->selectedTile->y, 0);
        ov110_021E6A44(data, data->unk22, data->unk23, 0);
        ScheduleBgTilemapBufferTransfer(data->bgConfig, 2);
        if (data->unk22 == 0 && data->unk23 == 0) {
            PlaySE(SEQ_SE_DP_BOX01);
            ov110_021E6C18(data, data->unk1B, data->selectedTile->x, data->selectedTile->y, data->selectedTile->rotation);
        } else {
            PlaySE(SEQ_SE_GS_SEKIBAN_SENTAKU); //SE Slate Select
            ov110_021E6C18(data, data->unk1B, data->unk22, data->unk23, data->selectedTile->rotation);
        }
        AlphPuzzle_UpdateSelectedTile(data, -1, FALSE);
        if (AlphPuzzle_CheckComplete(data)) {
            return ALPH_PUZZLE_STATE_CLEAR;
        }
        return ALPH_PUZZLE_STATE_WAIT_FOR_INPUT;
    }
    
    s16 x = gSystem.touchX;
    s16 y = gSystem.touchY;
    
    data->unk20 = data->unk1C;
    data->unk21 = data->unk1E;
    
    if (y < 16) {
        y = 16;
    } else if (y > 176) {
        y = 176;
    }

    if (x < 48) {
        x = 48;
    } else if (x > 208) {
        x = 208;
    }
    
    Sprite_SetPositionXY(data->unk8C[1], x, y);
    ov110_021E6BEC(data->selectedTile, x - 2, y - 2);

    u8 xOut;
    u8 yOut;

    data->unk1C = x;
    data->unk1E = y;
    
    ov110_021E5D90(data, &xOut, &yOut);

    if (data->unk22 != xOut || data->unk23 != yOut) {
        ov110_021E6ABC(data, xOut, yOut);
        data->unk22 = xOut;
        data->unk23 = yOut;
    }
    
    return ALPH_PUZZLE_STATE_3;
}

static int ov110_021E5F84(AlphPuzzleData *data) {
    switch (data->unkC) {
    case 0:
        PlaySE(SEQ_SE_GS_SEKIBAN_KAITEN);
        data->unkC++;
        break;
    case 1:
        u16 temp = data->unkE++;
        sub_02024818(data->selectedTile->sprite, (u16)((u16)(temp << 0xb) + (data->selectedTile->rotation << 0xe)));
        if (data->unkE >= 8) {
            data->unkC++;
        }
        break;
    case 2:
        data->selectedTile->rotation = (data->selectedTile->rotation + 1) % 4;
        
        AlphPuzzle_UpdateSelectedTile(data, -1, FALSE);
        
        data->unkE = 0;
        data->unkC = 0;
        
        if (AlphPuzzle_CheckComplete(data)) {
            return ALPH_PUZZLE_STATE_CLEAR;
        }
        return ALPH_PUZZLE_STATE_WAIT_FOR_INPUT;
    }
    return ALPH_PUZZLE_STATE_ROTATE_TILE;
}

static int ov110_021E6014(AlphPuzzleData *data) {
    switch (data->unkC) {
    case 0:
        if (!data->unk1A) {
            ov110_021E6988(data, 0, 1, data->textFrameDelay);
            data->unkC++;
        }
        break;
    case 1:
        if (!TextPrinterCheckActive(data->textPrinterId)) {
            ov110_021E6B38(data);
            data->unkC++;
        }
        break;
    case 2:
        AlphPuzzleStates ret = ov110_021E6B94(data);
        if (ret != ALPH_PUZZLE_STATE_5) {
            data->unkC = 0;
            return ret;
        }
        break;
    }
    return ALPH_PUZZLE_STATE_5;
}

static int ov110_021E6070(AlphPuzzleData *data) {
    switch (data->unkC) {
    case 0:
        PlaySE(SEQ_SE_GS_PUZZLETOKU);
        data->unkC++;
        break;
    case 1:
        sub_02003E5C(data->palette, 2, 0x2b, 5, data->unkE, 0x7FFF);
        if (data->unkE++ >= 15) {
            data->unkC++;
        }
        break;
    case 2:
        sub_02003E5C(data->palette, 2, 0x2b, 5, data->unkE, 0x7FFF);
        if (data->unkE-- == 0) {
            data->unkC++;
        }
        break;
    default:
        data->unkC = 0;
        data->unkE = 0;
        data->unk27 = 1;
        return ALPH_PUZZLE_STATE_FADE_OUT;
    }

    return ALPH_PUZZLE_STATE_CLEAR;
}

static void ov110_021E6110(void *dat) {
    AlphPuzzleData *data = dat;
    if (data->palette) {
        sub_0200398C(data->palette);
    }
    if (data->unk84) {
        thunk_OamManager_ApplyAndResetBuffers();
    }

    NNS_GfdDoVramTransfer();
    DoScheduledBgGpuUpdates(data->bgConfig);

    OS_SetIrqCheckFlag(OS_IE_VBLANK);
}

typedef struct AlphPuzzleInitTileData {
    u8 index:5;
    u8 rotation:2;
    u8 isImmovable:1;
} AlphPuzzleInitTileData;

typedef AlphPuzzleInitTileData AlphPuzzle[6];

extern AlphPuzzle *dAlphPuzzles[ALPH_PUZZLE_MAX];

static void AlphPuzzle_InitTileData(AlphPuzzleData *data) {
    int y;
    int x;
    
    AlphPuzzleTile* tile;
    AlphPuzzle *puzzle = dAlphPuzzles[data->puzzleIndex];
    
    for (y = 0; y < 6; y++) {
        for (x = 0; x < 6; x++) {
            u32 pos = y * 6 + x;
            if ((*puzzle)[pos].index != 0 && (*puzzle)[pos].index <= 16) {
                tile = &data->tileGrid[(*puzzle)[pos].index - 1];
                tile->x = x;
                tile->y = y; 
                tile->rotation = (*puzzle)[pos].rotation;
                tile->isImmovable = (*puzzle)[pos].isImmovable;
                tile->sprite = NULL;
            }
        }
    }
}

extern const GraphicsBanks ov110_021E6F54;

static void ov110_021E61B0() {
    GraphicsBanks banks = ov110_021E6F54;
    GX_SetBanks(&banks);
}

extern GraphicsModes ov110_021E6DC0;
extern BgTemplate ov110_021E6E34;
extern BgTemplate ov110_021E6E6C;
extern BgTemplate ov110_021E6E88;
extern BgTemplate ov110_021E6DFC;
extern BgTemplate ov110_021E6E18;
extern BgTemplate ov110_021E6E50;

static void ov110_021E61D0(AlphPuzzleData *data) {
    ov110_021E61B0();
    data->bgConfig = BgConfig_Alloc(data->heapId);

    GraphicsModes mode = ov110_021E6DC0;
    
    SetBothScreensModesAndDisable(&mode);

    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);
    
    BgTemplate temp = ov110_021E6E34;
    InitBgFromTemplate(data->bgConfig, 4, &temp, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 4);
   
    BgTemplate temp2 = ov110_021E6E6C;
    InitBgFromTemplate(data->bgConfig, 6, &temp2, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 6);

    BgTemplate temp3 = ov110_021E6E88;
    InitBgFromTemplate(data->bgConfig, 7, &temp3, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 7);

    BgTemplate temp4 = ov110_021E6DFC;
    InitBgFromTemplate(data->bgConfig, 0, &temp4, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 0);

    BgTemplate temp5 = ov110_021E6E18;
    InitBgFromTemplate(data->bgConfig, 2, &temp5, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 2);

    BgTemplate temp6 = ov110_021E6E50;
    InitBgFromTemplate(data->bgConfig, 3, &temp6, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 3);

    BG_ClearCharDataRange(4, 32, 0, data->heapId);
    BG_ClearCharDataRange(7, 32, 0, data->heapId);
    BG_ClearCharDataRange(0, 32, 0, data->heapId);
    BG_ClearCharDataRange(3, 64, 0, data->heapId);
}

static void ov110_021E6348(AlphPuzzleData *data) {
    FreeBgTilemapBuffer(data->bgConfig, 3);
    FreeBgTilemapBuffer(data->bgConfig, 2);
    FreeBgTilemapBuffer(data->bgConfig, 0);
    FreeBgTilemapBuffer(data->bgConfig, 7);
    FreeBgTilemapBuffer(data->bgConfig, 6);
    FreeBgTilemapBuffer(data->bgConfig, 4);
    FreeToHeap(data->bgConfig);
    
    GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
}

static void ov110_021E6394(AlphPuzzleData *data) {
    NARC *narc = NARC_New(NARC_a_1_7_2, data->heapId);
    data->palette = PaletteData_Init(data->heapId);
    
    PaletteData_AllocBuffers(data->palette, 0, 256, data->heapId);
    PaletteData_AllocBuffers(data->palette, 1, 256, data->heapId);
    PaletteData_AllocBuffers(data->palette, 2, 256, data->heapId);
    
    sub_02003220(data->palette, narc, 10, data->heapId, 0, 256, 0, 0);
    sub_02003220(data->palette, narc, 10, data->heapId, 1, 256, 0, 0);
    sub_02003220(data->palette, narc, 0, data->heapId, 2, 256, 0, 0);
    
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 11, data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, 0, data->heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 14, data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, 0, data->heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 15, data->bgConfig, GF_BG_LYR_SUB_2, 0, 0, 0, data->heapId);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 11, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 0, data->heapId);
    
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 12, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 0, data->heapId);
    data->unkD8 = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 13, 0, &data->screenData, data->heapId);
    
    NARC_Delete(narc);
    
    PaletteData_LoadNarc(data->palette, NARC_a_0_3_8, data->frame + 26, data->heapId, 0, 32, 80);
    PaletteData_LoadNarc(data->palette, NARC_graphic_font, 8, data->heapId, 0, 32, 64);
    
    LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_MAIN_0, 1, 5, data->frame, data->heapId);
    sub_02003B50(data->palette, 1);
    sub_0200398C(data->palette);
}

static void ov110_021E6544(AlphPuzzleData *data) {
    FreeToHeap(data->unkD8);
    PaletteData_FreeBuffers(data->palette, 2);
    PaletteData_FreeBuffers(data->palette, 1);
    PaletteData_FreeBuffers(data->palette, 0);
    PaletteData_Free(data->palette);
}

static void AlphPuzzle_InitText(AlphPuzzleData *data) {
    FontID_Alloc(4, data->heapId);
    
    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0002_bin, data->heapId);
    data->messageFormat = MessageFormat_New_Custom(6, 16, data->heapId);
    data->unk30 = String_New(0x80, data->heapId);
    
    data->quitText = NewString_ReadMsgData(data->msgData, msg_0002_00000);
    
    for (int i = 0; i < 4; i++) {
        data->hintText[i] = NewString_ReadMsgData(data->msgData, i + msg_0002_00001);
    }
    
    data->confirmQuitText[0] = NewString_ReadMsgData(data->msgData, msg_0002_00005);
}

static void AlphPuzzle_DeleteText(AlphPuzzleData *data) {
    String_Delete(data->confirmQuitText[0]);
    for (int i = 0; i < 4; i++) {
        String_Delete(data->hintText[i]);
    }
    String_Delete(data->quitText);
    String_Delete(data->unk30);
    MessageFormat_Delete(data->messageFormat);
    DestroyMsgData(data->msgData);
    FontID_Release(4);
}

extern WindowTemplate ov110_021E6DE4[3];
static void ov110_021E6618(AlphPuzzleData *data) {
    for (int i = 0; i < 3; i++) {
        AddWindow(data->bgConfig, &data->window[i], &ov110_021E6DE4[i]);
        FillWindowPixelBuffer(&data->window[i], 0);
    }
    data->unk7C = sub_0201660C(data->heapId);
}

static void ov110_021E6650(AlphPuzzleData *data) {
    for (int i = 0; i < 3; i++) {
        ClearWindowTilemapAndCopyToVram(&data->window[i]);
        RemoveWindow(&data->window[i]);
    }
    sub_02016624(data->unk7C);
}

extern Unk122_021E92FC ov110_021E6EA4;
extern Unk122_021E92D0 ov110_021E6DD0;
extern const u16 ov110_021E6DB0[7];

static void ov110_021E6678(AlphPuzzleData *data) {
    GF_CreateVramTransferManager(32, data->heapId);
    data->unk84 = SpriteRenderer_Create(data->heapId);
    sub_0200CF70(data->unk84, &ov110_021E6EA4, &ov110_021E6DD0, 3);
    sub_0200B2E0(data->heapId);
    sub_0200B2E8(data->heapId);
    data->unk88 = SpriteRenderer_CreateGfxHandler(data->unk84);
    sub_0200CFF4(data->unk84, data->unk88, 18);
    sub_0200D2A4(data->unk84, data->unk88, ov110_021E6DB0, 2, 1);
}

static void ov110_021E66F8(AlphPuzzleData *data) {
    SpriteRenderer_RemoveGfxHandler(data->unk84, data->unk88);
    data->unk88 = NULL;
    SpriteRenderer_Delete(data->unk84);
    data->unk84 = NULL;
    GF_DestroyVramTransferManager();
    sub_0200B2E0(data->heapId);
}

static void ov110_021E6730(AlphPuzzleData *data) {
    ov110_021E6678(data);
    ov110_021E6764(data);
    GX_EngineAToggleLayers(16, GX_LAYER_TOGGLE_ON);
}

static void ov110_021E6748(AlphPuzzleData *data) {
    GX_EngineAToggleLayers(16, GX_LAYER_TOGGLE_OFF);
    AlphPuzzle_DeleteSprites(data);
    ov110_021E66F8(data);
}

extern UnkStruct_0200D2B4 ov110_021E6F7C[2];
extern UnkStruct_0200D2B4 ov110_021E6FCC;

static void ov110_021E6764(AlphPuzzleData *data) {
    int i;
    for (i = 0; i <= 1; i++) {
        data->unk8C[i] = SpriteRenderer_CreateSprite(data->unk84, data->unk88, &ov110_021E6F7C[i]);
        sub_02024868(data->unk8C[i], FX32_ONE);
    }
    Set2dSpriteVisibleFlag(data->unk8C[0], TRUE);
    Set2dSpriteVisibleFlag(data->unk8C[1], FALSE);
    Set2dSpriteAnimActiveFlag(data->unk8C[0], TRUE);
    sub_02024B78(data->unk8C[1], GX_OAM_MODE_NORMAL);
    Sprite_SetPriority(data->unk8C[1], 2);
    sub_02024B78(data->unk8C[1], GX_OAM_MODE_XLU);
    sub_0200E248(data->unk84, data->unk88, NARC_a_1_7_2, data->puzzleIndex + 4, 0, 1);
    for (i = 0; i < 16; i++) {
        u8 index = i + 2;
        data->unk8C[index] = SpriteRenderer_CreateSprite(data->unk84, data->unk88, &ov110_021E6FCC);
        Set2dSpriteVisibleFlag(data->unk8C[index], 1);
        Set2dSpriteAnimSeqNo(data->unk8C[index], i);
        sub_02024B78(data->unk8C[index], GX_OAM_MODE_NORMAL);
        sub_0202487C(data->unk8C[index], 2);
        data->tileGrid[i].sprite = data->unk8C[index]; 
        ov110_021E6C18(data, (u8) i, data->tileGrid[i].x, data->tileGrid[i].y, data->tileGrid[i].rotation);
    }
}

static void AlphPuzzle_DeleteSprites(AlphPuzzleData *data) {
    for (int i = 0; i < 18; i++) {
        Sprite_Delete(data->unk8C[i]);
    }
}

static BOOL AlphPuzzle_CheckComplete(AlphPuzzleData *data) {
    for (int i = 0; i < 16; i++) {
        if (data->tileGrid[i].rotation == 0) {
            if ((i % 4) + 1 == data->tileGrid[i].x && (i / 4) + 1 == data->tileGrid[i].y) {
                continue;
            }
        }
        return FALSE;
    }
    return TRUE;
}

//related to text color
extern u32 ov110_021E6DA4[3];

void ov110_021E6904(AlphPuzzleData *data, int a1) {
    FillWindowPixelBuffer(data->window, 0);
    Set2dSpriteAnimSeqNo(data->unk8C[0], a1);
    if (a1 == 1) {
        Sprite_ResetAnimCtrlState(data->unk8C[0]);
        Set2dSpriteAnimActiveFlag(data->unk8C[0], 1);
    } else {
        Set2dSpriteAnimActiveFlag(data->unk8C[0], 0);
    }
    
    u32 width = FontID_String_GetWidth(4, data->quitText, 0);
    AddTextPrinterParameterized2(data->window, 4, data->quitText, (48 - width) / 2, 4, 0xFF, ov110_021E6DA4[a1], NULL);
    ScheduleWindowCopyToVram(data->window);
}

static void ov110_021E6988(AlphPuzzleData *data, int a1, int a2, u8 textFrameDelay) {
    if (a2) {
        DrawFrameAndWindow2(&data->window[1], 1, 1, 5); 
    }
    FillWindowPixelBuffer(&data->window[1], 15);
    if (textFrameDelay == 0) {
        AddTextPrinterParameterized2(&data->window[1], 1, data->confirmQuitText[a1], 0, 0, 0xFF, 0x1020F, 0);
    } else {
        data->textPrinterId = AddTextPrinterParameterized2(&data->window[1], 1, data->confirmQuitText[a1], 0, 0, textFrameDelay, 0x1020F, 0);
    }
    ScheduleWindowCopyToVram(&data->window[1]);
}

static void ov110_021E6A04(AlphPuzzleData *data) {
    FillWindowPixelBuffer(&data->window[2], 0);
    AddTextPrinterParameterized2(&data->window[2], 4, data->hintText[data->puzzleIndex], 0, 0, 0xFF, 0x20100, 0);
    ScheduleWindowCopyToVram(&data->window[2]);
}

void ov110_021E6A44(AlphPuzzleData *data, u8 x, u8 y, int a3) {
    if (a3 == 0) {
        FillBgTilemapRect(data->bgConfig, 2, 0, 4 * x + 4, 4 * y, 4, 4, 0);
    } else {
        CopyToBgTilemapRect(data->bgConfig, 2, 4 * x + 4, y * 4, 4, 4, &data->screenData->rawData, 4 * (a3 - 1), 0, data->screenData->screenWidth / 8, data->screenData->screenHeight / 8);
    }
}

static void ov110_021E6ABC(AlphPuzzleData *data, u8 x, u8 y) {
    if (data->selectedTile->x == data->unk22 && data->selectedTile->y == data->unk23) {
        ov110_021E6A44(data, data->unk22, data->unk23, 2);
    } else {
        ov110_021E6A44(data, data->unk22, data->unk23, 0);
    }
    ScheduleBgTilemapBufferTransfer(data->bgConfig, 2);
    if (x != 0 || y != 0) {
        if (data->selectedTile->x == x && data->selectedTile->y == y) {
            ov110_021E6A44(data, x, y, 3);
        } else {
            ov110_021E6A44(data, x, y, 1);
        }
    }
}

static void ov110_021E6B38(AlphPuzzleData *data) {
    Unk122_021E6900 unkStruct;
    MI_CpuFill8(&unkStruct, 0, sizeof(Unk122_021E6900));
    unkStruct.bgConfig = data->bgConfig;
    unkStruct.unk8 = 31;
    unkStruct.unkC = 6;
    unkStruct.unk4 = 0;
    unkStruct.unk10 = 25;
    unkStruct.unk11 = 10;
    unkStruct.unk12_0 = data->unk4;
    unkStruct.unk12_4 = 1;
    unkStruct.unk13 = 0;
    sub_02016704(data->unk7C, &unkStruct, data->palette);
}

static AlphPuzzleStates ov110_021E6B94(AlphPuzzleData *data) {
    AlphPuzzleStates ret;
    switch (sub_020168F4(data->unk7C)) {
        case 1:
            ret = ALPH_PUZZLE_STATE_FADE_OUT;
            break;
        case 2:
            ret = ALPH_PUZZLE_STATE_WAIT_FOR_INPUT;
            break;
        default:
            return ALPH_PUZZLE_STATE_5;
    }
    data->unk4 = sub_020169C0(data->unk7C);
    sub_020169CC(data->unk7C);
    ClearFrameAndWindow2(&data->window[1], 1);
    FillWindowPixelBuffer(&data->window[1], 0);
    ScheduleWindowCopyToVram(&data->window[1]);
    ScheduleBgTilemapBufferTransfer(data->bgConfig, 0);
    return ret;
}

extern s8 ov110_021E6D94[4][2];

void ov110_021E6BEC(AlphPuzzleTile *tile, s16 x, s16 y) {
    Sprite_SetPositionXY(tile->sprite, ov110_021E6D94[tile->rotation][0] + x, ov110_021E6D94[tile->rotation][1] + y);
}

void ov110_021E6C18(AlphPuzzleData *data, s16 tileIndex, u8 x, u8 y, u8 rotation) {
    AlphPuzzleTile *tile = &data->tileGrid[tileIndex];
    tile->x = x;
    tile->y = y;
    tile->rotation = rotation;
    ov110_021E6BEC(tile, x * 32 + 48, y * 32 + 16);
    sub_02024818(tile->sprite, (rotation % 4u) * 0x4000);
}

static void AlphPuzzle_UpdateSelectedTile(AlphPuzzleData *data, u8 tileIndex, BOOL isSelecting) {
    if (isSelecting) {
        data->unk1B = tileIndex;
        data->selectedTile = &data->tileGrid[data->unk1B];
        Sprite_SetDrawPriority(data->selectedTile->sprite, 0);
        Sprite_AddPositionXY(data->selectedTile->sprite, -2, -2);
        Set2dSpriteVisibleFlag(data->unk8C[1], 1);
        Sprite_SetPositionXY(data->unk8C[1], data->selectedTile->x * 32 + 48, data->selectedTile->y * 32 + 16);
        ov110_021E6904(data, 2);
    } else {
        Sprite_SetDrawPriority(data->selectedTile->sprite, 2);
        ov110_021E6C18(data, data->unk1B, data->selectedTile->x, data->selectedTile->y, data->selectedTile->rotation);
        Set2dSpriteVisibleFlag(data->unk8C[1], 0);
        ov110_021E6904(data, 0);
        data->unk22 = 0;
        data->unk23 = 0;
        data->selectedTile = NULL;
        data->unk1B = 0;
    }
}

typedef struct UnkStruct_021E6D20 {
    AlphPuzzleData *data;
    u32 unk4;
} UnkStruct_021E6D20;

static void ov110_021E6D20(AlphPuzzleData *data) {
    UnkStruct_021E6D20 *unkStruct = AllocFromHeapAtEnd(data->heapId, sizeof(UnkStruct_021E6D20));
    MI_CpuFill8(unkStruct, 0, sizeof(AlphPuzzleTile));
    unkStruct->data = data;
    CreateSysTask(ov110_021E6D54, unkStruct, 0);
    ov110_021E6904(data, 1);
    data->unk1A = 1;
}

static void ov110_021E6D54(SysTask *task, void *_data) {
    UnkStruct_021E6D20 *data = _data;
    if (!sub_02024B68(data->data->unk8C[0])) {
        ov110_021E6904(data->data, 0);
        data->data->unk1A = 0;
        MI_CpuFill8(data, 0, sizeof(UnkStruct_021E6D20));
        FreeToHeap(data);
        DestroySysTask(task);
    }
}
