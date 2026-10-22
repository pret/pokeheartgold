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
#include "unk_02091054.h"

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

extern const struct {
    s32 index;
    BOOL (*func)(CapsuleAppManager *appMan);
} ov57_0223BECC[];

const int ov57_0223BDF4[] = {
    0x00000018,
    0x00000019,
    0x0000001B,
    0x00000028,
    0x00000029,
    0x0000002B,
    0x00000048,
    0x00000049,
    0x0000004B,
};

void ov57_022385A4(TouchscreenHitbox *rect, ManagedSprite *sprite, int xOffset, int yOffset) {
    s16 x, y;

    ManagedSprite_GetPositionXY(sprite, &x, &y);

    rect->rect.top = y - yOffset;
    rect->rect.bottom = y + yOffset;
    rect->rect.left = x - xOffset;
    rect->rect.right = x + xOffset;
}

void ov57_022385DC(CapsuleAppManager *appManager) {
    ov57_02239814(appManager->unk_0D4.unk_010, &appManager->unk_0D4.unk_018[0], GF_BG_LYR_MAIN_1, 1, 21, 30, 2, 0x03A);
    ov57_02239814(appManager->unk_0D4.unk_010, &appManager->unk_0D4.unk_018[3], GF_BG_LYR_MAIN_1, 1, 21, 20, 2, 0x03A);
    ov57_02239814(appManager->unk_0D4.unk_010, &appManager->unk_0D4.unk_018[2], GF_BG_LYR_MAIN_1, 23, 21, 8, 2, 0x076);
}

void ov57_0223864C(CapsuleAppManager *appManager) {
    RemoveWindow(&appManager->unk_0D4.unk_018[0]);
    RemoveWindow(&appManager->unk_0D4.unk_018[3]);
    RemoveWindow(&appManager->unk_0D4.unk_018[2]);
}

void ov57_0223866C(CapsuleAppManager *appManager, BOOL show) {
    if (show) {
        MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0011, HEAP_ID_52);
        String *string = NewString_ReadMsgData(msgData, msg_0011_00017);
        FillWindowPixelBuffer(&appManager->unk_0D4.unk_018[2], 0);
        u32 x = (64 - FontID_String_GetWidth(FONT_UNK_4, string, 0));
        x /= 2;
        AddTextPrinterParameterizedWithColor(&appManager->unk_0D4.unk_018[2], FONT_UNK_4, string, x, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 15, 0), NULL);
        String_Delete(string);
        DestroyMsgData(msgData);
        ScheduleWindowCopyToVram(&appManager->unk_0D4.unk_018[2]);
    } else {
        ClearWindowTilemapAndScheduleTransfer(&appManager->unk_0D4.unk_018[2]);
    }
}

void ov57_022386F0(CapsuleAppManager *appMan) {
    appMan->unk_0D4.unk_188 = FontSystem_NewInit(2, HEAP_ID_52);
    FontID_Alloc(FONT_SUBSCREEN, HEAP_ID_52);
    FontID_Alloc(FONT_UNK_4, HEAP_ID_52);
}

void ov57_02238714(CapsuleAppManager *appMan) {
    FontID_Release(FONT_UNK_4);
    FontID_Release(FONT_SUBSCREEN);
    FontOAM_Delete(appMan->unk_0D4.unk_18C[0]);
    sub_02021B5C(&appMan->unk_0D4.unk_194[0]);
    FontOAM_Delete(appMan->unk_0D4.unk_18C[1]);
    sub_02021B5C(&appMan->unk_0D4.unk_194[1]);
    sub_020135AC(appMan->unk_0D4.unk_188);
}

void ov57_02238758(CapsuleAppManager *appMan) {
    SpriteSystem_LoadPaletteBuffer(appMan->unk_0D4.unk_014, PLTTBUF_SUB_OBJ, appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, NARC_graphic_font, 8, FALSE, 1, NNS_G2D_VRAM_TYPE_2DSUB, 30000);
}

void ov57_02238794(CapsuleAppManager *appMan) {
    ov57_02238758(appMan);
    ov57_022387E0(appMan, 0, 104, 165, 0);
    ov57_022387E0(appMan, 1, 192, 165, 0);
}

void ov57_022387C0(CapsuleAppManager *appMan, BOOL flag) {
    TextOBJ_SetSpritesDrawFlag(appMan->unk_0D4.unk_18C[0], flag);
    TextOBJ_SetSpritesDrawFlag(appMan->unk_0D4.unk_18C[1], flag);
}

