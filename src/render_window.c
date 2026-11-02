#include "render_window.h"

#include "constants/signpost_type.h"

#include "field/field_sprite_manager.h"
#include "graphic/field_board.naix"
#include "graphic/gs_winframe.naix"

#include "gf_gfx_loader.h"
#include "pokemon.h"
#include "render_text.h"
#include "sprite.h"
#include "sprite_transfer.h"
#include "systask_environment.h"
#include "unk_02013FDC.h"

#define WAIT_DIAL_FRAME_WIDTH_TILES  2
#define WAIT_DIAL_FRAME_HEIGHT_TILES 2
#define WAIT_DIAL_TILES_PER_FRAME    (WAIT_DIAL_FRAME_WIDTH_TILES * WAIT_DIAL_FRAME_HEIGHT_TILES)
#define WAIT_DIAL_FRAME_SIZE         (TILE_SIZE_4BPP * WAIT_DIAL_TILES_PER_FRAME)
#define WAIT_DIAL_FRAME_OFFSET(i)    (WAIT_DIAL_FRAME_SIZE * i)
#define WAIT_DIAL_FRAME_COUNT        8
#define WAIT_DIAL_WHOLE_SIZE         (WAIT_DIAL_FRAME_SIZE * WAIT_DIAL_FRAME_COUNT)

#define POKEMON_PREVIEW_RESOURCE_ID 89301

enum WaitingIconDrawMode {
    DIAL_DRAW_MODE_LOAD_ONLY = 0,
    DIAL_DRAW_MODE_LOAD_AND_DRAW,
    DIAL_DRAW_MODE_CLEAR,
};

enum WaitingIconDeleteMode {
    DIAL_DELETE_MODE_NONE = 0,
    DIAL_DELETE_MODE_CLEAR,
    DIAL_DELETE_MODE_DESTROY,
};

struct WaitingIcon {
    Window *window;
    u8 pixels[WAIT_DIAL_WHOLE_SIZE];
    u8 messageBoxPixels[WAIT_DIAL_FRAME_SIZE];
    u16 messageBoxTile;
    u8 counter;
    u8 curFrame : 7;
    u8 : 1;
    u8 deleteMode : 2;
    u8 : 6;
};

typedef struct PokemonPreview {
    FieldSpriteManager spriteManager;
    ManagedSprite *managedSprite;
    BgConfig *bgConfig;
    u8 bgLayer;
    u8 x;
    u8 y;
    u8 state;
} PokemonPreview;

static void DrawMessageBoxFrame(BgConfig *bgConfig, u8 bgLayer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile);
static void BlitRectToBitmap(void *srcPixels, u16 srcX, u16 srcY, u16 srcWidth, u16 srcHeight, void *destPixels, u16 destWidth, u16 destHeight, u16 destX, u16 destY, u16 blitWidth, u16 blitHeight);
static void DrawMessageBoxScrollCursor(Window *window, int fileId, u16 baseTile, u8 count, u8 x, u8 y);
static void LoadSignpostContentTiles(BgConfig *bgConfig, u8 bgLayer, u16 offset, u8 signpostType, u16 narcMemberIdx, enum HeapID heapID);
static void DrawSignpostFrame(BgConfig *bgConfig, u8 bgLayer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile);
static void DrawSignpostTiles(Window *window, u16 tile, u8 palette);
static void WaitingIcon_Draw(WaitingIcon *waitingIcon, enum WaitingIconDrawMode drawMode);
static void SysTask_TickWaitingIcon(SysTask *sysTask, void *arg);
static void SysTask_CleanupWaitingIcon(SysTask *sysTask, void *arg);
static void SysTask_HandlePokepic(SysTask *sysTask, void *arg);
static PokemonPreview *Pokepic_Create(BgConfig *bgConfig, u8 layer, u8 x, u8 y, enum HeapID heapID);
static void Pokepic_InitObjectResLists(PokemonPreview *preview, enum HeapID heapID);
static void Pokepic_LoadObjectGraphics(PokemonPreview *preview);
static void Pokepic_CreateSprite(PokemonPreview *preview, u8 x, u8 y);
static void Pokepic_LoadAndDrawParameterized(FieldSpriteManager *spriteManager, u16 species, u8 gender);
static void Pokepic_LoadAndDraw(FieldSpriteManager *spriteManager, Pokemon *mon);
static void Pokepic_LoadAndDrawFromTemplate(FieldSpriteManager *spriteManager, PokepicTemplate *tmplate);
static void Pokepic_DrawFrame(PokemonPreview *preview, u8 paletteNum, u16 baseTile);
static void Pokepic_Clear(PokemonPreview *preview);

static const ManagedSpriteTemplate sPokemonPreviewSpriteTemplate = {
    .x = 0,
    .y = 0,
    .z = 0,
    .animation = 0,
    .drawPriority = 0,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
    .resIdList = {
                  POKEMON_PREVIEW_RESOURCE_ID,
                  POKEMON_PREVIEW_RESOURCE_ID,
                  POKEMON_PREVIEW_RESOURCE_ID,
                  POKEMON_PREVIEW_RESOURCE_ID,
                  0,
                  0,
                  },
    .bgPriority = 0,
    .vramTransfer = 0,
};

