#include "overlay_44.h"

#include "unk_02037C94.h"
#include "unk_0200FA24.h"
#include "unk_0203A3B0.h"
#include "unk_02034354.h"
#include "unk_02035900.h"
#include "unk_020379A0.h"
#include "unk_02005D10.h"
#include "sound_02004A44.h"
#include "overlay_00_arm.h"
#include "overlay_00_thumb.h"
#include "overlay_42.h"

// const WindowTemplate ov44_0223645C = {
//     .bgId = 2,
//     .left = 25,
//     .top = 13,
//     .width = 5,
//     .height = 4,
//     .palette = 1,
//     .baseTile = 57,
// };
// const u8 ov44_02236458[4] = {0x08, 0x00, 0x04, 0x0C};
// const func_type ov44_02236464[4] = {ov44_02234324, ov44_02234328, ov44_0223435C, ov44_02234388};

extern const WindowTemplate ov44_0223645C;
extern const u8 ov44_02236458[4];
extern const func_type ov44_02236464[4];
extern const u16 ov44_02236510[];

void ov44_02233EB4(UnkStruct_ov44_02235340* arg0, u8 arg1[]) {
    switch (arg1[0]) {
    case 0:
        arg0->unk0->unk1B = 0x12;
        break;
    case 1:
        arg0->unk0->unk1B = 0x16;
        break;
    case 2:
        arg0->unk0->unk1B = 0x18;
        break;
    case 3:
        arg0->unk0->unk1B = 0x1A;
        break;
    }
    ov00_021E6D60(arg0->unk0, 0x24);
}

s32 ov44_02233EF8(UnkStruct_ov44_02235340* arg0) {
    if (arg0->unk11 == 1) {
        return 0;
    }
    if (ov44_02233E6C(arg0) == 1) {
        ov00_021E69A8(0x68);
        arg0->unk11 = 1;
        return 1;
    }
    return 0;
}

s32 ov44_02233F20(UnkStruct_ov44_02235340* arg0) {
    if (arg0->unk11 == 0) {
        return 0;
    }
    ov00_021E6A4C();
    arg0->unk11 = 0U;
    return 1;
}

void ov44_02233F3C(UnkStruct_ov44_02235340* arg0) {
    if (ov44_02233EF8(arg0) != 0) {
        GF_GetCurrentPlayingBGM();
        sub_02005448();
    }
}

void ov44_02233F50(UnkStruct_ov44_02235340* arg0) {
    if (ov44_02233F20(arg0) != 0) {
        GF_SndHandleSetInitialVolume(0, 120);
    }
}

s32 ov44_02233F64(UnkStruct_ov44_02235340* arg0) {
    return sub_020347A0();
}

s32 ov44_02233F6C(UnkStruct_ov44_02235340* arg0, enum HeapID heapID) {
    s32 var_r4;
    s32 var_r7;

    var_r7 = 1;
    var_r4 = sub_0203769C() - 1;
    if (var_r4 >= 0) {
        do {
            if (sub_02034714(var_r4) == 1) {
                ov44_022340BC(arg0, var_r4, heapID);
            } else if (sub_02034750(var_r4) == 0) {
                var_r7 = 0;
            }
            var_r4 -= 1;
        } while (var_r4 >= 0);
    }
    return var_r7;
}

void ov44_02233FA8(UnkStruct_ov44_02235340* arg0) {
    UnkStruct_ov44_022345FC var_r5;
    var_r5.unk2 = 0;
    s32 counter = 1;
    do {
        if (sub_02034714(counter) == 1) {
            var_r5.unk0 = counter;
            
            if (sub_02037030(0x16, &var_r5, 8) != 1) { //0/sp
                GF_AssertFail();
            }
            sub_020346E8(counter);
        }
        counter += 1;
    } while (counter < 4);
}

void ov44_02233FE8(UnkStruct_ov44_02235340* arg0) {
    UnkStruct_ov44_022345FC var_r5;
    var_r5.unk2 = 0;
    s32 counter = 1;
    do {
        if (sub_02034730(counter) == 1) {
            var_r5.unk0 = counter;
            if (sub_02037030(0x16, &var_r5, 8) != 1) {
                GF_AssertFail();
            }
            sub_020346E8(counter);
        }
        counter += 1;
    } while (counter < 4);
}