void ov57_022387E0(CapsuleAppManager *appMan, int index, int x, int y, int palette) {
    TextOBJTemplate fontOAMManager;
    String *string;
    int unk_448;
    int v3;
    MsgData *messageLoader;
    Window window;

    messageLoader = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0011, HEAP_ID_52);
    string = NewString_ReadMsgData(messageLoader, msg_0011_00005 + index);

    InitWindow(&window);
    AddTextWindowTopLeftCorner(appMan->unk_0D4.unk_010, &window, 10, 2, 0, 0);
    AddTextPrinterParameterizedWithColor(&window, FONT_SUBSCREEN, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 13, 2), NULL);

    unk_448 = 30000;
    v3 = sub_02013688(&window, NNS_G2D_VRAM_TYPE_2DSUB, HEAP_ID_52);
    sub_02021AC8(v3, 1, NNS_G2D_VRAM_TYPE_2DSUB, &appMan->unk_0D4.unk_194[index]);

    fontOAMManager.fontSystem = appMan->unk_0D4.unk_188;
    fontOAMManager.window = &window;
    fontOAMManager.spriteList = SpriteManager_GetSpriteList(appMan->unk_0D4.unk_00C);
    fontOAMManager.plttResourceProxy = SpriteManager_FindPlttResourceProxy(appMan->unk_0D4.unk_00C, unk_448);
    fontOAMManager.sprite = NULL;
    fontOAMManager.offset = appMan->unk_0D4.unk_194[index].offset;
    fontOAMManager.x = x - FontID_String_GetWidth(FONT_SUBSCREEN, string, 0) / 2;
    fontOAMManager.y = y + 192;
    fontOAMManager.unk_20 = 1;
    fontOAMManager.unk_24 = 40;
    fontOAMManager.vram = NNS_G2D_VRAM_TYPE_2DSUB;
    fontOAMManager.heapID = HEAP_ID_52;
    appMan->unk_0D4.unk_18C[index] = sub_020135D8(&fontOAMManager);

    sub_020138E0(appMan->unk_0D4.unk_18C[index], palette);
    String_Delete(string);
    DestroyMsgData(messageLoader);
    RemoveWindow(&window);
}

void ov57_022388E4(CapsuleAppManager *appMan, int pageCutoff) {
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
        appMan->unk_448.sealIDs[i] = SEAL_NONE;
    }

    for (i = 0; i < SEAL_MAX + 1; i++) {
        for (int j = 0; j < MAX_CAPSULES; j++) {
            sealOnCapsule = SealIsOnCapsule(appMan->unk_004[j].capsule, i);

            if (sealOnCapsule) {
                break;
            }
        }

        sealCounts = appMan->unk_080[i];

        if (sealCounts != 0 || sealOnCapsule == TRUE) {
            uniqueSeals++;

            if (uniqueSeals <= maxSeals) {
                continue;
            }

            appMan->unk_448.sealIDs[sealIndex] = i + 1;
            sealIndex++;

            if (sealIndex >= SEALS_PER_PAGE) {
                break;
            }
        }
    }
}

void ov57_02238958(CapsuleAppManager *appMan) {
    int i;
    int memberIdx;
    SpriteSystem *spriteSystem = appMan->unk_0D4.unk_008;
    SpriteManager *spriteManager = appMan->unk_0D4.unk_00C;
    PaletteData *paletteData = appMan->unk_0D4.unk_014;

    for (i = 0; i < SEALS_PER_PAGE; i++) {
        memberIdx = CapsuleMenu_GetSealMemberIdx(appMan->unk_448.sealIDs[i]);
        SpriteSystem_LoadCharResObj(spriteSystem, spriteManager, NARC_a_0_8_7, memberIdx, TRUE, NNS_G2D_VRAM_TYPE_2DSUB, i + 25000);
    }

    SpriteSystem_LoadPaletteBuffer(paletteData, PLTTBUF_SUB_OBJ, spriteSystem, spriteManager, NARC_a_0_8_7, 6, FALSE, 1, NNS_G2D_VRAM_TYPE_2DSUB, 26007);
    SpriteSystem_LoadCellResObj(spriteSystem, spriteManager, NARC_a_0_8_7, 37, TRUE, 27037);
    SpriteSystem_LoadAnimResObj(spriteSystem, spriteManager, NARC_a_0_8_7, 35, TRUE, 28035);
}

void ov57_02238A00(CapsuleAppManager *appMan) {
    int i;
    ManagedSprite **pageSprites;
    ManagedSpriteTemplate spriteTemplate;
    SpriteSystem *spriteSystem = appMan->unk_0D4.unk_008;
    SpriteManager *spriteManager = appMan->unk_0D4.unk_00C;
    PaletteData *paletteData = appMan->unk_0D4.unk_014;
    pageSprites = appMan->unk_414;

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
        ManagedSprite_SetPositionXY(appMan->unk_414[i], initialXY[i][0], initialXY[i][1] - 1);
        ManagedSprite_TickFrame(appMan->unk_414[i]);
        ManagedSprite_SetAnimationFrame(appMan->unk_414[i], 0);
    }
}

void ov57_02238AC0(CapsuleAppManager *appMan) {
    for (int i = 0; i < SEALS_PER_PAGE; i++) {
        SpriteManager_UnloadCharObjById(appMan->unk_0D4.unk_00C, i + 25000);
        Sprite_DeleteAndFreeResources(appMan->unk_414[i]);
    }
}

