#include "overlay_42.h"

const s8 ov42_02229E0D[8] = { 0, 240, 0, 16, 240, 0, 16, 0 };
const u8 ov42_02229E08[4] = { 1, 0, 3, 2 };

const func_type_022285A4 ov42_02229E14[] = { ov42_022285A4, ov42_022285FC, ov42_02228668, ov42_02228700, ov42_02228798, ov42_022287F0, ov42_0222885C, ov42_022288F4, ov42_0222898C, ov42_022289F8, ov42_02228A64, ov42_02228AD0 };

const func_type_02228574 ov42_02229E44[] = { ov42_02228B3C, ov42_02228B40, ov42_02228B48, ov42_02228B88, ov42_02228BC8, ov42_02228BCC, ov42_02228B48, ov42_02228B48, ov42_02228BD4, ov42_02228BD4, ov42_02228BD4, ov42_02228BD4 };

const func_type_02229E74 ov42_02229E74[] = { ov42_02228CDC, ov42_02228D08, ov42_02228D44, ov42_02228DB8, ov42_02228DC8, ov42_02228DF0, ov42_02228DFC, ov42_02228D44, ov42_02228E0C, ov42_02228E0C, ov42_02228E0C, ov42_02228E0C };

s32 ov42_02227FA4(UnkStruct_ov42_02227F68 *arg0, u16 arg1, u16 arg2) {
    GF_ASSERT(arg0);
    UnkStruct_ov42_02227FA4 temp_r0 = ov42_02227F68(arg0, arg1, arg2);
    if (temp_r0.unk0 == -1) {
        return 1;
    }
    return (u32)((s32)temp_r0.unk0 << 31) >> 31;
}

u32 ov42_02227FDC(UnkStruct_ov42_02227F68 *arg0, u16 arg1, u16 arg2) {
    GF_ASSERT(arg0);
    UnkStruct_ov42_02227FA4 sp0 = ov42_02227F68(arg0, arg1, arg2);
    if (sp0.unk0 == -1) {
        return 0;
    }
    return sp0.unk0 / 2;
}

UnkStruct_ov42_022280A8 *ov42_02228010(u32 arg0, enum HeapID arg1) {
    UnkStruct_ov42_022280A8 *temp_r0 = Heap_Alloc(arg1, sizeof(UnkStruct_ov42_022280A8));
    GF_ASSERT(temp_r0);
    temp_r0->unk4 = arg0;
    UnkStruct_ov42_02228110 *temp_r0_2 = Heap_Alloc(arg1, arg0 * sizeof(UnkStruct_ov42_02228110));
    temp_r0->unk0 = temp_r0_2;
    GF_ASSERT(temp_r0_2);
    memset(temp_r0->unk0, 0, temp_r0->unk4 * sizeof(UnkStruct_ov42_02228110));
    return temp_r0;
}

void ov42_02228050(UnkStruct_ov42_022280A8 *arg0) {
    GF_ASSERT(arg0);
    Heap_Free(arg0->unk0);
    Heap_Free(arg0);
}

void ov42_02228068(UnkStruct_ov42_022280A8 *arg0, UnkStruct_ov42_02228EB0 *arg1) {
    ov42_02228548(ov42_02228110(arg0, arg1->unk7), arg1);
}

void ov42_0222807C(UnkStruct_ov42_022280A8 *arg0) {
    int temp = ov42_022280A8(arg0);
    for (u32 i = 0; i < temp; i++) {
        UnkStruct_ov42_02228110 *temp_r0 = ov42_02228148(arg0, i);
        if (temp_r0 != NULL) {
            ov42_02228574(temp_r0);
        }
    }
}

u32 ov42_022280A8(UnkStruct_ov42_022280A8 *arg0) {
    GF_ASSERT(arg0);
    return arg0->unk4;
}

