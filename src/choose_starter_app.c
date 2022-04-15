#include "unk_0203E348.h"
#include "unk_02022D74.h"
#include "camera_translation.h"
#include "unk_0200FA24.h"
#include "system.h"
#include "text.h"
#include "render_text.h"
#include "msgdata/msg/msg_0190.h"
#include "application/choose_starter/choose_starter_main_res.naix"
#include "application/choose_starter/choose_starter_sub_res.naix"
#include "sound.h"
#include "gf_3d_vramman.h"
#include "unk_02005D10.h"
#include "unk_02023694.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"
#include "unk_02026E30.h"
#include "unk_0201F4C4.h"
#include "unk_02009D48.h"
#include "unk_0200E398.h"
#include "unk_02025154.h"
#include "unk_02020B8C.h"
#include "unk_02013FDC.h"
#include "gf_gfx_loader.h"
#include "choose_starter_app.h"

#define HEAPID_STARTERCHOOSE       46

enum ChooseStarterInput {
    CHOOSE_STARTER_INPUT_NONE                    = 0,
    CHOOSE_STARTER_INPUT_CYCLE_CLOCKWISE         = 1,
    CHOOSE_STARTER_INPUT_CYCLE_COUNTERCLOCKWISE  = 2,
    CHOOSE_STARTER_INPUT_CONTINUE_LEFT           = 3,
    CHOOSE_STARTER_INPUT_CONTINUE_RIGHT          = 4,
    CHOOSE_STARTER_INPUT_SELECT_BALL_INIT        = 5,
    CHOOSE_STARTER_INPUT_CHOSE_STARTER           = 6,
    CHOOSE_STARTER_INPUT_CONFIRM_CHOICE          = 7,
    CHOOSE_STARTER_INPUT_BACKED_OUT              = 8,
};

enum ChooseStarterAppState {
    CHOOSE_STARTER_STATE_INIT              =  0,
    CHOOSE_STARTER_STATE_WAIT_FADE_IN      =  1,
    CHOOSE_STARTER_STATE_START_INIT_MSG    =  2,
    CHOOSE_STARTER_STATE_CONFIRM_MSG       =  3,
    CHOOSE_STARTER_STATE_WAIT_INIT_MSG     =  4,
    CHOOSE_STARTER_STATE_HANDLE_INPUT      =  5,
    CHOOSE_STARTER_STATE_ROTATE_MACHINE    =  6,
    CHOOSE_STARTER_STATE_ZOOM_IN           =  7,
    CHOOSE_STARTER_STATE_WAIT_ZOOM_IN      =  8,
    CHOOSE_STARTER_STATE_BACK_OUT          =  9,
    CHOOSE_STARTER_STATE_ZOOM_AND_FADE_OUT = 10,
    CHOOSE_STARTER_STATE_WAIT_FADE_OUT     = 11,
    CHOOSE_STARTER_STATE_WAIT_AND_EXIT     = 12,
};

#define WOBBLE_STATE_NORMAL        0
#define WOBBLE_STATE_PAUSE         2

enum ChooseStarter3dResNum {
    CS_3DRES_BALL_EF             = 0,
    CS_3DRES_TABLETOP            = 1,
    CS_3DRES_TURNTABLE           = 2,
    CS_3DRES_BALLS               = 3,
    CS_3DRES_MAX
};

enum ChooseStarterModel {
    CS_MODEL_TT_BALL_EF          = 0,
    CS_MODEL_TABLETOP            = 1,
    CS_MODEL_TURNTABLE           = 2,
    CS_MODEL_BALL1               = 3,
    CS_MODEL_BALL2               = 4,
    CS_MODEL_BALL3               = 5,
    CS_MODEL_MAX
};

enum ChooseStarterAnim {
    CS_ANIM_BALL1_ROCK           = 0,
    CS_ANIM_BALL2_ROCK           = 1,
    CS_ANIM_BALL3_ROCK           = 2,
    CS_ANIM_BALL_OPEN            = 3,
    CS_ANIM_TT_BALL_EF           = 4,
    CS_ANIM_TURNTABLE            = 5, // material anim
    CS_ANIM_MAX
};

#define MODEL_ANM_STATE_IDLE          0
#define MODEL_ANM_STATE_BALL_OPEN     1
#define MODEL_ANM_STATE_BALL_ROCK     2

#define SELECT_STATE_NULL             0
#define SELECT_STATE_INSPECT          1
#define SELECT_STATE_CONFIRM          2

#define BALL_ROCK_AMPLITUDE_BOTH      0
#define BALL_ROCK_AMPLITUDE_BIG       1
#define BALL_ROCK_AMPLITUDE_SMALL     2

#define CAMERA_PATH_NULL              0
#define CAMERA_PATH_OUT               1
#define CAMERA_PATH_IN                2

#define CAM_ANGLE_X_OUT            (FX_DEG_TO_IDX(FX32_CONST(-49.57)))
#define CAM_PERSP_OUT              (FX_DEG_TO_IDX(FX32_CONST(24.805)))
#define CAM_POSITION_OUT           ((VecFx32){0, 0, 14 * FX32_ONE})
#define CAM_DISTANCE_OUT           (100 * FX32_ONE)

#define CAM_ANGLE_X_IN             (FX_DEG_TO_IDX(FX32_CONST(-30.76)))
#define CAM_PERSP_IN               (FX_DEG_TO_IDX(FX32_CONST(22.7)))
#define CAM_POSITION_IN            ((VecFx32){0, 0, 12 * FX32_ONE})
#define CAM_DISTANCE_IN            (60 * FX32_ONE)

#define BALL_Y_ANGLE_OUT           (-FX_DEG_TO_IDX(FX32_CONST(0)))
#define BALL_Y_ANGLE_IN            (-FX_DEG_TO_IDX(FX32_CONST(30.76)))

#define CAM_MOVE_STEP_MAX          (8)

struct ChooseStarterRnd {
    NNSG3dRenderObj obj;
    u32 filler_54[4/sizeof(u32)];
    BOOL active;
    VecFx32 translVec;
    VecFx32 scaleVec;
    u16 yRotAngle;
    u16 xRotAngle;
}; // size=0x78

struct ChooseStarterAnm {
    void *hdr;
    NNSG3dAnmObj *obj;
};

struct StarterChooseMonObjResPtrs {
    struct _2DGfxResObj *charResObj;
    struct _2DGfxResObj *plttResObj;
    struct _2DGfxResObj *cellResObj;
    struct _2DGfxResObj *animResObj;
    struct _2DGfxResObj *multiCellResObj;
    struct _2DGfxResObj *multiCellAnmResObj;
};

struct StarterChooseMonSpriteData {
    struct _2DGfxResMan *charResMan;
    struct _2DGfxResMan *plttResMan;
    struct _2DGfxResMan *cellResMan;
    struct _2DGfxResMan *animResMan;
    struct _2DGfxResMan *multiCellResMan; //unused
    struct _2DGfxResMan *multiCellAnmResMan; //unused
    struct StarterChooseMonObjResPtrs objs[3];
    void *charDatas[3];
    void *plttDatas[3];
    struct SomeDrawPokemonStruct param;
    SpriteList *spriteList;
    GF_G2dRenderer g2dRender;
    struct Sprite *sprites[3];
};

struct ChooseStarter3dRes {
    NNSG3dResFileHeader *header;
    NNSG3dResMdlSet *mdlSet;
    NNSG3dResMdl *mdl;
    NNSG3dResTex *tex;
};

struct ChooseStarterAppWork {
    u8 filler_000[0x4];
    HeapID heapId;
    BGCONFIG *bgConfig;
    struct GF3DVramMan *_3dMan;
    GF_Camera *camera;
    VecFx32 cameraTarget;
    NNSFndAllocator allocator; // 020
    struct ChooseStarter3dRes _3dObjRes[CS_3DRES_MAX];
    struct ChooseStarterRnd _3dObjRender[CS_MODEL_MAX];
    struct ChooseStarterAnm _3dObjAnm[CS_ANIM_MAX];
    VecFx32 positions[3];
    u32 curSelection;
    fx16 rotationAngle;
    fx16 rotationSpeed;
    WINDOW *winTop;
    WINDOW *winBottom;
    u8 frame; // 3A4
    u8 textSpeed;
    u8 subPrinterId;
    u8 ballTransStep;
    int state;
    int ballWobbleState;
    STRING *strbuf;
    struct StarterChooseMonSpriteData monSpriteData;
    GFCameraTranslationWrapper *cameraTranslation;
    POKEMON *choices[3]; // 578
    int modelAnimState;
    GXRgb edgeColorTable[8];
}; // size=0x598

