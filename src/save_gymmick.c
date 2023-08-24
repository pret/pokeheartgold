#include "global.h"
#include "gymmick.h"

void Save_Gymmick_Clear(struct Gymmick *gymmick) {
    MI_CpuClear8(gymmick, sizeof(struct Gymmick));
}

union GymmickUnion *Save_Gymmick_Init(struct Gymmick *gymmick, int kind) {
    Save_Gymmick_Clear(gymmick);
    gymmick->kind = kind;
    return &gymmick->data;
}

union GymmickUnion *Save_Gymmick_AssertMagic_GetData(struct Gymmick *gymmick, int kind) {
    GF_ASSERT(gymmick->kind == kind);
    return &gymmick->data;
}

int Save_Gymmick_GetType(struct Gymmick *gymmick) {
    return gymmick->kind;
}
