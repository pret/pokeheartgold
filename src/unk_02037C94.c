#include "unk_02037C94.h"

#include "communication_error.h"
#include "dwcaccount.h"
#include "overlay_00_thumb.h"
#include "overlay_13_arm_2.h"
#include "overlay_45_thumb.h"
#include "system.h"
#include "unk_02005D10.h"
#include "unk_02032844.h"
#include "unk_02033AE0.h"
#include "unk_02034354.h"
#include "unk_02034B0C.h"
#include "unk_02035900.h"
#include "unk_020379A0.h"
#include "unk_0203A3B0.h"
#include "unk_020915B0.h"

typedef struct UnkStruct_sub_02039C6C {
    UnkStruct_ov44_0223197C *unk0;
    u8 unk4[8];
    MATHRandContext32 mathRandContext;
    void (*unk24)(void);
    SaveData *unk28;
    PlayerProfile *unk2C;
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

UnkStruct_sub_02039C6C *_021D4150 = NULL;

void (*const _020F6A90[3])(void) = { sub_0203827C, sub_02038398, NULL };

static u8 _0210F904[] = " GAME";
static u8 _0210F90C[] = "FREAK";
static u8 _0210F914[] = " FULL";

s32 sub_02037C94(void) {
    return 70;
}

void sub_02037C98(SaveData *saveData, s8 arg1) {
    if (_021D4150 == NULL) {
        GF_ASSERT(saveData);
        sub_02034D8C();
        UnkStruct_sub_02039C6C *temp_r0 = Heap_Alloc(HEAP_ID_15, sizeof(UnkStruct_sub_02039C6C));
        _021D4150 = temp_r0;
        MI_CpuFill8(temp_r0, 0, sizeof(UnkStruct_sub_02039C6C));
        _021D4150->unk44 = 50;
        _021D4150->unk52 = 1;
        _021D4150->unk28 = saveData;
        _021D4150->unk2C = Save_PlayerData_GetProfile(saveData);
        _021D4150->unk4A = 2;
        _021D4150->unk4C = 0;
        _021D4150->unk57 = 0;
        _021D4150->unk4E = arg1;
        sub_0203778C(&_021D4150->mathRandContext);
        sub_0203410C(0, 0, 0);
        if ((arg1 != 9) && (arg1 != 17) && (arg1 != 15)) {
            sub_0203A880();
        }
    }
}

void sub_02037D2C(void) {
    if (_021D4150 != NULL) {
        sub_02034154();
        if (_021D4150->unk0 != NULL) {
            Heap_Free(_021D4150->unk0);
        }
        if (sub_02039998()) {
            Heap_Destroy(HEAP_ID_48);
        }
        sub_0203A914();
        sub_02034DE0();
        Heap_Free(_021D4150);
        Heap_Destroy(HEAP_ID_15);
        _021D4150 = NULL;
    }
}

BOOL sub_02037D78(void) {
    return _021D4150 ? TRUE : FALSE;
}

void sub_02037D8C(SaveData *saveData, s8 arg1, s8 arg2, s32 arg3) {
    if (!sub_02037474()) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 28800);
        sub_02037C98(saveData, arg1);
        _021D4150->unk4F = arg2;
        _021D4150->unk30 = arg3;
        sub_020381C0(sub_02038218, 0);
    }
}

void sub_02037DD4(SaveData *saveData, s8 arg1, s8 arg2, s32 arg3) {
    if (!sub_02037474()) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 28800);
        sub_02037C98(saveData, arg1);
        _021D4150->unk4F = arg2;
        _021D4150->unk30 = arg3;
        sub_020381C0(sub_02038294, 0);
    }
}

void sub_02037E1C(s8 arg0) {
    _021D4150->unk4D = arg0;
    sub_020381C0(sub_020382E4, 0);
}

void sub_02037E38(void) {
    sub_02036274();
    sub_020381C0(sub_020383B0, 0);
}

void sub_02037E4C(void) {
    if (_021D4150->unk40 > 0) {
        _021D4150->unk40--;
    } else if (!_021D4150->unk40) {
        sub_020399EC();
    }
    if (_021D4150->unk44) {
        _021D4150->unk44--;
    }
    if ((sub_02034FE8()) && (!_021D4150->unk44)) {
        sub_02036024();
        sub_020381C0(sub_02038408, 0);
    }
}

void sub_02037E9C(void) {
    if (_021D4150 != NULL) {
        _021D4150->unk40 = 1800;
        sub_020381C0(sub_02037E4C, 5);
    }
}

void sub_02037EC0(void) {
    sub_02033A0C();
}

s32 sub_02037EC8(void) {
    void (*const sp0[3])(void);
    sp0 = _020F6A90;
    void (*func)(void) = _021D4150->unk24;
    if (!_021D4150) {
        return 0;
    }
    for (int i = 0; sp0[i] != NULL; i++) {
        if (func == sp0[i]) {
            return 1;
        }
    }
    return 0;
}

void sub_02037F18(SaveData *saveData) {
    if (_021D4150 == NULL) {
        if (!Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 28800)) {
            sub_020399EC();
        }
        sub_02037C98(saveData, 9);
        _021D4150->unk4E = 9;
        _021D4150->unk4F = 0;
        sub_020381C0(sub_020384B4, 0);
    }
}

void sub_02037F64(s8 arg0) {
    _021D4150->unk4D = arg0;
    _021D4150->unk48 = 3;
    sub_02033AA4(1);
    sub_0203A880();
    sub_020381C0(sub_02038668, 0);
}

