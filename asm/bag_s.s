#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"
	.public Bag_GetItemPocket
	.public Pocket_GetItemSlotForAdd
	.public Bag_GetItemSlotForAdd
	.public Pocket_GetItemSlotForRemove
	.public Bag_GetItemSlotForRemove
	.public SwapItemSlots

	.text

	thumb_func_start CreateBagView
CreateBagView: ; 0x02078644
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	lsl r0, r2, #0x18
	add r7, r1, #0
	lsr r0, r0, #0x18
	bl BagView_New
	add r6, r0, #0
	ldrb r0, [r7]
	mov r4, #0
	cmp r0, #0xff
	beq _02078720
_0207865C:
	ldrb r0, [r7, r4]
	cmp r0, #7
	bhi _02078718
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207866E: ; jump table
	.short _02078692 - _0207866E - 2 ; case 0
	.short _020786B6 - _0207866E - 2 ; case 1
	.short _020786CA - _0207866E - 2 ; case 2
	.short _02078706 - _0207866E - 2 ; case 3
	.short _020786A2 - _0207866E - 2 ; case 4
	.short _020786F2 - _0207866E - 2 ; case 5
	.short _020786DE - _0207866E - 2 ; case 6
	.short _0207867E - _0207866E - 2 ; case 7
_0207867E:
	mov r1, #0xa5
	lsl r1, r1, #2
	lsl r3, r4, #0x18
	add r0, r6, #0
	add r1, r5, r1
	mov r2, #7
	lsr r3, r3, #0x18
	bl BagView_SetItem
	b _02078718
_02078692:
	lsl r3, r4, #0x18
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #0
	lsr r3, r3, #0x18
	bl BagView_SetItem
	b _02078718
_020786A2:
	mov r1, #0x17
	lsl r1, r1, #6
	lsl r3, r4, #0x18
	add r0, r6, #0
	add r1, r5, r1
	mov r2, #4
	lsr r3, r3, #0x18
	bl BagView_SetItem
	b _02078718
_020786B6:
	mov r1, #0x52
	lsl r1, r1, #4
	lsl r3, r4, #0x18
	add r0, r6, #0
	add r1, r5, r1
	mov r2, #1
	lsr r3, r3, #0x18
	bl BagView_SetItem
	b _02078718
_020786CA:
	mov r1, #0x1b
	lsl r1, r1, #6
	lsl r3, r4, #0x18
	add r0, r6, #0
	add r1, r5, r1
	mov r2, #2
	lsr r3, r3, #0x18
	bl BagView_SetItem
	b _02078718
_020786DE:
	mov r1, #0x72
	lsl r1, r1, #4
	lsl r3, r4, #0x18
	add r0, r6, #0
	add r1, r5, r1
	mov r2, #6
	lsr r3, r3, #0x18
	bl BagView_SetItem
	b _02078718
_020786F2:
	mov r1, #0x4f
	lsl r1, r1, #4
	lsl r3, r4, #0x18
	add r0, r6, #0
	add r1, r5, r1
	mov r2, #5
	lsr r3, r3, #0x18
	bl BagView_SetItem
	b _02078718
_02078706:
	mov r1, #0xd7
	lsl r1, r1, #2
	lsl r3, r4, #0x18
	add r0, r6, #0
	add r1, r5, r1
	mov r2, #3
	lsr r3, r3, #0x18
	bl BagView_SetItem
_02078718:
	add r4, r4, #1
	ldrb r0, [r7, r4]
	cmp r0, #0xff
	bne _0207865C
_02078720:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end CreateBagView

	thumb_func_start Bag_GetPocketSlotN
Bag_GetPocketSlotN: ; 0x02078724
	cmp r1, #7
	bhi _0207878C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02078734: ; jump table
	.short _0207874E - _02078734 - 2 ; case 0
	.short _0207875C - _02078734 - 2 ; case 1
	.short _02078766 - _02078734 - 2 ; case 2
	.short _02078784 - _02078734 - 2 ; case 3
	.short _02078752 - _02078734 - 2 ; case 4
	.short _0207877A - _02078734 - 2 ; case 5
	.short _02078770 - _02078734 - 2 ; case 6
	.short _02078744 - _02078734 - 2 ; case 7
_02078744:
	mov r1, #0xa5
	lsl r1, r1, #2
	add r0, r0, r1
	mov r3, #0x32
	b _0207878C
