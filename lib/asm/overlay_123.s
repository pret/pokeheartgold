	.include "asm/macros.inc"
	.include "overlay_123.inc"
	.include "global.inc"

	; This overlay has multiple levels of encryption for some reason.
	; Note to future decompilers using asmdiff: you will need to
	; compare against the *decrypted* version of this overlay's SBIN
	; should you hit any nonmatches.

	.text
	.balign 4, 0

	arm_func_start ov123_0225F020
ov123_0225F020: ; 0x0225F020
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub sp, sp, #128 ; 0x80
	ldr r2, [pc, #156] ; _0225F0CC
	ldr r1, [pc, #156] ; _0225F0D0
	mov sl, #0
	adds r2, r2, #800 ; 0x320
	add r1, r1, #800 ; 0x320
	mov fp, r0
	mov r8, sl
	mov r9, sl
	str sl, [sp, #8]
	str r2, [sp]
	str r1, [sp, #4]
	beq _0225F0A0
	ldr r4, [pc, #116] ; _0225F0D4
	mov r5, sl
	mov r6, #1
	add r7, sp, #0
_0225F068:
	ldr r0, [r7, r9, lsl #2]
	add r0, r0, r4
	blx r0
	cmp r0, #0
	movne r1, r6
	add r9, r9, #1
	moveq r1, r5
	add r2, r8, r1
	ldr r0, [r7, r9, lsl #2]
	add r1, sl, #1
	cmp r0, #0
	mov r8, r2, lsl #1
	mov sl, r1, lsl #1
	bne _0225F068
_0225F0A0:
	and r0, r8, sl
	movs r0, r0, asr #1
	movne r4, #1
	moveq r4, #0
	cmp fp, #0
	cmpne r4, #0
	beq _0225F0C0
	blx fp
_0225F0C0:
	mov r0, r4
	add sp, sp, #128 ; 0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_0225F0CC: .word ov123_0226068C + 0x1300
_0225F0D0: .word ov123_0225FC14 + 0x1300
_0225F0D4: .word 0xFFFFE9E0
	arm_func_end ov123_0225F020

	arm_func_start ov123_0225F0D8
ov123_0225F0D8: ; 0x0225F0D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub sp, sp, #128 ; 0x80
	ldr r2, [pc, #156] ; _0225F184
	ldr r1, [pc, #156] ; _0225F188
	mov sl, #0
	adds r2, r2, #800 ; 0x320
	add r1, r1, #800 ; 0x320
	mov fp, r0
	mov r8, sl
	mov r9, sl
	str sl, [sp, #8]
	str r2, [sp]
	str r1, [sp, #4]
	beq _0225F158
	ldr r4, [pc, #116] ; _0225F18C
	mov r5, sl
	mov r6, #1
	add r7, sp, #0
_0225F120:
	ldr r0, [r7, r9, lsl #2]
	add r0, r0, r4
	blx r0
	cmp r0, #0
	movne r1, r6
	add r9, r9, #1
	moveq r1, r5
	add r2, r8, r1
	ldr r0, [r7, r9, lsl #2]
	add r1, sl, #1
	cmp r0, #0
	mov r8, r2, lsl #1
	mov sl, r1, lsl #1
	bne _0225F120
_0225F158:
	mov r0, r8, asr #1
	cmp r0, sl, asr #1
	moveq r4, #1
	movne r4, #0
	cmp fp, #0
	cmpne r4, #0
	beq _0225F178
	blx fp
_0225F178:
	mov r0, r4
	add sp, sp, #128 ; 0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_0225F184: .word ov123_02260704 + 0x1300
_0225F188: .word ov123_0225FC8C + 0x1300
_0225F18C: .word 0xFFFFE9E0
	arm_func_end ov123_0225F0D8

	arm_func_start ov123_0225F190
ov123_0225F190: ; 0x0225F190
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub sp, sp, #128 ; 0x80
	ldr r2, [pc, #156] ; _0225F23C
	ldr r1, [pc, #156] ; _0225F240
	mov sl, #0
	adds r2, r2, #800 ; 0x320
	add r1, r1, #800 ; 0x320
	mov fp, r0
	mov r8, sl
	mov r9, sl
	str sl, [sp, #8]
	str r2, [sp]
	str r1, [sp, #4]
	beq _0225F210
	ldr r4, [pc, #116] ; _0225F244
	mov r5, sl
	mov r6, #1
	add r7, sp, #0
_0225F1D8:
	ldr r0, [r7, r9, lsl #2]
	add r0, r0, r4
	blx r0
	cmp r0, #0
	movne r1, r6
	add r9, r9, #1
	moveq r1, r5
	add r2, r8, r1
	ldr r0, [r7, r9, lsl #2]
	add r1, sl, #1
	cmp r0, #0
	mov r8, r2, lsl #1
	mov sl, r1, lsl #1
	bne _0225F1D8
_0225F210:
	and r0, r8, sl
	movs r0, r0, asr #1
	movne r4, #1
	moveq r4, #0
	cmp fp, #0
	cmpne r4, #0
	beq _0225F230
	blx fp
_0225F230:
	mov r0, r4
	add sp, sp, #128 ; 0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_0225F23C: .word ov123_02260148 + 0x1300
_0225F240: .word ov123_0225FB24 + 0x1300
_0225F244: .word 0xFFFFE9E0
	arm_func_end ov123_0225F190

	arm_func_start ov123_0225F248
ov123_0225F248: ; 0x0225F248
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub sp, sp, #128 ; 0x80
	ldr r2, [pc, #156] ; _0225F2F4
	ldr r1, [pc, #156] ; _0225F2F8
	mov sl, #0
	adds r2, r2, #800 ; 0x320
	add r1, r1, #800 ; 0x320
	mov fp, r0
	mov r8, sl
	mov r9, sl
	str sl, [sp, #8]
	str r2, [sp]
	str r1, [sp, #4]
	beq _0225F2C8
	ldr r4, [pc, #116] ; _0225F2FC
	mov r5, sl
	mov r6, #1
	add r7, sp, #0
_0225F290:
	ldr r0, [r7, r9, lsl #2]
	add r0, r0, r4
	blx r0
	cmp r0, #0
	movne r1, r6
	add r9, r9, #1
	moveq r1, r5
	add r2, r8, r1
	ldr r0, [r7, r9, lsl #2]
	add r1, sl, #1
	cmp r0, #0
	mov r8, r2, lsl #1
	mov sl, r1, lsl #1
	bne _0225F290
_0225F2C8:
	mov r0, r8, asr #1
	cmp r0, sl, asr #1
	moveq r4, #1
	movne r4, #0
	cmp fp, #0
	cmpne r4, #0
	beq _0225F2E8
	blx fp
_0225F2E8:
	mov r0, r4
	add sp, sp, #128 ; 0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_0225F2F4: .word ov123_022601C0 + 0x1300
_0225F2F8: .word ov123_0225FB9C + 0x1300
_0225F2FC: .word 0xFFFFE9E0
	arm_func_end ov123_0225F248

	arm_func_start ov123_0225F300
ov123_0225F300: ; 0x0225F300
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub sp, sp, #128 ; 0x80
	movs sl, #0
	mov fp, r0
	mov r8, sl
	mov r9, sl
	str sl, [sp]
	beq _0225F368
	ldr r4, [pc, #108] ; _0225F394
	mov r5, #0
	mov r6, #1
	add r7, sp, #0
_0225F330:
	ldr r0, [r7, r9, lsl #2]
	add r0, r0, r4
	blx r0
	cmp r0, #0
	movne r1, r6
	add r9, r9, #1
	moveq r1, r5
	add r2, r8, r1
	ldr r0, [r7, r9, lsl #2]
	add r1, sl, #1
	cmp r0, #0
	mov r8, r2, lsl #1
	mov sl, r1, lsl #1
	bne _0225F330
_0225F368:
	and r0, r8, sl
	movs r0, r0, asr #1
	movne r4, #1
	moveq r4, #0
	cmp fp, #0
	cmpne r4, #0
	beq _0225F388
	blx fp
_0225F388:
	mov r0, r4
	add sp, sp, #128 ; 0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_0225F394: .word 0xFFFFE9E0
	arm_func_end ov123_0225F300

	arm_func_start ov123_0225F398
ov123_0225F398: ; 0x0225F398
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub sp, sp, #128 ; 0x80
	movs sl, #0
	mov fp, r0
	mov r8, sl
	mov r9, sl
	str sl, [sp]
	beq _0225F400
	ldr r4, [pc, #108] ; _0225F42C
	mov r5, #0
	mov r6, #1
	add r7, sp, #0
_0225F3C8:
	ldr r0, [r7, r9, lsl #2]
	add r0, r0, r4
	blx r0
	cmp r0, #0
	movne r1, r6
	add r9, r9, #1
	moveq r1, r5
	add r2, r8, r1
	ldr r0, [r7, r9, lsl #2]
	add r1, sl, #1
	cmp r0, #0
	mov r8, r2, lsl #1
	mov sl, r1, lsl #1
	bne _0225F3C8
_0225F400:
	mov r0, r8, asr #1
	cmp r0, sl, asr #1
	moveq r4, #1
	movne r4, #0
	cmp fp, #0
	cmpne r4, #0
	beq _0225F420
	blx fp
_0225F420:
	mov r0, r4
	add sp, sp, #128 ; 0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_0225F42C: .word 0xFFFFE9E0
	arm_func_end ov123_0225F398

	arm_func_start ov123_0225F430
ov123_0225F430: ; 0x0225F430
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _0225F4A4
	adr r3, _0225F498
	str lr, [r3]
	ldr r2, _0225F49C
	ldr r0, _0225F4A0
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _0225F4A4
	ldr r2, _0225F49C
	ldr r0, _0225F4A0
	bl ov123_0225FF30
	str r0, _0225F4A0
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _0225F498
	str pc, _0225F498
	bx lr
_0225F498: .word _02260C00+1
_0225F49C: .word 0xAC
_0225F4A0: .word 0x6AB2
_0225F4A4: .word ov123_0225F020
	arm_func_end ov123_0225F430

	arm_func_start ov123_0225F4A8
ov123_0225F4A8: ; 0x0225F4A8
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _0225F51C
	adr r3, _0225F510
	str lr, [r3]
	ldr r2, _0225F514
	ldr r0, _0225F518
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _0225F51C
	ldr r2, _0225F514
	ldr r0, _0225F518
	bl ov123_0225FF30
	str r0, _0225F518
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _0225F510
	str pc, _0225F510
	bx lr
_0225F510: .word _02260C00+1
_0225F514: .word 0xAC
_0225F518: .word 0x6AB2
_0225F51C: .word ov123_0225F0D8
	arm_func_end ov123_0225F4A8

	arm_func_start ov123_0225F520
ov123_0225F520: ; 0x0225F520
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _0225F594
	adr r3, _0225F588
	str lr, [r3]
	ldr r2, _0225F58C
	ldr r0, _0225F590
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _0225F594
	ldr r2, _0225F58C
	ldr r0, _0225F590
	bl ov123_0225FF30
	str r0, _0225F590
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _0225F588
	str pc, _0225F588
	bx lr
_0225F588: .word _02260C00+1
_0225F58C: .word 0xAC
_0225F590: .word 0x6AB2
_0225F594: .word ov123_0225F190
	arm_func_end ov123_0225F520

	arm_func_start ov123_0225F598
ov123_0225F598: ; 0x0225F598
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _0225F60C
	adr r3, _0225F600
	str lr, [r3]
	ldr r2, _0225F604
	ldr r0, _0225F608
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _0225F60C
	ldr r2, _0225F604
	ldr r0, _0225F608
	bl ov123_0225FF30
	str r0, _0225F608
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _0225F600
	str pc, _0225F600
	bx lr
_0225F600: .word _02260C00+1
_0225F604: .word 0xAC
_0225F608: .word 0x6AB2
_0225F60C: .word ov123_0225F248
	arm_func_end ov123_0225F598

	arm_func_start ov123_0225F610
ov123_0225F610: ; 0x0225F610
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _0225F684
	adr r3, _0225F678
	str lr, [r3]
	ldr r2, _0225F67C
	ldr r0, _0225F680
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _0225F684
	ldr r2, _0225F67C
	ldr r0, _0225F680
	bl ov123_0225FF30
	str r0, _0225F680
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _0225F678
	str pc, _0225F678
	bx lr
_0225F678: .word _02260C00+1
_0225F67C: .word 0x94
_0225F680: .word 0x6AB2
_0225F684: .word ov123_0225F300
	arm_func_end ov123_0225F610

	arm_func_start ov123_0225F688
ov123_0225F688: ; 0x0225F688
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _0225F6FC
	adr r3, _0225F6F0
	str lr, [r3]
	ldr r2, _0225F6F4
	ldr r0, _0225F6F8
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _0225F6FC
	ldr r2, _0225F6F4
	ldr r0, _0225F6F8
	bl ov123_0225FF30
	str r0, _0225F6F8
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _0225F6F0
	str pc, _0225F6F0
	bx lr
_0225F6F0: .word _02260C00+1
_0225F6F4: .word 0x94
_0225F6F8: .word 0x6AB2
_0225F6FC: .word ov123_0225F398
	arm_func_end ov123_0225F688

	arm_func_start ov123_0225F700
ov123_0225F700: ; 0x0225F700
	stmdb sp!, {lr}
	adr r0, _0225F710
	bl ov123_0225FD98
	ldmia sp!, {pc}
_0225F710:
	.word ov123_0225F430, 0x68
	.word ov123_0225F4A8, 0x68
	.word ov123_0225F520, 0x68
	.word ov123_0225F598, 0x68
	.word ov123_0225F610, 0x68
	.word ov123_0225F688, 0x68
	.word 0, 0
	arm_func_end ov123_0225F700

_0225F748:
	.word ov123_02260BBC + 0x1300

	arm_func_start ov123_0225F74C
ov123_0225F74C: ; 0x0225F74C
	ldr r0, [pc, #204] ; _0225F820
	sub r0, r0, #9728 ; 0x2600
	add r1, r0, #4096 ; 0x1000
	ldrb r2, [r1, #768] ; 0x300
	add r0, r0, #1
	cmp r2, #240 ; 0xf0
	bxne lr
	ldrb r2, [r1, #769] ; 0x301
	cmp r2, #0
	bxne lr
	ldrb r2, [r1, #770] ; 0x302
	cmp r2, #45 ; 0x2d
	bxne lr
	ldrb r2, [r1, #771] ; 0x303
	cmp r2, #233 ; 0xe9
	bxne lr
	ldrb r2, [r1, #772] ; 0x304
	cmp r2, #15
	bxne lr
	ldrb r2, [r1, #773] ; 0x305
	cmp r2, #0
	bxne lr
	ldrb r2, [r1, #774] ; 0x306
	cmp r2, #45 ; 0x2d
	bxne lr
	ldrb r2, [r1, #775] ; 0x307
	cmp r2, #233 ; 0xe9
	bxne lr
	ldrb r2, [r1, #776] ; 0x308
	cmp r2, #240 ; 0xf0
	bxne lr
	ldrb r2, [r1, #777] ; 0x309
	cmp r2, #0
	bxne lr
	ldrb r2, [r1, #778] ; 0x30a
	cmp r2, #189 ; 0xbd
	bxne lr
	ldrb r2, [r1, #779] ; 0x30b
	cmp r2, #232 ; 0xe8
	bxne lr
	ldrb r2, [r1, #780] ; 0x30c
	cmp r2, #96 ; 0x60
	bxne lr
	ldrb r2, [r1, #781] ; 0x30d
	cmp r2, #16
	bxne lr
	ldrb r2, [r1, #782] ; 0x30e
	cmp r2, #159 ; 0x9f
	bxne lr
	ldrb r1, [r1, #783] ; 0x30f
	cmp r1, #229 ; 0xe5
	moveq r0, #0
	bx lr
_0225F820: .word ov123_02260148 + 0x1300
	arm_func_end ov123_0225F74C

	arm_func_start ov123_0225F824
ov123_0225F824: ; 0x0225F824
	ldr r0, [pc, #264] ; _0225F934
	sub r0, r0, #9728 ; 0x2600
	add r1, r0, #4096 ; 0x1000
	ldrb r2, [r1, #768] ; 0x300
	cmp r2, #240 ; 0xf0
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #769] ; 0x301
	cmp r2, #0
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #770] ; 0x302
	cmp r2, #45 ; 0x2d
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #771] ; 0x303
	cmp r2, #233 ; 0xe9
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #772] ; 0x304
	cmp r2, #15
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #773] ; 0x305
	cmp r2, #0
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #774] ; 0x306
	cmp r2, #45 ; 0x2d
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #775] ; 0x307
	cmp r2, #233 ; 0xe9
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #776] ; 0x308
	cmp r2, #240 ; 0xf0
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #777] ; 0x309
	cmp r2, #0
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #778] ; 0x30a
	cmp r2, #189 ; 0xbd
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #779] ; 0x30b
	cmp r2, #232 ; 0xe8
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #780] ; 0x30c
	cmp r2, #96 ; 0x60
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #781] ; 0x30d
	cmp r2, #16
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #782] ; 0x30e
	cmp r2, #159 ; 0x9f
	movne r0, #0
	bxne lr
	ldrb r1, [r1, #783] ; 0x30f
	cmp r1, #229 ; 0xe5
	movne r0, #0
	addeq r0, r0, #1
	bx lr
_0225F934: .word ov123_022601C0 + 0x1300
	arm_func_end ov123_0225F824

	arm_func_start ov123_0225F938
ov123_0225F938: ; 0x0225F938
	ldr r0, [pc, #204] ; _0225FA0C
	sub r0, r0, #9728 ; 0x2600
	add r1, r0, #4096 ; 0x1000
	ldrb r2, [r1, #768] ; 0x300
	add r0, r0, #1
	cmp r2, #240 ; 0xf0
	bxne lr
	ldrb r2, [r1, #769] ; 0x301
	cmp r2, #0
	bxne lr
	ldrb r2, [r1, #770] ; 0x302
	cmp r2, #45 ; 0x2d
	bxne lr
	ldrb r2, [r1, #771] ; 0x303
	cmp r2, #233 ; 0xe9
	bxne lr
	ldrb r2, [r1, #772] ; 0x304
	cmp r2, #15
	bxne lr
	ldrb r2, [r1, #773] ; 0x305
	cmp r2, #0
	bxne lr
	ldrb r2, [r1, #774] ; 0x306
	cmp r2, #45 ; 0x2d
	bxne lr
	ldrb r2, [r1, #775] ; 0x307
	cmp r2, #233 ; 0xe9
	bxne lr
	ldrb r2, [r1, #776] ; 0x308
	cmp r2, #240 ; 0xf0
	bxne lr
	ldrb r2, [r1, #777] ; 0x309
	cmp r2, #0
	bxne lr
	ldrb r2, [r1, #778] ; 0x30a
	cmp r2, #189 ; 0xbd
	bxne lr
	ldrb r2, [r1, #779] ; 0x30b
	cmp r2, #232 ; 0xe8
	bxne lr
	ldrb r2, [r1, #780] ; 0x30c
	cmp r2, #96 ; 0x60
	bxne lr
	ldrb r2, [r1, #781] ; 0x30d
	cmp r2, #16
	bxne lr
	ldrb r2, [r1, #782] ; 0x30e
	cmp r2, #159 ; 0x9f
	bxne lr
	ldrb r1, [r1, #783] ; 0x30f
	cmp r1, #229 ; 0xe5
	moveq r0, #0
	bx lr
_0225FA0C: .word ov123_0226068C + 0x1300
	arm_func_end ov123_0225F938

	arm_func_start ov123_0225FA10
ov123_0225FA10: ; 0x0225FA10
	ldr r0, [pc, #264] ; _0225FB20
	sub r0, r0, #9728 ; 0x2600
	add r1, r0, #4096 ; 0x1000
	ldrb r2, [r1, #768] ; 0x300
	cmp r2, #240 ; 0xf0
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #769] ; 0x301
	cmp r2, #0
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #770] ; 0x302
	cmp r2, #45 ; 0x2d
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #771] ; 0x303
	cmp r2, #233 ; 0xe9
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #772] ; 0x304
	cmp r2, #15
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #773] ; 0x305
	cmp r2, #0
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #774] ; 0x306
	cmp r2, #45 ; 0x2d
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #775] ; 0x307
	cmp r2, #233 ; 0xe9
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #776] ; 0x308
	cmp r2, #240 ; 0xf0
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #777] ; 0x309
	cmp r2, #0
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #778] ; 0x30a
	cmp r2, #189 ; 0xbd
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #779] ; 0x30b
	cmp r2, #232 ; 0xe8
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #780] ; 0x30c
	cmp r2, #96 ; 0x60
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #781] ; 0x30d
	cmp r2, #16
	movne r0, #0
	bxne lr
	ldrb r2, [r1, #782] ; 0x30e
	cmp r2, #159 ; 0x9f
	movne r0, #0
	bxne lr
	ldrb r1, [r1, #783] ; 0x30f
	cmp r1, #229 ; 0xe5
	movne r0, #0
	addeq r0, r0, #1
	bx lr
_0225FB20: .word ov123_02260704 + 0x1300
	arm_func_end ov123_0225FA10

	arm_func_start ov123_0225FB24
ov123_0225FB24: ; 0x0225FB24
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _0225FB98
	adr r3, _0225FB8C
	str lr, [r3]
	ldr r2, _0225FB90
	ldr r0, _0225FB94
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _0225FB98
	ldr r2, _0225FB90
	ldr r0, _0225FB94
	bl ov123_0225FF30
	str r0, _0225FB94
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _0225FB8C
	str pc, _0225FB8C
	bx lr
_0225FB8C: .word _02260C00+1
_0225FB90: .word 0xD4
_0225FB94: .word 0x9785
_0225FB98: .word ov123_0225F74C
	arm_func_end ov123_0225FB24

	arm_func_start ov123_0225FB9C
ov123_0225FB9C: ; 0x0225FB9C
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _0225FC10
	adr r3, _0225FC04
	str lr, [r3]
	ldr r2, _0225FC08
	ldr r0, _0225FC0C
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _0225FC10
	ldr r2, _0225FC08
	ldr r0, _0225FC0C
	bl ov123_0225FF30
	str r0, _0225FC0C
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _0225FC04
	str pc, _0225FC04
	bx lr
_0225FC04: .word _02260C00+1
_0225FC08: .word 0x110
_0225FC0C: .word 0x9785
_0225FC10: .word ov123_0225F824
	arm_func_end ov123_0225FB9C

	arm_func_start ov123_0225FC14
ov123_0225FC14: ; 0x0225FC14
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _0225FC88
	adr r3, _0225FC7C
	str lr, [r3]
	ldr r2, _0225FC80
	ldr r0, _0225FC84
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _0225FC88
	ldr r2, _0225FC80
	ldr r0, _0225FC84
	bl ov123_0225FF30
	str r0, _0225FC84
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _0225FC7C
	str pc, _0225FC7C
	bx lr
_0225FC7C: .word _02260C00+1
_0225FC80: .word 0xD4
_0225FC84: .word 0x9785
_0225FC88: .word ov123_0225F938
	arm_func_end ov123_0225FC14

	arm_func_start ov123_0225FC8C
ov123_0225FC8C: ; 0x0225FC8C
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _0225FD00
	adr r3, _0225FCF4
	str lr, [r3]
	ldr r2, _0225FCF8
	ldr r0, _0225FCFC
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _0225FD00
	ldr r2, _0225FCF8
	ldr r0, _0225FCFC
	bl ov123_0225FF30
	str r0, _0225FCFC
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _0225FCF4
	str pc, _0225FCF4
	bx lr
_0225FCF4: .word _02260C00+1
_0225FCF8: .word 0x110
_0225FCFC: .word 0x9785
_0225FD00: .word ov123_0225FA10
	arm_func_end ov123_0225FC8C

	arm_func_start ov123_0225FD04
ov123_0225FD04: ; 0x0225FD04
	stmdb sp!, {lr}
	adr r0, _0225FD14
	bl ov123_0225FD98
	ldmia sp!, {pc}
_0225FD14:
	.word ov123_0225FB24, 0x68
	.word ov123_0225FB9C, 0x68
	.word ov123_0225FC14, 0x68
	.word ov123_0225FC8C, 0x68
	.word 0, 0
	arm_func_end ov123_0225FD04

	arm_func_start ov123_0225FD3C
ov123_0225FD3C: ; 0x0225FD3C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl DC_FlushRange
	mov r0, r5
	mov r1, r4
	bl IC_InvalidateRange
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov123_0225FD3C

	arm_func_start ov123_0225FD5C
ov123_0225FD5C: ; 0x0225FD5C
	mov r0, r0, lsr #0x18
	and r1, r0, #0xff
	and r0, r1, #0xe
	cmp r0, #0xa
	bne _0225FD90
	and r0, r1, #0xf0
	cmp r0, #0xf0
	moveq r0, #1
	bxeq lr
	tst r1, #1
	movne r0, #2
	moveq r0, #3
	bx lr
_0225FD90:
	mov r0, #0
	bx lr
	arm_func_end ov123_0225FD5C

	arm_func_start ov123_0225FD98
ov123_0225FD98: ; 0x0225FD98
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r8, r0
	ldrne r1, [r8]
	cmpne r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r6, _0225FEA0 ; =SDK_OVERLAY_OV_123_BSS_START
_0225FDB0:
	ldr r0, [r8, #4]
	cmp r1, #0
	sub r0, r0, r6
	sub r4, r0, #0x1300
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	sub r7, r1, #0x1300
	bic r0, r4, #3
	add r5, r7, r0
	cmp r7, r5
	bhs _0225FE80
	ldr sb, _0225FEA4 ; =0xFFFFFB3E
_0225FDDC:
	ldr r0, [r7]
	bl ov123_0225FD5C
	cmp r0, #1
	cmpne r0, #2
	beq _0225FDFC
	cmp r0, #3
	beq _0225FE20
	b _0225FE44
_0225FDFC:
	ldr r1, [r7]
	bic r0, r1, #0xff000000
	and r1, r1, #0xff000000
	sub r0, r0, #0x1300
	eor r1, r1, #0x1000000
	bic r0, r0, #0xff000000
	orr r0, r1, r0
	str r0, [r7]
	b _0225FE74
_0225FE20:
	ldr r1, [r7]
	bic r0, r1, #0xff000000
	and r1, r1, #0xff000000
	add r0, r0, sb
	eor r1, r1, #0x1000000
	bic r0, r0, #0xff000000
	orr r0, r1, r0
	str r0, [r7]
	b _0225FE74
_0225FE44:
	ldrb r2, [r7]
	ldrb r1, [r7, #1]
	ldrb r3, [r7, #2]
	ldrb r0, [r7, #3]
	eor r2, r2, #0x56
	eor r1, r1, #0x65
	eor r3, r3, #0x56
	orr r1, r2, r1, lsl #8
	eor r2, r0, #0xf0
	orr r0, r1, r3, lsl #16
	orr r0, r0, r2, lsl #24
	str r0, [r7]
_0225FE74:
	add r7, r7, #4
	cmp r7, r5
	blo _0225FDDC
_0225FE80:
	ldr r0, [r8]
	mov r1, r4
	sub r0, r0, #0x1300
	bl ov123_0225FD3C
	ldr r1, [r8, #8]!
	cmp r1, #0
	bne _0225FDB0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0225FEA0: .word _02260C00
_0225FEA4: .word 0xFFFFFB3E
	arm_func_end ov123_0225FD98

	arm_func_start ov123_0225FEA8
ov123_0225FEA8: ; 0x0225FEA8
	stmdb sp!, {r3-r7, lr}
	sub sp, sp, #0x10
	ldr r3, _0225FF2C
	mov r5, r1
	add r1, r3, #0x1300
	sub r6, r0, r1
	mov r4, r2
	sub r4, r4, r1
	mov r2, r6, lsr #0x18
	mov r0, r6, lsr #0x8
	orr r0, r0, r6, lsl #0x18
	eor ip, r4, r0
	eor r7, r6, r4
	mov r1, r6, lsr #0x10
	orr r3, r2, r6, lsl #0x8
	orr r2, r1, r6, lsl #0x10
	eor r6, r4, r3
	eor lr, r4, r2
	sub r1, r5, #0x1300
	add r0, sp, #0
	mov r2, r1
	mov r3, r4
	str r7, [sp]
	str r6, [sp, #4]
	str lr, [sp, #8]
	str ip, [sp, #12]
	bl ov123_02260B14
	mov r1, r4
	sub r0, r5, #0x1300
	bl ov123_0225FD3C
	sub r0, r5, #0x1300
	add sp, sp, #0x10
	ldmfd sp!, {r3-r7, pc}
_0225FF2C: .word _02260C00
	arm_func_end ov123_0225FEA8

	arm_func_start ov123_0225FF30
ov123_0225FF30: ; 0x0225FF30
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #16
	ldr r3, [pc, #124] ; _0225FFBC
	mov r7, r0
	add r4, r3, #4864 ; 0x1300
	mov r6, r1
	sub r0, r7, r4
	add r7, r0, r6, lsr #20
	mov r5, r2
	mov r2, r7, lsr #24
	sub r5, r5, r4
	mov r0, r7, lsr #8
	orr r3, r2, r7, lsl #8
	mov r1, r7, lsr #16
	orr r2, r1, r7, lsl #16
	eor lr, r5, r3
	eor ip, r7, r5
	eor r3, r5, r2
	sub r1, r6, #4864 ; 0x1300
	str r3, [sp, #8]
	orr r0, r0, r7, lsl #24
	str ip, [sp]
	eor ip, r5, r0
	add r0, sp, #0
	mov r2, r1
	mov r3, r5
	str lr, [sp, #4]
	str ip, [sp, #12]
	bl ov123_02260ABC
	mov r1, r5
	sub r0, r6, #4864 ; 0x1300
	bl ov123_0225FD3C
	add r0, r7, r4
	add sp, sp, #16
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0225FFBC: .word _02260C00
	arm_func_end ov123_0225FF30

	arm_func_start ov123_0225FFC0
ov123_0225FFC0: ; 0x0225FFC0
	stmdb sp!, {lr}
	adr r0, _0225FFD0
	bl ov123_0225FD98
	ldmia sp!, {pc}
_0225FFD0:
	.word ov123_0225FF30, 0x8C
	.word ov123_0225FEA8, 0x84
	.word 0, 0
	arm_func_end ov123_0225FFC0

	arm_func_start ov123_0225FFE8
ov123_0225FFE8: ; 0x0225FFE8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #92 ; 0x5c
	add r0, sp, #0
	bl OS_GetMacAddress
	ldr r3, [pc, #148] ; _02260094
	add r2, sp, #0
	mov r4, #0
_02260004:
	ldrb r0, [r2]
	ldrb r1, [r3]
	eor r0, r0, #255 ; 0xff
	cmp r1, r0
	bne _0226002C
	add r4, r4, #1
	cmp r4, #6
	add r2, r2, #1
	add r3, r3, #1
	blt _02260004
_0226002C:
	add r0, sp, #6
	bl OS_GetOwnerInfo
	cmp r4, #6
	ldreqb r0, [sp, #8]
	cmpeq r0, #1
	ldreqb r0, [sp, #9]
	cmpeq r0, #1
	ldreqh r0, [sp, #32]
	cmpeq r0, #0
	addeq sp, sp, #92 ; 0x5c
	moveq r0, #1
	ldmeqia sp!, {r3, r4, pc}
	add r1, sp, #0
	mov r2, #0
_02260064:
	ldrb r0, [r1]
	cmp r0, #0
	addne sp, sp, #92 ; 0x5c
	movne r0, #0
	ldmneia sp!, {r3, r4, pc}
	add r2, r2, #1
	cmp r2, #6
	add r1, r1, #1
	blt _02260064
	mov r0, #1
	add sp, sp, #92 ; 0x5c
	ldmia sp!, {r3, r4, pc}
_02260094: .word _02260BD4
	arm_func_end ov123_0225FFE8

	arm_func_start ov123_02260098
ov123_02260098: ; 0x02260098
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #92 ; 0x5c
	add r0, sp, #0
	bl OS_GetMacAddress
	ldr r3, [pc, #148] ; _02260144
	add r2, sp, #0
	mov r4, #0
_022600B4:
	ldrb r0, [r2]
	ldrb r1, [r3]
	eor r0, r0, #255 ; 0xff
	cmp r1, r0
	bne _022600DC
	add r4, r4, #1
	cmp r4, #6
	add r2, r2, #1
	add r3, r3, #1
	blt _022600B4
_022600DC:
	add r0, sp, #6
	bl OS_GetOwnerInfo
	cmp r4, #6
	ldreqb r0, [sp, #8]
	cmpeq r0, #1
	ldreqb r0, [sp, #9]
	cmpeq r0, #1
	ldreqh r0, [sp, #32]
	cmpeq r0, #0
	addeq sp, sp, #92 ; 0x5c
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	add r1, sp, #0
	mov r2, #0
_02260114:
	ldrb r0, [r1]
	cmp r0, #0
	addne sp, sp, #92 ; 0x5c
	movne r0, #1
	ldmneia sp!, {r3, r4, pc}
	add r2, r2, #1
	cmp r2, #6
	add r1, r1, #1
	blt _02260114
	mov r0, #0
	add sp, sp, #92 ; 0x5c
	ldmia sp!, {r3, r4, pc}
_02260144: .word _02260BD4
	arm_func_end ov123_02260098

	arm_func_start ov123_02260148
ov123_02260148: ; 0x02260148
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _022601BC
	adr r3, _022601B0
	str lr, [r3]
	ldr r2, _022601B4
	ldr r0, _022601B8
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _022601BC
	ldr r2, _022601B4
	ldr r0, _022601B8
	bl ov123_0225FF30
	str r0, _022601B8
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _022601B0
	str pc, _022601B0
	bx lr
_022601B0: .word _02260C00+1
_022601B4: .word 0xAC
_022601B8: .word 0x982
_022601BC: .word ov123_0225FFE8
	arm_func_end ov123_02260148

	arm_func_start ov123_022601C0
ov123_022601C0: ; 0x022601C0
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _02260234
	adr r3, _02260228
	str lr, [r3]
	ldr r2, _0226022C
	ldr r0, _02260230
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _02260234
	ldr r2, _0226022C
	ldr r0, _02260230
	bl ov123_0225FF30
	str r0, _02260230
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _02260228
	str pc, _02260228
	bx lr
_02260228: .word _02260C00+1
_0226022C: .word 0xAC
_02260230: .word 0x982
_02260234: .word ov123_02260098
	arm_func_end ov123_022601C0

	arm_func_start ov123_02260238
ov123_02260238: ; 0x02260238
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub sp, sp, #8
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl OS_GetLockID
	mov r0, r0, lsl #16
	mov fp, r0, lsr #16
	mov r0, fp
	bl CARD_LockRom
	ldr r7, [pc, #332] ; _022603B4
	mov r0, #1
	ldrh lr, [r7]
	ldrh r1, [r7]
	mov r3, r0, lsl #26
	mov r0, #5
	bic r2, r1, #2048 ; 0x800
	mov r1, r0, lsl #18
	strh r2, [r7]
	add r0, r3, #16384 ; 0x4000
	ldrb r0, [r0]
	sub r1, r1, #13
	tst r0, #1
	orrne r1, r1, #262144 ; 0x40000
	mov r0, r1, lsl #5
	ldr r1, [r0]
	ldr r0, [pc, #272] ; 0x22603b8
	bic r1, r1, #117440512 ; 0x7000000
	and r0, r5, r0
	orr r7, r1, #-1593835520 ; 0xa1000000
	rsb ip, r0, #0
_022602B4:
	ldr r0, [r3, #420] ; 0x1a4
	tst r0, #-2147483648 ; 0x80000000
	bne _022602B4
	mov r0, #128 ; 0x80
	add r2, sp, #0
	strb r0, [r3, #417] ; 0x1a1
	mov r1, #0
_022602D0:
	add r0, r1, #67108864 ; 0x4000000
	ldrb r0, [r0, #424] ; 0x1a8
	add r1, r1, #1
	cmp r1, #8
	strb r0, [r2], #1
	blt _022602D0
	cmp ip, r4
	add r5, r5, ip
	bge _02260374
	mov r8, r5, lsr #8
	add r9, r3, #1048576 ; 0x100000
	mov r2, #183 ; 0xb7
	mov r1, #67108864 ; 0x4000000
	mov r0, #0
_02260308:
	strb r2, [r1, #424] ; 0x1a8
	mov sl, r5, lsr #24
	strb sl, [r1, #425] ; 0x1a9
	mov sl, r5, lsr #16
	strb sl, [r1, #426] ; 0x1aa
	strb r8, [r1, #427] ; 0x1ab
	strb r5, [r1, #428] ; 0x1ac
	strb r0, [r1, #429] ; 0x1ad
	strb r0, [r1, #430] ; 0x1ae
	strb r0, [r1, #431] ; 0x1af
	str r7, [r3, #420] ; 0x1a4
_02260334:
	ldr sl, [r3, #420] ; 0x1a4
	tst sl, #8388608 ; 0x800000
	beq _02260358
	cmp ip, #0
	ldr sl, [r9, #16]
	blt _02260354
	cmp ip, r4
	strlt sl, [r6, ip]
_02260354:
	add ip, ip, #4
_02260358:
	ldr sl, [r3, #420] ; 0x1a4
	tst sl, #-2147483648 ; 0x80000000
	bne _02260334
	cmp ip, r4
	add r8, r8, #2
	add r5, r5, #512 ; 0x200
	blt _02260308
_02260374:
	add r2, sp, #0
	mov r4, #0
_0226037C:
	ldrb r1, [r2], #1
	add r0, r4, #67108864 ; 0x4000000
	add r4, r4, #1
	strb r1, [r0, #424] ; 0x1a8
	cmp r4, #8
	blt _0226037C
	add r1, r3, #512 ; 0x200
	mov r0, fp
	strh lr, [r1, #4]
	bl CARD_UnlockRom
	mov r0, fp
	bl OS_ReleaseLockID
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_022603B4: .word 0x04000204
_022603B8: .word 0x000001FF
	arm_func_end ov123_02260238

	arm_func_start ov123_022603BC
ov123_022603BC: ; 0x022603BC
	; crc32?
	stmdb sp!, {r4, lr}
	cmp r1, #0
	sub r1, r1, #1
	mvn r4, #0
	beq _02260408
	ldr r2, [pc, #56] ; _02260410
	mov r3, #0
_022603D8:
	ldrb ip, [r0], #1
	mov lr, r3
	eor r4, r4, ip
_022603E4:
	tst r4, #1
	movne r4, r4, lsr #1
	add lr, lr, #1
	eoreq r4, r2, r4, lsr #1
	cmp lr, #8
	blt _022603E4
	cmp r1, #0
	sub r1, r1, #1
	bne _022603D8
_02260408:
	mvn r0, r4
	ldmia sp!, {r4, pc}
_02260410:
	.word 0xEDB88320
	arm_func_end ov123_022603BC

	arm_func_start ov123_02260414
ov123_02260414: ; 0x02260414
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _02260488
	adr r3, _0226047C
	str lr, [r3]
	ldr r2, _02260480
	ldr r0, _02260484
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _02260488
	ldr r2, _02260480
	ldr r0, _02260484
	bl ov123_0225FF30
	str r0, _02260484
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _0226047C
	str pc, _0226047C
	bx lr
_0226047C: .word _02260C00+1
_02260480: .word 0x17C
_02260484: .word 0x982
_02260488: .word ov123_02260238
	arm_func_end ov123_02260414

	arm_func_start ov123_0226048C
ov123_0226048C: ; 0x0226048C
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _02260500
	adr r3, _022604F4
	str lr, [r3]
	ldr r2, _022604F8
	ldr r0, _022604FC
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _02260500
	ldr r2, _022604F8
	ldr r0, _022604FC
	bl ov123_0225FF30
	str r0, _022604FC
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _022604F4
	str pc, _022604F4
	bx lr
_022604F4: .word _02260C00+1
_022604F8: .word 0x54
_022604FC: .word 0x982
_02260500: .word ov123_022603BC
	arm_func_end ov123_0226048C

	arm_func_start ov123_02260504
ov123_02260504: ; 0x02260504
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
	sub sp, sp, #540 ; 0x21c
	mov r0, #1
	mov r9, #512 ; 0x200
	mov r4, #4096 ; 0x1000
	mov r5, #0
	mov r6, r0, lsl #15
	add sl, sp, #28
	mov r8, r9
	add r7, sp, #0
_0226052C:
	mov r0, sl
	mov r1, r4
	mov r2, r9
	bl ov123_02260414
	mov r0, sl
	mov r1, r8
	bl ov123_0226048C
	cmp r5, #2
	str r0, [r7, r5, lsl #2]
	moveq r4, r6
	add r5, r5, #1
	addne r4, r4, #512 ; 0x200
	cmp r5, #6
	blt _0226052C
	ldr r2, [sp, #12]
	mov r3, #0
	add r1, sp, #0
_02260570:
	ldr r0, [r1, r3, lsl #2]
	cmp r2, r0
	movne r0, #1
	bne _022605A4
	add r3, r3, #1
	cmp r3, #3
	blt _02260570
	ldr r0, [sp, #16]
	cmp r2, r0
	ldreq r0, [sp, #20]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
_022605A4:
	mov r3, #0
	add r2, sp, #28
	mov r1, r3
_022605B0:
	add r3, r3, #1
	cmp r3, #512 ; 0x200
	strb r1, [r2], #1
	blt _022605B0
	add sp, sp, #540 ; 0x21c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
	arm_func_end ov123_02260504

	arm_func_start ov123_022605C8
ov123_022605C8: ; 0x022605C8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
	sub sp, sp, #540 ; 0x21c
	mov r0, #1
	mov r9, #512 ; 0x200
	mov r4, #4096 ; 0x1000
	mov r5, #0
	mov r6, r0, lsl #15
	add sl, sp, #28
	mov r8, r9
	add r7, sp, #0
_022605F0:
	mov r0, sl
	mov r1, r4
	mov r2, r9
	bl ov123_02260414
	mov r0, sl
	mov r1, r8
	bl ov123_0226048C
	cmp r5, #2
	str r0, [r7, r5, lsl #2]
	moveq r4, r6
	add r5, r5, #1
	addne r4, r4, #512 ; 0x200
	cmp r5, #6
	blt _022605F0
	ldr r2, [sp, #12]
	mov r3, #0
	add r1, sp, #0
_02260634:
	ldr r0, [r1, r3, lsl #2]
	cmp r2, r0
	movne r0, #0
	bne _02260668
	add r3, r3, #1
	cmp r3, #3
	blt _02260634
	ldr r0, [sp, #16]
	cmp r2, r0
	ldreq r0, [sp, #20]
	cmpeq r2, r0
	moveq r0, #0
	movne r0, #1
_02260668:
	mov r3, #0
	add r2, sp, #28
	mov r1, r3
_02260674:
	add r3, r3, #1
	cmp r3, #512 ; 0x200
	strb r1, [r2], #1
	blt _02260674
	add sp, sp, #540 ; 0x21c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
	arm_func_end ov123_022605C8

	arm_func_start ov123_0226068C
ov123_0226068C: ; 0x0226068C
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _02260700
	adr r3, _022606F4
	str lr, [r3]
	ldr r2, _022606F8
	ldr r0, _022606FC
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _02260700
	ldr r2, _022606F8
	ldr r0, _022606FC
	bl ov123_0225FF30
	str r0, _022606FC
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _022606F4
	str pc, _022606F4
	bx lr
_022606F4: .word _02260C00+1
_022606F8: .word 0xC4
_022606FC: .word 0x982
_02260700: .word ov123_02260504
	arm_func_end ov123_0226068C

	arm_func_start ov123_02260704
ov123_02260704: ; 0x02260704
	stmfd sp!, {r4-r7}
	stmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	ldr r1, _02260778
	adr r3, _0226076C
	str lr, [r3]
	ldr r2, _02260770
	ldr r0, _02260774
	bl ov123_0225FEA8
	mov ip, r0
	stmfd sp!, {r4-r7}
	ldmfd sp!, {r0-r3}
	ldmfd sp!, {r4-r7}
	blx ip
	stmfd sp!, {r4}
	mov r4, r0
	ldr r1, _02260778
	ldr r2, _02260770
	ldr r0, _02260774
	bl ov123_0225FF30
	str r0, _02260774
	mov r0, r4
	ldmfd sp!, {r4}
	ldr lr, _0226076C
	str pc, _0226076C
	bx lr
_0226076C: .word _02260C00+1
_02260770: .word 0xC4
_02260774: .word 0x982
_02260778: .word ov123_022605C8
	arm_func_end ov123_02260704

	arm_func_start ov123_0226077C
ov123_0226077C: ; 0x0226077C
	stmdb sp!, {lr}
	adr r0, _0226078C
	bl ov123_0225FD98
	ldmia sp!, {pc}
_0226078C:
	.word ov123_0226068C, 0x68
	.word ov123_02260704, 0x68
	.word ov123_02260148, 0x68
	.word ov123_022601C0, 0x68
	.word ov123_02260414, 0x68
	.word ov123_0226048C, 0x68
	.word 0, 0
	arm_func_end ov123_0226077C

	arm_func_start ov123_022607C4
ov123_022607C4: ; 0x022607C4
	stmfd sp!, {r4-r8, lr}
	mov r6, #0
	str r6, [r0]
	mov r7, r6
	mov r4, r6
	str r6, [r0, #4]
_022607DC:
	add r3, r0, r4
	strb r4, [r3, #8]
	add r4, r4, #1
	cmp r4, #0x100
	blt _022607DC
	mov r8, #0xFF
	mov r3, #0
_022607F8:
	ldrb ip, [r1, r6]
	add r5, r0, r8
	ldrb r4, [r5, #8]
	add ip, r7, ip
	add r6, r6, #1
	add ip, r4, ip
	and r7, ip, #0xFF
	add lr, r0, r7
	ldrb ip, [lr, #8]
	cmp r6, r2
	movcs r6, r3
	strb r4, [lr, #8]
	strb ip, [r5, #8]
	subs r8, r8, #1
	bpl _022607F8
	ldmfd sp!, {r4-r8, pc}
	arm_func_end ov123_022607C4

	arm_func_start ov123_02260838
ov123_02260838: ; 0x02260838
	stmfd sp!, {r4, lr}
	ldr r1, [r0]
	add lr, r0, #8
	add r1, r1, #1
	and r4, r1, #0xFF
	ldrb ip, [lr, r4]
	ldr r1, [r0, #4]
	add r1, ip, r1
	and r3, r1, #0xFF
	ldrb r2, [lr, r3]
	str r4, [r0]
	str r3, [r0, #4]
	add r1, ip, r2
	strb ip, [lr, r3]
	and r1, r1, #0xFF
	strb r2, [lr, r4]
	add r0, r0, r1
	ldrb r0, [r0, #8]
	ldmfd sp!, {r4, pc}
	arm_func_end ov123_02260838

	arm_func_start ov123_02260884
ov123_02260884: ; 0x02260884
	mov r2, #0
_02260888:
	and r1, r2, #0xFF
	eor r1, r1, #1
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #0x100
	blt _02260888
	mov r0, #0
	bx lr
	arm_func_end ov123_02260884

	arm_func_start ov123_022608A8
ov123_022608A8: ; 0x022608A8
	; s32 ov123_022608A8(UnkStruct *obj, void *dest, void *src, u32 size)
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub sp, sp, #256 ; 0x100
	mov r7, r3
	tst r7, #3
	mov sl, r0
	mov r9, r1
	mov r8, r2
	addne sp, sp, #256 ; 0x100
	mvnne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
	add r0, sp, #0
	bl ov123_02260884
	cmp r7, #0
	mov r4, #0
	bls _022609A4
	add fp, sp, #0
_022608E8:
	ldr r0, [r9, r4]
	add r6, r9, r4
	bl ov123_0225FD5C
	cmp r0, #1
	cmpne r0, #2
	beq _0226090C
	cmp r0, #3
	beq _02260934
	b _02260958
_0226090C:
	ldr r2, [r6]
	bic r0, r2, #-16777216 ; 0xff000000
	add r0, r0, #194 ; 0xc2
	and r1, r2, #-16777216 ; 0xff000000
	add r0, r0, #1024 ; 0x400
	eor r1, r1, #16777216 ; 0x1000000
	bic r0, r0, #-16777216 ; 0xff000000
	orr r0, r1, r0
	str r0, [r8, r4]
	b _02260998
_02260934:
	ldr r2, [r6]
	bic r0, r2, #-16777216 ; 0xff000000
	and r1, r2, #-16777216 ; 0xff000000
	add r0, r0, #4864 ; 0x1300
	eor r1, r1, #16777216 ; 0x1000000
	bic r0, r0, #-16777216 ; 0xff000000
	orr r0, r1, r0
	str r0, [r8, r4]
	b _02260998
_02260958:
	mov r0, sl
	add r5, r8, r4
	bl ov123_02260838
	ldrb r1, [r6]
	eor r1, r1, r0
	mov r0, sl
	strb r1, [r8, r4]
	bl ov123_02260838
	ldrb r1, [r6, #1]
	eor r0, r1, r0
	strb r0, [r5, #1]
	ldrb r0, [r6, #2]
	ldrb r0, [fp, r0]
	strb r0, [r5, #2]
	ldrb r0, [r6, #3]
	strb r0, [r5, #3]
_02260998:
	add r4, r4, #4
	cmp r4, r7
	bcc _022608E8
_022609A4:
	mov r0, #0
	add sp, sp, #256 ; 0x100
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
	arm_func_end ov123_022608A8

	arm_func_start ov123_022609B0
ov123_022609B0: ; 0x022609B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub sp, sp, #256 ; 0x100
	mov r7, r3
	tst r7, #3
	mov sl, r0
	mov r9, r1
	mov r8, r2
	addne sp, sp, #256 ; 0x100
	mvnne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
	add r0, sp, #0
	bl ov123_02260884
	cmp r7, #0
	mov r4, #0
	bls _02260AAC
	add fp, sp, #0
_022609F0:
	ldr r0, [r9, r4]
	add r6, r9, r4
	bl ov123_0225FD5C
	cmp r0, #1
	cmpne r0, #2
	beq _02260A14
	cmp r0, #3
	beq _02260A38
	b _02260A60
_02260A14:
	ldr r2, [r6]
	bic r0, r2, #-16777216 ; 0xff000000
	and r1, r2, #-16777216 ; 0xff000000
	sub r0, r0, #4864 ; 0x1300
	eor r1, r1, #16777216 ; 0x1000000
	bic r0, r0, #-16777216 ; 0xff000000
	orr r0, r1, r0
	str r0, [r8, r4]
	b _02260AA0
_02260A38:
	ldr r3, [r6]
	ldr r0, [pc, #116] ; 0x2260ab8
	bic r1, r3, #-16777216 ; 0xff000000
	add r0, r1, r0
	and r2, r3, #-16777216 ; 0xff000000
	eor r1, r2, #16777216 ; 0x1000000
	bic r0, r0, #-16777216 ; 0xff000000
	orr r0, r1, r0
	str r0, [r8, r4]
	b _02260AA0
_02260A60:
	mov r0, sl
	add r5, r8, r4
	bl ov123_02260838
	ldrb r1, [r6]
	eor r1, r1, r0
	mov r0, sl
	strb r1, [r8, r4]
	bl ov123_02260838
	ldrb r1, [r6, #1]
	eor r0, r1, r0
	strb r0, [r5, #1]
	ldrb r0, [r6, #2]
	ldrb r0, [fp, r0]
	strb r0, [r5, #2]
	ldrb r0, [r6, #3]
	strb r0, [r5, #3]
_02260AA0:
	add r4, r4, #4
	cmp r4, r7
	bcc _022609F0
_02260AAC:
	mov r0, #0
	add sp, sp, #256 ; 0x100
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_02260AB8: .word 0xFFFFFB3E ;   ; <UNDEFINED> instruction: 0xfffffb3e
	arm_func_end ov123_022609B0

	arm_func_start ov123_02260ABC
ov123_02260ABC: ; 0x02260ABC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #264 ; 0x108
	mov r4, r0
	mov r6, r1
	mov r5, r2
	mov r1, r4
	add r0, sp, #0
	mov r2, #16
	mov r4, r3
	bl ov123_022607C4
	add r0, sp, #0
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl ov123_022608A8
	mvn r1, #0
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	rsb r0, r0, #0
	add sp, sp, #264 ; 0x108
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov123_02260ABC

	arm_func_start ov123_02260B14
ov123_02260B14: ; 0x02260B14
	stmfd sp!, {r4, r5, r6, lr}
	sub sp, sp, #264 ; 0x108
	mov r4, r0
	mov r6, r1
	mov r5, r2
	mov r1, r4
	add r0, sp, #0
	mov r2, #16
	mov r4, r3
	bl ov123_022607C4
	add r0, sp, #0
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl ov123_022609B0
	mvn r1, #0
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	rsb r0, r0, #0
	add sp, sp, #264 ; 0x108
	ldmfd sp!, {r4, r5, r6, pc}
	arm_func_end ov123_02260B14

	arm_func_start ov123_02260B6C
ov123_02260B6C: ; 0x02260B6C
	stmdb sp!, {lr}
	adr r0, _02260B7C
	bl ov123_0225FD98
	ldmia sp!, {pc}
_02260B7C:
	.word ov123_022607C4, 0x74
	.word ov123_02260838, 0x4C
	.word ov123_02260884, 0x24
	.word ov123_022608A8, 0x108
	.word ov123_022609B0, 0x108
	.word ov123_02260ABC, 0x58
	.word ov123_02260B14, 0x58
	.word 0, 0
	arm_func_end ov123_02260B6C

	arm_func_start ov123_02260BBC
ov123_02260BBC: ; unreferenced
	.word 0xEBAA0113
	.word 0xE4064EC7
	.word 0xEF013596
	.word 0xE5212F83
	.word 0xE7EE335B
	.word 0xE83B197C
	arm_func_end ov123_02260BBC

	.rodata

_02260BD4: ; MAC address
	.byte 0xFF, 0xF6, 0x40, 0xFF, 0xFF, 0xCE

	.section .sinit,4

	.word ov123_0225F700
	.word ov123_0225FD04
	.word ov123_0225FFC0
	.word ov123_0226077C
	.word ov123_02260B6C

	.bss

_02260C00:
	.space 0x20