s32 sub_02037F94(void) {
    if (_021D4150 == NULL) {
        return -1;
    }
    if (_021D4150->unk24 == sub_020387E8) {
        return 1;
    }
    if (_021D4150->unk24 == sub_02038800) {
        return -1;
    } else {
        return 0;
    }
}

s32 sub_02037FCC(void) {
    if (_021D4150 == NULL) {
        return 0;
    }
    if (_021D4150->unk24 == sub_02038854) {
        return 1;
    }
    return 0;
}

void sub_02037FF0(void) {
    sub_02033AA4(0);
    if ((_021D4150->unk53 != 1) || (_021D4150->unk54 != 1) || (_021D4150->unk4E == 9)) {
        sub_020398D4(0, 0);
    }
    sub_0203A914();
    _021D4150->unk4E = 9;
    _021D4150->unk57 = 0;
    sub_02033908(_021D4150->unk4A);
    if (!sub_0203769C()) {
        sub_02033ACC(1);
        sub_020381C0(sub_02038418, 15);
    } else {
        sub_020381C0(sub_02038460, 5);
    }
}

s32 sub_02038070(void) {
    if (_021D4150 == NULL) {
        return 1;
    } else if (_021D4150->unk24 != sub_02038538) {
        return 1;
    }
    return 0;
}

void sub_02038094(void) {
    if (_021D4150 != NULL) {
        sub_020381C0(sub_0203847C, 5);
    }
}

void sub_020380B0(void) {
    if (_021D4150 != NULL) {
        _021D4150->unk57 = 1;
        sub_02033AA4(1);
    }
}

void sub_020380CC(void) {
    if (_021D4150 != NULL) {
        _021D4150->unk57 = 1;
        sub_02033AA4(1);
        sub_020381C0(sub_020388A8, 0);
    }
}

void sub_020380F4(void) {
    _021D4150->unk4E = 18;
}

void sub_02038104(void) {
    _021D4150->unk4E = 9;
}

void sub_02038114(SaveData *saveData, s8 arg1) {
    if (!sub_02037474()) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 28800);
        sub_02037C98(saveData, arg1);
        sub_020381C0(sub_02038E00, 0);
    }
}

void sub_02038148(SaveData *saveData, s8 arg1) {
    if (!sub_02037474()) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 28800);
        sub_02037C98(saveData, arg1);
        sub_020381C0(sub_02038E48, 0);
    }
}

void sub_0203817C(void) {
    if ((_021D4150 != NULL) && (_021D4150->unk24 != NULL)) {
        _021D4150->unk24();
    }
    if (sub_02039998()) {
        sub_0203A930(3 - ov00_021EC9D4());
    } else if (sub_02035650()) {
        sub_0203A930(3 - WM_GetLinkLevel());
    }
}

void sub_020381C0(void (*arg0)(), int arg1) {
    _021D4150->unk24 = arg0;
    _021D4150->unk44 = arg1;
}

void sub_020381D0(void) {
    if (!sub_02039998()) {
        if (!sub_02035664()) {
            return;
        } else {
            sub_020374E4();
            sub_020350A8(1);
        }
    }
    sub_020381C0(sub_02038404, 0);
}

void sub_020381FC(void) {
    if (sub_02034FE8()) {
        sub_0203622C();
        sub_020381C0(sub_020381D0, 0);
    }
}

void sub_02038218(void) {
    if (sub_02034DB8()) {
        sub_02034B0C(_021D4150->unk2C, 1);
        sub_02034354(_021D4150->unk28, _021D4150->unk30);
        if (sub_02035ED8(1, 1, 512, 1)) {
            sub_02035FD8();
            sub_020381C0(sub_02038260, 0);
        }
    }
}

void sub_02038260(void) {
    if (sub_020373B4(sub_0203769C()) != FALSE) {
        sub_020381C0(sub_0203827C, 0);
    }
}

void sub_0203827C(void) {
    if (!sub_02037474()) {
        sub_020381C0(sub_02038408, 0);
    }
}

void sub_02038294(void) {
    if (sub_02034DB8()) {
        sub_02034B0C(_021D4150->unk2C, 1);
        sub_02034354(_021D4150->unk28, _021D4150->unk30);
        if (sub_02035F14(1, 1, 512)) {
            sub_02035FD8();
            sub_020381C0(sub_020382DC, 0);
        }
    }
}

void sub_020382DC(void) {
    sub_0203528C();
}

void sub_020382E4(void) {
    sub_0203528C();
    if (sub_020360E4(_021D4150->unk4D)) {
        sub_020381C0(sub_0203830C, 10);
    }
}

void sub_0203830C(void) {
    if (sub_02037700()) {
        sub_020381C0(sub_02038344, 0);
    }
    if ((sub_020373B4(sub_0203769C()) != FALSE) && (sub_0203769C() != FALSE)) {
        sub_020381C0(sub_02038398, 0);
    }
}

void sub_02038344(void) {
    sub_02034FE8();
    sub_020381C0(sub_02038358, 2);
}

void sub_02038358(void) {
    if (_021D4150->unk44) {
        _021D4150->unk44--;
        return;
    }
    if ((sub_02035664()) && (sub_02035F14(0, 1, 512))) {
        sub_02035FD8();
        sub_020381C0(sub_020382E4, 10);
    }
}

void sub_02038398(void) {
    if (!sub_02037474()) {
        sub_020381C0(sub_02038408, 0);
    }
}

void sub_020383B0(void) {
    sub_02034FE8();
    sub_020381C0(sub_020383C4, 2);
}

void sub_020383C4(void) {
    if (_021D4150->unk44) {
        _021D4150->unk44--;
        return;
    }
    if ((sub_02035664()) && (sub_02035F14(0, 1, 512))) {
        sub_02035FD8();
        sub_020381C0(sub_020382DC, 10);
    }
}

