#include "application/capsule_menu/capsule_menu.h"
#include "application/capsule_menu/defs.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0011.h"

#include "gf_gfx_loader.h"
#include "obj_char_transfer.h"
#include "pokemon.h"
#include "pokemon_icon_idx.h"
#include "render_window.h"
#include "screen_fade.h"
#include "text.h"
#include "unk_02013534.h"
#include "unk_02014DA0.h"
#include "unk_02026E30.h"

#define CAPSULE_MENU_EDIT           0
#define CAPSULE_MENU_QUIT           1
#define CAPSULE_MENU_SET            2
#define CAPSULE_MENU_REMOVE         3
#define CAPSULE_MENU_SHIFT          4
#define CAPSULE_MON_X_OFFSET        -16
#define CAPSULE_MON_Y_OFFSET        12
#define MESSAGE_BOX_PLTT_OFFSET     15
#define MESSAGE_BOX_TILE_OFFSET     1
#define SEAL_COUNT_TEXT_XOFFSET     7
#define SPRITE_SYSTEM_MAX_SPRITES   128
#define SPRITE_SYSTEM_PLTT_CAPACITY 32
#define STD_WINDOW_PLTT_OFFSET      13
#define STD_WINDOW_TILE_OFFSET      31
#define WINDOW_BGLAYER              (GF_BG_LYR_SUB_2)
#define WINDOW_PALETTE              11

#define CAPSULE_BASE_TILE_1         1 + MESSAGE_WINDOW_TILE_COUNT + SCROLLING_MESSAGE_BOX_TILE_COUNT + STANDARD_WINDOW_TILE_COUNT + 18
#define CAPSULE_BASE_TILE_2         CAPSULE_BASE_TILE_1 + CAPSULE_BASE_TILE_INCREMENT
#define CAPSULE_BASE_TILE_3         CAPSULE_BASE_TILE_2 + CAPSULE_BASE_TILE_INCREMENT
#define CAPSULE_BASE_TILE_4         CAPSULE_BASE_TILE_3 + CAPSULE_BASE_TILE_INCREMENT
#define CAPSULE_BASE_TILE_5         CAPSULE_BASE_TILE_4 + CAPSULE_BASE_TILE_INCREMENT
#define CAPSULE_BASE_TILE_6         CAPSULE_BASE_TILE_5 + CAPSULE_BASE_TILE_INCREMENT
#define CAPSULE_BASE_TILE_7         CAPSULE_BASE_TILE_6 + CAPSULE_BASE_TILE_INCREMENT
#define CAPSULE_BASE_TILE_8         CAPSULE_BASE_TILE_7 + CAPSULE_BASE_TILE_INCREMENT
#define CAPSULE_BASE_TILE_9         CAPSULE_BASE_TILE_8 + CAPSULE_BASE_TILE_INCREMENT
#define CAPSULE_BASE_TILE_INCREMENT (CAPSULE_WINDOW_WIDTH) * CAPSULE_WINDOW_HEIGHT
#define CAPSULE_WINDOW_HEIGHT       2
#define CAPSULE_WINDOW_WIDTH        4

static void ov57_022387E0(CapsuleAppManager *appMan, int index, int x, int y, int palette);
static void CapsuleGraphics_G3DSetupCB(void);
static void CapsuleGraphics_InitWindow_NoPushToVRAM(BgConfig *bgConfig, Window *window, int bgLayer, int left, int top, int width, int height, int baseTile);

// clang-format off
static const int ov57_0223BDF4[] = {
    24, 25, 27,
    40, 41, 43,
    72, 73, 75,
};
// clang-format on

static void CapsuleGraphics_OffsetSprite(TouchscreenHitbox *rect, ManagedSprite *sprite, int xOffset, int yOffset) {
    s16 x, y;

    ManagedSprite_GetPositionXY(sprite, &x, &y);

    rect->rect.top = y - yOffset;
    rect->rect.bottom = y + yOffset;
    rect->rect.left = x - xOffset;
    rect->rect.right = x + xOffset;
}

void CapsuleGraphics_InitUIWindows(CapsuleAppManager *appManager) {
    CapsuleGraphics_InitWindow_NoPushToVRAM(appManager->graphicsMan.bgConfig, &appManager->graphicsMan.windows[0], GF_BG_LYR_MAIN_1, 1, 21, 30, 2, 0x03A);
    CapsuleGraphics_InitWindow_NoPushToVRAM(appManager->graphicsMan.bgConfig, &appManager->graphicsMan.windows[3], GF_BG_LYR_MAIN_1, 1, 21, 20, 2, 0x03A);
    CapsuleGraphics_InitWindow_NoPushToVRAM(appManager->graphicsMan.bgConfig, &appManager->graphicsMan.windows[2], GF_BG_LYR_MAIN_1, 23, 21, 8, 2, 0x076);
}

void CapsuleGraphics_RemoveUIWindows(CapsuleAppManager *appManager) {
    RemoveWindow(&appManager->graphicsMan.windows[0]);
    RemoveWindow(&appManager->graphicsMan.windows[3]);
    RemoveWindow(&appManager->graphicsMan.windows[2]);
}

void ov57_0223866C(CapsuleAppManager *appManager, BOOL show) {
    if (show) {
        MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0011, HEAP_ID_CAPSULE_MENU);
        String *string = NewString_ReadMsgData(msgData, msg_0011_00017);
        FillWindowPixelBuffer(&appManager->graphicsMan.windows[2], 0);
        u32 x = (64 - FontID_String_GetWidth(FONT_UNK_4, string, 0));
        x /= 2;
        AddTextPrinterParameterizedWithColor(&appManager->graphicsMan.windows[2], FONT_UNK_4, string, x, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 15, 0), NULL);
        String_Delete(string);
        DestroyMsgData(msgData);
        ScheduleWindowCopyToVram(&appManager->graphicsMan.windows[2]);
    } else {
        ClearWindowTilemapAndScheduleTransfer(&appManager->graphicsMan.windows[2]);
    }
}

void CapsuleGraphics_InitFontOAMManager(CapsuleAppManager *appMan) {
    appMan->graphicsMan.fontOAMManager = FontSystem_NewInit(2, HEAP_ID_CAPSULE_MENU);
    FontID_Alloc(FONT_SUBSCREEN, HEAP_ID_CAPSULE_MENU);
    FontID_Alloc(FONT_UNK_4, HEAP_ID_CAPSULE_MENU);
}

void CapsuleGraphics_FreeFonts(CapsuleAppManager *appMan) {
    FontID_Release(FONT_UNK_4);
    FontID_Release(FONT_SUBSCREEN);
    FontOAM_Delete(appMan->graphicsMan.fontOAM[0]);
    sub_02021B5C(&appMan->graphicsMan.charTransfer[0]);
    FontOAM_Delete(appMan->graphicsMan.fontOAM[1]);
    sub_02021B5C(&appMan->graphicsMan.charTransfer[1]);
    sub_020135AC(appMan->graphicsMan.fontOAMManager);
}

static void CapsuleGraphics_LoadPaletteBuffer(CapsuleAppManager *appMan) {
    SpriteSystem_LoadPaletteBuffer(appMan->graphicsMan.paletteData, PLTTBUF_SUB_OBJ, appMan->graphicsMan.spriteSystem, appMan->graphicsMan.spriteManager, NARC_graphic_font, 8, FALSE, 1, NNS_G2D_VRAM_TYPE_2DSUB, 30000);
}

