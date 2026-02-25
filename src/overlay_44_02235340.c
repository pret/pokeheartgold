#include "overlay_44.h"

#include "unk_02037C94.h"
#include "unk_0200FA24.h"
#include "unk_0203A3B0.h"
#include "unk_02034354.h"
#include "unk_02035900.h"
#include "unk_020379A0.h"
#include "unk_02005D10.h"
#include "overlay_00_arm.h"
#include "overlay_00_thumb.h"

extern const WindowTemplate ov44_0223645C;

s32 ov44_022344AC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2) {
    ov44_02233860(&arg0->bgConfig, arg1, 0x6B, arg2);
    arg0->unk5 = 2;
    return 0;
}

s32 ov44_022344C4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340_sub* arg1) {
    s32 temp_r0;

    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    if (ov44_02233E6C(arg0) == 1) {
        temp_r0 = sub_02034780();
        if ((temp_r0 != 0xFF) && (arg0->unk6 != 0)) {
            if (sub_02034870(temp_r0) == 0x20) {
                UnkStruct_ov44_022345FC subroutine_arg0;
                subroutine_arg0.unk0 = temp_r0;
                subroutine_arg0.unk2 = 0;
                sub_020346E8(temp_r0);
                if (sub_02037030(0x16, &subroutine_arg0, 8) != 1) {
                    GF_AssertFail();
                }
            } else {
                arg0->unk6 = (u8) temp_r0;
            }
        }
    }
    if (1 & gSystem.newKeys) {
        PlaySE(0x5DD);
        if (ov44_02233E6C(arg0) == 0) {
            arg0->unk5 = 6;
        } else if ((s32) arg1->unk1 <= ov44_02233F64(arg0)) {
            arg0->unk5 = 8;
        } else {
            arg0->unk5 = 6;
        }
    } else if (gSystem.newKeys & 2) {
        PlaySE(0x5DD);
        arg0->unk5 = 0x16;
    } else if (arg0->unk6 != 0xFF) {
        PlaySE(0x5DD);
        arg0->unk5 = 3;
    } else if (gSystem.newKeys & 0x400) {
        arg0->unk5 = 0x1E;
        PlaySE(0x5DD);
    }
    return 0;
}

s32 ov44_022345A0(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2) {
    ov44_0223398C(&arg0->bgConfig, arg1, arg0->unk6, arg2);
    ov44_02233860(&arg0->bgConfig, arg1, 0x6C, arg2);
    arg0->unk5 = 4;
    return 0;
}

s32 ov44_022345C8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    arg0->listMenu2D = Std_CreateYesNoMenu(arg0->bgConfig, &ov44_0223645C, 0x30, 4, heapID);
    arg0->unk5 = 5;
    return 0;
}

s32 ov44_022345FC(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340_sub* arg1, enum HeapID arg2) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->listMenu2D, arg2);
    if (temp_r0 != -1) {
        UnkStruct_ov44_022345FC subroutine_arg0;
        subroutine_arg0.unk0 = (s16) arg0->unk6;
        if (temp_r0 == 0) {
            subroutine_arg0.unk2 = 1;
            ov44_022340BC(arg0, arg0->unk6, arg2);
            if (arg0->unk0->unk21 == 1) {
                ov44_02233F20(arg0);
                ov44_02233F3C(arg0);
            }
            if ((s32) arg1->unk2 <= ov44_02233F64(arg0)) {
                arg0->unk5 = 8;
            } else {
                arg0->unk5 = 1;
            }
        } else {
            subroutine_arg0.unk2 = 0;
            sub_020346E8(arg0->unk6);
            arg0->unk5 = 1;
        }
        if (sub_02037030(0x16, &subroutine_arg0, 8) != 1) {
            GF_AssertFail();
        }
        arg0->unk6 = 0xFF;
        ov44_02233A34(&arg0->bgConfig);
        arg0->listMenu2D = NULL;
    }
    return 0;
}

s32 ov44_0223469C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2) {
    ov44_02233860(&arg0->bgConfig, arg1, 0x77, arg2);
    arg0->unk5 = 7;
    return 0;
}

