#include "unk_02037C94.h"
#include "unk_02035900.h"
#include "unk_02034354.h"
#include "unk_020915B0.h"
#include "unk_020379A0.h"
#include "unk_02034B0C.h"
#include "unk_02033AE0.h"
#include "unk_02032844.h"
#include "unk_02005D10.h"
#include "overlay_00_thumb.h"
#include "overlay_45_thumb.h"
#include "dwcaccount.h"
#include "system.h"
#include "communication_error.h"

typedef struct UnkStruct_sub_02039C6C {
    UnkStruct_ov44_0223197C* unk0;
    u8 unk4[8];
    MATHRandContext32 mathRandContext;
    void (*unk24)();
    SaveData* unk28;
    PlayerProfile* unk2C;
    s32 unk30;
    u32 unk34;
    s32 unk38;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    u16 unk48;
    u8 unk4A;
    u8 unk4B;
    u8 unk4C;
    u8 unk4D;
    u8 unk4E;
    u8 unk4F;
    u8 unk50;
    s8 unk51;
    u8 unk52;
    u8 unk53;
    u8 unk54;
    u8 unk55;
    u8 unk56;
    u8 unk57;
    u8 unk58;
    u8 unk59[3];
    u8 unk5C;
    u8 unk5D;
    u8 unk5E;
    u8 unkEF;
    s32 unk60;
    u8 unk64;
} UnkStruct_sub_02039C6C;

extern UnkStruct_sub_02039C6C* _021D4150;

void sub_02038F74(u32 arg0, s32 arg1, s32 arg2) {
    if (_021D4150 != NULL) {
        if (arg0 - 0x19 > 1) {
            arg0 = -arg0;
        }
        _021D4150->unk34 = arg0;
        _021D4150->unk38 = arg1;
        _021D4150->unk3C = arg2;
    }
}

void sub_02038F9C(void) {
    s32 temp_r0 = ov00_021E5E54(0);
    if ((temp_r0 >= 0xA) && (temp_r0 < 0x14)) {
        sub_020381C0(sub_02038EB4, 0);
    }
    else if (temp_r0 < 0) {
        sub_020381C0(sub_02038E90, 0);
    }
    else if (temp_r0 == 0x14) {
        sub_020381C0(sub_02038EB8, 0);
    }
    else if (temp_r0 == 0x15) {
        sub_020381C0(sub_02038EB0, 0);
    }
    else if (temp_r0 == 0x16) {
        sub_020381C0(sub_02038EB4, 0);
    }
    else if (temp_r0 == 0x18) {
        sub_020381C0(sub_02038EB0, 0);
    }
}

void sub_0203900C(void) {
    if (ov00_021E5E54(1) < 0) {
        sub_020381C0(sub_02038E90, 0);
        return;
    }
    u32 temp_r0 = ov00_021E6D7C(_021D4150->unk51, sub_02033FC4(_021D4150->unk4E) + 1, 0) + 3;
    switch (temp_r0) {
    case 3:
        sub_0203622C();
        sub_020381C0(sub_02038F9C, 0);
        return;
    case 0:
        sub_020381C0(sub_02038E90, 0);
    case 1:
    case 2:
        return;
    }
}

s32 sub_02039080(s32 arg0) {
    if (_021D4150->unk24 != sub_02038F9C) {
        return 0;
    }
    ov00_021E5C84(&sub_02036904, &sub_020367A8);
    _021D4150->unk51 = arg0;
    sub_020381C0(sub_0203900C, 0);
    return 1;
}

s32 sub_020390C4(void) {
    if (_021D4150->unk24 == sub_02038F9C) {
        return 0;
    }
    if (_021D4150->unk24 == sub_02038EB8) {
        return 1;
    }
    if (_021D4150->unk24 == &sub_02038E94) {
        return 3;
    }
    if (_021D4150->unk24 == sub_02038EB0) {
        return 4;
    }
    if (_021D4150->unk24 == sub_02038EB4) {
        return 5;
    }
    if (_021D4150->unk24 == sub_02039DE4) {
        return 0;
    }
    if (_021D4150->unk24 == sub_02039DC4) {
        return 1;
    }
    if (_021D4150->unk24 == sub_02039E7C) {
        return 3;
    }
    return 2;
}