static void freeAllMonSprite2dResObj(struct StarterChooseMonSpriteData *a0);
static void vBlankCB(struct ChooseStarterAppWork *work);
static void setGxBanks(void);
static void createOamManager(HeapID heapId);
static void init3dEngine(struct ChooseStarterAppWork *work);
static void update3dObjectsMain(struct ChooseStarterAppWork *work);
static inline void id_roty_mtx33(MtxFx33 *mtx, u16 index);
static void updateBaseAndBallsRotation(struct ChooseStarterAppWork *work);
static void initBgLayers(BGCONFIG *bgConfig, HeapID heapId);
static void initCameraPosition(struct ChooseStarterAppWork *work);
static void createObjResMans(struct ChooseStarterAppWork *work);
static void initObjRenderers(struct ChooseStarterAppWork *work);
static void freeAll3dAnmObj(struct ChooseStarterAppWork *work);
static void freeAll3dResHeader(struct ChooseStarterAppWork *work);
static void load3dModelResourceFromNarc(struct ChooseStarter3dRes *res, int fileId, HeapID heapId);
static void init3dModelRender(struct ChooseStarterRnd *rnd, struct ChooseStarter3dRes *res);
static void loadAnmFromNarc(int fileId, HeapID heapId, NNSFndAllocator *allocator, struct ChooseStarter3dRes *res, struct ChooseStarterAnm *anm);
static void addAnmObjToRenderObj(struct ChooseStarterRnd *rnd, struct ChooseStarterAnm *anm);
static void removeAnmObjFromRenderObj(struct ChooseStarterRnd *rnd, struct ChooseStarterAnm *anm);
static BOOL advance3dAnmFrameAndCheckFinished(struct ChooseStarterAnm *anm);
static void advance3dAnmFrameLooped(struct ChooseStarterAnm *anm, int selectState);
static inline struct ChooseStarterAnm *GetAnmByIdx(struct ChooseStarterAppWork *work, u8 idx);
static void advanceSelectedBallShakingAnim(struct ChooseStarterAppWork *work);
static BOOL selectedBallIsInSmallWobbleState(struct ChooseStarterAppWork *work);
static void free3dResHeader(struct ChooseStarter3dRes *res);
static void free3dAnmObj(struct ChooseStarterAnm *anm, NNSFndAllocator *alloc);
static void rendererTranslVecSet(struct ChooseStarterRnd *rnd, fx32 x, fx32 y, fx32 z);
static void rendererScaleVecSet(struct ChooseStarterRnd *rnd, fx32 x, fx32 y, fx32 z);
static void initBallModelPositions(struct ChooseStarterAppWork *work);
static void updateModelPositionAndRotation(struct ChooseStarterRnd *render);
static void calculateModelPositionAndRotation(struct ChooseStarterRnd *render, MtxFx43 *mtx);
static BOOL updateBaseRotation(struct ChooseStarterAppWork *work, fx16 speed);
static void reinitBallModelPosInDirection(struct ChooseStarterAppWork *work, int direction);
static void makeAndDrawWindows(struct ChooseStarterAppWork *work);
static void loadBgGraphics(BGCONFIG *bgConfig, HeapID heapId);
static u8 printMsgOnWinEx(WINDOW *window, HeapID heapId, BOOL makeFrame, s32 msgBank, int msgno, u32 color, u32 speed, STRING **out);
static void printMsgOnBottom(struct ChooseStarterAppWork *work, int msgId);
static void freeWindow(WINDOW *window);
static int getInput(struct ChooseStarterAppWork *work);
static int getRotateDirection(int a0, u8 a1, int a2);
static int getTappedBallId(VecFx32 *vecs, VecFx32 *near, VecFx32 *far, fx32 radius);
static void createMonSprites(struct ChooseStarterAppWork *work);
static void loadOneMonObj(struct _2DGfxResMan *charResMan, struct _2DGfxResMan *plttResMan, void *charData, void *plttData, u8 idx);
static void createOneMonRender(struct StarterChooseMonSpriteData *pMonSpriteData, u8 idx, HeapID heapId);
static void setAllButSelectedMonSpritesInvisible(struct ChooseStarterAppWork *work);
static void setAllMonSpritesInvisible(struct StarterChooseMonSpriteData *a0);
static BOOL yRotateSelectedBall(struct ChooseStarterAppWork *work, fx32 from, fx32 to);
static u16 calcBallTranslationArcStep(const fx32 *from, const fx32 *to, int step, int max);

BOOL ChooseStarterApplication_OvyInit(OVY_MANAGER *ovy, int *state_p) {
    struct ChooseStarterAppWork *work;
    struct ChooseStarterAppData *parent;
    int i;

    CreateHeap(3, HEAPID_STARTERCHOOSE, 0x40000);
    work = OverlayManager_CreateAndGetData(ovy, sizeof(struct ChooseStarterAppWork), HEAPID_STARTERCHOOSE);
    MI_CpuClear8(work, sizeof(struct ChooseStarterAppWork));
    work->heapId = HEAPID_STARTERCHOOSE;
    GF_ExpHeap_FndInitAllocator(&work->allocator, HEAPID_STARTERCHOOSE, 0x20);
    parent = OverlayManager_GetParentWork(ovy);
    work->frame = Options_GetFrame(parent->options);
    for (i = 0; i < 3; i++) {
        work->choices[i] = &parent->starters[i];
    }
    work->textSpeed = 1;
    Main_SetVBlankIntrCB((GFIntrCB)vBlankCB, work);
    HBlankInterruptDisable();
    setGxBanks();
    createOamManager(work->heapId);
    init3dEngine(work);
    work->bgConfig = BgConfig_Alloc(work->heapId);

    {
        struct GFBgModeSet bgModeSet;

        bgModeSet.dispMode = GX_DISPMODE_GRAPHICS;
        bgModeSet.bgModeMain = GX_BGMODE_0;
        bgModeSet.bgModeSub = GX_BGMODE_1;
        bgModeSet._2d3dSwitch = GX_BG0_AS_3D;

        SetBothScreensModesAndDisable(&bgModeSet);
    }

    initBgLayers(work->bgConfig, work->heapId);
    GX_EngineAToggleLayers(1, GX_LAYER_TOGGLE_ON);
    GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_OFF);
    GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_OFF);
    gSystem.screensFlipped = TRUE;
    GX_SwapDisplay();
    ResetAllTextPrinters();
    makeAndDrawWindows(work);
    loadBgGraphics(work->bgConfig, work->heapId);
    createObjResMans(work);
    initObjRenderers(work);
    work->camera = GF_Camera_Create(work->heapId);
    work->cameraTranslation = CreateCameraTranslationWrapper(work->heapId, work->camera);
    initCameraPosition(work);
    initBallModelPositions(work);
    createMonSprites(work);
    TextFlags_SetCanABSpeedUpPrint(FALSE);
    sub_02002B50(TRUE);
    sub_02002B8C(FALSE);
    return TRUE;
}

static const int sSpecies[] = {
    SPECIES_CHIKORITA,
    SPECIES_CYNDAQUIL,
    SPECIES_TOTODILE,
};