void ov57_02238AF0(CapsuleAppManager *appMan, s16 a1) {
    s16 dx = 56 * a1;
    s16 dy = -16 * a1;
    for (int i = 0; i < SEALS_PER_PAGE; ++i) {
        if (appMan->unk_34C[i].shouldRender) {
            ManagedSprite_OffsetPositionXY(appMan->unk_34C[i].sprite, dx, dy);
        }
    }
}

GF3DVramMan *ov57_02238B28(void) {
    return GF_3DVramMan_Create(HEAP_ID_52, 0, 2, 0, 2, ov57_02238B48);
}

void ov57_02238B48(void) {
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

void ov57_02238BCC(void) {
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

void ov57_02238C0C(void) {
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

void ov57_02238C30(BgConfig *bgConfig, Window *window, int bgLayer, CapsuleAppManager *appMan, int capsuleIndex) {
    TouchscreenListMenuHeader menuTemplate;
    int field;
    int tilemapLeft, tilemapTop, width, height, baseTile, ySize;
    int stringIDs[4];

    field = ov57_0223A0A8(appMan, capsuleIndex);
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

    appMan->unk_0D4.unk_0E8 = ListMenuItems_New(ySize, HEAP_ID_52);

    String *string;
    MsgData *messageLoader = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0011, HEAP_ID_52);

    for (int i = 0; i < ySize; i++) {
        string = NewString_ReadMsgData(messageLoader, ov57_0223BECC[stringIDs[i]].index);

        ListMenuItems_AddItem(appMan->unk_0D4.unk_0E8, string, (int)ov57_0223BECC[stringIDs[i]].func);
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
    menuTemplate.listMenuItems = appMan->unk_0D4.unk_0E8;
    menuTemplate.bgConfig = bgConfig;
    menuTemplate.numWindows = ySize;
    appMan->unk_0D4.unk_178 = TouchscreenListMenu_Create(appMan->unk_0D4.unk_174, &menuTemplate, appMan->unk_40C, 22, 23 - ySize * 3, 8, 0);
}

void ov57_02238D80(CapsuleAppManager *appMan) {
    appMan->unk_40C = appMan->unk_0D4.unk_178->isTouch;
    TouchscreenListMenu_Destroy(appMan->unk_0D4.unk_178);
    ListMenuItems_Delete(appMan->unk_0D4.unk_0E8);
}

void ov57_02238DAC(int index, s16 *x, s16 *y) {
    int tile = (index % 4);
    *x = 32 + 8 + (tile * 56);
    tile = (index >> 2);
    *y = 27 + (tile * 53);
}

void ov57_02238DD0(CapsuleAppManager *appMan) {
    SpriteSystem *spriteSystem = appMan->unk_0D4.unk_008;
    SpriteManager *spriteManager = appMan->unk_0D4.unk_00C;
    PaletteData *paletteData = appMan->unk_0D4.unk_014;

    SpriteSystem_LoadPaletteBuffer(paletteData, 2, spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, sub_02074490(), 0, 3, NNS_G2D_VRAM_TYPE_2DMAIN, 16000);

    int iconIndex = sub_0207449C();
    SpriteSystem_LoadCellResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, iconIndex, 0, 17000);

    iconIndex = sub_020744A8();
    SpriteSystem_LoadAnimResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, iconIndex, 0, 18000);
}

void ov57_02238E48(CapsuleAppManager *appMan) {
    int isEgg;
    int species;
    u8 paletteIndex;
    int form;
    Pokemon *pokemon;
    ManagedSpriteTemplate spriteTemplate;

    for (int i = 0; i < appMan->unk_000->partyCount; i++) {
        pokemon = appMan->unk_000->mons[i];

        SpriteSystem_LoadCharResObjAtEndWithHardwareMappingType(appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, NARC_poketool_icongra_poke_icon, Pokemon_GetIconNaix(pokemon), FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, i + 15000);

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

        appMan->unk_324[i] = SpriteSystem_NewSprite(appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, &spriteTemplate);

        species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        isEgg = GetMonData(pokemon, MON_DATA_IS_EGG, NULL);
        form = GetMonData(pokemon, MON_DATA_FORM, NULL);
        paletteIndex = GetMonIconPaletteEx(species, form, isEgg);

        Sprite_SetPalOffsetRespectVramOffset(appMan->unk_324[i]->sprite, paletteIndex);
        ManagedSprite_SetAnim(appMan->unk_324[i], 1);
    }
}

void ov57_02238F48(CapsuleAppManager *appMan) {
    int i;
    int index;
    s16 x, y;

    for (i = 0; i < appMan->unk_000->partyCount; i++) {
        ManagedSprite_SetDrawFlag(appMan->unk_324[i], 0);
    }

    for (i = 0; i < MAX_CAPSULES; i++) {
        index = appMan->unk_004[i].partyIdx;

        if (index != 0xFF) {
            ov57_02238DAC(i, &x, &y);
            ManagedSprite_SetPositionXY(appMan->unk_324[index], x + CAPSULE_MON_X_OFFSET, y + CAPSULE_MON_Y_OFFSET);
            ManagedSprite_SetDrawFlag(appMan->unk_324[index], 1);
        }
    }
}

void ov57_02238FC4(CapsuleAppManager *appMan) {
    for (int i = 0; i < appMan->unk_000->partyCount; i++) {
        ManagedSprite_TickFrame(appMan->unk_324[i]);
    }
}

void ov57_02238FEC(CapsuleAppManager *appMan) {
    for (int i = 0; i < appMan->unk_000->partyCount; i++) {
        Sprite_DeleteAndFreeResources(appMan->unk_324[i]);
    }
}

void ov57_02239014(CapsuleAppManager *appMan) {
    int dummy = 0;
    BallCapsule *capsule;

    for (int i = 0; i < MAX_CAPSULES; i++) {
        capsule = appMan->unk_004[i].capsule;
        appMan->unk_28C[i].animIdx = ov57_0223A07C(capsule);
        appMan->unk_28C[i].pokemonIndex = appMan->unk_004[i].partyIdx;

        if ((appMan->unk_28C[i].animIdx == 0) && (appMan->unk_28C[i].pokemonIndex != 0xFF)) {
            ov57_0223BC4C(appMan, i);
        }
    }
}

void ov57_02239058(CapsuleGraphicsManager *unk_0D4) {
    unk_0D4->unk_008 = SpriteSystem_Alloc(HEAP_ID_52);
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

    SpriteSystem_Init(unk_0D4->unk_008, &renderOAMTemplate, &transferTemplate, SPRITE_SYSTEM_PLTT_CAPACITY);

    BOOL result;
    const SpriteResourceCountsListUnion spriteResourceCapacities = {
        48 + 48,
        16 + 16,
        64,
        64,
        16,
        16,
    };

    unk_0D4->unk_00C = SpriteManager_New(unk_0D4->unk_008);
    result = SpriteSystem_InitSprites(unk_0D4->unk_008, unk_0D4->unk_00C, 128);
    GF_ASSERT(result);

    result = SpriteSystem_InitManagerWithCapacities(unk_0D4->unk_008, unk_0D4->unk_00C, &spriteResourceCapacities);
    GF_ASSERT(result);

    unk_0D4->unk_174 = TouchscreenListMenuSpawner_Create(HEAP_ID_52, unk_0D4->unk_014);
}

void ov57_022390F4(CapsuleGraphicsManager *unk_0D4) {
    TouchscreenListMenuSpawner_Destroy(unk_0D4->unk_174);
    SpriteSystem_FreeResourcesAndManager(unk_0D4->unk_008, unk_0D4->unk_00C);
    SpriteSystem_Free(unk_0D4->unk_008);
}

void ov57_02239114(CapsuleAppManager *appMan, NARC *narc) {
    SpriteSystem_LoadCharResObjFromOpenNarc(appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, narc, 14, TRUE, NNS_G2D_VRAM_TYPE_2DSUB, 45000);
    SpriteSystem_LoadCellResObjFromOpenNarc(appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, narc, 16, TRUE, 47000);
    SpriteSystem_LoadAnimResObjFromOpenNarc(appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, narc, 15, TRUE, 48000);
}

void ov57_02239184(CapsuleAppManager *appMan) {
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
        appMan->unk_33C[i] = SpriteSystem_NewSprite(appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, &spriteTemplate);

        ManagedSprite_SetFlipMode(appMan->unk_33C[i], startingStates[i][2]);
    }
}

