#ifndef NITRO_GX_G2_OAM_H_
#define NITRO_GX_G2_OAM_H_

typedef struct {
    union {
        u32 attr01;
        struct {
            u16 attr0;
            u16 attr1;
        };
        struct {
            u32 y:8;
            u32 rsMode:2;
            u32 objMode:2;
            u32 mosaic:1;
            u32 colorMode:1;
            u32 shape:2;

            u32 x:9;
            u32 rsParam:5;
            u32 size:2;
        };
        struct {
            u32 _0:28;
            u32 flipH:1;
            u32 flipV:1;
            u32 _1:2;
        };
    };
    union {
        struct {
            u16 attr2;
            u16 _3;
        };
        u32 attr23;
        struct {
            u32 charNo:10;
            u32 priority:2;
            u32 cParam:4;
            u32 _2:16;
        };
    };
} GXOamAttr;

typedef enum {
    GX_OAM_MODE_NORMAL = 0,
    GX_OAM_MODE_XLU = 1,
    GX_OAM_MODE_OBJWND = 2,
    GX_OAM_MODE_BITMAPOBJ = 3
} GXOamMode;

#endif //NITRO_GX_G2_OAM_H_
