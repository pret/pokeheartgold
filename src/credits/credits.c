#include "global.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "msgdata.h"
#include "overlay_manager.h"
#include "sound.h"
#include "system.h"
#include "text.h"
#include "sound_02004A44.h"
#include "unk_02009D48.h"
#include "unk_0200A090.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200E320.h"
#include "unk_0200FA24.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"
#include "unk_02023694.h"
#include "bg_window.h"
#include "constants/rgb.h"
#include "constants/sndseq.h"
#include "credits/credits.h"

#ifdef HEARTGOLD
#define GAME_TITLE_MSG_NO 0
#else
#define GAME_TITLE_MSG_NO 1
#endif //HEARTGOLD

#define NUM_SCENES 6

#define MONS_PER_SCREEN    6
#define TOTAL_DANCING_MONS (2 * MONS_PER_SCREEN)

#define CREDITS_FRAMES        4976
#define MUSIC_BOX_WAIT_FRAMES 380

typedef enum {
    CREDITS_STATE_MAIN_FADE_IN,
    CREDITS_STATE_MAIN,
    CREDITS_STATE_MAIN_FADE_OUT,
    CREDITS_STATE_THE_END_FADE_IN,
    CREDITS_STATE_THE_END,
    CREDITS_STATE_THE_END_MUSIC_BOX,
    CREDITS_STATE_THE_END_FADE_OUT,
} CreditsAppState;

typedef enum {
    SCENE_TRANS_NONE,
    SCENE_TRANS_CLOUDS_APPEAR,
    SCENE_TRANS_SWITCH_BG,
    SCENE_TRANS_CLOUDS_DISSIPATE,
} SceneTransitionState;

typedef enum {
    PAGE_STATE_DISPLAY,
    PAGE_STATE_NO_DISPLAY,
    PAGE_STATE_LOAD_DISPLAY,
    PAGE_STATE_END_DISPLAY,
} PageDisplayState;

typedef struct {
    _2DGfxResObj *charResObj;
    _2DGfxResObj *plttResObj;
    _2DGfxResObj *cellResObj;
    _2DGfxResObj *cellAnmResObj;
} CutsceneResources;

typedef struct {
    u8 filler[0x4];
    u32 charOffset;
    u32 plttOffset;
    NNSG2dImagePaletteProxy *plttProxy;
    NNSG2dImageProxy *imageProxy;
    u8 unused14[0x8];
    NNSG2dCellDataBank *cellDataBank;
    NNSG2dAnimBankData *animDataBank;
    u8 unused24[0x8];
    void *unk2C;
    void *unk30;
} CutsceneSpriteGfx;

typedef struct {
    u8 timer;
    u8 state;
    u8 sceneIdxDup;
    u8 sceneIdx;
} SceneTransition;

// Work for the dancing Pokémon sprites and changing backgrounds.
//
// First 6 sprites start on the top screen, remaining start on the bottom
// screen. They flip screens after each scene transition.
typedef struct {
    Sprite *pokemon[TOTAL_DANCING_MONS];
    Sprite *cloud[TOTAL_DANCING_MONS];
    SceneTransition transition;
} SceneWork;

typedef struct {
    int unk0;
    BOOL rendering;
    BOOL hidden;
    SysTask *sysTask;
    BgConfig *bgConfig;
} PageDisplayWork;

typedef struct {
    u8 timer;
    u8 state;
    u8 page;
    u8 line;
} PageState;

typedef struct {
    u16 transitionFrame; // TODO: bool16
    u16 count;
    SysTask *sysTask;
} ScreenFlipWork;

typedef struct {
    MsgData *msgData;
    Window window;
    String *string;
    PageDisplayWork pageDisplayWork;
    PageState pageState;
    ScreenFlipWork scrFlipWork;
} PageWork;

typedef struct {
    u16 unk0;
    u16 unk2;
    int activateTime;
    Sprite *sprite;
} CutsceneSprite;

typedef struct {
    CutsceneSprite sprite[16];
    int count;
} CutsceneSprites;

// Work for the cutscenes that play out, displaying characters and Pokémon from
// the main story.
typedef struct {
    NARC *narc;
    u16 curSprite;
    u16 cutsceneIdx;
    CutsceneSpriteGfx spriteGfx[6];
    CutsceneSprites sprites;
    int gender;
} CutsceneWork;

typedef struct {
    OVY_MANAGER *man;
    BgConfig *bgConfig;
    u32 timer;
    int musicBoxWaitTimer;
    CreditsAppArgs *args;
    BOOL skipCredits;
    SpriteList *spriteList;
    GF_G2dRenderer g2dRender;
    _2DGfxResMan *_2dGfxResMan[4];
    _2DGfxResObj *_2dGfxResObj[4];
    CutsceneResources cutsceneRsrs[UNIQUE_SPRITES_PER_CUTSCENE];
    SceneWork sceneWork;
    PageWork pageWork;
    CutsceneWork cutsceneWork;
    void *unk468[6];
    void *unk480[6];
    NNSG2dScreenData *unk498[NUM_SCENES];
    NNSG2dScreenData *unk4B0[NUM_SCENES];
} CreditsAppWork;

extern const UnkOv021E60F6 ov76_021E6E88[4];
extern const u8 sPokemonSpriteSeqNos[8];

#include "credits/data.h"

