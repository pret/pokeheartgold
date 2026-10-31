#include "render_window.h"

#include "field/field_sprite_manager.h"

#include "gf_gfx_loader.h"
#include "render_text.h"
#include "sprite.h"

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

void sub_0200E6B4(BgConfig *bgConfig, u8 bgLayer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile);
void sub_0200EA24(void *srcPixels, u16 srcX, u16 srcY, u16 srcWidth, u16 srcHeight, void *destPixels, u16 destWidth, u16 destHeight, u16 destX, u16 destY, u16 blitWidth, u16 blitHeight);
void sub_0200EA68(Window *window, int fileId, u16 baseTile, u8 count, u8 x, u8 y);
void sub_0200EB80(BgConfig *bgConfig, u8 bgLayer, u16 bgBaseTile, u8 withTile, u8 messageBoxFrame, enum HeapID heapID);
void sub_0200EC84(BgConfig *bgConfig, u8 bgLayer, u16 offset, u8 signpostType, u16 narcMemberIdx, enum HeapID heapID);
void sub_0200ECBC(BgConfig *bgConfig, u8 bgLayer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile);
void sub_0200EF84(Window *window, u16 tile, u8 palette);
void sub_0200F1D4(WaitingIcon *waitingIcon, enum WaitingIconDrawMode drawMode);
void sub_0200F3D0(SysTask *sysTask, void *arg);
void sub_0200F43C(SysTask *sysTask, void *arg);
PokemonPreview *sub_0200F5C4(BgConfig *bgConfig, u8 layer, int x, int y, enum HeapID heapID);
void sub_0200F600(PokemonPreview *preview, enum HeapID heapID);
void sub_0200F62C(PokemonPreview *preview);
void sub_0200F684(PokemonPreview *preview, int x, int y);
void sub_0200F6D4(FieldSpriteManager *spriteManager, u16 species, u8 gender);
void sub_0200F714(FieldSpriteManager *spriteManager, Pokemon *mon);
void sub_0200F82C(PokemonPreview *preview, u8 paletteNum, u16 baseTile);

void sub_0200E398(BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 a3, enum HeapID heapID) {
    if (a3 == 0) {
        GfGfxLoader_LoadCharData(NARC_a_0_3_8, 0, bgConfig, layer, tileStart, 0, FALSE, heapID);
    } else {
        GfGfxLoader_LoadCharData(NARC_a_0_3_8, 1, bgConfig, layer, tileStart, 0, FALSE, heapID);
    }
}

u32 sub_0200E3D8(void) {
    return 25;
}

void LoadUserFrameGfx1(BgConfig *bg_config, GFBgLayer layer, u16 baseTile, u8 palette_num, u8 frame, enum HeapID heapID) {
    GfGfxLoader_LoadCharData(NARC_a_0_3_8, frame != 0 ? 1 : 0, bg_config, layer, baseTile, 0, FALSE, heapID);
    int pltt = frame == 2 ? 46 : 25;
    if ((u32)layer < GF_BG_LYR_SUB_0) {
        GfGfxLoader_GXLoadPal(NARC_a_0_3_8, pltt, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)(palette_num * 32), 32, heapID);
    } else {
        GfGfxLoader_GXLoadPal(NARC_a_0_3_8, pltt, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)(palette_num * 32), 32, heapID);
    }
}