s32 ov44_022346B4(UnkStruct_ov44_02235340* arg0) {
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    arg0->unk5 = 0x13;
    return 0;
}

s32 ov44_022346D0(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2) {
    ov44_02233860(&arg0->bgConfig, arg1, 0x6F, arg2);
    arg0->unk5 = 9;
    return 0;
}

s32 ov44_022346E8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    arg0->listMenu2D = Std_CreateYesNoMenu(arg0->bgConfig, &ov44_0223645C, 0x30, 4, heapID);
    arg0->unk5 = 0xA;
    return 0;
}

s32 ov44_0223471C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340_sub* arg1, enum HeapID arg2) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->listMenu2D, arg2);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            arg0->unk5 = 0xB;
        } else if ((s32) arg1->unk2 <= ov44_02233F64(arg0)) {
            arg0->unk5 = 0x13;
        } else {
            arg0->unk5 = 1;
        }
        arg0->listMenu2D = NULL;
    }
    return 0;
}

s32 ov44_02234764(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2) {
    arg0->unk8 = 0x1E;
    ov44_02233FA8(arg0);
    ov44_02233860(&arg0->bgConfig, arg1, 0x66, arg2);
    ov44_022342B8(arg0);
    ov44_02234440(arg0);
    arg0->unk5 = 0xC;
    ov00_021E7130();
    return 0;
}

s32 ov44_0223479C(UnkStruct_ov44_02235340* arg0) {
    s32 temp_r5;

    temp_r5 = sub_02037454();
    if (temp_r5 != sub_020347A0()) {
        ov44_02233FA8(arg0);
        return 0;
    }
    if (ov00_021E70F4() == 0) {
        return 0;
    }
    ov00_021E7220(1);
    arg0->unk5 = 0xD;
    return 0;
}

s32 ov44_022347D4(UnkStruct_ov44_02235340* arg0) {
    s32 temp_r0;

    temp_r0 = arg0->unk8;
    if (temp_r0 == 0) {
        if (sub_02037030(0x17, NULL, 0) != 0) {
            arg0->unk5 = 0xE;
        }
    } else {
        arg0->unk8 = (s32) (temp_r0 - 1);
    }
    return 0;
}

s32 ov44_022347FC(UnkStruct_ov44_02235340* arg0, s32 arg1) {
    if (sub_02037B38(0xD) != 0) {
        ov44_02233EB4(arg0, arg1);
        sub_02037BEC();
        sub_02037AC0(0xE);
        arg0->unk5 = 0xF;
    }
    return 0;
}

s32 ov44_02234828(UnkStruct_ov44_02235340* arg0) {
    if (sub_02037B38(0xE) != 0) {
        s16 subroutine_arg0 = (s16) arg0->unk0->unk1B;
        if (sub_02037C0C(sub_0203769C(), &subroutine_arg0) == 1) {
            arg0->unk5 = 0x10;
        }
    }
    return 0;
}

s32 ov44_02234858(UnkStruct_ov44_02235340* arg0) {
    s32 sp0;
    s32 temp_r7;
    s32 var_r4;
    s32 var_r5;
    u16* temp_r0;

    temp_r7 = ov44_02233F64(arg0);
    sp0 = sub_0203769C();
    var_r5 = 0;
    var_r4 = 0;
    if (temp_r7 > 0) {
        do {
            if (sp0 != var_r4) {
                temp_r0 = sub_02037C44(var_r4);
                if (temp_r0 != NULL) {
                    if (*temp_r0 == arg0->unk0->unk1B) {
                        var_r5 += 1;
                    } else {
                        arg0->unk5 = 0x1B;
                    }
                }
            } else {
                var_r5 += 1;
            }
            var_r4 += 1;
        } while (var_r4 < temp_r7);
    }
    if (var_r5 == temp_r7) {
        arg0->unk5 = 0x11;
    }
    return 0;
}

s32 ov44_022348A8(UnkStruct_ov44_02235340* arg0) {
    sub_020398D4(1, 1);
    sub_02037AC0(0x12);
    arg0->unk5 = 0x12;
    return 0;
}

