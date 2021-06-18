
	arm_func_start FUN_01FF8000
FUN_01FF8000: @ 0x01FF8000
	stmdb sp!, {lr}
	mov ip, #0x4000000
	add ip, ip, #0x210
	ldr r1, [ip, #-8]
	cmp r1, #0
	ldmeq sp!, {pc}
	ldm ip, {r1, r2}
	ands r1, r1, r2
	ldmeq sp!, {pc}
	mov r3, #0x80000000
_01FF8028:
	clz r0, r1
	bics r1, r1, r3, lsr r0
	bne _01FF8028
	lsr r1, r3, r0
	str r1, [ip, #4]
	rsbs r0, r0, #0x1f
	ldr r1, _01FF8050 @ =FUN_027E0000
	ldr r0, [r1, r0, lsl #2]
	ldr lr, _01FF8054 @ =FUN_01FF8058
	bx r0
	.align 2, 0
_01FF8050: .4byte FUN_027E0000
_01FF8054: .4byte FUN_01FF8058
	arm_func_end FUN_01FF8000

	arm_func_start FUN_01FF8058
FUN_01FF8058: @ 0x01FF8058
	ldr ip, _01FF81A4 @ =0x027E0060
	mov r3, #0
	ldr ip, [ip]
	mov r2, #1
	cmp ip, #0
	beq _01FF80A8
_01FF8070:
	str r2, [ip, #0x64]
	str r3, [ip, #0x78]
	str r3, [ip, #0x7c]
	ldr r0, [ip, #0x80]
	str r3, [ip, #0x80]
	mov ip, r0
	cmp ip, #0
	bne _01FF8070
	ldr ip, _01FF81A4 @ =0x027E0060
	str r3, [ip]
	str r3, [ip, #4]
	ldr ip, _01FF81A8 @ =0x021E16A0
	mov r1, #1
	strh r1, [ip]
_01FF80A8:
	ldr ip, _01FF81A8 @ =0x021E16A0
	ldrh r1, [ip]
	cmp r1, #0
	popeq {pc}
	mov r1, #0
	strh r1, [ip]
	mov r3, #0xd2
	msr cpsr_c, r3
	add r2, ip, #8
	ldr r1, [r2]
_01FF80D0:
	cmp r1, #0
	ldrhne r0, [r1, #0x64]
	cmpne r0, #1
	ldrne r1, [r1, #0x68]
	bne _01FF80D0
	cmp r1, #0
	bne _01FF80F8
_01FF80EC:
	mov r3, #0x92
	msr cpsr_c, r3
	pop {pc}
_01FF80F8:
	ldr r0, [ip, #4]
	cmp r1, r0
	beq _01FF80EC
	ldr r3, [ip, #0xc]
	cmp r3, #0
	beq _01FF8120
	push {r0, r1, ip}
	mov lr, pc
	bx r3
_01FF811C:
	.byte 0x03, 0x10, 0xBD, 0xE8
_01FF8120:
	str r1, [ip, #4]
	mrs r2, spsr
	str r2, [r0, #0]!
	push {r0, r1}
	add r0, r0, #0
	add r0, r0, #0x48
	ldr r1, _01FF81AC @ =FUN_020D9BF4
	blx r1
	pop {r0, r1}
	ldmib sp!, {r2, r3}
	stmib r0!, {r2, r3}
	ldmib sp!, {r2, r3, ip, lr}
	stmib r0!, {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	stmib r0!, {lr}
	mov r3, #0xd3
	msr cpsr_c, r3
	stmib r0!, {sp}
	stmdb sp!, {r1}
	add r0, r1, #0
	add r0, r0, #0x48
	ldr r1, _01FF81B0 @ =FUN_020D9C34
	blx r1
	ldm sp!, {r1}
	ldr sp, [r1, #0x44]
	mov r3, #0xd2
	msr cpsr_c, r3
	ldr r2, [r1, #0]!
	msr spsr_fc, r2
	ldr lr, [r1, #0x40]
	ldmib r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	mov r0, r0
	stmda sp!, {r0, r1, r2, r3, ip, lr}
	ldm sp!, {pc}
	.align 2, 0
_01FF81A4: .4byte 0x027E0060
_01FF81A8: .4byte 0x021E16A0
_01FF81AC: .4byte FUN_020D9BF4
_01FF81B0: .4byte FUN_020D9C34
_01FF81B4:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x20, 0x00, 0x9F, 0xE5
_01FF81BC:
	ldrh r1, [r0]
	cmp r1, #0
	beq _01FF81BC
	ldr r0, _01FF81E4 @ =0x04000208
	mov r1, #0
	strh r1, [r0]
	bl FUN_01FF82C8
	bl FUN_01FF81E8
	pop {r3, pc}
	.align 2, 0
_01FF81E0: .4byte 0x021E1A04
_01FF81E4: .4byte 0x04000208
	arm_func_end FUN_01FF8058

	arm_func_start FUN_01FF81E8
FUN_01FF81E8: @ 0x01FF81E8
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _01FF8294 @ =FUN_027E0000
	add r1, r1, #0x3fc0
	add r1, r1, #0x3c
	mov r0, #0
	str r0, [r1]
	ldr r1, _01FF8298 @ =0x04000180
_01FF8208:
	ldrh r0, [r1]
	and r0, r0, #0xf
	cmp r0, #1
	bne _01FF8208
	mov r0, #0x100
	strh r0, [r1]
	mov r0, #0
	ldr r3, _01FF829C @ =0x027FFD9C
	ldr r4, [r3]
	ldr r1, _01FF82A0 @ =0x027FFD80
	mov r2, #0x80
	bl FUN_01FF82B4
	str r4, [r3]
	ldr r1, _01FF82A4 @ =0x027FFF80
	mov r2, #0x18
	bl FUN_01FF82B4
	ldr r1, _01FF82A8 @ =0x027FFF98
	strh r0, [r1]
	ldr r1, _01FF82AC @ =0x027FFF9C
	mov r2, #0x64
	bl FUN_01FF82B4
	ldr r1, _01FF8298 @ =0x04000180
_01FF8260:
	ldrh r0, [r1]
	and r0, r0, #0xf
	cmp r0, #1
	beq _01FF8260
	mov r0, #0
	strh r0, [r1]
	ldr r3, _01FF82B0 @ =0x027FFE00
	ldr ip, [r3, #0x24]
	mov lr, ip
	ldr fp, _01FF82A4 @ =0x027FFF80
	ldm fp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl}
	mov fp, #0
	bx ip
	.align 2, 0
_01FF8294: .4byte FUN_027E0000
_01FF8298: .4byte 0x04000180
_01FF829C: .4byte 0x027FFD9C
_01FF82A0: .4byte 0x027FFD80
_01FF82A4: .4byte 0x027FFF80
_01FF82A8: .4byte 0x027FFF98
_01FF82AC: .4byte 0x027FFF9C
_01FF82B0: .4byte 0x027FFE00
	arm_func_end FUN_01FF81E8

	arm_func_start FUN_01FF82B4
FUN_01FF82B4: @ 0x01FF82B4
	add ip, r1, r2
_01FF82B8:
	cmp r1, ip
	stmlt r1!, {r0}
	blt _01FF82B8
	bx lr
	arm_func_end FUN_01FF82B4

	arm_func_start FUN_01FF82C8
FUN_01FF82C8: @ 0x01FF82C8
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _01FF8368 @ =0x027FFC2C
	ldr r5, [r1]
	cmp r5, #0x8000
	blo _01FF82EC
	mov r0, r5
	add r1, r1, #0x1d4
	mov r2, #0x160
	bl FUN_01FF8370
_01FF82EC:
	ldr r0, _01FF836C @ =0x027FFE20
	ldr r6, [r0]
	ldr r7, [r0, #8]
	ldr r8, [r0, #0xc]
	ldr sb, [r0, #0x10]
	ldr fp, [r0, #0x18]
	ldr sl, [r0, #0x1c]
	bl FUN_020D3A38
	mov r4, r0
	bl FUN_020D27FC
	bl FUN_020D27F0
	mov r0, r4
	bl FUN_020D3A4C
	bl FUN_020D28C4
	bl FUN_020D28B8
	add r6, r6, r5
	cmp r6, #0x8000
	bhs _01FF8344
	rsb r0, r6, #0x8000
	add r7, r7, r0
	sub r8, r8, r0
	mov r6, #0x8000
_01FF8344:
	mov r0, r6
	mov r1, r7
	mov r2, r8
	bl FUN_01FF8370
	mov r1, fp
	mov r2, sl
	add r0, sb, r5
	bl FUN_01FF8370
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF8368: .4byte 0x027FFC2C
_01FF836C: .4byte 0x027FFE20
	arm_func_end FUN_01FF82C8

	arm_func_start FUN_01FF8370
FUN_01FF8370: @ 0x01FF8370
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _01FF8434 @ =0x027FFE60
	ldr r3, _01FF8438 @ =0x000001FF
	ldr r5, [r4]
	and r4, r0, r3
	bic r3, r5, #0x7000000
	ldr r5, _01FF843C @ =0x040001A4
	orr r3, r3, #0xa1000000
	rsb ip, r4, #0
_01FF8394:
	ldr r4, [r5]
	tst r4, #0x80000000
	bne _01FF8394
	ldr r7, _01FF8440 @ =0x040001A1
	mov r4, #0x80
	strb r4, [r7]
	cmp ip, r2
	add r0, r0, ip
	popge {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r4, _01FF8444 @ =0x04100010
	lsr sb, r0, #8
	mov r6, #0xb7
	mov r5, #0
_01FF83C8:
	strb r6, [r7, #7]
	lsr lr, r0, #0x18
	strb lr, [r7, #8]
	lsr lr, r0, #0x10
	strb lr, [r7, #9]
	strb sb, [r7, #0xa]
	strb r0, [r7, #0xb]
	strb r5, [r7, #0xc]
	strb r5, [r7, #0xd]
	strb r5, [r7, #0xe]
	str r3, [r7, #3]
_01FF83F4:
	ldr r8, [r7, #3]
	tst r8, #0x800000
	beq _01FF8418
	cmp ip, #0
	ldr lr, [r4]
	blt _01FF8414
	cmp ip, r2
	strlt lr, [r1, ip]
_01FF8414:
	add ip, ip, #4
_01FF8418:
	tst r8, #0x80000000
	bne _01FF83F4
	cmp ip, r2
	add sb, sb, #2
	add r0, r0, #0x200
	blt _01FF83C8
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_01FF8434: .4byte 0x027FFE60
_01FF8438: .4byte 0x000001FF
_01FF843C: .4byte 0x040001A4
_01FF8440: .4byte 0x040001A1
_01FF8444: .4byte 0x04100010
	arm_func_end FUN_01FF8370

	arm_func_start FUN_01FF8448
FUN_01FF8448: @ 0x01FF8448
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl FUN_020D3A38
	mov r1, #0xc
	mul r2, r7, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	str r6, [r2, #0xb0]
	add r1, r1, #0x4000000
	str r5, [r1, #4]
	str r4, [r1, #8]
	bl FUN_020D3A4C
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end FUN_01FF8448

	arm_func_start FUN_01FF8488
FUN_01FF8488: @ 0x01FF8488
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl FUN_020D3A38
	mov r1, #0xc
	mul r2, r7, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	str r6, [r2, #0xb0]
	add r3, r1, #0x4000000
	str r5, [r3, #4]
	ldr r2, _01FF84F0 @ =0x040000B0
	str r4, [r3, #8]
	ldr r1, [r2]
	cmp r7, #0
	ldr r1, [r2]
	bne _01FF84E8
	mov r2, #0
	str r2, [r3]
	ldr r1, _01FF84F4 @ =0x81400001
	str r2, [r3, #4]
	str r1, [r3, #8]
_01FF84E8:
	bl FUN_020D3A4C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_01FF84F0: .4byte 0x040000B0
_01FF84F4: .4byte 0x81400001
	arm_func_end FUN_01FF8488

	arm_func_start FUN_01FF84F8
FUN_01FF84F8: @ 0x01FF84F8
	mov ip, #0xc
	mul ip, r0, ip
	add r0, ip, #0xb0
	add ip, ip, #0x4000000
	str r1, [ip, #0xb0]
	add r0, r0, #0x4000000
	str r2, [r0, #4]
	str r3, [r0, #8]
	bx lr
	arm_func_end FUN_01FF84F8

	arm_func_start FUN_01FF851C
FUN_01FF851C: @ 0x01FF851C
	push {r3, lr}
	mov ip, #0xc
	mul lr, r0, ip
	add ip, lr, #0xb0
	add lr, lr, #0x4000000
	str r1, [lr, #0xb0]
	add ip, ip, #0x4000000
	str r2, [ip, #4]
	ldr r2, _01FF8578 @ =0x040000B0
	str r3, [ip, #8]
	ldr r1, [r2]
	cmp r0, #0
	ldr r0, [r2]
	bne _01FF8568
	mov r1, #0
	str r1, [ip]
	ldr r0, _01FF857C @ =0x81400001
	str r1, [ip, #4]
	str r0, [ip, #8]
_01FF8568:
	ldr r1, _01FF8578 @ =0x040000B0
	ldr r0, [r1]
	ldr r0, [r1]
	pop {r3, pc}
	.align 2, 0
_01FF8578: .4byte 0x040000B0
_01FF857C: .4byte 0x81400001
	arm_func_end FUN_01FF851C

	arm_func_start FUN_01FF8580
FUN_01FF8580: @ 0x01FF8580
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r8, r2
	mov sl, r0
	mov sb, r1
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r3, #0
	bl FUN_020D4394
	add r0, sl, sl, lsl #1
	add r0, r0, #2
	lsl r0, r0, #2
	add r0, r0, #0xb0
	add r6, r0, #0x4000000
_01FF85B0:
	ldr r0, [r6]
	tst r0, #0x80000000
	bne _01FF85B0
	cmp r8, #0
	beq _01FF85FC
	ldr fp, _01FF860C @ =0x04000400
	ldr r4, _01FF8610 @ =0x84400000
	mov r5, #0x1d8
_01FF85D0:
	cmp r8, #0x1d8
	movhi r7, r5
	movls r7, r8
	mov r0, sl
	mov r1, sb
	mov r2, fp
	orr r3, r4, r7, lsr #2
	bl FUN_01FF8448
	subs r8, r8, r7
	add sb, sb, r7
	bne _01FF85D0
_01FF85FC:
	ldr r0, [r6]
	tst r0, #0x80000000
	bne _01FF85FC
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF860C: .4byte 0x04000400
_01FF8610: .4byte 0x84400000
	arm_func_end FUN_01FF8580
	@ 0x01FF8614
