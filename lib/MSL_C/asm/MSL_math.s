	.include "asm/macros.inc"
	.include "MSL_math.inc"
	.include "global.inc"

	.text

	arm_func_start __msl_generic_count_bits64
__msl_generic_count_bits64: ; 0x020F01F4
	mov r3, r0, lsr #1
	ldr r2, _020F027C ; =0x55555555
	orr r3, r3, r1, lsl #31
	and r3, r3, r2
	subs ip, r0, r3
	and r2, r2, r1, lsr #1
	ldr r0, _020F0280 ; =0x33333333
	sbc r3, r1, r2
	mov r1, ip, lsr #2
	orr r1, r1, r3, lsl #30
	and r2, ip, r0
	and r1, r1, r0
	adds r2, r2, r1
	and r1, r3, r0
	and r0, r0, r3, lsr #2
	adc r1, r1, r0
	mov r0, r2, lsr #4
	orr r0, r0, r1, lsl #28
	adds r2, r2, r0
	ldr r0, _020F0284 ; =0x0F0F0F0F
	adc r1, r1, r1, lsr #4
	and r3, r2, r0
	and r2, r1, r0
	mov r0, r3, lsr #8
	orr r0, r0, r2, lsl #24
	adds r1, r3, r0
	adc r2, r2, r2, lsr #8
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	adds r1, r1, r0
	adc r0, r2, r2, lsr #16
	adds r0, r1, r0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020F027C: .word 0x55555555
_020F0280: .word 0x33333333
_020F0284: .word 0x0F0F0F0F
	arm_func_end __msl_generic_count_bits64

	arm_func_start __signbitd
__signbitd: ; 0x020F0288
	stmdb sp!, {r0, r1, r2, r3}
	ldr r0, [sp, #4]
	and r0, r0, #0x80000000
	add sp, sp, #0x10
	bx lr
	arm_func_end __signbitd

	arm_func_start __fpclassifyd
__fpclassifyd: ; 0x020F029C
	stmdb sp!, {r0, r1, r2, r3}
	ldr r2, [sp, #4]
	ldr r0, _020F0304 ; =0x7FF00000
	ands r1, r2, r0
	beq _020F02D8
	cmp r1, r0
	bne _020F02F8
	ldr r0, _020F0308 ; =0x000FFFFF
	tst r2, r0
	ldreq r0, [sp]
	add sp, sp, #0x10
	cmpeq r0, #0
	movne r0, #1
	moveq r0, #2
	bx lr
_020F02D8:
	ldr r0, _020F0308 ; =0x000FFFFF
	tst r2, r0
	ldreq r0, [sp]
	add sp, sp, #0x10
	cmpeq r0, #0
	movne r0, #5
	moveq r0, #3
	bx lr
_020F02F8:
	mov r0, #4
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020F0304: .word 0x7FF00000
_020F0308: .word 0x000FFFFF
	arm_func_end __fpclassifyd

	arm_func_start scalbn
scalbn: ; 0x020F030C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r2
	add r2, sp, #0
	bl frexp
	ldr r2, [sp]
	add r2, r2, r4
	str r2, [sp]
	bl ldexp
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end scalbn

	exception scalbn, 0x002D, 0x00200100