void sub_02039144(void) {
    ov00_021E5C84(&sub_02036904, &sub_020367A8);
    switch (ov00_021E6D7C(-1, 4, 1) + 4) {
    case 4:
        _021D4150->unk5C = 0;
        sub_0203622C();
        sub_020381C0(sub_02038F9C, 0);
        break;
    case 1:
        sub_020381C0(sub_02038E90, 0);
        break;
    case 0:
        return;
    case 2:
        break;
    }
    s32 temp_r0_2 = ov00_021E6690();
    if (temp_r0_2 < 0) {
        sub_020381C0(sub_02038E90, 0);
    }
    else if (temp_r0_2 == 0x1A) {
        sub_020381C0(sub_02038E90, 0);
    }
}

void sub_020391D0(void) {
    sub_0203786C(0);
    if ((ov00_021E6BE4(_021D4150->unk50) != 0) && (ov00_021E6C68() != 0)) {
        sub_020343E4();
        sub_020381C0(sub_02039144, 0);
    }
    else if (ov00_021E5E54(0) < 0) {
        sub_020381C0(sub_02038E90, 0);
    }
}

void sub_02039220(void) {
    if (sub_0203769C() == 0) {
        _021D4150->unk50 = 0;
        sub_020381C0(sub_020391D0, 0);
    } else {
        _021D4150->unk50 = 1;
        sub_020381C0(sub_020391D0, 0);
    }
    _021D4150->unk5C = 1;
}

u8 sub_02039264(void) {
    return _021D4150->unk5C;
}

BOOL sub_02039274(void) {
    if (_021D4150->unk24 == sub_02039144) {
        return TRUE;
    }
    if (_021D4150->unk24 == sub_02039C60) {
        return TRUE;
    }
    return FALSE;
}

BOOL sub_020392A0(void) {
    if (_021D4150->unk24 == sub_02038F9C) {
        return TRUE;
    }
    if (_021D4150->unk24 == sub_02039144) {
        return TRUE;
    }
    if (_021D4150->unk24 == sub_02039C60) {
        return TRUE;
    }
    return FALSE;
}

u32* sub_020392D8(void) {
    GF_ASSERT(_021D4150);
    return &_021D4150->unk34;
}

void sub_020392F4(void) {
    sub_0203786C(0);
    if (ov00_021E6BE4(0U) != 0) {
        ov00_021E6C68();
        sub_020381C0(sub_0203847C, 0);
    }
    if (ov00_021E5E54(0) < 0) {
        sub_020381C0(sub_02038E90, 0);
    }
}

void sub_02039330(void) {
    if (_021D4150 != NULL) {
        sub_0201A738(1);
        sub_020343E4();
        sub_020381C0(sub_0203847C, 5);
    }
}

void sub_02039358(void) {
    if (_021D4150 != NULL) {
        _021D4150->unk50 = 0;
        sub_020381C0(sub_020391D0, 0);
    }
}

void sub_02039378(void) {
    if (_021D4150 != NULL) {
        sub_020398D4(0, 1);
        if (sub_0203769C() == 0) {
            _021D4150->unk50 = 0;
        } else {
            _021D4150->unk50 = 1;
        }
        sub_020381C0(sub_020391D0, 0);
    }
}

void sub_020393B4(void) {
    u8 r1 = sub_0203769C();
    sub_020376E0(0x15, &r1);
}

