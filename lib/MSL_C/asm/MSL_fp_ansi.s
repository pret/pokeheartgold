	.include "asm/macros.inc"
	.include "MSL_fp_ansi.inc"
	.include "global.inc"

	.data

	.public digit_values
digit_values: ; 0x021113C8
	.word 0x00000000, 0x40240000
	.word 0x00000000, 0x40590000
	.word 0x00000000, 0x408F4000
	.word 0x00000000, 0x40C38800
	.word 0x00000000, 0x40F86A00
	.word 0x00000000, 0x412E8480
	.word 0x00000000, 0x416312D0
	.word 0x00000000, 0x4197D784

	.public fp_str$6E88
fp_str$6E88: ; 0x02111408
	.asciz "542101086242752217003726400434970855712890625"

	.balign 4, 0
	.public fp_str$6EB8
fp_str$6EB8: ; 0x02111438
	.asciz "11102230246251565404236316680908203125"

	.balign 4, 0
	.public fp_str$6EE0
fp_str$6EE0: ; 0x02111460
	.asciz "23283064365386962890625"

	.balign 4, 0
	.public fp_str$6EF8
fp_str$6EF8: ; 0x02111478
	.asciz "152587890625"

	.balign 4, 0
	.public fp_str$6F08
fp_str$6F08: ; 0x02111488
	.asciz "390625"

	.balign 4, 0
	.public fp_str$6F10
fp_str$6F10: ; 0x02111490
	.asciz "78125"

	.balign 4, 0
	.public fp_str$6F18
fp_str$6F18: ; 0x02111498
	.asciz "15625"

	.balign 4, 0
	.public fp_str$6F20
fp_str$6F20: ; 0x021114A0
	.asciz "3125"

	.balign 4, 0
	.public fp_str$6F28
fp_str$6F28: ; 0x021114A8
	.asciz "625"

	.balign 4, 0
	.public fp_str$6F2C
fp_str$6F2C: ; 0x021114AC
	.asciz "125"

	.balign 4, 0
	.public fp_str$6F30
fp_str$6F30: ; 0x021114B0
	.asciz "25"

	.balign 4, 0
	.public fp_str$6F34
fp_str$6F34: ; 0x021114B4
	.asciz "5"

	.balign 4, 0
	.public fp_str$6F38
fp_str$6F38: ; 0x021114B8
	.asciz "1"

	.balign 4, 0
	.public fp_str$6F3C
fp_str$6F3C: ; 0x021114BC
	.asciz "2"

	.balign 4, 0
	.public fp_str$6F40
fp_str$6F40: ; 0x021114C0
	.asciz "4"

	.balign 4, 0
	.public fp_str$6F44
fp_str$6F44: ; 0x021114C4
	.asciz "8"

	.balign 4, 0
	.public fp_str$6F48
fp_str$6F48: ; 0x021114C8
	.asciz "16"

	.balign 4, 0
	.public fp_str$6F4C
fp_str$6F4C: ; 0x021114CC
	.asciz "32"

	.balign 4, 0
	.public fp_str$6F50
fp_str$6F50: ; 0x021114D0
	.asciz "64"

	.balign 4, 0
	.public fp_str$6F54
fp_str$6F54: ; 0x021114D4
	.asciz "128"

	.balign 4, 0
	.public fp_str$6F58
fp_str$6F58: ; 0x021114D8
	.asciz "256"

	.balign 4, 0
	.public fp_str$6F5C
fp_str$6F5C: ; 0x021114DC
	.asciz "179769313486231580793728714053034151"

	.text

	arm_func_start __must_round