void ov57_0223921C(CapsuleAppManager *appMan) {
    if (appMan->unk_0D4.unk_004 == 0) {
        return;
    }

    for (int i = 0; i < CAPSULE_SELECTION_ARROWS; i++) {
        ManagedSprite_TickFrame(appMan->unk_33C[i]);
    }
}

void ov57_02239240(CapsuleAppManager *appMan, int flag) {
    for (int i = 0; i < CAPSULE_SELECTION_ARROWS; i++) {
        ManagedSprite_SetDrawFlag(appMan->unk_33C[i], flag);
    }
}

void ov57_02239260(CapsuleAppManager *appMan) {
    for (int i = 0; i < CAPSULE_SELECTION_ARROWS; i++) {
        Sprite_DeleteAndFreeResources(appMan->unk_33C[i]);
    }
}

void ov57_0223927C(SpriteSystem *spriteSystem, SpriteManager *spriteManager, PaletteData *paletteData, int charFileId, int plttFileId, int cellFileId, int animFileId, int vramType, int bufferId, int paletteIdx, NARC *narc) {
    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, charFileId, TRUE, vramType, charFileId + 11000);
    SpriteSystem_LoadPaletteBufferFromOpenNarc(paletteData, bufferId, spriteSystem, spriteManager, narc, plttFileId, FALSE, paletteIdx, vramType, plttFileId + 11000);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, cellFileId, TRUE, cellFileId + 11000);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, animFileId, TRUE, animFileId + 11000);
}

