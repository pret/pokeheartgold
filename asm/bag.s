#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start Sav2_Bag_sizeof
Sav2_Bag_sizeof: ; 0x02078180
	ldr r0, _02078184 ; =0x0000079C
	bx lr
	.balign 4, 0
_02078184: .word 0x0000079C
	thumb_func_end Sav2_Bag_sizeof

	thumb_func_start Sav2_Bag_new
Sav2_Bag_new: ; 0x02078188
	push {r4, lr}
	ldr r1, _0207819C ; =0x0000079C
	bl AllocFromHeap
	add r4, r0, #0
	bl Sav2_Bag_init
	add r0, r4, #0
	pop {r4, pc}
	nop
_0207819C: .word 0x0000079C
	thumb_func_end Sav2_Bag_new

	thumb_func_start Sav2_Bag_init
Sav2_Bag_init: ; 0x020781A0
	ldr r3, _020781AC ; =MIi_CpuClear16
	add r1, r0, #0
	mov r0, #0
	ldr r2, _020781B0 ; =0x0000079C
	bx r3
	nop
_020781AC: .word MIi_CpuClear16
_020781B0: .word 0x0000079C
	thumb_func_end Sav2_Bag_init

	thumb_func_start Sav2_Bag_copy
Sav2_Bag_copy: ; 0x020781B4
	ldr r3, _020781BC ; =MI_CpuCopy8
	ldr r2, _020781C0 ; =0x0000079C
	bx r3
	nop
_020781BC: .word MI_CpuCopy8
_020781C0: .word 0x0000079C
	thumb_func_end Sav2_Bag_copy

	thumb_func_start Bag_GetRegisteredItemSlot1
Bag_GetRegisteredItemSlot1: ; 0x020781C4
	ldr r1, _020781CC ; =0x00000798
	ldrh r0, [r0, r1]
	bx lr
	nop
_020781CC: .word 0x00000798
	thumb_func_end Bag_GetRegisteredItemSlot1

	thumb_func_start Bag_GetRegisteredItemSlot2
Bag_GetRegisteredItemSlot2: ; 0x020781D0
	ldr r1, _020781D8 ; =0x0000079A
	ldrh r0, [r0, r1]
	bx lr
	nop
_020781D8: .word 0x0000079A
	thumb_func_end Bag_GetRegisteredItemSlot2

	thumb_func_start Bag_TryRegisterItem
Bag_TryRegisterItem: ; 0x020781DC
	push {r3, r4}
	ldr r3, _02078204 ; =0x00000798
	mov r4, #0
	ldrh r2, [r0, r3]
	cmp r2, #0
	bne _020781EE
	strh r1, [r0, r3]
	mov r4, #1
	b _020781FC
_020781EE:
	add r2, r3, #2
	ldrh r2, [r0, r2]
	cmp r2, #0
	bne _020781FC
	add r2, r3, #2
	strh r1, [r0, r2]
	mov r4, #2
_020781FC:
	add r0, r4, #0
	pop {r3, r4}
	bx lr
	nop
_02078204: .word 0x00000798
	thumb_func_end Bag_TryRegisterItem

	thumb_func_start Bag_UnregisterItem
Bag_UnregisterItem: ; 0x02078208
	push {r3, r4}
	ldr r3, _0207823C ; =0x0000079A
	ldrh r4, [r0, r3]
	cmp r4, r1
	bne _0207821A
	mov r1, #0
	strh r1, [r0, r3]
	pop {r3, r4}
	bx lr
_0207821A:
	sub r2, r3, #2
	ldrh r2, [r0, r2]
	cmp r2, r1
	bne _02078238
	cmp r4, #0
	beq _02078232
	sub r1, r3, #2
	strh r4, [r0, r1]
	mov r1, #0
	strh r1, [r0, r3]
	pop {r3, r4}
	bx lr
_02078232:
	mov r2, #0
	sub r1, r3, #2
	strh r2, [r0, r1]
_02078238:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0207823C: .word 0x0000079A
	thumb_func_end Bag_UnregisterItem

	thumb_func_start Bag_GetItemPocket
