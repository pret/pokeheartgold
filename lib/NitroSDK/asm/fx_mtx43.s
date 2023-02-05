	.include "asm/macros.inc"
	.include "fx_mtx43.inc"
	.include "global.inc"
	.text

	arm_func_start MTX_Identity43_
MTX_Identity43_: ; 0x020CB6AC
	mov r2, #0x1000
	mov r3, #0
	stmia r0!, {r2, r3}
	mov r1, #0
	stmia r0!, {r1, r3}
	stmia r0!, {r2, r3}
	stmia r0!, {r1, r3}
	stmia r0!, {r2, r3}
	stmia r0!, {r1, r3}
	bx lr
	arm_func_end MTX_Identity43_

	arm_func_start MTX_Copy43To44_
MTX_Copy43To44_: ; 0x020CB6D4
	stmdb sp!, {r4}
	mov ip, #0
	ldmia r0!, {r2, r3, r4}
	stmia r1!, {r2, r3, r4, ip}
	ldmia r0!, {r2, r3, r4}
	stmia r1!, {r2, r3, r4, ip}
	ldmia r0!, {r2, r3, r4}
	stmia r1!, {r2, r3, r4, ip}
	mov ip, #0x1000
	ldmia r0!, {r2, r3, r4}
	stmia r1!, {r2, r3, r4, ip}
	ldmia sp!, {r4}
	bx lr
	arm_func_end MTX_Copy43To44_

	arm_func_start MTX_TransApply43
MTX_TransApply43: ; 0x020CB708
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r7, r6
	beq _020CB728
	bl MI_Copy36B
