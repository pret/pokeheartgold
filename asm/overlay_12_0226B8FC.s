	.include "asm/macros.inc"
	.include "overlay_12_0226B8FC.inc"
	.include "global.inc"

	.text

    thumb_func_start ov12_0226B8FC
ov12_0226B8FC: ; 0x0226B8FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #8
	add r1, r3, #0
	add r7, r2, #0
	bl NARC_New
	add r6, r0, #0
	str r6, [sp]
	mov r0, #0x50
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x34]
	mov r1, #3
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r5, #0
	add r3, r4, #0
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #0xfa
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x38]
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #0xfb
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #0xfc
	bl sub_0200D71C
	add r0, r6, #0
	bl NARC_Delete
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0226B8FC

	thumb_func_start ov12_0226B97C
ov12_0226B97C: ; 0x0226B97C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0200D958
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0200D968
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0200D978
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	bl sub_0200D988
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0226B97C

	thumb_func_start ov12_0226B9A4
ov12_0226B9A4: ; 0x0226B9A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r3, #0
	mov ip, r2
	ldr r3, _0226BA1C ; =ov12_0226EBA0
	add r6, r0, #0
	add r7, r1, #0
	add r2, sp, #4
	mov r4, #6
_0226B9B6:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r4, r4, #1
	bne _0226B9B6
	ldr r0, [r3]
	mov r1, #0x18
	str r0, [r2]
	ldr r0, [sp, #0x50]
	str r5, [sp, #0x18]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x54]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x58]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x5c]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x60]
	str r0, [sp, #0x30]
	mov r0, ip
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x18
	str r0, [sp]
	bl MI_CpuFill8
	ldr r5, [sp]
	mov r4, #0
_0226B9EE:
	add r0, r6, #0
	add r1, r7, #0
	add r2, sp, #4
	bl sub_0200D734
	mov r1, #0
	stmia r5!, {r0}
	bl sub_0200DCE8
	add r4, r4, #1
	cmp r4, #5
	blt _0226B9EE
	ldr r0, _0226BA20 ; =ov12_0226BB90
	ldr r1, [sp]
	ldr r2, _0226BA24 ; =0x00009C40
	bl CreateSysTask
	ldr r1, [sp]
	str r0, [r1, #0x14]
	add r0, r1, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226BA1C: .word ov12_0226EBA0
_0226BA20: .word ov12_0226BB90
_0226BA24: .word 0x00009C40
	thumb_func_end ov12_0226B9A4

	thumb_func_start ov12_0226BA28
ov12_0226BA28: ; 0x0226BA28
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_0226BA30:
	ldr r0, [r5]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _0226BA30
	ldr r0, [r6, #0x14]
	bl DestroySysTask
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0226BA28

	thumb_func_start ov12_0226BA4C
ov12_0226BA4C: ; 0x0226BA4C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r4, [sp, #0x24]
	add r6, r3, #0
	ldr r0, [r5]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	add r3, r4, #0
	bl sub_0200DDF4
	ldr r2, [sp, #0x10]
	lsl r1, r6, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r5, #4]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	add r3, r4, #0
	bl sub_0200DDF4
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r5, #8]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	add r3, r4, #0
	bl sub_0200DDF4
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r5, #0xc]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	add r3, r4, #0
	bl sub_0200DDF4
	ldr r0, [r5]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r5, #4]
	mov r1, #1
	bl sub_0200DC4C
	ldr r0, [r5, #8]
	mov r1, #2
	bl sub_0200DC4C
	ldr r0, [r5, #0xc]
	mov r1, #3
	bl sub_0200DC4C
	mov r4, #0
	mov r6, #1
_0226BAC2:
	ldr r0, [r5]
	add r1, r6, #0
	bl sub_0200DCE8
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0226BAC2
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0226BA4C

	thumb_func_start ov12_0226BAD4
ov12_0226BAD4: ; 0x0226BAD4
	push {r4, lr}
	sub sp, #0x18
	ldr r4, [sp, #0x20]
	str r4, [sp]
	ldr r4, [sp, #0x24]
	str r4, [sp, #4]
	ldr r4, [sp, #0x28]
	str r4, [sp, #8]
	ldr r4, [sp, #0x2c]
	str r4, [sp, #0xc]
	ldr r4, [sp, #0x30]
	str r4, [sp, #0x10]
	mov r4, #3
	lsl r4, r4, #0x12
	str r4, [sp, #0x14]
	bl ov12_0226BA4C
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0226BAD4

	thumb_func_start ov12_0226BAFC
ov12_0226BAFC: ; 0x0226BAFC
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r2, #0
	str r3, [sp]
	ldr r2, [sp, #0x20]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r4, [sp, #0xc]
	str r2, [sp, #0x10]
	add r2, r3, #0
	add r3, r4, #0
	bl ov12_0226BAD4
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0226BAFC

	thumb_func_start ov12_0226BB1C
ov12_0226BB1C: ; 0x0226BB1C
	push {r4, lr}
	sub sp, #0x18
	add r4, r2, #0
	str r3, [sp]
	ldr r2, [sp, #0x20]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r4, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r2, [sp, #0x24]
	str r2, [sp, #0x14]
	add r2, r3, #0
	add r3, r4, #0
	bl ov12_0226BA4C
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0226BB1C

	thumb_func_start ov12_0226BB40
ov12_0226BB40: ; 0x0226BB40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r3, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r5, #0x10]
	ldr r3, [sp, #0x10]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDF4
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	bl sub_0200DC4C
	ldr r0, [r5, #0x10]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0226BB40

	thumb_func_start ov12_0226BB68
ov12_0226BB68: ; 0x0226BB68
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
_0226BB70:
	ldr r0, [r5]
	add r1, r6, #0
	bl sub_0200DCE8
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _0226BB70
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0226BB68

	thumb_func_start ov12_0226BB84
ov12_0226BB84: ; 0x0226BB84
	ldr r3, _0226BB8C ; =sub_0200DCE8
	ldr r0, [r0, #0x10]
	mov r1, #0
	bx r3
	.balign 4, 0
_0226BB8C: .word sub_0200DCE8
	thumb_func_end ov12_0226BB84

	thumb_func_start ov12_0226BB90
ov12_0226BB90: ; 0x0226BB90
	push {r4, r5, r6, lr}
	add r6, r1, #0
	ldr r0, [r6]
	bl sub_0200DCFC
	cmp r0, #0
	beq _0226BBC0
	mov r4, #0
	add r5, r6, #0
_0226BBA2:
	ldr r0, [r5]
	bl sub_0200DC18
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0226BBA2
	ldr r0, [r6, #0x10]
	bl sub_0200DCFC
	cmp r0, #1
	bne _0226BBC0
	ldr r0, [r6, #0x10]
	bl sub_0200DC18
_0226BBC0:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0226BB90

.rodata
ov12_0226EBA0: ; 0x0226EBA0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
