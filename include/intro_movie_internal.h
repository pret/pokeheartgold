#ifndef POKEHEARTGOLD_INTRO_MOVIE_INTERNAL
#define POKEHEARTGOLD_INTRO_MOVIE_INTERNAL

#include "bg_window.h"
#include "sys_task.h"
#include "unk_02023694.h"

struct IntroMovieSub_150 {
    u8 unk_000;
    u8 *unk_004;
    u8 filler_008[0x10];
    Sprite *unk_018;
    void *unk_01C;
};

struct IntroMovieSub_170_Sub_064 {
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
};

struct IntroMovieSub_170 {
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
    struct IntroMovieSub_170_Sub_064 unk_064;
    struct IntroMovieSub_170_Sub_064 unk_08C;
};

struct IntroMovieSub_224 {
    u8 unk_000;
    u8 padding_001[3];
    u8 filler_004[0x1D0];
};

struct IntroMovieSub_3F8 {
    u8 unk_000;
    u8 padding_001[3];
    u8 filler_004[0x6C];
};

struct IntroMovieSub_468 {
    u8 unk_000;
    u8 unk_001;
};

struct IntroMovieSub_494 {
    u8 filler_00[0x18];
    SysTask *unk_18;
};

struct IntroMovieSub_574 {
    u8 filler_00[0x14];
    SysTask *unk_14;
    u8 filler_18[0x34];
};

typedef struct IntroMovieOvyData {
    HeapID heapID;
    int unk_004;
    BOOL unk_008;
    BgConfig *bgConfig;
    SpriteList *unk_010;
    GF_G2dRenderer unk_014;
    u8 filler_13C[0x10];
    u32 unk_14C;
    struct IntroMovieSub_150 unk_150;
    struct IntroMovieSub_170 unk_170;
    struct IntroMovieSub_224 unk_224;
    struct IntroMovieSub_3F8 unk_3F8;
    struct IntroMovieSub_468 unk_468;
    u8 filler_46C[4];
    SysTask *unk_470;
    u8 filler_unk_474[0x14];
    SysTask *unk_488;
    u8 filler_48C[0x8];
    struct IntroMovieSub_494 unk_494[8];
    struct IntroMovieSub_574 unk_574[2];
    u8 filler_60C[0x10];
    SysTask *unk_61C;
    u8 filler_620[8];
    u8 unk_628;
    u8 unk_629;
    u8 unk_62A;
    u8 unk_62B;
} IntroMovieOvyData; // size: 0x62C

BOOL ov60_021E7984(IntroMovieOvyData *data, void *a1);
BOOL ov60_021E80E0(IntroMovieOvyData *data, void *a1);
BOOL ov60_021E8BF8(IntroMovieOvyData *data, void *a1);
BOOL ov60_021E9D08(IntroMovieOvyData *data, void *a1);
BOOL ov60_021EAA14(IntroMovieOvyData *data, void *a1);

#endif //POKEHEARTGOLD_INTRO_MOVIE_INTERNAL
