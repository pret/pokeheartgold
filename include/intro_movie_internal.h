#ifndef POKEHEARTGOLD_INTRO_MOVIE_INTERNAL
#define POKEHEARTGOLD_INTRO_MOVIE_INTERNAL

#include "bg_window.h"
#include "camera.h"
#include "gf_3d_vramman.h"
#include "sprite.h"
#include "sys_task.h"
#include "unk_02014DA0.h"

enum IntroMovieSceneState {
    INTRO_MOVIE_SCENE_INIT,
    INTRO_MOVIE_SCENE_RUN,
    INTRO_MOVIE_SCENE_EXIT,
};

typedef struct IntroMovieScene1Data {
    u8 state;
    u8 needFreeGfx;
    u8 *skipAllowedPtr;
    SpriteResource *charResObj;
    SpriteResource *plttResObj;
    SpriteResource *cellResObj;
    SpriteResource *animResObj;
    Sprite *sunSprite;
    Sprite *birdSprite;
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
    SpriteResource *spriteGfxRes[2][4];
    Sprite *ethanSprite0;
    Sprite *lyraSprite0;
    Sprite *ethanSprite1;
    Sprite *lyraSprite1;
    Sprite *ethanSprite2;
    Sprite *lyraSprite2;
    Sprite *flowerSprites[10];
    IntroMovieScene2SpritePanController spritePanCnt[2];
} IntroMovieScene2Data;

typedef struct IntroMovieScene3MapRender {
    NNSG3dRenderObj renderObj;
    NNSG3dResFileHeader *resFileHeader;
    void *rawData[2];
    NNSG3dAnmObj *animObjs[2];
} IntroMovieScene3MapRender;

typedef struct IntroMovieScene3Data {
    u8 state;
    u8 needFreeGfx;
    u8 unk_002; // unreferenced
    u8 silverBgAppearCounter;
    void *rivalGraphicSectionsRawData[4];
    void *rivalGraphicWholeRawData;
    void *beastGraphicRawData[3];
    NNSG2dScreenData *rivalGraphicSectionsScrnData[4];
    NNSG2dScreenData *rivalGraphicWholeScrnData;
    NNSG2dScreenData *beastGraphicScrnData[3];
    SpriteResource *spriteResObjs[2][4];
    Sprite *silverSilhouetteSprite;
    Sprite *eusineSprite;
    Sprite *unownSprites[3];
    u8 filler_078[0x8]; // unused
    Camera *camera;
    IntroMovieScene3MapRender mapRender[3];
    GF3DVramMan *gf3dVramMan;
    NNSFndAllocator allocator;
    int whichMap;
} IntroMovieScene3Data; // size: 0x1D4

typedef struct IntroMovieScene4Data {
    u8 state;
    u8 needFreeGfx;
    u8 filler_002[2];
    SpriteResource *spriteResObjs[4][4];
    Sprite *hand1Sprite;
    Sprite *hand2Sprite;
    Sprite *sparklesSprite;
    Sprite *starterSprites[3];
    GF3DVramMan *gf3dVramMan;
    void *particleHeap;
    SPLEmitter *particleSystem;
    int flipScreensTaskArg;
    SysTask *flipScreensTask;
} IntroMovieScene4Data;

typedef struct IntroMovieScene5Data {
    u8 state;
    u8 needFreeGfx;
} IntroMovieScene5Data;