void ov44_02234028(UnkStruct_ov44_02235340* arg0) {
    ov00_021E5CA0(ov44_02234070, (s32)arg0);
}

void ov44_02234038(void) {
    ov00_021E5CA0(0, 0);
}

s32 ov44_02234044(s32 arg0) {
    s32 counter;
    s32 var_r7;
    UnkStruct_ov44_02235340* var_r5;

    var_r7 = 0;
    counter = 0;
    do {
        var_r5 = (UnkStruct_ov44_02235340*)(arg0 + counter);
        if (var_r5->unk14[0] == 1) {
            if (sub_02034750(var_r5->unk14[4]) == 1) {
                var_r7 = 1;
            }
            var_r5->unk14[0] = 0;
            var_r5->unk18[0]= 0;
        }
        counter += 1;
    } while (counter < 4);
    return var_r7;
}

void ov44_02234070(u8 arg0, UnkStruct_ov44_02235340* arg1, s32 arg2) {
    arg1->unk14[arg0] = 1;
    arg1->unk18[arg0] = arg0;
}

s32 ov44_0223407C(UnkStruct_ov44_02235340* arg0) {
    int i;
    s32 ret = 0;
    for (i = 0; i < 4; i++) {
        if (arg0->unk1C[i] != arg0->unk20[i]) {
            ret = 1;
        }
        arg0->unk1C[i] = arg0->unk20[i];
    }
    
    if (arg0->unk24 != 0) {
        arg0->unk24 = 0;
        ret = 1;
    }
    
    return ret;
}

void ov44_022340B4(UnkStruct_ov44_02235340* arg0) {
    arg0->unk24 = 1;
}

void ov44_022340BC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2) {
    if (sub_02034750(arg1) == 0) {
        sub_0203476C(arg1);
        arg0->unk25 = arg1;
        ov44_022340EC(arg0, arg1, arg2);
        ov44_022340B4(arg0);
    }
}

void ov44_022340EC(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2) {
    u16 sp4[6];
    s32 temp_r4 = arg1 * 0xC;
    s32 temp_r7 = (s32)&arg0->unk30.unk15C;
    
    if (*(u32 *)(temp_r7 + temp_r4) == 0) {
        u16* temp_r0 = (u16*)((u8*)ov44_02236510 + temp_r4);
        sp4[0] = temp_r0[0];
        sp4[1] = temp_r0[1];
        sp4[2] = temp_r0[2];
        sp4[3] = temp_r0[3];
        sp4[4] = temp_r0[4];
        sp4[5] = temp_r0[5];
        
        if (arg1 != sub_0203769C()) {
            PlayerProfile* playerProfile = sub_02034818(arg1);
            if (playerProfile == NULL) {
                GF_AssertFail();
            }
            sp4[5] = PlayerProfile_GetAvatar(playerProfile);
        } else if (arg0->unk0->unk1E == 0) {
            sp4[5] = 0;
        } else {
            sp4[5] = 0x61;
        }
        *(s32*)(temp_r7 + temp_r4) = ov42_022280B8(arg0->unk30.unk154, sp4);
        if (ov42_02229010(arg0->unk30.unk158, sp4[5]) == 0) {
            ov42_02228FE0(arg0->unk30.unk158, sp4[5], 2, arg2);
        }
        s32 temp_r6 = (s32)&arg0->unk30.unk160;
        *(s32*)(temp_r6 + temp_r4) = ov42_0222903C(arg0->unk30.unk158, *(s32*)(temp_r7 + temp_r4), 0, arg2);
        ov42_02229200(*(s32*)(temp_r6 + temp_r4), 0);
        *(u16*)((u8*)&arg0->unk30.unk164 + temp_r4) += 1;
    }
}

