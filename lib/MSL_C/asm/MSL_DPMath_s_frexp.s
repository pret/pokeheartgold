	.include "asm/macros.inc"
	.include "MSL_DPMath_s_frexp.inc"
	.include "global.inc"

	.text

	arm_func_start frexp
frexp: ; 0x020EEAC4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	ldr r1, [sp, #0xc]
	ldr r0, _020EEB70 ; =0x7FF00000
	mov r4, r2
	bic r3, r1, #0x80000000
	mov r2, #0
	str r2, [r4]
	cmp r3, r0
	ldr r0, [sp, #8]
	bge _020EEAF8
	orrs r0, r3, r0
	bne _020EEB0C
_020EEAF8:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EEB0C:
	cmp r3, #0x100000
	bge _020EEB38
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r3, _020EEB74 ; =0x43500000
	bl _dmul
	mvn r2, #0x35
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [r4]
	bic r3, r1, #0x80000000
_020EEB38:
	ldr r2, _020EEB78 ; =0x800FFFFF
	ldr r0, _020EEB7C ; =0xFFFFFC02
	and r1, r1, r2
	orr r1, r1, #0xfe00000
	orr r1, r1, #0x30000000
	ldr r2, [r4]
	add r0, r0, r3, asr #20
	add r2, r2, r0
	ldr r0, [sp, #8]
	str r2, [r4]
	str r1, [sp, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020EEB70: .word 0x7FF00000
_020EEB74: .word 0x43500000
_020EEB78: .word 0x800FFFFF
_020EEB7C: .word 0xFFFFFC02
	arm_func_end frexp

	exception frexp, 0x00BD, 0x00300120
