#ifndef POKEHEARTGOLD_INTRO_MOVIE_INTERNAL
#define POKEHEARTGOLD_INTRO_MOVIE_INTERNAL

#include "bg_window.h"
#include "sys_task.h"
#include "unk_02023694.h"

typedef struct IntroMovieScene1Data {
    u8 unk_000;
    u8 *unk_004;
    u8 filler_008[0x10];
    Sprite *unk_018;
    void *unk_01C;
} IntroMovieScene1Data;

typedef struct IntroMovieScene2DataSub_064 {
    BOOL unk_000;
    u16 unk_004;
    u8 unk_006;
    u8 unk_007;
    SysTask *unk_008;
    int unk_00C;
    int unk_010;
    int unk_014;
    int unk_018;
    Sprite *unk_01C;
    Sprite *unk_020;
    Sprite *unk_024;
} IntroMovieScene2DataSub_064;

typedef struct IntroMovieScene2Data {
    u8 unk_000;
    u8 unk_001;
    u8 unk_002;
    u8 unk_003;
    _2DGfxResObj *unk_004[2][4];
    Sprite *unk_024;
    Sprite *unk_028;
    Sprite *unk_02C;
    Sprite *unk_030;
    Sprite *unk_034;
    Sprite *unk_038;
    Sprite *unk_03C[10];
    struct IntroMovieScene2DataSub_064 unk_064;
    struct IntroMovieScene2DataSub_064 unk_08C;
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
} IntroMovieSub_46C_000;

typedef struct IntroMovieSub_46C_030 {
    BgConfig *bgConfig;
    int running;
    enum GFBgLayer bgId;
    fx16 rate;
    u8 counter;
    u8 stopped;
    SysTask *task;
    fx16 xChange;
    fx16 yChange;
    fx16 xOrig;
    fx16 yOrig;
} IntroMovieSub_46C_030;

typedef struct IntroMovieSub_46C_110_template {
    int unk_00;
    int unk_04;
    int unk_08;
    int unk_0C;
    int unk_10;
    int unk_14;
    int unk_18;
    int unk_1C;
    int unk_20;
    int unk_24;
    u16 unk_28;
    u16 unk_2A;
} IntroMovieSub_46C_110_template;

typedef struct IntroMovieSub_46C_110 {
    int unk_00;
    int unk_04;
    s16 unk_08;
    u8 unk_0A;
    u8 unk_0B;
    SysTask *unk_0C;
    IntroMovieSub_46C_110_template unk_10;
    int unk_3C;
    int unk_40;
    int unk_44;
    int unk_48;
} IntroMovieSub_46C_110;

typedef struct IntroMovieSub_46C {
    IntroMovieSub_46C_000 unk_000[2];
    IntroMovieSub_46C_030 unk_030[8];
    IntroMovieSub_46C_110 unk_110[2];
} IntroMovieSub_46C;

typedef struct IntroMovieOvyData {
    HeapID heapID;
    int unk_004;
    BOOL unk_008;
    BgConfig *bgConfig;
    SpriteList *unk_010;
    GF_G2dRenderer unk_014;
    _2DGfxResMan *unk_13C[4];
    u32 unk_14C;
    IntroMovieScene1Data unk_150;
    IntroMovieScene2Data unk_170;
    IntroMovieScene3Data unk_224;
    IntroMovieScene4Data unk_3F8;
    IntroMovieScene5Data unk_468;
    IntroMovieSub_46C unk_46C;
    u8 filler_614[0x8];
    SysTask *unk_61C;
    u8 filler_620[8];
    u8 unk_628;
    u8 unk_629;
    u8 unk_62A;
    u8 unk_62B;
} IntroMovieOvyData; // size: 0x62C

BOOL IntroMovie_Scene1(IntroMovieOvyData *data, void *a1);
BOOL IntroMovie_Scene2(IntroMovieOvyData *data, void *a1);
BOOL IntroMovie_Scene3(IntroMovieOvyData *data, void *a1);
BOOL IntroMovie_Scene4(IntroMovieOvyData *data, void *a1);
BOOL IntroMovie_Scene5(IntroMovieOvyData *data, void *a1);

void ov60_021E6ED8(IntroMovieOvyData *data, const u8 *counts);
void ov60_021E6F00(IntroMovieOvyData *data);
_2DGfxResMan **ov60_021E6F20(IntroMovieOvyData *data);
void ov60_021E6F28(Sprite *sprite, BOOL active);
void ov60_021E6F3C(int resId, IntroMovieOvyData *data, int priority, NNS_G2D_VRAM_TYPE whichScreen, SpriteTemplate *template, SpriteResourcesHeader *header);
void ov60_021E6FAC(IntroMovieOvyData *data, int mainx, int mainy, int subx, int suby);
void ov60_021E6FD0(IntroMovieSub_46C_000 *data, int plane1, int plane2, u8 rate, int direction, int screen);
void ov60_021E7074(BgConfig *bgConfig, IntroMovieSub_46C_030 *data, enum GFBgLayer bgId, fx16 xChange, fx16 yChange, fx32 rate);
void ov60_021E7120(BgConfig *bgConfig, IntroMovieSub_46C_030 *data, enum GFBgLayer bgId, fx16 xChange, fx16 yChange, fx32 rate);
int ov60_021E734C(enum GFBgLayer bgId);
BOOL ov60_021E72FC(IntroMovieSub_46C_030 *data, enum GFBgLayer bgId);
void ov60_021E7324(IntroMovieSub_46C_030 *data, enum GFBgLayer bgId);
IntroMovieSub_46C_110 *ov60_021E7398(IntroMovieSub_46C_110 *data, int a1, int a2, const IntroMovieSub_46C_110_template *a3);
BOOL ov60_021E7434(IntroMovieSub_46C_110 *data, int a1);
void ov60_021E74F0(int a0, int a1, u8 a2, u8 a3, int a4);
void ov60_021E75C4(int a0, int a1, int a2, int a3, int a4);
BgConfig *ov60_021E7688(IntroMovieOvyData *data);
IntroMovieSub_46C *ov60_021E768C(IntroMovieOvyData *data);
BOOL ov60_021E7698(IntroMovieOvyData *data);
int ov60_021E769C(IntroMovieOvyData *data);
void ov60_021E76A0(IntroMovieOvyData *data);

#endif //POKEHEARTGOLD_INTRO_MOVIE_INTERNAL