void ov44_022341C0(UnkStruct_ov44_02235340* arg0) {
    s32 var_r6;
    s32 var_r4;
    s32 var_r5;

    var_r6 = 0;
    var_r4 = (s32)&arg0->unk30.unk15C;
    var_r5 = (s32)arg0;
    
    do {
        func_type ov44_func = ov44_02236464[*(u16*)(var_r5 + 0x194)];
        ov44_func(arg0, (UnkStruct_ov44_02235004*)var_r4);
        var_r6 += 1;
        var_r4 += 0xC;
        var_r5 = var_r5 + 0xC;
    } while (var_r6 < 4);
    ov42_0222807C(arg0->unk30.unk154);
    ov42_022290DC(arg0->unk30.unk158);
}

void ov44_02234204(UnkStruct_ov44_02235340* arg0) {
    ov42_0222901C(arg0->unk30.unk158);
    memset(&arg0->unk30.unk15C, 0, 0x30);
}

void ov44_02234224(UnkStruct_ov44_02235340* arg0, s32 arg1) {
    UnkStruct_ov44_022345FC sp;
    sp.unk0 = arg1;
    sp.unk2 = 2;
    if (sub_02037030(0x16, &sp, 8) != 1) {
        GF_AssertFail();
    }
}

void ov44_02234248(UnkStruct_ov44_02235340* arg0) {
    s32 var_r4;

    var_r4 = 0;
    do {
        if (((s32) (arg0->unk25 + 1) < var_r4) && (sub_02034714(var_r4) == 1)) {
            ov44_02234224(arg0, var_r4);
            sub_020346E8(var_r4);
        }
        var_r4 += 1;
    } while (var_r4 < 4);
}

void ov44_0223427C(UnkStruct_ov44_02235340* arg0, enum HeapID arg1) {
    s32 var_r4;

    var_r4 = 0;
    do {
        if ((arg0->unk28[var_r4] == 1) && (sub_02034730(var_r4) == 1)) {
            ov44_022340BC(arg0, (s32) var_r4, arg1);
            arg0->unk28[var_r4] = 0;
            arg0->unk12 = 1;
        }
        var_r4 += 1;
    } while (var_r4 < 4);
}

void ov44_022342B8(UnkStruct_ov44_02235340* arg0) {
    if (arg0->unk30.unk1E8 != 0) {
        GF_AssertFail();
    }
    arg0->unk30.unk1E8 = WaitingIcon_New(&arg0->unk30.window_list[0], 1);
}

void ov44_022342E0(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID arg2) {
    if (arg0->unk30.unk1E8 != 0) {
        sub_0200F450(arg0->unk30.unk1E8);
        arg0->unk30.unk1E8 = 0;
        Options* options = Save_PlayerData_GetOptionsAddr(arg1->saveData);
        LoadUserFrameGfx2(arg0->unk30.bgConfig, GF_BG_LYR_MAIN_1, 1, 2, Options_GetFrame(options), arg2);
    }
}

void ov44_02234324(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235004* arg1) {

}

void ov44_02234328(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235004* arg1) {
    ov42_0222919C(arg1->unk4, 0);
    ov42_022291A0(arg1->unk4);
    ov42_02229200(arg1->unk4, 1);
    arg1->unk8 = 2;
    s32 idx = ov42_02228188(arg1->unk0, 6);
    arg1->unkA = ov44_02236458[idx] + 16;
}

void ov44_0223435C(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235004* arg1) {
    ov42_022291AC(arg1->unk4);
    arg1->unkA = (arg1->unkA - 1);
    if ((s32) arg1->unkA <= 0) {
        ov42_022291B8(arg1->unk4);
        ov42_0222919C(arg1->unk4, 1);
        arg1->unk8 = 3;
    }
}

void ov44_02234388(UnkStruct_ov44_02235340* arg0, UnkStruct_ov44_02235004* arg1) {

}