BOOL ChooseStarterApplication_OvyExec(OVY_MANAGER *ovy, int *state) {
    struct ChooseStarterAppWork *work = OverlayManager_GetData(ovy);
    int cameraPathSel = CAMERA_PATH_NULL;
    int input;
    switch (*state) {
    case CHOOSE_STARTER_STATE_INIT:
        printMsgOnBottom(work, msg_0190_00007);
        GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_OFF);
        GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_OFF);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, work->heapId);
        *state = CHOOSE_STARTER_STATE_WAIT_FADE_IN;
        break;
    case CHOOSE_STARTER_STATE_WAIT_FADE_IN:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        *state = CHOOSE_STARTER_STATE_START_INIT_MSG;
        break;
    case CHOOSE_STARTER_STATE_START_INIT_MSG:
        if (!IsCameraTranslationFinished(work->cameraTranslation)) {
            break;
        }
        work->subPrinterId = printMsgOnWinEx(work->winTop, work->heapId, TRUE, NARC_msg_msg_0190_bin, msg_0190_00000, MakeTextColor(1, 2, 15), work->textSpeed, &work->strbuf);
        GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_OFF);
        GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_OFF);
        *state = CHOOSE_STARTER_STATE_WAIT_INIT_MSG;
        break;
    case CHOOSE_STARTER_STATE_CONFIRM_MSG:
        work->subPrinterId = printMsgOnWinEx(work->winTop, work->heapId, TRUE, NARC_msg_msg_0190_bin, msg_0190_00001 + work->curSelection, MakeTextColor(1, 2, 15), work->textSpeed, &work->strbuf);
        printMsgOnBottom(work, msg_0190_00008);
        GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_ON);
        GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_ON);
        *state = CHOOSE_STARTER_STATE_WAIT_INIT_MSG;
        break;
    case CHOOSE_STARTER_STATE_WAIT_INIT_MSG:
        if (TextPrinterCheckActive(work->subPrinterId)) {
            break;
        }
        String_dtor(work->strbuf);
        work->strbuf = NULL;
        *state = CHOOSE_STARTER_STATE_HANDLE_INPUT;
        break;
    case CHOOSE_STARTER_STATE_HANDLE_INPUT:
        if (!IsCameraTranslationFinished(work->cameraTranslation)) {
            break;
        }
        input = getInput(work);
        switch (input) {
        case CHOOSE_STARTER_INPUT_BACKED_OUT:
            cameraPathSel = CAMERA_PATH_OUT;
            break;
        case CHOOSE_STARTER_INPUT_CONFIRM_CHOICE:
            cameraPathSel = CAMERA_PATH_IN;
            break;
        }
        switch (input) {
        case CHOOSE_STARTER_INPUT_SELECT_BALL_INIT:
            work->modelAnimState = MODEL_ANM_STATE_BALL_ROCK;
            {
                STRING *baseTrans = NULL;
                printMsgOnWinEx(work->winTop, work->heapId, FALSE, NARC_msg_msg_0190_bin, msg_0190_00004 + work->curSelection,
                              MakeTextColor(1, 2, 15), 0, &baseTrans);
                String_dtor(baseTrans);
            }
            PlayCry(sSpecies[work->curSelection], FALSE);
            printMsgOnBottom(work, msg_0190_00007);
            GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_ON);
            GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_ON);
            setAllButSelectedMonSpritesInvisible(work);
            *state = CHOOSE_STARTER_STATE_HANDLE_INPUT;
            break;
        case CHOOSE_STARTER_INPUT_CYCLE_CLOCKWISE:
        case CHOOSE_STARTER_INPUT_CONTINUE_LEFT:
            work->rotationSpeed = FX16_CONST(-0.5);
            *state = CHOOSE_STARTER_STATE_ROTATE_MACHINE;
            PlaySE_SetPitch(0x607, -0x200);
            break;
        case CHOOSE_STARTER_INPUT_CYCLE_COUNTERCLOCKWISE:
        case CHOOSE_STARTER_INPUT_CONTINUE_RIGHT:
            work->rotationSpeed = FX16_CONST(0.5);
            *state = CHOOSE_STARTER_STATE_ROTATE_MACHINE;
            PlaySE_SetPitch(0x607, -0x200);
            break;
        case CHOOSE_STARTER_INPUT_CONFIRM_CHOICE:
            GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_OFF);
            GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_OFF);
            *state = CHOOSE_STARTER_STATE_ZOOM_IN;
            break;
        case CHOOSE_STARTER_INPUT_CHOSE_STARTER:
            removeAnmObjFromRenderObj(&work->_3dObjRender[work->curSelection + 3], &work->_3dObjAnm[work->curSelection]);
            addAnmObjToRenderObj(&work->_3dObjRender[work->curSelection + 3], &work->_3dObjAnm[CS_ANIM_BALL_OPEN]);
            addAnmObjToRenderObj(&work->_3dObjRender[CS_MODEL_TT_BALL_EF], &work->_3dObjAnm[CS_ANIM_TT_BALL_EF]);
            work->_3dObjRender[CS_MODEL_TT_BALL_EF].active = TRUE;
            *state = CHOOSE_STARTER_STATE_ZOOM_AND_FADE_OUT;
            break;
        case CHOOSE_STARTER_INPUT_BACKED_OUT:
            if (work->state == SELECT_STATE_CONFIRM) {
                work->modelAnimState = MODEL_ANM_STATE_IDLE;
                printMsgOnBottom(work, msg_0190_00007);
                GX_EngineAToggleLayers(2, 0);
                GX_EngineAToggleLayers(4, 0);
                setAllMonSpritesInvisible(&work->monSpriteData);
                work->state = SELECT_STATE_NULL;
                *state = CHOOSE_STARTER_STATE_BACK_OUT;
            }
            break;
        }
        break;
    case CHOOSE_STARTER_STATE_ROTATE_MACHINE:
        if (!updateBaseRotation(work, work->rotationSpeed)) {
            break;
        }
        work->modelAnimState = MODEL_ANM_STATE_BALL_ROCK;
        {
            STRING *sp10 = NULL;
            printMsgOnWinEx(work->winTop, work->heapId, FALSE, NARC_msg_msg_0190_bin, msg_0190_00004 + work->curSelection, MakeTextColor(1, 2, 15), 0, &sp10);
            String_dtor(sp10);
        }
        PlayCry(sSpecies[work->curSelection], 0);
        if (work->state != SELECT_STATE_INSPECT) {
            GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_ON);
            GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_ON);
        }
        setAllButSelectedMonSpritesInvisible(work);
        work->state = SELECT_STATE_INSPECT;
        *state = CHOOSE_STARTER_STATE_HANDLE_INPUT;
        break;
    case CHOOSE_STARTER_STATE_ZOOM_IN:
        if (!yRotateSelectedBall(work, BALL_Y_ANGLE_OUT, BALL_Y_ANGLE_IN)) {
            break;
        }
        setAllButSelectedMonSpritesInvisible(work);
        *state = CHOOSE_STARTER_STATE_WAIT_ZOOM_IN;
        break;
    case CHOOSE_STARTER_STATE_WAIT_ZOOM_IN:
        // Wait until the ball becomes locked in a
        // small wobble state.
        if (!selectedBallIsInSmallWobbleState(work)) {
            break;
        }
        work->state = SELECT_STATE_CONFIRM;
        *state = CHOOSE_STARTER_STATE_CONFIRM_MSG;
        break;
    case CHOOSE_STARTER_STATE_BACK_OUT:
        if (!yRotateSelectedBall(work, BALL_Y_ANGLE_IN, BALL_Y_ANGLE_OUT)) {
            break;
        }
        reinitBallModelPosInDirection(work, 0);
        *state = 2;
        break;
    case CHOOSE_STARTER_STATE_ZOOM_AND_FADE_OUT:
        BeginNormalPaletteFade(4, 0, 0, RGB_WHITE, 10, 1, work->heapId);
        work->modelAnimState = MODEL_ANM_STATE_BALL_OPEN;
        {
            struct CameraTranslationPathTemplate template;

            template.angleX = CAM_ANGLE_X_OUT;
            template.perspectiveAngle = CAM_PERSP_OUT;
            template.position = CAM_POSITION_OUT;
            template.distance = CAM_DISTANCE_OUT;

            SetCameraTranslationPath(work->cameraTranslation, &template, 8);
        }
        *state = CHOOSE_STARTER_STATE_WAIT_FADE_OUT;
        PlaySE(SEQ_SE_DP_W025);
        break;
    case CHOOSE_STARTER_STATE_WAIT_FADE_OUT:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        BeginNormalPaletteFade(3, 0, 0, RGB_WHITE, 16, 1, work->heapId);
        *state = CHOOSE_STARTER_STATE_WAIT_AND_EXIT;
        break;
    case CHOOSE_STARTER_STATE_WAIT_AND_EXIT:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        return TRUE;
    }

    {
        struct CameraTranslationPathTemplate template;

        if (cameraPathSel != CAMERA_PATH_NULL) {
            if (cameraPathSel == CAMERA_PATH_OUT) {
                template.angleX = CAM_ANGLE_X_OUT;
                template.perspectiveAngle = CAM_PERSP_OUT;
                template.position = CAM_POSITION_OUT;
                template.distance = CAM_DISTANCE_OUT;
                work->ballWobbleState = BALL_ROCK_AMPLITUDE_BOTH;
            } else {
                template.angleX = CAM_ANGLE_X_IN;
                template.perspectiveAngle = CAM_PERSP_IN;
                template.position = CAM_POSITION_IN;
                template.distance = CAM_DISTANCE_IN;
                work->ballWobbleState = BALL_ROCK_AMPLITUDE_SMALL;
            }
            SetCameraTranslationPath(work->cameraTranslation, &template, 8);
        }
    }
    if (work->modelAnimState == MODEL_ANM_STATE_BALL_OPEN) {
        // Open the ball
        advance3dAnmFrameAndCheckFinished(&work->_3dObjAnm[CS_ANIM_BALL_OPEN]);
        advance3dAnmFrameAndCheckFinished(&work->_3dObjAnm[CS_ANIM_TT_BALL_EF]);
    } else if (work->modelAnimState == MODEL_ANM_STATE_BALL_ROCK) {
        // Rock selected ball and hold others still
        advanceSelectedBallShakingAnim(work);
    } else {
        // Stop all ball rocking animation
        NNS_G3dAnmObjSetFrame(work->_3dObjAnm[CS_ANIM_BALL1_ROCK].obj, 0);
        NNS_G3dAnmObjSetFrame(work->_3dObjAnm[CS_ANIM_BALL2_ROCK].obj, 0);
        NNS_G3dAnmObjSetFrame(work->_3dObjAnm[CS_ANIM_BALL3_ROCK].obj, 0);
    }

    // Turntable blinking lights anim
    {
        struct ChooseStarterAnm *anm = &work->_3dObjAnm[CS_ANIM_TURNTABLE];
        anm->obj->frame += FX32_ONE;
        if (anm->obj->frame >= NNS_G3dAnmObjGetNumFrame(anm->obj)) {
            NNS_G3dAnmObjSetFrame(anm->obj, 0);
        }
    }
    update3dObjectsMain(work);
    return FALSE;
}

