	.include "asm/macros.inc"
	.include "fx_mtx44.inc"
	.include "global.inc"
	.text

	arm_func_start MTX_Identity44_
MTX_Identity44_: ; 0x020CC044
	mov r2, #0x1000
	mov r3, #0
	stmia r0!, {r2, r3}
	mov r1, #0
	stmia r0!, {r1, r3}
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r1, r3}
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r1, r3}
	stmia r0!, {r1, r2}
	bx lr
	arm_func_end MTX_Identity44_

	arm_func_start MTX_Copy44To43_
MTX_Copy44To43_: ; 0x020CC070
	ldmia r0!, {r2, r3, ip}
	add r0, r0, #4
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	add r0, r0, #4
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	add r0, r0, #4
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	add r0, r0, #4
	stmia r1!, {r2, r3, ip}
	bx lr
	arm_func_end MTX_Copy44To43_

	arm_func_start MTX_TransApply44
MTX_TransApply44: ; 0x020CC0A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r7, r6
	beq _020CC0C4
	bl MI_Copy48B
_020CC0C4:
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	smull r3, r2, r4, r0
	smlal r3, r2, r5, r1
	ldr r0, [sp, #0x18]
	ldr r1, [r7, #0x20]
	ldr ip, [r7, #0x30]
	smlal r3, r2, r0, r1
	mov r1, r3, lsr #0xc
	orr r1, r1, r2, lsl #20
	add r1, ip, r1
	str r1, [r6, #0x30]
	ldr r1, [r7, #0x14]
	ldr r2, [r7, #4]
	smull ip, r3, r4, r1
	smlal ip, r3, r5, r2
	ldr r1, [r7, #0x24]
	ldr r2, [r7, #0x34]
	smlal ip, r3, r0, r1
	mov r1, ip, lsr #0xc
	orr r1, r1, r3, lsl #20
	add r1, r2, r1
	str r1, [r6, #0x34]
	ldr r1, [r7, #0x18]
	ldr r2, [r7, #8]
	smull ip, r3, r4, r1
	smlal ip, r3, r5, r2
	ldr r1, [r7, #0x28]
	ldr r2, [r7, #0x38]
	smlal ip, r3, r0, r1
	mov r1, ip, lsr #0xc
	orr r1, r1, r3, lsl #20
	add r1, r2, r1
	str r1, [r6, #0x38]
	ldr r1, [r7, #0x1c]
	ldr r2, [r7, #0xc]
	smull ip, r3, r4, r1
	smlal ip, r3, r5, r2
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x3c]
	smlal ip, r3, r0, r1
	mov r0, ip, lsr #0xc
	orr r0, r0, r3, lsl #20
	add r0, r2, r0
	str r0, [r6, #0x3c]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end MTX_TransApply44

	thumb_func_start MTX_RotX44_
MTX_RotX44_: ; 0x020CC17C
	str r2, [r0, #0x14]
	str r2, [r0, #0x28]
	str r1, [r0, #0x18]
	neg r1, r1
	str r1, [r0, #0x24]
	mov r1, #1
	mov r2, #0
	lsl r1, r1, #0xc
	mov r3, #0
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r2, r3}
	add r0, #8
	stmia r0!, {r2, r3}
	add r0, #8
	stmia r0!, {r2, r3}
	stmia r0!, {r2, r3}
	str r1, [r0]
	bx lr
	thumb_func_end MTX_RotX44_

	thumb_func_start MTX_RotY44_
MTX_RotY44_: ; 0x020CC1A0
	str r2, [r0]
	str r2, [r0, #0x28]
	str r1, [r0, #0x20]
	neg r1, r1
	str r1, [r0, #8]
	mov r3, #1
	mov r1, #0
	lsl r3, r3, #0xc
	mov r2, #0
	str r2, [r0, #4]
	add r0, #0xc
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r1, r2}
	str r2, [r0, #4]
	add r0, #0xc
	stmia r0!, {r1, r2}
	stmia r0!, {r1, r2, r3}
	bx lr
	thumb_func_end MTX_RotY44_

	thumb_func_start MTX_RotZ44_
MTX_RotZ44_: ; 0x020CC1C4
	str r2, [r0]
	str r2, [r0, #0x14]
	str r1, [r0, #4]
	neg r1, r1
	str r1, [r0, #0x10]
	mov r3, #1
	mov r1, #0
	lsl r3, r3, #0xc
	mov r2, #0
	add r0, #8
	stmia r0!, {r1, r2}
	add r0, #8
	stmia r0!, {r1, r2}
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r1, r2}
	stmia r0!, {r1, r2, r3}
	bx lr
	.align 2, 0
	thumb_func_end MTX_RotZ44_

	arm_func_start MTX_Concat44
MTX_Concat44: ; 0x020CC1E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xe8
	cmp r2, r1
	addeq sl, sp, #0xa8
	str r2, [sp]
	movne sl, r2
	ldr r4, [r0, #4]
	ldr r2, [r1, #0x10]
	ldr r5, [r0]
	smull r8, r7, r4, r2
	ldr r2, [r1]
	ldr r3, [r0, #8]
	smlal r8, r7, r5, r2
	ldr r6, [r1, #0x20]
	ldr r2, [r0, #0xc]
	smlal r8, r7, r3, r6
	ldr r6, [r1, #0x30]
	smlal r8, r7, r2, r6
	mov r6, r8, lsr #0xc
	orr r6, r6, r7, lsl #20
	str r6, [sl]
	ldr r6, [r1, #0x14]
	ldr r7, [r1, #4]
	smull sb, r8, r4, r6
	smlal sb, r8, r5, r7
	ldr r6, [r1, #0x24]
	ldr r7, [r1, #0x34]
	smlal sb, r8, r3, r6
	smlal sb, r8, r2, r7
	mov r6, sb, lsr #0xc
	orr r6, r6, r8, lsl #20
	str r6, [sl, #4]
	ldr r6, [r1, #0x1c]
	ldr r7, [r1, #0xc]
	smull sb, r8, r4, r6
	smlal sb, r8, r5, r7
	ldr r6, [r1, #0x2c]
	ldr r7, [r1, #0x3c]
	smlal sb, r8, r3, r6
	smlal sb, r8, r2, r7
	mov r6, sb, lsr #0xc
	orr r6, r6, r8, lsl #20
	str r6, [sl, #0xc]
	ldr fp, [r1, #0x18]
	ldr ip, [r1, #8]
	smull r7, r6, r4, fp
	ldr r8, [r1, #0x38]
	smlal r7, r6, r5, ip
	ldr sb, [r1, #0x28]
	mov lr, r8, asr #0x1f
	smlal r7, r6, r3, sb
	smlal r7, r6, r2, r8
	mov r2, r7, lsr #0xc
	orr r2, r2, r6, lsl #20
	str r2, [sl, #8]
	mov r2, fp, asr #0x1f
	str r2, [sp, #4]
	mov r2, ip, asr #0x1f
	str r2, [sp, #8]
	mov r2, sb, asr #0x1f
	str r2, [sp, #0x8c]
	ldr r6, [r0, #0x14]
	ldr r7, [r0, #0x10]
	mov r2, r6, asr #0x1f
	str r2, [sp, #0xc]
	mov r2, r7, asr #0x1f
	ldr r5, [r0, #0x18]
	str r2, [sp, #0x10]
	mov r2, r5, asr #0x1f
	ldr r4, [r0, #0x1c]
	str r2, [sp, #0x14]
	mov r2, r4, asr #0x1f
	str r2, [sp, #0x18]
	umull r2, r3, r4, r8
	str r2, [sp, #0x1c]
	mla r3, r4, lr, r3
	ldr r2, [sp, #0x18]
	mla r3, r2, r8, r3
	umull r8, r2, r5, sb
	str r8, [sp, #0x20]
	ldr r8, [sp, #0x8c]
	mla r2, r5, r8, r2
	ldr r8, [sp, #0x14]
	mla r2, r8, sb, r2
	ldr r8, [sp, #8]
	umull lr, sb, r7, ip
	mla sb, r7, r8, sb
	ldr r8, [sp, #0x10]
	mla sb, r8, ip, sb
	umull ip, r8, r6, fp
	adds lr, lr, ip
	ldr ip, [sp, #4]
	mla r8, r6, ip, r8
	ldr ip, [sp, #0xc]
	mla r8, ip, fp, r8
	adc sb, sb, r8
	ldr r8, [sp, #0x20]
	adds fp, r8, lr
	adc r8, r2, sb
	ldr r2, [sp, #0x1c]
	adds sb, r2, fp
	adc r2, r3, r8
	mov r3, sb, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [sl, #0x18]
	ldr r2, [r1, #0x14]
	ldr r3, [r1, #4]
	smull fp, r2, r6, r2
	smlal fp, r2, r7, r3
	ldr r8, [r1, #0x24]
	ldr sb, [r1, #0x34]
	smlal fp, r2, r5, r8
	smlal fp, r2, r4, sb
	mov r3, fp, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [sl, #0x14]
	ldr r2, [r1, #0x1c]
	ldr r3, [r1, #0xc]
	smull fp, r2, r6, r2
	smlal fp, r2, r7, r3
	ldr r8, [r1, #0x2c]
	ldr sb, [r1, #0x3c]
	smlal fp, r2, r5, r8
	smlal fp, r2, r4, sb
	mov r3, fp, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [sl, #0x1c]
	ldr sb, [r1, #0x10]
	ldr fp, [r1, #0x30]
	smull ip, r8, r6, sb
	ldr r3, [r1]
	ldr r2, [r1, #0x20]
	smlal ip, r8, r7, r3
	smlal ip, r8, r5, r2
	smlal ip, r8, r4, fp
	mov r4, ip, lsr #0xc
	orr r4, r4, r8, lsl #20
	str r4, [sl, #0x10]
	mov r4, r3, asr #0x1f
	mov r5, sb, asr #0x1f
	str r4, [sp, #0x28]
	mov r4, r2, asr #0x1f
	str r5, [sp, #0x24]
	ldr r7, [r0, #0x24]
	str r4, [sp, #0x2c]
	mov r4, r7, asr #0x1f
	ldr r8, [r0, #0x20]
	ldr r6, [r0, #0x28]
	ldr r5, [r0, #0x2c]
	mov lr, fp, asr #0x1f
	str r4, [sp, #0x90]
	mov r4, r8, asr #0x1f
	str r4, [sp, #0x30]
	mov r4, r6, asr #0x1f
	str r4, [sp, #0x34]
	mov r4, r5, asr #0x1f
	str r4, [sp, #0x38]
	umull ip, r4, r5, fp
	str ip, [sp, #0x3c]
	mla r4, r5, lr, r4
	ldr ip, [sp, #0x38]
	mla r4, ip, fp, r4
	umull fp, lr, r6, r2
	str fp, [sp, #0x40]
	ldr fp, [sp, #0x2c]
	mla lr, r6, fp, lr
	ldr fp, [sp, #0x34]
	mla lr, fp, r2, lr
	umull r2, ip, r8, r3
	str r2, [sp, #0x44]
	ldr r2, [sp, #0x28]
	mla ip, r8, r2, ip
	ldr r2, [sp, #0x30]
	mla ip, r2, r3, ip
	umull r3, fp, r7, sb
	ldr r2, [sp, #0x44]
	adds r3, r2, r3
	ldr r2, [sp, #0x24]
	mla fp, r7, r2, fp
	ldr r2, [sp, #0x90]
	mla fp, r2, sb, fp
	ldr r2, [sp, #0x40]
	adc sb, ip, fp
	adds fp, r2, r3
	ldr r2, [sp, #0x3c]
	adc r3, lr, sb
	adds sb, r2, fp
	adc r2, r4, r3
	mov r3, sb, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [sl, #0x20]
	ldr r2, [r1, #0x14]
	ldr lr, [r1, #4]
	str r2, [sp, #0x48]
	ldr r3, [sp, #0x48]
	mov r2, r2, asr #0x1f
	umull ip, fp, r7, r3
	mla fp, r7, r2, fp
	ldr r2, [sp, #0x90]
	ldr r4, [r1, #0x24]
	mla fp, r2, r3, fp
	smlal ip, fp, r8, lr
	smlal ip, fp, r6, r4
	ldr sb, [r1, #0x34]
	smlal ip, fp, r5, sb
	mov r2, ip, lsr #0xc
	orr r2, r2, fp, lsl #20
	str r2, [sl, #0x24]
	ldr r2, [r1, #0x1c]
	ldr lr, [r1, #0xc]
	str r2, [sp, #0x4c]
	ldr r3, [sp, #0x4c]
	mov r2, r2, asr #0x1f
	umull ip, fp, r7, r3
	mla fp, r7, r2, fp
	ldr r2, [sp, #0x90]
	ldr r4, [r1, #0x2c]
	mla fp, r2, r3, fp
	smlal ip, fp, r8, lr
	smlal ip, fp, r6, r4
	ldr sb, [r1, #0x3c]
	smlal ip, fp, r5, sb
	mov r2, ip, lsr #0xc
	orr r2, r2, fp, lsl #20
	str r2, [sl, #0x2c]
	ldr fp, [r1, #0x18]
	ldr r3, [r1, #0x38]
	mov ip, fp, asr #0x1f
	str r3, [sp, #0x50]
	umull r4, r3, r7, fp
	mla r3, r7, ip, r3
	ldr r7, [sp, #0x90]
	ldr r2, [r1, #8]
	mla r3, r7, fp, r3
	smlal r4, r3, r8, r2
	ldr sb, [r1, #0x28]
	smlal r4, r3, r6, sb
	ldr r6, [sp, #0x50]
	smlal r4, r3, r5, r6
	mov r4, r4, lsr #0xc
	orr r4, r4, r3, lsl #20
	str r4, [sl, #0x28]
	ldr r4, [r0, #0x34]
	ldr r3, [r0, #0x30]
	smull r6, r5, r4, fp
	smlal r6, r5, r3, r2
	mov r2, r4, asr #0x1f
	str r2, [sp, #0x54]
	mov r2, r3, asr #0x1f
	str r2, [sp, #0x58]
	ldr r2, [r0, #0x38]
	ldr ip, [r0, #0x3c]
	smlal r6, r5, r2, sb
	ldr r0, [sp, #0x50]
	smlal r6, r5, ip, r0
	mov r0, r6, lsr #0xc
	orr r0, r0, r5, lsl #20
	str r0, [sl, #0x38]
	mov r0, r2, asr #0x1f
	str r0, [sp, #0x5c]
	mov r0, ip, asr #0x1f
	str r0, [sp, #0x60]
	ldr r8, [r1, #0x24]
	ldr r7, [r1, #4]
	mov r0, r8, asr #0x1f
	ldr sb, [r1, #0x34]
	str r0, [sp, #0x98]
	mov r0, r7, asr #0x1f
	ldr r6, [r1, #0x14]
	str r0, [sp, #0x6c]
	mov r0, r6, asr #0x1f
	str r0, [sp, #0x70]
	umull r0, fp, ip, sb
	mov lr, sb, asr #0x1f
	str r0, [sp, #0x64]
	mla fp, ip, lr, fp
	ldr r0, [sp, #0x60]
	add r5, sp, #0xa8
	mla fp, r0, sb, fp
	umull r0, sb, r2, r8
	str r0, [sp, #0x94]
	ldr r0, [sp, #0x98]
	mla sb, r2, r0, sb
	ldr r0, [sp, #0x5c]
	mla sb, r0, r8, sb
	umull r0, r8, r3, r7
	str r0, [sp, #0x68]
	ldr r0, [sp, #0x6c]
	mla r8, r3, r0, r8
	ldr r0, [sp, #0x58]
	mla r8, r0, r7, r8
	umull r7, lr, r4, r6
	ldr r0, [sp, #0x68]
	adds r7, r0, r7
	ldr r0, [sp, #0x70]
	mla lr, r4, r0, lr
	ldr r0, [sp, #0x54]
	mla lr, r0, r6, lr
	ldr r0, [sp, #0x94]
	adc r6, r8, lr
	adds r7, r0, r7
	ldr r0, [sp, #0x64]
	adc r6, sb, r6
	adds r7, r0, r7
	adc r0, fp, r6
	mov r6, r7, lsr #0xc
	orr r6, r6, r0, lsl #20
	str r6, [sl, #0x34]
	ldr r8, [r1, #0x20]
	ldr sb, [r1, #0x30]
	mov r0, r8, asr #0x1f
	ldr r7, [r1]
	str r0, [sp, #0xa0]
	mov r0, r7, asr #0x1f
	ldr r6, [r1, #0x10]
	str r0, [sp, #0x7c]
	mov r0, r6, asr #0x1f
	str r0, [sp, #0x80]
	umull r0, fp, ip, sb
	mov lr, sb, asr #0x1f
	str r0, [sp, #0x74]
	mla fp, ip, lr, fp
	ldr r0, [sp, #0x60]
	mla fp, r0, sb, fp
	umull r0, sb, r2, r8
	str r0, [sp, #0x9c]
	ldr r0, [sp, #0xa0]
	mla sb, r2, r0, sb
	ldr r0, [sp, #0x5c]
	mla sb, r0, r8, sb
	umull r0, r8, r3, r7
	str r0, [sp, #0x78]
	ldr r0, [sp, #0x7c]
	mla r8, r3, r0, r8
	ldr r0, [sp, #0x58]
	mla r8, r0, r7, r8
	umull r7, lr, r4, r6
	ldr r0, [sp, #0x78]
	adds r7, r0, r7
	ldr r0, [sp, #0x80]
	mla lr, r4, r0, lr
	ldr r0, [sp, #0x54]
	mla lr, r0, r6, lr
	ldr r0, [sp, #0x9c]
	adc r6, r8, lr
	adds r7, r0, r7
	ldr r0, [sp, #0x74]
	adc r6, sb, r6
	adds r7, r0, r7
	adc r0, fp, r6
	mov r6, r7, lsr #0xc
	orr r6, r6, r0, lsl #20
	str r6, [sl, #0x30]
	ldr r8, [r1, #0x3c]
	ldr r6, [r1, #0xc]
	mov r0, r8, asr #0x1f
	str r0, [sp, #0x84]
	ldr r7, [r1, #0x2c]
	ldr fp, [sp, #0x84]
	mov r0, r7, asr #0x1f
	str r0, [sp, #0x88]
	ldr r0, [r1, #0x1c]
	mov lr, r6, asr #0x1f
	mov r1, r0, asr #0x1f
	str r1, [sp, #0xa4]
	umull sb, r1, ip, r8
	mla r1, ip, fp, r1
	ldr fp, [sp, #0x60]
	mla r1, fp, r8, r1
	ldr r8, [sp, #0x88]
	umull ip, fp, r2, r7
	mla fp, r2, r8, fp
	ldr r2, [sp, #0x5c]
	ldr r8, [sp, #0xa4]
	mla fp, r2, r7, fp
	umull r7, r2, r3, r6
	mla r2, r3, lr, r2
	ldr r3, [sp, #0x58]
	mla r2, r3, r6, r2
	umull r6, r3, r4, r0
	mla r3, r4, r8, r3
	ldr r4, [sp, #0x54]
	mla r3, r4, r0, r3
	adds r4, r7, r6
	adc r0, r2, r3
	adds r2, ip, r4
	adc r0, fp, r0
	adds r2, sb, r2
	adc r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	cmp sl, r5
	addne sp, sp, #0xe8
	str r1, [sl, #0x3c]
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, [sp]
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	str r4, [sp]
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	str r4, [sp]
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	str r4, [sp]
	add sp, sp, #0xe8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end MTX_Concat44

	arm_func_start MTX_PerspectiveW
MTX_PerspectiveW: ; 0x020CC84C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	mov r0, r1
	mov r1, r4
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	bl FX_Div
	ldr r1, [sp, #0x18]
	ldr r2, _020CC994 ; =0x04000290
	mov r3, #0
	str r3, [r2]
	mov r3, #0x1000
	str r3, [r2, #4]
	sub r1, r7, r1
	str r1, [r2, #8]
	mov r1, #0
	mov r4, r0
	str r1, [r2, #0xc]
	cmp r6, #0x1000
	beq _020CC8B4
	mul r1, r4, r6
	mov r0, r1, asr #0xb
	add r0, r1, r0, lsr #20
	mov r4, r0, asr #0xc
_020CC8B4:
	mov r1, #0
	str r1, [r5, #4]
	str r1, [r5, #8]
	str r1, [r5, #0xc]
	str r1, [r5, #0x10]
	str r4, [r5, #0x14]
	str r1, [r5, #0x18]
	str r1, [r5, #0x1c]
	str r1, [r5, #0x20]
	str r1, [r5, #0x24]
	rsb r0, r6, #0
	str r0, [r5, #0x2c]
	str r1, [r5, #0x30]
	str r1, [r5, #0x34]
	str r1, [r5, #0x3c]
	bl FX_GetDivResultFx64c
	ldr r2, _020CC994 ; =0x04000290
	mov r3, #0
	stmia r2, {r3, r4, r8}
	str r3, [r2, #0xc]
	cmp r6, #0x1000
	beq _020CC930
	mov r2, r6, asr #0x1f
	umull r4, r3, r0, r6
	mla r3, r0, r2, r3
	mla r3, r1, r6, r3
	mov r0, r4
	mov r1, r3
	mov r2, #0x1000
	mov r3, #0
	bl _ll_sdiv
_020CC930:
	ldr r4, [sp, #0x18]
	mov r2, r7, lsl #1
	add r6, r4, r7
	mov r3, r6, asr #0x1f
	umull r8, r7, r0, r6
	mla r7, r0, r3, r7
	smull r4, r3, r2, r4
	mla r7, r1, r6, r7
	adds r2, r8, #0x80000000
	adc r7, r7, #0
	adds r4, r4, #0x800
	adc r2, r3, #0
	mov r3, r4, lsr #0xc
	orr r3, r3, r2, lsl #20
	umull r6, r4, r0, r3
	mov r2, r3, asr #0x1f
	mla r4, r0, r2, r4
	mla r4, r1, r3, r4
	adds r0, r6, #0x80000000
	str r7, [r5, #0x28]
	adc r0, r4, #0
	str r0, [r5, #0x38]
	bl FX_GetDivResult
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020CC994: .word 0x04000290
	arm_func_end MTX_PerspectiveW

	arm_func_start MTX_OrthoW
MTX_OrthoW: ; 0x020CC998
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	str r2, [sp]
	mov sl, r0
	ldr r0, [sp]
	mov r2, r3
	sub r0, r2, r0
	ldr r8, [sp, #0x3c]
	str r3, [sp, #4]
	mov fp, r1
	ldr sb, [sp, #0x38]
	bl FX_InvAsync
	mov r0, #0
	str r0, [r8, #4]
	str r0, [r8, #8]
	str r0, [r8, #0xc]
	str r0, [r8, #0x10]
	str r0, [r8, #0x18]
	str r0, [r8, #0x1c]
	str r0, [r8, #0x20]
	str r0, [r8, #0x24]
	str r0, [r8, #0x2c]
	str sb, [r8, #0x3c]
	bl FX_GetDivResultFx64c
	mov r6, r1
	mov r4, r0
	ldr r1, _020CCB9C ; =0x04000290
	mov r3, #0
	mov r2, #0x1000
	str r3, [r1]
	sub r0, sl, fp
	str r2, [r1, #4]
	str r0, [r1, #8]
	mov r0, r3
	cmp sb, #0x1000
	str r0, [r1, #0xc]
	beq _020CCA48
	mov r5, sb, asr #0x1f
	umull r0, r1, r4, sb
	mla r1, r4, r5, r1
	mla r1, r6, sb, r1
	bl _ll_sdiv
	mov r4, r0
	mov r6, r1
_020CCA48:
	mov r1, r6, lsl #0xd
	mov r0, #0x80000000
	orr r1, r1, r4, lsr #19
	adds r0, r0, r4, lsl #13
	adc r0, r1, #0
	str r0, [r8]
	bl FX_GetDivResultFx64c
	mov r5, r0
	mov r7, r1
	mov r3, #0
	ldr ip, _020CCB9C ; =0x04000290
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #0x34]
	str r3, [ip]
	mov r2, #0x1000
	str r2, [ip, #4]
	sub r0, r1, r0
	mov lr, r3
	str r0, [ip, #8]
	cmp sb, #0x1000
	str lr, [ip, #0xc]
	beq _020CCABC
	mov ip, sb, asr #0x1f
	umull r0, r1, r5, sb
	mla r1, r5, ip, r1
	mla r1, r7, sb, r1
	bl _ll_sdiv
	mov r5, r0
	mov r7, r1
_020CCABC:
	mov r1, r7, lsl #0xd
	mov r0, #0x80000000
	orr r1, r1, r5, lsr #19
	adds r0, r0, r5, lsl #13
	adc r0, r1, #0
	str r0, [r8, #0x14]
	bl FX_GetDivResultFx64c
	cmp sb, #0x1000
	beq _020CCB04
	mov r2, sb, asr #0x1f
	umull ip, r3, r0, sb
	mla r3, r0, r2, r3
	mla r3, r1, sb, r3
	mov r0, ip
	mov r1, r3
	mov r2, #0x1000
	mov r3, #0
	bl _ll_sdiv
_020CCB04:
	ldr r3, [sp, #4]
	ldr r2, [sp]
	add r2, r3, r2
	rsb ip, r2, #0
	add r2, sl, fp
	rsb r3, r2, #0
	ldr sl, [sp, #0x34]
	ldr r2, [sp, #0x30]
	mov sb, ip, asr #0x1f
	add r2, sl, r2
	umull fp, sl, r4, ip
	mla sl, r4, sb, sl
	mov r4, #0x80000000
	mla sl, r6, ip, sl
	adds r4, r4, r0, lsl #13
	mov sb, r1, lsl #0xd
	mov r6, r3, asr #0x1f
	umull ip, r4, r5, r3
	mla r4, r5, r6, r4
	orr sb, sb, r0, lsr #19
	mla r4, r7, r3, r4
	adc r3, sb, #0
	str r3, [r8, #0x28]
	adds r3, fp, #0x80000000
	adc r7, sl, #0
	adds r3, ip, #0x80000000
	mov r3, r2, asr #0x1f
	umull r6, r5, r0, r2
	mla r5, r0, r3, r5
	adc r3, r4, #0
	str r7, [r8, #0x30]
	mla r5, r1, r2, r5
	adds r0, r6, #0x80000000
	str r3, [r8, #0x34]
	adc r0, r5, #0
	str r0, [r8, #0x38]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020CCB9C: .word 0x04000290
	arm_func_end MTX_OrthoW