void ov44_0223438C(UnkStruct_ov44_02235340* arg0) {
    u8 sp4[4];
    s32 sp0;
    s32 sp_count;
    s32 temp_r7;
    u32 var_r0;
    sp0 = 0;
    if (sub_02034420() != 0) {
        sp_count = sub_020347A0();
        if ((sub_020346D4() != 0) && (sub_02037824(5) == 0)) {
            sp0 = 1;
        }
        s32 var_r4 = 0;
        if (sp_count > 0) {
            do {
                if (var_r4 == 0) {
                    var_r0 = arg0->unk0->unk21;
                } else {
                    temp_r7 = sub_02034870(var_r4);
                    if (temp_r7 == 0x20) {
                        GF_AssertFail();
                    }
                    var_r0 = *(u8*)((u8*)(arg0->unk0) + 0x24 * temp_r7 + 0x45);
                }
                if (var_r0 != arg0->unk20[var_r4]) {
                    sp0 = 1;
                }
                arg0->unk20[var_r4] = (u8)var_r0;
                var_r4 += 1;
            } while (var_r4 < sp_count);
        }
        if (sp0 == 1) {
            __memcpy(&sp4, arg0->unk20, 4);
            sub_02037030(0x18, &sp4, 4);
        }
    }
}

int ov44_0223442C(UnkStruct_ov44_02235340* arg0) {
    if (sub_02037B38(0xD) != 0) {
        return 1;
    }
    return 0;
}

void ov44_02234440(UnkStruct_ov44_02235340* arg0) {
    arg0->unk10 = 1;
    arg0->unkC = 0x708;
}

void ov44_02234450(UnkStruct_ov44_02235340* arg0) {
    arg0->unk10 = 0;
}

s32 ov44_02234458(UnkStruct_ov44_02235340* arg0) {
    s32 temp_r1;

    if (arg0->unk10 == 0) {
        return 0;
    }
    temp_r1 = arg0->unkC;
    if (temp_r1 > 0) {
        arg0->unkC = (s32) (temp_r1 - 1);
        return 0;
    }
    return 1;
}

s32 ov44_02234474(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID arg2) {
    if (arg0->unk0->unk21 == 1) {
        ov44_02233F3C(arg0);
    }
    ov00_021E7220(0);
    sub_020398D4(0, 1);
    ov44_022340EC(arg0, sub_0203769C(), arg2);
    arg0->unk5 = 1;
    return 0;
}

s32 ov44_022344AC(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID arg2) {
    ov44_02233860(&arg0->unk30, arg1, 0x6B, arg2);
    arg0->unk5 = 2;
    return 0;
}

s32 ov44_022344C4(UnkStruct_ov44_02235340* arg0, u8* arg1) {
    s32 temp_r0;

    if (ov44_02233914(&arg0->unk30) == 0) {
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
        } else if ((s32) arg1[1] <= ov44_02233F64(arg0)) {
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

s32 ov44_022345A0(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID arg2) {
    ov44_0223398C(&arg0->unk30, arg1, arg0->unk6, arg2);
    ov44_02233860(&arg0->unk30, arg1, 0x6C, arg2);
    arg0->unk5 = 4;
    return 0;
}

s32 ov44_022345C8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.unk1DC = Std_CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 0x30, 4, heapID);
    arg0->unk5 = 5;
    return 0;
}

s32 ov44_022345FC(UnkStruct_ov44_02235340* arg0, u8* arg1, enum HeapID arg2) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.unk1DC, arg2);
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
            if ((s32) arg1[2] <= ov44_02233F64(arg0)) {
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
        ov44_02233A34(&arg0->unk30);
        arg0->unk30.unk1DC = NULL;
    }
    return 0;
}

s32 ov44_0223469C(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID arg2) {
    ov44_02233860(&arg0->unk30, arg1, 0x77, arg2);
    arg0->unk5 = 7;
    return 0;
}

s32 ov44_022346B4(UnkStruct_ov44_02235340* arg0) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk5 = 0x13;
    return 0;
}

s32 ov44_022346D0(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID arg2) {
    ov44_02233860(&arg0->unk30, arg1, 0x6F, arg2);
    arg0->unk5 = 9;
    return 0;
}

s32 ov44_022346E8(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.unk1DC = Std_CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 0x30, 4, heapID);
    arg0->unk5 = 0xA;
    return 0;
}

s32 ov44_0223471C(UnkStruct_ov44_02235340* arg0, u8* arg1, enum HeapID arg2) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.unk1DC, arg2);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            arg0->unk5 = 0xB;
        } else if ((s32) arg1[2] <= ov44_02233F64(arg0)) {
            arg0->unk5 = 0x13;
        } else {
            arg0->unk5 = 1;
        }
        arg0->unk30.unk1DC = NULL;
    }
    return 0;
}