void ov57_022392F4(CapsuleAppManager *appMan, NARC *narc) {
    ov57_0223927C(appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, appMan->unk_0D4.unk_014, 17, 3, 19, 18, NNS_G2D_VRAM_TYPE_2DMAIN, 2, 1, narc);
    ov57_0223927C(appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, appMan->unk_0D4.unk_014, 32, 5, 34, 33, NNS_G2D_VRAM_TYPE_2DMAIN, 2, 1, narc);
    ManagedSpriteTemplate spriteTemplate;

    for (int i = 0; i < MAX_CAPSULES; i++) {
        spriteTemplate.x = 0;
        spriteTemplate.y = 0;
        spriteTemplate.z = 0;
        spriteTemplate.animation = appMan->unk_28C[i].animIdx;
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

        appMan->unk_28C[i].sprite = SpriteSystem_NewSprite(appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, &spriteTemplate);
        s16 x, y;

        ov57_02238DAC(i, &x, &y);
        ManagedSprite_SetPositionXY(appMan->unk_28C[i].sprite, x, y);
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

    appMan->unk_31C[0] = SpriteSystem_NewSprite(appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, &spriteTemplate);
    appMan->unk_31C[1] = SpriteSystem_NewSprite(appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, &spriteTemplate);

    s16 x, y;

    ov57_02238DAC(appMan->unk_3EC, &x, &y);
    ManagedSprite_SetPositionXY(appMan->unk_31C[0], x, y);
    ManagedSprite_SetPositionXY(appMan->unk_31C[1], x, y);
    ManagedSprite_SetDrawPriority(appMan->unk_31C[1], 25);
    ManagedSprite_SetAnim(appMan->unk_31C[0], 0);
    ManagedSprite_SetAnim(appMan->unk_31C[1], 0);
}

void ov57_022394AC(CapsuleAppManager *appMan) {
    ov57_02239014(appMan);
    ov57_02238F48(appMan);

    for (int i = 0; i < MAX_CAPSULES; i++) {
        if (appMan->unk_28C[i].sprite == NULL) {
            continue;
        }

        ManagedSprite_SetAnim(appMan->unk_28C[i].sprite, appMan->unk_28C[i].animIdx);
    }
}

void ov57_022394D8(CapsuleAppManager *appMan, int capsuleIdx1, int capsuleIdx2) {
    int tmp;
    int index1;
    int index2;
    int capsuleID1;
    int capsuleID2;
    BallCapsule tmpCapsule;

    index1 = appMan->unk_004[capsuleIdx1].partyIdx;
    index2 = appMan->unk_004[capsuleIdx2].partyIdx;

    if (index1 != 0xFF) {
        capsuleID1 = capsuleIdx2 + 1;
        SetMonData(appMan->unk_000->mons[index1], MON_DATA_BALL_CAPSULE_ID, (u8 *)&capsuleID1);
    }

    if (index2 != 0xFF) {
        capsuleID2 = capsuleIdx1 + 1;
        SetMonData(appMan->unk_000->mons[index2], MON_DATA_BALL_CAPSULE_ID, (u8 *)&capsuleID2);
    }

    tmp = appMan->unk_004[capsuleIdx1].partyIdx;
    appMan->unk_004[capsuleIdx1].partyIdx = appMan->unk_004[capsuleIdx2].partyIdx;
    appMan->unk_004[capsuleIdx2].partyIdx = tmp;

    CopyCapsule(appMan->unk_004[capsuleIdx1].capsule, &tmpCapsule);
    CopyCapsule(appMan->unk_004[capsuleIdx2].capsule, appMan->unk_004[capsuleIdx1].capsule);
    CopyCapsule(&tmpCapsule, appMan->unk_004[capsuleIdx2].capsule);
    ov57_022394AC(appMan);
}

void ov57_02239558(CapsuleAppManager *appMan) {
    for (int i = 0; i < MAX_CAPSULES; i++) {
        ManagedSprite_TickFrame(appMan->unk_28C[i].sprite);
    }

    ManagedSprite_TickFrame(appMan->unk_31C[0]);
    ManagedSprite_TickFrame(appMan->unk_31C[1]);
}

void ov57_02239588(CapsuleAppManager *appMan) {
    for (int i = 0; i < MAX_CAPSULES; i++) {
        Sprite_DeleteAndFreeResources(appMan->unk_28C[i].sprite);
    }

    Sprite_DeleteAndFreeResources(appMan->unk_31C[0]);
    Sprite_DeleteAndFreeResources(appMan->unk_31C[1]);
}

void ov57_022395B8(BgConfig *bgConfig, PaletteData *paletteData, int messageBoxFrame) {
    {
        NNSG2dCharacterData *sp18;
        void *sp14 = GfGfxLoader_GetCharData(NARC_a_0_8_7, 8, TRUE, &sp18, HEAP_ID_52);
        u8 *r7 = sp18->pRawData;
        DC_FlushRange(r7, sp18->szByte);
        for (int i = 0; i < NELEMS(ov57_0223BDF4); ++i) {
            BG_LoadCharTilesData(bgConfig, GF_BG_LYR_MAIN_1, r7 + 32 * ov57_0223BDF4[i], 0x20, i + 1);
        }
        Heap_Free(sp14);
    }
    PaletteData_LoadFromNarc(paletteData, NARC_a_0_8_7, 2, HEAP_ID_52, PLTTBUF_MAIN_BG, 0x20, 0xC0, 0x20);
    LoadUserFrameGfx1(bgConfig, GF_BG_LYR_MAIN_1, STD_WINDOW_TILE_OFFSET, STD_WINDOW_PLTT_OFFSET, 0, HEAP_ID_52);
    PaletteData_LoadNarc(paletteData, NARC_a_0_3_8, sub_0200E3D8(), HEAP_ID_52, PLTTBUF_MAIN_BG, 0x20, 0xD0);
    PaletteData_LoadNarc(paletteData, NARC_graphic_font, 8, HEAP_ID_52, PLTTBUF_MAIN_BG, 0x20, 0xE0);
}

void ov57_02239670(BgConfig *bgConfig, PaletteData *paletteData, int messageBoxFrame) {
    LoadUserFrameGfx2(bgConfig, GF_BG_LYR_SUB_0, MESSAGE_BOX_TILE_OFFSET, MESSAGE_BOX_PLTT_OFFSET, messageBoxFrame, HEAP_ID_52);
    PaletteData_LoadNarc(paletteData, NARC_a_0_3_8, sub_0200E640(messageBoxFrame), HEAP_ID_52, PLTTBUF_SUB_BG, 0x20, 0xC0);
    LoadUserFrameGfx1(bgConfig, GF_BG_LYR_SUB_0, STD_WINDOW_TILE_OFFSET, STD_WINDOW_PLTT_OFFSET, 0, HEAP_ID_52);
    PaletteData_LoadNarc(paletteData, NARC_a_0_3_8, sub_0200E3D8(), HEAP_ID_52, PLTTBUF_SUB_BG, 0x20, 0xD0);
    PaletteData_LoadNarc(paletteData, NARC_graphic_font, 8, HEAP_ID_52, PLTTBUF_SUB_BG, 0x20, 0xE0);
    PaletteData_LoadNarc(paletteData, NARC_graphic_font, 8, HEAP_ID_52, PLTTBUF_SUB_BG, 0x20, 0x30);
    PaletteData_LoadNarc(paletteData, NARC_a_0_8_7, 0, HEAP_ID_52, PLTTBUF_SUB_BG, 0x20, 0xB0);
}

void ov57_02239728(Window *window, int frame, int entryID, BOOL drawFrame) {
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

    messageLoader = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0011, HEAP_ID_52);
    string = NewString_ReadMsgData(messageLoader, entryID);

    FillWindowPixelBuffer(window, 15);
    AddTextPrinterParameterized(window, FONT_SYSTEM, string, 0, 0, TEXT_SPEED_INSTANT, NULL);
    ScheduleWindowCopyToVram(window);
    String_Delete(string);
    DestroyMsgData(messageLoader);
}