BOOL sub_020393C8(void) {
    if (_021D4150 != NULL) {
        void (*func)() = _021D4150->unk24;
        if (func == sub_02038E90) {
            return TRUE;
        }
        if ((func == sub_02038E94) && (_021D4150->unk53 != 0)) {
            return TRUE;
        }
        if ((func == sub_02039E7C) && (_021D4150->unk53 != 0)) {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_02039418(SaveData* arg0) {
    if (_021D4150 == NULL) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 0x100U);
        UnkStruct_sub_02039C6C* temp_r0 = Heap_Alloc(HEAP_ID_15, 0x68U);
        _021D4150 = temp_r0;
        MI_CpuFill8(temp_r0, 0U, 0x68U);
        _021D4150->unk4E = 0x18;
        _021D4150->unk55 = 1;
        _021D4150->unk28 = arg0;
        sub_020398D4(0, 1);
        sub_0201A728(1);
    }
}

void sub_0203946C(void) {
    if (_021D4150 != NULL) {
        sub_0201A738(1);
        sub_020398D4(0, 0);
        Heap_Free(_021D4150);
        _021D4150 = NULL;
        Heap_Destroy(HEAP_ID_15);
    }
}

void sub_020394A0(SaveData* arg0) {

    if (_021D4150 == NULL) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 0x100U);
        UnkStruct_sub_02039C6C* temp_r0 = Heap_Alloc(HEAP_ID_15, 0x68U);
        _021D4150 = temp_r0;
        MI_CpuFill8(temp_r0, 0U, 0x68U);
        _021D4150->unk4E = 0x19;
        _021D4150->unk55 = 1;
        _021D4150->unk28 = arg0;
        sub_020398D4(0, 1);
        sub_0201A728(1);
    }
}

void sub_020394F4(void) {
    if (_021D4150 != NULL) {
        sub_0201A738(1);
        sub_020398D4(0, 0);
        Heap_Free(_021D4150);
        _021D4150 = NULL;
        Heap_Destroy(HEAP_ID_15);
    }
}

void sub_02039528(SaveData* arg0) {
    if (_021D4150 == NULL) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 0x100U);
        UnkStruct_sub_02039C6C* temp_r0 = Heap_Alloc(HEAP_ID_15, 0x68U);
        _021D4150 = temp_r0;
        MI_CpuFill8(temp_r0, 0U, 0x68U);
        _021D4150->unk4E = 0x24;
        _021D4150->unk55 = 1;
        _021D4150->unk28 = arg0;
        sub_020398D4(0, 1);
        sub_0201A728(1);
    }
}

void sub_0203957C(void) {
    if (_021D4150 != NULL) {
        sub_0201A738(1);
        sub_020398D4(0, 0);
        Heap_Free(_021D4150);
        _021D4150 = NULL;
        Heap_Destroy(HEAP_ID_15);
    }
}

BOOL sub_020395B0(void) {
    if (_021D4150 == NULL) {
        return FALSE;
    }
    s32 sp4;
    s32 sp0;
    if (_021D4150->unk4E == 24 || _021D4150->unk4E == 36) {
        if (ov00_021EC11C(&sp4, &sp0) != 0) {
            ov00_021EC210();
            return TRUE;
        }
    }
    else if ((_021D4150->unk4E == 25) && (ov00_021EC11C(&sp4, &sp0) != 0) && (sp0 == 7)) {
        return TRUE;
    }
    return FALSE;
}

void sub_0203960C(void) {
    s32 temp_r0 = ov00_021E5B6C();
    _021D4150->unk44--;
    if (temp_r0 == 0x1B) {
        if (_021D4150->unk4E == 0x21) {
            if (ov45_0222E804(_021D4150->unk60) == 1) {
                _021D4150->unk64 = 1;
                sub_020381C0(sub_02039C14, _021D4150->unk44);
            } else {
                sub_020381C0(sub_02039DC0, 0);
            }
        } else {
            sub_020381C0(sub_02039144, 0);
        }
    }
    else {
        if (temp_r0 != 0) {
            sub_020381C0(sub_02038E90, 0);
        }
        if (_021D4150->unk44 <= 0) {
            sub_020381C0(sub_02038E90, 0);
        }
    }

}

void sub_02039694(void) {
    if (sub_02034DB8() != 0) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_48, 0x35400U);
        if (sub_02035ED8(1, 1, 0x200, 1) != 0) {
            ov00_021E5900(_021D4150->unk28, 0x30, 0x2C400, sub_02033FC4(_021D4150->unk4E) + 1);
            ov00_021E6CA4(sub_020399DC);
            sub_02035FD8();
            sub_020381C0(sub_0203960C, 0xE10);
        }
    }
}