static void VBlankCB(CreditsAppWork *work);
static void SetGXBanks(void);
static void InitBgLayers(CreditsAppWork *work);
static void FreeBG(CreditsAppWork *work);
static void LoadBgGraphics(CreditsAppWork *work);
static void CreateOamAndObjResMgrs(CreditsAppWork *work);
static void FreeOamAndObjResMgrs(CreditsAppWork *work);
static void ov76_021E6170(CreditsAppWork *work);
static void ov76_021E62B4(CreditsAppWork *work);
static void InitSprites(CreditsAppWork *work);
static void InitDancingSpriteResources(int a0, CreditsAppWork *work, int a2, int a3, SpriteTemplate *a4, SpriteResourcesHeader *a5);
static void SetPageSysTasks(CreditsAppWork *work);
static void FreePageSysTasks(CreditsAppWork *work);
static void HandlePageDisplay(CreditsAppWork *work);
static void HandleSceneTransition(CreditsAppWork *work);
static void HandleSceneFlip(CreditsAppWork *work);
static void HandleCutscenes(CreditsAppWork *work);
static void ActivateSprite(Sprite *a0);
static void ov76_021E68C8(CreditsAppWork *work);
static void FlipScreensCB(int a0, ScreenFlipWork *a1, int a2);
static void DisplayWindow(CreditsAppWork *work);
static void ov76_021E6944(PageDisplayWork *a0, BgConfig *a1, BOOL a2);
static BOOL PageWindowRendering(PageDisplayWork *a0);
static void TogglePageDisplayCB(int a0, PageDisplayWork *a1, int a2);
static void ov76_021E6A34(int a0, int a1, int a2, int a3);
static void LoadPage(PageWork *a0);
static void LoadCutsceneSpriteResources(CreditsAppWork *work);
static void LoadCutsceneSpriteGfx(CutsceneWork *a0, int a1);
static void InitCutsceneSprites(CreditsAppWork *work);
static void FreeCutsceneSprites(CreditsAppWork *work);

BOOL CreditsApp_OvyInit(OVY_MANAGER *man, int *state) {
    CreditsAppWork *work;

    switch (*state) {
    case 0:
        CreateHeap(3, HEAP_ID_CREDITS, 0x40000);
        work = OverlayManager_CreateAndGetData(man, sizeof(CreditsAppWork), HEAP_ID_CREDITS);
        if (work != NULL) {
            MI_CpuFill8(work, 0, sizeof(CreditsAppWork));
            Main_SetVBlankIntrCB(NULL, NULL);
            HBlankInterruptDisable();
            GX_DisableEngineALayers();
            GX_DisableEngineBLayers();
            GX_SetVisiblePlane(0);
            GXS_SetVisiblePlane(0);
            SetGXBanks();
            work->args = OverlayManager_GetArgs(man);
            work->skipCredits = FALSE;
            gSystem.screensFlipped = TRUE;
            GX_SwapDisplay();
            CreateOamAndObjResMgrs(work);
            ov76_021E6170(work);
            LoadCutsceneSpriteResources(work);
            G2dRenderer_SetSubSurfaceCoords(&work->g2dRender, 0, 0);
            G2dRenderer_SetMainSurfaceCoords(&work->g2dRender, 0, 256 * FX32_ONE);
            work->man = man;
            *state += 1;
        }
        break;
    case 1:
        work = OverlayManager_GetData(man);
        InitBgLayers(work);
        InitSprites(work);
        work->pageWork.msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, 0x1b8, HEAP_ID_CREDITS);
        work->pageWork.string = String_New(256, HEAP_ID_CREDITS);
        DisplayWindow(work);
        SetPageSysTasks(work);

        // Print game title
        ReadMsgDataIntoString(work->pageWork.msgData, GAME_TITLE_MSG_NO, work->pageWork.string);
        FillWindowPixelBuffer(&work->pageWork.window, 0);
        AddTextPrinterParameterized2(&work->pageWork.window, 0, work->pageWork.string, 0, 70, TEXT_SPEED_NOTRANSFER, 0x00010200, NULL);
        CopyWindowToVram(&work->pageWork.window);

        // Initialize to first line of the credits
        work->pageWork.pageState.line = 1;
        sub_02004EC4(0xe, 0x3f8, 1);
        Main_SetVBlankIntrCB((GFIntrCB)VBlankCB, work);
        *state += 1;
        break;
    case 2:
        work = OverlayManager_GetData(man);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 30, 1, HEAP_ID_CREDITS);
        return TRUE;
    }
    return FALSE;
}

BOOL CreditsApp_OvyExit(OVY_MANAGER *man, int *state) {
    CreditsAppWork *work = OverlayManager_GetData(man);

    switch (*state) {
    case 0:
        Main_SetVBlankIntrCB(NULL, NULL);
        *state += 1;
        break;
    case 1:
        PageWork *ptr = &work->pageWork;
        RemoveWindow(&ptr->window);
        DestroyMsgData(ptr->msgData);
        String_Delete(ptr->string);
        FreeBG(work);
        for (u8 i = 0; i < 6; i++) {
            FreeToHeap(work->unk468[i]);
            FreeToHeap(work->unk480[i]);
        }
        FreePageSysTasks(work);
        *state += 1;
        break;
    case 2:
        NARC_Delete(work->cutsceneWork.narc);
        ov76_021E62B4(work);
        FreeOamAndObjResMgrs(work);
        *state += 1;
        break;
    case 3:
        OverlayManager_FreeData(man);
        DestroyHeap(HEAP_ID_CREDITS);
        return TRUE;
    }
    return FALSE;
}