void ov57_022397B0(BgConfig *bgConfig, Window *window, int bgLayer, int tilemapLeft, int tilemapTop, int width, int height, int baseTile) {
    InitWindow(window);
    AddWindowParameterized(bgConfig, window, bgLayer, tilemapLeft, tilemapTop, width, height, 14, baseTile);
    DrawFrameAndWindow2(window, 1, 1, 12);
    FillWindowPixelBuffer(window, 15);
    ScheduleWindowCopyToVram(window);
}

void ov57_02239814(BgConfig *bgConfig, Window *window, int bgLayer, int left, int top, int width, int height, int baseTile) {
    InitWindow(window);
    AddWindowParameterized(bgConfig, window, bgLayer, left, top, width, height, 14, baseTile);
    FillWindowPixelBuffer(window, 15);
}

void ov57_02239868(BgConfig *bgConfig, Window *window, int bgLayer, int tilemapLeft, int tilemapTop, int width, int height, int baseTile, int palette) {
    InitWindow(window);
    AddWindowParameterized(bgConfig, window, bgLayer, tilemapLeft, tilemapTop, width, height, palette, baseTile);
    FillWindowPixelBuffer(window, 15);
    ScheduleWindowCopyToVram(window);
}

void ov57_022398C4(CapsuleAppManager *appMan) {
    ov57_02239868(appMan->unk_0D4.unk_010, &appMan->unk_0D4.unk_018[5], WINDOW_BGLAYER, 3, 2, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_1, WINDOW_PALETTE);
    ov57_02239868(appMan->unk_0D4.unk_010, &appMan->unk_0D4.unk_018[6], WINDOW_BGLAYER, 10, 2, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_2, WINDOW_PALETTE);
    ov57_02239868(appMan->unk_0D4.unk_010, &appMan->unk_0D4.unk_018[7], WINDOW_BGLAYER, 3, 5, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_3, WINDOW_PALETTE);
    ov57_02239868(appMan->unk_0D4.unk_010, &appMan->unk_0D4.unk_018[8], WINDOW_BGLAYER, 10, 5, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_4, WINDOW_PALETTE);
    ov57_02239868(appMan->unk_0D4.unk_010, &appMan->unk_0D4.unk_018[9], WINDOW_BGLAYER, 3, 8, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_5, WINDOW_PALETTE);
    ov57_02239868(appMan->unk_0D4.unk_010, &appMan->unk_0D4.unk_018[10], WINDOW_BGLAYER, 10, 8, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_6, WINDOW_PALETTE);
    ov57_02239868(appMan->unk_0D4.unk_010, &appMan->unk_0D4.unk_018[11], WINDOW_BGLAYER, 3, 11, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_7, WINDOW_PALETTE);
    ov57_02239868(appMan->unk_0D4.unk_010, &appMan->unk_0D4.unk_018[12], WINDOW_BGLAYER, 10, 11, CAPSULE_WINDOW_WIDTH, CAPSULE_WINDOW_HEIGHT, CAPSULE_BASE_TILE_8, WINDOW_PALETTE);
}

