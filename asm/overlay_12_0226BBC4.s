	.include "asm/macros.inc"
	.include "overlay_12_0226BBC4.inc"
	.include "global.inc"

	.text

    thumb_func_start ov12_0226BBC4
ov12_0226BBC4: ; 0x0226BBC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xa4
	add r1, r2, #0
	add r7, r3, #0
	bl NARC_New
	add r6, r0, #0
	str r6, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x34]
	mov r1, #3
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r5, #0
	add r3, r4, #0
	bl sub_0200D68C
	mov r3, #0
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r6, #0
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x38]
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #2
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #3
	bl sub_0200D71C
	add r0, r6, #0
	bl NARC_Delete
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0226BBC4

	thumb_func_start ov12_0226BC40
ov12_0226BC40: ; 0x0226BC40
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
	thumb_func_end ov12_0226BC40

	thumb_func_start ov12_0226BC68
ov12_0226BC68: ; 0x0226BC68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	ldr r5, _0226BCD8 ; =ov12_0226EBD4
	add r6, r3, #0
	add r7, r0, #0
	str r1, [sp]
	add r4, sp, #4
	mov r3, #6
_0226BC78:
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r3, r3, #1
	bne _0226BC78
	ldr r0, [r5]
	mov r1, #0x20
	str r0, [r4]
	ldr r0, [sp, #0x50]
	str r6, [sp, #0x18]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x54]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x58]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x5c]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x60]
	str r0, [sp, #0x30]
	add r0, r2, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r1, [sp]
	add r0, r7, #0
	add r2, sp, #4
	bl sub_0200D734
	mov r1, #0
	str r0, [r4]
	bl sub_0200DCE8
	mov r0, #3
	lsl r0, r0, #0x12
	str r0, [r4, #0x14]
	ldr r0, _0226BCDC ; =ov12_0226BD54
	ldr r2, _0226BCE0 ; =0x000003E7
	add r1, r4, #0
	bl CreateSysTask
	str r0, [r4, #4]
	add r0, r4, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226BCD8: .word ov12_0226EBD4
_0226BCDC: .word ov12_0226BD54
_0226BCE0: .word 0x000003E7
	thumb_func_end ov12_0226BC68

	thumb_func_start ov12_0226BCE4
ov12_0226BCE4: ; 0x0226BCE4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0200D9DC
	ldr r0, [r4, #4]
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov12_0226BCE4

	thumb_func_start ov12_0226BCFC
ov12_0226BCFC: ; 0x0226BCFC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl ov12_0226BEB8
	str r7, [r5, #8]
	str r4, [r5, #0xc]
	str r6, [r5, #0x14]
	lsl r1, r7, #0x10
	lsl r2, r4, #0x10
	ldr r0, [r5]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	add r3, r6, #0
	bl sub_0200DDF4
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0226BCFC

	thumb_func_start ov12_0226BD2C
ov12_0226BD2C: ; 0x0226BD2C
	push {r3, lr}
	mov r3, #3
	lsl r3, r3, #0x12
	bl ov12_0226BCFC
	pop {r3, pc}
	thumb_func_end ov12_0226BD2C

	thumb_func_start ov12_0226BD38
ov12_0226BD38: ; 0x0226BD38
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r4, #0
	bl ov12_0226BEB8
	pop {r4, pc}
	thumb_func_end ov12_0226BD38

	thumb_func_start ov12_0226BD4C
ov12_0226BD4C: ; 0x0226BD4C
	strh r1, [r0, #0x18]
	bx lr
	thumb_func_end ov12_0226BD4C

	thumb_func_start ov12_0226BD50
ov12_0226BD50: ; 0x0226BD50
	ldrb r0, [r0, #0x1b]
	bx lr
	thumb_func_end ov12_0226BD50

	thumb_func_start ov12_0226BD54
ov12_0226BD54: ; 0x0226BD54
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldrb r0, [r4, #0x1b]
	cmp r0, #1
	bne _0226BD62
	mov r0, #0
	strb r0, [r4, #0x1b]
_0226BD62:
	mov r0, #0x18
	ldrsh r1, [r4, r0]
	cmp r1, #0
	ble _0226BD78
	sub r1, r1, #1
	strh r1, [r4, #0x18]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _0226BD78
	mov r0, #1
	strb r0, [r4, #0x1a]
_0226BD78:
	ldr r0, [r4]
	bl sub_0200DCFC
	cmp r0, #0
	bne _0226BD84
	b _0226BEB0
_0226BD84:
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _0226BE06
	mov r1, #0xfa
	ldr r2, [r4, #0x10]
	lsl r1, r1, #2
	add r2, r2, r1
	add r0, r4, #0
	ldr r1, _0226BEB4 ; =0x00004650
	add r0, #0x10
	str r2, [r4, #0x10]
	cmp r2, r1
	blt _0226BDB2
	ldr r2, [r0]
	sub r1, r2, r1
	str r1, [r0]
	ldrb r0, [r4, #0x1a]
	cmp r0, #1
	bne _0226BDB2
	mov r0, #1
	strb r0, [r4, #0x1c]
	mov r0, #0
	strb r0, [r4, #0x1a]
_0226BDB2:
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _0226BE06
	ldr r0, [r4, #0x10]
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDegNoWrap
	mov r2, #0xe
	asr r1, r0, #0x1f
	lsl r2, r2, #0xc
	mov r3, #0
	bl _ll_mul
	add r5, r1, #0
	ldr r1, [r4, #8]
	mov r2, #2
	add r6, r0, #0
	lsl r1, r1, #0x10
	mov r7, #0
	lsl r2, r2, #0xa
	asr r1, r1, #0x10
	add r2, r6, r2
	adc r5, r7
	lsl r5, r5, #0x14
	lsr r2, r2, #0xc
	orr r2, r5
	asr r5, r2, #0xb
	lsr r5, r5, #0x14
	add r5, r2, r5
	ldr r3, [r4, #0xc]
	asr r2, r5, #0xc
	sub r2, r3, r2
	lsl r2, r2, #0x10
	ldr r0, [r4]
	ldr r3, [r4, #0x14]
	asr r2, r2, #0x10
	bl sub_0200DDF4
_0226BE06:
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	bne _0226BEAA
	ldrb r0, [r4, #0x1d]
	cmp r0, #3
	bhi _0226BEAA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226BE1E: ; jump table
	.short _0226BE26 - _0226BE1E - 2 ; case 0
	.short _0226BE3E - _0226BE1E - 2 ; case 1
	.short _0226BE60 - _0226BE1E - 2 ; case 2
	.short _0226BE8E - _0226BE1E - 2 ; case 3
_0226BE26:
	ldrb r0, [r4, #0x1e]
	add r0, r0, #1
	strb r0, [r4, #0x1e]
	ldrb r0, [r4, #0x1e]
	cmp r0, #3
	bls _0226BEAA
	mov r0, #0
	strb r0, [r4, #0x1e]
	ldrb r0, [r4, #0x1d]
	add r0, r0, #1
	strb r0, [r4, #0x1d]
	b _0226BEAA
_0226BE3E:
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #8]
	add r2, #8
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r4]
	ldr r3, [r4, #0x14]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDF4
	mov r0, #1
	strb r0, [r4, #0x1b]
	ldrb r0, [r4, #0x1d]
	add r0, r0, #1
	strb r0, [r4, #0x1d]
	b _0226BEAA
_0226BE60:
	ldrb r0, [r4, #0x1e]
	add r0, r0, #1
	strb r0, [r4, #0x1e]
	ldrb r0, [r4, #0x1e]
	cmp r0, #2
	bls _0226BEAA
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #8]
	add r2, r2, #2
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r4]
	ldr r3, [r4, #0x14]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDF4
	mov r0, #0
	strb r0, [r4, #0x1e]
	ldrb r0, [r4, #0x1d]
	add r0, r0, #1
	strb r0, [r4, #0x1d]
	b _0226BEAA
_0226BE8E:
	ldrb r0, [r4, #0x1e]
	add r0, r0, #1
	strb r0, [r4, #0x1e]
	ldrb r0, [r4, #0x1e]
	cmp r0, #2
	bls _0226BEAA
	add r0, r4, #0
	bl ov12_0226BD38
	mov r0, #0
	strb r0, [r4, #0x1e]
	ldrb r0, [r4, #0x1d]
	add r0, r0, #1
	strb r0, [r4, #0x1d]
_0226BEAA:
	ldr r0, [r4]
	bl sub_0200DC18
_0226BEB0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226BEB4: .word 0x00004650
	thumb_func_end ov12_0226BD54

	thumb_func_start ov12_0226BEB8
ov12_0226BEB8: ; 0x0226BEB8
	mov r1, #0
	str r1, [r0, #0x10]
	strb r1, [r0, #0x1c]
	strb r1, [r0, #0x1d]
	strb r1, [r0, #0x1e]
	bx lr
	thumb_func_end ov12_0226BEB8

.rodata

ov12_0226EBD4: ; 0x0226EBD4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.section .sinit,4
	.word ov12_022399BC