BOOL ChooseStarterApplication_OvyExit(OVY_MANAGER *ovy, int *state) {
    struct ChooseStarterAppWork *work = OverlayManager_GetData(ovy);
    struct ChooseStarterAppData *data = OverlayManager_GetParentWork(ovy);

    TextFlags_SetCanABSpeedUpPrint(FALSE);
    sub_02002B50(FALSE);
    sub_02002B8C(FALSE);
    data->cursorPos = work->curSelection;
    Main_SetVBlankIntrCB(NULL, NULL);
    DeleteCameraTranslationWrapper(work->cameraTranslation);
    sub_02023120(work->camera);
    freeAll3dAnmObj(work);
    freeAll3dResHeader(work);
    freeAllMonSprite2dResObj(&work->monSpriteData);
    sub_02024504(work->monSpriteData.spriteList);
    Destroy2DGfxResObjMan(work->monSpriteData.charResMan);
    Destroy2DGfxResObjMan(work->monSpriteData.plttResMan);
    Destroy2DGfxResObjMan(work->monSpriteData.cellResMan);
    Destroy2DGfxResObjMan(work->monSpriteData.animResMan);
    OamManager_Free();
    sub_0202168C();
    sub_02022608();
    freeWindow(work->winTop);
    freeWindow(work->winBottom);
    FreeBgTilemapBuffer(work->bgConfig, 1);
    FreeBgTilemapBuffer(work->bgConfig, 2);
    FreeBgTilemapBuffer(work->bgConfig, 4);
    FreeBgTilemapBuffer(work->bgConfig, 5);
    FreeBgTilemapBuffer(work->bgConfig, 6);
    FreeToHeap(work->bgConfig);
    GF_3DVramMan_Delete(work->_3dMan);
    OverlayManager_FreeData(ovy);
    DestroyHeap(HEAPID_STARTERCHOOSE);
    return TRUE;
}

static void freeAllMonSprite2dResObj(struct StarterChooseMonSpriteData *a0) {
    int i;

    for (i = 0; i < 3; i++) {
        sub_0200AEB0(a0->objs[i].charResObj);
        sub_0200B0A8(a0->objs[i].plttResObj);
        DestroySingle2DGfxResObj(a0->charResMan, a0->objs[i].charResObj);
        DestroySingle2DGfxResObj(a0->plttResMan, a0->objs[i].plttResObj);
        DestroySingle2DGfxResObj(a0->cellResMan, a0->objs[i].cellResObj);
        DestroySingle2DGfxResObj(a0->animResMan, a0->objs[i].animResObj);
        FreeToHeap(a0->charDatas[i]);
        FreeToHeap(a0->plttDatas[i]);
    }
}

static void vBlankCB(struct ChooseStarterAppWork *work) {
    OamManager_ApplyAndResetBuffers();
    BgConfig_HandleScheduledScrollAndTransferOps(work->bgConfig);
}

static void setGxBanks(void) {
    const struct GXBanksConfig cfg = {
        GX_VRAM_BG_80_EF,
        GX_VRAM_BGEXTPLTT_NONE,
        GX_VRAM_SUB_BG_128_C,
        GX_VRAM_SUB_BGEXTPLTT_NONE,
        GX_VRAM_OBJ_NONE,
        GX_VRAM_OBJEXTPLTT_NONE,
        GX_VRAM_SUB_OBJ_16_I,
        GX_VRAM_SUB_OBJEXTPLTT_NONE,
        GX_VRAM_TEX_01_AB,
        GX_VRAM_TEXPLTT_0_G,
    };
    GX_SetBanks(&cfg);
}

static void createOamManager(HeapID heapId) {
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 0x80, 0, 0x20, 0, 0x80, 0, 0x20, heapId);
    {
        struct UnkStruct_020215A0 baseTrans = {
            3,
            0,
            0x2800,
            0
        };
        baseTrans.heapId = heapId;
        sub_020215C0(&baseTrans, 0x200010, 0x10);
    }
    sub_02022588(3, heapId);
    sub_020216C8();
    sub_02022638();
}

static void init3dEngine(struct ChooseStarterAppWork *work) {
    int i;
    work->_3dMan = GF_3DVramMan_Create(work->heapId, 0, 2, 0, 4, NULL);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_EdgeMarking(TRUE);
    for (i = 0; i < 8; i++) {
        work->edgeColorTable[i] = GX_RGB(4, 4, 4);
    }
    G3X_SetEdgeColorTable(work->edgeColorTable);
    G3X_SetClearColor(GX_RGB(31, 31, 16), 0, 0x7FFF, 0x3F, FALSE);
    NNS_G3dGlbLightVector(GX_LIGHTID_0, 0, -FX16_ONE, 0);
    NNS_G3dGlbLightColor(GX_LIGHTID_0, RGB_WHITE);
    NNS_G3dGlbMaterialColorDiffAmb(RGB_WHITE, RGB_WHITE, FALSE);
    NNS_G3dGlbMaterialColorSpecEmi(RGB_WHITE, RGB_WHITE, FALSE);
}

static void update3dObjectsMain(struct ChooseStarterAppWork *work) {
    sub_0202457C(work->monSpriteData.spriteList);
    sub_02026E48();
    NNS_G3dGePushMtx();
    sub_02023154();
    updateBaseAndBallsRotation(work);
    NNS_G3dGePopMtx(1);
    sub_02026E50(0, 0);
}

static inline void id_roty_mtx33(MtxFx33 *mtx, u16 index) {
    MTX_Identity33(mtx);
    MTX_RotY33(mtx, FX_SinIdx(index), FX_CosIdx(index));
}

static void updateBaseAndBallsRotation(struct ChooseStarterAppWork *work) {
    const VecFx32 scaleVec = {FX32_ONE, FX32_ONE, FX32_ONE};
    MtxFx33 rotMtx;
    MtxFx33 tmpMtx;
    int i;

    for (i = CS_MODEL_TT_BALL_EF; i < CS_MODEL_TABLETOP + 1; i++) {
        struct ChooseStarterRnd *rnd = &work->_3dObjRender[i];
        if (rnd->active) {
            MTX_Identity33(&rotMtx);
            MTX_RotY33(&tmpMtx, FX_SinIdx(rnd->yRotAngle), FX_CosIdx(rnd->yRotAngle));
            MTX_Concat33(&tmpMtx, &rotMtx, &rotMtx);
            Draw3dModel(&rnd->obj, &rnd->translVec, &rotMtx, &scaleVec);
        }
    }

    {
        MtxFx33 baseRot;
        const VecFx32 baseTrans = {0, 0, 0};
        const VecFx32 baseScale = {FX32_ONE, FX32_ONE, FX32_ONE};

        NNS_G3dGlbSetBaseTrans(&baseTrans);
        id_roty_mtx33(&baseRot, work->rotationAngle);
        NNS_G3dGlbSetBaseRot(&baseRot);
        NNS_G3dGlbSetBaseScale(&baseScale);
    }
    NNS_G3dGlbFlush();

    for (i = CS_MODEL_TURNTABLE; i < CS_MODEL_MAX; i++) {
        struct ChooseStarterRnd *rnd = &work->_3dObjRender[i];
        if (rnd->active) {
            NNS_G3dGePushMtx();
            updateModelPositionAndRotation(rnd);
            NNS_G3dGePopMtx(1);
            NNS_G3dGlbFlush();
        }
    }
}

