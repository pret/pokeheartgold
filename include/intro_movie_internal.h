#ifndef POKEHEARTGOLD_INTRO_MOVIE_INTERNAL
#define POKEHEARTGOLD_INTRO_MOVIE_INTERNAL

#include "bg_window.h"
#include "sys_task.h"
#include "unk_02023694.h"

typedef struct IntroMovieScene1Data {
    u8 unk_000;
    u8 unk_001;
    u8 *skipAllowedPtr;
    _2DGfxResObj *charResObj;
    _2DGfxResObj *plttResObj;
    _2DGfxResObj *cellResObj;
    _2DGfxResObj *animResObj;
    Sprite *unk_018;
    void *unk_01C;
} IntroMovieScene1Data;

typedef struct IntroMovieScene2DataSub_064 {
    BOOL active;
    s16 duration;
    u8 counter;
    u8 finished;
    SysTask *task;
    int xSpeed;
    int ySpeed;
    int xOffset;
    int yOffset;
    Sprite *unk_01C;
    Sprite *unk_020;
    Sprite *unk_024;
} IntroMovieScene2DataSub_064;

typedef struct IntroMovieScene2Data {
    u8 unk_000;
    u8 unk_001;
    u8 unk_002;
    u8 flowerIndex;
    _2DGfxResObj *unk_004[2][4];
    Sprite *unk_024;
    Sprite *unk_028;
    Sprite *unk_02C;
    Sprite *unk_030;
    Sprite *unk_034;
    Sprite *unk_038;
    Sprite *flowerSprites[10];
    struct IntroMovieScene2DataSub_064 unk_064[2];
} IntroMovieScene2Data;

typedef struct IntroMovieScene3Data {
    u8 unk_000;
    u8 padding_001[3];
    u8 filler_004[0x1D0];
} IntroMovieScene3Data;

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
    u8 rate;
    u8 ev;
    u8 stopped;
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
    s16 rate;
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
void IntroMovie_StartBlendFadeEffect(IntroMovieBgBlendAnim *data, int plane1, int plane2, u8 rate, int direction, int screen);
void IntroMovie_StartBgScroll_VBlank(BgConfig *bgConfig, IntroMovieBgScrollAnim *data, enum GFBgLayer bgId, fx16 xChange, fx16 yChange, int rate);
void IntroMovie_StartBgScroll_NotVBlank(BgConfig *bgConfig, IntroMovieBgScrollAnim *data, enum GFBgLayer bgId, fx16 xChange, fx16 yChange, int rate);
BOOL IntroMovie_WaitBgScrollAnim(IntroMovieBgScrollAnim *data, enum GFBgLayer bgId);
void IntroMovie_CancelBgScrollAnim(IntroMovieBgScrollAnim *data, enum GFBgLayer bgId);
IntroMovieBgWindowAnim *IntroMovie_StartWindowPanEffect(IntroMovieBgWindowAnim *data, int duration, int whichScreen, const IntroMovieBgWindowAnimParam *param);
BOOL IntroMovie_WaitWindowPanEffect(IntroMovieBgWindowAnim *data, int a1);
void IntroMovie_WindowsOn_SetInsideOutsidePlanes(int winIn, int winOut, u8 topScreenEffect, u8 bottomSCreenEffect, int whichScreen);
void IntroMovie_SetBgWindowsPosition(int x1, int y1, int x2, int y2, int whichScreen);
BgConfig *IntroMovie_GetBgConfig(IntroMovieOvyData *data);
IntroMovieBgLinearAnims *IntroMovie_GetBgLinearAnimsController(IntroMovieOvyData *data);
BOOL IntroMovie_GetIntroSkippedFlag(IntroMovieOvyData *data);
int IntroMovie_GetTotalFrameCount(IntroMovieOvyData *data);
void IntroMovie_InitBgAnimGxState(IntroMovieOvyData *data);
void IntroMovie_BeginCirleWipeEffect(IntroMovieOvyData *data, int a1, int a2, int a3);
BOOL IntroMovie_WaitCircleWipeEffect(IntroMovieOvyData *data);
void *IntroMovie_GetSceneDataPtr(IntroMovieOvyData *data);
void IntroMovie_AdvanceSceneStep(IntroMovieOvyData *data);
u8 IntroMovie_GetSceneStep(IntroMovieOvyData *data);
u8 IntroMovie_GetSceneStepTimer(IntroMovieOvyData *data);

#endif //POKEHEARTGOLD_INTRO_MOVIE_INTERNAL