s32 ov44_02234764(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID arg2) {
    arg0->unk8 = 0x1E;
    ov44_02233FA8(arg0);
    ov44_02233860(&arg0->unk30, arg1, 0x66, arg2);
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

s32 ov44_022347FC(UnkStruct_ov44_02235340* arg0, u8 arg1[]) {
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
                        arg0->unk5 = 27;
                    }
                }
            } else {
                var_r5 += 1;
            }
            var_r4 += 1;
        } while (var_r4 < temp_r7);
    }
    if (var_r5 == temp_r7) {
        arg0->unk5 = 17;
    }
    return 0;
}

s32 ov44_022348A8(UnkStruct_ov44_02235340* arg0) {
    sub_020398D4(1, 1);
    sub_02037AC0(18);
    arg0->unk5 = 18;
    return 0;
}

s32 ov44_022348C4(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    if (sub_02037B38(18) != 0) {
        arg0->unk7 = 1;
        ov44_022342E0(arg0, arg1, heapID);
        return 1;
    }
    return 0;
}

s32 ov44_022348EC(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    ov44_02233860(&arg0->unk30, arg1, 120, heapID);
    arg0->unk5 = 20;
    return 0;
}

s32 ov44_02234904(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.unk1DC = CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 48U, 4, 1, heapID);
    arg0->unk5 = 21;
    return 0;
}

s32 ov44_02234944(UnkStruct_ov44_02235340* arg0, u8* arg1, enum HeapID heapID) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.unk1DC, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            arg0->unk5 = 22;
        } else if (ov44_02233E6C(arg0) != 0) {
            if ((s32) arg1[2] <= ov44_02233F64(arg0)) {
                arg0->unk5 = 8;
            } else {
                arg0->unk5 = 1;
            }
        } else {
            arg0->unk5 = 1;
        }
        arg0->unk30.unk1DC = NULL;
    }
    return 0;
}

s32 ov44_0223499C(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    ov44_02233860(&arg0->unk30, arg1, 121, heapID);
    arg0->unk5 = 23;
    return 0;
}

s32 ov44_022349B4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.unk1DC = CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 48, 4, 1, heapID);
    arg0->unk5 = 24;
    return 0;
}

s32 ov44_022349F4(UnkStruct_ov44_02235340* arg0, u8* arg1, enum HeapID heapID) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.unk1DC, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            arg0->unk5 = 25;
        } else if (ov44_02233E6C(arg0) != 0) {
            if (arg1[2] <= ov44_02233F64(arg0)) {
                arg0->unk5 = 8;
            } else {
                arg0->unk5 = 1;
            }
        } else {
            arg0->unk5 = 1;
        }
        arg0->unk30.unk1DC = NULL;
    }
    return 0;
}

s32 ov44_02234A4C(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    ov44_02233860(&arg0->unk30, arg1, 122, heapID);
    arg0->unk8 = 30;
    arg0->unk5 = 26;
    return 0;
}

s32 ov44_02234A68(UnkStruct_ov44_02235340* arg0) {
    s32 temp_r0;

    if (ov44_02233914(&arg0->unk30) == 0) {
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

s32 ov44_02234AA8(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    if (arg0->unk30.unk1DC != NULL) {
        Clear2dMenuWindowAndDelete(arg0->unk30.unk1DC, heapID);
        arg0->unk30.unk1DC = NULL;
    }
    ov44_02233A34(&arg0->unk30);
    ov44_022342E0(arg0, arg1, heapID);
    arg0->unk5 = 28;
    return 0;
}

s32 ov44_02234AE4(UnkStruct_ov44_02235340* arg0, u8 arg1[], enum HeapID heapID) {
    ov44_02233860(&arg0->unk30, (UnkStruct_02111868_sub*)arg1, 118, heapID);
    arg0->unk5 = 29;
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
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    sub_02039358();
    sub_02039B58();
    ov44_02233FE8(arg0);
    arg0->unk7 = 0;
    sub_020398D4(0, 1);
    return 1;
}

s32 ov44_02234B58(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    s32 var_r2;

    if (arg0->unk0->unk21 == 1) {
        var_r2 = 125;
    } else {
        var_r2 = 124;
    }
    ov44_02233860(&arg0->unk30, arg1, var_r2, heapID);
    arg0->unk5 = 31;
    return 0;
}

s32 ov44_02234B80(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.unk1DC = Std_CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 48, 4, heapID);
    arg0->unk5 = 32;
    return 0;
}

s32 ov44_02234BB4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    s32 temp_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.unk1DC, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            ov44_02233D38(arg0, heapID);
            ov44_022340B4(arg0);
        }
        arg0->unk5 = 1;
        arg0->unk30.unk1DC = NULL;
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
        arg0->unk5 = 15;
    } else if (sub_02034750(0) != 0) {
        ov44_02234450(arg0);
        arg0->unk5 = 2;
    }
    return 0;
}