static void initBgLayers(BGCONFIG *bgConfig, HeapID heapId) {
    G2_SetBG0Priority(2);
    {
        const BGTEMPLATE sp70 = {
            0, 0, 0x800, 0,
            GF_BG_SCR_SIZE_256x256, GF_BG_CLR_4BPP, 0, 1, 0, 0, 0, 0,
            0
        };
        InitBgFromTemplate(bgConfig, 1, &sp70, GF_BG_TYPE_TEXT);
        BG_ClearCharDataRange(1, 0x20, 0, heapId);
        BgClearTilemapBufferAndCommit(bgConfig, 1);
    }
    {
        const BGTEMPLATE sp54 = {
            0, 0, 0x800, 0,
            GF_BG_SCR_SIZE_256x256, GF_BG_CLR_4BPP, 1, 3, 0, 1, 0, 0,
            0
        };
        InitBgFromTemplate(bgConfig, 2, &sp54, GF_BG_TYPE_TEXT);
        BG_ClearCharDataRange(2, 0x20, 0, heapId);
        BgClearTilemapBufferAndCommit(bgConfig, 2);
    }
    {
        const BGTEMPLATE sp38 = {
            0, 0, 0x800, 0,
            GF_BG_SCR_SIZE_256x256, GF_BG_CLR_4BPP, 2, 5, 0, 0, 0, 0,
            0
        };
        InitBgFromTemplate(bgConfig, 4, &sp38, GF_BG_TYPE_TEXT);
        BG_ClearCharDataRange(4, 0x20, 0, heapId);
        BgClearTilemapBufferAndCommit(bgConfig, 4);
    }
    {
        const BGTEMPLATE sp1C = {
            0, 0, 0x800, 0,
            GF_BG_SCR_SIZE_256x256, GF_BG_CLR_4BPP, 0, 4, 0, 2, 0, 0,
            0
        };
        InitBgFromTemplate(bgConfig, 5, &sp1C, GF_BG_TYPE_TEXT);
        BG_ClearCharDataRange(5, 0x20, 0, heapId);
        BgClearTilemapBufferAndCommit(bgConfig, 5);
    }
    {
        const BGTEMPLATE sp00 = {
            0, 0, 0x800, 0,
            GF_BG_SCR_SIZE_256x256, GF_BG_CLR_4BPP, 1, 3, 0, 1, 0 ,0,
            0
        };
        InitBgFromTemplate(bgConfig, 6, &sp00, GF_BG_TYPE_TEXT);
        BG_ClearCharDataRange(6, 0x20, 0, heapId);
        BgClearTilemapBufferAndCommit(bgConfig, 6);
    }
}

static void initCameraPosition(struct ChooseStarterAppWork *work) {
    VecFx32 bindTarget;
    const VecFx32 shiftVec = {0, 0, 14 * FX32_ONE};
    GF_CameraAngle cameraAngle;

    work->cameraTarget.x = 0;
    work->cameraTarget.y = FX32_ONE * 15;
    work->cameraTarget.z = 0;

    cameraAngle.x = 0xDCC0;
    cameraAngle.y = 0;
    cameraAngle.z = 0;
    GF_Camera_InitFromTargetDistanceAndAngle(&work->cameraTarget, 100 * FX32_ONE, &cameraAngle, 0x11A4, 0, 1, work->camera);
    GF_Camera_ShiftBy(&shiftVec, work->camera);
    GF_Camera_SetClipBounds(FX32_ONE * 4, FX32_ONE * 256, work->camera);
    bindTarget.x = 0;
    bindTarget.y = FX32_ONE;
    bindTarget.z = 0;
    GF_Camera_SetBindTarget(&bindTarget, work->camera);
    GF_Camera_RegisterToStaticPtr(work->camera);
}

static void createObjResMans(struct ChooseStarterAppWork *work) {
    struct StarterChooseMonSpriteData *pMonSpriteData = &work->monSpriteData;
    pMonSpriteData->spriteList = G2dRenderer_Init(3, &pMonSpriteData->g2dRender, work->heapId);
    pMonSpriteData->charResMan = Create2DGfxResObjMan(3, 0, work->heapId);
    pMonSpriteData->plttResMan = Create2DGfxResObjMan(3, 1, work->heapId);
    pMonSpriteData->cellResMan = Create2DGfxResObjMan(3, 2, work->heapId);
    pMonSpriteData->animResMan = Create2DGfxResObjMan(3, 3, work->heapId);
    GX_EngineBToggleLayers(0x10, GX_LAYER_TOGGLE_ON);
}

static void initObjRenderers(struct ChooseStarterAppWork *work) {
    int i;
    load3dModelResourceFromNarc(&work->_3dObjRes[CS_3DRES_BALL_EF], NARC_choose_starter_main_res_03_tt_ball_ef_NSBMD, work->heapId);
    rendererTranslVecSet(&work->_3dObjRender[CS_MODEL_TT_BALL_EF], 0, 14 * FX32_ONE, 32 * FX32_ONE);
    rendererScaleVecSet(&work->_3dObjRender[CS_MODEL_TT_BALL_EF], FX32_ONE, FX32_ONE, FX32_ONE);
    load3dModelResourceFromNarc(&work->_3dObjRes[CS_3DRES_TABLETOP], NARC_choose_starter_main_res_00_tt_tabletop_NSBMD, work->heapId);
    rendererTranslVecSet(&work->_3dObjRender[CS_MODEL_TABLETOP], 0, 0, 0);
    rendererScaleVecSet(&work->_3dObjRender[CS_MODEL_TABLETOP], FX32_ONE, FX32_ONE, FX32_ONE);
    load3dModelResourceFromNarc(&work->_3dObjRes[CS_3DRES_TURNTABLE], NARC_choose_starter_main_res_01_tt_turntable_NSBMD, work->heapId);
    rendererTranslVecSet(&work->_3dObjRender[CS_MODEL_TURNTABLE], 0, 0, 0);
    rendererScaleVecSet(&work->_3dObjRender[CS_MODEL_TURNTABLE], FX32_ONE, FX32_ONE, FX32_ONE);
    load3dModelResourceFromNarc(&work->_3dObjRes[CS_3DRES_BALLS], NARC_choose_starter_main_res_02_tt_ball_NSBMD, work->heapId);
    init3dModelRender(&work->_3dObjRender[CS_MODEL_TT_BALL_EF], &work->_3dObjRes[CS_3DRES_BALL_EF]);
    init3dModelRender(&work->_3dObjRender[CS_MODEL_TABLETOP], &work->_3dObjRes[CS_3DRES_TABLETOP]);
    init3dModelRender(&work->_3dObjRender[CS_MODEL_TURNTABLE], &work->_3dObjRes[CS_3DRES_TURNTABLE]);

    for (i = 0; i < 3; i++) {
        init3dModelRender(&work->_3dObjRender[i + CS_MODEL_BALL1], &work->_3dObjRes[CS_3DRES_BALLS]);
    }
    work->_3dObjRender[CS_MODEL_TT_BALL_EF].active = FALSE;
    work->_3dObjRender[CS_MODEL_TURNTABLE].active = TRUE;
    work->_3dObjRender[CS_MODEL_TABLETOP].active = TRUE;
    work->_3dObjRender[CS_MODEL_BALL1].active = TRUE;
    work->_3dObjRender[CS_MODEL_BALL2].active = TRUE;
    work->_3dObjRender[CS_MODEL_BALL3].active = TRUE;
    loadAnmFromNarc(NARC_choose_starter_main_res_07_tt_turntable_NSBTA, work->heapId, &work->allocator, &work->_3dObjRes[CS_3DRES_TURNTABLE], &work->_3dObjAnm[CS_ANIM_TURNTABLE]);
    loadAnmFromNarc(NARC_choose_starter_main_res_06_ball_rock_NSBCA, work->heapId, &work->allocator, &work->_3dObjRes[CS_3DRES_BALLS], &work->_3dObjAnm[CS_ANIM_BALL1_ROCK]);
    loadAnmFromNarc(NARC_choose_starter_main_res_06_ball_rock_NSBCA, work->heapId, &work->allocator, &work->_3dObjRes[CS_3DRES_BALLS], &work->_3dObjAnm[CS_ANIM_BALL2_ROCK]);
    loadAnmFromNarc(NARC_choose_starter_main_res_06_ball_rock_NSBCA, work->heapId, &work->allocator, &work->_3dObjRes[CS_3DRES_BALLS], &work->_3dObjAnm[CS_ANIM_BALL3_ROCK]);
    loadAnmFromNarc(NARC_choose_starter_main_res_05_tt_ball_NSBCA, work->heapId, &work->allocator, &work->_3dObjRes[CS_3DRES_BALLS], &work->_3dObjAnm[CS_ANIM_BALL_OPEN]);
    loadAnmFromNarc(NARC_choose_starter_main_res_04_tt_ball_ef_NSBCA, work->heapId, &work->allocator, &work->_3dObjRes[CS_3DRES_BALL_EF], &work->_3dObjAnm[CS_ANIM_TT_BALL_EF]);
    addAnmObjToRenderObj(&work->_3dObjRender[CS_MODEL_TURNTABLE], &work->_3dObjAnm[CS_ANIM_TURNTABLE]);
    addAnmObjToRenderObj(&work->_3dObjRender[CS_MODEL_BALL1], &work->_3dObjAnm[CS_ANIM_BALL1_ROCK]);
    addAnmObjToRenderObj(&work->_3dObjRender[CS_MODEL_BALL2], &work->_3dObjAnm[CS_ANIM_BALL2_ROCK]);
    addAnmObjToRenderObj(&work->_3dObjRender[CS_MODEL_BALL3], &work->_3dObjAnm[CS_ANIM_BALL3_ROCK]);
}