void ov57_02238794(CapsuleAppManager *appMan) {
    CapsuleGraphics_LoadPaletteBuffer(appMan);
    ov57_022387E0(appMan, 0, 104, 165, 0);
    ov57_022387E0(appMan, 1, 192, 165, 0);
}

void ov57CapsuleGraphics_SetFontOAMDrawFlag022387C0(CapsuleAppManager *appMan, BOOL flag) {
    TextOBJ_SetSpritesDrawFlag(appMan->graphicsMan.fontOAM[0], flag);
    TextOBJ_SetSpritesDrawFlag(appMan->graphicsMan.fontOAM[1], flag);
}

static void ov57_022387E0(CapsuleAppManager *appMan, int index, int x, int y, int palette) {
    TextOBJTemplate fontOAMManager;
    String *string;
    int unk_448;
    int v3;
    MsgData *messageLoader;
    Window window;

    messageLoader = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0011, HEAP_ID_CAPSULE_MENU);
    string = NewString_ReadMsgData(messageLoader, msg_0011_00005 + index);

    InitWindow(&window);
    AddTextWindowTopLeftCorner(appMan->graphicsMan.bgConfig, &window, 10, 2, 0, 0);
    AddTextPrinterParameterizedWithColor(&window, FONT_SUBSCREEN, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 13, 2), NULL);

    unk_448 = 30000;
    v3 = sub_02013688(&window, NNS_G2D_VRAM_TYPE_2DSUB, HEAP_ID_CAPSULE_MENU);
    sub_02021AC8(v3, 1, NNS_G2D_VRAM_TYPE_2DSUB, &appMan->graphicsMan.charTransfer[index]);

    fontOAMManager.fontSystem = appMan->graphicsMan.fontOAMManager;
    fontOAMManager.window = &window;
    fontOAMManager.spriteList = SpriteManager_GetSpriteList(appMan->graphicsMan.spriteManager);
    fontOAMManager.plttResourceProxy = SpriteManager_FindPlttResourceProxy(appMan->graphicsMan.spriteManager, unk_448);
    fontOAMManager.sprite = NULL;
    fontOAMManager.offset = appMan->graphicsMan.charTransfer[index].offset;
    fontOAMManager.x = x - FontID_String_GetWidth(FONT_SUBSCREEN, string, 0) / 2;
    fontOAMManager.y = y + 192;
    fontOAMManager.unk_20 = 1;
    fontOAMManager.unk_24 = 40;
    fontOAMManager.vram = NNS_G2D_VRAM_TYPE_2DSUB;
    fontOAMManager.heapID = HEAP_ID_CAPSULE_MENU;
    appMan->graphicsMan.fontOAM[index] = sub_020135D8(&fontOAMManager);

    sub_020138E0(appMan->graphicsMan.fontOAM[index], palette);
    String_Delete(string);
    DestroyMsgData(messageLoader);
    RemoveWindow(&window);
}

void CapsuleGraphics_PopulateSealPage(CapsuleAppManager *appMan, int pageCutoff) {
    int i;
    int sealIndex;
    int uniqueSeals;
    int maxSeals;
    BOOL sealOnCapsule;
    int sealCounts;

    sealIndex = 0;
    uniqueSeals = 0;
    maxSeals = pageCutoff;
    maxSeals *= SEALS_PER_PAGE;

    for (i = 0; i < SEALS_PER_PAGE; i++) {
        appMan->sealPages.sealIDs[i] = SEAL_NONE;
    }

    for (i = 0; i < SEAL_MAX + 1; i++) {
        for (int j = 0; j < MAX_CAPSULES; j++) {
            sealOnCapsule = SealIsOnCapsule(appMan->capsules[j].capsule, i);

            if (sealOnCapsule) {
                break;
            }
        }

        sealCounts = appMan->sealCounts[i];

        if (sealCounts != 0 || sealOnCapsule == TRUE) {
            uniqueSeals++;

            if (uniqueSeals <= maxSeals) {
                continue;
            }

            appMan->sealPages.sealIDs[sealIndex] = i + 1;
            sealIndex++;

            if (sealIndex >= SEALS_PER_PAGE) {
                break;
            }
        }
    }
}

void CapsuleGraphics_LoadPageSprites(CapsuleAppManager *appMan) {
    int i;
    int memberIdx;
    SpriteSystem *spriteSystem = appMan->graphicsMan.spriteSystem;
    SpriteManager *spriteManager = appMan->graphicsMan.spriteManager;
    PaletteData *paletteData = appMan->graphicsMan.paletteData;

    for (i = 0; i < SEALS_PER_PAGE; i++) {
        memberIdx = CapsuleMenu_GetSealMemberIdx(appMan->sealPages.sealIDs[i]);
        SpriteSystem_LoadCharResObj(spriteSystem, spriteManager, NARC_a_0_8_7, memberIdx, TRUE, NNS_G2D_VRAM_TYPE_2DSUB, i + 25000);
    }

    SpriteSystem_LoadPaletteBuffer(paletteData, PLTTBUF_SUB_OBJ, spriteSystem, spriteManager, NARC_a_0_8_7, 6, FALSE, 1, NNS_G2D_VRAM_TYPE_2DSUB, 26007);
    SpriteSystem_LoadCellResObj(spriteSystem, spriteManager, NARC_a_0_8_7, 37, TRUE, 27037);
    SpriteSystem_LoadAnimResObj(spriteSystem, spriteManager, NARC_a_0_8_7, 35, TRUE, 28035);
}

void CapsuleGraphics_InitPageSprites(CapsuleAppManager *appMan) {
    int i;
    ManagedSprite **pageSprites;
    ManagedSpriteTemplate spriteTemplate;
    SpriteSystem *spriteSystem = appMan->graphicsMan.spriteSystem;
    SpriteManager *spriteManager = appMan->graphicsMan.spriteManager;
    PaletteData *paletteData = appMan->graphicsMan.paletteData;
    pageSprites = appMan->pageSprites;

    spriteTemplate.x = 0;
    spriteTemplate.y = 0;
    spriteTemplate.z = 0;
    spriteTemplate.animation = 0;
    spriteTemplate.drawPriority = 60;
    spriteTemplate.vram = NNS_G2D_VRAM_TYPE_2DSUB;
    spriteTemplate.bgPriority = 1;
    spriteTemplate.vramTransfer = FALSE;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_MCEL] = -1;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_MANM] = -1;
    spriteTemplate.pal = 0;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_PLTT] = 26007;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_CELL] = 27037;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_ANIM] = 28035;

    for (i = 0; i < SEALS_PER_PAGE; i++) {
        spriteTemplate.resIdList[0] = (i + 25000);
        pageSprites[i] = SpriteSystem_NewSprite(spriteSystem, spriteManager, &spriteTemplate);
    }

    s16 initialXY[8][2] = {
        { 19, 23 },
        { 75, 23 },
        { 19, 47 },
        { 75, 47 },
        { 19, 71 },
        { 75, 71 },
        { 19, 95 },
        { 75, 95 },
    };

    for (i = 0; i < SEALS_PER_PAGE; i++) {
        ManagedSprite_SetPositionXY(appMan->pageSprites[i], initialXY[i][0], initialXY[i][1] - 1);
        ManagedSprite_TickFrame(appMan->pageSprites[i]);
        ManagedSprite_SetAnimationFrame(appMan->pageSprites[i], 0);
    }
}