BOOL CreditsApp_OvyExec(OVY_MANAGER *man, int *state) {
    CreditsAppWork *work = OverlayManager_GetData(man);
    GF_ASSERT(work->timer < 0xffffffff);

    switch (*state) {
    case CREDITS_STATE_MAIN_FADE_IN:
        if (IsPaletteFadeFinished()) {
            *state += 1;
        }
        break;
    case CREDITS_STATE_MAIN:
        // No skipping on first playthrough
        if (work->args->gameCleared && ((gSystem.newKeys & PAD_BUTTON_START) || gSystem.touchNew != 0)) {
            work->skipCredits = TRUE;
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 30, 1, HEAP_ID_CREDITS);
            GF_SndStartFadeOutBGM(0, 26);
            *state += 1;
            break;
        }
        work->timer++;
        HandlePageDisplay(work);
        HandleSceneTransition(work);
        HandleSceneFlip(work);
        HandleCutscenes(work);
        if (work->timer < CREDITS_FRAMES) {
            break;
        }
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 30, 1, HEAP_ID_CREDITS);
        *state += 1;
        break;
    case CREDITS_STATE_MAIN_FADE_OUT:
        if (IsPaletteFadeFinished()) {
            if (work->skipCredits) {
                FreeCutsceneSprites(work);
            }
            // Load the "The End" screen
            GfGfxLoader_LoadCharData(NARC_a_2_6_3, 6, work->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_CREDITS);
            GfGfxLoader_LoadScrnData(NARC_a_2_6_3, 19, work->bgConfig, GF_BG_LYR_MAIN_1, 0, 0x600, TRUE, HEAP_ID_CREDITS);
            BgCommitTilemapBufferToVram(work->bgConfig, 1);
            GX_EngineAToggleLayers(GF_BG_LYR_MAIN_0_F, GX_LAYER_TOGGLE_OFF);
            GX_EngineAToggleLayers(GF_BG_LYR_MAIN_2_F, GX_LAYER_TOGGLE_OFF);
            GX_EngineAToggleLayers(GF_BG_LYR_MAIN_3_F, GX_LAYER_TOGGLE_OFF);
            GX_EngineAToggleLayers(16, GX_LAYER_TOGGLE_OFF);
            GX_EngineAToggleLayers(GF_BG_LYR_MAIN_1_F, GX_LAYER_TOGGLE_ON);
            gSystem.screensFlipped = FALSE;
            GX_SwapDisplay();

            // Start fading into the "The End" screen
            BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 1, 1, HEAP_ID_CREDITS);
            *state += 1;
        }
        break;
    case CREDITS_STATE_THE_END_FADE_IN:
        if (IsPaletteFadeFinished()) {
            work->musicBoxWaitTimer = 0;
            *state += 1;
        }
        break;
    case CREDITS_STATE_THE_END:
        if ((gSystem.newKeys & (PAD_BUTTON_START | PAD_BUTTON_A)) || gSystem.touchNew != 0) {
            BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 60, 1, HEAP_ID_CREDITS);
            *state = CREDITS_STATE_THE_END_FADE_OUT;
            break;
        }
        if (++work->musicBoxWaitTimer >= MUSIC_BOX_WAIT_FRAMES) {
            PlayBGM(SEQ_GS_ENDING2);
            *state += 1;
        }
        break;
    case CREDITS_STATE_THE_END_MUSIC_BOX:
        if ((gSystem.newKeys & (PAD_BUTTON_START | PAD_BUTTON_A)) || gSystem.touchNew != 0) {
            BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 60, 1, HEAP_ID_CREDITS);
            *state += 1;
        }
        break;
    case CREDITS_STATE_THE_END_FADE_OUT:
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
        break;
    }
    sub_0202457C(work->spriteList);
    return FALSE;
}

static void VBlankCB(CreditsAppWork *work) {
    DoScheduledBgGpuUpdates(work->bgConfig);
    OamManager_ApplyAndResetBuffers();
}

static void SetGXBanks(void) {
    GraphicsBanks banks = sCreditsGraphicsBanks;
    GX_SetBanks(&banks);
}

static void InitBgLayers(CreditsAppWork *work) {
    GraphicsModes modeSet;
    BgTemplate tmpl2;
    BgTemplate tmpl3;
    BgTemplate tmpl1;
    BgTemplate tmpl5;
    BgTemplate tmpl6;
    BgTemplate tmpl7;

    work->bgConfig = BgConfig_Alloc(HEAP_ID_CREDITS);
    G2_BlendNone();
    G2S_BlendNone();
    modeSet = ov76_021E6EB0;
    SetBothScreensModesAndDisable(&modeSet);

    tmpl2 = ov76_021E6F18;
    InitBgFromTemplate(work->bgConfig, 2, &tmpl2, 0);
    tmpl3 = ov76_021E6F34;
    InitBgFromTemplate(work->bgConfig, 3, &tmpl3, 0);
    tmpl1 = ov76_021E6F50;
    InitBgFromTemplate(work->bgConfig, 1, &tmpl1, 0);
    tmpl5 = ov76_021E6F6C;
    InitBgFromTemplate(work->bgConfig, 5, &tmpl5, 0);
    tmpl6 = ov76_021E6F88;
    InitBgFromTemplate(work->bgConfig, 6, &tmpl6, 0);
    tmpl7 = ov76_021E6FA4;
    InitBgFromTemplate(work->bgConfig, 7, &tmpl7, 0);

    LoadBgGraphics(work);
}