s32 ov44_02234C48(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    ov44_02233C88(&arg0->unk30, arg1, 0, 0, heapID);
    ov44_02233860(&arg0->unk30, arg1, 114, heapID);
    ov44_022342B8(arg0);
    arg0->unk5 = 3;
    return 0;
}

s32 ov44_02234C88(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    u8 temp_r0;

    ov44_02233F6C(arg0, heapID);
    if (ov44_02233914(&arg0->unk30) == 0) {
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
            arg0->unk2D = 116;
            break;
        case 3:
            arg0->unk5 = 6;
            arg0->unk2D = 132;
            break;
        }
    }
    return 0;
}

s32 ov44_02234CE8(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    ov44_02233C88(&arg0->unk30, arg1, 0, 0, heapID);
    ov44_0223386C(&arg0->unk30, arg1, 115, 30, heapID);
    arg0->unk5 = 5;
    ov44_022340BC(arg0, sub_0203769C(), HEAP_ID_103);
    return 0;
}

s32 ov44_02234D28(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk5 = 8;
    return 0;
}

s32 ov44_02234D4C(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    ov44_02233C88(&arg0->unk30, arg1, 0, 0, heapID);
    ov44_02233860(&arg0->unk30, arg1, arg0->unk2D, heapID);
    arg0->unk5 = 7;
    sub_02039358();
    sub_02039B58();
    return 0;
}

s32 ov44_02234D88(UnkStruct_ov44_02235340* arg0) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk7 = 0;
    sub_020398D4(0, 1);
    return 1;
}

s32 ov44_02234DA8(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    ov44_02233860(&arg0->unk30, arg1, 123, heapID);
    ov44_022342B8(arg0);
    arg0->unk5 = 9;
    if (arg0->unk0->unk21 == 1) {
        ov44_02233F3C(arg0);
    }
    return 0;
}

s32 ov44_02234DE4(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk5 = 10;
    return 0;
}

s32 ov44_02234E08(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
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
        ov44_02233860(&arg0->unk30, arg1, 102, heapID);
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

s32 ov44_02234F60(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    if (sub_02037B38(18) != 0) {
        ov44_022342E0(arg0, arg1, heapID);
        arg0->unk7 = 1;
        return 1;
    }
    return 0;
}

s32 ov44_02234F88(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    if (arg0->unk30.unk1DC != NULL) {
        Clear2dMenuWindowAndDelete(arg0->unk30.unk1DC, heapID);
        arg0->unk30.unk1DC = NULL;
    }
    ov44_02233A34(&arg0->unk30);
    ov44_022342E0(arg0, arg1, heapID);
    arg0->unk5 = 16;
    return 0;
}

s32 ov44_02234FC4(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    ov44_02233860(&arg0->unk30, arg1, 118, heapID);
    arg0->unk5 = 17;
    return 0;
}

s32 ov44_02234FDC(UnkStruct_ov44_02235340* arg0) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    sub_02039358();
    sub_02039B58();
    arg0->unk7 = 0;
    sub_020398D4(0, 1);
    return 1;
}

s32 ov44_02235004(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    s32 var_r2;

    ov44_02233F6C(arg0, heapID);
    if (arg0->unk0->unk21 == 1) {
        var_r2 = 125;
    } else {
        var_r2 = 124;
    }
    ov44_02233860(&arg0->unk30, arg1, var_r2, heapID);
    arg0->unk5 = 19;
    return 0;
}

