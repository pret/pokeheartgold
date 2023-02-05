	.include "asm/macros.inc"
	.include "overlay_13_arm_2.inc"
	.include "global.inc"

	.text

	arm_func_start ov13_02226F58
ov13_02226F58: ; 0x02226F58
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, #0xc
	mov r1, #4
	bl ov13_0224128C
	ldr r2, _02227018 ; =ov13_0224F464
	mov r1, #0x47
	str r0, [r2]
	strb r4, [r0, #8]
	mov r0, #0
	bl ov13_02240184
	ldr lr, _02227018 ; =ov13_0224F464
	ldr r1, _0222701C ; =ov13_02244EB0
	ldr r2, [lr]
	ldrb r4, [r1, r4]
	str r0, [r2, #4]
	ldr r0, [lr]
	ldr ip, _02227020 ; =0xFE00FF00
	ldr r5, [r0, #4]
	ldr r1, _02227024 ; =ov13_02227064
	ldrh r3, [r5, #4]
	mov r0, #1
	mov r2, #0
	bic r3, r3, #0xc00
	orr r3, r3, #0x400
	strh r3, [r5, #4]
	ldr r5, [lr]
	mov r3, #0x78
	ldr r6, [r5, #4]
	ldr r5, [r6]
	bic r5, r5, #0xc00
	str r5, [r6]
	ldrh r5, [r6, #4]
	bic r5, r5, #0xf000
	orr r4, r5, r4, lsl #12
	strh r4, [r6, #4]
	ldr r4, [lr]
	ldr r4, [r4, #4]
	ldr lr, [r4]
	and ip, lr, ip
	orr ip, ip, #0x8b
	orr ip, ip, #0xe60000
	str ip, [r4]
	bl ov13_02242528
	ldr r1, _02227018 ; =ov13_0224F464
	ldr r1, [r1]
	str r0, [r1]
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02227018: .word ov13_0224F464
_0222701C: .word ov13_02244EB0
_02227020: .word 0xFE00FF00
_02227024: .word ov13_02227064
	arm_func_end ov13_02226F58

	arm_func_start ov13_02227028
ov13_02227028: ; 0x02227028
	stmdb sp!, {r3, lr}
	ldr r1, _0222705C ; =ov13_0224F464
	mov r0, #1
	ldr r1, [r1]
	ldr r1, [r1]
	bl ov13_022425F0
	ldr r0, _0222705C ; =ov13_0224F464
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov13_02241D98
	ldr r0, _02227060 ; =ov13_0224F464
	bl ov13_022412B0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222705C: .word ov13_0224F464
_02227060: .word ov13_0224F464
	arm_func_end ov13_02227028

	arm_func_start ov13_02227064
ov13_02227064: ; 0x02227064
	stmdb sp!, {r3, lr}
	ldr r0, _02227124 ; =ov13_0224F464
	mov r1, #0x28
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	add r0, r0, #1
	bl FX_ModS32
	ldr r2, _02227124 ; =ov13_0224F464
	mov r1, #5
	ldr r3, [r2]
	strb r0, [r3, #9]
	ldr r0, [r2]
	ldrb r0, [r0, #9]
	bl FX_DivS32
	ldr r2, _02227124 ; =ov13_0224F464
	add r1, r0, #0x47
	ldr r2, [r2]
	mov r0, #0
	ldr r2, [r2, #4]
	bl ov13_022400F0
	ldr r1, _02227124 ; =ov13_0224F464
	ldr ip, _02227128 ; =ov13_02244EB0
	ldr r2, [r1]
	ldr r0, _0222712C ; =0xFE00FF00
	ldr r3, [r2, #4]
	ldrh r2, [r3, #4]
	bic r2, r2, #0xc00
	orr r2, r2, #0x400
	strh r2, [r3, #4]
	ldr r2, [r1]
	ldrb lr, [r2, #8]
	ldr r3, [r2, #4]
	ldr r2, [r3]
	ldrb ip, [ip, lr]
	bic r2, r2, #0xc00
	str r2, [r3]
	ldrh r2, [r3, #4]
	bic r2, r2, #0xf000
	orr r2, r2, ip, lsl #12
	strh r2, [r3, #4]
	ldr r1, [r1]
	ldr r2, [r1, #4]
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x8b
	orr r0, r0, #0xe60000
	str r0, [r2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02227124: .word ov13_0224F464
_02227128: .word ov13_02244EB0
_0222712C: .word 0xFE00FF00
	arm_func_end ov13_02227064

	arm_func_start ov13_02227130
ov13_02227130: ; 0x02227130
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _02227218 ; =ov13_02244EE0
	mov r5, r0
	mov r0, #0x1c
	mov r1, #4
	ldrb r8, [r2, r5]
	bl ov13_0224128C
	ldr r4, _0222721C ; =ov13_0224F468
	mvn r7, #1
	str r0, [r4]
	strb r7, [r0, #0x16]
	ldr r0, [r4]
	cmp r8, #0
	strb r5, [r0, #0x17]
	mov sb, #0
	ble _022271BC
	ldr r0, _02227220 ; =ov13_02244EC4
	mov r6, sb
	add sl, r0, r5, lsl #1
	mov r5, #1
	mov fp, r5
_02227184:
	ldrb r1, [sl], #1
	mov r0, r6
	mov r2, r5
	bl ov13_022401B0
	ldr r1, [r4]
	mov r2, fp
	str r0, [r1, sb, lsl #2]
	ldr r0, [r4]
	add r1, r7, #1
	ldr r0, [r0, sb, lsl #2]
	bl ov13_02240008
	add sb, sb, #1
	cmp sb, r8
	blt _02227184
_022271BC:
	mov r1, #1
	mov r2, r1
	mov r0, #0
	bl ov13_022401B0
	ldr r3, _0222721C ; =ov13_0224F468
	mvn r1, #0
	ldr r4, [r3]
	mov r2, #1
	str r0, [r4, #8]
	ldr r0, [r3]
	ldr r0, [r0, #8]
	bl ov13_02240008
	mov r0, #0xc0
	bl ov13_022272FC
	mov r0, #0
	ldr r1, _02227224 ; =ov13_02227390
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0222721C ; =ov13_0224F468
	ldr r1, [r1]
	str r0, [r1, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02227218: .word ov13_02244EE0
_0222721C: .word ov13_0224F468
_02227220: .word ov13_02244EC4
_02227224: .word ov13_02227390
	arm_func_end ov13_02227130

	arm_func_start ov13_02227228
ov13_02227228: ; 0x02227228
	ldr r0, _0222724C ; =ov13_0224F468
	mov r3, #1
	ldr r2, [r0]
	ldr ip, _02227250 ; =ov13_022425C8
	strb r3, [r2, #0x19]
	ldr r0, [r0]
	ldr r1, _02227254 ; =ov13_022275D8
	ldr r0, [r0, #0xc]
	bx ip
	.balign 4, 0
_0222724C: .word ov13_0224F468
_02227250: .word ov13_022425C8
_02227254: .word ov13_022275D8
	arm_func_end ov13_02227228

	arm_func_start ov13_02227258
ov13_02227258: ; 0x02227258
	ldr r0, _02227268 ; =ov13_0224F468
	ldr r0, [r0]
	ldrsb r0, [r0, #0x16]
	bx lr
	.balign 4, 0
_02227268: .word ov13_0224F468
	arm_func_end ov13_02227258

	arm_func_start ov13_0222726C
ov13_0222726C: ; 0x0222726C
	ldr r2, _02227288 ; =ov13_0224F468
	mvn r1, #0
	ldr r3, [r2]
	ldrsb r2, [r3, #0x16]
	cmp r2, r1
	streqb r0, [r3, #0x16]
	bx lr
	.balign 4, 0
_02227288: .word ov13_0224F468
	arm_func_end ov13_0222726C

	arm_func_start ov13_0222728C
ov13_0222728C: ; 0x0222728C
	ldr r1, _0222729C ; =ov13_0224F468
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	bx lr
	.balign 4, 0
_0222729C: .word ov13_0224F468
	arm_func_end ov13_0222728C

	arm_func_start ov13_022272A0
ov13_022272A0: ; 0x022272A0
	ldr r0, _022272C8 ; =ov13_0224F468
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	bxeq lr
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.balign 4, 0
_022272C8: .word ov13_0224F468
	arm_func_end ov13_022272A0

	arm_func_start ov13_022272CC
ov13_022272CC: ; 0x022272CC
	ldr r0, _022272E0 ; =ov13_0224F468
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x18]
	bx lr
	.balign 4, 0
_022272E0: .word ov13_0224F468
	arm_func_end ov13_022272CC

	arm_func_start ov13_022272E4
ov13_022272E4: ; 0x022272E4
	ldr r0, _022272F8 ; =ov13_0224F468
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x18]
	bx lr
	.balign 4, 0
_022272F8: .word ov13_0224F468
	arm_func_end ov13_022272E4

	arm_func_start ov13_022272FC
ov13_022272FC: ; 0x022272FC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _02227380 ; =ov13_0224F468
	mov r8, r0
	ldr r0, [r1]
	ldr r1, _02227384 ; =ov13_02244EE0
	ldrb r2, [r0, #0x17]
	ldr r0, [r0, #8]
	mov r3, r8
	ldrb r6, [r1, r2]
	mvn r1, #0
	mov r2, #0
	bl ov13_0223FF18
	mov r7, #0
	cmp r6, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r4, _02227388 ; =ov13_02244ED2
	ldr sl, _0222738C ; =ov13_02244EBC
	ldr sb, _02227380 ; =ov13_0224F468
	mvn r5, #0
_02227348:
	ldr r0, [sb]
	mov r1, r5
	ldrb r2, [r0, #0x17]
	ldr r0, [r0, r7, lsl #2]
	add r3, r8, #4
	add r2, r4, r2, lsl #1
	ldrb r2, [r7, r2]
	mov r2, r2, lsl #2
	ldrh r2, [sl, r2]
	bl ov13_0223FF18
	add r7, r7, #1
	cmp r7, r6
	blt _02227348
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_02227380: .word ov13_0224F468
_02227384: .word ov13_02244EE0
_02227388: .word ov13_02244ED2
_0222738C: .word ov13_02244EBC
	arm_func_end ov13_022272FC

	arm_func_start ov13_02227390
ov13_02227390: ; 0x02227390
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022273F4 ; =ov13_0224F468
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0, #8]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp]
	sub r0, r0, #4
	str r0, [sp]
	bl ov13_022272FC
	ldr r0, [sp]
	cmp r0, #0xa8
	addgt sp, sp, #8
	ldmgtia sp!, {r4, pc}
	mov r0, #0xa8
	bl ov13_022272FC
	ldr r1, _022273F8 ; =ov13_022273FC
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022273F4: .word ov13_0224F468
_022273F8: .word ov13_022273FC
	arm_func_end ov13_02227390

	arm_func_start ov13_022273FC
ov13_022273FC: ; 0x022273FC
	stmdb sp!, {r3, lr}
	ldr r1, _02227444 ; =ov13_0224F468
	mvn r3, #0
	ldr r2, [r1]
	strb r3, [r2, #0x16]
	ldr r3, [r1]
	ldrh r2, [r3, #0x14]
	add r2, r2, #1
	strh r2, [r3, #0x14]
	ldr r3, [r1]
	ldrh r1, [r3, #0x14]
	cmp r1, #4
	ldmloia sp!, {r3, pc}
	ldr r1, _02227448 ; =ov13_0222744C
	mov r2, #0
	strh r2, [r3, #0x14]
	bl ov13_022425C8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02227444: .word ov13_0224F468
_02227448: .word ov13_0222744C
	arm_func_end ov13_022273FC

	arm_func_start ov13_0222744C
ov13_0222744C: ; 0x0222744C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r8, _022275B8 ; =ov13_0224F468
	ldr r1, _022275BC ; =ov13_02244EE0
	ldr r3, [r8]
	ldrb r2, [r3, #0x17]
	ldrb r0, [r3, #0x18]
	ldrb r6, [r1, r2]
	cmp r0, #0
	bne _022275A0
	ldrsb r1, [r3, #0x16]
	mvn r0, #0
	cmp r1, r0
	addne sp, sp, #8
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r6, #0
	mov r7, #0
	ble _022275A0
	ldr r5, _022275C0 ; =ov13_02244EBC
	ldr r4, _022275C4 ; =ov13_02244ED2
	ldr sl, _022275C8 ; =ov13_02244EB8
	add sb, sp, #0
_022274A4:
	ldr r0, [r8]
	mov r1, sl
	ldrb r0, [r0, #0x17]
	mov r2, sb
	add r0, r4, r0, lsl #1
	ldrb r0, [r7, r0]
	add r0, r5, r0, lsl #2
	bl ov13_02240E74
	mov r0, sb
	bl ov13_022417DC
	cmp r0, #0
	beq _02227594
	ldr r0, _022275B8 ; =ov13_0224F468
	ldr r3, [r0]
	ldr r0, [r3, #0x10]
	cmp r0, #0
	bne _022275A0
	ldrb r2, [r3, #0x17]
	ldr r1, _022275CC ; =ov13_02244EC4
	ldr r0, [r3, r7, lsl #2]
	add r1, r1, r2, lsl #1
	ldrb r4, [r7, r1]
	mov r1, #0
	bl ov13_0223FDE0
	mov r2, r0
	add r1, r4, #1
	mov r0, #0
	bl ov13_022400F0
	ldr r0, _022275B8 ; =ov13_0224F468
	ldr r1, _022275C4 ; =ov13_02244ED2
	ldr r0, [r0]
	ldr r2, _022275C0 ; =ov13_02244EBC
	ldrb r4, [r0, #0x17]
	ldr r3, _022275D0 ; =ov13_02244EBE
	ldr r0, [r0, r7, lsl #2]
	add r1, r1, r4, lsl #1
	ldrb r4, [r7, r1]
	mvn r1, #0
	mov r4, r4, lsl #2
	ldrh r2, [r2, r4]
	ldrh r3, [r3, r4]
	bl ov13_0223FF18
	ldr r0, _022275B8 ; =ov13_0224F468
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #1
	ldr r0, [r0, r7, lsl #2]
	bl ov13_02240008
	mov r0, #0
	ldr r1, _022275D4 ; =ov13_022276B4
	mov r2, r0
	mov r3, #0x6e
	bl ov13_02242528
	ldr r1, _022275B8 ; =ov13_0224F468
	add sp, sp, #8
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r0, [r1]
	strb r7, [r0, #0x16]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02227594:
	add r7, r7, #1
	cmp r7, r6
	blt _022274A4
_022275A0:
	ldr r0, _022275B8 ; =ov13_0224F468
	mvn r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x16]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_022275B8: .word ov13_0224F468
_022275BC: .word ov13_02244EE0
_022275C0: .word ov13_02244EBC
_022275C4: .word ov13_02244ED2
_022275C8: .word ov13_02244EB8
_022275CC: .word ov13_02244EC4
_022275D0: .word ov13_02244EBE
_022275D4: .word ov13_022276B4
	arm_func_end ov13_0222744C

	arm_func_start ov13_022275D8
ov13_022275D8: ; 0x022275D8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _02227634 ; =ov13_0224F468
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0, #8]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	bl ov13_022272FC
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldr r1, _02227638 ; =ov13_0222763C
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02227634: .word ov13_0224F468
_02227638: .word ov13_0222763C
	arm_func_end ov13_022275D8

	arm_func_start ov13_0222763C
ov13_0222763C: ; 0x0222763C
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, r0
	mov r0, #0
	bl ov13_022425D0
	ldr r0, _022276AC ; =ov13_0224F468
	ldr r0, [r0]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _02227668
	mov r0, #0
	bl ov13_022425D0
_02227668:
	ldr r4, _022276AC ; =ov13_0224F468
	mov r5, #0
_02227670:
	ldr r0, [r4]
	ldr r0, [r0, r5, lsl #2]
	cmp r0, #0
	beq _02227684
	bl ov13_0223FD60
_02227684:
	add r5, r5, #1
	cmp r5, #2
	blt _02227670
	ldr r0, _022276AC ; =ov13_0224F468
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov13_0223FD60
	ldr r0, _022276B0 ; =ov13_0224F468
	bl ov13_022412B0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022276AC: .word ov13_0224F468
_022276B0: .word ov13_0224F468
	arm_func_end ov13_0222763C

	arm_func_start ov13_022276B4
ov13_022276B4: ; 0x022276B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _02227798 ; =ov13_0224F468
	str r0, [sp]
	ldr r1, [r4]
	ldrh r0, [r1, #0x14]
	add r0, r0, #1
	strh r0, [r1, #0x14]
	ldr r1, [r4]
	ldrh r0, [r1, #0x14]
	cmp r0, #0x10
	ldmloia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r1, [r1, #0x17]
	ldr r0, _0222779C ; =ov13_02244EE0
	mov sb, #0
	ldrb r8, [r0, r1]
	cmp r8, #0
	ble _02227754
	ldr r7, _022277A0 ; =ov13_02244EC4
	mov r6, sb
	mov fp, sb
	mvn r5, #0
_02227708:
	ldr r0, [r4]
	mov r1, r6
	ldrb r2, [r0, #0x17]
	ldr r0, [r0, sb, lsl #2]
	add r2, r7, r2, lsl #1
	ldrb sl, [sb, r2]
	bl ov13_0223FDE0
	mov r2, r0
	mov r1, sl
	mov r0, fp
	bl ov13_022400F0
	ldr r0, [r4]
	mov r1, r5
	ldr r0, [r0, sb, lsl #2]
	mov r2, #1
	bl ov13_02240008
	add sb, sb, #1
	cmp sb, r8
	blt _02227708
_02227754:
	mov r0, #0xa8
	bl ov13_022272FC
	ldr r1, _02227798 ; =ov13_0224F468
	mov r0, #0
	ldr r2, [r1]
	sub r3, r0, #1
	strh r0, [r2, #0x14]
	ldr r2, [r1]
	strb r3, [r2, #0x16]
	ldr r2, [r1]
	ldr r1, [r2, #0x10]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sp]
	str r0, [r2, #0x10]
	bl ov13_022425D0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02227798: .word ov13_0224F468
_0222779C: .word ov13_02244EE0
_022277A0: .word ov13_02244EC4
	arm_func_end ov13_022276B4

	arm_func_start ov13_022277A4
ov13_022277A4: ; 0x022277A4
	ldr r0, _022277B4 ; =ov13_0224F46C
	mov r1, #0
	strb r1, [r0]
	bx lr
	.balign 4, 0
_022277B4: .word ov13_0224F46C
	arm_func_end ov13_022277A4

	arm_func_start ov13_022277B8
ov13_022277B8: ; 0x022277B8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r3, _02227874 ; =ov13_0224F46C
	mov r7, r0
	ldrb r0, [r3]
	mov r6, r1
	mov r5, r2
	cmp r0, #0
	addne sp, sp, #0x10
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02227878 ; =ov13_02245B20
	ldr r1, _0222787C ; =GXS_LoadBG0Scr
	bl ov13_02227924
	ldr r3, _02227880 ; =0x01920000
	ldr r2, _02227884 ; =0x04001010
	mov r0, #1
	mov r1, #0
	str r3, [r2]
	bl ov13_022408A0
	ldr r1, _02227888 ; =ov13_0224F4F8
	mov r4, r0
	ldr r0, [r1]
	mov r1, r7
	mov r2, r6
	mov r3, r5
	bl ov13_0222BAF4
	mov r5, r0
	bl ov13_02227B1C
	mov r1, #0x40
	str r1, [sp]
	mov r1, #2
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	mov r0, r4
	mov r1, #0x14
	mov r2, #0
	mov r3, #0xd8
	bl ov13_02240CC0
	mov r0, r4
	bl ov13_02240E2C
	mov r0, #1
	ldr r1, _02227874 ; =ov13_0224F46C
	strb r0, [r1]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02227874: .word ov13_0224F46C
_02227878: .word ov13_02245B20
_0222787C: .word GXS_LoadBG0Scr
_02227880: .word 0x01920000
_02227884: .word 0x04001010
_02227888: .word ov13_0224F4F8
	arm_func_end ov13_022277B8

	arm_func_start ov13_0222788C
ov13_0222788C: ; 0x0222788C
	stmdb sp!, {r3, lr}
	ldr r0, _022278C0 ; =ov13_0224F46C
	ldrb r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	bl ov13_02240B04
	ldr r0, _022278C0 ; =ov13_0224F46C
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022278C0: .word ov13_0224F46C
	arm_func_end ov13_0222788C

	arm_func_start ov13_022278C4
ov13_022278C4: ; 0x022278C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0222791C ; =ov13_0224F470
	mov r1, r4
	mov r2, #0x3f
	bl strncpy
	ldrb r0, [r4, #5]
	cmp r0, #0x78
	ldreq r0, _0222791C ; =ov13_0224F470
	ldmeqia sp!, {r4, pc}
	bl ov13_0222B970
	ldrb r1, [r4, #5]
	cmp r1, #0x79
	bne _02227908
	cmp r0, #0
	ldrne r0, _0222791C ; =ov13_0224F470
	ldmneia sp!, {r4, pc}
_02227908:
	ldr r1, _02227920 ; =ov13_02244F30
	ldrb r1, [r1, r0]
	ldr r0, _0222791C ; =ov13_0224F470
	strb r1, [r0, #5]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222791C: .word ov13_0224F470
_02227920: .word ov13_02244F30
	arm_func_end ov13_022278C4

	arm_func_start ov13_02227924
ov13_02227924: ; 0x02227924
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl ov13_022278C4
	add r1, sp, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, [sp]
	mov r4, r0
	bl DC_FlushRange
	ldr r2, [sp]
	mov r0, r4
	mov r1, #0
	blx r5
	mov r0, r4
	bl ov13_0223FA50
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov13_02227924

	arm_func_start ov13_02227964
ov13_02227964: ; 0x02227964
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	add r0, sp, #0
	mov r1, #0
	bl ov13_0222B90C
	ldr r0, [sp]
	cmp r0, #1
	bne _02227998
	mov r0, r4
	bl ov13_0223AC4C
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_02227998:
	cmp r0, #2
	addne sp, sp, #4
	ldmneia sp!, {r3, r4, pc}
	mov r0, r4
	bl ov13_0223B1E0
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov13_02227964

	arm_func_start ov13_022279B4
ov13_022279B4: ; 0x022279B4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B90C
	ldr r0, [sp]
	cmp r0, #1
	addne sp, sp, #4
	ldmneia sp!, {r3, r4, pc}
	mov r0, r4
	bl ov13_02227130
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov13_022279B4

	arm_func_start ov13_022279EC
ov13_022279EC: ; 0x022279EC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0
	mov r1, r0
	bl ov13_022408A0
	ldr r1, _02227A5C ; =ov13_0224F4F8
	mov r5, r0
	ldr r0, [r1]
	mov r1, r4
	bl ov13_0222BADC
	mov r4, r0
	bl ov13_02227B1C
	mov r1, #0x70
	str r1, [sp]
	mov r1, #2
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	mov r0, r5
	mov r1, #0xd
	mov r2, #0x28
	mov r3, #0xe6
	bl ov13_02240CC0
	mov r0, r5
	bl ov13_02240E2C
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02227A5C: .word ov13_0224F4F8
	arm_func_end ov13_022279EC

	arm_func_start ov13_02227A60
ov13_02227A60: ; 0x02227A60
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0
	mov r6, r1
	mov r1, r0
	bl ov13_022408A0
	ldr r1, _02227B0C ; =ov13_0224F4F8
	mov r4, r0
	ldr r0, [r1]
	mov r1, r6
	bl ov13_0222BADC
	mov r6, r0
	bl ov13_02227B1C
	mov r1, #0x5e
	str r1, [sp]
	mov r1, #2
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xd
	mov r2, #0x3c
	mov r3, #0xe6
	str r6, [sp, #0xc]
	bl ov13_02240CC0
	bl ov13_0222B970
	mov r6, r0
	bl ov13_0222B970
	ldr r1, _02227B10 ; =0x00000209
	mov r3, r0, lsl #2
	stmia sp, {r1, r5}
	ldr r2, _02227B14 ; =ov13_02244F16
	ldr r1, _02227B18 ; =ov13_02244F14
	mov ip, r6, lsl #2
	ldrh r2, [r2, r3]
	ldrh r1, [r1, ip]
	mov r0, r4
	mov r3, #2
	bl ov13_02240B28
	mov r0, r4
	bl ov13_02240E2C
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02227B0C: .word ov13_0224F4F8
_02227B10: .word 0x00000209
_02227B14: .word ov13_02244F16
_02227B18: .word ov13_02244F14
	arm_func_end ov13_02227A60

	arm_func_start ov13_02227B1C
ov13_02227B1C: ; 0x02227B1C
	stmdb sp!, {r3, lr}
	bl ov13_0222B970
	ldr r1, _02227B30 ; =ov13_02244EF8
	ldr r0, [r1, r0, lsl #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02227B30: .word ov13_02244EF8
	arm_func_end ov13_02227B1C

	arm_func_start ov13_02227B34
ov13_02227B34: ; 0x02227B34
	stmdb sp!, {r3, lr}
	mov r0, #0x10
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _02227B50 ; =ov13_0224F4B0
	str r0, [r1]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02227B50: .word ov13_0224F4B0
	arm_func_end ov13_02227B34

	arm_func_start ov13_02227B54
ov13_02227B54: ; 0x02227B54
	stmdb sp!, {r3, lr}
	bl ov13_02227D18
	ldr r0, _02227B68 ; =ov13_0224F4B0
	bl ov13_022412B0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02227B68: .word ov13_0224F4B0
	arm_func_end ov13_02227B54

	arm_func_start ov13_02227B6C
ov13_02227B6C: ; 0x02227B6C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r4, r0
	str r1, [sp]
	str r2, [sp, #4]
	mov fp, r3
	bl ov13_02227D18
	ldr r0, _02227C20 ; =ov13_02244F38
	mov sb, #0
	add sl, r0, r4, lsl #1
	mov r7, #1
	ldr r4, _02227C24 ; =ov13_0224F4B0
	mov r8, sb
	mvn r6, #0
	mov r5, r7
_02227BA8:
	ldrb r1, [sl], #1
	mov r0, r8
	mov r2, r7
	bl ov13_022401B0
	ldr r2, [r4]
	mov r1, r6
	str r0, [r2, sb, lsl #2]
	ldr r0, [r4]
	mov r2, r5
	ldr r0, [r0, sb, lsl #2]
	bl ov13_02240008
	add sb, sb, #1
	cmp sb, #2
	blt _02227BA8
	ldr r0, _02227C24 ; =ov13_0224F4B0
	ldr r2, [sp]
	ldr r0, [r0]
	mov r3, fp
	ldr r0, [r0]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _02227C24 ; =ov13_0224F4B0
	ldr r2, [sp, #4]
	ldr r0, [r0]
	mov r3, fp
	ldr r0, [r0, #4]
	mvn r1, #0
	bl ov13_0223FF18
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02227C20: .word ov13_02244F38
_02227C24: .word ov13_0224F4B0
	arm_func_end ov13_02227B6C

	arm_func_start ov13_02227C28
ov13_02227C28: ; 0x02227C28
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov fp, r0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov sb, #6
	bl ov13_02227D18
	mov sl, #0
	mov r7, #1
	ldr r4, _02227D14 ; =ov13_0224F4B0
	mov r8, sl
	mvn r6, #0
	mov r5, r7
_02227C60:
	mov r0, r8
	mov r1, sb
	mov r2, r7
	bl ov13_022401B0
	ldr r2, [r4]
	mov r1, r6
	str r0, [r2, sl, lsl #2]
	ldr r0, [r4]
	mov r2, r5
	ldr r0, [r0, sl, lsl #2]
	bl ov13_02240008
	add sl, sl, #1
	cmp sl, #4
	add sb, sb, #1
	blt _02227C60
	ldr r0, _02227D14 ; =ov13_0224F4B0
	ldr r3, [sp, #4]
	ldr r0, [r0]
	mov r2, fp
	ldr r0, [r0]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _02227D14 ; =ov13_0224F4B0
	ldr r2, [sp]
	ldr r0, [r0]
	ldr r3, [sp, #4]
	ldr r0, [r0, #4]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _02227D14 ; =ov13_0224F4B0
	ldr r3, [sp, #8]
	ldr r0, [r0]
	mov r2, fp
	ldr r0, [r0, #8]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _02227D14 ; =ov13_0224F4B0
	ldr r2, [sp]
	ldr r0, [r0]
	ldr r3, [sp, #8]
	ldr r0, [r0, #0xc]
	mvn r1, #0
	bl ov13_0223FF18
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02227D14: .word ov13_0224F4B0
	arm_func_end ov13_02227C28

	arm_func_start ov13_02227D18
ov13_02227D18: ; 0x02227D18
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, #0
	ldr r4, _02227D54 ; =ov13_0224F4B0
	mov r5, r6
_02227D28:
	ldr r0, [r4]
	ldr r0, [r0, r6, lsl #2]
	cmp r0, #0
	beq _02227D44
	bl ov13_0223FD60
	ldr r0, [r4]
	str r5, [r0, r6, lsl #2]
_02227D44:
	add r6, r6, #1
	cmp r6, #4
	blt _02227D28
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02227D54: .word ov13_0224F4B0
	arm_func_end ov13_02227D18

	arm_func_start ov13_02227D58
ov13_02227D58: ; 0x02227D58
	stmdb sp!, {r3, lr}
	mov r0, #0xc0
	mov r1, #4
	bl ov13_0224128C
	ldr r2, _02227DBC ; =ov13_0224F4B4
	ldr r1, _02227DC0 ; =GX_LoadBG1Char
	str r0, [r2]
	ldr r0, _02227DC4 ; =ov13_02245D54
	bl ov13_02227924
	bl ov13_0222B980
	cmp r0, #0
	beq _02227D94
	cmp r0, #1
	beq _02227DA8
	ldmia sp!, {r3, pc}
_02227D94:
	ldr r0, _02227DC8 ; =ov13_02245D04
	ldr r1, _02227DCC ; =GX_LoadBG1Scr
	ldr r0, [r0]
	bl ov13_02227924
	ldmia sp!, {r3, pc}
_02227DA8:
	ldr r0, _02227DC8 ; =ov13_02245D04
	ldr r1, _02227DCC ; =GX_LoadBG1Scr
	ldr r0, [r0, #4]
	bl ov13_02227924
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02227DBC: .word ov13_0224F4B4
_02227DC0: .word GX_LoadBG1Char
_02227DC4: .word ov13_02245D54
_02227DC8: .word ov13_02245D04
_02227DCC: .word GX_LoadBG1Scr
	arm_func_end ov13_02227D58

	arm_func_start ov13_02227DD0
ov13_02227DD0: ; 0x02227DD0
	ldr ip, _02227DDC ; =ov13_022412B0
	ldr r0, _02227DE0 ; =ov13_0224F4B4
	bx ip
	.balign 4, 0
_02227DDC: .word ov13_022412B0
_02227DE0: .word ov13_0224F4B4
	arm_func_end ov13_02227DD0

	arm_func_start ov13_02227DE4
ov13_02227DE4: ; 0x02227DE4
	stmdb sp!, {r4, lr}
	ldr r1, _02227E34 ; =ov13_02245D04
	ldr r0, [r1, r0, lsl #2]
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _02227E38 ; =ov13_0224F4B4
	mov r4, r0
	ldr r1, [r1]
	mov r2, #0xc0
	bl MIi_CpuCopyFast
	mov r0, r4
	bl ov13_0223FA50
	mov r0, #1
	ldr r1, _02227E3C ; =ov13_02227E70
	mov r2, #0
	mov r3, #0x78
	bl ov13_02242528
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02227E34: .word ov13_02245D04
_02227E38: .word ov13_0224F4B4
_02227E3C: .word ov13_02227E70
	arm_func_end ov13_02227DE4

	arm_func_start ov13_02227E40
ov13_02227E40: ; 0x02227E40
	stmdb sp!, {r3, lr}
	bl ov13_02239FF0
	ldrb r0, [r0, #0xf4]
	add r0, r0, #5
	bl ov13_02227DE4
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02227E40

	arm_func_start ov13_02227E58
ov13_02227E58: ; 0x02227E58
	stmdb sp!, {r3, lr}
	bl ov13_02239FF0
	ldrb r0, [r0, #0xf4]
	add r0, r0, #2
	bl ov13_02227DE4
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02227E58

	arm_func_start ov13_02227E70
ov13_02227E70: ; 0x02227E70
	stmdb sp!, {r4, lr}
	ldr r1, _02227EAC ; =ov13_0224F4B4
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0xc0
	bl DC_FlushRange
	ldr r0, _02227EAC ; =ov13_0224F4B4
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0xc0
	bl GX_LoadBG1Scr
	mov r1, r4
	mov r0, #1
	bl ov13_022425D0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02227EAC: .word ov13_0224F4B4
	arm_func_end ov13_02227E70

	arm_func_start ov13_02227EB0
ov13_02227EB0: ; 0x02227EB0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02227F58 ; =ov13_0224F4B8
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #0xc
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _02227F5C ; =ov13_02244F44
	ldr r2, _02227F58 ; =ov13_0224F4B8
	ldrb r1, [r1, r4, lsl #2]
	str r0, [r2]
	strb r4, [r0, #8]
	mov r0, #0
	bl ov13_02240184
	ldr lr, _02227F58 ; =ov13_0224F4B8
	ldr ip, _02227F60 ; =0xFE00FF00
	ldr r2, [lr]
	ldr r1, _02227F64 ; =ov13_02227FAC
	str r0, [r2]
	ldr r2, [lr]
	mov r0, #0
	ldr r5, [r2]
	mov r2, r0
	ldr r4, [r5]
	mov r3, #0x78
	and r4, r4, ip
	orr r4, r4, #0x26
	orr r4, r4, #0xe50000
	str r4, [r5]
	ldr ip, [lr]
	ldr lr, [ip]
	ldrh ip, [lr, #4]
	bic ip, ip, #0xc00
	orr ip, ip, #0x800
	strh ip, [lr, #4]
	bl ov13_02242528
	ldr r1, _02227F58 ; =ov13_0224F4B8
	ldr r1, [r1]
	str r0, [r1, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02227F58: .word ov13_0224F4B8
_02227F5C: .word ov13_02244F44
_02227F60: .word 0xFE00FF00
_02227F64: .word ov13_02227FAC
	arm_func_end ov13_02227EB0

	arm_func_start ov13_02227F68
ov13_02227F68: ; 0x02227F68
	stmdb sp!, {r3, lr}
	ldr r0, _02227FA4 ; =ov13_0224F4B8
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, [r0, #4]
	mov r0, #0
	bl ov13_022425F0
	ldr r0, _02227FA4 ; =ov13_0224F4B8
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov13_02241D98
	ldr r0, _02227FA8 ; =ov13_0224F4B8
	bl ov13_022412B0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02227FA4: .word ov13_0224F4B8
_02227FA8: .word ov13_0224F4B8
	arm_func_end ov13_02227F68

	arm_func_start ov13_02227FAC
ov13_02227FAC: ; 0x02227FAC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _02228044 ; =0x04000208
	mov r4, #0
	ldrh r5, [r0]
	strh r4, [r0]
	bl WM_GetAllowedChannel
	cmp r0, #0x8000
	beq _02227FD4
	bl WM_GetLinkLevel
	mov r4, r0
_02227FD4:
	ldr r2, _02228044 ; =0x04000208
	ldr r1, _02228048 ; =ov13_0224F4B8
	ldrh r0, [r2]
	ldr r3, _0222804C ; =ov13_02244F44
	mov r0, #0
	strh r5, [r2]
	ldr r2, [r1]
	ldrsb r1, [r2, #8]
	ldr r2, [r2]
	add r1, r3, r1, lsl #2
	ldrb r1, [r4, r1]
	bl ov13_022400F0
	ldr r1, _02228048 ; =ov13_0224F4B8
	ldr r0, _02228050 ; =0xFE00FF00
	ldr r2, [r1]
	ldr r3, [r2]
	ldr r2, [r3]
	and r0, r2, r0
	orr r0, r0, #0x26
	orr r0, r0, #0xe50000
	str r0, [r3]
	ldr r0, [r1]
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0x800
	strh r0, [r1, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02228044: .word 0x04000208
_02228048: .word ov13_0224F4B8
_0222804C: .word ov13_02244F44
_02228050: .word 0xFE00FF00
	arm_func_end ov13_02227FAC

	arm_func_start ov13_02228054
ov13_02228054: ; 0x02228054
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	add r5, sp, #0x1c
	mov r4, #0
	strh r4, [r5, #4]
	mov r3, #0x11
	strh r4, [r5, #6]
	mov r2, #0x12
	mov r0, #0x128
	mov r1, #4
	strh r4, [r5]
	strh r4, [r5, #2]
	strh r3, [sp, #0x20]
	strh r2, [sp, #0x22]
	bl ov13_0224128C
	ldr r8, _022283A0 ; =ov13_0224F4BC
	mov r1, #0xff
	str r0, [r8]
	strb r1, [r0, #0x11c]
	ldr r0, [r8]
	mov r6, r4
	strb r6, [r0, #0x121]
	mov r5, r4
	ldr r0, [r8]
	mov r1, #1
	strb r1, [r0, #0x123]
	ldr r0, [r8]
	ldr r7, _022283A4 ; =0xC1FFFCFF
	strb r1, [r0, #0x124]
	mov r4, #0x34
_022280CC:
	mov r0, r5
	mov r1, r4
	bl ov13_02240184
	ldr r1, [r8]
	add r1, r1, r6, lsl #2
	str r0, [r1, #0x30]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0x30]
	ldr r0, [r1]
	and r0, r0, r7
	orr r0, r0, #0x200
	str r0, [r1]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0x30]
	add r6, r6, #1
	ldrh r0, [r1, #4]
	cmp r6, #0x2f
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	blt _022280CC
	mov r6, #0
	ldr r5, _022283A8 ; =ov13_02244F5C
	ldr r8, _022283A0 ; =ov13_0224F4BC
	ldr r7, _022283A4 ; =0xC1FFFCFF
	mov r4, r6
_0222813C:
	ldrb r1, [r5], #1
	mov r0, r4
	bl ov13_02240184
	ldr r1, [r8]
	add r1, r1, r6, lsl #2
	str r0, [r1, #0xec]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0xec]
	ldr r0, [r1]
	and r0, r0, r7
	orr r0, r0, #0x200
	str r0, [r1]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0xec]
	add r6, r6, #1
	ldrh r0, [r1, #4]
	cmp r6, #4
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	blt _0222813C
	mov sl, #0
	ldr sb, _022283AC ; =ov13_02244F54
	ldr r4, _022283A0 ; =ov13_0224F4BC
	mov r8, sl
	mov r7, #1
	mvn r6, #0
	mov r5, #0x200
	mov fp, sl
_022281B8:
	ldrb r1, [sb], #1
	mov r0, r8
	mov r2, r7
	bl ov13_022401B0
	ldr r2, [r4]
	mov r1, r6
	add r2, r2, sl, lsl #2
	str r0, [r2, #0xfc]
	ldr r0, [r4]
	mov r2, r5
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #0xfc]
	mov r3, fp
	bl ov13_0223FDF4
	ldr r0, [r4]
	mov r1, r6
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #0xfc]
	mov r2, #3
	bl ov13_02240008
	add sl, sl, #1
	cmp sl, #2
	blt _022281B8
	mov sl, #0
	strh sl, [sp, #0x16]
_0222821C:
	mov sb, #0
	ldr r6, _022283B0 ; =ov13_02245D74
	ldr r4, _022283A0 ; =ov13_0224F4BC
	str sb, [sp, #0x10]
	mov fp, #2
_02228230:
	add r0, sp, #0x18
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r1, #0x1c
	mov r2, #2
	mov r3, r0
	bl ov13_02240798
	ldr r1, [r4]
	mov r2, sb, lsl #2
	add r1, r1, sl, lsl #4
	str r0, [r1, sb, lsl #2]
	mov r0, #0
	ldr r7, [sp, #0x10]
	strh r0, [sp, #0x1c]
	mov r8, r0
	add r5, r2, sl, lsl #4
_02228274:
	ldr r1, [r6, sl, lsl #2]
	mov r0, r7, lsl #1
	ldrh r1, [r1, r0]
	ldrh r0, [sp, #0x22]
	strh r1, [sp, #0x14]
	stmia sp, {r0, fp}
	mov r0, #0x480
	str r0, [sp, #8]
	add r0, sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, [r4]
	ldrh r1, [sp, #0x1c]
	ldrh r2, [sp, #0x1e]
	ldrh r3, [sp, #0x20]
	ldr r0, [r0, r5]
	bl ov13_02240CC0
	ldrh r0, [sp, #0x1c]
	add r8, r8, #1
	cmp r8, #0xc
	add r0, r0, #0x12
	add r7, r7, #1
	strh r0, [sp, #0x1c]
	blt _02228274
	cmp sl, #0
	bne _022282F4
	ldr r1, [sp, #0x18]
	mov r0, #0
	mov r2, #1
	bl ov13_0223FC04
	ldr r1, [r4]
	add r1, r1, sb, lsl #2
	str r0, [r1, #0x104]
_022282F4:
	ldr r0, [sp, #0x10]
	add sb, sb, #1
	add r0, r0, #0xc
	str r0, [sp, #0x10]
	cmp sb, #4
	blt _02228230
	add sl, sl, #1
	cmp sl, #3
	blt _0222821C
	mov r0, #0
	mov r1, #0x40
	mov r2, #1
	bl ov13_022401B0
	ldr r3, _022283A0 ; =ov13_0224F4BC
	mvn r1, #0
	ldr r4, [r3]
	mov r2, #0x200
	str r0, [r4, #0x114]
	ldr r0, [r3]
	mov r3, #0
	ldr r0, [r0, #0x114]
	bl ov13_0223FDF4
	ldr r0, _022283A0 ; =ov13_0224F4BC
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #2
	ldr r0, [r0, #0x114]
	bl ov13_02240008
	mov r0, #0
	ldr r1, _022283B4 ; =ov13_02228444
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r3, _022283A0 ; =ov13_0224F4BC
	mov r1, #0
	ldr r4, [r3]
	mov r2, #0xc0
	str r0, [r4, #0x118]
	ldr r0, [r3]
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_022283A0: .word ov13_0224F4BC
_022283A4: .word 0xC1FFFCFF
_022283A8: .word ov13_02244F5C
_022283AC: .word ov13_02244F54
_022283B0: .word ov13_02245D74
_022283B4: .word ov13_02228444
	arm_func_end ov13_02228054

	arm_func_start ov13_022283B8
ov13_022283B8: ; 0x022283B8
	stmdb sp!, {r3, lr}
	ldr r0, _022283E4 ; =ov13_0224F4BC
	ldr r0, [r0]
	ldr r0, [r0, #0x114]
	bl ov13_0223FD60
	ldr r0, _022283E4 ; =ov13_0224F4BC
	ldr r1, _022283E8 ; =ov13_022299CC
	ldr r0, [r0]
	ldr r0, [r0, #0x118]
	bl ov13_022425C8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022283E4: .word ov13_0224F4BC
_022283E8: .word ov13_022299CC
	arm_func_end ov13_022283B8

	arm_func_start ov13_022283EC
ov13_022283EC: ; 0x022283EC
	ldr r0, _022283FC ; =ov13_0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x11c]
	bx lr
	.balign 4, 0
_022283FC: .word ov13_0224F4BC
	arm_func_end ov13_022283EC

	arm_func_start ov13_02228400
ov13_02228400: ; 0x02228400
	ldr r1, _02228410 ; =ov13_0224F4BC
	ldr r1, [r1]
	strb r0, [r1, #0x123]
	bx lr
	.balign 4, 0
_02228410: .word ov13_0224F4BC
	arm_func_end ov13_02228400

	arm_func_start ov13_02228414
ov13_02228414: ; 0x02228414
	ldr r1, _02228424 ; =ov13_0224F4BC
	ldr r1, [r1]
	strb r0, [r1, #0x124]
	bx lr
	.balign 4, 0
_02228424: .word ov13_0224F4BC
	arm_func_end ov13_02228414

	arm_func_start ov13_02228428
ov13_02228428: ; 0x02228428
	ldr r0, _02228440 ; =ov13_0224F4BC
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.balign 4, 0
_02228440: .word ov13_0224F4BC
	arm_func_end ov13_02228428

	arm_func_start ov13_02228444
ov13_02228444: ; 0x02228444
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _022284CC ; =ov13_0224F4BC
	mov r4, r0
	ldr r3, [r2]
	ldr r1, _022284D0 ; =0x01FF0000
	ldr r0, [r3, #0x30]
	ldr r0, [r0]
	and r1, r0, r1
	and r0, r0, #0xff
	sub r2, r0, #0xc
	mov r0, r1, lsr #0x10
	str r0, [sp, #4]
	str r2, [sp]
	cmp r2, #0x51
	ldrb r0, [r3, #0x11d]
	mov r1, #0
	ble _02228498
	bl ov13_022290F0
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_02228498:
	mov r2, #0x51
	bl ov13_022290F0
	ldr r0, _022284CC ; =ov13_0224F4BC
	mov r1, #1
	ldr r0, [r0]
	mov r2, #0xc0
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	ldr r1, _022284D4 ; =ov13_022284D8
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022284CC: .word ov13_0224F4BC
_022284D0: .word 0x01FF0000
_022284D4: .word ov13_022284D8
	arm_func_end ov13_02228444

	arm_func_start ov13_022284D8
ov13_022284D8: ; 0x022284D8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _02228560 ; =ov13_0224F4BC
	mov r4, r0
	ldr r3, [r2]
	ldr r1, _02228564 ; =0x01FF0000
	ldr r0, [r3, #0x60]
	ldr r0, [r0]
	and r1, r0, r1
	and r0, r0, #0xff
	sub r2, r0, #0xc
	mov r0, r1, lsr #0x10
	str r0, [sp, #4]
	str r2, [sp]
	cmp r2, #0x67
	ldrb r0, [r3, #0x11d]
	mov r1, #1
	ble _0222852C
	bl ov13_022290F0
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_0222852C:
	mov r2, #0x67
	bl ov13_022290F0
	ldr r0, _02228560 ; =ov13_0224F4BC
	mov r1, #2
	ldr r0, [r0]
	mov r2, #0xc0
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	ldr r1, _02228568 ; =ov13_0222856C
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02228560: .word ov13_0224F4BC
_02228564: .word 0x01FF0000
_02228568: .word ov13_0222856C
	arm_func_end ov13_022284D8

	arm_func_start ov13_0222856C
ov13_0222856C: ; 0x0222856C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _022285F4 ; =ov13_0224F4BC
	mov r4, r0
	ldr r3, [r2]
	ldr r1, _022285F8 ; =0x01FF0000
	ldr r0, [r3, #0x90]
	ldr r0, [r0]
	and r1, r0, r1
	and r0, r0, #0xff
	sub r2, r0, #0xc
	mov r0, r1, lsr #0x10
	str r0, [sp, #4]
	str r2, [sp]
	cmp r2, #0x7d
	ldrb r0, [r3, #0x11d]
	mov r1, #2
	ble _022285C0
	bl ov13_022290F0
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_022285C0:
	mov r2, #0x7d
	bl ov13_022290F0
	ldr r0, _022285F4 ; =ov13_0224F4BC
	mov r1, #3
	ldr r0, [r0]
	mov r2, #0xc0
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	ldr r1, _022285FC ; =ov13_02228600
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022285F4: .word ov13_0224F4BC
_022285F8: .word 0x01FF0000
_022285FC: .word ov13_02228600
	arm_func_end ov13_0222856C

	arm_func_start ov13_02228600
ov13_02228600: ; 0x02228600
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _02228688 ; =ov13_0224F4BC
	mov r4, r0
	ldr r3, [r2]
	ldr r1, _0222868C ; =0x01FF0000
	ldr r0, [r3, #0xc0]
	ldr r0, [r0]
	and r1, r0, r1
	and r0, r0, #0xff
	sub r2, r0, #0xc
	mov r0, r1, lsr #0x10
	str r0, [sp, #4]
	str r2, [sp]
	cmp r2, #0x93
	ldrb r0, [r3, #0x11d]
	mov r1, #3
	ble _02228654
	bl ov13_022290F0
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_02228654:
	mov r2, #0x93
	bl ov13_022290F0
	ldr r0, _02228688 ; =ov13_0224F4BC
	mov r1, #4
	ldr r0, [r0]
	mov r2, #0xc0
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	ldr r1, _02228690 ; =ov13_02228694
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02228688: .word ov13_0224F4BC
_0222868C: .word 0x01FF0000
_02228690: .word ov13_02228694
	arm_func_end ov13_02228600

	arm_func_start ov13_02228694
ov13_02228694: ; 0x02228694
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _02228718 ; =ov13_0224F4BC
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0, #0xfc]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp]
	mov r1, #4
	sub r2, r0, #0xc
	str r2, [sp]
	cmp r2, #0xaa
	ble _022286EC
	ldr r0, _02228718 ; =ov13_0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_022286EC:
	ldr r0, _02228718 ; =ov13_0224F4BC
	mov r2, #0xaa
	ldr r0, [r0]
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	bl ov13_022294B8
	ldr r1, _0222871C ; =ov13_02228720
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02228718: .word ov13_0224F4BC
_0222871C: .word ov13_02228720
	arm_func_end ov13_02228694

	arm_func_start ov13_02228720
ov13_02228720: ; 0x02228720
	stmdb sp!, {r3, lr}
	bl ov13_02228738
	bl ov13_02228920
	bl ov13_02228C68
	bl ov13_02228EC0
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02228720

	arm_func_start ov13_02228738
ov13_02228738: ; 0x02228738
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _022288FC ; =ov13_02245958
	bl ov13_022417DC
	cmp r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02228900 ; =ov13_0224F4BC
	mvn r1, #0
	ldr r0, [r0]
	ldr r7, _02228904 ; =ov13_02244FA4
	ldr r6, _02228908 ; =ov13_02244F68
	strb r1, [r0, #0x11e]
	mov r4, #0
	add r5, sp, #0
_02228774:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov13_02240E74
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _022287D4
	ldr r0, _02228900 ; =ov13_0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x124]
	cmp r0, #0
	bne _022287B8
	mov r0, #9
	bl ov13_0223ABB8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022287B8:
	mov r0, #0
	bl ov13_0223ABB8
	ldr r0, _02228900 ; =ov13_0224F4BC
	add sp, sp, #8
	ldr r0, [r0]
	strb r4, [r0, #0x11e]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022287D4:
	add r4, r4, #1
	cmp r4, #0x2f
	add r7, r7, #4
	blt _02228774
	ldr r6, _0222890C ; =ov13_02244F94
	ldr r7, _02228910 ; =ov13_02244F84
	mov r4, #0
	add r5, sp, #0
_022287F4:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov13_02240E74
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _02228880
	cmp r4, #3
	bne _02228830
	ldr r0, _02228900 ; =ov13_0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x123]
	cmp r0, #0
	beq _0222884C
_02228830:
	cmp r4, #2
	bne _0222885C
	ldr r0, _02228900 ; =ov13_0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x124]
	cmp r0, #0
	bne _0222885C
_0222884C:
	mov r0, #9
	bl ov13_0223ABB8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222885C:
	ldr r0, _02228914 ; =ov13_02245D80
	ldr r0, [r0, r4, lsl #2]
	bl ov13_0223ABB8
	ldr r0, _02228900 ; =ov13_0224F4BC
	add r1, r4, #0x2f
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x11e]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02228880:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #4
	add r7, r7, #4
	blt _022287F4
	ldr r6, _02228918 ; =ov13_02244F7C
	ldr r5, _0222891C ; =ov13_02244F64
	mov r7, #0
	add r4, sp, #0
_022288A4:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov13_02240E74
	mov r0, r4
	bl ov13_022417DC
	cmp r0, #0
	beq _022288E4
	mov r0, #0
	bl ov13_0223ABB8
	ldr r0, _02228900 ; =ov13_0224F4BC
	add r1, r7, #0x33
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x11e]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022288E4:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _022288A4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022288FC: .word ov13_02245958
_02228900: .word ov13_0224F4BC
_02228904: .word ov13_02244FA4
_02228908: .word ov13_02244F68
_0222890C: .word ov13_02244F94
_02228910: .word ov13_02244F84
_02228914: .word ov13_02245D80
_02228918: .word ov13_02244F7C
_0222891C: .word ov13_02244F64
	arm_func_end ov13_02228738

	arm_func_start ov13_02228920
ov13_02228920: ; 0x02228920
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r1, _02228BCC ; =ov13_0224F4BC
	ldr r0, _02228BD0 ; =ov13_02245958
	ldr r1, [r1]
	mov r2, #0
	strb r2, [r1, #0x11c]
	bl ov13_022418EC
	cmp r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r7, _02228BD4 ; =ov13_02244FA4
	ldr r6, _02228BD8 ; =ov13_02244F68
	mov r4, #0
	add r5, sp, #0
_0222895C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov13_02240E74
	mov r0, r5
	bl ov13_022418EC
	cmp r0, #0
	beq _022289DC
	ldr r1, _02228BCC ; =ov13_0224F4BC
	ldr r3, [r1]
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, r4
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r2, [r3, #0x11d]
	ldr r0, _02228BDC ; =ov13_02245D68
	ldr r0, [r0, r2, lsl #2]
	ldrb r0, [r0, r4]
	strb r0, [r3, #0x11c]
	ldr r0, [r1]
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	bne _022289C4
	mov r0, #0
	bl ov13_0222936C
_022289C4:
	ldr r0, _02228BCC ; =ov13_0224F4BC
	ldr r0, [r0]
	strb r4, [r0, #0x121]
	bl ov13_022294B8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022289DC:
	add r4, r4, #1
	cmp r4, #0x2f
	add r7, r7, #4
	blt _0222895C
	ldr r6, _02228BE0 ; =ov13_02244F9C
	ldr r7, _02228BE4 ; =ov13_02244F8C
	mov r4, #2
	add r5, sp, #0
_022289FC:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov13_02240E74
	mov r0, r5
	bl ov13_022418EC
	cmp r0, #0
	beq _02228A7C
	ldr r1, _02228BCC ; =ov13_0224F4BC
	add r2, r4, #0x2f
	ldr r3, [r1]
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, r2
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02228BE8 ; =ov13_02245208
	ldrb r0, [r0, r4]
	strb r0, [r3, #0x11c]
	ldr r0, [r1]
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	bne _02228A60
	mov r0, #0
	bl ov13_0222936C
_02228A60:
	ldr r0, _02228BCC ; =ov13_0224F4BC
	add r1, r4, #0x2f
	ldr r0, [r0]
	strb r1, [r0, #0x121]
	bl ov13_022294B8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02228A7C:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #4
	add r7, r7, #4
	blt _022289FC
	ldr r7, _02228BEC ; =ov13_02244F7C
	ldr r6, _02228BF0 ; =ov13_02244F64
	mov r4, #0
	add r5, sp, #0
_02228AA0:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov13_02240E74
	mov r0, r5
	bl ov13_022418EC
	cmp r0, #0
	beq _02228B00
	ldr r1, _02228BCC ; =ov13_0224F4BC
	add r2, r4, #0x33
	ldr r3, [r1]
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, r2
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02228BF4 ; =ov13_02244F58
	ldrb r0, [r0, r4]
	strb r0, [r3, #0x11c]
	ldr r0, [r1]
	strb r2, [r0, #0x121]
	bl ov13_022294B8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02228B00:
	add r4, r4, #1
	cmp r4, #2
	add r7, r7, #4
	blt _02228AA0
	ldr r0, _02228BF8 ; =ov13_02244F84
	ldr r1, _02228BFC ; =ov13_02244F94
	add r2, sp, #0
	bl ov13_02240E74
	add r0, sp, #0
	bl ov13_022418EC
	cmp r0, #0
	beq _02228B6C
	ldr r0, _02228BCC ; =ov13_0224F4BC
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, #0x2f
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl ov13_02228C08
	ldr r0, _02228BCC ; =ov13_0224F4BC
	mov r1, #0x2f
	ldr r0, [r0]
	strb r1, [r0, #0x121]
	bl ov13_022294B8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02228B6C:
	ldr r0, _02228C00 ; =ov13_02244F88
	ldr r1, _02228C04 ; =ov13_02244F98
	add r2, sp, #0
	bl ov13_02240E74
	add r0, sp, #0
	bl ov13_022418EC
	cmp r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02228BCC ; =ov13_0224F4BC
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, #0x30
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl ov13_02228C38
	ldr r0, _02228BCC ; =ov13_0224F4BC
	mov r1, #0x30
	ldr r0, [r0]
	strb r1, [r0, #0x121]
	bl ov13_022294B8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02228BCC: .word ov13_0224F4BC
_02228BD0: .word ov13_02245958
_02228BD4: .word ov13_02244FA4
_02228BD8: .word ov13_02244F68
_02228BDC: .word ov13_02245D68
_02228BE0: .word ov13_02244F9C
_02228BE4: .word ov13_02244F8C
_02228BE8: .word ov13_02245208
_02228BEC: .word ov13_02244F7C
_02228BF0: .word ov13_02244F64
_02228BF4: .word ov13_02244F58
_02228BF8: .word ov13_02244F84
_02228BFC: .word ov13_02244F94
_02228C00: .word ov13_02244F88
_02228C04: .word ov13_02244F98
	arm_func_end ov13_02228920

	arm_func_start ov13_02228C08
ov13_02228C08: ; 0x02228C08
	stmdb sp!, {r3, lr}
	ldr r0, _02228C34 ; =ov13_0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x11d]
	cmp r0, #2
	moveq r0, #0
	movne r0, #2
	bl ov13_0222936C
	mov r0, #1
	bl ov13_0223ABB8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02228C34: .word ov13_0224F4BC
	arm_func_end ov13_02228C08

	arm_func_start ov13_02228C38
ov13_02228C38: ; 0x02228C38
	stmdb sp!, {r3, lr}
	ldr r0, _02228C64 ; =ov13_0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	movne r0, #1
	moveq r0, #0
	bl ov13_0222936C
	mov r0, #1
	bl ov13_0223ABB8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02228C64: .word ov13_0224F4BC
	arm_func_end ov13_02228C38

	arm_func_start ov13_02228C68
ov13_02228C68: ; 0x02228C68
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _02228E4C ; =ov13_02245958
	bl ov13_02241754
	cmp r0, #0
	beq _02228E2C
	ldr r7, _02228E50 ; =ov13_02244FA4
	ldr r5, _02228E54 ; =ov13_02244F68
	mov r6, #0
	add r4, sp, #0
_02228C90:
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl ov13_02240E74
	mov r0, r4
	bl ov13_02241754
	cmp r0, #0
	beq _02228CD4
	ldr r0, _02228E58 ; =ov13_0224F4BC
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, r6
	bne _02228E2C
	mov r0, r6
	bl ov13_02228E6C
	b _02228E34
_02228CD4:
	add r6, r6, #1
	cmp r6, #0x2f
	add r7, r7, #4
	blt _02228C90
	ldr r6, _02228E5C ; =ov13_02244F9C
	ldr r7, _02228E60 ; =ov13_02244F8C
	mov r4, #2
	add r5, sp, #0
_02228CF4:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov13_02240E74
	mov r0, r5
	bl ov13_02241754
	cmp r0, #0
	beq _02228DB4
	ldr r1, _02228E58 ; =ov13_0224F4BC
	add r0, r4, #0x2f
	ldr r1, [r1]
	add r1, r1, #0x100
	ldrsb r1, [r1, #0x1e]
	cmp r1, r0
	bne _02228E2C
	bl ov13_02228E6C
	cmp r4, #3
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02228E58 ; =ov13_0224F4BC
	ldr r2, [r0]
	ldrb r1, [r2, #0x122]
	add r1, r1, #1
	strb r1, [r2, #0x122]
	ldr r2, [r0]
	ldrb r1, [r2, #0x122]
	cmp r1, #0x28
	addlo sp, sp, #8
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r2, #0x123]
	cmp r1, #0
	bne _02228D94
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02228E58 ; =ov13_0224F4BC
	mvn r1, #0
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x11e]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02228D94:
	mov r1, #0x80
	strb r1, [r2, #0x11c]
	ldr r1, [r0]
	add sp, sp, #8
	ldrb r0, [r1, #0x122]
	sub r0, r0, #7
	strb r0, [r1, #0x122]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02228DB4:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #4
	add r7, r7, #4
	blt _02228CF4
	ldr r6, _02228E64 ; =ov13_02244F7C
	ldr r5, _02228E68 ; =ov13_02244F64
	mov r7, #0
	add r4, sp, #0
_02228DD8:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov13_02240E74
	mov r0, r4
	bl ov13_02241754
	cmp r0, #0
	beq _02228E1C
	ldr r1, _02228E58 ; =ov13_0224F4BC
	add r0, r7, #0x33
	ldr r1, [r1]
	add r1, r1, #0x100
	ldrsb r1, [r1, #0x1e]
	cmp r1, r0
	bne _02228E2C
	bl ov13_02228E6C
	b _02228E34
_02228E1C:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _02228DD8
_02228E2C:
	mvn r0, #0
	bl ov13_02228E6C
_02228E34:
	ldr r0, _02228E58 ; =ov13_0224F4BC
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x122]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02228E4C: .word ov13_02245958
_02228E50: .word ov13_02244FA4
_02228E54: .word ov13_02244F68
_02228E58: .word ov13_0224F4BC
_02228E5C: .word ov13_02244F9C
_02228E60: .word ov13_02244F8C
_02228E64: .word ov13_02244F7C
_02228E68: .word ov13_02244F64
	arm_func_end ov13_02228C68

	arm_func_start ov13_02228E6C
ov13_02228E6C: ; 0x02228E6C
	stmdb sp!, {r4, lr}
	ldr r1, _02228EBC ; =ov13_0224F4BC
	mov r4, r0
	ldr r1, [r1]
	add r1, r1, #0x100
	ldrsb r1, [r1, #0x1f]
	cmp r4, r1
	ldmeqia sp!, {r4, pc}
	mov r1, #1
	bl ov13_022293F0
	ldr r0, _02228EBC ; =ov13_0224F4BC
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x1f]
	bl ov13_022293F0
	ldr r0, _02228EBC ; =ov13_0224F4BC
	ldr r0, [r0]
	strb r4, [r0, #0x11f]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02228EBC: .word ov13_0224F4BC
	arm_func_end ov13_02228E6C

	arm_func_start ov13_02228EC0
ov13_02228EC0: ; 0x02228EC0
	stmdb sp!, {r4, lr}
	mov r0, #0x20
	bl ov13_022416D4
	cmp r0, #0
	beq _02228EDC
	mov r0, #0
	bl ov13_02229594
_02228EDC:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _02228EF4
	mov r0, #1
	bl ov13_02229594
_02228EF4:
	mov r0, #0x10
	bl ov13_022416D4
	cmp r0, #0
	beq _02228F0C
	mov r0, #2
	bl ov13_02229594
_02228F0C:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	beq _02228F24
	mov r0, #3
	bl ov13_02229594
_02228F24:
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _0222903C
	ldr r2, _022290E0 ; =ov13_0224F4BC
	ldr r0, [r2]
	add r1, r0, #0x100
	ldrsb r4, [r1, #0x21]
	cmp r4, #0x2f
	bge _02228F94
	ldrb r1, [r0, #0x124]
	cmp r1, #0
	bne _02228F64
	mov r0, #9
	bl ov13_0223ABB8
	ldmia sp!, {r4, pc}
_02228F64:
	ldrb r3, [r0, #0x11d]
	ldr r1, _022290E4 ; =ov13_02245D68
	ldr r1, [r1, r3, lsl #2]
	ldrb r1, [r1, r4]
	strb r1, [r0, #0x11c]
	ldr r0, [r2]
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	ldmneia sp!, {r4, pc}
	mov r0, #0
	bl ov13_0222936C
	ldmia sp!, {r4, pc}
_02228F94:
	sub r1, r4, #0x2f
	cmp r1, #4
	bge _0222902C
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02228FFC
_02228FAC: ; jump table
	b _02228FBC ; case 0
	b _02228FC4 ; case 1
	b _02228FCC ; case 2
	b _02228FE4 ; case 3
_02228FBC:
	bl ov13_02228C08
	ldmia sp!, {r4, pc}
_02228FC4:
	bl ov13_02228C38
	ldmia sp!, {r4, pc}
_02228FCC:
	ldrb r1, [r0, #0x124]
	cmp r1, #0
	bne _02228FFC
	mov r0, #9
	bl ov13_0223ABB8
	ldmia sp!, {r4, pc}
_02228FE4:
	ldrb r1, [r0, #0x123]
	cmp r1, #0
	bne _02228FFC
	mov r0, #9
	bl ov13_0223ABB8
	ldmia sp!, {r4, pc}
_02228FFC:
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	bne _02229010
	mov r0, #0
	bl ov13_0222936C
_02229010:
	ldr r1, _022290E8 ; =ov13_02245208
	sub r2, r4, #0x2f
	ldr r0, _022290E0 ; =ov13_0224F4BC
	ldrb r1, [r1, r2]
	ldr r0, [r0]
	strb r1, [r0, #0x11c]
	ldmia sp!, {r4, pc}
_0222902C:
	ldr r1, _022290EC ; =ov13_02244F58
	sub r2, r4, #0x33
	ldrb r1, [r1, r2]
	strb r1, [r0, #0x11c]
_0222903C:
	mov r0, #2
	bl ov13_022416D4
	cmp r0, #0
	beq _02229094
	ldr r0, _022290E0 ; =ov13_0224F4BC
	ldr r1, [r0]
	ldrb r0, [r1, #0x123]
	cmp r0, #0
	bne _02229088
	ldrb r0, [r1, #0x125]
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _022290E0 ; =ov13_0224F4BC
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x125]
	ldmia sp!, {r4, pc}
_02229088:
	mov r0, #0x80
	strb r0, [r1, #0x11c]
	b _022290B4
_02229094:
	mov r0, #2
	bl ov13_02241714
	cmp r0, #0
	beq _022290B4
	ldr r0, _022290E0 ; =ov13_0224F4BC
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x125]
_022290B4:
	mov r0, #0x400
	bl ov13_02241694
	cmp r0, #0
	beq _022290C8
	bl ov13_02228C08
_022290C8:
	mov r0, #0x800
	bl ov13_02241694
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl ov13_02228C38
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022290E0: .word ov13_0224F4BC
_022290E4: .word ov13_02245D68
_022290E8: .word ov13_02245208
_022290EC: .word ov13_02244F58
	arm_func_end ov13_02228EC0

	arm_func_start ov13_022290F0
ov13_022290F0: ; 0x022290F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r3, _02229350 ; =ov13_02244F60
	mov sl, r1
	ldrb r5, [r3, #0x11]
	ldrb r4, [r3, #0x12]
	mov r1, #0xc
	mul r1, sl, r1
	strb r5, [sp, #0x12]
	strb r4, [sp, #0x13]
	ldrb r4, [r3, #0x14]
	ldrb r5, [r3, #0x13]
	str r1, [sp, #4]
	strb r4, [sp, #0x15]
	strb r5, [sp, #0x14]
	ldrb r1, [r3, #0x15]
	mov sb, r2
	add r4, sp, #0x12
	strb r1, [sp, #0x16]
	ldrb r1, [r4, sl]
	ldrb r6, [r3, #0x16]
	ldrb r2, [r3, #0x17]
	cmp r1, #0
	ldr r5, [sp, #4]
	strb r6, [sp, #0xd]
	strb r2, [sp, #0xe]
	ldrb r7, [r3, #0x18]
	ldrb r2, [r3, #0x19]
	mov r6, #0
	strb r7, [sp, #0xf]
	strb r2, [sp, #0x10]
	ldrb r1, [r3, #0x1a]
	strb r1, [sp, #0x11]
	ldrb r2, [r3, #0xc]
	ldrb r1, [r3, #0xd]
	strb r2, [sp, #8]
	strb r1, [sp, #9]
	ldrb r2, [r3, #0xe]
	ldrb r1, [r3, #0xf]
	strb r2, [sp, #0xa]
	strb r1, [sp, #0xb]
	ldrb r1, [r3, #0x10]
	strb r1, [sp, #0xc]
	ble _0222920C
	ldr r1, _02229354 ; =ov13_02244FA4
	ldr fp, _02229358 ; =ov13_0224F4BC
	ldr lr, _0222935C ; =0xC1FFFCFF
	ldr r8, _02229360 ; =0xFE00FF00
	and r7, sb, #0xff
_022291B4:
	ldr r2, [fp]
	mov r3, r5, lsl #2
	add r2, r2, r5, lsl #2
	ldr r2, [r2, #0x30]
	ldrh r3, [r1, r3]
	ldr ip, [r2]
	add r6, r6, #1
	and ip, ip, lr
	str ip, [r2]
	mov r2, r3, lsl #0x17
	ldr r3, [fp]
	add r3, r3, r5, lsl #2
	ldr r3, [r3, #0x30]
	add r5, r5, #1
	ldr ip, [r3]
	and ip, ip, r8
	orr ip, ip, r7
	orr r2, ip, r2, lsr #7
	str r2, [r3]
	ldrb r2, [r4, sl]
	cmp r6, r2
	blt _022291B4
_0222920C:
	cmp sl, #4
	bge _0222924C
	ldr r1, _02229358 ; =ov13_0224F4BC
	ldr r3, _02229354 ; =ov13_02244FA4
	ldr r4, [r1]
	ldr r1, [sp, #4]
	mov r2, #2
	mov r1, r1, lsl #2
	str r2, [sp]
	add r0, r4, r0, lsl #4
	add r2, r4, sl, lsl #2
	ldrh r1, [r3, r1]
	ldr r3, [r2, #0x104]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	bl ov13_02240D94
_0222924C:
	add r0, sl, #3
	mov r1, #4
	bl FX_ModS32
	add r3, sp, #0xd
	ldrb r1, [r3, sl]
	mov r5, #0
	cmp r1, #0
	ble _022292D4
	ldr r2, _02229364 ; =ov13_02244F84
	mov r1, r0, lsl #2
	ldrh r0, [r2, r1]
	ldr r8, _02229358 ; =ov13_0224F4BC
	ldr r6, _0222935C ; =0xC1FFFCFF
	ldr r7, _02229360 ; =0xFE00FF00
	and r4, sb, #0xff
	mov r2, r0, lsl #0x17
_0222928C:
	ldr r0, [r8]
	add r5, r5, #1
	add r0, r1, r0
	ldr fp, [r0, #0xec]
	ldr r0, [fp]
	and r0, r0, r6
	str r0, [fp]
	ldr r0, [r8]
	add r0, r1, r0
	ldr r0, [r0, #0xec]
	ldr fp, [r0]
	and fp, fp, r7
	orr fp, fp, r4
	orr fp, fp, r2, lsr #7
	str fp, [r0]
	ldrb r0, [r3, sl]
	cmp r5, r0
	blt _0222928C
_022292D4:
	add r7, sp, #8
	ldrb r0, [r7, sl]
	mov r8, #0
	cmp r0, #0
	addle sp, sp, #0x18
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, _02229368 ; =ov13_02244F7C
	ldr r4, _02229358 ; =ov13_0224F4BC
	mvn r6, #0
	mov fp, r8
_022292FC:
	ldr r0, [r4]
	mov r1, r6
	add r0, r0, r8, lsl #2
	ldr r0, [r0, #0xfc]
	mov r2, fp
	mov r3, fp
	bl ov13_0223FDF4
	ldr r0, [r4]
	mov r1, r8, lsl #2
	add r0, r0, r8, lsl #2
	ldr r0, [r0, #0xfc]
	ldrh r2, [r5, r1]
	mov r1, r6
	mov r3, sb
	bl ov13_0223FF18
	ldrb r0, [r7, sl]
	add r8, r8, #1
	cmp r8, r0
	blt _022292FC
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02229350: .word ov13_02244F60
_02229354: .word ov13_02244FA4
_02229358: .word ov13_0224F4BC
_0222935C: .word 0xC1FFFCFF
_02229360: .word 0xFE00FF00
_02229364: .word ov13_02244F84
_02229368: .word ov13_02244F7C
	arm_func_end ov13_022290F0

	arm_func_start ov13_0222936C
ov13_0222936C: ; 0x0222936C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _022293E8 ; =ov13_0224F4BC
	mov r5, #0
	ldr r1, [r1]
	mov r8, r0
	ldr sb, _022293EC ; =ov13_02244FA4
	mov r6, r5
	mov r4, r5
	mov r7, r5
	strb r8, [r1, #0x11d]
_02229394:
	add r0, sb, r7, lsl #2
	ldrh r2, [r0, #2]
	mov r0, r8
	mov r1, r4
	bl ov13_022290F0
	add r4, r4, #1
	cmp r4, #4
	add r7, r7, #0xc
	blt _02229394
	cmp r8, #2
	moveq r5, #1
	beq _022293CC
	cmp r8, #1
	moveq r6, #1
_022293CC:
	mov r1, r5
	mov r0, #0x2f
	bl ov13_022293F0
	mov r1, r6
	mov r0, #0x30
	bl ov13_022293F0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_022293E8: .word ov13_0224F4BC
_022293EC: .word ov13_02244FA4
	arm_func_end ov13_0222936C

	arm_func_start ov13_022293F0
ov13_022293F0: ; 0x022293F0
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmltia sp!, {r3, pc}
	cmp r0, #0x2f
	bge _0222943C
	ldr r2, _022294AC ; =ov13_0224F4BC
	ldr r3, _022294B0 ; =ov13_02244F4C
	ldr r2, [r2]
	ldrb r1, [r3, r1]
	add r0, r2, r0, lsl #2
	ldr r2, [r0, #0x30]
	ldr r0, [r2]
	bic r0, r0, #0xc00
	str r0, [r2]
	ldrh r0, [r2, #4]
	bic r0, r0, #0xf000
	orr r0, r0, r1, lsl #12
	strh r0, [r2, #4]
	ldmia sp!, {r3, pc}
_0222943C:
	sub ip, r0, #0x2f
	cmp ip, #4
	bge _02229480
	ldr r0, _022294AC ; =ov13_0224F4BC
	ldr r2, _022294B0 ; =ov13_02244F4C
	ldr r3, [r0]
	ldrb r0, [r2, r1]
	add r1, r3, ip, lsl #2
	ldr r2, [r1, #0xec]
	ldr r1, [r2]
	bic r1, r1, #0xc00
	str r1, [r2]
	ldrh r1, [r2, #4]
	bic r1, r1, #0xf000
	orr r0, r1, r0, lsl #12
	strh r0, [r2, #4]
	ldmia sp!, {r3, pc}
_02229480:
	ldr r2, _022294AC ; =ov13_0224F4BC
	ldr r3, _022294B4 ; =ov13_02244F50
	ldr r2, [r2]
	sub r0, r0, #0x33
	add r0, r2, r0, lsl #2
	ldrb r3, [r3, r1]
	ldr r0, [r0, #0xfc]
	mvn r1, #0
	mov r2, #0
	bl ov13_0223FE98
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022294AC: .word ov13_0224F4BC
_022294B0: .word ov13_02244F4C
_022294B4: .word ov13_02244F50
	arm_func_end ov13_022293F0

	arm_func_start ov13_022294B8
ov13_022294B8: ; 0x022294B8
	stmdb sp!, {r4, lr}
	ldr r0, _02229588 ; =ov13_0224F4BC
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x21]
	sub r0, r0, #0x2f
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0222951C
_022294DC: ; jump table
	b _022294F4 ; case 0
	b _022294FC ; case 1
	b _02229504 ; case 2
	b _0222950C ; case 3
	b _02229514 ; case 4
	b _02229514 ; case 5
_022294F4:
	mov r4, #0x42
	b _02229520
_022294FC:
	mov r4, #0x41
	b _02229520
_02229504:
	mov r4, #0x43
	b _02229520
_0222950C:
	mov r4, #0x41
	b _02229520
_02229514:
	mov r4, #0x45
	b _02229520
_0222951C:
	mov r4, #0x40
_02229520:
	ldr r0, [r1, #0x114]
	mov r1, #0
	bl ov13_0223FDE0
	mov r2, r0
	mov r1, r4
	mov r0, #0
	bl ov13_022400F0
	ldr r0, _02229588 ; =ov13_0224F4BC
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #2
	ldr r0, [r0, #0x114]
	bl ov13_02240008
	ldr r0, _02229588 ; =ov13_0224F4BC
	ldr r2, _0222958C ; =ov13_02245060
	ldr r3, [r0]
	mvn r1, #0
	add r0, r3, #0x100
	ldrsb ip, [r0, #0x21]
	ldr r0, [r3, #0x114]
	ldr r3, _02229590 ; =ov13_02245062
	mov ip, ip, lsl #2
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	bl ov13_0223FF18
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02229588: .word ov13_0224F4BC
_0222958C: .word ov13_02245060
_02229590: .word ov13_02245062
	arm_func_end ov13_022294B8

	arm_func_start ov13_02229594
ov13_02229594: ; 0x02229594
	stmdb sp!, {r3, lr}
	ldr r2, _022299C4 ; =ov13_0224F4BC
	ldr r3, _022299C8 ; =ov13_02245134
	ldr ip, [r2]
	add r1, ip, #0x100
	ldrsb lr, [r1, #0x21]
	add r1, r3, lr, lsl #2
	ldrsb r1, [r0, r1]
	strb r1, [ip, #0x121]
	ldr r1, [r2]
	add r2, r1, #0x100
	ldrsb r3, [r2, #0x21]
	cmp r3, #0x2e
	cmpeq r0, #3
	streqb lr, [r1, #0x120]
	beq _022299B4
	cmp r3, #0x33
	bne _022295EC
	cmp r0, #1
	cmpne r0, #3
	streqb lr, [r1, #0x120]
	beq _022299B4
_022295EC:
	cmp r3, #0x34
	bne _0222960C
	cmp r0, #1
	cmpne r0, #3
	bne _0222960C
	cmp lr, #0x2e
	strneb lr, [r1, #0x120]
	b _022299B4
_0222960C:
	mvn r2, #0
	cmp r3, r2
	bne _0222963C
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x20]
	cmp r0, #0x23
	cmpne r0, #0x32
	moveq r0, #0x23
	streqb r0, [r1, #0x121]
	movne r0, #0x22
	strneb r0, [r1, #0x121]
	b _022299B4
_0222963C:
	sub r0, r2, #1
	cmp r3, r0
	bne _022296FC
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x20]
	cmp r0, #0x26
	bgt _02229694
	bge _022296CC
	cmp r0, #5
	bgt _02229688
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _022296F0
_02229670: ; jump table
	b _022296B4 ; case 0
	b _022296C0 ; case 1
	b _022296F0 ; case 2
	b _022296CC ; case 3
	b _022296D8 ; case 4
	b _022296E4 ; case 5
_02229688:
	cmp r0, #0x24
	beq _022296C0
	b _022296F0
_02229694:
	cmp r0, #0x28
	bgt _022296AC
	bge _022296E4
	cmp r0, #0x27
	beq _022296D8
	b _022296F0
_022296AC:
	cmp r0, #0x31
	bne _022296F0
_022296B4:
	mov r0, #0x31
	strb r0, [r1, #0x121]
	b _022299B4
_022296C0:
	mov r0, #0x24
	strb r0, [r1, #0x121]
	b _022299B4
_022296CC:
	mov r0, #0x26
	strb r0, [r1, #0x121]
	b _022299B4
_022296D8:
	mov r0, #0x27
	strb r0, [r1, #0x121]
	b _022299B4
_022296E4:
	mov r0, #0x28
	strb r0, [r1, #0x121]
	b _022299B4
_022296F0:
	mov r0, #0x25
	strb r0, [r1, #0x121]
	b _022299B4
_022296FC:
	sub r0, r2, #2
	cmp r3, r0
	bne _022297F4
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x20]
	cmp r0, #0x23
	bgt _0222976C
	bge _022297DC
	cmp r0, #0xb
	bgt _02229760
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _022297E8
_02229730: ; jump table
	b _022297E8 ; case 0
	b _022297E8 ; case 1
	b _022297E8 ; case 2
	b _022297E8 ; case 3
	b _022297E8 ; case 4
	b _022297E8 ; case 5
	b _022297AC ; case 6
	b _022297B8 ; case 7
	b _022297E8 ; case 8
	b _022297C4 ; case 9
	b _022297D0 ; case 10
	b _022297DC ; case 11
_02229760:
	cmp r0, #0x22
	beq _022297DC
	b _022297E8
_0222976C:
	cmp r0, #0x2a
	bgt _02229784
	bge _022297B8
	cmp r0, #0x29
	beq _022297AC
	b _022297E8
_02229784:
	cmp r0, #0x32
	bgt _022297E8
	cmp r0, #0x2c
	blt _022297E8
	beq _022297C4
	cmp r0, #0x2d
	beq _022297D0
	cmp r0, #0x32
	beq _022297DC
	b _022297E8
_022297AC:
	mov r0, #0x29
	strb r0, [r1, #0x121]
	b _022299B4
_022297B8:
	mov r0, #0x2a
	strb r0, [r1, #0x121]
	b _022299B4
_022297C4:
	mov r0, #0x2c
	strb r0, [r1, #0x121]
	b _022299B4
_022297D0:
	mov r0, #0x2d
	strb r0, [r1, #0x121]
	b _022299B4
_022297DC:
	mov r0, #0x2e
	strb r0, [r1, #0x121]
	b _022299B4
_022297E8:
	mov r0, #0x2b
	strb r0, [r1, #0x121]
	b _022299B4
_022297F4:
	sub r0, r2, #3
	cmp r3, r0
	bne _022298B4
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x20]
	cmp r0, #0x26
	bgt _0222984C
	bge _02229884
	cmp r0, #5
	bgt _02229840
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _022298A8
_02229828: ; jump table
	b _0222986C ; case 0
	b _02229878 ; case 1
	b _022298A8 ; case 2
	b _02229884 ; case 3
	b _02229890 ; case 4
	b _0222989C ; case 5
_02229840:
	cmp r0, #0x24
	beq _02229878
	b _022298A8
_0222984C:
	cmp r0, #0x28
	bgt _02229864
	bge _0222989C
	cmp r0, #0x27
	beq _02229890
	b _022298A8
_02229864:
	cmp r0, #0x31
	bne _022298A8
_0222986C:
	mov r0, #0
	strb r0, [r1, #0x121]
	b _022299B4
_02229878:
	mov r0, #1
	strb r0, [r1, #0x121]
	b _022299B4
_02229884:
	mov r0, #3
	strb r0, [r1, #0x121]
	b _022299B4
_02229890:
	mov r0, #4
	strb r0, [r1, #0x121]
	b _022299B4
_0222989C:
	mov r0, #5
	strb r0, [r1, #0x121]
	b _022299B4
_022298A8:
	mov r0, #2
	strb r0, [r1, #0x121]
	b _022299B4
_022298B4:
	sub r0, r2, #4
	cmp r3, r0
	bne _022299B4
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x20]
	cmp r0, #0x23
	bgt _02229924
	bge _022299A0
	cmp r0, #0xb
	bgt _02229918
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _022299AC
_022298E8: ; jump table
	b _022299AC ; case 0
	b _022299AC ; case 1
	b _022299AC ; case 2
	b _022299AC ; case 3
	b _022299AC ; case 4
	b _022299AC ; case 5
	b _02229964 ; case 6
	b _02229970 ; case 7
	b _022299AC ; case 8
	b _0222997C ; case 9
	b _02229988 ; case 10
	b _02229994 ; case 11
_02229918:
	cmp r0, #0x22
	beq _02229994
	b _022299AC
_02229924:
	cmp r0, #0x2a
	bgt _0222993C
	bge _02229970
	cmp r0, #0x29
	beq _02229964
	b _022299AC
_0222993C:
	cmp r0, #0x32
	bgt _022299AC
	cmp r0, #0x2c
	blt _022299AC
	beq _0222997C
	cmp r0, #0x2d
	beq _02229988
	cmp r0, #0x32
	beq _022299A0
	b _022299AC
_02229964:
	mov r0, #6
	strb r0, [r1, #0x121]
	b _022299B4
_02229970:
	mov r0, #7
	strb r0, [r1, #0x121]
	b _022299B4
_0222997C:
	mov r0, #9
	strb r0, [r1, #0x121]
	b _022299B4
_02229988:
	mov r0, #0xa
	strb r0, [r1, #0x121]
	b _022299B4
_02229994:
	mov r0, #0xb
	strb r0, [r1, #0x121]
	b _022299B4
_022299A0:
	mov r0, #0x32
	strb r0, [r1, #0x121]
	b _022299B4
_022299AC:
	mov r0, #8
	strb r0, [r1, #0x121]
_022299B4:
	bl ov13_022294B8
	mov r0, #8
	bl ov13_0223ABB8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022299C4: .word ov13_0224F4BC
_022299C8: .word ov13_02245134
	arm_func_end ov13_02229594

	arm_func_start ov13_022299CC
ov13_022299CC: ; 0x022299CC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _02229A44 ; =ov13_0224F4BC
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0
	ldr r0, [r0, #0xfc]
	bl ov13_0223FDE0
	ldr r3, [r0]
	ldr r1, _02229A44 ; =ov13_0224F4BC
	ldr r0, _02229A48 ; =0x01FF0000
	and r2, r3, #0xff
	and r0, r3, r0
	mov r3, r0, lsr #0x10
	ldr r1, [r1]
	add r2, r2, #0xc
	ldrb r0, [r1, #0x11d]
	str r2, [sp]
	mov r1, #4
	str r3, [sp, #4]
	bl ov13_022290F0
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldr r1, _02229A4C ; =ov13_02229A50
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02229A44: .word ov13_0224F4BC
_02229A48: .word 0x01FF0000
_02229A4C: .word ov13_02229A50
	arm_func_end ov13_022299CC

	arm_func_start ov13_02229A50
ov13_02229A50: ; 0x02229A50
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _02229AB8 ; =ov13_0224F4BC
	ldr r2, _02229ABC ; =0x01FF0000
	ldr r3, [r1]
	mov r4, r0
	ldr r1, [r3, #0xc0]
	ldrb r0, [r3, #0x11d]
	ldr ip, [r1]
	mov r1, #3
	and r3, ip, #0xff
	and ip, ip, r2
	add r2, r3, #0xc
	mov r3, ip, lsr #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl ov13_022290F0
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldr r1, _02229AC0 ; =ov13_02229AC4
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02229AB8: .word ov13_0224F4BC
_02229ABC: .word 0x01FF0000
_02229AC0: .word ov13_02229AC4
	arm_func_end ov13_02229A50

	arm_func_start ov13_02229AC4
ov13_02229AC4: ; 0x02229AC4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _02229B2C ; =ov13_0224F4BC
	ldr r2, _02229B30 ; =0x01FF0000
	ldr r3, [r1]
	mov r4, r0
	ldr r1, [r3, #0x90]
	ldrb r0, [r3, #0x11d]
	ldr ip, [r1]
	mov r1, #2
	and r3, ip, #0xff
	and ip, ip, r2
	add r2, r3, #0xc
	mov r3, ip, lsr #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl ov13_022290F0
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldr r1, _02229B34 ; =ov13_02229B38
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02229B2C: .word ov13_0224F4BC
_02229B30: .word 0x01FF0000
_02229B34: .word ov13_02229B38
	arm_func_end ov13_02229AC4

	arm_func_start ov13_02229B38
ov13_02229B38: ; 0x02229B38
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _02229BA0 ; =ov13_0224F4BC
	ldr r2, _02229BA4 ; =0x01FF0000
	ldr r3, [r1]
	mov r4, r0
	ldr r1, [r3, #0x60]
	ldrb r0, [r3, #0x11d]
	ldr ip, [r1]
	mov r1, #1
	and r3, ip, #0xff
	and ip, ip, r2
	add r2, r3, #0xc
	mov r3, ip, lsr #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl ov13_022290F0
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldr r1, _02229BA8 ; =ov13_02229BAC
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02229BA0: .word ov13_0224F4BC
_02229BA4: .word 0x01FF0000
_02229BA8: .word ov13_02229BAC
	arm_func_end ov13_02229B38

	arm_func_start ov13_02229BAC
ov13_02229BAC: ; 0x02229BAC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _02229C14 ; =ov13_0224F4BC
	ldr r2, _02229C18 ; =0x01FF0000
	ldr r3, [r1]
	mov r4, r0
	ldr r1, [r3, #0x30]
	ldrb r0, [r3, #0x11d]
	ldr ip, [r1]
	mov r1, #0
	and r3, ip, #0xff
	and ip, ip, r2
	add r2, r3, #0xc
	mov r3, ip, lsr #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl ov13_022290F0
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldr r1, _02229C1C ; =ov13_02229C20
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02229C14: .word ov13_0224F4BC
_02229C18: .word 0x01FF0000
_02229C1C: .word ov13_02229C20
	arm_func_end ov13_02229BAC

	arm_func_start ov13_02229C20
ov13_02229C20: ; 0x02229C20
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r1, r0
	mov r0, #0
	bl ov13_022425D0
	mov r5, #0
	ldr r7, _02229CF8 ; =ov13_0224F4BC
	mov r4, r5
_02229C3C:
	mov r6, r4
_02229C40:
	ldr r0, [r7]
	add r0, r0, r5, lsl #4
	ldr r0, [r0, r6, lsl #2]
	bl ov13_02240874
	cmp r5, #0
	bne _02229C68
	ldr r0, [r7]
	add r0, r0, r6, lsl #2
	ldr r0, [r0, #0x104]
	bl ov13_0223FD60
_02229C68:
	add r6, r6, #1
	cmp r6, #4
	blt _02229C40
	add r5, r5, #1
	cmp r5, #3
	blt _02229C3C
	ldr r4, _02229CF8 ; =ov13_0224F4BC
	mov r5, #0
_02229C88:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0xfc]
	bl ov13_0223FD60
	add r5, r5, #1
	cmp r5, #2
	blt _02229C88
	ldr r4, _02229CF8 ; =ov13_0224F4BC
	mov r5, #0
_02229CAC:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0xec]
	bl ov13_02241D98
	add r5, r5, #1
	cmp r5, #4
	blt _02229CAC
	ldr r4, _02229CF8 ; =ov13_0224F4BC
	mov r5, #0
_02229CD0:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x30]
	bl ov13_02241D98
	add r5, r5, #1
	cmp r5, #0x2f
	blt _02229CD0
	ldr r0, _02229CFC ; =ov13_0224F4BC
	bl ov13_022412B0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02229CF8: .word ov13_0224F4BC
_02229CFC: .word ov13_0224F4BC
	arm_func_end ov13_02229C20

	arm_func_start ov13_02229D00
ov13_02229D00: ; 0x02229D00
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r0, _0222A020 ; =ov13_02245228
	mov r3, #0x1c
	ldrh r5, [r0, #0x20]
	ldrh r4, [r0, #0x22]
	mov r2, #0x14
	mov r0, #0x6c
	mov r1, #4
	strh r5, [sp, #0x1c]
	strh r4, [sp, #0x1e]
	strh r3, [sp, #0x20]
	strh r2, [sp, #0x22]
	bl ov13_0224128C
	ldr r8, _0222A024 ; =ov13_0224F4C0
	mov r6, #0
	mov r1, #0x1f
	str r0, [r8]
	strb r1, [r0, #0x60]
	ldr r0, [r8]
	mov r1, #1
	strb r6, [r0, #0x63]
	ldr r0, [r8]
	ldr r7, _0222A028 ; =0xC1FFFCFF
	strb r1, [r0, #0x66]
	ldr r0, [r8]
	mov r5, r6
	strb r1, [r0, #0x67]
	ldr r0, [r8]
	mov r4, #0x36
	strb r1, [r0, #0x68]
_02229D7C:
	mov r0, r5
	mov r1, r4
	bl ov13_02240184
	ldr r1, [r8]
	add r1, r1, r6, lsl #2
	str r0, [r1, #0x10]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0x10]
	ldr r0, [r1]
	and r0, r0, r7
	orr r0, r0, #0x200
	str r0, [r1]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0x10]
	add r6, r6, #1
	ldrh r0, [r1, #4]
	cmp r6, #0xa
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	blt _02229D7C
	mov r6, #0
	ldr r5, _0222A02C ; =ov13_02245214
	ldr r8, _0222A024 ; =ov13_0224F4C0
	ldr r7, _0222A028 ; =0xC1FFFCFF
	mov r4, r6
_02229DEC:
	ldrb r1, [r5], #1
	mov r0, r4
	bl ov13_02240184
	ldr r1, [r8]
	add r1, r1, r6, lsl #2
	str r0, [r1, #0x38]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0x38]
	ldr r0, [r1]
	and r0, r0, r7
	orr r0, r0, #0x200
	str r0, [r1]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0x38]
	add r6, r6, #1
	ldrh r0, [r1, #4]
	cmp r6, #2
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	blt _02229DEC
	mov sl, #0
	ldr sb, _0222A030 ; =ov13_02245218
	ldr r4, _0222A024 ; =ov13_0224F4C0
	mov r8, sl
	mov r7, #1
	mvn r6, #0
	mov r5, #0x200
	mov fp, sl
_02229E68:
	ldrb r1, [sb], #1
	mov r0, r8
	mov r2, r7
	bl ov13_022401B0
	ldr r2, [r4]
	mov r1, r6
	add r2, r2, sl, lsl #2
	str r0, [r2, #0x40]
	ldr r0, [r4]
	mov r2, r5
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #0x40]
	mov r3, fp
	bl ov13_0223FDF4
	ldr r0, [r4]
	mov r1, r6
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #0x40]
	mov r2, #3
	bl ov13_02240008
	add sl, sl, #1
	cmp sl, #2
	blt _02229E68
	mov sl, #0
	str sl, [sp, #0x10]
	strh sl, [sp, #0x16]
_02229ED0:
	add r1, sp, #0x18
	mov r0, #0
	str r1, [sp]
	mov r3, r0
	mov r1, #0xc
	mov r2, #4
	str r0, [sp, #4]
	bl ov13_02240798
	ldr fp, _0222A024 ; =ov13_0224F4C0
	mov sb, #0
	ldr r1, [fp]
	ldr r8, [sp, #0x10]
	ldr r7, _0222A034 ; =ov13_02245260
	str r0, [r1, sl, lsl #2]
	strh sb, [sp, #0x1c]
	mov r6, #2
	mov r5, #0x480
	add r4, sp, #0x14
_02229F18:
	mov r0, r8, lsl #1
	ldrh r2, [r7, r0]
	ldrh r0, [sp, #0x22]
	ldrh r1, [sp, #0x1c]
	strh r2, [sp, #0x14]
	stmia sp, {r0, r6}
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [fp]
	ldrh r2, [sp, #0x1e]
	ldrh r3, [sp, #0x20]
	ldr r0, [r0, sl, lsl #2]
	bl ov13_02240CC0
	ldrh r0, [sp, #0x1c]
	add sb, sb, #1
	cmp sb, #3
	add r0, r0, #0x20
	strh r0, [sp, #0x1c]
	add r8, r8, #1
	blt _02229F18
	mov r0, #0
	ldr r1, [sp, #0x18]
	mov r2, r0
	bl ov13_0223FC04
	ldr r1, [sp, #0x10]
	ldr r2, _0222A024 ; =ov13_0224F4C0
	add r1, r1, #3
	str r1, [sp, #0x10]
	ldr r1, [r2]
	add r1, r1, sl, lsl #2
	add sl, sl, #1
	str r0, [r1, #0x48]
	cmp sl, #4
	blt _02229ED0
	mov r0, #0
	mov r1, #0x44
	mov r2, #1
	bl ov13_022401B0
	ldr r3, _0222A024 ; =ov13_0224F4C0
	mvn r1, #0
	ldr r4, [r3]
	mov r2, #0x200
	str r0, [r4, #0x58]
	ldr r0, [r3]
	mov r3, #0
	ldr r0, [r0, #0x58]
	bl ov13_0223FDF4
	ldr r0, _0222A024 ; =ov13_0224F4C0
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #2
	ldr r0, [r0, #0x58]
	bl ov13_02240008
	mov r0, #0
	ldr r1, _0222A038 ; =ov13_0222A0DC
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r2, _0222A024 ; =ov13_0224F4C0
	mov r1, #0xc0
	ldr r2, [r2]
	str r0, [r2, #0x5c]
	mov r0, #0
	bl ov13_0222AAFC
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0222A020: .word ov13_02245228
_0222A024: .word ov13_0224F4C0
_0222A028: .word 0xC1FFFCFF
_0222A02C: .word ov13_02245214
_0222A030: .word ov13_02245218
_0222A034: .word ov13_02245260
_0222A038: .word ov13_0222A0DC
	arm_func_end ov13_02229D00

	arm_func_start ov13_0222A03C
ov13_0222A03C: ; 0x0222A03C
	stmdb sp!, {r3, lr}
	ldr r0, _0222A068 ; =ov13_0224F4C0
	ldr r0, [r0]
	ldr r0, [r0, #0x58]
	bl ov13_0223FD60
	ldr r0, _0222A068 ; =ov13_0224F4C0
	ldr r1, _0222A06C ; =ov13_0222AF5C
	ldr r0, [r0]
	ldr r0, [r0, #0x5c]
	bl ov13_022425C8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222A068: .word ov13_0224F4C0
_0222A06C: .word ov13_0222AF5C
	arm_func_end ov13_0222A03C

	arm_func_start ov13_0222A070
ov13_0222A070: ; 0x0222A070
	ldr r0, _0222A080 ; =ov13_0224F4C0
	ldr r0, [r0]
	ldrb r0, [r0, #0x60]
	bx lr
	.balign 4, 0
_0222A080: .word ov13_0224F4C0
	arm_func_end ov13_0222A070

	arm_func_start ov13_0222A084
ov13_0222A084: ; 0x0222A084
	ldr r1, _0222A094 ; =ov13_0224F4C0
	ldr r1, [r1]
	strb r0, [r1, #0x66]
	bx lr
	.balign 4, 0
_0222A094: .word ov13_0224F4C0
	arm_func_end ov13_0222A084

	arm_func_start ov13_0222A098
ov13_0222A098: ; 0x0222A098
	ldr r1, _0222A0A8 ; =ov13_0224F4C0
	ldr r1, [r1]
	strb r0, [r1, #0x67]
	bx lr
	.balign 4, 0
_0222A0A8: .word ov13_0224F4C0
	arm_func_end ov13_0222A098

	arm_func_start ov13_0222A0AC
ov13_0222A0AC: ; 0x0222A0AC
	ldr r1, _0222A0BC ; =ov13_0224F4C0
	ldr r1, [r1]
	strb r0, [r1, #0x68]
	bx lr
	.balign 4, 0
_0222A0BC: .word ov13_0224F4C0
	arm_func_end ov13_0222A0AC

	arm_func_start ov13_0222A0C0
ov13_0222A0C0: ; 0x0222A0C0
	ldr r0, _0222A0D8 ; =ov13_0224F4C0
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.balign 4, 0
_0222A0D8: .word ov13_0224F4C0
	arm_func_end ov13_0222A0C0

	arm_func_start ov13_0222A0DC
ov13_0222A0DC: ; 0x0222A0DC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _0222A154 ; =ov13_0224F4C0
	mov r4, r0
	ldr r2, [r2]
	ldr r1, _0222A158 ; =0x01FF0000
	ldr r0, [r2, #0x10]
	ldr r0, [r0]
	and r2, r0, r1
	and r0, r0, #0xff
	sub r1, r0, #0xc
	mov r0, r2, lsr #0x10
	str r0, [sp, #4]
	str r1, [sp]
	cmp r1, #0x4c
	mov r0, #0
	ble _0222A12C
	bl ov13_0222AAFC
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_0222A12C:
	mov r1, #0x4c
	bl ov13_0222AAFC
	mov r0, #1
	mov r1, #0xc0
	bl ov13_0222AAFC
	ldr r1, _0222A15C ; =ov13_0222A160
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222A154: .word ov13_0224F4C0
_0222A158: .word 0x01FF0000
_0222A15C: .word ov13_0222A160
	arm_func_end ov13_0222A0DC

	arm_func_start ov13_0222A160
ov13_0222A160: ; 0x0222A160
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _0222A1D8 ; =ov13_0224F4C0
	mov r4, r0
	ldr r2, [r2]
	ldr r1, _0222A1DC ; =0x01FF0000
	ldr r0, [r2, #0x1c]
	ldr r0, [r0]
	and r2, r0, r1
	and r0, r0, #0xff
	sub r1, r0, #0xc
	mov r0, r2, lsr #0x10
	str r0, [sp, #4]
	str r1, [sp]
	cmp r1, #0x63
	mov r0, #1
	ble _0222A1B0
	bl ov13_0222AAFC
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_0222A1B0:
	mov r1, #0x63
	bl ov13_0222AAFC
	mov r0, #2
	mov r1, #0xc0
	bl ov13_0222AAFC
	ldr r1, _0222A1E0 ; =ov13_0222A1E4
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222A1D8: .word ov13_0224F4C0
_0222A1DC: .word 0x01FF0000
_0222A1E0: .word ov13_0222A1E4
	arm_func_end ov13_0222A160

	arm_func_start ov13_0222A1E4
ov13_0222A1E4: ; 0x0222A1E4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _0222A25C ; =ov13_0224F4C0
	mov r4, r0
	ldr r2, [r2]
	ldr r1, _0222A260 ; =0x01FF0000
	ldr r0, [r2, #0x28]
	ldr r0, [r0]
	and r2, r0, r1
	and r0, r0, #0xff
	sub r1, r0, #0xc
	mov r0, r2, lsr #0x10
	str r0, [sp, #4]
	str r1, [sp]
	cmp r1, #0x7a
	mov r0, #2
	ble _0222A234
	bl ov13_0222AAFC
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_0222A234:
	mov r1, #0x7a
	bl ov13_0222AAFC
	mov r0, #3
	mov r1, #0xc0
	bl ov13_0222AAFC
	ldr r1, _0222A264 ; =ov13_0222A268
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222A25C: .word ov13_0224F4C0
_0222A260: .word 0x01FF0000
_0222A264: .word ov13_0222A268
	arm_func_end ov13_0222A1E4

	arm_func_start ov13_0222A268
ov13_0222A268: ; 0x0222A268
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _0222A2E0 ; =ov13_0224F4C0
	mov r4, r0
	ldr r2, [r2]
	ldr r1, _0222A2E4 ; =0x01FF0000
	ldr r0, [r2, #0x34]
	ldr r0, [r0]
	and r2, r0, r1
	and r0, r0, #0xff
	sub r1, r0, #0xc
	mov r0, r2, lsr #0x10
	str r0, [sp, #4]
	str r1, [sp]
	cmp r1, #0x91
	mov r0, #3
	ble _0222A2B8
	bl ov13_0222AAFC
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_0222A2B8:
	mov r1, #0x91
	bl ov13_0222AAFC
	mov r0, #4
	mov r1, #0xc0
	bl ov13_0222AAFC
	ldr r1, _0222A2E8 ; =ov13_0222A2EC
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222A2E0: .word ov13_0224F4C0
_0222A2E4: .word 0x01FF0000
_0222A2E8: .word ov13_0222A2EC
	arm_func_end ov13_0222A268

	arm_func_start ov13_0222A2EC
ov13_0222A2EC: ; 0x0222A2EC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _0222A358 ; =ov13_0224F4C0
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0, #0x40]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp]
	sub r1, r0, #0xc
	str r1, [sp]
	cmp r1, #0xaa
	mov r0, #4
	ble _0222A338
	bl ov13_0222AAFC
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_0222A338:
	mov r1, #0xaa
	bl ov13_0222AAFC
	bl ov13_0222AE24
	ldr r1, _0222A35C ; =ov13_0222A360
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222A358: .word ov13_0224F4C0
_0222A35C: .word ov13_0222A360
	arm_func_end ov13_0222A2EC

	arm_func_start ov13_0222A360
ov13_0222A360: ; 0x0222A360
	stmdb sp!, {r3, lr}
	bl ov13_0222A378
	bl ov13_0222A554
	bl ov13_0222A724
	bl ov13_0222A960
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222A360

	arm_func_start ov13_0222A378
ov13_0222A378: ; 0x0222A378
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _0222A534 ; =ov13_02245958
	bl ov13_022417DC
	cmp r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _0222A538 ; =ov13_0224F4C0
	mvn r1, #0
	ldr r0, [r0]
	ldr r7, _0222A53C ; =ov13_0224527A
	ldr r6, _0222A540 ; =ov13_02245228
	strb r1, [r0, #0x61]
	mov r4, #0
	add r5, sp, #0
_0222A3B4:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov13_02240E74
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _0222A414
	ldr r0, _0222A538 ; =ov13_0224F4C0
	ldr r0, [r0]
	ldrb r0, [r0, #0x67]
	cmp r0, #0
	bne _0222A3F8
	mov r0, #9
	bl ov13_0223ABB8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222A3F8:
	mov r0, #0
	bl ov13_0223ABB8
	ldr r0, _0222A538 ; =ov13_0224F4C0
	add sp, sp, #8
	ldr r0, [r0]
	strb r4, [r0, #0x61]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222A414:
	add r4, r4, #1
	cmp r4, #0xa
	add r7, r7, #4
	blt _0222A3B4
	ldr r7, _0222A544 ; =ov13_02245250
	ldr r6, _0222A548 ; =ov13_02245230
	mov r4, #0
	add r5, sp, #0
_0222A434:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov13_02240E74
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _0222A4BC
	cmp r4, #0
	bne _0222A470
	ldr r0, _0222A538 ; =ov13_0224F4C0
	ldr r0, [r0]
	ldrb r0, [r0, #0x66]
	cmp r0, #0
	beq _0222A48C
_0222A470:
	cmp r4, #1
	bne _0222A49C
	ldr r0, _0222A538 ; =ov13_0224F4C0
	ldr r0, [r0]
	ldrb r0, [r0, #0x68]
	cmp r0, #0
	bne _0222A49C
_0222A48C:
	mov r0, #9
	bl ov13_0223ABB8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222A49C:
	mov r0, #0
	bl ov13_0223ABB8
	ldr r0, _0222A538 ; =ov13_0224F4C0
	add r1, r4, #0xa
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x61]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222A4BC:
	add r4, r4, #1
	cmp r4, #2
	add r7, r7, #4
	blt _0222A434
	ldr r6, _0222A54C ; =ov13_02245258
	ldr r5, _0222A550 ; =ov13_02245234
	mov r7, #0
	add r4, sp, #0
_0222A4DC:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov13_02240E74
	mov r0, r4
	bl ov13_022417DC
	cmp r0, #0
	beq _0222A51C
	mov r0, #0
	bl ov13_0223ABB8
	ldr r0, _0222A538 ; =ov13_0224F4C0
	add r1, r7, #0xc
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x61]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222A51C:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _0222A4DC
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A534: .word ov13_02245958
_0222A538: .word ov13_0224F4C0
_0222A53C: .word ov13_0224527A
_0222A540: .word ov13_02245228
_0222A544: .word ov13_02245250
_0222A548: .word ov13_02245230
_0222A54C: .word ov13_02245258
_0222A550: .word ov13_02245234
	arm_func_end ov13_0222A378

	arm_func_start ov13_0222A554
ov13_0222A554: ; 0x0222A554
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r1, _0222A6F8 ; =ov13_0224F4C0
	ldr r0, _0222A6FC ; =ov13_02245958
	ldr r1, [r1]
	mov r2, #0
	strb r2, [r1, #0x60]
	bl ov13_022418EC
	cmp r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r7, _0222A700 ; =ov13_0224527A
	ldr r6, _0222A704 ; =ov13_02245228
	mov r4, #0
	add r5, sp, #0
_0222A590:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov13_02240E74
	mov r0, r5
	bl ov13_022418EC
	cmp r0, #0
	beq _0222A5E8
	ldr r0, _0222A6F8 ; =ov13_0224F4C0
	ldr r2, [r0]
	ldrsb r1, [r2, #0x61]
	cmp r1, r4
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _0222A708 ; =ov13_02245314
	ldrb r1, [r1, r4]
	strb r1, [r2, #0x60]
	ldr r0, [r0]
	strb r4, [r0, #0x63]
	bl ov13_0222AE24
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222A5E8:
	add r4, r4, #1
	cmp r4, #0xa
	add r7, r7, #4
	blt _0222A590
	ldr r7, _0222A70C ; =ov13_02245250
	ldr r6, _0222A710 ; =ov13_02245230
	mov r4, #0
	add r5, sp, #0
_0222A608:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov13_02240E74
	mov r0, r5
	bl ov13_022418EC
	cmp r0, #0
	beq _0222A664
	ldr r0, _0222A6F8 ; =ov13_0224F4C0
	add r2, r4, #0xa
	ldr r3, [r0]
	ldrsb r1, [r3, #0x61]
	cmp r1, r2
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _0222A714 ; =ov13_02245224
	ldrb r1, [r1, r4]
	strb r1, [r3, #0x60]
	ldr r0, [r0]
	strb r2, [r0, #0x63]
	bl ov13_0222AE24
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222A664:
	add r4, r4, #1
	cmp r4, #2
	add r7, r7, #4
	blt _0222A608
	ldr r7, _0222A718 ; =ov13_02245258
	ldr r6, _0222A71C ; =ov13_02245234
	mov r4, #0
	add r5, sp, #0
_0222A684:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov13_02240E74
	mov r0, r5
	bl ov13_022418EC
	cmp r0, #0
	beq _0222A6E0
	ldr r0, _0222A6F8 ; =ov13_0224F4C0
	add r2, r4, #0xc
	ldr r3, [r0]
	ldrsb r1, [r3, #0x61]
	cmp r1, r2
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _0222A720 ; =ov13_02245220
	ldrb r1, [r1, r4]
	strb r1, [r3, #0x60]
	ldr r0, [r0]
	strb r2, [r0, #0x63]
	bl ov13_0222AE24
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222A6E0:
	add r4, r4, #1
	cmp r4, #2
	add r7, r7, #4
	blt _0222A684
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A6F8: .word ov13_0224F4C0
_0222A6FC: .word ov13_02245958
_0222A700: .word ov13_0224527A
_0222A704: .word ov13_02245228
_0222A708: .word ov13_02245314
_0222A70C: .word ov13_02245250
_0222A710: .word ov13_02245230
_0222A714: .word ov13_02245224
_0222A718: .word ov13_02245258
_0222A71C: .word ov13_02245234
_0222A720: .word ov13_02245220
	arm_func_end ov13_0222A554

	arm_func_start ov13_0222A724
ov13_0222A724: ; 0x0222A724
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _0222A8F4 ; =ov13_02245958
	bl ov13_02241754
	cmp r0, #0
	beq _0222A8D4
	ldr r7, _0222A8F8 ; =ov13_0224527A
	ldr r5, _0222A8FC ; =ov13_02245228
	mov r6, #0
	add r4, sp, #0
_0222A74C:
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl ov13_02240E74
	mov r0, r4
	bl ov13_02241754
	cmp r0, #0
	beq _0222A78C
	ldr r0, _0222A900 ; =ov13_0224F4C0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x61]
	cmp r0, r6
	bne _0222A8D4
	mov r0, r6
	bl ov13_0222A914
	b _0222A8DC
_0222A78C:
	add r6, r6, #1
	cmp r6, #0xa
	add r7, r7, #4
	blt _0222A74C
	ldr r6, _0222A904 ; =ov13_02245250
	ldr r5, _0222A908 ; =ov13_02245230
	mov r7, #0
	add r4, sp, #0
_0222A7AC:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov13_02240E74
	mov r0, r4
	bl ov13_02241754
	cmp r0, #0
	beq _0222A864
	ldr r1, _0222A900 ; =ov13_0224F4C0
	add r0, r7, #0xa
	ldr r1, [r1]
	ldrsb r1, [r1, #0x61]
	cmp r1, r0
	bne _0222A8D4
	bl ov13_0222A914
	cmp r7, #0
	bne _0222A8DC
	ldr r0, _0222A900 ; =ov13_0224F4C0
	ldr r2, [r0]
	ldrb r1, [r2, #0x65]
	add r1, r1, #1
	strb r1, [r2, #0x65]
	ldr r2, [r0]
	ldrb r1, [r2, #0x65]
	cmp r1, #0x28
	addlo sp, sp, #8
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r2, #0x66]
	cmp r1, #0
	bne _0222A844
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _0222A900 ; =ov13_0224F4C0
	mvn r1, #0
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x61]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222A844:
	mov r1, #0x10
	strb r1, [r2, #0x60]
	ldr r1, [r0]
	add sp, sp, #8
	ldrb r0, [r1, #0x65]
	sub r0, r0, #7
	strb r0, [r1, #0x65]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222A864:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _0222A7AC
	ldr r6, _0222A90C ; =ov13_02245258
	ldr r5, _0222A910 ; =ov13_02245234
	mov r7, #0
	add r4, sp, #0
_0222A884:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov13_02240E74
	mov r0, r4
	bl ov13_02241754
	cmp r0, #0
	beq _0222A8C4
	ldr r1, _0222A900 ; =ov13_0224F4C0
	add r0, r7, #0xc
	ldr r1, [r1]
	ldrsb r1, [r1, #0x61]
	cmp r1, r0
	bne _0222A8D4
	bl ov13_0222A914
	b _0222A8DC
_0222A8C4:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _0222A884
_0222A8D4:
	mvn r0, #0
	bl ov13_0222A914
_0222A8DC:
	ldr r0, _0222A900 ; =ov13_0224F4C0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x65]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A8F4: .word ov13_02245958
_0222A8F8: .word ov13_0224527A
_0222A8FC: .word ov13_02245228
_0222A900: .word ov13_0224F4C0
_0222A904: .word ov13_02245250
_0222A908: .word ov13_02245230
_0222A90C: .word ov13_02245258
_0222A910: .word ov13_02245234
	arm_func_end ov13_0222A724

	arm_func_start ov13_0222A914
ov13_0222A914: ; 0x0222A914
	stmdb sp!, {r4, lr}
	ldr r1, _0222A95C ; =ov13_0224F4C0
	mov r4, r0
	ldr r1, [r1]
	ldrsb r1, [r1, #0x62]
	cmp r4, r1
	ldmeqia sp!, {r4, pc}
	mov r1, #1
	bl ov13_0222AD5C
	ldr r0, _0222A95C ; =ov13_0224F4C0
	mov r1, #0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x62]
	bl ov13_0222AD5C
	ldr r0, _0222A95C ; =ov13_0224F4C0
	ldr r0, [r0]
	strb r4, [r0, #0x62]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222A95C: .word ov13_0224F4C0
	arm_func_end ov13_0222A914

	arm_func_start ov13_0222A960
ov13_0222A960: ; 0x0222A960
	stmdb sp!, {r3, lr}
	mov r0, #0x20
	bl ov13_022416D4
	cmp r0, #0
	beq _0222A97C
	mov r0, #0
	bl ov13_0222AEB0
_0222A97C:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _0222A994
	mov r0, #1
	bl ov13_0222AEB0
_0222A994:
	mov r0, #0x10
	bl ov13_022416D4
	cmp r0, #0
	beq _0222A9AC
	mov r0, #2
	bl ov13_0222AEB0
_0222A9AC:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	beq _0222A9C4
	mov r0, #3
	bl ov13_0222AEB0
_0222A9C4:
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _0222AA70
	ldr r0, _0222AAEC ; =ov13_0224F4C0
	ldr r0, [r0]
	ldrsb r2, [r0, #0x63]
	cmp r2, #0xa
	bge _0222AA10
	ldrb r1, [r0, #0x67]
	cmp r1, #0
	beq _0222AA04
	ldr r1, _0222AAF0 ; =ov13_02245314
	ldrb r1, [r1, r2]
	strb r1, [r0, #0x60]
	ldmia sp!, {r3, pc}
_0222AA04:
	mov r0, #9
	bl ov13_0223ABB8
	ldmia sp!, {r3, pc}
_0222AA10:
	sub r1, r2, #0xa
	cmp r1, #2
	bge _0222AA60
	cmp r1, #0
	ldreqb r1, [r0, #0x66]
	cmpeq r1, #0
	beq _0222AA40
	sub r1, r2, #0xa
	cmp r1, #1
	ldreqb r1, [r0, #0x68]
	cmpeq r1, #0
	bne _0222AA4C
_0222AA40:
	mov r0, #9
	bl ov13_0223ABB8
	ldmia sp!, {r3, pc}
_0222AA4C:
	ldr r1, _0222AAF4 ; =ov13_02245224
	sub r2, r2, #0xa
	ldrb r1, [r1, r2]
	strb r1, [r0, #0x60]
	ldmia sp!, {r3, pc}
_0222AA60:
	ldr r1, _0222AAF8 ; =ov13_02245220
	sub r2, r2, #0xc
	ldrb r1, [r1, r2]
	strb r1, [r0, #0x60]
_0222AA70:
	mov r0, #2
	bl ov13_022416D4
	cmp r0, #0
	beq _0222AAC8
	ldr r0, _0222AAEC ; =ov13_0224F4C0
	ldr r1, [r0]
	ldrb r0, [r1, #0x66]
	cmp r0, #0
	bne _0222AABC
	ldrb r0, [r1, #0x69]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _0222AAEC ; =ov13_0224F4C0
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x69]
	ldmia sp!, {r3, pc}
_0222AABC:
	mov r0, #0x10
	strb r0, [r1, #0x60]
	ldmia sp!, {r3, pc}
_0222AAC8:
	mov r0, #2
	bl ov13_02241714
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _0222AAEC ; =ov13_0224F4C0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x69]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222AAEC: .word ov13_0224F4C0
_0222AAF0: .word ov13_02245314
_0222AAF4: .word ov13_02245224
_0222AAF8: .word ov13_02245220
	arm_func_end ov13_0222A960

	arm_func_start ov13_0222AAFC
ov13_0222AAFC: ; 0x0222AAFC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r2, _0222AD40 ; =ov13_02245228
	mov sl, r0
	ldrb r3, [r2, #0x15]
	ldrb r0, [r2, #0x16]
	ldrb r4, [r2, #0x17]
	strb r3, [sp, #0xe]
	strb r0, [sp, #0xf]
	ldrb r0, [r2, #0x18]
	mov sb, r1
	add r3, sp, #0xe
	strb r4, [sp, #0x10]
	strb r0, [sp, #0x11]
	ldrb r0, [r2, #0x19]
	add lr, sl, sl, lsl #1
	mov r4, lr
	strb r0, [sp, #0x12]
	ldrb r6, [r2, #0x1a]
	ldrb r1, [r2, #0x1b]
	ldrb r0, [r3, sl]
	mov r5, #0
	strb r6, [sp, #9]
	strb r1, [sp, #0xa]
	ldrb r6, [r2, #0x1c]
	ldrb r1, [r2, #0x1d]
	cmp r0, #0
	strb r6, [sp, #0xb]
	strb r1, [sp, #0xc]
	ldrb r0, [r2, #0x1e]
	strb r0, [sp, #0xd]
	ldrb r1, [r2, #0x10]
	ldrb r0, [r2, #0x11]
	strb r1, [sp, #4]
	strb r0, [sp, #5]
	ldrb r1, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	strb r1, [sp, #6]
	strb r0, [sp, #7]
	ldrb r0, [r2, #0x14]
	strb r0, [sp, #8]
	ble _0222AC10
	ldr r0, _0222AD44 ; =ov13_0224527A
	ldr fp, _0222AD48 ; =ov13_0224F4C0
	ldr r7, _0222AD4C ; =0xC1FFFCFF
	ldr r8, _0222AD50 ; =0xFE00FF00
	and r6, sb, #0xff
_0222ABB8:
	ldr r1, [fp]
	mov r2, r4, lsl #2
	add r1, r1, r4, lsl #2
	ldr r1, [r1, #0x10]
	ldrh r2, [r0, r2]
	ldr ip, [r1]
	add r5, r5, #1
	and ip, ip, r7
	str ip, [r1]
	ldr ip, [fp]
	mov r1, r2, lsl #0x17
	add r2, ip, r4, lsl #2
	ldr r2, [r2, #0x10]
	add r4, r4, #1
	ldr ip, [r2]
	and ip, ip, r8
	orr ip, ip, r6
	orr r1, ip, r1, lsr #7
	str r1, [r2]
	ldrb r1, [r3, sl]
	cmp r5, r1
	blt _0222ABB8
_0222AC10:
	cmp sl, #4
	bge _0222AC48
	ldr r0, _0222AD48 ; =ov13_0224F4C0
	ldr r1, _0222AD44 ; =ov13_0224527A
	ldr r3, [r0]
	mov r0, lr, lsl #2
	mov r2, #2
	str r2, [sp]
	add r2, r3, sl, lsl #2
	ldrh r1, [r1, r0]
	ldr r0, [r3, sl, lsl #2]
	ldr r3, [r2, #0x48]
	mov r2, sb
	bl ov13_02240D94
_0222AC48:
	add r3, sp, #9
	ldrb r0, [r3, sl]
	mov r5, #0
	cmp r0, #0
	ble _0222ACC4
	ldr r0, _0222AD54 ; =ov13_02245250
	ldr r8, _0222AD48 ; =ov13_0224F4C0
	ldr r6, _0222AD4C ; =0xC1FFFCFF
	ldr r7, _0222AD50 ; =0xFE00FF00
	and r4, sb, #0xff
_0222AC70:
	ldr r1, [r8]
	mov r2, r5, lsl #2
	add r1, r1, r5, lsl #2
	ldr fp, [r1, #0x38]
	ldrh r1, [r0, r2]
	ldr r2, [fp]
	and r2, r2, r6
	str r2, [fp]
	ldr r2, [r8]
	mov r1, r1, lsl #0x17
	add r2, r2, r5, lsl #2
	ldr r2, [r2, #0x38]
	add r5, r5, #1
	ldr fp, [r2]
	and fp, fp, r7
	orr fp, fp, r4
	orr r1, fp, r1, lsr #7
	str r1, [r2]
	ldrb r1, [r3, sl]
	cmp r5, r1
	blt _0222AC70
_0222ACC4:
	add r7, sp, #4
	ldrb r0, [r7, sl]
	mov r8, #0
	cmp r0, #0
	addle sp, sp, #0x14
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, _0222AD58 ; =ov13_02245258
	ldr r4, _0222AD48 ; =ov13_0224F4C0
	mvn r6, #0
	mov fp, r8
_0222ACEC:
	ldr r0, [r4]
	mov r1, r6
	add r0, r0, r8, lsl #2
	ldr r0, [r0, #0x40]
	mov r2, fp
	mov r3, fp
	bl ov13_0223FDF4
	ldr r0, [r4]
	mov r1, r8, lsl #2
	add r0, r0, r8, lsl #2
	ldr r0, [r0, #0x40]
	ldrh r2, [r5, r1]
	mov r1, r6
	mov r3, sb
	bl ov13_0223FF18
	ldrb r0, [r7, sl]
	add r8, r8, #1
	cmp r8, r0
	blt _0222ACEC
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0222AD40: .word ov13_02245228
_0222AD44: .word ov13_0224527A
_0222AD48: .word ov13_0224F4C0
_0222AD4C: .word 0xC1FFFCFF
_0222AD50: .word 0xFE00FF00
_0222AD54: .word ov13_02245250
_0222AD58: .word ov13_02245258
	arm_func_end ov13_0222AAFC

	arm_func_start ov13_0222AD5C
ov13_0222AD5C: ; 0x0222AD5C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmltia sp!, {r3, pc}
	cmp r0, #0xa
	bge _0222ADA8
	ldr r2, _0222AE18 ; =ov13_0224F4C0
	ldr r3, _0222AE1C ; =ov13_0224521C
	ldr r2, [r2]
	ldrb r1, [r3, r1]
	add r0, r2, r0, lsl #2
	ldr r2, [r0, #0x10]
	ldr r0, [r2]
	bic r0, r0, #0xc00
	str r0, [r2]
	ldrh r0, [r2, #4]
	bic r0, r0, #0xf000
	orr r0, r0, r1, lsl #12
	strh r0, [r2, #4]
	ldmia sp!, {r3, pc}
_0222ADA8:
	sub ip, r0, #0xa
	cmp ip, #2
	bge _0222ADEC
	ldr r0, _0222AE18 ; =ov13_0224F4C0
	ldr r2, _0222AE1C ; =ov13_0224521C
	ldr r3, [r0]
	ldrb r0, [r2, r1]
	add r1, r3, ip, lsl #2
	ldr r2, [r1, #0x38]
	ldr r1, [r2]
	bic r1, r1, #0xc00
	str r1, [r2]
	ldrh r1, [r2, #4]
	bic r1, r1, #0xf000
	orr r0, r1, r0, lsl #12
	strh r0, [r2, #4]
	ldmia sp!, {r3, pc}
_0222ADEC:
	ldr r2, _0222AE18 ; =ov13_0224F4C0
	ldr r3, _0222AE20 ; =ov13_02245210
	ldr r2, [r2]
	sub r0, r0, #0xc
	add r0, r2, r0, lsl #2
	ldrb r3, [r3, r1]
	ldr r0, [r0, #0x40]
	mvn r1, #0
	mov r2, #0
	bl ov13_0223FE98
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222AE18: .word ov13_0224F4C0
_0222AE1C: .word ov13_0224521C
_0222AE20: .word ov13_02245210
	arm_func_end ov13_0222AD5C

	arm_func_start ov13_0222AE24
ov13_0222AE24: ; 0x0222AE24
	stmdb sp!, {r4, lr}
	ldr r0, _0222AEA4 ; =ov13_0224F4C0
	ldr r1, [r0]
	ldrsb r0, [r1, #0x63]
	cmp r0, #0xb
	movle r4, #0x44
	ldr r0, [r1, #0x58]
	movgt r4, #0x45
	mov r1, #0
	bl ov13_0223FDE0
	mov r2, r0
	mov r1, r4
	mov r0, #0
	bl ov13_022400F0
	ldr r0, _0222AEA4 ; =ov13_0224F4C0
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #2
	ldr r0, [r0, #0x58]
	bl ov13_02240008
	ldr r0, _0222AEA4 ; =ov13_0224F4C0
	ldr r2, _0222AEA8 ; =ov13_022452A2
	ldr r0, [r0]
	ldr r3, _0222AEAC ; =ov13_022452A4
	ldrsb ip, [r0, #0x63]
	ldr r0, [r0, #0x58]
	mvn r1, #0
	mov ip, ip, lsl #2
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	bl ov13_0223FF18
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222AEA4: .word ov13_0224F4C0
_0222AEA8: .word ov13_022452A2
_0222AEAC: .word ov13_022452A4
	arm_func_end ov13_0222AE24

	arm_func_start ov13_0222AEB0
ov13_0222AEB0: ; 0x0222AEB0
	stmdb sp!, {r3, lr}
	ldr r1, _0222AF54 ; =ov13_0224F4C0
	ldr r2, _0222AF58 ; =ov13_022452DA
	ldr r3, [r1]
	ldrsb ip, [r3, #0x63]
	add r2, r2, ip, lsl #2
	ldrsb r2, [r0, r2]
	strb r2, [r3, #0x63]
	ldr r2, [r1]
	ldrsb r1, [r2, #0x63]
	cmp r1, #0xd
	bne _0222AEF0
	cmp r0, #1
	cmpne r0, #3
	streqb ip, [r2, #0x64]
	beq _0222AF44
_0222AEF0:
	mvn r0, #0
	cmp r1, r0
	bne _0222AF1C
	ldrsb r0, [r2, #0x64]
	cmp r0, #1
	cmpne r0, #0xa
	moveq r0, #0xa
	streqb r0, [r2, #0x63]
	movne r0, #0xb
	strneb r0, [r2, #0x63]
	b _0222AF44
_0222AF1C:
	sub r0, r0, #1
	cmp r1, r0
	bne _0222AF44
	ldrsb r0, [r2, #0x64]
	cmp r0, #1
	cmpne r0, #0xa
	moveq r0, #1
	streqb r0, [r2, #0x63]
	movne r0, #2
	strneb r0, [r2, #0x63]
_0222AF44:
	bl ov13_0222AE24
	mov r0, #8
	bl ov13_0223ABB8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222AF54: .word ov13_0224F4C0
_0222AF58: .word ov13_022452DA
	arm_func_end ov13_0222AEB0

	arm_func_start ov13_0222AF5C
ov13_0222AF5C: ; 0x0222AF5C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _0222AFC8 ; =ov13_0224F4C0
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0
	ldr r0, [r0, #0x40]
	bl ov13_0223FDE0
	ldr r2, [r0]
	ldr r0, _0222AFCC ; =0x01FF0000
	and r1, r2, #0xff
	and r0, r2, r0
	mov r2, r0, lsr #0x10
	add r1, r1, #0xc
	str r1, [sp]
	mov r0, #4
	str r2, [sp, #4]
	bl ov13_0222AAFC
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldr r1, _0222AFD0 ; =ov13_0222AFD4
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222AFC8: .word ov13_0224F4C0
_0222AFCC: .word 0x01FF0000
_0222AFD0: .word ov13_0222AFD4
	arm_func_end ov13_0222AF5C

	arm_func_start ov13_0222AFD4
ov13_0222AFD4: ; 0x0222AFD4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _0222B038 ; =ov13_0224F4C0
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _0222B03C ; =0x01FF0000
	ldr r2, [r0, #0x34]
	mov r0, #3
	ldr r3, [r2]
	and r2, r3, #0xff
	and r3, r3, r1
	add r1, r2, #0xc
	mov r2, r3, lsr #0x10
	str r1, [sp]
	str r2, [sp, #4]
	bl ov13_0222AAFC
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldr r1, _0222B040 ; =ov13_0222B044
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222B038: .word ov13_0224F4C0
_0222B03C: .word 0x01FF0000
_0222B040: .word ov13_0222B044
	arm_func_end ov13_0222AFD4

	arm_func_start ov13_0222B044
ov13_0222B044: ; 0x0222B044
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _0222B0A8 ; =ov13_0224F4C0
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _0222B0AC ; =0x01FF0000
	ldr r2, [r0, #0x28]
	mov r0, #2
	ldr r3, [r2]
	and r2, r3, #0xff
	and r3, r3, r1
	add r1, r2, #0xc
	mov r2, r3, lsr #0x10
	str r1, [sp]
	str r2, [sp, #4]
	bl ov13_0222AAFC
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldr r1, _0222B0B0 ; =ov13_0222B0B4
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222B0A8: .word ov13_0224F4C0
_0222B0AC: .word 0x01FF0000
_0222B0B0: .word ov13_0222B0B4
	arm_func_end ov13_0222B044

	arm_func_start ov13_0222B0B4
ov13_0222B0B4: ; 0x0222B0B4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _0222B118 ; =ov13_0224F4C0
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _0222B11C ; =0x01FF0000
	ldr r2, [r0, #0x1c]
	mov r0, #1
	ldr r3, [r2]
	and r2, r3, #0xff
	and r3, r3, r1
	add r1, r2, #0xc
	mov r2, r3, lsr #0x10
	str r1, [sp]
	str r2, [sp, #4]
	bl ov13_0222AAFC
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldr r1, _0222B120 ; =ov13_0222B124
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222B118: .word ov13_0224F4C0
_0222B11C: .word 0x01FF0000
_0222B120: .word ov13_0222B124
	arm_func_end ov13_0222B0B4

	arm_func_start ov13_0222B124
ov13_0222B124: ; 0x0222B124
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _0222B188 ; =ov13_0224F4C0
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _0222B18C ; =0x01FF0000
	ldr r2, [r0, #0x10]
	mov r0, #0
	ldr r3, [r2]
	and r2, r3, #0xff
	and r3, r3, r1
	add r1, r2, #0xc
	mov r2, r3, lsr #0x10
	str r1, [sp]
	str r2, [sp, #4]
	bl ov13_0222AAFC
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldr r1, _0222B190 ; =ov13_0222B194
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222B188: .word ov13_0224F4C0
_0222B18C: .word 0x01FF0000
_0222B190: .word ov13_0222B194
	arm_func_end ov13_0222B124

	arm_func_start ov13_0222B194
ov13_0222B194: ; 0x0222B194
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, r0
	mov r0, #0
	bl ov13_022425D0
	ldr r4, _0222B24C ; =ov13_0224F4C0
	mov r5, #0
_0222B1AC:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x48]
	bl ov13_0223FD60
	ldr r0, [r4]
	ldr r0, [r0, r5, lsl #2]
	bl ov13_02240874
	add r5, r5, #1
	cmp r5, #4
	blt _0222B1AC
	ldr r4, _0222B24C ; =ov13_0224F4C0
	mov r5, #0
_0222B1DC:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x40]
	bl ov13_0223FD60
	add r5, r5, #1
	cmp r5, #2
	blt _0222B1DC
	ldr r4, _0222B24C ; =ov13_0224F4C0
	mov r5, #0
_0222B200:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x38]
	bl ov13_02241D98
	add r5, r5, #1
	cmp r5, #2
	blt _0222B200
	ldr r4, _0222B24C ; =ov13_0224F4C0
	mov r5, #0
_0222B224:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x10]
	bl ov13_02241D98
	add r5, r5, #1
	cmp r5, #0xa
	blt _0222B224
	ldr r0, _0222B250 ; =ov13_0224F4C0
	bl ov13_022412B0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0222B24C: .word ov13_0224F4C0
_0222B250: .word ov13_0224F4C0
	arm_func_end ov13_0222B194

	arm_func_start ov13_0222B254
ov13_0222B254: ; 0x0222B254
	stmdb sp!, {lr}
	sub sp, sp, #0x104
	mov r0, #0x26c
	mov r1, #4
	bl ov13_0224128C
	ldr r3, _0222B354 ; =ov13_0224F4C4
	add r1, sp, #0
	str r0, [r3, #4]
	mov r0, #0
	mov r2, #0x104
	strb r0, [r3]
	bl MIi_CpuClear16
	mov r3, #0x50
	mov r2, #0xc
	ldr r0, _0222B358 ; =ov13_02245320
	add r1, sp, #4
	strb r3, [sp]
	strh r2, [sp, #2]
	bl MI_CpuCopy8
	ldr r0, _0222B354 ; =ov13_0224F4C4
	mov r2, #3
	ldr r1, [r0, #4]
	add ip, sp, #0
	strh r2, [r1]
	ldr lr, [r0, #4]
	mov r2, #0x41
	add r3, lr, #2
_0222B2C0:
	ldrh r1, [ip]
	ldrh r0, [ip, #2]
	add ip, ip, #4
	subs r2, r2, #1
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	bne _0222B2C0
	ldr r1, _0222B354 ; =ov13_0224F4C4
	mov r3, #1
	add r0, lr, #0x100
	strh r3, [r0, #6]
	ldr r0, [r1, #4]
	sub r2, r3, #2
	add r0, r0, #0x100
	strh r2, [r0, #8]
	ldr r0, [r1, #4]
	add r0, r0, #0x100
	strh r3, [r0, #0xa]
	ldr r0, [r1, #4]
	add r0, r0, #0x100
	strh r2, [r0, #0xc]
	ldr r0, [r1, #4]
	add r0, r0, #0x100
	strh r2, [r0, #0xe]
	ldr r0, [r1, #4]
	add r0, r0, #0x110
	bl OS_GetMacAddress
	ldr r0, _0222B35C ; =ov13_0222B414
	ldr r1, _0222B360 ; =ov13_0222B424
	bl ov13_02222C1C
	cmp r0, #0
	addeq sp, sp, #0x104
	ldmeqia sp!, {pc}
	bl OS_Terminate
	add sp, sp, #0x104
	ldmia sp!, {pc}
	.balign 4, 0
_0222B354: .word ov13_0224F4C4
_0222B358: .word ov13_02245320
_0222B35C: .word ov13_0222B414
_0222B360: .word ov13_0222B424
	arm_func_end ov13_0222B254

	arm_func_start ov13_0222B364
ov13_0222B364: ; 0x0222B364
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov13_02222CE0
	cmp r4, #0
	beq _0222B3A0
	ldr r0, _0222B3AC ; =ov13_0224F4C4
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x116]
	cmp r1, #0
	ldreqb r0, [r0]
	cmpeq r0, #1
	bne _0222B3A0
	add r0, r2, #0x17
	add r0, r0, #0x100
	bl ov13_0223A6E4
_0222B3A0:
	ldr r0, _0222B3B0 ; =ov13_0224F4C8
	bl ov13_022412B0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222B3AC: .word ov13_0224F4C4
_0222B3B0: .word ov13_0224F4C8
	arm_func_end ov13_0222B364

	arm_func_start ov13_0222B3B4
ov13_0222B3B4: ; 0x0222B3B4
	stmdb sp!, {r3, lr}
	ldr r0, _0222B410 ; =ov13_0224F4C4
	ldr r0, [r0, #4]
	bl ov13_02220908
	cmp r0, #0
	bne _0222B3DC
	ldr r1, _0222B410 ; =ov13_0224F4C4
	mov r0, #1
	strb r0, [r1]
	ldmia sp!, {r3, pc}
_0222B3DC:
	ldr r0, _0222B410 ; =ov13_0224F4C4
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x116]
	cmp r0, #1
	beq _0222B400
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #2
	bhi _0222B408
_0222B400:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0222B408:
	mov r0, #2
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222B410: .word ov13_0224F4C4
	arm_func_end ov13_0222B3B4

	arm_func_start ov13_0222B414
ov13_0222B414: ; 0x0222B414
	ldr ip, _0222B420 ; =ov13_0224128C
	mov r1, #0x20
	bx ip
	.balign 4, 0
_0222B420: .word ov13_0224128C
	arm_func_end ov13_0222B414

	arm_func_start ov13_0222B424
ov13_0222B424: ; 0x0222B424
	ldr ip, _0222B42C ; =ov13_022412F4
	bx ip
	.balign 4, 0
_0222B42C: .word ov13_022412F4
	arm_func_end ov13_0222B424

	arm_func_start ov13_0222B430
ov13_0222B430: ; 0x0222B430
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _0222B4B4 ; =ov13_0224F4CC
	str r0, [r3, #4]
	mov r0, r1
	mov r1, r2
	bl ov13_0222B4BC
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _0222B4B4 ; =ov13_0224F4CC
	mov r1, #0
	strb r1, [r0, #1]
	bl ov13_0222B558
	bl ov13_0222B620
	bl ov13_0223AAFC
	ldr r0, _0222B4B8 ; =ov13_0222C1BC
	bl ov13_0222B8E8
	ldr r4, _0222B4B4 ; =ov13_0224F4CC
	mov r5, #0
_0222B47C:
	bl ov13_022413E4
	ldr r0, [r4, #0xc]
	blx r0
	mov r0, r5
	bl ov13_02242478
	bl ov13_02241A44
	bl ov13_022422E0
	bl OS_WaitVBlankIntr
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0222B47C
	bl ov13_0222B898
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0222B4B4: .word ov13_0224F4CC
_0222B4B8: .word ov13_0222C1BC
	arm_func_end ov13_0222B430

	arm_func_start ov13_0222B4BC
ov13_0222B4BC: ; 0x0222B4BC
	ldr r2, _0222B554 ; =ov13_0224F4CC
	cmp r0, #0
	strb r0, [r2]
	str r1, [r2, #8]
	blt _0222B4D8
	cmp r0, #6
	ble _0222B4E0
_0222B4D8:
	mov r0, #0
	bx lr
_0222B4E0:
	cmp r0, #1
	bne _0222B4F8
	mov r1, r1, lsr #4
	bics r1, r1, #2
	movne r0, #0
	bxne lr
_0222B4F8:
	ldr r1, _0222B554 ; =ov13_0224F4CC
	ldr r1, [r1, #8]
	mov r2, r1, lsl #0x1c
	mov r2, r2, lsr #0x1c
	cmp r2, #1
	movhi r0, #0
	bxhi lr
	cmp r0, #0
	beq _0222B52C
	mov r1, r1, lsr #4
	tst r1, #1
	movne r0, #0
	bxne lr
_0222B52C:
	cmp r0, #0
	bne _0222B54C
	ldr r0, _0222B554 ; =ov13_0224F4CC
	ldr r0, [r0, #8]
	mov r0, r0, lsr #4
	tst r0, #1
	moveq r0, #0
	bxeq lr
_0222B54C:
	mov r0, #1
	bx lr
	.balign 4, 0
_0222B554: .word ov13_0224F4CC
	arm_func_end ov13_0222B4BC

	arm_func_start ov13_0222B558
ov13_0222B558: ; 0x0222B558
	stmdb sp!, {r3, lr}
	ldr r2, _0222B614 ; =0x04000208
	mov r0, #0
	ldrh r1, [r2]
	strh r0, [r2]
	bl GX_DispOff
	ldr r1, _0222B618 ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	bl OS_IsTickAvailable
	cmp r0, #0
	bne _0222B590
	bl OS_Terminate
_0222B590:
	bl OS_IsAlarmAvailable
	cmp r0, #0
	bne _0222B5A0
	bl OS_Terminate
_0222B5A0:
	mov r0, #0
	bl GX_VBlankIntr
	bl FX_Init
	mvn r0, #0
	bl FS_Init
	bl TP_Init
	bl RTC_Init
	bl GX_DispOff
	ldr r1, _0222B618 ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	bl ov13_022420A0
	ldr r0, _0222B61C ; =ov13_0224F4CC
	ldr r0, [r0, #4]
	bl ov13_022411DC
	bl ov13_02241AC0
	bl ov13_0224231C
	bl ov13_0223F664
	bl ov13_02241330
	bl ov13_02240338
	mov r0, #0x700
	mov r1, #0x20
	bl ov13_0224128C
	str r0, [sp]
	bl DWC_BM_Init
	add r0, sp, #0
	bl ov13_022412B0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222B614: .word 0x04000208
_0222B618: .word 0x04001000
_0222B61C: .word ov13_0224F4CC
	arm_func_end ov13_0222B558

	arm_func_start ov13_0222B620
ov13_0222B620: ; 0x0222B620
	stmdb sp!, {r4, lr}
	mov r0, #0
	bl GX_VBlankIntr
	mov r0, #1
	bl GX_SetBankForBG
	mov r0, #2
	bl GX_SetBankForOBJ
	mov r1, #0
	mov r2, r1
	mov r0, #1
	bl GX_SetGraphicsMode
	mov r3, #0x4000000
	ldr r1, [r3]
	add r0, r3, #0x6c
	bic r1, r1, #0x1f00
	str r1, [r3]
	ldr r2, [r3]
	mov r1, #0
	bic r2, r2, #0xe000
	str r2, [r3]
	bl GXx_SetMasterBrightness_
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r0, _0222B884 ; =0xFFCFFFEF
	ldr r1, _0222B888 ; =0x00200010
	and r0, r2, r0
	orr r0, r0, #0x10
	add ip, r1, #0x3e00000
	orr r0, r0, #0x200000
	str r0, [r3]
	ldrh r1, [r3, #8]
	mov lr, #0
	add r0, r3, #0x50
	bic r1, r1, #0x40
	strh r1, [r3, #8]
	ldrh r4, [r3, #0xa]
	mov r1, #0x3f
	mov r2, #0x10
	bic r4, r4, #0x40
	strh r4, [r3, #0xa]
	ldrh r4, [r3, #0xc]
	bic r4, r4, #0x40
	strh r4, [r3, #0xc]
	ldrh r4, [r3, #0xe]
	bic r4, r4, #0x40
	strh r4, [r3, #0xe]
	str lr, [ip]
	str lr, [r3, #0x14]
	str lr, [r3, #0x18]
	str lr, [r3, #0x1c]
	bl G2x_SetBlendBrightness_
	mov r0, #0x80
	bl GX_SetBankForSubBG
	mov r0, #0x100
	bl GX_SetBankForSubOBJ
	mov r0, #0
	bl GXS_SetGraphicsMode
	ldr r1, _0222B88C ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x1f00
	str r0, [r1]
	ldr r0, [r1]
	bic r0, r0, #0xe000
	str r0, [r1]
	add r0, r1, #0x6c
	mov r1, #0
	bl GXx_SetMasterBrightness_
	ldr r3, _0222B88C ; =0x04001000
	ldr r0, _0222B884 ; =0xFFCFFFEF
	ldr r1, [r3]
	mov ip, #0
	and r0, r1, r0
	orr r0, r0, #0x10
	str r0, [r3]
	ldrh r2, [r3, #8]
	add r0, r3, #0x50
	mov r1, #0x3f
	bic r2, r2, #0x40
	strh r2, [r3, #8]
	ldrh lr, [r3, #0xa]
	mov r2, #0x10
	bic lr, lr, #0x40
	strh lr, [r3, #0xa]
	ldrh lr, [r3, #0xc]
	bic lr, lr, #0x40
	strh lr, [r3, #0xc]
	ldrh lr, [r3, #0xe]
	bic lr, lr, #0x40
	strh lr, [r3, #0xe]
	str ip, [r3, #0x10]
	str ip, [r3, #0x14]
	str ip, [r3, #0x18]
	str ip, [r3, #0x1c]
	bl G2x_SetBlendBrightness_
	ldr r2, _0222B890 ; =0x04000008
	ldr r3, _0222B894 ; =0x0400100A
	ldrh r0, [r2]
	add r1, r2, #0x1000
	and r0, r0, #0x43
	orr r0, r0, #0xc00
	strh r0, [r2]
	ldrh r0, [r2, #2]
	and r0, r0, #0x43
	orr r0, r0, #0x108
	orr r0, r0, #0xc00
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	and r0, r0, #0x43
	orr r0, r0, #0xe10
	strh r0, [r2, #4]
	ldrh r0, [r2, #6]
	and r0, r0, #0x43
	orr r0, r0, #0xf10
	strh r0, [r2, #6]
	ldrh r0, [r1]
	and r0, r0, #0x43
	orr r0, r0, #0xc00
	strh r0, [r1]
	ldrh r0, [r3]
	and r0, r0, #0x43
	orr r0, r0, #0xd00
	strh r0, [r3]
	ldrh r0, [r3, #2]
	and r0, r0, #0x43
	orr r0, r0, #0xe00
	strh r0, [r3, #2]
	ldrh r0, [r3, #4]
	mov r2, #0x4000000
	add r1, r2, #0x304
	and r0, r0, #0x43
	orr r0, r0, #0xf00
	strh r0, [r3, #4]
	ldr r0, [r2]
	bic r0, r0, #0x38000000
	str r0, [r2]
	ldr r0, [r2]
	bic r0, r0, #0x7000000
	str r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #0x8000
	strh r0, [r1]
	bl ov13_02240648
	bl ov13_02241C68
	bl ov13_02241DFC
	bl ov13_0223FADC
	bl GX_DispOn
	ldr r2, _0222B88C ; =0x04001000
	mov r0, #1
	ldr r1, [r2]
	orr r1, r1, #0x10000
	str r1, [r2]
	bl GX_VBlankIntr
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222B884: .word 0xFFCFFFEF
_0222B888: .word 0x00200010
_0222B88C: .word 0x04001000
_0222B890: .word 0x04000008
_0222B894: .word 0x0400100A
	arm_func_end ov13_0222B620

	arm_func_start ov13_0222B898
ov13_0222B898: ; 0x0222B898
	stmdb sp!, {r3, lr}
	bl GX_DispOff
	ldr r1, _0222B8E4 ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	bl ov13_0224230C
	bl ov13_022413AC
	bl ov13_02241B34
	bl ov13_0223AB8C
	bl ov13_0223FBB0
	bl ov13_02241D4C
	bl ov13_0224074C
	bl ov13_02240380
	bl ov13_0223F814
	bl ov13_02242430
	bl ov13_0224121C
	bl ov13_02242154
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222B8E4: .word 0x04001000
	arm_func_end ov13_0222B898

	arm_func_start ov13_0222B8E8
ov13_0222B8E8: ; 0x0222B8E8
	ldr r1, _0222B8F4 ; =ov13_0224F4CC
	str r0, [r1, #0xc]
	bx lr
	.balign 4, 0
_0222B8F4: .word ov13_0224F4CC
	arm_func_end ov13_0222B8E8

	arm_func_start ov13_0222B8F8
ov13_0222B8F8: ; 0x0222B8F8
	ldr r2, _0222B908 ; =ov13_0224F4CC
	str r0, [r2, #0x10]
	str r1, [r2, #0x14]
	bx lr
	.balign 4, 0
_0222B908: .word ov13_0224F4CC
	arm_func_end ov13_0222B8F8

	arm_func_start ov13_0222B90C
ov13_0222B90C: ; 0x0222B90C
	cmp r0, #0
	ldrne r2, _0222B930 ; =ov13_0224F4CC
	ldrne r2, [r2, #0x10]
	strne r2, [r0]
	cmp r1, #0
	ldrne r0, _0222B930 ; =ov13_0224F4CC
	ldrne r0, [r0, #0x14]
	strne r0, [r1]
	bx lr
	.balign 4, 0
_0222B930: .word ov13_0224F4CC
	arm_func_end ov13_0222B90C

	arm_func_start ov13_0222B934
ov13_0222B934: ; 0x0222B934
	ldr r2, _0222B944 ; =ov13_0224F4CC
	str r0, [r2, #0x18]
	str r1, [r2, #0x1c]
	bx lr
	.balign 4, 0
_0222B944: .word ov13_0224F4CC
	arm_func_end ov13_0222B934

	arm_func_start ov13_0222B948
ov13_0222B948: ; 0x0222B948
	cmp r0, #0
	ldrne r2, _0222B96C ; =ov13_0224F4CC
	ldrne r2, [r2, #0x18]
	strne r2, [r0]
	cmp r1, #0
	ldrne r0, _0222B96C ; =ov13_0224F4CC
	ldrne r0, [r0, #0x1c]
	strne r0, [r1]
	bx lr
	.balign 4, 0
_0222B96C: .word ov13_0224F4CC
	arm_func_end ov13_0222B948

	arm_func_start ov13_0222B970
ov13_0222B970: ; 0x0222B970
	ldr r0, _0222B97C ; =ov13_0224F4CC
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
_0222B97C: .word ov13_0224F4CC
	arm_func_end ov13_0222B970

	arm_func_start ov13_0222B980
ov13_0222B980: ; 0x0222B980
	ldr r0, _0222B994 ; =ov13_0224F4CC
	ldr r0, [r0, #8]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	bx lr
	.balign 4, 0
_0222B994: .word ov13_0224F4CC
	arm_func_end ov13_0222B980

	arm_func_start ov13_0222B998
ov13_0222B998: ; 0x0222B998
	ldr r1, _0222B9B0 ; =ov13_0224F4CC
	ldr r1, [r1, #8]
	tst r0, r1, lsr #4
	movne r0, #1
	moveq r0, #0
	bx lr
	.balign 4, 0
_0222B9B0: .word ov13_0224F4CC
	arm_func_end ov13_0222B998

	arm_func_start ov13_0222B9B4
ov13_0222B9B4: ; 0x0222B9B4
	ldr r0, _0222B9C4 ; =ov13_0224F4CC
	mov r1, #1
	strb r1, [r0, #1]
	bx lr
	.balign 4, 0
_0222B9C4: .word ov13_0224F4CC
	arm_func_end ov13_0222B9B4

	arm_func_start ov13_0222B9C8
ov13_0222B9C8: ; 0x0222B9C8
	ldr r0, _0222BA04 ; =ov13_0224F4CC
	ldrb r1, [r0]
	cmp r1, #6
	moveq r0, #0x38
	bxeq lr
	cmp r1, #1
	bne _0222B9F8
	ldr r0, [r0, #8]
	mov r0, r0, lsr #4
	tst r0, #2
	moveq r0, #0x37
	bxeq lr
_0222B9F8:
	add r0, r1, #0x31
	and r0, r0, #0xff
	bx lr
	.balign 4, 0
_0222BA04: .word ov13_0224F4CC
	arm_func_end ov13_0222B9C8

	arm_func_start ov13_0222BA08
ov13_0222BA08: ; 0x0222BA08
	stmdb sp!, {r3, lr}
	mov r0, #0x64
	mov r1, #4
	bl ov13_0224128C
	mov r1, r0
	ldr r3, _0222BA40 ; =ov13_0224F4EC
	mov r0, #8
	mov r2, #0xc
	str r1, [r3]
	bl ov13_0224022C
	ldr r1, _0222BA40 ; =ov13_0224F4EC
	ldr r1, [r1]
	str r0, [r1, #0x60]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222BA40: .word ov13_0224F4EC
	arm_func_end ov13_0222BA08

	arm_func_start ov13_0222BA44
ov13_0222BA44: ; 0x0222BA44
	ldr ip, _0222BA50 ; =ov13_022412B0
	ldr r0, _0222BA54 ; =ov13_0224F4EC
	bx ip
	.balign 4, 0
_0222BA50: .word ov13_022412B0
_0222BA54: .word ov13_0224F4EC
	arm_func_end ov13_0222BA44

	arm_func_start ov13_0222BA58
ov13_0222BA58: ; 0x0222BA58
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0222BAAC ; =ov13_0224F4EC
	mov r5, r0
	ldr r0, [r1]
	ldr r0, [r0, #0x60]
	bl ov13_022402E0
	mov r4, r0
	add r1, sp, #0
	mov r0, r5
	mov r2, #4
	bl ov13_0223F95C
	add r2, r0, #0x20
	str r0, [r4, #8]
	add r0, r2, #0x10
	str r0, [r4]
	ldr r1, [r2, #4]
	mov r0, r4
	add r1, r2, r1
	add r1, r1, #8
	str r1, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0222BAAC: .word ov13_0224F4EC
	arm_func_end ov13_0222BA58

	arm_func_start ov13_0222BAB0
ov13_0222BAB0: ; 0x0222BAB0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	bl ov13_0223FA50
	ldr r0, _0222BAD8 ; =ov13_0224F4EC
	mov r1, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x60]
	bl ov13_02240288
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222BAD8: .word ov13_0224F4EC
	arm_func_end ov13_0222BAB0

	arm_func_start ov13_0222BADC
ov13_0222BADC: ; 0x0222BADC
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	ldmia r0, {r2, r3}
	ldr r0, [r2, r1, lsl #2]
	add r0, r3, r0
	bx lr
	arm_func_end ov13_0222BADC

	arm_func_start ov13_0222BAF4
ov13_0222BAF4: ; 0x0222BAF4
	stmdb sp!, {r3, lr}
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	ldmia r0, {ip, lr}
	ldr r0, [ip, r1, lsl #2]
	cmp r2, #0
	add r0, lr, r0
	addge r3, r3, #0x30
	movge r1, r2, lsl #1
	strgeh r3, [r0, r1]
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222BAF4

	arm_func_start ov13_0222BB20
ov13_0222BB20: ; 0x0222BB20
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x1c
	mov r4, r0
	ldr r0, _0222BBF8 ; =0x0001E2A4
	mov r1, #0x20
	bl ov13_0224128C
	ldr r2, _0222BBFC ; =ov13_0224F4F0
	add r1, r0, #0x1e000
	str r0, [r2]
	str r4, [r1, #0x298]
	ldr r0, [r2]
	mov r4, #0
	add r0, r0, #0x1e000
	strb r4, [r0, #0x2a0]
	ldr r0, [r2]
	ldr lr, _0222BC00 ; =ov13_02245F8C
	add r0, r0, #0x1e000
	strb r4, [r0, #0x2a1]
	add ip, sp, #0
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr r0, _0222BC04 ; =ov13_0224F4F8
	mov r1, r4
	ldr r0, [r0]
	bl ov13_0222BADC
	ldr r1, _0222BC04 ; =ov13_0224F4F8
	str r0, [sp, #4]
	ldr r0, [r1]
	mov r1, #1
	bl ov13_0222BADC
	str r0, [sp, #8]
	bl ov13_0222B9C8
	strb r0, [sp, #0x18]
	ldr r0, _0222BBFC ; =ov13_0224F4F0
	add r1, sp, #0
	ldr r0, [r0]
	bl ov13_0223E80C
	bl ov13_0223EA58
	cmp r0, #0
	bne _0222BBCC
	bl OS_Terminate
_0222BBCC:
	mov r0, #0
	ldr r1, _0222BC08 ; =ov13_0222BCC0
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0222BBFC ; =ov13_0224F4F0
	ldr r1, [r1]
	add r1, r1, #0x1e000
	str r0, [r1, #0x29c]
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0222BBF8: .word 0x0001E2A4
_0222BBFC: .word ov13_0224F4F0
_0222BC00: .word ov13_02245F8C
_0222BC04: .word ov13_0224F4F8
_0222BC08: .word ov13_0222BCC0
	arm_func_end ov13_0222BB20

	arm_func_start ov13_0222BC0C
ov13_0222BC0C: ; 0x0222BC0C
	ldr ip, _0222BC24 ; =ov13_02242528
	mov r0, #0
	ldr r1, _0222BC28 ; =ov13_0222BC2C
	mov r2, r0
	mov r3, #0x78
	bx ip
	.balign 4, 0
_0222BC24: .word ov13_02242528
_0222BC28: .word ov13_0222BC2C
	arm_func_end ov13_0222BC0C

	arm_func_start ov13_0222BC2C
ov13_0222BC2C: ; 0x0222BC2C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov13_0223E8FC
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _0222BC64 ; =ov13_0224F4F0
	mov r1, r4
	ldr r0, [r0]
	mov r3, #1
	add r2, r0, #0x1e000
	mov r0, #0
	strb r3, [r2, #0x2a1]
	bl ov13_022425D0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222BC64: .word ov13_0224F4F0
	arm_func_end ov13_0222BC2C

	arm_func_start ov13_0222BC68
ov13_0222BC68: ; 0x0222BC68
	ldr r0, _0222BC80 ; =ov13_0224F4F0
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.balign 4, 0
_0222BC80: .word ov13_0224F4F0
	arm_func_end ov13_0222BC68

	arm_func_start ov13_0222BC84
ov13_0222BC84: ; 0x0222BC84
	ldr r1, _0222BC98 ; =ov13_0224F4F0
	ldr r1, [r1]
	add r1, r1, #0x1e000
	str r0, [r1, #0x298]
	bx lr
	.balign 4, 0
_0222BC98: .word ov13_0224F4F0
	arm_func_end ov13_0222BC84

	arm_func_start ov13_0222BC9C
ov13_0222BC9C: ; 0x0222BC9C
	ldr ip, _0222BCA4 ; =ov13_0223EAA0
	bx ip
	.balign 4, 0
_0222BCA4: .word ov13_0223EAA0
	arm_func_end ov13_0222BC9C

	arm_func_start ov13_0222BCA8
ov13_0222BCA8: ; 0x0222BCA8
	ldr r0, _0222BCBC ; =ov13_0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x2280
	add r0, r0, #0x1c000
	bx lr
	.balign 4, 0
_0222BCBC: .word ov13_0224F4F0
	arm_func_end ov13_0222BCA8

	arm_func_start ov13_0222BCC0
ov13_0222BCC0: ; 0x0222BCC0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	bl ov13_0223EAD4
	ldr r0, _0222BF58 ; =ov13_0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldrb r1, [r0, #0x2a0]
	cmp r1, #0
	beq _0222BD14
	ldrb r1, [r0, #0x2a1]
	cmp r1, #0
	bne _0222BD14
	ldr r1, [r0, #0x298]
	cmp r1, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	mov r0, #0
	blx r1
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0222BD14:
	add r0, sp, #1
	add r1, sp, #0
	bl ov13_0223EE58
	ldrb r0, [sp, #1]
	cmp r0, #0x1a
	bgt _0222BDA8
	bge _0222BEB4
	cmp r0, #0x14
	bgt _0222BD98
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _0222BF50
_0222BD44: ; jump table
	b _0222BF50 ; case 0
	b _0222BF50 ; case 1
	b _0222BF50 ; case 2
	b _0222BF50 ; case 3
	b _0222BF50 ; case 4
	b _0222BDCC ; case 5
	b _0222BF50 ; case 6
	b _0222BF50 ; case 7
	b _0222BF50 ; case 8
	b _0222BF50 ; case 9
	b _0222BF50 ; case 10
	b _0222BF50 ; case 11
	b _0222BEF8 ; case 12
	b _0222BE2C ; case 13
	b _0222BF50 ; case 14
	b _0222BF50 ; case 15
	b _0222BF50 ; case 16
	b _0222BF50 ; case 17
	b _0222BF50 ; case 18
	b _0222BF50 ; case 19
	b _0222BE70 ; case 20
_0222BD98:
	cmp r0, #0x17
	beq _0222BE70
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0222BDA8:
	cmp r0, #0x1d
	bgt _0222BDBC
	beq _0222BEB4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0222BDBC:
	cmp r0, #0x22
	beq _0222BF3C
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0222BDCC:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	ldr r0, _0222BF58 ; =ov13_0224F4F0
	ldr r0, [r0]
	add r4, r0, #0x2280
	bl ov13_0223EE9C
	add r1, r4, #0x1c000
	mov r2, #0x16
	bl MIi_CpuCopy16
	ldr r0, _0222BF58 ; =ov13_0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	streqb r1, [r0, #0x2a0]
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	mov r0, #0
	blx r1
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0222BE2C:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	ldr r0, _0222BF58 ; =ov13_0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	streqb r1, [r0, #0x2a0]
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	mov r0, #1
	blx r1
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0222BE70:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	ldr r0, _0222BF58 ; =ov13_0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	streqb r1, [r0, #0x2a0]
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	mov r0, #3
	blx r1
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0222BEB4:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	ldr r0, _0222BF58 ; =ov13_0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	streqb r1, [r0, #0x2a0]
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	mov r0, #4
	blx r1
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0222BEF8:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	ldr r0, _0222BF58 ; =ov13_0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	streqb r1, [r0, #0x2a0]
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	mov r0, #2
	blx r1
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0222BF3C:
	mov r1, r4
	mov r0, #0
	bl ov13_022425D0
	ldr r0, _0222BF5C ; =ov13_0224F4F0
	bl ov13_022412B0
_0222BF50:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0222BF58: .word ov13_0224F4F0
_0222BF5C: .word ov13_0224F4F0
	arm_func_end ov13_0222BCC0

	arm_func_start ov13_0222BF60
ov13_0222BF60: ; 0x0222BF60
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov r0, #0xc
	sub r1, r0, #0x10
	bl ov13_0224128C
	ldr r1, _0222BFBC ; =ov13_0224F4F4
	ldr ip, _0222BFC0 ; =ov13_0222C100
	str r0, [r1]
	ldr r2, _0222BFC4 ; =ov13_0222C0D8
	ldr r3, _0222BFC8 ; =ov13_0222C0F0
	str ip, [sp]
	mov ip, #0x800
	mov r0, #0xf
	mov r1, #0x40
	str ip, [sp, #4]
	bl ov13_02226D74
	cmp r0, #1
	beq _0222BFAC
	bl OS_Terminate
_0222BFAC:
	mov r0, #0xa
	bl OS_Sleep
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222BFBC: .word ov13_0224F4F4
_0222BFC0: .word ov13_0222C100
_0222BFC4: .word ov13_0222C0D8
_0222BFC8: .word ov13_0222C0F0
	arm_func_end ov13_0222BF60

	arm_func_start ov13_0222BFCC
ov13_0222BFCC: ; 0x0222BFCC
	stmdb sp!, {r3, lr}
	bl ov13_02226E5C
	cmp r0, #1
	beq _0222BFE0
	bl OS_Terminate
_0222BFE0:
	ldr r0, _0222BFEC ; =ov13_0224F4F4
	bl ov13_022412B0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222BFEC: .word ov13_0224F4F4
	arm_func_end ov13_0222BFCC

	arm_func_start ov13_0222BFF0
ov13_0222BFF0: ; 0x0222BFF0
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xe8
	ldr r1, _0222C0A8 ; =ov13_0224F4F4
	ldr r1, [r1]
	ldr r1, [r1]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _0222C0A0
_0222C010: ; jump table
	b _0222C030 ; case 0
	b _0222C030 ; case 1
	b _0222C03C ; case 2
	b _0222C030 ; case 3
	b _0222C048 ; case 4
	b _0222C030 ; case 5
	b _0222C054 ; case 6
	b _0222C09C ; case 7
_0222C030:
	add sp, sp, #0xe8
	mov r0, #0
	ldmia sp!, {r3, pc}
_0222C03C:
	add sp, sp, #0xe8
	mov r0, #1
	ldmia sp!, {r3, pc}
_0222C048:
	add sp, sp, #0xe8
	mov r0, #2
	ldmia sp!, {r3, pc}
_0222C054:
	add r0, sp, #0
	bl ov13_02226F28
	cmp r0, #1
	beq _0222C068
	bl OS_Terminate
_0222C068:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	blt _0222C090
	cmp r0, #3
	bgt _0222C090
	ldr r0, [sp, #0x24]
	cmp r0, #1
	addeq sp, sp, #0xe8
	moveq r0, #3
	ldmeqia sp!, {r3, pc}
_0222C090:
	add sp, sp, #0xe8
	mov r0, #5
	ldmia sp!, {r3, pc}
_0222C09C:
	mov r0, #4
_0222C0A0:
	add sp, sp, #0xe8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C0A8: .word ov13_0224F4F4
	arm_func_end ov13_0222BFF0

	arm_func_start ov13_0222C0AC
ov13_0222C0AC: ; 0x0222C0AC
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xe8
	add r0, sp, #0
	bl ov13_02226F28
	cmp r0, #1
	beq _0222C0C8
	bl OS_Terminate
_0222C0C8:
	add r0, sp, #0
	bl ov13_0223A5D0
	add sp, sp, #0xe8
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222C0AC

	arm_func_start ov13_0222C0D8
ov13_0222C0D8: ; 0x0222C0D8
	ldr r3, _0222C0EC ; =ov13_0224F4F4
	ldmia r0, {r0, r1, r2}
	ldr r3, [r3]
	stmia r3, {r0, r1, r2}
	bx lr
	.balign 4, 0
_0222C0EC: .word ov13_0224F4F4
	arm_func_end ov13_0222C0D8

	arm_func_start ov13_0222C0F0
ov13_0222C0F0: ; 0x0222C0F0
	ldr ip, _0222C0FC ; =ov13_0224128C
	mov r1, #0x20
	bx ip
	.balign 4, 0
_0222C0FC: .word ov13_0224128C
	arm_func_end ov13_0222C0F0

	arm_func_start ov13_0222C100
ov13_0222C100: ; 0x0222C100
	ldr ip, _0222C108 ; =ov13_022412F4
	bx ip
	.balign 4, 0
_0222C108: .word ov13_022412F4
	arm_func_end ov13_0222C100

	arm_func_start ov13_0222C10C
ov13_0222C10C: ; 0x0222C10C
	stmdb sp!, {r3, lr}
	mov r0, #3
	mov r1, #1
	mov r2, #0x3f
	mov r3, #0x14
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x3f
	mov r3, #0x14
	bl ov13_022403B8
	ldr r0, _0222C144 ; =ov13_0222C148
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C144: .word ov13_0222C148
	arm_func_end ov13_0222C10C

	arm_func_start ov13_0222C148
ov13_0222C148: ; 0x0222C148
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	mov r1, r0
	bl ov13_02242640
	mov r0, #1
	mov r1, #0
	bl ov13_02242640
	mov r0, #1
	bl ov13_022400C8
	mov r0, #0
	bl ov13_022400C8
	bl ov13_02227DD0
	bl ov13_02227B54
	ldr r0, _0222C1B8 ; =ov13_0224F4F8
	ldr r0, [r0]
	bl ov13_0222BAB0
	bl ov13_0222BA44
	bl ov13_02239FDC
	bl ov13_0222B9B4
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C1B8: .word ov13_0224F4F8
	arm_func_end ov13_0222C148

	arm_func_start ov13_0222C1BC
ov13_0222C1BC: ; 0x0222C1BC
	stmdb sp!, {r3, lr}
	bl ov13_02239F98
	bl ov13_0222BA08
	bl ov13_02227B34
	bl ov13_02227D58
	bl ov13_022277A4
	bl ov13_0222B970
	cmp r0, #1
	bne _0222C204
	mov r0, #2
	bl ov13_0222B998
	cmp r0, #0
	beq _0222C204
	ldr r0, _0222C334 ; =ov13_02246034
	bl ov13_0222BA58
	ldr r1, _0222C338 ; =ov13_0224F4F8
	str r0, [r1]
	b _0222C21C
_0222C204:
	bl ov13_0222B970
	ldr r1, _0222C33C ; =ov13_02246018
	ldr r0, [r1, r0, lsl #2]
	bl ov13_0222BA58
	ldr r1, _0222C338 ; =ov13_0224F4F8
	str r0, [r1]
_0222C21C:
	ldr r0, _0222C340 ; =ov13_02246044
	bl ov13_022278C4
	mov r1, r0
	mov r0, #1
	bl ov13_02240098
	ldr r0, _0222C344 ; =ov13_02246058
	bl ov13_022278C4
	mov r1, r0
	mov r0, #0
	bl ov13_02240098
	ldr r0, _0222C348 ; =ov13_0224606C
	ldr r1, _0222C34C ; =GXS_LoadBG1Char
	bl ov13_02227924
	ldr r0, _0222C350 ; =ov13_02246080
	ldr r1, _0222C354 ; =GXS_LoadBGPltt
	bl ov13_02227924
	ldr r0, _0222C358 ; =ov13_02246094
	ldr r1, _0222C35C ; =GXS_LoadOBJ
	bl ov13_02227924
	ldr r0, _0222C360 ; =ov13_022460AC
	ldr r1, _0222C364 ; =GXS_LoadOBJPltt
	bl ov13_02227924
	ldr r0, _0222C368 ; =ov13_022460C4
	ldr r1, _0222C36C ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _0222C370 ; =ov13_022460DC
	ldr r1, _0222C374 ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _0222C378 ; =ov13_022460F4
	ldr r1, _0222C37C ; =GX_LoadOBJ
	bl ov13_02227924
	ldr r0, _0222C380 ; =ov13_0224610C
	ldr r1, _0222C384 ; =GX_LoadOBJPltt
	bl ov13_02227924
	bl ov13_0222B980
	cmp r0, #0
	beq _0222C2BC
	cmp r0, #1
	beq _0222C2CC
	b _0222C2D8
_0222C2BC:
	ldr r0, _0222C388 ; =ov13_02246124
	ldr r1, _0222C38C ; =GXS_LoadBG1Scr
	bl ov13_02227924
	b _0222C2D8
_0222C2CC:
	ldr r0, _0222C390 ; =ov13_02246138
	ldr r1, _0222C38C ; =GXS_LoadBG1Scr
	bl ov13_02227924
_0222C2D8:
	ldr ip, _0222C394 ; =0x0400100A
	mov r0, #1
	ldrh r2, [ip]
	sub r3, ip, #0x1000
	mov r1, #2
	bic r2, r2, #3
	orr r2, r2, #3
	strh r2, [ip]
	ldrh r2, [r3]
	bic r2, r2, #3
	orr r2, r2, #3
	strh r2, [r3]
	ldrh r2, [r3]
	bic r2, r2, #3
	orr r2, r2, #3
	strh r2, [r3]
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #2
	bl ov13_02240EA8
	ldr r0, _0222C398 ; =ov13_0222C39C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C334: .word ov13_02246034
_0222C338: .word ov13_0224F4F8
_0222C33C: .word ov13_02246018
_0222C340: .word ov13_02246044
_0222C344: .word ov13_02246058
_0222C348: .word ov13_0224606C
_0222C34C: .word GXS_LoadBG1Char
_0222C350: .word ov13_02246080
_0222C354: .word GXS_LoadBGPltt
_0222C358: .word ov13_02246094
_0222C35C: .word GXS_LoadOBJ
_0222C360: .word ov13_022460AC
_0222C364: .word GXS_LoadOBJPltt
_0222C368: .word ov13_022460C4
_0222C36C: .word GX_LoadBG2Char
_0222C370: .word ov13_022460DC
_0222C374: .word GX_LoadBGPltt
_0222C378: .word ov13_022460F4
_0222C37C: .word GX_LoadOBJ
_0222C380: .word ov13_0224610C
_0222C384: .word GX_LoadOBJPltt
_0222C388: .word ov13_02246124
_0222C38C: .word GXS_LoadBG1Scr
_0222C390: .word ov13_02246138
_0222C394: .word 0x0400100A
_0222C398: .word ov13_0222C39C
	arm_func_end ov13_0222C1BC

	arm_func_start ov13_0222C39C
ov13_0222C39C: ; 0x0222C39C
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r2, r0
	mov r1, #1
	mov r3, #0x14
	bl ov13_022403B8
	mov r0, #2
	mov r2, r0
	mov r1, #0
	mov r3, #0x14
	bl ov13_022403B8
	ldr r0, _0222C3D4 ; =ov13_0222C3D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C3D4: .word ov13_0222C3D8
	arm_func_end ov13_0222C39C

	arm_func_start ov13_0222C3D8
ov13_0222C3D8: ; 0x0222C3D8
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0222B980
	cmp r0, #0
	beq _0222C414
	cmp r0, #1
	beq _0222C42C
	ldmia sp!, {r3, pc}
_0222C414:
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222C444 ; =ov13_0222C44C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222C42C:
	mov r0, #1
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _0222C448 ; =ov13_022368D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C444: .word ov13_0222C44C
_0222C448: .word ov13_022368D8
	arm_func_end ov13_0222C3D8

	arm_func_start ov13_0222C44C
ov13_0222C44C: ; 0x0222C44C
	stmdb sp!, {r3, lr}
	bl ov13_0222C4C8
	mov r0, #0
	bl ov13_02227DE4
	mov r0, #0x2e
	sub r1, r0, #0x2f
	mov r2, #0
	bl ov13_022277B8
	mov r0, #4
	bl ov13_0223B6F4
	ldr r0, _0222C4B0 ; =ov13_0224F4FC
	ldr r3, _0222C4B4 ; =ov13_0224533E
	ldrb r0, [r0]
	ldr r1, _0222C4B8 ; =ov13_02245342
	ldr r2, _0222C4BC ; =ov13_02245340
	mov ip, r0, lsl #3
	ldrh r0, [r3, ip]
	ldrh r1, [r1, ip]
	ldrh r2, [r2, ip]
	ldr r3, _0222C4C0 ; =ov13_02245344
	ldrh r3, [r3, ip]
	bl ov13_02227C28
	ldr r0, _0222C4C4 ; =ov13_0222C5B4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C4B0: .word ov13_0224F4FC
_0222C4B4: .word ov13_0224533E
_0222C4B8: .word ov13_02245342
_0222C4BC: .word ov13_02245340
_0222C4C0: .word ov13_02245344
_0222C4C4: .word ov13_0222C5B4
	arm_func_end ov13_0222C44C

	arm_func_start ov13_0222C4C8
ov13_0222C4C8: ; 0x0222C4C8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	ldr ip, _0222C58C ; =ov13_0224534E
	add r3, sp, #0
	mov r2, #0xb
_0222C4DC:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _0222C4DC
	ldr r0, _0222C590 ; =ov13_0224614C
	ldr r1, _0222C594 ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _0222C598 ; =ov13_02246164
	ldr r1, _0222C59C ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _0222C5A0 ; =ov13_0224617C
	ldr r1, _0222C5A4 ; =GX_LoadBG2Scr
	bl ov13_02227924
	add r0, sp, #0
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _0222C5A8 ; =ov13_0224F4FC
	ldr r2, _0222C5AC ; =0x04001008
	str r0, [r1, #4]
	ldrh r0, [r2]
	ldr r1, _0222C5B0 ; =0x0400000A
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C58C: .word ov13_0224534E
_0222C590: .word ov13_0224614C
_0222C594: .word GX_LoadBG2Char
_0222C598: .word ov13_02246164
_0222C59C: .word GX_LoadBGPltt
_0222C5A0: .word ov13_0224617C
_0222C5A4: .word GX_LoadBG2Scr
_0222C5A8: .word ov13_0224F4FC
_0222C5AC: .word 0x04001008
_0222C5B0: .word 0x0400000A
	arm_func_end ov13_0222C4C8

	arm_func_start ov13_0222C5B4
ov13_0222C5B4: ; 0x0222C5B4
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EA8
	ldr r0, _0222C604 ; =ov13_0222C608
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C604: .word ov13_0222C608
	arm_func_end ov13_0222C5B4

	arm_func_start ov13_0222C608
ov13_0222C608: ; 0x0222C608
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_022279B4
	ldr r0, _0222C640 ; =ov13_0222C644
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C640: .word ov13_0222C644
	arm_func_end ov13_0222C608

	arm_func_start ov13_0222C644
ov13_0222C644: ; 0x0222C644
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222C668 ; =ov13_0222C66C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C668: .word ov13_0222C66C
	arm_func_end ov13_0222C644

	arm_func_start ov13_0222C66C
ov13_0222C66C: ; 0x0222C66C
	stmdb sp!, {r3, lr}
	bl ov13_0222C680
	bl ov13_0222C7AC
	bl ov13_0222C7B0
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222C66C

	arm_func_start ov13_0222C680
ov13_0222C680: ; 0x0222C680
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, _0222C794 ; =ov13_0224532E
	mov r4, #0
_0222C68C:
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _0222C6DC
	mov r0, #1
	bl ov13_0222726C
	and r1, r4, #0xff
	mov lr, r1, lsl #3
	ldr r0, _0222C798 ; =ov13_0224533E
	ldr r1, _0222C79C ; =ov13_02245342
	ldr r2, _0222C7A0 ; =ov13_02245340
	ldr r3, _0222C7A4 ; =ov13_02245344
	ldr ip, _0222C7A8 ; =ov13_0224F4FC
	ldrh r0, [r0, lr]
	ldrh r1, [r1, lr]
	ldrh r2, [r2, lr]
	ldrh r3, [r3, lr]
	strb r4, [ip]
	bl ov13_02227C28
	ldmia sp!, {r3, r4, r5, pc}
_0222C6DC:
	add r4, r4, #1
	cmp r4, #2
	add r5, r5, #8
	blo _0222C68C
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _0222C708
	mov r0, #1
	bl ov13_0222726C
	ldmia sp!, {r3, r4, r5, pc}
_0222C708:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _0222C724
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, r4, r5, pc}
_0222C724:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _0222C740
	mov r0, #1
	bl ov13_0222C914
	ldmia sp!, {r3, r4, r5, pc}
_0222C740:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	beq _0222C75C
	mov r0, #3
	bl ov13_0222C914
	ldmia sp!, {r3, r4, r5, pc}
_0222C75C:
	mov r0, #0x20
	bl ov13_022416D4
	cmp r0, #0
	beq _0222C778
	mov r0, #0
	bl ov13_0222C914
	ldmia sp!, {r3, r4, r5, pc}
_0222C778:
	mov r0, #0x10
	bl ov13_022416D4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	bl ov13_0222C914
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0222C794: .word ov13_0224532E
_0222C798: .word ov13_0224533E
_0222C79C: .word ov13_02245342
_0222C7A0: .word ov13_02245340
_0222C7A4: .word ov13_02245344
_0222C7A8: .word ov13_0224F4FC
	arm_func_end ov13_0222C680

	arm_func_start ov13_0222C7AC
ov13_0222C7AC: ; 0x0222C7AC
	bx lr
	arm_func_end ov13_0222C7AC

	arm_func_start ov13_0222C7B0
ov13_0222C7B0: ; 0x0222C7B0
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	beq _0222C7CC
	cmp r0, #1
	beq _0222C7E0
	ldmia sp!, {r3, pc}
_0222C7CC:
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _0222C7F8 ; =ov13_0222C10C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222C7E0:
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0222C984
	ldr r0, _0222C7FC ; =ov13_0222C800
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C7F8: .word ov13_0222C10C
_0222C7FC: .word ov13_0222C800
	arm_func_end ov13_0222C7B0

	arm_func_start ov13_0222C800
ov13_0222C800: ; 0x0222C800
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222C81C ; =ov13_0222C820
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C81C: .word ov13_0222C820
	arm_func_end ov13_0222C800

	arm_func_start ov13_0222C820
ov13_0222C820: ; 0x0222C820
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x16
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222C868 ; =ov13_0222C86C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C868: .word ov13_0222C86C
	arm_func_end ov13_0222C820

	arm_func_start ov13_0222C86C
ov13_0222C86C: ; 0x0222C86C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227D18
	bl ov13_0222788C
	ldr r0, _0222C908 ; =ov13_0224F4FC
	ldr r0, [r0, #4]
	bl ov13_0223FA50
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EFC
	ldr r0, _0222C908 ; =ov13_0224F4FC
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222C8D8
	cmp r0, #1
	beq _0222C8F0
	ldmia sp!, {r3, pc}
_0222C8D8:
	mov r0, #1
	mov r1, #0
	bl ov13_0222B8F8
	ldr r0, _0222C90C ; =ov13_022368D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222C8F0:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _0222C910 ; =ov13_0222D454
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C908: .word ov13_0224F4FC
_0222C90C: .word ov13_022368D8
_0222C910: .word ov13_0222D454
	arm_func_end ov13_0222C86C

	arm_func_start ov13_0222C914
ov13_0222C914: ; 0x0222C914
	stmdb sp!, {r3, lr}
	cmp r0, #1
	cmpne r0, #3
	ldmeqia sp!, {r3, pc}
	ldr r1, _0222C970 ; =ov13_0224F4FC
	mov r0, #8
	ldrb r2, [r1]
	eor r2, r2, #1
	strb r2, [r1]
	bl ov13_0223ABB8
	ldr r0, _0222C970 ; =ov13_0224F4FC
	ldr ip, _0222C974 ; =ov13_0224533E
	ldrb r0, [r0]
	ldr r1, _0222C978 ; =ov13_02245342
	ldr r2, _0222C97C ; =ov13_02245340
	mov lr, r0, lsl #3
	ldr r3, _0222C980 ; =ov13_02245344
	ldrh r0, [ip, lr]
	ldrh r1, [r1, lr]
	ldrh r2, [r2, lr]
	ldrh r3, [r3, lr]
	bl ov13_02227C28
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C970: .word ov13_0224F4FC
_0222C974: .word ov13_0224533E
_0222C978: .word ov13_02245342
_0222C97C: .word ov13_02245340
_0222C980: .word ov13_02245344
	arm_func_end ov13_0222C914

	arm_func_start ov13_0222C984
ov13_0222C984: ; 0x0222C984
	stmdb sp!, {r3, lr}
	ldr r1, _0222C9BC ; =ov13_0224532C
	ldr r0, _0222C9C0 ; =ov13_0224F4FC
	ldrb r3, [r1]
	ldrb r2, [r1, #1]
	ldrb r1, [r0]
	add ip, sp, #0
	strb r3, [sp]
	strb r2, [sp, #1]
	ldrb r1, [ip, r1]
	ldr r0, [r0, #4]
	mov r2, r1
	bl ov13_02239378
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222C9BC: .word ov13_0224532C
_0222C9C0: .word ov13_0224F4FC
	arm_func_end ov13_0222C984

	arm_func_start ov13_0222C9C4
ov13_0222C9C4: ; 0x0222C9C4
	stmdb sp!, {r3, lr}
	ldr r0, _0222CA04 ; =ov13_0224F504
	mov r1, #0
	strb r1, [r0]
	bl ov13_0222CA0C
	mov r0, #0x12
	bl ov13_02227DE4
	mov r0, #0x3b
	sub r1, r0, #0x3c
	mov r2, #0
	bl ov13_022277B8
	mov r0, #0x17
	bl ov13_022279EC
	ldr r0, _0222CA08 ; =ov13_0222CA8C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CA04: .word ov13_0224F504
_0222CA08: .word ov13_0222CA8C
	arm_func_end ov13_0222C9C4

	arm_func_start ov13_0222CA0C
ov13_0222CA0C: ; 0x0222CA0C
	stmdb sp!, {r3, lr}
	ldr r0, _0222CA7C ; =ov13_02246190
	ldr r1, _0222CA80 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _0222CA84 ; =0x04001008
	ldr r1, _0222CA88 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CA7C: .word ov13_02246190
_0222CA80: .word GX_LoadBG2Scr
_0222CA84: .word 0x04001008
_0222CA88: .word 0x0400000A
	arm_func_end ov13_0222CA0C

	arm_func_start ov13_0222CA8C
ov13_0222CA8C: ; 0x0222CA8C
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222CADC ; =ov13_0222CAE0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CADC: .word ov13_0222CAE0
	arm_func_end ov13_0222CA8C

	arm_func_start ov13_0222CAE0
ov13_0222CAE0: ; 0x0222CAE0
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #3
	bl ov13_022279B4
	ldr r0, _0222CB18 ; =ov13_0222CB1C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CB18: .word ov13_0222CB1C
	arm_func_end ov13_0222CAE0

	arm_func_start ov13_0222CB1C
ov13_0222CB1C: ; 0x0222CB1C
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222CB40 ; =ov13_0222CB44
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CB40: .word ov13_0222CB44
	arm_func_end ov13_0222CB1C

	arm_func_start ov13_0222CB44
ov13_0222CB44: ; 0x0222CB44
	stmdb sp!, {r3, lr}
	bl ov13_0222CB58
	bl ov13_0222CB90
	bl ov13_0222CB94
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222CB44

	arm_func_start ov13_0222CB58
ov13_0222CB58: ; 0x0222CB58
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _0222CB74
	mov r0, #1
	bl ov13_0222726C
_0222CB74:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222CB58

	arm_func_start ov13_0222CB90
ov13_0222CB90: ; 0x0222CB90
	bx lr
	arm_func_end ov13_0222CB90

	arm_func_start ov13_0222CB94
ov13_0222CB94: ; 0x0222CB94
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	beq _0222CBB0
	cmp r0, #1
	beq _0222CBC4
	ldmia sp!, {r3, pc}
_0222CBB0:
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _0222CBF4 ; =ov13_0222CBFC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222CBC4:
	mov r0, #6
	bl ov13_0223ABB8
	mov r2, #1
	mov r1, #0
	sub r3, r2, #2
	mov r0, #0x18
	str r1, [sp]
	bl ov13_0223BE6C
	bl ov13_022272E4
	ldr r0, _0222CBF8 ; =ov13_0222CD38
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CBF4: .word ov13_0222CBFC
_0222CBF8: .word ov13_0222CD38
	arm_func_end ov13_0222CB94

	arm_func_start ov13_0222CBFC
ov13_0222CBFC: ; 0x0222CBFC
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222CC18 ; =ov13_0222CC1C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CC18: .word ov13_0222CC1C
	arm_func_end ov13_0222CBFC

	arm_func_start ov13_0222CC1C
ov13_0222CC1C: ; 0x0222CC1C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227228
	ldr r0, _0222CC78 ; =ov13_0224F504
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222CC58
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
_0222CC58:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222CC7C ; =ov13_0222CC80
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CC78: .word ov13_0224F504
_0222CC7C: .word ov13_0222CC80
	arm_func_end ov13_0222CC1C

	arm_func_start ov13_0222CC80
ov13_0222CC80: ; 0x0222CC80
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222CD2C ; =ov13_0224F504
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222CCB4
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
_0222CCB4:
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0222CD2C ; =ov13_0224F504
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222CCE8
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
_0222CCE8:
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _0222CD2C ; =ov13_0224F504
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	mov r0, #0
	bne _0222CD1C
	bl ov13_0222B8F8
	ldr r0, _0222CD30 ; =ov13_0222D454
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222CD1C:
	bl ov13_0222B8F8
	ldr r0, _0222CD34 ; =ov13_0222CDA8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CD2C: .word ov13_0224F504
_0222CD30: .word ov13_0222D454
_0222CD34: .word ov13_0222CDA8
	arm_func_end ov13_0222CC80

	arm_func_start ov13_0222CD38
ov13_0222CD38: ; 0x0222CD38
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	beq _0222CD68
	cmp r0, #1
	ldmneia sp!, {r3, pc}
	mov r0, #0xe
	bl ov13_0223ABB8
	ldr r0, _0222CD80 ; =ov13_0224F504
	mov r1, #1
	strb r1, [r0]
	b _0222CD70
_0222CD68:
	mov r0, #7
	bl ov13_0223ABB8
_0222CD70:
	bl ov13_0223C198
	ldr r0, _0222CD84 ; =ov13_0222CD88
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CD80: .word ov13_0224F504
_0222CD84: .word ov13_0222CD88
	arm_func_end ov13_0222CD38

	arm_func_start ov13_0222CD88
ov13_0222CD88: ; 0x0222CD88
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222CDA4 ; =ov13_0222CBFC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CDA4: .word ov13_0222CBFC
	arm_func_end ov13_0222CD88

	arm_func_start ov13_0222CDA8
ov13_0222CDA8: ; 0x0222CDA8
	stmdb sp!, {r3, lr}
	bl ov13_0222CDCC
	mov r0, #0x19
	bl ov13_022279EC
	bl ov13_0223A840
	ldr r0, _0222CDC8 ; =ov13_0222CE4C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CDC8: .word ov13_0222CE4C
	arm_func_end ov13_0222CDA8

	arm_func_start ov13_0222CDCC
ov13_0222CDCC: ; 0x0222CDCC
	stmdb sp!, {r3, lr}
	ldr r0, _0222CE3C ; =ov13_022461A4
	ldr r1, _0222CE40 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _0222CE44 ; =0x04001008
	ldr r1, _0222CE48 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CE3C: .word ov13_022461A4
_0222CE40: .word GX_LoadBG2Scr
_0222CE44: .word 0x04001008
_0222CE48: .word 0x0400000A
	arm_func_end ov13_0222CDCC

	arm_func_start ov13_0222CE4C
ov13_0222CE4C: ; 0x0222CE4C
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222CE7C ; =ov13_0222CE80
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CE7C: .word ov13_0222CE80
	arm_func_end ov13_0222CE4C

	arm_func_start ov13_0222CE80
ov13_0222CE80: ; 0x0222CE80
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #5
	bl ov13_022279B4
	ldr r0, _0222CEA8 ; =ov13_0222CEAC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CEA8: .word ov13_0222CEAC
	arm_func_end ov13_0222CE80

	arm_func_start ov13_0222CEAC
ov13_0222CEAC: ; 0x0222CEAC
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222CED0 ; =ov13_0222CED4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CED0: .word ov13_0222CED4
	arm_func_end ov13_0222CEAC

	arm_func_start ov13_0222CED4
ov13_0222CED4: ; 0x0222CED4
	stmdb sp!, {r3, lr}
	bl ov13_0222CEE8
	bl ov13_0222CF08
	bl ov13_0222CF0C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222CED4

	arm_func_start ov13_0222CEE8
ov13_0222CEE8: ; 0x0222CEE8
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222CEE8

	arm_func_start ov13_0222CF08
ov13_0222CF08: ; 0x0222CF08
	bx lr
	arm_func_end ov13_0222CF08

	arm_func_start ov13_0222CF0C
ov13_0222CF0C: ; 0x0222CF0C
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _0222CF30 ; =ov13_0222CF34
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CF30: .word ov13_0222CF34
	arm_func_end ov13_0222CF0C

	arm_func_start ov13_0222CF34
ov13_0222CF34: ; 0x0222CF34
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222CF50 ; =ov13_0222CF54
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CF50: .word ov13_0222CF54
	arm_func_end ov13_0222CF34

	arm_func_start ov13_0222CF54
ov13_0222CF54: ; 0x0222CF54
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #3
	mov r1, #1
	mov r2, #0x3f
	mov r3, #0x40
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x3f
	mov r3, #0x40
	bl ov13_022403B8
	ldr r0, _0222CF9C ; =ov13_0222CFA0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222CF9C: .word ov13_0222CFA0
	arm_func_end ov13_0222CF54

	arm_func_start ov13_0222CFA0
ov13_0222CFA0: ; 0x0222CFA0
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0x1000000
	bl OS_SpinWait
	bl PM_ForceToPowerOff
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222CFA0

	arm_func_start ov13_0222CFD4
ov13_0222CFD4: ; 0x0222CFD4
	stmdb sp!, {r3, lr}
	bl ov13_0222D008
	mov r0, #0x11
	bl ov13_02227DE4
	mov r0, #0x3a
	sub r1, r0, #0x3b
	mov r2, #0
	bl ov13_022277B8
	bl ov13_0222D088
	ldr r0, _0222D004 ; =ov13_0222D25C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D004: .word ov13_0222D25C
	arm_func_end ov13_0222CFD4

	arm_func_start ov13_0222D008
ov13_0222D008: ; 0x0222D008
	stmdb sp!, {r3, lr}
	ldr r0, _0222D078 ; =ov13_022461B8
	ldr r1, _0222D07C ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _0222D080 ; =0x04001008
	ldr r1, _0222D084 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D078: .word ov13_022461B8
_0222D07C: .word GX_LoadBG2Scr
_0222D080: .word 0x04001008
_0222D084: .word 0x0400000A
	arm_func_end ov13_0222D008

	arm_func_start ov13_0222D088
ov13_0222D088: ; 0x0222D088
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x68
	mov r0, #0
	mov r1, r0
	bl ov13_022408A0
	mov fp, r0
	add r0, sp, #0x14
	bl OS_GetMacAddress
	ldrb r1, [sp, #0x15]
	ldr r2, _0222D24C ; =ov13_022461CC
	add r0, sp, #0x1a
	str r1, [sp]
	ldrb r3, [sp, #0x16]
	mov r1, #0x14
	str r3, [sp, #4]
	ldrb r3, [sp, #0x17]
	str r3, [sp, #8]
	ldrb r3, [sp, #0x18]
	str r3, [sp, #0xc]
	ldrb r3, [sp, #0x19]
	str r3, [sp, #0x10]
	ldrb r3, [sp, #0x14]
	bl swprintf
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x480
	str r0, [sp, #8]
	add r1, sp, #0x1a
	str r1, [sp, #0xc]
	mov r0, fp
	mov r1, #8
	mov r2, #0x40
	mov r3, #0xf0
	bl ov13_02240CC0
	add r0, sp, #0x54
	bl DWCi_BM_GetWiFiInfo
	ldr sl, [sp, #0x58]
	ldr r8, [sp, #0x54]
	cmp sl, #0
	mov r3, #0
	cmpeq r8, #0
	beq _0222D1F8
	mov r0, r8
	mov r1, sl
	mov r2, #0xa
	bl _ull_mod
	mov r1, #0x3e8
	umull r4, r1, r0, r1
	mov r0, r8
	mov r1, sl
	mov r3, #0
	mov r2, #0xa
	str r4, [sp, #0x50]
	bl _ll_udiv
	mov sb, #0
	ldr r7, _0222D250 ; =0x00002710
	mov r8, r0
	mov sl, r1
	mov r6, sb
	add r5, sp, #0x44
	mov r4, sb
_0222D184:
	mov r0, r8
	mov r1, sl
	mov r2, r7
	mov r3, r6
	bl _ull_mod
	rsb r1, sb, #2
	str r0, [r5, r1, lsl #2]
	mov r0, r8
	mov r1, sl
	mov r2, r7
	mov r3, r4
	bl _ll_udiv
	mov r8, r0
	mov sl, r1
	add sb, sb, #1
	cmp sb, #3
	blt _0222D184
	ldr r1, [sp, #0x48]
	ldr r0, [sp, #0x4c]
	str r1, [sp]
	str r0, [sp, #4]
	ldr r4, [sp, #0x50]
	ldr r3, [sp, #0x44]
	ldr r2, _0222D254 ; =ov13_02246208
	add r0, sp, #0x1a
	mov r1, #0x14
	str r4, [sp, #8]
	bl swprintf
	b _0222D208
_0222D1F8:
	ldr r2, _0222D258 ; =ov13_02246230
	add r0, sp, #0x1a
	mov r1, #0x14
	bl swprintf
_0222D208:
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x480
	str r0, [sp, #8]
	add r4, sp, #0x1a
	mov r0, fp
	mov r1, #8
	mov r2, #0x78
	mov r3, #0xf0
	str r4, [sp, #0xc]
	bl ov13_02240CC0
	mov r0, fp
	bl ov13_02240E2C
	add sp, sp, #0x68
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0222D24C: .word ov13_022461CC
_0222D250: .word 0x00002710
_0222D254: .word ov13_02246208
_0222D258: .word ov13_02246230
	arm_func_end ov13_0222D088

	arm_func_start ov13_0222D25C
ov13_0222D25C: ; 0x0222D25C
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222D2AC ; =ov13_0222D2B0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D2AC: .word ov13_0222D2B0
	arm_func_end ov13_0222D25C

	arm_func_start ov13_0222D2B0
ov13_0222D2B0: ; 0x0222D2B0
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #2
	bl ov13_022279B4
	ldr r0, _0222D2E8 ; =ov13_0222D2EC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D2E8: .word ov13_0222D2EC
	arm_func_end ov13_0222D2B0

	arm_func_start ov13_0222D2EC
ov13_0222D2EC: ; 0x0222D2EC
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222D310 ; =ov13_0222D314
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D310: .word ov13_0222D314
	arm_func_end ov13_0222D2EC

	arm_func_start ov13_0222D314
ov13_0222D314: ; 0x0222D314
	stmdb sp!, {r3, lr}
	bl ov13_0222D328
	bl ov13_0222D348
	bl ov13_0222D34C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222D314

	arm_func_start ov13_0222D328
ov13_0222D328: ; 0x0222D328
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222D328

	arm_func_start ov13_0222D348
ov13_0222D348: ; 0x0222D348
	bx lr
	arm_func_end ov13_0222D348

	arm_func_start ov13_0222D34C
ov13_0222D34C: ; 0x0222D34C
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _0222D370 ; =ov13_0222D374
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D370: .word ov13_0222D374
	arm_func_end ov13_0222D34C

	arm_func_start ov13_0222D374
ov13_0222D374: ; 0x0222D374
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222D390 ; =ov13_0222D394
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D390: .word ov13_0222D394
	arm_func_end ov13_0222D374

	arm_func_start ov13_0222D394
ov13_0222D394: ; 0x0222D394
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227228
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222D3E0 ; =ov13_0222D3E4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D3E0: .word ov13_0222D3E4
	arm_func_end ov13_0222D394

	arm_func_start ov13_0222D3E4
ov13_0222D3E4: ; 0x0222D3E4
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222D450 ; =ov13_0222D454
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D450: .word ov13_0222D454
	arm_func_end ov13_0222D3E4

	arm_func_start ov13_0222D454
ov13_0222D454: ; 0x0222D454
	stmdb sp!, {r4, lr}
	ldr r0, _0222D500 ; =ov13_0224F508
	mov r1, #0
	strb r1, [r0, #1]
	bl ov13_0222D51C
	mov r0, #0x10
	bl ov13_02227DE4
	mov r0, #3
	bl ov13_0223B6F4
	mov r0, #0x39
	sub r1, r0, #0x3a
	mov r2, #0
	bl ov13_022277B8
	mov r0, #0
	mov r1, #0x5b
	bl ov13_02240184
	ldr r2, _0222D500 ; =ov13_0224F508
	ldr r1, _0222D504 ; =0xFE00FF00
	str r0, [r2, #8]
	ldr r3, [r0]
	ldr lr, _0222D508 ; =ov13_022453B2
	and r1, r3, r1
	orr r1, r1, #0x84
	orr r1, r1, #0xe00000
	str r1, [r0]
	ldr r4, [r2, #8]
	ldr r1, _0222D50C ; =ov13_022453B6
	ldrh r0, [r4, #4]
	ldr ip, _0222D510 ; =ov13_022453B4
	ldr r3, _0222D514 ; =ov13_022453B8
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r4, #4]
	ldrb r0, [r2]
	mov r4, r0, lsl #3
	ldrh r0, [lr, r4]
	ldrh r1, [r1, r4]
	ldrh r2, [ip, r4]
	ldrh r3, [r3, r4]
	bl ov13_02227C28
	ldr r0, _0222D518 ; =ov13_0222D6B8
	bl ov13_0222B8E8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222D500: .word ov13_0224F508
_0222D504: .word 0xFE00FF00
_0222D508: .word ov13_022453B2
_0222D50C: .word ov13_022453B6
_0222D510: .word ov13_022453B4
_0222D514: .word ov13_022453B8
_0222D518: .word ov13_0222D6B8
	arm_func_end ov13_0222D454

	arm_func_start ov13_0222D51C
ov13_0222D51C: ; 0x0222D51C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x44
	ldr r4, _0222D694 ; =ov13_0224536C
	add r3, sp, #0x2b
	mov r2, #0xb
_0222D530:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	add r4, r4, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _0222D530
	ldr r4, _0222D698 ; =ov13_02245382
	add r3, sp, #0x14
	mov r2, #0xb
_0222D55C:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	add r4, r4, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _0222D55C
	ldrb r2, [r4]
	ldr r0, _0222D69C ; =ov13_02246258
	ldr r1, _0222D6A0 ; =GX_LoadBG2Char
	strb r2, [r3]
	bl ov13_02227924
	ldr r0, _0222D6A4 ; =ov13_02246270
	ldr r1, _0222D6A8 ; =GX_LoadBG2Scr
	bl ov13_02227924
	add r0, sp, #0x14
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _0222D6AC ; =ov13_0224F508
	str r0, [r1, #4]
	add r0, sp, #0x2b
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	mov r8, r0
	add r0, sp, #0
	bl DWCi_BM_GetWiFiInfo
	ldr r0, [sp, #4]
	ldr r1, [sp]
	cmp r0, #0
	mov r7, #0
	cmpeq r1, #0
	bne _0222D620
	add r5, r8, #0xc0
	add r6, r8, #0x40
	mov r4, #0x20
_0222D5FC:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl MI_CpuCopy8
	add r7, r7, #1
	cmp r7, #2
	add r5, r5, #0x20
	add r6, r6, #0x20
	blt _0222D5FC
_0222D620:
	mov r0, r8
	mov r1, #0x200
	bl DC_FlushRange
	mov r0, r8
	mov r1, #0
	mov r2, #0x200
	bl GX_LoadBGPltt
	mov r0, r8
	bl ov13_0223FA50
	ldr r2, _0222D6B0 ; =0x04001008
	ldr r1, _0222D6B4 ; =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	add sp, sp, #0x44
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0222D694: .word ov13_0224536C
_0222D698: .word ov13_02245382
_0222D69C: .word ov13_02246258
_0222D6A0: .word GX_LoadBG2Char
_0222D6A4: .word ov13_02246270
_0222D6A8: .word GX_LoadBG2Scr
_0222D6AC: .word ov13_0224F508
_0222D6B0: .word 0x04001008
_0222D6B4: .word 0x0400000A
	arm_func_end ov13_0222D51C

	arm_func_start ov13_0222D6B8
ov13_0222D6B8: ; 0x0222D6B8
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EA8
	ldr r0, _0222D708 ; =ov13_0222D70C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D708: .word ov13_0222D70C
	arm_func_end ov13_0222D6B8

	arm_func_start ov13_0222D70C
ov13_0222D70C: ; 0x0222D70C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_022279B4
	ldr r0, _0222D744 ; =ov13_0222D748
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D744: .word ov13_0222D748
	arm_func_end ov13_0222D70C

	arm_func_start ov13_0222D748
ov13_0222D748: ; 0x0222D748
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222D76C ; =ov13_0222D770
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D76C: .word ov13_0222D770
	arm_func_end ov13_0222D748

	arm_func_start ov13_0222D770
ov13_0222D770: ; 0x0222D770
	stmdb sp!, {r3, lr}
	bl ov13_0222D784
	bl ov13_0222D878
	bl ov13_0222D87C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222D770

	arm_func_start ov13_0222D784
ov13_0222D784: ; 0x0222D784
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, _0222D860 ; =ov13_0224539A
	mov r4, #0
_0222D790:
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _0222D7E0
	mov r0, #1
	bl ov13_0222726C
	and r1, r4, #0xff
	mov lr, r1, lsl #3
	ldr r0, _0222D864 ; =ov13_022453B2
	ldr r1, _0222D868 ; =ov13_022453B6
	ldr r2, _0222D86C ; =ov13_022453B4
	ldr r3, _0222D870 ; =ov13_022453B8
	ldr ip, _0222D874 ; =ov13_0224F508
	ldrh r0, [r0, lr]
	ldrh r1, [r1, lr]
	ldrh r2, [r2, lr]
	ldrh r3, [r3, lr]
	strb r4, [ip]
	bl ov13_02227C28
	ldmia sp!, {r3, r4, r5, pc}
_0222D7E0:
	add r4, r4, #1
	cmp r4, #3
	add r5, r5, #8
	blo _0222D790
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _0222D80C
	mov r0, #1
	bl ov13_0222726C
	ldmia sp!, {r3, r4, r5, pc}
_0222D80C:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _0222D828
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, r4, r5, pc}
_0222D828:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _0222D844
	mov r0, #1
	bl ov13_0222DAB0
	ldmia sp!, {r3, r4, r5, pc}
_0222D844:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #3
	bl ov13_0222DAB0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0222D860: .word ov13_0224539A
_0222D864: .word ov13_022453B2
_0222D868: .word ov13_022453B6
_0222D86C: .word ov13_022453B4
_0222D870: .word ov13_022453B8
_0222D874: .word ov13_0224F508
	arm_func_end ov13_0222D784

	arm_func_start ov13_0222D878
ov13_0222D878: ; 0x0222D878
	bx lr
	arm_func_end ov13_0222D878

	arm_func_start ov13_0222D87C
ov13_0222D87C: ; 0x0222D87C
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	bl ov13_02227258
	cmp r0, #0
	beq _0222D8A0
	cmp r0, #1
	beq _0222D8AC
	add sp, sp, #0x14
	ldmia sp!, {pc}
_0222D8A0:
	mov r0, #7
	bl ov13_0223ABB8
	b _0222D908
_0222D8AC:
	add r0, sp, #0
	bl DWCi_BM_GetWiFiInfo
	ldr r0, _0222D918 ; =ov13_0224F508
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222D8F0
	ldr r0, [sp, #4]
	ldr r1, [sp]
	cmp r0, #0
	cmpeq r1, #0
	bne _0222D8F0
	mov r0, #9
	bl ov13_0223ABB8
	mvn r0, #0
	bl ov13_0222728C
	add sp, sp, #0x14
	ldmia sp!, {pc}
_0222D8F0:
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0222DB40
	ldr r0, _0222D918 ; =ov13_0224F508
	mov r1, #1
	strb r1, [r0, #1]
_0222D908:
	ldr r0, _0222D91C ; =ov13_0222D920
	bl ov13_0222B8E8
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.balign 4, 0
_0222D918: .word ov13_0224F508
_0222D91C: .word ov13_0222D920
	arm_func_end ov13_0222D87C

	arm_func_start ov13_0222D920
ov13_0222D920: ; 0x0222D920
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222D93C ; =ov13_0222D940
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D93C: .word ov13_0222D940
	arm_func_end ov13_0222D920

	arm_func_start ov13_0222D940
ov13_0222D940: ; 0x0222D940
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222D99C ; =ov13_0224F508
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _0222D968
	bl ov13_02227228
_0222D968:
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222D9A0 ; =ov13_0222D9A4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222D99C: .word ov13_0224F508
_0222D9A0: .word ov13_0222D9A4
	arm_func_end ov13_0222D940

	arm_func_start ov13_0222D9A4
ov13_0222D9A4: ; 0x0222D9A4
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _0222DA9C ; =ov13_0224F508
	ldr r0, [r0, #8]
	bl ov13_02241D98
	bl ov13_02227D18
	bl ov13_0222788C
	ldr r0, _0222DA9C ; =ov13_0224F508
	ldr r0, [r0, #4]
	bl ov13_0223FA50
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EFC
	ldr r0, _0222DA9C ; =ov13_0224F508
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _0222DA34
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _0222DAA0 ; =ov13_0222C44C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222DA34:
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222DA54
	cmp r0, #1
	beq _0222DA6C
	cmp r0, #2
	beq _0222DA84
	ldmia sp!, {r3, pc}
_0222DA54:
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222DAA4 ; =ov13_0222CFD4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222DA6C:
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222DAA8 ; =ov13_0222C9C4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222DA84:
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222DAAC ; =ov13_0222E220
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DA9C: .word ov13_0224F508
_0222DAA0: .word ov13_0222C44C
_0222DAA4: .word ov13_0222CFD4
_0222DAA8: .word ov13_0222C9C4
_0222DAAC: .word ov13_0222E220
	arm_func_end ov13_0222D9A4

	arm_func_start ov13_0222DAB0
ov13_0222DAB0: ; 0x0222DAB0
	stmdb sp!, {r3, lr}
	cmp r0, #1
	mov r1, #3
	bne _0222DAD8
	ldr r0, _0222DB2C ; =ov13_0224F508
	ldrb r0, [r0]
	add r0, r0, #2
	bl FX_ModS32
	ldr r1, _0222DB2C ; =ov13_0224F508
	b _0222DAEC
_0222DAD8:
	ldr r0, _0222DB2C ; =ov13_0224F508
	ldrb r0, [r0]
	add r0, r0, #1
	bl FX_ModS32
	ldr r1, _0222DB2C ; =ov13_0224F508
_0222DAEC:
	strb r0, [r1]
	mov r0, #8
	bl ov13_0223ABB8
	ldr r0, _0222DB2C ; =ov13_0224F508
	ldr ip, _0222DB30 ; =ov13_022453B2
	ldrb r0, [r0]
	ldr r1, _0222DB34 ; =ov13_022453B6
	ldr r2, _0222DB38 ; =ov13_022453B4
	mov lr, r0, lsl #3
	ldr r3, _0222DB3C ; =ov13_022453B8
	ldrh r0, [ip, lr]
	ldrh r1, [r1, lr]
	ldrh r2, [r2, lr]
	ldrh r3, [r3, lr]
	bl ov13_02227C28
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DB2C: .word ov13_0224F508
_0222DB30: .word ov13_022453B2
_0222DB34: .word ov13_022453B6
_0222DB38: .word ov13_022453B4
_0222DB3C: .word ov13_022453B8
	arm_func_end ov13_0222DAB0

	arm_func_start ov13_0222DB40
ov13_0222DB40: ; 0x0222DB40
	ldr r0, _0222DB60 ; =ov13_0224F508
	ldr r1, _0222DB64 ; =ov13_02245364
	ldrb r2, [r0]
	ldr ip, _0222DB68 ; =ov13_02239378
	ldr r0, [r0, #4]
	ldrb r1, [r1, r2]
	mov r2, r1
	bx ip
	.balign 4, 0
_0222DB60: .word ov13_0224F508
_0222DB64: .word ov13_02245364
_0222DB68: .word ov13_02239378
	arm_func_end ov13_0222DB40

	arm_func_start ov13_0222DB6C
ov13_0222DB6C: ; 0x0222DB6C
	stmdb sp!, {r3, lr}
	bl ov13_0222DBA4
	mov r0, #0x1e
	bl ov13_022279EC
	mov r0, #0
	bl ov13_02226F58
	mov r0, #1
	bl ov13_02227EB0
	mov r0, #0xb
	bl ov13_0223ABB8
	ldr r0, _0222DBA0 ; =ov13_0222DC24
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DBA0: .word ov13_0222DC24
	arm_func_end ov13_0222DB6C

	arm_func_start ov13_0222DBA4
ov13_0222DBA4: ; 0x0222DBA4
	stmdb sp!, {r3, lr}
	ldr r0, _0222DC14 ; =ov13_02246288
	ldr r1, _0222DC18 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _0222DC1C ; =0x04001008
	ldr r1, _0222DC20 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DC14: .word ov13_02246288
_0222DC18: .word GX_LoadBG2Scr
_0222DC1C: .word 0x04001008
_0222DC20: .word 0x0400000A
	arm_func_end ov13_0222DBA4

	arm_func_start ov13_0222DC24
ov13_0222DC24: ; 0x0222DC24
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222DC54 ; =ov13_0222DC58
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DC54: .word ov13_0222DC58
	arm_func_end ov13_0222DC24

	arm_func_start ov13_0222DC58
ov13_0222DC58: ; 0x0222DC58
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222DC80 ; =ov13_0222DD5C
	bl ov13_0222BC84
	ldr r0, _0222DC84 ; =ov13_0222DC88
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DC80: .word ov13_0222DD5C
_0222DC84: .word ov13_0222DC88
	arm_func_end ov13_0222DC58

	arm_func_start ov13_0222DC88
ov13_0222DC88: ; 0x0222DC88
	stmdb sp!, {r3, lr}
	bl ov13_0222DC98
	bl ov13_0222DC9C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222DC88

	arm_func_start ov13_0222DC98
ov13_0222DC98: ; 0x0222DC98
	bx lr
	arm_func_end ov13_0222DC98

	arm_func_start ov13_0222DC9C
ov13_0222DC9C: ; 0x0222DC9C
	bx lr
	arm_func_end ov13_0222DC9C

	arm_func_start ov13_0222DCA0
ov13_0222DCA0: ; 0x0222DCA0
	stmdb sp!, {r3, lr}
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222DCC4 ; =ov13_0222DCC8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DCC4: .word ov13_0222DCC8
	arm_func_end ov13_0222DCA0

	arm_func_start ov13_0222DCC8
ov13_0222DCC8: ; 0x0222DCC8
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0222BC68
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov13_02227F68
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222DD4C ; =ov13_0224F514
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222DD2C
	ldr r0, _0222DD50 ; =ov13_0222E754
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222DD2C:
	cmp r0, #2
	bne _0222DD40
	ldr r0, _0222DD54 ; =ov13_0222E56C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222DD40:
	ldr r0, _0222DD58 ; =ov13_0222DDE4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DD4C: .word ov13_0224F514
_0222DD50: .word ov13_0222E754
_0222DD54: .word ov13_0222E56C
_0222DD58: .word ov13_0222DDE4
	arm_func_end ov13_0222DCC8

	arm_func_start ov13_0222DD5C
ov13_0222DD5C: ; 0x0222DD5C
	stmdb sp!, {r3, lr}
	cmp r0, #2
	bne _0222DD88
	bl ov13_0223A840
	ldr r0, _0222DDDC ; =ov13_0224F514
	mov r1, #1
	strb r1, [r0]
	bl ov13_0223AC20
	mov r0, #0x10
	bl ov13_0223ABB8
	b _0222DDC4
_0222DD88:
	cmp r0, #3
	bne _0222DDAC
	ldr r0, _0222DDDC ; =ov13_0224F514
	mov r1, #2
	strb r1, [r0]
	bl ov13_0223AC20
	mov r0, #0x12
	bl ov13_0223ABB8
	b _0222DDC4
_0222DDAC:
	ldr r0, _0222DDDC ; =ov13_0224F514
	mov r1, #0
	strb r1, [r0]
	bl ov13_0223AC20
	mov r0, #0x12
	bl ov13_0223ABB8
_0222DDC4:
	mov r0, #0
	bl ov13_0222BC84
	bl ov13_0222BC0C
	ldr r0, _0222DDE0 ; =ov13_0222DCA0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DDDC: .word ov13_0224F514
_0222DDE0: .word ov13_0222DCA0
	arm_func_end ov13_0222DD5C

	arm_func_start ov13_0222DDE4
ov13_0222DDE4: ; 0x0222DDE4
	stmdb sp!, {r3, lr}
	bl ov13_0222DE04
	mov r0, #0x1f
	bl ov13_022279EC
	ldr r0, _0222DE00 ; =ov13_0222DE6C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DE00: .word ov13_0222DE6C
	arm_func_end ov13_0222DDE4

	arm_func_start ov13_0222DE04
ov13_0222DE04: ; 0x0222DE04
	ldr r3, _0222DE64 ; =0x04001008
	ldr r1, _0222DE68 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	bx lr
	.balign 4, 0
_0222DE64: .word 0x04001008
_0222DE68: .word 0x0400000A
	arm_func_end ov13_0222DE04

	arm_func_start ov13_0222DE6C
ov13_0222DE6C: ; 0x0222DE6C
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222DE9C ; =ov13_0222DEA0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DE9C: .word ov13_0222DEA0
	arm_func_end ov13_0222DE6C

	arm_func_start ov13_0222DEA0
ov13_0222DEA0: ; 0x0222DEA0
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #5
	bl ov13_022279B4
	ldr r0, _0222DEC8 ; =ov13_0222DECC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DEC8: .word ov13_0222DECC
	arm_func_end ov13_0222DEA0

	arm_func_start ov13_0222DECC
ov13_0222DECC: ; 0x0222DECC
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222DEF0 ; =ov13_0222DEF4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DEF0: .word ov13_0222DEF4
	arm_func_end ov13_0222DECC

	arm_func_start ov13_0222DEF4
ov13_0222DEF4: ; 0x0222DEF4
	stmdb sp!, {r3, lr}
	bl ov13_0222DF08
	bl ov13_0222DF28
	bl ov13_0222DF2C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222DEF4

	arm_func_start ov13_0222DF08
ov13_0222DF08: ; 0x0222DF08
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222DF08

	arm_func_start ov13_0222DF28
ov13_0222DF28: ; 0x0222DF28
	bx lr
	arm_func_end ov13_0222DF28

	arm_func_start ov13_0222DF2C
ov13_0222DF2C: ; 0x0222DF2C
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _0222DF50 ; =ov13_0222DF54
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DF50: .word ov13_0222DF54
	arm_func_end ov13_0222DF2C

	arm_func_start ov13_0222DF54
ov13_0222DF54: ; 0x0222DF54
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222DF70 ; =ov13_0222DF74
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DF70: .word ov13_0222DF74
	arm_func_end ov13_0222DF54

	arm_func_start ov13_0222DF74
ov13_0222DF74: ; 0x0222DF74
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #3
	mov r1, #1
	mov r2, #0x3f
	mov r3, #0x40
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x3f
	mov r3, #0x40
	bl ov13_022403B8
	ldr r0, _0222DFBC ; =ov13_0222DFC0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222DFBC: .word ov13_0222DFC0
	arm_func_end ov13_0222DF74

	arm_func_start ov13_0222DFC0
ov13_0222DFC0: ; 0x0222DFC0
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0x1000000
	bl OS_SpinWait
	bl PM_ForceToPowerOff
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222DFC0

	arm_func_start ov13_0222DFF4
ov13_0222DFF4: ; 0x0222DFF4
	stmdb sp!, {r3, lr}
	bl ov13_0222E014
	mov r0, #0x1a
	bl ov13_022279EC
	ldr r0, _0222E010 ; =ov13_0222E07C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E010: .word ov13_0222E07C
	arm_func_end ov13_0222DFF4

	arm_func_start ov13_0222E014
ov13_0222E014: ; 0x0222E014
	ldr r3, _0222E074 ; =0x04001008
	ldr r1, _0222E078 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	bx lr
	.balign 4, 0
_0222E074: .word 0x04001008
_0222E078: .word 0x0400000A
	arm_func_end ov13_0222E014

	arm_func_start ov13_0222E07C
ov13_0222E07C: ; 0x0222E07C
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222E0AC ; =ov13_0222E0B0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E0AC: .word ov13_0222E0B0
	arm_func_end ov13_0222E07C

	arm_func_start ov13_0222E0B0
ov13_0222E0B0: ; 0x0222E0B0
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #4
	bl ov13_022279B4
	ldr r0, _0222E0E8 ; =ov13_0222E0EC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E0E8: .word ov13_0222E0EC
	arm_func_end ov13_0222E0B0

	arm_func_start ov13_0222E0EC
ov13_0222E0EC: ; 0x0222E0EC
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222E110 ; =ov13_0222E114
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E110: .word ov13_0222E114
	arm_func_end ov13_0222E0EC

	arm_func_start ov13_0222E114
ov13_0222E114: ; 0x0222E114
	stmdb sp!, {r3, lr}
	bl ov13_0222E128
	bl ov13_0222E148
	bl ov13_0222E14C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222E114

	arm_func_start ov13_0222E128
ov13_0222E128: ; 0x0222E128
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222E128

	arm_func_start ov13_0222E148
ov13_0222E148: ; 0x0222E148
	bx lr
	arm_func_end ov13_0222E148

	arm_func_start ov13_0222E14C
ov13_0222E14C: ; 0x0222E14C
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _0222E170 ; =ov13_0222E174
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E170: .word ov13_0222E174
	arm_func_end ov13_0222E14C

	arm_func_start ov13_0222E174
ov13_0222E174: ; 0x0222E174
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222E190 ; =ov13_0222E194
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E190: .word ov13_0222E194
	arm_func_end ov13_0222E174

	arm_func_start ov13_0222E194
ov13_0222E194: ; 0x0222E194
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227228
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222E1CC ; =ov13_0222E1D0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E1CC: .word ov13_0222E1D0
	arm_func_end ov13_0222E194

	arm_func_start ov13_0222E1D0
ov13_0222E1D0: ; 0x0222E1D0
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222E21C ; =ov13_0222EEB4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E21C: .word ov13_0222EEB4
	arm_func_end ov13_0222E1D0

	arm_func_start ov13_0222E220
ov13_0222E220: ; 0x0222E220
	stmdb sp!, {r3, lr}
	ldr r0, _0222E260 ; =ov13_0224F518
	mov r1, #0
	strb r1, [r0]
	bl ov13_0222E268
	mov r0, #0x13
	bl ov13_02227DE4
	mov r0, #0x3c
	sub r1, r0, #0x3d
	mov r2, #0
	bl ov13_022277B8
	mov r0, #0x1b
	bl ov13_022279EC
	ldr r0, _0222E264 ; =ov13_0222E2E8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E260: .word ov13_0224F518
_0222E264: .word ov13_0222E2E8
	arm_func_end ov13_0222E220

	arm_func_start ov13_0222E268
ov13_0222E268: ; 0x0222E268
	stmdb sp!, {r3, lr}
	ldr r0, _0222E2D8 ; =ov13_0224629C
	ldr r1, _0222E2DC ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _0222E2E0 ; =0x04001008
	ldr r1, _0222E2E4 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E2D8: .word ov13_0224629C
_0222E2DC: .word GX_LoadBG2Scr
_0222E2E0: .word 0x04001008
_0222E2E4: .word 0x0400000A
	arm_func_end ov13_0222E268

	arm_func_start ov13_0222E2E8
ov13_0222E2E8: ; 0x0222E2E8
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222E338 ; =ov13_0222E33C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E338: .word ov13_0222E33C
	arm_func_end ov13_0222E2E8

	arm_func_start ov13_0222E33C
ov13_0222E33C: ; 0x0222E33C
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #3
	bl ov13_022279B4
	ldr r0, _0222E364 ; =ov13_0222E368
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E364: .word ov13_0222E368
	arm_func_end ov13_0222E33C

	arm_func_start ov13_0222E368
ov13_0222E368: ; 0x0222E368
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222E38C ; =ov13_0222E390
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E38C: .word ov13_0222E390
	arm_func_end ov13_0222E368

	arm_func_start ov13_0222E390
ov13_0222E390: ; 0x0222E390
	stmdb sp!, {r3, lr}
	bl ov13_0222E3A4
	bl ov13_0222E3DC
	bl ov13_0222E3E0
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222E390

	arm_func_start ov13_0222E3A4
ov13_0222E3A4: ; 0x0222E3A4
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _0222E3C0
	mov r0, #1
	bl ov13_0222726C
_0222E3C0:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222E3A4

	arm_func_start ov13_0222E3DC
ov13_0222E3DC: ; 0x0222E3DC
	bx lr
	arm_func_end ov13_0222E3DC

	arm_func_start ov13_0222E3E0
ov13_0222E3E0: ; 0x0222E3E0
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	beq _0222E3FC
	cmp r0, #1
	beq _0222E408
	ldmia sp!, {r3, pc}
_0222E3FC:
	mov r0, #7
	bl ov13_0223ABB8
	b _0222E41C
_0222E408:
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _0222E428 ; =ov13_0224F518
	mov r1, #1
	strb r1, [r0]
_0222E41C:
	ldr r0, _0222E42C ; =ov13_0222E430
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E428: .word ov13_0224F518
_0222E42C: .word ov13_0222E430
	arm_func_end ov13_0222E3E0

	arm_func_start ov13_0222E430
ov13_0222E430: ; 0x0222E430
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222E44C ; =ov13_0222E450
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E44C: .word ov13_0222E450
	arm_func_end ov13_0222E430

	arm_func_start ov13_0222E450
ov13_0222E450: ; 0x0222E450
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227228
	ldr r0, _0222E4AC ; =ov13_0224F518
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222E48C
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
_0222E48C:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222E4B0 ; =ov13_0222E4B4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E4AC: .word ov13_0224F518
_0222E4B0: .word ov13_0222E4B4
	arm_func_end ov13_0222E450

	arm_func_start ov13_0222E4B4
ov13_0222E4B4: ; 0x0222E4B4
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222E560 ; =ov13_0224F518
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222E4E8
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
_0222E4E8:
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0222E560 ; =ov13_0224F518
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222E51C
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
_0222E51C:
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _0222E560 ; =ov13_0224F518
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	mov r0, #0
	bne _0222E550
	bl ov13_0222B8F8
	ldr r0, _0222E564 ; =ov13_0222D454
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222E550:
	bl ov13_0222B8F8
	ldr r0, _0222E568 ; =ov13_0222DFF4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E560: .word ov13_0224F518
_0222E564: .word ov13_0222D454
_0222E568: .word ov13_0222DFF4
	arm_func_end ov13_0222E4B4

	arm_func_start ov13_0222E56C
ov13_0222E56C: ; 0x0222E56C
	stmdb sp!, {r3, lr}
	ldr r0, _0222E594 ; =ov13_0224F51C
	mov r1, #0
	strb r1, [r0]
	bl ov13_0222E59C
	mov r0, #0x21
	bl ov13_022279EC
	ldr r0, _0222E598 ; =ov13_0222E608
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E594: .word ov13_0224F51C
_0222E598: .word ov13_0222E608
	arm_func_end ov13_0222E56C

	arm_func_start ov13_0222E59C
ov13_0222E59C: ; 0x0222E59C
	stmdb sp!, {r3, lr}
	ldr r0, _0222E5F8 ; =ov13_022462B0
	ldr r1, _0222E5FC ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r2, _0222E600 ; =0x04001008
	ldr r1, _0222E604 ; =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E5F8: .word ov13_022462B0
_0222E5FC: .word GX_LoadBG2Scr
_0222E600: .word 0x04001008
_0222E604: .word 0x0400000A
	arm_func_end ov13_0222E59C

	arm_func_start ov13_0222E608
ov13_0222E608: ; 0x0222E608
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222E638 ; =ov13_0222E63C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E638: .word ov13_0222E63C
	arm_func_end ov13_0222E608

	arm_func_start ov13_0222E63C
ov13_0222E63C: ; 0x0222E63C
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0222BC68
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _0222E668 ; =ov13_0222E66C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E668: .word ov13_0222E66C
	arm_func_end ov13_0222E63C

	arm_func_start ov13_0222E66C
ov13_0222E66C: ; 0x0222E66C
	stmdb sp!, {r3, lr}
	bl ov13_0222E720
	bl ov13_0222E67C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222E66C

	arm_func_start ov13_0222E67C
ov13_0222E67C: ; 0x0222E67C
	bx lr
	arm_func_end ov13_0222E67C

	arm_func_start ov13_0222E680
ov13_0222E680: ; 0x0222E680
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222E6B8 ; =ov13_0222E6BC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E6B8: .word ov13_0222E6BC
	arm_func_end ov13_0222E680

	arm_func_start ov13_0222E6BC
ov13_0222E6BC: ; 0x0222E6BC
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222E71C ; =ov13_0222D454
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E71C: .word ov13_0222D454
	arm_func_end ov13_0222E6BC

	arm_func_start ov13_0222E720
ov13_0222E720: ; 0x0222E720
	stmdb sp!, {r3, lr}
	ldr r0, _0222E74C ; =ov13_0224F51C
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0x78
	ldmloia sp!, {r3, pc}
	ldr r0, _0222E750 ; =ov13_0222E680
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E74C: .word ov13_0224F51C
_0222E750: .word ov13_0222E680
	arm_func_end ov13_0222E720

	arm_func_start ov13_0222E754
ov13_0222E754: ; 0x0222E754
	stmdb sp!, {r3, lr}
	bl ov13_0222E790
	mov r0, #0x20
	bl ov13_022279EC
	mov r0, #0x3c
	sub r1, r0, #0x3d
	mov r2, #0
	bl ov13_022277B8
	ldr r1, _0222E788 ; =ov13_0224F520
	strb r0, [r1]
	ldr r0, _0222E78C ; =ov13_0222E810
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E788: .word ov13_0224F520
_0222E78C: .word ov13_0222E810
	arm_func_end ov13_0222E754

	arm_func_start ov13_0222E790
ov13_0222E790: ; 0x0222E790
	stmdb sp!, {r3, lr}
	ldr r0, _0222E800 ; =ov13_022462C4
	ldr r1, _0222E804 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _0222E808 ; =0x04001008
	ldr r1, _0222E80C ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E800: .word ov13_022462C4
_0222E804: .word GX_LoadBG2Scr
_0222E808: .word 0x04001008
_0222E80C: .word 0x0400000A
	arm_func_end ov13_0222E790

	arm_func_start ov13_0222E810
ov13_0222E810: ; 0x0222E810
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222E870 ; =ov13_0224F520
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222E864
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
_0222E864:
	ldr r0, _0222E874 ; =ov13_0222E878
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E870: .word ov13_0224F520
_0222E874: .word ov13_0222E878
	arm_func_end ov13_0222E810

	arm_func_start ov13_0222E878
ov13_0222E878: ; 0x0222E878
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #3
	bl ov13_022279B4
	ldr r0, _0222E8B0 ; =ov13_0222E8B4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E8B0: .word ov13_0222E8B4
	arm_func_end ov13_0222E878

	arm_func_start ov13_0222E8B4
ov13_0222E8B4: ; 0x0222E8B4
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_0222BC68
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222E8E4 ; =ov13_0222E8E8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E8E4: .word ov13_0222E8E8
	arm_func_end ov13_0222E8B4

	arm_func_start ov13_0222E8E8
ov13_0222E8E8: ; 0x0222E8E8
	stmdb sp!, {r3, lr}
	bl ov13_0222E8FC
	bl ov13_0222E934
	bl ov13_0222E938
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222E8E8

	arm_func_start ov13_0222E8FC
ov13_0222E8FC: ; 0x0222E8FC
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _0222E918
	mov r0, #1
	bl ov13_0222726C
_0222E918:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222E8FC

	arm_func_start ov13_0222E934
ov13_0222E934: ; 0x0222E934
	bx lr
	arm_func_end ov13_0222E934

	arm_func_start ov13_0222E938
ov13_0222E938: ; 0x0222E938
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	beq _0222E968
	cmp r0, #1
	ldmneia sp!, {r3, pc}
	ldr r1, _0222E988 ; =ov13_0224F520
	mov r2, #1
	mov r0, #6
	strb r2, [r1, #1]
	bl ov13_0223ABB8
	b _0222E97C
_0222E968:
	ldr r1, _0222E988 ; =ov13_0224F520
	mov r2, #0
	mov r0, #7
	strb r2, [r1, #1]
	bl ov13_0223ABB8
_0222E97C:
	ldr r0, _0222E98C ; =ov13_0222E990
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E988: .word ov13_0224F520
_0222E98C: .word ov13_0222E990
	arm_func_end ov13_0222E938

	arm_func_start ov13_0222E990
ov13_0222E990: ; 0x0222E990
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222E9AC ; =ov13_0222E9B0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222E9AC: .word ov13_0222E9B0
	arm_func_end ov13_0222E990

	arm_func_start ov13_0222E9B0
ov13_0222E9B0: ; 0x0222E9B0
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227228
	ldr r0, _0222EA0C ; =ov13_0224F520
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0222E9EC
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
_0222E9EC:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222EA10 ; =ov13_0222EA14
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222EA0C: .word ov13_0224F520
_0222EA10: .word ov13_0222EA14
	arm_func_end ov13_0222E9B0

	arm_func_start ov13_0222EA14
ov13_0222EA14: ; 0x0222EA14
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0222EAB0 ; =ov13_0224F520
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0222EA6C
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
_0222EA6C:
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _0222EAB0 ; =ov13_0224F520
	mov r1, #1
	ldrb r0, [r0, #1]
	cmp r0, #0
	mov r0, #0
	bne _0222EAA0
	bl ov13_0222B8F8
	ldr r0, _0222EAB4 ; =ov13_0222D454
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222EAA0:
	bl ov13_0222B8F8
	ldr r0, _0222EAB8 ; =ov13_0222EEB4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222EAB0: .word ov13_0224F520
_0222EAB4: .word ov13_0222D454
_0222EAB8: .word ov13_0222EEB4
	arm_func_end ov13_0222EA14

	arm_func_start ov13_0222EABC
ov13_0222EABC: ; 0x0222EABC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x28
	bl ov13_0222BCA8
	mov r5, r0
	mov r0, #0
	mov r1, r0
	bl ov13_022408A0
	ldr r1, _0222EB80 ; =ov13_0224F524
	mov r2, #0
	strb r2, [r1, #1]
	mov r4, r0
	strb r2, [r1]
	bl ov13_0222EB8C
	mov r0, #0
	add r1, sp, #0x10
	mov r2, #0x16
	bl MIi_CpuClear16
	ldrb r2, [r5, #1]
	add r0, r5, #2
	add r1, sp, #0x10
	mov r2, r2, lsl #1
	bl MIi_CpuCopy16
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x480
	str r0, [sp, #8]
	add r1, sp, #0x10
	str r1, [sp, #0xc]
	mov r0, r4
	mov r1, #8
	mov r2, #0x35
	mov r3, #0xf0
	bl ov13_02240CC0
	mov r0, r4
	bl ov13_02240E2C
	ldr r0, _0222EB84 ; =ov13_0222EE80
	bl ov13_0222BC84
	mov r1, #4
	mov r2, #0
	mov r0, #0x1d
	sub r3, r1, #5
	str r2, [sp]
	bl ov13_0223BE6C
	ldr r0, _0222EB88 ; =ov13_0222EC0C
	bl ov13_0222B8E8
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0222EB80: .word ov13_0224F524
_0222EB84: .word ov13_0222EE80
_0222EB88: .word ov13_0222EC0C
	arm_func_end ov13_0222EABC

	arm_func_start ov13_0222EB8C
ov13_0222EB8C: ; 0x0222EB8C
	stmdb sp!, {r3, lr}
	ldr r0, _0222EBFC ; =ov13_022462D8
	ldr r1, _0222EC00 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _0222EC04 ; =0x04001008
	ldr r1, _0222EC08 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222EBFC: .word ov13_022462D8
_0222EC00: .word GX_LoadBG2Scr
_0222EC04: .word 0x04001008
_0222EC08: .word 0x0400000A
	arm_func_end ov13_0222EB8C

	arm_func_start ov13_0222EC0C
ov13_0222EC0C: ; 0x0222EC0C
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222EC3C ; =ov13_0222EC40
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222EC3C: .word ov13_0222EC40
	arm_func_end ov13_0222EC0C

	arm_func_start ov13_0222EC40
ov13_0222EC40: ; 0x0222EC40
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222EC60 ; =ov13_0222EC64
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222EC60: .word ov13_0222EC64
	arm_func_end ov13_0222EC40

	arm_func_start ov13_0222EC64
ov13_0222EC64: ; 0x0222EC64
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	ldr r0, _0222EC84 ; =ov13_0222EC88
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222EC84: .word ov13_0222EC88
	arm_func_end ov13_0222EC64

	arm_func_start ov13_0222EC88
ov13_0222EC88: ; 0x0222EC88
	stmdb sp!, {r3, lr}
	bl ov13_0222ECF8
	bl ov13_0222ECFC
	bl ov13_0223C1DC
	cmp r0, #0
	beq _0222ECAC
	cmp r0, #1
	beq _0222ECC4
	ldmia sp!, {r3, pc}
_0222ECAC:
	ldr r1, _0222ECF0 ; =ov13_0224F524
	mov r2, #0
	mov r0, #7
	strb r2, [r1, #1]
	bl ov13_0223ABB8
	b _0222ECD8
_0222ECC4:
	ldr r1, _0222ECF0 ; =ov13_0224F524
	mov r2, #1
	mov r0, #0xe
	strb r2, [r1, #1]
	bl ov13_0223ABB8
_0222ECD8:
	mov r0, #0
	bl ov13_0222BC84
	bl ov13_0223C198
	ldr r0, _0222ECF4 ; =ov13_0222ED00
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222ECF0: .word ov13_0224F524
_0222ECF4: .word ov13_0222ED00
	arm_func_end ov13_0222EC88

	arm_func_start ov13_0222ECF8
ov13_0222ECF8: ; 0x0222ECF8
	bx lr
	arm_func_end ov13_0222ECF8

	arm_func_start ov13_0222ECFC
ov13_0222ECFC: ; 0x0222ECFC
	bx lr
	arm_func_end ov13_0222ECFC

	arm_func_start ov13_0222ED00
ov13_0222ED00: ; 0x0222ED00
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222ED54 ; =ov13_0224F524
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0222ED34
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
_0222ED34:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222ED58 ; =ov13_0222ED5C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222ED54: .word ov13_0224F524
_0222ED58: .word ov13_0222ED5C
	arm_func_end ov13_0222ED00

	arm_func_start ov13_0222ED5C
ov13_0222ED5C: ; 0x0222ED5C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222EDB0 ; =ov13_0224F524
	ldrb r1, [r0]
	cmp r1, #0
	ldreqb r0, [r0, #1]
	cmpeq r0, #1
	bne _0222EDA0
	bl ov13_0222BC9C
	b _0222EDA4
_0222EDA0:
	bl ov13_0222BC0C
_0222EDA4:
	ldr r0, _0222EDB4 ; =ov13_0222EDB8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222EDB0: .word ov13_0224F524
_0222EDB4: .word ov13_0222EDB8
	arm_func_end ov13_0222ED5C

	arm_func_start ov13_0222EDB8
ov13_0222EDB8: ; 0x0222EDB8
	stmdb sp!, {r3, lr}
	ldr r0, _0222EE70 ; =ov13_0224F524
	ldrb r1, [r0]
	cmp r1, #0
	bne _0222EDD8
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0222EDE4
_0222EDD8:
	bl ov13_0222BC68
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
_0222EDE4:
	mov r0, #0
	bl ov13_02240B04
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _0222EE70 ; =ov13_0224F524
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0222EE18
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
_0222EE18:
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222EE70 ; =ov13_0224F524
	ldrb r1, [r0]
	cmp r1, #0
	beq _0222EE40
	ldr r0, _0222EE74 ; =ov13_0222E754
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222EE40:
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0222EE64
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	ldr r0, _0222EE78 ; =ov13_0222D454
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222EE64:
	ldr r0, _0222EE7C ; =ov13_0222DB6C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222EE70: .word ov13_0224F524
_0222EE74: .word ov13_0222E754
_0222EE78: .word ov13_0222D454
_0222EE7C: .word ov13_0222DB6C
	arm_func_end ov13_0222EDB8

	arm_func_start ov13_0222EE80
ov13_0222EE80: ; 0x0222EE80
	ldr r0, _0222EE90 ; =ov13_0224F524
	mov r1, #1
	strb r1, [r0]
	bx lr
	.balign 4, 0
_0222EE90: .word ov13_0224F524
	arm_func_end ov13_0222EE80

	arm_func_start ov13_0222EE94
ov13_0222EE94: ; 0x0222EE94
	ldr r0, _0222EEB0 ; =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.balign 4, 0
_0222EEB0: .word 0x027FFFA8
	arm_func_end ov13_0222EE94

	arm_func_start ov13_0222EEB4
ov13_0222EEB4: ; 0x0222EEB4
	stmdb sp!, {r3, lr}
	ldr r0, _0222EEF4 ; =ov13_0222F230
	bl ov13_0222BB20
	ldr r0, _0222EEF8 ; =ov13_0224F528
	mov r1, #0
	strb r1, [r0]
	bl ov13_0222EF00
	mov r0, #0x1c
	bl ov13_022279EC
	mov r0, #0
	bl ov13_02226F58
	mov r0, #0xb
	bl ov13_0223ABB8
	ldr r0, _0222EEFC ; =ov13_0222EF80
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222EEF4: .word ov13_0222F230
_0222EEF8: .word ov13_0224F528
_0222EEFC: .word ov13_0222EF80
	arm_func_end ov13_0222EEB4

	arm_func_start ov13_0222EF00
ov13_0222EF00: ; 0x0222EF00
	stmdb sp!, {r3, lr}
	ldr r0, _0222EF70 ; =ov13_022462EC
	ldr r1, _0222EF74 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _0222EF78 ; =0x04001008
	ldr r1, _0222EF7C ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222EF70: .word ov13_022462EC
_0222EF74: .word GX_LoadBG2Scr
_0222EF78: .word 0x04001008
_0222EF7C: .word 0x0400000A
	arm_func_end ov13_0222EF00

	arm_func_start ov13_0222EF80
ov13_0222EF80: ; 0x0222EF80
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222EFB0 ; =ov13_0222EFB4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222EFB0: .word ov13_0222EFB4
	arm_func_end ov13_0222EF80

	arm_func_start ov13_0222EFB4
ov13_0222EFB4: ; 0x0222EFB4
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	bl ov13_022279B4
	ldr r0, _0222EFDC ; =ov13_0222EFE0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222EFDC: .word ov13_0222EFE0
	arm_func_end ov13_0222EFB4

	arm_func_start ov13_0222EFE0
ov13_0222EFE0: ; 0x0222EFE0
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	ldr r0, _0222F000 ; =ov13_0222F004
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F000: .word ov13_0222F004
	arm_func_end ov13_0222EFE0

	arm_func_start ov13_0222F004
ov13_0222F004: ; 0x0222F004
	stmdb sp!, {r3, lr}
	bl ov13_0222F018
	bl ov13_0222F050
	bl ov13_0222F054
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222F004

	arm_func_start ov13_0222F018
ov13_0222F018: ; 0x0222F018
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _0222F038
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
_0222F038:
	bl ov13_0222EE94
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222F018

	arm_func_start ov13_0222F050
ov13_0222F050: ; 0x0222F050
	bx lr
	arm_func_end ov13_0222F050

	arm_func_start ov13_0222F054
ov13_0222F054: ; 0x0222F054
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _0222F07C ; =ov13_0222F080
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F07C: .word ov13_0222F080
	arm_func_end ov13_0222F054

	arm_func_start ov13_0222F080
ov13_0222F080: ; 0x0222F080
	stmdb sp!, {r3, lr}
	ldr r0, _0222F0B0 ; =ov13_0224F528
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F098
	bl ov13_0222BC0C
_0222F098:
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222F0B4 ; =ov13_0222F0B8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F0B0: .word ov13_0224F528
_0222F0B4: .word ov13_0222F0B8
	arm_func_end ov13_0222F080

	arm_func_start ov13_0222F0B8
ov13_0222F0B8: ; 0x0222F0B8
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222F130 ; =ov13_0224F528
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F0E8
	bl ov13_0222BC68
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
_0222F0E8:
	bl ov13_02227228
	ldr r0, _0222F130 ; =ov13_0224F528
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F110
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
_0222F110:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222F134 ; =ov13_0222F138
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F130: .word ov13_0224F528
_0222F134: .word ov13_0222F138
	arm_func_end ov13_0222F0B8

	arm_func_start ov13_0222F138
ov13_0222F138: ; 0x0222F138
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222F220 ; =ov13_0224F528
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F16C
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
_0222F16C:
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _0222F220 ; =ov13_0224F528
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F194
	bl ov13_0222BC68
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
_0222F194:
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0222F220 ; =ov13_0224F528
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F1C0
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
_0222F1C0:
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _0222F220 ; =ov13_0224F528
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F1F4
	mov r0, #0
	bl ov13_0222B8F8
	ldr r0, _0222F224 ; =ov13_0222D454
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222F1F4:
	cmp r0, #2
	mov r0, #0
	bne _0222F210
	bl ov13_0222B8F8
	ldr r0, _0222F228 ; =ov13_0222E754
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222F210:
	bl ov13_0222B8F8
	ldr r0, _0222F22C ; =ov13_0222EABC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F220: .word ov13_0224F528
_0222F224: .word ov13_0222D454
_0222F228: .word ov13_0222E754
_0222F22C: .word ov13_0222EABC
	arm_func_end ov13_0222F138

	arm_func_start ov13_0222F230
ov13_0222F230: ; 0x0222F230
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov13_0223AC20
	cmp r4, #0
	bne _0222F25C
	ldr r1, _0222F284 ; =ov13_0224F528
	mov r2, #1
	mov r0, #0x10
	strb r2, [r1]
	bl ov13_0223ABB8
	b _0222F270
_0222F25C:
	ldr r1, _0222F284 ; =ov13_0224F528
	mov r2, #2
	mov r0, #0x12
	strb r2, [r1]
	bl ov13_0223ABB8
_0222F270:
	mov r0, #0
	bl ov13_0222BC84
	ldr r0, _0222F288 ; =ov13_0222F080
	bl ov13_0222B8E8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0222F284: .word ov13_0224F528
_0222F288: .word ov13_0222F080
	arm_func_end ov13_0222F230

	arm_func_start ov13_0222F28C
ov13_0222F28C: ; 0x0222F28C
	ldr r0, _0222F2A8 ; =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.balign 4, 0
_0222F2A8: .word 0x027FFFA8
	arm_func_end ov13_0222F28C

	arm_func_start ov13_0222F2AC
ov13_0222F2AC: ; 0x0222F2AC
	stmdb sp!, {r3, lr}
	ldr r0, _0222F304 ; =ov13_0224F52C
	mov r1, #0
	strh r1, [r0, #2]
	bl ov13_0222F30C
	bl ov13_02227E40
	mov r0, #0x36
	sub r1, r0, #0x37
	mov r2, #0
	bl ov13_022277B8
	mov r0, #2
	bl ov13_02227964
	mov r0, #0x22
	bl ov13_022279EC
	mov r0, #0
	bl ov13_02226F58
	bl ov13_0222B254
	mov r0, #0xb
	bl ov13_0223ABB8
	ldr r0, _0222F308 ; =ov13_0222F3B4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F304: .word ov13_0224F52C
_0222F308: .word ov13_0222F3B4
	arm_func_end ov13_0222F2AC

	arm_func_start ov13_0222F30C
ov13_0222F30C: ; 0x0222F30C
	stmdb sp!, {r3, lr}
	ldr r0, _0222F394 ; =ov13_02246300
	ldr r1, _0222F398 ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _0222F39C ; =ov13_02246318
	ldr r1, _0222F3A0 ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _0222F3A4 ; =ov13_02246330
	ldr r1, _0222F3A8 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _0222F3AC ; =0x04001008
	ldr r1, _0222F3B0 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F394: .word ov13_02246300
_0222F398: .word GX_LoadBG2Char
_0222F39C: .word ov13_02246318
_0222F3A0: .word GX_LoadBGPltt
_0222F3A4: .word ov13_02246330
_0222F3A8: .word GX_LoadBG2Scr
_0222F3AC: .word 0x04001008
_0222F3B0: .word 0x0400000A
	arm_func_end ov13_0222F30C

	arm_func_start ov13_0222F3B4
ov13_0222F3B4: ; 0x0222F3B4
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222F404 ; =ov13_0222F408
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F404: .word ov13_0222F408
	arm_func_end ov13_0222F3B4

	arm_func_start ov13_0222F408
ov13_0222F408: ; 0x0222F408
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	bl ov13_022279B4
	ldr r0, _0222F440 ; =ov13_0222F444
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F440: .word ov13_0222F444
	arm_func_end ov13_0222F408

	arm_func_start ov13_0222F444
ov13_0222F444: ; 0x0222F444
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	ldr r1, _0222F480 ; =ov13_0222F764
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0222F484 ; =ov13_0224F52C
	str r0, [r1, #4]
	ldr r0, _0222F488 ; =ov13_0222F48C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F480: .word ov13_0222F764
_0222F484: .word ov13_0224F52C
_0222F488: .word ov13_0222F48C
	arm_func_end ov13_0222F444

	arm_func_start ov13_0222F48C
ov13_0222F48C: ; 0x0222F48C
	stmdb sp!, {r3, lr}
	bl ov13_0222F560
	bl ov13_0222F598
	bl ov13_0222F59C
	bl ov13_0222B3B4
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #1
	beq _0222F4BC
	cmp r0, #2
	beq _0222F4F0
	ldmia sp!, {r3, pc}
_0222F4BC:
	ldr r2, _0222F554 ; =ov13_0224F52C
	ldr r1, [r2, #4]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	strb r0, [r2]
	bl ov13_022425F0
	ldr r1, _0222F554 ; =ov13_0224F52C
	mov r2, #0
	ldr r0, _0222F558 ; =ov13_0222F7CC
	str r2, [r1, #4]
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222F4F0:
	ldr r0, _0222F554 ; =ov13_0224F52C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov13_0223AC20
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xc
	str ip, [sp]
	bl ov13_0223BE6C
	mov r0, #9
	bl ov13_0223ABB8
	bl ov13_022272E4
	ldr r1, _0222F554 ; =ov13_0224F52C
	mov r0, #1
	ldr r1, [r1, #4]
	bl ov13_022425F0
	ldr r1, _0222F554 ; =ov13_0224F52C
	mov r2, #0
	ldr r0, _0222F55C ; =ov13_0222F780
	str r2, [r1, #4]
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F554: .word ov13_0224F52C
_0222F558: .word ov13_0222F7CC
_0222F55C: .word ov13_0222F780
	arm_func_end ov13_0222F48C

	arm_func_start ov13_0222F560
ov13_0222F560: ; 0x0222F560
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _0222F580
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
_0222F580:
	bl ov13_0222F28C
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222F560

	arm_func_start ov13_0222F598
ov13_0222F598: ; 0x0222F598
	bx lr
	arm_func_end ov13_0222F598

	arm_func_start ov13_0222F59C
ov13_0222F59C: ; 0x0222F59C
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222F5E0 ; =ov13_0224F52C
	ldr r1, [r0, #4]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	bl ov13_022425D0
	ldr r0, _0222F5E0 ; =ov13_0224F52C
	mov r1, #0
	str r1, [r0, #4]
	bl ov13_022272E4
	ldr r0, _0222F5E4 ; =ov13_0222F818
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F5E0: .word ov13_0224F52C
_0222F5E4: .word ov13_0222F818
	arm_func_end ov13_0222F59C

	arm_func_start ov13_0222F5E8
ov13_0222F5E8: ; 0x0222F5E8
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	ldr r0, _0222F61C ; =ov13_0224F52C
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0222F608
	mov r0, #1
	bl ov13_022425F0
_0222F608:
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222F620 ; =ov13_0222F624
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F61C: .word ov13_0224F52C
_0222F620: .word ov13_0222F624
	arm_func_end ov13_0222F5E8

	arm_func_start ov13_0222F624
ov13_0222F624: ; 0x0222F624
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227228
	ldr r0, _0222F680 ; =ov13_0224F52C
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F660
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
_0222F660:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222F684 ; =ov13_0222F688
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F680: .word ov13_0224F52C
_0222F684: .word ov13_0222F688
	arm_func_end ov13_0222F624

	arm_func_start ov13_0222F688
ov13_0222F688: ; 0x0222F688
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222F758 ; =ov13_0224F52C
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F6BC
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
_0222F6BC:
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _0222F758 ; =ov13_0224F52C
	ldrb r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bl ov13_0222B364
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0222F758 ; =ov13_0224F52C
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F70C
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
_0222F70C:
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _0222F758 ; =ov13_0224F52C
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F740
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222F75C ; =ov13_02237618
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0222F740:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _0222F760 ; =ov13_0222F848
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F758: .word ov13_0224F52C
_0222F75C: .word ov13_02237618
_0222F760: .word ov13_0222F848
	arm_func_end ov13_0222F688

	arm_func_start ov13_0222F764
ov13_0222F764: ; 0x0222F764
	stmdb sp!, {r3, lr}
	bl ov13_022413E4
	mov r0, #0
	bl ov13_02242478
	bl ov13_0222F560
	bl ov13_0222F59C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222F764

	arm_func_start ov13_0222F780
ov13_0222F780: ; 0x0222F780
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _0222F7A8 ; =ov13_0222F7AC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F7A8: .word ov13_0222F7AC
	arm_func_end ov13_0222F780

	arm_func_start ov13_0222F7AC
ov13_0222F7AC: ; 0x0222F7AC
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222F7C8 ; =ov13_0222F5E8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F7C8: .word ov13_0222F5E8
	arm_func_end ov13_0222F7AC

	arm_func_start ov13_0222F7CC
ov13_0222F7CC: ; 0x0222F7CC
	stmdb sp!, {r3, lr}
	bl ov13_0222F560
	bl ov13_0222F598
	bl ov13_0222F59C
	ldr r1, _0222F80C ; =ov13_0224F52C
	ldr r0, _0222F810 ; =0x00000438
	ldrh r2, [r1, #2]
	add r2, r2, #1
	strh r2, [r1, #2]
	ldrh r1, [r1, #2]
	cmp r1, r0
	ldmloia sp!, {r3, pc}
	bl ov13_0223AC20
	ldr r0, _0222F814 ; =ov13_0222F5E8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F80C: .word ov13_0224F52C
_0222F810: .word 0x00000438
_0222F814: .word ov13_0222F5E8
	arm_func_end ov13_0222F7CC

	arm_func_start ov13_0222F818
ov13_0222F818: ; 0x0222F818
	stmdb sp!, {r3, lr}
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r1, _0222F840 ; =ov13_0224F52C
	mov r2, #0
	ldr r0, _0222F844 ; =ov13_0222F5E8
	strb r2, [r1]
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F840: .word ov13_0224F52C
_0222F844: .word ov13_0222F5E8
	arm_func_end ov13_0222F818

	arm_func_start ov13_0222F848
ov13_0222F848: ; 0x0222F848
	stmdb sp!, {r3, lr}
	ldr r0, _0222F87C ; =ov13_0224F534
	mov r1, #0
	strb r1, [r0]
	bl ov13_0222F884
	bl ov13_02227E40
	mov r0, #0x23
	bl ov13_022279EC
	mov r0, #0x10
	bl ov13_0223ABB8
	ldr r0, _0222F880 ; =ov13_0222F8F0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F87C: .word ov13_0224F534
_0222F880: .word ov13_0222F8F0
	arm_func_end ov13_0222F848

	arm_func_start ov13_0222F884
ov13_0222F884: ; 0x0222F884
	stmdb sp!, {r3, lr}
	ldr r0, _0222F8E0 ; =ov13_02246344
	ldr r1, _0222F8E4 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r2, _0222F8E8 ; =0x04001008
	ldr r1, _0222F8EC ; =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F8E0: .word ov13_02246344
_0222F8E4: .word GX_LoadBG2Scr
_0222F8E8: .word 0x04001008
_0222F8EC: .word 0x0400000A
	arm_func_end ov13_0222F884

	arm_func_start ov13_0222F8F0
ov13_0222F8F0: ; 0x0222F8F0
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222F920 ; =ov13_0222F924
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F920: .word ov13_0222F924
	arm_func_end ov13_0222F8F0

	arm_func_start ov13_0222F924
ov13_0222F924: ; 0x0222F924
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0222F944 ; =ov13_0222F948
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F944: .word ov13_0222F948
	arm_func_end ov13_0222F924

	arm_func_start ov13_0222F948
ov13_0222F948: ; 0x0222F948
	stmdb sp!, {r3, lr}
	bl ov13_0222FA08
	bl ov13_0222F958
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222F948

	arm_func_start ov13_0222F958
ov13_0222F958: ; 0x0222F958
	bx lr
	arm_func_end ov13_0222F958

	arm_func_start ov13_0222F95C
ov13_0222F95C: ; 0x0222F95C
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222F994 ; =ov13_0222F998
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222F994: .word ov13_0222F998
	arm_func_end ov13_0222F95C

	arm_func_start ov13_0222F998
ov13_0222F998: ; 0x0222F998
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, #1
	bl ov13_0222B934
	ldr r0, _0222FA04 ; =ov13_02238440
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222FA04: .word ov13_02238440
	arm_func_end ov13_0222F998

	arm_func_start ov13_0222FA08
ov13_0222FA08: ; 0x0222FA08
	stmdb sp!, {r3, lr}
	ldr r0, _0222FA34 ; =ov13_0224F534
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0x78
	ldmloia sp!, {r3, pc}
	ldr r0, _0222FA38 ; =ov13_0222F95C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222FA34: .word ov13_0224F534
_0222FA38: .word ov13_0222F95C
	arm_func_end ov13_0222FA08

	arm_func_start ov13_0222FA3C
ov13_0222FA3C: ; 0x0222FA3C
	stmdb sp!, {r3, lr}
	mov r0, #0x5c
	mov r1, #4
	bl ov13_0224128C
	ldr r2, _0222FB08 ; =ov13_0224F538
	mov r1, #0
	str r0, [r2, #4]
	add r0, sp, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #0
	bne _0222FA7C
	ldr r0, _0222FB08 ; =ov13_0224F538
	mov r1, #0
	strb r1, [r0]
	strh r1, [r0, #2]
_0222FA7C:
	ldr r0, _0222FB08 ; =ov13_0224F538
	ldr r0, [r0, #4]
	bl ov13_02239D04
	ldr r1, _0222FB08 ; =ov13_0224F538
	ldr r1, [r1, #4]
	strb r0, [r1, #0x51]
	bl ov13_0222FB14
	bl ov13_02227E40
	mov r0, #0x34
	sub r1, r0, #0x35
	mov r2, #0
	bl ov13_022277B8
	mov r0, #2
	bl ov13_02227964
	bl ov13_0222FC68
	bl ov13_0222FD10
	mov r0, #0
	mov r1, r0
	bl ov13_022408A0
	ldr r2, _0222FB08 ; =ov13_0224F538
	ldr r1, _0222FB0C ; =ov13_02230C68
	ldr r3, [r2, #4]
	mov r2, #0
	str r0, [r3, #0xc]
	mov r0, #1
	mov r3, #0x6e
	bl ov13_02242528
	ldr r1, _0222FB08 ; =ov13_0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x3c]
	bl ov13_022307AC
	bl ov13_02230CC4
	ldr r0, _0222FB10 ; =ov13_0222FE84
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222FB08: .word ov13_0224F538
_0222FB0C: .word ov13_02230C68
_0222FB10: .word ov13_0222FE84
	arm_func_end ov13_0222FA3C

	arm_func_start ov13_0222FB14
ov13_0222FB14: ; 0x0222FB14
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x30
	ldr r3, _0222FC4C ; =ov13_022453E3
	add lr, sp, #0x16
	mov r2, #0xc
_0222FB28:
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	add r3, r3, #2
	strb r1, [lr]
	strb r0, [lr, #1]
	add lr, lr, #2
	subs r2, r2, #1
	bne _0222FB28
	ldrb r0, [r3]
	ldr ip, _0222FC50 ; =ov13_022453CD
	add r3, sp, #0
	strb r0, [lr]
	mov r2, #0xb
_0222FB5C:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _0222FB5C
	ldr r0, _0222FC54 ; =ov13_02246358
	ldr r1, _0222FC58 ; =GX_LoadBG3Scr
	bl ov13_02227924
	add r0, sp, #0x16
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _0222FC5C ; =ov13_0224F538
	ldr r2, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1, #4]
	ldr r0, [r0, #4]
	bl ov13_02239228
	bl ov13_022392B4
	add r0, sp, #0
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _0222FC5C ; =ov13_0224F538
	ldr r3, _0222FC60 ; =0x04001008
	ldr r1, [r1, #4]
	sub r2, r3, #0x1000
	str r0, [r1, #8]
	ldrh r0, [r3]
	ldr r1, _0222FC64 ; =0x0400000A
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	bic r0, r0, #3
	orr r0, r0, #2
	strh r0, [r1, #4]
	add sp, sp, #0x30
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222FC4C: .word ov13_022453E3
_0222FC50: .word ov13_022453CD
_0222FC54: .word ov13_02246358
_0222FC58: .word GX_LoadBG3Scr
_0222FC5C: .word ov13_0224F538
_0222FC60: .word 0x04001008
_0222FC64: .word 0x0400000A
	arm_func_end ov13_0222FB14

	arm_func_start ov13_0222FC68
ov13_0222FC68: ; 0x0222FC68
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r2, _0222FD0C ; =ov13_0224F538
	mov r1, #0x1c
	ldr ip, [r2, #4]
	mov r0, #0
	ldrb r3, [ip, #0x51]
	sub r3, r3, #4
	mul r1, r3, r1
	strh r1, [ip, #0x40]
	ldr r2, [r2, #4]
	ldrb r1, [r2, #0x51]
	cmp r1, #4
	movls r4, r0
	strlsb r0, [r2, #0x53]
	bls _0222FCC8
	cmp r1, #8
	movhi r1, #0x37
	strhib r1, [r2, #0x53]
	movhi r4, #2
	bhi _0222FCC8
	mov r1, #0x1f
	strb r1, [r2, #0x53]
	mov r4, #1
_0222FCC8:
	cmp r4, #0
	beq _0222FCEC
	ldr r0, _0222FD0C ; =ov13_0224F538
	ldr r1, [r0, #4]
	ldrh r2, [r0, #2]
	ldrb r0, [r1, #0x53]
	ldrh r1, [r1, #0x40]
	mul r0, r2, r0
	bl FX_DivS32
_0222FCEC:
	str r0, [sp]
	mov r0, r4
	mov r1, #0x55
	mov r2, #0xec
	mov r3, #0x3f
	bl ov13_0223943C
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0222FD0C: .word ov13_0224F538
	arm_func_end ov13_0222FC68

	arm_func_start ov13_0222FD10
ov13_0222FD10: ; 0x0222FD10
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0222FE74 ; =ov13_0224F538
	mov sb, #0
	ldr r0, [r0, #4]
	ldrb r8, [r0, #0x51]
	cmp r8, #5
	movgt r8, #5
	cmp r8, #0
	ble _0222FD84
	ldr sl, _0222FE74 ; =ov13_0224F538
	mov r7, sb
	mov r6, #0x2e
	mov r5, sb
	mov r4, #0x18
_0222FD48:
	mov r0, r7
	mov r1, r6
	bl ov13_02240184
	ldr r2, [sl, #4]
	mov r1, r4
	add r2, r2, sb, lsl #2
	str r0, [r2, #0x10]
	mov r0, r5
	bl ov13_02240184
	ldr r1, [sl, #4]
	add r1, r1, sb, lsl #2
	add sb, sb, #1
	str r0, [r1, #0x24]
	cmp sb, r8
	blt _0222FD48
_0222FD84:
	mov r6, #0
	ldr r5, _0222FE78 ; =ov13_0224544C
	ldr sb, _0222FE74 ; =ov13_0224F538
	ldr r7, _0222FE7C ; =0x000003FF
	mov r4, r6
_0222FD98:
	ldr r0, [sb, #4]
	ldrb r1, [r5], #1
	ldr r2, [r0, #0x10]
	mov r0, r4
	bl ov13_022400F0
	ldr r0, [sb, #4]
	ldr r1, [r0, #0x10]
	add r0, r0, r6, lsl #1
	ldrh r1, [r1, #4]
	add r6, r6, #1
	cmp r6, #3
	and r1, r1, r7
	strh r1, [r0, #0x42]
	blo _0222FD98
	mov r6, #0
	ldr r5, _0222FE80 ; =ov13_02245450
	ldr sb, _0222FE74 ; =ov13_0224F538
	ldr r7, _0222FE7C ; =0x000003FF
	mov r4, r6
_0222FDE4:
	ldr r0, [sb, #4]
	ldrb r1, [r5], #1
	ldr r2, [r0, #0x24]
	mov r0, r4
	bl ov13_022400F0
	ldr r0, [sb, #4]
	ldr r1, [r0, #0x24]
	add r0, r0, r6, lsl #1
	ldrh r1, [r1, #4]
	add r6, r6, #1
	cmp r6, #4
	and r1, r1, r7
	strh r1, [r0, #0x48]
	blo _0222FDE4
	cmp r8, #0
	mov r0, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, _0222FE74 ; =ov13_0224F538
_0222FE2C:
	ldr r2, [r1, #4]
	add r2, r2, r0, lsl #2
	ldr r3, [r2, #0x10]
	ldrh r2, [r3, #4]
	bic r2, r2, #0xc00
	orr r2, r2, #0xc00
	strh r2, [r3, #4]
	ldr r2, [r1, #4]
	add r2, r2, r0, lsl #2
	ldr r3, [r2, #0x24]
	add r0, r0, #1
	ldrh r2, [r3, #4]
	cmp r0, r8
	bic r2, r2, #0xc00
	orr r2, r2, #0xc00
	strh r2, [r3, #4]
	blt _0222FE2C
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_0222FE74: .word ov13_0224F538
_0222FE78: .word ov13_0224544C
_0222FE7C: .word 0x000003FF
_0222FE80: .word ov13_02245450
	arm_func_end ov13_0222FD10

	arm_func_start ov13_0222FE84
ov13_0222FE84: ; 0x0222FE84
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x1d
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x1d
	bl ov13_02240EA8
	ldr r0, _0222FED4 ; =ov13_0222FED8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222FED4: .word ov13_0222FED8
	arm_func_end ov13_0222FE84

	arm_func_start ov13_0222FED8
ov13_0222FED8: ; 0x0222FED8
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_022279B4
	ldr r0, _0222FF10 ; =ov13_0222FF14
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222FF10: .word ov13_0222FF14
	arm_func_end ov13_0222FED8

	arm_func_start ov13_0222FF14
ov13_0222FF14: ; 0x0222FF14
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222FF38 ; =ov13_0222FF3C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222FF38: .word ov13_0222FF3C
	arm_func_end ov13_0222FF14

	arm_func_start ov13_0222FF3C
ov13_0222FF3C: ; 0x0222FF3C
	stmdb sp!, {r3, lr}
	bl ov13_0222FF50
	bl ov13_022301A4
	bl ov13_02230414
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0222FF3C

	arm_func_start ov13_0222FF50
ov13_0222FF50: ; 0x0222FF50
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _02230198 ; =ov13_0224F538
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	ldreqb r0, [r1, #0x57]
	cmpeq r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _0223019C ; =ov13_02245958
	bl ov13_022417DC
	cmp r0, #0
	beq _0222FFE8
	ldr r0, _02230198 ; =ov13_0224F538
	mvn r1, #0
	ldr r0, [r0, #4]
	ldr r5, _022301A0 ; =ov13_022453FC
	strb r1, [r0, #0x50]
	mov r4, #0
_0222FF98:
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _0222FFD8
	cmp r4, #4
	bge _0222FFC0
	ldr r0, _02230198 ; =ov13_0224F538
	ldr r0, [r0, #4]
	strb r4, [r0, #0x50]
	b _0222FFE8
_0222FFC0:
	mov r0, #1
	bl ov13_0222726C
	ldr r0, _02230198 ; =ov13_0224F538
	strb r4, [r0]
	bl ov13_02230CC4
	ldmia sp!, {r3, r4, r5, pc}
_0222FFD8:
	add r4, r4, #1
	cmp r4, #5
	add r5, r5, #8
	blo _0222FF98
_0222FFE8:
	ldr r0, _0223019C ; =ov13_02245958
	bl ov13_022418EC
	cmp r0, #0
	beq _02230064
	ldr r4, _022301A0 ; =ov13_022453FC
	mov r5, #0
_02230000:
	mov r0, r4
	bl ov13_022418EC
	cmp r0, #0
	beq _02230054
	ldr r0, _02230198 ; =ov13_0224F538
	ldr r1, [r0, #4]
	ldrsb r0, [r1, #0x50]
	cmp r0, r5
	bne _02230064
	ldrb r0, [r1, #0x51]
	cmp r5, r0
	blt _0223003C
	mov r0, #9
	bl ov13_0223ABB8
	b _02230064
_0223003C:
	mov r0, #1
	bl ov13_0222726C
	ldr r0, _02230198 ; =ov13_0224F538
	strb r5, [r0]
	bl ov13_02230CC4
	ldmia sp!, {r3, r4, r5, pc}
_02230054:
	add r5, r5, #1
	cmp r5, #4
	add r4, r4, #8
	blt _02230000
_02230064:
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _02230084
	mov r0, #1
	bl ov13_0222726C
	bl ov13_0223959C
	ldmia sp!, {r3, r4, r5, pc}
_02230084:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _022300A0
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, r4, r5, pc}
_022300A0:
	mov r0, #0x200
	bl ov13_022416D4
	cmp r0, #0
	beq _022300B8
	bl ov13_02230ED0
	ldmia sp!, {r3, r4, r5, pc}
_022300B8:
	mov r0, #0x200
	bl ov13_02241714
	cmp r0, #0
	beq _022300DC
	ldr r0, _02230198 ; =ov13_0224F538
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	ldmia sp!, {r3, r4, r5, pc}
_022300DC:
	mov r0, #0x100
	bl ov13_022416D4
	cmp r0, #0
	beq _022300F4
	bl ov13_02230E5C
	ldmia sp!, {r3, r4, r5, pc}
_022300F4:
	mov r0, #0x100
	bl ov13_02241714
	cmp r0, #0
	beq _02230118
	ldr r0, _02230198 ; =ov13_0224F538
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	ldmia sp!, {r3, r4, r5, pc}
_02230118:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _02230134
	mov r0, #1
	bl ov13_02230D10
	ldmia sp!, {r3, r4, r5, pc}
_02230134:
	mov r0, #0x40
	bl ov13_02241714
	cmp r0, #0
	beq _02230158
	ldr r0, _02230198 ; =ov13_0224F538
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	ldmia sp!, {r3, r4, r5, pc}
_02230158:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	beq _02230174
	mov r0, #3
	bl ov13_02230D10
	ldmia sp!, {r3, r4, r5, pc}
_02230174:
	mov r0, #0x80
	bl ov13_02241714
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _02230198 ; =ov13_0224F538
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02230198: .word ov13_0224F538
_0223019C: .word ov13_02245958
_022301A0: .word ov13_022453FC
	arm_func_end ov13_0222FF50

	arm_func_start ov13_022301A4
ov13_022301A4: ; 0x022301A4
	stmdb sp!, {r3, lr}
	ldr r0, _02230408 ; =ov13_0224F538
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldrb r0, [r1, #0x55]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r1, #0x55]
	bl ov13_02239564
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_022301DC: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _022301FC ; case 1
	b _02230214 ; case 2
	b _02230268 ; case 3
	b _02230314 ; case 4
	b _022303F4 ; case 5
	b _0223037C ; case 6
	b _022303F4 ; case 7
_022301FC:
	ldr r0, _02230408 ; =ov13_0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x57]
	bl ov13_022272E4
	ldmia sp!, {r3, pc}
_02230214:
	ldr r0, _02230408 ; =ov13_0224F538
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x55]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227D18
	bl ov13_02239550
	ldr r1, _02230408 ; =ov13_0224F538
	ldr r1, [r1, #4]
	ldrh r2, [r1, #0x40]
	ldrb r1, [r1, #0x53]
	mul r0, r2, r0
	bl FX_DivS32
	ldr r1, _02230408 ; =ov13_0224F538
	strh r0, [r1, #2]
	bl ov13_022307AC
	ldr r0, _02230408 ; =ov13_0224F538
	mov r1, #4
	ldr r0, [r0, #4]
	strb r1, [r0, #0x55]
	ldmia sp!, {r3, pc}
_02230268:
	ldr r0, _02230408 ; =ov13_0224F538
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x57]
	bl ov13_022272CC
	bl ov13_02239550
	ldr r1, _02230408 ; =ov13_0224F538
	ldr r1, [r1, #4]
	ldrh r2, [r1, #0x40]
	ldrb r1, [r1, #0x53]
	mul r0, r2, r0
	bl FX_DivS32
	ldr r1, _02230408 ; =ov13_0224F538
	strh r0, [r1, #2]
	mov r0, #0x13
	bl ov13_0223ABB8
	bl ov13_022307AC
	ldr r0, _02230408 ; =ov13_0224F538
	mov r1, #0x1c
	ldrh r0, [r0, #2]
	bl FX_ModS32
	cmp r0, #0
	bne _022302CC
	bl ov13_02230CC4
	ldmia sp!, {r3, pc}
_022302CC:
	cmp r0, #0xe
	mov r0, #0
	mov r3, #0x78
	bge _022302F8
	ldr r1, _0223040C ; =ov13_02230B14
	mov r2, r0
	bl ov13_02242528
	ldr r1, _02230408 ; =ov13_0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, pc}
_022302F8:
	ldr r1, _02230410 ; =ov13_02230BD0
	mov r2, r0
	bl ov13_02242528
	ldr r1, _02230408 ; =ov13_0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, pc}
_02230314:
	ldr r0, _02230408 ; =ov13_0224F538
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _02230350
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x58]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02230408 ; =ov13_0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x58]
	ldmia sp!, {r3, pc}
_02230350:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _0223040C ; =ov13_02230B14
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02230408 ; =ov13_0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, pc}
_0223037C:
	ldr r0, _02230408 ; =ov13_0224F538
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x51]
	cmp r1, #4
	bls _022303A0
	ldrh r1, [r0, #2]
	ldrh r0, [r2, #0x40]
	cmp r1, r0
	bne _022303C8
_022303A0:
	ldrb r0, [r2, #0x58]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02230408 ; =ov13_0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x58]
	ldmia sp!, {r3, pc}
_022303C8:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02230410 ; =ov13_02230BD0
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02230408 ; =ov13_0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, pc}
_022303F4:
	ldr r0, _02230408 ; =ov13_0224F538
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x58]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02230408: .word ov13_0224F538
_0223040C: .word ov13_02230B14
_02230410: .word ov13_02230BD0
	arm_func_end ov13_022301A4

	arm_func_start ov13_02230414
ov13_02230414: ; 0x02230414
	stmdb sp!, {r3, lr}
	ldr r0, _02230514 ; =ov13_0224F538
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	ldreqb r0, [r1, #0x57]
	cmpeq r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227258
	cmp r0, #0
	beq _0223044C
	cmp r0, #1
	beq _02230458
	ldmia sp!, {r3, pc}
_0223044C:
	mov r0, #7
	bl ov13_0223ABB8
	b _02230508
_02230458:
	ldr r0, _02230514 ; =ov13_0224F538
	ldrb r1, [r0]
	cmp r1, #4
	bne _02230484
	ldr r1, [r0, #4]
	mov r2, #1
	mov r0, #6
	strb r2, [r1, #0x54]
	bl ov13_0223ABB8
	bl ov13_02230F54
	b _02230508
_02230484:
	ldrh r0, [r0, #2]
	mov r1, #0x1c
	bl FX_DivS32
	ldr r2, _02230514 ; =ov13_0224F538
	mov r1, #0x2a
	ldrb lr, [r2]
	ldr ip, [r2, #4]
	ldr r3, [ip]
	add lr, lr, r0
	mla r0, lr, r1, r3
	ldrb r0, [r0, #0x28]
	cmp r0, #2
	bne _022304F0
	mov r0, #9
	bl ov13_0223ABB8
	bl ov13_0223959C
	bl ov13_022272E4
	mov r1, #1
	mov r0, #0
	str r0, [sp]
	mov r2, r1
	mov r0, #0xe
	sub r3, r1, #2
	bl ov13_0223BE6C
	ldr r0, _02230518 ; =ov13_02230F84
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_022304F0:
	mov r0, #1
	strb r0, [ip, #0x54]
	ldr r1, [r2, #4]
	mov r0, #6
	strb lr, [r1, #0x52]
	bl ov13_0223ABB8
_02230508:
	ldr r0, _0223051C ; =ov13_02230520
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02230514: .word ov13_0224F538
_02230518: .word ov13_02230F84
_0223051C: .word ov13_02230520
	arm_func_end ov13_02230414

	arm_func_start ov13_02230520
ov13_02230520: ; 0x02230520
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0223053C ; =ov13_02230540
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223053C: .word ov13_02230540
	arm_func_end ov13_02230520

	arm_func_start ov13_02230540
ov13_02230540: ; 0x02230540
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _022305A8 ; =ov13_0224F538
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x54]
	cmp r0, #0
	beq _02230570
	bl ov13_02227228
	b _02230574
_02230570:
	bl ov13_022272E4
_02230574:
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x1d
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _022305AC ; =ov13_022305B0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022305A8: .word ov13_0224F538
_022305AC: .word ov13_022305B0
	arm_func_end ov13_02230540

	arm_func_start ov13_022305B0
ov13_022305B0: ; 0x022305B0
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _02230790 ; =ov13_0224F538
	mov r0, #1
	ldr r1, [r1, #4]
	ldr r1, [r1, #0x3c]
	bl ov13_022425F0
	ldr r4, _02230790 ; =ov13_0224F538
	mov r5, #0
_022305FC:
	ldr r0, [r4, #4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02230614
	bl ov13_02241D98
_02230614:
	ldr r0, [r4, #4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _0223062C
	bl ov13_02241D98
_0223062C:
	add r5, r5, #1
	cmp r5, #5
	blt _022305FC
	ldr r0, _02230790 ; =ov13_0224F538
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl ov13_02240AA0
	bl ov13_02239514
	bl ov13_02227D18
	bl ov13_0222788C
	bl ov13_02239288
	ldr r0, _02230790 ; =ov13_0224F538
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	bl ov13_0223FA50
	ldr r0, _02230790 ; =ov13_0224F538
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	bl ov13_0223FA50
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x1d
	bl ov13_02240EFC
	mov r2, #0
	ldr r1, _02230794 ; =0x04000010
	ldr r0, _02230790 ; =ov13_0224F538
	str r2, [r1]
	str r2, [r1, #8]
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x54]
	cmp r1, #0
	bne _022306DC
	bl ov13_02239B34
	bl ov13_02239FF0
	ldrb r0, [r0, #0xf4]
	bl ov13_0223A414
	mov r0, #2
	mov r1, #0
	bl ov13_0222B8F8
	ldr r0, _02230798 ; =ov13_02237618
	bl ov13_0222B8E8
	b _02230784
_022306DC:
	ldrb r0, [r0]
	cmp r0, #4
	bne _02230704
	bl ov13_02239B34
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0223079C ; =ov13_022363F4
	bl ov13_0222B8E8
	b _02230784
_02230704:
	ldrb r1, [r2, #0x52]
	ldr r2, [r2]
	mov r0, #0x2a
	mla r0, r1, r0, r2
	bl ov13_0223A02C
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r1, _02230790 ; =ov13_0224F538
	mov r0, #0x2a
	ldr r2, [r1, #4]
	ldrb r1, [r2, #0x52]
	ldr r2, [r2]
	mla r0, r1, r0, r2
	ldrb r0, [r0, #0x28]
	mov r1, #1
	cmp r0, #0
	mov r0, #0
	beq _0223076C
	bl ov13_0222B8F8
	mov r0, #1
	mov r1, r0
	bl ov13_0222B934
	ldr r0, _022307A0 ; =ov13_02230FD8
	bl ov13_0222B8E8
	b _02230784
_0223076C:
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, #1
	bl ov13_0222B934
	ldr r0, _022307A4 ; =ov13_02238440
	bl ov13_0222B8E8
_02230784:
	ldr r0, _022307A8 ; =ov13_0224F53C
	bl ov13_022412B0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02230790: .word ov13_0224F538
_02230794: .word 0x04000010
_02230798: .word ov13_02237618
_0223079C: .word ov13_022363F4
_022307A0: .word ov13_02230FD8
_022307A4: .word ov13_02238440
_022307A8: .word ov13_0224F53C
	arm_func_end ov13_022305B0

	arm_func_start ov13_022307AC
ov13_022307AC: ; 0x022307AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _02230850 ; =ov13_0224F538
	mov r1, #0x1c
	ldrh r0, [r0, #2]
	bl FX_DivS32
	ldr r1, _02230850 ; =ov13_0224F538
	mov r7, r0
	ldr r0, [r1, #4]
	mov r1, #0
	ldrb r4, [r0, #0x51]
	ldr r0, [r0, #0xc]
	bl ov13_02240D80
	cmp r4, #5
	movgt r4, #5
	mov r5, r7
	cmp r4, #0
	mov r6, #0
	ble _02230810
_022307F4:
	mov r0, r5
	mov r1, r6
	bl ov13_02230854
	add r6, r6, #1
	cmp r6, r4
	add r5, r5, #1
	blt _022307F4
_02230810:
	cmp r4, #0
	mov r5, #0
	ble _02230838
_0223081C:
	mov r0, r7
	mov r1, r5
	bl ov13_022309CC
	add r5, r5, #1
	cmp r5, r4
	add r7, r7, #1
	blt _0223081C
_02230838:
	ldr r0, _02230850 ; =ov13_0224F538
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl ov13_02240E2C
	bl ov13_02230A58
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02230850: .word ov13_0224F538
	arm_func_end ov13_022307AC

	arm_func_start ov13_02230854
ov13_02230854: ; 0x02230854
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r7, r0
	mov r0, #0x2a
	ldr r2, _022309C8 ; =ov13_0224F538
	mul r6, r7, r0
	ldr r0, [r2, #4]
	mov r4, r1
	ldr r0, [r0]
	mov r1, #0x20
	add r0, r0, r6
	bl ov13_02242074
	ldr r2, _022309C8 ; =ov13_0224F538
	mov r1, #0x1c
	mul r5, r4, r1
	ldr r2, [r2, #4]
	mov r4, r0
	ldrb r1, [r2, #0x51]
	cmp r7, r1
	addge sp, sp, #0x30
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, sp, #0xc
	cmp r4, #0x10
	mov r1, #0
	mov r2, #0x22
	addle r5, r5, #6
	bl MI_CpuFill8
	cmp r4, #0x10
	movle ip, r4
	movgt ip, #0x10
	cmp ip, #0
	mov r3, #0
	ble _02230904
	ldr r0, _022309C8 ; =ov13_0224F538
	ldr r7, [r0, #4]
	add r0, sp, #0xc
_022308E4:
	ldr r2, [r7]
	mov r1, r3, lsl #1
	add r2, r6, r2
	ldrb r2, [r3, r2]
	add r3, r3, #1
	cmp r3, ip
	strh r2, [r0, r1]
	blt _022308E4
_02230904:
	mov r1, #0xa
	add r0, sp, #0xc
	str r1, [sp]
	str r0, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	ldr r0, _022309C8 ; =ov13_0224F538
	mov r2, r5
	ldr r0, [r0, #4]
	mov r3, #2
	ldr r0, [r0, #0xc]
	bl ov13_02240C14
	cmp r4, #0x10
	addle sp, sp, #0x30
	ldmleia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x22
	bl MI_CpuFill8
	sub r3, r4, #0x10
	cmp r3, #0
	mov r7, #0
	ble _02230990
	ldr r0, _022309C8 ; =ov13_0224F538
	ldr r4, [r0, #4]
	add r0, sp, #0xc
_0223096C:
	ldr r2, [r4]
	mov r1, r7, lsl #1
	add r2, r6, r2
	add r2, r7, r2
	ldrb r2, [r2, #0x10]
	add r7, r7, #1
	cmp r7, r3
	strh r2, [r0, r1]
	blt _0223096C
_02230990:
	mov r1, #0xa
	add r0, sp, #0xc
	str r1, [sp]
	str r0, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	ldr r0, _022309C8 ; =ov13_0224F538
	add r2, r5, #0xc
	ldr r0, [r0, #4]
	mov r3, #2
	ldr r0, [r0, #0xc]
	bl ov13_02240C14
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022309C8: .word ov13_0224F538
	arm_func_end ov13_02230854

	arm_func_start ov13_022309CC
ov13_022309CC: ; 0x022309CC
	stmdb sp!, {r4, lr}
	ldr r3, _02230A54 ; =ov13_0224F538
	ldr lr, [r3, #4]
	ldrb r2, [lr, #0x51]
	cmp r0, r2
	ldmgeia sp!, {r4, pc}
	mov r2, #0x2a
	mul r2, r0, r2
	ldr r0, [lr]
	add r4, lr, r1, lsl #2
	add r0, r0, r2
	ldrb ip, [r0, #0x28]
	ldr r4, [r4, #0x10]
	mov r0, #0x400
	add ip, lr, ip, lsl #1
	ldrh lr, [r4, #4]
	rsb r0, r0, #0
	ldrh ip, [ip, #0x42]
	and lr, lr, r0
	orr ip, lr, ip
	strh ip, [r4, #4]
	ldr lr, [r3, #4]
	ldr r3, [lr]
	add ip, lr, r1, lsl #2
	add r1, r3, r2
	ldrh r1, [r1, #0x26]
	ldr r3, [ip, #0x24]
	add r1, lr, r1, lsl #1
	ldrh r2, [r3, #4]
	ldrh r1, [r1, #0x48]
	and r0, r2, r0
	orr r0, r0, r1
	strh r0, [r3, #4]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02230A54: .word ov13_0224F538
	arm_func_end ov13_022309CC

	arm_func_start ov13_02230A58
ov13_02230A58: ; 0x02230A58
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02230B0C ; =ov13_0224F538
	mov r1, #0x1c
	ldrh r0, [r0, #2]
	bl FX_ModS32
	ldr r1, _02230B0C ; =ov13_0224F538
	rsb r0, r0, #0x36
	ldr r1, [r1, #4]
	mov r2, #0
	ldrb r1, [r1, #0x51]
	cmp r1, #5
	movgt r1, #5
	cmp r1, #0
	ble _02230AF8
	ldr ip, _02230B0C ; =ov13_0224F538
	ldr r3, _02230B10 ; =0xFE00FF00
_02230A98:
	ldr r5, [ip, #4]
	sub r4, r0, #2
	add r5, r5, r2, lsl #2
	ldr r6, [r5, #0x10]
	add lr, r0, #1
	ldr r5, [r6]
	and r4, r4, #0xff
	and r5, r5, r3
	orr r4, r5, r4
	orr r4, r4, #0xb30000
	str r4, [r6]
	ldr r4, [ip, #4]
	and lr, lr, #0xff
	add r4, r4, r2, lsl #2
	ldr r5, [r4, #0x24]
	add r2, r2, #1
	ldr r4, [r5]
	cmp r2, r1
	and r4, r4, r3
	orr r4, r4, lr
	orr r4, r4, #0xd20000
	str r4, [r5]
	add r0, r0, #0x1c
	blt _02230A98
_02230AF8:
	ldr r0, _02230B0C ; =ov13_0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x56]
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02230B0C: .word ov13_0224F538
_02230B10: .word 0xFE00FF00
	arm_func_end ov13_02230A58

	arm_func_start ov13_02230B14
ov13_02230B14: ; 0x02230B14
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl ov13_0223959C
	bl ov13_02227D18
	ldr r0, _02230BCC ; =ov13_0224F538
	ldrh r1, [r0, #2]
	cmp r1, #4
	subhi r1, r1, #4
	movls r1, #0
	strh r1, [r0, #2]
	ldr r0, _02230BCC ; =ov13_0224F538
	mov r1, #0x1c
	ldrh r0, [r0, #2]
	bl FX_ModS32
	mov r5, r0
	cmp r5, #0x18
	bne _02230B60
	bl ov13_022307AC
	ldmia sp!, {r3, r4, r5, pc}
_02230B60:
	ble _02230B7C
	ldr r0, _02230BCC ; =ov13_0224F538
	rsb r1, r5, #0x1c
	ldrh r2, [r0, #2]
	mov r5, #0
	add r1, r2, r1
	strh r1, [r0, #2]
_02230B7C:
	bl ov13_02230A58
	cmp r5, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _02230BCC ; =ov13_0224F538
	ldr r1, [r0, #4]
	ldrh r2, [r0, #2]
	ldrb r0, [r1, #0x53]
	ldrh r1, [r1, #0x40]
	mul r0, r2, r0
	bl FX_DivS32
	bl ov13_02239578
	bl ov13_02239584
	bl ov13_02230CC4
	ldr r0, _02230BCC ; =ov13_0224F538
	mov r1, r4
	ldr r2, [r0, #4]
	mov r0, #0
	str r0, [r2, #0x38]
	bl ov13_022425D0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02230BCC: .word ov13_0224F538
	arm_func_end ov13_02230B14

	arm_func_start ov13_02230BD0
ov13_02230BD0: ; 0x02230BD0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov13_0223959C
	bl ov13_02227D18
	ldr r0, _02230C64 ; =ov13_0224F538
	mov r1, #0x1c
	ldrh r2, [r0, #2]
	add r2, r2, #4
	strh r2, [r0, #2]
	ldrh r0, [r0, #2]
	bl FX_ModS32
	cmp r0, #4
	blt _02230C0C
	bl ov13_02230A58
	ldmia sp!, {r4, pc}
_02230C0C:
	ldr r1, _02230C64 ; =ov13_0224F538
	ldrh r2, [r1, #2]
	sub r0, r2, r0
	strh r0, [r1, #2]
	bl ov13_022307AC
	ldr r0, _02230C64 ; =ov13_0224F538
	ldr r1, [r0, #4]
	ldrh r2, [r0, #2]
	ldrb r0, [r1, #0x53]
	ldrh r1, [r1, #0x40]
	mul r0, r2, r0
	bl FX_DivS32
	bl ov13_02239578
	bl ov13_02239584
	bl ov13_02230CC4
	ldr r0, _02230C64 ; =ov13_0224F538
	mov r1, r4
	ldr r2, [r0, #4]
	mov r0, #0
	str r0, [r2, #0x38]
	bl ov13_022425D0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02230C64: .word ov13_0224F538
	arm_func_end ov13_02230BD0

	arm_func_start ov13_02230C68
ov13_02230C68: ; 0x02230C68
	stmdb sp!, {r3, lr}
	ldr r0, _02230CB8 ; =ov13_0224F538
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x56]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldrh r0, [r0, #2]
	mov r1, #0x1c
	bl FX_ModS32
	ldr r1, _02230CBC ; =0x01FF0000
	sub r0, r0, #0x32
	ldr r2, _02230CC0 ; =0x04000010
	and r1, r1, r0, lsl #16
	str r1, [r2]
	ldr r0, _02230CB8 ; =ov13_0224F538
	str r1, [r2, #8]
	ldr r0, [r0, #4]
	mov r1, #0
	strb r1, [r0, #0x56]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02230CB8: .word ov13_0224F538
_02230CBC: .word 0x01FF0000
_02230CC0: .word 0x04000010
	arm_func_end ov13_02230C68

	arm_func_start ov13_02230CC4
ov13_02230CC4: ; 0x02230CC4
	stmdb sp!, {r3, lr}
	ldr r0, _02230D00 ; =ov13_0224F538
	ldr r1, _02230D04 ; =ov13_02245424
	ldrb r2, [r0]
	ldr r3, _02230D08 ; =ov13_02245426
	mov ip, r2, lsl #3
	cmp r2, #4
	ldr r2, _02230D0C ; =ov13_02245428
	movlo r0, #2
	ldrh r1, [r1, ip]
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	movhs r0, #3
	bl ov13_02227B6C
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02230D00: .word ov13_0224F538
_02230D04: .word ov13_02245424
_02230D08: .word ov13_02245426
_02230D0C: .word ov13_02245428
	arm_func_end ov13_02230CC4

	arm_func_start ov13_02230D10
ov13_02230D10: ; 0x02230D10
	stmdb sp!, {r4, lr}
	ldr r1, _02230E54 ; =ov13_0224F538
	mov r4, #1
	ldrb r3, [r1]
	cmp r3, #4
	addls pc, pc, r3, lsl #2
	b _02230E0C
_02230D2C: ; jump table
	b _02230D40 ; case 0
	b _02230DA4 ; case 1
	b _02230DA4 ; case 2
	b _02230DD0 ; case 3
	b _02230DE8 ; case 4
_02230D40:
	cmp r0, #1
	bne _02230D88
	ldrh r0, [r1, #2]
	cmp r0, #0
	moveq r0, #4
	streqb r0, [r1]
	beq _02230E0C
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02230E58 ; =ov13_02230B14
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02230E54 ; =ov13_0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	ldmia sp!, {r4, pc}
_02230D88:
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x51]
	cmp r0, #1
	addhi r0, r3, #1
	strhib r0, [r1]
	movls r4, #0
	b _02230E0C
_02230DA4:
	cmp r0, #1
	subeq r0, r3, #1
	streqb r0, [r1]
	beq _02230E0C
	ldr r2, [r1, #4]
	add r0, r3, #1
	ldrb r2, [r2, #0x51]
	cmp r2, r0
	strgtb r0, [r1]
	movle r4, #0
	b _02230E0C
_02230DD0:
	cmp r0, #1
	subeq r0, r3, #1
	streqb r0, [r1]
	beq _02230E0C
	bl ov13_02230ED0
	ldmia sp!, {r4, pc}
_02230DE8:
	cmp r0, #1
	moveq r4, #0
	beq _02230E0C
	mov r0, #0
	strh r0, [r1, #2]
	strb r0, [r1]
	bl ov13_022307AC
	mov r0, #0
	bl ov13_02239578
_02230E0C:
	cmp r4, #0
	bne _02230E44
	ldr r0, _02230E54 ; =ov13_0224F538
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x59]
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02230E54 ; =ov13_0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	ldmia sp!, {r4, pc}
_02230E44:
	mov r0, #8
	bl ov13_0223ABB8
	bl ov13_02230CC4
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02230E54: .word ov13_0224F538
_02230E58: .word ov13_02230B14
	arm_func_end ov13_02230D10

	arm_func_start ov13_02230E5C
ov13_02230E5C: ; 0x02230E5C
	stmdb sp!, {r3, lr}
	ldr r0, _02230EC8 ; =ov13_0224F538
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _02230E9C
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x59]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02230EC8 ; =ov13_0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	ldmia sp!, {r3, pc}
_02230E9C:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02230ECC ; =ov13_02230B14
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02230EC8 ; =ov13_0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02230EC8: .word ov13_0224F538
_02230ECC: .word ov13_02230B14
	arm_func_end ov13_02230E5C

	arm_func_start ov13_02230ED0
ov13_02230ED0: ; 0x02230ED0
	stmdb sp!, {r3, lr}
	ldr r0, _02230F4C ; =ov13_0224F538
	ldr r2, [r0, #4]
	ldrh r1, [r0, #2]
	ldrh r0, [r2, #0x40]
	cmp r1, r0
	beq _02230EF8
	ldrb r0, [r2, #0x51]
	cmp r0, #4
	bhi _02230F20
_02230EF8:
	ldrb r0, [r2, #0x59]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02230F4C ; =ov13_0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	ldmia sp!, {r3, pc}
_02230F20:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02230F50 ; =ov13_02230BD0
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02230F4C ; =ov13_0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02230F4C: .word ov13_0224F538
_02230F50: .word ov13_02230BD0
	arm_func_end ov13_02230ED0

	arm_func_start ov13_02230F54
ov13_02230F54: ; 0x02230F54
	stmdb sp!, {r3, lr}
	ldr r1, _02230F7C ; =ov13_022453CC
	ldr r0, _02230F80 ; =ov13_0224F538
	ldrb r1, [r1]
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	mov r2, r1
	strb r1, [sp]
	bl ov13_02239378
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02230F7C: .word ov13_022453CC
_02230F80: .word ov13_0224F538
	arm_func_end ov13_02230F54

	arm_func_start ov13_02230F84
ov13_02230F84: ; 0x02230F84
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _02230FAC ; =ov13_02230FB0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02230FAC: .word ov13_02230FB0
	arm_func_end ov13_02230F84

	arm_func_start ov13_02230FB0
ov13_02230FB0: ; 0x02230FB0
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_022272CC
	bl ov13_02239584
	ldr r0, _02230FD4 ; =ov13_0222FF3C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02230FD4: .word ov13_0222FF3C
	arm_func_end ov13_02230FB0

	arm_func_start ov13_02230FD8
ov13_02230FD8: ; 0x02230FD8
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r1, _02231100 ; =ov13_02245454
	mov r0, #0x2c
	ldrb r3, [r1]
	ldrb r2, [r1, #1]
	mov r1, #4
	strb r3, [sp]
	strb r2, [sp, #1]
	bl ov13_0224128C
	ldr r2, _02231104 ; =ov13_0224F540
	add r1, sp, #4
	str r0, [r2]
	add r0, sp, #8
	bl ov13_0222B948
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02231050
	ldr r0, _02231104 ; =ov13_0224F540
	ldr r0, [r0]
	add r0, r0, #8
	bl ov13_0223A28C
	ldr r0, _02231104 ; =ov13_0224F540
	mov r1, #0x20
	ldr r0, [r0]
	add r0, r0, #8
	bl ov13_02242074
	ldr r1, _02231104 ; =ov13_0224F540
	ldr r1, [r1]
	strb r0, [r1, #0x29]
_02231050:
	bl ov13_0223110C
	ldr r0, [sp, #8]
	add r0, r0, #9
	bl ov13_02227DE4
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _02231080
	mov r0, #0x35
	sub r1, r0, #0x36
	mov r2, #0
	bl ov13_022277B8
	b _02231098
_02231080:
	ldr r2, [sp, #8]
	add r0, sp, #0
	ldrb r0, [r0, r2]
	mvn r1, #0
	mov r2, #0
	bl ov13_022277B8
_02231098:
	mov r0, #2
	bl ov13_02227964
	mov r0, #0
	mov r1, r0
	bl ov13_022408A0
	ldr r2, _02231104 ; =ov13_0224F540
	mov r1, #0x3e
	ldr r2, [r2]
	str r0, [r2]
	mov r0, #0
	bl ov13_02240184
	ldr r1, _02231104 ; =ov13_0224F540
	ldr r2, [r1]
	str r0, [r2, #4]
	ldr r0, [r1]
	ldr r1, [r0, #4]
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	bl ov13_022317A8
	bl ov13_022316B4
	ldr r0, _02231108 ; =ov13_022311C8
	bl ov13_0222B8E8
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.balign 4, 0
_02231100: .word ov13_02245454
_02231104: .word ov13_0224F540
_02231108: .word ov13_022311C8
	arm_func_end ov13_02230FD8

	arm_func_start ov13_0223110C
ov13_0223110C: ; 0x0223110C
	stmdb sp!, {r3, lr}
	ldr r0, _022311A0 ; =ov13_02246370
	ldr r1, _022311A4 ; =GX_LoadOBJPltt
	bl ov13_02227924
	ldr r0, _022311A8 ; =ov13_02246384
	ldr r1, _022311AC ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _022311B0 ; =ov13_0224639C
	ldr r1, _022311B4 ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _022311B8 ; =ov13_022463B4
	ldr r1, _022311BC ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _022311C0 ; =0x04001008
	ldr r1, _022311C4 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #2
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022311A0: .word ov13_02246370
_022311A4: .word GX_LoadOBJPltt
_022311A8: .word ov13_02246384
_022311AC: .word GX_LoadBG2Char
_022311B0: .word ov13_0224639C
_022311B4: .word GX_LoadBGPltt
_022311B8: .word ov13_022463B4
_022311BC: .word GX_LoadBG2Scr
_022311C0: .word 0x04001008
_022311C4: .word 0x0400000A
	arm_func_end ov13_0223110C

	arm_func_start ov13_022311C8
ov13_022311C8: ; 0x022311C8
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02231218 ; =ov13_0223121C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231218: .word ov13_0223121C
	arm_func_end ov13_022311C8

	arm_func_start ov13_0223121C
ov13_0223121C: ; 0x0223121C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02228054
	mov r0, #0x14
	bl ov13_0223ABB8
	ldr r0, _02231290 ; =ov13_0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0
	bne _02231268
	mov r0, #0
	bl ov13_02228400
_02231268:
	ldr r0, _02231290 ; =ov13_0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0x20
	bne _02231284
	mov r0, #0
	bl ov13_02228414
_02231284:
	ldr r0, _02231294 ; =ov13_02231298
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231290: .word ov13_0224F540
_02231294: .word ov13_02231298
	arm_func_end ov13_0223121C

	arm_func_start ov13_02231298
ov13_02231298: ; 0x02231298
	stmdb sp!, {r3, lr}
	bl ov13_022283EC
	cmp r0, #0xff
	ldmeqia sp!, {r3, pc}
	ldr r0, _022312B4 ; =ov13_022312B8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022312B4: .word ov13_022312B8
	arm_func_end ov13_02231298

	arm_func_start ov13_022312B8
ov13_022312B8: ; 0x022312B8
	stmdb sp!, {r3, lr}
	bl ov13_022312C8
	bl ov13_02231488
	ldmia sp!, {r3, pc}
	arm_func_end ov13_022312B8

	arm_func_start ov13_022312C8
ov13_022312C8: ; 0x022312C8
	stmdb sp!, {r4, lr}
	bl ov13_022283EC
	mov r4, r0
	cmp r4, #0x83
	bgt _02231308
	cmp r4, #0x80
	blt _022312FC
	beq _02231314
	cmp r4, #0x82
	beq _02231378
	cmp r4, #0x83
	beq _0223139C
	b _02231408
_022312FC:
	cmp r4, #0
	beq _0223146C
	b _02231408
_02231308:
	ldr r0, _02231478 ; =0x0000E01D
	cmp r4, r0
	b _02231408
_02231314:
	ldr r0, _0223147C ; =ov13_0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0
	beq _0223146C
	mov r0, #3
	bl ov13_0223ABB8
	ldr r1, _0223147C ; =ov13_0224F540
	mov r0, #0
	ldr r3, [r1]
	ldrb r2, [r3, #0x29]
	sub r2, r2, #1
	strb r2, [r3, #0x29]
	ldr r3, [r1]
	ldrb r2, [r3, #0x29]
	add r2, r3, r2
	strb r0, [r2, #8]
	ldr r1, [r1]
	ldrb r1, [r1, #0x29]
	cmp r1, #0
	bne _0223136C
	bl ov13_02228400
_0223136C:
	mov r0, #1
	bl ov13_02228414
	b _0223146C
_02231378:
	mov r0, #7
	bl ov13_0223ABB8
	ldr r1, _0223147C ; =ov13_0224F540
	ldr r0, _02231480 ; =ov13_0223148C
	ldr r1, [r1]
	mov r2, #0
	strb r2, [r1, #0x2a]
	bl ov13_0222B8E8
	ldmia sp!, {r4, pc}
_0223139C:
	bl ov13_0223191C
	cmp r0, #0
	beq _022313C4
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _0223147C ; =ov13_0224F540
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x2a]
	b _022313DC
_022313C4:
	ldr r0, _0223147C ; =ov13_0224F540
	mov r2, #2
	ldr r1, [r0]
	mov r0, #9
	strb r2, [r1, #0x2a]
	bl ov13_0223ABB8
_022313DC:
	ldr r0, _0223147C ; =ov13_0224F540
	ldr r1, _02231484 ; =0xC1FFFCFF
	ldr r2, [r0]
	ldr r0, _02231480 ; =ov13_0223148C
	ldr r3, [r2, #4]
	ldr r2, [r3]
	and r1, r2, r1
	orr r1, r1, #0x200
	str r1, [r3]
	bl ov13_0222B8E8
	ldmia sp!, {r4, pc}
_02231408:
	ldr r0, _0223147C ; =ov13_0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0x20
	beq _0223146C
	mov r0, #1
	bl ov13_0223ABB8
	ldr r1, _0223147C ; =ov13_0224F540
	mov r0, #1
	ldr r3, [r1]
	ldrb r2, [r3, #0x29]
	add r2, r3, r2
	strb r4, [r2, #8]
	ldr r2, [r1]
	ldrb r1, [r2, #0x29]
	add r1, r1, #1
	strb r1, [r2, #0x29]
	bl ov13_02228400
	ldr r0, _0223147C ; =ov13_0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0x20
	bne _0223146C
	mov r0, #0
	bl ov13_02228414
_0223146C:
	bl ov13_022316B4
	bl ov13_022317A8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02231478: .word 0x0000E01D
_0223147C: .word ov13_0224F540
_02231480: .word ov13_0223148C
_02231484: .word 0xC1FFFCFF
	arm_func_end ov13_022312C8

	arm_func_start ov13_02231488
ov13_02231488: ; 0x02231488
	bx lr
	arm_func_end ov13_02231488

	arm_func_start ov13_0223148C
ov13_0223148C: ; 0x0223148C
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _022314A4 ; =ov13_022314A8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022314A4: .word ov13_022314A8
	arm_func_end ov13_0223148C

	arm_func_start ov13_022314A8
ov13_022314A8: ; 0x022314A8
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_022283B8
	mov r0, #0x15
	bl ov13_0223ABB8
	ldr r0, _022314D4 ; =ov13_022314D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022314D4: .word ov13_022314D8
	arm_func_end ov13_022314A8

	arm_func_start ov13_022314D8
ov13_022314D8: ; 0x022314D8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _0223159C ; =ov13_02245454
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	bl ov13_02228428
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r3, pc}
	ldr r0, _022315A0 ; =ov13_0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x2a]
	cmp r0, #0
	bne _02231528
	ldr r0, _022315A4 ; =ov13_022315B0
	bl ov13_0222B8E8
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
_02231528:
	cmp r0, #2
	bne _0223155C
	mov r2, #1
	mov ip, #0
	sub r3, r2, #2
	mov r0, #6
	mov r1, #3
	str ip, [sp]
	bl ov13_0223BE6C
	ldr r0, _022315A8 ; =ov13_02231AA8
	bl ov13_0222B8E8
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
_0223155C:
	add r1, sp, #4
	mov r0, #0
	bl ov13_0222B948
	mov r0, #0
	str r0, [sp]
	mov r2, #1
	ldr r1, [sp, #4]
	add r0, sp, #8
	ldr r0, [r0, r1, lsl #2]
	sub r3, r2, #2
	mov r1, #2
	bl ov13_0223BE6C
	ldr r0, _022315AC ; =ov13_02231810
	bl ov13_0222B8E8
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223159C: .word ov13_02245454
_022315A0: .word ov13_0224F540
_022315A4: .word ov13_022315B0
_022315A8: .word ov13_02231AA8
_022315AC: .word ov13_02231810
	arm_func_end ov13_022314D8

	arm_func_start ov13_022315B0
ov13_022315B0: ; 0x022315B0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	bl ov13_0222788C
	ldr r0, _02231698 ; =ov13_0224F540
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov13_02241D98
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0223169C ; =ov13_022463C8
	ldr r1, _022316A0 ; =GX_LoadOBJPltt
	bl ov13_02227924
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	add r0, sp, #4
	add r1, sp, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #0
	bne _02231634
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r1, [sp, #4]
	mov r0, #0
	bl ov13_0222B934
	ldr r0, _022316A4 ; =ov13_02232E04
	bl ov13_0222B8E8
	b _02231688
_02231634:
	ldr r0, _02231698 ; =ov13_0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x2a]
	cmp r0, #0
	mov r0, #0
	bne _0223166C
	mov r1, #1
	bl ov13_0222B8F8
	mov r0, #1
	mov r1, #0
	bl ov13_0222B934
	ldr r0, _022316A8 ; =ov13_0222FA3C
	bl ov13_0222B8E8
	b _02231688
_0223166C:
	mov r1, r0
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, #1
	bl ov13_0222B934
	ldr r0, _022316AC ; =ov13_02238440
	bl ov13_0222B8E8
_02231688:
	ldr r0, _022316B0 ; =ov13_0224F540
	bl ov13_022412B0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231698: .word ov13_0224F540
_0223169C: .word ov13_022463C8
_022316A0: .word GX_LoadOBJPltt
_022316A4: .word ov13_02232E04
_022316A8: .word ov13_0222FA3C
_022316AC: .word ov13_02238440
_022316B0: .word ov13_0224F540
	arm_func_end ov13_022315B0

	arm_func_start ov13_022316B4
ov13_022316B4: ; 0x022316B4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldr r0, _0223179C ; =ov13_0224F540
	add r5, sp, #0x14
	mov r1, #0
	strh r1, [r5, #2]
	mov r4, #0x20
	strh r1, [r5, #4]
	mov r3, #0xe
	strh r1, [r5, #6]
	mov r2, #0x10
	ldr r0, [r0]
	strh r1, [r5]
	strh r4, [sp, #0x16]
	strh r3, [sp, #0x18]
	strh r2, [sp, #0x1a]
	ldr r0, [r0]
	bl ov13_02240D80
	mov sl, #0
	ldr r7, _022317A0 ; =0x0000E01D
	ldr r6, _022317A4 ; =ov13_02245470
	mov sb, sl
	strh sl, [sp, #0x12]
	mov r8, #0x31
	mov r5, #2
	mov r4, #0x480
	add fp, sp, #0x10
_02231720:
	ldr r0, _0223179C ; =ov13_0224F540
	cmp sl, #0x10
	ldr r0, [r0]
	moveq sb, #0
	streqh r8, [sp, #0x16]
	add r1, r0, sl
	ldrb r1, [r1, #8]
	ldrb r2, [r6, sb]
	cmp r1, #0x20
	streqh r7, [sp, #0x10]
	strneh r1, [sp, #0x10]
	ldrh r1, [sp, #0x1a]
	strh r2, [sp, #0x14]
	stmia sp, {r1, r5}
	str r4, [sp, #8]
	str fp, [sp, #0xc]
	ldrh r1, [sp, #0x14]
	ldrh r2, [sp, #0x16]
	ldrh r3, [sp, #0x18]
	ldr r0, [r0]
	bl ov13_02240CC0
	add sl, sl, #1
	cmp sl, #0x20
	add sb, sb, #1
	blt _02231720
	ldr r0, _0223179C ; =ov13_0224F540
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov13_02240E2C
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0223179C: .word ov13_0224F540
_022317A0: .word 0x0000E01D
_022317A4: .word ov13_02245470
	arm_func_end ov13_022316B4

	arm_func_start ov13_022317A8
ov13_022317A8: ; 0x022317A8
	stmdb sp!, {r3, lr}
	ldr r0, _02231800 ; =ov13_0224F540
	ldr r1, [r0]
	ldrb r0, [r1, #0x29]
	ldr ip, [r1, #4]
	ldr r1, _02231804 ; =ov13_0224546C
	cmp r0, #0x20
	and r2, r0, #0xf
	mov lr, r0, asr #4
	movhs lr, #1
	ldr r0, _02231808 ; =ov13_02245470
	movhs r2, #0xf
	ldrb r3, [r0, r2]
	ldr r2, [ip]
	ldr r0, _0223180C ; =0xFE00FF00
	ldrb r1, [r1, lr]
	and r0, r2, r0
	mov r2, r3, lsl #0x17
	orr r0, r0, r1
	orr r0, r0, r2, lsr #7
	str r0, [ip]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231800: .word ov13_0224F540
_02231804: .word ov13_0224546C
_02231808: .word ov13_02245470
_0223180C: .word 0xFE00FF00
	arm_func_end ov13_022317A8

	arm_func_start ov13_02231810
ov13_02231810: ; 0x02231810
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	ldr r1, _02231864 ; =ov13_0224F540
	ldr r2, [r1]
	strb r0, [r2, #0x2a]
	ldr r0, [r1]
	ldrb r0, [r0, #0x2a]
	cmp r0, #0
	beq _02231840
	cmp r0, #1
	beq _0223184C
	ldmia sp!, {r3, pc}
_02231840:
	mov r0, #7
	bl ov13_0223ABB8
	b _02231854
_0223184C:
	mov r0, #0xe
	bl ov13_0223ABB8
_02231854:
	bl ov13_0223C198
	ldr r0, _02231868 ; =ov13_0223186C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231864: .word ov13_0224F540
_02231868: .word ov13_0223186C
	arm_func_end ov13_02231810

	arm_func_start ov13_0223186C
ov13_0223186C: ; 0x0223186C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r0, _02231908 ; =ov13_02245454
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0x14]
	str r1, [sp, #4]
	str r0, [sp, #8]
	bl ov13_0223C1F0
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {pc}
	ldr r0, _0223190C ; =ov13_0224F540
	ldr r1, [r0]
	ldrb r0, [r1, #0x2a]
	cmp r0, #0
	bne _022318D0
	ldr r3, [r1, #4]
	ldr r1, _02231910 ; =0xC1FFFCFF
	ldr r2, [r3]
	ldr r0, _02231914 ; =ov13_0223121C
	and r1, r2, r1
	str r1, [r3]
	bl ov13_0222B8E8
	add sp, sp, #0xc
	ldmia sp!, {pc}
_022318D0:
	add r0, sp, #0
	mov r1, #0
	bl ov13_0222B948
	ldr r0, _0223190C ; =ov13_0224F540
	ldr r2, [sp]
	add r1, sp, #4
	ldr r0, [r0]
	ldr r1, [r1, r2, lsl #2]
	add r0, r0, #8
	blx r1
	ldr r0, _02231918 ; =ov13_022315B0
	bl ov13_0222B8E8
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.balign 4, 0
_02231908: .word ov13_02245454
_0223190C: .word ov13_0224F540
_02231910: .word 0xC1FFFCFF
_02231914: .word ov13_0223121C
_02231918: .word ov13_022315B0
	arm_func_end ov13_0223186C

	arm_func_start ov13_0223191C
ov13_0223191C: ; 0x0223191C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r0, sp, #4
	add r1, sp, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #1
	bne _0223194C
	mov r0, #0x35
	sub r1, r0, #0x36
	mov r2, #0
	bl ov13_022277B8
_0223194C:
	add r0, sp, #4
	add r1, sp, #0
	bl ov13_0222B948
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _02231984
	ldr r0, _02231AA4 ; =ov13_0224F540
	add sp, sp, #8
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
_02231984:
	ldr r0, [sp]
	cmp r0, #1
	bne _022319AC
	ldr r0, _02231AA4 ; =ov13_0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_022319AC:
	ldr r0, _02231AA4 ; =ov13_0224F540
	mov r1, #0x20
	ldr r0, [r0]
	add r0, r0, #8
	bl ov13_02242074
	cmp r0, #0x10
	bgt _02231A00
	cmp r0, #0xa
	blt _022319E4
	beq _02231A28
	cmp r0, #0xd
	cmpne r0, #0x10
	beq _02231A1C
	b _02231A98
_022319E4:
	cmp r0, #0
	bgt _022319F4
	beq _02231A1C
	b _02231A98
_022319F4:
	cmp r0, #5
	beq _02231A1C
	b _02231A98
_02231A00:
	cmp r0, #0x1a
	bgt _02231A10
	beq _02231A28
	b _02231A98
_02231A10:
	cmp r0, #0x20
	beq _02231A28
	b _02231A98
_02231A1C:
	add sp, sp, #8
	mov r0, #1
	ldmia sp!, {r3, pc}
_02231A28:
	cmp r0, #0
	mov r2, #0
	ble _02231A8C
	ldr r1, _02231AA4 ; =ov13_0224F540
	ldr r3, [r1]
_02231A3C:
	ldrb r1, [r3, #8]
	cmp r1, #0x30
	blo _02231A50
	cmp r1, #0x39
	bls _02231A7C
_02231A50:
	cmp r1, #0x41
	blo _02231A60
	cmp r1, #0x46
	bls _02231A7C
_02231A60:
	cmp r1, #0x61
	blo _02231A70
	cmp r1, #0x66
	bls _02231A7C
_02231A70:
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r3, pc}
_02231A7C:
	add r2, r2, #1
	cmp r2, r0
	add r3, r3, #1
	blt _02231A3C
_02231A8C:
	add sp, sp, #8
	mov r0, #1
	ldmia sp!, {r3, pc}
_02231A98:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231AA4: .word ov13_0224F540
	arm_func_end ov13_0223191C

	arm_func_start ov13_02231AA8
ov13_02231AA8: ; 0x02231AA8
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _02231AD0 ; =ov13_02231AD4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231AD0: .word ov13_02231AD4
	arm_func_end ov13_02231AA8

	arm_func_start ov13_02231AD4
ov13_02231AD4: ; 0x02231AD4
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02231B0C ; =ov13_0224F540
	ldr r1, _02231B10 ; =0xC1FFFCFF
	ldr r2, [r0]
	ldr r0, _02231B14 ; =ov13_0223121C
	ldr r3, [r2, #4]
	ldr r2, [r3]
	and r1, r2, r1
	str r1, [r3]
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231B0C: .word ov13_0224F540
_02231B10: .word 0xC1FFFCFF
_02231B14: .word ov13_0223121C
	arm_func_end ov13_02231AD4

	arm_func_start ov13_02231B18
ov13_02231B18: ; 0x02231B18
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	ldr r4, _02231C78 ; =ov13_02245498
	ldr ip, _02231C7C ; =ov13_02245480
	ldmia r4!, {r0, r1, r2, r3}
	add r5, sp, #0xc
	stmia r5!, {r0, r1, r2, r3}
	ldr r4, [r4]
	ldrb lr, [ip, #0xa]
	str r4, [r5]
	ldrb r5, [ip, #8]
	ldrb r4, [ip, #9]
	ldrb r3, [ip, #0xb]
	ldrb r2, [ip, #0xc]
	mov r0, #0x18
	mov r1, #4
	strb r5, [sp, #4]
	strb r4, [sp, #5]
	strb lr, [sp, #6]
	strb r3, [sp, #7]
	strb r2, [sp, #8]
	bl ov13_0224128C
	ldr r2, _02231C80 ; =ov13_0224F544
	mov r1, #0
	str r0, [r2]
	add r0, sp, #0
	bl ov13_0222B948
	ldr r0, _02231C80 ; =ov13_0224F544
	ldr r2, [sp]
	add r1, sp, #0xc
	ldr r0, [r0]
	ldr r1, [r1, r2, lsl #2]
	add r0, r0, #8
	blx r1
	ldr r0, _02231C80 ; =ov13_0224F544
	ldr r1, _02231C84 ; =ov13_022463E0
	ldr r4, [r0]
	mov r2, #3
	add r0, r4, #8
	bl memcmp
	cmp r0, #0
	movne r0, #3
	strneb r0, [r4, #0x14]
	bne _02231BE8
	add r0, r4, #8
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	ldr r0, _02231C80 ; =ov13_0224F544
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x14]
_02231BE8:
	bl ov13_02231C8C
	ldr r0, [sp]
	add r0, r0, #0xb
	bl ov13_02227DE4
	ldr r2, [sp]
	add r0, sp, #4
	ldrb r0, [r0, r2]
	mvn r1, #0
	mov r2, #0
	bl ov13_022277B8
	mov r0, #2
	bl ov13_02227964
	mov r0, #0
	mov r1, r0
	bl ov13_022408A0
	ldr r2, _02231C80 ; =ov13_0224F544
	mov r1, #0x3f
	ldr r2, [r2]
	str r0, [r2]
	mov r0, #0
	bl ov13_02240184
	ldr r1, _02231C80 ; =ov13_0224F544
	ldr r2, [r1]
	str r0, [r2, #4]
	ldr r0, [r1]
	ldr r1, [r0, #4]
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	bl ov13_02232440
	bl ov13_0223237C
	ldr r0, _02231C88 ; =ov13_02231D48
	bl ov13_0222B8E8
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02231C78: .word ov13_02245498
_02231C7C: .word ov13_02245480
_02231C80: .word ov13_0224F544
_02231C84: .word ov13_022463E0
_02231C88: .word ov13_02231D48
	arm_func_end ov13_02231B18

	arm_func_start ov13_02231C8C
ov13_02231C8C: ; 0x02231C8C
	stmdb sp!, {r3, lr}
	ldr r0, _02231D20 ; =ov13_022463E4
	ldr r1, _02231D24 ; =GX_LoadOBJPltt
	bl ov13_02227924
	ldr r0, _02231D28 ; =ov13_022463F8
	ldr r1, _02231D2C ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _02231D30 ; =ov13_02246410
	ldr r1, _02231D34 ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _02231D38 ; =ov13_02246428
	ldr r1, _02231D3C ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _02231D40 ; =0x04001008
	ldr r1, _02231D44 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #2
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231D20: .word ov13_022463E4
_02231D24: .word GX_LoadOBJPltt
_02231D28: .word ov13_022463F8
_02231D2C: .word GX_LoadBG2Char
_02231D30: .word ov13_02246410
_02231D34: .word GX_LoadBGPltt
_02231D38: .word ov13_02246428
_02231D3C: .word GX_LoadBG2Scr
_02231D40: .word 0x04001008
_02231D44: .word 0x0400000A
	arm_func_end ov13_02231C8C

	arm_func_start ov13_02231D48
ov13_02231D48: ; 0x02231D48
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02231D98 ; =ov13_02231D9C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231D98: .word ov13_02231D9C
	arm_func_end ov13_02231D48

	arm_func_start ov13_02231D9C
ov13_02231D9C: ; 0x02231D9C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02229D00
	mov r0, #0x14
	bl ov13_0223ABB8
	ldr r0, _02231E20 ; =ov13_0224F544
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _02231DF4
	mov r0, #0
	bl ov13_0222A084
	mov r0, #0
	bl ov13_0222A0AC
	b _02231E14
_02231DF4:
	mov r0, #0x1a
	bl ov13_02232168
	cmp r0, #0
	beq _02231E0C
	mov r0, #0
	bl ov13_0222A098
_02231E0C:
	mov r0, #0
	bl ov13_0222A0AC
_02231E14:
	ldr r0, _02231E24 ; =ov13_02231E28
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231E20: .word ov13_0224F544
_02231E24: .word ov13_02231E28
	arm_func_end ov13_02231D9C

	arm_func_start ov13_02231E28
ov13_02231E28: ; 0x02231E28
	stmdb sp!, {r3, lr}
	bl ov13_0222A070
	cmp r0, #0x1f
	ldmeqia sp!, {r3, pc}
	ldr r0, _02231E44 ; =ov13_02231E48
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231E44: .word ov13_02231E48
	arm_func_end ov13_02231E28

	arm_func_start ov13_02231E48
ov13_02231E48: ; 0x02231E48
	stmdb sp!, {r3, lr}
	bl ov13_02231E58
	bl ov13_022321FC
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02231E48

	arm_func_start ov13_02231E58
ov13_02231E58: ; 0x02231E58
	stmdb sp!, {r3, r4, r5, lr}
	bl ov13_0222A070
	mov r4, r0
	cmp r4, #0
	bgt _02231E74
	ldmeqia sp!, {r3, r4, r5, pc}
	b _02232038
_02231E74:
	sub r0, r4, #0x10
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02232038
_02231E84: ; jump table
	b _02231E98 ; case 0
	b _02231F40 ; case 1
	b _02231F94 ; case 2
	b _02231FB8 ; case 3
	ldmia sp!, {r3, r4, r5, pc} ; case 4
_02231E98:
	ldr r0, _0223215C ; =ov13_0224F544
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	cmpeq r0, #0
	beq _02232150
	mov r0, #3
	bl ov13_0223ABB8
	ldr r0, _0223215C ; =ov13_0224F544
	ldr r2, [r0]
	ldrb r1, [r2, #0x14]
	add r0, r1, r1, lsl #1
	add r0, r0, #2
	add r0, r2, r0
	ldrb r0, [r0, #8]
	cmp r0, #0
	subeq r0, r1, #1
	streqb r0, [r2, #0x14]
	ldr r0, _0223215C ; =ov13_0224F544
	mov r1, #0
	ldr r3, [r0]
	mov r2, #3
	ldrb r0, [r3, #0x14]
	add r3, r3, #8
	add r0, r0, r0, lsl #1
	add r0, r3, r0
	bl MI_CpuFill8
	ldr r0, _0223215C ; =ov13_0224F544
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	cmpeq r0, #0
	bne _02231F2C
	mov r0, #0
	bl ov13_0222A084
_02231F2C:
	mov r0, #1
	bl ov13_0222A098
	mov r0, #0
	bl ov13_0222A0AC
	b _02232150
_02231F40:
	ldr r0, _0223215C ; =ov13_0224F544
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #3
	bhs _02232150
	add r0, r0, r0, lsl #1
	add r0, r0, #2
	add r0, r1, r0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _02232150
	mov r0, #1
	bl ov13_0223ABB8
	ldr r1, _0223215C ; =ov13_0224F544
	mov r0, #0
	ldr r2, [r1]
	ldrb r1, [r2, #0x14]
	add r1, r1, #1
	strb r1, [r2, #0x14]
	bl ov13_0222A0AC
	b _02232150
_02231F94:
	ldr r0, _0223215C ; =ov13_0224F544
	mov r2, #0
	ldr r1, [r0]
	mov r0, #7
	strb r2, [r1, #0x15]
	bl ov13_0223ABB8
	ldr r0, _02232160 ; =ov13_02232200
	bl ov13_0222B8E8
	ldmia sp!, {r3, r4, r5, pc}
_02231FB8:
	bl ov13_0223261C
	cmp r0, #0
	beq _02231FE0
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _0223215C ; =ov13_0224F544
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x15]
	b _02231FF8
_02231FE0:
	ldr r0, _0223215C ; =ov13_0224F544
	mov r2, #2
	ldr r1, [r0]
	mov r0, #9
	strb r2, [r1, #0x15]
	bl ov13_0223ABB8
_02231FF8:
	ldr r1, _0223215C ; =ov13_0224F544
	mov r3, #3
	ldr r2, [r1]
	ldr r0, _02232164 ; =0xC1FFFCFF
	strb r3, [r2, #0x14]
	ldr r1, [r1]
	ldr r2, [r1, #4]
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x200
	str r0, [r2]
	bl ov13_02232440
	bl ov13_022325A4
	ldr r0, _02232160 ; =ov13_02232200
	bl ov13_0222B8E8
	ldmia sp!, {r3, r4, r5, pc}
_02232038:
	ldr r0, _0223215C ; =ov13_0224F544
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #3
	bne _0223205C
	mov r0, #0x1a
	bl ov13_02232168
	cmp r0, #0
	bne _02232150
_0223205C:
	mov r0, #1
	bl ov13_0223ABB8
	ldr r0, _0223215C ; =ov13_0224F544
	ldr r2, [r0]
	ldrb r1, [r2, #0x14]
	add r5, r2, #8
	add lr, r1, r1, lsl #1
	add ip, lr, #2
	ldrb r3, [r5, ip]
	cmp r3, #0
	streqb r4, [r5, ip]
	beq _022320F4
	add r2, lr, #1
	ldrb r1, [r5, r2]
	cmp r1, #0
	bne _022320D0
	strb r3, [r5, r2]
	mov r0, #0x1a
	strb r4, [r5, ip]
	bl ov13_02232168
	cmp r0, #0
	beq _022320F4
	ldr r0, _0223215C ; =ov13_0224F544
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #3
	addlo r0, r0, #1
	strlob r0, [r1, #0x14]
	b _022320F4
_022320D0:
	strb r1, [r5, lr]
	ldrb r1, [r5, ip]
	strb r1, [r5, r2]
	strb r4, [r5, ip]
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #3
	addlo r0, r0, #1
	strlob r0, [r1, #0x14]
_022320F4:
	mov r0, #1
	bl ov13_0222A084
	ldr r0, _0223215C ; =ov13_0224F544
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #3
	bhs _0223211C
	mov r0, #1
	bl ov13_0222A0AC
	b _02232124
_0223211C:
	mov r0, #0
	bl ov13_0222A0AC
_02232124:
	ldr r0, _0223215C ; =ov13_0224F544
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #3
	bne _02232150
	mov r0, #0x1a
	bl ov13_02232168
	cmp r0, #0
	beq _02232150
	mov r0, #0
	bl ov13_0222A098
_02232150:
	bl ov13_0223237C
	bl ov13_02232440
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223215C: .word ov13_0224F544
_02232160: .word ov13_02232200
_02232164: .word 0xC1FFFCFF
	arm_func_end ov13_02231E58

	arm_func_start ov13_02232168
ov13_02232168: ; 0x02232168
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _022321F8 ; =ov13_0224F544
	mov r4, r0
	ldr r1, [r1]
	ldrb r0, [r1, #0x14]
	add r3, r1, #8
	add r2, r0, r0, lsl #1
	ldrb r0, [r3, r2]
	cmp r0, #0
	cmpne r0, #0x20
	addne sp, sp, #4
	movne r0, #1
	ldmneia sp!, {r3, r4, pc}
	add r0, r3, r2
	add r1, sp, #0
	mov r2, #3
	bl MI_CpuCopy8
	mov r2, #0
	add r3, sp, #0
	strb r2, [sp, #3]
	mov r0, #0x20
_022321C0:
	ldrb r1, [r3]
	cmp r1, #0
	bne _022321DC
	add r2, r2, #1
	cmp r2, #3
	strb r0, [r3], #1
	blt _022321C0
_022321DC:
	add r0, sp, #0
	bl atoi
	cmp r0, r4
	movge r0, #1
	movlt r0, #0
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_022321F8: .word ov13_0224F544
	arm_func_end ov13_02232168

	arm_func_start ov13_022321FC
ov13_022321FC: ; 0x022321FC
	bx lr
	arm_func_end ov13_022321FC

	arm_func_start ov13_02232200
ov13_02232200: ; 0x02232200
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02232218 ; =ov13_0223221C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232218: .word ov13_0223221C
	arm_func_end ov13_02232200

	arm_func_start ov13_0223221C
ov13_0223221C: ; 0x0223221C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0222A03C
	mov r0, #0x15
	bl ov13_0223ABB8
	ldr r0, _02232248 ; =ov13_0223224C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232248: .word ov13_0223224C
	arm_func_end ov13_0223221C

	arm_func_start ov13_0223224C
ov13_0223224C: ; 0x0223224C
	stmdb sp!, {r3, lr}
	bl ov13_0222A0C0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _022322C8 ; =ov13_0224F544
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	bne _0223227C
	ldr r0, _022322CC ; =ov13_022322D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0223227C:
	mov r2, #1
	cmp r0, #2
	mov ip, #0
	sub r3, r2, #2
	bne _022322AC
	mov r0, #6
	mov r1, #3
	str ip, [sp]
	bl ov13_0223BE6C
	ldr r0, _022322D0 ; =ov13_02232770
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_022322AC:
	mov r0, #0x47
	mov r1, #2
	str ip, [sp]
	bl ov13_0223BE6C
	ldr r0, _022322D4 ; =ov13_02232494
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022322C8: .word ov13_0224F544
_022322CC: .word ov13_022322D8
_022322D0: .word ov13_02232770
_022322D4: .word ov13_02232494
	arm_func_end ov13_0223224C

	arm_func_start ov13_022322D8
ov13_022322D8: ; 0x022322D8
	stmdb sp!, {r3, lr}
	bl ov13_0222788C
	ldr r0, _02232368 ; =ov13_0224F544
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov13_02241D98
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0223236C ; =ov13_02246440
	ldr r1, _02232370 ; =GX_LoadOBJPltt
	bl ov13_02227924
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	add r0, sp, #0
	mov r1, #0
	bl ov13_0222B948
	ldr r0, [sp]
	mov r1, #1
	cmp r0, #3
	addge r0, r0, #1
	strge r0, [sp]
	mov r0, #2
	bl ov13_0222B8F8
	ldr r1, [sp]
	mov r0, #0
	add r1, r1, #3
	bl ov13_0222B934
	ldr r0, _02232374 ; =ov13_02232E04
	bl ov13_0222B8E8
	ldr r0, _02232378 ; =ov13_0224F544
	bl ov13_022412B0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232368: .word ov13_0224F544
_0223236C: .word ov13_02246440
_02232370: .word GX_LoadOBJPltt
_02232374: .word ov13_02232E04
_02232378: .word ov13_0224F544
	arm_func_end ov13_022322D8

	arm_func_start ov13_0223237C
ov13_0223237C: ; 0x0223237C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x1c
	ldr r0, _02232434 ; =ov13_0224F544
	ldr r1, _02232438 ; =ov13_02245480
	ldr r0, [r0]
	ldrh r5, [r1, #0xe]
	ldrh r4, [r1, #0x10]
	mov r3, #0xb
	mov r2, #0x10
	ldr r0, [r0]
	mov r1, #0
	strh r5, [sp, #0x14]
	strh r4, [sp, #0x16]
	strh r3, [sp, #0x18]
	strh r2, [sp, #0x1a]
	bl ov13_02240D80
	mov r4, #0
	ldr r5, _0223243C ; =ov13_022454C0
	ldr r6, _02232434 ; =ov13_0224F544
	strh r4, [sp, #0x12]
	mov sb, #2
	mov r8, #0x480
	add r7, sp, #0x10
_022323D8:
	ldr ip, [r6]
	ldrb r1, [r5], #1
	add r0, ip, r4
	ldrb r3, [r0, #8]
	ldrh r0, [sp, #0x1a]
	ldrh r2, [sp, #0x16]
	strh r3, [sp, #0x10]
	stmia sp, {r0, sb}
	str r8, [sp, #8]
	str r7, [sp, #0xc]
	ldrh r3, [sp, #0x18]
	ldr r0, [ip]
	strh r1, [sp, #0x14]
	bl ov13_02240CC0
	add r4, r4, #1
	cmp r4, #0xc
	blt _022323D8
	ldr r0, _02232434 ; =ov13_0224F544
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov13_02240E2C
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_02232434: .word ov13_0224F544
_02232438: .word ov13_02245480
_0223243C: .word ov13_022454C0
	arm_func_end ov13_0223237C

	arm_func_start ov13_02232440
ov13_02232440: ; 0x02232440
	ldr r0, _02232488 ; =ov13_0224F544
	ldr r2, [r0]
	ldrb r0, [r2, #0x14]
	ldr r3, [r2, #4]
	cmp r0, #3
	movgt r0, #3
	add r1, r0, r0, lsl #1
	ldr r0, _0223248C ; =ov13_022454C0
	add r1, r1, #2
	ldrb r2, [r0, r1]
	ldr r1, [r3]
	ldr r0, _02232490 ; =0xFE00FF00
	mov r2, r2, lsl #0x17
	and r0, r1, r0
	orr r0, r0, #0x28
	orr r0, r0, r2, lsr #7
	str r0, [r3]
	bx lr
	.balign 4, 0
_02232488: .word ov13_0224F544
_0223248C: .word ov13_022454C0
_02232490: .word 0xFE00FF00
	arm_func_end ov13_02232440

	arm_func_start ov13_02232494
ov13_02232494: ; 0x02232494
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	ldr r1, _022324E8 ; =ov13_0224F544
	ldr r2, [r1]
	strb r0, [r2, #0x15]
	ldr r0, [r1]
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _022324C4
	cmp r0, #1
	beq _022324D0
	ldmia sp!, {r3, pc}
_022324C4:
	mov r0, #7
	bl ov13_0223ABB8
	b _022324D8
_022324D0:
	mov r0, #0xe
	bl ov13_0223ABB8
_022324D8:
	bl ov13_0223C198
	ldr r0, _022324EC ; =ov13_022324F0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022324E8: .word ov13_0224F544
_022324EC: .word ov13_022324F0
	arm_func_end ov13_02232494

	arm_func_start ov13_022324F0
ov13_022324F0: ; 0x022324F0
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	ldr lr, _02232590 ; =ov13_022454AC
	add ip, sp, #4
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldr r0, [lr]
	str r0, [ip]
	bl ov13_0223C1F0
	cmp r0, #0
	addne sp, sp, #0x18
	ldmneia sp!, {r3, pc}
	ldr r0, _02232594 ; =ov13_0224F544
	ldr r1, [r0]
	ldrb r0, [r1, #0x15]
	cmp r0, #0
	bne _02232558
	ldr r3, [r1, #4]
	ldr r1, _02232598 ; =0xC1FFFCFF
	ldr r2, [r3]
	ldr r0, _0223259C ; =ov13_02231D9C
	and r1, r2, r1
	str r1, [r3]
	bl ov13_0222B8E8
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
_02232558:
	add r0, sp, #0
	mov r1, #0
	bl ov13_0222B948
	ldr r0, _02232594 ; =ov13_0224F544
	ldr r2, [sp]
	add r1, sp, #4
	ldr r0, [r0]
	ldr r1, [r1, r2, lsl #2]
	add r0, r0, #8
	blx r1
	ldr r0, _022325A0 ; =ov13_022322D8
	bl ov13_0222B8E8
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232590: .word ov13_022454AC
_02232594: .word ov13_0224F544
_02232598: .word 0xC1FFFCFF
_0223259C: .word ov13_02231D9C
_022325A0: .word ov13_022322D8
	arm_func_end ov13_022324F0

	arm_func_start ov13_022325A4
ov13_022325A4: ; 0x022325A4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	ldr r0, _02232618 ; =ov13_0224F544
	mov r6, r4
	mov r1, #0x20
	mov r2, #0x30
	mov ip, r4
_022325C0:
	ldr r3, [r0]
	mov r5, ip
	add r3, r3, #8
	add lr, r3, r6
_022325D0:
	ldrb r3, [lr, r5]
	cmp r3, #0x30
	cmpne r3, #0x20
	cmpne r3, #0
	bne _02232600
	cmp r5, #2
	moveq r3, r2
	movne r3, r1
	strb r3, [lr, r5]
	add r5, r5, #1
	cmp r5, #3
	blt _022325D0
_02232600:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #3
	blt _022325C0
	bl ov13_0223237C
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02232618: .word ov13_0224F544
	arm_func_end ov13_022325A4

	arm_func_start ov13_0223261C
ov13_0223261C: ; 0x0223261C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	ldr r2, _02232768 ; =ov13_02245480
	mov r0, #0
	ldrb ip, [r2]
	ldrb r3, [r2, #1]
	ldr r1, _0223276C ; =ov13_0224F544
	strb ip, [sp, #8]
	strb r3, [sp, #9]
	ldrb ip, [r2, #2]
	ldrb r3, [r2, #3]
	ldr r2, [r1]
	add r4, sp, #8
	strb ip, [sp, #0xa]
	mov r7, r0
	strb r3, [sp, #0xb]
	add lr, r2, #8
	mov ip, r0
_02232664:
	ldrb r1, [lr, r7]
	add r5, lr, r7
	cmp r1, #0x20
	beq _022326A8
	mov r6, ip
	mov r8, r4
_0223267C:
	ldrb r3, [r5, r6]
	ldrb r1, [r8]
	cmp r3, r1
	addhi sp, sp, #0xc
	movhi r0, #0
	ldmhiia sp!, {r3, r4, r5, r6, r7, r8, pc}
	blo _022326A8
	add r6, r6, #1
	cmp r6, #3
	add r8, r8, #1
	blt _0223267C
_022326A8:
	add r0, r0, #1
	cmp r0, #4
	add r7, r7, #3
	blt _02232664
	add r1, sp, #0
	add r0, r2, #8
	bl ov13_0223AA58
	add r0, sp, #4
	mov r1, #0
	bl ov13_0222B948
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _0223274C
	mov r4, #0
	mov r1, #1
	add r5, sp, #0
	mov r6, r4
	mov r2, r1
	mov ip, r4
_022326F4:
	ldrb r3, [r5]
	mov r7, ip
_022326FC:
	cmp r4, #0
	rsb r0, r7, #7
	beq _0223271C
	tst r3, r2, lsl r0
	beq _02232724
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_0223271C:
	tst r3, r1, lsl r0
	moveq r4, r1
_02232724:
	add r7, r7, #1
	cmp r7, #8
	blt _022326FC
	add r6, r6, #1
	cmp r6, #4
	add r5, r5, #1
	blt _022326F4
	add sp, sp, #0xc
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_0223274C:
	add r0, sp, #0
	bl DWC_BACKUPlCheckAddress
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02232768: .word ov13_02245480
_0223276C: .word ov13_0224F544
	arm_func_end ov13_0223261C

	arm_func_start ov13_02232770
ov13_02232770: ; 0x02232770
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _02232798 ; =ov13_0223279C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232798: .word ov13_0223279C
	arm_func_end ov13_02232770

	arm_func_start ov13_0223279C
ov13_0223279C: ; 0x0223279C
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _022327D4 ; =ov13_0224F544
	ldr r1, _022327D8 ; =0xC1FFFCFF
	ldr r2, [r0]
	ldr r0, _022327DC ; =ov13_02231D9C
	ldr r3, [r2, #4]
	ldr r2, [r3]
	and r1, r2, r1
	str r1, [r3]
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022327D4: .word ov13_0224F544
_022327D8: .word 0xC1FFFCFF
_022327DC: .word ov13_02231D9C
	arm_func_end ov13_0223279C

	arm_func_start ov13_022327E0
ov13_022327E0: ; 0x022327E0
	stmdb sp!, {r3, lr}
	bl ov13_022327FC
	bl ov13_0223287C
	ldr r0, _022327F8 ; =ov13_02232BD8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022327F8: .word ov13_02232BD8
	arm_func_end ov13_022327E0

	arm_func_start ov13_022327FC
ov13_022327FC: ; 0x022327FC
	stmdb sp!, {r3, lr}
	ldr r0, _0223286C ; =ov13_02246458
	ldr r1, _02232870 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _02232874 ; =0x04001008
	ldr r1, _02232878 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223286C: .word ov13_02246458
_02232870: .word GX_LoadBG2Scr
_02232874: .word 0x04001008
_02232878: .word 0x0400000A
	arm_func_end ov13_022327FC

	arm_func_start ov13_0223287C
ov13_0223287C: ; 0x0223287C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	add r1, sp, #0x10
	mov r0, #0
	bl ov13_0222B948
	ldr r0, _02232BAC ; =ov13_0224F548
	ldr r2, _02232BB0 ; =0xFFFFB17D
	ldr r1, [r0]
	cmp r1, r2
	movge r4, #0
	bge _02232AD8
	sub r0, r2, #1
	cmp r1, r0
	movge r4, #2
	bge _02232AD8
	sub r0, r2, #2
	cmp r1, r0
	movge r4, #0x13
	bge _02232AD8
	sub r0, r2, #8
	cmp r1, r0
	movge r4, #2
	bge _02232AD8
	sub r0, r2, #9
	cmp r1, r0
	movge r4, #0x12
	bge _02232AD8
	sub r0, r2, #0xa
	cmp r1, r0
	movge r4, #2
	bge _02232AD8
	sub r0, r2, #0xb
	cmp r1, r0
	movge r4, #3
	bge _02232AD8
	sub r0, r2, #0x384
	cmp r1, r0
	movge r4, #2
	bge _02232AD8
	ldr r0, _02232BB4 ; =0xFFFFA629
	cmp r1, r0
	movge r4, #0
	bge _02232AD8
	sub r0, r0, #0x3e8
	cmp r1, r0
	movge r4, #0x13
	bge _02232AD8
	ldr r0, _02232BB8 ; =0xFFFF3CB1
	cmp r1, r0
	movge r4, #0
	bge _02232AD8
	sub r2, r0, #3
	cmp r1, r2
	movge r4, #7
	bge _02232AD8
	sub r2, r0, #4
	cmp r1, r2
	movge r4, #5
	bge _02232AD8
	sub r2, r0, #0x63
	cmp r1, r2
	movge r4, #0
	bge _02232AD8
	sub r2, r0, #0x64
	cmp r1, r2
	blt _02232998
	ldr r0, [sp, #0x10]
	cmp r0, #2
	moveq r4, #5
	movne r4, #7
	b _02232AD8
_02232998:
	ldr r3, _02232BBC ; =0xFFFF3866
	cmp r1, r3
	movge r4, #0
	bge _02232AD8
	sub r2, r3, #1
	cmp r1, r2
	blt _022329C8
	ldr r0, [sp, #0x10]
	cmp r0, #2
	moveq r4, #5
	movne r4, #8
	b _02232AD8
_022329C8:
	sub r2, r3, #4
	cmp r1, r2
	movge r4, #9
	bge _02232AD8
	sub r2, r3, #5
	cmp r1, r2
	movge r4, #5
	bge _02232AD8
	sub r2, r3, #0x65
	cmp r1, r2
	movge r4, #0
	bge _02232AD8
	sub r2, r3, #0xc9
	cmp r1, r2
	movge r4, #0x14
	bge _02232AD8
	sub r2, r3, #0xcc
	cmp r1, r2
	movge r4, #0x15
	bge _02232AD8
	sub r2, r3, #0xcd
	cmp r1, r2
	movge r4, #4
	bge _02232AD8
	sub r0, r0, #0x7d0
	cmp r1, r0
	movge r4, #0
	bge _02232AD8
	sub r0, r3, #0x388
	cmp r1, r0
	movge r4, #0xa
	bge _02232AD8
	ldr r2, _02232BC0 ; =0xFFFF34DD
	cmp r1, r2
	movge r4, #0x16
	bge _02232AD8
	sub r0, r2, #0x60
	cmp r1, r0
	movge r4, #0
	bge _02232AD8
	sub r0, r2, #0x64
	cmp r1, r0
	movge r4, #0xb
	bge _02232AD8
	sub r0, r2, #0xc4
	cmp r1, r0
	movge r4, #0
	bge _02232AD8
	sub r0, r2, #0xc8
	cmp r1, r0
	movge r4, #0xb
	bge _02232AD8
	sub r0, r2, #0x128
	cmp r1, r0
	movge r4, #0
	bge _02232AD8
	sub r0, r2, #0x18c
	cmp r1, r0
	movge r4, #2
	bge _02232AD8
	sub r0, r2, #0x3e4
	cmp r1, r0
	movge r4, #0
	bge _02232AD8
	sub r0, r2, #0x510
	cmp r1, r0
	movge r4, #2
	movlt r4, #0
_02232AD8:
	bl ov13_0222B970
	mov r2, r0
	ldr r1, _02232BC4 ; =ov13_022454CC
	mov r0, #0
	ldrb r1, [r1, r2]
	bl ov13_022408A0
	ldr r1, _02232BC8 ; =ov13_0224F4F8
	mov r5, r0
	ldr r0, [r1]
	mov r1, r4
	bl ov13_0222BADC
	ldr r1, _02232BAC ; =ov13_0224F548
	mov r4, r0
	ldr r1, [r1]
	ldr r2, _02232BCC ; =ov13_0224646C
	rsb r3, r1, #0
	add r0, sp, #0x14
	mov r1, #8
	bl swprintf
	bl ov13_0222B970
	mov r1, r0, lsl #2
	ldr r0, _02232BD0 ; =ov13_022454DE
	ldrh r6, [r0, r1]
	bl ov13_0222B970
	mov r3, r0, lsl #2
	ldr r1, _02232BD4 ; =ov13_022454DC
	mov r0, #0xa
	ldrh r1, [r1, r3]
	str r0, [sp]
	add r3, sp, #0x14
	str r3, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r2, r6
	mov r0, r5
	mov r3, #2
	bl ov13_02240C14
	bl ov13_02227B1C
	mov r1, #0x5e
	str r1, [sp]
	mov r1, #2
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, r5
	mov r1, #0xd
	mov r2, #0x3c
	mov r3, #0xe6
	str r4, [sp, #0xc]
	bl ov13_02240CC0
	mov r0, r5
	bl ov13_02240E2C
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_02232BAC: .word ov13_0224F548
_02232BB0: .word 0xFFFFB17D
_02232BB4: .word 0xFFFFA629
_02232BB8: .word 0xFFFF3CB1
_02232BBC: .word 0xFFFF3866
_02232BC0: .word 0xFFFF34DD
_02232BC4: .word ov13_022454CC
_02232BC8: .word ov13_0224F4F8
_02232BCC: .word ov13_0224646C
_02232BD0: .word ov13_022454DE
_02232BD4: .word ov13_022454DC
	arm_func_end ov13_0223287C

	arm_func_start ov13_02232BD8
ov13_02232BD8: ; 0x02232BD8
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02232C08 ; =ov13_02232C0C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232C08: .word ov13_02232C0C
	arm_func_end ov13_02232BD8

	arm_func_start ov13_02232C0C
ov13_02232C0C: ; 0x02232C0C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #4
	bl ov13_022279B4
	ldr r0, _02232C44 ; =ov13_02232C48
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232C44: .word ov13_02232C48
	arm_func_end ov13_02232C0C

	arm_func_start ov13_02232C48
ov13_02232C48: ; 0x02232C48
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _02232C6C ; =ov13_02232C70
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232C6C: .word ov13_02232C70
	arm_func_end ov13_02232C48

	arm_func_start ov13_02232C70
ov13_02232C70: ; 0x02232C70
	stmdb sp!, {r3, lr}
	bl ov13_02232C84
	bl ov13_02232CA4
	bl ov13_02232CA8
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02232C70

	arm_func_start ov13_02232C84
ov13_02232C84: ; 0x02232C84
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02232C84

	arm_func_start ov13_02232CA4
ov13_02232CA4: ; 0x02232CA4
	bx lr
	arm_func_end ov13_02232CA4

	arm_func_start ov13_02232CA8
ov13_02232CA8: ; 0x02232CA8
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _02232CCC ; =ov13_02232CD0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232CCC: .word ov13_02232CD0
	arm_func_end ov13_02232CA8

	arm_func_start ov13_02232CD0
ov13_02232CD0: ; 0x02232CD0
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02232CEC ; =ov13_02232CF0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232CEC: .word ov13_02232CF0
	arm_func_end ov13_02232CD0

	arm_func_start ov13_02232CF0
ov13_02232CF0: ; 0x02232CF0
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227228
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02232D3C ; =ov13_02232D40
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232D3C: .word ov13_02232D40
	arm_func_end ov13_02232CF0

	arm_func_start ov13_02232D40
ov13_02232D40: ; 0x02232D40
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #0
	mov r0, #2
	beq _02232DC4
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02232DEC ; =ov13_022368D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02232DC4:
	mov r1, #0
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, r0
	bl ov13_0222B934
	mov r0, #0
	bl ov13_022352C0
	ldr r0, _02232DF0 ; =ov13_02232E04
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232DEC: .word ov13_022368D8
_02232DF0: .word ov13_02232E04
	arm_func_end ov13_02232D40

	arm_func_start ov13_02232DF4
ov13_02232DF4: ; 0x02232DF4
	ldr r1, _02232E00 ; =ov13_0224F548
	str r0, [r1]
	bx lr
	.balign 4, 0
_02232E00: .word ov13_0224F548
	arm_func_end ov13_02232DF4

	arm_func_start ov13_02232E04
ov13_02232E04: ; 0x02232E04
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	bl ov13_02239FF0
	mov r4, r0
	mov r0, #0x48
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _02232FE8 ; =ov13_0224F54C
	mov r2, #0xc
	str r0, [r1, #8]
	ldrb r3, [r4, #0xf6]
	strb r3, [r0, #0x43]
	ldr r0, [r1, #8]
	strb r2, [r0, #0x42]
	bl ov13_02233214
	bl ov13_02233000
	ldr r0, _02232FE8 ; =ov13_0224F54C
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _02232E74
	bl ov13_0222B970
	ldr r1, _02232FEC ; =ov13_022455D4
	ldrb r2, [r4, #0xf4]
	ldrsb r1, [r1, r0]
	mov r0, #0x30
	add r2, r2, #1
	bl ov13_022277B8
	b _02232E84
_02232E74:
	mov r0, #0x45
	sub r1, r0, #0x46
	mov r2, #0
	bl ov13_022277B8
_02232E84:
	mov r0, #1
	bl ov13_02227964
	bl ov13_02227E58
	ldr r0, _02232FE8 ; =ov13_0224F54C
	mov r1, #0x37
	ldrh r3, [r0, #4]
	ldr r2, _02232FF0 ; =0xE1FC780F
	mov r0, #2
	mul r5, r3, r1
	smull r1, r3, r2, r5
	add r3, r5, r3
	mov r1, r5, lsr #0x1f
	add r3, r1, r3, asr #7
	str r3, [sp]
	mov r1, #0x55
	mov r2, #0xf1
	mov r3, #0x41
	bl ov13_0223943C
	mov r0, #0
	mov r1, #1
	bl ov13_022408A0
	ldr r6, _02232FE8 ; =ov13_0224F54C
	mov r5, #0
	ldr r1, [r6, #8]
	mov r8, r5
	str r0, [r1, #0x14]
	mov r7, #0x29
_02232EF0:
	mov r0, r8
	mov r1, r7
	bl ov13_02240184
	ldr r1, [r6, #8]
	add r1, r1, r5, lsl #2
	add r5, r5, #1
	str r0, [r1, #0x18]
	cmp r5, #7
	blt _02232EF0
	ldrb r0, [r4, #0xe7]
	cmp r0, #1
	beq _02232F2C
	cmp r0, #2
	beq _02232F60
	b _02232F90
_02232F2C:
	mov r0, #0
	mov r1, #0x50
	bl ov13_02240184
	ldr r1, _02232FE8 ; =ov13_0224F54C
	ldr r2, [r1, #8]
	str r0, [r2, #0x34]
	ldr r0, [r1, #8]
	ldr r1, [r0, #0x34]
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	b _02232F90
_02232F60:
	mov r0, #0
	mov r1, #0x51
	bl ov13_02240184
	ldr r1, _02232FE8 ; =ov13_0224F54C
	ldr r2, [r1, #8]
	str r0, [r2, #0x34]
	ldr r0, [r1, #8]
	ldr r1, [r0, #0x34]
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
_02232F90:
	ldr r1, _02232FF4 ; =ov13_02234B48
	mov r0, #1
	mov r2, #0
	mov r3, #0x6e
	bl ov13_02242528
	ldr r2, _02232FE8 ; =ov13_0224F54C
	ldr r1, _02232FF8 ; =ov13_022350A8
	ldr r2, [r2, #8]
	mov r3, #0x78
	str r0, [r2, #0x3c]
	mov r0, #0
	mov r2, r0
	bl ov13_02242528
	ldr r1, _02232FE8 ; =ov13_0224F54C
	ldr r1, [r1, #8]
	str r0, [r1]
	bl ov13_02233DCC
	bl ov13_02234BCC
	ldr r0, _02232FFC ; =ov13_02233250
	bl ov13_0222B8E8
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02232FE8: .word ov13_0224F54C
_02232FEC: .word ov13_022455D4
_02232FF0: .word 0xE1FC780F
_02232FF4: .word ov13_02234B48
_02232FF8: .word ov13_022350A8
_02232FFC: .word ov13_02233250
	arm_func_end ov13_02232E04

	arm_func_start ov13_02233000
ov13_02233000: ; 0x02233000
	stmdb sp!, {lr}
	sub sp, sp, #0x44
	ldr r3, _022331D4 ; =ov13_02245573
	add ip, sp, #0x2b
	mov r2, #0xb
_02233014:
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	add r3, r3, #2
	strb r1, [ip]
	strb r0, [ip, #1]
	add ip, ip, #2
	subs r2, r2, #1
	bne _02233014
	ldrb r0, [r3]
	ldr r3, _022331D8 ; =ov13_02245548
	add lr, sp, #0x16
	strb r0, [ip]
	mov r2, #0xa
_02233048:
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	add r3, r3, #2
	strb r1, [lr]
	strb r0, [lr, #1]
	add lr, lr, #2
	subs r2, r2, #1
	bne _02233048
	ldrb r0, [r3]
	ldr ip, _022331DC ; =ov13_0224555D
	add r3, sp, #0
	strb r0, [lr]
	mov r2, #0xb
_0223307C:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _0223307C
	ldr r3, _022331E0 ; =0x0400000C
	ldr r0, _022331E4 ; =ov13_02246474
	ldrh r2, [r3]
	ldr r1, _022331E8 ; =GX_LoadOBJPltt
	and r2, r2, #0x43
	orr r2, r2, #0x218
	orr r2, r2, #0xc00
	strh r2, [r3]
	bl ov13_02227924
	ldr r0, _022331EC ; =ov13_02246488
	ldr r1, _022331F0 ; =GX_LoadBG3Char
	bl ov13_02227924
	ldr r0, _022331F4 ; =ov13_022464A0
	ldr r1, _022331F8 ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r1, _022331FC ; =GX_LoadBGPltt
	add r0, sp, #0x16
	bl ov13_02227924
	ldr r0, _02233200 ; =ov13_022464B8
	ldr r1, _02233204 ; =GX_LoadBG3Scr
	bl ov13_02227924
	add r0, sp, #0x2b
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _02233208 ; =ov13_0224F54C
	ldr r2, [r1, #8]
	str r0, [r2, #8]
	ldr r0, [r1, #8]
	ldr r0, [r0, #8]
	bl ov13_02239228
	bl ov13_022392B4
	add r0, sp, #0x16
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _02233208 ; =ov13_0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0xc]
	add r0, sp, #0
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _02233208 ; =ov13_0224F54C
	ldr r2, _0223320C ; =0x04001008
	ldr r1, [r1, #8]
	str r0, [r1, #0x10]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	sub r2, r2, #0x1000
	ldrh r0, [r2]
	ldr r1, _02233210 ; =0x0400000A
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	bic r0, r0, #3
	orr r0, r0, #2
	strh r0, [r1, #4]
	add sp, sp, #0x44
	ldmia sp!, {pc}
	.balign 4, 0
_022331D4: .word ov13_02245573
_022331D8: .word ov13_02245548
_022331DC: .word ov13_0224555D
_022331E0: .word 0x0400000C
_022331E4: .word ov13_02246474
_022331E8: .word GX_LoadOBJPltt
_022331EC: .word ov13_02246488
_022331F0: .word GX_LoadBG3Char
_022331F4: .word ov13_022464A0
_022331F8: .word GX_LoadBG2Char
_022331FC: .word GX_LoadBGPltt
_02233200: .word ov13_022464B8
_02233204: .word GX_LoadBG3Scr
_02233208: .word ov13_0224F54C
_0223320C: .word 0x04001008
_02233210: .word 0x0400000A
	arm_func_end ov13_02233000

	arm_func_start ov13_02233214
ov13_02233214: ; 0x02233214
	stmdb sp!, {r3, lr}
	bl ov13_02239FF0
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0223324C ; =ov13_0224F54C
	mov r1, #0
	strh r1, [r0, #4]
	strb r1, [r0]
	strb r1, [r0, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223324C: .word ov13_0224F54C
	arm_func_end ov13_02233214

	arm_func_start ov13_02233250
ov13_02233250: ; 0x02233250
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x1d
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x1d
	bl ov13_02240EA8
	ldr r0, _022332A0 ; =ov13_022332A4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022332A0: .word ov13_022332A4
	arm_func_end ov13_02233250

	arm_func_start ov13_022332A4
ov13_022332A4: ; 0x022332A4
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _022332D4 ; =ov13_022332D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022332D4: .word ov13_022332D8
	arm_func_end ov13_022332A4

	arm_func_start ov13_022332D8
ov13_022332D8: ; 0x022332D8
	stmdb sp!, {r3, lr}
	bl ov13_022332E8
	bl ov13_02233810
	ldmia sp!, {r3, pc}
	arm_func_end ov13_022332D8

	arm_func_start ov13_022332E8
ov13_022332E8: ; 0x022332E8
	stmdb sp!, {r3, lr}
	ldr r0, _02233558 ; =ov13_0224F54C
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	ldreqb r0, [r1, #0x45]
	cmpeq r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02233568
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _02233334
	ldr r0, _02233558 ; =ov13_0224F54C
	ldrb r0, [r0]
	bl ov13_022335EC
	ldmia sp!, {r3, pc}
_02233334:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _02233368
	mov r0, #7
	bl ov13_0223ABB8
	ldr r1, _02233558 ; =ov13_0224F54C
	ldr r0, _0223355C ; =ov13_02233A6C
	ldr r1, [r1, #8]
	mov r2, #0xd
	strb r2, [r1, #0x40]
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02233368:
	mov r0, #0x200
	bl ov13_022416D4
	cmp r0, #0
	beq _022333E0
	ldr r0, _02233558 ; =ov13_0224F54C
	ldrh r1, [r0, #4]
	cmp r1, #0x91
	bne _022333B4
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x47]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02233558 ; =ov13_0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	ldmia sp!, {r3, pc}
_022333B4:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02233560 ; =ov13_02234AA4
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02233558 ; =ov13_0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, pc}
_022333E0:
	mov r0, #0x200
	bl ov13_02241714
	cmp r0, #0
	beq _02233404
	ldr r0, _02233558 ; =ov13_0224F54C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	ldmia sp!, {r3, pc}
_02233404:
	mov r0, #0x100
	bl ov13_022416D4
	cmp r0, #0
	beq _0223347C
	ldr r0, _02233558 ; =ov13_0224F54C
	ldrh r1, [r0, #4]
	cmp r1, #0
	bne _02233450
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x47]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02233558 ; =ov13_0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	ldmia sp!, {r3, pc}
_02233450:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02233564 ; =ov13_022349DC
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02233558 ; =ov13_0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, pc}
_0223347C:
	mov r0, #0x100
	bl ov13_02241714
	cmp r0, #0
	beq _022334A0
	ldr r0, _02233558 ; =ov13_0224F54C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	ldmia sp!, {r3, pc}
_022334A0:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _022334BC
	mov r0, #1
	bl ov13_02234D84
	ldmia sp!, {r3, pc}
_022334BC:
	mov r0, #0x40
	bl ov13_02241714
	cmp r0, #0
	beq _022334E0
	ldr r0, _02233558 ; =ov13_0224F54C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	ldmia sp!, {r3, pc}
_022334E0:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	beq _022334FC
	mov r0, #3
	bl ov13_02234D84
	ldmia sp!, {r3, pc}
_022334FC:
	mov r0, #0x80
	bl ov13_02241714
	cmp r0, #0
	beq _02233520
	ldr r0, _02233558 ; =ov13_0224F54C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	ldmia sp!, {r3, pc}
_02233520:
	mov r0, #0x20
	bl ov13_022416D4
	cmp r0, #0
	beq _0223353C
	mov r0, #0
	bl ov13_02234D84
	ldmia sp!, {r3, pc}
_0223353C:
	mov r0, #0x10
	bl ov13_022416D4
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #2
	bl ov13_02234D84
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02233558: .word ov13_0224F54C
_0223355C: .word ov13_02233A6C
_02233560: .word ov13_02234AA4
_02233564: .word ov13_022349DC
	arm_func_end ov13_022332E8

	arm_func_start ov13_02233568
ov13_02233568: ; 0x02233568
	stmdb sp!, {r4, lr}
	bl ov13_02239FF0
	bl ov13_02234700
	mov r4, r0
	cmp r4, #0xe
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl ov13_0223417C
	cmp r0, #0
	bne _022335A0
	mov r0, #9
	bl ov13_0223ABB8
	mov r0, #1
	ldmia sp!, {r4, pc}
_022335A0:
	mov r0, r4
	bl ov13_02234D54
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _022335DC
_022335B4: ; jump table
	b _022335DC ; case 0
	b _022335DC ; case 1
	b _022335D8 ; case 2
	b _022335D8 ; case 3
	b _022335DC ; case 4
	b _022335DC ; case 5
	b _022335DC ; case 6
	b _022335D8 ; case 7
	b _022335D8 ; case 8
_022335D8:
	bl ov13_022350FC
_022335DC:
	mov r0, r4
	bl ov13_022335EC
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov13_02233568

	arm_func_start ov13_022335EC
ov13_022335EC: ; 0x022335EC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	bl ov13_0223417C
	cmp r0, #0
	bne _02233614
	mov r0, #9
	bl ov13_0223ABB8
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_02233614:
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _0223368C
_02233620: ; jump table
	b _0223368C ; case 0
	b _0223368C ; case 1
	b _02233644 ; case 2
	b _02233644 ; case 3
	b _0223368C ; case 4
	b _0223368C ; case 5
	b _0223368C ; case 6
	b _02233668 ; case 7
	b _02233668 ; case 8
_02233644:
	mov r0, #6
	bl ov13_0223ABB8
	sub r0, r4, #2
	teq r0, #1
	movne r0, #1
	moveq r0, #0
	bl ov13_0223376C
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_02233668:
	mov r0, #6
	bl ov13_0223ABB8
	sub r0, r4, #7
	teq r0, #1
	movne r0, #1
	moveq r0, #0
	bl ov13_022337D8
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0223368C:
	ldr r0, _0223375C ; =ov13_0224F54C
	sub r1, r4, #0xb
	ldr r0, [r0, #8]
	cmp r1, #1
	strb r4, [r0, #0x40]
	bhi _02233708
	bl ov13_02235074
	bl ov13_022351C0
	cmp r0, #0
	bne _022336E8
	mov r0, #9
	bl ov13_0223ABB8
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #6
	str ip, [sp]
	bl ov13_0223BE6C
	ldr r0, _02233760 ; =ov13_02235260
	bl ov13_0222B8E8
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_022336E8:
	cmp r4, #0xb
	bne _022336FC
	mov r0, #6
	bl ov13_0223ABB8
	b _02233748
_022336FC:
	mov r0, #0xe
	bl ov13_0223ABB8
	b _02233748
_02233708:
	cmp r4, #0xd
	bne _02233720
	bl ov13_02235074
	mov r0, #7
	bl ov13_0223ABB8
	b _02233748
_02233720:
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _02233764 ; =ov13_022455F4
	ldrb r0, [r0, r4]
	bl ov13_02234974
	mov r2, r0
	mov r0, #0
	mov r1, #1
	bl ov13_02234210
	bl ov13_022344F0
_02233748:
	bl ov13_0223959C
	ldr r0, _02233768 ; =ov13_02233A6C
	bl ov13_0222B8E8
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0223375C: .word ov13_0224F54C
_02233760: .word ov13_02235260
_02233764: .word ov13_022455F4
_02233768: .word ov13_02233A6C
	arm_func_end ov13_022335EC

	arm_func_start ov13_0223376C
ov13_0223376C: ; 0x0223376C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl ov13_02239FF0
	ldrb r1, [r0, #0xf5]
	cmp r1, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	beq _022337A8
	ldr r0, _022337D4 ; =ov13_0224F54C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x43]
	cmp r0, #0
	movne r5, #1
	moveq r5, #0
	b _022337BC
_022337A8:
	ldr r1, _022337D4 ; =ov13_0224F54C
	ldrb r2, [r0, #0xf6]
	ldr r0, [r1, #8]
	mov r5, #0
	strb r2, [r0, #0x43]
_022337BC:
	mov r0, r4
	bl ov13_0223A004
	mov r0, r5
	bl ov13_0223A018
	bl ov13_02233DCC
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022337D4: .word ov13_0224F54C
	arm_func_end ov13_0223376C

	arm_func_start ov13_022337D8
ov13_022337D8: ; 0x022337D8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov13_02239FF0
	ldrb r0, [r0, #0xf6]
	cmp r0, r4
	ldmeqia sp!, {r4, pc}
	ldr r1, _0223380C ; =ov13_0224F54C
	mov r0, r4
	ldr r1, [r1, #8]
	strb r4, [r1, #0x43]
	bl ov13_0223A018
	bl ov13_02233DCC
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223380C: .word ov13_0224F54C
	arm_func_end ov13_022337D8

	arm_func_start ov13_02233810
ov13_02233810: ; 0x02233810
	stmdb sp!, {r3, lr}
	ldr r0, _02233A5C ; =ov13_0224F54C
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldrb r0, [r1, #0x41]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r1, #0x41]
	bl ov13_02239564
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_02233848: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _02233868 ; case 1
	b _0223387C ; case 2
	b _022338D0 ; case 3
	b _02233978 ; case 4
	b _02233A48 ; case 5
	b _022339E0 ; case 6
	b _02233A48 ; case 7
_02233868:
	ldr r0, _02233A5C ; =ov13_0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x45]
	ldmia sp!, {r3, pc}
_0223387C:
	ldr r0, _02233A5C ; =ov13_0224F54C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x41]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227D18
	bl ov13_02239550
	mov r1, #0x91
	mul r1, r0, r1
	ldr r2, _02233A60 ; =0x094F2095
	mov r0, r1, lsr #0x1f
	smull r1, r3, r2, r1
	ldr r1, _02233A5C ; =ov13_0224F54C
	add r3, r0, r3, asr #1
	strh r3, [r1, #4]
	bl ov13_02233DCC
	ldr r0, _02233A5C ; =ov13_0224F54C
	mov r1, #4
	ldr r0, [r0, #8]
	strb r1, [r0, #0x41]
	ldmia sp!, {r3, pc}
_022338D0:
	ldr r0, _02233A5C ; =ov13_0224F54C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x45]
	bl ov13_02239550
	mov r1, #0x91
	mul r1, r0, r1
	ldr r2, _02233A60 ; =0x094F2095
	mov r0, r1, lsr #0x1f
	smull r1, r3, r2, r1
	ldr r1, _02233A5C ; =ov13_0224F54C
	add r3, r0, r3, asr #1
	mov r0, #0x13
	strh r3, [r1, #4]
	bl ov13_0223ABB8
	bl ov13_02233DCC
	ldr r0, _02233A5C ; =ov13_0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FX_ModS32
	cmp r0, #0
	bne _02233930
	bl ov13_02234CA4
	ldmia sp!, {r3, pc}
_02233930:
	cmp r0, #0x10
	mov r0, #0
	mov r3, #0x78
	bge _0223395C
	ldr r1, _02233A64 ; =ov13_022349DC
	mov r2, r0
	bl ov13_02242528
	ldr r1, _02233A5C ; =ov13_0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, pc}
_0223395C:
	ldr r1, _02233A68 ; =ov13_02234AA4
	mov r2, r0
	bl ov13_02242528
	ldr r1, _02233A5C ; =ov13_0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, pc}
_02233978:
	ldr r0, _02233A5C ; =ov13_0224F54C
	ldrh r1, [r0, #4]
	cmp r1, #0
	bne _022339B4
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x46]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02233A5C ; =ov13_0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x46]
	ldmia sp!, {r3, pc}
_022339B4:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02233A64 ; =ov13_022349DC
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02233A5C ; =ov13_0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, pc}
_022339E0:
	ldr r0, _02233A5C ; =ov13_0224F54C
	ldrh r1, [r0, #4]
	cmp r1, #0x91
	bne _02233A1C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x46]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02233A5C ; =ov13_0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x46]
	ldmia sp!, {r3, pc}
_02233A1C:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02233A68 ; =ov13_02234AA4
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02233A5C ; =ov13_0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, pc}
_02233A48:
	ldr r0, _02233A5C ; =ov13_0224F54C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x46]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02233A5C: .word ov13_0224F54C
_02233A60: .word 0x094F2095
_02233A64: .word ov13_022349DC
_02233A68: .word ov13_02234AA4
	arm_func_end ov13_02233810

	arm_func_start ov13_02233A6C
ov13_02233A6C: ; 0x02233A6C
	stmdb sp!, {r3, lr}
	bl ov13_0223959C
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02233A88 ; =ov13_02233A8C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02233A88: .word ov13_02233A8C
	arm_func_end ov13_02233A6C

	arm_func_start ov13_02233A8C
ov13_02233A8C: ; 0x02233A8C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x1d
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02233AD4 ; =ov13_02233AD8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02233AD4: .word ov13_02233AD8
	arm_func_end ov13_02233A8C

	arm_func_start ov13_02233AD8
ov13_02233AD8: ; 0x02233AD8
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, _02233DA0 ; =ov13_0224F54C
	mov r0, #0
	ldr r1, [r1, #8]
	ldr r1, [r1]
	bl ov13_022425F0
	ldr r1, _02233DA0 ; =ov13_0224F54C
	mov r0, #1
	ldr r1, [r1, #8]
	ldr r1, [r1, #0x3c]
	bl ov13_022425F0
	ldr r4, _02233DA0 ; =ov13_0224F54C
	mov r5, #0
_02233B2C:
	ldr r0, [r4, #8]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x18]
	bl ov13_02241D98
	add r5, r5, #1
	cmp r5, #7
	blt _02233B2C
	ldr r0, _02233DA0 ; =ov13_0224F54C
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _02233B60
	bl ov13_02241D98
_02233B60:
	bl ov13_02239514
	mov r0, #0
	bl ov13_02240B04
	bl ov13_02227D18
	ldr r0, _02233DA0 ; =ov13_0224F54C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x40]
	cmp r0, #0xc
	beq _02233B88
	bl ov13_0222788C
_02233B88:
	bl ov13_02239288
	ldr r0, _02233DA0 ; =ov13_0224F54C
	ldr r0, [r0, #8]
	ldr r0, [r0, #8]
	bl ov13_0223FA50
	ldr r4, _02233DA0 ; =ov13_0224F54C
	mov r5, #0
_02233BA4:
	ldr r0, [r4, #8]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0xc]
	bl ov13_0223FA50
	add r5, r5, #1
	cmp r5, #2
	blt _02233BA4
	ldr r0, _02233DA4 ; =ov13_022464CC
	ldr r1, _02233DA8 ; =GX_LoadOBJPltt
	bl ov13_02227924
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x1d
	bl ov13_02240EFC
	ldr r0, _02233DAC ; =0x04000010
	mov r1, #0
	str r1, [r0]
	sub r3, r0, #4
	str r1, [r0, #8]
	ldrh r0, [r3]
	ldr r2, _02233DA0 ; =ov13_0224F54C
	and r0, r0, #0x43
	orr r0, r0, #0xe10
	strh r0, [r3]
	ldr r0, [r2, #8]
	ldrb r0, [r0, #0x40]
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _02233D94
_02233C20: ; jump table
	b _02233C58 ; case 0
	b _02233C58 ; case 1
	b _02233D94 ; case 2
	b _02233D94 ; case 3
	b _02233C74 ; case 4
	b _02233C74 ; case 5
	b _02233C74 ; case 6
	b _02233D94 ; case 7
	b _02233D94 ; case 8
	b _02233C74 ; case 9
	b _02233C74 ; case 10
	b _02233CA4 ; case 11
	b _02233D3C ; case 12
	b _02233D50 ; case 13
_02233C58:
	bl ov13_0222B934
	mov r0, #2
	mov r1, #0
	bl ov13_0222B8F8
	ldr r0, _02233DB0 ; =ov13_02230FD8
	bl ov13_0222B8E8
	b _02233D94
_02233C74:
	sub r4, r0, #4
	cmp r0, #9
	subhs r4, r4, #2
	mov r0, #2
	mov r1, #0
	bl ov13_0222B8F8
	mov r0, r4
	mov r1, #0
	bl ov13_0222B934
	ldr r0, _02233DB4 ; =ov13_02231B18
	bl ov13_0222B8E8
	b _02233D94
_02233CA4:
	bl ov13_02239FF0
	mov r4, r0
	add r0, r4, #0xf0
	bl DWCi_BACKUPlConvMaskCidr
	strb r0, [r4, #0xd0]
	ldrb r0, [r4, #0xf5]
	cmp r0, #0
	beq _02233CFC
	add r0, r4, #0xc0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	add r0, r4, #0xc4
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	add r0, r4, #0xf0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r0, #0
	strb r0, [r4, #0xd0]
_02233CFC:
	ldrb r0, [r4, #0xf6]
	cmp r0, #0
	beq _02233D18
	add r0, r4, #0xc8
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
_02233D18:
	mov r0, #2
	mov r1, #0
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, r0
	bl ov13_0222B934
	ldr r0, _02233DB8 ; =ov13_02237DD0
	bl ov13_0222B8E8
	b _02233D94
_02233D3C:
	mov r0, r1
	bl ov13_0222B8F8
	ldr r0, _02233DBC ; =ov13_022352D0
	bl ov13_0222B8E8
	b _02233D94
_02233D50:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _02233D74
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02233DC0 ; =ov13_022368D8
	bl ov13_0222B8E8
	b _02233D94
_02233D74:
	bl ov13_02239FF0
	ldrb r0, [r0, #0xf4]
	bl ov13_0223A414
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02233DC4 ; =ov13_02237618
	bl ov13_0222B8E8
_02233D94:
	ldr r0, _02233DC8 ; =ov13_0224F554
	bl ov13_022412B0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02233DA0: .word ov13_0224F54C
_02233DA4: .word ov13_022464CC
_02233DA8: .word GX_LoadOBJPltt
_02233DAC: .word 0x04000010
_02233DB0: .word ov13_02230FD8
_02233DB4: .word ov13_02231B18
_02233DB8: .word ov13_02237DD0
_02233DBC: .word ov13_022352D0
_02233DC0: .word ov13_022368D8
_02233DC4: .word ov13_02237618
_02233DC8: .word ov13_0224F554
	arm_func_end ov13_02233AD8

	arm_func_start ov13_02233DCC
ov13_02233DCC: ; 0x02233DCC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02233E84 ; =ov13_0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FX_DivS32
	ldr r1, _02233E84 ; =ov13_0224F54C
	mov r4, r0
	ldr r0, [r1, #8]
	mov r1, #0
	ldr r0, [r0, #0x14]
	bl ov13_02240D80
	mov r5, r4
	mov r6, #0
_02233E00:
	mov r0, r5
	mov r1, r6
	bl ov13_02233E8C
	add r6, r6, #1
	cmp r6, #5
	add r5, r5, #1
	blt _02233E00
	ldr r0, _02233E84 ; =ov13_0224F54C
	ldr r1, _02233E88 ; =ov13_02245536
	mov r2, r4, lsl #1
	ldr r3, [r0, #8]
	ldrh r0, [r1, r2]
	ldr r2, [r3, #8]
	mov r1, #0
	add r0, r2, r0, lsl #1
	mov r2, #0x1e
	mov r3, #0x13
	bl ov13_022392CC
	mov r5, #0
_02233E4C:
	mov r0, r4
	mov r1, r5
	bl ov13_02234028
	add r5, r5, #1
	cmp r5, #5
	add r4, r4, #1
	blt _02233E4C
	bl ov13_022392B4
	ldr r0, _02233E84 ; =ov13_0224F54C
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x14]
	bl ov13_02240E2C
	bl ov13_022344F0
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02233E84: .word ov13_0224F54C
_02233E88: .word ov13_02245536
	arm_func_end ov13_02233DCC

	arm_func_start ov13_02233E8C
ov13_02233E8C: ; 0x02233E8C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	mov r6, r0
	mov r5, r1
	bl ov13_02239FF0
	cmp r6, #8
	addls pc, pc, r6, lsl #2
	b _02234020
_02233EAC: ; jump table
	b _02233ED0 ; case 0
	b _02233EE4 ; case 1
	b _02234020 ; case 2
	b _02233F74 ; case 3
	b _02233F98 ; case 4
	b _02233FBC ; case 5
	b _02234020 ; case 6
	b _02233FE0 ; case 7
	b _02234004 ; case 8
_02233ED0:
	mov r1, r5
	add r0, r0, #0x40
	bl ov13_02234314
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
_02233EE4:
	ldrb r1, [r0, #0xe6]
	mov r1, r1, lsl #0x1e
	mov r1, r1, lsr #0x1e
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02233F28
_02233EFC: ; jump table
	b _02233F0C ; case 0
	b _02233F14 ; case 1
	b _02233F1C ; case 2
	b _02233F24 ; case 3
_02233F0C:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
_02233F14:
	mov r4, #0xa
	b _02233F28
_02233F1C:
	mov r4, #0x1a
	b _02233F28
_02233F24:
	mov r4, #0x20
_02233F28:
	ldrb r0, [r0, #0xe6]
	mov r1, #0
	mov r2, #0x21
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1a
	cmp r0, #1
	addeq r0, r4, r4, lsr #31
	moveq r4, r0, asr #1
	add r0, sp, #0
	bl MI_CpuFill8
	add r0, sp, #0
	mov r2, r4
	mov r1, #0x2a
	bl memset
	add r0, sp, #0
	mov r1, r5
	bl ov13_02234314
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
_02233F74:
	ldrb r1, [r0, #0xf5]
	cmp r1, #0
	addne sp, sp, #0x24
	ldmneia sp!, {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xc0
	bl ov13_02234468
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
_02233F98:
	ldrb r1, [r0, #0xf5]
	cmp r1, #0
	addne sp, sp, #0x24
	ldmneia sp!, {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xf0
	bl ov13_02234468
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
_02233FBC:
	ldrb r1, [r0, #0xf5]
	cmp r1, #0
	addne sp, sp, #0x24
	ldmneia sp!, {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xc4
	bl ov13_02234468
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
_02233FE0:
	ldrb r1, [r0, #0xf6]
	cmp r1, #0
	addne sp, sp, #0x24
	ldmneia sp!, {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xc8
	bl ov13_02234468
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
_02234004:
	ldrb r1, [r0, #0xf6]
	cmp r1, #0
	addne sp, sp, #0x24
	ldmneia sp!, {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xcc
	bl ov13_02234468
_02234020:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov13_02233E8C

	arm_func_start ov13_02234028
ov13_02234028: ; 0x02234028
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	bl ov13_02239FF0
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _0223415C
_02234044: ; jump table
	b _02234068 ; case 0
	b _02234068 ; case 1
	b _02234084 ; case 2
	b _022340D0 ; case 3
	b _022340D0 ; case 4
	b _022340D0 ; case 5
	b _022340E8 ; case 6
	b _02234144 ; case 7
	b _02234144 ; case 8
_02234068:
	mov r4, #0
	mov r0, r4
	mov r5, r4
	bl ov13_0223417C
	cmp r0, #0
	moveq r5, #2
	b _02234164
_02234084:
	ldr r2, _02234178 ; =ov13_0224F54C
	ldrb r0, [r0, #0xf5]
	ldr r3, [r2, #8]
	mov r1, #0
	ldrb r2, [r3, #4]
	cmp r0, #0
	movne r4, #1
	movne r0, #4
	moveq r4, #2
	moveq r0, #3
	cmp r2, #0
	mov r5, r1
	ldrb r2, [r3, #5]
	movne r5, #1
	cmp r2, #0
	movne r1, #1
	mov r2, r6
	bl ov13_02234210
	b _02234164
_022340D0:
	ldrb r0, [r0, #0xf5]
	mov r4, #0
	cmp r0, #0
	movne r5, #2
	moveq r5, r4
	b _02234164
_022340E8:
	ldrb r2, [r0, #0xf6]
	mov r1, #0
	mov r5, r1
	cmp r2, #0
	movne r4, #1
	movne r0, #4
	bne _02234118
	ldrb r0, [r0, #0xf5]
	mov r4, #2
	cmp r0, #0
	moveq r5, #2
	mov r0, #3
_02234118:
	ldr r2, _02234178 ; =ov13_0224F54C
	ldr r3, [r2, #8]
	ldrb r2, [r3, #6]
	cmp r2, #0
	ldrb r2, [r3, #7]
	movne r5, #1
	cmp r2, #0
	movne r1, #1
	mov r2, r6
	bl ov13_02234210
	b _02234164
_02234144:
	ldrb r0, [r0, #0xf6]
	mov r4, #0
	cmp r0, #0
	movne r5, #2
	moveq r5, r4
	b _02234164
_0223415C:
	mov r4, #0
	mov r5, #2
_02234164:
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl ov13_02234210
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02234178: .word ov13_0224F54C
	arm_func_end ov13_02234028

	arm_func_start ov13_0223417C
ov13_0223417C: ; 0x0223417C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov13_02239FF0
	cmp r4, #0xa
	mov r1, #1
	addls pc, pc, r4, lsl #2
	b _02234208
_02234198: ; jump table
	b _022341D4 ; case 0
	b _022341D4 ; case 1
	b _02234208 ; case 2
	b _02234208 ; case 3
	b _022341EC ; case 4
	b _022341EC ; case 5
	b _022341EC ; case 6
	b _022341C4 ; case 7
	b _02234208 ; case 8
	b _022341FC ; case 9
	b _022341FC ; case 10
_022341C4:
	ldrb r0, [r0, #0xf5]
	cmp r0, #0
	moveq r1, #0
	b _02234208
_022341D4:
	ldrb r0, [r0, #0xe7]
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #1
	movls r1, #0
	b _02234208
_022341EC:
	ldrb r0, [r0, #0xf5]
	cmp r0, #0
	movne r1, #0
	b _02234208
_022341FC:
	ldrb r0, [r0, #0xf6]
	cmp r0, #0
	movne r1, #0
_02234208:
	mov r0, r1
	ldmia sp!, {r4, pc}
	arm_func_end ov13_0223417C

	arm_func_start ov13_02234210
ov13_02234210: ; 0x02234210
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	ldr r3, _02234308 ; =ov13_0224F54C
	mov ip, #0xc0
	ldr r3, [r3, #8]
	mov r6, r0
	mov r4, #0x8f
	add r3, r3, #0x18
	sub r0, r6, #1
	mov lr, #0xcc
	mov r5, r1
	strh lr, [sp]
	strh ip, [sp, #2]
	strh ip, [sp, #4]
	strh r4, [sp, #6]
	strh r4, [sp, #8]
	cmp r0, #1
	add r4, r3, r2, lsl #2
	bhi _02234284
	mov r0, r2
	bl ov13_022349B8
	cmp r0, #2
	ldrne r0, _02234308 ; =ov13_0224F54C
	ldrne r0, [r0, #8]
	addne r4, r0, #0x30
	bne _02234284
	ldr r0, _02234308 ; =ov13_0224F54C
	ldr r0, [r0, #8]
	add r4, r0, #0x2c
_02234284:
	ldr r0, _0223430C ; =ov13_02245526
	add r1, r6, r6, lsl #1
	add r0, r0, r1
	ldrb r1, [r5, r0]
	ldr r2, [r4]
	cmp r1, #0
	beq _022342EC
	mov r0, #0
	bl ov13_022400F0
	add r0, sp, #0
	mov r1, r6, lsl #1
	ldrh r2, [r0, r1]
	ldr r3, [r4]
	ldr r0, _02234310 ; =0xFE00FF00
	ldr r1, [r3]
	mov r2, r2, lsl #0x17
	and r0, r1, r0
	orr r0, r0, r2, lsr #7
	str r0, [r3]
	ldr r1, [r4]
	add sp, sp, #0xc
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	ldmia sp!, {r3, r4, r5, r6, pc}
_022342EC:
	ldr r0, _02234310 ; =0xFE00FF00
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x1000000
	str r0, [r2]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_02234308: .word ov13_0224F54C
_0223430C: .word ov13_02245526
_02234310: .word 0xFE00FF00
	arm_func_end ov13_02234210

	arm_func_start ov13_02234314
ov13_02234314: ; 0x02234314
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r6, r0
	mov r5, r1
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x22
	bl MI_CpuFill8
	mov r0, r6
	mov r1, #0x20
	bl ov13_02242074
	mov r4, r0
	cmp r4, #0x10
	movle lr, r4
	movgt lr, #0x10
	cmp lr, #0
	mov ip, #0
	ble _02234384
	ldr r2, _02234460 ; =0x0000E01D
	add r1, sp, #0xc
_02234364:
	ldrb r3, [r6, ip]
	mov r0, ip, lsl #1
	add ip, ip, #1
	cmp r3, #0x20
	streqh r2, [r1, r0]
	strneh r3, [r1, r0]
	cmp ip, lr
	blt _02234364
_02234384:
	mov r0, #0x1d
	mul r0, r5, r0
	mov r1, #8
	add r5, r0, #2
	str r1, [sp]
	add r0, sp, #0xc
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, _02234464 ; =ov13_0224F54C
	cmp r4, #0x10
	ldr r0, [r0, #8]
	addle r5, r5, #5
	ldr r0, [r0, #0x14]
	mov r2, r5
	mov r1, #0x48
	mov r3, #2
	bl ov13_02240C14
	cmp r4, #0x10
	addle sp, sp, #0x30
	ldmleia sp!, {r4, r5, r6, pc}
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x22
	bl MI_CpuFill8
	sub r4, r4, #0x10
	cmp r4, #0
	mov ip, #0
	ble _02234424
	ldr r2, _02234460 ; =0x0000E01D
	add r1, sp, #0xc
_02234400:
	add r0, r6, ip
	ldrb r3, [r0, #0x10]
	mov r0, ip, lsl #1
	add ip, ip, #1
	cmp r3, #0x20
	streqh r2, [r1, r0]
	strneh r3, [r1, r0]
	cmp ip, r4
	blt _02234400
_02234424:
	mov r1, #8
	str r1, [sp]
	add r0, sp, #0xc
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, _02234464 ; =ov13_0224F54C
	add r2, r5, #0xc
	ldr r0, [r0, #8]
	mov r1, #0x48
	ldr r0, [r0, #0x14]
	mov r3, #2
	bl ov13_02240C14
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02234460: .word 0x0000E01D
_02234464: .word ov13_0224F54C
	arm_func_end ov13_02234314

	arm_func_start ov13_02234468
ov13_02234468: ; 0x02234468
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x2c
	mov ip, r0
	ldrb r2, [ip, #1]
	mov r4, r1
	add r0, sp, #0xc
	str r2, [sp]
	ldrb r3, [ip, #2]
	ldr r2, _022344E8 ; =ov13_022464E4
	mov r1, #0x10
	str r3, [sp, #4]
	ldrb r3, [ip, #3]
	str r3, [sp, #8]
	ldrb r3, [ip]
	bl swprintf
	mov r2, #7
	mov r0, #0x1d
	mul r1, r4, r0
	str r2, [sp]
	add r0, sp, #0xc
	str r0, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	ldr r0, _022344EC ; =ov13_0224F54C
	add r2, r1, #8
	ldr r0, [r0, #8]
	mov r1, #0x5f
	ldr r0, [r0, #0x14]
	mov r3, #2
	bl ov13_02240C14
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_022344E8: .word ov13_022464E4
_022344EC: .word ov13_0224F54C
	arm_func_end ov13_02234468

	arm_func_start ov13_022344F0
ov13_022344F0: ; 0x022344F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r0, _022346F4 ; =ov13_0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FX_DivS32
	ldr r1, _022346F4 ; =ov13_0224F54C
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FX_ModS32
	ldr r1, _022346F4 ; =ov13_0224F54C
	rsb ip, r0, #0x34
	ldr r1, [r1, #8]
	ldr r0, [r1, #0x34]
	cmp r0, #0
	beq _02234570
	ldr r5, [r1, #0x34]
	cmp r4, #0
	moveq r0, #0x26
	streq r0, [sp, #4]
	movne r0, #0x100
	strne r0, [sp, #4]
	ldr r2, [r5]
	ldr r0, _022346F8 ; =0xFE00FF00
	ldr r3, [sp, #4]
	and r0, r2, r0
	and r1, ip, #0xff
	mov r2, r3, lsl #0x17
	orr r0, r0, r1
	orr r0, r0, r2, lsr #7
	str r0, [r5]
_02234570:
	ldr r8, _022346F4 ; =ov13_0224F54C
	ldr r6, _022346FC ; =0x01FF0000
	ldr r7, _022346F8 ; =0xFE00FF00
	mov lr, ip
	mov r5, #0
_02234584:
	ldr r0, [r8, #8]
	and sb, lr, #0xff
	add r0, r0, r5, lsl #2
	ldr r3, [r0, #0x18]
	add r5, r5, #1
	ldr r1, [r3]
	cmp r5, #5
	mov r0, r1
	and r2, r1, r6
	and sl, r0, r7
	mov r2, r2, lsr #0x10
	mov r0, r2, lsl #0x17
	orr sb, sl, sb
	orr r0, sb, r0, lsr #7
	str r0, [r3]
	and r0, r1, #0xff
	add lr, lr, #0x1d
	blt _02234584
	str r0, [sp]
	str r2, [sp, #4]
	cmp r4, #2
	bgt _02234634
	ldr r0, _022346F4 ; =ov13_0224F54C
	rsb r2, r4, #2
	ldr r0, [r0, #8]
	mov r1, #0x1d
	ldr r0, [r0, #0x2c]
	mla r3, r2, r1, ip
	ldr r2, [r0]
	ldr r1, _022346FC ; =0x01FF0000
	and r6, r2, #0xff
	and r1, r2, r1
	mov r7, r1, lsr #0x10
	mov r5, r2
	ldr r1, _022346F8 ; =0xFE00FF00
	and r2, r3, #0xff
	and r1, r5, r1
	mov r3, r7, lsl #0x17
	orr r1, r1, r2
	orr r1, r1, r3, lsr #7
	str r7, [sp, #4]
	str r6, [sp]
	str r1, [r0]
	b _02234654
_02234634:
	ldr r1, _022346F4 ; =ov13_0224F54C
	ldr r0, _022346F8 ; =0xFE00FF00
	ldr r1, [r1, #8]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x1000000
	str r0, [r2]
_02234654:
	cmp r4, #2
	blt _022346BC
	cmp r4, #6
	bgt _022346BC
	ldr r0, _022346F4 ; =ov13_0224F54C
	rsb r2, r4, #6
	ldr r0, [r0, #8]
	mov r1, #0x1d
	ldr r0, [r0, #0x30]
	mla r3, r2, r1, ip
	ldr r2, [r0]
	ldr r1, _022346FC ; =0x01FF0000
	and r5, r2, #0xff
	and r1, r2, r1
	mov r6, r1, lsr #0x10
	mov r4, r2
	ldr r1, _022346F8 ; =0xFE00FF00
	and r2, r3, #0xff
	and r1, r4, r1
	mov r3, r6, lsl #0x17
	orr r1, r1, r2
	orr r1, r1, r3, lsr #7
	str r6, [sp, #4]
	str r5, [sp]
	str r1, [r0]
	b _022346DC
_022346BC:
	ldr r1, _022346F4 ; =ov13_0224F54C
	ldr r0, _022346F8 ; =0xFE00FF00
	ldr r1, [r1, #8]
	ldr r2, [r1, #0x30]
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x1000000
	str r0, [r2]
_022346DC:
	ldr r0, _022346F4 ; =ov13_0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x44]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_022346F4: .word ov13_0224F54C
_022346F8: .word 0xFE00FF00
_022346FC: .word 0x01FF0000
	arm_func_end ov13_022344F0

	arm_func_start ov13_02234700
ov13_02234700: ; 0x02234700
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r0, _02234960 ; =ov13_02245958
	bl ov13_022417DC
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0xe
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _02234964 ; =ov13_0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FX_DivS32
	ldr r1, _02234968 ; =ov13_022454FC
	mov r5, r0
	ldrh r3, [r1, #4]
	ldrh r2, [r1, #6]
	add r4, sp, #0
	strh r3, [sp]
	strh r2, [sp, #2]
	ldrh r2, [r1, #8]
	ldrh r0, [r1, #0xa]
	mov r6, #0
	strh r2, [sp, #4]
	strh r0, [sp, #6]
_02234760:
	cmp r5, #2
	cmpne r5, #6
	beq _02234788
	mov r0, r4
	bl ov13_02241974
	cmp r0, #0
	ldrne r0, _0223496C ; =ov13_022455DC
	addne sp, sp, #8
	ldrneb r0, [r0, r5]
	ldmneia sp!, {r4, r5, r6, pc}
_02234788:
	ldrh r0, [sp, #2]
	add r6, r6, #1
	cmp r6, #4
	add r0, r0, #0x1d
	strh r0, [sp, #2]
	add r5, r5, #1
	blt _02234760
	ldr r0, _02234964 ; =ov13_0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FX_DivS32
	mov r3, #0
_022347B8:
	cmp r0, #2
	bne _02234854
	ldr r1, _02234968 ; =ov13_022454FC
	mov r0, #0x1d
	ldrh r5, [r1, #0x16]
	ldrh r2, [r1, #0x14]
	mul r4, r3, r0
	strh r2, [sp]
	strh r5, [sp, #2]
	ldrh r3, [r1, #0x18]
	ldrh r2, [r1, #0x1a]
	add r1, r5, r4
	add r0, sp, #0
	strh r3, [sp, #4]
	strh r2, [sp, #6]
	strh r1, [sp, #2]
	bl ov13_02241974
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #2
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r1, _02234968 ; =ov13_022454FC
	add r0, sp, #0
	ldrh r5, [r1, #0xe]
	ldrh r2, [r1, #0xc]
	strh r5, [sp, #2]
	strh r2, [sp]
	ldrh r3, [r1, #0x10]
	ldrh r2, [r1, #0x12]
	add r1, r5, r4
	strh r3, [sp, #4]
	strh r2, [sp, #6]
	strh r1, [sp, #2]
	bl ov13_02241974
	cmp r0, #0
	beq _02234864
	add sp, sp, #8
	mov r0, #3
	ldmia sp!, {r4, r5, r6, pc}
_02234854:
	add r3, r3, #1
	cmp r3, #4
	add r0, r0, #1
	blt _022347B8
_02234864:
	ldr r0, _02234964 ; =ov13_0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FX_DivS32
	mov r3, #0
_02234878:
	cmp r0, #6
	bne _02234914
	ldr r1, _02234968 ; =ov13_022454FC
	mov r0, #0x1d
	ldrh r5, [r1, #0x16]
	ldrh r2, [r1, #0x14]
	mul r4, r3, r0
	strh r2, [sp]
	strh r5, [sp, #2]
	ldrh r3, [r1, #0x18]
	ldrh r2, [r1, #0x1a]
	add r1, r5, r4
	add r0, sp, #0
	strh r3, [sp, #4]
	strh r2, [sp, #6]
	strh r1, [sp, #2]
	bl ov13_02241974
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #7
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r1, _02234968 ; =ov13_022454FC
	add r0, sp, #0
	ldrh r5, [r1, #0xe]
	ldrh r2, [r1, #0xc]
	strh r5, [sp, #2]
	strh r2, [sp]
	ldrh r3, [r1, #0x10]
	ldrh r2, [r1, #0x12]
	add r1, r5, r4
	strh r3, [sp, #4]
	strh r2, [sp, #6]
	strh r1, [sp, #2]
	bl ov13_02241974
	cmp r0, #0
	beq _02234924
	add sp, sp, #8
	mov r0, #8
	ldmia sp!, {r4, r5, r6, pc}
_02234914:
	add r3, r3, #1
	cmp r3, #4
	add r0, r0, #1
	blt _02234878
_02234924:
	ldr r4, _02234970 ; =ov13_0224558A
	mov r5, #0
_0223492C:
	mov r0, r4
	bl ov13_022417DC
	cmp r0, #0
	addne sp, sp, #8
	addne r0, r5, #0xb
	ldmneia sp!, {r4, r5, r6, pc}
	add r5, r5, #1
	cmp r5, #3
	add r4, r4, #8
	blt _0223492C
	mov r0, #0xe
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02234960: .word ov13_02245958
_02234964: .word ov13_0224F54C
_02234968: .word ov13_022454FC
_0223496C: .word ov13_022455DC
_02234970: .word ov13_0224558A
	arm_func_end ov13_02234700

	arm_func_start ov13_02234974
ov13_02234974: ; 0x02234974
	stmdb sp!, {r4, lr}
	ldr r1, _022349B4 ; =ov13_0224F54C
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FX_DivS32
	mov r1, #0
_02234990:
	cmp r0, r4
	moveq r0, r1
	ldmeqia sp!, {r4, pc}
	add r1, r1, #1
	cmp r1, #4
	add r0, r0, #1
	blt _02234990
	mvn r0, #0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022349B4: .word ov13_0224F54C
	arm_func_end ov13_02234974

	arm_func_start ov13_022349B8
ov13_022349B8: ; 0x022349B8
	stmdb sp!, {r4, lr}
	ldr r1, _022349D8 ; =ov13_0224F54C
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FX_DivS32
	add r0, r0, r4
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022349D8: .word ov13_0224F54C
	arm_func_end ov13_022349B8

	arm_func_start ov13_022349DC
ov13_022349DC: ; 0x022349DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl ov13_0223959C
	bl ov13_02227D18
	ldr r0, _02234A9C ; =ov13_0224F54C
	ldrh r1, [r0, #4]
	cmp r1, #6
	subhi r1, r1, #6
	movls r1, #0
	strh r1, [r0, #4]
	ldr r0, _02234A9C ; =ov13_0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FX_ModS32
	mov r5, r0
	cmp r5, #0x17
	bne _02234A28
	bl ov13_02233DCC
	ldmia sp!, {r3, r4, r5, pc}
_02234A28:
	ble _02234A44
	ldr r0, _02234A9C ; =ov13_0224F54C
	rsb r1, r5, #0x1d
	ldrh r2, [r0, #4]
	mov r5, #0
	add r1, r2, r1
	strh r1, [r0, #4]
_02234A44:
	bl ov13_022344F0
	cmp r5, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, _02234A9C ; =ov13_0224F54C
	mov r0, #0x37
	ldrh r1, [r1, #4]
	ldr r2, _02234AA0 ; =0xE1FC780F
	mul r3, r1, r0
	smull r1, r0, r2, r3
	add r0, r3, r0
	mov r1, r3, lsr #0x1f
	add r0, r1, r0, asr #7
	bl ov13_02239578
	bl ov13_02239584
	bl ov13_02234CA4
	ldr r0, _02234A9C ; =ov13_0224F54C
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0
	str r0, [r2, #0x38]
	bl ov13_022425D0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02234A9C: .word ov13_0224F54C
_02234AA0: .word 0xE1FC780F
	arm_func_end ov13_022349DC

	arm_func_start ov13_02234AA4
ov13_02234AA4: ; 0x02234AA4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov13_0223959C
	bl ov13_02227D18
	ldr r0, _02234B40 ; =ov13_0224F54C
	mov r1, #0x1d
	ldrh r2, [r0, #4]
	add r2, r2, #6
	strh r2, [r0, #4]
	ldrh r0, [r0, #4]
	bl FX_ModS32
	cmp r0, #6
	blt _02234AE0
	bl ov13_022344F0
	ldmia sp!, {r4, pc}
_02234AE0:
	ldr r1, _02234B40 ; =ov13_0224F54C
	ldrh r2, [r1, #4]
	sub r0, r2, r0
	strh r0, [r1, #4]
	bl ov13_02233DCC
	ldr r1, _02234B40 ; =ov13_0224F54C
	mov r0, #0x37
	ldrh r1, [r1, #4]
	ldr r2, _02234B44 ; =0xE1FC780F
	mul r3, r1, r0
	smull r1, r0, r2, r3
	add r0, r3, r0
	mov r1, r3, lsr #0x1f
	add r0, r1, r0, asr #7
	bl ov13_02239578
	bl ov13_02239584
	bl ov13_02234CA4
	ldr r0, _02234B40 ; =ov13_0224F54C
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0
	str r0, [r2, #0x38]
	bl ov13_022425D0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02234B40: .word ov13_0224F54C
_02234B44: .word 0xE1FC780F
	arm_func_end ov13_02234AA4

	arm_func_start ov13_02234B48
ov13_02234B48: ; 0x02234B48
	stmdb sp!, {r4, lr}
	ldr r0, _02234BBC ; =ov13_0224F54C
	ldr r1, [r0, #8]
	ldrb r1, [r1, #0x44]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	ldrh r0, [r0, #4]
	mov r1, #0x1d
	bl FX_DivS32
	ldr r1, _02234BBC ; =ov13_0224F54C
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FX_ModS32
	ldr r2, _02234BC0 ; =ov13_022455E8
	ldr r1, _02234BC4 ; =0x01FF0000
	sub ip, r0, #0x33
	ldrb r0, [r2, r4]
	ldr r2, _02234BC8 ; =0x04000010
	and r3, r1, ip, lsl #16
	add r0, ip, r0
	str r3, [r2]
	and r1, r1, r0, lsl #16
	ldr r0, _02234BBC ; =ov13_0224F54C
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	mov r1, #0
	strb r1, [r0, #0x44]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02234BBC: .word ov13_0224F54C
_02234BC0: .word ov13_022455E8
_02234BC4: .word 0x01FF0000
_02234BC8: .word 0x04000010
	arm_func_end ov13_02234B48

	arm_func_start ov13_02234BCC
ov13_02234BCC: ; 0x02234BCC
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	ldr ip, _02234C90 ; =ov13_02245518
	add r3, sp, #8
	mov r2, #7
_02234BE0:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _02234BE0
	ldr r0, _02234C94 ; =ov13_0224F54C
	add r1, sp, #8
	ldrb r2, [r0]
	ldrb r2, [r1, r2]
	cmp r2, #3
	blt _02234C44
	mov r3, r2, lsl #3
	ldr r1, _02234C98 ; =ov13_022455A2
	ldr r2, _02234C9C ; =ov13_022455A6
	ldr r0, _02234CA0 ; =ov13_022455A4
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	ldrh r3, [r0, r3]
	mov r0, #3
	bl ov13_02227B6C
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
_02234C44:
	ldr r1, _02234C98 ; =ov13_022455A2
	mov lr, r2, lsl #3
	add ip, r1, r2, lsl #3
	ldrb r2, [r0, #2]
	ldrh r3, [ip, #2]
	mov r0, #0x1d
	ldrh r1, [r1, lr]
	mla r0, r2, r0, r3
	strh r0, [sp, #2]
	ldrh r2, [ip, #4]
	ldrh ip, [ip, #6]
	ldrh r3, [sp, #2]
	mov r0, #1
	strh r1, [sp]
	strh r2, [sp, #4]
	strh ip, [sp, #6]
	bl ov13_02227B6C
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02234C90: .word ov13_02245518
_02234C94: .word ov13_0224F54C
_02234C98: .word ov13_022455A2
_02234C9C: .word ov13_022455A6
_02234CA0: .word ov13_022455A4
	arm_func_end ov13_02234BCC

	arm_func_start ov13_02234CA4
ov13_02234CA4: ; 0x02234CA4
	stmdb sp!, {r4, lr}
	ldr r0, _02234D4C ; =ov13_0224F54C
	ldrb r0, [r0]
	add r0, r0, #0xf5
	and r0, r0, #0xff
	cmp r0, #2
	bhi _02234CC8
	bl ov13_02234BCC
	ldmia sp!, {r4, pc}
_02234CC8:
	bl ov13_02239FF0
	ldr r1, _02234D4C ; =ov13_0224F54C
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FX_DivS32
	ldr r1, _02234D4C ; =ov13_0224F54C
	ldrb r2, [r1, #2]
	add r2, r2, r0
	cmp r2, #2
	beq _02234D00
	cmp r2, #6
	beq _02234D1C
	b _02234D38
_02234D00:
	ldrb r0, [r4, #0xf5]
	cmp r0, #0
	movne r0, #2
	strneb r0, [r1]
	moveq r0, #3
	streqb r0, [r1]
	b _02234D44
_02234D1C:
	ldrb r0, [r4, #0xf6]
	cmp r0, #0
	movne r0, #7
	strneb r0, [r1]
	moveq r0, #8
	streqb r0, [r1]
	b _02234D44
_02234D38:
	ldr r0, _02234D50 ; =ov13_022455DC
	ldrb r0, [r0, r2]
	strb r0, [r1]
_02234D44:
	bl ov13_02234BCC
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02234D4C: .word ov13_0224F54C
_02234D50: .word ov13_022455DC
	arm_func_end ov13_02234CA4

	arm_func_start ov13_02234D54
ov13_02234D54: ; 0x02234D54
	stmdb sp!, {r3, lr}
	ldr r1, _02234D7C ; =ov13_0224F54C
	ldr r2, _02234D80 ; =ov13_022455F4
	strb r0, [r1]
	ldrb r0, [r2, r0]
	bl ov13_02234974
	ldr r1, _02234D7C ; =ov13_0224F54C
	strb r0, [r1, #2]
	bl ov13_02234BCC
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02234D7C: .word ov13_0224F54C
_02234D80: .word ov13_022455F4
	arm_func_end ov13_02234D54

	arm_func_start ov13_02234D84
ov13_02234D84: ; 0x02234D84
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl ov13_02239FF0
	ldr r1, _02235068 ; =ov13_0224F54C
	mov r4, #0
	ldrb r2, [r1]
	cmp r2, #8
	ldreqb r0, [r0, #0xf5]
	cmpeq r0, #0
	bne _02234DB8
	cmp r5, #0
	cmpne r5, #2
	ldmeqia sp!, {r3, r4, r5, pc}
_02234DB8:
	cmp r2, #0
	bgt _02234DC8
	beq _02234DE8
	b _02234F4C
_02234DC8:
	sub r0, r2, #0xa
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02234F4C
_02234DD8: ; jump table
	b _02234E20 ; case 0
	b _02234E5C ; case 1
	b _02234EC4 ; case 2
	b _02234EC4 ; case 3
_02234DE8:
	cmp r5, #1
	bne _02234E00
	ldr r0, _02235068 ; =ov13_0224F54C
	mov r1, #0xb
	strb r1, [r0]
	b _02235048
_02234E00:
	cmp r5, #3
	movne r4, #2
	bne _02235048
	ldr r0, _02235068 ; =ov13_0224F54C
	ldrb r1, [r0, #2]
	add r1, r1, #1
	strb r1, [r0, #2]
	b _02235048
_02234E20:
	cmp r5, #1
	bne _02234E3C
	ldr r0, _02235068 ; =ov13_0224F54C
	ldrb r1, [r0, #2]
	sub r1, r1, #1
	strb r1, [r0, #2]
	b _02235048
_02234E3C:
	cmp r5, #3
	movne r4, #2
	bne _02235048
	ldr r0, _02235068 ; =ov13_0224F54C
	ldr r1, [r0, #8]
	ldrb r1, [r1, #0x42]
	strb r1, [r0]
	b _02235048
_02234E5C:
	cmp r5, #1
	bne _02234E94
	ldr r0, _02235068 ; =ov13_0224F54C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x47]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02235068 ; =ov13_0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	ldmia sp!, {r3, r4, r5, pc}
_02234E94:
	cmp r5, #3
	movne r4, #2
	bne _02235048
	ldr r0, _02235068 ; =ov13_0224F54C
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #2]
	strh r1, [r0, #4]
	bl ov13_02233DCC
	mov r0, #0
	bl ov13_02239578
	b _02235048
_02234EC4:
	ldr r0, _02235068 ; =ov13_0224F54C
	cmp r5, #1
	ldr r1, [r0, #8]
	strb r2, [r1, #0x42]
	bne _02234F00
	mov r1, #0xa
	strb r1, [r0]
	mov r1, #3
	strb r1, [r0, #2]
	mov r1, #0x91
	strh r1, [r0, #4]
	bl ov13_02233DCC
	mov r0, #0x37
	bl ov13_02239578
	b _02235048
_02234F00:
	cmp r5, #3
	bne _02234F34
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x47]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02235068 ; =ov13_0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	ldmia sp!, {r3, r4, r5, pc}
_02234F34:
	cmp r2, #0xc
	moveq r1, #0xd
	streqb r1, [r0]
	movne r1, #0xc
	strneb r1, [r0]
	b _02235048
_02234F4C:
	cmp r5, #1
	bne _02234F98
	ldr r0, _02235068 ; =ov13_0224F54C
	ldrb r1, [r0, #2]
	cmp r1, #0
	subne r1, r1, #1
	strneb r1, [r0, #2]
	bne _02235048
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _0223506C ; =ov13_022349DC
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02235068 ; =ov13_0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, r4, r5, pc}
_02234F98:
	cmp r5, #3
	bne _02234FE4
	ldr r0, _02235068 ; =ov13_0224F54C
	ldrb r1, [r0, #2]
	cmp r1, #3
	addlo r1, r1, #1
	strlob r1, [r0, #2]
	blo _02235048
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02235070 ; =ov13_02234AA4
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02235068 ; =ov13_0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	ldmia sp!, {r3, r4, r5, pc}
_02234FE4:
	cmp r2, #2
	mov r4, #2
	bne _02235000
	ldr r0, _02235068 ; =ov13_0224F54C
	mov r1, #3
	strb r1, [r0]
	b _0223503C
_02235000:
	cmp r2, #3
	ldreq r0, _02235068 ; =ov13_0224F54C
	streqb r4, [r0]
	beq _0223503C
	cmp r2, #7
	bne _02235028
	ldr r0, _02235068 ; =ov13_0224F54C
	mov r1, #8
	strb r1, [r0]
	b _0223503C
_02235028:
	cmp r2, #8
	bne _02235048
	ldr r0, _02235068 ; =ov13_0224F54C
	mov r1, #7
	strb r1, [r0]
_0223503C:
	mov r0, #8
	bl ov13_0223ABB8
	bl ov13_02234BCC
_02235048:
	cmp r4, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #8
	bl ov13_0223ABB8
	cmp r4, #0
	ldmneia sp!, {r3, r4, r5, pc}
	bl ov13_02234CA4
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02235068: .word ov13_0224F54C
_0223506C: .word ov13_022349DC
_02235070: .word ov13_02234AA4
	arm_func_end ov13_02234D84

	arm_func_start ov13_02235074
ov13_02235074: ; 0x02235074
	ldr r0, _0223509C ; =ov13_0224F54C
	ldr r1, _022350A0 ; =ov13_022454F8
	ldrb r2, [r0]
	ldr r0, [r0, #8]
	ldr ip, _022350A4 ; =ov13_02239378
	sub r2, r2, #0xb
	ldrb r1, [r1, r2]
	ldr r0, [r0, #0x10]
	mov r2, r1
	bx ip
	.balign 4, 0
_0223509C: .word ov13_0224F54C
_022350A0: .word ov13_022454F8
_022350A4: .word ov13_02239378
	arm_func_end ov13_02235074

	arm_func_start ov13_022350A8
ov13_022350A8: ; 0x022350A8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, _022350F8 ; =ov13_0224F54C
	mov r4, #0
_022350B4:
	ldr r0, [r5, #8]
	add r1, r0, r4
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _022350E8
	sub r0, r0, #1
	strb r0, [r1, #4]
	ldr r0, [r5, #8]
	add r0, r0, r4
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022350E8
	bl ov13_02233DCC
_022350E8:
	add r4, r4, #1
	cmp r4, #4
	blt _022350B4
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022350F8: .word ov13_0224F54C
	arm_func_end ov13_022350A8

	arm_func_start ov13_022350FC
ov13_022350FC: ; 0x022350FC
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r1, _022351B8 ; =ov13_022454FC
	ldr r0, _022351BC ; =ov13_0224F54C
	ldrb r3, [r1]
	ldrb r2, [r1, #1]
	ldrb ip, [r0]
	strb r3, [sp]
	strb r2, [sp, #1]
	ldrb r2, [r1, #2]
	ldrb r0, [r1, #3]
	add r1, sp, #0
	mov r3, #0
	strb r2, [sp, #2]
	strb r0, [sp, #3]
_02235138:
	ldrb r0, [r1]
	cmp ip, r0
	bne _0223519C
	ldr r0, _022351BC ; =ov13_0224F54C
	mov r2, #0x14
	ldr r1, [r0, #8]
	tst r3, #1
	add r1, r1, r3
	strb r2, [r1, #4]
	ldr r1, [r0, #8]
	beq _02235180
	sub r0, r3, #1
	add r0, r1, r0
	mov r1, #0
	strb r1, [r0, #4]
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
_02235180:
	add r0, r3, #1
	add r0, r1, r0
	mov r1, #0
	strb r1, [r0, #4]
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
_0223519C:
	add r3, r3, #1
	cmp r3, #4
	add r1, r1, #1
	blt _02235138
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	.balign 4, 0
_022351B8: .word ov13_022454FC
_022351BC: .word ov13_0224F54C
	arm_func_end ov13_022350FC

	arm_func_start ov13_022351C0
ov13_022351C0: ; 0x022351C0
	stmdb sp!, {r4, lr}
	bl ov13_02239FF0
	mov r4, r0
	ldrb r0, [r4, #0x40]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldrb r0, [r4, #0xf6]
	cmp r0, #0
	bne _0223520C
	add r0, r4, #0xc8
	bl DWC_BACKUPlCheckAddress
	cmp r0, #0
	bne _0223520C
	add r0, r4, #0xcc
	bl DWC_BACKUPlCheckAddress
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_0223520C:
	ldrb r0, [r4, #0xf5]
	cmp r0, #0
	bne _02235258
	add r0, r4, #0xc0
	bl DWC_BACKUPlCheckAddress
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0xc4
	bl DWC_BACKUPlCheckAddress
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0xc0
	add r1, r4, #0xf0
	bl DWC_BACKUPlCheckIp
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_02235258:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov13_022351C0

	arm_func_start ov13_02235260
ov13_02235260: ; 0x02235260
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _02235298 ; =ov13_0224F54C
	ldr r0, [r0, #8]
	ldr r0, [r0, #0xc]
	bl ov13_022393E0
	ldr r0, _0223529C ; =ov13_022352A0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235298: .word ov13_0224F54C
_0223529C: .word ov13_022352A0
	arm_func_end ov13_02235260

	arm_func_start ov13_022352A0
ov13_022352A0: ; 0x022352A0
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _022352BC ; =ov13_022332D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022352BC: .word ov13_022332D8
	arm_func_end ov13_022352A0

	arm_func_start ov13_022352C0
ov13_022352C0: ; 0x022352C0
	ldr r1, _022352CC ; =ov13_0224F54C
	strb r0, [r1, #1]
	bx lr
	.balign 4, 0
_022352CC: .word ov13_0224F54C
	arm_func_end ov13_022352C0

	arm_func_start ov13_022352D0
ov13_022352D0: ; 0x022352D0
	stmdb sp!, {r3, lr}
	bl ov13_022352F0
	bl ov13_02227E40
	bl ov13_0223A4F4
	ldr r0, _022352EC ; =ov13_02235384
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022352EC: .word ov13_02235384
	arm_func_end ov13_022352D0

	arm_func_start ov13_022352F0
ov13_022352F0: ; 0x022352F0
	stmdb sp!, {r3, lr}
	ldr r0, _02235364 ; =ov13_02246504
	ldr r1, _02235368 ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _0223536C ; =ov13_0224651C
	ldr r1, _02235370 ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _02235374 ; =ov13_02246534
	ldr r1, _02235378 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r2, _0223537C ; =0x04001008
	ldr r1, _02235380 ; =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235364: .word ov13_02246504
_02235368: .word GX_LoadBG2Char
_0223536C: .word ov13_0224651C
_02235370: .word GX_LoadBGPltt
_02235374: .word ov13_02246534
_02235378: .word GX_LoadBG2Scr
_0223537C: .word 0x04001008
_02235380: .word 0x0400000A
	arm_func_end ov13_022352F0

	arm_func_start ov13_02235384
ov13_02235384: ; 0x02235384
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EA8
	ldr r0, _022353D4 ; =ov13_022353D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022353D4: .word ov13_022353D8
	arm_func_end ov13_02235384

	arm_func_start ov13_022353D8
ov13_022353D8: ; 0x022353D8
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	mov ip, #0
	sub r3, r2, #2
	mov r0, #0x44
	mov r1, #5
	str ip, [sp]
	bl ov13_0223BE6C
	ldr r0, _02235424 ; =ov13_02235428
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235424: .word ov13_02235428
	arm_func_end ov13_022353D8

	arm_func_start ov13_02235428
ov13_02235428: ; 0x02235428
	stmdb sp!, {r3, lr}
	bl ov13_02235450
	bl ov13_02235454
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0223544C ; =ov13_02235458
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223544C: .word ov13_02235458
	arm_func_end ov13_02235428

	arm_func_start ov13_02235450
ov13_02235450: ; 0x02235450
	bx lr
	arm_func_end ov13_02235450

	arm_func_start ov13_02235454
ov13_02235454: ; 0x02235454
	bx lr
	arm_func_end ov13_02235454

	arm_func_start ov13_02235458
ov13_02235458: ; 0x02235458
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02235490 ; =ov13_02235494
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235490: .word ov13_02235494
	arm_func_end ov13_02235458

	arm_func_start ov13_02235494
ov13_02235494: ; 0x02235494
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EFC
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _022354EC ; =ov13_022368D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022354EC: .word ov13_022368D8
	arm_func_end ov13_02235494

	arm_func_start ov13_022354F0
ov13_022354F0: ; 0x022354F0
	ldr r0, _0223550C ; =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.balign 4, 0
_0223550C: .word 0x027FFFA8
	arm_func_end ov13_022354F0

	arm_func_start ov13_02235510
ov13_02235510: ; 0x02235510
	stmdb sp!, {r3, lr}
	ldr r0, _02235544 ; =ov13_0224F558
	mov r1, #0
	strb r1, [r0]
	bl ov13_0223554C
	bl ov13_02227E40
	mov r0, #0x25
	bl ov13_022279EC
	mov r0, #1
	bl ov13_02226F58
	ldr r0, _02235548 ; =ov13_022355CC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235544: .word ov13_0224F558
_02235548: .word ov13_022355CC
	arm_func_end ov13_02235510

	arm_func_start ov13_0223554C
ov13_0223554C: ; 0x0223554C
	stmdb sp!, {r3, lr}
	ldr r0, _022355BC ; =ov13_02246548
	ldr r1, _022355C0 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _022355C4 ; =0x04001008
	ldr r1, _022355C8 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022355BC: .word ov13_02246548
_022355C0: .word GX_LoadBG2Scr
_022355C4: .word 0x04001008
_022355C8: .word 0x0400000A
	arm_func_end ov13_0223554C

	arm_func_start ov13_022355CC
ov13_022355CC: ; 0x022355CC
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _022355FC ; =ov13_02235600
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022355FC: .word ov13_02235600
	arm_func_end ov13_022355CC

	arm_func_start ov13_02235600
ov13_02235600: ; 0x02235600
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	bl ov13_022279B4
	ldr r0, _02235628 ; =ov13_0223562C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235628: .word ov13_0223562C
	arm_func_end ov13_02235600

	arm_func_start ov13_0223562C
ov13_0223562C: ; 0x0223562C
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _02235650 ; =ov13_02235654
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235650: .word ov13_02235654
	arm_func_end ov13_0223562C

	arm_func_start ov13_02235654
ov13_02235654: ; 0x02235654
	stmdb sp!, {r3, lr}
	mov r0, #0xa
	bl OS_Sleep
	bl ov13_02235838
	bl ov13_02235674
	bl ov13_022356AC
	bl ov13_022356B0
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02235654

	arm_func_start ov13_02235674
ov13_02235674: ; 0x02235674
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _02235694
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
_02235694:
	bl ov13_022354F0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02235674

	arm_func_start ov13_022356AC
ov13_022356AC: ; 0x022356AC
	bx lr
	arm_func_end ov13_022356AC

	arm_func_start ov13_022356B0
ov13_022356B0: ; 0x022356B0
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _022356D8 ; =ov13_022356DC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022356D8: .word ov13_022356DC
	arm_func_end ov13_022356B0

	arm_func_start ov13_022356DC
ov13_022356DC: ; 0x022356DC
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _022356F8 ; =ov13_022356FC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022356F8: .word ov13_022356FC
	arm_func_end ov13_022356DC

	arm_func_start ov13_022356FC
ov13_022356FC: ; 0x022356FC
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02235768 ; =ov13_0224F558
	ldrb r0, [r0]
	cmp r0, #0
	bne _02235724
	bl ov13_02227228
_02235724:
	ldr r0, _02235768 ; =ov13_0224F558
	ldrb r0, [r0]
	cmp r0, #0
	bne _02235748
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
_02235748:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0223576C ; =ov13_02235770
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235768: .word ov13_0224F558
_0223576C: .word ov13_02235770
	arm_func_end ov13_022356FC

	arm_func_start ov13_02235770
ov13_02235770: ; 0x02235770
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0223582C ; =ov13_0224F558
	ldrb r0, [r0]
	cmp r0, #0
	bne _022357A4
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
_022357A4:
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0223582C ; =ov13_0224F558
	ldrb r0, [r0]
	cmp r0, #0
	bne _022357DC
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
_022357DC:
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _0223582C ; =ov13_0224F558
	ldrb r0, [r0]
	cmp r0, #0
	bne _02235814
	bl ov13_0222BFCC
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02235830 ; =ov13_02237618
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02235814:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _02235834 ; =ov13_02235928
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223582C: .word ov13_0224F558
_02235830: .word ov13_02237618
_02235834: .word ov13_02235928
	arm_func_end ov13_02235770

	arm_func_start ov13_02235838
ov13_02235838: ; 0x02235838
	stmdb sp!, {r3, lr}
	bl ov13_0222BFF0
	cmp r0, #2
	beq _02235854
	cmp r0, #4
	beq _0223586C
	ldmia sp!, {r3, pc}
_02235854:
	ldr r1, _022358B0 ; =ov13_0224F558
	mov r2, #1
	ldr r0, _022358B4 ; =ov13_022356DC
	strb r2, [r1]
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0223586C:
	ldr r0, _022358B0 ; =ov13_0224F558
	mov r1, #0
	strb r1, [r0]
	bl ov13_0223AC20
	mov r0, #9
	bl ov13_0223ABB8
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xd
	str ip, [sp]
	bl ov13_0223BE6C
	bl ov13_022272E4
	ldr r0, _022358B8 ; =ov13_022358BC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022358B0: .word ov13_0224F558
_022358B4: .word ov13_022356DC
_022358B8: .word ov13_022358BC
	arm_func_end ov13_02235838

	arm_func_start ov13_022358BC
ov13_022358BC: ; 0x022358BC
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _022358E4 ; =ov13_022358E8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022358E4: .word ov13_022358E8
	arm_func_end ov13_022358BC

	arm_func_start ov13_022358E8
ov13_022358E8: ; 0x022358E8
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02235904 ; =ov13_022356DC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235904: .word ov13_022356DC
	arm_func_end ov13_022358E8

	arm_func_start ov13_02235908
ov13_02235908: ; 0x02235908
	ldr r0, _02235924 ; =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.balign 4, 0
_02235924: .word 0x027FFFA8
	arm_func_end ov13_02235908

	arm_func_start ov13_02235928
ov13_02235928: ; 0x02235928
	stmdb sp!, {r3, lr}
	ldr r0, _0223595C ; =ov13_0224F55C
	mov r1, #0
	strb r1, [r0]
	bl ov13_02235964
	bl ov13_02227E40
	mov r0, #0x2a
	bl ov13_022279EC
	mov r0, #2
	bl ov13_02226F58
	ldr r0, _02235960 ; =ov13_022359E4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223595C: .word ov13_0224F55C
_02235960: .word ov13_022359E4
	arm_func_end ov13_02235928

	arm_func_start ov13_02235964
ov13_02235964: ; 0x02235964
	stmdb sp!, {r3, lr}
	ldr r0, _022359D4 ; =ov13_0224655C
	ldr r1, _022359D8 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _022359DC ; =0x04001008
	ldr r1, _022359E0 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022359D4: .word ov13_0224655C
_022359D8: .word GX_LoadBG2Scr
_022359DC: .word 0x04001008
_022359E0: .word 0x0400000A
	arm_func_end ov13_02235964

	arm_func_start ov13_022359E4
ov13_022359E4: ; 0x022359E4
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02235A14 ; =ov13_02235A18
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235A14: .word ov13_02235A18
	arm_func_end ov13_022359E4

	arm_func_start ov13_02235A18
ov13_02235A18: ; 0x02235A18
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	bl ov13_022279B4
	ldr r0, _02235A40 ; =ov13_02235A44
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235A40: .word ov13_02235A44
	arm_func_end ov13_02235A18

	arm_func_start ov13_02235A44
ov13_02235A44: ; 0x02235A44
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _02235A68 ; =ov13_02235A6C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235A68: .word ov13_02235A6C
	arm_func_end ov13_02235A44

	arm_func_start ov13_02235A6C
ov13_02235A6C: ; 0x02235A6C
	stmdb sp!, {r3, lr}
	mov r0, #0xa
	bl OS_Sleep
	bl ov13_02235C34
	bl ov13_02235A8C
	bl ov13_02235AC4
	bl ov13_02235AC8
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02235A6C

	arm_func_start ov13_02235A8C
ov13_02235A8C: ; 0x02235A8C
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _02235AAC
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
_02235AAC:
	bl ov13_02235908
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02235A8C

	arm_func_start ov13_02235AC4
ov13_02235AC4: ; 0x02235AC4
	bx lr
	arm_func_end ov13_02235AC4

	arm_func_start ov13_02235AC8
ov13_02235AC8: ; 0x02235AC8
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _02235AF0 ; =ov13_02235AF4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235AF0: .word ov13_02235AF4
	arm_func_end ov13_02235AC8

	arm_func_start ov13_02235AF4
ov13_02235AF4: ; 0x02235AF4
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02235B10 ; =ov13_02235B14
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235B10: .word ov13_02235B14
	arm_func_end ov13_02235AF4

	arm_func_start ov13_02235B14
ov13_02235B14: ; 0x02235B14
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227228
	ldr r0, _02235B70 ; =ov13_0224F55C
	ldrb r0, [r0]
	cmp r0, #0
	bne _02235B50
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
_02235B50:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02235B74 ; =ov13_02235B78
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235B70: .word ov13_0224F55C
_02235B74: .word ov13_02235B78
	arm_func_end ov13_02235B14

	arm_func_start ov13_02235B78
ov13_02235B78: ; 0x02235B78
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02235C28 ; =ov13_0224F55C
	ldrb r0, [r0]
	cmp r0, #0
	bne _02235BAC
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
_02235BAC:
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _02235C28 ; =ov13_0224F55C
	ldrb r0, [r0]
	cmp r0, #0
	bne _02235BE4
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
_02235BE4:
	bl ov13_0222BFCC
	ldr r0, _02235C28 ; =ov13_0224F55C
	ldrb r0, [r0]
	cmp r0, #0
	bne _02235C10
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02235C2C ; =ov13_02237618
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02235C10:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _02235C30 ; =ov13_02235D58
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235C28: .word ov13_0224F55C
_02235C2C: .word ov13_02237618
_02235C30: .word ov13_02235D58
	arm_func_end ov13_02235B78

	arm_func_start ov13_02235C34
ov13_02235C34: ; 0x02235C34
	stmdb sp!, {r3, lr}
	bl ov13_0222BFF0
	cmp r0, #3
	beq _02235C58
	cmp r0, #4
	beq _02235C78
	cmp r0, #5
	beq _02235CBC
	ldmia sp!, {r3, pc}
_02235C58:
	ldr r0, _02235D00 ; =ov13_0224F55C
	mov r1, #1
	strb r1, [r0]
	bl ov13_0223AC20
	bl ov13_0222C0AC
	ldr r0, _02235D04 ; =ov13_02235AF4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02235C78:
	ldr r0, _02235D00 ; =ov13_0224F55C
	mov r1, #0
	strb r1, [r0]
	bl ov13_0223AC20
	mov r0, #9
	bl ov13_0223ABB8
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xd
	str ip, [sp]
	bl ov13_0223BE6C
	bl ov13_022272E4
	ldr r0, _02235D08 ; =ov13_02235D0C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02235CBC:
	ldr r0, _02235D00 ; =ov13_0224F55C
	mov r1, #0
	strb r1, [r0]
	bl ov13_0223AC20
	mov r0, #0x12
	bl ov13_0223ABB8
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xe
	str ip, [sp]
	bl ov13_0223BE6C
	bl ov13_022272E4
	ldr r0, _02235D08 ; =ov13_02235D0C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235D00: .word ov13_0224F55C
_02235D04: .word ov13_02235AF4
_02235D08: .word ov13_02235D0C
	arm_func_end ov13_02235C34

	arm_func_start ov13_02235D0C
ov13_02235D0C: ; 0x02235D0C
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _02235D34 ; =ov13_02235D38
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235D34: .word ov13_02235D38
	arm_func_end ov13_02235D0C

	arm_func_start ov13_02235D38
ov13_02235D38: ; 0x02235D38
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02235D54 ; =ov13_02235AF4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235D54: .word ov13_02235AF4
	arm_func_end ov13_02235D38

	arm_func_start ov13_02235D58
ov13_02235D58: ; 0x02235D58
	stmdb sp!, {r3, lr}
	ldr r0, _02235D8C ; =ov13_0224F560
	mov r1, #0
	strb r1, [r0]
	bl ov13_02235D94
	bl ov13_02227E40
	mov r0, #0x26
	bl ov13_022279EC
	mov r0, #0x10
	bl ov13_0223ABB8
	ldr r0, _02235D90 ; =ov13_02235E14
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235D8C: .word ov13_0224F560
_02235D90: .word ov13_02235E14
	arm_func_end ov13_02235D58

	arm_func_start ov13_02235D94
ov13_02235D94: ; 0x02235D94
	stmdb sp!, {r3, lr}
	ldr r0, _02235E04 ; =ov13_02246570
	ldr r1, _02235E08 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _02235E0C ; =0x04001008
	ldr r1, _02235E10 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235E04: .word ov13_02246570
_02235E08: .word GX_LoadBG2Scr
_02235E0C: .word 0x04001008
_02235E10: .word 0x0400000A
	arm_func_end ov13_02235D94

	arm_func_start ov13_02235E14
ov13_02235E14: ; 0x02235E14
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02235E44 ; =ov13_02235E48
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235E44: .word ov13_02235E48
	arm_func_end ov13_02235E14

	arm_func_start ov13_02235E48
ov13_02235E48: ; 0x02235E48
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02235E68 ; =ov13_02235E6C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235E68: .word ov13_02235E6C
	arm_func_end ov13_02235E48

	arm_func_start ov13_02235E6C
ov13_02235E6C: ; 0x02235E6C
	stmdb sp!, {r3, lr}
	bl ov13_02235F2C
	bl ov13_02235E7C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02235E6C

	arm_func_start ov13_02235E7C
ov13_02235E7C: ; 0x02235E7C
	bx lr
	arm_func_end ov13_02235E7C

	arm_func_start ov13_02235E80
ov13_02235E80: ; 0x02235E80
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02235EB8 ; =ov13_02235EBC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235EB8: .word ov13_02235EBC
	arm_func_end ov13_02235E80

	arm_func_start ov13_02235EBC
ov13_02235EBC: ; 0x02235EBC
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, #1
	bl ov13_0222B934
	ldr r0, _02235F28 ; =ov13_02238440
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235F28: .word ov13_02238440
	arm_func_end ov13_02235EBC

	arm_func_start ov13_02235F2C
ov13_02235F2C: ; 0x02235F2C
	stmdb sp!, {r3, lr}
	ldr r0, _02235F58 ; =ov13_0224F560
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0x78
	ldmloia sp!, {r3, pc}
	ldr r0, _02235F5C ; =ov13_02235E80
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235F58: .word ov13_0224F560
_02235F5C: .word ov13_02235E80
	arm_func_end ov13_02235F2C

	arm_func_start ov13_02235F60
ov13_02235F60: ; 0x02235F60
	ldr r0, _02235F7C ; =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.balign 4, 0
_02235F7C: .word 0x027FFFA8
	arm_func_end ov13_02235F60

	arm_func_start ov13_02235F80
ov13_02235F80: ; 0x02235F80
	stmdb sp!, {r3, lr}
	ldr r0, _02235FD4 ; =ov13_0224F564
	mov r1, #0
	strb r1, [r0]
	bl ov13_02235FDC
	bl ov13_02227E40
	mov r0, #0x37
	sub r1, r0, #0x38
	mov r2, #0
	bl ov13_022277B8
	mov r0, #2
	bl ov13_02227964
	mov r0, #0x24
	bl ov13_022279EC
	mov r0, #0
	bl ov13_02226F58
	mov r0, #0xb
	bl ov13_0223ABB8
	ldr r0, _02235FD8 ; =ov13_02236084
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02235FD4: .word ov13_0224F564
_02235FD8: .word ov13_02236084
	arm_func_end ov13_02235F80

	arm_func_start ov13_02235FDC
ov13_02235FDC: ; 0x02235FDC
	stmdb sp!, {r3, lr}
	ldr r0, _02236064 ; =ov13_02246584
	ldr r1, _02236068 ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _0223606C ; =ov13_0224659C
	ldr r1, _02236070 ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _02236074 ; =ov13_022465B4
	ldr r1, _02236078 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _0223607C ; =0x04001008
	ldr r1, _02236080 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236064: .word ov13_02246584
_02236068: .word GX_LoadBG2Char
_0223606C: .word ov13_0224659C
_02236070: .word GX_LoadBGPltt
_02236074: .word ov13_022465B4
_02236078: .word GX_LoadBG2Scr
_0223607C: .word 0x04001008
_02236080: .word 0x0400000A
	arm_func_end ov13_02235FDC

	arm_func_start ov13_02236084
ov13_02236084: ; 0x02236084
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _022360D4 ; =ov13_022360D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022360D4: .word ov13_022360D8
	arm_func_end ov13_02236084

	arm_func_start ov13_022360D8
ov13_022360D8: ; 0x022360D8
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0222BF60
	mov r0, #1
	bl ov13_022279B4
	ldr r0, _02236114 ; =ov13_02236118
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236114: .word ov13_02236118
	arm_func_end ov13_022360D8

	arm_func_start ov13_02236118
ov13_02236118: ; 0x02236118
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _0223613C ; =ov13_02236140
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223613C: .word ov13_02236140
	arm_func_end ov13_02236118

	arm_func_start ov13_02236140
ov13_02236140: ; 0x02236140
	stmdb sp!, {r3, lr}
	mov r0, #0xa
	bl OS_Sleep
	bl ov13_02236324
	bl ov13_02236160
	bl ov13_02236198
	bl ov13_0223619C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02236140

	arm_func_start ov13_02236160
ov13_02236160: ; 0x02236160
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _02236180
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
_02236180:
	bl ov13_02235F60
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02236160

	arm_func_start ov13_02236198
ov13_02236198: ; 0x02236198
	bx lr
	arm_func_end ov13_02236198

	arm_func_start ov13_0223619C
ov13_0223619C: ; 0x0223619C
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _022361C4 ; =ov13_022361C8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022361C4: .word ov13_022361C8
	arm_func_end ov13_0223619C

	arm_func_start ov13_022361C8
ov13_022361C8: ; 0x022361C8
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _022361E4 ; =ov13_022361E8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022361E4: .word ov13_022361E8
	arm_func_end ov13_022361C8

	arm_func_start ov13_022361E8
ov13_022361E8: ; 0x022361E8
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02236254 ; =ov13_0224F564
	ldrb r0, [r0]
	cmp r0, #0
	bne _02236210
	bl ov13_02227228
_02236210:
	ldr r0, _02236254 ; =ov13_0224F564
	ldrb r0, [r0]
	cmp r0, #0
	bne _02236234
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
_02236234:
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02236258 ; =ov13_0223625C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236254: .word ov13_0224F564
_02236258: .word ov13_0223625C
	arm_func_end ov13_022361E8

	arm_func_start ov13_0223625C
ov13_0223625C: ; 0x0223625C
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02236318 ; =ov13_0224F564
	ldrb r0, [r0]
	cmp r0, #0
	bne _02236290
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
_02236290:
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _02236318 ; =ov13_0224F564
	ldrb r0, [r0]
	cmp r0, #0
	bne _022362C8
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
_022362C8:
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _02236318 ; =ov13_0224F564
	ldrb r0, [r0]
	cmp r0, #0
	bne _02236300
	bl ov13_0222BFCC
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0223631C ; =ov13_02237618
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02236300:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _02236320 ; =ov13_02235510
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236318: .word ov13_0224F564
_0223631C: .word ov13_02237618
_02236320: .word ov13_02235510
	arm_func_end ov13_0223625C

	arm_func_start ov13_02236324
ov13_02236324: ; 0x02236324
	stmdb sp!, {r3, lr}
	bl ov13_0222BFF0
	cmp r0, #1
	beq _02236340
	cmp r0, #4
	beq _02236358
	ldmia sp!, {r3, pc}
_02236340:
	ldr r1, _0223639C ; =ov13_0224F564
	mov r2, #1
	ldr r0, _022363A0 ; =ov13_022361C8
	strb r2, [r1]
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02236358:
	ldr r0, _0223639C ; =ov13_0224F564
	mov r1, #0
	strb r1, [r0]
	bl ov13_0223AC20
	mov r0, #9
	bl ov13_0223ABB8
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xd
	str ip, [sp]
	bl ov13_0223BE6C
	bl ov13_022272E4
	ldr r0, _022363A4 ; =ov13_022363A8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223639C: .word ov13_0224F564
_022363A0: .word ov13_022361C8
_022363A4: .word ov13_022363A8
	arm_func_end ov13_02236324

	arm_func_start ov13_022363A8
ov13_022363A8: ; 0x022363A8
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _022363D0 ; =ov13_022363D4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022363D0: .word ov13_022363D4
	arm_func_end ov13_022363A8

	arm_func_start ov13_022363D4
ov13_022363D4: ; 0x022363D4
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _022363F0 ; =ov13_022361C8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022363F0: .word ov13_022361C8
	arm_func_end ov13_022363D4

	arm_func_start ov13_022363F4
ov13_022363F4: ; 0x022363F4
	stmdb sp!, {r3, lr}
	ldr r0, _02236454 ; =ov13_0224F568
	mov r1, #0
	strh r1, [r0, #2]
	strb r1, [r0]
	bl ov13_0223645C
	mov r0, #0x33
	sub r1, r0, #0x34
	mov r2, #0
	bl ov13_022277B8
	bl ov13_02227E40
	mov r0, #2
	bl ov13_02227964
	mov r0, #0x33
	bl ov13_022279EC
	mov r0, #0
	bl ov13_02226F58
	bl ov13_02239B00
	bl ov13_02239B68
	mov r0, #0xa
	bl ov13_0223ABB8
	ldr r0, _02236458 ; =ov13_02236504
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236454: .word ov13_0224F568
_02236458: .word ov13_02236504
	arm_func_end ov13_022363F4

	arm_func_start ov13_0223645C
ov13_0223645C: ; 0x0223645C
	stmdb sp!, {r3, lr}
	ldr r0, _022364E4 ; =ov13_022465C8
	ldr r1, _022364E8 ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _022364EC ; =ov13_022465E0
	ldr r1, _022364F0 ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _022364F4 ; =ov13_022465F8
	ldr r1, _022364F8 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _022364FC ; =0x04001008
	ldr r1, _02236500 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022364E4: .word ov13_022465C8
_022364E8: .word GX_LoadBG2Char
_022364EC: .word ov13_022465E0
_022364F0: .word GX_LoadBGPltt
_022364F4: .word ov13_022465F8
_022364F8: .word GX_LoadBG2Scr
_022364FC: .word 0x04001008
_02236500: .word 0x0400000A
	arm_func_end ov13_0223645C

	arm_func_start ov13_02236504
ov13_02236504: ; 0x02236504
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02236554 ; =ov13_02236558
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236554: .word ov13_02236558
	arm_func_end ov13_02236504

	arm_func_start ov13_02236558
ov13_02236558: ; 0x02236558
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	bl ov13_022279B4
	ldr r0, _02236590 ; =ov13_02236594
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236590: .word ov13_02236594
	arm_func_end ov13_02236558

	arm_func_start ov13_02236594
ov13_02236594: ; 0x02236594
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _022365B8 ; =ov13_022365BC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022365B8: .word ov13_022365BC
	arm_func_end ov13_02236594

	arm_func_start ov13_022365BC
ov13_022365BC: ; 0x022365BC
	stmdb sp!, {r3, lr}
	bl ov13_022366FC
	bl ov13_02236720
	bl ov13_02236724
	bl ov13_022365D4
	ldmia sp!, {r3, pc}
	arm_func_end ov13_022365BC

	arm_func_start ov13_022365D4
ov13_022365D4: ; 0x022365D4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _022366F0 ; =ov13_0224F568
	ldrh r1, [r0, #2]
	add r1, r1, #1
	strh r1, [r0, #2]
	ldrh r0, [r0, #2]
	cmp r0, #0x12c
	addlo sp, sp, #8
	ldmloia sp!, {r3, pc}
	bl ov13_0223AC20
	add r0, sp, #4
	bl ov13_02239D04
	cmp r0, #0
	bne _02236654
	ldr r0, _022366F0 ; =ov13_0224F568
	mov r1, #1
	mov r3, #2
	strb r3, [r0]
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xf
	str ip, [sp]
	bl ov13_0223BE6C
	mov r0, #0x12
	bl ov13_0223ABB8
	bl ov13_022272E4
	ldr r0, _022366F4 ; =ov13_0223688C
	bl ov13_0222B8E8
	add sp, sp, #8
	ldmia sp!, {r3, pc}
_02236654:
	cmp r0, #0
	mov r2, #0
	ble _02236680
	ldr r3, [sp, #4]
_02236664:
	ldrb r1, [r3, #0x28]
	cmp r1, #2
	bne _02236680
	add r2, r2, #1
	cmp r2, r0
	add r3, r3, #0x2a
	blt _02236664
_02236680:
	cmp r2, r0
	bne _022366CC
	ldr r0, _022366F0 ; =ov13_0224F568
	mov r1, #1
	mov r3, #3
	strb r3, [r0]
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xe
	str ip, [sp]
	bl ov13_0223BE6C
	mov r0, #0x12
	bl ov13_0223ABB8
	bl ov13_022272E4
	ldr r0, _022366F4 ; =ov13_0223688C
	bl ov13_0222B8E8
	add sp, sp, #8
	ldmia sp!, {r3, pc}
_022366CC:
	ldr r1, _022366F0 ; =ov13_0224F568
	mov r2, #1
	mov r0, #0xf
	strb r2, [r1]
	bl ov13_0223ABB8
	ldr r0, _022366F8 ; =ov13_02236750
	bl ov13_0222B8E8
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022366F0: .word ov13_0224F568
_022366F4: .word ov13_0223688C
_022366F8: .word ov13_02236750
	arm_func_end ov13_022365D4

	arm_func_start ov13_022366FC
ov13_022366FC: ; 0x022366FC
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov13_0223AC20
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_022366FC

	arm_func_start ov13_02236720
ov13_02236720: ; 0x02236720
	bx lr
	arm_func_end ov13_02236720

	arm_func_start ov13_02236724
ov13_02236724: ; 0x02236724
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _0223674C ; =ov13_02236750
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223674C: .word ov13_02236750
	arm_func_end ov13_02236724

	arm_func_start ov13_02236750
ov13_02236750: ; 0x02236750
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0223676C ; =ov13_02236770
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223676C: .word ov13_02236770
	arm_func_end ov13_02236750

	arm_func_start ov13_02236770
ov13_02236770: ; 0x02236770
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227228
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _022367BC ; =ov13_022367C0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022367BC: .word ov13_022367C0
	arm_func_end ov13_02236770

	arm_func_start ov13_022367C0
ov13_022367C0: ; 0x022367C0
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
_022367F0:
	bl ov13_02239C68
	cmp r0, #0
	beq _022367F0
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _02236880 ; =ov13_0224F568
	ldrb r0, [r0]
	cmp r0, #1
	beq _0223685C
	bl ov13_02239B34
	bl ov13_02239FF0
	ldrb r0, [r0, #0xf4]
	bl ov13_0223A414
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02236884 ; =ov13_02237618
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0223685C:
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, r0
	bl ov13_0222B934
	ldr r0, _02236888 ; =ov13_0222FA3C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236880: .word ov13_0224F568
_02236884: .word ov13_02237618
_02236888: .word ov13_0222FA3C
	arm_func_end ov13_022367C0

	arm_func_start ov13_0223688C
ov13_0223688C: ; 0x0223688C
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _022368B4 ; =ov13_022368B8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022368B4: .word ov13_022368B8
	arm_func_end ov13_0223688C

	arm_func_start ov13_022368B8
ov13_022368B8: ; 0x022368B8
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _022368D4 ; =ov13_02236750
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022368D4: .word ov13_02236750
	arm_func_end ov13_022368B8

	arm_func_start ov13_022368D8
ov13_022368D8: ; 0x022368D8
	stmdb sp!, {r3, lr}
	mov r0, #0x20
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _02236930 ; =ov13_0224F56C
	mov r2, #0
	str r0, [r1, #4]
	strb r2, [r0, #0x1d]
	bl ov13_02236938
	mov r0, #1
	bl ov13_02227DE4
	mov r0, #0x2f
	sub r1, r0, #0x30
	mov r2, #0
	bl ov13_022277B8
	mov r0, #0
	bl ov13_02227964
	bl ov13_02236A48
	bl ov13_022370B8
	ldr r0, _02236934 ; =ov13_02236B50
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236930: .word ov13_0224F56C
_02236934: .word ov13_02236B50
	arm_func_end ov13_022368D8

	arm_func_start ov13_02236938
ov13_02236938: ; 0x02236938
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	ldr ip, _02236A18 ; =ov13_0224560C
	add r3, sp, #0
	mov r2, #0xb
_0223694C:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _0223694C
	ldr r0, _02236A1C ; =ov13_0224660C
	ldr r1, _02236A20 ; =GX_LoadOBJPltt
	bl ov13_02227924
	ldr r0, _02236A24 ; =ov13_02246620
	ldr r1, _02236A28 ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _02236A2C ; =ov13_02246638
	ldr r1, _02236A30 ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _02236A34 ; =ov13_02246650
	ldr r1, _02236A38 ; =GX_LoadBG2Scr
	bl ov13_02227924
	add r0, sp, #0
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r2, _02236A3C ; =ov13_0224F56C
	mov r1, #0x10
	ldr r2, [r2, #4]
	str r0, [r2]
	mov r0, #1
	bl ov13_02240EA8
	ldr r2, _02236A40 ; =0x04001008
	ldr r1, _02236A44 ; =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236A18: .word ov13_0224560C
_02236A1C: .word ov13_0224660C
_02236A20: .word GX_LoadOBJPltt
_02236A24: .word ov13_02246620
_02236A28: .word GX_LoadBG2Char
_02236A2C: .word ov13_02246638
_02236A30: .word GX_LoadBGPltt
_02236A34: .word ov13_02246650
_02236A38: .word GX_LoadBG2Scr
_02236A3C: .word ov13_0224F56C
_02236A40: .word 0x04001008
_02236A44: .word 0x0400000A
	arm_func_end ov13_02236938

	arm_func_start ov13_02236A48
ov13_02236A48: ; 0x02236A48
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, #0
	ldr r6, _02236B44 ; =ov13_02245622
	ldr r5, _02236B48 ; =ov13_02245600
	ldr r4, _02236B4C ; =ov13_0224F56C
	mov fp, sl
	mvn r7, #0
	mov r8, #3
_02236A68:
	mov r0, sl
	bl ov13_0223A3FC
	mov sb, r0
	cmp sb, #0xff
	moveq sb, r8
	beq _02236ADC
	mov r0, fp
	mov r1, #0x11
	mov r2, #1
	bl ov13_022401B0
	ldr r1, [r4, #4]
	add r3, sl, #3
	add r1, r1, sl, lsl #2
	str r0, [r1, #0x10]
	mov r2, r3, lsl #2
	ldr r0, [r4, #4]
	add r3, r6, r3, lsl #2
	add r0, r0, sl, lsl #2
	ldrh r2, [r6, r2]
	ldrh r3, [r3, #2]
	ldr r0, [r0, #0x10]
	mov r1, r7
	bl ov13_0223FF18
	ldr r0, [r4, #4]
	mov r1, r7
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #0x10]
	mov r2, #3
	bl ov13_02240008
_02236ADC:
	ldrb r1, [r5, sb]
	mov r0, #0
	mov r2, #1
	bl ov13_022401B0
	ldr r1, [r4, #4]
	mov r2, sl, lsl #2
	add r1, r1, sl, lsl #2
	str r0, [r1, #4]
	ldr r0, [r4, #4]
	add r3, r6, sl, lsl #2
	add r0, r0, sl, lsl #2
	ldrh r2, [r6, r2]
	ldrh r3, [r3, #2]
	ldr r0, [r0, #4]
	mov r1, r7
	bl ov13_0223FF18
	ldr r0, [r4, #4]
	mov r1, r7
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #4]
	mov r2, #3
	bl ov13_02240008
	add sl, sl, #1
	cmp sl, #3
	blt _02236A68
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02236B44: .word ov13_02245622
_02236B48: .word ov13_02245600
_02236B4C: .word ov13_0224F56C
	arm_func_end ov13_02236A48

	arm_func_start ov13_02236B50
ov13_02236B50: ; 0x02236B50
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EA8
	ldr r0, _02236BA0 ; =ov13_02236BA4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236BA0: .word ov13_02236BA4
	arm_func_end ov13_02236B50

	arm_func_start ov13_02236BA4
ov13_02236BA4: ; 0x02236BA4
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_022279B4
	ldr r0, _02236BDC ; =ov13_02236BE0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236BDC: .word ov13_02236BE0
	arm_func_end ov13_02236BA4

	arm_func_start ov13_02236BE0
ov13_02236BE0: ; 0x02236BE0
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223B2A8
	cmp r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _02236C10 ; =ov13_02236C14
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236C10: .word ov13_02236C14
	arm_func_end ov13_02236BE0

	arm_func_start ov13_02236C14
ov13_02236C14: ; 0x02236C14
	stmdb sp!, {r3, lr}
	bl ov13_02236C28
	bl ov13_02236D1C
	bl ov13_02236D20
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02236C14

	arm_func_start ov13_02236C28
ov13_02236C28: ; 0x02236C28
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, _02236D14 ; =ov13_0224563A
	mov r4, #0
_02236C34:
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _02236C5C
	mov r0, #1
	bl ov13_0222726C
	ldr r0, _02236D18 ; =ov13_0224F56C
	strb r4, [r0]
	bl ov13_022370B8
	ldmia sp!, {r3, r4, r5, pc}
_02236C5C:
	add r4, r4, #1
	cmp r4, #7
	add r5, r5, #8
	blo _02236C34
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _02236C88
	mov r0, #1
	bl ov13_0222726C
	ldmia sp!, {r3, r4, r5, pc}
_02236C88:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _02236CA4
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, r4, r5, pc}
_02236CA4:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _02236CC0
	mov r0, #1
	bl ov13_02237134
	ldmia sp!, {r3, r4, r5, pc}
_02236CC0:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	beq _02236CDC
	mov r0, #3
	bl ov13_02237134
	ldmia sp!, {r3, r4, r5, pc}
_02236CDC:
	mov r0, #0x20
	bl ov13_022416D4
	cmp r0, #0
	beq _02236CF8
	mov r0, #0
	bl ov13_02237134
	ldmia sp!, {r3, r4, r5, pc}
_02236CF8:
	mov r0, #0x10
	bl ov13_022416D4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	bl ov13_02237134
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02236D14: .word ov13_0224563A
_02236D18: .word ov13_0224F56C
	arm_func_end ov13_02236C28

	arm_func_start ov13_02236D1C
ov13_02236D1C: ; 0x02236D1C
	bx lr
	arm_func_end ov13_02236D1C

	arm_func_start ov13_02236D20
ov13_02236D20: ; 0x02236D20
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	bl ov13_02227258
	cmp r0, #0
	beq _02236D44
	cmp r0, #1
	beq _02236D8C
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_02236D44:
	bl ov13_0222B980
	cmp r0, #0
	beq _02236D5C
	cmp r0, #1
	beq _02236D78
	b _02236E30
_02236D5C:
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _02236E40 ; =ov13_0224F56C
	mov r1, #2
	ldr r0, [r0, #4]
	strb r1, [r0, #0x1d]
	b _02236E30
_02236D78:
	bl ov13_022272E4
	ldr r0, _02236E44 ; =ov13_0222C10C
	bl ov13_0222B8E8
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_02236D8C:
	ldr r0, _02236E40 ; =ov13_0224F56C
	mov r2, #1
	ldr r1, [r0, #4]
	strb r2, [r1, #0x1d]
	ldrb r0, [r0]
	cmp r0, #4
	blo _02236E18
	sub r4, r0, #4
	mov r0, r4
	bl ov13_0223A3FC
	cmp r0, #0xff
	bne _02236DD4
	mov r0, #9
	bl ov13_0223ABB8
	mvn r0, #0
	bl ov13_0222728C
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_02236DD4:
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0222B970
	ldr r1, _02236E48 ; =ov13_022456AC
	add ip, r4, #1
	ldrsb r3, [r1, r0]
	mov r0, #0x46
	mov r1, #0
	mov r2, #1
	str ip, [sp]
	bl ov13_0223BE6C
	bl ov13_02237328
	bl ov13_022272E4
	ldr r0, _02236E4C ; =ov13_022373B8
	bl ov13_0222B8E8
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_02236E18:
	cmp r0, #2
	bhi _02236E24
	bl ov13_0223A414
_02236E24:
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_02237548
_02236E30:
	ldr r0, _02236E50 ; =ov13_02236E54
	bl ov13_0222B8E8
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_02236E40: .word ov13_0224F56C
_02236E44: .word ov13_0222C10C
_02236E48: .word ov13_022456AC
_02236E4C: .word ov13_022373B8
_02236E50: .word ov13_02236E54
	arm_func_end ov13_02236D20

	arm_func_start ov13_02236E54
ov13_02236E54: ; 0x02236E54
	stmdb sp!, {r3, lr}
	ldr r0, _02236E88 ; =ov13_0224F56C
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x1d]
	cmp r0, #2
	bne _02236E70
	bl ov13_0223B1A0
_02236E70:
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02236E8C ; =ov13_02236E90
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236E88: .word ov13_0224F56C
_02236E8C: .word ov13_02236E90
	arm_func_end ov13_02236E54

	arm_func_start ov13_02236E90
ov13_02236E90: ; 0x02236E90
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02236F0C ; =ov13_0224F56C
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x1d]
	cmp r1, #1
	bne _02236ED8
	ldrb r0, [r0]
	cmp r0, #3
	beq _02236ED4
	bl ov13_02239FF0
	ldrb r0, [r0, #0xe7]
	cmp r0, #0xff
	beq _02236ED8
_02236ED4:
	bl ov13_02227228
_02236ED8:
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02236F10 ; =ov13_02236F14
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236F0C: .word ov13_0224F56C
_02236F10: .word ov13_02236F14
	arm_func_end ov13_02236E90

	arm_func_start ov13_02236F14
ov13_02236F14: ; 0x02236F14
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	bl ov13_0223B6C8
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r4, _02237098 ; =ov13_0224F56C
	mov r5, #0
_02236F58:
	ldr r0, [r4, #4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02236F70
	bl ov13_0223FD60
_02236F70:
	add r5, r5, #1
	cmp r5, #3
	blo _02236F58
	ldr r4, _02237098 ; =ov13_0224F56C
	mov r5, #0
_02236F84:
	ldr r0, [r4, #4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02236F9C
	bl ov13_0223FD60
_02236F9C:
	add r5, r5, #1
	cmp r5, #3
	blo _02236F84
	bl ov13_02227D18
	bl ov13_0222788C
	ldr r0, _02237098 ; =ov13_0224F56C
	ldr r0, [r0, #4]
	ldr r0, [r0]
	bl ov13_0223FA50
	ldr r0, _0223709C ; =ov13_02246664
	ldr r1, _022370A0 ; =GX_LoadOBJPltt
	bl ov13_02227924
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EFC
	ldr r0, _02237098 ; =ov13_0224F56C
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x1d]
	cmp r1, #2
	bne _02237010
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _022370A4 ; =ov13_0222C44C
	bl ov13_0222B8E8
	b _0223708C
_02237010:
	ldrb r0, [r0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0223708C
_02237020: ; jump table
	b _02237030 ; case 0
	b _02237030 ; case 1
	b _02237030 ; case 2
	b _02237078 ; case 3
_02237030:
	mov r0, #2
	mov r1, #0
	bl ov13_0222B8F8
	bl ov13_02239FF0
	ldrb r0, [r0, #0xe7]
	cmp r0, #0xff
	bne _02237058
	ldr r0, _022370A8 ; =ov13_02237618
	bl ov13_0222B8E8
	b _0223708C
_02237058:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B934
	mov r0, #0
	bl ov13_022352C0
	ldr r0, _022370AC ; =ov13_02232E04
	bl ov13_0222B8E8
	b _0223708C
_02237078:
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _022370B0 ; =ov13_022388A0
	bl ov13_0222B8E8
_0223708C:
	ldr r0, _022370B4 ; =ov13_0224F570
	bl ov13_022412B0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02237098: .word ov13_0224F56C
_0223709C: .word ov13_02246664
_022370A0: .word GX_LoadOBJPltt
_022370A4: .word ov13_0222C44C
_022370A8: .word ov13_02237618
_022370AC: .word ov13_02232E04
_022370B0: .word ov13_022388A0
_022370B4: .word ov13_0224F570
	arm_func_end ov13_02236F14

	arm_func_start ov13_022370B8
ov13_022370B8: ; 0x022370B8
	stmdb sp!, {r3, lr}
	ldr r0, _02237120 ; =ov13_0224F56C
	ldrb r2, [r0]
	cmp r2, #4
	bhs _022370F8
	mov ip, r2, lsl #3
	ldr r0, _02237124 ; =ov13_02245672
	ldr r1, _02237128 ; =ov13_02245676
	ldr r2, _0223712C ; =ov13_02245674
	ldr r3, _02237130 ; =ov13_02245678
	ldrh r0, [r0, ip]
	ldrh r1, [r1, ip]
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	bl ov13_02227C28
	ldmia sp!, {r3, pc}
_022370F8:
	ldr r1, _02237124 ; =ov13_02245672
	mov r3, r2, lsl #3
	ldr r2, _02237128 ; =ov13_02245676
	ldr r0, _0223712C ; =ov13_02245674
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	ldrh r3, [r0, r3]
	mov r0, #0
	bl ov13_02227B6C
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02237120: .word ov13_0224F56C
_02237124: .word ov13_02245672
_02237128: .word ov13_02245676
_0223712C: .word ov13_02245674
_02237130: .word ov13_02245678
	arm_func_end ov13_022370B8

	arm_func_start ov13_02237134
ov13_02237134: ; 0x02237134
	stmdb sp!, {r3, lr}
	ldr r2, _02237324 ; =ov13_0224F56C
	mov r1, #1
	ldrb r3, [r2]
	cmp r3, #6
	addls pc, pc, r3, lsl #2
	b _0223730C
_02237150: ; jump table
	b _0223716C ; case 0
	b _022371AC ; case 1
	b _022371EC ; case 2
	b _0223722C ; case 3
	b _02237254 ; case 4
	b _02237294 ; case 5
	b _022372D0 ; case 6
_0223716C:
	ldr r3, [r2, #4]
	mov ip, #0
	cmp r0, #0
	strb ip, [r3, #0x1c]
	moveq r0, #2
	streqb r0, [r2]
	beq _0223730C
	cmp r0, #2
	streqb r1, [r2]
	beq _0223730C
	cmp r0, #1
	moveq r0, #3
	streqb r0, [r2]
	movne r0, #4
	strneb r0, [r2]
	b _0223730C
_022371AC:
	ldr r3, [r2, #4]
	cmp r0, #0
	strb r1, [r3, #0x1c]
	moveq r0, #0
	streqb r0, [r2]
	beq _0223730C
	cmp r0, #2
	moveq r0, #2
	streqb r0, [r2]
	beq _0223730C
	cmp r0, #1
	moveq r0, #3
	streqb r0, [r2]
	movne r0, #5
	strneb r0, [r2]
	b _0223730C
_022371EC:
	ldr r3, [r2, #4]
	mov ip, #2
	strb ip, [r3, #0x1c]
	cmp r0, #0
	streqb r1, [r2]
	beq _0223730C
	cmp r0, #2
	moveq r0, #0
	streqb r0, [r2]
	beq _0223730C
	cmp r0, #1
	moveq r0, #3
	streqb r0, [r2]
	movne r0, #6
	strneb r0, [r2]
	b _0223730C
_0223722C:
	ldr r3, [r2, #4]
	cmp r0, #1
	ldrb ip, [r3, #0x1c]
	add r3, ip, #4
	streqb r3, [r2]
	beq _0223730C
	cmp r0, #3
	streqb ip, [r2]
	movne r1, #0
	b _0223730C
_02237254:
	ldr r3, [r2, #4]
	mov ip, #0
	cmp r0, #0
	strb ip, [r3, #0x1c]
	moveq r0, #6
	streqb r0, [r2]
	beq _0223730C
	cmp r0, #2
	moveq r0, #5
	streqb r0, [r2]
	beq _0223730C
	cmp r0, #1
	streqb ip, [r2]
	movne r0, #3
	strneb r0, [r2]
	b _0223730C
_02237294:
	ldr r3, [r2, #4]
	cmp r0, #0
	strb r1, [r3, #0x1c]
	moveq r0, #4
	streqb r0, [r2]
	beq _0223730C
	cmp r0, #2
	moveq r0, #6
	streqb r0, [r2]
	beq _0223730C
	cmp r0, #1
	streqb r1, [r2]
	movne r0, #3
	strneb r0, [r2]
	b _0223730C
_022372D0:
	ldr r3, [r2, #4]
	mov ip, #2
	cmp r0, #0
	strb ip, [r3, #0x1c]
	moveq r0, #5
	streqb r0, [r2]
	beq _0223730C
	cmp r0, #2
	moveq r0, #4
	streqb r0, [r2]
	beq _0223730C
	cmp r0, #1
	streqb ip, [r2]
	movne r0, #3
	strneb r0, [r2]
_0223730C:
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #8
	bl ov13_0223ABB8
	bl ov13_022370B8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02237324: .word ov13_0224F56C
	arm_func_end ov13_02237134

	arm_func_start ov13_02237328
ov13_02237328: ; 0x02237328
	stmdb sp!, {r4, lr}
	ldr r0, _022373AC ; =ov13_0224F56C
	mov r1, #0
	ldrb r2, [r0]
	ldr r0, [r0, #4]
	sub r4, r2, #4
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov13_0223FDE0
	mov r2, r0
	mov r0, #0
	mov r1, #0x32
	bl ov13_022400F0
	ldr r0, _022373AC ; =ov13_0224F56C
	add r3, r4, #3
	ldr r2, [r0, #4]
	ldr r1, _022373B0 ; =ov13_02245622
	mov r3, r3, lsl #2
	ldr r0, _022373B4 ; =ov13_02245624
	add ip, r2, r4, lsl #2
	ldrh r2, [r1, r3]
	ldrh r3, [r0, r3]
	ldr r0, [ip, #0x10]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _022373AC ; =ov13_0224F56C
	mvn r1, #0
	ldr r0, [r0, #4]
	mov r2, #3
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov13_02240008
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022373AC: .word ov13_0224F56C
_022373B0: .word ov13_02245622
_022373B4: .word ov13_02245624
	arm_func_end ov13_02237328

	arm_func_start ov13_022373B8
ov13_022373B8: ; 0x022373B8
	stmdb sp!, {r4, lr}
	ldr r0, _02237514 ; =ov13_0224F56C
	ldrb r0, [r0]
	sub r4, r0, #4
	bl ov13_0223C1DC
	cmp r0, #0
	beq _02237488
	cmp r0, #1
	ldmneia sp!, {r4, pc}
	mov r0, #0xe
	bl ov13_0223ABB8
	mov r0, r4
	bl ov13_0223A804
	ldr r0, _02237514 ; =ov13_0224F56C
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #4]
	bl ov13_0223FDE0
	mov r2, r0
	mov r0, #0
	mov r1, #0x56
	bl ov13_022400F0
	ldr r0, _02237514 ; =ov13_0224F56C
	mov ip, r4, lsl #2
	ldr r0, [r0, #4]
	mvn r1, #0
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #4]
	ldr r2, _02237518 ; =ov13_02245622
	ldr r3, _0223751C ; =ov13_02245624
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	bl ov13_0223FF18
	ldr r0, _02237514 ; =ov13_0224F56C
	mvn r1, #0
	ldr r0, [r0, #4]
	mov r2, #3
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #4]
	bl ov13_02240008
	ldr r0, _02237514 ; =ov13_0224F56C
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov13_0223FD60
	mov r1, #0
	ldr r0, _02237514 ; =ov13_0224F56C
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	str r1, [r0, #0x10]
	b _02237504
_02237488:
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _02237514 ; =ov13_0224F56C
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov13_0223FDE0
	mov r2, r0
	mov r0, #0
	mov r1, #0x11
	bl ov13_022400F0
	ldr r0, _02237514 ; =ov13_0224F56C
	add r1, r4, #3
	ldr r0, [r0, #4]
	mov ip, r1, lsl #2
	ldr r2, _02237518 ; =ov13_02245622
	ldr r3, _0223751C ; =ov13_02245624
	add r0, r0, r4, lsl #2
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	ldr r0, [r0, #0x10]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _02237514 ; =ov13_0224F56C
	mvn r1, #0
	ldr r0, [r0, #4]
	mov r2, #3
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov13_02240008
_02237504:
	bl ov13_0223C198
	ldr r0, _02237520 ; =ov13_02237524
	bl ov13_0222B8E8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02237514: .word ov13_0224F56C
_02237518: .word ov13_02245622
_0223751C: .word ov13_02245624
_02237520: .word ov13_02237524
	arm_func_end ov13_022373B8

	arm_func_start ov13_02237524
ov13_02237524: ; 0x02237524
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _02237544 ; =ov13_02236C14
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02237544: .word ov13_02236C14
	arm_func_end ov13_02237524

	arm_func_start ov13_02237548
ov13_02237548: ; 0x02237548
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r1, _02237610 ; =ov13_02245604
	ldr r0, _02237614 ; =ov13_0224F56C
	ldrb r7, [r1]
	ldrb r6, [r1, #1]
	ldrb r5, [r1, #2]
	ldrb r4, [r1, #3]
	ldrb lr, [r1, #4]
	ldrb ip, [r1, #5]
	ldrb r3, [r1, #6]
	ldrb r2, [r1, #7]
	ldrb r1, [r0]
	strb r7, [sp, #4]
	strb r2, [sp, #3]
	strb r6, [sp, #5]
	strb r5, [sp, #6]
	strb r4, [sp, #7]
	strb lr, [sp]
	strb ip, [sp, #1]
	strb r3, [sp, #2]
	cmp r1, #3
	add r2, sp, #4
	addhi sp, sp, #8
	ldmhiia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r2, r1]
	ldr r0, [r0, #4]
	ldr r0, [r0]
	mov r2, r1
	bl ov13_02239378
	ldr r0, _02237614 ; =ov13_0224F56C
	ldrb r0, [r0]
	cmp r0, #3
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl ov13_0223A3FC
	ldr r1, _02237614 ; =ov13_0224F56C
	cmp r0, #2
	ldrb ip, [r1]
	ldr r1, [r1, #4]
	movgt r0, #3
	add r2, sp, #0
	ldrb r3, [r2, r0]
	add r0, r1, ip, lsl #2
	ldr r0, [r0, #4]
	mvn r1, #0
	mov r2, #0
	bl ov13_0223FE98
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02237610: .word ov13_02245604
_02237614: .word ov13_0224F56C
	arm_func_end ov13_02237548

	arm_func_start ov13_02237618
ov13_02237618: ; 0x02237618
	stmdb sp!, {r4, r5, r6, lr}
	bl ov13_02239FF0
	ldr r1, _02237720 ; =ov13_0224F574
	mov r2, #0
	strb r2, [r1, #2]
	ldrsb r2, [r1]
	mov r4, r0
	cmp r2, #0
	moveq r0, #1
	streqb r0, [r1]
	bl ov13_0222B970
	cmp r0, #0
	beq _02237674
	ldr r0, _02237720 ; =ov13_0224F574
	ldrsb r1, [r0, #1]
	cmp r1, #2
	moveq r1, #0
	streqb r1, [r0, #1]
	ldr r0, _02237720 ; =ov13_0224F574
	ldrsb r1, [r0]
	cmp r1, #2
	moveq r1, #1
	streqb r1, [r0]
_02237674:
	bl ov13_0223773C
	bl ov13_02227E40
	bl ov13_0222B970
	mov r5, r0
	ldrb r1, [r4, #0xf4]
	mov r0, #0x32
	ldr r3, _02237724 ; =ov13_02245770
	add r2, r1, #1
	ldrsb r1, [r3, r5]
	bl ov13_022277B8
	mov r0, #1
	bl ov13_02227964
	mov r0, #1
	bl ov13_0222B998
	mov r6, r0
	mov r0, #1
	bl ov13_0222B998
	mov r5, r0
	mov r0, #1
	bl ov13_0222B998
	mov r4, r0
	mov r0, #1
	bl ov13_0222B998
	mov r3, r0
	ldr r1, _02237728 ; =ov13_0224572E
	ldr r0, _02237720 ; =ov13_0224F574
	add ip, r1, r6, lsl #5
	ldrsb lr, [r0, #1]
	ldr r1, _0223772C ; =ov13_02245732
	ldr r0, _02237730 ; =ov13_02245730
	add r1, r1, r5, lsl #5
	add r2, r0, r4, lsl #5
	mov r5, lr, lsl #3
	ldrh r0, [r5, ip]
	ldrh r1, [r5, r1]
	ldrh r2, [r5, r2]
	ldr r4, _02237734 ; =ov13_02245734
	add r3, r4, r3, lsl #5
	ldrh r3, [r5, r3]
	bl ov13_02227C28
	ldr r0, _02237738 ; =ov13_02237828
	bl ov13_0222B8E8
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02237720: .word ov13_0224F574
_02237724: .word ov13_02245770
_02237728: .word ov13_0224572E
_0223772C: .word ov13_02245732
_02237730: .word ov13_02245730
_02237734: .word ov13_02245734
_02237738: .word ov13_02237828
	arm_func_end ov13_02237618

	arm_func_start ov13_0223773C
ov13_0223773C: ; 0x0223773C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	ldr ip, _02237800 ; =ov13_022456B8
	add r3, sp, #0
	mov r2, #0xb
_02237750:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _02237750
	ldr r0, _02237804 ; =ov13_0224667C
	ldr r1, _02237808 ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _0223780C ; =ov13_02246694
	ldr r1, _02237810 ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _02237814 ; =ov13_022466AC
	ldr r1, _02237818 ; =GX_LoadBG2Scr
	bl ov13_02227924
	add r0, sp, #0
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _0223781C ; =ov13_0224F574
	ldr r2, _02237820 ; =0x04001008
	str r0, [r1, #4]
	ldrh r0, [r2]
	ldr r1, _02237824 ; =0x0400000A
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02237800: .word ov13_022456B8
_02237804: .word ov13_0224667C
_02237808: .word GX_LoadBG2Char
_0223780C: .word ov13_02246694
_02237810: .word GX_LoadBGPltt
_02237814: .word ov13_022466AC
_02237818: .word GX_LoadBG2Scr
_0223781C: .word ov13_0224F574
_02237820: .word 0x04001008
_02237824: .word 0x0400000A
	arm_func_end ov13_0223773C

	arm_func_start ov13_02237828
ov13_02237828: ; 0x02237828
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EA8
	ldr r0, _02237878 ; =ov13_0223787C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02237878: .word ov13_0223787C
	arm_func_end ov13_02237828

	arm_func_start ov13_0223787C
ov13_0223787C: ; 0x0223787C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_022279B4
	ldr r0, _022378B4 ; =ov13_022378B8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022378B4: .word ov13_022378B8
	arm_func_end ov13_0223787C

	arm_func_start ov13_022378B8
ov13_022378B8: ; 0x022378B8
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _022378DC ; =ov13_022378E0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022378DC: .word ov13_022378E0
	arm_func_end ov13_022378B8

	arm_func_start ov13_022378E0
ov13_022378E0: ; 0x022378E0
	stmdb sp!, {r3, lr}
	bl ov13_022378F4
	bl ov13_02237A78
	bl ov13_02237A7C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_022378E0

	arm_func_start ov13_022378F4
ov13_022378F4: ; 0x022378F4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	ldr r4, _02237A60 ; =ov13_022456EE
	mov r7, r6
	mov r5, #1
_02237908:
	mov r0, r5
	bl ov13_0222B998
	add r0, r4, r0, lsl #5
	add r0, r0, r7
	bl ov13_022417DC
	cmp r0, #0
	beq _022379A8
	mov r0, #1
	bl ov13_0222726C
	ldr r1, _02237A64 ; =ov13_0224F574
	mov r0, #1
	strb r6, [r1, #1]
	bl ov13_0222B998
	mov r6, r0
	mov r0, #1
	bl ov13_0222B998
	mov r5, r0
	mov r0, #1
	bl ov13_0222B998
	mov r4, r0
	mov r0, #1
	bl ov13_0222B998
	mov r3, r0
	ldr r0, _02237A64 ; =ov13_0224F574
	ldr r1, _02237A68 ; =ov13_0224572E
	ldrsb lr, [r0, #1]
	ldr r0, _02237A6C ; =ov13_02245730
	add ip, r1, r6, lsl #5
	ldr r1, _02237A70 ; =ov13_02245732
	add r2, r0, r4, lsl #5
	ldr r4, _02237A74 ; =ov13_02245734
	add r1, r1, r5, lsl #5
	mov r5, lr, lsl #3
	add r3, r4, r3, lsl #5
	ldrh r0, [r5, ip]
	ldrh r1, [r5, r1]
	ldrh r2, [r5, r2]
	ldrh r3, [r5, r3]
	bl ov13_02227C28
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022379A8:
	add r6, r6, #1
	cmp r6, #4
	add r7, r7, #8
	blo _02237908
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _022379D4
	mov r0, #1
	bl ov13_0222726C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022379D4:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _022379F0
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022379F0:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _02237A0C
	mov r0, #1
	bl ov13_02237C84
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02237A0C:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	beq _02237A28
	mov r0, #3
	bl ov13_02237C84
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02237A28:
	mov r0, #0x20
	bl ov13_022416D4
	cmp r0, #0
	beq _02237A44
	mov r0, #0
	bl ov13_02237C84
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02237A44:
	mov r0, #0x10
	bl ov13_022416D4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #2
	bl ov13_02237C84
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02237A60: .word ov13_022456EE
_02237A64: .word ov13_0224F574
_02237A68: .word ov13_0224572E
_02237A6C: .word ov13_02245730
_02237A70: .word ov13_02245732
_02237A74: .word ov13_02245734
	arm_func_end ov13_022378F4

	arm_func_start ov13_02237A78
ov13_02237A78: ; 0x02237A78
	bx lr
	arm_func_end ov13_02237A78

	arm_func_start ov13_02237A7C
ov13_02237A7C: ; 0x02237A7C
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	beq _02237A98
	cmp r0, #1
	beq _02237AA4
	ldmia sp!, {r3, pc}
_02237A98:
	mov r0, #7
	bl ov13_0223ABB8
	b _02237ABC
_02237AA4:
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_02237D78
	ldr r0, _02237AC8 ; =ov13_0224F574
	mov r1, #1
	strb r1, [r0, #2]
_02237ABC:
	ldr r0, _02237ACC ; =ov13_02237AD0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02237AC8: .word ov13_0224F574
_02237ACC: .word ov13_02237AD0
	arm_func_end ov13_02237A7C

	arm_func_start ov13_02237AD0
ov13_02237AD0: ; 0x02237AD0
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02237AEC ; =ov13_02237AF0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02237AEC: .word ov13_02237AF0
	arm_func_end ov13_02237AD0

	arm_func_start ov13_02237AF0
ov13_02237AF0: ; 0x02237AF0
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02237B4C ; =ov13_0224F574
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _02237B18
	bl ov13_02227228
_02237B18:
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02237B50 ; =ov13_02237B54
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02237B4C: .word ov13_0224F574
_02237B50: .word ov13_02237B54
	arm_func_end ov13_02237AF0

	arm_func_start ov13_02237B54
ov13_02237B54: ; 0x02237B54
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov13_02227D18
	bl ov13_0222788C
	ldr r0, _02237C6C ; =ov13_0224F574
	ldr r0, [r0, #4]
	bl ov13_0223FA50
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EFC
	ldr r0, _02237C6C ; =ov13_0224F574
	ldrb r1, [r0, #2]
	cmp r1, #0
	bne _02237BD8
	mov r0, #2
	mov r1, #0
	bl ov13_0222B8F8
	ldr r0, _02237C70 ; =ov13_022368D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02237BD8:
	ldrsb r0, [r0, #1]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_02237BE8: ; jump table
	b _02237BF8 ; case 0
	b _02237C10 ; case 1
	b _02237C28 ; case 2
	b _02237C40 ; case 3
_02237BF8:
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02237C74 ; =ov13_022363F4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02237C10:
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02237C78 ; =ov13_0222F2AC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02237C28:
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02237C7C ; =ov13_02235F80
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02237C40:
	mov r0, #2
	mov r1, #0
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, r0
	bl ov13_0222B934
	mov r0, #1
	bl ov13_022352C0
	ldr r0, _02237C80 ; =ov13_02232E04
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02237C6C: .word ov13_0224F574
_02237C70: .word ov13_022368D8
_02237C74: .word ov13_022363F4
_02237C78: .word ov13_0222F2AC
_02237C7C: .word ov13_02235F80
_02237C80: .word ov13_02232E04
	arm_func_end ov13_02237B54

	arm_func_start ov13_02237C84
ov13_02237C84: ; 0x02237C84
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02237D60 ; =ov13_0224F574
	mov r5, r0
	mov r0, #1
	ldrsb r4, [r1, #1]
	bl ov13_0222B998
	ldr r2, _02237D64 ; =ov13_022456CE
	mvn r1, #0
	add r0, r2, r0, lsl #4
	add r0, r0, r4, lsl #2
	ldrsb r2, [r5, r0]
	cmp r2, r1
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r2, #0
	ldreq r0, _02237D60 ; =ov13_0224F574
	streqb r4, [r0]
	mvn r0, #1
	cmp r2, r0
	ldrne r0, _02237D60 ; =ov13_0224F574
	strneb r2, [r0, #1]
	bne _02237CE4
	ldr r0, _02237D60 ; =ov13_0224F574
	ldrsb r1, [r0]
	strb r1, [r0, #1]
_02237CE4:
	mov r0, #8
	bl ov13_0223ABB8
	mov r0, #1
	bl ov13_0222B998
	mov r6, r0
	mov r0, #1
	bl ov13_0222B998
	mov r5, r0
	mov r0, #1
	bl ov13_0222B998
	mov r4, r0
	mov r0, #1
	bl ov13_0222B998
	mov r3, r0
	ldr r1, _02237D68 ; =ov13_0224572E
	ldr r0, _02237D60 ; =ov13_0224F574
	add ip, r1, r6, lsl #5
	ldrsb lr, [r0, #1]
	ldr r1, _02237D6C ; =ov13_02245732
	ldr r0, _02237D70 ; =ov13_02245730
	add r1, r1, r5, lsl #5
	add r2, r0, r4, lsl #5
	mov r5, lr, lsl #3
	ldrh r0, [r5, ip]
	ldrh r1, [r5, r1]
	ldrh r2, [r5, r2]
	ldr r4, _02237D74 ; =ov13_02245734
	add r3, r4, r3, lsl #5
	ldrh r3, [r5, r3]
	bl ov13_02227C28
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02237D60: .word ov13_0224F574
_02237D64: .word ov13_022456CE
_02237D68: .word ov13_0224572E
_02237D6C: .word ov13_02245732
_02237D70: .word ov13_02245730
_02237D74: .word ov13_02245734
	arm_func_end ov13_02237C84

	arm_func_start ov13_02237D78
ov13_02237D78: ; 0x02237D78
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _02237DC8 ; =ov13_022456B4
	ldr r0, _02237DCC ; =ov13_0224F574
	ldrb lr, [r1]
	ldrb ip, [r1, #1]
	ldrb r3, [r1, #2]
	ldrb r2, [r1, #3]
	ldrsb r1, [r0, #1]
	add r4, sp, #0
	strb lr, [sp]
	strb ip, [sp, #1]
	strb r3, [sp, #2]
	strb r2, [sp, #3]
	ldrb r1, [r4, r1]
	ldr r0, [r0, #4]
	mov r2, r1
	bl ov13_02239378
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_02237DC8: .word ov13_022456B4
_02237DCC: .word ov13_0224F574
	arm_func_end ov13_02237D78

	arm_func_start ov13_02237DD0
ov13_02237DD0: ; 0x02237DD0
	stmdb sp!, {r3, lr}
	ldr r0, _02237E54 ; =ov13_0224F57C
	mov r1, #0
	strb r1, [r0]
	bl ov13_02237E5C
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #0
	bne _02237E0C
	mov r0, #0x31
	sub r1, r0, #0x32
	mov r2, #0
	bl ov13_022277B8
_02237E0C:
	mov r0, #2
	bl ov13_02227964
	ldr r0, [sp]
	cmp r0, #0
	bne _02237E24
	bl ov13_02227E40
_02237E24:
	mov r0, #0x2c
	bl ov13_022279EC
	mov r0, #0
	bl ov13_02226F58
	bl ov13_02237F04
	mov r0, #0
	bl ov13_02227EB0
	mov r0, #0xc
	bl ov13_0223ABB8
	ldr r0, _02237E58 ; =ov13_02237F9C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02237E54: .word ov13_0224F57C
_02237E58: .word ov13_02237F9C
	arm_func_end ov13_02237DD0

	arm_func_start ov13_02237E5C
ov13_02237E5C: ; 0x02237E5C
	stmdb sp!, {r3, lr}
	ldr r0, _02237EE4 ; =ov13_022466C0
	ldr r1, _02237EE8 ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _02237EEC ; =ov13_022466D8
	ldr r1, _02237EF0 ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _02237EF4 ; =ov13_022466F0
	ldr r1, _02237EF8 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _02237EFC ; =0x04001008
	ldr r1, _02237F00 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02237EE4: .word ov13_022466C0
_02237EE8: .word GX_LoadBG2Char
_02237EEC: .word ov13_022466D8
_02237EF0: .word GX_LoadBGPltt
_02237EF4: .word ov13_022466F0
_02237EF8: .word GX_LoadBG2Scr
_02237EFC: .word 0x04001008
_02237F00: .word 0x0400000A
	arm_func_end ov13_02237E5C

	arm_func_start ov13_02237F04
ov13_02237F04: ; 0x02237F04
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	bl ov13_02239FF0
	mov r4, r0
	ldr r0, _02237F94 ; =ov13_02245778
	add r1, sp, #4
	mov r2, #0xc
	bl MIi_CpuCopy32
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #2
	moveq r0, #4
	streqb r0, [sp, #0xe]
	ldrneb r0, [r4, #0xf4]
	addne r0, r0, #1
	strneb r0, [sp, #0xe]
	add r0, sp, #4
	bl ov00_021FA75C
	cmp r0, #0
	bne _02237F60
	bl OS_Terminate
_02237F60:
	ldr r0, [sp]
	cmp r0, #0
	bne _02237F78
	ldrb r0, [r4, #0xf4]
	mov r1, r4
	bl ov00_021FAC20
_02237F78:
	mov r0, #0
	ldr r1, _02237F98 ; =ov13_0223813C
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02237F94: .word ov13_02245778
_02237F98: .word ov13_0223813C
	arm_func_end ov13_02237F04

	arm_func_start ov13_02237F9C
ov13_02237F9C: ; 0x02237F9C
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #0
	bne _02237FF8
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
_02237FF8:
	ldr r0, _02238004 ; =ov13_02238008
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238004: .word ov13_02238008
	arm_func_end ov13_02237F9C

	arm_func_start ov13_02238008
ov13_02238008: ; 0x02238008
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02238038 ; =ov13_0223803C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238038: .word ov13_0223803C
	arm_func_end ov13_02238008

	arm_func_start ov13_0223803C
ov13_0223803C: ; 0x0223803C
	stmdb sp!, {r3, lr}
	bl ov13_02238050
	bl ov13_02238054
	bl ov13_02238058
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0223803C

	arm_func_start ov13_02238050
ov13_02238050: ; 0x02238050
	bx lr
	arm_func_end ov13_02238050

	arm_func_start ov13_02238054
ov13_02238054: ; 0x02238054
	bx lr
	arm_func_end ov13_02238054

	arm_func_start ov13_02238058
ov13_02238058: ; 0x02238058
	bx lr
	arm_func_end ov13_02238058

	arm_func_start ov13_0223805C
ov13_0223805C: ; 0x0223805C
	stmdb sp!, {r3, lr}
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02238080 ; =ov13_02238084
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238080: .word ov13_02238084
	arm_func_end ov13_0223805C

	arm_func_start ov13_02238084
ov13_02238084: ; 0x02238084
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _022380A4 ; =ov13_022380A8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022380A4: .word ov13_022380A8
	arm_func_end ov13_02238084

	arm_func_start ov13_022380A8
ov13_022380A8: ; 0x022380A8
	stmdb sp!, {r4, lr}
	bl ov13_0223A7F4
	mov r4, r0
	bl ov00_021FAAC8
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl DWCi_BACKUPlGetWifi
	add r1, r4, #0xf0
	mov r2, #0xe
	bl MI_CpuCopy8
	bl DWCi_BACKUPlGetWifi
	add r1, r4, #0x1f0
	mov r2, #0xe
	bl MI_CpuCopy8
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _02238130 ; =ov13_0224F57C
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	mov r0, #0
	bne _02238120
	bl ov13_0222B8F8
	ldr r0, _02238134 ; =ov13_022327E0
	bl ov13_0222B8E8
	ldmia sp!, {r4, pc}
_02238120:
	bl ov13_0222B8F8
	ldr r0, _02238138 ; =ov13_022381CC
	bl ov13_0222B8E8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02238130: .word ov13_0224F57C
_02238134: .word ov13_022327E0
_02238138: .word ov13_022381CC
	arm_func_end ov13_022380A8

	arm_func_start ov13_0223813C
ov13_0223813C: ; 0x0223813C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl ov00_021FA904
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl ov13_02227F68
	bl ov13_0223AC20
	cmp r4, #0
	ble _02238178
	ldr r1, _022381A0 ; =ov13_0224F57C
	mov r2, #1
	mov r0, #0x11
	strb r2, [r1]
	bl ov13_0223ABB8
	b _02238188
_02238178:
	bl ov00_021FA9D4
	bl ov13_02232DF4
	mov r0, #0x12
	bl ov13_0223ABB8
_02238188:
	ldr r0, _022381A4 ; =ov13_0223805C
	bl ov13_0222B8E8
	mov r1, r5
	mov r0, #0
	bl ov13_022425D0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022381A0: .word ov13_0224F57C
_022381A4: .word ov13_0223805C
	arm_func_end ov13_0223813C

	arm_func_start ov13_022381A8
ov13_022381A8: ; 0x022381A8
	ldr ip, _022381B8 ; =ov13_0224128C
	mov r0, r1
	mov r1, #0x20
	bx ip
	.balign 4, 0
_022381B8: .word ov13_0224128C
	arm_func_end ov13_022381A8

	arm_func_start ov13_022381BC
ov13_022381BC: ; 0x022381BC
	ldr ip, _022381C8 ; =ov13_022412F4
	mov r0, r1
	bx ip
	.balign 4, 0
_022381C8: .word ov13_022412F4
	arm_func_end ov13_022381BC

	arm_func_start ov13_022381CC
ov13_022381CC: ; 0x022381CC
	stmdb sp!, {r3, lr}
	ldr r0, _022381F4 ; =ov13_0224F580
	mov r1, #0
	strb r1, [r0]
	bl ov13_022381FC
	mov r0, #0x2d
	bl ov13_022279EC
	ldr r0, _022381F8 ; =ov13_02238268
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022381F4: .word ov13_0224F580
_022381F8: .word ov13_02238268
	arm_func_end ov13_022381CC

	arm_func_start ov13_022381FC
ov13_022381FC: ; 0x022381FC
	stmdb sp!, {r3, lr}
	ldr r0, _02238258 ; =ov13_02246704
	ldr r1, _0223825C ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r2, _02238260 ; =0x04001008
	ldr r1, _02238264 ; =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238258: .word ov13_02246704
_0223825C: .word GX_LoadBG2Scr
_02238260: .word 0x04001008
_02238264: .word 0x0400000A
	arm_func_end ov13_022381FC

	arm_func_start ov13_02238268
ov13_02238268: ; 0x02238268
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02238298 ; =ov13_0223829C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238298: .word ov13_0223829C
	arm_func_end ov13_02238268

	arm_func_start ov13_0223829C
ov13_0223829C: ; 0x0223829C
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _022382BC ; =ov13_022382C0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022382BC: .word ov13_022382C0
	arm_func_end ov13_0223829C

	arm_func_start ov13_022382C0
ov13_022382C0: ; 0x022382C0
	stmdb sp!, {r3, lr}
	bl ov13_022383D0
	bl ov13_022382D0
	ldmia sp!, {r3, pc}
	arm_func_end ov13_022382C0

	arm_func_start ov13_022382D0
ov13_022382D0: ; 0x022382D0
	bx lr
	arm_func_end ov13_022382D0

	arm_func_start ov13_022382D4
ov13_022382D4: ; 0x022382D4
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #0
	beq _022382F4
	bl ov13_0223B1A0
_022382F4:
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02238328 ; =ov13_0223832C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238328: .word ov13_0223832C
	arm_func_end ov13_022382D4

	arm_func_start ov13_0223832C
ov13_0223832C: ; 0x0223832C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0223B6C8
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #0
	bne _022383BC
	mov r0, #0
	mov r1, r0
	bl ov13_0222B934
	ldr r0, _022383C8 ; =ov13_02232E04
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_022383BC:
	ldr r0, _022383CC ; =ov13_0222C44C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022383C8: .word ov13_02232E04
_022383CC: .word ov13_0222C44C
	arm_func_end ov13_0223832C

	arm_func_start ov13_022383D0
ov13_022383D0: ; 0x022383D0
	stmdb sp!, {r3, lr}
	ldr r0, _02238434 ; =ov13_0224F580
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0xb4
	ldmloia sp!, {r3, pc}
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B948
	bl ov13_0222B980
	cmp r0, #0
	beq _02238428
	cmp r0, #1
	bne _02238428
	ldr r0, [sp]
	cmp r0, #0
	beq _02238428
	ldr r0, _02238438 ; =ov13_0222C10C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02238428:
	ldr r0, _0223843C ; =ov13_022382D4
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238434: .word ov13_0224F580
_02238438: .word ov13_0222C10C
_0223843C: .word ov13_022382D4
	arm_func_end ov13_022383D0

	arm_func_start ov13_02238440
ov13_02238440: ; 0x02238440
	stmdb sp!, {r3, lr}
	bl ov13_02239B34
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B948
	bl ov13_02238498
	mov r0, #0x31
	sub r1, r0, #0x32
	mov r2, #0
	bl ov13_022277B8
	ldr r0, [sp]
	cmp r0, #2
	beq _02238478
	bl ov13_02227E40
_02238478:
	ldr r0, [sp]
	cmp r0, #1
	bne _02238488
	bl ov13_0223A4F4
_02238488:
	ldr r0, _02238494 ; =ov13_02238504
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238494: .word ov13_02238504
	arm_func_end ov13_02238440

	arm_func_start ov13_02238498
ov13_02238498: ; 0x02238498
	stmdb sp!, {r3, lr}
	ldr r0, _022384F4 ; =ov13_02246718
	ldr r1, _022384F8 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r2, _022384FC ; =0x04001008
	ldr r1, _02238500 ; =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022384F4: .word ov13_02246718
_022384F8: .word GX_LoadBG2Scr
_022384FC: .word 0x04001008
_02238500: .word 0x0400000A
	arm_func_end ov13_02238498

	arm_func_start ov13_02238504
ov13_02238504: ; 0x02238504
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EA8
	ldr r0, _02238554 ; =ov13_02238558
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238554: .word ov13_02238558
	arm_func_end ov13_02238504

	arm_func_start ov13_02238558
ov13_02238558: ; 0x02238558
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _022385D8 ; =ov13_02245784
	add r3, sp, #8
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	addne sp, sp, #0x14
	ldmneia sp!, {pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	addne sp, sp, #0x14
	ldmneia sp!, {pc}
	add r1, sp, #4
	mov r0, #0
	bl ov13_0222B948
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r3, [sp, #4]
	add r0, sp, #8
	ldr r0, [r0, r3, lsl #2]
	mov r2, r1
	sub r3, r1, #2
	bl ov13_0223BE6C
	ldr r0, _022385DC ; =ov13_022385E0
	bl ov13_0222B8E8
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.balign 4, 0
_022385D8: .word ov13_02245784
_022385DC: .word ov13_022385E0
	arm_func_end ov13_02238558

	arm_func_start ov13_022385E0
ov13_022385E0: ; 0x022385E0
	stmdb sp!, {r3, lr}
	bl ov13_0223861C
	bl ov13_02238620
	bl ov13_0223C1DC
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _02238618 ; =ov13_02238624
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238618: .word ov13_02238624
	arm_func_end ov13_022385E0

	arm_func_start ov13_0223861C
ov13_0223861C: ; 0x0223861C
	bx lr
	arm_func_end ov13_0223861C

	arm_func_start ov13_02238620
ov13_02238620: ; 0x02238620
	bx lr
	arm_func_end ov13_02238620

	arm_func_start ov13_02238624
ov13_02238624: ; 0x02238624
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02238654 ; =ov13_02238658
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238654: .word ov13_02238658
	arm_func_end ov13_02238624

	arm_func_start ov13_02238658
ov13_02238658: ; 0x02238658
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02238690 ; =ov13_02237DD0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238690: .word ov13_02237DD0
	arm_func_end ov13_02238658

	arm_func_start ov13_02238694
ov13_02238694: ; 0x02238694
	stmdb sp!, {r3, lr}
	ldr r0, _022386CC ; =ov13_0224F584
	mov r1, #0
	strb r1, [r0]
	bl ov13_022386D4
	mov r0, #8
	bl ov13_02227DE4
	mov r0, #0x29
	bl ov13_022279EC
	mov r0, #0x10
	bl ov13_0223ABB8
	ldr r0, _022386D0 ; =ov13_02238754
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022386CC: .word ov13_0224F584
_022386D0: .word ov13_02238754
	arm_func_end ov13_02238694

	arm_func_start ov13_022386D4
ov13_022386D4: ; 0x022386D4
	stmdb sp!, {r3, lr}
	ldr r0, _02238744 ; =ov13_0224672C
	ldr r1, _02238748 ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _0223874C ; =0x04001008
	ldr r1, _02238750 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238744: .word ov13_0224672C
_02238748: .word GX_LoadBG2Scr
_0223874C: .word 0x04001008
_02238750: .word 0x0400000A
	arm_func_end ov13_022386D4

	arm_func_start ov13_02238754
ov13_02238754: ; 0x02238754
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02238784 ; =ov13_02238788
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238784: .word ov13_02238788
	arm_func_end ov13_02238754

	arm_func_start ov13_02238788
ov13_02238788: ; 0x02238788
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _022387A8 ; =ov13_022387AC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022387A8: .word ov13_022387AC
	arm_func_end ov13_02238788

	arm_func_start ov13_022387AC
ov13_022387AC: ; 0x022387AC
	stmdb sp!, {r3, lr}
	bl ov13_0223886C
	bl ov13_022387BC
	ldmia sp!, {r3, pc}
	arm_func_end ov13_022387AC

	arm_func_start ov13_022387BC
ov13_022387BC: ; 0x022387BC
	bx lr
	arm_func_end ov13_022387BC

	arm_func_start ov13_022387C0
ov13_022387C0: ; 0x022387C0
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _022387F8 ; =ov13_022387FC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022387F8: .word ov13_022387FC
	arm_func_end ov13_022387C0

	arm_func_start ov13_022387FC
ov13_022387FC: ; 0x022387FC
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, #2
	bl ov13_0222B934
	ldr r0, _02238868 ; =ov13_02238440
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238868: .word ov13_02238440
	arm_func_end ov13_022387FC

	arm_func_start ov13_0223886C
ov13_0223886C: ; 0x0223886C
	stmdb sp!, {r3, lr}
	ldr r0, _02238898 ; =ov13_0224F584
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0x78
	ldmloia sp!, {r3, pc}
	ldr r0, _0223889C ; =ov13_022387C0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238898: .word ov13_0224F584
_0223889C: .word ov13_022387C0
	arm_func_end ov13_0223886C

	arm_func_start ov13_022388A0
ov13_022388A0: ; 0x022388A0
	stmdb sp!, {r3, lr}
	ldr r0, _022388E8 ; =ov13_0224F588
	mov r1, #0
	strb r1, [r0]
	bl ov13_022388F0
	mov r0, #8
	bl ov13_02227DE4
	mov r0, #0x38
	sub r1, r0, #0x39
	mov r2, #0
	bl ov13_022277B8
	mov r0, #1
	bl ov13_02227964
	mov r0, #0x27
	bl ov13_022279EC
	ldr r0, _022388EC ; =ov13_02238998
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022388E8: .word ov13_0224F588
_022388EC: .word ov13_02238998
	arm_func_end ov13_022388A0

	arm_func_start ov13_022388F0
ov13_022388F0: ; 0x022388F0
	stmdb sp!, {r3, lr}
	ldr r0, _02238978 ; =ov13_02246740
	ldr r1, _0223897C ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _02238980 ; =ov13_02246758
	ldr r1, _02238984 ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _02238988 ; =ov13_02246770
	ldr r1, _0223898C ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _02238990 ; =0x04001008
	ldr r1, _02238994 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238978: .word ov13_02246740
_0223897C: .word GX_LoadBG2Char
_02238980: .word ov13_02246758
_02238984: .word GX_LoadBGPltt
_02238988: .word ov13_02246770
_0223898C: .word GX_LoadBG2Scr
_02238990: .word 0x04001008
_02238994: .word 0x0400000A
	arm_func_end ov13_022388F0

	arm_func_start ov13_02238998
ov13_02238998: ; 0x02238998
	stmdb sp!, {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov13_022403B8
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #1
	mov r1, r0
	bl ov13_02240EA8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _022389E8 ; =ov13_022389EC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022389E8: .word ov13_022389EC
	arm_func_end ov13_02238998

	arm_func_start ov13_022389EC
ov13_022389EC: ; 0x022389EC
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_022279B4
	ldr r0, _02238A24 ; =ov13_02238A28
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238A24: .word ov13_02238A28
	arm_func_end ov13_022389EC

	arm_func_start ov13_02238A28
ov13_02238A28: ; 0x02238A28
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _02238A4C ; =ov13_02238A50
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238A4C: .word ov13_02238A50
	arm_func_end ov13_02238A28

	arm_func_start ov13_02238A50
ov13_02238A50: ; 0x02238A50
	stmdb sp!, {r3, lr}
	bl ov13_02238A64
	bl ov13_02238A9C
	bl ov13_02238AA0
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02238A50

	arm_func_start ov13_02238A64
ov13_02238A64: ; 0x02238A64
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _02238A80
	mov r0, #1
	bl ov13_0222726C
_02238A80:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02238A64

	arm_func_start ov13_02238A9C
ov13_02238A9C: ; 0x02238A9C
	bx lr
	arm_func_end ov13_02238A9C

	arm_func_start ov13_02238AA0
ov13_02238AA0: ; 0x02238AA0
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	beq _02238ABC
	cmp r0, #1
	beq _02238AC8
	ldmia sp!, {r3, pc}
_02238ABC:
	mov r0, #7
	bl ov13_0223ABB8
	b _02238ADC
_02238AC8:
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _02238AE8 ; =ov13_0224F588
	mov r1, #1
	strb r1, [r0]
_02238ADC:
	ldr r0, _02238AEC ; =ov13_02238AF0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238AE8: .word ov13_0224F588
_02238AEC: .word ov13_02238AF0
	arm_func_end ov13_02238AA0

	arm_func_start ov13_02238AF0
ov13_02238AF0: ; 0x02238AF0
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02238B0C ; =ov13_02238B10
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238B0C: .word ov13_02238B10
	arm_func_end ov13_02238AF0

	arm_func_start ov13_02238B10
ov13_02238B10: ; 0x02238B10
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227228
	ldr r0, _02238B6C ; =ov13_0224F588
	ldrb r0, [r0]
	cmp r0, #0
	bne _02238B4C
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
_02238B4C:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02238B70 ; =ov13_02238B74
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238B6C: .word ov13_0224F588
_02238B70: .word ov13_02238B74
	arm_func_end ov13_02238B10

	arm_func_start ov13_02238B74
ov13_02238B74: ; 0x02238B74
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02238C20 ; =ov13_0224F588
	ldrb r0, [r0]
	cmp r0, #0
	bne _02238BA8
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
_02238BA8:
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _02238C20 ; =ov13_0224F588
	ldrb r0, [r0]
	cmp r0, #0
	bne _02238BDC
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
_02238BDC:
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _02238C20 ; =ov13_0224F588
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	mov r0, #2
	bne _02238C10
	bl ov13_0222B8F8
	ldr r0, _02238C24 ; =ov13_022368D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02238C10:
	bl ov13_0222B8F8
	ldr r0, _02238C28 ; =ov13_02238C4C
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238C20: .word ov13_0224F588
_02238C24: .word ov13_022368D8
_02238C28: .word ov13_02238C4C
	arm_func_end ov13_02238B74

	arm_func_start ov13_02238C2C
ov13_02238C2C: ; 0x02238C2C
	ldr r0, _02238C48 ; =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.balign 4, 0
_02238C48: .word 0x027FFFA8
	arm_func_end ov13_02238C2C

	arm_func_start ov13_02238C4C
ov13_02238C4C: ; 0x02238C4C
	stmdb sp!, {lr}
	sub sp, sp, #0x6c
	ldr r0, _02238CD4 ; =ov13_0224F58C
	mov r1, #0
	strb r1, [r0]
	bl ov13_02238CE0
	mov r0, #8
	bl ov13_02227DE4
	mov r0, #2
	bl ov13_02227964
	add r0, sp, #0x16
	bl OS_GetOwnerInfo
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x16
	bl MIi_CpuClear16
	ldrh r2, [sp, #0x30]
	add r0, sp, #0x1a
	add r1, sp, #0
	mov r2, r2, lsl #1
	bl MIi_CpuCopy16
	add r0, sp, #0
	mov r1, #0x28
	bl ov13_02227A60
	mov r0, #0
	bl ov13_02226F58
	ldr r0, _02238CD8 ; =ov13_0223902C
	bl ov13_0223B788
	mov r0, #0xb
	bl ov13_0223ABB8
	ldr r0, _02238CDC ; =ov13_02238D88
	bl ov13_0222B8E8
	add sp, sp, #0x6c
	ldmia sp!, {pc}
	.balign 4, 0
_02238CD4: .word ov13_0224F58C
_02238CD8: .word ov13_0223902C
_02238CDC: .word ov13_02238D88
	arm_func_end ov13_02238C4C

	arm_func_start ov13_02238CE0
ov13_02238CE0: ; 0x02238CE0
	stmdb sp!, {r3, lr}
	ldr r0, _02238D68 ; =ov13_02246784
	ldr r1, _02238D6C ; =GX_LoadBG2Char
	bl ov13_02227924
	ldr r0, _02238D70 ; =ov13_0224679C
	ldr r1, _02238D74 ; =GX_LoadBGPltt
	bl ov13_02227924
	ldr r0, _02238D78 ; =ov13_022467B4
	ldr r1, _02238D7C ; =GX_LoadBG2Scr
	bl ov13_02227924
	ldr r3, _02238D80 ; =0x04001008
	ldr r1, _02238D84 ; =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238D68: .word ov13_02246784
_02238D6C: .word GX_LoadBG2Char
_02238D70: .word ov13_0224679C
_02238D74: .word GX_LoadBGPltt
_02238D78: .word ov13_022467B4
_02238D7C: .word GX_LoadBG2Scr
_02238D80: .word 0x04001008
_02238D84: .word 0x0400000A
	arm_func_end ov13_02238CE0

	arm_func_start ov13_02238D88
ov13_02238D88: ; 0x02238D88
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02238DB8 ; =ov13_02238DBC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238DB8: .word ov13_02238DBC
	arm_func_end ov13_02238D88

	arm_func_start ov13_02238DBC
ov13_02238DBC: ; 0x02238DBC
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #2
	bl ov13_022279B4
	ldr r0, _02238DE4 ; =ov13_02238DE8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238DE4: .word ov13_02238DE8
	arm_func_end ov13_02238DBC

	arm_func_start ov13_02238DE8
ov13_02238DE8: ; 0x02238DE8
	stmdb sp!, {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov13_022272CC
	ldr r0, _02238E0C ; =ov13_02238E10
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238E0C: .word ov13_02238E10
	arm_func_end ov13_02238DE8

	arm_func_start ov13_02238E10
ov13_02238E10: ; 0x02238E10
	stmdb sp!, {r3, lr}
	bl ov13_02238E24
	bl ov13_02238E5C
	bl ov13_02238E60
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02238E10

	arm_func_start ov13_02238E24
ov13_02238E24: ; 0x02238E24
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _02238E44
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
_02238E44:
	bl ov13_02238C2C
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02238E24

	arm_func_start ov13_02238E5C
ov13_02238E5C: ; 0x02238E5C
	bx lr
	arm_func_end ov13_02238E5C

	arm_func_start ov13_02238E60
ov13_02238E60: ; 0x02238E60
	stmdb sp!, {r3, lr}
	ldr r0, _02238EA4 ; =ov13_0224F58C
	ldrb r0, [r0]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227258
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02238EA4 ; =ov13_0224F58C
	mov r1, #2
	strb r1, [r0]
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _02238EA8 ; =ov13_02238EAC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238EA4: .word ov13_0224F58C
_02238EA8: .word ov13_02238EAC
	arm_func_end ov13_02238E60

	arm_func_start ov13_02238EAC
ov13_02238EAC: ; 0x02238EAC
	stmdb sp!, {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02238EC8 ; =ov13_02238ECC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238EC8: .word ov13_02238ECC
	arm_func_end ov13_02238EAC

	arm_func_start ov13_02238ECC
ov13_02238ECC: ; 0x02238ECC
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02227228
	ldr r0, _02238F30 ; =ov13_0224F58C
	ldrb r0, [r0]
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02238F10
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov13_022403B8
_02238F10:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02238F34 ; =ov13_02238F38
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02238F30: .word ov13_0224F58C
_02238F34: .word ov13_02238F38
	arm_func_end ov13_02238ECC

	arm_func_start ov13_02238F38
ov13_02238F38: ; 0x02238F38
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0223901C ; =ov13_0224F58C
	ldrb r0, [r0]
	cmp r0, #2
	bne _02238F6C
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	ldmneia sp!, {r3, pc}
_02238F6C:
	bl ov13_022272A0
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov13_0223B940
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0223901C ; =ov13_0224F58C
	ldrb r0, [r0]
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02238FB0
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
_02238FB0:
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _0223901C ; =ov13_0224F58C
	ldrb r0, [r0]
	cmp r0, #2
	bne _02238FE4
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02239020 ; =ov13_022368D8
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02238FE4:
	cmp r0, #3
	bne _02239004
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02239024 ; =ov13_022388A0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_02239004:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _02239028 ; =ov13_02238694
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223901C: .word ov13_0224F58C
_02239020: .word ov13_022368D8
_02239024: .word ov13_022388A0
_02239028: .word ov13_02238694
	arm_func_end ov13_02238F38

	arm_func_start ov13_0223902C
ov13_0223902C: ; 0x0223902C
	stmdb sp!, {r3, lr}
	ldr r1, _02239108 ; =ov13_0224F58C
	ldrb r2, [r1]
	cmp r2, #0
	ldmneia sp!, {r3, pc}
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_0223904C: ; jump table
	b _0223905C ; case 0
	b _0223909C ; case 1
	b _022390B4 ; case 2
	b _022390E8 ; case 3
_0223905C:
	mov r0, #3
	strb r0, [r1]
	bl ov13_0223AC20
	mov r0, #0x12
	bl ov13_0223ABB8
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0x10
	str ip, [sp]
	bl ov13_0223BE6C
	bl ov13_022272E4
	ldr r0, _0223910C ; =ov13_02239118
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_0223909C:
	mov r0, #1
	strb r0, [r1]
	bl ov13_0223AC20
	ldr r0, _02239110 ; =ov13_02238EAC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_022390B4:
	bl ov13_0223AC20
	mov r0, #0
	bl ov13_0223BA24
	mov r2, #1
	mov r1, #0
	sub r3, r2, #2
	mov r0, #0x11
	str r1, [sp]
	bl ov13_0223BE6C
	bl ov13_022272E4
	ldr r0, _02239114 ; =ov13_02239164
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_022390E8:
	mov r0, #2
	strb r0, [r1]
	bl ov13_0223AC20
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02239110 ; =ov13_02238EAC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02239108: .word ov13_0224F58C
_0223910C: .word ov13_02239118
_02239110: .word ov13_02238EAC
_02239114: .word ov13_02239164
	arm_func_end ov13_0223902C

	arm_func_start ov13_02239118
ov13_02239118: ; 0x02239118
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _02239140 ; =ov13_02239144
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02239140: .word ov13_02239144
	arm_func_end ov13_02239118

	arm_func_start ov13_02239144
ov13_02239144: ; 0x02239144
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02239160 ; =ov13_02238EAC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02239160: .word ov13_02238EAC
	arm_func_end ov13_02239144

	arm_func_start ov13_02239164
ov13_02239164: ; 0x02239164
	stmdb sp!, {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	beq _02239194
	cmp r0, #1
	ldmneia sp!, {r3, pc}
	ldr r1, _022391B8 ; =ov13_0224F58C
	mov r2, #3
	mov r0, #6
	strb r2, [r1]
	bl ov13_0223ABB8
	b _022391A8
_02239194:
	ldr r1, _022391B8 ; =ov13_0224F58C
	mov r2, #1
	mov r0, #7
	strb r2, [r1]
	bl ov13_0223ABB8
_022391A8:
	bl ov13_0223C198
	ldr r0, _022391BC ; =ov13_022391C0
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022391B8: .word ov13_0224F58C
_022391BC: .word ov13_022391C0
	arm_func_end ov13_02239164

	arm_func_start ov13_022391C0
ov13_022391C0: ; 0x022391C0
	stmdb sp!, {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02239218 ; =ov13_0224F58C
	ldrb r0, [r0]
	cmp r0, #1
	bne _022391EC
	ldr r0, _0223921C ; =ov13_02238EAC
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
_022391EC:
	mov r0, #0xb
	bl ov13_0223ABB8
	bl ov13_022272CC
	ldr r1, _02239218 ; =ov13_0224F58C
	mov r2, #0
	ldr r0, _02239220 ; =ov13_0223902C
	strb r2, [r1]
	bl ov13_0223BA24
	ldr r0, _02239224 ; =ov13_02238E10
	bl ov13_0222B8E8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02239218: .word ov13_0224F58C
_0223921C: .word ov13_02238EAC
_02239220: .word ov13_0223902C
_02239224: .word ov13_02238E10
	arm_func_end ov13_022391C0

	arm_func_start ov13_02239228
ov13_02239228: ; 0x02239228
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0223927C ; =0x00000608
	mov r1, #4
	bl ov13_0224128C
	mov ip, r0
	ldr r3, _02239280 ; =ov13_0224F590
	mov r0, r4
	add r1, ip, #4
	mov r2, #0x600
	str ip, [r3]
	bl MIi_CpuCopyFast
	ldr r1, _02239284 ; =ov13_02239324
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02239280 ; =ov13_0224F590
	ldr r1, [r1]
	str r0, [r1]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223927C: .word 0x00000608
_02239280: .word ov13_0224F590
_02239284: .word ov13_02239324
	arm_func_end ov13_02239228

	arm_func_start ov13_02239288
ov13_02239288: ; 0x02239288
	stmdb sp!, {r3, lr}
	ldr r1, _022392AC ; =ov13_0224F590
	mov r0, #1
	ldr r1, [r1]
	ldr r1, [r1]
	bl ov13_022425F0
	ldr r0, _022392B0 ; =ov13_0224F590
	bl ov13_022412B0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022392AC: .word ov13_0224F590
_022392B0: .word ov13_0224F590
	arm_func_end ov13_02239288

	arm_func_start ov13_022392B4
ov13_022392B4: ; 0x022392B4
	ldr r0, _022392C8 ; =ov13_0224F590
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x604]
	bx lr
	.balign 4, 0
_022392C8: .word ov13_0224F590
	arm_func_end ov13_022392B4

	arm_func_start ov13_022392CC
ov13_022392CC: ; 0x022392CC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr ip, _02239320 ; =ov13_0224F590
	mov r7, r3
	ldr r3, [ip]
	mov r8, r0
	add r0, r3, #4
	add r4, r0, r1, lsl #1
	mov r5, #0
	cmp r7, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
	mov r6, r2, lsl #1
_022392F8:
	mov r0, r8
	mov r1, r4
	mov r2, r6
	bl MIi_CpuCopy16
	add r5, r5, #1
	cmp r5, r7
	add r8, r8, #0x40
	add r4, r4, #0x40
	blt _022392F8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02239320: .word ov13_0224F590
	arm_func_end ov13_022392CC

	arm_func_start ov13_02239324
ov13_02239324: ; 0x02239324
	stmdb sp!, {r3, lr}
	ldr r0, _02239374 ; =ov13_0224F590
	ldr r1, [r0]
	ldrb r0, [r1, #0x604]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r1, #4
	mov r1, #0x600
	bl DC_FlushRange
	ldr r0, _02239374 ; =ov13_0224F590
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x600
	add r0, r0, #4
	bl GX_LoadBG2Scr
	ldr r0, _02239374 ; =ov13_0224F590
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x604]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02239374: .word ov13_0224F590
	arm_func_end ov13_02239324

	arm_func_start ov13_02239378
ov13_02239378: ; 0x02239378
	stmdb sp!, {r3, lr}
	ldr ip, _022393AC ; =ov13_0224F590
	add r3, r0, r1, lsl #5
	mov r0, r2, lsl #5
	ldr r1, _022393B0 ; =ov13_022393B4
	str r3, [ip, #4]
	add lr, r0, #0x5000000
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	str lr, [ip, #8]
	bl ov13_02242528
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022393AC: .word ov13_0224F590
_022393B0: .word ov13_022393B4
	arm_func_end ov13_02239378

	arm_func_start ov13_022393B4
ov13_022393B4: ; 0x022393B4
	stmdb sp!, {r4, lr}
	ldr r1, _022393DC ; =ov13_0224F590
	mov r4, r0
	mov r2, #0x20
	ldmib r1, {r0, r1}
	bl MIi_CpuCopy16
	mov r1, r4
	mov r0, #1
	bl ov13_022425D0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022393DC: .word ov13_0224F590
	arm_func_end ov13_022393B4

	arm_func_start ov13_022393E0
ov13_022393E0: ; 0x022393E0
	ldr r2, _02239400 ; =ov13_0224F590
	ldr ip, _02239404 ; =ov13_02242528
	str r0, [r2, #4]
	ldr r1, _02239408 ; =ov13_0223940C
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bx ip
	.balign 4, 0
_02239400: .word ov13_0224F590
_02239404: .word ov13_02242528
_02239408: .word ov13_0223940C
	arm_func_end ov13_022393E0

	arm_func_start ov13_0223940C
ov13_0223940C: ; 0x0223940C
	stmdb sp!, {r4, lr}
	ldr r1, _02239438 ; =ov13_0224F590
	mov r4, r0
	ldr r0, [r1, #4]
	mov r1, #0x5000000
	mov r2, #0x200
	bl MIi_CpuCopy16
	mov r1, r4
	mov r0, #1
	bl ov13_022425D0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02239438: .word ov13_0224F590
	arm_func_end ov13_0223940C

	arm_func_start ov13_0223943C
ov13_0223943C: ; 0x0223943C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r7, r1
	mov r0, #0x20
	mov r1, #4
	mov r5, r2
	mov r4, r3
	bl ov13_0224128C
	ldr r2, _02239508 ; =ov13_0224F59C
	ldr ip, [sp, #0x18]
	str r0, [r2]
	strb r6, [r0, #0x1b]
	ldr r1, [r2]
	mov r0, r5
	strb r7, [r1, #0x19]
	ldr r3, [r2]
	mov r1, r4
	strb ip, [r3, #0x1a]
	ldr r2, [r2]
	add r2, r2, #0x10
	bl ov13_02240E50
	ldr r1, _0223950C ; =ov13_02245790
	mov r0, #0
	ldrb r1, [r1, r6]
	mov r2, #1
	bl ov13_022401B0
	mov r2, r5
	ldr r5, _02239508 ; =ov13_0224F59C
	ldr r3, [sp, #0x18]
	ldr r6, [r5]
	mvn r1, #0
	str r0, [r6]
	ldr r0, [r5]
	add r3, r4, r3
	ldr r0, [r0]
	bl ov13_0223FF18
	mov r0, r5
	ldr r0, [r0]
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #1
	bl ov13_02240008
	mov r0, #0
	ldr r1, _02239510 ; =ov13_022395B4
	mov r2, r0
	mov r3, #0x80
	bl ov13_02242528
	mov r1, r5
	ldr r1, [r1]
	str r0, [r1, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02239508: .word ov13_0224F59C
_0223950C: .word ov13_02245790
_02239510: .word ov13_022395B4
	arm_func_end ov13_0223943C

	arm_func_start ov13_02239514
ov13_02239514: ; 0x02239514
	stmdb sp!, {r3, lr}
	ldr r1, _02239548 ; =ov13_0224F59C
	mov r0, #0
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	bl ov13_022425F0
	ldr r0, _02239548 ; =ov13_0224F59C
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov13_0223FD60
	ldr r0, _0223954C ; =ov13_0224F59C
	bl ov13_022412B0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02239548: .word ov13_0224F59C
_0223954C: .word ov13_0224F59C
	arm_func_end ov13_02239514

	arm_func_start ov13_02239550
ov13_02239550: ; 0x02239550
	ldr r0, _02239560 ; =ov13_0224F59C
	ldr r0, [r0]
	ldrb r0, [r0, #0x1a]
	bx lr
	.balign 4, 0
_02239560: .word ov13_0224F59C
	arm_func_end ov13_02239550

	arm_func_start ov13_02239564
ov13_02239564: ; 0x02239564
	ldr r0, _02239574 ; =ov13_0224F59C
	ldr r0, [r0]
	ldrb r0, [r0, #0x1d]
	bx lr
	.balign 4, 0
_02239574: .word ov13_0224F59C
	arm_func_end ov13_02239564

	arm_func_start ov13_02239578
ov13_02239578: ; 0x02239578
	ldr ip, _02239580 ; =ov13_02239AC4
	bx ip
	.balign 4, 0
_02239580: .word ov13_02239AC4
	arm_func_end ov13_02239578

	arm_func_start ov13_02239584
ov13_02239584: ; 0x02239584
	ldr r0, _02239598 ; =ov13_0224F59C
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x1e]
	bx lr
	.balign 4, 0
_02239598: .word ov13_0224F59C
	arm_func_end ov13_02239584

	arm_func_start ov13_0223959C
ov13_0223959C: ; 0x0223959C
	ldr r0, _022395B0 ; =ov13_0224F59C
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x1e]
	bx lr
	.balign 4, 0
_022395B0: .word ov13_0224F59C
	arm_func_end ov13_0223959C

	arm_func_start ov13_022395B4
ov13_022395B4: ; 0x022395B4
	stmdb sp!, {r3, lr}
	ldr r0, _02239734 ; =ov13_0224F59C
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x1d]
	ldr r1, [r0]
	ldrb r0, [r1, #0x1c]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_022395DC: ; jump table
	b _022395EC ; case 0
	b _0223969C ; case 1
	b _022396A4 ; case 2
	b _022396EC ; case 3
_022395EC:
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_02239914
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_02239608: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _0223961C ; case 1
	b _0223967C ; case 2
	b _02239688 ; case 3
	b _02239694 ; case 4
_0223961C:
	ldr r0, _02239734 ; =ov13_0224F59C
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x16
	bl ov13_0223ABB8
	mov r0, #0
	bl ov13_0223ABDC
	ldr r0, _02239734 ; =ov13_0224F59C
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x1d]
	ldr r0, [r0]
	add r0, r0, #0x14
	bl ov13_022419DC
	ldr r0, _02239734 ; =ov13_0224F59C
	mov r1, #1
	ldr r3, [r0]
	ldrb r2, [r3, #0x1a]
	strb r2, [r3, #0x18]
	ldr r0, [r0]
	strb r1, [r0, #0x1c]
	ldmia sp!, {r3, pc}
_0223967C:
	mov r0, #2
	bl ov13_02239880
	ldmia sp!, {r3, pc}
_02239688:
	mov r0, #3
	bl ov13_02239880
	ldmia sp!, {r3, pc}
_02239694:
	bl ov13_022398AC
	ldmia sp!, {r3, pc}
_0223969C:
	bl ov13_02239738
	ldmia sp!, {r3, pc}
_022396A4:
	mov r0, #2
	bl ov13_022399A0
	cmp r0, #2
	beq _022396D4
	ldr r0, _02239734 ; =ov13_0224F59C
	mov r3, #5
	ldr r2, [r0]
	mov r1, #0
	strb r3, [r2, #0x1d]
	ldr r0, [r0]
	strb r1, [r0, #0x1c]
	ldmia sp!, {r3, pc}
_022396D4:
	bl ov13_02239914
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	mov r0, #2
	bl ov13_02239880
	ldmia sp!, {r3, pc}
_022396EC:
	mov r0, #3
	bl ov13_022399A0
	cmp r0, #3
	beq _0223971C
	ldr r0, _02239734 ; =ov13_0224F59C
	mov r3, #7
	ldr r2, [r0]
	mov r1, #0
	strb r3, [r2, #0x1d]
	ldr r0, [r0]
	strb r1, [r0, #0x1c]
	ldmia sp!, {r3, pc}
_0223971C:
	bl ov13_02239914
	cmp r0, #3
	ldmneia sp!, {r3, pc}
	mov r0, #3
	bl ov13_02239880
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02239734: .word ov13_0224F59C
	arm_func_end ov13_022395B4

	arm_func_start ov13_02239738
ov13_02239738: ; 0x02239738
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _022397FC ; =ov13_02245958
	bl ov13_02241754
	cmp r0, #0
	beq _022397D4
	add r0, sp, #0
	bl ov13_022419DC
	ldr r0, _02239800 ; =ov13_0224F59C
	ldrh r1, [sp]
	ldr r3, [r0]
	ldrh r0, [r3, #0x10]
	sub r0, r0, #0x1e
	cmp r1, r0
	blt _022397D4
	ldrh r1, [sp, #2]
	ldrh r0, [r3, #0x16]
	ldrb r2, [r3, #0x18]
	sub r0, r1, r0
	adds r4, r2, r0
	movmi r4, #0
	bmi _022397AC
	ldrb r1, [r3, #0x1b]
	ldr r0, _02239804 ; =ov13_02245794
	ldrb r2, [r3, #0x19]
	ldrb r0, [r0, r1]
	sub r0, r2, r0
	cmp r4, r0
	movge r4, r0
_022397AC:
	mov r0, r4
	bl ov13_02239808
	mov r0, r4
	bl ov13_02239AC4
	ldr r0, _02239800 ; =ov13_0224F59C
	mov r1, #2
	ldr r0, [r0]
	add sp, sp, #4
	strb r1, [r0, #0x1d]
	ldmia sp!, {r3, r4, pc}
_022397D4:
	bl ov13_0223AC20
	ldr r0, _02239800 ; =ov13_0224F59C
	mov r3, #0
	ldr r2, [r0]
	mov r1, #3
	strb r3, [r2, #0x1c]
	ldr r0, [r0]
	strb r1, [r0, #0x1d]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_022397FC: .word ov13_02245958
_02239800: .word ov13_0224F59C
_02239804: .word ov13_02245794
	arm_func_end ov13_02239738

	arm_func_start ov13_02239808
ov13_02239808: ; 0x02239808
	stmdb sp!, {r4, lr}
	ldr r1, _02239878 ; =ov13_0224F59C
	ldr r1, [r1]
	ldrb r1, [r1, #0x1a]
	subs r4, r1, r0
	rsbmi r4, r4, #0
	cmp r4, #2
	movlt r0, #0
	blt _02239840
	cmp r4, #6
	mov r0, #0x7f
	bge _02239840
	rsb r1, r4, #6
	bl FX_DivS32
_02239840:
	bl ov13_0223ABDC
	cmp r4, #2
	mvnlt r1, #0xff
	blt _0223986C
	cmp r4, #6
	movge r1, #0x100
	bge _0223986C
	rsb r1, r4, #6
	mov r0, #0x200
	bl FX_DivS32
	sub r1, r0, #0x100
_0223986C:
	ldr r0, _0223987C ; =0x0000FFFF
	bl ov13_0223ABFC
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02239878: .word ov13_0224F59C
_0223987C: .word 0x0000FFFF
	arm_func_end ov13_02239808

	arm_func_start ov13_02239880
ov13_02239880: ; 0x02239880
	ldr r1, _022398A8 ; =ov13_0224F59C
	cmp r0, #2
	ldr r1, [r1]
	strb r0, [r1, #0x1c]
	ldr r0, _022398A8 ; =ov13_0224F59C
	moveq r1, #4
	ldr r0, [r0]
	movne r1, #6
	strb r1, [r0, #0x1d]
	bx lr
	.balign 4, 0
_022398A8: .word ov13_0224F59C
	arm_func_end ov13_02239880

	arm_func_start ov13_022398AC
ov13_022398AC: ; 0x022398AC
	stmdb sp!, {r3, lr}
	add r0, sp, #0
	bl ov13_022419DC
	ldr r0, _0223990C ; =ov13_0224F59C
	ldr r2, _02239910 ; =ov13_02245794
	ldr ip, [r0]
	ldrh r1, [sp, #2]
	ldrb r3, [ip, #0x1b]
	ldrh r0, [ip, #0x12]
	ldrb r2, [r2, r3]
	sub r0, r1, r0
	subs r0, r0, r2, lsr #1
	movmi r0, #0
	bmi _022398F4
	ldrb r1, [ip, #0x19]
	sub r1, r1, r2
	cmp r0, r1
	movge r0, r1
_022398F4:
	bl ov13_02239AC4
	ldr r0, _0223990C ; =ov13_0224F59C
	mov r1, #3
	ldr r0, [r0]
	strb r1, [r0, #0x1d]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223990C: .word ov13_0224F59C
_02239910: .word ov13_02245794
	arm_func_end ov13_022398AC

	arm_func_start ov13_02239914
ov13_02239914: ; 0x02239914
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	add r1, sp, #0
	mov r0, #1
	bl ov13_022399EC
	add r0, sp, #0
	bl ov13_02241864
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	mov r5, #2
	add r4, sp, #0
_02239948:
	mov r0, r5
	mov r1, r4
	bl ov13_022399EC
	mov r0, r4
	bl ov13_02241864
	cmp r0, #0
	addne sp, sp, #8
	movne r0, r5
	ldmneia sp!, {r3, r4, r5, pc}
	add r5, r5, #1
	cmp r5, #3
	ble _02239948
	add r1, sp, #0
	mov r0, #4
	bl ov13_022399EC
	add r0, sp, #0
	bl ov13_022417DC
	cmp r0, #0
	movne r0, #4
	moveq r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov13_02239914

	arm_func_start ov13_022399A0
ov13_022399A0: ; 0x022399A0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, #2
	add r4, sp, #0
_022399B0:
	mov r0, r5
	mov r1, r4
	bl ov13_022399EC
	mov r0, r4
	bl ov13_02241754
	cmp r0, #0
	addne sp, sp, #8
	movne r0, r5
	ldmneia sp!, {r3, r4, r5, pc}
	add r5, r5, #1
	cmp r5, #3
	ble _022399B0
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov13_022399A0

	arm_func_start ov13_022399EC
ov13_022399EC: ; 0x022399EC
	ldr r2, _02239ABC ; =ov13_0224F59C
	cmp r0, #4
	ldr r3, [r2]
	ldrh r3, [r3, #0x10]
	strh r3, [r1]
	add r3, r3, #0xc
	strh r3, [r1, #4]
	addls pc, pc, r0, lsl #2
	bx lr
_02239A10: ; jump table
	bx lr ; case 0
	b _02239A24 ; case 1
	b _02239A58 ; case 2
	b _02239A78 ; case 3
	b _02239A9C ; case 4
_02239A24:
	ldr r3, [r2]
	ldr r0, _02239AC0 ; =ov13_02245794
	ldrh ip, [r3, #0x12]
	ldrb r3, [r3, #0x1a]
	add r3, ip, r3
	strh r3, [r1, #2]
	ldr r2, [r2]
	ldrh r3, [r1, #2]
	ldrb r2, [r2, #0x1b]
	ldrb r0, [r0, r2]
	add r0, r3, r0
	strh r0, [r1, #6]
	bx lr
_02239A58:
	ldr r0, [r2]
	ldrh r0, [r0, #0x12]
	sub r0, r0, #0xd
	strh r0, [r1, #2]
	ldr r0, [r2]
	ldrh r0, [r0, #0x12]
	strh r0, [r1, #6]
	bx lr
_02239A78:
	ldr r0, [r2]
	ldrh r2, [r0, #0x12]
	ldrb r0, [r0, #0x19]
	add r0, r2, r0
	strh r0, [r1, #2]
	ldrh r0, [r1, #2]
	add r0, r0, #0xd
	strh r0, [r1, #6]
	bx lr
_02239A9C:
	ldr r0, [r2]
	ldrh r3, [r0, #0x12]
	strh r3, [r1, #2]
	ldr r0, [r2]
	ldrb r0, [r0, #0x19]
	add r0, r3, r0
	strh r0, [r1, #6]
	bx lr
	.balign 4, 0
_02239ABC: .word ov13_0224F59C
_02239AC0: .word ov13_02245794
	arm_func_end ov13_022399EC

	arm_func_start ov13_02239AC4
ov13_02239AC4: ; 0x02239AC4
	stmdb sp!, {r4, lr}
	ldr r1, _02239AFC ; =ov13_0224F59C
	mov r4, r0
	ldr r0, [r1]
	mvn r1, #0
	ldrh r3, [r0, #0x12]
	ldrh r2, [r0, #0x10]
	ldr r0, [r0]
	add r3, r4, r3
	bl ov13_0223FF18
	ldr r0, _02239AFC ; =ov13_0224F59C
	ldr r0, [r0]
	strb r4, [r0, #0x1a]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02239AFC: .word ov13_0224F59C
	arm_func_end ov13_02239AC4

	arm_func_start ov13_02239B00
ov13_02239B00: ; 0x02239B00
	stmdb sp!, {r3, lr}
	ldr r0, _02239B2C ; =ov13_0224F5A0
	ldr r0, [r0]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02239B30 ; =0x00001E60
	mov r1, #0x20
	bl ov13_0224128C
	ldr r1, _02239B2C ; =ov13_0224F5A0
	str r0, [r1]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02239B2C: .word ov13_0224F5A0
_02239B30: .word 0x00001E60
	arm_func_end ov13_02239B00

	arm_func_start ov13_02239B34
ov13_02239B34: ; 0x02239B34
	stmdb sp!, {r3, lr}
	ldr r0, _02239B60 ; =ov13_0224F5A0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
_02239B48:
	bl WM_GetAllowedChannel
	cmp r0, #0x8000
	bne _02239B48
	ldr r0, _02239B64 ; =ov13_0224F5A0
	bl ov13_022412B0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02239B60: .word ov13_0224F5A0
_02239B64: .word ov13_0224F5A0
	arm_func_end ov13_02239B34

	arm_func_start ov13_02239B68
ov13_02239B68: ; 0x02239B68
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02239C28 ; =ov13_0224F5A0
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x348
	add r1, r1, #0x1300
	bl MIi_CpuClear16
	ldr r0, _02239C28 ; =ov13_0224F5A0
	ldr r1, _02239C2C ; =ov13_02239D60
	ldr r0, [r0]
	mov r2, #3
	bl WM_Initialize
	cmp r0, #2
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r4, _02239C28 ; =ov13_0224F5A0
_02239BA8:
	ldr r0, [r4]
	add r0, r0, #0x28c
	add r0, r0, #0x1400
	bl WM_ReadStatus
	ldr ip, [r4]
	add r0, ip, #0x1600
	ldrh r0, [r0, #0x8c]
	cmp r0, #2
	bne _02239BA8
	add r0, ip, #0x248
	ldr r5, _02239C30 ; =ov13_022457A4
	add lr, r0, #0x1400
	mov r4, #4
_02239BDC:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _02239BDC
	ldr r0, [r5]
	add r1, ip, #0xf00
	str r0, [lr]
	add r0, ip, #0x1000
	str r1, [r0, #0x648]
	bl WM_GetDispersionScanPeriod
	ldr r1, _02239C28 ; =ov13_0224F5A0
	ldr r1, [r1]
	add r1, r1, #0x1600
	strh r0, [r1, #0x50]
	bl ov13_02239C34
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02239C28: .word ov13_0224F5A0
_02239C2C: .word ov13_02239D60
_02239C30: .word ov13_022457A4
	arm_func_end ov13_02239B68

	arm_func_start ov13_02239C34
ov13_02239C34: ; 0x02239C34
	stmdb sp!, {r3, lr}
	ldr r1, _02239C60 ; =ov13_0224F5A0
	ldr r0, _02239C64 ; =ov13_02239D60
	ldr r1, [r1]
	add r1, r1, #0x248
	add r1, r1, #0x1400
	bl WM_StartScanEx
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02239C60: .word ov13_0224F5A0
_02239C64: .word ov13_02239D60
	arm_func_end ov13_02239C34

	arm_func_start ov13_02239C68
ov13_02239C68: ; 0x02239C68
	stmdb sp!, {r4, lr}
	ldr r1, _02239CFC ; =ov13_0224F5A0
	mov r2, #1
	ldr r0, [r1]
	add r0, r0, #0x1000
	strb r2, [r0, #0xe5c]
	ldr r0, [r1]
	add r0, r0, #0x28c
	add r0, r0, #0x1400
	bl WM_ReadStatus
	ldr r0, _02239CFC ; =ov13_0224F5A0
	ldr r0, [r0]
	add r0, r0, #0x1600
	ldrh r0, [r0, #0x8c]
	cmp r0, #2
	beq _02239CE4
	ldr r0, _02239D00 ; =ov13_02239D60
	bl WM_Reset
	cmp r0, #2
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r4, _02239CFC ; =ov13_0224F5A0
_02239CC0:
	ldr r0, [r4]
	add r0, r0, #0x28c
	add r0, r0, #0x1400
	bl WM_ReadStatus
	ldr r0, [r4]
	add r0, r0, #0x1600
	ldrh r0, [r0, #0x8c]
	cmp r0, #2
	bne _02239CC0
_02239CE4:
	ldr r0, _02239D00 ; =ov13_02239D60
	bl WM_End
	cmp r0, #2
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02239CFC: .word ov13_0224F5A0
_02239D00: .word ov13_02239D60
	arm_func_end ov13_02239C68

	arm_func_start ov13_02239D04
ov13_02239D04: ; 0x02239D04
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _02239D58 ; =ov13_0224F5A0
	mov r6, #0
	ldr r1, [r1]
	ldr r5, _02239D5C ; =ov13_0224579C
	add r8, r1, #0x1300
	mov r7, r6
	str r8, [r0]
	mov r4, #6
_02239D28:
	mov r1, r5
	mov r2, r4
	add r0, r8, #0x20
	bl memcmp
	cmp r0, #0
	add r7, r7, #1
	addne r6, r6, #1
	cmp r7, #0x14
	add r8, r8, #0x2a
	blt _02239D28
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02239D58: .word ov13_0224F5A0
_02239D5C: .word ov13_0224579C
	arm_func_end ov13_02239D04

	arm_func_start ov13_02239D60
ov13_02239D60: ; 0x02239D60
	stmdb sp!, {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	ldr r1, _02239DC0 ; =ov13_0224F5A0
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldrb r1, [r1, #0xe5c]
	cmp r1, #0
	ldreqh r1, [r0]
	cmpeq r1, #0x26
	ldmneia sp!, {r3, pc}
	ldrh r1, [r0, #8]
	cmp r1, #4
	beq _02239DB0
	cmp r1, #5
	bne _02239DB8
	bl ov13_02239DC4
	bl ov13_02239C34
	ldmia sp!, {r3, pc}
_02239DB0:
	bl ov13_02239C34
	ldmia sp!, {r3, pc}
_02239DB8:
	bl OS_Terminate
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02239DC0: .word ov13_0224F5A0
	arm_func_end ov13_02239D60

	arm_func_start ov13_02239DC4
ov13_02239DC4: ; 0x02239DC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x88
	ldr r1, _02239F8C ; =ov13_0224F5A0
	mov fp, r0
	ldr r2, [r1]
	mov r1, #0x400
	add r0, r2, #0xf00
	add r2, r2, #0x1300
	str r2, [sp]
	bl DC_InvalidateRange
	ldrh r0, [fp, #0xe]
	mov sl, #0
	cmp r0, #0
	addle sp, sp, #0x88
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02239E00:
	add r0, fp, sl, lsl #2
	ldr r4, [r0, #0x10]
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _02239F74
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	bne _02239F74
	ldr r7, [sp]
	mov r5, #0
	mov r6, #6
_02239E2C:
	mov r2, r6
	add r0, r4, #4
	add r1, r7, #0x20
	bl memcmp
	cmp r0, #0
	beq _02239E54
	add r5, r5, #1
	cmp r5, #0x14
	add r7, r7, #0x2a
	blt _02239E2C
_02239E54:
	cmp r5, #0x14
	bne _02239EA0
	ldr r8, [sp]
	ldr r7, _02239F90 ; =ov13_0224579C
	mov r5, #0
	mov r6, #6
_02239E6C:
	mov r1, r7
	mov r2, r6
	add r0, r8, #0x20
	bl memcmp
	cmp r0, #0
	beq _02239E94
	add r5, r5, #1
	cmp r5, #0x14
	add r8, r8, #0x2a
	blt _02239E6C
_02239E94:
	cmp r5, #0x14
	addeq sp, sp, #0x88
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02239EA0:
	ldr r0, [sp]
	mov r1, #0x2a
	mla sb, r5, r1, r0
	add r0, r4, #4
	add r1, sb, #0x20
	mov r2, #6
	bl MI_CpuCopy8
	mov r1, sb
	add r0, r4, #0xc
	mov r2, #0x20
	bl MI_CpuCopy8
	add r0, fp, sl, lsl #1
	ldrh r0, [r0, #0x50]
	strh r0, [sb, #0x26]
	ldrh r0, [r4, #0x2c]
	tst r0, #0x10
	moveq r0, #0
	streqb r0, [sb, #0x28]
	beq _02239F74
	mov r2, #1
	add r0, sp, #4
	mov r1, r4
	strb r2, [sb, #0x28]
	bl WM_GetOtherElements
	ldrb r8, [sp, #4]
	mov r7, #0
	cmp r8, #0
	ble _02239F74
	ldr r5, _02239F94 ; =ov13_02245798
	mov r4, #4
	add r6, sp, #4
_02239F1C:
	add r1, r6, r7, lsl #3
	ldrb r0, [r1, #4]
	cmp r0, #0x30
	moveq r0, #2
	streqb r0, [sb, #0x28]
	beq _02239F74
	cmp r0, #0xdd
	bne _02239F68
	ldrb r0, [r1, #5]
	cmp r0, #4
	blo _02239F68
	ldr r0, [r1, #8]
	mov r1, r5
	mov r2, r4
	bl memcmp
	cmp r0, #0
	moveq r0, #2
	streqb r0, [sb, #0x28]
	beq _02239F74
_02239F68:
	add r7, r7, #1
	cmp r7, r8
	blt _02239F1C
_02239F74:
	ldrh r0, [fp, #0xe]
	add sl, sl, #1
	cmp sl, r0
	blt _02239E00
	add sp, sp, #0x88
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02239F8C: .word ov13_0224F5A0
_02239F90: .word ov13_0224579C
_02239F94: .word ov13_02245798
	arm_func_end ov13_02239DC4

	arm_func_start ov13_02239F98
ov13_02239F98: ; 0x02239F98
	stmdb sp!, {r3, lr}
	ldr r0, _02239FD0 ; =0x000006F8
	mov r1, #0x20
	bl ov13_0224128C
	ldr r1, _02239FD4 ; =ov13_0224F5A4
	add r2, r0, #0xf8
	str r0, [r1]
	ldr r1, _02239FD8 ; =0x0000A001
	add r0, r2, #0x400
	bl MATHi_CRC16InitTableRev
	ldr r0, _02239FD4 ; =ov13_0224F5A4
	ldr r0, [r0]
	bl DWCi_BACKUPlRead
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02239FD0: .word 0x000006F8
_02239FD4: .word ov13_0224F5A4
_02239FD8: .word 0x0000A001
	arm_func_end ov13_02239F98

	arm_func_start ov13_02239FDC
ov13_02239FDC: ; 0x02239FDC
	ldr ip, _02239FE8 ; =ov13_022412B0
	ldr r0, _02239FEC ; =ov13_0224F5A4
	bx ip
	.balign 4, 0
_02239FE8: .word ov13_022412B0
_02239FEC: .word ov13_0224F5A4
	arm_func_end ov13_02239FDC

	arm_func_start ov13_02239FF0
ov13_02239FF0: ; 0x02239FF0
	ldr r0, _0223A000 ; =ov13_0224F5A4
	ldr r0, [r0]
	add r0, r0, #0x400
	bx lr
	.balign 4, 0
_0223A000: .word ov13_0224F5A4
	arm_func_end ov13_02239FF0

	arm_func_start ov13_0223A004
ov13_0223A004: ; 0x0223A004
	ldr r1, _0223A014 ; =ov13_0224F5A4
	ldr r1, [r1]
	strb r0, [r1, #0x4f5]
	bx lr
	.balign 4, 0
_0223A014: .word ov13_0224F5A4
	arm_func_end ov13_0223A004

	arm_func_start ov13_0223A018
ov13_0223A018: ; 0x0223A018
	ldr r1, _0223A028 ; =ov13_0224F5A4
	ldr r1, [r1]
	strb r0, [r1, #0x4f6]
	bx lr
	.balign 4, 0
_0223A028: .word ov13_0224F5A4
	arm_func_end ov13_0223A018

	arm_func_start ov13_0223A02C
ov13_0223A02C: ; 0x0223A02C
	stmdb sp!, {r3, lr}
	ldr r1, _0223A058 ; =ov13_0224F5A4
	mov r2, #0x20
	ldr r1, [r1]
	add r1, r1, #0x440
	bl MI_CpuCopy8
	ldr r0, _0223A058 ; =ov13_0224F5A4
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x4e7]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223A058: .word ov13_0224F5A4
	arm_func_end ov13_0223A02C

	arm_func_start ov13_0223A05C
ov13_0223A05C: ; 0x0223A05C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0223A1F0 ; =ov13_0224F5A4
	mov r6, r0
	ldr r0, [r1]
	mov r1, #0
	add r0, r0, #0x480
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, r6
	mov r1, #0x20
	bl ov13_02242074
	mov r5, r0
	cmp r5, #0xa
	bgt _0223A0A4
	bge _0223A0BC
	cmp r5, #0
	beq _0223A0BC
	b _0223A114
_0223A0A4:
	cmp r5, #0x1a
	bgt _0223A0B4
	beq _0223A0BC
	b _0223A114
_0223A0B4:
	cmp r5, #0x20
	bne _0223A114
_0223A0BC:
	ldr r0, _0223A1F0 ; =ov13_0224F5A4
	cmp r5, #0
	ldr r2, [r0]
	mov r4, #0
	ldrb r1, [r2, #0x4e6]
	bic r1, r1, #0xfc
	strb r1, [r2, #0x4e6]
	ldr r0, [r0]
	add r8, r0, #0x480
	ble _0223A140
_0223A0E4:
	ldrb r0, [r6, r4]
	add sb, r6, r4
	bl ov13_0223AAE0
	mov r7, r0
	ldrb r0, [sb, #1]
	bl ov13_0223AAE0
	add r0, r0, r7, lsl #4
	add r4, r4, #2
	cmp r4, r5
	strb r0, [r8], #1
	blt _0223A0E4
	b _0223A140
_0223A114:
	ldr r1, _0223A1F0 ; =ov13_0224F5A4
	mov r0, r6
	ldr r4, [r1]
	mov r2, #0x10
	ldrb r3, [r4, #0x4e6]
	bic r3, r3, #0xfc
	orr r3, r3, #4
	strb r3, [r4, #0x4e6]
	ldr r1, [r1]
	add r1, r1, #0x480
	bl MI_CpuCopy8
_0223A140:
	cmp r5, #5
	bgt _0223A158
	bge _0223A19C
	cmp r5, #0
	beq _0223A184
	b _0223A1D4
_0223A158:
	cmp r5, #0xd
	bgt _0223A178
	cmp r5, #0xa
	blt _0223A1D4
	beq _0223A19C
	cmp r5, #0xd
	beq _0223A1B8
	b _0223A1D4
_0223A178:
	cmp r5, #0x1a
	beq _0223A1B8
	b _0223A1D4
_0223A184:
	ldr r0, _0223A1F0 ; =ov13_0224F5A4
	ldr r1, [r0]
	ldrb r0, [r1, #0x4e6]
	bic r0, r0, #3
	strb r0, [r1, #0x4e6]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0223A19C:
	ldr r0, _0223A1F0 ; =ov13_0224F5A4
	ldr r1, [r0]
	ldrb r0, [r1, #0x4e6]
	bic r0, r0, #3
	orr r0, r0, #1
	strb r0, [r1, #0x4e6]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0223A1B8:
	ldr r0, _0223A1F0 ; =ov13_0224F5A4
	ldr r1, [r0]
	ldrb r0, [r1, #0x4e6]
	bic r0, r0, #3
	orr r0, r0, #2
	strb r0, [r1, #0x4e6]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0223A1D4:
	ldr r0, _0223A1F0 ; =ov13_0224F5A4
	ldr r1, [r0]
	ldrb r0, [r1, #0x4e6]
	bic r0, r0, #3
	orr r0, r0, #3
	strb r0, [r1, #0x4e6]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0223A1F0: .word ov13_0224F5A4
	arm_func_end ov13_0223A05C

	arm_func_start ov13_0223A1F4
ov13_0223A1F4: ; 0x0223A1F4
	ldr r1, _0223A208 ; =ov13_0224F5A4
	ldr ip, _0223A20C ; =ov13_0223AA58
	ldr r1, [r1]
	add r1, r1, #0x4c0
	bx ip
	.balign 4, 0
_0223A208: .word ov13_0224F5A4
_0223A20C: .word ov13_0223AA58
	arm_func_end ov13_0223A1F4

	arm_func_start ov13_0223A210
ov13_0223A210: ; 0x0223A210
	ldr r1, _0223A224 ; =ov13_0224F5A4
	ldr ip, _0223A228 ; =ov13_0223AA58
	ldr r1, [r1]
	add r1, r1, #0x4f0
	bx ip
	.balign 4, 0
_0223A224: .word ov13_0224F5A4
_0223A228: .word ov13_0223AA58
	arm_func_end ov13_0223A210

	arm_func_start ov13_0223A22C
ov13_0223A22C: ; 0x0223A22C
	ldr r1, _0223A244 ; =ov13_0224F5A4
	ldr ip, _0223A248 ; =ov13_0223AA58
	ldr r1, [r1]
	add r1, r1, #0xc4
	add r1, r1, #0x400
	bx ip
	.balign 4, 0
_0223A244: .word ov13_0224F5A4
_0223A248: .word ov13_0223AA58
	arm_func_end ov13_0223A22C

	arm_func_start ov13_0223A24C
ov13_0223A24C: ; 0x0223A24C
	ldr r1, _0223A264 ; =ov13_0224F5A4
	ldr ip, _0223A268 ; =ov13_0223AA58
	ldr r1, [r1]
	add r1, r1, #0xc8
	add r1, r1, #0x400
	bx ip
	.balign 4, 0
_0223A264: .word ov13_0224F5A4
_0223A268: .word ov13_0223AA58
	arm_func_end ov13_0223A24C

	arm_func_start ov13_0223A26C
ov13_0223A26C: ; 0x0223A26C
	ldr r1, _0223A284 ; =ov13_0224F5A4
	ldr ip, _0223A288 ; =ov13_0223AA58
	ldr r1, [r1]
	add r1, r1, #0xcc
	add r1, r1, #0x400
	bx ip
	.balign 4, 0
_0223A284: .word ov13_0224F5A4
_0223A288: .word ov13_0223AA58
	arm_func_end ov13_0223A26C

	arm_func_start ov13_0223A28C
ov13_0223A28C: ; 0x0223A28C
	ldr r2, _0223A2A8 ; =ov13_0224F5A4
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _0223A2AC ; =MI_CpuCopy8
	mov r2, #0x20
	add r0, r0, #0x440
	bx ip
	.balign 4, 0
_0223A2A8: .word ov13_0224F5A4
_0223A2AC: .word MI_CpuCopy8
	arm_func_end ov13_0223A28C

	arm_func_start ov13_0223A2B0
ov13_0223A2B0: ; 0x0223A2B0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _0223A2E8 ; =ov13_0224F5A4
	ldr r1, _0223A2EC ; =ov13_022467C8
	ldr r3, [r2]
	ldrb r2, [r3, #0x4c2]
	str r2, [sp]
	ldrb r2, [r3, #0x4c3]
	str r2, [sp, #4]
	ldrb r2, [r3, #0x4c0]
	ldrb r3, [r3, #0x4c1]
	bl OS_SPrintf
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223A2E8: .word ov13_0224F5A4
_0223A2EC: .word ov13_022467C8
	arm_func_end ov13_0223A2B0

	arm_func_start ov13_0223A2F0
ov13_0223A2F0: ; 0x0223A2F0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _0223A328 ; =ov13_0224F5A4
	ldr r1, _0223A32C ; =ov13_022467C8
	ldr r3, [r2]
	ldrb r2, [r3, #0x4f2]
	str r2, [sp]
	ldrb r2, [r3, #0x4f3]
	str r2, [sp, #4]
	ldrb r2, [r3, #0x4f0]
	ldrb r3, [r3, #0x4f1]
	bl OS_SPrintf
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223A328: .word ov13_0224F5A4
_0223A32C: .word ov13_022467C8
	arm_func_end ov13_0223A2F0

	arm_func_start ov13_0223A330
ov13_0223A330: ; 0x0223A330
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _0223A36C ; =ov13_0224F5A4
	ldr r1, _0223A370 ; =ov13_022467C8
	ldr ip, [r2]
	add r3, ip, #0xc4
	ldrb r2, [r3, #0x402]
	str r2, [sp]
	ldrb r2, [r3, #0x403]
	str r2, [sp, #4]
	ldrb r2, [ip, #0x4c4]
	ldrb r3, [r3, #0x401]
	bl OS_SPrintf
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223A36C: .word ov13_0224F5A4
_0223A370: .word ov13_022467C8
	arm_func_end ov13_0223A330

	arm_func_start ov13_0223A374
ov13_0223A374: ; 0x0223A374
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _0223A3B0 ; =ov13_0224F5A4
	ldr r1, _0223A3B4 ; =ov13_022467C8
	ldr ip, [r2]
	add r3, ip, #0xc8
	ldrb r2, [r3, #0x402]
	str r2, [sp]
	ldrb r2, [r3, #0x403]
	str r2, [sp, #4]
	ldrb r2, [ip, #0x4c8]
	ldrb r3, [r3, #0x401]
	bl OS_SPrintf
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223A3B0: .word ov13_0224F5A4
_0223A3B4: .word ov13_022467C8
	arm_func_end ov13_0223A374

	arm_func_start ov13_0223A3B8
ov13_0223A3B8: ; 0x0223A3B8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _0223A3F4 ; =ov13_0224F5A4
	ldr r1, _0223A3F8 ; =ov13_022467C8
	ldr ip, [r2]
	add r3, ip, #0xcc
	ldrb r2, [r3, #0x402]
	str r2, [sp]
	ldrb r2, [r3, #0x403]
	str r2, [sp, #4]
	ldrb r2, [ip, #0x4cc]
	ldrb r3, [r3, #0x401]
	bl OS_SPrintf
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223A3F4: .word ov13_0224F5A4
_0223A3F8: .word ov13_022467C8
	arm_func_end ov13_0223A3B8

	arm_func_start ov13_0223A3FC
ov13_0223A3FC: ; 0x0223A3FC
	ldr r1, _0223A410 ; =ov13_0224F5A4
	ldr r1, [r1]
	add r0, r1, r0, lsl #8
	ldrb r0, [r0, #0xe7]
	bx lr
	.balign 4, 0
_0223A410: .word ov13_0224F5A4
	arm_func_end ov13_0223A3FC

	arm_func_start ov13_0223A414
ov13_0223A414: ; 0x0223A414
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0223A4EC ; =ov13_0224F5A4
	mov r3, #0x78
	ldr r5, [r1]
	add r4, r5, r0, lsl #8
	mov lr, r4
	add ip, r5, #0x400
_0223A430:
	ldrb r2, [lr]
	ldrb r1, [lr, #1]
	add lr, lr, #2
	subs r3, r3, #1
	strb r2, [ip]
	strb r1, [ip, #1]
	add ip, ip, #2
	bne _0223A430
	ldr r1, _0223A4F0 ; =ov13_022457E8
	strb r0, [r5, #0x4f4]
	add r0, r4, #0xc0
	mov r2, #4
	bl memcmp
	cmp r0, #0
	ldrne r0, _0223A4EC ; =ov13_0224F5A4
	movne r1, #0
	ldreq r0, _0223A4EC ; =ov13_0224F5A4
	moveq r1, #1
	ldr r0, [r0]
	mov r2, #4
	strb r1, [r0, #0x4f5]
	ldr r1, _0223A4F0 ; =ov13_022457E8
	add r0, r4, #0xc8
	bl memcmp
	cmp r0, #0
	bne _0223A4B0
	ldr r1, _0223A4F0 ; =ov13_022457E8
	add r0, r4, #0xcc
	mov r2, #4
	bl memcmp
	cmp r0, #0
	beq _0223A4C4
_0223A4B0:
	ldr r0, _0223A4EC ; =ov13_0224F5A4
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x4f6]
	b _0223A4D4
_0223A4C4:
	ldr r0, _0223A4EC ; =ov13_0224F5A4
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x4f6]
_0223A4D4:
	ldr r1, _0223A4EC ; =ov13_0224F5A4
	ldrb r0, [r4, #0xd0]
	ldr r1, [r1]
	add r1, r1, #0x4f0
	bl DWCi_BACKUPlConvMaskAddr
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223A4EC: .word ov13_0224F5A4
_0223A4F0: .word ov13_022457E8
	arm_func_end ov13_0223A414

	arm_func_start ov13_0223A4F4
ov13_0223A4F4: ; 0x0223A4F4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0223A5CC ; =ov13_0224F5A4
	mov r2, #0x78
	ldr r1, [r0]
	add r4, r1, #0x400
	ldrb r0, [r4, #0xf4]
	mov ip, r4
	add r5, r1, r0, lsl #8
	mov r3, r5
_0223A518:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	subs r2, r2, #1
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	bne _0223A518
	ldrb r0, [r4, #0xf5]
	mov r2, #4
	cmp r0, #0
	beq _0223A56C
	add r0, r5, #0xc0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r5, #0xc4
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r0, #0
	b _0223A590
_0223A56C:
	add r0, r4, #0xc0
	add r1, r5, #0xc0
	bl MI_CpuCopy8
	add r0, r4, #0xc4
	add r1, r5, #0xc4
	mov r2, #4
	bl MI_CpuCopy8
	add r0, r4, #0xf0
	bl DWCi_BACKUPlConvMaskCidr
_0223A590:
	strb r0, [r5, #0xd0]
	ldrb r0, [r4, #0xf6]
	mov r2, #8
	cmp r0, #0
	beq _0223A5B4
	add r0, r5, #0xc8
	mov r1, #0
	bl MI_CpuFill8
	b _0223A5C0
_0223A5B4:
	add r0, r4, #0xc8
	add r1, r5, #0xc8
	bl MI_CpuCopy8
_0223A5C0:
	ldrb r0, [r4, #0xf4]
	bl ov13_0223A8F0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223A5CC: .word ov13_0224F5A4
	arm_func_end ov13_0223A4F4

	arm_func_start ov13_0223A5D0
ov13_0223A5D0: ; 0x0223A5D0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _0223A6E0 ; =ov13_0224F5A4
	mov r6, r0
	ldr r4, [r1]
	mov r1, #0
	add r0, r4, #0x400
	mov r2, #0xef
	bl MI_CpuFill8
	mov r0, r6
	add r1, r4, #0x440
	mov r2, #0x20
	bl MI_CpuCopy8
	ldr r0, [r6, #0x20]
	cmp r0, #1
	beq _0223A620
	cmp r0, #2
	beq _0223A638
	cmp r0, #3
	beq _0223A650
	b _0223A668
_0223A620:
	ldrb r0, [r4, #0x4e6]
	mov r5, #5
	bic r0, r0, #3
	orr r0, r0, #1
	strb r0, [r4, #0x4e6]
	b _0223A678
_0223A638:
	ldrb r0, [r4, #0x4e6]
	mov r5, #0xd
	bic r0, r0, #3
	orr r0, r0, #2
	strb r0, [r4, #0x4e6]
	b _0223A678
_0223A650:
	ldrb r0, [r4, #0x4e6]
	mov r5, #0x10
	bic r0, r0, #3
	orr r0, r0, #3
	strb r0, [r4, #0x4e6]
	b _0223A678
_0223A668:
	ldrb r0, [r4, #0x4e6]
	mov r5, #0
	bic r0, r0, #3
	strb r0, [r4, #0x4e6]
_0223A678:
	ldrb r0, [r4, #0x4e6]
	add r8, r6, #0x28
	add r7, r4, #0x480
	bic r0, r0, #0xfc
	strb r0, [r4, #0x4e6]
	mov r6, #0
_0223A690:
	mov r0, r8
	mov r1, r7
	mov r2, r5
	bl MI_CpuCopy8
	add r6, r6, #1
	cmp r6, #4
	add r7, r7, #0x10
	add r8, r8, #0x20
	blt _0223A690
	mov r3, #2
	add r0, r4, #0x4f0
	mov r1, #0
	mov r2, #4
	strb r3, [r4, #0x4e7]
	bl MI_CpuFill8
	mov r0, #1
	strb r0, [r4, #0x4f5]
	strb r0, [r4, #0x4f6]
	bl ov13_0223A4F4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223A6E0: .word ov13_0224F5A4
	arm_func_end ov13_0223A5D0

	arm_func_start ov13_0223A6E4
ov13_0223A6E4: ; 0x0223A6E4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0223A7F0 ; =ov13_0224F5A4
	mov r5, r0
	ldr r0, [r1]
	mov r1, #0
	add r4, r0, #0x400
	mov r0, r4
	mov r2, #0xef
	bl MI_CpuFill8
	mov r0, r5
	add r1, r4, #0xd1
	mov r2, #5
	bl MI_CpuCopy8
	add r0, r5, #6
	add r1, r4, #0xd6
	mov r2, #5
	bl MI_CpuCopy8
	add r0, r5, #0xc
	add r1, r4, #0xdb
	mov r2, #5
	bl MI_CpuCopy8
	add r0, r5, #0x12
	add r1, r4, #0xe0
	mov r2, #5
	bl MI_CpuCopy8
	add r0, r5, #0x18
	add r1, r4, #0x60
	mov r2, #0x20
	bl MI_CpuCopy8
	add r0, r5, #0x39
	add r1, r4, #0x80
	mov r2, #0xd
	bl MI_CpuCopy8
	add r0, r5, #0x47
	add r1, r4, #0x90
	mov r2, #0xd
	bl MI_CpuCopy8
	add r0, r5, #0x55
	add r1, r4, #0xa0
	mov r2, #0xd
	bl MI_CpuCopy8
	add r0, r5, #0x63
	add r1, r4, #0xb0
	mov r2, #0xd
	bl MI_CpuCopy8
	add r0, r5, #0x71
	add r1, r4, #0x40
	mov r2, #0x20
	bl MI_CpuCopy8
	ldrb r2, [r4, #0xe6]
	mov r1, #1
	add r0, r4, #0xf0
	bic r2, r2, #3
	orr r2, r2, #2
	strb r2, [r4, #0xe6]
	and r2, r2, #0xff
	bic r2, r2, #0xfc
	strb r2, [r4, #0xe6]
	strb r1, [r4, #0xe7]
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r0, #1
	strb r0, [r4, #0xf5]
	strb r0, [r4, #0xf6]
	bl ov13_0223A4F4
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223A7F0: .word ov13_0224F5A4
	arm_func_end ov13_0223A6E4

	arm_func_start ov13_0223A7F4
ov13_0223A7F4: ; 0x0223A7F4
	ldr r0, _0223A800 ; =ov13_0224F5A4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
_0223A800: .word ov13_0224F5A4
	arm_func_end ov13_0223A7F4

	arm_func_start ov13_0223A804
ov13_0223A804: ; 0x0223A804
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0223A83C ; =ov13_0224F5A4
	mov r5, r0
	ldr r0, [r1]
	mov r1, #0
	add r4, r0, r5, lsl #8
	mov r0, r4
	mov r2, #0xef
	bl MI_CpuFill8
	mov r1, #0xff
	mov r0, r5
	strb r1, [r4, #0xe7]
	bl ov13_0223A8F0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223A83C: .word ov13_0224F5A4
	arm_func_end ov13_0223A804

	arm_func_start ov13_0223A840
ov13_0223A840: ; 0x0223A840
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	ldr r1, _0223A8EC ; =ov13_0224F5A4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x400
	bl MIi_CpuClear16
	ldr r0, _0223A8EC ; =ov13_0224F5A4
	mov r3, #0
	mov r2, #0xff
_0223A868:
	ldr r1, [r0]
	add r1, r1, r3, lsl #8
	add r3, r3, #1
	strb r2, [r1, #0xe7]
	cmp r3, #3
	blt _0223A868
	add r0, sp, #0
	bl DWCi_AUTH_GetNewWiFiInfo
	add r0, sp, #0
	bl DWCi_BACKUPlConvWifiInfo
	mov r8, #0
	ldr r4, _0223A8EC ; =ov13_0224F5A4
	mov r6, r0
	mov r7, r8
	mov r5, #0xe
_0223A8A4:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, r7
	mov r2, r5
	add r1, r1, #0xf0
	bl MI_CpuCopy8
	add r8, r8, #1
	cmp r8, #2
	add r7, r7, #0x100
	blt _0223A8A4
	mov r4, #0
_0223A8D0:
	mov r0, r4
	bl ov13_0223A8F0
	add r4, r4, #1
	cmp r4, #4
	blt _0223A8D0
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223A8EC: .word ov13_0224F5A4
	arm_func_end ov13_0223A840

	arm_func_start ov13_0223A8F0
ov13_0223A8F0: ; 0x0223A8F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	ldr r1, _0223AA54 ; =ov13_0224F5A4
	mov r7, r0
	ldr r0, [r1]
	mov r6, #0
	add r2, r0, r7, lsl #8
	ldrb r5, [r2, #0xe7]
	add r0, sp, #4
	mov r1, r6
	mov r2, #0x10
	mov r4, #1
	bl MI_CpuFill8
	add r0, sp, #4
	mov r2, r4
	str r2, [r0, r7, lsl #2]
	cmp r7, #2
	bgt _0223A9CC
	ldr r0, _0223AA54 ; =ov13_0224F5A4
	ldr r0, [r0]
	ldrb r1, [r0, #0xef]
	tst r1, r4, lsl r7
	movne r6, r2
	cmp r5, #0xff
	bne _0223A990
	cmp r6, #0
	beq _0223A990
	ldrb r1, [r0, #0xef]
	mvn r3, r4, lsl r7
	and r2, r1, r3
	ldr r1, _0223AA54 ; =ov13_0224F5A4
	strb r2, [r0, #0xef]
	ldr r2, [r1]
	mov r0, #1
	ldrb r1, [r2, #0x1ef]
	and r1, r1, r3
	strb r1, [r2, #0x1ef]
	str r0, [sp, #8]
	str r0, [sp, #4]
	b _0223A9CC
_0223A990:
	cmp r5, #0xff
	beq _0223A9CC
	cmp r6, #0
	bne _0223A9CC
	ldrb r3, [r0, #0xef]
	ldr r1, _0223AA54 ; =ov13_0224F5A4
	mov r2, #1
	orr r3, r3, r4, lsl r7
	strb r3, [r0, #0xef]
	ldr r1, [r1]
	ldrb r0, [r1, #0x1ef]
	orr r0, r0, r4, lsl r7
	strb r0, [r1, #0x1ef]
	str r2, [sp, #8]
	str r2, [sp, #4]
_0223A9CC:
	mov r6, #0
	ldr r8, _0223AA54 ; =ov13_0224F5A4
	mov r7, r6
	mov r4, #0xfe
	add r5, sp, #4
_0223A9E0:
	ldr r0, [r5, r6, lsl #2]
	cmp r0, #0
	beq _0223AA10
	ldr r1, [r8]
	mov r2, r4
	add r0, r1, #0xf8
	add r0, r0, #0x400
	add r1, r1, r7
	bl MATH_CalcCRC16
	ldr r1, [r8]
	add r1, r1, r6, lsl #8
	strh r0, [r1, #0xfe]
_0223AA10:
	add r6, r6, #1
	cmp r6, #4
	add r7, r7, #0x100
	blt _0223A9E0
	mov r0, #0x100
	mov r1, #0x20
	bl ov13_0224128C
	mov r2, r0
	ldr r0, _0223AA54 ; =ov13_0224F5A4
	add r1, sp, #4
	ldr r0, [r0]
	str r2, [sp]
	bl DWCi_BACKUPlWritePage
	add r0, sp, #0
	bl ov13_022412B0
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223AA54: .word ov13_0224F5A4
	arm_func_end ov13_0223A8F0

	arm_func_start ov13_0223AA58
ov13_0223AA58: ; 0x0223AA58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	add r0, sp, #0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r7, #0
	mov r8, r7
	mov r4, #0x20
	add r6, sp, #0
	mov r5, #3
	mov fp, r7
_0223AA8C:
	mov r1, r6
	mov r2, r5
	add r0, sl, r8
	bl MI_CpuCopy8
	mov r1, fp
	mov r2, r6
_0223AAA4:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0223AAC0
	add r1, r1, #1
	cmp r1, #3
	strb r4, [r2], #1
	blt _0223AAA4
_0223AAC0:
	mov r0, r6
	bl atoi
	strb r0, [sb, r7]
	add r7, r7, #1
	cmp r7, #4
	add r8, r8, #3
	blt _0223AA8C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov13_0223AA58

	arm_func_start ov13_0223AAE0
ov13_0223AAE0: ; 0x0223AAE0
	cmp r0, #0x39
	subls r0, r0, #0x30
	bxls lr
	cmp r0, #0x46
	subls r0, r0, #0x37
	subhi r0, r0, #0x57
	bx lr
	arm_func_end ov13_0223AAE0

	arm_func_start ov13_0223AAFC
ov13_0223AAFC: ; 0x0223AAFC
	stmdb sp!, {r3, lr}
	mov r0, #0xa0
	mov r1, #4
	bl ov13_0224128C
	ldr r2, _0223AB80 ; =ov13_0224F5A8
	add r1, sp, #0
	str r0, [r2]
	ldr r0, _0223AB84 ; =ov13_022467D8
	mov r2, #0x20
	bl ov13_0223F95C
	ldr r1, _0223AB80 ; =ov13_0224F5A8
	ldr r1, [r1]
	str r0, [r1, #0x98]
	bl NNS_SndInit
	ldr r0, _0223AB80 ; =ov13_0224F5A8
	ldr r0, [r0]
	ldr r1, [r0, #0x98]
	bl NNS_SndArcInitOnMemory
	mov r0, #0
	bl NNS_SndArcPlayerSetup
	ldr r0, _0223AB80 ; =ov13_0224F5A8
	ldr r0, [r0]
	add r0, r0, #0x94
	bl NNS_SndHandleInit
	mov r0, #0
	ldr r1, _0223AB88 ; =ov13_0223AC40
	mov r2, r0
	mov r3, #0xc8
	bl ov13_02242528
	ldr r1, _0223AB80 ; =ov13_0224F5A8
	ldr r1, [r1]
	str r0, [r1, #0x9c]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223AB80: .word ov13_0224F5A8
_0223AB84: .word ov13_022467D8
_0223AB88: .word ov13_0223AC40
	arm_func_end ov13_0223AAFC

	arm_func_start ov13_0223AB8C
ov13_0223AB8C: ; 0x0223AB8C
	stmdb sp!, {r3, lr}
	ldr r1, _0223ABB0 ; =ov13_0224F5A8
	mov r0, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x9c]
	bl ov13_022425D0
	ldr r0, _0223ABB4 ; =ov13_0224F5A8
	bl ov13_022412B0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223ABB0: .word ov13_0224F5A8
_0223ABB4: .word ov13_0224F5A8
	arm_func_end ov13_0223AB8C

	arm_func_start ov13_0223ABB8
ov13_0223ABB8: ; 0x0223ABB8
	ldr r1, _0223ABD4 ; =ov13_0224F5A8
	mov r2, r0
	ldr r0, [r1]
	ldr ip, _0223ABD8 ; =NNS_SndArcPlayerStartSeqArc
	mov r1, #0
	add r0, r0, #0x94
	bx ip
	.balign 4, 0
_0223ABD4: .word ov13_0224F5A8
_0223ABD8: .word NNS_SndArcPlayerStartSeqArc
	arm_func_end ov13_0223ABB8

	arm_func_start ov13_0223ABDC
ov13_0223ABDC: ; 0x0223ABDC
	ldr r2, _0223ABF4 ; =ov13_0224F5A8
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _0223ABF8 ; =NNS_SndPlayerSetVolume
	add r0, r0, #0x94
	bx ip
	.balign 4, 0
_0223ABF4: .word ov13_0224F5A8
_0223ABF8: .word NNS_SndPlayerSetVolume
	arm_func_end ov13_0223ABDC

	arm_func_start ov13_0223ABFC
ov13_0223ABFC: ; 0x0223ABFC
	ldr r2, _0223AC18 ; =ov13_0224F5A8
	ldr ip, _0223AC1C ; =NNS_SndPlayerSetTrackPitch
	ldr r3, [r2]
	mov r2, r1
	mov r1, r0
	add r0, r3, #0x94
	bx ip
	.balign 4, 0
_0223AC18: .word ov13_0224F5A8
_0223AC1C: .word NNS_SndPlayerSetTrackPitch
	arm_func_end ov13_0223ABFC

	arm_func_start ov13_0223AC20
ov13_0223AC20: ; 0x0223AC20
	ldr r0, _0223AC38 ; =ov13_0224F5A8
	ldr ip, _0223AC3C ; =NNS_SndPlayerStopSeq
	ldr r0, [r0]
	mov r1, #0
	add r0, r0, #0x94
	bx ip
	.balign 4, 0
_0223AC38: .word ov13_0224F5A8
_0223AC3C: .word NNS_SndPlayerStopSeq
	arm_func_end ov13_0223AC20

	arm_func_start ov13_0223AC40
ov13_0223AC40: ; 0x0223AC40
	ldr ip, _0223AC48 ; =NNS_SndMain
	bx ip
	.balign 4, 0
_0223AC48: .word NNS_SndMain
	arm_func_end ov13_0223AC40

	arm_func_start ov13_0223AC4C
ov13_0223AC4C: ; 0x0223AC4C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r0, [sp]
	mov r0, #0x1c
	mov r1, #4
	bl ov13_0224128C
	ldr r1, [sp]
	ldr r4, _0223AD34 ; =ov13_0224F5AC
	add r3, r1, r1, lsl #2
	ldr r2, _0223AD38 ; =ov13_022457EC
	ldr r1, _0223AD3C ; =ov13_022457FB
	mov r8, #0
	mvn r7, #0
	ldr r5, _0223AD40 ; =ov13_0224580A
	str r0, [r4, #4]
	add sb, r2, r3
	add sl, r1, r3
	sub r6, r7, #0x29
	mov fp, r8
_0223AC94:
	ldrb r1, [sb], #1
	mov r0, #1
	mov r2, r0
	bl ov13_022401B0
	ldr r2, [r4, #4]
	mov r1, r7
	str r0, [r2, r8, lsl #2]
	ldr r0, [r4, #4]
	mov r2, fp
	ldr r0, [r0, r8, lsl #2]
	bl ov13_02240008
	ldr r0, [r4, #4]
	add r3, r5, r8, lsl #2
	ldrh r3, [r3, #2]
	ldr r0, [r0, r8, lsl #2]
	mov r1, r7
	mov r2, r6
	bl ov13_0223FF18
	ldr r0, [r4, #4]
	ldrb r3, [sl], #1
	ldr r0, [r0, r8, lsl #2]
	mov r1, r7
	mov r2, #0
	bl ov13_0223FE98
	add r8, r8, #1
	cmp r8, #5
	blt _0223AC94
	mov r0, #0
	ldr r1, _0223AD44 ; =ov13_0223AD48
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0223AD34 ; =ov13_0224F5AC
	ldr r1, [r1, #4]
	str r0, [r1, #0x14]
	ldr r0, [sp]
	bl ov13_0223B6F4
	mov r0, #0xd
	bl ov13_0223ABB8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0223AD34: .word ov13_0224F5AC
_0223AD38: .word ov13_022457EC
_0223AD3C: .word ov13_022457FB
_0223AD40: .word ov13_0224580A
_0223AD44: .word ov13_0223AD48
	arm_func_end ov13_0223AC4C

	arm_func_start ov13_0223AD48
ov13_0223AD48: ; 0x0223AD48
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223AE20 ; =ov13_0224F5AC
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp, #4]
	add r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x20
	blt _0223AD8C
	cmp r0, #0x100
	ble _0223ADCC
_0223AD8C:
	ldr r5, _0223AE24 ; =ov13_0224580A
	ldr r4, _0223AE20 ; =ov13_0224F5AC
	mov r7, #0
	mvn r6, #0
_0223AD9C:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov13_0223FF18
	add r7, r7, #1
	cmp r7, #5
	blt _0223AD9C
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0223ADCC:
	mov r0, #0x20
	ldr r6, _0223AE24 ; =ov13_0224580A
	ldr r5, _0223AE20 ; =ov13_0224F5AC
	str r0, [sp, #4]
	mov r8, #0
	mvn r7, #0
_0223ADE4:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov13_0223FF18
	add r8, r8, #1
	cmp r8, #5
	blt _0223ADE4
	ldr r1, _0223AE28 ; =ov13_0223AE2C
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223AE20: .word ov13_0224F5AC
_0223AE24: .word ov13_0224580A
_0223AE28: .word ov13_0223AE2C
	arm_func_end ov13_0223AD48

	arm_func_start ov13_0223AE2C
ov13_0223AE2C: ; 0x0223AE2C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223AF04 ; =ov13_0224F5AC
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #4]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp, #4]
	add r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x50
	blt _0223AE70
	cmp r0, #0x100
	ble _0223AEB0
_0223AE70:
	ldr r5, _0223AF08 ; =ov13_0224580A
	ldr r4, _0223AF04 ; =ov13_0224F5AC
	mov r7, #1
	mvn r6, #0
_0223AE80:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov13_0223FF18
	add r7, r7, #1
	cmp r7, #5
	blt _0223AE80
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0223AEB0:
	mov r0, #0x50
	ldr r6, _0223AF08 ; =ov13_0224580A
	ldr r5, _0223AF04 ; =ov13_0224F5AC
	str r0, [sp, #4]
	mov r8, #1
	mvn r7, #0
_0223AEC8:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov13_0223FF18
	add r8, r8, #1
	cmp r8, #5
	blt _0223AEC8
	ldr r1, _0223AF0C ; =ov13_0223AF10
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223AF04: .word ov13_0224F5AC
_0223AF08: .word ov13_0224580A
_0223AF0C: .word ov13_0223AF10
	arm_func_end ov13_0223AE2C

	arm_func_start ov13_0223AF10
ov13_0223AF10: ; 0x0223AF10
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223AFE8 ; =ov13_0224F5AC
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #8]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp, #4]
	add r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x68
	blt _0223AF54
	cmp r0, #0x100
	ble _0223AF94
_0223AF54:
	ldr r5, _0223AFEC ; =ov13_0224580A
	ldr r4, _0223AFE8 ; =ov13_0224F5AC
	mov r7, #2
	mvn r6, #0
_0223AF64:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov13_0223FF18
	add r7, r7, #1
	cmp r7, #5
	blt _0223AF64
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0223AF94:
	mov r0, #0x68
	ldr r6, _0223AFEC ; =ov13_0224580A
	ldr r5, _0223AFE8 ; =ov13_0224F5AC
	str r0, [sp, #4]
	mov r8, #2
	mvn r7, #0
_0223AFAC:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov13_0223FF18
	add r8, r8, #1
	cmp r8, #5
	blt _0223AFAC
	ldr r1, _0223AFF0 ; =ov13_0223AFF4
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223AFE8: .word ov13_0224F5AC
_0223AFEC: .word ov13_0224580A
_0223AFF0: .word ov13_0223AFF4
	arm_func_end ov13_0223AF10

	arm_func_start ov13_0223AFF4
ov13_0223AFF4: ; 0x0223AFF4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223B0CC ; =ov13_0224F5AC
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #0xc]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp, #4]
	add r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x98
	blt _0223B038
	cmp r0, #0x100
	ble _0223B078
_0223B038:
	ldr r5, _0223B0D0 ; =ov13_0224580A
	ldr r4, _0223B0CC ; =ov13_0224F5AC
	mov r7, #3
	mvn r6, #0
_0223B048:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov13_0223FF18
	add r7, r7, #1
	cmp r7, #5
	blt _0223B048
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0223B078:
	mov r0, #0x98
	ldr r6, _0223B0D0 ; =ov13_0224580A
	ldr r5, _0223B0CC ; =ov13_0224F5AC
	str r0, [sp, #4]
	mov r8, #3
	mvn r7, #0
_0223B090:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov13_0223FF18
	add r8, r8, #1
	cmp r8, #5
	blt _0223B090
	ldr r1, _0223B0D4 ; =ov13_0223B0D8
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223B0CC: .word ov13_0224F5AC
_0223B0D0: .word ov13_0224580A
_0223B0D4: .word ov13_0223B0D8
	arm_func_end ov13_0223AFF4

	arm_func_start ov13_0223B0D8
ov13_0223B0D8: ; 0x0223B0D8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _0223B170 ; =ov13_0224F5AC
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #0x10]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp, #4]
	add r2, r0, #8
	str r2, [sp, #4]
	cmp r2, #0xb0
	blt _0223B11C
	cmp r2, #0x100
	ble _0223B13C
_0223B11C:
	ldr r0, _0223B170 ; =ov13_0224F5AC
	mvn r1, #0
	ldr r0, [r0, #4]
	mov r3, #0x21
	ldr r0, [r0, #0x10]
	bl ov13_0223FF18
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_0223B13C:
	ldr r0, _0223B170 ; =ov13_0224F5AC
	mov r2, #0xb0
	ldr r0, [r0, #4]
	str r2, [sp, #4]
	ldr r0, [r0, #0x10]
	sub r1, r2, #0xb1
	mov r3, #0x21
	bl ov13_0223FF18
	ldr r1, _0223B174 ; =ov13_0223B178
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223B170: .word ov13_0224F5AC
_0223B174: .word ov13_0223B178
	arm_func_end ov13_0223B0D8

	arm_func_start ov13_0223B178
ov13_0223B178: ; 0x0223B178
	stmdb sp!, {r3, lr}
	mov r1, r0
	mov r0, #0
	bl ov13_022425D0
	ldr r0, _0223B19C ; =ov13_0224F5AC
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x14]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223B19C: .word ov13_0224F5AC
	arm_func_end ov13_0223B178

	arm_func_start ov13_0223B1A0
ov13_0223B1A0: ; 0x0223B1A0
	stmdb sp!, {r3, lr}
	ldr r1, _0223B1D8 ; =ov13_0224F5AC
	mov r0, #0
	ldr ip, [r1, #4]
	mov lr, #1
	ldr r1, _0223B1DC ; =ov13_0223B2C8
	mov r2, r0
	mov r3, #0x78
	strb lr, [ip, #0x18]
	bl ov13_02242528
	ldr r1, _0223B1D8 ; =ov13_0224F5AC
	ldr r1, [r1, #4]
	str r0, [r1, #0x14]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223B1D8: .word ov13_0224F5AC
_0223B1DC: .word ov13_0223B2C8
	arm_func_end ov13_0223B1A0

	arm_func_start ov13_0223B1E0
ov13_0223B1E0: ; 0x0223B1E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r0, [sp]
	add r2, r0, r0, lsl #2
	ldr r1, _0223B298 ; =ov13_022457EC
	ldr r0, _0223B29C ; =ov13_022457FB
	mov r8, #0
	ldr r5, _0223B2A0 ; =ov13_0224580A
	ldr r4, _0223B2A4 ; =ov13_0224F5AC
	add sb, r1, r2
	add sl, r0, r2
	mov r7, r8
	mov fp, #1
	mvn r6, #0
_0223B214:
	ldr r0, [r4, #4]
	mov r1, r7
	ldr r0, [r0, r8, lsl #2]
	bl ov13_0223FDE0
	mov r2, r0
	ldrb r1, [sb], #2
	mov r0, fp
	bl ov13_022400F0
	ldr r0, [r4, #4]
	mov r1, r6
	ldr r0, [r0, r8, lsl #2]
	mov r2, #0
	bl ov13_02240008
	ldr r0, [r4, #4]
	mov r1, r8, lsl #2
	add r3, r5, r8, lsl #2
	ldrh r2, [r5, r1]
	ldrh r3, [r3, #2]
	ldr r0, [r0, r8, lsl #2]
	mov r1, r6
	bl ov13_0223FF18
	ldr r0, [r4, #4]
	ldrb r3, [sl], #2
	ldr r0, [r0, r8, lsl #2]
	mov r1, r6
	mov r2, #0
	bl ov13_0223FE98
	add r8, r8, #2
	cmp r8, #5
	blt _0223B214
	ldr r0, [sp]
	bl ov13_0223B6F4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0223B298: .word ov13_022457EC
_0223B29C: .word ov13_022457FB
_0223B2A0: .word ov13_0224580A
_0223B2A4: .word ov13_0224F5AC
	arm_func_end ov13_0223B1E0

	arm_func_start ov13_0223B2A8
ov13_0223B2A8: ; 0x0223B2A8
	ldr r0, _0223B2C4 ; =ov13_0224F5AC
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.balign 4, 0
_0223B2C4: .word ov13_0224F5AC
	arm_func_end ov13_0223B2A8

	arm_func_start ov13_0223B2C8
ov13_0223B2C8: ; 0x0223B2C8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _0223B354 ; =ov13_0224F5AC
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #0x10]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp, #4]
	mov r3, #0x21
	sub r2, r0, #8
	str r2, [sp, #4]
	cmp r2, #0x98
	ble _0223B324
	ldr r0, _0223B354 ; =ov13_0224F5AC
	mvn r1, #0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x10]
	bl ov13_0223FF18
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_0223B324:
	ldr r0, _0223B354 ; =ov13_0224F5AC
	mov r2, #0x98
	ldr r0, [r0, #4]
	str r2, [sp, #4]
	ldr r0, [r0, #0x10]
	sub r1, r2, #0x99
	bl ov13_0223FF18
	ldr r1, _0223B358 ; =ov13_0223B35C
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223B354: .word ov13_0224F5AC
_0223B358: .word ov13_0223B35C
	arm_func_end ov13_0223B2C8

	arm_func_start ov13_0223B35C
ov13_0223B35C: ; 0x0223B35C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223B42C ; =ov13_0224F5AC
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #0xc]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp, #4]
	sub r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x68
	ble _0223B3D8
	ldr r5, _0223B430 ; =ov13_0224580A
	ldr r4, _0223B42C ; =ov13_0224F5AC
	mov r7, #3
	mvn r6, #0
_0223B3A8:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov13_0223FF18
	add r7, r7, #1
	cmp r7, #5
	blt _0223B3A8
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0223B3D8:
	mov r0, #0x68
	ldr r6, _0223B430 ; =ov13_0224580A
	ldr r5, _0223B42C ; =ov13_0224F5AC
	str r0, [sp, #4]
	mov r8, #3
	mvn r7, #0
_0223B3F0:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov13_0223FF18
	add r8, r8, #1
	cmp r8, #5
	blt _0223B3F0
	ldr r1, _0223B434 ; =ov13_0223B438
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223B42C: .word ov13_0224F5AC
_0223B430: .word ov13_0224580A
_0223B434: .word ov13_0223B438
	arm_func_end ov13_0223B35C

	arm_func_start ov13_0223B438
ov13_0223B438: ; 0x0223B438
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223B508 ; =ov13_0224F5AC
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #8]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp, #4]
	sub r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x50
	ble _0223B4B4
	ldr r5, _0223B50C ; =ov13_0224580A
	ldr r4, _0223B508 ; =ov13_0224F5AC
	mov r7, #2
	mvn r6, #0
_0223B484:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov13_0223FF18
	add r7, r7, #1
	cmp r7, #5
	blt _0223B484
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0223B4B4:
	mov r0, #0x50
	ldr r6, _0223B50C ; =ov13_0224580A
	ldr r5, _0223B508 ; =ov13_0224F5AC
	str r0, [sp, #4]
	mov r8, #2
	mvn r7, #0
_0223B4CC:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov13_0223FF18
	add r8, r8, #1
	cmp r8, #5
	blt _0223B4CC
	ldr r1, _0223B510 ; =ov13_0223B514
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223B508: .word ov13_0224F5AC
_0223B50C: .word ov13_0224580A
_0223B510: .word ov13_0223B514
	arm_func_end ov13_0223B438

	arm_func_start ov13_0223B514
ov13_0223B514: ; 0x0223B514
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223B5E4 ; =ov13_0224F5AC
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #4]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp, #4]
	sub r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x20
	ble _0223B590
	ldr r5, _0223B5E8 ; =ov13_0224580A
	ldr r4, _0223B5E4 ; =ov13_0224F5AC
	mov r7, #1
	mvn r6, #0
_0223B560:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov13_0223FF18
	add r7, r7, #1
	cmp r7, #5
	blt _0223B560
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0223B590:
	mov r0, #0x20
	ldr r6, _0223B5E8 ; =ov13_0224580A
	ldr r5, _0223B5E4 ; =ov13_0224F5AC
	str r0, [sp, #4]
	mov r8, #1
	mvn r7, #0
_0223B5A8:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov13_0223FF18
	add r8, r8, #1
	cmp r8, #5
	blt _0223B5A8
	ldr r1, _0223B5EC ; =ov13_0223B5F0
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223B5E4: .word ov13_0224F5AC
_0223B5E8: .word ov13_0224580A
_0223B5EC: .word ov13_0223B5F0
	arm_func_end ov13_0223B514

	arm_func_start ov13_0223B5F0
ov13_0223B5F0: ; 0x0223B5F0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223B6B8 ; =ov13_0224F5AC
	mov r5, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp, #4]
	ldr r7, _0223B6BC ; =ov13_0224580A
	sub r0, r0, #8
	ldr r6, _0223B6B8 ; =ov13_0224F5AC
	mov r4, #0
	str r0, [sp, #4]
	mvn r8, #0
_0223B634:
	add r0, r7, r4, lsl #2
	ldr r1, [r6, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r4, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r8
	bl ov13_0223FF18
	add r4, r4, #1
	cmp r4, #5
	blt _0223B634
	ldr r1, [sp, #4]
	ldr r0, _0223B6C0 ; =0x000001D6
	cmp r1, r0
	addgt sp, sp, #8
	ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r1, #0x100
	addlt sp, sp, #8
	ldmltia sp!, {r4, r5, r6, r7, r8, pc}
	mov r1, r5
	mov r0, #0
	bl ov13_022425D0
	ldr r4, _0223B6B8 ; =ov13_0224F5AC
	mov r5, #0
_0223B690:
	ldr r0, [r4, #4]
	ldr r0, [r0, r5, lsl #2]
	bl ov13_0223FD60
	add r5, r5, #1
	cmp r5, #5
	blt _0223B690
	ldr r0, _0223B6C4 ; =ov13_0224F5B0
	bl ov13_022412B0
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223B6B8: .word ov13_0224F5AC
_0223B6BC: .word ov13_0224580A
_0223B6C0: .word 0x000001D6
_0223B6C4: .word ov13_0224F5B0
	arm_func_end ov13_0223B5F0

	arm_func_start ov13_0223B6C8
ov13_0223B6C8: ; 0x0223B6C8
	ldr r0, _0223B6F0 ; =ov13_0224F5AC
	ldr r0, [r0, #4]
	cmp r0, #0
	moveq r0, #1
	bxeq lr
	ldrb r0, [r0, #0x18]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.balign 4, 0
_0223B6F0: .word ov13_0224F5AC
	arm_func_end ov13_0223B6C8

	arm_func_start ov13_0223B6F4
ov13_0223B6F4: ; 0x0223B6F4
	stmdb sp!, {r3, lr}
	ldr r1, _0223B730 ; =ov13_02246854
	ldr r0, [r1, r0, lsl #2]
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r2, _0223B734 ; =ov13_0224F5AC
	ldr r1, _0223B738 ; =ov13_0223B73C
	str r0, [r2]
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov13_02242528
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223B730: .word ov13_02246854
_0223B734: .word ov13_0224F5AC
_0223B738: .word ov13_0223B73C
	arm_func_end ov13_0223B6F4

	arm_func_start ov13_0223B73C
ov13_0223B73C: ; 0x0223B73C
	stmdb sp!, {r4, lr}
	ldr r1, _0223B784 ; =ov13_0224F5AC
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0x600
	bl DC_FlushRange
	ldr r0, _0223B784 ; =ov13_0224F5AC
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x600
	bl GXS_LoadBG1Scr
	ldr r0, _0223B784 ; =ov13_0224F5AC
	ldr r0, [r0]
	bl ov13_0223FA50
	mov r1, r4
	mov r0, #1
	bl ov13_022425D0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223B784: .word ov13_0224F5AC
	arm_func_end ov13_0223B73C

	arm_func_start ov13_0223B788
ov13_0223B788: ; 0x0223B788
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x54
	mov r4, r0
	ldr r0, _0223B8F0 ; =0x00001BA0
	mov r1, #0x20
	bl ov13_0224128C
	ldr r2, _0223B8F4 ; =ov13_0224F5B4
	add r1, r0, #0x1000
	str r0, [r2]
	str r4, [r1, #0x370]
	bl OS_GetTick
	ldr r4, _0223B8F4 ; =ov13_0224F5B4
	mov r2, #3
	ldr r3, [r4]
	add r3, r3, #0x1000
	str r0, [r3, #0xb88]
	str r1, [r3, #0xb8c]
	ldr r0, [r4]
	ldr r1, _0223B8F8 ; =ov13_0223BA3C
	bl WM_Initialize
	cmp r0, #2
	bne _0223B8DC
_0223B7E0:
	ldr r0, [r4]
	add r0, r0, #0x3b8
	add r0, r0, #0x1000
	bl WM_ReadStatus
	ldr ip, [r4]
	add r0, ip, #0x1300
	ldrh r0, [r0, #0xb8]
	cmp r0, #2
	bne _0223B7E0
	add r0, ip, #0x374
	ldr r5, _0223B8FC ; =ov13_02245834
	add lr, r0, #0x1000
	mov r4, #4
_0223B814:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0223B814
	ldr r0, [r5]
	add r1, ip, #0xf00
	str r0, [lr]
	add r0, ip, #0x1000
	str r1, [r0, #0x374]
	bl WM_GetDispersionScanPeriod
	ldr r1, _0223B8F4 ; =ov13_0224F5B4
	ldr r1, [r1]
	add r1, r1, #0x1300
	strh r0, [r1, #0x7c]
	add r0, sp, #0
	bl OS_GetOwnerInfo
	ldr r1, _0223B8F4 ; =ov13_0224F5B4
	ldr r0, _0223B900 ; =ov13_02245828
	ldr r1, [r1]
	mov r2, #8
	add r1, r1, #0x388
	add r1, r1, #0x1000
	bl MI_CpuCopy8
	ldr r2, _0223B8F4 ; =ov13_0224F5B4
	mov r3, #1
	ldr r1, [r2]
	add r0, sp, #4
	add r1, r1, #0x1000
	strb r3, [r1, #0x391]
	ldr r1, [r2]
	ldrh r2, [sp, #0x1a]
	add r1, r1, #0x394
	add r1, r1, #0x1000
	mov r2, r2, lsl #1
	bl MI_CpuCopy8
	bl ov13_0223B90C
	cmp r0, #0
	beq _0223B8DC
	mov r0, #0
	ldr r1, _0223B904 ; =ov13_0223BD30
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0223B8F4 ; =ov13_0224F5B4
	add sp, sp, #0x54
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r0, [r1, #0xb90]
	mov r0, #1
	ldmia sp!, {r4, r5, pc}
_0223B8DC:
	ldr r0, _0223B908 ; =ov13_0224F5B4
	bl ov13_022412B0
	mov r0, #0
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0223B8F0: .word 0x00001BA0
_0223B8F4: .word ov13_0224F5B4
_0223B8F8: .word ov13_0223BA3C
_0223B8FC: .word ov13_02245834
_0223B900: .word ov13_02245828
_0223B904: .word ov13_0223BD30
_0223B908: .word ov13_0224F5B4
	arm_func_end ov13_0223B788

	arm_func_start ov13_0223B90C
ov13_0223B90C: ; 0x0223B90C
	stmdb sp!, {r3, lr}
	ldr r1, _0223B938 ; =ov13_0224F5B4
	ldr r0, _0223B93C ; =ov13_0223BA3C
	ldr r1, [r1]
	add r1, r1, #0x374
	add r1, r1, #0x1000
	bl WM_StartScanEx
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223B938: .word ov13_0224F5B4
_0223B93C: .word ov13_0223BA3C
	arm_func_end ov13_0223B90C

	arm_func_start ov13_0223B940
ov13_0223B940: ; 0x0223B940
	stmdb sp!, {r4, lr}
	ldr r1, _0223BA18 ; =ov13_0224F5B4
	mov r2, #1
	ldr r0, [r1]
	add r0, r0, #0x1000
	strb r2, [r0, #0xb94]
	ldr r0, [r1]
	add r0, r0, #0x3b8
	add r0, r0, #0x1000
	bl WM_ReadStatus
	ldr r0, _0223BA18 ; =ov13_0224F5B4
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrh r0, [r0, #0xb8]
	cmp r0, #2
	beq _0223B9BC
	ldr r0, _0223BA1C ; =ov13_0223BA3C
	bl WM_Reset
	cmp r0, #2
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r4, _0223BA18 ; =ov13_0224F5B4
_0223B998:
	ldr r0, [r4]
	add r0, r0, #0x3b8
	add r0, r0, #0x1000
	bl WM_ReadStatus
	ldr r0, [r4]
	add r0, r0, #0x1300
	ldrh r0, [r0, #0xb8]
	cmp r0, #2
	bne _0223B998
_0223B9BC:
	ldr r0, _0223BA1C ; =ov13_0223BA3C
	bl WM_End
	cmp r0, #2
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, _0223BA18 ; =ov13_0224F5B4
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r1, [r0, #0xb90]
	cmp r1, #0
	beq _0223B9F0
	mov r0, #0
	bl ov13_022425F0
_0223B9F0:
	ldr r0, _0223BA18 ; =ov13_0224F5B4
	ldr r0, [r0]
	add r0, r0, #0x1000
_0223B9FC:
	ldrb r1, [r0, #0xb94]
	cmp r1, #2
	bne _0223B9FC
	ldr r0, _0223BA20 ; =ov13_0224F5B4
	bl ov13_022412B0
	mov r0, #1
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223BA18: .word ov13_0224F5B4
_0223BA1C: .word ov13_0223BA3C
_0223BA20: .word ov13_0224F5B4
	arm_func_end ov13_0223B940

	arm_func_start ov13_0223BA24
ov13_0223BA24: ; 0x0223BA24
	ldr r1, _0223BA38 ; =ov13_0224F5B4
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r0, [r1, #0x370]
	bx lr
	.balign 4, 0
_0223BA38: .word ov13_0224F5B4
	arm_func_end ov13_0223BA24

	arm_func_start ov13_0223BA3C
ov13_0223BA3C: ; 0x0223BA3C
	stmdb sp!, {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	ldr r1, _0223BAC8 ; =ov13_0224F5B4
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldrb r2, [r1, #0xb94]
	cmp r2, #0
	beq _0223BA78
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #2
	streqb r0, [r1, #0xb94]
	ldmia sp!, {r3, pc}
_0223BA78:
	ldrh r2, [r0]
	cmp r2, #0x26
	ldmneia sp!, {r3, pc}
	ldrh r2, [r0, #8]
	cmp r2, #4
	beq _0223BAB8
	cmp r2, #5
	bne _0223BAC0
	ldrb r1, [r1, #0xb96]
	cmp r1, #0
	beq _0223BAAC
	bl ov13_0223BC24
	b _0223BAB0
_0223BAAC:
	bl ov13_0223BACC
_0223BAB0:
	bl ov13_0223B90C
	ldmia sp!, {r3, pc}
_0223BAB8:
	bl ov13_0223B90C
	ldmia sp!, {r3, pc}
_0223BAC0:
	bl OS_Terminate
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223BAC8: .word ov13_0224F5B4
	arm_func_end ov13_0223BA3C

	arm_func_start ov13_0223BACC
ov13_0223BACC: ; 0x0223BACC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	ldrh r0, [fp, #0xe]
	mov r7, #0
	cmp r0, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223BAE4:
	add r0, fp, r7, lsl #2
	ldr r6, [r0, #0x10]
	mov r1, #0xc0
	mov r0, r6
	bl DC_InvalidateRange
	ldr r1, _0223BC18 ; =ov13_02245828
	add r0, r6, #0xc
	mov r2, #8
	bl memcmp
	cmp r0, #0
	bne _0223BC04
	ldr r0, _0223BC1C ; =ov13_0224F5B4
	mov r5, #0
	ldr sb, [r0]
	mov r4, #6
	add r8, sb, #0x1300
_0223BB24:
	mov r1, r8
	mov r2, r4
	add r0, r6, #4
	bl memcmp
	cmp r0, #0
	bne _0223BB7C
	rsb r0, r5, r5, lsl #3
	add r0, sb, r0
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x306]
	cmp r0, #0
	bne _0223BC04
	ldrb r0, [r6, #0x15]
	tst r0, #1
	beq _0223BC04
	add r0, sb, #0x1000
	ldr r1, [r0, #0x370]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #1
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223BB7C:
	add r5, r5, #1
	cmp r5, #0x10
	add r8, r8, #7
	blt _0223BB24
	ldr r5, _0223BC20 ; =ov13_02245820
	add r8, sb, #0x1300
	mov sl, #0
	mov r4, #6
_0223BB9C:
	mov r0, r8
	mov r1, r5
	mov r2, r4
	bl memcmp
	cmp r0, #0
	bne _0223BBF4
	rsb r4, sl, sl, lsl #3
	add r1, sb, #0x1300
	add r0, r6, #4
	add r1, r1, r4
	mov r2, #6
	bl MI_CpuCopy8
	ldrb r0, [r6, #0x15]
	tst r0, #1
	ldr r0, _0223BC1C ; =ov13_0224F5B4
	movne r1, #1
	ldr r0, [r0]
	moveq r1, #0
	add r0, r0, r4
	add r0, r0, #0x1000
	strb r1, [r0, #0x306]
	b _0223BC04
_0223BBF4:
	add sl, sl, #1
	cmp sl, #0x10
	add r8, r8, #7
	blt _0223BB9C
_0223BC04:
	ldrh r0, [fp, #0xe]
	add r7, r7, #1
	cmp r7, r0
	blt _0223BAE4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0223BC18: .word ov13_02245828
_0223BC1C: .word ov13_0224F5B4
_0223BC20: .word ov13_02245820
	arm_func_end ov13_0223BACC

	arm_func_start ov13_0223BC24
ov13_0223BC24: ; 0x0223BC24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _0223BD28 ; =ov13_0224F5B4
	mov sl, r0
	ldr r2, [r1]
	add r1, r2, #0x1000
	ldrb r0, [r1, #0xb95]
	cmp r0, #0
	beq _0223BC58
	ldr r1, [r1, #0x370]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223BC58:
	add r0, r2, #0xf00
	mov r1, #0x400
	bl DC_InvalidateRange
	ldrh fp, [sl, #0xe]
	mov r6, #0
	cmp fp, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0223BD28 ; =ov13_0224F5B4
	mov r4, #6
	ldr sb, [r0]
_0223BC80:
	add r0, sl, r6, lsl #2
	ldr r5, [r0, #0x10]
	ldr r1, _0223BD2C ; =ov13_02245828
	mov r2, #8
	add r0, r5, #0xc
	bl memcmp
	cmp r0, #0
	bne _0223BD18
	ldrb r0, [r5, #0x15]
	tst r0, #1
	beq _0223BD18
	mov r7, #0
	add r8, sb, #0x1300
_0223BCB4:
	mov r1, r8
	mov r2, r4
	add r0, r5, #4
	bl memcmp
	cmp r0, #0
	bne _0223BD08
	rsb r0, r7, r7, lsl #3
	add r0, sb, r0
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x306]
	cmp r0, #0
	bne _0223BD18
	add r0, sb, #0x1000
	ldr r1, [r0, #0x370]
	cmp r1, #0
	moveq r1, #1
	streqb r1, [r0, #0xb95]
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #1
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223BD08:
	add r7, r7, #1
	cmp r7, #0x10
	add r8, r8, #7
	blt _0223BCB4
_0223BD18:
	add r6, r6, #1
	cmp r6, fp
	blt _0223BC80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0223BD28: .word ov13_0224F5B4
_0223BD2C: .word ov13_02245828
	arm_func_end ov13_0223BC24

	arm_func_start ov13_0223BD30
ov13_0223BD30: ; 0x0223BD30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r0, [sp]
	bl OS_GetTick
	ldr r2, _0223BE60 ; =ov13_0224F5B4
	ldr r3, _0223BE64 ; =0x0017F898
	ldr sl, [r2]
	mov r7, #0
	add r2, sl, #0x1000
	ldr r4, [r2, #0xb88]
	ldr r2, [r2, #0xb8c]
	adds r3, r4, r3
	adc r2, r2, #0
	cmp r1, r2
	cmpeq r0, r3
	ldmloia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, _0223BE68 ; =ov13_02245820
	mov r6, r7
	mov r5, r7
	mov sb, sl
	add r8, sl, #0x1300
	mov fp, #6
_0223BD84:
	mov r0, r8
	mov r1, r4
	mov r2, fp
	bl memcmp
	cmp r0, #0
	beq _0223BDB0
	add r0, sb, #0x1000
	ldrb r0, [r0, #0x306]
	cmp r0, #0
	movne r6, #1
	moveq r7, #1
_0223BDB0:
	add r5, r5, #1
	cmp r5, #0x10
	add r8, r8, #7
	add sb, sb, #7
	blt _0223BD84
	cmp r6, #0
	cmpne r7, #0
	beq _0223BDEC
	add r0, sl, #0x1000
	ldr r1, [r0, #0x370]
	cmp r1, #0
	beq _0223BE30
	mov r0, #2
	blx r1
	b _0223BE30
_0223BDEC:
	cmp r6, #0
	beq _0223BE10
	add r0, sl, #0x1000
	ldr r1, [r0, #0x370]
	cmp r1, #0
	beq _0223BE30
	mov r0, #1
	blx r1
	b _0223BE30
_0223BE10:
	cmp r7, #0
	bne _0223BE30
	add r0, sl, #0x1000
	ldr r1, [r0, #0x370]
	cmp r1, #0
	beq _0223BE30
	mov r0, #0
	blx r1
_0223BE30:
	ldr r3, _0223BE60 ; =ov13_0224F5B4
	mov r0, #0
	ldr r2, [r3]
	ldr r1, [sp]
	add r2, r2, #0x1000
	str r0, [r2, #0xb90]
	ldr r2, [r3]
	mov r3, #1
	add r2, r2, #0x1000
	strb r3, [r2, #0xb96]
	bl ov13_022425D0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0223BE60: .word ov13_0224F5B4
_0223BE64: .word 0x0017F898
_0223BE68: .word ov13_02245820
	arm_func_end ov13_0223BD30

	arm_func_start ov13_0223BE6C
ov13_0223BE6C: ; 0x0223BE6C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r5, _0223C168 ; =ov13_02245878
	ldr r4, _0223C16C ; =ov13_0224F4F8
	ldrb sl, [r5, #4]
	ldrb sb, [r5, #5]
	ldrb r8, [r5, #6]
	ldrb r7, [r5, #7]
	ldrb r6, [r5, #8]
	ldrb r5, [r5, #9]
	strb sl, [sp, #0x1c]
	mov fp, r0
	str r2, [sp, #0x10]
	mov r2, r3
	mov sl, r1
	ldr r0, [r4]
	ldr r3, [sp, #0x48]
	mov r1, fp
	strb sb, [sp, #0x1d]
	strb r8, [sp, #0x1e]
	strb r7, [sp, #0x1f]
	strb r6, [sp, #0x20]
	strb r5, [sp, #0x21]
	bl ov13_0222BAF4
	str r0, [sp, #0x14]
	mov r0, #0x20
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _0223C170 ; =ov13_0224F5B8
	mvn r3, #1
	str r0, [r1]
	strb sl, [r0, #0x1c]
	ldr r2, [r1]
	ldr r0, _0223C174 ; =0x04000050
	strb r3, [r2, #0x1b]
	ldr r3, [r1]
	ldr r2, [sp, #0x10]
	mov r1, #0x1f
	strb r2, [r3, #0x1e]
	mov r2, #0
	bl G2x_SetBlendBrightness_
	ldr r1, _0223C178 ; =ov13_0224592C
	mov r0, #0
	ldrb r1, [r1, sl]
	mov r2, r0
	bl ov13_022401B0
	ldr r3, _0223C170 ; =ov13_0224F5B8
	mvn r1, #0
	ldr r4, [r3]
	mov r2, #0x100
	str r0, [r4]
	ldr r0, [r3]
	mov r3, #0
	ldr r0, [r0]
	bl ov13_0223FF18
	ldr r0, _0223C170 ; =ov13_0224F5B8
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #0
	ldr r0, [r0]
	bl ov13_02240008
	ldr r7, _0223C17C ; =ov13_02245934
	mov r8, #0
	ldrb r0, [r7, sl]
	cmp r0, #0
	ble _0223BFEC
	ldr r0, _0223C180 ; =ov13_0224589E
	ldr r4, _0223C170 ; =ov13_0224F5B8
	add sb, r0, sl, lsl #1
	mvn r6, #0
	mov r5, #0x100
	mov fp, r8
_0223BF8C:
	ldrb r1, [sb], #1
	mov r0, #0
	mov r2, r0
	bl ov13_022401B0
	ldr r2, [r4]
	mov r1, r6
	add r2, r2, r8, lsl #2
	str r0, [r2, #8]
	ldr r0, [r4]
	mov r2, r5
	add r0, r0, r8, lsl #2
	ldr r0, [r0, #8]
	mov r3, fp
	bl ov13_0223FF18
	ldr r0, [r4]
	mov r1, r6
	add r0, r0, r8, lsl #2
	ldr r0, [r0, #8]
	mov r2, #0
	bl ov13_02240008
	ldrb r0, [r7, sl]
	add r8, r8, #1
	cmp r8, r0
	blt _0223BF8C
_0223BFEC:
	add r1, sp, #0x18
	str r1, [sp]
	mov r0, #0
	mov r1, #0x20
	mov r2, #0xc
	mov r3, #1
	str r0, [sp, #4]
	bl ov13_02240798
	ldr r1, _0223C170 ; =ov13_0224F5B8
	ldr r1, [r1]
	str r0, [r1, #0x10]
	mov r0, #0
	ldr r1, [sp, #0x18]
	mov r2, r0
	bl ov13_0223FC04
	ldr r1, _0223C170 ; =ov13_0224F5B8
	ldr r1, [r1]
	str r0, [r1, #4]
	bl ov13_02227B1C
	ldr r1, _0223C184 ; =ov13_022458BE
	mov r5, sl, lsl #2
	ldrh r4, [r1, r5]
	mov r3, #2
	ldr r2, _0223C170 ; =ov13_0224F5B8
	str r4, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	ldr r3, _0223C188 ; =ov13_022458BC
	str r0, [sp, #0xc]
	ldr r0, [r2]
	mov r1, #0
	ldrh r3, [r3, r5]
	ldr r0, [r0, #0x10]
	mov r2, r1
	bl ov13_02240CC0
	ldr r0, _0223C170 ; =ov13_0224F5B8
	mov r2, #0
	ldr r3, [r0]
	mov r1, #0x100
	str r2, [sp]
	ldr r0, [r3, #0x10]
	ldr r3, [r3, #4]
	bl ov13_02240D94
	mov r0, #0
	mov r1, r0
	mov r2, #0x1f
	mov r3, r0
	bl ov13_02241070
	ldr r3, _0223C170 ; =ov13_0224F5B8
	add r4, sp, #0x1c
	ldr r3, [r3]
	mov r0, #0
	ldrb r3, [r3, #0x1c]
	mov r1, #1
	mov r2, #0x1f
	ldrb r3, [r4, r3]
	bl ov13_02241070
	mov r0, #0
	mov r1, #3
	mov r2, #0x1f
	mov r3, #1
	bl ov13_02241070
	ldr r2, _0223C18C ; =ov13_02245882
	mov r0, #0
	mov r1, #1
	bl ov13_02240F58
	mov r0, #0xc0
	bl ov13_0223C508
	mov r2, #0x4000000
	ldr r0, [sp, #0x10]
	ldr r1, [r2]
	cmp r0, #0
	bic r0, r1, #0xe000
	orr r0, r0, #0x6000
	str r0, [r2]
	mov r0, #1
	mov r2, #0
	beq _0223C148
	ldr r1, _0223C190 ; =ov13_0223C20C
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0223C170 ; =ov13_0224F5B8
	add sp, sp, #0x24
	ldr r1, [r1]
	str r0, [r1, #0x14]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223C148:
	ldr r1, _0223C194 ; =ov13_0223C26C
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0223C170 ; =ov13_0224F5B8
	ldr r1, [r1]
	str r0, [r1, #0x14]
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0223C168: .word ov13_02245878
_0223C16C: .word ov13_0224F4F8
_0223C170: .word ov13_0224F5B8
_0223C174: .word 0x04000050
_0223C178: .word ov13_0224592C
_0223C17C: .word ov13_02245934
_0223C180: .word ov13_0224589E
_0223C184: .word ov13_022458BE
_0223C188: .word ov13_022458BC
_0223C18C: .word ov13_02245882
_0223C190: .word ov13_0223C20C
_0223C194: .word ov13_0223C26C
	arm_func_end ov13_0223BE6C

	arm_func_start ov13_0223C198
ov13_0223C198: ; 0x0223C198
	stmdb sp!, {r3, lr}
	ldr r1, _0223C1D4 ; =ov13_0224F5B8
	mov r0, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x14]
	bl ov13_022425D0
	ldr r1, _0223C1D8 ; =ov13_0223C7FC
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0223C1D4 ; =ov13_0224F5B8
	ldr r1, [r1]
	str r0, [r1, #0x14]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223C1D4: .word ov13_0224F5B8
_0223C1D8: .word ov13_0223C7FC
	arm_func_end ov13_0223C198

	arm_func_start ov13_0223C1DC
ov13_0223C1DC: ; 0x0223C1DC
	ldr r0, _0223C1EC ; =ov13_0224F5B8
	ldr r0, [r0]
	ldrsb r0, [r0, #0x1b]
	bx lr
	.balign 4, 0
_0223C1EC: .word ov13_0224F5B8
	arm_func_end ov13_0223C1DC

	arm_func_start ov13_0223C1F0
ov13_0223C1F0: ; 0x0223C1F0
	ldr r0, _0223C208 ; =ov13_0224F5B8
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.balign 4, 0
_0223C208: .word ov13_0224F5B8
	arm_func_end ov13_0223C1F0

	arm_func_start ov13_0223C20C
ov13_0223C20C: ; 0x0223C20C
	stmdb sp!, {r4, lr}
	ldr r1, _0223C260 ; =ov13_0224F5B8
	mov r4, r0
	ldr r3, [r1]
	ldr r0, _0223C264 ; =0x04000050
	ldrsb r2, [r3, #0x1a]
	sub r2, r2, #1
	strb r2, [r3, #0x1a]
	ldr r1, [r1]
	ldrsb r1, [r1, #0x1a]
	bl G2x_ChangeBlendBrightness_
	ldr r1, _0223C260 ; =ov13_0224F5B8
	mvn r0, #0xb
	ldr r1, [r1]
	ldrsb r1, [r1, #0x1a]
	cmp r1, r0
	ldmgtia sp!, {r4, pc}
	ldr r1, _0223C268 ; =ov13_0223C26C
	mov r0, r4
	bl ov13_022425C8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223C260: .word ov13_0224F5B8
_0223C264: .word 0x04000050
_0223C268: .word ov13_0223C26C
	arm_func_end ov13_0223C20C

	arm_func_start ov13_0223C26C
ov13_0223C26C: ; 0x0223C26C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _0223C330 ; =ov13_0224F5B8
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp]
	ldr r1, _0223C330 ; =ov13_0224F5B8
	sub r0, r0, #0xc
	ldr r1, [r1]
	str r0, [sp]
	ldrb r2, [r1, #0x1c]
	ldr r1, _0223C334 ; =ov13_022458D6
	mov r2, r2, lsl #2
	ldrh r1, [r1, r2]
	cmp r0, r1
	ble _0223C2CC
	bl ov13_0223C508
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_0223C2CC:
	mov r0, r1
	bl ov13_0223C508
	ldr r0, _0223C330 ; =ov13_0224F5B8
	mov r3, #0x78
	ldr r0, [r0]
	ldrb r0, [r0, #0x1c]
	cmp r0, #5
	mov r0, #0
	bne _0223C304
	ldr r1, _0223C338 ; =ov13_0223C49C
	mov r2, r0
	bl ov13_02242528
	ldr r1, _0223C330 ; =ov13_0224F5B8
	b _0223C314
_0223C304:
	ldr r1, _0223C33C ; =ov13_0223C340
	mov r2, r0
	bl ov13_02242528
	ldr r1, _0223C330 ; =ov13_0224F5B8
_0223C314:
	ldr r1, [r1]
	str r0, [r1, #0x14]
	mov r1, r4
	mov r0, #1
	bl ov13_022425D0
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223C330: .word ov13_0224F5B8
_0223C334: .word ov13_022458D6
_0223C338: .word ov13_0223C49C
_0223C33C: .word ov13_0223C340
	arm_func_end ov13_0223C26C

	arm_func_start ov13_0223C340
ov13_0223C340: ; 0x0223C340
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r4, _0223C480 ; =ov13_0224F5B8
	ldr sb, _0223C484 ; =ov13_02245934
	ldr r0, [r4]
	mov sl, #0
	ldrb r1, [r0, #0x1c]
	ldrb r0, [sb, r1]
	cmp r0, #0
	ble _0223C3CC
	ldr r8, _0223C488 ; =ov13_02245904
	ldr r7, _0223C48C ; =ov13_0224588A
	ldr r6, _0223C490 ; =ov13_022458A8
	add r5, sp, #0
_0223C378:
	add r0, r7, r1, lsl #1
	ldrb r0, [sl, r0]
	add r3, r8, r1, lsl #3
	mov r2, r5
	add r0, r3, r0, lsl #2
	add r1, r6, r1, lsl #2
	bl ov13_02240E74
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _0223C3B4
	ldr r0, _0223C480 ; =ov13_0224F5B8
	ldr r0, [r0]
	strb sl, [r0, #0x1b]
	b _0223C3CC
_0223C3B4:
	ldr r0, [r4]
	add sl, sl, #1
	ldrb r1, [r0, #0x1c]
	ldrb r0, [sb, r1]
	cmp sl, r0
	blt _0223C378
_0223C3CC:
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _0223C3F8
	ldr r0, _0223C480 ; =ov13_0224F5B8
	ldr r1, _0223C494 ; =ov13_02245894
	ldr r2, [r0]
	ldrb r0, [r2, #0x1c]
	mov r0, r0, lsl #1
	ldrsb r0, [r1, r0]
	strb r0, [r2, #0x1b]
_0223C3F8:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _0223C424
	ldr r0, _0223C480 ; =ov13_0224F5B8
	ldr r1, _0223C498 ; =ov13_02245895
	ldr r2, [r0]
	ldrb r0, [r2, #0x1c]
	mov r0, r0, lsl #1
	ldrsb r0, [r1, r0]
	strb r0, [r2, #0x1b]
_0223C424:
	ldr r0, _0223C480 ; =ov13_0224F5B8
	ldr r2, _0223C484 ; =ov13_02245934
	ldr r4, [r0]
	mov r0, #0
	ldrb r1, [r4, #0x1c]
	ldrb r1, [r2, r1]
	cmp r1, #0
	ble _0223C470
	ldrsb r3, [r4, #0x1b]
_0223C448:
	cmp r0, r3
	bne _0223C45C
	bl ov13_0223C73C
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0223C45C:
	ldrb r1, [r4, #0x1c]
	add r0, r0, #1
	ldrb r1, [r2, r1]
	cmp r0, r1
	blt _0223C448
_0223C470:
	mvn r0, #0
	strb r0, [r4, #0x1b]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_0223C480: .word ov13_0224F5B8
_0223C484: .word ov13_02245934
_0223C488: .word ov13_02245904
_0223C48C: .word ov13_0224588A
_0223C490: .word ov13_022458A8
_0223C494: .word ov13_02245894
_0223C498: .word ov13_02245895
	arm_func_end ov13_0223C340

	arm_func_start ov13_0223C49C
ov13_0223C49C: ; 0x0223C49C
	stmdb sp!, {r3, lr}
	ldr r2, _0223C500 ; =ov13_0224F5B8
	mvn ip, #0
	ldr r3, [r2]
	mov r1, r0
	strb ip, [r3, #0x1b]
	ldr r3, [r2]
	ldrh r0, [r3, #0x18]
	add r0, r0, #1
	strh r0, [r3, #0x18]
	ldr r0, [r2]
	ldrh r0, [r0, #0x18]
	cmp r0, #0x78
	ldmloia sp!, {r3, pc}
	mov r0, #0
	bl ov13_022425D0
	ldr r1, _0223C504 ; =ov13_0223C7FC
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0223C500 ; =ov13_0224F5B8
	ldr r1, [r1]
	str r0, [r1, #0x14]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223C500: .word ov13_0224F5B8
_0223C504: .word ov13_0223C7FC
	arm_func_end ov13_0223C49C

	arm_func_start ov13_0223C508
ov13_0223C508: ; 0x0223C508
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r1, _0223C694 ; =ov13_0224F5B8
	mov sl, r0
	ldr r0, [r1]
	ldr r1, _0223C698 ; =ov13_022458D4
	ldrb r2, [r0, #0x1c]
	ldr r0, [r0]
	mov r3, sl
	mov r2, r2, lsl #2
	ldrh r2, [r1, r2]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _0223C694 ; =ov13_0224F5B8
	ldr r2, _0223C698 ; =ov13_022458D4
	ldr r0, [r0]
	add r3, sl, #8
	ldrb r4, [r0, #0x1c]
	ldr r0, [r0, #4]
	mvn r1, #0
	mov r4, r4, lsl #2
	ldrh r2, [r2, r4]
	add r2, r2, #8
	bl ov13_0223FF18
	ldr r0, _0223C694 ; =ov13_0224F5B8
	mov r1, sl
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov13_0223C6B0
	ldr r0, _0223C694 ; =ov13_0224F5B8
	mov r1, sl
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov13_0223C6B0
	ldr r4, _0223C694 ; =ov13_0224F5B8
	ldr r8, _0223C69C ; =ov13_02245934
	ldr r0, [r4]
	mov sb, #0
	ldrb r0, [r0, #0x1c]
	ldrb r1, [r8, r0]
	cmp r1, #0
	ble _0223C62C
	ldr r7, _0223C6A0 ; =ov13_0224588A
	ldr r5, _0223C6A4 ; =ov13_02245904
	ldr fp, _0223C698 ; =ov13_022458D4
	mvn r6, #0
_0223C5C0:
	add r1, r7, r0, lsl #1
	ldrb ip, [sb, r1]
	add r2, r5, r0, lsl #3
	add r3, fp, r0, lsl #2
	add r0, r2, ip, lsl #2
	ldr r1, [r4]
	mov ip, ip, lsl #2
	ldrh r2, [ip, r2]
	ldrh r0, [r0, #2]
	add r1, r1, sb, lsl #2
	ldrh r3, [r3, #2]
	add ip, sl, r0
	ldr r0, [r1, #8]
	mov r1, r6
	sub r3, ip, r3
	bl ov13_0223FF18
	ldr r0, [r4]
	mov r1, sl
	add r0, r0, sb, lsl #2
	ldr r0, [r0, #8]
	bl ov13_0223C6B0
	ldr r0, [r4]
	add sb, sb, #1
	ldrb r0, [r0, #0x1c]
	ldrb r1, [r8, r0]
	cmp sb, r1
	blt _0223C5C0
_0223C62C:
	and r1, sl, #0xff
	cmp r1, #0xc0
	movge r3, #0
	movge r1, r3
	bge _0223C650
	ldr r2, _0223C6A8 ; =ov13_022458EE
	mov r3, r0, lsl #2
	ldrh r2, [r2, r3]
	add r3, r1, r2
_0223C650:
	ldr r4, _0223C698 ; =ov13_022458D4
	mov r5, r0, lsl #2
	ldr r2, _0223C6AC ; =ov13_022458EC
	ldrh r0, [r4, r5]
	ldrh r2, [r2, r5]
	cmp r3, #0xc0
	add r4, sp, #4
	movgt r3, #0xc0
	add r2, r0, r2
	str r4, [sp]
	bl ov13_02240E5C
	mov r0, #0
	mov r2, r4
	mov r1, r0
	bl ov13_02240F58
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0223C694: .word ov13_0224F5B8
_0223C698: .word ov13_022458D4
_0223C69C: .word ov13_02245934
_0223C6A0: .word ov13_0224588A
_0223C6A4: .word ov13_02245904
_0223C6A8: .word ov13_022458EE
_0223C6AC: .word ov13_022458EC
	arm_func_end ov13_0223C508

	arm_func_start ov13_0223C6B0
ov13_0223C6B0: ; 0x0223C6B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	bl ov13_0223FDEC
	mov r7, r0
	cmp r7, #0
	mov r8, #0
	addle sp, sp, #8
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov fp, #0x200
	mov r4, r8
	add r6, sp, #4
	add r5, sp, #0
_0223C6E8:
	mov r0, sl
	mov r1, r8
	mov r2, r6
	mov r3, r5
	bl ov13_02240068
	ldr r0, [sp]
	cmp r0, sb
	blt _0223C714
	cmp r0, #0xc0
	movlt r2, r4
	blt _0223C718
_0223C714:
	mov r2, fp
_0223C718:
	mov r0, sl
	mov r1, r8
	mov r3, #0
	bl ov13_0223FDF4
	add r8, r8, #1
	cmp r8, r7
	blt _0223C6E8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov13_0223C6B0

	arm_func_start ov13_0223C73C
ov13_0223C73C: ; 0x0223C73C
	stmdb sp!, {r4, lr}
	ldr r1, _0223C7E8 ; =ov13_0224F5B8
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #8]
	bl ov13_0223FDE0
	ldr r1, _0223C7E8 ; =ov13_0224F5B8
	mov r2, r0
	ldr r0, [r1]
	ldr r1, _0223C7EC ; =ov13_0224589E
	ldrb r3, [r0, #0x1c]
	mov r0, #0
	add r1, r1, r3, lsl #1
	ldrb r1, [r4, r1]
	add r1, r1, #1
	bl ov13_022400F0
	ldr r0, _0223C7E8 ; =ov13_0224F5B8
	ldr r2, _0223C7F0 ; =ov13_0224588A
	ldr r0, [r0]
	ldr r1, _0223C7F4 ; =ov13_02245904
	ldrb lr, [r0, #0x1c]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #8]
	add r2, r2, lr, lsl #1
	ldrb r3, [r4, r2]
	add r2, r1, lr, lsl #3
	mvn r1, #0
	mov ip, r3, lsl #2
	ldrh r2, [ip, r2]
	ldr r3, _0223C7F8 ; =ov13_02245906
	add r3, r3, lr, lsl #3
	ldrh r3, [ip, r3]
	bl ov13_0223FF18
	ldr r0, _0223C7E8 ; =ov13_0224F5B8
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #8]
	bl ov13_02240008
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223C7E8: .word ov13_0224F5B8
_0223C7EC: .word ov13_0224589E
_0223C7F0: .word ov13_0224588A
_0223C7F4: .word ov13_02245904
_0223C7F8: .word ov13_02245906
	arm_func_end ov13_0223C73C

	arm_func_start ov13_0223C7FC
ov13_0223C7FC: ; 0x0223C7FC
	stmdb sp!, {r3, lr}
	ldr r1, _0223C830 ; =ov13_0224F5B8
	ldr r3, [r1]
	ldrb r2, [r3, #0x1d]
	add r2, r2, #1
	strb r2, [r3, #0x1d]
	ldr r1, [r1]
	ldrb r1, [r1, #0x1d]
	cmp r1, #8
	ldmloia sp!, {r3, pc}
	ldr r1, _0223C834 ; =ov13_0223C838
	bl ov13_022425C8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223C830: .word ov13_0224F5B8
_0223C834: .word ov13_0223C838
	arm_func_end ov13_0223C7FC

	arm_func_start ov13_0223C838
ov13_0223C838: ; 0x0223C838
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _0223C8BC ; =ov13_0224F5B8
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp]
	add r0, r0, #0xc
	str r0, [sp]
	bl ov13_0223C508
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldr r0, _0223C8BC ; =ov13_0224F5B8
	ldr r0, [r0]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	beq _0223C8A8
	ldr r1, _0223C8C0 ; =ov13_0223C8C8
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_0223C8A8:
	ldr r1, _0223C8C4 ; =ov13_0223C924
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223C8BC: .word ov13_0224F5B8
_0223C8C0: .word ov13_0223C8C8
_0223C8C4: .word ov13_0223C924
	arm_func_end ov13_0223C838

	arm_func_start ov13_0223C8C8
ov13_0223C8C8: ; 0x0223C8C8
	stmdb sp!, {r4, lr}
	ldr r1, _0223C918 ; =ov13_0224F5B8
	mov r4, r0
	ldr r3, [r1]
	ldr r0, _0223C91C ; =0x04000050
	ldrsb r2, [r3, #0x1a]
	add r2, r2, #1
	strb r2, [r3, #0x1a]
	ldr r1, [r1]
	ldrsb r1, [r1, #0x1a]
	bl G2x_ChangeBlendBrightness_
	ldr r0, _0223C918 ; =ov13_0224F5B8
	ldr r0, [r0]
	ldrsb r0, [r0, #0x1a]
	cmp r0, #0
	ldmltia sp!, {r4, pc}
	ldr r1, _0223C920 ; =ov13_0223C924
	mov r0, r4
	bl ov13_022425C8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223C918: .word ov13_0224F5B8
_0223C91C: .word 0x04000050
_0223C920: .word ov13_0223C924
	arm_func_end ov13_0223C8C8

	arm_func_start ov13_0223C924
ov13_0223C924: ; 0x0223C924
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r1, _0223C9C8 ; =ov13_0224F5B8
	bic r2, r2, #0xe000
	str r2, [r3]
	ldr r1, [r1]
	mov r6, r0
	ldr r0, [r1]
	bl ov13_0223FD60
	ldr r0, _0223C9C8 ; =ov13_0224F5B8
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov13_0223FD60
	ldr r7, _0223C9C8 ; =ov13_0224F5B8
	ldr r4, _0223C9CC ; =ov13_02245934
	ldr r1, [r7]
	mov r5, #0
	ldrb r0, [r1, #0x1c]
	ldrb r0, [r4, r0]
	cmp r0, #0
	ble _0223C9A8
_0223C97C:
	add r0, r1, r5, lsl #2
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0223C990
	bl ov13_0223FD60
_0223C990:
	ldr r1, [r7]
	add r5, r5, #1
	ldrb r0, [r1, #0x1c]
	ldrb r0, [r4, r0]
	cmp r5, r0
	blt _0223C97C
_0223C9A8:
	ldr r0, [r1, #0x10]
	bl ov13_02240874
	mov r1, r6
	mov r0, #1
	bl ov13_022425D0
	ldr r0, _0223C9D0 ; =ov13_0224F5B8
	bl ov13_022412B0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223C9C8: .word ov13_0224F5B8
_0223C9CC: .word ov13_02245934
_0223C9D0: .word ov13_0224F5B8
	arm_func_end ov13_0223C924

	arm_func_start ov13_0223C9D4
ov13_0223C9D4: ; 0x0223C9D4
	stmdb sp!, {r3, lr}
	ldr r2, _0223CA10 ; =ov13_0224F5BC
	add r1, r0, #0x160
	str r0, [r2]
	add r0, r1, #0x1b000
	bl ov13_0223D66C
	ldr r1, _0223CA10 ; =ov13_0224F5BC
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x1b000
	str r2, [r0, #0x140]
	ldr r0, [r1]
	add r0, r0, #0x1b000
	str r2, [r0, #0x144]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223CA10: .word ov13_0224F5BC
	arm_func_end ov13_0223C9D4

	arm_func_start ov13_0223CA14
ov13_0223CA14: ; 0x0223CA14
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x7c
	mov r5, r0
	add r0, sp, #0x28
	mov r4, r1
	bl OS_GetOwnerInfo
	ldrb r2, [sp, #0x12]
	ldrb r1, [sp, #0x29]
	ldrh r3, [sp, #0x42]
	bic r2, r2, #0xf
	and r1, r1, #0xf
	orr r2, r2, r1
	strb r2, [sp, #0x12]
	add r0, sp, #0x2c
	add r1, sp, #0x14
	mov r2, r3, lsl #1
	strb r3, [sp, #0x13]
	bl MI_CpuCopy8
	ldrb r2, [sp, #0x12]
	ldr r0, _0223CB2C ; =ov13_0224F5BC
	add lr, sp, #4
	mov r1, #0
	ldr r0, [r0]
	bic r2, r2, #0xf0
	mov ip, r0
	strb r2, [sp, #0x12]
	strh r1, [lr]
	strh r1, [lr, #2]
	strh r1, [lr, #4]
	strh r1, [lr, #6]
	strh r1, [lr, #8]
	strh r1, [lr, #0xa]
	strh r1, [lr, #0xc]
	mov r3, #3
_0223CA9C:
	ldrh r2, [lr]
	ldrh r1, [lr, #2]
	add lr, lr, #4
	subs r3, r3, #1
	strh r2, [ip]
	strh r1, [ip, #2]
	add ip, ip, #4
	bne _0223CA9C
	ldrh r2, [lr]
	add r1, r0, #0x40
	add r1, r1, #0x10000
	strh r2, [ip]
	add r0, r0, #0x1b000
	str r1, [r0, #0x140]
	mov r1, #2
	str r1, [sp]
	ldr r0, _0223CB2C ; =ov13_0224F5BC
	add r1, sp, #0x12
	ldr r0, [r0]
	mov r2, r5
	add r0, r0, #0x1b000
	ldr r0, [r0, #0x140]
	mov r3, r4
	bl MB_Init
	cmp r0, #0
	beq _0223CB08
	bl OS_Terminate
_0223CB08:
	mov r0, #0x100
	mov r1, #1
	bl MB_SetParentCommParam
	ldr r0, _0223CB30 ; =ov13_0223D124
	bl MB_CommSetParentStateCallback
	mov r0, #1
	bl ov13_0223D448
	add sp, sp, #0x7c
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0223CB2C: .word ov13_0224F5BC
_0223CB30: .word ov13_0223D124
	arm_func_end ov13_0223CA14

	arm_func_start ov13_0223CB34
ov13_0223CB34: ; 0x0223CB34
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #2
	bl ov13_0223D448
	mov r0, r4
	bl MB_StartParentFromIdle
	cmp r0, #0
	beq _0223CB64
	mov r0, #7
	bl ov13_0223D448
	ldmia sp!, {r3, r4, r5, pc}
_0223CB64:
	mov r0, r5
	bl ov13_0223CB7C
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	bl OS_Terminate
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov13_0223CB34

	arm_func_start ov13_0223CB7C
ov13_0223CB7C: ; 0x0223CB7C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x48
	mov r6, r0
	ldr r0, [r6]
	mov r5, #0
	cmp r0, #0
	moveq r4, r5
	beq _0223CBC4
	add r0, sp, #0
	bl FS_InitFile
	ldr r1, [r6]
	add r0, sp, #0
	bl FS_OpenFile
	cmp r0, #0
	addeq sp, sp, #0x48
	moveq r0, r5
	ldmeqia sp!, {r4, r5, r6, pc}
	add r4, sp, #0
_0223CBC4:
	mov r0, r4
	bl MB_GetSegmentLength
	cmp r0, #0
	beq _0223CC30
	ldr r1, _0223CC4C ; =ov13_0224F5BC
	ldr r0, [r1]
	add r2, r0, #0x2c
	add r0, r0, #0x1b000
	str r2, [r0, #0x144]
	ldr r0, [r1]
	add r0, r0, #0x1b000
	ldr r1, [r0, #0x144]
	cmp r1, #0
	beq _0223CC30
	mov r0, r4
	mov r2, #0x10000
	bl MB_ReadSegment
	cmp r0, #0
	beq _0223CC30
	ldr r1, _0223CC4C ; =ov13_0224F5BC
	mov r0, r6
	ldr r1, [r1]
	add r1, r1, #0x1b000
	ldr r1, [r1, #0x144]
	bl MB_RegisterFile
	cmp r0, #0
	movne r5, #1
_0223CC30:
	add r0, sp, #0
	cmp r4, r0
	bne _0223CC40
	bl FS_CloseFile
_0223CC40:
	mov r0, r5
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0223CC4C: .word ov13_0224F5BC
	arm_func_end ov13_0223CB7C

	arm_func_start ov13_0223CC50
ov13_0223CC50: ; 0x0223CC50
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #1
	mov r4, r0
	bl MB_CommResponseRequest
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #1
	mvn r0, r0, lsl r4
	mov r5, r0, lsl #0x10
	bl OS_DisableInterrupts
	ldr r1, _0223CCEC ; =ov13_0224F5BC
	ldr r3, [r1]
	ldrh r2, [r3, #2]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #2]
	ldr r3, [r1]
	ldrh r2, [r3, #4]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #4]
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #6]
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #8]
	ldr r3, [r1]
	ldrh r2, [r3, #0xa]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #0xa]
	ldr r2, [r1]
	ldrh r1, [r2, #0xc]
	and r1, r1, r5, lsr #16
	strh r1, [r2, #0xc]
	bl OS_RestoreInterrupts
	mov r0, r4
	bl MB_DisconnectChild
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223CCEC: .word ov13_0224F5BC
	arm_func_end ov13_0223CC50

	arm_func_start ov13_0223CCF0
ov13_0223CCF0: ; 0x0223CCF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #0
	mov r4, r0
	bl MB_CommResponseRequest
	cmp r0, #0
	bne _0223CD8C
	mov r0, #1
	mvn r0, r0, lsl r4
	mov r5, r0, lsl #0x10
	bl OS_DisableInterrupts
	ldr r1, _0223CDC4 ; =ov13_0224F5BC
	ldr r3, [r1]
	ldrh r2, [r3, #2]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #2]
	ldr r3, [r1]
	ldrh r2, [r3, #4]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #4]
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #6]
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #8]
	ldr r3, [r1]
	ldrh r2, [r3, #0xa]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #0xa]
	ldr r2, [r1]
	ldrh r1, [r2, #0xc]
	and r1, r1, r5, lsr #16
	strh r1, [r2, #0xc]
	bl OS_RestoreInterrupts
	mov r0, r4
	bl MB_DisconnectChild
	ldmia sp!, {r3, r4, r5, pc}
_0223CD8C:
	bl OS_DisableInterrupts
	ldr r1, _0223CDC4 ; =ov13_0224F5BC
	mov r2, #1
	ldr r3, [r1]
	mvn r4, r2, lsl r4
	ldrh r2, [r3, #4]
	and r2, r2, r4
	strh r2, [r3, #4]
	ldr r2, [r1]
	ldrh r1, [r2, #2]
	and r1, r1, r4
	strh r1, [r2, #2]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223CDC4: .word ov13_0224F5BC
	arm_func_end ov13_0223CCF0

	arm_func_start ov13_0223CDC8
ov13_0223CDC8: ; 0x0223CDC8
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #2
	mov r4, r0
	bl MB_CommResponseRequest
	cmp r0, #0
	bne _0223CE64
	mov r0, #1
	mvn r0, r0, lsl r4
	mov r5, r0, lsl #0x10
	bl OS_DisableInterrupts
	ldr r1, _0223CE9C ; =ov13_0224F5BC
	ldr r3, [r1]
	ldrh r2, [r3, #2]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #2]
	ldr r3, [r1]
	ldrh r2, [r3, #4]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #4]
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #6]
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #8]
	ldr r3, [r1]
	ldrh r2, [r3, #0xa]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #0xa]
	ldr r2, [r1]
	ldrh r1, [r2, #0xc]
	and r1, r1, r5, lsr #16
	strh r1, [r2, #0xc]
	bl OS_RestoreInterrupts
	mov r0, r4
	bl MB_DisconnectChild
	ldmia sp!, {r3, r4, r5, pc}
_0223CE64:
	bl OS_DisableInterrupts
	ldr r1, _0223CE9C ; =ov13_0224F5BC
	mov ip, #1
	ldr r5, [r1]
	mvn r2, ip, lsl r4
	ldrh r3, [r5, #6]
	and r2, r3, r2
	strh r2, [r5, #6]
	ldr r2, [r1]
	ldrh r1, [r2, #8]
	orr r1, r1, ip, lsl r4
	strh r1, [r2, #8]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223CE9C: .word ov13_0224F5BC
	arm_func_end ov13_0223CDC8

	arm_func_start ov13_0223CEA0
ov13_0223CEA0: ; 0x0223CEA0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r0, #3
	bl ov13_0223D448
	mov r5, #1
	ldr r7, _0223CF7C ; =ov13_0224F5BC
	mov r4, r5
_0223CEB8:
	ldr r1, [r7]
	ldrh r0, [r1, #2]
	tst r0, r4, lsl r5
	beq _0223CF64
	ldrh r0, [r1, #4]
	tst r0, r4, lsl r5
	bne _0223CF64
	ldrh r0, [r1, #6]
	tst r0, r4, lsl r5
	bne _0223CF5C
	mvn r0, r4, lsl r5
	mov r6, r0, lsl #0x10
	bl OS_DisableInterrupts
	ldr r2, [r7]
	ldrh r1, [r2, #2]
	and r1, r1, r6, lsr #16
	strh r1, [r2, #2]
	ldr r2, [r7]
	ldrh r1, [r2, #4]
	and r1, r1, r6, lsr #16
	strh r1, [r2, #4]
	ldr r2, [r7]
	ldrh r1, [r2, #6]
	and r1, r1, r6, lsr #16
	strh r1, [r2, #6]
	ldr r2, [r7]
	ldrh r1, [r2, #8]
	and r1, r1, r6, lsr #16
	strh r1, [r2, #8]
	ldr r2, [r7]
	ldrh r1, [r2, #0xa]
	and r1, r1, r6, lsr #16
	strh r1, [r2, #0xa]
	ldr r2, [r7]
	ldrh r1, [r2, #0xc]
	and r1, r1, r6, lsr #16
	strh r1, [r2, #0xc]
	bl OS_RestoreInterrupts
	mov r0, r5
	bl MB_DisconnectChild
	b _0223CF64
_0223CF5C:
	mov r0, r5
	bl ov13_0223CDC8
_0223CF64:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	cmp r5, #0x10
	blo _0223CEB8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223CF7C: .word ov13_0224F5BC
	arm_func_end ov13_0223CEA0

	arm_func_start ov13_0223CF80
ov13_0223CF80: ; 0x0223CF80
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _0223CFE4 ; =ov13_0224F5BC
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r6, #1
	mov r5, r6
_0223CFA4:
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	tst r0, r5, lsl r6
	beq _0223CFC8
	mov r0, r6
	bl MB_CommIsBootable
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
_0223CFC8:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, lsr #0x10
	cmp r6, #0x10
	blo _0223CFA4
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0223CFE4: .word ov13_0224F5BC
	arm_func_end ov13_0223CF80

	arm_func_start ov13_0223CFE8
ov13_0223CFE8: ; 0x0223CFE8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, #1
	ldr r4, _0223D0DC ; =ov13_0224F5BC
	mov r8, #0
	mov r5, #3
	mov r6, r7
_0223D000:
	ldr r0, [r4]
	ldrh r0, [r0, #0xa]
	tst r0, r6, lsl r7
	beq _0223D0A8
	mov r0, r7
	mov r1, r5
	bl MB_CommResponseRequest
	cmp r0, #0
	orrne r0, r8, r6, lsl r7
	movne r0, r0, lsl #0x10
	movne r8, r0, lsr #0x10
	bne _0223D0A8
	mvn r0, r6, lsl r7
	mov sb, r0, lsl #0x10
	bl OS_DisableInterrupts
	ldr r2, [r4]
	ldrh r1, [r2, #2]
	and r1, r1, sb, lsr #16
	strh r1, [r2, #2]
	ldr r2, [r4]
	ldrh r1, [r2, #4]
	and r1, r1, sb, lsr #16
	strh r1, [r2, #4]
	ldr r2, [r4]
	ldrh r1, [r2, #6]
	and r1, r1, sb, lsr #16
	strh r1, [r2, #6]
	ldr r2, [r4]
	ldrh r1, [r2, #8]
	and r1, r1, sb, lsr #16
	strh r1, [r2, #8]
	ldr r2, [r4]
	ldrh r1, [r2, #0xa]
	and r1, r1, sb, lsr #16
	strh r1, [r2, #0xa]
	ldr r2, [r4]
	ldrh r1, [r2, #0xc]
	and r1, r1, sb, lsr #16
	strh r1, [r2, #0xc]
	bl OS_RestoreInterrupts
	mov r0, r7
	bl MB_DisconnectChild
_0223D0A8:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	cmp r7, #0x10
	blo _0223D000
	cmp r8, #0
	bne _0223D0D0
	mov r0, #7
	bl ov13_0223D448
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0223D0D0:
	mov r0, #4
	bl ov13_0223D448
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0223D0DC: .word ov13_0224F5BC
	arm_func_end ov13_0223CFE8

	arm_func_start ov13_0223D0E0
ov13_0223D0E0: ; 0x0223D0E0
	stmdb sp!, {r3, lr}
	mov r0, #6
	bl ov13_0223D448
	bl MB_End
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0223D0E0

	arm_func_start ov13_0223D0F4
ov13_0223D0F4: ; 0x0223D0F4
	stmdb sp!, {r3, lr}
	ldr r0, _0223D120 ; =ov13_0224F5BC
	ldr r2, [r0]
	ldrh r0, [r2]
	cmp r0, #4
	ldreqh r1, [r2, #2]
	ldreqh r0, [r2, #0xc]
	cmpeq r1, r0
	ldmneia sp!, {r3, pc}
	bl MB_End
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223D120: .word ov13_0224F5BC
	arm_func_end ov13_0223D0F4

	arm_func_start ov13_0223D124
ov13_0223D124: ; 0x0223D124
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r2
	cmp r1, #0xe
	addls pc, pc, r1, lsl #2
	b _0223D43C
_0223D13C: ; jump table
	b _0223D43C ; case 0
	ldmia sp!, {r4, r5, r6, pc} ; case 1
	b _0223D178 ; case 2
	b _0223D200 ; case 3
	ldmia sp!, {r4, r5, r6, pc} ; case 4
	ldmia sp!, {r4, r5, r6, pc} ; case 5
	ldmia sp!, {r4, r5, r6, pc} ; case 6
	b _0223D33C ; case 7
	ldmia sp!, {r4, r5, r6, pc} ; case 8
	b _0223D36C ; case 9
	b _0223D28C ; case 10
	ldmia sp!, {r4, r5, r6, pc} ; case 11
	b _0223D3A0 ; case 12
	b _0223D3FC ; case 13
	b _0223D2F8 ; case 14
_0223D178:
	bl ov13_0223D45C
	cmp r0, #2
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r0, _0223D444 ; =ov13_0224F5BC
	ldr r6, [r0]
	bl OS_DisableInterrupts
	ldrh r2, [r6, #2]
	mov r1, #1
	orr r1, r2, r1, lsl r5
	strh r1, [r6, #2]
	bl OS_RestoreInterrupts
	ldr r1, _0223D444 ; =ov13_0224F5BC
	sub r3, r5, #1
	mov r0, #0x1e
	mul r0, r3, r0
	ldr r2, [r1]
	add r3, r2, #0x24
	ldrb r2, [r4, #0xa]
	add ip, r3, r0
	strb r2, [r3, r0]
	ldrb r2, [r4, #0xb]
	strb r2, [ip, #1]
	ldrb r2, [r4, #0xc]
	strb r2, [ip, #2]
	ldrb r2, [r4, #0xd]
	strb r2, [ip, #3]
	ldrb r2, [r4, #0xe]
	strb r2, [ip, #4]
	ldrb r2, [r4, #0xf]
	strb r2, [ip, #5]
	ldr r1, [r1]
	add r0, r1, r0
	strh r5, [r0, #0x2a]
	ldmia sp!, {r4, r5, r6, pc}
_0223D200:
	bl ov13_0223D4C8
	cmp r0, #6
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	mvn r0, r0, lsl r5
	mov r4, r0, lsl #0x10
	bl OS_DisableInterrupts
	ldr r1, _0223D444 ; =ov13_0224F5BC
	ldr r3, [r1]
	ldrh r2, [r3, #2]
	and r2, r2, r4, lsr #16
	strh r2, [r3, #2]
	ldr r3, [r1]
	ldrh r2, [r3, #4]
	and r2, r2, r4, lsr #16
	strh r2, [r3, #4]
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	and r2, r2, r4, lsr #16
	strh r2, [r3, #6]
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	and r2, r2, r4, lsr #16
	strh r2, [r3, #8]
	ldr r3, [r1]
	ldrh r2, [r3, #0xa]
	and r2, r2, r4, lsr #16
	strh r2, [r3, #0xa]
	ldr r2, [r1]
	ldrh r1, [r2, #0xc]
	and r1, r1, r4, lsr #16
	strh r1, [r2, #0xc]
	bl OS_RestoreInterrupts
	bl ov13_0223D0F4
	ldmia sp!, {r4, r5, r6, pc}
_0223D28C:
	bl ov13_0223D45C
	cmp r0, #2
	beq _0223D2A4
	mov r0, r5
	bl ov13_0223CCF0
	ldmia sp!, {r4, r5, r6, pc}
_0223D2A4:
	ldr r0, _0223D444 ; =ov13_0224F5BC
	mov r1, #1
	ldr r3, [r0]
	mov r0, r5
	ldrh r2, [r3, #4]
	orr r1, r2, r1, lsl r5
	strh r1, [r3, #4]
	bl ov13_0223CC50
	mov r0, r5
	bl MB_CommGetChildUser
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r1, _0223D444 ; =ov13_0224F5BC
	sub r2, r5, #1
	ldr r3, [r1]
	mov r1, #0x1e
	add r3, r3, #0xe
	mla r1, r2, r1, r3
	mov r2, #0x16
	bl MI_CpuCopy8
	ldmia sp!, {r4, r5, r6, pc}
_0223D2F8:
	ldr r0, _0223D444 ; =ov13_0224F5BC
	mov r4, #1
	ldr r3, [r0]
	mvn r1, r4, lsl r5
	ldrh r2, [r3, #4]
	and r1, r2, r1
	strh r1, [r3, #4]
	ldr r1, [r0]
	ldrh r0, [r1, #6]
	orr r0, r0, r4, lsl r5
	strh r0, [r1, #6]
	bl ov13_0223D45C
	cmp r0, #3
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl ov13_0223CDC8
	ldmia sp!, {r4, r5, r6, pc}
_0223D33C:
	ldr r0, _0223D444 ; =ov13_0224F5BC
	mov r4, #1
	ldr r3, [r0]
	mvn r1, r4, lsl r5
	ldrh r2, [r3, #8]
	and r1, r2, r1
	strh r1, [r3, #8]
	ldr r1, [r0]
	ldrh r0, [r1, #0xa]
	orr r0, r0, r4, lsl r5
	strh r0, [r1, #0xa]
	ldmia sp!, {r4, r5, r6, pc}
_0223D36C:
	ldr r0, _0223D444 ; =ov13_0224F5BC
	mov r4, #1
	ldr r3, [r0]
	mvn r1, r4, lsl r5
	ldrh r2, [r3, #0xa]
	and r1, r2, r1
	strh r1, [r3, #0xa]
	ldr r1, [r0]
	ldrh r0, [r1, #0xc]
	orr r0, r0, r4, lsl r5
	strh r0, [r1, #0xc]
	bl ov13_0223D0F4
	ldmia sp!, {r4, r5, r6, pc}
_0223D3A0:
	bl ov13_0223D45C
	cmp r0, #4
	bne _0223D3B8
	mov r0, #5
	bl ov13_0223D448
	b _0223D3C0
_0223D3B8:
	mov r0, #0
	bl ov13_0223D448
_0223D3C0:
	ldr r0, _0223D444 ; =ov13_0224F5BC
	ldr r0, [r0]
	add r0, r0, #0x1b000
	ldr r1, [r0, #0x144]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0x144]
	ldr r0, _0223D444 ; =ov13_0224F5BC
	ldr r0, [r0]
	add r0, r0, #0x1b000
	ldr r1, [r0, #0x140]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0x140]
	ldmia sp!, {r4, r5, r6, pc}
_0223D3FC:
	ldrh r0, [r4]
	cmp r0, #8
	bgt _0223D428
	ldmgeia sp!, {r4, r5, r6, pc}
	cmp r0, #2
	ldmgtia sp!, {r4, r5, r6, pc}
	cmp r0, #1
	ldmltia sp!, {r4, r5, r6, pc}
	cmpne r0, #2
	beq _0223D430
	ldmia sp!, {r4, r5, r6, pc}
_0223D428:
	cmp r0, #9
	ldmneia sp!, {r4, r5, r6, pc}
_0223D430:
	mov r0, #7
	bl ov13_0223D448
	ldmia sp!, {r4, r5, r6, pc}
_0223D43C:
	bl OS_Terminate
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0223D444: .word ov13_0224F5BC
	arm_func_end ov13_0223D124

	arm_func_start ov13_0223D448
ov13_0223D448: ; 0x0223D448
	ldr r1, _0223D458 ; =ov13_0224F5BC
	ldr r1, [r1]
	strh r0, [r1]
	bx lr
	.balign 4, 0
_0223D458: .word ov13_0224F5BC
	arm_func_end ov13_0223D448

	arm_func_start ov13_0223D45C
ov13_0223D45C: ; 0x0223D45C
	ldr r0, _0223D46C ; =ov13_0224F5BC
	ldr r0, [r0]
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
_0223D46C: .word ov13_0224F5BC
	arm_func_end ov13_0223D45C

	arm_func_start ov13_0223D470
ov13_0223D470: ; 0x0223D470
	ldr r2, _0223D4BC ; =ov13_0224F5BC
	ldr r1, _0223D4C0 ; =ov13_022468D8
	ldr ip, [r2]
	ldr r2, _0223D4C4 ; =ov13_022468D8
	add r3, ip, #2
	str r3, [r1]
	add r3, ip, #4
	str r3, [r1, #4]
	add r3, ip, #6
	str r3, [r1, #8]
	add r3, ip, #8
	str r3, [r1, #0xc]
	add r3, ip, #0xa
	str r3, [r1, #0x10]
	add r3, ip, #0xc
	str r3, [r1, #0x14]
	ldr r0, [r2, r0, lsl #2]
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
_0223D4BC: .word ov13_0224F5BC
_0223D4C0: .word ov13_022468D8
_0223D4C4: .word ov13_022468D8
	arm_func_end ov13_0223D470

	arm_func_start ov13_0223D4C8
ov13_0223D4C8: ; 0x0223D4C8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r1, _0223D58C ; =ov13_0224F5BC
	mov r3, #1
	ldr r2, [r1]
	mov r3, r3, lsl r4
	ldrh r1, [r2, #2]
	mov r4, r3, lsl #0x10
	mov r5, r0
	tst r1, r4, lsr #16
	bne _0223D50C
	bl OS_RestoreInterrupts
	add sp, sp, #0x10
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0223D50C:
	mov r0, r2
	add r1, sp, #0
	mov r2, #0xe
	bl MI_CpuCopy8
	mov r0, r5
	bl OS_RestoreInterrupts
	ldrh r0, [sp, #4]
	tst r0, r4, lsr #16
	addne sp, sp, #0x10
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrh r0, [sp, #6]
	tst r0, r4, lsr #16
	addne sp, sp, #0x10
	movne r0, #3
	ldmneia sp!, {r3, r4, r5, pc}
	ldrh r0, [sp, #8]
	tst r0, r4, lsr #16
	addne sp, sp, #0x10
	movne r0, #4
	ldmneia sp!, {r3, r4, r5, pc}
	ldrh r0, [sp, #0xa]
	tst r0, r4, lsr #16
	addne sp, sp, #0x10
	movne r0, #5
	ldmneia sp!, {r3, r4, r5, pc}
	ldrh r0, [sp, #0xc]
	tst r0, r4, lsr #16
	movne r0, #6
	moveq r0, #1
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223D58C: .word ov13_0224F5BC
	arm_func_end ov13_0223D4C8

	arm_func_start ov13_0223D590
ov13_0223D590: ; 0x0223D590
	ldr r1, _0223D5C0 ; =ov13_0224F5BC
	mov r2, #1
	ldr r3, [r1]
	ldrh r1, [r3, #2]
	tst r1, r2, lsl r0
	moveq r0, #0
	bxeq lr
	sub r1, r0, #1
	add r2, r3, #0xe
	mov r0, #0x1e
	mla r0, r1, r0, r2
	bx lr
	.balign 4, 0
_0223D5C0: .word ov13_0224F5BC
	arm_func_end ov13_0223D590

	arm_func_start ov13_0223D5C4
ov13_0223D5C4: ; 0x0223D5C4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _0223D668 ; =ov13_0224F5BC
	mov lr, #1
	ldr r5, [r1]
	mov ip, lr
	ldrh r4, [r5, #2]
	add r1, r5, #0x24
	mov r6, #0x1e
_0223D5E4:
	tst r4, ip, lsl lr
	beq _0223D64C
	sub r2, lr, #1
	mul r3, r2, r6
	ldrb r8, [r0]
	ldrb r7, [r1, r3]
	add r2, r1, r3
	cmp r8, r7
	ldreqb r8, [r0, #1]
	ldreqb r7, [r2, #1]
	cmpeq r8, r7
	ldreqb r8, [r0, #2]
	ldreqb r7, [r2, #2]
	cmpeq r8, r7
	ldreqb r8, [r0, #3]
	ldreqb r7, [r2, #3]
	cmpeq r8, r7
	ldreqb r8, [r0, #4]
	ldreqb r7, [r2, #4]
	cmpeq r8, r7
	ldreqb r7, [r0, #5]
	ldreqb r2, [r2, #5]
	cmpeq r7, r2
	addeq r0, r5, r3
	ldreqh r0, [r0, #0x2a]
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_0223D64C:
	add r2, lr, #1
	mov r2, r2, lsl #0x10
	mov lr, r2, lsr #0x10
	cmp lr, #2
	blo _0223D5E4
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223D668: .word ov13_0224F5BC
	arm_func_end ov13_0223D5C4

	arm_func_start ov13_0223D66C
ov13_0223D66C: ; 0x0223D66C
	ldr r1, _0223D6A4 ; =ov13_0224F5C0
	mov r2, #0
	str r0, [r1, #4]
	str r2, [r0, #0x40]
	ldr r0, [r1, #4]
	add r0, r0, #0x1000
	str r2, [r0, #0x3a8]
	ldr r0, [r1, #4]
	add r0, r0, #0x1000
	str r2, [r0, #0x3ac]
	ldr r0, [r1, #4]
	add r0, r0, #0x1000
	str r2, [r0, #0x3b0]
	bx lr
	.balign 4, 0
_0223D6A4: .word ov13_0224F5C0
	arm_func_end ov13_0223D66C

	arm_func_start ov13_0223D6A8
ov13_0223D6A8: ; 0x0223D6A8
	stmdb sp!, {r4, lr}
	ldr r1, _0223D714 ; =ov13_0224F5C0
	mov r4, r0
	ldr r3, [r1]
	cmp r3, #0
	beq _0223D6DC
	ldr r1, [r1, #4]
	ldr r0, _0223D718 ; =ov13_02247120
	ldr r2, [r1, #0x40]
	ldr r1, _0223D71C ; =ov13_02247200
	ldr r2, [r0, r2, lsl #2]
	mov r0, #0x8000000
	blx r3
_0223D6DC:
	ldr r0, _0223D714 ; =ov13_0224F5C0
	ldr r1, [r0, #4]
	str r4, [r1, #0x40]
	ldr r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r0, #4]
	ldr r0, _0223D718 ; =ov13_02247120
	ldr r2, [r1, #0x40]
	ldr r1, _0223D720 ; =ov13_02247208
	ldr r2, [r0, r2, lsl #2]
	mov r0, #0x8000000
	blx r3
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223D714: .word ov13_0224F5C0
_0223D718: .word ov13_02247120
_0223D71C: .word ov13_02247200
_0223D720: .word ov13_02247208
	arm_func_end ov13_0223D6A8

	arm_func_start ov13_0223D724
ov13_0223D724: ; 0x0223D724
	ldr r1, _0223D740 ; =ov13_0224F5C0
	ldr r2, [r1, #4]
	ldr r1, [r2, #0x40]
	sub r1, r1, #9
	cmp r1, #1
	strhi r0, [r2, #0x54]
	bx lr
	.balign 4, 0
_0223D740: .word ov13_0224F5C0
	arm_func_end ov13_0223D724

	arm_func_start ov13_0223D744
ov13_0223D744: ; 0x0223D744
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r1, _0223D780 ; =ov13_0224F5C0
	ldr r0, _0223D784 ; =ov13_0223D788
	ldr r1, [r1, #4]
	bl WM_SetParentParameter
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223D780: .word ov13_0224F5C0
_0223D784: .word ov13_0223D788
	arm_func_end ov13_0223D744

	arm_func_start ov13_0223D788
ov13_0223D788: ; 0x0223D788
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223D7A8
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
_0223D7A8:
	ldr r0, _0223D7F0 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x3ac]
	cmp r0, #0
	beq _0223D7D8
	bl ov13_0223D7F4
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
_0223D7D8:
	bl ov13_0223D890
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223D7F0: .word ov13_0224F5C0
	arm_func_end ov13_0223D788

	arm_func_start ov13_0223D7F4
ov13_0223D7F4: ; 0x0223D7F4
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223D850 ; =ov13_0224F5C0
	ldr r1, [r0, #4]
	add r0, r1, #0x1000
	ldr r2, [r0, #0x3ac]
	add r0, r1, #0x13c0
	blx r2
	ldr r2, _0223D850 ; =ov13_0224F5C0
	mov r1, r0
	ldr r2, [r2, #4]
	ldr r0, _0223D854 ; =ov13_0223D858
	add r2, r2, #0x13c0
	bl WM_SetWEPKey
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223D850: .word ov13_0224F5C0
_0223D854: .word ov13_0223D858
	arm_func_end ov13_0223D7F4

	arm_func_start ov13_0223D858
ov13_0223D858: ; 0x0223D858
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223D878
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
_0223D878:
	bl ov13_0223D890
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0223D858

	arm_func_start ov13_0223D890
ov13_0223D890: ; 0x0223D890
	stmdb sp!, {r3, lr}
	ldr r0, _0223D8EC ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	sub r0, r0, #4
	cmp r0, #2
	movls r0, #1
	ldmlsia sp!, {r3, pc}
	ldr r0, _0223D8F0 ; =ov13_0223D8F4
	bl WM_StartParent
	cmp r0, #2
	beq _0223D8CC
	bl ov13_0223D724
	mov r0, #0
	ldmia sp!, {r3, pc}
_0223D8CC:
	ldr r1, _0223D8EC ; =ov13_0224F5C0
	mov r3, #0
	ldr r2, [r1, #4]
	mov r0, #1
	strh r3, [r2, #0x50]
	ldr r1, [r1, #4]
	strh r0, [r1, #0x52]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223D8EC: .word ov13_0224F5C0
_0223D8F0: .word ov13_0223D8F4
	arm_func_end ov13_0223D890

	arm_func_start ov13_0223D8F4
ov13_0223D8F4: ; 0x0223D8F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldrh r2, [r4, #0x10]
	ldrh r0, [r4, #2]
	mov r1, #1
	mov r1, r1, lsl r2
	cmp r0, #0
	mov r5, r1, lsl #0x10
	beq _0223D928
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r3, r4, r5, pc}
_0223D928:
	ldrh ip, [r4, #8]
	cmp ip, #7
	bgt _0223D958
	bge _0223D964
	cmp ip, #2
	bgt _0223DA30
	cmp ip, #0
	blt _0223DA30
	beq _0223DA18
	cmp ip, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	b _0223DA30
_0223D958:
	cmp ip, #9
	beq _0223D9E0
	b _0223DA30
_0223D964:
	ldr r0, _0223DA54 ; =ov13_0224F5C0
	ldr r3, [r0]
	cmp r3, #0
	beq _0223D980
	ldr r1, _0223DA58 ; =ov13_0224720C
	mov r0, #0x8000000
	blx r3
_0223D980:
	ldr r0, _0223DA54 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	ldr r1, [r0, #0x4c]
	cmp r1, #0
	beq _0223D9C8
	mov r0, r4
	blx r1
	cmp r0, #0
	bne _0223D9C8
	ldrh r1, [r4, #0x10]
	mov r0, #0
	bl WM_Disconnect
	cmp r0, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r3, r4, r5, pc}
_0223D9C8:
	ldr r0, _0223DA54 ; =ov13_0224F5C0
	ldr r1, [r0, #4]
	ldrh r0, [r1, #0x52]
	orr r0, r0, r5, lsr #16
	strh r0, [r1, #0x52]
	ldmia sp!, {r3, r4, r5, pc}
_0223D9E0:
	ldr r0, _0223DA54 ; =ov13_0224F5C0
	ldr r3, [r0]
	cmp r3, #0
	beq _0223D9FC
	ldr r1, _0223DA5C ; =ov13_02247238
	mov r0, #0x8000000
	blx r3
_0223D9FC:
	ldr r0, _0223DA54 ; =ov13_0224F5C0
	mvn r1, r5, lsr #16
	ldr r2, [r0, #4]
	ldrh r0, [r2, #0x52]
	and r0, r0, r1
	strh r0, [r2, #0x52]
	ldmia sp!, {r3, r4, r5, pc}
_0223DA18:
	bl ov13_0223DA64
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r3, r4, r5, pc}
_0223DA30:
	ldr r0, _0223DA54 ; =ov13_0224F5C0
	ldr r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0223DA60 ; =ov13_02247264
	mov r2, ip
	mov r0, #0x8000000
	blx r3
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223DA54: .word ov13_0224F5C0
_0223DA58: .word ov13_0224720C
_0223DA5C: .word ov13_02247238
_0223DA60: .word ov13_02247264
	arm_func_end ov13_0223D8F4

	arm_func_start ov13_0223DA64
ov13_0223DA64: ; 0x0223DA64
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _0223DAF4 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	sub r0, r0, #4
	cmp r0, #2
	addls sp, sp, #8
	movls r0, #1
	ldmlsia sp!, {r3, pc}
	mov r0, #4
	bl ov13_0223D6A8
	ldr r0, _0223DAF4 ; =ov13_0224F5C0
	mov ip, #1
	ldr lr, [r0, #4]
	ldr r0, _0223DAF8 ; =ov13_0223DAFC
	add r3, lr, #0x1000
	ldr r1, [r3, #0x2a0]
	add r2, lr, #0x60
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	stmia sp, {r1, ip}
	ldr r3, [r3, #0x2a4]
	add r1, r2, #0x1000
	mov r2, r3, lsl #0x10
	mov r2, r2, lsr #0x10
	add r3, lr, #0xf80
	bl WM_StartMP
	cmp r0, #2
	addeq sp, sp, #8
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223DAF4: .word ov13_0224F5C0
_0223DAF8: .word ov13_0223DAFC
	arm_func_end ov13_0223DA64

	arm_func_start ov13_0223DAFC
ov13_0223DAFC: ; 0x0223DAFC
	stmdb sp!, {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _0223DB20
	mov r0, r1
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
_0223DB20:
	ldrh r2, [r0, #4]
	sub r0, r2, #0xa
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0223DBFC
_0223DB34: ; jump table
	b _0223DB44 ; case 0
	ldmia sp!, {r3, pc} ; case 1
	b _0223DBFC ; case 2
	b _0223DBFC ; case 3
_0223DB44:
	ldr r0, _0223DC1C ; =ov13_0224F5C0
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x44]
	cmp r0, #2
	bne _0223DBA4
	ldr r0, [r1, #0x40]
	cmp r0, #4
	bne _0223DB98
	bl ov13_0223DC28
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0223DC1C ; =ov13_0224F5C0
	ldr r2, [r0]
	cmp r2, #0
	beq _0223DB8C
	ldr r1, _0223DC20 ; =ov13_02247284
	mov r0, #0x8000000
	blx r2
_0223DB8C:
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
_0223DB98:
	cmp r0, #6
	bne _0223DBF0
	ldmia sp!, {r3, pc}
_0223DBA4:
	cmp r0, #4
	bne _0223DBF0
	add r0, r1, #0x3e0
	mov ip, #1
	add r0, r0, #0x1000
	mov r1, #0xd
	mov r2, #7
	mov r3, #0x44
	str ip, [sp]
	bl WM_StartDataSharing
	cmp r0, #0
	beq _0223DBE4
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
_0223DBE4:
	mov r0, #5
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
_0223DBF0:
	mov r0, #4
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
_0223DBFC:
	ldr r0, _0223DC1C ; =ov13_0224F5C0
	ldr r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _0223DC24 ; =ov13_02247264
	mov r0, #0x8000000
	blx r3
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223DC1C: .word ov13_0224F5C0
_0223DC20: .word ov13_02247284
_0223DC24: .word ov13_02247264
	arm_func_end ov13_0223DAFC

	arm_func_start ov13_0223DC28
ov13_0223DC28: ; 0x0223DC28
	stmdb sp!, {r3, lr}
	mov r0, #6
	bl ov13_0223D6A8
	ldr r0, _0223DC60 ; =ov13_0224F5C0
	mov r1, #0xd
	ldr r0, [r0, #4]
	add r0, r0, #0x1e00
	bl WM_StartKeySharing
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223DC60: .word ov13_0224F5C0
	arm_func_end ov13_0223DC28

	arm_func_start ov13_0223DC64
ov13_0223DC64: ; 0x0223DC64
	stmdb sp!, {r3, lr}
	ldr r0, _0223DC90 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	add r0, r0, #0x1e00
	bl WM_EndKeySharing
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223DC90: .word ov13_0224F5C0
	arm_func_end ov13_0223DC64

	arm_func_start ov13_0223DC94
ov13_0223DC94: ; 0x0223DC94
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223DCC0 ; =ov13_0223DCC4
	bl WM_EndMP
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223DCC0: .word ov13_0223DCC4
	arm_func_end ov13_0223DC94

	arm_func_start ov13_0223DCC4
ov13_0223DCC4: ; 0x0223DCC4
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223DCE0
	bl ov13_0223D724
	bl ov13_0223E698
	ldmia sp!, {r3, pc}
_0223DCE0:
	bl ov13_0223DD18
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0223DD10 ; =ov13_0224F5C0
	ldr r2, [r0]
	cmp r2, #0
	beq _0223DD08
	ldr r1, _0223DD14 ; =ov13_022472B4
	mov r0, #0x8000000
	blx r2
_0223DD08:
	bl ov13_0223E698
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223DD10: .word ov13_0224F5C0
_0223DD14: .word ov13_022472B4
	arm_func_end ov13_0223DCC4

	arm_func_start ov13_0223DD18
ov13_0223DD18: ; 0x0223DD18
	stmdb sp!, {r3, lr}
	ldr r0, _0223DD3C ; =ov13_0223DD40
	bl WM_EndParent
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223DD3C: .word ov13_0223DD40
	arm_func_end ov13_0223DD18

	arm_func_start ov13_0223DD40
ov13_0223DD40: ; 0x0223DD40
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223DD58
	bl ov13_0223D724
	ldmia sp!, {r3, pc}
_0223DD58:
	mov r0, #1
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0223DD40

	arm_func_start ov13_0223DD64
ov13_0223DD64: ; 0x0223DD64
	stmdb sp!, {r3, lr}
	ldr r0, _0223DDB0 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #6
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223DDB0 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	add r0, r0, #0x1e00
	bl WM_EndKeySharing
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223DDB0: .word ov13_0224F5C0
	arm_func_end ov13_0223DD64

	arm_func_start ov13_0223DDB4
ov13_0223DDB4: ; 0x0223DDB4
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223DDE0 ; =ov13_0223DDE4
	bl WM_EndMP
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223DDE0: .word ov13_0223DDE4
	arm_func_end ov13_0223DDB4

	arm_func_start ov13_0223DDE4
ov13_0223DDE4: ; 0x0223DDE4
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223DE00
	bl ov13_0223D724
	bl ov13_0223E6B4
	ldmia sp!, {r3, pc}
_0223DE00:
	bl ov13_0223DE18
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0223DDE4

	arm_func_start ov13_0223DE18
ov13_0223DE18: ; 0x0223DE18
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223DE4C ; =ov13_0223DE50
	mov r1, #0
	bl WM_Disconnect
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	bl ov13_0223E698
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223DE4C: .word ov13_0223DE50
	arm_func_end ov13_0223DE18

	arm_func_start ov13_0223DE50
ov13_0223DE50: ; 0x0223DE50
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223DE68
	bl ov13_0223D724
	ldmia sp!, {r3, pc}
_0223DE68:
	mov r0, #1
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0223DE50

	arm_func_start ov13_0223DE74
ov13_0223DE74: ; 0x0223DE74
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223DEA0 ; =ov13_0223DEA4
	bl WM_Reset
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223DEA0: .word ov13_0223DEA4
	arm_func_end ov13_0223DE74

	arm_func_start ov13_0223DEA4
ov13_0223DEA4: ; 0x0223DEA4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0223DECC
	mov r0, #9
	bl ov13_0223D6A8
	ldrh r0, [r4, #2]
	bl ov13_0223D724
	ldmia sp!, {r4, pc}
_0223DECC:
	mov r0, #1
	bl ov13_0223D6A8
	ldmia sp!, {r4, pc}
	arm_func_end ov13_0223DEA4

	arm_func_start ov13_0223DED8
ov13_0223DED8: ; 0x0223DED8
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223DEF4
	mov r0, #0xa
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
_0223DEF4:
	mov r0, #0
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0223DED8

	arm_func_start ov13_0223DF00
ov13_0223DF00: ; 0x0223DF00
	ldr r1, _0223DF10 ; =ov13_0224F5C0
	ldr r1, [r1, #4]
	str r0, [r1, #8]
	bx lr
	.balign 4, 0
_0223DF10: .word ov13_0224F5C0
	arm_func_end ov13_0223DF00

	arm_func_start ov13_0223DF14
ov13_0223DF14: ; 0x0223DF14
	ldr r0, _0223DF24 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0x52]
	bx lr
	.balign 4, 0
_0223DF24: .word ov13_0224F5C0
	arm_func_end ov13_0223DF14

	arm_func_start ov13_0223DF28
ov13_0223DF28: ; 0x0223DF28
	ldr r0, _0223DF38 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	bx lr
	.balign 4, 0
_0223DF38: .word ov13_0224F5C0
	arm_func_end ov13_0223DF28

	arm_func_start ov13_0223DF3C
ov13_0223DF3C: ; 0x0223DF3C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r0, sp, #0
	bl OS_GetMacAddress
	ldr r2, _0223E008 ; =0x027FFC3C
	ldrh r0, [sp]
	ldr r3, [r2]
	ldrh r2, [sp, #2]
	add r0, r0, r3
	ldr r1, _0223E00C ; =ov13_0224F5C0
	add r2, r2, r0
	ldrh r3, [sp, #4]
	ldr r0, [r1, #4]
	add r2, r3, r2
	str r2, [r0, #0x58]
	ldr ip, [r1, #4]
	ldr r0, _0223E010 ; =0x00010DCD
	ldr r2, [ip, #0x58]
	mov r3, #0
	mul r0, r2, r0
	add r0, r0, #0x39
	add r0, r0, #0x3000
	str r0, [ip, #0x58]
	ldr r0, [r1, #4]
	mov r2, #0x65
	strh r3, [r0, #0x5c]
	ldr r1, [r1, #4]
	mov r0, #3
	strh r2, [r1, #0x5e]
	bl ov13_0223D6A8
	mov r0, #1
	bl ov13_0223E014
	cmp r0, #0x18
	bne _0223DFE0
	mov r0, #0x18
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r3, pc}
_0223DFE0:
	cmp r0, #2
	addeq sp, sp, #8
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223E008: .word 0x027FFC3C
_0223E00C: .word ov13_0224F5C0
_0223E010: .word 0x00010DCD
	arm_func_end ov13_0223DF3C

	arm_func_start ov13_0223E014
ov13_0223E014: ; 0x0223E014
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl WM_GetAllowedChannel
	cmp r0, #0x8000
	bne _0223E040
	mov r0, #3
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	mov r0, #3
	ldmia sp!, {r4, pc}
_0223E040:
	cmp r0, #0
	bne _0223E060
	mov r0, #0x16
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	mov r0, #0x18
	ldmia sp!, {r4, pc}
_0223E060:
	sub r1, r4, #1
	mov r2, #1
	tst r0, r2, lsl r1
	bne _0223E094
_0223E070:
	add r1, r4, #1
	mov r1, r1, lsl #0x10
	mov r4, r1, lsr #0x10
	cmp r4, #0x10
	movhi r0, #0x18
	ldmhiia sp!, {r4, pc}
	sub r1, r4, #1
	tst r0, r2, lsl r1
	beq _0223E070
_0223E094:
	ldr r0, _0223E0AC ; =ov13_0223E0B0
	mov r1, r4
	bl ov13_0223E188
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223E0AC: .word ov13_0223E0B0
	arm_func_end ov13_0223E014

	arm_func_start ov13_0223E0B0
ov13_0223E0B0: ; 0x0223E0B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0223E0D4
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r4, pc}
_0223E0D4:
	ldr r0, _0223E180 ; =ov13_0224F5C0
	ldr ip, [r0]
	cmp ip, #0
	beq _0223E0F8
	ldrh r2, [r4, #8]
	ldrh r3, [r4, #0xa]
	ldr r1, _0223E184 ; =ov13_0224730C
	mov r0, #0x8000000
	blx ip
_0223E0F8:
	ldr r0, _0223E180 ; =ov13_0224F5C0
	ldrh r2, [r4, #0xa]
	ldr r3, [r0, #4]
	ldrh ip, [r4, #8]
	ldrh r1, [r3, #0x5e]
	cmp r1, r2
	bls _0223E130
	strh r2, [r3, #0x5e]
	sub r1, ip, #1
	mov r2, #1
	mov r1, r2, lsl r1
	ldr r0, [r0, #4]
	strh r1, [r0, #0x60]
	b _0223E148
_0223E130:
	bne _0223E148
	ldrh r2, [r3, #0x60]
	sub r0, ip, #1
	mov r1, #1
	orr r0, r2, r1, lsl r0
	strh r0, [r3, #0x60]
_0223E148:
	add r0, ip, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov13_0223E014
	cmp r0, #0x18
	bne _0223E16C
	mov r0, #7
	bl ov13_0223D6A8
	ldmia sp!, {r4, pc}
_0223E16C:
	cmp r0, #2
	ldmeqia sp!, {r4, pc}
	mov r0, #9
	bl ov13_0223D6A8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223E180: .word ov13_0224F5C0
_0223E184: .word ov13_0224730C
	arm_func_end ov13_0223E0B0

	arm_func_start ov13_0223E188
ov13_0223E188: ; 0x0223E188
	stmdb sp!, {r3, lr}
	mov r3, r1
	mov ip, #0x1e
	mov r1, #3
	mov r2, #0x11
	str ip, [sp]
	bl WM_MeasureChannel
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0223E188

	arm_func_start ov13_0223E1A8
ov13_0223E1A8: ; 0x0223E1A8
	stmdb sp!, {r3, lr}
	ldr r0, _0223E218 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #7
	beq _0223E1C4
	bl OS_Terminate
_0223E1C4:
	mov r0, #1
	bl ov13_0223D6A8
	ldr r0, _0223E218 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0x60]
	bl ov13_0223E220
	ldr r1, _0223E218 ; =ov13_0224F5C0
	ldr r2, [r1, #4]
	strh r0, [r2, #0x5c]
	ldr r3, [r1]
	cmp r3, #0
	beq _0223E208
	ldr r0, [r1, #4]
	ldr r1, _0223E21C ; =ov13_02247324
	ldrh r2, [r0, #0x5c]
	mov r0, #0x8000000
	blx r3
_0223E208:
	ldr r0, _0223E218 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0x5c]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223E218: .word ov13_0224F5C0
_0223E21C: .word ov13_02247324
	arm_func_end ov13_0223E1A8

	arm_func_start ov13_0223E220
ov13_0223E220: ; 0x0223E220
	stmdb sp!, {r4, lr}
	mov r3, #0
	mov r1, r3
	mov ip, r3
	mov r4, #1
_0223E234:
	tst r0, r4, lsl ip
	beq _0223E254
	add r3, ip, #1
	add r2, r1, #1
	mov r1, r3, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, asr #0x10
	mov r1, r2, lsr #0x10
_0223E254:
	add r2, ip, #1
	mov r2, r2, lsl #0x10
	mov ip, r2, asr #0x10
	cmp ip, #0x10
	blt _0223E234
	cmp r1, #1
	movls r0, r3
	ldmlsia sp!, {r4, pc}
	ldr ip, _0223E300 ; =ov13_0224F5C0
	ldr r3, _0223E304 ; =0x00010DCD
	ldr r4, [ip, #4]
	mov r2, #0
	ldr lr, [r4, #0x58]
	mul r3, lr, r3
	add r3, r3, #0x39
	add r3, r3, #0x3000
	str r3, [r4, #0x58]
	ldr r3, [ip, #4]
	ldr r3, [r3, #0x58]
	and r3, r3, #0xff
	mul r3, r1, r3
	mov r1, r3, lsl #8
	mov r3, r1, lsr #0x10
_0223E2B0:
	tst r0, #1
	beq _0223E2DC
	cmp r3, #0
	bne _0223E2D0
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_0223E2D0:
	sub r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, lsr #0x10
_0223E2DC:
	add r1, r2, #1
	mov r1, r1, lsl #0x10
	mov r0, r0, lsl #0xf
	mov r2, r1, asr #0x10
	cmp r2, #0x10
	mov r0, r0, lsr #0x10
	blt _0223E2B0
	mov r0, #0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223E300: .word ov13_0224F5C0
_0223E304: .word 0x00010DCD
	arm_func_end ov13_0223E220

	arm_func_start ov13_0223E308
ov13_0223E308: ; 0x0223E308
	stmdb sp!, {r3, lr}
	ldr r2, _0223E37C ; =ov13_0224F5C0
	mov r0, #0
	ldr r1, [r2, #4]
	mov r3, #1
	add r1, r1, #0x1000
	str r0, [r1, #0x2a4]
	ldr r1, [r2, #4]
	add r1, r1, #0x1000
	str r0, [r1, #0x2a0]
	ldr r1, [r2, #4]
	str r0, [r1, #0x48]
	ldr r1, [r2, #4]
	strh r0, [r1, #0x50]
	ldr r1, [r2, #4]
	strh r3, [r1, #0x52]
	ldr r1, [r2, #4]
	str r0, [r1, #0x54]
	ldr r1, [r2, #4]
	str r0, [r1]
	ldr r1, [r2, #4]
	strh r0, [r1, #4]
	ldr r1, [r2, #4]
	str r0, [r1, #0x4c]
	bl ov13_0223E3A0
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223E37C: .word ov13_0224F5C0
	arm_func_end ov13_0223E308

	arm_func_start ov13_0223E380
ov13_0223E380: ; 0x0223E380
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #8
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223D6A8
	bl OS_Terminate
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0223E380

	arm_func_start ov13_0223E3A0
ov13_0223E3A0: ; 0x0223E3A0
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223E3E4 ; =ov13_0224F5C0
	ldr r1, _0223E3E8 ; =ov13_0223E3EC
	ldr r0, [r0, #4]
	mov r2, #2
	add r0, r0, #0x80
	bl WM_Initialize
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov13_0223D724
	mov r0, #0xa
	bl ov13_0223D6A8
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223E3E4: .word ov13_0224F5C0
_0223E3E8: .word ov13_0223E3EC
	arm_func_end ov13_0223E3A0

	arm_func_start ov13_0223E3EC
ov13_0223E3EC: ; 0x0223E3EC
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223E40C
	bl ov13_0223D724
	mov r0, #0xa
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
_0223E40C:
	ldr r0, _0223E438 ; =ov13_0223E380
	bl WM_SetIndCallback
	cmp r0, #0
	beq _0223E42C
	bl ov13_0223D724
	mov r0, #0xa
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
_0223E42C:
	mov r0, #1
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223E438: .word ov13_0223E380
	arm_func_end ov13_0223E3EC

	arm_func_start ov13_0223E43C
ov13_0223E43C: ; 0x0223E43C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _0223E5A4 ; =ov13_0224F5C0
	mov r6, r0
	ldr r0, [r3, #4]
	mov r5, r1
	ldr r0, [r0, #0x40]
	mov r4, r2
	cmp r0, #1
	beq _0223E468
	bl OS_Terminate
	movs r0, #0
_0223E468:
	ldr r1, _0223E5A4 ; =ov13_0224F5C0
	mov r3, #0x180
	ldr r0, [r1, #4]
	mov r2, #0xe0
	add r0, r0, #0x1000
	str r3, [r0, #0x2a4]
	ldr r0, [r1, #4]
	add r0, r0, #0x1000
	str r2, [r0, #0x2a0]
	ldr r3, [r1]
	cmp r3, #0
	beq _0223E4B0
	ldr r0, [r1, #4]
	ldr r1, _0223E5A8 ; =ov13_022472DC
	add r0, r0, #0x1000
	ldr r2, [r0, #0x2a4]
	mov r0, #0x8000000
	blx r3
_0223E4B0:
	ldr r0, _0223E5A4 ; =ov13_0224F5C0
	ldr r3, [r0]
	cmp r3, #0
	beq _0223E4D8
	ldr r0, [r0, #4]
	ldr r1, _0223E5AC ; =ov13_022472F4
	add r0, r0, #0x1000
	ldr r2, [r0, #0x2a0]
	mov r0, #0x8000000
	blx r3
_0223E4D8:
	ldr r1, _0223E5A4 ; =ov13_0224F5C0
	mov r0, #3
	ldr r1, [r1, #4]
	str r6, [r1, #0x44]
	bl ov13_0223D6A8
	ldr r0, _0223E5A4 ; =ov13_0224F5C0
	ldr r1, [r0, #4]
	strh r5, [r1, #0xc]
	ldr r0, [r0, #4]
	strh r4, [r0, #0x32]
	bl WM_GetDispersionBeaconPeriod
	ldr r1, _0223E5A4 ; =ov13_0224F5C0
	mov r2, #0xd0
	ldr r3, [r1, #4]
	mov r4, #0x44
	strh r0, [r3, #0x18]
	ldr r0, [r1, #4]
	mov r3, #2
	strh r2, [r0, #0x34]
	ldr r0, [r1, #4]
	mov r2, #0
	strh r4, [r0, #0x36]
	ldr r0, [r1, #4]
	mov r4, #1
	strh r3, [r0, #0x10]
	ldr r0, [r1, #4]
	cmp r6, #2
	strh r2, [r0, #0x16]
	ldr r0, [r1, #4]
	strh r2, [r0, #0x12]
	ldr r0, [r1, #4]
	strh r4, [r0, #0xe]
	ldr r0, _0223E5A4 ; =ov13_0224F5C0
	movne r4, r2
	ldr r1, [r0, #4]
	cmp r6, #0
	cmpne r6, #2
	strh r4, [r1, #0x14]
	cmpne r6, #4
	bne _0223E580
	bl ov13_0223D744
	ldmia sp!, {r4, r5, r6, pc}
_0223E580:
	ldr r3, [r0]
	cmp r3, #0
	beq _0223E59C
	ldr r1, _0223E5B0 ; =ov13_0224733C
	mov r2, r6
	mov r0, #0x8000000
	blx r3
_0223E59C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0223E5A4: .word ov13_0224F5C0
_0223E5A8: .word ov13_022472DC
_0223E5AC: .word ov13_022472F4
_0223E5B0: .word ov13_0224733C
	arm_func_end ov13_0223E43C

	arm_func_start ov13_0223E5B4
ov13_0223E5B4: ; 0x0223E5B4
	ldr r1, _0223E5C4 ; =ov13_0224F5C0
	ldr r1, [r1, #4]
	str r0, [r1, #0x4c]
	bx lr
	.balign 4, 0
_0223E5C4: .word ov13_0224F5C0
	arm_func_end ov13_0223E5B4

	arm_func_start ov13_0223E5C8
ov13_0223E5C8: ; 0x0223E5C8
	ldr r1, _0223E5E8 ; =ov13_0224F5C0
	ldr ip, _0223E5EC ; =WM_GetSharedDataAddress
	ldr r1, [r1, #4]
	mov r2, r0
	add r0, r1, #0x3e0
	add r0, r0, #0x1000
	add r1, r1, #0x1c00
	bx ip
	.balign 4, 0
_0223E5E8: .word ov13_0224F5C0
_0223E5EC: .word WM_GetSharedDataAddress
	arm_func_end ov13_0223E5C8

	arm_func_start ov13_0223E5F0
ov13_0223E5F0: ; 0x0223E5F0
	stmdb sp!, {r4, lr}
	ldr r2, _0223E68C ; =ov13_0224F5C0
	mov r1, r0
	ldr r2, [r2, #4]
	add r0, r2, #0x3e0
	add r0, r0, #0x1000
	add r2, r2, #0x1c00
	bl WM_StepDataSharing
	mov r4, r0
	cmp r4, #7
	bne _0223E640
	ldr r0, _0223E68C ; =ov13_0224F5C0
	ldr r2, [r0]
	cmp r2, #0
	beq _0223E638
	ldr r1, _0223E690 ; =ov13_02247358
	mov r0, #0x8000000
	blx r2
_0223E638:
	mov r0, #0
	ldmia sp!, {r4, pc}
_0223E640:
	cmp r4, #5
	bne _0223E674
	ldr r0, _0223E68C ; =ov13_0224F5C0
	ldr r2, [r0]
	cmp r2, #0
	beq _0223E664
	ldr r1, _0223E694 ; =ov13_02247388
	mov r0, #0x8000000
	blx r2
_0223E664:
	mov r0, r4
	bl ov13_0223D724
	mov r0, #0
	ldmia sp!, {r4, pc}
_0223E674:
	cmp r4, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	bl ov13_0223D724
	mov r0, #0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223E68C: .word ov13_0224F5C0
_0223E690: .word ov13_02247358
_0223E694: .word ov13_02247388
	arm_func_end ov13_0223E5F0

	arm_func_start ov13_0223E698
ov13_0223E698: ; 0x0223E698
	stmdb sp!, {r3, lr}
	bl ov13_0223DE74
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0xa
	bl ov13_0223D6A8
	ldmia sp!, {r3, pc}
	arm_func_end ov13_0223E698

	arm_func_start ov13_0223E6B4
ov13_0223E6B4: ; 0x0223E6B4
	stmdb sp!, {r3, lr}
	ldr r0, _0223E7B0 ; =ov13_0224F5C0
	ldr r1, [r0, #4]
	ldr r2, [r1, #0x40]
	cmp r2, #1
	bne _0223E6E8
	ldr r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _0223E7B4 ; =ov13_022473BC
	mov r0, #0x8000000
	blx r2
	ldmia sp!, {r3, pc}
_0223E6E8:
	ldr r3, [r0]
	cmp r3, #0
	beq _0223E700
	ldr r1, _0223E7B8 ; =ov13_022473E0
	mov r0, #0x8000000
	blx r3
_0223E700:
	ldr r0, _0223E7B0 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #6
	cmpne r0, #5
	cmpne r0, #4
	mov r0, #3
	beq _0223E72C
	bl ov13_0223D6A8
	bl ov13_0223E698
	ldmia sp!, {r3, pc}
_0223E72C:
	bl ov13_0223D6A8
	ldr r0, _0223E7B0 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x44]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_0223E748: ; jump table
	b _0223E79C ; case 0
	b _0223E774 ; case 1
	b _0223E788 ; case 2
	b _0223E760 ; case 3
	b _0223E79C ; case 4
	b _0223E774 ; case 5
_0223E760:
	bl ov13_0223DD64
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0223E698
	ldmia sp!, {r3, pc}
_0223E774:
	bl ov13_0223DDB4
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0223E698
	ldmia sp!, {r3, pc}
_0223E788:
	bl ov13_0223DC64
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0223E698
	ldmia sp!, {r3, pc}
_0223E79C:
	bl ov13_0223DC94
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0223E698
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223E7B0: .word ov13_0224F5C0
_0223E7B4: .word ov13_022473BC
_0223E7B8: .word ov13_022473E0
	arm_func_end ov13_0223E6B4

	arm_func_start ov13_0223E7BC
ov13_0223E7BC: ; 0x0223E7BC
	stmdb sp!, {r3, lr}
	ldr r0, _0223E804 ; =ov13_0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #1
	beq _0223E7D8
	bl OS_Terminate
_0223E7D8:
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223E808 ; =ov13_0223DED8
	bl WM_End
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	mov r0, #9
	bl ov13_0223D6A8
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223E804: .word ov13_0224F5C0
_0223E808: .word ov13_0223DED8
	arm_func_end ov13_0223E7BC

	arm_func_start ov13_0223E80C
ov13_0223E80C: ; 0x0223E80C
	stmdb sp!, {r4, lr}
	ldr r2, _0223E8F8 ; =ov13_0224F5C8
	mov r4, r1
	str r0, [r2]
	add r0, r0, #0xb00
	bl ov13_0223C9D4
	ldr r1, _0223E8F8 ; =ov13_0224F5C8
	mov r3, #0
	ldr r0, [r1]
	mov r2, #1
	add r0, r0, #0x600
	strh r3, [r0, #0x48]
	ldr r0, [r1]
	add r0, r0, #0x600
	strh r3, [r0, #0x4a]
	ldr r0, [r1]
	strb r2, [r0, #0xa90]
	ldr r0, [r1]
	strb r2, [r0, #0xa91]
	ldr r0, [r1]
	str r3, [r0, #0xa9c]
	bl ov13_0223F3BC
	ldr r0, _0223E8F8 ; =ov13_0224F5C8
	ldr r3, [r4]
	ldr r2, [r0]
	mov r1, #2
	str r3, [r2, #0xab4]
	ldr r3, [r4, #4]
	ldr r2, [r0]
	str r3, [r2, #0xab8]
	ldr r3, [r4, #8]
	ldr r2, [r0]
	str r3, [r2, #0xabc]
	ldr r3, [r4, #0xc]
	ldr r2, [r0]
	str r3, [r2, #0xac0]
	ldr r3, [r4, #0x10]
	ldr r2, [r0]
	str r3, [r2, #0xac4]
	ldr r3, [r4, #0x14]
	ldr r2, [r0]
	str r3, [r2, #0xac8]
	ldrb r3, [r4, #0x18]
	ldr r2, [r0]
	strb r3, [r2, #0xa92]
	ldr r0, [r0]
	strb r1, [r0, #0xacc]
	bl OS_GetTick
	ldr r0, _0223E8F8 ; =ov13_0224F5C8
	ldr r0, [r0]
	add r0, r0, #0x24c
	add r0, r0, #0x400
	bl DWCi_BACKUPlRead
	bl OS_GetTick
	bl ov13_0223A7F4
	ldr r1, _0223E8F8 ; =ov13_0224F5C8
	ldr r1, [r1]
	str r0, [r1, #0xaa4]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223E8F8: .word ov13_0224F5C8
	arm_func_end ov13_0223E80C

	arm_func_start ov13_0223E8FC
ov13_0223E8FC: ; 0x0223E8FC
	stmdb sp!, {r3, lr}
	ldr r0, _0223E9D4 ; =ov13_0224F5C8
	ldr r2, [r0]
	ldrb r1, [r2, #0xa90]
	cmp r1, #1
	cmpne r1, #0x14
	cmpne r1, #0x17
	cmpne r1, #0x1a
	cmpne r1, #0x1d
	bne _0223E944
	mov r1, #0x22
	strb r1, [r2, #0xa90]
	ldr r0, _0223E9D4 ; =ov13_0224F5C8
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xaac]
	mov r0, #1
	ldmia sp!, {r3, pc}
_0223E944:
	cmp r1, #4
	cmpne r1, #5
	cmpne r1, #6
	cmpne r1, #0xd
	bne _0223E998
	cmp r1, #4
	bne _0223E970
	ldr r0, [r2, #0xa98]
	cmp r0, #6
	movlo r0, #0
	ldmloia sp!, {r3, pc}
_0223E970:
	bl MB_End
	ldr r0, _0223E9D4 ; =ov13_0224F5C8
	mov r3, #0x10
	ldr r1, [r0]
	mov r2, #2
	strb r3, [r1, #0xa90]
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #0xaac]
	ldmia sp!, {r3, pc}
_0223E998:
	add r0, r1, #0xf7
	and r0, r0, #0xff
	cmp r0, #1
	bhi _0223E9B8
	mov r0, #0x20
	strb r0, [r2, #0xa90]
	mov r0, #1
	ldmia sp!, {r3, pc}
_0223E9B8:
	cmp r1, #0xc
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0x22
	strb r0, [r2, #0xa90]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223E9D4: .word ov13_0224F5C8
	arm_func_end ov13_0223E8FC

	arm_func_start ov13_0223E9D8
ov13_0223E9D8: ; 0x0223E9D8
	stmdb sp!, {r3, lr}
	ldr r0, _0223EA54 ; =ov13_0224F5C8
	ldr r0, [r0]
	ldr r0, [r0, #0xac8]
	bl ov13_0223DF00
	ldr r0, _0223EA54 ; =ov13_0224F5C8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	bl WM_GetNextTgid
	ldr r3, _0223EA54 ; =ov13_0224F5C8
	mov r2, #0x40
	ldr r1, [r3]
	add r1, r1, #0x600
	strh r0, [r1, #0x48]
	ldr r1, [r3]
	ldr r0, [r1, #0xaa4]
	add r1, r1, #0xa50
	bl MI_CpuCopy8
	ldr r0, _0223EA54 ; =ov13_0224F5C8
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0xa93]
	ldr r1, [r0]
	str r2, [r1, #0x204]
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r1, [r0, #0x48]
	add r1, r1, #1
	strh r1, [r0, #0x48]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223EA54: .word ov13_0224F5C8
	arm_func_end ov13_0223E9D8

	arm_func_start ov13_0223EA58
ov13_0223EA58: ; 0x0223EA58
	stmdb sp!, {r3, lr}
	ldr r0, _0223EA9C ; =ov13_0224F5C8
	ldr r0, [r0]
	ldrb r0, [r0, #0xa90]
	cmp r0, #1
	cmpne r0, #0x1a
	cmpne r0, #0x1d
	movne r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0223E9D8
	bl ov13_0223E308
	ldr r0, _0223EA9C ; =ov13_0224F5C8
	mov r2, #2
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #0xa90]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223EA9C: .word ov13_0224F5C8
	arm_func_end ov13_0223EA58

	arm_func_start ov13_0223EAA0
ov13_0223EAA0: ; 0x0223EAA0
	stmdb sp!, {r3, lr}
	ldr r0, _0223EAD0 ; =ov13_0224F5C8
	ldr r1, [r0]
	ldrb r0, [r1, #0xa90]
	cmp r0, #5
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #6
	strb r0, [r1, #0xa90]
	bl ov13_0223CEA0
	mov r0, #1
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223EAD0: .word ov13_0224F5C8
	arm_func_end ov13_0223EAA0

	arm_func_start ov13_0223EAD4
ov13_0223EAD4: ; 0x0223EAD4
	stmdb sp!, {r3, lr}
	ldr r1, _0223EE50 ; =ov13_0224F5C8
	ldr r0, [r1]
	ldrb r2, [r0, #0xa90]
	cmp r2, #0x22
	addls pc, pc, r2, lsl #2
	ldmia sp!, {r3, pc}
_0223EAF0: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _0223EB7C ; case 1
	b _0223EBB8 ; case 2
	b _0223EBC0 ; case 3
	b _0223EBD8 ; case 4
	b _0223EBEC ; case 5
	b _0223EBEC ; case 6
	b _0223EBF4 ; case 7
	b _0223EBFC ; case 8
	b _0223EBFC ; case 9
	b _0223EBFC ; case 10
	b _0223EC04 ; case 11
	ldmia sp!, {r3, pc} ; case 12
	ldmia sp!, {r3, pc} ; case 13
	ldmia sp!, {r3, pc} ; case 14
	ldmia sp!, {r3, pc} ; case 15
	b _0223EC0C ; case 16
	b _0223EC24 ; case 17
	b _0223EC40 ; case 18
	b _0223EC64 ; case 19
	ldmia sp!, {r3, pc} ; case 20
	b _0223EC9C ; case 21
	b _0223ECC0 ; case 22
	ldmia sp!, {r3, pc} ; case 23
	b _0223ECF8 ; case 24
	b _0223ED1C ; case 25
	ldmia sp!, {r3, pc} ; case 26
	b _0223ED54 ; case 27
	b _0223ED78 ; case 28
	ldmia sp!, {r3, pc} ; case 29
	b _0223EE48 ; case 30
	ldmia sp!, {r3, pc} ; case 31
	b _0223EDEC ; case 32
	b _0223EE10 ; case 33
	ldmia sp!, {r3, pc} ; case 34
_0223EB7C:
	ldrb r2, [r0, #0xaac]
	cmp r2, #1
	bne _0223EB98
	mov r1, #0
	strb r1, [r0, #0xaac]
	bl ov13_0223EA58
	ldmia sp!, {r3, pc}
_0223EB98:
	cmp r2, #2
	ldmneia sp!, {r3, pc}
	mov r2, #0
	strb r2, [r0, #0xaac]
	ldr r0, [r1]
	mov r1, #0x22
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223EBB8:
	bl ov13_0223EEAC
	ldmia sp!, {r3, pc}
_0223EBC0:
	bl ov13_0223EF54
	ldr r0, _0223EE50 ; =ov13_0224F5C8
	mov r1, #4
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223EBD8:
	ldr r1, [r0, #0xa98]
	add r1, r1, #1
	str r1, [r0, #0xa98]
	bl ov13_0223EF78
	ldmia sp!, {r3, pc}
_0223EBEC:
	bl ov13_0223EF78
	ldmia sp!, {r3, pc}
_0223EBF4:
	bl ov13_0223F130
	ldmia sp!, {r3, pc}
_0223EBFC:
	bl ov13_0223F15C
	ldmia sp!, {r3, pc}
_0223EC04:
	bl ov13_0223F338
	ldmia sp!, {r3, pc}
_0223EC0C:
	mov r2, #0
	str r2, [r0, #0xa9c]
	ldr r0, [r1]
	mov r1, #0x11
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223EC24:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	ldmlsia sp!, {r3, pc}
	bl ov13_0223F350
	ldmia sp!, {r3, pc}
_0223EC40:
	bl MB_End
	ldr r0, _0223EE50 ; =ov13_0224F5C8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x16
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223EC64:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	ldmlsia sp!, {r3, pc}
	bl ov13_0223DF28
	cmp r0, #1
	ldmneia sp!, {r3, pc}
	bl ov13_0223E7BC
	ldr r0, _0223EE50 ; =ov13_0224F5C8
	mov r1, #0x14
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223EC9C:
	bl ov13_0223E6B4
	ldr r0, _0223EE50 ; =ov13_0224F5C8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x16
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223ECC0:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	ldmlsia sp!, {r3, pc}
	bl ov13_0223DF28
	cmp r0, #1
	ldmneia sp!, {r3, pc}
	bl ov13_0223E7BC
	ldr r0, _0223EE50 ; =ov13_0224F5C8
	mov r1, #0x17
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223ECF8:
	bl ov13_0223E6B4
	ldr r0, _0223EE50 ; =ov13_0224F5C8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x19
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223ED1C:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	ldmlsia sp!, {r3, pc}
	bl ov13_0223DF28
	cmp r0, #1
	ldmneia sp!, {r3, pc}
	bl ov13_0223E7BC
	ldr r0, _0223EE50 ; =ov13_0224F5C8
	mov r1, #0x1a
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223ED54:
	bl ov13_0223E6B4
	ldr r0, _0223EE50 ; =ov13_0224F5C8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x1c
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223ED78:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	ldmlsia sp!, {r3, pc}
	bl ov13_0223DF28
	cmp r0, #1
	bne _0223EDB0
	bl ov13_0223E7BC
	ldr r0, _0223EE50 ; =ov13_0224F5C8
	mov r1, #0x1d
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223EDB0:
	ldr r1, _0223EE50 ; =ov13_0224F5C8
	ldr r0, _0223EE54 ; =0x88888889
	ldr r1, [r1]
	mov r2, #0x1e
	ldr r3, [r1, #0xa9c]
	umull r0, r1, r3, r0
	mov r1, r1, lsr #4
	umull r0, r1, r2, r1
	sub r1, r3, r0
	cmp r1, #1
	ldmneia sp!, {r3, pc}
	cmp r3, #0x37
	ldmlsia sp!, {r3, pc}
	bl ov13_0223E6B4
	ldmia sp!, {r3, pc}
_0223EDEC:
	bl ov13_0223E6B4
	ldr r0, _0223EE50 ; =ov13_0224F5C8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x21
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223EE10:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	ldmlsia sp!, {r3, pc}
	bl ov13_0223DF28
	cmp r0, #1
	ldmneia sp!, {r3, pc}
	bl ov13_0223E7BC
	ldr r0, _0223EE50 ; =ov13_0224F5C8
	mov r1, #0x22
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223EE48:
	bl ov13_0223E6B4
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223EE50: .word ov13_0224F5C8
_0223EE54: .word 0x88888889
	arm_func_end ov13_0223EAD4

	arm_func_start ov13_0223EE58
ov13_0223EE58: ; 0x0223EE58
	ldr r2, _0223EE98 ; =ov13_0224F5C8
	ldr r3, [r2]
	ldrb r3, [r3, #0xa90]
	strb r3, [r0]
	ldr r0, [r2]
	ldrb r2, [r0, #0xa90]
	ldrb r0, [r0, #0xa91]
	cmp r2, r0
	movne r0, #1
	moveq r0, #0
	strb r0, [r1]
	ldr r0, _0223EE98 ; =ov13_0224F5C8
	ldr r1, [r0]
	ldrb r0, [r1, #0xa90]
	strb r0, [r1, #0xa91]
	bx lr
	.balign 4, 0
_0223EE98: .word ov13_0224F5C8
	arm_func_end ov13_0223EE58

	arm_func_start ov13_0223EE9C
ov13_0223EE9C: ; 0x0223EE9C
	ldr ip, _0223EEA8 ; =MB_CommGetChildUser
	mov r0, #1
	bx ip
	.balign 4, 0
_0223EEA8: .word MB_CommGetChildUser
	arm_func_end ov13_0223EE9C

	arm_func_start ov13_0223EEAC
ov13_0223EEAC: ; 0x0223EEAC
	stmdb sp!, {r3, lr}
	bl ov13_0223DF28
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0223EF48
_0223EEC0: ; jump table
	b _0223EF20 ; case 0
	b _0223EEE8 ; case 1
	b _0223EF48 ; case 2
	ldmia sp!, {r3, pc} ; case 3
	b _0223EF48 ; case 4
	b _0223EF48 ; case 5
	b _0223EF48 ; case 6
	b _0223EEF0 ; case 7
	b _0223EF48 ; case 8
	b _0223EF40 ; case 9
_0223EEE8:
	bl ov13_0223DF3C
	ldmia sp!, {r3, pc}
_0223EEF0:
	bl ov13_0223E1A8
	ldr r2, _0223EF50 ; =ov13_0224F5C8
	mov ip, #0
	ldr r1, [r2]
	mov r3, #3
	add r1, r1, #0x600
	strh r0, [r1, #0x4a]
	ldr r0, [r2]
	str ip, [r0, #0xa98]
	ldr r0, [r2]
	strb r3, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223EF20:
	ldr r0, _0223EF50 ; =ov13_0224F5C8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #3
	str r3, [r2, #0xa98]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223EF40:
	bl ov13_0223E698
	ldmia sp!, {r3, pc}
_0223EF48:
	bl OS_Terminate
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223EF50: .word ov13_0224F5C8
	arm_func_end ov13_0223EEAC

	arm_func_start ov13_0223EF54
ov13_0223EF54: ; 0x0223EF54
	ldr r0, _0223EF70 ; =ov13_0224F5C8
	ldr ip, _0223EF74 ; =ov13_0223CA14
	ldr r2, [r0]
	add r0, r2, #0x600
	ldrh r1, [r0, #0x48]
	ldr r0, [r2, #0xac8]
	bx ip
	.balign 4, 0
_0223EF70: .word ov13_0224F5C8
_0223EF74: .word ov13_0223CA14
	arm_func_end ov13_0223EF54

	arm_func_start ov13_0223EF78
ov13_0223EF78: ; 0x0223EF78
	stmdb sp!, {r3, lr}
	bl ov13_0223D45C
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_0223EF8C: ; jump table
	b _0223F0DC ; case 0
	b _0223EFAC ; case 1
	b _0223EFCC ; case 2
	b _0223F05C ; case 3
	ldmia sp!, {r3, pc} ; case 4
	b _0223F0B0 ; case 5
	ldmia sp!, {r3, pc} ; case 6
	b _0223F0C4 ; case 7
_0223EFAC:
	ldr r0, _0223F12C ; =ov13_0224F5C8
	ldr r2, [r0]
	add r0, r2, #0x600
	ldrh r1, [r0, #0x4a]
	add r0, r2, #0x2b4
	add r0, r0, #0x800
	bl ov13_0223CB34
	ldmia sp!, {r3, pc}
_0223EFCC:
	mov r0, #2
	bl ov13_0223D470
	cmp r0, #0
	beq _0223EFF0
	ldr r0, _0223F12C ; =ov13_0224F5C8
	mov r1, #5
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223EFF0:
	mov r0, #3
	bl ov13_0223D470
	cmp r0, #0
	bne _0223F010
	mov r0, #4
	bl ov13_0223D470
	cmp r0, #0
	beq _0223F024
_0223F010:
	ldr r0, _0223F12C ; =ov13_0224F5C8
	mov r1, #6
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F024:
	ldr r0, _0223F12C ; =ov13_0224F5C8
	ldr r0, [r0]
	ldrb r0, [r0, #0xa90]
	cmp r0, #5
	ldmneia sp!, {r3, pc}
	mov r0, #2
	bl ov13_0223D470
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0223F12C ; =ov13_0224F5C8
	mov r1, #0xd
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F05C:
	bl ov13_0223CF80
	cmp r0, #0
	beq _0223F070
	bl ov13_0223CFE8
	ldmia sp!, {r3, pc}
_0223F070:
	ldr r0, _0223F12C ; =ov13_0224F5C8
	ldr r0, [r0]
	ldrb r0, [r0, #0xa90]
	add r0, r0, #0xfa
	and r0, r0, #0xff
	cmp r0, #1
	ldmhiia sp!, {r3, pc}
	mov r0, #3
	bl ov13_0223D470
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0223F12C ; =ov13_0224F5C8
	mov r1, #0x12
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F0B0:
	ldr r0, _0223F12C ; =ov13_0224F5C8
	mov r1, #7
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F0C4:
	bl ov13_0223D0E0
	ldr r0, _0223F12C ; =ov13_0224F5C8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F0DC:
	bl ov13_0223DF28
	cmp r0, #0
	beq _0223F104
	cmp r0, #1
	beq _0223F0FC
	cmp r0, #3
	ldmeqia sp!, {r3, pc}
	b _0223F118
_0223F0FC:
	bl ov13_0223E7BC
	ldmia sp!, {r3, pc}
_0223F104:
	ldr r0, _0223F12C ; =ov13_0224F5C8
	mov r1, #0x1f
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F118:
	ldr r0, _0223F12C ; =ov13_0224F5C8
	mov r1, #0x1f
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223F12C: .word ov13_0224F5C8
	arm_func_end ov13_0223EF78

	arm_func_start ov13_0223F130
ov13_0223F130: ; 0x0223F130
	stmdb sp!, {r3, lr}
	bl ov13_0223F3BC
	ldr r0, _0223F154 ; =ov13_0223F380
	bl ov13_0223E5B4
	ldr r0, _0223F158 ; =ov13_0224F5C8
	mov r1, #8
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223F154: .word ov13_0223F380
_0223F158: .word ov13_0224F5C8
	arm_func_end ov13_0223F130

	arm_func_start ov13_0223F15C
ov13_0223F15C: ; 0x0223F15C
	stmdb sp!, {r3, lr}
	bl ov13_0223DF28
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_0223F170: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _0223F18C ; case 1
	ldmia sp!, {r3, pc} ; case 2
	ldmia sp!, {r3, pc} ; case 3
	b _0223F1B8 ; case 4
	b _0223F1B8 ; case 5
	b _0223F1B8 ; case 6
_0223F18C:
	ldr r1, _0223F334 ; =ov13_0224F5C8
	mov r0, #4
	ldr r1, [r1]
	add r1, r1, #0x600
	ldrh r3, [r1, #0x48]
	ldrh r2, [r1, #0x4a]
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl ov13_0223E43C
	ldmia sp!, {r3, pc}
_0223F1B8:
	ldr r1, _0223F334 ; =ov13_0224F5C8
	mov r0, #0
	ldr r2, [r1]
	add r1, r2, #0x200
	ldrh r1, [r1]
	ldr ip, [r2, #0xaa4]
	mov r3, r1, lsr #0x1f
	rsb r2, r3, r1, lsl #28
	add r2, r3, r2, ror #28
	add r2, ip, r2, lsl #6
	bl ov13_0223F400
	bl ov13_0223F568
	ldr r0, _0223F334 ; =ov13_0224F5C8
	ldr r1, [r0]
	ldrb r0, [r1, #0xa90]
	cmp r0, #0x1b
	ldmeqia sp!, {r3, pc}
	ldr r0, [r1, #0x204]
	cmp r0, #0x1e0
	movhi r0, #0x1b
	strhib r0, [r1, #0xa90]
	ldmhiia sp!, {r3, pc}
	bl ov13_0223F64C
	cmp r0, #0x10
	beq _0223F228
	bl ov13_0223F64C
	cmp r0, #0x20
	bne _0223F240
_0223F228:
	bl ov13_0223F64C
	ldr r0, _0223F334 ; =ov13_0224F5C8
	mov r1, #0xa
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F240:
	bl ov13_0223F64C
	cmp r0, #0x40
	bne _0223F260
	ldr r0, _0223F334 ; =ov13_0224F5C8
	mov r1, #0xb
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F260:
	bl ov13_0223F64C
	cmp r0, #0xff
	bne _0223F280
	ldr r0, _0223F334 ; =ov13_0224F5C8
	mov r1, #0x1b
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F280:
	bl ov13_0223F64C
	cmp r0, #0x50
	bne _0223F2A0
	ldr r0, _0223F334 ; =ov13_0224F5C8
	mov r1, #0x15
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F2A0:
	bl ov13_0223F64C
	cmp r0, #0x60
	bne _0223F2C0
	ldr r0, _0223F334 ; =ov13_0224F5C8
	mov r1, #0x18
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F2C0:
	bl ov13_0223F64C
	cmp r0, #0x70
	bne _0223F2E0
	ldr r0, _0223F334 ; =ov13_0224F5C8
	mov r1, #0x1b
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F2E0:
	bl ov13_0223F64C
	cmp r0, #0
	bne _0223F300
	ldr r0, _0223F334 ; =ov13_0224F5C8
	mov r1, #8
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F300:
	bl ov13_0223F64C
	cmp r0, #0xbd
	bne _0223F320
	ldr r0, _0223F334 ; =ov13_0224F5C8
	mov r1, #9
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
_0223F320:
	ldr r0, _0223F334 ; =ov13_0224F5C8
	mov r1, #0x1f
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223F334: .word ov13_0224F5C8
	arm_func_end ov13_0223F15C

	arm_func_start ov13_0223F338
ov13_0223F338: ; 0x0223F338
	ldr r0, _0223F34C ; =ov13_0224F5C8
	mov r1, #0xc
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	bx lr
	.balign 4, 0
_0223F34C: .word ov13_0224F5C8
	arm_func_end ov13_0223F338

	arm_func_start ov13_0223F350
ov13_0223F350: ; 0x0223F350
	stmdb sp!, {r3, lr}
	bl ov13_0223DF28
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r3, pc}
	bl ov13_0223E7BC
	ldr r1, _0223F37C ; =ov13_0224F5C8
	mov r0, #1
	ldr r1, [r1]
	strb r0, [r1, #0xa90]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223F37C: .word ov13_0224F5C8
	arm_func_end ov13_0223F350

	arm_func_start ov13_0223F380
ov13_0223F380: ; 0x0223F380
	stmdb sp!, {r4, lr}
	add r0, r0, #0xa
	bl ov13_0223D5C4
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl ov13_0223D590
	ldr r1, _0223F3B8 ; =ov13_0224F5C8
	sub r2, r4, #1
	ldr r1, [r1]
	add r1, r1, r2, lsl #2
	str r0, [r1, #0xaa0]
	mov r0, #1
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223F3B8: .word ov13_0224F5C8
	arm_func_end ov13_0223F380

	arm_func_start ov13_0223F3BC
ov13_0223F3BC: ; 0x0223F3BC
	stmdb sp!, {r3, lr}
	ldr r0, _0223F3FC ; =ov13_0224F5C8
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x100
	add r0, r0, #0x100
	bl MI_CpuFill8
	ldr r0, _0223F3FC ; =ov13_0224F5C8
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x100
	bl MI_CpuFill8
	ldr r0, _0223F3FC ; =ov13_0224F5C8
	ldr r0, [r0]
	str r0, [r0, #0xab0]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223F3FC: .word ov13_0224F5C8
	arm_func_end ov13_0223F3BC

	arm_func_start ov13_0223F400
ov13_0223F400: ; 0x0223F400
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r3, _0223F564 ; =ov13_0224F5C8
	ldr r5, [r3]
	ldrb r4, [r5, #0xa93]
	cmp r4, #1
	bne _0223F448
	ldr r4, [r5, #0xab0]
	strh r0, [r4]
	ldr r4, [r3]
	mov r0, r2
	ldr r4, [r4, #0xab0]
	mov r2, #0x40
	strh r1, [r4, #2]
	ldr r1, [r3]
	ldr r1, [r1, #0xab0]
	add r1, r1, #4
	bl MI_CpuCopy8
	b _0223F474
_0223F448:
	ldr r0, [r5, #0x204]
	mov r1, #0xbc
	add r0, r0, #1
	str r0, [r5, #0x204]
	ldr r0, [r3]
	ldr r0, [r0, #0xab0]
	strh r1, [r0]
	ldr r0, [r3]
	ldrb r1, [r0, #0xa92]
	ldr r0, [r0, #0xab0]
	strb r1, [r0, #4]
_0223F474:
	bl ov13_0223DF28
	cmp r0, #5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _0223F564 ; =ov13_0224F5C8
	ldr r0, [r0]
	bl ov13_0223E5F0
	cmp r0, #0
	bne _0223F4AC
	ldr r0, _0223F564 ; =ov13_0224F5C8
	ldr r1, [r0]
	ldr r0, [r1, #0x204]
	add r0, r0, #4
	str r0, [r1, #0x204]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0223F4AC:
	ldr r0, _0223F564 ; =ov13_0224F5C8
	ldr r1, [r0]
	ldrb r0, [r1, #0xa93]
	cmp r0, #0
	bne _0223F4D0
	ldr r0, [r1, #0x204]
	add r0, r0, #1
	str r0, [r1, #0x204]
	b _0223F4F8
_0223F4D0:
	mov r0, #0
	str r0, [r1, #0x204]
	bl ov13_0223DF14
	cmp r0, #3
	beq _0223F4F8
	ldr r0, _0223F564 ; =ov13_0224F5C8
	mov r1, #0x1b
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0223F4F8:
	mov r7, #0
	mov r6, #0x44
	ldr sb, _0223F564 ; =ov13_0224F5C8
	mov r4, r7
	mov r5, #1
	mov r8, r6
_0223F510:
	mov r0, r7
	bl ov13_0223E5C8
	cmp r0, #0
	ldreq r0, [sb]
	addeq r0, r0, r7, lsl #2
	streq r4, [r0, #0x208]
	beq _0223F54C
	ldr r1, [sb]
	mov r2, r6
	add r1, r1, #0x100
	mla r1, r7, r8, r1
	bl MI_CpuCopy8
	ldr r0, [sb]
	add r0, r0, r7, lsl #2
	str r5, [r0, #0x208]
_0223F54C:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	cmp r7, #2
	blo _0223F510
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0223F564: .word ov13_0224F5C8
	arm_func_end ov13_0223F400

	arm_func_start ov13_0223F568
ov13_0223F568: ; 0x0223F568
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov ip, #0
	ldr r4, _0223F648 ; =ov13_0224F5C8
	mov r0, #1
	mov r5, ip
	mov r1, #0xbc
	mov r2, ip
	mov lr, #0x44
_0223F588:
	ldr r3, [r4]
	add r6, r3, ip, lsl #2
	ldr r6, [r6, #0x208]
	cmp r6, #0
	beq _0223F638
	mul r7, ip, lr
	cmp ip, #1
	add r8, r3, #0x100
	bne _0223F638
	ldrb r6, [r3, #0xa93]
	cmp r6, #1
	bne _0223F608
	ldrh r6, [r8, r7]
	cmp r6, #0x10
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r6, [r3, #0xa94]
	add r6, r6, #1
	str r6, [r3, #0xa94]
	ldr r6, [r4]
	ldr r3, [r6, #0xa94]
	tst r3, #1
	bne _0223F638
	add r3, r6, #0x200
	ldrh r6, [r3]
	add r6, r6, #1
	strh r6, [r3]
	ldr r3, [r4]
	add r3, r3, #0x200
	ldrh r6, [r3]
	cmp r6, #0x24
	strhsh r2, [r3]
	b _0223F638
_0223F608:
	add r3, r3, #0x200
	strh r1, [r3, #2]
	ldrh r3, [r8, r7]
	cmp r3, #0xbd
	bne _0223F638
	ldr r3, [r4]
	strb r0, [r3, #0xa93]
	ldr r3, [r4]
	add r3, r3, #0x200
	strh r5, [r3]
	ldr r3, [r4]
	str r5, [r3, #0xa94]
_0223F638:
	add ip, ip, #1
	cmp ip, #0x10
	blt _0223F588
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223F648: .word ov13_0224F5C8
	arm_func_end ov13_0223F568

	arm_func_start ov13_0223F64C
ov13_0223F64C: ; 0x0223F64C
	ldr r0, _0223F660 ; =ov13_0224F5C8
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrh r0, [r0, #0x44]
	bx lr
	.balign 4, 0
_0223F660: .word ov13_0224F5C8
	arm_func_end ov13_0223F64C

	arm_func_start ov13_0223F664
ov13_0223F664: ; 0x0223F664
	stmdb sp!, {r4, lr}
	sub sp, sp, #0xe8
	mov r0, #0xe8
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _0223F7F4 ; =ov13_0224F5CC
	str r0, [r1]
	add r0, sp, #0xa0
	bl FS_InitFile
	ldr r1, _0223F7F8 ; =ov13_02247404
	add r0, sp, #0xa0
	bl FS_OpenFile
	cmp r0, #0
	bne _0223F6A0
	bl OS_Terminate
_0223F6A0:
	bl OS_GetLockID
	ldr r2, _0223F7F4 ; =ov13_0224F5CC
	add r1, sp, #0x18
	ldr r3, [r2]
	mov r2, #8
	strh r0, [r3, #0xe4]
	add r0, sp, #0xa0
	ldr r4, [sp, #0xc4]
	bl FS_ReadFile
	add r0, sp, #0xa0
	add r1, sp, #0x10
	mov r2, #8
	bl FS_ReadFile
	add r0, sp, #0xa0
	bl FS_CloseFile
	ldr r0, _0223F7F4 ; =ov13_0224F5CC
	ldr r0, [r0]
	add r0, r0, #0x88
	bl FS_InitArchive
	ldr r0, _0223F7F4 ; =ov13_0224F5CC
	ldr r1, _0223F7FC ; =ov13_0224593C
	ldr r0, [r0]
	mov r2, #3
	add r0, r0, #0x88
	bl FS_RegisterArchiveName
	cmp r0, #0
	bne _0223F710
	bl OS_Terminate
_0223F710:
	ldr r0, _0223F7F4 ; =ov13_0224F5CC
	ldr r1, _0223F800 ; =ov13_0223F8A0
	ldr r0, [r0]
	ldr r2, _0223F804 ; =0x00000602
	add r0, r0, #0x88
	bl FS_SetArchiveProc
	ldr r0, [sp, #0x18]
	ldr r1, _0223F808 ; =ov13_0223F904
	str r0, [sp]
	ldr r2, [sp, #0x1c]
	ldr r0, _0223F80C ; =ov13_0223F954
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _0223F7F4 ; =ov13_0224F5CC
	ldr r2, [sp, #0x10]
	ldr r0, [r0]
	ldr r3, [sp, #0x14]
	mov r1, r4
	add r0, r0, #0x88
	bl FS_LoadArchive
	cmp r0, #0
	bne _0223F770
	bl OS_Terminate
_0223F770:
	ldr r0, _0223F7F4 ; =ov13_0224F5CC
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	add r0, r0, #0x88
	bl FS_LoadArchiveTables
	mov r1, #4
	mov r4, r0
	bl ov13_0224128C
	ldr r1, _0223F7F4 ; =ov13_0224F5CC
	mov r2, r4
	ldr r3, [r1]
	str r0, [r3]
	ldr r0, [r1]
	ldr r1, [r0], #0x88
	bl FS_LoadArchiveTables
	ldr r1, _0223F7F4 ; =ov13_0224F5CC
	mov r0, #0x20
	ldr r1, [r1]
	mov r2, #4
	add r1, r1, #4
	bl ov13_0224022C
	ldr r2, _0223F7F4 ; =ov13_0224F5CC
	ldr r1, _0223F810 ; =ov13_0224741C
	ldr r3, [r2]
	ldr r2, _0223F7FC ; =ov13_0224593C
	str r0, [r3, #0x84]
	add r0, sp, #0x20
	bl OS_SPrintf
	add r0, sp, #0x20
	bl FS_ChangeDir
	add sp, sp, #0xe8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223F7F4: .word ov13_0224F5CC
_0223F7F8: .word ov13_02247404
_0223F7FC: .word ov13_0224593C
_0223F800: .word ov13_0223F8A0
_0223F804: .word 0x00000602
_0223F808: .word ov13_0223F904
_0223F80C: .word ov13_0223F954
_0223F810: .word ov13_0224741C
	arm_func_end ov13_0223F664

	arm_func_start ov13_0223F814
ov13_0223F814: ; 0x0223F814
	stmdb sp!, {r3, lr}
	ldr r0, _0223F894 ; =ov13_02247424
	bl FS_ChangeDir
	ldr r0, _0223F898 ; =ov13_0224F5CC
	ldr r0, [r0]
	add r0, r0, #0x88
	bl FS_UnloadArchiveTables
	ldr r0, _0223F898 ; =ov13_0224F5CC
	ldr r0, [r0]
	add r0, r0, #0x88
	bl FS_UnloadArchive
	ldr r0, _0223F898 ; =ov13_0224F5CC
	ldr r0, [r0]
	add r0, r0, #0x88
	bl FS_ReleaseArchiveName
	ldr r0, _0223F898 ; =ov13_0224F5CC
	ldr r0, [r0]
	ldrh r0, [r0, #0xe4]
	bl OS_ReleaseLockID
	ldr r0, _0223F898 ; =ov13_0224F5CC
	mov r2, #0
	ldr r1, [r0]
	strh r2, [r1, #0xe4]
	ldr r0, [r0]
	bl ov13_022412B0
	ldr r1, _0223F898 ; =ov13_0224F5CC
	ldr r0, _0223F89C ; =ov13_0224F5CC
	ldr r1, [r1]
	mov r2, #0
	str r2, [r1]
	bl ov13_022412B0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223F894: .word ov13_02247424
_0223F898: .word ov13_0224F5CC
_0223F89C: .word ov13_0224F5CC
	arm_func_end ov13_0223F814

	arm_func_start ov13_0223F8A0
ov13_0223F8A0: ; 0x0223F8A0
	stmdb sp!, {r3, lr}
	cmp r1, #1
	beq _0223F8F0
	cmp r1, #9
	beq _0223F8C0
	cmp r1, #0xa
	beq _0223F8D8
	b _0223F8F8
_0223F8C0:
	ldr r0, _0223F900 ; =ov13_0224F5CC
	ldr r0, [r0]
	ldrh r0, [r0, #0xe4]
	bl CARD_LockRom
	mov r0, #0
	ldmia sp!, {r3, pc}
_0223F8D8:
	ldr r0, _0223F900 ; =ov13_0224F5CC
	ldr r0, [r0]
	ldrh r0, [r0, #0xe4]
	bl CARD_UnlockRom
	mov r0, #0
	ldmia sp!, {r3, pc}
_0223F8F0:
	mov r0, #4
	ldmia sp!, {r3, pc}
_0223F8F8:
	mov r0, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223F900: .word ov13_0224F5CC
	arm_func_end ov13_0223F8A0

	arm_func_start ov13_0223F904
ov13_0223F904: ; 0x0223F904
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, _0223F940 ; =ov13_0223F944
	mov lr, r1
	str ip, [sp]
	mov ip, #1
	stmib sp, {r0, ip}
	ldr r0, [r0, #0x28]
	add r1, r2, r0
	mov r2, lr
	sub r0, ip, #2
	bl CARDi_ReadRom
	mov r0, #6
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.balign 4, 0
_0223F940: .word ov13_0223F944
	arm_func_end ov13_0223F904

	arm_func_start ov13_0223F944
ov13_0223F944: ; 0x0223F944
	ldr ip, _0223F950 ; =FS_NotifyArchiveAsyncEnd
	mov r1, #0
	bx ip
	.balign 4, 0
_0223F950: .word FS_NotifyArchiveAsyncEnd
	arm_func_end ov13_0223F944

	arm_func_start ov13_0223F954
ov13_0223F954: ; 0x0223F954
	mov r0, #1
	bx lr
	arm_func_end ov13_0223F954

	arm_func_start ov13_0223F95C
ov13_0223F95C: ; 0x0223F95C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x4c
	ldr r3, _0223FA48 ; =ov13_0224F5CC
	mov r6, r0
	ldr r0, [r3]
	mov r5, r1
	ldr r0, [r0, #0x84]
	mov r4, r2
	bl ov13_022402E0
	add r0, sp, #4
	bl FS_InitFile
	add r0, sp, #4
	mov r1, r6
	bl FS_OpenFile
	cmp r0, #0
	bne _0223F9A0
	bl OS_Terminate
_0223F9A0:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	mov r2, #2
	sub r7, r1, r0
	cmp r5, #0
	ldr r1, _0223FA4C ; =ov13_0224742C
	mov r0, r6
	strne r7, [r5]
	bl ov13_0223FA84
	cmp r0, #0
	mvnne r6, #3
	moveq r6, r4
	mov r0, r7
	mov r1, r6
	bl ov13_0224128C
	mov r1, r0
	add r0, sp, #4
	mov r2, r7
	str r1, [sp]
	bl FS_ReadFile
	add r0, sp, #4
	bl FS_CloseFile
	cmp r6, #0
	ldrgt r0, [sp]
	addgt sp, sp, #0x4c
	ldmgtia sp!, {r4, r5, r6, r7, pc}
	ldr r0, [sp]
	cmp r5, #0
	ldr r0, [r0]
	mov r1, r4
	mov r0, r0, lsr #8
	strne r0, [r5]
	bl ov13_0224128C
	mov r4, r0
	ldr r0, [sp]
	mov r1, r4
	bl MI_UncompressLZ8
	add r0, sp, #0
	bl ov13_022412B0
	mov r0, r4
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223FA48: .word ov13_0224F5CC
_0223FA4C: .word ov13_0224742C
	arm_func_end ov13_0223F95C

	arm_func_start ov13_0223FA50
ov13_0223FA50: ; 0x0223FA50
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r0, sp, #8
	bl ov13_022412B0
	ldr r0, _0223FA80 ; =ov13_0224F5CC
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0x84]
	bl ov13_02240288
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_0223FA80: .word ov13_0224F5CC
	arm_func_end ov13_0223FA50

	arm_func_start ov13_0223FA84
ov13_0223FA84: ; 0x0223FA84
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r5, r2
	bl strlen
	mov r4, r0
	mov r0, r6
	bl strlen
	cmp r4, r5
	cmpge r0, r5
	movlt r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	sub r1, r0, r5
	sub r3, r4, r5
	mov r2, r5
	add r0, r7, r3
	add r1, r6, r1
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov13_0223FA84

	arm_func_start ov13_0223FADC
ov13_0223FADC: ; 0x0223FADC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r0, #0x450
	mov r1, #4
	bl ov13_0224128C
	ldr sl, _0223FBAC ; =ov13_0224F5D0
	mov r8, #0
	mov sb, r8
	str r0, [sl]
	mov r7, #0x20
	mov r6, #0x10
	mov r5, #0x40
	mov r4, #0x7f
_0223FB0C:
	ldr r1, [sl]
	mov r0, r7
	mov r2, r6
	add r1, r1, sb
	bl ov13_0224022C
	ldr r1, [sl]
	add r1, r1, sb
	str r0, [r1, #0x224]
	bl ov13_02241B98
	ldr r2, [sl]
	mov r1, r5
	add r2, r2, sb
	str r0, [r2, #0x220]
	mov r0, r8
	bl ov13_02241DE4
	ldr r2, [sl]
	mov r1, r4
	add r2, r2, sb
	str r0, [r2, #0x208]
	mov r0, r8
	bl ov13_02241DE4
	add r1, r0, #8
	ldr r0, [sl]
	add r0, r0, sb
	str r1, [r0, #0x218]
	ldr r0, [sl]
	add r1, r0, sb
	ldr r0, [r1, #0x220]
	add r1, r1, #0x200
	bl ov13_02241C58
	ldr r0, [sl]
	add r1, r0, sb
	ldr r0, [r1, #0x220]
	add r1, r1, #0x210
	bl ov13_02241C48
	add sb, sb, #0x228
	add r8, r8, #1
	cmp r8, #2
	blt _0223FB0C
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_0223FBAC: .word ov13_0224F5D0
	arm_func_end ov13_0223FADC

	arm_func_start ov13_0223FBB0
ov13_0223FBB0: ; 0x0223FBB0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, #0
	ldr r4, _0223FBFC ; =ov13_0224F5D0
	mov r6, r5
_0223FBC0:
	ldr r0, [r4]
	add r0, r0, r6
	ldr r0, [r0, #0x220]
	bl ov13_02241BC4
	ldr r0, [r4]
	add r0, r0, r6
	ldr r0, [r0, #0x224]
	bl ov13_0224026C
	add r5, r5, #1
	cmp r5, #2
	add r6, r6, #0x228
	blt _0223FBC0
	ldr r0, _0223FC00 ; =ov13_0224F5D0
	bl ov13_022412B0
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0223FBFC: .word ov13_0224F5D0
_0223FC00: .word ov13_0224F5D0
	arm_func_end ov13_0223FBB0

	arm_func_start ov13_0223FC04
ov13_0223FC04: ; 0x0223FC04
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0x228
	mul r7, sb, r0
	ldr r0, _0223FD5C ; =ov13_0224F5D0
	mov r8, r1
	ldr r0, [r0]
	mov r5, r2
	add r0, r0, r7
	ldr r0, [r0, #0x224]
	bl ov13_022402E0
	mov r4, r0
	mov r0, #1
	bl OS_DisableIrqMask
	mov r6, r0
	cmp r5, #0
	mov r0, #0x228
	beq _0223FCC8
	ldr r1, _0223FD5C ; =ov13_0224F5D0
	ldr r1, [r1]
	mla r0, sb, r0, r1
	add r5, r0, #0x200
	add r0, r0, #0x210
	cmp r5, r0
	beq _0223FCA8
	add r0, r1, r7
	add r1, r0, #0x210
_0223FC70:
	ldrb r3, [r5, #0xc]
	ldmib r5, {r0, sb}
	add sb, sb, r3, lsl #3
	ldr r2, [r0, #8]
	add r3, sb, r8, lsl #3
	cmp r3, r2
	bhi _0223FC9C
	mov r1, r4
	str sb, [r4, #8]
	bl ov13_02241C18
	b _0223FCA8
_0223FC9C:
	mov r5, r0
	cmp r0, r1
	bne _0223FC70
_0223FCA8:
	ldr r0, _0223FD5C ; =ov13_0224F5D0
	ldr r0, [r0]
	add r0, r0, r7
	add r0, r0, #0x210
	cmp r5, r0
	bne _0223FD48
	bl OS_Terminate
	b _0223FD48
_0223FCC8:
	ldr r1, _0223FD5C ; =ov13_0224F5D0
	ldr r1, [r1]
	mla r0, sb, r0, r1
	add r5, r0, #0x210
	add r0, r0, #0x200
	cmp r5, r0
	beq _0223FD2C
	add r0, r1, r7
	add r0, r0, #0x200
_0223FCEC:
	ldr sb, [r5]
	ldr r3, [r5, #8]
	ldrb r1, [sb, #0xc]
	ldr r2, [sb, #8]
	sub r3, r3, r8, lsl #3
	add r1, r2, r1, lsl #3
	cmp r3, r1
	blo _0223FD20
	mov r0, r5
	mov r1, r4
	str r3, [r4, #8]
	bl ov13_02241C18
	b _0223FD2C
_0223FD20:
	mov r5, sb
	cmp sb, r0
	bne _0223FCEC
_0223FD2C:
	ldr r0, _0223FD5C ; =ov13_0224F5D0
	ldr r0, [r0]
	add r0, r0, r7
	add r0, r0, #0x200
	cmp r5, r0
	bne _0223FD48
	bl OS_Terminate
_0223FD48:
	mov r0, r6
	bl OS_EnableIrqMask
	mov r0, r4
	strb r8, [r4, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0223FD5C: .word ov13_0224F5D0
	arm_func_end ov13_0223FC04

	arm_func_start ov13_0223FD60
ov13_0223FD60: ; 0x0223FD60
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #0xc]
	mov r4, #0
	mov r3, r4
	cmp r0, #0
	ldr r2, [r5, #8]
	ble _0223FDA4
	ldr r0, _0223FDD8 ; =0xC1FFFCFF
_0223FD84:
	ldr r1, [r2]
	add r3, r3, #1
	and r1, r1, r0
	orr r1, r1, #0x200
	str r1, [r2], #8
	ldrb r1, [r5, #0xc]
	cmp r3, r1
	blt _0223FD84
_0223FDA4:
	mov r0, r5
	bl ov13_02241BE0
	ldr r0, _0223FDDC ; =ov13_0224F5D0
	ldr r1, [r0]
	add r0, r1, #0x228
	cmp r5, r0
	movhs r4, #1
	mov r0, #0x228
	mla r0, r4, r0, r1
	ldr r0, [r0, #0x224]
	mov r1, r5
	bl ov13_02240288
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223FDD8: .word 0xC1FFFCFF
_0223FDDC: .word ov13_0224F5D0
	arm_func_end ov13_0223FD60

	arm_func_start ov13_0223FDE0
ov13_0223FDE0: ; 0x0223FDE0
	ldr r0, [r0, #8]
	add r0, r0, r1, lsl #3
	bx lr
	arm_func_end ov13_0223FDE0

	arm_func_start ov13_0223FDEC
ov13_0223FDEC: ; 0x0223FDEC
	ldrb r0, [r0, #0xc]
	bx lr
	arm_func_end ov13_0223FDEC

	arm_func_start ov13_0223FDF4
ov13_0223FDF4: ; 0x0223FDF4
	stmdb sp!, {r4, lr}
	cmp r1, #0
	ldr ip, [r0, #8]
	blt _0223FE40
	cmp r2, #0x100
	cmpne r2, #0x300
	ldr r0, _0223FE94 ; =0xC1FFFCFF
	beq _0223FE28
	ldr r3, [ip, r1, lsl #3]
	and r0, r3, r0
	orr r0, r0, r2
	str r0, [ip, r1, lsl #3]
	ldmia sp!, {r4, pc}
_0223FE28:
	ldr r4, [ip, r1, lsl #3]
	and r0, r4, r0
	orr r0, r0, r2
	orr r0, r0, r3, lsl #25
	str r0, [ip, r1, lsl #3]
	ldmia sp!, {r4, pc}
_0223FE40:
	ldrb r4, [r0, #0xc]
	mov r1, #0
	cmp r4, #0
	ldmleia sp!, {r4, pc}
	ldr lr, _0223FE94 ; =0xC1FFFCFF
_0223FE54:
	cmp r2, #0x100
	cmpne r2, #0x300
	ldr r4, [ip, r1, lsl #3]
	beq _0223FE70
	and r4, r4, lr
	orr r4, r4, r2
	b _0223FE7C
_0223FE70:
	and r4, r4, lr
	orr r4, r4, r2
	orr r4, r4, r3, lsl #25
_0223FE7C:
	str r4, [ip, r1, lsl #3]
	ldrb r4, [r0, #0xc]
	add r1, r1, #1
	cmp r1, r4
	blt _0223FE54
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223FE94: .word 0xC1FFFCFF
	arm_func_end ov13_0223FDF4

	arm_func_start ov13_0223FE98
ov13_0223FE98: ; 0x0223FE98
	stmdb sp!, {r4, lr}
	cmp r1, #0
	ldr ip, [r0, #8]
	blt _0223FED0
	ldr r0, [ip, r1, lsl #3]
	add lr, ip, r1, lsl #3
	bic r0, r0, #0xc00
	orr r0, r0, r2, lsl #10
	str r0, [ip, r1, lsl #3]
	ldrh r0, [lr, #4]
	bic r0, r0, #0xf000
	orr r0, r0, r3, lsl #12
	strh r0, [lr, #4]
	ldmia sp!, {r4, pc}
_0223FED0:
	ldrb r1, [r0, #0xc]
	mov r4, #0
	cmp r1, #0
	ldmleia sp!, {r4, pc}
_0223FEE0:
	ldr r1, [ip, r4, lsl #3]
	add lr, ip, r4, lsl #3
	bic r1, r1, #0xc00
	orr r1, r1, r2, lsl #10
	str r1, [ip, r4, lsl #3]
	ldrh r1, [lr, #4]
	add r4, r4, #1
	bic r1, r1, #0xf000
	orr r1, r1, r3, lsl #12
	strh r1, [lr, #4]
	ldrb r1, [r0, #0xc]
	cmp r4, r1
	blt _0223FEE0
	ldmia sp!, {r4, pc}
	arm_func_end ov13_0223FE98

	arm_func_start ov13_0223FF18
ov13_0223FF18: ; 0x0223FF18
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	cmp r1, #0
	ldr r5, [r0, #8]
	blt _0223FF54
	ldr r4, [r5, r1, lsl #3]
	ldr r0, _02240000 ; =0xFE00FF00
	and r3, r3, #0xff
	and r0, r4, r0
	mov r2, r2, lsl #0x17
	orr r0, r0, r3
	orr r0, r0, r2, lsr #7
	add sp, sp, #0x10
	str r0, [r5, r1, lsl #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0223FF54:
	ldr r1, [r5]
	ldr ip, _02240000 ; =0xFE00FF00
	and r6, r3, #0xff
	and r7, r1, ip
	mov sb, r1
	ldr r1, _02240004 ; =0x01FF0000
	mov r8, r2, lsl #0x17
	orr r6, r7, r6
	orr r6, r6, r8, lsr #7
	str r6, [r5]
	ldrb r6, [r0, #0xc]
	and r4, sb, r1
	and lr, sb, #0xff
	mov r7, r4, lsr #0x10
	str r7, [sp, #0xc]
	cmp r6, #1
	str lr, [sp, #8]
	sub r6, r2, r4, lsr #16
	sub r7, r3, lr
	mov r4, #1
	addle sp, sp, #0x10
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0223FFAC:
	ldr r2, [r5, r4, lsl #3]
	and r3, r2, #0xff
	mov sb, r2
	and lr, r2, r1
	add r8, r3, r7
	add r2, r6, lr, lsr #16
	and sb, sb, ip
	and r8, r8, #0xff
	mov sl, r2, lsl #0x17
	orr r2, sb, r8
	orr r2, r2, sl, lsr #7
	str r2, [r5, r4, lsl #3]
	ldrb r2, [r0, #0xc]
	add r4, r4, #1
	mov r8, lr, lsr #0x10
	cmp r4, r2
	blt _0223FFAC
	str r3, [sp]
	str r8, [sp, #4]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_02240000: .word 0xFE00FF00
_02240004: .word 0x01FF0000
	arm_func_end ov13_0223FF18

	arm_func_start ov13_02240008
ov13_02240008: ; 0x02240008
	stmdb sp!, {r3, lr}
	cmp r1, #0
	ldr ip, [r0, #8]
	blt _02240030
	add r1, ip, r1, lsl #3
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, r2, lsl #10
	strh r0, [r1, #4]
	ldmia sp!, {r3, pc}
_02240030:
	ldrb r1, [r0, #0xc]
	mov lr, #0
	cmp r1, #0
	ldmleia sp!, {r3, pc}
_02240040:
	add r3, ip, lr, lsl #3
	ldrh r1, [r3, #4]
	add lr, lr, #1
	bic r1, r1, #0xc00
	orr r1, r1, r2, lsl #10
	strh r1, [r3, #4]
	ldrb r1, [r0, #0xc]
	cmp lr, r1
	blt _02240040
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02240008

	arm_func_start ov13_02240068
ov13_02240068: ; 0x02240068
	stmdb sp!, {r3, lr}
	ldr lr, [r0, #8]
	ldr r0, _02240094 ; =0x01FF0000
	ldr ip, [lr, r1, lsl #3]
	and r0, ip, r0
	mov r0, r0, lsr #0x10
	str r0, [r2]
	ldr r0, [lr, r1, lsl #3]
	and r0, r0, #0xff
	str r0, [r3]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02240094: .word 0x01FF0000
	arm_func_end ov13_02240068

	arm_func_start ov13_02240098
ov13_02240098: ; 0x02240098
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, r1
	add r1, sp, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _022400C4 ; =ov13_0224F5D4
	str r0, [r1, r4, lsl #2]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_022400C4: .word ov13_0224F5D4
	arm_func_end ov13_02240098

	arm_func_start ov13_022400C8
ov13_022400C8: ; 0x022400C8
	stmdb sp!, {r4, lr}
	ldr r1, _022400EC ; =ov13_0224F5D4
	mov r4, r0
	ldr r0, [r1, r4, lsl #2]
	bl ov13_0223FA50
	ldr r0, _022400EC ; =ov13_0224F5D4
	mov r1, #0
	str r1, [r0, r4, lsl #2]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022400EC: .word ov13_0224F5D4
	arm_func_end ov13_022400C8

	arm_func_start ov13_022400F0
ov13_022400F0: ; 0x022400F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r3, _02240180 ; =ov13_0224F5D4
	mov r5, r2
	ldr r6, [r3, r0, lsl #2]
	mov r2, r1, lsl #3
	add r0, r6, r1, lsl #3
	ldr r3, [r0, #4]
	ldrh r4, [r6, r2]
	add r1, sp, #0
	mov r0, #0
	mov r2, #8
	add sb, r6, r3
	bl MIi_CpuClear32
	cmp r4, #0
	mov sl, #0
	addle sp, sp, #8
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	add r8, sp, #0
	mov r7, #6
	mov r6, #8
_02240144:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	bl MIi_CpuCopy16
	mov r0, r8
	mov r1, r5
	mov r2, r6
	bl MIi_CpuCopy32
	add sl, sl, #1
	cmp sl, r4
	add sb, sb, #6
	add r5, r5, #8
	blt _02240144
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_02240180: .word ov13_0224F5D4
	arm_func_end ov13_022400F0

	arm_func_start ov13_02240184
ov13_02240184: ; 0x02240184
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl ov13_02241D78
	mov r4, r0
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov13_022400F0
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov13_02240184

	arm_func_start ov13_022401B0
ov13_022401B0: ; 0x022401B0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _022401F4 ; =ov13_0224F5D4
	mov r6, r0
	mov r5, r1
	ldr r3, [r3, r6, lsl #2]
	mov r1, r5, lsl #3
	ldrh r1, [r3, r1]
	bl ov13_0223FC04
	mov r1, #0
	mov r4, r0
	bl ov13_0223FDE0
	mov r2, r0
	mov r0, r6
	mov r1, r5
	bl ov13_022400F0
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_022401F4: .word ov13_0224F5D4
	arm_func_end ov13_022401B0

	arm_func_start ov13_022401F8
ov13_022401F8: ; 0x022401F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #1
	mov r0, r0, lsl #2
	add r0, r0, #8
	mov r1, #4
	bl ov13_0224128C
	add r1, r4, #1
	strh r1, [r0]
	mov r1, #0
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, pc}
	arm_func_end ov13_022401F8

	arm_func_start ov13_0224022C
ov13_0224022C: ; 0x0224022C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl ov13_022401F8
	cmp r6, #0
	mov r2, #0
	ble _02240264
_0224024C:
	add r1, r0, r2, lsl #2
	add r2, r2, #1
	str r5, [r1, #4]
	cmp r2, r6
	add r5, r5, r4
	blt _0224024C
_02240264:
	strb r6, [r0, #3]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov13_0224022C

	arm_func_start ov13_0224026C
ov13_0224026C: ; 0x0224026C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r0, sp, #8
	bl ov13_022412B0
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov13_0224026C

	arm_func_start ov13_02240288
ov13_02240288: ; 0x02240288
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r0, #1
	mov r4, r1
	bl OS_DisableIrqMask
	ldrb r2, [r5, #3]
	mov r6, r0
	ldrh r1, [r5]
	add r0, r2, #1
	bl FX_ModS32
	ldrb r1, [r5, #2]
	mov r7, r0
	cmp r7, r1
	bne _022402C4
	bl OS_Terminate
_022402C4:
	ldrb r1, [r5, #3]
	mov r0, r6
	add r1, r5, r1, lsl #2
	str r4, [r1, #4]
	strb r7, [r5, #3]
	bl OS_EnableIrqMask
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov13_02240288

	arm_func_start ov13_022402E0
ov13_022402E0: ; 0x022402E0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #1
	mov r4, #0
	bl OS_DisableIrqMask
	ldrb r2, [r6, #3]
	ldrb r1, [r6, #2]
	mov r5, r0
	cmp r1, r2
	beq _02240328
	ldrh r1, [r6]
	add r0, r2, r1
	sub r0, r0, #1
	bl FX_ModS32
	and r1, r0, #0xff
	strb r0, [r6, #3]
	add r0, r6, r1, lsl #2
	ldr r4, [r0, #4]
_02240328:
	mov r0, r5
	bl OS_EnableIrqMask
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov13_022402E0

	arm_func_start ov13_02240338
ov13_02240338: ; 0x02240338
	stmdb sp!, {r3, lr}
	mov r0, #0x18
	mov r1, #4
	bl ov13_0224128C
	ldr r2, _02240374 ; =ov13_0224F5DC
	mov r1, #0x3f
	str r0, [r2]
	ldr r0, _02240378 ; =0x04000050
	mov r2, #0x10
	bl G2x_SetBlendBrightness_
	ldr r0, _0224037C ; =0x04001050
	mov r1, #0x3f
	mov r2, #0x10
	bl G2x_SetBlendBrightness_
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02240374: .word ov13_0224F5DC
_02240378: .word 0x04000050
_0224037C: .word 0x04001050
	arm_func_end ov13_02240338

	arm_func_start ov13_02240380
ov13_02240380: ; 0x02240380
	ldr ip, _0224038C ; =ov13_022412B0
	ldr r0, _02240390 ; =ov13_0224F5DC
	bx ip
	.balign 4, 0
_0224038C: .word ov13_022412B0
_02240390: .word ov13_0224F5DC
	arm_func_end ov13_02240380

	arm_func_start ov13_02240394
ov13_02240394: ; 0x02240394
	cmp r0, #1
	ldreq r0, _022403B4 ; =ov13_0224F5DC
	ldreq r0, [r0]
	ldrne r0, _022403B4 ; =ov13_0224F5DC
	ldrne r0, [r0]
	addne r0, r0, #0xc
	ldrb r0, [r0, #9]
	bx lr
	.balign 4, 0
_022403B4: .word ov13_0224F5DC
	arm_func_end ov13_02240394

	arm_func_start ov13_022403B8
ov13_022403B8: ; 0x022403B8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r4, _0224047C ; =ov13_02245940
	mov r5, r0
	ldrb r0, [r4, #0xb]
	ldrb r6, [r4, #8]
	ldrb lr, [r4, #9]
	strb r0, [sp, #3]
	cmp r1, #1
	ldreq r0, _02240480 ; =ov13_0224F5DC
	strb r6, [sp]
	ldreq r6, [r0]
	ldrne r0, _02240480 ; =ov13_0224F5DC
	ldrb ip, [r4, #0xa]
	ldrne r0, [r0]
	mov r4, r3
	addne r6, r0, #0xc
	ldrb r0, [r6, #9]
	strb lr, [sp, #1]
	strb ip, [sp, #2]
	cmp r0, #0
	addne sp, sp, #4
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, pc}
	cmp r1, #1
	add r0, sp, #0
	mov r1, r2
	bne _02240438
	ldrsb r2, [r0, r5]
	ldr r0, _02240484 ; =0x04001050
	bl G2x_SetBlendBrightness_
	b _02240444
_02240438:
	ldrsb r2, [r0, r5]
	ldr r0, _02240488 ; =0x04000050
	bl G2x_SetBlendBrightness_
_02240444:
	ldr r1, _0224048C ; =ov13_02240490
	mov r2, r6
	mov r0, #1
	mov r3, #0xc8
	bl ov13_02242528
	str r0, [r6]
	mov r0, #0
	strh r0, [r6, #4]
	strb r5, [r6, #8]
	strh r4, [r6, #6]
	mov r0, #1
	strb r0, [r6, #9]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_0224047C: .word ov13_02245940
_02240480: .word ov13_0224F5DC
_02240484: .word 0x04001050
_02240488: .word 0x04000050
_0224048C: .word ov13_02240490
	arm_func_end ov13_022403B8

	arm_func_start ov13_02240490
ov13_02240490: ; 0x02240490
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r2, _022405A8 ; =ov13_02245940
	mov r4, r1
	ldrsh r1, [r4, #4]
	ldrb sb, [r2, #4]
	ldrb r8, [r2, #5]
	ldrb r7, [r2, #6]
	ldrb r6, [r2, #7]
	ldrb lr, [r2]
	ldrb ip, [r2, #1]
	ldrb r3, [r2, #2]
	ldrb r2, [r2, #3]
	add r1, r1, #1
	mov r5, r0
	strh r1, [r4, #4]
	ldrsh r0, [r4, #4]
	ldrh r1, [r4, #6]
	strb sb, [sp, #4]
	mov r0, r0, lsl #4
	strb r8, [sp, #5]
	strb r7, [sp, #6]
	strb r6, [sp, #7]
	strb lr, [sp]
	strb ip, [sp, #1]
	strb r3, [sp, #2]
	strb r2, [sp, #3]
	bl FX_DivS32
	ldrb r3, [r4, #8]
	add r2, sp, #4
	mov r1, r0
	ldrb r0, [r2, r3]
	tst r0, #1
	rsbne r1, r1, #0x10
	tst r0, #0x10
	ldr r0, _022405AC ; =ov13_0224F5DC
	rsbne r1, r1, #0
	ldr r0, [r0]
	cmp r4, r0
	bne _0224053C
	ldr r0, _022405B0 ; =0x04001050
	bl G2x_ChangeBlendBrightness_
	b _02240544
_0224053C:
	ldr r0, _022405B4 ; =0x04000050
	bl G2x_ChangeBlendBrightness_
_02240544:
	ldrsh r1, [r4, #4]
	ldrh r0, [r4, #6]
	cmp r1, r0
	addlt sp, sp, #8
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _022405AC ; =ov13_0224F5DC
	ldrb r2, [r4, #8]
	ldr r0, [r0]
	add r1, sp, #0
	cmp r4, r0
	bne _02240580
	ldrsb r1, [r1, r2]
	ldr r0, _022405B0 ; =0x04001050
	bl G2x_ChangeBlendBrightness_
	b _0224058C
_02240580:
	ldrsb r1, [r1, r2]
	ldr r0, _022405B4 ; =0x04000050
	bl G2x_ChangeBlendBrightness_
_0224058C:
	mov r2, #0
	mov r1, r5
	mov r0, #1
	strb r2, [r4, #9]
	bl ov13_022425D0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_022405A8: .word ov13_02245940
_022405AC: .word ov13_0224F5DC
_022405B0: .word 0x04001050
_022405B4: .word 0x04000050
	arm_func_end ov13_02240490

	arm_func_start ov13_022405B8
ov13_022405B8: ; 0x022405B8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02240608 ; =ov13_0224F5DC
	mov r5, r0
	ldr r4, [r1]
	ldrb r0, [r4, #9]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, _0224060C ; =ov13_02240610
	mov r2, r4
	mov r0, #1
	mov r3, #0xc8
	bl ov13_02242528
	str r0, [r4]
	mov r0, #0
	strh r0, [r4, #4]
	strh r5, [r4, #6]
	mov r0, #1
	strb r0, [r4, #9]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02240608: .word ov13_0224F5DC
_0224060C: .word ov13_02240610
	arm_func_end ov13_022405B8

	arm_func_start ov13_02240610
ov13_02240610: ; 0x02240610
	stmdb sp!, {r3, lr}
	ldrsh r2, [r1, #4]
	add r2, r2, #1
	strh r2, [r1, #4]
	ldrsh r3, [r1, #4]
	ldrh r2, [r1, #6]
	cmp r3, r2
	ldmltia sp!, {r3, pc}
	mov r2, #0
	strb r2, [r1, #9]
	mov r1, r0
	mov r0, #1
	bl ov13_022425D0
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02240610

	arm_func_start ov13_02240648
ov13_02240648: ; 0x02240648
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r0, #0x680
	mov r1, #4
	bl ov13_0224128C
	mov r4, r0
	ldr r3, _02240740 ; =ov13_0224F5E0
	add r1, r4, #0x10
	mov r0, #0x20
	mov r2, #0x30
	str r4, [r3]
	bl ov13_0224022C
	ldr r1, _02240740 ; =ov13_0224F5E0
	ldr r1, [r1]
	str r0, [r1, #0x670]
	bl ov13_0222B970
	cmp r0, #6
	mov r4, #4
	bne _022406E8
	mov r7, #0
	ldr r6, _02240744 ; =ov13_02247430
	ldr sb, _02240740 ; =ov13_0224F5E0
	mov r8, r7
	mov r5, r7
_022406A4:
	ldr r0, [r6, r7, lsl #2]
	mov r1, r5
	mov r2, r4
	bl ov13_0223F95C
	ldr r1, [sb]
	add r1, r1, r7, lsl #2
	str r0, [r1, #0x674]
	ldr r2, [sb]
	add r0, r2, r7, lsl #2
	ldr r1, [r0, #0x674]
	add r0, r2, r8
	bl NNS_G2dFontInitUTF16
	add r7, r7, #1
	cmp r7, #2
	add r8, r8, #8
	blt _022406A4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022406E8:
	mov r8, #0
	ldr r6, _02240748 ; =ov13_02247438
	ldr sb, _02240740 ; =ov13_0224F5E0
	mov r7, r8
	mov r5, r8
_022406FC:
	ldr r0, [r6, r8, lsl #2]
	mov r1, r5
	mov r2, r4
	bl ov13_0223F95C
	ldr r1, [sb]
	add r1, r1, r8, lsl #2
	str r0, [r1, #0x674]
	ldr r2, [sb]
	add r0, r2, r8, lsl #2
	ldr r1, [r0, #0x674]
	add r0, r2, r7
	bl NNS_G2dFontInitUTF16
	add r8, r8, #1
	cmp r8, #2
	add r7, r7, #8
	blt _022406FC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_02240740: .word ov13_0224F5E0
_02240744: .word ov13_02247430
_02240748: .word ov13_02247438
	arm_func_end ov13_02240648

	arm_func_start ov13_0224074C
ov13_0224074C: ; 0x0224074C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _02240790 ; =ov13_0224F5E0
	mov r5, #0
_02240758:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x674]
	bl ov13_0223FA50
	add r5, r5, #1
	cmp r5, #2
	blt _02240758
	ldr r0, _02240790 ; =ov13_0224F5E0
	ldr r0, [r0]
	ldr r0, [r0, #0x670]
	bl ov13_0224026C
	ldr r0, _02240794 ; =ov13_0224F5E0
	bl ov13_022412B0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02240790: .word ov13_0224F5E0
_02240794: .word ov13_0224F5E0
	arm_func_end ov13_0224074C

	arm_func_start ov13_02240798
ov13_02240798: ; 0x02240798
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r4, _02240870 ; =ov13_0224F5E0
	mov r7, r0
	ldr r0, [r4]
	mov r6, r1
	ldr r0, [r0, #0x670]
	mov r5, r2
	mov r8, r3
	bl ov13_022402E0
	mov r4, r0
	strb r6, [r4, #0x2e]
	mul r1, r6, r5
	mov r2, r8
	strb r5, [r4, #0x2f]
	mov r0, r7
	add r3, sp, #4
	bl ov13_02241EBC
	str r0, [r4, #0x28]
	ldr r1, [sp, #4]
	mov r0, r6
	strh r1, [r4, #0x2c]
	mov r1, r5
	bl NNSi_G2dCalcRequiredOBJ
	ldr r1, [sp, #0x20]
	cmp r7, #1
	str r0, [r1]
	moveq ip, #0x6600000
	ldr r7, [sp, #4]
	mov r1, #4
	movne ip, #0x6400000
	str r1, [sp]
	mov r0, r4
	mov r2, r6
	mov r3, r5
	add r1, ip, r7, lsl #7
	bl NNS_G2dCharCanvasInitForOBJ1D
	ldr r1, [r4, #0x14]
	mov r0, r4
	ldr r2, [r1, #4]
	mov r1, #0
	blx r2
	ldr r0, _02240870 ; =ov13_0224F5E0
	ldr r2, [sp, #0x24]
	ldr r0, [r0]
	mov r1, #1
	str r4, [r4, #0x18]
	add r0, r0, r2, lsl #3
	str r0, [r4, #0x1c]
	str r1, [r4, #0x20]
	mov r0, r4
	str r1, [r4, #0x24]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02240870: .word ov13_0224F5E0
	arm_func_end ov13_02240798

	arm_func_start ov13_02240874
ov13_02240874: ; 0x02240874
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x28]
	bl ov13_02242034
	ldr r0, _0224089C ; =ov13_0224F5E0
	mov r1, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x670]
	bl ov13_02240288
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0224089C: .word ov13_0224F5E0
	arm_func_end ov13_02240874

	arm_func_start ov13_022408A0
ov13_022408A0: ; 0x022408A0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	ldr r0, _022409FC ; =ov13_0224F5E0
	ldr r3, _02240A00 ; =ov13_02245952
	mov r4, r8, lsl #2
	ldr r2, _02240A04 ; =ov13_02245950
	ldr r0, [r0]
	ldrh r5, [r3, r4]
	ldrh r6, [r2, r4]
	add r3, r0, #0x610
	mov r0, #0x30
	mul r2, r6, r5
	mov r7, r1
	mla r4, r8, r0, r3
	mov r0, r2, lsl #5
	mov r1, #0x20
	bl ov13_0224128C
	str r0, [r4, #0x28]
	cmp r8, #1
	bne _02240918
	ldr r1, _02240A08 ; =0x04001008
	ldrh r0, [r1]
	bic r0, r0, #0x40
	strh r0, [r1]
	ldrh r0, [r1]
	and r0, r0, #0x43
	orr r0, r0, #0xc00
	strh r0, [r1]
	b _02240938
_02240918:
	ldr r1, _02240A0C ; =0x04000008
	ldrh r0, [r1]
	bic r0, r0, #0x40
	strh r0, [r1]
	ldrh r0, [r1]
	and r0, r0, #0x43
	orr r0, r0, #0xc00
	strh r0, [r1]
_02240938:
	mov r0, #4
	str r0, [sp]
	ldr r1, [r4, #0x28]
	mov r0, r4
	mov r2, r6
	mov r3, r5
	bl NNS_G2dCharCanvasInitForBG
	ldr r0, _022409FC ; =ov13_0224F5E0
	mov r1, #1
	ldr r0, [r0]
	cmp r8, #1
	str r4, [r4, #0x18]
	add r0, r0, r7, lsl #3
	str r0, [r4, #0x1c]
	str r1, [r4, #0x20]
	str r1, [r4, #0x24]
	bne _02240984
	bl G2S_GetBG0ScrPtr
	b _02240988
_02240984:
	bl G2_GetBG0ScrPtr
_02240988:
	ldr r1, _02240A10 ; =ov13_0224594C
	mov r2, r8, lsl #1
	mov r3, #0
	ldrh r7, [r1, r2]
	str r3, [sp]
	mov r1, #0x20
	str r1, [sp, #4]
	mov r1, r6
	mov r2, r5
	str r7, [sp, #8]
	mov r5, #0xf
	str r5, [sp, #0xc]
	bl NNS_G2dMapScrToCharText
	mov r0, r4
	mov r1, #0
	bl ov13_02240D80
	ldr r0, _022409FC ; =ov13_0224F5E0
	ldr r1, _02240A14 ; =ov13_02240A18
	ldr r2, [r0]
	mov r0, #1
	add r2, r2, #0x27c
	add r2, r2, #0x400
	add r2, r2, r8
	mov r3, #0xc8
	bl ov13_02242528
	str r0, [r4, #0x2c]
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_022409FC: .word ov13_0224F5E0
_02240A00: .word ov13_02245952
_02240A04: .word ov13_02245950
_02240A08: .word 0x04001008
_02240A0C: .word 0x04000008
_02240A10: .word ov13_0224594C
_02240A14: .word ov13_02240A18
	arm_func_end ov13_022408A0

	arm_func_start ov13_02240A18
ov13_02240A18: ; 0x02240A18
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldrb r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _02240A9C ; =ov13_0224F5E0
	ldr r1, [r0]
	add r0, r1, #0x27c
	add r0, r0, #0x400
	cmp r4, r0
	bne _02240A6C
	ldr r0, [r1, #0x638]
	mov r1, #0x6000
	bl DC_FlushRange
	ldr r0, _02240A9C ; =ov13_0224F5E0
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x6000
	ldr r0, [r0, #0x638]
	bl GX_LoadBG0Char
	b _02240A90
_02240A6C:
	ldr r0, [r1, #0x668]
	mov r1, #0x3000
	bl DC_FlushRange
	ldr r0, _02240A9C ; =ov13_0224F5E0
	mov r1, #0x3000
	ldr r0, [r0]
	mov r2, r1
	ldr r0, [r0, #0x668]
	bl GXS_LoadBG0Char
_02240A90:
	mov r0, #0
	strb r0, [r4]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02240A9C: .word ov13_0224F5E0
	arm_func_end ov13_02240A18

	arm_func_start ov13_02240AA0
ov13_02240AA0: ; 0x02240AA0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x2c]
	mov r0, #1
	bl ov13_022425F0
	ldr r0, _02240B00 ; =ov13_0224F5E0
	ldr r0, [r0]
	add r0, r0, #0x610
	cmp r4, r0
	bne _02240AE0
	bl G2_GetBG0CharPtr
	mov r1, r0
	mov r0, #0
	mov r2, #0x6000
	bl MIi_CpuClear16
	b _02240AF4
_02240AE0:
	bl G2_GetBG0CharPtr
	mov r1, r0
	mov r0, #0
	mov r2, #0x3000
	bl MIi_CpuClear16
_02240AF4:
	add r0, r4, #0x28
	bl ov13_022412B0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02240B00: .word ov13_0224F5E0
	arm_func_end ov13_02240AA0

	arm_func_start ov13_02240B04
ov13_02240B04: ; 0x02240B04
	ldr r2, _02240B20 ; =ov13_0224F5E0
	mov r1, #0x30
	ldr r2, [r2]
	ldr ip, _02240B24 ; =ov13_02240AA0
	add r2, r2, #0x610
	mla r0, r1, r0, r2
	bx ip
	.balign 4, 0
_02240B20: .word ov13_0224F5E0
_02240B24: .word ov13_02240AA0
	arm_func_end ov13_02240B04

	arm_func_start ov13_02240B28
ov13_02240B28: ; 0x02240B28
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r4, [r0, #0x1c]
	add ip, sp, #0xc
	mov lr, #0
	strb lr, [ip]
	strb lr, [ip, #1]
	ldr ip, [r4]
	ldr ip, [ip, #8]
	ldrb ip, [ip, #7]
	cmp ip, #7
	addls pc, pc, ip, lsl #2
	b _02240BA8
_02240B5C: ; jump table
	b _02240B7C ; case 0
	b _02240B88 ; case 1
	b _02240B88 ; case 2
	b _02240B94 ; case 3
	b _02240B94 ; case 4
	b _02240BA0 ; case 5
	b _02240BA0 ; case 6
	b _02240B7C ; case 7
_02240B7C:
	mov ip, #1
	strb ip, [sp, #0xc]
	b _02240BA8
_02240B88:
	mov ip, #1
	strb ip, [sp, #0xd]
	b _02240BA8
_02240B94:
	sub ip, lr, #1
	strb ip, [sp, #0xc]
	b _02240BA8
_02240BA0:
	sub ip, lr, #1
	strb ip, [sp, #0xd]
_02240BA8:
	ldr lr, [sp, #0x18]
	ldr ip, [sp, #0x1c]
	str lr, [sp]
	str ip, [sp, #4]
	ldrb lr, [sp, #0xc]
	ldrb ip, [sp, #0xd]
	add r0, r0, #0x18
	strb lr, [sp, #8]
	strb ip, [sp, #9]
	bl NNSi_G2dTextCanvasDrawText
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov13_02240B28

	arm_func_start ov13_02240BD8
ov13_02240BD8: ; 0x02240BD8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldrh ip, [sp, #0x10]
	str r3, [sp]
	ldr r3, _02240C10 ; =ov13_0224F5E0
	str ip, [sp, #4]
	ldr lr, [r3]
	ldr ip, [sp, #0x14]
	mov r3, r2
	mov r2, r1
	add r1, lr, ip, lsl #3
	bl NNS_G2dCharCanvasDrawChar
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02240C10: .word ov13_0224F5E0
	arm_func_end ov13_02240BD8

	arm_func_start ov13_02240C14
ov13_02240C14: ; 0x02240C14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r6, [sp, #0x34]
	mov sb, r1
	ldrh r1, [r6]
	ldr r7, [sp, #0x30]
	ldr r5, [sp, #0x38]
	cmp r1, #0
	mov sl, r0
	mov r8, r2
	mov fp, r3
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02240C48:
	ldr r0, _02240CB8 ; =ov13_0224F5E0
	ldr r0, [r0]
	add r4, r0, r5, lsl #3
	mov r0, r4
	bl NNS_G2dFontFindGlyphIndex
	mov r1, r0
	ldr r0, _02240CBC ; =0x0000FFFF
	cmp r1, r0
	ldreq r0, [r4]
	ldreqh r1, [r0, #2]
	mov r0, r4
	bl NNS_G2dFontGetCharWidthsFromIndex
	ldrh r1, [r6]
	mov r2, r0
	mov r0, sl
	stmia sp, {r1, r5}
	ldrsb r1, [r2, #2]
	mov r2, r8
	mov r3, fp
	sub r1, r7, r1
	add r1, sb, r1, asr #1
	bl ov13_02240BD8
	ldrh r1, [r6, #2]!
	add sb, sb, r7
	cmp r1, #0
	bne _02240C48
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02240CB8: .word ov13_0224F5E0
_02240CBC: .word 0x0000FFFF
	arm_func_end ov13_02240C14

	arm_func_start ov13_02240CC0
ov13_02240CC0: ; 0x02240CC0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x18
	ldr r4, [r0, #0x1c]
	add ip, sp, #0x14
	mov lr, #0
	strb lr, [ip]
	strb lr, [ip, #1]
	ldr ip, [r4]
	ldr ip, [ip, #8]
	ldrb ip, [ip, #7]
	cmp ip, #7
	addls pc, pc, ip, lsl #2
	b _02240D40
_02240CF4: ; jump table
	b _02240D14 ; case 0
	b _02240D20 ; case 1
	b _02240D20 ; case 2
	b _02240D2C ; case 3
	b _02240D2C ; case 4
	b _02240D38 ; case 5
	b _02240D38 ; case 6
	b _02240D14 ; case 7
_02240D14:
	mov ip, #1
	strb ip, [sp, #0x14]
	b _02240D40
_02240D20:
	mov ip, #1
	strb ip, [sp, #0x15]
	b _02240D40
_02240D2C:
	sub ip, lr, #1
	strb ip, [sp, #0x14]
	b _02240D40
_02240D38:
	sub ip, lr, #1
	strb ip, [sp, #0x15]
_02240D40:
	ldr lr, [sp, #0x20]
	ldr ip, [sp, #0x24]
	str lr, [sp]
	ldr lr, [sp, #0x28]
	str ip, [sp, #4]
	ldr ip, [sp, #0x2c]
	str lr, [sp, #8]
	str ip, [sp, #0xc]
	ldrb lr, [sp, #0x14]
	ldrb ip, [sp, #0x15]
	add r0, r0, #0x18
	strb lr, [sp, #0x10]
	strb ip, [sp, #0x11]
	bl NNSi_G2dTextCanvasDrawTextRect
	add sp, sp, #0x18
	ldmia sp!, {r4, pc}
	arm_func_end ov13_02240CC0

	arm_func_start ov13_02240D80
ov13_02240D80: ; 0x02240D80
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0x14]
	ldr r2, [r2, #4]
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02240D80

	arm_func_start ov13_02240D94
ov13_02240D94: ; 0x02240D94
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r6, r3
	mov r4, r0
	mov r8, r1
	mov r0, r6
	mov r1, #0
	mov r7, r2
	bl ov13_0223FDE0
	mov r2, #0
	mov r5, r0
	mov r0, r6
	mvn r1, #0
	mov r3, r2
	bl ov13_0223FDF4
	mov r0, r6
	mvn r1, #0
	mov r2, #0
	mov r3, #0xf
	bl ov13_0223FE98
	mov r0, r6
	mvn r1, #0
	ldr r2, [sp, #0x28]
	bl ov13_02240008
	str r7, [sp]
	mov r0, r5
	mov r3, r8
	mov r1, #0
	str r1, [sp, #4]
	ldrh r2, [r4, #0x2c]
	mov r1, #2
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	ldrb r1, [r4, #0x2e]
	ldrb r2, [r4, #0x2f]
	bl NNS_G2dArrangeOBJ1D
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov13_02240D94

	arm_func_start ov13_02240E2C
ov13_02240E2C: ; 0x02240E2C
	ldr r1, _02240E4C ; =ov13_0224F5E0
	ldr r2, [r1]
	add r1, r2, #0x610
	cmp r0, r1
	mov r0, #1
	streqb r0, [r2, #0x67c]
	strneb r0, [r2, #0x67d]
	bx lr
	.balign 4, 0
_02240E4C: .word ov13_0224F5E0
	arm_func_end ov13_02240E2C

	arm_func_start ov13_02240E50
ov13_02240E50: ; 0x02240E50
	strh r0, [r2]
	strh r1, [r2, #2]
	bx lr
	arm_func_end ov13_02240E50

	arm_func_start ov13_02240E5C
ov13_02240E5C: ; 0x02240E5C
	ldr ip, [sp]
	strh r0, [ip]
	strh r1, [ip, #2]
	strh r2, [ip, #4]
	strh r3, [ip, #6]
	bx lr
	arm_func_end ov13_02240E5C

	arm_func_start ov13_02240E74
ov13_02240E74: ; 0x02240E74
	ldrh r3, [r0]
	strh r3, [r2]
	ldrh r3, [r0, #2]
	strh r3, [r2, #2]
	ldrh ip, [r0]
	ldrh r3, [r1]
	add r3, ip, r3
	strh r3, [r2, #4]
	ldrh r3, [r0, #2]
	ldrh r0, [r1, #2]
	add r0, r3, r0
	strh r0, [r2, #6]
	bx lr
	arm_func_end ov13_02240E74

	arm_func_start ov13_02240EA8
ov13_02240EA8: ; 0x02240EA8
	cmp r0, #1
	bne _02240ED4
	ldr r3, _02240EF8 ; =0x04001000
	ldr r2, [r3]
	ldr r0, [r3]
	and ip, r2, #0x1f00
	bic r2, r0, #0x1f00
	orr r0, r1, ip, lsr #8
	orr r0, r2, r0, lsl #8
	str r0, [r3]
	bx lr
_02240ED4:
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r0, [r3]
	and ip, r2, #0x1f00
	bic r2, r0, #0x1f00
	orr r0, r1, ip, lsr #8
	orr r0, r2, r0, lsl #8
	str r0, [r3]
	bx lr
	.balign 4, 0
_02240EF8: .word 0x04001000
	arm_func_end ov13_02240EA8

	arm_func_start ov13_02240EFC
ov13_02240EFC: ; 0x02240EFC
	cmp r0, #1
	bne _02240F2C
	ldr r3, _02240F54 ; =0x04001000
	mvn r0, r1
	ldr r2, [r3]
	ldr r1, [r3]
	and r2, r2, #0x1f00
	bic r1, r1, #0x1f00
	and r0, r0, r2, lsr #8
	orr r0, r1, r0, lsl #8
	str r0, [r3]
	bx lr
_02240F2C:
	mov r3, #0x4000000
	ldr r0, [r3]
	ldr r2, [r3]
	and ip, r0, #0x1f00
	mvn r0, r1
	bic r1, r2, #0x1f00
	and r0, r0, ip, lsr #8
	orr r0, r1, r0, lsl #8
	str r0, [r3]
	bx lr
	.balign 4, 0
_02240F54: .word 0x04001000
	arm_func_end ov13_02240EFC

	arm_func_start ov13_02240F58
ov13_02240F58: ; 0x02240F58
	cmp r0, #1
	bne _02240FE0
	cmp r1, #0
	ldrh r0, [r2]
	ldrh r3, [r2, #2]
	bne _02240FA8
	ldrh r1, [r2, #4]
	ldrh ip, [r2, #6]
	mov r2, r0, lsl #8
	mov r0, r3, lsl #8
	and r3, r2, #0xff00
	and r1, r1, #0xff
	orr r3, r3, r1
	ldr r2, _02241060 ; =0x04001040
	and r1, r0, #0xff00
	and r0, ip, #0xff
	strh r3, [r2]
	orr r0, r1, r0
	strh r0, [r2, #4]
	bx lr
_02240FA8:
	ldrh r1, [r2, #4]
	ldrh ip, [r2, #6]
	mov r2, r0, lsl #8
	mov r0, r3, lsl #8
	and r3, r2, #0xff00
	and r1, r1, #0xff
	orr r3, r3, r1
	ldr r2, _02241064 ; =0x04001042
	and r1, r0, #0xff00
	and r0, ip, #0xff
	strh r3, [r2]
	orr r0, r1, r0
	strh r0, [r2, #4]
	bx lr
_02240FE0:
	cmp r1, #0
	ldrh r0, [r2]
	ldrh r3, [r2, #2]
	bne _02241028
	ldrh r1, [r2, #4]
	ldrh ip, [r2, #6]
	mov r2, r0, lsl #8
	mov r0, r3, lsl #8
	and r3, r2, #0xff00
	and r1, r1, #0xff
	orr r3, r3, r1
	ldr r2, _02241068 ; =0x04000040
	and r1, r0, #0xff00
	and r0, ip, #0xff
	strh r3, [r2]
	orr r0, r1, r0
	strh r0, [r2, #4]
	bx lr
_02241028:
	ldrh r1, [r2, #4]
	ldrh ip, [r2, #6]
	mov r2, r0, lsl #8
	mov r0, r3, lsl #8
	and r3, r2, #0xff00
	and r1, r1, #0xff
	orr r3, r3, r1
	ldr r2, _0224106C ; =0x04000042
	and r1, r0, #0xff00
	and r0, ip, #0xff
	strh r3, [r2]
	orr r0, r1, r0
	strh r0, [r2, #4]
	bx lr
	.balign 4, 0
_02241060: .word 0x04001040
_02241064: .word 0x04001042
_02241068: .word 0x04000040
_0224106C: .word 0x04000042
	arm_func_end ov13_02240F58

	arm_func_start ov13_02241070
ov13_02241070: ; 0x02241070
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	bx lr
_0224107C: ; jump table
	b _0224108C ; case 0
	b _022410DC ; case 1
	b _0224112C ; case 2
	b _0224117C ; case 3
_0224108C:
	cmp r0, #1
	bne _022410B8
	ldr r0, _022411CC ; =0x04001048
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f
	orr r1, r0, r2
	ldr r0, _022411CC ; =0x04001048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
_022410B8:
	ldr r0, _022411D0 ; =0x04000048
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f
	orr r1, r0, r2
	ldr r0, _022411D0 ; =0x04000048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
_022410DC:
	cmp r0, #1
	bne _02241108
	ldr r0, _022411CC ; =0x04001048
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f00
	orr r1, r0, r2, lsl #8
	ldr r0, _022411CC ; =0x04001048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
_02241108:
	ldr r0, _022411D0 ; =0x04000048
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f00
	orr r1, r0, r2, lsl #8
	ldr r0, _022411D0 ; =0x04000048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
_0224112C:
	cmp r0, #1
	bne _02241158
	ldr r0, _022411D4 ; =0x0400104A
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f00
	orr r1, r0, r2, lsl #8
	ldr r0, _022411D4 ; =0x0400104A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
_02241158:
	ldr r0, _022411D8 ; =0x0400004A
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f00
	orr r1, r0, r2, lsl #8
	ldr r0, _022411D8 ; =0x0400004A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
_0224117C:
	cmp r0, #1
	bne _022411A8
	ldr r0, _022411D4 ; =0x0400104A
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f
	orr r1, r0, r2
	ldr r0, _022411D4 ; =0x0400104A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
_022411A8:
	ldr r0, _022411D8 ; =0x0400004A
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f
	orr r1, r0, r2
	ldr r0, _022411D8 ; =0x0400004A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.balign 4, 0
_022411CC: .word 0x04001048
_022411D0: .word 0x04000048
_022411D4: .word 0x0400104A
_022411D8: .word 0x0400004A
	arm_func_end ov13_02241070

	arm_func_start ov13_022411DC
ov13_022411DC: ; 0x022411DC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0
	mov r2, #0x40000
	bl MI_CpuFill8
	mov r0, r4
	mov r1, #0x40000
	mov r2, #0
	bl NNS_FndCreateExpHeapEx
	ldr r1, _02241218 ; =ov13_0224F5E4
	cmp r0, #0
	str r0, [r1]
	ldmneia sp!, {r4, pc}
	bl OS_Terminate
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02241218: .word ov13_0224F5E4
	arm_func_end ov13_022411DC

	arm_func_start ov13_0224121C
ov13_0224121C: ; 0x0224121C
	stmdb sp!, {r3, lr}
	ldr r0, _0224123C ; =ov13_0224F5E4
	ldr r0, [r0]
	bl NNS_FndDestroyExpHeap
	ldr r0, _0224123C ; =ov13_0224F5E4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0224123C: .word ov13_0224F5E4
	arm_func_end ov13_0224121C

	arm_func_start ov13_02241240
ov13_02241240: ; 0x02241240
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #1
	mov r4, r1
	bl OS_DisableIrqMask
	ldr r1, _02241288 ; =ov13_0224F5E4
	mov r5, r0
	ldr r0, [r1]
	mov r1, r6
	mov r2, r4
	bl NNS_FndAllocFromExpHeapEx
	movs r4, r0
	bne _02241278
	bl OS_Terminate
_02241278:
	mov r0, r5
	bl OS_EnableIrqMask
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02241288: .word ov13_0224F5E4
	arm_func_end ov13_02241240

	arm_func_start ov13_0224128C
ov13_0224128C: ; 0x0224128C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov13_02241240
	mov r2, r4
	mov r1, #0
	mov r4, r0
	bl MI_CpuFill8
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov13_0224128C

	arm_func_start ov13_022412B0
ov13_022412B0: ; 0x022412B0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	bl OS_DisableIrqMask
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _022412F0 ; =ov13_0224F5E4
	ldr r0, [r0]
	bl NNS_FndFreeToExpHeap
	mov r0, r4
	bl OS_EnableIrqMask
	mov r0, #0
	str r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022412F0: .word ov13_0224F5E4
	arm_func_end ov13_022412B0

	arm_func_start ov13_022412F4
ov13_022412F4: ; 0x022412F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	bl OS_DisableIrqMask
	mov r4, r0
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _0224132C ; =ov13_0224F5E4
	mov r1, r5
	ldr r0, [r0]
	bl NNS_FndFreeToExpHeap
	mov r0, r4
	bl OS_EnableIrqMask
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224132C: .word ov13_0224F5E4
	arm_func_end ov13_022412F4

	arm_func_start ov13_02241330
ov13_02241330: ; 0x02241330
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov r0, #0x3a
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _022413A8 ; =ov13_0224F5E8
	str r0, [r1, #4]
	add r0, sp, #0
	bl TP_GetUserInfo
	cmp r0, #0
	bne _02241360
	bl OS_Terminate
_02241360:
	add r0, sp, #0
	bl TP_SetCalibrateParam
	ldr r1, _022413A8 ; =ov13_0224F5E8
	mov r0, #0
	ldr r2, [r1, #4]
	mov r1, #4
	mov r3, #5
	bl TP_RequestAutoSamplingStartAsync
	mov r0, #2
	bl TP_WaitBusy
	mov r0, #2
	bl TP_CheckBusy
	cmp r0, #0
	beq _0224139C
	bl OS_Terminate
_0224139C:
	bl ov13_022413E4
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022413A8: .word ov13_0224F5E8
	arm_func_end ov13_02241330

	arm_func_start ov13_022413AC
ov13_022413AC: ; 0x022413AC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #4
	mov r4, r5
_022413B8:
	bl TP_RequestAutoSamplingStopAsync
	mov r0, r5
	bl TP_WaitBusy
	mov r0, r4
	bl TP_CheckBusy
	cmp r0, #0
	bne _022413B8
	ldr r0, _022413E0 ; =ov13_0224F5EC
	bl ov13_022412B0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022413E0: .word ov13_0224F5EC
	arm_func_end ov13_022413AC

	arm_func_start ov13_022413E4
ov13_022413E4: ; 0x022413E4
	stmdb sp!, {r3, lr}
	bl ov13_022413F4
	bl ov13_022414F8
	ldmia sp!, {r3, pc}
	arm_func_end ov13_022413E4

	arm_func_start ov13_022413F4
ov13_022413F4: ; 0x022413F4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022414E4 ; =0x04000130
	ldr r0, _022414E8 ; =0x027FFFA8
	ldrh r2, [r1]
	ldrh r1, [r0]
	ldr r4, _022414EC ; =ov13_0224F5E8
	ldr r0, _022414F0 ; =0x00002FFF
	orr r1, r2, r1
	eor r1, r1, r0
	and r0, r1, r0
	ldr r5, [r4, #4]
	mov r0, r0, lsl #0x10
	ldrh r1, [r5, #0x30]
	mov ip, r0, lsr #0x10
	ldr r3, _022414F4 ; =ov13_0224F5F0
	eor r1, r1, r0, lsr #16
	and r1, r1, r0, lsr #16
	strh r1, [r5, #0x32]
	ldrh r5, [r5, #0x30]
	ldr r1, [r4, #4]
	mov r2, #0
	eor r0, r5, r0, lsr #16
	and r0, r5, r0
	strh r0, [r1, #0x36]
	ldr r0, [r4, #4]
	mov r5, #0x28
	strh ip, [r0, #0x30]
	ldr r1, [r4, #4]
	ldrh r0, [r1, #0x32]
	strh r0, [r1, #0x34]
	mov r0, r2
	mov r1, #1
_02241474:
	mov r6, r1, lsl r2
	mov lr, r6, lsl #0x10
	tst ip, lr, lsr #16
	streqb r0, [r3]
	beq _022414D0
	ldrb r6, [r3]
	add r7, r6, #1
	and r6, r7, #0xff
	strb r7, [r3]
	cmp r6, #0x28
	bne _022414B4
	ldr r7, [r4, #4]
	ldrh r6, [r7, #0x34]
	orr r6, r6, lr, lsr #16
	strh r6, [r7, #0x34]
	b _022414D0
_022414B4:
	cmp r6, #0x2f
	bne _022414D0
	ldr r7, [r4, #4]
	ldrh r6, [r7, #0x34]
	orr r6, r6, lr, lsr #16
	strh r6, [r7, #0x34]
	strb r5, [r3]
_022414D0:
	add r2, r2, #1
	cmp r2, #0xe
	add r3, r3, #1
	blt _02241474
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022414E4: .word 0x04000130
_022414E8: .word 0x027FFFA8
_022414EC: .word ov13_0224F5E8
_022414F0: .word 0x00002FFF
_022414F4: .word ov13_0224F5F0
	arm_func_end ov13_022413F4

	arm_func_start ov13_022414F8
ov13_022414F8: ; 0x022414F8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r0, _02241690 ; =ov13_0224F5E8
	mov r5, #0
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x38]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	movne r6, #1
	moveq r6, #0
	bl TP_GetLatestIndexInAuto
	ldr r7, _02241690 ; =ov13_0224F5E8
	mov r4, r5
	ldr r3, [r7, #4]
	mov r8, #5
	ldrh r2, [r3, #0x28]
	ldrh r1, [r3, #0x2a]
	strh r2, [r3, #0x2c]
	strh r1, [r3, #0x2e]
_02241544:
	ldr r1, [r7, #4]
	add r1, r1, r0, lsl #3
	ldrh r2, [r1, #4]
	cmp r2, #1
	ldreqh r2, [r1, #6]
	cmpeq r2, #0
	bne _02241588
	add r0, sp, #0
	mov r5, #1
	bl TP_GetCalibratedPoint
	ldr r1, _02241690 ; =ov13_0224F5E8
	ldrh r0, [sp]
	ldr r2, [r1, #4]
	ldrh r1, [sp, #2]
	add r2, r2, #0x28
	bl ov13_02240E50
	b _022415A0
_02241588:
	mov r1, r8
	add r4, r4, #1
	add r0, r0, #4
	bl FX_ModS32
	cmp r4, #4
	blt _02241544
_022415A0:
	ldr r0, _02241690 ; =ov13_0224F5E8
	eor r7, r5, r6
	ldr r4, [r0, #4]
	and r1, r5, r7
	ldrb r3, [r4, #0x38]
	and r2, r1, #0xff
	and r1, r6, r7
	bic r3, r3, #2
	mov r2, r2, lsl #0x1f
	orr r2, r3, r2, lsr #30
	strb r2, [r4, #0x38]
	ldr r4, [r0, #4]
	and r1, r1, #0xff
	ldrb r3, [r4, #0x38]
	mov r2, r1, lsl #0x1f
	cmp r5, #0
	bic r3, r3, #8
	orr r2, r3, r2, lsr #28
	strb r2, [r4, #0x38]
	ldr r3, [r0, #4]
	and r1, r5, #1
	ldrb r2, [r3, #0x38]
	addeq sp, sp, #8
	bic r2, r2, #1
	orr r1, r2, r1
	strb r1, [r3, #0x38]
	ldr r3, [r0, #4]
	ldrb r2, [r3, #0x38]
	mov r1, r2, lsl #0x1e
	mov r1, r1, lsr #0x1f
	bic r2, r2, #4
	mov r1, r1, lsl #0x1f
	orr r1, r2, r1, lsr #29
	strb r1, [r3, #0x38]
	moveq r1, #0
	streqb r1, [r0, #1]
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r1, [r0, #1]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0, #1]
	cmp r1, #0x28
	bne _02241664
	ldr r1, [r0, #4]
	add sp, sp, #8
	ldrb r0, [r1, #0x38]
	orr r0, r0, #4
	strb r0, [r1, #0x38]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02241664:
	cmp r1, #0x2f
	addne sp, sp, #8
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r3, [r0, #4]
	mov r1, #0x28
	ldrb r2, [r3, #0x38]
	orr r2, r2, #4
	strb r2, [r3, #0x38]
	strb r1, [r0, #1]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02241690: .word ov13_0224F5E8
	arm_func_end ov13_022414F8

	arm_func_start ov13_02241694
ov13_02241694: ; 0x02241694
	ldr r1, _022416CC ; =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	movs r1, r1, asr #0xf
	movne r0, #0
	bxne lr
	ldr r1, _022416D0 ; =ov13_0224F5E8
	ldr r1, [r1, #4]
	ldrh r1, [r1, #0x32]
	and r1, r0, r1
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	bx lr
	.balign 4, 0
_022416CC: .word 0x027FFFA8
_022416D0: .word ov13_0224F5E8
	arm_func_end ov13_02241694

	arm_func_start ov13_022416D4
ov13_022416D4: ; 0x022416D4
	ldr r1, _0224170C ; =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	movs r1, r1, asr #0xf
	movne r0, #0
	bxne lr
	ldr r1, _02241710 ; =ov13_0224F5E8
	ldr r1, [r1, #4]
	ldrh r1, [r1, #0x34]
	and r1, r0, r1
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	bx lr
	.balign 4, 0
_0224170C: .word 0x027FFFA8
_02241710: .word ov13_0224F5E8
	arm_func_end ov13_022416D4

	arm_func_start ov13_02241714
ov13_02241714: ; 0x02241714
	ldr r1, _0224174C ; =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	movs r1, r1, asr #0xf
	movne r0, #0
	bxne lr
	ldr r1, _02241750 ; =ov13_0224F5E8
	ldr r1, [r1, #4]
	ldrh r1, [r1, #0x36]
	and r1, r0, r1
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	bx lr
	.balign 4, 0
_0224174C: .word 0x027FFFA8
_02241750: .word ov13_0224F5E8
	arm_func_end ov13_02241714

	arm_func_start ov13_02241754
ov13_02241754: ; 0x02241754
	ldr r1, _022417D4 ; =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	movs r1, r1, asr #0xf
	movne r0, #0
	bxne lr
	ldr r1, _022417D8 ; =ov13_0224F5E8
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	moveq r0, #0
	bxeq lr
	ldrh r2, [r3, #0x28]
	ldrh r1, [r0]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r1, [r0, #4]
	cmp r1, r2
	movlo r0, #0
	bxlo lr
	ldrh r2, [r3, #0x2a]
	ldrh r1, [r0, #2]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r0, [r0, #6]
	cmp r0, r2
	movhs r0, #1
	movlo r0, #0
	bx lr
	.balign 4, 0
_022417D4: .word 0x027FFFA8
_022417D8: .word ov13_0224F5E8
	arm_func_end ov13_02241754

	arm_func_start ov13_022417DC
ov13_022417DC: ; 0x022417DC
	ldr r1, _0224185C ; =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	movs r1, r1, asr #0xf
	movne r0, #0
	bxne lr
	ldr r1, _02241860 ; =ov13_0224F5E8
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	mov r1, r1, lsl #0x1e
	movs r1, r1, lsr #0x1f
	moveq r0, #0
	bxeq lr
	ldrh r2, [r3, #0x28]
	ldrh r1, [r0]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r1, [r0, #4]
	cmp r1, r2
	movlo r0, #0
	bxlo lr
	ldrh r2, [r3, #0x2a]
	ldrh r1, [r0, #2]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r0, [r0, #6]
	cmp r0, r2
	movhs r0, #1
	movlo r0, #0
	bx lr
	.balign 4, 0
_0224185C: .word 0x027FFFA8
_02241860: .word ov13_0224F5E8
	arm_func_end ov13_022417DC

	arm_func_start ov13_02241864
ov13_02241864: ; 0x02241864
	ldr r1, _022418E4 ; =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	movs r1, r1, asr #0xf
	movne r0, #0
	bxne lr
	ldr r1, _022418E8 ; =ov13_0224F5E8
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	mov r1, r1, lsl #0x1d
	movs r1, r1, lsr #0x1f
	moveq r0, #0
	bxeq lr
	ldrh r2, [r3, #0x28]
	ldrh r1, [r0]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r1, [r0, #4]
	cmp r1, r2
	movlo r0, #0
	bxlo lr
	ldrh r2, [r3, #0x2a]
	ldrh r1, [r0, #2]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r0, [r0, #6]
	cmp r0, r2
	movhs r0, #1
	movlo r0, #0
	bx lr
	.balign 4, 0
_022418E4: .word 0x027FFFA8
_022418E8: .word ov13_0224F5E8
	arm_func_end ov13_02241864

	arm_func_start ov13_022418EC
ov13_022418EC: ; 0x022418EC
	ldr r1, _0224196C ; =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	movs r1, r1, asr #0xf
	movne r0, #0
	bxne lr
	ldr r1, _02241970 ; =ov13_0224F5E8
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	mov r1, r1, lsl #0x1c
	movs r1, r1, lsr #0x1f
	moveq r0, #0
	bxeq lr
	ldrh r2, [r3, #0x28]
	ldrh r1, [r0]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r1, [r0, #4]
	cmp r1, r2
	movlo r0, #0
	bxlo lr
	ldrh r2, [r3, #0x2a]
	ldrh r1, [r0, #2]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r0, [r0, #6]
	cmp r0, r2
	movhs r0, #1
	movlo r0, #0
	bx lr
	.balign 4, 0
_0224196C: .word 0x027FFFA8
_02241970: .word ov13_0224F5E8
	arm_func_end ov13_022418EC

	arm_func_start ov13_02241974
ov13_02241974: ; 0x02241974
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _022419D8 ; =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	movs r1, r1, asr #0xf
	addne sp, sp, #8
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrh r1, [r0]
	strh r1, [sp]
	ldrh r1, [r0, #2]
	strh r1, [sp, #2]
	ldrh r2, [r0]
	ldrh r1, [r0, #4]
	add r1, r2, r1
	strh r1, [sp, #4]
	ldrh r2, [r0, #2]
	ldrh r1, [r0, #6]
	add r0, sp, #0
	add r1, r2, r1
	strh r1, [sp, #6]
	bl ov13_022417DC
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022419D8: .word 0x027FFFA8
	arm_func_end ov13_02241974

	arm_func_start ov13_022419DC
ov13_022419DC: ; 0x022419DC
	ldr r1, _02241A3C ; =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	movs r1, r1, asr #0xf
	movne r0, #0
	bxne lr
	ldr r1, _02241A40 ; =ov13_0224F5E8
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	bne _02241A24
	ldrh r2, [r3, #0x2c]
	ldrh r1, [r3, #0x2e]
	strh r2, [r0]
	strh r1, [r0, #2]
	mov r0, #0
	bx lr
_02241A24:
	ldrh r2, [r3, #0x28]
	ldrh r1, [r3, #0x2a]
	strh r2, [r0]
	strh r1, [r0, #2]
	mov r0, #1
	bx lr
	.balign 4, 0
_02241A3C: .word 0x027FFFA8
_02241A40: .word ov13_0224F5E8
	arm_func_end ov13_022419DC

	arm_func_start ov13_02241A44
ov13_02241A44: ; 0x02241A44
	stmdb sp!, {r3, lr}
	ldr r0, _02241AB8 ; =ov13_0224F5E8
	ldrb r0, [r0]
	cmp r0, #0
	ldr r0, _02241ABC ; =0x027FFFA8
	beq _02241A8C
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	ldmneia sp!, {r3, pc}
	mov r0, #1
	bl PM_SetLCDPower
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _02241AB8 ; =ov13_0224F5E8
	mov r1, #0
	strb r1, [r0]
	ldmia sp!, {r3, pc}
_02241A8C:
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl PM_SetLCDPower
	cmp r0, #0
	ldrne r0, _02241AB8 ; =ov13_0224F5E8
	movne r1, #1
	strneb r1, [r0]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02241AB8: .word ov13_0224F5E8
_02241ABC: .word 0x027FFFA8
	arm_func_end ov13_02241A44

	arm_func_start ov13_02241AC0
ov13_02241AC0: ; 0x02241AC0
	stmdb sp!, {r3, lr}
	ldr r0, _02241B20 ; =0x04000210
	ldr r1, _02241B24 ; =ov13_0224F600
	ldr r2, [r0]
	ldr r0, _02241B28 ; =0x00040018
	str r2, [r1, #4]
	bl OS_SetIrqMask
	mov r0, #1
	bl OS_EnableIrqMask
	mov r0, #1
	bl OS_GetIrqFunction
	ldr r2, _02241B24 ; =ov13_0224F600
	ldr r1, _02241B2C ; =ov13_02241B70
	str r0, [r2]
	mov r0, #1
	bl OS_SetIrqFunction
	mov r0, #1
	bl OS_ResetRequestIrqMask
	ldr r2, _02241B30 ; =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	bl OS_EnableInterrupts
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02241B20: .word 0x04000210
_02241B24: .word ov13_0224F600
_02241B28: .word 0x00040018
_02241B2C: .word ov13_02241B70
_02241B30: .word 0x04000208
	arm_func_end ov13_02241AC0

	arm_func_start ov13_02241B34
ov13_02241B34: ; 0x02241B34
	stmdb sp!, {r3, lr}
	ldr r2, _02241B68 ; =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	ldr r0, _02241B6C ; =ov13_0224F600
	strh r1, [r2]
	ldr r0, [r0, #4]
	bl OS_SetIrqMask
	ldr r1, _02241B6C ; =ov13_0224F600
	mov r0, #1
	ldr r1, [r1]
	bl OS_SetIrqFunction
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02241B68: .word 0x04000208
_02241B6C: .word ov13_0224F600
	arm_func_end ov13_02241B34

	arm_func_start ov13_02241B70
ov13_02241B70: ; 0x02241B70
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov13_02242478
	ldr r0, _02241B94 ; =0x027E0000
	add r0, r0, #0x3000
	ldr r1, [r0, #0xff8]
	orr r1, r1, #1
	str r1, [r0, #0xff8]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02241B94: .word 0x027E0000
	arm_func_end ov13_02241B70

	arm_func_start ov13_02241B98
ov13_02241B98: ; 0x02241B98
	stmdb sp!, {r3, lr}
	mov r0, #0x10
	mov r1, #4
	bl ov13_0224128C
	mov r2, #0
	str r2, [r0]
	add r1, r0, #8
	str r1, [r0, #4]
	str r0, [r0, #8]
	str r2, [r0, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02241B98

	arm_func_start ov13_02241BC4
ov13_02241BC4: ; 0x02241BC4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r0, sp, #8
	bl ov13_022412B0
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov13_02241BC4

	arm_func_start ov13_02241BE0
ov13_02241BE0: ; 0x02241BE0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	bl OS_DisableIrqMask
	ldmia r4, {r2, r3}
	str r3, [r2, #4]
	ldr r3, [r4]
	ldr r2, [r4, #4]
	mov r1, #0
	str r3, [r2]
	str r1, [r4, #4]
	str r1, [r4]
	bl OS_EnableIrqMask
	ldmia sp!, {r4, pc}
	arm_func_end ov13_02241BE0

	arm_func_start ov13_02241C18
ov13_02241C18: ; 0x02241C18
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	mov r4, r1
	bl OS_DisableIrqMask
	ldr r1, [r5]
	str r4, [r1, #4]
	ldr r1, [r5]
	stmia r4, {r1, r5}
	str r4, [r5]
	bl OS_EnableIrqMask
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov13_02241C18

	arm_func_start ov13_02241C48
ov13_02241C48: ; 0x02241C48
	ldr ip, _02241C54 ; =ov13_02241C18
	add r0, r0, #8
	bx ip
	.balign 4, 0
_02241C54: .word ov13_02241C18
	arm_func_end ov13_02241C48

	arm_func_start ov13_02241C58
ov13_02241C58: ; 0x02241C58
	ldr ip, _02241C64 ; =ov13_02241C18
	ldr r0, [r0, #4]
	bx ip
	.balign 4, 0
_02241C64: .word ov13_02241C18
	arm_func_end ov13_02241C58

	arm_func_start ov13_02241C68
ov13_02241C68: ; 0x02241C68
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _02241CF8 ; =0x0000080C
	mov r1, #4
	bl ov13_0224128C
	mov r1, r0
	ldr r3, _02241CFC ; =ov13_0224F608
	mov r0, #0x200
	mov r2, #0x800
	str r1, [r3]
	bl MIi_CpuClearFast
	mov r5, #0
	ldr r7, _02241CFC ; =ov13_0224F608
	mov r6, r5
	mov r4, #0x40
	mov r8, #8
_02241CA4:
	ldr r1, [r7]
	mov r0, r4
	mov r2, r8
	add r1, r1, r6
	bl ov13_0224022C
	ldr r1, [r7]
	add r6, r6, #0x400
	add r1, r1, r5, lsl #2
	add r5, r5, #1
	str r0, [r1, #0x800]
	cmp r5, #2
	blt _02241CA4
	ldr r1, _02241D00 ; =ov13_02241D04
	mov r0, #1
	mov r2, #0
	mov r3, #0xc8
	bl ov13_02242528
	ldr r1, _02241CFC ; =ov13_0224F608
	ldr r1, [r1]
	str r0, [r1, #0x808]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02241CF8: .word 0x0000080C
_02241CFC: .word ov13_0224F608
_02241D00: .word ov13_02241D04
	arm_func_end ov13_02241C68

	arm_func_start ov13_02241D04
ov13_02241D04: ; 0x02241D04
	stmdb sp!, {r3, lr}
	ldr r0, _02241D48 ; =ov13_0224F608
	mov r1, #0x800
	ldr r0, [r0]
	bl DC_FlushRange
	ldr r0, _02241D48 ; =ov13_0224F608
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x400
	bl GX_LoadOAM
	ldr r0, _02241D48 ; =ov13_0224F608
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x400
	add r0, r0, #0x400
	bl GXS_LoadOAM
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02241D48: .word ov13_0224F608
	arm_func_end ov13_02241D04

	arm_func_start ov13_02241D4C
ov13_02241D4C: ; 0x02241D4C
	stmdb sp!, {r3, lr}
	ldr r1, _02241D70 ; =ov13_0224F608
	mov r0, #1
	ldr r1, [r1]
	ldr r1, [r1, #0x808]
	bl ov13_022425F0
	ldr r0, _02241D74 ; =ov13_0224F608
	bl ov13_022412B0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02241D70: .word ov13_0224F608
_02241D74: .word ov13_0224F608
	arm_func_end ov13_02241D4C

	arm_func_start ov13_02241D78
ov13_02241D78: ; 0x02241D78
	ldr r1, _02241D90 ; =ov13_0224F608
	ldr ip, _02241D94 ; =ov13_022402E0
	ldr r1, [r1]
	add r0, r1, r0, lsl #2
	ldr r0, [r0, #0x800]
	bx ip
	.balign 4, 0
_02241D90: .word ov13_0224F608
_02241D94: .word ov13_022402E0
	arm_func_end ov13_02241D78

	arm_func_start ov13_02241D98
ov13_02241D98: ; 0x02241D98
	mov r1, r0
	ldr r3, [r1]
	ldr r0, _02241DD8 ; =0xC1FFFCFF
	ldr r2, _02241DDC ; =ov13_0224F608
	and r0, r3, r0
	orr r0, r0, #0x200
	str r0, [r1]
	ldr r3, [r2]
	mov r2, #0
	add r0, r3, #0x400
	cmp r1, r0
	movhs r2, #1
	add r0, r3, r2, lsl #2
	ldr ip, _02241DE0 ; =ov13_02240288
	ldr r0, [r0, #0x800]
	bx ip
	.balign 4, 0
_02241DD8: .word 0xC1FFFCFF
_02241DDC: .word ov13_0224F608
_02241DE0: .word ov13_02240288
	arm_func_end ov13_02241D98

	arm_func_start ov13_02241DE4
ov13_02241DE4: ; 0x02241DE4
	ldr r2, _02241DF8 ; =ov13_0224F608
	ldr r2, [r2]
	add r0, r2, r0, lsl #10
	add r0, r0, r1, lsl #3
	bx lr
	.balign 4, 0
_02241DF8: .word ov13_0224F608
	arm_func_end ov13_02241DE4

	arm_func_start ov13_02241DFC
ov13_02241DFC: ; 0x02241DFC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r0, #0x340
	mov r1, #4
	bl ov13_0224128C
	ldr r4, _02241EB8 ; =ov13_0224F60C
	mov sb, #0
	mov sl, sb
	str r0, [r4]
	mov r8, #0x20
	mov r7, #0xc
	mov r6, #0x300
	mov r5, #0x400
_02241E2C:
	ldr r1, [r4]
	mov r0, r8
	mov r2, r7
	add r1, r1, sl
	bl ov13_0224022C
	ldr r1, [r4]
	add r1, r1, sl
	str r0, [r1, #0x19c]
	bl ov13_02241B98
	ldr r1, [r4]
	add r1, r1, sl
	str r0, [r1, #0x198]
	ldr r0, [r4]
	add r0, r0, sl
	add r0, r0, #0x100
	strh r6, [r0, #0x88]
	ldr r0, [r4]
	add r0, r0, sl
	add r0, r0, #0x100
	strh r5, [r0, #0x94]
	ldr r0, [r4]
	add r1, r0, sl
	ldr r0, [r1, #0x198]
	add r1, r1, #0x180
	bl ov13_02241C58
	ldr r0, [r4]
	add r1, r0, sl
	ldr r0, [r1, #0x198]
	add r1, r1, #0x18c
	bl ov13_02241C48
	add sb, sb, #1
	cmp sb, #2
	add sl, sl, #0x1a0
	blt _02241E2C
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_02241EB8: .word ov13_0224F60C
	arm_func_end ov13_02241DFC

	arm_func_start ov13_02241EBC
ov13_02241EBC: ; 0x02241EBC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r5, r0
	mov r0, #0x1a0
	mul sb, r5, r0
	ldr r0, _02242030 ; =ov13_0224F60C
	mov r6, r1
	ldr r0, [r0]
	mov sl, r2
	add r0, r0, sb
	ldr r0, [r0, #0x19c]
	mov r4, r3
	bl ov13_022402E0
	add r1, r6, #3
	bic r1, r1, #3
	mov r6, r0
	mov r8, r1, asr #2
	mov r0, #1
	strh r8, [r6, #0xa]
	bl OS_DisableIrqMask
	mov r7, r0
	cmp sl, #0
	mov r0, #0x1a0
	beq _02241F98
	ldr r1, _02242030 ; =ov13_0224F60C
	ldr r1, [r1]
	mla r0, r5, r0, r1
	add r5, r0, #0x180
	add r0, r0, #0x18c
	cmp r5, r0
	beq _02241F78
	add r0, r1, sb
	add r1, r0, #0x18c
_02241F3C:
	ldr r0, [r5, #4]
	ldrh sl, [r5, #8]
	ldrh r3, [r5, #0xa]
	ldrh r2, [r0, #8]
	add sl, sl, r3
	add r3, sl, r8
	cmp r3, r2
	bgt _02241F6C
	mov r1, r6
	strh sl, [r6, #8]
	bl ov13_02241C18
	b _02241F78
_02241F6C:
	mov r5, r0
	cmp r0, r1
	bne _02241F3C
_02241F78:
	ldr r0, _02242030 ; =ov13_0224F60C
	ldr r0, [r0]
	add r0, r0, sb
	add r0, r0, #0x18c
	cmp r5, r0
	bne _02242018
	bl OS_Terminate
	b _02242018
_02241F98:
	ldr r1, _02242030 ; =ov13_0224F60C
	ldr r1, [r1]
	mla r0, r5, r0, r1
	add r5, r0, #0x18c
	add r0, r0, #0x180
	cmp r5, r0
	beq _02241FFC
	add r0, r1, sb
	add r0, r0, #0x180
_02241FBC:
	ldr sl, [r5]
	ldrh r3, [r5, #8]
	ldrh r2, [sl, #8]
	ldrh r1, [sl, #0xa]
	sub r3, r3, r8
	add r1, r2, r1
	cmp r3, r1
	blt _02241FF0
	mov r0, r5
	mov r1, r6
	strh r3, [r6, #8]
	bl ov13_02241C18
	b _02241FFC
_02241FF0:
	mov r5, sl
	cmp sl, r0
	bne _02241FBC
_02241FFC:
	ldr r0, _02242030 ; =ov13_0224F60C
	ldr r0, [r0]
	add r0, r0, sb
	add r0, r0, #0x180
	cmp r5, r0
	bne _02242018
	bl OS_Terminate
_02242018:
	ldrh r1, [r6, #8]
	mov r0, r7
	str r1, [r4]
	bl OS_EnableIrqMask
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_02242030: .word ov13_0224F60C
	arm_func_end ov13_02241EBC

	arm_func_start ov13_02242034
ov13_02242034: ; 0x02242034
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl ov13_02241BE0
	ldr r0, _02242070 ; =ov13_0224F60C
	ldr r1, [r0]
	add r0, r1, #0x1a0
	cmp r5, r0
	movhs r4, #1
	mov r0, #0x1a0
	mla r0, r4, r0, r1
	ldr r0, [r0, #0x19c]
	mov r1, r5
	bl ov13_02240288
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02242070: .word ov13_0224F60C
	arm_func_end ov13_02242034

	arm_func_start ov13_02242074
ov13_02242074: ; 0x02242074
	cmp r1, #0
	mov r3, #0
	ble _02242098
_02242080:
	ldrb r2, [r0, r3]
	cmp r2, #0
	beq _02242098
	add r3, r3, #1
	cmp r3, r1
	blt _02242080
_02242098:
	mov r0, r3
	bx lr
	arm_func_end ov13_02242074

	arm_func_start ov13_022420A0
ov13_022420A0: ; 0x022420A0
	stmdb sp!, {r3, lr}
	bl GX_DisableBankForBG
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1]
	bl GX_DisableBankForOBJ
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1, #4]
	bl GX_DisableBankForBGExtPltt
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1, #8]
	bl GX_DisableBankForOBJExtPltt
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1, #0xc]
	bl GX_DisableBankForTex
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1, #0x10]
	bl GX_DisableBankForTexPltt
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1, #0x14]
	bl GX_DisableBankForClearImage
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1, #0x18]
	bl GX_DisableBankForSubBG
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1, #0x1c]
	bl GX_DisableBankForSubOBJ
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1, #0x20]
	bl GX_DisableBankForSubBGExtPltt
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1, #0x24]
	bl GX_DisableBankForSubOBJExtPltt
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1, #0x28]
	bl GX_DisableBankForARM7
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1, #0x2c]
	bl GX_DisableBankForLCDC
	ldr r1, _02242150 ; =ov13_0224F610
	str r0, [r1, #0x30]
	ldr r0, [r1, #0x2c]
	bl GX_SetBankForARM7
	bl ov13_0224225C
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02242150: .word ov13_0224F610
	arm_func_end ov13_022420A0

	arm_func_start ov13_02242154
ov13_02242154: ; 0x02242154
	stmdb sp!, {r4, lr}
	bl GX_DisableBankForBG
	bl GX_DisableBankForOBJ
	bl GX_DisableBankForSubBG
	bl GX_DisableBankForSubOBJ
	bl ov13_0224225C
	ldr r0, _02242250 ; =ov13_0224F610
	ldr r0, [r0]
	bl GX_SetBankForBG
	ldr r0, _02242250 ; =ov13_0224F610
	ldr r0, [r0, #4]
	bl GX_SetBankForOBJ
	ldr r0, _02242250 ; =ov13_0224F610
	ldr r0, [r0, #8]
	bl GX_SetBankForBGExtPltt
	ldr r0, _02242250 ; =ov13_0224F610
	ldr r0, [r0, #0xc]
	bl GX_SetBankForOBJExtPltt
	ldr r0, _02242250 ; =ov13_0224F610
	ldr r0, [r0, #0x10]
	bl GX_SetBankForTex
	ldr r0, _02242250 ; =ov13_0224F610
	ldr r0, [r0, #0x14]
	bl GX_SetBankForTexPltt
	ldr r0, _02242250 ; =ov13_0224F610
	ldr r0, [r0, #0x18]
	bl GX_SetBankForClearImage
	ldr r0, _02242250 ; =ov13_0224F610
	ldr r0, [r0, #0x1c]
	bl GX_SetBankForSubBG
	ldr r0, _02242250 ; =ov13_0224F610
	ldr r0, [r0, #0x20]
	bl GX_SetBankForSubOBJ
	ldr r0, _02242250 ; =ov13_0224F610
	ldr r0, [r0, #0x24]
	bl GX_SetBankForSubBGExtPltt
	ldr r0, _02242250 ; =ov13_0224F610
	ldr r0, [r0, #0x28]
	bl GX_SetBankForSubOBJExtPltt
	ldr r0, _02242250 ; =ov13_0224F610
	ldr r0, [r0, #0x30]
	bl GX_SetBankForLCDC
	mov r3, #0
	ldr r2, _02242254 ; =0x04000050
	ldr r0, _02242258 ; =0x04001014
	strh r3, [r2]
	add r1, r2, #0x1000
	strh r3, [r1]
	str r3, [r2, #-0x40]
	str r3, [r2, #-0x3c]
	str r3, [r2, #-0x38]
	str r3, [r2, #-0x34]
	str r3, [r2, #0xfc0]
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	bl OS_DisableInterrupts
	mov r4, r0
	mov r0, #1
	bl PM_SetLCDPower
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02242250: .word ov13_0224F610
_02242254: .word 0x04000050
_02242258: .word 0x04001014
	arm_func_end ov13_02242154

	arm_func_start ov13_0224225C
ov13_0224225C: ; 0x0224225C
	stmdb sp!, {r3, lr}
	ldr r0, _022422D0 ; =0x000001F3
	bl GX_SetBankForLCDC
	mov r0, #0
	mov r1, #0x6800000
	mov r2, #0x40000
	bl MIi_CpuClearFast
	ldr r1, _022422D4 ; =0x06880000
	mov r0, #0
	mov r2, #0x24000
	bl MIi_CpuClearFast
	bl GX_DisableBankForLCDC
	mov r0, #0x200
	mov r1, #0x7000000
	mov r2, #0x400
	bl MIi_CpuClearFast
	mov r0, #0
	mov r1, #0x5000000
	mov r2, #0x400
	bl MIi_CpuClearFast
	mov r0, #0x200
	ldr r1, _022422D8 ; =0x07000400
	mov r2, #0x400
	bl MIi_CpuClearFast
	mov r0, #0
	ldr r1, _022422DC ; =0x05000400
	mov r2, #0x400
	bl MIi_CpuClearFast
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022422D0: .word 0x000001F3
_022422D4: .word 0x06880000
_022422D8: .word 0x07000400
_022422DC: .word 0x05000400
	arm_func_end ov13_0224225C

	arm_func_start ov13_022422E0
ov13_022422E0: ; 0x022422E0
	stmdb sp!, {r3, lr}
	add r0, sp, #0
	bl PM_GetLEDPattern
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, [sp]
	cmp r0, #0xf
	ldmeqia sp!, {r3, pc}
	mov r0, #0xf
	bl PMi_SendLEDPatternCommand
	ldmia sp!, {r3, pc}
	arm_func_end ov13_022422E0

	arm_func_start ov13_0224230C
ov13_0224230C: ; 0x0224230C
	ldr ip, _02242318 ; =PMi_SendLEDPatternCommand
	mov r0, #1
	bx ip
	.balign 4, 0
_02242318: .word PMi_SendLEDPatternCommand
	arm_func_end ov13_0224230C

	arm_func_start ov13_0224231C
ov13_0224231C: ; 0x0224231C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #0x80
	mov r1, #4
	bl ov13_0224128C
	mov r8, #0
	ldr r4, _02242428 ; =ov13_0224F644
	ldr sb, _0224242C ; =ov13_02245960
	mov sl, r8
	str r0, [r4]
	mov r7, r8
	mov r6, #0xff
	mov r5, #1
	mov fp, #0x14
_02242350:
	ldr r0, [r4]
	ldrb r2, [sb]
	add r0, r0, r8, lsl #6
	mov r1, #4
	str r2, [r0, #0x34]
	ldrb r2, [sb]
	mul r0, r2, fp
	bl ov13_0224128C
	ldr r1, [r4]
	mov r2, #0x14
	add r1, r1, r8, lsl #6
	str r0, [r1, #0x3c]
	ldr r1, [r4]
	ldrb r0, [sb]
	add r1, r1, r8, lsl #6
	ldr r1, [r1, #0x3c]
	bl ov13_0224022C
	ldr r1, [r4]
	str r0, [r1, r8, lsl #6]
	ldrb r0, [sb], #1
	bl ov13_022401F8
	ldr r1, [r4]
	add r1, r1, r8, lsl #6
	str r0, [r1, #4]
	bl ov13_02241B98
	ldr r1, [r4]
	add r1, r1, r8, lsl #6
	str r0, [r1, #8]
	ldr r0, [r4]
	add r0, r0, r8, lsl #6
	strb r7, [r0, #0x1c]
	ldr r0, [r4]
	add r0, r0, r8, lsl #6
	strb r6, [r0, #0x30]
	ldr r1, [r4]
	add r0, r1, r8, lsl #6
	add r1, r1, sl
	ldr r0, [r0, #8]
	add r1, r1, #0xc
	bl ov13_02241C58
	ldr r1, [r4]
	add r0, r1, r8, lsl #6
	add r1, r1, sl
	ldr r0, [r0, #8]
	add r1, r1, #0x20
	bl ov13_02241C48
	ldr r0, [r4]
	add sl, sl, #0x40
	add r0, r0, r8, lsl #6
	add r8, r8, #1
	strb r5, [r0, #0x38]
	cmp r8, #2
	blt _02242350
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02242428: .word ov13_0224F644
_0224242C: .word ov13_02245960
	arm_func_end ov13_0224231C

	arm_func_start ov13_02242430
ov13_02242430: ; 0x02242430
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _02242470 ; =ov13_0224F644
	mov r5, #0
_0224243C:
	ldr r0, [r4]
	add r0, r0, r5, lsl #6
	ldr r0, [r0, #8]
	bl ov13_02241BC4
	ldr r0, [r4]
	ldr r0, [r0, r5, lsl #6]
	bl ov13_0224026C
	add r5, r5, #1
	cmp r5, #2
	blt _0224243C
	ldr r0, _02242474 ; =ov13_0224F644
	bl ov13_022412B0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02242470: .word ov13_0224F644
_02242474: .word ov13_0224F644
	arm_func_end ov13_02242430

	arm_func_start ov13_02242478
ov13_02242478: ; 0x02242478
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _02242524 ; =ov13_0224F644
	mov r6, r0
	ldr r0, [r5]
	add r2, r0, r6, lsl #6
	ldrb r1, [r2, #0x38]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r4, [r2, #0x10]
	add r1, r2, #0x20
	cmp r4, r1
	beq _022424D0
_022424A8:
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #8]
	mov r0, r4
	blx r2
	ldr r0, [r5]
	ldr r4, [r4, #4]
	add r1, r0, r6, lsl #6
	add r1, r1, #0x20
	cmp r4, r1
	bne _022424A8
_022424D0:
	add r1, r0, r6, lsl #6
	ldr r1, [r1, #0x34]
	mov r4, r6, lsl #6
	mov r5, #0
	cmp r1, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r7, _02242524 ; =ov13_0224F644
_022424EC:
	add r0, r4, r0
	ldr r0, [r0, #4]
	bl ov13_022402E0
	movs r1, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl ov13_022425FC
	ldr r0, [r7]
	add r5, r5, #1
	add r1, r4, r0
	ldr r1, [r1, #0x34]
	cmp r5, r1
	blt _022424EC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02242524: .word ov13_0224F644
	arm_func_end ov13_02242478

	arm_func_start ov13_02242528
ov13_02242528: ; 0x02242528
	stmdb sp!, {r3, lr}
	mov ip, #0
	str ip, [sp]
	bl ov13_0224253C
	ldmia sp!, {r3, pc}
	arm_func_end ov13_02242528

	arm_func_start ov13_0224253C
ov13_0224253C: ; 0x0224253C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _022425C4 ; =ov13_0224F644
	mov r7, r0
	ldr r0, [r4]
	mov r8, r1
	ldr r0, [r0, r7, lsl #6]
	mov r5, r2
	mov r6, r3
	bl ov13_022402E0
	mov r4, r0
	str r8, [r4, #8]
	str r5, [r4, #0xc]
	ldrb r1, [sp, #0x18]
	strb r6, [r4, #0x10]
	mov r0, #1
	strb r1, [r4, #0x11]
	bl OS_DisableIrqMask
	ldr r1, _022425C4 ; =ov13_0224F644
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, r7, lsl #6
	ldr r0, [r0, #0x10]
_02242594:
	ldrb r1, [r0, #0x10]
	cmp r6, r1
	bhs _022425AC
	mov r1, r4
	bl ov13_02241C18
	b _022425B4
_022425AC:
	ldr r0, [r0, #4]
	b _02242594
_022425B4:
	mov r0, r5
	bl OS_EnableIrqMask
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_022425C4: .word ov13_0224F644
	arm_func_end ov13_0224253C

	arm_func_start ov13_022425C8
ov13_022425C8: ; 0x022425C8
	str r1, [r0, #8]
	bx lr
	arm_func_end ov13_022425C8

	arm_func_start ov13_022425D0
ov13_022425D0: ; 0x022425D0
	ldr r2, _022425E8 ; =ov13_0224F644
	ldr ip, _022425EC ; =ov13_02240288
	ldr r2, [r2]
	add r0, r2, r0, lsl #6
	ldr r0, [r0, #4]
	bx ip
	.balign 4, 0
_022425E8: .word ov13_0224F644
_022425EC: .word ov13_02240288
	arm_func_end ov13_022425D0

	arm_func_start ov13_022425F0
ov13_022425F0: ; 0x022425F0
	ldr ip, _022425F8 ; =ov13_022425FC
	bx ip
	.balign 4, 0
_022425F8: .word ov13_022425FC
	arm_func_end ov13_022425F0

	arm_func_start ov13_022425FC
ov13_022425FC: ; 0x022425FC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrb r1, [r4, #0x11]
	mov r5, r0
	cmp r1, #0
	beq _0224261C
	add r0, r4, #0xc
	bl ov13_022412B0
_0224261C:
	mov r0, r4
	bl ov13_02241BE0
	ldr r0, _0224263C ; =ov13_0224F644
	mov r1, r4
	ldr r0, [r0]
	ldr r0, [r0, r5, lsl #6]
	bl ov13_02240288
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224263C: .word ov13_0224F644
	arm_func_end ov13_022425FC

	arm_func_start ov13_02242640
ov13_02242640: ; 0x02242640
	ldr r2, _02242654 ; =ov13_0224F644
	ldr r2, [r2]
	add r0, r2, r0, lsl #6
	strb r1, [r0, #0x38]
	bx lr
	.balign 4, 0
_02242654: .word ov13_0224F644
	arm_func_end ov13_02242640

	.rodata

ov13_02244EB0:
	.byte 0x0E, 0x04, 0x05, 0x00, 0x00, 0x00, 0xA8, 0x00

ov13_02244EB8: ; 0x02244EB8
	.byte 0x78, 0x00, 0x10, 0x00

ov13_02244EBC: ; 0x02244EBC
	.byte 0x08, 0x00

ov13_02244EBE: ; 0x02244EBE
	.byte 0xAC, 0x00
	.byte 0x84, 0x00, 0xAC, 0x00

ov13_02244EC4: ; 0x02244EC4
	.byte 0x27, 0x1F, 0x25, 0x00, 0x27, 0x00, 0x23, 0x1D, 0x21, 0x00, 0x59, 0x00
	.byte 0x27, 0x21

ov13_02244ED2: ; 0x02244ED2
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00, 0x01

ov13_02244EE0: ; 0x02244EE0
	.byte 0x02, 0x01, 0x01, 0x02, 0x01, 0x01, 0x02, 0x00, 0x0D, 0x00, 0x3C, 0x00, 0xE6, 0x00, 0x5E, 0x00
	.byte 0x0D, 0x00, 0x28, 0x00, 0xE6, 0x00, 0x70, 0x00

ov13_02244EF8: ; 0x02244EF8
	.byte 0x80, 0x04, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00
	.byte 0x80, 0x02, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00
	.byte 0x80, 0x02, 0x00, 0x00

ov13_02244F14: ; 0x02244F14
	.byte 0x6B, 0x00

ov13_02244F16: ; 0x02244F16
	.byte 0x22, 0x00, 0x6C, 0x00, 0x22, 0x00, 0x7C, 0x00, 0x22, 0x00
	.byte 0x5D, 0x00, 0x22, 0x00, 0x5F, 0x00, 0x22, 0x00, 0x7D, 0x00, 0x22, 0x00, 0x50, 0x00, 0x22, 0x00

ov13_02244F30: ; 0x02244F30
	.byte 0x6A, 0x65, 0x66, 0x67, 0x69, 0x73, 0x6B, 0x00

ov13_02244F38: ; 0x02244F38
	.byte 0x0A, 0x0B, 0x04, 0x05, 0x02, 0x03, 0x0C, 0x0D
	.byte 0xE5, 0x00, 0x26, 0x00

ov13_02244F44: ; 0x02244F44
	.byte 0x18, 0x17, 0x16, 0x15, 0x5F, 0x5E, 0x5D, 0x5C

ov13_02244F4C: ; 0x02244F4C
	.byte 0x02, 0x03, 0x00, 0x00

ov13_02244F50: ; 0x02244F50
	.byte 0x04, 0x05, 0x00, 0x00

ov13_02244F54: ; 0x02244F54
	.byte 0x3C, 0x3D, 0x00, 0x00

ov13_02244F58: ; 0x02244F58
	.byte 0x82, 0x83, 0x00, 0x00

ov13_02244F5C: ; 0x02244F5C
	.byte 0x3A, 0x3B, 0x35, 0x39

ov13_02244F60: ; 0x02244F60
	.byte 0x1C, 0x00, 0x02, 0x00

ov13_02244F64: ; 0x02244F64
	.byte 0x78, 0x00, 0x12, 0x00

ov13_02244F68: ; 0x02244F68
	.byte 0x11, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x0C, 0x0C, 0x0C, 0x0B, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00

ov13_02244F7C: ; 0x02244F7C
	.byte 0x04, 0x00, 0xAA, 0x00
	.byte 0x84, 0x00, 0xAA, 0x00

ov13_02244F84: ; 0x02244F84
	.byte 0x04, 0x00, 0x67, 0x00

ov13_02244F88: ; 0x02244F88
	.byte 0x04, 0x00, 0x7D, 0x00

ov13_02244F8C: ; 0x02244F8C
	.byte 0x04, 0x00, 0x93, 0x00
	.byte 0xDC, 0x00, 0x51, 0x00

ov13_02244F94: ; 0x02244F94
	.byte 0x1B, 0x00, 0x12, 0x00

ov13_02244F98: ; 0x02244F98
	.byte 0x20, 0x00, 0x12, 0x00

ov13_02244F9C: ; 0x02244F9C
	.byte 0x28, 0x00, 0x12, 0x00
	.byte 0x20, 0x00, 0x12, 0x00

ov13_02244FA4: ; 0x02244FA4
	.byte 0x04, 0x00, 0x51, 0x00, 0x16, 0x00, 0x51, 0x00, 0x28, 0x00, 0x51, 0x00
	.byte 0x3A, 0x00, 0x51, 0x00, 0x4C, 0x00, 0x51, 0x00, 0x5E, 0x00, 0x51, 0x00, 0x70, 0x00, 0x51, 0x00
	.byte 0x82, 0x00, 0x51, 0x00, 0x94, 0x00, 0x51, 0x00, 0xA6, 0x00, 0x51, 0x00, 0xB8, 0x00, 0x51, 0x00
	.byte 0xCA, 0x00, 0x51, 0x00, 0x20, 0x00, 0x67, 0x00, 0x32, 0x00, 0x67, 0x00, 0x44, 0x00, 0x67, 0x00
	.byte 0x56, 0x00, 0x67, 0x00, 0x68, 0x00, 0x67, 0x00, 0x7A, 0x00, 0x67, 0x00, 0x8C, 0x00, 0x67, 0x00
	.byte 0x9E, 0x00, 0x67, 0x00, 0xB0, 0x00, 0x67, 0x00, 0xC2, 0x00, 0x67, 0x00, 0xD4, 0x00, 0x67, 0x00
	.byte 0xE6, 0x00, 0x67, 0x00, 0x25, 0x00, 0x7D, 0x00, 0x37, 0x00, 0x7D, 0x00, 0x49, 0x00, 0x7D, 0x00
	.byte 0x5B, 0x00, 0x7D, 0x00, 0x6D, 0x00, 0x7D, 0x00, 0x7F, 0x00, 0x7D, 0x00, 0x91, 0x00, 0x7D, 0x00
	.byte 0xA3, 0x00, 0x7D, 0x00, 0xB5, 0x00, 0x7D, 0x00, 0xC7, 0x00, 0x7D, 0x00, 0xD9, 0x00, 0x7D, 0x00
	.byte 0xEB, 0x00, 0x7D, 0x00, 0x2D, 0x00, 0x93, 0x00, 0x3F, 0x00, 0x93, 0x00, 0x51, 0x00, 0x93, 0x00
	.byte 0x63, 0x00, 0x93, 0x00, 0x75, 0x00, 0x93, 0x00, 0x87, 0x00, 0x93, 0x00, 0x99, 0x00, 0x93, 0x00
	.byte 0xAB, 0x00, 0x93, 0x00, 0xBD, 0x00, 0x93, 0x00, 0xCF, 0x00, 0x93, 0x00, 0xE1, 0x00, 0x93, 0x00

ov13_02245060: ; 0x02245060
	.byte 0x02, 0x00

ov13_02245062: ; 0x02245062
	.byte 0x4F, 0x00, 0x14, 0x00, 0x4F, 0x00, 0x26, 0x00, 0x4F, 0x00, 0x38, 0x00, 0x4F, 0x00
	.byte 0x4A, 0x00, 0x4F, 0x00, 0x5C, 0x00, 0x4F, 0x00, 0x6E, 0x00, 0x4F, 0x00, 0x80, 0x00, 0x4F, 0x00
	.byte 0x92, 0x00, 0x4F, 0x00, 0xA4, 0x00, 0x4F, 0x00, 0xB6, 0x00, 0x4F, 0x00, 0xC8, 0x00, 0x4F, 0x00
	.byte 0x1E, 0x00, 0x65, 0x00, 0x30, 0x00, 0x65, 0x00, 0x42, 0x00, 0x65, 0x00, 0x54, 0x00, 0x65, 0x00
	.byte 0x66, 0x00, 0x65, 0x00, 0x78, 0x00, 0x65, 0x00, 0x8A, 0x00, 0x65, 0x00, 0x9C, 0x00, 0x65, 0x00
	.byte 0xAE, 0x00, 0x65, 0x00, 0xC0, 0x00, 0x65, 0x00, 0xD2, 0x00, 0x65, 0x00, 0xE4, 0x00, 0x65, 0x00
	.byte 0x23, 0x00, 0x7B, 0x00, 0x35, 0x00, 0x7B, 0x00, 0x47, 0x00, 0x7B, 0x00, 0x59, 0x00, 0x7B, 0x00
	.byte 0x6B, 0x00, 0x7B, 0x00, 0x7D, 0x00, 0x7B, 0x00, 0x8F, 0x00, 0x7B, 0x00, 0xA1, 0x00, 0x7B, 0x00
	.byte 0xB3, 0x00, 0x7B, 0x00, 0xC5, 0x00, 0x7B, 0x00, 0xD7, 0x00, 0x7B, 0x00, 0xE9, 0x00, 0x7B, 0x00
	.byte 0x2B, 0x00, 0x91, 0x00, 0x3D, 0x00, 0x91, 0x00, 0x4F, 0x00, 0x91, 0x00, 0x61, 0x00, 0x91, 0x00
	.byte 0x73, 0x00, 0x91, 0x00, 0x85, 0x00, 0x91, 0x00, 0x97, 0x00, 0x91, 0x00, 0xA9, 0x00, 0x91, 0x00
	.byte 0xBB, 0x00, 0x91, 0x00, 0xCD, 0x00, 0x91, 0x00, 0xDF, 0x00, 0x91, 0x00, 0x02, 0x00, 0x65, 0x00
	.byte 0x02, 0x00, 0x7B, 0x00, 0x02, 0x00, 0x91, 0x00, 0xDA, 0x00, 0x4F, 0x00, 0x02, 0x00, 0xA8, 0x00
	.byte 0x82, 0x00, 0xA8, 0x00

ov13_02245134: ; 0x02245134
	.byte 0x32, 0x33, 0x01, 0x2F, 0x00, 0x33, 0x02, 0x0C, 0x01, 0x33, 0x03, 0x0D
	.byte 0x02, 0x33, 0x04, 0x0E, 0x03, 0x33, 0x05, 0x0F, 0x04, 0x33, 0x06, 0x10, 0x05, 0x34, 0x07, 0x11
	.byte 0x06, 0x34, 0x08, 0x12, 0x07, 0x34, 0x09, 0x13, 0x08, 0x34, 0x0A, 0x14, 0x09, 0x34, 0x0B, 0x15
	.byte 0x0A, 0x34, 0x32, 0x16, 0x2F, 0x01, 0x0D, 0x18, 0x0C, 0x02, 0x0E, 0x19, 0x0D, 0x03, 0x0F, 0x1A
	.byte 0x0E, 0x04, 0x10, 0x1B, 0x0F, 0x05, 0x11, 0x1C, 0x10, 0x06, 0x12, 0x1D, 0x11, 0x07, 0x13, 0x1E
	.byte 0x12, 0x08, 0x14, 0x1F, 0x13, 0x09, 0x15, 0x20, 0x14, 0x0A, 0x16, 0x21, 0x15, 0x0B, 0x17, 0x22
	.byte 0x16, 0x32, 0x2F, 0x23, 0x30, 0x0C, 0x19, 0x24, 0x18, 0x0D, 0x1A, 0x25, 0x19, 0x0E, 0x1B, 0x26
	.byte 0x1A, 0x0F, 0x1C, 0x27, 0x1B, 0x10, 0x1D, 0x28, 0x1C, 0x11, 0x1E, 0x29, 0x1D, 0x12, 0x1F, 0x2A
	.byte 0x1E, 0x13, 0x20, 0x2B, 0x1F, 0x14, 0x21, 0x2C, 0x20, 0x15, 0x22, 0x2D, 0x21, 0x16, 0x23, 0x2E
	.byte 0x22, 0x17, 0x30, 0x2E, 0x31, 0x18, 0x25, 0x33, 0x24, 0x19, 0x26, 0x33, 0x25, 0x1A, 0x27, 0x33
	.byte 0x26, 0x1B, 0x28, 0x33, 0x27, 0x1C, 0x29, 0x33, 0x28, 0x1D, 0x2A, 0x34, 0x29, 0x1E, 0x2B, 0x34
	.byte 0x2A, 0x1F, 0x2C, 0x34, 0x2B, 0x20, 0x2D, 0x34, 0x2C, 0x21, 0x2E, 0x34, 0x2D, 0xFF, 0x31, 0x34
	.byte 0x17, 0x00, 0x0C, 0x30, 0x23, 0x2F, 0x18, 0x31, 0x2E, 0x30, 0x24, 0x33, 0x0B, 0x34, 0x00, 0x17
	.byte 0x34, 0xFE, 0x34, 0xFC, 0x33, 0xFD, 0x33, 0xFB

ov13_02245208: ; 0x02245208
	.byte 0xFF, 0xFF, 0x20, 0x80, 0x00, 0x00, 0x00, 0x00

ov13_02245210: ; 0x02245210
	.byte 0x04, 0x05, 0x00, 0x00

ov13_02245214: ; 0x02245214
	.byte 0x37, 0x38, 0x00, 0x00

ov13_02245218: ; 0x02245218
	.byte 0x3C, 0x3D, 0x00, 0x00

ov13_0224521C: ; 0x0224521C
	.byte 0x02, 0x03, 0x00, 0x00

ov13_02245220: ; 0x02245220
	.byte 0x12, 0x13, 0x00, 0x00

ov13_02245224: ; 0x02245224
	.byte 0x10, 0x11, 0x00, 0x00

ov13_02245228: ; 0x02245228
	.byte 0x1C, 0x00, 0x14, 0x00, 0x0C, 0x00, 0x04, 0x00

ov13_02245230: ; 0x02245230
	.byte 0x1C, 0x00, 0x14, 0x00

ov13_02245234: ; 0x02245234
	.byte 0x78, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x03, 0x03, 0x03
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00

ov13_02245250: ; 0x02245250
	.byte 0x72, 0x00, 0x91, 0x00, 0x92, 0x00, 0x91, 0x00

ov13_02245258: ; 0x02245258
	.byte 0x04, 0x00, 0xAA, 0x00, 0x84, 0x00, 0xAA, 0x00

ov13_02245260: ; 0x02245260
	.byte 0x37, 0x00, 0x38, 0x00, 0x39, 0x00, 0x34, 0x00, 0x35, 0x00, 0x36, 0x00, 0x31, 0x00, 0x32, 0x00
	.byte 0x33, 0x00, 0x30, 0x00, 0x20, 0x00, 0x20, 0x00, 0x00, 0x00

ov13_0224527A: ; 0x0224527A
	.byte 0x52, 0x00, 0x4C, 0x00, 0x72, 0x00
	.byte 0x4C, 0x00, 0x92, 0x00, 0x4C, 0x00, 0x52, 0x00, 0x63, 0x00, 0x72, 0x00, 0x63, 0x00, 0x92, 0x00
	.byte 0x63, 0x00, 0x52, 0x00, 0x7A, 0x00, 0x72, 0x00, 0x7A, 0x00, 0x92, 0x00, 0x7A, 0x00, 0x52, 0x00
	.byte 0x91, 0x00

ov13_022452A2: ; 0x022452A2
	.byte 0x50, 0x00

ov13_022452A4: ; 0x022452A4
	.byte 0x4A, 0x00, 0x70, 0x00, 0x4A, 0x00, 0x90, 0x00, 0x4A, 0x00, 0x50, 0x00
	.byte 0x61, 0x00, 0x70, 0x00, 0x61, 0x00, 0x90, 0x00, 0x61, 0x00, 0x50, 0x00, 0x78, 0x00, 0x70, 0x00
	.byte 0x78, 0x00, 0x90, 0x00, 0x78, 0x00, 0x50, 0x00, 0x8F, 0x00, 0x70, 0x00, 0x8F, 0x00, 0x90, 0x00
	.byte 0x8F, 0x00, 0x02, 0x00, 0xA8, 0x00, 0x82, 0x00, 0xA8, 0x00

ov13_022452DA: ; 0x022452DA
	.byte 0x02, 0x0C, 0x01, 0x03, 0x00, 0x0D
	.byte 0x02, 0x04, 0x01, 0x0D, 0x00, 0x05, 0x05, 0x00, 0x04, 0x06, 0x03, 0x01, 0x05, 0x07, 0x04, 0x02
	.byte 0x03, 0x08, 0x08, 0x03, 0x07, 0x09, 0x06, 0x04, 0x08, 0x0A, 0x07, 0x05, 0x06, 0x0B, 0x0B, 0x06
	.byte 0x0A, 0x0C, 0x09, 0x07, 0x0B, 0x0D, 0x0A, 0x08, 0x09, 0x0D, 0x0D, 0x09, 0x0D, 0x00, 0x0C, 0xFF
	.byte 0x0C, 0xFE, 0x00, 0x00

ov13_02245314: ; 0x02245314
	.byte 0x37, 0x38, 0x39, 0x34, 0x35, 0x36, 0x31, 0x32, 0x33, 0x30, 0x00, 0x00

ov13_02245320: ; 0x02245320
	.byte 0x4E, 0x49, 0x4E, 0x54, 0x45, 0x4E, 0x44, 0x4F, 0x2D, 0x44, 0x53, 0x00

ov13_0224532C: ; 0x0224532C
	.byte 0x01, 0x02

ov13_0224532E: ; 0x0224532E
	.byte 0x08, 0x00
	.byte 0x20, 0x00, 0xAC, 0x00, 0xA0, 0x00, 0xB4, 0x00, 0x20, 0x00, 0xF8, 0x00, 0xA0, 0x00

ov13_0224533E: ; 0x0224533E
	.byte 0x06, 0x00

ov13_02245340: ; 0x02245340
	.byte 0x1E, 0x00

ov13_02245342: ; 0x02245342
	.byte 0x9E, 0x00

ov13_02245344: ; 0x02245344
	.byte 0x92, 0x00, 0xB2, 0x00, 0x1E, 0x00, 0xEA, 0x00, 0x92, 0x00

ov13_0224534E: ; 0x0224534E
	.byte 0x63, 0x68
	.byte 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x31, 0x31, 0x2E, 0x6E, 0x63
	.byte 0x6C, 0x2E, 0x6C, 0x00

ov13_02245364: ; 0x02245364
	.byte 0x01, 0x02, 0x03, 0x00, 0xE0, 0x00, 0x84, 0x00

ov13_0224536C: ; 0x0224536C
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x42, 0x67, 0x4F, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x2E, 0x6E, 0x63, 0x6C, 0x2E
	.byte 0x6C, 0x00

ov13_02245382: ; 0x02245382
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x4F, 0x70, 0x74, 0x69, 0x6F
	.byte 0x6E, 0x31, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00

ov13_0224539A: ; 0x0224539A
	.byte 0x08, 0x00, 0x24, 0x00, 0xF8, 0x00
	.byte 0x44, 0x00, 0x08, 0x00, 0x50, 0x00, 0xF8, 0x00, 0x70, 0x00, 0x08, 0x00, 0x7C, 0x00, 0xF8, 0x00
	.byte 0x9C, 0x00

ov13_022453B2: ; 0x022453B2
	.byte 0x06, 0x00

ov13_022453B4: ; 0x022453B4
	.byte 0x22, 0x00

ov13_022453B6: ; 0x022453B6
	.byte 0xEA, 0x00

ov13_022453B8: ; 0x022453B8
	.byte 0x36, 0x00, 0x06, 0x00, 0x4E, 0x00, 0xEA, 0x00
	.byte 0x62, 0x00, 0x06, 0x00, 0x7A, 0x00, 0xEA, 0x00, 0x8E, 0x00, 0x00, 0x00

ov13_022453CC: ; 0x022453CC
	.byte 0x02

ov13_022453CD: ; 0x022453CD
	.byte 0x63, 0x68, 0x61
	.byte 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x31, 0x2E, 0x6E, 0x63, 0x6C
	.byte 0x2E, 0x6C, 0x00

ov13_022453E3: ; 0x022453E3
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x41, 0x70, 0x4C, 0x69, 0x73
	.byte 0x74, 0x42, 0x61, 0x63, 0x6B, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_022453FC: ; 0x022453FC
	.byte 0x07, 0x00, 0x32, 0x00
	.byte 0xD0, 0x00, 0x4C, 0x00, 0x07, 0x00, 0x4E, 0x00, 0xD0, 0x00, 0x68, 0x00, 0x07, 0x00, 0x6A, 0x00
	.byte 0xD0, 0x00, 0x84, 0x00, 0x07, 0x00, 0x86, 0x00, 0xD0, 0x00, 0xA0, 0x00, 0x85, 0x00, 0x1B, 0x00
	.byte 0xFD, 0x00, 0x2C, 0x00

ov13_02245424: ; 0x02245424
	.byte 0x04, 0x00

ov13_02245426: ; 0x02245426
	.byte 0x2E, 0x00

ov13_02245428: ; 0x02245428
	.byte 0xDB, 0x00, 0x3F, 0x00, 0x04, 0x00, 0x4A, 0x00
	.byte 0xDB, 0x00, 0x5B, 0x00, 0x04, 0x00, 0x66, 0x00, 0xDB, 0x00, 0x77, 0x00, 0x04, 0x00, 0x82, 0x00
	.byte 0xDB, 0x00, 0x93, 0x00, 0x82, 0x00, 0x18, 0x00, 0xF0, 0x00, 0x2C, 0x00

ov13_0224544C: ; 0x0224544C
	.byte 0x2E, 0x2D, 0x33, 0x00

ov13_02245450: ; 0x02245450
	.byte 0x18, 0x17, 0x16, 0x15

ov13_02245454: ; 0x02245454
	.byte 0x3E, 0x3D, 0x0E, 0x00, 0x10, 0x00, 0x00, 0x00, 0x47, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0x2C, 0xA0, 0x23, 0x02, 0x5C, 0xA0, 0x23, 0x02

ov13_0224546C: ; 0x0224546C
	.byte 0x20, 0x31, 0x00, 0x00

ov13_02245470: ; 0x02245470
	.byte 0x08, 0x17, 0x26, 0x35, 0x44, 0x53, 0x62, 0x71, 0x80, 0x8F, 0x9E, 0xAD, 0xBC, 0xCB, 0xDA, 0xE9

ov13_02245480: ; 0x02245480
	.byte 0x32, 0x35, 0x35, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x3F, 0x40, 0x41, 0x42, 0x43, 0x00, 0x00, 0x00
	.byte 0x29, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov13_02245498: ; 0x02245498
	.byte 0xB0, 0xA2, 0x23, 0x02, 0xF0, 0xA2, 0x23, 0x02
	.byte 0x30, 0xA3, 0x23, 0x02, 0x74, 0xA3, 0x23, 0x02, 0xB8, 0xA3, 0x23, 0x02

ov13_022454AC: ; 0x022454AC
	.byte 0xF4, 0xA1, 0x23, 0x02
	.byte 0x10, 0xA2, 0x23, 0x02, 0x2C, 0xA2, 0x23, 0x02, 0x4C, 0xA2, 0x23, 0x02, 0x6C, 0xA2, 0x23, 0x02

ov13_022454C0: ; 0x022454C0
	.byte 0x31, 0x3D, 0x49, 0x5A, 0x66, 0x72, 0x83, 0x8F, 0x9B, 0xAC, 0xB8, 0xC4

ov13_022454CC: ; 0x022454CC
	.byte 0x00, 0x01, 0x01, 0x01
	.byte 0x01, 0x01, 0x00, 0x00, 0x0D, 0x00, 0x3C, 0x00, 0xE6, 0x00, 0x5E, 0x00

ov13_022454DC: ; 0x022454DC
	.byte 0x62, 0x00

ov13_022454DE: ; 0x022454DE
	.byte 0x22, 0x00
	.byte 0x62, 0x00, 0x22, 0x00, 0x3D, 0x00, 0x22, 0x00, 0x65, 0x00, 0x22, 0x00, 0x6C, 0x00, 0x22, 0x00
	.byte 0x34, 0x00, 0x22, 0x00, 0x4E, 0x00, 0x22, 0x00

ov13_022454F8: ; 0x022454F8
	.byte 0x06, 0x08, 0x07, 0x00

ov13_022454FC: ; 0x022454FC
	.byte 0x02, 0x03, 0x07, 0x08
	.byte 0xCC, 0x00, 0x34, 0x00, 0x1C, 0x00, 0x18, 0x00, 0x8F, 0x00, 0x34, 0x00, 0x2C, 0x00, 0x18, 0x00
	.byte 0xC0, 0x00, 0x34, 0x00, 0x2C, 0x00, 0x18, 0x00

ov13_02245518: ; 0x02245518
	.byte 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x01
	.byte 0x02, 0x00, 0x00, 0x03, 0x04, 0x05

ov13_02245526: ; 0x02245526
	.byte 0x00, 0x29, 0x2C, 0x52, 0x53, 0x30, 0x00, 0x2A, 0x30, 0x54
	.byte 0x55, 0x00, 0x00, 0x2B, 0x00, 0x00

ov13_02245536: ; 0x02245536
	.byte 0x00, 0x00, 0x60, 0x00, 0xE0, 0x00, 0x40, 0x01, 0xC0, 0x01
	.byte 0x40, 0x02, 0xA0, 0x02, 0x20, 0x03, 0xA0, 0x03

ov13_02245548: ; 0x02245548
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00

ov13_0224555D: ; 0x0224555D
	.byte 0x63, 0x68, 0x61
	.byte 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x31, 0x2E, 0x6E, 0x63, 0x6C
	.byte 0x2E, 0x6C, 0x00

ov13_02245573: ; 0x02245573
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x33, 0x4C, 0x69, 0x73, 0x74, 0x42
	.byte 0x61, 0x63, 0x6B, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_0224558A: ; 0x0224558A
	.byte 0x84, 0x00, 0x1B, 0x00, 0xFC, 0x00
	.byte 0x2C, 0x00, 0x84, 0x00, 0xAC, 0x00, 0xFC, 0x00, 0xBD, 0x00, 0x04, 0x00, 0xAC, 0x00, 0x7C, 0x00
	.byte 0xBD, 0x00

ov13_022455A2: ; 0x022455A2
	.byte 0xC8, 0x00

ov13_022455A4: ; 0x022455A4
	.byte 0x31, 0x00

ov13_022455A6: ; 0x022455A6
	.byte 0xE0, 0x00, 0x4D, 0x00, 0xBC, 0x00, 0x31, 0x00, 0xE0, 0x00
	.byte 0x4D, 0x00, 0x8B, 0x00, 0x31, 0x00, 0xAF, 0x00, 0x4D, 0x00, 0x82, 0x00, 0x18, 0x00, 0xEE, 0x00
	.byte 0x2C, 0x00, 0x82, 0x00, 0xA9, 0x00, 0xEE, 0x00, 0xBD, 0x00, 0x02, 0x00, 0xA9, 0x00, 0x6E, 0x00
	.byte 0xBD, 0x00, 0x00, 0x00

ov13_022455D4: ; 0x022455D4
	.byte 0xFF, 0x23, 0x27, 0xFF, 0x23, 0x2F, 0xFF, 0x00

ov13_022455DC: ; 0x022455DC
	.byte 0x00, 0x01, 0x0E, 0x04
	.byte 0x05, 0x06, 0x0E, 0x09, 0x0A, 0x00, 0x00, 0x00

ov13_022455E8: ; 0x022455E8
	.byte 0x00, 0x05, 0x02, 0x07, 0x04, 0x01, 0x06, 0x03
	.byte 0x00, 0x00, 0x00, 0x00

ov13_022455F4: ; 0x022455F4
	.byte 0x00, 0x01, 0x02, 0x02, 0x03, 0x04, 0x05, 0x06, 0x06, 0x07, 0x08, 0x00

ov13_02245600: ; 0x02245600
	.byte 0x13, 0x14, 0x12, 0x56

ov13_02245604: ; 0x02245604
	.byte 0x03, 0x04, 0x05, 0x07, 0x0A, 0x09, 0x0B, 0x06

ov13_0224560C: ; 0x0224560C
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x31, 0x31, 0x2E, 0x6E, 0x63, 0x6C, 0x2E
	.byte 0x6C, 0x00

ov13_02245622: ; 0x02245622
	.byte 0x08, 0x00

ov13_02245624: ; 0x02245624
	.byte 0x30, 0x00, 0x5A, 0x00, 0x30, 0x00, 0xAC, 0x00, 0x30, 0x00, 0x0C, 0x00
	.byte 0x58, 0x00, 0x5E, 0x00, 0x58, 0x00, 0xB0, 0x00, 0x58, 0x00

ov13_0224563A: ; 0x0224563A
	.byte 0x08, 0x00, 0x20, 0x00, 0x54, 0x00
	.byte 0x56, 0x00, 0x5A, 0x00, 0x20, 0x00, 0xA6, 0x00, 0x56, 0x00, 0xAC, 0x00, 0x20, 0x00, 0xF8, 0x00
	.byte 0x56, 0x00, 0x08, 0x00, 0x78, 0x00, 0xF8, 0x00, 0xA0, 0x00, 0x08, 0x00, 0x54, 0x00, 0x54, 0x00
	.byte 0x70, 0x00, 0x5A, 0x00, 0x54, 0x00, 0xA6, 0x00, 0x70, 0x00, 0xAC, 0x00, 0x54, 0x00, 0xF8, 0x00
	.byte 0x70, 0x00

ov13_02245672: ; 0x02245672
	.byte 0x06, 0x00

ov13_02245674: ; 0x02245674
	.byte 0x1E, 0x00

ov13_02245676: ; 0x02245676
	.byte 0x46, 0x00

ov13_02245678: ; 0x02245678
	.byte 0x48, 0x00, 0x58, 0x00, 0x1E, 0x00, 0x98, 0x00
	.byte 0x48, 0x00, 0xAA, 0x00, 0x1E, 0x00, 0xEA, 0x00, 0x48, 0x00, 0x06, 0x00, 0x76, 0x00, 0xEA, 0x00
	.byte 0x92, 0x00, 0x09, 0x00, 0x54, 0x00, 0x43, 0x00, 0x70, 0x00, 0x5B, 0x00, 0x54, 0x00, 0x95, 0x00
	.byte 0x70, 0x00, 0xAD, 0x00, 0x54, 0x00, 0xE7, 0x00, 0x70, 0x00, 0x00, 0x00

ov13_022456AC: ; 0x022456AC
	.byte 0x03, 0x2D, 0x27, 0x1D
	.byte 0x32, 0x30, 0x06, 0x00

ov13_022456B4: ; 0x022456B4
	.byte 0x01, 0x02, 0x03, 0x04

ov13_022456B8: ; 0x022456B8
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x31, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00

ov13_022456CE: ; 0x022456CE
	.byte 0xFF, 0xFE
	.byte 0xFF, 0xFE, 0x03, 0x00, 0x03, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x01, 0x00, 0xFF, 0xFE
	.byte 0xFF, 0xFE, 0x03, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x02, 0x00, 0x01, 0x00

ov13_022456EE: ; 0x022456EE
	.byte 0x08, 0x00
	.byte 0x20, 0x00, 0xF8, 0x00, 0x5C, 0x00, 0x08, 0x00, 0x64, 0x00, 0x7E, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x83, 0x00, 0x64, 0x00, 0xF8, 0x00, 0xA0, 0x00, 0x08, 0x00
	.byte 0x20, 0x00, 0xF8, 0x00, 0x5C, 0x00, 0x08, 0x00, 0x64, 0x00, 0x64, 0x00, 0xA0, 0x00, 0x68, 0x00
	.byte 0x64, 0x00, 0xC4, 0x00, 0xA0, 0x00, 0xC8, 0x00, 0x64, 0x00, 0xF8, 0x00, 0xA0, 0x00

ov13_0224572E: ; 0x0224572E
	.byte 0x06, 0x00

ov13_02245730: ; 0x02245730
	.byte 0x1E, 0x00

ov13_02245732: ; 0x02245732
	.byte 0xEA, 0x00

ov13_02245734: ; 0x02245734
	.byte 0x4E, 0x00, 0x06, 0x00, 0x62, 0x00, 0x70, 0x00, 0x92, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x62, 0x00, 0xEA, 0x00, 0x92, 0x00, 0x06, 0x00
	.byte 0x1E, 0x00, 0xEA, 0x00, 0x4E, 0x00, 0x06, 0x00, 0x62, 0x00, 0x56, 0x00, 0x92, 0x00, 0x66, 0x00
	.byte 0x62, 0x00, 0xB6, 0x00, 0x92, 0x00, 0xC6, 0x00, 0x62, 0x00, 0xEA, 0x00, 0x92, 0x00, 0x00, 0x00

ov13_02245770: ; 0x02245770
	.byte 0x03, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x06, 0x00

ov13_02245778: ; 0x02245778
	.byte 0xA8, 0x81, 0x23, 0x02, 0xBC, 0x81, 0x23, 0x02
	.byte 0x03, 0x01, 0x00, 0x00

ov13_02245784: ; 0x02245784
	.byte 0x2B, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00

ov13_02245790: ; 0x02245790
	.byte 0x10, 0x0F, 0x0E, 0x00

ov13_02245794: ; 0x02245794
	.byte 0x55, 0x36, 0x1E, 0x00

ov13_02245798: ; 0x02245798
	.byte 0x00, 0x50, 0xF2, 0x01

ov13_0224579C: ; 0x0224579C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov13_022457A4: ; 0x022457A4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0xFF, 0x3F, 0x00, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov13_022457E8: ; 0x022457E8
	.byte 0x00, 0x00, 0x00, 0x00

ov13_022457EC: ; 0x022457EC
	.byte 0x01, 0x00, 0x05, 0x00
	.byte 0x06, 0x04, 0x00, 0x02, 0x00, 0x06, 0x04, 0x00, 0x05, 0x00, 0x03

ov13_022457FB: ; 0x022457FB
	.byte 0x02, 0x01, 0x03, 0x01, 0x03
	.byte 0x05, 0x01, 0x04, 0x01, 0x05, 0x07, 0x01, 0x07, 0x01, 0x06

ov13_0224580A: ; 0x0224580A
	.byte 0x20, 0x00, 0x21, 0x00, 0x50, 0x00
	.byte 0x30, 0x00, 0x68, 0x00, 0x21, 0x00, 0x98, 0x00, 0x30, 0x00, 0xB0, 0x00, 0x21, 0x00, 0x00, 0x00

ov13_02245820: ; 0x02245820
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov13_02245828: ; 0x02245828
	.byte 0x4E, 0x57, 0x43, 0x55, 0x53, 0x42, 0x41, 0x50
	.byte 0x00, 0x00, 0x00, 0x00

ov13_02245834: ; 0x02245834
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0xFF, 0x3F, 0x00, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov13_02245878: ; 0x02245878
	.byte 0x08, 0x00, 0x08, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01

ov13_02245882: ; 0x02245882
	.byte 0x04, 0x00, 0x1D, 0x00, 0xFC, 0x00, 0x44, 0x00

ov13_0224588A: ; 0x0224588A
	.byte 0x00, 0x01, 0x01, 0x00, 0x00, 0x01
	.byte 0x01, 0x00, 0x00, 0x01

ov13_02245894: ; 0x02245894
	.byte 0x01

ov13_02245895: ; 0x02245895
	.byte 0x00, 0x00, 0xFF, 0x01, 0x00, 0x00, 0xFF, 0x01, 0x00

ov13_0224589E: ; 0x0224589E
	.byte 0x1B, 0x19
	.byte 0x57, 0x00, 0x23, 0x1D, 0x59, 0x00, 0x23, 0x1D

ov13_022458A8: ; 0x022458A8
	.byte 0x6C, 0x00, 0x10, 0x00, 0x6C, 0x00, 0x10, 0x00
	.byte 0x78, 0x00, 0x10, 0x00, 0x78, 0x00, 0x10, 0x00, 0x78, 0x00, 0x10, 0x00

ov13_022458BC: ; 0x022458BC
	.byte 0xD8, 0x00

ov13_022458BE: ; 0x022458BE
	.byte 0x50, 0x00
	.byte 0xD8, 0x00, 0x50, 0x00, 0xE6, 0x00, 0x4F, 0x00, 0xE6, 0x00, 0x4F, 0x00, 0xE6, 0x00, 0x48, 0x00
	.byte 0xDA, 0x00, 0x5C, 0x00

ov13_022458D4: ; 0x022458D4
	.byte 0x0B, 0x00

ov13_022458D6: ; 0x022458D6
	.byte 0x27, 0x00, 0x0B, 0x00, 0x27, 0x00, 0x04, 0x00, 0x4C, 0x00
	.byte 0x04, 0x00, 0x4C, 0x00, 0x04, 0x00, 0x54, 0x00, 0x0B, 0x00, 0x27, 0x00

ov13_022458EC: ; 0x022458EC
	.byte 0xEA, 0x00

ov13_022458EE: ; 0x022458EE
	.byte 0x72, 0x00
	.byte 0xEA, 0x00, 0x72, 0x00, 0xF8, 0x00, 0x70, 0x00, 0xF8, 0x00, 0x70, 0x00, 0x64, 0x00, 0x70, 0x00
	.byte 0xEA, 0x00, 0x72, 0x00

ov13_02245904: ; 0x02245904
	.byte 0x10, 0x00

ov13_02245906: ; 0x02245906
	.byte 0x84, 0x00, 0x84, 0x00, 0x84, 0x00, 0x10, 0x00, 0x84, 0x00
	.byte 0x84, 0x00, 0x84, 0x00, 0x09, 0x00, 0xA7, 0x00, 0x83, 0x00, 0xA7, 0x00, 0x09, 0x00, 0xA7, 0x00
	.byte 0x83, 0x00, 0xA7, 0x00, 0x09, 0x00, 0xA7, 0x00, 0x83, 0x00, 0xA7, 0x00

ov13_0224592C: ; 0x0224592C
	.byte 0x00, 0x00, 0x46, 0x46
	.byte 0x4F, 0x2F, 0x00, 0x00

ov13_02245934: ; 0x02245934
	.byte 0x02, 0x01, 0x02, 0x01, 0x02, 0x00, 0x00, 0x00

	.balign 4, 0
ov13_0224593C: ; 0x0224593C
	.byte 0x64, 0x77, 0x63, 0x00

	.balign 4, 0
ov13_02245940: ; 0x02245940
	.byte 0x00, 0xF0, 0x00, 0x10, 0x11, 0x10, 0x01, 0x00, 0xF0, 0x00, 0x10, 0x00

ov13_0224594C: ; 0x0224594C
	.byte 0x00, 0x00, 0x80, 0x01

ov13_02245950: ; 0x02245950
	.byte 0x20, 0x00

ov13_02245952: ; 0x02245952
	.byte 0x18, 0x00, 0x20, 0x00, 0x0C, 0x00

ov13_02245958: ; 0x02245958
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xC0, 0x00

ov13_02245960: ; 0x02245960
	.byte 0x80, 0x20, 0x00, 0x00

	.data

	.balign 4, 0
ov13_02245B20: ; 0x02245B20
	.asciz "char/jtNull.nsc.l"
	.balign 4, 0
ov13_02245B34:
	.asciz "char/jb2HlAp.nsc.l"
	.balign 4, 0
ov13_02245B48:
	.asciz "char/jb4HlIp.nsc.l"
	.balign 4, 0
ov13_02245B5C:
	.asciz "char/jb4HlWep.nsc.l"
	.balign 4, 0
ov13_02245B70:
	.asciz "char/jb4HlUsb.nsc.l"
	.balign 4, 0
ov13_02245B84:
	.asciz "char/jb4HlDns1.nsc.l"
	.balign 4, 0
ov13_02245B9C:
	.asciz "char/jb4HlSsid.nsc.l"
	.balign 4, 0
ov13_02245BB4:
	.asciz "char/jb5HlMove.nsc.l"
	.balign 4, 0
ov13_02245BCC:
	.asciz "char/jb2HlWiFi.nsc.l"
	.balign 4, 0
ov13_02245BE4:
	.asciz "char/jb5HlInfo.nsc.l"
	.balign 4, 0
ov13_02245BFC:
	.asciz "char/jb4HlMask.nsc.l"
	.balign 4, 0
ov13_02245C14:
	.asciz "char/jb4HlSet2.nsc.l"
	.balign 4, 0
ov13_02245C2C:
	.asciz "char/jb4HlDns0.nsc.l"
	.balign 4, 0
ov13_02245C44:
	.asciz "char/jb4HlSet3.nsc.l"
	.balign 4, 0
ov13_02245C5C:
	.asciz "char/jb4HlSet1.nsc.l"
	.balign 4, 0
ov13_02245C74:
	.asciz "char/jb3HlList1.nsc.l"
	.balign 4, 0
ov13_02245C8C:
	.asciz "char/jb3HlList2.nsc.l"
	.balign 4, 0
ov13_02245CA4:
	.asciz "char/jb3HlList3.nsc.l"
	.balign 4, 0
ov13_02245CBC:
	.asciz "char/jb5HlErase.nsc.l"
	.balign 4, 0
ov13_02245CD4:
	.asciz "char/jb5HlOption.nsc.l"
	.balign 4, 0
ov13_02245CEC:
	.asciz "char/jb4HlGateway.nsc.l"
	.balign 4, 0
ov13_02245D04: ; 0x02245D04
	.word ov13_02245BCC
	.word ov13_02245B34
	.word ov13_02245C74
	.word ov13_02245C8C
	.word ov13_02245CA4
	.word ov13_02245C5C
	.word ov13_02245C14
	.word ov13_02245C44
	.word ov13_02245B70
	.word ov13_02245B9C
	.word ov13_02245B5C
	.word ov13_02245B48
	.word ov13_02245BFC
	.word ov13_02245CEC
	.word ov13_02245C2C
	.word ov13_02245B84
	.word ov13_02245CD4
	.word ov13_02245BE4
	.word ov13_02245CBC
	.word ov13_02245BB4

	.balign 4, 0
ov13_02245D54: ; 0x02245D54
	.asciz "char/jbBgHl.ncg.l"

	.balign 4, 0
ov13_02245D68: ; 0x02245D68
	.word ov13_02245F18
	.word ov13_02245EB8
	.word ov13_02245EE8

ov13_02245D74: ; 0x02245D74
	.word ov13_02245D90
	.word ov13_02245DF2
	.word ov13_02245E54

ov13_02245D80: ; 0x02245D80
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov13_02245D90:
	.byte 0x31, 0x00, 0x32, 0x00, 0x33, 0x00, 0x34, 0x00, 0x35, 0x00, 0x36, 0x00, 0x37, 0x00, 0x38, 0x00
	.byte 0x39, 0x00, 0x30, 0x00, 0x2D, 0x00, 0x3D, 0x00, 0x71, 0x00, 0x77, 0x00, 0x65, 0x00, 0x72, 0x00
	.byte 0x74, 0x00, 0x79, 0x00, 0x75, 0x00, 0x69, 0x00, 0x6F, 0x00, 0x70, 0x00, 0x5B, 0x00, 0x5D, 0x00
	.byte 0x61, 0x00, 0x73, 0x00, 0x64, 0x00, 0x66, 0x00, 0x67, 0x00, 0x68, 0x00, 0x6A, 0x00, 0x6B, 0x00
	.byte 0x6C, 0x00, 0x3B, 0x00, 0x27, 0x00, 0x60, 0x00, 0x7A, 0x00, 0x78, 0x00, 0x63, 0x00, 0x76, 0x00
	.byte 0x62, 0x00, 0x6E, 0x00, 0x6D, 0x00, 0x2C, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x5C, 0x00, 0x20, 0x00
	.byte 0x00, 0x00

ov13_02245DF2:
	.byte 0x21, 0x00, 0x40, 0x00, 0x23, 0x00, 0x24, 0x00, 0x25, 0x00, 0x5E, 0x00, 0x26, 0x00
	.byte 0x2A, 0x00, 0x28, 0x00, 0x29, 0x00, 0x5F, 0x00, 0x2B, 0x00, 0x51, 0x00, 0x57, 0x00, 0x45, 0x00
	.byte 0x52, 0x00, 0x54, 0x00, 0x59, 0x00, 0x55, 0x00, 0x49, 0x00, 0x4F, 0x00, 0x50, 0x00, 0x7B, 0x00
	.byte 0x7D, 0x00, 0x41, 0x00, 0x53, 0x00, 0x44, 0x00, 0x46, 0x00, 0x47, 0x00, 0x48, 0x00, 0x4A, 0x00
	.byte 0x4B, 0x00, 0x4C, 0x00, 0x3A, 0x00, 0x22, 0x00, 0x7E, 0x00, 0x5A, 0x00, 0x58, 0x00, 0x43, 0x00
	.byte 0x56, 0x00, 0x42, 0x00, 0x4E, 0x00, 0x4D, 0x00, 0x3C, 0x00, 0x3E, 0x00, 0x3F, 0x00, 0x7C, 0x00
	.byte 0x20, 0x00, 0x00, 0x00

ov13_02245E54:
	.byte 0x31, 0x00, 0x32, 0x00, 0x33, 0x00, 0x34, 0x00, 0x35, 0x00, 0x36, 0x00
	.byte 0x37, 0x00, 0x38, 0x00, 0x39, 0x00, 0x30, 0x00, 0x2D, 0x00, 0x3D, 0x00, 0x51, 0x00, 0x57, 0x00
	.byte 0x45, 0x00, 0x52, 0x00, 0x54, 0x00, 0x59, 0x00, 0x55, 0x00, 0x49, 0x00, 0x4F, 0x00, 0x50, 0x00
	.byte 0x5B, 0x00, 0x5D, 0x00, 0x41, 0x00, 0x53, 0x00, 0x44, 0x00, 0x46, 0x00, 0x47, 0x00, 0x48, 0x00
	.byte 0x4A, 0x00, 0x4B, 0x00, 0x4C, 0x00, 0x3B, 0x00, 0x27, 0x00, 0x60, 0x00, 0x5A, 0x00, 0x58, 0x00
	.byte 0x43, 0x00, 0x56, 0x00, 0x42, 0x00, 0x4E, 0x00, 0x4D, 0x00, 0x2C, 0x00, 0x2E, 0x00, 0x2F, 0x00
	.byte 0x5C, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00

	.balign 4, 0
ov13_02245EB8:
	.asciz "!@#$%^&*()_+QWERTYUIOP{}ASDFGHJKL:\"~ZXCVBNM<>?|"

	.balign 4, 0
ov13_02245EE8:
	.asciz "1234567890-=QWERTYUIOP[]ASDFGHJKL;'`ZXCVBNM,./\\"

	.balign 4, 0
ov13_02245F18:
	.asciz "1234567890-=qwertyuiop[]asdfghjkl;'`zxcvbnm,./\\"

	.balign 4, 0
ov13_02245F48:
	.asciz "dwc:/move/child.srl"
	.balign 4, 0
ov13_02245F5C:
	.asciz "dwc:/move/banner.plt"
	.balign 4, 0
ov13_02245F74:
	.asciz "dwc:/move/banner.char"
	.balign 4, 0

ov13_02245F8C: ; 0x02245F8C
	.word ov13_02245F48
	.word 0
	.word 0
	.word ov13_02245F74
	.word ov13_02245F5C
	.word 0x00000159
	.word 0

	.balign 4, 0
ov13_02245FA8:
	.asciz "msg/kor.bmg.l"
	.balign 4, 0
ov13_02245FB8:
	.asciz "msg/eng.bmg.l"
	.balign 4, 0
ov13_02245FC8:
	.asciz "msg/ita.bmg.l"
	.balign 4, 0
ov13_02245FD8:
	.asciz "msg/ger.bmg.l"
	.balign 4, 0
ov13_02245FE8:
	.asciz "msg/fre.bmg.l"
	.balign 4, 0
ov13_02245FF8:
	.asciz "msg/spa.bmg.l"
	.balign 4, 0
ov13_02246008:
	.asciz "msg/jap.bmg.l"
	.balign 4, 0

ov13_02246018: ; 0x02246018
	.word ov13_02246008
	.word ov13_02245FB8
	.word ov13_02245FE8
	.word ov13_02245FD8
	.word ov13_02245FC8
	.word ov13_02245FF8
	.word ov13_02245FA8

	.balign 4, 0
ov13_02246034: ; 0x02246034
	.asciz "msg/usa.bmg.l"

	.balign 4, 0
ov13_02246044: ; 0x02246044
	.asciz "char/jtMain.nce.l"

	.balign 4, 0
ov13_02246058: ; 0x02246058
	.asciz "char/jbMain.nce.l"

	.balign 4, 0
ov13_0224606C: ; 0x0224606C
	.asciz "char/jtBgMain.ncg.l"

	.balign 4, 0
ov13_02246080: ; 0x02246080
	.asciz "char/jtBgMain.ncl.l"

	.balign 4, 0
ov13_02246094: ; 0x02246094
	.asciz "char/jtObjMain.ncg.l"

	.balign 4, 0
ov13_022460AC: ; 0x022460AC
	.asciz "char/xtObjMain.ncl.l"

	.balign 4, 0
ov13_022460C4: ; 0x022460C4
	.asciz "char/jbBgStep1.ncg.l"

	.balign 4, 0
ov13_022460DC: ; 0x022460DC
	.asciz "char/jbBgStep1.ncl.l"

	.balign 4, 0
ov13_022460F4: ; 0x022460F4
	.asciz "char/jbObjMain.ncg.l"

	.balign 4, 0
ov13_0224610C: ; 0x0224610C
	.asciz "char/ybObjMain.ncl.l"

	.balign 4, 0
ov13_02246124: ; 0x02246124
	.asciz "char/jtTop.nsc.l"

	.balign 4, 0
ov13_02246138: ; 0x02246138
	.asciz "char/jtStep1.nsc.l"

	.balign 4, 0
ov13_0224614C: ; 0x0224614C
	.asciz "char/jbBgStep1.ncg.l"

	.balign 4, 0
ov13_02246164: ; 0x02246164
	.asciz "char/jbBgStep1.ncl.l"

	.balign 4, 0
ov13_0224617C: ; 0x0224617C
	.asciz "char/jb2Menu.nsc.l"

	.balign 4, 0
ov13_02246190: ; 0x02246190
	.asciz "char/yb5Multi.nsc.l"

	.balign 4, 0
ov13_022461A4: ; 0x022461A4
	.asciz "char/yb5Multi.nsc.l"

	.balign 4, 0
ov13_022461B8: ; 0x022461B8
	.asciz "char/jb5Info.nsc.l"

	.balign 4, 0
ov13_022461CC: ; 0x022461CC
	.byte 0x25, 0x00, 0x30, 0x00
	.byte 0x32, 0x00, 0x58, 0x00, 0x2D, 0x00, 0x25, 0x00, 0x30, 0x00, 0x32, 0x00, 0x58, 0x00, 0x2D, 0x00
	.byte 0x25, 0x00, 0x30, 0x00, 0x32, 0x00, 0x58, 0x00, 0x2D, 0x00, 0x25, 0x00, 0x30, 0x00, 0x32, 0x00
	.byte 0x58, 0x00, 0x2D, 0x00, 0x25, 0x00, 0x30, 0x00, 0x32, 0x00, 0x58, 0x00, 0x2D, 0x00, 0x25, 0x00
	.byte 0x30, 0x00, 0x32, 0x00, 0x58, 0x00, 0x00, 0x00

ov13_02246208: ; 0x02246208
	.byte 0x25, 0x00, 0x30, 0x00, 0x34, 0x00, 0x64, 0x00
	.byte 0x2D, 0x00, 0x25, 0x00, 0x30, 0x00, 0x34, 0x00, 0x64, 0x00, 0x2D, 0x00, 0x25, 0x00, 0x30, 0x00
	.byte 0x34, 0x00, 0x64, 0x00, 0x2D, 0x00, 0x25, 0x00, 0x30, 0x00, 0x34, 0x00, 0x64, 0x00, 0x00, 0x00

ov13_02246230: ; 0x02246230
	.byte 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00
	.byte 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00
	.byte 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x00, 0x00

ov13_02246258: ; 0x02246258
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42
	.byte 0x67, 0x4F, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00

ov13_02246270: ; 0x02246270
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x35, 0x4F, 0x70, 0x74, 0x4D, 0x65, 0x6E, 0x75, 0x2E
	.byte 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00

ov13_02246288: ; 0x02246288
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x35
	.byte 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_0224629C: ; 0x0224629C
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x35, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_022462B0: ; 0x022462B0
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x35, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00

ov13_022462C4: ; 0x022462C4
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x35, 0x4D, 0x75, 0x6C, 0x74
	.byte 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_022462D8: ; 0x022462D8
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x35
	.byte 0x4D, 0x6F, 0x76, 0x65, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00

ov13_022462EC: ; 0x022462EC
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x35, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_02246300: ; 0x02246300
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E
	.byte 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_02246318: ; 0x02246318
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_02246330: ; 0x02246330
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00

ov13_02246344: ; 0x02246344
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74
	.byte 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_02246358: ; 0x02246358
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x34
	.byte 0x41, 0x70, 0x4C, 0x69, 0x73, 0x74, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_02246370: ; 0x02246370
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4B, 0x62, 0x2E, 0x6E, 0x63, 0x6C
	.byte 0x2E, 0x6C, 0x00, 0x00

ov13_02246384: ; 0x02246384
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65
	.byte 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_0224639C: ; 0x0224639C
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00

ov13_022463B4: ; 0x022463B4
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x45, 0x64, 0x69, 0x74
	.byte 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00

ov13_022463C8: ; 0x022463C8
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x4F
	.byte 0x62, 0x6A, 0x4D, 0x61, 0x69, 0x6E, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_022463E0: ; 0x022463E0
	.byte 0x20, 0x20, 0x30, 0x00

ov13_022463E4: ; 0x022463E4
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4B, 0x62
	.byte 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00

ov13_022463F8: ; 0x022463F8
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_02246410: ; 0x02246410
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E
	.byte 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_02246428: ; 0x02246428
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34
	.byte 0x45, 0x64, 0x69, 0x74, 0x41, 0x64, 0x64, 0x72, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00

ov13_02246440: ; 0x02246440
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4D, 0x61, 0x69, 0x6E, 0x2E, 0x6E
	.byte 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_02246458: ; 0x02246458
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x34
	.byte 0x45, 0x72, 0x72, 0x6F, 0x72, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_0224646C: ; 0x0224646C
	.byte 0x25, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov13_02246474: ; 0x02246474
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4B, 0x62
	.byte 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00

ov13_02246488: ; 0x02246488
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_022464A0: ; 0x022464A0
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x31, 0x2E
	.byte 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00

ov13_022464B8: ; 0x022464B8
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x33
	.byte 0x4C, 0x69, 0x73, 0x74, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00

ov13_022464CC: ; 0x022464CC
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4D, 0x61, 0x69, 0x6E, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00

ov13_022464E4: ; 0x022464E4
	.byte 0x25, 0x00, 0x33, 0x00, 0x64, 0x00, 0x2E, 0x00, 0x25, 0x00, 0x33, 0x00
	.byte 0x64, 0x00, 0x2E, 0x00, 0x25, 0x00, 0x33, 0x00, 0x64, 0x00, 0x2E, 0x00, 0x25, 0x00, 0x33, 0x00
	.byte 0x64, 0x00, 0x00, 0x00

ov13_02246504: ; 0x02246504
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65
	.byte 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_0224651C: ; 0x0224651C
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00

ov13_02246534: ; 0x02246534
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4E, 0x6F, 0x6E, 0x65
	.byte 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00

ov13_02246548: ; 0x02246548
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34
	.byte 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_0224655C: ; 0x0224655C
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_02246570: ; 0x02246570
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00

ov13_02246584: ; 0x02246584
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65
	.byte 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_0224659C: ; 0x0224659C
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00

ov13_022465B4: ; 0x022465B4
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74
	.byte 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_022465C8: ; 0x022465C8
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_022465E0: ; 0x022465E0
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E
	.byte 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_022465F8: ; 0x022465F8
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34
	.byte 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_0224660C: ; 0x0224660C
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x57, 0x61, 0x79, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00

ov13_02246620: ; 0x02246620
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x31, 0x2E, 0x6E
	.byte 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_02246638: ; 0x02246638
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x31, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_02246650: ; 0x02246650
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x32, 0x41, 0x70, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00

ov13_02246664: ; 0x02246664
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4D, 0x61
	.byte 0x69, 0x6E, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_0224667C: ; 0x0224667C
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00

ov13_02246694: ; 0x02246694
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65
	.byte 0x70, 0x32, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_022466AC: ; 0x022466AC
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x33, 0x57, 0x61, 0x79, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00

ov13_022466C0: ; 0x022466C0
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E
	.byte 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_022466D8: ; 0x022466D8
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_022466F0: ; 0x022466F0
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00

ov13_02246704: ; 0x02246704
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74
	.byte 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_02246718: ; 0x02246718
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34
	.byte 0x4E, 0x6F, 0x6E, 0x65, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00

ov13_0224672C: ; 0x0224672C
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00

ov13_02246740: ; 0x02246740
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x2E, 0x6E
	.byte 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_02246758: ; 0x02246758
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_02246770: ; 0x02246770
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x33, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00

ov13_02246784: ; 0x02246784
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65
	.byte 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00

ov13_0224679C: ; 0x0224679C
	.byte 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00

ov13_022467B4: ; 0x022467B4
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x34, 0x55, 0x73, 0x62, 0x2E
	.byte 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00

ov13_022467C8: ; 0x022467C8
	.byte 0x25, 0x33, 0x64, 0x25, 0x33, 0x64, 0x25, 0x33
	.byte 0x64, 0x25, 0x33, 0x64, 0x00, 0x00, 0x00, 0x00

ov13_022467D8: ; 0x022467D8
	.byte 0x73, 0x6F, 0x75, 0x6E, 0x64, 0x2F, 0x73, 0x6F
	.byte 0x75, 0x6E, 0x64, 0x5F, 0x64, 0x61, 0x74, 0x61, 0x2E, 0x73, 0x64, 0x61, 0x74, 0x2E, 0x6C, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x54, 0x6F, 0x70, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x53, 0x74, 0x65, 0x70, 0x31
	.byte 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x53
	.byte 0x74, 0x65, 0x70, 0x32, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x74, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x4F, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00

ov13_02246854: ; 0x02246854
	.byte 0x04, 0x68, 0x24, 0x02, 0x18, 0x68, 0x24, 0x02, 0x2C, 0x68, 0x24, 0x02
	.byte 0x40, 0x68, 0x24, 0x02, 0xF0, 0x67, 0x24, 0x02, 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F
	.byte 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x45, 0x4E, 0x44, 0x00, 0x00, 0x4D, 0x42, 0x5F, 0x43
	.byte 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x4E, 0x4F, 0x4E, 0x45, 0x00
	.byte 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x45
	.byte 0x52, 0x52, 0x4F, 0x52, 0x00, 0x00, 0x00, 0x00, 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F
	.byte 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x4B, 0x49, 0x43, 0x4B, 0x45, 0x44, 0x00, 0x00, 0x00
	.byte 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x4D, 0x42, 0x50, 0x5F, 0x53, 0x54, 0x41
	.byte 0x54, 0x45, 0x5F, 0x53, 0x54, 0x4F, 0x50, 0x00

ov13_022468D8: ; 0x022468D8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC0, 0x68, 0x24, 0x02, 0x4C, 0x69, 0x24, 0x02, 0x80, 0x69, 0x24, 0x02, 0x34, 0x6B, 0x24, 0x02
	.byte 0xB4, 0x6A, 0x24, 0x02, 0x44, 0x6A, 0x24, 0x02, 0xD4, 0x69, 0x24, 0x02, 0xB8, 0x69, 0x24, 0x02
	.byte 0x7C, 0x68, 0x24, 0x02, 0xD4, 0x6A, 0x24, 0x02, 0x64, 0x69, 0x24, 0x02, 0x28, 0x6A, 0x24, 0x02
	.byte 0xA8, 0x68, 0x24, 0x02, 0x60, 0x6A, 0x24, 0x02, 0x7C, 0x6A, 0x24, 0x02, 0xF4, 0x6A, 0x24, 0x02
	.byte 0x98, 0x6A, 0x24, 0x02, 0x14, 0x6B, 0x24, 0x02, 0x9C, 0x69, 0x24, 0x02, 0xF0, 0x69, 0x24, 0x02
	.byte 0x68, 0x68, 0x24, 0x02, 0x90, 0x68, 0x24, 0x02, 0x0C, 0x6A, 0x24, 0x02, 0x44, 0x57, 0x43, 0x69
	.byte 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x4D, 0x42, 0x50, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x49
	.byte 0x44, 0x4C, 0x45, 0x00, 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41
	.byte 0x54, 0x45, 0x5F, 0x43, 0x4F, 0x4E, 0x4E, 0x45, 0x43, 0x54, 0x45, 0x44, 0x00, 0x00, 0x00, 0x00
	.byte 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x4D, 0x42, 0x50, 0x5F, 0x53, 0x54, 0x41
	.byte 0x54, 0x45, 0x5F, 0x45, 0x4E, 0x54, 0x52, 0x59, 0x00, 0x00, 0x00, 0x00, 0x4D, 0x42, 0x5F, 0x43
	.byte 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x52, 0x45, 0x51, 0x55, 0x45
	.byte 0x53, 0x54, 0x45, 0x44, 0x00, 0x00, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56
	.byte 0x5F, 0x4D, 0x42, 0x50, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x45, 0x52, 0x52, 0x4F, 0x52
	.byte 0x00, 0x00, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x4D, 0x42, 0x50
	.byte 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x43, 0x41, 0x4E, 0x43, 0x45, 0x4C, 0x00, 0x00, 0x00
	.byte 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x4D
	.byte 0x45, 0x4D, 0x42, 0x45, 0x52, 0x5F, 0x46, 0x55, 0x4C, 0x4C, 0x00, 0x00, 0x4D, 0x42, 0x5F, 0x43
	.byte 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x57, 0x41, 0x49, 0x54, 0x5F
	.byte 0x54, 0x4F, 0x5F, 0x53, 0x45, 0x4E, 0x44, 0x00, 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F
	.byte 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x44, 0x49, 0x53, 0x43, 0x4F, 0x4E, 0x4E, 0x45, 0x43
	.byte 0x54, 0x45, 0x44, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x4D, 0x42, 0x50
	.byte 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x43, 0x4F, 0x4D, 0x50, 0x4C, 0x45, 0x54, 0x45, 0x00
	.byte 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x52
	.byte 0x45, 0x51, 0x5F, 0x41, 0x43, 0x43, 0x45, 0x50, 0x54, 0x45, 0x44, 0x00, 0x4D, 0x42, 0x5F, 0x43
	.byte 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x53, 0x45, 0x4E, 0x44, 0x5F
	.byte 0x50, 0x52, 0x4F, 0x43, 0x45, 0x45, 0x44, 0x00, 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F
	.byte 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x42, 0x4F, 0x4F, 0x54, 0x5F, 0x52, 0x45, 0x51, 0x55
	.byte 0x45, 0x53, 0x54, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x4D, 0x42, 0x50
	.byte 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x52, 0x45, 0x42, 0x4F, 0x4F, 0x54, 0x49, 0x4E, 0x47
	.byte 0x00, 0x00, 0x00, 0x00, 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41
	.byte 0x54, 0x45, 0x5F, 0x49, 0x4E, 0x49, 0x54, 0x5F, 0x43, 0x4F, 0x4D, 0x50, 0x4C, 0x45, 0x54, 0x45
	.byte 0x00, 0x00, 0x00, 0x00, 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41
	.byte 0x54, 0x45, 0x5F, 0x53, 0x45, 0x4E, 0x44, 0x5F, 0x43, 0x4F, 0x4D, 0x50, 0x4C, 0x45, 0x54, 0x45
	.byte 0x00, 0x00, 0x00, 0x00, 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41
	.byte 0x54, 0x45, 0x5F, 0x42, 0x4F, 0x4F, 0x54, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x41, 0x42, 0x4C
	.byte 0x45, 0x00, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x4D, 0x42, 0x50
	.byte 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x44, 0x41, 0x54, 0x41, 0x53, 0x45, 0x4E, 0x44, 0x49
	.byte 0x4E, 0x47, 0x00, 0x00, 0x4E, 0x2F, 0x41, 0x00, 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F
	.byte 0x44, 0x45, 0x5F, 0x46, 0x41, 0x49, 0x4C, 0x45, 0x44, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x45
	.byte 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x4E, 0x4F, 0x5F, 0x44, 0x41, 0x54, 0x41, 0x00, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x54, 0x49, 0x4D, 0x45, 0x4F
	.byte 0x55, 0x54, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x53
	.byte 0x55, 0x43, 0x43, 0x45, 0x53, 0x53, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x4D, 0x50, 0x5F, 0x49, 0x4E, 0x44, 0x00, 0x57, 0x4D, 0x5F, 0x45
	.byte 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x44, 0x43, 0x46, 0x5F, 0x54, 0x45, 0x53, 0x54, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x4E, 0x4F, 0x5F, 0x45, 0x4E
	.byte 0x54, 0x52, 0x59, 0x00, 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x4E
	.byte 0x4F, 0x5F, 0x43, 0x48, 0x49, 0x4C, 0x44, 0x00, 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F
	.byte 0x44, 0x45, 0x5F, 0x4F, 0x50, 0x45, 0x52, 0x41, 0x54, 0x49, 0x4E, 0x47, 0x00, 0x00, 0x00, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x44, 0x43, 0x46
	.byte 0x5F, 0x49, 0x4E, 0x44, 0x00, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x4D, 0x50, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x00, 0x00, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x46, 0x49, 0x46, 0x4F, 0x5F
	.byte 0x45, 0x52, 0x52, 0x4F, 0x52, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F
	.byte 0x44, 0x45, 0x5F, 0x4E, 0x4F, 0x5F, 0x44, 0x41, 0x54, 0x41, 0x53, 0x45, 0x54, 0x00, 0x00, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x57, 0x4D, 0x5F, 0x44, 0x49
	.byte 0x53, 0x41, 0x42, 0x4C, 0x45, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x50, 0x4F, 0x52, 0x54, 0x5F, 0x52, 0x45, 0x43, 0x56, 0x00, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x43, 0x4F, 0x4E
	.byte 0x4E, 0x45, 0x43, 0x54, 0x45, 0x44, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x4D, 0x50, 0x41, 0x43, 0x4B, 0x5F, 0x49, 0x4E, 0x44, 0x00, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x45, 0x4E, 0x44, 0x5F
	.byte 0x46, 0x41, 0x49, 0x4C, 0x45, 0x44, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x44, 0x43, 0x46, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x00, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x46, 0x4C, 0x41, 0x53, 0x48
	.byte 0x5F, 0x45, 0x52, 0x52, 0x4F, 0x52, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x4D, 0x50, 0x45, 0x4E, 0x44, 0x5F, 0x49, 0x4E, 0x44, 0x00, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x50, 0x4F, 0x52
	.byte 0x54, 0x5F, 0x53, 0x45, 0x4E, 0x44, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x43, 0x41, 0x4E, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x46, 0x49, 0x46
	.byte 0x4F, 0x5F, 0x45, 0x52, 0x52, 0x4F, 0x52, 0x00, 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F
	.byte 0x44, 0x45, 0x5F, 0x49, 0x4C, 0x4C, 0x45, 0x47, 0x41, 0x4C, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x00, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x43, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x42, 0x45, 0x41, 0x43, 0x4F, 0x4E, 0x5F, 0x4C, 0x4F, 0x53, 0x54, 0x00, 0x00, 0x00, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x49, 0x4E, 0x56, 0x41, 0x4C
	.byte 0x49, 0x44, 0x5F, 0x50, 0x41, 0x52, 0x41, 0x4D, 0x00, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x45
	.byte 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x57, 0x4C, 0x5F, 0x4C, 0x45, 0x4E, 0x47, 0x54, 0x48
	.byte 0x5F, 0x45, 0x52, 0x52, 0x00, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x42, 0x45, 0x41, 0x43, 0x4F, 0x4E, 0x5F, 0x52, 0x45, 0x43, 0x56
	.byte 0x00, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x43, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x52, 0x45, 0x41, 0x53, 0x53, 0x4F, 0x43, 0x49, 0x41, 0x54, 0x45, 0x00, 0x00, 0x00, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x42, 0x45, 0x41
	.byte 0x43, 0x4F, 0x4E, 0x5F, 0x53, 0x45, 0x4E, 0x54, 0x00, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53
	.byte 0x54, 0x41, 0x54, 0x45, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x50, 0x41, 0x52, 0x45, 0x4E, 0x54, 0x5F
	.byte 0x46, 0x4F, 0x55, 0x4E, 0x44, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x44, 0x49, 0x53, 0x43, 0x4F, 0x4E, 0x4E, 0x45, 0x43, 0x54, 0x45
	.byte 0x44, 0x00, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F
	.byte 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x53, 0x54, 0x4F, 0x50, 0x00, 0x00, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x4F, 0x56, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x41, 0x58, 0x5F, 0x45, 0x4E, 0x54, 0x52, 0x59, 0x00, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69
	.byte 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x5F, 0x49, 0x44, 0x4C, 0x45, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x44, 0x49, 0x53, 0x41, 0x53, 0x53, 0x4F, 0x43, 0x49, 0x41, 0x54
	.byte 0x45, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45, 0x43, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x50, 0x41, 0x52, 0x45, 0x4E, 0x54, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x00, 0x00, 0x00
	.byte 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53
	.byte 0x54, 0x41, 0x54, 0x45, 0x5F, 0x42, 0x55, 0x53, 0x59, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53
	.byte 0x54, 0x41, 0x54, 0x45, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x41, 0x55, 0x54, 0x48, 0x45, 0x4E, 0x54
	.byte 0x49, 0x43, 0x41, 0x54, 0x45, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x43, 0x4F, 0x4E, 0x4E, 0x45, 0x43, 0x54, 0x5F, 0x53, 0x54, 0x41
	.byte 0x52, 0x54, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F
	.byte 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x45, 0x52, 0x52, 0x4F, 0x52, 0x00, 0x00
	.byte 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x45, 0x4E, 0x44, 0x5F
	.byte 0x51, 0x55, 0x45, 0x55, 0x45, 0x5F, 0x46, 0x55, 0x4C, 0x4C, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x45
	.byte 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x57, 0x4C, 0x5F, 0x49, 0x4E, 0x56, 0x41, 0x4C, 0x49
	.byte 0x44, 0x5F, 0x50, 0x41, 0x52, 0x41, 0x4D, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56
	.byte 0x5F, 0x57, 0x48, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x4E, 0x4F, 0x5F, 0x52
	.byte 0x41, 0x44, 0x49, 0x4F, 0x00, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F
	.byte 0x44, 0x45, 0x5F, 0x49, 0x4E, 0x56, 0x41, 0x4C, 0x49, 0x44, 0x5F, 0x50, 0x4F, 0x4C, 0x4C, 0x42
	.byte 0x49, 0x54, 0x4D, 0x41, 0x50, 0x00, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56
	.byte 0x5F, 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x53, 0x43, 0x41
	.byte 0x4E, 0x4E, 0x49, 0x4E, 0x47, 0x00, 0x00, 0x00, 0x57, 0x4D, 0x5F, 0x53, 0x54, 0x41, 0x54, 0x45
	.byte 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x50, 0x41, 0x52, 0x45, 0x4E, 0x54, 0x5F, 0x4E, 0x4F, 0x54, 0x5F
	.byte 0x46, 0x4F, 0x55, 0x4E, 0x44, 0x00, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56
	.byte 0x5F, 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x43, 0x4F, 0x4E
	.byte 0x4E, 0x45, 0x43, 0x54, 0x45, 0x44, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56
	.byte 0x5F, 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x4B, 0x45, 0x59
	.byte 0x53, 0x48, 0x41, 0x52, 0x49, 0x4E, 0x47, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56
	.byte 0x5F, 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x44, 0x41, 0x54
	.byte 0x41, 0x53, 0x48, 0x41, 0x52, 0x49, 0x4E, 0x47, 0x00, 0x00, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69
	.byte 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F
	.byte 0x44, 0x49, 0x53, 0x43, 0x4F, 0x4E, 0x4E, 0x45, 0x43, 0x54, 0x45, 0x44, 0x00, 0x00, 0x00, 0x00
	.byte 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53
	.byte 0x54, 0x41, 0x54, 0x45, 0x5F, 0x43, 0x4F, 0x4E, 0x4E, 0x45, 0x43, 0x54, 0x5F, 0x46, 0x41, 0x49
	.byte 0x4C, 0x00, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F
	.byte 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x4D, 0x45, 0x41, 0x53, 0x55, 0x52, 0x45
	.byte 0x43, 0x48, 0x41, 0x4E, 0x4E, 0x45, 0x4C, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56
	.byte 0x5F, 0x57, 0x48, 0x5F, 0x45, 0x52, 0x52, 0x43, 0x4F, 0x44, 0x45, 0x5F, 0x50, 0x41, 0x52, 0x45
	.byte 0x4E, 0x54, 0x5F, 0x4E, 0x4F, 0x54, 0x5F, 0x46, 0x4F, 0x55, 0x4E, 0x44, 0x00, 0x00, 0x00, 0x00

ov13_02247120: ; 0x02247120
	.byte 0x74, 0x6E, 0x24, 0x02, 0xAC, 0x6E, 0x24, 0x02, 0xE8, 0x6F, 0x24, 0x02, 0x00, 0x6F, 0x24, 0x02
	.byte 0x28, 0x70, 0x24, 0x02, 0x68, 0x70, 0x24, 0x02, 0x48, 0x70, 0x24, 0x02, 0xD4, 0x70, 0x24, 0x02
	.byte 0xB0, 0x70, 0x24, 0x02, 0x54, 0x6F, 0x24, 0x02, 0xE4, 0x6E, 0x24, 0x02, 0x54, 0x6B, 0x24, 0x02
	.byte 0x20, 0x6E, 0x24, 0x02, 0x48, 0x6D, 0x24, 0x02, 0x08, 0x70, 0x24, 0x02, 0x3C, 0x6E, 0x24, 0x02
	.byte 0x38, 0x6F, 0x24, 0x02, 0xA0, 0x6C, 0x24, 0x02, 0x94, 0x6D, 0x24, 0x02, 0x58, 0x6E, 0x24, 0x02
	.byte 0x28, 0x6C, 0x24, 0x02, 0x18, 0x6D, 0x24, 0x02, 0xA8, 0x6B, 0x24, 0x02, 0xB8, 0x6C, 0x24, 0x02
	.byte 0xE8, 0x6C, 0x24, 0x02, 0x10, 0x6C, 0x24, 0x02, 0xE8, 0x6D, 0x24, 0x02, 0xC8, 0x6E, 0x24, 0x02
	.byte 0x04, 0x6E, 0x24, 0x02, 0x1C, 0x6F, 0x24, 0x02, 0x30, 0x6D, 0x24, 0x02, 0x88, 0x6C, 0x24, 0x02
	.byte 0x60, 0x6D, 0x24, 0x02, 0x94, 0x6B, 0x24, 0x02, 0x58, 0x6B, 0x24, 0x02, 0xF8, 0x6B, 0x24, 0x02
	.byte 0x78, 0x6D, 0x24, 0x02, 0x70, 0x6C, 0x24, 0x02, 0x58, 0x6C, 0x24, 0x02, 0xB0, 0x6D, 0x24, 0x02
	.byte 0xE4, 0x6B, 0x24, 0x02, 0x40, 0x6C, 0x24, 0x02, 0x80, 0x6B, 0x24, 0x02, 0x70, 0x6F, 0x24, 0x02
	.byte 0xD0, 0x6B, 0x24, 0x02, 0x90, 0x6E, 0x24, 0x02, 0xC8, 0x6F, 0x24, 0x02, 0x6C, 0x6B, 0x24, 0x02
	.byte 0xD0, 0x6C, 0x24, 0x02, 0xBC, 0x6B, 0x24, 0x02, 0x8C, 0x6F, 0x24, 0x02, 0xCC, 0x6D, 0x24, 0x02
	.byte 0x00, 0x6D, 0x24, 0x02, 0x8C, 0x70, 0x24, 0x02, 0xF8, 0x70, 0x24, 0x02, 0xA8, 0x6F, 0x24, 0x02

ov13_02247200: ; 0x02247200
	.byte 0x25, 0x73, 0x20, 0x2D, 0x3E, 0x20, 0x00, 0x00

ov13_02247208: ; 0x02247208
	.byte 0x25, 0x73, 0x0A, 0x00

ov13_0224720C: ; 0x0224720C
	.byte 0x53, 0x74, 0x61, 0x72
	.byte 0x74, 0x50, 0x61, 0x72, 0x65, 0x6E, 0x74, 0x20, 0x2D, 0x20, 0x6E, 0x65, 0x77, 0x20, 0x63, 0x68
	.byte 0x69, 0x6C, 0x64, 0x20, 0x28, 0x61, 0x69, 0x64, 0x20, 0x25, 0x78, 0x29, 0x20, 0x63, 0x6F, 0x6E
	.byte 0x6E, 0x65, 0x63, 0x74, 0x65, 0x64, 0x0A, 0x00

ov13_02247238: ; 0x02247238
	.byte 0x53, 0x74, 0x61, 0x72, 0x74, 0x50, 0x61, 0x72
	.byte 0x65, 0x6E, 0x74, 0x20, 0x2D, 0x20, 0x63, 0x68, 0x69, 0x6C, 0x64, 0x20, 0x28, 0x61, 0x69, 0x64
	.byte 0x20, 0x25, 0x78, 0x29, 0x20, 0x64, 0x69, 0x73, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x65
	.byte 0x64, 0x0A, 0x00, 0x00

ov13_02247264: ; 0x02247264
	.byte 0x75, 0x6E, 0x6B, 0x6E, 0x6F, 0x77, 0x6E, 0x20, 0x69, 0x6E, 0x64, 0x69
	.byte 0x63, 0x61, 0x74, 0x65, 0x2C, 0x20, 0x73, 0x74, 0x61, 0x74, 0x65, 0x20, 0x3D, 0x20, 0x25, 0x64
	.byte 0x0A, 0x00, 0x00, 0x00

ov13_02247284: ; 0x02247284
	.byte 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F
	.byte 0x53, 0x74, 0x61, 0x74, 0x65, 0x49, 0x6E, 0x53, 0x74, 0x61, 0x72, 0x74, 0x50, 0x61, 0x72, 0x65
	.byte 0x6E, 0x74, 0x4B, 0x65, 0x79, 0x53, 0x68, 0x61, 0x72, 0x65, 0x20, 0x66, 0x61, 0x69, 0x6C, 0x65
	.byte 0x64, 0x0A, 0x00, 0x00

ov13_022472B4: ; 0x022472B4
	.byte 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F
	.byte 0x53, 0x74, 0x61, 0x74, 0x65, 0x49, 0x6E, 0x45, 0x6E, 0x64, 0x50, 0x61, 0x72, 0x65, 0x6E, 0x74
	.byte 0x20, 0x66, 0x61, 0x69, 0x6C, 0x65, 0x64, 0x0A, 0x00, 0x00, 0x00, 0x00

ov13_022472DC: ; 0x022472DC
	.byte 0x72, 0x65, 0x63, 0x76
	.byte 0x20, 0x62, 0x75, 0x66, 0x66, 0x65, 0x72, 0x20, 0x73, 0x69, 0x7A, 0x65, 0x20, 0x3D, 0x20, 0x25
	.byte 0x64, 0x0A, 0x00, 0x00

ov13_022472F4: ; 0x022472F4
	.byte 0x73, 0x65, 0x6E, 0x64, 0x20, 0x62, 0x75, 0x66, 0x66, 0x65, 0x72, 0x20
	.byte 0x73, 0x69, 0x7A, 0x65, 0x20, 0x3D, 0x20, 0x25, 0x64, 0x0A, 0x00, 0x00

ov13_0224730C: ; 0x0224730C
	.byte 0x63, 0x68, 0x61, 0x6E
	.byte 0x6E, 0x65, 0x6C, 0x20, 0x25, 0x64, 0x20, 0x62, 0x72, 0x61, 0x74, 0x69, 0x6F, 0x20, 0x3D, 0x20
	.byte 0x25, 0x78, 0x0A, 0x00

ov13_02247324: ; 0x02247324
	.byte 0x64, 0x65, 0x63, 0x69, 0x64, 0x65, 0x64, 0x20, 0x63, 0x68, 0x61, 0x6E
	.byte 0x6E, 0x65, 0x6C, 0x20, 0x3D, 0x20, 0x25, 0x64, 0x0A, 0x00, 0x00, 0x00

ov13_0224733C: ; 0x0224733C
	.byte 0x75, 0x6E, 0x6B, 0x6E
	.byte 0x6F, 0x77, 0x6E, 0x20, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x20, 0x6D, 0x6F, 0x64, 0x65
	.byte 0x20, 0x25, 0x64, 0x0A, 0x00, 0x00, 0x00, 0x00

ov13_02247358: ; 0x02247358
	.byte 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56
	.byte 0x5F, 0x57, 0x48, 0x5F, 0x53, 0x74, 0x65, 0x70, 0x44, 0x61, 0x74, 0x61, 0x53, 0x68, 0x61, 0x72
	.byte 0x69, 0x6E, 0x67, 0x20, 0x2D, 0x20, 0x57, 0x61, 0x72, 0x6E, 0x69, 0x6E, 0x67, 0x20, 0x4E, 0x6F
	.byte 0x20, 0x43, 0x68, 0x69, 0x6C, 0x64, 0x0A, 0x00

ov13_02247388: ; 0x02247388
	.byte 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56
	.byte 0x5F, 0x57, 0x48, 0x5F, 0x53, 0x74, 0x65, 0x70, 0x44, 0x61, 0x74, 0x61, 0x53, 0x68, 0x61, 0x72
	.byte 0x69, 0x6E, 0x67, 0x20, 0x2D, 0x20, 0x57, 0x61, 0x72, 0x6E, 0x69, 0x6E, 0x67, 0x20, 0x4E, 0x6F
	.byte 0x20, 0x44, 0x61, 0x74, 0x61, 0x53, 0x65, 0x74, 0x0A, 0x00, 0x00, 0x00

ov13_022473BC: ; 0x022473BC
	.byte 0x61, 0x6C, 0x72, 0x65
	.byte 0x61, 0x64, 0x79, 0x20, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F
	.byte 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x49, 0x44, 0x4C, 0x45, 0x0A, 0x00, 0x00

ov13_022473E0: ; 0x022473E0
	.byte 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F, 0x46, 0x69, 0x6E, 0x61
	.byte 0x6C, 0x69, 0x7A, 0x65, 0x2C, 0x20, 0x73, 0x74, 0x61, 0x74, 0x65, 0x20, 0x3D, 0x20, 0x25, 0x64
	.byte 0x0A, 0x00, 0x00, 0x00

ov13_02247404: ; 0x02247404
	.byte 0x72, 0x6F, 0x6D, 0x3A, 0x2F, 0x64, 0x77, 0x63, 0x2F, 0x75, 0x74, 0x69
	.byte 0x6C, 0x69, 0x74, 0x79, 0x2E, 0x62, 0x69, 0x6E, 0x00, 0x00, 0x00, 0x00

ov13_0224741C: ; 0x0224741C
	.byte 0x25, 0x73, 0x3A, 0x2F
	.byte 0x00, 0x00, 0x00, 0x00

ov13_02247424: ; 0x02247424
	.byte 0x72, 0x6F, 0x6D, 0x3A, 0x2F, 0x00, 0x00, 0x00

ov13_0224742C: ; 0x0224742C
	.byte 0x2E, 0x6C, 0x00, 0x00

ov13_02247430: ; 0x02247430
	.byte 0x50, 0x74, 0x24, 0x02, 0x40, 0x74, 0x24, 0x02

ov13_02247438: ; 0x02247438
	.byte 0x60, 0x74, 0x24, 0x02, 0x40, 0x74, 0x24, 0x02
	.byte 0x6D, 0x73, 0x67, 0x2F, 0x6C, 0x63, 0x5F, 0x73, 0x2E, 0x4E, 0x46, 0x54, 0x52, 0x2E, 0x6C, 0x00
	.byte 0x6D, 0x73, 0x67, 0x2F, 0x6B, 0x63, 0x5F, 0x6D, 0x2E, 0x4E, 0x46, 0x54, 0x52, 0x2E, 0x6C, 0x00
	.byte 0x6D, 0x73, 0x67, 0x2F, 0x6C, 0x63, 0x5F, 0x6D, 0x2E, 0x4E, 0x46, 0x54, 0x52, 0x2E, 0x6C, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

ov13_0224F464:
	.space 0x4

ov13_0224F468: ; 0x0224F468
	.space 0x4

ov13_0224F46C: ; 0x0224F46C
	.space 0x4

ov13_0224F470: ; 0x0224F470
	.space 0x40

ov13_0224F4B0: ; 0x0224F4B0
	.space 0x4

ov13_0224F4B4: ; 0x0224F4B4
	.space 0x4

ov13_0224F4B8: ; 0x0224F4B8
	.space 0x4

ov13_0224F4BC: ; 0x0224F4BC
	.space 0x4

ov13_0224F4C0: ; 0x0224F4C0
	.space 0x4

ov13_0224F4C4: ; 0x0224F4C4
	.space 0x4

ov13_0224F4C8: ; 0x0224F4C8
	.space 0x4

ov13_0224F4CC: ; 0x0224F4CC
	.space 0x20

ov13_0224F4EC: ; 0x0224F4EC
	.space 0x4

ov13_0224F4F0: ; 0x0224F4F0
	.space 0x4

ov13_0224F4F4: ; 0x0224F4F4
	.space 0x4

ov13_0224F4F8: ; 0x0224F4F8
	.space 0x4

ov13_0224F4FC: ; 0x0224F4FC
	.space 0x8

ov13_0224F504: ; 0x0224F504
	.space 0x4

ov13_0224F508: ; 0x0224F508
	.space 0xC

ov13_0224F514: ; 0x0224F514
	.space 0x4

ov13_0224F518: ; 0x0224F518
	.space 0x4

ov13_0224F51C: ; 0x0224F51C
	.space 0x4

ov13_0224F520: ; 0x0224F520
	.space 0x4

ov13_0224F524: ; 0x0224F524
	.space 0x4

ov13_0224F528: ; 0x0224F528
	.space 0x4

ov13_0224F52C: ; 0x0224F52C
	.space 0x8

ov13_0224F534: ; 0x0224F534
	.space 0x4

ov13_0224F538: ; 0x0224F538
	.space 0x4

ov13_0224F53C: ; 0x0224F53C
	.space 0x4

ov13_0224F540: ; 0x0224F540
	.space 0x4

ov13_0224F544: ; 0x0224F544
	.space 0x4

ov13_0224F548: ; 0x0224F548
	.space 0x4

ov13_0224F54C: ; 0x0224F54C
	.space 0x8

ov13_0224F554: ; 0x0224F554
	.space 0x4

ov13_0224F558: ; 0x0224F558
	.space 0x4

ov13_0224F55C: ; 0x0224F55C
	.space 0x4

ov13_0224F560: ; 0x0224F560
	.space 0x4

ov13_0224F564: ; 0x0224F564
	.space 0x4

ov13_0224F568: ; 0x0224F568
	.space 0x4

ov13_0224F56C: ; 0x0224F56C
	.space 0x4

ov13_0224F570: ; 0x0224F570
	.space 0x4

ov13_0224F574: ; 0x0224F574
	.space 0x8

ov13_0224F57C: ; 0x0224F57C
	.space 0x4

ov13_0224F580: ; 0x0224F580
	.space 0x4

ov13_0224F584: ; 0x0224F584
	.space 0x4

ov13_0224F588: ; 0x0224F588
	.space 0x4

ov13_0224F58C: ; 0x0224F58C
	.space 0x4

ov13_0224F590: ; 0x0224F590
	.space 0xC

ov13_0224F59C: ; 0x0224F59C
	.space 0x4

ov13_0224F5A0: ; 0x0224F5A0
	.space 0x4

ov13_0224F5A4: ; 0x0224F5A4
	.space 0x4

ov13_0224F5A8: ; 0x0224F5A8
	.space 0x4

ov13_0224F5AC: ; 0x0224F5AC
	.space 0x4

ov13_0224F5B0: ; 0x0224F5B0
	.space 0x4

ov13_0224F5B4: ; 0x0224F5B4
	.space 0x4

ov13_0224F5B8: ; 0x0224F5B8
	.space 0x4

ov13_0224F5BC: ; 0x0224F5BC
	.space 0x4

ov13_0224F5C0: ; 0x0224F5C0
	.space 0x8

ov13_0224F5C8: ; 0x0224F5C8
	.space 0x4

ov13_0224F5CC: ; 0x0224F5CC
	.space 0x4

ov13_0224F5D0: ; 0x0224F5D0
	.space 0x4

ov13_0224F5D4: ; 0x0224F5D4
	.space 0x8

ov13_0224F5DC: ; 0x0224F5DC
	.space 0x4

ov13_0224F5E0: ; 0x0224F5E0
	.space 0x4

ov13_0224F5E4: ; 0x0224F5E4
	.space 0x4

ov13_0224F5E8: ; 0x0224F5E8
	.space 0x4

ov13_0224F5EC: ; 0x0224F5EC
	.space 0x4

ov13_0224F5F0: ; 0x0224F5F0
	.space 0x10

ov13_0224F600: ; 0x0224F600
	.space 0x8

ov13_0224F608: ; 0x0224F608
	.space 0x4

ov13_0224F60C: ; 0x0224F60C
	.space 0x4

ov13_0224F610: ; 0x0224F610
	.space 0x34

ov13_0224F644: ; 0x0224F644
	.space 0x1c