void LoadStandardWindowTiles(BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 a3, enum HeapID heapID) {
    if (a3 == 0) {
        GfGfxLoader_LoadCharData(NARC_graphic_gs_winframe, NARC_gs_winframe_00000_NCGR, bgConfig, layer, tileStart, 0, FALSE, heapID);
    } else {
        GfGfxLoader_LoadCharData(NARC_graphic_gs_winframe, NARC_gs_winframe_00001_NCGR, bgConfig, layer, tileStart, 0, FALSE, heapID);
    }
}

u32 GetStandardWindowPaletteNARCMember(void) {
    return NARC_gs_winframe_00025_NCLR;
}

void LoadUserFrameGfx1(BgConfig *bg_config, GFBgLayer layer, u16 baseTile, u8 palette_num, u8 frame, enum HeapID heapID) {
    GfGfxLoader_LoadCharData(NARC_graphic_gs_winframe, frame != 0 ? NARC_gs_winframe_00001_NCGR : NARC_gs_winframe_00000_NCGR, bg_config, layer, baseTile, 0, FALSE, heapID);
    int pltt = frame == 2 ? 46 : 25;
    if ((u32)layer < GF_BG_LYR_SUB_0) {
        GfGfxLoader_GXLoadPal(NARC_graphic_gs_winframe, pltt, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)(palette_num * 32), 32, heapID);
    } else {
        GfGfxLoader_GXLoadPal(NARC_graphic_gs_winframe, pltt, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)(palette_num * 32), 32, heapID);
    }
}

static void DrawStandardWindowFrame(BgConfig *bgConfig, u8 layer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile) {
    // clang-format off
    FillBgTilemapRect(bgConfig, layer, tile,     x - 1,     y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, layer, tile + 1, x,         y - 1,      width, 1,      palette);
    FillBgTilemapRect(bgConfig, layer, tile + 2, x + width, y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, layer, tile + 3, x - 1,     y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, layer, tile + 5, x + width, y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, layer, tile + 6, x - 1,     y + height, 1,     1,      palette);
    FillBgTilemapRect(bgConfig, layer, tile + 7, x,         y + height, width, 1,      palette);
    FillBgTilemapRect(bgConfig, layer, tile + 8, x + width, y + height, 1,     1,      palette);
    // clang-format on
}

void DrawFrameAndWindow1(Window *window, BOOL skipTransfer, u16 tile, u8 palette) {
    DrawStandardWindowFrame(window->bgConfig,
        GetWindowBgId(window),
        GetWindowX(window),
        GetWindowY(window),
        GetWindowWidth(window),
        GetWindowHeight(window),
        palette,
        tile);

    if (skipTransfer == FALSE) {
        CopyWindowToVram(window);
    }
}

void ClearWindowPixelBuffer(Window *window, BOOL skipTransfer) {
    FillBgTilemapRect(window->bgConfig,
        GetWindowBgId(window),
        0,
        GetWindowX(window) - 1,
        GetWindowY(window) - 1,
        GetWindowWidth(window) + 2,
        GetWindowHeight(window) + 2,
        0);

    if (skipTransfer == FALSE) {
        ClearWindowTilemapAndCopyToVram(window);
    }
}

u32 GetMessageBoxTilesNARCMember(int frame) {
    return NARC_gs_winframe_00002_NCGR + frame;
}

u32 GetMessageBoxPaletteNARCMember(int frame) {
    return NARC_gs_winframe_00026_NCLR + frame;
}

void LoadUserFrameGfx2(BgConfig *bgConfig, GFBgLayer layer, u16 baseTile, u8 paletteNum, u8 frame, enum HeapID heapID) {
    GfGfxLoader_LoadCharData(NARC_graphic_gs_winframe,
        GetMessageBoxTilesNARCMember(frame),
        bgConfig,
        layer,
        baseTile,
        0,
        FALSE,
        heapID);

    if ((u32)layer < GF_BG_LYR_SUB_0) {
        GfGfxLoader_GXLoadPal(NARC_graphic_gs_winframe,
            GetMessageBoxPaletteNARCMember(frame),
            GF_PAL_LOCATION_MAIN_BG,
            (enum GFPalSlotOffset)(paletteNum * 32),
            32,
            heapID);
    } else {
        GfGfxLoader_GXLoadPal(NARC_graphic_gs_winframe,
            GetMessageBoxPaletteNARCMember(frame),
            GF_PAL_LOCATION_SUB_BG,
            (enum GFPalSlotOffset)(paletteNum * 32),
            32,
            heapID);
    }
}

static void DrawMessageBoxFrame(BgConfig *bgConfig, u8 bgLayer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile) {
    // clang-format off
    FillBgTilemapRect(bgConfig, bgLayer, tile,      x - 2,         y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 1,  x - 1,         y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 2,  x,             y - 1,      width, 1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 3,  x + width,     y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 4,  x + width + 1, y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 5,  x + width + 2, y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 6,  x - 2,         y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 7,  x - 1,         y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 9,  x + width,     y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 10, x + width + 1, y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 11, x + width + 2, y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 12, x - 2,         y + height, 1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 13, x - 1,         y + height, 1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 14, x,             y + height, width, 1,    palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 15, x + width,     y + height, 1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 16, x + width + 1, y + height, 1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 17, x + width + 2, y + height, 1,     1,      palette);
    // clang-format on
}

