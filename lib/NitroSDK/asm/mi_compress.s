	.include "asm/macros.inc"
	.include "mi_compress.inc"
	.include "global.inc"

	.text

	arm_func_start MI_CompressLZImpl
MI_CompressLZImpl: ; 0x020D4D5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	movs r0, r3
	ldrne r0, _020D4F30 ; =0x00010110
	str r3, [sp, #4]
	strne r0, [sp, #8]
	moveq r0, #0x12
	streq r0, [sp, #8]
	ldr r0, [sp, #4]
	mov sb, r1
	cmp r0, #0
	movne r1, #1
	mov r0, sb, lsl #8
	moveq r1, #0
	orr r0, r0, #0x10
	mov r8, r2
	orr r0, r0, r1
	str sl, [sp, #0x10]
	mov r7, sb
	cmp sb, #0
	str r0, [r8], #4
	mov r4, #4
	beq _020D4EFC
_020D4DBC:
	ldr r0, _020D4F34 ; =0x00000111
	mov r5, #0
	str r8, [sp, #0xc]
	mov r6, r5
	add r8, r8, #1
	add r4, r4, #1
	rsb fp, r0, #0
_020D4DD8:
	cmp sb, #0
	mov r0, r5, lsl #1
	and r5, r0, #0xff
	beq _020D4EDC
	ldr r0, [sp, #8]
	mov r1, sl
	str r0, [sp]
	ldr r0, [sp, #0x10]
	mov r2, sb
	add r3, sp, #0x14
	bl SearchLZ
	cmp r0, #0
	beq _020D4EBC
	orr r1, r5, #1
	add r2, r4, #2
	cmp r2, r7
	and r5, r1, #0xff
	addhs sp, sp, #0x18
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sp, #4]
	cmp r1, #0
	beq _020D4E84
	ldr r1, _020D4F34 ; =0x00000111
	cmp r0, r1
	blo _020D4E64
	mov r4, r2
	add r1, r0, fp
	mov r2, r1, lsr #0xc
	orr r2, r2, #0x10
	strb r2, [r8]
	mov r2, r1, lsr #4
	strb r2, [r8, #1]
	add r8, r8, #2
	b _020D4E88
_020D4E64:
	cmp r0, #0x11
	sublo r1, r0, #1
	blo _020D4E88
	sub r1, r0, #0x11
	mov r2, r1, lsr #4
	strb r2, [r8], #1
	add r4, r4, #1
	b _020D4E88
_020D4E84:
	sub r1, r0, #3
_020D4E88:
	ldrh r2, [sp, #0x14]
	add r4, r4, #2
	add sl, sl, r0
	sub r2, r2, #1
	mov r2, r2, asr #8
	orr r1, r2, r1, lsl #4
	strb r1, [r8]
	sub sb, sb, r0
	ldrh r0, [sp, #0x14]
	sub r0, r0, #1
	strb r0, [r8, #1]
	add r8, r8, #2
	b _020D4EDC
_020D4EBC:
	add r4, r4, #1
	cmp r4, r7
	addhs sp, sp, #0x18
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [sl], #1
	sub sb, sb, #1
	strb r0, [r8], #1
_020D4EDC:
	add r0, r6, #1
	and r6, r0, #0xff
	cmp r6, #8
	blo _020D4DD8
	ldr r0, [sp, #0xc]
	cmp sb, #0
	strb r5, [r0]
	bne _020D4DBC
_020D4EFC:
	tst r4, #3
	mov r2, #0
	beq _020D4F24
	mov r1, r2
_020D4F0C:
	add r0, r2, #1
	and r2, r0, #0xff
	add r0, r4, r2
	tst r0, #3
	strb r1, [r8], #1
	bne _020D4F0C
_020D4F24:
	mov r0, r4
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020D4F30: .word 0x00010110
_020D4F34: .word 0x00000111
	arm_func_end MI_CompressLZImpl

	arm_func_start SearchLZ
SearchLZ: ; 0x020D4F38
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r7, [sp, #0x20]
	mov r4, #2
	cmp r2, #3
	movlo r0, #0
	ldmloia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	sub ip, r1, #0x1000
	cmp ip, r0
	movlo ip, r0
	sub r6, r1, ip
	cmp r6, #2
	blt _020D5018
_020D4F68:
	mov r0, r1
	ldrb r5, [r1]
	b _020D4F84
_020D4F74:
	add ip, ip, #1
	sub r6, r1, ip
	cmp r6, #2
	blt _020D5018
_020D4F84:
	ldrb r8, [ip]
	cmp r5, r8
	ldreqb sb, [r1, #1]
	ldreqb r8, [ip, #1]
	cmpeq sb, r8
	ldreqb sb, [r1, #2]
	ldreqb r8, [ip, #2]
	cmpeq sb, r8
	bne _020D4F74
	add sl, ip, #3
	add r0, r0, #3
	mov r5, #3
	b _020D4FCC
_020D4FB8:
	add r5, r5, #1
	cmp r5, r7
	add r0, r0, #1
	add sl, sl, #1
	beq _020D4FE8
_020D4FCC:
	sub r8, r0, r1
	cmp r8, r2
	bhs _020D4FE8
	ldrb sb, [r0]
	ldrb r8, [sl]
	cmp sb, r8
	beq _020D4FB8
_020D4FE8:
	cmp r5, r4
	bls _020D5008
	mov r0, r6, lsl #0x10
	cmp r5, r7
	mov r4, r5
	mov lr, r0, lsr #0x10
	cmpne r5, r2
	beq _020D5018
_020D5008:
	add ip, ip, #1
	sub r6, r1, ip
	cmp r6, #2
	bge _020D4F68
_020D5018:
	cmp r4, #3
	movlo r0, #0
	movhs r0, r4
	strhsh lr, [r3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end SearchLZ
