#include "math_util.h"

#define FX16_TO_FX32(x)   FX32_CONST(FX_FX16_TO_F32(x))

u16 sub_0201FCD4(u16 deg);

fx32 sub_0201FBB8(u16 deg) {
    fx16 sinval;
    if (deg >= 360) {
        return 0;
    }
    sinval = FX_SinIdx(sub_0201FCD4(deg));
    return FX16_TO_FX32(sinval);
}

fx32 sub_0201FC30(u16 deg) {
    fx16 cosval;
    if (deg >= 360) {
        return 0;
    }
    cosval = FX_CosIdx(sub_0201FCD4(deg));
    return FX16_TO_FX32(cosval);
}

fx32 sub_0201FCAC(u16 deg) {
    deg %= 360;
    return sub_0201FBB8(deg);
}

fx32 sub_0201FCC0(u16 deg) {
    deg %= 360;
    return sub_0201FC30(deg);
}

u16 sub_0201FCD4(u16 deg) {
    if (deg >= 360) {
        return 0;
    }
    return FX_DEG_TO_IDX(deg << FX32_SHIFT);
}

u16 sub_0201FD00(u16 deg) {
    return sub_0201FCD4(deg % 360);
}

fx32 sub_0201FD14(fx32 deg) {
    return sub_0201FCAC(deg >> FX32_SHIFT);
}

fx32 sub_0201FD20(fx32 deg) {
    return sub_0201FCC0(deg >> FX32_SHIFT);
}