static void freeAll3dAnmObj(struct ChooseStarterAppWork *work) {
    int i;

    for (i = 0; i < CS_ANIM_MAX; i++) {
        free3dAnmObj(&work->_3dObjAnm[i], &work->allocator);
    }
}

static void freeAll3dResHeader(struct ChooseStarterAppWork *work) {
    int i;

    for (i = 0; i < CS_3DRES_MAX; i++) {
        free3dResHeader(&work->_3dObjRes[i]);
    }
}

static void load3dModelResourceFromNarc(struct ChooseStarter3dRes *res, int fileId, HeapID heapId) {
    res->header = GfGfxLoader_LoadFromNarc(NARC_application_choose_starter_choose_starter_main_res, fileId, FALSE, heapId, FALSE);
    res->mdlSet = NNS_G3dGetMdlSet(res->header);
    res->mdl = NNS_G3dGetMdlByIdx(res->mdlSet, 0);
    res->tex = NNS_G3dGetTex(res->header);
    AllocAndLoad3dTexResources(res->tex);
}

static void init3dModelRender(struct ChooseStarterRnd *rnd, struct ChooseStarter3dRes *res) {
    Bind3dModelSet(res->header, res->tex);
    NNS_G3dRenderObjInit(&rnd->obj, res->mdl);
}

static void loadAnmFromNarc(int fileId, HeapID heapId, NNSFndAllocator *allocator, struct ChooseStarter3dRes *res, struct ChooseStarterAnm *anm) {
    void *pAnm;
    anm->hdr = GfGfxLoader_LoadFromNarc(NARC_application_choose_starter_choose_starter_main_res, fileId, FALSE, heapId, FALSE);
    pAnm = NNS_G3dGetAnmByIdx(anm->hdr, 0);
    anm->obj = NNS_G3dAllocAnmObj(allocator, pAnm, res->mdl);
    NNS_G3dAnmObjInit(anm->obj, pAnm, res->mdl, res->tex);
}

static void addAnmObjToRenderObj(struct ChooseStarterRnd *rnd, struct ChooseStarterAnm *anm) {
    NNS_G3dRenderObjAddAnmObj(&rnd->obj, anm->obj);
}

static void removeAnmObjFromRenderObj(struct ChooseStarterRnd *rnd, struct ChooseStarterAnm *anm) {
    NNS_G3dRenderObjRemoveAnmObj(&rnd->obj, anm->obj);
}

static BOOL advance3dAnmFrameAndCheckFinished(struct ChooseStarterAnm *anm) {
    BOOL ret = FALSE;
    fx32 frame = anm->obj->frame + FX32_ONE;

    if (frame != NNS_G3dAnmObjGetNumFrame(anm->obj)) {
        NNS_G3dAnmObjSetFrame(anm->obj, frame);
    } else {
        ret = TRUE;
    }
    return ret;
}

static void advance3dAnmFrameLooped(struct ChooseStarterAnm *anm, int selectState) {
    NNS_G3dAnmObjSetFrame(anm->obj, anm->obj->frame + FX32_ONE);
    // If in zoomed state, wait for big wobble to finish,
    // then force to small wobbles
    if (selectState == SELECT_STATE_CONFIRM && anm->obj->frame == (FX32_ONE * 40)) {
        NNS_G3dAnmObjSetFrame(anm->obj, FX32_ONE * 80);
    }
    if (anm->obj->frame >= NNS_G3dAnmObjGetNumFrame(anm->obj)) {
        if (selectState == SELECT_STATE_CONFIRM) {
            // Force to small wobbles
            NNS_G3dAnmObjSetFrame(anm->obj, FX32_ONE * 80);
        } else {
            // Alternate 2 big then 2 small wobbles
            NNS_G3dAnmObjSetFrame(anm->obj, 0);
        }
    }
}

static inline struct ChooseStarterAnm *GetAnmByIdx(struct ChooseStarterAppWork *work, u8 idx) {
    return &work->_3dObjAnm[idx];
}

static void advanceSelectedBallShakingAnim(struct ChooseStarterAppWork *work) {
    u32 idx = work->curSelection;
    advance3dAnmFrameLooped(GetAnmByIdx(work, idx), work->ballWobbleState);
    NNS_G3dAnmObjSetFrame(GetAnmByIdx(work, (idx + 1) % 3)->obj, 0);
    NNS_G3dAnmObjSetFrame(GetAnmByIdx(work, (idx + 2) % 3)->obj, 0);
}

static BOOL selectedBallIsInSmallWobbleState(struct ChooseStarterAppWork *work) {
    u32 idx = work->curSelection;
    return GetAnmByIdx(work, idx)->obj->frame >= 80 * FX32_ONE;
}

static void free3dResHeader(struct ChooseStarter3dRes *res) {
    if (res->header != NULL) {
        FreeToHeap(res->header);
    }
}

static void free3dAnmObj(struct ChooseStarterAnm *anm, NNSFndAllocator *alloc) {
    if (anm->hdr != NULL) {
        NNS_G3dFreeAnmObj(alloc, anm->obj);
        FreeToHeap(anm->hdr);
    }
}

static void rendererTranslVecSet(struct ChooseStarterRnd *rnd, fx32 x, fx32 y, fx32 z) {
    rnd->translVec.x = x;
    rnd->translVec.y = y;
    rnd->translVec.z = z;
}

static void rendererScaleVecSet(struct ChooseStarterRnd *rnd, fx32 x, fx32 y, fx32 z) {
    rnd->scaleVec.x = x;
    rnd->scaleVec.y = y;
    rnd->scaleVec.z = z;
}

static void initBallModelPositions(struct ChooseStarterAppWork *work) {
    VecFx32 pos;
    const VecFx32 posNoRot = {0, 14 * FX32_ONE, 32 * FX32_ONE};
    MtxFx33 rotMtx;
    int i;
    u16 trigIdx;
    u8 ballIdx = work->curSelection;
    int angle = 0;

    for (i = 0; i < 3; i++) {
        trigIdx = angle / 3; // 0, 120, 240 degrees
        MTX_RotY33(&rotMtx, FX_SinIdx(trigIdx), FX_CosIdx(trigIdx));
        MTX_MultVec33(&posNoRot, &rotMtx, &pos);
        work->positions[ballIdx] = pos;
        work->positions[ballIdx].y += 13 * FX32_ONE; // translate upwards so that it rests on the turntable
        rendererTranslVecSet(&work->_3dObjRender[ballIdx + 3], pos.x, pos.y, pos.z);
        rendererScaleVecSet(&work->_3dObjRender[ballIdx + 3], FX32_ONE, FX32_ONE, FX32_ONE);
        work->_3dObjRender[ballIdx + CS_MODEL_BALL1].yRotAngle = trigIdx;
        work->_3dObjRender[ballIdx + CS_MODEL_BALL1].xRotAngle = 0;
        ballIdx = (ballIdx + 1) % 3;
        angle += 0x10000; // 360 degrees
    }
}

static void updateModelPositionAndRotation(struct ChooseStarterRnd *render) {
    MtxFx43 mtx;
    calculateModelPositionAndRotation(render, &mtx);
    NNS_G3dGeMultMtx43(&mtx);
    NNS_G3dDraw(&render->obj);
}

static void calculateModelPositionAndRotation(struct ChooseStarterRnd *render, MtxFx43 *mtx) {
    MtxFx43 rotxMtx;
    MtxFx43 rotyMtx;
    MtxFx43 tmpRotMtx;
    MTX_Identity43(mtx);
    MTX_TransApply43(mtx, mtx, render->translVec.x, render->translVec.y, render->translVec.z);
    MTX_Identity43(&rotxMtx);
    MTX_RotX43(&tmpRotMtx, FX_SinIdx(render->xRotAngle), FX_CosIdx(render->xRotAngle));
    MTX_Concat43(&tmpRotMtx, &rotxMtx, &rotxMtx);
    MTX_RotY43(&tmpRotMtx, FX_SinIdx(render->yRotAngle), FX_CosIdx(render->yRotAngle));
    MTX_Concat43(&tmpRotMtx, &rotxMtx, &rotxMtx);
    MTX_Scale43(&rotyMtx, render->scaleVec.x, render->scaleVec.y, render->scaleVec.z);
    MTX_Concat43(&rotxMtx, mtx, mtx);
    MTX_Concat43(&rotyMtx, mtx, mtx);
}