void CapsuleGraphics_FreePageSprites(CapsuleAppManager *appMan) {
    for (int i = 0; i < SEALS_PER_PAGE; i++) {
        SpriteManager_UnloadCharObjById(appMan->graphicsMan.spriteManager, i + 25000);
        Sprite_DeleteAndFreeResources(appMan->pageSprites[i]);
    }
}

void ov57_02238AF0(CapsuleAppManager *appMan, s16 a1) {
    s16 dx = 56 * a1;
    s16 dy = -16 * a1;
    for (int i = 0; i < SEALS_PER_PAGE; ++i) {
        if (appMan->sealRenderInfo[i].shouldRender) {
            ManagedSprite_OffsetPositionXY(appMan->sealRenderInfo[i].sprite, dx, dy);
        }
    }
}

GF3DVramMan *CapsuleGraphics_PipelineInit(void) {
    return GF_3DVramMan_Create(HEAP_ID_CAPSULE_MENU, 0, 2, 0, 2, CapsuleGraphics_G3DSetupCB);
}

static void CapsuleGraphics_G3DSetupCB(void) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);

    G2_SetBG0Priority(1);
    G3X_SetShading(GX_SHADING_TOON);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_EdgeMarking(FALSE);
    G3X_SetFog(FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
    G3X_SetClearColor(GX_RGB(0, 0, 0), 0, 0x7FFF, 63, 0);
    G3_ViewPort(0, 0, 255, 191);
}

void CapsuleGraphics_AllocTexPlttVram(void) {
    NNSGfdTexKey texKey;
    NNSGfdPlttKey plttKey;
    u32 texKeyAddr, plttKeyAddr;

    texKey = NNS_GfdAllocTexVram(0x8000, FALSE, 0);
    plttKey = NNS_GfdAllocPlttVram(0x80, FALSE, 0);

    GF_ASSERT(texKey != NNS_GFD_ALLOC_ERROR_TEXKEY);
    GF_ASSERT(plttKey != NNS_GFD_ALLOC_ERROR_PLTTKEY);

    texKeyAddr = NNS_GfdGetTexKeyAddr(texKey);
    plttKeyAddr = NNS_GfdGetPlttKeyAddr(plttKey);

    sub_02014DA0();
}

void CapsuleGraphics_SwapBuffers(void) {
    int result;

    Thunk_G3X_Reset();

    result = sub_0201543C();

    if (result > 0) {
        Thunk_G3X_Reset();
        NNS_G2dSetupSoftwareSpriteCamera();
    }

    sub_02015460();
    RequestSwap3DBuffers(GX_SORTMODE_MANUAL, GX_BUFFERMODE_Z);
}

void CapsuleGraphics_OpenCapsuleSelectionMenu(BgConfig *bgConfig, Window *window, int bgLayer, CapsuleAppManager *appMan, int capsuleIndex) {
    TouchscreenListMenuHeader menuTemplate;
    int field;
    int tilemapLeft, tilemapTop, width, height, baseTile, ySize;
    int stringIDs[4];

    field = CapsuleManager_CapsuleSelectionField(appMan, capsuleIndex);
    baseTile = ((9 * 8) + ((27 * 2) + (0 + ((1 + (18 + 12)) + 9))));
    tilemapLeft = 21;
    width = 9;

    switch (field) {
    case CAPSULE_MENU_EMPTY_CAPSULE:
        tilemapTop = (15 - 2);
        height = 6;
        stringIDs[0] = CAPSULE_MENU_EDIT;
        stringIDs[1] = CAPSULE_MENU_SHIFT;
        stringIDs[2] = CAPSULE_MENU_QUIT;
        break;
    case CAPSULE_MENU_HAS_SEALS:
        tilemapTop = 11;
        height = 8;
        stringIDs[0] = CAPSULE_MENU_SET;
        stringIDs[1] = CAPSULE_MENU_EDIT;
        stringIDs[2] = CAPSULE_MENU_SHIFT;
        stringIDs[3] = CAPSULE_MENU_QUIT;
        break;
    case CAPSULE_MENU_HAS_POKEMON:
        tilemapTop = 11;
        height = 8;
        stringIDs[0] = CAPSULE_MENU_REMOVE;
        stringIDs[1] = CAPSULE_MENU_EDIT;
        stringIDs[2] = CAPSULE_MENU_SHIFT;
        stringIDs[3] = CAPSULE_MENU_QUIT;
        break;
    case CAPSULE_MENU_UNREACHABLE_CASE:
        tilemapTop = 11;
        height = 8;
        stringIDs[0] = CAPSULE_MENU_SET;
        stringIDs[1] = CAPSULE_MENU_EDIT;
        stringIDs[2] = CAPSULE_MENU_SHIFT;
        stringIDs[3] = CAPSULE_MENU_QUIT;
        break;
    }

    ySize = (height / 2);

    appMan->graphicsMan.listMenuItems = ListMenuItems_New(ySize, HEAP_ID_CAPSULE_MENU);

    String *string;
    MsgData *messageLoader = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0011, HEAP_ID_CAPSULE_MENU);

    for (int i = 0; i < ySize; i++) {
        string = NewString_ReadMsgData(messageLoader, gSealListMenuEntries[stringIDs[i]].index);

        ListMenuItems_AddItem(appMan->graphicsMan.listMenuItems, string, (int)gSealListMenuEntries[stringIDs[i]].func);
        String_Delete(string);
    }

    DestroyMsgData(messageLoader);

    MI_CpuClear8(&menuTemplate, sizeof(TouchscreenListMenuHeader));
    menuTemplate.template = (TouchscreenListMenuTemplate) {
        .wrapAround = TRUE,
        .centered = TRUE,
        .xOffset = 0,
        .bgId = GF_BG_LYR_MAIN_1,
        .plttOffset = 11,
        .unk4 = 0,
        .unk5 = 0,
        .baseTile = 0x086,
        .charOffset = 0x001F,
        .unkA = 0x005A,
    };
    menuTemplate.listMenuItems = appMan->graphicsMan.listMenuItems;
    menuTemplate.bgConfig = bgConfig;
    menuTemplate.numWindows = ySize;
    appMan->graphicsMan.touchScreenListMenu = TouchscreenListMenu_Create(appMan->graphicsMan.touchscreenListMenuSpawner, &menuTemplate, appMan->menuInputState, 22, 23 - ySize * 3, 8, 0);
}

void ov57_02238D80(CapsuleAppManager *appMan) {
    appMan->menuInputState = appMan->graphicsMan.touchScreenListMenu->isTouch;
    TouchscreenListMenu_Destroy(appMan->graphicsMan.touchScreenListMenu);
    ListMenuItems_Delete(appMan->graphicsMan.listMenuItems);
}

void CapsuleGraphics_GetCapsuleGridLocation(int index, s16 *x, s16 *y) {
    int tile = (index % 4);
    *x = 32 + 8 + (tile * 56);
    tile = (index >> 2);
    *y = 27 + (tile * 53);
}

void CapsuleGraphics_LoadPokemonIcons(CapsuleAppManager *appMan) {
    SpriteSystem *spriteSystem = appMan->graphicsMan.spriteSystem;
    SpriteManager *spriteManager = appMan->graphicsMan.spriteManager;
    PaletteData *paletteData = appMan->graphicsMan.paletteData;

    SpriteSystem_LoadPaletteBuffer(paletteData, 2, spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, sub_02074490(), 0, 3, NNS_G2D_VRAM_TYPE_2DMAIN, 16000);

    int iconIndex = sub_0207449C();
    SpriteSystem_LoadCellResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, iconIndex, 0, 17000);

    iconIndex = sub_020744A8();
    SpriteSystem_LoadAnimResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, iconIndex, 0, 18000);
}

