#include "global.h"
#include "gymmick.h"

void Save_Gymmick_Clear(Gymmick *gymmick) {
    MI_CpuClear8(gymmick, sizeof(Gymmick));
}

GymmickUnion *Save_Gymmick_Init(Gymmick *gymmick, GymmickType type) {
    Save_Gymmick_Clear(gymmick);
    gymmick->type = type;
    return &gymmick->data;
}

GymmickUnion *Save_Gymmick_AssertMagic_GetData(Gymmick *gymmick, GymmickType type) {
    GF_ASSERT(gymmick->type == type);
    return &gymmick->data;
}

GymmickType Save_Gymmick_GetType(Gymmick *gymmick) {
    return gymmick->type;
}