s32 ov44_022348C4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (sub_02037B38(18) != 0) {
        arg0->unk7 = 1;
        ov44_022342E0(arg0, arg1, heapID);
        return 1;
    }
    return 0;
}

s32 ov44_022348EC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233860(&arg0->bgConfig, arg1, 0x78, heapID);
    arg0->unk5 = 0x14;
    return 0;
}

s32 ov44_02234904(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    arg0->listMenu2D = CreateYesNoMenu(arg0->bgConfig, &ov44_0223645C, 0x30U, 4, 1, heapID);
    arg0->unk5 = 0x15;
    return 0;
}

s32 ov44_02234944(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340_sub* arg1, enum HeapID heapID) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->listMenu2D, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            arg0->unk5 = 0x16;
        } else if (ov44_02233E6C(arg0) != 0) {
            if ((s32) arg1->unk2 <= ov44_02233F64(arg0)) {
                arg0->unk5 = 8;
            } else {
                arg0->unk5 = 1;
            }
        } else {
            arg0->unk5 = 1;
        }
        arg0->listMenu2D = NULL;
    }
    return 0;
}

s32 ov44_0223499C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233860(&arg0->bgConfig, arg1, 0x79, heapID);
    arg0->unk5 = 0x17;
    return 0;
}

s32 ov44_022349B4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    arg0->listMenu2D = CreateYesNoMenu(arg0->bgConfig, &ov44_0223645C, 0x30, 4, 1, heapID);
    arg0->unk5 = 0x18;
    return 0;
}

s32 ov44_022349F4(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340_sub* arg1, enum HeapID heapID) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->listMenu2D, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            arg0->unk5 = 0x19;
        } else if (ov44_02233E6C(arg0) != 0) {
            if (arg1->unk2 <= ov44_02233F64(arg0)) {
                arg0->unk5 = 8;
            } else {
                arg0->unk5 = 1;
            }
        } else {
            arg0->unk5 = 1;
        }
        arg0->listMenu2D = NULL;
    }
    return 0;
}

s32 ov44_02234A4C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233860(&arg0->bgConfig, arg1, 0x7A, heapID);
    arg0->unk8 = 0x1E;
    arg0->unk5 = 0x1A;
    return 0;
}

s32 ov44_02234A68(UnkStruct_ov44_02235340* arg0) {
    s32 temp_r0;

    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    temp_r0 = arg0->unk8 - 1;
    arg0->unk8 = temp_r0;
    if (temp_r0 > 0) {
        return 0;
    }
    arg0->unk7 = 0;
    sub_02039358();
    ov44_02233FE8(arg0);
    sub_02039B58();
    sub_020398D4(0, 1);
    return 1;
}

s32 ov44_02234AA8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (arg0->listMenu2D != NULL) {
        Clear2dMenuWindowAndDelete(arg0->listMenu2D, heapID);
        arg0->listMenu2D = NULL;
    }
    ov44_02233A34(&arg0->bgConfig);
    ov44_022342E0(arg0, arg1, heapID);
    arg0->unk5 = 0x1C;
    return 0;
}

s32 ov44_02234AE4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233860(&arg0->bgConfig, arg1, 0x76, heapID);
    arg0->unk5 = 0x1D;
    ov44_02233FE8(arg0);
    ov44_02233EB4(arg0, arg1);
    if ((u32) (sub_020390C4() - 4) <= 1U) {
        ov00_021EDB1C();
    }
    return 0;
}

s32 ov44_02234B18(UnkStruct_ov44_02235340* arg0) {
    if ((u32) (sub_020390C4() - 4) <= 1) {
        ov00_021EDB1C();
    }
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    sub_02039358();
    sub_02039B58();
    ov44_02233FE8(arg0);
    arg0->unk7 = 0;
    sub_020398D4(0, 1);
    return 1;
}

s32 ov44_02234B58(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    s32 var_r2;

    if (arg0->unk0->unk21 == 1) {
        var_r2 = 0x7D;
    } else {
        var_r2 = 0x7C;
    }
    ov44_02233860(&arg0->bgConfig, arg1, var_r2, heapID);
    arg0->unk5 = 0x1F;
    return 0;
}