void CapsuleGraphics_InitPokemonIcons(CapsuleAppManager *appMan) {
    int isEgg;
    int species;
    u8 paletteIndex;
    int form;
    Pokemon *pokemon;
    ManagedSpriteTemplate spriteTemplate;

    for (int i = 0; i < appMan->appData->partyCount; i++) {
        pokemon = appMan->appData->mons[i];

        SpriteSystem_LoadCharResObjAtEndWithHardwareMappingType(appMan->graphicsMan.spriteSystem, appMan->graphicsMan.spriteManager, NARC_poketool_icongra_poke_icon, Pokemon_GetIconNaix(pokemon), FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, i + 15000);

        spriteTemplate.x = 0;
        spriteTemplate.y = 0;
        spriteTemplate.z = 0;
        spriteTemplate.animation = 0;
        spriteTemplate.drawPriority = 10;
        spriteTemplate.pal = 0;
        spriteTemplate.vram = NNS_G2D_VRAM_TYPE_2DMAIN;
        spriteTemplate.bgPriority = 2;
        spriteTemplate.vramTransfer = FALSE;
        spriteTemplate.resIdList[GF_GFX_RES_TYPE_CHAR] = i + 15000;
        spriteTemplate.resIdList[GF_GFX_RES_TYPE_PLTT] = 16000;
        spriteTemplate.resIdList[GF_GFX_RES_TYPE_CELL] = 17000;
        spriteTemplate.resIdList[GF_GFX_RES_TYPE_ANIM] = 18000;
        spriteTemplate.resIdList[GF_GFX_RES_TYPE_MCEL] = -1;
        spriteTemplate.resIdList[GF_GFX_RES_TYPE_MANM] = -1;

        appMan->pokemonSprites[i] = SpriteSystem_NewSprite(appMan->graphicsMan.spriteSystem, appMan->graphicsMan.spriteManager, &spriteTemplate);

        species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        isEgg = GetMonData(pokemon, MON_DATA_IS_EGG, NULL);
        form = GetMonData(pokemon, MON_DATA_FORM, NULL);
        paletteIndex = GetMonIconPaletteEx(species, form, isEgg);

        Sprite_SetPalOffsetRespectVramOffset(appMan->pokemonSprites[i]->sprite, paletteIndex);
        ManagedSprite_SetAnim(appMan->pokemonSprites[i], 1);
    }
}

void CapsuleGraphics_SetPokemonSpritesPosition(CapsuleAppManager *appMan) {
    int i;
    int index;
    s16 x, y;

    for (i = 0; i < appMan->appData->partyCount; i++) {
        ManagedSprite_SetDrawFlag(appMan->pokemonSprites[i], 0);
    }

    for (i = 0; i < MAX_CAPSULES; i++) {
        index = appMan->capsules[i].partyIdx;

        if (index != 0xFF) {
            CapsuleGraphics_GetCapsuleGridLocation(i, &x, &y);
            ManagedSprite_SetPositionXY(appMan->pokemonSprites[index], x + CAPSULE_MON_X_OFFSET, y + CAPSULE_MON_Y_OFFSET);
            ManagedSprite_SetDrawFlag(appMan->pokemonSprites[index], 1);
        }
    }
}

void CapsuleGraphics_TickPokemonSprites(CapsuleAppManager *appMan) {
    for (int i = 0; i < appMan->appData->partyCount; i++) {
        ManagedSprite_TickFrame(appMan->pokemonSprites[i]);
    }
}

void CapsuleGraphics_FreePokemonSprites(CapsuleAppManager *appMan) {
    for (int i = 0; i < appMan->appData->partyCount; i++) {
        Sprite_DeleteAndFreeResources(appMan->pokemonSprites[i]);
    }
}

void CapsuleGraphics_AssignCapsules(CapsuleAppManager *appMan) {
    int dummy = 0;
    BallCapsule *capsule;

    for (int i = 0; i < MAX_CAPSULES; i++) {
        capsule = appMan->capsules[i].capsule;
        appMan->capsuleSprites[i].animIdx = CapsuleManager_AnySealsOnCapsule(capsule);
        appMan->capsuleSprites[i].pokemonIndex = appMan->capsules[i].partyIdx;

        if ((appMan->capsuleSprites[i].animIdx == 0) && (appMan->capsuleSprites[i].pokemonIndex != 0xFF)) {
            CapsuleManager_AssignCapsuleMon(appMan, i);
        }
    }
}

void CapsuleGraphics_InitSpriteManager(CapsuleGraphicsManager *unk_0D4) {
    unk_0D4->spriteSystem = SpriteSystem_Alloc(HEAP_ID_CAPSULE_MENU);
    const OamManagerParam renderOAMTemplate = {
        0,
        128,
        0,
        32,
        0,
        128,
        0,
        32,
    };
    const OamCharTransferParam transferTemplate = {
        48 + 48, 1024 * 0x40, 512 * 0x20, GX_OBJVRAMMODE_CHAR_1D_64K, GX_OBJVRAMMODE_CHAR_1D_32K
    };

    SpriteSystem_Init(unk_0D4->spriteSystem, &renderOAMTemplate, &transferTemplate, SPRITE_SYSTEM_PLTT_CAPACITY);

    BOOL result;
    const SpriteResourceCountsListUnion spriteResourceCapacities = {
        .numChar = 48 + 48,
        .numPltt = 16 + 16,
        .numCell = 64,
        .numAnim = 64,
        .numMcel = 16,
        .numManm = 16,
    };

    unk_0D4->spriteManager = SpriteManager_New(unk_0D4->spriteSystem);
    result = SpriteSystem_InitSprites(unk_0D4->spriteSystem, unk_0D4->spriteManager, 128);
    GF_ASSERT(result);

    result = SpriteSystem_InitManagerWithCapacities(unk_0D4->spriteSystem, unk_0D4->spriteManager, &spriteResourceCapacities);
    GF_ASSERT(result);

    unk_0D4->touchscreenListMenuSpawner = TouchscreenListMenuSpawner_Create(HEAP_ID_CAPSULE_MENU, unk_0D4->paletteData);
}

void CapsuleGraphics_FreeSpriteSystem(CapsuleGraphicsManager *unk_0D4) {
    TouchscreenListMenuSpawner_Destroy(unk_0D4->touchscreenListMenuSpawner);
    SpriteSystem_FreeResourcesAndManager(unk_0D4->spriteSystem, unk_0D4->spriteManager);
    SpriteSystem_Free(unk_0D4->spriteSystem);
}

void CapsuleGraphics_LoadSelectionResources(CapsuleAppManager *appMan, NARC *narc) {
    SpriteSystem_LoadCharResObjFromOpenNarc(appMan->graphicsMan.spriteSystem, appMan->graphicsMan.spriteManager, narc, 14, TRUE, NNS_G2D_VRAM_TYPE_2DSUB, 45000);
    SpriteSystem_LoadCellResObjFromOpenNarc(appMan->graphicsMan.spriteSystem, appMan->graphicsMan.spriteManager, narc, 16, TRUE, 47000);
    SpriteSystem_LoadAnimResObjFromOpenNarc(appMan->graphicsMan.spriteSystem, appMan->graphicsMan.spriteManager, narc, 15, TRUE, 48000);
}