_0207874E:
	mov r3, #0xa5
	b _0207878C
_02078752:
	mov r1, #0x17
	lsl r1, r1, #6
	add r0, r0, r1
	mov r3, #0x40
	b _0207878C
_0207875C:
	mov r1, #0x52
	lsl r1, r1, #4
	add r0, r0, r1
	mov r3, #0x28
	b _0207878C
_02078766:
	mov r1, #0x1b
	lsl r1, r1, #6
	add r0, r0, r1
	mov r3, #0x18
	b _0207878C
_02078770:
	mov r1, #0x72
	lsl r1, r1, #4
	add r0, r0, r1
	mov r3, #0x1e
	b _0207878C
_0207877A:
	mov r1, #0x4f
	lsl r1, r1, #4
	add r0, r0, r1
	mov r3, #0xc
	b _0207878C
_02078784:
	mov r1, #0xd7
	lsl r1, r1, #2
	add r0, r0, r1
	mov r3, #0x65
_0207878C:
	cmp r2, r3
	blo _02078794
	mov r0, #0
	bx lr
_02078794:
	lsl r1, r2, #2
	add r0, r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end Bag_GetPocketSlotN

	thumb_func_start Sav2_Bag_get
Sav2_Bag_get: ; 0x0207879C
	ldr r3, _020787A4 ; =SavArray_get
	mov r1, #3
	bx r3
	nop
_020787A4: .word SavArray_get
	thumb_func_end Sav2_Bag_get

	thumb_func_start sub_020787A8
sub_020787A8: ; 0x020787A8
	push {r4, lr}
	mov r1, #0x24
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x24
	bl MIi_CpuClear16
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_020787A8

	thumb_func_start sub_020787C0
sub_020787C0: ; 0x020787C0
	push {r3, r4}
	add r4, r0, r1
	ldrb r4, [r4, #8]
	strb r4, [r2]
	ldrb r0, [r0, r1]
	strb r0, [r3]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_020787C0

	thumb_func_start sub_020787D0
sub_020787D0: ; 0x020787D0
	ldrh r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_020787D0

	thumb_func_start sub_020787D4
sub_020787D4: ; 0x020787D4
	push {r3, r4}
	add r4, r0, r1
	strb r2, [r4, #8]
	strb r3, [r0, r1]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_020787D4

	thumb_func_start sub_020787E0
sub_020787E0: ; 0x020787E0
	strh r1, [r0, #0x10]
	bx lr
	thumb_func_end sub_020787E0

	thumb_func_start sub_020787E4
sub_020787E4: ; 0x020787E4
	add r1, r0, r1
	ldrb r0, [r1, #0x19]
	strb r0, [r2]
	ldrb r0, [r1, #0x14]
	strb r0, [r3]
	bx lr
	thumb_func_end sub_020787E4

	thumb_func_start sub_020787F0
sub_020787F0: ; 0x020787F0
	ldrh r0, [r0, #0x1e]
	bx lr
	thumb_func_end sub_020787F0

	thumb_func_start sub_020787F4
sub_020787F4: ; 0x020787F4
	ldrh r0, [r0, #0x20]
	bx lr
	thumb_func_end sub_020787F4

	thumb_func_start sub_020787F8
sub_020787F8: ; 0x020787F8
	ldrh r0, [r0, #0x22]
	bx lr
	thumb_func_end sub_020787F8

	thumb_func_start sub_020787FC
sub_020787FC: ; 0x020787FC
	add r0, r0, r1
	strb r2, [r0, #0x19]
	strb r3, [r0, #0x14]
	bx lr
	thumb_func_end sub_020787FC

	thumb_func_start sub_02078804
sub_02078804: ; 0x02078804
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
_0207880C:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r6, #0
	bl sub_020787FC
	add r4, r4, #1
	cmp r4, #5
	blo _0207880C
	add r0, r5, #0
	mov r1, #0
	bl sub_02078830
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02078804

	thumb_func_start sub_02078828
sub_02078828: ; 0x02078828
	strh r1, [r0, #0x1e]
	strh r2, [r0, #0x20]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02078828

	thumb_func_start sub_02078830
sub_02078830: ; 0x02078830
	strh r1, [r0, #0x22]
	bx lr
	thumb_func_end sub_02078830