static void FreeBG(CreditsAppWork *work) {
    FreeBgTilemapBuffer(work->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(work->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(work->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(work->bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(work->bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(work->bgConfig, GF_BG_LYR_SUB_3);
    FreeToHeap(work->bgConfig);
}

static void LoadBgGraphics(CreditsAppWork *work) {
    ScrnFileIds temp1 = ov76_021E6EE8;
    ScrnFileIds temp2 = ov76_021E6F00;
    BgConfig *bgConfig = work->bgConfig;

    GfGfxLoader_LoadCharData(NARC_a_2_6_3, 5, bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_CREDITS);
    GfGfxLoader_LoadCharData(NARC_a_2_6_3, 5, bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_CREDITS);
    GfGfxLoader_GXLoadPal(NARC_a_2_6_3, 4, GF_BG_LYR_SUB_0, 0, 0xe0, HEAP_ID_CREDITS);
    GfGfxLoader_GXLoadPal(NARC_a_2_6_3, 4, GF_BG_LYR_MAIN_0, 0, 0xe0, HEAP_ID_CREDITS);
    for (u8 i = 0; i < 6; i++) {
        work->unk468[i] = GfGfxLoader_GetScrnData(NARC_a_2_6_3, temp1.ids[i], 1, &work->unk498[i], HEAP_ID_CREDITS);
        work->unk480[i] = GfGfxLoader_GetScrnData(NARC_a_2_6_3, temp2.ids[i], 1, &work->unk4B0[i], HEAP_ID_CREDITS);
    }

    BG_LoadScreenTilemapData(bgConfig, 2, work->unk498[0]->rawData, work->unk498[0]->szByte);
    BG_LoadScreenTilemapData(bgConfig, 3, work->unk4B0[0]->rawData, work->unk4B0[0]->szByte);
    BG_LoadScreenTilemapData(bgConfig, 6, work->unk498[0]->rawData, work->unk498[0]->szByte);
    BG_LoadScreenTilemapData(bgConfig, 7, work->unk4B0[0]->rawData, work->unk4B0[0]->szByte);
    ScheduleBgTilemapBufferTransfer(bgConfig, 2);
    ScheduleBgTilemapBufferTransfer(bgConfig, 3);
    ScheduleBgTilemapBufferTransfer(bgConfig, 6);
    ScheduleBgTilemapBufferTransfer(bgConfig, 7);
    GX_EngineAToggleLayers(GF_BG_LYR_MAIN_2, GX_LAYER_TOGGLE_OFF);
}

static void CreateOamAndObjResMgrs(CreditsAppWork *work) {
    UnkStruct_020215A0 temp;
    UnkOv021E60F6 temp2;

    reg_GX_DISPCNT = (reg_GX_DISPCNT & 0xffcfffef) | 0x00200010;
    reg_GXS_DB_DISPCNT = (reg_GXS_DB_DISPCNT & 0xffcfffef) | 0x00200010;
    temp = ov76_021E6EA0;
    sub_020215A0(&temp);
    sub_02022588(0xd, HEAP_ID_CREDITS);
    sub_020216C8();
    sub_02022638();
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 0x80, 0, 0x20, 0, 0x80, 0, 0x20, HEAP_ID_CREDITS);
    work->spriteList = G2dRenderer_Init(0x28, &work->g2dRender, HEAP_ID_CREDITS);

    temp2 = ov76_021E6E88[3];
    u8 *ptr =  (u8 *)&temp2;

    for (u8 i = GF_GFX_RES_TYPE_CHAR; i < GF_GFX_RES_TYPE_ANIM + 1; i++) {
        work->_2dGfxResMan[i] = Create2DGfxResObjMan(ptr[i], (GfGfxResType)i, HEAP_ID_CREDITS);
    }
}

static void FreeOamAndObjResMgrs(CreditsAppWork *work) {
    for (u8 i = GF_GFX_RES_TYPE_CHAR; i < GF_GFX_RES_TYPE_ANIM + 1; i++) {
        Destroy2DGfxResObjMan(work->_2dGfxResMan[i]);
    }
    sub_02024504(work->spriteList);
    OamManager_Free();
    sub_0202168C();
    sub_02022608();
}

static void ov76_021E6170(CreditsAppWork *work) {
    work->_2dGfxResObj[GF_GFX_RES_TYPE_CHAR] =
        AddCharResObjFromNarc(work->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], NARC_a_2_6_3, 1, TRUE, 1, 3, HEAP_ID_CREDITS);
    work->_2dGfxResObj[GF_GFX_RES_TYPE_PLTT] =
        AddPlttResObjFromNarc(work->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], NARC_a_2_6_3, 0, FALSE, 1, 3, 7, HEAP_ID_CREDITS);
    work->_2dGfxResObj[GF_GFX_RES_TYPE_CELL] =
        AddCellOrAnimResObjFromNarc(work->_2dGfxResMan[GF_GFX_RES_TYPE_CELL], NARC_a_2_6_3, 2, TRUE, 1, GF_GFX_RES_TYPE_CELL, HEAP_ID_CREDITS);
    work->_2dGfxResObj[GF_GFX_RES_TYPE_ANIM] =
        AddCellOrAnimResObjFromNarc(work->_2dGfxResMan[GF_GFX_RES_TYPE_ANIM], NARC_a_2_6_3, 3, TRUE, 1, GF_GFX_RES_TYPE_ANIM, HEAP_ID_CREDITS);
    work->cutsceneWork.narc = NARC_New(NARC_a_2_6_3, HEAP_ID_CREDITS);

    CutsceneWork *cutsceneWork = &work->cutsceneWork;
    NARC **narc = &cutsceneWork->narc;
    cutsceneWork->gender = work->args->gender;

    for (u8 i = 0; i < UNIQUE_SPRITES_PER_CUTSCENE; i++) {
        work->cutsceneRsrs[i].charResObj =
            AddCharResObjFromOpenNarc(work->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], *narc, 20, TRUE, i + 2, 1, HEAP_ID_CREDITS);
        work->cutsceneRsrs[i].plttResObj =
            AddPlttResObjFromOpenNarc(work->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], *narc, 149, FALSE, i + 2, 1, 1, HEAP_ID_CREDITS);
    }

    sub_0200ACF0(work->_2dGfxResObj[GF_GFX_RES_TYPE_CHAR]);
    sub_0200AF94(work->_2dGfxResObj[GF_GFX_RES_TYPE_PLTT]);

    for (u8 i = 0; i < UNIQUE_SPRITES_PER_CUTSCENE; i++) {
        sub_0200ACF0(work->cutsceneRsrs[i].charResObj);
        sub_0200AF94(work->cutsceneRsrs[i].plttResObj);
    }

    GX_EngineAToggleLayers(16, GX_LAYER_TOGGLE_ON);
    GX_EngineBToggleLayers(16, GX_LAYER_TOGGLE_ON);
}

