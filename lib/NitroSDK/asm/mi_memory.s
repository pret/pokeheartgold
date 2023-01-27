	.include "asm/macros.inc"
	.include "mi_memory.inc"
	.include "global.inc"

	.text

	arm_func_start MIi_CpuClear16
MIi_CpuClear16: ; 0x020D4790
	mov r3, #0
_020D4794:
	cmp r3, r2
	blt _020D47A0
	b _020D47A4
_020D47A0:
	strh r0, [r1, r3]
_020D47A4:
	blt _020D47AC
	b _020D47B0
_020D47AC:
	add r3, r3, #2
_020D47B0:
	blt _020D4794
	bx lr
	arm_func_end MIi_CpuClear16

	arm_func_start MIi_CpuCopy16
MIi_CpuCopy16: ; 0x020D47B8
	mov ip, #0
_020D47BC:
	cmp ip, r2
	blt _020D47C8
	b _020D47CC
_020D47C8:
	ldrh r3, [r0, ip]
_020D47CC:
	blt _020D47D4
	b _020D47D8
_020D47D4:
	strh r3, [r1, ip]
_020D47D8:
	blt _020D47E0
	b _020D47E4
_020D47E0:
	add ip, ip, #2
_020D47E4:
	blt _020D47BC
	bx lr
	arm_func_end MIi_CpuCopy16

	arm_func_start MIi_CpuClear32
MIi_CpuClear32: ; 0x020D47EC
	add ip, r1, r2
_020D47F0:
	cmp r1, ip
	blt _020D47FC
	b _020D4800
_020D47FC:
	stmia r1!, {r0}
_020D4800:
	blt _020D47F0
	bx lr
	arm_func_end MIi_CpuClear32

	arm_func_start MIi_CpuCopy32
MIi_CpuCopy32: ; 0x020D4808
	add ip, r1, r2
_020D480C:
	cmp r1, ip
	blt _020D4818
	b _020D481C
_020D4818:
	ldmia r0!, {r2}
_020D481C:
	blt _020D4824
	b _020D4828
_020D4824:
	stmia r1!, {r2}
_020D4828:
	blt _020D480C
	bx lr
	arm_func_end MIi_CpuCopy32

	arm_func_start MIi_CpuSend32
MIi_CpuSend32: ; 0x020D4830
	add ip, r0, r2
_020D4834:
	cmp r0, ip
	blt _020D4840
	b _020D4844
_020D4840:
	ldmia r0!, {r2}
_020D4844:
	blt _020D484C
	b _020D4850
_020D484C:
	str r2, [r1]
_020D4850:
	blt _020D4834
	bx lr
	arm_func_end MIi_CpuSend32

	arm_func_start MIi_CpuClearFast
MIi_CpuClearFast: ; 0x020D4858
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
_020D4884:
	cmp r1, ip
	blt _020D4890
	b _020D4894
_020D4890:
	stmia r1!, {r0, r2, r3, r4, r5, r6, r7, r8}
_020D4894:
	blt _020D4884
_020D4898:
	cmp r1, sb
	blt _020D48A4
	b _020D48A8
_020D48A4:
	stmia r1!, {r0}
_020D48A8:
	blt _020D4898
	ldmia sp!, {r4, r5, r6, r7, r8, sb}
	bx lr
	arm_func_end MIi_CpuClearFast

	arm_func_start MIi_CpuCopyFast
MIi_CpuCopyFast: ; 0x020D48B4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl}
	add sl, r1, r2
	mov ip, r2, lsr #5
	add ip, r1, ip, lsl #5
_020D48C4:
	cmp r1, ip
	blt _020D48D0
	b _020D48D4
_020D48D0:
	ldmia r0!, {r2, r3, r4, r5, r6, r7, r8, sb}
_020D48D4:
	blt _020D48DC
	b _020D48E0
_020D48DC:
	stmia r1!, {r2, r3, r4, r5, r6, r7, r8, sb}
_020D48E0:
	blt _020D48C4
_020D48E4:
	cmp r1, sl
	blt _020D48F0
	b _020D48F4
_020D48F0:
	ldmia r0!, {r2}
_020D48F4:
	blt _020D48FC
	b _020D4900
_020D48FC:
	stmia r1!, {r2}
_020D4900:
	blt _020D48E4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl}
	bx lr
	arm_func_end MIi_CpuCopyFast

	arm_func_start MI_Copy32B
MI_Copy32B: ; 0x020D490C
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3}
	stmia r1!, {r2, r3}
	bx lr
	arm_func_end MI_Copy32B

	arm_func_start MI_Copy36B
MI_Copy36B: ; 0x020D4928
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	bx lr
	arm_func_end MI_Copy36B

	arm_func_start MI_Copy48B
MI_Copy48B: ; 0x020D4944
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	bx lr
	arm_func_end MI_Copy48B

	arm_func_start MI_Copy64B
MI_Copy64B: ; 0x020D4968
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0, {r0, r2, r3, ip}
	stmia r1!, {r0, r2, r3, ip}
	bx lr
	arm_func_end MI_Copy64B

	arm_func_start MI_CpuFill8