void sub_02038404(void) {
}

void sub_02038408(void) {
    if (!sub_02037474()) {
        sub_02037D2C();
    }
}

void sub_02038418(void) {
    if (sub_02037454() <= 1) {
        sub_02033ACC(0);
        sub_0203624C();
        sub_020381C0(sub_02038538, 0);
    }
    if (_021D4150->unk44) {
        _021D4150->unk44--;
        return;
    }
    sub_02033ACC(0);
    sub_0203624C();
    sub_020381C0(sub_02038538, 0);
}

void sub_02038460(void) {
    if (sub_02034FE8()) {
        sub_0203622C();
        sub_020381C0(sub_02038538, 0);
    }
}

void sub_0203847C(void) {
    if (_021D4150->unk44) {
        _021D4150->unk44--;
    }
    if ((sub_02034FE8()) && (!_021D4150->unk44)) {
        sub_02036024();
        sub_020381C0(sub_02038408, 0);
    }
}

void sub_020384B4(void) {
    if (sub_02034DB8()) {
        sub_02034B0C(_021D4150->unk2C, 1);
        sub_02033908(_021D4150->unk4A);
        sub_02034354(_021D4150->unk28, 0);
        if (sub_02035F14(1, 1, 512)) {
            sub_02035FD8();
            sub_020381C0(sub_02038508, 64);
        }
    }
}

void sub_02038508(void) {
    sub_0203528C();
    if (_021D4150->unk44) {
        _021D4150->unk44--;
        return;
    }
    if (sub_02034FE8()) {
        sub_020381C0(sub_02038550, 0);
    }
}

void sub_02038538(void) {
    if (sub_02034FE8()) {
        sub_020381C0(sub_02038550, 0);
    }
}

void sub_02038550(void) {
    if ((sub_02035664()) && (sub_02035ED8(0, _021D4150->unk52, 512, 1))) {
        // Equivalent to MATH_Rand32(&_021D4150->mathRandContext, 0);
        MATHRandContext32 *mathRandContext = &_021D4150->mathRandContext;
        mathRandContext->x = (mathRandContext->mul * mathRandContext->x) + mathRandContext->add;
        //
        sub_02035FD8();
        _021D4150->unk52 = 0;
        sub_020381C0(&sub_020385B8, 10000);
    }
}

void sub_020385B8(void) {
    if (!sub_020358B0()) {
        if (sub_020376F8()) {
            _021D4150->unk52 = 1;
            sub_0203A880();
            sub_020381C0(sub_02038854, 0);
            return;
        }
        if (_021D4150->unk44) {
            _021D4150->unk44--;
            return;
        }
    }
    if (sub_02034FE8()) {
        sub_020381C0(sub_02038610, 0);
    }
}

void sub_02038610(void) {
    if ((sub_02035664()) && (sub_02035F14(0, 0, 512))) {
        sub_02035FD8();
        // Equivalent to u32 rand = MATH_Rand32(&_021D4150->mathRandContext, 32)
        MATHRandContext32 *mathRandContext = &_021D4150->mathRandContext;
        u64 r0 = (mathRandContext->mul * mathRandContext->x) + mathRandContext->add;
        mathRandContext->x = r0;
        u32 rand = (u32)(((mathRandContext->x >> 32) * 32) >> 32);
        //
        sub_020381C0(sub_02038508, rand);
    }
}

void sub_02038668(void) {
    if (sub_02034FE8()) {
        sub_020381C0(sub_02038680, 0);
    }
}

void sub_02038680(void) {
    if ((sub_02035664()) && (sub_02035F14(0, 0, 512))) {
        sub_02035FD8();
        sub_020381C0(sub_020386AC, 100);
    }
}

void sub_020386AC(void) {
    if ((sub_020351AC(_021D4150->unk4D)) && (sub_020360E4(_021D4150->unk4D))) {
        sub_020381C0(sub_02038710, 100);
        return;
    }
    if (sub_02037700()) {
        sub_020381C0(sub_02038804, 0);
        return;
    }
    if (_021D4150->unk44) {
        _021D4150->unk44--;
        return;
    }
    sub_020381C0(sub_02038804, 0);
}

void sub_02038710(void) {
    if (sub_02037700()) {
        sub_020381C0(sub_02038804, 0);
        return;
    }
    if (sub_020373B4(sub_0203769C()) != FALSE) {
        _021D4150->unk4C = 0;
        sub_020381C0(sub_0203876C, 120);
        return;
    }
    if (_021D4150->unk44) {
        _021D4150->unk44--;
        return;
    }
    sub_020381C0(sub_02038804, 0);
}

void sub_0203876C(void) {
    if (sub_02037700()) {
        sub_020381C0(sub_02038804, 0);
        return;
    }
    if (_021D4150->unk4C == 2) {
        sub_020381C0(sub_02038800, 0);
        return;
    }
    if (_021D4150->unk4C == 1) {
        sub_02034434();
        sub_020381C0(sub_020387E8, 0);
        return;
    }
    if (_021D4150->unk44 > 110) {
        sub_020376E0(6, _0210F90C);
    }
    if (_021D4150->unk44) {
        _021D4150->unk44--;
        return;
    }
    sub_020381C0(sub_02038804, 0);
}

void sub_020387E8(void) {
    if (sub_02037700()) {
        sub_020381C0(sub_02038804, 0);
    }
}

void sub_02038800(void) {
}

