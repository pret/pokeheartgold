
	arm_func_start _start
_start: @ 0x02380000
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _023800CC @ =FUN_023801B0
	mov r0, #0x3800000
	cmp r0, r1
	movpl r1, r0
	ldr r2, _023800D0 @ =0x0380FF00
	mov r0, #0
_02380020:
	cmp r1, r2
	stmlt r1!, {r0}
	blt _02380020
	mov r0, #0x13
	msr cpsr_c, r0
	ldr sp, _023800D4 @ =0x0380FFC0
	mov r0, #0x12
	msr cpsr_c, r0
	ldr r0, _023800D8 @ =0x0380FF80
	mov sp, r0
	ldr r1, _023800DC @ =0x00000400
	sub r1, r0, r1
	mov r0, #0x1f
	msr cpsr_fsxc, r0
	sub sp, r1, #4
	ldr r0, _023800E0 @ =0x023FE940
	ldr r1, _023800E4 @ =0x027FFA80
	add r2, r1, #0x160
_02380068:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, r2
	bmi _02380068
	ldr r0, _023800E8 @ =0x023FE904
	add r2, r1, #0x20
_02380080:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, r2
	bmi _02380080
	bl FUN_02380100
	ldr r0, _023800EC @ =FUN_02380198
	ldr r1, [r0, #0xc]
	ldr r2, [r0, #0x10]
	mov r0, #0
_023800A4:
	cmp r1, r2
	strlo r0, [r1], #4
	blo _023800A4
	bl FUN_0238015C
	ldr r1, _023800F0 @ =0x0380FFFC
	ldr r0, _023800F4 @ =0x037F84E4
	str r0, [r1]
	ldr r1, _023800F8 @ =0x037F8000
	ldr lr, _023800FC @ =0xFFFF0000
	bx r1
	.align 2, 0
_023800CC: .4byte FUN_023801B0
_023800D0: .4byte 0x0380FF00
_023800D4: .4byte 0x0380FFC0
_023800D8: .4byte 0x0380FF80
_023800DC: .4byte 0x00000400
_023800E0: .4byte 0x023FE940
_023800E4: .4byte 0x027FFA80
_023800E8: .4byte 0x023FE904
_023800EC: .4byte FUN_02380198
_023800F0: .4byte 0x0380FFFC
_023800F4: .4byte 0x037F84E4
_023800F8: .4byte 0x037F8000
_023800FC: .4byte 0xFFFF0000
	arm_func_end _start

	arm_func_start FUN_02380100
FUN_02380100: @ 0x02380100
	ldr r0, _02380154 @ =FUN_02380198
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r3, [r0, #8]
_02380110:
	cmp r1, r2
	beq _02380150
	ldr r4, [r1], #4
	ldr r5, [r1], #4
	add r6, r4, r5
_02380124:
	cmp r4, r6
	ldrmi r7, [r3], #4
	strmi r7, [r4], #4
	bmi _02380124
	ldr r5, [r1], #4
	add r6, r4, r5
	mov r7, #0
_02380140:
	cmp r4, r6
	strlo r7, [r4], #4
	blo _02380140
	beq _02380110
_02380150:
	b _02380158
	.align 2, 0
_02380154: .4byte FUN_02380198
	arm_func_end FUN_02380100
_02380158:
	bx lr
	arm_func_end FUN_02380100

	arm_func_start FUN_0238015C
FUN_0238015C: @ 0x0238015C
	mov r0, #1
	mov r1, #0
	ldr r2, _02380194 @ =0x027FFFFA
	sub r3, r2, #0x400000
_0238016C:
	strh r1, [r2]
	ldrh ip, [r3]
	cmp r1, ip
	movne r0, #2
	bne _0238018C
	add r1, r1, #1
	cmp r1, #2
	bne _0238016C
_0238018C:
	strh r0, [r2]
	bx lr
	.align 2, 0
_02380194: .4byte 0x027FFFFA
	arm_func_end FUN_0238015C

	arm_func_start FUN_02380198
FUN_02380198: @ 0x02380198
	eorseq r7, sl, #0xb400000
	eorseq r7, sl, #0xd800000
	eorseq r0, r8, #0x2c
	eorseq r0, r8, #0x2c
	eorseq r0, r8, #0x2c
	andeq r0, r0, r0
	arm_func_end FUN_02380198

	arm_func_start FUN_023801B0
FUN_023801B0: @ 0x023801B0
	push {r4, r5, r6, lr}
	ldr r6, _02380254 @ =FUN_023801B0
	ldr r2, _02380258 @ =0x023A76B4
	ldr r0, _0238025C @ =0x023A76D8
	b _02380244
_023801C4:
	ldm r2, {r1, r4, r5}
	cmp r1, #0x6000000
	add r2, r2, #0xc
	bne _02380240
	ldr r1, _02380260 @ =0x027E00BC
	ldr r0, _02380264 @ =0x03809884
	add r3, r4, r5
	str r1, [r0, #4]
	ldr r2, _02380268 @ =0x027F9EF0
	add r1, r1, r3
	str r3, [r0, #0xc]
	cmp r2, r1
	beq _023801FC
	bl FUN_0339B044
_023801FC:
	ldr r0, _02380264 @ =0x03809884
	mov r1, #0
	ldr r2, [r0, #4]
	b _02380218
_0238020C:
	ldr r0, [r6], #4
	add r1, r1, #1
	str r0, [r2], #4
_02380218:
	cmp r1, r4, lsr #2
	blo _0238020C
	mov r1, #0
	mov r0, r1
	b _02380234
_0238022C:
	str r0, [r2], #4
	add r1, r1, #1
_02380234:
	cmp r1, r5, lsr #2
	blo _0238022C
	b _0238024C
_02380240:
	add r6, r6, r4
_02380244:
	cmp r2, r0
	bne _023801C4
_0238024C:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02380254: .4byte FUN_023801B0
_02380258: .4byte 0x023A76B4
_0238025C: .4byte 0x023A76D8
_02380260: .4byte 0x027E00BC
_02380264: .4byte 0x03809884
_02380268: .4byte 0x027F9EF0
	arm_func_end FUN_023801B0

	arm_func_start FUN_0238026C
FUN_0238026C: @ 0x0238026C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x210
	bl FUN_0136826C
	bl FUN_02381C7C
	bl FUN_023811CC
	add r2, sp, #4
	mov r0, #0x20
	mov r1, #2
	bl FUN_0238C0D8
	ldr r0, [sp, #4]
	add r2, sp, #0x10
	lsl r0, r0, #3
	str r0, [sp, #4]
	mov r1, #0x100
	bl FUN_0238C0D8
	ldr r0, [sp, #4]
	mov r1, #0x100
	add r0, r0, #0x100
	add r2, sp, #0x110
	bl FUN_0238C0D8
	mov r0, #0x1d
	mov r1, #1
	add r2, sp, #0
	mov r6, #0
	bl FUN_0238C0D8
	ldrb r0, [sp]
	cmp r0, #0xff
	moveq r0, r6
	beq _023802EC
	tst r0, #0x50
	movne r0, #1
	moveq r0, r6
_023802EC:
	cmp r0, #0
	beq _023803C0
	bl FUN_023806F4
	mov r8, r0
	mov fp, #1
	and r7, r8, #0x40
	mov sl, #0
	add r5, sp, #0x10
	mov r4, fp
	b _023803B4
_02380314:
	ldr r0, _023806C4 @ =0x0000FFFF
	add sb, r5, sl, lsl #8
	mov r1, sb
	mov r2, #0x70
	bl FUN_023806DC
	mov r2, sb
	ldrh r1, [r2, #0x72]
	cmp r0, r1
	bne _023803A8
	ldrh r0, [r2, #0x70]
	cmp r0, #0x80
	bhs _023803A8
	ldr r0, _023806C4 @ =0x0000FFFF
	mov r2, #0x8a
	add r1, sb, #0x74
	bl FUN_023806DC
	mov r2, sb
	ldrh r1, [r2, #0xfe]
	cmp r0, r1
	bne _023803A8
	ldrh r1, [r2, #0x76]
	ldrb r0, [r2, #0x75]
	tst r1, r4, lsl r0
	beq _023803A8
	tst r8, r1
	ldrhne r1, [sb, #0x64]
	andne r0, r0, #7
	bicne r1, r1, #7
	orrne r0, r1, r0
	strhne r0, [sb, #0x64]
	add r0, r5, sl, lsl #8
	ldrh r0, [r0, #0x76]
	mvn r0, r0
	tst r7, r0
	movne r6, #3
	bne _02380460
	orr r6, r6, fp, lsl sl
_023803A8:
	add r0, sl, #1
	lsl r0, r0, #0x10
	lsr sl, r0, #0x10
_023803B4:
	cmp sl, #2
	blo _02380314
	b _02380424
_023803C0:
	bl FUN_023806F4
	tst r0, #0x40
	movne r6, #3
	bne _02380460
	ldr r8, _023806C4 @ =0x0000FFFF
	mov sb, #0
	add r7, sp, #0x10
	mov r4, #1
	mov r5, #0x70
_023803E4:
	mov r0, r8
	mov r2, r5
	add r1, r7, sb, lsl #8
	bl FUN_023806DC
	add r2, r7, sb, lsl #8
	ldrh r1, [r2, #0x72]
	cmp r0, r1
	bne _02380410
	ldrh r0, [r2, #0x70]
	cmp r0, #0x80
	orrlo r6, r6, r4, lsl sb
_02380410:
	add r0, sb, #1
	lsl r0, r0, #0x10
	lsr sb, r0, #0x10
	cmp sb, #2
	blo _023803E4
_02380424:
	cmp r6, #1
	cmpne r6, #2
	beq _02380460
	cmp r6, #3
	bne _0238045C
	ldrh r1, [sp, #0x80]
	add r0, sp, #0x100
	add r1, r1, #1
	ldrh r0, [r0, #0x80]
	and r1, r1, #0x7f
	cmp r1, r0
	moveq r6, #2
	movne r6, #1
	b _02380460
_0238045C:
	mov r6, #0
_02380460:
	cmp r6, #3
	blt _0238047C
	ldr r1, _023806C8 @ =0x027FFC80
	mvn r0, #0
	mov r2, #0x74
	bl FUN_02383238
	b _02380538
_0238047C:
	cmp r6, #0
	beq _02380528
	ldr r0, _023806CC @ =0xFFFFFF2A
	lsl r1, r6, #8
	add r0, sp
	ldrb r0, [r0, r6, lsl #8]
	cmp r0, #0xa
	bhs _023804C8
	add r0, sp, #0x10
	mov r3, #0xa
	mov r2, #0
	add r1, r0, r1
	b _023804BC
_023804B0:
	add r0, r1, r3, lsl #1
	strh r2, [r0, #-0xfc]
	sub r3, r3, #1
_023804BC:
	ldrb r0, [r1, #-0xe6]
	cmp r3, r0
	bgt _023804B0
_023804C8:
	ldr r0, _023806D0 @ =0xFFFFFF60
	lsl r1, r6, #8
	add r0, sp
	ldrb r0, [r0, r6, lsl #8]
	cmp r0, #0x1a
	bhs _0238050C
	add r0, sp, #0x10
	mov r3, #0x1a
	mov r2, #0
	add r1, r0, r1
	b _02380500
_023804F4:
	add r0, r1, r3, lsl #1
	strh r2, [r0, #-0xe6]
	sub r3, r3, #1
_02380500:
	ldrb r0, [r1, #-0xb0]
	cmp r3, r0
	bgt _023804F4
_0238050C:
	ldr r1, _023806C8 @ =0x027FFC80
	add r2, sp, #0x10
	sub r0, r6, #1
	add r0, r2, r0, lsl #8
	mov r2, #0x74
	bl FUN_0238324C
	b _02380538
_02380528:
	ldr r1, _023806C8 @ =0x027FFC80
	mov r0, #0
	mov r2, #0x74
	bl FUN_02383238
_02380538:
	add r2, sp, #8
	mov r0, #0x36
	mov r1, #6
	bl FUN_0238C0D8
	ldr r4, _023806C8 @ =0x027FFC80
	add r0, sp, #8
	add r1, r4, #0x74
	mov r2, #6
	bl FUN_0238337C
	add r2, sp, #2
	mov r0, #0x3c
	mov r1, #2
	bl FUN_0238C0D8
	ldrh r0, [sp, #2]
	lsl r0, r0, #0xf
	lsr r0, r0, #0x10
	bl FUN_0238EBD4
	strh r0, [r4, #0x7a]
	bl FUN_023834B4
	mov r0, #8
	bl FUN_02381D24
	mov r4, r0
	mov r0, #8
	bl FUN_02381D38
	mov r1, r0
	mov r2, r4
	mov r0, #8
	mov r3, #1
	bl FUN_023820B4
	mov r4, r0
	mov r0, #8
	bl FUN_02381D24
	sub r2, r0, r4
	mov r0, r4
	mov r1, #0
	bl FUN_023832E8
	mov r1, r4
	mov r0, #8
	bl FUN_02381E20
	mov r0, #8
	bl FUN_02381D24
	mov r4, r0
	mov r0, #8
	bl FUN_02381D38
	mov r1, r0
	mov r2, r4
	mov r0, #8
	bl FUN_0238215C
	movs r4, r0
	bpl _02380604
	bl FUN_02383100
_02380604:
	mov r1, r4
	mov r0, #8
	bl FUN_02382080
	mov r1, r4
	mov r0, #8
	bl FUN_023821FC
	cmp r0, #0x2100
	bhs _02380628
	bl FUN_02383100
_02380628:
	mov r0, #6
	bl FUN_023840F8
	bl FUN_023837C0
	ldr r1, _023806D4 @ =0x037F84C0
	mov r0, #1
	bl FUN_02380A4C
	mov r0, #1
	bl FUN_02380B80
	ldr r3, _023806D8 @ =0x04000004
	mov r0, #1
	ldrh r1, [r3]
	ldrh r1, [r3]
	add r2, r3, #0x204
	orr r1, r1, #8
	strh r1, [r3]
	ldrh r1, [r2]
	strh r0, [r2]
	bl FUN_02382F7C
	mvn r0, #0
	bl FUN_0238781C
	mov r0, #0xf
	bl FUN_023878E4
	mov r0, #0xc
	bl FUN_0238C7E4
	mov r0, r4
	bl FUN_0238DC54
	mov r0, #2
	bl FUN_02388B8C
	mov r4, #0
_0238069C:
	bl FUN_023806E8
	bl FUN_02383044
	cmp r0, #0
	beq _023806B8
	mov r0, r4
	bl FUN_0238B71C
	bl FUN_02383088
_023806B8:
	bl FUN_0238B954
	bl FUN_02388A18
	b _0238069C
	.align 2, 0
_023806C4: .4byte 0x0000FFFF
_023806C8: .4byte 0x027FFC80
_023806CC: .4byte 0xFFFFFF2A
_023806D0: .4byte 0xFFFFFF60
_023806D4: .4byte 0x037F84C0
_023806D8: .4byte 0x04000004
	arm_func_end FUN_0238026C

	arm_func_start FUN_023806DC
FUN_023806DC: @ 0x023806DC
	ldr ip, _023806E4 @ =FUN_038008F4
	bx ip
	.align 2, 0
_023806E4: .4byte FUN_038008F4
	arm_func_end FUN_023806DC

	arm_func_start FUN_023806E8
FUN_023806E8: @ 0x023806E8
	ldr ip, _023806F0 @ =FUN_038008C2
	bx ip
	.align 2, 0
_023806F0: .4byte FUN_038008C2
	arm_func_end FUN_023806E8

	arm_func_start FUN_023806F4
FUN_023806F4: @ 0x023806F4
	ldr r1, _02380728 @ =0x027FFE1D
	mov r0, #0
	ldrb r1, [r1]
	cmp r1, #0x80
	orreq r0, r0, #0x40
	lsleq r0, r0, #0x10
	lsreq r0, r0, #0x10
	bxeq lr
	cmp r1, #0x40
	orreq r0, r0, #0x80
	lsleq r0, r0, #0x10
	lsreq r0, r0, #0x10
	bx lr
	.align 2, 0
_02380728: .4byte 0x027FFE1D
	arm_func_end FUN_023806F4

	arm_func_start FUN_0238072C
FUN_0238072C: @ 0x0238072C
	push {r3, lr}
	ldr r0, _0238074C @ =0x038093B0
	ldr r0, [r0]
	cmp r0, #0
	beq _02380744
	bl FUN_0238A408
_02380744:
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238074C: .4byte 0x038093B0
	arm_func_end FUN_0238072C

	arm_func_start FUN_02380750
FUN_02380750: @ 0x02380750
	stmdb sp!, {lr}
	mov ip, #0x4000000
	add ip, ip, #0x210
	ldr r1, [ip, #-8]
	cmp r1, #0
	ldmeq sp!, {pc}
	ldm ip, {r1, r2}
	ands r1, r1, r2
	ldmeq sp!, {pc}
	mov r3, #1
	mov r0, #0
_0238077C:
	ands r2, r1, r3, lsl r0
	addeq r0, r0, #1
	beq _0238077C
	str r2, [ip, #4]
	ldr r1, _0238079C @ =0x03806A88
	ldr r0, [r1, r0, lsl #2]
	ldr lr, _023807A0 @ =0x037F8538
	bx r0
	.align 2, 0
_0238079C: .4byte 0x03806A88
_023807A0: .4byte 0x037F8538
	arm_func_end FUN_02380750

	arm_func_start FUN_023807A4
FUN_023807A4: @ 0x023807A4
	ldr ip, _023808C0 @ =0x03806BA4
	mov r3, #0
	ldr ip, [ip]
	mov r2, #1
	cmp ip, #0
	beq _023807F4
_023807BC:
	str r2, [ip, #0x48]
	str r3, [ip, #0x5c]
	str r3, [ip, #0x60]
	ldr r0, [ip, #0x64]
	str r3, [ip, #0x64]
	mov ip, r0
	cmp ip, #0
	bne _023807BC
	ldr ip, _023808C0 @ =0x03806BA4
	str r3, [ip]
	str r3, [ip, #4]
	ldr ip, _023808C4 @ =0x03806C40
	mov r1, #1
	strh r1, [ip]
_023807F4:
	ldr ip, _023808C4 @ =0x03806C40
	ldrh r1, [ip]
	cmp r1, #0
	popeq {pc}
	mov r1, #0
	strh r1, [ip]
	mov r3, #0xd2
	msr cpsr_c, r3
	add r2, ip, #8
	ldr r1, [r2]
_0238081C:
	cmp r1, #0
	ldrhne r0, [r1, #0x48]
	cmpne r0, #1
	ldrne r1, [r1, #0x4c]
	bne _0238081C
	cmp r1, #0
	bne _02380844
_02380838:
	mov r3, #0x92
	msr cpsr_c, r3
	pop {pc}
_02380844:
	ldr r0, [ip, #4]
	cmp r1, r0
	beq _02380838
	ldr r3, [ip, #0xc]
	cmp r3, #0
	beq _0238086C
	push {r0, r1, ip}
	mov lr, pc
	bx r3
	arm_func_end FUN_023807A4

	arm_func_start FUN_02380868
FUN_02380868: @ 0x02380868
	pop {r0, r1, ip}
_0238086C:
	str r1, [ip, #4]
	mrs r2, spsr
	str r2, [r0, #0]!
	ldmib sp!, {r2, r3}
	stmib r0!, {r2, r3}
	ldmib sp!, {r2, r3, ip, lr}
	stmib r0!, {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	stmib r0!, {lr}
	mov r3, #0xd3
	msr cpsr_c, r3
	stmib r0!, {sp}
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
_023808C0: .4byte 0x03806BA4
_023808C4: .4byte 0x03806C40
	arm_func_end FUN_02380868

	arm_func_start FUN_023808C8
FUN_023808C8: @ 0x023808C8
	bx lr
	arm_func_end FUN_023808C8

	arm_func_start FUN_023808CC
FUN_023808CC: @ 0x023808CC
	push {r3, r4, r5, lr}
	mov r1, #0xc
	mul r5, r0, r1
	ldr r2, _02380944 @ =0x03806BAC
	ldr r3, _02380948 @ =0x03806A74
	lsl r4, r0, #1
	ldr r1, [r2, r5]
	mov r0, #0
	ldrh r3, [r3, r4]
	mov r4, #1
	str r0, [r2, r5]
	cmp r1, #0
	lsl r4, r4, r3
	beq _02380914
	ldr r0, _0238094C @ =0x03806BB4
	ldr r0, [r0, r5]
	mov lr, pc
	bx r1
_02380914:
	ldr r2, _02380950 @ =0x0380FFF8
	ldr r0, _02380954 @ =0x03806BB0
	ldr r1, [r2]
	orr r1, r1, r4
	str r1, [r2]
	ldr r0, [r0, r5]
	cmp r0, #0
	bne _0238093C
	mov r0, r4
	bl FUN_02380BB8
_0238093C:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02380944: .4byte 0x03806BAC
_02380948: .4byte 0x03806A74
_0238094C: .4byte 0x03806BB4
_02380950: .4byte 0x0380FFF8
_02380954: .4byte 0x03806BB0
	arm_func_end FUN_023808CC

	arm_func_start FUN_02380958
FUN_02380958: @ 0x02380958
	ldr ip, _02380964 @ =0x037F8660
	mov r0, #0
	bx ip
	.align 2, 0
_02380964: .4byte 0x037F8660
	arm_func_end FUN_02380958

	arm_func_start FUN_02380968
FUN_02380968: @ 0x02380968
	ldr ip, _02380974 @ =0x037F8660
	mov r0, #1
	bx ip
	.align 2, 0
_02380974: .4byte 0x037F8660
	arm_func_end FUN_02380968

	arm_func_start FUN_02380978
FUN_02380978: @ 0x02380978
	ldr ip, _02380984 @ =0x037F8660
	mov r0, #2
	bx ip
	.align 2, 0
_02380984: .4byte 0x037F8660
	arm_func_end FUN_02380978

	arm_func_start FUN_02380988
FUN_02380988: @ 0x02380988
	ldr ip, _02380994 @ =0x037F8660
	mov r0, #3
	bx ip
	.align 2, 0
_02380994: .4byte 0x037F8660
	arm_func_end FUN_02380988

	arm_func_start FUN_02380998
FUN_02380998: @ 0x02380998
	ldr ip, _023809A4 @ =0x037F8660
	mov r0, #4
	bx ip
	.align 2, 0
_023809A4: .4byte 0x037F8660
	arm_func_end FUN_02380998

	arm_func_start FUN_023809A8
FUN_023809A8: @ 0x023809A8
	ldr ip, _023809B4 @ =0x037F8660
	mov r0, #5
	bx ip
	.align 2, 0
_023809B4: .4byte 0x037F8660
	arm_func_end FUN_023809A8

	arm_func_start FUN_023809B8
FUN_023809B8: @ 0x023809B8
	ldr ip, _023809C4 @ =0x037F8660
	mov r0, #6
	bx ip
	.align 2, 0
_023809C4: .4byte 0x037F8660
	arm_func_end FUN_023809B8

	arm_func_start FUN_023809C8
FUN_023809C8: @ 0x023809C8
	ldr ip, _023809D4 @ =0x037F8660
	mov r0, #7
	bx ip
	.align 2, 0
_023809D4: .4byte 0x037F8660
	arm_func_end FUN_023809C8

	arm_func_start FUN_023809D8
FUN_023809D8: @ 0x023809D8
	push {r3, lr}
	ldr r2, _02380A1C @ =0x027FFC3C
	ldr r0, _02380A20 @ =0x03806BAC
	ldr r1, [r2]
	ldr r3, [r0, #0x60]
	add r0, r1, #1
	str r0, [r2]
	cmp r3, #0
	beq _02380A04
	mov lr, pc
	bx r3
_02380A04:
	ldr r1, _02380A24 @ =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #1
	str r0, [r1]
	pop {r3, lr}
	bx lr
	.align 2, 0
_02380A1C: .4byte 0x027FFC3C
_02380A20: .4byte 0x03806BAC
_02380A24: .4byte 0x0380FFF8
	arm_func_end FUN_023809D8

	arm_func_start FUN_02380A28
FUN_02380A28: @ 0x02380A28
	ldr r0, _02380A44 @ =0x03806BA4
	mov r2, #0
	str r2, [r0, #4]
	ldr r1, _02380A48 @ =0x027FFC3C
	str r2, [r0]
	str r2, [r1]
	bx lr
	.align 2, 0
_02380A44: .4byte 0x03806BA4
_02380A48: .4byte 0x027FFC3C
	arm_func_end FUN_02380A28

	arm_func_start FUN_02380A4C
FUN_02380A4C: @ 0x02380A4C
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r4, _02380ADC @ =0x03806A88
	mov sb, #0
	mov r2, #0xc
	ldr r5, _02380AE0 @ =0x03806C0C
	ldr r7, _02380AE4 @ =0x03806BAC
	mov r8, sb
	mov lr, sb
	mov ip, #1
	mov r3, r2
_02380A74:
	tst r0, #1
	beq _02380AC4
	mov sl, r8
	cmp sb, #8
	blt _02380A98
	cmp sb, #0xb
	suble r6, sb, #8
	mlale sl, r6, r3, r7
	ble _02380ABC
_02380A98:
	cmp sb, #3
	blt _02380AB0
	cmp sb, #6
	addle r6, sb, #1
	mlale sl, r6, r2, r7
	ble _02380ABC
_02380AB0:
	cmp sb, #0
	strne r1, [r4, sb, lsl #2]
	moveq sl, r5
_02380ABC:
	cmp sl, #0
	stmne sl, {r1, ip, lr}
_02380AC4:
	add sb, sb, #1
	cmp sb, #0x19
	lsr r0, r0, #1
	blt _02380A74
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_02380ADC: .4byte 0x03806A88
_02380AE0: .4byte 0x03806C0C
_02380AE4: .4byte 0x03806BAC
	arm_func_end FUN_02380A4C

	arm_func_start FUN_02380AE8
FUN_02380AE8: @ 0x02380AE8
	push {r4, lr}
	mov r3, #0xc
	mul r4, r0, r3
	ldr ip, _02380B28 @ =0x03806BDC
	ldr r3, _02380B2C @ =0x03806BE4
	str r1, [ip, r4]
	add r0, r0, #3
	mov r1, #1
	lsl r0, r1, r0
	str r2, [r3, r4]
	bl FUN_02380B80
	ldr r0, _02380B30 @ =0x03806BE0
	mov r1, #1
	str r1, [r0, r4]
	pop {r4, lr}
	bx lr
	.align 2, 0
_02380B28: .4byte 0x03806BDC
_02380B2C: .4byte 0x03806BE4
_02380B30: .4byte 0x03806BE0
	arm_func_end FUN_02380AE8

	arm_func_start FUN_02380B34
FUN_02380B34: @ 0x02380B34
	push {r4, lr}
	mov r4, r0
	bl FUN_02380B68
	ldr r1, _02380B64 @ =0x04000210
	ldr r3, [r1]
	sub r2, r1, #8
	str r4, [r1]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	pop {r4, lr}
	bx lr
	.align 2, 0
_02380B64: .4byte 0x04000210
	arm_func_end FUN_02380B34

	arm_func_start FUN_02380B68
FUN_02380B68: @ 0x02380B68
	ldr r2, _02380B7C @ =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_02380B7C: .4byte 0x04000208
	arm_func_end FUN_02380B68

	arm_func_start FUN_02380B80
FUN_02380B80: @ 0x02380B80
	push {r4, lr}
	mov r4, r0
	bl FUN_02380B68
	ldr ip, _02380BB4 @ =0x04000210
	ldr r3, [ip]
	sub r2, ip, #8
	orr r1, r3, r4
	str r1, [ip]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	pop {r4, lr}
	bx lr
	.align 2, 0
_02380BB4: .4byte 0x04000210
	arm_func_end FUN_02380B80

	arm_func_start FUN_02380BB8
FUN_02380BB8: @ 0x02380BB8
	push {r4, lr}
	mov r4, r0
	bl FUN_02380B68
	ldr ip, _02380BF0 @ =0x04000210
	mvn r1, r4
	ldr r3, [ip]
	sub r2, ip, #8
	and r1, r3, r1
	str r1, [ip]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	pop {r4, lr}
	bx lr
	.align 2, 0
_02380BF0: .4byte 0x04000210
	arm_func_end FUN_02380BB8

	arm_func_start FUN_02380BF4
FUN_02380BF4: @ 0x02380BF4
	push {r4, lr}
	mov r4, r0
	bl FUN_02380B68
	ldr r1, _02380C24 @ =0x04000214
	ldr r3, [r1]
	sub r2, r1, #0xc
	str r4, [r1]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	pop {r4, lr}
	bx lr
	.align 2, 0
_02380C24: .4byte 0x04000214
	arm_func_end FUN_02380BF4

	arm_func_start FUN_02380C28
FUN_02380C28: @ 0x02380C28
	push {r3, r4, r5, lr}
	ldr r0, _02380C90 @ =0x03806C18
	ldr r1, [r0]
	cmp r1, #0
	bne _02380C88
	ldr r4, _02380C94 @ =0x027FFFF0
	mov r2, #1
	mov r1, #0
	str r2, [r0]
	strh r1, [r4, #6]
	mov r5, #0x400
	b _02380C60
_02380C58:
	mov r0, r5
	bl FUN_02380C9C
_02380C60:
	ldrh r0, [r4, #4]
	cmp r0, #0x7f
	bne _02380C58
	ldr r1, _02380C98 @ =0x027FFFB8
	mvn r0, #0
	str r0, [r1]
	lsl r0, r0, #0x10
	str r0, [r1, #4]
	mov r0, #0xbf
	strh r0, [r4, #6]
_02380C88:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02380C90: .4byte 0x03806C18
_02380C94: .4byte 0x027FFFF0
_02380C98: .4byte 0x027FFFB8
	arm_func_end FUN_02380C28

	arm_func_start FUN_02380C9C
FUN_02380C9C: @ 0x02380C9C
	ldr ip, _02380CA4 @ =FUN_038008A8
	bx ip
	.align 2, 0
_02380CA4: .4byte FUN_038008A8
	arm_func_end FUN_02380C9C

	arm_func_start FUN_02380CA8
FUN_02380CA8: @ 0x02380CA8
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	ldrh r1, [r7, #4]
	mov r6, r2
	cmp r0, r1
	mov r5, r3
	mvnne r0, #1
	bne _02380D1C
	cmp r5, #0
	beq _02380CD8
	bl FUN_02382FBC
	b _02380CDC
_02380CD8:
	bl FUN_02382F90
_02380CDC:
	mov r4, r0
	mov r0, #0
	strh r0, [r7, #4]
	cmp r6, #0
	beq _02380CF8
	mov lr, pc
	bx r6
_02380CF8:
	mov r0, #0
	str r0, [r7]
	cmp r5, #0
	mov r0, r4
	beq _02380D14
	bl FUN_02382FD0
	b _02380D18
_02380D14:
	bl FUN_02382FA4
_02380D18:
	mov r0, #0
_02380D1C:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_02380CA8

	arm_func_start FUN_02380D24
FUN_02380D24: @ 0x02380D24
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r6, r3
	mov sb, r0
	mov r8, r1
	mov r7, r2
	beq _02380D44
	bl FUN_02382FBC
	b _02380D48
_02380D44:
	bl FUN_02382F90
_02380D48:
	mov r5, r0
	mov r0, sb
	mov r1, r8
	bl FUN_023834AC
	movs r4, r0
	bne _02380D74
	cmp r7, #0
	beq _02380D70
	mov lr, pc
	bx r7
_02380D70:
	strh sb, [r8, #4]
_02380D74:
	cmp r6, #0
	mov r0, r5
	beq _02380D88
	bl FUN_02382FD0
	b _02380D8C
_02380D88:
	bl FUN_02382FA4
_02380D8C:
	mov r0, r4
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end FUN_02380D24

	arm_func_start FUN_02380D98
FUN_02380D98: @ 0x02380D98
	push {r4, r5, r6, r7, r8, lr}
	ldr r6, _02380DE0 @ =0x027FFFE8
	ldr r5, _02380DE4 @ =0x037F8BC8
	mov r8, r0
	mov r7, #0x400
	mov r4, #1
	b _02380DBC
_02380DB4:
	mov r0, r7
	bl FUN_02380C9C
_02380DBC:
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl FUN_02380D24
	cmp r0, #0
	bgt _02380DB4
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02380DE0: .4byte 0x027FFFE8
_02380DE4: .4byte 0x037F8BC8
	arm_func_end FUN_02380D98

	arm_func_start FUN_02380DE8
FUN_02380DE8: @ 0x02380DE8
	ldr ip, _02380DFC @ =0x037F8A3C
	ldr r1, _02380E00 @ =0x027FFFE8
	ldr r2, _02380E04 @ =0x037F8BCC
	mov r3, #1
	bx ip
	.align 2, 0
_02380DFC: .4byte 0x037F8A3C
_02380E00: .4byte 0x027FFFE8
_02380E04: .4byte 0x037F8BCC
	arm_func_end FUN_02380DE8

	arm_func_start FUN_02380E08
FUN_02380E08: @ 0x02380E08
	ldr r1, _02380E10 @ =FUN_037F8B7C
	bx r1
	.align 2, 0
_02380E10: .4byte FUN_037F8B7C
	arm_func_end FUN_02380E08

	arm_func_start FUN_02380E14
FUN_02380E14: @ 0x02380E14
	ldr ip, _02380E28 @ =0x037F8AB8
	ldr r1, _02380E2C @ =0x027FFFE8
	ldr r2, _02380E30 @ =0x037F8BC8
	mov r3, #1
	bx ip
	.align 2, 0
_02380E28: .4byte 0x037F8AB8
_02380E2C: .4byte 0x027FFFE8
_02380E30: .4byte 0x037F8BC8
	arm_func_end FUN_02380E14

	arm_func_start FUN_02380E34
FUN_02380E34: @ 0x02380E34
	bx lr
	arm_func_end FUN_02380E34

	arm_func_start FUN_02380E38
FUN_02380E38: @ 0x02380E38
	bx lr
	arm_func_end FUN_02380E38

	arm_func_start FUN_02380E3C
FUN_02380E3C: @ 0x02380E3C
	ldr ip, _02380E50 @ =0x037F8A3C
	ldr r1, _02380E54 @ =0x027FFFE0
	ldr r2, _02380E58 @ =0x037F8C14
	mov r3, #0
	bx ip
	.align 2, 0
_02380E50: .4byte 0x037F8A3C
_02380E54: .4byte 0x027FFFE0
_02380E58: .4byte 0x037F8C14
	arm_func_end FUN_02380E3C

	arm_func_start FUN_02380E5C
FUN_02380E5C: @ 0x02380E5C
	ldr ip, _02380E70 @ =0x037F8AB8
	ldr r1, _02380E74 @ =0x027FFFE0
	ldr r2, _02380E78 @ =0x037F8C10
	mov r3, #0
	bx ip
	.align 2, 0
_02380E70: .4byte 0x037F8AB8
_02380E74: .4byte 0x027FFFE0
_02380E78: .4byte 0x037F8C10
	arm_func_end FUN_02380E5C

	arm_func_start FUN_02380E7C
FUN_02380E7C: @ 0x02380E7C
	bx lr
	arm_func_end FUN_02380E7C

	arm_func_start FUN_02380E80
FUN_02380E80: @ 0x02380E80
	bx lr
	arm_func_end FUN_02380E80

	arm_func_start FUN_02380E84
FUN_02380E84: @ 0x02380E84
	ldrh r0, [r0, #4]
	bx lr
	arm_func_end FUN_02380E84

	arm_func_start FUN_02380E8C
FUN_02380E8C: @ 0x02380E8C
	ldr r3, _02380F1C @ =0x027FFFB8
	ldr r1, [r3]
	mov r2, #0
	mov r0, #-0x80000000
_02380E9C:
	tst r1, r0
	bne _02380EB8
	add r2, r2, #1
	cmp r2, #0x20
	beq _02380EB8
	lsr r0, r0, #1
	b _02380E9C
_02380EB8:
	cmp r2, #0x20
	movne r0, #0x80
	bne _02380F00
	add r3, r3, #4
	ldr r1, [r3]
	mov r2, #0
	mov r0, #-0x80000000
_02380ED4:
	tst r1, r0
	bne _02380EF0
	add r2, r2, #1
	cmp r2, #0x20
	beq _02380EF0
	lsr r0, r0, #1
	b _02380ED4
_02380EF0:
	cmp r2, #0x20
	ldr r0, _02380F20 @ =0xFFFFFFFD
	bxeq lr
	mov r0, #0xa0
_02380F00:
	add r0, r0, r2
	mov r1, #-0x80000000
	lsr r1, r1, r2
	ldr r2, [r3]
	bic r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_02380F1C: .4byte 0x027FFFB8
_02380F20: .4byte 0xFFFFFFFD
	arm_func_end FUN_02380E8C

	arm_func_start FUN_02380F24
FUN_02380F24: @ 0x02380F24
	ldr r3, _02380F50 @ =0x027FFFB8
	cmp r0, #0xa0
	addpl r3, r3, #4
	subpl r0, r0, #0xa0
	submi r0, r0, #0x80
	mov r1, #-0x80000000
	lsr r1, r1, r0
	ldr r2, [r3]
	orr r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_02380F50: .4byte 0x027FFFB8
	arm_func_end FUN_02380F24

	arm_func_start FUN_02380F54
FUN_02380F54: @ 0x02380F54
	ldr ip, [r0]
	b _02380F68
_02380F5C:
	cmp ip, r1
	bxeq lr
	ldr ip, [ip, #0x64]
_02380F68:
	cmp ip, #0
	beq _02380F80
	ldr r3, [ip, #0x54]
	ldr r2, [r1, #0x54]
	cmp r3, r2
	bls _02380F5C
_02380F80:
	cmp ip, #0
	bne _02380FAC
	ldr r2, [r0, #4]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x64]
	str r2, [r1, #0x60]
	mov r2, #0
	str r2, [r1, #0x64]
	str r1, [r0, #4]
	bx lr
_02380FAC:
	ldr r2, [ip, #0x60]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x64]
	str r2, [r1, #0x60]
	str ip, [r1, #0x64]
	str r1, [ip, #0x60]
	bx lr
	arm_func_end FUN_02380F54

	arm_func_start FUN_02380FCC
FUN_02380FCC: @ 0x02380FCC
	push {r3, lr}
	ldr lr, [r0]
	mov r2, lr
	b _02381010
_02380FDC:
	ldr r3, [r2, #0x64]
	cmp r2, r1
	bne _0238100C
	ldr ip, [r2, #0x60]
	cmp lr, r2
	streq r3, [r0]
	strne r3, [ip, #0x64]
	ldr r1, [r0, #4]
	cmp r1, r2
	streq ip, [r0, #4]
	strne ip, [r3, #0x60]
	b _02381018
_0238100C:
	mov r2, r3
_02381010:
	cmp r2, #0
	bne _02380FDC
_02381018:
	mov r0, r2
	pop {r3, lr}
	bx lr
	arm_func_end FUN_02380FCC

	arm_func_start FUN_02381024
FUN_02381024: @ 0x02381024
	ldr r2, [r0]
	cmp r2, #0
	beq _0238104C
	ldr r1, [r2, #0x10]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x14]
	moveq r1, #0
	streq r1, [r0, #4]
_0238104C:
	mov r0, r2
	bx lr
	arm_func_end FUN_02381024

	arm_func_start FUN_02381054
FUN_02381054: @ 0x02381054
	push {r3, lr}
	ldr r1, _023810B0 @ =0x03806C1C
	mov ip, #0
	ldr lr, [r1, #0x2c]
	mov r3, lr
	b _02381074
_0238106C:
	mov ip, r3
	ldr r3, [r3, #0x4c]
_02381074:
	cmp r3, #0
	beq _0238108C
	ldr r2, [r3, #0x54]
	ldr r1, [r0, #0x54]
	cmp r2, r1
	blo _0238106C
_0238108C:
	cmp ip, #0
	ldreq r1, _023810B0 @ =0x03806C1C
	streq lr, [r0, #0x4c]
	streq r0, [r1, #0x2c]
	ldrne r1, [ip, #0x4c]
	strne r1, [r0, #0x4c]
	strne r0, [ip, #0x4c]
	pop {r3, lr}
	bx lr
	.align 2, 0
_023810B0: .4byte 0x03806C1C
	arm_func_end FUN_02381054

	arm_func_start FUN_023810B4
FUN_023810B4: @ 0x023810B4
	ldr r1, _023810F4 @ =0x03806C1C
	mov r2, #0
	ldr r1, [r1, #0x2c]
	b _023810CC
_023810C4:
	mov r2, r1
	ldr r1, [r1, #0x4c]
_023810CC:
	cmp r1, #0
	cmpne r1, r0
	bne _023810C4
	cmp r2, #0
	ldreq r1, [r0, #0x4c]
	ldreq r0, _023810F4 @ =0x03806C1C
	streq r1, [r0, #0x2c]
	ldrne r0, [r0, #0x4c]
	strne r0, [r2, #0x4c]
	bx lr
	.align 2, 0
_023810F4: .4byte 0x03806C1C
	arm_func_end FUN_023810B4

	arm_func_start FUN_023810F8
FUN_023810F8: @ 0x023810F8
	push {r4, r5, r6, lr}
	ldr r0, _023811C4 @ =0x03806C1C
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _023811BC
	ldrh r0, [r0, #0x26]
	ldr r4, _023811C8 @ =0x03806C40
	cmp r0, #0
	bne _02381128
	bl FUN_02382FE8
	cmp r0, #0x12
	bne _02381134
_02381128:
	mov r0, #1
	strh r0, [r4]
	b _023811BC
_02381134:
	ldr r0, _023811C4 @ =0x03806C1C
	ldr r0, [r0, #8]
	ldr r6, [r0]
	bl FUN_0238164C
	mov r5, r0
	cmp r6, r5
	cmpne r5, #0
	beq _023811BC
	ldr r0, [r6, #0x48]
	cmp r0, #2
	beq _02381170
	mov r0, r6
	bl FUN_023818DC
	cmp r0, #0
	bne _023811BC
_02381170:
	ldr r0, _023811C4 @ =0x03806C1C
	ldr r2, [r0]
	cmp r2, #0
	beq _02381190
	mov r0, r6
	mov r1, r5
	mov lr, pc
	bx r2
_02381190:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _023811AC
	mov r0, r6
	mov r1, r5
	mov lr, pc
	bx r2
_023811AC:
	ldr r1, _023811C4 @ =0x03806C1C
	mov r0, r5
	str r5, [r1, #0x28]
	bl FUN_02381910
_023811BC:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_023811C4: .4byte 0x03806C1C
_023811C8: .4byte 0x03806C40
	arm_func_end FUN_023810F8

	arm_func_start FUN_023811CC
FUN_023811CC: @ 0x023811CC
	push {r3, lr}
	ldr r0, _02381294 @ =0x03806C1C
	ldr r1, [r0, #0xc]
	cmp r1, #0
	bne _0238128C
	ldr r2, _02381298 @ =0x03806C44
	mov r3, #1
	str r3, [r0, #0xc]
	str r2, [r0, #8]
	ldr r1, _0238129C @ =0x03806CF4
	mov r2, #0x10
	str r2, [r1, #0x54]
	mov r2, #0
	str r2, [r1, #0x50]
	str r3, [r1, #0x48]
	str r2, [r1, #0x4c]
	str r2, [r1, #0x58]
	ldr r2, _023812A0 @ =0x00000400
	str r1, [r0, #0x2c]
	str r1, [r0, #0x28]
	cmp r2, #0
	ldrle r0, _023812A4 @ =0x037F8000
	ldrgt r1, _023812A8 @ =0x00000400
	ldrgt r0, _023812AC @ =0x0380FF80
	subgt r0, r0, r1
	sub ip, r0, r2
	ldr r1, _023812A8 @ =0x00000400
	ldr r0, _023812AC @ =0x0380FF80
	ldr r2, _0238129C @ =0x03806CF4
	sub r3, r0, r1
	str r3, [r2, #0x78]
	str ip, [r2, #0x74]
	mov r0, #0
	ldr r1, _023812B0 @ =0xD73BFDF7
	str r0, [r2, #0x7c]
	str r1, [r3, #-4]
	ldr r3, [r2, #0x74]
	ldr ip, _023812B4 @ =0xFBDD37BB
	ldr r1, _02381294 @ =0x03806C1C
	str ip, [r3]
	str r0, [r2, #0x84]
	str r0, [r2, #0x80]
	strh r0, [r1, #0x24]
	ldr r3, _023812B8 @ =0x03806C40
	ldr r2, _023812BC @ =0x027FFFA4
	strh r0, [r1, #0x26]
	str r3, [r2]
	bl FUN_023817D4
_0238128C:
	pop {r3, lr}
	bx lr
	.align 2, 0
_02381294: .4byte 0x03806C1C
_02381298: .4byte 0x03806C44
_0238129C: .4byte 0x03806CF4
_023812A0: .4byte 0x00000400
_023812A4: .4byte 0x037F8000
_023812A8: .4byte 0x00000400
_023812AC: .4byte 0x0380FF80
_023812B0: .4byte 0xD73BFDF7
_023812B4: .4byte 0xFBDD37BB
_023812B8: .4byte 0x03806C40
_023812BC: .4byte 0x027FFFA4
	arm_func_end FUN_023811CC

	arm_func_start FUN_023812C0
FUN_023812C0: @ 0x023812C0
	push {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r5, r1
	mov r7, r2
	mov r6, r3
	bl FUN_02382F90
	ldr r1, _023813B8 @ =0x03806C1C
	ldr r2, [sp, #0x1c]
	ldr r3, [r1, #0x20]
	mov r4, r0
	add r0, r3, #1
	str r0, [r1, #0x20]
	str r2, [r8, #0x54]
	str r0, [r8, #0x50]
	mov r1, #0
	str r1, [r8, #0x48]
	mov r0, r8
	str r1, [r8, #0x58]
	bl FUN_02381054
	ldr r0, [sp, #0x18]
	mov r1, r5
	str r6, [r8, #0x78]
	sub r5, r6, r0
	sub r2, r6, #4
	str r5, [r8, #0x74]
	mov ip, #0
	str ip, [r8, #0x7c]
	ldr r6, _023813BC @ =0xD73BFDF7
	ldr r0, [r8, #0x78]
	ldr r3, _023813C0 @ =0xFBDD37BB
	str r6, [r0, #-4]
	ldr r0, [r8, #0x74]
	str r3, [r0]
	str ip, [r8, #0x84]
	mov r0, r8
	str ip, [r8, #0x80]
	bl FUN_02381870
	ldr r2, _023813C4 @ =0x037F915C
	str r7, [r8, #4]
	str r2, [r8, #0x3c]
	ldr r2, [sp, #0x18]
	add r1, r5, #4
	mov r0, #0
	sub r2, r2, #8
	bl FUN_02383238
	mov r0, #0
	str r0, [r8, #0x68]
	str r0, [r8, #0x6c]
	str r0, [r8, #0x70]
	str r0, [r8, #0x98]
	str r0, [r8, #0x5c]
	str r0, [r8, #0x64]
	str r0, [r8, #0x60]
	add r1, r8, #0x88
	mov r2, #0xc
	bl FUN_02383238
	mov r1, #0
	mov r0, r4
	str r1, [r8, #0x94]
	bl FUN_02382FA4
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_023813B8: .4byte 0x03806C1C
_023813BC: .4byte 0xD73BFDF7
_023813C0: .4byte 0xFBDD37BB
_023813C4: .4byte 0x037F915C
	arm_func_end FUN_023812C0

	arm_func_start FUN_023813C8
FUN_023813C8: @ 0x023813C8
	push {r3, lr}
	bl FUN_02382F90
	ldr r0, _023813E8 @ =0x03806C1C
	mov r1, #0
	ldr r0, [r0, #0x28]
	bl FUN_023813EC
	pop {r3, lr}
	bx lr
	.align 2, 0
_023813E8: .4byte 0x03806C1C
	arm_func_end FUN_023813C8

	arm_func_start FUN_023813EC
FUN_023813EC: @ 0x023813EC
	push {r3, r4, r5, lr}
	ldr r2, _02381444 @ =0x03806C1C
	mov r5, r0
	ldr r2, [r2, #0x1c]
	mov r4, r1
	cmp r2, #0
	beq _02381434
	ldr r1, _02381448 @ =0x037F91E0
	bl FUN_02381870
	str r4, [r5, #4]
	ldr r1, [r5]
	mov r0, r5
	orr r1, r1, #0x80
	str r1, [r5]
	mov r1, #1
	str r1, [r5, #0x48]
	bl FUN_02381910
	b _0238143C
_02381434:
	mov r0, r4
	bl FUN_0238144C
_0238143C:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02381444: .4byte 0x03806C1C
_02381448: .4byte 0x037F91E0
	arm_func_end FUN_023813EC

	arm_func_start FUN_0238144C
FUN_0238144C: @ 0x0238144C
	push {r3, lr}
	ldr r1, _02381488 @ =0x03806C1C
	ldr r1, [r1, #8]
	ldr r3, [r1]
	ldr r2, [r3, #0x98]
	cmp r2, #0
	beq _0238147C
	mov r1, #0
	str r1, [r3, #0x98]
	mov lr, pc
	bx r2
	arm_func_end FUN_0238144C

	arm_func_start FUN_02381478
FUN_02381478: @ 0x02381478
	bl FUN_02382F90
_0238147C:
	bl FUN_0238148C
	pop {r3, lr}
	bx lr
	.align 2, 0
_02381488: .4byte 0x03806C1C
	arm_func_end FUN_02381478

	arm_func_start FUN_0238148C
FUN_0238148C: @ 0x0238148C
	push {r4, lr}
	ldr r0, _023814F8 @ =0x03806C1C
	ldr r0, [r0, #8]
	ldr r4, [r0]
	bl FUN_02381800
	mov r0, r4
	bl FUN_02381BFC
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	beq _023814BC
	mov r1, r4
	bl FUN_02380FCC
_023814BC:
	mov r0, r4
	bl FUN_023810B4
	mov r1, #2
	add r0, r4, #0x80
	str r1, [r4, #0x48]
	bl FUN_02381598
	bl FUN_02381838
	bl FUN_02382F90
	mov r4, r0
	bl FUN_023810F8
	mov r0, r4
	bl FUN_02382FA4
	bl FUN_02383100
	pop {r4, lr}
	bx lr
	.align 2, 0
_023814F8: .4byte 0x03806C1C
	arm_func_end FUN_0238148C

	arm_func_start FUN_023814FC
FUN_023814FC: @ 0x023814FC
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_02382F90
	ldr r1, [r5, #0x48]
	mov r4, r0
	cmp r1, #2
	beq _02381520
	add r0, r5, #0x80
	bl FUN_02381544
_02381520:
	mov r0, r4
	bl FUN_02382FA4
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_023814FC

	arm_func_start FUN_02381530
FUN_02381530: @ 0x02381530
	ldr r0, [r0, #0x48]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end FUN_02381530

	arm_func_start FUN_02381544
FUN_02381544: @ 0x02381544
	push {r4, r5, r6, lr}
	mov r6, r0
	bl FUN_02382F90
	ldr r1, _02381594 @ =0x03806C1C
	mov r4, r0
	ldr r0, [r1, #8]
	cmp r6, #0
	ldr r5, [r0]
	beq _02381578
	mov r0, r6
	mov r1, r5
	str r6, [r5, #0x5c]
	bl FUN_02380F54
_02381578:
	mov r0, #0
	str r0, [r5, #0x48]
	bl FUN_023810F8
	mov r0, r4
	bl FUN_02382FA4
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02381594: .4byte 0x03806C1C
	arm_func_end FUN_02381544

	arm_func_start FUN_02381598
FUN_02381598: @ 0x02381598
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_02382F90
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	beq _02381610
	mov r2, #0
	mov r3, r2
	mov r1, #1
	mov r0, r2
	b _023815F4
_023815C8:
	beq _023815E4
	ldr ip, [lr, #0x64]
	str ip, [r5]
	cmp ip, #0
	strne r3, [ip, #0x60]
	streq r2, [r5, #4]
	streq r2, [lr, #0x5c]
_023815E4:
	str r1, [lr, #0x48]
	str r0, [lr, #0x5c]
	str r0, [lr, #0x64]
	str r0, [lr, #0x60]
_023815F4:
	ldr lr, [r5]
	cmp lr, #0
	bne _023815C8
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5]
	bl FUN_023810F8
_02381610:
	mov r0, r4
	bl FUN_02382FA4
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_02381598

	arm_func_start FUN_02381620
FUN_02381620: @ 0x02381620
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_02382F90
	mov r1, #1
	mov r4, r0
	str r1, [r5, #0x48]
	bl FUN_023810F8
	mov r0, r4
	bl FUN_02382FA4
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_02381620

	arm_func_start FUN_0238164C
FUN_0238164C: @ 0x0238164C
	ldr r0, _02381670 @ =0x03806C1C
	ldr r0, [r0, #0x2c]
	b _0238165C
_02381658:
	ldr r0, [r0, #0x4c]
_0238165C:
	cmp r0, #0
	ldrne r1, [r0, #0x48]
	cmpne r1, #1
	bne _02381658
	bx lr
	.align 2, 0
_02381670: .4byte 0x03806C1C
	arm_func_end FUN_0238164C

	arm_func_start FUN_02381674
FUN_02381674: @ 0x02381674
	push {r4, r5, r6, r7, r8, lr}
	ldr r2, _02381714 @ =0x03806C1C
	mov r7, r0
	ldr r8, [r2, #0x2c]
	mov r6, r1
	mov r4, #0
	bl FUN_02382F90
	mov r5, r0
	b _023816A0
_02381698:
	mov r4, r8
	ldr r8, [r8, #0x4c]
_023816A0:
	cmp r8, #0
	cmpne r8, r7
	bne _02381698
	cmp r8, #0
	ldrne r0, _02381718 @ =0x03806C50
	cmpne r8, r0
	bne _023816CC
	mov r0, r5
	bl FUN_02382FA4
	mov r0, #0
	b _0238170C
_023816CC:
	ldr r0, [r8, #0x54]
	cmp r0, r6
	beq _02381700
	cmp r4, #0
	ldreq r1, [r7, #0x4c]
	ldreq r0, _02381714 @ =0x03806C1C
	streq r1, [r0, #0x2c]
	ldrne r0, [r7, #0x4c]
	strne r0, [r4, #0x4c]
	mov r0, r7
	str r6, [r7, #0x54]
	bl FUN_02381054
	bl FUN_023810F8
_02381700:
	mov r0, r5
	bl FUN_02382FA4
	mov r0, #1
_0238170C:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02381714: .4byte 0x03806C1C
_02381718: .4byte 0x03806C50
	arm_func_end FUN_02381674

	arm_func_start FUN_0238171C
FUN_0238171C: @ 0x0238171C
	push {r4, r5, lr}
	sub sp, sp, #0x34
	mov r5, r0
	add r0, sp, #8
	bl FUN_02382630
	ldr r0, _023817A8 @ =0x03806C1C
	ldr r0, [r0, #8]
	ldr r0, [r0]
	str r0, [sp, #4]
	bl FUN_02382F90
	ldr r1, _023817AC @ =0x000082EA
	mov r4, r0
	umull r0, ip, r5, r1
	lsr r1, r0, #6
	ldr r3, [sp, #4]
	add r0, sp, #8
	str r0, [r3, #0x94]
	add r2, sp, #4
	str r2, [sp]
	ldr r3, _023817B0 @ =0x037F9548
	lsr r2, ip, #6
	orr r1, r1, ip, lsl #26
	bl FUN_0238276C
	mov r5, #0
	b _02381788
_02381780:
	mov r0, r5
	bl FUN_02381544
_02381788:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _02381780
	mov r0, r4
	bl FUN_02382FA4
	add sp, sp, #0x34
	pop {r4, r5, lr}
	bx lr
	.align 2, 0
_023817A8: .4byte 0x03806C1C
_023817AC: .4byte 0x000082EA
_023817B0: .4byte 0x037F9548
	arm_func_end FUN_0238171C

	arm_func_start FUN_023817B4
FUN_023817B4: @ 0x023817B4
	ldr r2, [r0]
	mov r1, #0
	str r1, [r0]
	ldr ip, _023817D0 @ =0x037F93B4
	mov r0, r2
	str r1, [r2, #0x94]
	bx ip
	.align 2, 0
_023817D0: .4byte 0x037F93B4
	arm_func_end FUN_023817B4

	arm_func_start FUN_023817D4
FUN_023817D4: @ 0x023817D4
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_02382F90
	ldr r1, _023817FC @ =0x03806C1C
	ldr r4, [r1, #0x30]
	str r5, [r1, #0x30]
	bl FUN_02382FA4
	mov r0, r4
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_023817FC: .4byte 0x03806C1C
	arm_func_end FUN_023817D4

	arm_func_start FUN_02381800
FUN_02381800: @ 0x02381800
	push {r4, lr}
	bl FUN_02382F90
	ldr r2, _02381834 @ =0x03806C1C
	mvn r1, #0
	ldr r3, [r2, #4]
	cmp r3, r1
	addlo r1, r3, #1
	strlo r1, [r2, #4]
	movlo r4, r3
	bl FUN_02382FA4
	mov r0, r4
	pop {r4, lr}
	bx lr
	.align 2, 0
_02381834: .4byte 0x03806C1C
	arm_func_end FUN_02381800

	arm_func_start FUN_02381838
FUN_02381838: @ 0x02381838
	push {r4, lr}
	bl FUN_02382F90
	ldr r1, _0238186C @ =0x03806C1C
	mov r4, #0
	ldr r3, [r1, #4]
	cmp r3, #0
	subne r2, r3, #1
	strne r2, [r1, #4]
	movne r4, r3
	bl FUN_02382FA4
	mov r0, r4
	pop {r4, lr}
	bx lr
	.align 2, 0
_0238186C: .4byte 0x03806C1C
	arm_func_end FUN_02381838

	arm_func_start FUN_02381870
FUN_02381870: @ 0x02381870
	add r1, r1, #4
	str r1, [r0, #0x40]
	str r2, [r0, #0x44]
	sub r2, r2, #0x40
	tst r2, #4
	subne r2, r2, #4
	str r2, [r0, #0x38]
	ands r1, r1, #1
	movne r1, #0x3f
	moveq r1, #0x1f
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	bx lr
	arm_func_end FUN_02381870

	arm_func_start FUN_023818DC
FUN_023818DC: @ 0x023818DC
	add r1, r0, #0
	mrs r2, apsr
	str r2, [r1], #4
	mov r0, #0xd3
	msr cpsr_c, r0
	str sp, [r1, #0x40]
	msr cpsr_c, r2
	mov r0, #1
	stm r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr}
	add r0, pc, #0x8 @ =FUN_02381910
	str r0, [r1, #0x3c]
	mov r0, #0
	bx lr
	arm_func_end FUN_023818DC

	arm_func_start FUN_02381910
FUN_02381910: @ 0x02381910
	mrs r1, apsr
	bic r1, r1, #0x1f
	orr r1, r1, #0xd3
	msr cpsr_c, r1
	ldr r1, [r0], #4
	msr spsr_fsxc, r1
	ldr sp, [r0, #0x40]
	ldr lr, [r0, #0x3c]
	ldm r0, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	mov r0, r0
	subs pc, lr, #4
	arm_func_end FUN_02381910

	arm_func_start FUN_0238193C
FUN_0238193C: @ 0x0238193C
	mov r3, #0
	str r3, [r0, #4]
	str r3, [r0]
	str r3, [r0, #0xc]
	str r3, [r0, #8]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r3, [r0, #0x18]
	str r3, [r0, #0x1c]
	bx lr
	arm_func_end FUN_0238193C

	arm_func_start FUN_02381964
FUN_02381964: @ 0x02381964
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r6, r0
	mov r5, r1
	bl FUN_02382F90
	mov r4, r0
	and r7, r7, #1
	b _023819A4
_02381984:
	cmp r7, #0
	bne _0238199C
	mov r0, r4
	bl FUN_02382FA4
	mov r0, #0
	b _023819E8
_0238199C:
	mov r0, r6
	bl FUN_02381544
_023819A4:
	ldr r2, [r6, #0x1c]
	ldr r1, [r6, #0x14]
	cmp r1, r2
	ble _02381984
	ldr r0, [r6, #0x18]
	add r0, r0, r2
	bl FUN_0238E4C8
	ldr r2, [r6, #0x10]
	add r0, r6, #8
	str r5, [r2, r1, lsl #2]
	ldr r1, [r6, #0x1c]
	add r1, r1, #1
	str r1, [r6, #0x1c]
	bl FUN_02381598
	mov r0, r4
	bl FUN_02382FA4
	mov r0, #1
_023819E8:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_02381964

	arm_func_start FUN_023819F0
FUN_023819F0: @ 0x023819F0
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r6, r0
	mov r5, r1
	bl FUN_02382F90
	mov r4, r0
	and r7, r7, #1
	b _02381A30
_02381A10:
	cmp r7, #0
	bne _02381A28
	mov r0, r4
	bl FUN_02382FA4
	mov r0, #0
	b _02381A84
_02381A28:
	add r0, r6, #8
	bl FUN_02381544
_02381A30:
	ldr r0, [r6, #0x1c]
	cmp r0, #0
	beq _02381A10
	cmp r5, #0
	ldrne r1, [r6, #0x10]
	ldrne r0, [r6, #0x18]
	ldrne r0, [r1, r0, lsl #2]
	strne r0, [r5]
	ldr r0, [r6, #0x18]
	ldr r1, [r6, #0x14]
	add r0, r0, #1
	bl FUN_0238E4C8
	str r1, [r6, #0x18]
	ldr r1, [r6, #0x1c]
	mov r0, r6
	sub r1, r1, #1
	str r1, [r6, #0x1c]
	bl FUN_02381598
	mov r0, r4
	bl FUN_02382FA4
	mov r0, #1
_02381A84:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_023819F0

	arm_func_start FUN_02381A8C
FUN_02381A8C: @ 0x02381A8C
	push {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	mov r7, r0
	mov r4, r1
	bl FUN_02382F90
	mov r5, r0
	and r6, r6, #1
	b _02381ACC
_02381AAC:
	cmp r6, #0
	bne _02381AC4
	mov r0, r5
	bl FUN_02382FA4
	mov r0, #0
	b _02381AF8
_02381AC4:
	add r0, r7, #8
	bl FUN_02381544
_02381ACC:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	beq _02381AAC
	cmp r4, #0
	ldrne r1, [r7, #0x10]
	ldrne r0, [r7, #0x18]
	ldrne r0, [r1, r0, lsl #2]
	strne r0, [r4]
	mov r0, r5
	bl FUN_02382FA4
	mov r0, #1
_02381AF8:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_02381A8C

	arm_func_start FUN_02381B00
FUN_02381B00: @ 0x02381B00
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end FUN_02381B00

	arm_func_start FUN_02381B18
FUN_02381B18: @ 0x02381B18
	push {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl FUN_02382F90
	ldr r1, _02381B98 @ =0x03806C40
	mov r4, r0
	ldr r7, [r1, #4]
	mov r6, #0
_02381B34:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _02381B60
	str r7, [r5, #8]
	ldr r1, [r5, #0xc]
	mov r0, r7
	add r2, r1, #1
	mov r1, r5
	str r2, [r5, #0xc]
	bl FUN_02381C34
	b _02381B88
_02381B60:
	cmp r0, r7
	ldreq r0, [r5, #0xc]
	addeq r0, r0, #1
	streq r0, [r5, #0xc]
	beq _02381B88
	str r5, [r7, #0x68]
	mov r0, r5
	bl FUN_02381544
	str r6, [r7, #0x68]
	b _02381B34
_02381B88:
	mov r0, r4
	bl FUN_02382FA4
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02381B98: .4byte 0x03806C40
	arm_func_end FUN_02381B18

	arm_func_start FUN_02381B9C
FUN_02381B9C: @ 0x02381B9C
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_02382F90
	ldr r1, _02381BF8 @ =0x03806C40
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _02381BE8
	ldr r1, [r5, #0xc]
	subs r1, r1, #1
	str r1, [r5, #0xc]
	bne _02381BE8
	mov r1, r5
	bl FUN_02381C58
	mov r1, #0
	mov r0, r5
	str r1, [r5, #8]
	bl FUN_02381598
_02381BE8:
	mov r0, r4
	bl FUN_02382FA4
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02381BF8: .4byte 0x03806C40
	arm_func_end FUN_02381B9C

	arm_func_start FUN_02381BFC
FUN_02381BFC: @ 0x02381BFC
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	b _02381C20
_02381C0C:
	add r0, r5, #0x6c
	bl FUN_02381024
	str r4, [r0, #0xc]
	str r4, [r0, #8]
	bl FUN_02381598
_02381C20:
	ldr r0, [r5, #0x6c]
	cmp r0, #0
	bne _02381C0C
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_02381BFC

	arm_func_start FUN_02381C34
FUN_02381C34: @ 0x02381C34
	ldr r2, [r0, #0x70]
	cmp r2, #0
	streq r1, [r0, #0x6c]
	strne r1, [r2, #0x10]
	str r2, [r1, #0x14]
	mov r2, #0
	str r2, [r1, #0x10]
	str r1, [r0, #0x70]
	bx lr
	arm_func_end FUN_02381C34

	arm_func_start FUN_02381C58
FUN_02381C58: @ 0x02381C58
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r2, #0
	streq r1, [r0, #0x70]
	strne r1, [r2, #0x14]
	cmp r1, #0
	streq r2, [r0, #0x6c]
	strne r2, [r1, #0x10]
	bx lr
	arm_func_end FUN_02381C58

	arm_func_start FUN_02381C7C
FUN_02381C7C: @ 0x02381C7C
	push {r3, lr}
	bl FUN_02381CAC
	bl FUN_023834B4
	bl FUN_02380C28
	bl FUN_02380A28
	bl FUN_023823B8
	bl FUN_023825DC
	bl FUN_023811CC
	bl FUN_0238300C
	bl FUN_0238B494
	pop {r3, lr}
	bx lr
	arm_func_end FUN_02381C7C

	arm_func_start FUN_02381CAC
FUN_02381CAC: @ 0x02381CAC
	push {r3, lr}
	ldr r1, _02381CE4 @ =0x03806D98
	ldr r0, [r1]
	cmp r0, #0
	bne _02381CDC
	mov r0, #1
	str r0, [r1]
	bl FUN_02381CE8
	mov r0, #7
	bl FUN_02381CE8
	mov r0, #8
	bl FUN_02381CE8
_02381CDC:
	pop {r3, lr}
	bx lr
	.align 2, 0
_02381CE4: .4byte 0x03806D98
	arm_func_end FUN_02381CAC

	arm_func_start FUN_02381CE8
FUN_02381CE8: @ 0x02381CE8
	push {r4, lr}
	mov r4, r0
	bl FUN_02381D4C
	lsl r1, r4, #2
	add r1, r1, #0x2700000
	add r1, r1, #0xff000
	str r0, [r1, #0xdc4]
	mov r0, r4
	bl FUN_02381DC8
	lsl r1, r4, #2
	add r1, r1, #0x2700000
	add r1, r1, #0xff000
	str r0, [r1, #0xda0]
	pop {r4, lr}
	bx lr
	arm_func_end FUN_02381CE8

	arm_func_start FUN_02381D24
FUN_02381D24: @ 0x02381D24
	lsl r0, r0, #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xdc4]
	bx lr
	arm_func_end FUN_02381D24

	arm_func_start FUN_02381D38
FUN_02381D38: @ 0x02381D38
	lsl r0, r0, #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xda0]
	bx lr
	arm_func_end FUN_02381D38

	arm_func_start FUN_02381D4C
FUN_02381D4C: @ 0x02381D4C
	cmp r0, #1
	beq _02381D68
	cmp r0, #7
	beq _02381D70
	cmp r0, #8
	beq _02381D78
	b _02381DAC
_02381D68:
	ldr r0, _02381DB4 @ =0x027FF000
	bx lr
_02381D70:
	mov r0, #0x3800000
	bx lr
_02381D78:
	ldr r2, _02381DB8 @ =0x00000400
	ldr r0, _02381DBC @ =0x0380FF80
	ldr r1, _02381DC0 @ =0x0380ADC0
	sub r2, r0, r2
	mov r0, #0x3800000
	cmp r1, #0x3800000
	movhi r0, r1
	ldr r1, _02381DC4 @ =0x00000400
	cmp r1, #0
	bxeq lr
	sublt r0, r0, r1
	subge r0, r2, r1
	bx lr
_02381DAC:
	mov r0, #0
	bx lr
	.align 2, 0
_02381DB4: .4byte 0x027FF000
_02381DB8: .4byte 0x00000400
_02381DBC: .4byte 0x0380FF80
_02381DC0: .4byte 0x0380ADC0
_02381DC4: .4byte 0x00000400
	arm_func_end FUN_02381D4C

	arm_func_start FUN_02381DC8
FUN_02381DC8: @ 0x02381DC8
	cmp r0, #1
	beq _02381DE4
	cmp r0, #7
	beq _02381DEC
	cmp r0, #8
	beq _02381DFC
	b _02381E10
_02381DE4:
	ldr r0, _02381E18 @ =0x027F9EF0
	bx lr
_02381DEC:
	ldr r0, _02381E1C @ =0x0380ADC0
	cmp r0, #0x3800000
	movhi r0, #0x3800000
	bx lr
_02381DFC:
	ldr r1, _02381E1C @ =0x0380ADC0
	mov r0, #0x3800000
	cmp r1, #0x3800000
	movhi r0, r1
	bx lr
_02381E10:
	mov r0, #0
	bx lr
	.align 2, 0
_02381E18: .4byte 0x027F9EF0
_02381E1C: .4byte 0x0380ADC0
	arm_func_end FUN_02381DC8

	arm_func_start FUN_02381E20
FUN_02381E20: @ 0x02381E20
	lsl r0, r0, #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	str r1, [r0, #0xda0]
	bx lr
	arm_func_end FUN_02381E20

	arm_func_start FUN_02381E34
FUN_02381E34: @ 0x02381E34
	ldr r3, [r1, #4]
	cmp r3, #0
	ldrne r2, [r1]
	strne r2, [r3]
	ldr r2, [r1]
	cmp r2, #0
	ldreq r0, [r1, #4]
	ldrne r1, [r1, #4]
	strne r1, [r2, #4]
	bx lr
	arm_func_end FUN_02381E34

	arm_func_start FUN_02381E5C
FUN_02381E5C: @ 0x02381E5C
	push {r3, lr}
	mov lr, r0
	mov ip, #0
	b _02381E7C
_02381E6C:
	cmp r1, lr
	bls _02381E84
	mov ip, lr
	ldr lr, [lr, #4]
_02381E7C:
	cmp lr, #0
	bne _02381E6C
_02381E84:
	stm r1, {ip, lr}
	cmp lr, #0
	beq _02381EC0
	str r1, [lr]
	ldr r3, [r1, #8]
	add r2, r1, r3
	cmp r2, lr
	bne _02381EC0
	ldr r2, [lr, #8]
	add r2, r3, r2
	str r2, [r1, #8]
	ldr lr, [lr, #4]
	str lr, [r1, #4]
	cmp lr, #0
	strne r1, [lr]
_02381EC0:
	cmp ip, #0
	beq _02381EF8
	str r1, [ip, #4]
	ldr r2, [ip, #8]
	add r3, ip, r2
	cmp r3, r1
	bne _02381EFC
	ldr r1, [r1, #8]
	cmp lr, #0
	add r1, r2, r1
	str r1, [ip, #8]
	str lr, [ip, #4]
	strne ip, [lr]
	b _02381EFC
_02381EF8:
	mov r0, r1
_02381EFC:
	pop {r3, lr}
	bx lr
	arm_func_end FUN_02381E5C

	arm_func_start FUN_02381F04
FUN_02381F04: @ 0x02381F04
	push {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, r1
	mov r7, r2
	bl FUN_02382F90
	ldr r1, _02382010 @ =0x03806D9C
	mov r6, r0
	ldr r1, [r1, r4, lsl #2]
	cmp r1, #0
	bne _02381F38
	bl FUN_02382FA4
	mov r0, #0
	b _02382008
_02381F38:
	cmp r5, #0
	ldrlt r5, [r1]
	ldr r1, [r1, #0x10]
	mov r0, #0xc
	mla r4, r5, r0, r1
	ldr r0, [r4, #4]
	add r1, r7, #0x3f
	mov r5, r0
	bic r7, r1, #0x1f
	b _02381F70
_02381F60:
	ldr r1, [r5, #8]
	cmp r7, r1
	ble _02381F78
	ldr r5, [r5, #4]
_02381F70:
	cmp r5, #0
	bne _02381F60
_02381F78:
	cmp r5, #0
	bne _02381F90
	mov r0, r6
	bl FUN_02382FA4
	mov r0, #0
	b _02382008
_02381F90:
	ldr r1, [r5, #8]
	sub r1, r1, r7
	cmp r1, #0x40
	bhs _02381FB0
	mov r1, r5
	bl FUN_02381E34
	str r0, [r4, #4]
	b _02381FE4
_02381FB0:
	str r7, [r5, #8]
	add r2, r5, r7
	str r1, [r2, #8]
	ldr r0, [r5]
	str r0, [r5, r7]
	ldr r0, [r5, #4]
	str r0, [r2, #4]
	cmp r0, #0
	strne r2, [r0]
	ldr r0, [r2]
	cmp r0, #0
	strne r2, [r0, #4]
	streq r2, [r4, #4]
_02381FE4:
	ldr r1, [r4, #8]
	mov r0, #0
	stm r5, {r0, r1}
	cmp r1, #0
	strne r5, [r1]
	mov r0, r6
	str r5, [r4, #8]
	bl FUN_02382FA4
	add r0, r5, #0x20
_02382008:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02382010: .4byte 0x03806D9C
	arm_func_end FUN_02381F04

	arm_func_start FUN_02382014
FUN_02382014: @ 0x02382014
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl FUN_02382F90
	ldr r1, _0238207C @ =0x03806D9C
	mov r4, r0
	ldr r0, [r1, r7, lsl #2]
	cmp r6, #0
	ldrlt r6, [r0]
	ldr r1, [r0, #0x10]
	mov r0, #0xc
	mla r7, r6, r0, r1
	sub r5, r5, #0x20
	ldr r0, [r7, #8]
	mov r1, r5
	bl FUN_02381E34
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	mov r1, r5
	bl FUN_02381E5C
	str r0, [r7, #4]
	mov r0, r4
	bl FUN_02382FA4
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0238207C: .4byte 0x03806D9C
	arm_func_end FUN_02382014

	arm_func_start FUN_02382080
FUN_02382080: @ 0x02382080
	push {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl FUN_02382F90
	ldr r1, _023820B0 @ =0x03806D9C
	ldr r1, [r1, r4, lsl #2]
	ldr r4, [r1]
	str r5, [r1]
	bl FUN_02382FA4
	mov r0, r4
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_023820B0: .4byte 0x03806D9C
	arm_func_end FUN_02382080

	arm_func_start FUN_023820B4
FUN_023820B4: @ 0x023820B4
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r5, r1
	mov r4, r2
	mov r6, r3
	bl FUN_02382F90
	ldr r2, _02382158 @ =0x03806D9C
	mov r1, #0xc
	str r5, [r2, r7, lsl #2]
	add r2, r5, #0x14
	str r2, [r5, #0x10]
	mov r7, #0
	mul r1, r6, r1
	str r6, [r5, #4]
	mvn lr, #0
	mov ip, r7
	mov r2, #0xc
	b _02382118
_023820FC:
	mul r3, r7, r2
	ldr r6, [r5, #0x10]
	add r7, r7, #1
	str lr, [r6, r3]
	add r3, r6, r3
	str ip, [r3, #8]
	str ip, [r3, #4]
_02382118:
	ldr r3, [r5, #4]
	cmp r7, r3
	blt _023820FC
	mvn r2, #0
	str r2, [r5]
	ldr r3, [r5, #0x10]
	bic r2, r4, #0x1f
	add r1, r3, r1
	add r1, r1, #0x1f
	bic r1, r1, #0x1f
	str r1, [r5, #8]
	str r2, [r5, #0xc]
	bl FUN_02382FA4
	ldr r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02382158: .4byte 0x03806D9C
	arm_func_end FUN_023820B4

	arm_func_start FUN_0238215C
FUN_0238215C: @ 0x0238215C
	push {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r6, r1
	mov r5, r2
	bl FUN_02382F90
	ldr r2, _023821F8 @ =0x03806D9C
	add r1, r6, #0x1f
	ldr lr, [r2, r4, lsl #2]
	bic r6, r1, #0x1f
	ldr r7, [lr, #4]
	bic r5, r5, #0x1f
	mov r4, #0
	mov r1, #0xc
	b _023821E0
_02382194:
	mul r3, r4, r1
	ldr ip, [lr, #0x10]
	ldr r2, [ip, r3]
	add r3, ip, r3
	cmp r2, #0
	bge _023821DC
	sub r1, r5, r6
	str r1, [r3]
	mov r2, #0
	str r2, [r6]
	str r2, [r6, #4]
	ldr r1, [r3]
	str r1, [r6, #8]
	str r6, [r3, #4]
	str r2, [r3, #8]
	bl FUN_02382FA4
	mov r0, r4
	b _023821F0
_023821DC:
	add r4, r4, #1
_023821E0:
	cmp r4, r7
	blt _02382194
	bl FUN_02382FA4
	mvn r0, #0
_023821F0:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_023821F8: .4byte 0x03806D9C
	arm_func_end FUN_0238215C

	arm_func_start FUN_023821FC
FUN_023821FC: @ 0x023821FC
	push {r4, r5, r6, r7, r8, lr}
	mov r4, #0
	mov r8, r0
	mov r7, r1
	mov r5, r4
	sub r6, r4, #1
	bl FUN_02382F90
	ldr r1, _02382398 @ =0x03806D9C
	mvn r2, #0
	ldr r1, [r1, r8, lsl #2]
	cmp r7, r2
	ldr ip, [r1, #0x10]
	ldreq r7, [r1]
	cmp ip, #0
	beq _02382388
	cmp r7, #0
	blt _02382388
	ldr r2, [r1, #4]
	cmp r7, r2
	bge _02382388
	mov r2, #0xc
	mul r3, r7, r2
	ldr r2, [ip, r3]
	add r7, ip, r3
	cmp r2, #0
	blt _02382388
	ldr ip, [r7, #8]
	cmp ip, #0
	ldrne r3, [ip]
	cmpne r3, #0
	bne _02382388
	b _023822DC
_0238227C:
	ldr r3, [r1, #8]
	cmp r3, ip
	bhi _02382388
	ldr r3, [r1, #0xc]
	cmp ip, r3
	bhs _02382388
	tst ip, #0x1f
	bne _02382388
	ldr lr, [ip, #4]
	cmp lr, #0
	ldrne r3, [lr]
	cmpne r3, ip
	bne _02382388
	ldr r3, [ip, #8]
	cmp r3, #0x40
	blo _02382388
	tst r3, #0x1f
	bne _02382388
	add r4, r4, r3
	cmp r4, #0
	ble _02382388
	cmp r4, r2
	bgt _02382388
	mov ip, lr
_023822DC:
	cmp ip, #0
	bne _0238227C
	ldr lr, [r7, #4]
	cmp lr, #0
	ldrne r3, [lr]
	cmpne r3, #0
	bne _02382388
	b _02382378
_023822FC:
	ldr r3, [r1, #8]
	cmp r3, lr
	bhi _02382388
	ldr r3, [r1, #0xc]
	cmp lr, r3
	bhs _02382388
	tst lr, #0x1f
	bne _02382388
	ldr r7, [lr, #4]
	cmp r7, #0
	ldrne r3, [r7]
	cmpne r3, lr
	bne _02382388
	ldr ip, [lr, #8]
	cmp ip, #0x40
	blo _02382388
	tst ip, #0x1f
	bne _02382388
	cmp r7, #0
	beq _02382358
	add r3, lr, ip
	cmp r3, r7
	bhs _02382388
_02382358:
	add r4, r4, ip
	sub r3, ip, #0x20
	cmp r4, #0
	add r5, r5, r3
	ble _02382388
	cmp r4, r2
	bgt _02382388
	mov lr, r7
_02382378:
	cmp lr, #0
	bne _023822FC
	cmp r4, r2
	moveq r6, r5
_02382388:
	bl FUN_02382FA4
	mov r0, r6
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02382398: .4byte 0x03806D9C
	arm_func_end FUN_023821FC

	arm_func_start FUN_0238239C
FUN_0238239C: @ 0x0238239C
	ldr r1, _023823B4 @ =0x03806DC0
	mov r2, #1
	ldrh r3, [r1]
	orr r0, r3, r2, lsl r0
	strh r0, [r1]
	bx lr
	.align 2, 0
_023823B4: .4byte 0x03806DC0
	arm_func_end FUN_0238239C

	arm_func_start FUN_023823B8
FUN_023823B8: @ 0x023823B8
	push {r3, lr}
	ldr r1, _02382428 @ =0x03806DC4
	ldrh r0, [r1]
	cmp r0, #0
	bne _02382420
	mov r2, #1
	mov r0, #0
	strh r2, [r1]
	bl FUN_0238239C
	ldr r0, _02382428 @ =0x03806DC4
	mov r2, #0
	str r2, [r0, #8]
	ldr r3, _0238242C @ =0x04000102
	str r2, [r0, #0xc]
	strh r2, [r3]
	ldr r1, _02382430 @ =0x037FA1D8
	strh r2, [r3, #-2]
	mov r2, #0xc1
	mov r0, #8
	strh r2, [r3]
	bl FUN_02380A4C
	mov r0, #8
	bl FUN_02380B80
	ldr r0, _02382428 @ =0x03806DC4
	mov r1, #0
	str r1, [r0, #4]
_02382420:
	pop {r3, lr}
	bx lr
	.align 2, 0
_02382428: .4byte 0x03806DC4
_0238242C: .4byte 0x04000102
_02382430: .4byte 0x037FA1D8
	arm_func_end FUN_023823B8

	arm_func_start FUN_02382434
FUN_02382434: @ 0x02382434
	ldr r0, _02382440 @ =0x03806DC4
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_02382440: .4byte 0x03806DC4
	arm_func_end FUN_02382434

	arm_func_start FUN_02382444
FUN_02382444: @ 0x02382444
	ldr r0, _0238249C @ =0x03806DC4
	mov r3, #0
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	adds r2, r2, #1
	str r2, [r0, #8]
	adc r1, r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _02382488
	ldr r2, _023824A0 @ =0x04000102
	mov r1, #0xc1
	strh r3, [r2]
	strh r3, [r2, #-2]
	strh r1, [r2]
	str r3, [r0, #4]
_02382488:
	ldr ip, _023824A4 @ =0x037F887C
	mov r0, #0
	ldr r1, _023824A8 @ =0x037FA1D8
	mov r2, r0
	bx ip
	.align 2, 0
_0238249C: .4byte 0x03806DC4
_023824A0: .4byte 0x04000102
_023824A4: .4byte 0x037F887C
_023824A8: .4byte 0x037FA1D8
	arm_func_end FUN_02382444

	arm_func_start FUN_023824AC
FUN_023824AC: @ 0x023824AC
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl FUN_02382F90
	ldr lr, _02382544 @ =0x04000100
	ldr r1, _02382548 @ =0x03806DC4
	ldrh r3, [lr]
	ldr r2, _0238254C @ =0x0000FFFF
	strh r3, [sp]
	ldr ip, [r1, #8]
	ldr r3, [r1, #0xc]
	sub r1, r2, #0x10000
	and ip, ip, r1
	and r1, r3, r2
	str ip, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [lr, #0x114]
	tst r1, #8
	beq _02382518
	ldrh r1, [sp]
	tst r1, #0x8000
	bne _02382518
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	adds r2, r2, #1
	adc r1, r1, #0
	str r2, [sp, #4]
	str r1, [sp, #8]
_02382518:
	bl FUN_02382FA4
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	ldrh r0, [sp]
	lsl r1, r1, #0x10
	orr r1, r1, r2, lsr #16
	orr r1, r1, r0, asr #31
	orr r0, r0, r2, lsl #16
	add sp, sp, #0xc
	ldm sp!, {lr}
	bx lr
	.align 2, 0
_02382544: .4byte 0x04000100
_02382548: .4byte 0x03806DC4
_0238254C: .4byte 0x0000FFFF
	arm_func_end FUN_023824AC

	arm_func_start FUN_02382550
FUN_02382550: @ 0x02382550
	push {r3, r4, r5, lr}
	mov r4, r0
	bl FUN_023824AC
	ldr r3, _023825CC @ =0x04000106
	mov r2, #0
	strh r2, [r3]
	ldr ip, [r4, #0xc]
	ldr r3, [r4, #0x10]
	subs r5, ip, r0
	sbc r4, r3, r1
	ldr r1, _023825D0 @ =0x037FA66C
	mov r0, #1
	bl FUN_02380AE8
	subs r0, r5, #0
	mov r3, #0
	sbcs r0, r4, #0
	ldrlt r3, _023825D4 @ =0x0000FFFE
	blt _023825AC
	subs r0, r5, #0x10000
	sbcs r0, r4, r3
	mvnlt r0, r5
	lsllt r0, r0, #0x10
	lsrlt r3, r0, #0x10
_023825AC:
	ldr r2, _023825D8 @ =0x04000104
	mov r1, #0xc1
	strh r3, [r2]
	mov r0, #0x10
	strh r1, [r2, #2]
	bl FUN_02380B80
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_023825CC: .4byte 0x04000106
_023825D0: .4byte 0x037FA66C
_023825D4: .4byte 0x0000FFFE
_023825D8: .4byte 0x04000104
	arm_func_end FUN_02382550

	arm_func_start FUN_023825DC
FUN_023825DC: @ 0x023825DC
	push {r3, lr}
	ldr r1, _0238261C @ =0x03806DD4
	ldrh r0, [r1]
	cmp r0, #0
	bne _02382614
	mov r0, #1
	strh r0, [r1]
	bl FUN_0238239C
	ldr r1, _0238261C @ =0x03806DD4
	mov r2, #0
	str r2, [r1, #4]
	mov r0, #0x10
	str r2, [r1, #8]
	bl FUN_02380BB8
_02382614:
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238261C: .4byte 0x03806DD4
	arm_func_end FUN_023825DC

	arm_func_start FUN_02382620
FUN_02382620: @ 0x02382620
	ldr r0, _0238262C @ =0x03806DD4
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0238262C: .4byte 0x03806DD4
	arm_func_end FUN_02382620

	arm_func_start FUN_02382630
FUN_02382630: @ 0x02382630
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	bx lr
	arm_func_end FUN_02382630

	arm_func_start FUN_02382640
FUN_02382640: @ 0x02382640
	push {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0x20]
	ldr r3, [r8, #0x1c]
	cmp r0, #0
	mov r7, r1
	mov r6, r2
	cmpeq r3, #0
	beq _023826B4
	bl FUN_023824AC
	ldr r6, [r8, #0x28]
	ldr r7, [r8, #0x24]
	cmp r6, r1
	cmpeq r7, r0
	bhs _023826B4
	ldr r5, [r8, #0x1c]
	ldr r4, [r8, #0x20]
	subs r0, r0, r7
	mov r2, r5
	mov r3, r4
	sbc r1, r1, r6
	bl FUN_0238E480
	adds r2, r0, #1
	adc r0, r1, #0
	umull r3, r1, r5, r2
	mla r1, r5, r0, r1
	mla r1, r4, r2, r1
	adds r7, r7, r3
	adc r6, r6, r1
_023826B4:
	str r7, [r8, #0xc]
	ldr r0, _02382768 @ =0x03806DD4
	str r6, [r8, #0x10]
	mov r2, #0
	ldr r5, [r0, #4]
	mov r1, r2
	b _02382724
_023826D0:
	ldr r3, [r5, #0xc]
	ldr r0, [r5, #0x10]
	subs r4, r7, r3
	sbc r3, r6, r0
	subs r0, r4, r1
	sbcs r0, r3, r2
	bge _02382720
	ldr r0, [r5, #0x14]
	str r0, [r8, #0x14]
	str r8, [r5, #0x14]
	str r5, [r8, #0x18]
	ldr r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	bne _02382760
	ldr r1, _02382768 @ =0x03806DD4
	mov r0, r8
	str r8, [r1, #4]
	bl FUN_02382550
	b _02382760
_02382720:
	ldr r5, [r5, #0x18]
_02382724:
	cmp r5, #0
	bne _023826D0
	ldr r1, _02382768 @ =0x03806DD4
	mov r0, #0
	str r0, [r8, #0x18]
	ldr r0, [r1, #8]
	str r8, [r1, #8]
	str r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	bne _02382760
	str r8, [r1, #8]
	mov r0, r8
	str r8, [r1, #4]
	bl FUN_02382550
_02382760:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02382768: .4byte 0x03806DD4
	arm_func_end FUN_02382640

	arm_func_start FUN_0238276C
FUN_0238276C: @ 0x0238276C
	push {r3, r4, r5, r6, r7, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	beq _02382790
	ldr r0, [r6]
	cmp r0, #0
	beq _02382794
_02382790:
	bl FUN_02383100
_02382794:
	bl FUN_02382F90
	mov r1, #0
	str r1, [r6, #0x1c]
	str r1, [r6, #0x20]
	str r7, [r6]
	ldr r1, [sp, #0x18]
	mov r7, r0
	str r1, [r6, #4]
	bl FUN_023824AC
	adds r3, r5, r0
	adc r2, r4, r1
	mov r0, r6
	mov r1, r3
	bl FUN_02382640
	mov r0, r7
	bl FUN_02382FA4
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_0238276C

	arm_func_start FUN_023827DC
FUN_023827DC: @ 0x023827DC
	push {r4, r5, r6, r7, r8, lr}
	ldr r5, [sp, #0x18]
	movs r4, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	beq _02382804
	ldr r0, [r4]
	cmp r0, #0
	beq _02382808
_02382804:
	bl FUN_02383100
_02382808:
	bl FUN_02382F90
	str r6, [r4, #0x1c]
	str r5, [r4, #0x20]
	str r8, [r4, #0x24]
	mov r1, #0
	mov r5, r0
	ldr r0, [sp, #0x1c]
	str r7, [r4, #0x28]
	ldr r3, [sp, #0x20]
	str r0, [r4]
	mov r0, r4
	mov r2, r1
	str r3, [r4, #4]
	bl FUN_02382640
	mov r0, r5
	bl FUN_02382FA4
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end FUN_023827DC

	arm_func_start FUN_02382850
FUN_02382850: @ 0x02382850
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_02382F90
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _02382874
	bl FUN_02382FA4
	b _023828CC
_02382874:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	ldreq r2, [r5, #0x14]
	ldreq r1, _023828D4 @ =0x03806DD4
	streq r2, [r1, #8]
	ldrne r1, [r5, #0x14]
	strne r1, [r0, #0x14]
	ldr r1, [r5, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _023828B4
	ldr r1, _023828D4 @ =0x03806DD4
	cmp r0, #0
	str r0, [r1, #4]
	beq _023828B4
	bl FUN_02382550
_023828B4:
	mov r1, #0
	str r1, [r5]
	str r1, [r5, #0x1c]
	mov r0, r4
	str r1, [r5, #0x20]
	bl FUN_02382FA4
_023828CC:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_023828D4: .4byte 0x03806DD4
	arm_func_end FUN_02382850

	arm_func_start FUN_023828D8
FUN_023828D8: @ 0x023828D8
	push {r0, lr}
	bl FUN_023828E8
	pop {r0, lr}
	bx lr
	arm_func_end FUN_023828D8

	arm_func_start FUN_023828E8
FUN_023828E8: @ 0x023828E8
	push {r3, r4, r5, lr}
	ldr r1, _023829D0 @ =0x04000106
	mov r2, #0
	mov r0, #0x10
	strh r2, [r1]
	bl FUN_02380BB8
	ldr r1, _023829D4 @ =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #0x10
	str r0, [r1]
	bl FUN_023824AC
	ldr r2, _023829D8 @ =0x03806DD4
	ldr r4, [r2, #4]
	cmp r4, #0
	beq _023829C8
	ldr r3, [r4, #0x10]
	ldr ip, [r4, #0xc]
	cmp r1, r3
	cmpeq r0, ip
	bhs _02382944
	mov r0, r4
	bl FUN_02382550
	b _023829C8
_02382944:
	ldr r1, [r4, #0x18]
	mov r0, #0
	str r1, [r2, #4]
	cmp r1, #0
	streq r0, [r2, #8]
	strne r0, [r1, #0x14]
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	ldr r5, [r4]
	mov r0, #0
	cmpeq r1, #0
	streq r0, [r4]
	cmp r5, #0
	beq _0238298C
	ldr r0, [r4, #4]
	mov lr, pc
	bx r5
_0238298C:
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	cmpeq r1, #0
	mov r1, #0
	beq _023829B4
	mov r0, r4
	mov r2, r1
	str r5, [r4]
	bl FUN_02382640
_023829B4:
	ldr r0, _023829D8 @ =0x03806DD4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _023829C8
	bl FUN_02382550
_023829C8:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_023829D0: .4byte 0x04000106
_023829D4: .4byte 0x0380FFF8
_023829D8: .4byte 0x03806DD4
	arm_func_end FUN_023828E8

	arm_func_start FUN_023829DC
FUN_023829DC: @ 0x023829DC
	push {r3, lr}
	ldr r1, _02382A24 @ =0x03806DE0
	ldrh r0, [r1]
	cmp r0, #0
	bne _02382A1C
	mov r0, #1
	strh r0, [r1]
	mov r2, #0
	str r2, [r1, #0xc]
	mov r0, #4
	str r2, [r1, #0x10]
	bl FUN_02380BB8
	ldr r0, _02382A24 @ =0x03806DE0
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_02382A1C:
	pop {r3, lr}
	bx lr
	.align 2, 0
_02382A24: .4byte 0x03806DE0
	arm_func_end FUN_023829DC

	arm_func_start FUN_02382A28
FUN_02382A28: @ 0x02382A28
	ldr r0, _02382A34 @ =0x03806DE0
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_02382A34: .4byte 0x03806DE0
	arm_func_end FUN_02382A28

	arm_func_start FUN_02382A38
FUN_02382A38: @ 0x02382A38
	push {r3, lr}
	ldr r1, _02382AD8 @ =0x03806DE0
	ldr r3, [r1, #0xc]
	b _02382A9C
_02382A48:
	ldr r2, [r0, #0xc]
	ldr r1, [r3, #0xc]
	cmp r1, r2
	blo _02382A98
	bne _02382A6C
	ldrsh r2, [r3, #0x10]
	ldrsh r1, [r0, #0x10]
	cmp r2, r1
	ble _02382A98
_02382A6C:
	ldr r1, [r3, #0x14]
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	str r0, [r3, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _02382AD0
	ldr r1, _02382AD8 @ =0x03806DE0
	str r0, [r1, #0xc]
	bl FUN_02382C48
	b _02382AD0
_02382A98:
	ldr r3, [r3, #0x18]
_02382A9C:
	cmp r3, #0
	bne _02382A48
	ldr r1, _02382AD8 @ =0x03806DE0
	mov r2, #0
	ldr r3, [r1, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r0, [r1, #0x10]
	cmp r3, #0
	strne r0, [r3, #0x18]
	bne _02382AD0
	str r0, [r1, #0xc]
	bl FUN_02382C48
_02382AD0:
	pop {r3, lr}
	bx lr
	.align 2, 0
_02382AD8: .4byte 0x03806DE0
	arm_func_end FUN_02382A38

	arm_func_start FUN_02382ADC
FUN_02382ADC: @ 0x02382ADC
	cmp r0, #0
	bxeq lr
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x14]
	cmp r2, #0
	ldreq r0, _02382B10 @ =0x03806DE0
	strne r1, [r2, #0x14]
	streq r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, _02382B10 @ =0x03806DE0
	strne r2, [r1, #0x18]
	streq r2, [r0, #0xc]
	bx lr
	.align 2, 0
_02382B10: .4byte 0x03806DE0
	arm_func_end FUN_02382ADC

	arm_func_start FUN_02382B14
FUN_02382B14: @ 0x02382B14
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end FUN_02382B14

	arm_func_start FUN_02382B28
FUN_02382B28: @ 0x02382B28
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl FUN_02382F90
	mov r4, r0
	cmp r8, #0
	beq _02382B58
	ldr r0, [r8]
	cmp r0, #0
	beq _02382B5C
_02382B58:
	bl FUN_02383100
_02382B5C:
	ldr r0, _02382BB4 @ =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl FUN_02382F38
	mov r1, #0
	str r1, [r8, #0x1c]
	cmp r7, sb
	strh r7, [r8, #0x10]
	addle r0, r0, #1
	str r0, [r8, #0xc]
	strh r6, [r8, #0x12]
	ldr r0, [sp, #0x20]
	str r5, [r8]
	str r0, [r8, #4]
	mov r1, #0
	mov r0, r8
	str r1, [r8, #0x24]
	bl FUN_02382A38
	mov r0, r4
	bl FUN_02382FA4
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02382BB4: .4byte 0x04000006
	arm_func_end FUN_02382B28

	arm_func_start FUN_02382BB8
FUN_02382BB8: @ 0x02382BB8
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl FUN_02382F90
	mov r4, r0
	cmp r8, #0
	beq _02382BE8
	ldr r0, [r8]
	cmp r0, #0
	beq _02382BEC
_02382BE8:
	bl FUN_02383100
_02382BEC:
	ldr r0, _02382C44 @ =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl FUN_02382F38
	mov r1, #1
	str r1, [r8, #0x1c]
	cmp r7, sb
	strh r7, [r8, #0x10]
	addle r0, r0, #1
	str r0, [r8, #0xc]
	strh r6, [r8, #0x12]
	ldr r0, [sp, #0x20]
	str r5, [r8]
	str r0, [r8, #4]
	mov r1, #0
	mov r0, r8
	str r1, [r8, #0x24]
	bl FUN_02382A38
	mov r0, r4
	bl FUN_02382FA4
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02382C44: .4byte 0x04000006
	arm_func_end FUN_02382BB8

	arm_func_start FUN_02382C48
FUN_02382C48: @ 0x02382C48
	push {r4, lr}
	ldr r1, _02382C9C @ =0x037FAB1C
	mov r4, r0
	mov r0, #4
	bl FUN_02380A4C
	ldrsh r3, [r4, #0x10]
	ldr r2, _02382CA0 @ =0x04000004
	lsl r0, r3, #0x18
	ldrh r1, [r2]
	and r3, r3, #0x100
	and r1, r1, #0x3f
	orr r0, r1, r0, lsr #16
	orr r0, r0, r3, asr #1
	strh r0, [r2]
	ldrh r1, [r2]
	mov r0, #4
	orr r1, r1, #0x20
	strh r1, [r2]
	bl FUN_02380B80
	pop {r4, lr}
	bx lr
	.align 2, 0
_02382C9C: .4byte 0x037FAB1C
_02382CA0: .4byte 0x04000004
	arm_func_end FUN_02382C48

	arm_func_start FUN_02382CA4
FUN_02382CA4: @ 0x02382CA4
	push {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	bne _02382CB8
	bl FUN_02383100
_02382CB8:
	cmp r5, #0
	strne r4, [r5, #8]
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_02382CA4

	arm_func_start FUN_02382CC8
FUN_02382CC8: @ 0x02382CC8
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_02382F90
	mov r1, #1
	str r1, [r5, #0x24]
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _02382CF4
	bl FUN_02382FA4
	b _02382D0C
_02382CF4:
	mov r0, r5
	bl FUN_02382ADC
	mov r1, #0
	mov r0, r4
	str r1, [r5]
	bl FUN_02382FA4
_02382D0C:
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_02382CC8

	arm_func_start FUN_02382D14
FUN_02382D14: @ 0x02382D14
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl FUN_02382F90
	mov r5, r0
	cmp r7, #0
	bne _02382D30
	bl FUN_02383100
_02382D30:
	ldr r0, _02382D84 @ =0x03806DE0
	mov r4, #0
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldrne r6, [r0, #0x18]
	moveq r6, #0
	b _02382D6C
_02382D4C:
	ldr r1, [r0, #8]
	cmp r1, r7
	bne _02382D5C
	bl FUN_02382CC8
_02382D5C:
	mov r0, r6
	cmp r6, #0
	ldrne r6, [r6, #0x18]
	moveq r6, r4
_02382D6C:
	cmp r0, #0
	bne _02382D4C
	mov r0, r5
	bl FUN_02382FA4
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02382D84: .4byte 0x03806DE0
	arm_func_end FUN_02382D14

	arm_func_start FUN_02382D88
FUN_02382D88: @ 0x02382D88
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #4
	bl FUN_02380BB8
	ldr r2, _02382F28 @ =0x04000004
	ldr r1, _02382F2C @ =0x0380FFF8
	ldrh r0, [r2]
	bic r0, r0, #0x20
	strh r0, [r2]
	ldr r0, [r1]
	orr r0, r0, #4
	str r0, [r1]
	ldrh r0, [r2]
	asr r1, r0, #8
	lsl r0, r0, #1
	and r1, r1, #0xff
	and r0, r0, #0x100
	orr r0, r1, r0
	sub r0, r0, #1
	bl FUN_02382F38
	ldr sl, _02382F30 @ =0x04000006
	mov r6, #0
	ldr r5, _02382F34 @ =0x03806DE0
	sub r7, sl, #2
	mov fp, #1
	mov r8, r6
	b _02382F14
_02382DF0:
	ldrh sb, [sl]
	mov r0, sb
	bl FUN_02382F38
	ldrsh r1, [r4, #0x10]
	ldr r2, [r4, #0xc]
	sub r1, sb, r1
	mov sb, r0
	subs r0, sb, r2
	bmi _02382E24
	cmp r0, #0
	bne _02382E2C
	cmp r1, #0
	bge _02382E2C
_02382E24:
	mov r0, r8
	b _02382E48
_02382E2C:
	cmp r1, #0
	addlt r0, r1, #7
	addlt r1, r0, #0x100
	ldrsh r0, [r4, #0x12]
	cmp r1, r0
	movle r0, fp
	movgt r0, #2
_02382E48:
	cmp r0, #0
	beq _02382E64
	cmp r0, #1
	beq _02382EA0
	cmp r0, #2
	beq _02382EF8
	b _02382F14
_02382E64:
	mov r0, r4
	bl FUN_02382C48
	ldrh r1, [sl]
	ldrsh r0, [r4, #0x10]
	cmp r0, r1
	ldreq r0, [r4, #0xc]
	cmpeq r0, sb
	bne _02382F20
	mov r0, #4
	bl FUN_02380BB8
	ldrh r1, [r7]
	mov r0, #4
	bic r1, r1, #0x20
	strh r1, [r7]
	bl FUN_02380BF4
_02382EA0:
	ldr sb, [r4]
	mov r0, r4
	bl FUN_02382ADC
	str r6, [r4]
	cmp sb, #0
	beq _02382EC4
	ldr r0, [r4, #4]
	mov lr, pc
	bx sb
_02382EC4:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02382F14
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _02382F14
	str sb, [r4]
	ldr r1, [r5, #8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r4, #0xc]
	bl FUN_02382A38
	b _02382F14
_02382EF8:
	mov r0, r4
	bl FUN_02382ADC
	ldr r1, [r5, #8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r4, #0xc]
	bl FUN_02382A38
_02382F14:
	ldr r4, [r5, #0xc]
	cmp r4, #0
	bne _02382DF0
_02382F20:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02382F28: .4byte 0x04000004
_02382F2C: .4byte 0x0380FFF8
_02382F30: .4byte 0x04000006
_02382F34: .4byte 0x03806DE0
	arm_func_end FUN_02382D88

	arm_func_start FUN_02382F38
FUN_02382F38: @ 0x02382F38
	push {r4, lr}
	mov r4, r0
	bl FUN_02382F90
	ldr r1, _02382F78 @ =0x03806DE0
	ldr r2, [r1, #4]
	cmp r4, r2
	ldrlt r2, [r1, #8]
	addlt r2, r2, #1
	strlt r2, [r1, #8]
	ldr r1, _02382F78 @ =0x03806DE0
	str r4, [r1, #4]
	bl FUN_02382FA4
	ldr r0, _02382F78 @ =0x03806DE0
	ldr r0, [r0, #8]
	pop {r4, lr}
	bx lr
	.align 2, 0
_02382F78: .4byte 0x03806DE0
	arm_func_end FUN_02382F38

	arm_func_start FUN_02382F7C
FUN_02382F7C: @ 0x02382F7C
	mrs r0, apsr
	bic r1, r0, #0x80
	msr cpsr_c, r1
	and r0, r0, #0x80
	bx lr
	arm_func_end FUN_02382F7C

	arm_func_start FUN_02382F90
FUN_02382F90: @ 0x02382F90
	mrs r0, apsr
	orr r1, r0, #0x80
	msr cpsr_c, r1
	and r0, r0, #0x80
	bx lr
	arm_func_end FUN_02382F90

	arm_func_start FUN_02382FA4
FUN_02382FA4: @ 0x02382FA4
	mrs r1, apsr
	bic r2, r1, #0x80
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #0x80
	bx lr
	arm_func_end FUN_02382FA4

	arm_func_start FUN_02382FBC
FUN_02382FBC: @ 0x02382FBC
	mrs r0, apsr
	orr r1, r0, #0xc0
	msr cpsr_c, r1
	and r0, r0, #0xc0
	bx lr
	arm_func_end FUN_02382FBC

	arm_func_start FUN_02382FD0
FUN_02382FD0: @ 0x02382FD0
	mrs r1, apsr
	bic r2, r1, #0xc0
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #0xc0
	bx lr
	arm_func_end FUN_02382FD0

	arm_func_start FUN_02382FE8
FUN_02382FE8: @ 0x02382FE8
	mrs r0, apsr
	and r0, r0, #0x1f
	bx lr
	arm_func_end FUN_02382FE8

	arm_func_start FUN_02382FF4
FUN_02382FF4: @ 0x02382FF4
	ldr ip, _02383008 @ =FUN_038008A8
	asr r1, r0, #1
	add r0, r0, r1, lsr #30
	asr r0, r0, #2
	bx ip
	.align 2, 0
_02383008: .4byte FUN_038008A8
	arm_func_end FUN_02382FF4

	arm_func_start FUN_0238300C
FUN_0238300C: @ 0x0238300C
	push {r3, lr}
	ldr r2, _0238303C @ =0x03806DF4
	ldrh r0, [r2]
	cmp r0, #0
	bne _02383034
	ldr r1, _02383040 @ =0x037FADE8
	mov r3, #1
	mov r0, #0xc
	strh r3, [r2]
	bl FUN_0238359C
_02383034:
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238303C: .4byte 0x03806DF4
_02383040: .4byte 0x037FADE8
	arm_func_end FUN_0238300C

	arm_func_start FUN_02383044
FUN_02383044: @ 0x02383044
	ldr r0, _02383050 @ =0x03806DF4
	ldrh r0, [r0, #2]
	bx lr
	.align 2, 0
_02383050: .4byte 0x03806DF4
	arm_func_end FUN_02383044

	arm_func_start FUN_02383054
FUN_02383054: @ 0x02383054
	push {r3, lr}
	and r0, r1, #0x7f00
	lsl r0, r0, #8
	lsr r0, r0, #0x10
	cmp r0, #0x10
	ldreq r0, _02383084 @ =0x03806DF4
	moveq r1, #1
	strheq r1, [r0, #2]
	beq _0238307C
	bl FUN_02383100
_0238307C:
	pop {r3, lr}
	bx lr
	.align 2, 0
_02383084: .4byte 0x03806DF4
	arm_func_end FUN_02383054

	arm_func_start FUN_02383088
FUN_02383088: @ 0x02383088
	push {r4, r5, r6, lr}
	mov r0, #0
	bl FUN_02383184
	mov r0, #1
	bl FUN_02383184
	mov r0, #2
	bl FUN_02383184
	mov r0, #3
	bl FUN_02383184
	mov r0, #0x40000
	bl FUN_02380B34
	mvn r0, #0
	bl FUN_02380BF4
	bl FUN_023838B4
	mov r6, #0xc
	mov r5, #0x1000
	mov r4, #0
_023830CC:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	bne _023830CC
	ldr r0, _023830FC @ =0x04000208
	mov r1, #0
	strh r1, [r0]
	bl FUN_0238EAC0
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_023830FC: .4byte 0x04000208
	arm_func_end FUN_02383088

	arm_func_start FUN_02383100
FUN_02383100: @ 0x02383100
	push {r3, lr}
	mov r0, #0
	bl FUN_0238B71C
_0238310C:
	bl FUN_02382F90
	bl FUN_023806E8
	b _0238310C
	arm_func_end FUN_02383100

	arm_func_start FUN_02383118
FUN_02383118: @ 0x02383118
	push {r4, lr}
	mov r4, r0
	bl FUN_02382F90
	add r1, r4, r4, lsl #1
	add r1, r1, #2
	lsl r1, r1, #2
	add r1, r1, #0xb0
	add r2, r1, #0x4000000
_02383138:
	ldr r1, [r2]
	tst r1, #-0x80000000
	bne _02383138
	cmp r4, #0
	bne _02383174
	mov r1, #0xc
	mul r1, r4, r1
	add r2, r1, #0x4000000
	mov r3, #0
	add r1, r1, #0xb0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _02383180 @ =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_02383174:
	bl FUN_02382FA4
	pop {r4, lr}
	bx lr
	.align 2, 0
_02383180: .4byte 0x81400001
	arm_func_end FUN_02383118

	arm_func_start FUN_02383184
FUN_02383184: @ 0x02383184
	push {r4, lr}
	mov r4, r0
	bl FUN_02382F90
	mov r1, #6
	mul r1, r4, r1
	add r1, r1, #5
	lsl r1, r1, #1
	add r1, r1, #0x4000000
	ldrh r2, [r1, #0xb0]
	cmp r4, #0
	bic r2, r2, #0x3200
	strh r2, [r1, #0xb0]
	ldrh r2, [r1, #0xb0]
	bic r2, r2, #0x8000
	strh r2, [r1, #0xb0]
	ldrh r2, [r1, #0xb0]
	ldrh r1, [r1, #0xb0]
	bne _023831F4
	mov r1, #0xc
	mul r1, r4, r1
	add r2, r1, #0x4000000
	mov r3, #0
	add r1, r1, #0xb0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _02383200 @ =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_023831F4:
	bl FUN_02382FA4
	pop {r4, lr}
	bx lr
	.align 2, 0
_02383200: .4byte 0x81400001
	arm_func_end FUN_02383184

	arm_func_start FUN_02383204
FUN_02383204: @ 0x02383204
	mov r3, #0
_02383208:
	cmp r3, r2
	strhlt r0, [r1, r3]
	addlt r3, r3, #2
	blt _02383208
	bx lr
	arm_func_end FUN_02383204

	arm_func_start FUN_0238321C
FUN_0238321C: @ 0x0238321C
	mov ip, #0
_02383220:
	cmp ip, r2
	ldrhlt r3, [r0, ip]
	strhlt r3, [r1, ip]
	addlt ip, ip, #2
	blt _02383220
	bx lr
	arm_func_end FUN_0238321C

	arm_func_start FUN_02383238
FUN_02383238: @ 0x02383238
	add ip, r1, r2
_0238323C:
	cmp r1, ip
	stmlt r1!, {r0}
	blt _0238323C
	bx lr
	arm_func_end FUN_02383238

	arm_func_start FUN_0238324C
FUN_0238324C: @ 0x0238324C
	add ip, r1, r2
_02383250:
	cmp r1, ip
	ldmlt r0!, {r2}
	stmlt r1!, {r2}
	blt _02383250
	bx lr
	arm_func_end FUN_0238324C

	arm_func_start FUN_02383264
FUN_02383264: @ 0x02383264
	push {r4, r5, r6, r7, r8, sb}
	add sb, r1, r2
	lsr ip, r2, #5
	add ip, r1, ip, lsl #5
	mov r2, r0
	mov r3, r2
	mov r4, r2
	mov r5, r2
	mov r6, r2
	mov r7, r2
	mov r8, r2
_02383290:
	cmp r1, ip
	stmlt r1!, {r0, r2, r3, r4, r5, r6, r7, r8}
	blt _02383290
_0238329C:
	cmp r1, sb
	stmlt r1!, {r0}
	blt _0238329C
	pop {r4, r5, r6, r7, r8, sb}
	bx lr
	arm_func_end FUN_02383264

	arm_func_start FUN_023832B0
FUN_023832B0: @ 0x023832B0
	push {r4, r5, r6, r7, r8, sb, sl}
	add sl, r1, r2
	lsr ip, r2, #5
	add ip, r1, ip, lsl #5
_023832C0:
	cmp r1, ip
	ldmlt r0!, {r2, r3, r4, r5, r6, r7, r8, sb}
	stmlt r1!, {r2, r3, r4, r5, r6, r7, r8, sb}
	blt _023832C0
_023832D0:
	cmp r1, sl
	ldmlt r0!, {r2}
	stmlt r1!, {r2}
	blt _023832D0
	pop {r4, r5, r6, r7, r8, sb, sl}
	bx lr
	arm_func_end FUN_023832B0

	arm_func_start FUN_023832E8
FUN_023832E8: @ 0x023832E8
	cmp r2, #0
	bxeq lr
	tst r0, #1
	beq _02383314
	ldrh ip, [r0, #-1]
	and ip, ip, #0xff
	orr r3, ip, r1, lsl #8
	strh r3, [r0, #-1]
	add r0, r0, #1
	subs r2, r2, #1
	bxeq lr
_02383314:
	cmp r2, #2
	blo _0238335C
	orr r1, r1, r1, lsl #8
	tst r0, #2
	beq _02383334
	strh r1, [r0], #2
	subs r2, r2, #2
	bxeq lr
_02383334:
	orr r1, r1, r1, lsl #16
	bics r3, r2, #3
	beq _02383354
	sub r2, r2, r3
	add ip, r3, r0
_02383348:
	str r1, [r0], #4
	cmp r0, ip
	blo _02383348
_02383354:
	tst r2, #2
	strhne r1, [r0], #2
_0238335C:
	tst r2, #1
	bxeq lr
	ldrh r3, [r0]
	and r3, r3, #0xff00
	and r1, r1, #0xff
	orr r1, r1, r3
	strh r1, [r0]
	bx lr
	arm_func_end FUN_023832E8

	arm_func_start FUN_0238337C
FUN_0238337C: @ 0x0238337C
	cmp r2, #0
	bxeq lr
	tst r1, #1
	beq _023833BC
	ldrh ip, [r1, #-1]
	and ip, ip, #0xff
	tst r0, #1
	ldrhne r3, [r0, #-1]
	lsrne r3, r3, #8
	ldrheq r3, [r0]
	orr r3, ip, r3, lsl #8
	strh r3, [r1, #-1]
	add r0, r0, #1
	add r1, r1, #1
	subs r2, r2, #1
	bxeq lr
_023833BC:
	eor ip, r1, r0
	tst ip, #1
	beq _02383410
	bic r0, r0, #1
	ldrh ip, [r0], #2
	lsr r3, ip, #8
	subs r2, r2, #2
	blo _023833F4
_023833DC:
	ldrh ip, [r0], #2
	orr ip, r3, ip, lsl #8
	strh ip, [r1], #2
	lsr r3, ip, #0x10
	subs r2, r2, #2
	bhs _023833DC
_023833F4:
	tst r2, #1
	bxeq lr
	ldrh ip, [r1]
	and ip, ip, #0xff00
	orr ip, ip, r3
	strh ip, [r1]
	bx lr
_02383410:
	tst ip, #2
	beq _0238343C
	bics r3, r2, #1
	beq _02383488
	sub r2, r2, r3
	add ip, r3, r1
_02383428:
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	cmp r1, ip
	blo _02383428
	b _02383488
_0238343C:
	cmp r2, #2
	blo _02383488
	tst r1, #2
	beq _0238345C
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	subs r2, r2, #2
	bxeq lr
_0238345C:
	bics r3, r2, #3
	beq _0238347C
	sub r2, r2, r3
	add ip, r3, r1
_0238346C:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, ip
	blo _0238346C
_0238347C:
	tst r2, #2
	ldrhne r3, [r0], #2
	strhne r3, [r1], #2
_02383488:
	tst r2, #1
	bxeq lr
	ldrh r2, [r1]
	ldrh r0, [r0]
	and r2, r2, #0xff00
	and r0, r0, #0xff
	orr r0, r2, r0
	strh r0, [r1]
	bx lr
	arm_func_end FUN_0238337C

	arm_func_start FUN_023834AC
FUN_023834AC: @ 0x023834AC
	.word 0xE1010090
	bx lr
	arm_func_end FUN_023834AC

	arm_func_start FUN_023834B4
FUN_023834B4: @ 0x023834B4
	ldr ip, _023834BC @ =FUN_037FB254
	bx ip
	.align 2, 0
_023834BC: .4byte FUN_037FB254
	arm_func_end FUN_023834B4

	arm_func_start FUN_023834C0
FUN_023834C0: @ 0x023834C0
	push {r4, r5, r6, r7, r8, lr}
	bl FUN_02382F90
	ldr r1, _02383580 @ =0x03806DF8
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _02383570
	ldr r0, _02383584 @ =0x027FFC00
	mov r2, #1
	strh r2, [r1]
	mov r2, #0
	str r2, [r0, #0x38c]
	ldr r0, _02383588 @ =0x03806DFC
	mov r1, r2
_023834F8:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0x20
	blt _023834F8
	ldr r2, _0238358C @ =0x0000C408
	ldr r1, _02383590 @ =0x04000184
	mov r0, #0x40000
	strh r2, [r1]
	bl FUN_02380BF4
	ldr r1, _02383594 @ =0x037FB43C
	mov r0, #0x40000
	bl FUN_02380A4C
	mov r0, #0x40000
	bl FUN_02380B80
	mov r5, #8
	ldr r8, _02383598 @ =0x04000180
	mov r6, r5
	mov r7, #0x3e8
	b _02383568
_02383544:
	lsl r0, r5, #8
	strh r0, [r8]
	mov r0, r7
	bl FUN_02382FF4
	ldrh r0, [r8]
	and r0, r0, #0xf
	cmp r0, r5
	movne r5, r6
	sub r5, r5, #1
_02383568:
	cmp r5, #0
	bge _02383544
_02383570:
	mov r0, r4
	bl FUN_02382FA4
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02383580: .4byte 0x03806DF8
_02383584: .4byte 0x027FFC00
_02383588: .4byte 0x03806DFC
_0238358C: .4byte 0x0000C408
_02383590: .4byte 0x04000184
_02383594: .4byte 0x037FB43C
_02383598: .4byte 0x04000180
	arm_func_end FUN_023834C0

	arm_func_start FUN_0238359C
FUN_0238359C: @ 0x0238359C
	push {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl FUN_02382F90
	ldr r1, _023835E4 @ =0x03806DFC
	ldr r3, _023835E8 @ =0x027FFC00
	str r5, [r1, r4, lsl #2]
	cmp r5, #0
	ldrne r2, [r3, #0x38c]
	mov r1, #1
	orrne r1, r2, r1, lsl r4
	ldreq r2, [r3, #0x38c]
	mvneq r1, r1, lsl r4
	andeq r1, r2, r1
	str r1, [r3, #0x38c]
	bl FUN_02382FA4
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_023835E4: .4byte 0x03806DFC
_023835E8: .4byte 0x027FFC00
	arm_func_end FUN_0238359C

	arm_func_start FUN_023835EC
FUN_023835EC: @ 0x023835EC
	ldr r2, _0238360C @ =0x027FFC00
	mov r3, #1
	add r1, r2, r1, lsl #2
	ldr r1, [r1, #0x388]
	tst r1, r3, lsl r0
	moveq r3, #0
	mov r0, r3
	bx lr
	.align 2, 0
_0238360C: .4byte 0x027FFC00
	arm_func_end FUN_023835EC

	arm_func_start FUN_02383610
FUN_02383610: @ 0x02383610
	push {r3, lr}
	ldr r3, [sp]
	and r0, r0, #0x1f
	bic r3, r3, #0x1f
	orr r0, r3, r0
	bic r3, r0, #0x20
	lsl r0, r2, #0x1f
	orr r0, r3, r0, lsr #26
	and r0, r0, #0x3f
	orr r0, r0, r1, lsl #6
	str r0, [sp]
	bl FUN_02383648
	pop {r3, lr}
	bx lr
	arm_func_end FUN_02383610

	arm_func_start FUN_02383648
FUN_02383648: @ 0x02383648
	push {r4, lr}
	ldr r2, _023836A4 @ =0x04000184
	mov r4, r0
	ldrh r0, [r2]
	tst r0, #0x4000
	ldrhne r1, [r2]
	mvnne r0, #0
	orrne r1, r1, #0xc000
	strhne r1, [r2]
	bne _0238369C
	bl FUN_02382F90
	ldr r2, _023836A4 @ =0x04000184
	ldrh r1, [r2]
	tst r1, #2
	beq _02383690
	bl FUN_02382FA4
	mvn r0, #1
	b _0238369C
_02383690:
	str r4, [r2, #4]
	bl FUN_02382FA4
	mov r0, #0
_0238369C:
	pop {r4, lr}
	bx lr
	.align 2, 0
_023836A4: .4byte 0x04000184
	arm_func_end FUN_02383648

	arm_func_start FUN_023836A8
FUN_023836A8: @ 0x023836A8
	push {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r6, [sp]
	mvn r8, #3
	ldr r4, _02383780 @ =0x03806DFC
	ldr sb, _02383784 @ =0x04000184
	add sl, r8, #1
	mov r7, #0x4100000
	mov r5, #0
_023836CC:
	ldrh r0, [sb]
	tst r0, #0x4000
	ldrhne r0, [sb]
	addne r1, r8, #1
	orrne r0, r0, #0xc000
	strhne r0, [sb]
	bne _02383714
	bl FUN_02382F90
	ldrh r1, [sb]
	tst r1, #0x100
	beq _02383704
	bl FUN_02382FA4
	mov r1, r8
	b _02383714
_02383704:
	ldr r6, [r7]
	str r6, [sp]
	bl FUN_02382FA4
	mov r1, r5
_02383714:
	cmp r1, r8
	beq _02383774
	cmp r1, sl
	beq _023836CC
	lsl r0, r6, #0x1b
	lsrs r0, r0, #0x1b
	beq _023836CC
	ldr r3, [r4, r0, lsl #2]
	cmp r3, #0
	beq _02383754
	lsl r2, r6, #0x1a
	lsr r1, r6, #6
	lsr r2, r2, #0x1f
	mov lr, pc
	bx r3
	arm_func_end FUN_023836A8

	arm_func_start FUN_02383750
FUN_02383750: @ 0x02383750
	b _023836CC
_02383754:
	lsl r0, r6, #0x1a
	lsrs r0, r0, #0x1f
	bne _023836CC
	orr r6, r6, #0x20
	mov r0, r6
	str r6, [sp]
	bl FUN_02383648
	b _023836CC
_02383774:
	add sp, sp, #4
	pop {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_02383780: .4byte 0x03806DFC
_02383784: .4byte 0x04000184
	arm_func_end FUN_02383750

	arm_func_start FUN_02383788
FUN_02383788: @ 0x02383788
	ldr r2, _023837A4 @ =0x04000134
	mvn r3, r0
	ldrh r0, [r2]
	and r0, r3, r0
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_023837A4: .4byte 0x04000134
	arm_func_end FUN_02383788

	arm_func_start FUN_023837A8
FUN_023837A8: @ 0x023837A8
	ldr ip, _023837BC @ =0x037FB51C
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0xc000
	bx ip
	.align 2, 0
_023837BC: .4byte 0x037FB51C
	arm_func_end FUN_023837A8

	arm_func_start FUN_023837C0
FUN_023837C0: @ 0x023837C0
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl FUN_02382434
	cmp r0, #0
	beq _023837E0
	bl FUN_02382620
	cmp r0, #0
	bne _023837E8
_023837E0:
	mov r0, #0
	b _02383840
_023837E8:
	ldr r0, _0238384C @ =0x03806E7C
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #0
	bne _02383840
	ldr r0, _02383850 @ =0x03806E80
	bl FUN_02382630
	bl FUN_023824AC
	ldr r2, _02383854 @ =0x037FB5F0
	ldr r3, _02383858 @ =0x0000082E
	str r2, [sp, #4]
	adds ip, r0, r3
	mov lr, #0
	str lr, [sp, #8]
	adc r2, r1, #0
	ldr r0, _02383850 @ =0x03806E80
	mov r1, ip
	str lr, [sp]
	bl FUN_023827DC
	ldr r1, _0238384C @ =0x03806E7C
	mov r0, #1
	str r0, [r1]
_02383840:
	add sp, sp, #0xc
	ldm sp!, {lr}
	bx lr
	.align 2, 0
_0238384C: .4byte 0x03806E7C
_02383850: .4byte 0x03806E80
_02383854: .4byte 0x037FB5F0
_02383858: .4byte 0x0000082E
	arm_func_end FUN_023837C0

	arm_func_start FUN_0238385C
FUN_0238385C: @ 0x0238385C
	push {r4, lr}
	mov r0, #0x8000
	mov r4, #0
	bl FUN_023837A8
	ldr r0, _02383894 @ =0x04000136
	ldrh r1, [r0]
	ldr r0, _02383898 @ =0x027FFFA8
	tst r1, #0x80
	movne r4, #0x8000
	and r1, r1, #0xb
	orr r1, r4, r1, lsl #10
	strh r1, [r0]
	pop {r4, lr}
	bx lr
	.align 2, 0
_02383894: .4byte 0x04000136
_02383898: .4byte 0x027FFFA8
	arm_func_end FUN_0238385C

	arm_func_start FUN_0238389C
FUN_0238389C: @ 0x0238389C
	ldr r1, _023838B0 @ =0x04000501
	ldrb r0, [r1]
	orr r0, r0, #0x80
	strb r0, [r1]
	bx lr
	.align 2, 0
_023838B0: .4byte 0x04000501
	arm_func_end FUN_0238389C

	arm_func_start FUN_023838B4
FUN_023838B4: @ 0x023838B4
	push {r3, r4, r5, lr}
	ldr r1, _02383900 @ =0x04000501
	mov r5, #0
	ldrb r0, [r1]
	bic r0, r0, #0x80
	strb r0, [r1]
	mov r4, #1
_023838D0:
	mov r0, r5
	mov r1, r4
	bl FUN_02383C20
	add r5, r5, #1
	cmp r5, #0x10
	blt _023838D0
	ldr r0, _02383904 @ =0x04000508
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02383900: .4byte 0x04000501
_02383904: .4byte 0x04000508
	arm_func_end FUN_023838B4

	arm_func_start FUN_02383908
FUN_02383908: @ 0x02383908
	push {r3, lr}
	ldr r2, _0238394C @ =0x04000501
	mov r0, #0x80
	ldrb r1, [r2]
	bic r1, r1, #0x80
	strb r1, [r2]
	bl FUN_02383954
	mov r0, #0x40000
	bl FUN_02382FF4
	mov r0, #1
	bl FUN_0238A070
	ldr r1, _02383950 @ =0x04000304
	ldrh r0, [r1]
	bic r0, r0, #1
	strh r0, [r1]
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238394C: .4byte 0x04000501
_02383950: .4byte 0x04000304
	arm_func_end FUN_02383908

	arm_func_start FUN_02383954
FUN_02383954: @ 0x02383954
	ldr ip, _0238395C @ =FUN_038008D6
	bx ip
	.align 2, 0
_0238395C: .4byte FUN_038008D6
	arm_func_end FUN_02383954

	arm_func_start FUN_02383960
FUN_02383960: @ 0x02383960
	push {r3, lr}
	ldr r2, _023839A4 @ =0x04000304
	mov r0, #1
	ldrh r1, [r2]
	orr r1, r1, #1
	strh r1, [r2]
	bl FUN_0238A04C
	mov r0, #0x100
	bl FUN_023839B0
	ldr r0, _023839A8 @ =0x0007AB80
	bl FUN_02382FF4
	ldr r1, _023839AC @ =0x04000501
	ldrb r0, [r1]
	orr r0, r0, #0x80
	strb r0, [r1]
	pop {r3, lr}
	bx lr
	.align 2, 0
_023839A4: .4byte 0x04000304
_023839A8: .4byte 0x0007AB80
_023839AC: .4byte 0x04000501
	arm_func_end FUN_02383960

	arm_func_start FUN_023839B0
FUN_023839B0: @ 0x023839B0
	ldr ip, _023839B8 @ =FUN_038008CE
	bx ip
	.align 2, 0
_023839B8: .4byte FUN_038008CE
	arm_func_end FUN_023839B0

	arm_func_start FUN_023839BC
FUN_023839BC: @ 0x023839BC
	ldr r1, _023839C8 @ =0x04000500
	strb r0, [r1]
	bx lr
	.align 2, 0
_023839C8: .4byte 0x04000500
	arm_func_end FUN_023839BC

	arm_func_start FUN_023839CC
FUN_023839CC: @ 0x023839CC
	ldr ip, _02383A00 @ =0x04000501
	lsl r3, r3, #5
	ldrb ip, [ip]
	tst ip, #0x80
	movne ip, #1
	moveq ip, #0
	orr r3, r3, ip, lsl #7
	orr r2, r3, r2, lsl #4
	orr r2, r2, r1, lsl #2
	ldr r1, _02383A00 @ =0x04000501
	orr r0, r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_02383A00: .4byte 0x04000501
	arm_func_end FUN_023839CC

	arm_func_start FUN_02383A04
FUN_02383A04: @ 0x02383A04
	push {r4, r5, r6, r7, r8, lr}
	ldr r4, _02383ABC @ =0x03806AEC
	mov r8, r1
	ldr lr, [r4]
	ldr r1, _02383AC0 @ =0x03806EAC
	mov r7, r2
	ldr r5, [sp, #0x2c]
	ldr r4, _02383AC4 @ =0x03806EB0
	ldr ip, [sp, #0x20]
	ldr r2, _02383AC8 @ =0x03806EC0
	strb r5, [r4, r0]
	cmp lr, #0
	ldr r1, [r1]
	movge r5, lr
	mov r6, r3
	lsl r4, r0, #4
	strb ip, [r2, r0]
	cmp r1, #0
	ble _02383A70
	ldr r1, _02383ACC @ =0x0000FFF5
	mov r2, #1
	tst r1, r2, lsl r0
	beq _02383A70
	mov r0, ip
	mov r1, r5
	bl FUN_02383E40
	mov ip, r0
_02383A70:
	ldr r2, [sp, #0x24]
	lsl r0, r6, #0x1b
	orr r0, r0, r7, lsl #29
	orr r1, r0, r5, lsl #16
	ldr r0, [sp, #0x28]
	orr r2, r1, r2, lsl #8
	add r1, r4, #0x4000000
	orr r2, ip, r2
	str r2, [r1, #0x400]
	ldr r3, [sp, #0x18]
	rsb r2, r0, #0x10000
	add r0, r1, #0x400
	strh r2, [r0, #8]
	ldr r2, [sp, #0x1c]
	strh r3, [r0, #0xa]
	str r2, [r1, #0x40c]
	str r8, [r1, #0x404]
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02383ABC: .4byte 0x03806AEC
_02383AC0: .4byte 0x03806EAC
_02383AC4: .4byte 0x03806EB0
_02383AC8: .4byte 0x03806EC0
_02383ACC: .4byte 0x0000FFF5
	arm_func_end FUN_02383A04

	arm_func_start FUN_02383AD0
FUN_02383AD0: @ 0x02383AD0
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _02383B68 @ =0x03806AEC
	mov r7, r1
	ldr ip, [r4]
	ldr r1, _02383B6C @ =0x03806EAC
	mov r6, r3
	ldr r3, _02383B70 @ =0x03806EC0
	ldr r5, [sp, #0x1c]
	ldr r4, _02383B74 @ =0x03806EB0
	ldr r1, [r1]
	strb r5, [r4, r0]
	cmp ip, #0
	movge r5, ip
	lsl r4, r0, #4
	strb r2, [r3, r0]
	cmp r1, #0
	ble _02383B34
	ldr r1, _02383B78 @ =0x0000FFF5
	mov r3, #1
	tst r1, r3, lsl r0
	beq _02383B34
	mov r0, r2
	mov r1, r5
	bl FUN_02383E40
	mov r2, r0
_02383B34:
	lsl r0, r7, #0x18
	orr r0, r0, #0x60000000
	orr r0, r0, r5, lsl #16
	ldr r1, [sp, #0x18]
	orr r3, r0, r6, lsl #8
	add r0, r4, #0x4000000
	orr r2, r2, r3
	str r2, [r0, #0x400]
	rsb r1, r1, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02383B68: .4byte 0x03806AEC
_02383B6C: .4byte 0x03806EAC
_02383B70: .4byte 0x03806EC0
_02383B74: .4byte 0x03806EB0
_02383B78: .4byte 0x0000FFF5
	arm_func_end FUN_02383AD0

	arm_func_start FUN_02383B7C
FUN_02383B7C: @ 0x02383B7C
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _02383C0C @ =0x03806AEC
	mov r7, r2
	ldr ip, [r4]
	ldr r2, _02383C10 @ =0x03806EAC
	mov r6, r3
	ldr r3, _02383C14 @ =0x03806EC0
	ldr r5, [sp, #0x18]
	ldr r4, _02383C18 @ =0x03806EB0
	ldr r2, [r2]
	strb r5, [r4, r0]
	cmp ip, #0
	movge r5, ip
	lsl r4, r0, #4
	strb r1, [r3, r0]
	cmp r2, #0
	ble _02383BE0
	ldr r2, _02383C1C @ =0x0000FFF5
	mov r3, #1
	tst r2, r3, lsl r0
	beq _02383BE0
	mov r0, r1
	mov r1, r5
	bl FUN_02383E40
	mov r1, r0
_02383BE0:
	lsl r0, r5, #0x10
	orr r0, r0, #0x60000000
	orr r2, r0, r7, lsl #8
	add r0, r4, #0x4000000
	orr r1, r1, r2
	str r1, [r0, #0x400]
	rsb r1, r6, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02383C0C: .4byte 0x03806AEC
_02383C10: .4byte 0x03806EAC
_02383C14: .4byte 0x03806EC0
_02383C18: .4byte 0x03806EB0
_02383C1C: .4byte 0x0000FFF5
	arm_func_end FUN_02383B7C

	arm_func_start FUN_02383C20
FUN_02383C20: @ 0x02383C20
	lsl r3, r0, #4
	add r0, r3, #0x4000000
	ldr r2, [r0, #0x400]
	add r0, r3, #0x400
	tst r1, #1
	bic r1, r2, #0x80000000
	add r0, r0, #0x4000000
	orrne r1, r1, #0x8000
	str r1, [r0]
	bx lr
	arm_func_end FUN_02383C20

	arm_func_start FUN_02383C48
FUN_02383C48: @ 0x02383C48
	push {r3, r4, r5, lr}
	ldr r3, _02383CB4 @ =0x03806EAC
	ldr ip, _02383CB8 @ =0x03806EC0
	ldr r3, [r3]
	mov r5, r0
	mov r4, r2
	strb r1, [ip, r5]
	cmp r3, #0
	ble _02383C98
	ldr r0, _02383CBC @ =0x0000FFF5
	mov r2, #1
	tst r0, r2, lsl r5
	beq _02383C98
	lsl r0, r5, #4
	add r0, r0, #0x4000000
	ldrb r2, [r0, #0x402]
	mov r0, r1
	mov r1, r2
	bl FUN_02383E40
	mov r1, r0
_02383C98:
	lsl r0, r5, #4
	add r0, r0, #0x4000000
	orr r1, r1, r4, lsl #8
	add r0, r0, #0x400
	strh r1, [r0]
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02383CB4: .4byte 0x03806EAC
_02383CB8: .4byte 0x03806EC0
_02383CBC: .4byte 0x0000FFF5
	arm_func_end FUN_02383C48

	arm_func_start FUN_02383CC0
FUN_02383CC0: @ 0x02383CC0
	lsl r0, r0, #4
	add r0, r0, #0x4000000
	rsb r1, r1, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	bx lr
	arm_func_end FUN_02383CC0

	arm_func_start FUN_02383CD8
FUN_02383CD8: @ 0x02383CD8
	push {r4, lr}
	ldr r2, _02383D3C @ =0x03806AEC
	ldr r3, _02383D40 @ =0x03806EB0
	ldr r2, [r2]
	strb r1, [r3, r0]
	cmp r2, #0
	ldr r3, _02383D44 @ =0x03806EAC
	lsl r4, r0, #4
	movge r1, r2
	add r2, r4, #0x4000000
	strb r1, [r2, #0x402]
	ldr r2, [r3]
	cmp r2, #0
	ble _02383D34
	ldr r2, _02383D48 @ =0x0000FFF5
	mov r3, #1
	tst r2, r3, lsl r0
	beq _02383D34
	ldr r2, _02383D4C @ =0x03806EC0
	ldrb r0, [r2, r0]
	bl FUN_02383E40
	add r1, r4, #0x4000000
	strb r0, [r1, #0x400]
_02383D34:
	pop {r4, lr}
	bx lr
	.align 2, 0
_02383D3C: .4byte 0x03806AEC
_02383D40: .4byte 0x03806EB0
_02383D44: .4byte 0x03806EAC
_02383D48: .4byte 0x0000FFF5
_02383D4C: .4byte 0x03806EC0
	arm_func_end FUN_02383CD8

	arm_func_start FUN_02383D50
FUN_02383D50: @ 0x02383D50
	lsl r0, r0, #4
	add r0, r0, #0x4000000
	ldrb r0, [r0, #0x403]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end FUN_02383D50

	arm_func_start FUN_02383D6C
FUN_02383D6C: @ 0x02383D6C
	ldr r1, _02383DC8 @ =0x03806AEC
	cmp r0, #0
	str r0, [r1]
	blt _02383DA0
	mov r2, #0
	and r1, r0, #0xff
_02383D84:
	lsl r0, r2, #4
	add r0, r0, #0x4000000
	add r2, r2, #1
	strb r1, [r0, #0x402]
	cmp r2, #0x10
	blt _02383D84
	bx lr
_02383DA0:
	ldr r2, _02383DCC @ =0x03806EB0
	mov r3, #0
_02383DA8:
	ldrb r1, [r2, r3]
	lsl r0, r3, #4
	add r0, r0, #0x4000000
	add r3, r3, #1
	strb r1, [r0, #0x402]
	cmp r3, #0x10
	blt _02383DA8
	bx lr
	.align 2, 0
_02383DC8: .4byte 0x03806AEC
_02383DCC: .4byte 0x03806EB0
	arm_func_end FUN_02383D6C

	arm_func_start FUN_02383DD0
FUN_02383DD0: @ 0x02383DD0
	lsl r0, r0, #4
	add r0, r0, #0x4000000
	ldr r0, [r0, #0x400]
	bx lr
	arm_func_end FUN_02383DD0

	arm_func_start FUN_02383DE0
FUN_02383DE0: @ 0x02383DE0
	push {r4, r5, r6, r7, r8, lr}
	ldr r1, _02383E34 @ =0x03806EAC
	ldr r5, _02383E38 @ =0x03806EC0
	ldr r4, _02383E3C @ =0x0000FFF5
	str r0, [r1]
	mov r7, #0
	mov r6, #1
_02383DFC:
	tst r4, r6, lsl r7
	beq _02383E20
	lsl r8, r7, #4
	add r0, r8, #0x4000000
	ldrb r1, [r0, #0x402]
	ldrb r0, [r5, r7]
	bl FUN_02383E40
	add r1, r8, #0x4000000
	strb r0, [r1, #0x400]
_02383E20:
	add r7, r7, #1
	cmp r7, #0x10
	blt _02383DFC
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02383E34: .4byte 0x03806EAC
_02383E38: .4byte 0x03806EC0
_02383E3C: .4byte 0x0000FFF5
	arm_func_end FUN_02383DE0

	arm_func_start FUN_02383E40
FUN_02383E40: @ 0x02383E40
	cmp r1, #0x18
	bge _02383E70
	ldr r2, _02383EA4 @ =0x03806EAC
	add r3, r1, #0x28
	ldr ip, [r2]
	ldr r1, _02383EA8 @ =0x00007FFF
	mul r2, ip, r3
	sub r1, r1, ip
	add r1, r2, r1, lsl #6
	mul r1, r0, r1
	asr r0, r1, #0x15
	bx lr
_02383E70:
	cmp r1, #0x68
	bxle lr
	ldr r2, _02383EA4 @ =0x03806EAC
	sub r1, r1, #0x28
	ldr ip, [r2]
	rsb r2, ip, #0
	mul r3, r2, r1
	add r1, ip, #0xff
	add r1, r1, #0x7f00
	add r1, r3, r1, lsl #6
	mul r1, r0, r1
	asr r0, r1, #0x15
	bx lr
	.align 2, 0
_02383EA4: .4byte 0x03806EAC
_02383EA8: .4byte 0x00007FFF
	arm_func_end FUN_02383E40

	arm_func_start FUN_02383EAC
FUN_02383EAC: @ 0x02383EAC
	push {r4, r5, r6, lr}
	mov r5, r0
	rsb r0, r1, #0
	mov r4, #0
	b _02383EC8
_02383EC0:
	sub r4, r4, #1
	add r0, r0, #0x300
_02383EC8:
	cmp r0, #0
	blt _02383EC0
	b _02383EDC
_02383ED4:
	add r4, r4, #1
	sub r0, r0, #0x300
_02383EDC:
	cmp r0, #0x300
	bge _02383ED4
	bl FUN_02383FCC
	adds r3, r0, #0x10000
	asr r0, r5, #0x1f
	umull r2, r1, r3, r5
	mov ip, #0
	mla r1, r3, r0, r1
	adc r3, ip, #0
	sub r0, r4, #0x10
	mla r1, r3, r5, r1
	cmp r0, #0
	mov r4, #0x10000
	bgt _02383F34
	rsb r3, r0, #0
	lsr r4, r2, r3
	rsb r0, r3, #0x20
	orr r4, r4, r1, lsl r0
	sub r0, r3, #0x20
	lsr r3, r1, r3
	orr r4, r4, r1, lsr r0
	b _02383F90
_02383F34:
	cmp r0, #0x20
	bge _02383F88
	rsb r5, r0, #0x20
	sub lr, ip, #1
	lsl r6, lr, r5
	rsb r3, r5, #0x20
	orr r6, r6, lr, lsr r3
	sub r3, r5, #0x20
	orr r6, r6, lr, lsl r3
	and r3, r1, r6
	and r6, r2, lr, lsl r5
	cmp r3, ip
	cmpeq r6, ip
	subne r0, r4, #1
	bne _02383FC0
	lsl r3, r1, r0
	orr r3, r3, r2, lsr r5
	sub r1, r0, #0x20
	lsl r4, r2, r0
	orr r3, r3, r2, lsl r1
	b _02383F90
_02383F88:
	sub r0, r4, #1
	b _02383FC0
_02383F90:
	mov r0, #0x10
	cmp r3, #0
	cmpeq r4, #0x10
	mov r1, #0
	movlo r4, r0
	blo _02383FB8
	ldr r0, _02383FC8 @ =0x0000FFFF
	cmp r3, r1
	cmpeq r4, r0
	movhi r4, r0
_02383FB8:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
_02383FC0:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02383FC8: .4byte 0x0000FFFF
	arm_func_end FUN_02383EAC

	arm_func_start FUN_02383FCC
FUN_02383FCC: @ 0x02383FCC
	ldr ip, _02383FD4 @ =FUN_03800918
	bx ip
	.align 2, 0
_02383FD4: .4byte FUN_03800918
	arm_func_end FUN_02383FCC

	arm_func_start FUN_02383FD8
FUN_02383FD8: @ 0x02383FD8
	push {r4, lr}
	ldr r1, _02384048 @ =0xFFFFFD2D
	mov r4, r0
	cmp r4, r1
	movlt r4, r1
	blt _02383FF8
	cmp r4, #0
	movgt r4, #0
_02383FF8:
	add r0, r4, #0xd3
	add r0, r0, #0x200
	bl FUN_0238404C
	mvn r2, #0xef
	cmp r4, r2
	movlt r1, #3
	blt _02384034
	add r1, r2, #0x78
	cmp r4, r1
	movlt r1, #2
	blt _02384034
	add r1, r2, #0xb4
	cmp r4, r1
	movlt r1, #1
	movge r1, #0
_02384034:
	orr r0, r0, r1, lsl #8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, lr}
	bx lr
	.align 2, 0
_02384048: .4byte 0xFFFFFD2D
	arm_func_end FUN_02383FD8

	arm_func_start FUN_0238404C
FUN_0238404C: @ 0x0238404C
	ldr ip, _02384054 @ =FUN_0380091C
	bx ip
	.align 2, 0
_02384054: .4byte FUN_0380091C
	arm_func_end FUN_0238404C

	arm_func_start FUN_02384058
FUN_02384058: @ 0x02384058
	cmp r0, #0x20
	ldrlt r1, _023840C0 @ =0x0380664C
	ldrsblt r0, [r1, r0]
	bxlt lr
	cmp r0, #0x40
	ldrlt r1, _023840C0 @ =0x0380664C
	rsblt r0, r0, #0x40
	ldrsblt r0, [r1, r0]
	bxlt lr
	cmp r0, #0x60
	bge _023840A0
	ldr r1, _023840C0 @ =0x0380664C
	sub r0, r0, #0x40
	ldrsb r0, [r1, r0]
	rsb r0, r0, #0
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	bx lr
_023840A0:
	ldr r1, _023840C0 @ =0x0380664C
	sub r0, r0, #0x60
	rsb r0, r0, #0x20
	ldrsb r0, [r1, r0]
	rsb r0, r0, #0
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	bx lr
	.align 2, 0
_023840C0: .4byte 0x0380664C
	arm_func_end FUN_02384058

	arm_func_start FUN_023840C4
FUN_023840C4: @ 0x023840C4
	ldr r2, _023840EC @ =0x03806AF0
	ldr r0, _023840F0 @ =0x0019660D
	ldr r3, [r2]
	ldr r1, _023840F4 @ =0x3C6EF35F
	mla r1, r3, r0, r1
	lsr r0, r1, #0x10
	lsl r0, r0, #0x10
	str r1, [r2]
	lsr r0, r0, #0x10
	bx lr
	.align 2, 0
_023840EC: .4byte 0x03806AF0
_023840F0: .4byte 0x0019660D
_023840F4: .4byte 0x3C6EF35F
	arm_func_end FUN_023840C4

	arm_func_start FUN_023840F8
FUN_023840F8: @ 0x023840F8
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02384154 @ =0x03806ED0
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _02384148
	mov r0, #1
	str r0, [r1]
	bl FUN_023870DC
	mov r0, #0x400
	str r0, [sp]
	ldr r0, _02384158 @ =0x03806F40
	ldr r1, _0238415C @ =0x037FBF9C
	ldr r3, _02384160 @ =0x038073E4
	mov r2, #0
	str r4, [sp, #4]
	bl FUN_023812C0
	ldr r0, _02384158 @ =0x03806F40
	bl FUN_02381620
_02384148:
	add sp, sp, #8
	pop {r4, lr}
	bx lr
	.align 2, 0
_02384154: .4byte 0x03806ED0
_02384158: .4byte 0x03806F40
_0238415C: .4byte 0x037FBF9C
_02384160: .4byte 0x038073E4
	arm_func_end FUN_023840F8

	arm_func_start FUN_02384164
FUN_02384164: @ 0x02384164
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl FUN_023824AC
	ldr r3, _023841A8 @ =0x037FBF80
	adds ip, r0, #0x10000
	str r3, [sp, #4]
	mov lr, #0
	str lr, [sp, #8]
	adc r2, r1, #0
	ldr r3, _023841AC @ =0x00000AA8
	ldr r0, _023841B0 @ =0x03806F14
	mov r1, ip
	str lr, [sp]
	bl FUN_023827DC
	add sp, sp, #0xc
	ldm sp!, {lr}
	bx lr
	.align 2, 0
_023841A8: .4byte 0x037FBF80
_023841AC: .4byte 0x00000AA8
_023841B0: .4byte 0x03806F14
	arm_func_end FUN_02384164

	arm_func_start FUN_023841B4
FUN_023841B4: @ 0x023841B4
	ldr ip, _023841C0 @ =0x037FA5E4
	ldr r0, _023841C4 @ =0x03806F14
	bx ip
	.align 2, 0
_023841C0: .4byte 0x037FA5E4
_023841C4: .4byte 0x03806F14
	arm_func_end FUN_023841B4

	arm_func_start FUN_023841C8
FUN_023841C8: @ 0x023841C8
	ldr ip, _023841DC @ =0x037F96F8
	ldr r0, _023841E0 @ =0x03806EF4
	mov r1, #2
	mov r2, #0
	bx ip
	.align 2, 0
_023841DC: .4byte 0x037F96F8
_023841E0: .4byte 0x03806EF4
	arm_func_end FUN_023841C8

	arm_func_start FUN_023841E4
FUN_023841E4: @ 0x023841E4
	bx lr
	arm_func_end FUN_023841E4

	arm_func_start FUN_023841E8
FUN_023841E8: @ 0x023841E8
	bx lr
	arm_func_end FUN_023841E8

	arm_func_start FUN_023841EC
FUN_023841EC: @ 0x023841EC
	ldr ip, _02384200 @ =0x037F96F8
	ldr r0, _02384204 @ =0x03806EF4
	mov r1, #1
	mov r2, #0
	bx ip
	.align 2, 0
_02384200: .4byte 0x037F96F8
_02384204: .4byte 0x03806EF4
	arm_func_end FUN_023841EC

	arm_func_start FUN_02384208
FUN_02384208: @ 0x02384208
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	ldr r0, _023842E8 @ =0x03806EF4
	ldr r1, _023842EC @ =0x03806ED4
	mov r2, #8
	bl FUN_0238193C
	ldr r0, _023842F0 @ =0x03806F14
	bl FUN_02382630
	bl FUN_02384364
	bl FUN_023850F4
	bl FUN_02386F28
	bl FUN_0238389C
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl FUN_023839CC
	mov r0, #0x7f
	bl FUN_023839BC
	bl FUN_023824AC
	ldr r2, _023842F4 @ =0x037FBF80
	adds r4, r0, #0x10000
	str r2, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp]
	adc r2, r1, #0
	ldr r3, _023842F8 @ =0x00000AA8
	ldr r0, _023842F0 @ =0x03806F14
	mov r1, r4
	bl FUN_023827DC
	ldr r7, _023842E8 @ =0x03806EF4
	mov r4, #1
	add r6, sp, #0xc
	mov r8, #0
	mov r5, r4
_02384298:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov sb, r8
	bl FUN_023819F0
	ldr r0, [sp, #0xc]
	cmp r0, #1
	beq _023842C0
	cmp r0, #2
	b _023842C4
_023842C0:
	mov sb, r4
_023842C4:
	bl FUN_023843C0
	bl FUN_02387120
	mov r0, sb
	bl FUN_02385158
	mov r0, sb
	bl FUN_023845AC
	bl FUN_02386E90
	bl FUN_023840C4
	b _02384298
	.align 2, 0
_023842E8: .4byte 0x03806EF4
_023842EC: .4byte 0x03806ED4
_023842F0: .4byte 0x03806F14
_023842F4: .4byte 0x037FBF80
_023842F8: .4byte 0x00000AA8
	arm_func_end FUN_02384208

	arm_func_start FUN_023842FC
FUN_023842FC: @ 0x023842FC
	push {r3, r4, r5, lr}
	ldr r4, [sp, #0x10]
	lsl r5, r0, #3
	cmp r4, #0
	movne r4, #0
	moveq r4, #1
	lsl ip, r4, #2
	ldr lr, [sp, #0x14]
	orr r1, ip, r1, lsl #3
	orr ip, r1, lr, lsl #1
	ldr r4, [sp, #0x18]
	add r0, r0, #0x4000000
	orr r4, r4, ip
	strb r4, [r0, #0x508]
	add r1, r5, #0x4000000
	str r2, [r1, #0x510]
	add r0, r1, #0x500
	strh r3, [r0, #0x14]
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_023842FC

	arm_func_start FUN_0238434C
FUN_0238434C: @ 0x0238434C
	add r0, r0, #0x4000000
	ldrb r0, [r0, #0x508]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end FUN_0238434C

	arm_func_start FUN_02384364
FUN_02384364: @ 0x02384364
	push {r3, lr}
	ldr r3, _023843B8 @ =0x0380740C
	mov lr, #0
	mov r0, #0x54
_02384374:
	mul r1, lr, r0
	add ip, r3, r1
	strb lr, [r3, r1]
	ldrb r1, [ip, #3]
	add lr, lr, #1
	bic r2, r1, #0xf8
	and r1, r2, #0xff
	bic r1, r1, #1
	strb r1, [ip, #3]
	cmp lr, #0x10
	blt _02384374
	ldr r0, _023843BC @ =0x038073E4
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	pop {r3, lr}
	bx lr
	.align 2, 0
_023843B8: .4byte 0x0380740C
_023843BC: .4byte 0x038073E4
	arm_func_end FUN_02384364

	arm_func_start FUN_023843C0
FUN_023843C0: @ 0x023843C0
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18
	ldr r7, _023845A8 @ =0x0380740C
	mov sb, #0
	mov r4, #2
	mov r5, #1
	mov r6, sb
	mov sl, #0x54
_023843E0:
	mla r8, sb, sl, r7
	ldrb r0, [r8, #3]
	lsl r0, r0, #0x18
	lsrs r0, r0, #0x1b
	beq _02384540
	tst r0, #2
	beq _02384408
	mov r0, sb
	mov r1, r6
	bl FUN_02383C20
_02384408:
	ldrb r0, [r8, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	tst r0, #1
	beq _023844E4
	ldrb r0, [r8, #1]
	cmp r0, #0
	beq _0238443C
	cmp r0, #1
	beq _02384494
	cmp r0, #2
	beq _023844C0
	b _02384540
_0238443C:
	ldrb r0, [r8, #0x39]
	ldrh ip, [r8, #0x24]
	cmp r0, #0
	ldrh r0, [r8, #0x3e]
	movne r3, r5
	str r0, [sp]
	ldr r2, [r8, #0x40]
	and r1, ip, #0xff
	str r2, [sp, #4]
	str r1, [sp, #8]
	asr r0, ip, #8
	str r0, [sp, #0xc]
	ldrh r1, [r8, #0x26]
	moveq r3, r4
	str r1, [sp, #0x10]
	ldrb r1, [r8, #0x23]
	mov r0, sb
	str r1, [sp, #0x14]
	ldr r1, [r8, #0x44]
	ldrb r2, [r8, #0x38]
	bl FUN_02383A04
	b _02384540
_02384494:
	ldrh r3, [r8, #0x24]
	ldrh r1, [r8, #0x26]
	mov r0, sb
	str r1, [sp]
	ldrb r1, [r8, #0x23]
	and r2, r3, #0xff
	str r1, [sp, #4]
	ldr r1, [r8, #0x44]
	asr r3, r3, #8
	bl FUN_02383AD0
	b _02384540
_023844C0:
	ldrh r2, [r8, #0x24]
	ldrb r1, [r8, #0x23]
	mov r0, sb
	str r1, [sp]
	ldrh r3, [r8, #0x26]
	and r1, r2, #0xff
	asr r2, r2, #8
	bl FUN_02383B7C
	b _02384540
_023844E4:
	tst r0, #4
	beq _023844F8
	ldrh r1, [r8, #0x26]
	mov r0, sb
	bl FUN_02383CC0
_023844F8:
	ldrb r0, [r8, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	tst r0, #8
	beq _02384520
	ldrh r2, [r8, #0x24]
	mov r0, sb
	and r1, r2, #0xff
	asr r2, r2, #8
	bl FUN_02383C48
_02384520:
	ldrb r0, [r8, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	tst r0, #0x10
	beq _02384540
	ldrb r1, [r8, #0x23]
	mov r0, sb
	bl FUN_02383CD8
_02384540:
	add sb, sb, #1
	cmp sb, #0x10
	blt _023843E0
	ldr r3, _023845A8 @ =0x0380740C
	mov r4, #0
	mov r1, #0x54
_02384558:
	mla r5, r4, r1, r3
	ldrb r0, [r5, #3]
	lsl r0, r0, #0x18
	lsrs r0, r0, #0x1b
	beq _02384590
	tst r0, #1
	lslne r0, r4, #4
	addne r0, r0, #0x4000000
	ldrbne r2, [r0, #0x403]
	orrne r2, r2, #0x80
	strbne r2, [r0, #0x403]
	ldrb r0, [r5, #3]
	bic r0, r0, #0xf8
	strb r0, [r5, #3]
_02384590:
	add r4, r4, #1
	cmp r4, #0x10
	blt _02384558
	add sp, sp, #0x18
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_023845A8: .4byte 0x0380740C
	arm_func_end FUN_023843C0

	arm_func_start FUN_023845AC
FUN_023845AC: @ 0x023845AC
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	mov r0, #0x8000
	rsb r0, r0, #0
	mov r6, #0
	str r0, [sp]
	mov r4, r6
_023845C8:
	ldr r0, _02384954 @ =0x0380740C
	mov r1, #0x54
	mla r5, r6, r1, r0
	ldrb r2, [r5, #3]
	mov r7, #0
	lsl r0, r2, #0x1f
	mov r8, r7
	mov sb, r7
	lsrs r0, r0, #0x1f
	beq _02384940
	lsl r0, r2, #0x1e
	lsrs r0, r0, #0x1f
	beq _0238462C
	bic r1, r2, #0xf8
	lsl r0, r2, #0x18
	lsr r0, r0, #0x1b
	orr r0, r0, #1
	and r0, r0, #0xff
	lsl r0, r0, #0x1b
	orr r0, r1, r0, lsr #24
	strb r0, [r5, #3]
	and r0, r0, #0xff
	bic r0, r0, #2
	strb r0, [r5, #3]
	b _0238467C
_0238462C:
	mov r0, r6
	bl FUN_02383D50
	cmp r0, #0
	bne _0238467C
	ldr r3, [r5, #0x48]
	cmp r3, #0
	moveq r0, r7
	strbeq r0, [r5, #0x22]
	beq _02384664
	ldr r2, [r5, #0x4c]
	mov r0, r5
	mov r1, #1
	mov lr, pc
	bx r3
_02384664:
	mov r0, #0
	strh r0, [r5, #0x24]
	ldrb r0, [r5, #3]
	bic r0, r0, #1
	strb r0, [r5, #3]
	b _02384940
_0238467C:
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #8]
	lsl r2, r0, #1
	ldr r0, _02384958 @ =0x03806670
	ldrsh r2, [r0, r2]
	ldrb r0, [r5, #5]
	add r7, r7, r2
	sub r0, r1, r0
	add r8, r8, r0, lsl #6
	mov r0, r5
	mov r1, fp
	bl FUN_02384A30
	ldrsh r3, [r5, #0x32]
	add r7, r7, r0
	cmp r3, #0
	moveq r0, #0
	beq _02384704
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x18]
	cmp r0, r2
	movge r0, #0
	bge _02384704
	sub r0, r2, r0
	smull r0, r1, r3, r0
	asr r3, r2, #0x1f
	bl FUN_0238E2D0
	cmp fp, #0
	beq _02384704
	ldrb r1, [r5, #3]
	lsl r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	ldrne r1, [r5, #0x14]
	addne r1, r1, #1
	strne r1, [r5, #0x14]
_02384704:
	ldrsh r1, [r5, #0xc]
	add r2, r8, r0
	ldrsh r0, [r5, #6]
	add r1, r7, r1
	add r7, r1, r0
	ldrsh r1, [r5, #0xe]
	add r0, r5, #0x28
	add r8, r2, r1
	bl FUN_02385018
	asr r1, r0, #0x1f
	cmp r1, #0
	mov sl, r0
	cmpeq r0, r4
	beq _02384790
	ldrb r2, [r5, #0x28]
	cmp r2, #0
	beq _0238477C
	cmp r2, #1
	beq _02384764
	cmp r2, #2
	lsleq r1, r1, #6
	orreq r1, r1, r0, lsr #26
	lsleq sl, r0, #6
	b _02384788
_02384764:
	mov r2, #0x3c
	umull sl, r3, r0, r2
	mov r0, #0x3c
	mla r3, r1, r0, r3
	mov r1, r3
	b _02384788
_0238477C:
	lsl r1, r1, #6
	orr r1, r1, r0, lsr #26
	lsl sl, r0, #6
_02384788:
	lsr sl, sl, #0xe
	orr sl, sl, r1, lsl #18
_02384790:
	cmp fp, #0
	beq _023847A0
	add r0, r5, #0x28
	bl FUN_02384FB8
_023847A0:
	ldrb r0, [r5, #0x28]
	cmp r0, #0
	beq _023847D0
	cmp r0, #1
	beq _023847C0
	cmp r0, #2
	addeq sb, sb, sl
	b _023847D4
_023847C0:
	ldr r0, [sp]
	cmp r7, r0
	addgt r7, r7, sl
	b _023847D4
_023847D0:
	add r8, r8, sl
_023847D4:
	ldrsb r1, [r5, #0xa]
	ldrb r0, [r5, #4]
	add sb, sb, r1
	cmp r0, #0x7f
	mulne r0, sb, r0
	addne r0, r0, #0x40
	asrne sb, r0, #7
	ldrsb r1, [r5, #0xb]
	ldrb r0, [r5, #2]
	add sb, sb, r1
	cmp r0, #3
	bne _02384860
	ldr r0, _0238495C @ =0xFFFFFD2D
	cmp r7, r0
	bgt _02384860
	ldrb r0, [r5, #3]
	bic r0, r0, #0xf8
	orr r0, r0, #0x10
	strb r0, [r5, #3]
	ldr r3, [r5, #0x48]
	cmp r3, #0
	moveq r0, #0
	strbeq r0, [r5, #0x22]
	beq _02384848
	ldr r2, [r5, #0x4c]
	mov r0, r5
	mov r1, #1
	mov lr, pc
	bx r3
_02384848:
	mov r0, #0
	strh r0, [r5, #0x24]
	ldrb r0, [r5, #3]
	bic r0, r0, #1
	strb r0, [r5, #3]
	b _02384940
_02384860:
	mov r0, r7
	bl FUN_02383FD8
	mov r7, r0
	ldrh r0, [r5, #0x3c]
	mov r1, r8
	bl FUN_02383EAC
	ldrb r1, [r5, #1]
	cmp r1, #1
	ldreq r1, _02384960 @ =0x0000FFFC
	andeq r0, r0, r1
	lsleq r0, r0, #0x10
	lsreq r0, r0, #0x10
	adds sb, sb, #0x40
	movmi sb, #0
	bmi _023848A4
	cmp sb, #0x7f
	movgt sb, #0x7f
_023848A4:
	ldrh r1, [r5, #0x24]
	cmp r7, r1
	beq _023848D8
	strh r7, [r5, #0x24]
	ldrb r1, [r5, #3]
	bic r2, r1, #0xf8
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1b
	orr r1, r1, #8
	and r1, r1, #0xff
	lsl r1, r1, #0x1b
	orr r1, r2, r1, lsr #24
	strb r1, [r5, #3]
_023848D8:
	ldrh r1, [r5, #0x26]
	cmp r0, r1
	beq _0238490C
	strh r0, [r5, #0x26]
	ldrb r0, [r5, #3]
	bic r1, r0, #0xf8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	orr r0, r0, #4
	and r0, r0, #0xff
	lsl r0, r0, #0x1b
	orr r0, r1, r0, lsr #24
	strb r0, [r5, #3]
_0238490C:
	ldrb r0, [r5, #0x23]
	cmp sb, r0
	beq _02384940
	strb sb, [r5, #0x23]
	ldrb r0, [r5, #3]
	bic r1, r0, #0xf8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	orr r0, r0, #0x10
	and r0, r0, #0xff
	lsl r0, r0, #0x1b
	orr r0, r1, r0, lsr #24
	strb r0, [r5, #3]
_02384940:
	add r6, r6, #1
	cmp r6, #0x10
	blt _023845C8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02384954: .4byte 0x0380740C
_02384958: .4byte 0x03806670
_0238495C: .4byte 0xFFFFFD2D
_02384960: .4byte 0x0000FFFC
	arm_func_end FUN_023845AC

	arm_func_start FUN_02384964
FUN_02384964: @ 0x02384964
	push {r4, lr}
	mov r4, r0
	mov r0, #0
	strb r0, [r4, #1]
	mov lr, r2
	add ip, r4, #0x38
	ldm r1, {r0, r1, r2}
	stm ip, {r0, r1, r2}
	mov r0, r4
	mov r1, r3
	str lr, [r4, #0x44]
	bl FUN_023850BC
	mov r0, #1
	pop {r4, lr}
	bx lr
	arm_func_end FUN_02384964

	arm_func_start FUN_023849A0
FUN_023849A0: @ 0x023849A0
	push {r3, lr}
	ldrb r3, [r0]
	cmp r3, #8
	movlo r0, #0
	blo _023849E0
	cmp r3, #0xd
	movhi r0, #0
	bhi _023849E0
	mov r3, #1
	strb r3, [r0, #1]
	str r1, [r0, #0x44]
	ldr r3, _023849E8 @ =0x00001F46
	mov r1, r2
	strh r3, [r0, #0x3c]
	bl FUN_023850BC
	mov r0, #1
_023849E0:
	pop {r3, lr}
	bx lr
	.align 2, 0
_023849E8: .4byte 0x00001F46
	arm_func_end FUN_023849A0

	arm_func_start FUN_023849EC
FUN_023849EC: @ 0x023849EC
	push {r3, lr}
	ldrb r2, [r0]
	cmp r2, #0xe
	movlo r0, #0
	blo _02384A24
	cmp r2, #0xf
	movhi r0, #0
	bhi _02384A24
	ldr r2, _02384A2C @ =0x00001F46
	mov r3, #2
	strb r3, [r0, #1]
	strh r2, [r0, #0x3c]
	bl FUN_023850BC
	mov r0, #1
_02384A24:
	pop {r3, lr}
	bx lr
	.align 2, 0
_02384A2C: .4byte 0x00001F46
	arm_func_end FUN_023849EC

	arm_func_start FUN_02384A30
FUN_02384A30: @ 0x02384A30
	cmp r1, #0
	beq _02384AC8
	ldrb r1, [r0, #2]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02384AC8
_02384A48: @ jump table
	b _02384A58 @ case 0
	b _02384A80 @ case 1
	b _02384AC8 @ case 2
	b _02384AB8 @ case 3
_02384A58:
	ldr r2, [r0, #0x10]
	ldrb r1, [r0, #0x1c]
	rsb r2, r2, #0
	mul r1, r2, r1
	asr r1, r1, #8
	rsbs r1, r1, #0
	str r1, [r0, #0x10]
	moveq r1, #1
	strbeq r1, [r0, #2]
	b _02384AC8
_02384A80:
	ldrb r2, [r0, #0x1d]
	ldr r1, _02384AD4 @ =0x03806670
	lsl r2, r2, #1
	ldrsh r3, [r1, r2]
	ldr r2, [r0, #0x10]
	ldrh r1, [r0, #0x1e]
	lsl ip, r3, #7
	sub r1, r2, r1
	str r1, [r0, #0x10]
	cmp r1, r3, lsl #7
	strle ip, [r0, #0x10]
	movle r1, #2
	strble r1, [r0, #2]
	b _02384AC8
_02384AB8:
	ldr r2, [r0, #0x10]
	ldrh r1, [r0, #0x20]
	sub r1, r2, r1
	str r1, [r0, #0x10]
_02384AC8:
	ldr r0, [r0, #0x10]
	asr r0, r0, #7
	bx lr
	.align 2, 0
_02384AD4: .4byte 0x03806670
	arm_func_end FUN_02384A30

	arm_func_start FUN_02384AD8
FUN_02384AD8: @ 0x02384AD8
	cmp r1, #0x6d
	ldrge r2, _02384AF4 @ =0x03806784
	rsblt r1, r1, #0xff
	rsbge r1, r1, #0x7f
	ldrbge r1, [r2, r1]
	strb r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_02384AF4: .4byte 0x03806784
	arm_func_end FUN_02384AD8

	arm_func_start FUN_02384AF8
FUN_02384AF8: @ 0x02384AF8
	push {r4, lr}
	mov r4, r0
	mov r0, r1
	bl FUN_02385068
	strh r0, [r4, #0x1e]
	pop {r4, lr}
	bx lr
	arm_func_end FUN_02384AF8

	arm_func_start FUN_02384B14
FUN_02384B14: @ 0x02384B14
	strb r1, [r0, #0x1d]
	bx lr
	arm_func_end FUN_02384B14

	arm_func_start FUN_02384B1C
FUN_02384B1C: @ 0x02384B1C
	push {r4, lr}
	mov r4, r0
	mov r0, r1
	bl FUN_02385068
	strh r0, [r4, #0x20]
	pop {r4, lr}
	bx lr
	arm_func_end FUN_02384B1C

	arm_func_start FUN_02384B38
FUN_02384B38: @ 0x02384B38
	mov r1, #3
	strb r1, [r0, #2]
	bx lr
	arm_func_end FUN_02384B38

	arm_func_start FUN_02384B44
FUN_02384B44: @ 0x02384B44
	ldrb r0, [r0, #3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
	arm_func_end FUN_02384B44

	arm_func_start FUN_02384B54
FUN_02384B54: @ 0x02384B54
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _02384D0C @ =0x038073E4
	mov r6, r1
	ldr r1, [r4, #4]
	mov r5, r3
	mvn r1, r1
	cmp r2, #0
	and r0, r0, r1
	ldreq r1, [r4]
	mov r4, #0
	mvneq r1, r1
	andeq r0, r0, r1
	ldr r3, _02384D10 @ =0x03806770
	ldr r8, _02384D14 @ =0x03806774
	mov sb, r4
	mvn r1, #0
	mov fp, #1
_02384B98:
	ldrb ip, [r8, sb]
	tst r0, fp, lsl ip
	beq _02384C18
	ldr r2, _02384D18 @ =0x0380740C
	mov r7, #0x54
	mla sl, ip, r7, r2
	cmp r4, #0
	moveq r4, sl
	beq _02384C18
	ldrb r7, [r4, #0x22]
	ldrb r2, [sl, #0x22]
	cmp r2, r7
	bhi _02384C18
	bne _02384C14
	ldrh r2, [r4, #0x24]
	ldrh r7, [sl, #0x24]
	lsl ip, r2, #0x18
	lsr ip, ip, #0x14
	ldrb r2, [r3, r2, asr #8]
	lsl lr, r7, #0x18
	asr r2, ip, r2
	lsr ip, lr, #0x14
	ldrb r7, [r3, r7, asr #8]
	cmp r2, ip, asr r7
	beq _02384C08
	movlt r2, fp
	movge r2, r1
	b _02384C0C
_02384C08:
	mov r2, #0
_02384C0C:
	cmp r2, #0
	bge _02384C18
_02384C14:
	mov r4, sl
_02384C18:
	add sb, sb, #1
	cmp sb, #0x10
	blt _02384B98
	cmp r4, #0
	moveq r0, #0
	beq _02384D04
	ldrb r0, [r4, #0x22]
	cmp r6, r0
	movlt r0, #0
	blt _02384D04
	ldr r3, [r4, #0x48]
	cmp r3, #0
	beq _02384C60
	ldr r2, [r4, #0x4c]
	mov r0, r4
	mov r1, #0
	mov lr, pc
	bx r3
_02384C60:
	ldrb r0, [r4, #3]
	mov r7, #0
	bic r0, r0, #0xf8
	orr r1, r0, #0x10
	and r0, r1, #0xff
	bic r0, r0, #1
	strb r0, [r4, #3]
	str r7, [r4, #0x50]
	ldr r0, [sp, #0x28]
	str r5, [r4, #0x48]
	str r0, [r4, #0x4c]
	str r7, [r4, #0x34]
	strb r6, [r4, #0x22]
	mov r3, #0x7f
	strh r3, [r4, #0x24]
	ldrb r1, [r4, #3]
	mov r0, #0x3c
	bic r2, r1, #2
	and r1, r2, #0xff
	orr r1, r1, #4
	strb r1, [r4, #3]
	strb r0, [r4, #8]
	strb r0, [r4, #5]
	strb r3, [r4, #9]
	strb r7, [r4, #0xa]
	strh r7, [r4, #0xc]
	strh r7, [r4, #6]
	strh r7, [r4, #0xe]
	strb r7, [r4, #0xb]
	strb r3, [r4, #4]
	strh r7, [r4, #0x32]
	str r7, [r4, #0x18]
	str r7, [r4, #0x14]
	ldr r1, _02384D1C @ =0x0000FFFF
	strb r7, [r4, #0x1c]
	strh r1, [r4, #0x1e]
	strb r3, [r4, #0x1d]
	add r0, r4, #0x28
	strh r1, [r4, #0x20]
	bl FUN_02384F94
	mov r0, r4
_02384D04:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02384D0C: .4byte 0x038073E4
_02384D10: .4byte 0x03806770
_02384D14: .4byte 0x03806774
_02384D18: .4byte 0x0380740C
_02384D1C: .4byte 0x0000FFFF
	arm_func_end FUN_02384B54

	arm_func_start FUN_02384D20
FUN_02384D20: @ 0x02384D20
	cmp r0, #0
	movne r1, #0
	strne r1, [r0, #0x48]
	strne r1, [r0, #0x4c]
	bx lr
	arm_func_end FUN_02384D20

	arm_func_start FUN_02384D34
FUN_02384D34: @ 0x02384D34
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	ldr r7, _02384DDC @ =0x0380740C
	ldr r4, _02384DE0 @ =0x038073E4
	mov sl, r0
	mov r5, sb
	mov r6, #1
	mov fp, #0x54
	b _02384DC4
_02384D58:
	tst sl, #1
	beq _02384DBC
	ldr r0, [r4, #4]
	mla r8, sb, fp, r7
	tst r0, r6, lsl sb
	bne _02384DBC
	ldr r3, [r8, #0x48]
	cmp r3, #0
	beq _02384D90
	ldr r2, [r8, #0x4c]
	mov r0, r8
	mov r1, #0
	mov lr, pc
	bx r3
_02384D90:
	mov r0, sb
	mov r1, #0
	bl FUN_02383C20
	strb r5, [r8, #0x22]
	mov r0, r8
	bl FUN_02384D20
	ldrb r0, [r8, #3]
	bic r1, r0, #0xf8
	and r0, r1, #0xff
	bic r0, r0, #1
	strb r0, [r8, #3]
_02384DBC:
	add sb, sb, #1
	lsr sl, sl, #1
_02384DC4:
	cmp sb, #0x10
	bge _02384DD4
	cmp sl, #0
	bne _02384D58
_02384DD4:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02384DDC: .4byte 0x0380740C
_02384DE0: .4byte 0x038073E4
	arm_func_end FUN_02384D34

	arm_func_start FUN_02384DE4
FUN_02384DE4: @ 0x02384DE4
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r8, #0
	ldr r5, _02384EBC @ =0x0380740C
	mov sb, r1
	mov r7, sl
	mov fp, r8
	mov r4, #1
	b _02384E80
_02384E08:
	tst r7, #1
	beq _02384E78
	ldr r0, _02384EC0 @ =0x038073E4
	ldr r1, [r0, #4]
	mov r0, #0x54
	mla r6, r8, r0, r5
	tst r1, r4, lsl r8
	bne _02384E78
	ldr r3, [r6, #0x48]
	cmp r3, #0
	beq _02384E48
	ldr r2, [r6, #0x4c]
	mov r0, r6
	mov r1, #0
	mov lr, pc
	bx r3
_02384E48:
	mov r0, r8
	mov r1, #0
	bl FUN_02383C20
	strb fp, [r6, #0x22]
	mov r0, r6
	bl FUN_02384D20
	ldrb r0, [r6, #3]
	bic r0, r0, #0xf8
	strb r0, [r6, #3]
	and r0, r0, #0xff
	bic r0, r0, #1
	strb r0, [r6, #3]
_02384E78:
	add r8, r8, #1
	lsr r7, r7, #1
_02384E80:
	cmp r8, #0x10
	bge _02384E90
	cmp r7, #0
	bne _02384E08
_02384E90:
	tst sb, #1
	ldrne r0, _02384EC0 @ =0x038073E4
	ldrne r1, [r0]
	orrne r1, r1, sl
	strne r1, [r0]
	ldreq r0, _02384EC0 @ =0x038073E4
	ldreq r1, [r0, #4]
	orreq r1, r1, sl
	streq r1, [r0, #4]
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02384EBC: .4byte 0x0380740C
_02384EC0: .4byte 0x038073E4
	arm_func_end FUN_02384DE4

	arm_func_start FUN_02384EC4
FUN_02384EC4: @ 0x02384EC4
	tst r1, #1
	ldreq r1, _02384EF8 @ =0x038073E4
	mvneq r0, r0
	ldreq r2, [r1, #4]
	andeq r0, r2, r0
	streq r0, [r1, #4]
	bxeq lr
	ldr r1, _02384EF8 @ =0x038073E4
	mvn r0, r0
	ldr r2, [r1]
	and r0, r2, r0
	str r0, [r1]
	bx lr
	.align 2, 0
_02384EF8: .4byte 0x038073E4
	arm_func_end FUN_02384EC4

	arm_func_start FUN_02384EFC
FUN_02384EFC: @ 0x02384EFC
	tst r0, #1
	ldrne r0, _02384F14 @ =0x038073E4
	ldrne r0, [r0]
	ldreq r0, _02384F14 @ =0x038073E4
	ldreq r0, [r0, #4]
	bx lr
	.align 2, 0
_02384F14: .4byte 0x038073E4
	arm_func_end FUN_02384EFC

	arm_func_start FUN_02384F18
FUN_02384F18: @ 0x02384F18
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, _02384F90 @ =0x0380740C
	mov r6, #0
	mov r8, r0
	mov r7, r1
	mov r4, r6
	mov sb, #0x54
_02384F34:
	mla r2, r6, sb, r5
	ldrb r1, [r2, #3]
	lsl r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	beq _02384F78
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _02384F78
	ldr r0, [r2, #0x44]
	cmp r8, r0
	cmpls r0, r7
	bhi _02384F78
	bic r3, r1, #2
	mov r0, r6
	mov r1, r4
	strb r3, [r2, #3]
	bl FUN_02383C20
_02384F78:
	add r0, r6, #1
	and r6, r0, #0xff
	cmp r6, #0x10
	blo _02384F34
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02384F90: .4byte 0x0380740C
	arm_func_end FUN_02384F18

	arm_func_start FUN_02384F94
FUN_02384F94: @ 0x02384F94
	mov r2, #0
	strb r2, [r0]
	strb r2, [r0, #2]
	mov r1, #1
	strb r1, [r0, #3]
	mov r1, #0x10
	strb r1, [r0, #1]
	strh r2, [r0, #4]
	bx lr
	arm_func_end FUN_02384F94

	arm_func_start FUN_02384FB8
FUN_02384FB8: @ 0x02384FB8
	ldrh r2, [r0, #6]
	ldrh r1, [r0, #4]
	cmp r2, r1
	addlo r1, r2, #1
	strhlo r1, [r0, #6]
	bxlo lr
	ldrh r1, [r0, #8]
	ldrb r2, [r0, #1]
	add r1, r1, r2, lsl #6
	lsr r3, r1, #8
	b _02384FE8
_02384FE4:
	sub r3, r3, #0x80
_02384FE8:
	cmp r3, #0x80
	bhs _02384FE4
	ldrh r1, [r0, #8]
	add r1, r1, r2, lsl #6
	strh r1, [r0, #8]
	ldrh r1, [r0, #8]
	and r1, r1, #0xff
	strh r1, [r0, #8]
	ldrh r1, [r0, #8]
	orr r1, r1, r3, lsl #8
	strh r1, [r0, #8]
	bx lr
	arm_func_end FUN_02384FB8

	arm_func_start FUN_02385018
FUN_02385018: @ 0x02385018
	push {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #2]
	cmp r0, #0
	moveq r0, #0
	beq _02385060
	ldrh r1, [r4, #6]
	ldrh r0, [r4, #4]
	cmp r1, r0
	movlo r0, #0
	blo _02385060
	ldrh r0, [r4, #8]
	lsr r0, r0, #8
	bl FUN_02384058
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #3]
	mul r0, r1, r0
	mul r0, r2, r0
_02385060:
	pop {r4, lr}
	bx lr
	arm_func_end FUN_02385018

	arm_func_start FUN_02385068
FUN_02385068: @ 0x02385068
	push {r3, lr}
	cmp r0, #0x7f
	ldreq r0, _023850B8 @ =0x0000FFFF
	beq _023850B0
	cmp r0, #0x7e
	moveq r0, #0x3c00
	beq _023850B0
	cmp r0, #0x32
	lsllt r0, r0, #1
	addlt r0, r0, #1
	lsllt r0, r0, #0x10
	lsrlt r0, r0, #0x10
	blt _023850B0
	rsb r1, r0, #0x7e
	mov r0, #0x1e00
	bl FUN_0238E4C8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
_023850B0:
	pop {r3, lr}
	bx lr
	.align 2, 0
_023850B8: .4byte 0x0000FFFF
	arm_func_end FUN_02385068

	arm_func_start FUN_023850BC
FUN_023850BC: @ 0x023850BC
	ldr r3, _023850F0 @ =0xFFFE9680
	mov r2, #0
	str r3, [r0, #0x10]
	strb r2, [r0, #2]
	str r1, [r0, #0x34]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x2e]
	ldrb r1, [r0, #3]
	orr r2, r1, #2
	bic r1, r2, #1
	orr r1, r1, #1
	strb r1, [r0, #3]
	bx lr
	.align 2, 0
_023850F0: .4byte 0xFFFE9680
	arm_func_end FUN_023850BC

	arm_func_start FUN_023850F4
FUN_023850F4: @ 0x023850F4
	push {r3, lr}
	ldr r3, _02385150 @ =0x0380794C
	mov lr, #0
	mov r0, #0x24
_02385104:
	mul r2, lr, r0
	ldrb r1, [r3, r2]
	add ip, r3, r2
	bic r1, r1, #1
	strb r1, [r3, r2]
	strb lr, [ip, #1]
	add lr, lr, #1
	cmp lr, #0x10
	blt _02385104
	ldr r1, _02385154 @ =0x03807B8C
	mov r2, #0
_02385130:
	ldrb r0, [r1, r2, lsl #6]
	bic r0, r0, #1
	strb r0, [r1, r2, lsl #6]
	add r2, r2, #1
	cmp r2, #0x20
	blt _02385130
	pop {r3, lr}
	bx lr
	.align 2, 0
_02385150: .4byte 0x0380794C
_02385154: .4byte 0x03807B8C
	arm_func_end FUN_023850F4

	arm_func_start FUN_02385158
FUN_02385158: @ 0x02385158
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, #0
	mov sb, r0
	mov r5, r6
_02385168:
	mov r0, #0x24
	mul r0, r5, r0
	ldr r2, _023852B0 @ =0x0380794C
	ldrb r1, [r2, r0]
	add r4, r2, r0
	lsl r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	beq _0238528C
	lsl r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	beq _02385278
	cmp sb, #0
	beq _02385244
	lsl r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	bne _02385244
	mov r8, #0
	b _023851C0
_023851B0:
	ldrh r0, [r4, #0x1c]
	add r8, r8, #1
	sub r0, r0, #0xf0
	strh r0, [r4, #0x1c]
_023851C0:
	ldrh r0, [r4, #0x1c]
	cmp r0, #0xf0
	bhs _023851B0
	mov r7, #0
	mov sl, #1
	b _023851FC
_023851D8:
	mov r0, r4
	mov r1, sl
	bl FUN_02385EF4
	cmp r0, #0
	beq _023851F8
	mov r0, r4
	bl FUN_02385D04
	b _02385204
_023851F8:
	add r7, r7, #1
_023851FC:
	cmp r7, r8
	blt _023851D8
_02385204:
	ldr r0, _023852B4 @ =0x03807408
	ldr r2, [r0]
	cmp r2, #0
	beq _0238522C
	ldrb r1, [r4, #1]
	mov r0, #0x24
	mla r2, r1, r0, r2
	ldr r0, [r2, #0x40]
	add r0, r0, r7
	str r0, [r2, #0x40]
_0238522C:
	ldrh r2, [r4, #0x18]
	ldrh r1, [r4, #0x1a]
	ldrh r0, [r4, #0x1c]
	mul r1, r2, r1
	add r0, r0, r1, asr #8
	strh r0, [r4, #0x1c]
_02385244:
	mov r8, #0
	mov r7, #1
_0238524C:
	mov r0, r4
	mov r1, r8
	bl FUN_02385C80
	cmp r0, #0
	beq _0238526C
	mov r1, r4
	mov r2, r7
	bl FUN_02385D9C
_0238526C:
	add r8, r8, #1
	cmp r8, #0x10
	blt _0238524C
_02385278:
	ldrb r0, [r4]
	lsl r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	movne r0, #1
	orrne r6, r6, r0, lsl r5
_0238528C:
	add r5, r5, #1
	cmp r5, #0x10
	blt _02385168
	ldr r0, _023852B4 @ =0x03807408
	ldr r0, [r0]
	cmp r0, #0
	strne r6, [r0, #4]
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_023852B0: .4byte 0x0380794C
_023852B4: .4byte 0x03807408
	arm_func_end FUN_02385158

	arm_func_start FUN_023852B8
FUN_023852B8: @ 0x023852B8
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0x24
	mul r5, sb, r0
	ldr r6, _02385488 @ =0x0380794C
	mov r8, r1
	ldrb r0, [r6, r5]
	mov r7, r2
	lsl r0, r0, #0x1f
	mov r4, r3
	add r5, r6, r5
	lsrs r0, r0, #0x1f
	beq _023852F4
	mov r0, r5
	bl FUN_02385D04
_023852F4:
	ldrb r1, [r5]
	mov r0, #0x78
	bic r1, r1, #4
	strb r1, [r5]
	str r4, [r5, #0x20]
	strh r0, [r5, #0x18]
	mov r0, #0x100
	strh r0, [r5, #0x1a]
	mov r0, #0xf0
	strh r0, [r5, #0x1c]
	mov r0, #0x7f
	strb r0, [r5, #5]
	mov r2, #0
	strh r2, [r5, #6]
	mov r0, #0x40
	strb r0, [r5, #4]
	mov r1, #0xff
_02385338:
	add r0, r5, r2
	add r2, r2, #1
	strb r1, [r0, #8]
	cmp r2, #0x10
	blt _02385338
	ldr r1, _0238548C @ =0x03807408
	ldr r3, [r1]
	cmp r3, #0
	beq _02385398
	ldrb r2, [r5, #1]
	mov r0, #0x24
	mla r0, r2, r0, r3
	mov r6, #0
	str r6, [r0, #0x40]
	mvn r4, #0
	mov r0, #0x24
_02385378:
	ldr r2, [r1]
	ldrb r3, [r5, #1]
	mla r2, r3, r0, r2
	add r2, r2, r6, lsl #1
	add r6, r6, #1
	strh r4, [r2, #0x20]
	cmp r6, #0x10
	blt _02385378
_02385398:
	bl FUN_02386A88
	movs r4, r0
	bmi _02385480
	ldr r0, _02385490 @ =0x03807B8C
	add r6, r0, r4, lsl #6
	mov r0, r6
	bl FUN_02385AF4
	str r8, [r6, #0x24]
	add r0, r8, r7
	str r0, [r6, #0x28]
	strb r4, [r5, #8]
	ldr r0, [r6, #0x28]
	bl FUN_02385988
	mov r0, r6
	bl FUN_02385494
	cmp r0, #0xfe
	ldrne r0, [r6, #0x28]
	subne r0, r0, #1
	strne r0, [r6, #0x28]
	bne _0238544C
	mov r0, r6
	bl FUN_02385494
	mov r4, r0
	mov r0, r6
	bl FUN_02385494
	orr r0, r4, r0, lsl #8
	lsl r0, r0, #0x10
	ldr r4, _02385490 @ =0x03807B8C
	lsr r8, r0, #0x11
	mov r7, #1
	b _02385444
_02385414:
	tst r8, #1
	beq _02385438
	bl FUN_02386A88
	movs r6, r0
	bmi _0238544C
	add r0, r4, r6, lsl #6
	bl FUN_02385AF4
	add r0, r5, r7
	strb r6, [r0, #8]
_02385438:
	lsl r0, r8, #0xf
	add r7, r7, #1
	lsr r8, r0, #0x10
_02385444:
	cmp r8, #0
	bne _02385414
_0238544C:
	ldrb r1, [r5]
	ldr r0, _0238548C @ =0x03807408
	bic r1, r1, #1
	ldr r2, [r0]
	orr r1, r1, #1
	and r0, r1, #0xff
	bic r0, r0, #2
	strb r0, [r5]
	cmp r2, #0
	ldrne r1, [r2, #4]
	movne r0, #1
	orrne r0, r1, r0, lsl sb
	strne r0, [r2, #4]
_02385480:
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02385488: .4byte 0x0380794C
_0238548C: .4byte 0x03807408
_02385490: .4byte 0x03807B8C
	arm_func_end FUN_023852B8

	arm_func_start FUN_02385494
FUN_02385494: @ 0x02385494
	push {r3, r4, r5, lr}
	ldr r1, _023854EC @ =0x038073EC
	mov r5, r0
	ldr r4, [r5, #0x28]
	ldr r0, [r1, #4]
	cmp r4, r0
	blo _023854BC
	ldr r0, [r1, #8]
	cmp r4, r0
	blo _023854C4
_023854BC:
	mov r0, r4
	bl FUN_02385988
_023854C4:
	ldr r0, _023854EC @ =0x038073EC
	ldr r1, [r5, #0x28]
	ldr r2, [r0, #4]
	ldr r0, _023854F0 @ =0x038073F8
	sub r2, r4, r2
	ldrb r0, [r0, r2]
	add r1, r1, #1
	str r1, [r5, #0x28]
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_023854EC: .4byte 0x038073EC
_023854F0: .4byte 0x038073F8
	arm_func_end FUN_02385494

	arm_func_start FUN_023854F4
FUN_023854F4: @ 0x023854F4
	mov r1, #0x24
	mul r1, r0, r1
	ldr r2, _02385510 @ =0x0380794C
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	bx lr
	.align 2, 0
_02385510: .4byte 0x0380794C
	arm_func_end FUN_023854F4

	arm_func_start FUN_02385514
FUN_02385514: @ 0x02385514
	push {r4, lr}
	mov r4, r0
	bl FUN_023852B8
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _02385540 @ =0x0380794C
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	pop {r4, lr}
	bx lr
	.align 2, 0
_02385540: .4byte 0x0380794C
	arm_func_end FUN_02385514

	arm_func_start FUN_02385544
FUN_02385544: @ 0x02385544
	push {r4, lr}
	mov r4, r0
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _02385598 @ =0x0380794C
	ldrb r0, [r2, r1]
	lsl r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _02385590
	add r0, r2, r1
	bl FUN_02385D04
	ldr r0, _0238559C @ =0x03807408
	ldr r2, [r0]
	cmp r2, #0
	movne r0, #1
	ldrne r1, [r2, #4]
	mvnne r0, r0, lsl r4
	andne r0, r1, r0
	strne r0, [r2, #4]
_02385590:
	pop {r4, lr}
	bx lr
	.align 2, 0
_02385598: .4byte 0x0380794C
_0238559C: .4byte 0x03807408
	arm_func_end FUN_02385544

	arm_func_start FUN_023855A0
FUN_023855A0: @ 0x023855A0
	push {r4, r5, r6, r7, r8, lr}
	mov r2, #0x24
	mul r4, r0, r2
	ldr r5, _02385614 @ =0x0380794C
	and r0, r1, #0xff
	ldrb r2, [r5, r4]
	lsl r0, r0, #0x1f
	bic r2, r2, #4
	orr r0, r2, r0, lsr #29
	strb r0, [r5, r4]
	cmp r1, #0
	beq _0238560C
	mov r8, #0
	mov r6, #0x7f
_023855D8:
	mov r1, r8
	add r0, r5, r4
	bl FUN_02385C80
	movs r7, r0
	beq _02385600
	mov r2, r6
	add r1, r5, r4
	bl FUN_02385BE4
	mov r0, r7
	bl FUN_02385C4C
_02385600:
	add r8, r8, #1
	cmp r8, #0x10
	blt _023855D8
_0238560C:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02385614: .4byte 0x0380794C
	arm_func_end FUN_023855A0

	arm_func_start FUN_02385618
FUN_02385618: @ 0x02385618
	push {r4, r5, r6, r7, r8, lr}
	ldr r3, _023856DC @ =0x0380794C
	mov r2, #0x24
	mla r6, r0, r2, r3
	mov r8, r1
	mov r7, #0
	mov r4, #0x7f
_02385634:
	mov r0, r6
	mov r1, r7
	bl FUN_02385C80
	movs r5, r0
	beq _0238565C
	mov r1, r6
	mov r2, r4
	bl FUN_02385BE4
	mov r0, r5
	bl FUN_02385C4C
_0238565C:
	add r7, r7, #1
	cmp r7, #0x10
	blt _02385634
	bl FUN_023841B4
	mov r4, #0
	mov r5, r4
	b _0238569C
_02385678:
	mov r0, r6
	mov r1, r5
	bl FUN_02385EF4
	cmp r0, #0
	beq _02385698
	mov r0, r6
	bl FUN_02385D04
	b _023856A4
_02385698:
	add r4, r4, #1
_0238569C:
	cmp r4, r8
	blo _02385678
_023856A4:
	bl FUN_02384164
	ldr r0, _023856E0 @ =0x03807408
	ldr r3, [r0]
	cmp r3, #0
	beq _023856D4
	ldrb r1, [r6, #1]
	mov r0, #0x24
	mul r2, r1, r0
	add r1, r3, #0x40
	ldr r0, [r1, r2]
	add r0, r0, r4
	str r0, [r1, r2]
_023856D4:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_023856DC: .4byte 0x0380794C
_023856E0: .4byte 0x03807408
	arm_func_end FUN_02385618

	arm_func_start FUN_023856E4
FUN_023856E4: @ 0x023856E4
	push {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	ldr r5, _0238574C @ =0x0380794C
	mov r8, r1
	mov r7, r2
	mov r6, #0
	b _02385734
_02385704:
	tst r8, #1
	beq _0238572C
	mov r1, r6
	add r0, r5, r4
	bl FUN_02385C80
	cmp r0, #0
	beq _0238572C
	mov r2, r7
	add r1, r5, r4
	bl FUN_02386ACC
_0238572C:
	add r6, r6, #1
	lsr r8, r8, #1
_02385734:
	cmp r6, #0x10
	bge _02385744
	cmp r8, #0
	bne _02385704
_02385744:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0238574C: .4byte 0x0380794C
	arm_func_end FUN_023856E4

	arm_func_start FUN_02385750
FUN_02385750: @ 0x02385750
	push {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	lsl r0, r2, #0x10
	ldr r5, _023857BC @ =0x0380794C
	mov r7, r1
	mov r6, #0
	lsr r8, r0, #0x10
	b _023857A4
_02385774:
	tst r7, #1
	beq _0238579C
	mov r1, r6
	add r0, r5, r4
	bl FUN_02385C80
	cmp r0, #0
	strhne r8, [r0, #0x1e]
	ldrbne r1, [r0]
	orrne r1, r1, #0x80
	strbne r1, [r0]
_0238579C:
	add r6, r6, #1
	lsr r7, r7, #1
_023857A4:
	cmp r6, #0x10
	bge _023857B4
	cmp r7, #0
	bne _02385774
_023857B4:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_023857BC: .4byte 0x0380794C
	arm_func_end FUN_02385750

	arm_func_start FUN_023857C0
FUN_023857C0: @ 0x023857C0
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r6, _02385848 @ =0x0380794C
	mov r7, #0
	mov sl, r0
	mov sb, r1
	mov fp, r7
	mov r4, #0x24
_023857DC:
	mul r5, r7, r4
	ldrb r0, [r6, r5]
	lsl r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _02385834
	mov r8, fp
	b _0238582C
_023857F8:
	mov r1, r8
	add r0, r6, r5
	bl FUN_02385C80
	cmp r0, #0
	beq _02385828
	ldr r0, [r0, #0x28]
	cmp sl, r0
	cmpls r0, sb
	bhi _02385828
	add r0, r6, r5
	bl FUN_02385D04
	b _02385834
_02385828:
	add r8, r8, #1
_0238582C:
	cmp r8, #0x10
	blt _023857F8
_02385834:
	add r7, r7, #1
	cmp r7, #0x10
	blt _023857DC
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02385848: .4byte 0x0380794C
	arm_func_end FUN_023857C0

	arm_func_start FUN_0238584C
FUN_0238584C: @ 0x0238584C
	push {r4, r5, r6, r7, r8, lr}
	ldr r4, _023858A4 @ =0x0380794C
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r8, #0x24
_02385864:
	mul r0, r5, r8
	ldrb r1, [r4, r0]
	add r0, r4, r0
	lsl r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	beq _02385890
	ldr r1, [r0, #0x20]
	cmp r7, r1
	cmpls r1, r6
	bhi _02385890
	bl FUN_02385D04
_02385890:
	add r5, r5, #1
	cmp r5, #0x10
	blt _02385864
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_023858A4: .4byte 0x0380794C
	arm_func_end FUN_0238584C

	arm_func_start FUN_023858A8
FUN_023858A8: @ 0x023858A8
	push {r3, lr}
	ldr lr, _023858E8 @ =0x0380794C
	mov ip, #0x24
	mla ip, r0, ip, lr
	cmp r3, #1
	beq _023858D4
	cmp r3, #2
	beq _023858DC
	cmp r3, #4
	streq r2, [ip, r1]
	b _023858E0
_023858D4:
	strb r2, [ip, r1]
	b _023858E0
_023858DC:
	strh r2, [ip, r1]
_023858E0:
	pop {r3, lr}
	bx lr
	.align 2, 0
_023858E8: .4byte 0x0380794C
	arm_func_end FUN_023858A8

	arm_func_start FUN_023858EC
FUN_023858EC: @ 0x023858EC
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0x24
	mul r5, r0, r4
	mov r8, r3
	lsl r0, r8, #0x10
	ldr r7, [sp, #0x28]
	mov sl, r1
	mov sb, r2
	mov r6, #0
	lsr fp, r0, #0x10
	and r4, r8, #0xff
	b _0238596C
_0238591C:
	tst sl, #1
	beq _02385964
	ldr r0, _02385984 @ =0x0380794C
	mov r1, r6
	add r0, r0, r5
	bl FUN_02385C80
	cmp r0, #0
	beq _02385964
	cmp r7, #1
	beq _02385958
	cmp r7, #2
	beq _02385960
	cmp r7, #4
	streq r8, [r0, sb]
	b _02385964
_02385958:
	strb r4, [r0, sb]
	b _02385964
_02385960:
	strh fp, [r0, sb]
_02385964:
	add r6, r6, #1
	lsr sl, sl, #1
_0238596C:
	cmp r6, #0x10
	bge _0238597C
	cmp sl, #0
	bne _0238591C
_0238597C:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02385984: .4byte 0x0380794C
	arm_func_end FUN_023858EC

	arm_func_start FUN_02385988
FUN_02385988: @ 0x02385988
	ldr r1, _023859C0 @ =0x038073EC
	bic r2, r0, #3
	str r2, [r1, #4]
	add r0, r2, #0x10
	str r0, [r1, #8]
	ldr r0, [r2]
	str r0, [r1, #0xc]
	ldr r0, [r2, #4]
	str r0, [r1, #0x10]
	ldr r0, [r2, #8]
	str r0, [r1, #0x14]
	ldr r0, [r2, #0xc]
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_023859C0: .4byte 0x038073EC
	arm_func_end FUN_02385988

	arm_func_start FUN_023859C4
FUN_023859C4: @ 0x023859C4
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_02385494
	mov r4, r0
	mov r0, r5
	bl FUN_02385494
	orr r4, r4, r0, lsl #8
	mov r0, r5
	bl FUN_02385494
	orr r0, r4, r0, lsl #16
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_023859C4

	arm_func_start FUN_023859F4
FUN_023859F4: @ 0x023859F4
	push {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _02385AE8
_02385A0C: @ jump table
	b _02385A20 @ case 0
	b _02385A2C @ case 1
	b _02385A4C @ case 2
	b _02385A88 @ case 3
	b _02385A6C @ case 4
_02385A20:
	bl FUN_02385494
	mov r5, r0
	b _02385AE8
_02385A2C:
	bl FUN_02385494
	mov r5, r0
	mov r0, r4
	bl FUN_02385494
	orr r0, r5, r0, lsl #8
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	b _02385AE8
_02385A4C:
	mov r5, #0
_02385A50:
	mov r0, r4
	bl FUN_02385494
	and r1, r0, #0x7f
	tst r0, #0x80
	orr r5, r1, r5, lsl #7
	bne _02385A50
	b _02385AE8
_02385A6C:
	bl FUN_02385494
	mov r1, r0
	mov r0, r6
	bl FUN_02386A44
	cmp r0, #0
	ldrshne r5, [r0]
	b _02385AE8
_02385A88:
	bl FUN_02385494
	mov r5, r0
	mov r0, r4
	bl FUN_02385494
	orr r0, r5, r0, lsl #8
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, r4
	lsl r5, r1, #0x10
	bl FUN_02385494
	mov r6, r0
	mov r0, r4
	bl FUN_02385494
	orr r0, r6, r0, lsl #8
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	bl FUN_023840C4
	lsl r1, r4, #0x10
	asr r1, r1, #0x10
	sub r1, r1, r5, asr #16
	add r1, r1, #1
	mul r1, r0, r1
	asr r0, r1, #0x10
	add r5, r0, r5, asr #16
_02385AE8:
	mov r0, r5
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end FUN_023859F4

	arm_func_start FUN_02385AF4
FUN_02385AF4: @ 0x02385AF4
	push {r4, lr}
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x24]
	str r0, [r4, #0x28]
	ldrb r1, [r4]
	mov r2, #0xff
	orr r1, r1, #2
	bic ip, r1, #4
	strb r1, [r4]
	and r1, ip, #0xff
	bic r3, r1, #8
	strb ip, [r4]
	and r1, r3, #0xff
	bic ip, r1, #0x10
	strb r3, [r4]
	and r1, ip, #0xff
	bic r3, r1, #0x20
	and r1, r3, #0xff
	orr r1, r1, #0x40
	strb ip, [r4]
	bic r1, r1, #0x80
	strb r1, [r4]
	strb r0, [r4, #0x3b]
	strh r0, [r4, #2]
	mov r1, #0x40
	strb r1, [r4, #0x12]
	mov r1, #0x7f
	strb r1, [r4, #4]
	strb r1, [r4, #5]
	strh r0, [r4, #0xa]
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #6]
	strh r0, [r4, #0xc]
	strb r2, [r4, #0xe]
	strb r2, [r4, #0xf]
	strb r2, [r4, #0x10]
	strb r2, [r4, #0x11]
	strb r1, [r4, #1]
	mov r1, #2
	strb r1, [r4, #7]
	mov r1, #0x3c
	strb r1, [r4, #0x14]
	strb r0, [r4, #0x15]
	strh r0, [r4, #0x16]
	strb r0, [r4, #0x13]
	add r0, r2, #0xff00
	strh r0, [r4, #0x1e]
	add r0, r4, #0x18
	bl FUN_02384F94
	mov r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x3c]
	pop {r4, lr}
	bx lr
	arm_func_end FUN_02385AF4

	arm_func_start FUN_02385BD4
FUN_02385BD4: @ 0x02385BD4
	str r1, [r0, #0x24]
	add r1, r1, r2
	str r1, [r0, #0x28]
	bx lr
	arm_func_end FUN_02385BD4

	arm_func_start FUN_02385BE4
FUN_02385BE4: @ 0x02385BE4
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r4, r0
	mov r2, #0
	bl FUN_02385D9C
	ldr r5, [r4, #0x3c]
	and r6, r7, #0xff
	mov r4, #1
	b _02385C3C
_02385C08:
	mov r0, r5
	bl FUN_02384B44
	cmp r0, #0
	beq _02385C38
	cmp r7, #0
	blt _02385C2C
	mov r0, r5
	mov r1, r6
	bl FUN_02384B1C
_02385C2C:
	mov r0, r5
	strb r4, [r5, #0x22]
	bl FUN_02384B38
_02385C38:
	ldr r5, [r5, #0x50]
_02385C3C:
	cmp r5, #0
	bne _02385C08
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_02385BE4

	arm_func_start FUN_02385C4C
FUN_02385C4C: @ 0x02385C4C
	push {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0x3c]
	b _02385C68
_02385C5C:
	mov r0, r4
	bl FUN_02384D20
	ldr r4, [r4, #0x50]
_02385C68:
	cmp r4, #0
	bne _02385C5C
	mov r0, #0
	str r0, [r5, #0x3c]
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_02385C4C

	arm_func_start FUN_02385C80
FUN_02385C80: @ 0x02385C80
	cmp r1, #0xf
	movgt r0, #0
	bxgt lr
	add r0, r0, r1
	ldrb r1, [r0, #8]
	cmp r1, #0xff
	moveq r0, #0
	ldrne r0, _02385CA8 @ =0x03807B8C
	addne r0, r0, r1, lsl #6
	bx lr
	.align 2, 0
_02385CA8: .4byte 0x03807B8C
	arm_func_end FUN_02385C80

	arm_func_start FUN_02385CAC
FUN_02385CAC: @ 0x02385CAC
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r1
	bl FUN_02385C80
	movs r5, r0
	beq _02385CF8
	mov r1, r6
	mvn r2, #0
	bl FUN_02385BE4
	mov r0, r5
	bl FUN_02385C4C
	add ip, r6, #8
	ldrb r2, [ip, r4]
	ldr r3, _02385D00 @ =0x03807B8C
	mov r0, #0xff
	ldrb r1, [r3, r2, lsl #6]
	bic r1, r1, #1
	strb r1, [r3, r2, lsl #6]
	strb r0, [ip, r4]
_02385CF8:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02385D00: .4byte 0x03807B8C
	arm_func_end FUN_02385CAC

	arm_func_start FUN_02385D04
FUN_02385D04: @ 0x02385D04
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
_02385D10:
	mov r0, r5
	mov r1, r4
	bl FUN_02385CAC
	add r4, r4, #1
	cmp r4, #0x10
	blt _02385D10
	ldrb r0, [r5]
	bic r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_02385D04

	arm_func_start FUN_02385D3C
FUN_02385D3C: @ 0x02385D3C
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	cmp r1, #1
	bne _02385D5C
	mov r1, #0
	strb r1, [r5, #0x22]
	bl FUN_02384D20
_02385D5C:
	ldr r1, [r4, #0x3c]
	cmp r1, r5
	ldreq r0, [r5, #0x50]
	streq r0, [r4, #0x3c]
	beq _02385D94
	b _02385D88
_02385D74:
	cmp r0, r5
	ldreq r0, [r5, #0x50]
	streq r0, [r1, #0x50]
	beq _02385D94
	mov r1, r0
_02385D88:
	ldr r0, [r1, #0x50]
	cmp r0, #0
	bne _02385D74
_02385D94:
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_02385D3C

	arm_func_start FUN_02385D9C
FUN_02385D9C: @ 0x02385D9C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldrb r0, [sl, #7]
	ldrb r6, [sl, #4]
	ldrb r3, [sl, #5]
	ldrb fp, [r1, #5]
	lsl r5, r0, #6
	lsl r8, r3, #1
	ldrb r4, [sl, #1]
	ldrsb r7, [sl, #6]
	lsl sb, r6, #1
	ldr r0, _02385EF0 @ =0x03806670
	mul r6, r7, r5
	lsl r3, fp, #1
	ldrsh sb, [r0, sb]
	ldrsh r7, [r0, r8]
	ldrsh r0, [r0, r3]
	add r8, sb, r7
	ldrsb r3, [sl, #8]
	cmp r4, #0x7f
	mulne r4, r3, r4
	addne r3, r4, #0x40
	mov r4, #0x8000
	ldrsh r5, [sl, #0xc]
	mov sb, r2
	add r2, r5, r6, asr #7
	ldrsh r7, [sl, #0xa]
	ldrsh r1, [r1, #6]
	ldrsb r5, [sl, #9]
	asrne r3, r3, #7
	add r0, r0, r8
	rsb r4, r4, #0
	cmp r0, r4
	movlt r0, r4
	mov r4, #0x8000
	add r1, r7, r1
	rsb r4, r4, #0
	cmp r1, r4
	movlt r1, r4
	add r3, r3, r5
	mvn r4, #0x7f
	cmp r3, r4
	movlt r3, r4
	blt _02385E54
	cmp r3, #0x7f
	movgt r3, #0x7f
_02385E54:
	lsl r0, r0, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	lsl r1, r1, #0x10
	ldr r8, [sl, #0x3c]
	asr r6, r0, #0x10
	asr r5, r2, #0x10
	asr r4, r3, #0x18
	asr r7, r1, #0x10
	mov fp, #1
	b _02385EE0
_02385E80:
	strh r7, [r8, #6]
	ldrb r0, [r8, #2]
	cmp r0, #3
	beq _02385EDC
	strh r6, [r8, #0xc]
	strh r5, [r8, #0xe]
	strb r4, [r8, #0xb]
	ldrb r0, [sl, #1]
	strb r0, [r8, #4]
	ldrh r0, [sl, #0x18]
	strh r0, [r8, #0x28]
	ldrh r0, [sl, #0x1a]
	strh r0, [r8, #0x2a]
	ldrh r0, [sl, #0x1c]
	strh r0, [r8, #0x2c]
	ldr r0, [r8, #0x34]
	cmp r0, #0
	bne _02385EDC
	cmp sb, #0
	beq _02385EDC
	mov r0, r8
	strb fp, [r8, #0x22]
	bl FUN_02384B38
_02385EDC:
	ldr r8, [r8, #0x50]
_02385EE0:
	cmp r8, #0
	bne _02385E80
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02385EF0: .4byte 0x03806670
	arm_func_end FUN_02385D9C

	arm_func_start FUN_02385EF4
FUN_02385EF4: @ 0x02385EF4
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r2, #0
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	mov r7, r0
	mov sl, r2
_02385F10:
	mov r0, r7
	mov r1, sl
	bl FUN_02385C80
	movs r8, r0
	ldrne r0, [r8, #0x28]
	cmpne r0, #0
	beq _02386A10
	ldr r0, [r8, #0x3c]
	b _02385F6C
_02385F34:
	ldr r1, [r0, #0x34]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0x34]
	ldrb r1, [r0, #3]
	lsl r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	bne _02385F68
	ldr r2, [r0, #0x14]
	ldr r1, [r0, #0x18]
	cmp r2, r1
	addlt r1, r2, #1
	strlt r1, [r0, #0x14]
_02385F68:
	ldr r0, [r0, #0x50]
_02385F6C:
	cmp r0, #0
	bne _02385F34
	ldrb r1, [r8]
	lsl r0, r1, #0x1b
	lsrs r0, r0, #0x1f
	beq _02385F9C
	ldr r0, [r8, #0x3c]
	cmp r0, #0
	movne r0, #0
	bne _023869F4
	bic r0, r1, #0x10
	strb r0, [r8]
_02385F9C:
	ldr r0, [r8, #0x20]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r8, #0x20]
	cmpgt r0, #0
	movgt r0, #0
	bgt _023869F4
	ldr r0, [r8, #0x28]
	bl FUN_02385988
	ldr r0, _02386A38 @ =0x0000FFFF
	sub fp, r0, #0x10000
	b _023869D4
_02385FCC:
	mov r0, r8
	mov sb, #0
	mov r4, #1
	bl FUN_02385494
	mov r6, r0
	cmp r6, #0xa2
	bne _02386000
	mov r0, r8
	bl FUN_02385494
	mov r6, r0
	ldrb r0, [r8]
	lsl r0, r0, #0x19
	lsr r4, r0, #0x1f
_02386000:
	cmp r6, #0xa0
	bne _0238601C
	mov r0, r8
	bl FUN_02385494
	mov r6, r0
	mov r5, #3
	mov sb, #1
_0238601C:
	cmp r6, #0xa1
	bne _02386038
	mov r0, r8
	bl FUN_02385494
	mov r6, r0
	mov r5, #4
	mov sb, #1
_02386038:
	tst r6, #0x80
	bne _023862BC
	mov r0, r8
	bl FUN_02385494
	cmp sb, #0
	str r0, [sp, #0xc]
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl FUN_023859F4
	cmp r4, #0
	mov r4, r0
	ldrsb r0, [r8, #0x13]
	add sb, r6, r0
	beq _023869D4
	cmp sb, #0
	movlt sb, #0
	blt _0238608C
	cmp sb, #0x7f
	movgt sb, #0x7f
_0238608C:
	ldrb r1, [r8]
	lsl r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	bne _02386290
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02386290
	lsl r0, r1, #0x1c
	mov r6, #0
	lsrs r0, r0, #0x1f
	ldrne r6, [r8, #0x3c]
	cmpne r6, #0
	strbne sb, [r6, #8]
	ldrne r0, [sp, #0xc]
	strbne r0, [r6, #9]
	cmp r6, #0
	bne _023861C0
	ldr r0, [r7, #0x20]
	ldrh r1, [r8, #2]
	mov r2, sb
	add r3, sp, #0x16
	bl FUN_02386B4C
	cmp r0, #0
	beq _02386290
	ldrb r0, [sp, #0x16]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02386290
_023860FC: @ jump table
	b _02386290 @ case 0
	b _02386110 @ case 1
	b _02386118 @ case 2
	b _02386120 @ case 3
	b _02386110 @ case 4
_02386110:
	ldr r1, _02386A38 @ =0x0000FFFF
	b _02386124
_02386118:
	mov r1, #0x3f00
	b _02386124
_02386120:
	mov r1, #0xc000
_02386124:
	ldrh r0, [r8, #0x1e]
	ldr r3, _02386A3C @ =0x037FDAD0
	str r8, [sp]
	ldrb r2, [r8]
	and r0, r1, r0
	lsl r2, r2, #0x18
	ldrb r6, [r7, #4]
	ldrb r1, [r8, #0x12]
	lsr r2, r2, #0x1f
	add r1, r6, r1
	bl FUN_02384B54
	movs r6, r0
	beq _02386290
	ldrb r0, [r8]
	lsl r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	movne r3, fp
	bne _02386178
	cmp r4, #0
	movgt r3, r4
	movle r3, fp
_02386178:
	ldr r2, [sp, #0xc]
	ldr r1, [r7, #0x20]
	mov r0, r6
	str r1, [sp]
	add r1, sp, #0x16
	str r1, [sp, #4]
	mov r1, sb
	bl FUN_02386D0C
	cmp r0, #0
	bne _023861B4
	mov r0, #0
	strb r0, [r6, #0x22]
	mov r0, r6
	bl FUN_02384D20
	b _02386290
_023861B4:
	ldr r0, [r8, #0x3c]
	str r0, [r6, #0x50]
	str r6, [r8, #0x3c]
_023861C0:
	ldrb r1, [r8, #0xe]
	cmp r1, #0xff
	beq _023861D4
	mov r0, r6
	bl FUN_02384AD8
_023861D4:
	ldrb r1, [r8, #0xf]
	cmp r1, #0xff
	beq _023861E8
	mov r0, r6
	bl FUN_02384AF8
_023861E8:
	ldrb r1, [r8, #0x10]
	cmp r1, #0xff
	beq _023861FC
	mov r0, r6
	bl FUN_02384B14
_023861FC:
	ldrb r1, [r8, #0x11]
	cmp r1, #0xff
	beq _02386210
	mov r0, r6
	bl FUN_02384B1C
_02386210:
	ldrsh r0, [r8, #0x16]
	strh r0, [r6, #0x32]
	ldrb r0, [r8]
	lsl r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	beq _02386240
	ldrsh r1, [r6, #0x32]
	ldrb r0, [r8, #0x14]
	sub r0, r0, sb
	lsl r0, r0, #0x16
	add r0, r1, r0, asr #16
	strh r0, [r6, #0x32]
_02386240:
	ldrb r0, [r8, #0x15]
	cmp r0, #0
	bne _0238626C
	cmp r4, #0
	movgt r0, r4
	movle r0, fp
	str r0, [r6, #0x18]
	ldrb r0, [r6, #3]
	bic r0, r0, #4
	strb r0, [r6, #3]
	b _02386288
_0238626C:
	mul r1, r0, r0
	ldrsh r0, [r6, #0x32]
	cmp r0, #0
	rsblt r0, r0, #0
	mul r0, r1, r0
	asr r0, r0, #0xb
	str r0, [r6, #0x18]
_02386288:
	mov r0, #0
	str r0, [r6, #0x14]
_02386290:
	strb sb, [r8, #0x14]
	ldrb r0, [r8]
	lsl r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _023869D4
	str r4, [r8, #0x20]
	cmp r4, #0
	ldrbeq r0, [r8]
	orreq r0, r0, #0x10
	strbeq r0, [r8]
	b _023869D4
_023862BC:
	and r0, r6, #0xf0
	cmp r0, #0xc0
	bgt _023862F0
	bge _02386438
	cmp r0, #0x90
	bgt _023862E4
	bge _0238635C
	cmp r0, #0x80
	beq _02386314
	b _023869D4
_023862E4:
	cmp r0, #0xb0
	beq _023866E8
	b _023869D4
_023862F0:
	cmp r0, #0xe0
	bgt _02386308
	bge _02386694
	cmp r0, #0xd0
	beq _02386438
	b _023869D4
_02386308:
	cmp r0, #0xf0
	beq _02386930
	b _023869D4
_02386314:
	cmp sb, #0
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl FUN_023859F4
	cmp r4, #0
	beq _023869D4
	cmp r6, #0x80
	beq _02386348
	cmp r6, #0x81
	beq _02386350
	b _023869D4
_02386348:
	str r0, [r8, #0x20]
	b _023869D4
_02386350:
	cmp r0, #0x10000
	strhlt r0, [r8, #2]
	b _023869D4
_0238635C:
	cmp r6, #0x93
	beq _02386378
	cmp r6, #0x94
	beq _023863D8
	cmp r6, #0x95
	beq _023863F4
	b _023869D4
_02386378:
	mov r0, r8
	bl FUN_02385494
	mov r6, r0
	mov r0, r8
	bl FUN_023859C4
	cmp r4, #0
	mov sb, r0
	beq _023869D4
	mov r1, r6
	mov r0, r7
	bl FUN_02385C80
	movs r4, r0
	cmpne r4, r8
	beq _023869D4
	mov r1, r7
	mov r2, fp
	bl FUN_02385BE4
	mov r0, r4
	bl FUN_02385C4C
	mov r0, r4
	mov r2, sb
	ldr r1, [r8, #0x24]
	bl FUN_02385BD4
	b _023869D4
_023863D8:
	mov r0, r8
	bl FUN_023859C4
	cmp r4, #0
	ldrne r1, [r8, #0x24]
	addne r0, r1, r0
	strne r0, [r8, #0x28]
	b _023869D4
_023863F4:
	mov r0, r8
	bl FUN_023859C4
	cmp r4, #0
	beq _023869D4
	ldrb r1, [r8, #0x3b]
	cmp r1, #3
	bhs _023869D4
	add r1, r8, r1, lsl #2
	ldr r2, [r8, #0x28]
	str r2, [r1, #0x2c]
	ldrb r1, [r8, #0x3b]
	add r1, r1, #1
	strb r1, [r8, #0x3b]
	ldr r1, [r8, #0x24]
	add r0, r1, r0
	str r0, [r8, #0x28]
	b _023869D4
_02386438:
	cmp sb, #0
	movne r2, r5
	moveq r2, #0
	mov r0, r8
	mov r1, r7
	bl FUN_023859F4
	cmp r4, #0
	strb r0, [sp, #0x14]
	beq _023869D4
	sub r1, r6, #0xc0
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _023869D4
_0238646C: @ jump table
	b _02386664 @ case 0
	b _023864CC @ case 1
	b _023864E4 @ case 2
	b _0238664C @ case 3
	b _02386658 @ case 4
	b _023864F0 @ case 5
	b _023864FC @ case 6
	b _02386508 @ case 7
	b _023865C8 @ case 8
	b _02386610 @ case 9
	b _02386530 @ case 10
	b _0238653C @ case 11
	b _02386548 @ case 12
	b _02386554 @ case 13
	b _02386630 @ case 14
	b _02386524 @ case 15
	b _02386560 @ case 16
	b _0238656C @ case 17
	b _02386578 @ case 18
	b _02386584 @ case 19
	b _02386590 @ case 20
	b _023864D8 @ case 21
	b _02386674 @ case 22
	b _023865FC @ case 23
_023864CC:
	and r0, r0, #0xff
	strb r0, [r8, #4]
	b _023869D4
_023864D8:
	and r0, r0, #0xff
	strb r0, [r8, #5]
	b _023869D4
_023864E4:
	and r0, r0, #0xff
	strb r0, [r7, #5]
	b _023869D4
_023864F0:
	and r0, r0, #0xff
	strb r0, [r8, #7]
	b _023869D4
_023864FC:
	and r0, r0, #0xff
	strb r0, [r8, #0x12]
	b _023869D4
_02386508:
	and r0, r0, #0xff
	lsl r0, r0, #0x1f
	ldrb r1, [r8]
	bic r1, r1, #2
	orr r0, r1, r0, lsr #30
	strb r0, [r8]
	b _023869D4
_02386524:
	and r0, r0, #0xff
	strb r0, [r8, #0x15]
	b _023869D4
_02386530:
	and r0, r0, #0xff
	strb r0, [r8, #0x1a]
	b _023869D4
_0238653C:
	and r0, r0, #0xff
	strb r0, [r8, #0x19]
	b _023869D4
_02386548:
	and r0, r0, #0xff
	strb r0, [r8, #0x18]
	b _023869D4
_02386554:
	and r0, r0, #0xff
	strb r0, [r8, #0x1b]
	b _023869D4
_02386560:
	and r0, r0, #0xff
	strb r0, [r8, #0xe]
	b _023869D4
_0238656C:
	and r0, r0, #0xff
	strb r0, [r8, #0xf]
	b _023869D4
_02386578:
	and r0, r0, #0xff
	strb r0, [r8, #0x10]
	b _023869D4
_02386584:
	and r0, r0, #0xff
	strb r0, [r8, #0x11]
	b _023869D4
_02386590:
	ldrb r1, [r8, #0x3b]
	cmp r1, #3
	bhs _023869D4
	add r2, r8, r1, lsl #2
	and r1, r0, #0xff
	ldr r0, [r8, #0x28]
	str r0, [r2, #0x2c]
	ldrb r0, [r8, #0x3b]
	add r0, r8, r0
	strb r1, [r0, #0x38]
	ldrb r0, [r8, #0x3b]
	add r0, r0, #1
	strb r0, [r8, #0x3b]
	b _023869D4
_023865C8:
	and r0, r0, #0xff
	lsl r1, r0, #0x1f
	ldrb r2, [r8]
	mov r0, r8
	bic r2, r2, #8
	orr r1, r2, r1, lsr #28
	strb r1, [r8]
	mov r1, r7
	mov r2, fp
	bl FUN_02385BE4
	mov r0, r8
	bl FUN_02385C4C
	b _023869D4
_023865FC:
	and r2, r0, #0xff
	mov r0, r8
	mov r1, r7
	bl FUN_02386ACC
	b _023869D4
_02386610:
	and r1, r0, #0xff
	ldrsb r0, [r8, #0x13]
	add r0, r1, r0
	strb r0, [r8, #0x14]
	ldrb r0, [r8]
	orr r0, r0, #0x20
	strb r0, [r8]
	b _023869D4
_02386630:
	and r0, r0, #0xff
	lsl r0, r0, #0x1f
	ldrb r1, [r8]
	bic r1, r1, #0x20
	orr r0, r1, r0, lsr #26
	strb r0, [r8]
	b _023869D4
_0238664C:
	ldrsb r0, [sp, #0x14]
	strb r0, [r8, #0x13]
	b _023869D4
_02386658:
	ldrsb r0, [sp, #0x14]
	strb r0, [r8, #6]
	b _023869D4
_02386664:
	and r0, r0, #0xff
	sub r0, r0, #0x40
	strb r0, [r8, #8]
	b _023869D4
_02386674:
	ldr r1, _02386A40 @ =0x038073EC
	ldr r1, [r1]
	cmp r1, #0
	beq _023869D4
	and r1, r0, #0xff
	mov r0, r7
	bl FUN_02386A44
	b _023869D4
_02386694:
	cmp sb, #0
	movne r2, r5
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl FUN_023859F4
	lsl r0, r0, #0x10
	cmp r4, #0
	asr r0, r0, #0x10
	beq _023869D4
	cmp r6, #0xe0
	beq _023866E0
	cmp r6, #0xe1
	beq _023866D8
	cmp r6, #0xe3
	strheq r0, [r8, #0x16]
	b _023869D4
_023866D8:
	strh r0, [r7, #0x18]
	b _023869D4
_023866E0:
	strh r0, [r8, #0x1c]
	b _023869D4
_023866E8:
	mov r0, r8
	bl FUN_02385494
	cmp sb, #0
	movne r2, r5
	mov sb, r0
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl FUN_023859F4
	lsl r0, r0, #0x10
	mov r1, sb
	asr sb, r0, #0x10
	mov r0, r7
	bl FUN_02386A44
	cmp r4, #0
	mov r4, r0
	cmpne r4, #0
	beq _023869D4
	sub r0, r6, #0xb0
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _023869D4
_02386740: @ jump table
	b _02386778 @ case 0
	b _02386780 @ case 1
	b _02386790 @ case 2
	b _023867A0 @ case 3
	b _023867B0 @ case 4
	b _023867CC @ case 5
	b _023867F0 @ case 6
	b _023869D4 @ case 7
	b _02386828 @ case 8
	b _02386854 @ case 9
	b _02386880 @ case 10
	b _023868AC @ case 11
	b _023868D8 @ case 12
	b _02386904 @ case 13
_02386778:
	strh sb, [r4]
	b _023869D4
_02386780:
	ldrsh r0, [r4]
	add r0, r0, sb
	strh r0, [r4]
	b _023869D4
_02386790:
	ldrsh r0, [r4]
	sub r0, r0, sb
	strh r0, [r4]
	b _023869D4
_023867A0:
	ldrsh r0, [r4]
	mul r1, r0, sb
	strh r1, [r4]
	b _023869D4
_023867B0:
	cmp sb, #0
	beq _023869D4
	mov r1, sb
	ldrsh r0, [r4]
	bl FUN_0238E4C8
	strh r0, [r4]
	b _023869D4
_023867CC:
	cmp sb, #0
	ldrshge r0, [r4]
	lslge r0, r0, sb
	strhge r0, [r4]
	ldrshlt r1, [r4]
	rsblt r0, sb, #0
	asrlt r0, r1, r0
	strhlt r0, [r4]
	b _023869D4
_023867F0:
	cmp sb, #0
	rsblt r0, sb, #0
	lsllt r0, r0, #0x10
	mov r6, #0
	asrlt sb, r0, #0x10
	movlt r6, #1
	bl FUN_023840C4
	add r1, sb, #1
	mul r1, r0, r1
	asr r0, r1, #0x10
	cmp r6, #0
	rsbne r0, r0, #0
	strh r0, [r4]
	b _023869D4
_02386828:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	lsl r0, r0, #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _023869D4
_02386854:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	lsl r0, r0, #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _023869D4
_02386880:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movgt r0, #1
	movle r0, #0
	and r0, r0, #0xff
	lsl r0, r0, #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _023869D4
_023868AC:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	lsl r0, r0, #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _023869D4
_023868D8:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	lsl r0, r0, #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _023869D4
_02386904:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	lsl r0, r0, #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _023869D4
_02386930:
	cmp r4, #0
	beq _023869D4
	sub r0, r6, #0xfc
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _023869D4
_02386948: @ jump table
	b _02386980 @ case 0
	b _02386958 @ case 1
	b _023869D4 @ case 2
	b _023869CC @ case 3
_02386958:
	ldrb r0, [r8, #0x3b]
	cmp r0, #0
	beq _023869D4
	sub r0, r0, #1
	strb r0, [r8, #0x3b]
	and r0, r0, #0xff
	add r0, r8, r0, lsl #2
	ldr r0, [r0, #0x2c]
	str r0, [r8, #0x28]
	b _023869D4
_02386980:
	ldrb r0, [r8, #0x3b]
	cmp r0, #0
	beq _023869D4
	add r1, r8, r0
	ldrb r0, [r1, #0x37]
	cmp r0, #0
	beq _023869B4
	sub r0, r0, #1
	ands r0, r0, #0xff
	ldrbeq r0, [r8, #0x3b]
	subeq r0, r0, #1
	strbeq r0, [r8, #0x3b]
	beq _023869D4
_023869B4:
	strb r0, [r1, #0x37]
	ldrb r0, [r8, #0x3b]
	add r0, r8, r0, lsl #2
	ldr r0, [r0, #0x28]
	str r0, [r8, #0x28]
	b _023869D4
_023869CC:
	mvn r0, #0
	b _023869F4
_023869D4:
	ldr r0, [r8, #0x20]
	cmp r0, #0
	bne _023869F0
	ldrb r0, [r8]
	lsl r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	beq _02385FCC
_023869F0:
	mov r0, #0
_023869F4:
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x10]
	beq _02386A10
	mov r0, r7
	mov r1, sl
	bl FUN_02385CAC
_02386A10:
	add sl, sl, #1
	cmp sl, #0x10
	blt _02385F10
	ldr r0, [sp, #0x10]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x24
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02386A38: .4byte 0x0000FFFF
_02386A3C: .4byte 0x037FDAD0
_02386A40: .4byte 0x038073EC
	arm_func_end FUN_02385EF4

	arm_func_start FUN_02386A44
FUN_02386A44: @ 0x02386A44
	ldr r2, _02386A84 @ =0x03807408
	ldr r3, [r2]
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	cmp r1, #0x10
	addge r2, r3, #0x260
	subge r0, r1, #0x10
	addge r0, r2, r0, lsl #1
	bxge lr
	ldrb r2, [r0, #1]
	add r3, r3, #0x20
	mov r0, #0x24
	mla r0, r2, r0, r3
	add r0, r0, r1, lsl #1
	bx lr
	.align 2, 0
_02386A84: .4byte 0x03807408
	arm_func_end FUN_02386A44

	arm_func_start FUN_02386A88
FUN_02386A88: @ 0x02386A88
	ldr ip, _02386AC8 @ =0x03807B8C
	mov r0, #0
	b _02386AB8
_02386A94:
	ldrb r1, [ip, r0, lsl #6]
	lsl r3, r0, #6
	lsl r2, r1, #0x1f
	lsrs r2, r2, #0x1f
	biceq r1, r1, #1
	orreq r1, r1, #1
	strbeq r1, [ip, r3]
	bxeq lr
	add r0, r0, #1
_02386AB8:
	cmp r0, #0x20
	blt _02386A94
	mvn r0, #0
	bx lr
	.align 2, 0
_02386AC8: .4byte 0x03807B8C
	arm_func_end FUN_02386A88

	arm_func_start FUN_02386ACC
FUN_02386ACC: @ 0x02386ACC
	push {r4, lr}
	mov r4, r0
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _02386B44
_02386AE0: @ jump table
	b _02386AF0 @ case 0
	b _02386B00 @ case 1
	b _02386B10 @ case 2
	b _02386B28 @ case 3
_02386AF0:
	ldrb r0, [r4]
	bic r0, r0, #4
	strb r0, [r4]
	b _02386B44
_02386B00:
	ldrb r0, [r4]
	orr r0, r0, #4
	strb r0, [r4]
	b _02386B44
_02386B10:
	ldrb r3, [r4]
	mvn r2, #0
	orr r3, r3, #4
	strb r3, [r4]
	bl FUN_02385BE4
	b _02386B44
_02386B28:
	ldrb r3, [r4]
	mov r2, #0x7f
	orr r3, r3, #4
	strb r3, [r4]
	bl FUN_02385BE4
	mov r0, r4
	bl FUN_02385C4C
_02386B44:
	pop {r4, lr}
	bx lr
	arm_func_end FUN_02386ACC

	arm_func_start FUN_02386B4C
FUN_02386B4C: @ 0x02386B4C
	push {r3, r4, r5, r6, r7, lr}
	movs r7, r1
	mov r6, r0
	mov r5, r2
	mov r4, r3
	movmi r0, #0
	bmi _02386CC4
	bl FUN_023841E4
	ldr r0, [r6, #0x38]
	cmp r7, r0
	blo _02386B84
	bl FUN_023841E8
	mov r0, #0
	b _02386CC4
_02386B84:
	add r0, r6, r7, lsl #2
	ldr r1, [r0, #0x3c]
	and r0, r1, #0xff
	strb r1, [r4]
	cmp r0, #0x11
	lsr r1, r1, #8
	addls pc, pc, r0, lsl #2
	b _02386CB0
_02386BA4: @ jump table
	b _02386CB0 @ case 0
	b _02386BEC @ case 1
	b _02386BEC @ case 2
	b _02386BEC @ case 3
	b _02386BEC @ case 4
	b _02386BEC @ case 5
	b _02386CB0 @ case 6
	b _02386CB0 @ case 7
	b _02386CB0 @ case 8
	b _02386CB0 @ case 9
	b _02386CB0 @ case 10
	b _02386CB0 @ case 11
	b _02386CB0 @ case 12
	b _02386CB0 @ case 13
	b _02386CB0 @ case 14
	b _02386CB0 @ case 15
	b _02386C0C @ case 16
	b _02386C5C @ case 17
_02386BEC:
	add r3, r6, r1
	add r2, r4, #2
	mov r1, #5
_02386BF8:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _02386BF8
	b _02386CBC
_02386C0C:
	ldrb r0, [r6, r1]
	add r2, r6, r1
	ldrb r1, [r2, #1]
	cmp r5, r0
	blt _02386C28
	cmp r5, r1
	ble _02386C34
_02386C28:
	bl FUN_023841E8
	mov r0, #0
	b _02386CC4
_02386C34:
	sub r1, r5, r0
	mov r0, #0xc
	mla r0, r1, r0, r2
	add r2, r0, #2
	mov r1, #6
_02386C48:
	ldrh r0, [r2], #2
	subs r1, r1, #1
	strh r0, [r4], #2
	bne _02386C48
	b _02386CBC
_02386C5C:
	add r2, r6, r1
	mov r1, #0
	b _02386C80
_02386C68:
	add r1, r1, #1
	cmp r1, #8
	blt _02386C80
	bl FUN_023841E8
	mov r0, #0
	b _02386CC4
_02386C80:
	ldrb r0, [r2, r1]
	cmp r5, r0
	bgt _02386C68
	mov r0, #0xc
	mla r0, r1, r0, r2
	add r2, r0, #8
	mov r1, #6
_02386C9C:
	ldrh r0, [r2], #2
	subs r1, r1, #1
	strh r0, [r4], #2
	bne _02386C9C
	b _02386CBC
_02386CB0:
	bl FUN_023841E8
	mov r0, #0
	b _02386CC4
_02386CBC:
	bl FUN_023841E8
	mov r0, #1
_02386CC4:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_02386B4C

	arm_func_start FUN_02386CCC
FUN_02386CCC: @ 0x02386CCC
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl FUN_023841E4
	add r0, r5, r4, lsl #2
	ldr r4, [r0, #0x3c]
	cmp r4, #0
	beq _02386CF8
	cmp r4, #0x2000000
	addlo r4, r5, r4
	b _02386CFC
_02386CF8:
	mov r4, #0
_02386CFC:
	bl FUN_023841E8
	mov r0, r4
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_02386CCC

	arm_func_start FUN_02386D0C
FUN_02386D0C: @ 0x02386D0C
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, [sp, #0x24]
	mov sb, r0
	ldrb r4, [r5, #0xa]
	ldrb r0, [r5]
	cmp r4, #0xff
	mov r6, r3
	mov r8, r1
	mov r7, r2
	mvneq r6, #0
	moveq r4, #0
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02386DEC
_02386D44: @ jump table
	b _02386DEC @ case 0
	b _02386D58 @ case 1
	b _02386DC8 @ case 2
	b _02386DDC @ case 3
	b _02386D58 @ case 4
_02386D58:
	cmp r0, #1
	bne _02386D9C
	ldr r2, [sp, #0x20]
	ldrh r0, [r5, #4]
	ldrh r1, [r5, #2]
	add r0, r2, r0, lsl #3
	ldr r0, [r0, #0x18]
	cmp r0, #0
	moveq r1, #0
	beq _02386DA8
	ldr r2, [r0, #0x38]
	cmp r1, r2
	movhs r1, #0
	bhs _02386DA8
	bl FUN_02386CCC
	mov r1, r0
	b _02386DA8
_02386D9C:
	ldrh r1, [r5, #4]
	ldrh r0, [r5, #2]
	orr r1, r0, r1, lsl #16
_02386DA8:
	cmp r1, #0
	moveq r0, #0
	beq _02386DF0
	mov r0, sb
	mov r3, r6
	add r2, r1, #0xc
	bl FUN_02384964
	b _02386DF0
_02386DC8:
	ldrh r1, [r5, #2]
	mov r0, sb
	mov r2, r6
	bl FUN_023849A0
	b _02386DF0
_02386DDC:
	mov r0, sb
	mov r1, r6
	bl FUN_023849EC
	b _02386DF0
_02386DEC:
	mov r0, #0
_02386DF0:
	cmp r0, #0
	moveq r0, #0
	beq _02386E4C
	strb r8, [sb, #8]
	ldrb r1, [r5, #6]
	mov r0, sb
	strb r1, [sb, #5]
	strb r7, [sb, #9]
	ldrb r1, [r5, #7]
	bl FUN_02384AD8
	ldrb r1, [r5, #8]
	mov r0, sb
	bl FUN_02384AF8
	ldrb r1, [r5, #9]
	mov r0, sb
	bl FUN_02384B14
	mov r0, sb
	mov r1, r4
	bl FUN_02384B1C
	ldrb r1, [r5, #0xb]
	mov r0, #1
	sub r1, r1, #0x40
	strb r1, [sb, #0xa]
_02386E4C:
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end FUN_02386D0C

	arm_func_start FUN_02386E54
FUN_02386E54: @ 0x02386E54
	ldr ip, _02386E70 @ =0x03807408
	mov r3, #0x24
	ldr ip, [ip]
	mla r3, r0, r3, ip
	add r0, r3, r1, lsl #1
	strh r2, [r0, #0x20]
	bx lr
	.align 2, 0
_02386E70: .4byte 0x03807408
	arm_func_end FUN_02386E54

	arm_func_start FUN_02386E74
FUN_02386E74: @ 0x02386E74
	ldr r2, _02386E8C @ =0x03807408
	ldr r2, [r2]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x200
	strh r1, [r0, #0x60]
	bx lr
	.align 2, 0
_02386E8C: .4byte 0x03807408
	arm_func_end FUN_02386E74

	arm_func_start FUN_02386E90
FUN_02386E90: @ 0x02386E90
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02386F24 @ =0x03807408
	mov r4, #0
	ldr r0, [r0]
	mov r5, r4
	cmp r0, #0
	beq _02386F1C
	mov r7, r4
	mov r6, #1
_02386EB4:
	mov r0, r7
	bl FUN_02383D50
	cmp r0, #0
	orrne r0, r4, r6, lsl r7
	lslne r0, r0, #0x10
	add r7, r7, #1
	lsrne r4, r0, #0x10
	cmp r7, #0x10
	blt _02386EB4
	mov r0, #0
	bl FUN_0238434C
	cmp r0, #0
	orrne r0, r5, #1
	lslne r0, r0, #0x10
	lsrne r5, r0, #0x10
	mov r0, #1
	bl FUN_0238434C
	cmp r0, #0
	orrne r0, r5, #2
	lslne r0, r0, #0x10
	lsrne r5, r0, #0x10
	ldr r0, _02386F24 @ =0x03807408
	ldr r1, [r0]
	strh r4, [r1, #8]
	ldr r0, [r0]
	strh r5, [r0, #0xa]
_02386F1C:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02386F24: .4byte 0x03807408
	arm_func_end FUN_02386E90

	arm_func_start FUN_02386F28
FUN_02386F28: @ 0x02386F28
	ldr r1, _02386F50 @ =0x0380740C
	mov r3, #0
	mov r2, r3
_02386F34:
	add r0, r1, r3, lsl #6
	strb r2, [r0, #0xf80]
	add r3, r3, #1
	strb r2, [r0, #0xf81]
	cmp r3, #8
	blt _02386F34
	bx lr
	.align 2, 0
_02386F50: .4byte 0x0380740C
	arm_func_end FUN_02386F28

	arm_func_start FUN_02386F54
FUN_02386F54: @ 0x02386F54
	push {r4, r5, r6, r7, r8, lr}
	ldr lr, _02386FAC @ =0x0380838C
	ldr r4, [sp, #0x18]
	ldrb ip, [lr, r0, lsl #6]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp ip, #0
	add r8, lr, r0, lsl #6
	beq _02386F8C
	add r0, r8, #0x14
	bl FUN_02382850
	mov r0, #0
	strb r0, [r8]
_02386F8C:
	str r7, [r8, #4]
	str r6, [r8, #8]
	str r5, [r8, #0xc]
	ldr r0, [sp, #0x1c]
	str r4, [r8, #0x10]
	strb r0, [r8, #1]
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02386FAC: .4byte 0x0380838C
	arm_func_end FUN_02386F54

	arm_func_start FUN_02386FB0
FUN_02386FB0: @ 0x02386FB0
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	ldr r1, _02387064 @ =0x0380838C
	mov sb, r0
	ldrb r0, [r1, sb, lsl #6]
	add r8, r1, sb, lsl #6
	cmp r0, #0
	beq _02386FE0
	add r0, r8, #0x14
	bl FUN_02382850
	mov r0, #0
	strb r0, [r8]
_02386FE0:
	ldrb r1, [r8, #1]
	ldr r7, [r8, #0xc]
	ldr r6, [r8, #0x10]
	add r0, r8, #0x14
	ldr r5, [r8, #4]
	ldr r4, [r8, #8]
	orr sb, sb, r1, lsl #8
	bl FUN_02382630
	cmp r6, #0
	cmpeq r7, #0
	bne _02387028
	ldr r3, _02387068 @ =0x037FEE40
	mov r1, r5
	mov r2, r4
	add r0, r8, #0x14
	str sb, [sp]
	bl FUN_0238276C
	b _02387050
_02387028:
	bl FUN_023824AC
	ldr r2, _02387068 @ =0x037FEE40
	adds r0, r5, r0
	stmib sp, {r2, sb}
	adc r2, r4, r1
	mov r1, r0
	mov r3, r7
	add r0, r8, #0x14
	str r6, [sp]
	bl FUN_023827DC
_02387050:
	mov r0, #1
	strb r0, [r8]
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02387064: .4byte 0x0380838C
_02387068: .4byte 0x037FEE40
	arm_func_end FUN_02386FB0

	arm_func_start FUN_0238706C
FUN_0238706C: @ 0x0238706C
	push {r4, lr}
	ldr r2, _023870A8 @ =0x0380838C
	ldrb r1, [r2, r0, lsl #6]
	add r4, r2, r0, lsl #6
	cmp r1, #0
	beq _023870A0
	add r0, r4, #0x14
	bl FUN_02382850
	ldrb r1, [r4, #1]
	mov r0, #0
	add r1, r1, #1
	strb r1, [r4, #1]
	strb r0, [r4]
_023870A0:
	pop {r4, lr}
	bx lr
	.align 2, 0
_023870A8: .4byte 0x0380838C
	arm_func_end FUN_0238706C

	arm_func_start FUN_023870AC
FUN_023870AC: @ 0x023870AC
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #7
	mov r4, #0
_023870BC:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	blt _023870BC
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end FUN_023870AC

	arm_func_start FUN_023870DC
FUN_023870DC: @ 0x023870DC
	push {r3, lr}
	ldr r0, _02387110 @ =0x0380858C
	ldr r1, _02387114 @ =0x038085AC
	mov r2, #8
	bl FUN_0238193C
	ldr r1, _02387118 @ =0x037FF564
	mov r0, #7
	bl FUN_0238359C
	ldr r0, _0238711C @ =0x03807408
	mov r1, #0
	str r1, [r0]
	pop {r3, lr}
	bx lr
	.align 2, 0
_02387110: .4byte 0x0380858C
_02387114: .4byte 0x038085AC
_02387118: .4byte 0x037FF564
_0238711C: .4byte 0x03807408
	arm_func_end FUN_023870DC

	arm_func_start FUN_02387120
FUN_02387120: @ 0x02387120
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	b _02387798
_0238712C:
	ldr sl, _023877BC @ =0x04000509
	ldr r6, [sp, #0x18]
	sub r4, sl, #1
	b _0238777C
_0238713C:
	add r5, sp, #0x1c
	ldm r6!, {r0, r1, r2, r3}
	stm r5!, {r0, r1, r2, r3}
	ldm r6, {r0, r1}
	stm r5, {r0, r1}
	ldr r0, [sp, #0x20]
	cmp r0, #0x21
	addls pc, pc, r0, lsl #2
	b _02387778
_02387160: @ jump table
	b _023871E8 @ case 0
	b _02387200 @ case 1
	b _0238720C @ case 2
	b _02387224 @ case 3
	b _02387230 @ case 4
	b _02387240 @ case 5
	b _02387250 @ case 6
	b _02387268 @ case 7
	b _02387290 @ case 8
	b _023872A4 @ case 9
	b _023872B8 @ case 10
	b _023872D4 @ case 11
	b _023872EC @ case 12
	b _023873B4 @ case 13
	b _02387590 @ case 14
	b _02387610 @ case 15
	b _02387648 @ case 16
	b _02387458 @ case 17
	b _023874A0 @ case 18
	b _023874C8 @ case 19
	b _02387508 @ case 20
	b _02387550 @ case 21
	b _02387678 @ case 22
	b _02387684 @ case 23
	b _02387690 @ case 24
	b _0238769C @ case 25
	b _023876B4 @ case 26
	b _023876C4 @ case 27
	b _023876D4 @ case 28
	b _02387714 @ case 29
	b _023876E4 @ case 30
	b _023876F4 @ case 31
	b _02387704 @ case 32
	b _02387724 @ case 33
_023871E8:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl FUN_02385514
	b _02387778
_02387200:
	ldr r0, [sp, #0x24]
	bl FUN_02385544
	b _02387778
_0238720C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl FUN_023852B8
	b _02387778
_02387224:
	ldr r0, [sp, #0x24]
	bl FUN_023854F4
	b _02387778
_02387230:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_023855A0
	b _02387778
_02387240:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_02385618
	b _02387778
_02387250:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl FUN_023858A8
	b _02387778
_02387268:
	ldr r1, [sp, #0x24]
	lsr r0, r1, #0x18
	and r0, r0, #0xff
	str r0, [sp]
	bic r0, r1, #0xff000000
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl FUN_023858EC
	b _02387778
_02387290:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl FUN_023856E4
	b _02387778
_023872A4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl FUN_02385750
	b _02387778
_023872B8:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl FUN_02386E54
	b _02387778
_023872D4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl FUN_02386E74
	b _02387778
_023872EC:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl FUN_02382F90
	mov r8, r0
	mov r2, #0
	b _02387328
_02387308:
	tst r5, #1
	lslne r0, r2, #4
	addne r0, r0, #0x4000000
	ldrbne r1, [r0, #0x403]
	add r2, r2, #1
	orrne r1, r1, #0x80
	strbne r1, [r0, #0x403]
	lsr r5, r5, #1
_02387328:
	cmp r2, #0x10
	bge _02387338
	cmp r5, #0
	bne _02387308
_02387338:
	tst r6, #1
	beq _02387364
	tst r6, #2
	ldrhne r1, [r4]
	orrne r0, r1, #0x80
	orrne r0, r0, #0x8000
	strhne r0, [r4]
	ldrbeq r0, [r4]
	orreq r0, r0, #0x80
	strbeq r0, [r4]
	b _02387374
_02387364:
	tst r6, #2
	ldrbne r0, [sl]
	orrne r0, r0, #0x80
	strbne r0, [sl]
_02387374:
	mov r5, #0
	b _02387394
_0238737C:
	tst r7, #1
	beq _0238738C
	mov r0, r5
	bl FUN_02386FB0
_0238738C:
	add r5, r5, #1
	lsr r7, r7, #1
_02387394:
	cmp r5, #8
	bge _023873A4
	cmp r7, #0
	bne _0238737C
_023873A4:
	mov r0, r8
	bl FUN_02382FA4
	bl FUN_02386E90
	b _02387778
_023873B4:
	ldr sb, [sp, #0x30]
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl FUN_02382F90
	mov fp, r0
	mov r8, #0
	b _023873EC
_023873D4:
	tst r7, #1
	beq _023873E4
	mov r0, r8
	bl FUN_0238706C
_023873E4:
	add r8, r8, #1
	lsr r7, r7, #1
_023873EC:
	cmp r8, #8
	bge _023873FC
	cmp r7, #0
	bne _023873D4
_023873FC:
	mov r7, #0
	b _02387420
_02387404:
	tst r5, #1
	beq _02387418
	mov r0, r7
	mov r1, sb
	bl FUN_02383C20
_02387418:
	add r7, r7, #1
	lsr r5, r5, #1
_02387420:
	cmp r7, #0x10
	bge _02387430
	cmp r5, #0
	bne _02387404
_02387430:
	tst r6, #1
	movne r0, #0
	strbne r0, [r4]
	tst r6, #2
	movne r0, #0
	strbne r0, [sl]
	mov r0, fp
	bl FUN_02382FA4
	bl FUN_02386E90
	b _02387778
_02387458:
	ldr r1, [sp, #0x2c]
	lsr r0, r1, #0x1d
	and r0, r0, #1
	str r0, [sp]
	lsr r0, r1, #0x1c
	and r0, r0, #1
	str r0, [sp, #4]
	lsr r0, r1, #0x1b
	and r0, r0, #1
	str r0, [sp, #8]
	lsr r0, r1, #0x1f
	and r0, r0, #1
	lsr r1, r1, #0x1e
	and r1, r1, #1
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl FUN_023842FC
	b _02387778
_023874A0:
	ldr r0, [sp, #0x30]
	mov r2, #0
	str r0, [sp, #4]
	ldr r3, [sp, #0x2c]
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_02386F54
	b _02387778
_023874C8:
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r7, #0
	b _023874F4
_023874D8:
	tst r5, #1
	beq _023874EC
	mov r0, r7
	mov r1, r6
	bl FUN_02383CC0
_023874EC:
	add r7, r7, #1
	lsr r5, r5, #1
_023874F4:
	cmp r7, #0x10
	bge _02387778
	cmp r5, #0
	bne _023874D8
	b _02387778
_02387508:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r8, #0
	b _0238753C
_0238751C:
	tst r5, #1
	beq _02387534
	mov r0, r8
	mov r1, r6
	mov r2, r7
	bl FUN_02383C48
_02387534:
	add r8, r8, #1
	lsr r5, r5, #1
_0238753C:
	cmp r8, #0x10
	bge _02387778
	cmp r5, #0
	bne _0238751C
	b _02387778
_02387550:
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r7, #0
	b _0238757C
_02387560:
	tst r5, #1
	beq _02387574
	mov r0, r7
	mov r1, r6
	bl FUN_02383CD8
_02387574:
	add r7, r7, #1
	lsr r5, r5, #1
_0238757C:
	cmp r7, #0x10
	bge _02387778
	cmp r5, #0
	bne _02387560
	b _02387778
_02387590:
	ldr r3, [sp, #0x30]
	ldr r0, [sp, #0x24]
	lsl r1, r3, #0x10
	ldr r2, [sp, #0x2c]
	lsr r1, r1, #0x10
	str r1, [sp]
	ldr r1, _023877C0 @ =0x003FFFFF
	and r1, r2, r1
	str r1, [sp, #4]
	lsr r1, r2, #0x18
	and r1, r1, #0x7f
	str r1, [sp, #8]
	lsr r1, r2, #0x16
	and r1, r1, #3
	str r1, [sp, #0xc]
	lsr r1, r0, #0x10
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	str r1, [sp, #0x10]
	lsr r1, r3, #0x10
	lsr r2, r3, #0x18
	and r1, r1, #0x7f
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0x10
	lsr r3, r3, #0x1a
	lsr r0, r0, #0x10
	bic r1, r1, #0xf8000000
	and r2, r2, #3
	and r3, r3, #3
	bl FUN_02383A04
	b _02387778
_02387610:
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x28]
	lsl r0, r1, #8
	lsr r0, r0, #0x10
	str r0, [sp]
	and r0, r1, #0x7f
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x30]
	and r2, r3, #0x7f
	lsr r3, r3, #8
	and r3, r3, #3
	bl FUN_02383AD0
	b _02387778
_02387648:
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	and r0, r1, #0x7f
	str r0, [sp]
	lsl r0, r1, #8
	lsr r3, r0, #0x10
	ldr r0, [sp, #0x24]
	and r1, r2, #0x7f
	lsr r2, r2, #8
	and r2, r2, #3
	bl FUN_02383B7C
	b _02387778
_02387678:
	ldr r0, [sp, #0x24]
	bl FUN_02383DE0
	b _02387778
_02387684:
	ldr r0, [sp, #0x24]
	bl FUN_023839BC
	b _02387778
_02387690:
	ldr r0, [sp, #0x24]
	bl FUN_02383D6C
	b _02387778
_0238769C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl FUN_023839CC
	b _02387778
_023876B4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_02384DE4
	b _02387778
_023876C4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_02384EC4
	b _02387778
_023876D4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_02384D34
	b _02387778
_023876E4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_023857C0
	b _02387778
_023876F4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_0238584C
	b _02387778
_02387704:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_02384F18
	b _02387778
_02387714:
	ldr r1, [sp, #0x24]
	ldr r0, _023877C4 @ =0x03807408
	str r1, [r0]
	b _02387778
_02387724:
	ldr r5, [sp, #0x24]
	ldr r0, _023877C8 @ =0x0380740C
	mov r1, r5
	mov r2, #0x1180
	bl FUN_0238324C
	ldr r0, _023877C8 @ =0x0380740C
	add r1, r5, #0x1000
	str r0, [r1, #0x1c0]
	mov r6, #0
_02387748:
	mov r0, r6
	bl FUN_02383DD0
	add r1, r5, r6, lsl #2
	add r1, r1, #0x1000
	str r0, [r1, #0x180]
	add r6, r6, #1
	cmp r6, #0x10
	blt _02387748
	mov r0, #0
	bl FUN_02384EFC
	add r1, r5, #0x1000
	str r0, [r1, #0x1c4]
_02387778:
	ldr r6, [sp, #0x1c]
_0238777C:
	cmp r6, #0
	bne _0238713C
	ldr r0, _023877C4 @ =0x03807408
	ldr r1, [r0]
	ldr r0, [r1]
	add r0, r0, #1
	str r0, [r1]
_02387798:
	ldr r0, _023877CC @ =0x0380858C
	add r1, sp, #0x18
	mov r2, #0
	bl FUN_023819F0
	cmp r0, #0
	bne _0238712C
	add sp, sp, #0x34
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_023877BC: .4byte 0x04000509
_023877C0: .4byte 0x003FFFFF
_023877C4: .4byte 0x03807408
_023877C8: .4byte 0x0380740C
_023877CC: .4byte 0x0380858C
	arm_func_end FUN_02387120

	arm_func_start FUN_023877D0
FUN_023877D0: @ 0x023877D0
	push {r3, r4, r5, lr}
	mov r5, r1
	bl FUN_02382F90
	mov r4, r0
	cmp r5, #0x2000000
	blo _023877FC
	ldr r0, _02387818 @ =0x0380858C
	mov r1, r5
	mov r2, #0
	bl FUN_02381964
	b _02387808
_023877FC:
	cmp r5, #0
	bne _02387808
	bl FUN_023841C8
_02387808:
	mov r0, r4
	bl FUN_02382FA4
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02387818: .4byte 0x0380858C
	arm_func_end FUN_023877D0

	arm_func_start FUN_0238781C
FUN_0238781C: @ 0x0238781C
	ldr ip, _02387824 @ =FUN_03800254
	bx ip
	.align 2, 0
_02387824: .4byte FUN_03800254
	arm_func_end FUN_0238781C

	arm_func_start FUN_02387828
FUN_02387828: @ 0x02387828
	push {r4, lr}
	sub sp, sp, #8
	ldr r4, _023878CC @ =0x038085E0
	mov r2, #0
	mvn r1, #2
	str r1, [r4, #0xc]
	mov r0, #4
	str r0, [r4, #0xf0]
	str r2, [r4, #0x10]
	str r2, [r4, #0x1c]
	str r2, [r4]
	str r2, [r4, #8]
	str r2, [r4, #0x18]
	str r2, [r4, #0x14]
	str r2, [r4, #0xf8]
	str r2, [r4, #0xf4]
	mov r0, #0x400
	str r0, [sp]
	ldr ip, [r4, #0xf0]
	ldr r1, _023878D0 @ =0x038003A8
	ldr r3, _023878D4 @ =0x03808BE0
	add r0, r4, #0x48
	str ip, [sp, #4]
	bl FUN_023812C0
	add r0, r4, #0x48
	bl FUN_02381620
	ldr r1, _023878D8 @ =0x038002C4
	mov r0, #0xb
	bl FUN_0238359C
	ldr r0, _023878DC @ =0x027FFC40
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _023878E0 @ =0x038085CC
	moveq r1, #1
	streq r1, [r0]
	add sp, sp, #8
	pop {r4, lr}
	bx lr
	.align 2, 0
_023878CC: .4byte 0x038085E0
_023878D0: .4byte 0x038003A8
_023878D4: .4byte 0x03808BE0
_023878D8: .4byte 0x038002C4
_023878DC: .4byte 0x027FFC40
_023878E0: .4byte 0x038085CC
	arm_func_end FUN_02387828

	arm_func_start FUN_023878E4
FUN_023878E4: @ 0x023878E4
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _02387920 @ =0x038085E0
	mov r7, r0
	bl FUN_02382F90
	ldr r6, [r5, #0xf0]
	mov r4, r0
	mov r1, r7
	add r0, r5, #0x48
	str r7, [r5, #0xf0]
	bl FUN_02381674
	mov r0, r4
	bl FUN_02382FA4
	mov r0, r6
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02387920: .4byte 0x038085E0
	arm_func_end FUN_023878E4

	arm_func_start FUN_02387924
FUN_02387924: @ 0x02387924
	ldr r0, _0238792C @ =0x027FFA80
	bx lr
	.align 2, 0
_0238792C: .4byte 0x027FFA80
	arm_func_end FUN_02387924

	arm_func_start FUN_02387930
FUN_02387930: @ 0x02387930
	push {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	mov r4, r1
	adds r1, r5, r4
	beq _023879C8
	cmp r5, #0
	beq _02387950
	bl FUN_0238171C
_02387950:
	cmp r4, #0
	beq _023879A4
	sub r7, r4, r5
	mov r4, #0
	mov r5, #1
	mov r6, #5
	b _02387984
_0238796C:
	cmp r7, #5
	movlt r8, r7
	movge r8, r6
	mov r0, r8
	bl FUN_0238171C
	sub r7, r7, r8
_02387984:
	bl FUN_023879D4
	tst r0, #1
	moveq r0, r5
	movne r0, r4
	cmp r0, #0
	bne _023879A4
	cmp r7, #0
	bgt _0238796C
_023879A4:
	bl FUN_023879D4
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _023879D0 @ =0x038085E0
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0]
_023879C8:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_023879D0: .4byte 0x038085E0
	arm_func_end FUN_02387930

	arm_func_start FUN_023879D4
FUN_023879D4: @ 0x023879D4
	push {r3, lr}
	ldr ip, _02387A18 @ =0x03808BE0
	mov lr, #2
	ldr r0, _02387A1C @ =0x0380679C
	ldr r3, _02387A20 @ =0x037FFA10
	mov r1, #0
	mov r2, #1
	str lr, [ip, #4]
	bl FUN_02387A64
	ldr r3, _02387A24 @ =0x037FF9D0
	add r1, sp, #0
	mov r0, #0
	mov r2, #1
	bl FUN_02387A64
	ldrb r0, [sp]
	pop {r3, lr}
	bx lr
	.align 2, 0
_02387A18: .4byte 0x03808BE0
_02387A1C: .4byte 0x0380679C
_02387A20: .4byte 0x037FFA10
_02387A24: .4byte 0x037FF9D0
	arm_func_end FUN_023879D4

	arm_func_start FUN_02387A28
FUN_02387A28: @ 0x02387A28
	push {r3, lr}
	mov r0, #0
	mov r1, #0x32
	bl FUN_02387930
	ldr r0, _02387A60 @ =0x038085E0
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #4
	moveq r0, #6
	streq r0, [r1]
	moveq r0, #0
	movne r0, #1
	pop {r3, lr}
	bx lr
	.align 2, 0
_02387A60: .4byte 0x038085E0
	arm_func_end FUN_02387A28

	arm_func_start FUN_02387A64
FUN_02387A64: @ 0x02387A64
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _02387C1C @ =0x03808BE4
	ldr r6, _02387C20 @ =0x0000A040
	ldr r5, _02387C24 @ =0x040001A0
	stmib r4, {r0, r1}
	mov r8, r2
	mov r7, r3
	strh r6, [r5]
	b _02387BF8
_02387A88:
	ldr r0, _02387C28 @ =0x03806AF4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02387B98
	ldr r0, _02387C2C @ =0x038085E0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	asr r0, r0, #0x10
	and r0, r0, #0xff
	cmp r0, #0xff
	bne _02387B98
	bl FUN_023824AC
	ldr fp, _02387C28 @ =0x03806AF4
	mov r5, r0
	mov r6, r1
	mov sb, #0xfa00
_02387AC8:
	bl FUN_023824AC
	mov r3, #0
	subs sl, r0, r5
	sbc lr, r1, r6
	mov ip, r3
	umull r0, r1, sl, sb
	mla r1, sl, ip, r1
	mla r1, lr, sb, r1
	ldr r2, _02387C30 @ =0x000082EA
	bl FUN_0238E480
	ldrb r2, [fp]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _02387AC8
	ldr r0, _02387C34 @ =0x0000A042
	ldr r1, _02387C24 @ =0x040001A0
	strh r0, [r1]
_02387B0C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _02387B0C
	ldr r0, _02387C38 @ =0x040001A2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_02387B28:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _02387B28
	ldr r1, _02387C38 @ =0x040001A2
	ldr r0, _02387C28 @ =0x03806AF4
	ldrh r2, [r1]
	mov r1, #0
	strh r2, [sp]
	str r1, [r0, #4]
	bl FUN_023824AC
	mov r6, r0
	mov sb, r1
	mov r5, #0xfa00
_02387B5C:
	bl FUN_023824AC
	mov r3, #0
	subs ip, r0, r6
	sbc fp, r1, sb
	mov sl, r3
	umull r0, r1, ip, r5
	mla r1, ip, sl, r1
	mla r1, fp, r5, r1
	ldr r2, _02387C30 @ =0x000082EA
	bl FUN_0238E480
	ldr r2, _02387C28 @ =0x03806AF4
	ldrb r2, [r2]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _02387B5C
_02387B98:
	ldr r0, [r4]
	subs r0, r0, #1
	str r0, [r4]
	ldrne r1, _02387C20 @ =0x0000A040
	ldrne r0, _02387C24 @ =0x040001A0
	strhne r1, [r0]
	bne _02387BCC
	ldr r1, _02387C24 @ =0x040001A0
	mov r2, #0xa000
	strh r2, [r1]
	ldr r0, _02387C28 @ =0x03806AF4
	mov r1, #1
	str r1, [r0, #4]
_02387BCC:
	ldr r1, _02387C24 @ =0x040001A0
_02387BD0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _02387BD0
	mov r0, r4
	mov lr, pc
	bx r7
	arm_func_end FUN_02387A64

	arm_func_start FUN_02387BE8
FUN_02387BE8: @ 0x02387BE8
	ldr r0, [r4]
	cmp r0, #0
	beq _02387C00
	sub r8, r8, #1
_02387BF8:
	cmp r8, #0
	bne _02387A88
_02387C00:
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, _02387C24 @ =0x040001A0
	moveq r1, #0
	strheq r1, [r0]
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02387C1C: .4byte 0x03808BE4
_02387C20: .4byte 0x0000A040
_02387C24: .4byte 0x040001A0
_02387C28: .4byte 0x03806AF4
_02387C2C: .4byte 0x038085E0
_02387C30: .4byte 0x000082EA
_02387C34: .4byte 0x0000A042
_02387C38: .4byte 0x040001A2
	arm_func_end FUN_02387BE8

	arm_func_start FUN_02387C3C
FUN_02387C3C: @ 0x02387C3C
	ldr r1, _02387C78 @ =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_02387C4C:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _02387C4C
	ldr r2, _02387C78 @ =0x040001A2
	ldr r1, [r0, #8]
	ldrh r2, [r2]
	strb r2, [r1]
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_02387C78: .4byte 0x040001A2
	arm_func_end FUN_02387C3C

	arm_func_start FUN_02387C7C
FUN_02387C7C: @ 0x02387C7C
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r1, [r0, #4]
	ldr r2, _02387CC8 @ =0x040001A2
	ldrb r1, [r1]
	strh r1, [r2]
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	sub r1, r2, #2
_02387CA4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _02387CA4
	ldr r0, _02387CC8 @ =0x040001A2
	ldrh r0, [r0]
	strh r0, [sp]
	add sp, sp, #4
	ldm sp!, {r3}
	bx lr
	.align 2, 0
_02387CC8: .4byte 0x040001A2
	arm_func_end FUN_02387C7C

	arm_func_start FUN_02387CCC
FUN_02387CCC: @ 0x02387CCC
	ldr r1, _02387D2C @ =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_02387CDC:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _02387CDC
	ldr r2, _02387D2C @ =0x040001A2
	ldr r1, [r0, #4]
	ldrh r2, [r2]
	ldrb r1, [r1]
	and r2, r2, #0xff
	cmp r2, r1
	beq _02387D1C
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0]
	cmp r1, #1
	movhi r1, #1
	strhi r1, [r0]
_02387D1C:
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_02387D2C: .4byte 0x040001A2
	arm_func_end FUN_02387CCC

	arm_func_start FUN_02387D30
FUN_02387D30: @ 0x02387D30
	push {r3, lr}
	ldr ip, _02387D58 @ =0x03808BE0
	mov r2, #1
	ldr r0, _02387D5C @ =0x038067A0
	ldr r3, _02387D60 @ =0x037FFA10
	mov r1, #0
	str r2, [ip, #4]
	bl FUN_02387A64
	pop {r3, lr}
	bx lr
	.align 2, 0
_02387D58: .4byte 0x03808BE0
_02387D5C: .4byte 0x038067A0
_02387D60: .4byte 0x037FFA10
	arm_func_end FUN_02387D30

	arm_func_start FUN_02387D64
FUN_02387D64: @ 0x02387D64
	push {r3, lr}
	ldr r2, _02387DFC @ =0x038085E0
	ldr r2, [r2]
	ldr r2, [r2, #0x28]
	cmp r2, #1
	beq _02387D90
	cmp r2, #2
	beq _02387DAC
	cmp r2, #3
	beq _02387DC4
	b _02387DE0
_02387D90:
	lsr r3, r0, #5
	and r3, r3, #8
	lsl ip, r0, #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #16
	str r0, [sp]
	b _02387DE0
_02387DAC:
	and r3, r0, #0xff00
	lsl ip, r0, #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #8
	str r0, [sp]
	b _02387DE0
_02387DC4:
	lsr r3, r0, #8
	and r3, r3, #0xff00
	and ip, r0, #0xff00
	orr r1, r1, r3
	orr r1, r1, ip, lsl #8
	orr r0, r1, r0, lsl #24
	str r0, [sp]
_02387DE0:
	ldr r3, _02387E00 @ =0x037FFA10
	add r0, sp, #0
	add r2, r2, #1
	mov r1, #0
	bl FUN_02387A64
	pop {r3, lr}
	bx lr
	.align 2, 0
_02387DFC: .4byte 0x038085E0
_02387E00: .4byte 0x037FFA10
	arm_func_end FUN_02387D64

	arm_func_start FUN_02387E04
FUN_02387E04: @ 0x02387E04
	push {r4, lr}
	ldr r0, _02387E54 @ =0x038085E0
	ldr r0, [r0]
	ldrb r4, [r0, #0x54]
	cmp r4, #0xff
	beq _02387E4C
	ldr r0, _02387E58 @ =0x03808BE0
	ldr r0, [r0]
	cmp r0, #0
	bne _02387E4C
	bl FUN_023879D4
	cmp r4, r0
	beq _02387E40
	mov r0, r4
	bl FUN_0238825C
_02387E40:
	ldr r0, _02387E58 @ =0x03808BE0
	mov r1, #1
	str r1, [r0]
_02387E4C:
	pop {r4, lr}
	bx lr
	.align 2, 0
_02387E54: .4byte 0x038085E0
_02387E58: .4byte 0x03808BE0
	arm_func_end FUN_02387E04

	arm_func_start FUN_02387E5C
FUN_02387E5C: @ 0x02387E5C
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl FUN_02387A28
	cmp r0, #0
	beq _02387EB4
	ldr r0, _02387EBC @ =0x038085E0
	ldr r2, _02387EC0 @ =0x03808BE0
	ldr r1, [r0]
	mov r0, r6
	ldr r3, [r1, #0x28]
	mov r1, #3
	add r3, r3, #1
	add r3, r3, r4
	str r3, [r2, #4]
	bl FUN_02387D64
	ldr r3, _02387EC4 @ =0x037FF9D0
	mov r1, r5
	mov r2, r4
	mov r0, #0
	bl FUN_02387A64
_02387EB4:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02387EBC: .4byte 0x038085E0
_02387EC0: .4byte 0x03808BE0
_02387EC4: .4byte 0x037FF9D0
	arm_func_end FUN_02387E5C

	arm_func_start FUN_02387EC8
FUN_02387EC8: @ 0x02387EC8
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl FUN_02387A28
	cmp r0, #0
	beq _02387F6C
	ldr r0, _02387F74 @ =0x038085E0
	ldr fp, _02387F78 @ =0x03808BE0
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _02387F64
_02387EFC:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl FUN_02387D30
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #2
	bl FUN_02387D64
	ldr r3, _02387F7C @ =0x037FFA10
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl FUN_02387A64
	ldr r0, [r5, #0x2c]
	mov r1, #0
	bl FUN_02387930
	ldr r0, [r5]
	cmp r0, #0
	bne _02387F6C
	add sb, sb, r7
	add sl, sl, r7
	sub r8, r8, r7
_02387F64:
	cmp r8, #0
	bne _02387EFC
_02387F6C:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02387F74: .4byte 0x038085E0
_02387F78: .4byte 0x03808BE0
_02387F7C: .4byte 0x037FFA10
	arm_func_end FUN_02387EC8

	arm_func_start FUN_02387F80
FUN_02387F80: @ 0x02387F80
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl FUN_02387A28
	cmp r0, #0
	beq _02388024
	ldr r0, _0238802C @ =0x038085E0
	ldr fp, _02388030 @ =0x03808BE0
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _0238801C
_02387FB4:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl FUN_02387D30
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #0xa
	bl FUN_02387D64
	ldr r3, _02388034 @ =0x037FFA10
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl FUN_02387A64
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	bl FUN_02387930
	ldr r0, [r5]
	cmp r0, #0
	bne _02388024
	add sb, sb, r7
	add sl, sl, r7
	sub r8, r8, r7
_0238801C:
	cmp r8, #0
	bne _02387FB4
_02388024:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0238802C: .4byte 0x038085E0
_02388030: .4byte 0x03808BE0
_02388034: .4byte 0x037FFA10
	arm_func_end FUN_02387F80

	arm_func_start FUN_02388038
FUN_02388038: @ 0x02388038
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl FUN_02387A28
	cmp r0, #0
	beq _023880B4
	ldr r0, _023880BC @ =0x038085E0
	ldr r2, _023880C0 @ =0x03808BE0
	ldr r4, [r0]
	mov r0, #1
	str r0, [r2, #0x10]
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	add r3, r1, r5
	mov r1, #3
	str r3, [r2, #4]
	bl FUN_02387D64
	ldr r3, _023880C4 @ =0x037FFA60
	mov r0, r6
	mov r2, r5
	mov r1, #0
	bl FUN_02387A64
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, _023880C0 @ =0x03808BE0
	ldreq r0, [r0, #0x10]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [r4]
_023880B4:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_023880BC: .4byte 0x038085E0
_023880C0: .4byte 0x03808BE0
_023880C4: .4byte 0x037FFA60
	arm_func_end FUN_02388038

	arm_func_start FUN_023880C8
FUN_023880C8: @ 0x023880C8
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _0238815C @ =0x038085E0
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	ldr r5, [r4, #0x1c]
	orr r0, r7, r6
	sub r1, r5, #1
	tst r1, r0
	movne r0, #2
	strne r0, [r4]
	bne _02388154
	bl FUN_02387A28
	cmp r0, #0
	beq _02388154
	ldr r8, _02388160 @ =0x03808BE0
	mov sb, #0xd8
	b _0238814C
_02388110:
	bl FUN_02387D30
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl FUN_02387D64
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x44]
	bl FUN_02387930
	ldr r0, [r4]
	cmp r0, #0
	bne _02388154
	add r7, r7, r5
	sub r6, r6, r5
_0238814C:
	cmp r6, #0
	bne _02388110
_02388154:
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0238815C: .4byte 0x038085E0
_02388160: .4byte 0x03808BE0
	arm_func_end FUN_023880C8

	arm_func_start FUN_02388164
FUN_02388164: @ 0x02388164
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _023881F8 @ =0x038085E0
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	ldr r5, [r4, #0x20]
	orr r0, r7, r6
	sub r1, r5, #1
	tst r1, r0
	movne r0, #2
	strne r0, [r4]
	bne _023881F0
	bl FUN_02387A28
	cmp r0, #0
	beq _023881F0
	ldr r8, _023881FC @ =0x03808BE0
	mov sb, #0x20
	b _023881E8
_023881AC:
	bl FUN_02387D30
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl FUN_02387D64
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x4c]
	bl FUN_02387930
	ldr r0, [r4]
	cmp r0, #0
	bne _023881F0
	add r7, r7, r5
	sub r6, r6, r5
_023881E8:
	cmp r6, #0
	bne _023881AC
_023881F0:
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_023881F8: .4byte 0x038085E0
_023881FC: .4byte 0x03808BE0
	arm_func_end FUN_02388164

	arm_func_start FUN_02388200
FUN_02388200: @ 0x02388200
	push {r4, lr}
	bl FUN_02387A28
	cmp r0, #0
	beq _02388244
	ldr r0, _0238824C @ =0x038085E0
	ldr r4, [r0]
	bl FUN_02387D30
	ldr r1, _02388250 @ =0x03808BE0
	mov r2, #1
	ldr r0, _02388254 @ =0x03806798
	ldr r3, _02388258 @ =0x037FFA10
	str r2, [r1, #4]
	mov r1, #0
	bl FUN_02387A64
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x3c]
	bl FUN_02387930
_02388244:
	pop {r4, lr}
	bx lr
	.align 2, 0
_0238824C: .4byte 0x038085E0
_02388250: .4byte 0x03808BE0
_02388254: .4byte 0x03806798
_02388258: .4byte 0x037FFA10
	arm_func_end FUN_02388200

	arm_func_start FUN_0238825C
FUN_0238825C: @ 0x0238825C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl FUN_02387A28
	cmp r0, #0
	beq _023882E0
	ldr r0, _023882E8 @ =0x038085E0
	strb r4, [sp, #1]
	mov r1, #1
	ldr sb, [r0]
	ldr r5, _023882EC @ =0x037FFA10
	ldr r4, _023882F0 @ =0x03808BE0
	strb r1, [sp]
	mov sl, #0xa
	add r7, sp, #0
	mov r8, #2
	mov r6, #0
	mov fp, #5
_023882A0:
	bl FUN_02387D30
	mov r0, r7
	str r8, [r4, #4]
	mov r1, r6
	mov r2, r8
	mov r3, r5
	bl FUN_02387A64
	mov r0, fp
	mov r1, #0
	bl FUN_02387930
	ldr r0, [sb]
	cmp r0, #4
	bne _023882E0
	sub sl, sl, #1
	cmp sl, #0
	bgt _023882A0
_023882E0:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_023882E8: .4byte 0x038085E0
_023882EC: .4byte 0x037FFA10
_023882F0: .4byte 0x03808BE0
	arm_func_end FUN_0238825C

	arm_func_start FUN_023882F4
FUN_023882F4: @ 0x023882F4
	ldr r3, _0238834C @ =0x040001A4
_023882F8:
	ldr r2, [r3]
	tst r2, #-0x80000000
	bne _023882F8
	ldr r3, _02388350 @ =0x040001A1
	mov r2, #0xc0
	strb r2, [r3]
	lsr r2, r0, #0x18
	strb r2, [r3, #7]
	lsr r2, r0, #0x10
	strb r2, [r3, #8]
	lsr r2, r0, #8
	strb r2, [r3, #9]
	strb r0, [r3, #0xa]
	lsr r0, r1, #0x18
	strb r0, [r3, #0xb]
	lsr r0, r1, #0x10
	strb r0, [r3, #0xc]
	lsr r0, r1, #8
	strb r0, [r3, #0xd]
	strb r1, [r3, #0xe]
	bx lr
	.align 2, 0
_0238834C: .4byte 0x040001A4
_02388350: .4byte 0x040001A1
	arm_func_end FUN_023882F4

	arm_func_start FUN_02388354
FUN_02388354: @ 0x02388354
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _023883C4 @ =0x038085E0
	mov r1, #0
	ldr r0, [r4]
	str r1, [r0]
	ldr r7, [r4, #0x3c]
	ldr r6, [r4, #0x40]
	bl FUN_02382F90
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl FUN_02381598
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _023883A0
	add r0, r4, #0x48
	bl FUN_02381620
_023883A0:
	mov r0, r5
	bl FUN_02382FA4
	cmp r7, #0
	beq _023883BC
	mov r0, r6
	mov lr, pc
	bx r7
_023883BC:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_023883C4: .4byte 0x038085E0
	arm_func_end FUN_02388354

	arm_func_start FUN_023883C8
FUN_023883C8: @ 0x023883C8
	ldr r1, _023883E4 @ =0x03806AFC
	ldr r1, [r1]
	ldr r1, [r1, #0x60]
	bic r1, r1, #0x7000000
	orr r0, r1, r0
	orr r0, r0, #0xa0000000
	bx lr
	.align 2, 0
_023883E4: .4byte 0x03806AFC
	arm_func_end FUN_023883C8

	arm_func_start FUN_023883E8
FUN_023883E8: @ 0x023883E8
	bx lr
	arm_func_end FUN_023883E8

	arm_func_start FUN_023883EC
FUN_023883EC: @ 0x023883EC
	push {r3, lr}
	mov r0, #-0x48000000
	mov r1, #0
	bl FUN_023882F4
	mov r0, #0x7000000
	bl FUN_023883C8
	mov r1, #0x2000
	rsb r1, r1, #0
	ldr r2, _02388434 @ =0x040001A4
	and r0, r0, r1
	str r0, [r2]
_02388418:
	ldr r0, [r2]
	tst r0, #0x800000
	beq _02388418
	ldr r0, _02388438 @ =0x04100010
	ldr r0, [r0]
	pop {r3, lr}
	bx lr
	.align 2, 0
_02388434: .4byte 0x040001A4
_02388438: .4byte 0x04100010
	arm_func_end FUN_023883EC

	arm_func_start FUN_0238843C
FUN_0238843C: @ 0x0238843C
	push {r4, lr}
	ldr r0, _02388468 @ =0x038085E0
	mov r1, #0
	mov r2, r1
	bl FUN_0238846C
	bl FUN_023883EC
	mov r4, r0
	bl FUN_02388354
	mov r0, r4
	pop {r4, lr}
	bx lr
	.align 2, 0
_02388468: .4byte 0x038085E0
	arm_func_end FUN_0238843C

	arm_func_start FUN_0238846C
FUN_0238846C: @ 0x0238846C
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl FUN_02382F90
	mov r4, r0
	b _02388490
_02388488:
	add r0, r7, #0xf4
	bl FUN_02381544
_02388490:
	ldr r0, [r7, #0xfc]
	tst r0, #4
	bne _02388488
	ldr r1, [r7, #0xfc]
	mov r0, r4
	orr r1, r1, #4
	str r1, [r7, #0xfc]
	str r6, [r7, #0x3c]
	str r5, [r7, #0x40]
	bl FUN_02382FA4
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_0238846C

	arm_func_start FUN_023884C0
FUN_023884C0: @ 0x023884C0
	push {r3, lr}
	ldr ip, _02388520 @ =0x038085E0
	ldr r0, [ip, #0xfc]
	cmp r0, #0
	bne _02388518
	ldr r0, _02388524 @ =0x03808BF4
	mov r2, #0
	sub r1, r2, #1
	mov r3, #1
	str r3, [ip, #0xfc]
	str r2, [ip, #0x28]
	str r2, [ip, #0x24]
	str r2, [ip, #0x20]
	str r1, [ip, #0x2c]
	str r2, [ip, #0x3c]
	str r2, [ip, #0x40]
	str r2, [r0]
	bl FUN_02387828
	ldr r1, _02388528 @ =0x0380017C
	ldr r0, _0238852C @ =0x03808C00
	str r1, [r0]
	bl FUN_02388848
_02388518:
	pop {r3, lr}
	bx lr
	.align 2, 0
_02388520: .4byte 0x038085E0
_02388524: .4byte 0x03808BF4
_02388528: .4byte 0x0380017C
_0238852C: .4byte 0x03808C00
	arm_func_end FUN_023884C0

	arm_func_start FUN_02388530
FUN_02388530: @ 0x02388530
	push {r3, lr}
	cmp r0, #0xb
	bne _02388608
	cmp r2, #0
	beq _02388608
	ldr r0, _02388610 @ =0x038085E0
	ldr r2, [r0, #8]
	cmp r2, #0
	streq r1, [r0, #4]
	ldr r2, [r0, #4]
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _023885D4
_02388564: @ jump table
	b _023885A4 @ case 0
	b _023885D4 @ case 1
	b _023885C8 @ case 2
	b _023885C8 @ case 3
	b _023885C8 @ case 4
	b _023885C8 @ case 5
	b _023885C8 @ case 6
	b _023885C8 @ case 7
	b _023885C8 @ case 8
	b _023885C8 @ case 9
	b _023885C8 @ case 10
	b _023885C8 @ case 11
	b _023885C8 @ case 12
	b _023885C8 @ case 13
	b _023885C8 @ case 14
	b _023885C8 @ case 15
_023885A4:
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _023885D4
	cmp r2, #1
	ldreq r2, [r0, #0xfc]
	streq r1, [r0]
	orreq r1, r2, #0x10
	streq r1, [r0, #0xfc]
	b _023885D4
_023885C8:
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x10
	str r1, [r0, #0xfc]
_023885D4:
	ldr r1, [r0, #0xfc]
	tst r1, #0x10
	ldreq r1, [r0, #8]
	addeq r1, r1, #1
	streq r1, [r0, #8]
	beq _02388608
	ldr r1, [r0, #0xfc]
	mov r2, #0
	str r2, [r0, #8]
	tst r1, #4
	ldrne r0, [r0, #0xec]
	addeq r0, r0, #0x48
	bl FUN_02381620
_02388608:
	pop {r3, lr}
	bx lr
	.align 2, 0
_02388610: .4byte 0x038085E0
	arm_func_end FUN_02388530

	arm_func_start FUN_02388614
FUN_02388614: @ 0x02388614
	push {r4, r5, r6, r7, r8, lr}
	ldr r4, _02388844 @ =0x038085E0
_0238861C:
	mov r5, #0
	bl FUN_02382F90
	mov r6, r0
	add r8, r4, #0x48
	mov r7, r5
_02388630:
	ldr r0, [r4, #0xfc]
	tst r0, #4
	bne _02388668
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _02388674
	ldr r0, [r4, #0xfc]
	mov r5, #1
	orr r0, r0, #4
	str r0, [r4, #0xfc]
	ldr r0, [r4, #0xfc]
	bic r0, r0, #0x10
	str r0, [r4, #0xfc]
	b _02388684
_02388668:
	ldr r0, [r4, #0xfc]
	tst r0, #8
	bne _02388684
_02388674:
	mov r0, r7
	str r8, [r4, #0xec]
	bl FUN_02381544
	b _02388630
_02388684:
	mov r0, r6
	bl FUN_02382FA4
	cmp r5, #0
	beq _02388830
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r3, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r3, #0x58]
	mov r0, #1
	tst r1, r0, lsl r2
	moveq r0, #3
	streq r0, [r3]
	beq _023887D4
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _023887CC
_023886CC: @ jump table
	b _023887D4 @ case 0
	b _023887D4 @ case 1
	b _0238870C @ case 2
	b _02388714 @ case 3
	b _02388724 @ case 4
	b _023887CC @ case 5
	b _02388730 @ case 6
	b _02388744 @ case 7
	b _02388758 @ case 8
	b _0238876C @ case 9
	b _023887CC @ case 10
	b _02388780 @ case 11
	b _023887A0 @ case 12
	b _023887A8 @ case 13
	b _023887BC @ case 14
	b _02388790 @ case 15
_0238870C:
	bl FUN_02387E04
	b _023887D4
_02388714:
	bl FUN_023883EC
	ldr r1, [r4]
	str r0, [r1, #8]
	b _023887D4
_02388724:
	mov r0, #3
	str r0, [r3]
	b _023887D4
_02388730:
	ldr r0, [r3, #0xc]
	ldr r1, [r3, #0x10]
	ldr r2, [r3, #0x14]
	bl FUN_02387E5C
	b _023887D4
_02388744:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl FUN_02387F80
	b _023887D4
_02388758:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl FUN_02387EC8
	b _023887D4
_0238876C:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl FUN_02388038
	b _023887D4
_02388780:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl FUN_023880C8
	b _023887D4
_02388790:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl FUN_02388164
	b _023887D4
_023887A0:
	bl FUN_02388200
	b _023887D4
_023887A8:
	bl FUN_023879D4
	ldr r1, [r4]
	ldr r1, [r1, #0x10]
	strb r0, [r1]
	b _023887D4
_023887BC:
	ldr r0, [r3, #0xc]
	ldrb r0, [r0]
	bl FUN_0238825C
	b _023887D4
_023887CC:
	mov r0, #3
	str r0, [r3]
_023887D4:
	mov r6, #0xb
	mov r5, #1
_023887DC:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	bl FUN_02383610
	cmp r0, #0
	blt _023887DC
	bl FUN_02382F90
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl FUN_02381598
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _02388824
	add r0, r4, #0x48
	bl FUN_02381620
_02388824:
	mov r0, r5
	bl FUN_02382FA4
	b _0238861C
_02388830:
	ldr r1, [r4, #0x44]
	mov r0, r4
	mov lr, pc
	bx r1
	arm_func_end FUN_02388614

	arm_func_start FUN_02388840
FUN_02388840: @ 0x02388840
	b _0238861C
	.align 2, 0
_02388844: .4byte 0x038085E0
	arm_func_end FUN_02388840

	arm_func_start FUN_02388848
FUN_02388848: @ 0x02388848
	push {r3, r4, r5, lr}
	ldr r0, _02388898 @ =0x03808E20
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _02388890
	mov r1, #1
	str r1, [r0, #8]
	bl FUN_023834B4
	mov r5, #0xe
	mov r4, #0
_02388870:
	mov r0, r5
	mov r1, r4
	bl FUN_023835EC
	cmp r0, #0
	beq _02388870
	ldr r1, _0238889C @ =0x03800634
	mov r0, #0xe
	bl FUN_0238359C
_02388890:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02388898: .4byte 0x03808E20
_0238889C: .4byte 0x03800634
	arm_func_end FUN_02388848

	arm_func_start FUN_023888A0
FUN_023888A0: @ 0x023888A0
	push {r4, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	bne _023888F8
	mov r0, #0
	bl FUN_02383184
	mov r0, #1
	bl FUN_02383184
	mov r0, #2
	bl FUN_02383184
	mov r0, #3
	bl FUN_02383184
	mov r0, #0
	bl FUN_0238B71C
	bl FUN_02382F90
	mov r4, r0
	bl FUN_02383908
	bl FUN_0238DCA8
	mov r0, r4
	bl FUN_02382FA4
	bl FUN_02383100
	b _023888FC
_023888F8:
	bl FUN_02383100
_023888FC:
	pop {r4, lr}
	bx lr
	arm_func_end FUN_023888A0

	arm_func_start FUN_02388904
FUN_02388904: @ 0x02388904
	push {r3, lr}
	ldr r0, _02388944 @ =0x03808E20
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _02388934
	ldr r0, _02388948 @ =0x027FFE1F
	ldrb r0, [r0]
	tst r0, #0x80
	beq _02388930
	bl FUN_0238894C
	b _02388934
_02388930:
	bl FUN_023889EC
_02388934:
	ldr r0, _02388944 @ =0x03808E20
	ldr r0, [r0, #0xc]
	pop {r3, lr}
	bx lr
	.align 2, 0
_02388944: .4byte 0x03808E20
_02388948: .4byte 0x027FFE1F
	arm_func_end FUN_02388904

	arm_func_start FUN_0238894C
FUN_0238894C: @ 0x0238894C
	push {r3, r4, r5, lr}
	mov r5, #1
	bl FUN_02380E8C
	mov r4, r0
	mvn r0, #2
	cmp r4, r0
	beq _023889C4
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl FUN_02380E5C
	cmp r0, #0
	bne _023889B8
	ldr r1, _023889E4 @ =0x027FFC10
	ldrh r0, [r1]
	cmp r0, #0
	subeq r0, r1, #0x410
	subne r0, r1, #0x10
	ldr r0, [r0]
	str r0, [sp]
	bl FUN_0238843C
	ldr r1, [sp]
	cmp r0, r1
	lsl r0, r4, #0x10
	moveq r5, #1
	lsr r0, r0, #0x10
	movne r5, #0
	bl FUN_02380E3C
_023889B8:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl FUN_02380F24
_023889C4:
	ldr r1, _023889E8 @ =0x03808E20
	cmp r5, #0
	moveq r2, #1
	movne r2, #0
	str r2, [r1, #0xc]
	mov r0, r5
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_023889E4: .4byte 0x027FFC10
_023889E8: .4byte 0x03808E20
	arm_func_end FUN_0238894C

	arm_func_start FUN_023889EC
FUN_023889EC: @ 0x023889EC
	ldr r0, _02388A10 @ =0x04000214
	mov r2, #1
	ldr r1, [r0]
	mov r0, r2
	tst r1, #0x100000
	ldrne r1, _02388A14 @ =0x03808E20
	movne r0, #0
	strne r2, [r1, #0xc]
	bx lr
	.align 2, 0
_02388A10: .4byte 0x04000214
_02388A14: .4byte 0x03808E20
	arm_func_end FUN_023889EC

	arm_func_start FUN_02388A18
FUN_02388A18: @ 0x02388A18
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02388B04 @ =0x03808E20
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02388AFC
	ldr r2, _02388B08 @ =0x027FFC40
	ldrh r0, [r2]
	cmp r0, #2
	beq _02388AFC
	ldr r1, _02388B0C @ =0x03806B00
	mvn r0, #0
	ldr r3, [r1]
	cmp r3, r0
	ldreq r0, [r2, #-4]
	addeq r0, r0, #0xa
	streq r0, [r1]
	beq _02388AFC
	ldr r0, [r2, #-4]!
	cmp r0, r3
	blo _02388AFC
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1]
	bl FUN_02388904
	cmp r0, #0
	beq _02388AAC
	ldr r0, _02388B04 @ =0x03808E20
	mov r1, #1
	str r1, [r0, #4]
	bl FUN_02387924
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _02388AAC
	ldr r0, _02388B0C @ =0x03806B00
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02388AFC
_02388AAC:
	ldr r0, _02388B04 @ =0x03808E20
	ldr r1, _02388B0C @ =0x03806B00
	ldr r0, [r0, #4]
	mov r2, #0
	str r2, [r1, #4]
	cmp r0, #0
	beq _02388AFC
	mov r7, #0x64
	mov r6, #0xe
	mov r5, #0x11
	mov r4, r2
	b _02388AE4
_02388ADC:
	mov r0, r7
	bl FUN_02380C9C
_02388AE4:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	bne _02388ADC
_02388AFC:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02388B04: .4byte 0x03808E20
_02388B08: .4byte 0x027FFC40
_02388B0C: .4byte 0x03806B00
	arm_func_end FUN_02388A18

	thumb_func_start FUN_02388B10
FUN_02388B10: @ 0x02388B10
	svc #0
	bx lr
	thumb_func_end FUN_02388B10

	thumb_func_start FUN_02388B14
FUN_02388B14: @ 0x02388B14
	svc #3
	bx lr
	thumb_func_end FUN_02388B14

	thumb_func_start FUN_02388B18
FUN_02388B18: @ 0x02388B18
	ldr r2, _02388B24 @ =0x04000000
	mov ip, r2
	movs r2, #0
	svc #4
	bx lr
	.align 2, 0
_02388B24: .4byte 0x04000000
	thumb_func_end FUN_02388B18

	thumb_func_start FUN_02388B28
FUN_02388B28: @ 0x02388B28
	movs r2, #0
	svc #5
	bx lr
	thumb_func_end FUN_02388B28

	non_word_aligned_thumb_func_start FUN_02388B2E
FUN_02388B2E: @ 0x02388B2E
	svc #6
	bx lr
	thumb_func_end FUN_02388B2E

	non_word_aligned_thumb_func_start FUN_02388B32
FUN_02388B32: @ 0x02388B32
	svc #7
	bx lr
	thumb_func_end FUN_02388B32

	non_word_aligned_thumb_func_start FUN_02388B36
FUN_02388B36: @ 0x02388B36
	svc #8
	bx lr
	thumb_func_end FUN_02388B36

	non_word_aligned_thumb_func_start FUN_02388B3A
FUN_02388B3A: @ 0x02388B3A
	adds r1, r0, #0
	movs r0, #1
	svc #8
	bx lr
	thumb_func_end FUN_02388B3A

	non_word_aligned_thumb_func_start FUN_02388B42
FUN_02388B42: @ 0x02388B42
	adds r1, r0, #0
	movs r0, #0
	svc #8
	bx lr
	thumb_func_end FUN_02388B42

	non_word_aligned_thumb_func_start FUN_02388B4A
FUN_02388B4A: @ 0x02388B4A
	svc #9
	bx lr
	thumb_func_end FUN_02388B4A

	non_word_aligned_thumb_func_start FUN_02388B4E
FUN_02388B4E: @ 0x02388B4E
	svc #9
	adds r0, r1, #0
	bx lr
	thumb_func_end FUN_02388B4E

	thumb_func_start FUN_02388B54
FUN_02388B54: @ 0x02388B54
	svc #0xb
	bx lr
	thumb_func_end FUN_02388B54

	thumb_func_start FUN_02388B58
FUN_02388B58: @ 0x02388B58
	svc #0xc
	bx lr
	thumb_func_end FUN_02388B58

	thumb_func_start FUN_02388B5C
FUN_02388B5C: @ 0x02388B5C
	svc #0xd
	bx lr
	thumb_func_end FUN_02388B5C

	thumb_func_start FUN_02388B60
FUN_02388B60: @ 0x02388B60
	svc #0xe
	bx lr
	thumb_func_end FUN_02388B60

	thumb_func_start FUN_02388B64
FUN_02388B64: @ 0x02388B64
	svc #0xf
	bx lr
	thumb_func_end FUN_02388B64

	thumb_func_start FUN_02388B68
FUN_02388B68: @ 0x02388B68
	svc #0x10
	bx lr
	thumb_func_end FUN_02388B68

	thumb_func_start FUN_02388B6C
FUN_02388B6C: @ 0x02388B6C
	svc #0x11
	bx lr
	thumb_func_end FUN_02388B6C

	thumb_func_start FUN_02388B70
FUN_02388B70: @ 0x02388B70
	svc #0x12
	bx lr
	thumb_func_end FUN_02388B70

	thumb_func_start FUN_02388B74
FUN_02388B74: @ 0x02388B74
	svc #0x13
	bx lr
	thumb_func_end FUN_02388B74

	thumb_func_start FUN_02388B78
FUN_02388B78: @ 0x02388B78
	svc #0x14
	bx lr
	thumb_func_end FUN_02388B78

	thumb_func_start FUN_02388B7C
FUN_02388B7C: @ 0x02388B7C
	svc #0x15
	bx lr
	thumb_func_end FUN_02388B7C

	thumb_func_start FUN_02388B80
FUN_02388B80: @ 0x02388B80
	svc #0x1a
	bx lr
	thumb_func_end FUN_02388B80

	thumb_func_start FUN_02388B84
FUN_02388B84: @ 0x02388B84
	svc #0x1b
	bx lr
	thumb_func_end FUN_02388B84

	thumb_func_start FUN_02388B88
FUN_02388B88: @ 0x02388B88
	svc #0x1c
	bx lr
	thumb_func_end FUN_02388B88

	arm_func_start FUN_02388B8C
FUN_02388B8C: @ 0x02388B8C
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r1, _02388C8C @ =0x03808E30
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _02388C80
	ldr r0, _02388C90 @ =0x03808E34
	mov r2, #0
	str r2, [r0]
	mov r3, #1
	mov r2, #5
	strh r3, [r1]
	str r2, [r0, #4]
	bl FUN_02389068
	bl FUN_0238BACC
	bl FUN_0238A554
	bl FUN_02389BB0
	bl FUN_023834B4
	ldr r1, _02388C94 @ =0x03800D94
	mov r0, #6
	bl FUN_0238359C
	ldr r1, _02388C94 @ =0x03800D94
	mov r0, #9
	bl FUN_0238359C
	ldr r1, _02388C94 @ =0x03800D94
	mov r0, #8
	bl FUN_0238359C
	ldr r1, _02388C94 @ =0x03800D94
	mov r0, #4
	bl FUN_0238359C
	ldr r0, _02388C98 @ =0x038090E0
	ldr r1, _02388C9C @ =0x03809100
	mov r2, #0x10
	bl FUN_0238193C
	mov sb, #0
	mov r6, #0x18
	ldr r8, _02388CA0 @ =0x03809140
	mov r7, sb
	mov r5, r6
_02388C2C:
	mla r0, sb, r5, r8
	mov r1, r7
	mov r2, r6
	bl FUN_023832E8
	add sb, sb, #1
	cmp sb, #0x10
	blt _02388C2C
	ldr r0, _02388C90 @ =0x03808E34
	mov r2, #0
	str r2, [r0, #0x48c]
	str r2, [r0, #0x494]
	str r2, [r0, #0x490]
	mov r0, #0x200
	str r0, [sp]
	ldr r0, _02388CA4 @ =0x03808E3C
	ldr r1, _02388CA8 @ =0x03800D28
	ldr r3, _02388C98 @ =0x038090E0
	str r4, [sp, #4]
	bl FUN_023812C0
	ldr r0, _02388CA4 @ =0x03808E3C
	bl FUN_02381620
_02388C80:
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02388C8C: .4byte 0x03808E30
_02388C90: .4byte 0x03808E34
_02388C94: .4byte 0x03800D94
_02388C98: .4byte 0x038090E0
_02388C9C: .4byte 0x03809100
_02388CA0: .4byte 0x03809140
_02388CA4: .4byte 0x03808E3C
_02388CA8: .4byte 0x03800D28
	arm_func_end FUN_02388B8C

	arm_func_start FUN_02388CAC
FUN_02388CAC: @ 0x02388CAC
	push {r4, r5, r6, lr}
	ldr r5, _02388D00 @ =0x038092C4
	ldr r4, _02388D04 @ =0x03808E34
	mov r6, r0
_02388CBC:
	bl FUN_02382F90
	ldr r1, [r4]
	cmp r1, #0
	beq _02388CDC
	bl FUN_02382FA4
	mov r0, r5
	bl FUN_02381544
	b _02388CBC
_02388CDC:
	ldr r1, _02388D04 @ =0x03808E34
	mov r2, #1
	str r2, [r1]
	mov r2, #4
	str r2, [r1, #4]
	str r6, [r1, #0x498]
	bl FUN_02382FA4
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02388D00: .4byte 0x038092C4
_02388D04: .4byte 0x03808E34
	arm_func_end FUN_02388CAC

	arm_func_start FUN_02388D08
FUN_02388D08: @ 0x02388D08
	push {r3, lr}
	ldr r1, _02388D60 @ =0x03808E34
	ldr r2, [r1]
	cmp r2, #0
	beq _02388D58
	ldr r2, [r1, #4]
	cmp r2, #4
	ldreq r1, [r1, #0x498]
	cmpeq r1, r0
	bne _02388D58
	bl FUN_02382F90
	ldr r1, _02388D60 @ =0x03808E34
	mov r2, #5
	str r2, [r1, #4]
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #0x498]
	bl FUN_02382FA4
	ldr r0, _02388D64 @ =0x038092C4
	bl FUN_02381598
_02388D58:
	pop {r3, lr}
	bx lr
	.align 2, 0
_02388D60: .4byte 0x03808E34
_02388D64: .4byte 0x038092C4
	arm_func_end FUN_02388D08

	arm_func_start FUN_02388D68
FUN_02388D68: @ 0x02388D68
	push {r4, r5, r6, lr}
	and r2, r0, #0x70
	cmp r2, #0x30
	bgt _02388DA0
	bge _02388DEC
	cmp r2, #0x10
	bgt _02388D94
	bge _02388DD4
	cmp r2, #0
	beq _02388DD4
	b _02388DF0
_02388D94:
	cmp r2, #0x20
	beq _02388DEC
	b _02388DF0
_02388DA0:
	cmp r2, #0x50
	bgt _02388DB8
	bge _02388DDC
	cmp r2, #0x40
	beq _02388DDC
	b _02388DF0
_02388DB8:
	cmp r2, #0x60
	bgt _02388DC8
	beq _02388DE4
	b _02388DF0
_02388DC8:
	cmp r2, #0x70
	beq _02388DE4
	b _02388DF0
_02388DD4:
	mov r4, #6
	b _02388DF0
_02388DDC:
	mov r4, #9
	b _02388DF0
_02388DE4:
	mov r4, #8
	b _02388DF0
_02388DEC:
	mov r4, #4
_02388DF0:
	and r0, r0, #0xff
	orr r0, r0, #0x80
	lsl r0, r0, #8
	orr r2, r0, #0x3000000
	and r0, r1, #0xff
	orr r6, r2, r0
	mov r5, #0
_02388E0C:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl FUN_02383610
	cmp r0, #0
	blt _02388E0C
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end FUN_02388D68

	arm_func_start FUN_02388E2C
FUN_02388E2C: @ 0x02388E2C
	ldr r0, _02388E44 @ =0x03808E34
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_02388E44: .4byte 0x03808E34
	arm_func_end FUN_02388E2C

	arm_func_start FUN_02388E48
FUN_02388E48: @ 0x02388E48
	ldr r1, _02388E5C @ =0x03808E34
	mov r2, #1
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_02388E5C: .4byte 0x03808E34
	arm_func_end FUN_02388E48

	arm_func_start FUN_02388E60
FUN_02388E60: @ 0x02388E60
	push {r3, lr}
	ldr r1, _02388E94 @ =0x03808E34
	ldr r2, [r1, #4]
	cmp r2, r0
	bne _02388E8C
	ldr r0, _02388E98 @ =0x038092C4
	mov r2, #5
	str r2, [r1, #4]
	mov r2, #0
	str r2, [r1]
	bl FUN_02381598
_02388E8C:
	pop {r3, lr}
	bx lr
	.align 2, 0
_02388E94: .4byte 0x03808E34
_02388E98: .4byte 0x038092C4
	arm_func_end FUN_02388E60

	arm_func_start FUN_02388E9C
FUN_02388E9C: @ 0x02388E9C
	push {r0, r1, r2, r3}
	push {r4, r5, r6, lr}
	ldrh r2, [sp, #0x18]
	mov r5, r0
	cmp r2, #4
	mov r4, r1
	movhi r0, #0
	bhi _02388F58
	bl FUN_02382F90
	ldr ip, _02388F64 @ =0x03808E34
	add r2, sp, #0x18
	ldr r3, [ip, #0x48c]
	mov r1, #0x18
	mul r6, r3, r1
	ldr lr, _02388F68 @ =0x03809140
	ldr r3, _02388F6C @ =0x03809144
	str r5, [lr, r6]
	ldr r5, [ip, #0x48c]
	bic r2, r2, #3
	mul lr, r5, r1
	add r5, r2, #4
	ldrh r1, [sp, #0x18]
	str r4, [r3, lr]
	mov r6, #0
	mov r2, #0x18
	b _02388F20
_02388F04:
	ldr r4, [ip, #0x48c]
	add r5, r5, #4
	mla r3, r4, r2, ip
	add r3, r3, r6, lsl #2
	ldr r4, [r5, #-4]
	add r6, r6, #1
	str r4, [r3, #0x314]
_02388F20:
	cmp r6, r1
	blt _02388F04
	ldr r1, _02388F64 @ =0x03808E34
	ldr r4, [r1, #0x48c]
	add r2, r4, #1
	and r2, r2, #0xf
	str r2, [r1, #0x48c]
	bl FUN_02382FA4
	ldr r1, _02388F68 @ =0x03809140
	mov r0, #0x18
	mla r1, r4, r0, r1
	ldr r0, _02388F70 @ =0x038090E0
	mov r2, #0
	bl FUN_02381964
_02388F58:
	pop {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02388F64: .4byte 0x03808E34
_02388F68: .4byte 0x03809140
_02388F6C: .4byte 0x03809144
_02388F70: .4byte 0x038090E0
	arm_func_end FUN_02388E9C

	arm_func_start FUN_02388F74
FUN_02388F74: @ 0x02388F74
	push {r3, lr}
	ldr r0, _02388F90 @ =0x038090E0
	add r1, sp, #0
	mov r2, #0
	bl FUN_02381A8C
	pop {r3, lr}
	bx lr
	.align 2, 0
_02388F90: .4byte 0x038090E0
	arm_func_end FUN_02388F74

	arm_func_start FUN_02388F94
FUN_02388F94: @ 0x02388F94
	push {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r6, _02388FFC @ =0x038090E0
	add r5, sp, #0
	mov r4, #1
_02388FA8:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_023819F0
	ldr r0, [sp]
	ldr r1, [r0]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02388FA8
_02388FCC: @ jump table
	b _02388FDC @ case 0
	b _02388FF4 @ case 1
	b _02388FE4 @ case 2
	b _02388FEC @ case 3
_02388FDC:
	bl FUN_02389350
	b _02388FA8
_02388FE4:
	bl FUN_0238A908
	b _02388FA8
_02388FEC:
	bl FUN_02389DA8
	b _02388FA8
_02388FF4:
	bl FUN_0238BC9C
	b _02388FA8
	.align 2, 0
_02388FFC: .4byte 0x038090E0
	arm_func_end FUN_02388F94

	arm_func_start FUN_02389000
FUN_02389000: @ 0x02389000
	push {r3, lr}
	cmp r2, #0
	bne _02389060
	sub r0, r0, #4
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02389060
_0238901C: @ jump table
	b _02389058 @ case 0
	b _02389060 @ case 1
	b _02389034 @ case 2
	b _02389060 @ case 3
	b _0238904C @ case 4
	b _02389040 @ case 5
_02389034:
	mov r0, r1
	bl FUN_02389170
	b _02389060
_02389040:
	mov r0, r1
	bl FUN_0238A59C
	b _02389060
_0238904C:
	mov r0, r1
	bl FUN_02389BEC
	b _02389060
_02389058:
	mov r0, r1
	bl FUN_0238BAF4
_02389060:
	pop {r3, lr}
	bx lr
	arm_func_end FUN_02389000

	arm_func_start FUN_02389068
FUN_02389068: @ 0x02389068
	push {r4, r5, r6, r7, r8, lr}
	ldr r0, _02389130 @ =0x038092D4
	mov r3, #0
	str r3, [r0, #0x20]
	mov r1, #0x14
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	mov r2, r3
_02389088:
	lsl r1, r3, #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _02389088
	bl FUN_02382A28
	cmp r0, #0
	bne _023890AC
	bl FUN_023829DC
_023890AC:
	ldr r7, _02389134 @ =0x03809300
	ldr r5, _02389138 @ =0x54505641
	mov r8, #0
	mov r4, #0x28
_023890BC:
	mul r6, r8, r4
	add r0, r7, r6
	bl FUN_02382B14
	mov r1, r5
	add r0, r7, r6
	bl FUN_02382CA4
	add r8, r8, #1
	cmp r8, #4
	blt _023890BC
	ldr r2, _0238913C @ =0x040001C0
_023890E4:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _023890E4
	ldr r1, _02389140 @ =0x00008A01
	ldr r0, _02389144 @ =0x040001C2
	strh r1, [r2]
	mov r1, #0x84
	strh r1, [r0]
	sub r1, r0, #2
_02389108:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _02389108
	bl FUN_0238914C
	ldr r1, _02389148 @ =0x00008201
	ldr r0, _0238913C @ =0x040001C0
	strh r1, [r0]
	bl FUN_0238914C
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02389130: .4byte 0x038092D4
_02389134: .4byte 0x03809300
_02389138: .4byte 0x54505641
_0238913C: .4byte 0x040001C0
_02389140: .4byte 0x00008A01
_02389144: .4byte 0x040001C2
_02389148: .4byte 0x00008201
	arm_func_end FUN_02389068

	arm_func_start FUN_0238914C
FUN_0238914C: @ 0x0238914C
	ldr r0, _0238916C @ =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_0238915C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238915C
	bx lr
	.align 2, 0
_0238916C: .4byte 0x040001C2
	arm_func_end FUN_0238914C

	arm_func_start FUN_02389170
FUN_02389170: @ 0x02389170
	push {r3, r4, lr}
	sub sp, sp, #4
	tst r0, #0x2000000
	beq _023891A0
	ldr r1, _02389348 @ =0x038092D4
	mov r4, #0
	mov r3, r4
_0238918C:
	lsl r2, r4, #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _0238918C
_023891A0:
	ldr r2, _02389348 @ =0x038092D4
	and r1, r0, #0xf0000
	lsr r1, r1, #0x10
	lsl r1, r1, #1
	strh r0, [r2, r1]
	tst r0, #0x1000000
	beq _0238933C
	ldrh r1, [r2]
	and r0, r1, #0xff00
	lsl r0, r0, #8
	lsr r4, r0, #0x10
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _02389330
_023891D8: @ jump table
	b _0238921C @ case 0
	b _02389244 @ case 1
	b _023892E0 @ case 2
	b _023891E8 @ case 3
_023891E8:
	and r0, r1, #0xff
	lsl r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r0, #3
	bne _02389208
	mov r1, #2
	bl FUN_02388D68
	b _0238933C
_02389208:
	str r3, [r2, #0x24]
	mov r1, #0
	str r3, [r2, #0x28]
	bl FUN_02388D68
	b _0238933C
_0238921C:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl FUN_02388E9C
	cmp r0, #0
	bne _0238933C
	mov r0, r4
	mov r1, #4
	bl FUN_02388D68
	b _0238933C
_02389244:
	ldr r0, [r2, #0x20]
	cmp r0, #0
	beq _02389260
	mov r0, r4
	mov r1, #3
	bl FUN_02388D68
	b _0238933C
_02389260:
	and r0, r1, #0xff
	lsl r0, r0, #0x10
	lsrs r3, r0, #0x10
	beq _02389278
	cmp r3, #4
	bls _02389288
_02389278:
	mov r0, r4
	mov r1, #2
	bl FUN_02388D68
	b _0238933C
_02389288:
	ldrh ip, [r2, #2]
	ldr r0, _0238934C @ =0x00000107
	cmp ip, r0
	blo _023892A8
	mov r0, r4
	mov r1, #2
	bl FUN_02388D68
	b _0238933C
_023892A8:
	mov r1, r4
	mov r0, #0
	mov r2, #2
	str ip, [sp]
	bl FUN_02388E9C
	cmp r0, #0
	ldrne r0, _02389348 @ =0x038092D4
	movne r1, #1
	strne r1, [r0, #0x20]
	bne _0238933C
	mov r0, r4
	mov r1, #4
	bl FUN_02388D68
	b _0238933C
_023892E0:
	ldr r0, [r2, #0x20]
	cmp r0, #2
	beq _023892FC
	mov r0, r4
	mov r1, #3
	bl FUN_02388D68
	b _0238933C
_023892FC:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl FUN_02388E9C
	cmp r0, #0
	ldrne r0, _02389348 @ =0x038092D4
	movne r1, #3
	strne r1, [r0, #0x20]
	bne _0238933C
	mov r0, r4
	mov r1, #4
	bl FUN_02388D68
	b _0238933C
_02389330:
	mov r0, r4
	mov r1, #1
	bl FUN_02388D68
_0238933C:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	.align 2, 0
_02389348: .4byte 0x038092D4
_0238934C: .4byte 0x00000107
	arm_func_end FUN_02389170

	arm_func_start FUN_02389350
FUN_02389350: @ 0x02389350
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldr r1, [sl, #4]
	cmp r1, #2
	bhi _02389384
	cmp r1, #0
	beq _0238939C
	cmp r1, #1
	beq _02389510
	cmp r1, #2
	beq _023895D4
	b _02389620
_02389384:
	cmp r1, #0x10
	bne _02389620
	ldr r0, _0238962C @ =0x038092D4
	ldr r0, [r0, #0x20]
	cmp r0, #2
	bne _02389620
_0238939C:
	bl FUN_02382F90
	mov r4, r0
	mov r0, #0
	bl FUN_02388E2C
	cmp r0, #0
	bne _023893D4
	mov r0, r4
	bl FUN_02382FA4
	ldr r0, [sl, #4]
	mov r1, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	b _02389620
_023893D4:
	mov r0, #0
	bl FUN_02388E48
	mov r0, r4
	bl FUN_02382FA4
	ldr r1, _0238962C @ =0x038092D4
	add r0, sp, #8
	ldr r1, [r1, #0x24]
	add r2, sp, #4
	bl FUN_023899B8
	ldr r0, [sp, #8]
	ldrh r2, [sp, #4]
	lsl r1, r0, #7
	lsrs r1, r1, #0x1f
	ldreq r0, _02389630 @ =0x038092D0
	moveq r1, #0
	strbeq r1, [r0, #1]
	strbeq r1, [r0]
	beq _023894BC
	lsl r0, r0, #5
	lsrs r0, r0, #0x1e
	beq _02389468
	ldr r1, _02389630 @ =0x038092D0
	mov r3, #0
	strb r3, [r1]
	ldrb r0, [r1, #1]
	add r2, r0, #1
	and r0, r2, #0xff
	strb r2, [r1, #1]
	cmp r0, #4
	blo _023894BC
	ldr r0, _0238962C @ =0x038092D4
	strb r3, [r1, #1]
	ldr r1, [r0, #0x24]
	cmp r1, #0x23
	addlt r1, r1, #1
	strlt r1, [r0, #0x24]
	b _023894BC
_02389468:
	ldr r0, _0238962C @ =0x038092D4
	ldr r1, _02389630 @ =0x038092D0
	ldr r4, [r0, #0x24]
	mov r5, #0
	strb r5, [r1, #1]
	cmp r2, r4, asr #1
	strbge r5, [r1]
	bge _023894BC
	ldrb r2, [r1]
	add r3, r2, #1
	and r2, r3, #0xff
	strb r3, [r1]
	cmp r2, #4
	blo _023894BC
	strb r5, [r1]
	ldr r2, [r0, #0x28]
	cmp r4, r2
	subgt r3, r4, #1
	movgt r2, #3
	strgt r3, [r0, #0x24]
	strbgt r2, [r1, #1]
_023894BC:
	ldrh r0, [sp, #8]
	ldr r1, _02389634 @ =0x027FFFAA
	strh r0, [r1]
	ldrh r0, [sp, #0xa]
	strh r0, [r1, #2]
	ldr r0, [sl, #4]
	cmp r0, #0
	bne _023894F0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #0
	bl FUN_02388D68
	b _02389504
_023894F0:
	ldr r1, [sl, #8]
	lsl r0, r0, #0x10
	and r1, r1, #0xff
	lsr r0, r0, #0x10
	bl FUN_02388D68
_02389504:
	mov r0, #0
	bl FUN_02388E60
	b _02389620
_02389510:
	ldr r6, _0238962C @ =0x038092D4
	ldr r0, [r6, #0x20]
	cmp r0, #1
	bne _023895C0
	ldr r8, _02389638 @ =0x00000107
	ldr r5, _0238963C @ =0x03809300
	mov sb, #0
	mov r7, #0xd7
	mov fp, #0xa
	mov r4, #0x28
	b _02389590
_0238953C:
	mul r0, sb, r8
	bl FUN_0238E6D4
	ldr r2, [sl, #0xc]
	mov r1, r8
	add r0, r2, r0
	bl FUN_0238E6D4
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0xc8
	blo _0238956C
	cmp r0, #0xd7
	movlo r0, r7
_0238956C:
	add r1, r6, sb, lsl #1
	strh r0, [r1, #0xcc]
	str sb, [sp]
	mla r0, sb, r4, r5
	ldrsh r1, [r1, #0xcc]
	ldr r3, _02389640 @ =0x038013DC
	mov r2, fp
	bl FUN_02382BB8
	add sb, sb, #1
_02389590:
	ldr r1, [sl, #8]
	cmp sb, r1
	blo _0238953C
	ldr r0, [sl, #4]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	ldr r0, _0238962C @ =0x038092D4
	mov r1, #2
	str r1, [r0, #0x20]
	b _02389620
_023895C0:
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	mov r1, #3
	bl FUN_02388D68
	b _02389620
_023895D4:
	ldr r0, _0238962C @ =0x038092D4
	ldr r0, [r0, #0x20]
	cmp r0, #3
	bne _02389610
	ldr r0, _02389644 @ =0x54505641
	bl FUN_02382D14
	ldr r0, [sl, #4]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	ldr r0, _0238962C @ =0x038092D4
	mov r1, #0
	str r1, [r0, #0x20]
	b _02389620
_02389610:
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	mov r1, #3
	bl FUN_02388D68
_02389620:
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0238962C: .4byte 0x038092D4
_02389630: .4byte 0x038092D0
_02389634: .4byte 0x027FFFAA
_02389638: .4byte 0x00000107
_0238963C: .4byte 0x03809300
_02389640: .4byte 0x038013DC
_02389644: .4byte 0x54505641
	arm_func_end FUN_02389350

	arm_func_start FUN_02389648
FUN_02389648: @ 0x02389648
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r3, r4
	mov r0, #0
	mov r1, #0x10
	mov r2, #1
	bl FUN_02388E9C
	cmp r0, #0
	bne _023896A0
	ldr r0, [sp]
	ldr r3, _023896AC @ =0x027FFFAA
	bic r0, r0, #0x6000000
	orr r0, r0, #0x6000000
	str r0, [sp]
	ldrh r0, [sp]
	ldrh r2, [sp, #2]
	strh r0, [r3]
	and r1, r4, #0xff
	mov r0, #0x10
	strh r2, [r3, #2]
	bl FUN_02388D68
_023896A0:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	.align 2, 0
_023896AC: .4byte 0x027FFFAA
	arm_func_end FUN_02389648

	arm_func_start FUN_023896B0
FUN_023896B0: @ 0x023896B0
	push {r3, lr}
	mov r0, #0x8000
	bl FUN_023837A8
	ldr r2, _0238978C @ =0x040001C0
_023896C0:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _023896C0
	ldr r1, _02389790 @ =0x00008A01
	ldr r0, _02389794 @ =0x040001C2
	strh r1, [r2]
	mov r1, #0x84
	strh r1, [r0]
	sub r1, r0, #2
_023896E4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _023896E4
	bl FUN_023897A4
	ldr r1, _02389798 @ =0x00008201
	ldr r0, _0238978C @ =0x040001C0
	strh r1, [r0]
	bl FUN_023897A4
	ldr r0, _0238979C @ =0x038093A8
	ldrh r0, [r0]
	cmp r0, #0
	bne _0238972C
	ldr r0, _023897A0 @ =0x04000136
	ldrh r0, [r0]
	tst r0, #0x40
	moveq r0, #1
	movne r0, #0
	b _02389784
_0238972C:
	ldr r2, _023897A0 @ =0x04000136
	ldrh r0, [r2]
	tst r0, #0x40
	moveq r0, #1
	beq _02389784
	ldr r1, _02389790 @ =0x00008A01
	mov r0, #0x84
	strh r1, [r2, #0x8a]
	strh r0, [r2, #0x8c]
_02389750:
	ldrh r0, [r2, #0x8a]
	tst r0, #0x80
	bne _02389750
	bl FUN_023897A4
	ldr r1, _02389798 @ =0x00008201
	ldr r0, _0238978C @ =0x040001C0
	strh r1, [r0]
	bl FUN_023897A4
	ldr r0, _023897A0 @ =0x04000136
	ldrh r0, [r0]
	tst r0, #0x40
	movne r0, #0
	moveq r0, #2
_02389784:
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238978C: .4byte 0x040001C0
_02389790: .4byte 0x00008A01
_02389794: .4byte 0x040001C2
_02389798: .4byte 0x00008201
_0238979C: .4byte 0x038093A8
_023897A0: .4byte 0x04000136
	arm_func_end FUN_023896B0

	arm_func_start FUN_023897A4
FUN_023897A4: @ 0x023897A4
	ldr r0, _023897C4 @ =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_023897B4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _023897B4
	bx lr
	.align 2, 0
_023897C4: .4byte 0x040001C2
	arm_func_end FUN_023897A4

	arm_func_start FUN_023897C8
FUN_023897C8: @ 0x023897C8
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	cmp r2, #0
	ldr r2, _023899A4 @ =0x040001C0
	mov r5, r3
	moveq r3, #0xd1
	moveq r4, #1
	mov r7, r0
	mov r6, r1
	movne r3, #0x91
	movne r4, #2
_023897F4:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _023897F4
	ldr r1, _023899A8 @ =0x00008A01
	ldr r0, _023899AC @ =0x040001C2
	strh r1, [r2]
	and r2, r3, #0xff
	strh r2, [r0]
	sub r1, r0, #2
_02389818:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _02389818
	lsl r0, r2, #0x10
	ldr r2, _023899A4 @ =0x040001C0
	mov ip, #0
	ldr r8, _023899B0 @ =0x00007FF8
	add r1, sp, #0
	lsr r0, r0, #0x10
	mov r3, ip
_02389840:
	strh r3, [r2, #2]
_02389844:
	ldrh sb, [r2]
	tst sb, #0x80
	bne _02389844
	ldrh sb, [r2, #2]
	and sb, sb, #0xff
	lsl lr, sb, #0x10
	lsr sb, lr, #8
	str sb, [r1, ip, lsl #2]
	strh r0, [r2, #2]
_02389868:
	ldrh sb, [r2]
	tst sb, #0x80
	bne _02389868
	ldrh lr, [r2, #2]
	ldr sb, [r1, ip, lsl #2]
	and lr, lr, #0xff
	lsl lr, lr, #0x10
	orr sb, sb, lr, lsr #16
	and lr, sb, r8
	asr lr, lr, #3
	str lr, [r1, ip, lsl #2]
	add ip, ip, #1
	cmp ip, #5
	blt _02389840
	ldr r0, _023899B4 @ =0x00008201
	strh r0, [r2]
	bl FUN_023897A4
	mov r8, #0
	mov sb, r8
	add r2, sp, #0
_023898B8:
	ldr r1, [r2, sb, lsl #2]
	add r3, sb, #1
	b _023898DC
_023898C4:
	ldr r0, [r2, r3, lsl #2]
	add r3, r3, #1
	subs r0, r1, r0
	rsbmi r0, r0, #0
	cmp r0, r8
	movgt r8, r0
_023898DC:
	cmp r3, #5
	blt _023898C4
	add sb, sb, #1
	cmp sb, #4
	blt _023898B8
	strh r8, [r5]
	mov r8, #0
	add r0, sp, #0
	b _02389974
_02389900:
	ldr r3, [r0, r8, lsl #2]
	add sb, r8, #1
	b _02389968
_0238990C:
	ldr r2, [r0, sb, lsl #2]
	subs r1, r3, r2
	rsbmi r1, r1, #0
	cmp r1, r6
	bgt _02389964
	add r1, sb, #1
	b _0238995C
_02389928:
	ldr r5, [r0, r1, lsl #2]
	subs ip, r3, r5
	rsbmi ip, ip, #0
	cmp ip, r6
	bgt _02389958
	add r0, r2, r3, lsl #1
	add r0, r5, r0
	asr r0, r0, #2
	bic r0, r0, #7
	strh r0, [r7]
	mov r0, #0
	b _02389998
_02389958:
	add r1, r1, #1
_0238995C:
	cmp r1, #5
	blt _02389928
_02389964:
	add sb, sb, #1
_02389968:
	cmp sb, #4
	blt _0238990C
	add r8, r8, #1
_02389974:
	cmp r8, #3
	blt _02389900
	ldr r2, [sp]
	ldr r1, [sp, #0x10]
	mov r0, r4
	add r1, r2, r1
	asr r1, r1, #1
	bic r1, r1, #7
	strh r1, [r7]
_02389998:
	add sp, sp, #0x14
	pop {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_023899A4: .4byte 0x040001C0
_023899A8: .4byte 0x00008A01
_023899AC: .4byte 0x040001C2
_023899B0: .4byte 0x00007FF8
_023899B4: .4byte 0x00008201
	arm_func_end FUN_023897C8

	arm_func_start FUN_023899B8
FUN_023899B8: @ 0x023899B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	movs r6, r1
	mov r5, r2
	mov r1, #0
	mov r7, r0
	strh r1, [r5]
	rsbmi r6, r6, #0
	bl FUN_023896B0
	movs r4, r0
	bne _02389A20
	ldr r1, [r7]
	mov r0, #0x1000
	rsb r0, r0, #0
	and r1, r1, r0
	ldr r0, _02389B9C @ =0xFF000FFF
	and r0, r1, r0
	bic r1, r0, #0x1000000
	bic r0, r1, #0x6000000
	str r1, [r7]
	orr r1, r0, #0x6000000
	str r1, [r7]
	ldr r0, _02389BA0 @ =0x038093A8
	mov r1, #0
	strh r1, [r0]
	b _02389B90
_02389A20:
	add r0, sp, #4
	add r3, sp, #2
	mov r1, r6
	mov r2, #0
	bl FUN_023897C8
	ldr r1, [r7]
	lsl r0, r0, #0x1e
	bic r1, r1, #0x6000000
	orr ip, r1, r0, lsr #5
	str ip, [r7]
	mov r1, #0x1000
	rsb r1, r1, #0
	ldrh r2, [sp, #4]
	and ip, ip, r1
	and r1, r2, r1, lsr #20
	orr ip, ip, r1
	add r0, sp, #4
	add r3, sp, #0
	mov r1, r6
	mov r2, #1
	str ip, [r7]
	bl FUN_023897C8
	cmp r0, #2
	bne _02389AA0
	ldr r1, [r7]
	lsl r0, r1, #5
	lsr r0, r0, #0x1e
	orr r0, r0, #2
	bic r1, r1, #0x6000000
	lsl r0, r0, #0x1e
	orr r0, r1, r0, lsr #5
	str r0, [r7]
_02389AA0:
	ldrh r1, [sp, #4]
	ldr r2, [r7]
	ldr r0, _02389B9C @ =0xFF000FFF
	lsl r1, r1, #0x14
	and r0, r2, r0
	orr r2, r0, r1, lsr #8
	ldr r1, _02389BA4 @ =0x00008A01
	ldr r0, _02389BA8 @ =0x040001C0
	str r2, [r7]
	strh r1, [r0]
	mov r6, #0
_02389ACC:
	bl FUN_023897A4
	add r6, r6, #1
	cmp r6, #0xc
	blt _02389ACC
	ldr r1, _02389BAC @ =0x00008201
	ldr r0, _02389BA8 @ =0x040001C0
	strh r1, [r0]
	bl FUN_023897A4
	cmp r4, #2
	ldreq r0, [r7]
	biceq r0, r0, #0x6000000
	orreq r0, r0, #0x6000000
	streq r0, [r7]
	bl FUN_023896B0
	cmp r0, #0
	beq _02389B70
	cmp r0, #1
	beq _02389B40
	cmp r0, #2
	bne _02389B8C
	ldr r1, [r7]
	ldr r0, _02389BA0 @ =0x038093A8
	orr r2, r1, #0x1000000
	bic r1, r2, #0x6000000
	orr r1, r1, #0x6000000
	str r1, [r7]
	mov r1, #0
	strh r1, [r0]
	b _02389B90
_02389B40:
	ldr r1, [r7]
	ldr r0, _02389BA0 @ =0x038093A8
	orr r1, r1, #0x1000000
	str r1, [r7]
	mov r2, #1
	ldrh r1, [sp]
	ldrh r3, [sp, #2]
	strh r2, [r0]
	cmp r3, r1
	movlo r3, r1
	strh r3, [r5]
	b _02389B90
_02389B70:
	ldr r1, [r7]
	ldr r0, _02389BA0 @ =0x038093A8
	bic r1, r1, #0x1000000
	str r1, [r7]
	mov r1, #0
	strh r1, [r0]
	b _02389B90
_02389B8C:
	bl FUN_02383100
_02389B90:
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02389B9C: .4byte 0xFF000FFF
_02389BA0: .4byte 0x038093A8
_02389BA4: .4byte 0x00008A01
_02389BA8: .4byte 0x040001C0
_02389BAC: .4byte 0x00008201
	arm_func_end FUN_023899B8

	arm_func_start FUN_02389BB0
FUN_02389BB0: @ 0x02389BB0
	ldr r0, _02389BE4 @ =0x038093AC
	mov r1, #1
	str r1, [r0, #4]
	mov r3, #0
	str r3, [r0, #0x28]
	ldr r0, _02389BE8 @ =0x038093B4
	mov r2, r3
_02389BCC:
	lsl r1, r3, #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _02389BCC
	bx lr
	.align 2, 0
_02389BE4: .4byte 0x038093AC
_02389BE8: .4byte 0x038093B4
	arm_func_end FUN_02389BB0

	arm_func_start FUN_02389BEC
FUN_02389BEC: @ 0x02389BEC
	push {r3, r4, lr}
	sub sp, sp, #4
	tst r0, #0x2000000
	beq _02389C1C
	ldr r1, _02389DA0 @ =0x038093B4
	mov r4, #0
	mov r3, r4
_02389C08:
	lsl r2, r4, #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _02389C08
_02389C1C:
	ldr r1, _02389DA0 @ =0x038093B4
	and r2, r0, #0xf0000
	lsr r2, r2, #0x10
	lsl r2, r2, #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _02389D94
	ldr r1, _02389DA4 @ =0x038093AC
	ldrh r2, [r1, #8]
	and r0, r2, #0xff00
	lsl r0, r0, #8
	lsr r4, r0, #0x10
	sub r0, r4, #0x60
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02389D88
_02389C5C: @ jump table
	b _02389C7C @ case 0
	b _02389C8C @ case 1
	b _02389D88 @ case 2
	b _02389D24 @ case 3
	b _02389CC0 @ case 4
	b _02389CF4 @ case 5
	b _02389D58 @ case 6
	b _02389D70 @ case 7
_02389C7C:
	mov r0, #0x60
	mov r1, #0
	bl FUN_02388D68
	b _02389D94
_02389C8C:
	ldrh ip, [r1, #0xa]
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #3
	mov r2, #2
	str ip, [sp]
	bl FUN_02388E9C
	cmp r0, #0
	bne _02389D94
	mov r0, r4
	mov r1, #4
	bl FUN_02388D68
	b _02389D94
_02389CC0:
	ldrh ip, [r1, #0xa]
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #3
	mov r2, #2
	str ip, [sp]
	bl FUN_02388E9C
	cmp r0, #0
	bne _02389D94
	mov r0, r4
	mov r1, #4
	bl FUN_02388D68
	b _02389D94
_02389CF4:
	lsl r0, r2, #0x10
	mov r1, r4
	lsr r3, r0, #0x10
	mov r0, #3
	mov r2, #1
	bl FUN_02388E9C
	cmp r0, #0
	bne _02389D94
	mov r0, r4
	mov r1, #4
	bl FUN_02388D68
	b _02389D94
_02389D24:
	ldrh r0, [r1, #0xa]
	lsl r2, r2, #0x18
	mov r1, r4
	orr r3, r0, r2, lsr #8
	mov r0, #3
	mov r2, #1
	bl FUN_02388E9C
	cmp r0, #0
	bne _02389D94
	mov r0, r4
	mov r1, #4
	bl FUN_02388D68
	b _02389D94
_02389D58:
	and r0, r2, #0xff
	bl FUN_0238A528
	mov r0, #0x66
	mov r1, #0
	bl FUN_02388D68
	b _02389D94
_02389D70:
	bl FUN_0238A544
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0x67
	bl FUN_02388D68
	b _02389D94
_02389D88:
	mov r0, r4
	mov r1, #1
	bl FUN_02388D68
_02389D94:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	.align 2, 0
_02389DA0: .4byte 0x038093B4
_02389DA4: .4byte 0x038093AC
	arm_func_end FUN_02389BEC

	arm_func_start FUN_02389DA8
FUN_02389DA8: @ 0x02389DA8
	push {r3, r4, r5, lr}
	mov r4, r0
	bl FUN_02382F90
	mov r5, r0
	mov r0, #3
	bl FUN_02388E2C
	cmp r0, #0
	bne _02389DE8
	mov r0, r5
	bl FUN_02382FA4
	ldr r0, [r4, #4]
	mov r1, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	b _02389F0C
_02389DE8:
	mov r0, #3
	bl FUN_02388E48
	mov r0, r5
	bl FUN_02382FA4
	ldr r1, [r4, #4]
	sub r0, r1, #0x61
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02389EF4
_02389E0C: @ jump table
	b _02389E24 @ case 0
	b _02389EF4 @ case 1
	b _02389EC0 @ case 2
	b _02389E48 @ case 3
	b _02389E84 @ case 4
	b _02389EE8 @ case 5
_02389E24:
	ldr r0, _02389F14 @ =0x038093AC
	mov r1, #1
	str r1, [r0, #0x28]
	ldr r1, [r4, #8]
	strh r1, [r0, #2]
	ldr r1, [r4, #0xc]
	strh r1, [r0]
	bl FUN_0238A228
	b _02389F04
_02389E48:
	ldr r2, _02389F14 @ =0x038093AC
	mov r0, #4
	str r0, [r2, #0x28]
	ldr r0, [r4, #8]
	str r0, [r2, #0x30]
	ldr r3, [r4, #0xc]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	and r1, r3, #0xff
	str r3, [r2, #0x2c]
	bl FUN_02389F5C
	mov r0, #0x64
	mov r1, #0
	bl FUN_02388D68
	b _02389F04
_02389E84:
	ldr r1, _02389F14 @ =0x038093AC
	mov r0, #3
	str r0, [r1, #0x28]
	ldr r2, [r4, #8]
	lsl r0, r2, #0x10
	lsr r4, r0, #0x10
	mov r0, r4
	str r2, [r1, #0x30]
	bl FUN_02389FD8
	add r1, r4, #0x70
	lsl r2, r1, #0x10
	mov r1, r0
	lsr r0, r2, #0x10
	bl FUN_02388D68
	b _02389F04
_02389EC0:
	ldr r1, _02389F14 @ =0x038093AC
	mov r0, #2
	str r0, [r1, #0x28]
	ldr r0, [r4, #8]
	str r0, [r1, #0x2c]
	bl FUN_0238A09C
	mov r0, #0x63
	mov r1, #0
	bl FUN_02388D68
	b _02389F04
_02389EE8:
	ldr r0, [r4, #8]
	bl FUN_0238A1C0
	b _02389F04
_02389EF4:
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	mov r1, #1
	bl FUN_02388D68
_02389F04:
	mov r0, #3
	bl FUN_02388E60
_02389F0C:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02389F14: .4byte 0x038093AC
	arm_func_end FUN_02389DA8

	arm_func_start FUN_02389F18
FUN_02389F18: @ 0x02389F18
	push {r4, r5, r6, lr}
	and r1, r1, #0x3f0000
	and r3, r0, #0x3c00000
	lsl r1, r1, #0x10
	lsl r0, r2, #0x10
	orr r1, r1, r3, lsl #22
	orr r6, r1, r0, lsr #16
	mov r5, #8
	mov r4, #0
_02389F3C:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	bne _02389F3C
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end FUN_02389F18

	arm_func_start FUN_02389F5C
FUN_02389F5C: @ 0x02389F5C
	push {r4, lr}
	ldr r2, _02389FA8 @ =0x040001C0
	mov r4, r1
_02389F68:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _02389F68
	ldr r1, _02389FAC @ =0x00008202
	and r0, r0, #0xff
	strh r1, [r2]
	add r1, r1, #0x600
	strh r1, [r2]
	bl FUN_02389FB4
	ldr r2, _02389FB0 @ =0x00008002
	ldr r1, _02389FA8 @ =0x040001C0
	and r0, r4, #0xff
	strh r2, [r1]
	strh r0, [r1, #2]
	pop {r4, lr}
	bx lr
	.align 2, 0
_02389FA8: .4byte 0x040001C0
_02389FAC: .4byte 0x00008202
_02389FB0: .4byte 0x00008002
	arm_func_end FUN_02389F5C

	arm_func_start FUN_02389FB4
FUN_02389FB4: @ 0x02389FB4
	ldr r1, _02389FD4 @ =0x040001C2
	and r0, r0, #0xff
	strh r0, [r1]
	sub r1, r1, #2
_02389FC4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _02389FC4
	bx lr
	.align 2, 0
_02389FD4: .4byte 0x040001C2
	arm_func_end FUN_02389FB4

	arm_func_start FUN_02389FD8
FUN_02389FD8: @ 0x02389FD8
	push {r3, lr}
	ldr r2, _0238A03C @ =0x040001C0
_02389FE0:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _02389FE0
	ldr r1, _0238A040 @ =0x00008202
	orr r0, r0, #0x80
	strh r1, [r2]
	add r1, r1, #0x600
	and r0, r0, #0xff
	strh r1, [r2]
	bl FUN_02389FB4
	ldr r2, _0238A044 @ =0x00008002
	ldr r1, _0238A03C @ =0x040001C0
	mov r0, #0
	strh r2, [r1]
	strh r0, [r1, #2]
_0238A01C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238A01C
	ldr r0, _0238A048 @ =0x040001C2
	ldrh r0, [r0]
	and r0, r0, #0xff
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238A03C: .4byte 0x040001C0
_0238A040: .4byte 0x00008202
_0238A044: .4byte 0x00008002
_0238A048: .4byte 0x040001C2
	arm_func_end FUN_02389FD8

	arm_func_start FUN_0238A04C
FUN_0238A04C: @ 0x0238A04C
	push {r4, lr}
	mov r4, r0
	mov r0, #0
	bl FUN_02389FD8
	orr r1, r0, r4
	mov r0, #0
	bl FUN_02389F5C
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238A04C

	arm_func_start FUN_0238A070
FUN_0238A070: @ 0x0238A070
	push {r4, lr}
	mov r4, r0
	mov r0, #0
	bl FUN_02389FD8
	mvn r1, r4
	and r0, r0, r1
	and r1, r0, #0xff
	mov r0, #0
	bl FUN_02389F5C
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238A070

	arm_func_start FUN_0238A09C
FUN_0238A09C: @ 0x0238A09C
	push {r3, lr}
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _0238A1B8
_0238A0AC: @ jump table
	b _0238A1B8 @ case 0
	b _0238A0EC @ case 1
	b _0238A100 @ case 2
	b _0238A114 @ case 3
	b _0238A128 @ case 4
	b _0238A134 @ case 5
	b _0238A140 @ case 6
	b _0238A14C @ case 7
	b _0238A158 @ case 8
	b _0238A164 @ case 9
	b _0238A170 @ case 10
	b _0238A17C @ case 11
	b _0238A188 @ case 12
	b _0238A194 @ case 13
	b _0238A1AC @ case 14
	b _0238A1A0 @ case 15
_0238A0EC:
	mov r0, #1
	bl FUN_0238A528
	mov r0, #1
	bl FUN_0238A1C0
	b _0238A1B8
_0238A100:
	mov r0, #3
	bl FUN_0238A528
	mov r0, #3
	bl FUN_0238A1C0
	b _0238A1B8
_0238A114:
	mov r0, #2
	bl FUN_0238A528
	mov r0, #2
	bl FUN_0238A1C0
	b _0238A1B8
_0238A128:
	mov r0, #4
	bl FUN_0238A04C
	b _0238A1B8
_0238A134:
	mov r0, #4
	bl FUN_0238A070
	b _0238A1B8
_0238A140:
	mov r0, #8
	bl FUN_0238A04C
	b _0238A1B8
_0238A14C:
	mov r0, #8
	bl FUN_0238A070
	b _0238A1B8
_0238A158:
	mov r0, #0xc
	bl FUN_0238A04C
	b _0238A1B8
_0238A164:
	mov r0, #0xc
	bl FUN_0238A070
	b _0238A1B8
_0238A170:
	mov r0, #1
	bl FUN_0238A04C
	b _0238A1B8
_0238A17C:
	mov r0, #1
	bl FUN_0238A070
	b _0238A1B8
_0238A188:
	mov r0, #2
	bl FUN_0238A070
	b _0238A1B8
_0238A194:
	mov r0, #2
	bl FUN_0238A04C
	b _0238A1B8
_0238A1A0:
	mov r0, #0x40
	bl FUN_0238A070
	b _0238A1B8
_0238A1AC:
	bl FUN_02383908
	mov r0, #0x40
	bl FUN_0238A04C
_0238A1B8:
	pop {r3, lr}
	bx lr
	arm_func_end FUN_0238A09C

	arm_func_start FUN_0238A1C0
FUN_0238A1C0: @ 0x0238A1C0
	push {r4, lr}
	mov r4, r0
	cmp r4, #1
	beq _0238A1E4
	cmp r4, #2
	beq _0238A1FC
	cmp r4, #3
	beq _0238A1F0
	b _0238A210
_0238A1E4:
	mov r0, #0x10
	bl FUN_0238A070
	b _0238A214
_0238A1F0:
	mov r0, #0x30
	bl FUN_0238A04C
	b _0238A214
_0238A1FC:
	mov r0, #0x20
	bl FUN_0238A070
	mov r0, #0x10
	bl FUN_0238A04C
	b _0238A214
_0238A210:
	bl FUN_02383100
_0238A214:
	ldr r0, _0238A224 @ =0x03806B08
	str r4, [r0]
	pop {r4, lr}
	bx lr
	.align 2, 0
_0238A224: .4byte 0x03806B08
	arm_func_end FUN_0238A1C0

	arm_func_start FUN_0238A228
FUN_0238A228: @ 0x0238A228
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _0238A3E4 @ =0x04000208
	mov r8, #0
	ldrh sb, [r0]
	strh r8, [r0]
	bl FUN_02382F90
	mov r4, r0
	mvn r0, #0xfe000000
	bl FUN_02380BB8
	mov r5, r0
	mov r0, r8
	bl FUN_02389FD8
	mov r6, r0
	mov r0, #2
	bl FUN_0238A528
	mov r0, #2
	bl FUN_0238A1C0
	mov r0, #2
	bl FUN_0238A1C0
	bl FUN_02383908
	mov r0, #1
	bl FUN_0238A070
	ldr r0, _0238A3E8 @ =0x038093AE
	ldrh r0, [r0]
	tst r0, #1
	beq _0238A2AC
	ldr r0, _0238A3EC @ =0x038093AC
	ldr r1, _0238A3F0 @ =0x04000132
	ldrh r2, [r0]
	mov r0, #0x1000
	orr r2, r2, #0x4000
	strh r2, [r1]
	bl FUN_02380B80
_0238A2AC:
	ldr r0, _0238A3E8 @ =0x038093AE
	ldrh r0, [r0]
	tst r0, #4
	beq _0238A2C4
	mov r0, #0x400000
	bl FUN_02380B80
_0238A2C4:
	ldr r0, _0238A3E8 @ =0x038093AE
	ldrh r0, [r0]
	tst r0, #2
	beq _0238A308
	ldr r1, _0238A3F4 @ =0x04000134
	mov r0, #0x8000
	ldrh r7, [r1]
	mov r8, #1
	bl FUN_023837A8
	mov r0, #0x40
	mov r1, #0
	bl FUN_02383788
	mov r0, #0x100
	mov r1, r0
	bl FUN_02383788
	mov r0, #0x80
	bl FUN_02380B80
_0238A308:
	ldr r0, _0238A3E8 @ =0x038093AE
	ldrh r0, [r0]
	tst r0, #8
	beq _0238A320
	mov r0, #0x100000
	bl FUN_02380B80
_0238A320:
	ldr r0, _0238A3E8 @ =0x038093AE
	ldrh r0, [r0]
	tst r0, #0x10
	beq _0238A338
	mov r0, #0x2000
	bl FUN_02380B80
_0238A338:
	mov r0, r4
	bl FUN_02382FA4
	ldr r2, _0238A3E4 @ =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	bl FUN_0238A3FC
	mov r1, r6
	mov r0, #0
	bl FUN_02389F5C
	ldr r0, _0238A3E8 @ =0x038093AE
	ldrh r1, [r0]
	tst r1, #0x20
	movne r0, #6
	moveq r0, #7
	tst r1, #0x40
	movne r6, #4
	moveq r6, #5
	bl FUN_0238A09C
	mov r0, r6
	bl FUN_0238A09C
	cmp r8, #0
	ldrne r0, _0238A3F4 @ =0x04000134
	strhne r7, [r0]
	mov r0, #1
	bl FUN_0238A04C
	bl FUN_02383960
	mov r1, #0
	ldr r3, _0238A3F8 @ =0x038093B4
	mov r2, r1
	mov r0, #0x62
	str r1, [r3, #0x20]
	bl FUN_02389F18
	bl FUN_02382F90
	mov r0, r5
	bl FUN_02380B34
	mov r0, r4
	bl FUN_02382FA4
	ldr r1, _0238A3E4 @ =0x04000208
	ldrh r0, [r1]
	strh sb, [r1]
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0238A3E4: .4byte 0x04000208
_0238A3E8: .4byte 0x038093AE
_0238A3EC: .4byte 0x038093AC
_0238A3F0: .4byte 0x04000132
_0238A3F4: .4byte 0x04000134
_0238A3F8: .4byte 0x038093B4
	arm_func_end FUN_0238A228

	arm_func_start FUN_0238A3FC
FUN_0238A3FC: @ 0x0238A3FC
	ldr ip, _0238A404 @ =FUN_038008C6
	bx ip
	.align 2, 0
_0238A404: .4byte FUN_038008C6
	arm_func_end FUN_0238A3FC

	arm_func_start FUN_0238A408
FUN_0238A408: @ 0x0238A408
	push {r4, r5, r6, lr}
	ldr r1, _0238A51C @ =0x038093E0
	ldr r3, [r1, #4]
	cmp r3, #0
	bne _0238A444
	mov r2, #1
	mov r3, r2
	mov r0, #3
	mov r1, #0x66
	bl FUN_02388E9C
	cmp r0, #0
	beq _0238A514
	mov r0, #1
	bl FUN_0238A528
	b _0238A514
_0238A444:
	cmp r3, #4
	bge _0238A470
	ldr r0, _0238A520 @ =0x03806B08
	ldr r0, [r0]
	cmp r3, r0
	beq _0238A514
	mov r0, #3
	mov r1, #0x66
	mov r2, #1
	bl FUN_02388E9C
	b _0238A514
_0238A470:
	sub r2, r3, #4
	mov r0, #0xc
	mul r4, r2, r0
	ldr r5, _0238A524 @ =0x03806B0C
	ldr r0, [r1]
	add r6, r5, r4
	ldrh r1, [r6, #0xa]
	bl FUN_0238E6D4
	mov r1, #0
	lsr r3, r1, r0
	ldr ip, [r6, #4]
	mov r2, #-0x80000000
	rsb r1, r0, #0x20
	orr r3, r3, r2, lsl r1
	sub r1, r0, #0x20
	and ip, ip, r2, lsr r0
	orr r3, r3, r2, lsr r1
	ldr r0, [r5, r4]
	cmp ip, #0
	and r0, r0, r3
	cmpeq r0, #0
	movne r3, #1
	ldrh r2, [r6, #8]
	ldrh r1, [r6, #0xa]
	ldr r0, _0238A51C @ =0x038093E0
	mul r1, r2, r1
	ldr r2, [r0]
	moveq r3, #2
	add r2, r2, #1
	cmp r2, r1
	str r2, [r0]
	movhs r1, #0
	strhs r1, [r0]
	ldr r0, _0238A520 @ =0x03806B08
	ldr r0, [r0]
	cmp r3, r0
	beq _0238A514
	mov r0, #3
	mov r1, #0x66
	mov r2, #1
	bl FUN_02388E9C
_0238A514:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0238A51C: .4byte 0x038093E0
_0238A520: .4byte 0x03806B08
_0238A524: .4byte 0x03806B0C
	arm_func_end FUN_0238A408

	arm_func_start FUN_0238A528
FUN_0238A528: @ 0x0238A528
	cmp r0, #0xf
	ldrle r1, _0238A540 @ =0x038093E0
	movle r2, #0
	strle r0, [r1, #4]
	strle r2, [r1]
	bx lr
	.align 2, 0
_0238A540: .4byte 0x038093E0
	arm_func_end FUN_0238A528

	arm_func_start FUN_0238A544
FUN_0238A544: @ 0x0238A544
	ldr r0, _0238A550 @ =0x038093E0
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_0238A550: .4byte 0x038093E0
	arm_func_end FUN_0238A544

	arm_func_start FUN_0238A554
FUN_0238A554: @ 0x0238A554
	ldr r0, _0238A590 @ =0x038093E8
	mov r3, #0
	str r3, [r0, #0x20]
	ldr r0, _0238A594 @ =0x038093E8
	mov r2, r3
_0238A568:
	lsl r1, r3, #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _0238A568
	ldr r1, _0238A598 @ =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bx lr
	.align 2, 0
_0238A590: .4byte 0x038093E8
_0238A594: .4byte 0x038093E8
_0238A598: .4byte 0x0400010E
	arm_func_end FUN_0238A554

	arm_func_start FUN_0238A59C
FUN_0238A59C: @ 0x0238A59C
	push {r4, lr}
	tst r0, #0x2000000
	beq _0238A5C8
	ldr r1, _0238A854 @ =0x038093E8
	mov r4, #0
	mov r3, r4
_0238A5B4:
	lsl r2, r4, #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _0238A5B4
_0238A5C8:
	ldr r1, _0238A854 @ =0x038093E8
	and r2, r0, #0xf0000
	lsr r2, r2, #0x10
	lsl r2, r2, #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _0238A84C
	ldr r1, _0238A858 @ =0x038093E8
	ldrh r2, [r1]
	and r0, r2, #0xff00
	lsl r0, r0, #8
	lsr r4, r0, #0x10
	sub r0, r4, #0x40
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0238A840
_0238A608: @ jump table
	b _0238A618 @ case 0
	b _0238A654 @ case 1
	b _0238A758 @ case 2
	b _0238A7BC @ case 3
_0238A618:
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #2
	mov r2, #1
	bl FUN_02388E9C
	cmp r0, #0
	bne _0238A640
	mov r0, r4
	mov r1, #4
	bl FUN_02388D68
_0238A640:
	ldr r0, _0238A85C @ =0x027FFF94
	mov r1, #0
	strh r1, [r0]
	str r1, [r0, #-4]
	b _0238A84C
_0238A654:
	ldr r0, [r1, #0x20]
	cmp r0, #0
	beq _0238A670
	mov r0, r4
	mov r1, #3
	bl FUN_02388D68
	b _0238A84C
_0238A670:
	and r0, r2, #0xff
	strh r0, [r1, #0x24]
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	orr r3, r0, r2, lsl #16
	cmp r3, #0x2000000
	blo _0238A694
	cmp r3, #0x2400000
	blo _0238A6A4
_0238A694:
	mov r0, r4
	mov r1, #2
	bl FUN_02388D68
	b _0238A84C
_0238A6A4:
	str r3, [r1, #0x28]
	ldrh r2, [r1, #6]
	ldrh r0, [r1, #8]
	orr r2, r0, r2, lsl #16
	add r0, r3, r2
	cmp r0, #0x2400000
	bls _0238A6D0
	mov r0, r4
	mov r1, #2
	bl FUN_02388D68
	b _0238A84C
_0238A6D0:
	str r2, [r1, #0x30]
	ldrh r2, [r1, #0xa]
	ldrh r0, [r1, #0xc]
	orr r0, r0, r2, lsl #16
	bl FUN_0238A864
	cmp r0, #0
	bne _0238A6FC
	mov r0, r4
	mov r1, #2
	bl FUN_02388D68
	b _0238A84C
_0238A6FC:
	ldr r3, _0238A858 @ =0x038093E8
	mov r2, #0
	str r2, [r3, #0x2c]
	ldrh r0, [r3, #0x24]
	mov r1, r4
	and ip, r0, #7
	mov r0, #2
	strh ip, [r3, #0x26]
	bl FUN_02388E9C
	cmp r0, #0
	bne _0238A738
	mov r0, r4
	mov r1, #4
	bl FUN_02388D68
	b _0238A84C
_0238A738:
	ldr r1, _0238A85C @ =0x027FFF94
	mov r2, #0
	strh r2, [r1]
	ldr r0, _0238A858 @ =0x038093E8
	str r2, [r1, #-4]
	mov r1, #1
	str r1, [r0, #0x20]
	b _0238A84C
_0238A758:
	ldr r0, [r1, #0x20]
	cmp r0, #2
	beq _0238A774
	mov r0, r4
	mov r1, #3
	bl FUN_02388D68
	b _0238A84C
_0238A774:
	mov r1, r4
	mov r0, #2
	mov r2, #0
	bl FUN_02388E9C
	cmp r0, #0
	bne _0238A79C
	mov r0, r4
	mov r1, #4
	bl FUN_02388D68
	b _0238A84C
_0238A79C:
	ldr r0, _0238A858 @ =0x038093E8
	mov r2, #3
	ldr r1, _0238A860 @ =0x0400010E
	str r2, [r0, #0x20]
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	b _0238A84C
_0238A7BC:
	ldr r0, [r1, #0x20]
	cmp r0, #2
	beq _0238A7D8
	mov r0, r4
	mov r1, #3
	bl FUN_02388D68
	b _0238A84C
_0238A7D8:
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	orr r0, r0, r2, lsl #16
	bl FUN_0238A864
	cmp r0, #0
	bne _0238A800
	mov r0, r4
	mov r1, #2
	bl FUN_02388D68
	b _0238A84C
_0238A800:
	bl FUN_02382F90
	ldr r3, _0238A860 @ =0x0400010E
	ldr r1, _0238A858 @ =0x038093E8
	ldrh r2, [r3]
	bic r2, r2, #0x80
	strh r2, [r3]
	ldrh r2, [r1, #0x34]
	strh r2, [r3, #-2]
	ldrh r1, [r1, #0x36]
	orr r1, r1, #0xc0
	strh r1, [r3]
	bl FUN_02382FA4
	mov r0, r4
	mov r1, #0
	bl FUN_02388D68
	b _0238A84C
_0238A840:
	mov r0, r4
	mov r1, #1
	bl FUN_02388D68
_0238A84C:
	pop {r4, lr}
	bx lr
	.align 2, 0
_0238A854: .4byte 0x038093E8
_0238A858: .4byte 0x038093E8
_0238A85C: .4byte 0x027FFF94
_0238A860: .4byte 0x0400010E
	arm_func_end FUN_0238A59C

	arm_func_start FUN_0238A864
FUN_0238A864: @ 0x0238A864
	cmp r0, #0x10000
	bhs _0238A888
	ldr r1, _0238A904 @ =0x038093E8
	mov r2, #0
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
_0238A888:
	cmp r0, #0x400000
	bhs _0238A8B0
	ldr r1, _0238A904 @ =0x038093E8
	mov r3, #1
	lsr r0, r0, #6
	rsb r2, r0, #0x10000
	strh r3, [r1, #0x36]
	mov r0, r3
	strh r2, [r1, #0x34]
	bx lr
_0238A8B0:
	cmp r0, #0x1000000
	bhs _0238A8D8
	ldr r1, _0238A904 @ =0x038093E8
	mov r2, #2
	lsr r0, r0, #8
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
_0238A8D8:
	cmp r0, #0x4000000
	movhs r0, #0
	bxhs lr
	ldr r1, _0238A904 @ =0x038093E8
	mov r2, #3
	lsr r0, r0, #0xa
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
	.align 2, 0
_0238A904: .4byte 0x038093E8
	arm_func_end FUN_0238A864

	arm_func_start FUN_0238A908
FUN_0238A908: @ 0x0238A908
	push {r3, r4, r5, lr}
	mov r4, r0
	ldr r2, [r4, #4]
	cmp r2, #0x40
	beq _0238A930
	cmp r2, #0x41
	beq _0238A9E0
	cmp r2, #0x42
	beq _0238AA78
	b _0238AB14
_0238A930:
	bl FUN_02382F90
	mov r5, r0
	mov r0, #2
	bl FUN_02388E2C
	cmp r0, #0
	bne _0238A968
	mov r0, r5
	bl FUN_02382FA4
	ldr r0, [r4, #4]
	mov r1, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	b _0238AB14
_0238A968:
	mov r0, #2
	bl FUN_02388E48
	mov r0, r5
	bl FUN_02382FA4
	ldr r0, [r4, #8]
	and r0, r0, #1
	cmp r0, #1
	bne _0238A99C
	bl FUN_0238AE20
	ldr r1, [r4, #8]
	tst r1, #2
	eorne r0, r0, #0x8000
	b _0238A9AC
_0238A99C:
	bl FUN_0238ACCC
	ldr r1, [r4, #8]
	tst r1, #2
	eorne r0, r0, #0x80
_0238A9AC:
	ldr r1, _0238AB1C @ =0x027FFF94
	lslne r0, r0, #0x10
	lsrne r0, r0, #0x10
	strh r0, [r1]
	str r1, [r1, #-4]
	ldr r0, [r4, #4]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	mov r0, #2
	bl FUN_02388E60
	b _0238AB14
_0238A9E0:
	ldr r0, _0238AB20 @ =0x038093E8
	ldr r1, [r0, #0x20]
	cmp r1, #1
	bne _0238AA64
	mov r1, #0
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x38]
	bl FUN_02382F90
	mov r5, r0
	mov r0, #0x40
	bl FUN_02380B80
	ldr r1, _0238AB24 @ =0x038028C4
	mov r0, #0x40
	bl FUN_0238AF54
	bl FUN_0238AF7C
	ldr r1, _0238AB20 @ =0x038093E8
	ldr r2, _0238AB28 @ =0x0400010C
	ldrh r3, [r1, #0x34]
	mov r0, r5
	strh r3, [r2]
	ldrh r1, [r1, #0x36]
	orr r1, r1, #0xc0
	strh r1, [r2, #2]
	bl FUN_02382FA4
	ldr r0, [r4, #4]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	ldr r0, _0238AB20 @ =0x038093E8
	mov r1, #2
	str r1, [r0, #0x20]
	b _0238AB14
_0238AA64:
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	mov r1, #3
	bl FUN_02388D68
	b _0238AB14
_0238AA78:
	ldr r0, _0238AB20 @ =0x038093E8
	ldr r1, [r0, #0x20]
	sub r0, r1, #3
	cmp r0, #1
	bhi _0238AAF4
	ldr r1, _0238AB2C @ =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bl FUN_02382F90
	mov r4, r0
	mov r0, #0x40
	mov r1, #0
	bl FUN_0238AF54
	bl FUN_0238AFDC
	mov r0, r4
	bl FUN_02382FA4
	ldr r0, _0238AB20 @ =0x038093E8
	mov r1, #0
	ldr r0, [r0, #0x20]
	cmp r0, #3
	bne _0238AADC
	mov r0, #0x42
	bl FUN_02388D68
	b _0238AAE4
_0238AADC:
	mov r0, #0x51
	bl FUN_02388D68
_0238AAE4:
	ldr r0, _0238AB20 @ =0x038093E8
	mov r1, #0
	str r1, [r0, #0x20]
	b _0238AB14
_0238AAF4:
	cmp r1, #3
	mov r1, #3
	bne _0238AB0C
	mov r0, #0x42
	bl FUN_02388D68
	b _0238AB14
_0238AB0C:
	mov r0, #0x51
	bl FUN_02388D68
_0238AB14:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0238AB1C: .4byte 0x027FFF94
_0238AB20: .4byte 0x038093E8
_0238AB24: .4byte 0x038028C4
_0238AB28: .4byte 0x0400010C
_0238AB2C: .4byte 0x0400010E
	arm_func_end FUN_0238A908

	arm_func_start FUN_0238AB30
FUN_0238AB30: @ 0x0238AB30
	push {r3, lr}
	bl FUN_0238AB64
	ldr r3, _0238AB5C @ =0x0380FFF8
	ldr r0, _0238AB60 @ =0x04000214
	ldr r2, [r3]
	mov r1, #0x40
	orr r2, r2, #0x40
	str r2, [r3]
	str r1, [r0]
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238AB5C: .4byte 0x0380FFF8
_0238AB60: .4byte 0x04000214
	arm_func_end FUN_0238AB30

	arm_func_start FUN_0238AB64
FUN_0238AB64: @ 0x0238AB64
	push {r4, r5, r6, r7, lr}
	ldr r4, _0238ACBC @ =0x038093E8
	ldrh r5, [r4, #0x26]
	and r0, r5, #4
	cmp r0, #4
	ldrh r6, [r4, #0x38]
	ldrhne r7, [r4, #0x3a]
	ldreq r7, _0238ACC0 @ =0x0000FFFF
	bl FUN_02388F74
	cmp r0, #0
	bne _0238ABD0
	mov r0, #2
	bl FUN_02388E2C
	cmp r0, #0
	beq _0238ABD0
	and r0, r5, #1
	cmp r0, #1
	bne _0238ABC0
	bl FUN_0238AE20
	tst r5, #2
	moveq r7, r0
	eorne r7, r0, #0x8000
	b _0238ABD0
_0238ABC0:
	bl FUN_0238ACCC
	tst r5, #2
	moveq r7, r0
	eorne r7, r0, #0x80
_0238ABD0:
	and r0, r5, #1
	ldr r3, _0238ACC4 @ =0x027FFC00
	ldr r1, [r4, #0x2c]
	cmp r0, #1
	bne _0238AC00
	ldr r2, [r4, #0x28]
	strh r7, [r2, r1]!
	str r2, [r3, #0x390]
	add r3, r3, #0x394
	strh r7, [r3]
	add r1, r1, #2
	b _0238AC38
_0238AC00:
	and r7, r7, #0xff
	tst r1, #1
	bne _0238AC18
	mov r6, r7
	add r1, r1, #1
	b _0238AC38
_0238AC18:
	orr r0, r6, r7, lsl #8
	ldr r2, [r4, #0x28]
	sub r1, r1, #1
	strh r0, [r2, r1]!
	str r2, [r3, #0x390]
	add r3, r3, #0x394
	strh r0, [r3]
	add r1, r1, #2
_0238AC38:
	strh r6, [r4, #0x38]
	strh r7, [r4, #0x3a]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	movhs r1, #0
	str r1, [r4, #0x2c]
	blo _0238ACB4
	ldrh r0, [r4, #0x24]
	and r0, r0, #0x10
	cmp r0, #0x10
	bne _0238AC74
	mov r0, #0x51
	mov r1, #0
	bl FUN_02388D68
	b _0238ACB4
_0238AC74:
	mov r0, #2
	mov r1, #0x42
	mov r2, #0
	bl FUN_02388E9C
	cmp r0, #0
	bne _0238AC9C
	mov r0, #0x51
	mov r1, #4
	bl FUN_02388D68
	b _0238ACB4
_0238AC9C:
	mov r0, #4
	str r0, [r4, #0x20]
	ldr r1, _0238ACC8 @ =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
_0238ACB4:
	pop {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0238ACBC: .4byte 0x038093E8
_0238ACC0: .4byte 0x0000FFFF
_0238ACC4: .4byte 0x027FFC00
_0238ACC8: .4byte 0x0400010E
	arm_func_end FUN_0238AB64

	arm_func_start FUN_0238ACCC
FUN_0238ACCC: @ 0x0238ACCC
	push {r4, lr}
	ldr r2, _0238ADD8 @ =0x040001C0
_0238ACD4:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238ACD4
	ldr r1, _0238ADDC @ =0x00008A01
	ldr r0, _0238ADE0 @ =0x040001C2
	strh r1, [r2]
	mov r1, #0xec
	strh r1, [r0]
	sub r1, r0, #2
_0238ACF8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238ACF8
	bl FUN_0238ADF0
	ldr r2, _0238ADE4 @ =0x00008201
	ldr r1, _0238ADD8 @ =0x040001C0
	lsl r4, r0, #0x18
	strh r2, [r1]
	bl FUN_0238ADF0
	ldr r2, _0238ADE8 @ =0x03809424
	ldr r1, _0238ADEC @ =0x00007F80
	orr r0, r0, r4, lsr #16
	and r1, r0, r1
	ldr r0, [r2, #0x10]
	lsl r1, r1, #9
	add r3, r0, r1, lsr #16
	str r3, [r2, #0x10]
	ldr r0, [r2, #0xc]
	add r0, r0, #1
	str r0, [r2, #0xc]
	cmp r0, #0x1000
	blo _0238ADA8
	ldrsb r4, [r2]
	lsr r0, r3, #0xc
	sub r0, r0, #0x80
	lsl r0, r0, #0x18
	cmp r4, r0, asr #24
	asr r0, r0, #0x18
	cmplt r4, #0xc
	addlt r0, r4, #1
	strblt r0, [r2]
	blt _0238AD98
	cmp r0, r4
	bge _0238AD98
	mvn r0, #0xb
	cmp r4, r0
	ldrgt r0, _0238ADE8 @ =0x03809424
	ldrsbgt r2, [r0]
	subgt r2, r2, #1
	strbgt r2, [r0]
_0238AD98:
	ldr r0, _0238ADE8 @ =0x03809424
	mov r2, #0
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
_0238ADA8:
	ldr r0, _0238ADE8 @ =0x03809424
	ldrsb r0, [r0]
	rsb r0, r0, r1, lsr #16
	cmp r0, #0xff
	movgt r0, #0xff
	bgt _0238ADC8
	cmp r0, #0
	movlt r0, #0
_0238ADC8:
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, lr}
	bx lr
	.align 2, 0
_0238ADD8: .4byte 0x040001C0
_0238ADDC: .4byte 0x00008A01
_0238ADE0: .4byte 0x040001C2
_0238ADE4: .4byte 0x00008201
_0238ADE8: .4byte 0x03809424
_0238ADEC: .4byte 0x00007F80
	arm_func_end FUN_0238ACCC

	arm_func_start FUN_0238ADF0
FUN_0238ADF0: @ 0x0238ADF0
	ldr r0, _0238AE1C @ =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_0238AE00:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238AE00
	ldr r0, _0238AE1C @ =0x040001C2
	ldrh r0, [r0]
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0238AE1C: .4byte 0x040001C2
	arm_func_end FUN_0238ADF0

	arm_func_start FUN_0238AE20
FUN_0238AE20: @ 0x0238AE20
	push {r4, lr}
	ldr r2, _0238AF38 @ =0x040001C0
_0238AE28:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238AE28
	ldr r1, _0238AF3C @ =0x00008A01
	ldr r0, _0238AF40 @ =0x040001C2
	strh r1, [r2]
	mov r1, #0xe4
	strh r1, [r0]
	sub r1, r0, #2
_0238AE4C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238AE4C
	bl FUN_0238ADF0
	ldr r2, _0238AF44 @ =0x00008201
	ldr r1, _0238AF38 @ =0x040001C0
	lsl r4, r0, #0x18
	strh r2, [r1]
	bl FUN_0238ADF0
	ldr r3, _0238AF48 @ =0x03809424
	ldr r1, _0238AF4C @ =0x00007FF8
	orr r0, r0, r4, lsr #16
	and r2, r0, r1
	ldr r0, [r3, #4]
	lsl r2, r2, #0x11
	add r4, r0, r2, lsr #16
	str r4, [r3, #4]
	ldr r0, [r3, #8]
	add r0, r0, #1
	str r0, [r3, #8]
	cmp r0, #0x100
	blo _0238AF04
	lsl r0, r1, #1
	and r0, r0, r4, lsr #8
	ldrsh r4, [r3, #2]
	sub r0, r0, #0x8000
	lsl r0, r0, #0x10
	cmp r4, r0, asr #16
	asr r1, r0, #0x10
	cmplt r4, #0xc00
	addlt r0, r4, #0x10
	strhlt r0, [r3, #2]
	blt _0238AEF4
	cmp r1, r4
	bge _0238AEF4
	mov r0, #0xc00
	rsb r0, r0, #0
	cmp r4, r0
	ldrgt r0, _0238AF48 @ =0x03809424
	ldrshgt r1, [r0, #2]
	subgt r1, r1, #0x10
	strhgt r1, [r0, #2]
_0238AEF4:
	ldr r0, _0238AF48 @ =0x03809424
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_0238AF04:
	ldr r1, _0238AF48 @ =0x03809424
	ldr r0, _0238AF50 @ =0x0000FFF0
	ldrsh r1, [r1, #2]
	rsb r1, r1, r2, lsr #16
	cmp r1, r0
	movgt r1, r0
	bgt _0238AF28
	cmp r1, #0
	movlt r1, #0
_0238AF28:
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r4, lr}
	bx lr
	.align 2, 0
_0238AF38: .4byte 0x040001C0
_0238AF3C: .4byte 0x00008A01
_0238AF40: .4byte 0x040001C2
_0238AF44: .4byte 0x00008201
_0238AF48: .4byte 0x03809424
_0238AF4C: .4byte 0x00007FF8
_0238AF50: .4byte 0x0000FFF0
	arm_func_end FUN_0238AE20

	arm_func_start FUN_0238AF54
FUN_0238AF54: @ 0x0238AF54
	ldr r2, _0238AF78 @ =0x03806A88
	mov r3, #0
_0238AF5C:
	tst r0, #1
	strne r1, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x19
	lsr r0, r0, #1
	blt _0238AF5C
	bx lr
	.align 2, 0
_0238AF78: .4byte 0x03806A88
	arm_func_end FUN_0238AF54

	arm_func_start FUN_0238AF7C
FUN_0238AF7C: @ 0x0238AF7C
	push {r3, lr}
	ldr r3, _0238AFD0 @ =0x0380FFFC
	ldr r0, _0238AFD4 @ =0x03802DB4
	ldr r2, [r3]
	cmp r2, r0
	beq _0238AFC8
	ldr r0, _0238AFD8 @ =0x03809438
	mov r1, #0
	str r1, [r0]
	sub r1, r3, #0x17c
	str r1, [r0, #4]
	mov r1, #0x40
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bl FUN_02382F90
	ldr r2, _0238AFD4 @ =0x03802DB4
	ldr r1, _0238AFD0 @ =0x0380FFFC
	str r2, [r1]
	bl FUN_02382FA4
_0238AFC8:
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238AFD0: .4byte 0x0380FFFC
_0238AFD4: .4byte 0x03802DB4
_0238AFD8: .4byte 0x03809438
	arm_func_end FUN_0238AF7C

	arm_func_start FUN_0238AFDC
FUN_0238AFDC: @ 0x0238AFDC
	push {r3, lr}
	ldr r1, _0238B014 @ =0x0380FFFC
	ldr r0, _0238B018 @ =0x03802DB4
	ldr r1, [r1]
	cmp r1, r0
	bne _0238B00C
	bl FUN_02382F90
	ldr r1, _0238B01C @ =0x03809438
	ldr r2, _0238B014 @ =0x0380FFFC
	ldr r1, [r1, #0xc]
	str r1, [r2]
	bl FUN_02382FA4
_0238B00C:
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238B014: .4byte 0x0380FFFC
_0238B018: .4byte 0x03802DB4
_0238B01C: .4byte 0x03809438
	arm_func_end FUN_0238AFDC

	arm_func_start FUN_0238B020
FUN_0238B020: @ 0x0238B020
	mov ip, #0x4000000
	add r1, ip, #0x208
	ldrh r0, [r1]
	tst r0, r0
	bxeq lr
	ldr r3, [ip, #0x210]
	ldr r1, [ip, #0x214]
	ands r2, r1, r3
	bxeq lr
	ldr r0, _0238B18C @ =0x01DF3FFF
	tst r2, r0
	streq r2, [ip, #0x214]
	bxeq lr
	stmdb sp!, {lr}
	mrs r0, spsr
	stmdb sp!, {r0}
	stmdb sp, {sp, lr} ^
	sub sp, sp, #8
	mov r0, #0x9f
	msr cpsr_c, r0
	ldr r1, _0238B190 @ =0x03806C40
	ldrh r0, [r1, #2]
	add r0, r0, #1
	strh r0, [r1, #2]
	ldr r1, _0238B194 @ =0x03809438
	cmp r0, #1
	moveq r0, sp
	ldreq sp, [r1, #4]
	streq r0, [r1, #4]
	stmdb sp!, {r3}
	ldr r1, _0238B198 @ =0x038067A4
	ldr r0, [r1]
	tst r0, r2
	strne r0, [ip, #0x214]
	ldrne r0, [r1, #4]
	ldrne r3, _0238B19C @ =0x03806A88
	ldrne r0, [r3, r0, lsl #2]
	bne _0238B0FC
	mov r3, #1
_0238B0BC:
	ldr r0, [r1, r3, lsl #3]
	tst r0, r2
	addeq r3, r3, #1
	beq _0238B0BC
	str r0, [ip, #0x214]
	add r0, r1, r3, lsl #3
	ldr r2, [r0, #4]
	ldr r3, _0238B19C @ =0x03806A88
	ldr r0, [r3, r2, lsl #2]
	ldr r2, _0238B190 @ =0x03806C40
	ldrh r3, [r2, #2]
	cmp r3, #1
	ldreq r2, [r1]
	streq r2, [ip, #0x210]
	moveq r2, #0x1f
	msreq cpsr_c, r2
_0238B0FC:
	ldr r1, [ip, #0x210]
	stmdb sp!, {r1}
	add lr, pc, #0x0 @ =FUN_0238B10C
	bx r0
	arm_func_end FUN_0238B020

	arm_func_start FUN_0238B10C
FUN_0238B10C: @ 0x0238B10C
	mov r0, #0x9f
	msr cpsr_c, r0
	mov ip, #0x4000000
	ldm sp!, {r0}
	ldr r1, [ip, #0x210]
	eor r2, r0, r1
	and r1, r2, r1
	and r0, r2, r0
	ldm sp!, {r3}
	orr r3, r3, r1
	bic r3, r3, r0
	str r3, [ip, #0x210]
	ldr r2, _0238B190 @ =0x03806C40
	ldr r3, _0238B194 @ =0x03809438
	ldrh r0, [r2, #2]
	subs r1, r0, #1
	strh r1, [r2, #2]
	moveq r0, sp
	ldreq sp, [r3, #4]
	streq r0, [r3, #4]
	mov r0, #0x92
	msr cpsr_c, r0
	ldm sp, {sp, lr} ^
	mov r0, r0
	add sp, sp, #8
	ldm sp!, {r0}
	msr spsr_fc, r0
	tst r1, r1
	ldreq r0, _0238B1A0 @ =0x037F8538
	add lr, pc, #0x0 @ =0x0238B188
	bxeq r0
	ldm sp!, {pc}
	.align 2, 0
_0238B18C: .4byte 0x01DF3FFF
_0238B190: .4byte 0x03806C40
_0238B194: .4byte 0x03809438
_0238B198: .4byte 0x038067A4
_0238B19C: .4byte 0x03806A88
	arm_func_end FUN_0238B10C
_0238B1A0: .4byte 0x037F8538
	arm_func_end FUN_0238B10C

	arm_func_start FUN_0238B1A4
FUN_0238B1A4: @ 0x0238B1A4
	push {r3, lr}
	ldr r1, _0238B1D4 @ =0x0380944C
	mov r3, #0
	ldr r2, _0238B1D8 @ =0x05000001
	add r0, sp, #0
	str r3, [sp]
	bl FUN_0238B1E0
	bl FUN_02380E8C
	ldr r1, _0238B1DC @ =0x03809448
	strh r0, [r1, #6]
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238B1D4: .4byte 0x0380944C
_0238B1D8: .4byte 0x05000001
_0238B1DC: .4byte 0x03809448
	arm_func_end FUN_0238B1A4

	arm_func_start FUN_0238B1E0
FUN_0238B1E0: @ 0x0238B1E0
	ldr ip, _0238B1E8 @ =FUN_038008E8
	bx ip
	.align 2, 0
_0238B1E8: .4byte FUN_038008E8
	arm_func_end FUN_0238B1E0

	arm_func_start FUN_0238B1EC
FUN_0238B1EC: @ 0x0238B1EC
	push {r3, lr}
	ldr r2, _0238B234 @ =0x027FFC30
	ldr r0, _0238B238 @ =0x0000FFFF
	ldrh r1, [r2]
	cmp r1, r0
	moveq r0, #0
	beq _0238B22C
	ldrb r0, [r2, #5]
	lsl r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bne _0238B21C
	bl FUN_0238B23C
_0238B21C:
	ldr r0, _0238B234 @ =0x027FFC30
	ldrb r0, [r0, #5]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
_0238B22C:
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238B234: .4byte 0x027FFC30
_0238B238: .4byte 0x0000FFFF
	arm_func_end FUN_0238B1EC

	arm_func_start FUN_0238B23C
FUN_0238B23C: @ 0x0238B23C
	push {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _0238B354 @ =0x027FFC30
	mov r4, #1
	ldrh r1, [r2]
	rsb r0, r4, #0x10000
	cmp r1, r0
	moveq r0, #0
	beq _0238B348
	ldrb r0, [r2, #5]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	moveq r0, #0
	beq _0238B348
	ldr r0, _0238B358 @ =0x03809448
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl FUN_0238B3DC
	cmp r0, #0
	bne _0238B2A0
	ldr r0, [sp, #0xc]
	bl FUN_02382FA4
	mov r0, r4
	b _0238B348
_0238B2A0:
	add r0, sp, #0
	bl FUN_0238B360
	mov r0, #0x8000000
	ldrb r2, [r0, #0xb2]
	cmp r2, #0x96
	bne _0238B2CC
	ldr r1, _0238B354 @ =0x027FFC30
	ldrh r0, [r0, #0xbe]
	ldrh r1, [r1]
	cmp r1, r0
	bne _0238B310
_0238B2CC:
	cmp r2, #0x96
	ldrne r1, _0238B354 @ =0x027FFC30
	ldrne r0, _0238B35C @ =0x0801FFFE
	ldrhne r1, [r1]
	ldrhne r0, [r0]
	cmpne r1, r0
	bne _0238B310
	ldr r2, _0238B354 @ =0x027FFC30
	mov r0, #0x8000000
	ldr r1, [r2, #8]
	ldr r0, [r0, #0xac]
	cmp r1, r0
	beq _0238B324
	ldrb r0, [r2, #5]
	lsl r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _0238B324
_0238B310:
	ldr r1, _0238B354 @ =0x027FFC30
	mov r4, #0
	ldrb r0, [r1, #5]
	orr r0, r0, #2
	strb r0, [r1, #5]
_0238B324:
	ldr r0, [sp]
	bl FUN_0238B3A4
	ldr r0, [sp, #4]
	bl FUN_0238B3C0
	ldr r0, _0238B358 @ =0x03809448
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl FUN_0238B42C
	mov r0, r4
_0238B348:
	add sp, sp, #0x10
	pop {r4, lr}
	bx lr
	.align 2, 0
_0238B354: .4byte 0x027FFC30
_0238B358: .4byte 0x03809448
_0238B35C: .4byte 0x0801FFFE
	arm_func_end FUN_0238B23C

	arm_func_start FUN_0238B360
FUN_0238B360: @ 0x0238B360
	push {r3, lr}
	ldr r2, _0238B3A0 @ =0x04000204
	ldrh r1, [r2]
	and r1, r1, #0xc
	asr r1, r1, #2
	str r1, [r0]
	ldrh r1, [r2]
	and r1, r1, #0x10
	asr r1, r1, #4
	str r1, [r0, #4]
	mov r0, #3
	bl FUN_0238B3A4
	mov r0, #0
	bl FUN_0238B3C0
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238B3A0: .4byte 0x04000204
	arm_func_end FUN_0238B360

	arm_func_start FUN_0238B3A4
FUN_0238B3A4: @ 0x0238B3A4
	ldr r2, _0238B3BC @ =0x04000204
	ldrh r1, [r2]
	bic r1, r1, #0xc
	orr r0, r1, r0, lsl #2
	strh r0, [r2]
	bx lr
	.align 2, 0
_0238B3BC: .4byte 0x04000204
	arm_func_end FUN_0238B3A4

	arm_func_start FUN_0238B3C0
FUN_0238B3C0: @ 0x0238B3C0
	ldr r2, _0238B3D8 @ =0x04000204
	ldrh r1, [r2]
	bic r1, r1, #0x10
	orr r0, r1, r0, lsl #4
	strh r0, [r2]
	bx lr
	.align 2, 0
_0238B3D8: .4byte 0x04000204
	arm_func_end FUN_0238B3C0

	arm_func_start FUN_0238B3DC
FUN_0238B3DC: @ 0x0238B3DC
	push {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	bl FUN_02382F90
	str r0, [r4, #4]
	ldr r0, _0238B428 @ =0x027FFFE8
	bl FUN_02380E84
	ands r0, r0, #0x80
	str r0, [r4]
	bne _0238B414
	mov r0, r5
	bl FUN_02380E14
	cmp r0, #0
	bne _0238B41C
_0238B414:
	mov r0, #1
	b _0238B420
_0238B41C:
	mov r0, #0
_0238B420:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0238B428: .4byte 0x027FFFE8
	arm_func_end FUN_0238B3DC

	arm_func_start FUN_0238B42C
FUN_0238B42C: @ 0x0238B42C
	push {r4, lr}
	mov r4, r1
	ldr r1, [r4]
	cmp r1, #0
	bne _0238B444
	bl FUN_02380E08
_0238B444:
	ldr r0, [r4, #4]
	bl FUN_02382FA4
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238B42C

	arm_func_start FUN_0238B454
FUN_0238B454: @ 0x0238B454
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, #1
	mov r5, #0xd
	mov r4, #0
	b _0238B474
_0238B46C:
	mov r0, r6
	bl FUN_02380C9C
_0238B474:
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	bne _0238B46C
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_0238B454

	arm_func_start FUN_0238B494
FUN_0238B494: @ 0x0238B494
	push {r3, lr}
	bl FUN_023823B8
	bl FUN_023825DC
	ldr r0, _0238B51C @ =0x03809480
	bl FUN_02382630
	ldr r0, _0238B520 @ =0x03809450
	ldr r1, [r0, #0x14]
	cmp r1, #0
	bne _0238B514
	mov r1, #1
	str r1, [r0, #0x14]
	bl FUN_0238B1A4
	bl FUN_02380E8C
	mvn r1, #2
	cmp r0, r1
	beq _0238B514
	ldr r1, _0238B520 @ =0x03809450
	strh r0, [r1]
	bl FUN_023834B4
	ldr r1, _0238B524 @ =0x0380343C
	mov r0, #0xd
	bl FUN_0238359C
	bl FUN_0238B534
	ldr r1, _0238B528 @ =0x0380346C
	mov r0, #0xd
	bl FUN_0238359C
	ldr r1, _0238B52C @ =0x038034A0
	mov r0, #0x10
	bl FUN_0238359C
	ldr r1, _0238B530 @ =0x038037E4
	mov r0, #0x11
	bl FUN_0238359C
_0238B514:
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238B51C: .4byte 0x03809480
_0238B520: .4byte 0x03809450
_0238B524: .4byte 0x0380343C
_0238B528: .4byte 0x0380346C
_0238B52C: .4byte 0x038034A0
_0238B530: .4byte 0x038037E4
	arm_func_end FUN_0238B494

	arm_func_start FUN_0238B534
FUN_0238B534: @ 0x0238B534
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0238B690 @ =0x03809450
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _0238B688
	ldr r1, _0238B694 @ =0x04000300
	mov r2, #1
	ldrh r1, [r1]
	str r2, [r0, #8]
	tst r1, #1
	beq _0238B688
	mov r0, #0x40000
	bl FUN_02380B34
	ldr r2, _0238B698 @ =0x04000208
	mov r1, #1
	ldrh sb, [r2]
	ldr r5, _0238B690 @ =0x03809450
	mov r4, r0
	strh r1, [r2]
	mov r6, #0x100
	b _0238B590
_0238B588:
	mov r0, r6
	bl FUN_02380C9C
_0238B590:
	ldr r0, [r5, #0x28]
	cmp r0, #1
	bne _0238B588
	ldr r0, _0238B690 @ =0x03809450
	mov r1, #0x8000000
	ldr r2, [r0, #0x18]
	ldr r0, _0238B69C @ =0x01FFFFC0
	add r8, r1, #4
	and r0, r2, r0
	lsr r0, r0, #6
	lsl r0, r0, #5
	add r5, r0, #0x2000000
	mov r6, #1
	bl FUN_02380E8C
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	mov r0, r7
	bl FUN_02380D98
	ldr ip, _0238B6A0 @ =0x0000FFFF
	mov sl, #0
	eor r0, ip, #3
	eor r1, ip, #0x84
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r2, r0, #0x10
	lsr r3, r1, #0x10
	b _0238B638
_0238B5FC:
	mov lr, ip
	cmp sl, #0x4c
	moveq lr, r3
	beq _0238B614
	cmp sl, #0x4d
	moveq lr, r2
_0238B614:
	add r0, r5, sl, lsl #1
	lsl r1, sl, #1
	ldrh r0, [r0, #4]
	ldrh r1, [r8, r1]
	and r0, lr, r0
	cmp r0, r1
	movne r6, #0
	bne _0238B640
	add sl, sl, #1
_0238B638:
	cmp sl, #0x4e
	blt _0238B5FC
_0238B640:
	mov r0, r7
	bl FUN_02380E08
	mov r0, r7
	bl FUN_02380F24
	ldr r2, _0238B6A4 @ =0x027FFC30
	and r0, r6, #0xff
	ldrb r1, [r2, #5]
	and r0, r0, #1
	bic r1, r1, #1
	orr r1, r1, r0
	mov r0, #1
	strb r1, [r2, #5]
	bl FUN_0238B454
	ldr r2, _0238B698 @ =0x04000208
	mov r0, r4
	ldrh r1, [r2]
	strh sb, [r2]
	bl FUN_02380B34
_0238B688:
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0238B690: .4byte 0x03809450
_0238B694: .4byte 0x04000300
_0238B698: .4byte 0x04000208
_0238B69C: .4byte 0x01FFFFC0
_0238B6A0: .4byte 0x0000FFFF
_0238B6A4: .4byte 0x027FFC30
	arm_func_end FUN_0238B534

	arm_func_start FUN_0238B6A8
FUN_0238B6A8: @ 0x0238B6A8
	push {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	ldreq r0, _0238B6D4 @ =0x03809450
	moveq r2, #1
	streq r1, [r0, #0x18]
	streq r2, [r0, #0x28]
	beq _0238B6CC
	bl FUN_02383100
_0238B6CC:
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238B6D4: .4byte 0x03809450
	arm_func_end FUN_0238B6A8

	arm_func_start FUN_0238B6D8
FUN_0238B6D8: @ 0x0238B6D8
	push {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #2
	bne _0238B700
	mov r0, #0
	bl FUN_0238B71C
	bl FUN_02383908
	bl FUN_0238DCA8
	bl FUN_02383100
	b _0238B704
_0238B700:
	bl FUN_02383100
_0238B704:
	pop {r3, lr}
	bx lr
	arm_func_end FUN_0238B6D8

	arm_func_start FUN_0238B70C
FUN_0238B70C: @ 0x0238B70C
	ldr ip, _0238B718 @ =0x038034B0
	mov r0, r1
	bx ip
	.align 2, 0
_0238B718: .4byte 0x038034B0
	arm_func_end FUN_0238B70C

	arm_func_start FUN_0238B71C
FUN_0238B71C: @ 0x0238B71C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r5, r0
	beq _0238B758
	ldr r0, [r5]
	cmp r0, #0
	bne _0238B758
	ldr r0, [r5, #0x44]
	add r0, r0, #1
	str r0, [r5, #0x44]
	ldr r1, [r5, #0x40]
	cmp r1, #0
	beq _0238B758
	ldr r0, [r5, #0x44]
	cmp r0, r1
	movhi r5, #0
_0238B758:
	cmp r5, #0
	ldrne r0, [r5, #0x3c]
	cmpne r0, #0
	bne _0238B7FC
	bl FUN_02382F90
	ldr r4, _0238B938 @ =0x03809450
	mov sb, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _0238B7E8
	mov sl, #0
	ldr r7, _0238B93C @ =0x027FFFE8
	ldr r5, _0238B940 @ =0x08001000
	mov r6, sl
	mov fp, #1
	b _0238B7E0
_0238B798:
	mov r0, r7
	bl FUN_02380E84
	ands r8, r0, #0x80
	bne _0238B7B8
	ldrh r0, [r4]
	bl FUN_02380E14
	cmp r0, #0
	bne _0238B7D8
_0238B7B8:
	str r6, [r4, #4]
	mov sl, fp
	strh r6, [r5]
	cmp r8, #0
	bne _0238B7E0
	ldrh r0, [r4]
	bl FUN_02380DE8
	b _0238B7E0
_0238B7D8:
	ldr r0, _0238B944 @ =0x000080E8
	bl FUN_02382FF4
_0238B7E0:
	cmp sl, #0
	beq _0238B798
_0238B7E8:
	ldr r0, _0238B948 @ =0x03809480
	bl FUN_02382850
	mov r0, sb
	bl FUN_02382FA4
	b _0238B930
_0238B7FC:
	cmp r5, #0
	beq _0238B930
	ldr r0, _0238B93C @ =0x027FFFE8
	bl FUN_02380E84
	ands r4, r0, #0x80
	bne _0238B828
	ldr r0, _0238B938 @ =0x03809450
	ldrh r0, [r0]
	bl FUN_02380E14
	cmp r0, #0
	bne _0238B918
_0238B828:
	ldr r1, [r5]
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _0238B870
	ldr r0, _0238B938 @ =0x03809450
	mov r2, #0
	ldr r1, _0238B940 @ =0x08001000
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5, #8]
	ldr r0, _0238B948 @ =0x03809480
	ldr r3, _0238B94C @ =0x038034B0
	mov r2, #0
	bl FUN_0238276C
	mov r0, #0
	str r0, [r5]
	b _0238B900
_0238B870:
	tst r1, #1
	ldr r1, _0238B940 @ =0x08001000
	beq _0238B8C0
	ldr r0, _0238B938 @ =0x03809450
	mov r2, #0
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5]
	ldr r0, _0238B948 @ =0x03809480
	lsr r1, r1, #1
	add r1, r5, r1, lsl #2
	ldr r1, [r1, #0x24]
	ldr r3, _0238B94C @ =0x038034B0
	mov r2, #0
	bl FUN_0238276C
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0238B900
_0238B8C0:
	ldr r0, _0238B938 @ =0x03809450
	mov r2, #2
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5]
	ldr r0, _0238B948 @ =0x03809480
	lsr r1, r1, #1
	add r1, r5, r1, lsl #2
	ldr r1, [r1, #0xc]
	ldr r3, _0238B94C @ =0x038034B0
	mov r2, #0
	bl FUN_0238276C
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0238B900:
	cmp r4, #0
	bne _0238B930
	ldr r0, _0238B938 @ =0x03809450
	ldrh r0, [r0]
	bl FUN_02380DE8
	b _0238B930
_0238B918:
	ldr r0, _0238B948 @ =0x03809480
	ldr r1, _0238B950 @ =0x0000020B
	ldr r3, _0238B94C @ =0x038034B0
	mov r2, #0
	str r5, [sp]
	bl FUN_0238276C
_0238B930:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0238B938: .4byte 0x03809450
_0238B93C: .4byte 0x027FFFE8
_0238B940: .4byte 0x08001000
_0238B944: .4byte 0x000080E8
_0238B948: .4byte 0x03809480
_0238B94C: .4byte 0x038034B0
_0238B950: .4byte 0x0000020B
	arm_func_end FUN_0238B71C

	arm_func_start FUN_0238B954
FUN_0238B954: @ 0x0238B954
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0238BA44 @ =0x03806B9C
	mvn r0, #0
	ldr r3, [r1, #4]
	cmp r3, r0
	ldreq r0, _0238BA48 @ =0x027FFC3C
	ldreq r0, [r0]
	addeq r0, r0, #0xa
	streq r0, [r1, #4]
	beq _0238BA3C
	ldr r0, _0238BA4C @ =0x03809450
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	bne _0238BA3C
	ldr r2, _0238BA48 @ =0x027FFC3C
	ldr r0, [r2]
	cmp r0, r3
	blo _0238BA3C
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1, #4]
	bl FUN_0238B1EC
	ldr r1, _0238BA4C @ =0x03809450
	str r0, [r1, #0xc]
	bl FUN_0238B23C
	cmp r0, #0
	bne _0238B9EC
	ldr r0, _0238BA44 @ =0x03806B9C
	mov r1, #1
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, _0238BA4C @ =0x03809450
	strne r1, [r0, #0x10]
	bne _0238BA3C
	ldr r0, _0238BA4C @ =0x03809450
	str r1, [r0, #0xc]
_0238B9EC:
	ldr r0, _0238BA4C @ =0x03809450
	ldr r1, _0238BA44 @ =0x03806B9C
	ldr r0, [r0, #0xc]
	mov r2, #0
	str r2, [r1]
	cmp r0, #0
	beq _0238BA3C
	mov r7, #0x64
	mov r6, #0xd
	mov r5, #0x11
	mov r4, r2
	b _0238BA24
_0238BA1C:
	mov r0, r7
	bl FUN_0238171C
_0238BA24:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	bne _0238BA1C
_0238BA3C:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0238BA44: .4byte 0x03806B9C
_0238BA48: .4byte 0x027FFC3C
_0238BA4C: .4byte 0x03809450
	arm_func_end FUN_0238B954

	arm_func_start FUN_0238BA50
FUN_0238BA50: @ 0x0238BA50
	push {r3, r4, r5, r6, r7, lr}
	and r0, r1, #0x3f
	cmp r0, #3
	bne _0238BAB8
	ldr r3, _0238BAC4 @ =0x04000204
	ldr r0, _0238BAC8 @ =0x01FFFFC0
	ldrh r2, [r3]
	and r0, r1, r0
	lsr r1, r0, #6
	bic r0, r2, #0x60
	orr r0, r0, r1, lsl #5
	strh r0, [r3]
	mov r7, #1
	mov r6, #0x11
	mov r5, #0x12
	mov r4, #0
	b _0238BA9C
_0238BA94:
	mov r0, r7
	bl FUN_02380C9C
_0238BA9C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	bne _0238BA94
	b _0238BABC
_0238BAB8:
	bl FUN_02383100
_0238BABC:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0238BAC4: .4byte 0x04000204
_0238BAC8: .4byte 0x01FFFFC0
	arm_func_end FUN_0238BA50

	arm_func_start FUN_0238BACC
FUN_0238BACC: @ 0x0238BACC
	ldr r0, _0238BAF0 @ =0x038094AC
	mov r3, #0
	mov r2, r3
_0238BAD8:
	lsl r1, r3, #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _0238BAD8
	bx lr
	.align 2, 0
_0238BAF0: .4byte 0x038094AC
	arm_func_end FUN_0238BACC

	arm_func_start FUN_0238BAF4
FUN_0238BAF4: @ 0x0238BAF4
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	tst r0, #0x2000000
	beq _0238BB24
	ldr r2, _0238BC94 @ =0x038094AC
	mov r5, #0
	mov lr, r5
_0238BB10:
	lsl r4, r5, #1
	add r5, r5, #1
	strh lr, [r2, r4]
	cmp r5, #0x10
	blt _0238BB10
_0238BB24:
	ldr r2, _0238BC94 @ =0x038094AC
	and r4, r0, #0xf0000
	lsr r4, r4, #0x10
	lsl r4, r4, #1
	strh r0, [r2, r4]
	tst r0, #0x1000000
	beq _0238BC88
	ldr lr, _0238BC98 @ =0x038094AC
	ldrh r0, [lr]
	and r2, r0, #0xff00
	lsl r2, r2, #8
	lsr r4, r2, #0x10
	sub r2, r4, #0x22
	cmp r2, #0xa
	addls pc, pc, r2, lsl #2
	b _0238BC5C
_0238BB64: @ jump table
	b _0238BB90 @ case 0
	b _0238BBC8 @ case 1
	b _0238BBC8 @ case 2
	b _0238BC10 @ case 3
	b _0238BC10 @ case 4
	b _0238BC50 @ case 5
	b _0238BC50 @ case 6
	b _0238BC5C @ case 7
	b _0238BC5C @ case 8
	b _0238BC5C @ case 9
	b _0238BB90 @ case 10
_0238BB90:
	ldrh ip, [lr, #4]
	ldrh r2, [lr, #2]
	lsl r0, r0, #0x18
	and ip, ip, #0xff00
	orr r0, r0, r2, lsl #8
	orr ip, r0, ip, lsr #8
	cmp ip, #0x2000000
	blo _0238BBB8
	cmp ip, #0x2800000
	blo _0238BC5C
_0238BBB8:
	mov r0, r4
	mov r1, #2
	bl FUN_02388D68
	b _0238BC88
_0238BBC8:
	ldrh r2, [lr, #8]
	ldrh r1, [lr, #0xa]
	orr ip, r1, r2, lsl #16
	cmp ip, #0x2000000
	blo _0238BBE4
	cmp ip, #0x2800000
	blo _0238BBF4
_0238BBE4:
	mov r0, r4
	mov r1, #2
	bl FUN_02388D68
	b _0238BC88
_0238BBF4:
	ldrh r2, [lr, #2]
	lsl r3, r0, #0x18
	ldrh r1, [lr, #4]
	ldrh r0, [lr, #6]
	orr r3, r2, r3, lsr #8
	orr r1, r0, r1, lsl #16
	b _0238BC5C
_0238BC10:
	ldrh r2, [lr, #6]
	ldrh r1, [lr, #8]
	orr ip, r1, r2, lsl #16
	cmp ip, #0x2000000
	blo _0238BC2C
	cmp ip, #0x2800000
	blo _0238BC3C
_0238BC2C:
	mov r0, r4
	mov r1, #2
	bl FUN_02388D68
	b _0238BC88
_0238BC3C:
	ldrh r2, [lr, #2]
	lsl r0, r0, #0x18
	ldrh r1, [lr, #4]
	orr r3, r2, r0, lsr #8
	b _0238BC5C
_0238BC50:
	ldrh r2, [lr, #2]
	lsl r0, r0, #0x18
	orr r3, r2, r0, lsr #8
_0238BC5C:
	str r1, [sp]
	mov r1, r4
	mov r0, #1
	mov r2, #3
	str ip, [sp, #4]
	bl FUN_02388E9C
	cmp r0, #0
	bne _0238BC88
	mov r0, r4
	mov r1, #4
	bl FUN_02388D68
_0238BC88:
	add sp, sp, #8
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0238BC94: .4byte 0x038094AC
_0238BC98: .4byte 0x038094AC
	arm_func_end FUN_0238BAF4

	arm_func_start FUN_0238BC9C
FUN_0238BC9C: @ 0x0238BC9C
	push {r3, r4, r5, lr}
	mov r4, r0
	bl FUN_02382F90
	mov r5, r0
	mov r0, #1
	bl FUN_02388E2C
	cmp r0, #0
	bne _0238BCDC
	mov r0, r5
	bl FUN_02382FA4
	ldr r0, [r4, #4]
	mov r1, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	b _0238BF68
_0238BCDC:
	mov r0, #1
	bl FUN_02388E48
	mov r0, r5
	bl FUN_02382FA4
	ldr r0, [r4, #4]
	sub r0, r0, #0x20
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _0238BF2C
_0238BD00: @ jump table
	b _0238BD38 @ case 0
	b _0238BD40 @ case 1
	b _0238BD48 @ case 2
	b _0238BD54 @ case 3
	b _0238BD94 @ case 4
	b _0238BDD4 @ case 5
	b _0238BE1C @ case 6
	b _0238BE64 @ case 7
	b _0238BE9C @ case 8
	b _0238BED4 @ case 9
	b _0238BEDC @ case 10
	b _0238BEE4 @ case 11
	b _0238BF18 @ case 12
	b _0238BF24 @ case 13
_0238BD38:
	bl FUN_0238BFC4
	b _0238BF4C
_0238BD40:
	bl FUN_0238C028
	b _0238BF4C
_0238BD48:
	ldr r0, [r4, #0x10]
	bl FUN_0238C068
	b _0238BF4C
_0238BD54:
	bl FUN_0238BF70
	cmp r0, #0
	bne _0238BD80
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	mov r0, #1
	bl FUN_02388E60
	b _0238BF68
_0238BD80:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	bl FUN_0238C0D8
	b _0238BF4C
_0238BD94:
	bl FUN_0238BF70
	cmp r0, #0
	bne _0238BDC0
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	mov r0, #1
	bl FUN_02388E60
	b _0238BF68
_0238BDC0:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	bl FUN_0238C200
	b _0238BF4C
_0238BDD4:
	bl FUN_0238BF94
	cmp r0, #0
	bne _0238BE00
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	mov r0, #1
	bl FUN_02388E60
	b _0238BF68
_0238BE00:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	lsl r1, r1, #0x10
	ldr r2, [r4, #0x10]
	lsr r1, r1, #0x10
	bl FUN_0238C320
	b _0238BF4C
_0238BE1C:
	bl FUN_0238BF94
	cmp r0, #0
	bne _0238BE48
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	mov r0, #1
	bl FUN_02388E60
	b _0238BF68
_0238BE48:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	lsl r1, r1, #0x10
	ldr r2, [r4, #0x10]
	lsr r1, r1, #0x10
	bl FUN_0238C42C
	b _0238BF4C
_0238BE64:
	bl FUN_0238BF94
	cmp r0, #0
	bne _0238BE90
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	mov r0, #1
	bl FUN_02388E60
	b _0238BF68
_0238BE90:
	ldr r0, [r4, #8]
	bl FUN_0238C538
	b _0238BF4C
_0238BE9C:
	bl FUN_0238BF94
	cmp r0, #0
	bne _0238BEC8
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	mov r0, #1
	bl FUN_02388E60
	b _0238BF68
_0238BEC8:
	ldr r0, [r4, #8]
	bl FUN_0238C5C0
	b _0238BF4C
_0238BED4:
	bl FUN_0238C648
	b _0238BF4C
_0238BEDC:
	bl FUN_0238C688
	b _0238BF4C
_0238BEE4:
	bl FUN_0238BF94
	cmp r0, #0
	bne _0238BF10
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	mov r0, #1
	bl FUN_02388E60
	b _0238BF68
_0238BF10:
	bl FUN_0238C6C8
	b _0238BF4C
_0238BF18:
	ldr r0, [r4, #0x10]
	bl FUN_0238C708
	b _0238BF4C
_0238BF24:
	bl FUN_0238C7A4
	b _0238BF4C
_0238BF2C:
	mov r0, #1
	bl FUN_02388E60
	ldr r0, [r4, #4]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	b _0238BF68
_0238BF4C:
	ldr r0, [r4, #4]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_02388D68
	mov r0, #1
	bl FUN_02388E60
_0238BF68:
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_0238BC9C

	arm_func_start FUN_0238BF70
FUN_0238BF70: @ 0x0238BF70
	push {r3, lr}
	add r0, sp, #0
	bl FUN_0238C068
	ldrh r0, [sp]
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	pop {r3, lr}
	bx lr
	arm_func_end FUN_0238BF70

	arm_func_start FUN_0238BF94
FUN_0238BF94: @ 0x0238BF94
	push {r3, lr}
	add r0, sp, #0
	bl FUN_0238C068
	ldrh r0, [sp]
	tst r0, #1
	movne r0, #0
	bne _0238BFBC
	tst r0, #2
	movne r0, #1
	moveq r0, #0
_0238BFBC:
	pop {r3, lr}
	bx lr
	arm_func_end FUN_0238BF94

	arm_func_start FUN_0238BFC4
FUN_0238BFC4: @ 0x0238BFC4
	ldr r2, _0238BFFC @ =0x040001C0
_0238BFC8:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238BFC8
	ldr r0, _0238C000 @ =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #6
	strh r1, [r0]
	sub r1, r0, #2
_0238BFEC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238BFEC
	bx lr
	.align 2, 0
_0238BFFC: .4byte 0x040001C0
_0238C000: .4byte 0x040001C2
	arm_func_end FUN_0238BFC4

	arm_func_start FUN_0238C004
FUN_0238C004: @ 0x0238C004
	ldr r1, _0238C024 @ =0x040001C2
	and r0, r0, #0xff
	strh r0, [r1]
	sub r1, r1, #2
_0238C014:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238C014
	bx lr
	.align 2, 0
_0238C024: .4byte 0x040001C2
	arm_func_end FUN_0238C004

	arm_func_start FUN_0238C028
FUN_0238C028: @ 0x0238C028
	ldr r2, _0238C060 @ =0x040001C0
_0238C02C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238C02C
	ldr r0, _0238C064 @ =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #4
	strh r1, [r0]
	sub r1, r0, #2
_0238C050:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238C050
	bx lr
	.align 2, 0
_0238C060: .4byte 0x040001C0
_0238C064: .4byte 0x040001C2
	arm_func_end FUN_0238C028

	arm_func_start FUN_0238C068
FUN_0238C068: @ 0x0238C068
	ldr r3, _0238C0D0 @ =0x040001C0
_0238C06C:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _0238C06C
	ldr r1, _0238C0D4 @ =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #5
	strh r2, [r1]
	sub r3, r1, #2
_0238C090:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _0238C090
	ldr r1, _0238C0D4 @ =0x040001C2
	mov r2, #0x8100
	strh r2, [r3]
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_0238C0B4:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _0238C0B4
	ldr r1, _0238C0D4 @ =0x040001C2
	ldrh r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_0238C0D0: .4byte 0x040001C0
_0238C0D4: .4byte 0x040001C2
	arm_func_end FUN_0238C068

	arm_func_start FUN_0238C0D8
FUN_0238C0D8: @ 0x0238C0D8
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r2
	cmp r1, #1
	blo _0238C1C8
	and r2, r0, #0xff00
	lsr r2, r2, #8
	and r3, r0, #0xff0000
	strh r2, [sp, #2]
	lsr r3, r3, #0x10
	and r0, r0, #0xff
	ldr r2, _0238C1D4 @ =0x040001C0
	strh r3, [sp]
	strh r0, [sp, #4]
_0238C110:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238C110
	ldr r4, _0238C1D8 @ =0x040001C2
	mov r0, #0x8900
	strh r0, [r2]
	mov r0, #3
	strh r0, [r4]
	mov ip, #0
	add r2, sp, #0
	sub r3, r4, #2
_0238C13C:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _0238C13C
	lsl r0, ip, #1
	ldrh r0, [r2, r0]
	add ip, ip, #1
	and r0, r0, #0xff
	strh r0, [r4]
	cmp ip, #3
	blt _0238C13C
	ldr r2, _0238C1D4 @ =0x040001C0
_0238C168:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238C168
	mov r4, #0
	ldr r2, _0238C1D4 @ =0x040001C0
	sub r0, r1, #1
	mov r3, r4
	b _0238C1A4
_0238C188:
	strh r3, [r2, #2]
_0238C18C:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _0238C18C
	ldrh r1, [r2, #2]
	strb r1, [r5, r4]
	add r4, r4, #1
_0238C1A4:
	cmp r4, r0
	blo _0238C188
	ldr r0, _0238C1D4 @ =0x040001C0
	mov r1, #0x8100
	strh r1, [r0]
	bl FUN_0238C1DC
	ldr r0, _0238C1D8 @ =0x040001C2
	ldrh r0, [r0]
	strb r0, [r5, r4]
_0238C1C8:
	add sp, sp, #8
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0238C1D4: .4byte 0x040001C0
_0238C1D8: .4byte 0x040001C2
	arm_func_end FUN_0238C0D8

	arm_func_start FUN_0238C1DC
FUN_0238C1DC: @ 0x0238C1DC
	ldr r0, _0238C1FC @ =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_0238C1EC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238C1EC
	bx lr
	.align 2, 0
_0238C1FC: .4byte 0x040001C2
	arm_func_end FUN_0238C1DC

	arm_func_start FUN_0238C200
FUN_0238C200: @ 0x0238C200
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r2
	cmp r1, #1
	blo _0238C30C
	and r2, r0, #0xff00
	lsr r2, r2, #8
	and r3, r0, #0xff0000
	strh r2, [sp, #2]
	lsr r3, r3, #0x10
	and r0, r0, #0xff
	ldr r2, _0238C318 @ =0x040001C0
	strh r3, [sp]
	strh r0, [sp, #4]
_0238C238:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238C238
	ldr r4, _0238C31C @ =0x040001C2
	mov r0, #0x8900
	strh r0, [r2]
	mov r0, #0xb
	strh r0, [r4]
	mov ip, #0
	add r2, sp, #0
	sub r3, r4, #2
_0238C264:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _0238C264
	lsl r0, ip, #1
	ldrh r0, [r2, r0]
	add ip, ip, #1
	and r0, r0, #0xff
	strh r0, [r4]
	cmp ip, #3
	blt _0238C264
	ldr r2, _0238C318 @ =0x040001C0
_0238C290:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238C290
	ldr r0, _0238C31C @ =0x040001C2
	mov r2, #0
	strh r2, [r0]
	sub r2, r0, #2
_0238C2AC:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238C2AC
	mov r4, #0
	ldr r2, _0238C318 @ =0x040001C0
	sub r0, r1, #1
	mov r3, r4
	b _0238C2E8
_0238C2CC:
	strh r3, [r2, #2]
_0238C2D0:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _0238C2D0
	ldrh r1, [r2, #2]
	strb r1, [r5, r4]
	add r4, r4, #1
_0238C2E8:
	cmp r4, r0
	blo _0238C2CC
	ldr r0, _0238C318 @ =0x040001C0
	mov r1, #0x8100
	strh r1, [r0]
	bl FUN_0238C1DC
	ldr r0, _0238C31C @ =0x040001C2
	ldrh r0, [r0]
	strb r0, [r5, r4]
_0238C30C:
	add sp, sp, #8
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0238C318: .4byte 0x040001C0
_0238C31C: .4byte 0x040001C2
	arm_func_end FUN_0238C200

	arm_func_start FUN_0238C320
FUN_0238C320: @ 0x0238C320
	push {r4, lr}
	sub sp, sp, #8
	cmp r1, #1
	blo _0238C418
	add r3, r0, r1
	sub r3, r3, #1
	lsr r3, r3, #8
	cmp r3, r0, lsr #8
	and r3, r0, #0xff00
	lsr r3, r3, #8
	andhi r1, r0, #0xff
	and ip, r0, #0xff0000
	strh r3, [sp, #2]
	rsbhi r1, r1, #0x100
	lsr ip, ip, #0x10
	and r0, r0, #0xff
	lslhi r1, r1, #0x10
	ldr r3, _0238C424 @ =0x040001C0
	strh ip, [sp]
	strh r0, [sp, #4]
	lsrhi r1, r1, #0x10
_0238C374:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _0238C374
	ldr lr, _0238C428 @ =0x040001C2
	mov r0, #0x8900
	strh r0, [r3]
	mov r0, #0xa
	strh r0, [lr]
	mov r4, #0
	add r3, sp, #0
	sub ip, lr, #2
_0238C3A0:
	ldrh r0, [ip]
	tst r0, #0x80
	bne _0238C3A0
	lsl r0, r4, #1
	ldrh r0, [r3, r0]
	add r4, r4, #1
	and r0, r0, #0xff
	strh r0, [lr]
	cmp r4, #3
	blt _0238C3A0
	sub r3, r1, #1
	ldr r1, _0238C424 @ =0x040001C0
	mov r4, #0
	b _0238C3F0
_0238C3D8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238C3D8
	ldrb r0, [r2, r4]
	add r4, r4, #1
	strh r0, [r1, #2]
_0238C3F0:
	cmp r4, r3
	blt _0238C3D8
	ldr r1, _0238C424 @ =0x040001C0
_0238C3FC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238C3FC
	mov r0, #0x8100
	strh r0, [r1]
	ldrb r0, [r2, r4]
	bl FUN_0238C004
_0238C418:
	add sp, sp, #8
	pop {r4, lr}
	bx lr
	.align 2, 0
_0238C424: .4byte 0x040001C0
_0238C428: .4byte 0x040001C2
	arm_func_end FUN_0238C320

	arm_func_start FUN_0238C42C
FUN_0238C42C: @ 0x0238C42C
	push {r4, lr}
	sub sp, sp, #8
	cmp r1, #1
	blo _0238C524
	add r3, r0, r1
	sub r3, r3, #1
	lsr r3, r3, #8
	cmp r3, r0, lsr #8
	and r3, r0, #0xff00
	lsr r3, r3, #8
	andhi r1, r0, #0xff
	and ip, r0, #0xff0000
	strh r3, [sp, #2]
	rsbhi r1, r1, #0x100
	lsr ip, ip, #0x10
	and r0, r0, #0xff
	lslhi r1, r1, #0x10
	ldr r3, _0238C530 @ =0x040001C0
	strh ip, [sp]
	strh r0, [sp, #4]
	lsrhi r1, r1, #0x10
_0238C480:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _0238C480
	ldr lr, _0238C534 @ =0x040001C2
	mov r0, #0x8900
	strh r0, [r3]
	mov r0, #2
	strh r0, [lr]
	mov r4, #0
	add r3, sp, #0
	sub ip, lr, #2
_0238C4AC:
	ldrh r0, [ip]
	tst r0, #0x80
	bne _0238C4AC
	lsl r0, r4, #1
	ldrh r0, [r3, r0]
	add r4, r4, #1
	and r0, r0, #0xff
	strh r0, [lr]
	cmp r4, #3
	blt _0238C4AC
	sub r3, r1, #1
	ldr r1, _0238C530 @ =0x040001C0
	mov r4, #0
	b _0238C4FC
_0238C4E4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238C4E4
	ldrb r0, [r2, r4]
	add r4, r4, #1
	strh r0, [r1, #2]
_0238C4FC:
	cmp r4, r3
	blt _0238C4E4
	ldr r1, _0238C530 @ =0x040001C0
_0238C508:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238C508
	mov r0, #0x8100
	strh r0, [r1]
	ldrb r0, [r2, r4]
	bl FUN_0238C004
_0238C524:
	add sp, sp, #8
	pop {r4, lr}
	bx lr
	.align 2, 0
_0238C530: .4byte 0x040001C0
_0238C534: .4byte 0x040001C2
	arm_func_end FUN_0238C42C

	arm_func_start FUN_0238C538
FUN_0238C538: @ 0x0238C538
	push {r3, r4, r5, lr}
	and r1, r0, #0xff0000
	lsr r1, r1, #0x10
	and r2, r0, #0xff00
	lsl r2, r2, #8
	ldr r3, _0238C5B8 @ =0x040001C0
	lsl r1, r1, #0x10
	and r5, r0, #0xff
	lsr r0, r1, #0x10
	lsr r4, r2, #0x10
_0238C560:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _0238C560
	ldr r1, _0238C5BC @ =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0xdb
	strh r2, [r1]
	sub r2, r1, #2
_0238C584:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _0238C584
	bl FUN_0238C004
	mov r0, r4
	bl FUN_0238C004
	ldr r1, _0238C5B8 @ =0x040001C0
	mov r2, #0x8100
	mov r0, r5
	strh r2, [r1]
	bl FUN_0238C004
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0238C5B8: .4byte 0x040001C0
_0238C5BC: .4byte 0x040001C2
	arm_func_end FUN_0238C538

	arm_func_start FUN_0238C5C0
FUN_0238C5C0: @ 0x0238C5C0
	push {r3, r4, r5, lr}
	and r1, r0, #0xff0000
	lsr r1, r1, #0x10
	and r2, r0, #0xff00
	lsl r2, r2, #8
	ldr r3, _0238C640 @ =0x040001C0
	lsl r1, r1, #0x10
	and r5, r0, #0xff
	lsr r0, r1, #0x10
	lsr r4, r2, #0x10
_0238C5E8:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _0238C5E8
	ldr r1, _0238C644 @ =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0xd8
	strh r2, [r1]
	sub r2, r1, #2
_0238C60C:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _0238C60C
	bl FUN_0238C004
	mov r0, r4
	bl FUN_0238C004
	ldr r1, _0238C640 @ =0x040001C0
	mov r2, #0x8100
	mov r0, r5
	strh r2, [r1]
	bl FUN_0238C004
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0238C640: .4byte 0x040001C0
_0238C644: .4byte 0x040001C2
	arm_func_end FUN_0238C5C0

	arm_func_start FUN_0238C648
FUN_0238C648: @ 0x0238C648
	ldr r2, _0238C680 @ =0x040001C0
_0238C64C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238C64C
	ldr r0, _0238C684 @ =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xb9
	strh r1, [r0]
	sub r1, r0, #2
_0238C670:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238C670
	bx lr
	.align 2, 0
_0238C680: .4byte 0x040001C0
_0238C684: .4byte 0x040001C2
	arm_func_end FUN_0238C648

	arm_func_start FUN_0238C688
FUN_0238C688: @ 0x0238C688
	ldr r2, _0238C6C0 @ =0x040001C0
_0238C68C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238C68C
	ldr r0, _0238C6C4 @ =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xab
	strh r1, [r0]
	sub r1, r0, #2
_0238C6B0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238C6B0
	bx lr
	.align 2, 0
_0238C6C0: .4byte 0x040001C0
_0238C6C4: .4byte 0x040001C2
	arm_func_end FUN_0238C688

	arm_func_start FUN_0238C6C8
FUN_0238C6C8: @ 0x0238C6C8
	ldr r2, _0238C700 @ =0x040001C0
_0238C6CC:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238C6CC
	ldr r0, _0238C704 @ =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xc7
	strh r1, [r0]
	sub r1, r0, #2
_0238C6F0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238C6F0
	bx lr
	.align 2, 0
_0238C700: .4byte 0x040001C0
_0238C704: .4byte 0x040001C2
	arm_func_end FUN_0238C6C8

	arm_func_start FUN_0238C708
FUN_0238C708: @ 0x0238C708
	push {r3, lr}
	ldr r3, _0238C79C @ =0x040001C0
_0238C710:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _0238C710
	ldr r1, _0238C7A0 @ =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0x9f
	strh r2, [r1]
	sub r2, r1, #2
_0238C734:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _0238C734
	ldr r1, _0238C7A0 @ =0x040001C2
	mov r2, #0
	strh r2, [r1]
	sub lr, r1, #2
_0238C750:
	ldrh r1, [lr]
	tst r1, #0x80
	bne _0238C750
	ldr ip, _0238C7A0 @ =0x040001C2
	mov r2, #0x8100
	ldrh r3, [ip]
	mov r1, #0
	strb r3, [r0]
	strh r2, [lr]
	strh r1, [ip]
	sub r2, ip, #2
_0238C77C:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _0238C77C
	ldr r1, _0238C7A0 @ =0x040001C2
	ldrh r1, [r1]
	strb r1, [r0, #1]
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238C79C: .4byte 0x040001C0
_0238C7A0: .4byte 0x040001C2
	arm_func_end FUN_0238C708

	arm_func_start FUN_0238C7A4
FUN_0238C7A4: @ 0x0238C7A4
	ldr r2, _0238C7DC @ =0x040001C0
_0238C7A8:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0238C7A8
	ldr r0, _0238C7E0 @ =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xff
	strh r1, [r0]
	sub r1, r0, #2
_0238C7CC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0238C7CC
	bx lr
	.align 2, 0
_0238C7DC: .4byte 0x040001C0
_0238C7E0: .4byte 0x040001C2
	arm_func_end FUN_0238C7A4

	arm_func_start FUN_0238C7E4
FUN_0238C7E4: @ 0x0238C7E4
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	ldr r2, _0238CA24 @ =0x038094CC
	mov r8, r0
	ldrh r0, [r2]
	cmp r0, #0
	bne _0238CA18
	ldr r1, _0238CA28 @ =0x038094D0
	mov r3, #1
	add r0, sp, #8
	strh r3, [r2]
	str r3, [r1, #0x1d4]
	bl FUN_0238D61C
	add r0, sp, #0xa
	bl FUN_0238D680
	ldrh r0, [sp, #8]
	lsl r1, r0, #0x18
	lsrs r1, r1, #0x1f
	bne _0238C84C
	lsl r0, r0, #0x19
	lsrs r0, r0, #0x1f
	bne _0238C84C
	ldrh r0, [sp, #0xa]
	lsl r0, r0, #0x18
	lsrs r0, r0, #0x1f
	beq _0238C864
_0238C84C:
	ldrh r1, [sp, #8]
	add r0, sp, #8
	bic r1, r1, #1
	orr r1, r1, #1
	strh r1, [sp, #8]
	bl FUN_0238D648
_0238C864:
	ldrh r0, [sp, #8]
	lsl r1, r0, #0x1b
	lsrs r1, r1, #0x1f
	bne _0238C880
	lsl r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	beq _0238C8A0
_0238C880:
	ldrh r1, [sp, #0xa]
	add r0, sp, #0xa
	bic r1, r1, #0xf
	strh r1, [sp, #0xa]
	ldrh r1, [sp, #0xa]
	bic r1, r1, #0x40
	strh r1, [sp, #0xa]
	bl FUN_0238D6AC
_0238C8A0:
	ldr r0, _0238CA2C @ =0x027FFDE8
	bl FUN_0238D2AC
	ldr r0, _0238CA2C @ =0x027FFDE8
	ldr r0, [r0]
	lsl r0, r0, #0xa
	lsr r0, r0, #0x1a
	bl FUN_0238D0D4
	ldr r1, _0238CA2C @ =0x027FFDE8
	mov r5, r0
	ldr r0, [r1]
	lsl r0, r0, #0x13
	lsr r0, r0, #0x1b
	bl FUN_0238D0D4
	ldr r1, _0238CA2C @ =0x027FFDE8
	mov r6, r0
	ldr r0, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl FUN_0238D0D4
	sub r1, r6, #1
	cmp r1, #1
	add r7, r0, #0x7d0
	subls r7, r7, #1
	mov r0, r7
	mov r1, #0x190
	addls r6, r6, #0xc
	bl FUN_0238E6D4
	mov r4, r0
	mov r0, r7
	mov r1, #0x64
	bl FUN_0238E6D4
	mov r1, #0xd
	mul r1, r6, r1
	mov r6, r0
	add r0, r1, #8
	mov r1, #5
	bl FUN_0238E6D4
	add r1, r7, r7, lsr #2
	sub r1, r1, r6
	add r1, r4, r1
	add r0, r1, r0
	add r0, r5, r0
	mov r1, #7
	bl FUN_0238E6D4
	ldr r0, _0238CA2C @ =0x027FFDE8
	ldr r2, [r0]
	lsl r3, r2, #5
	lsr r3, r3, #0x1d
	cmp r3, r1
	beq _0238C97C
	bic r2, r2, #0x7000000
	lsl r1, r1, #0x1d
	orr r1, r2, r1, lsr #5
	str r1, [r0]
	bl FUN_0238D2D8
_0238C97C:
	mov r0, #1
	bl FUN_0238D188
	ldr r0, _0238CA28 @ =0x038094D0
	mov r1, #0
	str r1, [r0, #0x1d4]
	bl FUN_023834B4
	ldr r1, _0238CA30 @ =0x038047DC
	mov r0, #5
	bl FUN_0238359C
	ldr r0, _0238CA28 @ =0x038094D0
	ldr r1, _0238CA34 @ =0x038094F0
	mov r2, #4
	bl FUN_0238193C
	mov r0, #0x100
	stm sp, {r0, r8}
	ldr r0, _0238CA38 @ =0x03809500
	ldr r1, _0238CA3C @ =0x03804958
	ldr r3, _0238CA40 @ =0x038096A4
	mov r2, #0
	bl FUN_023812C0
	ldr r0, _0238CA38 @ =0x03809500
	bl FUN_02381620
	mov r0, #0x8000
	bl FUN_023837A8
	mov r0, #0x40
	mov r1, #0
	bl FUN_02383788
	mov r0, #0x100
	mov r1, r0
	bl FUN_02383788
	bl FUN_02382F90
	mov r4, r0
	ldr r1, _0238CA44 @ =0x03804DD8
	mov r0, #0x80
	bl FUN_02380A4C
	mov r0, #0x80
	bl FUN_02380B80
	mov r0, r4
	bl FUN_02382FA4
_0238CA18:
	add sp, sp, #0xc
	pop {r3, r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0238CA24: .4byte 0x038094CC
_0238CA28: .4byte 0x038094D0
_0238CA2C: .4byte 0x027FFDE8
_0238CA30: .4byte 0x038047DC
_0238CA34: .4byte 0x038094F0
_0238CA38: .4byte 0x03809500
_0238CA3C: .4byte 0x03804958
_0238CA40: .4byte 0x038096A4
_0238CA44: .4byte 0x03804DD8
	arm_func_end FUN_0238C7E4

	arm_func_start FUN_0238CA48
FUN_0238CA48: @ 0x0238CA48
	push {r4, lr}
	cmp r2, #0
	bne _0238CB74
	and r0, r1, #0x7f00
	lsl r0, r0, #8
	lsr r4, r0, #0x10
	cmp r4, #0x29
	addls pc, pc, r4, lsl #2
	b _0238CB68
_0238CA6C: @ jump table
	b _0238CB14 @ case 0
	b _0238CB14 @ case 1
	b _0238CB68 @ case 2
	b _0238CB68 @ case 3
	b _0238CB68 @ case 4
	b _0238CB68 @ case 5
	b _0238CB68 @ case 6
	b _0238CB68 @ case 7
	b _0238CB68 @ case 8
	b _0238CB68 @ case 9
	b _0238CB68 @ case 10
	b _0238CB68 @ case 11
	b _0238CB68 @ case 12
	b _0238CB68 @ case 13
	b _0238CB68 @ case 14
	b _0238CB68 @ case 15
	b _0238CB14 @ case 16
	b _0238CB14 @ case 17
	b _0238CB14 @ case 18
	b _0238CB14 @ case 19
	b _0238CB14 @ case 20
	b _0238CB14 @ case 21
	b _0238CB14 @ case 22
	b _0238CB14 @ case 23
	b _0238CB14 @ case 24
	b _0238CB14 @ case 25
	b _0238CB68 @ case 26
	b _0238CB68 @ case 27
	b _0238CB68 @ case 28
	b _0238CB68 @ case 29
	b _0238CB68 @ case 30
	b _0238CB68 @ case 31
	b _0238CB68 @ case 32
	b _0238CB68 @ case 33
	b _0238CB68 @ case 34
	b _0238CB14 @ case 35
	b _0238CB14 @ case 36
	b _0238CB14 @ case 37
	b _0238CB14 @ case 38
	b _0238CB14 @ case 39
	b _0238CB14 @ case 40
	b _0238CB14 @ case 41
_0238CB14:
	ldr r0, _0238CB7C @ =0x038094D0
	ldr r1, [r0, #0x1d4]
	cmp r1, #0
	beq _0238CB34
	mov r0, r4
	mov r1, #3
	bl FUN_0238CB84
	b _0238CB74
_0238CB34:
	ldr r3, _0238CB80 @ =0x038095D0
	mov r1, #1
	str r1, [r0, #0x1d4]
	mov r1, #0
	mov r2, r1
	strh r4, [r3, #0xd8]
	bl FUN_02381964
	cmp r0, #0
	bne _0238CB74
	mov r0, r4
	mov r1, #4
	bl FUN_0238CB84
	b _0238CB74
_0238CB68:
	mov r0, r4
	mov r1, #1
	bl FUN_0238CB84
_0238CB74:
	pop {r4, lr}
	bx lr
	.align 2, 0
_0238CB7C: .4byte 0x038094D0
_0238CB80: .4byte 0x038095D0
	arm_func_end FUN_0238CA48

	arm_func_start FUN_0238CB84
FUN_0238CB84: @ 0x0238CB84
	push {r4, r5, r6, lr}
	lsl r0, r0, #8
	and r0, r0, #0x7f00
	orr r2, r0, #0x8000
	and r0, r1, #0xff
	orr r6, r2, r0
	mov r5, #5
	mov r4, #0
_0238CBA4:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	blt _0238CBA4
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end FUN_0238CB84

	arm_func_start FUN_0238CBC4
FUN_0238CBC4: @ 0x0238CBC4
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r8, _0238D038 @ =0x027FFDE8
	mov r7, #0
	ldr sb, _0238D03C @ =0x038094D0
	mov r6, r7
	mov r5, r7
	mov r4, r7
	mov sl, r7
	mov fp, r7
_0238CBE8:
	mov r0, sb
	add r1, sp, #0
	mov r2, #1
	bl FUN_023819F0
	ldr r0, _0238D040 @ =0x038095D0
	ldrh r0, [r0, #0xd8]
	cmp r0, #0x29
	addls pc, pc, r0, lsl #2
	b _0238D024
_0238CC0C: @ jump table
	b _0238CCB4 @ case 0
	b _0238CCCC @ case 1
	b _0238D024 @ case 2
	b _0238D024 @ case 3
	b _0238D024 @ case 4
	b _0238D024 @ case 5
	b _0238D024 @ case 6
	b _0238D024 @ case 7
	b _0238D024 @ case 8
	b _0238D024 @ case 9
	b _0238D024 @ case 10
	b _0238D024 @ case 11
	b _0238D024 @ case 12
	b _0238D024 @ case 13
	b _0238D024 @ case 14
	b _0238D024 @ case 15
	b _0238CCF4 @ case 16
	b _0238CD14 @ case 17
	b _0238CD34 @ case 18
	b _0238CD54 @ case 19
	b _0238CD90 @ case 20
	b _0238CDCC @ case 21
	b _0238CE08 @ case 22
	b _0238CE28 @ case 23
	b _0238CE48 @ case 24
	b _0238CE68 @ case 25
	b _0238D024 @ case 26
	b _0238D024 @ case 27
	b _0238D024 @ case 28
	b _0238D024 @ case 29
	b _0238D024 @ case 30
	b _0238D024 @ case 31
	b _0238CE88 @ case 32
	b _0238CEA8 @ case 33
	b _0238CED0 @ case 34
	b _0238CEF0 @ case 35
	b _0238CF2C @ case 36
	b _0238CF68 @ case 37
	b _0238CFA4 @ case 38
	b _0238CFC4 @ case 39
	b _0238CFE4 @ case 40
	b _0238D004 @ case 41
_0238CCB4:
	bl FUN_0238D144
	mov r0, #0
	mov r1, r0
	str r0, [sb, #0x1d4]
	bl FUN_0238CB84
	b _0238CBE8
_0238CCCC:
	ldrh r0, [r8]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bl FUN_0238D188
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #1
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CCF4:
	mov r0, r8
	bl FUN_0238D2AC
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x10
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CD14:
	mov r0, r8
	bl FUN_0238D310
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x11
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CD34:
	add r0, r8, #4
	bl FUN_0238D33C
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x12
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CD54:
	add r0, r8, #4
	bl FUN_0238D3A0
	cmp r0, #0
	bne _0238CD78
	mov r0, #0x13
	mov r1, #2
	str r7, [sb, #0x1d4]
	bl FUN_0238CB84
	b _0238CBE8
_0238CD78:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x13
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CD90:
	add r0, r8, #4
	bl FUN_0238D47C
	cmp r0, #0
	bne _0238CDB4
	mov r0, #0x14
	mov r1, #2
	str r6, [sb, #0x1d4]
	bl FUN_0238CB84
	b _0238CBE8
_0238CDB4:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x14
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CDCC:
	add r0, r8, #4
	bl FUN_0238D550
	cmp r0, #0
	bne _0238CDF0
	mov r0, #0x15
	mov r1, #2
	str r5, [sb, #0x1d4]
	bl FUN_0238CB84
	b _0238CBE8
_0238CDF0:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x15
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CE08:
	mov r0, r8
	bl FUN_0238D61C
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x16
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CE28:
	add r0, r8, #2
	bl FUN_0238D680
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x17
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CE48:
	add r0, r8, #4
	bl FUN_0238D6E4
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x18
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CE68:
	add r0, r8, #4
	bl FUN_0238D748
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x19
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CE88:
	mov r0, r8
	bl FUN_0238D2D8
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x20
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CEA8:
	add r0, r8, #4
	bl FUN_0238D33C
	mov r0, r8
	bl FUN_0238D2D8
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x21
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CED0:
	add r0, r8, #4
	bl FUN_0238D368
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x22
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CEF0:
	add r0, r8, #4
	bl FUN_0238D408
	cmp r0, #0
	bne _0238CF14
	mov r0, #0x23
	mov r1, #2
	str r4, [sb, #0x1d4]
	bl FUN_0238CB84
	b _0238CBE8
_0238CF14:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x23
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CF2C:
	add r0, r8, #4
	bl FUN_0238D4E0
	cmp r0, #0
	bne _0238CF50
	mov r0, #0x24
	mov r1, #2
	str sl, [sb, #0x1d4]
	bl FUN_0238CB84
	b _0238CBE8
_0238CF50:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x24
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CF68:
	add r0, r8, #4
	bl FUN_0238D5B0
	cmp r0, #0
	bne _0238CF8C
	mov r0, #0x25
	mov r1, #2
	str fp, [sb, #0x1d4]
	bl FUN_0238CB84
	b _0238CBE8
_0238CF8C:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x25
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CFA4:
	mov r0, r8
	bl FUN_0238D648
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x26
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CFC4:
	add r0, r8, #2
	bl FUN_0238D6AC
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x27
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238CFE4:
	add r0, r8, #4
	bl FUN_0238D710
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x28
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238D004:
	add r0, r8, #4
	bl FUN_0238D774
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x29
	mov r1, #0
	bl FUN_0238CB84
	b _0238CBE8
_0238D024:
	mov r1, #0
	str r1, [sb, #0x1d4]
	mov r1, #1
	bl FUN_0238CB84
	b _0238CBE8
	.align 2, 0
_0238D038: .4byte 0x027FFDE8
_0238D03C: .4byte 0x038094D0
_0238D040: .4byte 0x038095D0
	arm_func_end FUN_0238CBC4

	arm_func_start FUN_0238D044
FUN_0238D044: @ 0x0238D044
	push {r3, r4, lr}
	sub sp, sp, #4
	add r0, sp, #2
	bl FUN_0238D61C
	ldrh r0, [sp, #2]
	lsl r1, r0, #0x1b
	lsrs r1, r1, #0x1f
	bne _0238D070
	lsl r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	beq _0238D0C8
_0238D070:
	add r0, sp, #0
	bl FUN_0238D680
	ldrh r0, [sp, #2]
	mov r4, #0
	lsl r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	ldrhne r0, [sp]
	orrne r4, r4, #1
	bicne r0, r0, #0xf
	strhne r0, [sp]
	ldrh r0, [sp, #2]
	lsl r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	ldrhne r0, [sp]
	orrne r4, r4, #2
	bicne r0, r0, #0x40
	strhne r0, [sp]
	add r0, sp, #0
	bl FUN_0238D6AC
	mov r1, r4
	mov r0, #0x30
	bl FUN_0238CB84
_0238D0C8:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_0238D044

	arm_func_start FUN_0238D0D4
FUN_0238D0D4: @ 0x0238D0D4
	push {r4, lr}
	mov ip, #0
	mov r2, ip
	b _0238D100
_0238D0E4:
	lsl r1, r2, #2
	lsr r1, r0, r1
	and r1, r1, #0xf
	cmp r1, #0xa
	movhs r0, #0
	bhs _0238D13C
	add r2, r2, #1
_0238D100:
	cmp r2, #8
	blt _0238D0E4
	mov r4, #0
	mov lr, #1
	mov r2, #0xa
_0238D114:
	lsl r1, r4, #2
	lsr r1, r0, r1
	and r3, r1, #0xf
	mul r1, lr, r2
	mla ip, lr, r3, ip
	add r4, r4, #1
	mov lr, r1
	cmp r4, #8
	blt _0238D114
	mov r0, ip
_0238D13C:
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D0D4

	arm_func_start FUN_0238D144
FUN_0238D144: @ 0x0238D144
	push {r3, lr}
	mov r0, #0x8000
	bl FUN_023837A8
	ldrh r0, [sp]
	bic r0, r0, #1
	orr r0, r0, #1
	strh r0, [sp]
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0
	bl FUN_0238DA9C
	add r0, sp, #0
	mov r1, #1
	bl FUN_0238DB0C
	bl FUN_0238DA68
	pop {r3, lr}
	bx lr
	arm_func_end FUN_0238D144

	arm_func_start FUN_0238D188
FUN_0238D188: @ 0x0238D188
	push {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	and r4, r4, #1
	cmp r4, #1
	bne _0238D2A0
	mov r0, #0x8000
	bl FUN_023837A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0
	mov r3, #1
	bl FUN_0238D9CC
	ldrh r0, [sp]
	lsl r1, r0, #0x1e
	lsr r1, r1, #0x1f
	cmp r1, r4
	beq _0238D2A0
	bic r1, r0, #2
	lsl r0, r4, #0x1f
	orr r1, r1, r0, lsr #30
	mov r0, #0x8000
	strh r1, [sp]
	bl FUN_023837A8
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0
	bl FUN_0238DA9C
	add r0, sp, #0
	mov r1, #1
	bl FUN_0238DB0C
	bl FUN_0238DA68
	mov r0, #0x86
	mov r1, #0x10
	add r2, sp, #4
	mov r3, #3
	bl FUN_0238D9CC
	cmp r4, #0
	add r0, sp, #4
	bne _0238D230
	bl FUN_0238D7AC
	b _0238D234
_0238D230:
	bl FUN_0238D8BC
_0238D234:
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0x10
	bl FUN_0238DA9C
	add r0, sp, #4
	mov r1, #3
	bl FUN_0238DB0C
	bl FUN_0238DA68
	mov r0, #0x86
	mov r1, #0x50
	add r2, sp, #4
	mov r3, #3
	bl FUN_0238D9CC
	cmp r4, #0
	add r0, sp, #4
	bne _0238D27C
	bl FUN_0238D7AC
	b _0238D280
_0238D27C:
	bl FUN_0238D8BC
_0238D280:
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0x50
	bl FUN_0238DA9C
	add r0, sp, #4
	mov r1, #3
	bl FUN_0238DB0C
	bl FUN_0238DA68
_0238D2A0:
	add sp, sp, #8
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D188

	arm_func_start FUN_0238D2AC
FUN_0238D2AC: @ 0x0238D2AC
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x20
	mov r3, #7
	bl FUN_0238D9CC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D2AC

	arm_func_start FUN_0238D2D8
FUN_0238D2D8: @ 0x0238D2D8
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0x20
	bl FUN_0238DA9C
	mov r0, r4
	mov r1, #7
	bl FUN_0238DB0C
	bl FUN_0238DA68
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D2D8

	arm_func_start FUN_0238D310
FUN_0238D310: @ 0x0238D310
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x20
	mov r3, #4
	bl FUN_0238D9CC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D310

	arm_func_start FUN_0238D33C
FUN_0238D33C: @ 0x0238D33C
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x60
	mov r3, #3
	bl FUN_0238D9CC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D33C

	arm_func_start FUN_0238D368
FUN_0238D368: @ 0x0238D368
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0x60
	bl FUN_0238DA9C
	mov r0, r4
	mov r1, #3
	bl FUN_0238DB0C
	bl FUN_0238DA68
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D368

	arm_func_start FUN_0238D3A0
FUN_0238D3A0: @ 0x0238D3A0
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_0238D9CC
	ldrh r0, [sp]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	and r0, r0, #0xb
	cmp r0, #1
	movne r0, #0
	bne _0238D3FC
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x10
	mov r3, #1
	bl FUN_0238D9CC
	mov r0, #1
_0238D3FC:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_0238D3A0

	arm_func_start FUN_0238D408
FUN_0238D408: @ 0x0238D408
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_0238D9CC
	ldrh r0, [sp]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	and r0, r0, #0xb
	cmp r0, #1
	movne r0, #0
	bne _0238D470
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0x10
	bl FUN_0238DA9C
	mov r0, r4
	mov r1, #1
	bl FUN_0238DB0C
	bl FUN_0238DA68
	mov r0, #1
_0238D470:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_0238D408

	arm_func_start FUN_0238D47C
FUN_0238D47C: @ 0x0238D47C
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_0238D9CC
	ldrh r0, [sp]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #4
	movne r0, #0
	bne _0238D4D4
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x10
	mov r3, #3
	bl FUN_0238D9CC
	mov r0, #1
_0238D4D4:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_0238D47C

	arm_func_start FUN_0238D4E0
FUN_0238D4E0: @ 0x0238D4E0
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_0238D9CC
	ldrh r0, [sp]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #4
	movne r0, #0
	bne _0238D544
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0x10
	bl FUN_0238DA9C
	mov r0, r4
	mov r1, #3
	bl FUN_0238DB0C
	bl FUN_0238DA68
	mov r0, #1
_0238D544:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_0238D4E0

	arm_func_start FUN_0238D550
FUN_0238D550: @ 0x0238D550
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_0238D9CC
	ldrh r0, [sp]
	lsl r0, r0, #0x19
	lsrs r0, r0, #0x1f
	moveq r0, #0
	beq _0238D5A4
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x50
	mov r3, #3
	bl FUN_0238D9CC
	mov r0, #1
_0238D5A4:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_0238D550

	arm_func_start FUN_0238D5B0
FUN_0238D5B0: @ 0x0238D5B0
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_0238D9CC
	ldrh r0, [sp]
	lsl r0, r0, #0x19
	lsrs r0, r0, #0x1f
	moveq r0, #0
	beq _0238D610
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0x50
	bl FUN_0238DA9C
	mov r0, r4
	mov r1, #3
	bl FUN_0238DB0C
	bl FUN_0238DA68
	mov r0, #1
_0238D610:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_0238D5B0

	arm_func_start FUN_0238D61C
FUN_0238D61C: @ 0x0238D61C
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0
	mov r3, #1
	bl FUN_0238D9CC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D61C

	arm_func_start FUN_0238D648
FUN_0238D648: @ 0x0238D648
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0
	bl FUN_0238DA9C
	mov r0, r4
	mov r1, #1
	bl FUN_0238DB0C
	bl FUN_0238DA68
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D648

	arm_func_start FUN_0238D680
FUN_0238D680: @ 0x0238D680
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_0238D9CC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D680

	arm_func_start FUN_0238D6AC
FUN_0238D6AC: @ 0x0238D6AC
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0x40
	bl FUN_0238DA9C
	mov r0, r4
	mov r1, #1
	bl FUN_0238DB0C
	bl FUN_0238DA68
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D6AC

	arm_func_start FUN_0238D6E4
FUN_0238D6E4: @ 0x0238D6E4
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x30
	mov r3, #1
	bl FUN_0238D9CC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D6E4

	arm_func_start FUN_0238D710
FUN_0238D710: @ 0x0238D710
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0x30
	bl FUN_0238DA9C
	mov r0, r4
	mov r1, #1
	bl FUN_0238DB0C
	bl FUN_0238DA68
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D710

	arm_func_start FUN_0238D748
FUN_0238D748: @ 0x0238D748
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x70
	mov r3, #1
	bl FUN_0238D9CC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D748

	arm_func_start FUN_0238D774
FUN_0238D774: @ 0x0238D774
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_023837A8
	bl FUN_0238DA28
	mov r0, #6
	mov r1, #0x70
	bl FUN_0238DA9C
	mov r0, r4
	mov r1, #1
	bl FUN_0238DB0C
	bl FUN_0238DA68
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0238D774

	arm_func_start FUN_0238D7AC
FUN_0238D7AC: @ 0x0238D7AC
	ldr r1, [r0]
	lsl r2, r1, #0x12
	lsr r2, r2, #0x1a
	cmp r2, #0x23
	addls pc, pc, r2, lsl #2
	b _0238D8A8
_0238D7C4: @ jump table
	b _0238D854 @ case 0
	b _0238D854 @ case 1
	b _0238D854 @ case 2
	b _0238D854 @ case 3
	b _0238D854 @ case 4
	b _0238D854 @ case 5
	b _0238D854 @ case 6
	b _0238D854 @ case 7
	b _0238D854 @ case 8
	b _0238D854 @ case 9
	b _0238D8A8 @ case 10
	b _0238D8A8 @ case 11
	b _0238D8A8 @ case 12
	b _0238D8A8 @ case 13
	b _0238D8A8 @ case 14
	b _0238D8A8 @ case 15
	b _0238D854 @ case 16
	b _0238D854 @ case 17
	b _0238D860 @ case 18
	b _0238D860 @ case 19
	b _0238D860 @ case 20
	b _0238D860 @ case 21
	b _0238D860 @ case 22
	b _0238D860 @ case 23
	b _0238D860 @ case 24
	b _0238D860 @ case 25
	b _0238D8A8 @ case 26
	b _0238D8A8 @ case 27
	b _0238D8A8 @ case 28
	b _0238D8A8 @ case 29
	b _0238D8A8 @ case 30
	b _0238D8A8 @ case 31
	b _0238D884 @ case 32
	b _0238D884 @ case 33
	b _0238D860 @ case 34
	b _0238D860 @ case 35
_0238D854:
	bic r1, r1, #0x4000
	str r1, [r0]
	bx lr
_0238D860:
	orr r2, r1, #0x4000
	lsl r1, r2, #0x12
	lsr r1, r1, #0x1a
	sub r1, r1, #0x12
	bic r2, r2, #0x3f00
	lsl r1, r1, #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_0238D884:
	orr r2, r1, #0x4000
	lsl r1, r2, #0x12
	lsr r1, r1, #0x1a
	sub r1, r1, #0x18
	bic r2, r2, #0x3f00
	lsl r1, r1, #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_0238D8A8:
	ldr r1, [r0]
	bic r1, r1, #0x4000
	bic r1, r1, #0x3f00
	str r1, [r0]
	bx lr
	arm_func_end FUN_0238D7AC

	arm_func_start FUN_0238D8BC
FUN_0238D8BC: @ 0x0238D8BC
	ldr r2, [r0]
	lsl r1, r2, #0x12
	lsr r3, r1, #0x1a
	cmp r3, #0x23
	addls pc, pc, r3, lsl #2
	b _0238D9B8
_0238D8D4: @ jump table
	b _0238D964 @ case 0
	b _0238D964 @ case 1
	b _0238D964 @ case 2
	b _0238D964 @ case 3
	b _0238D964 @ case 4
	b _0238D964 @ case 5
	b _0238D964 @ case 6
	b _0238D964 @ case 7
	b _0238D988 @ case 8
	b _0238D988 @ case 9
	b _0238D9B8 @ case 10
	b _0238D9B8 @ case 11
	b _0238D9B8 @ case 12
	b _0238D9B8 @ case 13
	b _0238D9B8 @ case 14
	b _0238D9B8 @ case 15
	b _0238D964 @ case 16
	b _0238D964 @ case 17
	b _0238D9AC @ case 18
	b _0238D9AC @ case 19
	b _0238D9AC @ case 20
	b _0238D9AC @ case 21
	b _0238D9AC @ case 22
	b _0238D9AC @ case 23
	b _0238D9AC @ case 24
	b _0238D9AC @ case 25
	b _0238D9B8 @ case 26
	b _0238D9B8 @ case 27
	b _0238D9B8 @ case 28
	b _0238D9B8 @ case 29
	b _0238D9B8 @ case 30
	b _0238D9B8 @ case 31
	b _0238D9AC @ case 32
	b _0238D9AC @ case 33
	b _0238D9AC @ case 34
	b _0238D9AC @ case 35
_0238D964:
	lsl r1, r2, #0x11
	lsrs r1, r1, #0x1f
	bxeq lr
	add r1, r3, #0x12
	bic r2, r2, #0x3f00
	lsl r1, r1, #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_0238D988:
	lsl r1, r2, #0x11
	lsrs r1, r1, #0x1f
	bxeq lr
	add r1, r3, #0x18
	bic r2, r2, #0x3f00
	lsl r1, r1, #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_0238D9AC:
	orr r1, r2, #0x4000
	str r1, [r0]
	bx lr
_0238D9B8:
	ldr r1, [r0]
	bic r1, r1, #0x4000
	bic r1, r1, #0x3f00
	str r1, [r0]
	bx lr
	arm_func_end FUN_0238D8BC

	arm_func_start FUN_0238D9CC
FUN_0238D9CC: @ 0x0238D9CC
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl FUN_0238DA28
	mov r0, r7
	mov r1, r6
	bl FUN_0238DA9C
	cmp r7, #6
	beq _0238DA10
	cmp r7, #0x86
	bne _0238DA1C
	mov r0, r5
	mov r1, r4
	bl FUN_0238DB9C
	b _0238DA1C
_0238DA10:
	mov r0, r5
	mov r1, r4
	bl FUN_0238DB0C
_0238DA1C:
	bl FUN_0238DA68
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_0238D9CC

	arm_func_start FUN_0238DA28
FUN_0238DA28: @ 0x0238DA28
	mov ip, #0x4000000
	add ip, ip, #0x138
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x72
	strh r0, [ip]
	mov r3, #2
_0238DA44:
	subs r3, r3, #1
	bne _0238DA44
	bic r0, r0, #4
	orr r0, r0, #4
	strh r0, [ip]
	mov r3, #2
_0238DA5C:
	subs r3, r3, #1
	bne _0238DA5C
	bx lr
	arm_func_end FUN_0238DA28

	arm_func_start FUN_0238DA68
FUN_0238DA68: @ 0x0238DA68
	mov ip, #0x4000000
	add ip, ip, #0x138
	mov r3, #2
_0238DA74:
	subs r3, r3, #1
	bne _0238DA74
	ldrh r0, [ip]
	bic r0, r0, #4
	orr r0, r0, #0
	strh r0, [ip]
	mov r3, #2
_0238DA90:
	subs r3, r3, #1
	bne _0238DA90
	bx lr
	arm_func_end FUN_0238DA68

	arm_func_start FUN_0238DA9C
FUN_0238DA9C: @ 0x0238DA9C
	mov ip, #0x4000000
	add ip, ip, #0x138
	orr r1, r0, r1
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x74
	mov r2, #0
_0238DAB8:
	bic r0, r0, #3
	orr r0, r0, #0
	mov r3, #1
	tst r3, r1, lsr r2
	movne r3, #1
	moveq r3, #0
	orr r0, r0, r3
	strh r0, [ip]
	mov r3, #9
_0238DADC:
	subs r3, r3, #1
	bne _0238DADC
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_0238DAF4:
	subs r3, r3, #1
	bne _0238DAF4
	add r2, r2, #1
	cmp r2, #8
	bne _0238DAB8
	bx lr
	arm_func_end FUN_0238DA9C

	arm_func_start FUN_0238DB0C
FUN_0238DB0C: @ 0x0238DB0C
	mov ip, #0x4000000
	add ip, ip, #0x138
_0238DB14:
	push {r0, r1}
	tst r0, #1
	ldrheq r1, [r0]
	ldrhne r1, [r0, #-1]
	lsrne r1, r1, #8
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x74
	mov r2, #0
_0238DB38:
	bic r0, r0, #3
	orr r0, r0, #0
	mov r3, #1
	tst r3, r1, lsr r2
	movne r3, #1
	moveq r3, #0
	orr r0, r0, r3
	strh r0, [ip]
	mov r3, #9
_0238DB5C:
	subs r3, r3, #1
	bne _0238DB5C
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_0238DB74:
	subs r3, r3, #1
	bne _0238DB74
	add r2, r2, #1
	cmp r2, #8
	bne _0238DB38
	pop {r0, r1}
	add r0, r0, #1
	subs r1, r1, #1
	bne _0238DB14
	bx lr
	arm_func_end FUN_0238DB0C

	arm_func_start FUN_0238DB9C
FUN_0238DB9C: @ 0x0238DB9C
	mov ip, #0x4000000
	add ip, ip, #0x138
_0238DBA4:
	push {r0, r1}
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x64
	mov r2, #0
	mov r1, #0
_0238DBBC:
	bic r0, r0, #3
	orr r0, r0, #0
	strh r0, [ip]
	mov r3, #9
_0238DBCC:
	subs r3, r3, #1
	bne _0238DBCC
	ldrh r0, [ip]
	and r3, r0, #1
	cmp r3, #1
	moveq r3, #0x80
	movne r3, #0
	orr r2, r3, r2, lsr #1
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_0238DBFC:
	subs r3, r3, #1
	bne _0238DBFC
	add r1, r1, #1
	cmp r1, #8
	bne _0238DBBC
	pop {r0, r1}
	tst r0, #1
	beq _0238DC34
	ldrh r3, [r0, #-1]
	bic r3, r3, #0xff00
	lsl r2, r2, #8
	orr r3, r2, r3
	strh r3, [r0, #-1]
	b _0238DC44
_0238DC34:
	ldrh r3, [r0]
	bic r3, r3, #0xff
	orr r3, r3, r2
	strh r3, [r0]
_0238DC44:
	add r0, r0, #1
	subs r1, r1, #1
	bne _0238DBA4
	bx lr
	arm_func_end FUN_0238DB9C

	arm_func_start FUN_0238DC54
FUN_0238DC54: @ 0x0238DC54
	push {r3, lr}
	ldr r3, _0238DC98 @ =0x03809884
	mov ip, #1
	str r0, [r3, #8]
	ldr r0, _0238DC9C @ =0x03809894
	mov r1, #0
	mov r2, #0xa4
	strb ip, [r3]
	bl FUN_023832E8
	ldr r1, _0238DCA0 @ =0x03805BC8
	mov r0, #0xf
	bl FUN_0238359C
	ldr r1, _0238DCA4 @ =0x03805B18
	mov r0, #0xa
	bl FUN_0238359C
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238DC98: .4byte 0x03809884
_0238DC9C: .4byte 0x03809894
_0238DCA0: .4byte 0x03805BC8
_0238DCA4: .4byte 0x03805B18
	arm_func_end FUN_0238DC54

	arm_func_start FUN_0238DCA8
FUN_0238DCA8: @ 0x0238DCA8
	push {r3, lr}
	ldr r2, _0238DCD4 @ =0x04000304
	mov r0, #1
	ldrh r1, [r2]
	bic r1, r1, #2
	strh r1, [r2]
	bl FUN_0238A528
	mov r0, #1
	bl FUN_0238A1C0
	pop {r3, lr}
	bx lr
	.align 2, 0
_0238DCD4: .4byte 0x04000304
	arm_func_end FUN_0238DCA8

	arm_func_start FUN_0238DCD8
FUN_0238DCD8: @ 0x0238DCD8
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x50
	str r0, [sp, #0x44]
	ldr r0, _0238DD70 @ =0x0380A4F8
	mov sb, #4
	mov r7, #8
	mov r4, #3
	ldr r1, _0238DD74 @ =0x0380A4F8
	ldr r6, _0238DD78 @ =0x03809938
	mov sl, #0x600
	mov r8, #0
	mov r5, #0x1c0
	mov lr, #0x40
	mov ip, #5
	mov r3, #7
	mov r2, #9
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	add r0, sp, #0x1c
	add r1, sp, #0
	str sl, [sp, #0x24]
	str sb, [sp, #0x28]
	str r8, [sp, #0x3c]
	str r7, [sp, #0x40]
	str r6, [sp, #0x48]
	str r5, [sp, #0x4c]
	str r4, [sp]
	str lr, [sp, #0x38]
	str r4, [sp, #8]
	str sb, [sp, #0x18]
	str ip, [sp, #0x10]
	str r3, [sp, #4]
	str r7, [sp, #0x14]
	str r2, [sp, #0xc]
	bl FUN_0238DD7C
	add sp, sp, #0x50
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0238DD70: .4byte 0x0380A4F8
_0238DD74: .4byte 0x0380A4F8
_0238DD78: .4byte 0x03809938
	arm_func_end FUN_0238DCD8

	arm_func_start FUN_0238DD7C
FUN_0238DD7C: @ 0x0238DD7C
	ldr pc, _0238DD80 @ =0x06000000
	.align 2, 0
_0238DD80: .4byte 0x06000000
	arm_func_end FUN_0238DD7C

	arm_func_start FUN_0238DD84
FUN_0238DD84: @ 0x0238DD84
	push {r4, r5, r6, lr}
	movs r6, r1
	ldrh r4, [r6]
	beq _0238DDCC
	mov r0, #0
	mov r2, #0x100
	bl FUN_02383238
	strh r4, [r6]
	mov r0, #4
	strh r0, [r6, #2]
	mov r5, #0xa
	mov r4, #0
_0238DDB4:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	blt _0238DDB4
_0238DDCC:
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end FUN_0238DD84

	arm_func_start FUN_0238DDD4
FUN_0238DDD4: @ 0x0238DDD4
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r1, _0238DE30 @ =0x03806C40
	ldr r1, [r1, #8]
	b _0238DE20
_0238DDEC:
	cmp r1, r0
	bne _0238DE1C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	cmpne r0, #1
	beq _0238DE0C
	cmp r0, #2
	b _0238DE14
_0238DE0C:
	mov r0, #1
	bx lr
_0238DE14:
	mov r0, #0
	bx lr
_0238DE1C:
	ldr r1, [r1, #0x4c]
_0238DE20:
	cmp r1, #0
	bne _0238DDEC
	mov r0, #0
	bx lr
	.align 2, 0
_0238DE30: .4byte 0x03806C40
	arm_func_end FUN_0238DDD4

	arm_func_start FUN_0238DE34
FUN_0238DE34: @ 0x0238DE34
	push {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r1
	cmp r4, #0x10000
	beq _0238DE54
	cmp r4, #0x20000
	beq _0238DEEC
	b _0238DF90
_0238DE54:
	bl FUN_02382F90
	mov r5, r0
	ldr r0, _0238DFC0 @ =0x03809894
	bl FUN_0238DDD4
	cmp r0, #0
	beq _0238DE7C
	mov r0, r5
	bl FUN_02382FA4
	mov r0, #0
	b _0238DEDC
_0238DE7C:
	ldr r1, _0238DFC4 @ =0x03809884
	ldrb r0, [r1]
	cmp r0, #1
	beq _0238DE9C
	mov r0, r5
	bl FUN_02382FA4
	mov r0, #0
	b _0238DEDC
_0238DE9C:
	mov r2, #2
	mov r0, r5
	strb r2, [r1]
	bl FUN_02382FA4
	mov r2, #0x400
	ldr r0, _0238DFC0 @ =0x03809894
	ldr r1, _0238DFC8 @ =0x03805D6C
	ldr r3, _0238DFCC @ =0x03809EF8
	str r2, [sp]
	mov r5, #0xa
	mov r2, #0
	str r5, [sp, #4]
	bl FUN_023812C0
	ldr r0, _0238DFC0 @ =0x03809894
	bl FUN_02381620
	mov r0, #1
_0238DEDC:
	cmp r0, #0
	bne _0238DFB4
	orr r6, r4, #5
	b _0238DF94
_0238DEEC:
	bl FUN_02382F90
	mov r5, r0
	ldr r0, _0238DFC0 @ =0x03809894
	bl FUN_0238DDD4
	cmp r0, #0
	beq _0238DF14
	mov r0, r5
	bl FUN_02382FA4
	mov r0, #0
	b _0238DF80
_0238DF14:
	ldr r1, _0238DFC4 @ =0x03809884
	ldrb r0, [r1]
	cmp r0, #3
	beq _0238DF34
	mov r0, r5
	bl FUN_02382FA4
	mov r0, #0
	b _0238DF80
_0238DF34:
	mov r2, #4
	mov r0, r5
	strb r2, [r1]
	bl FUN_02382FA4
	ldr r1, _0238DFD0 @ =0x03805B18
	mov r0, #0xa
	bl FUN_0238359C
	mov r2, #0x400
	ldr r0, _0238DFC0 @ =0x03809894
	ldr r1, _0238DFD4 @ =0x03805DDC
	ldr r3, _0238DFCC @ =0x03809EF8
	str r2, [sp]
	mov r5, #2
	mov r2, #0
	str r5, [sp, #4]
	bl FUN_023812C0
	ldr r0, _0238DFC0 @ =0x03809894
	bl FUN_02381620
	mov r0, #1
_0238DF80:
	cmp r0, #0
	bne _0238DFB4
	orr r6, r4, #5
	b _0238DF94
_0238DF90:
	orr r6, r4, #7
_0238DF94:
	mov r5, #0xf
	mov r4, #0
_0238DF9C:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	blt _0238DF9C
_0238DFB4:
	add sp, sp, #8
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0238DFC0: .4byte 0x03809894
_0238DFC4: .4byte 0x03809884
_0238DFC8: .4byte 0x03805D6C
_0238DFCC: .4byte 0x03809EF8
_0238DFD0: .4byte 0x03805B18
_0238DFD4: .4byte 0x03805DDC
	arm_func_end FUN_0238DE34

	arm_func_start FUN_0238DFD8
FUN_0238DFD8: @ 0x0238DFD8
	push {r4, r5, r6, lr}
	ldr r1, _0238E044 @ =0x03809884
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _0238DFF8
	ldr r2, [r1, #0xc]
	mov r1, #0x6000000
	bl FUN_023832B0
_0238DFF8:
	ldr r0, _0238E044 @ =0x03809884
	ldr r0, [r0, #8]
	bl FUN_0238DCD8
	mov r6, #0xf
	mov r5, #0x10000
	mov r4, #0
_0238E010:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	blt _0238E010
	bl FUN_02382F90
	ldr r0, _0238E044 @ =0x03809884
	mov r1, #3
	strb r1, [r0]
	bl FUN_023813C8
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0238E044: .4byte 0x03809884
	arm_func_end FUN_0238DFD8

	arm_func_start FUN_0238E048
FUN_0238E048: @ 0x0238E048
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _0238E248 @ =0x060198A4
	ldr sl, _0238E24C @ =0x060188A4
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	addne r0, sl, #0x1000
	ldrne r0, [r0, #0x54c]
	ldrne r0, [r0]
	ldrhne r0, [r0]
	cmpne r0, #0
	beq _0238E07C
	bl FUN_0238E254
	bl FUN_0238E25C
_0238E07C:
	mov r6, #0
	add sb, sp, #0
	add r4, sl, #0x1000
	mov fp, #0x100
	mov r5, #4
	mov r8, r6
_0238E094:
	mov r1, sb
	mov r2, r8
	add r0, sl, #0x88
	bl FUN_023819F0
	cmp r0, #0
	beq _0238E0FC
	ldr r0, [r4, #0x54c]
	cmp r0, #0
	beq _0238E094
	bl FUN_0238EB80
	mov r7, r0
	mov r0, r6
	mov r1, r7
	mov r2, fp
	bl FUN_02383238
	ldr r1, [sp]
	mov r0, r7
	ldrh r1, [r1]
	strh r1, [r7]
	strh r5, [r7, #2]
	bl FUN_0238EB34
	ldr r1, [sp]
	ldrh r0, [r1]
	orr r0, r0, #0x8000
	strh r0, [r1]
	b _0238E094
_0238E0FC:
	bl FUN_0238E264
	bl FUN_0238DDD4
	cmp r0, #0
	beq _0238E124
	add r0, sl, #0x88
	mov r1, #0
	mov r2, #1
	bl FUN_02381964
	bl FUN_0238E264
	bl FUN_023814FC
_0238E124:
	add r1, sp, #0
	add r0, sl, #0x88
	mov r2, #0
	bl FUN_023819F0
	mov r5, r0
	add r1, sp, #0
	add r0, sl, #0x58
	mov r2, #0
	bl FUN_023819F0
	mov r4, r0
	add r1, sp, #0
	mov r0, sl
	mov r2, #0
	bl FUN_023819F0
	orr r1, r5, r4
	orrs r0, r0, r1
	beq _0238E16C
	bl FUN_02383100
_0238E16C:
	bl FUN_0238E26C
	add r5, sp, #0
	mov r4, #0
_0238E178:
	mov r1, r5
	mov r2, r4
	add r0, sl, #0x28
	bl FUN_023819F0
	cmp r0, #0
	bne _0238E178
	bl FUN_0238E274
	bl FUN_0238DDD4
	cmp r0, #0
	beq _0238E1B8
	add r0, sl, #0x28
	mov r1, #0
	mov r2, #1
	bl FUN_02381964
	bl FUN_0238E274
	bl FUN_023814FC
_0238E1B8:
	mov r0, #1
	bl FUN_0238A528
	mov r0, #1
	bl FUN_0238A1C0
	add r0, sl, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	ldrne r1, [r0]
	ldrhne r0, [r1]
	cmpne r0, #0
	movne r0, #0
	strhne r0, [r1]
	ldr r0, _0238E250 @ =0x03809884
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0238E208
	ldr r2, [r0, #0xc]
	mov r0, #0
	mov r1, #0x6000000
	bl FUN_02383264
_0238E208:
	mov r6, #0xf
	mov r5, #0x20000
	mov r4, #0
_0238E214:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	blt _0238E214
	bl FUN_02382F90
	ldr r0, _0238E250 @ =0x03809884
	mov r1, #1
	strb r1, [r0]
	bl FUN_023813C8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0238E248: .4byte 0x060198A4
_0238E24C: .4byte 0x060188A4
_0238E250: .4byte 0x03809884
	arm_func_end FUN_0238E048

	arm_func_start FUN_0238E254
FUN_0238E254: @ 0x0238E254
	ldr pc, _0238E258 @ =0x06005CEC
	.align 2, 0
_0238E258: .4byte 0x06005CEC
	arm_func_end FUN_0238E254

	arm_func_start FUN_0238E25C
FUN_0238E25C: @ 0x0238E25C
	ldr pc, _0238E260 @ =0x06001DEC
	.align 2, 0
_0238E260: .4byte 0x06001DEC
	arm_func_end FUN_0238E25C

	arm_func_start FUN_0238E264
FUN_0238E264: @ 0x0238E264
	ldr pc, _0238E268 @ =0x060007A8
	.align 2, 0
_0238E268: .4byte 0x060007A8
	arm_func_end FUN_0238E264

	arm_func_start FUN_0238E26C
FUN_0238E26C: @ 0x0238E26C
	ldr pc, _0238E270 @ =0x06008D54
	.align 2, 0
_0238E270: .4byte 0x06008D54
	arm_func_end FUN_0238E26C

	arm_func_start FUN_0238E274
FUN_0238E274: @ 0x0238E274
	ldr pc, _0238E278 @ =0x060007B4
	.align 2, 0
_0238E278: .4byte 0x060007B4
	arm_func_end FUN_0238E274

	arm_func_start FUN_0238E27C
FUN_0238E27C: @ 0x0238E27C
	ldr r1, _0238E2B4 @ =0x55555555
	ldr r2, _0238E2B8 @ =0x33333333
	and r1, r1, r0, lsr #1
	sub r1, r0, r1
	ldr r0, _0238E2BC @ =0x0F0F0F0F
	and r3, r1, r2
	and r1, r2, r1, lsr #2
	add r1, r3, r1
	add r1, r1, r1, lsr #4
	and r0, r1, r0
	add r0, r0, r0, lsr #8
	add r0, r0, r0, lsr #16
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0238E2B4: .4byte 0x55555555
_0238E2B8: .4byte 0x33333333
_0238E2BC: .4byte 0x0F0F0F0F
	arm_func_end FUN_0238E27C

	arm_func_start FUN_0238E2C0
FUN_0238E2C0: @ 0x0238E2C0
	push {r4, r5, r6, r7, fp, ip, lr}
	mov r4, r1
	orr r4, r4, #1
	b _0238E2E0
	arm_func_end FUN_0238E2C0

	arm_func_start FUN_0238E2D0
FUN_0238E2D0: @ 0x0238E2D0
	push {r4, r5, r6, r7, fp, ip, lr}
	eor r4, r1, r3
	asr r4, r4, #1
	lsl r4, r4, #1
_0238E2E0:
	orrs r5, r3, r2
	bne _0238E2F0
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0238E2F0:
	lsr r5, r0, #0x1f
	add r5, r5, r1
	lsr r6, r2, #0x1f
	add r6, r6, r3
	orrs r6, r5, r6
	bne _0238E324
	mov r1, r2
	bl FUN_0238E4C8
	ands r4, r4, #1
	movne r0, r1
	asr r1, r0, #0x1f
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0238E324:
	cmp r1, #0
	bge _0238E334
	rsbs r0, r0, #0
	rsc r1, r1, #0
_0238E334:
	cmp r3, #0
	bge _0238E344
	rsbs r2, r2, #0
	rsc r3, r3, #0
_0238E344:
	orrs r5, r1, r0
	beq _0238E468
	mov r5, #0
	mov r6, #1
	cmp r3, #0
	bmi _0238E370
_0238E35C:
	add r5, r5, #1
	adds r2, r2, r2
	adcs r3, r3, r3
	bpl _0238E35C
	add r6, r6, r5
_0238E370:
	cmp r1, #0
	blt _0238E390
_0238E378:
	cmp r6, #1
	beq _0238E390
	sub r6, r6, #1
	adds r0, r0, r0
	adcs r1, r1, r1
	bpl _0238E378
_0238E390:
	mov r7, #0
	mov ip, #0
	mov fp, #0
	b _0238E3B8
_0238E3A0:
	orr ip, ip, #1
	subs r6, r6, #1
	beq _0238E410
	adds r0, r0, r0
	adcs r1, r1, r1
	adcs r7, r7, r7
_0238E3B8:
	subs r0, r0, r2
	sbcs r1, r1, r3
	sbcs r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _0238E3A0
_0238E3D4:
	subs r6, r6, #1
	beq _0238E408
	adds r0, r0, r0
	adcs r1, r1, r1
	adc r7, r7, r7
	adds r0, r0, r2
	adcs r1, r1, r3
	adc r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _0238E3A0
	b _0238E3D4
_0238E408:
	adds r0, r0, r2
	adc r1, r1, r3
_0238E410:
	ands r7, r4, #1
	moveq r0, ip
	moveq r1, fp
	beq _0238E448
	subs r7, r5, #0x20
	lsrge r0, r1, r7
	bge _0238E46C
	rsb r7, r5, #0x20
	lsr r0, r0, r5
	orr r0, r0, r1, lsl r7
	lsr r1, r1, r5
	b _0238E448
	arm_func_end FUN_0238E2D0

	arm_func_start FUN_0238E440
FUN_0238E440: @ 0x0238E440
	lsr r0, r1, r7
	mov r1, #0
_0238E448:
	cmp r4, #0
	blt _0238E458
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0238E458:
	rsbs r0, r0, #0
	rsc r1, r1, #0
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0238E468:
	mov r0, #0
_0238E46C:
	mov r1, #0
	cmp r4, #0
	blt _0238E458
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
	arm_func_end FUN_0238E440

	arm_func_start FUN_0238E480
FUN_0238E480: @ 0x0238E480
	push {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #0
	b _0238E494
	arm_func_end FUN_0238E480

	arm_func_start FUN_0238E48C
FUN_0238E48C: @ 0x0238E48C
	push {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #1
_0238E494:
	orrs r5, r3, r2
	bne _0238E4A4
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0238E4A4:
	orrs r5, r1, r3
	bne _0238E344
	mov r1, r2
	bl FUN_0238E6DC
	cmp r4, #0
	movne r0, r1
	mov r1, #0
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
	arm_func_end FUN_0238E48C

	arm_func_start FUN_0238E4C8
FUN_0238E4C8: @ 0x0238E4C8
	eor ip, r0, r1
	and ip, ip, #0x80000000
	cmp r0, #0
	rsblt r0, r0, #0
	addlt ip, ip, #1
	cmp r1, #0
	rsblt r1, r1, #0
	beq _0238E6C0
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	blo _0238E6C0
	mov r2, #0x1c
	lsr r3, r0, #4
	cmp r1, r3, lsr #12
	suble r2, r2, #0x10
	lsrle r3, r3, #0x10
	cmp r1, r3, lsr #4
	suble r2, r2, #8
	lsrle r3, r3, #8
	cmp r1, r3
	suble r2, r2, #4
	lsrle r3, r3, #4
	lsl r0, r0, r2
	rsb r1, r1, #0
	adds r0, r0, r0
	add r2, r2, r2, lsl #1
	add pc, pc, r2, lsl #2
	mov r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	mov r1, r3
_0238E6C0:
	ands r3, ip, #0x80000000
	rsbne r0, r0, #0
	ands r3, ip, #1
	rsbne r1, r1, #0
	bx lr
	arm_func_end FUN_0238E4C8

	arm_func_start FUN_0238E6D4
FUN_0238E6D4: @ 0x0238E6D4
	cmp r1, #0
	bxeq lr
	arm_func_end FUN_0238E6D4

	arm_func_start FUN_0238E6DC
FUN_0238E6DC: @ 0x0238E6DC
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	bxlo lr
	mov r2, #0x1c
	lsr r3, r0, #4
	cmp r1, r3, lsr #12
	suble r2, r2, #0x10
	lsrle r3, r3, #0x10
	cmp r1, r3, lsr #4
	suble r2, r2, #8
	lsrle r3, r3, #8
	cmp r1, r3
	suble r2, r2, #4
	lsrle r3, r3, #4
	lsl r0, r0, r2
	rsb r1, r1, #0
	adds r0, r0, r0
	add r2, r2, r2, lsl #1
	add pc, pc, r2, lsl #2
	mov r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	mov r1, r3
	bx lr
	arm_func_end FUN_0238E6DC
_0238E8B8:
	.byte 0x00, 0x06, 0x0C, 0x13, 0x19, 0x1F, 0x25, 0x2B
	.byte 0x31, 0x36, 0x3C, 0x41, 0x47, 0x4C, 0x51, 0x55, 0x5A, 0x5E, 0x62, 0x66, 0x6A, 0x6D, 0x70, 0x73
	.byte 0x75, 0x78, 0x7A, 0x7B, 0x7D, 0x7E, 0x7E, 0x7F, 0x7F, 0x00, 0x00, 0x00, 0x00, 0x80, 0x2E, 0xFD
	.byte 0x2F, 0xFD, 0x75, 0xFD, 0xA7, 0xFD, 0xCE, 0xFD, 0xEE, 0xFD, 0x09, 0xFE, 0x20, 0xFE, 0x34, 0xFE
	.byte 0x46, 0xFE, 0x57, 0xFE, 0x66, 0xFE, 0x74, 0xFE, 0x81, 0xFE, 0x8D, 0xFE, 0x98, 0xFE, 0xA3, 0xFE
	.byte 0xAD, 0xFE, 0xB6, 0xFE, 0xBF, 0xFE, 0xC7, 0xFE, 0xCF, 0xFE, 0xD7, 0xFE, 0xDF, 0xFE, 0xE6, 0xFE
	.byte 0xEC, 0xFE, 0xF3, 0xFE, 0xF9, 0xFE, 0xFF, 0xFE, 0x05, 0xFF, 0x0B, 0xFF, 0x11, 0xFF, 0x16, 0xFF
	.byte 0x1B, 0xFF, 0x20, 0xFF, 0x25, 0xFF, 0x2A, 0xFF, 0x2E, 0xFF, 0x33, 0xFF, 0x37, 0xFF, 0x3C, 0xFF
	.byte 0x40, 0xFF, 0x44, 0xFF, 0x48, 0xFF, 0x4C, 0xFF, 0x50, 0xFF, 0x53, 0xFF, 0x57, 0xFF, 0x5B, 0xFF
	.byte 0x5E, 0xFF, 0x62, 0xFF, 0x65, 0xFF, 0x68, 0xFF, 0x6B, 0xFF, 0x6F, 0xFF, 0x72, 0xFF, 0x75, 0xFF
	.byte 0x78, 0xFF, 0x7B, 0xFF, 0x7E, 0xFF, 0x81, 0xFF, 0x83, 0xFF, 0x86, 0xFF, 0x89, 0xFF, 0x8C, 0xFF
	.byte 0x8E, 0xFF, 0x91, 0xFF, 0x93, 0xFF, 0x96, 0xFF, 0x99, 0xFF, 0x9B, 0xFF, 0x9D, 0xFF, 0xA0, 0xFF
	.byte 0xA2, 0xFF, 0xA5, 0xFF, 0xA7, 0xFF, 0xA9, 0xFF, 0xAB, 0xFF, 0xAE, 0xFF, 0xB0, 0xFF, 0xB2, 0xFF
	.byte 0xB4, 0xFF, 0xB6, 0xFF, 0xB8, 0xFF, 0xBA, 0xFF, 0xBC, 0xFF, 0xBE, 0xFF, 0xC0, 0xFF, 0xC2, 0xFF
	.byte 0xC4, 0xFF, 0xC6, 0xFF, 0xC8, 0xFF, 0xCA, 0xFF, 0xCC, 0xFF, 0xCE, 0xFF, 0xCF, 0xFF, 0xD1, 0xFF
	.byte 0xD3, 0xFF, 0xD5, 0xFF, 0xD6, 0xFF, 0xD8, 0xFF, 0xDA, 0xFF, 0xDC, 0xFF, 0xDD, 0xFF, 0xDF, 0xFF
	.byte 0xE1, 0xFF, 0xE2, 0xFF, 0xE4, 0xFF, 0xE5, 0xFF, 0xE7, 0xFF, 0xE9, 0xFF, 0xEA, 0xFF, 0xEC, 0xFF
	.byte 0xED, 0xFF, 0xEF, 0xFF, 0xF0, 0xFF, 0xF2, 0xFF, 0xF3, 0xFF, 0xF5, 0xFF, 0xF6, 0xFF, 0xF8, 0xFF
	.byte 0xF9, 0xFF, 0xFA, 0xFF, 0xFC, 0xFF, 0xFD, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x02, 0x04
	.byte 0x04, 0x05, 0x06, 0x07, 0x02, 0x00, 0x03, 0x01, 0x08, 0x09, 0x0A, 0x0B, 0x0E, 0x0C, 0x0F, 0x0D
	.byte 0x00, 0x01, 0x05, 0x0E, 0x1A, 0x26, 0x33, 0x3F, 0x49, 0x54, 0x5C, 0x64, 0x6D, 0x74, 0x7B, 0x7F
	.byte 0x84, 0x89, 0x8F, 0x00, 0xC7, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x18, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x12, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x40, 0x00, 0x16, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x17, 0x00, 0x00, 0x00
	arm_func_end FUN_0238E6DC

	arm_func_start FUN_0238EAC0
FUN_0238EAC0: @ 0x0238EAC0
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _0238EB28 @ =0x0380FFFC
	mov r0, #0
	str r0, [r1]
	ldr r1, _0238EB2C @ =0x04000180
	mov r0, #0x100
	strh r0, [r1]
_0238EAE0:
	ldrh r0, [r1]
	and r0, r0, #0xf
	cmp r0, #1
	bne _0238EAE0
	ldr r1, _0238EB2C @ =0x04000180
	mov r0, #0
	strh r0, [r1]
_0238EAFC:
	ldrh r0, [r1]
	cmp r0, #1
	beq _0238EAFC
	ldr r3, _0238EB30 @ =0x027FFE00
	ldr ip, [r3, #0x34]
	mov lr, ip
	mov r0, #0
	mov r1, #0
	mov r2, #0
	mov r3, #0
	bx ip
	.align 2, 0
_0238EB28: .4byte 0x0380FFFC
_0238EB2C: .4byte 0x04000180
_0238EB30: .4byte 0x027FFE00
	arm_func_end FUN_0238EAC0

	arm_func_start FUN_0238EB34
FUN_0238EB34: @ 0x0238EB34
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, #0x100
	mov r5, #0xa
	mov r4, #0
	b _0238EB54
_0238EB4C:
	mov r0, r6
	bl FUN_02380C9C
_0238EB54:
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl FUN_02383610
	cmp r0, #0
	blt _0238EB4C
	ldr r0, _0238EB7C @ =0x06019DCC
	bl FUN_02381B9C
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0238EB7C: .4byte 0x06019DCC
	arm_func_end FUN_0238EB34

	arm_func_start FUN_0238EB80
FUN_0238EB80: @ 0x0238EB80
	push {r3, r4, r5, lr}
	ldr r0, _0238EBC8 @ =0x06019DCC
	bl FUN_02381B18
	ldr r4, _0238EBCC @ =0x027FFF96
	mov r5, #0x100
	b _0238EBA0
_0238EB98:
	mov r0, r5
	bl FUN_02380C9C
_0238EBA0:
	ldrh r1, [r4]
	tst r1, #1
	bne _0238EB98
	ldr r0, _0238EBD0 @ =0x060198A4
	orr r1, r1, #1
	strh r1, [r4]
	ldr r0, [r0, #0x54c]
	ldr r0, [r0, #8]
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0238EBC8: .4byte 0x06019DCC
_0238EBCC: .4byte 0x027FFF96
_0238EBD0: .4byte 0x060198A4
	arm_func_end FUN_0238EB80

	arm_func_start FUN_0238EBD4
FUN_0238EBD4: @ 0x0238EBD4
	push {r4, r5, r6, lr}
	ldr r1, _0238ECDC @ =0x00001FFF
	and r0, r0, r1
	lsl r0, r0, #0x10
	lsrs r2, r0, #0x10
	moveq r0, #0
	beq _0238ECD4
	mov r1, #0
	mov r0, #1
	b _0238EC08
_0238EBFC:
	tst r2, r0, lsl r1
	bne _0238EC10
	add r1, r1, #1
_0238EC08:
	cmp r1, #0x10
	blt _0238EBFC
_0238EC10:
	mov r0, #0xf
	mov r3, #1
	b _0238EC28
_0238EC1C:
	tst r2, r3, lsl r0
	bne _0238EC30
	sub r0, r0, #1
_0238EC28:
	cmp r0, #0
	bne _0238EC1C
_0238EC30:
	sub r6, r0, r1
	cmp r6, #5
	movlt r0, #1
	lsllt r0, r0, r1
	lsllt r0, r0, #0x10
	lsrlt r0, r0, #0x10
	blt _0238ECD4
	add r3, r0, r1
	add r3, r3, r3, lsr #31
	asr r4, r3, #1
	mov r5, #0
	mov lr, #1
	b _0238EC88
_0238EC64:
	lsr ip, r5, #0x1f
	rsb r3, ip, r5, lsl #31
	add r3, ip, r3, ror #31
	lsl r3, r3, #1
	sub r3, r3, #1
	mla r4, r5, r3, r4
	tst r2, lr, lsl r4
	bne _0238EC90
	add r5, r5, #1
_0238EC88:
	cmp r5, r6
	blt _0238EC64
_0238EC90:
	sub r2, r0, r4
	cmp r2, #5
	subge r2, r4, r1
	cmpge r2, #5
	bge _0238ECBC
	mov r2, #1
	lsl r0, r2, r0
	orr r0, r0, r2, lsl r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	b _0238ECD4
_0238ECBC:
	mov r3, #1
	lsl r2, r3, r4
	orr r0, r2, r3, lsl r0
	orr r0, r0, r3, lsl r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
_0238ECD4:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0238ECDC: .4byte 0x00001FFF
	arm_func_end FUN_0238EBD4