s32 ov44_02235038(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    ov44_02233F6C(arg0, heapID);
    if (ov44_0223442C(arg0) == 1) {
        arg0->unk5 = 10;
        ov44_02233954(&arg0->unk30);
        return 0;
    }
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.unk1DC = Std_CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 48, 4, heapID);
    arg0->unk5 = 20;
    return 0;
}

s32 ov44_02235090(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    s32 temp_r0;

    ov44_02233F6C(arg0, heapID);
    if (ov44_0223442C(arg0) == 1) {
        arg0->unk5 = 10;
        ov44_02233954(&arg0->unk30);
        Clear2dMenuWindowAndDelete(arg0->unk30.unk1DC, heapID);
        arg0->unk30.unk1DC = 0;
        return 0;
    }
    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.unk1DC, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            ov44_02233D38(arg0, heapID);
            ov44_022340B4(arg0);
        }
        arg0->unk5 = 8;
        arg0->unk30.unk1DC = 0;
    }
    return 0;
}

s32 ov44_02235100(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    arg0->unk26 = sub_02034870(0);
    if (arg0->unk26 == 32) {
        GF_AssertFail();
    }
    ov44_02233C88(&arg0->unk30, arg1, 0, 0, heapID);
    sub_02039358();
    arg0->unk27 = 0;
    ov44_02233860(&arg0->unk30, arg1, 132, heapID);
    arg0->unk5 = 22;
    return 0;
}

s32 ov44_02235158(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    arg0->unk30.unk1DC = Std_CreateYesNoMenu(arg0->unk30.bgConfig, &ov44_0223645C, 48, 4, heapID);
    arg0->unk5 = 23;
    return 0;
}

s32 ov44_0223518C(UnkStruct_ov44_02235340* arg0, s32 arg1, enum HeapID heapID) {
    s32 temp_r0;
    s8 var_r0;

    temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk30.unk1DC, heapID);
    if (temp_r0 != -1) {
        if (temp_r0 == 0) {
            var_r0 = 24;
        } else {
            var_r0 = 29;
        }
        arg0->unk5 = var_r0;
        arg0->unk30.unk1DC = 0;
    }
    return 0;
}

s32 ov44_022351BC(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
    ov44_02233860(&arg0->unk30, arg1, 17, heapID);
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
    if (ov44_02233914(&arg0->unk30) == 0) {
        return 0;
    }
    if (ov44_02233E80(arg0->unk26, *arg1) != 0) {
        arg0->unk5 = 26;
    }
    return 0;
}

s32 ov44_02235218(UnkStruct_ov44_02235340* arg0, UnkStruct_02111868_sub* arg1, enum HeapID heapID) {
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
    u8* temp_r0;
    
    if (IsPaletteFadeFinished() != 0) {
        sub_02034354(arg1->unk8, 0);
        arg0->unk27 = 1;
        ov44_02234204(arg0);
        ov44_02233214(arg0, heapID);
        arg0 = arg0;
        memset(&arg0->unk30, 0, 504);
        ov44_02234028(arg0);
        ov44_022331C4(arg0, arg1, heapID);
        sub_0203A880();
        arg0->unk12 = 0;
        arg0->unk13 = 0;
        temp_r0 = arg0->unk14;
        arg0->unk14[0] = 0;
        temp_r0[1] = 0;
        temp_r0[2] = 0;
        temp_r0[3] = 0;
        temp_r0 = arg0->unk18;
        arg0->unk18[0] = 0;
        temp_r0[1] = 0;
        temp_r0[2] = 0;
        temp_r0[3] = 0;
        MI_CpuFill8(&arg0->unk1C, 1, 4);
        MI_CpuFill8(&arg0->unk20, 1, 4);
        temp_r0 = arg0->unk28;
        arg0->unk24 = 0;
        arg0->unk26 = 0;
        arg0->unk28[0] = 0;
        temp_r0[1] = 0;
        temp_r0[2] = 0;
        temp_r0[3] = 0;
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