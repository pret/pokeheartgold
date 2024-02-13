#ifndef POKEHEARTGOLD_INTRO_MOVIE_INTERNAL
#define POKEHEARTGOLD_INTRO_MOVIE_INTERNAL

#include "camera.h"
#include "bg_window.h"
#include "sys_task.h"
#include "gf_3d_vramman.h"
#include "unk_02023694.h"

typedef struct IntroMovieScene1Data {
    u8 state;
    u8 needFreeGfx;
    u8 *skipAllowedPtr;
    _2DGfxResObj *charResObj;
    _2DGfxResObj *plttResObj;
    _2DGfxResObj *cellResObj;
    _2DGfxResObj *animResObj;
    Sprite *sunSprite;
    void *birdSprite;
} IntroMovieScene1Data;

typedef struct IntroMovieScene2SpritePanController {
    BOOL active;
    s16 duration;
    u8 counter;
    u8 finished;
    SysTask *task;
    int xSpeed;
    int ySpeed;
    int xOffset;
    int yOffset;
    Sprite *sprite0;
    Sprite *sprite1;
    Sprite *sprite2;
} IntroMovieScene2SpritePanController;

typedef struct IntroMovieScene2Data {
    u8 state;
    u8 needFreeGfx;
    u8 unk_002;
    u8 flowerIndex;
    _2DGfxResObj *spriteGfxRes[2][4];
    Sprite *ethanSprite0;
    Sprite *lyraSprite0;
    Sprite *ethanSprite1;
    Sprite *lyraSprite1;
    Sprite *ethanSprite2;
    Sprite *lyraSprite2;
    Sprite *flowerSprites[10];
    IntroMovieScene2SpritePanController spritePanCnt[2];
} IntroMovieScene2Data;

typedef struct IntroMovieScene3Sub_084 {
    u8 filler_00[0x54];
    void *unk_54;
    void *unk_58[2];
    NNSG3dAnmObj *unk_60[2];
} IntroMovieScene3Sub_084;

typedef struct IntroMovieScene3Data {
    u8 state;
    u8 unk_001;
    u8 unk_002;
    u8 unk_003;
    void *unk_004[4];
    void *unk_014;
    void *unk_018[3];
    NNSG2dScreenData *unk_024[4];
    NNSG2dScreenData *unk_034;
    NNSG2dScreenData *unk_038[3];
    _2DGfxResObj *unk_044[2][4];
    Sprite *unk_064;
    Sprite *unk_068;
    Sprite *unk_06C[3];
    u8 filler_078[0x8];
    Camera *unk_080;
    IntroMovieScene3Sub_084 unk_084[3];
    GF3DVramMan *unk_1BC;
    NNSFndAllocator unk_1C0;
    int unk_1D0;
} IntroMovieScene3Data; // size: 0x1D4

typedef struct IntroMovieScene4Data {
    u8 unk_000;
    u8 padding_001[3];
    u8 filler_004[0x6C];
} IntroMovieScene4Data;

typedef struct IntroMovieScene5Data {
    u8 unk_000;
    u8 unk_001;
} IntroMovieScene5Data;

typedef struct IntroMovieSub_46C_000 {
    u8 counter;
    u8 duration;
    u8 ev;
    u8 finished;
    SysTask *task;
    int plane1;
    int plane2;
    int topScreen;
    int direction;
} IntroMovieBgBlendAnim;

typedef struct IntroMovieBgScrollAnim {
    BgConfig *bgConfig;
    BOOL active;
    enum GFBgLayer bgId;
    s16 duration;
    u8 counter;
    u8 finished;
    SysTask *task;
    fx16 xChange;
    fx16 yChange;
    fx16 xOrig;
    fx16 yOrig;
} IntroMovieBgScrollAnim;

typedef struct IntroMovieBgWindowAnimParam {
    int x1Start;
    int y1Start;
    int x2Start;
    int y2Start;
    int x1End;
    int y1End;
    int x2End;
    int y2End;
    int winIn;
    int winOut;
    u16 topScreenEffect;
    u16 bottomScreenEffect;
} IntroMovieBgWindowAnimParam;

typedef struct IntroMovieBgWindowAnim {
    int active;
    int whichScreen;
    s16 duration;
    u8 counter;
    u8 finished;
    SysTask *task;
    IntroMovieBgWindowAnimParam param;
    int x1;
    int y1;
    int x2;
    int y2;
} IntroMovieBgWindowAnim;

typedef struct IntroMovieBgLinearAnims {
    IntroMovieBgBlendAnim blend[2];
    IntroMovieBgScrollAnim scroll[8];
    IntroMovieBgWindowAnim window[2];
} IntroMovieBgLinearAnims;

typedef struct IntroMovieSub_614 {
    int active;
    int whichScreen;
    SysTask *task;
    fx16 x;
    fx16 y;
    u8 duration;
    u8 counter;
    u8 finished;
    u8 kind;
} IntroMovieCircleWipeEffect;