static BOOL updateBaseRotation(struct ChooseStarterAppWork *work, fx16 speed) {
    BOOL ret = FALSE;
    work->rotationAngle += speed;
    if (speed >= 0) {
        if (work->rotationAngle >= FX_DEG_TO_IDX(FX32_CONST(120))) {
            work->rotationAngle = 0;
            work->rotationSpeed = 0;
            reinitBallModelPosInDirection(work, 1);
            ret = TRUE;
        }
    } else {
        if (work->rotationAngle <= -FX_DEG_TO_IDX(FX32_CONST(120))) {
            work->rotationAngle = 0;
            work->rotationSpeed = 0;
            reinitBallModelPosInDirection(work, 2);
            ret = TRUE;
        }
    }
    return ret;
}

static void reinitBallModelPosInDirection(struct ChooseStarterAppWork *work, int direction) {
    if (direction == 2) {
        work->curSelection = (work->curSelection + 1) % 3;
    } else if (direction == 1) {
        s8 r0 = work->curSelection - 1;
        if (r0 < 0) {
            r0 = 2;
        }
        work->curSelection = r0;
    }
    initBallModelPositions(work);
}

static void makeAndDrawWindows(struct ChooseStarterAppWork *work) {
    work->winTop = AllocWindows(work->heapId, 1);
    work->winBottom = AllocWindows(work->heapId, 1);
    AddWindowParameterized(work->bgConfig, work->winTop, 4, 2, 19, 27, 4, 2, 0x01F);
    AddWindowParameterized(work->bgConfig, work->winBottom, 1, 1, 19, 29, 4, 2, 0x01F);
    FillWindowPixelBuffer(work->winTop, 15);
    FillWindowPixelBuffer(work->winBottom, 0);
    LoadUserFrameGfx2(work->bgConfig, 4, 0x200, 0, work->frame, work->heapId);
    GfGfxLoader_GXLoadPal(NARC_application_choose_starter_choose_starter_main_res, NARC_choose_starter_main_res_08_window_NCLR, 4, 0x040, 0x20, work->heapId);
    GfGfxLoader_GXLoadPal(NARC_application_choose_starter_choose_starter_main_res, NARC_choose_starter_main_res_08_window_NCLR, 0, 0x040, 0x20, work->heapId);
    DrawFrameAndWindow2(work->winTop, FALSE, 0x200, 0);
}

static void loadBgGraphics(BGCONFIG *bgConfig, HeapID heapId) {
    GfGfxLoader_LoadCharData(NARC_application_choose_starter_choose_starter_main_res, NARC_choose_starter_main_res_13_bgl2_NCGR, bgConfig, 2, 0, 0, FALSE, heapId);
    GfGfxLoader_LoadCharData(NARC_application_choose_starter_choose_starter_main_res, NARC_choose_starter_main_res_10_bgl5_NCGR, bgConfig, 5, 0, 0, FALSE, heapId);
    GfGfxLoader_LoadCharData(NARC_application_choose_starter_choose_starter_main_res, NARC_choose_starter_main_res_16_bgl6_NCGR, bgConfig, 6, 0, 0, FALSE, heapId);
    GfGfxLoader_LoadScrnData(NARC_application_choose_starter_choose_starter_main_res, NARC_choose_starter_main_res_14_bgl2_NSCR, bgConfig, 2, 0, 0, FALSE, heapId);
    GfGfxLoader_LoadScrnData(NARC_application_choose_starter_choose_starter_main_res, NARC_choose_starter_main_res_11_bgl5_NSCR, bgConfig, 5, 0, 0, FALSE, heapId);
    GfGfxLoader_LoadScrnData(NARC_application_choose_starter_choose_starter_main_res, NARC_choose_starter_main_res_17_bgl6_NSCR, bgConfig, 6, 0, 0, FALSE, heapId);
    GfGfxLoader_GXLoadPal(NARC_application_choose_starter_choose_starter_main_res, NARC_choose_starter_main_res_12_bgl2_NCLR, 0, 0x60, 0x20, heapId);
    GfGfxLoader_GXLoadPal(NARC_application_choose_starter_choose_starter_main_res, NARC_choose_starter_main_res_09_bgl5_NCLR, 4, 0x60, 0x20, heapId);
    GfGfxLoader_GXLoadPal(NARC_application_choose_starter_choose_starter_main_res, NARC_choose_starter_main_res_15_bgl6_NCLR, 4, 0x80, 0x20, heapId);
    BgTilemapRectChangePalette(bgConfig, 2, 0, 0, 0x20, 0x18, 3);
    BgTilemapRectChangePalette(bgConfig, 5, 0, 0, 0x20, 0x18, 3);
    BgTilemapRectChangePalette(bgConfig, 6, 0, 0, 0x20, 0x18, 4);
    BgCommitTilemapBufferToVram(bgConfig, 2);
    BgCommitTilemapBufferToVram(bgConfig, 5);
    BgCommitTilemapBufferToVram(bgConfig, 6);
    G2S_SetBlendAlpha(4, 34, 5, 11);
}

static u8 printMsgOnWinEx(WINDOW *window, HeapID heapId, BOOL makeFrame, s32 msgBank, int msgno, u32 color, u32 speed, STRING **out) {
    MSGDATA *msgData;
    u8 ret;
    GF_ASSERT(*out == NULL);
    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msgBank, heapId);
    GF_ASSERT(msgData != NULL);
    *out = NewString_ReadMsgData(msgData, msgno);
    FillWindowPixelBuffer(window, color);
    ret = AddTextPrinterParameterized2(window, 1, *out, 0, 0, speed, color, NULL);
    if (makeFrame) {
        DrawFrameAndWindow2(window, FALSE, 0x200, 0);
    } else {
        CopyWindowToVram(window);
    }
    DestroyMsgData(msgData);
    return ret;
}

static void printMsgOnBottom(struct ChooseStarterAppWork *work, int msgId) {
    STRING *string = NULL;
    printMsgOnWinEx(work->winBottom, work->heapId, FALSE, NARC_msg_msg_0190_bin, msgId, MakeTextColor(1, 2, 0), 0, &string);
    String_dtor(string);
}

static void freeWindow(WINDOW *window) {
    RemoveWindow(window);
    FreeToHeap(window);
}

static int getInput(struct ChooseStarterAppWork *work) {
    int ret = 0;
    // Ignore the keypad if continuing touch input
    if (System_GetTouchHeld() == 0) {
        if (gSystem.newKeys & PAD_BUTTON_A) {
            // Advance the starter selection.
            // It takes one nav input (A, left, or right) plus two A presses.
            if (work->state == SELECT_STATE_CONFIRM) {
                // Second A press, choice locked in
                ret = CHOOSE_STARTER_INPUT_CHOSE_STARTER;
            } else if (work->state == SELECT_STATE_INSPECT) {
                // First A press, Elm asks if you're sure
                ret = CHOOSE_STARTER_INPUT_CONFIRM_CHOICE;
            } else {
                // This counts as the "nav" input.
                work->state = SELECT_STATE_INSPECT;
                ret = CHOOSE_STARTER_INPUT_SELECT_BALL_INIT;
            }
        } else if (gSystem.newKeys & PAD_BUTTON_B) {
            // B button declines the selection
            if (work->state == SELECT_STATE_CONFIRM) {
                ret = CHOOSE_STARTER_INPUT_BACKED_OUT;
            }
        } else if (gSystem.newKeys & PAD_KEY_LEFT) {
            // Rotate the turntable clockwise
            if (work->state != SELECT_STATE_CONFIRM) {
                ret = CHOOSE_STARTER_INPUT_CYCLE_CLOCKWISE;
            }
        } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
            // Rotate the turntable counterclockwise
            if (work->state != SELECT_STATE_CONFIRM) {
                ret = CHOOSE_STARTER_INPUT_CYCLE_COUNTERCLOCKWISE;
            }
        }
    } else if (gSystem.heldKeys == 0 && System_GetTouchNew() != 0) {
        VecFx32 near, far; // wherever you are
        int num;
        fx32 radius;
        NNS_G3dScrPosToWorldLine(gSystem.touchX, gSystem.touchY, &near, &far);
        if (work->state == SELECT_STATE_CONFIRM) {
            radius = 6 * FX32_ONE;
        } else {
            radius = 13 * FX32_ONE;
        }
        num = getTappedBallId(work->positions, &near, &far, radius);
        if (num != 3) {
            if (work->state == SELECT_STATE_CONFIRM) {
                if (num == work->curSelection) {
                    ret = CHOOSE_STARTER_INPUT_CHOSE_STARTER;
                } else {
                    ret = CHOOSE_STARTER_INPUT_BACKED_OUT;
                }
            } else if (work->state == SELECT_STATE_INSPECT) {
                if (num == work->curSelection) {
                    ret = CHOOSE_STARTER_INPUT_CONFIRM_CHOICE;
                } else {
                    ret = getRotateDirection(num, work->curSelection, work->ballWobbleState);
                }
            } else {
                if (num == work->curSelection) {
                    work->state = SELECT_STATE_INSPECT;
                    ret = CHOOSE_STARTER_INPUT_SELECT_BALL_INIT;
                } else {
                    ret = getRotateDirection(num, work->curSelection, work->ballWobbleState);
                }
            }
        } else if (work->state == SELECT_STATE_CONFIRM) {
            ret = CHOOSE_STARTER_INPUT_BACKED_OUT;
        }
    }
    if (ret == CHOOSE_STARTER_INPUT_CHOSE_STARTER) {
        PlaySE(SEQ_SE_DP_BOX01);
    }
    return ret;
}

