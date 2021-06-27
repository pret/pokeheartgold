	.include "asm/macros.inc"
	.include "global.inc"

	.text

	arm_func_start ov13_02226F58
ov13_02226F58: @ 0x02226F58
	push {r4, r5, r6, lr}
	mov r4, r0
	mov r0, #0xc
	mov r1, #4
	bl ov13_0224128C
	ldr r2, _02227018 @ =0x0224F464
	mov r1, #0x47
	str r0, [r2]
	strb r4, [r0, #8]
	mov r0, #0
	bl ov13_02240184
	ldr lr, _02227018 @ =0x0224F464
	ldr r1, _0222701C @ =0x02244EB0
	ldr r2, [lr]
	ldrb r4, [r1, r4]
	str r0, [r2, #4]
	ldr r0, [lr]
	ldr ip, _02227020 @ =0xFE00FF00
	ldr r5, [r0, #4]
	ldr r1, _02227024 @ =ov13_02227064
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
	ldr r1, _02227018 @ =0x0224F464
	ldr r1, [r1]
	str r0, [r1]
	pop {r4, r5, r6, pc}
	.align 2, 0
_02227018: .4byte 0x0224F464
_0222701C: .4byte 0x02244EB0
_02227020: .4byte 0xFE00FF00
_02227024: .4byte ov13_02227064
	arm_func_end ov13_02226F58

	arm_func_start ov13_02227028
ov13_02227028: @ 0x02227028
	push {r3, lr}
	ldr r1, _0222705C @ =0x0224F464
	mov r0, #1
	ldr r1, [r1]
	ldr r1, [r1]
	bl ov13_022425F0
	ldr r0, _0222705C @ =0x0224F464
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov13_02241D98
	ldr r0, _02227060 @ =0x0224F464
	bl ov13_022412B0
	pop {r3, pc}
	.align 2, 0
_0222705C: .4byte 0x0224F464
_02227060: .4byte 0x0224F464
	arm_func_end ov13_02227028

	arm_func_start ov13_02227064
ov13_02227064: @ 0x02227064
	push {r3, lr}
	ldr r0, _02227124 @ =0x0224F464
	mov r1, #0x28
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	add r0, r0, #1
	bl FUN_020CCD3C
	ldr r2, _02227124 @ =0x0224F464
	mov r1, #5
	ldr r3, [r2]
	strb r0, [r3, #9]
	ldr r0, [r2]
	ldrb r0, [r0, #9]
	bl FUN_020CCD00
	ldr r2, _02227124 @ =0x0224F464
	add r1, r0, #0x47
	ldr r2, [r2]
	mov r0, #0
	ldr r2, [r2, #4]
	bl ov13_022400F0
	ldr r1, _02227124 @ =0x0224F464
	ldr ip, _02227128 @ =0x02244EB0
	ldr r2, [r1]
	ldr r0, _0222712C @ =0xFE00FF00
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
	pop {r3, pc}
	.align 2, 0
_02227124: .4byte 0x0224F464
_02227128: .4byte 0x02244EB0
_0222712C: .4byte 0xFE00FF00
	arm_func_end ov13_02227064

	arm_func_start ov13_02227130
ov13_02227130: @ 0x02227130
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _02227218 @ =0x02244EE0
	mov r5, r0
	mov r0, #0x1c
	mov r1, #4
	ldrb r8, [r2, r5]
	bl ov13_0224128C
	ldr r4, _0222721C @ =0x0224F468
	mvn r7, #1
	str r0, [r4]
	strb r7, [r0, #0x16]
	ldr r0, [r4]
	cmp r8, #0
	strb r5, [r0, #0x17]
	mov sb, #0
	ble _022271BC
	ldr r0, _02227220 @ =0x02244EC4
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
	ldr r3, _0222721C @ =0x0224F468
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
	ldr r1, _02227224 @ =ov13_02227390
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0222721C @ =0x0224F468
	ldr r1, [r1]
	str r0, [r1, #0xc]
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02227218: .4byte 0x02244EE0
_0222721C: .4byte 0x0224F468
_02227220: .4byte 0x02244EC4
_02227224: .4byte ov13_02227390
	arm_func_end ov13_02227130

	arm_func_start ov13_02227228
ov13_02227228: @ 0x02227228
	ldr r0, _0222724C @ =0x0224F468
	mov r3, #1
	ldr r2, [r0]
	ldr ip, _02227250 @ =ov13_022425C8
	strb r3, [r2, #0x19]
	ldr r0, [r0]
	ldr r1, _02227254 @ =ov13_022275D8
	ldr r0, [r0, #0xc]
	bx ip
	.align 2, 0
_0222724C: .4byte 0x0224F468
_02227250: .4byte ov13_022425C8
_02227254: .4byte ov13_022275D8
	arm_func_end ov13_02227228

	arm_func_start ov13_02227258
ov13_02227258: @ 0x02227258
	ldr r0, _02227268 @ =0x0224F468
	ldr r0, [r0]
	ldrsb r0, [r0, #0x16]
	bx lr
	.align 2, 0
_02227268: .4byte 0x0224F468
	arm_func_end ov13_02227258

	arm_func_start ov13_0222726C
ov13_0222726C: @ 0x0222726C
	ldr r2, _02227288 @ =0x0224F468
	mvn r1, #0
	ldr r3, [r2]
	ldrsb r2, [r3, #0x16]
	cmp r2, r1
	strbeq r0, [r3, #0x16]
	bx lr
	.align 2, 0
_02227288: .4byte 0x0224F468
	arm_func_end ov13_0222726C

	arm_func_start ov13_0222728C
ov13_0222728C: @ 0x0222728C
	ldr r1, _0222729C @ =0x0224F468
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	bx lr
	.align 2, 0
_0222729C: .4byte 0x0224F468
	arm_func_end ov13_0222728C

	arm_func_start ov13_022272A0
ov13_022272A0: @ 0x022272A0
	ldr r0, _022272C8 @ =0x0224F468
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	bxeq lr
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_022272C8: .4byte 0x0224F468
	arm_func_end ov13_022272A0

	arm_func_start ov13_022272CC
ov13_022272CC: @ 0x022272CC
	ldr r0, _022272E0 @ =0x0224F468
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x18]
	bx lr
	.align 2, 0
_022272E0: .4byte 0x0224F468
	arm_func_end ov13_022272CC

	arm_func_start ov13_022272E4
ov13_022272E4: @ 0x022272E4
	ldr r0, _022272F8 @ =0x0224F468
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x18]
	bx lr
	.align 2, 0
_022272F8: .4byte 0x0224F468
	arm_func_end ov13_022272E4

	arm_func_start ov13_022272FC
ov13_022272FC: @ 0x022272FC
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _02227380 @ =0x0224F468
	mov r8, r0
	ldr r0, [r1]
	ldr r1, _02227384 @ =0x02244EE0
	ldrb r2, [r0, #0x17]
	ldr r0, [r0, #8]
	mov r3, r8
	ldrb r6, [r1, r2]
	mvn r1, #0
	mov r2, #0
	bl ov13_0223FF18
	mov r7, #0
	cmp r6, #0
	pople {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r4, _02227388 @ =0x02244ED2
	ldr sl, _0222738C @ =0x02244EBC
	ldr sb, _02227380 @ =0x0224F468
	mvn r5, #0
_02227348:
	ldr r0, [sb]
	mov r1, r5
	ldrb r2, [r0, #0x17]
	ldr r0, [r0, r7, lsl #2]
	add r3, r8, #4
	add r2, r4, r2, lsl #1
	ldrb r2, [r7, r2]
	lsl r2, r2, #2
	ldrh r2, [sl, r2]
	bl ov13_0223FF18
	add r7, r7, #1
	cmp r7, r6
	blt _02227348
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02227380: .4byte 0x0224F468
_02227384: .4byte 0x02244EE0
_02227388: .4byte 0x02244ED2
_0222738C: .4byte 0x02244EBC
	arm_func_end ov13_022272FC

	arm_func_start ov13_02227390
ov13_02227390: @ 0x02227390
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _022273F4 @ =0x0224F468
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
	popgt {r4, pc}
	mov r0, #0xa8
	bl ov13_022272FC
	ldr r1, _022273F8 @ =ov13_022273FC
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_022273F4: .4byte 0x0224F468
_022273F8: .4byte ov13_022273FC
	arm_func_end ov13_02227390

	arm_func_start ov13_022273FC
ov13_022273FC: @ 0x022273FC
	push {r3, lr}
	ldr r1, _02227444 @ =0x0224F468
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
	poplo {r3, pc}
	ldr r1, _02227448 @ =ov13_0222744C
	mov r2, #0
	strh r2, [r3, #0x14]
	bl ov13_022425C8
	pop {r3, pc}
	.align 2, 0
_02227444: .4byte 0x0224F468
_02227448: .4byte ov13_0222744C
	arm_func_end ov13_022273FC

	arm_func_start ov13_0222744C
ov13_0222744C: @ 0x0222744C
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r8, _022275B8 @ =0x0224F468
	ldr r1, _022275BC @ =0x02244EE0
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
	popne {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r6, #0
	mov r7, #0
	ble _022275A0
	ldr r5, _022275C0 @ =0x02244EBC
	ldr r4, _022275C4 @ =0x02244ED2
	ldr sl, _022275C8 @ =0x02244EB8
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
	ldr r0, _022275B8 @ =0x0224F468
	ldr r3, [r0]
	ldr r0, [r3, #0x10]
	cmp r0, #0
	bne _022275A0
	ldrb r2, [r3, #0x17]
	ldr r1, _022275CC @ =0x02244EC4
	ldr r0, [r3, r7, lsl #2]
	add r1, r1, r2, lsl #1
	ldrb r4, [r7, r1]
	mov r1, #0
	bl ov13_0223FDE0
	mov r2, r0
	add r1, r4, #1
	mov r0, #0
	bl ov13_022400F0
	ldr r0, _022275B8 @ =0x0224F468
	ldr r1, _022275C4 @ =0x02244ED2
	ldr r0, [r0]
	ldr r2, _022275C0 @ =0x02244EBC
	ldrb r4, [r0, #0x17]
	ldr r3, _022275D0 @ =0x02244EBE
	ldr r0, [r0, r7, lsl #2]
	add r1, r1, r4, lsl #1
	ldrb r4, [r7, r1]
	mvn r1, #0
	lsl r4, r4, #2
	ldrh r2, [r2, r4]
	ldrh r3, [r3, r4]
	bl ov13_0223FF18
	ldr r0, _022275B8 @ =0x0224F468
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #1
	ldr r0, [r0, r7, lsl #2]
	bl ov13_02240008
	mov r0, #0
	ldr r1, _022275D4 @ =ov13_022276B4
	mov r2, r0
	mov r3, #0x6e
	bl ov13_02242528
	ldr r1, _022275B8 @ =0x0224F468
	add sp, sp, #8
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r0, [r1]
	strb r7, [r0, #0x16]
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_02227594:
	add r7, r7, #1
	cmp r7, r6
	blt _022274A4
_022275A0:
	ldr r0, _022275B8 @ =0x0224F468
	mvn r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x16]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022275B8: .4byte 0x0224F468
_022275BC: .4byte 0x02244EE0
_022275C0: .4byte 0x02244EBC
_022275C4: .4byte 0x02244ED2
_022275C8: .4byte 0x02244EB8
_022275CC: .4byte 0x02244EC4
_022275D0: .4byte 0x02244EBE
_022275D4: .4byte ov13_022276B4
	arm_func_end ov13_0222744C

	arm_func_start ov13_022275D8
ov13_022275D8: @ 0x022275D8
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02227634 @ =0x0224F468
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
	poplt {r4, pc}
	ldr r1, _02227638 @ =ov13_0222763C
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02227634: .4byte 0x0224F468
_02227638: .4byte ov13_0222763C
	arm_func_end ov13_022275D8

	arm_func_start ov13_0222763C
ov13_0222763C: @ 0x0222763C
	push {r3, r4, r5, lr}
	mov r1, r0
	mov r0, #0
	bl ov13_022425D0
	ldr r0, _022276AC @ =0x0224F468
	ldr r0, [r0]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _02227668
	mov r0, #0
	bl ov13_022425D0
_02227668:
	ldr r4, _022276AC @ =0x0224F468
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
	ldr r0, _022276AC @ =0x0224F468
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov13_0223FD60
	ldr r0, _022276B0 @ =0x0224F468
	bl ov13_022412B0
	pop {r3, r4, r5, pc}
	.align 2, 0
_022276AC: .4byte 0x0224F468
_022276B0: .4byte 0x0224F468
	arm_func_end ov13_0222763C

	arm_func_start ov13_022276B4
ov13_022276B4: @ 0x022276B4
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _02227798 @ =0x0224F468
	str r0, [sp]
	ldr r1, [r4]
	ldrh r0, [r1, #0x14]
	add r0, r0, #1
	strh r0, [r1, #0x14]
	ldr r1, [r4]
	ldrh r0, [r1, #0x14]
	cmp r0, #0x10
	poplo {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r1, [r1, #0x17]
	ldr r0, _0222779C @ =0x02244EE0
	mov sb, #0
	ldrb r8, [r0, r1]
	cmp r8, #0
	ble _02227754
	ldr r7, _022277A0 @ =0x02244EC4
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
	ldr r1, _02227798 @ =0x0224F468
	mov r0, #0
	ldr r2, [r1]
	sub r3, r0, #1
	strh r0, [r2, #0x14]
	ldr r2, [r1]
	strb r3, [r2, #0x16]
	ldr r2, [r1]
	ldr r1, [r2, #0x10]
	cmp r1, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sp]
	str r0, [r2, #0x10]
	bl ov13_022425D0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02227798: .4byte 0x0224F468
_0222779C: .4byte 0x02244EE0
_022277A0: .4byte 0x02244EC4
	arm_func_end ov13_022276B4

	arm_func_start ov13_022277A4
ov13_022277A4: @ 0x022277A4
	ldr r0, _022277B4 @ =0x0224F46C
	mov r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_022277B4: .4byte 0x0224F46C
	arm_func_end ov13_022277A4

	arm_func_start ov13_022277B8
ov13_022277B8: @ 0x022277B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r3, _02227874 @ =0x0224F46C
	mov r7, r0
	ldrb r0, [r3]
	mov r6, r1
	mov r5, r2
	cmp r0, #0
	addne sp, sp, #0x10
	movne r0, #0
	popne {r3, r4, r5, r6, r7, pc}
	ldr r0, _02227878 @ =0x02245B20
	ldr r1, _0222787C @ =0x020CFF84
	bl ov13_02227924
	ldr r3, _02227880 @ =0x01920000
	ldr r2, _02227884 @ =0x04001010
	mov r0, #1
	mov r1, #0
	str r3, [r2]
	bl ov13_022408A0
	ldr r1, _02227888 @ =0x0224F4F8
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
	ldr r1, _02227874 @ =0x0224F46C
	strb r0, [r1]
	add sp, sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02227874: .4byte 0x0224F46C
_02227878: .4byte 0x02245B20
_0222787C: .4byte 0x020CFF84
_02227880: .4byte 0x01920000
_02227884: .4byte 0x04001010
_02227888: .4byte 0x0224F4F8
	arm_func_end ov13_022277B8

	arm_func_start ov13_0222788C
ov13_0222788C: @ 0x0222788C
	push {r3, lr}
	ldr r0, _022278C0 @ =0x0224F46C
	ldrb r0, [r0]
	cmp r0, #0
	moveq r0, #0
	popeq {r3, pc}
	mov r0, #1
	bl ov13_02240B04
	ldr r0, _022278C0 @ =0x0224F46C
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_022278C0: .4byte 0x0224F46C
	arm_func_end ov13_0222788C

	arm_func_start ov13_022278C4
ov13_022278C4: @ 0x022278C4
	push {r4, lr}
	mov r4, r0
	ldr r0, _0222791C @ =0x0224F470
	mov r1, r4
	mov r2, #0x3f
	bl FUN_020E9664
	ldrb r0, [r4, #5]
	cmp r0, #0x78
	ldreq r0, _0222791C @ =0x0224F470
	popeq {r4, pc}
	bl ov13_0222B970
	ldrb r1, [r4, #5]
	cmp r1, #0x79
	bne _02227908
	cmp r0, #0
	ldrne r0, _0222791C @ =0x0224F470
	popne {r4, pc}
_02227908:
	ldr r1, _02227920 @ =0x02244F30
	ldrb r1, [r1, r0]
	ldr r0, _0222791C @ =0x0224F470
	strb r1, [r0, #5]
	pop {r4, pc}
	.align 2, 0
_0222791C: .4byte 0x0224F470
_02227920: .4byte 0x02244F30
	arm_func_end ov13_022278C4

	arm_func_start ov13_02227924
ov13_02227924: @ 0x02227924
	push {r3, r4, r5, lr}
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
	pop {r3, r4, r5, pc}
	arm_func_end ov13_02227924

	arm_func_start ov13_02227964
ov13_02227964: @ 0x02227964
	push {r3, r4, lr}
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
	pop {r3, r4, pc}
_02227998:
	cmp r0, #2
	addne sp, sp, #4
	popne {r3, r4, pc}
	mov r0, r4
	bl ov13_0223B1E0
	add sp, sp, #4
	pop {r3, r4, pc}
	arm_func_end ov13_02227964

	arm_func_start ov13_022279B4
ov13_022279B4: @ 0x022279B4
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B90C
	ldr r0, [sp]
	cmp r0, #1
	addne sp, sp, #4
	popne {r3, r4, pc}
	mov r0, r4
	bl ov13_02227130
	add sp, sp, #4
	pop {r3, r4, pc}
	arm_func_end ov13_022279B4

	arm_func_start ov13_022279EC
ov13_022279EC: @ 0x022279EC
	push {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0
	mov r1, r0
	bl ov13_022408A0
	ldr r1, _02227A5C @ =0x0224F4F8
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
	pop {r3, r4, r5, pc}
	.align 2, 0
_02227A5C: .4byte 0x0224F4F8
	arm_func_end ov13_022279EC

	arm_func_start ov13_02227A60
ov13_02227A60: @ 0x02227A60
	push {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0
	mov r6, r1
	mov r1, r0
	bl ov13_022408A0
	ldr r1, _02227B0C @ =0x0224F4F8
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
	ldr r1, _02227B10 @ =0x00000209
	lsl r3, r0, #2
	stm sp, {r1, r5}
	ldr r2, _02227B14 @ =0x02244F16
	ldr r1, _02227B18 @ =0x02244F14
	lsl ip, r6, #2
	ldrh r2, [r2, r3]
	ldrh r1, [r1, ip]
	mov r0, r4
	mov r3, #2
	bl ov13_02240B28
	mov r0, r4
	bl ov13_02240E2C
	add sp, sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_02227B0C: .4byte 0x0224F4F8
_02227B10: .4byte 0x00000209
_02227B14: .4byte 0x02244F16
_02227B18: .4byte 0x02244F14
	arm_func_end ov13_02227A60

	arm_func_start ov13_02227B1C
ov13_02227B1C: @ 0x02227B1C
	push {r3, lr}
	bl ov13_0222B970
	ldr r1, _02227B30 @ =0x02244EF8
	ldr r0, [r1, r0, lsl #2]
	pop {r3, pc}
	.align 2, 0
_02227B30: .4byte 0x02244EF8
	arm_func_end ov13_02227B1C

	arm_func_start ov13_02227B34
ov13_02227B34: @ 0x02227B34
	push {r3, lr}
	mov r0, #0x10
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _02227B50 @ =0x0224F4B0
	str r0, [r1]
	pop {r3, pc}
	.align 2, 0
_02227B50: .4byte 0x0224F4B0
	arm_func_end ov13_02227B34

	arm_func_start ov13_02227B54
ov13_02227B54: @ 0x02227B54
	push {r3, lr}
	bl ov13_02227D18
	ldr r0, _02227B68 @ =0x0224F4B0
	bl ov13_022412B0
	pop {r3, pc}
	.align 2, 0
_02227B68: .4byte 0x0224F4B0
	arm_func_end ov13_02227B54

	arm_func_start ov13_02227B6C
ov13_02227B6C: @ 0x02227B6C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r4, r0
	str r1, [sp]
	str r2, [sp, #4]
	mov fp, r3
	bl ov13_02227D18
	ldr r0, _02227C20 @ =0x02244F38
	mov sb, #0
	add sl, r0, r4, lsl #1
	mov r7, #1
	ldr r4, _02227C24 @ =0x0224F4B0
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
	ldr r0, _02227C24 @ =0x0224F4B0
	ldr r2, [sp]
	ldr r0, [r0]
	mov r3, fp
	ldr r0, [r0]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _02227C24 @ =0x0224F4B0
	ldr r2, [sp, #4]
	ldr r0, [r0]
	mov r3, fp
	ldr r0, [r0, #4]
	mvn r1, #0
	bl ov13_0223FF18
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02227C20: .4byte 0x02244F38
_02227C24: .4byte 0x0224F4B0
	arm_func_end ov13_02227B6C

	arm_func_start ov13_02227C28
ov13_02227C28: @ 0x02227C28
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov fp, r0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov sb, #6
	bl ov13_02227D18
	mov sl, #0
	mov r7, #1
	ldr r4, _02227D14 @ =0x0224F4B0
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
	ldr r0, _02227D14 @ =0x0224F4B0
	ldr r3, [sp, #4]
	ldr r0, [r0]
	mov r2, fp
	ldr r0, [r0]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _02227D14 @ =0x0224F4B0
	ldr r2, [sp]
	ldr r0, [r0]
	ldr r3, [sp, #4]
	ldr r0, [r0, #4]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _02227D14 @ =0x0224F4B0
	ldr r3, [sp, #8]
	ldr r0, [r0]
	mov r2, fp
	ldr r0, [r0, #8]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _02227D14 @ =0x0224F4B0
	ldr r2, [sp]
	ldr r0, [r0]
	ldr r3, [sp, #8]
	ldr r0, [r0, #0xc]
	mvn r1, #0
	bl ov13_0223FF18
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02227D14: .4byte 0x0224F4B0
	arm_func_end ov13_02227C28

	arm_func_start ov13_02227D18
ov13_02227D18: @ 0x02227D18
	push {r4, r5, r6, lr}
	mov r6, #0
	ldr r4, _02227D54 @ =0x0224F4B0
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
	pop {r4, r5, r6, pc}
	.align 2, 0
_02227D54: .4byte 0x0224F4B0
	arm_func_end ov13_02227D18

	arm_func_start ov13_02227D58
ov13_02227D58: @ 0x02227D58
	push {r3, lr}
	mov r0, #0xc0
	mov r1, #4
	bl ov13_0224128C
	ldr r2, _02227DBC @ =0x0224F4B4
	ldr r1, _02227DC0 @ =0x020D02E4
	str r0, [r2]
	ldr r0, _02227DC4 @ =0x02245D54
	bl ov13_02227924
	bl ov13_0222B980
	cmp r0, #0
	beq _02227D94
	cmp r0, #1
	beq _02227DA8
	pop {r3, pc}
_02227D94:
	ldr r0, _02227DC8 @ =0x02245D04
	ldr r1, _02227DCC @ =FUN_020CFFE4
	ldr r0, [r0]
	bl ov13_02227924
	pop {r3, pc}
_02227DA8:
	ldr r0, _02227DC8 @ =0x02245D04
	ldr r1, _02227DCC @ =FUN_020CFFE4
	ldr r0, [r0, #4]
	bl ov13_02227924
	pop {r3, pc}
	.align 2, 0
_02227DBC: .4byte 0x0224F4B4
_02227DC0: .4byte 0x020D02E4
_02227DC4: .4byte 0x02245D54
_02227DC8: .4byte 0x02245D04
_02227DCC: .4byte FUN_020CFFE4
	arm_func_end ov13_02227D58

	arm_func_start ov13_02227DD0
ov13_02227DD0: @ 0x02227DD0
	ldr ip, _02227DDC @ =ov13_022412B0
	ldr r0, _02227DE0 @ =0x0224F4B4
	bx ip
	.align 2, 0
_02227DDC: .4byte ov13_022412B0
_02227DE0: .4byte 0x0224F4B4
	arm_func_end ov13_02227DD0

	arm_func_start ov13_02227DE4
ov13_02227DE4: @ 0x02227DE4
	push {r4, lr}
	ldr r1, _02227E34 @ =0x02245D04
	ldr r0, [r1, r0, lsl #2]
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _02227E38 @ =0x0224F4B4
	mov r4, r0
	ldr r1, [r1]
	mov r2, #0xc0
	bl FUN_020D48B4
	mov r0, r4
	bl ov13_0223FA50
	mov r0, #1
	ldr r1, _02227E3C @ =ov13_02227E70
	mov r2, #0
	mov r3, #0x78
	bl ov13_02242528
	pop {r4, pc}
	.align 2, 0
_02227E34: .4byte 0x02245D04
_02227E38: .4byte 0x0224F4B4
_02227E3C: .4byte ov13_02227E70
	arm_func_end ov13_02227DE4

	arm_func_start ov13_02227E40
ov13_02227E40: @ 0x02227E40
	push {r3, lr}
	bl ov13_02239FF0
	ldrb r0, [r0, #0xf4]
	add r0, r0, #5
	bl ov13_02227DE4
	pop {r3, pc}
	arm_func_end ov13_02227E40

	arm_func_start ov13_02227E58
ov13_02227E58: @ 0x02227E58
	push {r3, lr}
	bl ov13_02239FF0
	ldrb r0, [r0, #0xf4]
	add r0, r0, #2
	bl ov13_02227DE4
	pop {r3, pc}
	arm_func_end ov13_02227E58

	arm_func_start ov13_02227E70
ov13_02227E70: @ 0x02227E70
	push {r4, lr}
	ldr r1, _02227EAC @ =0x0224F4B4
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0xc0
	bl DC_FlushRange
	ldr r0, _02227EAC @ =0x0224F4B4
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0xc0
	bl FUN_020CFFE4
	mov r1, r4
	mov r0, #1
	bl ov13_022425D0
	pop {r4, pc}
	.align 2, 0
_02227EAC: .4byte 0x0224F4B4
	arm_func_end ov13_02227E70

	arm_func_start ov13_02227EB0
ov13_02227EB0: @ 0x02227EB0
	push {r3, r4, r5, lr}
	ldr r1, _02227F58 @ =0x0224F4B8
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #0xc
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _02227F5C @ =0x02244F44
	ldr r2, _02227F58 @ =0x0224F4B8
	ldrb r1, [r1, r4, lsl #2]
	str r0, [r2]
	strb r4, [r0, #8]
	mov r0, #0
	bl ov13_02240184
	ldr lr, _02227F58 @ =0x0224F4B8
	ldr ip, _02227F60 @ =0xFE00FF00
	ldr r2, [lr]
	ldr r1, _02227F64 @ =ov13_02227FAC
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
	ldr r1, _02227F58 @ =0x0224F4B8
	ldr r1, [r1]
	str r0, [r1, #4]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02227F58: .4byte 0x0224F4B8
_02227F5C: .4byte 0x02244F44
_02227F60: .4byte 0xFE00FF00
_02227F64: .4byte ov13_02227FAC
	arm_func_end ov13_02227EB0

	arm_func_start ov13_02227F68
ov13_02227F68: @ 0x02227F68
	push {r3, lr}
	ldr r0, _02227FA4 @ =0x0224F4B8
	ldr r0, [r0]
	cmp r0, #0
	popeq {r3, pc}
	ldr r1, [r0, #4]
	mov r0, #0
	bl ov13_022425F0
	ldr r0, _02227FA4 @ =0x0224F4B8
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov13_02241D98
	ldr r0, _02227FA8 @ =0x0224F4B8
	bl ov13_022412B0
	pop {r3, pc}
	.align 2, 0
_02227FA4: .4byte 0x0224F4B8
_02227FA8: .4byte 0x0224F4B8
	arm_func_end ov13_02227F68

	arm_func_start ov13_02227FAC
ov13_02227FAC: @ 0x02227FAC
	push {r3, r4, r5, lr}
	ldr r0, _02228044 @ =0x04000208
	mov r4, #0
	ldrh r5, [r0]
	strh r4, [r0]
	bl FUN_020DEF24
	cmp r0, #0x8000
	beq _02227FD4
	bl FUN_020DEF44
	mov r4, r0
_02227FD4:
	ldr r2, _02228044 @ =0x04000208
	ldr r1, _02228048 @ =0x0224F4B8
	ldrh r0, [r2]
	ldr r3, _0222804C @ =0x02244F44
	mov r0, #0
	strh r5, [r2]
	ldr r2, [r1]
	ldrsb r1, [r2, #8]
	ldr r2, [r2]
	add r1, r3, r1, lsl #2
	ldrb r1, [r4, r1]
	bl ov13_022400F0
	ldr r1, _02228048 @ =0x0224F4B8
	ldr r0, _02228050 @ =0xFE00FF00
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
	pop {r3, r4, r5, pc}
	.align 2, 0
_02228044: .4byte 0x04000208
_02228048: .4byte 0x0224F4B8
_0222804C: .4byte 0x02244F44
_02228050: .4byte 0xFE00FF00
	arm_func_end ov13_02227FAC

	arm_func_start ov13_02228054
ov13_02228054: @ 0x02228054
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
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
	ldr r8, _022283A0 @ =0x0224F4BC
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
	ldr r7, _022283A4 @ =0xC1FFFCFF
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
	ldr r5, _022283A8 @ =0x02244F5C
	ldr r8, _022283A0 @ =0x0224F4BC
	ldr r7, _022283A4 @ =0xC1FFFCFF
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
	ldr sb, _022283AC @ =0x02244F54
	ldr r4, _022283A0 @ =0x0224F4BC
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
	ldr r6, _022283B0 @ =0x02245D74
	ldr r4, _022283A0 @ =0x0224F4BC
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
	lsl r2, sb, #2
	add r1, r1, sl, lsl #4
	str r0, [r1, sb, lsl #2]
	mov r0, #0
	ldr r7, [sp, #0x10]
	strh r0, [sp, #0x1c]
	mov r8, r0
	add r5, r2, sl, lsl #4
_02228274:
	ldr r1, [r6, sl, lsl #2]
	lsl r0, r7, #1
	ldrh r1, [r1, r0]
	ldrh r0, [sp, #0x22]
	strh r1, [sp, #0x14]
	stm sp, {r0, fp}
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
	ldr r3, _022283A0 @ =0x0224F4BC
	mvn r1, #0
	ldr r4, [r3]
	mov r2, #0x200
	str r0, [r4, #0x114]
	ldr r0, [r3]
	mov r3, #0
	ldr r0, [r0, #0x114]
	bl ov13_0223FDF4
	ldr r0, _022283A0 @ =0x0224F4BC
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #2
	ldr r0, [r0, #0x114]
	bl ov13_02240008
	mov r0, #0
	ldr r1, _022283B4 @ =ov13_02228444
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r3, _022283A0 @ =0x0224F4BC
	mov r1, #0
	ldr r4, [r3]
	mov r2, #0xc0
	str r0, [r4, #0x118]
	ldr r0, [r3]
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	add sp, sp, #0x24
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022283A0: .4byte 0x0224F4BC
_022283A4: .4byte 0xC1FFFCFF
_022283A8: .4byte 0x02244F5C
_022283AC: .4byte 0x02244F54
_022283B0: .4byte 0x02245D74
_022283B4: .4byte ov13_02228444
	arm_func_end ov13_02228054

	arm_func_start ov13_022283B8
ov13_022283B8: @ 0x022283B8
	push {r3, lr}
	ldr r0, _022283E4 @ =0x0224F4BC
	ldr r0, [r0]
	ldr r0, [r0, #0x114]
	bl ov13_0223FD60
	ldr r0, _022283E4 @ =0x0224F4BC
	ldr r1, _022283E8 @ =ov13_022299CC
	ldr r0, [r0]
	ldr r0, [r0, #0x118]
	bl ov13_022425C8
	pop {r3, pc}
	.align 2, 0
_022283E4: .4byte 0x0224F4BC
_022283E8: .4byte ov13_022299CC
	arm_func_end ov13_022283B8

	arm_func_start ov13_022283EC
ov13_022283EC: @ 0x022283EC
	ldr r0, _022283FC @ =0x0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x11c]
	bx lr
	.align 2, 0
_022283FC: .4byte 0x0224F4BC
	arm_func_end ov13_022283EC

	arm_func_start ov13_02228400
ov13_02228400: @ 0x02228400
	ldr r1, _02228410 @ =0x0224F4BC
	ldr r1, [r1]
	strb r0, [r1, #0x123]
	bx lr
	.align 2, 0
_02228410: .4byte 0x0224F4BC
	arm_func_end ov13_02228400

	arm_func_start ov13_02228414
ov13_02228414: @ 0x02228414
	ldr r1, _02228424 @ =0x0224F4BC
	ldr r1, [r1]
	strb r0, [r1, #0x124]
	bx lr
	.align 2, 0
_02228424: .4byte 0x0224F4BC
	arm_func_end ov13_02228414

	arm_func_start ov13_02228428
ov13_02228428: @ 0x02228428
	ldr r0, _02228440 @ =0x0224F4BC
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02228440: .4byte 0x0224F4BC
	arm_func_end ov13_02228428

	arm_func_start ov13_02228444
ov13_02228444: @ 0x02228444
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _022284CC @ =0x0224F4BC
	mov r4, r0
	ldr r3, [r2]
	ldr r1, _022284D0 @ =0x01FF0000
	ldr r0, [r3, #0x30]
	ldr r0, [r0]
	and r1, r0, r1
	and r0, r0, #0xff
	sub r2, r0, #0xc
	lsr r0, r1, #0x10
	str r0, [sp, #4]
	str r2, [sp]
	cmp r2, #0x51
	ldrb r0, [r3, #0x11d]
	mov r1, #0
	ble _02228498
	bl ov13_022290F0
	add sp, sp, #8
	pop {r4, pc}
_02228498:
	mov r2, #0x51
	bl ov13_022290F0
	ldr r0, _022284CC @ =0x0224F4BC
	mov r1, #1
	ldr r0, [r0]
	mov r2, #0xc0
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	ldr r1, _022284D4 @ =ov13_022284D8
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_022284CC: .4byte 0x0224F4BC
_022284D0: .4byte 0x01FF0000
_022284D4: .4byte ov13_022284D8
	arm_func_end ov13_02228444

	arm_func_start ov13_022284D8
ov13_022284D8: @ 0x022284D8
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _02228560 @ =0x0224F4BC
	mov r4, r0
	ldr r3, [r2]
	ldr r1, _02228564 @ =0x01FF0000
	ldr r0, [r3, #0x60]
	ldr r0, [r0]
	and r1, r0, r1
	and r0, r0, #0xff
	sub r2, r0, #0xc
	lsr r0, r1, #0x10
	str r0, [sp, #4]
	str r2, [sp]
	cmp r2, #0x67
	ldrb r0, [r3, #0x11d]
	mov r1, #1
	ble _0222852C
	bl ov13_022290F0
	add sp, sp, #8
	pop {r4, pc}
_0222852C:
	mov r2, #0x67
	bl ov13_022290F0
	ldr r0, _02228560 @ =0x0224F4BC
	mov r1, #2
	ldr r0, [r0]
	mov r2, #0xc0
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	ldr r1, _02228568 @ =ov13_0222856C
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02228560: .4byte 0x0224F4BC
_02228564: .4byte 0x01FF0000
_02228568: .4byte ov13_0222856C
	arm_func_end ov13_022284D8

	arm_func_start ov13_0222856C
ov13_0222856C: @ 0x0222856C
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _022285F4 @ =0x0224F4BC
	mov r4, r0
	ldr r3, [r2]
	ldr r1, _022285F8 @ =0x01FF0000
	ldr r0, [r3, #0x90]
	ldr r0, [r0]
	and r1, r0, r1
	and r0, r0, #0xff
	sub r2, r0, #0xc
	lsr r0, r1, #0x10
	str r0, [sp, #4]
	str r2, [sp]
	cmp r2, #0x7d
	ldrb r0, [r3, #0x11d]
	mov r1, #2
	ble _022285C0
	bl ov13_022290F0
	add sp, sp, #8
	pop {r4, pc}
_022285C0:
	mov r2, #0x7d
	bl ov13_022290F0
	ldr r0, _022285F4 @ =0x0224F4BC
	mov r1, #3
	ldr r0, [r0]
	mov r2, #0xc0
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	ldr r1, _022285FC @ =ov13_02228600
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_022285F4: .4byte 0x0224F4BC
_022285F8: .4byte 0x01FF0000
_022285FC: .4byte ov13_02228600
	arm_func_end ov13_0222856C

	arm_func_start ov13_02228600
ov13_02228600: @ 0x02228600
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _02228688 @ =0x0224F4BC
	mov r4, r0
	ldr r3, [r2]
	ldr r1, _0222868C @ =0x01FF0000
	ldr r0, [r3, #0xc0]
	ldr r0, [r0]
	and r1, r0, r1
	and r0, r0, #0xff
	sub r2, r0, #0xc
	lsr r0, r1, #0x10
	str r0, [sp, #4]
	str r2, [sp]
	cmp r2, #0x93
	ldrb r0, [r3, #0x11d]
	mov r1, #3
	ble _02228654
	bl ov13_022290F0
	add sp, sp, #8
	pop {r4, pc}
_02228654:
	mov r2, #0x93
	bl ov13_022290F0
	ldr r0, _02228688 @ =0x0224F4BC
	mov r1, #4
	ldr r0, [r0]
	mov r2, #0xc0
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	ldr r1, _02228690 @ =ov13_02228694
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02228688: .4byte 0x0224F4BC
_0222868C: .4byte 0x01FF0000
_02228690: .4byte ov13_02228694
	arm_func_end ov13_02228600

	arm_func_start ov13_02228694
ov13_02228694: @ 0x02228694
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02228718 @ =0x0224F4BC
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
	ldr r0, _02228718 @ =0x0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	add sp, sp, #8
	pop {r4, pc}
_022286EC:
	ldr r0, _02228718 @ =0x0224F4BC
	mov r2, #0xaa
	ldr r0, [r0]
	ldrb r0, [r0, #0x11d]
	bl ov13_022290F0
	bl ov13_022294B8
	ldr r1, _0222871C @ =ov13_02228720
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02228718: .4byte 0x0224F4BC
_0222871C: .4byte ov13_02228720
	arm_func_end ov13_02228694

	arm_func_start ov13_02228720
ov13_02228720: @ 0x02228720
	push {r3, lr}
	bl ov13_02228738
	bl ov13_02228920
	bl ov13_02228C68
	bl ov13_02228EC0
	pop {r3, pc}
	arm_func_end ov13_02228720

	arm_func_start ov13_02228738
ov13_02228738: @ 0x02228738
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _022288FC @ =0x02245958
	bl ov13_022417DC
	cmp r0, #0
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r0, _02228900 @ =0x0224F4BC
	mvn r1, #0
	ldr r0, [r0]
	ldr r7, _02228904 @ =0x02244FA4
	ldr r6, _02228908 @ =0x02244F68
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
	ldr r0, _02228900 @ =0x0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x124]
	cmp r0, #0
	bne _022287B8
	mov r0, #9
	bl ov13_0223ABB8
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_022287B8:
	mov r0, #0
	bl ov13_0223ABB8
	ldr r0, _02228900 @ =0x0224F4BC
	add sp, sp, #8
	ldr r0, [r0]
	strb r4, [r0, #0x11e]
	pop {r3, r4, r5, r6, r7, pc}
_022287D4:
	add r4, r4, #1
	cmp r4, #0x2f
	add r7, r7, #4
	blt _02228774
	ldr r6, _0222890C @ =0x02244F94
	ldr r7, _02228910 @ =0x02244F84
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
	ldr r0, _02228900 @ =0x0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x123]
	cmp r0, #0
	beq _0222884C
_02228830:
	cmp r4, #2
	bne _0222885C
	ldr r0, _02228900 @ =0x0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x124]
	cmp r0, #0
	bne _0222885C
_0222884C:
	mov r0, #9
	bl ov13_0223ABB8
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222885C:
	ldr r0, _02228914 @ =0x02245D80
	ldr r0, [r0, r4, lsl #2]
	bl ov13_0223ABB8
	ldr r0, _02228900 @ =0x0224F4BC
	add r1, r4, #0x2f
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x11e]
	pop {r3, r4, r5, r6, r7, pc}
_02228880:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #4
	add r7, r7, #4
	blt _022287F4
	ldr r6, _02228918 @ =0x02244F7C
	ldr r5, _0222891C @ =0x02244F64
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
	ldr r0, _02228900 @ =0x0224F4BC
	add r1, r7, #0x33
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x11e]
	pop {r3, r4, r5, r6, r7, pc}
_022288E4:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _022288A4
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022288FC: .4byte 0x02245958
_02228900: .4byte 0x0224F4BC
_02228904: .4byte 0x02244FA4
_02228908: .4byte 0x02244F68
_0222890C: .4byte 0x02244F94
_02228910: .4byte 0x02244F84
_02228914: .4byte 0x02245D80
_02228918: .4byte 0x02244F7C
_0222891C: .4byte 0x02244F64
	arm_func_end ov13_02228738

	arm_func_start ov13_02228920
ov13_02228920: @ 0x02228920
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r1, _02228BCC @ =0x0224F4BC
	ldr r0, _02228BD0 @ =0x02245958
	ldr r1, [r1]
	mov r2, #0
	strb r2, [r1, #0x11c]
	bl ov13_022418EC
	cmp r0, #0
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r7, _02228BD4 @ =0x02244FA4
	ldr r6, _02228BD8 @ =0x02244F68
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
	ldr r1, _02228BCC @ =0x0224F4BC
	ldr r3, [r1]
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, r4
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldrb r2, [r3, #0x11d]
	ldr r0, _02228BDC @ =0x02245D68
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
	ldr r0, _02228BCC @ =0x0224F4BC
	ldr r0, [r0]
	strb r4, [r0, #0x121]
	bl ov13_022294B8
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_022289DC:
	add r4, r4, #1
	cmp r4, #0x2f
	add r7, r7, #4
	blt _0222895C
	ldr r6, _02228BE0 @ =0x02244F9C
	ldr r7, _02228BE4 @ =0x02244F8C
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
	ldr r1, _02228BCC @ =0x0224F4BC
	add r2, r4, #0x2f
	ldr r3, [r1]
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, r2
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldr r0, _02228BE8 @ =0x02245208
	ldrb r0, [r0, r4]
	strb r0, [r3, #0x11c]
	ldr r0, [r1]
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	bne _02228A60
	mov r0, #0
	bl ov13_0222936C
_02228A60:
	ldr r0, _02228BCC @ =0x0224F4BC
	add r1, r4, #0x2f
	ldr r0, [r0]
	strb r1, [r0, #0x121]
	bl ov13_022294B8
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02228A7C:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #4
	add r7, r7, #4
	blt _022289FC
	ldr r7, _02228BEC @ =0x02244F7C
	ldr r6, _02228BF0 @ =0x02244F64
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
	ldr r1, _02228BCC @ =0x0224F4BC
	add r2, r4, #0x33
	ldr r3, [r1]
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, r2
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldr r0, _02228BF4 @ =0x02244F58
	ldrb r0, [r0, r4]
	strb r0, [r3, #0x11c]
	ldr r0, [r1]
	strb r2, [r0, #0x121]
	bl ov13_022294B8
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02228B00:
	add r4, r4, #1
	cmp r4, #2
	add r7, r7, #4
	blt _02228AA0
	ldr r0, _02228BF8 @ =0x02244F84
	ldr r1, _02228BFC @ =0x02244F94
	add r2, sp, #0
	bl ov13_02240E74
	add r0, sp, #0
	bl ov13_022418EC
	cmp r0, #0
	beq _02228B6C
	ldr r0, _02228BCC @ =0x0224F4BC
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, #0x2f
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	bl ov13_02228C08
	ldr r0, _02228BCC @ =0x0224F4BC
	mov r1, #0x2f
	ldr r0, [r0]
	strb r1, [r0, #0x121]
	bl ov13_022294B8
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02228B6C:
	ldr r0, _02228C00 @ =0x02244F88
	ldr r1, _02228C04 @ =0x02244F98
	add r2, sp, #0
	bl ov13_02240E74
	add r0, sp, #0
	bl ov13_022418EC
	cmp r0, #0
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r0, _02228BCC @ =0x0224F4BC
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, #0x30
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	bl ov13_02228C38
	ldr r0, _02228BCC @ =0x0224F4BC
	mov r1, #0x30
	ldr r0, [r0]
	strb r1, [r0, #0x121]
	bl ov13_022294B8
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02228BCC: .4byte 0x0224F4BC
_02228BD0: .4byte 0x02245958
_02228BD4: .4byte 0x02244FA4
_02228BD8: .4byte 0x02244F68
_02228BDC: .4byte 0x02245D68
_02228BE0: .4byte 0x02244F9C
_02228BE4: .4byte 0x02244F8C
_02228BE8: .4byte 0x02245208
_02228BEC: .4byte 0x02244F7C
_02228BF0: .4byte 0x02244F64
_02228BF4: .4byte 0x02244F58
_02228BF8: .4byte 0x02244F84
_02228BFC: .4byte 0x02244F94
_02228C00: .4byte 0x02244F88
_02228C04: .4byte 0x02244F98
	arm_func_end ov13_02228920

	arm_func_start ov13_02228C08
ov13_02228C08: @ 0x02228C08
	push {r3, lr}
	ldr r0, _02228C34 @ =0x0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x11d]
	cmp r0, #2
	moveq r0, #0
	movne r0, #2
	bl ov13_0222936C
	mov r0, #1
	bl ov13_0223ABB8
	pop {r3, pc}
	.align 2, 0
_02228C34: .4byte 0x0224F4BC
	arm_func_end ov13_02228C08

	arm_func_start ov13_02228C38
ov13_02228C38: @ 0x02228C38
	push {r3, lr}
	ldr r0, _02228C64 @ =0x0224F4BC
	ldr r0, [r0]
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	movne r0, #1
	moveq r0, #0
	bl ov13_0222936C
	mov r0, #1
	bl ov13_0223ABB8
	pop {r3, pc}
	.align 2, 0
_02228C64: .4byte 0x0224F4BC
	arm_func_end ov13_02228C38

	arm_func_start ov13_02228C68
ov13_02228C68: @ 0x02228C68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _02228E4C @ =0x02245958
	bl ov13_02241754
	cmp r0, #0
	beq _02228E2C
	ldr r7, _02228E50 @ =0x02244FA4
	ldr r5, _02228E54 @ =0x02244F68
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
	ldr r0, _02228E58 @ =0x0224F4BC
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
	ldr r6, _02228E5C @ =0x02244F9C
	ldr r7, _02228E60 @ =0x02244F8C
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
	ldr r1, _02228E58 @ =0x0224F4BC
	add r0, r4, #0x2f
	ldr r1, [r1]
	add r1, r1, #0x100
	ldrsb r1, [r1, #0x1e]
	cmp r1, r0
	bne _02228E2C
	bl ov13_02228E6C
	cmp r4, #3
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldr r0, _02228E58 @ =0x0224F4BC
	ldr r2, [r0]
	ldrb r1, [r2, #0x122]
	add r1, r1, #1
	strb r1, [r2, #0x122]
	ldr r2, [r0]
	ldrb r1, [r2, #0x122]
	cmp r1, #0x28
	addlo sp, sp, #8
	poplo {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r2, #0x123]
	cmp r1, #0
	bne _02228D94
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02228E58 @ =0x0224F4BC
	mvn r1, #0
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x11e]
	pop {r3, r4, r5, r6, r7, pc}
_02228D94:
	mov r1, #0x80
	strb r1, [r2, #0x11c]
	ldr r1, [r0]
	add sp, sp, #8
	ldrb r0, [r1, #0x122]
	sub r0, r0, #7
	strb r0, [r1, #0x122]
	pop {r3, r4, r5, r6, r7, pc}
_02228DB4:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #4
	add r7, r7, #4
	blt _02228CF4
	ldr r6, _02228E64 @ =0x02244F7C
	ldr r5, _02228E68 @ =0x02244F64
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
	ldr r1, _02228E58 @ =0x0224F4BC
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
	ldr r0, _02228E58 @ =0x0224F4BC
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x122]
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02228E4C: .4byte 0x02245958
_02228E50: .4byte 0x02244FA4
_02228E54: .4byte 0x02244F68
_02228E58: .4byte 0x0224F4BC
_02228E5C: .4byte 0x02244F9C
_02228E60: .4byte 0x02244F8C
_02228E64: .4byte 0x02244F7C
_02228E68: .4byte 0x02244F64
	arm_func_end ov13_02228C68

	arm_func_start ov13_02228E6C
ov13_02228E6C: @ 0x02228E6C
	push {r4, lr}
	ldr r1, _02228EBC @ =0x0224F4BC
	mov r4, r0
	ldr r1, [r1]
	add r1, r1, #0x100
	ldrsb r1, [r1, #0x1f]
	cmp r4, r1
	popeq {r4, pc}
	mov r1, #1
	bl ov13_022293F0
	ldr r0, _02228EBC @ =0x0224F4BC
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x1f]
	bl ov13_022293F0
	ldr r0, _02228EBC @ =0x0224F4BC
	ldr r0, [r0]
	strb r4, [r0, #0x11f]
	pop {r4, pc}
	.align 2, 0
_02228EBC: .4byte 0x0224F4BC
	arm_func_end ov13_02228E6C

	arm_func_start ov13_02228EC0
ov13_02228EC0: @ 0x02228EC0
	push {r4, lr}
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
	ldr r2, _022290E0 @ =0x0224F4BC
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
	pop {r4, pc}
_02228F64:
	ldrb r3, [r0, #0x11d]
	ldr r1, _022290E4 @ =0x02245D68
	ldr r1, [r1, r3, lsl #2]
	ldrb r1, [r1, r4]
	strb r1, [r0, #0x11c]
	ldr r0, [r2]
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	popne {r4, pc}
	mov r0, #0
	bl ov13_0222936C
	pop {r4, pc}
_02228F94:
	sub r1, r4, #0x2f
	cmp r1, #4
	bge _0222902C
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02228FFC
_02228FAC: @ jump table
	b _02228FBC @ case 0
	b _02228FC4 @ case 1
	b _02228FCC @ case 2
	b _02228FE4 @ case 3
_02228FBC:
	bl ov13_02228C08
	pop {r4, pc}
_02228FC4:
	bl ov13_02228C38
	pop {r4, pc}
_02228FCC:
	ldrb r1, [r0, #0x124]
	cmp r1, #0
	bne _02228FFC
	mov r0, #9
	bl ov13_0223ABB8
	pop {r4, pc}
_02228FE4:
	ldrb r1, [r0, #0x123]
	cmp r1, #0
	bne _02228FFC
	mov r0, #9
	bl ov13_0223ABB8
	pop {r4, pc}
_02228FFC:
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	bne _02229010
	mov r0, #0
	bl ov13_0222936C
_02229010:
	ldr r1, _022290E8 @ =0x02245208
	sub r2, r4, #0x2f
	ldr r0, _022290E0 @ =0x0224F4BC
	ldrb r1, [r1, r2]
	ldr r0, [r0]
	strb r1, [r0, #0x11c]
	pop {r4, pc}
_0222902C:
	ldr r1, _022290EC @ =0x02244F58
	sub r2, r4, #0x33
	ldrb r1, [r1, r2]
	strb r1, [r0, #0x11c]
_0222903C:
	mov r0, #2
	bl ov13_022416D4
	cmp r0, #0
	beq _02229094
	ldr r0, _022290E0 @ =0x0224F4BC
	ldr r1, [r0]
	ldrb r0, [r1, #0x123]
	cmp r0, #0
	bne _02229088
	ldrb r0, [r1, #0x125]
	cmp r0, #0
	popne {r4, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _022290E0 @ =0x0224F4BC
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x125]
	pop {r4, pc}
_02229088:
	mov r0, #0x80
	strb r0, [r1, #0x11c]
	b _022290B4
_02229094:
	mov r0, #2
	bl ov13_02241714
	cmp r0, #0
	beq _022290B4
	ldr r0, _022290E0 @ =0x0224F4BC
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
	popeq {r4, pc}
	bl ov13_02228C38
	pop {r4, pc}
	.align 2, 0
_022290E0: .4byte 0x0224F4BC
_022290E4: .4byte 0x02245D68
_022290E8: .4byte 0x02245208
_022290EC: .4byte 0x02244F58
	arm_func_end ov13_02228EC0

	arm_func_start ov13_022290F0
ov13_022290F0: @ 0x022290F0
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r3, _02229350 @ =0x02244F60
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
	ldr r1, _02229354 @ =0x02244FA4
	ldr fp, _02229358 @ =0x0224F4BC
	ldr lr, _0222935C @ =0xC1FFFCFF
	ldr r8, _02229360 @ =0xFE00FF00
	and r7, sb, #0xff
_022291B4:
	ldr r2, [fp]
	lsl r3, r5, #2
	add r2, r2, r5, lsl #2
	ldr r2, [r2, #0x30]
	ldrh r3, [r1, r3]
	ldr ip, [r2]
	add r6, r6, #1
	and ip, ip, lr
	str ip, [r2]
	lsl r2, r3, #0x17
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
	ldr r1, _02229358 @ =0x0224F4BC
	ldr r3, _02229354 @ =0x02244FA4
	ldr r4, [r1]
	ldr r1, [sp, #4]
	mov r2, #2
	lsl r1, r1, #2
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
	bl FUN_020CCD3C
	add r3, sp, #0xd
	ldrb r1, [r3, sl]
	mov r5, #0
	cmp r1, #0
	ble _022292D4
	ldr r2, _02229364 @ =0x02244F84
	lsl r1, r0, #2
	ldrh r0, [r2, r1]
	ldr r8, _02229358 @ =0x0224F4BC
	ldr r6, _0222935C @ =0xC1FFFCFF
	ldr r7, _02229360 @ =0xFE00FF00
	and r4, sb, #0xff
	lsl r2, r0, #0x17
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
	pople {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, _02229368 @ =0x02244F7C
	ldr r4, _02229358 @ =0x0224F4BC
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
	lsl r1, r8, #2
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
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02229350: .4byte 0x02244F60
_02229354: .4byte 0x02244FA4
_02229358: .4byte 0x0224F4BC
_0222935C: .4byte 0xC1FFFCFF
_02229360: .4byte 0xFE00FF00
_02229364: .4byte 0x02244F84
_02229368: .4byte 0x02244F7C
	arm_func_end ov13_022290F0

	arm_func_start ov13_0222936C
ov13_0222936C: @ 0x0222936C
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _022293E8 @ =0x0224F4BC
	mov r5, #0
	ldr r1, [r1]
	mov r8, r0
	ldr sb, _022293EC @ =0x02244FA4
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
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022293E8: .4byte 0x0224F4BC
_022293EC: .4byte 0x02244FA4
	arm_func_end ov13_0222936C

	arm_func_start ov13_022293F0
ov13_022293F0: @ 0x022293F0
	push {r3, lr}
	cmp r0, #0
	poplt {r3, pc}
	cmp r0, #0x2f
	bge _0222943C
	ldr r2, _022294AC @ =0x0224F4BC
	ldr r3, _022294B0 @ =0x02244F4C
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
	pop {r3, pc}
_0222943C:
	sub ip, r0, #0x2f
	cmp ip, #4
	bge _02229480
	ldr r0, _022294AC @ =0x0224F4BC
	ldr r2, _022294B0 @ =0x02244F4C
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
	pop {r3, pc}
_02229480:
	ldr r2, _022294AC @ =0x0224F4BC
	ldr r3, _022294B4 @ =0x02244F50
	ldr r2, [r2]
	sub r0, r0, #0x33
	add r0, r2, r0, lsl #2
	ldrb r3, [r3, r1]
	ldr r0, [r0, #0xfc]
	mvn r1, #0
	mov r2, #0
	bl ov13_0223FE98
	pop {r3, pc}
	.align 2, 0
_022294AC: .4byte 0x0224F4BC
_022294B0: .4byte 0x02244F4C
_022294B4: .4byte 0x02244F50
	arm_func_end ov13_022293F0

	arm_func_start ov13_022294B8
ov13_022294B8: @ 0x022294B8
	push {r4, lr}
	ldr r0, _02229588 @ =0x0224F4BC
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x21]
	sub r0, r0, #0x2f
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0222951C
_022294DC: @ jump table
	b _022294F4 @ case 0
	b _022294FC @ case 1
	b _02229504 @ case 2
	b _0222950C @ case 3
	b _02229514 @ case 4
	b _02229514 @ case 5
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
	ldr r0, _02229588 @ =0x0224F4BC
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #2
	ldr r0, [r0, #0x114]
	bl ov13_02240008
	ldr r0, _02229588 @ =0x0224F4BC
	ldr r2, _0222958C @ =0x02245060
	ldr r3, [r0]
	mvn r1, #0
	add r0, r3, #0x100
	ldrsb ip, [r0, #0x21]
	ldr r0, [r3, #0x114]
	ldr r3, _02229590 @ =0x02245062
	lsl ip, ip, #2
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	bl ov13_0223FF18
	pop {r4, pc}
	.align 2, 0
_02229588: .4byte 0x0224F4BC
_0222958C: .4byte 0x02245060
_02229590: .4byte 0x02245062
	arm_func_end ov13_022294B8

	arm_func_start ov13_02229594
ov13_02229594: @ 0x02229594
	push {r3, lr}
	ldr r2, _022299C4 @ =0x0224F4BC
	ldr r3, _022299C8 @ =0x02245134
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
	strbeq lr, [r1, #0x120]
	beq _022299B4
	cmp r3, #0x33
	bne _022295EC
	cmp r0, #1
	cmpne r0, #3
	strbeq lr, [r1, #0x120]
	beq _022299B4
_022295EC:
	cmp r3, #0x34
	bne _0222960C
	cmp r0, #1
	cmpne r0, #3
	bne _0222960C
	cmp lr, #0x2e
	strbne lr, [r1, #0x120]
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
	strbeq r0, [r1, #0x121]
	movne r0, #0x22
	strbne r0, [r1, #0x121]
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
_02229670: @ jump table
	b _022296B4 @ case 0
	b _022296C0 @ case 1
	b _022296F0 @ case 2
	b _022296CC @ case 3
	b _022296D8 @ case 4
	b _022296E4 @ case 5
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
_02229730: @ jump table
	b _022297E8 @ case 0
	b _022297E8 @ case 1
	b _022297E8 @ case 2
	b _022297E8 @ case 3
	b _022297E8 @ case 4
	b _022297E8 @ case 5
	b _022297AC @ case 6
	b _022297B8 @ case 7
	b _022297E8 @ case 8
	b _022297C4 @ case 9
	b _022297D0 @ case 10
	b _022297DC @ case 11
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
_02229828: @ jump table
	b _0222986C @ case 0
	b _02229878 @ case 1
	b _022298A8 @ case 2
	b _02229884 @ case 3
	b _02229890 @ case 4
	b _0222989C @ case 5
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
_022298E8: @ jump table
	b _022299AC @ case 0
	b _022299AC @ case 1
	b _022299AC @ case 2
	b _022299AC @ case 3
	b _022299AC @ case 4
	b _022299AC @ case 5
	b _02229964 @ case 6
	b _02229970 @ case 7
	b _022299AC @ case 8
	b _0222997C @ case 9
	b _02229988 @ case 10
	b _02229994 @ case 11
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
	pop {r3, pc}
	.align 2, 0
_022299C4: .4byte 0x0224F4BC
_022299C8: .4byte 0x02245134
	arm_func_end ov13_02229594

	arm_func_start ov13_022299CC
ov13_022299CC: @ 0x022299CC
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02229A44 @ =0x0224F4BC
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0
	ldr r0, [r0, #0xfc]
	bl ov13_0223FDE0
	ldr r3, [r0]
	ldr r1, _02229A44 @ =0x0224F4BC
	ldr r0, _02229A48 @ =0x01FF0000
	and r2, r3, #0xff
	and r0, r3, r0
	lsr r3, r0, #0x10
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
	poplt {r4, pc}
	ldr r1, _02229A4C @ =ov13_02229A50
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02229A44: .4byte 0x0224F4BC
_02229A48: .4byte 0x01FF0000
_02229A4C: .4byte ov13_02229A50
	arm_func_end ov13_022299CC

	arm_func_start ov13_02229A50
ov13_02229A50: @ 0x02229A50
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02229AB8 @ =0x0224F4BC
	ldr r2, _02229ABC @ =0x01FF0000
	ldr r3, [r1]
	mov r4, r0
	ldr r1, [r3, #0xc0]
	ldrb r0, [r3, #0x11d]
	ldr ip, [r1]
	mov r1, #3
	and r3, ip, #0xff
	and ip, ip, r2
	add r2, r3, #0xc
	lsr r3, ip, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl ov13_022290F0
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _02229AC0 @ =ov13_02229AC4
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02229AB8: .4byte 0x0224F4BC
_02229ABC: .4byte 0x01FF0000
_02229AC0: .4byte ov13_02229AC4
	arm_func_end ov13_02229A50

	arm_func_start ov13_02229AC4
ov13_02229AC4: @ 0x02229AC4
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02229B2C @ =0x0224F4BC
	ldr r2, _02229B30 @ =0x01FF0000
	ldr r3, [r1]
	mov r4, r0
	ldr r1, [r3, #0x90]
	ldrb r0, [r3, #0x11d]
	ldr ip, [r1]
	mov r1, #2
	and r3, ip, #0xff
	and ip, ip, r2
	add r2, r3, #0xc
	lsr r3, ip, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl ov13_022290F0
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _02229B34 @ =ov13_02229B38
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02229B2C: .4byte 0x0224F4BC
_02229B30: .4byte 0x01FF0000
_02229B34: .4byte ov13_02229B38
	arm_func_end ov13_02229AC4

	arm_func_start ov13_02229B38
ov13_02229B38: @ 0x02229B38
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02229BA0 @ =0x0224F4BC
	ldr r2, _02229BA4 @ =0x01FF0000
	ldr r3, [r1]
	mov r4, r0
	ldr r1, [r3, #0x60]
	ldrb r0, [r3, #0x11d]
	ldr ip, [r1]
	mov r1, #1
	and r3, ip, #0xff
	and ip, ip, r2
	add r2, r3, #0xc
	lsr r3, ip, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl ov13_022290F0
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _02229BA8 @ =ov13_02229BAC
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02229BA0: .4byte 0x0224F4BC
_02229BA4: .4byte 0x01FF0000
_02229BA8: .4byte ov13_02229BAC
	arm_func_end ov13_02229B38

	arm_func_start ov13_02229BAC
ov13_02229BAC: @ 0x02229BAC
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02229C14 @ =0x0224F4BC
	ldr r2, _02229C18 @ =0x01FF0000
	ldr r3, [r1]
	mov r4, r0
	ldr r1, [r3, #0x30]
	ldrb r0, [r3, #0x11d]
	ldr ip, [r1]
	mov r1, #0
	and r3, ip, #0xff
	and ip, ip, r2
	add r2, r3, #0xc
	lsr r3, ip, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl ov13_022290F0
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _02229C1C @ =ov13_02229C20
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02229C14: .4byte 0x0224F4BC
_02229C18: .4byte 0x01FF0000
_02229C1C: .4byte ov13_02229C20
	arm_func_end ov13_02229BAC

	arm_func_start ov13_02229C20
ov13_02229C20: @ 0x02229C20
	push {r3, r4, r5, r6, r7, lr}
	mov r1, r0
	mov r0, #0
	bl ov13_022425D0
	mov r5, #0
	ldr r7, _02229CF8 @ =0x0224F4BC
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
	ldr r4, _02229CF8 @ =0x0224F4BC
	mov r5, #0
_02229C88:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0xfc]
	bl ov13_0223FD60
	add r5, r5, #1
	cmp r5, #2
	blt _02229C88
	ldr r4, _02229CF8 @ =0x0224F4BC
	mov r5, #0
_02229CAC:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0xec]
	bl ov13_02241D98
	add r5, r5, #1
	cmp r5, #4
	blt _02229CAC
	ldr r4, _02229CF8 @ =0x0224F4BC
	mov r5, #0
_02229CD0:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x30]
	bl ov13_02241D98
	add r5, r5, #1
	cmp r5, #0x2f
	blt _02229CD0
	ldr r0, _02229CFC @ =0x0224F4BC
	bl ov13_022412B0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02229CF8: .4byte 0x0224F4BC
_02229CFC: .4byte 0x0224F4BC
	arm_func_end ov13_02229C20

	arm_func_start ov13_02229D00
ov13_02229D00: @ 0x02229D00
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r0, _0222A020 @ =0x02245228
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
	ldr r8, _0222A024 @ =0x0224F4C0
	mov r6, #0
	mov r1, #0x1f
	str r0, [r8]
	strb r1, [r0, #0x60]
	ldr r0, [r8]
	mov r1, #1
	strb r6, [r0, #0x63]
	ldr r0, [r8]
	ldr r7, _0222A028 @ =0xC1FFFCFF
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
	ldr r5, _0222A02C @ =0x02245214
	ldr r8, _0222A024 @ =0x0224F4C0
	ldr r7, _0222A028 @ =0xC1FFFCFF
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
	ldr sb, _0222A030 @ =0x02245218
	ldr r4, _0222A024 @ =0x0224F4C0
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
	ldr fp, _0222A024 @ =0x0224F4C0
	mov sb, #0
	ldr r1, [fp]
	ldr r8, [sp, #0x10]
	ldr r7, _0222A034 @ =0x02245260
	str r0, [r1, sl, lsl #2]
	strh sb, [sp, #0x1c]
	mov r6, #2
	mov r5, #0x480
	add r4, sp, #0x14
_02229F18:
	lsl r0, r8, #1
	ldrh r2, [r7, r0]
	ldrh r0, [sp, #0x22]
	ldrh r1, [sp, #0x1c]
	strh r2, [sp, #0x14]
	stm sp, {r0, r6}
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
	ldr r2, _0222A024 @ =0x0224F4C0
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
	ldr r3, _0222A024 @ =0x0224F4C0
	mvn r1, #0
	ldr r4, [r3]
	mov r2, #0x200
	str r0, [r4, #0x58]
	ldr r0, [r3]
	mov r3, #0
	ldr r0, [r0, #0x58]
	bl ov13_0223FDF4
	ldr r0, _0222A024 @ =0x0224F4C0
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #2
	ldr r0, [r0, #0x58]
	bl ov13_02240008
	mov r0, #0
	ldr r1, _0222A038 @ =ov13_0222A0DC
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r2, _0222A024 @ =0x0224F4C0
	mov r1, #0xc0
	ldr r2, [r2]
	str r0, [r2, #0x5c]
	mov r0, #0
	bl ov13_0222AAFC
	add sp, sp, #0x24
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0222A020: .4byte 0x02245228
_0222A024: .4byte 0x0224F4C0
_0222A028: .4byte 0xC1FFFCFF
_0222A02C: .4byte 0x02245214
_0222A030: .4byte 0x02245218
_0222A034: .4byte 0x02245260
_0222A038: .4byte ov13_0222A0DC
	arm_func_end ov13_02229D00

	arm_func_start ov13_0222A03C
ov13_0222A03C: @ 0x0222A03C
	push {r3, lr}
	ldr r0, _0222A068 @ =0x0224F4C0
	ldr r0, [r0]
	ldr r0, [r0, #0x58]
	bl ov13_0223FD60
	ldr r0, _0222A068 @ =0x0224F4C0
	ldr r1, _0222A06C @ =ov13_0222AF5C
	ldr r0, [r0]
	ldr r0, [r0, #0x5c]
	bl ov13_022425C8
	pop {r3, pc}
	.align 2, 0
_0222A068: .4byte 0x0224F4C0
_0222A06C: .4byte ov13_0222AF5C
	arm_func_end ov13_0222A03C

	arm_func_start ov13_0222A070
ov13_0222A070: @ 0x0222A070
	ldr r0, _0222A080 @ =0x0224F4C0
	ldr r0, [r0]
	ldrb r0, [r0, #0x60]
	bx lr
	.align 2, 0
_0222A080: .4byte 0x0224F4C0
	arm_func_end ov13_0222A070

	arm_func_start ov13_0222A084
ov13_0222A084: @ 0x0222A084
	ldr r1, _0222A094 @ =0x0224F4C0
	ldr r1, [r1]
	strb r0, [r1, #0x66]
	bx lr
	.align 2, 0
_0222A094: .4byte 0x0224F4C0
	arm_func_end ov13_0222A084

	arm_func_start ov13_0222A098
ov13_0222A098: @ 0x0222A098
	ldr r1, _0222A0A8 @ =0x0224F4C0
	ldr r1, [r1]
	strb r0, [r1, #0x67]
	bx lr
	.align 2, 0
_0222A0A8: .4byte 0x0224F4C0
	arm_func_end ov13_0222A098

	arm_func_start ov13_0222A0AC
ov13_0222A0AC: @ 0x0222A0AC
	ldr r1, _0222A0BC @ =0x0224F4C0
	ldr r1, [r1]
	strb r0, [r1, #0x68]
	bx lr
	.align 2, 0
_0222A0BC: .4byte 0x0224F4C0
	arm_func_end ov13_0222A0AC

	arm_func_start ov13_0222A0C0
ov13_0222A0C0: @ 0x0222A0C0
	ldr r0, _0222A0D8 @ =0x0224F4C0
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_0222A0D8: .4byte 0x0224F4C0
	arm_func_end ov13_0222A0C0

	arm_func_start ov13_0222A0DC
ov13_0222A0DC: @ 0x0222A0DC
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _0222A154 @ =0x0224F4C0
	mov r4, r0
	ldr r2, [r2]
	ldr r1, _0222A158 @ =0x01FF0000
	ldr r0, [r2, #0x10]
	ldr r0, [r0]
	and r2, r0, r1
	and r0, r0, #0xff
	sub r1, r0, #0xc
	lsr r0, r2, #0x10
	str r0, [sp, #4]
	str r1, [sp]
	cmp r1, #0x4c
	mov r0, #0
	ble _0222A12C
	bl ov13_0222AAFC
	add sp, sp, #8
	pop {r4, pc}
_0222A12C:
	mov r1, #0x4c
	bl ov13_0222AAFC
	mov r0, #1
	mov r1, #0xc0
	bl ov13_0222AAFC
	ldr r1, _0222A15C @ =ov13_0222A160
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0222A154: .4byte 0x0224F4C0
_0222A158: .4byte 0x01FF0000
_0222A15C: .4byte ov13_0222A160
	arm_func_end ov13_0222A0DC

	arm_func_start ov13_0222A160
ov13_0222A160: @ 0x0222A160
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _0222A1D8 @ =0x0224F4C0
	mov r4, r0
	ldr r2, [r2]
	ldr r1, _0222A1DC @ =0x01FF0000
	ldr r0, [r2, #0x1c]
	ldr r0, [r0]
	and r2, r0, r1
	and r0, r0, #0xff
	sub r1, r0, #0xc
	lsr r0, r2, #0x10
	str r0, [sp, #4]
	str r1, [sp]
	cmp r1, #0x63
	mov r0, #1
	ble _0222A1B0
	bl ov13_0222AAFC
	add sp, sp, #8
	pop {r4, pc}
_0222A1B0:
	mov r1, #0x63
	bl ov13_0222AAFC
	mov r0, #2
	mov r1, #0xc0
	bl ov13_0222AAFC
	ldr r1, _0222A1E0 @ =ov13_0222A1E4
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0222A1D8: .4byte 0x0224F4C0
_0222A1DC: .4byte 0x01FF0000
_0222A1E0: .4byte ov13_0222A1E4
	arm_func_end ov13_0222A160

	arm_func_start ov13_0222A1E4
ov13_0222A1E4: @ 0x0222A1E4
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _0222A25C @ =0x0224F4C0
	mov r4, r0
	ldr r2, [r2]
	ldr r1, _0222A260 @ =0x01FF0000
	ldr r0, [r2, #0x28]
	ldr r0, [r0]
	and r2, r0, r1
	and r0, r0, #0xff
	sub r1, r0, #0xc
	lsr r0, r2, #0x10
	str r0, [sp, #4]
	str r1, [sp]
	cmp r1, #0x7a
	mov r0, #2
	ble _0222A234
	bl ov13_0222AAFC
	add sp, sp, #8
	pop {r4, pc}
_0222A234:
	mov r1, #0x7a
	bl ov13_0222AAFC
	mov r0, #3
	mov r1, #0xc0
	bl ov13_0222AAFC
	ldr r1, _0222A264 @ =ov13_0222A268
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0222A25C: .4byte 0x0224F4C0
_0222A260: .4byte 0x01FF0000
_0222A264: .4byte ov13_0222A268
	arm_func_end ov13_0222A1E4

	arm_func_start ov13_0222A268
ov13_0222A268: @ 0x0222A268
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _0222A2E0 @ =0x0224F4C0
	mov r4, r0
	ldr r2, [r2]
	ldr r1, _0222A2E4 @ =0x01FF0000
	ldr r0, [r2, #0x34]
	ldr r0, [r0]
	and r2, r0, r1
	and r0, r0, #0xff
	sub r1, r0, #0xc
	lsr r0, r2, #0x10
	str r0, [sp, #4]
	str r1, [sp]
	cmp r1, #0x91
	mov r0, #3
	ble _0222A2B8
	bl ov13_0222AAFC
	add sp, sp, #8
	pop {r4, pc}
_0222A2B8:
	mov r1, #0x91
	bl ov13_0222AAFC
	mov r0, #4
	mov r1, #0xc0
	bl ov13_0222AAFC
	ldr r1, _0222A2E8 @ =ov13_0222A2EC
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0222A2E0: .4byte 0x0224F4C0
_0222A2E4: .4byte 0x01FF0000
_0222A2E8: .4byte ov13_0222A2EC
	arm_func_end ov13_0222A268

	arm_func_start ov13_0222A2EC
ov13_0222A2EC: @ 0x0222A2EC
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0222A358 @ =0x0224F4C0
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
	pop {r4, pc}
_0222A338:
	mov r1, #0xaa
	bl ov13_0222AAFC
	bl ov13_0222AE24
	ldr r1, _0222A35C @ =ov13_0222A360
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0222A358: .4byte 0x0224F4C0
_0222A35C: .4byte ov13_0222A360
	arm_func_end ov13_0222A2EC

	arm_func_start ov13_0222A360
ov13_0222A360: @ 0x0222A360
	push {r3, lr}
	bl ov13_0222A378
	bl ov13_0222A554
	bl ov13_0222A724
	bl ov13_0222A960
	pop {r3, pc}
	arm_func_end ov13_0222A360

	arm_func_start ov13_0222A378
ov13_0222A378: @ 0x0222A378
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _0222A534 @ =0x02245958
	bl ov13_022417DC
	cmp r0, #0
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r0, _0222A538 @ =0x0224F4C0
	mvn r1, #0
	ldr r0, [r0]
	ldr r7, _0222A53C @ =0x0224527A
	ldr r6, _0222A540 @ =0x02245228
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
	ldr r0, _0222A538 @ =0x0224F4C0
	ldr r0, [r0]
	ldrb r0, [r0, #0x67]
	cmp r0, #0
	bne _0222A3F8
	mov r0, #9
	bl ov13_0223ABB8
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222A3F8:
	mov r0, #0
	bl ov13_0223ABB8
	ldr r0, _0222A538 @ =0x0224F4C0
	add sp, sp, #8
	ldr r0, [r0]
	strb r4, [r0, #0x61]
	pop {r3, r4, r5, r6, r7, pc}
_0222A414:
	add r4, r4, #1
	cmp r4, #0xa
	add r7, r7, #4
	blt _0222A3B4
	ldr r7, _0222A544 @ =0x02245250
	ldr r6, _0222A548 @ =0x02245230
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
	ldr r0, _0222A538 @ =0x0224F4C0
	ldr r0, [r0]
	ldrb r0, [r0, #0x66]
	cmp r0, #0
	beq _0222A48C
_0222A470:
	cmp r4, #1
	bne _0222A49C
	ldr r0, _0222A538 @ =0x0224F4C0
	ldr r0, [r0]
	ldrb r0, [r0, #0x68]
	cmp r0, #0
	bne _0222A49C
_0222A48C:
	mov r0, #9
	bl ov13_0223ABB8
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222A49C:
	mov r0, #0
	bl ov13_0223ABB8
	ldr r0, _0222A538 @ =0x0224F4C0
	add r1, r4, #0xa
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x61]
	pop {r3, r4, r5, r6, r7, pc}
_0222A4BC:
	add r4, r4, #1
	cmp r4, #2
	add r7, r7, #4
	blt _0222A434
	ldr r6, _0222A54C @ =0x02245258
	ldr r5, _0222A550 @ =0x02245234
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
	ldr r0, _0222A538 @ =0x0224F4C0
	add r1, r7, #0xc
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x61]
	pop {r3, r4, r5, r6, r7, pc}
_0222A51C:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _0222A4DC
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222A534: .4byte 0x02245958
_0222A538: .4byte 0x0224F4C0
_0222A53C: .4byte 0x0224527A
_0222A540: .4byte 0x02245228
_0222A544: .4byte 0x02245250
_0222A548: .4byte 0x02245230
_0222A54C: .4byte 0x02245258
_0222A550: .4byte 0x02245234
	arm_func_end ov13_0222A378

	arm_func_start ov13_0222A554
ov13_0222A554: @ 0x0222A554
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r1, _0222A6F8 @ =0x0224F4C0
	ldr r0, _0222A6FC @ =0x02245958
	ldr r1, [r1]
	mov r2, #0
	strb r2, [r1, #0x60]
	bl ov13_022418EC
	cmp r0, #0
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r7, _0222A700 @ =0x0224527A
	ldr r6, _0222A704 @ =0x02245228
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
	ldr r0, _0222A6F8 @ =0x0224F4C0
	ldr r2, [r0]
	ldrsb r1, [r2, #0x61]
	cmp r1, r4
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldr r1, _0222A708 @ =0x02245314
	ldrb r1, [r1, r4]
	strb r1, [r2, #0x60]
	ldr r0, [r0]
	strb r4, [r0, #0x63]
	bl ov13_0222AE24
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222A5E8:
	add r4, r4, #1
	cmp r4, #0xa
	add r7, r7, #4
	blt _0222A590
	ldr r7, _0222A70C @ =0x02245250
	ldr r6, _0222A710 @ =0x02245230
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
	ldr r0, _0222A6F8 @ =0x0224F4C0
	add r2, r4, #0xa
	ldr r3, [r0]
	ldrsb r1, [r3, #0x61]
	cmp r1, r2
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldr r1, _0222A714 @ =0x02245224
	ldrb r1, [r1, r4]
	strb r1, [r3, #0x60]
	ldr r0, [r0]
	strb r2, [r0, #0x63]
	bl ov13_0222AE24
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222A664:
	add r4, r4, #1
	cmp r4, #2
	add r7, r7, #4
	blt _0222A608
	ldr r7, _0222A718 @ =0x02245258
	ldr r6, _0222A71C @ =0x02245234
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
	ldr r0, _0222A6F8 @ =0x0224F4C0
	add r2, r4, #0xc
	ldr r3, [r0]
	ldrsb r1, [r3, #0x61]
	cmp r1, r2
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldr r1, _0222A720 @ =0x02245220
	ldrb r1, [r1, r4]
	strb r1, [r3, #0x60]
	ldr r0, [r0]
	strb r2, [r0, #0x63]
	bl ov13_0222AE24
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222A6E0:
	add r4, r4, #1
	cmp r4, #2
	add r7, r7, #4
	blt _0222A684
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222A6F8: .4byte 0x0224F4C0
_0222A6FC: .4byte 0x02245958
_0222A700: .4byte 0x0224527A
_0222A704: .4byte 0x02245228
_0222A708: .4byte 0x02245314
_0222A70C: .4byte 0x02245250
_0222A710: .4byte 0x02245230
_0222A714: .4byte 0x02245224
_0222A718: .4byte 0x02245258
_0222A71C: .4byte 0x02245234
_0222A720: .4byte 0x02245220
	arm_func_end ov13_0222A554

	arm_func_start ov13_0222A724
ov13_0222A724: @ 0x0222A724
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _0222A8F4 @ =0x02245958
	bl ov13_02241754
	cmp r0, #0
	beq _0222A8D4
	ldr r7, _0222A8F8 @ =0x0224527A
	ldr r5, _0222A8FC @ =0x02245228
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
	ldr r0, _0222A900 @ =0x0224F4C0
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
	ldr r6, _0222A904 @ =0x02245250
	ldr r5, _0222A908 @ =0x02245230
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
	ldr r1, _0222A900 @ =0x0224F4C0
	add r0, r7, #0xa
	ldr r1, [r1]
	ldrsb r1, [r1, #0x61]
	cmp r1, r0
	bne _0222A8D4
	bl ov13_0222A914
	cmp r7, #0
	bne _0222A8DC
	ldr r0, _0222A900 @ =0x0224F4C0
	ldr r2, [r0]
	ldrb r1, [r2, #0x65]
	add r1, r1, #1
	strb r1, [r2, #0x65]
	ldr r2, [r0]
	ldrb r1, [r2, #0x65]
	cmp r1, #0x28
	addlo sp, sp, #8
	poplo {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r2, #0x66]
	cmp r1, #0
	bne _0222A844
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _0222A900 @ =0x0224F4C0
	mvn r1, #0
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x61]
	pop {r3, r4, r5, r6, r7, pc}
_0222A844:
	mov r1, #0x10
	strb r1, [r2, #0x60]
	ldr r1, [r0]
	add sp, sp, #8
	ldrb r0, [r1, #0x65]
	sub r0, r0, #7
	strb r0, [r1, #0x65]
	pop {r3, r4, r5, r6, r7, pc}
_0222A864:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _0222A7AC
	ldr r6, _0222A90C @ =0x02245258
	ldr r5, _0222A910 @ =0x02245234
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
	ldr r1, _0222A900 @ =0x0224F4C0
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
	ldr r0, _0222A900 @ =0x0224F4C0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x65]
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222A8F4: .4byte 0x02245958
_0222A8F8: .4byte 0x0224527A
_0222A8FC: .4byte 0x02245228
_0222A900: .4byte 0x0224F4C0
_0222A904: .4byte 0x02245250
_0222A908: .4byte 0x02245230
_0222A90C: .4byte 0x02245258
_0222A910: .4byte 0x02245234
	arm_func_end ov13_0222A724

	arm_func_start ov13_0222A914
ov13_0222A914: @ 0x0222A914
	push {r4, lr}
	ldr r1, _0222A95C @ =0x0224F4C0
	mov r4, r0
	ldr r1, [r1]
	ldrsb r1, [r1, #0x62]
	cmp r4, r1
	popeq {r4, pc}
	mov r1, #1
	bl ov13_0222AD5C
	ldr r0, _0222A95C @ =0x0224F4C0
	mov r1, #0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x62]
	bl ov13_0222AD5C
	ldr r0, _0222A95C @ =0x0224F4C0
	ldr r0, [r0]
	strb r4, [r0, #0x62]
	pop {r4, pc}
	.align 2, 0
_0222A95C: .4byte 0x0224F4C0
	arm_func_end ov13_0222A914

	arm_func_start ov13_0222A960
ov13_0222A960: @ 0x0222A960
	push {r3, lr}
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
	ldr r0, _0222AAEC @ =0x0224F4C0
	ldr r0, [r0]
	ldrsb r2, [r0, #0x63]
	cmp r2, #0xa
	bge _0222AA10
	ldrb r1, [r0, #0x67]
	cmp r1, #0
	beq _0222AA04
	ldr r1, _0222AAF0 @ =0x02245314
	ldrb r1, [r1, r2]
	strb r1, [r0, #0x60]
	pop {r3, pc}
_0222AA04:
	mov r0, #9
	bl ov13_0223ABB8
	pop {r3, pc}
_0222AA10:
	sub r1, r2, #0xa
	cmp r1, #2
	bge _0222AA60
	cmp r1, #0
	ldrbeq r1, [r0, #0x66]
	cmpeq r1, #0
	beq _0222AA40
	sub r1, r2, #0xa
	cmp r1, #1
	ldrbeq r1, [r0, #0x68]
	cmpeq r1, #0
	bne _0222AA4C
_0222AA40:
	mov r0, #9
	bl ov13_0223ABB8
	pop {r3, pc}
_0222AA4C:
	ldr r1, _0222AAF4 @ =0x02245224
	sub r2, r2, #0xa
	ldrb r1, [r1, r2]
	strb r1, [r0, #0x60]
	pop {r3, pc}
_0222AA60:
	ldr r1, _0222AAF8 @ =0x02245220
	sub r2, r2, #0xc
	ldrb r1, [r1, r2]
	strb r1, [r0, #0x60]
_0222AA70:
	mov r0, #2
	bl ov13_022416D4
	cmp r0, #0
	beq _0222AAC8
	ldr r0, _0222AAEC @ =0x0224F4C0
	ldr r1, [r0]
	ldrb r0, [r1, #0x66]
	cmp r0, #0
	bne _0222AABC
	ldrb r0, [r1, #0x69]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _0222AAEC @ =0x0224F4C0
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x69]
	pop {r3, pc}
_0222AABC:
	mov r0, #0x10
	strb r0, [r1, #0x60]
	pop {r3, pc}
_0222AAC8:
	mov r0, #2
	bl ov13_02241714
	cmp r0, #0
	popeq {r3, pc}
	ldr r0, _0222AAEC @ =0x0224F4C0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x69]
	pop {r3, pc}
	.align 2, 0
_0222AAEC: .4byte 0x0224F4C0
_0222AAF0: .4byte 0x02245314
_0222AAF4: .4byte 0x02245224
_0222AAF8: .4byte 0x02245220
	arm_func_end ov13_0222A960

	arm_func_start ov13_0222AAFC
ov13_0222AAFC: @ 0x0222AAFC
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r2, _0222AD40 @ =0x02245228
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
	ldr r0, _0222AD44 @ =0x0224527A
	ldr fp, _0222AD48 @ =0x0224F4C0
	ldr r7, _0222AD4C @ =0xC1FFFCFF
	ldr r8, _0222AD50 @ =0xFE00FF00
	and r6, sb, #0xff
_0222ABB8:
	ldr r1, [fp]
	lsl r2, r4, #2
	add r1, r1, r4, lsl #2
	ldr r1, [r1, #0x10]
	ldrh r2, [r0, r2]
	ldr ip, [r1]
	add r5, r5, #1
	and ip, ip, r7
	str ip, [r1]
	ldr ip, [fp]
	lsl r1, r2, #0x17
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
	ldr r0, _0222AD48 @ =0x0224F4C0
	ldr r1, _0222AD44 @ =0x0224527A
	ldr r3, [r0]
	lsl r0, lr, #2
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
	ldr r0, _0222AD54 @ =0x02245250
	ldr r8, _0222AD48 @ =0x0224F4C0
	ldr r6, _0222AD4C @ =0xC1FFFCFF
	ldr r7, _0222AD50 @ =0xFE00FF00
	and r4, sb, #0xff
_0222AC70:
	ldr r1, [r8]
	lsl r2, r5, #2
	add r1, r1, r5, lsl #2
	ldr fp, [r1, #0x38]
	ldrh r1, [r0, r2]
	ldr r2, [fp]
	and r2, r2, r6
	str r2, [fp]
	ldr r2, [r8]
	lsl r1, r1, #0x17
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
	pople {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, _0222AD58 @ =0x02245258
	ldr r4, _0222AD48 @ =0x0224F4C0
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
	lsl r1, r8, #2
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
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0222AD40: .4byte 0x02245228
_0222AD44: .4byte 0x0224527A
_0222AD48: .4byte 0x0224F4C0
_0222AD4C: .4byte 0xC1FFFCFF
_0222AD50: .4byte 0xFE00FF00
_0222AD54: .4byte 0x02245250
_0222AD58: .4byte 0x02245258
	arm_func_end ov13_0222AAFC

	arm_func_start ov13_0222AD5C
ov13_0222AD5C: @ 0x0222AD5C
	push {r3, lr}
	cmp r0, #0
	poplt {r3, pc}
	cmp r0, #0xa
	bge _0222ADA8
	ldr r2, _0222AE18 @ =0x0224F4C0
	ldr r3, _0222AE1C @ =0x0224521C
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
	pop {r3, pc}
_0222ADA8:
	sub ip, r0, #0xa
	cmp ip, #2
	bge _0222ADEC
	ldr r0, _0222AE18 @ =0x0224F4C0
	ldr r2, _0222AE1C @ =0x0224521C
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
	pop {r3, pc}
_0222ADEC:
	ldr r2, _0222AE18 @ =0x0224F4C0
	ldr r3, _0222AE20 @ =0x02245210
	ldr r2, [r2]
	sub r0, r0, #0xc
	add r0, r2, r0, lsl #2
	ldrb r3, [r3, r1]
	ldr r0, [r0, #0x40]
	mvn r1, #0
	mov r2, #0
	bl ov13_0223FE98
	pop {r3, pc}
	.align 2, 0
_0222AE18: .4byte 0x0224F4C0
_0222AE1C: .4byte 0x0224521C
_0222AE20: .4byte 0x02245210
	arm_func_end ov13_0222AD5C

	arm_func_start ov13_0222AE24
ov13_0222AE24: @ 0x0222AE24
	push {r4, lr}
	ldr r0, _0222AEA4 @ =0x0224F4C0
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
	ldr r0, _0222AEA4 @ =0x0224F4C0
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #2
	ldr r0, [r0, #0x58]
	bl ov13_02240008
	ldr r0, _0222AEA4 @ =0x0224F4C0
	ldr r2, _0222AEA8 @ =0x022452A2
	ldr r0, [r0]
	ldr r3, _0222AEAC @ =0x022452A4
	ldrsb ip, [r0, #0x63]
	ldr r0, [r0, #0x58]
	mvn r1, #0
	lsl ip, ip, #2
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	bl ov13_0223FF18
	pop {r4, pc}
	.align 2, 0
_0222AEA4: .4byte 0x0224F4C0
_0222AEA8: .4byte 0x022452A2
_0222AEAC: .4byte 0x022452A4
	arm_func_end ov13_0222AE24

	arm_func_start ov13_0222AEB0
ov13_0222AEB0: @ 0x0222AEB0
	push {r3, lr}
	ldr r1, _0222AF54 @ =0x0224F4C0
	ldr r2, _0222AF58 @ =0x022452DA
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
	strbeq ip, [r2, #0x64]
	beq _0222AF44
_0222AEF0:
	mvn r0, #0
	cmp r1, r0
	bne _0222AF1C
	ldrsb r0, [r2, #0x64]
	cmp r0, #1
	cmpne r0, #0xa
	moveq r0, #0xa
	strbeq r0, [r2, #0x63]
	movne r0, #0xb
	strbne r0, [r2, #0x63]
	b _0222AF44
_0222AF1C:
	sub r0, r0, #1
	cmp r1, r0
	bne _0222AF44
	ldrsb r0, [r2, #0x64]
	cmp r0, #1
	cmpne r0, #0xa
	moveq r0, #1
	strbeq r0, [r2, #0x63]
	movne r0, #2
	strbne r0, [r2, #0x63]
_0222AF44:
	bl ov13_0222AE24
	mov r0, #8
	bl ov13_0223ABB8
	pop {r3, pc}
	.align 2, 0
_0222AF54: .4byte 0x0224F4C0
_0222AF58: .4byte 0x022452DA
	arm_func_end ov13_0222AEB0

	arm_func_start ov13_0222AF5C
ov13_0222AF5C: @ 0x0222AF5C
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0222AFC8 @ =0x0224F4C0
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0
	ldr r0, [r0, #0x40]
	bl ov13_0223FDE0
	ldr r2, [r0]
	ldr r0, _0222AFCC @ =0x01FF0000
	and r1, r2, #0xff
	and r0, r2, r0
	lsr r2, r0, #0x10
	add r1, r1, #0xc
	str r1, [sp]
	mov r0, #4
	str r2, [sp, #4]
	bl ov13_0222AAFC
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _0222AFD0 @ =ov13_0222AFD4
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0222AFC8: .4byte 0x0224F4C0
_0222AFCC: .4byte 0x01FF0000
_0222AFD0: .4byte ov13_0222AFD4
	arm_func_end ov13_0222AF5C

	arm_func_start ov13_0222AFD4
ov13_0222AFD4: @ 0x0222AFD4
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0222B038 @ =0x0224F4C0
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _0222B03C @ =0x01FF0000
	ldr r2, [r0, #0x34]
	mov r0, #3
	ldr r3, [r2]
	and r2, r3, #0xff
	and r3, r3, r1
	add r1, r2, #0xc
	lsr r2, r3, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	bl ov13_0222AAFC
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _0222B040 @ =ov13_0222B044
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0222B038: .4byte 0x0224F4C0
_0222B03C: .4byte 0x01FF0000
_0222B040: .4byte ov13_0222B044
	arm_func_end ov13_0222AFD4

	arm_func_start ov13_0222B044
ov13_0222B044: @ 0x0222B044
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0222B0A8 @ =0x0224F4C0
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _0222B0AC @ =0x01FF0000
	ldr r2, [r0, #0x28]
	mov r0, #2
	ldr r3, [r2]
	and r2, r3, #0xff
	and r3, r3, r1
	add r1, r2, #0xc
	lsr r2, r3, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	bl ov13_0222AAFC
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _0222B0B0 @ =ov13_0222B0B4
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0222B0A8: .4byte 0x0224F4C0
_0222B0AC: .4byte 0x01FF0000
_0222B0B0: .4byte ov13_0222B0B4
	arm_func_end ov13_0222B044

	arm_func_start ov13_0222B0B4
ov13_0222B0B4: @ 0x0222B0B4
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0222B118 @ =0x0224F4C0
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _0222B11C @ =0x01FF0000
	ldr r2, [r0, #0x1c]
	mov r0, #1
	ldr r3, [r2]
	and r2, r3, #0xff
	and r3, r3, r1
	add r1, r2, #0xc
	lsr r2, r3, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	bl ov13_0222AAFC
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _0222B120 @ =ov13_0222B124
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0222B118: .4byte 0x0224F4C0
_0222B11C: .4byte 0x01FF0000
_0222B120: .4byte ov13_0222B124
	arm_func_end ov13_0222B0B4

	arm_func_start ov13_0222B124
ov13_0222B124: @ 0x0222B124
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0222B188 @ =0x0224F4C0
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _0222B18C @ =0x01FF0000
	ldr r2, [r0, #0x10]
	mov r0, #0
	ldr r3, [r2]
	and r2, r3, #0xff
	and r3, r3, r1
	add r1, r2, #0xc
	lsr r2, r3, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	bl ov13_0222AAFC
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _0222B190 @ =ov13_0222B194
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0222B188: .4byte 0x0224F4C0
_0222B18C: .4byte 0x01FF0000
_0222B190: .4byte ov13_0222B194
	arm_func_end ov13_0222B124

	arm_func_start ov13_0222B194
ov13_0222B194: @ 0x0222B194
	push {r3, r4, r5, lr}
	mov r1, r0
	mov r0, #0
	bl ov13_022425D0
	ldr r4, _0222B24C @ =0x0224F4C0
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
	ldr r4, _0222B24C @ =0x0224F4C0
	mov r5, #0
_0222B1DC:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x40]
	bl ov13_0223FD60
	add r5, r5, #1
	cmp r5, #2
	blt _0222B1DC
	ldr r4, _0222B24C @ =0x0224F4C0
	mov r5, #0
_0222B200:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x38]
	bl ov13_02241D98
	add r5, r5, #1
	cmp r5, #2
	blt _0222B200
	ldr r4, _0222B24C @ =0x0224F4C0
	mov r5, #0
_0222B224:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x10]
	bl ov13_02241D98
	add r5, r5, #1
	cmp r5, #0xa
	blt _0222B224
	ldr r0, _0222B250 @ =0x0224F4C0
	bl ov13_022412B0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222B24C: .4byte 0x0224F4C0
_0222B250: .4byte 0x0224F4C0
	arm_func_end ov13_0222B194

	arm_func_start ov13_0222B254
ov13_0222B254: @ 0x0222B254
	stmdb sp!, {lr}
	sub sp, sp, #0x104
	mov r0, #0x26c
	mov r1, #4
	bl ov13_0224128C
	ldr r3, _0222B354 @ =0x0224F4C4
	add r1, sp, #0
	str r0, [r3, #4]
	mov r0, #0
	mov r2, #0x104
	strb r0, [r3]
	bl FUN_020D4790
	mov r3, #0x50
	mov r2, #0xc
	ldr r0, _0222B358 @ =0x02245320
	add r1, sp, #4
	strb r3, [sp]
	strh r2, [sp, #2]
	bl FUN_020D4A50
	ldr r0, _0222B354 @ =0x0224F4C4
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
	ldr r1, _0222B354 @ =0x0224F4C4
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
	bl FUN_020D3C40
	ldr r0, _0222B35C @ =ov13_0222B414
	ldr r1, _0222B360 @ =ov13_0222B424
	blx ov13_02222C1C
	cmp r0, #0
	addeq sp, sp, #0x104
	ldmeq sp!, {pc}
	bl FUN_020D3F48
	add sp, sp, #0x104
	ldm sp!, {pc}
	.align 2, 0
_0222B354: .4byte 0x0224F4C4
_0222B358: .4byte 0x02245320
_0222B35C: .4byte ov13_0222B414
_0222B360: .4byte ov13_0222B424
	arm_func_end ov13_0222B254

	arm_func_start ov13_0222B364
ov13_0222B364: @ 0x0222B364
	push {r4, lr}
	mov r4, r0
	blx ov13_02222CE0
	cmp r4, #0
	beq _0222B3A0
	ldr r0, _0222B3AC @ =0x0224F4C4
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x116]
	cmp r1, #0
	ldrbeq r0, [r0]
	cmpeq r0, #1
	bne _0222B3A0
	add r0, r2, #0x17
	add r0, r0, #0x100
	bl ov13_0223A6E4
_0222B3A0:
	ldr r0, _0222B3B0 @ =0x0224F4C8
	bl ov13_022412B0
	pop {r4, pc}
	.align 2, 0
_0222B3AC: .4byte 0x0224F4C4
_0222B3B0: .4byte 0x0224F4C8
	arm_func_end ov13_0222B364

	arm_func_start ov13_0222B3B4
ov13_0222B3B4: @ 0x0222B3B4
	push {r3, lr}
	ldr r0, _0222B410 @ =0x0224F4C4
	ldr r0, [r0, #4]
	blx ov13_02220908
	cmp r0, #0
	bne _0222B3DC
	ldr r1, _0222B410 @ =0x0224F4C4
	mov r0, #1
	strb r0, [r1]
	pop {r3, pc}
_0222B3DC:
	ldr r0, _0222B410 @ =0x0224F4C4
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
	pop {r3, pc}
_0222B408:
	mov r0, #2
	pop {r3, pc}
	.align 2, 0
_0222B410: .4byte 0x0224F4C4
	arm_func_end ov13_0222B3B4

	arm_func_start ov13_0222B414
ov13_0222B414: @ 0x0222B414
	ldr ip, _0222B420 @ =ov13_0224128C
	mov r1, #0x20
	bx ip
	.align 2, 0
_0222B420: .4byte ov13_0224128C
	arm_func_end ov13_0222B414

	arm_func_start ov13_0222B424
ov13_0222B424: @ 0x0222B424
	ldr ip, _0222B42C @ =ov13_022412F4
	bx ip
	.align 2, 0
_0222B42C: .4byte ov13_022412F4
	arm_func_end ov13_0222B424

	arm_func_start ov13_0222B430
ov13_0222B430: @ 0x0222B430
	push {r3, r4, r5, lr}
	ldr r3, _0222B4B4 @ =0x0224F4CC
	str r0, [r3, #4]
	mov r0, r1
	mov r1, r2
	bl ov13_0222B4BC
	cmp r0, #0
	mvneq r0, #0
	popeq {r3, r4, r5, pc}
	ldr r0, _0222B4B4 @ =0x0224F4CC
	mov r1, #0
	strb r1, [r0, #1]
	bl ov13_0222B558
	bl ov13_0222B620
	bl ov13_0223AAFC
	ldr r0, _0222B4B8 @ =ov13_0222C1BC
	bl ov13_0222B8E8
	ldr r4, _0222B4B4 @ =0x0224F4CC
	mov r5, #0
_0222B47C:
	bl ov13_022413E4
	ldr r0, [r4, #0xc]
	blx r0
	mov r0, r5
	bl ov13_02242478
	bl ov13_02241A44
	bl ov13_022422E0
	bl FUN_020D3AB4
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0222B47C
	bl ov13_0222B898
	mov r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222B4B4: .4byte 0x0224F4CC
_0222B4B8: .4byte ov13_0222C1BC
	arm_func_end ov13_0222B430

	arm_func_start ov13_0222B4BC
ov13_0222B4BC: @ 0x0222B4BC
	ldr r2, _0222B554 @ =0x0224F4CC
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
	lsr r1, r1, #4
	bics r1, r1, #2
	movne r0, #0
	bxne lr
_0222B4F8:
	ldr r1, _0222B554 @ =0x0224F4CC
	ldr r1, [r1, #8]
	lsl r2, r1, #0x1c
	lsr r2, r2, #0x1c
	cmp r2, #1
	movhi r0, #0
	bxhi lr
	cmp r0, #0
	beq _0222B52C
	lsr r1, r1, #4
	tst r1, #1
	movne r0, #0
	bxne lr
_0222B52C:
	cmp r0, #0
	bne _0222B54C
	ldr r0, _0222B554 @ =0x0224F4CC
	ldr r0, [r0, #8]
	lsr r0, r0, #4
	tst r0, #1
	moveq r0, #0
	bxeq lr
_0222B54C:
	mov r0, #1
	bx lr
	.align 2, 0
_0222B554: .4byte 0x0224F4CC
	arm_func_end ov13_0222B4BC

	arm_func_start ov13_0222B558
ov13_0222B558: @ 0x0222B558
	push {r3, lr}
	ldr r2, _0222B614 @ =0x04000208
	mov r0, #0
	ldrh r1, [r2]
	strh r0, [r2]
	bl FUN_020CD978
	ldr r1, _0222B618 @ =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	bl FUN_020D3438
	cmp r0, #0
	bne _0222B590
	bl FUN_020D3F48
_0222B590:
	bl FUN_020D369C
	cmp r0, #0
	bne _0222B5A0
	bl FUN_020D3F48
_0222B5A0:
	mov r0, #0
	bl FUN_020CD944
	bl FUN_020CD784
	mvn r0, #0
	bl FUN_020D7F60
	bl FUN_020D9EF0
	bl FUN_020DB9C0
	bl FUN_020CD978
	ldr r1, _0222B618 @ =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	bl ov13_022420A0
	ldr r0, _0222B61C @ =0x0224F4CC
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
	bl FUN_0209EFF8
	add r0, sp, #0
	bl ov13_022412B0
	pop {r3, pc}
	.align 2, 0
_0222B614: .4byte 0x04000208
_0222B618: .4byte 0x04001000
_0222B61C: .4byte 0x0224F4CC
	arm_func_end ov13_0222B558

	arm_func_start ov13_0222B620
ov13_0222B620: @ 0x0222B620
	push {r4, lr}
	mov r0, #0
	bl FUN_020CD944
	mov r0, #1
	bl FUN_020CDC04
	mov r0, #2
	bl FUN_020CDE94
	mov r1, #0
	mov r2, r1
	mov r0, #1
	bl FUN_020CD9FC
	mov r3, #0x4000000
	ldr r1, [r3]
	add r0, r3, #0x6c
	bic r1, r1, #0x1f00
	str r1, [r3]
	ldr r2, [r3]
	mov r1, #0
	bic r2, r2, #0xe000
	str r2, [r3]
	bl FUN_020CDA80
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r0, _0222B884 @ =0xFFCFFFEF
	ldr r1, _0222B888 @ =0x00200010
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
	bl FUN_020CF178
	mov r0, #0x80
	bl FUN_020CE650
	mov r0, #0x100
	bl FUN_020CE6F8
	mov r0, #0
	bl FUN_020CDA64
	ldr r1, _0222B88C @ =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x1f00
	str r0, [r1]
	ldr r0, [r1]
	bic r0, r0, #0xe000
	str r0, [r1]
	add r0, r1, #0x6c
	mov r1, #0
	bl FUN_020CDA80
	ldr r3, _0222B88C @ =0x04001000
	ldr r0, _0222B884 @ =0xFFCFFFEF
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
	bl FUN_020CF178
	ldr r2, _0222B890 @ =0x04000008
	ldr r3, _0222B894 @ =0x0400100A
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
	bl FUN_020CD9B4
	ldr r2, _0222B88C @ =0x04001000
	mov r0, #1
	ldr r1, [r2]
	orr r1, r1, #0x10000
	str r1, [r2]
	bl FUN_020CD944
	pop {r4, pc}
	.align 2, 0
_0222B884: .4byte 0xFFCFFFEF
_0222B888: .4byte 0x00200010
_0222B88C: .4byte 0x04001000
_0222B890: .4byte 0x04000008
_0222B894: .4byte 0x0400100A
	arm_func_end ov13_0222B620

	arm_func_start ov13_0222B898
ov13_0222B898: @ 0x0222B898
	push {r3, lr}
	bl FUN_020CD978
	ldr r1, _0222B8E4 @ =0x04001000
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
	pop {r3, pc}
	.align 2, 0
_0222B8E4: .4byte 0x04001000
	arm_func_end ov13_0222B898

	arm_func_start ov13_0222B8E8
ov13_0222B8E8: @ 0x0222B8E8
	ldr r1, _0222B8F4 @ =0x0224F4CC
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_0222B8F4: .4byte 0x0224F4CC
	arm_func_end ov13_0222B8E8

	arm_func_start ov13_0222B8F8
ov13_0222B8F8: @ 0x0222B8F8
	ldr r2, _0222B908 @ =0x0224F4CC
	str r0, [r2, #0x10]
	str r1, [r2, #0x14]
	bx lr
	.align 2, 0
_0222B908: .4byte 0x0224F4CC
	arm_func_end ov13_0222B8F8

	arm_func_start ov13_0222B90C
ov13_0222B90C: @ 0x0222B90C
	cmp r0, #0
	ldrne r2, _0222B930 @ =0x0224F4CC
	ldrne r2, [r2, #0x10]
	strne r2, [r0]
	cmp r1, #0
	ldrne r0, _0222B930 @ =0x0224F4CC
	ldrne r0, [r0, #0x14]
	strne r0, [r1]
	bx lr
	.align 2, 0
_0222B930: .4byte 0x0224F4CC
	arm_func_end ov13_0222B90C

	arm_func_start ov13_0222B934
ov13_0222B934: @ 0x0222B934
	ldr r2, _0222B944 @ =0x0224F4CC
	str r0, [r2, #0x18]
	str r1, [r2, #0x1c]
	bx lr
	.align 2, 0
_0222B944: .4byte 0x0224F4CC
	arm_func_end ov13_0222B934

	arm_func_start ov13_0222B948
ov13_0222B948: @ 0x0222B948
	cmp r0, #0
	ldrne r2, _0222B96C @ =0x0224F4CC
	ldrne r2, [r2, #0x18]
	strne r2, [r0]
	cmp r1, #0
	ldrne r0, _0222B96C @ =0x0224F4CC
	ldrne r0, [r0, #0x1c]
	strne r0, [r1]
	bx lr
	.align 2, 0
_0222B96C: .4byte 0x0224F4CC
	arm_func_end ov13_0222B948

	arm_func_start ov13_0222B970
ov13_0222B970: @ 0x0222B970
	ldr r0, _0222B97C @ =0x0224F4CC
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0222B97C: .4byte 0x0224F4CC
	arm_func_end ov13_0222B970

	arm_func_start ov13_0222B980
ov13_0222B980: @ 0x0222B980
	ldr r0, _0222B994 @ =0x0224F4CC
	ldr r0, [r0, #8]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	bx lr
	.align 2, 0
_0222B994: .4byte 0x0224F4CC
	arm_func_end ov13_0222B980

	arm_func_start ov13_0222B998
ov13_0222B998: @ 0x0222B998
	ldr r1, _0222B9B0 @ =0x0224F4CC
	ldr r1, [r1, #8]
	tst r0, r1, lsr #4
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_0222B9B0: .4byte 0x0224F4CC
	arm_func_end ov13_0222B998

	arm_func_start ov13_0222B9B4
ov13_0222B9B4: @ 0x0222B9B4
	ldr r0, _0222B9C4 @ =0x0224F4CC
	mov r1, #1
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_0222B9C4: .4byte 0x0224F4CC
	arm_func_end ov13_0222B9B4

	arm_func_start ov13_0222B9C8
ov13_0222B9C8: @ 0x0222B9C8
	ldr r0, _0222BA04 @ =0x0224F4CC
	ldrb r1, [r0]
	cmp r1, #6
	moveq r0, #0x38
	bxeq lr
	cmp r1, #1
	bne _0222B9F8
	ldr r0, [r0, #8]
	lsr r0, r0, #4
	tst r0, #2
	moveq r0, #0x37
	bxeq lr
_0222B9F8:
	add r0, r1, #0x31
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0222BA04: .4byte 0x0224F4CC
	arm_func_end ov13_0222B9C8

	arm_func_start ov13_0222BA08
ov13_0222BA08: @ 0x0222BA08
	push {r3, lr}
	mov r0, #0x64
	mov r1, #4
	bl ov13_0224128C
	mov r1, r0
	ldr r3, _0222BA40 @ =0x0224F4EC
	mov r0, #8
	mov r2, #0xc
	str r1, [r3]
	bl ov13_0224022C
	ldr r1, _0222BA40 @ =0x0224F4EC
	ldr r1, [r1]
	str r0, [r1, #0x60]
	pop {r3, pc}
	.align 2, 0
_0222BA40: .4byte 0x0224F4EC
	arm_func_end ov13_0222BA08

	arm_func_start ov13_0222BA44
ov13_0222BA44: @ 0x0222BA44
	ldr ip, _0222BA50 @ =ov13_022412B0
	ldr r0, _0222BA54 @ =0x0224F4EC
	bx ip
	.align 2, 0
_0222BA50: .4byte ov13_022412B0
_0222BA54: .4byte 0x0224F4EC
	arm_func_end ov13_0222BA44

	arm_func_start ov13_0222BA58
ov13_0222BA58: @ 0x0222BA58
	push {r3, r4, r5, lr}
	ldr r1, _0222BAAC @ =0x0224F4EC
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
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222BAAC: .4byte 0x0224F4EC
	arm_func_end ov13_0222BA58

	arm_func_start ov13_0222BAB0
ov13_0222BAB0: @ 0x0222BAB0
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	bl ov13_0223FA50
	ldr r0, _0222BAD8 @ =0x0224F4EC
	mov r1, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x60]
	bl ov13_02240288
	pop {r4, pc}
	.align 2, 0
_0222BAD8: .4byte 0x0224F4EC
	arm_func_end ov13_0222BAB0

	arm_func_start ov13_0222BADC
ov13_0222BADC: @ 0x0222BADC
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	ldm r0, {r2, r3}
	ldr r0, [r2, r1, lsl #2]
	add r0, r3, r0
	bx lr
	arm_func_end ov13_0222BADC

	arm_func_start ov13_0222BAF4
ov13_0222BAF4: @ 0x0222BAF4
	push {r3, lr}
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	ldm r0, {ip, lr}
	ldr r0, [ip, r1, lsl #2]
	cmp r2, #0
	add r0, lr, r0
	addge r3, r3, #0x30
	lslge r1, r2, #1
	strhge r3, [r0, r1]
	pop {r3, pc}
	arm_func_end ov13_0222BAF4

	arm_func_start ov13_0222BB20
ov13_0222BB20: @ 0x0222BB20
	push {r3, r4, lr}
	sub sp, sp, #0x1c
	mov r4, r0
	ldr r0, _0222BBF8 @ =0x0001E2A4
	mov r1, #0x20
	bl ov13_0224128C
	ldr r2, _0222BBFC @ =0x0224F4F0
	add r1, r0, #0x1e000
	str r0, [r2]
	str r4, [r1, #0x298]
	ldr r0, [r2]
	mov r4, #0
	add r0, r0, #0x1e000
	strb r4, [r0, #0x2a0]
	ldr r0, [r2]
	ldr lr, _0222BC00 @ =0x02245F8C
	add r0, r0, #0x1e000
	strb r4, [r0, #0x2a1]
	add ip, sp, #0
	ldm lr!, {r0, r1, r2, r3}
	stm ip!, {r0, r1, r2, r3}
	ldm lr, {r0, r1, r2}
	stm ip, {r0, r1, r2}
	ldr r0, _0222BC04 @ =0x0224F4F8
	mov r1, r4
	ldr r0, [r0]
	bl ov13_0222BADC
	ldr r1, _0222BC04 @ =0x0224F4F8
	str r0, [sp, #4]
	ldr r0, [r1]
	mov r1, #1
	bl ov13_0222BADC
	str r0, [sp, #8]
	bl ov13_0222B9C8
	strb r0, [sp, #0x18]
	ldr r0, _0222BBFC @ =0x0224F4F0
	add r1, sp, #0
	ldr r0, [r0]
	bl ov13_0223E80C
	bl ov13_0223EA58
	cmp r0, #0
	bne _0222BBCC
	bl FUN_020D3F48
_0222BBCC:
	mov r0, #0
	ldr r1, _0222BC08 @ =ov13_0222BCC0
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0222BBFC @ =0x0224F4F0
	ldr r1, [r1]
	add r1, r1, #0x1e000
	str r0, [r1, #0x29c]
	add sp, sp, #0x1c
	pop {r3, r4, pc}
	.align 2, 0
_0222BBF8: .4byte 0x0001E2A4
_0222BBFC: .4byte 0x0224F4F0
_0222BC00: .4byte 0x02245F8C
_0222BC04: .4byte 0x0224F4F8
_0222BC08: .4byte ov13_0222BCC0
	arm_func_end ov13_0222BB20

	arm_func_start ov13_0222BC0C
ov13_0222BC0C: @ 0x0222BC0C
	ldr ip, _0222BC24 @ =ov13_02242528
	mov r0, #0
	ldr r1, _0222BC28 @ =ov13_0222BC2C
	mov r2, r0
	mov r3, #0x78
	bx ip
	.align 2, 0
_0222BC24: .4byte ov13_02242528
_0222BC28: .4byte ov13_0222BC2C
	arm_func_end ov13_0222BC0C

	arm_func_start ov13_0222BC2C
ov13_0222BC2C: @ 0x0222BC2C
	push {r4, lr}
	mov r4, r0
	bl ov13_0223E8FC
	cmp r0, #0
	popeq {r4, pc}
	ldr r0, _0222BC64 @ =0x0224F4F0
	mov r1, r4
	ldr r0, [r0]
	mov r3, #1
	add r2, r0, #0x1e000
	mov r0, #0
	strb r3, [r2, #0x2a1]
	bl ov13_022425D0
	pop {r4, pc}
	.align 2, 0
_0222BC64: .4byte 0x0224F4F0
	arm_func_end ov13_0222BC2C

	arm_func_start ov13_0222BC68
ov13_0222BC68: @ 0x0222BC68
	ldr r0, _0222BC80 @ =0x0224F4F0
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0222BC80: .4byte 0x0224F4F0
	arm_func_end ov13_0222BC68

	arm_func_start ov13_0222BC84
ov13_0222BC84: @ 0x0222BC84
	ldr r1, _0222BC98 @ =0x0224F4F0
	ldr r1, [r1]
	add r1, r1, #0x1e000
	str r0, [r1, #0x298]
	bx lr
	.align 2, 0
_0222BC98: .4byte 0x0224F4F0
	arm_func_end ov13_0222BC84

	arm_func_start ov13_0222BC9C
ov13_0222BC9C: @ 0x0222BC9C
	ldr ip, _0222BCA4 @ =ov13_0223EAA0
	bx ip
	.align 2, 0
_0222BCA4: .4byte ov13_0223EAA0
	arm_func_end ov13_0222BC9C

	arm_func_start ov13_0222BCA8
ov13_0222BCA8: @ 0x0222BCA8
	ldr r0, _0222BCBC @ =0x0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x2280
	add r0, r0, #0x1c000
	bx lr
	.align 2, 0
_0222BCBC: .4byte 0x0224F4F0
	arm_func_end ov13_0222BCA8

	arm_func_start ov13_0222BCC0
ov13_0222BCC0: @ 0x0222BCC0
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	bl ov13_0223EAD4
	ldr r0, _0222BF58 @ =0x0224F4F0
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
	popeq {r3, r4, pc}
	mov r0, #0
	blx r1
	add sp, sp, #4
	pop {r3, r4, pc}
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
_0222BD44: @ jump table
	b _0222BF50 @ case 0
	b _0222BF50 @ case 1
	b _0222BF50 @ case 2
	b _0222BF50 @ case 3
	b _0222BF50 @ case 4
	b _0222BDCC @ case 5
	b _0222BF50 @ case 6
	b _0222BF50 @ case 7
	b _0222BF50 @ case 8
	b _0222BF50 @ case 9
	b _0222BF50 @ case 10
	b _0222BF50 @ case 11
	b _0222BEF8 @ case 12
	b _0222BE2C @ case 13
	b _0222BF50 @ case 14
	b _0222BF50 @ case 15
	b _0222BF50 @ case 16
	b _0222BF50 @ case 17
	b _0222BF50 @ case 18
	b _0222BF50 @ case 19
	b _0222BE70 @ case 20
_0222BD98:
	cmp r0, #0x17
	beq _0222BE70
	add sp, sp, #4
	pop {r3, r4, pc}
_0222BDA8:
	cmp r0, #0x1d
	bgt _0222BDBC
	beq _0222BEB4
	add sp, sp, #4
	pop {r3, r4, pc}
_0222BDBC:
	cmp r0, #0x22
	beq _0222BF3C
	add sp, sp, #4
	pop {r3, r4, pc}
_0222BDCC:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	ldr r0, _0222BF58 @ =0x0224F4F0
	ldr r0, [r0]
	add r4, r0, #0x2280
	bl ov13_0223EE9C
	add r1, r4, #0x1c000
	mov r2, #0x16
	bl FUN_020D47B8
	ldr r0, _0222BF58 @ =0x0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	strbeq r1, [r0, #0x2a0]
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	mov r0, #0
	blx r1
	add sp, sp, #4
	pop {r3, r4, pc}
_0222BE2C:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	ldr r0, _0222BF58 @ =0x0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	strbeq r1, [r0, #0x2a0]
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	mov r0, #1
	blx r1
	add sp, sp, #4
	pop {r3, r4, pc}
_0222BE70:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	ldr r0, _0222BF58 @ =0x0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	strbeq r1, [r0, #0x2a0]
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	mov r0, #3
	blx r1
	add sp, sp, #4
	pop {r3, r4, pc}
_0222BEB4:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	ldr r0, _0222BF58 @ =0x0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	strbeq r1, [r0, #0x2a0]
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	mov r0, #4
	blx r1
	add sp, sp, #4
	pop {r3, r4, pc}
_0222BEF8:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	ldr r0, _0222BF58 @ =0x0224F4F0
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	strbeq r1, [r0, #0x2a0]
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	mov r0, #2
	blx r1
	add sp, sp, #4
	pop {r3, r4, pc}
_0222BF3C:
	mov r1, r4
	mov r0, #0
	bl ov13_022425D0
	ldr r0, _0222BF5C @ =0x0224F4F0
	bl ov13_022412B0
_0222BF50:
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0222BF58: .4byte 0x0224F4F0
_0222BF5C: .4byte 0x0224F4F0
	arm_func_end ov13_0222BCC0

	arm_func_start ov13_0222BF60
ov13_0222BF60: @ 0x0222BF60
	push {r3, lr}
	sub sp, sp, #8
	mov r0, #0xc
	sub r1, r0, #0x10
	bl ov13_0224128C
	ldr r1, _0222BFBC @ =0x0224F4F4
	ldr ip, _0222BFC0 @ =ov13_0222C100
	str r0, [r1]
	ldr r2, _0222BFC4 @ =ov13_0222C0D8
	ldr r3, _0222BFC8 @ =ov13_0222C0F0
	str ip, [sp]
	mov ip, #0x800
	mov r0, #0xf
	mov r1, #0x40
	str ip, [sp, #4]
	blx ov13_02226D74
	cmp r0, #1
	beq _0222BFAC
	bl FUN_020D3F48
_0222BFAC:
	mov r0, #0xa
	bl FUN_020D2108
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0222BFBC: .4byte 0x0224F4F4
_0222BFC0: .4byte ov13_0222C100
_0222BFC4: .4byte ov13_0222C0D8
_0222BFC8: .4byte ov13_0222C0F0
	arm_func_end ov13_0222BF60

	arm_func_start ov13_0222BFCC
ov13_0222BFCC: @ 0x0222BFCC
	push {r3, lr}
	blx ov13_02226E5C
	cmp r0, #1
	beq _0222BFE0
	bl FUN_020D3F48
_0222BFE0:
	ldr r0, _0222BFEC @ =0x0224F4F4
	bl ov13_022412B0
	pop {r3, pc}
	.align 2, 0
_0222BFEC: .4byte 0x0224F4F4
	arm_func_end ov13_0222BFCC

	arm_func_start ov13_0222BFF0
ov13_0222BFF0: @ 0x0222BFF0
	push {r3, lr}
	sub sp, sp, #0xe8
	ldr r1, _0222C0A8 @ =0x0224F4F4
	ldr r1, [r1]
	ldr r1, [r1]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _0222C0A0
_0222C010: @ jump table
	b _0222C030 @ case 0
	b _0222C030 @ case 1
	b _0222C03C @ case 2
	b _0222C030 @ case 3
	b _0222C048 @ case 4
	b _0222C030 @ case 5
	b _0222C054 @ case 6
	b _0222C09C @ case 7
_0222C030:
	add sp, sp, #0xe8
	mov r0, #0
	pop {r3, pc}
_0222C03C:
	add sp, sp, #0xe8
	mov r0, #1
	pop {r3, pc}
_0222C048:
	add sp, sp, #0xe8
	mov r0, #2
	pop {r3, pc}
_0222C054:
	add r0, sp, #0
	blx ov13_02226F28
	cmp r0, #1
	beq _0222C068
	bl FUN_020D3F48
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
	popeq {r3, pc}
_0222C090:
	add sp, sp, #0xe8
	mov r0, #5
	pop {r3, pc}
_0222C09C:
	mov r0, #4
_0222C0A0:
	add sp, sp, #0xe8
	pop {r3, pc}
	.align 2, 0
_0222C0A8: .4byte 0x0224F4F4
	arm_func_end ov13_0222BFF0

	arm_func_start ov13_0222C0AC
ov13_0222C0AC: @ 0x0222C0AC
	push {r3, lr}
	sub sp, sp, #0xe8
	add r0, sp, #0
	blx ov13_02226F28
	cmp r0, #1
	beq _0222C0C8
	bl FUN_020D3F48
_0222C0C8:
	add r0, sp, #0
	bl ov13_0223A5D0
	add sp, sp, #0xe8
	pop {r3, pc}
	arm_func_end ov13_0222C0AC

	arm_func_start ov13_0222C0D8
ov13_0222C0D8: @ 0x0222C0D8
	ldr r3, _0222C0EC @ =0x0224F4F4
	ldm r0, {r0, r1, r2}
	ldr r3, [r3]
	stm r3, {r0, r1, r2}
	bx lr
	.align 2, 0
_0222C0EC: .4byte 0x0224F4F4
	arm_func_end ov13_0222C0D8

	arm_func_start ov13_0222C0F0
ov13_0222C0F0: @ 0x0222C0F0
	ldr ip, _0222C0FC @ =ov13_0224128C
	mov r1, #0x20
	bx ip
	.align 2, 0
_0222C0FC: .4byte ov13_0224128C
	arm_func_end ov13_0222C0F0

	arm_func_start ov13_0222C100
ov13_0222C100: @ 0x0222C100
	ldr ip, _0222C108 @ =ov13_022412F4
	bx ip
	.align 2, 0
_0222C108: .4byte ov13_022412F4
	arm_func_end ov13_0222C100

	arm_func_start ov13_0222C10C
ov13_0222C10C: @ 0x0222C10C
	push {r3, lr}
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
	ldr r0, _0222C144 @ =ov13_0222C148
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222C144: .4byte ov13_0222C148
	arm_func_end ov13_0222C10C

	arm_func_start ov13_0222C148
ov13_0222C148: @ 0x0222C148
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _0222C1B8 @ =0x0224F4F8
	ldr r0, [r0]
	bl ov13_0222BAB0
	bl ov13_0222BA44
	bl ov13_02239FDC
	bl ov13_0222B9B4
	pop {r3, pc}
	.align 2, 0
_0222C1B8: .4byte 0x0224F4F8
	arm_func_end ov13_0222C148

	arm_func_start ov13_0222C1BC
ov13_0222C1BC: @ 0x0222C1BC
	push {r3, lr}
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
	ldr r0, _0222C334 @ =0x02246034
	bl ov13_0222BA58
	ldr r1, _0222C338 @ =0x0224F4F8
	str r0, [r1]
	b _0222C21C
_0222C204:
	bl ov13_0222B970
	ldr r1, _0222C33C @ =0x02246018
	ldr r0, [r1, r0, lsl #2]
	bl ov13_0222BA58
	ldr r1, _0222C338 @ =0x0224F4F8
	str r0, [r1]
_0222C21C:
	ldr r0, _0222C340 @ =0x02246044
	bl ov13_022278C4
	mov r1, r0
	mov r0, #1
	bl ov13_02240098
	ldr r0, _0222C344 @ =0x02246058
	bl ov13_022278C4
	mov r1, r0
	mov r0, #0
	bl ov13_02240098
	ldr r0, _0222C348 @ =0x0224606C
	ldr r1, _0222C34C @ =0x020D0344
	bl ov13_02227924
	ldr r0, _0222C350 @ =0x02246080
	ldr r1, _0222C354 @ =0x020CFCC0
	bl ov13_02227924
	ldr r0, _0222C358 @ =0x02246094
	ldr r1, _0222C35C @ =0x020CFECC
	bl ov13_02227924
	ldr r0, _0222C360 @ =0x022460AC
	ldr r1, _0222C364 @ =0x020CFD70
	bl ov13_02227924
	ldr r0, _0222C368 @ =0x022460C4
	ldr r1, _0222C36C @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _0222C370 @ =0x022460DC
	ldr r1, _0222C374 @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _0222C378 @ =0x022460F4
	ldr r1, _0222C37C @ =0x020CFE74
	bl ov13_02227924
	ldr r0, _0222C380 @ =0x0224610C
	ldr r1, _0222C384 @ =0x020CFD18
	bl ov13_02227924
	bl ov13_0222B980
	cmp r0, #0
	beq _0222C2BC
	cmp r0, #1
	beq _0222C2CC
	b _0222C2D8
_0222C2BC:
	ldr r0, _0222C388 @ =0x02246124
	ldr r1, _0222C38C @ =FUN_020D0044
	bl ov13_02227924
	b _0222C2D8
_0222C2CC:
	ldr r0, _0222C390 @ =0x02246138
	ldr r1, _0222C38C @ =FUN_020D0044
	bl ov13_02227924
_0222C2D8:
	ldr ip, _0222C394 @ =0x0400100A
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
	ldr r0, _0222C398 @ =ov13_0222C39C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222C334: .4byte 0x02246034
_0222C338: .4byte 0x0224F4F8
_0222C33C: .4byte 0x02246018
_0222C340: .4byte 0x02246044
_0222C344: .4byte 0x02246058
_0222C348: .4byte 0x0224606C
_0222C34C: .4byte 0x020D0344
_0222C350: .4byte 0x02246080
_0222C354: .4byte 0x020CFCC0
_0222C358: .4byte 0x02246094
_0222C35C: .4byte 0x020CFECC
_0222C360: .4byte 0x022460AC
_0222C364: .4byte 0x020CFD70
_0222C368: .4byte 0x022460C4
_0222C36C: .4byte 0x020D03A4
_0222C370: .4byte 0x022460DC
_0222C374: .4byte FUN_020CFC6C
_0222C378: .4byte 0x022460F4
_0222C37C: .4byte 0x020CFE74
_0222C380: .4byte 0x0224610C
_0222C384: .4byte 0x020CFD18
_0222C388: .4byte 0x02246124
_0222C38C: .4byte FUN_020D0044
_0222C390: .4byte 0x02246138
_0222C394: .4byte 0x0400100A
_0222C398: .4byte ov13_0222C39C
	arm_func_end ov13_0222C1BC

	arm_func_start ov13_0222C39C
ov13_0222C39C: @ 0x0222C39C
	push {r3, lr}
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
	ldr r0, _0222C3D4 @ =ov13_0222C3D8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222C3D4: .4byte ov13_0222C3D8
	arm_func_end ov13_0222C39C

	arm_func_start ov13_0222C3D8
ov13_0222C3D8: @ 0x0222C3D8
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0222B980
	cmp r0, #0
	beq _0222C414
	cmp r0, #1
	beq _0222C42C
	pop {r3, pc}
_0222C414:
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222C444 @ =ov13_0222C44C
	bl ov13_0222B8E8
	pop {r3, pc}
_0222C42C:
	mov r0, #1
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _0222C448 @ =ov13_022368D8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222C444: .4byte ov13_0222C44C
_0222C448: .4byte ov13_022368D8
	arm_func_end ov13_0222C3D8

	arm_func_start ov13_0222C44C
ov13_0222C44C: @ 0x0222C44C
	push {r3, lr}
	bl ov13_0222C4C8
	mov r0, #0
	bl ov13_02227DE4
	mov r0, #0x2e
	sub r1, r0, #0x2f
	mov r2, #0
	bl ov13_022277B8
	mov r0, #4
	bl ov13_0223B6F4
	ldr r0, _0222C4B0 @ =0x0224F4FC
	ldr r3, _0222C4B4 @ =0x0224533E
	ldrb r0, [r0]
	ldr r1, _0222C4B8 @ =0x02245342
	ldr r2, _0222C4BC @ =0x02245340
	lsl ip, r0, #3
	ldrh r0, [r3, ip]
	ldrh r1, [r1, ip]
	ldrh r2, [r2, ip]
	ldr r3, _0222C4C0 @ =0x02245344
	ldrh r3, [r3, ip]
	bl ov13_02227C28
	ldr r0, _0222C4C4 @ =ov13_0222C5B4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222C4B0: .4byte 0x0224F4FC
_0222C4B4: .4byte 0x0224533E
_0222C4B8: .4byte 0x02245342
_0222C4BC: .4byte 0x02245340
_0222C4C0: .4byte 0x02245344
_0222C4C4: .4byte ov13_0222C5B4
	arm_func_end ov13_0222C44C

	arm_func_start ov13_0222C4C8
ov13_0222C4C8: @ 0x0222C4C8
	push {r3, lr}
	sub sp, sp, #0x18
	ldr ip, _0222C58C @ =0x0224534E
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
	ldr r0, _0222C590 @ =0x0224614C
	ldr r1, _0222C594 @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _0222C598 @ =0x02246164
	ldr r1, _0222C59C @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _0222C5A0 @ =0x0224617C
	ldr r1, _0222C5A4 @ =FUN_020D00A4
	bl ov13_02227924
	add r0, sp, #0
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _0222C5A8 @ =0x0224F4FC
	ldr r2, _0222C5AC @ =0x04001008
	str r0, [r1, #4]
	ldrh r0, [r2]
	ldr r1, _0222C5B0 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222C58C: .4byte 0x0224534E
_0222C590: .4byte 0x0224614C
_0222C594: .4byte 0x020D03A4
_0222C598: .4byte 0x02246164
_0222C59C: .4byte FUN_020CFC6C
_0222C5A0: .4byte 0x0224617C
_0222C5A4: .4byte FUN_020D00A4
_0222C5A8: .4byte 0x0224F4FC
_0222C5AC: .4byte 0x04001008
_0222C5B0: .4byte 0x0400000A
	arm_func_end ov13_0222C4C8

	arm_func_start ov13_0222C5B4
ov13_0222C5B4: @ 0x0222C5B4
	push {r3, lr}
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
	ldr r0, _0222C604 @ =ov13_0222C608
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222C604: .4byte ov13_0222C608
	arm_func_end ov13_0222C5B4

	arm_func_start ov13_0222C608
ov13_0222C608: @ 0x0222C608
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_022279B4
	ldr r0, _0222C640 @ =ov13_0222C644
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222C640: .4byte ov13_0222C644
	arm_func_end ov13_0222C608

	arm_func_start ov13_0222C644
ov13_0222C644: @ 0x0222C644
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222C668 @ =ov13_0222C66C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222C668: .4byte ov13_0222C66C
	arm_func_end ov13_0222C644

	arm_func_start ov13_0222C66C
ov13_0222C66C: @ 0x0222C66C
	push {r3, lr}
	bl ov13_0222C680
	bl ov13_0222C7AC
	bl ov13_0222C7B0
	pop {r3, pc}
	arm_func_end ov13_0222C66C

	arm_func_start ov13_0222C680
ov13_0222C680: @ 0x0222C680
	push {r3, r4, r5, lr}
	ldr r5, _0222C794 @ =0x0224532E
	mov r4, #0
_0222C68C:
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _0222C6DC
	mov r0, #1
	bl ov13_0222726C
	and r1, r4, #0xff
	lsl lr, r1, #3
	ldr r0, _0222C798 @ =0x0224533E
	ldr r1, _0222C79C @ =0x02245342
	ldr r2, _0222C7A0 @ =0x02245340
	ldr r3, _0222C7A4 @ =0x02245344
	ldr ip, _0222C7A8 @ =0x0224F4FC
	ldrh r0, [r0, lr]
	ldrh r1, [r1, lr]
	ldrh r2, [r2, lr]
	ldrh r3, [r3, lr]
	strb r4, [ip]
	bl ov13_02227C28
	pop {r3, r4, r5, pc}
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
	pop {r3, r4, r5, pc}
_0222C708:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _0222C724
	mov r0, #0
	bl ov13_0222726C
	pop {r3, r4, r5, pc}
_0222C724:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _0222C740
	mov r0, #1
	bl ov13_0222C914
	pop {r3, r4, r5, pc}
_0222C740:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	beq _0222C75C
	mov r0, #3
	bl ov13_0222C914
	pop {r3, r4, r5, pc}
_0222C75C:
	mov r0, #0x20
	bl ov13_022416D4
	cmp r0, #0
	beq _0222C778
	mov r0, #0
	bl ov13_0222C914
	pop {r3, r4, r5, pc}
_0222C778:
	mov r0, #0x10
	bl ov13_022416D4
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	mov r0, #2
	bl ov13_0222C914
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222C794: .4byte 0x0224532E
_0222C798: .4byte 0x0224533E
_0222C79C: .4byte 0x02245342
_0222C7A0: .4byte 0x02245340
_0222C7A4: .4byte 0x02245344
_0222C7A8: .4byte 0x0224F4FC
	arm_func_end ov13_0222C680

	arm_func_start ov13_0222C7AC
ov13_0222C7AC: @ 0x0222C7AC
	bx lr
	arm_func_end ov13_0222C7AC

	arm_func_start ov13_0222C7B0
ov13_0222C7B0: @ 0x0222C7B0
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	beq _0222C7CC
	cmp r0, #1
	beq _0222C7E0
	pop {r3, pc}
_0222C7CC:
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _0222C7F8 @ =ov13_0222C10C
	bl ov13_0222B8E8
	pop {r3, pc}
_0222C7E0:
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0222C984
	ldr r0, _0222C7FC @ =ov13_0222C800
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222C7F8: .4byte ov13_0222C10C
_0222C7FC: .4byte ov13_0222C800
	arm_func_end ov13_0222C7B0

	arm_func_start ov13_0222C800
ov13_0222C800: @ 0x0222C800
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222C81C @ =ov13_0222C820
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222C81C: .4byte ov13_0222C820
	arm_func_end ov13_0222C800

	arm_func_start ov13_0222C820
ov13_0222C820: @ 0x0222C820
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _0222C868 @ =ov13_0222C86C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222C868: .4byte ov13_0222C86C
	arm_func_end ov13_0222C820

	arm_func_start ov13_0222C86C
ov13_0222C86C: @ 0x0222C86C
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02227D18
	bl ov13_0222788C
	ldr r0, _0222C908 @ =0x0224F4FC
	ldr r0, [r0, #4]
	bl ov13_0223FA50
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EFC
	ldr r0, _0222C908 @ =0x0224F4FC
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222C8D8
	cmp r0, #1
	beq _0222C8F0
	pop {r3, pc}
_0222C8D8:
	mov r0, #1
	mov r1, #0
	bl ov13_0222B8F8
	ldr r0, _0222C90C @ =ov13_022368D8
	bl ov13_0222B8E8
	pop {r3, pc}
_0222C8F0:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _0222C910 @ =ov13_0222D454
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222C908: .4byte 0x0224F4FC
_0222C90C: .4byte ov13_022368D8
_0222C910: .4byte ov13_0222D454
	arm_func_end ov13_0222C86C

	arm_func_start ov13_0222C914
ov13_0222C914: @ 0x0222C914
	push {r3, lr}
	cmp r0, #1
	cmpne r0, #3
	popeq {r3, pc}
	ldr r1, _0222C970 @ =0x0224F4FC
	mov r0, #8
	ldrb r2, [r1]
	eor r2, r2, #1
	strb r2, [r1]
	bl ov13_0223ABB8
	ldr r0, _0222C970 @ =0x0224F4FC
	ldr ip, _0222C974 @ =0x0224533E
	ldrb r0, [r0]
	ldr r1, _0222C978 @ =0x02245342
	ldr r2, _0222C97C @ =0x02245340
	lsl lr, r0, #3
	ldr r3, _0222C980 @ =0x02245344
	ldrh r0, [ip, lr]
	ldrh r1, [r1, lr]
	ldrh r2, [r2, lr]
	ldrh r3, [r3, lr]
	bl ov13_02227C28
	pop {r3, pc}
	.align 2, 0
_0222C970: .4byte 0x0224F4FC
_0222C974: .4byte 0x0224533E
_0222C978: .4byte 0x02245342
_0222C97C: .4byte 0x02245340
_0222C980: .4byte 0x02245344
	arm_func_end ov13_0222C914

	arm_func_start ov13_0222C984
ov13_0222C984: @ 0x0222C984
	push {r3, lr}
	ldr r1, _0222C9BC @ =0x0224532C
	ldr r0, _0222C9C0 @ =0x0224F4FC
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
	pop {r3, pc}
	.align 2, 0
_0222C9BC: .4byte 0x0224532C
_0222C9C0: .4byte 0x0224F4FC
	arm_func_end ov13_0222C984

	arm_func_start ov13_0222C9C4
ov13_0222C9C4: @ 0x0222C9C4
	push {r3, lr}
	ldr r0, _0222CA04 @ =0x0224F504
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
	ldr r0, _0222CA08 @ =ov13_0222CA8C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CA04: .4byte 0x0224F504
_0222CA08: .4byte ov13_0222CA8C
	arm_func_end ov13_0222C9C4

	arm_func_start ov13_0222CA0C
ov13_0222CA0C: @ 0x0222CA0C
	push {r3, lr}
	ldr r0, _0222CA7C @ =0x02246190
	ldr r1, _0222CA80 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _0222CA84 @ =0x04001008
	ldr r1, _0222CA88 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222CA7C: .4byte 0x02246190
_0222CA80: .4byte FUN_020D00A4
_0222CA84: .4byte 0x04001008
_0222CA88: .4byte 0x0400000A
	arm_func_end ov13_0222CA0C

	arm_func_start ov13_0222CA8C
ov13_0222CA8C: @ 0x0222CA8C
	push {r3, lr}
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
	ldr r0, _0222CADC @ =ov13_0222CAE0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CADC: .4byte ov13_0222CAE0
	arm_func_end ov13_0222CA8C

	arm_func_start ov13_0222CAE0
ov13_0222CAE0: @ 0x0222CAE0
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #3
	bl ov13_022279B4
	ldr r0, _0222CB18 @ =ov13_0222CB1C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CB18: .4byte ov13_0222CB1C
	arm_func_end ov13_0222CAE0

	arm_func_start ov13_0222CB1C
ov13_0222CB1C: @ 0x0222CB1C
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222CB40 @ =ov13_0222CB44
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CB40: .4byte ov13_0222CB44
	arm_func_end ov13_0222CB1C

	arm_func_start ov13_0222CB44
ov13_0222CB44: @ 0x0222CB44
	push {r3, lr}
	bl ov13_0222CB58
	bl ov13_0222CB90
	bl ov13_0222CB94
	pop {r3, pc}
	arm_func_end ov13_0222CB44

	arm_func_start ov13_0222CB58
ov13_0222CB58: @ 0x0222CB58
	push {r3, lr}
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
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_0222CB58

	arm_func_start ov13_0222CB90
ov13_0222CB90: @ 0x0222CB90
	bx lr
	arm_func_end ov13_0222CB90

	arm_func_start ov13_0222CB94
ov13_0222CB94: @ 0x0222CB94
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	beq _0222CBB0
	cmp r0, #1
	beq _0222CBC4
	pop {r3, pc}
_0222CBB0:
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _0222CBF4 @ =ov13_0222CBFC
	bl ov13_0222B8E8
	pop {r3, pc}
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
	ldr r0, _0222CBF8 @ =ov13_0222CD38
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CBF4: .4byte ov13_0222CBFC
_0222CBF8: .4byte ov13_0222CD38
	arm_func_end ov13_0222CB94

	arm_func_start ov13_0222CBFC
ov13_0222CBFC: @ 0x0222CBFC
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222CC18 @ =ov13_0222CC1C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CC18: .4byte ov13_0222CC1C
	arm_func_end ov13_0222CBFC

	arm_func_start ov13_0222CC1C
ov13_0222CC1C: @ 0x0222CC1C
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02227228
	ldr r0, _0222CC78 @ =0x0224F504
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
	ldr r0, _0222CC7C @ =ov13_0222CC80
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CC78: .4byte 0x0224F504
_0222CC7C: .4byte ov13_0222CC80
	arm_func_end ov13_0222CC1C

	arm_func_start ov13_0222CC80
ov13_0222CC80: @ 0x0222CC80
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222CD2C @ =0x0224F504
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222CCB4
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
_0222CCB4:
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0222CD2C @ =0x0224F504
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
	ldr r0, _0222CD2C @ =0x0224F504
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	mov r0, #0
	bne _0222CD1C
	bl ov13_0222B8F8
	ldr r0, _0222CD30 @ =ov13_0222D454
	bl ov13_0222B8E8
	pop {r3, pc}
_0222CD1C:
	bl ov13_0222B8F8
	ldr r0, _0222CD34 @ =ov13_0222CDA8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CD2C: .4byte 0x0224F504
_0222CD30: .4byte ov13_0222D454
_0222CD34: .4byte ov13_0222CDA8
	arm_func_end ov13_0222CC80

	arm_func_start ov13_0222CD38
ov13_0222CD38: @ 0x0222CD38
	push {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	beq _0222CD68
	cmp r0, #1
	popne {r3, pc}
	mov r0, #0xe
	bl ov13_0223ABB8
	ldr r0, _0222CD80 @ =0x0224F504
	mov r1, #1
	strb r1, [r0]
	b _0222CD70
_0222CD68:
	mov r0, #7
	bl ov13_0223ABB8
_0222CD70:
	bl ov13_0223C198
	ldr r0, _0222CD84 @ =ov13_0222CD88
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CD80: .4byte 0x0224F504
_0222CD84: .4byte ov13_0222CD88
	arm_func_end ov13_0222CD38

	arm_func_start ov13_0222CD88
ov13_0222CD88: @ 0x0222CD88
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222CDA4 @ =ov13_0222CBFC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CDA4: .4byte ov13_0222CBFC
	arm_func_end ov13_0222CD88

	arm_func_start ov13_0222CDA8
ov13_0222CDA8: @ 0x0222CDA8
	push {r3, lr}
	bl ov13_0222CDCC
	mov r0, #0x19
	bl ov13_022279EC
	bl ov13_0223A840
	ldr r0, _0222CDC8 @ =ov13_0222CE4C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CDC8: .4byte ov13_0222CE4C
	arm_func_end ov13_0222CDA8

	arm_func_start ov13_0222CDCC
ov13_0222CDCC: @ 0x0222CDCC
	push {r3, lr}
	ldr r0, _0222CE3C @ =0x022461A4
	ldr r1, _0222CE40 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _0222CE44 @ =0x04001008
	ldr r1, _0222CE48 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222CE3C: .4byte 0x022461A4
_0222CE40: .4byte FUN_020D00A4
_0222CE44: .4byte 0x04001008
_0222CE48: .4byte 0x0400000A
	arm_func_end ov13_0222CDCC

	arm_func_start ov13_0222CE4C
ov13_0222CE4C: @ 0x0222CE4C
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222CE7C @ =ov13_0222CE80
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CE7C: .4byte ov13_0222CE80
	arm_func_end ov13_0222CE4C

	arm_func_start ov13_0222CE80
ov13_0222CE80: @ 0x0222CE80
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #5
	bl ov13_022279B4
	ldr r0, _0222CEA8 @ =ov13_0222CEAC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CEA8: .4byte ov13_0222CEAC
	arm_func_end ov13_0222CE80

	arm_func_start ov13_0222CEAC
ov13_0222CEAC: @ 0x0222CEAC
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222CED0 @ =ov13_0222CED4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CED0: .4byte ov13_0222CED4
	arm_func_end ov13_0222CEAC

	arm_func_start ov13_0222CED4
ov13_0222CED4: @ 0x0222CED4
	push {r3, lr}
	bl ov13_0222CEE8
	bl ov13_0222CF08
	bl ov13_0222CF0C
	pop {r3, pc}
	arm_func_end ov13_0222CED4

	arm_func_start ov13_0222CEE8
ov13_0222CEE8: @ 0x0222CEE8
	push {r3, lr}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_0222CEE8

	arm_func_start ov13_0222CF08
ov13_0222CF08: @ 0x0222CF08
	bx lr
	arm_func_end ov13_0222CF08

	arm_func_start ov13_0222CF0C
ov13_0222CF0C: @ 0x0222CF0C
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _0222CF30 @ =ov13_0222CF34
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CF30: .4byte ov13_0222CF34
	arm_func_end ov13_0222CF0C

	arm_func_start ov13_0222CF34
ov13_0222CF34: @ 0x0222CF34
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222CF50 @ =ov13_0222CF54
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CF50: .4byte ov13_0222CF54
	arm_func_end ov13_0222CF34

	arm_func_start ov13_0222CF54
ov13_0222CF54: @ 0x0222CF54
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _0222CF9C @ =ov13_0222CFA0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222CF9C: .4byte ov13_0222CFA0
	arm_func_end ov13_0222CF54

	arm_func_start ov13_0222CFA0
ov13_0222CFA0: @ 0x0222CFA0
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0x1000000
	bl FUN_020D3AA8
	bl FUN_020DB330
	pop {r3, pc}
	arm_func_end ov13_0222CFA0

	arm_func_start ov13_0222CFD4
ov13_0222CFD4: @ 0x0222CFD4
	push {r3, lr}
	bl ov13_0222D008
	mov r0, #0x11
	bl ov13_02227DE4
	mov r0, #0x3a
	sub r1, r0, #0x3b
	mov r2, #0
	bl ov13_022277B8
	bl ov13_0222D088
	ldr r0, _0222D004 @ =ov13_0222D25C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D004: .4byte ov13_0222D25C
	arm_func_end ov13_0222CFD4

	arm_func_start ov13_0222D008
ov13_0222D008: @ 0x0222D008
	push {r3, lr}
	ldr r0, _0222D078 @ =0x022461B8
	ldr r1, _0222D07C @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _0222D080 @ =0x04001008
	ldr r1, _0222D084 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222D078: .4byte 0x022461B8
_0222D07C: .4byte FUN_020D00A4
_0222D080: .4byte 0x04001008
_0222D084: .4byte 0x0400000A
	arm_func_end ov13_0222D008

	arm_func_start ov13_0222D088
ov13_0222D088: @ 0x0222D088
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x68
	mov r0, #0
	mov r1, r0
	bl ov13_022408A0
	mov fp, r0
	add r0, sp, #0x14
	bl FUN_020D3C40
	ldrb r1, [sp, #0x15]
	ldr r2, _0222D24C @ =0x022461CC
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
	bl FUN_020ED7EC
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
	bl FUN_0209E430
	ldr sl, [sp, #0x58]
	ldr r8, [sp, #0x54]
	cmp sl, #0
	mov r3, #0
	cmpeq r8, #0
	beq _0222D1F8
	mov r0, r8
	mov r1, sl
	mov r2, #0xa
	bl FUN_020F290C
	mov r1, #0x3e8
	umull r4, r1, r0, r1
	mov r0, r8
	mov r1, sl
	mov r3, #0
	mov r2, #0xa
	str r4, [sp, #0x50]
	bl FUN_020F2900
	mov sb, #0
	ldr r7, _0222D250 @ =0x00002710
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
	bl FUN_020F290C
	rsb r1, sb, #2
	str r0, [r5, r1, lsl #2]
	mov r0, r8
	mov r1, sl
	mov r2, r7
	mov r3, r4
	bl FUN_020F2900
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
	ldr r2, _0222D254 @ =0x02246208
	add r0, sp, #0x1a
	mov r1, #0x14
	str r4, [sp, #8]
	bl FUN_020ED7EC
	b _0222D208
_0222D1F8:
	ldr r2, _0222D258 @ =0x02246230
	add r0, sp, #0x1a
	mov r1, #0x14
	bl FUN_020ED7EC
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
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0222D24C: .4byte 0x022461CC
_0222D250: .4byte 0x00002710
_0222D254: .4byte 0x02246208
_0222D258: .4byte 0x02246230
	arm_func_end ov13_0222D088

	arm_func_start ov13_0222D25C
ov13_0222D25C: @ 0x0222D25C
	push {r3, lr}
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
	ldr r0, _0222D2AC @ =ov13_0222D2B0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D2AC: .4byte ov13_0222D2B0
	arm_func_end ov13_0222D25C

	arm_func_start ov13_0222D2B0
ov13_0222D2B0: @ 0x0222D2B0
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #2
	bl ov13_022279B4
	ldr r0, _0222D2E8 @ =ov13_0222D2EC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D2E8: .4byte ov13_0222D2EC
	arm_func_end ov13_0222D2B0

	arm_func_start ov13_0222D2EC
ov13_0222D2EC: @ 0x0222D2EC
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222D310 @ =ov13_0222D314
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D310: .4byte ov13_0222D314
	arm_func_end ov13_0222D2EC

	arm_func_start ov13_0222D314
ov13_0222D314: @ 0x0222D314
	push {r3, lr}
	bl ov13_0222D328
	bl ov13_0222D348
	bl ov13_0222D34C
	pop {r3, pc}
	arm_func_end ov13_0222D314

	arm_func_start ov13_0222D328
ov13_0222D328: @ 0x0222D328
	push {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_0222D328

	arm_func_start ov13_0222D348
ov13_0222D348: @ 0x0222D348
	bx lr
	arm_func_end ov13_0222D348

	arm_func_start ov13_0222D34C
ov13_0222D34C: @ 0x0222D34C
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	popne {r3, pc}
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _0222D370 @ =ov13_0222D374
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D370: .4byte ov13_0222D374
	arm_func_end ov13_0222D34C

	arm_func_start ov13_0222D374
ov13_0222D374: @ 0x0222D374
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222D390 @ =ov13_0222D394
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D390: .4byte ov13_0222D394
	arm_func_end ov13_0222D374

	arm_func_start ov13_0222D394
ov13_0222D394: @ 0x0222D394
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _0222D3E0 @ =ov13_0222D3E4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D3E0: .4byte ov13_0222D3E4
	arm_func_end ov13_0222D394

	arm_func_start ov13_0222D3E4
ov13_0222D3E4: @ 0x0222D3E4
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
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
	ldr r0, _0222D450 @ =ov13_0222D454
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D450: .4byte ov13_0222D454
	arm_func_end ov13_0222D3E4

	arm_func_start ov13_0222D454
ov13_0222D454: @ 0x0222D454
	push {r4, lr}
	ldr r0, _0222D500 @ =0x0224F508
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
	ldr r2, _0222D500 @ =0x0224F508
	ldr r1, _0222D504 @ =0xFE00FF00
	str r0, [r2, #8]
	ldr r3, [r0]
	ldr lr, _0222D508 @ =0x022453B2
	and r1, r3, r1
	orr r1, r1, #0x84
	orr r1, r1, #0xe00000
	str r1, [r0]
	ldr r4, [r2, #8]
	ldr r1, _0222D50C @ =0x022453B6
	ldrh r0, [r4, #4]
	ldr ip, _0222D510 @ =0x022453B4
	ldr r3, _0222D514 @ =0x022453B8
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r4, #4]
	ldrb r0, [r2]
	lsl r4, r0, #3
	ldrh r0, [lr, r4]
	ldrh r1, [r1, r4]
	ldrh r2, [ip, r4]
	ldrh r3, [r3, r4]
	bl ov13_02227C28
	ldr r0, _0222D518 @ =ov13_0222D6B8
	bl ov13_0222B8E8
	pop {r4, pc}
	.align 2, 0
_0222D500: .4byte 0x0224F508
_0222D504: .4byte 0xFE00FF00
_0222D508: .4byte 0x022453B2
_0222D50C: .4byte 0x022453B6
_0222D510: .4byte 0x022453B4
_0222D514: .4byte 0x022453B8
_0222D518: .4byte ov13_0222D6B8
	arm_func_end ov13_0222D454

	arm_func_start ov13_0222D51C
ov13_0222D51C: @ 0x0222D51C
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x44
	ldr r4, _0222D694 @ =0x0224536C
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
	ldr r4, _0222D698 @ =0x02245382
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
	ldr r0, _0222D69C @ =0x02246258
	ldr r1, _0222D6A0 @ =0x020D03A4
	strb r2, [r3]
	bl ov13_02227924
	ldr r0, _0222D6A4 @ =0x02246270
	ldr r1, _0222D6A8 @ =FUN_020D00A4
	bl ov13_02227924
	add r0, sp, #0x14
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _0222D6AC @ =0x0224F508
	str r0, [r1, #4]
	add r0, sp, #0x2b
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	mov r8, r0
	add r0, sp, #0
	bl FUN_0209E430
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
	bl FUN_020D4A50
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
	bl FUN_020CFC6C
	mov r0, r8
	bl ov13_0223FA50
	ldr r2, _0222D6B0 @ =0x04001008
	ldr r1, _0222D6B4 @ =0x0400000A
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
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0222D694: .4byte 0x0224536C
_0222D698: .4byte 0x02245382
_0222D69C: .4byte 0x02246258
_0222D6A0: .4byte 0x020D03A4
_0222D6A4: .4byte 0x02246270
_0222D6A8: .4byte FUN_020D00A4
_0222D6AC: .4byte 0x0224F508
_0222D6B0: .4byte 0x04001008
_0222D6B4: .4byte 0x0400000A
	arm_func_end ov13_0222D51C

	arm_func_start ov13_0222D6B8
ov13_0222D6B8: @ 0x0222D6B8
	push {r3, lr}
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
	ldr r0, _0222D708 @ =ov13_0222D70C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D708: .4byte ov13_0222D70C
	arm_func_end ov13_0222D6B8

	arm_func_start ov13_0222D70C
ov13_0222D70C: @ 0x0222D70C
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_022279B4
	ldr r0, _0222D744 @ =ov13_0222D748
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D744: .4byte ov13_0222D748
	arm_func_end ov13_0222D70C

	arm_func_start ov13_0222D748
ov13_0222D748: @ 0x0222D748
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222D76C @ =ov13_0222D770
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D76C: .4byte ov13_0222D770
	arm_func_end ov13_0222D748

	arm_func_start ov13_0222D770
ov13_0222D770: @ 0x0222D770
	push {r3, lr}
	bl ov13_0222D784
	bl ov13_0222D878
	bl ov13_0222D87C
	pop {r3, pc}
	arm_func_end ov13_0222D770

	arm_func_start ov13_0222D784
ov13_0222D784: @ 0x0222D784
	push {r3, r4, r5, lr}
	ldr r5, _0222D860 @ =0x0224539A
	mov r4, #0
_0222D790:
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _0222D7E0
	mov r0, #1
	bl ov13_0222726C
	and r1, r4, #0xff
	lsl lr, r1, #3
	ldr r0, _0222D864 @ =0x022453B2
	ldr r1, _0222D868 @ =0x022453B6
	ldr r2, _0222D86C @ =0x022453B4
	ldr r3, _0222D870 @ =0x022453B8
	ldr ip, _0222D874 @ =0x0224F508
	ldrh r0, [r0, lr]
	ldrh r1, [r1, lr]
	ldrh r2, [r2, lr]
	ldrh r3, [r3, lr]
	strb r4, [ip]
	bl ov13_02227C28
	pop {r3, r4, r5, pc}
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
	pop {r3, r4, r5, pc}
_0222D80C:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _0222D828
	mov r0, #0
	bl ov13_0222726C
	pop {r3, r4, r5, pc}
_0222D828:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _0222D844
	mov r0, #1
	bl ov13_0222DAB0
	pop {r3, r4, r5, pc}
_0222D844:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	mov r0, #3
	bl ov13_0222DAB0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222D860: .4byte 0x0224539A
_0222D864: .4byte 0x022453B2
_0222D868: .4byte 0x022453B6
_0222D86C: .4byte 0x022453B4
_0222D870: .4byte 0x022453B8
_0222D874: .4byte 0x0224F508
	arm_func_end ov13_0222D784

	arm_func_start ov13_0222D878
ov13_0222D878: @ 0x0222D878
	bx lr
	arm_func_end ov13_0222D878

	arm_func_start ov13_0222D87C
ov13_0222D87C: @ 0x0222D87C
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	bl ov13_02227258
	cmp r0, #0
	beq _0222D8A0
	cmp r0, #1
	beq _0222D8AC
	add sp, sp, #0x14
	ldm sp!, {pc}
_0222D8A0:
	mov r0, #7
	bl ov13_0223ABB8
	b _0222D908
_0222D8AC:
	add r0, sp, #0
	bl FUN_0209E430
	ldr r0, _0222D918 @ =0x0224F508
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
	ldm sp!, {pc}
_0222D8F0:
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0222DB40
	ldr r0, _0222D918 @ =0x0224F508
	mov r1, #1
	strb r1, [r0, #1]
_0222D908:
	ldr r0, _0222D91C @ =ov13_0222D920
	bl ov13_0222B8E8
	add sp, sp, #0x14
	ldm sp!, {pc}
	.align 2, 0
_0222D918: .4byte 0x0224F508
_0222D91C: .4byte ov13_0222D920
	arm_func_end ov13_0222D87C

	arm_func_start ov13_0222D920
ov13_0222D920: @ 0x0222D920
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222D93C @ =ov13_0222D940
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D93C: .4byte ov13_0222D940
	arm_func_end ov13_0222D920

	arm_func_start ov13_0222D940
ov13_0222D940: @ 0x0222D940
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222D99C @ =0x0224F508
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
	ldr r0, _0222D9A0 @ =ov13_0222D9A4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222D99C: .4byte 0x0224F508
_0222D9A0: .4byte ov13_0222D9A4
	arm_func_end ov13_0222D940

	arm_func_start ov13_0222D9A4
ov13_0222D9A4: @ 0x0222D9A4
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	ldr r0, _0222DA9C @ =0x0224F508
	ldr r0, [r0, #8]
	bl ov13_02241D98
	bl ov13_02227D18
	bl ov13_0222788C
	ldr r0, _0222DA9C @ =0x0224F508
	ldr r0, [r0, #4]
	bl ov13_0223FA50
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EFC
	ldr r0, _0222DA9C @ =0x0224F508
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _0222DA34
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _0222DAA0 @ =ov13_0222C44C
	bl ov13_0222B8E8
	pop {r3, pc}
_0222DA34:
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222DA54
	cmp r0, #1
	beq _0222DA6C
	cmp r0, #2
	beq _0222DA84
	pop {r3, pc}
_0222DA54:
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222DAA4 @ =ov13_0222CFD4
	bl ov13_0222B8E8
	pop {r3, pc}
_0222DA6C:
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222DAA8 @ =ov13_0222C9C4
	bl ov13_0222B8E8
	pop {r3, pc}
_0222DA84:
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222DAAC @ =ov13_0222E220
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DA9C: .4byte 0x0224F508
_0222DAA0: .4byte ov13_0222C44C
_0222DAA4: .4byte ov13_0222CFD4
_0222DAA8: .4byte ov13_0222C9C4
_0222DAAC: .4byte ov13_0222E220
	arm_func_end ov13_0222D9A4

	arm_func_start ov13_0222DAB0
ov13_0222DAB0: @ 0x0222DAB0
	push {r3, lr}
	cmp r0, #1
	mov r1, #3
	bne _0222DAD8
	ldr r0, _0222DB2C @ =0x0224F508
	ldrb r0, [r0]
	add r0, r0, #2
	bl FUN_020CCD3C
	ldr r1, _0222DB2C @ =0x0224F508
	b _0222DAEC
_0222DAD8:
	ldr r0, _0222DB2C @ =0x0224F508
	ldrb r0, [r0]
	add r0, r0, #1
	bl FUN_020CCD3C
	ldr r1, _0222DB2C @ =0x0224F508
_0222DAEC:
	strb r0, [r1]
	mov r0, #8
	bl ov13_0223ABB8
	ldr r0, _0222DB2C @ =0x0224F508
	ldr ip, _0222DB30 @ =0x022453B2
	ldrb r0, [r0]
	ldr r1, _0222DB34 @ =0x022453B6
	ldr r2, _0222DB38 @ =0x022453B4
	lsl lr, r0, #3
	ldr r3, _0222DB3C @ =0x022453B8
	ldrh r0, [ip, lr]
	ldrh r1, [r1, lr]
	ldrh r2, [r2, lr]
	ldrh r3, [r3, lr]
	bl ov13_02227C28
	pop {r3, pc}
	.align 2, 0
_0222DB2C: .4byte 0x0224F508
_0222DB30: .4byte 0x022453B2
_0222DB34: .4byte 0x022453B6
_0222DB38: .4byte 0x022453B4
_0222DB3C: .4byte 0x022453B8
	arm_func_end ov13_0222DAB0

	arm_func_start ov13_0222DB40
ov13_0222DB40: @ 0x0222DB40
	ldr r0, _0222DB60 @ =0x0224F508
	ldr r1, _0222DB64 @ =0x02245364
	ldrb r2, [r0]
	ldr ip, _0222DB68 @ =ov13_02239378
	ldr r0, [r0, #4]
	ldrb r1, [r1, r2]
	mov r2, r1
	bx ip
	.align 2, 0
_0222DB60: .4byte 0x0224F508
_0222DB64: .4byte 0x02245364
_0222DB68: .4byte ov13_02239378
	arm_func_end ov13_0222DB40

	arm_func_start ov13_0222DB6C
ov13_0222DB6C: @ 0x0222DB6C
	push {r3, lr}
	bl ov13_0222DBA4
	mov r0, #0x1e
	bl ov13_022279EC
	mov r0, #0
	bl ov13_02226F58
	mov r0, #1
	bl ov13_02227EB0
	mov r0, #0xb
	bl ov13_0223ABB8
	ldr r0, _0222DBA0 @ =ov13_0222DC24
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DBA0: .4byte ov13_0222DC24
	arm_func_end ov13_0222DB6C

	arm_func_start ov13_0222DBA4
ov13_0222DBA4: @ 0x0222DBA4
	push {r3, lr}
	ldr r0, _0222DC14 @ =0x02246288
	ldr r1, _0222DC18 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _0222DC1C @ =0x04001008
	ldr r1, _0222DC20 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222DC14: .4byte 0x02246288
_0222DC18: .4byte FUN_020D00A4
_0222DC1C: .4byte 0x04001008
_0222DC20: .4byte 0x0400000A
	arm_func_end ov13_0222DBA4

	arm_func_start ov13_0222DC24
ov13_0222DC24: @ 0x0222DC24
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222DC54 @ =ov13_0222DC58
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DC54: .4byte ov13_0222DC58
	arm_func_end ov13_0222DC24

	arm_func_start ov13_0222DC58
ov13_0222DC58: @ 0x0222DC58
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222DC80 @ =ov13_0222DD5C
	bl ov13_0222BC84
	ldr r0, _0222DC84 @ =ov13_0222DC88
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DC80: .4byte ov13_0222DD5C
_0222DC84: .4byte ov13_0222DC88
	arm_func_end ov13_0222DC58

	arm_func_start ov13_0222DC88
ov13_0222DC88: @ 0x0222DC88
	push {r3, lr}
	bl ov13_0222DC98
	bl ov13_0222DC9C
	pop {r3, pc}
	arm_func_end ov13_0222DC88

	arm_func_start ov13_0222DC98
ov13_0222DC98: @ 0x0222DC98
	bx lr
	arm_func_end ov13_0222DC98

	arm_func_start ov13_0222DC9C
ov13_0222DC9C: @ 0x0222DC9C
	bx lr
	arm_func_end ov13_0222DC9C

	arm_func_start ov13_0222DCA0
ov13_0222DCA0: @ 0x0222DCA0
	push {r3, lr}
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222DCC4 @ =ov13_0222DCC8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DCC4: .4byte ov13_0222DCC8
	arm_func_end ov13_0222DCA0

	arm_func_start ov13_0222DCC8
ov13_0222DCC8: @ 0x0222DCC8
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0222BC68
	cmp r0, #0
	popeq {r3, pc}
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
	ldr r0, _0222DD4C @ =0x0224F514
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222DD2C
	ldr r0, _0222DD50 @ =ov13_0222E754
	bl ov13_0222B8E8
	pop {r3, pc}
_0222DD2C:
	cmp r0, #2
	bne _0222DD40
	ldr r0, _0222DD54 @ =ov13_0222E56C
	bl ov13_0222B8E8
	pop {r3, pc}
_0222DD40:
	ldr r0, _0222DD58 @ =ov13_0222DDE4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DD4C: .4byte 0x0224F514
_0222DD50: .4byte ov13_0222E754
_0222DD54: .4byte ov13_0222E56C
_0222DD58: .4byte ov13_0222DDE4
	arm_func_end ov13_0222DCC8

	arm_func_start ov13_0222DD5C
ov13_0222DD5C: @ 0x0222DD5C
	push {r3, lr}
	cmp r0, #2
	bne _0222DD88
	bl ov13_0223A840
	ldr r0, _0222DDDC @ =0x0224F514
	mov r1, #1
	strb r1, [r0]
	bl ov13_0223AC20
	mov r0, #0x10
	bl ov13_0223ABB8
	b _0222DDC4
_0222DD88:
	cmp r0, #3
	bne _0222DDAC
	ldr r0, _0222DDDC @ =0x0224F514
	mov r1, #2
	strb r1, [r0]
	bl ov13_0223AC20
	mov r0, #0x12
	bl ov13_0223ABB8
	b _0222DDC4
_0222DDAC:
	ldr r0, _0222DDDC @ =0x0224F514
	mov r1, #0
	strb r1, [r0]
	bl ov13_0223AC20
	mov r0, #0x12
	bl ov13_0223ABB8
_0222DDC4:
	mov r0, #0
	bl ov13_0222BC84
	bl ov13_0222BC0C
	ldr r0, _0222DDE0 @ =ov13_0222DCA0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DDDC: .4byte 0x0224F514
_0222DDE0: .4byte ov13_0222DCA0
	arm_func_end ov13_0222DD5C

	arm_func_start ov13_0222DDE4
ov13_0222DDE4: @ 0x0222DDE4
	push {r3, lr}
	bl ov13_0222DE04
	mov r0, #0x1f
	bl ov13_022279EC
	ldr r0, _0222DE00 @ =ov13_0222DE6C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DE00: .4byte ov13_0222DE6C
	arm_func_end ov13_0222DDE4

	arm_func_start ov13_0222DE04
ov13_0222DE04: @ 0x0222DE04
	ldr r3, _0222DE64 @ =0x04001008
	ldr r1, _0222DE68 @ =0x0400000A
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
	.align 2, 0
_0222DE64: .4byte 0x04001008
_0222DE68: .4byte 0x0400000A
	arm_func_end ov13_0222DE04

	arm_func_start ov13_0222DE6C
ov13_0222DE6C: @ 0x0222DE6C
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222DE9C @ =ov13_0222DEA0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DE9C: .4byte ov13_0222DEA0
	arm_func_end ov13_0222DE6C

	arm_func_start ov13_0222DEA0
ov13_0222DEA0: @ 0x0222DEA0
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #5
	bl ov13_022279B4
	ldr r0, _0222DEC8 @ =ov13_0222DECC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DEC8: .4byte ov13_0222DECC
	arm_func_end ov13_0222DEA0

	arm_func_start ov13_0222DECC
ov13_0222DECC: @ 0x0222DECC
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222DEF0 @ =ov13_0222DEF4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DEF0: .4byte ov13_0222DEF4
	arm_func_end ov13_0222DECC

	arm_func_start ov13_0222DEF4
ov13_0222DEF4: @ 0x0222DEF4
	push {r3, lr}
	bl ov13_0222DF08
	bl ov13_0222DF28
	bl ov13_0222DF2C
	pop {r3, pc}
	arm_func_end ov13_0222DEF4

	arm_func_start ov13_0222DF08
ov13_0222DF08: @ 0x0222DF08
	push {r3, lr}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_0222DF08

	arm_func_start ov13_0222DF28
ov13_0222DF28: @ 0x0222DF28
	bx lr
	arm_func_end ov13_0222DF28

	arm_func_start ov13_0222DF2C
ov13_0222DF2C: @ 0x0222DF2C
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _0222DF50 @ =ov13_0222DF54
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DF50: .4byte ov13_0222DF54
	arm_func_end ov13_0222DF2C

	arm_func_start ov13_0222DF54
ov13_0222DF54: @ 0x0222DF54
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222DF70 @ =ov13_0222DF74
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DF70: .4byte ov13_0222DF74
	arm_func_end ov13_0222DF54

	arm_func_start ov13_0222DF74
ov13_0222DF74: @ 0x0222DF74
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _0222DFBC @ =ov13_0222DFC0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222DFBC: .4byte ov13_0222DFC0
	arm_func_end ov13_0222DF74

	arm_func_start ov13_0222DFC0
ov13_0222DFC0: @ 0x0222DFC0
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0x1000000
	bl FUN_020D3AA8
	bl FUN_020DB330
	pop {r3, pc}
	arm_func_end ov13_0222DFC0

	arm_func_start ov13_0222DFF4
ov13_0222DFF4: @ 0x0222DFF4
	push {r3, lr}
	bl ov13_0222E014
	mov r0, #0x1a
	bl ov13_022279EC
	ldr r0, _0222E010 @ =ov13_0222E07C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E010: .4byte ov13_0222E07C
	arm_func_end ov13_0222DFF4

	arm_func_start ov13_0222E014
ov13_0222E014: @ 0x0222E014
	ldr r3, _0222E074 @ =0x04001008
	ldr r1, _0222E078 @ =0x0400000A
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
	.align 2, 0
_0222E074: .4byte 0x04001008
_0222E078: .4byte 0x0400000A
	arm_func_end ov13_0222E014

	arm_func_start ov13_0222E07C
ov13_0222E07C: @ 0x0222E07C
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222E0AC @ =ov13_0222E0B0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E0AC: .4byte ov13_0222E0B0
	arm_func_end ov13_0222E07C

	arm_func_start ov13_0222E0B0
ov13_0222E0B0: @ 0x0222E0B0
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #4
	bl ov13_022279B4
	ldr r0, _0222E0E8 @ =ov13_0222E0EC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E0E8: .4byte ov13_0222E0EC
	arm_func_end ov13_0222E0B0

	arm_func_start ov13_0222E0EC
ov13_0222E0EC: @ 0x0222E0EC
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222E110 @ =ov13_0222E114
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E110: .4byte ov13_0222E114
	arm_func_end ov13_0222E0EC

	arm_func_start ov13_0222E114
ov13_0222E114: @ 0x0222E114
	push {r3, lr}
	bl ov13_0222E128
	bl ov13_0222E148
	bl ov13_0222E14C
	pop {r3, pc}
	arm_func_end ov13_0222E114

	arm_func_start ov13_0222E128
ov13_0222E128: @ 0x0222E128
	push {r3, lr}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_0222E128

	arm_func_start ov13_0222E148
ov13_0222E148: @ 0x0222E148
	bx lr
	arm_func_end ov13_0222E148

	arm_func_start ov13_0222E14C
ov13_0222E14C: @ 0x0222E14C
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _0222E170 @ =ov13_0222E174
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E170: .4byte ov13_0222E174
	arm_func_end ov13_0222E14C

	arm_func_start ov13_0222E174
ov13_0222E174: @ 0x0222E174
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222E190 @ =ov13_0222E194
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E190: .4byte ov13_0222E194
	arm_func_end ov13_0222E174

	arm_func_start ov13_0222E194
ov13_0222E194: @ 0x0222E194
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02227228
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _0222E1CC @ =ov13_0222E1D0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E1CC: .4byte ov13_0222E1D0
	arm_func_end ov13_0222E194

	arm_func_start ov13_0222E1D0
ov13_0222E1D0: @ 0x0222E1D0
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222E21C @ =ov13_0222EEB4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E21C: .4byte ov13_0222EEB4
	arm_func_end ov13_0222E1D0

	arm_func_start ov13_0222E220
ov13_0222E220: @ 0x0222E220
	push {r3, lr}
	ldr r0, _0222E260 @ =0x0224F518
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
	ldr r0, _0222E264 @ =ov13_0222E2E8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E260: .4byte 0x0224F518
_0222E264: .4byte ov13_0222E2E8
	arm_func_end ov13_0222E220

	arm_func_start ov13_0222E268
ov13_0222E268: @ 0x0222E268
	push {r3, lr}
	ldr r0, _0222E2D8 @ =0x0224629C
	ldr r1, _0222E2DC @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _0222E2E0 @ =0x04001008
	ldr r1, _0222E2E4 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222E2D8: .4byte 0x0224629C
_0222E2DC: .4byte FUN_020D00A4
_0222E2E0: .4byte 0x04001008
_0222E2E4: .4byte 0x0400000A
	arm_func_end ov13_0222E268

	arm_func_start ov13_0222E2E8
ov13_0222E2E8: @ 0x0222E2E8
	push {r3, lr}
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
	ldr r0, _0222E338 @ =ov13_0222E33C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E338: .4byte ov13_0222E33C
	arm_func_end ov13_0222E2E8

	arm_func_start ov13_0222E33C
ov13_0222E33C: @ 0x0222E33C
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #3
	bl ov13_022279B4
	ldr r0, _0222E364 @ =ov13_0222E368
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E364: .4byte ov13_0222E368
	arm_func_end ov13_0222E33C

	arm_func_start ov13_0222E368
ov13_0222E368: @ 0x0222E368
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222E38C @ =ov13_0222E390
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E38C: .4byte ov13_0222E390
	arm_func_end ov13_0222E368

	arm_func_start ov13_0222E390
ov13_0222E390: @ 0x0222E390
	push {r3, lr}
	bl ov13_0222E3A4
	bl ov13_0222E3DC
	bl ov13_0222E3E0
	pop {r3, pc}
	arm_func_end ov13_0222E390

	arm_func_start ov13_0222E3A4
ov13_0222E3A4: @ 0x0222E3A4
	push {r3, lr}
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
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_0222E3A4

	arm_func_start ov13_0222E3DC
ov13_0222E3DC: @ 0x0222E3DC
	bx lr
	arm_func_end ov13_0222E3DC

	arm_func_start ov13_0222E3E0
ov13_0222E3E0: @ 0x0222E3E0
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	beq _0222E3FC
	cmp r0, #1
	beq _0222E408
	pop {r3, pc}
_0222E3FC:
	mov r0, #7
	bl ov13_0223ABB8
	b _0222E41C
_0222E408:
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _0222E428 @ =0x0224F518
	mov r1, #1
	strb r1, [r0]
_0222E41C:
	ldr r0, _0222E42C @ =ov13_0222E430
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E428: .4byte 0x0224F518
_0222E42C: .4byte ov13_0222E430
	arm_func_end ov13_0222E3E0

	arm_func_start ov13_0222E430
ov13_0222E430: @ 0x0222E430
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222E44C @ =ov13_0222E450
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E44C: .4byte ov13_0222E450
	arm_func_end ov13_0222E430

	arm_func_start ov13_0222E450
ov13_0222E450: @ 0x0222E450
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02227228
	ldr r0, _0222E4AC @ =0x0224F518
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
	ldr r0, _0222E4B0 @ =ov13_0222E4B4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E4AC: .4byte 0x0224F518
_0222E4B0: .4byte ov13_0222E4B4
	arm_func_end ov13_0222E450

	arm_func_start ov13_0222E4B4
ov13_0222E4B4: @ 0x0222E4B4
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222E560 @ =0x0224F518
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222E4E8
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
_0222E4E8:
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0222E560 @ =0x0224F518
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
	ldr r0, _0222E560 @ =0x0224F518
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	mov r0, #0
	bne _0222E550
	bl ov13_0222B8F8
	ldr r0, _0222E564 @ =ov13_0222D454
	bl ov13_0222B8E8
	pop {r3, pc}
_0222E550:
	bl ov13_0222B8F8
	ldr r0, _0222E568 @ =ov13_0222DFF4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E560: .4byte 0x0224F518
_0222E564: .4byte ov13_0222D454
_0222E568: .4byte ov13_0222DFF4
	arm_func_end ov13_0222E4B4

	arm_func_start ov13_0222E56C
ov13_0222E56C: @ 0x0222E56C
	push {r3, lr}
	ldr r0, _0222E594 @ =0x0224F51C
	mov r1, #0
	strb r1, [r0]
	bl ov13_0222E59C
	mov r0, #0x21
	bl ov13_022279EC
	ldr r0, _0222E598 @ =ov13_0222E608
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E594: .4byte 0x0224F51C
_0222E598: .4byte ov13_0222E608
	arm_func_end ov13_0222E56C

	arm_func_start ov13_0222E59C
ov13_0222E59C: @ 0x0222E59C
	push {r3, lr}
	ldr r0, _0222E5F8 @ =0x022462B0
	ldr r1, _0222E5FC @ =FUN_020D00A4
	bl ov13_02227924
	ldr r2, _0222E600 @ =0x04001008
	ldr r1, _0222E604 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222E5F8: .4byte 0x022462B0
_0222E5FC: .4byte FUN_020D00A4
_0222E600: .4byte 0x04001008
_0222E604: .4byte 0x0400000A
	arm_func_end ov13_0222E59C

	arm_func_start ov13_0222E608
ov13_0222E608: @ 0x0222E608
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222E638 @ =ov13_0222E63C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E638: .4byte ov13_0222E63C
	arm_func_end ov13_0222E608

	arm_func_start ov13_0222E63C
ov13_0222E63C: @ 0x0222E63C
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0222BC68
	cmp r0, #0
	popeq {r3, pc}
	ldr r0, _0222E668 @ =ov13_0222E66C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E668: .4byte ov13_0222E66C
	arm_func_end ov13_0222E63C

	arm_func_start ov13_0222E66C
ov13_0222E66C: @ 0x0222E66C
	push {r3, lr}
	bl ov13_0222E720
	bl ov13_0222E67C
	pop {r3, pc}
	arm_func_end ov13_0222E66C

	arm_func_start ov13_0222E67C
ov13_0222E67C: @ 0x0222E67C
	bx lr
	arm_func_end ov13_0222E67C

	arm_func_start ov13_0222E680
ov13_0222E680: @ 0x0222E680
	push {r3, lr}
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
	ldr r0, _0222E6B8 @ =ov13_0222E6BC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E6B8: .4byte ov13_0222E6BC
	arm_func_end ov13_0222E680

	arm_func_start ov13_0222E6BC
ov13_0222E6BC: @ 0x0222E6BC
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _0222E71C @ =ov13_0222D454
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E71C: .4byte ov13_0222D454
	arm_func_end ov13_0222E6BC

	arm_func_start ov13_0222E720
ov13_0222E720: @ 0x0222E720
	push {r3, lr}
	ldr r0, _0222E74C @ =0x0224F51C
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0x78
	poplo {r3, pc}
	ldr r0, _0222E750 @ =ov13_0222E680
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E74C: .4byte 0x0224F51C
_0222E750: .4byte ov13_0222E680
	arm_func_end ov13_0222E720

	arm_func_start ov13_0222E754
ov13_0222E754: @ 0x0222E754
	push {r3, lr}
	bl ov13_0222E790
	mov r0, #0x20
	bl ov13_022279EC
	mov r0, #0x3c
	sub r1, r0, #0x3d
	mov r2, #0
	bl ov13_022277B8
	ldr r1, _0222E788 @ =0x0224F520
	strb r0, [r1]
	ldr r0, _0222E78C @ =ov13_0222E810
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E788: .4byte 0x0224F520
_0222E78C: .4byte ov13_0222E810
	arm_func_end ov13_0222E754

	arm_func_start ov13_0222E790
ov13_0222E790: @ 0x0222E790
	push {r3, lr}
	ldr r0, _0222E800 @ =0x022462C4
	ldr r1, _0222E804 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _0222E808 @ =0x04001008
	ldr r1, _0222E80C @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222E800: .4byte 0x022462C4
_0222E804: .4byte FUN_020D00A4
_0222E808: .4byte 0x04001008
_0222E80C: .4byte 0x0400000A
	arm_func_end ov13_0222E790

	arm_func_start ov13_0222E810
ov13_0222E810: @ 0x0222E810
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222E870 @ =0x0224F520
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
	ldr r0, _0222E874 @ =ov13_0222E878
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E870: .4byte 0x0224F520
_0222E874: .4byte ov13_0222E878
	arm_func_end ov13_0222E810

	arm_func_start ov13_0222E878
ov13_0222E878: @ 0x0222E878
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #3
	bl ov13_022279B4
	ldr r0, _0222E8B0 @ =ov13_0222E8B4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E8B0: .4byte ov13_0222E8B4
	arm_func_end ov13_0222E878

	arm_func_start ov13_0222E8B4
ov13_0222E8B4: @ 0x0222E8B4
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_0222BC68
	cmp r0, #0
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222E8E4 @ =ov13_0222E8E8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E8E4: .4byte ov13_0222E8E8
	arm_func_end ov13_0222E8B4

	arm_func_start ov13_0222E8E8
ov13_0222E8E8: @ 0x0222E8E8
	push {r3, lr}
	bl ov13_0222E8FC
	bl ov13_0222E934
	bl ov13_0222E938
	pop {r3, pc}
	arm_func_end ov13_0222E8E8

	arm_func_start ov13_0222E8FC
ov13_0222E8FC: @ 0x0222E8FC
	push {r3, lr}
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
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_0222E8FC

	arm_func_start ov13_0222E934
ov13_0222E934: @ 0x0222E934
	bx lr
	arm_func_end ov13_0222E934

	arm_func_start ov13_0222E938
ov13_0222E938: @ 0x0222E938
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	beq _0222E968
	cmp r0, #1
	popne {r3, pc}
	ldr r1, _0222E988 @ =0x0224F520
	mov r2, #1
	mov r0, #6
	strb r2, [r1, #1]
	bl ov13_0223ABB8
	b _0222E97C
_0222E968:
	ldr r1, _0222E988 @ =0x0224F520
	mov r2, #0
	mov r0, #7
	strb r2, [r1, #1]
	bl ov13_0223ABB8
_0222E97C:
	ldr r0, _0222E98C @ =ov13_0222E990
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E988: .4byte 0x0224F520
_0222E98C: .4byte ov13_0222E990
	arm_func_end ov13_0222E938

	arm_func_start ov13_0222E990
ov13_0222E990: @ 0x0222E990
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222E9AC @ =ov13_0222E9B0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222E9AC: .4byte ov13_0222E9B0
	arm_func_end ov13_0222E990

	arm_func_start ov13_0222E9B0
ov13_0222E9B0: @ 0x0222E9B0
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02227228
	ldr r0, _0222EA0C @ =0x0224F520
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
	ldr r0, _0222EA10 @ =ov13_0222EA14
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222EA0C: .4byte 0x0224F520
_0222EA10: .4byte ov13_0222EA14
	arm_func_end ov13_0222E9B0

	arm_func_start ov13_0222EA14
ov13_0222EA14: @ 0x0222EA14
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0222EAB0 @ =0x0224F520
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
	ldr r0, _0222EAB0 @ =0x0224F520
	mov r1, #1
	ldrb r0, [r0, #1]
	cmp r0, #0
	mov r0, #0
	bne _0222EAA0
	bl ov13_0222B8F8
	ldr r0, _0222EAB4 @ =ov13_0222D454
	bl ov13_0222B8E8
	pop {r3, pc}
_0222EAA0:
	bl ov13_0222B8F8
	ldr r0, _0222EAB8 @ =ov13_0222EEB4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222EAB0: .4byte 0x0224F520
_0222EAB4: .4byte ov13_0222D454
_0222EAB8: .4byte ov13_0222EEB4
	arm_func_end ov13_0222EA14

	arm_func_start ov13_0222EABC
ov13_0222EABC: @ 0x0222EABC
	push {r3, r4, r5, lr}
	sub sp, sp, #0x28
	bl ov13_0222BCA8
	mov r5, r0
	mov r0, #0
	mov r1, r0
	bl ov13_022408A0
	ldr r1, _0222EB80 @ =0x0224F524
	mov r2, #0
	strb r2, [r1, #1]
	mov r4, r0
	strb r2, [r1]
	bl ov13_0222EB8C
	mov r0, #0
	add r1, sp, #0x10
	mov r2, #0x16
	bl FUN_020D4790
	ldrb r2, [r5, #1]
	add r0, r5, #2
	add r1, sp, #0x10
	lsl r2, r2, #1
	bl FUN_020D47B8
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
	ldr r0, _0222EB84 @ =ov13_0222EE80
	bl ov13_0222BC84
	mov r1, #4
	mov r2, #0
	mov r0, #0x1d
	sub r3, r1, #5
	str r2, [sp]
	bl ov13_0223BE6C
	ldr r0, _0222EB88 @ =ov13_0222EC0C
	bl ov13_0222B8E8
	add sp, sp, #0x28
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222EB80: .4byte 0x0224F524
_0222EB84: .4byte ov13_0222EE80
_0222EB88: .4byte ov13_0222EC0C
	arm_func_end ov13_0222EABC

	arm_func_start ov13_0222EB8C
ov13_0222EB8C: @ 0x0222EB8C
	push {r3, lr}
	ldr r0, _0222EBFC @ =0x022462D8
	ldr r1, _0222EC00 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _0222EC04 @ =0x04001008
	ldr r1, _0222EC08 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222EBFC: .4byte 0x022462D8
_0222EC00: .4byte FUN_020D00A4
_0222EC04: .4byte 0x04001008
_0222EC08: .4byte 0x0400000A
	arm_func_end ov13_0222EB8C

	arm_func_start ov13_0222EC0C
ov13_0222EC0C: @ 0x0222EC0C
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222EC3C @ =ov13_0222EC40
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222EC3C: .4byte ov13_0222EC40
	arm_func_end ov13_0222EC0C

	arm_func_start ov13_0222EC40
ov13_0222EC40: @ 0x0222EC40
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222EC60 @ =ov13_0222EC64
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222EC60: .4byte ov13_0222EC64
	arm_func_end ov13_0222EC40

	arm_func_start ov13_0222EC64
ov13_0222EC64: @ 0x0222EC64
	push {r3, lr}
	bl ov13_0223C1DC
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	ldr r0, _0222EC84 @ =ov13_0222EC88
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222EC84: .4byte ov13_0222EC88
	arm_func_end ov13_0222EC64

	arm_func_start ov13_0222EC88
ov13_0222EC88: @ 0x0222EC88
	push {r3, lr}
	bl ov13_0222ECF8
	bl ov13_0222ECFC
	bl ov13_0223C1DC
	cmp r0, #0
	beq _0222ECAC
	cmp r0, #1
	beq _0222ECC4
	pop {r3, pc}
_0222ECAC:
	ldr r1, _0222ECF0 @ =0x0224F524
	mov r2, #0
	mov r0, #7
	strb r2, [r1, #1]
	bl ov13_0223ABB8
	b _0222ECD8
_0222ECC4:
	ldr r1, _0222ECF0 @ =0x0224F524
	mov r2, #1
	mov r0, #0xe
	strb r2, [r1, #1]
	bl ov13_0223ABB8
_0222ECD8:
	mov r0, #0
	bl ov13_0222BC84
	bl ov13_0223C198
	ldr r0, _0222ECF4 @ =ov13_0222ED00
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222ECF0: .4byte 0x0224F524
_0222ECF4: .4byte ov13_0222ED00
	arm_func_end ov13_0222EC88

	arm_func_start ov13_0222ECF8
ov13_0222ECF8: @ 0x0222ECF8
	bx lr
	arm_func_end ov13_0222ECF8

	arm_func_start ov13_0222ECFC
ov13_0222ECFC: @ 0x0222ECFC
	bx lr
	arm_func_end ov13_0222ECFC

	arm_func_start ov13_0222ED00
ov13_0222ED00: @ 0x0222ED00
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222ED54 @ =0x0224F524
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
	ldr r0, _0222ED58 @ =ov13_0222ED5C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222ED54: .4byte 0x0224F524
_0222ED58: .4byte ov13_0222ED5C
	arm_func_end ov13_0222ED00

	arm_func_start ov13_0222ED5C
ov13_0222ED5C: @ 0x0222ED5C
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222EDB0 @ =0x0224F524
	ldrb r1, [r0]
	cmp r1, #0
	ldrbeq r0, [r0, #1]
	cmpeq r0, #1
	bne _0222EDA0
	bl ov13_0222BC9C
	b _0222EDA4
_0222EDA0:
	bl ov13_0222BC0C
_0222EDA4:
	ldr r0, _0222EDB4 @ =ov13_0222EDB8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222EDB0: .4byte 0x0224F524
_0222EDB4: .4byte ov13_0222EDB8
	arm_func_end ov13_0222ED5C

	arm_func_start ov13_0222EDB8
ov13_0222EDB8: @ 0x0222EDB8
	push {r3, lr}
	ldr r0, _0222EE70 @ =0x0224F524
	ldrb r1, [r0]
	cmp r1, #0
	bne _0222EDD8
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0222EDE4
_0222EDD8:
	bl ov13_0222BC68
	cmp r0, #0
	popeq {r3, pc}
_0222EDE4:
	mov r0, #0
	bl ov13_02240B04
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _0222EE70 @ =0x0224F524
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
	ldr r0, _0222EE70 @ =0x0224F524
	ldrb r1, [r0]
	cmp r1, #0
	beq _0222EE40
	ldr r0, _0222EE74 @ =ov13_0222E754
	bl ov13_0222B8E8
	pop {r3, pc}
_0222EE40:
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0222EE64
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	ldr r0, _0222EE78 @ =ov13_0222D454
	bl ov13_0222B8E8
	pop {r3, pc}
_0222EE64:
	ldr r0, _0222EE7C @ =ov13_0222DB6C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222EE70: .4byte 0x0224F524
_0222EE74: .4byte ov13_0222E754
_0222EE78: .4byte ov13_0222D454
_0222EE7C: .4byte ov13_0222DB6C
	arm_func_end ov13_0222EDB8

	arm_func_start ov13_0222EE80
ov13_0222EE80: @ 0x0222EE80
	ldr r0, _0222EE90 @ =0x0224F524
	mov r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0222EE90: .4byte 0x0224F524
	arm_func_end ov13_0222EE80

	arm_func_start ov13_0222EE94
ov13_0222EE94: @ 0x0222EE94
	ldr r0, _0222EEB0 @ =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_0222EEB0: .4byte 0x027FFFA8
	arm_func_end ov13_0222EE94

	arm_func_start ov13_0222EEB4
ov13_0222EEB4: @ 0x0222EEB4
	push {r3, lr}
	ldr r0, _0222EEF4 @ =ov13_0222F230
	bl ov13_0222BB20
	ldr r0, _0222EEF8 @ =0x0224F528
	mov r1, #0
	strb r1, [r0]
	bl ov13_0222EF00
	mov r0, #0x1c
	bl ov13_022279EC
	mov r0, #0
	bl ov13_02226F58
	mov r0, #0xb
	bl ov13_0223ABB8
	ldr r0, _0222EEFC @ =ov13_0222EF80
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222EEF4: .4byte ov13_0222F230
_0222EEF8: .4byte 0x0224F528
_0222EEFC: .4byte ov13_0222EF80
	arm_func_end ov13_0222EEB4

	arm_func_start ov13_0222EF00
ov13_0222EF00: @ 0x0222EF00
	push {r3, lr}
	ldr r0, _0222EF70 @ =0x022462EC
	ldr r1, _0222EF74 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _0222EF78 @ =0x04001008
	ldr r1, _0222EF7C @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222EF70: .4byte 0x022462EC
_0222EF74: .4byte FUN_020D00A4
_0222EF78: .4byte 0x04001008
_0222EF7C: .4byte 0x0400000A
	arm_func_end ov13_0222EF00

	arm_func_start ov13_0222EF80
ov13_0222EF80: @ 0x0222EF80
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222EFB0 @ =ov13_0222EFB4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222EFB0: .4byte ov13_0222EFB4
	arm_func_end ov13_0222EF80

	arm_func_start ov13_0222EFB4
ov13_0222EFB4: @ 0x0222EFB4
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #1
	bl ov13_022279B4
	ldr r0, _0222EFDC @ =ov13_0222EFE0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222EFDC: .4byte ov13_0222EFE0
	arm_func_end ov13_0222EFB4

	arm_func_start ov13_0222EFE0
ov13_0222EFE0: @ 0x0222EFE0
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	ldr r0, _0222F000 @ =ov13_0222F004
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F000: .4byte ov13_0222F004
	arm_func_end ov13_0222EFE0

	arm_func_start ov13_0222F004
ov13_0222F004: @ 0x0222F004
	push {r3, lr}
	bl ov13_0222F018
	bl ov13_0222F050
	bl ov13_0222F054
	pop {r3, pc}
	arm_func_end ov13_0222F004

	arm_func_start ov13_0222F018
ov13_0222F018: @ 0x0222F018
	push {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _0222F038
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
_0222F038:
	bl ov13_0222EE94
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_0222F018

	arm_func_start ov13_0222F050
ov13_0222F050: @ 0x0222F050
	bx lr
	arm_func_end ov13_0222F050

	arm_func_start ov13_0222F054
ov13_0222F054: @ 0x0222F054
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _0222F07C @ =ov13_0222F080
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F07C: .4byte ov13_0222F080
	arm_func_end ov13_0222F054

	arm_func_start ov13_0222F080
ov13_0222F080: @ 0x0222F080
	push {r3, lr}
	ldr r0, _0222F0B0 @ =0x0224F528
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F098
	bl ov13_0222BC0C
_0222F098:
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222F0B4 @ =ov13_0222F0B8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F0B0: .4byte 0x0224F528
_0222F0B4: .4byte ov13_0222F0B8
	arm_func_end ov13_0222F080

	arm_func_start ov13_0222F0B8
ov13_0222F0B8: @ 0x0222F0B8
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222F130 @ =0x0224F528
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F0E8
	bl ov13_0222BC68
	cmp r0, #0
	popeq {r3, pc}
_0222F0E8:
	bl ov13_02227228
	ldr r0, _0222F130 @ =0x0224F528
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
	ldr r0, _0222F134 @ =ov13_0222F138
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F130: .4byte 0x0224F528
_0222F134: .4byte ov13_0222F138
	arm_func_end ov13_0222F0B8

	arm_func_start ov13_0222F138
ov13_0222F138: @ 0x0222F138
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222F220 @ =0x0224F528
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F16C
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
_0222F16C:
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	ldr r0, _0222F220 @ =0x0224F528
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F194
	bl ov13_0222BC68
	cmp r0, #0
	popeq {r3, pc}
_0222F194:
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0222F220 @ =0x0224F528
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
	ldr r0, _0222F220 @ =0x0224F528
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F1F4
	mov r0, #0
	bl ov13_0222B8F8
	ldr r0, _0222F224 @ =ov13_0222D454
	bl ov13_0222B8E8
	pop {r3, pc}
_0222F1F4:
	cmp r0, #2
	mov r0, #0
	bne _0222F210
	bl ov13_0222B8F8
	ldr r0, _0222F228 @ =ov13_0222E754
	bl ov13_0222B8E8
	pop {r3, pc}
_0222F210:
	bl ov13_0222B8F8
	ldr r0, _0222F22C @ =ov13_0222EABC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F220: .4byte 0x0224F528
_0222F224: .4byte ov13_0222D454
_0222F228: .4byte ov13_0222E754
_0222F22C: .4byte ov13_0222EABC
	arm_func_end ov13_0222F138

	arm_func_start ov13_0222F230
ov13_0222F230: @ 0x0222F230
	push {r4, lr}
	mov r4, r0
	bl ov13_0223AC20
	cmp r4, #0
	bne _0222F25C
	ldr r1, _0222F284 @ =0x0224F528
	mov r2, #1
	mov r0, #0x10
	strb r2, [r1]
	bl ov13_0223ABB8
	b _0222F270
_0222F25C:
	ldr r1, _0222F284 @ =0x0224F528
	mov r2, #2
	mov r0, #0x12
	strb r2, [r1]
	bl ov13_0223ABB8
_0222F270:
	mov r0, #0
	bl ov13_0222BC84
	ldr r0, _0222F288 @ =ov13_0222F080
	bl ov13_0222B8E8
	pop {r4, pc}
	.align 2, 0
_0222F284: .4byte 0x0224F528
_0222F288: .4byte ov13_0222F080
	arm_func_end ov13_0222F230

	arm_func_start ov13_0222F28C
ov13_0222F28C: @ 0x0222F28C
	ldr r0, _0222F2A8 @ =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_0222F2A8: .4byte 0x027FFFA8
	arm_func_end ov13_0222F28C

	arm_func_start ov13_0222F2AC
ov13_0222F2AC: @ 0x0222F2AC
	push {r3, lr}
	ldr r0, _0222F304 @ =0x0224F52C
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
	ldr r0, _0222F308 @ =ov13_0222F3B4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F304: .4byte 0x0224F52C
_0222F308: .4byte ov13_0222F3B4
	arm_func_end ov13_0222F2AC

	arm_func_start ov13_0222F30C
ov13_0222F30C: @ 0x0222F30C
	push {r3, lr}
	ldr r0, _0222F394 @ =0x02246300
	ldr r1, _0222F398 @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _0222F39C @ =0x02246318
	ldr r1, _0222F3A0 @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _0222F3A4 @ =0x02246330
	ldr r1, _0222F3A8 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _0222F3AC @ =0x04001008
	ldr r1, _0222F3B0 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222F394: .4byte 0x02246300
_0222F398: .4byte 0x020D03A4
_0222F39C: .4byte 0x02246318
_0222F3A0: .4byte FUN_020CFC6C
_0222F3A4: .4byte 0x02246330
_0222F3A8: .4byte FUN_020D00A4
_0222F3AC: .4byte 0x04001008
_0222F3B0: .4byte 0x0400000A
	arm_func_end ov13_0222F30C

	arm_func_start ov13_0222F3B4
ov13_0222F3B4: @ 0x0222F3B4
	push {r3, lr}
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
	ldr r0, _0222F404 @ =ov13_0222F408
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F404: .4byte ov13_0222F408
	arm_func_end ov13_0222F3B4

	arm_func_start ov13_0222F408
ov13_0222F408: @ 0x0222F408
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #1
	bl ov13_022279B4
	ldr r0, _0222F440 @ =ov13_0222F444
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F440: .4byte ov13_0222F444
	arm_func_end ov13_0222F408

	arm_func_start ov13_0222F444
ov13_0222F444: @ 0x0222F444
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	ldr r1, _0222F480 @ =ov13_0222F764
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0222F484 @ =0x0224F52C
	str r0, [r1, #4]
	ldr r0, _0222F488 @ =ov13_0222F48C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F480: .4byte ov13_0222F764
_0222F484: .4byte 0x0224F52C
_0222F488: .4byte ov13_0222F48C
	arm_func_end ov13_0222F444

	arm_func_start ov13_0222F48C
ov13_0222F48C: @ 0x0222F48C
	push {r3, lr}
	bl ov13_0222F560
	bl ov13_0222F598
	bl ov13_0222F59C
	bl ov13_0222B3B4
	cmp r0, #0
	popeq {r3, pc}
	cmp r0, #1
	beq _0222F4BC
	cmp r0, #2
	beq _0222F4F0
	pop {r3, pc}
_0222F4BC:
	ldr r2, _0222F554 @ =0x0224F52C
	ldr r1, [r2, #4]
	cmp r1, #0
	popeq {r3, pc}
	mov r0, #1
	strb r0, [r2]
	bl ov13_022425F0
	ldr r1, _0222F554 @ =0x0224F52C
	mov r2, #0
	ldr r0, _0222F558 @ =ov13_0222F7CC
	str r2, [r1, #4]
	bl ov13_0222B8E8
	pop {r3, pc}
_0222F4F0:
	ldr r0, _0222F554 @ =0x0224F52C
	ldr r0, [r0, #4]
	cmp r0, #0
	popeq {r3, pc}
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
	ldr r1, _0222F554 @ =0x0224F52C
	mov r0, #1
	ldr r1, [r1, #4]
	bl ov13_022425F0
	ldr r1, _0222F554 @ =0x0224F52C
	mov r2, #0
	ldr r0, _0222F55C @ =ov13_0222F780
	str r2, [r1, #4]
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F554: .4byte 0x0224F52C
_0222F558: .4byte ov13_0222F7CC
_0222F55C: .4byte ov13_0222F780
	arm_func_end ov13_0222F48C

	arm_func_start ov13_0222F560
ov13_0222F560: @ 0x0222F560
	push {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _0222F580
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
_0222F580:
	bl ov13_0222F28C
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_0222F560

	arm_func_start ov13_0222F598
ov13_0222F598: @ 0x0222F598
	bx lr
	arm_func_end ov13_0222F598

	arm_func_start ov13_0222F59C
ov13_0222F59C: @ 0x0222F59C
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222F5E0 @ =0x0224F52C
	ldr r1, [r0, #4]
	cmp r1, #0
	popeq {r3, pc}
	mov r0, #1
	bl ov13_022425D0
	ldr r0, _0222F5E0 @ =0x0224F52C
	mov r1, #0
	str r1, [r0, #4]
	bl ov13_022272E4
	ldr r0, _0222F5E4 @ =ov13_0222F818
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F5E0: .4byte 0x0224F52C
_0222F5E4: .4byte ov13_0222F818
	arm_func_end ov13_0222F59C

	arm_func_start ov13_0222F5E8
ov13_0222F5E8: @ 0x0222F5E8
	push {r3, lr}
	bl ov13_022272E4
	ldr r0, _0222F61C @ =0x0224F52C
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0222F608
	mov r0, #1
	bl ov13_022425F0
_0222F608:
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0222F620 @ =ov13_0222F624
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F61C: .4byte 0x0224F52C
_0222F620: .4byte ov13_0222F624
	arm_func_end ov13_0222F5E8

	arm_func_start ov13_0222F624
ov13_0222F624: @ 0x0222F624
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02227228
	ldr r0, _0222F680 @ =0x0224F52C
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
	ldr r0, _0222F684 @ =ov13_0222F688
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F680: .4byte 0x0224F52C
_0222F684: .4byte ov13_0222F688
	arm_func_end ov13_0222F624

	arm_func_start ov13_0222F688
ov13_0222F688: @ 0x0222F688
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222F758 @ =0x0224F52C
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F6BC
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
_0222F6BC:
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	ldr r0, _0222F758 @ =0x0224F52C
	ldrb r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bl ov13_0222B364
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0222F758 @ =0x0224F52C
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
	ldr r0, _0222F758 @ =0x0224F52C
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222F740
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0222F75C @ =ov13_02237618
	bl ov13_0222B8E8
	pop {r3, pc}
_0222F740:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _0222F760 @ =ov13_0222F848
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F758: .4byte 0x0224F52C
_0222F75C: .4byte ov13_02237618
_0222F760: .4byte ov13_0222F848
	arm_func_end ov13_0222F688

	arm_func_start ov13_0222F764
ov13_0222F764: @ 0x0222F764
	push {r3, lr}
	bl ov13_022413E4
	mov r0, #0
	bl ov13_02242478
	bl ov13_0222F560
	bl ov13_0222F59C
	pop {r3, pc}
	arm_func_end ov13_0222F764

	arm_func_start ov13_0222F780
ov13_0222F780: @ 0x0222F780
	push {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _0222F7A8 @ =ov13_0222F7AC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F7A8: .4byte ov13_0222F7AC
	arm_func_end ov13_0222F780

	arm_func_start ov13_0222F7AC
ov13_0222F7AC: @ 0x0222F7AC
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222F7C8 @ =ov13_0222F5E8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F7C8: .4byte ov13_0222F5E8
	arm_func_end ov13_0222F7AC

	arm_func_start ov13_0222F7CC
ov13_0222F7CC: @ 0x0222F7CC
	push {r3, lr}
	bl ov13_0222F560
	bl ov13_0222F598
	bl ov13_0222F59C
	ldr r1, _0222F80C @ =0x0224F52C
	ldr r0, _0222F810 @ =0x00000438
	ldrh r2, [r1, #2]
	add r2, r2, #1
	strh r2, [r1, #2]
	ldrh r1, [r1, #2]
	cmp r1, r0
	poplo {r3, pc}
	bl ov13_0223AC20
	ldr r0, _0222F814 @ =ov13_0222F5E8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F80C: .4byte 0x0224F52C
_0222F810: .4byte 0x00000438
_0222F814: .4byte ov13_0222F5E8
	arm_func_end ov13_0222F7CC

	arm_func_start ov13_0222F818
ov13_0222F818: @ 0x0222F818
	push {r3, lr}
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r1, _0222F840 @ =0x0224F52C
	mov r2, #0
	ldr r0, _0222F844 @ =ov13_0222F5E8
	strb r2, [r1]
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F840: .4byte 0x0224F52C
_0222F844: .4byte ov13_0222F5E8
	arm_func_end ov13_0222F818

	arm_func_start ov13_0222F848
ov13_0222F848: @ 0x0222F848
	push {r3, lr}
	ldr r0, _0222F87C @ =0x0224F534
	mov r1, #0
	strb r1, [r0]
	bl ov13_0222F884
	bl ov13_02227E40
	mov r0, #0x23
	bl ov13_022279EC
	mov r0, #0x10
	bl ov13_0223ABB8
	ldr r0, _0222F880 @ =ov13_0222F8F0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F87C: .4byte 0x0224F534
_0222F880: .4byte ov13_0222F8F0
	arm_func_end ov13_0222F848

	arm_func_start ov13_0222F884
ov13_0222F884: @ 0x0222F884
	push {r3, lr}
	ldr r0, _0222F8E0 @ =0x02246344
	ldr r1, _0222F8E4 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r2, _0222F8E8 @ =0x04001008
	ldr r1, _0222F8EC @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222F8E0: .4byte 0x02246344
_0222F8E4: .4byte FUN_020D00A4
_0222F8E8: .4byte 0x04001008
_0222F8EC: .4byte 0x0400000A
	arm_func_end ov13_0222F884

	arm_func_start ov13_0222F8F0
ov13_0222F8F0: @ 0x0222F8F0
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _0222F920 @ =ov13_0222F924
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F920: .4byte ov13_0222F924
	arm_func_end ov13_0222F8F0

	arm_func_start ov13_0222F924
ov13_0222F924: @ 0x0222F924
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0222F944 @ =ov13_0222F948
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F944: .4byte ov13_0222F948
	arm_func_end ov13_0222F924

	arm_func_start ov13_0222F948
ov13_0222F948: @ 0x0222F948
	push {r3, lr}
	bl ov13_0222FA08
	bl ov13_0222F958
	pop {r3, pc}
	arm_func_end ov13_0222F948

	arm_func_start ov13_0222F958
ov13_0222F958: @ 0x0222F958
	bx lr
	arm_func_end ov13_0222F958

	arm_func_start ov13_0222F95C
ov13_0222F95C: @ 0x0222F95C
	push {r3, lr}
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
	ldr r0, _0222F994 @ =ov13_0222F998
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222F994: .4byte ov13_0222F998
	arm_func_end ov13_0222F95C

	arm_func_start ov13_0222F998
ov13_0222F998: @ 0x0222F998
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _0222FA04 @ =ov13_02238440
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222FA04: .4byte ov13_02238440
	arm_func_end ov13_0222F998

	arm_func_start ov13_0222FA08
ov13_0222FA08: @ 0x0222FA08
	push {r3, lr}
	ldr r0, _0222FA34 @ =0x0224F534
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0x78
	poplo {r3, pc}
	ldr r0, _0222FA38 @ =ov13_0222F95C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222FA34: .4byte 0x0224F534
_0222FA38: .4byte ov13_0222F95C
	arm_func_end ov13_0222FA08

	arm_func_start ov13_0222FA3C
ov13_0222FA3C: @ 0x0222FA3C
	push {r3, lr}
	mov r0, #0x5c
	mov r1, #4
	bl ov13_0224128C
	ldr r2, _0222FB08 @ =0x0224F538
	mov r1, #0
	str r0, [r2, #4]
	add r0, sp, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #0
	bne _0222FA7C
	ldr r0, _0222FB08 @ =0x0224F538
	mov r1, #0
	strb r1, [r0]
	strh r1, [r0, #2]
_0222FA7C:
	ldr r0, _0222FB08 @ =0x0224F538
	ldr r0, [r0, #4]
	bl ov13_02239D04
	ldr r1, _0222FB08 @ =0x0224F538
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
	ldr r2, _0222FB08 @ =0x0224F538
	ldr r1, _0222FB0C @ =ov13_02230C68
	ldr r3, [r2, #4]
	mov r2, #0
	str r0, [r3, #0xc]
	mov r0, #1
	mov r3, #0x6e
	bl ov13_02242528
	ldr r1, _0222FB08 @ =0x0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x3c]
	bl ov13_022307AC
	bl ov13_02230CC4
	ldr r0, _0222FB10 @ =ov13_0222FE84
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222FB08: .4byte 0x0224F538
_0222FB0C: .4byte ov13_02230C68
_0222FB10: .4byte ov13_0222FE84
	arm_func_end ov13_0222FA3C

	arm_func_start ov13_0222FB14
ov13_0222FB14: @ 0x0222FB14
	push {r3, lr}
	sub sp, sp, #0x30
	ldr r3, _0222FC4C @ =0x022453E3
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
	ldr ip, _0222FC50 @ =0x022453CD
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
	ldr r0, _0222FC54 @ =0x02246358
	ldr r1, _0222FC58 @ =0x020D0164
	bl ov13_02227924
	add r0, sp, #0x16
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _0222FC5C @ =0x0224F538
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
	ldr r1, _0222FC5C @ =0x0224F538
	ldr r3, _0222FC60 @ =0x04001008
	ldr r1, [r1, #4]
	sub r2, r3, #0x1000
	str r0, [r1, #8]
	ldrh r0, [r3]
	ldr r1, _0222FC64 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0222FC4C: .4byte 0x022453E3
_0222FC50: .4byte 0x022453CD
_0222FC54: .4byte 0x02246358
_0222FC58: .4byte 0x020D0164
_0222FC5C: .4byte 0x0224F538
_0222FC60: .4byte 0x04001008
_0222FC64: .4byte 0x0400000A
	arm_func_end ov13_0222FB14

	arm_func_start ov13_0222FC68
ov13_0222FC68: @ 0x0222FC68
	push {r3, r4, lr}
	sub sp, sp, #4
	ldr r2, _0222FD0C @ =0x0224F538
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
	strbls r0, [r2, #0x53]
	bls _0222FCC8
	cmp r1, #8
	movhi r1, #0x37
	strbhi r1, [r2, #0x53]
	movhi r4, #2
	bhi _0222FCC8
	mov r1, #0x1f
	strb r1, [r2, #0x53]
	mov r4, #1
_0222FCC8:
	cmp r4, #0
	beq _0222FCEC
	ldr r0, _0222FD0C @ =0x0224F538
	ldr r1, [r0, #4]
	ldrh r2, [r0, #2]
	ldrb r0, [r1, #0x53]
	ldrh r1, [r1, #0x40]
	mul r0, r2, r0
	bl FUN_020CCD00
_0222FCEC:
	str r0, [sp]
	mov r0, r4
	mov r1, #0x55
	mov r2, #0xec
	mov r3, #0x3f
	bl ov13_0223943C
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0222FD0C: .4byte 0x0224F538
	arm_func_end ov13_0222FC68

	arm_func_start ov13_0222FD10
ov13_0222FD10: @ 0x0222FD10
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0222FE74 @ =0x0224F538
	mov sb, #0
	ldr r0, [r0, #4]
	ldrb r8, [r0, #0x51]
	cmp r8, #5
	movgt r8, #5
	cmp r8, #0
	ble _0222FD84
	ldr sl, _0222FE74 @ =0x0224F538
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
	ldr r5, _0222FE78 @ =0x0224544C
	ldr sb, _0222FE74 @ =0x0224F538
	ldr r7, _0222FE7C @ =0x000003FF
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
	ldr r5, _0222FE80 @ =0x02245450
	ldr sb, _0222FE74 @ =0x0224F538
	ldr r7, _0222FE7C @ =0x000003FF
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
	pople {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, _0222FE74 @ =0x0224F538
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
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0222FE74: .4byte 0x0224F538
_0222FE78: .4byte 0x0224544C
_0222FE7C: .4byte 0x000003FF
_0222FE80: .4byte 0x02245450
	arm_func_end ov13_0222FD10

	arm_func_start ov13_0222FE84
ov13_0222FE84: @ 0x0222FE84
	push {r3, lr}
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
	ldr r0, _0222FED4 @ =ov13_0222FED8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222FED4: .4byte ov13_0222FED8
	arm_func_end ov13_0222FE84

	arm_func_start ov13_0222FED8
ov13_0222FED8: @ 0x0222FED8
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_022279B4
	ldr r0, _0222FF10 @ =ov13_0222FF14
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222FF10: .4byte ov13_0222FF14
	arm_func_end ov13_0222FED8

	arm_func_start ov13_0222FF14
ov13_0222FF14: @ 0x0222FF14
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _0222FF38 @ =ov13_0222FF3C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0222FF38: .4byte ov13_0222FF3C
	arm_func_end ov13_0222FF14

	arm_func_start ov13_0222FF3C
ov13_0222FF3C: @ 0x0222FF3C
	push {r3, lr}
	bl ov13_0222FF50
	bl ov13_022301A4
	bl ov13_02230414
	pop {r3, pc}
	arm_func_end ov13_0222FF3C

	arm_func_start ov13_0222FF50
ov13_0222FF50: @ 0x0222FF50
	push {r3, r4, r5, lr}
	ldr r0, _02230198 @ =0x0224F538
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	ldrbeq r0, [r1, #0x57]
	cmpeq r0, #0
	popne {r3, r4, r5, pc}
	ldr r0, _0223019C @ =0x02245958
	bl ov13_022417DC
	cmp r0, #0
	beq _0222FFE8
	ldr r0, _02230198 @ =0x0224F538
	mvn r1, #0
	ldr r0, [r0, #4]
	ldr r5, _022301A0 @ =0x022453FC
	strb r1, [r0, #0x50]
	mov r4, #0
_0222FF98:
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _0222FFD8
	cmp r4, #4
	bge _0222FFC0
	ldr r0, _02230198 @ =0x0224F538
	ldr r0, [r0, #4]
	strb r4, [r0, #0x50]
	b _0222FFE8
_0222FFC0:
	mov r0, #1
	bl ov13_0222726C
	ldr r0, _02230198 @ =0x0224F538
	strb r4, [r0]
	bl ov13_02230CC4
	pop {r3, r4, r5, pc}
_0222FFD8:
	add r4, r4, #1
	cmp r4, #5
	add r5, r5, #8
	blo _0222FF98
_0222FFE8:
	ldr r0, _0223019C @ =0x02245958
	bl ov13_022418EC
	cmp r0, #0
	beq _02230064
	ldr r4, _022301A0 @ =0x022453FC
	mov r5, #0
_02230000:
	mov r0, r4
	bl ov13_022418EC
	cmp r0, #0
	beq _02230054
	ldr r0, _02230198 @ =0x0224F538
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
	ldr r0, _02230198 @ =0x0224F538
	strb r5, [r0]
	bl ov13_02230CC4
	pop {r3, r4, r5, pc}
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
	pop {r3, r4, r5, pc}
_02230084:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _022300A0
	mov r0, #0
	bl ov13_0222726C
	pop {r3, r4, r5, pc}
_022300A0:
	mov r0, #0x200
	bl ov13_022416D4
	cmp r0, #0
	beq _022300B8
	bl ov13_02230ED0
	pop {r3, r4, r5, pc}
_022300B8:
	mov r0, #0x200
	bl ov13_02241714
	cmp r0, #0
	beq _022300DC
	ldr r0, _02230198 @ =0x0224F538
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r3, r4, r5, pc}
_022300DC:
	mov r0, #0x100
	bl ov13_022416D4
	cmp r0, #0
	beq _022300F4
	bl ov13_02230E5C
	pop {r3, r4, r5, pc}
_022300F4:
	mov r0, #0x100
	bl ov13_02241714
	cmp r0, #0
	beq _02230118
	ldr r0, _02230198 @ =0x0224F538
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r3, r4, r5, pc}
_02230118:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _02230134
	mov r0, #1
	bl ov13_02230D10
	pop {r3, r4, r5, pc}
_02230134:
	mov r0, #0x40
	bl ov13_02241714
	cmp r0, #0
	beq _02230158
	ldr r0, _02230198 @ =0x0224F538
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r3, r4, r5, pc}
_02230158:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	beq _02230174
	mov r0, #3
	bl ov13_02230D10
	pop {r3, r4, r5, pc}
_02230174:
	mov r0, #0x80
	bl ov13_02241714
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	ldr r0, _02230198 @ =0x0224F538
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02230198: .4byte 0x0224F538
_0223019C: .4byte 0x02245958
_022301A0: .4byte 0x022453FC
	arm_func_end ov13_0222FF50

	arm_func_start ov13_022301A4
ov13_022301A4: @ 0x022301A4
	push {r3, lr}
	ldr r0, _02230408 @ =0x0224F538
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	popne {r3, pc}
	ldrb r0, [r1, #0x55]
	cmp r0, #0
	subne r0, r0, #1
	strbne r0, [r1, #0x55]
	bl ov13_02239564
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_022301DC: @ jump table
	pop {r3, pc} @ case 0
	b _022301FC @ case 1
	b _02230214 @ case 2
	b _02230268 @ case 3
	b _02230314 @ case 4
	b _022303F4 @ case 5
	b _0223037C @ case 6
	b _022303F4 @ case 7
_022301FC:
	ldr r0, _02230408 @ =0x0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x57]
	bl ov13_022272E4
	pop {r3, pc}
_02230214:
	ldr r0, _02230408 @ =0x0224F538
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x55]
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02227D18
	bl ov13_02239550
	ldr r1, _02230408 @ =0x0224F538
	ldr r1, [r1, #4]
	ldrh r2, [r1, #0x40]
	ldrb r1, [r1, #0x53]
	mul r0, r2, r0
	bl FUN_020CCD00
	ldr r1, _02230408 @ =0x0224F538
	strh r0, [r1, #2]
	bl ov13_022307AC
	ldr r0, _02230408 @ =0x0224F538
	mov r1, #4
	ldr r0, [r0, #4]
	strb r1, [r0, #0x55]
	pop {r3, pc}
_02230268:
	ldr r0, _02230408 @ =0x0224F538
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x57]
	bl ov13_022272CC
	bl ov13_02239550
	ldr r1, _02230408 @ =0x0224F538
	ldr r1, [r1, #4]
	ldrh r2, [r1, #0x40]
	ldrb r1, [r1, #0x53]
	mul r0, r2, r0
	bl FUN_020CCD00
	ldr r1, _02230408 @ =0x0224F538
	strh r0, [r1, #2]
	mov r0, #0x13
	bl ov13_0223ABB8
	bl ov13_022307AC
	ldr r0, _02230408 @ =0x0224F538
	mov r1, #0x1c
	ldrh r0, [r0, #2]
	bl FUN_020CCD3C
	cmp r0, #0
	bne _022302CC
	bl ov13_02230CC4
	pop {r3, pc}
_022302CC:
	cmp r0, #0xe
	mov r0, #0
	mov r3, #0x78
	bge _022302F8
	ldr r1, _0223040C @ =ov13_02230B14
	mov r2, r0
	bl ov13_02242528
	ldr r1, _02230408 @ =0x0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r3, pc}
_022302F8:
	ldr r1, _02230410 @ =ov13_02230BD0
	mov r2, r0
	bl ov13_02242528
	ldr r1, _02230408 @ =0x0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r3, pc}
_02230314:
	ldr r0, _02230408 @ =0x0224F538
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _02230350
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x58]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02230408 @ =0x0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x58]
	pop {r3, pc}
_02230350:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _0223040C @ =ov13_02230B14
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02230408 @ =0x0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r3, pc}
_0223037C:
	ldr r0, _02230408 @ =0x0224F538
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
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02230408 @ =0x0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x58]
	pop {r3, pc}
_022303C8:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02230410 @ =ov13_02230BD0
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02230408 @ =0x0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r3, pc}
_022303F4:
	ldr r0, _02230408 @ =0x0224F538
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x58]
	pop {r3, pc}
	.align 2, 0
_02230408: .4byte 0x0224F538
_0223040C: .4byte ov13_02230B14
_02230410: .4byte ov13_02230BD0
	arm_func_end ov13_022301A4

	arm_func_start ov13_02230414
ov13_02230414: @ 0x02230414
	push {r3, lr}
	ldr r0, _02230514 @ =0x0224F538
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	ldrbeq r0, [r1, #0x57]
	cmpeq r0, #0
	popne {r3, pc}
	bl ov13_02227258
	cmp r0, #0
	beq _0223044C
	cmp r0, #1
	beq _02230458
	pop {r3, pc}
_0223044C:
	mov r0, #7
	bl ov13_0223ABB8
	b _02230508
_02230458:
	ldr r0, _02230514 @ =0x0224F538
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
	bl FUN_020CCD00
	ldr r2, _02230514 @ =0x0224F538
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
	ldr r0, _02230518 @ =ov13_02230F84
	bl ov13_0222B8E8
	pop {r3, pc}
_022304F0:
	mov r0, #1
	strb r0, [ip, #0x54]
	ldr r1, [r2, #4]
	mov r0, #6
	strb lr, [r1, #0x52]
	bl ov13_0223ABB8
_02230508:
	ldr r0, _0223051C @ =ov13_02230520
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02230514: .4byte 0x0224F538
_02230518: .4byte ov13_02230F84
_0223051C: .4byte ov13_02230520
	arm_func_end ov13_02230414

	arm_func_start ov13_02230520
ov13_02230520: @ 0x02230520
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0223053C @ =ov13_02230540
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0223053C: .4byte ov13_02230540
	arm_func_end ov13_02230520

	arm_func_start ov13_02230540
ov13_02230540: @ 0x02230540
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _022305A8 @ =0x0224F538
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
	ldr r0, _022305AC @ =ov13_022305B0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022305A8: .4byte 0x0224F538
_022305AC: .4byte ov13_022305B0
	arm_func_end ov13_02230540

	arm_func_start ov13_022305B0
ov13_022305B0: @ 0x022305B0
	push {r3, r4, r5, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, r4, r5, pc}
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	ldr r1, _02230790 @ =0x0224F538
	mov r0, #1
	ldr r1, [r1, #4]
	ldr r1, [r1, #0x3c]
	bl ov13_022425F0
	ldr r4, _02230790 @ =0x0224F538
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
	ldr r0, _02230790 @ =0x0224F538
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl ov13_02240AA0
	bl ov13_02239514
	bl ov13_02227D18
	bl ov13_0222788C
	bl ov13_02239288
	ldr r0, _02230790 @ =0x0224F538
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	bl ov13_0223FA50
	ldr r0, _02230790 @ =0x0224F538
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
	ldr r1, _02230794 @ =0x04000010
	ldr r0, _02230790 @ =0x0224F538
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
	ldr r0, _02230798 @ =ov13_02237618
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
	ldr r0, _0223079C @ =ov13_022363F4
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
	ldr r1, _02230790 @ =0x0224F538
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
	ldr r0, _022307A0 @ =ov13_02230FD8
	bl ov13_0222B8E8
	b _02230784
_0223076C:
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, #1
	bl ov13_0222B934
	ldr r0, _022307A4 @ =ov13_02238440
	bl ov13_0222B8E8
_02230784:
	ldr r0, _022307A8 @ =0x0224F53C
	bl ov13_022412B0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02230790: .4byte 0x0224F538
_02230794: .4byte 0x04000010
_02230798: .4byte ov13_02237618
_0223079C: .4byte ov13_022363F4
_022307A0: .4byte ov13_02230FD8
_022307A4: .4byte ov13_02238440
_022307A8: .4byte 0x0224F53C
	arm_func_end ov13_022305B0

	arm_func_start ov13_022307AC
ov13_022307AC: @ 0x022307AC
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02230850 @ =0x0224F538
	mov r1, #0x1c
	ldrh r0, [r0, #2]
	bl FUN_020CCD00
	ldr r1, _02230850 @ =0x0224F538
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
	ldr r0, _02230850 @ =0x0224F538
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl ov13_02240E2C
	bl ov13_02230A58
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02230850: .4byte 0x0224F538
	arm_func_end ov13_022307AC

	arm_func_start ov13_02230854
ov13_02230854: @ 0x02230854
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r7, r0
	mov r0, #0x2a
	ldr r2, _022309C8 @ =0x0224F538
	mul r6, r7, r0
	ldr r0, [r2, #4]
	mov r4, r1
	ldr r0, [r0]
	mov r1, #0x20
	add r0, r0, r6
	bl ov13_02242074
	ldr r2, _022309C8 @ =0x0224F538
	mov r1, #0x1c
	mul r5, r4, r1
	ldr r2, [r2, #4]
	mov r4, r0
	ldrb r1, [r2, #0x51]
	cmp r7, r1
	addge sp, sp, #0x30
	popge {r3, r4, r5, r6, r7, pc}
	add r0, sp, #0xc
	cmp r4, #0x10
	mov r1, #0
	mov r2, #0x22
	addle r5, r5, #6
	bl FUN_020D4994
	cmp r4, #0x10
	movle ip, r4
	movgt ip, #0x10
	cmp ip, #0
	mov r3, #0
	ble _02230904
	ldr r0, _022309C8 @ =0x0224F538
	ldr r7, [r0, #4]
	add r0, sp, #0xc
_022308E4:
	ldr r2, [r7]
	lsl r1, r3, #1
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
	ldr r0, _022309C8 @ =0x0224F538
	mov r2, r5
	ldr r0, [r0, #4]
	mov r3, #2
	ldr r0, [r0, #0xc]
	bl ov13_02240C14
	cmp r4, #0x10
	addle sp, sp, #0x30
	pople {r3, r4, r5, r6, r7, pc}
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x22
	bl FUN_020D4994
	sub r3, r4, #0x10
	cmp r3, #0
	mov r7, #0
	ble _02230990
	ldr r0, _022309C8 @ =0x0224F538
	ldr r4, [r0, #4]
	add r0, sp, #0xc
_0223096C:
	ldr r2, [r4]
	lsl r1, r7, #1
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
	ldr r0, _022309C8 @ =0x0224F538
	add r2, r5, #0xc
	ldr r0, [r0, #4]
	mov r3, #2
	ldr r0, [r0, #0xc]
	bl ov13_02240C14
	add sp, sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022309C8: .4byte 0x0224F538
	arm_func_end ov13_02230854

	arm_func_start ov13_022309CC
ov13_022309CC: @ 0x022309CC
	push {r4, lr}
	ldr r3, _02230A54 @ =0x0224F538
	ldr lr, [r3, #4]
	ldrb r2, [lr, #0x51]
	cmp r0, r2
	popge {r4, pc}
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
	pop {r4, pc}
	.align 2, 0
_02230A54: .4byte 0x0224F538
	arm_func_end ov13_022309CC

	arm_func_start ov13_02230A58
ov13_02230A58: @ 0x02230A58
	push {r4, r5, r6, lr}
	ldr r0, _02230B0C @ =0x0224F538
	mov r1, #0x1c
	ldrh r0, [r0, #2]
	bl FUN_020CCD3C
	ldr r1, _02230B0C @ =0x0224F538
	rsb r0, r0, #0x36
	ldr r1, [r1, #4]
	mov r2, #0
	ldrb r1, [r1, #0x51]
	cmp r1, #5
	movgt r1, #5
	cmp r1, #0
	ble _02230AF8
	ldr ip, _02230B0C @ =0x0224F538
	ldr r3, _02230B10 @ =0xFE00FF00
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
	ldr r0, _02230B0C @ =0x0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x56]
	pop {r4, r5, r6, pc}
	.align 2, 0
_02230B0C: .4byte 0x0224F538
_02230B10: .4byte 0xFE00FF00
	arm_func_end ov13_02230A58

	arm_func_start ov13_02230B14
ov13_02230B14: @ 0x02230B14
	push {r3, r4, r5, lr}
	mov r4, r0
	bl ov13_0223959C
	bl ov13_02227D18
	ldr r0, _02230BCC @ =0x0224F538
	ldrh r1, [r0, #2]
	cmp r1, #4
	subhi r1, r1, #4
	movls r1, #0
	strh r1, [r0, #2]
	ldr r0, _02230BCC @ =0x0224F538
	mov r1, #0x1c
	ldrh r0, [r0, #2]
	bl FUN_020CCD3C
	mov r5, r0
	cmp r5, #0x18
	bne _02230B60
	bl ov13_022307AC
	pop {r3, r4, r5, pc}
_02230B60:
	ble _02230B7C
	ldr r0, _02230BCC @ =0x0224F538
	rsb r1, r5, #0x1c
	ldrh r2, [r0, #2]
	mov r5, #0
	add r1, r2, r1
	strh r1, [r0, #2]
_02230B7C:
	bl ov13_02230A58
	cmp r5, #0
	popne {r3, r4, r5, pc}
	ldr r0, _02230BCC @ =0x0224F538
	ldr r1, [r0, #4]
	ldrh r2, [r0, #2]
	ldrb r0, [r1, #0x53]
	ldrh r1, [r1, #0x40]
	mul r0, r2, r0
	bl FUN_020CCD00
	bl ov13_02239578
	bl ov13_02239584
	bl ov13_02230CC4
	ldr r0, _02230BCC @ =0x0224F538
	mov r1, r4
	ldr r2, [r0, #4]
	mov r0, #0
	str r0, [r2, #0x38]
	bl ov13_022425D0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02230BCC: .4byte 0x0224F538
	arm_func_end ov13_02230B14

	arm_func_start ov13_02230BD0
ov13_02230BD0: @ 0x02230BD0
	push {r4, lr}
	mov r4, r0
	bl ov13_0223959C
	bl ov13_02227D18
	ldr r0, _02230C64 @ =0x0224F538
	mov r1, #0x1c
	ldrh r2, [r0, #2]
	add r2, r2, #4
	strh r2, [r0, #2]
	ldrh r0, [r0, #2]
	bl FUN_020CCD3C
	cmp r0, #4
	blt _02230C0C
	bl ov13_02230A58
	pop {r4, pc}
_02230C0C:
	ldr r1, _02230C64 @ =0x0224F538
	ldrh r2, [r1, #2]
	sub r0, r2, r0
	strh r0, [r1, #2]
	bl ov13_022307AC
	ldr r0, _02230C64 @ =0x0224F538
	ldr r1, [r0, #4]
	ldrh r2, [r0, #2]
	ldrb r0, [r1, #0x53]
	ldrh r1, [r1, #0x40]
	mul r0, r2, r0
	bl FUN_020CCD00
	bl ov13_02239578
	bl ov13_02239584
	bl ov13_02230CC4
	ldr r0, _02230C64 @ =0x0224F538
	mov r1, r4
	ldr r2, [r0, #4]
	mov r0, #0
	str r0, [r2, #0x38]
	bl ov13_022425D0
	pop {r4, pc}
	.align 2, 0
_02230C64: .4byte 0x0224F538
	arm_func_end ov13_02230BD0

	arm_func_start ov13_02230C68
ov13_02230C68: @ 0x02230C68
	push {r3, lr}
	ldr r0, _02230CB8 @ =0x0224F538
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x56]
	cmp r1, #0
	popeq {r3, pc}
	ldrh r0, [r0, #2]
	mov r1, #0x1c
	bl FUN_020CCD3C
	ldr r1, _02230CBC @ =0x01FF0000
	sub r0, r0, #0x32
	ldr r2, _02230CC0 @ =0x04000010
	and r1, r1, r0, lsl #16
	str r1, [r2]
	ldr r0, _02230CB8 @ =0x0224F538
	str r1, [r2, #8]
	ldr r0, [r0, #4]
	mov r1, #0
	strb r1, [r0, #0x56]
	pop {r3, pc}
	.align 2, 0
_02230CB8: .4byte 0x0224F538
_02230CBC: .4byte 0x01FF0000
_02230CC0: .4byte 0x04000010
	arm_func_end ov13_02230C68

	arm_func_start ov13_02230CC4
ov13_02230CC4: @ 0x02230CC4
	push {r3, lr}
	ldr r0, _02230D00 @ =0x0224F538
	ldr r1, _02230D04 @ =0x02245424
	ldrb r2, [r0]
	ldr r3, _02230D08 @ =0x02245426
	lsl ip, r2, #3
	cmp r2, #4
	ldr r2, _02230D0C @ =0x02245428
	movlo r0, #2
	ldrh r1, [r1, ip]
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	movhs r0, #3
	bl ov13_02227B6C
	pop {r3, pc}
	.align 2, 0
_02230D00: .4byte 0x0224F538
_02230D04: .4byte 0x02245424
_02230D08: .4byte 0x02245426
_02230D0C: .4byte 0x02245428
	arm_func_end ov13_02230CC4

	arm_func_start ov13_02230D10
ov13_02230D10: @ 0x02230D10
	push {r4, lr}
	ldr r1, _02230E54 @ =0x0224F538
	mov r4, #1
	ldrb r3, [r1]
	cmp r3, #4
	addls pc, pc, r3, lsl #2
	b _02230E0C
_02230D2C: @ jump table
	b _02230D40 @ case 0
	b _02230DA4 @ case 1
	b _02230DA4 @ case 2
	b _02230DD0 @ case 3
	b _02230DE8 @ case 4
_02230D40:
	cmp r0, #1
	bne _02230D88
	ldrh r0, [r1, #2]
	cmp r0, #0
	moveq r0, #4
	strbeq r0, [r1]
	beq _02230E0C
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02230E58 @ =ov13_02230B14
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02230E54 @ =0x0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r4, pc}
_02230D88:
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x51]
	cmp r0, #1
	addhi r0, r3, #1
	strbhi r0, [r1]
	movls r4, #0
	b _02230E0C
_02230DA4:
	cmp r0, #1
	subeq r0, r3, #1
	strbeq r0, [r1]
	beq _02230E0C
	ldr r2, [r1, #4]
	add r0, r3, #1
	ldrb r2, [r2, #0x51]
	cmp r2, r0
	strbgt r0, [r1]
	movle r4, #0
	b _02230E0C
_02230DD0:
	cmp r0, #1
	subeq r0, r3, #1
	strbeq r0, [r1]
	beq _02230E0C
	bl ov13_02230ED0
	pop {r4, pc}
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
	ldr r0, _02230E54 @ =0x0224F538
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x59]
	cmp r0, #0
	popne {r4, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02230E54 @ =0x0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r4, pc}
_02230E44:
	mov r0, #8
	bl ov13_0223ABB8
	bl ov13_02230CC4
	pop {r4, pc}
	.align 2, 0
_02230E54: .4byte 0x0224F538
_02230E58: .4byte ov13_02230B14
	arm_func_end ov13_02230D10

	arm_func_start ov13_02230E5C
ov13_02230E5C: @ 0x02230E5C
	push {r3, lr}
	ldr r0, _02230EC8 @ =0x0224F538
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _02230E9C
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x59]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02230EC8 @ =0x0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r3, pc}
_02230E9C:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02230ECC @ =ov13_02230B14
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02230EC8 @ =0x0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r3, pc}
	.align 2, 0
_02230EC8: .4byte 0x0224F538
_02230ECC: .4byte ov13_02230B14
	arm_func_end ov13_02230E5C

	arm_func_start ov13_02230ED0
ov13_02230ED0: @ 0x02230ED0
	push {r3, lr}
	ldr r0, _02230F4C @ =0x0224F538
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
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02230F4C @ =0x0224F538
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r3, pc}
_02230F20:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02230F50 @ =ov13_02230BD0
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02230F4C @ =0x0224F538
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r3, pc}
	.align 2, 0
_02230F4C: .4byte 0x0224F538
_02230F50: .4byte ov13_02230BD0
	arm_func_end ov13_02230ED0

	arm_func_start ov13_02230F54
ov13_02230F54: @ 0x02230F54
	push {r3, lr}
	ldr r1, _02230F7C @ =0x022453CC
	ldr r0, _02230F80 @ =0x0224F538
	ldrb r1, [r1]
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	mov r2, r1
	strb r1, [sp]
	bl ov13_02239378
	pop {r3, pc}
	.align 2, 0
_02230F7C: .4byte 0x022453CC
_02230F80: .4byte 0x0224F538
	arm_func_end ov13_02230F54

	arm_func_start ov13_02230F84
ov13_02230F84: @ 0x02230F84
	push {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _02230FAC @ =ov13_02230FB0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02230FAC: .4byte ov13_02230FB0
	arm_func_end ov13_02230F84

	arm_func_start ov13_02230FB0
ov13_02230FB0: @ 0x02230FB0
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	bl ov13_022272CC
	bl ov13_02239584
	ldr r0, _02230FD4 @ =ov13_0222FF3C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02230FD4: .4byte ov13_0222FF3C
	arm_func_end ov13_02230FB0

	arm_func_start ov13_02230FD8
ov13_02230FD8: @ 0x02230FD8
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r1, _02231100 @ =0x02245454
	mov r0, #0x2c
	ldrb r3, [r1]
	ldrb r2, [r1, #1]
	mov r1, #4
	strb r3, [sp]
	strb r2, [sp, #1]
	bl ov13_0224128C
	ldr r2, _02231104 @ =0x0224F540
	add r1, sp, #4
	str r0, [r2]
	add r0, sp, #8
	bl ov13_0222B948
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02231050
	ldr r0, _02231104 @ =0x0224F540
	ldr r0, [r0]
	add r0, r0, #8
	bl ov13_0223A28C
	ldr r0, _02231104 @ =0x0224F540
	mov r1, #0x20
	ldr r0, [r0]
	add r0, r0, #8
	bl ov13_02242074
	ldr r1, _02231104 @ =0x0224F540
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
	ldr r2, _02231104 @ =0x0224F540
	mov r1, #0x3e
	ldr r2, [r2]
	str r0, [r2]
	mov r0, #0
	bl ov13_02240184
	ldr r1, _02231104 @ =0x0224F540
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
	ldr r0, _02231108 @ =ov13_022311C8
	bl ov13_0222B8E8
	add sp, sp, #0xc
	ldm sp!, {pc}
	.align 2, 0
_02231100: .4byte 0x02245454
_02231104: .4byte 0x0224F540
_02231108: .4byte ov13_022311C8
	arm_func_end ov13_02230FD8

	arm_func_start ov13_0223110C
ov13_0223110C: @ 0x0223110C
	push {r3, lr}
	ldr r0, _022311A0 @ =0x02246370
	ldr r1, _022311A4 @ =0x020CFD18
	bl ov13_02227924
	ldr r0, _022311A8 @ =0x02246384
	ldr r1, _022311AC @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _022311B0 @ =0x0224639C
	ldr r1, _022311B4 @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _022311B8 @ =0x022463B4
	ldr r1, _022311BC @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _022311C0 @ =0x04001008
	ldr r1, _022311C4 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_022311A0: .4byte 0x02246370
_022311A4: .4byte 0x020CFD18
_022311A8: .4byte 0x02246384
_022311AC: .4byte 0x020D03A4
_022311B0: .4byte 0x0224639C
_022311B4: .4byte FUN_020CFC6C
_022311B8: .4byte 0x022463B4
_022311BC: .4byte FUN_020D00A4
_022311C0: .4byte 0x04001008
_022311C4: .4byte 0x0400000A
	arm_func_end ov13_0223110C

	arm_func_start ov13_022311C8
ov13_022311C8: @ 0x022311C8
	push {r3, lr}
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
	ldr r0, _02231218 @ =ov13_0223121C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02231218: .4byte ov13_0223121C
	arm_func_end ov13_022311C8

	arm_func_start ov13_0223121C
ov13_0223121C: @ 0x0223121C
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02228054
	mov r0, #0x14
	bl ov13_0223ABB8
	ldr r0, _02231290 @ =0x0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0
	bne _02231268
	mov r0, #0
	bl ov13_02228400
_02231268:
	ldr r0, _02231290 @ =0x0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0x20
	bne _02231284
	mov r0, #0
	bl ov13_02228414
_02231284:
	ldr r0, _02231294 @ =ov13_02231298
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02231290: .4byte 0x0224F540
_02231294: .4byte ov13_02231298
	arm_func_end ov13_0223121C

	arm_func_start ov13_02231298
ov13_02231298: @ 0x02231298
	push {r3, lr}
	bl ov13_022283EC
	cmp r0, #0xff
	popeq {r3, pc}
	ldr r0, _022312B4 @ =ov13_022312B8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022312B4: .4byte ov13_022312B8
	arm_func_end ov13_02231298

	arm_func_start ov13_022312B8
ov13_022312B8: @ 0x022312B8
	push {r3, lr}
	bl ov13_022312C8
	bl ov13_02231488
	pop {r3, pc}
	arm_func_end ov13_022312B8

	arm_func_start ov13_022312C8
ov13_022312C8: @ 0x022312C8
	push {r4, lr}
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
	ldr r0, _02231478 @ =0x0000E01D
	cmp r4, r0
	b _02231408
_02231314:
	ldr r0, _0223147C @ =0x0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0
	beq _0223146C
	mov r0, #3
	bl ov13_0223ABB8
	ldr r1, _0223147C @ =0x0224F540
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
	ldr r1, _0223147C @ =0x0224F540
	ldr r0, _02231480 @ =ov13_0223148C
	ldr r1, [r1]
	mov r2, #0
	strb r2, [r1, #0x2a]
	bl ov13_0222B8E8
	pop {r4, pc}
_0223139C:
	bl ov13_0223191C
	cmp r0, #0
	beq _022313C4
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _0223147C @ =0x0224F540
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x2a]
	b _022313DC
_022313C4:
	ldr r0, _0223147C @ =0x0224F540
	mov r2, #2
	ldr r1, [r0]
	mov r0, #9
	strb r2, [r1, #0x2a]
	bl ov13_0223ABB8
_022313DC:
	ldr r0, _0223147C @ =0x0224F540
	ldr r1, _02231484 @ =0xC1FFFCFF
	ldr r2, [r0]
	ldr r0, _02231480 @ =ov13_0223148C
	ldr r3, [r2, #4]
	ldr r2, [r3]
	and r1, r2, r1
	orr r1, r1, #0x200
	str r1, [r3]
	bl ov13_0222B8E8
	pop {r4, pc}
_02231408:
	ldr r0, _0223147C @ =0x0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0x20
	beq _0223146C
	mov r0, #1
	bl ov13_0223ABB8
	ldr r1, _0223147C @ =0x0224F540
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
	ldr r0, _0223147C @ =0x0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0x20
	bne _0223146C
	mov r0, #0
	bl ov13_02228414
_0223146C:
	bl ov13_022316B4
	bl ov13_022317A8
	pop {r4, pc}
	.align 2, 0
_02231478: .4byte 0x0000E01D
_0223147C: .4byte 0x0224F540
_02231480: .4byte ov13_0223148C
_02231484: .4byte 0xC1FFFCFF
	arm_func_end ov13_022312C8

	arm_func_start ov13_02231488
ov13_02231488: @ 0x02231488
	bx lr
	arm_func_end ov13_02231488

	arm_func_start ov13_0223148C
ov13_0223148C: @ 0x0223148C
	push {r3, lr}
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _022314A4 @ =ov13_022314A8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022314A4: .4byte ov13_022314A8
	arm_func_end ov13_0223148C

	arm_func_start ov13_022314A8
ov13_022314A8: @ 0x022314A8
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_022283B8
	mov r0, #0x15
	bl ov13_0223ABB8
	ldr r0, _022314D4 @ =ov13_022314D8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022314D4: .4byte ov13_022314D8
	arm_func_end ov13_022314A8

	arm_func_start ov13_022314D8
ov13_022314D8: @ 0x022314D8
	push {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _0223159C @ =0x02245454
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	bl ov13_02228428
	cmp r0, #0
	addne sp, sp, #0x10
	popne {r3, pc}
	ldr r0, _022315A0 @ =0x0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #0x2a]
	cmp r0, #0
	bne _02231528
	ldr r0, _022315A4 @ =ov13_022315B0
	bl ov13_0222B8E8
	add sp, sp, #0x10
	pop {r3, pc}
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
	ldr r0, _022315A8 @ =ov13_02231AA8
	bl ov13_0222B8E8
	add sp, sp, #0x10
	pop {r3, pc}
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
	ldr r0, _022315AC @ =ov13_02231810
	bl ov13_0222B8E8
	add sp, sp, #0x10
	pop {r3, pc}
	.align 2, 0
_0223159C: .4byte 0x02245454
_022315A0: .4byte 0x0224F540
_022315A4: .4byte ov13_022315B0
_022315A8: .4byte ov13_02231AA8
_022315AC: .4byte ov13_02231810
	arm_func_end ov13_022314D8

	arm_func_start ov13_022315B0
ov13_022315B0: @ 0x022315B0
	push {r3, lr}
	sub sp, sp, #8
	bl ov13_0222788C
	ldr r0, _02231698 @ =0x0224F540
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov13_02241D98
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0223169C @ =0x022463C8
	ldr r1, _022316A0 @ =0x020CFD18
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
	ldr r0, _022316A4 @ =ov13_02232E04
	bl ov13_0222B8E8
	b _02231688
_02231634:
	ldr r0, _02231698 @ =0x0224F540
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
	ldr r0, _022316A8 @ =ov13_0222FA3C
	bl ov13_0222B8E8
	b _02231688
_0223166C:
	mov r1, r0
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, #1
	bl ov13_0222B934
	ldr r0, _022316AC @ =ov13_02238440
	bl ov13_0222B8E8
_02231688:
	ldr r0, _022316B0 @ =0x0224F540
	bl ov13_022412B0
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_02231698: .4byte 0x0224F540
_0223169C: .4byte 0x022463C8
_022316A0: .4byte 0x020CFD18
_022316A4: .4byte ov13_02232E04
_022316A8: .4byte ov13_0222FA3C
_022316AC: .4byte ov13_02238440
_022316B0: .4byte 0x0224F540
	arm_func_end ov13_022315B0

	arm_func_start ov13_022316B4
ov13_022316B4: @ 0x022316B4
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldr r0, _0223179C @ =0x0224F540
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
	ldr r7, _022317A0 @ =0x0000E01D
	ldr r6, _022317A4 @ =0x02245470
	mov sb, sl
	strh sl, [sp, #0x12]
	mov r8, #0x31
	mov r5, #2
	mov r4, #0x480
	add fp, sp, #0x10
_02231720:
	ldr r0, _0223179C @ =0x0224F540
	cmp sl, #0x10
	ldr r0, [r0]
	moveq sb, #0
	strheq r8, [sp, #0x16]
	add r1, r0, sl
	ldrb r1, [r1, #8]
	ldrb r2, [r6, sb]
	cmp r1, #0x20
	strheq r7, [sp, #0x10]
	strhne r1, [sp, #0x10]
	ldrh r1, [sp, #0x1a]
	strh r2, [sp, #0x14]
	stm sp, {r1, r5}
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
	ldr r0, _0223179C @ =0x0224F540
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov13_02240E2C
	add sp, sp, #0x1c
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0223179C: .4byte 0x0224F540
_022317A0: .4byte 0x0000E01D
_022317A4: .4byte 0x02245470
	arm_func_end ov13_022316B4

	arm_func_start ov13_022317A8
ov13_022317A8: @ 0x022317A8
	push {r3, lr}
	ldr r0, _02231800 @ =0x0224F540
	ldr r1, [r0]
	ldrb r0, [r1, #0x29]
	ldr ip, [r1, #4]
	ldr r1, _02231804 @ =0x0224546C
	cmp r0, #0x20
	and r2, r0, #0xf
	asr lr, r0, #4
	movhs lr, #1
	ldr r0, _02231808 @ =0x02245470
	movhs r2, #0xf
	ldrb r3, [r0, r2]
	ldr r2, [ip]
	ldr r0, _0223180C @ =0xFE00FF00
	ldrb r1, [r1, lr]
	and r0, r2, r0
	lsl r2, r3, #0x17
	orr r0, r0, r1
	orr r0, r0, r2, lsr #7
	str r0, [ip]
	pop {r3, pc}
	.align 2, 0
_02231800: .4byte 0x0224F540
_02231804: .4byte 0x0224546C
_02231808: .4byte 0x02245470
_0223180C: .4byte 0xFE00FF00
	arm_func_end ov13_022317A8

	arm_func_start ov13_02231810
ov13_02231810: @ 0x02231810
	push {r3, lr}
	bl ov13_0223C1DC
	ldr r1, _02231864 @ =0x0224F540
	ldr r2, [r1]
	strb r0, [r2, #0x2a]
	ldr r0, [r1]
	ldrb r0, [r0, #0x2a]
	cmp r0, #0
	beq _02231840
	cmp r0, #1
	beq _0223184C
	pop {r3, pc}
_02231840:
	mov r0, #7
	bl ov13_0223ABB8
	b _02231854
_0223184C:
	mov r0, #0xe
	bl ov13_0223ABB8
_02231854:
	bl ov13_0223C198
	ldr r0, _02231868 @ =ov13_0223186C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02231864: .4byte 0x0224F540
_02231868: .4byte ov13_0223186C
	arm_func_end ov13_02231810

	arm_func_start ov13_0223186C
ov13_0223186C: @ 0x0223186C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r0, _02231908 @ =0x02245454
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0x14]
	str r1, [sp, #4]
	str r0, [sp, #8]
	bl ov13_0223C1F0
	cmp r0, #0
	addne sp, sp, #0xc
	ldmne sp!, {pc}
	ldr r0, _0223190C @ =0x0224F540
	ldr r1, [r0]
	ldrb r0, [r1, #0x2a]
	cmp r0, #0
	bne _022318D0
	ldr r3, [r1, #4]
	ldr r1, _02231910 @ =0xC1FFFCFF
	ldr r2, [r3]
	ldr r0, _02231914 @ =ov13_0223121C
	and r1, r2, r1
	str r1, [r3]
	bl ov13_0222B8E8
	add sp, sp, #0xc
	ldm sp!, {pc}
_022318D0:
	add r0, sp, #0
	mov r1, #0
	bl ov13_0222B948
	ldr r0, _0223190C @ =0x0224F540
	ldr r2, [sp]
	add r1, sp, #4
	ldr r0, [r0]
	ldr r1, [r1, r2, lsl #2]
	add r0, r0, #8
	blx r1
	ldr r0, _02231918 @ =ov13_022315B0
	bl ov13_0222B8E8
	add sp, sp, #0xc
	ldm sp!, {pc}
	.align 2, 0
_02231908: .4byte 0x02245454
_0223190C: .4byte 0x0224F540
_02231910: .4byte 0xC1FFFCFF
_02231914: .4byte ov13_0223121C
_02231918: .4byte ov13_022315B0
	arm_func_end ov13_0223186C

	arm_func_start ov13_0223191C
ov13_0223191C: @ 0x0223191C
	push {r3, lr}
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
	ldr r0, _02231AA4 @ =0x0224F540
	add sp, sp, #8
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	pop {r3, pc}
_02231984:
	ldr r0, [sp]
	cmp r0, #1
	bne _022319AC
	ldr r0, _02231AA4 @ =0x0224F540
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	popeq {r3, pc}
_022319AC:
	ldr r0, _02231AA4 @ =0x0224F540
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
	pop {r3, pc}
_02231A28:
	cmp r0, #0
	mov r2, #0
	ble _02231A8C
	ldr r1, _02231AA4 @ =0x0224F540
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
	pop {r3, pc}
_02231A7C:
	add r2, r2, #1
	cmp r2, r0
	add r3, r3, #1
	blt _02231A3C
_02231A8C:
	add sp, sp, #8
	mov r0, #1
	pop {r3, pc}
_02231A98:
	mov r0, #0
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_02231AA4: .4byte 0x0224F540
	arm_func_end ov13_0223191C

	arm_func_start ov13_02231AA8
ov13_02231AA8: @ 0x02231AA8
	push {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _02231AD0 @ =ov13_02231AD4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02231AD0: .4byte ov13_02231AD4
	arm_func_end ov13_02231AA8

	arm_func_start ov13_02231AD4
ov13_02231AD4: @ 0x02231AD4
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02231B0C @ =0x0224F540
	ldr r1, _02231B10 @ =0xC1FFFCFF
	ldr r2, [r0]
	ldr r0, _02231B14 @ =ov13_0223121C
	ldr r3, [r2, #4]
	ldr r2, [r3]
	and r1, r2, r1
	str r1, [r3]
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02231B0C: .4byte 0x0224F540
_02231B10: .4byte 0xC1FFFCFF
_02231B14: .4byte ov13_0223121C
	arm_func_end ov13_02231AD4

	arm_func_start ov13_02231B18
ov13_02231B18: @ 0x02231B18
	push {r3, r4, r5, lr}
	sub sp, sp, #0x20
	ldr r4, _02231C78 @ =0x02245498
	ldr ip, _02231C7C @ =0x02245480
	ldm r4!, {r0, r1, r2, r3}
	add r5, sp, #0xc
	stm r5!, {r0, r1, r2, r3}
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
	ldr r2, _02231C80 @ =0x0224F544
	mov r1, #0
	str r0, [r2]
	add r0, sp, #0
	bl ov13_0222B948
	ldr r0, _02231C80 @ =0x0224F544
	ldr r2, [sp]
	add r1, sp, #0xc
	ldr r0, [r0]
	ldr r1, [r1, r2, lsl #2]
	add r0, r0, #8
	blx r1
	ldr r0, _02231C80 @ =0x0224F544
	ldr r1, _02231C84 @ =0x022463E0
	ldr r4, [r0]
	mov r2, #3
	add r0, r4, #8
	bl FUN_020E5BB0
	cmp r0, #0
	movne r0, #3
	strbne r0, [r4, #0x14]
	bne _02231BE8
	add r0, r4, #8
	mov r1, #0
	mov r2, #0xc
	bl FUN_020D4994
	ldr r0, _02231C80 @ =0x0224F544
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
	ldr r2, _02231C80 @ =0x0224F544
	mov r1, #0x3f
	ldr r2, [r2]
	str r0, [r2]
	mov r0, #0
	bl ov13_02240184
	ldr r1, _02231C80 @ =0x0224F544
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
	ldr r0, _02231C88 @ =ov13_02231D48
	bl ov13_0222B8E8
	add sp, sp, #0x20
	pop {r3, r4, r5, pc}
	.align 2, 0
_02231C78: .4byte 0x02245498
_02231C7C: .4byte 0x02245480
_02231C80: .4byte 0x0224F544
_02231C84: .4byte 0x022463E0
_02231C88: .4byte ov13_02231D48
	arm_func_end ov13_02231B18

	arm_func_start ov13_02231C8C
ov13_02231C8C: @ 0x02231C8C
	push {r3, lr}
	ldr r0, _02231D20 @ =0x022463E4
	ldr r1, _02231D24 @ =0x020CFD18
	bl ov13_02227924
	ldr r0, _02231D28 @ =0x022463F8
	ldr r1, _02231D2C @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _02231D30 @ =0x02246410
	ldr r1, _02231D34 @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _02231D38 @ =0x02246428
	ldr r1, _02231D3C @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _02231D40 @ =0x04001008
	ldr r1, _02231D44 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_02231D20: .4byte 0x022463E4
_02231D24: .4byte 0x020CFD18
_02231D28: .4byte 0x022463F8
_02231D2C: .4byte 0x020D03A4
_02231D30: .4byte 0x02246410
_02231D34: .4byte FUN_020CFC6C
_02231D38: .4byte 0x02246428
_02231D3C: .4byte FUN_020D00A4
_02231D40: .4byte 0x04001008
_02231D44: .4byte 0x0400000A
	arm_func_end ov13_02231C8C

	arm_func_start ov13_02231D48
ov13_02231D48: @ 0x02231D48
	push {r3, lr}
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
	ldr r0, _02231D98 @ =ov13_02231D9C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02231D98: .4byte ov13_02231D9C
	arm_func_end ov13_02231D48

	arm_func_start ov13_02231D9C
ov13_02231D9C: @ 0x02231D9C
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02229D00
	mov r0, #0x14
	bl ov13_0223ABB8
	ldr r0, _02231E20 @ =0x0224F544
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
	ldr r0, _02231E24 @ =ov13_02231E28
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02231E20: .4byte 0x0224F544
_02231E24: .4byte ov13_02231E28
	arm_func_end ov13_02231D9C

	arm_func_start ov13_02231E28
ov13_02231E28: @ 0x02231E28
	push {r3, lr}
	bl ov13_0222A070
	cmp r0, #0x1f
	popeq {r3, pc}
	ldr r0, _02231E44 @ =ov13_02231E48
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02231E44: .4byte ov13_02231E48
	arm_func_end ov13_02231E28

	arm_func_start ov13_02231E48
ov13_02231E48: @ 0x02231E48
	push {r3, lr}
	bl ov13_02231E58
	bl ov13_022321FC
	pop {r3, pc}
	arm_func_end ov13_02231E48

	arm_func_start ov13_02231E58
ov13_02231E58: @ 0x02231E58
	push {r3, r4, r5, lr}
	bl ov13_0222A070
	mov r4, r0
	cmp r4, #0
	bgt _02231E74
	popeq {r3, r4, r5, pc}
	b _02232038
_02231E74:
	sub r0, r4, #0x10
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02232038
_02231E84: @ jump table
	b _02231E98 @ case 0
	b _02231F40 @ case 1
	b _02231F94 @ case 2
	b _02231FB8 @ case 3
	pop {r3, r4, r5, pc} @ case 4
_02231E98:
	ldr r0, _0223215C @ =0x0224F544
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	ldrbeq r0, [r1, #0xa]
	cmpeq r0, #0
	beq _02232150
	mov r0, #3
	bl ov13_0223ABB8
	ldr r0, _0223215C @ =0x0224F544
	ldr r2, [r0]
	ldrb r1, [r2, #0x14]
	add r0, r1, r1, lsl #1
	add r0, r0, #2
	add r0, r2, r0
	ldrb r0, [r0, #8]
	cmp r0, #0
	subeq r0, r1, #1
	strbeq r0, [r2, #0x14]
	ldr r0, _0223215C @ =0x0224F544
	mov r1, #0
	ldr r3, [r0]
	mov r2, #3
	ldrb r0, [r3, #0x14]
	add r3, r3, #8
	add r0, r0, r0, lsl #1
	add r0, r3, r0
	bl FUN_020D4994
	ldr r0, _0223215C @ =0x0224F544
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	ldrbeq r0, [r1, #0xa]
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
	ldr r0, _0223215C @ =0x0224F544
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
	ldr r1, _0223215C @ =0x0224F544
	mov r0, #0
	ldr r2, [r1]
	ldrb r1, [r2, #0x14]
	add r1, r1, #1
	strb r1, [r2, #0x14]
	bl ov13_0222A0AC
	b _02232150
_02231F94:
	ldr r0, _0223215C @ =0x0224F544
	mov r2, #0
	ldr r1, [r0]
	mov r0, #7
	strb r2, [r1, #0x15]
	bl ov13_0223ABB8
	ldr r0, _02232160 @ =ov13_02232200
	bl ov13_0222B8E8
	pop {r3, r4, r5, pc}
_02231FB8:
	bl ov13_0223261C
	cmp r0, #0
	beq _02231FE0
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _0223215C @ =0x0224F544
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x15]
	b _02231FF8
_02231FE0:
	ldr r0, _0223215C @ =0x0224F544
	mov r2, #2
	ldr r1, [r0]
	mov r0, #9
	strb r2, [r1, #0x15]
	bl ov13_0223ABB8
_02231FF8:
	ldr r1, _0223215C @ =0x0224F544
	mov r3, #3
	ldr r2, [r1]
	ldr r0, _02232164 @ =0xC1FFFCFF
	strb r3, [r2, #0x14]
	ldr r1, [r1]
	ldr r2, [r1, #4]
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x200
	str r0, [r2]
	bl ov13_02232440
	bl ov13_022325A4
	ldr r0, _02232160 @ =ov13_02232200
	bl ov13_0222B8E8
	pop {r3, r4, r5, pc}
_02232038:
	ldr r0, _0223215C @ =0x0224F544
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
	ldr r0, _0223215C @ =0x0224F544
	ldr r2, [r0]
	ldrb r1, [r2, #0x14]
	add r5, r2, #8
	add lr, r1, r1, lsl #1
	add ip, lr, #2
	ldrb r3, [r5, ip]
	cmp r3, #0
	strbeq r4, [r5, ip]
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
	ldr r0, _0223215C @ =0x0224F544
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #3
	addlo r0, r0, #1
	strblo r0, [r1, #0x14]
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
	strblo r0, [r1, #0x14]
_022320F4:
	mov r0, #1
	bl ov13_0222A084
	ldr r0, _0223215C @ =0x0224F544
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
	ldr r0, _0223215C @ =0x0224F544
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
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223215C: .4byte 0x0224F544
_02232160: .4byte ov13_02232200
_02232164: .4byte 0xC1FFFCFF
	arm_func_end ov13_02231E58

	arm_func_start ov13_02232168
ov13_02232168: @ 0x02232168
	push {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _022321F8 @ =0x0224F544
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
	popne {r3, r4, pc}
	add r0, r3, r2
	add r1, sp, #0
	mov r2, #3
	bl FUN_020D4A50
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
	bl FUN_020EB82C
	cmp r0, r4
	movge r0, #1
	movlt r0, #0
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_022321F8: .4byte 0x0224F544
	arm_func_end ov13_02232168

	arm_func_start ov13_022321FC
ov13_022321FC: @ 0x022321FC
	bx lr
	arm_func_end ov13_022321FC

	arm_func_start ov13_02232200
ov13_02232200: @ 0x02232200
	push {r3, lr}
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02232218 @ =ov13_0223221C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02232218: .4byte ov13_0223221C
	arm_func_end ov13_02232200

	arm_func_start ov13_0223221C
ov13_0223221C: @ 0x0223221C
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0222A03C
	mov r0, #0x15
	bl ov13_0223ABB8
	ldr r0, _02232248 @ =ov13_0223224C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02232248: .4byte ov13_0223224C
	arm_func_end ov13_0223221C

	arm_func_start ov13_0223224C
ov13_0223224C: @ 0x0223224C
	push {r3, lr}
	bl ov13_0222A0C0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _022322C8 @ =0x0224F544
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	bne _0223227C
	ldr r0, _022322CC @ =ov13_022322D8
	bl ov13_0222B8E8
	pop {r3, pc}
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
	ldr r0, _022322D0 @ =ov13_02232770
	bl ov13_0222B8E8
	pop {r3, pc}
_022322AC:
	mov r0, #0x47
	mov r1, #2
	str ip, [sp]
	bl ov13_0223BE6C
	ldr r0, _022322D4 @ =ov13_02232494
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022322C8: .4byte 0x0224F544
_022322CC: .4byte ov13_022322D8
_022322D0: .4byte ov13_02232770
_022322D4: .4byte ov13_02232494
	arm_func_end ov13_0223224C

	arm_func_start ov13_022322D8
ov13_022322D8: @ 0x022322D8
	push {r3, lr}
	bl ov13_0222788C
	ldr r0, _02232368 @ =0x0224F544
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov13_02241D98
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0223236C @ =0x02246440
	ldr r1, _02232370 @ =0x020CFD18
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
	ldr r0, _02232374 @ =ov13_02232E04
	bl ov13_0222B8E8
	ldr r0, _02232378 @ =0x0224F544
	bl ov13_022412B0
	pop {r3, pc}
	.align 2, 0
_02232368: .4byte 0x0224F544
_0223236C: .4byte 0x02246440
_02232370: .4byte 0x020CFD18
_02232374: .4byte ov13_02232E04
_02232378: .4byte 0x0224F544
	arm_func_end ov13_022322D8

	arm_func_start ov13_0223237C
ov13_0223237C: @ 0x0223237C
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x1c
	ldr r0, _02232434 @ =0x0224F544
	ldr r1, _02232438 @ =0x02245480
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
	ldr r5, _0223243C @ =0x022454C0
	ldr r6, _02232434 @ =0x0224F544
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
	stm sp, {r0, sb}
	str r8, [sp, #8]
	str r7, [sp, #0xc]
	ldrh r3, [sp, #0x18]
	ldr r0, [ip]
	strh r1, [sp, #0x14]
	bl ov13_02240CC0
	add r4, r4, #1
	cmp r4, #0xc
	blt _022323D8
	ldr r0, _02232434 @ =0x0224F544
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov13_02240E2C
	add sp, sp, #0x1c
	pop {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02232434: .4byte 0x0224F544
_02232438: .4byte 0x02245480
_0223243C: .4byte 0x022454C0
	arm_func_end ov13_0223237C

	arm_func_start ov13_02232440
ov13_02232440: @ 0x02232440
	ldr r0, _02232488 @ =0x0224F544
	ldr r2, [r0]
	ldrb r0, [r2, #0x14]
	ldr r3, [r2, #4]
	cmp r0, #3
	movgt r0, #3
	add r1, r0, r0, lsl #1
	ldr r0, _0223248C @ =0x022454C0
	add r1, r1, #2
	ldrb r2, [r0, r1]
	ldr r1, [r3]
	ldr r0, _02232490 @ =0xFE00FF00
	lsl r2, r2, #0x17
	and r0, r1, r0
	orr r0, r0, #0x28
	orr r0, r0, r2, lsr #7
	str r0, [r3]
	bx lr
	.align 2, 0
_02232488: .4byte 0x0224F544
_0223248C: .4byte 0x022454C0
_02232490: .4byte 0xFE00FF00
	arm_func_end ov13_02232440

	arm_func_start ov13_02232494
ov13_02232494: @ 0x02232494
	push {r3, lr}
	bl ov13_0223C1DC
	ldr r1, _022324E8 @ =0x0224F544
	ldr r2, [r1]
	strb r0, [r2, #0x15]
	ldr r0, [r1]
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _022324C4
	cmp r0, #1
	beq _022324D0
	pop {r3, pc}
_022324C4:
	mov r0, #7
	bl ov13_0223ABB8
	b _022324D8
_022324D0:
	mov r0, #0xe
	bl ov13_0223ABB8
_022324D8:
	bl ov13_0223C198
	ldr r0, _022324EC @ =ov13_022324F0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022324E8: .4byte 0x0224F544
_022324EC: .4byte ov13_022324F0
	arm_func_end ov13_02232494

	arm_func_start ov13_022324F0
ov13_022324F0: @ 0x022324F0
	push {r3, lr}
	sub sp, sp, #0x18
	ldr lr, _02232590 @ =0x022454AC
	add ip, sp, #4
	ldm lr!, {r0, r1, r2, r3}
	stm ip!, {r0, r1, r2, r3}
	ldr r0, [lr]
	str r0, [ip]
	bl ov13_0223C1F0
	cmp r0, #0
	addne sp, sp, #0x18
	popne {r3, pc}
	ldr r0, _02232594 @ =0x0224F544
	ldr r1, [r0]
	ldrb r0, [r1, #0x15]
	cmp r0, #0
	bne _02232558
	ldr r3, [r1, #4]
	ldr r1, _02232598 @ =0xC1FFFCFF
	ldr r2, [r3]
	ldr r0, _0223259C @ =ov13_02231D9C
	and r1, r2, r1
	str r1, [r3]
	bl ov13_0222B8E8
	add sp, sp, #0x18
	pop {r3, pc}
_02232558:
	add r0, sp, #0
	mov r1, #0
	bl ov13_0222B948
	ldr r0, _02232594 @ =0x0224F544
	ldr r2, [sp]
	add r1, sp, #4
	ldr r0, [r0]
	ldr r1, [r1, r2, lsl #2]
	add r0, r0, #8
	blx r1
	ldr r0, _022325A0 @ =ov13_022322D8
	bl ov13_0222B8E8
	add sp, sp, #0x18
	pop {r3, pc}
	.align 2, 0
_02232590: .4byte 0x022454AC
_02232594: .4byte 0x0224F544
_02232598: .4byte 0xC1FFFCFF
_0223259C: .4byte ov13_02231D9C
_022325A0: .4byte ov13_022322D8
	arm_func_end ov13_022324F0

	arm_func_start ov13_022325A4
ov13_022325A4: @ 0x022325A4
	push {r4, r5, r6, lr}
	mov r4, #0
	ldr r0, _02232618 @ =0x0224F544
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
	pop {r4, r5, r6, pc}
	.align 2, 0
_02232618: .4byte 0x0224F544
	arm_func_end ov13_022325A4

	arm_func_start ov13_0223261C
ov13_0223261C: @ 0x0223261C
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	ldr r2, _02232768 @ =0x02245480
	mov r0, #0
	ldrb ip, [r2]
	ldrb r3, [r2, #1]
	ldr r1, _0223276C @ =0x0224F544
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
	pophi {r3, r4, r5, r6, r7, r8, pc}
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
	pop {r3, r4, r5, r6, r7, r8, pc}
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
	pop {r3, r4, r5, r6, r7, r8, pc}
_0223274C:
	add r0, sp, #0
	bl FUN_0209E8A0
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	add sp, sp, #0xc
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02232768: .4byte 0x02245480
_0223276C: .4byte 0x0224F544
	arm_func_end ov13_0223261C

	arm_func_start ov13_02232770
ov13_02232770: @ 0x02232770
	push {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _02232798 @ =ov13_0223279C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02232798: .4byte ov13_0223279C
	arm_func_end ov13_02232770

	arm_func_start ov13_0223279C
ov13_0223279C: @ 0x0223279C
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _022327D4 @ =0x0224F544
	ldr r1, _022327D8 @ =0xC1FFFCFF
	ldr r2, [r0]
	ldr r0, _022327DC @ =ov13_02231D9C
	ldr r3, [r2, #4]
	ldr r2, [r3]
	and r1, r2, r1
	str r1, [r3]
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022327D4: .4byte 0x0224F544
_022327D8: .4byte 0xC1FFFCFF
_022327DC: .4byte ov13_02231D9C
	arm_func_end ov13_0223279C

	arm_func_start ov13_022327E0
ov13_022327E0: @ 0x022327E0
	push {r3, lr}
	bl ov13_022327FC
	bl ov13_0223287C
	ldr r0, _022327F8 @ =ov13_02232BD8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022327F8: .4byte ov13_02232BD8
	arm_func_end ov13_022327E0

	arm_func_start ov13_022327FC
ov13_022327FC: @ 0x022327FC
	push {r3, lr}
	ldr r0, _0223286C @ =0x02246458
	ldr r1, _02232870 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _02232874 @ =0x04001008
	ldr r1, _02232878 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_0223286C: .4byte 0x02246458
_02232870: .4byte FUN_020D00A4
_02232874: .4byte 0x04001008
_02232878: .4byte 0x0400000A
	arm_func_end ov13_022327FC

	arm_func_start ov13_0223287C
ov13_0223287C: @ 0x0223287C
	push {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	add r1, sp, #0x10
	mov r0, #0
	bl ov13_0222B948
	ldr r0, _02232BAC @ =0x0224F548
	ldr r2, _02232BB0 @ =0xFFFFB17D
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
	ldr r0, _02232BB4 @ =0xFFFFA629
	cmp r1, r0
	movge r4, #0
	bge _02232AD8
	sub r0, r0, #0x3e8
	cmp r1, r0
	movge r4, #0x13
	bge _02232AD8
	ldr r0, _02232BB8 @ =0xFFFF3CB1
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
	ldr r3, _02232BBC @ =0xFFFF3866
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
	ldr r2, _02232BC0 @ =0xFFFF34DD
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
	ldr r1, _02232BC4 @ =0x022454CC
	mov r0, #0
	ldrb r1, [r1, r2]
	bl ov13_022408A0
	ldr r1, _02232BC8 @ =0x0224F4F8
	mov r5, r0
	ldr r0, [r1]
	mov r1, r4
	bl ov13_0222BADC
	ldr r1, _02232BAC @ =0x0224F548
	mov r4, r0
	ldr r1, [r1]
	ldr r2, _02232BCC @ =0x0224646C
	rsb r3, r1, #0
	add r0, sp, #0x14
	mov r1, #8
	bl FUN_020ED7EC
	bl ov13_0222B970
	lsl r1, r0, #2
	ldr r0, _02232BD0 @ =0x022454DE
	ldrh r6, [r0, r1]
	bl ov13_0222B970
	lsl r3, r0, #2
	ldr r1, _02232BD4 @ =0x022454DC
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
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02232BAC: .4byte 0x0224F548
_02232BB0: .4byte 0xFFFFB17D
_02232BB4: .4byte 0xFFFFA629
_02232BB8: .4byte 0xFFFF3CB1
_02232BBC: .4byte 0xFFFF3866
_02232BC0: .4byte 0xFFFF34DD
_02232BC4: .4byte 0x022454CC
_02232BC8: .4byte 0x0224F4F8
_02232BCC: .4byte 0x0224646C
_02232BD0: .4byte 0x022454DE
_02232BD4: .4byte 0x022454DC
	arm_func_end ov13_0223287C

	arm_func_start ov13_02232BD8
ov13_02232BD8: @ 0x02232BD8
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02232C08 @ =ov13_02232C0C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02232C08: .4byte ov13_02232C0C
	arm_func_end ov13_02232BD8

	arm_func_start ov13_02232C0C
ov13_02232C0C: @ 0x02232C0C
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #4
	bl ov13_022279B4
	ldr r0, _02232C44 @ =ov13_02232C48
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02232C44: .4byte ov13_02232C48
	arm_func_end ov13_02232C0C

	arm_func_start ov13_02232C48
ov13_02232C48: @ 0x02232C48
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _02232C6C @ =ov13_02232C70
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02232C6C: .4byte ov13_02232C70
	arm_func_end ov13_02232C48

	arm_func_start ov13_02232C70
ov13_02232C70: @ 0x02232C70
	push {r3, lr}
	bl ov13_02232C84
	bl ov13_02232CA4
	bl ov13_02232CA8
	pop {r3, pc}
	arm_func_end ov13_02232C70

	arm_func_start ov13_02232C84
ov13_02232C84: @ 0x02232C84
	push {r3, lr}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_02232C84

	arm_func_start ov13_02232CA4
ov13_02232CA4: @ 0x02232CA4
	bx lr
	arm_func_end ov13_02232CA4

	arm_func_start ov13_02232CA8
ov13_02232CA8: @ 0x02232CA8
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _02232CCC @ =ov13_02232CD0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02232CCC: .4byte ov13_02232CD0
	arm_func_end ov13_02232CA8

	arm_func_start ov13_02232CD0
ov13_02232CD0: @ 0x02232CD0
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02232CEC @ =ov13_02232CF0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02232CEC: .4byte ov13_02232CF0
	arm_func_end ov13_02232CD0

	arm_func_start ov13_02232CF0
ov13_02232CF0: @ 0x02232CF0
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _02232D3C @ =ov13_02232D40
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02232D3C: .4byte ov13_02232D40
	arm_func_end ov13_02232CF0

	arm_func_start ov13_02232D40
ov13_02232D40: @ 0x02232D40
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
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
	ldr r0, _02232DEC @ =ov13_022368D8
	bl ov13_0222B8E8
	pop {r3, pc}
_02232DC4:
	mov r1, #0
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, r0
	bl ov13_0222B934
	mov r0, #0
	bl ov13_022352C0
	ldr r0, _02232DF0 @ =ov13_02232E04
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02232DEC: .4byte ov13_022368D8
_02232DF0: .4byte ov13_02232E04
	arm_func_end ov13_02232D40

	arm_func_start ov13_02232DF4
ov13_02232DF4: @ 0x02232DF4
	ldr r1, _02232E00 @ =0x0224F548
	str r0, [r1]
	bx lr
	.align 2, 0
_02232E00: .4byte 0x0224F548
	arm_func_end ov13_02232DF4

	arm_func_start ov13_02232E04
ov13_02232E04: @ 0x02232E04
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	bl ov13_02239FF0
	mov r4, r0
	mov r0, #0x48
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _02232FE8 @ =0x0224F54C
	mov r2, #0xc
	str r0, [r1, #8]
	ldrb r3, [r4, #0xf6]
	strb r3, [r0, #0x43]
	ldr r0, [r1, #8]
	strb r2, [r0, #0x42]
	bl ov13_02233214
	bl ov13_02233000
	ldr r0, _02232FE8 @ =0x0224F54C
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _02232E74
	bl ov13_0222B970
	ldr r1, _02232FEC @ =0x022455D4
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
	ldr r0, _02232FE8 @ =0x0224F54C
	mov r1, #0x37
	ldrh r3, [r0, #4]
	ldr r2, _02232FF0 @ =0xE1FC780F
	mov r0, #2
	mul r5, r3, r1
	smull r1, r3, r2, r5
	add r3, r5, r3
	lsr r1, r5, #0x1f
	add r3, r1, r3, asr #7
	str r3, [sp]
	mov r1, #0x55
	mov r2, #0xf1
	mov r3, #0x41
	bl ov13_0223943C
	mov r0, #0
	mov r1, #1
	bl ov13_022408A0
	ldr r6, _02232FE8 @ =0x0224F54C
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
	ldr r1, _02232FE8 @ =0x0224F54C
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
	ldr r1, _02232FE8 @ =0x0224F54C
	ldr r2, [r1, #8]
	str r0, [r2, #0x34]
	ldr r0, [r1, #8]
	ldr r1, [r0, #0x34]
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
_02232F90:
	ldr r1, _02232FF4 @ =ov13_02234B48
	mov r0, #1
	mov r2, #0
	mov r3, #0x6e
	bl ov13_02242528
	ldr r2, _02232FE8 @ =0x0224F54C
	ldr r1, _02232FF8 @ =ov13_022350A8
	ldr r2, [r2, #8]
	mov r3, #0x78
	str r0, [r2, #0x3c]
	mov r0, #0
	mov r2, r0
	bl ov13_02242528
	ldr r1, _02232FE8 @ =0x0224F54C
	ldr r1, [r1, #8]
	str r0, [r1]
	bl ov13_02233DCC
	bl ov13_02234BCC
	ldr r0, _02232FFC @ =ov13_02233250
	bl ov13_0222B8E8
	add sp, sp, #4
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02232FE8: .4byte 0x0224F54C
_02232FEC: .4byte 0x022455D4
_02232FF0: .4byte 0xE1FC780F
_02232FF4: .4byte ov13_02234B48
_02232FF8: .4byte ov13_022350A8
_02232FFC: .4byte ov13_02233250
	arm_func_end ov13_02232E04

	arm_func_start ov13_02233000
ov13_02233000: @ 0x02233000
	stmdb sp!, {lr}
	sub sp, sp, #0x44
	ldr r3, _022331D4 @ =0x02245573
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
	ldr r3, _022331D8 @ =0x02245548
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
	ldr ip, _022331DC @ =0x0224555D
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
	ldr r3, _022331E0 @ =0x0400000C
	ldr r0, _022331E4 @ =0x02246474
	ldrh r2, [r3]
	ldr r1, _022331E8 @ =0x020CFD18
	and r2, r2, #0x43
	orr r2, r2, #0x218
	orr r2, r2, #0xc00
	strh r2, [r3]
	bl ov13_02227924
	ldr r0, _022331EC @ =0x02246488
	ldr r1, _022331F0 @ =0x020D0464
	bl ov13_02227924
	ldr r0, _022331F4 @ =0x022464A0
	ldr r1, _022331F8 @ =0x020D03A4
	bl ov13_02227924
	ldr r1, _022331FC @ =FUN_020CFC6C
	add r0, sp, #0x16
	bl ov13_02227924
	ldr r0, _02233200 @ =0x022464B8
	ldr r1, _02233204 @ =0x020D0164
	bl ov13_02227924
	add r0, sp, #0x2b
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _02233208 @ =0x0224F54C
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
	ldr r1, _02233208 @ =0x0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0xc]
	add r0, sp, #0
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _02233208 @ =0x0224F54C
	ldr r2, _0223320C @ =0x04001008
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
	ldr r1, _02233210 @ =0x0400000A
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
	ldm sp!, {pc}
	.align 2, 0
_022331D4: .4byte 0x02245573
_022331D8: .4byte 0x02245548
_022331DC: .4byte 0x0224555D
_022331E0: .4byte 0x0400000C
_022331E4: .4byte 0x02246474
_022331E8: .4byte 0x020CFD18
_022331EC: .4byte 0x02246488
_022331F0: .4byte 0x020D0464
_022331F4: .4byte 0x022464A0
_022331F8: .4byte 0x020D03A4
_022331FC: .4byte FUN_020CFC6C
_02233200: .4byte 0x022464B8
_02233204: .4byte 0x020D0164
_02233208: .4byte 0x0224F54C
_0223320C: .4byte 0x04001008
_02233210: .4byte 0x0400000A
	arm_func_end ov13_02233000

	arm_func_start ov13_02233214
ov13_02233214: @ 0x02233214
	push {r3, lr}
	bl ov13_02239FF0
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0223324C @ =0x0224F54C
	mov r1, #0
	strh r1, [r0, #4]
	strb r1, [r0]
	strb r1, [r0, #2]
	pop {r3, pc}
	.align 2, 0
_0223324C: .4byte 0x0224F54C
	arm_func_end ov13_02233214

	arm_func_start ov13_02233250
ov13_02233250: @ 0x02233250
	push {r3, lr}
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
	ldr r0, _022332A0 @ =ov13_022332A4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022332A0: .4byte ov13_022332A4
	arm_func_end ov13_02233250

	arm_func_start ov13_022332A4
ov13_022332A4: @ 0x022332A4
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _022332D4 @ =ov13_022332D8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022332D4: .4byte ov13_022332D8
	arm_func_end ov13_022332A4

	arm_func_start ov13_022332D8
ov13_022332D8: @ 0x022332D8
	push {r3, lr}
	bl ov13_022332E8
	bl ov13_02233810
	pop {r3, pc}
	arm_func_end ov13_022332D8

	arm_func_start ov13_022332E8
ov13_022332E8: @ 0x022332E8
	push {r3, lr}
	ldr r0, _02233558 @ =0x0224F54C
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	ldrbeq r0, [r1, #0x45]
	cmpeq r0, #0
	popne {r3, pc}
	bl ov13_02233568
	cmp r0, #0
	popne {r3, pc}
	mov r0, #1
	bl ov13_02241694
	cmp r0, #0
	beq _02233334
	ldr r0, _02233558 @ =0x0224F54C
	ldrb r0, [r0]
	bl ov13_022335EC
	pop {r3, pc}
_02233334:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _02233368
	mov r0, #7
	bl ov13_0223ABB8
	ldr r1, _02233558 @ =0x0224F54C
	ldr r0, _0223355C @ =ov13_02233A6C
	ldr r1, [r1, #8]
	mov r2, #0xd
	strb r2, [r1, #0x40]
	bl ov13_0222B8E8
	pop {r3, pc}
_02233368:
	mov r0, #0x200
	bl ov13_022416D4
	cmp r0, #0
	beq _022333E0
	ldr r0, _02233558 @ =0x0224F54C
	ldrh r1, [r0, #4]
	cmp r1, #0x91
	bne _022333B4
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x47]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02233558 @ =0x0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, pc}
_022333B4:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02233560 @ =ov13_02234AA4
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02233558 @ =0x0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, pc}
_022333E0:
	mov r0, #0x200
	bl ov13_02241714
	cmp r0, #0
	beq _02233404
	ldr r0, _02233558 @ =0x0224F54C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, pc}
_02233404:
	mov r0, #0x100
	bl ov13_022416D4
	cmp r0, #0
	beq _0223347C
	ldr r0, _02233558 @ =0x0224F54C
	ldrh r1, [r0, #4]
	cmp r1, #0
	bne _02233450
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x47]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02233558 @ =0x0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, pc}
_02233450:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02233564 @ =ov13_022349DC
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02233558 @ =0x0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, pc}
_0223347C:
	mov r0, #0x100
	bl ov13_02241714
	cmp r0, #0
	beq _022334A0
	ldr r0, _02233558 @ =0x0224F54C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, pc}
_022334A0:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _022334BC
	mov r0, #1
	bl ov13_02234D84
	pop {r3, pc}
_022334BC:
	mov r0, #0x40
	bl ov13_02241714
	cmp r0, #0
	beq _022334E0
	ldr r0, _02233558 @ =0x0224F54C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, pc}
_022334E0:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	beq _022334FC
	mov r0, #3
	bl ov13_02234D84
	pop {r3, pc}
_022334FC:
	mov r0, #0x80
	bl ov13_02241714
	cmp r0, #0
	beq _02233520
	ldr r0, _02233558 @ =0x0224F54C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, pc}
_02233520:
	mov r0, #0x20
	bl ov13_022416D4
	cmp r0, #0
	beq _0223353C
	mov r0, #0
	bl ov13_02234D84
	pop {r3, pc}
_0223353C:
	mov r0, #0x10
	bl ov13_022416D4
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #2
	bl ov13_02234D84
	pop {r3, pc}
	.align 2, 0
_02233558: .4byte 0x0224F54C
_0223355C: .4byte ov13_02233A6C
_02233560: .4byte ov13_02234AA4
_02233564: .4byte ov13_022349DC
	arm_func_end ov13_022332E8

	arm_func_start ov13_02233568
ov13_02233568: @ 0x02233568
	push {r4, lr}
	bl ov13_02239FF0
	bl ov13_02234700
	mov r4, r0
	cmp r4, #0xe
	moveq r0, #0
	popeq {r4, pc}
	bl ov13_0223417C
	cmp r0, #0
	bne _022335A0
	mov r0, #9
	bl ov13_0223ABB8
	mov r0, #1
	pop {r4, pc}
_022335A0:
	mov r0, r4
	bl ov13_02234D54
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _022335DC
_022335B4: @ jump table
	b _022335DC @ case 0
	b _022335DC @ case 1
	b _022335D8 @ case 2
	b _022335D8 @ case 3
	b _022335DC @ case 4
	b _022335DC @ case 5
	b _022335DC @ case 6
	b _022335D8 @ case 7
	b _022335D8 @ case 8
_022335D8:
	bl ov13_022350FC
_022335DC:
	mov r0, r4
	bl ov13_022335EC
	mov r0, #1
	pop {r4, pc}
	arm_func_end ov13_02233568

	arm_func_start ov13_022335EC
ov13_022335EC: @ 0x022335EC
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	bl ov13_0223417C
	cmp r0, #0
	bne _02233614
	mov r0, #9
	bl ov13_0223ABB8
	add sp, sp, #4
	pop {r3, r4, pc}
_02233614:
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _0223368C
_02233620: @ jump table
	b _0223368C @ case 0
	b _0223368C @ case 1
	b _02233644 @ case 2
	b _02233644 @ case 3
	b _0223368C @ case 4
	b _0223368C @ case 5
	b _0223368C @ case 6
	b _02233668 @ case 7
	b _02233668 @ case 8
_02233644:
	mov r0, #6
	bl ov13_0223ABB8
	sub r0, r4, #2
	teq r0, #1
	movne r0, #1
	moveq r0, #0
	bl ov13_0223376C
	add sp, sp, #4
	pop {r3, r4, pc}
_02233668:
	mov r0, #6
	bl ov13_0223ABB8
	sub r0, r4, #7
	teq r0, #1
	movne r0, #1
	moveq r0, #0
	bl ov13_022337D8
	add sp, sp, #4
	pop {r3, r4, pc}
_0223368C:
	ldr r0, _0223375C @ =0x0224F54C
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
	ldr r0, _02233760 @ =ov13_02235260
	bl ov13_0222B8E8
	add sp, sp, #4
	pop {r3, r4, pc}
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
	ldr r0, _02233764 @ =0x022455F4
	ldrb r0, [r0, r4]
	bl ov13_02234974
	mov r2, r0
	mov r0, #0
	mov r1, #1
	bl ov13_02234210
	bl ov13_022344F0
_02233748:
	bl ov13_0223959C
	ldr r0, _02233768 @ =ov13_02233A6C
	bl ov13_0222B8E8
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223375C: .4byte 0x0224F54C
_02233760: .4byte ov13_02235260
_02233764: .4byte 0x022455F4
_02233768: .4byte ov13_02233A6C
	arm_func_end ov13_022335EC

	arm_func_start ov13_0223376C
ov13_0223376C: @ 0x0223376C
	push {r3, r4, r5, lr}
	mov r4, r0
	bl ov13_02239FF0
	ldrb r1, [r0, #0xf5]
	cmp r1, r4
	popeq {r3, r4, r5, pc}
	cmp r4, #0
	beq _022337A8
	ldr r0, _022337D4 @ =0x0224F54C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x43]
	cmp r0, #0
	movne r5, #1
	moveq r5, #0
	b _022337BC
_022337A8:
	ldr r1, _022337D4 @ =0x0224F54C
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
	pop {r3, r4, r5, pc}
	.align 2, 0
_022337D4: .4byte 0x0224F54C
	arm_func_end ov13_0223376C

	arm_func_start ov13_022337D8
ov13_022337D8: @ 0x022337D8
	push {r4, lr}
	mov r4, r0
	bl ov13_02239FF0
	ldrb r0, [r0, #0xf6]
	cmp r0, r4
	popeq {r4, pc}
	ldr r1, _0223380C @ =0x0224F54C
	mov r0, r4
	ldr r1, [r1, #8]
	strb r4, [r1, #0x43]
	bl ov13_0223A018
	bl ov13_02233DCC
	pop {r4, pc}
	.align 2, 0
_0223380C: .4byte 0x0224F54C
	arm_func_end ov13_022337D8

	arm_func_start ov13_02233810
ov13_02233810: @ 0x02233810
	push {r3, lr}
	ldr r0, _02233A5C @ =0x0224F54C
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	popne {r3, pc}
	ldrb r0, [r1, #0x41]
	cmp r0, #0
	subne r0, r0, #1
	strbne r0, [r1, #0x41]
	bl ov13_02239564
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_02233848: @ jump table
	pop {r3, pc} @ case 0
	b _02233868 @ case 1
	b _0223387C @ case 2
	b _022338D0 @ case 3
	b _02233978 @ case 4
	b _02233A48 @ case 5
	b _022339E0 @ case 6
	b _02233A48 @ case 7
_02233868:
	ldr r0, _02233A5C @ =0x0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x45]
	pop {r3, pc}
_0223387C:
	ldr r0, _02233A5C @ =0x0224F54C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x41]
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02227D18
	bl ov13_02239550
	mov r1, #0x91
	mul r1, r0, r1
	ldr r2, _02233A60 @ =0x094F2095
	lsr r0, r1, #0x1f
	smull r1, r3, r2, r1
	ldr r1, _02233A5C @ =0x0224F54C
	add r3, r0, r3, asr #1
	strh r3, [r1, #4]
	bl ov13_02233DCC
	ldr r0, _02233A5C @ =0x0224F54C
	mov r1, #4
	ldr r0, [r0, #8]
	strb r1, [r0, #0x41]
	pop {r3, pc}
_022338D0:
	ldr r0, _02233A5C @ =0x0224F54C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x45]
	bl ov13_02239550
	mov r1, #0x91
	mul r1, r0, r1
	ldr r2, _02233A60 @ =0x094F2095
	lsr r0, r1, #0x1f
	smull r1, r3, r2, r1
	ldr r1, _02233A5C @ =0x0224F54C
	add r3, r0, r3, asr #1
	mov r0, #0x13
	strh r3, [r1, #4]
	bl ov13_0223ABB8
	bl ov13_02233DCC
	ldr r0, _02233A5C @ =0x0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_020CCD3C
	cmp r0, #0
	bne _02233930
	bl ov13_02234CA4
	pop {r3, pc}
_02233930:
	cmp r0, #0x10
	mov r0, #0
	mov r3, #0x78
	bge _0223395C
	ldr r1, _02233A64 @ =ov13_022349DC
	mov r2, r0
	bl ov13_02242528
	ldr r1, _02233A5C @ =0x0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, pc}
_0223395C:
	ldr r1, _02233A68 @ =ov13_02234AA4
	mov r2, r0
	bl ov13_02242528
	ldr r1, _02233A5C @ =0x0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, pc}
_02233978:
	ldr r0, _02233A5C @ =0x0224F54C
	ldrh r1, [r0, #4]
	cmp r1, #0
	bne _022339B4
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x46]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02233A5C @ =0x0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x46]
	pop {r3, pc}
_022339B4:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02233A64 @ =ov13_022349DC
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02233A5C @ =0x0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, pc}
_022339E0:
	ldr r0, _02233A5C @ =0x0224F54C
	ldrh r1, [r0, #4]
	cmp r1, #0x91
	bne _02233A1C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x46]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02233A5C @ =0x0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x46]
	pop {r3, pc}
_02233A1C:
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02233A68 @ =ov13_02234AA4
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02233A5C @ =0x0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, pc}
_02233A48:
	ldr r0, _02233A5C @ =0x0224F54C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x46]
	pop {r3, pc}
	.align 2, 0
_02233A5C: .4byte 0x0224F54C
_02233A60: .4byte 0x094F2095
_02233A64: .4byte ov13_022349DC
_02233A68: .4byte ov13_02234AA4
	arm_func_end ov13_02233810

	arm_func_start ov13_02233A6C
ov13_02233A6C: @ 0x02233A6C
	push {r3, lr}
	bl ov13_0223959C
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02233A88 @ =ov13_02233A8C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02233A88: .4byte ov13_02233A8C
	arm_func_end ov13_02233A6C

	arm_func_start ov13_02233A8C
ov13_02233A8C: @ 0x02233A8C
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _02233AD4 @ =ov13_02233AD8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02233AD4: .4byte ov13_02233AD8
	arm_func_end ov13_02233A8C

	arm_func_start ov13_02233AD8
ov13_02233AD8: @ 0x02233AD8
	push {r3, r4, r5, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, r4, r5, pc}
	ldr r1, _02233DA0 @ =0x0224F54C
	mov r0, #0
	ldr r1, [r1, #8]
	ldr r1, [r1]
	bl ov13_022425F0
	ldr r1, _02233DA0 @ =0x0224F54C
	mov r0, #1
	ldr r1, [r1, #8]
	ldr r1, [r1, #0x3c]
	bl ov13_022425F0
	ldr r4, _02233DA0 @ =0x0224F54C
	mov r5, #0
_02233B2C:
	ldr r0, [r4, #8]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x18]
	bl ov13_02241D98
	add r5, r5, #1
	cmp r5, #7
	blt _02233B2C
	ldr r0, _02233DA0 @ =0x0224F54C
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
	ldr r0, _02233DA0 @ =0x0224F54C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x40]
	cmp r0, #0xc
	beq _02233B88
	bl ov13_0222788C
_02233B88:
	bl ov13_02239288
	ldr r0, _02233DA0 @ =0x0224F54C
	ldr r0, [r0, #8]
	ldr r0, [r0, #8]
	bl ov13_0223FA50
	ldr r4, _02233DA0 @ =0x0224F54C
	mov r5, #0
_02233BA4:
	ldr r0, [r4, #8]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0xc]
	bl ov13_0223FA50
	add r5, r5, #1
	cmp r5, #2
	blt _02233BA4
	ldr r0, _02233DA4 @ =0x022464CC
	ldr r1, _02233DA8 @ =0x020CFD18
	bl ov13_02227924
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x1d
	bl ov13_02240EFC
	ldr r0, _02233DAC @ =0x04000010
	mov r1, #0
	str r1, [r0]
	sub r3, r0, #4
	str r1, [r0, #8]
	ldrh r0, [r3]
	ldr r2, _02233DA0 @ =0x0224F54C
	and r0, r0, #0x43
	orr r0, r0, #0xe10
	strh r0, [r3]
	ldr r0, [r2, #8]
	ldrb r0, [r0, #0x40]
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _02233D94
_02233C20: @ jump table
	b _02233C58 @ case 0
	b _02233C58 @ case 1
	b _02233D94 @ case 2
	b _02233D94 @ case 3
	b _02233C74 @ case 4
	b _02233C74 @ case 5
	b _02233C74 @ case 6
	b _02233D94 @ case 7
	b _02233D94 @ case 8
	b _02233C74 @ case 9
	b _02233C74 @ case 10
	b _02233CA4 @ case 11
	b _02233D3C @ case 12
	b _02233D50 @ case 13
_02233C58:
	bl ov13_0222B934
	mov r0, #2
	mov r1, #0
	bl ov13_0222B8F8
	ldr r0, _02233DB0 @ =ov13_02230FD8
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
	ldr r0, _02233DB4 @ =ov13_02231B18
	bl ov13_0222B8E8
	b _02233D94
_02233CA4:
	bl ov13_02239FF0
	mov r4, r0
	add r0, r4, #0xf0
	bl FUN_0209E788
	strb r0, [r4, #0xd0]
	ldrb r0, [r4, #0xf5]
	cmp r0, #0
	beq _02233CFC
	add r0, r4, #0xc0
	mov r1, #0
	mov r2, #4
	bl FUN_020D4994
	add r0, r4, #0xc4
	mov r1, #0
	mov r2, #4
	bl FUN_020D4994
	add r0, r4, #0xf0
	mov r1, #0
	mov r2, #4
	bl FUN_020D4994
	mov r0, #0
	strb r0, [r4, #0xd0]
_02233CFC:
	ldrb r0, [r4, #0xf6]
	cmp r0, #0
	beq _02233D18
	add r0, r4, #0xc8
	mov r1, #0
	mov r2, #8
	bl FUN_020D4994
_02233D18:
	mov r0, #2
	mov r1, #0
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, r0
	bl ov13_0222B934
	ldr r0, _02233DB8 @ =ov13_02237DD0
	bl ov13_0222B8E8
	b _02233D94
_02233D3C:
	mov r0, r1
	bl ov13_0222B8F8
	ldr r0, _02233DBC @ =ov13_022352D0
	bl ov13_0222B8E8
	b _02233D94
_02233D50:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _02233D74
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02233DC0 @ =ov13_022368D8
	bl ov13_0222B8E8
	b _02233D94
_02233D74:
	bl ov13_02239FF0
	ldrb r0, [r0, #0xf4]
	bl ov13_0223A414
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02233DC4 @ =ov13_02237618
	bl ov13_0222B8E8
_02233D94:
	ldr r0, _02233DC8 @ =0x0224F554
	bl ov13_022412B0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02233DA0: .4byte 0x0224F54C
_02233DA4: .4byte 0x022464CC
_02233DA8: .4byte 0x020CFD18
_02233DAC: .4byte 0x04000010
_02233DB0: .4byte ov13_02230FD8
_02233DB4: .4byte ov13_02231B18
_02233DB8: .4byte ov13_02237DD0
_02233DBC: .4byte ov13_022352D0
_02233DC0: .4byte ov13_022368D8
_02233DC4: .4byte ov13_02237618
_02233DC8: .4byte 0x0224F554
	arm_func_end ov13_02233AD8

	arm_func_start ov13_02233DCC
ov13_02233DCC: @ 0x02233DCC
	push {r4, r5, r6, lr}
	ldr r0, _02233E84 @ =0x0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_020CCD00
	ldr r1, _02233E84 @ =0x0224F54C
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
	ldr r0, _02233E84 @ =0x0224F54C
	ldr r1, _02233E88 @ =0x02245536
	lsl r2, r4, #1
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
	ldr r0, _02233E84 @ =0x0224F54C
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x14]
	bl ov13_02240E2C
	bl ov13_022344F0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02233E84: .4byte 0x0224F54C
_02233E88: .4byte 0x02245536
	arm_func_end ov13_02233DCC

	arm_func_start ov13_02233E8C
ov13_02233E8C: @ 0x02233E8C
	push {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	mov r6, r0
	mov r5, r1
	bl ov13_02239FF0
	cmp r6, #8
	addls pc, pc, r6, lsl #2
	b _02234020
_02233EAC: @ jump table
	b _02233ED0 @ case 0
	b _02233EE4 @ case 1
	b _02234020 @ case 2
	b _02233F74 @ case 3
	b _02233F98 @ case 4
	b _02233FBC @ case 5
	b _02234020 @ case 6
	b _02233FE0 @ case 7
	b _02234004 @ case 8
_02233ED0:
	mov r1, r5
	add r0, r0, #0x40
	bl ov13_02234314
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_02233EE4:
	ldrb r1, [r0, #0xe6]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1e
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02233F28
_02233EFC: @ jump table
	b _02233F0C @ case 0
	b _02233F14 @ case 1
	b _02233F1C @ case 2
	b _02233F24 @ case 3
_02233F0C:
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
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
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1a
	cmp r0, #1
	addeq r0, r4, r4, lsr #31
	asreq r4, r0, #1
	add r0, sp, #0
	bl FUN_020D4994
	add r0, sp, #0
	mov r2, r4
	mov r1, #0x2a
	bl FUN_020E5B44
	add r0, sp, #0
	mov r1, r5
	bl ov13_02234314
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_02233F74:
	ldrb r1, [r0, #0xf5]
	cmp r1, #0
	addne sp, sp, #0x24
	popne {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xc0
	bl ov13_02234468
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_02233F98:
	ldrb r1, [r0, #0xf5]
	cmp r1, #0
	addne sp, sp, #0x24
	popne {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xf0
	bl ov13_02234468
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_02233FBC:
	ldrb r1, [r0, #0xf5]
	cmp r1, #0
	addne sp, sp, #0x24
	popne {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xc4
	bl ov13_02234468
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_02233FE0:
	ldrb r1, [r0, #0xf6]
	cmp r1, #0
	addne sp, sp, #0x24
	popne {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xc8
	bl ov13_02234468
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_02234004:
	ldrb r1, [r0, #0xf6]
	cmp r1, #0
	addne sp, sp, #0x24
	popne {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xcc
	bl ov13_02234468
_02234020:
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
	arm_func_end ov13_02233E8C

	arm_func_start ov13_02234028
ov13_02234028: @ 0x02234028
	push {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	bl ov13_02239FF0
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _0223415C
_02234044: @ jump table
	b _02234068 @ case 0
	b _02234068 @ case 1
	b _02234084 @ case 2
	b _022340D0 @ case 3
	b _022340D0 @ case 4
	b _022340D0 @ case 5
	b _022340E8 @ case 6
	b _02234144 @ case 7
	b _02234144 @ case 8
_02234068:
	mov r4, #0
	mov r0, r4
	mov r5, r4
	bl ov13_0223417C
	cmp r0, #0
	moveq r5, #2
	b _02234164
_02234084:
	ldr r2, _02234178 @ =0x0224F54C
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
	ldr r2, _02234178 @ =0x0224F54C
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
	pop {r4, r5, r6, pc}
	.align 2, 0
_02234178: .4byte 0x0224F54C
	arm_func_end ov13_02234028

	arm_func_start ov13_0223417C
ov13_0223417C: @ 0x0223417C
	push {r4, lr}
	mov r4, r0
	bl ov13_02239FF0
	cmp r4, #0xa
	mov r1, #1
	addls pc, pc, r4, lsl #2
	b _02234208
_02234198: @ jump table
	b _022341D4 @ case 0
	b _022341D4 @ case 1
	b _02234208 @ case 2
	b _02234208 @ case 3
	b _022341EC @ case 4
	b _022341EC @ case 5
	b _022341EC @ case 6
	b _022341C4 @ case 7
	b _02234208 @ case 8
	b _022341FC @ case 9
	b _022341FC @ case 10
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
	pop {r4, pc}
	arm_func_end ov13_0223417C

	arm_func_start ov13_02234210
ov13_02234210: @ 0x02234210
	push {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	ldr r3, _02234308 @ =0x0224F54C
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
	ldrne r0, _02234308 @ =0x0224F54C
	ldrne r0, [r0, #8]
	addne r4, r0, #0x30
	bne _02234284
	ldr r0, _02234308 @ =0x0224F54C
	ldr r0, [r0, #8]
	add r4, r0, #0x2c
_02234284:
	ldr r0, _0223430C @ =0x02245526
	add r1, r6, r6, lsl #1
	add r0, r0, r1
	ldrb r1, [r5, r0]
	ldr r2, [r4]
	cmp r1, #0
	beq _022342EC
	mov r0, #0
	bl ov13_022400F0
	add r0, sp, #0
	lsl r1, r6, #1
	ldrh r2, [r0, r1]
	ldr r3, [r4]
	ldr r0, _02234310 @ =0xFE00FF00
	ldr r1, [r3]
	lsl r2, r2, #0x17
	and r0, r1, r0
	orr r0, r0, r2, lsr #7
	str r0, [r3]
	ldr r1, [r4]
	add sp, sp, #0xc
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	pop {r3, r4, r5, r6, pc}
_022342EC:
	ldr r0, _02234310 @ =0xFE00FF00
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x1000000
	str r0, [r2]
	add sp, sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02234308: .4byte 0x0224F54C
_0223430C: .4byte 0x02245526
_02234310: .4byte 0xFE00FF00
	arm_func_end ov13_02234210

	arm_func_start ov13_02234314
ov13_02234314: @ 0x02234314
	push {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r6, r0
	mov r5, r1
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x22
	bl FUN_020D4994
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
	ldr r2, _02234460 @ =0x0000E01D
	add r1, sp, #0xc
_02234364:
	ldrb r3, [r6, ip]
	lsl r0, ip, #1
	add ip, ip, #1
	cmp r3, #0x20
	strheq r2, [r1, r0]
	strhne r3, [r1, r0]
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
	ldr r0, _02234464 @ =0x0224F54C
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
	pople {r4, r5, r6, pc}
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x22
	bl FUN_020D4994
	sub r4, r4, #0x10
	cmp r4, #0
	mov ip, #0
	ble _02234424
	ldr r2, _02234460 @ =0x0000E01D
	add r1, sp, #0xc
_02234400:
	add r0, r6, ip
	ldrb r3, [r0, #0x10]
	lsl r0, ip, #1
	add ip, ip, #1
	cmp r3, #0x20
	strheq r2, [r1, r0]
	strhne r3, [r1, r0]
	cmp ip, r4
	blt _02234400
_02234424:
	mov r1, #8
	str r1, [sp]
	add r0, sp, #0xc
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, _02234464 @ =0x0224F54C
	add r2, r5, #0xc
	ldr r0, [r0, #8]
	mov r1, #0x48
	ldr r0, [r0, #0x14]
	mov r3, #2
	bl ov13_02240C14
	add sp, sp, #0x30
	pop {r4, r5, r6, pc}
	.align 2, 0
_02234460: .4byte 0x0000E01D
_02234464: .4byte 0x0224F54C
	arm_func_end ov13_02234314

	arm_func_start ov13_02234468
ov13_02234468: @ 0x02234468
	push {r3, r4, lr}
	sub sp, sp, #0x2c
	mov ip, r0
	ldrb r2, [ip, #1]
	mov r4, r1
	add r0, sp, #0xc
	str r2, [sp]
	ldrb r3, [ip, #2]
	ldr r2, _022344E8 @ =0x022464E4
	mov r1, #0x10
	str r3, [sp, #4]
	ldrb r3, [ip, #3]
	str r3, [sp, #8]
	ldrb r3, [ip]
	bl FUN_020ED7EC
	mov r2, #7
	mov r0, #0x1d
	mul r1, r4, r0
	str r2, [sp]
	add r0, sp, #0xc
	str r0, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	ldr r0, _022344EC @ =0x0224F54C
	add r2, r1, #8
	ldr r0, [r0, #8]
	mov r1, #0x5f
	ldr r0, [r0, #0x14]
	mov r3, #2
	bl ov13_02240C14
	add sp, sp, #0x2c
	pop {r3, r4, pc}
	.align 2, 0
_022344E8: .4byte 0x022464E4
_022344EC: .4byte 0x0224F54C
	arm_func_end ov13_02234468

	arm_func_start ov13_022344F0
ov13_022344F0: @ 0x022344F0
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r0, _022346F4 @ =0x0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_020CCD00
	ldr r1, _022346F4 @ =0x0224F54C
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FUN_020CCD3C
	ldr r1, _022346F4 @ =0x0224F54C
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
	ldr r0, _022346F8 @ =0xFE00FF00
	ldr r3, [sp, #4]
	and r0, r2, r0
	and r1, ip, #0xff
	lsl r2, r3, #0x17
	orr r0, r0, r1
	orr r0, r0, r2, lsr #7
	str r0, [r5]
_02234570:
	ldr r8, _022346F4 @ =0x0224F54C
	ldr r6, _022346FC @ =0x01FF0000
	ldr r7, _022346F8 @ =0xFE00FF00
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
	lsr r2, r2, #0x10
	lsl r0, r2, #0x17
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
	ldr r0, _022346F4 @ =0x0224F54C
	rsb r2, r4, #2
	ldr r0, [r0, #8]
	mov r1, #0x1d
	ldr r0, [r0, #0x2c]
	mla r3, r2, r1, ip
	ldr r2, [r0]
	ldr r1, _022346FC @ =0x01FF0000
	and r6, r2, #0xff
	and r1, r2, r1
	lsr r7, r1, #0x10
	mov r5, r2
	ldr r1, _022346F8 @ =0xFE00FF00
	and r2, r3, #0xff
	and r1, r5, r1
	lsl r3, r7, #0x17
	orr r1, r1, r2
	orr r1, r1, r3, lsr #7
	str r7, [sp, #4]
	str r6, [sp]
	str r1, [r0]
	b _02234654
_02234634:
	ldr r1, _022346F4 @ =0x0224F54C
	ldr r0, _022346F8 @ =0xFE00FF00
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
	ldr r0, _022346F4 @ =0x0224F54C
	rsb r2, r4, #6
	ldr r0, [r0, #8]
	mov r1, #0x1d
	ldr r0, [r0, #0x30]
	mla r3, r2, r1, ip
	ldr r2, [r0]
	ldr r1, _022346FC @ =0x01FF0000
	and r5, r2, #0xff
	and r1, r2, r1
	lsr r6, r1, #0x10
	mov r4, r2
	ldr r1, _022346F8 @ =0xFE00FF00
	and r2, r3, #0xff
	and r1, r4, r1
	lsl r3, r6, #0x17
	orr r1, r1, r2
	orr r1, r1, r3, lsr #7
	str r6, [sp, #4]
	str r5, [sp]
	str r1, [r0]
	b _022346DC
_022346BC:
	ldr r1, _022346F4 @ =0x0224F54C
	ldr r0, _022346F8 @ =0xFE00FF00
	ldr r1, [r1, #8]
	ldr r2, [r1, #0x30]
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x1000000
	str r0, [r2]
_022346DC:
	ldr r0, _022346F4 @ =0x0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x44]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022346F4: .4byte 0x0224F54C
_022346F8: .4byte 0xFE00FF00
_022346FC: .4byte 0x01FF0000
	arm_func_end ov13_022344F0

	arm_func_start ov13_02234700
ov13_02234700: @ 0x02234700
	push {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r0, _02234960 @ =0x02245958
	bl ov13_022417DC
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0xe
	popeq {r4, r5, r6, pc}
	ldr r0, _02234964 @ =0x0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_020CCD00
	ldr r1, _02234968 @ =0x022454FC
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
	ldrne r0, _0223496C @ =0x022455DC
	addne sp, sp, #8
	ldrbne r0, [r0, r5]
	popne {r4, r5, r6, pc}
_02234788:
	ldrh r0, [sp, #2]
	add r6, r6, #1
	cmp r6, #4
	add r0, r0, #0x1d
	strh r0, [sp, #2]
	add r5, r5, #1
	blt _02234760
	ldr r0, _02234964 @ =0x0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_020CCD00
	mov r3, #0
_022347B8:
	cmp r0, #2
	bne _02234854
	ldr r1, _02234968 @ =0x022454FC
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
	popne {r4, r5, r6, pc}
	ldr r1, _02234968 @ =0x022454FC
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
	pop {r4, r5, r6, pc}
_02234854:
	add r3, r3, #1
	cmp r3, #4
	add r0, r0, #1
	blt _022347B8
_02234864:
	ldr r0, _02234964 @ =0x0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_020CCD00
	mov r3, #0
_02234878:
	cmp r0, #6
	bne _02234914
	ldr r1, _02234968 @ =0x022454FC
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
	popne {r4, r5, r6, pc}
	ldr r1, _02234968 @ =0x022454FC
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
	pop {r4, r5, r6, pc}
_02234914:
	add r3, r3, #1
	cmp r3, #4
	add r0, r0, #1
	blt _02234878
_02234924:
	ldr r4, _02234970 @ =0x0224558A
	mov r5, #0
_0223492C:
	mov r0, r4
	bl ov13_022417DC
	cmp r0, #0
	addne sp, sp, #8
	addne r0, r5, #0xb
	popne {r4, r5, r6, pc}
	add r5, r5, #1
	cmp r5, #3
	add r4, r4, #8
	blt _0223492C
	mov r0, #0xe
	add sp, sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_02234960: .4byte 0x02245958
_02234964: .4byte 0x0224F54C
_02234968: .4byte 0x022454FC
_0223496C: .4byte 0x022455DC
_02234970: .4byte 0x0224558A
	arm_func_end ov13_02234700

	arm_func_start ov13_02234974
ov13_02234974: @ 0x02234974
	push {r4, lr}
	ldr r1, _022349B4 @ =0x0224F54C
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FUN_020CCD00
	mov r1, #0
_02234990:
	cmp r0, r4
	moveq r0, r1
	popeq {r4, pc}
	add r1, r1, #1
	cmp r1, #4
	add r0, r0, #1
	blt _02234990
	mvn r0, #0
	pop {r4, pc}
	.align 2, 0
_022349B4: .4byte 0x0224F54C
	arm_func_end ov13_02234974

	arm_func_start ov13_022349B8
ov13_022349B8: @ 0x022349B8
	push {r4, lr}
	ldr r1, _022349D8 @ =0x0224F54C
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FUN_020CCD00
	add r0, r0, r4
	pop {r4, pc}
	.align 2, 0
_022349D8: .4byte 0x0224F54C
	arm_func_end ov13_022349B8

	arm_func_start ov13_022349DC
ov13_022349DC: @ 0x022349DC
	push {r3, r4, r5, lr}
	mov r4, r0
	bl ov13_0223959C
	bl ov13_02227D18
	ldr r0, _02234A9C @ =0x0224F54C
	ldrh r1, [r0, #4]
	cmp r1, #6
	subhi r1, r1, #6
	movls r1, #0
	strh r1, [r0, #4]
	ldr r0, _02234A9C @ =0x0224F54C
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_020CCD3C
	mov r5, r0
	cmp r5, #0x17
	bne _02234A28
	bl ov13_02233DCC
	pop {r3, r4, r5, pc}
_02234A28:
	ble _02234A44
	ldr r0, _02234A9C @ =0x0224F54C
	rsb r1, r5, #0x1d
	ldrh r2, [r0, #4]
	mov r5, #0
	add r1, r2, r1
	strh r1, [r0, #4]
_02234A44:
	bl ov13_022344F0
	cmp r5, #0
	popne {r3, r4, r5, pc}
	ldr r1, _02234A9C @ =0x0224F54C
	mov r0, #0x37
	ldrh r1, [r1, #4]
	ldr r2, _02234AA0 @ =0xE1FC780F
	mul r3, r1, r0
	smull r1, r0, r2, r3
	add r0, r3, r0
	lsr r1, r3, #0x1f
	add r0, r1, r0, asr #7
	bl ov13_02239578
	bl ov13_02239584
	bl ov13_02234CA4
	ldr r0, _02234A9C @ =0x0224F54C
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0
	str r0, [r2, #0x38]
	bl ov13_022425D0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02234A9C: .4byte 0x0224F54C
_02234AA0: .4byte 0xE1FC780F
	arm_func_end ov13_022349DC

	arm_func_start ov13_02234AA4
ov13_02234AA4: @ 0x02234AA4
	push {r4, lr}
	mov r4, r0
	bl ov13_0223959C
	bl ov13_02227D18
	ldr r0, _02234B40 @ =0x0224F54C
	mov r1, #0x1d
	ldrh r2, [r0, #4]
	add r2, r2, #6
	strh r2, [r0, #4]
	ldrh r0, [r0, #4]
	bl FUN_020CCD3C
	cmp r0, #6
	blt _02234AE0
	bl ov13_022344F0
	pop {r4, pc}
_02234AE0:
	ldr r1, _02234B40 @ =0x0224F54C
	ldrh r2, [r1, #4]
	sub r0, r2, r0
	strh r0, [r1, #4]
	bl ov13_02233DCC
	ldr r1, _02234B40 @ =0x0224F54C
	mov r0, #0x37
	ldrh r1, [r1, #4]
	ldr r2, _02234B44 @ =0xE1FC780F
	mul r3, r1, r0
	smull r1, r0, r2, r3
	add r0, r3, r0
	lsr r1, r3, #0x1f
	add r0, r1, r0, asr #7
	bl ov13_02239578
	bl ov13_02239584
	bl ov13_02234CA4
	ldr r0, _02234B40 @ =0x0224F54C
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0
	str r0, [r2, #0x38]
	bl ov13_022425D0
	pop {r4, pc}
	.align 2, 0
_02234B40: .4byte 0x0224F54C
_02234B44: .4byte 0xE1FC780F
	arm_func_end ov13_02234AA4

	arm_func_start ov13_02234B48
ov13_02234B48: @ 0x02234B48
	push {r4, lr}
	ldr r0, _02234BBC @ =0x0224F54C
	ldr r1, [r0, #8]
	ldrb r1, [r1, #0x44]
	cmp r1, #0
	popeq {r4, pc}
	ldrh r0, [r0, #4]
	mov r1, #0x1d
	bl FUN_020CCD00
	ldr r1, _02234BBC @ =0x0224F54C
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FUN_020CCD3C
	ldr r2, _02234BC0 @ =0x022455E8
	ldr r1, _02234BC4 @ =0x01FF0000
	sub ip, r0, #0x33
	ldrb r0, [r2, r4]
	ldr r2, _02234BC8 @ =0x04000010
	and r3, r1, ip, lsl #16
	add r0, ip, r0
	str r3, [r2]
	and r1, r1, r0, lsl #16
	ldr r0, _02234BBC @ =0x0224F54C
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	mov r1, #0
	strb r1, [r0, #0x44]
	pop {r4, pc}
	.align 2, 0
_02234BBC: .4byte 0x0224F54C
_02234BC0: .4byte 0x022455E8
_02234BC4: .4byte 0x01FF0000
_02234BC8: .4byte 0x04000010
	arm_func_end ov13_02234B48

	arm_func_start ov13_02234BCC
ov13_02234BCC: @ 0x02234BCC
	push {r3, lr}
	sub sp, sp, #0x18
	ldr ip, _02234C90 @ =0x02245518
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
	ldr r0, _02234C94 @ =0x0224F54C
	add r1, sp, #8
	ldrb r2, [r0]
	ldrb r2, [r1, r2]
	cmp r2, #3
	blt _02234C44
	lsl r3, r2, #3
	ldr r1, _02234C98 @ =0x022455A2
	ldr r2, _02234C9C @ =0x022455A6
	ldr r0, _02234CA0 @ =0x022455A4
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	ldrh r3, [r0, r3]
	mov r0, #3
	bl ov13_02227B6C
	add sp, sp, #0x18
	pop {r3, pc}
_02234C44:
	ldr r1, _02234C98 @ =0x022455A2
	lsl lr, r2, #3
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
	pop {r3, pc}
	.align 2, 0
_02234C90: .4byte 0x02245518
_02234C94: .4byte 0x0224F54C
_02234C98: .4byte 0x022455A2
_02234C9C: .4byte 0x022455A6
_02234CA0: .4byte 0x022455A4
	arm_func_end ov13_02234BCC

	arm_func_start ov13_02234CA4
ov13_02234CA4: @ 0x02234CA4
	push {r4, lr}
	ldr r0, _02234D4C @ =0x0224F54C
	ldrb r0, [r0]
	add r0, r0, #0xf5
	and r0, r0, #0xff
	cmp r0, #2
	bhi _02234CC8
	bl ov13_02234BCC
	pop {r4, pc}
_02234CC8:
	bl ov13_02239FF0
	ldr r1, _02234D4C @ =0x0224F54C
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FUN_020CCD00
	ldr r1, _02234D4C @ =0x0224F54C
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
	strbne r0, [r1]
	moveq r0, #3
	strbeq r0, [r1]
	b _02234D44
_02234D1C:
	ldrb r0, [r4, #0xf6]
	cmp r0, #0
	movne r0, #7
	strbne r0, [r1]
	moveq r0, #8
	strbeq r0, [r1]
	b _02234D44
_02234D38:
	ldr r0, _02234D50 @ =0x022455DC
	ldrb r0, [r0, r2]
	strb r0, [r1]
_02234D44:
	bl ov13_02234BCC
	pop {r4, pc}
	.align 2, 0
_02234D4C: .4byte 0x0224F54C
_02234D50: .4byte 0x022455DC
	arm_func_end ov13_02234CA4

	arm_func_start ov13_02234D54
ov13_02234D54: @ 0x02234D54
	push {r3, lr}
	ldr r1, _02234D7C @ =0x0224F54C
	ldr r2, _02234D80 @ =0x022455F4
	strb r0, [r1]
	ldrb r0, [r2, r0]
	bl ov13_02234974
	ldr r1, _02234D7C @ =0x0224F54C
	strb r0, [r1, #2]
	bl ov13_02234BCC
	pop {r3, pc}
	.align 2, 0
_02234D7C: .4byte 0x0224F54C
_02234D80: .4byte 0x022455F4
	arm_func_end ov13_02234D54

	arm_func_start ov13_02234D84
ov13_02234D84: @ 0x02234D84
	push {r3, r4, r5, lr}
	mov r5, r0
	bl ov13_02239FF0
	ldr r1, _02235068 @ =0x0224F54C
	mov r4, #0
	ldrb r2, [r1]
	cmp r2, #8
	ldrbeq r0, [r0, #0xf5]
	cmpeq r0, #0
	bne _02234DB8
	cmp r5, #0
	cmpne r5, #2
	popeq {r3, r4, r5, pc}
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
_02234DD8: @ jump table
	b _02234E20 @ case 0
	b _02234E5C @ case 1
	b _02234EC4 @ case 2
	b _02234EC4 @ case 3
_02234DE8:
	cmp r5, #1
	bne _02234E00
	ldr r0, _02235068 @ =0x0224F54C
	mov r1, #0xb
	strb r1, [r0]
	b _02235048
_02234E00:
	cmp r5, #3
	movne r4, #2
	bne _02235048
	ldr r0, _02235068 @ =0x0224F54C
	ldrb r1, [r0, #2]
	add r1, r1, #1
	strb r1, [r0, #2]
	b _02235048
_02234E20:
	cmp r5, #1
	bne _02234E3C
	ldr r0, _02235068 @ =0x0224F54C
	ldrb r1, [r0, #2]
	sub r1, r1, #1
	strb r1, [r0, #2]
	b _02235048
_02234E3C:
	cmp r5, #3
	movne r4, #2
	bne _02235048
	ldr r0, _02235068 @ =0x0224F54C
	ldr r1, [r0, #8]
	ldrb r1, [r1, #0x42]
	strb r1, [r0]
	b _02235048
_02234E5C:
	cmp r5, #1
	bne _02234E94
	ldr r0, _02235068 @ =0x0224F54C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x47]
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02235068 @ =0x0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, r4, r5, pc}
_02234E94:
	cmp r5, #3
	movne r4, #2
	bne _02235048
	ldr r0, _02235068 @ =0x0224F54C
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #2]
	strh r1, [r0, #4]
	bl ov13_02233DCC
	mov r0, #0
	bl ov13_02239578
	b _02235048
_02234EC4:
	ldr r0, _02235068 @ =0x0224F54C
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
	popne {r3, r4, r5, pc}
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02235068 @ =0x0224F54C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, r4, r5, pc}
_02234F34:
	cmp r2, #0xc
	moveq r1, #0xd
	strbeq r1, [r0]
	movne r1, #0xc
	strbne r1, [r0]
	b _02235048
_02234F4C:
	cmp r5, #1
	bne _02234F98
	ldr r0, _02235068 @ =0x0224F54C
	ldrb r1, [r0, #2]
	cmp r1, #0
	subne r1, r1, #1
	strbne r1, [r0, #2]
	bne _02235048
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _0223506C @ =ov13_022349DC
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02235068 @ =0x0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, r4, r5, pc}
_02234F98:
	cmp r5, #3
	bne _02234FE4
	ldr r0, _02235068 @ =0x0224F54C
	ldrb r1, [r0, #2]
	cmp r1, #3
	addlo r1, r1, #1
	strblo r1, [r0, #2]
	blo _02235048
	mov r0, #0x13
	bl ov13_0223ABB8
	mov r0, #0
	ldr r1, _02235070 @ =ov13_02234AA4
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02235068 @ =0x0224F54C
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, r4, r5, pc}
_02234FE4:
	cmp r2, #2
	mov r4, #2
	bne _02235000
	ldr r0, _02235068 @ =0x0224F54C
	mov r1, #3
	strb r1, [r0]
	b _0223503C
_02235000:
	cmp r2, #3
	ldreq r0, _02235068 @ =0x0224F54C
	strbeq r4, [r0]
	beq _0223503C
	cmp r2, #7
	bne _02235028
	ldr r0, _02235068 @ =0x0224F54C
	mov r1, #8
	strb r1, [r0]
	b _0223503C
_02235028:
	cmp r2, #8
	bne _02235048
	ldr r0, _02235068 @ =0x0224F54C
	mov r1, #7
	strb r1, [r0]
_0223503C:
	mov r0, #8
	bl ov13_0223ABB8
	bl ov13_02234BCC
_02235048:
	cmp r4, #2
	popeq {r3, r4, r5, pc}
	mov r0, #8
	bl ov13_0223ABB8
	cmp r4, #0
	popne {r3, r4, r5, pc}
	bl ov13_02234CA4
	pop {r3, r4, r5, pc}
	.align 2, 0
_02235068: .4byte 0x0224F54C
_0223506C: .4byte ov13_022349DC
_02235070: .4byte ov13_02234AA4
	arm_func_end ov13_02234D84

	arm_func_start ov13_02235074
ov13_02235074: @ 0x02235074
	ldr r0, _0223509C @ =0x0224F54C
	ldr r1, _022350A0 @ =0x022454F8
	ldrb r2, [r0]
	ldr r0, [r0, #8]
	ldr ip, _022350A4 @ =ov13_02239378
	sub r2, r2, #0xb
	ldrb r1, [r1, r2]
	ldr r0, [r0, #0x10]
	mov r2, r1
	bx ip
	.align 2, 0
_0223509C: .4byte 0x0224F54C
_022350A0: .4byte 0x022454F8
_022350A4: .4byte ov13_02239378
	arm_func_end ov13_02235074

	arm_func_start ov13_022350A8
ov13_022350A8: @ 0x022350A8
	push {r3, r4, r5, lr}
	ldr r5, _022350F8 @ =0x0224F54C
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
	pop {r3, r4, r5, pc}
	.align 2, 0
_022350F8: .4byte 0x0224F54C
	arm_func_end ov13_022350A8

	arm_func_start ov13_022350FC
ov13_022350FC: @ 0x022350FC
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r1, _022351B8 @ =0x022454FC
	ldr r0, _022351BC @ =0x0224F54C
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
	ldr r0, _022351BC @ =0x0224F54C
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
	ldm sp!, {r3}
	bx lr
_02235180:
	add r0, r3, #1
	add r0, r1, r0
	mov r1, #0
	strb r1, [r0, #4]
	add sp, sp, #4
	ldm sp!, {r3}
	bx lr
_0223519C:
	add r3, r3, #1
	cmp r3, #4
	add r1, r1, #1
	blt _02235138
	add sp, sp, #4
	ldm sp!, {r3}
	bx lr
	.align 2, 0
_022351B8: .4byte 0x022454FC
_022351BC: .4byte 0x0224F54C
	arm_func_end ov13_022350FC

	arm_func_start ov13_022351C0
ov13_022351C0: @ 0x022351C0
	push {r4, lr}
	bl ov13_02239FF0
	mov r4, r0
	ldrb r0, [r4, #0x40]
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
	ldrb r0, [r4, #0xf6]
	cmp r0, #0
	bne _0223520C
	add r0, r4, #0xc8
	bl FUN_0209E8A0
	cmp r0, #0
	bne _0223520C
	add r0, r4, #0xcc
	bl FUN_0209E8A0
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
_0223520C:
	ldrb r0, [r4, #0xf5]
	cmp r0, #0
	bne _02235258
	add r0, r4, #0xc0
	bl FUN_0209E8A0
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
	add r0, r4, #0xc4
	bl FUN_0209E8A0
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
	add r0, r4, #0xc0
	add r1, r4, #0xf0
	bl FUN_0209E824
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
_02235258:
	mov r0, #1
	pop {r4, pc}
	arm_func_end ov13_022351C0

	arm_func_start ov13_02235260
ov13_02235260: @ 0x02235260
	push {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _02235298 @ =0x0224F54C
	ldr r0, [r0, #8]
	ldr r0, [r0, #0xc]
	bl ov13_022393E0
	ldr r0, _0223529C @ =ov13_022352A0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235298: .4byte 0x0224F54C
_0223529C: .4byte ov13_022352A0
	arm_func_end ov13_02235260

	arm_func_start ov13_022352A0
ov13_022352A0: @ 0x022352A0
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _022352BC @ =ov13_022332D8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022352BC: .4byte ov13_022332D8
	arm_func_end ov13_022352A0

	arm_func_start ov13_022352C0
ov13_022352C0: @ 0x022352C0
	ldr r1, _022352CC @ =0x0224F54C
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_022352CC: .4byte 0x0224F54C
	arm_func_end ov13_022352C0

	arm_func_start ov13_022352D0
ov13_022352D0: @ 0x022352D0
	push {r3, lr}
	bl ov13_022352F0
	bl ov13_02227E40
	bl ov13_0223A4F4
	ldr r0, _022352EC @ =ov13_02235384
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022352EC: .4byte ov13_02235384
	arm_func_end ov13_022352D0

	arm_func_start ov13_022352F0
ov13_022352F0: @ 0x022352F0
	push {r3, lr}
	ldr r0, _02235364 @ =0x02246504
	ldr r1, _02235368 @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _0223536C @ =0x0224651C
	ldr r1, _02235370 @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _02235374 @ =0x02246534
	ldr r1, _02235378 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r2, _0223537C @ =0x04001008
	ldr r1, _02235380 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_02235364: .4byte 0x02246504
_02235368: .4byte 0x020D03A4
_0223536C: .4byte 0x0224651C
_02235370: .4byte FUN_020CFC6C
_02235374: .4byte 0x02246534
_02235378: .4byte FUN_020D00A4
_0223537C: .4byte 0x04001008
_02235380: .4byte 0x0400000A
	arm_func_end ov13_022352F0

	arm_func_start ov13_02235384
ov13_02235384: @ 0x02235384
	push {r3, lr}
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
	ldr r0, _022353D4 @ =ov13_022353D8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022353D4: .4byte ov13_022353D8
	arm_func_end ov13_02235384

	arm_func_start ov13_022353D8
ov13_022353D8: @ 0x022353D8
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r2, #1
	mov ip, #0
	sub r3, r2, #2
	mov r0, #0x44
	mov r1, #5
	str ip, [sp]
	bl ov13_0223BE6C
	ldr r0, _02235424 @ =ov13_02235428
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235424: .4byte ov13_02235428
	arm_func_end ov13_022353D8

	arm_func_start ov13_02235428
ov13_02235428: @ 0x02235428
	push {r3, lr}
	bl ov13_02235450
	bl ov13_02235454
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0223544C @ =ov13_02235458
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0223544C: .4byte ov13_02235458
	arm_func_end ov13_02235428

	arm_func_start ov13_02235450
ov13_02235450: @ 0x02235450
	bx lr
	arm_func_end ov13_02235450

	arm_func_start ov13_02235454
ov13_02235454: @ 0x02235454
	bx lr
	arm_func_end ov13_02235454

	arm_func_start ov13_02235458
ov13_02235458: @ 0x02235458
	push {r3, lr}
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
	ldr r0, _02235490 @ =ov13_02235494
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235490: .4byte ov13_02235494
	arm_func_end ov13_02235458

	arm_func_start ov13_02235494
ov13_02235494: @ 0x02235494
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _022354EC @ =ov13_022368D8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022354EC: .4byte ov13_022368D8
	arm_func_end ov13_02235494

	arm_func_start ov13_022354F0
ov13_022354F0: @ 0x022354F0
	ldr r0, _0223550C @ =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_0223550C: .4byte 0x027FFFA8
	arm_func_end ov13_022354F0

	arm_func_start ov13_02235510
ov13_02235510: @ 0x02235510
	push {r3, lr}
	ldr r0, _02235544 @ =0x0224F558
	mov r1, #0
	strb r1, [r0]
	bl ov13_0223554C
	bl ov13_02227E40
	mov r0, #0x25
	bl ov13_022279EC
	mov r0, #1
	bl ov13_02226F58
	ldr r0, _02235548 @ =ov13_022355CC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235544: .4byte 0x0224F558
_02235548: .4byte ov13_022355CC
	arm_func_end ov13_02235510

	arm_func_start ov13_0223554C
ov13_0223554C: @ 0x0223554C
	push {r3, lr}
	ldr r0, _022355BC @ =0x02246548
	ldr r1, _022355C0 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _022355C4 @ =0x04001008
	ldr r1, _022355C8 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_022355BC: .4byte 0x02246548
_022355C0: .4byte FUN_020D00A4
_022355C4: .4byte 0x04001008
_022355C8: .4byte 0x0400000A
	arm_func_end ov13_0223554C

	arm_func_start ov13_022355CC
ov13_022355CC: @ 0x022355CC
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _022355FC @ =ov13_02235600
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022355FC: .4byte ov13_02235600
	arm_func_end ov13_022355CC

	arm_func_start ov13_02235600
ov13_02235600: @ 0x02235600
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #1
	bl ov13_022279B4
	ldr r0, _02235628 @ =ov13_0223562C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235628: .4byte ov13_0223562C
	arm_func_end ov13_02235600

	arm_func_start ov13_0223562C
ov13_0223562C: @ 0x0223562C
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _02235650 @ =ov13_02235654
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235650: .4byte ov13_02235654
	arm_func_end ov13_0223562C

	arm_func_start ov13_02235654
ov13_02235654: @ 0x02235654
	push {r3, lr}
	mov r0, #0xa
	bl FUN_020D2108
	bl ov13_02235838
	bl ov13_02235674
	bl ov13_022356AC
	bl ov13_022356B0
	pop {r3, pc}
	arm_func_end ov13_02235654

	arm_func_start ov13_02235674
ov13_02235674: @ 0x02235674
	push {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _02235694
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
_02235694:
	bl ov13_022354F0
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_02235674

	arm_func_start ov13_022356AC
ov13_022356AC: @ 0x022356AC
	bx lr
	arm_func_end ov13_022356AC

	arm_func_start ov13_022356B0
ov13_022356B0: @ 0x022356B0
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _022356D8 @ =ov13_022356DC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022356D8: .4byte ov13_022356DC
	arm_func_end ov13_022356B0

	arm_func_start ov13_022356DC
ov13_022356DC: @ 0x022356DC
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _022356F8 @ =ov13_022356FC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022356F8: .4byte ov13_022356FC
	arm_func_end ov13_022356DC

	arm_func_start ov13_022356FC
ov13_022356FC: @ 0x022356FC
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02235768 @ =0x0224F558
	ldrb r0, [r0]
	cmp r0, #0
	bne _02235724
	bl ov13_02227228
_02235724:
	ldr r0, _02235768 @ =0x0224F558
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
	ldr r0, _0223576C @ =ov13_02235770
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235768: .4byte 0x0224F558
_0223576C: .4byte ov13_02235770
	arm_func_end ov13_022356FC

	arm_func_start ov13_02235770
ov13_02235770: @ 0x02235770
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0223582C @ =0x0224F558
	ldrb r0, [r0]
	cmp r0, #0
	bne _022357A4
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
_022357A4:
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0223582C @ =0x0224F558
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
	ldr r0, _0223582C @ =0x0224F558
	ldrb r0, [r0]
	cmp r0, #0
	bne _02235814
	bl ov13_0222BFCC
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02235830 @ =ov13_02237618
	bl ov13_0222B8E8
	pop {r3, pc}
_02235814:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _02235834 @ =ov13_02235928
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0223582C: .4byte 0x0224F558
_02235830: .4byte ov13_02237618
_02235834: .4byte ov13_02235928
	arm_func_end ov13_02235770

	arm_func_start ov13_02235838
ov13_02235838: @ 0x02235838
	push {r3, lr}
	bl ov13_0222BFF0
	cmp r0, #2
	beq _02235854
	cmp r0, #4
	beq _0223586C
	pop {r3, pc}
_02235854:
	ldr r1, _022358B0 @ =0x0224F558
	mov r2, #1
	ldr r0, _022358B4 @ =ov13_022356DC
	strb r2, [r1]
	bl ov13_0222B8E8
	pop {r3, pc}
_0223586C:
	ldr r0, _022358B0 @ =0x0224F558
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
	ldr r0, _022358B8 @ =ov13_022358BC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022358B0: .4byte 0x0224F558
_022358B4: .4byte ov13_022356DC
_022358B8: .4byte ov13_022358BC
	arm_func_end ov13_02235838

	arm_func_start ov13_022358BC
ov13_022358BC: @ 0x022358BC
	push {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _022358E4 @ =ov13_022358E8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022358E4: .4byte ov13_022358E8
	arm_func_end ov13_022358BC

	arm_func_start ov13_022358E8
ov13_022358E8: @ 0x022358E8
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02235904 @ =ov13_022356DC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235904: .4byte ov13_022356DC
	arm_func_end ov13_022358E8

	arm_func_start ov13_02235908
ov13_02235908: @ 0x02235908
	ldr r0, _02235924 @ =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02235924: .4byte 0x027FFFA8
	arm_func_end ov13_02235908

	arm_func_start ov13_02235928
ov13_02235928: @ 0x02235928
	push {r3, lr}
	ldr r0, _0223595C @ =0x0224F55C
	mov r1, #0
	strb r1, [r0]
	bl ov13_02235964
	bl ov13_02227E40
	mov r0, #0x2a
	bl ov13_022279EC
	mov r0, #2
	bl ov13_02226F58
	ldr r0, _02235960 @ =ov13_022359E4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0223595C: .4byte 0x0224F55C
_02235960: .4byte ov13_022359E4
	arm_func_end ov13_02235928

	arm_func_start ov13_02235964
ov13_02235964: @ 0x02235964
	push {r3, lr}
	ldr r0, _022359D4 @ =0x0224655C
	ldr r1, _022359D8 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _022359DC @ =0x04001008
	ldr r1, _022359E0 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_022359D4: .4byte 0x0224655C
_022359D8: .4byte FUN_020D00A4
_022359DC: .4byte 0x04001008
_022359E0: .4byte 0x0400000A
	arm_func_end ov13_02235964

	arm_func_start ov13_022359E4
ov13_022359E4: @ 0x022359E4
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02235A14 @ =ov13_02235A18
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235A14: .4byte ov13_02235A18
	arm_func_end ov13_022359E4

	arm_func_start ov13_02235A18
ov13_02235A18: @ 0x02235A18
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #1
	bl ov13_022279B4
	ldr r0, _02235A40 @ =ov13_02235A44
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235A40: .4byte ov13_02235A44
	arm_func_end ov13_02235A18

	arm_func_start ov13_02235A44
ov13_02235A44: @ 0x02235A44
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _02235A68 @ =ov13_02235A6C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235A68: .4byte ov13_02235A6C
	arm_func_end ov13_02235A44

	arm_func_start ov13_02235A6C
ov13_02235A6C: @ 0x02235A6C
	push {r3, lr}
	mov r0, #0xa
	bl FUN_020D2108
	bl ov13_02235C34
	bl ov13_02235A8C
	bl ov13_02235AC4
	bl ov13_02235AC8
	pop {r3, pc}
	arm_func_end ov13_02235A6C

	arm_func_start ov13_02235A8C
ov13_02235A8C: @ 0x02235A8C
	push {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _02235AAC
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
_02235AAC:
	bl ov13_02235908
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_02235A8C

	arm_func_start ov13_02235AC4
ov13_02235AC4: @ 0x02235AC4
	bx lr
	arm_func_end ov13_02235AC4

	arm_func_start ov13_02235AC8
ov13_02235AC8: @ 0x02235AC8
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _02235AF0 @ =ov13_02235AF4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235AF0: .4byte ov13_02235AF4
	arm_func_end ov13_02235AC8

	arm_func_start ov13_02235AF4
ov13_02235AF4: @ 0x02235AF4
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02235B10 @ =ov13_02235B14
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235B10: .4byte ov13_02235B14
	arm_func_end ov13_02235AF4

	arm_func_start ov13_02235B14
ov13_02235B14: @ 0x02235B14
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02227228
	ldr r0, _02235B70 @ =0x0224F55C
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
	ldr r0, _02235B74 @ =ov13_02235B78
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235B70: .4byte 0x0224F55C
_02235B74: .4byte ov13_02235B78
	arm_func_end ov13_02235B14

	arm_func_start ov13_02235B78
ov13_02235B78: @ 0x02235B78
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02235C28 @ =0x0224F55C
	ldrb r0, [r0]
	cmp r0, #0
	bne _02235BAC
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
_02235BAC:
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _02235C28 @ =0x0224F55C
	ldrb r0, [r0]
	cmp r0, #0
	bne _02235BE4
	bl ov13_0222788C
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
_02235BE4:
	bl ov13_0222BFCC
	ldr r0, _02235C28 @ =0x0224F55C
	ldrb r0, [r0]
	cmp r0, #0
	bne _02235C10
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02235C2C @ =ov13_02237618
	bl ov13_0222B8E8
	pop {r3, pc}
_02235C10:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _02235C30 @ =ov13_02235D58
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235C28: .4byte 0x0224F55C
_02235C2C: .4byte ov13_02237618
_02235C30: .4byte ov13_02235D58
	arm_func_end ov13_02235B78

	arm_func_start ov13_02235C34
ov13_02235C34: @ 0x02235C34
	push {r3, lr}
	bl ov13_0222BFF0
	cmp r0, #3
	beq _02235C58
	cmp r0, #4
	beq _02235C78
	cmp r0, #5
	beq _02235CBC
	pop {r3, pc}
_02235C58:
	ldr r0, _02235D00 @ =0x0224F55C
	mov r1, #1
	strb r1, [r0]
	bl ov13_0223AC20
	bl ov13_0222C0AC
	ldr r0, _02235D04 @ =ov13_02235AF4
	bl ov13_0222B8E8
	pop {r3, pc}
_02235C78:
	ldr r0, _02235D00 @ =0x0224F55C
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
	ldr r0, _02235D08 @ =ov13_02235D0C
	bl ov13_0222B8E8
	pop {r3, pc}
_02235CBC:
	ldr r0, _02235D00 @ =0x0224F55C
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
	ldr r0, _02235D08 @ =ov13_02235D0C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235D00: .4byte 0x0224F55C
_02235D04: .4byte ov13_02235AF4
_02235D08: .4byte ov13_02235D0C
	arm_func_end ov13_02235C34

	arm_func_start ov13_02235D0C
ov13_02235D0C: @ 0x02235D0C
	push {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _02235D34 @ =ov13_02235D38
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235D34: .4byte ov13_02235D38
	arm_func_end ov13_02235D0C

	arm_func_start ov13_02235D38
ov13_02235D38: @ 0x02235D38
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02235D54 @ =ov13_02235AF4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235D54: .4byte ov13_02235AF4
	arm_func_end ov13_02235D38

	arm_func_start ov13_02235D58
ov13_02235D58: @ 0x02235D58
	push {r3, lr}
	ldr r0, _02235D8C @ =0x0224F560
	mov r1, #0
	strb r1, [r0]
	bl ov13_02235D94
	bl ov13_02227E40
	mov r0, #0x26
	bl ov13_022279EC
	mov r0, #0x10
	bl ov13_0223ABB8
	ldr r0, _02235D90 @ =ov13_02235E14
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235D8C: .4byte 0x0224F560
_02235D90: .4byte ov13_02235E14
	arm_func_end ov13_02235D58

	arm_func_start ov13_02235D94
ov13_02235D94: @ 0x02235D94
	push {r3, lr}
	ldr r0, _02235E04 @ =0x02246570
	ldr r1, _02235E08 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _02235E0C @ =0x04001008
	ldr r1, _02235E10 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_02235E04: .4byte 0x02246570
_02235E08: .4byte FUN_020D00A4
_02235E0C: .4byte 0x04001008
_02235E10: .4byte 0x0400000A
	arm_func_end ov13_02235D94

	arm_func_start ov13_02235E14
ov13_02235E14: @ 0x02235E14
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02235E44 @ =ov13_02235E48
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235E44: .4byte ov13_02235E48
	arm_func_end ov13_02235E14

	arm_func_start ov13_02235E48
ov13_02235E48: @ 0x02235E48
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02235E68 @ =ov13_02235E6C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235E68: .4byte ov13_02235E6C
	arm_func_end ov13_02235E48

	arm_func_start ov13_02235E6C
ov13_02235E6C: @ 0x02235E6C
	push {r3, lr}
	bl ov13_02235F2C
	bl ov13_02235E7C
	pop {r3, pc}
	arm_func_end ov13_02235E6C

	arm_func_start ov13_02235E7C
ov13_02235E7C: @ 0x02235E7C
	bx lr
	arm_func_end ov13_02235E7C

	arm_func_start ov13_02235E80
ov13_02235E80: @ 0x02235E80
	push {r3, lr}
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
	ldr r0, _02235EB8 @ =ov13_02235EBC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235EB8: .4byte ov13_02235EBC
	arm_func_end ov13_02235E80

	arm_func_start ov13_02235EBC
ov13_02235EBC: @ 0x02235EBC
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _02235F28 @ =ov13_02238440
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235F28: .4byte ov13_02238440
	arm_func_end ov13_02235EBC

	arm_func_start ov13_02235F2C
ov13_02235F2C: @ 0x02235F2C
	push {r3, lr}
	ldr r0, _02235F58 @ =0x0224F560
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0x78
	poplo {r3, pc}
	ldr r0, _02235F5C @ =ov13_02235E80
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235F58: .4byte 0x0224F560
_02235F5C: .4byte ov13_02235E80
	arm_func_end ov13_02235F2C

	arm_func_start ov13_02235F60
ov13_02235F60: @ 0x02235F60
	ldr r0, _02235F7C @ =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02235F7C: .4byte 0x027FFFA8
	arm_func_end ov13_02235F60

	arm_func_start ov13_02235F80
ov13_02235F80: @ 0x02235F80
	push {r3, lr}
	ldr r0, _02235FD4 @ =0x0224F564
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
	ldr r0, _02235FD8 @ =ov13_02236084
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02235FD4: .4byte 0x0224F564
_02235FD8: .4byte ov13_02236084
	arm_func_end ov13_02235F80

	arm_func_start ov13_02235FDC
ov13_02235FDC: @ 0x02235FDC
	push {r3, lr}
	ldr r0, _02236064 @ =0x02246584
	ldr r1, _02236068 @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _0223606C @ =0x0224659C
	ldr r1, _02236070 @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _02236074 @ =0x022465B4
	ldr r1, _02236078 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _0223607C @ =0x04001008
	ldr r1, _02236080 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_02236064: .4byte 0x02246584
_02236068: .4byte 0x020D03A4
_0223606C: .4byte 0x0224659C
_02236070: .4byte FUN_020CFC6C
_02236074: .4byte 0x022465B4
_02236078: .4byte FUN_020D00A4
_0223607C: .4byte 0x04001008
_02236080: .4byte 0x0400000A
	arm_func_end ov13_02235FDC

	arm_func_start ov13_02236084
ov13_02236084: @ 0x02236084
	push {r3, lr}
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
	ldr r0, _022360D4 @ =ov13_022360D8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022360D4: .4byte ov13_022360D8
	arm_func_end ov13_02236084

	arm_func_start ov13_022360D8
ov13_022360D8: @ 0x022360D8
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0222BF60
	mov r0, #1
	bl ov13_022279B4
	ldr r0, _02236114 @ =ov13_02236118
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236114: .4byte ov13_02236118
	arm_func_end ov13_022360D8

	arm_func_start ov13_02236118
ov13_02236118: @ 0x02236118
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _0223613C @ =ov13_02236140
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0223613C: .4byte ov13_02236140
	arm_func_end ov13_02236118

	arm_func_start ov13_02236140
ov13_02236140: @ 0x02236140
	push {r3, lr}
	mov r0, #0xa
	bl FUN_020D2108
	bl ov13_02236324
	bl ov13_02236160
	bl ov13_02236198
	bl ov13_0223619C
	pop {r3, pc}
	arm_func_end ov13_02236140

	arm_func_start ov13_02236160
ov13_02236160: @ 0x02236160
	push {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _02236180
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
_02236180:
	bl ov13_02235F60
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_02236160

	arm_func_start ov13_02236198
ov13_02236198: @ 0x02236198
	bx lr
	arm_func_end ov13_02236198

	arm_func_start ov13_0223619C
ov13_0223619C: @ 0x0223619C
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _022361C4 @ =ov13_022361C8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022361C4: .4byte ov13_022361C8
	arm_func_end ov13_0223619C

	arm_func_start ov13_022361C8
ov13_022361C8: @ 0x022361C8
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _022361E4 @ =ov13_022361E8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022361E4: .4byte ov13_022361E8
	arm_func_end ov13_022361C8

	arm_func_start ov13_022361E8
ov13_022361E8: @ 0x022361E8
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02236254 @ =0x0224F564
	ldrb r0, [r0]
	cmp r0, #0
	bne _02236210
	bl ov13_02227228
_02236210:
	ldr r0, _02236254 @ =0x0224F564
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
	ldr r0, _02236258 @ =ov13_0223625C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236254: .4byte 0x0224F564
_02236258: .4byte ov13_0223625C
	arm_func_end ov13_022361E8

	arm_func_start ov13_0223625C
ov13_0223625C: @ 0x0223625C
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02236318 @ =0x0224F564
	ldrb r0, [r0]
	cmp r0, #0
	bne _02236290
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
_02236290:
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _02236318 @ =0x0224F564
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
	ldr r0, _02236318 @ =0x0224F564
	ldrb r0, [r0]
	cmp r0, #0
	bne _02236300
	bl ov13_0222BFCC
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _0223631C @ =ov13_02237618
	bl ov13_0222B8E8
	pop {r3, pc}
_02236300:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _02236320 @ =ov13_02235510
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236318: .4byte 0x0224F564
_0223631C: .4byte ov13_02237618
_02236320: .4byte ov13_02235510
	arm_func_end ov13_0223625C

	arm_func_start ov13_02236324
ov13_02236324: @ 0x02236324
	push {r3, lr}
	bl ov13_0222BFF0
	cmp r0, #1
	beq _02236340
	cmp r0, #4
	beq _02236358
	pop {r3, pc}
_02236340:
	ldr r1, _0223639C @ =0x0224F564
	mov r2, #1
	ldr r0, _022363A0 @ =ov13_022361C8
	strb r2, [r1]
	bl ov13_0222B8E8
	pop {r3, pc}
_02236358:
	ldr r0, _0223639C @ =0x0224F564
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
	ldr r0, _022363A4 @ =ov13_022363A8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0223639C: .4byte 0x0224F564
_022363A0: .4byte ov13_022361C8
_022363A4: .4byte ov13_022363A8
	arm_func_end ov13_02236324

	arm_func_start ov13_022363A8
ov13_022363A8: @ 0x022363A8
	push {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _022363D0 @ =ov13_022363D4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022363D0: .4byte ov13_022363D4
	arm_func_end ov13_022363A8

	arm_func_start ov13_022363D4
ov13_022363D4: @ 0x022363D4
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _022363F0 @ =ov13_022361C8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022363F0: .4byte ov13_022361C8
	arm_func_end ov13_022363D4

	arm_func_start ov13_022363F4
ov13_022363F4: @ 0x022363F4
	push {r3, lr}
	ldr r0, _02236454 @ =0x0224F568
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
	ldr r0, _02236458 @ =ov13_02236504
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236454: .4byte 0x0224F568
_02236458: .4byte ov13_02236504
	arm_func_end ov13_022363F4

	arm_func_start ov13_0223645C
ov13_0223645C: @ 0x0223645C
	push {r3, lr}
	ldr r0, _022364E4 @ =0x022465C8
	ldr r1, _022364E8 @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _022364EC @ =0x022465E0
	ldr r1, _022364F0 @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _022364F4 @ =0x022465F8
	ldr r1, _022364F8 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _022364FC @ =0x04001008
	ldr r1, _02236500 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_022364E4: .4byte 0x022465C8
_022364E8: .4byte 0x020D03A4
_022364EC: .4byte 0x022465E0
_022364F0: .4byte FUN_020CFC6C
_022364F4: .4byte 0x022465F8
_022364F8: .4byte FUN_020D00A4
_022364FC: .4byte 0x04001008
_02236500: .4byte 0x0400000A
	arm_func_end ov13_0223645C

	arm_func_start ov13_02236504
ov13_02236504: @ 0x02236504
	push {r3, lr}
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
	ldr r0, _02236554 @ =ov13_02236558
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236554: .4byte ov13_02236558
	arm_func_end ov13_02236504

	arm_func_start ov13_02236558
ov13_02236558: @ 0x02236558
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #1
	bl ov13_022279B4
	ldr r0, _02236590 @ =ov13_02236594
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236590: .4byte ov13_02236594
	arm_func_end ov13_02236558

	arm_func_start ov13_02236594
ov13_02236594: @ 0x02236594
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _022365B8 @ =ov13_022365BC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022365B8: .4byte ov13_022365BC
	arm_func_end ov13_02236594

	arm_func_start ov13_022365BC
ov13_022365BC: @ 0x022365BC
	push {r3, lr}
	bl ov13_022366FC
	bl ov13_02236720
	bl ov13_02236724
	bl ov13_022365D4
	pop {r3, pc}
	arm_func_end ov13_022365BC

	arm_func_start ov13_022365D4
ov13_022365D4: @ 0x022365D4
	push {r3, lr}
	sub sp, sp, #8
	ldr r0, _022366F0 @ =0x0224F568
	ldrh r1, [r0, #2]
	add r1, r1, #1
	strh r1, [r0, #2]
	ldrh r0, [r0, #2]
	cmp r0, #0x12c
	addlo sp, sp, #8
	poplo {r3, pc}
	bl ov13_0223AC20
	add r0, sp, #4
	bl ov13_02239D04
	cmp r0, #0
	bne _02236654
	ldr r0, _022366F0 @ =0x0224F568
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
	ldr r0, _022366F4 @ =ov13_0223688C
	bl ov13_0222B8E8
	add sp, sp, #8
	pop {r3, pc}
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
	ldr r0, _022366F0 @ =0x0224F568
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
	ldr r0, _022366F4 @ =ov13_0223688C
	bl ov13_0222B8E8
	add sp, sp, #8
	pop {r3, pc}
_022366CC:
	ldr r1, _022366F0 @ =0x0224F568
	mov r2, #1
	mov r0, #0xf
	strb r2, [r1]
	bl ov13_0223ABB8
	ldr r0, _022366F8 @ =ov13_02236750
	bl ov13_0222B8E8
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_022366F0: .4byte 0x0224F568
_022366F4: .4byte ov13_0223688C
_022366F8: .4byte ov13_02236750
	arm_func_end ov13_022365D4

	arm_func_start ov13_022366FC
ov13_022366FC: @ 0x022366FC
	push {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	popeq {r3, pc}
	bl ov13_0223AC20
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_022366FC

	arm_func_start ov13_02236720
ov13_02236720: @ 0x02236720
	bx lr
	arm_func_end ov13_02236720

	arm_func_start ov13_02236724
ov13_02236724: @ 0x02236724
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _0223674C @ =ov13_02236750
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0223674C: .4byte ov13_02236750
	arm_func_end ov13_02236724

	arm_func_start ov13_02236750
ov13_02236750: @ 0x02236750
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _0223676C @ =ov13_02236770
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0223676C: .4byte ov13_02236770
	arm_func_end ov13_02236750

	arm_func_start ov13_02236770
ov13_02236770: @ 0x02236770
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _022367BC @ =ov13_022367C0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022367BC: .4byte ov13_022367C0
	arm_func_end ov13_02236770

	arm_func_start ov13_022367C0
ov13_022367C0: @ 0x022367C0
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
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
	ldr r0, _02236880 @ =0x0224F568
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
	ldr r0, _02236884 @ =ov13_02237618
	bl ov13_0222B8E8
	pop {r3, pc}
_0223685C:
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, r0
	bl ov13_0222B934
	ldr r0, _02236888 @ =ov13_0222FA3C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236880: .4byte 0x0224F568
_02236884: .4byte ov13_02237618
_02236888: .4byte ov13_0222FA3C
	arm_func_end ov13_022367C0

	arm_func_start ov13_0223688C
ov13_0223688C: @ 0x0223688C
	push {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _022368B4 @ =ov13_022368B8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022368B4: .4byte ov13_022368B8
	arm_func_end ov13_0223688C

	arm_func_start ov13_022368B8
ov13_022368B8: @ 0x022368B8
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _022368D4 @ =ov13_02236750
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022368D4: .4byte ov13_02236750
	arm_func_end ov13_022368B8

	arm_func_start ov13_022368D8
ov13_022368D8: @ 0x022368D8
	push {r3, lr}
	mov r0, #0x20
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _02236930 @ =0x0224F56C
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
	ldr r0, _02236934 @ =ov13_02236B50
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236930: .4byte 0x0224F56C
_02236934: .4byte ov13_02236B50
	arm_func_end ov13_022368D8

	arm_func_start ov13_02236938
ov13_02236938: @ 0x02236938
	push {r3, lr}
	sub sp, sp, #0x18
	ldr ip, _02236A18 @ =0x0224560C
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
	ldr r0, _02236A1C @ =0x0224660C
	ldr r1, _02236A20 @ =0x020CFD18
	bl ov13_02227924
	ldr r0, _02236A24 @ =0x02246620
	ldr r1, _02236A28 @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _02236A2C @ =0x02246638
	ldr r1, _02236A30 @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _02236A34 @ =0x02246650
	ldr r1, _02236A38 @ =FUN_020D00A4
	bl ov13_02227924
	add r0, sp, #0
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r2, _02236A3C @ =0x0224F56C
	mov r1, #0x10
	ldr r2, [r2, #4]
	str r0, [r2]
	mov r0, #1
	bl ov13_02240EA8
	ldr r2, _02236A40 @ =0x04001008
	ldr r1, _02236A44 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_02236A18: .4byte 0x0224560C
_02236A1C: .4byte 0x0224660C
_02236A20: .4byte 0x020CFD18
_02236A24: .4byte 0x02246620
_02236A28: .4byte 0x020D03A4
_02236A2C: .4byte 0x02246638
_02236A30: .4byte FUN_020CFC6C
_02236A34: .4byte 0x02246650
_02236A38: .4byte FUN_020D00A4
_02236A3C: .4byte 0x0224F56C
_02236A40: .4byte 0x04001008
_02236A44: .4byte 0x0400000A
	arm_func_end ov13_02236938

	arm_func_start ov13_02236A48
ov13_02236A48: @ 0x02236A48
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, #0
	ldr r6, _02236B44 @ =0x02245622
	ldr r5, _02236B48 @ =0x02245600
	ldr r4, _02236B4C @ =0x0224F56C
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
	lsl r2, r3, #2
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
	lsl r2, sl, #2
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
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02236B44: .4byte 0x02245622
_02236B48: .4byte 0x02245600
_02236B4C: .4byte 0x0224F56C
	arm_func_end ov13_02236A48

	arm_func_start ov13_02236B50
ov13_02236B50: @ 0x02236B50
	push {r3, lr}
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
	ldr r0, _02236BA0 @ =ov13_02236BA4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236BA0: .4byte ov13_02236BA4
	arm_func_end ov13_02236B50

	arm_func_start ov13_02236BA4
ov13_02236BA4: @ 0x02236BA4
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_022279B4
	ldr r0, _02236BDC @ =ov13_02236BE0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236BDC: .4byte ov13_02236BE0
	arm_func_end ov13_02236BA4

	arm_func_start ov13_02236BE0
ov13_02236BE0: @ 0x02236BE0
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_0223B2A8
	cmp r0, #1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _02236C10 @ =ov13_02236C14
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236C10: .4byte ov13_02236C14
	arm_func_end ov13_02236BE0

	arm_func_start ov13_02236C14
ov13_02236C14: @ 0x02236C14
	push {r3, lr}
	bl ov13_02236C28
	bl ov13_02236D1C
	bl ov13_02236D20
	pop {r3, pc}
	arm_func_end ov13_02236C14

	arm_func_start ov13_02236C28
ov13_02236C28: @ 0x02236C28
	push {r3, r4, r5, lr}
	ldr r5, _02236D14 @ =0x0224563A
	mov r4, #0
_02236C34:
	mov r0, r5
	bl ov13_022417DC
	cmp r0, #0
	beq _02236C5C
	mov r0, #1
	bl ov13_0222726C
	ldr r0, _02236D18 @ =0x0224F56C
	strb r4, [r0]
	bl ov13_022370B8
	pop {r3, r4, r5, pc}
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
	pop {r3, r4, r5, pc}
_02236C88:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _02236CA4
	mov r0, #0
	bl ov13_0222726C
	pop {r3, r4, r5, pc}
_02236CA4:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _02236CC0
	mov r0, #1
	bl ov13_02237134
	pop {r3, r4, r5, pc}
_02236CC0:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	beq _02236CDC
	mov r0, #3
	bl ov13_02237134
	pop {r3, r4, r5, pc}
_02236CDC:
	mov r0, #0x20
	bl ov13_022416D4
	cmp r0, #0
	beq _02236CF8
	mov r0, #0
	bl ov13_02237134
	pop {r3, r4, r5, pc}
_02236CF8:
	mov r0, #0x10
	bl ov13_022416D4
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	mov r0, #2
	bl ov13_02237134
	pop {r3, r4, r5, pc}
	.align 2, 0
_02236D14: .4byte 0x0224563A
_02236D18: .4byte 0x0224F56C
	arm_func_end ov13_02236C28

	arm_func_start ov13_02236D1C
ov13_02236D1C: @ 0x02236D1C
	bx lr
	arm_func_end ov13_02236D1C

	arm_func_start ov13_02236D20
ov13_02236D20: @ 0x02236D20
	push {r3, r4, lr}
	sub sp, sp, #4
	bl ov13_02227258
	cmp r0, #0
	beq _02236D44
	cmp r0, #1
	beq _02236D8C
	add sp, sp, #4
	pop {r3, r4, pc}
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
	ldr r0, _02236E40 @ =0x0224F56C
	mov r1, #2
	ldr r0, [r0, #4]
	strb r1, [r0, #0x1d]
	b _02236E30
_02236D78:
	bl ov13_022272E4
	ldr r0, _02236E44 @ =ov13_0222C10C
	bl ov13_0222B8E8
	add sp, sp, #4
	pop {r3, r4, pc}
_02236D8C:
	ldr r0, _02236E40 @ =0x0224F56C
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
	pop {r3, r4, pc}
_02236DD4:
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0222B970
	ldr r1, _02236E48 @ =0x022456AC
	add ip, r4, #1
	ldrsb r3, [r1, r0]
	mov r0, #0x46
	mov r1, #0
	mov r2, #1
	str ip, [sp]
	bl ov13_0223BE6C
	bl ov13_02237328
	bl ov13_022272E4
	ldr r0, _02236E4C @ =ov13_022373B8
	bl ov13_0222B8E8
	add sp, sp, #4
	pop {r3, r4, pc}
_02236E18:
	cmp r0, #2
	bhi _02236E24
	bl ov13_0223A414
_02236E24:
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_02237548
_02236E30:
	ldr r0, _02236E50 @ =ov13_02236E54
	bl ov13_0222B8E8
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02236E40: .4byte 0x0224F56C
_02236E44: .4byte ov13_0222C10C
_02236E48: .4byte 0x022456AC
_02236E4C: .4byte ov13_022373B8
_02236E50: .4byte ov13_02236E54
	arm_func_end ov13_02236D20

	arm_func_start ov13_02236E54
ov13_02236E54: @ 0x02236E54
	push {r3, lr}
	ldr r0, _02236E88 @ =0x0224F56C
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x1d]
	cmp r0, #2
	bne _02236E70
	bl ov13_0223B1A0
_02236E70:
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02236E8C @ =ov13_02236E90
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236E88: .4byte 0x0224F56C
_02236E8C: .4byte ov13_02236E90
	arm_func_end ov13_02236E54

	arm_func_start ov13_02236E90
ov13_02236E90: @ 0x02236E90
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02236F0C @ =0x0224F56C
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
	ldr r0, _02236F10 @ =ov13_02236F14
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02236F0C: .4byte 0x0224F56C
_02236F10: .4byte ov13_02236F14
	arm_func_end ov13_02236E90

	arm_func_start ov13_02236F14
ov13_02236F14: @ 0x02236F14
	push {r3, r4, r5, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, r4, r5, pc}
	bl ov13_0223B6C8
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	ldr r4, _02237098 @ =0x0224F56C
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
	ldr r4, _02237098 @ =0x0224F56C
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
	ldr r0, _02237098 @ =0x0224F56C
	ldr r0, [r0, #4]
	ldr r0, [r0]
	bl ov13_0223FA50
	ldr r0, _0223709C @ =0x02246664
	ldr r1, _022370A0 @ =0x020CFD18
	bl ov13_02227924
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EFC
	ldr r0, _02237098 @ =0x0224F56C
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x1d]
	cmp r1, #2
	bne _02237010
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _022370A4 @ =ov13_0222C44C
	bl ov13_0222B8E8
	b _0223708C
_02237010:
	ldrb r0, [r0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0223708C
_02237020: @ jump table
	b _02237030 @ case 0
	b _02237030 @ case 1
	b _02237030 @ case 2
	b _02237078 @ case 3
_02237030:
	mov r0, #2
	mov r1, #0
	bl ov13_0222B8F8
	bl ov13_02239FF0
	ldrb r0, [r0, #0xe7]
	cmp r0, #0xff
	bne _02237058
	ldr r0, _022370A8 @ =ov13_02237618
	bl ov13_0222B8E8
	b _0223708C
_02237058:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B934
	mov r0, #0
	bl ov13_022352C0
	ldr r0, _022370AC @ =ov13_02232E04
	bl ov13_0222B8E8
	b _0223708C
_02237078:
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _022370B0 @ =ov13_022388A0
	bl ov13_0222B8E8
_0223708C:
	ldr r0, _022370B4 @ =0x0224F570
	bl ov13_022412B0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02237098: .4byte 0x0224F56C
_0223709C: .4byte 0x02246664
_022370A0: .4byte 0x020CFD18
_022370A4: .4byte ov13_0222C44C
_022370A8: .4byte ov13_02237618
_022370AC: .4byte ov13_02232E04
_022370B0: .4byte ov13_022388A0
_022370B4: .4byte 0x0224F570
	arm_func_end ov13_02236F14

	arm_func_start ov13_022370B8
ov13_022370B8: @ 0x022370B8
	push {r3, lr}
	ldr r0, _02237120 @ =0x0224F56C
	ldrb r2, [r0]
	cmp r2, #4
	bhs _022370F8
	lsl ip, r2, #3
	ldr r0, _02237124 @ =0x02245672
	ldr r1, _02237128 @ =0x02245676
	ldr r2, _0223712C @ =0x02245674
	ldr r3, _02237130 @ =0x02245678
	ldrh r0, [r0, ip]
	ldrh r1, [r1, ip]
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	bl ov13_02227C28
	pop {r3, pc}
_022370F8:
	ldr r1, _02237124 @ =0x02245672
	lsl r3, r2, #3
	ldr r2, _02237128 @ =0x02245676
	ldr r0, _0223712C @ =0x02245674
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	ldrh r3, [r0, r3]
	mov r0, #0
	bl ov13_02227B6C
	pop {r3, pc}
	.align 2, 0
_02237120: .4byte 0x0224F56C
_02237124: .4byte 0x02245672
_02237128: .4byte 0x02245676
_0223712C: .4byte 0x02245674
_02237130: .4byte 0x02245678
	arm_func_end ov13_022370B8

	arm_func_start ov13_02237134
ov13_02237134: @ 0x02237134
	push {r3, lr}
	ldr r2, _02237324 @ =0x0224F56C
	mov r1, #1
	ldrb r3, [r2]
	cmp r3, #6
	addls pc, pc, r3, lsl #2
	b _0223730C
_02237150: @ jump table
	b _0223716C @ case 0
	b _022371AC @ case 1
	b _022371EC @ case 2
	b _0223722C @ case 3
	b _02237254 @ case 4
	b _02237294 @ case 5
	b _022372D0 @ case 6
_0223716C:
	ldr r3, [r2, #4]
	mov ip, #0
	cmp r0, #0
	strb ip, [r3, #0x1c]
	moveq r0, #2
	strbeq r0, [r2]
	beq _0223730C
	cmp r0, #2
	strbeq r1, [r2]
	beq _0223730C
	cmp r0, #1
	moveq r0, #3
	strbeq r0, [r2]
	movne r0, #4
	strbne r0, [r2]
	b _0223730C
_022371AC:
	ldr r3, [r2, #4]
	cmp r0, #0
	strb r1, [r3, #0x1c]
	moveq r0, #0
	strbeq r0, [r2]
	beq _0223730C
	cmp r0, #2
	moveq r0, #2
	strbeq r0, [r2]
	beq _0223730C
	cmp r0, #1
	moveq r0, #3
	strbeq r0, [r2]
	movne r0, #5
	strbne r0, [r2]
	b _0223730C
_022371EC:
	ldr r3, [r2, #4]
	mov ip, #2
	strb ip, [r3, #0x1c]
	cmp r0, #0
	strbeq r1, [r2]
	beq _0223730C
	cmp r0, #2
	moveq r0, #0
	strbeq r0, [r2]
	beq _0223730C
	cmp r0, #1
	moveq r0, #3
	strbeq r0, [r2]
	movne r0, #6
	strbne r0, [r2]
	b _0223730C
_0223722C:
	ldr r3, [r2, #4]
	cmp r0, #1
	ldrb ip, [r3, #0x1c]
	add r3, ip, #4
	strbeq r3, [r2]
	beq _0223730C
	cmp r0, #3
	strbeq ip, [r2]
	movne r1, #0
	b _0223730C
_02237254:
	ldr r3, [r2, #4]
	mov ip, #0
	cmp r0, #0
	strb ip, [r3, #0x1c]
	moveq r0, #6
	strbeq r0, [r2]
	beq _0223730C
	cmp r0, #2
	moveq r0, #5
	strbeq r0, [r2]
	beq _0223730C
	cmp r0, #1
	strbeq ip, [r2]
	movne r0, #3
	strbne r0, [r2]
	b _0223730C
_02237294:
	ldr r3, [r2, #4]
	cmp r0, #0
	strb r1, [r3, #0x1c]
	moveq r0, #4
	strbeq r0, [r2]
	beq _0223730C
	cmp r0, #2
	moveq r0, #6
	strbeq r0, [r2]
	beq _0223730C
	cmp r0, #1
	strbeq r1, [r2]
	movne r0, #3
	strbne r0, [r2]
	b _0223730C
_022372D0:
	ldr r3, [r2, #4]
	mov ip, #2
	cmp r0, #0
	strb ip, [r3, #0x1c]
	moveq r0, #5
	strbeq r0, [r2]
	beq _0223730C
	cmp r0, #2
	moveq r0, #4
	strbeq r0, [r2]
	beq _0223730C
	cmp r0, #1
	strbeq ip, [r2]
	movne r0, #3
	strbne r0, [r2]
_0223730C:
	cmp r1, #0
	popeq {r3, pc}
	mov r0, #8
	bl ov13_0223ABB8
	bl ov13_022370B8
	pop {r3, pc}
	.align 2, 0
_02237324: .4byte 0x0224F56C
	arm_func_end ov13_02237134

	arm_func_start ov13_02237328
ov13_02237328: @ 0x02237328
	push {r4, lr}
	ldr r0, _022373AC @ =0x0224F56C
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
	ldr r0, _022373AC @ =0x0224F56C
	add r3, r4, #3
	ldr r2, [r0, #4]
	ldr r1, _022373B0 @ =0x02245622
	lsl r3, r3, #2
	ldr r0, _022373B4 @ =0x02245624
	add ip, r2, r4, lsl #2
	ldrh r2, [r1, r3]
	ldrh r3, [r0, r3]
	ldr r0, [ip, #0x10]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _022373AC @ =0x0224F56C
	mvn r1, #0
	ldr r0, [r0, #4]
	mov r2, #3
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov13_02240008
	pop {r4, pc}
	.align 2, 0
_022373AC: .4byte 0x0224F56C
_022373B0: .4byte 0x02245622
_022373B4: .4byte 0x02245624
	arm_func_end ov13_02237328

	arm_func_start ov13_022373B8
ov13_022373B8: @ 0x022373B8
	push {r4, lr}
	ldr r0, _02237514 @ =0x0224F56C
	ldrb r0, [r0]
	sub r4, r0, #4
	bl ov13_0223C1DC
	cmp r0, #0
	beq _02237488
	cmp r0, #1
	popne {r4, pc}
	mov r0, #0xe
	bl ov13_0223ABB8
	mov r0, r4
	bl ov13_0223A804
	ldr r0, _02237514 @ =0x0224F56C
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #4]
	bl ov13_0223FDE0
	mov r2, r0
	mov r0, #0
	mov r1, #0x56
	bl ov13_022400F0
	ldr r0, _02237514 @ =0x0224F56C
	lsl ip, r4, #2
	ldr r0, [r0, #4]
	mvn r1, #0
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #4]
	ldr r2, _02237518 @ =0x02245622
	ldr r3, _0223751C @ =0x02245624
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	bl ov13_0223FF18
	ldr r0, _02237514 @ =0x0224F56C
	mvn r1, #0
	ldr r0, [r0, #4]
	mov r2, #3
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #4]
	bl ov13_02240008
	ldr r0, _02237514 @ =0x0224F56C
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov13_0223FD60
	mov r1, #0
	ldr r0, _02237514 @ =0x0224F56C
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	str r1, [r0, #0x10]
	b _02237504
_02237488:
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _02237514 @ =0x0224F56C
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov13_0223FDE0
	mov r2, r0
	mov r0, #0
	mov r1, #0x11
	bl ov13_022400F0
	ldr r0, _02237514 @ =0x0224F56C
	add r1, r4, #3
	ldr r0, [r0, #4]
	lsl ip, r1, #2
	ldr r2, _02237518 @ =0x02245622
	ldr r3, _0223751C @ =0x02245624
	add r0, r0, r4, lsl #2
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	ldr r0, [r0, #0x10]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _02237514 @ =0x0224F56C
	mvn r1, #0
	ldr r0, [r0, #4]
	mov r2, #3
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov13_02240008
_02237504:
	bl ov13_0223C198
	ldr r0, _02237520 @ =ov13_02237524
	bl ov13_0222B8E8
	pop {r4, pc}
	.align 2, 0
_02237514: .4byte 0x0224F56C
_02237518: .4byte 0x02245622
_0223751C: .4byte 0x02245624
_02237520: .4byte ov13_02237524
	arm_func_end ov13_022373B8

	arm_func_start ov13_02237524
ov13_02237524: @ 0x02237524
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	bl ov13_022272CC
	ldr r0, _02237544 @ =ov13_02236C14
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02237544: .4byte ov13_02236C14
	arm_func_end ov13_02237524

	arm_func_start ov13_02237548
ov13_02237548: @ 0x02237548
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r1, _02237610 @ =0x02245604
	ldr r0, _02237614 @ =0x0224F56C
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
	pophi {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r2, r1]
	ldr r0, [r0, #4]
	ldr r0, [r0]
	mov r2, r1
	bl ov13_02239378
	ldr r0, _02237614 @ =0x0224F56C
	ldrb r0, [r0]
	cmp r0, #3
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, pc}
	bl ov13_0223A3FC
	ldr r1, _02237614 @ =0x0224F56C
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
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02237610: .4byte 0x02245604
_02237614: .4byte 0x0224F56C
	arm_func_end ov13_02237548

	arm_func_start ov13_02237618
ov13_02237618: @ 0x02237618
	push {r4, r5, r6, lr}
	bl ov13_02239FF0
	ldr r1, _02237720 @ =0x0224F574
	mov r2, #0
	strb r2, [r1, #2]
	ldrsb r2, [r1]
	mov r4, r0
	cmp r2, #0
	moveq r0, #1
	strbeq r0, [r1]
	bl ov13_0222B970
	cmp r0, #0
	beq _02237674
	ldr r0, _02237720 @ =0x0224F574
	ldrsb r1, [r0, #1]
	cmp r1, #2
	moveq r1, #0
	strbeq r1, [r0, #1]
	ldr r0, _02237720 @ =0x0224F574
	ldrsb r1, [r0]
	cmp r1, #2
	moveq r1, #1
	strbeq r1, [r0]
_02237674:
	bl ov13_0223773C
	bl ov13_02227E40
	bl ov13_0222B970
	mov r5, r0
	ldrb r1, [r4, #0xf4]
	mov r0, #0x32
	ldr r3, _02237724 @ =0x02245770
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
	ldr r1, _02237728 @ =0x0224572E
	ldr r0, _02237720 @ =0x0224F574
	add ip, r1, r6, lsl #5
	ldrsb lr, [r0, #1]
	ldr r1, _0223772C @ =0x02245732
	ldr r0, _02237730 @ =0x02245730
	add r1, r1, r5, lsl #5
	add r2, r0, r4, lsl #5
	lsl r5, lr, #3
	ldrh r0, [r5, ip]
	ldrh r1, [r5, r1]
	ldrh r2, [r5, r2]
	ldr r4, _02237734 @ =0x02245734
	add r3, r4, r3, lsl #5
	ldrh r3, [r5, r3]
	bl ov13_02227C28
	ldr r0, _02237738 @ =ov13_02237828
	bl ov13_0222B8E8
	pop {r4, r5, r6, pc}
	.align 2, 0
_02237720: .4byte 0x0224F574
_02237724: .4byte 0x02245770
_02237728: .4byte 0x0224572E
_0223772C: .4byte 0x02245732
_02237730: .4byte 0x02245730
_02237734: .4byte 0x02245734
_02237738: .4byte ov13_02237828
	arm_func_end ov13_02237618

	arm_func_start ov13_0223773C
ov13_0223773C: @ 0x0223773C
	push {r3, lr}
	sub sp, sp, #0x18
	ldr ip, _02237800 @ =0x022456B8
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
	ldr r0, _02237804 @ =0x0224667C
	ldr r1, _02237808 @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _0223780C @ =0x02246694
	ldr r1, _02237810 @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _02237814 @ =0x022466AC
	ldr r1, _02237818 @ =FUN_020D00A4
	bl ov13_02227924
	add r0, sp, #0
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _0223781C @ =0x0224F574
	ldr r2, _02237820 @ =0x04001008
	str r0, [r1, #4]
	ldrh r0, [r2]
	ldr r1, _02237824 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_02237800: .4byte 0x022456B8
_02237804: .4byte 0x0224667C
_02237808: .4byte 0x020D03A4
_0223780C: .4byte 0x02246694
_02237810: .4byte FUN_020CFC6C
_02237814: .4byte 0x022466AC
_02237818: .4byte FUN_020D00A4
_0223781C: .4byte 0x0224F574
_02237820: .4byte 0x04001008
_02237824: .4byte 0x0400000A
	arm_func_end ov13_0223773C

	arm_func_start ov13_02237828
ov13_02237828: @ 0x02237828
	push {r3, lr}
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
	ldr r0, _02237878 @ =ov13_0223787C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02237878: .4byte ov13_0223787C
	arm_func_end ov13_02237828

	arm_func_start ov13_0223787C
ov13_0223787C: @ 0x0223787C
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_022279B4
	ldr r0, _022378B4 @ =ov13_022378B8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022378B4: .4byte ov13_022378B8
	arm_func_end ov13_0223787C

	arm_func_start ov13_022378B8
ov13_022378B8: @ 0x022378B8
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _022378DC @ =ov13_022378E0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022378DC: .4byte ov13_022378E0
	arm_func_end ov13_022378B8

	arm_func_start ov13_022378E0
ov13_022378E0: @ 0x022378E0
	push {r3, lr}
	bl ov13_022378F4
	bl ov13_02237A78
	bl ov13_02237A7C
	pop {r3, pc}
	arm_func_end ov13_022378E0

	arm_func_start ov13_022378F4
ov13_022378F4: @ 0x022378F4
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	ldr r4, _02237A60 @ =0x022456EE
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
	ldr r1, _02237A64 @ =0x0224F574
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
	ldr r0, _02237A64 @ =0x0224F574
	ldr r1, _02237A68 @ =0x0224572E
	ldrsb lr, [r0, #1]
	ldr r0, _02237A6C @ =0x02245730
	add ip, r1, r6, lsl #5
	ldr r1, _02237A70 @ =0x02245732
	add r2, r0, r4, lsl #5
	ldr r4, _02237A74 @ =0x02245734
	add r1, r1, r5, lsl #5
	lsl r5, lr, #3
	add r3, r4, r3, lsl #5
	ldrh r0, [r5, ip]
	ldrh r1, [r5, r1]
	ldrh r2, [r5, r2]
	ldrh r3, [r5, r3]
	bl ov13_02227C28
	pop {r3, r4, r5, r6, r7, pc}
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
	pop {r3, r4, r5, r6, r7, pc}
_022379D4:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _022379F0
	mov r0, #0
	bl ov13_0222726C
	pop {r3, r4, r5, r6, r7, pc}
_022379F0:
	mov r0, #0x40
	bl ov13_022416D4
	cmp r0, #0
	beq _02237A0C
	mov r0, #1
	bl ov13_02237C84
	pop {r3, r4, r5, r6, r7, pc}
_02237A0C:
	mov r0, #0x80
	bl ov13_022416D4
	cmp r0, #0
	beq _02237A28
	mov r0, #3
	bl ov13_02237C84
	pop {r3, r4, r5, r6, r7, pc}
_02237A28:
	mov r0, #0x20
	bl ov13_022416D4
	cmp r0, #0
	beq _02237A44
	mov r0, #0
	bl ov13_02237C84
	pop {r3, r4, r5, r6, r7, pc}
_02237A44:
	mov r0, #0x10
	bl ov13_022416D4
	cmp r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	mov r0, #2
	bl ov13_02237C84
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02237A60: .4byte 0x022456EE
_02237A64: .4byte 0x0224F574
_02237A68: .4byte 0x0224572E
_02237A6C: .4byte 0x02245730
_02237A70: .4byte 0x02245732
_02237A74: .4byte 0x02245734
	arm_func_end ov13_022378F4

	arm_func_start ov13_02237A78
ov13_02237A78: @ 0x02237A78
	bx lr
	arm_func_end ov13_02237A78

	arm_func_start ov13_02237A7C
ov13_02237A7C: @ 0x02237A7C
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	beq _02237A98
	cmp r0, #1
	beq _02237AA4
	pop {r3, pc}
_02237A98:
	mov r0, #7
	bl ov13_0223ABB8
	b _02237ABC
_02237AA4:
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_02237D78
	ldr r0, _02237AC8 @ =0x0224F574
	mov r1, #1
	strb r1, [r0, #2]
_02237ABC:
	ldr r0, _02237ACC @ =ov13_02237AD0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02237AC8: .4byte 0x0224F574
_02237ACC: .4byte ov13_02237AD0
	arm_func_end ov13_02237A7C

	arm_func_start ov13_02237AD0
ov13_02237AD0: @ 0x02237AD0
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02237AEC @ =ov13_02237AF0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02237AEC: .4byte ov13_02237AF0
	arm_func_end ov13_02237AD0

	arm_func_start ov13_02237AF0
ov13_02237AF0: @ 0x02237AF0
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02237B4C @ =0x0224F574
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
	ldr r0, _02237B50 @ =ov13_02237B54
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02237B4C: .4byte 0x0224F574
_02237B50: .4byte ov13_02237B54
	arm_func_end ov13_02237AF0

	arm_func_start ov13_02237B54
ov13_02237B54: @ 0x02237B54
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	bl ov13_02227D18
	bl ov13_0222788C
	ldr r0, _02237C6C @ =0x0224F574
	ldr r0, [r0, #4]
	bl ov13_0223FA50
	mov r0, #1
	mov r1, r0
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EFC
	ldr r0, _02237C6C @ =0x0224F574
	ldrb r1, [r0, #2]
	cmp r1, #0
	bne _02237BD8
	mov r0, #2
	mov r1, #0
	bl ov13_0222B8F8
	ldr r0, _02237C70 @ =ov13_022368D8
	bl ov13_0222B8E8
	pop {r3, pc}
_02237BD8:
	ldrsb r0, [r0, #1]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_02237BE8: @ jump table
	b _02237BF8 @ case 0
	b _02237C10 @ case 1
	b _02237C28 @ case 2
	b _02237C40 @ case 3
_02237BF8:
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02237C74 @ =ov13_022363F4
	bl ov13_0222B8E8
	pop {r3, pc}
_02237C10:
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02237C78 @ =ov13_0222F2AC
	bl ov13_0222B8E8
	pop {r3, pc}
_02237C28:
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02237C7C @ =ov13_02235F80
	bl ov13_0222B8E8
	pop {r3, pc}
_02237C40:
	mov r0, #2
	mov r1, #0
	bl ov13_0222B8F8
	mov r0, #0
	mov r1, r0
	bl ov13_0222B934
	mov r0, #1
	bl ov13_022352C0
	ldr r0, _02237C80 @ =ov13_02232E04
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02237C6C: .4byte 0x0224F574
_02237C70: .4byte ov13_022368D8
_02237C74: .4byte ov13_022363F4
_02237C78: .4byte ov13_0222F2AC
_02237C7C: .4byte ov13_02235F80
_02237C80: .4byte ov13_02232E04
	arm_func_end ov13_02237B54

	arm_func_start ov13_02237C84
ov13_02237C84: @ 0x02237C84
	push {r4, r5, r6, lr}
	ldr r1, _02237D60 @ =0x0224F574
	mov r5, r0
	mov r0, #1
	ldrsb r4, [r1, #1]
	bl ov13_0222B998
	ldr r2, _02237D64 @ =0x022456CE
	mvn r1, #0
	add r0, r2, r0, lsl #4
	add r0, r0, r4, lsl #2
	ldrsb r2, [r5, r0]
	cmp r2, r1
	popeq {r4, r5, r6, pc}
	cmp r2, #0
	ldreq r0, _02237D60 @ =0x0224F574
	strbeq r4, [r0]
	mvn r0, #1
	cmp r2, r0
	ldrne r0, _02237D60 @ =0x0224F574
	strbne r2, [r0, #1]
	bne _02237CE4
	ldr r0, _02237D60 @ =0x0224F574
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
	ldr r1, _02237D68 @ =0x0224572E
	ldr r0, _02237D60 @ =0x0224F574
	add ip, r1, r6, lsl #5
	ldrsb lr, [r0, #1]
	ldr r1, _02237D6C @ =0x02245732
	ldr r0, _02237D70 @ =0x02245730
	add r1, r1, r5, lsl #5
	add r2, r0, r4, lsl #5
	lsl r5, lr, #3
	ldrh r0, [r5, ip]
	ldrh r1, [r5, r1]
	ldrh r2, [r5, r2]
	ldr r4, _02237D74 @ =0x02245734
	add r3, r4, r3, lsl #5
	ldrh r3, [r5, r3]
	bl ov13_02227C28
	pop {r4, r5, r6, pc}
	.align 2, 0
_02237D60: .4byte 0x0224F574
_02237D64: .4byte 0x022456CE
_02237D68: .4byte 0x0224572E
_02237D6C: .4byte 0x02245732
_02237D70: .4byte 0x02245730
_02237D74: .4byte 0x02245734
	arm_func_end ov13_02237C84

	arm_func_start ov13_02237D78
ov13_02237D78: @ 0x02237D78
	push {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _02237DC8 @ =0x022456B4
	ldr r0, _02237DCC @ =0x0224F574
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
	pop {r3, r4, pc}
	.align 2, 0
_02237DC8: .4byte 0x022456B4
_02237DCC: .4byte 0x0224F574
	arm_func_end ov13_02237D78

	arm_func_start ov13_02237DD0
ov13_02237DD0: @ 0x02237DD0
	push {r3, lr}
	ldr r0, _02237E54 @ =0x0224F57C
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
	ldr r0, _02237E58 @ =ov13_02237F9C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02237E54: .4byte 0x0224F57C
_02237E58: .4byte ov13_02237F9C
	arm_func_end ov13_02237DD0

	arm_func_start ov13_02237E5C
ov13_02237E5C: @ 0x02237E5C
	push {r3, lr}
	ldr r0, _02237EE4 @ =0x022466C0
	ldr r1, _02237EE8 @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _02237EEC @ =0x022466D8
	ldr r1, _02237EF0 @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _02237EF4 @ =0x022466F0
	ldr r1, _02237EF8 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _02237EFC @ =0x04001008
	ldr r1, _02237F00 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_02237EE4: .4byte 0x022466C0
_02237EE8: .4byte 0x020D03A4
_02237EEC: .4byte 0x022466D8
_02237EF0: .4byte FUN_020CFC6C
_02237EF4: .4byte 0x022466F0
_02237EF8: .4byte FUN_020D00A4
_02237EFC: .4byte 0x04001008
_02237F00: .4byte 0x0400000A
	arm_func_end ov13_02237E5C

	arm_func_start ov13_02237F04
ov13_02237F04: @ 0x02237F04
	push {r4, lr}
	sub sp, sp, #0x10
	bl ov13_02239FF0
	mov r4, r0
	ldr r0, _02237F94 @ =0x02245778
	add r1, sp, #4
	mov r2, #0xc
	bl FUN_020D4808
	add r1, sp, #0
	mov r0, #0
	bl ov13_0222B948
	ldr r0, [sp]
	cmp r0, #2
	moveq r0, #4
	strbeq r0, [sp, #0xe]
	ldrbne r0, [r4, #0xf4]
	addne r0, r0, #1
	strbne r0, [sp, #0xe]
	add r0, sp, #4
	bl FUN_021FA75C
	cmp r0, #0
	bne _02237F60
	bl FUN_020D3F48
_02237F60:
	ldr r0, [sp]
	cmp r0, #0
	bne _02237F78
	ldrb r0, [r4, #0xf4]
	mov r1, r4
	bl FUN_021FAC20
_02237F78:
	mov r0, #0
	ldr r1, _02237F98 @ =ov13_0223813C
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	add sp, sp, #0x10
	pop {r4, pc}
	.align 2, 0
_02237F94: .4byte 0x02245778
_02237F98: .4byte ov13_0223813C
	arm_func_end ov13_02237F04

	arm_func_start ov13_02237F9C
ov13_02237F9C: @ 0x02237F9C
	push {r3, lr}
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
	ldr r0, _02238004 @ =ov13_02238008
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238004: .4byte ov13_02238008
	arm_func_end ov13_02237F9C

	arm_func_start ov13_02238008
ov13_02238008: @ 0x02238008
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02238038 @ =ov13_0223803C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238038: .4byte ov13_0223803C
	arm_func_end ov13_02238008

	arm_func_start ov13_0223803C
ov13_0223803C: @ 0x0223803C
	push {r3, lr}
	bl ov13_02238050
	bl ov13_02238054
	bl ov13_02238058
	pop {r3, pc}
	arm_func_end ov13_0223803C

	arm_func_start ov13_02238050
ov13_02238050: @ 0x02238050
	bx lr
	arm_func_end ov13_02238050

	arm_func_start ov13_02238054
ov13_02238054: @ 0x02238054
	bx lr
	arm_func_end ov13_02238054

	arm_func_start ov13_02238058
ov13_02238058: @ 0x02238058
	bx lr
	arm_func_end ov13_02238058

	arm_func_start ov13_0223805C
ov13_0223805C: @ 0x0223805C
	push {r3, lr}
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02238080 @ =ov13_02238084
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238080: .4byte ov13_02238084
	arm_func_end ov13_0223805C

	arm_func_start ov13_02238084
ov13_02238084: @ 0x02238084
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _022380A4 @ =ov13_022380A8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022380A4: .4byte ov13_022380A8
	arm_func_end ov13_02238084

	arm_func_start ov13_022380A8
ov13_022380A8: @ 0x022380A8
	push {r4, lr}
	bl ov13_0223A7F4
	mov r4, r0
	bl FUN_021FAAC8
	cmp r0, #0
	popeq {r4, pc}
	bl FUN_0209EFEC
	add r1, r4, #0xf0
	mov r2, #0xe
	bl FUN_020D4A50
	bl FUN_0209EFEC
	add r1, r4, #0x1f0
	mov r2, #0xe
	bl FUN_020D4A50
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EFC
	ldr r0, _02238130 @ =0x0224F57C
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	mov r0, #0
	bne _02238120
	bl ov13_0222B8F8
	ldr r0, _02238134 @ =ov13_022327E0
	bl ov13_0222B8E8
	pop {r4, pc}
_02238120:
	bl ov13_0222B8F8
	ldr r0, _02238138 @ =ov13_022381CC
	bl ov13_0222B8E8
	pop {r4, pc}
	.align 2, 0
_02238130: .4byte 0x0224F57C
_02238134: .4byte ov13_022327E0
_02238138: .4byte ov13_022381CC
	arm_func_end ov13_022380A8

	arm_func_start ov13_0223813C
ov13_0223813C: @ 0x0223813C
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_021FA904
	movs r4, r0
	popeq {r3, r4, r5, pc}
	bl ov13_02227F68
	bl ov13_0223AC20
	cmp r4, #0
	ble _02238178
	ldr r1, _022381A0 @ =0x0224F57C
	mov r2, #1
	mov r0, #0x11
	strb r2, [r1]
	bl ov13_0223ABB8
	b _02238188
_02238178:
	bl FUN_021FA9D4
	bl ov13_02232DF4
	mov r0, #0x12
	bl ov13_0223ABB8
_02238188:
	ldr r0, _022381A4 @ =ov13_0223805C
	bl ov13_0222B8E8
	mov r1, r5
	mov r0, #0
	bl ov13_022425D0
	pop {r3, r4, r5, pc}
	.align 2, 0
_022381A0: .4byte 0x0224F57C
_022381A4: .4byte ov13_0223805C
	arm_func_end ov13_0223813C

	arm_func_start ov13_022381A8
ov13_022381A8: @ 0x022381A8
	ldr ip, _022381B8 @ =ov13_0224128C
	mov r0, r1
	mov r1, #0x20
	bx ip
	.align 2, 0
_022381B8: .4byte ov13_0224128C
	arm_func_end ov13_022381A8

	arm_func_start ov13_022381BC
ov13_022381BC: @ 0x022381BC
	ldr ip, _022381C8 @ =ov13_022412F4
	mov r0, r1
	bx ip
	.align 2, 0
_022381C8: .4byte ov13_022412F4
	arm_func_end ov13_022381BC

	arm_func_start ov13_022381CC
ov13_022381CC: @ 0x022381CC
	push {r3, lr}
	ldr r0, _022381F4 @ =0x0224F580
	mov r1, #0
	strb r1, [r0]
	bl ov13_022381FC
	mov r0, #0x2d
	bl ov13_022279EC
	ldr r0, _022381F8 @ =ov13_02238268
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022381F4: .4byte 0x0224F580
_022381F8: .4byte ov13_02238268
	arm_func_end ov13_022381CC

	arm_func_start ov13_022381FC
ov13_022381FC: @ 0x022381FC
	push {r3, lr}
	ldr r0, _02238258 @ =0x02246704
	ldr r1, _0223825C @ =FUN_020D00A4
	bl ov13_02227924
	ldr r2, _02238260 @ =0x04001008
	ldr r1, _02238264 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_02238258: .4byte 0x02246704
_0223825C: .4byte FUN_020D00A4
_02238260: .4byte 0x04001008
_02238264: .4byte 0x0400000A
	arm_func_end ov13_022381FC

	arm_func_start ov13_02238268
ov13_02238268: @ 0x02238268
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02238298 @ =ov13_0223829C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238298: .4byte ov13_0223829C
	arm_func_end ov13_02238268

	arm_func_start ov13_0223829C
ov13_0223829C: @ 0x0223829C
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _022382BC @ =ov13_022382C0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022382BC: .4byte ov13_022382C0
	arm_func_end ov13_0223829C

	arm_func_start ov13_022382C0
ov13_022382C0: @ 0x022382C0
	push {r3, lr}
	bl ov13_022383D0
	bl ov13_022382D0
	pop {r3, pc}
	arm_func_end ov13_022382C0

	arm_func_start ov13_022382D0
ov13_022382D0: @ 0x022382D0
	bx lr
	arm_func_end ov13_022382D0

	arm_func_start ov13_022382D4
ov13_022382D4: @ 0x022382D4
	push {r3, lr}
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
	ldr r0, _02238328 @ =ov13_0223832C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238328: .4byte ov13_0223832C
	arm_func_end ov13_022382D4

	arm_func_start ov13_0223832C
ov13_0223832C: @ 0x0223832C
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0223B6C8
	cmp r0, #0
	popeq {r3, pc}
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
	ldr r0, _022383C8 @ =ov13_02232E04
	bl ov13_0222B8E8
	pop {r3, pc}
_022383BC:
	ldr r0, _022383CC @ =ov13_0222C44C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022383C8: .4byte ov13_02232E04
_022383CC: .4byte ov13_0222C44C
	arm_func_end ov13_0223832C

	arm_func_start ov13_022383D0
ov13_022383D0: @ 0x022383D0
	push {r3, lr}
	ldr r0, _02238434 @ =0x0224F580
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0xb4
	poplo {r3, pc}
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
	ldr r0, _02238438 @ =ov13_0222C10C
	bl ov13_0222B8E8
	pop {r3, pc}
_02238428:
	ldr r0, _0223843C @ =ov13_022382D4
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238434: .4byte 0x0224F580
_02238438: .4byte ov13_0222C10C
_0223843C: .4byte ov13_022382D4
	arm_func_end ov13_022383D0

	arm_func_start ov13_02238440
ov13_02238440: @ 0x02238440
	push {r3, lr}
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
	ldr r0, _02238494 @ =ov13_02238504
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238494: .4byte ov13_02238504
	arm_func_end ov13_02238440

	arm_func_start ov13_02238498
ov13_02238498: @ 0x02238498
	push {r3, lr}
	ldr r0, _022384F4 @ =0x02246718
	ldr r1, _022384F8 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r2, _022384FC @ =0x04001008
	ldr r1, _02238500 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_022384F4: .4byte 0x02246718
_022384F8: .4byte FUN_020D00A4
_022384FC: .4byte 0x04001008
_02238500: .4byte 0x0400000A
	arm_func_end ov13_02238498

	arm_func_start ov13_02238504
ov13_02238504: @ 0x02238504
	push {r3, lr}
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
	ldr r0, _02238554 @ =ov13_02238558
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238554: .4byte ov13_02238558
	arm_func_end ov13_02238504

	arm_func_start ov13_02238558
ov13_02238558: @ 0x02238558
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _022385D8 @ =0x02245784
	add r3, sp, #8
	ldm r0, {r0, r1, r2}
	stm r3, {r0, r1, r2}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	addne sp, sp, #0x14
	ldmne sp!, {pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	addne sp, sp, #0x14
	ldmne sp!, {pc}
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
	ldr r0, _022385DC @ =ov13_022385E0
	bl ov13_0222B8E8
	add sp, sp, #0x14
	ldm sp!, {pc}
	.align 2, 0
_022385D8: .4byte 0x02245784
_022385DC: .4byte ov13_022385E0
	arm_func_end ov13_02238558

	arm_func_start ov13_022385E0
ov13_022385E0: @ 0x022385E0
	push {r3, lr}
	bl ov13_0223861C
	bl ov13_02238620
	bl ov13_0223C1DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _02238618 @ =ov13_02238624
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238618: .4byte ov13_02238624
	arm_func_end ov13_022385E0

	arm_func_start ov13_0223861C
ov13_0223861C: @ 0x0223861C
	bx lr
	arm_func_end ov13_0223861C

	arm_func_start ov13_02238620
ov13_02238620: @ 0x02238620
	bx lr
	arm_func_end ov13_02238620

	arm_func_start ov13_02238624
ov13_02238624: @ 0x02238624
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov13_022403B8
	ldr r0, _02238654 @ =ov13_02238658
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238654: .4byte ov13_02238658
	arm_func_end ov13_02238624

	arm_func_start ov13_02238658
ov13_02238658: @ 0x02238658
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	mov r1, #0x14
	bl ov13_02240EFC
	mov r0, #0
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02238690 @ =ov13_02237DD0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238690: .4byte ov13_02237DD0
	arm_func_end ov13_02238658

	arm_func_start ov13_02238694
ov13_02238694: @ 0x02238694
	push {r3, lr}
	ldr r0, _022386CC @ =0x0224F584
	mov r1, #0
	strb r1, [r0]
	bl ov13_022386D4
	mov r0, #8
	bl ov13_02227DE4
	mov r0, #0x29
	bl ov13_022279EC
	mov r0, #0x10
	bl ov13_0223ABB8
	ldr r0, _022386D0 @ =ov13_02238754
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022386CC: .4byte 0x0224F584
_022386D0: .4byte ov13_02238754
	arm_func_end ov13_02238694

	arm_func_start ov13_022386D4
ov13_022386D4: @ 0x022386D4
	push {r3, lr}
	ldr r0, _02238744 @ =0x0224672C
	ldr r1, _02238748 @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _0223874C @ =0x04001008
	ldr r1, _02238750 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_02238744: .4byte 0x0224672C
_02238748: .4byte FUN_020D00A4
_0223874C: .4byte 0x04001008
_02238750: .4byte 0x0400000A
	arm_func_end ov13_022386D4

	arm_func_start ov13_02238754
ov13_02238754: @ 0x02238754
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02238784 @ =ov13_02238788
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238784: .4byte ov13_02238788
	arm_func_end ov13_02238754

	arm_func_start ov13_02238788
ov13_02238788: @ 0x02238788
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _022387A8 @ =ov13_022387AC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022387A8: .4byte ov13_022387AC
	arm_func_end ov13_02238788

	arm_func_start ov13_022387AC
ov13_022387AC: @ 0x022387AC
	push {r3, lr}
	bl ov13_0223886C
	bl ov13_022387BC
	pop {r3, pc}
	arm_func_end ov13_022387AC

	arm_func_start ov13_022387BC
ov13_022387BC: @ 0x022387BC
	bx lr
	arm_func_end ov13_022387BC

	arm_func_start ov13_022387C0
ov13_022387C0: @ 0x022387C0
	push {r3, lr}
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
	ldr r0, _022387F8 @ =ov13_022387FC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022387F8: .4byte ov13_022387FC
	arm_func_end ov13_022387C0

	arm_func_start ov13_022387FC
ov13_022387FC: @ 0x022387FC
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
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
	ldr r0, _02238868 @ =ov13_02238440
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238868: .4byte ov13_02238440
	arm_func_end ov13_022387FC

	arm_func_start ov13_0223886C
ov13_0223886C: @ 0x0223886C
	push {r3, lr}
	ldr r0, _02238898 @ =0x0224F584
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0x78
	poplo {r3, pc}
	ldr r0, _0223889C @ =ov13_022387C0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238898: .4byte 0x0224F584
_0223889C: .4byte ov13_022387C0
	arm_func_end ov13_0223886C

	arm_func_start ov13_022388A0
ov13_022388A0: @ 0x022388A0
	push {r3, lr}
	ldr r0, _022388E8 @ =0x0224F588
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
	ldr r0, _022388EC @ =ov13_02238998
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022388E8: .4byte 0x0224F588
_022388EC: .4byte ov13_02238998
	arm_func_end ov13_022388A0

	arm_func_start ov13_022388F0
ov13_022388F0: @ 0x022388F0
	push {r3, lr}
	ldr r0, _02238978 @ =0x02246740
	ldr r1, _0223897C @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _02238980 @ =0x02246758
	ldr r1, _02238984 @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _02238988 @ =0x02246770
	ldr r1, _0223898C @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _02238990 @ =0x04001008
	ldr r1, _02238994 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_02238978: .4byte 0x02246740
_0223897C: .4byte 0x020D03A4
_02238980: .4byte 0x02246758
_02238984: .4byte FUN_020CFC6C
_02238988: .4byte 0x02246770
_0223898C: .4byte FUN_020D00A4
_02238990: .4byte 0x04001008
_02238994: .4byte 0x0400000A
	arm_func_end ov13_022388F0

	arm_func_start ov13_02238998
ov13_02238998: @ 0x02238998
	push {r3, lr}
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
	ldr r0, _022389E8 @ =ov13_022389EC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022389E8: .4byte ov13_022389EC
	arm_func_end ov13_02238998

	arm_func_start ov13_022389EC
ov13_022389EC: @ 0x022389EC
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_022279B4
	ldr r0, _02238A24 @ =ov13_02238A28
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238A24: .4byte ov13_02238A28
	arm_func_end ov13_022389EC

	arm_func_start ov13_02238A28
ov13_02238A28: @ 0x02238A28
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _02238A4C @ =ov13_02238A50
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238A4C: .4byte ov13_02238A50
	arm_func_end ov13_02238A28

	arm_func_start ov13_02238A50
ov13_02238A50: @ 0x02238A50
	push {r3, lr}
	bl ov13_02238A64
	bl ov13_02238A9C
	bl ov13_02238AA0
	pop {r3, pc}
	arm_func_end ov13_02238A50

	arm_func_start ov13_02238A64
ov13_02238A64: @ 0x02238A64
	push {r3, lr}
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
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_02238A64

	arm_func_start ov13_02238A9C
ov13_02238A9C: @ 0x02238A9C
	bx lr
	arm_func_end ov13_02238A9C

	arm_func_start ov13_02238AA0
ov13_02238AA0: @ 0x02238AA0
	push {r3, lr}
	bl ov13_02227258
	cmp r0, #0
	beq _02238ABC
	cmp r0, #1
	beq _02238AC8
	pop {r3, pc}
_02238ABC:
	mov r0, #7
	bl ov13_0223ABB8
	b _02238ADC
_02238AC8:
	mov r0, #6
	bl ov13_0223ABB8
	ldr r0, _02238AE8 @ =0x0224F588
	mov r1, #1
	strb r1, [r0]
_02238ADC:
	ldr r0, _02238AEC @ =ov13_02238AF0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238AE8: .4byte 0x0224F588
_02238AEC: .4byte ov13_02238AF0
	arm_func_end ov13_02238AA0

	arm_func_start ov13_02238AF0
ov13_02238AF0: @ 0x02238AF0
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02238B0C @ =ov13_02238B10
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238B0C: .4byte ov13_02238B10
	arm_func_end ov13_02238AF0

	arm_func_start ov13_02238B10
ov13_02238B10: @ 0x02238B10
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02227228
	ldr r0, _02238B6C @ =0x0224F588
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
	ldr r0, _02238B70 @ =ov13_02238B74
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238B6C: .4byte 0x0224F588
_02238B70: .4byte ov13_02238B74
	arm_func_end ov13_02238B10

	arm_func_start ov13_02238B74
ov13_02238B74: @ 0x02238B74
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02238C20 @ =0x0224F588
	ldrb r0, [r0]
	cmp r0, #0
	bne _02238BA8
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
_02238BA8:
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _02238C20 @ =0x0224F588
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
	ldr r0, _02238C20 @ =0x0224F588
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	mov r0, #2
	bne _02238C10
	bl ov13_0222B8F8
	ldr r0, _02238C24 @ =ov13_022368D8
	bl ov13_0222B8E8
	pop {r3, pc}
_02238C10:
	bl ov13_0222B8F8
	ldr r0, _02238C28 @ =ov13_02238C4C
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238C20: .4byte 0x0224F588
_02238C24: .4byte ov13_022368D8
_02238C28: .4byte ov13_02238C4C
	arm_func_end ov13_02238B74

	arm_func_start ov13_02238C2C
ov13_02238C2C: @ 0x02238C2C
	ldr r0, _02238C48 @ =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02238C48: .4byte 0x027FFFA8
	arm_func_end ov13_02238C2C

	arm_func_start ov13_02238C4C
ov13_02238C4C: @ 0x02238C4C
	stmdb sp!, {lr}
	sub sp, sp, #0x6c
	ldr r0, _02238CD4 @ =0x0224F58C
	mov r1, #0
	strb r1, [r0]
	bl ov13_02238CE0
	mov r0, #8
	bl ov13_02227DE4
	mov r0, #2
	bl ov13_02227964
	add r0, sp, #0x16
	bl FUN_020D3C5C
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x16
	bl FUN_020D4790
	ldrh r2, [sp, #0x30]
	add r0, sp, #0x1a
	add r1, sp, #0
	lsl r2, r2, #1
	bl FUN_020D47B8
	add r0, sp, #0
	mov r1, #0x28
	bl ov13_02227A60
	mov r0, #0
	bl ov13_02226F58
	ldr r0, _02238CD8 @ =ov13_0223902C
	bl ov13_0223B788
	mov r0, #0xb
	bl ov13_0223ABB8
	ldr r0, _02238CDC @ =ov13_02238D88
	bl ov13_0222B8E8
	add sp, sp, #0x6c
	ldm sp!, {pc}
	.align 2, 0
_02238CD4: .4byte 0x0224F58C
_02238CD8: .4byte ov13_0223902C
_02238CDC: .4byte ov13_02238D88
	arm_func_end ov13_02238C4C

	arm_func_start ov13_02238CE0
ov13_02238CE0: @ 0x02238CE0
	push {r3, lr}
	ldr r0, _02238D68 @ =0x02246784
	ldr r1, _02238D6C @ =0x020D03A4
	bl ov13_02227924
	ldr r0, _02238D70 @ =0x0224679C
	ldr r1, _02238D74 @ =FUN_020CFC6C
	bl ov13_02227924
	ldr r0, _02238D78 @ =0x022467B4
	ldr r1, _02238D7C @ =FUN_020D00A4
	bl ov13_02227924
	ldr r3, _02238D80 @ =0x04001008
	ldr r1, _02238D84 @ =0x0400000A
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
	pop {r3, pc}
	.align 2, 0
_02238D68: .4byte 0x02246784
_02238D6C: .4byte 0x020D03A4
_02238D70: .4byte 0x0224679C
_02238D74: .4byte FUN_020CFC6C
_02238D78: .4byte 0x022467B4
_02238D7C: .4byte FUN_020D00A4
_02238D80: .4byte 0x04001008
_02238D84: .4byte 0x0400000A
	arm_func_end ov13_02238CE0

	arm_func_start ov13_02238D88
ov13_02238D88: @ 0x02238D88
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov13_022403B8
	mov r0, #0
	mov r1, #0x15
	bl ov13_02240EA8
	ldr r0, _02238DB8 @ =ov13_02238DBC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238DB8: .4byte ov13_02238DBC
	arm_func_end ov13_02238D88

	arm_func_start ov13_02238DBC
ov13_02238DBC: @ 0x02238DBC
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	mov r0, #2
	bl ov13_022279B4
	ldr r0, _02238DE4 @ =ov13_02238DE8
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238DE4: .4byte ov13_02238DE8
	arm_func_end ov13_02238DBC

	arm_func_start ov13_02238DE8
ov13_02238DE8: @ 0x02238DE8
	push {r3, lr}
	bl ov13_02227258
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov13_022272CC
	ldr r0, _02238E0C @ =ov13_02238E10
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238E0C: .4byte ov13_02238E10
	arm_func_end ov13_02238DE8

	arm_func_start ov13_02238E10
ov13_02238E10: @ 0x02238E10
	push {r3, lr}
	bl ov13_02238E24
	bl ov13_02238E5C
	bl ov13_02238E60
	pop {r3, pc}
	arm_func_end ov13_02238E10

	arm_func_start ov13_02238E24
ov13_02238E24: @ 0x02238E24
	push {r3, lr}
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _02238E44
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
_02238E44:
	bl ov13_02238C2C
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov13_0222726C
	pop {r3, pc}
	arm_func_end ov13_02238E24

	arm_func_start ov13_02238E5C
ov13_02238E5C: @ 0x02238E5C
	bx lr
	arm_func_end ov13_02238E5C

	arm_func_start ov13_02238E60
ov13_02238E60: @ 0x02238E60
	push {r3, lr}
	ldr r0, _02238EA4 @ =0x0224F58C
	ldrb r0, [r0]
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02227258
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02238EA4 @ =0x0224F58C
	mov r1, #2
	strb r1, [r0]
	bl ov13_0223AC20
	mov r0, #7
	bl ov13_0223ABB8
	ldr r0, _02238EA8 @ =ov13_02238EAC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238EA4: .4byte 0x0224F58C
_02238EA8: .4byte ov13_02238EAC
	arm_func_end ov13_02238E60

	arm_func_start ov13_02238EAC
ov13_02238EAC: @ 0x02238EAC
	push {r3, lr}
	bl ov13_022272E4
	mov r0, #8
	bl ov13_022405B8
	ldr r0, _02238EC8 @ =ov13_02238ECC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238EC8: .4byte ov13_02238ECC
	arm_func_end ov13_02238EAC

	arm_func_start ov13_02238ECC
ov13_02238ECC: @ 0x02238ECC
	push {r3, lr}
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02227228
	ldr r0, _02238F30 @ =0x0224F58C
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
	ldr r0, _02238F34 @ =ov13_02238F38
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02238F30: .4byte 0x0224F58C
_02238F34: .4byte ov13_02238F38
	arm_func_end ov13_02238ECC

	arm_func_start ov13_02238F38
ov13_02238F38: @ 0x02238F38
	push {r3, lr}
	mov r0, #0
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0223901C @ =0x0224F58C
	ldrb r0, [r0]
	cmp r0, #2
	bne _02238F6C
	mov r0, #1
	bl ov13_02240394
	cmp r0, #0
	popne {r3, pc}
_02238F6C:
	bl ov13_022272A0
	cmp r0, #0
	popeq {r3, pc}
	bl ov13_0223B940
	bl ov13_02227028
	mov r0, #0
	bl ov13_02240B04
	ldr r0, _0223901C @ =0x0224F58C
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
	ldr r0, _0223901C @ =0x0224F58C
	ldrb r0, [r0]
	cmp r0, #2
	bne _02238FE4
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02239020 @ =ov13_022368D8
	bl ov13_0222B8E8
	pop {r3, pc}
_02238FE4:
	cmp r0, #3
	bne _02239004
	mov r0, #2
	mov r1, #1
	bl ov13_0222B8F8
	ldr r0, _02239024 @ =ov13_022388A0
	bl ov13_0222B8E8
	pop {r3, pc}
_02239004:
	mov r0, #0
	mov r1, r0
	bl ov13_0222B8F8
	ldr r0, _02239028 @ =ov13_02238694
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_0223901C: .4byte 0x0224F58C
_02239020: .4byte ov13_022368D8
_02239024: .4byte ov13_022388A0
_02239028: .4byte ov13_02238694
	arm_func_end ov13_02238F38

	arm_func_start ov13_0223902C
ov13_0223902C: @ 0x0223902C
	push {r3, lr}
	ldr r1, _02239108 @ =0x0224F58C
	ldrb r2, [r1]
	cmp r2, #0
	popne {r3, pc}
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_0223904C: @ jump table
	b _0223905C @ case 0
	b _0223909C @ case 1
	b _022390B4 @ case 2
	b _022390E8 @ case 3
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
	ldr r0, _0223910C @ =ov13_02239118
	bl ov13_0222B8E8
	pop {r3, pc}
_0223909C:
	mov r0, #1
	strb r0, [r1]
	bl ov13_0223AC20
	ldr r0, _02239110 @ =ov13_02238EAC
	bl ov13_0222B8E8
	pop {r3, pc}
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
	ldr r0, _02239114 @ =ov13_02239164
	bl ov13_0222B8E8
	pop {r3, pc}
_022390E8:
	mov r0, #2
	strb r0, [r1]
	bl ov13_0223AC20
	mov r0, #9
	bl ov13_0223ABB8
	ldr r0, _02239110 @ =ov13_02238EAC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02239108: .4byte 0x0224F58C
_0223910C: .4byte ov13_02239118
_02239110: .4byte ov13_02238EAC
_02239114: .4byte ov13_02239164
	arm_func_end ov13_0223902C

	arm_func_start ov13_02239118
ov13_02239118: @ 0x02239118
	push {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov13_0223ABB8
	bl ov13_0223C198
	ldr r0, _02239140 @ =ov13_02239144
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02239140: .4byte ov13_02239144
	arm_func_end ov13_02239118

	arm_func_start ov13_02239144
ov13_02239144: @ 0x02239144
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02239160 @ =ov13_02238EAC
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02239160: .4byte ov13_02238EAC
	arm_func_end ov13_02239144

	arm_func_start ov13_02239164
ov13_02239164: @ 0x02239164
	push {r3, lr}
	bl ov13_0223C1DC
	cmp r0, #0
	beq _02239194
	cmp r0, #1
	popne {r3, pc}
	ldr r1, _022391B8 @ =0x0224F58C
	mov r2, #3
	mov r0, #6
	strb r2, [r1]
	bl ov13_0223ABB8
	b _022391A8
_02239194:
	ldr r1, _022391B8 @ =0x0224F58C
	mov r2, #1
	mov r0, #7
	strb r2, [r1]
	bl ov13_0223ABB8
_022391A8:
	bl ov13_0223C198
	ldr r0, _022391BC @ =ov13_022391C0
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_022391B8: .4byte 0x0224F58C
_022391BC: .4byte ov13_022391C0
	arm_func_end ov13_02239164

	arm_func_start ov13_022391C0
ov13_022391C0: @ 0x022391C0
	push {r3, lr}
	bl ov13_0223C1F0
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02239218 @ =0x0224F58C
	ldrb r0, [r0]
	cmp r0, #1
	bne _022391EC
	ldr r0, _0223921C @ =ov13_02238EAC
	bl ov13_0222B8E8
	pop {r3, pc}
_022391EC:
	mov r0, #0xb
	bl ov13_0223ABB8
	bl ov13_022272CC
	ldr r1, _02239218 @ =0x0224F58C
	mov r2, #0
	ldr r0, _02239220 @ =ov13_0223902C
	strb r2, [r1]
	bl ov13_0223BA24
	ldr r0, _02239224 @ =ov13_02238E10
	bl ov13_0222B8E8
	pop {r3, pc}
	.align 2, 0
_02239218: .4byte 0x0224F58C
_0223921C: .4byte ov13_02238EAC
_02239220: .4byte ov13_0223902C
_02239224: .4byte ov13_02238E10
	arm_func_end ov13_022391C0

	arm_func_start ov13_02239228
ov13_02239228: @ 0x02239228
	push {r4, lr}
	mov r4, r0
	ldr r0, _0223927C @ =0x00000608
	mov r1, #4
	bl ov13_0224128C
	mov ip, r0
	ldr r3, _02239280 @ =0x0224F590
	mov r0, r4
	add r1, ip, #4
	mov r2, #0x600
	str ip, [r3]
	bl FUN_020D48B4
	ldr r1, _02239284 @ =ov13_02239324
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _02239280 @ =0x0224F590
	ldr r1, [r1]
	str r0, [r1]
	pop {r4, pc}
	.align 2, 0
_0223927C: .4byte 0x00000608
_02239280: .4byte 0x0224F590
_02239284: .4byte ov13_02239324
	arm_func_end ov13_02239228

	arm_func_start ov13_02239288
ov13_02239288: @ 0x02239288
	push {r3, lr}
	ldr r1, _022392AC @ =0x0224F590
	mov r0, #1
	ldr r1, [r1]
	ldr r1, [r1]
	bl ov13_022425F0
	ldr r0, _022392B0 @ =0x0224F590
	bl ov13_022412B0
	pop {r3, pc}
	.align 2, 0
_022392AC: .4byte 0x0224F590
_022392B0: .4byte 0x0224F590
	arm_func_end ov13_02239288

	arm_func_start ov13_022392B4
ov13_022392B4: @ 0x022392B4
	ldr r0, _022392C8 @ =0x0224F590
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x604]
	bx lr
	.align 2, 0
_022392C8: .4byte 0x0224F590
	arm_func_end ov13_022392B4

	arm_func_start ov13_022392CC
ov13_022392CC: @ 0x022392CC
	push {r4, r5, r6, r7, r8, lr}
	ldr ip, _02239320 @ =0x0224F590
	mov r7, r3
	ldr r3, [ip]
	mov r8, r0
	add r0, r3, #4
	add r4, r0, r1, lsl #1
	mov r5, #0
	cmp r7, #0
	pople {r4, r5, r6, r7, r8, pc}
	lsl r6, r2, #1
_022392F8:
	mov r0, r8
	mov r1, r4
	mov r2, r6
	bl FUN_020D47B8
	add r5, r5, #1
	cmp r5, r7
	add r8, r8, #0x40
	add r4, r4, #0x40
	blt _022392F8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02239320: .4byte 0x0224F590
	arm_func_end ov13_022392CC

	arm_func_start ov13_02239324
ov13_02239324: @ 0x02239324
	push {r3, lr}
	ldr r0, _02239374 @ =0x0224F590
	ldr r1, [r0]
	ldrb r0, [r1, #0x604]
	cmp r0, #0
	popeq {r3, pc}
	add r0, r1, #4
	mov r1, #0x600
	bl DC_FlushRange
	ldr r0, _02239374 @ =0x0224F590
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x600
	add r0, r0, #4
	bl FUN_020D00A4
	ldr r0, _02239374 @ =0x0224F590
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x604]
	pop {r3, pc}
	.align 2, 0
_02239374: .4byte 0x0224F590
	arm_func_end ov13_02239324

	arm_func_start ov13_02239378
ov13_02239378: @ 0x02239378
	push {r3, lr}
	ldr ip, _022393AC @ =0x0224F590
	add r3, r0, r1, lsl #5
	lsl r0, r2, #5
	ldr r1, _022393B0 @ =ov13_022393B4
	str r3, [ip, #4]
	add lr, r0, #0x5000000
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	str lr, [ip, #8]
	bl ov13_02242528
	pop {r3, pc}
	.align 2, 0
_022393AC: .4byte 0x0224F590
_022393B0: .4byte ov13_022393B4
	arm_func_end ov13_02239378

	arm_func_start ov13_022393B4
ov13_022393B4: @ 0x022393B4
	push {r4, lr}
	ldr r1, _022393DC @ =0x0224F590
	mov r4, r0
	mov r2, #0x20
	ldmib r1, {r0, r1}
	bl FUN_020D47B8
	mov r1, r4
	mov r0, #1
	bl ov13_022425D0
	pop {r4, pc}
	.align 2, 0
_022393DC: .4byte 0x0224F590
	arm_func_end ov13_022393B4

	arm_func_start ov13_022393E0
ov13_022393E0: @ 0x022393E0
	ldr r2, _02239400 @ =0x0224F590
	ldr ip, _02239404 @ =ov13_02242528
	str r0, [r2, #4]
	ldr r1, _02239408 @ =ov13_0223940C
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bx ip
	.align 2, 0
_02239400: .4byte 0x0224F590
_02239404: .4byte ov13_02242528
_02239408: .4byte ov13_0223940C
	arm_func_end ov13_022393E0

	arm_func_start ov13_0223940C
ov13_0223940C: @ 0x0223940C
	push {r4, lr}
	ldr r1, _02239438 @ =0x0224F590
	mov r4, r0
	ldr r0, [r1, #4]
	mov r1, #0x5000000
	mov r2, #0x200
	bl FUN_020D47B8
	mov r1, r4
	mov r0, #1
	bl ov13_022425D0
	pop {r4, pc}
	.align 2, 0
_02239438: .4byte 0x0224F590
	arm_func_end ov13_0223940C

	arm_func_start ov13_0223943C
ov13_0223943C: @ 0x0223943C
	push {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r7, r1
	mov r0, #0x20
	mov r1, #4
	mov r5, r2
	mov r4, r3
	bl ov13_0224128C
	ldr r2, _02239508 @ =0x0224F59C
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
	ldr r1, _0223950C @ =0x02245790
	mov r0, #0
	ldrb r1, [r1, r6]
	mov r2, #1
	bl ov13_022401B0
	mov r2, r5
	ldr r5, _02239508 @ =0x0224F59C
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
	ldr r1, _02239510 @ =ov13_022395B4
	mov r2, r0
	mov r3, #0x80
	bl ov13_02242528
	mov r1, r5
	ldr r1, [r1]
	str r0, [r1, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02239508: .4byte 0x0224F59C
_0223950C: .4byte 0x02245790
_02239510: .4byte ov13_022395B4
	arm_func_end ov13_0223943C

	arm_func_start ov13_02239514
ov13_02239514: @ 0x02239514
	push {r3, lr}
	ldr r1, _02239548 @ =0x0224F59C
	mov r0, #0
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	bl ov13_022425F0
	ldr r0, _02239548 @ =0x0224F59C
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov13_0223FD60
	ldr r0, _0223954C @ =0x0224F59C
	bl ov13_022412B0
	pop {r3, pc}
	.align 2, 0
_02239548: .4byte 0x0224F59C
_0223954C: .4byte 0x0224F59C
	arm_func_end ov13_02239514

	arm_func_start ov13_02239550
ov13_02239550: @ 0x02239550
	ldr r0, _02239560 @ =0x0224F59C
	ldr r0, [r0]
	ldrb r0, [r0, #0x1a]
	bx lr
	.align 2, 0
_02239560: .4byte 0x0224F59C
	arm_func_end ov13_02239550

	arm_func_start ov13_02239564
ov13_02239564: @ 0x02239564
	ldr r0, _02239574 @ =0x0224F59C
	ldr r0, [r0]
	ldrb r0, [r0, #0x1d]
	bx lr
	.align 2, 0
_02239574: .4byte 0x0224F59C
	arm_func_end ov13_02239564

	arm_func_start ov13_02239578
ov13_02239578: @ 0x02239578
	ldr ip, _02239580 @ =ov13_02239AC4
	bx ip
	.align 2, 0
_02239580: .4byte ov13_02239AC4
	arm_func_end ov13_02239578

	arm_func_start ov13_02239584
ov13_02239584: @ 0x02239584
	ldr r0, _02239598 @ =0x0224F59C
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x1e]
	bx lr
	.align 2, 0
_02239598: .4byte 0x0224F59C
	arm_func_end ov13_02239584

	arm_func_start ov13_0223959C
ov13_0223959C: @ 0x0223959C
	ldr r0, _022395B0 @ =0x0224F59C
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x1e]
	bx lr
	.align 2, 0
_022395B0: .4byte 0x0224F59C
	arm_func_end ov13_0223959C

	arm_func_start ov13_022395B4
ov13_022395B4: @ 0x022395B4
	push {r3, lr}
	ldr r0, _02239734 @ =0x0224F59C
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x1d]
	ldr r1, [r0]
	ldrb r0, [r1, #0x1c]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_022395DC: @ jump table
	b _022395EC @ case 0
	b _0223969C @ case 1
	b _022396A4 @ case 2
	b _022396EC @ case 3
_022395EC:
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	popne {r3, pc}
	bl ov13_02239914
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_02239608: @ jump table
	pop {r3, pc} @ case 0
	b _0223961C @ case 1
	b _0223967C @ case 2
	b _02239688 @ case 3
	b _02239694 @ case 4
_0223961C:
	ldr r0, _02239734 @ =0x0224F59C
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0x16
	bl ov13_0223ABB8
	mov r0, #0
	bl ov13_0223ABDC
	ldr r0, _02239734 @ =0x0224F59C
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x1d]
	ldr r0, [r0]
	add r0, r0, #0x14
	bl ov13_022419DC
	ldr r0, _02239734 @ =0x0224F59C
	mov r1, #1
	ldr r3, [r0]
	ldrb r2, [r3, #0x1a]
	strb r2, [r3, #0x18]
	ldr r0, [r0]
	strb r1, [r0, #0x1c]
	pop {r3, pc}
_0223967C:
	mov r0, #2
	bl ov13_02239880
	pop {r3, pc}
_02239688:
	mov r0, #3
	bl ov13_02239880
	pop {r3, pc}
_02239694:
	bl ov13_022398AC
	pop {r3, pc}
_0223969C:
	bl ov13_02239738
	pop {r3, pc}
_022396A4:
	mov r0, #2
	bl ov13_022399A0
	cmp r0, #2
	beq _022396D4
	ldr r0, _02239734 @ =0x0224F59C
	mov r3, #5
	ldr r2, [r0]
	mov r1, #0
	strb r3, [r2, #0x1d]
	ldr r0, [r0]
	strb r1, [r0, #0x1c]
	pop {r3, pc}
_022396D4:
	bl ov13_02239914
	cmp r0, #2
	popne {r3, pc}
	mov r0, #2
	bl ov13_02239880
	pop {r3, pc}
_022396EC:
	mov r0, #3
	bl ov13_022399A0
	cmp r0, #3
	beq _0223971C
	ldr r0, _02239734 @ =0x0224F59C
	mov r3, #7
	ldr r2, [r0]
	mov r1, #0
	strb r3, [r2, #0x1d]
	ldr r0, [r0]
	strb r1, [r0, #0x1c]
	pop {r3, pc}
_0223971C:
	bl ov13_02239914
	cmp r0, #3
	popne {r3, pc}
	mov r0, #3
	bl ov13_02239880
	pop {r3, pc}
	.align 2, 0
_02239734: .4byte 0x0224F59C
	arm_func_end ov13_022395B4

	arm_func_start ov13_02239738
ov13_02239738: @ 0x02239738
	push {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _022397FC @ =0x02245958
	bl ov13_02241754
	cmp r0, #0
	beq _022397D4
	add r0, sp, #0
	bl ov13_022419DC
	ldr r0, _02239800 @ =0x0224F59C
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
	ldr r0, _02239804 @ =0x02245794
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
	ldr r0, _02239800 @ =0x0224F59C
	mov r1, #2
	ldr r0, [r0]
	add sp, sp, #4
	strb r1, [r0, #0x1d]
	pop {r3, r4, pc}
_022397D4:
	bl ov13_0223AC20
	ldr r0, _02239800 @ =0x0224F59C
	mov r3, #0
	ldr r2, [r0]
	mov r1, #3
	strb r3, [r2, #0x1c]
	ldr r0, [r0]
	strb r1, [r0, #0x1d]
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_022397FC: .4byte 0x02245958
_02239800: .4byte 0x0224F59C
_02239804: .4byte 0x02245794
	arm_func_end ov13_02239738

	arm_func_start ov13_02239808
ov13_02239808: @ 0x02239808
	push {r4, lr}
	ldr r1, _02239878 @ =0x0224F59C
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
	bl FUN_020CCD00
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
	bl FUN_020CCD00
	sub r1, r0, #0x100
_0223986C:
	ldr r0, _0223987C @ =0x0000FFFF
	bl ov13_0223ABFC
	pop {r4, pc}
	.align 2, 0
_02239878: .4byte 0x0224F59C
_0223987C: .4byte 0x0000FFFF
	arm_func_end ov13_02239808

	arm_func_start ov13_02239880
ov13_02239880: @ 0x02239880
	ldr r1, _022398A8 @ =0x0224F59C
	cmp r0, #2
	ldr r1, [r1]
	strb r0, [r1, #0x1c]
	ldr r0, _022398A8 @ =0x0224F59C
	moveq r1, #4
	ldr r0, [r0]
	movne r1, #6
	strb r1, [r0, #0x1d]
	bx lr
	.align 2, 0
_022398A8: .4byte 0x0224F59C
	arm_func_end ov13_02239880

	arm_func_start ov13_022398AC
ov13_022398AC: @ 0x022398AC
	push {r3, lr}
	add r0, sp, #0
	bl ov13_022419DC
	ldr r0, _0223990C @ =0x0224F59C
	ldr r2, _02239910 @ =0x02245794
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
	ldr r0, _0223990C @ =0x0224F59C
	mov r1, #3
	ldr r0, [r0]
	strb r1, [r0, #0x1d]
	pop {r3, pc}
	.align 2, 0
_0223990C: .4byte 0x0224F59C
_02239910: .4byte 0x02245794
	arm_func_end ov13_022398AC

	arm_func_start ov13_02239914
ov13_02239914: @ 0x02239914
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	add r1, sp, #0
	mov r0, #1
	bl ov13_022399EC
	add r0, sp, #0
	bl ov13_02241864
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	popne {r3, r4, r5, pc}
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
	popne {r3, r4, r5, pc}
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
	pop {r3, r4, r5, pc}
	arm_func_end ov13_02239914

	arm_func_start ov13_022399A0
ov13_022399A0: @ 0x022399A0
	push {r3, r4, r5, lr}
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
	popne {r3, r4, r5, pc}
	add r5, r5, #1
	cmp r5, #3
	ble _022399B0
	mov r0, #0
	add sp, sp, #8
	pop {r3, r4, r5, pc}
	arm_func_end ov13_022399A0

	arm_func_start ov13_022399EC
ov13_022399EC: @ 0x022399EC
	ldr r2, _02239ABC @ =0x0224F59C
	cmp r0, #4
	ldr r3, [r2]
	ldrh r3, [r3, #0x10]
	strh r3, [r1]
	add r3, r3, #0xc
	strh r3, [r1, #4]
	addls pc, pc, r0, lsl #2
	bx lr
_02239A10: @ jump table
	bx lr @ case 0
	b _02239A24 @ case 1
	b _02239A58 @ case 2
	b _02239A78 @ case 3
	b _02239A9C @ case 4
_02239A24:
	ldr r3, [r2]
	ldr r0, _02239AC0 @ =0x02245794
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
	.align 2, 0
_02239ABC: .4byte 0x0224F59C
_02239AC0: .4byte 0x02245794
	arm_func_end ov13_022399EC

	arm_func_start ov13_02239AC4
ov13_02239AC4: @ 0x02239AC4
	push {r4, lr}
	ldr r1, _02239AFC @ =0x0224F59C
	mov r4, r0
	ldr r0, [r1]
	mvn r1, #0
	ldrh r3, [r0, #0x12]
	ldrh r2, [r0, #0x10]
	ldr r0, [r0]
	add r3, r4, r3
	bl ov13_0223FF18
	ldr r0, _02239AFC @ =0x0224F59C
	ldr r0, [r0]
	strb r4, [r0, #0x1a]
	pop {r4, pc}
	.align 2, 0
_02239AFC: .4byte 0x0224F59C
	arm_func_end ov13_02239AC4

	arm_func_start ov13_02239B00
ov13_02239B00: @ 0x02239B00
	push {r3, lr}
	ldr r0, _02239B2C @ =0x0224F5A0
	ldr r0, [r0]
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02239B30 @ =0x00001E60
	mov r1, #0x20
	bl ov13_0224128C
	ldr r1, _02239B2C @ =0x0224F5A0
	str r0, [r1]
	pop {r3, pc}
	.align 2, 0
_02239B2C: .4byte 0x0224F5A0
_02239B30: .4byte 0x00001E60
	arm_func_end ov13_02239B00

	arm_func_start ov13_02239B34
ov13_02239B34: @ 0x02239B34
	push {r3, lr}
	ldr r0, _02239B60 @ =0x0224F5A0
	ldr r0, [r0]
	cmp r0, #0
	popeq {r3, pc}
_02239B48:
	bl FUN_020DEF24
	cmp r0, #0x8000
	bne _02239B48
	ldr r0, _02239B64 @ =0x0224F5A0
	bl ov13_022412B0
	pop {r3, pc}
	.align 2, 0
_02239B60: .4byte 0x0224F5A0
_02239B64: .4byte 0x0224F5A0
	arm_func_end ov13_02239B34

	arm_func_start ov13_02239B68
ov13_02239B68: @ 0x02239B68
	push {r3, r4, r5, lr}
	ldr r1, _02239C28 @ =0x0224F5A0
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x348
	add r1, r1, #0x1300
	bl FUN_020D4790
	ldr r0, _02239C28 @ =0x0224F5A0
	ldr r1, _02239C2C @ =ov13_02239D60
	ldr r0, [r0]
	mov r2, #3
	bl FUN_020DF3F8
	cmp r0, #2
	movne r0, #0
	popne {r3, r4, r5, pc}
	ldr r4, _02239C28 @ =0x0224F5A0
_02239BA8:
	ldr r0, [r4]
	add r0, r0, #0x28c
	add r0, r0, #0x1400
	bl FUN_020DECC4
	ldr ip, [r4]
	add r0, ip, #0x1600
	ldrh r0, [r0, #0x8c]
	cmp r0, #2
	bne _02239BA8
	add r0, ip, #0x248
	ldr r5, _02239C30 @ =0x022457A4
	add lr, r0, #0x1400
	mov r4, #4
_02239BDC:
	ldm r5!, {r0, r1, r2, r3}
	stm lr!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _02239BDC
	ldr r0, [r5]
	add r1, ip, #0xf00
	str r0, [lr]
	add r0, ip, #0x1000
	str r1, [r0, #0x648]
	bl FUN_020DF064
	ldr r1, _02239C28 @ =0x0224F5A0
	ldr r1, [r1]
	add r1, r1, #0x1600
	strh r0, [r1, #0x50]
	bl ov13_02239C34
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02239C28: .4byte 0x0224F5A0
_02239C2C: .4byte ov13_02239D60
_02239C30: .4byte 0x022457A4
	arm_func_end ov13_02239B68

	arm_func_start ov13_02239C34
ov13_02239C34: @ 0x02239C34
	push {r3, lr}
	ldr r1, _02239C60 @ =0x0224F5A0
	ldr r0, _02239C64 @ =ov13_02239D60
	ldr r1, [r1]
	add r1, r1, #0x248
	add r1, r1, #0x1400
	bl FUN_020DF7BC
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	pop {r3, pc}
	.align 2, 0
_02239C60: .4byte 0x0224F5A0
_02239C64: .4byte ov13_02239D60
	arm_func_end ov13_02239C34

	arm_func_start ov13_02239C68
ov13_02239C68: @ 0x02239C68
	push {r4, lr}
	ldr r1, _02239CFC @ =0x0224F5A0
	mov r2, #1
	ldr r0, [r1]
	add r0, r0, #0x1000
	strb r2, [r0, #0xe5c]
	ldr r0, [r1]
	add r0, r0, #0x28c
	add r0, r0, #0x1400
	bl FUN_020DECC4
	ldr r0, _02239CFC @ =0x0224F5A0
	ldr r0, [r0]
	add r0, r0, #0x1600
	ldrh r0, [r0, #0x8c]
	cmp r0, #2
	beq _02239CE4
	ldr r0, _02239D00 @ =ov13_02239D60
	bl FUN_020DF480
	cmp r0, #2
	movne r0, #0
	popne {r4, pc}
	ldr r4, _02239CFC @ =0x0224F5A0
_02239CC0:
	ldr r0, [r4]
	add r0, r0, #0x28c
	add r0, r0, #0x1400
	bl FUN_020DECC4
	ldr r0, [r4]
	add r0, r0, #0x1600
	ldrh r0, [r0, #0x8c]
	cmp r0, #2
	bne _02239CC0
_02239CE4:
	ldr r0, _02239D00 @ =ov13_02239D60
	bl FUN_020DF4B8
	cmp r0, #2
	movne r0, #0
	moveq r0, #1
	pop {r4, pc}
	.align 2, 0
_02239CFC: .4byte 0x0224F5A0
_02239D00: .4byte ov13_02239D60
	arm_func_end ov13_02239C68

	arm_func_start ov13_02239D04
ov13_02239D04: @ 0x02239D04
	push {r4, r5, r6, r7, r8, lr}
	ldr r1, _02239D58 @ =0x0224F5A0
	mov r6, #0
	ldr r1, [r1]
	ldr r5, _02239D5C @ =0x0224579C
	add r8, r1, #0x1300
	mov r7, r6
	str r8, [r0]
	mov r4, #6
_02239D28:
	mov r1, r5
	mov r2, r4
	add r0, r8, #0x20
	bl FUN_020E5BB0
	cmp r0, #0
	add r7, r7, #1
	addne r6, r6, #1
	cmp r7, #0x14
	add r8, r8, #0x2a
	blt _02239D28
	mov r0, r6
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02239D58: .4byte 0x0224F5A0
_02239D5C: .4byte 0x0224579C
	arm_func_end ov13_02239D04

	arm_func_start ov13_02239D60
ov13_02239D60: @ 0x02239D60
	push {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	popne {r3, pc}
	ldr r1, _02239DC0 @ =0x0224F5A0
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldrb r1, [r1, #0xe5c]
	cmp r1, #0
	ldrheq r1, [r0]
	cmpeq r1, #0x26
	popne {r3, pc}
	ldrh r1, [r0, #8]
	cmp r1, #4
	beq _02239DB0
	cmp r1, #5
	bne _02239DB8
	bl ov13_02239DC4
	bl ov13_02239C34
	pop {r3, pc}
_02239DB0:
	bl ov13_02239C34
	pop {r3, pc}
_02239DB8:
	bl FUN_020D3F48
	pop {r3, pc}
	.align 2, 0
_02239DC0: .4byte 0x0224F5A0
	arm_func_end ov13_02239D60

	arm_func_start ov13_02239DC4
ov13_02239DC4: @ 0x02239DC4
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x88
	ldr r1, _02239F8C @ =0x0224F5A0
	mov fp, r0
	ldr r2, [r1]
	mov r1, #0x400
	add r0, r2, #0xf00
	add r2, r2, #0x1300
	str r2, [sp]
	bl FUN_020D285C
	ldrh r0, [fp, #0xe]
	mov sl, #0
	cmp r0, #0
	addle sp, sp, #0x88
	pople {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
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
	bl FUN_020E5BB0
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
	ldr r7, _02239F90 @ =0x0224579C
	mov r5, #0
	mov r6, #6
_02239E6C:
	mov r1, r7
	mov r2, r6
	add r0, r8, #0x20
	bl FUN_020E5BB0
	cmp r0, #0
	beq _02239E94
	add r5, r5, #1
	cmp r5, #0x14
	add r8, r8, #0x2a
	blt _02239E6C
_02239E94:
	cmp r5, #0x14
	addeq sp, sp, #0x88
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02239EA0:
	ldr r0, [sp]
	mov r1, #0x2a
	mla sb, r5, r1, r0
	add r0, r4, #4
	add r1, sb, #0x20
	mov r2, #6
	bl FUN_020D4A50
	mov r1, sb
	add r0, r4, #0xc
	mov r2, #0x20
	bl FUN_020D4A50
	add r0, fp, sl, lsl #1
	ldrh r0, [r0, #0x50]
	strh r0, [sb, #0x26]
	ldrh r0, [r4, #0x2c]
	tst r0, #0x10
	moveq r0, #0
	strbeq r0, [sb, #0x28]
	beq _02239F74
	mov r2, #1
	add r0, sp, #4
	mov r1, r4
	strb r2, [sb, #0x28]
	bl FUN_020DF0F8
	ldrb r8, [sp, #4]
	mov r7, #0
	cmp r8, #0
	ble _02239F74
	ldr r5, _02239F94 @ =0x02245798
	mov r4, #4
	add r6, sp, #4
_02239F1C:
	add r1, r6, r7, lsl #3
	ldrb r0, [r1, #4]
	cmp r0, #0x30
	moveq r0, #2
	strbeq r0, [sb, #0x28]
	beq _02239F74
	cmp r0, #0xdd
	bne _02239F68
	ldrb r0, [r1, #5]
	cmp r0, #4
	blo _02239F68
	ldr r0, [r1, #8]
	mov r1, r5
	mov r2, r4
	bl FUN_020E5BB0
	cmp r0, #0
	moveq r0, #2
	strbeq r0, [sb, #0x28]
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
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02239F8C: .4byte 0x0224F5A0
_02239F90: .4byte 0x0224579C
_02239F94: .4byte 0x02245798
	arm_func_end ov13_02239DC4

	arm_func_start ov13_02239F98
ov13_02239F98: @ 0x02239F98
	push {r3, lr}
	ldr r0, _02239FD0 @ =0x000006F8
	mov r1, #0x20
	bl ov13_0224128C
	ldr r1, _02239FD4 @ =0x0224F5A4
	add r2, r0, #0xf8
	str r0, [r1]
	ldr r1, _02239FD8 @ =0x0000A001
	add r0, r2, #0x400
	bl FUN_020E389C
	ldr r0, _02239FD4 @ =0x0224F5A4
	ldr r0, [r0]
	bl FUN_0209E628
	pop {r3, pc}
	.align 2, 0
_02239FD0: .4byte 0x000006F8
_02239FD4: .4byte 0x0224F5A4
_02239FD8: .4byte 0x0000A001
	arm_func_end ov13_02239F98

	arm_func_start ov13_02239FDC
ov13_02239FDC: @ 0x02239FDC
	ldr ip, _02239FE8 @ =ov13_022412B0
	ldr r0, _02239FEC @ =0x0224F5A4
	bx ip
	.align 2, 0
_02239FE8: .4byte ov13_022412B0
_02239FEC: .4byte 0x0224F5A4
	arm_func_end ov13_02239FDC

	arm_func_start ov13_02239FF0
ov13_02239FF0: @ 0x02239FF0
	ldr r0, _0223A000 @ =0x0224F5A4
	ldr r0, [r0]
	add r0, r0, #0x400
	bx lr
	.align 2, 0
_0223A000: .4byte 0x0224F5A4
	arm_func_end ov13_02239FF0

	arm_func_start ov13_0223A004
ov13_0223A004: @ 0x0223A004
	ldr r1, _0223A014 @ =0x0224F5A4
	ldr r1, [r1]
	strb r0, [r1, #0x4f5]
	bx lr
	.align 2, 0
_0223A014: .4byte 0x0224F5A4
	arm_func_end ov13_0223A004

	arm_func_start ov13_0223A018
ov13_0223A018: @ 0x0223A018
	ldr r1, _0223A028 @ =0x0224F5A4
	ldr r1, [r1]
	strb r0, [r1, #0x4f6]
	bx lr
	.align 2, 0
_0223A028: .4byte 0x0224F5A4
	arm_func_end ov13_0223A018

	arm_func_start ov13_0223A02C
ov13_0223A02C: @ 0x0223A02C
	push {r3, lr}
	ldr r1, _0223A058 @ =0x0224F5A4
	mov r2, #0x20
	ldr r1, [r1]
	add r1, r1, #0x440
	bl FUN_020D4A50
	ldr r0, _0223A058 @ =0x0224F5A4
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x4e7]
	pop {r3, pc}
	.align 2, 0
_0223A058: .4byte 0x0224F5A4
	arm_func_end ov13_0223A02C

	arm_func_start ov13_0223A05C
ov13_0223A05C: @ 0x0223A05C
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0223A1F0 @ =0x0224F5A4
	mov r6, r0
	ldr r0, [r1]
	mov r1, #0
	add r0, r0, #0x480
	mov r2, #0x10
	bl FUN_020D4994
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
	ldr r0, _0223A1F0 @ =0x0224F5A4
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
	ldr r1, _0223A1F0 @ =0x0224F5A4
	mov r0, r6
	ldr r4, [r1]
	mov r2, #0x10
	ldrb r3, [r4, #0x4e6]
	bic r3, r3, #0xfc
	orr r3, r3, #4
	strb r3, [r4, #0x4e6]
	ldr r1, [r1]
	add r1, r1, #0x480
	bl FUN_020D4A50
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
	ldr r0, _0223A1F0 @ =0x0224F5A4
	ldr r1, [r0]
	ldrb r0, [r1, #0x4e6]
	bic r0, r0, #3
	strb r0, [r1, #0x4e6]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_0223A19C:
	ldr r0, _0223A1F0 @ =0x0224F5A4
	ldr r1, [r0]
	ldrb r0, [r1, #0x4e6]
	bic r0, r0, #3
	orr r0, r0, #1
	strb r0, [r1, #0x4e6]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_0223A1B8:
	ldr r0, _0223A1F0 @ =0x0224F5A4
	ldr r1, [r0]
	ldrb r0, [r1, #0x4e6]
	bic r0, r0, #3
	orr r0, r0, #2
	strb r0, [r1, #0x4e6]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_0223A1D4:
	ldr r0, _0223A1F0 @ =0x0224F5A4
	ldr r1, [r0]
	ldrb r0, [r1, #0x4e6]
	bic r0, r0, #3
	orr r0, r0, #3
	strb r0, [r1, #0x4e6]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0223A1F0: .4byte 0x0224F5A4
	arm_func_end ov13_0223A05C

	arm_func_start ov13_0223A1F4
ov13_0223A1F4: @ 0x0223A1F4
	ldr r1, _0223A208 @ =0x0224F5A4
	ldr ip, _0223A20C @ =ov13_0223AA58
	ldr r1, [r1]
	add r1, r1, #0x4c0
	bx ip
	.align 2, 0
_0223A208: .4byte 0x0224F5A4
_0223A20C: .4byte ov13_0223AA58
	arm_func_end ov13_0223A1F4

	arm_func_start ov13_0223A210
ov13_0223A210: @ 0x0223A210
	ldr r1, _0223A224 @ =0x0224F5A4
	ldr ip, _0223A228 @ =ov13_0223AA58
	ldr r1, [r1]
	add r1, r1, #0x4f0
	bx ip
	.align 2, 0
_0223A224: .4byte 0x0224F5A4
_0223A228: .4byte ov13_0223AA58
	arm_func_end ov13_0223A210

	arm_func_start ov13_0223A22C
ov13_0223A22C: @ 0x0223A22C
	ldr r1, _0223A244 @ =0x0224F5A4
	ldr ip, _0223A248 @ =ov13_0223AA58
	ldr r1, [r1]
	add r1, r1, #0xc4
	add r1, r1, #0x400
	bx ip
	.align 2, 0
_0223A244: .4byte 0x0224F5A4
_0223A248: .4byte ov13_0223AA58
	arm_func_end ov13_0223A22C

	arm_func_start ov13_0223A24C
ov13_0223A24C: @ 0x0223A24C
	ldr r1, _0223A264 @ =0x0224F5A4
	ldr ip, _0223A268 @ =ov13_0223AA58
	ldr r1, [r1]
	add r1, r1, #0xc8
	add r1, r1, #0x400
	bx ip
	.align 2, 0
_0223A264: .4byte 0x0224F5A4
_0223A268: .4byte ov13_0223AA58
	arm_func_end ov13_0223A24C

	arm_func_start ov13_0223A26C
ov13_0223A26C: @ 0x0223A26C
	ldr r1, _0223A284 @ =0x0224F5A4
	ldr ip, _0223A288 @ =ov13_0223AA58
	ldr r1, [r1]
	add r1, r1, #0xcc
	add r1, r1, #0x400
	bx ip
	.align 2, 0
_0223A284: .4byte 0x0224F5A4
_0223A288: .4byte ov13_0223AA58
	arm_func_end ov13_0223A26C

	arm_func_start ov13_0223A28C
ov13_0223A28C: @ 0x0223A28C
	ldr r2, _0223A2A8 @ =0x0224F5A4
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _0223A2AC @ =FUN_020D4A50
	mov r2, #0x20
	add r0, r0, #0x440
	bx ip
	.align 2, 0
_0223A2A8: .4byte 0x0224F5A4
_0223A2AC: .4byte FUN_020D4A50
	arm_func_end ov13_0223A28C

	arm_func_start ov13_0223A2B0
ov13_0223A2B0: @ 0x0223A2B0
	push {r3, lr}
	sub sp, sp, #8
	ldr r2, _0223A2E8 @ =0x0224F5A4
	ldr r1, _0223A2EC @ =0x022467C8
	ldr r3, [r2]
	ldrb r2, [r3, #0x4c2]
	str r2, [sp]
	ldrb r2, [r3, #0x4c3]
	str r2, [sp, #4]
	ldrb r2, [r3, #0x4c0]
	ldrb r3, [r3, #0x4c1]
	bl FUN_020D164C
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0223A2E8: .4byte 0x0224F5A4
_0223A2EC: .4byte 0x022467C8
	arm_func_end ov13_0223A2B0

	arm_func_start ov13_0223A2F0
ov13_0223A2F0: @ 0x0223A2F0
	push {r3, lr}
	sub sp, sp, #8
	ldr r2, _0223A328 @ =0x0224F5A4
	ldr r1, _0223A32C @ =0x022467C8
	ldr r3, [r2]
	ldrb r2, [r3, #0x4f2]
	str r2, [sp]
	ldrb r2, [r3, #0x4f3]
	str r2, [sp, #4]
	ldrb r2, [r3, #0x4f0]
	ldrb r3, [r3, #0x4f1]
	bl FUN_020D164C
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0223A328: .4byte 0x0224F5A4
_0223A32C: .4byte 0x022467C8
	arm_func_end ov13_0223A2F0

	arm_func_start ov13_0223A330
ov13_0223A330: @ 0x0223A330
	push {r3, lr}
	sub sp, sp, #8
	ldr r2, _0223A36C @ =0x0224F5A4
	ldr r1, _0223A370 @ =0x022467C8
	ldr ip, [r2]
	add r3, ip, #0xc4
	ldrb r2, [r3, #0x402]
	str r2, [sp]
	ldrb r2, [r3, #0x403]
	str r2, [sp, #4]
	ldrb r2, [ip, #0x4c4]
	ldrb r3, [r3, #0x401]
	bl FUN_020D164C
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0223A36C: .4byte 0x0224F5A4
_0223A370: .4byte 0x022467C8
	arm_func_end ov13_0223A330

	arm_func_start ov13_0223A374
ov13_0223A374: @ 0x0223A374
	push {r3, lr}
	sub sp, sp, #8
	ldr r2, _0223A3B0 @ =0x0224F5A4
	ldr r1, _0223A3B4 @ =0x022467C8
	ldr ip, [r2]
	add r3, ip, #0xc8
	ldrb r2, [r3, #0x402]
	str r2, [sp]
	ldrb r2, [r3, #0x403]
	str r2, [sp, #4]
	ldrb r2, [ip, #0x4c8]
	ldrb r3, [r3, #0x401]
	bl FUN_020D164C
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0223A3B0: .4byte 0x0224F5A4
_0223A3B4: .4byte 0x022467C8
	arm_func_end ov13_0223A374

	arm_func_start ov13_0223A3B8
ov13_0223A3B8: @ 0x0223A3B8
	push {r3, lr}
	sub sp, sp, #8
	ldr r2, _0223A3F4 @ =0x0224F5A4
	ldr r1, _0223A3F8 @ =0x022467C8
	ldr ip, [r2]
	add r3, ip, #0xcc
	ldrb r2, [r3, #0x402]
	str r2, [sp]
	ldrb r2, [r3, #0x403]
	str r2, [sp, #4]
	ldrb r2, [ip, #0x4cc]
	ldrb r3, [r3, #0x401]
	bl FUN_020D164C
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0223A3F4: .4byte 0x0224F5A4
_0223A3F8: .4byte 0x022467C8
	arm_func_end ov13_0223A3B8

	arm_func_start ov13_0223A3FC
ov13_0223A3FC: @ 0x0223A3FC
	ldr r1, _0223A410 @ =0x0224F5A4
	ldr r1, [r1]
	add r0, r1, r0, lsl #8
	ldrb r0, [r0, #0xe7]
	bx lr
	.align 2, 0
_0223A410: .4byte 0x0224F5A4
	arm_func_end ov13_0223A3FC

	arm_func_start ov13_0223A414
ov13_0223A414: @ 0x0223A414
	push {r3, r4, r5, lr}
	ldr r1, _0223A4EC @ =0x0224F5A4
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
	ldr r1, _0223A4F0 @ =0x022457E8
	strb r0, [r5, #0x4f4]
	add r0, r4, #0xc0
	mov r2, #4
	bl FUN_020E5BB0
	cmp r0, #0
	ldrne r0, _0223A4EC @ =0x0224F5A4
	movne r1, #0
	ldreq r0, _0223A4EC @ =0x0224F5A4
	moveq r1, #1
	ldr r0, [r0]
	mov r2, #4
	strb r1, [r0, #0x4f5]
	ldr r1, _0223A4F0 @ =0x022457E8
	add r0, r4, #0xc8
	bl FUN_020E5BB0
	cmp r0, #0
	bne _0223A4B0
	ldr r1, _0223A4F0 @ =0x022457E8
	add r0, r4, #0xcc
	mov r2, #4
	bl FUN_020E5BB0
	cmp r0, #0
	beq _0223A4C4
_0223A4B0:
	ldr r0, _0223A4EC @ =0x0224F5A4
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x4f6]
	b _0223A4D4
_0223A4C4:
	ldr r0, _0223A4EC @ =0x0224F5A4
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x4f6]
_0223A4D4:
	ldr r1, _0223A4EC @ =0x0224F5A4
	ldrb r0, [r4, #0xd0]
	ldr r1, [r1]
	add r1, r1, #0x4f0
	bl FUN_0209E7CC
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223A4EC: .4byte 0x0224F5A4
_0223A4F0: .4byte 0x022457E8
	arm_func_end ov13_0223A414

	arm_func_start ov13_0223A4F4
ov13_0223A4F4: @ 0x0223A4F4
	push {r3, r4, r5, lr}
	ldr r0, _0223A5CC @ =0x0224F5A4
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
	bl FUN_020D4994
	add r0, r5, #0xc4
	mov r1, #0
	mov r2, #4
	bl FUN_020D4994
	mov r0, #0
	b _0223A590
_0223A56C:
	add r0, r4, #0xc0
	add r1, r5, #0xc0
	bl FUN_020D4A50
	add r0, r4, #0xc4
	add r1, r5, #0xc4
	mov r2, #4
	bl FUN_020D4A50
	add r0, r4, #0xf0
	bl FUN_0209E788
_0223A590:
	strb r0, [r5, #0xd0]
	ldrb r0, [r4, #0xf6]
	mov r2, #8
	cmp r0, #0
	beq _0223A5B4
	add r0, r5, #0xc8
	mov r1, #0
	bl FUN_020D4994
	b _0223A5C0
_0223A5B4:
	add r0, r4, #0xc8
	add r1, r5, #0xc8
	bl FUN_020D4A50
_0223A5C0:
	ldrb r0, [r4, #0xf4]
	bl ov13_0223A8F0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223A5CC: .4byte 0x0224F5A4
	arm_func_end ov13_0223A4F4

	arm_func_start ov13_0223A5D0
ov13_0223A5D0: @ 0x0223A5D0
	push {r4, r5, r6, r7, r8, lr}
	ldr r1, _0223A6E0 @ =0x0224F5A4
	mov r6, r0
	ldr r4, [r1]
	mov r1, #0
	add r0, r4, #0x400
	mov r2, #0xef
	bl FUN_020D4994
	mov r0, r6
	add r1, r4, #0x440
	mov r2, #0x20
	bl FUN_020D4A50
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
	bl FUN_020D4A50
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
	bl FUN_020D4994
	mov r0, #1
	strb r0, [r4, #0x4f5]
	strb r0, [r4, #0x4f6]
	bl ov13_0223A4F4
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223A6E0: .4byte 0x0224F5A4
	arm_func_end ov13_0223A5D0

	arm_func_start ov13_0223A6E4
ov13_0223A6E4: @ 0x0223A6E4
	push {r3, r4, r5, lr}
	ldr r1, _0223A7F0 @ =0x0224F5A4
	mov r5, r0
	ldr r0, [r1]
	mov r1, #0
	add r4, r0, #0x400
	mov r0, r4
	mov r2, #0xef
	bl FUN_020D4994
	mov r0, r5
	add r1, r4, #0xd1
	mov r2, #5
	bl FUN_020D4A50
	add r0, r5, #6
	add r1, r4, #0xd6
	mov r2, #5
	bl FUN_020D4A50
	add r0, r5, #0xc
	add r1, r4, #0xdb
	mov r2, #5
	bl FUN_020D4A50
	add r0, r5, #0x12
	add r1, r4, #0xe0
	mov r2, #5
	bl FUN_020D4A50
	add r0, r5, #0x18
	add r1, r4, #0x60
	mov r2, #0x20
	bl FUN_020D4A50
	add r0, r5, #0x39
	add r1, r4, #0x80
	mov r2, #0xd
	bl FUN_020D4A50
	add r0, r5, #0x47
	add r1, r4, #0x90
	mov r2, #0xd
	bl FUN_020D4A50
	add r0, r5, #0x55
	add r1, r4, #0xa0
	mov r2, #0xd
	bl FUN_020D4A50
	add r0, r5, #0x63
	add r1, r4, #0xb0
	mov r2, #0xd
	bl FUN_020D4A50
	add r0, r5, #0x71
	add r1, r4, #0x40
	mov r2, #0x20
	bl FUN_020D4A50
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
	bl FUN_020D4994
	mov r0, #1
	strb r0, [r4, #0xf5]
	strb r0, [r4, #0xf6]
	bl ov13_0223A4F4
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223A7F0: .4byte 0x0224F5A4
	arm_func_end ov13_0223A6E4

	arm_func_start ov13_0223A7F4
ov13_0223A7F4: @ 0x0223A7F4
	ldr r0, _0223A800 @ =0x0224F5A4
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0223A800: .4byte 0x0224F5A4
	arm_func_end ov13_0223A7F4

	arm_func_start ov13_0223A804
ov13_0223A804: @ 0x0223A804
	push {r3, r4, r5, lr}
	ldr r1, _0223A83C @ =0x0224F5A4
	mov r5, r0
	ldr r0, [r1]
	mov r1, #0
	add r4, r0, r5, lsl #8
	mov r0, r4
	mov r2, #0xef
	bl FUN_020D4994
	mov r1, #0xff
	mov r0, r5
	strb r1, [r4, #0xe7]
	bl ov13_0223A8F0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223A83C: .4byte 0x0224F5A4
	arm_func_end ov13_0223A804

	arm_func_start ov13_0223A840
ov13_0223A840: @ 0x0223A840
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	ldr r1, _0223A8EC @ =0x0224F5A4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x400
	bl FUN_020D4790
	ldr r0, _0223A8EC @ =0x0224F5A4
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
	bl FUN_0209F630
	add r0, sp, #0
	bl FUN_0209EF2C
	mov r8, #0
	ldr r4, _0223A8EC @ =0x0224F5A4
	mov r6, r0
	mov r7, r8
	mov r5, #0xe
_0223A8A4:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, r7
	mov r2, r5
	add r1, r1, #0xf0
	bl FUN_020D4A50
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
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223A8EC: .4byte 0x0224F5A4
	arm_func_end ov13_0223A840

	arm_func_start ov13_0223A8F0
ov13_0223A8F0: @ 0x0223A8F0
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	ldr r1, _0223AA54 @ =0x0224F5A4
	mov r7, r0
	ldr r0, [r1]
	mov r6, #0
	add r2, r0, r7, lsl #8
	ldrb r5, [r2, #0xe7]
	add r0, sp, #4
	mov r1, r6
	mov r2, #0x10
	mov r4, #1
	bl FUN_020D4994
	add r0, sp, #4
	mov r2, r4
	str r2, [r0, r7, lsl #2]
	cmp r7, #2
	bgt _0223A9CC
	ldr r0, _0223AA54 @ =0x0224F5A4
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
	ldr r1, _0223AA54 @ =0x0224F5A4
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
	ldr r1, _0223AA54 @ =0x0224F5A4
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
	ldr r8, _0223AA54 @ =0x0224F5A4
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
	bl FUN_020E3A04
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
	ldr r0, _0223AA54 @ =0x0224F5A4
	add r1, sp, #4
	ldr r0, [r0]
	str r2, [sp]
	bl FUN_0209E654
	add r0, sp, #0
	bl ov13_022412B0
	add sp, sp, #0x14
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223AA54: .4byte 0x0224F5A4
	arm_func_end ov13_0223A8F0

	arm_func_start ov13_0223AA58
ov13_0223AA58: @ 0x0223AA58
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	add r0, sp, #0
	mov r1, #0
	mov r2, #4
	bl FUN_020D4994
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
	bl FUN_020D4A50
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
	bl FUN_020EB82C
	strb r0, [sb, r7]
	add r7, r7, #1
	cmp r7, #4
	add r8, r8, #3
	blt _0223AA8C
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov13_0223AA58

	arm_func_start ov13_0223AAE0
ov13_0223AAE0: @ 0x0223AAE0
	cmp r0, #0x39
	subls r0, r0, #0x30
	bxls lr
	cmp r0, #0x46
	subls r0, r0, #0x37
	subhi r0, r0, #0x57
	bx lr
	arm_func_end ov13_0223AAE0

	arm_func_start ov13_0223AAFC
ov13_0223AAFC: @ 0x0223AAFC
	push {r3, lr}
	mov r0, #0xa0
	mov r1, #4
	bl ov13_0224128C
	ldr r2, _0223AB80 @ =0x0224F5A8
	add r1, sp, #0
	str r0, [r2]
	ldr r0, _0223AB84 @ =0x022467D8
	mov r2, #0x20
	bl ov13_0223F95C
	ldr r1, _0223AB80 @ =0x0224F5A8
	ldr r1, [r1]
	str r0, [r1, #0x98]
	bl FUN_020C78D0
	ldr r0, _0223AB80 @ =0x0224F5A8
	ldr r0, [r0]
	ldr r1, [r0, #0x98]
	bl FUN_020C9558
	mov r0, #0
	bl FUN_020CA848
	ldr r0, _0223AB80 @ =0x0224F5A8
	ldr r0, [r0]
	add r0, r0, #0x94
	bl FUN_020C81C4
	mov r0, #0
	ldr r1, _0223AB88 @ =ov13_0223AC40
	mov r2, r0
	mov r3, #0xc8
	bl ov13_02242528
	ldr r1, _0223AB80 @ =0x0224F5A8
	ldr r1, [r1]
	str r0, [r1, #0x9c]
	pop {r3, pc}
	.align 2, 0
_0223AB80: .4byte 0x0224F5A8
_0223AB84: .4byte 0x022467D8
_0223AB88: .4byte ov13_0223AC40
	arm_func_end ov13_0223AAFC

	arm_func_start ov13_0223AB8C
ov13_0223AB8C: @ 0x0223AB8C
	push {r3, lr}
	ldr r1, _0223ABB0 @ =0x0224F5A8
	mov r0, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x9c]
	bl ov13_022425D0
	ldr r0, _0223ABB4 @ =0x0224F5A8
	bl ov13_022412B0
	pop {r3, pc}
	.align 2, 0
_0223ABB0: .4byte 0x0224F5A8
_0223ABB4: .4byte 0x0224F5A8
	arm_func_end ov13_0223AB8C

	arm_func_start ov13_0223ABB8
ov13_0223ABB8: @ 0x0223ABB8
	ldr r1, _0223ABD4 @ =0x0224F5A8
	mov r2, r0
	ldr r0, [r1]
	ldr ip, _0223ABD8 @ =0x020CA954
	mov r1, #0
	add r0, r0, #0x94
	bx ip
	.align 2, 0
_0223ABD4: .4byte 0x0224F5A8
_0223ABD8: .4byte 0x020CA954
	arm_func_end ov13_0223ABB8

	arm_func_start ov13_0223ABDC
ov13_0223ABDC: @ 0x0223ABDC
	ldr r2, _0223ABF4 @ =0x0224F5A8
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _0223ABF8 @ =0x020C8208
	add r0, r0, #0x94
	bx ip
	.align 2, 0
_0223ABF4: .4byte 0x0224F5A8
_0223ABF8: .4byte 0x020C8208
	arm_func_end ov13_0223ABDC

	arm_func_start ov13_0223ABFC
ov13_0223ABFC: @ 0x0223ABFC
	ldr r2, _0223AC18 @ =0x0224F5A8
	ldr ip, _0223AC1C @ =0x020C827C
	ldr r3, [r2]
	mov r2, r1
	mov r1, r0
	add r0, r3, #0x94
	bx ip
	.align 2, 0
_0223AC18: .4byte 0x0224F5A8
_0223AC1C: .4byte 0x020C827C
	arm_func_end ov13_0223ABFC

	arm_func_start ov13_0223AC20
ov13_0223AC20: @ 0x0223AC20
	ldr r0, _0223AC38 @ =0x0224F5A8
	ldr ip, _0223AC3C @ =0x020C8058
	ldr r0, [r0]
	mov r1, #0
	add r0, r0, #0x94
	bx ip
	.align 2, 0
_0223AC38: .4byte 0x0224F5A8
_0223AC3C: .4byte 0x020C8058
	arm_func_end ov13_0223AC20

	arm_func_start ov13_0223AC40
ov13_0223AC40: @ 0x0223AC40
	ldr ip, _0223AC48 @ =FUN_020C7958
	bx ip
	.align 2, 0
_0223AC48: .4byte FUN_020C7958
	arm_func_end ov13_0223AC40

	arm_func_start ov13_0223AC4C
ov13_0223AC4C: @ 0x0223AC4C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r0, [sp]
	mov r0, #0x1c
	mov r1, #4
	bl ov13_0224128C
	ldr r1, [sp]
	ldr r4, _0223AD34 @ =0x0224F5AC
	add r3, r1, r1, lsl #2
	ldr r2, _0223AD38 @ =0x022457EC
	ldr r1, _0223AD3C @ =0x022457FB
	mov r8, #0
	mvn r7, #0
	ldr r5, _0223AD40 @ =0x0224580A
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
	ldr r1, _0223AD44 @ =ov13_0223AD48
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0223AD34 @ =0x0224F5AC
	ldr r1, [r1, #4]
	str r0, [r1, #0x14]
	ldr r0, [sp]
	bl ov13_0223B6F4
	mov r0, #0xd
	bl ov13_0223ABB8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0223AD34: .4byte 0x0224F5AC
_0223AD38: .4byte 0x022457EC
_0223AD3C: .4byte 0x022457FB
_0223AD40: .4byte 0x0224580A
_0223AD44: .4byte ov13_0223AD48
	arm_func_end ov13_0223AC4C

	arm_func_start ov13_0223AD48
ov13_0223AD48: @ 0x0223AD48
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223AE20 @ =0x0224F5AC
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
	ldr r5, _0223AE24 @ =0x0224580A
	ldr r4, _0223AE20 @ =0x0224F5AC
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
	pop {r4, r5, r6, r7, r8, pc}
_0223ADCC:
	mov r0, #0x20
	ldr r6, _0223AE24 @ =0x0224580A
	ldr r5, _0223AE20 @ =0x0224F5AC
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
	ldr r1, _0223AE28 @ =ov13_0223AE2C
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223AE20: .4byte 0x0224F5AC
_0223AE24: .4byte 0x0224580A
_0223AE28: .4byte ov13_0223AE2C
	arm_func_end ov13_0223AD48

	arm_func_start ov13_0223AE2C
ov13_0223AE2C: @ 0x0223AE2C
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223AF04 @ =0x0224F5AC
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
	ldr r5, _0223AF08 @ =0x0224580A
	ldr r4, _0223AF04 @ =0x0224F5AC
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
	pop {r4, r5, r6, r7, r8, pc}
_0223AEB0:
	mov r0, #0x50
	ldr r6, _0223AF08 @ =0x0224580A
	ldr r5, _0223AF04 @ =0x0224F5AC
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
	ldr r1, _0223AF0C @ =ov13_0223AF10
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223AF04: .4byte 0x0224F5AC
_0223AF08: .4byte 0x0224580A
_0223AF0C: .4byte ov13_0223AF10
	arm_func_end ov13_0223AE2C

	arm_func_start ov13_0223AF10
ov13_0223AF10: @ 0x0223AF10
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223AFE8 @ =0x0224F5AC
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
	ldr r5, _0223AFEC @ =0x0224580A
	ldr r4, _0223AFE8 @ =0x0224F5AC
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
	pop {r4, r5, r6, r7, r8, pc}
_0223AF94:
	mov r0, #0x68
	ldr r6, _0223AFEC @ =0x0224580A
	ldr r5, _0223AFE8 @ =0x0224F5AC
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
	ldr r1, _0223AFF0 @ =ov13_0223AFF4
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223AFE8: .4byte 0x0224F5AC
_0223AFEC: .4byte 0x0224580A
_0223AFF0: .4byte ov13_0223AFF4
	arm_func_end ov13_0223AF10

	arm_func_start ov13_0223AFF4
ov13_0223AFF4: @ 0x0223AFF4
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223B0CC @ =0x0224F5AC
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
	ldr r5, _0223B0D0 @ =0x0224580A
	ldr r4, _0223B0CC @ =0x0224F5AC
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
	pop {r4, r5, r6, r7, r8, pc}
_0223B078:
	mov r0, #0x98
	ldr r6, _0223B0D0 @ =0x0224580A
	ldr r5, _0223B0CC @ =0x0224F5AC
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
	ldr r1, _0223B0D4 @ =ov13_0223B0D8
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223B0CC: .4byte 0x0224F5AC
_0223B0D0: .4byte 0x0224580A
_0223B0D4: .4byte ov13_0223B0D8
	arm_func_end ov13_0223AFF4

	arm_func_start ov13_0223B0D8
ov13_0223B0D8: @ 0x0223B0D8
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0223B170 @ =0x0224F5AC
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
	ldr r0, _0223B170 @ =0x0224F5AC
	mvn r1, #0
	ldr r0, [r0, #4]
	mov r3, #0x21
	ldr r0, [r0, #0x10]
	bl ov13_0223FF18
	add sp, sp, #8
	pop {r4, pc}
_0223B13C:
	ldr r0, _0223B170 @ =0x0224F5AC
	mov r2, #0xb0
	ldr r0, [r0, #4]
	str r2, [sp, #4]
	ldr r0, [r0, #0x10]
	sub r1, r2, #0xb1
	mov r3, #0x21
	bl ov13_0223FF18
	ldr r1, _0223B174 @ =ov13_0223B178
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0223B170: .4byte 0x0224F5AC
_0223B174: .4byte ov13_0223B178
	arm_func_end ov13_0223B0D8

	arm_func_start ov13_0223B178
ov13_0223B178: @ 0x0223B178
	push {r3, lr}
	mov r1, r0
	mov r0, #0
	bl ov13_022425D0
	ldr r0, _0223B19C @ =0x0224F5AC
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x14]
	pop {r3, pc}
	.align 2, 0
_0223B19C: .4byte 0x0224F5AC
	arm_func_end ov13_0223B178

	arm_func_start ov13_0223B1A0
ov13_0223B1A0: @ 0x0223B1A0
	push {r3, lr}
	ldr r1, _0223B1D8 @ =0x0224F5AC
	mov r0, #0
	ldr ip, [r1, #4]
	mov lr, #1
	ldr r1, _0223B1DC @ =ov13_0223B2C8
	mov r2, r0
	mov r3, #0x78
	strb lr, [ip, #0x18]
	bl ov13_02242528
	ldr r1, _0223B1D8 @ =0x0224F5AC
	ldr r1, [r1, #4]
	str r0, [r1, #0x14]
	pop {r3, pc}
	.align 2, 0
_0223B1D8: .4byte 0x0224F5AC
_0223B1DC: .4byte ov13_0223B2C8
	arm_func_end ov13_0223B1A0

	arm_func_start ov13_0223B1E0
ov13_0223B1E0: @ 0x0223B1E0
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r0, [sp]
	add r2, r0, r0, lsl #2
	ldr r1, _0223B298 @ =0x022457EC
	ldr r0, _0223B29C @ =0x022457FB
	mov r8, #0
	ldr r5, _0223B2A0 @ =0x0224580A
	ldr r4, _0223B2A4 @ =0x0224F5AC
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
	lsl r1, r8, #2
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
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0223B298: .4byte 0x022457EC
_0223B29C: .4byte 0x022457FB
_0223B2A0: .4byte 0x0224580A
_0223B2A4: .4byte 0x0224F5AC
	arm_func_end ov13_0223B1E0

	arm_func_start ov13_0223B2A8
ov13_0223B2A8: @ 0x0223B2A8
	ldr r0, _0223B2C4 @ =0x0224F5AC
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_0223B2C4: .4byte 0x0224F5AC
	arm_func_end ov13_0223B2A8

	arm_func_start ov13_0223B2C8
ov13_0223B2C8: @ 0x0223B2C8
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0223B354 @ =0x0224F5AC
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
	ldr r0, _0223B354 @ =0x0224F5AC
	mvn r1, #0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x10]
	bl ov13_0223FF18
	add sp, sp, #8
	pop {r4, pc}
_0223B324:
	ldr r0, _0223B354 @ =0x0224F5AC
	mov r2, #0x98
	ldr r0, [r0, #4]
	str r2, [sp, #4]
	ldr r0, [r0, #0x10]
	sub r1, r2, #0x99
	bl ov13_0223FF18
	ldr r1, _0223B358 @ =ov13_0223B35C
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0223B354: .4byte 0x0224F5AC
_0223B358: .4byte ov13_0223B35C
	arm_func_end ov13_0223B2C8

	arm_func_start ov13_0223B35C
ov13_0223B35C: @ 0x0223B35C
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223B42C @ =0x0224F5AC
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
	ldr r5, _0223B430 @ =0x0224580A
	ldr r4, _0223B42C @ =0x0224F5AC
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
	pop {r4, r5, r6, r7, r8, pc}
_0223B3D8:
	mov r0, #0x68
	ldr r6, _0223B430 @ =0x0224580A
	ldr r5, _0223B42C @ =0x0224F5AC
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
	ldr r1, _0223B434 @ =ov13_0223B438
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223B42C: .4byte 0x0224F5AC
_0223B430: .4byte 0x0224580A
_0223B434: .4byte ov13_0223B438
	arm_func_end ov13_0223B35C

	arm_func_start ov13_0223B438
ov13_0223B438: @ 0x0223B438
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223B508 @ =0x0224F5AC
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
	ldr r5, _0223B50C @ =0x0224580A
	ldr r4, _0223B508 @ =0x0224F5AC
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
	pop {r4, r5, r6, r7, r8, pc}
_0223B4B4:
	mov r0, #0x50
	ldr r6, _0223B50C @ =0x0224580A
	ldr r5, _0223B508 @ =0x0224F5AC
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
	ldr r1, _0223B510 @ =ov13_0223B514
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223B508: .4byte 0x0224F5AC
_0223B50C: .4byte 0x0224580A
_0223B510: .4byte ov13_0223B514
	arm_func_end ov13_0223B438

	arm_func_start ov13_0223B514
ov13_0223B514: @ 0x0223B514
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223B5E4 @ =0x0224F5AC
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
	ldr r5, _0223B5E8 @ =0x0224580A
	ldr r4, _0223B5E4 @ =0x0224F5AC
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
	pop {r4, r5, r6, r7, r8, pc}
_0223B590:
	mov r0, #0x20
	ldr r6, _0223B5E8 @ =0x0224580A
	ldr r5, _0223B5E4 @ =0x0224F5AC
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
	ldr r1, _0223B5EC @ =ov13_0223B5F0
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223B5E4: .4byte 0x0224F5AC
_0223B5E8: .4byte 0x0224580A
_0223B5EC: .4byte ov13_0223B5F0
	arm_func_end ov13_0223B514

	arm_func_start ov13_0223B5F0
ov13_0223B5F0: @ 0x0223B5F0
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0223B6B8 @ =0x0224F5AC
	mov r5, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp, #4]
	ldr r7, _0223B6BC @ =0x0224580A
	sub r0, r0, #8
	ldr r6, _0223B6B8 @ =0x0224F5AC
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
	ldr r0, _0223B6C0 @ =0x000001D6
	cmp r1, r0
	addgt sp, sp, #8
	popgt {r4, r5, r6, r7, r8, pc}
	cmp r1, #0x100
	addlt sp, sp, #8
	poplt {r4, r5, r6, r7, r8, pc}
	mov r1, r5
	mov r0, #0
	bl ov13_022425D0
	ldr r4, _0223B6B8 @ =0x0224F5AC
	mov r5, #0
_0223B690:
	ldr r0, [r4, #4]
	ldr r0, [r0, r5, lsl #2]
	bl ov13_0223FD60
	add r5, r5, #1
	cmp r5, #5
	blt _0223B690
	ldr r0, _0223B6C4 @ =0x0224F5B0
	bl ov13_022412B0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223B6B8: .4byte 0x0224F5AC
_0223B6BC: .4byte 0x0224580A
_0223B6C0: .4byte 0x000001D6
_0223B6C4: .4byte 0x0224F5B0
	arm_func_end ov13_0223B5F0

	arm_func_start ov13_0223B6C8
ov13_0223B6C8: @ 0x0223B6C8
	ldr r0, _0223B6F0 @ =0x0224F5AC
	ldr r0, [r0, #4]
	cmp r0, #0
	moveq r0, #1
	bxeq lr
	ldrb r0, [r0, #0x18]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0223B6F0: .4byte 0x0224F5AC
	arm_func_end ov13_0223B6C8

	arm_func_start ov13_0223B6F4
ov13_0223B6F4: @ 0x0223B6F4
	push {r3, lr}
	ldr r1, _0223B730 @ =0x02246854
	ldr r0, [r1, r0, lsl #2]
	bl ov13_022278C4
	mov r1, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r2, _0223B734 @ =0x0224F5AC
	ldr r1, _0223B738 @ =ov13_0223B73C
	str r0, [r2]
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov13_02242528
	pop {r3, pc}
	.align 2, 0
_0223B730: .4byte 0x02246854
_0223B734: .4byte 0x0224F5AC
_0223B738: .4byte ov13_0223B73C
	arm_func_end ov13_0223B6F4

	arm_func_start ov13_0223B73C
ov13_0223B73C: @ 0x0223B73C
	push {r4, lr}
	ldr r1, _0223B784 @ =0x0224F5AC
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0x600
	bl DC_FlushRange
	ldr r0, _0223B784 @ =0x0224F5AC
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x600
	bl FUN_020D0044
	ldr r0, _0223B784 @ =0x0224F5AC
	ldr r0, [r0]
	bl ov13_0223FA50
	mov r1, r4
	mov r0, #1
	bl ov13_022425D0
	pop {r4, pc}
	.align 2, 0
_0223B784: .4byte 0x0224F5AC
	arm_func_end ov13_0223B73C

	arm_func_start ov13_0223B788
ov13_0223B788: @ 0x0223B788
	push {r4, r5, lr}
	sub sp, sp, #0x54
	mov r4, r0
	ldr r0, _0223B8F0 @ =0x00001BA0
	mov r1, #0x20
	bl ov13_0224128C
	ldr r2, _0223B8F4 @ =0x0224F5B4
	add r1, r0, #0x1000
	str r0, [r2]
	str r4, [r1, #0x370]
	bl FUN_020D34B0
	ldr r4, _0223B8F4 @ =0x0224F5B4
	mov r2, #3
	ldr r3, [r4]
	add r3, r3, #0x1000
	str r0, [r3, #0xb88]
	str r1, [r3, #0xb8c]
	ldr r0, [r4]
	ldr r1, _0223B8F8 @ =ov13_0223BA3C
	bl FUN_020DF3F8
	cmp r0, #2
	bne _0223B8DC
_0223B7E0:
	ldr r0, [r4]
	add r0, r0, #0x3b8
	add r0, r0, #0x1000
	bl FUN_020DECC4
	ldr ip, [r4]
	add r0, ip, #0x1300
	ldrh r0, [r0, #0xb8]
	cmp r0, #2
	bne _0223B7E0
	add r0, ip, #0x374
	ldr r5, _0223B8FC @ =0x02245834
	add lr, r0, #0x1000
	mov r4, #4
_0223B814:
	ldm r5!, {r0, r1, r2, r3}
	stm lr!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0223B814
	ldr r0, [r5]
	add r1, ip, #0xf00
	str r0, [lr]
	add r0, ip, #0x1000
	str r1, [r0, #0x374]
	bl FUN_020DF064
	ldr r1, _0223B8F4 @ =0x0224F5B4
	ldr r1, [r1]
	add r1, r1, #0x1300
	strh r0, [r1, #0x7c]
	add r0, sp, #0
	bl FUN_020D3C5C
	ldr r1, _0223B8F4 @ =0x0224F5B4
	ldr r0, _0223B900 @ =0x02245828
	ldr r1, [r1]
	mov r2, #8
	add r1, r1, #0x388
	add r1, r1, #0x1000
	bl FUN_020D4A50
	ldr r2, _0223B8F4 @ =0x0224F5B4
	mov r3, #1
	ldr r1, [r2]
	add r0, sp, #4
	add r1, r1, #0x1000
	strb r3, [r1, #0x391]
	ldr r1, [r2]
	ldrh r2, [sp, #0x1a]
	add r1, r1, #0x394
	add r1, r1, #0x1000
	lsl r2, r2, #1
	bl FUN_020D4A50
	bl ov13_0223B90C
	cmp r0, #0
	beq _0223B8DC
	mov r0, #0
	ldr r1, _0223B904 @ =ov13_0223BD30
	mov r2, r0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0223B8F4 @ =0x0224F5B4
	add sp, sp, #0x54
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r0, [r1, #0xb90]
	mov r0, #1
	pop {r4, r5, pc}
_0223B8DC:
	ldr r0, _0223B908 @ =0x0224F5B4
	bl ov13_022412B0
	mov r0, #0
	add sp, sp, #0x54
	pop {r4, r5, pc}
	.align 2, 0
_0223B8F0: .4byte 0x00001BA0
_0223B8F4: .4byte 0x0224F5B4
_0223B8F8: .4byte ov13_0223BA3C
_0223B8FC: .4byte 0x02245834
_0223B900: .4byte 0x02245828
_0223B904: .4byte ov13_0223BD30
_0223B908: .4byte 0x0224F5B4
	arm_func_end ov13_0223B788

	arm_func_start ov13_0223B90C
ov13_0223B90C: @ 0x0223B90C
	push {r3, lr}
	ldr r1, _0223B938 @ =0x0224F5B4
	ldr r0, _0223B93C @ =ov13_0223BA3C
	ldr r1, [r1]
	add r1, r1, #0x374
	add r1, r1, #0x1000
	bl FUN_020DF7BC
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	pop {r3, pc}
	.align 2, 0
_0223B938: .4byte 0x0224F5B4
_0223B93C: .4byte ov13_0223BA3C
	arm_func_end ov13_0223B90C

	arm_func_start ov13_0223B940
ov13_0223B940: @ 0x0223B940
	push {r4, lr}
	ldr r1, _0223BA18 @ =0x0224F5B4
	mov r2, #1
	ldr r0, [r1]
	add r0, r0, #0x1000
	strb r2, [r0, #0xb94]
	ldr r0, [r1]
	add r0, r0, #0x3b8
	add r0, r0, #0x1000
	bl FUN_020DECC4
	ldr r0, _0223BA18 @ =0x0224F5B4
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrh r0, [r0, #0xb8]
	cmp r0, #2
	beq _0223B9BC
	ldr r0, _0223BA1C @ =ov13_0223BA3C
	bl FUN_020DF480
	cmp r0, #2
	movne r0, #0
	popne {r4, pc}
	ldr r4, _0223BA18 @ =0x0224F5B4
_0223B998:
	ldr r0, [r4]
	add r0, r0, #0x3b8
	add r0, r0, #0x1000
	bl FUN_020DECC4
	ldr r0, [r4]
	add r0, r0, #0x1300
	ldrh r0, [r0, #0xb8]
	cmp r0, #2
	bne _0223B998
_0223B9BC:
	ldr r0, _0223BA1C @ =ov13_0223BA3C
	bl FUN_020DF4B8
	cmp r0, #2
	movne r0, #0
	popne {r4, pc}
	ldr r0, _0223BA18 @ =0x0224F5B4
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r1, [r0, #0xb90]
	cmp r1, #0
	beq _0223B9F0
	mov r0, #0
	bl ov13_022425F0
_0223B9F0:
	ldr r0, _0223BA18 @ =0x0224F5B4
	ldr r0, [r0]
	add r0, r0, #0x1000
_0223B9FC:
	ldrb r1, [r0, #0xb94]
	cmp r1, #2
	bne _0223B9FC
	ldr r0, _0223BA20 @ =0x0224F5B4
	bl ov13_022412B0
	mov r0, #1
	pop {r4, pc}
	.align 2, 0
_0223BA18: .4byte 0x0224F5B4
_0223BA1C: .4byte ov13_0223BA3C
_0223BA20: .4byte 0x0224F5B4
	arm_func_end ov13_0223B940

	arm_func_start ov13_0223BA24
ov13_0223BA24: @ 0x0223BA24
	ldr r1, _0223BA38 @ =0x0224F5B4
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r0, [r1, #0x370]
	bx lr
	.align 2, 0
_0223BA38: .4byte 0x0224F5B4
	arm_func_end ov13_0223BA24

	arm_func_start ov13_0223BA3C
ov13_0223BA3C: @ 0x0223BA3C
	push {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	popne {r3, pc}
	ldr r1, _0223BAC8 @ =0x0224F5B4
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldrb r2, [r1, #0xb94]
	cmp r2, #0
	beq _0223BA78
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #2
	strbeq r0, [r1, #0xb94]
	pop {r3, pc}
_0223BA78:
	ldrh r2, [r0]
	cmp r2, #0x26
	popne {r3, pc}
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
	pop {r3, pc}
_0223BAB8:
	bl ov13_0223B90C
	pop {r3, pc}
_0223BAC0:
	bl FUN_020D3F48
	pop {r3, pc}
	.align 2, 0
_0223BAC8: .4byte 0x0224F5B4
	arm_func_end ov13_0223BA3C

	arm_func_start ov13_0223BACC
ov13_0223BACC: @ 0x0223BACC
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	ldrh r0, [fp, #0xe]
	mov r7, #0
	cmp r0, #0
	pople {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223BAE4:
	add r0, fp, r7, lsl #2
	ldr r6, [r0, #0x10]
	mov r1, #0xc0
	mov r0, r6
	bl FUN_020D285C
	ldr r1, _0223BC18 @ =0x02245828
	add r0, r6, #0xc
	mov r2, #8
	bl FUN_020E5BB0
	cmp r0, #0
	bne _0223BC04
	ldr r0, _0223BC1C @ =0x0224F5B4
	mov r5, #0
	ldr sb, [r0]
	mov r4, #6
	add r8, sb, #0x1300
_0223BB24:
	mov r1, r8
	mov r2, r4
	add r0, r6, #4
	bl FUN_020E5BB0
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
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #1
	blx r1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223BB7C:
	add r5, r5, #1
	cmp r5, #0x10
	add r8, r8, #7
	blt _0223BB24
	ldr r5, _0223BC20 @ =0x02245820
	add r8, sb, #0x1300
	mov sl, #0
	mov r4, #6
_0223BB9C:
	mov r0, r8
	mov r1, r5
	mov r2, r4
	bl FUN_020E5BB0
	cmp r0, #0
	bne _0223BBF4
	rsb r4, sl, sl, lsl #3
	add r1, sb, #0x1300
	add r0, r6, #4
	add r1, r1, r4
	mov r2, #6
	bl FUN_020D4A50
	ldrb r0, [r6, #0x15]
	tst r0, #1
	ldr r0, _0223BC1C @ =0x0224F5B4
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
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0223BC18: .4byte 0x02245828
_0223BC1C: .4byte 0x0224F5B4
_0223BC20: .4byte 0x02245820
	arm_func_end ov13_0223BACC

	arm_func_start ov13_0223BC24
ov13_0223BC24: @ 0x0223BC24
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _0223BD28 @ =0x0224F5B4
	mov sl, r0
	ldr r2, [r1]
	add r1, r2, #0x1000
	ldrb r0, [r1, #0xb95]
	cmp r0, #0
	beq _0223BC58
	ldr r1, [r1, #0x370]
	cmp r1, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	blx r1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223BC58:
	add r0, r2, #0xf00
	mov r1, #0x400
	bl FUN_020D285C
	ldrh fp, [sl, #0xe]
	mov r6, #0
	cmp fp, #0
	pople {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0223BD28 @ =0x0224F5B4
	mov r4, #6
	ldr sb, [r0]
_0223BC80:
	add r0, sl, r6, lsl #2
	ldr r5, [r0, #0x10]
	ldr r1, _0223BD2C @ =0x02245828
	mov r2, #8
	add r0, r5, #0xc
	bl FUN_020E5BB0
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
	bl FUN_020E5BB0
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
	strbeq r1, [r0, #0xb95]
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #1
	blx r1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223BD08:
	add r7, r7, #1
	cmp r7, #0x10
	add r8, r8, #7
	blt _0223BCB4
_0223BD18:
	add r6, r6, #1
	cmp r6, fp
	blt _0223BC80
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0223BD28: .4byte 0x0224F5B4
_0223BD2C: .4byte 0x02245828
	arm_func_end ov13_0223BC24

	arm_func_start ov13_0223BD30
ov13_0223BD30: @ 0x0223BD30
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r0, [sp]
	bl FUN_020D34B0
	ldr r2, _0223BE60 @ =0x0224F5B4
	ldr r3, _0223BE64 @ =0x0017F898
	ldr sl, [r2]
	mov r7, #0
	add r2, sl, #0x1000
	ldr r4, [r2, #0xb88]
	ldr r2, [r2, #0xb8c]
	adds r3, r4, r3
	adc r2, r2, #0
	cmp r1, r2
	cmpeq r0, r3
	poplo {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, _0223BE68 @ =0x02245820
	mov r6, r7
	mov r5, r7
	mov sb, sl
	add r8, sl, #0x1300
	mov fp, #6
_0223BD84:
	mov r0, r8
	mov r1, r4
	mov r2, fp
	bl FUN_020E5BB0
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
	ldr r3, _0223BE60 @ =0x0224F5B4
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
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0223BE60: .4byte 0x0224F5B4
_0223BE64: .4byte 0x0017F898
_0223BE68: .4byte 0x02245820
	arm_func_end ov13_0223BD30

	arm_func_start ov13_0223BE6C
ov13_0223BE6C: @ 0x0223BE6C
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r5, _0223C168 @ =0x02245878
	ldr r4, _0223C16C @ =0x0224F4F8
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
	ldr r1, _0223C170 @ =0x0224F5B8
	mvn r3, #1
	str r0, [r1]
	strb sl, [r0, #0x1c]
	ldr r2, [r1]
	ldr r0, _0223C174 @ =0x04000050
	strb r3, [r2, #0x1b]
	ldr r3, [r1]
	ldr r2, [sp, #0x10]
	mov r1, #0x1f
	strb r2, [r3, #0x1e]
	mov r2, #0
	bl FUN_020CF178
	ldr r1, _0223C178 @ =0x0224592C
	mov r0, #0
	ldrb r1, [r1, sl]
	mov r2, r0
	bl ov13_022401B0
	ldr r3, _0223C170 @ =0x0224F5B8
	mvn r1, #0
	ldr r4, [r3]
	mov r2, #0x100
	str r0, [r4]
	ldr r0, [r3]
	mov r3, #0
	ldr r0, [r0]
	bl ov13_0223FF18
	ldr r0, _0223C170 @ =0x0224F5B8
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #0
	ldr r0, [r0]
	bl ov13_02240008
	ldr r7, _0223C17C @ =0x02245934
	mov r8, #0
	ldrb r0, [r7, sl]
	cmp r0, #0
	ble _0223BFEC
	ldr r0, _0223C180 @ =0x0224589E
	ldr r4, _0223C170 @ =0x0224F5B8
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
	ldr r1, _0223C170 @ =0x0224F5B8
	ldr r1, [r1]
	str r0, [r1, #0x10]
	mov r0, #0
	ldr r1, [sp, #0x18]
	mov r2, r0
	bl ov13_0223FC04
	ldr r1, _0223C170 @ =0x0224F5B8
	ldr r1, [r1]
	str r0, [r1, #4]
	bl ov13_02227B1C
	ldr r1, _0223C184 @ =0x022458BE
	lsl r5, sl, #2
	ldrh r4, [r1, r5]
	mov r3, #2
	ldr r2, _0223C170 @ =0x0224F5B8
	str r4, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	ldr r3, _0223C188 @ =0x022458BC
	str r0, [sp, #0xc]
	ldr r0, [r2]
	mov r1, #0
	ldrh r3, [r3, r5]
	ldr r0, [r0, #0x10]
	mov r2, r1
	bl ov13_02240CC0
	ldr r0, _0223C170 @ =0x0224F5B8
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
	ldr r3, _0223C170 @ =0x0224F5B8
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
	ldr r2, _0223C18C @ =0x02245882
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
	ldr r1, _0223C190 @ =ov13_0223C20C
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0223C170 @ =0x0224F5B8
	add sp, sp, #0x24
	ldr r1, [r1]
	str r0, [r1, #0x14]
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223C148:
	ldr r1, _0223C194 @ =ov13_0223C26C
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0223C170 @ =0x0224F5B8
	ldr r1, [r1]
	str r0, [r1, #0x14]
	add sp, sp, #0x24
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0223C168: .4byte 0x02245878
_0223C16C: .4byte 0x0224F4F8
_0223C170: .4byte 0x0224F5B8
_0223C174: .4byte 0x04000050
_0223C178: .4byte 0x0224592C
_0223C17C: .4byte 0x02245934
_0223C180: .4byte 0x0224589E
_0223C184: .4byte 0x022458BE
_0223C188: .4byte 0x022458BC
_0223C18C: .4byte 0x02245882
_0223C190: .4byte ov13_0223C20C
_0223C194: .4byte ov13_0223C26C
	arm_func_end ov13_0223BE6C

	arm_func_start ov13_0223C198
ov13_0223C198: @ 0x0223C198
	push {r3, lr}
	ldr r1, _0223C1D4 @ =0x0224F5B8
	mov r0, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x14]
	bl ov13_022425D0
	ldr r1, _0223C1D8 @ =ov13_0223C7FC
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0223C1D4 @ =0x0224F5B8
	ldr r1, [r1]
	str r0, [r1, #0x14]
	pop {r3, pc}
	.align 2, 0
_0223C1D4: .4byte 0x0224F5B8
_0223C1D8: .4byte ov13_0223C7FC
	arm_func_end ov13_0223C198

	arm_func_start ov13_0223C1DC
ov13_0223C1DC: @ 0x0223C1DC
	ldr r0, _0223C1EC @ =0x0224F5B8
	ldr r0, [r0]
	ldrsb r0, [r0, #0x1b]
	bx lr
	.align 2, 0
_0223C1EC: .4byte 0x0224F5B8
	arm_func_end ov13_0223C1DC

	arm_func_start ov13_0223C1F0
ov13_0223C1F0: @ 0x0223C1F0
	ldr r0, _0223C208 @ =0x0224F5B8
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_0223C208: .4byte 0x0224F5B8
	arm_func_end ov13_0223C1F0

	arm_func_start ov13_0223C20C
ov13_0223C20C: @ 0x0223C20C
	push {r4, lr}
	ldr r1, _0223C260 @ =0x0224F5B8
	mov r4, r0
	ldr r3, [r1]
	ldr r0, _0223C264 @ =0x04000050
	ldrsb r2, [r3, #0x1a]
	sub r2, r2, #1
	strb r2, [r3, #0x1a]
	ldr r1, [r1]
	ldrsb r1, [r1, #0x1a]
	bl FUN_020CF1A0
	ldr r1, _0223C260 @ =0x0224F5B8
	mvn r0, #0xb
	ldr r1, [r1]
	ldrsb r1, [r1, #0x1a]
	cmp r1, r0
	popgt {r4, pc}
	ldr r1, _0223C268 @ =ov13_0223C26C
	mov r0, r4
	bl ov13_022425C8
	pop {r4, pc}
	.align 2, 0
_0223C260: .4byte 0x0224F5B8
_0223C264: .4byte 0x04000050
_0223C268: .4byte ov13_0223C26C
	arm_func_end ov13_0223C20C

	arm_func_start ov13_0223C26C
ov13_0223C26C: @ 0x0223C26C
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0223C330 @ =0x0224F5B8
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0]
	add r3, sp, #0
	mov r1, #0
	bl ov13_02240068
	ldr r0, [sp]
	ldr r1, _0223C330 @ =0x0224F5B8
	sub r0, r0, #0xc
	ldr r1, [r1]
	str r0, [sp]
	ldrb r2, [r1, #0x1c]
	ldr r1, _0223C334 @ =0x022458D6
	lsl r2, r2, #2
	ldrh r1, [r1, r2]
	cmp r0, r1
	ble _0223C2CC
	bl ov13_0223C508
	add sp, sp, #8
	pop {r4, pc}
_0223C2CC:
	mov r0, r1
	bl ov13_0223C508
	ldr r0, _0223C330 @ =0x0224F5B8
	mov r3, #0x78
	ldr r0, [r0]
	ldrb r0, [r0, #0x1c]
	cmp r0, #5
	mov r0, #0
	bne _0223C304
	ldr r1, _0223C338 @ =ov13_0223C49C
	mov r2, r0
	bl ov13_02242528
	ldr r1, _0223C330 @ =0x0224F5B8
	b _0223C314
_0223C304:
	ldr r1, _0223C33C @ =ov13_0223C340
	mov r2, r0
	bl ov13_02242528
	ldr r1, _0223C330 @ =0x0224F5B8
_0223C314:
	ldr r1, [r1]
	str r0, [r1, #0x14]
	mov r1, r4
	mov r0, #1
	bl ov13_022425D0
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0223C330: .4byte 0x0224F5B8
_0223C334: .4byte 0x022458D6
_0223C338: .4byte ov13_0223C49C
_0223C33C: .4byte ov13_0223C340
	arm_func_end ov13_0223C26C

	arm_func_start ov13_0223C340
ov13_0223C340: @ 0x0223C340
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r4, _0223C480 @ =0x0224F5B8
	ldr sb, _0223C484 @ =0x02245934
	ldr r0, [r4]
	mov sl, #0
	ldrb r1, [r0, #0x1c]
	ldrb r0, [sb, r1]
	cmp r0, #0
	ble _0223C3CC
	ldr r8, _0223C488 @ =0x02245904
	ldr r7, _0223C48C @ =0x0224588A
	ldr r6, _0223C490 @ =0x022458A8
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
	ldr r0, _0223C480 @ =0x0224F5B8
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
	ldr r0, _0223C480 @ =0x0224F5B8
	ldr r1, _0223C494 @ =0x02245894
	ldr r2, [r0]
	ldrb r0, [r2, #0x1c]
	lsl r0, r0, #1
	ldrsb r0, [r1, r0]
	strb r0, [r2, #0x1b]
_0223C3F8:
	mov r0, #2
	bl ov13_02241694
	cmp r0, #0
	beq _0223C424
	ldr r0, _0223C480 @ =0x0224F5B8
	ldr r1, _0223C498 @ =0x02245895
	ldr r2, [r0]
	ldrb r0, [r2, #0x1c]
	lsl r0, r0, #1
	ldrsb r0, [r1, r0]
	strb r0, [r2, #0x1b]
_0223C424:
	ldr r0, _0223C480 @ =0x0224F5B8
	ldr r2, _0223C484 @ =0x02245934
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
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
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
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0223C480: .4byte 0x0224F5B8
_0223C484: .4byte 0x02245934
_0223C488: .4byte 0x02245904
_0223C48C: .4byte 0x0224588A
_0223C490: .4byte 0x022458A8
_0223C494: .4byte 0x02245894
_0223C498: .4byte 0x02245895
	arm_func_end ov13_0223C340

	arm_func_start ov13_0223C49C
ov13_0223C49C: @ 0x0223C49C
	push {r3, lr}
	ldr r2, _0223C500 @ =0x0224F5B8
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
	poplo {r3, pc}
	mov r0, #0
	bl ov13_022425D0
	ldr r1, _0223C504 @ =ov13_0223C7FC
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov13_02242528
	ldr r1, _0223C500 @ =0x0224F5B8
	ldr r1, [r1]
	str r0, [r1, #0x14]
	pop {r3, pc}
	.align 2, 0
_0223C500: .4byte 0x0224F5B8
_0223C504: .4byte ov13_0223C7FC
	arm_func_end ov13_0223C49C

	arm_func_start ov13_0223C508
ov13_0223C508: @ 0x0223C508
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r1, _0223C694 @ =0x0224F5B8
	mov sl, r0
	ldr r0, [r1]
	ldr r1, _0223C698 @ =0x022458D4
	ldrb r2, [r0, #0x1c]
	ldr r0, [r0]
	mov r3, sl
	lsl r2, r2, #2
	ldrh r2, [r1, r2]
	mvn r1, #0
	bl ov13_0223FF18
	ldr r0, _0223C694 @ =0x0224F5B8
	ldr r2, _0223C698 @ =0x022458D4
	ldr r0, [r0]
	add r3, sl, #8
	ldrb r4, [r0, #0x1c]
	ldr r0, [r0, #4]
	mvn r1, #0
	lsl r4, r4, #2
	ldrh r2, [r2, r4]
	add r2, r2, #8
	bl ov13_0223FF18
	ldr r0, _0223C694 @ =0x0224F5B8
	mov r1, sl
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov13_0223C6B0
	ldr r0, _0223C694 @ =0x0224F5B8
	mov r1, sl
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov13_0223C6B0
	ldr r4, _0223C694 @ =0x0224F5B8
	ldr r8, _0223C69C @ =0x02245934
	ldr r0, [r4]
	mov sb, #0
	ldrb r0, [r0, #0x1c]
	ldrb r1, [r8, r0]
	cmp r1, #0
	ble _0223C62C
	ldr r7, _0223C6A0 @ =0x0224588A
	ldr r5, _0223C6A4 @ =0x02245904
	ldr fp, _0223C698 @ =0x022458D4
	mvn r6, #0
_0223C5C0:
	add r1, r7, r0, lsl #1
	ldrb ip, [sb, r1]
	add r2, r5, r0, lsl #3
	add r3, fp, r0, lsl #2
	add r0, r2, ip, lsl #2
	ldr r1, [r4]
	lsl ip, ip, #2
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
	ldr r2, _0223C6A8 @ =0x022458EE
	lsl r3, r0, #2
	ldrh r2, [r2, r3]
	add r3, r1, r2
_0223C650:
	ldr r4, _0223C698 @ =0x022458D4
	lsl r5, r0, #2
	ldr r2, _0223C6AC @ =0x022458EC
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
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0223C694: .4byte 0x0224F5B8
_0223C698: .4byte 0x022458D4
_0223C69C: .4byte 0x02245934
_0223C6A0: .4byte 0x0224588A
_0223C6A4: .4byte 0x02245904
_0223C6A8: .4byte 0x022458EE
_0223C6AC: .4byte 0x022458EC
	arm_func_end ov13_0223C508

	arm_func_start ov13_0223C6B0
ov13_0223C6B0: @ 0x0223C6B0
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	bl ov13_0223FDEC
	mov r7, r0
	cmp r7, #0
	mov r8, #0
	addle sp, sp, #8
	pople {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
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
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov13_0223C6B0

	arm_func_start ov13_0223C73C
ov13_0223C73C: @ 0x0223C73C
	push {r4, lr}
	ldr r1, _0223C7E8 @ =0x0224F5B8
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #8]
	bl ov13_0223FDE0
	ldr r1, _0223C7E8 @ =0x0224F5B8
	mov r2, r0
	ldr r0, [r1]
	ldr r1, _0223C7EC @ =0x0224589E
	ldrb r3, [r0, #0x1c]
	mov r0, #0
	add r1, r1, r3, lsl #1
	ldrb r1, [r4, r1]
	add r1, r1, #1
	bl ov13_022400F0
	ldr r0, _0223C7E8 @ =0x0224F5B8
	ldr r2, _0223C7F0 @ =0x0224588A
	ldr r0, [r0]
	ldr r1, _0223C7F4 @ =0x02245904
	ldrb lr, [r0, #0x1c]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #8]
	add r2, r2, lr, lsl #1
	ldrb r3, [r4, r2]
	add r2, r1, lr, lsl #3
	mvn r1, #0
	lsl ip, r3, #2
	ldrh r2, [ip, r2]
	ldr r3, _0223C7F8 @ =0x02245906
	add r3, r3, lr, lsl #3
	ldrh r3, [ip, r3]
	bl ov13_0223FF18
	ldr r0, _0223C7E8 @ =0x0224F5B8
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #8]
	bl ov13_02240008
	pop {r4, pc}
	.align 2, 0
_0223C7E8: .4byte 0x0224F5B8
_0223C7EC: .4byte 0x0224589E
_0223C7F0: .4byte 0x0224588A
_0223C7F4: .4byte 0x02245904
_0223C7F8: .4byte 0x02245906
	arm_func_end ov13_0223C73C

	arm_func_start ov13_0223C7FC
ov13_0223C7FC: @ 0x0223C7FC
	push {r3, lr}
	ldr r1, _0223C830 @ =0x0224F5B8
	ldr r3, [r1]
	ldrb r2, [r3, #0x1d]
	add r2, r2, #1
	strb r2, [r3, #0x1d]
	ldr r1, [r1]
	ldrb r1, [r1, #0x1d]
	cmp r1, #8
	poplo {r3, pc}
	ldr r1, _0223C834 @ =ov13_0223C838
	bl ov13_022425C8
	pop {r3, pc}
	.align 2, 0
_0223C830: .4byte 0x0224F5B8
_0223C834: .4byte ov13_0223C838
	arm_func_end ov13_0223C7FC

	arm_func_start ov13_0223C838
ov13_0223C838: @ 0x0223C838
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0223C8BC @ =0x0224F5B8
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
	poplt {r4, pc}
	ldr r0, _0223C8BC @ =0x0224F5B8
	ldr r0, [r0]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	beq _0223C8A8
	ldr r1, _0223C8C0 @ =ov13_0223C8C8
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
_0223C8A8:
	ldr r1, _0223C8C4 @ =ov13_0223C924
	mov r0, r4
	bl ov13_022425C8
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0223C8BC: .4byte 0x0224F5B8
_0223C8C0: .4byte ov13_0223C8C8
_0223C8C4: .4byte ov13_0223C924
	arm_func_end ov13_0223C838

	arm_func_start ov13_0223C8C8
ov13_0223C8C8: @ 0x0223C8C8
	push {r4, lr}
	ldr r1, _0223C918 @ =0x0224F5B8
	mov r4, r0
	ldr r3, [r1]
	ldr r0, _0223C91C @ =0x04000050
	ldrsb r2, [r3, #0x1a]
	add r2, r2, #1
	strb r2, [r3, #0x1a]
	ldr r1, [r1]
	ldrsb r1, [r1, #0x1a]
	bl FUN_020CF1A0
	ldr r0, _0223C918 @ =0x0224F5B8
	ldr r0, [r0]
	ldrsb r0, [r0, #0x1a]
	cmp r0, #0
	poplt {r4, pc}
	ldr r1, _0223C920 @ =ov13_0223C924
	mov r0, r4
	bl ov13_022425C8
	pop {r4, pc}
	.align 2, 0
_0223C918: .4byte 0x0224F5B8
_0223C91C: .4byte 0x04000050
_0223C920: .4byte ov13_0223C924
	arm_func_end ov13_0223C8C8

	arm_func_start ov13_0223C924
ov13_0223C924: @ 0x0223C924
	push {r3, r4, r5, r6, r7, lr}
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r1, _0223C9C8 @ =0x0224F5B8
	bic r2, r2, #0xe000
	str r2, [r3]
	ldr r1, [r1]
	mov r6, r0
	ldr r0, [r1]
	bl ov13_0223FD60
	ldr r0, _0223C9C8 @ =0x0224F5B8
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov13_0223FD60
	ldr r7, _0223C9C8 @ =0x0224F5B8
	ldr r4, _0223C9CC @ =0x02245934
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
	ldr r0, _0223C9D0 @ =0x0224F5B8
	bl ov13_022412B0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223C9C8: .4byte 0x0224F5B8
_0223C9CC: .4byte 0x02245934
_0223C9D0: .4byte 0x0224F5B8
	arm_func_end ov13_0223C924

	arm_func_start ov13_0223C9D4
ov13_0223C9D4: @ 0x0223C9D4
	push {r3, lr}
	ldr r2, _0223CA10 @ =0x0224F5BC
	add r1, r0, #0x160
	str r0, [r2]
	add r0, r1, #0x1b000
	bl ov13_0223D66C
	ldr r1, _0223CA10 @ =0x0224F5BC
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x1b000
	str r2, [r0, #0x140]
	ldr r0, [r1]
	add r0, r0, #0x1b000
	str r2, [r0, #0x144]
	pop {r3, pc}
	.align 2, 0
_0223CA10: .4byte 0x0224F5BC
	arm_func_end ov13_0223C9D4

	arm_func_start ov13_0223CA14
ov13_0223CA14: @ 0x0223CA14
	push {r4, r5, lr}
	sub sp, sp, #0x7c
	mov r5, r0
	add r0, sp, #0x28
	mov r4, r1
	bl FUN_020D3C5C
	ldrb r2, [sp, #0x12]
	ldrb r1, [sp, #0x29]
	ldrh r3, [sp, #0x42]
	bic r2, r2, #0xf
	and r1, r1, #0xf
	orr r2, r2, r1
	strb r2, [sp, #0x12]
	add r0, sp, #0x2c
	add r1, sp, #0x14
	lsl r2, r3, #1
	strb r3, [sp, #0x13]
	bl FUN_020D4A50
	ldrb r2, [sp, #0x12]
	ldr r0, _0223CB2C @ =0x0224F5BC
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
	ldr r0, _0223CB2C @ =0x0224F5BC
	add r1, sp, #0x12
	ldr r0, [r0]
	mov r2, r5
	add r0, r0, #0x1b000
	ldr r0, [r0, #0x140]
	mov r3, r4
	bl ov13_0221F6B0
	cmp r0, #0
	beq _0223CB08
	bl FUN_020D3F48
_0223CB08:
	mov r0, #0x100
	mov r1, #1
	bl ov13_0221F904
	ldr r0, _0223CB30 @ =ov13_0223D124
	bl ov13_0221BA70
	mov r0, #1
	bl ov13_0223D448
	add sp, sp, #0x7c
	pop {r4, r5, pc}
	.align 2, 0
_0223CB2C: .4byte 0x0224F5BC
_0223CB30: .4byte ov13_0223D124
	arm_func_end ov13_0223CA14

	arm_func_start ov13_0223CB34
ov13_0223CB34: @ 0x0223CB34
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #2
	bl ov13_0223D448
	mov r0, r4
	bl ov13_0221FC54
	cmp r0, #0
	beq _0223CB64
	mov r0, #7
	bl ov13_0223D448
	pop {r3, r4, r5, pc}
_0223CB64:
	mov r0, r5
	bl ov13_0223CB7C
	cmp r0, #0
	popne {r3, r4, r5, pc}
	bl FUN_020D3F48
	pop {r3, r4, r5, pc}
	arm_func_end ov13_0223CB34

	arm_func_start ov13_0223CB7C
ov13_0223CB7C: @ 0x0223CB7C
	push {r4, r5, r6, lr}
	sub sp, sp, #0x48
	mov r6, r0
	ldr r0, [r6]
	mov r5, #0
	cmp r0, #0
	moveq r4, r5
	beq _0223CBC4
	add r0, sp, #0
	bl FUN_020D7F98
	ldr r1, [r6]
	add r0, sp, #0
	bl FUN_020D8278
	cmp r0, #0
	addeq sp, sp, #0x48
	moveq r0, r5
	popeq {r4, r5, r6, pc}
	add r4, sp, #0
_0223CBC4:
	mov r0, r4
	bl ov13_0221CE4C
	cmp r0, #0
	beq _0223CC30
	ldr r1, _0223CC4C @ =0x0224F5BC
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
	bl ov13_0221CECC
	cmp r0, #0
	beq _0223CC30
	ldr r1, _0223CC4C @ =0x0224F5BC
	mov r0, r6
	ldr r1, [r1]
	add r1, r1, #0x1b000
	ldr r1, [r1, #0x144]
	bl ov13_0221D3BC
	cmp r0, #0
	movne r5, #1
_0223CC30:
	add r0, sp, #0
	cmp r4, r0
	bne _0223CC40
	bl FUN_020D82C0
_0223CC40:
	mov r0, r5
	add sp, sp, #0x48
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223CC4C: .4byte 0x0224F5BC
	arm_func_end ov13_0223CB7C

	arm_func_start ov13_0223CC50
ov13_0223CC50: @ 0x0223CC50
	push {r3, r4, r5, lr}
	mov r1, #1
	mov r4, r0
	bl ov13_0221BB70
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #1
	mvn r0, r0, lsl r4
	lsl r5, r0, #0x10
	bl FUN_020D3A38
	ldr r1, _0223CCEC @ =0x0224F5BC
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
	bl FUN_020D3A4C
	mov r0, r4
	bl ov13_0221FD8C
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223CCEC: .4byte 0x0224F5BC
	arm_func_end ov13_0223CC50

	arm_func_start ov13_0223CCF0
ov13_0223CCF0: @ 0x0223CCF0
	push {r3, r4, r5, lr}
	mov r1, #0
	mov r4, r0
	bl ov13_0221BB70
	cmp r0, #0
	bne _0223CD8C
	mov r0, #1
	mvn r0, r0, lsl r4
	lsl r5, r0, #0x10
	bl FUN_020D3A38
	ldr r1, _0223CDC4 @ =0x0224F5BC
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
	bl FUN_020D3A4C
	mov r0, r4
	bl ov13_0221FD8C
	pop {r3, r4, r5, pc}
_0223CD8C:
	bl FUN_020D3A38
	ldr r1, _0223CDC4 @ =0x0224F5BC
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
	bl FUN_020D3A4C
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223CDC4: .4byte 0x0224F5BC
	arm_func_end ov13_0223CCF0

	arm_func_start ov13_0223CDC8
ov13_0223CDC8: @ 0x0223CDC8
	push {r3, r4, r5, lr}
	mov r1, #2
	mov r4, r0
	bl ov13_0221BB70
	cmp r0, #0
	bne _0223CE64
	mov r0, #1
	mvn r0, r0, lsl r4
	lsl r5, r0, #0x10
	bl FUN_020D3A38
	ldr r1, _0223CE9C @ =0x0224F5BC
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
	bl FUN_020D3A4C
	mov r0, r4
	bl ov13_0221FD8C
	pop {r3, r4, r5, pc}
_0223CE64:
	bl FUN_020D3A38
	ldr r1, _0223CE9C @ =0x0224F5BC
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
	bl FUN_020D3A4C
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223CE9C: .4byte 0x0224F5BC
	arm_func_end ov13_0223CDC8

	arm_func_start ov13_0223CEA0
ov13_0223CEA0: @ 0x0223CEA0
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #3
	bl ov13_0223D448
	mov r5, #1
	ldr r7, _0223CF7C @ =0x0224F5BC
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
	lsl r6, r0, #0x10
	bl FUN_020D3A38
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
	bl FUN_020D3A4C
	mov r0, r5
	bl ov13_0221FD8C
	b _0223CF64
_0223CF5C:
	mov r0, r5
	bl ov13_0223CDC8
_0223CF64:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x10
	blo _0223CEB8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223CF7C: .4byte 0x0224F5BC
	arm_func_end ov13_0223CEA0

	arm_func_start ov13_0223CF80
ov13_0223CF80: @ 0x0223CF80
	push {r4, r5, r6, lr}
	ldr r4, _0223CFE4 @ =0x0224F5BC
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, pc}
	mov r6, #1
	mov r5, r6
_0223CFA4:
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	tst r0, r5, lsl r6
	beq _0223CFC8
	mov r0, r6
	bl ov13_0221BB1C
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, pc}
_0223CFC8:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #0x10
	blo _0223CFA4
	mov r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223CFE4: .4byte 0x0224F5BC
	arm_func_end ov13_0223CF80

	arm_func_start ov13_0223CFE8
ov13_0223CFE8: @ 0x0223CFE8
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, #1
	ldr r4, _0223D0DC @ =0x0224F5BC
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
	bl ov13_0221BB70
	cmp r0, #0
	orrne r0, r8, r6, lsl r7
	lslne r0, r0, #0x10
	lsrne r8, r0, #0x10
	bne _0223D0A8
	mvn r0, r6, lsl r7
	lsl sb, r0, #0x10
	bl FUN_020D3A38
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
	bl FUN_020D3A4C
	mov r0, r7
	bl ov13_0221FD8C
_0223D0A8:
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r7, #0x10
	blo _0223D000
	cmp r8, #0
	bne _0223D0D0
	mov r0, #7
	bl ov13_0223D448
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_0223D0D0:
	mov r0, #4
	bl ov13_0223D448
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0223D0DC: .4byte 0x0224F5BC
	arm_func_end ov13_0223CFE8

	arm_func_start ov13_0223D0E0
ov13_0223D0E0: @ 0x0223D0E0
	push {r3, lr}
	mov r0, #6
	bl ov13_0223D448
	bl ov13_0221FD50
	pop {r3, pc}
	arm_func_end ov13_0223D0E0

	arm_func_start ov13_0223D0F4
ov13_0223D0F4: @ 0x0223D0F4
	push {r3, lr}
	ldr r0, _0223D120 @ =0x0224F5BC
	ldr r2, [r0]
	ldrh r0, [r2]
	cmp r0, #4
	ldrheq r1, [r2, #2]
	ldrheq r0, [r2, #0xc]
	cmpeq r1, r0
	popne {r3, pc}
	bl ov13_0221FD50
	pop {r3, pc}
	.align 2, 0
_0223D120: .4byte 0x0224F5BC
	arm_func_end ov13_0223D0F4

	arm_func_start ov13_0223D124
ov13_0223D124: @ 0x0223D124
	push {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r2
	cmp r1, #0xe
	addls pc, pc, r1, lsl #2
	b _0223D43C
_0223D13C: @ jump table
	b _0223D43C @ case 0
	pop {r4, r5, r6, pc} @ case 1
	b _0223D178 @ case 2
	b _0223D200 @ case 3
	pop {r4, r5, r6, pc} @ case 4
	pop {r4, r5, r6, pc} @ case 5
	pop {r4, r5, r6, pc} @ case 6
	b _0223D33C @ case 7
	pop {r4, r5, r6, pc} @ case 8
	b _0223D36C @ case 9
	b _0223D28C @ case 10
	pop {r4, r5, r6, pc} @ case 11
	b _0223D3A0 @ case 12
	b _0223D3FC @ case 13
	b _0223D2F8 @ case 14
_0223D178:
	bl ov13_0223D45C
	cmp r0, #2
	popne {r4, r5, r6, pc}
	ldr r0, _0223D444 @ =0x0224F5BC
	ldr r6, [r0]
	bl FUN_020D3A38
	ldrh r2, [r6, #2]
	mov r1, #1
	orr r1, r2, r1, lsl r5
	strh r1, [r6, #2]
	bl FUN_020D3A4C
	ldr r1, _0223D444 @ =0x0224F5BC
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
	pop {r4, r5, r6, pc}
_0223D200:
	bl ov13_0223D4C8
	cmp r0, #6
	popeq {r4, r5, r6, pc}
	mov r0, #1
	mvn r0, r0, lsl r5
	lsl r4, r0, #0x10
	bl FUN_020D3A38
	ldr r1, _0223D444 @ =0x0224F5BC
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
	bl FUN_020D3A4C
	bl ov13_0223D0F4
	pop {r4, r5, r6, pc}
_0223D28C:
	bl ov13_0223D45C
	cmp r0, #2
	beq _0223D2A4
	mov r0, r5
	bl ov13_0223CCF0
	pop {r4, r5, r6, pc}
_0223D2A4:
	ldr r0, _0223D444 @ =0x0224F5BC
	mov r1, #1
	ldr r3, [r0]
	mov r0, r5
	ldrh r2, [r3, #4]
	orr r1, r2, r1, lsl r5
	strh r1, [r3, #4]
	bl ov13_0223CC50
	mov r0, r5
	bl ov13_0221BA98
	cmp r0, #0
	popeq {r4, r5, r6, pc}
	ldr r1, _0223D444 @ =0x0224F5BC
	sub r2, r5, #1
	ldr r3, [r1]
	mov r1, #0x1e
	add r3, r3, #0xe
	mla r1, r2, r1, r3
	mov r2, #0x16
	bl FUN_020D4A50
	pop {r4, r5, r6, pc}
_0223D2F8:
	ldr r0, _0223D444 @ =0x0224F5BC
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
	popne {r4, r5, r6, pc}
	mov r0, r5
	bl ov13_0223CDC8
	pop {r4, r5, r6, pc}
_0223D33C:
	ldr r0, _0223D444 @ =0x0224F5BC
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
	pop {r4, r5, r6, pc}
_0223D36C:
	ldr r0, _0223D444 @ =0x0224F5BC
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
	pop {r4, r5, r6, pc}
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
	ldr r0, _0223D444 @ =0x0224F5BC
	ldr r0, [r0]
	add r0, r0, #0x1b000
	ldr r1, [r0, #0x144]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0x144]
	ldr r0, _0223D444 @ =0x0224F5BC
	ldr r0, [r0]
	add r0, r0, #0x1b000
	ldr r1, [r0, #0x140]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0x140]
	pop {r4, r5, r6, pc}
_0223D3FC:
	ldrh r0, [r4]
	cmp r0, #8
	bgt _0223D428
	popge {r4, r5, r6, pc}
	cmp r0, #2
	popgt {r4, r5, r6, pc}
	cmp r0, #1
	poplt {r4, r5, r6, pc}
	cmpne r0, #2
	beq _0223D430
	pop {r4, r5, r6, pc}
_0223D428:
	cmp r0, #9
	popne {r4, r5, r6, pc}
_0223D430:
	mov r0, #7
	bl ov13_0223D448
	pop {r4, r5, r6, pc}
_0223D43C:
	bl FUN_020D3F48
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223D444: .4byte 0x0224F5BC
	arm_func_end ov13_0223D124

	arm_func_start ov13_0223D448
ov13_0223D448: @ 0x0223D448
	ldr r1, _0223D458 @ =0x0224F5BC
	ldr r1, [r1]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0223D458: .4byte 0x0224F5BC
	arm_func_end ov13_0223D448

	arm_func_start ov13_0223D45C
ov13_0223D45C: @ 0x0223D45C
	ldr r0, _0223D46C @ =0x0224F5BC
	ldr r0, [r0]
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0223D46C: .4byte 0x0224F5BC
	arm_func_end ov13_0223D45C

	arm_func_start ov13_0223D470
ov13_0223D470: @ 0x0223D470
	ldr r2, _0223D4BC @ =0x0224F5BC
	ldr r1, _0223D4C0 @ =0x022468D8
	ldr ip, [r2]
	ldr r2, _0223D4C4 @ =0x022468D8
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
	.align 2, 0
_0223D4BC: .4byte 0x0224F5BC
_0223D4C0: .4byte 0x022468D8
_0223D4C4: .4byte 0x022468D8
	arm_func_end ov13_0223D470

	arm_func_start ov13_0223D4C8
ov13_0223D4C8: @ 0x0223D4C8
	push {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r4, r0
	bl FUN_020D3A38
	ldr r1, _0223D58C @ =0x0224F5BC
	mov r3, #1
	ldr r2, [r1]
	lsl r3, r3, r4
	ldrh r1, [r2, #2]
	lsl r4, r3, #0x10
	mov r5, r0
	tst r1, r4, lsr #16
	bne _0223D50C
	bl FUN_020D3A4C
	add sp, sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223D50C:
	mov r0, r2
	add r1, sp, #0
	mov r2, #0xe
	bl FUN_020D4A50
	mov r0, r5
	bl FUN_020D3A4C
	ldrh r0, [sp, #4]
	tst r0, r4, lsr #16
	addne sp, sp, #0x10
	movne r0, #2
	popne {r3, r4, r5, pc}
	ldrh r0, [sp, #6]
	tst r0, r4, lsr #16
	addne sp, sp, #0x10
	movne r0, #3
	popne {r3, r4, r5, pc}
	ldrh r0, [sp, #8]
	tst r0, r4, lsr #16
	addne sp, sp, #0x10
	movne r0, #4
	popne {r3, r4, r5, pc}
	ldrh r0, [sp, #0xa]
	tst r0, r4, lsr #16
	addne sp, sp, #0x10
	movne r0, #5
	popne {r3, r4, r5, pc}
	ldrh r0, [sp, #0xc]
	tst r0, r4, lsr #16
	movne r0, #6
	moveq r0, #1
	add sp, sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223D58C: .4byte 0x0224F5BC
	arm_func_end ov13_0223D4C8

	arm_func_start ov13_0223D590
ov13_0223D590: @ 0x0223D590
	ldr r1, _0223D5C0 @ =0x0224F5BC
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
	.align 2, 0
_0223D5C0: .4byte 0x0224F5BC
	arm_func_end ov13_0223D590

	arm_func_start ov13_0223D5C4
ov13_0223D5C4: @ 0x0223D5C4
	push {r4, r5, r6, r7, r8, lr}
	ldr r1, _0223D668 @ =0x0224F5BC
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
	ldrbeq r8, [r0, #1]
	ldrbeq r7, [r2, #1]
	cmpeq r8, r7
	ldrbeq r8, [r0, #2]
	ldrbeq r7, [r2, #2]
	cmpeq r8, r7
	ldrbeq r8, [r0, #3]
	ldrbeq r7, [r2, #3]
	cmpeq r8, r7
	ldrbeq r8, [r0, #4]
	ldrbeq r7, [r2, #4]
	cmpeq r8, r7
	ldrbeq r7, [r0, #5]
	ldrbeq r2, [r2, #5]
	cmpeq r7, r2
	addeq r0, r5, r3
	ldrheq r0, [r0, #0x2a]
	popeq {r4, r5, r6, r7, r8, pc}
_0223D64C:
	add r2, lr, #1
	lsl r2, r2, #0x10
	lsr lr, r2, #0x10
	cmp lr, #2
	blo _0223D5E4
	mov r0, #0
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223D668: .4byte 0x0224F5BC
	arm_func_end ov13_0223D5C4

	arm_func_start ov13_0223D66C
ov13_0223D66C: @ 0x0223D66C
	ldr r1, _0223D6A4 @ =0x0224F5C0
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
	.align 2, 0
_0223D6A4: .4byte 0x0224F5C0
	arm_func_end ov13_0223D66C

	arm_func_start ov13_0223D6A8
ov13_0223D6A8: @ 0x0223D6A8
	push {r4, lr}
	ldr r1, _0223D714 @ =0x0224F5C0
	mov r4, r0
	ldr r3, [r1]
	cmp r3, #0
	beq _0223D6DC
	ldr r1, [r1, #4]
	ldr r0, _0223D718 @ =0x02247120
	ldr r2, [r1, #0x40]
	ldr r1, _0223D71C @ =0x02247200
	ldr r2, [r0, r2, lsl #2]
	mov r0, #0x8000000
	blx r3
_0223D6DC:
	ldr r0, _0223D714 @ =0x0224F5C0
	ldr r1, [r0, #4]
	str r4, [r1, #0x40]
	ldr r3, [r0]
	cmp r3, #0
	popeq {r4, pc}
	ldr r1, [r0, #4]
	ldr r0, _0223D718 @ =0x02247120
	ldr r2, [r1, #0x40]
	ldr r1, _0223D720 @ =0x02247208
	ldr r2, [r0, r2, lsl #2]
	mov r0, #0x8000000
	blx r3
	pop {r4, pc}
	.align 2, 0
_0223D714: .4byte 0x0224F5C0
_0223D718: .4byte 0x02247120
_0223D71C: .4byte 0x02247200
_0223D720: .4byte 0x02247208
	arm_func_end ov13_0223D6A8

	arm_func_start ov13_0223D724
ov13_0223D724: @ 0x0223D724
	ldr r1, _0223D740 @ =0x0224F5C0
	ldr r2, [r1, #4]
	ldr r1, [r2, #0x40]
	sub r1, r1, #9
	cmp r1, #1
	strhi r0, [r2, #0x54]
	bx lr
	.align 2, 0
_0223D740: .4byte 0x0224F5C0
	arm_func_end ov13_0223D724

	arm_func_start ov13_0223D744
ov13_0223D744: @ 0x0223D744
	push {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r1, _0223D780 @ =0x0224F5C0
	ldr r0, _0223D784 @ =ov13_0223D788
	ldr r1, [r1, #4]
	bl FUN_020DF4F8
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0223D780: .4byte 0x0224F5C0
_0223D784: .4byte ov13_0223D788
	arm_func_end ov13_0223D744

	arm_func_start ov13_0223D788
ov13_0223D788: @ 0x0223D788
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223D7A8
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	pop {r3, pc}
_0223D7A8:
	ldr r0, _0223D7F0 @ =0x0224F5C0
	ldr r0, [r0, #4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x3ac]
	cmp r0, #0
	beq _0223D7D8
	bl ov13_0223D7F4
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223D6A8
	pop {r3, pc}
_0223D7D8:
	bl ov13_0223D890
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223D6A8
	pop {r3, pc}
	.align 2, 0
_0223D7F0: .4byte 0x0224F5C0
	arm_func_end ov13_0223D788

	arm_func_start ov13_0223D7F4
ov13_0223D7F4: @ 0x0223D7F4
	push {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223D850 @ =0x0224F5C0
	ldr r1, [r0, #4]
	add r0, r1, #0x1000
	ldr r2, [r0, #0x3ac]
	add r0, r1, #0x13c0
	blx r2
	ldr r2, _0223D850 @ =0x0224F5C0
	mov r1, r0
	ldr r2, [r2, #4]
	ldr r0, _0223D854 @ =ov13_0223D858
	add r2, r2, #0x13c0
	bl FUN_020E0C9C
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0223D850: .4byte 0x0224F5C0
_0223D854: .4byte ov13_0223D858
	arm_func_end ov13_0223D7F4

	arm_func_start ov13_0223D858
ov13_0223D858: @ 0x0223D858
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223D878
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	pop {r3, pc}
_0223D878:
	bl ov13_0223D890
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223D6A8
	pop {r3, pc}
	arm_func_end ov13_0223D858

	arm_func_start ov13_0223D890
ov13_0223D890: @ 0x0223D890
	push {r3, lr}
	ldr r0, _0223D8EC @ =0x0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	sub r0, r0, #4
	cmp r0, #2
	movls r0, #1
	popls {r3, pc}
	ldr r0, _0223D8F0 @ =ov13_0223D8F4
	bl FUN_020DF680
	cmp r0, #2
	beq _0223D8CC
	bl ov13_0223D724
	mov r0, #0
	pop {r3, pc}
_0223D8CC:
	ldr r1, _0223D8EC @ =0x0224F5C0
	mov r3, #0
	ldr r2, [r1, #4]
	mov r0, #1
	strh r3, [r2, #0x50]
	ldr r1, [r1, #4]
	strh r0, [r1, #0x52]
	pop {r3, pc}
	.align 2, 0
_0223D8EC: .4byte 0x0224F5C0
_0223D8F0: .4byte ov13_0223D8F4
	arm_func_end ov13_0223D890

	arm_func_start ov13_0223D8F4
ov13_0223D8F4: @ 0x0223D8F4
	push {r3, r4, r5, lr}
	mov r4, r0
	ldrh r2, [r4, #0x10]
	ldrh r0, [r4, #2]
	mov r1, #1
	lsl r1, r1, r2
	cmp r0, #0
	lsl r5, r1, #0x10
	beq _0223D928
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	pop {r3, r4, r5, pc}
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
	popeq {r3, r4, r5, pc}
	b _0223DA30
_0223D958:
	cmp ip, #9
	beq _0223D9E0
	b _0223DA30
_0223D964:
	ldr r0, _0223DA54 @ =0x0224F5C0
	ldr r3, [r0]
	cmp r3, #0
	beq _0223D980
	ldr r1, _0223DA58 @ =0x0224720C
	mov r0, #0x8000000
	blx r3
_0223D980:
	ldr r0, _0223DA54 @ =0x0224F5C0
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
	bl FUN_020DFA18
	cmp r0, #2
	popeq {r3, r4, r5, pc}
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	pop {r3, r4, r5, pc}
_0223D9C8:
	ldr r0, _0223DA54 @ =0x0224F5C0
	ldr r1, [r0, #4]
	ldrh r0, [r1, #0x52]
	orr r0, r0, r5, lsr #16
	strh r0, [r1, #0x52]
	pop {r3, r4, r5, pc}
_0223D9E0:
	ldr r0, _0223DA54 @ =0x0224F5C0
	ldr r3, [r0]
	cmp r3, #0
	beq _0223D9FC
	ldr r1, _0223DA5C @ =0x02247238
	mov r0, #0x8000000
	blx r3
_0223D9FC:
	ldr r0, _0223DA54 @ =0x0224F5C0
	mvn r1, r5, lsr #16
	ldr r2, [r0, #4]
	ldrh r0, [r2, #0x52]
	and r0, r0, r1
	strh r0, [r2, #0x52]
	pop {r3, r4, r5, pc}
_0223DA18:
	bl ov13_0223DA64
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #9
	bl ov13_0223D6A8
	pop {r3, r4, r5, pc}
_0223DA30:
	ldr r0, _0223DA54 @ =0x0224F5C0
	ldr r3, [r0]
	cmp r3, #0
	popeq {r3, r4, r5, pc}
	ldr r1, _0223DA60 @ =0x02247264
	mov r2, ip
	mov r0, #0x8000000
	blx r3
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223DA54: .4byte 0x0224F5C0
_0223DA58: .4byte 0x0224720C
_0223DA5C: .4byte 0x02247238
_0223DA60: .4byte 0x02247264
	arm_func_end ov13_0223D8F4

	arm_func_start ov13_0223DA64
ov13_0223DA64: @ 0x0223DA64
	push {r3, lr}
	sub sp, sp, #8
	ldr r0, _0223DAF4 @ =0x0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	sub r0, r0, #4
	cmp r0, #2
	addls sp, sp, #8
	movls r0, #1
	popls {r3, pc}
	mov r0, #4
	bl ov13_0223D6A8
	ldr r0, _0223DAF4 @ =0x0224F5C0
	mov ip, #1
	ldr lr, [r0, #4]
	ldr r0, _0223DAF8 @ =ov13_0223DAFC
	add r3, lr, #0x1000
	ldr r1, [r3, #0x2a0]
	add r2, lr, #0x60
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	stm sp, {r1, ip}
	ldr r3, [r3, #0x2a4]
	add r1, r2, #0x1000
	lsl r2, r3, #0x10
	lsr r2, r2, #0x10
	add r3, lr, #0xf80
	bl FUN_020DFD14
	cmp r0, #2
	addeq sp, sp, #8
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0223DAF4: .4byte 0x0224F5C0
_0223DAF8: .4byte ov13_0223DAFC
	arm_func_end ov13_0223DA64

	arm_func_start ov13_0223DAFC
ov13_0223DAFC: @ 0x0223DAFC
	push {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _0223DB20
	mov r0, r1
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	pop {r3, pc}
_0223DB20:
	ldrh r2, [r0, #4]
	sub r0, r2, #0xa
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0223DBFC
_0223DB34: @ jump table
	b _0223DB44 @ case 0
	pop {r3, pc} @ case 1
	b _0223DBFC @ case 2
	b _0223DBFC @ case 3
_0223DB44:
	ldr r0, _0223DC1C @ =0x0224F5C0
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x44]
	cmp r0, #2
	bne _0223DBA4
	ldr r0, [r1, #0x40]
	cmp r0, #4
	bne _0223DB98
	bl ov13_0223DC28
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0223DC1C @ =0x0224F5C0
	ldr r2, [r0]
	cmp r2, #0
	beq _0223DB8C
	ldr r1, _0223DC20 @ =0x02247284
	mov r0, #0x8000000
	blx r2
_0223DB8C:
	mov r0, #9
	bl ov13_0223D6A8
	pop {r3, pc}
_0223DB98:
	cmp r0, #6
	bne _0223DBF0
	pop {r3, pc}
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
	bl FUN_020E00F4
	cmp r0, #0
	beq _0223DBE4
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	pop {r3, pc}
_0223DBE4:
	mov r0, #5
	bl ov13_0223D6A8
	pop {r3, pc}
_0223DBF0:
	mov r0, #4
	bl ov13_0223D6A8
	pop {r3, pc}
_0223DBFC:
	ldr r0, _0223DC1C @ =0x0224F5C0
	ldr r3, [r0]
	cmp r3, #0
	popeq {r3, pc}
	ldr r1, _0223DC24 @ =0x02247264
	mov r0, #0x8000000
	blx r3
	pop {r3, pc}
	.align 2, 0
_0223DC1C: .4byte 0x0224F5C0
_0223DC20: .4byte 0x02247284
_0223DC24: .4byte 0x02247264
	arm_func_end ov13_0223DAFC

	arm_func_start ov13_0223DC28
ov13_0223DC28: @ 0x0223DC28
	push {r3, lr}
	mov r0, #6
	bl ov13_0223D6A8
	ldr r0, _0223DC60 @ =0x0224F5C0
	mov r1, #0xd
	ldr r0, [r0, #4]
	add r0, r0, #0x1e00
	bl FUN_020E0C74
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0223DC60: .4byte 0x0224F5C0
	arm_func_end ov13_0223DC28

	arm_func_start ov13_0223DC64
ov13_0223DC64: @ 0x0223DC64
	push {r3, lr}
	ldr r0, _0223DC90 @ =0x0224F5C0
	ldr r0, [r0, #4]
	add r0, r0, #0x1e00
	bl FUN_020E0C90
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0223DC90: .4byte 0x0224F5C0
	arm_func_end ov13_0223DC64

	arm_func_start ov13_0223DC94
ov13_0223DC94: @ 0x0223DC94
	push {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223DCC0 @ =ov13_0223DCC4
	bl FUN_020DFEAC
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0223DCC0: .4byte ov13_0223DCC4
	arm_func_end ov13_0223DC94

	arm_func_start ov13_0223DCC4
ov13_0223DCC4: @ 0x0223DCC4
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223DCE0
	bl ov13_0223D724
	bl ov13_0223E698
	pop {r3, pc}
_0223DCE0:
	bl ov13_0223DD18
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0223DD10 @ =0x0224F5C0
	ldr r2, [r0]
	cmp r2, #0
	beq _0223DD08
	ldr r1, _0223DD14 @ =0x022472B4
	mov r0, #0x8000000
	blx r2
_0223DD08:
	bl ov13_0223E698
	pop {r3, pc}
	.align 2, 0
_0223DD10: .4byte 0x0224F5C0
_0223DD14: .4byte 0x022472B4
	arm_func_end ov13_0223DCC4

	arm_func_start ov13_0223DD18
ov13_0223DD18: @ 0x0223DD18
	push {r3, lr}
	ldr r0, _0223DD3C @ =ov13_0223DD40
	bl FUN_020DF690
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0223DD3C: .4byte ov13_0223DD40
	arm_func_end ov13_0223DD18

	arm_func_start ov13_0223DD40
ov13_0223DD40: @ 0x0223DD40
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223DD58
	bl ov13_0223D724
	pop {r3, pc}
_0223DD58:
	mov r0, #1
	bl ov13_0223D6A8
	pop {r3, pc}
	arm_func_end ov13_0223DD40

	arm_func_start ov13_0223DD64
ov13_0223DD64: @ 0x0223DD64
	push {r3, lr}
	ldr r0, _0223DDB0 @ =0x0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #6
	movne r0, #0
	popne {r3, pc}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223DDB0 @ =0x0224F5C0
	ldr r0, [r0, #4]
	add r0, r0, #0x1e00
	bl FUN_020E0C90
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0223DDB0: .4byte 0x0224F5C0
	arm_func_end ov13_0223DD64

	arm_func_start ov13_0223DDB4
ov13_0223DDB4: @ 0x0223DDB4
	push {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223DDE0 @ =ov13_0223DDE4
	bl FUN_020DFEAC
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0223DDE0: .4byte ov13_0223DDE4
	arm_func_end ov13_0223DDB4

	arm_func_start ov13_0223DDE4
ov13_0223DDE4: @ 0x0223DDE4
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223DE00
	bl ov13_0223D724
	bl ov13_0223E6B4
	pop {r3, pc}
_0223DE00:
	bl ov13_0223DE18
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223D6A8
	pop {r3, pc}
	arm_func_end ov13_0223DDE4

	arm_func_start ov13_0223DE18
ov13_0223DE18: @ 0x0223DE18
	push {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223DE4C @ =ov13_0223DE50
	mov r1, #0
	bl FUN_020DFA18
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	bl ov13_0223E698
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0223DE4C: .4byte ov13_0223DE50
	arm_func_end ov13_0223DE18

	arm_func_start ov13_0223DE50
ov13_0223DE50: @ 0x0223DE50
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223DE68
	bl ov13_0223D724
	pop {r3, pc}
_0223DE68:
	mov r0, #1
	bl ov13_0223D6A8
	pop {r3, pc}
	arm_func_end ov13_0223DE50

	arm_func_start ov13_0223DE74
ov13_0223DE74: @ 0x0223DE74
	push {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223DEA0 @ =ov13_0223DEA4
	bl FUN_020DF480
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0223DEA0: .4byte ov13_0223DEA4
	arm_func_end ov13_0223DE74

	arm_func_start ov13_0223DEA4
ov13_0223DEA4: @ 0x0223DEA4
	push {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0223DECC
	mov r0, #9
	bl ov13_0223D6A8
	ldrh r0, [r4, #2]
	bl ov13_0223D724
	pop {r4, pc}
_0223DECC:
	mov r0, #1
	bl ov13_0223D6A8
	pop {r4, pc}
	arm_func_end ov13_0223DEA4

	arm_func_start ov13_0223DED8
ov13_0223DED8: @ 0x0223DED8
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223DEF4
	mov r0, #0xa
	bl ov13_0223D6A8
	pop {r3, pc}
_0223DEF4:
	mov r0, #0
	bl ov13_0223D6A8
	pop {r3, pc}
	arm_func_end ov13_0223DED8

	arm_func_start ov13_0223DF00
ov13_0223DF00: @ 0x0223DF00
	ldr r1, _0223DF10 @ =0x0224F5C0
	ldr r1, [r1, #4]
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0223DF10: .4byte 0x0224F5C0
	arm_func_end ov13_0223DF00

	arm_func_start ov13_0223DF14
ov13_0223DF14: @ 0x0223DF14
	ldr r0, _0223DF24 @ =0x0224F5C0
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0x52]
	bx lr
	.align 2, 0
_0223DF24: .4byte 0x0224F5C0
	arm_func_end ov13_0223DF14

	arm_func_start ov13_0223DF28
ov13_0223DF28: @ 0x0223DF28
	ldr r0, _0223DF38 @ =0x0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	bx lr
	.align 2, 0
_0223DF38: .4byte 0x0224F5C0
	arm_func_end ov13_0223DF28

	arm_func_start ov13_0223DF3C
ov13_0223DF3C: @ 0x0223DF3C
	push {r3, lr}
	sub sp, sp, #8
	add r0, sp, #0
	bl FUN_020D3C40
	ldr r2, _0223E008 @ =0x027FFC3C
	ldrh r0, [sp]
	ldr r3, [r2]
	ldrh r2, [sp, #2]
	add r0, r0, r3
	ldr r1, _0223E00C @ =0x0224F5C0
	add r2, r2, r0
	ldrh r3, [sp, #4]
	ldr r0, [r1, #4]
	add r2, r3, r2
	str r2, [r0, #0x58]
	ldr ip, [r1, #4]
	ldr r0, _0223E010 @ =0x00010DCD
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
	pop {r3, pc}
_0223DFE0:
	cmp r0, #2
	addeq sp, sp, #8
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	mov r0, #0
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0223E008: .4byte 0x027FFC3C
_0223E00C: .4byte 0x0224F5C0
_0223E010: .4byte 0x00010DCD
	arm_func_end ov13_0223DF3C

	arm_func_start ov13_0223E014
ov13_0223E014: @ 0x0223E014
	push {r4, lr}
	mov r4, r0
	bl FUN_020DEF24
	cmp r0, #0x8000
	bne _0223E040
	mov r0, #3
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	mov r0, #3
	pop {r4, pc}
_0223E040:
	cmp r0, #0
	bne _0223E060
	mov r0, #0x16
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	mov r0, #0x18
	pop {r4, pc}
_0223E060:
	sub r1, r4, #1
	mov r2, #1
	tst r0, r2, lsl r1
	bne _0223E094
_0223E070:
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #0x10
	movhi r0, #0x18
	pophi {r4, pc}
	sub r1, r4, #1
	tst r0, r2, lsl r1
	beq _0223E070
_0223E094:
	ldr r0, _0223E0AC @ =ov13_0223E0B0
	mov r1, r4
	bl ov13_0223E188
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, pc}
	.align 2, 0
_0223E0AC: .4byte ov13_0223E0B0
	arm_func_end ov13_0223E014

	arm_func_start ov13_0223E0B0
ov13_0223E0B0: @ 0x0223E0B0
	push {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0223E0D4
	bl ov13_0223D724
	mov r0, #9
	bl ov13_0223D6A8
	pop {r4, pc}
_0223E0D4:
	ldr r0, _0223E180 @ =0x0224F5C0
	ldr ip, [r0]
	cmp ip, #0
	beq _0223E0F8
	ldrh r2, [r4, #8]
	ldrh r3, [r4, #0xa]
	ldr r1, _0223E184 @ =0x0224730C
	mov r0, #0x8000000
	blx ip
_0223E0F8:
	ldr r0, _0223E180 @ =0x0224F5C0
	ldrh r2, [r4, #0xa]
	ldr r3, [r0, #4]
	ldrh ip, [r4, #8]
	ldrh r1, [r3, #0x5e]
	cmp r1, r2
	bls _0223E130
	strh r2, [r3, #0x5e]
	sub r1, ip, #1
	mov r2, #1
	lsl r1, r2, r1
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
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ov13_0223E014
	cmp r0, #0x18
	bne _0223E16C
	mov r0, #7
	bl ov13_0223D6A8
	pop {r4, pc}
_0223E16C:
	cmp r0, #2
	popeq {r4, pc}
	mov r0, #9
	bl ov13_0223D6A8
	pop {r4, pc}
	.align 2, 0
_0223E180: .4byte 0x0224F5C0
_0223E184: .4byte 0x0224730C
	arm_func_end ov13_0223E0B0

	arm_func_start ov13_0223E188
ov13_0223E188: @ 0x0223E188
	push {r3, lr}
	mov r3, r1
	mov ip, #0x1e
	mov r1, #3
	mov r2, #0x11
	str ip, [sp]
	bl FUN_020E0EF4
	pop {r3, pc}
	arm_func_end ov13_0223E188

	arm_func_start ov13_0223E1A8
ov13_0223E1A8: @ 0x0223E1A8
	push {r3, lr}
	ldr r0, _0223E218 @ =0x0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #7
	beq _0223E1C4
	bl FUN_020D3F48
_0223E1C4:
	mov r0, #1
	bl ov13_0223D6A8
	ldr r0, _0223E218 @ =0x0224F5C0
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0x60]
	bl ov13_0223E220
	ldr r1, _0223E218 @ =0x0224F5C0
	ldr r2, [r1, #4]
	strh r0, [r2, #0x5c]
	ldr r3, [r1]
	cmp r3, #0
	beq _0223E208
	ldr r0, [r1, #4]
	ldr r1, _0223E21C @ =0x02247324
	ldrh r2, [r0, #0x5c]
	mov r0, #0x8000000
	blx r3
_0223E208:
	ldr r0, _0223E218 @ =0x0224F5C0
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0x5c]
	pop {r3, pc}
	.align 2, 0
_0223E218: .4byte 0x0224F5C0
_0223E21C: .4byte 0x02247324
	arm_func_end ov13_0223E1A8

	arm_func_start ov13_0223E220
ov13_0223E220: @ 0x0223E220
	push {r4, lr}
	mov r3, #0
	mov r1, r3
	mov ip, r3
	mov r4, #1
_0223E234:
	tst r0, r4, lsl ip
	beq _0223E254
	add r3, ip, #1
	add r2, r1, #1
	lsl r1, r3, #0x10
	lsl r2, r2, #0x10
	asr r3, r1, #0x10
	lsr r1, r2, #0x10
_0223E254:
	add r2, ip, #1
	lsl r2, r2, #0x10
	asr ip, r2, #0x10
	cmp ip, #0x10
	blt _0223E234
	cmp r1, #1
	movls r0, r3
	popls {r4, pc}
	ldr ip, _0223E300 @ =0x0224F5C0
	ldr r3, _0223E304 @ =0x00010DCD
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
	lsl r1, r3, #8
	lsr r3, r1, #0x10
_0223E2B0:
	tst r0, #1
	beq _0223E2DC
	cmp r3, #0
	bne _0223E2D0
	add r0, r2, #1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	pop {r4, pc}
_0223E2D0:
	sub r1, r3, #1
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
_0223E2DC:
	add r1, r2, #1
	lsl r1, r1, #0x10
	lsl r0, r0, #0xf
	asr r2, r1, #0x10
	cmp r2, #0x10
	lsr r0, r0, #0x10
	blt _0223E2B0
	mov r0, #0
	pop {r4, pc}
	.align 2, 0
_0223E300: .4byte 0x0224F5C0
_0223E304: .4byte 0x00010DCD
	arm_func_end ov13_0223E220

	arm_func_start ov13_0223E308
ov13_0223E308: @ 0x0223E308
	push {r3, lr}
	ldr r2, _0223E37C @ =0x0224F5C0
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
	pop {r3, pc}
	.align 2, 0
_0223E37C: .4byte 0x0224F5C0
	arm_func_end ov13_0223E308

	arm_func_start ov13_0223E380
ov13_0223E380: @ 0x0223E380
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #8
	popne {r3, pc}
	mov r0, #9
	bl ov13_0223D6A8
	bl FUN_020D3F48
	pop {r3, pc}
	arm_func_end ov13_0223E380

	arm_func_start ov13_0223E3A0
ov13_0223E3A0: @ 0x0223E3A0
	push {r3, lr}
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223E3E4 @ =0x0224F5C0
	ldr r1, _0223E3E8 @ =ov13_0223E3EC
	ldr r0, [r0, #4]
	mov r2, #2
	add r0, r0, #0x80
	bl FUN_020DF3F8
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov13_0223D724
	mov r0, #0xa
	bl ov13_0223D6A8
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0223E3E4: .4byte 0x0224F5C0
_0223E3E8: .4byte ov13_0223E3EC
	arm_func_end ov13_0223E3A0

	arm_func_start ov13_0223E3EC
ov13_0223E3EC: @ 0x0223E3EC
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0223E40C
	bl ov13_0223D724
	mov r0, #0xa
	bl ov13_0223D6A8
	pop {r3, pc}
_0223E40C:
	ldr r0, _0223E438 @ =ov13_0223E380
	bl FUN_020DEBA8
	cmp r0, #0
	beq _0223E42C
	bl ov13_0223D724
	mov r0, #0xa
	bl ov13_0223D6A8
	pop {r3, pc}
_0223E42C:
	mov r0, #1
	bl ov13_0223D6A8
	pop {r3, pc}
	.align 2, 0
_0223E438: .4byte ov13_0223E380
	arm_func_end ov13_0223E3EC

	arm_func_start ov13_0223E43C
ov13_0223E43C: @ 0x0223E43C
	push {r4, r5, r6, lr}
	ldr r3, _0223E5A4 @ =0x0224F5C0
	mov r6, r0
	ldr r0, [r3, #4]
	mov r5, r1
	ldr r0, [r0, #0x40]
	mov r4, r2
	cmp r0, #1
	beq _0223E468
	bl FUN_020D3F48
	movs r0, #0
_0223E468:
	ldr r1, _0223E5A4 @ =0x0224F5C0
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
	ldr r1, _0223E5A8 @ =0x022472DC
	add r0, r0, #0x1000
	ldr r2, [r0, #0x2a4]
	mov r0, #0x8000000
	blx r3
_0223E4B0:
	ldr r0, _0223E5A4 @ =0x0224F5C0
	ldr r3, [r0]
	cmp r3, #0
	beq _0223E4D8
	ldr r0, [r0, #4]
	ldr r1, _0223E5AC @ =0x022472F4
	add r0, r0, #0x1000
	ldr r2, [r0, #0x2a0]
	mov r0, #0x8000000
	blx r3
_0223E4D8:
	ldr r1, _0223E5A4 @ =0x0224F5C0
	mov r0, #3
	ldr r1, [r1, #4]
	str r6, [r1, #0x44]
	bl ov13_0223D6A8
	ldr r0, _0223E5A4 @ =0x0224F5C0
	ldr r1, [r0, #4]
	strh r5, [r1, #0xc]
	ldr r0, [r0, #4]
	strh r4, [r0, #0x32]
	bl FUN_020DEFD4
	ldr r1, _0223E5A4 @ =0x0224F5C0
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
	ldr r0, _0223E5A4 @ =0x0224F5C0
	movne r4, r2
	ldr r1, [r0, #4]
	cmp r6, #0
	cmpne r6, #2
	strh r4, [r1, #0x14]
	cmpne r6, #4
	bne _0223E580
	bl ov13_0223D744
	pop {r4, r5, r6, pc}
_0223E580:
	ldr r3, [r0]
	cmp r3, #0
	beq _0223E59C
	ldr r1, _0223E5B0 @ =0x0224733C
	mov r2, r6
	mov r0, #0x8000000
	blx r3
_0223E59C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223E5A4: .4byte 0x0224F5C0
_0223E5A8: .4byte 0x022472DC
_0223E5AC: .4byte 0x022472F4
_0223E5B0: .4byte 0x0224733C
	arm_func_end ov13_0223E43C

	arm_func_start ov13_0223E5B4
ov13_0223E5B4: @ 0x0223E5B4
	ldr r1, _0223E5C4 @ =0x0224F5C0
	ldr r1, [r1, #4]
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
_0223E5C4: .4byte 0x0224F5C0
	arm_func_end ov13_0223E5B4

	arm_func_start ov13_0223E5C8
ov13_0223E5C8: @ 0x0223E5C8
	ldr r1, _0223E5E8 @ =0x0224F5C0
	ldr ip, _0223E5EC @ =0x020E0BF0
	ldr r1, [r1, #4]
	mov r2, r0
	add r0, r1, #0x3e0
	add r0, r0, #0x1000
	add r1, r1, #0x1c00
	bx ip
	.align 2, 0
_0223E5E8: .4byte 0x0224F5C0
_0223E5EC: .4byte 0x020E0BF0
	arm_func_end ov13_0223E5C8

	arm_func_start ov13_0223E5F0
ov13_0223E5F0: @ 0x0223E5F0
	push {r4, lr}
	ldr r2, _0223E68C @ =0x0224F5C0
	mov r1, r0
	ldr r2, [r2, #4]
	add r0, r2, #0x3e0
	add r0, r0, #0x1000
	add r2, r2, #0x1c00
	bl FUN_020E0390
	mov r4, r0
	cmp r4, #7
	bne _0223E640
	ldr r0, _0223E68C @ =0x0224F5C0
	ldr r2, [r0]
	cmp r2, #0
	beq _0223E638
	ldr r1, _0223E690 @ =0x02247358
	mov r0, #0x8000000
	blx r2
_0223E638:
	mov r0, #0
	pop {r4, pc}
_0223E640:
	cmp r4, #5
	bne _0223E674
	ldr r0, _0223E68C @ =0x0224F5C0
	ldr r2, [r0]
	cmp r2, #0
	beq _0223E664
	ldr r1, _0223E694 @ =0x02247388
	mov r0, #0x8000000
	blx r2
_0223E664:
	mov r0, r4
	bl ov13_0223D724
	mov r0, #0
	pop {r4, pc}
_0223E674:
	cmp r4, #0
	moveq r0, #1
	popeq {r4, pc}
	bl ov13_0223D724
	mov r0, #0
	pop {r4, pc}
	.align 2, 0
_0223E68C: .4byte 0x0224F5C0
_0223E690: .4byte 0x02247358
_0223E694: .4byte 0x02247388
	arm_func_end ov13_0223E5F0

	arm_func_start ov13_0223E698
ov13_0223E698: @ 0x0223E698
	push {r3, lr}
	bl ov13_0223DE74
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0xa
	bl ov13_0223D6A8
	pop {r3, pc}
	arm_func_end ov13_0223E698

	arm_func_start ov13_0223E6B4
ov13_0223E6B4: @ 0x0223E6B4
	push {r3, lr}
	ldr r0, _0223E7B0 @ =0x0224F5C0
	ldr r1, [r0, #4]
	ldr r2, [r1, #0x40]
	cmp r2, #1
	bne _0223E6E8
	ldr r2, [r0]
	cmp r2, #0
	popeq {r3, pc}
	ldr r1, _0223E7B4 @ =0x022473BC
	mov r0, #0x8000000
	blx r2
	pop {r3, pc}
_0223E6E8:
	ldr r3, [r0]
	cmp r3, #0
	beq _0223E700
	ldr r1, _0223E7B8 @ =0x022473E0
	mov r0, #0x8000000
	blx r3
_0223E700:
	ldr r0, _0223E7B0 @ =0x0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #6
	cmpne r0, #5
	cmpne r0, #4
	mov r0, #3
	beq _0223E72C
	bl ov13_0223D6A8
	bl ov13_0223E698
	pop {r3, pc}
_0223E72C:
	bl ov13_0223D6A8
	ldr r0, _0223E7B0 @ =0x0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x44]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_0223E748: @ jump table
	b _0223E79C @ case 0
	b _0223E774 @ case 1
	b _0223E788 @ case 2
	b _0223E760 @ case 3
	b _0223E79C @ case 4
	b _0223E774 @ case 5
_0223E760:
	bl ov13_0223DD64
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0223E698
	pop {r3, pc}
_0223E774:
	bl ov13_0223DDB4
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0223E698
	pop {r3, pc}
_0223E788:
	bl ov13_0223DC64
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0223E698
	pop {r3, pc}
_0223E79C:
	bl ov13_0223DC94
	cmp r0, #0
	popne {r3, pc}
	bl ov13_0223E698
	pop {r3, pc}
	.align 2, 0
_0223E7B0: .4byte 0x0224F5C0
_0223E7B4: .4byte 0x022473BC
_0223E7B8: .4byte 0x022473E0
	arm_func_end ov13_0223E6B4

	arm_func_start ov13_0223E7BC
ov13_0223E7BC: @ 0x0223E7BC
	push {r3, lr}
	ldr r0, _0223E804 @ =0x0224F5C0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #1
	beq _0223E7D8
	bl FUN_020D3F48
_0223E7D8:
	mov r0, #3
	bl ov13_0223D6A8
	ldr r0, _0223E808 @ =ov13_0223DED8
	bl FUN_020DF4B8
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	mov r0, #9
	bl ov13_0223D6A8
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0223E804: .4byte 0x0224F5C0
_0223E808: .4byte ov13_0223DED8
	arm_func_end ov13_0223E7BC

	arm_func_start ov13_0223E80C
ov13_0223E80C: @ 0x0223E80C
	push {r4, lr}
	ldr r2, _0223E8F8 @ =0x0224F5C8
	mov r4, r1
	str r0, [r2]
	add r0, r0, #0xb00
	bl ov13_0223C9D4
	ldr r1, _0223E8F8 @ =0x0224F5C8
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
	ldr r0, _0223E8F8 @ =0x0224F5C8
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
	bl FUN_020D34B0
	ldr r0, _0223E8F8 @ =0x0224F5C8
	ldr r0, [r0]
	add r0, r0, #0x24c
	add r0, r0, #0x400
	bl FUN_0209E628
	bl FUN_020D34B0
	bl ov13_0223A7F4
	ldr r1, _0223E8F8 @ =0x0224F5C8
	ldr r1, [r1]
	str r0, [r1, #0xaa4]
	pop {r4, pc}
	.align 2, 0
_0223E8F8: .4byte 0x0224F5C8
	arm_func_end ov13_0223E80C

	arm_func_start ov13_0223E8FC
ov13_0223E8FC: @ 0x0223E8FC
	push {r3, lr}
	ldr r0, _0223E9D4 @ =0x0224F5C8
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
	ldr r0, _0223E9D4 @ =0x0224F5C8
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xaac]
	mov r0, #1
	pop {r3, pc}
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
	poplo {r3, pc}
_0223E970:
	bl ov13_0221FD50
	ldr r0, _0223E9D4 @ =0x0224F5C8
	mov r3, #0x10
	ldr r1, [r0]
	mov r2, #2
	strb r3, [r1, #0xa90]
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #0xaac]
	pop {r3, pc}
_0223E998:
	add r0, r1, #0xf7
	and r0, r0, #0xff
	cmp r0, #1
	bhi _0223E9B8
	mov r0, #0x20
	strb r0, [r2, #0xa90]
	mov r0, #1
	pop {r3, pc}
_0223E9B8:
	cmp r1, #0xc
	movne r0, #0
	popne {r3, pc}
	mov r0, #0x22
	strb r0, [r2, #0xa90]
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_0223E9D4: .4byte 0x0224F5C8
	arm_func_end ov13_0223E8FC

	arm_func_start ov13_0223E9D8
ov13_0223E9D8: @ 0x0223E9D8
	push {r3, lr}
	ldr r0, _0223EA54 @ =0x0224F5C8
	ldr r0, [r0]
	ldr r0, [r0, #0xac8]
	bl ov13_0223DF00
	ldr r0, _0223EA54 @ =0x0224F5C8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	bl FUN_020DF250
	ldr r3, _0223EA54 @ =0x0224F5C8
	mov r2, #0x40
	ldr r1, [r3]
	add r1, r1, #0x600
	strh r0, [r1, #0x48]
	ldr r1, [r3]
	ldr r0, [r1, #0xaa4]
	add r1, r1, #0xa50
	bl FUN_020D4A50
	ldr r0, _0223EA54 @ =0x0224F5C8
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
	pop {r3, pc}
	.align 2, 0
_0223EA54: .4byte 0x0224F5C8
	arm_func_end ov13_0223E9D8

	arm_func_start ov13_0223EA58
ov13_0223EA58: @ 0x0223EA58
	push {r3, lr}
	ldr r0, _0223EA9C @ =0x0224F5C8
	ldr r0, [r0]
	ldrb r0, [r0, #0xa90]
	cmp r0, #1
	cmpne r0, #0x1a
	cmpne r0, #0x1d
	movne r0, #0
	popne {r3, pc}
	bl ov13_0223E9D8
	bl ov13_0223E308
	ldr r0, _0223EA9C @ =0x0224F5C8
	mov r2, #2
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #0xa90]
	pop {r3, pc}
	.align 2, 0
_0223EA9C: .4byte 0x0224F5C8
	arm_func_end ov13_0223EA58

	arm_func_start ov13_0223EAA0
ov13_0223EAA0: @ 0x0223EAA0
	push {r3, lr}
	ldr r0, _0223EAD0 @ =0x0224F5C8
	ldr r1, [r0]
	ldrb r0, [r1, #0xa90]
	cmp r0, #5
	movne r0, #0
	popne {r3, pc}
	mov r0, #6
	strb r0, [r1, #0xa90]
	bl ov13_0223CEA0
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_0223EAD0: .4byte 0x0224F5C8
	arm_func_end ov13_0223EAA0

	arm_func_start ov13_0223EAD4
ov13_0223EAD4: @ 0x0223EAD4
	push {r3, lr}
	ldr r1, _0223EE50 @ =0x0224F5C8
	ldr r0, [r1]
	ldrb r2, [r0, #0xa90]
	cmp r2, #0x22
	addls pc, pc, r2, lsl #2
	pop {r3, pc}
_0223EAF0: @ jump table
	pop {r3, pc} @ case 0
	b _0223EB7C @ case 1
	b _0223EBB8 @ case 2
	b _0223EBC0 @ case 3
	b _0223EBD8 @ case 4
	b _0223EBEC @ case 5
	b _0223EBEC @ case 6
	b _0223EBF4 @ case 7
	b _0223EBFC @ case 8
	b _0223EBFC @ case 9
	b _0223EBFC @ case 10
	b _0223EC04 @ case 11
	pop {r3, pc} @ case 12
	pop {r3, pc} @ case 13
	pop {r3, pc} @ case 14
	pop {r3, pc} @ case 15
	b _0223EC0C @ case 16
	b _0223EC24 @ case 17
	b _0223EC40 @ case 18
	b _0223EC64 @ case 19
	pop {r3, pc} @ case 20
	b _0223EC9C @ case 21
	b _0223ECC0 @ case 22
	pop {r3, pc} @ case 23
	b _0223ECF8 @ case 24
	b _0223ED1C @ case 25
	pop {r3, pc} @ case 26
	b _0223ED54 @ case 27
	b _0223ED78 @ case 28
	pop {r3, pc} @ case 29
	b _0223EE48 @ case 30
	pop {r3, pc} @ case 31
	b _0223EDEC @ case 32
	b _0223EE10 @ case 33
	pop {r3, pc} @ case 34
_0223EB7C:
	ldrb r2, [r0, #0xaac]
	cmp r2, #1
	bne _0223EB98
	mov r1, #0
	strb r1, [r0, #0xaac]
	bl ov13_0223EA58
	pop {r3, pc}
_0223EB98:
	cmp r2, #2
	popne {r3, pc}
	mov r2, #0
	strb r2, [r0, #0xaac]
	ldr r0, [r1]
	mov r1, #0x22
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223EBB8:
	bl ov13_0223EEAC
	pop {r3, pc}
_0223EBC0:
	bl ov13_0223EF54
	ldr r0, _0223EE50 @ =0x0224F5C8
	mov r1, #4
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223EBD8:
	ldr r1, [r0, #0xa98]
	add r1, r1, #1
	str r1, [r0, #0xa98]
	bl ov13_0223EF78
	pop {r3, pc}
_0223EBEC:
	bl ov13_0223EF78
	pop {r3, pc}
_0223EBF4:
	bl ov13_0223F130
	pop {r3, pc}
_0223EBFC:
	bl ov13_0223F15C
	pop {r3, pc}
_0223EC04:
	bl ov13_0223F338
	pop {r3, pc}
_0223EC0C:
	mov r2, #0
	str r2, [r0, #0xa9c]
	ldr r0, [r1]
	mov r1, #0x11
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223EC24:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	popls {r3, pc}
	bl ov13_0223F350
	pop {r3, pc}
_0223EC40:
	bl ov13_0221FD50
	ldr r0, _0223EE50 @ =0x0224F5C8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x16
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223EC64:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	popls {r3, pc}
	bl ov13_0223DF28
	cmp r0, #1
	popne {r3, pc}
	bl ov13_0223E7BC
	ldr r0, _0223EE50 @ =0x0224F5C8
	mov r1, #0x14
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223EC9C:
	bl ov13_0223E6B4
	ldr r0, _0223EE50 @ =0x0224F5C8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x16
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223ECC0:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	popls {r3, pc}
	bl ov13_0223DF28
	cmp r0, #1
	popne {r3, pc}
	bl ov13_0223E7BC
	ldr r0, _0223EE50 @ =0x0224F5C8
	mov r1, #0x17
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223ECF8:
	bl ov13_0223E6B4
	ldr r0, _0223EE50 @ =0x0224F5C8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x19
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223ED1C:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	popls {r3, pc}
	bl ov13_0223DF28
	cmp r0, #1
	popne {r3, pc}
	bl ov13_0223E7BC
	ldr r0, _0223EE50 @ =0x0224F5C8
	mov r1, #0x1a
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223ED54:
	bl ov13_0223E6B4
	ldr r0, _0223EE50 @ =0x0224F5C8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x1c
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223ED78:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	popls {r3, pc}
	bl ov13_0223DF28
	cmp r0, #1
	bne _0223EDB0
	bl ov13_0223E7BC
	ldr r0, _0223EE50 @ =0x0224F5C8
	mov r1, #0x1d
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223EDB0:
	ldr r1, _0223EE50 @ =0x0224F5C8
	ldr r0, _0223EE54 @ =0x88888889
	ldr r1, [r1]
	mov r2, #0x1e
	ldr r3, [r1, #0xa9c]
	umull r0, r1, r3, r0
	lsr r1, r1, #4
	umull r0, r1, r2, r1
	sub r1, r3, r0
	cmp r1, #1
	popne {r3, pc}
	cmp r3, #0x37
	popls {r3, pc}
	bl ov13_0223E6B4
	pop {r3, pc}
_0223EDEC:
	bl ov13_0223E6B4
	ldr r0, _0223EE50 @ =0x0224F5C8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x21
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223EE10:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	popls {r3, pc}
	bl ov13_0223DF28
	cmp r0, #1
	popne {r3, pc}
	bl ov13_0223E7BC
	ldr r0, _0223EE50 @ =0x0224F5C8
	mov r1, #0x22
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223EE48:
	bl ov13_0223E6B4
	pop {r3, pc}
	.align 2, 0
_0223EE50: .4byte 0x0224F5C8
_0223EE54: .4byte 0x88888889
	arm_func_end ov13_0223EAD4

	arm_func_start ov13_0223EE58
ov13_0223EE58: @ 0x0223EE58
	ldr r2, _0223EE98 @ =0x0224F5C8
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
	ldr r0, _0223EE98 @ =0x0224F5C8
	ldr r1, [r0]
	ldrb r0, [r1, #0xa90]
	strb r0, [r1, #0xa91]
	bx lr
	.align 2, 0
_0223EE98: .4byte 0x0224F5C8
	arm_func_end ov13_0223EE58

	arm_func_start ov13_0223EE9C
ov13_0223EE9C: @ 0x0223EE9C
	ldr ip, _0223EEA8 @ =ov13_0221BA98
	mov r0, #1
	bx ip
	.align 2, 0
_0223EEA8: .4byte ov13_0221BA98
	arm_func_end ov13_0223EE9C

	arm_func_start ov13_0223EEAC
ov13_0223EEAC: @ 0x0223EEAC
	push {r3, lr}
	bl ov13_0223DF28
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0223EF48
_0223EEC0: @ jump table
	b _0223EF20 @ case 0
	b _0223EEE8 @ case 1
	b _0223EF48 @ case 2
	pop {r3, pc} @ case 3
	b _0223EF48 @ case 4
	b _0223EF48 @ case 5
	b _0223EF48 @ case 6
	b _0223EEF0 @ case 7
	b _0223EF48 @ case 8
	b _0223EF40 @ case 9
_0223EEE8:
	bl ov13_0223DF3C
	pop {r3, pc}
_0223EEF0:
	bl ov13_0223E1A8
	ldr r2, _0223EF50 @ =0x0224F5C8
	mov ip, #0
	ldr r1, [r2]
	mov r3, #3
	add r1, r1, #0x600
	strh r0, [r1, #0x4a]
	ldr r0, [r2]
	str ip, [r0, #0xa98]
	ldr r0, [r2]
	strb r3, [r0, #0xa90]
	pop {r3, pc}
_0223EF20:
	ldr r0, _0223EF50 @ =0x0224F5C8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #3
	str r3, [r2, #0xa98]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223EF40:
	bl ov13_0223E698
	pop {r3, pc}
_0223EF48:
	bl FUN_020D3F48
	pop {r3, pc}
	.align 2, 0
_0223EF50: .4byte 0x0224F5C8
	arm_func_end ov13_0223EEAC

	arm_func_start ov13_0223EF54
ov13_0223EF54: @ 0x0223EF54
	ldr r0, _0223EF70 @ =0x0224F5C8
	ldr ip, _0223EF74 @ =ov13_0223CA14
	ldr r2, [r0]
	add r0, r2, #0x600
	ldrh r1, [r0, #0x48]
	ldr r0, [r2, #0xac8]
	bx ip
	.align 2, 0
_0223EF70: .4byte 0x0224F5C8
_0223EF74: .4byte ov13_0223CA14
	arm_func_end ov13_0223EF54

	arm_func_start ov13_0223EF78
ov13_0223EF78: @ 0x0223EF78
	push {r3, lr}
	bl ov13_0223D45C
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_0223EF8C: @ jump table
	b _0223F0DC @ case 0
	b _0223EFAC @ case 1
	b _0223EFCC @ case 2
	b _0223F05C @ case 3
	pop {r3, pc} @ case 4
	b _0223F0B0 @ case 5
	pop {r3, pc} @ case 6
	b _0223F0C4 @ case 7
_0223EFAC:
	ldr r0, _0223F12C @ =0x0224F5C8
	ldr r2, [r0]
	add r0, r2, #0x600
	ldrh r1, [r0, #0x4a]
	add r0, r2, #0x2b4
	add r0, r0, #0x800
	bl ov13_0223CB34
	pop {r3, pc}
_0223EFCC:
	mov r0, #2
	bl ov13_0223D470
	cmp r0, #0
	beq _0223EFF0
	ldr r0, _0223F12C @ =0x0224F5C8
	mov r1, #5
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
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
	ldr r0, _0223F12C @ =0x0224F5C8
	mov r1, #6
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F024:
	ldr r0, _0223F12C @ =0x0224F5C8
	ldr r0, [r0]
	ldrb r0, [r0, #0xa90]
	cmp r0, #5
	popne {r3, pc}
	mov r0, #2
	bl ov13_0223D470
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0223F12C @ =0x0224F5C8
	mov r1, #0xd
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F05C:
	bl ov13_0223CF80
	cmp r0, #0
	beq _0223F070
	bl ov13_0223CFE8
	pop {r3, pc}
_0223F070:
	ldr r0, _0223F12C @ =0x0224F5C8
	ldr r0, [r0]
	ldrb r0, [r0, #0xa90]
	add r0, r0, #0xfa
	and r0, r0, #0xff
	cmp r0, #1
	pophi {r3, pc}
	mov r0, #3
	bl ov13_0223D470
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0223F12C @ =0x0224F5C8
	mov r1, #0x12
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F0B0:
	ldr r0, _0223F12C @ =0x0224F5C8
	mov r1, #7
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F0C4:
	bl ov13_0223D0E0
	ldr r0, _0223F12C @ =0x0224F5C8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F0DC:
	bl ov13_0223DF28
	cmp r0, #0
	beq _0223F104
	cmp r0, #1
	beq _0223F0FC
	cmp r0, #3
	popeq {r3, pc}
	b _0223F118
_0223F0FC:
	bl ov13_0223E7BC
	pop {r3, pc}
_0223F104:
	ldr r0, _0223F12C @ =0x0224F5C8
	mov r1, #0x1f
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F118:
	ldr r0, _0223F12C @ =0x0224F5C8
	mov r1, #0x1f
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
	.align 2, 0
_0223F12C: .4byte 0x0224F5C8
	arm_func_end ov13_0223EF78

	arm_func_start ov13_0223F130
ov13_0223F130: @ 0x0223F130
	push {r3, lr}
	bl ov13_0223F3BC
	ldr r0, _0223F154 @ =ov13_0223F380
	bl ov13_0223E5B4
	ldr r0, _0223F158 @ =0x0224F5C8
	mov r1, #8
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
	.align 2, 0
_0223F154: .4byte ov13_0223F380
_0223F158: .4byte 0x0224F5C8
	arm_func_end ov13_0223F130

	arm_func_start ov13_0223F15C
ov13_0223F15C: @ 0x0223F15C
	push {r3, lr}
	bl ov13_0223DF28
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_0223F170: @ jump table
	pop {r3, pc} @ case 0
	b _0223F18C @ case 1
	pop {r3, pc} @ case 2
	pop {r3, pc} @ case 3
	b _0223F1B8 @ case 4
	b _0223F1B8 @ case 5
	b _0223F1B8 @ case 6
_0223F18C:
	ldr r1, _0223F334 @ =0x0224F5C8
	mov r0, #4
	ldr r1, [r1]
	add r1, r1, #0x600
	ldrh r3, [r1, #0x48]
	ldrh r2, [r1, #0x4a]
	add r1, r3, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov13_0223E43C
	pop {r3, pc}
_0223F1B8:
	ldr r1, _0223F334 @ =0x0224F5C8
	mov r0, #0
	ldr r2, [r1]
	add r1, r2, #0x200
	ldrh r1, [r1]
	ldr ip, [r2, #0xaa4]
	lsr r3, r1, #0x1f
	rsb r2, r3, r1, lsl #28
	add r2, r3, r2, ror #28
	add r2, ip, r2, lsl #6
	bl ov13_0223F400
	bl ov13_0223F568
	ldr r0, _0223F334 @ =0x0224F5C8
	ldr r1, [r0]
	ldrb r0, [r1, #0xa90]
	cmp r0, #0x1b
	popeq {r3, pc}
	ldr r0, [r1, #0x204]
	cmp r0, #0x1e0
	movhi r0, #0x1b
	strbhi r0, [r1, #0xa90]
	pophi {r3, pc}
	bl ov13_0223F64C
	cmp r0, #0x10
	beq _0223F228
	bl ov13_0223F64C
	cmp r0, #0x20
	bne _0223F240
_0223F228:
	bl ov13_0223F64C
	ldr r0, _0223F334 @ =0x0224F5C8
	mov r1, #0xa
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F240:
	bl ov13_0223F64C
	cmp r0, #0x40
	bne _0223F260
	ldr r0, _0223F334 @ =0x0224F5C8
	mov r1, #0xb
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F260:
	bl ov13_0223F64C
	cmp r0, #0xff
	bne _0223F280
	ldr r0, _0223F334 @ =0x0224F5C8
	mov r1, #0x1b
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F280:
	bl ov13_0223F64C
	cmp r0, #0x50
	bne _0223F2A0
	ldr r0, _0223F334 @ =0x0224F5C8
	mov r1, #0x15
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F2A0:
	bl ov13_0223F64C
	cmp r0, #0x60
	bne _0223F2C0
	ldr r0, _0223F334 @ =0x0224F5C8
	mov r1, #0x18
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F2C0:
	bl ov13_0223F64C
	cmp r0, #0x70
	bne _0223F2E0
	ldr r0, _0223F334 @ =0x0224F5C8
	mov r1, #0x1b
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F2E0:
	bl ov13_0223F64C
	cmp r0, #0
	bne _0223F300
	ldr r0, _0223F334 @ =0x0224F5C8
	mov r1, #8
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F300:
	bl ov13_0223F64C
	cmp r0, #0xbd
	bne _0223F320
	ldr r0, _0223F334 @ =0x0224F5C8
	mov r1, #9
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0223F320:
	ldr r0, _0223F334 @ =0x0224F5C8
	mov r1, #0x1f
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
	.align 2, 0
_0223F334: .4byte 0x0224F5C8
	arm_func_end ov13_0223F15C

	arm_func_start ov13_0223F338
ov13_0223F338: @ 0x0223F338
	ldr r0, _0223F34C @ =0x0224F5C8
	mov r1, #0xc
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	bx lr
	.align 2, 0
_0223F34C: .4byte 0x0224F5C8
	arm_func_end ov13_0223F338

	arm_func_start ov13_0223F350
ov13_0223F350: @ 0x0223F350
	push {r3, lr}
	bl ov13_0223DF28
	cmp r0, #1
	movne r0, #0
	popne {r3, pc}
	bl ov13_0223E7BC
	ldr r1, _0223F37C @ =0x0224F5C8
	mov r0, #1
	ldr r1, [r1]
	strb r0, [r1, #0xa90]
	pop {r3, pc}
	.align 2, 0
_0223F37C: .4byte 0x0224F5C8
	arm_func_end ov13_0223F350

	arm_func_start ov13_0223F380
ov13_0223F380: @ 0x0223F380
	push {r4, lr}
	add r0, r0, #0xa
	bl ov13_0223D5C4
	movs r4, r0
	moveq r0, #0
	popeq {r4, pc}
	bl ov13_0223D590
	ldr r1, _0223F3B8 @ =0x0224F5C8
	sub r2, r4, #1
	ldr r1, [r1]
	add r1, r1, r2, lsl #2
	str r0, [r1, #0xaa0]
	mov r0, #1
	pop {r4, pc}
	.align 2, 0
_0223F3B8: .4byte 0x0224F5C8
	arm_func_end ov13_0223F380

	arm_func_start ov13_0223F3BC
ov13_0223F3BC: @ 0x0223F3BC
	push {r3, lr}
	ldr r0, _0223F3FC @ =0x0224F5C8
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x100
	add r0, r0, #0x100
	bl FUN_020D4994
	ldr r0, _0223F3FC @ =0x0224F5C8
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x100
	bl FUN_020D4994
	ldr r0, _0223F3FC @ =0x0224F5C8
	ldr r0, [r0]
	str r0, [r0, #0xab0]
	pop {r3, pc}
	.align 2, 0
_0223F3FC: .4byte 0x0224F5C8
	arm_func_end ov13_0223F3BC

	arm_func_start ov13_0223F400
ov13_0223F400: @ 0x0223F400
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r3, _0223F564 @ =0x0224F5C8
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
	bl FUN_020D4A50
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
	popne {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _0223F564 @ =0x0224F5C8
	ldr r0, [r0]
	bl ov13_0223E5F0
	cmp r0, #0
	bne _0223F4AC
	ldr r0, _0223F564 @ =0x0224F5C8
	ldr r1, [r0]
	ldr r0, [r1, #0x204]
	add r0, r0, #4
	str r0, [r1, #0x204]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_0223F4AC:
	ldr r0, _0223F564 @ =0x0224F5C8
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
	ldr r0, _0223F564 @ =0x0224F5C8
	mov r1, #0x1b
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_0223F4F8:
	mov r7, #0
	mov r6, #0x44
	ldr sb, _0223F564 @ =0x0224F5C8
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
	bl FUN_020D4A50
	ldr r0, [sb]
	add r0, r0, r7, lsl #2
	str r5, [r0, #0x208]
_0223F54C:
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r7, #2
	blo _0223F510
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0223F564: .4byte 0x0224F5C8
	arm_func_end ov13_0223F400

	arm_func_start ov13_0223F568
ov13_0223F568: @ 0x0223F568
	push {r4, r5, r6, r7, r8, lr}
	mov ip, #0
	ldr r4, _0223F648 @ =0x0224F5C8
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
	popne {r4, r5, r6, r7, r8, pc}
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
	strhhs r2, [r3]
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
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0223F648: .4byte 0x0224F5C8
	arm_func_end ov13_0223F568

	arm_func_start ov13_0223F64C
ov13_0223F64C: @ 0x0223F64C
	ldr r0, _0223F660 @ =0x0224F5C8
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrh r0, [r0, #0x44]
	bx lr
	.align 2, 0
_0223F660: .4byte 0x0224F5C8
	arm_func_end ov13_0223F64C

	arm_func_start ov13_0223F664
ov13_0223F664: @ 0x0223F664
	push {r4, lr}
	sub sp, sp, #0xe8
	mov r0, #0xe8
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _0223F7F4 @ =0x0224F5CC
	str r0, [r1]
	add r0, sp, #0xa0
	bl FUN_020D7F98
	ldr r1, _0223F7F8 @ =0x02247404
	add r0, sp, #0xa0
	bl FUN_020D8278
	cmp r0, #0
	bne _0223F6A0
	bl FUN_020D3F48
_0223F6A0:
	bl FUN_020D15C4
	ldr r2, _0223F7F4 @ =0x0224F5CC
	add r1, sp, #0x18
	ldr r3, [r2]
	mov r2, #8
	strh r0, [r3, #0xe4]
	add r0, sp, #0xa0
	ldr r4, [sp, #0xc4]
	bl FUN_020D83CC
	add r0, sp, #0xa0
	add r1, sp, #0x10
	mov r2, #8
	bl FUN_020D83CC
	add r0, sp, #0xa0
	bl FUN_020D82C0
	ldr r0, _0223F7F4 @ =0x0224F5CC
	ldr r0, [r0]
	add r0, r0, #0x88
	bl FUN_020D792C
	ldr r0, _0223F7F4 @ =0x0224F5CC
	ldr r1, _0223F7FC @ =0x0224593C
	ldr r0, [r0]
	mov r2, #3
	add r0, r0, #0x88
	bl FUN_020D7998
	cmp r0, #0
	bne _0223F710
	bl FUN_020D3F48
_0223F710:
	ldr r0, _0223F7F4 @ =0x0224F5CC
	ldr r1, _0223F800 @ =ov13_0223F8A0
	ldr r0, [r0]
	ldr r2, _0223F804 @ =0x00000602
	add r0, r0, #0x88
	bl FUN_020D7EBC
	ldr r0, [sp, #0x18]
	ldr r1, _0223F808 @ =ov13_0223F904
	str r0, [sp]
	ldr r2, [sp, #0x1c]
	ldr r0, _0223F80C @ =ov13_0223F954
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _0223F7F4 @ =0x0224F5CC
	ldr r2, [sp, #0x10]
	ldr r0, [r0]
	ldr r3, [sp, #0x14]
	mov r1, r4
	add r0, r0, #0x88
	bl FUN_020D7AD0
	cmp r0, #0
	bne _0223F770
	bl FUN_020D3F48
_0223F770:
	ldr r0, _0223F7F4 @ =0x0224F5CC
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	add r0, r0, #0x88
	bl FUN_020D7C00
	mov r1, #4
	mov r4, r0
	bl ov13_0224128C
	ldr r1, _0223F7F4 @ =0x0224F5CC
	mov r2, r4
	ldr r3, [r1]
	str r0, [r3]
	ldr r0, [r1]
	ldr r1, [r0], #0x88
	bl FUN_020D7C00
	ldr r1, _0223F7F4 @ =0x0224F5CC
	mov r0, #0x20
	ldr r1, [r1]
	mov r2, #4
	add r1, r1, #4
	bl ov13_0224022C
	ldr r2, _0223F7F4 @ =0x0224F5CC
	ldr r1, _0223F810 @ =0x0224741C
	ldr r3, [r2]
	ldr r2, _0223F7FC @ =0x0224593C
	str r0, [r3, #0x84]
	add r0, sp, #0x20
	bl FUN_020D164C
	add r0, sp, #0x20
	bl FUN_020D8448
	add sp, sp, #0xe8
	pop {r4, pc}
	.align 2, 0
_0223F7F4: .4byte 0x0224F5CC
_0223F7F8: .4byte 0x02247404
_0223F7FC: .4byte 0x0224593C
_0223F800: .4byte ov13_0223F8A0
_0223F804: .4byte 0x00000602
_0223F808: .4byte ov13_0223F904
_0223F80C: .4byte ov13_0223F954
_0223F810: .4byte 0x0224741C
	arm_func_end ov13_0223F664

	arm_func_start ov13_0223F814
ov13_0223F814: @ 0x0223F814
	push {r3, lr}
	ldr r0, _0223F894 @ =0x02247424
	bl FUN_020D8448
	ldr r0, _0223F898 @ =0x0224F5CC
	ldr r0, [r0]
	add r0, r0, #0x88
	bl FUN_020D7D24
	ldr r0, _0223F898 @ =0x0224F5CC
	ldr r0, [r0]
	add r0, r0, #0x88
	bl FUN_020D7B40
	ldr r0, _0223F898 @ =0x0224F5CC
	ldr r0, [r0]
	add r0, r0, #0x88
	bl FUN_020D7A4C
	ldr r0, _0223F898 @ =0x0224F5CC
	ldr r0, [r0]
	ldrh r0, [r0, #0xe4]
	bl FUN_020D161C
	ldr r0, _0223F898 @ =0x0224F5CC
	mov r2, #0
	ldr r1, [r0]
	strh r2, [r1, #0xe4]
	ldr r0, [r0]
	bl ov13_022412B0
	ldr r1, _0223F898 @ =0x0224F5CC
	ldr r0, _0223F89C @ =0x0224F5CC
	ldr r1, [r1]
	mov r2, #0
	str r2, [r1]
	bl ov13_022412B0
	pop {r3, pc}
	.align 2, 0
_0223F894: .4byte 0x02247424
_0223F898: .4byte 0x0224F5CC
_0223F89C: .4byte 0x0224F5CC
	arm_func_end ov13_0223F814

	arm_func_start ov13_0223F8A0
ov13_0223F8A0: @ 0x0223F8A0
	push {r3, lr}
	cmp r1, #1
	beq _0223F8F0
	cmp r1, #9
	beq _0223F8C0
	cmp r1, #0xa
	beq _0223F8D8
	b _0223F8F8
_0223F8C0:
	ldr r0, _0223F900 @ =0x0224F5CC
	ldr r0, [r0]
	ldrh r0, [r0, #0xe4]
	bl FUN_020DC96C
	mov r0, #0
	pop {r3, pc}
_0223F8D8:
	ldr r0, _0223F900 @ =0x0224F5CC
	ldr r0, [r0]
	ldrh r0, [r0, #0xe4]
	bl FUN_020DC988
	mov r0, #0
	pop {r3, pc}
_0223F8F0:
	mov r0, #4
	pop {r3, pc}
_0223F8F8:
	mov r0, #8
	pop {r3, pc}
	.align 2, 0
_0223F900: .4byte 0x0224F5CC
	arm_func_end ov13_0223F8A0

	arm_func_start ov13_0223F904
ov13_0223F904: @ 0x0223F904
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, _0223F940 @ =ov13_0223F944
	mov lr, r1
	str ip, [sp]
	mov ip, #1
	stmib sp, {r0, ip}
	ldr r0, [r0, #0x28]
	add r1, r2, r0
	mov r2, lr
	sub r0, ip, #2
	bl FUN_020DD754
	mov r0, #6
	add sp, sp, #0xc
	ldm sp!, {pc}
	.align 2, 0
_0223F940: .4byte ov13_0223F944
	arm_func_end ov13_0223F904

	arm_func_start ov13_0223F944
ov13_0223F944: @ 0x0223F944
	ldr ip, _0223F950 @ =0x020D7EDC
	mov r1, #0
	bx ip
	.align 2, 0
_0223F950: .4byte 0x020D7EDC
	arm_func_end ov13_0223F944

	arm_func_start ov13_0223F954
ov13_0223F954: @ 0x0223F954
	mov r0, #1
	bx lr
	arm_func_end ov13_0223F954

	arm_func_start ov13_0223F95C
ov13_0223F95C: @ 0x0223F95C
	push {r4, r5, r6, r7, lr}
	sub sp, sp, #0x4c
	ldr r3, _0223FA48 @ =0x0224F5CC
	mov r6, r0
	ldr r0, [r3]
	mov r5, r1
	ldr r0, [r0, #0x84]
	mov r4, r2
	bl ov13_022402E0
	add r0, sp, #4
	bl FUN_020D7F98
	add r0, sp, #4
	mov r1, r6
	bl FUN_020D8278
	cmp r0, #0
	bne _0223F9A0
	bl FUN_020D3F48
_0223F9A0:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	mov r2, #2
	sub r7, r1, r0
	cmp r5, #0
	ldr r1, _0223FA4C @ =0x0224742C
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
	bl FUN_020D83CC
	add r0, sp, #4
	bl FUN_020D82C0
	cmp r6, #0
	ldrgt r0, [sp]
	addgt sp, sp, #0x4c
	popgt {r4, r5, r6, r7, pc}
	ldr r0, [sp]
	cmp r5, #0
	ldr r0, [r0]
	mov r1, r4
	lsr r0, r0, #8
	strne r0, [r5]
	bl ov13_0224128C
	mov r4, r0
	ldr r0, [sp]
	mov r1, r4
	bl FUN_020D4BE8
	add r0, sp, #0
	bl ov13_022412B0
	mov r0, r4
	add sp, sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223FA48: .4byte 0x0224F5CC
_0223FA4C: .4byte 0x0224742C
	arm_func_end ov13_0223F95C

	arm_func_start ov13_0223FA50
ov13_0223FA50: @ 0x0223FA50
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r0, sp, #8
	bl ov13_022412B0
	ldr r0, _0223FA80 @ =0x0224F5CC
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0x84]
	bl ov13_02240288
	pop {r3, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_0223FA80: .4byte 0x0224F5CC
	arm_func_end ov13_0223FA50

	arm_func_start ov13_0223FA84
ov13_0223FA84: @ 0x0223FA84
	push {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r5, r2
	bl FUN_020E9580
	mov r4, r0
	mov r0, r6
	bl FUN_020E9580
	cmp r4, r5
	cmpge r0, r5
	movlt r0, #0
	poplt {r3, r4, r5, r6, r7, pc}
	sub r1, r0, r5
	sub r3, r4, r5
	mov r2, r5
	add r0, r7, r3
	add r1, r6, r1
	bl FUN_020E5BB0
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end ov13_0223FA84

	arm_func_start ov13_0223FADC
ov13_0223FADC: @ 0x0223FADC
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r0, #0x450
	mov r1, #4
	bl ov13_0224128C
	ldr sl, _0223FBAC @ =0x0224F5D0
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
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0223FBAC: .4byte 0x0224F5D0
	arm_func_end ov13_0223FADC

	arm_func_start ov13_0223FBB0
ov13_0223FBB0: @ 0x0223FBB0
	push {r4, r5, r6, lr}
	mov r5, #0
	ldr r4, _0223FBFC @ =0x0224F5D0
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
	ldr r0, _0223FC00 @ =0x0224F5D0
	bl ov13_022412B0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223FBFC: .4byte 0x0224F5D0
_0223FC00: .4byte 0x0224F5D0
	arm_func_end ov13_0223FBB0

	arm_func_start ov13_0223FC04
ov13_0223FC04: @ 0x0223FC04
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0x228
	mul r7, sb, r0
	ldr r0, _0223FD5C @ =0x0224F5D0
	mov r8, r1
	ldr r0, [r0]
	mov r5, r2
	add r0, r0, r7
	ldr r0, [r0, #0x224]
	bl ov13_022402E0
	mov r4, r0
	mov r0, #1
	bl FUN_020D1204
	mov r6, r0
	cmp r5, #0
	mov r0, #0x228
	beq _0223FCC8
	ldr r1, _0223FD5C @ =0x0224F5D0
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
	ldr r0, _0223FD5C @ =0x0224F5D0
	ldr r0, [r0]
	add r0, r0, r7
	add r0, r0, #0x210
	cmp r5, r0
	bne _0223FD48
	bl FUN_020D3F48
	b _0223FD48
_0223FCC8:
	ldr r1, _0223FD5C @ =0x0224F5D0
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
	ldr r0, _0223FD5C @ =0x0224F5D0
	ldr r0, [r0]
	add r0, r0, r7
	add r0, r0, #0x200
	cmp r5, r0
	bne _0223FD48
	bl FUN_020D3F48
_0223FD48:
	mov r0, r6
	bl FUN_020D11D4
	mov r0, r4
	strb r8, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0223FD5C: .4byte 0x0224F5D0
	arm_func_end ov13_0223FC04

	arm_func_start ov13_0223FD60
ov13_0223FD60: @ 0x0223FD60
	push {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #0xc]
	mov r4, #0
	mov r3, r4
	cmp r0, #0
	ldr r2, [r5, #8]
	ble _0223FDA4
	ldr r0, _0223FDD8 @ =0xC1FFFCFF
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
	ldr r0, _0223FDDC @ =0x0224F5D0
	ldr r1, [r0]
	add r0, r1, #0x228
	cmp r5, r0
	movhs r4, #1
	mov r0, #0x228
	mla r0, r4, r0, r1
	ldr r0, [r0, #0x224]
	mov r1, r5
	bl ov13_02240288
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223FDD8: .4byte 0xC1FFFCFF
_0223FDDC: .4byte 0x0224F5D0
	arm_func_end ov13_0223FD60

	arm_func_start ov13_0223FDE0
ov13_0223FDE0: @ 0x0223FDE0
	ldr r0, [r0, #8]
	add r0, r0, r1, lsl #3
	bx lr
	arm_func_end ov13_0223FDE0

	arm_func_start ov13_0223FDEC
ov13_0223FDEC: @ 0x0223FDEC
	ldrb r0, [r0, #0xc]
	bx lr
	arm_func_end ov13_0223FDEC

	arm_func_start ov13_0223FDF4
ov13_0223FDF4: @ 0x0223FDF4
	push {r4, lr}
	cmp r1, #0
	ldr ip, [r0, #8]
	blt _0223FE40
	cmp r2, #0x100
	cmpne r2, #0x300
	ldr r0, _0223FE94 @ =0xC1FFFCFF
	beq _0223FE28
	ldr r3, [ip, r1, lsl #3]
	and r0, r3, r0
	orr r0, r0, r2
	str r0, [ip, r1, lsl #3]
	pop {r4, pc}
_0223FE28:
	ldr r4, [ip, r1, lsl #3]
	and r0, r4, r0
	orr r0, r0, r2
	orr r0, r0, r3, lsl #25
	str r0, [ip, r1, lsl #3]
	pop {r4, pc}
_0223FE40:
	ldrb r4, [r0, #0xc]
	mov r1, #0
	cmp r4, #0
	pople {r4, pc}
	ldr lr, _0223FE94 @ =0xC1FFFCFF
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
	pop {r4, pc}
	.align 2, 0
_0223FE94: .4byte 0xC1FFFCFF
	arm_func_end ov13_0223FDF4

	arm_func_start ov13_0223FE98
ov13_0223FE98: @ 0x0223FE98
	push {r4, lr}
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
	pop {r4, pc}
_0223FED0:
	ldrb r1, [r0, #0xc]
	mov r4, #0
	cmp r1, #0
	pople {r4, pc}
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
	pop {r4, pc}
	arm_func_end ov13_0223FE98

	arm_func_start ov13_0223FF18
ov13_0223FF18: @ 0x0223FF18
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	cmp r1, #0
	ldr r5, [r0, #8]
	blt _0223FF54
	ldr r4, [r5, r1, lsl #3]
	ldr r0, _02240000 @ =0xFE00FF00
	and r3, r3, #0xff
	and r0, r4, r0
	lsl r2, r2, #0x17
	orr r0, r0, r3
	orr r0, r0, r2, lsr #7
	add sp, sp, #0x10
	str r0, [r5, r1, lsl #3]
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_0223FF54:
	ldr r1, [r5]
	ldr ip, _02240000 @ =0xFE00FF00
	and r6, r3, #0xff
	and r7, r1, ip
	mov sb, r1
	ldr r1, _02240004 @ =0x01FF0000
	lsl r8, r2, #0x17
	orr r6, r7, r6
	orr r6, r6, r8, lsr #7
	str r6, [r5]
	ldrb r6, [r0, #0xc]
	and r4, sb, r1
	and lr, sb, #0xff
	lsr r7, r4, #0x10
	str r7, [sp, #0xc]
	cmp r6, #1
	str lr, [sp, #8]
	sub r6, r2, r4, lsr #16
	sub r7, r3, lr
	mov r4, #1
	addle sp, sp, #0x10
	pople {r4, r5, r6, r7, r8, sb, sl, pc}
_0223FFAC:
	ldr r2, [r5, r4, lsl #3]
	and r3, r2, #0xff
	mov sb, r2
	and lr, r2, r1
	add r8, r3, r7
	add r2, r6, lr, lsr #16
	and sb, sb, ip
	and r8, r8, #0xff
	lsl sl, r2, #0x17
	orr r2, sb, r8
	orr r2, r2, sl, lsr #7
	str r2, [r5, r4, lsl #3]
	ldrb r2, [r0, #0xc]
	add r4, r4, #1
	lsr r8, lr, #0x10
	cmp r4, r2
	blt _0223FFAC
	str r3, [sp]
	str r8, [sp, #4]
	add sp, sp, #0x10
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02240000: .4byte 0xFE00FF00
_02240004: .4byte 0x01FF0000
	arm_func_end ov13_0223FF18

	arm_func_start ov13_02240008
ov13_02240008: @ 0x02240008
	push {r3, lr}
	cmp r1, #0
	ldr ip, [r0, #8]
	blt _02240030
	add r1, ip, r1, lsl #3
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, r2, lsl #10
	strh r0, [r1, #4]
	pop {r3, pc}
_02240030:
	ldrb r1, [r0, #0xc]
	mov lr, #0
	cmp r1, #0
	pople {r3, pc}
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
	pop {r3, pc}
	arm_func_end ov13_02240008

	arm_func_start ov13_02240068
ov13_02240068: @ 0x02240068
	push {r3, lr}
	ldr lr, [r0, #8]
	ldr r0, _02240094 @ =0x01FF0000
	ldr ip, [lr, r1, lsl #3]
	and r0, ip, r0
	lsr r0, r0, #0x10
	str r0, [r2]
	ldr r0, [lr, r1, lsl #3]
	and r0, r0, #0xff
	str r0, [r3]
	pop {r3, pc}
	.align 2, 0
_02240094: .4byte 0x01FF0000
	arm_func_end ov13_02240068

	arm_func_start ov13_02240098
ov13_02240098: @ 0x02240098
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, r1
	add r1, sp, #0
	mov r2, #4
	bl ov13_0223F95C
	ldr r1, _022400C4 @ =0x0224F5D4
	str r0, [r1, r4, lsl #2]
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_022400C4: .4byte 0x0224F5D4
	arm_func_end ov13_02240098

	arm_func_start ov13_022400C8
ov13_022400C8: @ 0x022400C8
	push {r4, lr}
	ldr r1, _022400EC @ =0x0224F5D4
	mov r4, r0
	ldr r0, [r1, r4, lsl #2]
	bl ov13_0223FA50
	ldr r0, _022400EC @ =0x0224F5D4
	mov r1, #0
	str r1, [r0, r4, lsl #2]
	pop {r4, pc}
	.align 2, 0
_022400EC: .4byte 0x0224F5D4
	arm_func_end ov13_022400C8

	arm_func_start ov13_022400F0
ov13_022400F0: @ 0x022400F0
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r3, _02240180 @ =0x0224F5D4
	mov r5, r2
	ldr r6, [r3, r0, lsl #2]
	lsl r2, r1, #3
	add r0, r6, r1, lsl #3
	ldr r3, [r0, #4]
	ldrh r4, [r6, r2]
	add r1, sp, #0
	mov r0, #0
	mov r2, #8
	add sb, r6, r3
	bl FUN_020D47EC
	cmp r4, #0
	mov sl, #0
	addle sp, sp, #8
	pople {r4, r5, r6, r7, r8, sb, sl, pc}
	add r8, sp, #0
	mov r7, #6
	mov r6, #8
_02240144:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	bl FUN_020D47B8
	mov r0, r8
	mov r1, r5
	mov r2, r6
	bl FUN_020D4808
	add sl, sl, #1
	cmp sl, r4
	add sb, sb, #6
	add r5, r5, #8
	blt _02240144
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02240180: .4byte 0x0224F5D4
	arm_func_end ov13_022400F0

	arm_func_start ov13_02240184
ov13_02240184: @ 0x02240184
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl ov13_02241D78
	mov r4, r0
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov13_022400F0
	mov r0, r4
	pop {r4, r5, r6, pc}
	arm_func_end ov13_02240184

	arm_func_start ov13_022401B0
ov13_022401B0: @ 0x022401B0
	push {r4, r5, r6, lr}
	ldr r3, _022401F4 @ =0x0224F5D4
	mov r6, r0
	mov r5, r1
	ldr r3, [r3, r6, lsl #2]
	lsl r1, r5, #3
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
	pop {r4, r5, r6, pc}
	.align 2, 0
_022401F4: .4byte 0x0224F5D4
	arm_func_end ov13_022401B0

	arm_func_start ov13_022401F8
ov13_022401F8: @ 0x022401F8
	push {r4, lr}
	mov r4, r0
	add r0, r4, #1
	lsl r0, r0, #2
	add r0, r0, #8
	mov r1, #4
	bl ov13_0224128C
	add r1, r4, #1
	strh r1, [r0]
	mov r1, #0
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	pop {r4, pc}
	arm_func_end ov13_022401F8

	arm_func_start ov13_0224022C
ov13_0224022C: @ 0x0224022C
	push {r4, r5, r6, lr}
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
	pop {r4, r5, r6, pc}
	arm_func_end ov13_0224022C

	arm_func_start ov13_0224026C
ov13_0224026C: @ 0x0224026C
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r0, sp, #8
	bl ov13_022412B0
	pop {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov13_0224026C

	arm_func_start ov13_02240288
ov13_02240288: @ 0x02240288
	push {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r0, #1
	mov r4, r1
	bl FUN_020D1204
	ldrb r2, [r5, #3]
	mov r6, r0
	ldrh r1, [r5]
	add r0, r2, #1
	bl FUN_020CCD3C
	ldrb r1, [r5, #2]
	mov r7, r0
	cmp r7, r1
	bne _022402C4
	bl FUN_020D3F48
_022402C4:
	ldrb r1, [r5, #3]
	mov r0, r6
	add r1, r5, r1, lsl #2
	str r4, [r1, #4]
	strb r7, [r5, #3]
	bl FUN_020D11D4
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end ov13_02240288

	arm_func_start ov13_022402E0
ov13_022402E0: @ 0x022402E0
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #1
	mov r4, #0
	bl FUN_020D1204
	ldrb r2, [r6, #3]
	ldrb r1, [r6, #2]
	mov r5, r0
	cmp r1, r2
	beq _02240328
	ldrh r1, [r6]
	add r0, r2, r1
	sub r0, r0, #1
	bl FUN_020CCD3C
	and r1, r0, #0xff
	strb r0, [r6, #3]
	add r0, r6, r1, lsl #2
	ldr r4, [r0, #4]
_02240328:
	mov r0, r5
	bl FUN_020D11D4
	mov r0, r4
	pop {r4, r5, r6, pc}
	arm_func_end ov13_022402E0

	arm_func_start ov13_02240338
ov13_02240338: @ 0x02240338
	push {r3, lr}
	mov r0, #0x18
	mov r1, #4
	bl ov13_0224128C
	ldr r2, _02240374 @ =0x0224F5DC
	mov r1, #0x3f
	str r0, [r2]
	ldr r0, _02240378 @ =0x04000050
	mov r2, #0x10
	bl FUN_020CF178
	ldr r0, _0224037C @ =0x04001050
	mov r1, #0x3f
	mov r2, #0x10
	bl FUN_020CF178
	pop {r3, pc}
	.align 2, 0
_02240374: .4byte 0x0224F5DC
_02240378: .4byte 0x04000050
_0224037C: .4byte 0x04001050
	arm_func_end ov13_02240338

	arm_func_start ov13_02240380
ov13_02240380: @ 0x02240380
	ldr ip, _0224038C @ =ov13_022412B0
	ldr r0, _02240390 @ =0x0224F5DC
	bx ip
	.align 2, 0
_0224038C: .4byte ov13_022412B0
_02240390: .4byte 0x0224F5DC
	arm_func_end ov13_02240380

	arm_func_start ov13_02240394
ov13_02240394: @ 0x02240394
	cmp r0, #1
	ldreq r0, _022403B4 @ =0x0224F5DC
	ldreq r0, [r0]
	ldrne r0, _022403B4 @ =0x0224F5DC
	ldrne r0, [r0]
	addne r0, r0, #0xc
	ldrb r0, [r0, #9]
	bx lr
	.align 2, 0
_022403B4: .4byte 0x0224F5DC
	arm_func_end ov13_02240394

	arm_func_start ov13_022403B8
ov13_022403B8: @ 0x022403B8
	push {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r4, _0224047C @ =0x02245940
	mov r5, r0
	ldrb r0, [r4, #0xb]
	ldrb r6, [r4, #8]
	ldrb lr, [r4, #9]
	strb r0, [sp, #3]
	cmp r1, #1
	ldreq r0, _02240480 @ =0x0224F5DC
	strb r6, [sp]
	ldreq r6, [r0]
	ldrne r0, _02240480 @ =0x0224F5DC
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
	popne {r3, r4, r5, r6, pc}
	cmp r1, #1
	add r0, sp, #0
	mov r1, r2
	bne _02240438
	ldrsb r2, [r0, r5]
	ldr r0, _02240484 @ =0x04001050
	bl FUN_020CF178
	b _02240444
_02240438:
	ldrsb r2, [r0, r5]
	ldr r0, _02240488 @ =0x04000050
	bl FUN_020CF178
_02240444:
	ldr r1, _0224048C @ =ov13_02240490
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
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0224047C: .4byte 0x02245940
_02240480: .4byte 0x0224F5DC
_02240484: .4byte 0x04001050
_02240488: .4byte 0x04000050
_0224048C: .4byte ov13_02240490
	arm_func_end ov13_022403B8

	arm_func_start ov13_02240490
ov13_02240490: @ 0x02240490
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r2, _022405A8 @ =0x02245940
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
	lsl r0, r0, #4
	strb r8, [sp, #5]
	strb r7, [sp, #6]
	strb r6, [sp, #7]
	strb lr, [sp]
	strb ip, [sp, #1]
	strb r3, [sp, #2]
	strb r2, [sp, #3]
	bl FUN_020CCD00
	ldrb r3, [r4, #8]
	add r2, sp, #4
	mov r1, r0
	ldrb r0, [r2, r3]
	tst r0, #1
	rsbne r1, r1, #0x10
	tst r0, #0x10
	ldr r0, _022405AC @ =0x0224F5DC
	rsbne r1, r1, #0
	ldr r0, [r0]
	cmp r4, r0
	bne _0224053C
	ldr r0, _022405B0 @ =0x04001050
	bl FUN_020CF1A0
	b _02240544
_0224053C:
	ldr r0, _022405B4 @ =0x04000050
	bl FUN_020CF1A0
_02240544:
	ldrsh r1, [r4, #4]
	ldrh r0, [r4, #6]
	cmp r1, r0
	addlt sp, sp, #8
	poplt {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _022405AC @ =0x0224F5DC
	ldrb r2, [r4, #8]
	ldr r0, [r0]
	add r1, sp, #0
	cmp r4, r0
	bne _02240580
	ldrsb r1, [r1, r2]
	ldr r0, _022405B0 @ =0x04001050
	bl FUN_020CF1A0
	b _0224058C
_02240580:
	ldrsb r1, [r1, r2]
	ldr r0, _022405B4 @ =0x04000050
	bl FUN_020CF1A0
_0224058C:
	mov r2, #0
	mov r1, r5
	mov r0, #1
	strb r2, [r4, #9]
	bl ov13_022425D0
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022405A8: .4byte 0x02245940
_022405AC: .4byte 0x0224F5DC
_022405B0: .4byte 0x04001050
_022405B4: .4byte 0x04000050
	arm_func_end ov13_02240490

	arm_func_start ov13_022405B8
ov13_022405B8: @ 0x022405B8
	push {r3, r4, r5, lr}
	ldr r1, _02240608 @ =0x0224F5DC
	mov r5, r0
	ldr r4, [r1]
	ldrb r0, [r4, #9]
	cmp r0, #0
	movne r0, #0
	popne {r3, r4, r5, pc}
	ldr r1, _0224060C @ =ov13_02240610
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
	pop {r3, r4, r5, pc}
	.align 2, 0
_02240608: .4byte 0x0224F5DC
_0224060C: .4byte ov13_02240610
	arm_func_end ov13_022405B8

	arm_func_start ov13_02240610
ov13_02240610: @ 0x02240610
	push {r3, lr}
	ldrsh r2, [r1, #4]
	add r2, r2, #1
	strh r2, [r1, #4]
	ldrsh r3, [r1, #4]
	ldrh r2, [r1, #6]
	cmp r3, r2
	poplt {r3, pc}
	mov r2, #0
	strb r2, [r1, #9]
	mov r1, r0
	mov r0, #1
	bl ov13_022425D0
	pop {r3, pc}
	arm_func_end ov13_02240610

	arm_func_start ov13_02240648
ov13_02240648: @ 0x02240648
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r0, #0x680
	mov r1, #4
	bl ov13_0224128C
	mov r4, r0
	ldr r3, _02240740 @ =0x0224F5E0
	add r1, r4, #0x10
	mov r0, #0x20
	mov r2, #0x30
	str r4, [r3]
	bl ov13_0224022C
	ldr r1, _02240740 @ =0x0224F5E0
	ldr r1, [r1]
	str r0, [r1, #0x670]
	bl ov13_0222B970
	cmp r0, #6
	mov r4, #4
	bne _022406E8
	mov r7, #0
	ldr r6, _02240744 @ =0x02247430
	ldr sb, _02240740 @ =0x0224F5E0
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
	bl FUN_020BC384
	add r7, r7, #1
	cmp r7, #2
	add r8, r8, #8
	blt _022406A4
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_022406E8:
	mov r8, #0
	ldr r6, _02240748 @ =0x02247438
	ldr sb, _02240740 @ =0x0224F5E0
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
	bl FUN_020BC384
	add r8, r8, #1
	cmp r8, #2
	add r7, r7, #8
	blt _022406FC
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02240740: .4byte 0x0224F5E0
_02240744: .4byte 0x02247430
_02240748: .4byte 0x02247438
	arm_func_end ov13_02240648

	arm_func_start ov13_0224074C
ov13_0224074C: @ 0x0224074C
	push {r3, r4, r5, lr}
	ldr r4, _02240790 @ =0x0224F5E0
	mov r5, #0
_02240758:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x674]
	bl ov13_0223FA50
	add r5, r5, #1
	cmp r5, #2
	blt _02240758
	ldr r0, _02240790 @ =0x0224F5E0
	ldr r0, [r0]
	ldr r0, [r0, #0x670]
	bl ov13_0224026C
	ldr r0, _02240794 @ =0x0224F5E0
	bl ov13_022412B0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02240790: .4byte 0x0224F5E0
_02240794: .4byte 0x0224F5E0
	arm_func_end ov13_0224074C

	arm_func_start ov13_02240798
ov13_02240798: @ 0x02240798
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r4, _02240870 @ =0x0224F5E0
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
	bl FUN_020BD590
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
	bl FUN_020BD3FC
	ldr r1, [r4, #0x14]
	mov r0, r4
	ldr r2, [r1, #4]
	mov r1, #0
	blx r2
	ldr r0, _02240870 @ =0x0224F5E0
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
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02240870: .4byte 0x0224F5E0
	arm_func_end ov13_02240798

	arm_func_start ov13_02240874
ov13_02240874: @ 0x02240874
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x28]
	bl ov13_02242034
	ldr r0, _0224089C @ =0x0224F5E0
	mov r1, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x670]
	bl ov13_02240288
	pop {r4, pc}
	.align 2, 0
_0224089C: .4byte 0x0224F5E0
	arm_func_end ov13_02240874

	arm_func_start ov13_022408A0
ov13_022408A0: @ 0x022408A0
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	ldr r0, _022409FC @ =0x0224F5E0
	ldr r3, _02240A00 @ =0x02245952
	lsl r4, r8, #2
	ldr r2, _02240A04 @ =0x02245950
	ldr r0, [r0]
	ldrh r5, [r3, r4]
	ldrh r6, [r2, r4]
	add r3, r0, #0x610
	mov r0, #0x30
	mul r2, r6, r5
	mov r7, r1
	mla r4, r8, r0, r3
	lsl r0, r2, #5
	mov r1, #0x20
	bl ov13_0224128C
	str r0, [r4, #0x28]
	cmp r8, #1
	bne _02240918
	ldr r1, _02240A08 @ =0x04001008
	ldrh r0, [r1]
	bic r0, r0, #0x40
	strh r0, [r1]
	ldrh r0, [r1]
	and r0, r0, #0x43
	orr r0, r0, #0xc00
	strh r0, [r1]
	b _02240938
_02240918:
	ldr r1, _02240A0C @ =0x04000008
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
	bl FUN_020BD3D0
	ldr r0, _022409FC @ =0x0224F5E0
	mov r1, #1
	ldr r0, [r0]
	cmp r8, #1
	str r4, [r4, #0x18]
	add r0, r0, r7, lsl #3
	str r0, [r4, #0x1c]
	str r1, [r4, #0x20]
	str r1, [r4, #0x24]
	bne _02240984
	bl FUN_020CEC70
	b _02240988
_02240984:
	bl FUN_020CEC3C
_02240988:
	ldr r1, _02240A10 @ =0x0224594C
	lsl r2, r8, #1
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
	bl FUN_020BD484
	mov r0, r4
	mov r1, #0
	bl ov13_02240D80
	ldr r0, _022409FC @ =0x0224F5E0
	ldr r1, _02240A14 @ =ov13_02240A18
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
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022409FC: .4byte 0x0224F5E0
_02240A00: .4byte 0x02245952
_02240A04: .4byte 0x02245950
_02240A08: .4byte 0x04001008
_02240A0C: .4byte 0x04000008
_02240A10: .4byte 0x0224594C
_02240A14: .4byte ov13_02240A18
	arm_func_end ov13_022408A0

	arm_func_start ov13_02240A18
ov13_02240A18: @ 0x02240A18
	push {r4, lr}
	mov r4, r1
	ldrb r0, [r4]
	cmp r0, #0
	popeq {r4, pc}
	ldr r0, _02240A9C @ =0x0224F5E0
	ldr r1, [r0]
	add r0, r1, #0x27c
	add r0, r0, #0x400
	cmp r4, r0
	bne _02240A6C
	ldr r0, [r1, #0x638]
	mov r1, #0x6000
	bl DC_FlushRange
	ldr r0, _02240A9C @ =0x0224F5E0
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x6000
	ldr r0, [r0, #0x638]
	bl FUN_020D0224
	b _02240A90
_02240A6C:
	ldr r0, [r1, #0x668]
	mov r1, #0x3000
	bl DC_FlushRange
	ldr r0, _02240A9C @ =0x0224F5E0
	mov r1, #0x3000
	ldr r0, [r0]
	mov r2, r1
	ldr r0, [r0, #0x668]
	bl FUN_020D0284
_02240A90:
	mov r0, #0
	strb r0, [r4]
	pop {r4, pc}
	.align 2, 0
_02240A9C: .4byte 0x0224F5E0
	arm_func_end ov13_02240A18

	arm_func_start ov13_02240AA0
ov13_02240AA0: @ 0x02240AA0
	push {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x2c]
	mov r0, #1
	bl ov13_022425F0
	ldr r0, _02240B00 @ =0x0224F5E0
	ldr r0, [r0]
	add r0, r0, #0x610
	cmp r4, r0
	bne _02240AE0
	bl FUN_020CEED4
	mov r1, r0
	mov r0, #0
	mov r2, #0x6000
	bl FUN_020D4790
	b _02240AF4
_02240AE0:
	bl FUN_020CEED4
	mov r1, r0
	mov r0, #0
	mov r2, #0x3000
	bl FUN_020D4790
_02240AF4:
	add r0, r4, #0x28
	bl ov13_022412B0
	pop {r4, pc}
	.align 2, 0
_02240B00: .4byte 0x0224F5E0
	arm_func_end ov13_02240AA0

	arm_func_start ov13_02240B04
ov13_02240B04: @ 0x02240B04
	ldr r2, _02240B20 @ =0x0224F5E0
	mov r1, #0x30
	ldr r2, [r2]
	ldr ip, _02240B24 @ =ov13_02240AA0
	add r2, r2, #0x610
	mla r0, r1, r0, r2
	bx ip
	.align 2, 0
_02240B20: .4byte 0x0224F5E0
_02240B24: .4byte ov13_02240AA0
	arm_func_end ov13_02240B04

	arm_func_start ov13_02240B28
ov13_02240B28: @ 0x02240B28
	push {r4, lr}
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
_02240B5C: @ jump table
	b _02240B7C @ case 0
	b _02240B88 @ case 1
	b _02240B88 @ case 2
	b _02240B94 @ case 3
	b _02240B94 @ case 4
	b _02240BA0 @ case 5
	b _02240BA0 @ case 6
	b _02240B7C @ case 7
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
	bl FUN_020BDB00
	add sp, sp, #0x10
	pop {r4, pc}
	arm_func_end ov13_02240B28

	arm_func_start ov13_02240BD8
ov13_02240BD8: @ 0x02240BD8
	push {r3, lr}
	sub sp, sp, #8
	ldrh ip, [sp, #0x10]
	str r3, [sp]
	ldr r3, _02240C10 @ =0x0224F5E0
	str ip, [sp, #4]
	ldr lr, [r3]
	ldr ip, [sp, #0x14]
	mov r3, r2
	mov r2, r1
	add r1, lr, ip, lsl #3
	bl FUN_020BD2AC
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_02240C10: .4byte 0x0224F5E0
	arm_func_end ov13_02240BD8

	arm_func_start ov13_02240C14
ov13_02240C14: @ 0x02240C14
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
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
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02240C48:
	ldr r0, _02240CB8 @ =0x0224F5E0
	ldr r0, [r0]
	add r4, r0, r5, lsl #3
	mov r0, r4
	bl FUN_020BC3A8
	mov r1, r0
	ldr r0, _02240CBC @ =0x0000FFFF
	cmp r1, r0
	ldreq r0, [r4]
	ldrheq r1, [r0, #2]
	mov r0, r4
	bl FUN_020BC3F0
	ldrh r1, [r6]
	mov r2, r0
	mov r0, sl
	stm sp, {r1, r5}
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
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02240CB8: .4byte 0x0224F5E0
_02240CBC: .4byte 0x0000FFFF
	arm_func_end ov13_02240C14

	arm_func_start ov13_02240CC0
ov13_02240CC0: @ 0x02240CC0
	push {r4, lr}
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
_02240CF4: @ jump table
	b _02240D14 @ case 0
	b _02240D20 @ case 1
	b _02240D20 @ case 2
	b _02240D2C @ case 3
	b _02240D2C @ case 4
	b _02240D38 @ case 5
	b _02240D38 @ case 6
	b _02240D14 @ case 7
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
	bl FUN_020BDC24
	add sp, sp, #0x18
	pop {r4, pc}
	arm_func_end ov13_02240CC0

	arm_func_start ov13_02240D80
ov13_02240D80: @ 0x02240D80
	push {r3, lr}
	ldr r2, [r0, #0x14]
	ldr r2, [r2, #4]
	blx r2
	pop {r3, pc}
	arm_func_end ov13_02240D80

	arm_func_start ov13_02240D94
ov13_02240D94: @ 0x02240D94
	push {r4, r5, r6, r7, r8, lr}
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
	bl FUN_020BD5EC
	add sp, sp, #0x10
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end ov13_02240D94

	arm_func_start ov13_02240E2C
ov13_02240E2C: @ 0x02240E2C
	ldr r1, _02240E4C @ =0x0224F5E0
	ldr r2, [r1]
	add r1, r2, #0x610
	cmp r0, r1
	mov r0, #1
	strbeq r0, [r2, #0x67c]
	strbne r0, [r2, #0x67d]
	bx lr
	.align 2, 0
_02240E4C: .4byte 0x0224F5E0
	arm_func_end ov13_02240E2C

	arm_func_start ov13_02240E50
ov13_02240E50: @ 0x02240E50
	strh r0, [r2]
	strh r1, [r2, #2]
	bx lr
	arm_func_end ov13_02240E50

	arm_func_start ov13_02240E5C
ov13_02240E5C: @ 0x02240E5C
	ldr ip, [sp]
	strh r0, [ip]
	strh r1, [ip, #2]
	strh r2, [ip, #4]
	strh r3, [ip, #6]
	bx lr
	arm_func_end ov13_02240E5C

	arm_func_start ov13_02240E74
ov13_02240E74: @ 0x02240E74
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
ov13_02240EA8: @ 0x02240EA8
	cmp r0, #1
	bne _02240ED4
	ldr r3, _02240EF8 @ =0x04001000
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
	.align 2, 0
_02240EF8: .4byte 0x04001000
	arm_func_end ov13_02240EA8

	arm_func_start ov13_02240EFC
ov13_02240EFC: @ 0x02240EFC
	cmp r0, #1
	bne _02240F2C
	ldr r3, _02240F54 @ =0x04001000
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
	.align 2, 0
_02240F54: .4byte 0x04001000
	arm_func_end ov13_02240EFC

	arm_func_start ov13_02240F58
ov13_02240F58: @ 0x02240F58
	cmp r0, #1
	bne _02240FE0
	cmp r1, #0
	ldrh r0, [r2]
	ldrh r3, [r2, #2]
	bne _02240FA8
	ldrh r1, [r2, #4]
	ldrh ip, [r2, #6]
	lsl r2, r0, #8
	lsl r0, r3, #8
	and r3, r2, #0xff00
	and r1, r1, #0xff
	orr r3, r3, r1
	ldr r2, _02241060 @ =0x04001040
	and r1, r0, #0xff00
	and r0, ip, #0xff
	strh r3, [r2]
	orr r0, r1, r0
	strh r0, [r2, #4]
	bx lr
_02240FA8:
	ldrh r1, [r2, #4]
	ldrh ip, [r2, #6]
	lsl r2, r0, #8
	lsl r0, r3, #8
	and r3, r2, #0xff00
	and r1, r1, #0xff
	orr r3, r3, r1
	ldr r2, _02241064 @ =0x04001042
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
	lsl r2, r0, #8
	lsl r0, r3, #8
	and r3, r2, #0xff00
	and r1, r1, #0xff
	orr r3, r3, r1
	ldr r2, _02241068 @ =0x04000040
	and r1, r0, #0xff00
	and r0, ip, #0xff
	strh r3, [r2]
	orr r0, r1, r0
	strh r0, [r2, #4]
	bx lr
_02241028:
	ldrh r1, [r2, #4]
	ldrh ip, [r2, #6]
	lsl r2, r0, #8
	lsl r0, r3, #8
	and r3, r2, #0xff00
	and r1, r1, #0xff
	orr r3, r3, r1
	ldr r2, _0224106C @ =0x04000042
	and r1, r0, #0xff00
	and r0, ip, #0xff
	strh r3, [r2]
	orr r0, r1, r0
	strh r0, [r2, #4]
	bx lr
	.align 2, 0
_02241060: .4byte 0x04001040
_02241064: .4byte 0x04001042
_02241068: .4byte 0x04000040
_0224106C: .4byte 0x04000042
	arm_func_end ov13_02240F58

	arm_func_start ov13_02241070
ov13_02241070: @ 0x02241070
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	bx lr
_0224107C: @ jump table
	b _0224108C @ case 0
	b _022410DC @ case 1
	b _0224112C @ case 2
	b _0224117C @ case 3
_0224108C:
	cmp r0, #1
	bne _022410B8
	ldr r0, _022411CC @ =0x04001048
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f
	orr r1, r0, r2
	ldr r0, _022411CC @ =0x04001048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
_022410B8:
	ldr r0, _022411D0 @ =0x04000048
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f
	orr r1, r0, r2
	ldr r0, _022411D0 @ =0x04000048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
_022410DC:
	cmp r0, #1
	bne _02241108
	ldr r0, _022411CC @ =0x04001048
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f00
	orr r1, r0, r2, lsl #8
	ldr r0, _022411CC @ =0x04001048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
_02241108:
	ldr r0, _022411D0 @ =0x04000048
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f00
	orr r1, r0, r2, lsl #8
	ldr r0, _022411D0 @ =0x04000048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
_0224112C:
	cmp r0, #1
	bne _02241158
	ldr r0, _022411D4 @ =0x0400104A
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f00
	orr r1, r0, r2, lsl #8
	ldr r0, _022411D4 @ =0x0400104A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
_02241158:
	ldr r0, _022411D8 @ =0x0400004A
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f00
	orr r1, r0, r2, lsl #8
	ldr r0, _022411D8 @ =0x0400004A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
_0224117C:
	cmp r0, #1
	bne _022411A8
	ldr r0, _022411D4 @ =0x0400104A
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f
	orr r1, r0, r2
	ldr r0, _022411D4 @ =0x0400104A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
_022411A8:
	ldr r0, _022411D8 @ =0x0400004A
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f
	orr r1, r0, r2
	ldr r0, _022411D8 @ =0x0400004A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_022411CC: .4byte 0x04001048
_022411D0: .4byte 0x04000048
_022411D4: .4byte 0x0400104A
_022411D8: .4byte 0x0400004A
	arm_func_end ov13_02241070

	arm_func_start ov13_022411DC
ov13_022411DC: @ 0x022411DC
	push {r4, lr}
	mov r4, r0
	mov r1, #0
	mov r2, #0x40000
	bl FUN_020D4994
	mov r0, r4
	mov r1, #0x40000
	mov r2, #0
	bl FUN_020B535C
	ldr r1, _02241218 @ =0x0224F5E4
	cmp r0, #0
	str r0, [r1]
	popne {r4, pc}
	bl FUN_020D3F48
	pop {r4, pc}
	.align 2, 0
_02241218: .4byte 0x0224F5E4
	arm_func_end ov13_022411DC

	arm_func_start ov13_0224121C
ov13_0224121C: @ 0x0224121C
	push {r3, lr}
	ldr r0, _0224123C @ =0x0224F5E4
	ldr r0, [r0]
	bl FUN_020B5394
	ldr r0, _0224123C @ =0x0224F5E4
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_0224123C: .4byte 0x0224F5E4
	arm_func_end ov13_0224121C

	arm_func_start ov13_02241240
ov13_02241240: @ 0x02241240
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #1
	mov r4, r1
	bl FUN_020D1204
	ldr r1, _02241288 @ =0x0224F5E4
	mov r5, r0
	ldr r0, [r1]
	mov r1, r6
	mov r2, r4
	bl FUN_020B53A0
	movs r4, r0
	bne _02241278
	bl FUN_020D3F48
_02241278:
	mov r0, r5
	bl FUN_020D11D4
	mov r0, r4
	pop {r4, r5, r6, pc}
	.align 2, 0
_02241288: .4byte 0x0224F5E4
	arm_func_end ov13_02241240

	arm_func_start ov13_0224128C
ov13_0224128C: @ 0x0224128C
	push {r4, lr}
	mov r4, r0
	bl ov13_02241240
	mov r2, r4
	mov r1, #0
	mov r4, r0
	bl FUN_020D4994
	mov r0, r4
	pop {r4, pc}
	arm_func_end ov13_0224128C

	arm_func_start ov13_022412B0
ov13_022412B0: @ 0x022412B0
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	bl FUN_020D1204
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	popeq {r3, r4, r5, pc}
	ldr r0, _022412F0 @ =0x0224F5E4
	ldr r0, [r0]
	bl FUN_020B5530
	mov r0, r4
	bl FUN_020D11D4
	mov r0, #0
	str r0, [r5]
	pop {r3, r4, r5, pc}
	.align 2, 0
_022412F0: .4byte 0x0224F5E4
	arm_func_end ov13_022412B0

	arm_func_start ov13_022412F4
ov13_022412F4: @ 0x022412F4
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	bl FUN_020D1204
	mov r4, r0
	cmp r5, #0
	popeq {r3, r4, r5, pc}
	ldr r0, _0224132C @ =0x0224F5E4
	mov r1, r5
	ldr r0, [r0]
	bl FUN_020B5530
	mov r0, r4
	bl FUN_020D11D4
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224132C: .4byte 0x0224F5E4
	arm_func_end ov13_022412F4

	arm_func_start ov13_02241330
ov13_02241330: @ 0x02241330
	push {r3, lr}
	sub sp, sp, #8
	mov r0, #0x3a
	mov r1, #4
	bl ov13_0224128C
	ldr r1, _022413A8 @ =0x0224F5E8
	str r0, [r1, #4]
	add r0, sp, #0
	bl FUN_020D9F68
	cmp r0, #0
	bne _02241360
	bl FUN_020D3F48
_02241360:
	add r0, sp, #0
	bl FUN_020D9FFC
	ldr r1, _022413A8 @ =0x0224F5E8
	mov r0, #0
	ldr r2, [r1, #4]
	mov r1, #4
	mov r3, #5
	bl FUN_020DA208
	mov r0, #2
	bl FUN_020DA804
	mov r0, #2
	bl FUN_020DA81C
	cmp r0, #0
	beq _0224139C
	bl FUN_020D3F48
_0224139C:
	bl ov13_022413E4
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_022413A8: .4byte 0x0224F5E8
	arm_func_end ov13_02241330

	arm_func_start ov13_022413AC
ov13_022413AC: @ 0x022413AC
	push {r3, r4, r5, lr}
	mov r5, #4
	mov r4, r5
_022413B8:
	bl FUN_020DA308
	mov r0, r5
	bl FUN_020DA804
	mov r0, r4
	bl FUN_020DA81C
	cmp r0, #0
	bne _022413B8
	ldr r0, _022413E0 @ =0x0224F5EC
	bl ov13_022412B0
	pop {r3, r4, r5, pc}
	.align 2, 0
_022413E0: .4byte 0x0224F5EC
	arm_func_end ov13_022413AC

	arm_func_start ov13_022413E4
ov13_022413E4: @ 0x022413E4
	push {r3, lr}
	bl ov13_022413F4
	bl ov13_022414F8
	pop {r3, pc}
	arm_func_end ov13_022413E4

	arm_func_start ov13_022413F4
ov13_022413F4: @ 0x022413F4
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _022414E4 @ =0x04000130
	ldr r0, _022414E8 @ =0x027FFFA8
	ldrh r2, [r1]
	ldrh r1, [r0]
	ldr r4, _022414EC @ =0x0224F5E8
	ldr r0, _022414F0 @ =0x00002FFF
	orr r1, r2, r1
	eor r1, r1, r0
	and r0, r1, r0
	ldr r5, [r4, #4]
	lsl r0, r0, #0x10
	ldrh r1, [r5, #0x30]
	lsr ip, r0, #0x10
	ldr r3, _022414F4 @ =0x0224F5F0
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
	lsl r6, r1, r2
	lsl lr, r6, #0x10
	tst ip, lr, lsr #16
	strbeq r0, [r3]
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
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022414E4: .4byte 0x04000130
_022414E8: .4byte 0x027FFFA8
_022414EC: .4byte 0x0224F5E8
_022414F0: .4byte 0x00002FFF
_022414F4: .4byte 0x0224F5F0
	arm_func_end ov13_022413F4

	arm_func_start ov13_022414F8
ov13_022414F8: @ 0x022414F8
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r0, _02241690 @ =0x0224F5E8
	mov r5, #0
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x38]
	lsl r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	movne r6, #1
	moveq r6, #0
	bl FUN_020DA4E4
	ldr r7, _02241690 @ =0x0224F5E8
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
	ldrheq r2, [r1, #6]
	cmpeq r2, #0
	bne _02241588
	add r0, sp, #0
	mov r5, #1
	bl FUN_020DA6E0
	ldr r1, _02241690 @ =0x0224F5E8
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
	bl FUN_020CCD3C
	cmp r4, #4
	blt _02241544
_022415A0:
	ldr r0, _02241690 @ =0x0224F5E8
	eor r7, r5, r6
	ldr r4, [r0, #4]
	and r1, r5, r7
	ldrb r3, [r4, #0x38]
	and r2, r1, #0xff
	and r1, r6, r7
	bic r3, r3, #2
	lsl r2, r2, #0x1f
	orr r2, r3, r2, lsr #30
	strb r2, [r4, #0x38]
	ldr r4, [r0, #4]
	and r1, r1, #0xff
	ldrb r3, [r4, #0x38]
	lsl r2, r1, #0x1f
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
	lsl r1, r2, #0x1e
	lsr r1, r1, #0x1f
	bic r2, r2, #4
	lsl r1, r1, #0x1f
	orr r1, r2, r1, lsr #29
	strb r1, [r3, #0x38]
	moveq r1, #0
	strbeq r1, [r0, #1]
	popeq {r4, r5, r6, r7, r8, pc}
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
	pop {r4, r5, r6, r7, r8, pc}
_02241664:
	cmp r1, #0x2f
	addne sp, sp, #8
	popne {r4, r5, r6, r7, r8, pc}
	ldr r3, [r0, #4]
	mov r1, #0x28
	ldrb r2, [r3, #0x38]
	orr r2, r2, #4
	strb r2, [r3, #0x38]
	strb r1, [r0, #1]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02241690: .4byte 0x0224F5E8
	arm_func_end ov13_022414F8

	arm_func_start ov13_02241694
ov13_02241694: @ 0x02241694
	ldr r1, _022416CC @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _022416D0 @ =0x0224F5E8
	ldr r1, [r1, #4]
	ldrh r1, [r1, #0x32]
	and r1, r0, r1
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_022416CC: .4byte 0x027FFFA8
_022416D0: .4byte 0x0224F5E8
	arm_func_end ov13_02241694

	arm_func_start ov13_022416D4
ov13_022416D4: @ 0x022416D4
	ldr r1, _0224170C @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _02241710 @ =0x0224F5E8
	ldr r1, [r1, #4]
	ldrh r1, [r1, #0x34]
	and r1, r0, r1
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0224170C: .4byte 0x027FFFA8
_02241710: .4byte 0x0224F5E8
	arm_func_end ov13_022416D4

	arm_func_start ov13_02241714
ov13_02241714: @ 0x02241714
	ldr r1, _0224174C @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _02241750 @ =0x0224F5E8
	ldr r1, [r1, #4]
	ldrh r1, [r1, #0x36]
	and r1, r0, r1
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0224174C: .4byte 0x027FFFA8
_02241750: .4byte 0x0224F5E8
	arm_func_end ov13_02241714

	arm_func_start ov13_02241754
ov13_02241754: @ 0x02241754
	ldr r1, _022417D4 @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _022417D8 @ =0x0224F5E8
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	lsl r1, r1, #0x1f
	lsrs r1, r1, #0x1f
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
	.align 2, 0
_022417D4: .4byte 0x027FFFA8
_022417D8: .4byte 0x0224F5E8
	arm_func_end ov13_02241754

	arm_func_start ov13_022417DC
ov13_022417DC: @ 0x022417DC
	ldr r1, _0224185C @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _02241860 @ =0x0224F5E8
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	lsl r1, r1, #0x1e
	lsrs r1, r1, #0x1f
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
	.align 2, 0
_0224185C: .4byte 0x027FFFA8
_02241860: .4byte 0x0224F5E8
	arm_func_end ov13_022417DC

	arm_func_start ov13_02241864
ov13_02241864: @ 0x02241864
	ldr r1, _022418E4 @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _022418E8 @ =0x0224F5E8
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	lsl r1, r1, #0x1d
	lsrs r1, r1, #0x1f
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
	.align 2, 0
_022418E4: .4byte 0x027FFFA8
_022418E8: .4byte 0x0224F5E8
	arm_func_end ov13_02241864

	arm_func_start ov13_022418EC
ov13_022418EC: @ 0x022418EC
	ldr r1, _0224196C @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _02241970 @ =0x0224F5E8
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	lsl r1, r1, #0x1c
	lsrs r1, r1, #0x1f
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
	.align 2, 0
_0224196C: .4byte 0x027FFFA8
_02241970: .4byte 0x0224F5E8
	arm_func_end ov13_022418EC

	arm_func_start ov13_02241974
ov13_02241974: @ 0x02241974
	push {r3, lr}
	sub sp, sp, #8
	ldr r1, _022419D8 @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	addne sp, sp, #8
	movne r0, #0
	popne {r3, pc}
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
	pop {r3, pc}
	.align 2, 0
_022419D8: .4byte 0x027FFFA8
	arm_func_end ov13_02241974

	arm_func_start ov13_022419DC
ov13_022419DC: @ 0x022419DC
	ldr r1, _02241A3C @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _02241A40 @ =0x0224F5E8
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	lsl r1, r1, #0x1f
	lsrs r1, r1, #0x1f
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
	.align 2, 0
_02241A3C: .4byte 0x027FFFA8
_02241A40: .4byte 0x0224F5E8
	arm_func_end ov13_022419DC

	arm_func_start ov13_02241A44
ov13_02241A44: @ 0x02241A44
	push {r3, lr}
	ldr r0, _02241AB8 @ =0x0224F5E8
	ldrb r0, [r0]
	cmp r0, #0
	ldr r0, _02241ABC @ =0x027FFFA8
	beq _02241A8C
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	popne {r3, pc}
	mov r0, #1
	bl FUN_020DB774
	cmp r0, #0
	popeq {r3, pc}
	ldr r0, _02241AB8 @ =0x0224F5E8
	mov r1, #0
	strb r1, [r0]
	pop {r3, pc}
_02241A8C:
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	popeq {r3, pc}
	mov r0, #0
	bl FUN_020DB774
	cmp r0, #0
	ldrne r0, _02241AB8 @ =0x0224F5E8
	movne r1, #1
	strbne r1, [r0]
	pop {r3, pc}
	.align 2, 0
_02241AB8: .4byte 0x0224F5E8
_02241ABC: .4byte 0x027FFFA8
	arm_func_end ov13_02241A44

	arm_func_start ov13_02241AC0
ov13_02241AC0: @ 0x02241AC0
	push {r3, lr}
	ldr r0, _02241B20 @ =0x04000210
	ldr r1, _02241B24 @ =0x0224F600
	ldr r2, [r0]
	ldr r0, _02241B28 @ =0x00040018
	str r2, [r1, #4]
	bl FUN_020D11A8
	mov r0, #1
	bl FUN_020D11D4
	mov r0, #1
	bl FUN_020D108C
	ldr r2, _02241B24 @ =0x0224F600
	ldr r1, _02241B2C @ =ov13_02241B70
	str r0, [r2]
	mov r0, #1
	bl FUN_020D1004
	mov r0, #1
	bl FUN_020D1234
	ldr r2, _02241B30 @ =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	bl FUN_020D3A24
	pop {r3, pc}
	.align 2, 0
_02241B20: .4byte 0x04000210
_02241B24: .4byte 0x0224F600
_02241B28: .4byte 0x00040018
_02241B2C: .4byte ov13_02241B70
_02241B30: .4byte 0x04000208
	arm_func_end ov13_02241AC0

	arm_func_start ov13_02241B34
ov13_02241B34: @ 0x02241B34
	push {r3, lr}
	ldr r2, _02241B68 @ =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	ldr r0, _02241B6C @ =0x0224F600
	strh r1, [r2]
	ldr r0, [r0, #4]
	bl FUN_020D11A8
	ldr r1, _02241B6C @ =0x0224F600
	mov r0, #1
	ldr r1, [r1]
	bl FUN_020D1004
	pop {r3, pc}
	.align 2, 0
_02241B68: .4byte 0x04000208
_02241B6C: .4byte 0x0224F600
	arm_func_end ov13_02241B34

	arm_func_start ov13_02241B70
ov13_02241B70: @ 0x02241B70
	push {r3, lr}
	mov r0, #1
	bl ov13_02242478
	ldr r0, _02241B94 @ =0x027E0000
	add r0, r0, #0x3000
	ldr r1, [r0, #0xff8]
	orr r1, r1, #1
	str r1, [r0, #0xff8]
	pop {r3, pc}
	.align 2, 0
_02241B94: .4byte 0x027E0000
	arm_func_end ov13_02241B70

	arm_func_start ov13_02241B98
ov13_02241B98: @ 0x02241B98
	push {r3, lr}
	mov r0, #0x10
	mov r1, #4
	bl ov13_0224128C
	mov r2, #0
	str r2, [r0]
	add r1, r0, #8
	str r1, [r0, #4]
	str r0, [r0, #8]
	str r2, [r0, #0xc]
	pop {r3, pc}
	arm_func_end ov13_02241B98

	arm_func_start ov13_02241BC4
ov13_02241BC4: @ 0x02241BC4
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r0, sp, #8
	bl ov13_022412B0
	pop {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov13_02241BC4

	arm_func_start ov13_02241BE0
ov13_02241BE0: @ 0x02241BE0
	push {r4, lr}
	mov r4, r0
	mov r0, #1
	bl FUN_020D1204
	ldm r4, {r2, r3}
	str r3, [r2, #4]
	ldr r3, [r4]
	ldr r2, [r4, #4]
	mov r1, #0
	str r3, [r2]
	str r1, [r4, #4]
	str r1, [r4]
	bl FUN_020D11D4
	pop {r4, pc}
	arm_func_end ov13_02241BE0

	arm_func_start ov13_02241C18
ov13_02241C18: @ 0x02241C18
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	mov r4, r1
	bl FUN_020D1204
	ldr r1, [r5]
	str r4, [r1, #4]
	ldr r1, [r5]
	stm r4, {r1, r5}
	str r4, [r5]
	bl FUN_020D11D4
	pop {r3, r4, r5, pc}
	arm_func_end ov13_02241C18

	arm_func_start ov13_02241C48
ov13_02241C48: @ 0x02241C48
	ldr ip, _02241C54 @ =ov13_02241C18
	add r0, r0, #8
	bx ip
	.align 2, 0
_02241C54: .4byte ov13_02241C18
	arm_func_end ov13_02241C48

	arm_func_start ov13_02241C58
ov13_02241C58: @ 0x02241C58
	ldr ip, _02241C64 @ =ov13_02241C18
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_02241C64: .4byte ov13_02241C18
	arm_func_end ov13_02241C58

	arm_func_start ov13_02241C68
ov13_02241C68: @ 0x02241C68
	push {r4, r5, r6, r7, r8, lr}
	ldr r0, _02241CF8 @ =0x0000080C
	mov r1, #4
	bl ov13_0224128C
	mov r1, r0
	ldr r3, _02241CFC @ =0x0224F608
	mov r0, #0x200
	mov r2, #0x800
	str r1, [r3]
	bl FUN_020D4858
	mov r5, #0
	ldr r7, _02241CFC @ =0x0224F608
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
	ldr r1, _02241D00 @ =ov13_02241D04
	mov r0, #1
	mov r2, #0
	mov r3, #0xc8
	bl ov13_02242528
	ldr r1, _02241CFC @ =0x0224F608
	ldr r1, [r1]
	str r0, [r1, #0x808]
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02241CF8: .4byte 0x0000080C
_02241CFC: .4byte 0x0224F608
_02241D00: .4byte ov13_02241D04
	arm_func_end ov13_02241C68

	arm_func_start ov13_02241D04
ov13_02241D04: @ 0x02241D04
	push {r3, lr}
	ldr r0, _02241D48 @ =0x0224F608
	mov r1, #0x800
	ldr r0, [r0]
	bl DC_FlushRange
	ldr r0, _02241D48 @ =0x0224F608
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x400
	bl FUN_020CFDC8
	ldr r0, _02241D48 @ =0x0224F608
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x400
	add r0, r0, #0x400
	bl FUN_020CFE1C
	pop {r3, pc}
	.align 2, 0
_02241D48: .4byte 0x0224F608
	arm_func_end ov13_02241D04

	arm_func_start ov13_02241D4C
ov13_02241D4C: @ 0x02241D4C
	push {r3, lr}
	ldr r1, _02241D70 @ =0x0224F608
	mov r0, #1
	ldr r1, [r1]
	ldr r1, [r1, #0x808]
	bl ov13_022425F0
	ldr r0, _02241D74 @ =0x0224F608
	bl ov13_022412B0
	pop {r3, pc}
	.align 2, 0
_02241D70: .4byte 0x0224F608
_02241D74: .4byte 0x0224F608
	arm_func_end ov13_02241D4C

	arm_func_start ov13_02241D78
ov13_02241D78: @ 0x02241D78
	ldr r1, _02241D90 @ =0x0224F608
	ldr ip, _02241D94 @ =ov13_022402E0
	ldr r1, [r1]
	add r0, r1, r0, lsl #2
	ldr r0, [r0, #0x800]
	bx ip
	.align 2, 0
_02241D90: .4byte 0x0224F608
_02241D94: .4byte ov13_022402E0
	arm_func_end ov13_02241D78

	arm_func_start ov13_02241D98
ov13_02241D98: @ 0x02241D98
	mov r1, r0
	ldr r3, [r1]
	ldr r0, _02241DD8 @ =0xC1FFFCFF
	ldr r2, _02241DDC @ =0x0224F608
	and r0, r3, r0
	orr r0, r0, #0x200
	str r0, [r1]
	ldr r3, [r2]
	mov r2, #0
	add r0, r3, #0x400
	cmp r1, r0
	movhs r2, #1
	add r0, r3, r2, lsl #2
	ldr ip, _02241DE0 @ =ov13_02240288
	ldr r0, [r0, #0x800]
	bx ip
	.align 2, 0
_02241DD8: .4byte 0xC1FFFCFF
_02241DDC: .4byte 0x0224F608
_02241DE0: .4byte ov13_02240288
	arm_func_end ov13_02241D98

	arm_func_start ov13_02241DE4
ov13_02241DE4: @ 0x02241DE4
	ldr r2, _02241DF8 @ =0x0224F608
	ldr r2, [r2]
	add r0, r2, r0, lsl #10
	add r0, r0, r1, lsl #3
	bx lr
	.align 2, 0
_02241DF8: .4byte 0x0224F608
	arm_func_end ov13_02241DE4

	arm_func_start ov13_02241DFC
ov13_02241DFC: @ 0x02241DFC
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r0, #0x340
	mov r1, #4
	bl ov13_0224128C
	ldr r4, _02241EB8 @ =0x0224F60C
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
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02241EB8: .4byte 0x0224F60C
	arm_func_end ov13_02241DFC

	arm_func_start ov13_02241EBC
ov13_02241EBC: @ 0x02241EBC
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r5, r0
	mov r0, #0x1a0
	mul sb, r5, r0
	ldr r0, _02242030 @ =0x0224F60C
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
	asr r8, r1, #2
	mov r0, #1
	strh r8, [r6, #0xa]
	bl FUN_020D1204
	mov r7, r0
	cmp sl, #0
	mov r0, #0x1a0
	beq _02241F98
	ldr r1, _02242030 @ =0x0224F60C
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
	ldr r0, _02242030 @ =0x0224F60C
	ldr r0, [r0]
	add r0, r0, sb
	add r0, r0, #0x18c
	cmp r5, r0
	bne _02242018
	bl FUN_020D3F48
	b _02242018
_02241F98:
	ldr r1, _02242030 @ =0x0224F60C
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
	ldr r0, _02242030 @ =0x0224F60C
	ldr r0, [r0]
	add r0, r0, sb
	add r0, r0, #0x180
	cmp r5, r0
	bne _02242018
	bl FUN_020D3F48
_02242018:
	ldrh r1, [r6, #8]
	mov r0, r7
	str r1, [r4]
	bl FUN_020D11D4
	mov r0, r6
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02242030: .4byte 0x0224F60C
	arm_func_end ov13_02241EBC

	arm_func_start ov13_02242034
ov13_02242034: @ 0x02242034
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl ov13_02241BE0
	ldr r0, _02242070 @ =0x0224F60C
	ldr r1, [r0]
	add r0, r1, #0x1a0
	cmp r5, r0
	movhs r4, #1
	mov r0, #0x1a0
	mla r0, r4, r0, r1
	ldr r0, [r0, #0x19c]
	mov r1, r5
	bl ov13_02240288
	pop {r3, r4, r5, pc}
	.align 2, 0
_02242070: .4byte 0x0224F60C
	arm_func_end ov13_02242034

	arm_func_start ov13_02242074
ov13_02242074: @ 0x02242074
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
ov13_022420A0: @ 0x022420A0
	push {r3, lr}
	bl FUN_020CEAA0
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1]
	bl FUN_020CEAB4
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1, #4]
	bl FUN_020CEAC8
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1, #8]
	bl FUN_020CEAEC
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1, #0xc]
	bl FUN_020CEB10
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1, #0x10]
	bl FUN_020CEB24
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1, #0x14]
	bl FUN_020CEB38
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1, #0x18]
	bl FUN_020CEB74
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1, #0x1c]
	bl FUN_020CEB88
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1, #0x20]
	bl FUN_020CEB9C
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1, #0x24]
	bl FUN_020CEBC4
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1, #0x28]
	bl FUN_020CEB4C
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1, #0x2c]
	bl FUN_020CEB60
	ldr r1, _02242150 @ =0x0224F610
	str r0, [r1, #0x30]
	ldr r0, [r1, #0x2c]
	bl FUN_020CE584
	bl ov13_0224225C
	pop {r3, pc}
	.align 2, 0
_02242150: .4byte 0x0224F610
	arm_func_end ov13_022420A0

	arm_func_start ov13_02242154
ov13_02242154: @ 0x02242154
	push {r4, lr}
	bl FUN_020CEAA0
	bl FUN_020CEAB4
	bl FUN_020CEB74
	bl FUN_020CEB88
	bl ov13_0224225C
	ldr r0, _02242250 @ =0x0224F610
	ldr r0, [r0]
	bl FUN_020CDC04
	ldr r0, _02242250 @ =0x0224F610
	ldr r0, [r0, #4]
	bl FUN_020CDE94
	ldr r0, _02242250 @ =0x0224F610
	ldr r0, [r0, #8]
	bl FUN_020CDFE4
	ldr r0, _02242250 @ =0x0224F610
	ldr r0, [r0, #0xc]
	bl FUN_020CE0E4
	ldr r0, _02242250 @ =0x0224F610
	ldr r0, [r0, #0x10]
	bl FUN_020CE190
	ldr r0, _02242250 @ =0x0224F610
	ldr r0, [r0, #0x14]
	bl FUN_020CE368
	ldr r0, _02242250 @ =0x0224F610
	ldr r0, [r0, #0x18]
	bl FUN_020CE450
	ldr r0, _02242250 @ =0x0224F610
	ldr r0, [r0, #0x1c]
	bl FUN_020CE650
	ldr r0, _02242250 @ =0x0224F610
	ldr r0, [r0, #0x20]
	bl FUN_020CE6F8
	ldr r0, _02242250 @ =0x0224F610
	ldr r0, [r0, #0x24]
	bl FUN_020CE768
	ldr r0, _02242250 @ =0x0224F610
	ldr r0, [r0, #0x28]
	bl FUN_020CE7E8
	ldr r0, _02242250 @ =0x0224F610
	ldr r0, [r0, #0x30]
	bl FUN_020CE630
	mov r3, #0
	ldr r2, _02242254 @ =0x04000050
	ldr r0, _02242258 @ =0x04001014
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
	bl FUN_020D3A38
	mov r4, r0
	mov r0, #1
	bl FUN_020DB774
	mov r0, r4
	bl FUN_020D3A4C
	pop {r4, pc}
	.align 2, 0
_02242250: .4byte 0x0224F610
_02242254: .4byte 0x04000050
_02242258: .4byte 0x04001014
	arm_func_end ov13_02242154

	arm_func_start ov13_0224225C
ov13_0224225C: @ 0x0224225C
	push {r3, lr}
	ldr r0, _022422D0 @ =0x000001F3
	bl FUN_020CE630
	mov r0, #0
	mov r1, #0x6800000
	mov r2, #0x40000
	bl FUN_020D4858
	ldr r1, _022422D4 @ =0x06880000
	mov r0, #0
	mov r2, #0x24000
	bl FUN_020D4858
	bl FUN_020CEB60
	mov r0, #0x200
	mov r1, #0x7000000
	mov r2, #0x400
	bl FUN_020D4858
	mov r0, #0
	mov r1, #0x5000000
	mov r2, #0x400
	bl FUN_020D4858
	mov r0, #0x200
	ldr r1, _022422D8 @ =0x07000400
	mov r2, #0x400
	bl FUN_020D4858
	mov r0, #0
	ldr r1, _022422DC @ =0x05000400
	mov r2, #0x400
	bl FUN_020D4858
	pop {r3, pc}
	.align 2, 0
_022422D0: .4byte 0x000001F3
_022422D4: .4byte 0x06880000
_022422D8: .4byte 0x07000400
_022422DC: .4byte 0x05000400
	arm_func_end ov13_0224225C

	arm_func_start ov13_022422E0
ov13_022422E0: @ 0x022422E0
	push {r3, lr}
	add r0, sp, #0
	bl FUN_020DB868
	cmp r0, #0
	popne {r3, pc}
	ldr r0, [sp]
	cmp r0, #0xf
	popeq {r3, pc}
	mov r0, #0xf
	bl FUN_020DB7F8
	pop {r3, pc}
	arm_func_end ov13_022422E0

	arm_func_start ov13_0224230C
ov13_0224230C: @ 0x0224230C
	ldr ip, _02242318 @ =FUN_020DB7F8
	mov r0, #1
	bx ip
	.align 2, 0
_02242318: .4byte FUN_020DB7F8
	arm_func_end ov13_0224230C

	arm_func_start ov13_0224231C
ov13_0224231C: @ 0x0224231C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #0x80
	mov r1, #4
	bl ov13_0224128C
	mov r8, #0
	ldr r4, _02242428 @ =0x0224F644
	ldr sb, _0224242C @ =0x02245960
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
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02242428: .4byte 0x0224F644
_0224242C: .4byte 0x02245960
	arm_func_end ov13_0224231C

	arm_func_start ov13_02242430
ov13_02242430: @ 0x02242430
	push {r3, r4, r5, lr}
	ldr r4, _02242470 @ =0x0224F644
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
	ldr r0, _02242474 @ =0x0224F644
	bl ov13_022412B0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02242470: .4byte 0x0224F644
_02242474: .4byte 0x0224F644
	arm_func_end ov13_02242430

	arm_func_start ov13_02242478
ov13_02242478: @ 0x02242478
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _02242524 @ =0x0224F644
	mov r6, r0
	ldr r0, [r5]
	add r2, r0, r6, lsl #6
	ldrb r1, [r2, #0x38]
	cmp r1, #0
	popeq {r3, r4, r5, r6, r7, pc}
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
	lsl r4, r6, #6
	mov r5, #0
	cmp r1, #0
	pople {r3, r4, r5, r6, r7, pc}
	ldr r7, _02242524 @ =0x0224F644
_022424EC:
	add r0, r4, r0
	ldr r0, [r0, #4]
	bl ov13_022402E0
	movs r1, r0
	popeq {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl ov13_022425FC
	ldr r0, [r7]
	add r5, r5, #1
	add r1, r4, r0
	ldr r1, [r1, #0x34]
	cmp r5, r1
	blt _022424EC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02242524: .4byte 0x0224F644
	arm_func_end ov13_02242478

	arm_func_start ov13_02242528
ov13_02242528: @ 0x02242528
	push {r3, lr}
	mov ip, #0
	str ip, [sp]
	bl ov13_0224253C
	pop {r3, pc}
	arm_func_end ov13_02242528

	arm_func_start ov13_0224253C
ov13_0224253C: @ 0x0224253C
	push {r4, r5, r6, r7, r8, lr}
	ldr r4, _022425C4 @ =0x0224F644
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
	bl FUN_020D1204
	ldr r1, _022425C4 @ =0x0224F644
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
	bl FUN_020D11D4
	mov r0, r4
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022425C4: .4byte 0x0224F644
	arm_func_end ov13_0224253C

	arm_func_start ov13_022425C8
ov13_022425C8: @ 0x022425C8
	str r1, [r0, #8]
	bx lr
	arm_func_end ov13_022425C8

	arm_func_start ov13_022425D0
ov13_022425D0: @ 0x022425D0
	ldr r2, _022425E8 @ =0x0224F644
	ldr ip, _022425EC @ =ov13_02240288
	ldr r2, [r2]
	add r0, r2, r0, lsl #6
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_022425E8: .4byte 0x0224F644
_022425EC: .4byte ov13_02240288
	arm_func_end ov13_022425D0

	arm_func_start ov13_022425F0
ov13_022425F0: @ 0x022425F0
	ldr ip, _022425F8 @ =ov13_022425FC
	bx ip
	.align 2, 0
_022425F8: .4byte ov13_022425FC
	arm_func_end ov13_022425F0

	arm_func_start ov13_022425FC
ov13_022425FC: @ 0x022425FC
	push {r3, r4, r5, lr}
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
	ldr r0, _0224263C @ =0x0224F644
	mov r1, r4
	ldr r0, [r0]
	ldr r0, [r0, r5, lsl #6]
	bl ov13_02240288
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224263C: .4byte 0x0224F644
	arm_func_end ov13_022425FC

	arm_func_start ov13_02242640
ov13_02242640: @ 0x02242640
	ldr r2, _02242654 @ =0x0224F644
	ldr r2, [r2]
	add r0, r2, r0, lsl #6
	strb r1, [r0, #0x38]
	bx lr
	.align 2, 0
_02242654: .4byte 0x0224F644
	arm_func_end ov13_02242640

	.rodata

_02244EB0:
	.byte 0x0E, 0x04, 0x05, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x78, 0x00, 0x10, 0x00, 0x08, 0x00, 0xAC, 0x00
	.byte 0x84, 0x00, 0xAC, 0x00, 0x27, 0x1F, 0x25, 0x00, 0x27, 0x00, 0x23, 0x1D, 0x21, 0x00, 0x59, 0x00
	.byte 0x27, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x02, 0x01, 0x01, 0x02, 0x01, 0x01, 0x02, 0x00, 0x0D, 0x00, 0x3C, 0x00, 0xE6, 0x00, 0x5E, 0x00
	.byte 0x0D, 0x00, 0x28, 0x00, 0xE6, 0x00, 0x70, 0x00, 0x80, 0x04, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00
	.byte 0x80, 0x02, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00
	.byte 0x80, 0x02, 0x00, 0x00, 0x6B, 0x00, 0x22, 0x00, 0x6C, 0x00, 0x22, 0x00, 0x7C, 0x00, 0x22, 0x00
	.byte 0x5D, 0x00, 0x22, 0x00, 0x5F, 0x00, 0x22, 0x00, 0x7D, 0x00, 0x22, 0x00, 0x50, 0x00, 0x22, 0x00
	.byte 0x6A, 0x65, 0x66, 0x67, 0x69, 0x73, 0x6B, 0x00, 0x0A, 0x0B, 0x04, 0x05, 0x02, 0x03, 0x0C, 0x0D
	.byte 0xE5, 0x00, 0x26, 0x00, 0x18, 0x17, 0x16, 0x15, 0x5F, 0x5E, 0x5D, 0x5C, 0x02, 0x03, 0x00, 0x00
	.byte 0x04, 0x05, 0x00, 0x00, 0x3C, 0x3D, 0x00, 0x00, 0x82, 0x83, 0x00, 0x00, 0x3A, 0x3B, 0x35, 0x39
	.byte 0x1C, 0x00, 0x02, 0x00, 0x78, 0x00, 0x12, 0x00, 0x11, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x0C, 0x0C, 0x0C, 0x0B, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x04, 0x00, 0xAA, 0x00
	.byte 0x84, 0x00, 0xAA, 0x00, 0x04, 0x00, 0x67, 0x00, 0x04, 0x00, 0x7D, 0x00, 0x04, 0x00, 0x93, 0x00
	.byte 0xDC, 0x00, 0x51, 0x00, 0x1B, 0x00, 0x12, 0x00, 0x20, 0x00, 0x12, 0x00, 0x28, 0x00, 0x12, 0x00
	.byte 0x20, 0x00, 0x12, 0x00, 0x04, 0x00, 0x51, 0x00, 0x16, 0x00, 0x51, 0x00, 0x28, 0x00, 0x51, 0x00
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
	.byte 0x02, 0x00, 0x4F, 0x00, 0x14, 0x00, 0x4F, 0x00, 0x26, 0x00, 0x4F, 0x00, 0x38, 0x00, 0x4F, 0x00
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
	.byte 0x82, 0x00, 0xA8, 0x00, 0x32, 0x33, 0x01, 0x2F, 0x00, 0x33, 0x02, 0x0C, 0x01, 0x33, 0x03, 0x0D
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
	.byte 0x34, 0xFE, 0x34, 0xFC, 0x33, 0xFD, 0x33, 0xFB, 0xFF, 0xFF, 0x20, 0x80, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x05, 0x00, 0x00, 0x37, 0x38, 0x00, 0x00, 0x3C, 0x3D, 0x00, 0x00, 0x02, 0x03, 0x00, 0x00
	.byte 0x12, 0x13, 0x00, 0x00, 0x10, 0x11, 0x00, 0x00, 0x1C, 0x00, 0x14, 0x00, 0x0C, 0x00, 0x04, 0x00
	.byte 0x1C, 0x00, 0x14, 0x00, 0x78, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x03, 0x03, 0x03
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x72, 0x00, 0x91, 0x00, 0x92, 0x00, 0x91, 0x00, 0x04, 0x00, 0xAA, 0x00, 0x84, 0x00, 0xAA, 0x00
	.byte 0x37, 0x00, 0x38, 0x00, 0x39, 0x00, 0x34, 0x00, 0x35, 0x00, 0x36, 0x00, 0x31, 0x00, 0x32, 0x00
	.byte 0x33, 0x00, 0x30, 0x00, 0x20, 0x00, 0x20, 0x00, 0x00, 0x00, 0x52, 0x00, 0x4C, 0x00, 0x72, 0x00
	.byte 0x4C, 0x00, 0x92, 0x00, 0x4C, 0x00, 0x52, 0x00, 0x63, 0x00, 0x72, 0x00, 0x63, 0x00, 0x92, 0x00
	.byte 0x63, 0x00, 0x52, 0x00, 0x7A, 0x00, 0x72, 0x00, 0x7A, 0x00, 0x92, 0x00, 0x7A, 0x00, 0x52, 0x00
	.byte 0x91, 0x00, 0x50, 0x00, 0x4A, 0x00, 0x70, 0x00, 0x4A, 0x00, 0x90, 0x00, 0x4A, 0x00, 0x50, 0x00
	.byte 0x61, 0x00, 0x70, 0x00, 0x61, 0x00, 0x90, 0x00, 0x61, 0x00, 0x50, 0x00, 0x78, 0x00, 0x70, 0x00
	.byte 0x78, 0x00, 0x90, 0x00, 0x78, 0x00, 0x50, 0x00, 0x8F, 0x00, 0x70, 0x00, 0x8F, 0x00, 0x90, 0x00
	.byte 0x8F, 0x00, 0x02, 0x00, 0xA8, 0x00, 0x82, 0x00, 0xA8, 0x00, 0x02, 0x0C, 0x01, 0x03, 0x00, 0x0D
	.byte 0x02, 0x04, 0x01, 0x0D, 0x00, 0x05, 0x05, 0x00, 0x04, 0x06, 0x03, 0x01, 0x05, 0x07, 0x04, 0x02
	.byte 0x03, 0x08, 0x08, 0x03, 0x07, 0x09, 0x06, 0x04, 0x08, 0x0A, 0x07, 0x05, 0x06, 0x0B, 0x0B, 0x06
	.byte 0x0A, 0x0C, 0x09, 0x07, 0x0B, 0x0D, 0x0A, 0x08, 0x09, 0x0D, 0x0D, 0x09, 0x0D, 0x00, 0x0C, 0xFF
	.byte 0x0C, 0xFE, 0x00, 0x00, 0x37, 0x38, 0x39, 0x34, 0x35, 0x36, 0x31, 0x32, 0x33, 0x30, 0x00, 0x00
	.byte 0x4E, 0x49, 0x4E, 0x54, 0x45, 0x4E, 0x44, 0x4F, 0x2D, 0x44, 0x53, 0x00, 0x01, 0x02, 0x08, 0x00
	.byte 0x20, 0x00, 0xAC, 0x00, 0xA0, 0x00, 0xB4, 0x00, 0x20, 0x00, 0xF8, 0x00, 0xA0, 0x00, 0x06, 0x00
	.byte 0x1E, 0x00, 0x9E, 0x00, 0x92, 0x00, 0xB2, 0x00, 0x1E, 0x00, 0xEA, 0x00, 0x92, 0x00, 0x63, 0x68
	.byte 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x31, 0x31, 0x2E, 0x6E, 0x63
	.byte 0x6C, 0x2E, 0x6C, 0x00, 0x01, 0x02, 0x03, 0x00, 0xE0, 0x00, 0x84, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x42, 0x67, 0x4F, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x2E, 0x6E, 0x63, 0x6C, 0x2E
	.byte 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x4F, 0x70, 0x74, 0x69, 0x6F
	.byte 0x6E, 0x31, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x08, 0x00, 0x24, 0x00, 0xF8, 0x00
	.byte 0x44, 0x00, 0x08, 0x00, 0x50, 0x00, 0xF8, 0x00, 0x70, 0x00, 0x08, 0x00, 0x7C, 0x00, 0xF8, 0x00
	.byte 0x9C, 0x00, 0x06, 0x00, 0x22, 0x00, 0xEA, 0x00, 0x36, 0x00, 0x06, 0x00, 0x4E, 0x00, 0xEA, 0x00
	.byte 0x62, 0x00, 0x06, 0x00, 0x7A, 0x00, 0xEA, 0x00, 0x8E, 0x00, 0x00, 0x00, 0x02, 0x63, 0x68, 0x61
	.byte 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x31, 0x2E, 0x6E, 0x63, 0x6C
	.byte 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x41, 0x70, 0x4C, 0x69, 0x73
	.byte 0x74, 0x42, 0x61, 0x63, 0x6B, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x07, 0x00, 0x32, 0x00
	.byte 0xD0, 0x00, 0x4C, 0x00, 0x07, 0x00, 0x4E, 0x00, 0xD0, 0x00, 0x68, 0x00, 0x07, 0x00, 0x6A, 0x00
	.byte 0xD0, 0x00, 0x84, 0x00, 0x07, 0x00, 0x86, 0x00, 0xD0, 0x00, 0xA0, 0x00, 0x85, 0x00, 0x1B, 0x00
	.byte 0xFD, 0x00, 0x2C, 0x00, 0x04, 0x00, 0x2E, 0x00, 0xDB, 0x00, 0x3F, 0x00, 0x04, 0x00, 0x4A, 0x00
	.byte 0xDB, 0x00, 0x5B, 0x00, 0x04, 0x00, 0x66, 0x00, 0xDB, 0x00, 0x77, 0x00, 0x04, 0x00, 0x82, 0x00
	.byte 0xDB, 0x00, 0x93, 0x00, 0x82, 0x00, 0x18, 0x00, 0xF0, 0x00, 0x2C, 0x00, 0x2E, 0x2D, 0x33, 0x00
	.byte 0x18, 0x17, 0x16, 0x15, 0x3E, 0x3D, 0x0E, 0x00, 0x10, 0x00, 0x00, 0x00, 0x47, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0x2C, 0xA0, 0x23, 0x02, 0x5C, 0xA0, 0x23, 0x02, 0x20, 0x31, 0x00, 0x00
	.byte 0x08, 0x17, 0x26, 0x35, 0x44, 0x53, 0x62, 0x71, 0x80, 0x8F, 0x9E, 0xAD, 0xBC, 0xCB, 0xDA, 0xE9
	.byte 0x32, 0x35, 0x35, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x3F, 0x40, 0x41, 0x42, 0x43, 0x00, 0x00, 0x00
	.byte 0x29, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xA2, 0x23, 0x02, 0xF0, 0xA2, 0x23, 0x02
	.byte 0x30, 0xA3, 0x23, 0x02, 0x74, 0xA3, 0x23, 0x02, 0xB8, 0xA3, 0x23, 0x02, 0xF4, 0xA1, 0x23, 0x02
	.byte 0x10, 0xA2, 0x23, 0x02, 0x2C, 0xA2, 0x23, 0x02, 0x4C, 0xA2, 0x23, 0x02, 0x6C, 0xA2, 0x23, 0x02
	.byte 0x31, 0x3D, 0x49, 0x5A, 0x66, 0x72, 0x83, 0x8F, 0x9B, 0xAC, 0xB8, 0xC4, 0x00, 0x01, 0x01, 0x01
	.byte 0x01, 0x01, 0x00, 0x00, 0x0D, 0x00, 0x3C, 0x00, 0xE6, 0x00, 0x5E, 0x00, 0x62, 0x00, 0x22, 0x00
	.byte 0x62, 0x00, 0x22, 0x00, 0x3D, 0x00, 0x22, 0x00, 0x65, 0x00, 0x22, 0x00, 0x6C, 0x00, 0x22, 0x00
	.byte 0x34, 0x00, 0x22, 0x00, 0x4E, 0x00, 0x22, 0x00, 0x06, 0x08, 0x07, 0x00, 0x02, 0x03, 0x07, 0x08
	.byte 0xCC, 0x00, 0x34, 0x00, 0x1C, 0x00, 0x18, 0x00, 0x8F, 0x00, 0x34, 0x00, 0x2C, 0x00, 0x18, 0x00
	.byte 0xC0, 0x00, 0x34, 0x00, 0x2C, 0x00, 0x18, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x01
	.byte 0x02, 0x00, 0x00, 0x03, 0x04, 0x05, 0x00, 0x29, 0x2C, 0x52, 0x53, 0x30, 0x00, 0x2A, 0x30, 0x54
	.byte 0x55, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0xE0, 0x00, 0x40, 0x01, 0xC0, 0x01
	.byte 0x40, 0x02, 0xA0, 0x02, 0x20, 0x03, 0xA0, 0x03, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61
	.byte 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x31, 0x2E, 0x6E, 0x63, 0x6C
	.byte 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x33, 0x4C, 0x69, 0x73, 0x74, 0x42
	.byte 0x61, 0x63, 0x6B, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x84, 0x00, 0x1B, 0x00, 0xFC, 0x00
	.byte 0x2C, 0x00, 0x84, 0x00, 0xAC, 0x00, 0xFC, 0x00, 0xBD, 0x00, 0x04, 0x00, 0xAC, 0x00, 0x7C, 0x00
	.byte 0xBD, 0x00, 0xC8, 0x00, 0x31, 0x00, 0xE0, 0x00, 0x4D, 0x00, 0xBC, 0x00, 0x31, 0x00, 0xE0, 0x00
	.byte 0x4D, 0x00, 0x8B, 0x00, 0x31, 0x00, 0xAF, 0x00, 0x4D, 0x00, 0x82, 0x00, 0x18, 0x00, 0xEE, 0x00
	.byte 0x2C, 0x00, 0x82, 0x00, 0xA9, 0x00, 0xEE, 0x00, 0xBD, 0x00, 0x02, 0x00, 0xA9, 0x00, 0x6E, 0x00
	.byte 0xBD, 0x00, 0x00, 0x00, 0xFF, 0x23, 0x27, 0xFF, 0x23, 0x2F, 0xFF, 0x00, 0x00, 0x01, 0x0E, 0x04
	.byte 0x05, 0x06, 0x0E, 0x09, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x05, 0x02, 0x07, 0x04, 0x01, 0x06, 0x03
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x02, 0x03, 0x04, 0x05, 0x06, 0x06, 0x07, 0x08, 0x00
	.byte 0x13, 0x14, 0x12, 0x56, 0x03, 0x04, 0x05, 0x07, 0x0A, 0x09, 0x0B, 0x06, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x31, 0x31, 0x2E, 0x6E, 0x63, 0x6C, 0x2E
	.byte 0x6C, 0x00, 0x08, 0x00, 0x30, 0x00, 0x5A, 0x00, 0x30, 0x00, 0xAC, 0x00, 0x30, 0x00, 0x0C, 0x00
	.byte 0x58, 0x00, 0x5E, 0x00, 0x58, 0x00, 0xB0, 0x00, 0x58, 0x00, 0x08, 0x00, 0x20, 0x00, 0x54, 0x00
	.byte 0x56, 0x00, 0x5A, 0x00, 0x20, 0x00, 0xA6, 0x00, 0x56, 0x00, 0xAC, 0x00, 0x20, 0x00, 0xF8, 0x00
	.byte 0x56, 0x00, 0x08, 0x00, 0x78, 0x00, 0xF8, 0x00, 0xA0, 0x00, 0x08, 0x00, 0x54, 0x00, 0x54, 0x00
	.byte 0x70, 0x00, 0x5A, 0x00, 0x54, 0x00, 0xA6, 0x00, 0x70, 0x00, 0xAC, 0x00, 0x54, 0x00, 0xF8, 0x00
	.byte 0x70, 0x00, 0x06, 0x00, 0x1E, 0x00, 0x46, 0x00, 0x48, 0x00, 0x58, 0x00, 0x1E, 0x00, 0x98, 0x00
	.byte 0x48, 0x00, 0xAA, 0x00, 0x1E, 0x00, 0xEA, 0x00, 0x48, 0x00, 0x06, 0x00, 0x76, 0x00, 0xEA, 0x00
	.byte 0x92, 0x00, 0x09, 0x00, 0x54, 0x00, 0x43, 0x00, 0x70, 0x00, 0x5B, 0x00, 0x54, 0x00, 0x95, 0x00
	.byte 0x70, 0x00, 0xAD, 0x00, 0x54, 0x00, 0xE7, 0x00, 0x70, 0x00, 0x00, 0x00, 0x03, 0x2D, 0x27, 0x1D
	.byte 0x32, 0x30, 0x06, 0x00, 0x01, 0x02, 0x03, 0x04, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x31, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0xFF, 0xFE
	.byte 0xFF, 0xFE, 0x03, 0x00, 0x03, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x01, 0x00, 0xFF, 0xFE
	.byte 0xFF, 0xFE, 0x03, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x02, 0x00, 0x01, 0x00, 0x08, 0x00
	.byte 0x20, 0x00, 0xF8, 0x00, 0x5C, 0x00, 0x08, 0x00, 0x64, 0x00, 0x7E, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x83, 0x00, 0x64, 0x00, 0xF8, 0x00, 0xA0, 0x00, 0x08, 0x00
	.byte 0x20, 0x00, 0xF8, 0x00, 0x5C, 0x00, 0x08, 0x00, 0x64, 0x00, 0x64, 0x00, 0xA0, 0x00, 0x68, 0x00
	.byte 0x64, 0x00, 0xC4, 0x00, 0xA0, 0x00, 0xC8, 0x00, 0x64, 0x00, 0xF8, 0x00, 0xA0, 0x00, 0x06, 0x00
	.byte 0x1E, 0x00, 0xEA, 0x00, 0x4E, 0x00, 0x06, 0x00, 0x62, 0x00, 0x70, 0x00, 0x92, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x62, 0x00, 0xEA, 0x00, 0x92, 0x00, 0x06, 0x00
	.byte 0x1E, 0x00, 0xEA, 0x00, 0x4E, 0x00, 0x06, 0x00, 0x62, 0x00, 0x56, 0x00, 0x92, 0x00, 0x66, 0x00
	.byte 0x62, 0x00, 0xB6, 0x00, 0x92, 0x00, 0xC6, 0x00, 0x62, 0x00, 0xEA, 0x00, 0x92, 0x00, 0x00, 0x00
	.byte 0x03, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x06, 0x00, 0xA8, 0x81, 0x23, 0x02, 0xBC, 0x81, 0x23, 0x02
	.byte 0x03, 0x01, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00
	.byte 0x10, 0x0F, 0x0E, 0x00, 0x55, 0x36, 0x1E, 0x00, 0x00, 0x50, 0xF2, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0xFF, 0x3F, 0x00, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x05, 0x00
	.byte 0x06, 0x04, 0x00, 0x02, 0x00, 0x06, 0x04, 0x00, 0x05, 0x00, 0x03, 0x02, 0x01, 0x03, 0x01, 0x03
	.byte 0x05, 0x01, 0x04, 0x01, 0x05, 0x07, 0x01, 0x07, 0x01, 0x06, 0x20, 0x00, 0x21, 0x00, 0x50, 0x00
	.byte 0x30, 0x00, 0x68, 0x00, 0x21, 0x00, 0x98, 0x00, 0x30, 0x00, 0xB0, 0x00, 0x21, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4E, 0x57, 0x43, 0x55, 0x53, 0x42, 0x41, 0x50
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0xFF, 0x3F, 0x00, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x08, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x04, 0x00, 0x1D, 0x00, 0xFC, 0x00, 0x44, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01
	.byte 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0xFF, 0x01, 0x00, 0x00, 0xFF, 0x01, 0x00, 0x1B, 0x19
	.byte 0x57, 0x00, 0x23, 0x1D, 0x59, 0x00, 0x23, 0x1D, 0x6C, 0x00, 0x10, 0x00, 0x6C, 0x00, 0x10, 0x00
	.byte 0x78, 0x00, 0x10, 0x00, 0x78, 0x00, 0x10, 0x00, 0x78, 0x00, 0x10, 0x00, 0xD8, 0x00, 0x50, 0x00
	.byte 0xD8, 0x00, 0x50, 0x00, 0xE6, 0x00, 0x4F, 0x00, 0xE6, 0x00, 0x4F, 0x00, 0xE6, 0x00, 0x48, 0x00
	.byte 0xDA, 0x00, 0x5C, 0x00, 0x0B, 0x00, 0x27, 0x00, 0x0B, 0x00, 0x27, 0x00, 0x04, 0x00, 0x4C, 0x00
	.byte 0x04, 0x00, 0x4C, 0x00, 0x04, 0x00, 0x54, 0x00, 0x0B, 0x00, 0x27, 0x00, 0xEA, 0x00, 0x72, 0x00
	.byte 0xEA, 0x00, 0x72, 0x00, 0xF8, 0x00, 0x70, 0x00, 0xF8, 0x00, 0x70, 0x00, 0x64, 0x00, 0x70, 0x00
	.byte 0xEA, 0x00, 0x72, 0x00, 0x10, 0x00, 0x84, 0x00, 0x84, 0x00, 0x84, 0x00, 0x10, 0x00, 0x84, 0x00
	.byte 0x84, 0x00, 0x84, 0x00, 0x09, 0x00, 0xA7, 0x00, 0x83, 0x00, 0xA7, 0x00, 0x09, 0x00, 0xA7, 0x00
	.byte 0x83, 0x00, 0xA7, 0x00, 0x09, 0x00, 0xA7, 0x00, 0x83, 0x00, 0xA7, 0x00, 0x00, 0x00, 0x46, 0x46
	.byte 0x4F, 0x2F, 0x00, 0x00, 0x02, 0x01, 0x02, 0x01, 0x02, 0x00, 0x00, 0x00, 0x64, 0x77, 0x63, 0x00
	.byte 0x00, 0xF0, 0x00, 0x10, 0x11, 0x10, 0x01, 0x00, 0xF0, 0x00, 0x10, 0x00, 0x00, 0x00, 0x80, 0x01
	.byte 0x20, 0x00, 0x18, 0x00, 0x20, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xC0, 0x00
	.byte 0x80, 0x20, 0x00, 0x00

	.data

	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x4E, 0x75, 0x6C, 0x6C, 0x2E, 0x6E, 0x73, 0x63, 0x2E
	.byte 0x6C, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x32, 0x48, 0x6C, 0x41, 0x70
	.byte 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x34
	.byte 0x48, 0x6C, 0x49, 0x70, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x34, 0x48, 0x6C, 0x57, 0x65, 0x70, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x34, 0x48, 0x6C, 0x55, 0x73, 0x62, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x34, 0x48, 0x6C, 0x44, 0x6E
	.byte 0x73, 0x31, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x34, 0x48, 0x6C, 0x53, 0x73, 0x69, 0x64, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x35, 0x48, 0x6C, 0x4D, 0x6F
	.byte 0x76, 0x65, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x32, 0x48, 0x6C, 0x57, 0x69, 0x46, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x35, 0x48, 0x6C, 0x49, 0x6E
	.byte 0x66, 0x6F, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x34, 0x48, 0x6C, 0x4D, 0x61, 0x73, 0x6B, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x34, 0x48, 0x6C, 0x53, 0x65
	.byte 0x74, 0x32, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x34, 0x48, 0x6C, 0x44, 0x6E, 0x73, 0x30, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x34, 0x48, 0x6C, 0x53, 0x65
	.byte 0x74, 0x33, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x34, 0x48, 0x6C, 0x53, 0x65, 0x74, 0x31, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x33, 0x48, 0x6C, 0x4C, 0x69
	.byte 0x73, 0x74, 0x31, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x33, 0x48, 0x6C, 0x4C, 0x69, 0x73, 0x74, 0x32, 0x2E, 0x6E, 0x73, 0x63, 0x2E
	.byte 0x6C, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x33, 0x48, 0x6C, 0x4C, 0x69
	.byte 0x73, 0x74, 0x33, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x35, 0x48, 0x6C, 0x45, 0x72, 0x61, 0x73, 0x65, 0x2E, 0x6E, 0x73, 0x63, 0x2E
	.byte 0x6C, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x35, 0x48, 0x6C, 0x4F, 0x70
	.byte 0x74, 0x69, 0x6F, 0x6E, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x34, 0x48, 0x6C, 0x47, 0x61, 0x74, 0x65, 0x77, 0x61, 0x79, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00, 0xCC, 0x5B, 0x24, 0x02, 0x34, 0x5B, 0x24, 0x02, 0x74, 0x5C, 0x24, 0x02
	.byte 0x8C, 0x5C, 0x24, 0x02, 0xA4, 0x5C, 0x24, 0x02, 0x5C, 0x5C, 0x24, 0x02, 0x14, 0x5C, 0x24, 0x02
	.byte 0x44, 0x5C, 0x24, 0x02, 0x70, 0x5B, 0x24, 0x02, 0x9C, 0x5B, 0x24, 0x02, 0x5C, 0x5B, 0x24, 0x02
	.byte 0x48, 0x5B, 0x24, 0x02, 0xFC, 0x5B, 0x24, 0x02, 0xEC, 0x5C, 0x24, 0x02, 0x2C, 0x5C, 0x24, 0x02
	.byte 0x84, 0x5B, 0x24, 0x02, 0xD4, 0x5C, 0x24, 0x02, 0xE4, 0x5B, 0x24, 0x02, 0xBC, 0x5C, 0x24, 0x02
	.byte 0xB4, 0x5B, 0x24, 0x02, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x48, 0x6C, 0x2E
	.byte 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x18, 0x5F, 0x24, 0x02, 0xB8, 0x5E, 0x24, 0x02
	.byte 0xE8, 0x5E, 0x24, 0x02, 0x90, 0x5D, 0x24, 0x02, 0xF2, 0x5D, 0x24, 0x02, 0x54, 0x5E, 0x24, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x31, 0x00, 0x32, 0x00, 0x33, 0x00, 0x34, 0x00, 0x35, 0x00, 0x36, 0x00, 0x37, 0x00, 0x38, 0x00
	.byte 0x39, 0x00, 0x30, 0x00, 0x2D, 0x00, 0x3D, 0x00, 0x71, 0x00, 0x77, 0x00, 0x65, 0x00, 0x72, 0x00
	.byte 0x74, 0x00, 0x79, 0x00, 0x75, 0x00, 0x69, 0x00, 0x6F, 0x00, 0x70, 0x00, 0x5B, 0x00, 0x5D, 0x00
	.byte 0x61, 0x00, 0x73, 0x00, 0x64, 0x00, 0x66, 0x00, 0x67, 0x00, 0x68, 0x00, 0x6A, 0x00, 0x6B, 0x00
	.byte 0x6C, 0x00, 0x3B, 0x00, 0x27, 0x00, 0x60, 0x00, 0x7A, 0x00, 0x78, 0x00, 0x63, 0x00, 0x76, 0x00
	.byte 0x62, 0x00, 0x6E, 0x00, 0x6D, 0x00, 0x2C, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x5C, 0x00, 0x20, 0x00
	.byte 0x00, 0x00, 0x21, 0x00, 0x40, 0x00, 0x23, 0x00, 0x24, 0x00, 0x25, 0x00, 0x5E, 0x00, 0x26, 0x00
	.byte 0x2A, 0x00, 0x28, 0x00, 0x29, 0x00, 0x5F, 0x00, 0x2B, 0x00, 0x51, 0x00, 0x57, 0x00, 0x45, 0x00
	.byte 0x52, 0x00, 0x54, 0x00, 0x59, 0x00, 0x55, 0x00, 0x49, 0x00, 0x4F, 0x00, 0x50, 0x00, 0x7B, 0x00
	.byte 0x7D, 0x00, 0x41, 0x00, 0x53, 0x00, 0x44, 0x00, 0x46, 0x00, 0x47, 0x00, 0x48, 0x00, 0x4A, 0x00
	.byte 0x4B, 0x00, 0x4C, 0x00, 0x3A, 0x00, 0x22, 0x00, 0x7E, 0x00, 0x5A, 0x00, 0x58, 0x00, 0x43, 0x00
	.byte 0x56, 0x00, 0x42, 0x00, 0x4E, 0x00, 0x4D, 0x00, 0x3C, 0x00, 0x3E, 0x00, 0x3F, 0x00, 0x7C, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x31, 0x00, 0x32, 0x00, 0x33, 0x00, 0x34, 0x00, 0x35, 0x00, 0x36, 0x00
	.byte 0x37, 0x00, 0x38, 0x00, 0x39, 0x00, 0x30, 0x00, 0x2D, 0x00, 0x3D, 0x00, 0x51, 0x00, 0x57, 0x00
	.byte 0x45, 0x00, 0x52, 0x00, 0x54, 0x00, 0x59, 0x00, 0x55, 0x00, 0x49, 0x00, 0x4F, 0x00, 0x50, 0x00
	.byte 0x5B, 0x00, 0x5D, 0x00, 0x41, 0x00, 0x53, 0x00, 0x44, 0x00, 0x46, 0x00, 0x47, 0x00, 0x48, 0x00
	.byte 0x4A, 0x00, 0x4B, 0x00, 0x4C, 0x00, 0x3B, 0x00, 0x27, 0x00, 0x60, 0x00, 0x5A, 0x00, 0x58, 0x00
	.byte 0x43, 0x00, 0x56, 0x00, 0x42, 0x00, 0x4E, 0x00, 0x4D, 0x00, 0x2C, 0x00, 0x2E, 0x00, 0x2F, 0x00
	.byte 0x5C, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x40, 0x23, 0x24, 0x25, 0x5E, 0x26, 0x2A
	.byte 0x28, 0x29, 0x5F, 0x2B, 0x51, 0x57, 0x45, 0x52, 0x54, 0x59, 0x55, 0x49, 0x4F, 0x50, 0x7B, 0x7D
	.byte 0x41, 0x53, 0x44, 0x46, 0x47, 0x48, 0x4A, 0x4B, 0x4C, 0x3A, 0x22, 0x7E, 0x5A, 0x58, 0x43, 0x56
	.byte 0x42, 0x4E, 0x4D, 0x3C, 0x3E, 0x3F, 0x7C, 0x00, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38
	.byte 0x39, 0x30, 0x2D, 0x3D, 0x51, 0x57, 0x45, 0x52, 0x54, 0x59, 0x55, 0x49, 0x4F, 0x50, 0x5B, 0x5D
	.byte 0x41, 0x53, 0x44, 0x46, 0x47, 0x48, 0x4A, 0x4B, 0x4C, 0x3B, 0x27, 0x60, 0x5A, 0x58, 0x43, 0x56
	.byte 0x42, 0x4E, 0x4D, 0x2C, 0x2E, 0x2F, 0x5C, 0x00, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38
	.byte 0x39, 0x30, 0x2D, 0x3D, 0x71, 0x77, 0x65, 0x72, 0x74, 0x79, 0x75, 0x69, 0x6F, 0x70, 0x5B, 0x5D
	.byte 0x61, 0x73, 0x64, 0x66, 0x67, 0x68, 0x6A, 0x6B, 0x6C, 0x3B, 0x27, 0x60, 0x7A, 0x78, 0x63, 0x76
	.byte 0x62, 0x6E, 0x6D, 0x2C, 0x2E, 0x2F, 0x5C, 0x00, 0x64, 0x77, 0x63, 0x3A, 0x2F, 0x6D, 0x6F, 0x76
	.byte 0x65, 0x2F, 0x63, 0x68, 0x69, 0x6C, 0x64, 0x2E, 0x73, 0x72, 0x6C, 0x00, 0x64, 0x77, 0x63, 0x3A
	.byte 0x2F, 0x6D, 0x6F, 0x76, 0x65, 0x2F, 0x62, 0x61, 0x6E, 0x6E, 0x65, 0x72, 0x2E, 0x70, 0x6C, 0x74
	.byte 0x00, 0x00, 0x00, 0x00, 0x64, 0x77, 0x63, 0x3A, 0x2F, 0x6D, 0x6F, 0x76, 0x65, 0x2F, 0x62, 0x61
	.byte 0x6E, 0x6E, 0x65, 0x72, 0x2E, 0x63, 0x68, 0x61, 0x72, 0x00, 0x00, 0x00, 0x48, 0x5F, 0x24, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x74, 0x5F, 0x24, 0x02, 0x5C, 0x5F, 0x24, 0x02
	.byte 0x59, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6D, 0x73, 0x67, 0x2F, 0x6B, 0x6F, 0x72, 0x2E
	.byte 0x62, 0x6D, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x6D, 0x73, 0x67, 0x2F, 0x65, 0x6E, 0x67, 0x2E
	.byte 0x62, 0x6D, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x6D, 0x73, 0x67, 0x2F, 0x69, 0x74, 0x61, 0x2E
	.byte 0x62, 0x6D, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x6D, 0x73, 0x67, 0x2F, 0x67, 0x65, 0x72, 0x2E
	.byte 0x62, 0x6D, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x6D, 0x73, 0x67, 0x2F, 0x66, 0x72, 0x65, 0x2E
	.byte 0x62, 0x6D, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x6D, 0x73, 0x67, 0x2F, 0x73, 0x70, 0x61, 0x2E
	.byte 0x62, 0x6D, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x6D, 0x73, 0x67, 0x2F, 0x6A, 0x61, 0x70, 0x2E
	.byte 0x62, 0x6D, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x08, 0x60, 0x24, 0x02, 0xB8, 0x5F, 0x24, 0x02
	.byte 0xE8, 0x5F, 0x24, 0x02, 0xD8, 0x5F, 0x24, 0x02, 0xC8, 0x5F, 0x24, 0x02, 0xF8, 0x5F, 0x24, 0x02
	.byte 0xA8, 0x5F, 0x24, 0x02, 0x6D, 0x73, 0x67, 0x2F, 0x75, 0x73, 0x61, 0x2E, 0x62, 0x6D, 0x67, 0x2E
	.byte 0x6C, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x4D, 0x61, 0x69, 0x6E, 0x2E
	.byte 0x6E, 0x63, 0x65, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x4D
	.byte 0x61, 0x69, 0x6E, 0x2E, 0x6E, 0x63, 0x65, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x74, 0x42, 0x67, 0x4D, 0x61, 0x69, 0x6E, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x42, 0x67, 0x4D, 0x61, 0x69, 0x6E, 0x2E, 0x6E, 0x63
	.byte 0x6C, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x4F, 0x62, 0x6A, 0x4D, 0x61
	.byte 0x69, 0x6E, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x78, 0x74, 0x4F, 0x62, 0x6A, 0x4D, 0x61, 0x69, 0x6E, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65
	.byte 0x70, 0x31, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x31, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x4F, 0x62, 0x6A, 0x4D, 0x61
	.byte 0x69, 0x6E, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4D, 0x61, 0x69, 0x6E, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x54, 0x6F, 0x70, 0x2E, 0x6E
	.byte 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x53
	.byte 0x74, 0x65, 0x70, 0x31, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x31, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65
	.byte 0x70, 0x31, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x32, 0x4D, 0x65, 0x6E, 0x75, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x35, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x35, 0x4D, 0x75, 0x6C, 0x74
	.byte 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x35
	.byte 0x49, 0x6E, 0x66, 0x6F, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x25, 0x00, 0x30, 0x00
	.byte 0x32, 0x00, 0x58, 0x00, 0x2D, 0x00, 0x25, 0x00, 0x30, 0x00, 0x32, 0x00, 0x58, 0x00, 0x2D, 0x00
	.byte 0x25, 0x00, 0x30, 0x00, 0x32, 0x00, 0x58, 0x00, 0x2D, 0x00, 0x25, 0x00, 0x30, 0x00, 0x32, 0x00
	.byte 0x58, 0x00, 0x2D, 0x00, 0x25, 0x00, 0x30, 0x00, 0x32, 0x00, 0x58, 0x00, 0x2D, 0x00, 0x25, 0x00
	.byte 0x30, 0x00, 0x32, 0x00, 0x58, 0x00, 0x00, 0x00, 0x25, 0x00, 0x30, 0x00, 0x34, 0x00, 0x64, 0x00
	.byte 0x2D, 0x00, 0x25, 0x00, 0x30, 0x00, 0x34, 0x00, 0x64, 0x00, 0x2D, 0x00, 0x25, 0x00, 0x30, 0x00
	.byte 0x34, 0x00, 0x64, 0x00, 0x2D, 0x00, 0x25, 0x00, 0x30, 0x00, 0x34, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00
	.byte 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00
	.byte 0x2D, 0x00, 0x2D, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42
	.byte 0x67, 0x4F, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x35, 0x4F, 0x70, 0x74, 0x4D, 0x65, 0x6E, 0x75, 0x2E
	.byte 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x35
	.byte 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x35, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x35, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x35, 0x4D, 0x75, 0x6C, 0x74
	.byte 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x35
	.byte 0x4D, 0x6F, 0x76, 0x65, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x35, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E
	.byte 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74
	.byte 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x34
	.byte 0x41, 0x70, 0x4C, 0x69, 0x73, 0x74, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4B, 0x62, 0x2E, 0x6E, 0x63, 0x6C
	.byte 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65
	.byte 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x45, 0x64, 0x69, 0x74
	.byte 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x4F
	.byte 0x62, 0x6A, 0x4D, 0x61, 0x69, 0x6E, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x20, 0x30, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4B, 0x62
	.byte 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E
	.byte 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34
	.byte 0x45, 0x64, 0x69, 0x74, 0x41, 0x64, 0x64, 0x72, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4D, 0x61, 0x69, 0x6E, 0x2E, 0x6E
	.byte 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x34
	.byte 0x45, 0x72, 0x72, 0x6F, 0x72, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x25, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4B, 0x62
	.byte 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x31, 0x2E
	.byte 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x33
	.byte 0x4C, 0x69, 0x73, 0x74, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4D, 0x61, 0x69, 0x6E, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x25, 0x00, 0x33, 0x00, 0x64, 0x00, 0x2E, 0x00, 0x25, 0x00, 0x33, 0x00
	.byte 0x64, 0x00, 0x2E, 0x00, 0x25, 0x00, 0x33, 0x00, 0x64, 0x00, 0x2E, 0x00, 0x25, 0x00, 0x33, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65
	.byte 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4E, 0x6F, 0x6E, 0x65
	.byte 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34
	.byte 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65
	.byte 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74
	.byte 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E
	.byte 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34
	.byte 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x57, 0x61, 0x79, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x31, 0x2E, 0x6E
	.byte 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x31, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x32, 0x41, 0x70, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x4F, 0x62, 0x6A, 0x4D, 0x61
	.byte 0x69, 0x6E, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65
	.byte 0x70, 0x32, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x62, 0x33, 0x57, 0x61, 0x79, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E
	.byte 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74
	.byte 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x34
	.byte 0x4E, 0x6F, 0x6E, 0x65, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x78, 0x62, 0x34, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x2E, 0x6E
	.byte 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x79, 0x62, 0x42
	.byte 0x67, 0x53, 0x74, 0x65, 0x70, 0x32, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x78, 0x62, 0x33, 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65
	.byte 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x67, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x79, 0x62, 0x42, 0x67, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x63, 0x6C, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x62, 0x34, 0x55, 0x73, 0x62, 0x2E
	.byte 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x00, 0x25, 0x33, 0x64, 0x25, 0x33, 0x64, 0x25, 0x33
	.byte 0x64, 0x25, 0x33, 0x64, 0x00, 0x00, 0x00, 0x00, 0x73, 0x6F, 0x75, 0x6E, 0x64, 0x2F, 0x73, 0x6F
	.byte 0x75, 0x6E, 0x64, 0x5F, 0x64, 0x61, 0x74, 0x61, 0x2E, 0x73, 0x64, 0x61, 0x74, 0x2E, 0x6C, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x54, 0x6F, 0x70, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x53, 0x74, 0x65, 0x70, 0x31
	.byte 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x53
	.byte 0x74, 0x65, 0x70, 0x32, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72
	.byte 0x2F, 0x6A, 0x74, 0x53, 0x74, 0x65, 0x70, 0x33, 0x2E, 0x6E, 0x73, 0x63, 0x2E, 0x6C, 0x00, 0x00
	.byte 0x63, 0x68, 0x61, 0x72, 0x2F, 0x6A, 0x74, 0x4F, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x2E, 0x6E, 0x73
	.byte 0x63, 0x2E, 0x6C, 0x00, 0x04, 0x68, 0x24, 0x02, 0x18, 0x68, 0x24, 0x02, 0x2C, 0x68, 0x24, 0x02
	.byte 0x40, 0x68, 0x24, 0x02, 0xF0, 0x67, 0x24, 0x02, 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F
	.byte 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x45, 0x4E, 0x44, 0x00, 0x00, 0x4D, 0x42, 0x5F, 0x43
	.byte 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x4E, 0x4F, 0x4E, 0x45, 0x00
	.byte 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x45
	.byte 0x52, 0x52, 0x4F, 0x52, 0x00, 0x00, 0x00, 0x00, 0x4D, 0x42, 0x5F, 0x43, 0x4F, 0x4D, 0x4D, 0x5F
	.byte 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x4B, 0x49, 0x43, 0x4B, 0x45, 0x44, 0x00, 0x00, 0x00
	.byte 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x4D, 0x42, 0x50, 0x5F, 0x53, 0x54, 0x41
	.byte 0x54, 0x45, 0x5F, 0x53, 0x54, 0x4F, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
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
	.byte 0x25, 0x73, 0x20, 0x2D, 0x3E, 0x20, 0x00, 0x00, 0x25, 0x73, 0x0A, 0x00, 0x53, 0x74, 0x61, 0x72
	.byte 0x74, 0x50, 0x61, 0x72, 0x65, 0x6E, 0x74, 0x20, 0x2D, 0x20, 0x6E, 0x65, 0x77, 0x20, 0x63, 0x68
	.byte 0x69, 0x6C, 0x64, 0x20, 0x28, 0x61, 0x69, 0x64, 0x20, 0x25, 0x78, 0x29, 0x20, 0x63, 0x6F, 0x6E
	.byte 0x6E, 0x65, 0x63, 0x74, 0x65, 0x64, 0x0A, 0x00, 0x53, 0x74, 0x61, 0x72, 0x74, 0x50, 0x61, 0x72
	.byte 0x65, 0x6E, 0x74, 0x20, 0x2D, 0x20, 0x63, 0x68, 0x69, 0x6C, 0x64, 0x20, 0x28, 0x61, 0x69, 0x64
	.byte 0x20, 0x25, 0x78, 0x29, 0x20, 0x64, 0x69, 0x73, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x65
	.byte 0x64, 0x0A, 0x00, 0x00, 0x75, 0x6E, 0x6B, 0x6E, 0x6F, 0x77, 0x6E, 0x20, 0x69, 0x6E, 0x64, 0x69
	.byte 0x63, 0x61, 0x74, 0x65, 0x2C, 0x20, 0x73, 0x74, 0x61, 0x74, 0x65, 0x20, 0x3D, 0x20, 0x25, 0x64
	.byte 0x0A, 0x00, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F
	.byte 0x53, 0x74, 0x61, 0x74, 0x65, 0x49, 0x6E, 0x53, 0x74, 0x61, 0x72, 0x74, 0x50, 0x61, 0x72, 0x65
	.byte 0x6E, 0x74, 0x4B, 0x65, 0x79, 0x53, 0x68, 0x61, 0x72, 0x65, 0x20, 0x66, 0x61, 0x69, 0x6C, 0x65
	.byte 0x64, 0x0A, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F
	.byte 0x53, 0x74, 0x61, 0x74, 0x65, 0x49, 0x6E, 0x45, 0x6E, 0x64, 0x50, 0x61, 0x72, 0x65, 0x6E, 0x74
	.byte 0x20, 0x66, 0x61, 0x69, 0x6C, 0x65, 0x64, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x72, 0x65, 0x63, 0x76
	.byte 0x20, 0x62, 0x75, 0x66, 0x66, 0x65, 0x72, 0x20, 0x73, 0x69, 0x7A, 0x65, 0x20, 0x3D, 0x20, 0x25
	.byte 0x64, 0x0A, 0x00, 0x00, 0x73, 0x65, 0x6E, 0x64, 0x20, 0x62, 0x75, 0x66, 0x66, 0x65, 0x72, 0x20
	.byte 0x73, 0x69, 0x7A, 0x65, 0x20, 0x3D, 0x20, 0x25, 0x64, 0x0A, 0x00, 0x00, 0x63, 0x68, 0x61, 0x6E
	.byte 0x6E, 0x65, 0x6C, 0x20, 0x25, 0x64, 0x20, 0x62, 0x72, 0x61, 0x74, 0x69, 0x6F, 0x20, 0x3D, 0x20
	.byte 0x25, 0x78, 0x0A, 0x00, 0x64, 0x65, 0x63, 0x69, 0x64, 0x65, 0x64, 0x20, 0x63, 0x68, 0x61, 0x6E
	.byte 0x6E, 0x65, 0x6C, 0x20, 0x3D, 0x20, 0x25, 0x64, 0x0A, 0x00, 0x00, 0x00, 0x75, 0x6E, 0x6B, 0x6E
	.byte 0x6F, 0x77, 0x6E, 0x20, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x20, 0x6D, 0x6F, 0x64, 0x65
	.byte 0x20, 0x25, 0x64, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56
	.byte 0x5F, 0x57, 0x48, 0x5F, 0x53, 0x74, 0x65, 0x70, 0x44, 0x61, 0x74, 0x61, 0x53, 0x68, 0x61, 0x72
	.byte 0x69, 0x6E, 0x67, 0x20, 0x2D, 0x20, 0x57, 0x61, 0x72, 0x6E, 0x69, 0x6E, 0x67, 0x20, 0x4E, 0x6F
	.byte 0x20, 0x43, 0x68, 0x69, 0x6C, 0x64, 0x0A, 0x00, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56
	.byte 0x5F, 0x57, 0x48, 0x5F, 0x53, 0x74, 0x65, 0x70, 0x44, 0x61, 0x74, 0x61, 0x53, 0x68, 0x61, 0x72
	.byte 0x69, 0x6E, 0x67, 0x20, 0x2D, 0x20, 0x57, 0x61, 0x72, 0x6E, 0x69, 0x6E, 0x67, 0x20, 0x4E, 0x6F
	.byte 0x20, 0x44, 0x61, 0x74, 0x61, 0x53, 0x65, 0x74, 0x0A, 0x00, 0x00, 0x00, 0x61, 0x6C, 0x72, 0x65
	.byte 0x61, 0x64, 0x79, 0x20, 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F
	.byte 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x49, 0x44, 0x4C, 0x45, 0x0A, 0x00, 0x00
	.byte 0x44, 0x57, 0x43, 0x69, 0x5F, 0x4D, 0x4F, 0x56, 0x5F, 0x57, 0x48, 0x5F, 0x46, 0x69, 0x6E, 0x61
	.byte 0x6C, 0x69, 0x7A, 0x65, 0x2C, 0x20, 0x73, 0x74, 0x61, 0x74, 0x65, 0x20, 0x3D, 0x20, 0x25, 0x64
	.byte 0x0A, 0x00, 0x00, 0x00, 0x72, 0x6F, 0x6D, 0x3A, 0x2F, 0x64, 0x77, 0x63, 0x2F, 0x75, 0x74, 0x69
	.byte 0x6C, 0x69, 0x74, 0x79, 0x2E, 0x62, 0x69, 0x6E, 0x00, 0x00, 0x00, 0x00, 0x25, 0x73, 0x3A, 0x2F
	.byte 0x00, 0x00, 0x00, 0x00, 0x72, 0x6F, 0x6D, 0x3A, 0x2F, 0x00, 0x00, 0x00, 0x2E, 0x6C, 0x00, 0x00
	.byte 0x50, 0x74, 0x24, 0x02, 0x40, 0x74, 0x24, 0x02, 0x60, 0x74, 0x24, 0x02, 0x40, 0x74, 0x24, 0x02
	.byte 0x6D, 0x73, 0x67, 0x2F, 0x6C, 0x63, 0x5F, 0x73, 0x2E, 0x4E, 0x46, 0x54, 0x52, 0x2E, 0x6C, 0x00
	.byte 0x6D, 0x73, 0x67, 0x2F, 0x6B, 0x63, 0x5F, 0x6D, 0x2E, 0x4E, 0x46, 0x54, 0x52, 0x2E, 0x6C, 0x00
	.byte 0x6D, 0x73, 0x67, 0x2F, 0x6C, 0x63, 0x5F, 0x6D, 0x2E, 0x4E, 0x46, 0x54, 0x52, 0x2E, 0x6C, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_0224F464:
	.space 0x1FC