void Window_DrawMessageBox(Window *window, u32 tile, u32 palette) {
    DrawMessageBoxFrame(window->bgConfig,
        GetWindowBgId(window),
        GetWindowX(window),
        GetWindowY(window),
        GetWindowWidth(window),
        GetWindowHeight(window),
        palette,
        tile);
}

void DrawFrameAndWindow2(Window *window, BOOL skipTransfer, u16 tile, u8 palette) {
    Window_DrawMessageBox(window, tile, palette);

    if (skipTransfer == FALSE) {
        CopyWindowToVram(window);
    }

    TextPrinter_SetDownArrowBaseTile(tile);
}

void ClearFrameAndWindow2(Window *window, BOOL skipTransfer) {
    FillBgTilemapRect(window->bgConfig,
        GetWindowBgId(window),
        0,
        GetWindowX(window) - 2,
        GetWindowY(window) - 1,
        GetWindowWidth(window) + 5,
        GetWindowHeight(window) + 2,
        0);

    if (skipTransfer == FALSE) {
        ClearWindowTilemapAndCopyToVram(window);
    }
}

static void BlitRectToBitmap(void *srcPixels, u16 srcX, u16 srcY, u16 srcWidth, u16 srcHeight, void *destPixels, u16 destWidth, u16 destHeight, u16 destX, u16 destY, u16 blitWidth, u16 blitHeight) {
    Bitmap src, dest;

    src.pixels = (u8 *)srcPixels;
    src.width = srcWidth;
    src.height = srcHeight;

    dest.pixels = (u8 *)destPixels;
    dest.width = destWidth;
    dest.height = destHeight;

    BlitBitmapRect4Bit(&src, &dest, srcX, srcY, destX, destY, blitWidth, blitHeight, 0);
}

#define SCROLL_CURSOR_TILES_PER_FRAME 4
#define SCROLL_CURSOR_TILE_OFFSET(i)  (TILE_SIZE_4BPP * (i))
#define SCROLL_CURSOR_FRAME_SIZE      (SCROLL_CURSOR_TILE_OFFSET(SCROLL_CURSOR_TILES_PER_FRAME))

static void DrawMessageBoxScrollCursor(Window *window, int fileId, u16 baseTile, u8 count, u8 x, u8 y) {
    // must forward-declare these to match
    u8 *cursorTiles;
    void *cursorCharPtr;
    u32 size;

    enum HeapID heapID = BgConfig_GetHeapId(window->bgConfig);
    u8 bgLayer = GetWindowBgId(window);
    size = count * SCROLL_CURSOR_FRAME_SIZE;
    u8 *cursorBlit = Heap_Alloc(heapID, size);
    u8 *bgGfx = BgGetCharPtr(bgLayer);

    NNSG2dCharacterData *cursorCharData;
    cursorCharPtr = GfGfxLoader_GetCharData(NARC_graphic_gs_winframe,
        fileId,
        FALSE,
        &cursorCharData,
        heapID);
    cursorTiles = cursorCharData->pRawData;

    // Copy the window frame tiles into the blit window as a background
    for (u8 i = 0; i < (int)count; i++) {
        u32 frameOffset = i * SCROLL_CURSOR_FRAME_SIZE;

        memcpy(&cursorBlit[frameOffset + SCROLL_CURSOR_TILE_OFFSET(0)], &bgGfx[(baseTile + 10) * TILE_SIZE_4BPP], TILE_SIZE_4BPP);
        memcpy(&cursorBlit[frameOffset + SCROLL_CURSOR_TILE_OFFSET(1)], &bgGfx[(baseTile + 11) * TILE_SIZE_4BPP], TILE_SIZE_4BPP);
        memcpy(&cursorBlit[frameOffset + SCROLL_CURSOR_TILE_OFFSET(2)], &bgGfx[(baseTile + 10) * TILE_SIZE_4BPP], TILE_SIZE_4BPP);
        memcpy(&cursorBlit[frameOffset + SCROLL_CURSOR_TILE_OFFSET(3)], &bgGfx[(baseTile + 11) * TILE_SIZE_4BPP], TILE_SIZE_4BPP);
    }

    u8 width = 16 - x;
    u8 height = (16 - y) * count;

    BlitRectToBitmap(cursorTiles,
        x,
        y,
        width,
        height,
        cursorBlit,
        width,
        height,
        0,
        0,
        width,
        height);

    BG_LoadCharTilesData(window->bgConfig, bgLayer, cursorBlit, size, baseTile + 18);
    Heap_Free(cursorCharPtr);
    Heap_Free(cursorBlit);
}

void Window_DrawMessageBoxScrollCursor(Window *window, u16 baseTile) {
    DrawMessageBoxScrollCursor(window, NARC_gs_winframe_00022_NCGR, baseTile, 3, 3, 0);
}