UnkStruct_ov44_0223197C* sub_020396FC(SaveData* arg0, u32 arg1) {
    Save_PlayerData_GetProfile(arg0);
    if (sub_02037474() != 0) {
        return NULL;
    }
    sub_0201A728(1);
    Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 0x7080U);
    sub_02037C98(arg0, 0x17);
    _021D4150->unk0 = Heap_Alloc(HEAP_ID_15, arg1);
    MI_CpuFill8(_021D4150->unk0, 0, arg1);
    _021D4150->unk4F = 0;
    _021D4150->unk28 = arg0;
    sub_020381C0(sub_02039694, 0);
    return _021D4150->unk0;
}

void sub_0203976C(SaveData* arg0, s32 arg1) {
    Save_PlayerData_GetProfile(arg0);
    if (sub_02037474() == 0) {
        sub_0201A728(1);
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 0x7080);
        sub_02037C98(arg0, 0x21);
        _021D4150->unk0 = NULL;
        _021D4150->unk60 = arg1;
        _021D4150->unk64 = 0;
        _021D4150->unk4F = 0;
        _021D4150->unk28 = arg0;
        sub_020381C0(sub_02039BA0, 0);
    }
}

void sub_020397C8(void) {
    if (_021D4150 != NULL) {
        sub_020381C0(sub_02039D78, 0);
    }
}

u8 sub_020397E4(void) {
    if (_021D4150 == NULL) {
        return 0;
    }
    return _021D4150->unk64;
}

BOOL sub_020397FC(void) {
    if ((_021D4150 != NULL) && (_021D4150->unk24 == sub_02039DC0)) {
        return TRUE;
    }
    return FALSE;
}

void sub_0203981C(s32 arg0) {
    GF_ASSERT(_021D4150);
    GF_ASSERT(sub_020392A0() == 1);
    if (ov45_0222F274(arg0) == 0) {
        ov45_0222F028(arg0, 4);
        sub_020381C0(sub_02039DE4, 0);
    } else {
        ov45_0222F350(arg0);
        sub_020381C0(sub_02039DE4, 0);
    }
}

void sub_0203986C(void) {
    if (ov45_0222F464() == 1) {
        ov45_0222F154();
    }
    ov45_0222F70C();
    sub_020381C0(sub_02039E30, 0);
}

s32 sub_0203988C(void) {
    if (_021D4150 != NULL) {
        void* temp_r1 = _021D4150->unk24;
        if (temp_r1 == sub_02039DC4) {
            return 2;
        }
        if (temp_r1 == sub_02039DE4) {
            return 1;
        }
        if (temp_r1 == sub_02039E30) {
            return 3;
        }
    }
    return 0;
}

UnkStruct_ov44_0223197C* sub_020398C8(void) {
    return _021D4150->unk0;
}

void sub_020398D4(s8 arg0, s8 arg1) {
    if (_021D4150 != NULL) {
        _021D4150->unk53 = arg0;
        _021D4150->unk54 = arg1;
        if (arg0 != 0) {
            _021D4150->unk4B = sub_02037454();
        } else {
            _021D4150->unk4B = 0;
        }
    }
    sub_020356C0(arg0);
    sub_020356EC(arg0);
}

BOOL sub_02039918(void) {
    if (_021D4150 != NULL) {
        if (_021D4150->unk5D != 0) {
            return TRUE;
        }
        return _021D4150->unk54;
    }
    return FALSE;
}

u8 sub_0203993C(void) {
    if (_021D4150 != NULL) {
        return _021D4150->unk4E;
    }
    return 1;
}

u8 sub_02039954(void) {
    if (_021D4150 != NULL) {
        return _021D4150->unk4F;
    }
    return 0;
}

void sub_0203996C(void* arg0) {
    MI_CpuCopy8(arg0, &_021D4150->unk4, 6);
}

void sub_02039980(void* arg0) {
    MI_CpuCopy8(&_021D4150->unk4, arg0, 6);
}

int sub_02039998(void) {
    sub_0203993C();
    return sub_02034044();
}

void sub_020399A4(s8 arg0) {
    if (_021D4150) {
        _021D4150->unk56 = arg0;
    }
}