void sub_02038804(void) {
    _021D4150->unk4C = 0;
    if (sub_02034FE8()) {
        if (_021D4150->unk48) {
            _021D4150->unk48--;
            sub_020381C0(sub_02038680, 0);
            return;
        }
        sub_020381C0(sub_02038800, 0);
    }
}

void sub_02038854(void) {
    if (!sub_020376F8()) {
        if ((!sub_02039918()) && (sub_02034FE8())) {
            sub_020381C0(sub_02038610, 0);
        }
    } else if (!sub_0203769C()) {
        sub_02034638();
    }
    if ((sub_02037700()) && (!sub_02039918())) {
        sub_020381C0(sub_02038804, 0);
    }
}

void sub_020388A8(void) {
    if ((sub_02035664()) && (sub_02035ED8(0, _021D4150->unk52, 512, 0))) {
        sub_02035FD8();
        sub_020381C0(sub_02038404, 0);
    }
}

void sub_020388E0(void) {
    u8 sp[2];
    _021D4150->unk4E = 13;
    if (!sub_0203769C()) {
        sp[1] = 0;
        sub_020376E0(10, &sp[1]);
        return;
    }
    sp[0] = 0;
    sub_020376E0(10, sp);
}

void sub_02038918(s8 arg0) {
    _021D4150->unk4D = arg0;
    _021D4150->unk48 = 3;
    sub_020381C0(sub_020389BC, 0);
}

void sub_0203893C(void) {
    _021D4150->unk4E = 7;
}

void sub_0203894C(s8 arg0) {
    _021D4150->unk4D = arg0;
    _021D4150->unk4E = 7;
    _021D4150->unk48 = 3;
    sub_0203A880();
    sub_020381C0(sub_02038668, 0);
}

void sub_0203897C(void) {
    _021D4150->unk4E = 26;
}

void sub_0203898C(s8 arg0) {
    _021D4150->unk4D = arg0;
    _021D4150->unk4E = 26;
    _021D4150->unk48 = 3;
    sub_0203A880();
    sub_020381C0(sub_02038668, 0);
}

void sub_020389BC(void) {
    if (sub_02034FE8()) {
        sub_020381C0(sub_020389D4, 0);
    }
}

void sub_020389D4(void) {
    if (sub_02035664()) {
        _021D4150->unk4E = 13;
        if (sub_02035F14(0, 0, 512)) {
            sub_02035FE4();
            sub_020381C0(sub_02038A10, 100);
        }
    }
}

void sub_02038A10(void) {
    if ((sub_020351AC(_021D4150->unk4D)) && (sub_020360E4(_021D4150->unk4D))) {
        sub_020381C0(sub_02038A94, 100);
        return;
    }
    if ((sub_02037700()) || (!_021D4150->unk44)) {
        _021D4150->unk48--;
        if (!_021D4150->unk48) {
            sub_020381C0(sub_02038800, 0);
            return;
        }
        sub_020381C0(sub_020389BC, 0);
        return;
    }
    if (_021D4150->unk44) {
        _021D4150->unk44--;
    }
}

void sub_02038A94(void) {
    if (_021D4150->unk44 > 90) {
        _021D4150->unk44--;
        return;
    }
    if (sub_02037700()) {
        _021D4150->unk48--;
        if (!_021D4150->unk48) {
            sub_020381C0(sub_02038800, 0);
            return;
        }
        sub_020381C0(sub_020389BC, 0);
        return;
    }
    if (sub_020373B4(sub_0203769C()) != FALSE) {
        sub_020381C0(sub_020387E8, 0);
        return;
    }
    if (_021D4150->unk44) {
        _021D4150->unk44--;
        return;
    }
    _021D4150->unk48--;
    if (!_021D4150->unk48) {
        sub_020381C0(sub_02038800, 0);
        return;
    }
    sub_020381C0(sub_020389BC, 0);
}

void sub_02038B3C(u8 arg0, u8 arg1, u8 *arg2) {
    u32 i;
    if (!sub_0203769C()) {
        s32 var_r3 = 1;
        for (i = 0; i < 6; i++) {
            if (_0210F90C[i] != arg2[i]) {
                var_r3 = 0;
                break;
            }
        }
        if ((var_r3) && (!_021D4150->unk57)) {
            _0210F904[0] = arg0;
            sub_02037184(7, _0210F904);
        } else {
            _0210F914[0] = arg0;
            sub_02037184(7, _0210F914);
        }
    }
}

void sub_02038B9C(u32 arg0, u32 arg1, u8 *arg2) {
    u32 i;
    s32 var_r4 = 1;
    for (i = 1; i < 6; i++) {
        if (_0210F904[i] != arg2[i]) {
            var_r4 = 0;
            break;
        }
    }
    if (var_r4) {
        u8 temp_r4 = *arg2;
        if (temp_r4 == sub_0203769C()) {
            _021D4150->unk4C = 1;
        }
    } else {
        var_r4 = 1;
        for (i = 1; i < 6; i++) {
            if (_0210F914[i] != arg2[i]) {
                var_r4 = 0;
                break;
            }
        }
        if (var_r4) {
            u8 temp_r4_2 = *arg2;
            u8 r0 = sub_0203769C();
            if (temp_r4_2 == r0) {
                _021D4150->unk4C = 2;
            }
        }
    }
}

s32 sub_02038C18(void) {
    return 6;
}

void sub_02038C1C(s8 arg0) {
    if (_021D4150 != NULL) {
        _021D4150->unk4A = arg0;
        sub_02033908(arg0);
    }
}

void sub_02038C34(void) {
    sub_0203528C();
}