void ReplaceTransparentTiles(BgConfig *bgConfig, u8 bgLayer, u16 bgBaseTile, u8 withTile, u8 messageBoxFrame, enum HeapID heapID) {
    void *tiles;
    NNSG2dCharacterData *chars;
    u8 *src;
    u32 i;
    u8 srcTop, srcBot;

    tiles = GfGfxLoader_GetCharData(NARC_graphic_gs_winframe,
        GetMessageBoxTilesNARCMember(messageBoxFrame),
        FALSE,
        &chars,
        heapID);
    src = Heap_Alloc(heapID, TILE_SIZE_4BPP * 18);
    memcpy(src, chars->pRawData, TILE_SIZE_4BPP * 18);

    for (i = 0; i < TILE_SIZE_4BPP * 18; i++) {
        srcTop = src[i] >> 4;
        srcBot = src[i] & 0xF;

        if (srcTop == 0) {
            srcTop = withTile;
        }

        if (srcBot == 0) {
            srcBot = withTile;
        }

        src[i] = (srcTop << 4) | srcBot;
    }

    BG_LoadCharTilesData(bgConfig, bgLayer, src, TILE_SIZE_4BPP * 18, bgBaseTile);
    Heap_Free(tiles);
    Heap_Free(src);
}

void LoadMapSignpostFrameAndGraphic(BgConfig *bgConfig, u8 bgLayer, u16 baseTile, u8 palette, u8 signpostType, u16 signpostNARCMemberIdx, enum HeapID heapID) {
    GfGfxLoader_LoadCharData(NARC_graphic_field_board,
        NARC_field_board_00000_NCGR,
        bgConfig,
        (GFBgLayer)bgLayer,
        baseTile,
        30 * TILE_SIZE_4BPP,
        FALSE,
        heapID);

    void *signpostNclr = AllocAndReadWholeNarcMemberByIdPair(NARC_graphic_field_board, NARC_field_board_00001_NCLR, heapID);

    NNSG2dPaletteData *paletteData;
    NNS_G2dGetUnpackedPaletteData(signpostNclr, &paletteData);
    u16 *paletteBuf = paletteData->pRawData;

    BG_LoadPlttData(bgLayer,
        paletteBuf + (signpostType * 16),
        32,
        palette * 32);
    Heap_FreeExplicit(heapID, signpostNclr);

    if (signpostType == SIGNPOST_TYPE_MAP || signpostType == SIGNPOST_TYPE_ARROW) {
        LoadSignpostContentTiles(bgConfig,
            bgLayer,
            baseTile + 30,
            signpostType,
            signpostNARCMemberIdx,
            heapID);
    }
}

static void LoadSignpostContentTiles(BgConfig *bgConfig, u8 bgLayer, u16 offset, u8 signpostType, u16 narcMemberIdx, enum HeapID heapID) {
    if (signpostType == SIGNPOST_TYPE_MAP) {
        narcMemberIdx += NARC_field_board_00033_NCGR;
    } else {
        narcMemberIdx += NARC_field_board_00002_NCGR;
    }

    GfGfxLoader_LoadCharData(NARC_graphic_field_board,
        narcMemberIdx,
        bgConfig,
        (enum GFBgLayer)bgLayer,
        offset,
        24 * TILE_SIZE_4BPP,
        FALSE,
        heapID);
}

static void DrawSignpostFrame(BgConfig *bgConfig, u8 bgLayer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile) {
    // clang-format off
    FillBgTilemapRect(bgConfig, bgLayer, tile,      x - 9,         y - 1,      1,         1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 1,  x - 8,         y - 1,      1,         1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 2,  x - 7,         y - 1,      width + 7, 1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 3,  x + width,     y - 1,      1,         1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 4,  x + width + 1, y - 1,      1,         1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 5,  x + width + 2, y - 1,      1,         1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 6,  x - 9,         y,          1,         height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 7,  x - 8,         y,          1,         height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 8,  x - 1,         y,          1,         height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 9,  x + width,     y,          1,         height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 10, x + width + 1, y,          1,         height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 11, x + width + 2, y,          1,         height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 12, x - 9,         y + height, 1,         1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 13, x - 8,         y + height, 1,         1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 14, x - 7,         y + height, width + 7, 1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 15, x + width,     y + height, 1,         1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 16, x + width + 1, y + height, 1,         1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 17, x + width + 2, y + height, 1,         1,      palette);
    // clang-format on
}

static void DrawSignpostTiles(Window *window, u16 tile, u8 palette) {
    u16 dy, dx; // must forward-declare to match

    u8 bgLayer = GetWindowBgId(window);
    u16 x = GetWindowX(window) - 7;
    u16 y = GetWindowY(window);

    for (dy = 0; dy < 4; dy++) {
        for (dx = 0; dx < 6; dx++) {
            FillBgTilemapRect(window->bgConfig, bgLayer, tile + dy * 6 + dx, x + dx, y + dy, 1, 1, palette);
        }
    }
}

void DrawFrameAndWindow3(Window *window, BOOL skipTransfer, u16 baseTile, u8 palette, u8 signpostType) {
    u8 bgLayer = GetWindowBgId(window);

    if (signpostType == SIGNPOST_TYPE_MAP || signpostType == SIGNPOST_TYPE_ARROW) {
        DrawSignpostFrame(window->bgConfig,
            bgLayer,
            GetWindowX(window),
            GetWindowY(window),
            GetWindowWidth(window),
            GetWindowHeight(window),
            palette,
            baseTile);
        DrawSignpostTiles(window, baseTile + 30, palette);
    } else {
        DrawMessageBoxFrame(window->bgConfig,
            bgLayer,
            GetWindowX(window),
            GetWindowY(window),
            GetWindowWidth(window),
            GetWindowHeight(window),
            palette,
            baseTile);
    }

    if (skipTransfer == FALSE) {
        CopyWindowToVram(window);
    }

    TextPrinter_SetDownArrowBaseTile(baseTile);
}