static void sub_0200E448(BgConfig *bgConfig, u8 layer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile) {
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
    sub_0200E448(window->bgConfig,
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

u32 sub_0200E63C(int frame) {
    return 2 + frame;
}

u32 sub_0200E640(int frame) {
    return 26 + frame;
}

void LoadUserFrameGfx2(BgConfig *bgConfig, GFBgLayer layer, u16 baseTile, u8 paletteNum, u8 frame, enum HeapID heapID) {
    GfGfxLoader_LoadCharData(NARC_a_0_3_8,
        sub_0200E63C(frame),
        bgConfig,
        layer,
        baseTile,
        0,
        FALSE,
        heapID);

    if ((u32)layer < GF_BG_LYR_SUB_0) {
        GfGfxLoader_GXLoadPal(NARC_a_0_3_8,
            sub_0200E640(frame),
            GF_PAL_LOCATION_MAIN_BG,
            (enum GFPalSlotOffset)(paletteNum * 32),
            32,
            heapID);
    } else {
        GfGfxLoader_GXLoadPal(NARC_a_0_3_8,
            sub_0200E640(frame),
            GF_PAL_LOCATION_SUB_BG,
            (enum GFPalSlotOffset)(paletteNum * 32),
            32,
            heapID);
    }
}

void sub_0200E6B4(BgConfig *bgConfig, u8 bgLayer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile) {
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

void sub_0200E948(Window *window, u32 tile, u32 palette) {
    sub_0200E6B4(window->bgConfig,
        GetWindowBgId(window),
        GetWindowX(window),
        GetWindowY(window),
        GetWindowWidth(window),
        GetWindowHeight(window),
        palette,
        tile);
}

void DrawFrameAndWindow2(Window *window, BOOL skipTransfer, u16 tile, u8 palette) {
    sub_0200E948(window, tile, palette);

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

void sub_0200EA24(void *srcPixels, u16 srcX, u16 srcY, u16 srcWidth, u16 srcHeight, void *destPixels, u16 destWidth, u16 destHeight, u16 destX, u16 destY, u16 blitWidth, u16 blitHeight) {
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

void sub_0200EA68(Window *window, int fileId, u16 baseTile, u8 count, u8 x, u8 y) {
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
    cursorCharPtr = GfGfxLoader_GetCharData(NARC_a_0_3_8,
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

    sub_0200EA24(cursorTiles,
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

void sub_0200EB68(Window *window, u16 baseTile) {
    sub_0200EA68(window, 22, baseTile, 3, 3, 0);
}

void sub_0200EB80(BgConfig *bgConfig, u8 bgLayer, u16 bgBaseTile, u8 withTile, u8 messageBoxFrame, enum HeapID heapID) {
    void *tiles;
    NNSG2dCharacterData *chars;
    u8 *src;
    u32 i;
    u8 srcTop, srcBot;

    tiles = GfGfxLoader_GetCharData(NARC_a_0_3_8,
        sub_0200E63C(messageBoxFrame),
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
    GfGfxLoader_LoadCharData(NARC_a_0_3_6,
        0,
        bgConfig,
        (GFBgLayer)bgLayer,
        baseTile,
        30 * TILE_SIZE_4BPP,
        FALSE,
        heapID);

    void *signpostNclr = AllocAndReadWholeNarcMemberByIdPair(NARC_a_0_3_6, 1, heapID);

    NNSG2dPaletteData *paletteData;
    NNS_G2dGetUnpackedPaletteData(signpostNclr, &paletteData);
    u16 *paletteBuf = paletteData->pRawData;

    BG_LoadPlttData(bgLayer,
        paletteBuf + (signpostType * 16),
        32,
        palette * 32);
    Heap_FreeExplicit(heapID, signpostNclr);

    if (signpostType == 0 || signpostType == 1) {
        sub_0200EC84(bgConfig,
            bgLayer,
            baseTile + 30,
            signpostType,
            signpostNARCMemberIdx,
            heapID);
    }
}

void sub_0200EC84(BgConfig *bgConfig, u8 bgLayer, u16 offset, u8 signpostType, u16 narcMemberIdx, enum HeapID heapID) {
    if (signpostType == 0) {
        narcMemberIdx += 33;
    } else {
        narcMemberIdx += 2;
    }

    GfGfxLoader_LoadCharData(NARC_a_0_3_6,
        narcMemberIdx,
        bgConfig,
        (enum GFBgLayer)bgLayer,
        offset,
        24 * TILE_SIZE_4BPP,
        FALSE,
        heapID);
}

void sub_0200ECBC(BgConfig *bgConfig, u8 bgLayer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile) {
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

void sub_0200EF84(Window *window, u16 tile, u8 palette) {
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

    if (signpostType == 0 || signpostType == 1) {
        sub_0200ECBC(window->bgConfig,
            bgLayer,
            GetWindowX(window),
            GetWindowY(window),
            GetWindowWidth(window),
            GetWindowHeight(window),
            palette,
            baseTile);
        sub_0200EF84(window, baseTile + 30, palette);
    } else {
        sub_0200E6B4(window->bgConfig,
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

    dialTilesRaw = GfGfxLoader_GetCharData(NARC_a_0_3_8,
        23,
        FALSE,
        &dialCharData,
        heapID);
    dialTiles = dialCharData->pRawData;

    sub_0200EA24(dialTiles,
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

    SysTask_CreateOnVBlankQueue(sub_0200F3D0, waitingIcon, 0);
    sub_0200F1D4(waitingIcon, DIAL_DRAW_MODE_LOAD_AND_DRAW);

    return waitingIcon;
}

void sub_0200F1D4(WaitingIcon *waitingIcon, enum WaitingIconDrawMode drawMode) {
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

void sub_0200F3D0(SysTask *sysTask, void *arg) {
    WaitingIcon *waitingIcon = arg;

    if (waitingIcon->deleteMode != DIAL_DELETE_MODE_NONE) {
        if (waitingIcon->deleteMode == DIAL_DELETE_MODE_CLEAR) {
            sub_0200F1D4(waitingIcon, DIAL_DRAW_MODE_CLEAR);
        }

        SysTask_Destroy(sysTask);
        return;
    }

    waitingIcon->counter++;

    if (waitingIcon->counter == 16) {
        waitingIcon->counter = 0;
        waitingIcon->curFrame = (waitingIcon->curFrame + 1) & 7;
        sub_0200F1D4(waitingIcon, DIAL_DRAW_MODE_LOAD_ONLY);
    }
}

void sub_0200F43C(SysTask *sysTask, void *arg) {
    Heap_Free(arg);
    SysTask_Destroy(sysTask);
}

void sub_0200F450(WaitingIcon *waitingIcon) {
    SysTask_CreateOnVWaitQueue(sub_0200F43C, waitingIcon, 0);
    waitingIcon->deleteMode = DIAL_DELETE_MODE_CLEAR;
}

void sub_0200F478(WaitingIcon *waitingIcon) {
    SysTask_CreateOnVWaitQueue(sub_0200F43C, waitingIcon, 0);
    waitingIcon->deleteMode = DIAL_DELETE_MODE_DESTROY;
}

u8 *DrawPokemonPicFromSpecies(BgConfig *bgConfig, u8 layer, u8 x, u8 y, u8 paletteNum, u16 baseTile, u16 species, u8 gender, u32 heapID) {
    PokemonPreview *preview = sub_0200F5C4(bgConfig, layer, x, y, (enum HeapID)heapID);
    sub_0200F600(preview, (enum HeapID)heapID);
    sub_0200F62C(preview);
    sub_0200F684(preview, x, y);
    sub_0200F6D4(&preview->spriteManager, species, gender);
    sub_0200F82C(preview, paletteNum, baseTile);
    BgCommitTilemapBufferToVram(bgConfig, layer);
    return &preview->state;
}

u8 *DrawPokemonPicFromMon(BgConfig *bgConfig, u8 layer, u8 x, u8 y, u8 paletteNum, u16 baseTile, Pokemon *mon, u32 heapID) {

    PokemonPreview *preview = sub_0200F5C4(bgConfig, layer, x, y, (enum HeapID)heapID);
    sub_0200F600(preview, (enum HeapID)heapID);
    sub_0200F62C(preview);
    sub_0200F684(preview, x, y);
    sub_0200F714(&preview->spriteManager, mon);
    sub_0200F82C(preview, paletteNum, baseTile);
    BgCommitTilemapBufferToVram(bgConfig, layer);
    return &preview->state;
}