typedef struct IntroMovieOvyData {
    HeapID heapID;
    int totalFrameCount;
    BOOL introSkipped;
    BgConfig *bgConfig;
    SpriteList *spriteList;
    GF_G2dRenderer spriteRenderer;
    _2DGfxResMan *spriteResManagers[4];
    u32 unk_14C;
    IntroMovieScene1Data scene1Data;
    IntroMovieScene2Data scene2Data;
    IntroMovieScene3Data scene3Data;
    IntroMovieScene4Data scene4Data;
    IntroMovieScene5Data scene5Data;
    IntroMovieBgLinearAnims bgAnimCnt;
    IntroMovieCircleWipeEffect circleWipeEffect;
    u8 skipAllowed;
    u8 sceneStep;
    u8 sceneTimer;
    u8 sceneNumber;
} IntroMovieOvyData; // size: 0x62C

BOOL IntroMovie_Scene1(IntroMovieOvyData *data, void *pVoid);
BOOL IntroMovie_Scene2(IntroMovieOvyData *data, void *pVoid);
BOOL IntroMovie_Scene3(IntroMovieOvyData *data, void *pVoid);
BOOL IntroMovie_Scene4(IntroMovieOvyData *data, void *pVoid);
BOOL IntroMovie_Scene5(IntroMovieOvyData *data, void *pVoid);

void IntroMovie_CreateSpriteResourceManagers(IntroMovieOvyData *data, const u8 *counts);
void IntroMovie_DestroySpriteResourceManagers(IntroMovieOvyData *data);
_2DGfxResMan **IntroMovie_GetSpriteResourceManagersArray(IntroMovieOvyData *data);
void IntroMovie_StartSpriteAnimAndMakeVisible(Sprite *sprite, BOOL active);
void IntroMovie_BuildSpriteResourcesHeaderAndTemplate(int resId, IntroMovieOvyData *data, int priority, NNS_G2D_VRAM_TYPE whichScreen, SpriteTemplate *template, SpriteResourcesHeader *header);
void IntroMovie_RendererSetSurfaceCoords(IntroMovieOvyData *data, fx32 mainx, fx32 mainy, fx32 subx, fx32 suby);
void IntroMovie_StartBlendFadeEffect(IntroMovieBgBlendAnim *data, int plane1, int plane2, u8 duration, int direction, int screen);
void IntroMovie_StartBgScroll_VBlank(BgConfig *bgConfig, IntroMovieBgScrollAnim *data, enum GFBgLayer bgId, fx16 xChange, fx16 yChange, int duration);
void IntroMovie_StartBgScroll_NotVBlank(BgConfig *bgConfig, IntroMovieBgScrollAnim *data, enum GFBgLayer bgId, fx16 xChange, fx16 yChange, int duration);
BOOL IntroMovie_WaitBgScrollAnim(IntroMovieBgScrollAnim *data, enum GFBgLayer bgId);
void IntroMovie_CancelBgScrollAnim(IntroMovieBgScrollAnim *data, enum GFBgLayer bgId);
IntroMovieBgWindowAnim *IntroMovie_StartWindowPanEffect(IntroMovieBgWindowAnim *data, int duration, int whichScreen, const IntroMovieBgWindowAnimParam *param);
BOOL IntroMovie_WaitWindowPanEffect(IntroMovieBgWindowAnim *data, int whichScreen);
void IntroMovie_WindowsOn_SetInsideOutsidePlanes(int winIn, int winOut, u8 topScreenEffect, u8 bottomSCreenEffect, int whichScreen);
void IntroMovie_SetBgWindowsPosition(int x1, int y1, int x2, int y2, int whichScreen);
BgConfig *IntroMovie_GetBgConfig(IntroMovieOvyData *data);
IntroMovieBgLinearAnims *IntroMovie_GetBgLinearAnimsController(IntroMovieOvyData *data);
BOOL IntroMovie_GetIntroSkippedFlag(IntroMovieOvyData *data);
int IntroMovie_GetTotalFrameCount(IntroMovieOvyData *data);
void IntroMovie_InitBgAnimGxState(IntroMovieOvyData *data);
void IntroMovie_BeginCircleWipeEffect(IntroMovieOvyData *data, int kind, BOOL isTopScreen, int duration);
BOOL IntroMovie_WaitCircleWipeEffect(IntroMovieOvyData *data);
void *IntroMovie_GetSceneDataPtr(IntroMovieOvyData *data);
void IntroMovie_AdvanceSceneStep(IntroMovieOvyData *data);
u8 IntroMovie_GetSceneStep(IntroMovieOvyData *data);
u8 IntroMovie_GetSceneStepTimer(IntroMovieOvyData *data);

#endif //POKEHEARTGOLD_INTRO_MOVIE_INTERNAL