MI_CpuFill8: ; 0x020D4994
	cmp r2, #0
	beq _020D49A0
	b _020D49A4
_020D49A0:
	bx lr
_020D49A4:
	tst r0, #1
	beq _020D49D0
	ldrh ip, [r0, #-1]
	and ip, ip, #0xff
	orr r3, ip, r1, lsl #8
	strh r3, [r0, #-1]
	add r0, r0, #1
	subs r2, r2, #1
	beq _020D49CC
	b _020D49D0
_020D49CC:
	bx lr
_020D49D0:
	cmp r2, #2
	blo _020D4A28
	orr r1, r1, r1, lsl #8
	tst r0, #2
	beq _020D49F8
	strh r1, [r0], #2
	subs r2, r2, #2
	beq _020D49F4
	b _020D49F8
_020D49F4:
	bx lr
_020D49F8:
	orr r1, r1, r1, lsl #16
	bics r3, r2, #3
	beq _020D4A18
	sub r2, r2, r3
	add ip, r3, r0
_020D4A0C:
	str r1, [r0], #4
	cmp r0, ip
	blo _020D4A0C
_020D4A18:
	tst r2, #2
	bne _020D4A24
	b _020D4A28
_020D4A24:
	strh r1, [r0], #2
_020D4A28:
	tst r2, #1
	beq _020D4A34
	b _020D4A38
_020D4A34:
	bx lr
_020D4A38:
	ldrh r3, [r0]
	and r3, r3, #0xff00
	and r1, r1, #0xff
	orr r1, r1, r3
	strh r1, [r0]
	bx lr
	arm_func_end MI_CpuFill8

	arm_func_start MI_CpuCopy8
MI_CpuCopy8: ; 0x020D4A50
	cmp r2, #0
	beq _020D4A5C
	b _020D4A60
_020D4A5C:
	bx lr
_020D4A60:
	tst r1, #1
	beq _020D4AB8
	ldrh ip, [r1, #-1]
	and ip, ip, #0xff
	tst r0, #1
	bne _020D4A7C
	b _020D4A80
_020D4A7C:
	ldrh r3, [r0, #-1]
_020D4A80:
	bne _020D4A88
	b _020D4A8C
_020D4A88:
	mov r3, r3, lsr #8
_020D4A8C:
	beq _020D4A94
	b _020D4A98
_020D4A94:
	ldrh r3, [r0]
_020D4A98:
	orr r3, ip, r3, lsl #8
	strh r3, [r1, #-1]
	add r0, r0, #1
	add r1, r1, #1
	subs r2, r2, #1
	beq _020D4AB4
	b _020D4AB8
_020D4AB4:
	bx lr
_020D4AB8:
	eor ip, r1, r0
	tst ip, #1
	beq _020D4B14
	bic r0, r0, #1
	ldrh ip, [r0], #2
	mov r3, ip, lsr #8
	subs r2, r2, #2
	blo _020D4AF0
_020D4AD8:
	ldrh ip, [r0], #2
	orr ip, r3, ip, lsl #8
	strh ip, [r1], #2
	mov r3, ip, lsr #0x10
	subs r2, r2, #2
	bhs _020D4AD8
_020D4AF0:
	tst r2, #1
	beq _020D4AFC
	b _020D4B00
_020D4AFC:
	bx lr
_020D4B00:
	ldrh ip, [r1]
	and ip, ip, #0xff00
	orr ip, ip, r3
	strh ip, [r1]
	bx lr
_020D4B14:
	tst ip, #2
	beq _020D4B40
	bics r3, r2, #1
	beq _020D4BA4
	sub r2, r2, r3
	add ip, r3, r1
_020D4B2C:
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	cmp r1, ip
	blo _020D4B2C
	b _020D4BA4
_020D4B40:
	cmp r2, #2
	blo _020D4BA4
	tst r1, #2
	beq _020D4B68
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	subs r2, r2, #2
	beq _020D4B64
	b _020D4B68
_020D4B64:
	bx lr
_020D4B68:
	bics r3, r2, #3
	beq _020D4B88
	sub r2, r2, r3
	add ip, r3, r1
_020D4B78:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, ip
	blo _020D4B78
_020D4B88:
	tst r2, #2
	bne _020D4B94
	b _020D4B98
_020D4B94:
	ldrh r3, [r0], #2
_020D4B98:
	bne _020D4BA0
	b _020D4BA4
_020D4BA0:
	strh r3, [r1], #2
_020D4BA4:
	tst r2, #1
	beq _020D4BB0
	b _020D4BB4
_020D4BB0:
	bx lr
_020D4BB4:
	ldrh r2, [r1]
	ldrh r0, [r0]
	and r2, r2, #0xff00
	and r0, r0, #0xff
	orr r0, r2, r0
	strh r0, [r1]
	bx lr
	arm_func_end MI_CpuCopy8

	thumb_func_start MI_Zero36B
MI_Zero36B: ; 0x020D4BD0
	mov r1, #0
	mov r2, #0
	mov r3, #0
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r1, r2, r3}
	bx lr
	thumb_func_end MI_Zero36B

	.balign 4, 0