u8 sub_020399B8(void) {
    if (sub_0201A79C() != 0) {
        return 0;
    }
    if (_021D4150) {
        return _021D4150->unk56;
    }
    return 0;
}

void sub_020399DC(u32 errorCode) {
    ShowCommunicationError(HEAP_ID_DEFAULT, 1, errorCode);
    while(TRUE) {}
}

void sub_020399EC(void) {
    ShowCommunicationError(HEAP_ID_DEFAULT, 4, 0);
    while(TRUE) {}
}

void sub_020399FC(void) {

}

void sub_02039A00(void) {
    if ((sub_02039918() != 0) && ((sub_02037700() != 0) || (sub_020393C8() != 0) || (sub_020395B0() != 0) || (_021D4150->unk5D != 0) || (sub_020397FC() != 0)) && (sub_0201A79C() == 0) && (sub_020399B8() == 0)) {
        Sound_Stop();
        Save_Cancel(_021D4150->unk28);
        gSystem.touchpadReadAuto = 1;
        if (_021D4150->unk5D == 3) {
            sub_020399A4(3);
            return;
        }
        if (_021D4150->unk5D == 5) {
            sub_020399A4(5);
            return;
        }
        if ((_021D4150->unk4E == 0x19) || (_021D4150->unk4E == 0xF) || (_021D4150->unk4E == 0x24)) {
            sub_020399A4(2);
            return;
        }
        sub_020399A4(1);
    }
}

BOOL sub_02039AA4(void) {
    if ((sub_02035630() != 0) || (sub_02037D78() == 0)) {
        return TRUE;
    }
    if (sub_02034BE4() == 0) {
        return TRUE;
    }
    if (sub_02033974() != 0) {
        return TRUE;
    }
    return FALSE;
}

BOOL sub_02039AD8(int arg0) {
    if (_021D4150 != NULL) {
        _021D4150->unk5D = arg0;
        sub_02037988();
        return TRUE;
    }
    return FALSE;
}

void sub_02039AF8(void) {
    _021D4150->unk4E = 0x1D;
    ov00_021E5C84(&sub_020369CC, &sub_020369CC);
}

void sub_02039B18(void) {
    _021D4150->unk4E = 0x23;
    ov00_021E5C84(&sub_020369CC, &sub_020369CC);
}

void sub_02039B38(void) {
    _021D4150->unk4E = 0x21;
    ov00_021E5C84(&sub_020369CC, &sub_020369CC);
}

void sub_02039B58(void) {
    _021D4150->unk4E = 0x17;
    ov00_021E5C84(&sub_02036904, &sub_020367A8);
}

void sub_02039B7C(void) {
    _021D4150->unk4E = 0x13;
    ov00_021E5C84(&sub_02036904, &sub_020367A8);
}

void sub_02039BA0(void) {
    if (sub_02034DB8() != 0) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_48, 0x60000);
        if (sub_02035ED8(1, 1, 0x200, 1) != 0) {
            ov00_021E5900(_021D4150->unk28, 0x30, 0x58000, sub_02033FC4(_021D4150->unk4E) + 1);
            ov00_021E6CA4(sub_020399DC);
            sub_02035FD8();
            ov00_021E70B8(0);
            sub_020378E4(0);
            sub_020381C0(sub_0203960C, 0xE10);
        }
    }
}

void sub_02039C14(void) {
    _021D4150->unk44--;
    if (_021D4150->unk44 <= 0) {
        sub_020381C0(sub_02038E90, 0);
        return;
    }
    sub_0203786C(1);
    if ((sub_02039D3C() != 0) && (ov45_0222E8F4() != 0)) {
        sub_020381C0(sub_02039C60, 0);
    }
}

void sub_02039C60(void) {
    if (sub_02039D3C()) {
        return;
    }
}

