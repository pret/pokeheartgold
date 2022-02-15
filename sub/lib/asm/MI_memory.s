	.include "asm/macros.inc"
	.include "global.inc"

	.text

	arm_func_start MIi_CpuClear16
MIi_CpuClear16: ; 0x037FAF98
	mov r3, #0
_037FAF9C:
	cmp r3, r2
	strlth r0, [r1, r3]
	addlt r3, r3, #2
	blt _037FAF9C
	bx lr
	arm_func_end MIi_CpuClear16

	arm_func_start MIi_CpuCopy16
MIi_CpuCopy16: ; 0x037FAFB0
	mov ip, #0
_037FAFB4:
	cmp ip, r2
	ldrlth r3, [r0, ip]
	strlth r3, [r1, ip]
	addlt ip, ip, #2
	blt _037FAFB4
	bx lr
	arm_func_end MIi_CpuCopy16

	arm_func_start MIi_CpuClear32
MIi_CpuClear32: ; 0x037FAFCC
	add ip, r1, r2
_037FAFD0:
	cmp r1, ip
	stmltia r1!, {r0}
	blt _037FAFD0
	bx lr
	arm_func_end MIi_CpuClear32

	arm_func_start MIi_CpuCopy32
MIi_CpuCopy32: ; 0x037FAFE0
	add ip, r1, r2
_037FAFE4:
	cmp r1, ip
	ldmltia r0!, {r2}
	stmltia r1!, {r2}
	blt _037FAFE4
	bx lr
	arm_func_end MIi_CpuCopy32

	arm_func_start MIi_CpuClearFast
MIi_CpuClearFast: ; 0x037FAFF8
	stmdb sp!, {r4, r5, r6, r7, r8, sb}
	add sb, r1, r2
	mov ip, r2, lsr #5
	add ip, r1, ip, lsl #5
	mov r2, r0
	mov r3, r2
	mov r4, r2
	mov r5, r2
	mov r6, r2
	mov r7, r2
	mov r8, r2
_037FB024:
	cmp r1, ip
	stmltia r1!, {r0, r2, r3, r4, r5, r6, r7, r8}
	blt _037FB024
_037FB030:
	cmp r1, sb
	stmltia r1!, {r0}
	blt _037FB030
	ldmia sp!, {r4, r5, r6, r7, r8, sb}
	bx lr
	arm_func_end MIi_CpuClearFast

	arm_func_start MIi_CpuCopyFast
MIi_CpuCopyFast: ; 0x037FB044
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl}
	add sl, r1, r2
	mov ip, r2, lsr #5
	add ip, r1, ip, lsl #5
_037FB054:
	cmp r1, ip
	ldmltia r0!, {r2, r3, r4, r5, r6, r7, r8, sb}
	stmltia r1!, {r2, r3, r4, r5, r6, r7, r8, sb}
	blt _037FB054
_037FB064:
	cmp r1, sl
	ldmltia r0!, {r2}
	stmltia r1!, {r2}
	blt _037FB064
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl}
	bx lr
	arm_func_end MIi_CpuCopyFast

	arm_func_start MI_CpuFill8
MI_CpuFill8: ; 0x037FB07C
	cmp r2, #0
	bxeq lr
	tst r0, #1
	beq _037FB0A8
	ldrh ip, [r0, #-1]
	and ip, ip, #0xff
	orr r3, ip, r1, lsl #8
	strh r3, [r0, #-1]
	add r0, r0, #1
	subs r2, r2, #1
	bxeq lr
_037FB0A8:
	cmp r2, #2
	blo _037FB0F0
	orr r1, r1, r1, lsl #8
	tst r0, #2
	beq _037FB0C8
	strh r1, [r0], #2
	subs r2, r2, #2
	bxeq lr
_037FB0C8:
	orr r1, r1, r1, lsl #16
	bics r3, r2, #3
	beq _037FB0E8
	sub r2, r2, r3
	add ip, r3, r0
_037FB0DC:
	str r1, [r0], #4
	cmp r0, ip
	blo _037FB0DC
_037FB0E8:
	tst r2, #2
	strneh r1, [r0], #2
_037FB0F0:
	tst r2, #1
	bxeq lr
	ldrh r3, [r0]
	and r3, r3, #0xff00
	and r1, r1, #0xff
	orr r1, r1, r3
	strh r1, [r0]
	bx lr
	arm_func_end MI_CpuFill8

	arm_func_start MI_CpuCopy8
MI_CpuCopy8: ; 0x037FB110
	cmp r2, #0
	bxeq lr
	tst r1, #1
	beq _037FB150
	ldrh ip, [r1, #-1]
	and ip, ip, #0xff
	tst r0, #1
	ldrneh r3, [r0, #-1]
	movne r3, r3, lsr #8
	ldreqh r3, [r0]
	orr r3, ip, r3, lsl #8
	strh r3, [r1, #-1]
	add r0, r0, #1
	add r1, r1, #1
	subs r2, r2, #1
	bxeq lr
_037FB150:
	eor ip, r1, r0
	tst ip, #1
	beq _037FB1A4
	bic r0, r0, #1
	ldrh ip, [r0], #2
	mov r3, ip, lsr #8
	subs r2, r2, #2
	blo _037FB188
_037FB170:
	ldrh ip, [r0], #2
	orr ip, r3, ip, lsl #8
	strh ip, [r1], #2
	mov r3, ip, lsr #0x10
	subs r2, r2, #2
	bhs _037FB170
_037FB188:
	tst r2, #1
	bxeq lr
	ldrh ip, [r1]
	and ip, ip, #0xff00
	orr ip, ip, r3
	strh ip, [r1]
	bx lr
_037FB1A4:
	tst ip, #2
	beq _037FB1D0
	bics r3, r2, #1
	beq _037FB21C
	sub r2, r2, r3
	add ip, r3, r1
_037FB1BC:
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	cmp r1, ip
	blo _037FB1BC
	b _037FB21C
_037FB1D0:
	cmp r2, #2
	blo _037FB21C
	tst r1, #2
	beq _037FB1F0
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	subs r2, r2, #2
	bxeq lr
_037FB1F0:
	bics r3, r2, #3
	beq _037FB210
	sub r2, r2, r3
	add ip, r3, r1
_037FB200:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, ip
	blo _037FB200
_037FB210:
	tst r2, #2
	ldrneh r3, [r0], #2
	strneh r3, [r1], #2
_037FB21C:
	tst r2, #1
	bxeq lr
	ldrh r2, [r1]
	ldrh r0, [r0]
	and r2, r2, #0xff00
	and r0, r0, #0xff
	orr r0, r2, r0
	strh r0, [r1]
	bx lr
	arm_func_end MI_CpuCopy8