static int getRotateDirection(int a0, u8 a1, int a2) {
#pragma unused(a2)
    if (((a1 + 1) % 3) == a0) {
        return CHOOSE_STARTER_INPUT_CYCLE_CLOCKWISE;
    } else {
        return CHOOSE_STARTER_INPUT_CYCLE_COUNTERCLOCKWISE;
    }
}

static int getTappedBallId(VecFx32 *vecs, VecFx32 *near, VecFx32 *far, fx32 radius) {
    u8 i;
    for (i = 0; i < 3; i++) {
        if (GetDistanceFromPointToLine(&vecs[i], near, far) <= radius) {
            break;
        }
    }
    return i;
}

static void createMonSprites(struct ChooseStarterAppWork *work) {
    NARC *narc = NARC_ctor(NARC_application_choose_starter_choose_starter_sub_res, work->heapId);
    int i;
    struct StarterChooseMonSpriteData *spriteData = &work->monSpriteData;

    for (i = 0; i < 3; i++) {
        spriteData->objs[i].charResObj = AddCharResObjFromOpenNarc(spriteData->charResMan, narc, NARC_choose_starter_sub_res_choose_starter_sub_res_00000009_NCGR, FALSE, i, 2, work->heapId);
        spriteData->objs[i].plttResObj = AddPlttResObjFromOpenNarc(spriteData->plttResMan, narc, NARC_choose_starter_sub_res_choose_starter_sub_res_00000006_NCLR, FALSE, i, 2, 1, work->heapId);
        spriteData->objs[i].cellResObj = AddCellOrAnimResObjFromOpenNarc(spriteData->cellResMan, narc, NARC_choose_starter_sub_res_choose_starter_sub_res_00000010_NCER, FALSE, i, GF_GFX_RES_TYPE_CELL, work->heapId);
        spriteData->objs[i].animResObj = AddCellOrAnimResObjFromOpenNarc(spriteData->animResMan, narc, NARC_choose_starter_sub_res_choose_starter_sub_res_00000016_NANR, FALSE, i, GF_GFX_RES_TYPE_ANIM, work->heapId);
        GetMonSpriteCharAndPlttNarcIdsEx(
            &spriteData->param,
            GetMonData(work->choices[i], MON_DATA_SPECIES, NULL),
            GetMonData(work->choices[i], MON_DATA_GENDER, NULL),
            2,
            MonIsShiny(work->choices[i]),
            0,
            0
        );
        spriteData->charDatas[i] = sub_0201442C(spriteData->param.narcID, spriteData->param.charDataID, work->heapId);
        spriteData->plttDatas[i] = sub_02014450(spriteData->param.narcID, spriteData->param.palDataID, work->heapId);
        loadOneMonObj(spriteData->charResMan, spriteData->plttResMan, spriteData->charDatas[i], spriteData->plttDatas[i], i);
        createOneMonRender(spriteData, i, work->heapId);
    }

    NARC_dtor(narc);
}

static void loadOneMonObj(struct _2DGfxResMan *charResMan, struct _2DGfxResMan *plttResMan, void *charData, void *plttData, u8 idx) {
    struct _2DGfxResObj *charResObj = Get2DGfxResObjById(charResMan, idx);
    struct _2DGfxResObj *plttResObj = Get2DGfxResObjById(plttResMan, idx);
    NNSG2dImageProxy *charProxy;
    const NNSG2dImagePaletteProxy *plttProxy;
    u32 imageloc;
    u32 plttloc;

    sub_0200ADA4(charResObj);
    sub_0200B00C(plttResObj);
    charProxy = sub_0200AF00(charResObj);
    plttProxy = sub_0200B0F8(plttResObj, charProxy);
    imageloc = NNS_G2dGetImageLocation(charProxy, NNS_G2D_VRAM_TYPE_2DSUB);
    plttloc = NNS_G2dGetImagePaletteLocation(plttProxy, NNS_G2D_VRAM_TYPE_2DSUB);
    DC_FlushRange(charData, 0xC80);
    GXS_LoadOBJ(charData, imageloc, 0xC80);
    DC_FlushRange(plttData, 0x20);
    GXS_LoadOBJPltt(plttData, plttloc, 0x20);
}

static void createOneMonRender(struct StarterChooseMonSpriteData *pMonSpriteData, u8 idx, HeapID heapId) {
    SpriteResourcesHeader header;
    struct SpriteTemplate template;

    CreateSpriteResourcesHeader(&header, idx, idx, idx, idx, -1, -1, FALSE, 0, pMonSpriteData->charResMan, pMonSpriteData->plttResMan, pMonSpriteData->cellResMan, pMonSpriteData->animResMan, NULL, NULL);
    template.spriteList = pMonSpriteData->spriteList;
    template.header = &header;
    template.position.x = 0;
    template.position.y = 0;
    template.position.z = 0;
    template.scale.x = FX32_ONE;
    template.scale.y = FX32_ONE;
    template.scale.z = FX32_ONE;
    template.rotation = 0;
    template.whichScreen = NNS_G2D_VRAM_TYPE_2DSUB;
    template.priority = 0;
    template.heapId = heapId;
    template.position.x = 128 * FX32_ONE;
    template.position.y = 288 * FX32_ONE;
    pMonSpriteData->sprites[idx] = CreateSprite(&template);
    Set2dSpriteAnimActiveFlag(pMonSpriteData->sprites[idx], FALSE);
    Set2dSpriteAnimSeqNo(pMonSpriteData->sprites[idx], 0);
    Set2dSpriteVisibleFlag(pMonSpriteData->sprites[idx], FALSE);
}

static void setAllButSelectedMonSpritesInvisible(struct ChooseStarterAppWork *work) {
    setAllMonSpritesInvisible(&work->monSpriteData);
    Set2dSpriteVisibleFlag(work->monSpriteData.sprites[work->curSelection], TRUE);
}

static void setAllMonSpritesInvisible(struct StarterChooseMonSpriteData *a0) {
    int i;

    for (i = 0; i < 3; i++) {
        Set2dSpriteVisibleFlag(a0->sprites[i], FALSE);
    }
}

static BOOL yRotateSelectedBall(struct ChooseStarterAppWork *work, fx32 from, fx32 to) {
    MtxFx33 template;
    u16 angle;
    u32 selection = work->curSelection;
    work->ballTransStep++;
    angle = calcBallTranslationArcStep(&from, &to, work->ballTransStep, CAM_MOVE_STEP_MAX);
    {
        VecFx32 translVec = {0, 14 * FX32_ONE, 32 * FX32_ONE};
        VecFx32 subtrahend = {0, 14 * FX32_ONE, 32 * FX32_ONE};
        subtrahend.y += FX32_CONST(13.453);
        VEC_Subtract(&translVec, &subtrahend, &translVec);
        MTX_RotX33(&template, FX_SinIdx(angle), FX_CosIdx(angle));
        MTX_MultVec33(&translVec, &template, &translVec);
        VEC_Add(&translVec, &subtrahend, &translVec);
        rendererTranslVecSet(&work->_3dObjRender[selection + CS_MODEL_BALL1], translVec.x, translVec.y, translVec.z);
        work->_3dObjRender[selection + CS_MODEL_BALL1].xRotAngle = angle;
        if (work->ballTransStep >= CAM_MOVE_STEP_MAX) {
            work->ballTransStep = 0;
            return TRUE;
        } else {
            return FALSE;
        }
    }
}

static u16 calcBallTranslationArcStep(const fx32 *from, const fx32 *to, int step, int max) {
    u16 ret;
    int addend;
    if (*to >= *from) {
        ret = *to - *from;
        addend = (ret * step) / max;
    } else {
        ret = *from - *to;
        addend = -((ret * step) / max);
    }
    return *from + addend;
}