WaitingIcon *WaitingIcon_New(Window *window, u32 baseTile) {
    WaitingIcon *waitingIcon;
    enum HeapID heapID;
    u8 *bgCharPtr;
    u8 *dialTiles;
    u8 *tmp;
    void *dialTilesRaw;
    u8 bgLayer;
    u8 i;
    NNSG2dCharacterData *dialCharData;

    heapID = BgConfig_GetHeapId(window->bgConfig);
    bgLayer = GetWindowBgId(window);
    bgCharPtr = BgGetCharPtr(bgLayer);
    waitingIcon = Heap_Alloc(heapID, sizeof(WaitingIcon));

    memcpy(waitingIcon->messageBoxPixels, &bgCharPtr[(baseTile + 18) * TILE_SIZE_4BPP], WAIT_DIAL_FRAME_SIZE);

    tmp = Heap_Alloc(heapID, WAIT_DIAL_FRAME_SIZE);

    memcpy(&tmp[TILE_SIZE_4BPP * 0], &bgCharPtr[(baseTile + 10) * TILE_SIZE_4BPP], TILE_SIZE_4BPP);
    memcpy(&tmp[TILE_SIZE_4BPP * 1], &bgCharPtr[(baseTile + 11) * TILE_SIZE_4BPP], TILE_SIZE_4BPP);
    memcpy(&tmp[TILE_SIZE_4BPP * 2], &bgCharPtr[(baseTile + 10) * TILE_SIZE_4BPP], TILE_SIZE_4BPP);
    memcpy(&tmp[TILE_SIZE_4BPP * 3], &bgCharPtr[(baseTile + 11) * TILE_SIZE_4BPP], TILE_SIZE_4BPP);

    for (i = 0; i < WAIT_DIAL_FRAME_COUNT; i++) {
        memcpy(waitingIcon->pixels + WAIT_DIAL_FRAME_OFFSET(i), tmp, WAIT_DIAL_FRAME_SIZE);
    }

    Heap_Free(tmp);

    dialTilesRaw = GfGfxLoader_GetCharData(NARC_graphic_gs_winframe,
        NARC_gs_winframe_00023_NCGR,
        FALSE,
        &dialCharData,
        heapID);
    dialTiles = dialCharData->pRawData;

    BlitRectToBitmap(dialTiles,
        0,
        0,
        WAIT_DIAL_FRAME_WIDTH_TILES * 8,
        (WAIT_DIAL_FRAME_HEIGHT_TILES * 8) * WAIT_DIAL_FRAME_COUNT,
        waitingIcon->pixels,
        WAIT_DIAL_FRAME_WIDTH_TILES * 8,
        (WAIT_DIAL_FRAME_HEIGHT_TILES * 8) * WAIT_DIAL_FRAME_COUNT,
        0,
        0,
        WAIT_DIAL_FRAME_WIDTH_TILES * 8,
        (WAIT_DIAL_FRAME_HEIGHT_TILES * 8) * WAIT_DIAL_FRAME_COUNT);
    Heap_Free(dialTilesRaw);

    waitingIcon->window = window;
    waitingIcon->messageBoxTile = baseTile;
    waitingIcon->counter = 0;
    waitingIcon->curFrame = 0;
    waitingIcon->deleteMode = 0;

    SysTask_CreateOnVBlankQueue(SysTask_TickWaitingIcon, waitingIcon, 0);
    WaitingIcon_Draw(waitingIcon, DIAL_DRAW_MODE_LOAD_AND_DRAW);

    return waitingIcon;
}

