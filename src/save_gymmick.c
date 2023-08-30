#include "global.h"
#include "gymmick.h"

void Save_Gymmick_Clear(Gymmick *gymmick) {
    MI_CpuClear8(gymmick, sizeof(Gymmick));
}

GymmickUnion *Save_Gymmick_Init(Gymmick *gymmick, int kind) {
    Save_Gymmick_Clear(gymmick);
    gymmick->kind = kind;
    return &gymmick->data;
}

GymmickUnion *Save_Gymmick_AssertMagic_GetData(Gymmick *gymmick, int kind) {
    GF_ASSERT(gymmick->kind == kind);
    return &gymmick->data;
}

int Save_Gymmick_GetType(Gymmick *gymmick) {
    return gymmick->kind;
}