s32 sub_02039C6C(s32 arg0) {
    s32 var_r4 = 1;
    if ((arg0 >= 0xA) && (arg0 < 0x14)) {
        sub_020381C0(sub_02038EB4, 0);
        var_r4 = 0;
    } else if (arg0 < 0) {
        sub_020381C0(sub_02038E90, 0);
            var_r4 = 0;
    } else if (arg0 == 23) {
        sub_020381C0(sub_02039E7C, 0);
            var_r4 = 0;
    } else if (arg0 == 24) {
        var_r4 = 0;
        if (_021D4150->unk53 != 0) {
            sub_020381C0(sub_02038E90, 0);
        } else {
            sub_020381C0(sub_02038EB0, 0);
        }
    }
    if ((_021D4150->unk53 != 0) && (_021D4150->unk4B != sub_02037454())) {
        sub_020381C0(sub_02038E90, 0);
        var_r4 = 0;
    }
    return var_r4;
}

s32 sub_02039D08(void) {
    s32 var_r4 = 1;
    u32 temp_r0 = ov45_0222E6C8();
    switch (temp_r0) {
    case 0:
    case 1:
    case 2:
    case 3:
        break;
    case 4:
        sub_020381C0(sub_02039DC0, 0);
        var_r4 = 0;
        break;
    }
    return var_r4;
}

int sub_02039D3C(void) {
    s32 ret = sub_02039C6C(ov00_021E5E54(0));
    if (ret != 0) {
        return sub_02039D08();
    }
    return ret;
}

void sub_02039D54(s32* arg0) {
    s32 temp_r0 = ov00_021E5E54(0);
    if (temp_r0 >= 20) {
        *arg0 = temp_r0;
    } else {
        *arg0 = 0;
        if (sub_02039C6C(temp_r0) == 0) {
            return;
        }
    }
    sub_02039D08();
}

void sub_02039D78(void) {
    ov45_0222E91C();
    sub_020381C0(sub_02039D8C, 0);
}

void sub_02039D8C(void) {
    ov00_021E5E54(0);
    sub_02039D08();
    if (ov45_0222E944() != 0) {
        sub_0201A738(1);
        sub_020343E4();
        sub_020381C0(sub_0203847C, 5);
        sub_0203786C(0);
    }
}

void sub_02039DC0(void) {

}

void sub_02039DC4(void) {
    sub_02039D3C();
    if (ov45_0222F254() == 1) {
        ov45_0222F70C();
        sub_020381C0(sub_02039E30, 0);
    }
}

void sub_02039DE4(void) {

    if (ov45_0222F254() == 1) {
        ov45_0222F70C();
        sub_020381C0(sub_02039E30, 0);
        return;
    }
    s32 sp0;
    sub_02039D54(&sp0);
    if (sp0 != 0) {
        if (sp0 == 0x14) {
            sub_020381C0(sub_02039DC4, 0);
            return;
        }
        ov45_0222F70C();
        sub_020381C0(sub_02039C60, 0);
    }
}

void sub_02039E30(void) {
    if (ov00_021E5E54(1) < 0) {
        sub_020381C0(sub_02038E90, 0);
        return;
    }
    if ((sub_02039D08() != 0) && (ov00_021E6BE4(0) != 0) && (ov00_021E6C68() != 0)) {
        sub_0203622C();
        sub_020378E4(0);
        sub_020381C0(sub_02039C60, 0);
    }
}

void sub_02039E7C(void) {
    if (ov00_021E5E54(0) < 0) {
        sub_020381C0(sub_02038E90, 0);
    }
    sub_02039D08();
}

void sub_02039E9C(void) {
    _021D4150->unk4E = 0x22;
}

void sub_02039EAC(s32* arg0) {
    *arg0 = 0;
}

s32 sub_02039EB4(SaveData* arg0, s32 arg1, u32* arg2) {
    switch (*arg2) {
    case 0:
        sub_02037AC0(0x6F);
        *arg2 = 1;
    default:
        break;
    case 1:
        if (sub_02037B38(0x6F) != 0) {
            Save_PrepareForAsyncWrite(arg0, arg1);
            *arg2 = 2;
        }
        break;
    case 2:
        s32 temp_r0 = Save_WriteFileAsync(arg0);
        GF_ASSERT(temp_r0 != 2);
        if (temp_r0 == 1) {
            *arg2 = 3;
            sub_02037AC0(0x70);
        } else if (temp_r0 == 3) {
            *arg2 = 7;
        }
        break;
    case 3:
        if (sub_02037B38(0x70) != 0) {
            *arg2 = 4;
        }
        break;
    case 4:
        temp_r0 = Save_WriteFileAsync(arg0);
        GF_ASSERT(temp_r0 != 1);
        if (temp_r0 == 2) {
            *arg2 = 5;
        } else if (temp_r0 == 3) {
            *arg2 = 7;
        }
        break;
    case 5:
        *arg2 = 6;
        break;
    case 6:
        return 1;
    }
    return 0;
}