void sub_02038C3C(u32 arg0, s32 arg1) {
    switch (arg0) {
    case 819:
        if (arg1 == 15) {
            _021D4150->unk58 = (1 | _021D4150->unk58);
        }
        break;
    case 0x400318:
        _021D4150->unk58 = (1 | _021D4150->unk58);
        break;
    case 0x400131:
        _021D4150->unk58 = (2 | _021D4150->unk58);
        break;
    case 0x400286:
        _021D4150->unk58 = (4 | _021D4150->unk58);
        break;
    }
}

void sub_02038CC4(void) {
    if (sub_02035F14(1, 1, 32)) {
        sub_02035FD8();
        sub_020381C0(sub_02038C34, 0);
    }
}

void sub_02038CE8(void) {
    if (sub_02034DB8()) {
        sub_02034B0C(_021D4150->unk2C, 0);
        sub_02034354(_021D4150->unk28, 0);
        sub_02033A7C(sub_02038C3C);
        sub_020381C0(sub_02038CC4, 0);
    }
}

void sub_02038D28(SaveData *arg0) {
    if (!sub_02037474()) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 0x7000);
        sub_02037C98(arg0, 17);
        _021D4150->unk4F = 0;
        sub_020381C0(sub_02038CE8, 0);
    }
}

void sub_02038D64(void) {
    if (_021D4150 != NULL) {
        sub_020381C0(sub_0203847C, 5);
    }
}

u8 sub_02038D80(void) {
    return _021D4150->unk58;
}

BOOL sub_02038D90(void) {
    sub_02037988();
    if (_021D4150 == NULL) {
        return TRUE;
    }
    if ((_021D4150->unk4E == 24) || (_021D4150->unk4E == 25) || (_021D4150->unk4E == 36)) {
        ov00_021E6CB8();
        return TRUE;
    }
    if (sub_02039998()) {
        if (_021D4150->unk4E == 33) {
            sub_020381C0(sub_02039D78, 0);
        } else {
            sub_020381C0(sub_020392F4, 0);
        }
    } else {
        sub_020381C0(sub_020381FC, 0);
    }
    return FALSE;
}

void sub_02038E00(void) {
    if (sub_02034DB8()) {
        sub_02034B0C(_021D4150->unk2C, 1);
        sub_02034354(_021D4150->unk28, 0);
        if (sub_02035ED8(1, 1, 512, 1)) {
            sub_02035FD8();
            sub_020381C0(sub_02038260, 0);
        }
    }
}

void sub_02038E48(void) {
    if (sub_02034DB8()) {
        sub_02034B0C(_021D4150->unk2C, 1);
        sub_02034354(_021D4150->unk28, 0);
        if (sub_02035F14(1, 1, 512)) {
            sub_02035FD8();
            sub_020381C0(sub_020382DC, 0);
        }
    }
}

void sub_02038E90(void) {
}

void sub_02038E94(void) {
    if (ov00_021E5E54(0) < 0) {
        sub_020381C0(sub_02038E90, 0);
    }
}

void sub_02038EB0(void) {
}

void sub_02038EB4(void) {
}

void sub_02038EB8(void) {
    sub_0203786C(1);
    s32 temp_r0 = ov00_021E5E54(0);
    if ((temp_r0 >= 10) && (temp_r0 < 20)) {
        sub_020381C0(sub_02038EB4, 0);
    } else if (temp_r0 < 0) {
        sub_020381C0(sub_02038E90, 0);
    } else if (temp_r0 == 23) {
        sub_020381C0(sub_02038E94, 0);
    } else if (temp_r0 == 24) {
        if (_021D4150->unk53) {
            sub_020381C0(sub_02038E90, 0);
        } else {
            sub_020381C0(sub_02038EB0, 0);
        }
    } else if (temp_r0 == 21) {
        if (_021D4150->unk53) {
            sub_020381C0(sub_02038E90, 0);
        } else {
            sub_020381C0(sub_02038EB0, 0);
        }
    }
    if ((_021D4150->unk53) && (_021D4150->unk4B != sub_02037454())) {
        sub_020381C0(sub_02038E90, 0);
    }
}

void sub_02038F74(u32 arg0, s32 arg1, s32 arg2) {
    if (_021D4150 != NULL) {
        if (arg0 - 25 > 1) {
            arg0 = -arg0;
        }
        _021D4150->unk34 = arg0;
        _021D4150->unk38 = arg1;
        _021D4150->unk3C = arg2;
    }
}

void sub_02038F9C(void) {
    s32 temp_r0 = ov00_021E5E54(0);
    if ((temp_r0 >= 10) && (temp_r0 < 20)) {
        sub_020381C0(sub_02038EB4, 0);
    } else if (temp_r0 < 0) {
        sub_020381C0(sub_02038E90, 0);
    } else if (temp_r0 == 20) {
        sub_020381C0(sub_02038EB8, 0);
    } else if (temp_r0 == 21) {
        sub_020381C0(sub_02038EB0, 0);
    } else if (temp_r0 == 22) {
        sub_020381C0(sub_02038EB4, 0);
    } else if (temp_r0 == 24) {
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
    } else if (temp_r0_2 == 26) {
        sub_020381C0(sub_02038E90, 0);
    }
}

void sub_020391D0(void) {
    sub_0203786C(0);
    if ((ov00_021E6BE4(_021D4150->unk50)) && (ov00_021E6C68())) {
        sub_020343E4();
        sub_020381C0(sub_02039144, 0);
    } else if (ov00_021E5E54(0) < 0) {
        sub_020381C0(sub_02038E90, 0);
    }
}

