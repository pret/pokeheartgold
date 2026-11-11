	.include "macros.inc"
	.include "overlay_07.inc"
	.include "global.inc"

    .text

    thumb_func_start ov07_0223458C
ov07_0223458C: ; 0x0223458C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #0x48
	add r6, r0, #0
	bl Heap_Alloc
	add r4, r0, #0
	bne _022345A4
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_022345A4:
	bl ov07_0221C69C
	str r6, [r4]
	cmp r5, #0
	beq _022345B2
	ldr r0, [r5]
	str r0, [r4, #4]
_022345B2:
	mov r1, #0
	add r2, r4, #0
	add r0, r1, #0
_022345B8:
	add r1, r1, #1
	str r0, [r2, #8]
	add r2, r2, #4
	cmp r1, #0x10
	blt _022345B8
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_0223458C

	thumb_func_start ov07_022345C8
ov07_022345C8: ; 0x022345C8
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r4, #0
	add r3, r0, #0
_022345D0:
	ldr r2, [r3, #8]
	cmp r2, #0
	bne _022345F0
	add r4, r0, #0
	ldr r0, [r0]
	add r4, #8
	lsl r6, r5, #2
	bl ov07_02234658
	str r0, [r4, r6]
	ldr r0, [r4, r6]
	mov r1, #0
	str r1, [r0, #0x18]
	ldr r4, [r4, r6]
	str r5, [r4]
	b _022345F8
_022345F0:
	add r5, r5, #1
	add r3, r3, #4
	cmp r5, #0x10
	blt _022345D0
_022345F8:
	cmp r4, #0
	bne _02234600
	bl GF_AssertFail
_02234600:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_022345C8

	thumb_func_start ov07_02234604
ov07_02234604: ; 0x02234604
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_0223460C:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02234616
	bl Heap_Free
_02234616:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x10
	blt _0223460C
	add r0, r6, #0
	bl Heap_Free
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02234604

	thumb_func_start ov07_02234628
ov07_02234628: ; 0x02234628
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0223462E:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0223464C
	ldr r0, [r0, #0x10]
	bl ov07_0221FF2C
	ldr r1, [r5, #8]
	ldr r0, [r1, #0x20]
	cmp r0, #0
	beq _0223464C
	ldr r0, [r1, #0x18]
	cmp r0, #0
	beq _0223464C
	bl SysTask_Destroy
_0223464C:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x10
	blt _0223462E
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02234628

	thumb_func_start ov07_02234658
ov07_02234658: ; 0x02234658
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #0x24
	add r5, r0, #0
	bl Heap_Alloc
	add r4, r0, #0
	bne _02234670
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_02234670:
	str r5, [r4, #4]
	ldr r1, [r6]
	ldr r0, [r6, #4]
	str r1, [r4, #8]
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	bl ov07_02234718
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	mov r2, #1
	bl ov07_0221FE88
	str r0, [r4, #0x10]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02234658

	thumb_func_start ov07_02234694
ov07_02234694: ; 0x02234694
	push {r4, lr}
	add r4, r0, #0
	mov r1, #1
	str r1, [r4, #0x20]
	ldr r1, _022346B4 ; =ov07_02234710
	bl ov07_022346E4
	mov r2, #0xfa
	ldr r0, _022346B8 ; =ov07_022346C0
	add r1, r4, #0
	lsl r2, r2, #2
	bl SysTask_CreateOnMainQueue
	str r0, [r4, #0x18]
	pop {r4, pc}
	nop
_022346B4: .word ov07_02234710
_022346B8: .word ov07_022346C0
	thumb_func_end ov07_02234694

	thumb_func_start ov07_022346BC
ov07_022346BC: ; 0x022346BC
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end ov07_022346BC

	thumb_func_start ov07_022346C0
ov07_022346C0: ; 0x022346C0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_020154B0
	cmp r0, #0
	bne _022346E0
	mov r0, #0
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	bl ov07_0221FF2C
	add r0, r5, #0
	bl SysTask_Destroy
_022346E0:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_022346C0

	thumb_func_start ov07_022346E4
ov07_022346E4: ; 0x022346E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x1c]
	add r6, r1, #0
	mov r4, #0
	cmp r0, #0
	ble _02234706
_022346F2:
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_02015494
	ldr r0, [r5, #0x1c]
	add r4, r4, #1
	cmp r4, r0
	blt _022346F2
_02234706:
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0xc]
	bl sub_02015528
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_022346E4

	thumb_func_start ov07_02234710
ov07_02234710: ; 0x02234710
	ldr r3, _02234714 ; =sub_02015504
	bx r3
	.balign 4, 0
_02234714: .word sub_02015504
	thumb_func_end ov07_02234710

	thumb_func_start ov07_02234718
ov07_02234718: ; 0x02234718
	push {r3, r4, r5, lr}
	sub sp, #0x58
	ldr r4, _02234748 ; =ov07_02237784
	add r5, r0, #0
	add r3, sp, #0
	mov r2, #0xb
_02234724:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02234724
	sub r0, r5, #5
	cmp r0, #0x16
	blo _0223473C
	bl GF_AssertFail
	add sp, #0x58
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223473C:
	lsl r1, r0, #2
	add r0, sp, #0
	ldr r0, [r0, r1]
	add sp, #0x58
	pop {r3, r4, r5, pc}
	nop
_02234748: .word ov07_02237784
	thumb_func_end ov07_02234718

    .rodata

ov07_02237784: ; 0x02237784
	.byte 0x05, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
