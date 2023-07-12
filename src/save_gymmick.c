#include "global.h"
#include "gymmick.h"

void SavGymmick_Clear(struct Gymmick *gymmick) {
    MI_CpuClear8(gymmick, sizeof(struct Gymmick));
}

union GymmickUnion *SavGymmick_Init(struct Gymmick *gymmick, int kind) {
    SavGymmick_Clear(gymmick);
    gymmick->kind = kind;
    return &gymmick->data;
}

union GymmickUnion *SavGymmick_AssertMagic_GetData(struct Gymmick *gymmick, int kind) {
    GF_ASSERT(gymmick->kind == kind);
    return &gymmick->data;
}

int SavGymmick_GetType(struct Gymmick *gymmick) {
    return gymmick->kind;
}