static void ov76_021E62B4(CreditsAppWork *work) {
    sub_0200AEB0(work->_2dGfxResObj[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0A8(work->_2dGfxResObj[GF_GFX_RES_TYPE_PLTT]);

    for (u8 i = 0; i < 6; i++) {
        sub_0200AEB0(work->cutsceneRsrs[i].charResObj);
        sub_0200B0A8(work->cutsceneRsrs[i].plttResObj);
    }
}

static void InitSprites(CreditsAppWork *work) {
    SpriteResourcesHeader header;
    SpriteTemplate tmpl;

    u8 yIdx;

    SceneWork *ptr = &work->sceneWork;
    InitDancingSpriteResources(1, work, 1, NNS_G2D_VRAM_TYPE_MAX, &tmpl, &header);

    // Dancing Pokémon that start on top screen
    for (u8 i = 0; i < MONS_PER_SCREEN; i++) {
        if (i < MONS_PER_SCREEN / 2) {
            yIdx = i;
            tmpl.position.x = 16 * FX32_ONE;
        } else {
            yIdx = i - 3;
            tmpl.position.x = 240 * FX32_ONE;
        }

        tmpl.position.y = (yIdx * 80 + 16) * FX32_ONE;
        tmpl.priority = 1;
        ptr->pokemon[i] = CreateSprite(&tmpl);
        GF_ASSERT(ptr->pokemon[i] != NULL);
        Set2dSpriteAnimActiveFlag(ptr->pokemon[i], TRUE);
        Set2dSpriteVisibleFlag(ptr->pokemon[i], TRUE);
        Set2dSpriteAnimSeqNo(ptr->pokemon[i], 6);

        tmpl.priority = 0;
        ptr->cloud[i] = CreateSprite(&tmpl);
        GF_ASSERT(ptr->cloud[i] != NULL);
        Set2dSpriteAnimActiveFlag(ptr->cloud[i], TRUE);
        Set2dSpriteVisibleFlag(ptr->cloud[i], FALSE);
        Set2dSpriteAnimSeqNo(ptr->cloud[i], 7);
    }

    // Dancing Pokémon that start on bottom screen
    for (u8 i = 0; i < MONS_PER_SCREEN; i++) {
        if (i < MONS_PER_SCREEN / 2) {
            yIdx = i;
            tmpl.position.x = 16 * FX32_ONE;;
        } else {
            yIdx = i - 3;
            tmpl.position.x = 240 * FX32_ONE;
        }
        tmpl.position.y = (yIdx * 80 + 272) * FX32_ONE;
        tmpl.priority = 1;
        u8 idx = i + MONS_PER_SCREEN;
        ptr->pokemon[idx] = CreateSprite(&tmpl);
        Set2dSpriteAnimActiveFlag(ptr->pokemon[idx], TRUE);
        Set2dSpriteVisibleFlag(ptr->pokemon[idx], TRUE);
        Set2dSpriteAnimSeqNo(ptr->pokemon[idx], 6);

        tmpl.priority = 0;
        ptr->cloud[idx] = CreateSprite(&tmpl);
        Set2dSpriteAnimActiveFlag(ptr->cloud[idx], TRUE);
        Set2dSpriteVisibleFlag(ptr->cloud[idx], FALSE);
        Set2dSpriteAnimSeqNo(ptr->cloud[idx], 7);
    }

    InitCutsceneSprites(work);
    GX_EngineAToggleLayers(16, GX_LAYER_TOGGLE_ON);
    GX_EngineBToggleLayers(16, GX_LAYER_TOGGLE_ON);
}

static void InitDancingSpriteResources(int idx, CreditsAppWork *work, int sprtResPriority, int whichScreen, SpriteTemplate *tmpl, SpriteResourcesHeader *header) {
    CreateSpriteResourcesHeader(
        header, idx, idx, idx, idx, -1, -1, FALSE, sprtResPriority,
        work->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR],
        work->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT],
        work->_2dGfxResMan[GF_GFX_RES_TYPE_CELL],
        work->_2dGfxResMan[GF_GFX_RES_TYPE_ANIM],
        NULL, NULL);

    tmpl->spriteList = work->spriteList;
    tmpl->header = header;
    tmpl->position.x = 0;
    tmpl->position.y = 0;
    tmpl->position.z = 0;
    tmpl->scale.x = FX32_ONE;
    tmpl->scale.y = FX32_ONE;
    tmpl->scale.z = FX32_ONE;
    tmpl->rotation = 0;
    tmpl->priority = 0;
    tmpl->whichScreen = whichScreen;
    tmpl->heapId = HEAP_ID_CREDITS;
}

static void InitCutsceneSpriteResources(u8 idx, CreditsAppWork *work, u8 sprtResPriority, int whichScreen, SpriteTemplate *tmpl, SpriteResourcesHeader *header) {
    CutsceneSpriteGfx *ptr = &work->cutsceneWork.spriteGfx[idx];

    header->charData = NULL;
    header->plttProxy = ptr->plttProxy;
    header->imageProxy = ptr->imageProxy;
    header->cellData = ptr->cellDataBank;
    header->cellAnim = ptr->animDataBank;
    header->multiCellData = NULL;
    header->multiCellAnim = NULL;
    header->flag = 0;
    header->priority = sprtResPriority;

    tmpl->spriteList = work->spriteList;
    tmpl->header = header;
    tmpl->position.x = 0;
    tmpl->position.y = 0;
    tmpl->position.z = 0;
    tmpl->scale.x = FX32_ONE;
    tmpl->scale.y = FX32_ONE;
    tmpl->scale.z = FX32_ONE;
    tmpl->rotation = 0;
    tmpl->priority = 0;
    tmpl->whichScreen = whichScreen;
    tmpl->heapId = HEAP_ID_CREDITS;
}

static void SetPageSysTasks(CreditsAppWork *work) {
    PageWork *ptr = &work->pageWork;
    ptr->pageDisplayWork.sysTask = sub_0200E33C((UnkSysTaskFunc)TogglePageDisplayCB, &ptr->pageDisplayWork, 0);
    work->pageWork.scrFlipWork.sysTask = sub_0200E33C((UnkSysTaskFunc)FlipScreensCB, &work->pageWork.scrFlipWork, 1);
}

static void FreePageSysTasks(CreditsAppWork *work) {
    PageWork *ptr = &work->pageWork;
    DestroySysTask(ptr->pageDisplayWork.sysTask);
    ptr->pageDisplayWork.sysTask = NULL;

    DestroySysTask(work->pageWork.scrFlipWork.sysTask);
    work->pageWork.scrFlipWork.sysTask = NULL;
}

static void HandlePageDisplay(CreditsAppWork *work) {
    BOOL newPageFrame;
    PageWork *ptr;
    PageDisplayWork *ptr18;

    ptr = &work->pageWork;
    ptr18 = &ptr->pageDisplayWork;
    newPageFrame = FALSE;

    if (ptr->pageState.page < NUM_CREDIT_PAGES) {
        if (work->timer == sPageTimings[ptr->pageState.page].startTime) {
            newPageFrame = TRUE;
        }

        switch (ptr->pageState.state) {
        case PAGE_STATE_DISPLAY:
            if (++ptr->pageState.timer >= sPageTimings[ptr->pageState.page].duration) {
                ov76_021E6944(ptr18, work->bgConfig, TRUE);
                ptr->pageState.state = PAGE_STATE_END_DISPLAY;
                return;
            }
            break;
        case PAGE_STATE_NO_DISPLAY:
            if (newPageFrame) {
                ov76_021E6944(ptr18, work->bgConfig, FALSE);
                ptr->pageState.state = PAGE_STATE_LOAD_DISPLAY;
                return;
            }
            break;
        case PAGE_STATE_LOAD_DISPLAY:
            if (PageWindowRendering(ptr18) == FALSE) {
                ptr->pageState.timer = 0;
                ptr->pageState.state = PAGE_STATE_DISPLAY;
                return;
            }
            break;
        case PAGE_STATE_END_DISPLAY:
            if (PageWindowRendering(ptr18) == FALSE) {
                LoadPage(ptr);
                ptr->pageState.page++;
                ptr->pageState.state = PAGE_STATE_NO_DISPLAY;
            }
            break;
        }
    }
}

