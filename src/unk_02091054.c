#include "unk_02091054.h"

typedef struct {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3_0:2;
    u8 unk3_2:6;
} Unk02091054;

extern Unk02091054 _02105F04[81];

// Has something to do with seals...
u8 sub_02091054(u32 idx) {
    GF_ASSERT(idx < NELEMS(_02105F04));
    return _02105F04[idx].unk0;
}

u8 sub_0209106C(u32 idx) {
    GF_ASSERT(idx < NELEMS(_02105F04));
    return _02105F04[idx].unk1;
}

u8 sub_02091084(u32 idx) {
    GF_ASSERT(idx < NELEMS(_02105F04));
    return _02105F04[idx].unk2;
}

BOOL sub_0209109C(u32 idx) {
    GF_ASSERT(idx < NELEMS(_02105F04));
    if (idx < 0x32 || idx > 0x4d) {
        return FALSE;
    }

    return TRUE;
}

u32 sub_020910B8(u32 idx) {
    GF_ASSERT(idx < NELEMS(_02105F04));
    Unk02091054 *ptr = &_02105F04[idx];
    return ptr->unk3_2;
}