typedef struct IntroMovieBgBlendAnim {
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
    GFBgLayer bgId;
    s16 duration;
    u8 counter;
    u8 finished;
    SysTask *task;
    s16 xChange;
    s16 yChange;
    s16 xOrig;
    s16 yOrig;
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

typedef struct IntroMovieCircleWipeEffect {
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
    G2dRenderer spriteRenderer;
    GF_2DGfxResMan *spriteResManagers[4];
    u32 savedLCRngSeed;
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
} IntroMovieOverlayData; // size: 0x62C

BOOL IntroMovie_Scene1(IntroMovieOverlayData *data, void *pVoid);
BOOL IntroMovie_Scene2(IntroMovieOverlayData *data, void *pVoid);
BOOL IntroMovie_Scene3(IntroMovieOverlayData *data, void *pVoid);
BOOL IntroMovie_Scene4(IntroMovieOverlayData *data, void *pVoid);
BOOL IntroMovie_Scene5(IntroMovieOverlayData *data, void *pVoid);

void IntroMovie_CreateSpriteResourceManagers(IntroMovieOverlayData *data, const u8 *counts);
void IntroMovie_DestroySpriteResourceManagers(IntroMovieOverlayData *data);
GF_2DGfxResMan **IntroMovie_GetSpriteResourceManagersArray(IntroMovieOverlayData *data);
void IntroMovie_StartSpriteAnimAndMakeVisible(Sprite *sprite, BOOL active);
void IntroMovie_BuildSpriteResourcesHeaderAndTemplate(int resId, IntroMovieOverlayData *data, int priority, NNS_G2D_VRAM_TYPE vram, SpriteTemplate *template, SpriteResourcesHeader *header);
void IntroMovie_RendererSetSurfaceCoords(IntroMovieOverlayData *data, int mainx, int mainy, int subx, int suby);
void IntroMovie_StartBlendFadeEffect(IntroMovieBgBlendAnim *data, int plane1, int plane2, u8 duration, int direction, int screen);
void IntroMovie_StartBgScroll_VBlank(BgConfig *bgConfig, IntroMovieBgScrollAnim *data, GFBgLayer bgId, s16 xChange, s16 yChange, int duration);
void IntroMovie_StartBgScroll_NotVBlank(BgConfig *bgConfig, IntroMovieBgScrollAnim *data, GFBgLayer bgId, s16 xChange, s16 yChange, int duration);
BOOL IntroMovie_WaitBgScrollAnim(IntroMovieBgScrollAnim *data, GFBgLayer bgId);
void IntroMovie_CancelBgScrollAnim(IntroMovieBgScrollAnim *data, GFBgLayer bgId);
IntroMovieBgWindowAnim *IntroMovie_StartWindowPanEffect(IntroMovieBgWindowAnim *data, int duration, int whichScreen, const IntroMovieBgWindowAnimParam *param);
BOOL IntroMovie_WaitWindowPanEffect(IntroMovieBgWindowAnim *data, int whichScreen);
void IntroMovie_WindowsOn_SetInsideOutsidePlanes(int winIn, int winOut, u8 topScreenEffect, u8 bottomSCreenEffect, int whichScreen);
void IntroMovie_SetBgWindowsPosition(int x1, int y1, int x2, int y2, int whichScreen);
BgConfig *IntroMovie_GetBgConfig(IntroMovieOverlayData *data);
IntroMovieBgLinearAnims *IntroMovie_GetBgLinearAnimsController(IntroMovieOverlayData *data);
BOOL IntroMovie_GetIntroSkippedFlag(IntroMovieOverlayData *data);
int IntroMovie_GetTotalFrameCount(IntroMovieOverlayData *data);
void IntroMovie_InitBgAnimGxState(IntroMovieOverlayData *data);
void IntroMovie_BeginCircleWipeEffect(IntroMovieOverlayData *data, int kind, BOOL isTopScreen, int duration);
BOOL IntroMovie_WaitCircleWipeEffect(IntroMovieOverlayData *data);
void *IntroMovie_GetSceneDataPtr(IntroMovieOverlayData *data);
void IntroMovie_AdvanceSceneStep(IntroMovieOverlayData *data);
u8 IntroMovie_GetSceneStep(IntroMovieOverlayData *data);
u8 IntroMovie_GetSceneStepTimer(IntroMovieOverlayData *data);

#endif // POKEHEARTGOLD_INTRO_MOVIE_INTERNAL