void CapsuleGraphics_InitSelectionIndicator(CapsuleAppManager *appMan) {
    ManagedSpriteTemplate spriteTemplate;
    int startingStates[4][3] = {
        { 136, 16,  1 },
        { 136, 128, 3 },
        { 240, 16,  0 },
        { 240, 128, 2 },
    };

    for (int i = 0; i < CAPSULE_SELECTION_ARROWS; i++) {
        spriteTemplate.x = startingStates[i][0];
        spriteTemplate.y = startingStates[i][1];
        spriteTemplate.z = 0;
        spriteTemplate.animation = 0;
        spriteTemplate.drawPriority = 40;
        spriteTemplate.pal = 2;
        spriteTemplate.vram = NNS_G2D_VRAM_TYPE_2DSUB;
        spriteTemplate.bgPriority = 1;
        spriteTemplate.vramTransfer = FALSE;
        spriteTemplate.resIdList[0] = 45000;
        spriteTemplate.resIdList[1] = 26004;
        spriteTemplate.resIdList[2] = 47000;
        spriteTemplate.resIdList[3] = 48000;
        spriteTemplate.resIdList[4] = -1;
        spriteTemplate.resIdList[5] = -1;
        appMan->selectionIndicator[i] = SpriteSystem_NewSprite(appMan->graphicsMan.spriteSystem, appMan->graphicsMan.spriteManager, &spriteTemplate);

        ManagedSprite_SetFlipMode(appMan->selectionIndicator[i], startingStates[i][2]);
    }
}

void CapsuleGraphics_TickSelectionIndicator(CapsuleAppManager *appMan) {
    if (appMan->graphicsMan.selectedCapsule == 0) {
        return;
    }

    for (int i = 0; i < CAPSULE_SELECTION_ARROWS; i++) {
        ManagedSprite_TickFrame(appMan->selectionIndicator[i]);
    }
}

void CapsuleGraphics_SetSelectionIndicatorDrawFlags(CapsuleAppManager *appMan, int flag) {
    for (int i = 0; i < CAPSULE_SELECTION_ARROWS; i++) {
        ManagedSprite_SetDrawFlag(appMan->selectionIndicator[i], flag);
    }
}

void CapsuleGraphics_FreeSelectionIndicator(CapsuleAppManager *appMan) {
    for (int i = 0; i < CAPSULE_SELECTION_ARROWS; i++) {
        Sprite_DeleteAndFreeResources(appMan->selectionIndicator[i]);
    }
}

static void CapsuleGraphics_LoadCapsuleSprites(SpriteSystem *spriteSystem, SpriteManager *spriteManager, PaletteData *paletteData, int charFileId, int plttFileId, int cellFileId, int animFileId, int vramType, int bufferId, int paletteIdx, NARC *narc) {
    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, charFileId, TRUE, vramType, charFileId + 11000);
    SpriteSystem_LoadPaletteBufferFromOpenNarc(paletteData, bufferId, spriteSystem, spriteManager, narc, plttFileId, FALSE, paletteIdx, vramType, plttFileId + 11000);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, cellFileId, TRUE, cellFileId + 11000);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, animFileId, TRUE, animFileId + 11000);
}

void CapsuleGraphics_InitCapsuleSprites(CapsuleAppManager *appMan, NARC *narc) {
    CapsuleGraphics_LoadCapsuleSprites(appMan->graphicsMan.spriteSystem, appMan->graphicsMan.spriteManager, appMan->graphicsMan.paletteData, 17, 3, 19, 18, NNS_G2D_VRAM_TYPE_2DMAIN, 2, 1, narc);
    CapsuleGraphics_LoadCapsuleSprites(appMan->graphicsMan.spriteSystem, appMan->graphicsMan.spriteManager, appMan->graphicsMan.paletteData, 32, 5, 34, 33, NNS_G2D_VRAM_TYPE_2DMAIN, 2, 1, narc);
    ManagedSpriteTemplate spriteTemplate;

    for (int i = 0; i < MAX_CAPSULES; i++) {
        spriteTemplate.x = 0;
        spriteTemplate.y = 0;
        spriteTemplate.z = 0;
        spriteTemplate.animation = appMan->capsuleSprites[i].animIdx;
        spriteTemplate.drawPriority = 40 - i;
        spriteTemplate.pal = 0;
        spriteTemplate.vram = NNS_G2D_VRAM_TYPE_2DMAIN;
        spriteTemplate.bgPriority = 2;
        spriteTemplate.vramTransfer = FALSE;
        spriteTemplate.resIdList[0] = 11017;
        spriteTemplate.resIdList[1] = 11003;
        spriteTemplate.resIdList[2] = 11019;
        spriteTemplate.resIdList[3] = 11018;
        spriteTemplate.resIdList[4] = -1;
        spriteTemplate.resIdList[5] = -1;

        appMan->capsuleSprites[i].sprite = SpriteSystem_NewSprite(appMan->graphicsMan.spriteSystem, appMan->graphicsMan.spriteManager, &spriteTemplate);
        s16 x, y;

        CapsuleGraphics_GetCapsuleGridLocation(i, &x, &y);
        ManagedSprite_SetPositionXY(appMan->capsuleSprites[i].sprite, x, y);
    }

    spriteTemplate.x = 0;
    spriteTemplate.y = 0;
    spriteTemplate.z = 0;
    spriteTemplate.animation = 0;
    spriteTemplate.drawPriority = 20;
    spriteTemplate.pal = 0;
    spriteTemplate.vram = NNS_G2D_VRAM_TYPE_2DMAIN;
    spriteTemplate.bgPriority = 2;
    spriteTemplate.vramTransfer = FALSE;
    spriteTemplate.resIdList[0] = 11032;
    spriteTemplate.resIdList[1] = 11005;
    spriteTemplate.resIdList[2] = 11034;
    spriteTemplate.resIdList[3] = 11033;
    spriteTemplate.resIdList[4] = -1;
    spriteTemplate.resIdList[5] = -1;

    appMan->cursor[0] = SpriteSystem_NewSprite(appMan->graphicsMan.spriteSystem, appMan->graphicsMan.spriteManager, &spriteTemplate);
    appMan->cursor[1] = SpriteSystem_NewSprite(appMan->graphicsMan.spriteSystem, appMan->graphicsMan.spriteManager, &spriteTemplate);

    s16 x, y;

    CapsuleGraphics_GetCapsuleGridLocation(appMan->capsuleIndex[0], &x, &y);
    ManagedSprite_SetPositionXY(appMan->cursor[0], x, y);
    ManagedSprite_SetPositionXY(appMan->cursor[1], x, y);
    ManagedSprite_SetDrawPriority(appMan->cursor[1], 25);
    ManagedSprite_SetAnim(appMan->cursor[0], 0);
    ManagedSprite_SetAnim(appMan->cursor[1], 0);
}

void CapsuleGraphics_SetCapsuleSpriteAnim(CapsuleAppManager *appMan) {
    CapsuleGraphics_AssignCapsules(appMan);
    CapsuleGraphics_SetPokemonSpritesPosition(appMan);

    for (int i = 0; i < MAX_CAPSULES; i++) {
        if (appMan->capsuleSprites[i].sprite == NULL) {
            continue;
        }

        ManagedSprite_SetAnim(appMan->capsuleSprites[i].sprite, appMan->capsuleSprites[i].animIdx);
    }
}