s32 ov44_02234B80(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    arg0->listMenu2D = Std_CreateYesNoMenu(arg0->bgConfig, &ov44_0223645C, 0x30, 4, heapID);
    arg0->unk5 = 0x20;
    return 0;
}

s32 ov44_02234BB4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->listMenu2D, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            ov44_02233D38(arg0, heapID);
            ov44_022340B4(arg0);
        }
        arg0->unk5 = 1;
        arg0->listMenu2D = NULL;
    }
    return 0;
}

s32 ov44_02234BF0(UnkStruct_ov44_02235340* arg0) {
    sub_02034434();
    sub_020398D4(0, 1);
    ov44_02234440(arg0);
    arg0->unk5 = 1;
    return 0;
}

s32 ov44_02234C10(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (sub_020373B4(0) == 0) {
        ov44_02234450(arg0);
        arg0->unk5 = 0xF;
    } else if (sub_02034750(0) != 0) {
        ov44_02234450(arg0);
        arg0->unk5 = 2;
    }
    return 0;
}

s32 ov44_02234C48(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    ov44_02233C88(&arg0->bgConfig, arg1, 0, 0, heapID);
    ov44_02233860(&arg0->bgConfig, arg1, 0x72, heapID);
    ov44_022342B8(arg0);
    arg0->unk5 = 3;
    return 0;
}

s32 ov44_02234C88(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    u8 temp_r0;

    ov44_02233F6C(arg0, heapID);
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    if (arg0->unk13 != 0) {
        ov44_022342E0(arg0, arg1, heapID);
        temp_r0 = arg0->unk13;
        switch (temp_r0) {                          /* irregular */
        case 1:
            arg0->unk5 = 4;
            break;
        case 2:
            arg0->unk5 = 6;
            arg0->unk2D = 0x74;
            break;
        case 3:
            arg0->unk5 = 6;
            arg0->unk2D = 0x84;
            break;
        }
    }
    return 0;
}

s32 ov44_02234CE8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233C88(&arg0->bgConfig, arg1, 0, 0, heapID);
    ov44_0223386C(&arg0->bgConfig, arg1, 0x73, 0x1e, heapID);
    arg0->unk5 = 5;
    ov44_022340BC(arg0, sub_0203769C(), HEAP_ID_103);
    return 0;
}

s32 ov44_02234D28(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    arg0->unk5 = 8;
    return 0;
}

s32 ov44_02234D4C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233C88(&arg0->bgConfig, arg1, 0, 0, heapID);
    ov44_02233860(&arg0->bgConfig, arg1, arg0->unk2D, heapID);
    arg0->unk5 = 7;
    sub_02039358();
    sub_02039B58();
    return 0;
}

s32 ov44_02234D88(UnkStruct_ov44_02235340* arg0) {
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    arg0->unk7 = 0;
    sub_020398D4(0, 1);
    return 1;
}

s32 ov44_02234DA8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    ov44_02233860(&arg0->bgConfig, arg1, 0x7B, heapID);
    ov44_022342B8(arg0);
    arg0->unk5 = 9;
    if (arg0->unk0->unk21 == 1) {
        ov44_02233F3C(arg0);
    }
    return 0;
}

s32 ov44_02234DE4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    arg0->unk5 = 10;
    return 0;
}

s32 ov44_02234E08(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (arg0->unk12 != 0) {
        arg0->unk12 = 0U;
        if (arg0->unk0->unk21 == 1) {
            ov44_02233F20(arg0);
            ov44_02233F3C(arg0);
        }
        ov44_022340B4(arg0);
    }
    if (ov44_0223442C(arg0) == 1) {
        sub_02037BEC();
        sub_02037AC0(14);
        ov44_022342E0(arg0, arg1, heapID);
        ov44_02233860(&arg0->bgConfig, arg1, 102, heapID);
        ov44_02234440(arg0);
        arg0->unk8 = 300;
        ov44_022342B8(arg0);
        arg0->unk5 = 11;
    } else if (1024 & gSystem.newKeys) {
        ov44_022342E0(arg0, arg1, heapID);
        arg0->unk5 = 18;
    }
    return 0;
}