static void WaitingIcon_Draw(WaitingIcon *waitingIcon, enum WaitingIconDrawMode drawMode) {
    u8 bgLayer = GetWindowBgId(waitingIcon->window);
    u8 x = GetWindowX(waitingIcon->window);
    u8 y = GetWindowY(waitingIcon->window);
    u8 width = GetWindowWidth(waitingIcon->window);

    if (drawMode == DIAL_DRAW_MODE_CLEAR) {
        BG_LoadCharTilesData(waitingIcon->window->bgConfig, bgLayer, waitingIcon->messageBoxPixels, WAIT_DIAL_FRAME_SIZE, waitingIcon->messageBoxTile + 18);
        FillBgTilemapRect(waitingIcon->window->bgConfig, bgLayer, waitingIcon->messageBoxTile + 10, x + width + 1, y + 2, 1, 1, TILEMAP_FILL_KEEP_PAL);
        FillBgTilemapRect(waitingIcon->window->bgConfig, bgLayer, waitingIcon->messageBoxTile + 11, x + width + 2, y + 2, 1, 1, TILEMAP_FILL_KEEP_PAL);
        FillBgTilemapRect(waitingIcon->window->bgConfig, bgLayer, waitingIcon->messageBoxTile + 10, x + width + 1, y + 3, 1, 1, TILEMAP_FILL_KEEP_PAL);
        FillBgTilemapRect(waitingIcon->window->bgConfig, bgLayer, waitingIcon->messageBoxTile + 11, x + width + 2, y + 3, 1, 1, TILEMAP_FILL_KEEP_PAL);
        BgCommitTilemapBufferToVram(waitingIcon->window->bgConfig, bgLayer);

        return;
    }

    BG_LoadCharTilesData(waitingIcon->window->bgConfig, bgLayer, &waitingIcon->pixels[WAIT_DIAL_FRAME_SIZE * waitingIcon->curFrame], WAIT_DIAL_FRAME_SIZE, waitingIcon->messageBoxTile + 18);

    if (drawMode == DIAL_DRAW_MODE_LOAD_ONLY) {
        return;
    }

    FillBgTilemapRect(waitingIcon->window->bgConfig, bgLayer, waitingIcon->messageBoxTile + 18, x + width + 1, y + 2, 1, 1, TILEMAP_FILL_KEEP_PAL);
    FillBgTilemapRect(waitingIcon->window->bgConfig, bgLayer, waitingIcon->messageBoxTile + 19, x + width + 2, y + 2, 1, 1, TILEMAP_FILL_KEEP_PAL);
    FillBgTilemapRect(waitingIcon->window->bgConfig, bgLayer, waitingIcon->messageBoxTile + 20, x + width + 1, y + 3, 1, 1, TILEMAP_FILL_KEEP_PAL);
    FillBgTilemapRect(waitingIcon->window->bgConfig, bgLayer, waitingIcon->messageBoxTile + 21, x + width + 2, y + 3, 1, 1, TILEMAP_FILL_KEEP_PAL);
    BgCommitTilemapBufferToVram(waitingIcon->window->bgConfig, bgLayer);
}

static void SysTask_TickWaitingIcon(SysTask *sysTask, void *arg) {
    WaitingIcon *waitingIcon = arg;

    if (waitingIcon->deleteMode != DIAL_DELETE_MODE_NONE) {
        if (waitingIcon->deleteMode == DIAL_DELETE_MODE_CLEAR) {
            WaitingIcon_Draw(waitingIcon, DIAL_DRAW_MODE_CLEAR);
        }

        SysTask_Destroy(sysTask);
        return;
    }

    waitingIcon->counter++;

    if (waitingIcon->counter == 16) {
        waitingIcon->counter = 0;
        waitingIcon->curFrame = (waitingIcon->curFrame + 1) & 7;
        WaitingIcon_Draw(waitingIcon, DIAL_DRAW_MODE_LOAD_ONLY);
    }
}

static void SysTask_CleanupWaitingIcon(SysTask *sysTask, void *arg) {
    Heap_Free(arg);
    SysTask_Destroy(sysTask);
}

void WaitingIcon_Destroy(WaitingIcon *waitingIcon) {
    SysTask_CreateOnVWaitQueue(SysTask_CleanupWaitingIcon, waitingIcon, 0);
    waitingIcon->deleteMode = DIAL_DELETE_MODE_CLEAR;
}

void WaitingIcon_Halt(WaitingIcon *waitingIcon) {
    SysTask_CreateOnVWaitQueue(SysTask_CleanupWaitingIcon, waitingIcon, 0);
    waitingIcon->deleteMode = DIAL_DELETE_MODE_DESTROY;
}

u8 *DrawPokemonPicFromSpecies(BgConfig *bgConfig, u8 layer, u8 x, u8 y, u8 paletteNum, u16 baseTile, u16 species, u8 gender, u32 heapID) {
    PokemonPreview *preview = Pokepic_Create(bgConfig, layer, x, y, (enum HeapID)heapID);
    Pokepic_InitObjectResLists(preview, (enum HeapID)heapID);
    Pokepic_LoadObjectGraphics(preview);
    Pokepic_CreateSprite(preview, x, y);
    Pokepic_LoadAndDrawParameterized(&preview->spriteManager, species, gender);
    Pokepic_DrawFrame(preview, paletteNum, baseTile);
    BgCommitTilemapBufferToVram(bgConfig, layer);
    return &preview->state;
}

u8 *DrawPokemonPicFromMon(BgConfig *bgConfig, u8 layer, u8 x, u8 y, u8 paletteNum, u16 baseTile, Pokemon *mon, u32 heapID) {

    PokemonPreview *preview = Pokepic_Create(bgConfig, layer, x, y, (enum HeapID)heapID);
    Pokepic_InitObjectResLists(preview, (enum HeapID)heapID);
    Pokepic_LoadObjectGraphics(preview);
    Pokepic_CreateSprite(preview, x, y);
    Pokepic_LoadAndDraw(&preview->spriteManager, mon);
    Pokepic_DrawFrame(preview, paletteNum, baseTile);
    BgCommitTilemapBufferToVram(bgConfig, layer);
    return &preview->state;
}