static void HandleSceneTransition(CreditsAppWork *work) {
    SceneWork *ptr = &work->sceneWork;
    BOOL transitionFrame = FALSE;

    if (ptr->transition.sceneIdx >= NUM_SCENES - 1) {
        return;
    }
    if (work->timer == sSceneTransitionTimings[ptr->transition.sceneIdx]) {
        transitionFrame = TRUE;
    }
    if (transitionFrame && ptr->transition.state == SCENE_TRANS_NONE) {
        ptr->transition.state = SCENE_TRANS_CLOUDS_APPEAR;
    }

    switch (ptr->transition.state) {
    case SCENE_TRANS_NONE:
        break;
    case SCENE_TRANS_CLOUDS_APPEAR:
        for (u8 i = 0; i < TOTAL_DANCING_MONS; i++) {
            Set2dSpriteVisibleFlag(ptr->cloud[i], TRUE);
            Set2dSpriteAnimSeqNo(ptr->cloud[i], 7);
        }
        ptr->transition.timer = 0;
        ptr->transition.state = SCENE_TRANS_SWITCH_BG;
        return;
    case SCENE_TRANS_SWITCH_BG:
        // After 1 frame, switch out the background and dancing Pokémon
        if (++ptr->transition.timer >= 1) {
            ptr->transition.sceneIdxDup = (ptr->transition.sceneIdxDup + 1) % NUM_SCENES;
            u8 idx = ptr->transition.sceneIdxDup;
            for (u8 i = 0; i < TOTAL_DANCING_MONS; i++) {
                Set2dSpriteAnimSeqNo(ptr->pokemon[i], sPokemonSpriteSeqNos[idx]);
            }

            BG_LoadScreenTilemapData(work->bgConfig, 7, work->unk4B0[idx]->rawData, work->unk4B0[idx]->szByte);
            ScheduleBgTilemapBufferTransfer(work->bgConfig, 7);

            BG_LoadScreenTilemapData(work->bgConfig, 6, work->unk498[idx]->rawData, work->unk498[idx]->szByte);
            ScheduleBgTilemapBufferTransfer(work->bgConfig, 6);

            BG_LoadScreenTilemapData(work->bgConfig, 3, work->unk4B0[idx]->rawData, work->unk4B0[idx]->szByte);
            ScheduleBgTilemapBufferTransfer(work->bgConfig, 3);

            BG_LoadScreenTilemapData(work->bgConfig, 2, work->unk498[idx]->rawData, work->unk498[idx]->szByte);
            ScheduleBgTilemapBufferTransfer(work->bgConfig, 2);

            ptr->transition.timer = 0;
            ptr->transition.state = SCENE_TRANS_CLOUDS_DISSIPATE;
            break;
        }
        break;
    case SCENE_TRANS_CLOUDS_DISSIPATE:
        if (++ptr->transition.timer >= 30) {
            for (u8 i = 0; i < TOTAL_DANCING_MONS; i++) {
                Set2dSpriteVisibleFlag(ptr->cloud[i], FALSE);
            }
            ptr->transition.timer = 0;
            ptr->transition.state = SCENE_TRANS_NONE;
            ptr->transition.sceneIdx++;
        }
        break;
    }
}

static void HandleSceneFlip(CreditsAppWork *work) {
    BOOL transitionFrame = FALSE;
    if (work->pageWork.scrFlipWork.count < 5) {
        if (work->timer == sScreenFlipTimings[work->pageWork.scrFlipWork.count]) {
            transitionFrame = TRUE;
        }
        if (transitionFrame) {
            ov76_021E68C8(work);
        }
    }
}

static void HandleCutscenes(CreditsAppWork *work) {
    CutsceneSprites *cutsceneSprites = &work->cutsceneWork.sprites;

    if (work->cutsceneWork.cutsceneIdx >= NUM_CUTSCENES) {
        return;
    }

    u8 count = 0;
    for (u8 i = 0; i < cutsceneSprites->count; i++) {
        if (work->timer == cutsceneSprites->sprite[i].activateTime) {
            ActivateSprite(cutsceneSprites->sprite[i].sprite);
        }
        if (sub_02024B68(cutsceneSprites->sprite[i].sprite) == 0) {
            count++;
        }
    }
    if (count == cutsceneSprites->count) {
        FreeCutsceneSprites(work);
        work->cutsceneWork.cutsceneIdx++;
        InitCutsceneSprites(work);
    }
}

static void ActivateSprite(Sprite *sprite) {
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteVisibleFlag(sprite, TRUE);
}

// Marks the scene transition for the SysTask callback.
static void ov76_021E68C8(CreditsAppWork *work) {
    ScreenFlipWork *ptr = &work->pageWork.scrFlipWork;
    ptr->transitionFrame = TRUE;
    ptr->count++;
}

static void FlipScreensCB(int a0, ScreenFlipWork *a1, int a2) {
    if (a1->transitionFrame) {
        a1->transitionFrame = FALSE;
        if (gSystem.screensFlipped == TRUE) {
            gSystem.screensFlipped = FALSE;
        } else {
            gSystem.screensFlipped = TRUE;
        }
        GX_SwapDisplay();
    }
}

static void DisplayWindow(CreditsAppWork *work) {
    AddWindow(work->bgConfig, &work->pageWork.window, &ov76_021E6E98);
    BG_FillCharDataRange(work->bgConfig, GF_BG_LYR_SUB_1, 0, 1, 0);
    LoadFontPal0(GF_BG_LYR_SUB_0, 0x1e0, HEAP_ID_CREDITS);
    GX_EngineBToggleLayers(GF_BG_LYR_MAIN_2, GX_LAYER_TOGGLE_ON);
}