void sub_02039F68(SaveWiFiHistory* arg0) {
    s32 temp_r7 = sub_02037454();
    if (sub_02034818(0) != NULL) {
        for (int i = 0; i < temp_r7; i++) {
            if (i != sub_0203769C()) {
                s32 temp_r4 = sub_020348A8(i);
                s32 temp_r6 = sub_020348CC(i);
                sub_02039FB8(arg0, temp_r4, temp_r6, PlayerProfile_GetLanguage(sub_02034818(i)));
            }
        }
    }
}

void sub_02039FB8(SaveWiFiHistory* arg0, s32 arg1, s32 arg2, u8 arg3) {
    if (WiFiHistory_GetLocationSeenState(arg0, arg1, arg2) == 0) {
        WiFiHistory_SetLocationSeenState(arg0, arg1, arg2, 1);
    }
}

s32 sub_02039FD8(enum HeapID arg0) {
    void* temp_r0 = Heap_Alloc(arg0, 0x720);
    s32 temp_r5 = DWC_Init(((u32)temp_r0 + 31) & ~31); //TODO
    Heap_Free(temp_r0);
    return temp_r5;
}

s32 sub_02039FFC(enum HeapID arg0) {
    LoadDwcOverlay();
    LoadOVY38();
    s32 temp_r4 = sub_02039FD8(arg0);
    UnloadDwcOverlay();
    UnloadOVY38();
    return temp_r4;
}

void sub_0203A01C(UnkStruct_021D2230* arg0) {

    DWCUserData* userData = sub_0202C08C(arg0);
    if (DWC_CheckUserData(userData) == 0) {
        DWC_CreateUserData(userData, 0x4144414A);
        DWC_ClearDirtyFlag(userData);
    }
}

int sub_0203A040(UnkStruct_021D2230* arg0) {
    DWCUserData* userData = sub_0202C08C(arg0);
    DWCFriendData friendData;
    DWC_CreateExchangeToken(userData, &friendData);
    return DWC_GetGsProfileId(userData, &friendData);
}

BOOL sub_0203A05C(SaveData* arg0) {
    DWCUserData* userData = sub_0202C08C(sub_0202C6F4(arg0));
    if ((DWC_CheckHasProfile(userData) != 0) && (DWC_CheckValidConsole(userData) != 0)) {
        return TRUE;
    }
    return FALSE;
}

s32 sub_0203A084(SaveData* arg0, DWCFriendData* arg1, s32* arg2) {
    int i;
    DWCUserData* userData = sub_0202C08C(sub_0202C6F4(arg0));
    DWCFriendData* friendData = sub_0202C23C(sub_0202C6F4(arg0), 0);
    *arg2 = -1;
    if (DWC_IsValidFriendData(arg1) == 0) {
        return 3;
    }
    for (i = 0; i < 32; i++) {
        if (DWC_IsEqualFriendData(arg1, &friendData[i]) != 0) {
            *arg2 = i;
            return 0;
        }
        if (DWC_GetGsProfileId(userData, arg1) > 0) {
            if (DWC_GetGsProfileId(userData, arg1) == DWC_GetGsProfileId(userData, &friendData[i])) {
                *arg2 = i;
                return 1;
            }
        }
        if ((*arg2 < 0) && (DWC_IsValidFriendData(&friendData[i]) == 0)) {
            *arg2 = i;
        }
    }
    return 2;
}