static void SysTask_HandlePokepic(SysTask *sysTask, void *arg) {
    PokemonPreview *preview = arg;

    switch (preview->state) {
    case PREVIEW_STATE_REMOVE:
        Pokepic_Clear(preview);
        Sprite_DeleteAndFreeResources(preview->managedSprite);
        FieldSpriteManager_ReleaseWithoutResDat(&preview->spriteManager);
        DestroySysTaskAndEnvironment(sysTask);
        return;

    case PREVIEW_STATE_SET_ANIM:
        preview->state = PREVIEW_STATE_WAIT_ANIM;
        Sprite_SetAnimCtrlSeq(preview->managedSprite->sprite, 1);
        break;

    case PREVIEW_STATE_WAIT_ANIM:
        if (Sprite_GetAnimationFrame(preview->managedSprite->sprite) == 6) {
            preview->state = PREVIEW_STATE_WAIT;
        }
        break;
    }

    Sprite_UpdateAnim(preview->managedSprite->sprite, FX32_ONE);
    SpriteList_RenderAndAnimateSprites(preview->spriteManager.spriteList);
}

static PokemonPreview *Pokepic_Create(BgConfig *bgConfig, u8 layer, u8 x, u8 y, enum HeapID heapID) {
    PokemonPreview *preview = SysTask_GetData(CreateSysTaskAndEnvironment(SysTask_HandlePokepic, sizeof(PokemonPreview), 0, heapID));

    preview->state = 0;
    preview->bgConfig = bgConfig;
    preview->bgLayer = layer;
    preview->x = x;
    preview->y = y;

    return preview;
}

static void Pokepic_InitObjectResLists(PokemonPreview *preview, enum HeapID heapID) {
    SpriteResourceCountsListUnion resIDs = {
        .numChar = 1,
        .numPltt = 1,
        .numCell = 1,
        .numAnim = 1,
    };
    FieldSpriteManager_InitEmptyResLists(&preview->spriteManager, &resIDs, 1, heapID);
}

static void Pokepic_LoadObjectGraphics(PokemonPreview *preview) {
    FieldSpriteManager_AddPlttRes(&preview->spriteManager,
        NARC_graphic_gs_winframe,
        NARC_gs_winframe_00050_NCLR,
        FALSE,
        1,
        NNS_G2D_VRAM_TYPE_2DMAIN,
        POKEMON_PREVIEW_RESOURCE_ID);
    FieldSpriteManager_AddCellRes(&preview->spriteManager,
        NARC_graphic_gs_winframe,
        NARC_gs_winframe_00048_NCER,
        FALSE,
        POKEMON_PREVIEW_RESOURCE_ID);
    FieldSpriteManager_AddAnimRes(&preview->spriteManager,
        NARC_graphic_gs_winframe,
        NARC_gs_winframe_00047_NANR,
        FALSE,
        POKEMON_PREVIEW_RESOURCE_ID);
    FieldSpriteManager_AddCharRes(&preview->spriteManager,
        NARC_graphic_gs_winframe,
        NARC_gs_winframe_00049_NCGR,
        FALSE,
        NNS_G2D_VRAM_TYPE_2DMAIN,
        POKEMON_PREVIEW_RESOURCE_ID);
}