void CapsuleGraphics_SwapCapsules(CapsuleAppManager *appMan, int capsuleIdx1, int capsuleIdx2) {
    int tmp;
    int index1;
    int index2;
    int capsuleID1;
    int capsuleID2;
    BallCapsule tmpCapsule;

    index1 = appMan->capsules[capsuleIdx1].partyIdx;
    index2 = appMan->capsules[capsuleIdx2].partyIdx;

    if (index1 != 0xFF) {
        capsuleID1 = capsuleIdx2 + 1;
        SetMonData(appMan->appData->mons[index1], MON_DATA_BALL_CAPSULE_ID, (u8 *)&capsuleID1);
    }

    if (index2 != 0xFF) {
        capsuleID2 = capsuleIdx1 + 1;
        SetMonData(appMan->appData->mons[index2], MON_DATA_BALL_CAPSULE_ID, (u8 *)&capsuleID2);
    }

    tmp = appMan->capsules[capsuleIdx1].partyIdx;
    appMan->capsules[capsuleIdx1].partyIdx = appMan->capsules[capsuleIdx2].partyIdx;
    appMan->capsules[capsuleIdx2].partyIdx = tmp;

    CopyCapsule(appMan->capsules[capsuleIdx1].capsule, &tmpCapsule);
    CopyCapsule(appMan->capsules[capsuleIdx2].capsule, appMan->capsules[capsuleIdx1].capsule);
    CopyCapsule(&tmpCapsule, appMan->capsules[capsuleIdx2].capsule);
    CapsuleGraphics_SetCapsuleSpriteAnim(appMan);
}

void CapsuleGraphics_TickCursor(CapsuleAppManager *appMan) {
    for (int i = 0; i < MAX_CAPSULES; i++) {
        ManagedSprite_TickFrame(appMan->capsuleSprites[i].sprite);
    }

    ManagedSprite_TickFrame(appMan->cursor[0]);
    ManagedSprite_TickFrame(appMan->cursor[1]);
}

void CapsuleGraphics_FreeCapsuleSprites(CapsuleAppManager *appMan) {
    for (int i = 0; i < MAX_CAPSULES; i++) {
        Sprite_DeleteAndFreeResources(appMan->capsuleSprites[i].sprite);
    }

    Sprite_DeleteAndFreeResources(appMan->cursor[0]);
    Sprite_DeleteAndFreeResources(appMan->cursor[1]);
}

void CapsuleGraphics_LoadMainWindow(BgConfig *bgConfig, PaletteData *paletteData, int messageBoxFrame) {
    {
        NNSG2dCharacterData *sp18;
        void *sp14 = GfGfxLoader_GetCharData(NARC_a_0_8_7, 8, TRUE, &sp18, HEAP_ID_CAPSULE_MENU);
        u8 *r7 = sp18->pRawData;
        DC_FlushRange(r7, sp18->szByte);
        for (int i = 0; i < NELEMS(ov57_0223BDF4); ++i) {
            BG_LoadCharTilesData(bgConfig, GF_BG_LYR_MAIN_1, r7 + 32 * ov57_0223BDF4[i], 0x20, i + 1);
        }
        Heap_Free(sp14);
    }
    PaletteData_LoadFromNarc(paletteData, NARC_a_0_8_7, 2, HEAP_ID_CAPSULE_MENU, PLTTBUF_MAIN_BG, 0x20, 0xC0, 0x20);
    LoadUserFrameGfx1(bgConfig, GF_BG_LYR_MAIN_1, STD_WINDOW_TILE_OFFSET, STD_WINDOW_PLTT_OFFSET, 0, HEAP_ID_CAPSULE_MENU);
    PaletteData_LoadNarc(paletteData, NARC_a_0_3_8, sub_0200E3D8(), HEAP_ID_CAPSULE_MENU, PLTTBUF_MAIN_BG, 0x20, 0xD0);
    PaletteData_LoadNarc(paletteData, NARC_graphic_font, 8, HEAP_ID_CAPSULE_MENU, PLTTBUF_MAIN_BG, 0x20, 0xE0);
}

void CapsuleGraphics_LoadSubWindow(BgConfig *bgConfig, PaletteData *paletteData, int messageBoxFrame) {
    LoadUserFrameGfx2(bgConfig, GF_BG_LYR_SUB_0, MESSAGE_BOX_TILE_OFFSET, MESSAGE_BOX_PLTT_OFFSET, messageBoxFrame, HEAP_ID_CAPSULE_MENU);
    PaletteData_LoadNarc(paletteData, NARC_a_0_3_8, sub_0200E640(messageBoxFrame), HEAP_ID_CAPSULE_MENU, PLTTBUF_SUB_BG, 0x20, 0xC0);
    LoadUserFrameGfx1(bgConfig, GF_BG_LYR_SUB_0, STD_WINDOW_TILE_OFFSET, STD_WINDOW_PLTT_OFFSET, 0, HEAP_ID_CAPSULE_MENU);
    PaletteData_LoadNarc(paletteData, NARC_a_0_3_8, sub_0200E3D8(), HEAP_ID_CAPSULE_MENU, PLTTBUF_SUB_BG, 0x20, 0xD0);
    PaletteData_LoadNarc(paletteData, NARC_graphic_font, 8, HEAP_ID_CAPSULE_MENU, PLTTBUF_SUB_BG, 0x20, 0xE0);
    PaletteData_LoadNarc(paletteData, NARC_graphic_font, 8, HEAP_ID_CAPSULE_MENU, PLTTBUF_SUB_BG, 0x20, 0x30);
    PaletteData_LoadNarc(paletteData, NARC_a_0_8_7, 0, HEAP_ID_CAPSULE_MENU, PLTTBUF_SUB_BG, 0x20, 0xB0);
}

void CapsuleGraphics_PrintMessage(Window *window, int frame, int entryID, BOOL drawFrame) {
    MsgData *messageLoader;
    String *string;

    if (drawFrame) {
        if (frame == 0) {
            DrawFrameAndWindow1(window, TRUE, 1, 12);
        } else {
            DrawFrameAndWindow2(window, TRUE, 1, 12);
        }
    }

    if (entryID == 0xFFFF) {
        FillWindowPixelBuffer(window, 15);
        ScheduleWindowCopyToVram(window);
        return;
    }

    messageLoader = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0011, HEAP_ID_CAPSULE_MENU);
    string = NewString_ReadMsgData(messageLoader, entryID);

    FillWindowPixelBuffer(window, 15);
    AddTextPrinterParameterized(window, FONT_SYSTEM, string, 0, 0, TEXT_SPEED_INSTANT, NULL);
    ScheduleWindowCopyToVram(window);
    String_Delete(string);
    DestroyMsgData(messageLoader);
}

void CapsuleGraphics_InitMessageWindow(BgConfig *bgConfig, Window *window, int bgLayer, int tilemapLeft, int tilemapTop, int width, int height, int baseTile) {
    InitWindow(window);
    AddWindowParameterized(bgConfig, window, bgLayer, tilemapLeft, tilemapTop, width, height, 14, baseTile);
    DrawFrameAndWindow2(window, 1, 1, 12);
    FillWindowPixelBuffer(window, 15);
    ScheduleWindowCopyToVram(window);
}

static void CapsuleGraphics_InitWindow_NoPushToVRAM(BgConfig *bgConfig, Window *window, int bgLayer, int left, int top, int width, int height, int baseTile) {
    InitWindow(window);
    AddWindowParameterized(bgConfig, window, bgLayer, left, top, width, height, 14, baseTile);
    FillWindowPixelBuffer(window, 15);
}

