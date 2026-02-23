#include "overlay_44.h"

#include "unk_02037C94.h"

s32 ov44_02235268(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340* arg1, enum HeapID arg2) {
    sub_struct* temp_r0;
    
    if (IsPaletteFadeFinished() != 0) {
        sub_01034354(arg1->unk8, 0);
        arg0->unk27 = 1;
        ov44_02234204(arg0);
        ov44_02233214(arg0, arg2);
        arg0 = arg0;
        memset(&arg0->unk30, 0, 0x7e << 2);
        ov44_02234028(arg0);
        ov44_022331C4(arg0, arg1, arg2);
        sub_0203A880();
        arg0->unk12 = 0;
        arg0->unk13 = 0;
        temp_r0 = (sub_struct*)&arg0->unk14;
        arg0->unk14 = 0;
        temp_r0->unk1 = 0;
        temp_r0->unk2 = 0;
        temp_r0->unk3 = 0;
        temp_r0 = (sub_struct*)&arg0->unk18;
        arg0->unk18 = 0;
        temp_r0->unk1 = 0;
        temp_r0->unk2 = 0;
        temp_r0->unk3 = 0;
        MI_CpuFill8(&arg0->unk1C, 1, 4);
        MI_CpuFill8(&arg0->unk20, 1, 4);
        temp_r0 = (sub_struct*)&arg0->unk28;
        arg0->unk24 = 0;
        arg0->unk26 = 0;
        arg0->unk28 = 0;
        temp_r0->unk1 = 0;
        temp_r0->unk2 = 0;
        temp_r0->unk3 = 0;
        BeginNormalPaletteFade(3, 1, 1, 6, 1, arg2);
        arg0->unk5 = 0x1C;
    }
    return 0;
}


s32 ov44_0223532C(UnkStruct_ov44_02235340* arg0) {
    if (IsPaletteFadeFinished() != 0) {
        arg0->unk5 = 0;
    }
    return 0;
}

s32 ov44_02235340(UnkStruct_ov44_02235340* arg0) {
    sub_02039358();
    sub_02039B58();
    arg0->unk7 = 0;
    sub_020398D4(0, 1);
    return 1;
}