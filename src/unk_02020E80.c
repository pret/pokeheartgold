#include "unk_02020E80.h"

#include <nitro.h>

#include "global.h"

BOOL sub_02020E80(Vec2D *arg0, Vec2D *arg1, Vec2D *arg2) {
    return arg2->x * (arg0->y - arg1->y) + arg0->x * (arg1->y - arg2->y) + arg1->x * (arg2->y - arg0->y) >= 0;
}

BOOL sub_02020EB0(Vec2D *arg0, Vec2D *arg1, Vec2D *arg2, Vec2D *arg3) {
    return (sub_02020E80(arg0, arg1, arg2) ^ sub_02020E80(arg0, arg1, arg3)) == 1
        && (sub_02020E80(arg2, arg3, arg0) ^ sub_02020E80(arg2, arg3, arg1)) == 1;
}

VecFx322D sub_02020EF4(int arg0, int arg1, int arg2, int arg3) {
    VecFx322D ret;

    s16 v0 = arg3 - arg1;
    s16 v1 = arg2 - arg0;

    if (v1 != 0) {
        ret.x = FX_Div(v0 << FX32_SHIFT, v1 << FX32_SHIFT);
    } else {
        ret.x = FX32_CONST(0xFF);
    }

    ret.y = (arg1 << FX32_SHIFT) - FX_Mul(ret.x, arg0 << FX32_SHIFT);
    return ret;
}

BOOL sub_02020F4C(Vec2D *arg0, Vec2D *arg1, Vec2D *arg2, Vec2D *arg3, Vec2D *arg4) {
    fx32 temp_r0;
    fx32 sp10;
    fx32 sp30;
    fx32 sp2C;

    VecFx322D sp24;
    VecFx322D sp1C;
    Vec2D v0;
    Vec2D v1;
    Vec2D v2;
    Vec2D v3;

    if (arg4 != NULL) {
        arg4->x = 0xFFFF;
        arg4->y = 0xFFFF;
    }
    if (sub_02020EB0(arg0, arg1, arg2, arg3) == 0) {
        return 0;
    }
    sp24 = sub_02020EF4(arg0->x, arg0->y, arg1->x, arg1->y);
    sp1C = sub_02020EF4(arg2->x, arg2->y, arg3->x, arg3->y);
    if (sp24.x == sp1C.x) {
        return 0;
    }

    temp_r0 = FX_Div(sp1C.y - sp24.y, sp24.x - sp1C.x);
    sp10 = FX_Mul(sp1C.x, temp_r0) + sp1C.y;

    if (FX_Modf(temp_r0, &sp30) >= FX32_HALF) {
        sp30 += FX32_ONE;
    }
    arg4->x = sp30 >> FX32_SHIFT;

    if (FX_Modf(sp10, &sp2C) >= FX32_HALF) {
        sp2C += FX32_ONE;
    }
    arg4->y = sp2C >> FX32_SHIFT;

    if (arg0->x >= arg1->x) {
        v0.x = arg0->x;
        v1.x = arg1->x;
    } else {
        v0.x = arg1->x;
        v1.x = arg0->x;
    }

    if (arg0->y >= arg1->y) {
        v0.y = arg0->y;
        v1.y = arg1->y;
    } else {
        v0.y = arg1->y;
        v1.y = arg0->y;
    }

    if (arg2->x >= arg3->x) {
        v2.x = arg2->x;
        v3.x = arg3->x;
    } else {
        v2.x = arg3->x;
        v3.x = arg2->x;
    }

    if (arg2->y >= arg3->y) {
        v2.y = arg2->y;
        v3.y = arg3->y;
    } else {
        v2.y = arg3->y;
        v3.y = arg2->y;
    }

    if ((v0.x >= arg4->x && v1.x <= arg4->x)
        && (v0.y >= arg4->y && v1.y <= arg4->y)
        && (v2.x >= arg4->x && v3.x <= arg4->x)
        && (v2.y >= arg4->y && v3.y <= arg4->y)) {
        return TRUE;
    }
    return FALSE;
}