int sub_0203A128(SaveData* arg0, u64 arg1, int* arg2) {
    int i;
    DWCUserData* userData = sub_0202C08C(sub_0202C6F4(arg0));
    DWCFriendData* friendData = sub_0202C23C(sub_0202C6F4(arg0), 0);
    if (!DWC_CheckFriendKey(userData, arg1)) {
        return 3;
    }
    DWCFriendData newFriendData;
    DWC_CreateFriendKeyToken(&newFriendData, arg1);
    if (DWC_GetGsProfileId(userData, &newFriendData) <= 0) {
        return 3;
    }
    *arg2 = -1;
    for (i = 0; i < 32; i ++) {
        if (DWC_GetGsProfileId(userData, &newFriendData) == DWC_GetGsProfileId(userData, &friendData[i])) {
            *arg2 = i;
            return 0;
        }
        if ((*arg2 < 0) && !DWC_IsValidFriendData(&friendData[i])) {
            *arg2 = i;
        }
    }
    return 2;
}

s32 sub_0203A1C4(SaveData* arg0, s32* arg1, enum HeapID arg2) {
    s32 spC = 0;
    DWCFriendData* friendData = sub_0202C23C(sub_0202C6F4(arg0), 0);
    for (int i = 0; i < sub_02037454(); i++) {
        if (i != sub_0203769C()) {
            DWCFriendData *temp_r0 = sub_0203484C(i);
            if (temp_r0 != NULL) {
                s32 sp10;
                *arg1 = sub_0203A084(arg0, temp_r0, &sp10);
                GF_ASSERT(*arg1 != 3);
                if (*arg1 == 0) {
                    sub_0203A280(arg0, i, sp10, arg2, 2);
                    sub_02034A20(arg0);
                }
                else if (*arg1 == 1) {
                    if (sub_02039998() == 0) {
                        sub_0203A280(arg0, i, sp10, arg2, 1);
                        MI_CpuCopy8(temp_r0, &friendData[sp10], sizeof(DWCFriendData));
                        sub_02034A20(arg0);
                    }
                }
                else if (*arg1 == 2) {
                    spC = 1;
                }
            }
        }
        arg1 += 1;
    }
    return spC;
}

void sub_0203A280(SaveData* arg0, s32 arg1, s32 arg2, enum HeapID arg3, u32 arg4) {
    UnkStruct_021D2230* temp_r0 = sub_0202C6F4(arg0);
    void* sp8 = sub_0202C23C(temp_r0, arg2);
    PlayerProfile* playerProfile = sub_02034818(arg1);
    if (arg4 != 2) {
        MI_CpuCopy8(sub_0203484C(arg1), sp8, 0xC);
    }
    if (arg4 == 0) {
        String* string = PlayerProfile_GetPlayerName_NewString(playerProfile, arg3);
        sub_0202C270(temp_r0, arg2, string);
        String_Delete(string);
        sub_0202C190(temp_r0, arg2, 8, PlayerProfile_GetTrainerGender(playerProfile));
        sub_0202C190(temp_r0, arg2, 0, PlayerProfile_GetTrainerID(playerProfile));
    } else if (((arg4 - 1) <= 1) && (sub_0202C090(temp_r0, arg2, 8) == 2)) {
        sub_0202C190(temp_r0, arg2, 8, PlayerProfile_GetTrainerGender(playerProfile));
        sub_0202C190(temp_r0, arg2, 0, PlayerProfile_GetTrainerID(playerProfile));
    }
    String* string = String_New(0x78, arg3);
    CopyU16ArrayToString(string, sub_02034884(arg1));
    sub_0202C2B4(temp_r0, arg2, string);
    String_Delete(string);
    sub_0202C190(temp_r0, arg2, 7, PlayerProfile_GetAvatar(playerProfile));
    sub_02034A20(arg0);
}

s32 sub_0203A378(SaveData* arg0, s32 arg1) {
    int i;
    DWCFriendData* friendData = sub_0203484C(arg1);
    UnkStruct_021D2230* r5 = sub_0202C6F4(arg0);

    for (i = 0; i < 32; i++) {
        if (DWC_IsEqualFriendData(friendData, sub_0202C23C(r5, i)) != 0) {
            return i;
        }
    }
    return 32;
}