Bag_GetItemPocket: ; 0x02078240
	push {r4, r5, r6, lr}
	add r5, r2, #0
	add r4, r0, #0
	add r0, r1, #0
	ldr r2, [sp, #0x10]
	mov r1, #5
	add r6, r3, #0
	bl GetItemAttr
	cmp r0, #7
	bhi _020782DA
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02078262: ; jump table
	.short _02078280 - _02078262 - 2 ; case 0
	.short _02078296 - _02078262 - 2 ; case 1
	.short _020782A4 - _02078262 - 2 ; case 2
	.short _020782CE - _02078262 - 2 ; case 3
	.short _02078288 - _02078262 - 2 ; case 4
	.short _020782C0 - _02078262 - 2 ; case 5
	.short _020782B2 - _02078262 - 2 ; case 6
	.short _02078272 - _02078262 - 2 ; case 7
_02078272:
	mov r1, #0xa5
	lsl r1, r1, #2
	add r1, r4, r1
	str r1, [r5]
	mov r1, #0x32
	str r1, [r6]
	pop {r4, r5, r6, pc}
_02078280:
	str r4, [r5]
	mov r1, #0xa5
	str r1, [r6]
	pop {r4, r5, r6, pc}
_02078288:
	mov r1, #0x17
	lsl r1, r1, #6
	add r1, r4, r1
	str r1, [r5]
	mov r1, #0x40
	str r1, [r6]
	pop {r4, r5, r6, pc}
_02078296:
	mov r1, #0x52
	lsl r1, r1, #4
	add r1, r4, r1
	str r1, [r5]
	mov r1, #0x28
	str r1, [r6]
	pop {r4, r5, r6, pc}
_020782A4:
	mov r1, #0x1b
	lsl r1, r1, #6
	add r1, r4, r1
	str r1, [r5]
	mov r1, #0x18
	str r1, [r6]
	pop {r4, r5, r6, pc}
_020782B2:
	mov r1, #0x72
	lsl r1, r1, #4
	add r1, r4, r1
	str r1, [r5]
	mov r1, #0x1e
	str r1, [r6]
	pop {r4, r5, r6, pc}
_020782C0:
	mov r1, #0x4f
	lsl r1, r1, #4
	add r1, r4, r1
	str r1, [r5]
	mov r1, #0xc
	str r1, [r6]
	pop {r4, r5, r6, pc}
_020782CE:
	mov r1, #0xd7
	lsl r1, r1, #2
	add r1, r4, r1
	str r1, [r5]
	mov r1, #0x65
	str r1, [r6]
_020782DA:
	pop {r4, r5, r6, pc}
	thumb_func_end Bag_GetItemPocket

	thumb_func_start Pocket_GetItemSlotForAdd
Pocket_GetItemSlotForAdd: ; 0x020782DC
	push {r4, r5, r6, r7}
	add r5, r1, #0
	mov r1, #0
	add r7, r0, #0
	add r4, r2, #0
	mov ip, r3
	mvn r1, r1
	mov r0, #0
	cmp r5, #0
	bls _0207832A
	add r2, r7, #0
	add r3, r1, #0
_020782F4:
	ldrh r6, [r2]
	cmp r4, r6
	bne _02078312
	lsl r0, r0, #2
	add r0, r7, r0
	ldrh r2, [r0, #2]
	mov r1, ip
	add r2, r1, r2
	add r1, sp, #0
	ldrh r1, [r1, #0x10]
	cmp r2, r1
	ble _0207833C
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_02078312:
	cmp r1, r3
	bne _02078322
	cmp r6, #0
	bne _02078322
	ldrh r6, [r2, #2]
	cmp r6, #0
	bne _02078322
	add r1, r0, #0
_02078322:
	add r0, r0, #1
	add r2, r2, #4
	cmp r0, r5
	blo _020782F4
_0207832A:
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02078338
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_02078338:
	lsl r0, r1, #2
	add r0, r7, r0
_0207833C:
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end Pocket_GetItemSlotForAdd

	thumb_func_start Bag_GetItemSlotForAdd
Bag_GetItemSlotForAdd: ; 0x02078340
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	str r3, [sp]
	add r2, sp, #8
	add r3, sp, #4
	add r5, r1, #0
	bl Bag_GetItemPocket
	cmp r0, #3
	bne _0207836A
	mov r0, #0x63
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r2, r5, #0
	add r3, r4, #0
	bl Pocket_GetItemSlotForAdd
	add sp, #0xc
	pop {r4, r5, pc}
_0207836A:
	ldr r0, _02078380 ; =0x000003E7
	add r2, r5, #0
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r3, r4, #0
	bl Pocket_GetItemSlotForAdd
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02078380: .word 0x000003E7
	thumb_func_end Bag_GetItemSlotForAdd

	thumb_func_start Bag_HasSpaceForItem
Bag_HasSpaceForItem: ; 0x02078384
	push {r3, lr}
	bl Bag_GetItemSlotForAdd
	cmp r0, #0
	beq _02078392
	mov r0, #1
	pop {r3, pc}
_02078392:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end Bag_HasSpaceForItem

	thumb_func_start Bag_AddItem
Bag_AddItem: ; 0x02078398
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl Bag_GetItemSlotForAdd
	str r0, [sp, #8]
	cmp r0, #0
	bne _020783B4
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020783B4:
	strh r5, [r0]
	ldr r1, [sp, #8]
	add r2, sp, #8
	ldrh r0, [r1, #2]
	add r3, sp, #4
	add r0, r0, r4
	strh r0, [r1, #2]
	add r0, r7, #0
	add r1, r5, #0
	str r6, [sp]
	bl Bag_GetItemPocket
	sub r0, r0, #3
	cmp r0, #1
	bhi _020783DA
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl SortPocket
_020783DA:
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end Bag_AddItem

	thumb_func_start Pocket_GetItemSlotForRemove
Pocket_GetItemSlotForRemove: ; 0x020783E0
	push {r3, r4, r5, r6}
	mov r5, #0
	cmp r1, #0
	bls _02078408
	add r6, r0, #0
_020783EA:
	ldrh r4, [r6]
	cmp r2, r4
	bne _02078400
	lsl r1, r5, #2
	add r0, r0, r1
	ldrh r1, [r0, #2]
	cmp r1, r3
	bhs _0207840A
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
_02078400:
	add r5, r5, #1
	add r6, r6, #4
	cmp r5, r1
	blo _020783EA
_02078408:
	mov r0, #0
_0207840A:
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end Pocket_GetItemSlotForRemove

	thumb_func_start Bag_GetItemSlotForRemove
Bag_GetItemSlotForRemove: ; 0x02078410
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	str r3, [sp]
	add r2, sp, #8
	add r3, sp, #4
	add r5, r1, #0
	bl Bag_GetItemPocket
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r2, r5, #0
	add r3, r4, #0
	bl Pocket_GetItemSlotForRemove
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end Bag_GetItemSlotForRemove

	thumb_func_start Bag_TakeItem
Bag_TakeItem: ; 0x02078434
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl Bag_GetItemSlotForRemove
	str r0, [sp, #8]
	cmp r0, #0
	bne _02078450
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02078450:
	ldrh r1, [r0, #2]
	sub r1, r1, r5
	strh r1, [r0, #2]
	ldr r1, [sp, #8]
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _02078462
	mov r0, #0
	strh r0, [r1]
_02078462:
	str r4, [sp]
	add r0, r6, #0
	add r1, r7, #0
	add r2, sp, #8
	add r3, sp, #4
	bl Bag_GetItemPocket
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl PocketCompaction
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end Bag_TakeItem

	thumb_func_start Pocket_TakeItem
Pocket_TakeItem: ; 0x02078480
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r3, #0
	bl Pocket_GetItemSlotForRemove
	cmp r0, #0
	bne _02078494
	mov r0, #0
	pop {r4, r5, r6, pc}
_02078494:
	ldrh r1, [r0, #2]
	sub r1, r1, r4
	strh r1, [r0, #2]
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _020784A4
	mov r1, #0
	strh r1, [r0]
_020784A4:
	add r0, r5, #0
	add r1, r6, #0
	bl PocketCompaction
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end Pocket_TakeItem

	thumb_func_start Bag_HasItem
Bag_HasItem: ; 0x020784B0
	push {r3, lr}
	bl Bag_GetItemSlotForRemove
	cmp r0, #0
	beq _020784BE
	mov r0, #1
	pop {r3, pc}
_020784BE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end Bag_HasItem

	thumb_func_start Bag_PocketNotEmpty
Bag_PocketNotEmpty: ; 0x020784C4
	cmp r1, #7
	bhi _0207852E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020784D4: ; jump table
	.short _020784EE - _020784D4 - 2 ; case 0
	.short _020784FC - _020784D4 - 2 ; case 1
	.short _02078506 - _020784D4 - 2 ; case 2
	.short _02078524 - _020784D4 - 2 ; case 3
	.short _020784F2 - _020784D4 - 2 ; case 4
	.short _0207851A - _020784D4 - 2 ; case 5
	.short _02078510 - _020784D4 - 2 ; case 6
	.short _020784E4 - _020784D4 - 2 ; case 7
_020784E4:
	mov r1, #0xa5
	lsl r1, r1, #2
	add r0, r0, r1
	mov r2, #0x32
	b _02078532
_020784EE:
	mov r2, #0xa5
	b _02078532
_020784F2:
	mov r1, #0x17
	lsl r1, r1, #6
	add r0, r0, r1
	mov r2, #0x40
	b _02078532
_020784FC:
	mov r1, #0x52
	lsl r1, r1, #4
	add r0, r0, r1
	mov r2, #0x28
	b _02078532
_02078506:
	mov r1, #0x1b
	lsl r1, r1, #6
	add r0, r0, r1
	mov r2, #0x18
	b _02078532
_02078510:
	mov r1, #0x72
	lsl r1, r1, #4
	add r0, r0, r1
	mov r2, #0x1e
	b _02078532
_0207851A:
	mov r1, #0x4f
	lsl r1, r1, #4
	add r0, r0, r1
	mov r2, #0xc
	b _02078532
_02078524:
	mov r1, #0xd7
	lsl r1, r1, #2
	add r0, r0, r1
	mov r2, #0x65
	b _02078532
_0207852E:
	mov r0, #0
	bx lr
_02078532:
	mov r3, #0
	cmp r2, #0
	bls _0207854A
_02078538:
	ldrh r1, [r0]
	cmp r1, #0
	beq _02078542
	mov r0, #1
	bx lr
_02078542:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, r2
	blo _02078538
_0207854A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end Bag_PocketNotEmpty

	thumb_func_start Bag_GetQuantity
Bag_GetQuantity: ; 0x02078550
	push {r3, lr}
	add r3, r2, #0
	mov r2, #1
	bl Bag_GetItemSlotForRemove
	cmp r0, #0
	bne _02078562
	mov r0, #0
	pop {r3, pc}
_02078562:
	ldrh r0, [r0, #2]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end Bag_GetQuantity

	thumb_func_start Pocket_GetQuantity
Pocket_GetQuantity: ; 0x02078568
	push {r3, lr}
	mov r3, #1
	bl Pocket_GetItemSlotForRemove
	cmp r0, #0
	bne _02078578
	mov r0, #0
	pop {r3, pc}
_02078578:
	ldrh r0, [r0, #2]
	pop {r3, pc}
	thumb_func_end Pocket_GetQuantity

	thumb_func_start SwapItemSlots
SwapItemSlots: ; 0x0207857C
	push {r3}
	sub sp, #4
	ldrh r3, [r0]
	add r2, sp, #0
	strh r3, [r2]
	ldrh r3, [r0, #2]
	strh r3, [r2, #2]
	ldrh r3, [r1]
	strh r3, [r0]
	ldrh r3, [r1, #2]
	strh r3, [r0, #2]
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	add sp, #4
	pop {r3}
	bx lr
	thumb_func_end SwapItemSlots

	thumb_func_start PocketCompaction
PocketCompaction: ; 0x020785A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r0, #0
	add r7, r1, #0
	str r0, [sp, #4]
	sub r0, r7, #1
	str r0, [sp, #8]
	beq _020785E6
	ldr r4, [sp]
_020785B4:
	ldr r0, [sp, #4]
	add r6, r0, #1
	cmp r6, r7
	bhs _020785D8
	ldr r0, [sp]
	lsl r1, r6, #2
	add r5, r0, r1
_020785C2:
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _020785D0
	add r0, r4, #0
	add r1, r5, #0
	bl SwapItemSlots
_020785D0:
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r7
	blo _020785C2
_020785D8:
	ldr r0, [sp, #4]
	add r4, r4, #4
	add r1, r0, #1
	ldr r0, [sp, #8]
	str r1, [sp, #4]
	cmp r1, r0
	blo _020785B4
_020785E6:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PocketCompaction

	thumb_func_start SortPocket
SortPocket: ; 0x020785EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r0, #0
	add r7, r1, #0
	str r0, [sp, #4]
	sub r0, r7, #1
	str r0, [sp, #8]
	beq _02078640
	ldr r4, [sp]
_02078600:
	ldr r0, [sp, #4]
	add r6, r0, #1
	cmp r6, r7
	bhs _02078632
	ldr r0, [sp]
	lsl r1, r6, #2
	add r5, r0, r1
_0207860E:
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02078622
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _0207862A
	ldrh r1, [r4]
	ldrh r0, [r5]
	cmp r1, r0
	bls _0207862A
_02078622:
	add r0, r4, #0
	add r1, r5, #0
	bl SwapItemSlots
_0207862A:
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r7
	blo _0207860E
_02078632:
	ldr r0, [sp, #4]
	add r4, r4, #4
	add r1, r0, #1
	ldr r0, [sp, #8]
	str r1, [sp, #4]
	cmp r1, r0
	blo _02078600
_02078640:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end SortPocket

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