void sub_02039220(void) {
    if (!sub_0203769C()) {
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

u32 *sub_020392D8(void) {
    GF_ASSERT(_021D4150);
    return &_021D4150->unk34;
}

void sub_020392F4(void) {
    sub_0203786C(0);
    if (ov00_021E6BE4(0)) {
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
        if (!sub_0203769C()) {
            _021D4150->unk50 = 0;
        } else {
            _021D4150->unk50 = 1;
        }
        sub_020381C0(sub_020391D0, 0);
    }
}

void sub_020393B4(void) {
    u8 r1 = sub_0203769C();
    sub_020376E0(21, &r1);
}

BOOL sub_020393C8(void) {
    if (_021D4150 != NULL) {
        void (*func)() = _021D4150->unk24;
        if (func == sub_02038E90) {
            return TRUE;
        }
        if ((func == sub_02038E94) && (_021D4150->unk53)) {
            return TRUE;
        }
        if ((func == sub_02039E7C) && (_021D4150->unk53)) {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_02039418(SaveData *saveData) {
    if (_021D4150 == NULL) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 256);
        UnkStruct_sub_02039C6C *temp_r0 = Heap_Alloc(HEAP_ID_15, 104);
        _021D4150 = temp_r0;
        MI_CpuFill8(temp_r0, 0, 104);
        _021D4150->unk4E = 24;
        _021D4150->unk55 = 1;
        _021D4150->unk28 = saveData;
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

void sub_020394A0(SaveData *saveData) {

    if (_021D4150 == NULL) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 256);
        UnkStruct_sub_02039C6C *temp_r0 = Heap_Alloc(HEAP_ID_15, 104);
        _021D4150 = temp_r0;
        MI_CpuFill8(temp_r0, 0, 104);
        _021D4150->unk4E = 25;
        _021D4150->unk55 = 1;
        _021D4150->unk28 = saveData;
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

void sub_02039528(SaveData *saveData) {
    if (_021D4150 == NULL) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 256);
        UnkStruct_sub_02039C6C *temp_r0 = Heap_Alloc(HEAP_ID_15, 104);
        _021D4150 = temp_r0;
        MI_CpuFill8(temp_r0, 0, 104);
        _021D4150->unk4E = 36;
        _021D4150->unk55 = 1;
        _021D4150->unk28 = saveData;
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
        if (ov00_021EC11C(&sp4, &sp0)) {
            ov00_021EC210();
            return TRUE;
        }
    } else if ((_021D4150->unk4E == 25) && (ov00_021EC11C(&sp4, &sp0)) && (sp0 == 7)) {
        return TRUE;
    }
    return FALSE;
}

void sub_0203960C(void) {
    s32 temp_r0 = ov00_021E5B6C();
    _021D4150->unk44--;
    if (temp_r0 == 27) {
        if (_021D4150->unk4E == 33) {
            if (ov45_0222E804(_021D4150->unk60) == 1) {
                _021D4150->unk64 = 1;
                sub_020381C0(sub_02039C14, _021D4150->unk44);
            } else {
                sub_020381C0(sub_02039DC0, 0);
            }
        } else {
            sub_020381C0(sub_02039144, 0);
        }
    } else {
        if (temp_r0) {
            sub_020381C0(sub_02038E90, 0);
        }
        if (_021D4150->unk44 <= 0) {
            sub_020381C0(sub_02038E90, 0);
        }
    }
}

void sub_02039694(void) {
    if (sub_02034DB8()) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_48, 0x35400);
        if (sub_02035ED8(1, 1, 512, 1)) {
            ov00_021E5900(_021D4150->unk28, 48, 0x2C400, sub_02033FC4(_021D4150->unk4E) + 1);
            ov00_021E6CA4(sub_020399DC);
            sub_02035FD8();
            sub_020381C0(sub_0203960C, 3600);
        }
    }
}

UnkStruct_ov44_0223197C *sub_020396FC(SaveData *saveData, u32 arg1) {
    Save_PlayerData_GetProfile(saveData);
    if (sub_02037474()) {
        return NULL;
    }
    sub_0201A728(1);
    Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 28800);
    sub_02037C98(saveData, 23);
    _021D4150->unk0 = Heap_Alloc(HEAP_ID_15, arg1);
    MI_CpuFill8(_021D4150->unk0, 0, arg1);
    _021D4150->unk4F = 0;
    _021D4150->unk28 = saveData;
    sub_020381C0(sub_02039694, 0);
    return _021D4150->unk0;
}

void sub_0203976C(SaveData *saveData, s32 arg1) {
    Save_PlayerData_GetProfile(saveData);
    if (!sub_02037474()) {
        sub_0201A728(1);
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_15, 28800);
        sub_02037C98(saveData, 33);
        _021D4150->unk0 = NULL;
        _021D4150->unk60 = arg1;
        _021D4150->unk64 = 0;
        _021D4150->unk4F = 0;
        _021D4150->unk28 = saveData;
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
    if (!ov45_0222F274(arg0)) {
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
        if (_021D4150->unk24 == sub_02039DC4) {
            return 2;
        }
        if (_021D4150->unk24 == sub_02039DE4) {
            return 1;
        }
        if (_021D4150->unk24 == sub_02039E30) {
            return 3;
        }
    }
    return 0;
}

UnkStruct_ov44_0223197C *sub_020398C8(void) {
    return _021D4150->unk0;
}

