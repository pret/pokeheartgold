#include "global.h"
#include "bag.h"
#include "filesystem.h"
#include "gf_rtc.h"
#include "save_misc_data.h"

typedef struct UnkStruct_a066 {
    u16 unk0;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
    u8 unkA;
    u8 unkB;
} UnkStruct_a066; // size: 0xc

typedef struct UnkStruct_ov16_022014A0 {
    u8 unk0;
    u8 unk1;
    u8 unk2;
} UnkStruct_ov16_022014A0; // size: 0x3

NARC *ov16_02201840(HeapID heapId);
UnkStruct_a066 *ov16_0220184C(NARC *narc, s32 fileId, HeapID heapId);
void ov16_02201854(NARC *narc);
u16 ov16_0220185C(UnkStruct_a066 *unk, u32 attr);

extern _s32_div_f();

UnkStruct_ov16_022014A0 *ov16_022014A0(HeapID heapId);
#ifdef NONMATCHING
UnkStruct_ov16_022014A0 *ov16_022014A0(HeapID heapId) {
    NARC *narc = ov16_02201840(heapId);
    UnkStruct_ov16_022014A0 *unk = AllocFromHeap(heapId, 64 * sizeof(UnkStruct_ov16_022014A0));

    s32 fileId = 0;
    UnkStruct_ov16_022014A0 *Unk = unk;
    for (; fileId < 64; fileId++, Unk++) {
        UnkStruct_a066 *unk_a066 = ov16_0220184C(narc, fileId, heapId);
        Unk->unk0 = ov16_0220185C(unk_a066, 3);
        Unk->unk1 = ov16_0220185C(unk_a066, 4);
        Unk->unk2 = ov16_0220185C(unk_a066, 2);

        FreeToHeap(unk_a066);
    }

    ov16_02201854(narc);

    return unk;
}
#else
asm UnkStruct_ov16_022014A0 *ov16_022014A0(HeapID heapId) {
    push {r3, r4, r5, r6, r7, lr}
    sub sp, #8
    add r7, r0, #0
    bl ov16_02201840
    str r0, [sp]
    add r0, r7, #0
    mov r1, #0xc0
    bl AllocFromHeap
    str r0, [sp, #4]
    mov r6, #0
    add r5, r0, #0
_022014BA:
    ldr r0, [sp]
    add r1, r6, #0
    add r2, r7, #0
    bl ov16_0220184C
    add r4, r0, #0
    mov r1, #3
    bl ov16_0220185C
    strb r0, [r5]
    add r0, r4, #0
    mov r1, #4
    bl ov16_0220185C
    strb r0, [r5, #1]
    add r0, r4, #0
    mov r1, #2
    bl ov16_0220185C
    strb r0, [r5, #2]
    add r0, r4, #0
    bl FreeToHeap
    add r6, r6, #1
    add r5, r5, #3
    cmp r6, #0x40
    blt _022014BA
    ldr r0, [sp]
    bl ov16_02201854
    ldr r0, [sp, #4]
    add sp, #8
    pop {r3, r4, r5, r6, r7, pc}
}
#endif

void ov16_022014FC(BERRY_POT *berryPot);
void ov16_022014FC(BERRY_POT *berryPot) {
    berryPot->unk_0 = 0;
    berryPot->unk_1 = 0;
    berryPot->unk_2 = 0;
    berryPot->unk_4 = 0;
    berryPot->unk_8 = 0;
    berryPot->unk_6 = 0;
    berryPot->moistureMaybe = 0;
    berryPot->unk_A = 0;
    berryPot->unk_B = 0;
}

u32 ov16_02201514(BERRY_POT *berryPot, UnkStruct_ov16_022014A0 *a1);
u32 ov16_02201514(BERRY_POT *berryPot, UnkStruct_ov16_022014A0 *a1) {
    return berryPot->unk_A * a1[berryPot->unk_0 - 1].unk2;
}

u32 ov16_02201528(UnkStruct_ov16_022014A0 *a0, int a1, int a2);
u32 ov16_02201528(UnkStruct_ov16_022014A0 *a0, int a1, int a2) {
    s32 unk = a0[a1 - 1].unk0 * 60;
    if (a2 == 1) {
        return (unk * 3) / 4;
    } else if (a2 == 2) {
        unk += (unk / 2);
    }
    return unk;
}

u32 ov16_02201554(UnkStruct_ov16_022014A0 *a0, int a1, int a2);
u32 ov16_02201554(UnkStruct_ov16_022014A0 *a0, int a1, int a2) {
    s32 unk = a0[a1 - 1].unk1;
    if (a2 == 2) {
        return unk / 2;
    } else if (a2 == 1) {
        unk = unk + unk / 2;
    }
    return unk;
}

u32 ov16_02201578(BERRY_POT *berryPot);
u32 ov16_02201578(BERRY_POT *berryPot) {
    return (berryPot->unk_B == 3) ? 6 : 4;
}

u32 ov16_02201588(BERRY_POT *berryPot);
u32 ov16_02201588(BERRY_POT *berryPot) {
    return (berryPot->unk_B == 4) ? 15 : 10;
}

u32 ov16_02201598(BERRY_POT *berryPot);
u32 ov16_02201598(BERRY_POT *berryPot) {
    u32 unk1 = ov16_02201578(berryPot);
    u32 unk2 = ov16_02201588(berryPot);
    return (unk1 + 3) * unk2 + 1;
}

u8 ov16_022015B0(BERRY_POT *berryPots, u32 idx);
u8 ov16_022015B0(BERRY_POT *berryPots, u32 idx) {
    return berryPots[idx].unk_1;
}

u8 ov16_022015BC(BERRY_POT *berryPots, u32 idx);
u8 ov16_022015BC(BERRY_POT *berryPots, u32 idx) {
    return berryPots[idx].unk_0;
}

u32 ov16_022015C4(BERRY_POT *berryPots, u32 idx);
u32 ov16_022015C4(BERRY_POT *berryPots, u32 idx) {
    s32 moisture = berryPots[idx].moistureMaybe;
    if (moisture == 0) {
        return 0;
    } else if (moisture <= 50) {
        return 1;
    } else {
        return 2;
    }
}

u8 ov16_022015E0(BERRY_POT *berryPots, u32 idx);
u8 ov16_022015E0(BERRY_POT *berryPots, u32 idx) {
    return berryPots[idx].moistureMaybe;
}

u8 ov16_022015EC(BERRY_POT *berryPots, u32 idx);
u8 ov16_022015EC(BERRY_POT *berryPots, u32 idx) {
    return berryPots[idx].unk_A;
}

u16 ov16_022015F8(BERRY_POT *berryPots, u32 idx);
u16 ov16_022015F8(BERRY_POT *berryPots, u32 idx) {
    return berryPots[idx].unk_2;
}

u16 ov16_02201604(BERRY_POT *berryPots, u32 idx);
u16 ov16_02201604(BERRY_POT *berryPots, u32 idx) {
    return berryPots[idx].unk_4;
}

void ov16_02201610(BERRY_POT *berryPots, u32 idx, UnkStruct_ov16_022014A0 *a2, u8 a3);
void ov16_02201610(BERRY_POT *berryPots, u32 idx, UnkStruct_ov16_022014A0 *a2, u8 a3) {
    berryPots[idx].unk_0 = a3;
    berryPots[idx].unk_1 = 1;
    berryPots[idx].unk_2 = ov16_02201528(a2, a3, berryPots[idx].unk_B);
    berryPots[idx].unk_4 = 0;
    berryPots[idx].unk_8 = 0;
    berryPots[idx].unk_6 = 0;
    berryPots[idx].moistureMaybe = 100;
    berryPots[idx].unk_A = 5;
}

void ov16_02201644(BERRY_POT *berryPots, u32 idx);
void ov16_02201644(BERRY_POT *berryPots, u32 idx) {
    berryPots[idx].moistureMaybe = 100;
}

u8 ov16_02201650(BERRY_POT *berryPots, u32 idx);
u8 ov16_02201650(BERRY_POT *berryPots, u32 idx) {
    return berryPots[idx].unk_B;
}

void ov16_0220165C(BERRY_POT *berryPots, u32 idx, u8 a2);
void ov16_0220165C(BERRY_POT *berryPots, u32 idx, u8 a2) {
    berryPots[idx].unk_B = a2;
}

u16 ov16_02201668(BERRY_POT *berryPots, u32 idx);
u16 ov16_02201668(BERRY_POT *berryPots, u32 idx) {
    return berryPots[idx].unk_6;
}

u16 ov16_02201674(BERRY_POT *berryPots, u32 idx);
u16 ov16_02201674(BERRY_POT *berryPots, u32 idx) {
    u16 unk = berryPots[idx].unk_6;
    ov16_022014FC(&berryPots[idx]);
    return unk;
}

void ov16_02201688(BERRY_POT *berryPot, UnkStruct_ov16_022014A0 *a1);
void ov16_02201688(BERRY_POT *berryPot, UnkStruct_ov16_022014A0 *a1) {
    switch (berryPot->unk_1) {
        case 0:
            GF_ASSERT(FALSE);
            return;
        case 1:
        case 2:
        case 3:
            berryPot->unk_1++;
            return;
        case 4:
            berryPot->unk_6 = ov16_02201514(berryPot, a1);
            if (berryPot->unk_6 < 2) {
                berryPot->unk_6 = 2;
            }
            berryPot->unk_1++;
            return;
        case 5:
            berryPot->unk_6 = 0;
            berryPot->unk_1 = 2;
            berryPot->unk_A = 5;
            berryPot->unk_8++;
            if (berryPot->unk_8 == ov16_02201588(berryPot)) {
                ov16_022014FC(berryPot);
            }
            return;
    }
}

void ov16_022016F4(BERRY_POT *berryPot, UnkStruct_ov16_022014A0 *a1, u32 a2);
#ifdef NONMATCHING
void ov16_022016F4(BERRY_POT *berryPot, UnkStruct_ov16_022014A0 *a1, u32 a2) {
    if (berryPot->unk_1 == 5) {
        return;
    }

    s32 iVar2 = ov16_02201554(a1, berryPot->unk_0, berryPot->unk_B);
    s32 iVar3 = (a2 + berryPot->unk_4) / 60;
    berryPot->unk_4 = (a2 + berryPot->unk_4) / 60;
    if (iVar3 == 0) {
        return;
    }

    if (iVar3 * iVar2 <= berryPot->moistureMaybe) {
        berryPot->moistureMaybe -= (iVar3 * iVar2);
        return;
    }

    if (berryPot->moistureMaybe != 0) {
        iVar3 -= (berryPot->moistureMaybe + iVar2 - 1) / iVar2;
        berryPot->moistureMaybe = 0;
    }

    if (berryPot->unk_A >= iVar3) {
        berryPot->unk_A -= iVar3;
        return;
    }

    berryPot->unk_A = 0;
}
#else
asm void ov16_022016F4(BERRY_POT *a0, UnkStruct_ov16_022014A0 *a1, u32 a2) {
    push {r3, r4, r5, r6, r7, lr}
    add r5, r0, #0
    ldrb r0, [r5, #1]
    add r7, r2, #0
    cmp r0, #5
    beq _0220175E
    add r0, r1, #0
    ldrb r1, [r5]
    ldrb r2, [r5, #0xb]
    bl ov16_02201554
    add r6, r0, #0
    ldrh r0, [r5, #4]
    mov r1, #0x3c
    str r0, [sp]
    add r0, r7, r0
    bl _s32_div_f
    add r4, r0, #0
    ldr r0, [sp]
    mov r1, #0x3c
    add r0, r7, r0
    bl _s32_div_f
    strh r1, [r5, #4]
    cmp r4, #0
    beq _0220175E
    ldrb r1, [r5, #9]
    add r0, r6, #0
    mul r0, r4
    cmp r1, r0
    blt _0220173A
    sub r0, r1, r0
    strb r0, [r5, #9]
    pop {r3, r4, r5, r6, r7, pc}
_0220173A:
    cmp r1, #0
    beq _0220174E
    sub r0, r6, #1
    add r0, r1, r0
    add r1, r6, #0
    bl _s32_div_f
    sub r4, r4, r0
    mov r0, #0
    strb r0, [r5, #9]
_0220174E:
    ldrb r0, [r5, #0xa]
    cmp r0, r4
    ble _0220175A
    sub r0, r0, r4
    strb r0, [r5, #0xa]
    pop {r3, r4, r5, r6, r7, pc}
_0220175A:
    mov r0, #0
    strb r0, [r5, #0xa]
_0220175E:
    pop {r3, r4, r5, r6, r7, pc}
}
#endif

void ov16_02201760(BERRY_POT *a0, UnkStruct_ov16_022014A0 *a1, u32 a2);
asm void ov16_02201760(BERRY_POT *a0, UnkStruct_ov16_022014A0 *a1, u32 a2) {
    push {r3, r4, r5, r6, r7, lr}
    add r4, r0, #0
    mov r0, #0
    add r6, r1, #0
    add r7, r2, #0
    str r0, [sp]
_0220176C:
    ldrb r1, [r4]
    cmp r1, #0
    beq _022017EE
    ldrb r0, [r4, #1]
    cmp r0, #0
    beq _022017EE
    ldrb r2, [r4, #0xb]
    add r0, r6, #0
    bl ov16_02201528
    add r5, r0, #0
    add r0, r4, #0
    bl ov16_02201598
    mul r0, r5
    cmp r7, r0
    blt _02201796
    add r0, r4, #0
    bl ov16_022014FC
    b _022017EE
_02201796:
    add r5, r7, #0
    b _022017E4
_0220179A:
    ldrh r2, [r4, #2]
    cmp r2, r5
    ble _022017B2
    add r0, r4, #0
    add r1, r6, #0
    add r2, r5, #0
    bl ov16_022016F4
    ldrh r0, [r4, #2]
    sub r0, r0, r5
    strh r0, [r4, #2]
    b _022017EE
_022017B2:
    add r0, r4, #0
    add r1, r6, #0
    bl ov16_022016F4
    add r0, r4, #0
    add r1, r6, #0
    bl ov16_02201688
    ldrh r0, [r4, #2]
    ldrb r1, [r4]
    ldrb r2, [r4, #0xb]
    sub r5, r5, r0
    add r0, r6, #0
    bl ov16_02201528
    strh r0, [r4, #2]
    ldrb r0, [r4, #1]
    cmp r0, #5
    bne _022017E4
    add r0, r4, #0
    bl ov16_02201578
    ldrh r1, [r4, #2]
    mul r0, r1
    strh r0, [r4, #2]
_022017E4:
    ldrb r0, [r4, #1]
    cmp r0, #0
    beq _022017EE
    cmp r5, #0
    bne _0220179A
_022017EE:
    ldr r0, [sp]
    add r4, #0xc
    add r0, r0, #1
    str r0, [sp]
    cmp r0, #4
    blt _0220176C
    pop {r3, r4, r5, r6, r7, pc}
}

void ov16_022017FC(struct GF_RTC_DateTime *dest, struct GF_RTC_DateTime src);
void ov16_022017FC(struct GF_RTC_DateTime *dest, struct GF_RTC_DateTime src) {
    dest->date = src.date;
    dest->time = src.time;
}

void ov16_02201820(struct GF_RTC_DateTime *datetime, RTCDate *date, RTCTime *time);
void ov16_02201820(struct GF_RTC_DateTime *datetime, RTCDate *date, RTCTime *time) {
    *date = datetime->date;
    *time = datetime->time;
}

NARC *ov16_02201840(HeapID heapId) {
    return NARC_New(NARC_a_0_6_6, heapId);
}

UnkStruct_a066 *ov16_0220184C(NARC *narc, s32 fileId, HeapID heapId) {
    return NARC_AllocAndReadWholeMember(narc, fileId, heapId);
}

void ov16_02201854(NARC *narc) {
    NARC_Delete(narc);
}

u16 ov16_0220185C(UnkStruct_a066 *unk, u32 attr) {
    switch (attr) {
        case 0:
            return unk->unk0;
        case 1:
            return unk->unk2;
        case 2:
            return unk->unk3;
        case 3:
            return unk->unk4;
        case 4:
            return unk->unk5;
        case 5:
            return unk->unk6;
        case 6:
            return unk->unk7;
        case 7:
            return unk->unk8;
        case 8:
            return unk->unk9;
        case 9:
            return unk->unkA;
        case 10:
            return unk->unkB;
        default:
            return 0;
    }
}

u16 ov16_022018B4(u16 berryId);
u16 ov16_022018B4(u16 berryId) {
    if (berryId == 0) {
        return ITEM_NONE;
    }

    return berryId + FIRST_BERRY_IDX - 1;
}

u16 ov16_022018C4(u16 itemId);
u16 ov16_022018C4(u16 itemId) {
    if (itemId == ITEM_NONE) {
        return 0;
    }

    return itemId - FIRST_BERRY_IDX + 1;
}

u16 ov16_022018D4(u16 mulchId);
u16 ov16_022018D4(u16 mulchId) {
    if (mulchId == 0) {
        return ITEM_NONE;
    }

    return mulchId + ITEM_GROWTH_MULCH - 1;
}

u32 ov16_022018E4(u16 itemId);
u32 ov16_022018E4(u16 itemId) {
    if (itemId == ITEM_NONE) {
        return 0;
    }

    return itemId - ITEM_GROWTH_MULCH + 1;
}

// total berry quantity
u16 ov16_022018F0(Bag *bag, HeapID heapId);
u16 ov16_022018F0(Bag *bag, HeapID heapId) {
    s32 i;
    u16 total = 0;
    for (total = 0, i = 0; i < NUM_BAG_BERRIES; i++) {
        total += Bag_GetQuantity(bag, FIRST_BERRY_IDX + i, heapId);
    }
    return total;
}

// total mulch quantity
u16 ov16_0220191C(Bag *bag, HeapID heapId);
u16 ov16_0220191C(Bag *bag, HeapID heapId) {
    s32 i;
    u16 total;
    for (total = 0, i = 0; i < 4; i++) {
        total += Bag_GetQuantity(bag, ITEM_GROWTH_MULCH + i, heapId);
    }
    return total;
}
