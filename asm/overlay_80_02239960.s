	.include "asm/macros.inc"
	.include "overlay_80_02239960.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_02239960
ov80_02239960: ; 0x02239960
	push {r3, r4, r5, lr}
	mov r1, #0x24
	add r5, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x24
	bl MI_CpuFill8
	strh r5, [r4, #0x20]
	bl sub_02014DA0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02239960

	thumb_func_start ov80_02239980
ov80_02239980: ; 0x02239980
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_02239988:
	ldr r0, [r5]
	cmp r0, #0
	beq _02239992
	bl ov80_02239A98
_02239992:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _02239988
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_02239980

	thumb_func_start ov80_022399A4
ov80_022399A4: ; 0x022399A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	lsl r6, r1, #2
	ldr r0, [r5, r6]
	add r7, r2, #0
	str r3, [sp, #8]
	cmp r0, #0
	beq _022399BA
	bl GF_AssertFail
_022399BA:
	ldrh r0, [r5, #0x20]
	mov r1, #0x12
	lsl r1, r1, #0xa
	bl AllocFromHeap
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	ldrh r0, [r5, #0x20]
	mov r3, #0x12
	ldr r1, _02239A14 ; =ov80_02239AD4
	str r0, [sp, #4]
	ldr r0, _02239A18 ; =ov80_02239AB0
	lsl r3, r3, #0xa
	bl sub_02014DB4
	add r4, r0, #0
	bl sub_02015524
	add r2, r0, #0
	mov r0, #1
	mov r1, #0xe1
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl Camera_SetPerspectiveClippingPlane
	ldr r1, [sp, #8]
	add r0, r4, #0
	bl sub_02015528
	ldrh r2, [r5, #0x20]
	mov r0, #0xbc
	add r1, r7, #0
	bl sub_02015264
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0xa
	mov r3, #1
	bl sub_0201526C
	str r4, [r5, r6]
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02239A14: .word ov80_02239AD4
_02239A18: .word ov80_02239AB0
	thumb_func_end ov80_022399A4

	thumb_func_start ov80_02239A1C
ov80_02239A1C: ; 0x02239A1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	lsl r4, r1, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _02239A2C
	bl GF_AssertFail
_02239A2C:
	ldr r0, [r5, r4]
	bl ov80_02239A98
	mov r0, #0
	str r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02239A1C

	thumb_func_start ov80_02239A38
ov80_02239A38: ; 0x02239A38
	push {r3, lr}
	bl Thunk_G3X_Reset
	bl sub_02015420
	cmp r0, #0
	bne _02239A4A
	mov r0, #0
	pop {r3, pc}
_02239A4A:
	bl sub_0201543C
	cmp r0, #0
	ble _02239A56
	bl Thunk_G3X_Reset
_02239A56:
	bl sub_02015460
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02239A38

	thumb_func_start ov80_02239A60
ov80_02239A60: ; 0x02239A60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	lsl r4, r1, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _02239A70
	bl GF_AssertFail
_02239A70:
	ldr r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02239A60

	thumb_func_start ov80_02239A74
ov80_02239A74: ; 0x02239A74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_02239A7A:
	ldr r0, [r5]
	cmp r0, #0
	beq _02239A8C
	bl sub_020154B0
	cmp r0, #0
	ble _02239A8C
	mov r0, #0
	pop {r3, r4, r5, pc}
_02239A8C:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _02239A7A
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02239A74

	thumb_func_start ov80_02239A98
ov80_02239A98: ; 0x02239A98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020154D0
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02014EBC
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02239A98

	thumb_func_start ov80_02239AB0
ov80_02239AB0: ; 0x02239AB0
	push {r4, lr}
	ldr r3, _02239AD0 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bne _02239AC2
	bl GF_AssertFail
_02239AC2:
	add r0, r4, #0
	bl sub_02015354
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_02239AD0: .word NNS_GfdDefaultFuncAllocTexVram
	thumb_func_end ov80_02239AB0

	thumb_func_start ov80_02239AD4
ov80_02239AD4: ; 0x02239AD4
	push {r4, lr}
	ldr r3, _02239AF4 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r2, #1
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bne _02239AE6
	bl GF_AssertFail
_02239AE6:
	add r0, r4, #0
	bl sub_02015394
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_02239AF4: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov80_02239AD4
