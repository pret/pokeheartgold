	.include "asm/macros.inc"
	.include "MSL_Common_file_io.inc"
	.include "global.inc"

	.text

	arm_func_start fclose
fclose: ; 0x020E5328
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #4]
	mov r1, r1, lsl #0x16
	movs r1, r1, lsr #0x1d
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl fflush
	mov r4, r0
	ldr r0, [r5]
	ldr r1, [r5, #0x44]
	blx r1
	ldr r1, [r5, #4]
	mov r2, #0
	bic r1, r1, #0x380
	str r1, [r5, #4]
	str r2, [r5]
	ldr r1, [r5, #8]
	mov r1, r1, lsl #0x1c
	movs r1, r1, lsr #0x1f
	subne r0, r2, #1
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	cmpeq r0, #0
	movne r2, #1
	rsb r0, r2, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end fclose

	arm_func_start fflush
fflush: ; 0x020E539C
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _020E53B0
	bl __flush_all
	ldmia sp!, {r4, pc}
_020E53B0:
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	bne _020E53CC
	ldr r0, [r4, #4]
	mov r1, r0, lsl #0x16
	movs r1, r1, lsr #0x1d
	bne _020E53D4
_020E53CC:
	mvn r0, #0
	ldmia sp!, {r4, pc}
_020E53D4:
	mov r0, r0, lsl #0x1b
	mov r0, r0, lsr #0x1d
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #8]
	mov r1, r0, lsl #0x1d
	mov r1, r1, lsr #0x1d
	cmp r1, #3
	bichs r0, r0, #7
	orrhs r0, r0, #2
	strhs r0, [r4, #8]
	ldr r0, [r4, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #2
	moveq r0, #0
	streq r0, [r4, #0x28]
	ldr r0, [r4, #8]
	mov r1, r0, lsl #0x1d
	mov r1, r1, lsr #0x1d
	cmp r1, #1
	beq _020E5440
	bic r0, r0, #7
	str r0, [r4, #8]
	mov r0, #0
	ldmia sp!, {r4, pc}
_020E5440:
	mov r0, r4
	mov r1, #0
	bl __flush_buffer
	cmp r0, #0
	mov r0, #0
	beq _020E546C
	mov r1, #1
	strb r1, [r4, #0xd]
	str r0, [r4, #0x28]
	sub r0, r0, #1
	ldmia sp!, {r4, pc}
_020E546C:
	ldr r1, [r4, #8]
	bic r1, r1, #7
	str r1, [r4, #8]
	str r0, [r4, #0x18]
	str r0, [r4, #0x28]
	ldmia sp!, {r4, pc}
	arm_func_end fflush

	exception fclose, 0x0075, 0x00200300
	exception fflush, 0x00E9, 0x00100100
