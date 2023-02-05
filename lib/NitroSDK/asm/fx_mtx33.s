	.include "asm/macros.inc"
	.include "fx_mtx33.inc"
	.include "global.inc"
	.text

	arm_func_start MTX_Identity33_
MTX_Identity33_: ; 0x020CAFEC
	mov r2, #0x1000
	str r2, [r0, #0x20]
	mov r3, #0
	stmia r0!, {r2, r3}
	mov r1, #0
	stmia r0!, {r1, r3}
	stmia r0!, {r2, r3}
	stmia r0!, {r1, r3}
	bx lr
	arm_func_end MTX_Identity33_

	arm_func_start MTX_ScaleApply33
MTX_ScaleApply33: ; 0x020CB010
	stmdb sp!, {r4, lr}
	ldr r4, [r0]
	ldr ip, [sp, #8]
	smull lr, r4, r2, r4
	mov lr, lr, lsr #0xc
	orr lr, lr, r4, lsl #20
	str lr, [r1]
	ldr r4, [r0, #4]
	smull lr, r4, r2, r4
	mov lr, lr, lsr #0xc
	orr lr, lr, r4, lsl #20
	str lr, [r1, #4]
	ldr lr, [r0, #8]
	smull r4, lr, r2, lr
	mov r2, r4, lsr #0xc
	orr r2, r2, lr, lsl #20
	str r2, [r1, #8]
	ldr r2, [r0, #0xc]
	smull lr, r2, r3, r2
	mov lr, lr, lsr #0xc
	orr lr, lr, r2, lsl #20
	str lr, [r1, #0xc]
	ldr r2, [r0, #0x10]
	smull lr, r2, r3, r2
	mov lr, lr, lsr #0xc
	orr lr, lr, r2, lsl #20
	str lr, [r1, #0x10]
	ldr r2, [r0, #0x14]
	smull lr, r2, r3, r2
	mov r3, lr, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [r1, #0x14]
	ldr r2, [r0, #0x18]
	smull r3, r2, ip, r2
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [r1, #0x18]
	ldr r2, [r0, #0x1c]
	smull r3, r2, ip, r2
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [r1, #0x1c]
	ldr r0, [r0, #0x20]
	smull r2, r0, ip, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [r1, #0x20]
	ldmia sp!, {r4, pc}
	arm_func_end MTX_ScaleApply33

	thumb_func_start MTX_RotX33_
MTX_RotX33_: ; 0x020CB0D0
	mov r3, #1
	lsl r3, r3, #0xc
	str r3, [r0]
	mov r3, #0
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	neg r1, r1
	str r1, [r0, #0x1c]
	str r2, [r0, #0x20]
	bx lr
	thumb_func_end MTX_RotX33_

	thumb_func_start MTX_RotY33_
MTX_RotY33_: ; 0x020CB0EC
	str r2, [r0]
	str r2, [r0, #0x20]
	mov r3, #0
	str r3, [r0, #4]
	str r3, [r0, #0xc]
	str r3, [r0, #0x14]
	str r3, [r0, #0x1c]
	neg r2, r1
	mov r3, #1
	lsl r3, r3, #0xc
	str r1, [r0, #0x18]
	str r2, [r0, #8]
	str r3, [r0, #0x10]
	bx lr
	thumb_func_end MTX_RotY33_

	thumb_func_start MTX_RotZ33_
MTX_RotZ33_: ; 0x020CB108
	stmia r0!, {r2}
	mov r3, #0
	stmia r0!, {r1, r3}
	neg r1, r1
	stmia r0!, {r1, r2}
	mov r1, #1
	lsl r1, r1, #0xc
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end MTX_RotZ33_

	arm_func_start MTX_Inverse33
MTX_Inverse33: ; 0x020CB120
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x50
	mov sl, r0
	ldr r0, [sl, #0x14]
	cmp sl, r1
	addeq sb, sp, #0x2c
	ldr r3, [sl, #0x18]
	ldr r2, [sl, #0xc]
	ldr r6, [sl, #0x20]
	str r1, [sp]
	movne sb, r1
	smull fp, r8, r2, r6
	smull r7, r1, r0, r3
	subs r7, fp, r7
	sbc ip, r8, r1
	ldr r4, [sl, #0x10]
	ldr r5, [sl, #0x1c]
	adds r1, r7, #0x800
	smull fp, r8, r4, r6
	smull r7, r6, r0, r5
	adc r0, ip, #0
	subs r7, fp, r7
	sbc r6, r8, r6
	mov r8, r1, lsr #0xc
	orr r8, r8, r0, lsl #20
	smull r1, r0, r2, r5
	adds r7, r7, #0x800
	smull r5, r3, r4, r3
	adc r2, r6, #0
	mov r7, r7, lsr #0xc
	orr r7, r7, r2, lsl #20
	subs r1, r1, r5
	sbc r5, r0, r3
	ldr r2, [sl]
	adds r6, r1, #0x800
	ldr fp, [sl, #4]
	smull r4, r3, r2, r7
	smull r1, r0, fp, r8
	adc r2, r5, #0
	mov r6, r6, lsr #0xc
	orr r6, r6, r2, lsl #20
	subs r2, r4, r1
	ldr r1, [sl, #8]
	sbc r0, r3, r0
	smlal r2, r0, r1, r6
	adds r1, r2, #0x800
	adc r2, r0, #0
	mov r0, r1, lsr #0xc
	mov r1, r8, asr #0x1f
	str r1, [sp, #4]
	mov r1, r7, asr #0x1f
	str r1, [sp, #8]
	mov r1, r6, asr #0x1f
	str r1, [sp, #0xc]
	orrs r0, r0, r2, lsl #20
	mov r1, #0
	addeq sp, sp, #0x50
	subeq r0, r1, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl FX_InvAsync
	ldr r1, [sl, #8]
	ldr r2, [sl, #0x1c]
	ldr fp, [sl, #0x10]
	smull r0, r4, r2, r1
	smull r3, r2, fp, r1
	ldr r5, [sl, #0x18]
	str r2, [sp, #0x18]
	str r3, [sp, #0x14]
	smull r3, r2, r5, r1
	str r2, [sp, #0x20]
	ldr r2, [sl, #0x20]
	str r3, [sp, #0x1c]
	str r2, [sp, #0x10]
	ldr r5, [sp, #0x10]
	ldmia sl, {r3, lr}
	smull ip, r5, lr, r5
	subs r0, ip, r0
	ldr r2, [sl, #0xc]
	sbc r4, r5, r4
	smull r1, r5, r2, r1
	str r5, [sp, #0x28]
	mov r5, r0, lsr #0xc
	ldr fp, [sl, #0x14]
	orr r5, r5, r4, lsl #20
	smull r4, r2, lr, fp
	ldr r0, [sp, #0x14]
	subs r4, r4, r0
	ldr r0, [sp, #0x18]
	mov r4, r4, lsr #0xc
	sbc r0, r2, r0
	orr r4, r4, r0, lsl #20
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	smull ip, r0, r3, r0
	subs r2, ip, r2
	ldr ip, [sp, #0x20]
	sbc r0, r0, ip
	smull ip, fp, r3, fp
	ldr r3, [sp, #0x28]
	subs r1, ip, r1
	sbc r3, fp, r3
	mov fp, r2, lsr #0xc
	orr fp, fp, r0, lsl #20
	mov r0, r1, lsr #0xc
	orr r0, r0, r3, lsl #20
	str r0, [sp, #0x24]
	bl FX_GetDivResult
	smull r2, r1, r0, r5
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	rsb lr, r2, #0
	smull r2, r1, r0, r4
	mov r4, r2, lsr #0xc
	orr r4, r4, r1, lsl #20
	smull r2, r1, r0, fp
	mov r3, r2, lsr #0xc
	orr r3, r3, r1, lsl #20
	ldr r1, [sp, #0x24]
	umull fp, r5, r0, r7
	smull r2, r1, r0, r1
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	ldr r1, [sp, #8]
	mov ip, r0, asr #0x1f
	mla r5, r0, r1, r5
	mla r5, ip, r7, r5
	mov r1, fp, lsr #0xc
	orr r1, r1, r5, lsl #20
	stmia sb, {r1, lr}
	str r4, [sb, #8]
	ldr r1, [sp, #4]
	umull r5, r4, r0, r8
	mla r4, r0, r1, r4
	mla r4, ip, r8, r4
	mov r1, r5, lsr #0xc
	orr r1, r1, r4, lsl #20
	rsb r1, r1, #0
	str r1, [sb, #0xc]
	ldr r1, [sp, #0xc]
	rsb r2, r2, #0
	str r3, [sb, #0x10]
	str r2, [sb, #0x14]
	umull r3, r2, r0, r6
	mla r2, r0, r1, r2
	mla r2, ip, r6, r2
	mov r1, r3, lsr #0xc
	orr r1, r1, r2, lsl #20
	str r1, [sb, #0x18]
	ldr r3, [sl]
	ldr r1, [sl, #0x1c]
	ldr r2, [sl, #0x18]
	smull r5, r4, r3, r1
	ldr r1, [sl, #4]
	smull r3, r1, r2, r1
	subs r2, r5, r3
	sbc r1, r4, r1
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	smull r2, r1, r0, r2
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	rsb r1, r2, #0
	str r1, [sb, #0x1c]
	ldr r4, [sl]
	ldr r3, [sl, #0x10]
	ldr r2, [sl, #0xc]
	ldr r1, [sl, #4]
	smull r6, r5, r4, r3
	smull r3, r1, r2, r1
	subs r2, r6, r3
	sbc r1, r5, r1
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	mov r1, r2, asr #0x1f
	umull r4, r3, r0, r2
	mla r3, r0, r1, r3
	add r0, sp, #0x2c
	mla r3, ip, r2, r3
	mov r1, r4, lsr #0xc
	orr r1, r1, r3, lsl #20
	str r1, [sb, #0x20]
	cmp sb, r0
	bne _020CB404
	ldr r1, [sp]
	bl MI_Copy36B
_020CB404:
	mov r0, #0
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end MTX_Inverse33

	arm_func_start MTX_Concat33
MTX_Concat33: ; 0x020CB410
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	mov ip, r2
	ldr r3, [r0, #4]
	ldr r2, [r1, #0xc]
	cmp ip, r1
	smull r7, r5, r3, r2
	ldr r6, [r0]
	ldr r4, [r1]
	addeq sl, sp, #0x1c
	smlal r7, r5, r6, r4
	ldr r2, [r0, #8]
	ldr r4, [r1, #0x18]
	movne sl, ip
	smlal r7, r5, r2, r4
	mov r4, r7, lsr #0xc
	orr r4, r4, r5, lsl #20
	str r4, [sl]
	ldr r4, [r1, #0x10]
	ldr r5, [r1, #4]
	smull r8, r7, r3, r4
	smlal r8, r7, r6, r5
	ldr r4, [r1, #0x1c]
	smlal r8, r7, r2, r4
	mov r4, r8, lsr #0xc
	orr r4, r4, r7, lsl #20
	str r4, [sl, #4]
	ldr r4, [r1, #0x14]
	ldr r5, [r1, #8]
	smull r8, r7, r3, r4
	smlal r8, r7, r6, r5
	ldr r3, [r1, #0x20]
	smlal r8, r7, r2, r3
	mov r2, r8, lsr #0xc
	orr r2, r2, r7, lsl #20
	str r2, [sl, #8]
	ldr sb, [r0, #0x10]
	ldr r2, [r0, #0xc]
	smull r7, r6, sb, r4
	smlal r7, r6, r2, r5
	ldr r4, [r0, #0x14]
	smlal r7, r6, r4, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r6, lsl #20
	str r3, [sl, #0x14]
	ldr r3, [r1, #0x10]
	ldr r5, [r1, #4]
	smull r7, r6, sb, r3
	smlal r7, r6, r2, r5
	ldr r5, [r1, #0x1c]
	mov r3, sb, asr #0x1f
	smlal r7, r6, r4, r5
	str r3, [sp]
	mov r3, r7, lsr #0xc
	orr r3, r3, r6, lsl #20
	str r3, [sl, #0x10]
	mov r3, r2, asr #0x1f
	str r3, [sp, #4]
	mov r3, r4, asr #0x1f
	ldr r8, [r1, #0xc]
	str r3, [sp, #8]
	mov r3, r8, asr #0x1f
	str r3, [sp, #0x18]
	ldr r7, [r1]
	ldr r6, [r1, #0x18]
	mov r3, r7, asr #0x1f
	str r3, [sp, #0xc]
	umull r3, r5, r4, r6
	mov fp, r6, asr #0x1f
	str r3, [sp, #0x10]
	mla r5, r4, fp, r5
	ldr r3, [sp, #8]
	add lr, sp, #0x1c
	mla r5, r3, r6, r5
	umull r3, r4, r2, r7
	str r3, [sp, #0x14]
	ldr r3, [sp, #0xc]
	mla r4, r2, r3, r4
	ldr r2, [sp, #4]
	umull r3, fp, sb, r8
	mla r4, r2, r7, r4
	ldr r2, [sp, #0x14]
	adds r3, r2, r3
	ldr r2, [sp, #0x18]
	mla fp, sb, r2, fp
	ldr r2, [sp]
	mla fp, r2, r8, fp
	adc r4, r4, fp
	ldr r2, [sp, #0x10]
	ldr fp, [sp, #0x18]
	adds r3, r2, r3
	adc r2, r5, r4
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [sl, #0xc]
	ldr r2, [r0, #0x1c]
	ldr r5, [r0, #0x18]
	ldr r4, [r0, #0x20]
	umull r3, r0, r2, r8
	mla r0, r2, fp, r0
	mov sb, r2, asr #0x1f
	mla r0, sb, r8, r0
	smlal r3, r0, r5, r7
	smlal r3, r0, r4, r6
	mov r3, r3, lsr #0xc
	orr r3, r3, r0, lsl #20
	str r3, [sl, #0x18]
	ldr r0, [r1, #0x10]
	ldr r3, [r1, #4]
	smull r7, r0, r2, r0
	cmp sl, lr
	smlal r7, r0, r5, r3
	ldr r6, [r1, #0x1c]
	addne sp, sp, #0x40
	smlal r7, r0, r4, r6
	mov r3, r7, lsr #0xc
	orr r3, r3, r0, lsl #20
	str r3, [sl, #0x1c]
	ldr r0, [r1, #0x14]
	ldr r6, [r1, #0x20]
	ldr r3, [r1, #8]
	smull r1, r0, r2, r0
	smlal r1, r0, r5, r3
	smlal r1, r0, r4, r6
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sl, #0x20]
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldr r0, [lr]
	str r0, [ip]
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end MTX_Concat33

	arm_func_start MTX_MultVec33
MTX_MultVec33: ; 0x020CB630
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, [r1, #0xc]
	ldmia r0, {r3, ip}
	smull r6, r5, ip, r4
	ldr r4, [r1]
	ldr r0, [r0, #8]
	smlal r6, r5, r3, r4
	ldr r4, [r1, #0x18]
	smlal r6, r5, r0, r4
	mov r4, r6, lsr #0xc
	orr r4, r4, r5, lsl #20
	str r4, [r2]
	ldr r4, [r1, #0x10]
	ldr r5, [r1, #4]
	smull r6, lr, ip, r4
	smlal r6, lr, r3, r5
	ldr r4, [r1, #0x1c]
	smlal r6, lr, r0, r4
	mov r4, r6, lsr #0xc
	orr r4, r4, lr, lsl #20
	str r4, [r2, #4]
	ldr lr, [r1, #0x14]
	ldr r4, [r1, #8]
	smull r5, lr, ip, lr
	smlal r5, lr, r3, r4
	ldr r1, [r1, #0x20]
	smlal r5, lr, r0, r1
	mov r0, r5, lsr #0xc
	orr r0, r0, lr, lsl #20
	str r0, [r2, #8]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end MTX_MultVec33