static void ov76_021E6944(PageDisplayWork *a0, BgConfig *bgConfig, BOOL hidden) {
    u32 val;

    GF_ASSERT(a0->rendering == FALSE);
    GXS_SetVisibleWnd(3);
    val = ((reg_G2S_DB_WININ & ~0x3f) | 0x1e);
    reg_G2S_DB_WININ = val | 0x20;
    val = ((reg_G2S_DB_WININ & 0xffffc0ff) | 0x1e00);
    reg_G2S_DB_WININ = val | 0x2000;
    val = ((reg_G2S_DB_WINOUT & ~0x3f) | 0x1c);
    reg_G2S_DB_WINOUT = val | 0x20;
    a0->unk0 = 0;
    a0->rendering = TRUE;
    a0->hidden = hidden;
    a0->bgConfig = bgConfig;

    GX_EngineBToggleLayers(GF_BG_LYR_MAIN_2, GX_LAYER_TOGGLE_ON);
}

static BOOL PageWindowRendering(PageDisplayWork *a0) {
    return a0->rendering;
}

static void TogglePageDisplayCB(int a0, PageDisplayWork *a1, int a2) {
    int temp;
    int temp2;
    fx32 xPos;

    if (a1->rendering == FALSE) {
        return;
    }

    a1->unk0++;
    if (a1->hidden == FALSE) {
        temp2 = 0xff;
        temp = (1 - a1->unk0) * temp2;
    } else {
        temp = 0;
        temp2 = (1 - a1->unk0) * 0xff;
    }

    xPos = a1->unk0 * 0xff;
    if (a1->unk0 >= 1) {
        a1->rendering = FALSE;
        if (a1->hidden == FALSE) {
            GX_EngineBToggleLayers(GF_BG_LYR_MAIN_2, GX_LAYER_TOGGLE_ON);
        } else {
            GX_EngineBToggleLayers(GF_BG_LYR_MAIN_2, GX_LAYER_TOGGLE_OFF);
        }
    }
    ov76_021E6A34(temp, 0, temp2, 0xc0);
    BgSetPosTextAndCommit(a1->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_X, xPos);
}

static void ov76_021E6A34(int a0, int a1, int a2, int a3) {
    u16 temp;

    if (a0 == 0 && a2 == 0xff) {
        reg_G2S_DB_WIN1H = 1;
        temp = ((a1 << 8) & 0xff00) | (u8)a3;
        reg_G2S_DB_WIN1V = temp;
        reg_G2S_DB_WIN0H = 0x0100;
        reg_G2S_DB_WIN0V = temp;
        return;
    }

    reg_G2S_DB_WIN0H = ((a0 << 8) & 0xff00) | (u8)a2;
    reg_G2S_DB_WIN0V = (a1 << 8) & 0xff00 | (u8)a3;
}

static void LoadPage(PageWork *ptr) {
    u32 page_i;

    u16 nextPage = ptr->pageState.page + 1;
    if (nextPage >= NUM_CREDIT_PAGES) {
        return;
    }

    u16 cur_lines_page = sCreditMsgLines[ptr->pageState.line].page;
    FillWindowPixelBuffer(&ptr->window, 0);
    if (cur_lines_page == nextPage) {
        do {
            int msgno = sCreditMsgLines[ptr->pageState.line].msgno;
            u8 xPos = sCreditMsgLines[ptr->pageState.line].x;
            u8 yPos = sCreditMsgLines[ptr->pageState.line].y;
            ReadMsgDataIntoString(ptr->msgData, msgno, ptr->string);
            AddTextPrinterParameterized2(&ptr->window, 0, ptr->string, xPos, yPos, TEXT_SPEED_NOTRANSFER, 0x00010200, NULL);
            if (++ptr->pageState.line >= NELEMS(sCreditMsgLines)) {
                break;
            }
            page_i = sCreditMsgLines[ptr->pageState.line].page;
        } while (page_i == nextPage);
    }
    CopyWindowToVram(&ptr->window);
}

static void LoadCutsceneSpriteResources(CreditsAppWork *work) {
    CutsceneWork *cutsceneWork = &work->cutsceneWork;
    for (u8 i = 0; i < UNIQUE_SPRITES_PER_CUTSCENE; i++) {
        _2DGfxResObj *charResObj = work->cutsceneRsrs[i].charResObj;
        _2DGfxResObj *plttResObj = work->cutsceneRsrs[i].plttResObj;
        NNSG2dImageProxy *imageProxy = sub_0200AF00(charResObj);
        NNSG2dImagePaletteProxy *plttProxy = sub_0200B0F8(plttResObj, imageProxy);

        cutsceneWork->spriteGfx[i].imageProxy = imageProxy;
        cutsceneWork->spriteGfx[i].plttProxy = plttProxy;
        cutsceneWork->spriteGfx[i].charOffset = NNS_G2dGetImageLocation(imageProxy, NNS_G2D_VRAM_TYPE_2DMAIN);
        cutsceneWork->spriteGfx[i].plttOffset = NNS_G2dGetImagePaletteLocation(plttProxy, NNS_G2D_VRAM_TYPE_2DMAIN);
    }
}

