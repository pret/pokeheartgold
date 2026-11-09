// Suppress include sorting
// clang-format off
#include "global.h"
#include "overlay_35.h"
// clang-format on

struct UnkStruct_Overlay35 {
    u8 filler_00[2];
    u8 unk_02;
    u8 unk_03;
    u8 unk_04;
    u8 filler05[0x3F];
    void (*unk_44)(void *);
    void *unk_48;
};

void ov35_02259D80(UnkStruct_Overlay35 *a0, u32 a1) {
    switch (a1) {
    case 1:
        a0->unk_04 = 1;
        break;
    case 4:
        if (a0->unk_02 == 2) {
            if (a0->unk_44 != NULL) {
                a0->unk_44(a0->unk_48);
            }
        }
        break;
    case 0:
    case 2:
    case 3:
    case 5:
        break;
    }
}

int ov35_02259DB8(UnkStruct_Overlay35 *a0) {
    return a0->unk_03;
}