void ov57_022399F8(CapsuleAppManager *appMan) {
    int index;
    int sealID;
    int sealCount;
    String *string;
    Window *window;

    for (int i = 5; i < CAPSULE_MENU_WINDOW_NUM; i++) {
        window = &appMan->unk_0D4.unk_018[i];
        index = i - 5;
        sealID = appMan->unk_448.sealIDs[index];

        if (sealID == SEAL_NONE) {
            FillWindowPixelBuffer(window, 0xEE);
            ScheduleWindowCopyToVram(window);
            continue;
        }

        FillWindowPixelBuffer(window, 0);

        string = String_New(100, HEAP_ID_52);
        sealCount = SealCaseInventory_GetSealQuantity(appMan->unk_064, sealID - 1);

        String16_FormatInteger(string, sealCount, 3, PRINTING_MODE_RIGHT_ALIGN, 1);
        AddTextPrinterParameterizedWithColor(window, FONT_SYSTEM, string, SEAL_COUNT_TEXT_XOFFSET, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        ScheduleWindowCopyToVram(window);
        String_Delete(string);
    }
}

void ov57_02239A8C(CapsuleAppManager *appMan, int index) {
    int index_dupe;
    int sealID;
    int sealCount;
    String *string;
    Window *window = &appMan->unk_0D4.unk_018[index + 5];
    index_dupe = index;
    sealID = appMan->unk_448.sealIDs[index_dupe];

    if (sealID == SEAL_NONE) {
        FillWindowPixelBuffer(window, 0xEE);
        ScheduleWindowCopyToVram(window);
        return;
    }

    FillWindowPixelBuffer(window, 0);

    string = String_New(100, HEAP_ID_52);
    sealCount = SealCaseInventory_GetSealQuantity(appMan->unk_064, sealID - 1);

    String16_FormatInteger(string, sealCount, 3, PRINTING_MODE_RIGHT_ALIGN, 1);
    AddTextPrinterParameterizedWithColor(window, FONT_SYSTEM, string, SEAL_COUNT_TEXT_XOFFSET, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    ScheduleWindowCopyToVram(window);
    String_Delete(string);
}

void ov57_02239B0C(CapsuleAppManager *appMan) {
    for (int i = 5; i < CAPSULE_MENU_WINDOW_NUM; i++) {
        ClearWindowTilemapAndScheduleTransfer(&appMan->unk_0D4.unk_018[i]);
        RemoveWindow(&appMan->unk_0D4.unk_018[i]);
    }
}

void ov57_02239B2C(Window *window, int entryID) {
    MsgData *messageLoader;
    String *string;

    if (entryID == 0xFFFF) {
        FillWindowPixelBuffer(window, 15);
        ScheduleWindowCopyToVram(window);
        return;
    }

    messageLoader = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0015, HEAP_ID_52);
    string = NewString_ReadMsgData(messageLoader, entryID);

    FillWindowPixelBuffer(window, 15);
    AddTextPrinterParameterized(window, FONT_SYSTEM, string, 0, 0, TEXT_SPEED_INSTANT, NULL);
    ScheduleWindowCopyToVram(window);
    String_Delete(string);
    DestroyMsgData(messageLoader);
}

void ov57_02239B94(void) {
    GfGfx_BothDispOn();
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, TRUE);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, TRUE);
}