UnkStruct_ov42_02228110 *ov42_022280B8(UnkStruct_ov42_022280A8 *arg0, UnkStruct_ov42_02122667 *arg1) {
    GF_ASSERT(arg0);
    GF_ASSERT(arg1);
    UnkStruct_ov42_02228110 *temp_r0;
    temp_r0 = ov42_022282B0(arg0);
    temp_r0->unk4.unk0 = arg1->unk0;
    temp_r0->unk4.unk2 = arg1->unk2;
    temp_r0->unk8.unk0 = arg1->unk0;
    temp_r0->unk8.unk2 = arg1->unk2;
    temp_r0->unkC = arg1->unk4;
    temp_r0->unk15 = arg1->unk6;
    temp_r0->unk14 = arg1->unk8;
    temp_r0->unkE = arg1->unkA;
    temp_r0->unk0 = 1;
    return temp_r0;
}

void ov42_02228100(void *arg0) {
    __builtin__clear(arg0, 24);
}

UnkStruct_ov42_02228110 *ov42_02228110(UnkStruct_ov42_022280A8 *arg0, u8 arg1) {
    for (int i = 0; i < arg0->unk4; i++) {
        if ((arg0->unk0[i].unk0 == 1) && (arg1 == arg0->unk0[i].unkC)) {
            return &arg0->unk0[i];
        }
    }
    return NULL;
}

UnkStruct_ov42_02228110 *ov42_02228148(UnkStruct_ov42_022280A8 *arg0, u16 arg1) {
    GF_ASSERT(arg0);
    GF_ASSERT(arg1 < arg0->unk4);
    if (arg0->unk0[arg1].unk0 == 1) {
        return &arg0->unk0[arg1];
    }
    return 0;
}

UnkStruct_ov42_02228110 *ov42_02228178(UnkStruct_ov42_022280A8 *arg0, u8 arg1) {
    return ov42_02228110(arg0, arg1);
}

UnkStruct_ov42_02228110 *ov42_02228180(UnkStruct_ov42_022280A8 *arg0, u16 arg1) {
    return ov42_02228148(arg0, arg1);
}