static void CapsuleGraphics_InitWindow(BgConfig *bgConfig, Window *window, int bgLayer, int tilemapLeft, int tilemapTop, int width, int height, int baseTile, int palette) {
    InitWindow(window);
    AddWindowParameterized(bgConfig, window, bgLayer, tilemapLeft, tilemapTop, width, height, palette, baseTile);
    FillWindowPixelBuffer(window, 15);
    ScheduleWindowCopyToVram(window);
}

void CapsuleGraphics_InitWindows(CapsuleAppManager *appMan) {
    CapsuleGraphics_InitWindow(appMan->graphicsMan.bgConfig, &appMan->graphicsMan.windows[5], WINDOW_BGLAYER, 3, 2, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_1, WINDOW_PALETTE);
    CapsuleGraphics_InitWindow(appMan->graphicsMan.bgConfig, &appMan->graphicsMan.windows[6], WINDOW_BGLAYER, 10, 2, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_2, WINDOW_PALETTE);
    CapsuleGraphics_InitWindow(appMan->graphicsMan.bgConfig, &appMan->graphicsMan.windows[7], WINDOW_BGLAYER, 3, 5, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_3, WINDOW_PALETTE);
    CapsuleGraphics_InitWindow(appMan->graphicsMan.bgConfig, &appMan->graphicsMan.windows[8], WINDOW_BGLAYER, 10, 5, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_4, WINDOW_PALETTE);
    CapsuleGraphics_InitWindow(appMan->graphicsMan.bgConfig, &appMan->graphicsMan.windows[9], WINDOW_BGLAYER, 3, 8, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_5, WINDOW_PALETTE);
    CapsuleGraphics_InitWindow(appMan->graphicsMan.bgConfig, &appMan->graphicsMan.windows[10], WINDOW_BGLAYER, 10, 8, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_6, WINDOW_PALETTE);
    CapsuleGraphics_InitWindow(appMan->graphicsMan.bgConfig, &appMan->graphicsMan.windows[11], WINDOW_BGLAYER, 3, 11, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_7, WINDOW_PALETTE);
    CapsuleGraphics_InitWindow(appMan->graphicsMan.bgConfig, &appMan->graphicsMan.windows[12], WINDOW_BGLAYER, 10, 11, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_8, WINDOW_PALETTE);
}

void CapsuleGraphics_UpdateAllSealCountText(CapsuleAppManager *appMan) {
    int index;
    int sealID;
    int sealCount;
    String *string;
    Window *window;

    for (int i = 5; i < CAPSULE_MENU_WINDOW_NUM; i++) {
        window = &appMan->graphicsMan.windows[i];
        index = i - 5;
        sealID = appMan->sealPages.sealIDs[index];

        if (sealID == SEAL_NONE) {
            FillWindowPixelBuffer(window, 0xEE);
            ScheduleWindowCopyToVram(window);
            continue;
        }

        FillWindowPixelBuffer(window, 0);

        string = String_New(100, HEAP_ID_CAPSULE_MENU);
        sealCount = SealCaseInventory_GetSealQuantity(appMan->sealCount, sealID - 1);

        String16_FormatInteger(string, sealCount, 3, PRINTING_MODE_RIGHT_ALIGN, 1);
        AddTextPrinterParameterizedWithColor(window, FONT_SYSTEM, string, SEAL_COUNT_TEXT_XOFFSET, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        ScheduleWindowCopyToVram(window);
        String_Delete(string);
    }
}

void CapsuleGraphics_UpdateSealCountText(CapsuleAppManager *appMan, int index) {
    int index_dupe;
    int sealID;
    int sealCount;
    String *string;
    Window *window = &appMan->graphicsMan.windows[index + 5];
    index_dupe = index;
    sealID = appMan->sealPages.sealIDs[index_dupe];

    if (sealID == SEAL_NONE) {
        FillWindowPixelBuffer(window, 0xEE);
        ScheduleWindowCopyToVram(window);
        return;
    }

    FillWindowPixelBuffer(window, 0);

    string = String_New(100, HEAP_ID_CAPSULE_MENU);
    sealCount = SealCaseInventory_GetSealQuantity(appMan->sealCount, sealID - 1);

    String16_FormatInteger(string, sealCount, 3, PRINTING_MODE_RIGHT_ALIGN, 1);
    AddTextPrinterParameterizedWithColor(window, FONT_SYSTEM, string, SEAL_COUNT_TEXT_XOFFSET, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    ScheduleWindowCopyToVram(window);
    String_Delete(string);
}

void CapsuleGraphics_FreeSealCountWindows(CapsuleAppManager *appMan) {
    for (int i = 5; i < CAPSULE_MENU_WINDOW_NUM; i++) {
        ClearWindowTilemapAndScheduleTransfer(&appMan->graphicsMan.windows[i]);
        RemoveWindow(&appMan->graphicsMan.windows[i]);
    }
}

void CapsuleGraphics_UpdateSealNameText(Window *window, int entryID) {
    MsgData *messageLoader;
    String *string;

    if (entryID == 0xFFFF) {
        FillWindowPixelBuffer(window, 15);
        ScheduleWindowCopyToVram(window);
        return;
    }

    messageLoader = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0015, HEAP_ID_CAPSULE_MENU);
    string = NewString_ReadMsgData(messageLoader, entryID);

    FillWindowPixelBuffer(window, 15);
    AddTextPrinterParameterized(window, FONT_SYSTEM, string, 0, 0, TEXT_SPEED_INSTANT, NULL);
    ScheduleWindowCopyToVram(window);
    String_Delete(string);
    DestroyMsgData(messageLoader);
}

void CapsuleGraphics_StartDisplay(void) {
    GfGfx_BothDispOn();
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, TRUE);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, TRUE);
}

void CapsuleGraphics_FadeIn(void) {
    BeginNormalPaletteFade(FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_IN, FADE_TYPE_BRIGHTNESS_IN, RGB_BLACK, 6, 1, HEAP_ID_CAPSULE_MENU);
}

void CapsuleGraphics_FadeOut(void) {
    BeginNormalPaletteFade(FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_OUT, FADE_TYPE_BRIGHTNESS_OUT, RGB_BLACK, 6, 1, HEAP_ID_CAPSULE_MENU);
}

void CapsuleGraphics_LoadBgLayer2Tilemap(CapsuleAppManager *appMan, NARC *narc) {
    NarcId narcID = NARC_a_0_8_7;
    int narcTileIdx = 8;
    int narcTilemapIdx = 12;
    int narcMemberIdx = 2;
    int bgLayer = GF_BG_LYR_MAIN_2;

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, narcTileIdx, appMan->graphicsMan.bgConfig, bgLayer, 0, 0, TRUE, HEAP_ID_CAPSULE_MENU);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, narcTilemapIdx, appMan->graphicsMan.bgConfig, bgLayer, 0, 0, TRUE, HEAP_ID_CAPSULE_MENU);
    PaletteData_LoadNarc(appMan->graphicsMan.paletteData, narcID, narcMemberIdx, HEAP_ID_CAPSULE_MENU, PLTTBUF_MAIN_BG, 0x60, 0);

    narcTileIdx = 9;
    narcTilemapIdx = 13;
    bgLayer = GF_BG_LYR_MAIN_3;

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, narcTileIdx, appMan->graphicsMan.bgConfig, bgLayer, 0, 0, TRUE, HEAP_ID_CAPSULE_MENU);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, narcTilemapIdx, appMan->graphicsMan.bgConfig, bgLayer, 0, 0, TRUE, HEAP_ID_CAPSULE_MENU);
}