__must_round: ; 0x020EEDD8
	add r3, r0, #5
	ldrb r2, [r3, r1]
	add ip, r3, r1
	cmp r2, #5
	movhi r0, #1
	bxhi lr
	mvnlo r0, #0
	bxlo lr
	ldrb r2, [r0, #4]
	add ip, ip, #1
	add r3, r3, r2
	cmp ip, r3
	bhs _020EEE28
_020EEE0C:
	ldrb r2, [ip]
	cmp r2, #0
	movne r0, #1
	bxne lr
	add ip, ip, #1
	cmp ip, r3
	blo _020EEE0C
_020EEE28:
	sub r1, r1, #1
	add r0, r0, r1
	ldrb r0, [r0, #5]
	tst r0, #1
	movne r0, #1
	mvneq r0, #0
	bx lr
	arm_func_end __must_round

	arm_func_start __dorounddecup
__dorounddecup: ; 0x020EEE44
	add r3, r0, #5
	add r1, r3, r1
	sub ip, r1, #1
	mov r1, #0
_020EEE54:
	ldrb r2, [ip]
	cmp r2, #9
	addlo r0, r2, #1
	strlob r0, [ip]
	bxlo lr
	cmp ip, r3
	bne _020EEE88
	mov r1, #1
	strb r1, [ip]
	ldrsh r1, [r0, #2]
	add r1, r1, #1
	strh r1, [r0, #2]
	bx lr
_020EEE88:
	strb r1, [ip], #-1
	b _020EEE54
	bx lr
	arm_func_end __dorounddecup

	arm_func_start __rounddec
__rounddec: ; 0x020EEE94
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	cmp r4, #0
	ldmleia sp!, {r3, r4, r5, pc}
	ldrb r2, [r5, #4]
	cmp r4, r2
	ldmgeia sp!, {r3, r4, r5, pc}
	bl __must_round
	strb r4, [r5, #4]
	cmp r0, #0
	ldmltia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl __dorounddecup
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __rounddec

	arm_func_start __ull2dec
__ull2dec: ; 0x020EEED4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r0, #0
	mov r8, r2
	strb r0, [sl]
	mov sb, r1
	cmp r8, #0
	strb r0, [sl, #4]
	cmpeq sb, #0
	beq _020EEF60
	mov r6, #0xa
	mov fp, r0
	mov r5, r0
	mov r4, r0
_020EEF0C:
	ldrb r1, [sl, #4]
	mov r0, sb
	mov r2, r6
	add r3, r1, #1
	mov r7, r1
	strb r3, [sl, #4]
	mov r1, r8
	mov r3, fp
	bl _ull_mod
	add r1, sl, r7
	strb r0, [r1, #5]
	mov r0, sb
	mov r1, r8
	mov r2, #0xa
	mov r3, #0
	bl _ll_udiv
	mov r8, r1
	mov sb, r0
	cmp r8, r5
	cmpeq sb, r4
	bne _020EEF0C
_020EEF60:
	ldrb r0, [sl, #4]
	add r2, sl, #5
	add r0, r2, r0
	sub r3, r0, #1
	cmp r2, r3
	bhs _020EEF90
_020EEF78:
	ldrb r0, [r3]
	ldrb r1, [r2]
	strb r0, [r2], #1
	strb r1, [r3], #-1
	cmp r2, r3
	blo _020EEF78
_020EEF90:
	ldrb r0, [sl, #4]
	sub r0, r0, #1
	strh r0, [sl, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end __ull2dec

	arm_func_start __timesdec
__timesdec: ; 0x020EEFA0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	ldrb r6, [r1, #4]
	ldrb r5, [r2, #4]
	mov r4, #0
	add r3, sp, #0
	add r5, r6, r5
	sub r5, r5, #1
	add r3, r3, r5
	add r6, r3, #1
	mov r7, r6
	strb r4, [r0]
	cmp r5, #0
	ble _020EF068
	add lr, r1, #5
	add fp, r2, #5
_020EEFE0:
	ldrb r3, [r2, #4]
	sub sl, r3, #1
	sub r3, r5, sl
	subs sb, r3, #1
	ldrb r3, [r1, #4]
	movmi sb, #0
	submi sl, r5, #1
	add r8, sl, #1
	sub r3, r3, sb
	cmp r8, r3
	movgt r8, r3
	add sl, fp, sl
	add sb, lr, sb
	cmp r8, #0
	ble _020EF034
_020EF01C:
	ldrb ip, [sb], #1
	ldrb r3, [sl], #-1
	sub r8, r8, #1
	cmp r8, #0
	mla r4, ip, r3, r4
	bgt _020EF01C
_020EF034:
	ldr r3, _020EF120 ; =0xCCCCCCCD
	sub r5, r5, #1
	umull r8, sb, r4, r3
	mov sb, sb, lsr #3
	cmp r5, #0
	mov sl, #0xa
	umull r8, sb, sl, sb
	sub sb, r4, r8
	strb sb, [r6, #-1]!
	mov r8, r4
	umull r3, r4, r8, r3
	mov r4, r4, lsr #3
	bgt _020EEFE0
_020EF068:
	ldrsh r3, [r1, #2]
	ldrsh r1, [r2, #2]
	cmp r4, #0
	add r1, r3, r1
	strh r1, [r0, #2]
	beq _020EF090
	strb r4, [r6, #-1]!
	ldrsh r1, [r0, #2]
	add r1, r1, #1
	strh r1, [r0, #2]
_020EF090:
	mov r3, #0
	b _020EF0A8
_020EF098:
	ldrb r2, [r6], #1
	add r1, r0, r3
	add r3, r3, #1
	strb r2, [r1, #5]
_020EF0A8:
	cmp r3, #0x20
	bge _020EF0B8
	cmp r6, r7
	blo _020EF098
_020EF0B8:
	cmp r6, r7
	addhs sp, sp, #0x40
	strb r3, [r0, #4]
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r1, [r6]
	cmp r1, #5
	addlo sp, sp, #0x40
	ldmloia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bne _020EF110
	add r2, r6, #1
	cmp r2, r7
	bhs _020EF100
_020EF0E8:
	ldrb r1, [r2]
	cmp r1, #0
	bne _020EF110
	add r2, r2, #1
	cmp r2, r7
	blo _020EF0E8
_020EF100:
	ldrb r1, [r6, #-1]
	tst r1, #1
	addeq sp, sp, #0x40
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EF110:
	ldrb r1, [r0, #4]
	bl __dorounddecup
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020EF120: .word 0xCCCCCCCD
	arm_func_end __timesdec

	arm_func_start __str2dec
__str2dec: ; 0x020EF124
	stmdb sp!, {r3, lr}
	strh r2, [r0, #2]
	mov ip, #0
	strb ip, [r0]
	b _020EF14C
_020EF138:
	ldrsb r3, [r1], #1
	add r2, r0, ip
	add ip, ip, #1
	sub r3, r3, #0x30
	strb r3, [r2, #5]
_020EF14C:
	cmp ip, #0x20
	bge _020EF160
	ldrsb r2, [r1]
	cmp r2, #0
	bne _020EF138
_020EF160:
	strb ip, [r0, #4]
	ldrsb r2, [r1]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	cmp r2, #5
	ldmltia sp!, {r3, pc}
	bgt _020EF1B4
	ldrsb r2, [r1, #1]
	add r1, r1, #1
	cmp r2, #0
	beq _020EF1A0
_020EF18C:
	cmp r2, #0x30
	bne _020EF1B4
	ldrsb r2, [r1, #1]!
	cmp r2, #0
	bne _020EF18C
_020EF1A0:
	sub r1, ip, #1
	add r1, r0, r1
	ldrb r1, [r1, #5]
	tst r1, #1
	ldmeqia sp!, {r3, pc}
_020EF1B4:
	ldrb r1, [r0, #4]
	bl __dorounddecup
	ldmia sp!, {r3, pc}
	arm_func_end __str2dec

	arm_func_start __two_exp
__two_exp: ; 0x020EF1C0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x4c
	mov r4, r1
	mvn r2, #0x34
	mov r5, r0
	cmp r4, r2
	bgt _020EF1F0
	bge _020EF2BC
	sub r0, r2, #0xb
	cmp r4, r0
	beq _020EF2A4
	b _020EF44C
_020EF1F0:
	add r1, r4, #0x20
	cmp r1, #0x28
	addls pc, pc, r1, lsl #2
	b _020EF44C
_020EF200: ; jump table
	b _020EF2D0 ; case 0
	b _020EF44C ; case 1
	b _020EF44C ; case 2
	b _020EF44C ; case 3
	b _020EF44C ; case 4
	b _020EF44C ; case 5
	b _020EF44C ; case 6
	b _020EF44C ; case 7
	b _020EF44C ; case 8
	b _020EF44C ; case 9
	b _020EF44C ; case 10
	b _020EF44C ; case 11
	b _020EF44C ; case 12
	b _020EF44C ; case 13
	b _020EF44C ; case 14
	b _020EF44C ; case 15
	b _020EF2E4 ; case 16
	b _020EF44C ; case 17
	b _020EF44C ; case 18
	b _020EF44C ; case 19
	b _020EF44C ; case 20
	b _020EF44C ; case 21
	b _020EF44C ; case 22
	b _020EF44C ; case 23
	b _020EF2F8 ; case 24
	b _020EF30C ; case 25
	b _020EF320 ; case 26
	b _020EF334 ; case 27
	b _020EF348 ; case 28
	b _020EF35C ; case 29
	b _020EF370 ; case 30
	b _020EF384 ; case 31
	b _020EF398 ; case 32
	b _020EF3AC ; case 33
	b _020EF3C0 ; case 34
	b _020EF3D4 ; case 35
	b _020EF3E8 ; case 36
	b _020EF3FC ; case 37
	b _020EF410 ; case 38
	b _020EF424 ; case 39
	b _020EF438 ; case 40
_020EF2A4:
	ldr r1, _020EF4F0 ; =fp_str$6E88
	mov r0, r5
	mvn r2, #0x13
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF2BC:
	ldr r1, _020EF4F4 ; =fp_str$6EB8
	add r2, r2, #0x25
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF2D0:
	ldr r1, _020EF4F8 ; =fp_str$6EE0
	add r2, r2, #0x2b
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF2E4:
	ldr r1, _020EF4FC ; =fp_str$6EF8
	add r2, r2, #0x30
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF2F8:
	ldr r1, _020EF500 ; =fp_str$6F08
	add r2, r2, #0x32
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF30C:
	ldr r1, _020EF504 ; =fp_str$6F10
	add r2, r2, #0x32
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF320:
	ldr r1, _020EF508 ; =fp_str$6F18
	add r2, r2, #0x33
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF334:
	ldr r1, _020EF50C ; =fp_str$6F20
	add r2, r2, #0x33
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF348:
	ldr r1, _020EF510 ; =fp_str$6F28
	add r2, r2, #0x33
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF35C:
	ldr r1, _020EF514 ; =fp_str$6F2C
	add r2, r2, #0x34
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF370:
	ldr r1, _020EF518 ; =fp_str$6F30
	add r2, r2, #0x34
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF384:
	ldr r1, _020EF51C ; =fp_str$6F34
	add r2, r2, #0x34
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF398:
	ldr r1, _020EF520 ; =fp_str$6F38
	mov r2, #0
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF3AC:
	ldr r1, _020EF524 ; =fp_str$6F3C
	mov r2, #0
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF3C0:
	ldr r1, _020EF528 ; =fp_str$6F40
	mov r2, #0
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF3D4:
	ldr r1, _020EF52C ; =fp_str$6F44
	mov r2, #0
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF3E8:
	ldr r1, _020EF530 ; =fp_str$6F48
	mov r2, #1
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF3FC:
	ldr r1, _020EF534 ; =fp_str$6F4C
	mov r2, #1
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF410:
	ldr r1, _020EF538 ; =fp_str$6F50
	mov r2, #1
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF424:
	ldr r1, _020EF53C ; =fp_str$6F54
	mov r2, #2
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF438:
	ldr r1, _020EF540 ; =fp_str$6F58
	mov r2, #2
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF44C:
	and r0, r4, #0x80000000
	add r1, r4, r0, lsr #31
	add r0, sp, #0x26
	mov r1, r1, asr #1
	bl __two_exp
	add r1, sp, #0x26
	mov r0, r5
	mov r2, r1
	bl __timesdec
	tst r4, #1
	addeq sp, sp, #0x4c
	ldmeqia sp!, {r4, r5, pc}
	add r3, sp, #0
	mov ip, r5
	mov r2, #9
_020EF488:
	ldrh r1, [ip]
	ldrh r0, [ip, #2]
	add ip, ip, #4
	subs r2, r2, #1
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	bne _020EF488
	ldrh r0, [ip]
	cmp r4, #0
	strh r0, [r3]
	add r0, sp, #0x26
	ble _020EF4CC
	ldr r1, _020EF524 ; =fp_str$6F3C
	mov r2, #0
	bl __str2dec
	b _020EF4D8
_020EF4CC:
	ldr r1, _020EF51C ; =fp_str$6F34
	mvn r2, #0
	bl __str2dec
_020EF4D8:
	add r1, sp, #0
	add r2, sp, #0x26
	mov r0, r5
	bl __timesdec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020EF4F0: .word fp_str$6E88
_020EF4F4: .word fp_str$6EB8
_020EF4F8: .word fp_str$6EE0
_020EF4FC: .word fp_str$6EF8
_020EF500: .word fp_str$6F08
_020EF504: .word fp_str$6F10
_020EF508: .word fp_str$6F18
_020EF50C: .word fp_str$6F20
_020EF510: .word fp_str$6F28
_020EF514: .word fp_str$6F2C
_020EF518: .word fp_str$6F30
_020EF51C: .word fp_str$6F34
_020EF520: .word fp_str$6F38
_020EF524: .word fp_str$6F3C
_020EF528: .word fp_str$6F40
_020EF52C: .word fp_str$6F44
_020EF530: .word fp_str$6F48
_020EF534: .word fp_str$6F4C
_020EF538: .word fp_str$6F50
_020EF53C: .word fp_str$6F54
_020EF540: .word fp_str$6F58
	arm_func_end __two_exp

	arm_func_start __equals_dec
__equals_dec: ; 0x020EF544
	stmdb sp!, {r4, lr}
	ldrb r3, [r0, #5]
	cmp r3, #0
	bne _020EF568
	ldrb r0, [r1, #5]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, pc}
_020EF568:
	ldrb r2, [r1, #5]
	cmp r2, #0
	bne _020EF584
	cmp r3, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, pc}
_020EF584:
	ldrsh r3, [r0, #2]
	ldrsh r2, [r1, #2]
	cmp r3, r2
	bne _020EF61C
	ldrb r4, [r0, #4]
	ldrb r2, [r1, #4]
	mov ip, #0
	mov lr, r4
	cmp r4, r2
	movgt lr, r2
	cmp lr, #0
	ble _020EF5DC
_020EF5B4:
	add r3, r0, ip
	add r2, r1, ip
	ldrb r3, [r3, #5]
	ldrb r2, [r2, #5]
	cmp r3, r2
	movne r0, #0
	ldmneia sp!, {r4, pc}
	add ip, ip, #1
	cmp ip, lr
	blt _020EF5B4
_020EF5DC:
	cmp lr, r4
	moveq r0, r1
	ldrb r1, [r0, #4]
	cmp ip, r1
	bge _020EF614
_020EF5F0:
	add r1, r0, ip
	ldrb r1, [r1, #5]
	cmp r1, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldrb r1, [r0, #4]
	add ip, ip, #1
	cmp ip, r1
	blt _020EF5F0
_020EF614:
	mov r0, #1
	ldmia sp!, {r4, pc}
_020EF61C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end __equals_dec

	arm_func_start __less_dec
__less_dec: ; 0x020EF624
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r2, [r0, #5]
	cmp r2, #0
	bne _020EF648
	ldrb r0, [r1, #5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020EF648:
	ldrb r2, [r1, #5]
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r3, [r1, #2]
	ldrsh r2, [r0, #2]
	cmp r2, r3
	bne _020EF6F8
	ldrb r5, [r0, #4]
	ldrb r4, [r1, #4]
	mov ip, #0
	mov lr, r5
	cmp r5, r4
	movgt lr, r4
	cmp lr, #0
	ble _020EF6BC
_020EF688:
	add r3, r1, ip
	add r2, r0, ip
	ldrb r3, [r3, #5]
	ldrb r2, [r2, #5]
	cmp r2, r3
	movlo r0, #1
	ldmloia sp!, {r3, r4, r5, pc}
	cmp r3, r2
	movlo r0, #0
	ldmloia sp!, {r3, r4, r5, pc}
	add ip, ip, #1
	cmp ip, lr
	blt _020EF688
_020EF6BC:
	cmp lr, r5
	bne _020EF6F0
	cmp ip, r4
	bge _020EF6F0
_020EF6CC:
	add r0, r1, ip
	ldrb r0, [r0, #5]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r1, #4]
	add ip, ip, #1
	cmp ip, r0
	blt _020EF6CC
_020EF6F0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020EF6F8:
	movlt r0, #1
	movge r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __less_dec

	arm_func_start __minus_dec
__minus_dec: ; 0x020EF704
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, #9
_020EF710:
	ldrh r4, [r1]
	ldrh r3, [r1, #2]
	add r1, r1, #4
	subs r5, r5, #1
	strh r4, [r6]
	strh r3, [r6, #2]
	add r6, r6, #4
	bne _020EF710
	ldrh r1, [r1]
	strh r1, [r6]
	ldrb r1, [r2, #5]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r7, [r0, #4]
	ldrb r3, [r2, #4]
	ldrsh r4, [r0, #2]
	mov r1, r7
	cmp r7, r3
	movlt r1, r3
	ldrsh r3, [r2, #2]
	sub r6, r4, r3
	add r1, r1, r6
	cmp r1, #0x20
	movgt r1, #0x20
	cmp r7, r1
	bge _020EF79C
	mov r4, #0
_020EF77C:
	ldrb r5, [r0, #4]
	add r3, r0, r7
	add r5, r5, #1
	strb r5, [r0, #4]
	strb r4, [r3, #5]
	ldrb r7, [r0, #4]
	cmp r7, r1
	blt _020EF77C
_020EF79C:
	ldrb r4, [r2, #4]
	add r3, r0, #5
	add ip, r3, r1
	add r4, r4, r6
	cmp r4, r1
	addlt ip, r3, r4
	sub r4, ip, r3
	add r1, r2, #5
	sub r4, r4, r6
	add lr, r1, r4
	mov r4, lr
	b _020EF830
_020EF7CC:
	ldrb r7, [ip, #-1]!
	ldrb r5, [lr, #-1]!
	cmp r7, r5
	bhs _020EF820
	ldrb r7, [ip, #-1]
	sub r5, ip, #1
	cmp r7, #0
	bne _020EF7F8
_020EF7EC:
	ldrb r7, [r5, #-1]!
	cmp r7, #0
	beq _020EF7EC
_020EF7F8:
	cmp r5, ip
	beq _020EF820
_020EF800:
	ldrb r7, [r5]
	sub r7, r7, #1
	strb r7, [r5]
	ldrb r7, [r5, #1]!
	cmp r5, ip
	add r7, r7, #0xa
	strb r7, [r5]
	bne _020EF800
_020EF820:
	ldrb r7, [ip]
	ldrb r5, [lr]
	sub r5, r7, r5
	strb r5, [ip]
_020EF830:
	cmp ip, r3
	cmphi lr, r1
	bhi _020EF7CC
	ldrb r5, [r2, #4]
	sub lr, r4, r1
	cmp lr, r5
	bge _020EF90C
	ldrb r1, [r4]
	mov r7, #0
	cmp r1, #5
	movlo r7, #1
	blo _020EF8A8
	bne _020EF8A8
	add r1, r2, #5
	add r2, r1, r5
	add r4, r4, #1
	cmp r4, r2
	bhs _020EF890
_020EF878:
	ldrb r1, [r4]
	cmp r1, #0
	bne _020EF90C
	add r4, r4, #1
	cmp r4, r2
	blo _020EF878
_020EF890:
	add r1, r3, lr
	add r2, r1, r6
	ldrb r1, [r2, #-1]
	sub ip, r2, #1
	tst r1, #1
	movne r7, #1
_020EF8A8:
	cmp r7, #0
	beq _020EF90C
	ldrb r1, [ip]
	cmp r1, #1
	bhs _020EF900
	ldrb r1, [ip, #-1]
	sub r2, ip, #1
	cmp r1, #0
	bne _020EF8D8
_020EF8CC:
	ldrb r1, [r2, #-1]!
	cmp r1, #0
	beq _020EF8CC
_020EF8D8:
	cmp r2, ip
	beq _020EF900
_020EF8E0:
	ldrb r1, [r2]
	sub r1, r1, #1
	strb r1, [r2]
	ldrb r1, [r2, #1]!
	cmp r2, ip
	add r1, r1, #0xa
	strb r1, [r2]
	bne _020EF8E0
_020EF900:
	ldrb r1, [ip]
	sub r1, r1, #1
	strb r1, [ip]
_020EF90C:
	ldrb r1, [r3]
	mov r5, r3
	cmp r1, #0
	bne _020EF928
_020EF91C:
	ldrb r1, [r5, #1]!
	cmp r1, #0
	beq _020EF91C
_020EF928:
	cmp r5, r3
	bls _020EF970
	ldrsh r1, [r0, #2]
	sub r2, r5, r3
	and r4, r2, #0xff
	sub r1, r1, r4
	strh r1, [r0, #2]
	ldrb r1, [r0, #4]
	add r2, r3, r1
	cmp r5, r2
	bhs _020EF964
_020EF954:
	ldrb r1, [r5], #1
	cmp r5, r2
	strb r1, [r3], #1
	blo _020EF954
_020EF964:
	ldrb r1, [r0, #4]
	sub r1, r1, r4
	strb r1, [r0, #4]
_020EF970:
	ldrb r1, [r0, #4]
	add r2, r0, #5
	add r3, r2, r1
	cmp r3, r2
	bls _020EF998
_020EF984:
	ldrb r1, [r3, #-1]!
	cmp r1, #0
	bne _020EF998
	cmp r3, r2
	bhi _020EF984
_020EF998:
	sub r1, r3, r2
	add r1, r1, #1
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end __minus_dec

	arm_func_start __num2dec_internal
__num2dec_internal: ; 0x020EF9A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x58
	mov r8, r1
	mov r6, r2
	mov r7, r0
	mov r0, r8
	mov r1, r6
	bl __signbitd
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r4, r1, lsl #0x18
	mov r0, #0
	mov r1, r0
	mov r2, r8
	mov r3, r6
	mov r5, r4, asr #0x18
	bl _deq
	bne _020EFA14
	strb r5, [r7]
	mov r1, #0
	strh r1, [r7, #2]
	mov r0, #1
	strb r0, [r7, #4]
	add sp, sp, #0x58
	strb r1, [r7, #5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020EFA14:
	mov r0, r8
	mov r1, r6
	bl __fpclassifyd
	cmp r0, #2
	bgt _020EFA60
	strb r5, [r7]
	mov r2, #0
	strh r2, [r7, #2]
	mov r2, #1
	mov r0, r8
	mov r1, r6
	strb r2, [r7, #4]
	bl __fpclassifyd
	cmp r0, #1
	moveq r0, #0x4e
	movne r0, #0x49
	add sp, sp, #0x58
	strb r0, [r7, #5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020EFA60:
	cmp r5, #0
	beq _020EFA84
	mov r0, #0
	mov r1, r0
	mov r2, r8
	mov r3, r6
	bl _dsub
	mov r8, r0
	mov r6, r1
_020EFA84:
	add r2, sp, #8
	mov r0, r8
	mov r1, r6
	bl frexp
	mov r4, r0
	mov r6, r1
	orr ip, r4, #0
	rsbs r2, ip, #0
	orr r3, r6, #0x100000
	rsc r1, r3, #0
	mov r0, #0
	and r3, r3, r1
	sub r1, r0, #1
	and ip, ip, r2
	mov r2, r1
	adds r0, ip, r1
	adc r1, r3, r2
	str r4, [sp]
	str r6, [sp, #4]
	bl __msl_generic_count_bits64
	rsb r8, r0, #0x35
	ldr r1, [sp, #8]
	add r0, sp, #0xc
	sub r1, r1, r8
	bl __two_exp
	mov r0, r4
	mov r1, r6
	mov r2, r8
	bl ldexp
	bl _ll_ufrom_d
	mov r2, r1
	mov r1, r0
	add r0, sp, #0x32
	bl __ull2dec
	mov r0, r7
	add r1, sp, #0x32
	add r2, sp, #0xc
	bl __timesdec
	strb r5, [r7]
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end __num2dec_internal

	arm_func_start __num2dec
__num2dec: ; 0x020EFB28
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r3
	ldrsh r5, [r0, #2]
	mov r0, r4
	bl __num2dec_internal
	ldrb r0, [r4, #5]
	cmp r0, #9
	ldmhiia sp!, {r3, r4, r5, pc}
	cmp r5, #0x20
	movgt r5, #0x20
	mov r0, r4
	mov r1, r5
	bl __rounddec
	ldrb r0, [r4, #4]
	cmp r0, r5
	bge _020EFB8C
	mov r1, #0
_020EFB6C:
	ldrb r2, [r4, #4]
	add r0, r4, r0
	add r2, r2, #1
	strb r2, [r4, #4]
	strb r1, [r0, #5]
	ldrb r0, [r4, #4]
	cmp r0, r5
	blt _020EFB6C
_020EFB8C:
	ldrsh r1, [r4, #2]
	sub r0, r0, #1
	mov r2, #0
	sub r0, r1, r0
	strh r0, [r4, #2]
	ldrb r0, [r4, #4]
	cmp r0, #0
	ldmleia sp!, {r3, r4, r5, pc}
_020EFBAC:
	add r1, r4, r2
	ldrb r0, [r1, #5]
	add r2, r2, #1
	add r0, r0, #0x30
	strb r0, [r1, #5]
	ldrb r0, [r4, #4]
	cmp r2, r0
	blt _020EFBAC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __num2dec

	arm_func_start __dec2num
__dec2num: ; 0x020EFBD0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xfc
	mov r4, r0
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _020EFC10
	ldrsb r0, [r4]
	mov r2, #0
	cmp r0, #0
	ldreq r3, _020F01D4 ; =0x3FF00000
	mov r0, #0
	ldrne r3, _020F01D8 ; =0xBFF00000
	mov r1, r0
	bl copysign
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EFC10:
	ldrb r0, [r4, #5]
	cmp r0, #0x30
	beq _020EFC30
	cmp r0, #0x49
	beq _020EFC58
	cmp r0, #0x4e
	beq _020EFC8C
	b _020EFCD4
_020EFC30:
	ldrsb r0, [r4]
	mov r2, #0
	cmp r0, #0
	ldreq r3, _020F01D4 ; =0x3FF00000
	mov r0, #0
	ldrne r3, _020F01D8 ; =0xBFF00000
	mov r1, r0
	bl copysign
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EFC58:
	ldrsb r0, [r4]
	mov r5, #0
	cmp r0, #0
	ldreq r4, _020F01D4 ; =0x3FF00000
	ldr r0, _020F01DC ; =__float_huge
	ldrne r4, _020F01D8 ; =0xBFF00000
	ldr r0, [r0]
	bl _f2d
	mov r2, r5
	mov r3, r4
	bl copysign
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EFC8C:
	ldr r1, _020F01E0 ; =0x7FF00000
	add r3, sp, #0x10
	mov r2, #0
	str r2, [r3]
	str r1, [r3, #4]
	ldrsb r0, [r4]
	cmp r0, #0
	beq _020EFCBC
	orr r0, r1, #0x80000000
	orr r1, r2, r2
	str r1, [r3]
	str r0, [r3, #4]
_020EFCBC:
	ldmia r3, {r0, r1}
	orr r0, r0, #0
	orr r1, r1, #0x80000
	stmia r3, {r0, r1}
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EFCD4:
	add r3, sp, #0xd6
	mov r5, r4
	mov r2, #9
_020EFCE0:
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	add r5, r5, #4
	subs r2, r2, #1
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	bne _020EFCE0
	ldrh r0, [r5]
	add r1, sp, #0xdb
	strh r0, [r3]
	ldrb r0, [sp, #0xda]
	add r5, r1, r0
	cmp r1, r5
	bhs _020EFD30
_020EFD1C:
	ldrb r0, [r1]
	sub r0, r0, #0x30
	strb r0, [r1], #1
	cmp r1, r5
	blo _020EFD1C
_020EFD30:
	ldrb r1, [sp, #0xda]
	ldrsh r2, [sp, #0xd8]
	add r0, sp, #0xb0
	sub r1, r1, #1
	add r1, r2, r1
	strh r1, [sp, #0xd8]
	ldr r1, _020F01E4 ; =fp_str$6F5C
	mov r2, #0x134
	ldrsh fp, [sp, #0xd8]
	bl __str2dec
	add r0, sp, #0xb0
	add r1, sp, #0xd6
	bl __less_dec
	cmp r0, #0
	beq _020EFDA0
	ldrsb r0, [r4]
	mov r5, #0
	cmp r0, #0
	ldreq r4, _020F01D4 ; =0x3FF00000
	ldr r0, _020F01DC ; =__float_huge
	ldrne r4, _020F01D8 ; =0xBFF00000
	ldr r0, [r0]
	bl _f2d
	mov r2, r5
	mov r3, r4
	bl copysign
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EFDA0:
	add r1, sp, #0xdb
	ldrb r0, [r1]
	add r8, r1, #1
	bl _dfltu
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	cmp r8, r5
	bhs _020EFE78
_020EFDC0:
	sub r0, r5, r8
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	adds r7, r1, r0, ror #29
	moveq r7, #8
	mov r6, #0
	mov r2, #0
	cmp r7, #0
	ble _020EFDFC
	mov r0, #0xa
_020EFDE8:
	ldrb r1, [r8], #1
	add r2, r2, #1
	cmp r2, r7
	mla r6, r0, r6, r1
	blt _020EFDE8
_020EFDFC:
	ldr r0, _020F01E8 ; =digit_values
	ldr r1, [sp, #0xc]
	add r3, r0, r7, lsl #3
	ldr r2, [r3, #-8]
	ldr r0, [sp, #8]
	ldr r3, [r3, #-4]
	bl _dmul
	mov r4, r0
	mov sb, r1
	mov r0, r6
	bl _dfltu
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sb
	bl _dadd
	cmp r6, #0
	mov r6, r0
	mov sl, r1
	beq _020EFE64
	mov r0, r4
	mov r1, sb
	mov r2, r6
	mov r3, sl
	bl _deq
	beq _020EFE78
_020EFE64:
	str r6, [sp, #8]
	str sl, [sp, #0xc]
	cmp r8, r5
	sub fp, fp, r7
	blo _020EFDC0
_020EFE78:
	cmp fp, #0
	bge _020EFEBC
	rsb r0, fp, #0
	bl _dflt
	mov r3, r1
	mov r2, r0
	ldr r1, _020F01EC ; =0x40140000
	mov r0, #0
	bl pow
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl _ddiv
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	b _020EFEF4
_020EFEBC:
	mov r0, fp
	bl _dflt
	mov r3, r1
	mov r2, r0
	ldr r1, _020F01EC ; =0x40140000
	mov r0, #0
	bl pow
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl _dmul
	str r0, [sp, #8]
	str r1, [sp, #0xc]
_020EFEF4:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r2, fp
	bl ldexp
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	bl __fpclassifyd
	cmp r0, #2
	bne _020EFF28
	ldr r0, _020F01F0 ; =0x7FEFFFFF
	mvn r1, #0
	str r1, [sp, #8]
	str r0, [sp, #0xc]
_020EFF28:
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	add r0, sp, #0x8a
	add r4, sp, #0
	mov r5, #0
	bl __num2dec_internal
	add r0, sp, #0x8a
	add r1, sp, #0xd6
	bl __equals_dec
	cmp r0, #0
	bne _020F019C
	add r0, sp, #0x8a
	add r1, sp, #0xd6
	bl __less_dec
	cmp r0, #0
	movne r5, #1
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r5, #0
	moveq r6, #1
	str r1, [sp]
	str r0, [sp, #4]
	movne r6, #0
_020EFF84:
	cmp r6, #0
	bne _020EFFAC
	ldmia r4, {r0, r1}
	adds r0, r0, #1
	adc r1, r1, #0
	stmia r4, {r0, r1}
	bl __fpclassifyd
	cmp r0, #2
	beq _020F019C
	b _020EFFC4
_020EFFAC:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	subs r1, r1, #1
	sbc r0, r0, #0
	str r1, [r4]
	str r0, [r4, #4]
_020EFFC4:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, sp, #0x64
	bl __num2dec_internal
	cmp r5, #0
	beq _020EFFF0
	add r0, sp, #0x64
	add r1, sp, #0xd6
	bl __less_dec
	cmp r0, #0
	beq _020F0114
_020EFFF0:
	cmp r5, #0
	bne _020F00CC
	add r0, sp, #0xd6
	add r1, sp, #0x64
	bl __less_dec
	cmp r0, #0
	bne _020F00CC
	add r3, sp, #0x8a
	add r5, sp, #0x3e
	mov r2, #9
_020F0018:
	ldrh r1, [r3]
	ldrh r0, [r3, #2]
	add r3, r3, #4
	strh r1, [r5]
	strh r0, [r5, #2]
	add r5, r5, #4
	subs r2, r2, #1
	bne _020F0018
	ldrh r0, [r3]
	add r3, sp, #0x64
	add r4, sp, #0x8a
	strh r0, [r5]
	mov r2, #9
_020F004C:
	ldrh r1, [r3]
	ldrh r0, [r3, #2]
	add r3, r3, #4
	strh r1, [r4]
	strh r0, [r4, #2]
	add r4, r4, #4
	subs r2, r2, #1
	bne _020F004C
	ldrh r0, [r3]
	add r3, sp, #0x3e
	add r5, sp, #0x64
	strh r0, [r4]
	mov r2, #9
_020F0080:
	ldrh r1, [r3]
	ldrh r0, [r3, #2]
	add r3, r3, #4
	strh r1, [r5]
	strh r0, [r5, #2]
	add r5, r5, #4
	subs r2, r2, #1
	bne _020F0080
	ldrh r4, [r3]
	ldr r3, [sp, #8]
	ldr r1, [sp]
	ldr r2, [sp, #0xc]
	ldr r0, [sp, #4]
	strh r4, [r5]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r3, [sp]
	str r2, [sp, #4]
	b _020F0114
_020F00CC:
	add r7, sp, #0x64
	add r3, sp, #0x8a
	mov r2, #9
_020F00D8:
	ldrh r1, [r7]
	ldrh r0, [r7, #2]
	add r7, r7, #4
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	subs r2, r2, #1
	bne _020F00D8
	ldrh r2, [r7]
	ldr r1, [sp]
	ldr r0, [sp, #4]
	strh r2, [r3]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	b _020EFF84
_020F0114:
	add r0, sp, #0x3e
	add r1, sp, #0xd6
	add r2, sp, #0x8a
	bl __minus_dec
	add r0, sp, #0x18
	add r1, sp, #0x64
	add r2, sp, #0xd6
	bl __minus_dec
	add r0, sp, #0x3e
	add r1, sp, #0x18
	bl __equals_dec
	cmp r0, #0
	beq _020F0178
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	and r1, r1, #1
	and r0, r0, #0
	cmp r0, #0
	cmpeq r1, #0
	beq _020F019C
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	b _020F019C
_020F0178:
	add r0, sp, #0x3e
	add r1, sp, #0x18
	bl __less_dec
	cmp r0, #0
	bne _020F019C
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
_020F019C:
	ldrsb r0, [sp, #0xd6]
	cmp r0, #0
	beq _020F01C4
	mov r0, #0
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	mov r1, r0
	bl _dsub
	str r0, [sp, #8]
	str r1, [sp, #0xc]
_020F01C4:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020F01D4: .word 0x3FF00000
_020F01D8: .word 0xBFF00000
_020F01DC: .word __float_huge
_020F01E0: .word 0x7FF00000
_020F01E4: .word fp_str$6F5C
_020F01E8: .word digit_values
_020F01EC: .word 0x40140000
_020F01F0: .word 0x7FEFFFFF
	arm_func_end __dec2num

	exception __rounddec, 0x0041, 0x00200300
	exception __ull2dec, 0x00CD, 0x0050FF00
	exception __timesdec, 0x0185, 0x00D0FF00
	exception __str2dec, 0x009D, 0x00100000
	exception __two_exp, 0x0385, 0x00B00300
	exception __num2dec_internal, 0x0181, 0x00E01F00
	exception __num2dec, 0x00A9, 0x00200300
	exception __dec2num, 0x0624, __dec2num_exception

	.section .exception,4,1,2

__dec2num_exception:
	.byte 0x00, 0xFF, 0x05, 0x20, 0x00, 0x00, 0x00, 0x00