s32 ov44_02234EA4(UnkStruct_ov44_02235340* arg0) {
    s32 temp_r0;

    if (sub_02037B38(14) != 0) {
        s16 subroutine_arg0 = (s16) arg0->unk0->unk1B;
        if (ov44_02233F64(arg0) != sub_02037454()) {
            temp_r0 = arg0->unk8 - 1;
            arg0->unk8 = temp_r0;
            if (temp_r0 <= 0) {
                arg0->unk5 = 15;
            }
            return 0;
        }
        if (sub_02037C0C(sub_0203769C(), &subroutine_arg0) == 1) {
            arg0->unk5 = 12;
        }
    }
    return 0;
}

s32 ov44_02234EF4(UnkStruct_ov44_02235340* arg0) {
    s32 sp0;
    s32 temp_r7;
    s32 var_r4;
    s32 var_r5;
    u16* temp_r0;

    temp_r7 = ov44_02233F64(arg0);
    sp0 = sub_0203769C();
    var_r5 = 0;
    var_r4 = 0;
    if (temp_r7 > 0) {
        do {
            if (sp0 != var_r4) {
                temp_r0 = sub_02037C44(var_r4);
                if (temp_r0 != NULL) {
                    if (*temp_r0 == arg0->unk0->unk1B) {
                        var_r5 += 1;
                    } else {
                        arg0->unk5 = 15;
                    }
                }
            } else {
                var_r5 += 1;
            }
            var_r4 += 1;
        } while (var_r4 < temp_r7);
    }
    if (var_r5 == temp_r7) {
        arg0->unk5 = 13;
    }
    return 0;
}

s32 ov44_02234F44(UnkStruct_ov44_02235340* arg0) {
    sub_020398D4(1, 1);
    sub_02037AC0(18);
    arg0->unk5 = 14;
    return 0;
}

s32 ov44_02234F60(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (sub_02037B38(18) != 0) {
        ov44_022342E0(arg0, arg1, heapID);
        arg0->unk7 = 1;
        return 1;
    }
    return 0;
}

s32 ov44_02234F88(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (arg0->listMenu2D != NULL) {
        Clear2dMenuWindowAndDelete(arg0->listMenu2D, heapID);
        arg0->listMenu2D = NULL;
    }
    ov44_02233A34(&arg0->bgConfig);
    ov44_022342E0(arg0, arg1, heapID);
    arg0->unk5 = 16;
    return 0;
}

s32 ov44_02234FC4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233860(&arg0->bgConfig, arg1, 118, heapID);
    arg0->unk5 = 17;
    return 0;
}

s32 ov44_02234FDC(UnkStruct_ov44_02235340* arg0) {
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    sub_02039358();
    sub_02039B58();
    arg0->unk7 = 0;
    sub_020398D4(0, 1);
    return 1;
}

s32 ov44_02235004(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    s32 var_r2;

    ov44_02233F6C(arg0, heapID);
    if (arg0->unk0->unk21 == 1) {
        var_r2 = 125;
    } else {
        var_r2 = 124;
    }
    ov44_02233860(&arg0->bgConfig, arg1, var_r2, heapID);
    arg0->unk5 = 19;
    return 0;
}

s32 ov44_02235038(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (ov44_0223442C(arg0) == 1) {
        arg0->unk5 = 10;
        ov44_02233954(&arg0->bgConfig);
        return 0;
    }
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    arg0->listMenu2D = Std_CreateYesNoMenu(arg0->bgConfig, &ov44_0223645C, 48, 4, heapID);
    arg0->unk5 = 20;
    return 0;
}