void sub_020398D4(s8 arg0, s8 arg1) {
    if (_021D4150 != NULL) {
        _021D4150->unk53 = arg0;
        _021D4150->unk54 = arg1;
        if (arg0) {
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
        if (_021D4150->unk5D) {
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

void sub_0203996C(void *arg0) {
    MI_CpuCopy8(arg0, &_021D4150->unk4, 6);
}

void sub_02039980(void *arg0) {
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
    if (sub_0201A79C()) {
        return 0;
    }
    if (_021D4150) {
        return _021D4150->unk56;
    }
    return 0;
}

void sub_020399DC(u32 errorCode) {
    ShowCommunicationError(HEAP_ID_DEFAULT, 1, errorCode);
    while (TRUE) {}
}

void sub_020399EC(void) {
    ShowCommunicationError(HEAP_ID_DEFAULT, 4, 0);
    while (TRUE) {}
}

void sub_020399FC(void) {
}

void sub_02039A00(void) {
    if ((sub_02039918()) && ((sub_02037700()) || (sub_020393C8()) || (sub_020395B0()) || (_021D4150->unk5D) || (sub_020397FC())) && (!sub_0201A79C()) && (!sub_020399B8())) {
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
        if ((_021D4150->unk4E == 25) || (_021D4150->unk4E == 15) || (_021D4150->unk4E == 36)) {
            sub_020399A4(2);
            return;
        }
        sub_020399A4(1);
    }
}

BOOL sub_02039AA4(void) {
    if ((sub_02035630()) || (!sub_02037D78())) {
        return TRUE;
    }
    if (!sub_02034BE4()) {
        return TRUE;
    }
    if (sub_02033974()) {
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
    _021D4150->unk4E = 29;
    ov00_021E5C84(&sub_020369CC, &sub_020369CC);
}

void sub_02039B18(void) {
    _021D4150->unk4E = 35;
    ov00_021E5C84(&sub_020369CC, &sub_020369CC);
}

void sub_02039B38(void) {
    _021D4150->unk4E = 33;
    ov00_021E5C84(&sub_020369CC, &sub_020369CC);
}

void sub_02039B58(void) {
    _021D4150->unk4E = 23;
    ov00_021E5C84(&sub_02036904, &sub_020367A8);
}

void sub_02039B7C(void) {
    _021D4150->unk4E = 19;
    ov00_021E5C84(&sub_02036904, &sub_020367A8);
}

void sub_02039BA0(void) {
    if (sub_02034DB8()) {
        Heap_CreateAtEnd(HEAP_ID_3, HEAP_ID_48, 0x60000);
        if (sub_02035ED8(1, 1, 512, 1)) {
            ov00_021E5900(_021D4150->unk28, 48, 0x58000, sub_02033FC4(_021D4150->unk4E) + 1);
            ov00_021E6CA4(sub_020399DC);
            sub_02035FD8();
            ov00_021E70B8(0);
            sub_020378E4(0);
            sub_020381C0(sub_0203960C, 3600);
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
    if ((sub_02039D3C()) && (ov45_0222E8F4())) {
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
    if ((arg0 >= 10) && (arg0 < 20)) {
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
        if (_021D4150->unk53) {
            sub_020381C0(sub_02038E90, 0);
        } else {
            sub_020381C0(sub_02038EB0, 0);
        }
    }
    if ((_021D4150->unk53) && (_021D4150->unk4B != sub_02037454())) {
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
    if (ret) {
        return sub_02039D08();
    }
    return ret;
}

void sub_02039D54(s32 *arg0) {
    s32 temp_r0 = ov00_021E5E54(0);
    if (temp_r0 >= 20) {
        *arg0 = temp_r0;
    } else {
        *arg0 = 0;
        if (!sub_02039C6C(temp_r0)) {
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
    if (ov45_0222E944()) {
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
    if (sp0) {
        if (sp0 == 20) {
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
    if ((sub_02039D08()) && (ov00_021E6BE4(0)) && (ov00_021E6C68())) {
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
    _021D4150->unk4E = 34;
}

void sub_02039EAC(s32 *arg0) {
    *arg0 = 0;
}

s32 sub_02039EB4(SaveData *saveData, s32 arg1, u32 *arg2) {
    switch (*arg2) {
    case 0:
        sub_02037AC0(111);
        *arg2 = 1;
    default:
        break;
    case 1:
        if (sub_02037B38(111)) {
            Save_PrepareForAsyncWrite(saveData, arg1);
            *arg2 = 2;
        }
        break;
    case 2:
        s32 temp_r0 = Save_WriteFileAsync(saveData);
        GF_ASSERT(temp_r0 != 2);
        if (temp_r0 == 1) {
            *arg2 = 3;
            sub_02037AC0(112);
        } else if (temp_r0 == 3) {
            *arg2 = 7;
        }
        break;
    case 3:
        if (sub_02037B38(112)) {
            *arg2 = 4;
        }
        break;
    case 4:
        temp_r0 = Save_WriteFileAsync(saveData);
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

void sub_02039F68(SaveWiFiHistory *arg0) {
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

void sub_02039FB8(SaveWiFiHistory *arg0, s32 arg1, s32 arg2, u8 arg3) {
    if (!WiFiHistory_GetLocationSeenState(arg0, arg1, arg2)) {
        WiFiHistory_SetLocationSeenState(arg0, arg1, arg2, 1);
    }
}

s32 sub_02039FD8(enum HeapID heapID) {
    void *temp_r0 = Heap_Alloc(heapID, 1824);
    s32 temp_r5 = DWC_Init(((u32)temp_r0 + 31) & ~31); // TODO
    Heap_Free(temp_r0);
    return temp_r5;
}

s32 sub_02039FFC(enum HeapID heapID) {
    LoadDwcOverlay();
    LoadOVY38();
    s32 temp_r4 = sub_02039FD8(heapID);
    UnloadDwcOverlay();
    UnloadOVY38();
    return temp_r4;
}

void sub_0203A01C(WiFiList *arg0) {

    DWCUserData *userData = sub_0202C08C(arg0);
    if (!DWC_CheckUserData(userData)) {
        DWC_CreateUserData(userData, 0x4144414A);
        DWC_ClearDirtyFlag(userData);
    }
}

int sub_0203A040(WiFiList *arg0) {
    DWCUserData *userData = sub_0202C08C(arg0);
    DWCFriendData friendData;
    DWC_CreateExchangeToken(userData, &friendData);
    return DWC_GetGsProfileId(userData, &friendData);
}

BOOL sub_0203A05C(SaveData *saveData) {
    DWCUserData *userData = sub_0202C08C(sub_0202C6F4(saveData));
    if ((DWC_CheckHasProfile(userData)) && (DWC_CheckValidConsole(userData))) {
        return TRUE;
    }
    return FALSE;
}

s32 sub_0203A084(SaveData *saveData, DWCFriendData *arg1, s32 *arg2) {
    int i;
    DWCUserData *userData = sub_0202C08C(sub_0202C6F4(saveData));
    DWCFriendData *friendData = sub_0202C23C(sub_0202C6F4(saveData), 0);
    *arg2 = -1;
    if (!DWC_IsValidFriendData(arg1)) {
        return 3;
    }
    for (i = 0; i < 32; i++) {
        if (DWC_IsEqualFriendData(arg1, &friendData[i])) {
            *arg2 = i;
            return 0;
        }
        if (DWC_GetGsProfileId(userData, arg1) > 0) {
            if (DWC_GetGsProfileId(userData, arg1) == DWC_GetGsProfileId(userData, &friendData[i])) {
                *arg2 = i;
                return 1;
            }
        }
        if ((*arg2 < 0) && (!DWC_IsValidFriendData(&friendData[i]))) {
            *arg2 = i;
        }
    }
    return 2;
}

int sub_0203A128(SaveData *saveData, u64 arg1, int *arg2) {
    int i;
    DWCUserData *userData = sub_0202C08C(sub_0202C6F4(saveData));
    DWCFriendData *friendData = sub_0202C23C(sub_0202C6F4(saveData), 0);
    if (!DWC_CheckFriendKey(userData, arg1)) {
        return 3;
    }
    DWCFriendData newFriendData;
    DWC_CreateFriendKeyToken(&newFriendData, arg1);
    if (DWC_GetGsProfileId(userData, &newFriendData) <= 0) {
        return 3;
    }
    *arg2 = -1;
    for (i = 0; i < 32; i++) {
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

s32 sub_0203A1C4(SaveData *saveData, s32 *arg1, enum HeapID heapID) {
    s32 spC = 0;
    DWCFriendData *friendData = sub_0202C23C(sub_0202C6F4(saveData), 0);
    for (int i = 0; i < sub_02037454(); i++) {
        if (i != sub_0203769C()) {
            DWCFriendData *temp_r0 = sub_0203484C(i);
            if (temp_r0 != NULL) {
                s32 sp10;
                arg1[i] = sub_0203A084(saveData, temp_r0, &sp10);
                GF_ASSERT(arg1[i] != 3);
                if (arg1[i] == 0) {
                    sub_0203A280(saveData, i, sp10, heapID, 2);
                    sub_02034A20(saveData);
                } else if (arg1[i] == 1) {
                    if (!sub_02039998()) {
                        sub_0203A280(saveData, i, sp10, heapID, 1);
                        MI_CpuCopy8(temp_r0, &friendData[sp10], sizeof(DWCFriendData));
                        sub_02034A20(saveData);
                    }
                } else if (arg1[i] == 2) {
                    spC = 1;
                }
            }
        }
    }
    return spC;
}

void sub_0203A280(SaveData *saveData, s32 arg1, s32 arg2, enum HeapID heapID, u32 arg4) {
    WiFiList *wifiList = sub_0202C6F4(saveData);
    DWCFriendData *friendData = sub_0202C23C(wifiList, arg2);
    PlayerProfile *playerProfile = sub_02034818(arg1);
    if (arg4 != 2) {
        MI_CpuCopy8(sub_0203484C(arg1), friendData, 12);
    }
    if (arg4 == 0) {
        String *string = PlayerProfile_GetPlayerName_NewString(playerProfile, heapID);
        sub_0202C270(wifiList, arg2, string);
        String_Delete(string);
        sub_0202C190(wifiList, arg2, 8, PlayerProfile_GetTrainerGender(playerProfile));
        sub_0202C190(wifiList, arg2, 0, PlayerProfile_GetTrainerID(playerProfile));
    } else if (((arg4 - 1) <= 1) && (sub_0202C090(wifiList, arg2, 8) == 2)) {
        sub_0202C190(wifiList, arg2, 8, PlayerProfile_GetTrainerGender(playerProfile));
        sub_0202C190(wifiList, arg2, 0, PlayerProfile_GetTrainerID(playerProfile));
    }
    String *string = String_New(120, heapID);
    CopyU16ArrayToString(string, sub_02034884(arg1));
    sub_0202C2B4(wifiList, arg2, string);
    String_Delete(string);
    sub_0202C190(wifiList, arg2, 7, PlayerProfile_GetAvatar(playerProfile));
    sub_02034A20(saveData);
}

s32 sub_0203A378(SaveData *saveData, s32 arg1) {
    int i;
    DWCFriendData *friendData = sub_0203484C(arg1);
    WiFiList *r5 = sub_0202C6F4(saveData);

    for (i = 0; i < 32; i++) {
        if (DWC_IsEqualFriendData(friendData, sub_0202C23C(r5, i))) {
            return i;
        }
    }
    return 32;
}
