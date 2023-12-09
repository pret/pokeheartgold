#include "global.h"
#include "unk_02018380.h"
#include "timer_3.h"

static UnkStruct_021D10E8 s_021D10E8;

void sub_02018380(void) {
    s_021D10E8.unk0 = 0;
}

void sub_0201838C(IGT *igt) {
    s_021D10E8.unk0 = 1;
    s_021D10E8.unk10 = 0;
    s_021D10E8.unk14 = 0;
    s_021D10E8.unk8 = 0;
    s_021D10E8.igt = igt;
    s_021D10E8.unk18 = sub_020254FC();
}

void sub_020183B0(void) {
    if (s_021D10E8.unk0 == 0) {
        return;
    }

    u64 val = sub_020254FC();
    u64 val2 = sub_02025504(val - s_021D10E8.unk18);
    if (s_021D10E8.unk8 >= val2) {
        return;
    }

    AddIGTSeconds(s_021D10E8.igt, val2 - s_021D10E8.unk8);
    s_021D10E8.unk8 = val2;
}