s32 ov44_02235090(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    s32 temp_r0;

    ov44_02233F6C(arg0, heapID);
    if (ov44_0223442C(arg0) == 1) {
        arg0->unk5 = 10;
        ov44_02233954(&arg0->bgConfig);
        Clear2dMenuWindowAndDelete(arg0->listMenu2D, heapID);
        arg0->listMenu2D = 0;
        return 0;
    }
    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->listMenu2D, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            ov44_02233D38(arg0, heapID);
            ov44_022340B4(arg0);
        }
        arg0->unk5 = 8;
        arg0->listMenu2D = 0;
    }
    return 0;
}

s32 ov44_02235100(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    arg0->unk26 = sub_02034870(0);
    if (arg0->unk26 == 32) {
        GF_AssertFail();
    }
    ov44_02233C88(&arg0->bgConfig, arg1, 0, 0, heapID);
    sub_02039358();
    arg0->unk27 = 0;
    ov44_02233860(&arg0->bgConfig, arg1, 132, heapID);
    arg0->unk5 = 22;
    return 0;
}

s32 ov44_02235158(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    arg0->listMenu2D = Std_CreateYesNoMenu(arg0->bgConfig, &ov44_0223645C, 48, 4, heapID);
    arg0->unk5 = 23;
    return 0;
}

s32 ov44_0223518C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    s32 temp_r0;
    s8 var_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->listMenu2D, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            var_r0 = 24;
        } else {
            var_r0 = 29;
        }
        arg0->unk5 = var_r0;
        arg0->listMenu2D = 0;
    }
    return 0;
}

s32 ov44_022351BC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233860(&arg0->bgConfig, arg1, 17, heapID);
    ov44_022342B8(arg0);
    arg0->unk8 = 90;
    arg0->unk5 = 25;
    return 0;
}

s32 ov44_022351DC(UnkStruct_ov44_02235340* arg0, u8* arg1) {
    if (arg0->unk8 > 0) {
        arg0->unk8 = arg0->unk8 - 1;
        return 0;
    }
    if (ov44_02233914(&arg0->bgConfig) == 0) {
        return 0;
    }
    if (ov44_02233E80(arg0->unk26, *arg1) != 0) {
        arg0->unk5 = 26;
    }
    return 0;
}

s32 ov44_02235218(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233E48();
    if ((sub_020390C4() == 1) && (sub_020373B4(0) == 1)) {
        sub_020378E4(0);
        ov44_022342E0(arg0, arg1, heapID);
        BeginNormalPaletteFade(3, 0, 0, 0, 6, 1, heapID);
        arg0->unk5 = 27;
    }
    return 0;
}

s32 ov44_02235268(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235340* arg1, enum HeapID heapID) {
    UnkStruct_ov44_02235340_sub* temp_r0;
    
    if (IsPaletteFadeFinished() != 0) {
        sub_02034354(arg1->unk8, 0);
        arg0->unk27 = 1;
        ov44_02234204(arg0);
        ov44_02233214(arg0, heapID);
        arg0 = arg0;
        memset(&arg0->bgConfig, 0, 504);
        ov44_02234028(arg0);
        ov44_022331C4(arg0, arg1, heapID);
        sub_0203A880();
        arg0->unk12 = 0;
        arg0->unk13 = 0;
        temp_r0 = (UnkStruct_ov44_02235340_sub*)&arg0->unk14;
        arg0->unk14 = 0;
        temp_r0->unk1 = 0;
        temp_r0->unk2 = 0;
        temp_r0->unk3 = 0;
        temp_r0 = (UnkStruct_ov44_02235340_sub*)&arg0->unk18;
        arg0->unk18 = 0;
        temp_r0->unk1 = 0;
        temp_r0->unk2 = 0;
        temp_r0->unk3 = 0;
        MI_CpuFill8(&arg0->unk1C, 1, 4);
        MI_CpuFill8(&arg0->unk20, 1, 4);
        temp_r0 = (UnkStruct_ov44_02235340_sub*)&arg0->unk28;
        arg0->unk24 = 0;
        arg0->unk26 = 0;
        arg0->unk28 = 0;
        temp_r0->unk1 = 0;
        temp_r0->unk2 = 0;
        temp_r0->unk3 = 0;
        BeginNormalPaletteFade(3, 1, 1, 0, 6, 1, heapID);
        arg0->unk5 = 28;
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