void ov57_02239BAC(void) {
    BeginNormalPaletteFade(FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_IN, FADE_TYPE_BRIGHTNESS_IN, RGB_BLACK, 6, 1, HEAP_ID_52);
}

void ov57_02239BCC(void) {
    BeginNormalPaletteFade(FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_OUT, FADE_TYPE_BRIGHTNESS_OUT, RGB_BLACK, 6, 1, HEAP_ID_52);
}

void ov57_02239BEC(CapsuleAppManager *appMan, NARC *narc) {
    NarcId narcID = NARC_a_0_8_7;
    int narcTileIdx = 8;
    int narcTilemapIdx = 12;
    int narcMemberIdx = 2;
    int bgLayer = GF_BG_LYR_MAIN_2;

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, narcTileIdx, appMan->unk_0D4.unk_010, bgLayer, 0, 0, TRUE, HEAP_ID_52);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, narcTilemapIdx, appMan->unk_0D4.unk_010, bgLayer, 0, 0, TRUE, HEAP_ID_52);
    PaletteData_LoadNarc(appMan->unk_0D4.unk_014, narcID, narcMemberIdx, HEAP_ID_52, PLTTBUF_MAIN_BG, 0x60, 0);

    narcTileIdx = 9;
    narcTilemapIdx = 13;
    bgLayer = GF_BG_LYR_MAIN_3;

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, narcTileIdx, appMan->unk_0D4.unk_010, bgLayer, 0, 0, TRUE, HEAP_ID_52);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, narcTilemapIdx, appMan->unk_0D4.unk_010, bgLayer, 0, 0, TRUE, HEAP_ID_52);
}

void ov57_02239C88(CapsuleAppManager *appMan, NARC *narc) {
    NarcId narcID = NARC_a_0_8_7;
    int narcTileIdx = 7;
    int narcTilemapIdx = 11;
    int narcMemberIdx = 1;
    int bgLayer = GF_BG_LYR_SUB_1;

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, narcTileIdx, appMan->unk_0D4.unk_010, bgLayer, 0, 0, TRUE, HEAP_ID_52);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, narcTilemapIdx, appMan->unk_0D4.unk_010, bgLayer, 0, 0, TRUE, HEAP_ID_52);
    PaletteData_LoadNarc(appMan->unk_0D4.unk_014, narcID, narcMemberIdx, HEAP_ID_52, PLTTBUF_SUB_BG, 0x20 * 2, 0);
}

void ov57_02239CE8(CapsuleAppManager *appMan, NARC *narc) {
    NarcId narcID = NARC_a_0_8_7;
    int narcTileIdx = 7;
    int narcTilemapIdx = 10;
    int narcMemberIdx = 1;
    int bgLayer = GF_BG_LYR_SUB_3;

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, narcTileIdx, appMan->unk_0D4.unk_010, bgLayer, 0, 0, TRUE, HEAP_ID_52);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, narcTilemapIdx, appMan->unk_0D4.unk_010, bgLayer, 0, 0, TRUE, HEAP_ID_52);
    PaletteData_LoadNarc(appMan->unk_0D4.unk_014, narcID, narcMemberIdx, HEAP_ID_52, PLTTBUF_SUB_BG, 0x40, 0);
}

void ov57_02239D48(CapsuleAppManager *appMan, NARC *narc) {
    SpriteSystem *spriteSystem = appMan->unk_0D4.unk_008;
    SpriteManager *spriteManager = appMan->unk_0D4.unk_00C;
    PaletteData *paletteData = appMan->unk_0D4.unk_014;

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

void ov57_02239EB4(CapsuleAppManager *appMan) {
    int i;
    ManagedSprite **pageSprites;
    ManagedSpriteTemplate spriteTemplate;
    SpriteSystem *spriteSystem = appMan->unk_0D4.unk_008;
    SpriteManager *spriteManager = appMan->unk_0D4.unk_00C;
    PaletteData *paletteData = appMan->unk_0D4.unk_014;
    pageSprites = appMan->unk_414;

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
        ManagedSprite_SetPositionXY(appMan->unk_414[i], xyPos[i][0], xyPos[i][1]);
        ManagedSprite_TickFrame(appMan->unk_414[i]);
        ManagedSprite_SetAnimationFrame(appMan->unk_414[i], 0);
        ov57_022385A4(&appMan->unk_0D4.unk_11C[i], appMan->unk_414[i], xyOffset[i][0], xyOffset[i][1]);
    }
}

void ov57_0223A034(CapsuleAppManager *appMan, int flag) {
    for (int i = 0; i < 13; i++) {
        if (appMan->unk_414[i] == NULL) {
            continue;
        }

        ManagedSprite_SetDrawFlag(appMan->unk_414[i], flag);
    }
}

void ov57_0223A058(CapsuleAppManager *appMan) {
}

void ov57_0223A05C(CapsuleAppManager *appMan) {
    for (int i = 8; i < 13; i++) {
        Sprite_DeleteAndFreeResources(appMan->unk_414[i]);
    }
}