static void LoadCutsceneSpriteGfx(CutsceneWork *a0, int spriteId) {
    int playerId;
    int friendId;
    BOOL playerCharacter = FALSE;
    BOOL friendCharacter = FALSE;

    NNSG2dCharacterData *ppCharData;
    NNSG2dPaletteData *ppPlttData;
    void *charData;
    void *plttData;

    if (spriteId == 5) {
        playerCharacter = TRUE;
        if (a0->gender == PLAYER_GENDER_FEMALE) {
            playerId = 7;
        } else {
            playerId = 5;
        }
    } else if (spriteId == 7) {
        friendCharacter = TRUE;
        if (a0->gender == PLAYER_GENDER_FEMALE) {
            friendId = 5;
        } else {
            friendId = 7;
        }
    }

    if (playerCharacter) {
        charData = GfGfxLoader_GetCharDataFromOpenNarc(a0->narc, sCutsceneSpriteGfxFileIds[playerId].charFileId, TRUE, &ppCharData, HEAP_ID_CREDITS);
        plttData = GfGfxLoader_GetPlttDataFromOpenNarc(a0->narc, sCutsceneSpriteGfxFileIds[playerId].plttFileId, &ppPlttData, HEAP_ID_CREDITS);
    } else if (friendCharacter) {
        charData = GfGfxLoader_GetCharDataFromOpenNarc(a0->narc, sCutsceneSpriteGfxFileIds[friendId].charFileId, TRUE, &ppCharData, HEAP_ID_CREDITS);
        plttData = GfGfxLoader_GetPlttDataFromOpenNarc(a0->narc, sCutsceneSpriteGfxFileIds[friendId].plttFileId, &ppPlttData, HEAP_ID_CREDITS);
    } else {
        charData = GfGfxLoader_GetCharDataFromOpenNarc(a0->narc, sCutsceneSpriteGfxFileIds[spriteId].charFileId, TRUE, &ppCharData, HEAP_ID_CREDITS);
        plttData = GfGfxLoader_GetPlttDataFromOpenNarc(a0->narc, sCutsceneSpriteGfxFileIds[spriteId].plttFileId, &ppPlttData, HEAP_ID_CREDITS);
    }

    DC_FlushRange(ppCharData->pRawData, ppCharData->szByte);
    int curSprite = a0->curSprite;
    GX_LoadOBJ(ppCharData->pRawData, a0->spriteGfx[curSprite].charOffset, ppCharData->szByte);

    DC_FlushRange(ppPlttData->pRawData, ppPlttData->szByte);
    curSprite = a0->curSprite;
    GX_LoadOBJPltt(ppPlttData->pRawData, a0->spriteGfx[curSprite].plttOffset, 0x20);

    a0->spriteGfx[a0->curSprite].unk2C = GfGfxLoader_GetCellBankFromOpenNarc(a0->narc, sCutsceneSpriteGfxFileIds[spriteId].cellBankFileId, TRUE, &a0->spriteGfx[a0->curSprite].cellDataBank, HEAP_ID_CREDITS);
    a0->spriteGfx[a0->curSprite].unk30 = GfGfxLoader_GetAnimBankFromOpenNarc(a0->narc, sCutsceneSpriteGfxFileIds[spriteId].animBankFileId, TRUE, &a0->spriteGfx[a0->curSprite].animDataBank, HEAP_ID_CREDITS);
    FreeToHeap(charData);
    FreeToHeap(plttData);
    a0->curSprite++;
}

static void CreateCutsceneSprite(CreditsAppWork *work, const CutsceneSpriteParam *spriteParam) {
    SpriteResourcesHeader header;
    SpriteTemplate tmpl;

    InitCutsceneSpriteResources(spriteParam->spriteIdx, work, 3, 1, &tmpl, &header);
    CutsceneSprites *sprites = &work->cutsceneWork.sprites;
    int idx = sprites->count;
    CutsceneSprite *cutsceneSprite = &sprites->sprite[idx];
    cutsceneSprite->unk0 = 1;
    cutsceneSprite->unk2 = spriteParam->unk0;

    // Render on non-primary display screen
    tmpl.position.x = spriteParam->xPos * FX32_ONE;
    tmpl.position.y = (spriteParam->yPos + 256) * FX32_ONE;
    tmpl.priority = 1;

    Sprite *sprite = CreateSprite(&tmpl);
    cutsceneSprite->sprite = sprite;
    GF_ASSERT(sprite != NULL);

    Set2dSpriteAnimActiveFlag(cutsceneSprite->sprite, FALSE);
    Set2dSpriteVisibleFlag(cutsceneSprite->sprite, FALSE);
    Set2dSpriteAnimSeqNo(cutsceneSprite->sprite, spriteParam->animSeqNo);
    cutsceneSprite->activateTime = spriteParam->activateTime;
    sprites->count++;
}

// Initialize sprites for the current cutscene.
static void InitCutsceneSprites(CreditsAppWork *work) {
    CutsceneWork *cutsceneWork = &work->cutsceneWork;
    u8 idx = cutsceneWork->cutsceneIdx;

    if (idx >= 16) {
        return;
    }

    const Cutscene *cutscene = &sCutscenes[idx];

    GF_ASSERT(cutscene->uniqueSprites <= UNIQUE_SPRITES_PER_CUTSCENE);
    for (u8 i = 0; i < cutscene->uniqueSprites; i++) {
        LoadCutsceneSpriteGfx(cutsceneWork, cutscene->spriteIds[i]);
    }

    u32 activateTime = 0xffffffff;
    GF_ASSERT(cutscene->totalSprites <= SPRITES_PER_CUTSCENE);
    for (u8 i = 0; i < cutscene->totalSprites; i++) {
        CreateCutsceneSprite(work, &cutscene->spriteParam[i]);
        if (activateTime > cutscene->spriteParam[i].activateTime) {
            activateTime = cutscene->spriteParam[i].activateTime;
        }
    }
    GF_ASSERT(activateTime > work->timer);
}

static void FreeCutsceneSprites(CreditsAppWork *work) {
    u8 i;
    CutsceneWork *cutsceneWork = &work->cutsceneWork;
    CutsceneSprites *sprites = &cutsceneWork->sprites;

    for (i = 0; i < 16; i++) {
        if (sprites->sprite[i].unk0 != 0) {
            Sprite_Delete(sprites->sprite[i].sprite);
            sprites->sprite[i].unk0 = 0;
            sprites->sprite[i].unk2 = 0;
        }
    }

    sprites->count = 0;
    for (i = 0; i < cutsceneWork->curSprite; i++) {
        FreeToHeap(cutsceneWork->spriteGfx[i].unk2C);
        FreeToHeap(cutsceneWork->spriteGfx[i].unk30);
        cutsceneWork->spriteGfx[i].cellDataBank = NULL;
        cutsceneWork->spriteGfx[i].animDataBank = NULL;
    }
    cutsceneWork->curSprite = 0;
}
