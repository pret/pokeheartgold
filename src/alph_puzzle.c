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

static int AlphPuzzleMainSeq_FadeIn(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_FadeOut(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_1(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_2(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_3(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_RotateTile(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_5(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_Clear(AlphPuzzleData *data);
static void ov110_021E5BE4(AlphPuzzleData *data);
//static void ov110_021E5C18(AlphPuzzleData *data);
static void ov110_021E5C3C(AlphPuzzleData *data);
static int ov110_021E5CCC(AlphPuzzleData *data);
static s32 ov110_021E5D30(AlphPuzzleData *data, u16 touchX, u16 touchY);
//static int ov110_021E5D90(AlphPuzzleData *data, u8 *xOut, u8 *yOut);
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
static void ov110_021E6580(AlphPuzzleData *data);
static void ov110_021E65DC(AlphPuzzleData *data);
static void ov110_021E6618(AlphPuzzleData *data);
static void ov110_021E6650(AlphPuzzleData *data);
//static void ov110_021E6678(AlphPuzzleData *data);

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
    ALPH_PUZZLE_STATE_ROTATE_TILE,
    ALPH_PUZZLE_STATE_5,
    ALPH_PUZZLE_STATE_CLEAR,
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
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
    sub_0200FBF4(0, 0);
    sub_0200FBF4(1, 0);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
}

void ov110_021E5A74(AlphPuzzleData *data) {
    data->unk4 = sub_020183F0(data->unk10->unk8);
    Options *options = Save_PlayerData_GetOptionsAddr(data->unk10->savedata);
    data->textFrameDelay = Options_GetTextFrameDelay(options);
    data->frame = Options_GetFrame(options);
    data->puzzleIndex = data->unk10->unk5;
}

void ov110_021E5AAC(AlphPuzzleData *data) {
    sub_02018410(data->unk10->unk8, data->unk4);
    if (data->unk27) {
        Save_VarsFlags_SetAlphPuzzleFlag(Save_VarsFlags_Get(data->unk10->savedata), data->puzzleIndex);
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

static int ov110_021E5CCC(AlphPuzzleData *data) {
    if (!System_GetTouchHeld()) {
        data->unkE = 0;
        return ALPH_PUZZLE_STATE_ROTATE_TILE;
    }
    if (data->unkE++ >= 2) {
        data->unkE = 0;
        data->unk1C = (data->selectedTile->x << 5) + 0x40;
        data->unk1E = (data->selectedTile->y << 5) + 0x20;
        data->unk22 = data->selectedTile->x;
        data->unk23 = data->selectedTile->y;
        ov110_021E6A44(data, data->selectedTile->x, data->selectedTile->y, 3);
        return ALPH_PUZZLE_STATE_3;
    }
    return ALPH_PUZZLE_STATE_2;
}

s32 ov110_021E5D30(AlphPuzzleData *data, u16 touchX, u16 touchY) {
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

int ov110_021E5D90(AlphPuzzleData *data, u8 *xOut, u8 *yOut) { 
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
        ov110_021E6C58(data, 0xFF, 0);
        if (ov110_021E68B4(data)) {
            return ALPH_PUZZLE_STATE_CLEAR;
        }
        return ALPH_PUZZLE_STATE_1;
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
    
    sub_0200DD88(data->unk90, x, y);
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
        sub_02024818(data->selectedTile->unk4, (u16)(temp << 0xb) + (data->selectedTile->rotation << 0xe));
        if (data->unkE >= 8) {
            data->unkC++;
        }
        break;
    case 2:
        data->selectedTile->rotation = (data->selectedTile->rotation + 1) % 4;
        
        ov110_021E6C58(data, 0xFF, 0);
        
        data->unkE = 0;
        data->unkC = 0;
        
        if (ov110_021E68B4(data)) {
            return ALPH_PUZZLE_STATE_CLEAR;
        }
        return ALPH_PUZZLE_STATE_1;
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
        int ret = ov110_021E6B94(data);
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
        sub_0200D034();
    }

    NNS_GfdDoVramTransfer();
    DoScheduledBgGpuUpdates(data->bgConfig);

    //This is probably an inline somewhere but I couldn't find it
    u32 *ptr = (u32 *) 0x27E0000;
    ptr[0xFFE] |= 1;
}

typedef struct AlphaPuzzleInitTileData {
    u8 index:5;
    u8 rotation:2;
    u8 isImmovable:1;
} AlphaPuzzleInitTileData;

typedef AlphaPuzzleInitTileData AlphPuzzle[6];

extern AlphPuzzle *dAlphPuzzles[4];

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
                tile->unk4 = 0;
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
    u16 *unkPtr;
    ov110_021E61B0();
    data->bgConfig = BgConfig_Alloc(data->heapId);

    GraphicsModes mode = ov110_021E6DC0;
    
    SetBothScreensModesAndDisable(&mode);

    unkPtr = (u16 *)(0x04000304);
    *unkPtr = *unkPtr & ~(1 << 15);
    
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
    
    u16 *unkPtr = (u16 *)(0x04000304);
    *unkPtr |= (1 << 15);
}

static void ov110_021E6394(AlphPuzzleData *data) {
    NARC *narc = NARC_New(NARC_a_1_7_2, data->heapId);
    data->palette = PaletteData_Init(data->heapId);
    
    PaletteData_AllocBuffers(data->palette, 0, (1 << 8), data->heapId);
    PaletteData_AllocBuffers(data->palette, 1, 256, data->heapId);
    PaletteData_AllocBuffers(data->palette, 2, 256, data->heapId);
    
    sub_02003220(data->palette, narc, 10, data->heapId, 0, (1 << 8), 0, 0);
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

static void ov110_021E6580(AlphPuzzleData *data) {
    FontID_Alloc(4, data->heapId);
    
    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, 2, data->heapId);
    data->messageFormat = MessageFormat_New_Custom(6, 16, data->heapId);
    data->unk30 = String_New(0x80, data->heapId);
    
    data->unk34 = NewString_ReadMsgData(data->msgData, 0);
    
    for (int i = 0; i < 4; i++) {
        data->unk38[i] = NewString_ReadMsgData(data->msgData, i + 1);
    }
    
    data->unk48 = NewString_ReadMsgData(data->msgData, 5);
}

static void ov110_021E65DC(AlphPuzzleData *data) {
    String_Delete(data->unk48);
    for (int i = 0; i < 4; i++) {
        String_Delete(data->unk38[i]);
    }
    String_Delete(data->unk34);
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
extern Unk122_021E92D0 ov110_021E6DB0;

void ov110_021E6678(AlphPuzzleData *data) {
    GF_CreateVramTransferManager(32, data->heapId);
    data->unk84 = sub_0200CF18(data->heapId);
    sub_0200CF70(data->unk84, &ov110_021E6EA4, &ov110_021E6DD0, 3);
    sub_0200B2E0(data->heapId);
    sub_0200B2E8(data->heapId);
    data->unk88 = sub_0200CF38(data->unk84);
    sub_0200CFF4(data->unk84, data->unk88, 18);
    sub_0200D2A4(data->unk84, data->unk88, &ov110_021E6DB0, 2, 1);
}