static void Pokepic_CreateSprite(PokemonPreview *preview, u8 x, u8 y) {
    ManagedSpriteTemplate spriteTemplate = sPokemonPreviewSpriteTemplate;
    spriteTemplate.x = (x + 5) * 8;
    spriteTemplate.y = (y + 5) * 8;
    preview->managedSprite = FieldSpriteManager_CreateManagedSprite(&preview->spriteManager, &spriteTemplate);
    SpriteList_RenderAndAnimateSprites(preview->spriteManager.spriteList);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void Pokepic_LoadAndDrawParameterized(FieldSpriteManager *spriteManager, u16 species, u8 gender) {
    struct PokepicManager *mgr = PokepicManager_Create((enum HeapID)spriteManager->heapID);
    PokepicTemplate tmplate;
    GetMonSpriteCharAndPlttNarcIdsEx(&tmplate, species, gender, 2, FALSE, 0, 0);
    Pokepic_LoadAndDrawFromTemplate(spriteManager, &tmplate);
    PokepicManager_Delete(mgr);
}

static void Pokepic_LoadAndDraw(FieldSpriteManager *spriteManager, Pokemon *mon) {
    struct PokepicManager *mgr = PokepicManager_Create((enum HeapID)spriteManager->heapID);
    PokepicTemplate tmplate;
    GetPokemonSpriteCharAndPlttNarcIds(&tmplate, mon, 2);
    Pokepic_LoadAndDrawFromTemplate(spriteManager, &tmplate);
    PokepicManager_Delete(mgr);
}

#define POKEMON_SPRITE_FRAME_WIDTH_TILES  10
#define POKEMON_SPRITE_FRAME_HEIGHT_TILES 10
#define POKEMON_SPRITE_FRAME_SIZE_TILES   (POKEMON_SPRITE_FRAME_WIDTH_TILES * POKEMON_SPRITE_FRAME_HEIGHT_TILES)
#define POKEMON_SPRITE_FRAME_SIZE_BYTES   (TILE_SIZE_4BPP * POKEMON_SPRITE_FRAME_SIZE_TILES)
#define POKEMON_SPRITE_WHOLE_SIZE_BYTES   (POKEMON_SPRITE_FRAME_SIZE_BYTES * 2)

static void Pokepic_LoadAndDrawFromTemplate(FieldSpriteManager *spriteManager, PokepicTemplate *tmplate) {
    u8 *buf;
    u32 offset;
    SpriteResource *charResource, *plttResource;
    NNSG2dImageProxy *imageProxy;
    const NNSG2dImagePaletteProxy *paletteProxy;

    buf = Heap_Alloc((enum HeapID)spriteManager->heapID, POKEMON_SPRITE_WHOLE_SIZE_BYTES);

    // frame 0
    UnkStruct_02014E30 frame0Region = { 0, 0, 10, 10 };
    sub_020143E0((NarcId)tmplate->narcID, tmplate->charDataID, (enum HeapID)spriteManager->heapID, &frame0Region, buf);

    // frame 1
    UnkStruct_02014E30 frame1Region = { 10, 0, 10, 10 };
    sub_020143E0((NarcId)tmplate->narcID, tmplate->charDataID, (enum HeapID)spriteManager->heapID, &frame1Region, buf + POKEMON_SPRITE_FRAME_SIZE_BYTES);

    charResource = SpriteResourceCollection_Find(spriteManager->spriteResManagers[GF_GFX_RES_TYPE_CHAR], POKEMON_PREVIEW_RESOURCE_ID);
    imageProxy = SpriteTransfer_GetCharProxy(charResource);
    offset = NNS_G2dGetImageLocation(imageProxy, NNS_G2D_VRAM_TYPE_2DMAIN);

    DC_FlushRange(buf, POKEMON_SPRITE_WHOLE_SIZE_BYTES);
    GX_LoadOBJ(buf, offset, POKEMON_SPRITE_WHOLE_SIZE_BYTES);

    Heap_Free(buf);

    buf = sub_02014450((NarcId)tmplate->narcID, tmplate->palDataID, (enum HeapID)spriteManager->heapID);
    plttResource = SpriteResourceCollection_Find(spriteManager->spriteResManagers[GF_GFX_RES_TYPE_PLTT], POKEMON_PREVIEW_RESOURCE_ID);
    paletteProxy = SpriteTransfer_GetPaletteProxy(plttResource, imageProxy);
    offset = NNS_G2dGetImagePaletteLocation(paletteProxy, NNS_G2D_VRAM_TYPE_2DMAIN);

    DC_FlushRange(buf, 32);
    GX_LoadOBJPltt(buf, offset, 32);

    Heap_Free(buf);
}

static void Pokepic_DrawFrame(PokemonPreview *preview, u8 palette, u16 tile) {
    FillBgTilemapRect(preview->bgConfig,
        preview->bgLayer,
        tile,
        preview->x - 1,
        preview->y - 1,
        1,
        1,
        palette);
    FillBgTilemapRect(preview->bgConfig,
        preview->bgLayer,
        tile + 1,
        preview->x,
        preview->y - 1,
        POKEMON_SPRITE_FRAME_WIDTH_TILES,
        1,
        palette);
    FillBgTilemapRect(preview->bgConfig,
        preview->bgLayer,
        tile + 2,
        preview->x + POKEMON_SPRITE_FRAME_WIDTH_TILES,
        preview->y - 1,
        1,
        1,
        palette);
    FillBgTilemapRect(preview->bgConfig,
        preview->bgLayer,
        tile + 4,
        preview->x,
        preview->y,
        POKEMON_SPRITE_FRAME_WIDTH_TILES,
        POKEMON_SPRITE_FRAME_HEIGHT_TILES,
        palette);
    FillBgTilemapRect(preview->bgConfig,
        preview->bgLayer,
        tile + 3,
        preview->x - 1,
        preview->y,
        1,
        POKEMON_SPRITE_FRAME_HEIGHT_TILES,
        palette);
    FillBgTilemapRect(preview->bgConfig,
        preview->bgLayer,
        tile + 5,
        preview->x + POKEMON_SPRITE_FRAME_WIDTH_TILES,
        preview->y,
        1,
        POKEMON_SPRITE_FRAME_HEIGHT_TILES,
        palette);
    FillBgTilemapRect(preview->bgConfig,
        preview->bgLayer,
        tile + 6,
        preview->x - 1,
        preview->y + POKEMON_SPRITE_FRAME_HEIGHT_TILES,
        1,
        1,
        palette);
    FillBgTilemapRect(preview->bgConfig,
        preview->bgLayer,
        tile + 7,
        preview->x,
        preview->y + POKEMON_SPRITE_FRAME_HEIGHT_TILES,
        POKEMON_SPRITE_FRAME_WIDTH_TILES,
        1,
        palette);
    FillBgTilemapRect(preview->bgConfig,
        preview->bgLayer,
        tile + 8,
        preview->x + POKEMON_SPRITE_FRAME_WIDTH_TILES,
        preview->y + POKEMON_SPRITE_FRAME_HEIGHT_TILES,
        1,
        1,
        palette);

    ScheduleBgTilemapBufferTransfer(preview->bgConfig, preview->bgLayer);
}

static void Pokepic_Clear(PokemonPreview *preview) {
    FillBgTilemapRect(preview->bgConfig,
        preview->bgLayer,
        0,
        preview->x - 1,
        preview->y - 1,
        POKEMON_SPRITE_FRAME_WIDTH_TILES + 2,
        POKEMON_SPRITE_FRAME_HEIGHT_TILES + 2,
        0);
    ScheduleBgTilemapBufferTransfer(preview->bgConfig, preview->bgLayer);
}
