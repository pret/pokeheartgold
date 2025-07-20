	.include "asm/macros.inc"
	.include "MSL_Common_scanf.inc"
	.include "global.inc"

	.rodata

parse_format$f: ; 0x0210E604
	.word 0x00000000
	.word 0x7FFFFFFF
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.size parse_format$f,.-parse_format$f

	.text

	local_arm_func_start parse_format
parse_format: ; 0x020E8104
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x28
	ldr r6, _020E85F4 ; =parse_format$f
	add r5, sp, #0
	mov r7, r0
	mov lr, r1
	mov r4, r5
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia r6, {r0, r1}
	stmia r5, {r0, r1}
	ldrsb r0, [r7, #1]
	add ip, r7, #1
	cmp r0, #0x25
	bne _020E8170
	strb r0, [sp, #3]
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
	add sp, sp, #0x28
	add r0, ip, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020E8170:
	cmp r0, #0x2a
	moveq r0, #1
	streqb r0, [sp]
	ldreqsb r0, [ip, #1]!
	cmp r0, #0
	blt _020E8190
	cmp r0, #0x80
	blt _020E8198
_020E8190:
	mov r1, #0
	b _020E81A8
_020E8198:
	ldr r1, _020E85F8 ; =__msl_digit
	mov r2, r0, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #8
_020E81A8:
	cmp r1, #0
	beq _020E8248
	mov r1, #0
	ldr r3, _020E85F8 ; =__msl_digit
	str r1, [sp, #4]
	mov r4, r1
	mov r1, #0xa
_020E81C4:
	ldr r2, [sp, #4]
	sub r0, r0, #0x30
	mla r0, r2, r1, r0
	str r0, [sp, #4]
	ldrsb r0, [ip, #1]!
	cmp r0, #0
	blt _020E81E8
	cmp r0, #0x80
	blt _020E81F0
_020E81E8:
	mov r2, r4
	b _020E81FC
_020E81F0:
	mov r2, r0, lsl #1
	ldrh r2, [r3, r2]
	and r2, r2, #8
_020E81FC:
	cmp r2, #0
	bne _020E81C4
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _020E8240
	mov r0, #0xff
	add r4, sp, #0
	strb r0, [sp, #3]
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
	add sp, sp, #0x28
	add r0, ip, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020E8240:
	mov r1, #1
	strb r1, [sp, #1]
_020E8248:
	cmp r0, #0x6c
	mov r1, #1
	bgt _020E8280
	cmp r0, #0x68
	blt _020E8274
	beq _020E829C
	cmp r0, #0x6a
	beq _020E82E8
	cmp r0, #0x6c
	beq _020E82B8
	b _020E830C
_020E8274:
	cmp r0, #0x4c
	beq _020E82DC
	b _020E830C
_020E8280:
	cmp r0, #0x74
	bgt _020E8290
	beq _020E8300
	b _020E830C
_020E8290:
	cmp r0, #0x7a
	beq _020E82F4
	b _020E830C
_020E829C:
	mov r2, #2
	strb r2, [sp, #2]
	ldrsb r2, [ip, #1]
	cmp r2, #0x68
	streqb r1, [sp, #2]
	ldreqsb r0, [ip, #1]!
	b _020E8310
_020E82B8:
	mov r2, #3
	strb r2, [sp, #2]
	ldrsb r2, [ip, #1]
	cmp r2, #0x6c
	bne _020E8310
	mov r0, #7
	strb r0, [sp, #2]
	ldrsb r0, [ip, #1]!
	b _020E8310
_020E82DC:
	mov r2, #9
	strb r2, [sp, #2]
	b _020E8310
_020E82E8:
	mov r2, #4
	strb r2, [sp, #2]
	b _020E8310
_020E82F4:
	mov r2, #5
	strb r2, [sp, #2]
	b _020E8310
_020E8300:
	mov r2, #6
	strb r2, [sp, #2]
	b _020E8310
_020E830C:
	mov r1, #0
_020E8310:
	cmp r1, #0
	ldrnesb r0, [ip, #1]!
	strb r0, [sp, #3]
	cmp r0, #0x5b
	bgt _020E8364
	bge _020E84B4
	cmp r0, #0x47
	bgt _020E8358
	subs r1, r0, #0x41
	addpl pc, pc, r1, lsl #2
	b _020E85C4
_020E833C: ; jump table
	b _020E83F0 ; case 0
	b _020E85C4 ; case 1
	b _020E85C4 ; case 2
	b _020E85C4 ; case 3
	b _020E83F0 ; case 4
	b _020E83F0 ; case 5
	b _020E83F0 ; case 6
_020E8358:
	cmp r0, #0x58
	beq _020E83DC
	b _020E85C4
_020E8364:
	cmp r0, #0x61
	bgt _020E8374
	beq _020E83F0
	b _020E85C4
_020E8374:
	sub r0, r0, #0x63
	cmp r0, #0x15
	addls pc, pc, r0, lsl #2
	b _020E85C4
_020E8384: ; jump table
	b _020E8440 ; case 0
	b _020E83DC ; case 1
	b _020E83F0 ; case 2
	b _020E83F0 ; case 3
	b _020E83F0 ; case 4
	b _020E85C4 ; case 5
	b _020E83DC ; case 6
	b _020E85C4 ; case 7
	b _020E85C4 ; case 8
	b _020E85C4 ; case 9
	b _020E85C4 ; case 10
	b _020E85CC ; case 11
	b _020E83DC ; case 12
	b _020E842C ; case 13
	b _020E85C4 ; case 14
	b _020E85C4 ; case 15
	b _020E8464 ; case 16
	b _020E85C4 ; case 17
	b _020E83DC ; case 18
	b _020E85C4 ; case 19
	b _020E85C4 ; case 20
	b _020E83DC ; case 21
_020E83DC:
	ldrb r0, [sp, #2]
	cmp r0, #9
	moveq r0, #0xff
	streqb r0, [sp, #3]
	b _020E85CC
_020E83F0:
	ldrb r1, [sp, #2]
	cmp r1, #1
	cmpne r1, #2
	beq _020E8410
	add r0, r1, #0xfc
	and r0, r0, #0xff
	cmp r0, #3
	bhi _020E841C
_020E8410:
	mov r0, #0xff
	strb r0, [sp, #3]
	b _020E85CC
_020E841C:
	cmp r1, #3
	moveq r0, #8
	streqb r0, [sp, #2]
	b _020E85CC
_020E842C:
	mov r1, #3
	mov r0, #0x78
	strb r1, [sp, #2]
	strb r0, [sp, #3]
	b _020E85CC
_020E8440:
	ldrb r0, [sp, #2]
	cmp r0, #3
	moveq r0, #0xa
	streqb r0, [sp, #2]
	beq _020E85CC
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sp, #3]
	b _020E85CC
_020E8464:
	ldrb r0, [sp, #2]
	cmp r0, #3
	moveq r0, #0xa
	streqb r0, [sp, #2]
	beq _020E8484
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sp, #3]
_020E8484:
	add r2, sp, #8
	mov r1, #0x20
	mov r0, #0xff
_020E8490:
	sub r1, r1, #1
	cmp r1, #0
	strb r0, [r2], #1
	bgt _020E8490
	mov r1, #0xc1
	mov r0, #0xfe
	strb r1, [sp, #9]
	strb r0, [sp, #0xc]
	b _020E85CC
_020E84B4:
	ldrb r0, [sp, #2]
	cmp r0, #3
	moveq r0, #0xa
	streqb r0, [sp, #2]
	beq _020E84D4
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sp, #3]
_020E84D4:
	ldrsb r2, [ip, #1]!
	mov r1, #0
	cmp r2, #0x5e
	ldreqsb r2, [ip, #1]!
	moveq r1, #1
	cmp r2, #0x5d
	bne _020E857C
	ldrb r0, [sp, #0x13]
	orr r0, r0, #0x20
	strb r0, [sp, #0x13]
	ldrsb r2, [ip, #1]!
	b _020E857C
_020E8504:
	add r0, sp, #0
	and r3, r2, #0xff
	add r6, r0, r3, asr #3
	ldrb r5, [r6, #8]
	and r3, r2, #7
	mov r4, #1
	orr r3, r5, r4, lsl r3
	strb r3, [r6, #8]
	ldrsb r3, [ip, #1]
	cmp r3, #0x2d
	bne _020E8578
	ldrsb r7, [ip, #2]
	cmp r7, #0
	cmpne r7, #0x5d
	beq _020E8578
	add r2, r2, #1
	cmp r2, r7
	bgt _020E8570
_020E854C:
	and r3, r2, #0xff
	add r6, r0, r3, asr #3
	ldrb r5, [r6, #8]
	and r3, r2, #7
	add r2, r2, #1
	orr r3, r5, r4, lsl r3
	strb r3, [r6, #8]
	cmp r2, r7
	ble _020E854C
_020E8570:
	ldrsb r2, [ip, #3]!
	b _020E857C
_020E8578:
	ldrsb r2, [ip, #1]!
_020E857C:
	cmp r2, #0
	cmpne r2, #0x5d
	bne _020E8504
	cmp r2, #0
	moveq r0, #0xff
	streqb r0, [sp, #3]
	beq _020E85CC
	cmp r1, #0
	beq _020E85CC
	add r2, sp, #8
	mov r1, #0x20
_020E85A8:
	ldrb r0, [r2]
	sub r1, r1, #1
	cmp r1, #0
	mvn r0, r0
	strb r0, [r2], #1
	bgt _020E85A8
	b _020E85CC
_020E85C4:
	mov r0, #0xff
	strb r0, [sp, #3]
_020E85CC:
	add r4, sp, #0
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
	add r0, ip, #1
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020E85F4: .word parse_format$f
_020E85F8: .word __msl_digit
	arm_func_end parse_format

	arm_func_start __sformatter
__sformatter: ; 0x020E85FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x88
	ldrsb r5, [r2]
	str r2, [sp, #0xc]
	mov r2, #0
	mov sb, r0
	mov r0, r2
	str r2, [sp, #0x20]
	mov r8, r1
	str r3, [sp, #0x10]
	str r0, [sp, #0x24]
	cmp r5, #0
	ldr sl, [sp, #0xb0]
	str r0, [sp, #0x30]
	mov r4, r2
	str r0, [sp, #0x44]
	str r0, [sp, #0x40]
	beq _020E9310
_020E8644:
	cmp r5, #0
	mov r0, #1
	blt _020E8658
	cmp r5, #0x80
	movlt r0, #0
_020E8658:
	cmp r0, #0
	movne r0, #0
	bne _020E8674
	mov r1, r5, lsl #1
	ldr r0, _020E9348 ; =__msl_digit
	ldrh r0, [r0, r1]
	and r0, r0, #0x100
_020E8674:
	cmp r0, #0
	beq _020E8734
	mov r2, #0
	ldr r1, _020E9348 ; =__msl_digit
	mov ip, r2
	mov r3, #1
_020E868C:
	ldr r0, [sp, #0xc]
	ldrsb r5, [r0, #1]!
	str r0, [sp, #0xc]
	mov r0, r3
	cmp r5, #0
	blt _020E86AC
	cmp r5, #0x80
	movlt r0, r2
_020E86AC:
	cmp r0, #0
	movne r0, ip
	moveq r0, r5, lsl #1
	ldreqh r0, [r1, r0]
	andeq r0, r0, #0x100
	cmp r0, #0
	bne _020E868C
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _020E9300
	ldr r5, _020E9348 ; =__msl_digit
	b _020E86E0
_020E86DC:
	add r4, r4, #1
_020E86E0:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	strb r0, [sp, #0x50]
	ldrsb r1, [sp, #0x50]
	cmp r1, #0
	blt _020E8708
	cmp r1, #0x80
	blt _020E8710
_020E8708:
	mov r0, #0
	b _020E871C
_020E8710:
	mov r0, r1, lsl #1
	ldrh r0, [r5, r0]
	and r0, r0, #0x100
_020E871C:
	cmp r0, #0
	bne _020E86DC
	mov r0, r8
	mov r2, #1
	blx sb
	b _020E9300
_020E8734:
	cmp r5, #0x25
	beq _020E87AC
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _020E87AC
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	strb r0, [sp, #0x50]
	and r0, r5, #0xff
	ldrsb r1, [sp, #0x50]
	cmp r0, r1
	beq _020E8798
	mov r0, r8
	mov r2, #1
	blx sb
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	str r0, [sp, #0x30]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	b _020E9300
_020E8798:
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	add r0, r0, #1
	str r0, [sp, #0xc]
	b _020E9300
_020E87AC:
	ldr r0, [sp, #0xc]
	add r1, sp, #0x60
	bl parse_format
	str r0, [sp, #0xc]
	ldrb r0, [sp, #0x60]
	cmp r0, #0
	bne _020E87E8
	ldrb r0, [sp, #0x63]
	cmp r0, #0x25
	beq _020E87E8
	ldr r0, [sp, #0x10]
	add r0, r0, #4
	str r0, [sp, #0x10]
	ldr r5, [r0, #-4]
	b _020E87EC
_020E87E8:
	mov r5, #0
_020E87EC:
	ldrb r0, [sp, #0x63]
	cmp r0, #0x6e
	beq _020E882C
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _020E882C
	mov r0, r8
	mov r1, #0
	mov r2, #2
	blx sb
	cmp r0, #0
	beq _020E882C
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	str r0, [sp, #0x30]
_020E882C:
	ldrb r1, [sp, #0x63]
	cmp r1, #0x5b
	bgt _020E8884
	bge _020E9058
	cmp r1, #0x47
	bgt _020E8878
	subs r0, r1, #0x41
	addpl pc, pc, r0, lsl #2
	b _020E886C
_020E8850: ; jump table
	b _020E8CD4 ; case 0
	b _020E9310 ; case 1
	b _020E9310 ; case 2
	b _020E9310 ; case 3
	b _020E8CD4 ; case 4
	b _020E8CD4 ; case 5
	b _020E8CD4 ; case 6
_020E886C:
	cmp r1, #0x25
	beq _020E8F50
	b _020E9310
_020E8878:
	cmp r1, #0x58
	beq _020E8B10
	b _020E9310
_020E8884:
	cmp r1, #0x78
	bgt _020E88FC
	subs r0, r1, #0x63
	addpl pc, pc, r0, lsl #2
	b _020E88F0
_020E8898: ; jump table
	b _020E8D98 ; case 0
	b _020E8904 ; case 1
	b _020E8CD4 ; case 2
	b _020E8CD4 ; case 3
	b _020E8CD4 ; case 4
	b _020E9310 ; case 5
	b _020E890C ; case 6
	b _020E9310 ; case 7
	b _020E9310 ; case 8
	b _020E9310 ; case 9
	b _020E9310 ; case 10
	b _020E929C ; case 11
	b _020E8B00 ; case 12
	b _020E9310 ; case 13
	b _020E9310 ; case 14
	b _020E9310 ; case 15
	b _020E8FDC ; case 16
	b _020E9310 ; case 17
	b _020E8B08 ; case 18
	b _020E9310 ; case 19
	b _020E9310 ; case 20
	b _020E8B10 ; case 21
_020E88F0:
	cmp r1, #0x61
	beq _020E8CD4
	b _020E9310
_020E88FC:
	cmp r1, #0xff
	b _020E9310
_020E8904:
	mov r0, #0xa
	b _020E8910
_020E890C:
	mov r0, #0
_020E8910:
	ldr r1, [sp, #0x30]
	cmp r1, #0
	beq _020E8930
	mov r0, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	b _020E8A38
_020E8930:
	ldrb r1, [sp, #0x62]
	add r2, sp, #0x5c
	cmp r1, #7
	cmpne r1, #4
	add r1, sp, #0x58
	bne _020E8974
	str r2, [sp]
	str r1, [sp, #4]
	add r1, sp, #0x54
	str r1, [sp, #8]
	ldr r1, [sp, #0x64]
	mov r2, sb
	mov r3, r8
	bl __strtoull
	str r0, [sp, #0x34]
	str r1, [sp, #0x18]
	b _020E8998
_020E8974:
	str r2, [sp]
	str r1, [sp, #4]
	add r1, sp, #0x54
	str r1, [sp, #8]
	ldr r1, [sp, #0x64]
	mov r2, sb
	mov r3, r8
	bl __strtoul
	str r0, [sp, #0x3c]
_020E8998:
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	bne _020E89C8
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	str r0, [sp, #0x30]
	mov r0, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	b _020E8A38
_020E89C8:
	add r4, r4, r0
	ldrb r0, [sp, #0x62]
	cmp r0, #7
	cmpne r0, #4
	bne _020E8A18
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _020E8A04
	ldr r0, [sp, #0x34]
	rsbs r0, r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	rsc r0, r0, #0
	str r0, [sp, #0x24]
	b _020E8A38
_020E8A04:
	ldr r0, [sp, #0x34]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	str r0, [sp, #0x24]
	b _020E8A38
_020E8A18:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	ldreq r0, [sp, #0x3c]
	streq r0, [sp, #0x1c]
	beq _020E8A38
	ldr r0, [sp, #0x3c]
	rsb r0, r0, #0
	str r0, [sp, #0x1c]
_020E8A38:
	cmp r5, #0
	beq _020E8AF0
	ldrb r0, [sp, #0x62]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020E8ADC
_020E8A50: ; jump table
	b _020E8A70 ; case 0
	b _020E8A7C ; case 1
	b _020E8A88 ; case 2
	b _020E8A94 ; case 3
	b _020E8AA0 ; case 4
	b _020E8AB4 ; case 5
	b _020E8AC0 ; case 6
	b _020E8ACC ; case 7
_020E8A70:
	ldr r0, [sp, #0x1c]
	str r0, [r5]
	b _020E8ADC
_020E8A7C:
	ldr r0, [sp, #0x1c]
	strb r0, [r5]
	b _020E8ADC
_020E8A88:
	ldr r0, [sp, #0x1c]
	strh r0, [r5]
	b _020E8ADC
_020E8A94:
	ldr r0, [sp, #0x1c]
	str r0, [r5]
	b _020E8ADC
_020E8AA0:
	ldr r0, [sp, #0x20]
	str r0, [r5]
	ldr r0, [sp, #0x24]
	str r0, [r5, #4]
	b _020E8ADC
_020E8AB4:
	ldr r0, [sp, #0x1c]
	str r0, [r5]
	b _020E8ADC
_020E8AC0:
	ldr r0, [sp, #0x1c]
	str r0, [r5]
	b _020E8ADC
_020E8ACC:
	ldr r0, [sp, #0x20]
	str r0, [r5]
	ldr r0, [sp, #0x24]
	str r0, [r5, #4]
_020E8ADC:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	ldreq r0, [sp, #0x44]
	addeq r0, r0, #1
	streq r0, [sp, #0x44]
_020E8AF0:
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	str r0, [sp, #0x40]
	b _020E9300
_020E8B00:
	mov r0, #8
	b _020E8B14
_020E8B08:
	mov r0, #0xa
	b _020E8B14
_020E8B10:
	mov r0, #0x10
_020E8B14:
	ldr r1, [sp, #0x30]
	cmp r1, #0
	beq _020E8B34
	mov r0, #0
	str r0, [sp, #0x3c]
	str r0, [sp, #0x34]
	str r0, [sp, #0x18]
	b _020E8C0C
_020E8B34:
	ldrb r1, [sp, #0x62]
	add r2, sp, #0x5c
	cmp r1, #7
	cmpne r1, #4
	add r1, sp, #0x58
	bne _020E8B78
	str r2, [sp]
	str r1, [sp, #4]
	add r1, sp, #0x54
	str r1, [sp, #8]
	ldr r1, [sp, #0x64]
	mov r2, sb
	mov r3, r8
	bl __strtoull
	str r0, [sp, #0x34]
	str r1, [sp, #0x18]
	b _020E8B9C
_020E8B78:
	str r2, [sp]
	str r1, [sp, #4]
	add r1, sp, #0x54
	str r1, [sp, #8]
	ldr r1, [sp, #0x64]
	mov r2, sb
	mov r3, r8
	bl __strtoul
	str r0, [sp, #0x3c]
_020E8B9C:
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	bne _020E8BCC
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	str r0, [sp, #0x30]
	mov r0, #0
	str r0, [sp, #0x3c]
	str r0, [sp, #0x34]
	str r0, [sp, #0x18]
	b _020E8C0C
_020E8BCC:
	add r4, r4, r0
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _020E8C0C
	ldrb r0, [sp, #0x62]
	cmp r0, #7
	ldrne r0, [sp, #0x3c]
	rsbne r0, r0, #0
	strne r0, [sp, #0x3c]
	bne _020E8C0C
	ldr r0, [sp, #0x34]
	rsbs r0, r0, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x18]
	rsc r0, r0, #0
	str r0, [sp, #0x18]
_020E8C0C:
	cmp r5, #0
	beq _020E8CC4
	ldrb r0, [sp, #0x62]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020E8CB0
_020E8C24: ; jump table
	b _020E8C44 ; case 0
	b _020E8C50 ; case 1
	b _020E8C5C ; case 2
	b _020E8C68 ; case 3
	b _020E8C74 ; case 4
	b _020E8C88 ; case 5
	b _020E8C94 ; case 6
	b _020E8CA0 ; case 7
_020E8C44:
	ldr r0, [sp, #0x3c]
	str r0, [r5]
	b _020E8CB0
_020E8C50:
	ldr r0, [sp, #0x3c]
	strb r0, [r5]
	b _020E8CB0
_020E8C5C:
	ldr r0, [sp, #0x3c]
	strh r0, [r5]
	b _020E8CB0
_020E8C68:
	ldr r0, [sp, #0x3c]
	str r0, [r5]
	b _020E8CB0
_020E8C74:
	ldr r0, [sp, #0x34]
	str r0, [r5]
	ldr r0, [sp, #0x18]
	str r0, [r5, #4]
	b _020E8CB0
_020E8C88:
	ldr r0, [sp, #0x3c]
	str r0, [r5]
	b _020E8CB0
_020E8C94:
	ldr r0, [sp, #0x3c]
	str r0, [r5]
	b _020E8CB0
_020E8CA0:
	ldr r0, [sp, #0x34]
	str r0, [r5]
	ldr r0, [sp, #0x18]
	str r0, [r5, #4]
_020E8CB0:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	ldreq r0, [sp, #0x44]
	addeq r0, r0, #1
	streq r0, [sp, #0x44]
_020E8CC4:
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	str r0, [sp, #0x40]
	b _020E9300
_020E8CD4:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _020E8CF0
	ldr r0, _020E934C ; =__float_nan
	ldr r0, [r0]
	bl _f2d
	b _020E8D3C
_020E8CF0:
	add r0, sp, #0x54
	str r0, [sp]
	ldr r0, [sp, #0x64]
	mov r1, sb
	mov r2, r8
	add r3, sp, #0x5c
	bl __strtold
	ldr r2, [sp, #0x5c]
	cmp r2, #0
	bne _020E8D38
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	str r0, [sp, #0x30]
	ldr r0, _020E934C ; =__float_nan
	ldr r0, [r0]
	bl _f2d
	b _020E8D3C
_020E8D38:
	add r4, r4, r2
_020E8D3C:
	cmp r5, #0
	beq _020E8D88
	ldrb r2, [sp, #0x62]
	cmp r2, #0
	beq _020E8D64
	cmp r2, #8
	beq _020E8D70
	cmp r2, #9
	stmeqia r5, {r0, r1}
	b _020E8D74
_020E8D64:
	bl _d2f
	str r0, [r5]
	b _020E8D74
_020E8D70:
	stmia r5, {r0, r1}
_020E8D74:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	ldreq r0, [sp, #0x44]
	addeq r0, r0, #1
	streq r0, [sp, #0x44]
_020E8D88:
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	str r0, [sp, #0x40]
	b _020E9300
_020E8D98:
	ldrb r0, [sp, #0x61]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x64]
	cmp r5, #0
	beq _020E8EE0
	cmp sl, #0
	beq _020E8DCC
	ldr r0, [sp, #0x10]
	mov r7, #1
	add r0, r0, #4
	ldr fp, [r0, #-4]
	str r0, [sp, #0x10]
_020E8DCC:
	ldr r0, [sp, #0x30]
	mov r1, #0
	cmp r0, #0
	str r1, [sp, #0x5c]
	beq _020E8DEC
	cmp fp, #0
	strneb r1, [r5]
	b _020E9300
_020E8DEC:
	mvn r0, #0
	str r5, [sp, #0x2c]
	str r0, [sp, #0x48]
	b _020E8E34
_020E8DFC:
	ldrb r0, [sp, #0x62]
	strb r6, [sp, #0x50]
	cmp r0, #0xa
	ldrnesb r0, [sp, #0x50]
	strneb r0, [r5], #1
	bne _020E8E28
	mov r0, r5
	add r1, sp, #0x50
	mov r2, #1
	bl mbtowc
	add r5, r5, #1
_020E8E28:
	ldr r0, [sp, #0x5c]
	add r1, r0, #1
	str r1, [sp, #0x5c]
_020E8E34:
	ldr r0, [sp, #0x64]
	cmp r0, #0
	sub r0, r0, #1
	str r0, [sp, #0x64]
	beq _020E8E84
	cmp sl, #0
	beq _020E8E64
	cmp fp, r1
	movhi r7, #1
	movls r7, #0
	cmp r7, #0
	beq _020E8E84
_020E8E64:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r6, r0
	ldr r0, [sp, #0x48]
	cmp r6, r0
	bne _020E8DFC
_020E8E84:
	strb r6, [sp, #0x50]
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	beq _020E8EA4
	cmp sl, #0
	beq _020E8ECC
	cmp r7, #0
	bne _020E8ECC
_020E8EA4:
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	cmp fp, #0
	str r0, [sp, #0x30]
	beq _020E9300
	ldr r0, [sp, #0x2c]
	mov r1, #0
	strb r1, [r0]
	b _020E9300
_020E8ECC:
	add r4, r4, r0
	ldr r0, [sp, #0x44]
	add r0, r0, #1
	str r0, [sp, #0x44]
	b _020E8F40
_020E8EE0:
	mov r0, #0
	str r0, [sp, #0x5c]
	mvn r5, #0
	b _020E8F00
_020E8EF0:
	strb r6, [sp, #0x50]
	ldr r0, [sp, #0x5c]
	add r0, r0, #1
	str r0, [sp, #0x5c]
_020E8F00:
	ldr r0, [sp, #0x64]
	cmp r0, #0
	sub r0, r0, #1
	str r0, [sp, #0x64]
	beq _020E8F30
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r6, r0
	cmp r6, r5
	bne _020E8EF0
_020E8F30:
	strb r6, [sp, #0x50]
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	beq _020E9310
_020E8F40:
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	str r0, [sp, #0x40]
	b _020E9300
_020E8F50:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _020E9300
	ldr r5, _020E9348 ; =__msl_digit
	b _020E8F68
_020E8F64:
	add r4, r4, #1
_020E8F68:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	strb r0, [sp, #0x50]
	ldrsb r1, [sp, #0x50]
	cmp r1, #0
	blt _020E8F90
	cmp r1, #0x80
	blt _020E8F98
_020E8F90:
	mov r0, #0
	b _020E8FA4
_020E8F98:
	mov r0, r1, lsl #1
	ldrh r0, [r5, r0]
	and r0, r0, #0x100
_020E8FA4:
	cmp r0, #0
	bne _020E8F64
	cmp r1, #0x25
	beq _020E8FD4
	mov r0, r8
	mov r2, #1
	blx sb
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	str r0, [sp, #0x30]
	b _020E9300
_020E8FD4:
	add r4, r4, #1
	b _020E9300
_020E8FDC:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _020E9058
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	strb r0, [sp, #0x50]
	b _020E9018
_020E9000:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	strb r0, [sp, #0x50]
_020E9018:
	ldrsb r1, [sp, #0x50]
	cmp r1, #0
	blt _020E902C
	cmp r1, #0x80
	blt _020E9034
_020E902C:
	mov r0, #0
	b _020E9044
_020E9034:
	ldr r0, _020E9348 ; =__msl_digit
	mov r2, r1, lsl #1
	ldrh r0, [r0, r2]
	and r0, r0, #0x100
_020E9044:
	cmp r0, #0
	bne _020E9000
	mov r0, r8
	mov r2, #1
	blx sb
_020E9058:
	cmp r5, #0
	beq _020E91D4
	cmp sl, #0
	beq _020E9080
	ldr r0, [sp, #0x10]
	mov r7, #1
	add r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [r0, #-4]
	sub fp, r0, #1
_020E9080:
	ldr r0, [sp, #0x30]
	mov r1, #0
	cmp r0, #0
	str r1, [sp, #0x5c]
	beq _020E90A0
	cmp fp, #0
	strneb r1, [r5]
	b _020E9300
_020E90A0:
	mvn r0, #0
	str r5, [sp, #0x28]
	str r0, [sp, #0x4c]
	b _020E9104
_020E90B0:
	strb r6, [sp, #0x50]
	ldrsb r1, [sp, #0x50]
	add r2, sp, #0x60
	and r3, r1, #0xff
	add r2, r2, r3, asr #3
	ldrb r3, [r2, #8]
	and r0, r1, #7
	mov r2, #1
	tst r3, r2, lsl r0
	beq _020E9154
	ldrb r0, [sp, #0x62]
	cmp r0, #0xa
	strneb r1, [r5], #1
	bne _020E90F8
	mov r0, r5
	add r1, sp, #0x50
	bl mbtowc
	add r5, r5, #2
_020E90F8:
	ldr r0, [sp, #0x5c]
	add r1, r0, #1
	str r1, [sp, #0x5c]
_020E9104:
	ldr r0, [sp, #0x64]
	cmp r0, #0
	sub r0, r0, #1
	str r0, [sp, #0x64]
	beq _020E9154
	cmp sl, #0
	beq _020E9134
	cmp fp, r1
	movhs r7, #1
	movlo r7, #0
	cmp r7, #0
	beq _020E9154
_020E9134:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r6, r0
	ldr r0, [sp, #0x4c]
	cmp r6, r0
	bne _020E90B0
_020E9154:
	strb r6, [sp, #0x50]
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	beq _020E9174
	cmp sl, #0
	beq _020E91AC
	cmp r7, #0
	bne _020E91AC
_020E9174:
	mov r0, r8
	ldrsb r1, [sp, #0x50]
	mov r2, #1
	blx sb
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	cmp fp, #0
	str r0, [sp, #0x30]
	beq _020E9300
	ldr r0, [sp, #0x28]
	mov r1, #0
	strb r1, [r0]
	b _020E9300
_020E91AC:
	add r4, r4, r0
	ldrb r0, [sp, #0x62]
	cmp r0, #0xa
	mov r0, #0
	streqh r0, [r5]
	strneb r0, [r5]
	ldr r0, [sp, #0x44]
	add r0, r0, #1
	str r0, [sp, #0x44]
	b _020E9270
_020E91D4:
	mov r0, #0
	str r0, [sp, #0x5c]
	mvn r5, #0
	b _020E9218
_020E91E4:
	strb r6, [sp, #0x50]
	ldrsb r1, [sp, #0x50]
	and r0, r1, #7
	and r2, r1, #0xff
	add r1, sp, #0x60
	add r1, r1, r2, asr #3
	ldrb r2, [r1, #8]
	mov r1, #1
	tst r2, r1, lsl r0
	beq _020E9248
	ldr r0, [sp, #0x5c]
	add r0, r0, #1
	str r0, [sp, #0x5c]
_020E9218:
	ldr r0, [sp, #0x64]
	cmp r0, #0
	sub r0, r0, #1
	str r0, [sp, #0x64]
	beq _020E9248
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r6, r0
	cmp r6, r5
	bne _020E91E4
_020E9248:
	strb r6, [sp, #0x50]
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	bne _020E926C
	mov r0, r8
	ldrsb r1, [sp, #0x50]
	mov r2, #1
	blx sb
	b _020E9300
_020E926C:
	add r4, r4, r0
_020E9270:
	ldr r0, [sp, #0x64]
	cmp r0, #0
	blt _020E928C
	mov r0, r8
	ldrsb r1, [sp, #0x50]
	mov r2, #1
	blx sb
_020E928C:
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	str r0, [sp, #0x40]
	b _020E9300
_020E929C:
	cmp r5, #0
	beq _020E9300
	ldrb r0, [sp, #0x62]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020E9300
_020E92B4: ; jump table
	b _020E92D4 ; case 0
	b _020E92EC ; case 1
	b _020E92DC ; case 2
	b _020E92E4 ; case 3
	b _020E9300 ; case 4
	b _020E9300 ; case 5
	b _020E9300 ; case 6
	b _020E92F4 ; case 7
_020E92D4:
	str r4, [r5]
	b _020E9300
_020E92DC:
	strh r4, [r5]
	b _020E9300
_020E92E4:
	str r4, [r5]
	b _020E9300
_020E92EC:
	strb r4, [r5]
	b _020E9300
_020E92F4:
	str r4, [r5]
	mov r0, r4, asr #0x1f
	str r0, [r5, #4]
_020E9300:
	ldr r0, [sp, #0xc]
	ldrsb r5, [r0]
	cmp r5, #0
	bne _020E8644
_020E9310:
	mov r0, r8
	mov r1, #0
	mov r2, #2
	blx sb
	cmp r0, #0
	beq _020E933C
	ldr r0, [sp, #0x40]
	cmp r0, #0
	addeq sp, sp, #0x88
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020E933C:
	ldr r0, [sp, #0x44]
	add sp, sp, #0x88
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020E9348: .word __msl_digit
_020E934C: .word __float_nan
	arm_func_end __sformatter

	arm_func_start __StringRead
__StringRead: ; 0x020E9350
	cmp r2, #0
	beq _020E936C
	cmp r2, #1
	beq _020E939C
	cmp r2, #2
	beq _020E93C4
	b _020E93CC
_020E936C:
	ldr r1, [r0]
	ldrsb r2, [r1]
	cmp r2, #0
	bne _020E938C
	mov r1, #1
	str r1, [r0, #4]
	sub r0, r1, #2
	bx lr
_020E938C:
	add r1, r1, #1
	str r1, [r0]
	and r0, r2, #0xff
	bx lr
_020E939C:
	ldr r2, [r0, #4]
	cmp r2, #0
	movne r2, #0
	strne r2, [r0, #4]
	bne _020E93BC
	ldr r2, [r0]
	sub r2, r2, #1
	str r2, [r0]
_020E93BC:
	mov r0, r1
	bx lr
_020E93C4:
	ldr r0, [r0, #4]
	bx lr
_020E93CC:
	mov r0, #0
	bx lr
	arm_func_end __StringRead

	arm_func_start vsscanf
vsscanf: ; 0x020E93D4
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	str r0, [sp, #4]
	cmp r0, #0
	ldrnesb r0, [r0]
	mov lr, r1
	mov r3, r2
	cmpne r0, #0
	addeq sp, sp, #0xc
	mvneq r0, #0
	ldmeqia sp!, {pc}
	mov ip, #0
	str ip, [sp, #8]
	ldr r0, _020E9424 ; =__StringRead
	add r1, sp, #4
	mov r2, lr
	str ip, [sp]
	bl __sformatter
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_020E9424: .word __StringRead
	arm_func_end vsscanf

	arm_func_start sscanf
sscanf: ; 0x020E9428
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsscanf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sscanf

	exception __sformatter, 0x0D54, __sformatter_exception
	exception vsscanf, 0x0055, 0x00200000
	exception sscanf, 0x0029, 0x00300020

	.section .exception,4,1,2

__sformatter_exception: ; 0x020F4F8C
	.byte 0x00, 0xFF, 0x01, 0xB0, 0x00, 0x00, 0x00, 0x00