void CapsuleGraphics_LoadBgLayer5Tilemap(CapsuleAppManager *appMan, NARC *narc) {
    NarcId narcID = NARC_a_0_8_7;
    int narcTileIdx = 7;
    int narcTilemapIdx = 11;
    int narcMemberIdx = 1;
    int bgLayer = GF_BG_LYR_SUB_1;

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, narcTileIdx, appMan->graphicsMan.bgConfig, bgLayer, 0, 0, TRUE, HEAP_ID_CAPSULE_MENU);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, narcTilemapIdx, appMan->graphicsMan.bgConfig, bgLayer, 0, 0, TRUE, HEAP_ID_CAPSULE_MENU);
    PaletteData_LoadNarc(appMan->graphicsMan.paletteData, narcID, narcMemberIdx, HEAP_ID_CAPSULE_MENU, PLTTBUF_SUB_BG, 0x20 * 2, 0);
}

void CapsuleGraphics_LoadBgLayer7Tilemap(CapsuleAppManager *appMan, NARC *narc) {
    NarcId narcID = NARC_a_0_8_7;
    int narcTileIdx = 7;
    int narcTilemapIdx = 10;
    int narcMemberIdx = 1;
    int bgLayer = GF_BG_LYR_SUB_3;

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, narcTileIdx, appMan->graphicsMan.bgConfig, bgLayer, 0, 0, TRUE, HEAP_ID_CAPSULE_MENU);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, narcTilemapIdx, appMan->graphicsMan.bgConfig, bgLayer, 0, 0, TRUE, HEAP_ID_CAPSULE_MENU);
    PaletteData_LoadNarc(appMan->graphicsMan.paletteData, narcID, narcMemberIdx, HEAP_ID_CAPSULE_MENU, PLTTBUF_SUB_BG, 0x40, 0);
}

void CapsuleGraphics_LoadCapsuleUI(CapsuleAppManager *appMan, NARC *narc) {
    SpriteSystem *spriteSystem = appMan->graphicsMan.spriteSystem;
    SpriteManager *spriteManager = appMan->graphicsMan.spriteManager;
    PaletteData *paletteData = appMan->graphicsMan.paletteData;

    SpriteSystem_LoadPaletteBufferFromOpenNarc(paletteData, PLTTBUF_SUB_OBJ, spriteSystem, spriteManager, narc, 4, FALSE, 3, NNS_G2D_VRAM_TYPE_2DSUB, 26004);
    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, 26, TRUE, NNS_G2D_VRAM_TYPE_2DSUB, 25026);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, 28, TRUE, 27028);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, 27, TRUE, 28027);
    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, 29, TRUE, NNS_G2D_VRAM_TYPE_2DSUB, 25029);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, 31, TRUE, 27031);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, 30, TRUE, 28030);
    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, 20, TRUE, NNS_G2D_VRAM_TYPE_2DSUB, 25020);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, 22, TRUE, 27022);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, 21, TRUE, 28021);
    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, 23, TRUE, NNS_G2D_VRAM_TYPE_2DSUB, 35023);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, 25, TRUE, 27025);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, 24, TRUE, 28024);
}

void CapsuleGraphics_InitCapsuleUI(CapsuleAppManager *appMan) {
    int i;
    ManagedSprite **pageSprites;
    ManagedSpriteTemplate spriteTemplate;
    SpriteSystem *spriteSystem = appMan->graphicsMan.spriteSystem;
    SpriteManager *spriteManager = appMan->graphicsMan.spriteManager;
    PaletteData *paletteData = appMan->graphicsMan.paletteData;
    pageSprites = appMan->pageSprites;

    spriteTemplate.x = 0;
    spriteTemplate.y = 0;
    spriteTemplate.z = 0;
    spriteTemplate.animation = 0;
    spriteTemplate.drawPriority = 60;
    spriteTemplate.vram = NNS_G2D_VRAM_TYPE_2DSUB;
    spriteTemplate.bgPriority = 1;
    spriteTemplate.vramTransfer = FALSE;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_MCEL] = -1;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_MANM] = -1;

    i = 8;

    spriteTemplate.pal = 1;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_CHAR] = 25026;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_PLTT] = 26004;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_CELL] = 27028;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_ANIM] = 28027;
    pageSprites[i++] = SpriteSystem_NewSprite(spriteSystem, spriteManager, &spriteTemplate);

    spriteTemplate.resIdList[GF_GFX_RES_TYPE_CHAR] = 25029;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_PLTT] = 26004;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_CELL] = 27031;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_ANIM] = 28030;
    pageSprites[i++] = SpriteSystem_NewSprite(spriteSystem, spriteManager, &spriteTemplate);

    spriteTemplate.bgPriority = 1;
    spriteTemplate.pal = 1;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_CHAR] = 35023;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_PLTT] = 26004;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_CELL] = 27025;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_ANIM] = 28024;
    pageSprites[i++] = SpriteSystem_NewSprite(spriteSystem, spriteManager, &spriteTemplate);

    spriteTemplate.bgPriority = 1;
    spriteTemplate.pal = 0;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_CHAR] = 25020;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_PLTT] = 26004;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_CELL] = 27022;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_ANIM] = 28021;
    pageSprites[i++] = SpriteSystem_NewSprite(spriteSystem, spriteManager, &spriteTemplate);
    pageSprites[i++] = SpriteSystem_NewSprite(spriteSystem, spriteManager, &spriteTemplate);

    const s16 xyPos[][2] = {
        { 20,  23  },
        { 20,  47  },
        { 20,  71  },
        { 20,  95  },
        { 76,  23  },
        { 76,  47  },
        { 76,  71  },
        { 76,  95  },
        { 27,  124 },
        { 67,  124 },
        { 32,  171 },
        { 104, 171 },
        { 192, 171 },
    };
    const s16 xyOffset[][2] = {
        { 0xFF, 0xFF },
        { 0xFF, 0xFF },
        { 0xFF, 0xFF },
        { 0xFF, 0xFF },
        { 0xFF, 0xFF },
        { 0xFF, 0xFF },
        { 0xFF, 0xFF },
        { 0xFF, 0xFF },
        { 13,   10   },
        { 13,   10   },
        { 16,   12   },
        { 28,   12   },
        { 28,   12   },
    };

    for (i = 8; i < 13; i++) {
        ManagedSprite_SetPositionXY(appMan->pageSprites[i], xyPos[i][0], xyPos[i][1]);
        ManagedSprite_TickFrame(appMan->pageSprites[i]);
        ManagedSprite_SetAnimationFrame(appMan->pageSprites[i], 0);
        CapsuleGraphics_OffsetSprite(&appMan->graphicsMan.touchscreenHitboxes[i], appMan->pageSprites[i], xyOffset[i][0], xyOffset[i][1]);
    }
}

void CapsuleGraphics_SetPageSpritesDrawFlag(CapsuleAppManager *appMan, int flag) {
    for (int i = 0; i < 13; i++) {
        if (appMan->pageSprites[i] == NULL) {
            continue;
        }

        ManagedSprite_SetDrawFlag(appMan->pageSprites[i], flag);
    }
}

void CapsuleGraphics_Dummy(CapsuleAppManager *appMan) {
}

void CapsuleGraphics_FreeUISprites(CapsuleAppManager *appMan) {
    for (int i = 8; i < 13; i++) {
        Sprite_DeleteAndFreeResources(appMan->pageSprites[i]);
    }
}
