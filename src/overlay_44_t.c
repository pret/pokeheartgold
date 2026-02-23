#include "overlay_44.h"

#include "unk_02037C94.h"
#include "unk_0200FA24.h"
#include "unk_0203A3B0.h"
#include "unk_02034354.h"
#include "unk_02035900.h"

// const struct WindowTemplate ov44_0223645C = {0x02, 0x19, 0x0D, 0x05, 0x04, 0x01, 0x39};
extern const WindowTemplate ov44_0223645C;

s32 ov44_02235090(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    s32 temp_r0;

    ov44_02233F6C(arg0, heapID);
    if (ov44_0223442C(arg0) == 1) {
        arg0->unk5 = 0xA;
        ov44_02233954(&arg0->unk30);
        Clear2dMenuWindowAndDelete(arg0->unk20C, heapID);
        arg0->unk20C = 0;
        return 0;
    }
    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk20C, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            ov44_02233D38(arg0, heapID);
            ov44_022340B4(arg0);
        }
        arg0->unk5 = 8;
        arg0->unk20C = 0;
    }
    return 0;
}

s32 ov44_02235100(UnkStruct_ov44_02235340* arg0, s32 arg1, s32 arg2) {
    arg0->unk26 = sub_02034870(0);
    if (arg0->unk26 == 0x20) {
        GF_AssertFail();
    }
    ov44_02233C88(&arg0->unk30, arg1, 0, 0, arg2);
    sub_02039358();
    arg0->unk27 = 0;
    ov44_02233860(&arg0->unk30, arg1, 0x84, arg2);
    arg0->unk5 = 0x16;
    return 0;
}

s32 ov44_02235158(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk20C = Std_CreateYesNoMenu(arg0->unk30, &ov44_0223645C, 0x30, 4, heapID);
    arg0->unk5 = 0x17;
    return 0;
}

s32 ov44_0223518C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    s32 temp_r0;
    s8 var_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk20C, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            var_r0 = 0x18;
        } else {
            var_r0 = 0x1D;
        }
        arg0->unk5 = var_r0;
        arg0->unk20C = 0;
    }
    return 0;
}

s32 ov44_022351BC(UnkStruct_ov44_02235340* arg0, s32 arg1, s32 arg2) {
    ov44_02233860(&arg0->unk30, arg1, 0x11, arg2);
    ov44_022342B8(arg0);
    arg0->unk8 = 0x5A;
    arg0->unk5 = 0x19;
    return 0;
}

s32 ov44_022351DC(UnkStruct_ov44_02235340* arg0, u8* arg1) {
    if (arg0->unk8 > 0) {
        arg0->unk8 = arg0->unk8 - 1;
        return 0;
    }
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    if (ov44_02233E80(arg0->unk26, *arg1) != 0) {
        arg0->unk5 = 0x1A;
    }
    return 0;
}

s32 ov44_02235218(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233E48();
    if ((sub_020390C4() == 1) && (sub_020373B4(0) == 1)) {
        sub_020378E4(0);
        ov44_022342E0(arg0, arg1, heapID);
        BeginNormalPaletteFade(3, 0, 0, 0, 6, 1, heapID);
        arg0->unk5 = 0x1B;
    }
    return 0;
}

s32 ov44_02235268(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340* arg1, enum HeapID heapID) {
    sub_struct* temp_r0;
    
    if (IsPaletteFadeFinished() != 0) {
        sub_02034354(arg1->unk8, 0);
        arg0->unk27 = 1;
        ov44_02234204(arg0);
        ov44_02233214(arg0, heapID);
        arg0 = arg0;
        memset(&arg0->unk30, 0, 0x7e << 2);
        ov44_02234028(arg0);
        ov44_022331C4(arg0, arg1, heapID);
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
        BeginNormalPaletteFade(3, 1, 1, 0, 6, 1, heapID);
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