_020CB728:
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	smull r3, r2, r4, r0
	smlal r3, r2, r5, r1
	ldr r0, [sp, #0x18]
	ldr r1, [r7, #0x18]
	ldr ip, [r7, #0x24]
	smlal r3, r2, r0, r1
	mov r1, r3, lsr #0xc
	orr r1, r1, r2, lsl #20
	add r1, ip, r1
	str r1, [r6, #0x24]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #4]
	smull ip, r3, r4, r1
	smlal ip, r3, r5, r2
	ldr r1, [r7, #0x1c]
	ldr r2, [r7, #0x28]
	smlal ip, r3, r0, r1
	mov r1, ip, lsr #0xc
	orr r1, r1, r3, lsl #20
	add r1, r2, r1
	str r1, [r6, #0x28]
	ldr r1, [r7, #0x14]
	ldr r2, [r7, #8]
	smull ip, r3, r4, r1
	smlal ip, r3, r5, r2
	ldr r1, [r7, #0x20]
	ldr r2, [r7, #0x2c]
	smlal ip, r3, r0, r1
	mov r0, ip, lsr #0xc
	orr r0, r0, r3, lsl #20
	add r0, r2, r0
	str r0, [r6, #0x2c]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end MTX_TransApply43

	thumb_func_start MTX_Scale43_
MTX_Scale43_: ; 0x020CB7B4
	stmia r0!, {r1}
	mov r1, #0
	str r3, [r0, #0x1c]
	mov r3, #0
	stmia r0!, {r1, r3}
	stmia r0!, {r1, r2, r3}
	mov r2, #0
	stmia r0!, {r1, r3}
	add r0, #4
	stmia r0!, {r1, r2, r3}
	bx lr
	.align 2, 0
	thumb_func_end MTX_Scale43_

	arm_func_start MTX_ScaleApply43
MTX_ScaleApply43: ; 0x020CB7CC
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [sp, #0x10]
	mov r5, r0
	str ip, [sp]
	mov r4, r1
	bl MTX_ScaleApply33
	ldr r0, [r5, #0x24]
	str r0, [r4, #0x24]
	ldr r0, [r5, #0x28]
	str r0, [r4, #0x28]
	ldr r0, [r5, #0x2c]
	str r0, [r4, #0x2c]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end MTX_ScaleApply43

	thumb_func_start MTX_RotX43_
MTX_RotX43_: ; 0x020CB800
	str r1, [r0, #0x14]
	neg r1, r1
	str r1, [r0, #0x1c]
	mov r1, #1
	lsl r1, r1, #0xc
	stmia r0!, {r1}
	mov r3, #0
	mov r1, #0
	stmia r0!, {r1, r3}
	stmia r0!, {r1, r2}
	str r1, [r0, #4]
	add r0, #0xc
	stmia r0!, {r2, r3}
	stmia r0!, {r1, r3}
	bx lr
	.align 2, 0
	thumb_func_end MTX_RotX43_

	thumb_func_start MTX_RotY43_
MTX_RotY43_: ; 0x020CB820
	str r1, [r0, #0x18]
	mov r3, #0
	stmia r0!, {r2, r3}
	neg r1, r1
	stmia r0!, {r1, r3}
	mov r1, #1
	lsl r1, r1, #0xc
	stmia r0!, {r1, r3}
	add r0, #4
	mov r1, #0
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r1, r3}
	bx lr
	.align 2, 0
	thumb_func_end MTX_RotY43_

	arm_func_start MTX_Inverse43
MTX_Inverse43: ; 0x020CB83C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x5c
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
	addeq sp, sp, #0x5c
	subeq r0, r1, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
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
	mla r3, ip, r2, r3
	mov r0, r4, lsr #0xc
	orr r0, r0, r3, lsl #20
	str r0, [sb, #0x20]
	ldr r1, [sb, #0xc]
	ldr r0, [sl, #0x28]
	ldr r2, [sb]
	smull r5, r4, r1, r0
	ldr r0, [sl, #0x24]
	ldr r3, [sb, #0x18]
	smlal r5, r4, r2, r0
	ldr r1, [sl, #0x2c]
	add r0, sp, #0x2c
	smlal r5, r4, r3, r1
	mov r1, r5, lsr #0xc
	orr r1, r1, r4, lsl #20
	rsb r1, r1, #0
	str r1, [sb, #0x24]
	ldr r2, [sb, #0x10]
	ldr r1, [sl, #0x28]
	ldr r3, [sb, #4]
	smull r5, r4, r2, r1
	ldr r1, [sl, #0x24]
	ldr r2, [sb, #0x1c]
	smlal r5, r4, r3, r1
	ldr r1, [sl, #0x2c]
	cmp sb, r0
	smlal r5, r4, r2, r1
	mov r1, r5, lsr #0xc
	orr r1, r1, r4, lsl #20
	rsb r1, r1, #0
	str r1, [sb, #0x28]
	ldr r2, [sb, #0x14]
	ldr r1, [sl, #0x28]
	ldr r3, [sb, #8]
	smull r6, r5, r2, r1
	ldr r1, [sl, #0x24]
	ldr r4, [sb, #0x20]
	smlal r6, r5, r3, r1
	ldr r2, [sl, #0x2c]
	smlal r6, r5, r4, r2
	mov r1, r6, lsr #0xc
	orr r1, r1, r5, lsl #20
	rsb r1, r1, #0
	str r1, [sb, #0x2c]
	bne _020CBBBC
	ldr r1, [sp]
	bl MI_Copy48B
_020CBBBC:
	mov r0, #0
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end MTX_Inverse43

	arm_func_start MTX_Concat43
MTX_Concat43: ; 0x020CBBC8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	mov ip, r2
	ldr r2, [r0, #4]
	ldr r3, [r1, #0xc]
	cmp ip, r1
	smull r7, r4, r2, r3
	ldr r6, [r0]
	ldr r3, [r1]
	addeq sl, sp, #0x1c
	smlal r7, r4, r6, r3
	ldr r5, [r0, #8]
	ldr r3, [r1, #0x18]
	movne sl, ip
	smlal r7, r4, r5, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r4, lsl #20
	str r3, [sl]
	ldr r3, [r1, #0x10]
	ldr r4, [r1, #4]
	smull r8, r7, r2, r3
	smlal r8, r7, r6, r4
	ldr r3, [r1, #0x1c]
	smlal r8, r7, r5, r3
	mov r3, r8, lsr #0xc
	orr r3, r3, r7, lsl #20
	str r3, [sl, #4]
	ldr r3, [r1, #0x14]
	ldr r4, [r1, #8]
	smull r8, r7, r2, r3
	smlal r8, r7, r6, r4
	ldr r2, [r1, #0x20]
	smlal r8, r7, r5, r2
	mov r5, r8, lsr #0xc
	orr r5, r5, r7, lsl #20
	str r5, [sl, #8]
	ldr r8, [r0, #0x10]
	ldr sb, [r0, #0xc]
	smull r5, r3, r8, r3
	smlal r5, r3, sb, r4
	ldr r7, [r0, #0x14]
	mov r6, sb, asr #0x1f
	smlal r5, r3, r7, r2
	mov r2, r5, lsr #0xc
	orr r2, r2, r3, lsl #20
	str r2, [sl, #0x14]
	ldr r2, [r1, #0x10]
	ldr r3, [r1, #4]
	smull r5, r4, r8, r2
	smlal r5, r4, sb, r3
	ldr r3, [r1, #0x1c]
	mov r2, r8, asr #0x1f
	smlal r5, r4, r7, r3
	str r2, [sp, #0x14]
	mov r2, r5, lsr #0xc
	orr r2, r2, r4, lsl #20
	str r2, [sl, #0x10]
	mov r2, r7, asr #0x1f
	ldr r5, [r1]
	str r2, [sp]
	ldr r4, [r1, #0xc]
	ldr lr, [r1, #0x18]
	mov r2, r4, asr #0x1f
	str r2, [sp, #4]
	mov r2, r5, asr #0x1f
	str r2, [sp, #8]
	umull r2, r3, r7, lr
	mov fp, lr, asr #0x1f
	mla r3, r7, fp, r3
	str r2, [sp, #0xc]
	ldr r2, [sp]
	ldr r7, [sp, #8]
	mla r3, r2, lr, r3
	umull fp, r2, sb, r5
	mla r2, sb, r7, r2
	mla r2, r6, r5, r2
	ldr r6, [sp, #4]
	umull sb, r7, r8, r4
	mla r7, r8, r6, r7
	ldr r8, [sp, #0x14]
	adds r6, fp, sb
	mla r7, r8, r4, r7
	adc r7, r2, r7
	ldr r2, [sp, #0xc]
	adds r6, r2, r6
	adc r2, r3, r7
	mov r3, r6, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [sl, #0xc]
	ldr r3, [r0, #0x1c]
	ldr r6, [r0, #0x18]
	smull r7, r4, r3, r4
	smlal r7, r4, r6, r5
	ldr r2, [r0, #0x20]
	smlal r7, r4, r2, lr
	mov r5, r7, lsr #0xc
	orr r5, r5, r4, lsl #20
	str r5, [sl, #0x18]
	ldr r4, [r1, #0x10]
	ldr r5, [r1, #4]
	smull r8, r4, r3, r4
	smlal r8, r4, r6, r5
	ldr r7, [r1, #0x1c]
	smlal r8, r4, r2, r7
	mov r5, r8, lsr #0xc
	orr r5, r5, r4, lsl #20
	str r5, [sl, #0x1c]
	ldr r5, [r1, #0x14]
	ldr r4, [r1, #8]
	smull r8, r7, r3, r5
	smlal r8, r7, r6, r4
	ldr r3, [r1, #0x20]
	smlal r8, r7, r2, r3
	mov r2, r8, lsr #0xc
	orr r2, r2, r7, lsl #20
	str r2, [sl, #0x20]
	ldr r2, [r0, #0x28]
	ldr sb, [r0, #0x24]
	ldr r7, [r0, #0x2c]
	smull r5, r0, r2, r5
	smlal r5, r0, sb, r4
	smlal r5, r0, r7, r3
	mov r3, r5, lsr #0xc
	orr r3, r3, r0, lsl #20
	mov r0, r7, asr #0x1f
	str r0, [sp, #0x18]
	ldr r0, [r1, #0x2c]
	mov fp, r2, asr #0x1f
	adds r0, r0, r3
	str r0, [sl, #0x2c]
	ldr r3, [r1, #0x10]
	ldr r4, [r1, #4]
	smull r6, r3, r2, r3
	smlal r6, r3, sb, r4
	ldr r5, [r1, #0x1c]
	ldr r0, [r1, #0x28]
	smlal r6, r3, r7, r5
	mov r4, r6, lsr #0xc
	orr r4, r4, r3, lsl #20
	adds r0, r0, r4
	mov r8, sb, asr #0x1f
	str r0, [sl, #0x28]
	ldr r4, [r1]
	ldr r3, [r1, #0xc]
	umull r0, r5, sb, r4
	mov lr, r4, asr #0x1f
	mla r5, sb, lr, r5
	mov sb, r3, asr #0x1f
	str r0, [sp, #0x10]
	mla r5, r8, r4, r5
	umull r8, r0, r2, r3
	mla r0, r2, sb, r0
	ldr r4, [sp, #0x10]
	mla r0, fp, r3, r0
	adds r4, r4, r8
	adc r2, r5, r0
	ldr r6, [r1, #0x18]
	ldr r8, [r1, #0x24]
	mov r1, r6, asr #0x1f
	umull r5, r3, r7, r6
	mla r3, r7, r1, r3
	adds r1, r5, r4
	ldr r0, [sp, #0x18]
	mov r1, r1, lsr #0xc
	mla r3, r0, r6, r3
	adc r0, r3, r2
	orr r1, r1, r0, lsl #20
	adds r0, r8, r1
	add r4, sp, #0x1c
	cmp sl, r4
	addne sp, sp, #0x4c
	str r0, [sl, #0x24]
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldmia r4!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia r4!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end MTX_Concat43

	arm_func_start MTX_MultVec43
MTX_MultVec43: ; 0x020CBE9C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, [r1, #0xc]
	ldmia r0, {r3, ip}
	smull r6, r5, ip, r4
	ldr r4, [r1]
	ldr r0, [r0, #8]
	smlal r6, r5, r3, r4
	ldr r4, [r1, #0x18]
	smlal r6, r5, r0, r4
	mov r6, r6, lsr #0xc
	orr r6, r6, r5, lsl #20
	str r6, [r2]
	ldr r4, [r1, #0x24]
	add r4, r6, r4
	str r4, [r2]
	ldr r4, [r1, #0x10]
	ldr r5, [r1, #4]
	smull r6, lr, ip, r4
	smlal r6, lr, r3, r5
	ldr r4, [r1, #0x1c]
	smlal r6, lr, r0, r4
	mov r5, r6, lsr #0xc
	orr r5, r5, lr, lsl #20
	str r5, [r2, #4]
	ldr r4, [r1, #0x28]
	add r4, r5, r4
	str r4, [r2, #4]
	ldr lr, [r1, #0x14]
	ldr r4, [r1, #8]
	smull r5, lr, ip, lr
	smlal r5, lr, r3, r4
	ldr r3, [r1, #0x20]
	smlal r5, lr, r0, r3
	mov r3, r5, lsr #0xc
	orr r3, r3, lr, lsl #20
	str r3, [r2, #8]
	ldr r0, [r1, #0x2c]
	add r0, r3, r0
	str r0, [r2, #8]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end MTX_MultVec43

	arm_func_start MTX_LookAt
MTX_LookAt: ; 0x020CBF3C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	mov r6, r0
	ldr r5, [r6]
	ldr r4, [r2]
	add r0, sp, #0x18
	sub r4, r5, r4
	str r4, [sp, #0x18]
	ldr ip, [r6, #4]
	ldr r4, [r2, #4]
	mov r5, r1
	sub r1, ip, r4
	str r1, [sp, #0x1c]
	ldr r4, [r6, #8]
	ldr r2, [r2, #8]
	mov r1, r0
	sub r2, r4, r2
	mov r4, r3
	str r2, [sp, #0x20]
	bl VEC_Normalize
	add r1, sp, #0x18
	add r2, sp, #0xc
	mov r0, r5
	bl VEC_CrossProduct
	add r0, sp, #0xc
	mov r1, r0
	bl VEC_Normalize
	add r0, sp, #0x18
	add r1, sp, #0xc
	add r2, sp, #0
	bl VEC_CrossProduct
	ldr r1, [sp, #0xc]
	mov r0, r6
	str r1, [r4]
	ldr r2, [sp]
	add r1, sp, #0xc
	str r2, [r4, #4]
	ldr r2, [sp, #0x18]
	str r2, [r4, #8]
	ldr r2, [sp, #0x10]
	str r2, [r4, #0xc]
	ldr r2, [sp, #4]
	str r2, [r4, #0x10]
	ldr r2, [sp, #0x1c]
	str r2, [r4, #0x14]
	ldr r2, [sp, #0x14]
	str r2, [r4, #0x18]
	ldr r2, [sp, #8]
	str r2, [r4, #0x1c]
	ldr r2, [sp, #0x20]
	str r2, [r4, #0x20]
	bl VEC_DotProduct
	rsb r0, r0, #0
	str r0, [r4, #0x24]
	mov r0, r6
	add r1, sp, #0
	bl VEC_DotProduct
	rsb r0, r0, #0
	str r0, [r4, #0x28]
	mov r0, r6
	add r1, sp, #0x18
	bl VEC_DotProduct
	rsb r0, r0, #0
	str r0, [r4, #0x2c]
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end MTX_LookAt