s32 ov42_02228188(UnkStruct_ov42_02228110 *arg0, s32 arg1) {
    s32 var_r5;
    GF_ASSERT(arg0);
    switch (arg1) {
    case 0:
        var_r5 = arg0->unk4.unk0;
        break;
    case 1:
        var_r5 = arg0->unk4.unk2;
        break;
    case 2:
        var_r5 = arg0->unk8.unk0;
        break;
    case 3:
        var_r5 = arg0->unk8.unk2;
        break;
    case 4:
        var_r5 = arg0->unkC;
        break;
    case 5:
        var_r5 = arg0->unk15;
        break;
    case 6:
        var_r5 = arg0->unk14;
        break;
    case 7:
        var_r5 = arg0->unkE;
        break;
    case 8:
        var_r5 = arg0->unk10;
        break;
    case 9:
        var_r5 = arg0->unk12;
        break;
    case 10:
        var_r5 = arg0->unk16;
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return var_r5;
}

void ov42_022281F8(UnkStruct_ov42_02228110 *arg0, u32 arg1, s32 arg2) {
    GF_ASSERT(arg0);
    switch (arg1) {
    case 0:
        arg0->unk4.unk0 = arg2;
        return;
    case 1:
        arg0->unk4.unk2 = arg2;
        return;
    case 2:
        arg0->unk8.unk0 = arg2;
        return;
    case 3:
        arg0->unk8.unk2 = arg2;
        return;
    case 4:
        arg0->unkC = arg2;
        return;
    case 5:
        GF_ASSERT(arg2 < 12);
        arg0->unk15 = arg2;
        return;
    case 6:
        GF_ASSERT(arg2 < 4);
        arg0->unk14 = arg2;
        return;
    case 7:
        arg0->unkE = arg2;
        return;
    case 8:
        arg0->unk10 = arg2;
        return;
    case 9:
        arg0->unk12 = arg2;
        return;
    case 10:
        arg0->unk16 = arg2;
        return;
    }
    GF_ASSERT(FALSE);
}

UnkStruct_ov44_02232914 ov42_02228270(UnkStruct_ov44_02232914 arg0, s32 arg1) {
    s32 temp_r0 = arg1 * 2;
    arg0.unk0 = arg0.unk0 + ov42_02229E0D[arg1 * 2];
    arg0.unk2 = arg0.unk2 + ov42_02229E0D[arg1 * 2 + 1];

    return arg0;
}

u8 ov42_022282A4(s32 arg0) {
    return ov42_02229E08[arg0];
}

UnkStruct_ov42_02228110 *ov42_022282B0(UnkStruct_ov42_022280A8 *arg0) {
    for (int i = 0; i < arg0->unk4; i++) {
        if (arg0->unk0[i].unk0 == 0) {
            return &arg0->unk0[i];
        }
    }
    GF_ASSERT(FALSE);
    return NULL;
}

UnkStruct_ov44_02232914 ov42_022282DC(UnkStruct_ov42_02228110 *arg0) {
    return arg0->unk4;
}

UnkStruct_ov44_02232914 ov42_022282E8(UnkStruct_ov42_02228110 *arg0) {
    return arg0->unk8;
}

UnkStruct_ov44_02232914 ov42_022282F4(UnkStruct_ov42_02228110 *arg0) {
    s32 temp_r4 = ov42_02228188(arg0, 8);
    s32 temp_r6 = ov42_02228188(arg0, 9);

    UnkStruct_ov44_02232914 temp_r0 = ov42_022282DC(arg0);
    UnkStruct_ov44_02232914 temp_r0_2 = ov42_022282E8(arg0);

    temp_r0.unk0 -= temp_r0_2.unk0;
    temp_r0.unk2 -= temp_r0_2.unk2;
    if (temp_r4 > 0) {
        temp_r0.unk0 = temp_r4 * temp_r0.unk0 / temp_r6;
        temp_r0.unk2 = temp_r4 * temp_r0.unk2 / temp_r6;
    } else {
        temp_r0.unk0 = 0;
        temp_r0.unk2 = 0;
    }
    temp_r0.unk0 += temp_r0_2.unk0;
    temp_r0.unk2 += temp_r0_2.unk2;
    return temp_r0;
}

void ov42_0222839C(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1) {
    arg0->unk4 = arg1;
}

void ov42_022283AC(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1) {
    arg0->unk8 = arg1;
}

UnkStruct_ov42_02228110 *ov42_022283BC(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_022280A8 *arg1, s32 arg2) {
    u32 temp_r0_4;
    u32 sp4;

    UnkStruct_ov44_02232914 temp_r0_3 = ov42_022282DC(arg0);
    temp_r0_3 = ov42_02228270(temp_r0_3, arg2);
    sp4 = ov42_02228188(arg0, 4);
    temp_r0_4 = ov42_022280A8(arg1);
    for (u32 i = 0; i < temp_r0_4; i++) {
        UnkStruct_ov42_02228110 *temp_r0 = ov42_02228180(arg1, i);
        if (temp_r0 != 0) {
            u32 r1 = ov42_02228188(temp_r0, 4);
            if (r1 != sp4) {
                UnkStruct_ov44_02232914 temp_r0_5 = ov42_022282DC(temp_r0);
                if ((temp_r0_5.unk0 == temp_r0_3.unk0) && (temp_r0_5.unk2 == temp_r0_3.unk2)) {
                    return temp_r0;
                }
                temp_r0_5 = ov42_022282E8(temp_r0);
                if ((temp_r0_5.unk0 == temp_r0_3.unk0) && (temp_r0_5.unk2 == temp_r0_3.unk2)) {
                    return temp_r0;
                }
            }
        }
    }
    return NULL;
}

UnkStruct_ov42_02228110 *ov42_022284A4(UnkStruct_ov42_022280A8 *arg0, UnkStruct_ov44_02232914 arg1) {
    u32 r0 = ov42_022280A8(arg0);
    for (u32 i = 0; i < r0; i++) {
        UnkStruct_ov42_02228110 *temp = ov42_02228180(arg0, i);
        if (temp != NULL) {
            UnkStruct_ov44_02232914 struct0 = ov42_022282DC(temp);
            if ((struct0.unk0 == arg1.unk0) && (struct0.unk2 == arg1.unk2)) {
                return temp;
            }
            struct0 = ov42_022282E8(temp);
            if ((struct0.unk0 == arg1.unk0) && (struct0.unk2 == arg1.unk2)) {
                return temp;
            }
        }
    }
    return NULL;
}

void ov42_02228548(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02228EB0 *arg1) {
    ov42_02229E14[arg1->unk4](arg0, arg1->unk0, arg1->unk6);
    arg0->unk16 = 0;
}

void ov42_02228574(UnkStruct_ov42_02228110 *arg0) {
    s32 temp_r0 = ov42_02229E44[ov42_02228188(arg0, 5)](arg0);
    arg0->unk16++;
    if (temp_r0 == 1) {
        ov42_02228C40(arg0);
        arg0->unk16 = 0;
    }
}

void ov42_022285A4(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2) {
    GF_ASSERT(arg0);
    ov42_0222839C(arg0, arg1);
    ov42_022283AC(arg0, arg1);
    ov42_022281F8(arg0, 6, arg2);
    ov42_022281F8(arg0, 5, 0);
}

void ov42_022285FC(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2) {
    GF_ASSERT(arg0);
    ov42_0222839C(arg0, arg1);
    ov42_022283AC(arg0, arg1);
    ov42_022281F8(arg0, 6, arg2);
    ov42_022281F8(arg0, 5, 1);
    ov42_022281F8(arg0, 8, 0);
    ov42_022281F8(arg0, 9, 2);
}

void ov42_02228668(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2) {
    GF_ASSERT(arg0);
    UnkStruct_ov44_02232914 temp_r0 = ov42_02228BDC(arg1, arg2);
    ov42_022283AC(arg0, arg1);
    ov42_0222839C(arg0, temp_r0);
    ov42_022281F8(arg0, 6, arg2);
    ov42_022281F8(arg0, 5, 2);
    ov42_022281F8(arg0, 8, 0);
    ov42_022281F8(arg0, 9, 8);
}

void ov42_02228700(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2) {
    GF_ASSERT(arg0);
    UnkStruct_ov44_02232914 temp_r0 = ov42_02228BDC(arg1, arg2);
    ov42_022283AC(arg0, arg1);
    ov42_0222839C(arg0, temp_r0);
    ov42_022281F8(arg0, 6, arg2);
    ov42_022281F8(arg0, 5, 3);
    ov42_022281F8(arg0, 8, 0);
    ov42_022281F8(arg0, 9, 4);
}

void ov42_02228798(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2) {
    GF_ASSERT(arg0);
    ov42_0222839C(arg0, arg1);
    ov42_022283AC(arg0, arg1);
    ov42_022281F8(arg0, 6, arg2);
    ov42_022281F8(arg0, 5, 4);
}

void ov42_022287F0(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2) {
    GF_ASSERT(arg0);
    ov42_0222839C(arg0, arg1);
    ov42_022283AC(arg0, arg1);
    ov42_022281F8(arg0, 6, arg2);
    ov42_022281F8(arg0, 5, 5);
    ov42_022281F8(arg0, 8, 0);
    ov42_022281F8(arg0, 9, 16);
}

void ov42_0222885C(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2) {
    GF_ASSERT(arg0);
    UnkStruct_ov44_02232914 temp_r0 = ov42_02228BDC(arg1, arg2);
    ov42_022283AC(arg0, arg1);
    ov42_0222839C(arg0, temp_r0);
    ov42_022281F8(arg0, 6, arg2);
    ov42_022281F8(arg0, 5, 6);
    ov42_022281F8(arg0, 8, 0);
    ov42_022281F8(arg0, 9, 16);
}

void ov42_022288F4(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2) {
    GF_ASSERT(arg0);
    UnkStruct_ov44_02232914 temp_r0 = ov42_02228BDC(arg1, arg2);
    ov42_022283AC(arg0, arg1);
    ov42_0222839C(arg0, temp_r0);
    ov42_022281F8(arg0, 6, arg2);
    ov42_022281F8(arg0, 5, 7);
    ov42_022281F8(arg0, 8, 0);
    ov42_022281F8(arg0, 9, 4);
}

void ov42_0222898C(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2) {
    GF_ASSERT(arg0);
    ov42_022283AC(arg0, arg1);
    ov42_0222839C(arg0, arg1);
    ov42_022281F8(arg0, 6, arg2);
    ov42_022281F8(arg0, 5, 8);
    ov42_022281F8(arg0, 8, 0);
    ov42_022281F8(arg0, 9, 2);
}

void ov42_022289F8(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2) {
    GF_ASSERT(arg0);
    ov42_022283AC(arg0, arg1);
    ov42_0222839C(arg0, arg1);
    ov42_022281F8(arg0, 6, arg2);
    ov42_022281F8(arg0, 5, 9);
    ov42_022281F8(arg0, 8, 0);
    ov42_022281F8(arg0, 9, 4);
}

void ov42_02228A64(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2) {
    GF_ASSERT(arg0);
    ov42_022283AC(arg0, arg1);
    ov42_0222839C(arg0, arg1);
    ov42_022281F8(arg0, 6, arg2);
    ov42_022281F8(arg0, 5, 10);
    ov42_022281F8(arg0, 8, 0);
    ov42_022281F8(arg0, 9, 8);
}

void ov42_02228AD0(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov44_02232914 arg1, u32 arg2) {
    GF_ASSERT(arg0);
    ov42_022283AC(arg0, arg1);
    ov42_0222839C(arg0, arg1);
    ov42_022281F8(arg0, 6, arg2);
    ov42_022281F8(arg0, 5, 11);
    ov42_022281F8(arg0, 8, 0);
    ov42_022281F8(arg0, 9, 16);
}

s32 ov42_02228B3C(UnkStruct_ov42_02228110 *arg0) {
    return 0;
}

s32 ov42_02228B40(UnkStruct_ov42_02228110 *arg0) {
    return ov42_02228C0C(arg0);
}

s32 ov42_02228B48(UnkStruct_ov42_02228110 *arg0) {
    s32 temp_r0 = ov42_02228C0C(arg0);
    if (temp_r0 == 1) {
        UnkStruct_ov44_02232914 temp_r0_2 = ov42_022282DC(arg0);
        ov42_022283AC(arg0, temp_r0_2);
    }
    return temp_r0;
}

s32 ov42_02228B88(UnkStruct_ov42_02228110 *arg0) {
    s32 temp_r0 = ov42_02228C0C(arg0);
    if (temp_r0 == 1) {
        UnkStruct_ov44_02232914 temp_r0_2 = ov42_022282DC(arg0);
        ov42_022283AC(arg0, temp_r0_2);
    }
    return temp_r0;
}

s32 ov42_02228BC8(UnkStruct_ov42_02228110 *arg0) {
    return 0;
}

s32 ov42_02228BCC(UnkStruct_ov42_02228110 *arg0) {
    return ov42_02228C0C(arg0);
}

s32 ov42_02228BD4(UnkStruct_ov42_02228110 *arg0) {
    return ov42_02228C0C(arg0);
}

UnkStruct_ov44_02232914 ov42_02228BDC(UnkStruct_ov44_02232914 arg0, s32 arg1) {
    return ov42_02228270(arg0, arg1);
}

s32 ov42_02228C0C(UnkStruct_ov42_02228110 *arg0) {
    s32 temp_r4 = ov42_02228188(arg0, 8);
    s32 temp_r0 = ov42_02228188(arg0, 9);
    if (temp_r4 < temp_r0) {
        ov42_022281F8(arg0, 8, temp_r4 + 1);
        if ((temp_r4 + 1) < temp_r0) {
            return 0;
        }
    }
    return 1;
}

void ov42_02228C40(UnkStruct_ov42_02228110 *arg0) {
    UnkStruct_ov44_02232914 sp = ov42_022282DC(arg0);
    u32 temp_r0 = ov42_02228188(arg0, 6);
    ov42_022285A4(arg0, sp, temp_r0);
}

s32 ov42_02228C80(UnkStruct_ov42_02227F68 *arg0, UnkStruct_ov42_022280A8 *arg1, UnkStruct_ov42_02228CDC *arg2, UnkStruct_ov42_02228EB0 *arg3) {
    GF_ASSERT(arg0);
    GF_ASSERT(arg1);
    GF_ASSERT(arg2);
    GF_ASSERT(arg3);
    UnkStruct_ov42_02228110 *temp_r0 = ov42_02228178(arg1, arg2->unk3);
    GF_ASSERT(temp_r0);
    return ov42_02229E74[arg2->unk0](temp_r0, arg0, arg1, arg2, arg3);
}
