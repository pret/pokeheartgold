
	arm_func_start FUN_037F8000
FUN_037F8000: @ 0x037F8000
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x210
	bl FUN_027E0000
	bl FUN_037F9A10
	bl FUN_037F8F60
	add r2, sp, #4
	mov r0, #0x20
	mov r1, #2
	bl FUN_03803E6C
	ldr r0, [sp, #4]
	add r2, sp, #0x10
	lsl r0, r0, #3
	str r0, [sp, #4]
	mov r1, #0x100
	bl FUN_03803E6C
	ldr r0, [sp, #4]
	mov r1, #0x100
	add r0, r0, #0x100
	add r2, sp, #0x110
	bl FUN_03803E6C
	mov r0, #0x1d
	mov r1, #1
	add r2, sp, #0
	mov r6, #0
	bl FUN_03803E6C
	ldrb r0, [sp]
	cmp r0, #0xff
	moveq r0, r6
	beq _037F8080
	tst r0, #0x50
	movne r0, #1
	moveq r0, r6
_037F8080:
	cmp r0, #0
	beq _037F8154
	bl FUN_037F8488
	mov r8, r0
	mov fp, #1
	and r7, r8, #0x40
	mov sl, #0
	add r5, sp, #0x10
	mov r4, fp
	b _037F8148
_037F80A8:
	ldr r0, _037F8458 @ =0x0000FFFF
	add sb, r5, sl, lsl #8
	mov r1, sb
	mov r2, #0x70
	bl FUN_037F8470
	mov r2, sb
	ldrh r1, [r2, #0x72]
	cmp r0, r1
	bne _037F813C
	ldrh r0, [r2, #0x70]
	cmp r0, #0x80
	bhs _037F813C
	ldr r0, _037F8458 @ =0x0000FFFF
	mov r2, #0x8a
	add r1, sb, #0x74
	bl FUN_037F8470
	mov r2, sb
	ldrh r1, [r2, #0xfe]
	cmp r0, r1
	bne _037F813C
	ldrh r1, [r2, #0x76]
	ldrb r0, [r2, #0x75]
	tst r1, r4, lsl r0
	beq _037F813C
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
	bne _037F81F4
	orr r6, r6, fp, lsl sl
_037F813C:
	add r0, sl, #1
	lsl r0, r0, #0x10
	lsr sl, r0, #0x10
_037F8148:
	cmp sl, #2
	blo _037F80A8
	b _037F81B8
_037F8154:
	bl FUN_037F8488
	tst r0, #0x40
	movne r6, #3
	bne _037F81F4
	ldr r8, _037F8458 @ =0x0000FFFF
	mov sb, #0
	add r7, sp, #0x10
	mov r4, #1
	mov r5, #0x70
_037F8178:
	mov r0, r8
	mov r2, r5
	add r1, r7, sb, lsl #8
	bl FUN_037F8470
	add r2, r7, sb, lsl #8
	ldrh r1, [r2, #0x72]
	cmp r0, r1
	bne _037F81A4
	ldrh r0, [r2, #0x70]
	cmp r0, #0x80
	orrlo r6, r6, r4, lsl sb
_037F81A4:
	add r0, sb, #1
	lsl r0, r0, #0x10
	lsr sb, r0, #0x10
	cmp sb, #2
	blo _037F8178
_037F81B8:
	cmp r6, #1
	cmpne r6, #2
	beq _037F81F4
	cmp r6, #3
	bne _037F81F0
	ldrh r1, [sp, #0x80]
	add r0, sp, #0x100
	add r1, r1, #1
	ldrh r0, [r0, #0x80]
	and r1, r1, #0x7f
	cmp r1, r0
	moveq r6, #2
	movne r6, #1
	b _037F81F4
_037F81F0:
	mov r6, #0
_037F81F4:
	cmp r6, #3
	blt _037F8210
	ldr r1, _037F845C @ =0x027FFC80
	mvn r0, #0
	mov r2, #0x74
	bl FUN_037FAFCC
	b _037F82CC
_037F8210:
	cmp r6, #0
	beq _037F82BC
	ldr r0, _037F8460 @ =0xFFFFFF2A
	lsl r1, r6, #8
	add r0, sp
	ldrb r0, [r0, r6, lsl #8]
	cmp r0, #0xa
	bhs _037F825C
	add r0, sp, #0x10
	mov r3, #0xa
	mov r2, #0
	add r1, r0, r1
	b _037F8250
_037F8244:
	add r0, r1, r3, lsl #1
	strh r2, [r0, #-0xfc]
	sub r3, r3, #1
_037F8250:
	ldrb r0, [r1, #-0xe6]
	cmp r3, r0
	bgt _037F8244
_037F825C:
	ldr r0, _037F8464 @ =0xFFFFFF60
	lsl r1, r6, #8
	add r0, sp
	ldrb r0, [r0, r6, lsl #8]
	cmp r0, #0x1a
	bhs _037F82A0
	add r0, sp, #0x10
	mov r3, #0x1a
	mov r2, #0
	add r1, r0, r1
	b _037F8294
_037F8288:
	add r0, r1, r3, lsl #1
	strh r2, [r0, #-0xe6]
	sub r3, r3, #1
_037F8294:
	ldrb r0, [r1, #-0xb0]
	cmp r3, r0
	bgt _037F8288
_037F82A0:
	ldr r1, _037F845C @ =0x027FFC80
	add r2, sp, #0x10
	sub r0, r6, #1
	add r0, r2, r0, lsl #8
	mov r2, #0x74
	bl FUN_037FAFE0
	b _037F82CC
_037F82BC:
	ldr r1, _037F845C @ =0x027FFC80
	mov r0, #0
	mov r2, #0x74
	bl FUN_037FAFCC
_037F82CC:
	add r2, sp, #8
	mov r0, #0x36
	mov r1, #6
	bl FUN_03803E6C
	ldr r4, _037F845C @ =0x027FFC80
	add r0, sp, #8
	add r1, r4, #0x74
	mov r2, #6
	bl FUN_037FB110
	add r2, sp, #2
	mov r0, #0x3c
	mov r1, #2
	bl FUN_03803E6C
	ldrh r0, [sp, #2]
	lsl r0, r0, #0xf
	lsr r0, r0, #0x10
	bl FUN_03806968
	strh r0, [r4, #0x7a]
	bl FUN_037FB248
	mov r0, #8
	bl FUN_037F9AB8
	mov r4, r0
	mov r0, #8
	bl FUN_037F9ACC
	mov r1, r0
	mov r2, r4
	mov r0, #8
	mov r3, #1
	bl FUN_037F9E48
	mov r4, r0
	mov r0, #8
	bl FUN_037F9AB8
	sub r2, r0, r4
	mov r0, r4
	mov r1, #0
	bl FUN_037FB07C
	mov r1, r4
	mov r0, #8
	bl FUN_037F9BB4
	mov r0, #8
	bl FUN_037F9AB8
	mov r4, r0
	mov r0, #8
	bl FUN_037F9ACC
	mov r1, r0
	mov r2, r4
	mov r0, #8
	bl FUN_037F9EF0
	movs r4, r0
	bpl _037F8398
	bl FUN_037FAE94
_037F8398:
	mov r1, r4
	mov r0, #8
	bl FUN_037F9E14
	mov r1, r4
	mov r0, #8
	bl FUN_037F9F90
	cmp r0, #0x2100
	bhs _037F83BC
	bl FUN_037FAE94
_037F83BC:
	mov r0, #6
	bl FUN_037FBE8C
	bl FUN_037FB554
	ldr r1, _037F8468 @ =FUN_037F84C0
	mov r0, #1
	bl FUN_037F87E0
	mov r0, #1
	bl FUN_037F8914
	ldr r3, _037F846C @ =0x04000004
	mov r0, #1
	ldrh r1, [r3]
	ldrh r1, [r3]
	add r2, r3, #0x204
	orr r1, r1, #8
	strh r1, [r3]
	ldrh r1, [r2]
	strh r0, [r2]
	bl FUN_037FAD10
	mvn r0, #0
	bl FUN_037FF5B0
	mov r0, #0xf
	bl FUN_037FF678
	mov r0, #0xc
	bl FUN_03804578
	mov r0, r4
	bl FUN_038059E8
	mov r0, #2
	bl FUN_03800920
	mov r4, #0
_037F8430:
	bl FUN_037F847C
	bl FUN_037FADD8
	cmp r0, #0
	beq _037F844C
	mov r0, r4
	bl FUN_038034B0
	bl FUN_037FAE1C
_037F844C:
	bl FUN_038036E8
	bl FUN_038007AC
	b _037F8430
	.align 2, 0
_037F8458: .4byte 0x0000FFFF
_037F845C: .4byte 0x027FFC80
_037F8460: .4byte 0xFFFFFF2A
_037F8464: .4byte 0xFFFFFF60
_037F8468: .4byte FUN_037F84C0
_037F846C: .4byte 0x04000004
	arm_func_end FUN_037F8000

	arm_func_start FUN_037F8470
FUN_037F8470: @ 0x037F8470
	ldr ip, _037F8478 @ =FUN_038008F4
	bx ip
	.align 2, 0
_037F8478: .4byte FUN_038008F4
	arm_func_end FUN_037F8470

	arm_func_start FUN_037F847C
FUN_037F847C: @ 0x037F847C
	ldr ip, _037F8484 @ =FUN_038008C2
	bx ip
	.align 2, 0
_037F8484: .4byte FUN_038008C2
	arm_func_end FUN_037F847C

	arm_func_start FUN_037F8488
FUN_037F8488: @ 0x037F8488
	ldr r1, _037F84BC @ =0x027FFE1D
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
_037F84BC: .4byte 0x027FFE1D
	arm_func_end FUN_037F8488

	arm_func_start FUN_037F84C0
FUN_037F84C0: @ 0x037F84C0
	push {r3, lr}
	ldr r0, _037F84E0 @ =0x038093B0
	ldr r0, [r0]
	cmp r0, #0
	beq _037F84D8
	bl FUN_0380219C
_037F84D8:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037F84E0: .4byte 0x038093B0
	arm_func_end FUN_037F84C0

	arm_func_start FUN_037F84E4
FUN_037F84E4: @ 0x037F84E4
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
_037F8510:
	ands r2, r1, r3, lsl r0
	addeq r0, r0, #1
	beq _037F8510
	str r2, [ip, #4]
	ldr r1, _037F8530 @ =0x03806A88
	ldr r0, [r1, r0, lsl #2]
	ldr lr, _037F8534 @ =FUN_037F8538
	bx r0
	.align 2, 0
_037F8530: .4byte 0x03806A88
_037F8534: .4byte FUN_037F8538
	arm_func_end FUN_037F84E4

	arm_func_start FUN_037F8538
FUN_037F8538: @ 0x037F8538
	ldr ip, _037F8654 @ =0x03806BA4
	mov r3, #0
	ldr ip, [ip]
	mov r2, #1
	cmp ip, #0
	beq _037F8588
_037F8550:
	str r2, [ip, #0x48]
	str r3, [ip, #0x5c]
	str r3, [ip, #0x60]
	ldr r0, [ip, #0x64]
	str r3, [ip, #0x64]
	mov ip, r0
	cmp ip, #0
	bne _037F8550
	ldr ip, _037F8654 @ =0x03806BA4
	str r3, [ip]
	str r3, [ip, #4]
	ldr ip, _037F8658 @ =0x03806C40
	mov r1, #1
	strh r1, [ip]
_037F8588:
	ldr ip, _037F8658 @ =0x03806C40
	ldrh r1, [ip]
	cmp r1, #0
	popeq {pc}
	mov r1, #0
	strh r1, [ip]
	mov r3, #0xd2
	msr cpsr_c, r3
	add r2, ip, #8
	ldr r1, [r2]
_037F85B0:
	cmp r1, #0
	ldrhne r0, [r1, #0x48]
	cmpne r0, #1
	ldrne r1, [r1, #0x4c]
	bne _037F85B0
	cmp r1, #0
	bne _037F85D8
_037F85CC:
	mov r3, #0x92
	msr cpsr_c, r3
	pop {pc}
_037F85D8:
	ldr r0, [ip, #4]
	cmp r1, r0
	beq _037F85CC
	ldr r3, [ip, #0xc]
	cmp r3, #0
	beq _037F8600
	push {r0, r1, ip}
	mov lr, pc
	bx r3
	arm_func_end FUN_037F8538

	arm_func_start FUN_037F85FC
FUN_037F85FC: @ 0x037F85FC
	pop {r0, r1, ip}
_037F8600:
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
_037F8654: .4byte 0x03806BA4
_037F8658: .4byte 0x03806C40
	arm_func_end FUN_037F85FC

	arm_func_start FUN_037F865C
FUN_037F865C: @ 0x037F865C
	bx lr
	arm_func_end FUN_037F865C

	arm_func_start FUN_037F8660
FUN_037F8660: @ 0x037F8660
	push {r3, r4, r5, lr}
	mov r1, #0xc
	mul r5, r0, r1
	ldr r2, _037F86D8 @ =0x03806BAC
	ldr r3, _037F86DC @ =_03806A74
	lsl r4, r0, #1
	ldr r1, [r2, r5]
	mov r0, #0
	ldrh r3, [r3, r4]
	mov r4, #1
	str r0, [r2, r5]
	cmp r1, #0
	lsl r4, r4, r3
	beq _037F86A8
	ldr r0, _037F86E0 @ =0x03806BB4
	ldr r0, [r0, r5]
	mov lr, pc
	bx r1
_037F86A8:
	ldr r2, _037F86E4 @ =0x0380FFF8
	ldr r0, _037F86E8 @ =0x03806BB0
	ldr r1, [r2]
	orr r1, r1, r4
	str r1, [r2]
	ldr r0, [r0, r5]
	cmp r0, #0
	bne _037F86D0
	mov r0, r4
	bl FUN_037F894C
_037F86D0:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F86D8: .4byte 0x03806BAC
_037F86DC: .4byte _03806A74
_037F86E0: .4byte 0x03806BB4
_037F86E4: .4byte 0x0380FFF8
_037F86E8: .4byte 0x03806BB0
	arm_func_end FUN_037F8660

	arm_func_start FUN_037F86EC
FUN_037F86EC: @ 0x037F86EC
	ldr ip, _037F86F8 @ =FUN_037F8660
	mov r0, #0
	bx ip
	.align 2, 0
_037F86F8: .4byte FUN_037F8660
	arm_func_end FUN_037F86EC

	arm_func_start FUN_037F86FC
FUN_037F86FC: @ 0x037F86FC
	ldr ip, _037F8708 @ =FUN_037F8660
	mov r0, #1
	bx ip
	.align 2, 0
_037F8708: .4byte FUN_037F8660
	arm_func_end FUN_037F86FC

	arm_func_start FUN_037F870C
FUN_037F870C: @ 0x037F870C
	ldr ip, _037F8718 @ =FUN_037F8660
	mov r0, #2
	bx ip
	.align 2, 0
_037F8718: .4byte FUN_037F8660
	arm_func_end FUN_037F870C

	arm_func_start FUN_037F871C
FUN_037F871C: @ 0x037F871C
	ldr ip, _037F8728 @ =FUN_037F8660
	mov r0, #3
	bx ip
	.align 2, 0
_037F8728: .4byte FUN_037F8660
	arm_func_end FUN_037F871C

	arm_func_start FUN_037F872C
FUN_037F872C: @ 0x037F872C
	ldr ip, _037F8738 @ =FUN_037F8660
	mov r0, #4
	bx ip
	.align 2, 0
_037F8738: .4byte FUN_037F8660
	arm_func_end FUN_037F872C

	arm_func_start FUN_037F873C
FUN_037F873C: @ 0x037F873C
	ldr ip, _037F8748 @ =FUN_037F8660
	mov r0, #5
	bx ip
	.align 2, 0
_037F8748: .4byte FUN_037F8660
	arm_func_end FUN_037F873C

	arm_func_start FUN_037F874C
FUN_037F874C: @ 0x037F874C
	ldr ip, _037F8758 @ =FUN_037F8660
	mov r0, #6
	bx ip
	.align 2, 0
_037F8758: .4byte FUN_037F8660
	arm_func_end FUN_037F874C

	arm_func_start FUN_037F875C
FUN_037F875C: @ 0x037F875C
	ldr ip, _037F8768 @ =FUN_037F8660
	mov r0, #7
	bx ip
	.align 2, 0
_037F8768: .4byte FUN_037F8660
	arm_func_end FUN_037F875C

	arm_func_start FUN_037F876C
FUN_037F876C: @ 0x037F876C
	push {r3, lr}
	ldr r2, _037F87B0 @ =0x027FFC3C
	ldr r0, _037F87B4 @ =0x03806BAC
	ldr r1, [r2]
	ldr r3, [r0, #0x60]
	add r0, r1, #1
	str r0, [r2]
	cmp r3, #0
	beq _037F8798
	mov lr, pc
	bx r3
_037F8798:
	ldr r1, _037F87B8 @ =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #1
	str r0, [r1]
	pop {r3, lr}
	bx lr
	.align 2, 0
_037F87B0: .4byte 0x027FFC3C
_037F87B4: .4byte 0x03806BAC
_037F87B8: .4byte 0x0380FFF8
	arm_func_end FUN_037F876C

	arm_func_start FUN_037F87BC
FUN_037F87BC: @ 0x037F87BC
	ldr r0, _037F87D8 @ =0x03806BA4
	mov r2, #0
	str r2, [r0, #4]
	ldr r1, _037F87DC @ =0x027FFC3C
	str r2, [r0]
	str r2, [r1]
	bx lr
	.align 2, 0
_037F87D8: .4byte 0x03806BA4
_037F87DC: .4byte 0x027FFC3C
	arm_func_end FUN_037F87BC

	arm_func_start FUN_037F87E0
FUN_037F87E0: @ 0x037F87E0
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r4, _037F8870 @ =0x03806A88
	mov sb, #0
	mov r2, #0xc
	ldr r5, _037F8874 @ =0x03806C0C
	ldr r7, _037F8878 @ =0x03806BAC
	mov r8, sb
	mov lr, sb
	mov ip, #1
	mov r3, r2
_037F8808:
	tst r0, #1
	beq _037F8858
	mov sl, r8
	cmp sb, #8
	blt _037F882C
	cmp sb, #0xb
	suble r6, sb, #8
	mlale sl, r6, r3, r7
	ble _037F8850
_037F882C:
	cmp sb, #3
	blt _037F8844
	cmp sb, #6
	addle r6, sb, #1
	mlale sl, r6, r2, r7
	ble _037F8850
_037F8844:
	cmp sb, #0
	strne r1, [r4, sb, lsl #2]
	moveq sl, r5
_037F8850:
	cmp sl, #0
	stmne sl, {r1, ip, lr}
_037F8858:
	add sb, sb, #1
	cmp sb, #0x19
	lsr r0, r0, #1
	blt _037F8808
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037F8870: .4byte 0x03806A88
_037F8874: .4byte 0x03806C0C
_037F8878: .4byte 0x03806BAC
	arm_func_end FUN_037F87E0

	arm_func_start FUN_037F887C
FUN_037F887C: @ 0x037F887C
	push {r4, lr}
	mov r3, #0xc
	mul r4, r0, r3
	ldr ip, _037F88BC @ =0x03806BDC
	ldr r3, _037F88C0 @ =0x03806BE4
	str r1, [ip, r4]
	add r0, r0, #3
	mov r1, #1
	lsl r0, r1, r0
	str r2, [r3, r4]
	bl FUN_037F8914
	ldr r0, _037F88C4 @ =0x03806BE0
	mov r1, #1
	str r1, [r0, r4]
	pop {r4, lr}
	bx lr
	.align 2, 0
_037F88BC: .4byte 0x03806BDC
_037F88C0: .4byte 0x03806BE4
_037F88C4: .4byte 0x03806BE0
	arm_func_end FUN_037F887C

	arm_func_start FUN_037F88C8
FUN_037F88C8: @ 0x037F88C8
	push {r4, lr}
	mov r4, r0
	bl FUN_037F88FC
	ldr r1, _037F88F8 @ =0x04000210
	ldr r3, [r1]
	sub r2, r1, #8
	str r4, [r1]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	pop {r4, lr}
	bx lr
	.align 2, 0
_037F88F8: .4byte 0x04000210
	arm_func_end FUN_037F88C8

	arm_func_start FUN_037F88FC
FUN_037F88FC: @ 0x037F88FC
	ldr r2, _037F8910 @ =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_037F8910: .4byte 0x04000208
	arm_func_end FUN_037F88FC

	arm_func_start FUN_037F8914
FUN_037F8914: @ 0x037F8914
	push {r4, lr}
	mov r4, r0
	bl FUN_037F88FC
	ldr ip, _037F8948 @ =0x04000210
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
_037F8948: .4byte 0x04000210
	arm_func_end FUN_037F8914

	arm_func_start FUN_037F894C
FUN_037F894C: @ 0x037F894C
	push {r4, lr}
	mov r4, r0
	bl FUN_037F88FC
	ldr ip, _037F8984 @ =0x04000210
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
_037F8984: .4byte 0x04000210
	arm_func_end FUN_037F894C

	arm_func_start FUN_037F8988
FUN_037F8988: @ 0x037F8988
	push {r4, lr}
	mov r4, r0
	bl FUN_037F88FC
	ldr r1, _037F89B8 @ =0x04000214
	ldr r3, [r1]
	sub r2, r1, #0xc
	str r4, [r1]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	pop {r4, lr}
	bx lr
	.align 2, 0
_037F89B8: .4byte 0x04000214
	arm_func_end FUN_037F8988

	arm_func_start FUN_037F89BC
FUN_037F89BC: @ 0x037F89BC
	push {r3, r4, r5, lr}
	ldr r0, _037F8A24 @ =0x03806C18
	ldr r1, [r0]
	cmp r1, #0
	bne _037F8A1C
	ldr r4, _037F8A28 @ =0x027FFFF0
	mov r2, #1
	mov r1, #0
	str r2, [r0]
	strh r1, [r4, #6]
	mov r5, #0x400
	b _037F89F4
_037F89EC:
	mov r0, r5
	bl FUN_037F8A30
_037F89F4:
	ldrh r0, [r4, #4]
	cmp r0, #0x7f
	bne _037F89EC
	ldr r1, _037F8A2C @ =0x027FFFB8
	mvn r0, #0
	str r0, [r1]
	lsl r0, r0, #0x10
	str r0, [r1, #4]
	mov r0, #0xbf
	strh r0, [r4, #6]
_037F8A1C:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F8A24: .4byte 0x03806C18
_037F8A28: .4byte 0x027FFFF0
_037F8A2C: .4byte 0x027FFFB8
	arm_func_end FUN_037F89BC

	arm_func_start FUN_037F8A30
FUN_037F8A30: @ 0x037F8A30
	ldr ip, _037F8A38 @ =FUN_038008A8
	bx ip
	.align 2, 0
_037F8A38: .4byte FUN_038008A8
	arm_func_end FUN_037F8A30

	arm_func_start FUN_037F8A3C
FUN_037F8A3C: @ 0x037F8A3C
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	ldrh r1, [r7, #4]
	mov r6, r2
	cmp r0, r1
	mov r5, r3
	mvnne r0, #1
	bne _037F8AB0
	cmp r5, #0
	beq _037F8A6C
	bl FUN_037FAD50
	b _037F8A70
_037F8A6C:
	bl FUN_037FAD24
_037F8A70:
	mov r4, r0
	mov r0, #0
	strh r0, [r7, #4]
	cmp r6, #0
	beq _037F8A8C
	mov lr, pc
	bx r6
_037F8A8C:
	mov r0, #0
	str r0, [r7]
	cmp r5, #0
	mov r0, r4
	beq _037F8AA8
	bl FUN_037FAD64
	b _037F8AAC
_037F8AA8:
	bl FUN_037FAD38
_037F8AAC:
	mov r0, #0
_037F8AB0:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_037F8A3C

	arm_func_start FUN_037F8AB8
FUN_037F8AB8: @ 0x037F8AB8
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r6, r3
	mov sb, r0
	mov r8, r1
	mov r7, r2
	beq _037F8AD8
	bl FUN_037FAD50
	b _037F8ADC
_037F8AD8:
	bl FUN_037FAD24
_037F8ADC:
	mov r5, r0
	mov r0, sb
	mov r1, r8
	bl FUN_037FB240
	movs r4, r0
	bne _037F8B08
	cmp r7, #0
	beq _037F8B04
	mov lr, pc
	bx r7
_037F8B04:
	strh sb, [r8, #4]
_037F8B08:
	cmp r6, #0
	mov r0, r5
	beq _037F8B1C
	bl FUN_037FAD64
	b _037F8B20
_037F8B1C:
	bl FUN_037FAD38
_037F8B20:
	mov r0, r4
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end FUN_037F8AB8

	arm_func_start FUN_037F8B2C
FUN_037F8B2C: @ 0x037F8B2C
	push {r4, r5, r6, r7, r8, lr}
	ldr r6, _037F8B74 @ =0x027FFFE8
	ldr r5, _037F8B78 @ =FUN_037F8BC8
	mov r8, r0
	mov r7, #0x400
	mov r4, #1
	b _037F8B50
_037F8B48:
	mov r0, r7
	bl FUN_037F8A30
_037F8B50:
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl FUN_037F8AB8
	cmp r0, #0
	bgt _037F8B48
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037F8B74: .4byte 0x027FFFE8
_037F8B78: .4byte FUN_037F8BC8
	arm_func_end FUN_037F8B2C

	arm_func_start FUN_037F8B7C
FUN_037F8B7C: @ 0x037F8B7C
	ldr ip, _037F8B90 @ =FUN_037F8A3C
	ldr r1, _037F8B94 @ =0x027FFFE8
	ldr r2, _037F8B98 @ =FUN_037F8BCC
	mov r3, #1
	bx ip
	.align 2, 0
_037F8B90: .4byte FUN_037F8A3C
_037F8B94: .4byte 0x027FFFE8
_037F8B98: .4byte FUN_037F8BCC
	arm_func_end FUN_037F8B7C

	arm_func_start FUN_037F8B9C
FUN_037F8B9C: @ 0x037F8B9C
	ldr r1, _037F8BA4 @ =FUN_037F8B7C
	bx r1
	.align 2, 0
_037F8BA4: .4byte FUN_037F8B7C
	arm_func_end FUN_037F8B9C

	arm_func_start FUN_037F8BA8
FUN_037F8BA8: @ 0x037F8BA8
	ldr ip, _037F8BBC @ =FUN_037F8AB8
	ldr r1, _037F8BC0 @ =0x027FFFE8
	ldr r2, _037F8BC4 @ =FUN_037F8BC8
	mov r3, #1
	bx ip
	.align 2, 0
_037F8BBC: .4byte FUN_037F8AB8
_037F8BC0: .4byte 0x027FFFE8
_037F8BC4: .4byte FUN_037F8BC8
	arm_func_end FUN_037F8BA8

	arm_func_start FUN_037F8BC8
FUN_037F8BC8: @ 0x037F8BC8
	bx lr
	arm_func_end FUN_037F8BC8

	arm_func_start FUN_037F8BCC
FUN_037F8BCC: @ 0x037F8BCC
	bx lr
	arm_func_end FUN_037F8BCC

	arm_func_start FUN_037F8BD0
FUN_037F8BD0: @ 0x037F8BD0
	ldr ip, _037F8BE4 @ =FUN_037F8A3C
	ldr r1, _037F8BE8 @ =0x027FFFE0
	ldr r2, _037F8BEC @ =FUN_037F8C14
	mov r3, #0
	bx ip
	.align 2, 0
_037F8BE4: .4byte FUN_037F8A3C
_037F8BE8: .4byte 0x027FFFE0
_037F8BEC: .4byte FUN_037F8C14
	arm_func_end FUN_037F8BD0

	arm_func_start FUN_037F8BF0
FUN_037F8BF0: @ 0x037F8BF0
	ldr ip, _037F8C04 @ =FUN_037F8AB8
	ldr r1, _037F8C08 @ =0x027FFFE0
	ldr r2, _037F8C0C @ =FUN_037F8C10
	mov r3, #0
	bx ip
	.align 2, 0
_037F8C04: .4byte FUN_037F8AB8
_037F8C08: .4byte 0x027FFFE0
_037F8C0C: .4byte FUN_037F8C10
	arm_func_end FUN_037F8BF0

	arm_func_start FUN_037F8C10
FUN_037F8C10: @ 0x037F8C10
	bx lr
	arm_func_end FUN_037F8C10

	arm_func_start FUN_037F8C14
FUN_037F8C14: @ 0x037F8C14
	bx lr
	arm_func_end FUN_037F8C14

	arm_func_start FUN_037F8C18
FUN_037F8C18: @ 0x037F8C18
	ldrh r0, [r0, #4]
	bx lr
	arm_func_end FUN_037F8C18

	arm_func_start FUN_037F8C20
FUN_037F8C20: @ 0x037F8C20
	ldr r3, _037F8CB0 @ =0x027FFFB8
	ldr r1, [r3]
	mov r2, #0
	mov r0, #-0x80000000
_037F8C30:
	tst r1, r0
	bne _037F8C4C
	add r2, r2, #1
	cmp r2, #0x20
	beq _037F8C4C
	lsr r0, r0, #1
	b _037F8C30
_037F8C4C:
	cmp r2, #0x20
	movne r0, #0x80
	bne _037F8C94
	add r3, r3, #4
	ldr r1, [r3]
	mov r2, #0
	mov r0, #-0x80000000
_037F8C68:
	tst r1, r0
	bne _037F8C84
	add r2, r2, #1
	cmp r2, #0x20
	beq _037F8C84
	lsr r0, r0, #1
	b _037F8C68
_037F8C84:
	cmp r2, #0x20
	ldr r0, _037F8CB4 @ =0xFFFFFFFD
	bxeq lr
	mov r0, #0xa0
_037F8C94:
	add r0, r0, r2
	mov r1, #-0x80000000
	lsr r1, r1, r2
	ldr r2, [r3]
	bic r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_037F8CB0: .4byte 0x027FFFB8
_037F8CB4: .4byte 0xFFFFFFFD
	arm_func_end FUN_037F8C20

	arm_func_start FUN_037F8CB8
FUN_037F8CB8: @ 0x037F8CB8
	ldr r3, _037F8CE4 @ =0x027FFFB8
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
_037F8CE4: .4byte 0x027FFFB8
	arm_func_end FUN_037F8CB8

	arm_func_start FUN_037F8CE8
FUN_037F8CE8: @ 0x037F8CE8
	ldr ip, [r0]
	b _037F8CFC
_037F8CF0:
	cmp ip, r1
	bxeq lr
	ldr ip, [ip, #0x64]
_037F8CFC:
	cmp ip, #0
	beq _037F8D14
	ldr r3, [ip, #0x54]
	ldr r2, [r1, #0x54]
	cmp r3, r2
	bls _037F8CF0
_037F8D14:
	cmp ip, #0
	bne _037F8D40
	ldr r2, [r0, #4]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x64]
	str r2, [r1, #0x60]
	mov r2, #0
	str r2, [r1, #0x64]
	str r1, [r0, #4]
	bx lr
_037F8D40:
	ldr r2, [ip, #0x60]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x64]
	str r2, [r1, #0x60]
	str ip, [r1, #0x64]
	str r1, [ip, #0x60]
	bx lr
	arm_func_end FUN_037F8CE8

	arm_func_start FUN_037F8D60
FUN_037F8D60: @ 0x037F8D60
	push {r3, lr}
	ldr lr, [r0]
	mov r2, lr
	b _037F8DA4
_037F8D70:
	ldr r3, [r2, #0x64]
	cmp r2, r1
	bne _037F8DA0
	ldr ip, [r2, #0x60]
	cmp lr, r2
	streq r3, [r0]
	strne r3, [ip, #0x64]
	ldr r1, [r0, #4]
	cmp r1, r2
	streq ip, [r0, #4]
	strne ip, [r3, #0x60]
	b _037F8DAC
_037F8DA0:
	mov r2, r3
_037F8DA4:
	cmp r2, #0
	bne _037F8D70
_037F8DAC:
	mov r0, r2
	pop {r3, lr}
	bx lr
	arm_func_end FUN_037F8D60

	arm_func_start FUN_037F8DB8
FUN_037F8DB8: @ 0x037F8DB8
	ldr r2, [r0]
	cmp r2, #0
	beq _037F8DE0
	ldr r1, [r2, #0x10]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x14]
	moveq r1, #0
	streq r1, [r0, #4]
_037F8DE0:
	mov r0, r2
	bx lr
	arm_func_end FUN_037F8DB8

	arm_func_start FUN_037F8DE8
FUN_037F8DE8: @ 0x037F8DE8
	push {r3, lr}
	ldr r1, _037F8E44 @ =0x03806C1C
	mov ip, #0
	ldr lr, [r1, #0x2c]
	mov r3, lr
	b _037F8E08
_037F8E00:
	mov ip, r3
	ldr r3, [r3, #0x4c]
_037F8E08:
	cmp r3, #0
	beq _037F8E20
	ldr r2, [r3, #0x54]
	ldr r1, [r0, #0x54]
	cmp r2, r1
	blo _037F8E00
_037F8E20:
	cmp ip, #0
	ldreq r1, _037F8E44 @ =0x03806C1C
	streq lr, [r0, #0x4c]
	streq r0, [r1, #0x2c]
	ldrne r1, [ip, #0x4c]
	strne r1, [r0, #0x4c]
	strne r0, [ip, #0x4c]
	pop {r3, lr}
	bx lr
	.align 2, 0
_037F8E44: .4byte 0x03806C1C
	arm_func_end FUN_037F8DE8

	arm_func_start FUN_037F8E48
FUN_037F8E48: @ 0x037F8E48
	ldr r1, _037F8E88 @ =0x03806C1C
	mov r2, #0
	ldr r1, [r1, #0x2c]
	b _037F8E60
_037F8E58:
	mov r2, r1
	ldr r1, [r1, #0x4c]
_037F8E60:
	cmp r1, #0
	cmpne r1, r0
	bne _037F8E58
	cmp r2, #0
	ldreq r1, [r0, #0x4c]
	ldreq r0, _037F8E88 @ =0x03806C1C
	streq r1, [r0, #0x2c]
	ldrne r0, [r0, #0x4c]
	strne r0, [r2, #0x4c]
	bx lr
	.align 2, 0
_037F8E88: .4byte 0x03806C1C
	arm_func_end FUN_037F8E48

	arm_func_start FUN_037F8E8C
FUN_037F8E8C: @ 0x037F8E8C
	push {r4, r5, r6, lr}
	ldr r0, _037F8F58 @ =0x03806C1C
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _037F8F50
	ldrh r0, [r0, #0x26]
	ldr r4, _037F8F5C @ =0x03806C40
	cmp r0, #0
	bne _037F8EBC
	bl FUN_037FAD7C
	cmp r0, #0x12
	bne _037F8EC8
_037F8EBC:
	mov r0, #1
	strh r0, [r4]
	b _037F8F50
_037F8EC8:
	ldr r0, _037F8F58 @ =0x03806C1C
	ldr r0, [r0, #8]
	ldr r6, [r0]
	bl FUN_037F93E0
	mov r5, r0
	cmp r6, r5
	cmpne r5, #0
	beq _037F8F50
	ldr r0, [r6, #0x48]
	cmp r0, #2
	beq _037F8F04
	mov r0, r6
	bl FUN_037F9670
	cmp r0, #0
	bne _037F8F50
_037F8F04:
	ldr r0, _037F8F58 @ =0x03806C1C
	ldr r2, [r0]
	cmp r2, #0
	beq _037F8F24
	mov r0, r6
	mov r1, r5
	mov lr, pc
	bx r2
_037F8F24:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _037F8F40
	mov r0, r6
	mov r1, r5
	mov lr, pc
	bx r2
_037F8F40:
	ldr r1, _037F8F58 @ =0x03806C1C
	mov r0, r5
	str r5, [r1, #0x28]
	bl FUN_037F96A4
_037F8F50:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037F8F58: .4byte 0x03806C1C
_037F8F5C: .4byte 0x03806C40
	arm_func_end FUN_037F8E8C

	arm_func_start FUN_037F8F60
FUN_037F8F60: @ 0x037F8F60
	push {r3, lr}
	ldr r0, _037F9028 @ =0x03806C1C
	ldr r1, [r0, #0xc]
	cmp r1, #0
	bne _037F9020
	ldr r2, _037F902C @ =0x03806C44
	mov r3, #1
	str r3, [r0, #0xc]
	str r2, [r0, #8]
	ldr r1, _037F9030 @ =0x03806CF4
	mov r2, #0x10
	str r2, [r1, #0x54]
	mov r2, #0
	str r2, [r1, #0x50]
	str r3, [r1, #0x48]
	str r2, [r1, #0x4c]
	str r2, [r1, #0x58]
	ldr r2, _037F9034 @ =0x00000400
	str r1, [r0, #0x2c]
	str r1, [r0, #0x28]
	cmp r2, #0
	ldrle r0, _037F9038 @ =FUN_037F8000
	ldrgt r1, _037F903C @ =0x00000400
	ldrgt r0, _037F9040 @ =0x0380FF80
	subgt r0, r0, r1
	sub ip, r0, r2
	ldr r1, _037F903C @ =0x00000400
	ldr r0, _037F9040 @ =0x0380FF80
	ldr r2, _037F9030 @ =0x03806CF4
	sub r3, r0, r1
	str r3, [r2, #0x78]
	str ip, [r2, #0x74]
	mov r0, #0
	ldr r1, _037F9044 @ =0xD73BFDF7
	str r0, [r2, #0x7c]
	str r1, [r3, #-4]
	ldr r3, [r2, #0x74]
	ldr ip, _037F9048 @ =0xFBDD37BB
	ldr r1, _037F9028 @ =0x03806C1C
	str ip, [r3]
	str r0, [r2, #0x84]
	str r0, [r2, #0x80]
	strh r0, [r1, #0x24]
	ldr r3, _037F904C @ =0x03806C40
	ldr r2, _037F9050 @ =0x027FFFA4
	strh r0, [r1, #0x26]
	str r3, [r2]
	bl FUN_037F9568
_037F9020:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037F9028: .4byte 0x03806C1C
_037F902C: .4byte 0x03806C44
_037F9030: .4byte 0x03806CF4
_037F9034: .4byte 0x00000400
_037F9038: .4byte FUN_037F8000
_037F903C: .4byte 0x00000400
_037F9040: .4byte 0x0380FF80
_037F9044: .4byte 0xD73BFDF7
_037F9048: .4byte 0xFBDD37BB
_037F904C: .4byte 0x03806C40
_037F9050: .4byte 0x027FFFA4
	arm_func_end FUN_037F8F60

	arm_func_start FUN_037F9054
FUN_037F9054: @ 0x037F9054
	push {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r5, r1
	mov r7, r2
	mov r6, r3
	bl FUN_037FAD24
	ldr r1, _037F914C @ =0x03806C1C
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
	bl FUN_037F8DE8
	ldr r0, [sp, #0x18]
	mov r1, r5
	str r6, [r8, #0x78]
	sub r5, r6, r0
	sub r2, r6, #4
	str r5, [r8, #0x74]
	mov ip, #0
	str ip, [r8, #0x7c]
	ldr r6, _037F9150 @ =0xD73BFDF7
	ldr r0, [r8, #0x78]
	ldr r3, _037F9154 @ =0xFBDD37BB
	str r6, [r0, #-4]
	ldr r0, [r8, #0x74]
	str r3, [r0]
	str ip, [r8, #0x84]
	mov r0, r8
	str ip, [r8, #0x80]
	bl FUN_037F9604
	ldr r2, _037F9158 @ =FUN_037F915C
	str r7, [r8, #4]
	str r2, [r8, #0x3c]
	ldr r2, [sp, #0x18]
	add r1, r5, #4
	mov r0, #0
	sub r2, r2, #8
	bl FUN_037FAFCC
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
	bl FUN_037FAFCC
	mov r1, #0
	mov r0, r4
	str r1, [r8, #0x94]
	bl FUN_037FAD38
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037F914C: .4byte 0x03806C1C
_037F9150: .4byte 0xD73BFDF7
_037F9154: .4byte 0xFBDD37BB
_037F9158: .4byte FUN_037F915C
	arm_func_end FUN_037F9054

	arm_func_start FUN_037F915C
FUN_037F915C: @ 0x037F915C
	push {r3, lr}
	bl FUN_037FAD24
	ldr r0, _037F917C @ =0x03806C1C
	mov r1, #0
	ldr r0, [r0, #0x28]
	bl FUN_037F9180
	pop {r3, lr}
	bx lr
	.align 2, 0
_037F917C: .4byte 0x03806C1C
	arm_func_end FUN_037F915C

	arm_func_start FUN_037F9180
FUN_037F9180: @ 0x037F9180
	push {r3, r4, r5, lr}
	ldr r2, _037F91D8 @ =0x03806C1C
	mov r5, r0
	ldr r2, [r2, #0x1c]
	mov r4, r1
	cmp r2, #0
	beq _037F91C8
	ldr r1, _037F91DC @ =FUN_037F91E0
	bl FUN_037F9604
	str r4, [r5, #4]
	ldr r1, [r5]
	mov r0, r5
	orr r1, r1, #0x80
	str r1, [r5]
	mov r1, #1
	str r1, [r5, #0x48]
	bl FUN_037F96A4
	b _037F91D0
_037F91C8:
	mov r0, r4
	bl FUN_037F91E0
_037F91D0:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F91D8: .4byte 0x03806C1C
_037F91DC: .4byte FUN_037F91E0
	arm_func_end FUN_037F9180

	arm_func_start FUN_037F91E0
FUN_037F91E0: @ 0x037F91E0
	push {r3, lr}
	ldr r1, _037F921C @ =0x03806C1C
	ldr r1, [r1, #8]
	ldr r3, [r1]
	ldr r2, [r3, #0x98]
	cmp r2, #0
	beq _037F9210
	mov r1, #0
	str r1, [r3, #0x98]
	mov lr, pc
	bx r2
	arm_func_end FUN_037F91E0

	arm_func_start FUN_037F920C
FUN_037F920C: @ 0x037F920C
	bl FUN_037FAD24
_037F9210:
	bl FUN_037F9220
	pop {r3, lr}
	bx lr
	.align 2, 0
_037F921C: .4byte 0x03806C1C
	arm_func_end FUN_037F920C

	arm_func_start FUN_037F9220
FUN_037F9220: @ 0x037F9220
	push {r4, lr}
	ldr r0, _037F928C @ =0x03806C1C
	ldr r0, [r0, #8]
	ldr r4, [r0]
	bl FUN_037F9594
	mov r0, r4
	bl FUN_037F9990
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	beq _037F9250
	mov r1, r4
	bl FUN_037F8D60
_037F9250:
	mov r0, r4
	bl FUN_037F8E48
	mov r1, #2
	add r0, r4, #0x80
	str r1, [r4, #0x48]
	bl FUN_037F932C
	bl FUN_037F95CC
	bl FUN_037FAD24
	mov r4, r0
	bl FUN_037F8E8C
	mov r0, r4
	bl FUN_037FAD38
	bl FUN_037FAE94
	pop {r4, lr}
	bx lr
	.align 2, 0
_037F928C: .4byte 0x03806C1C
	arm_func_end FUN_037F9220

	arm_func_start FUN_037F9290
FUN_037F9290: @ 0x037F9290
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_037FAD24
	ldr r1, [r5, #0x48]
	mov r4, r0
	cmp r1, #2
	beq _037F92B4
	add r0, r5, #0x80
	bl FUN_037F92D8
_037F92B4:
	mov r0, r4
	bl FUN_037FAD38
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_037F9290

	arm_func_start FUN_037F92C4
FUN_037F92C4: @ 0x037F92C4
	ldr r0, [r0, #0x48]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end FUN_037F92C4

	arm_func_start FUN_037F92D8
FUN_037F92D8: @ 0x037F92D8
	push {r4, r5, r6, lr}
	mov r6, r0
	bl FUN_037FAD24
	ldr r1, _037F9328 @ =0x03806C1C
	mov r4, r0
	ldr r0, [r1, #8]
	cmp r6, #0
	ldr r5, [r0]
	beq _037F930C
	mov r0, r6
	mov r1, r5
	str r6, [r5, #0x5c]
	bl FUN_037F8CE8
_037F930C:
	mov r0, #0
	str r0, [r5, #0x48]
	bl FUN_037F8E8C
	mov r0, r4
	bl FUN_037FAD38
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037F9328: .4byte 0x03806C1C
	arm_func_end FUN_037F92D8

	arm_func_start FUN_037F932C
FUN_037F932C: @ 0x037F932C
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_037FAD24
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	beq _037F93A4
	mov r2, #0
	mov r3, r2
	mov r1, #1
	mov r0, r2
	b _037F9388
_037F935C:
	beq _037F9378
	ldr ip, [lr, #0x64]
	str ip, [r5]
	cmp ip, #0
	strne r3, [ip, #0x60]
	streq r2, [r5, #4]
	streq r2, [lr, #0x5c]
_037F9378:
	str r1, [lr, #0x48]
	str r0, [lr, #0x5c]
	str r0, [lr, #0x64]
	str r0, [lr, #0x60]
_037F9388:
	ldr lr, [r5]
	cmp lr, #0
	bne _037F935C
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5]
	bl FUN_037F8E8C
_037F93A4:
	mov r0, r4
	bl FUN_037FAD38
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_037F932C

	arm_func_start FUN_037F93B4
FUN_037F93B4: @ 0x037F93B4
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_037FAD24
	mov r1, #1
	mov r4, r0
	str r1, [r5, #0x48]
	bl FUN_037F8E8C
	mov r0, r4
	bl FUN_037FAD38
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_037F93B4

	arm_func_start FUN_037F93E0
FUN_037F93E0: @ 0x037F93E0
	ldr r0, _037F9404 @ =0x03806C1C
	ldr r0, [r0, #0x2c]
	b _037F93F0
_037F93EC:
	ldr r0, [r0, #0x4c]
_037F93F0:
	cmp r0, #0
	ldrne r1, [r0, #0x48]
	cmpne r1, #1
	bne _037F93EC
	bx lr
	.align 2, 0
_037F9404: .4byte 0x03806C1C
	arm_func_end FUN_037F93E0

	arm_func_start FUN_037F9408
FUN_037F9408: @ 0x037F9408
	push {r4, r5, r6, r7, r8, lr}
	ldr r2, _037F94A8 @ =0x03806C1C
	mov r7, r0
	ldr r8, [r2, #0x2c]
	mov r6, r1
	mov r4, #0
	bl FUN_037FAD24
	mov r5, r0
	b _037F9434
_037F942C:
	mov r4, r8
	ldr r8, [r8, #0x4c]
_037F9434:
	cmp r8, #0
	cmpne r8, r7
	bne _037F942C
	cmp r8, #0
	ldrne r0, _037F94AC @ =0x03806C50
	cmpne r8, r0
	bne _037F9460
	mov r0, r5
	bl FUN_037FAD38
	mov r0, #0
	b _037F94A0
_037F9460:
	ldr r0, [r8, #0x54]
	cmp r0, r6
	beq _037F9494
	cmp r4, #0
	ldreq r1, [r7, #0x4c]
	ldreq r0, _037F94A8 @ =0x03806C1C
	streq r1, [r0, #0x2c]
	ldrne r0, [r7, #0x4c]
	strne r0, [r4, #0x4c]
	mov r0, r7
	str r6, [r7, #0x54]
	bl FUN_037F8DE8
	bl FUN_037F8E8C
_037F9494:
	mov r0, r5
	bl FUN_037FAD38
	mov r0, #1
_037F94A0:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037F94A8: .4byte 0x03806C1C
_037F94AC: .4byte 0x03806C50
	arm_func_end FUN_037F9408

	arm_func_start FUN_037F94B0
FUN_037F94B0: @ 0x037F94B0
	push {r4, r5, lr}
	sub sp, sp, #0x34
	mov r5, r0
	add r0, sp, #8
	bl FUN_037FA3C4
	ldr r0, _037F953C @ =0x03806C1C
	ldr r0, [r0, #8]
	ldr r0, [r0]
	str r0, [sp, #4]
	bl FUN_037FAD24
	ldr r1, _037F9540 @ =0x000082EA
	mov r4, r0
	umull r0, ip, r5, r1
	lsr r1, r0, #6
	ldr r3, [sp, #4]
	add r0, sp, #8
	str r0, [r3, #0x94]
	add r2, sp, #4
	str r2, [sp]
	ldr r3, _037F9544 @ =FUN_037F9548
	lsr r2, ip, #6
	orr r1, r1, ip, lsl #26
	bl FUN_037FA500
	mov r5, #0
	b _037F951C
_037F9514:
	mov r0, r5
	bl FUN_037F92D8
_037F951C:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _037F9514
	mov r0, r4
	bl FUN_037FAD38
	add sp, sp, #0x34
	pop {r4, r5, lr}
	bx lr
	.align 2, 0
_037F953C: .4byte 0x03806C1C
_037F9540: .4byte 0x000082EA
_037F9544: .4byte FUN_037F9548
	arm_func_end FUN_037F94B0

	arm_func_start FUN_037F9548
FUN_037F9548: @ 0x037F9548
	ldr r2, [r0]
	mov r1, #0
	str r1, [r0]
	ldr ip, _037F9564 @ =FUN_037F93B4
	mov r0, r2
	str r1, [r2, #0x94]
	bx ip
	.align 2, 0
_037F9564: .4byte FUN_037F93B4
	arm_func_end FUN_037F9548

	arm_func_start FUN_037F9568
FUN_037F9568: @ 0x037F9568
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_037FAD24
	ldr r1, _037F9590 @ =0x03806C1C
	ldr r4, [r1, #0x30]
	str r5, [r1, #0x30]
	bl FUN_037FAD38
	mov r0, r4
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F9590: .4byte 0x03806C1C
	arm_func_end FUN_037F9568

	arm_func_start FUN_037F9594
FUN_037F9594: @ 0x037F9594
	push {r4, lr}
	bl FUN_037FAD24
	ldr r2, _037F95C8 @ =0x03806C1C
	mvn r1, #0
	ldr r3, [r2, #4]
	cmp r3, r1
	addlo r1, r3, #1
	strlo r1, [r2, #4]
	movlo r4, r3
	bl FUN_037FAD38
	mov r0, r4
	pop {r4, lr}
	bx lr
	.align 2, 0
_037F95C8: .4byte 0x03806C1C
	arm_func_end FUN_037F9594

	arm_func_start FUN_037F95CC
FUN_037F95CC: @ 0x037F95CC
	push {r4, lr}
	bl FUN_037FAD24
	ldr r1, _037F9600 @ =0x03806C1C
	mov r4, #0
	ldr r3, [r1, #4]
	cmp r3, #0
	subne r2, r3, #1
	strne r2, [r1, #4]
	movne r4, r3
	bl FUN_037FAD38
	mov r0, r4
	pop {r4, lr}
	bx lr
	.align 2, 0
_037F9600: .4byte 0x03806C1C
	arm_func_end FUN_037F95CC

	arm_func_start FUN_037F9604
FUN_037F9604: @ 0x037F9604
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
	arm_func_end FUN_037F9604

	arm_func_start FUN_037F9670
FUN_037F9670: @ 0x037F9670
	add r1, r0, #0
	mrs r2, apsr
	str r2, [r1], #4
	mov r0, #0xd3
	msr cpsr_c, r0
	str sp, [r1, #0x40]
	msr cpsr_c, r2
	mov r0, #1
	stm r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr}
	add r0, pc, #0x8 @ =FUN_037F96A4
	str r0, [r1, #0x3c]
	mov r0, #0
	bx lr
	arm_func_end FUN_037F9670

	arm_func_start FUN_037F96A4
FUN_037F96A4: @ 0x037F96A4
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
	arm_func_end FUN_037F96A4

	arm_func_start FUN_037F96D0
FUN_037F96D0: @ 0x037F96D0
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
	arm_func_end FUN_037F96D0

	arm_func_start FUN_037F96F8
FUN_037F96F8: @ 0x037F96F8
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r6, r0
	mov r5, r1
	bl FUN_037FAD24
	mov r4, r0
	and r7, r7, #1
	b _037F9738
_037F9718:
	cmp r7, #0
	bne _037F9730
	mov r0, r4
	bl FUN_037FAD38
	mov r0, #0
	b _037F977C
_037F9730:
	mov r0, r6
	bl FUN_037F92D8
_037F9738:
	ldr r2, [r6, #0x1c]
	ldr r1, [r6, #0x14]
	cmp r1, r2
	ble _037F9718
	ldr r0, [r6, #0x18]
	add r0, r0, r2
	bl FUN_0380625C
	ldr r2, [r6, #0x10]
	add r0, r6, #8
	str r5, [r2, r1, lsl #2]
	ldr r1, [r6, #0x1c]
	add r1, r1, #1
	str r1, [r6, #0x1c]
	bl FUN_037F932C
	mov r0, r4
	bl FUN_037FAD38
	mov r0, #1
_037F977C:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_037F96F8

	arm_func_start FUN_037F9784
FUN_037F9784: @ 0x037F9784
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r6, r0
	mov r5, r1
	bl FUN_037FAD24
	mov r4, r0
	and r7, r7, #1
	b _037F97C4
_037F97A4:
	cmp r7, #0
	bne _037F97BC
	mov r0, r4
	bl FUN_037FAD38
	mov r0, #0
	b _037F9818
_037F97BC:
	add r0, r6, #8
	bl FUN_037F92D8
_037F97C4:
	ldr r0, [r6, #0x1c]
	cmp r0, #0
	beq _037F97A4
	cmp r5, #0
	ldrne r1, [r6, #0x10]
	ldrne r0, [r6, #0x18]
	ldrne r0, [r1, r0, lsl #2]
	strne r0, [r5]
	ldr r0, [r6, #0x18]
	ldr r1, [r6, #0x14]
	add r0, r0, #1
	bl FUN_0380625C
	str r1, [r6, #0x18]
	ldr r1, [r6, #0x1c]
	mov r0, r6
	sub r1, r1, #1
	str r1, [r6, #0x1c]
	bl FUN_037F932C
	mov r0, r4
	bl FUN_037FAD38
	mov r0, #1
_037F9818:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_037F9784

	arm_func_start FUN_037F9820
FUN_037F9820: @ 0x037F9820
	push {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	mov r7, r0
	mov r4, r1
	bl FUN_037FAD24
	mov r5, r0
	and r6, r6, #1
	b _037F9860
_037F9840:
	cmp r6, #0
	bne _037F9858
	mov r0, r5
	bl FUN_037FAD38
	mov r0, #0
	b _037F988C
_037F9858:
	add r0, r7, #8
	bl FUN_037F92D8
_037F9860:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	beq _037F9840
	cmp r4, #0
	ldrne r1, [r7, #0x10]
	ldrne r0, [r7, #0x18]
	ldrne r0, [r1, r0, lsl #2]
	strne r0, [r4]
	mov r0, r5
	bl FUN_037FAD38
	mov r0, #1
_037F988C:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_037F9820

	arm_func_start FUN_037F9894
FUN_037F9894: @ 0x037F9894
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end FUN_037F9894

	arm_func_start FUN_037F98AC
FUN_037F98AC: @ 0x037F98AC
	push {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl FUN_037FAD24
	ldr r1, _037F992C @ =0x03806C40
	mov r4, r0
	ldr r7, [r1, #4]
	mov r6, #0
_037F98C8:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _037F98F4
	str r7, [r5, #8]
	ldr r1, [r5, #0xc]
	mov r0, r7
	add r2, r1, #1
	mov r1, r5
	str r2, [r5, #0xc]
	bl FUN_037F99C8
	b _037F991C
_037F98F4:
	cmp r0, r7
	ldreq r0, [r5, #0xc]
	addeq r0, r0, #1
	streq r0, [r5, #0xc]
	beq _037F991C
	str r5, [r7, #0x68]
	mov r0, r5
	bl FUN_037F92D8
	str r6, [r7, #0x68]
	b _037F98C8
_037F991C:
	mov r0, r4
	bl FUN_037FAD38
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F992C: .4byte 0x03806C40
	arm_func_end FUN_037F98AC

	arm_func_start FUN_037F9930
FUN_037F9930: @ 0x037F9930
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_037FAD24
	ldr r1, _037F998C @ =0x03806C40
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _037F997C
	ldr r1, [r5, #0xc]
	subs r1, r1, #1
	str r1, [r5, #0xc]
	bne _037F997C
	mov r1, r5
	bl FUN_037F99EC
	mov r1, #0
	mov r0, r5
	str r1, [r5, #8]
	bl FUN_037F932C
_037F997C:
	mov r0, r4
	bl FUN_037FAD38
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F998C: .4byte 0x03806C40
	arm_func_end FUN_037F9930

	arm_func_start FUN_037F9990
FUN_037F9990: @ 0x037F9990
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	b _037F99B4
_037F99A0:
	add r0, r5, #0x6c
	bl FUN_037F8DB8
	str r4, [r0, #0xc]
	str r4, [r0, #8]
	bl FUN_037F932C
_037F99B4:
	ldr r0, [r5, #0x6c]
	cmp r0, #0
	bne _037F99A0
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_037F9990

	arm_func_start FUN_037F99C8
FUN_037F99C8: @ 0x037F99C8
	ldr r2, [r0, #0x70]
	cmp r2, #0
	streq r1, [r0, #0x6c]
	strne r1, [r2, #0x10]
	str r2, [r1, #0x14]
	mov r2, #0
	str r2, [r1, #0x10]
	str r1, [r0, #0x70]
	bx lr
	arm_func_end FUN_037F99C8

	arm_func_start FUN_037F99EC
FUN_037F99EC: @ 0x037F99EC
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r2, #0
	streq r1, [r0, #0x70]
	strne r1, [r2, #0x14]
	cmp r1, #0
	streq r2, [r0, #0x6c]
	strne r2, [r1, #0x10]
	bx lr
	arm_func_end FUN_037F99EC

	arm_func_start FUN_037F9A10
FUN_037F9A10: @ 0x037F9A10
	push {r3, lr}
	bl FUN_037F9A40
	bl FUN_037FB248
	bl FUN_037F89BC
	bl FUN_037F87BC
	bl FUN_037FA14C
	bl FUN_037FA370
	bl FUN_037F8F60
	bl FUN_037FADA0
	bl FUN_03803228
	pop {r3, lr}
	bx lr
	arm_func_end FUN_037F9A10

	arm_func_start FUN_037F9A40
FUN_037F9A40: @ 0x037F9A40
	push {r3, lr}
	ldr r1, _037F9A78 @ =0x03806D98
	ldr r0, [r1]
	cmp r0, #0
	bne _037F9A70
	mov r0, #1
	str r0, [r1]
	bl FUN_037F9A7C
	mov r0, #7
	bl FUN_037F9A7C
	mov r0, #8
	bl FUN_037F9A7C
_037F9A70:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037F9A78: .4byte 0x03806D98
	arm_func_end FUN_037F9A40

	arm_func_start FUN_037F9A7C
FUN_037F9A7C: @ 0x037F9A7C
	push {r4, lr}
	mov r4, r0
	bl FUN_037F9AE0
	lsl r1, r4, #2
	add r1, r1, #0x2700000
	add r1, r1, #0xff000
	str r0, [r1, #0xdc4]
	mov r0, r4
	bl FUN_037F9B5C
	lsl r1, r4, #2
	add r1, r1, #0x2700000
	add r1, r1, #0xff000
	str r0, [r1, #0xda0]
	pop {r4, lr}
	bx lr
	arm_func_end FUN_037F9A7C

	arm_func_start FUN_037F9AB8
FUN_037F9AB8: @ 0x037F9AB8
	lsl r0, r0, #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xdc4]
	bx lr
	arm_func_end FUN_037F9AB8

	arm_func_start FUN_037F9ACC
FUN_037F9ACC: @ 0x037F9ACC
	lsl r0, r0, #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xda0]
	bx lr
	arm_func_end FUN_037F9ACC

	arm_func_start FUN_037F9AE0
FUN_037F9AE0: @ 0x037F9AE0
	cmp r0, #1
	beq _037F9AFC
	cmp r0, #7
	beq _037F9B04
	cmp r0, #8
	beq _037F9B0C
	b _037F9B40
_037F9AFC:
	ldr r0, _037F9B48 @ =0x027FF000
	bx lr
_037F9B04:
	mov r0, #0x3800000
	bx lr
_037F9B0C:
	ldr r2, _037F9B4C @ =0x00000400
	ldr r0, _037F9B50 @ =0x0380FF80
	ldr r1, _037F9B54 @ =0x0380ADC0
	sub r2, r0, r2
	mov r0, #0x3800000
	cmp r1, #0x3800000
	movhi r0, r1
	ldr r1, _037F9B58 @ =0x00000400
	cmp r1, #0
	bxeq lr
	sublt r0, r0, r1
	subge r0, r2, r1
	bx lr
_037F9B40:
	mov r0, #0
	bx lr
	.align 2, 0
_037F9B48: .4byte 0x027FF000
_037F9B4C: .4byte 0x00000400
_037F9B50: .4byte 0x0380FF80
_037F9B54: .4byte 0x0380ADC0
_037F9B58: .4byte 0x00000400
	arm_func_end FUN_037F9AE0

	arm_func_start FUN_037F9B5C
FUN_037F9B5C: @ 0x037F9B5C
	cmp r0, #1
	beq _037F9B78
	cmp r0, #7
	beq _037F9B80
	cmp r0, #8
	beq _037F9B90
	b _037F9BA4
_037F9B78:
	ldr r0, _037F9BAC @ =0x027F9EF0
	bx lr
_037F9B80:
	ldr r0, _037F9BB0 @ =0x0380ADC0
	cmp r0, #0x3800000
	movhi r0, #0x3800000
	bx lr
_037F9B90:
	ldr r1, _037F9BB0 @ =0x0380ADC0
	mov r0, #0x3800000
	cmp r1, #0x3800000
	movhi r0, r1
	bx lr
_037F9BA4:
	mov r0, #0
	bx lr
	.align 2, 0
_037F9BAC: .4byte 0x027F9EF0
_037F9BB0: .4byte 0x0380ADC0
	arm_func_end FUN_037F9B5C

	arm_func_start FUN_037F9BB4
FUN_037F9BB4: @ 0x037F9BB4
	lsl r0, r0, #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	str r1, [r0, #0xda0]
	bx lr
	arm_func_end FUN_037F9BB4

	arm_func_start FUN_037F9BC8
FUN_037F9BC8: @ 0x037F9BC8
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
	arm_func_end FUN_037F9BC8

	arm_func_start FUN_037F9BF0
FUN_037F9BF0: @ 0x037F9BF0
	push {r3, lr}
	mov lr, r0
	mov ip, #0
	b _037F9C10
_037F9C00:
	cmp r1, lr
	bls _037F9C18
	mov ip, lr
	ldr lr, [lr, #4]
_037F9C10:
	cmp lr, #0
	bne _037F9C00
_037F9C18:
	stm r1, {ip, lr}
	cmp lr, #0
	beq _037F9C54
	str r1, [lr]
	ldr r3, [r1, #8]
	add r2, r1, r3
	cmp r2, lr
	bne _037F9C54
	ldr r2, [lr, #8]
	add r2, r3, r2
	str r2, [r1, #8]
	ldr lr, [lr, #4]
	str lr, [r1, #4]
	cmp lr, #0
	strne r1, [lr]
_037F9C54:
	cmp ip, #0
	beq _037F9C8C
	str r1, [ip, #4]
	ldr r2, [ip, #8]
	add r3, ip, r2
	cmp r3, r1
	bne _037F9C90
	ldr r1, [r1, #8]
	cmp lr, #0
	add r1, r2, r1
	str r1, [ip, #8]
	str lr, [ip, #4]
	strne ip, [lr]
	b _037F9C90
_037F9C8C:
	mov r0, r1
_037F9C90:
	pop {r3, lr}
	bx lr
	arm_func_end FUN_037F9BF0

	arm_func_start FUN_037F9C98
FUN_037F9C98: @ 0x037F9C98
	push {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, r1
	mov r7, r2
	bl FUN_037FAD24
	ldr r1, _037F9DA4 @ =0x03806D9C
	mov r6, r0
	ldr r1, [r1, r4, lsl #2]
	cmp r1, #0
	bne _037F9CCC
	bl FUN_037FAD38
	mov r0, #0
	b _037F9D9C
_037F9CCC:
	cmp r5, #0
	ldrlt r5, [r1]
	ldr r1, [r1, #0x10]
	mov r0, #0xc
	mla r4, r5, r0, r1
	ldr r0, [r4, #4]
	add r1, r7, #0x3f
	mov r5, r0
	bic r7, r1, #0x1f
	b _037F9D04
_037F9CF4:
	ldr r1, [r5, #8]
	cmp r7, r1
	ble _037F9D0C
	ldr r5, [r5, #4]
_037F9D04:
	cmp r5, #0
	bne _037F9CF4
_037F9D0C:
	cmp r5, #0
	bne _037F9D24
	mov r0, r6
	bl FUN_037FAD38
	mov r0, #0
	b _037F9D9C
_037F9D24:
	ldr r1, [r5, #8]
	sub r1, r1, r7
	cmp r1, #0x40
	bhs _037F9D44
	mov r1, r5
	bl FUN_037F9BC8
	str r0, [r4, #4]
	b _037F9D78
_037F9D44:
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
_037F9D78:
	ldr r1, [r4, #8]
	mov r0, #0
	stm r5, {r0, r1}
	cmp r1, #0
	strne r5, [r1]
	mov r0, r6
	str r5, [r4, #8]
	bl FUN_037FAD38
	add r0, r5, #0x20
_037F9D9C:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F9DA4: .4byte 0x03806D9C
	arm_func_end FUN_037F9C98

	arm_func_start FUN_037F9DA8
FUN_037F9DA8: @ 0x037F9DA8
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl FUN_037FAD24
	ldr r1, _037F9E10 @ =0x03806D9C
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
	bl FUN_037F9BC8
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	mov r1, r5
	bl FUN_037F9BF0
	str r0, [r7, #4]
	mov r0, r4
	bl FUN_037FAD38
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F9E10: .4byte 0x03806D9C
	arm_func_end FUN_037F9DA8

	arm_func_start FUN_037F9E14
FUN_037F9E14: @ 0x037F9E14
	push {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl FUN_037FAD24
	ldr r1, _037F9E44 @ =0x03806D9C
	ldr r1, [r1, r4, lsl #2]
	ldr r4, [r1]
	str r5, [r1]
	bl FUN_037FAD38
	mov r0, r4
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F9E44: .4byte 0x03806D9C
	arm_func_end FUN_037F9E14

	arm_func_start FUN_037F9E48
FUN_037F9E48: @ 0x037F9E48
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r5, r1
	mov r4, r2
	mov r6, r3
	bl FUN_037FAD24
	ldr r2, _037F9EEC @ =0x03806D9C
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
	b _037F9EAC
_037F9E90:
	mul r3, r7, r2
	ldr r6, [r5, #0x10]
	add r7, r7, #1
	str lr, [r6, r3]
	add r3, r6, r3
	str ip, [r3, #8]
	str ip, [r3, #4]
_037F9EAC:
	ldr r3, [r5, #4]
	cmp r7, r3
	blt _037F9E90
	mvn r2, #0
	str r2, [r5]
	ldr r3, [r5, #0x10]
	bic r2, r4, #0x1f
	add r1, r3, r1
	add r1, r1, #0x1f
	bic r1, r1, #0x1f
	str r1, [r5, #8]
	str r2, [r5, #0xc]
	bl FUN_037FAD38
	ldr r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F9EEC: .4byte 0x03806D9C
	arm_func_end FUN_037F9E48

	arm_func_start FUN_037F9EF0
FUN_037F9EF0: @ 0x037F9EF0
	push {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r6, r1
	mov r5, r2
	bl FUN_037FAD24
	ldr r2, _037F9F8C @ =0x03806D9C
	add r1, r6, #0x1f
	ldr lr, [r2, r4, lsl #2]
	bic r6, r1, #0x1f
	ldr r7, [lr, #4]
	bic r5, r5, #0x1f
	mov r4, #0
	mov r1, #0xc
	b _037F9F74
_037F9F28:
	mul r3, r4, r1
	ldr ip, [lr, #0x10]
	ldr r2, [ip, r3]
	add r3, ip, r3
	cmp r2, #0
	bge _037F9F70
	sub r1, r5, r6
	str r1, [r3]
	mov r2, #0
	str r2, [r6]
	str r2, [r6, #4]
	ldr r1, [r3]
	str r1, [r6, #8]
	str r6, [r3, #4]
	str r2, [r3, #8]
	bl FUN_037FAD38
	mov r0, r4
	b _037F9F84
_037F9F70:
	add r4, r4, #1
_037F9F74:
	cmp r4, r7
	blt _037F9F28
	bl FUN_037FAD38
	mvn r0, #0
_037F9F84:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F9F8C: .4byte 0x03806D9C
	arm_func_end FUN_037F9EF0

	arm_func_start FUN_037F9F90
FUN_037F9F90: @ 0x037F9F90
	push {r4, r5, r6, r7, r8, lr}
	mov r4, #0
	mov r8, r0
	mov r7, r1
	mov r5, r4
	sub r6, r4, #1
	bl FUN_037FAD24
	ldr r1, _037FA12C @ =0x03806D9C
	mvn r2, #0
	ldr r1, [r1, r8, lsl #2]
	cmp r7, r2
	ldr ip, [r1, #0x10]
	ldreq r7, [r1]
	cmp ip, #0
	beq _037FA11C
	cmp r7, #0
	blt _037FA11C
	ldr r2, [r1, #4]
	cmp r7, r2
	bge _037FA11C
	mov r2, #0xc
	mul r3, r7, r2
	ldr r2, [ip, r3]
	add r7, ip, r3
	cmp r2, #0
	blt _037FA11C
	ldr ip, [r7, #8]
	cmp ip, #0
	ldrne r3, [ip]
	cmpne r3, #0
	bne _037FA11C
	b _037FA070
_037FA010:
	ldr r3, [r1, #8]
	cmp r3, ip
	bhi _037FA11C
	ldr r3, [r1, #0xc]
	cmp ip, r3
	bhs _037FA11C
	tst ip, #0x1f
	bne _037FA11C
	ldr lr, [ip, #4]
	cmp lr, #0
	ldrne r3, [lr]
	cmpne r3, ip
	bne _037FA11C
	ldr r3, [ip, #8]
	cmp r3, #0x40
	blo _037FA11C
	tst r3, #0x1f
	bne _037FA11C
	add r4, r4, r3
	cmp r4, #0
	ble _037FA11C
	cmp r4, r2
	bgt _037FA11C
	mov ip, lr
_037FA070:
	cmp ip, #0
	bne _037FA010
	ldr lr, [r7, #4]
	cmp lr, #0
	ldrne r3, [lr]
	cmpne r3, #0
	bne _037FA11C
	b _037FA10C
_037FA090:
	ldr r3, [r1, #8]
	cmp r3, lr
	bhi _037FA11C
	ldr r3, [r1, #0xc]
	cmp lr, r3
	bhs _037FA11C
	tst lr, #0x1f
	bne _037FA11C
	ldr r7, [lr, #4]
	cmp r7, #0
	ldrne r3, [r7]
	cmpne r3, lr
	bne _037FA11C
	ldr ip, [lr, #8]
	cmp ip, #0x40
	blo _037FA11C
	tst ip, #0x1f
	bne _037FA11C
	cmp r7, #0
	beq _037FA0EC
	add r3, lr, ip
	cmp r3, r7
	bhs _037FA11C
_037FA0EC:
	add r4, r4, ip
	sub r3, ip, #0x20
	cmp r4, #0
	add r5, r5, r3
	ble _037FA11C
	cmp r4, r2
	bgt _037FA11C
	mov lr, r7
_037FA10C:
	cmp lr, #0
	bne _037FA090
	cmp r4, r2
	moveq r6, r5
_037FA11C:
	bl FUN_037FAD38
	mov r0, r6
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FA12C: .4byte 0x03806D9C
	arm_func_end FUN_037F9F90

	arm_func_start FUN_037FA130
FUN_037FA130: @ 0x037FA130
	ldr r1, _037FA148 @ =0x03806DC0
	mov r2, #1
	ldrh r3, [r1]
	orr r0, r3, r2, lsl r0
	strh r0, [r1]
	bx lr
	.align 2, 0
_037FA148: .4byte 0x03806DC0
	arm_func_end FUN_037FA130

	arm_func_start FUN_037FA14C
FUN_037FA14C: @ 0x037FA14C
	push {r3, lr}
	ldr r1, _037FA1BC @ =0x03806DC4
	ldrh r0, [r1]
	cmp r0, #0
	bne _037FA1B4
	mov r2, #1
	mov r0, #0
	strh r2, [r1]
	bl FUN_037FA130
	ldr r0, _037FA1BC @ =0x03806DC4
	mov r2, #0
	str r2, [r0, #8]
	ldr r3, _037FA1C0 @ =0x04000102
	str r2, [r0, #0xc]
	strh r2, [r3]
	ldr r1, _037FA1C4 @ =FUN_037FA1D8
	strh r2, [r3, #-2]
	mov r2, #0xc1
	mov r0, #8
	strh r2, [r3]
	bl FUN_037F87E0
	mov r0, #8
	bl FUN_037F8914
	ldr r0, _037FA1BC @ =0x03806DC4
	mov r1, #0
	str r1, [r0, #4]
_037FA1B4:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FA1BC: .4byte 0x03806DC4
_037FA1C0: .4byte 0x04000102
_037FA1C4: .4byte FUN_037FA1D8
	arm_func_end FUN_037FA14C

	arm_func_start FUN_037FA1C8
FUN_037FA1C8: @ 0x037FA1C8
	ldr r0, _037FA1D4 @ =0x03806DC4
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_037FA1D4: .4byte 0x03806DC4
	arm_func_end FUN_037FA1C8

	arm_func_start FUN_037FA1D8
FUN_037FA1D8: @ 0x037FA1D8
	ldr r0, _037FA230 @ =0x03806DC4
	mov r3, #0
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	adds r2, r2, #1
	str r2, [r0, #8]
	adc r1, r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _037FA21C
	ldr r2, _037FA234 @ =0x04000102
	mov r1, #0xc1
	strh r3, [r2]
	strh r3, [r2, #-2]
	strh r1, [r2]
	str r3, [r0, #4]
_037FA21C:
	ldr ip, _037FA238 @ =FUN_037F887C
	mov r0, #0
	ldr r1, _037FA23C @ =FUN_037FA1D8
	mov r2, r0
	bx ip
	.align 2, 0
_037FA230: .4byte 0x03806DC4
_037FA234: .4byte 0x04000102
_037FA238: .4byte FUN_037F887C
_037FA23C: .4byte FUN_037FA1D8
	arm_func_end FUN_037FA1D8

	arm_func_start FUN_037FA240
FUN_037FA240: @ 0x037FA240
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl FUN_037FAD24
	ldr lr, _037FA2D8 @ =0x04000100
	ldr r1, _037FA2DC @ =0x03806DC4
	ldrh r3, [lr]
	ldr r2, _037FA2E0 @ =0x0000FFFF
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
	beq _037FA2AC
	ldrh r1, [sp]
	tst r1, #0x8000
	bne _037FA2AC
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	adds r2, r2, #1
	adc r1, r1, #0
	str r2, [sp, #4]
	str r1, [sp, #8]
_037FA2AC:
	bl FUN_037FAD38
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
_037FA2D8: .4byte 0x04000100
_037FA2DC: .4byte 0x03806DC4
_037FA2E0: .4byte 0x0000FFFF
	arm_func_end FUN_037FA240

	arm_func_start FUN_037FA2E4
FUN_037FA2E4: @ 0x037FA2E4
	push {r3, r4, r5, lr}
	mov r4, r0
	bl FUN_037FA240
	ldr r3, _037FA360 @ =0x04000106
	mov r2, #0
	strh r2, [r3]
	ldr ip, [r4, #0xc]
	ldr r3, [r4, #0x10]
	subs r5, ip, r0
	sbc r4, r3, r1
	ldr r1, _037FA364 @ =FUN_037FA66C
	mov r0, #1
	bl FUN_037F887C
	subs r0, r5, #0
	mov r3, #0
	sbcs r0, r4, #0
	ldrlt r3, _037FA368 @ =0x0000FFFE
	blt _037FA340
	subs r0, r5, #0x10000
	sbcs r0, r4, r3
	mvnlt r0, r5
	lsllt r0, r0, #0x10
	lsrlt r3, r0, #0x10
_037FA340:
	ldr r2, _037FA36C @ =0x04000104
	mov r1, #0xc1
	strh r3, [r2]
	mov r0, #0x10
	strh r1, [r2, #2]
	bl FUN_037F8914
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FA360: .4byte 0x04000106
_037FA364: .4byte FUN_037FA66C
_037FA368: .4byte 0x0000FFFE
_037FA36C: .4byte 0x04000104
	arm_func_end FUN_037FA2E4

	arm_func_start FUN_037FA370
FUN_037FA370: @ 0x037FA370
	push {r3, lr}
	ldr r1, _037FA3B0 @ =0x03806DD4
	ldrh r0, [r1]
	cmp r0, #0
	bne _037FA3A8
	mov r0, #1
	strh r0, [r1]
	bl FUN_037FA130
	ldr r1, _037FA3B0 @ =0x03806DD4
	mov r2, #0
	str r2, [r1, #4]
	mov r0, #0x10
	str r2, [r1, #8]
	bl FUN_037F894C
_037FA3A8:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FA3B0: .4byte 0x03806DD4
	arm_func_end FUN_037FA370

	arm_func_start FUN_037FA3B4
FUN_037FA3B4: @ 0x037FA3B4
	ldr r0, _037FA3C0 @ =0x03806DD4
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_037FA3C0: .4byte 0x03806DD4
	arm_func_end FUN_037FA3B4

	arm_func_start FUN_037FA3C4
FUN_037FA3C4: @ 0x037FA3C4
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	bx lr
	arm_func_end FUN_037FA3C4

	arm_func_start FUN_037FA3D4
FUN_037FA3D4: @ 0x037FA3D4
	push {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0x20]
	ldr r3, [r8, #0x1c]
	cmp r0, #0
	mov r7, r1
	mov r6, r2
	cmpeq r3, #0
	beq _037FA448
	bl FUN_037FA240
	ldr r6, [r8, #0x28]
	ldr r7, [r8, #0x24]
	cmp r6, r1
	cmpeq r7, r0
	bhs _037FA448
	ldr r5, [r8, #0x1c]
	ldr r4, [r8, #0x20]
	subs r0, r0, r7
	mov r2, r5
	mov r3, r4
	sbc r1, r1, r6
	bl FUN_03806214
	adds r2, r0, #1
	adc r0, r1, #0
	umull r3, r1, r5, r2
	mla r1, r5, r0, r1
	mla r1, r4, r2, r1
	adds r7, r7, r3
	adc r6, r6, r1
_037FA448:
	str r7, [r8, #0xc]
	ldr r0, _037FA4FC @ =0x03806DD4
	str r6, [r8, #0x10]
	mov r2, #0
	ldr r5, [r0, #4]
	mov r1, r2
	b _037FA4B8
_037FA464:
	ldr r3, [r5, #0xc]
	ldr r0, [r5, #0x10]
	subs r4, r7, r3
	sbc r3, r6, r0
	subs r0, r4, r1
	sbcs r0, r3, r2
	bge _037FA4B4
	ldr r0, [r5, #0x14]
	str r0, [r8, #0x14]
	str r8, [r5, #0x14]
	str r5, [r8, #0x18]
	ldr r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	bne _037FA4F4
	ldr r1, _037FA4FC @ =0x03806DD4
	mov r0, r8
	str r8, [r1, #4]
	bl FUN_037FA2E4
	b _037FA4F4
_037FA4B4:
	ldr r5, [r5, #0x18]
_037FA4B8:
	cmp r5, #0
	bne _037FA464
	ldr r1, _037FA4FC @ =0x03806DD4
	mov r0, #0
	str r0, [r8, #0x18]
	ldr r0, [r1, #8]
	str r8, [r1, #8]
	str r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	bne _037FA4F4
	str r8, [r1, #8]
	mov r0, r8
	str r8, [r1, #4]
	bl FUN_037FA2E4
_037FA4F4:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FA4FC: .4byte 0x03806DD4
	arm_func_end FUN_037FA3D4

	arm_func_start FUN_037FA500
FUN_037FA500: @ 0x037FA500
	push {r3, r4, r5, r6, r7, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	beq _037FA524
	ldr r0, [r6]
	cmp r0, #0
	beq _037FA528
_037FA524:
	bl FUN_037FAE94
_037FA528:
	bl FUN_037FAD24
	mov r1, #0
	str r1, [r6, #0x1c]
	str r1, [r6, #0x20]
	str r7, [r6]
	ldr r1, [sp, #0x18]
	mov r7, r0
	str r1, [r6, #4]
	bl FUN_037FA240
	adds r3, r5, r0
	adc r2, r4, r1
	mov r0, r6
	mov r1, r3
	bl FUN_037FA3D4
	mov r0, r7
	bl FUN_037FAD38
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_037FA500

	arm_func_start FUN_037FA570
FUN_037FA570: @ 0x037FA570
	push {r4, r5, r6, r7, r8, lr}
	ldr r5, [sp, #0x18]
	movs r4, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	beq _037FA598
	ldr r0, [r4]
	cmp r0, #0
	beq _037FA59C
_037FA598:
	bl FUN_037FAE94
_037FA59C:
	bl FUN_037FAD24
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
	bl FUN_037FA3D4
	mov r0, r5
	bl FUN_037FAD38
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end FUN_037FA570

	arm_func_start FUN_037FA5E4
FUN_037FA5E4: @ 0x037FA5E4
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_037FAD24
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _037FA608
	bl FUN_037FAD38
	b _037FA660
_037FA608:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	ldreq r2, [r5, #0x14]
	ldreq r1, _037FA668 @ =0x03806DD4
	streq r2, [r1, #8]
	ldrne r1, [r5, #0x14]
	strne r1, [r0, #0x14]
	ldr r1, [r5, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _037FA648
	ldr r1, _037FA668 @ =0x03806DD4
	cmp r0, #0
	str r0, [r1, #4]
	beq _037FA648
	bl FUN_037FA2E4
_037FA648:
	mov r1, #0
	str r1, [r5]
	str r1, [r5, #0x1c]
	mov r0, r4
	str r1, [r5, #0x20]
	bl FUN_037FAD38
_037FA660:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FA668: .4byte 0x03806DD4
	arm_func_end FUN_037FA5E4

	arm_func_start FUN_037FA66C
FUN_037FA66C: @ 0x037FA66C
	push {r0, lr}
	bl FUN_037FA67C
	pop {r0, lr}
	bx lr
	arm_func_end FUN_037FA66C

	arm_func_start FUN_037FA67C
FUN_037FA67C: @ 0x037FA67C
	push {r3, r4, r5, lr}
	ldr r1, _037FA764 @ =0x04000106
	mov r2, #0
	mov r0, #0x10
	strh r2, [r1]
	bl FUN_037F894C
	ldr r1, _037FA768 @ =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #0x10
	str r0, [r1]
	bl FUN_037FA240
	ldr r2, _037FA76C @ =0x03806DD4
	ldr r4, [r2, #4]
	cmp r4, #0
	beq _037FA75C
	ldr r3, [r4, #0x10]
	ldr ip, [r4, #0xc]
	cmp r1, r3
	cmpeq r0, ip
	bhs _037FA6D8
	mov r0, r4
	bl FUN_037FA2E4
	b _037FA75C
_037FA6D8:
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
	beq _037FA720
	ldr r0, [r4, #4]
	mov lr, pc
	bx r5
_037FA720:
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	cmpeq r1, #0
	mov r1, #0
	beq _037FA748
	mov r0, r4
	mov r2, r1
	str r5, [r4]
	bl FUN_037FA3D4
_037FA748:
	ldr r0, _037FA76C @ =0x03806DD4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _037FA75C
	bl FUN_037FA2E4
_037FA75C:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FA764: .4byte 0x04000106
_037FA768: .4byte 0x0380FFF8
_037FA76C: .4byte 0x03806DD4
	arm_func_end FUN_037FA67C

	arm_func_start FUN_037FA770
FUN_037FA770: @ 0x037FA770
	push {r3, lr}
	ldr r1, _037FA7B8 @ =0x03806DE0
	ldrh r0, [r1]
	cmp r0, #0
	bne _037FA7B0
	mov r0, #1
	strh r0, [r1]
	mov r2, #0
	str r2, [r1, #0xc]
	mov r0, #4
	str r2, [r1, #0x10]
	bl FUN_037F894C
	ldr r0, _037FA7B8 @ =0x03806DE0
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_037FA7B0:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FA7B8: .4byte 0x03806DE0
	arm_func_end FUN_037FA770

	arm_func_start FUN_037FA7BC
FUN_037FA7BC: @ 0x037FA7BC
	ldr r0, _037FA7C8 @ =0x03806DE0
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_037FA7C8: .4byte 0x03806DE0
	arm_func_end FUN_037FA7BC

	arm_func_start FUN_037FA7CC
FUN_037FA7CC: @ 0x037FA7CC
	push {r3, lr}
	ldr r1, _037FA86C @ =0x03806DE0
	ldr r3, [r1, #0xc]
	b _037FA830
_037FA7DC:
	ldr r2, [r0, #0xc]
	ldr r1, [r3, #0xc]
	cmp r1, r2
	blo _037FA82C
	bne _037FA800
	ldrsh r2, [r3, #0x10]
	ldrsh r1, [r0, #0x10]
	cmp r2, r1
	ble _037FA82C
_037FA800:
	ldr r1, [r3, #0x14]
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	str r0, [r3, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _037FA864
	ldr r1, _037FA86C @ =0x03806DE0
	str r0, [r1, #0xc]
	bl FUN_037FA9DC
	b _037FA864
_037FA82C:
	ldr r3, [r3, #0x18]
_037FA830:
	cmp r3, #0
	bne _037FA7DC
	ldr r1, _037FA86C @ =0x03806DE0
	mov r2, #0
	ldr r3, [r1, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r0, [r1, #0x10]
	cmp r3, #0
	strne r0, [r3, #0x18]
	bne _037FA864
	str r0, [r1, #0xc]
	bl FUN_037FA9DC
_037FA864:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FA86C: .4byte 0x03806DE0
	arm_func_end FUN_037FA7CC

	arm_func_start FUN_037FA870
FUN_037FA870: @ 0x037FA870
	cmp r0, #0
	bxeq lr
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x14]
	cmp r2, #0
	ldreq r0, _037FA8A4 @ =0x03806DE0
	strne r1, [r2, #0x14]
	streq r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, _037FA8A4 @ =0x03806DE0
	strne r2, [r1, #0x18]
	streq r2, [r0, #0xc]
	bx lr
	.align 2, 0
_037FA8A4: .4byte 0x03806DE0
	arm_func_end FUN_037FA870

	arm_func_start FUN_037FA8A8
FUN_037FA8A8: @ 0x037FA8A8
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end FUN_037FA8A8

	arm_func_start FUN_037FA8BC
FUN_037FA8BC: @ 0x037FA8BC
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl FUN_037FAD24
	mov r4, r0
	cmp r8, #0
	beq _037FA8EC
	ldr r0, [r8]
	cmp r0, #0
	beq _037FA8F0
_037FA8EC:
	bl FUN_037FAE94
_037FA8F0:
	ldr r0, _037FA948 @ =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl FUN_037FACCC
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
	bl FUN_037FA7CC
	mov r0, r4
	bl FUN_037FAD38
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FA948: .4byte 0x04000006
	arm_func_end FUN_037FA8BC

	arm_func_start FUN_037FA94C
FUN_037FA94C: @ 0x037FA94C
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl FUN_037FAD24
	mov r4, r0
	cmp r8, #0
	beq _037FA97C
	ldr r0, [r8]
	cmp r0, #0
	beq _037FA980
_037FA97C:
	bl FUN_037FAE94
_037FA980:
	ldr r0, _037FA9D8 @ =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl FUN_037FACCC
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
	bl FUN_037FA7CC
	mov r0, r4
	bl FUN_037FAD38
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FA9D8: .4byte 0x04000006
	arm_func_end FUN_037FA94C

	arm_func_start FUN_037FA9DC
FUN_037FA9DC: @ 0x037FA9DC
	push {r4, lr}
	ldr r1, _037FAA30 @ =FUN_037FAB1C
	mov r4, r0
	mov r0, #4
	bl FUN_037F87E0
	ldrsh r3, [r4, #0x10]
	ldr r2, _037FAA34 @ =0x04000004
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
	bl FUN_037F8914
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FAA30: .4byte FUN_037FAB1C
_037FAA34: .4byte 0x04000004
	arm_func_end FUN_037FA9DC

	arm_func_start FUN_037FAA38
FUN_037FAA38: @ 0x037FAA38
	push {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	bne _037FAA4C
	bl FUN_037FAE94
_037FAA4C:
	cmp r5, #0
	strne r4, [r5, #8]
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_037FAA38

	arm_func_start FUN_037FAA5C
FUN_037FAA5C: @ 0x037FAA5C
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_037FAD24
	mov r1, #1
	str r1, [r5, #0x24]
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _037FAA88
	bl FUN_037FAD38
	b _037FAAA0
_037FAA88:
	mov r0, r5
	bl FUN_037FA870
	mov r1, #0
	mov r0, r4
	str r1, [r5]
	bl FUN_037FAD38
_037FAAA0:
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_037FAA5C

	arm_func_start FUN_037FAAA8
FUN_037FAAA8: @ 0x037FAAA8
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl FUN_037FAD24
	mov r5, r0
	cmp r7, #0
	bne _037FAAC4
	bl FUN_037FAE94
_037FAAC4:
	ldr r0, _037FAB18 @ =0x03806DE0
	mov r4, #0
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldrne r6, [r0, #0x18]
	moveq r6, #0
	b _037FAB00
_037FAAE0:
	ldr r1, [r0, #8]
	cmp r1, r7
	bne _037FAAF0
	bl FUN_037FAA5C
_037FAAF0:
	mov r0, r6
	cmp r6, #0
	ldrne r6, [r6, #0x18]
	moveq r6, r4
_037FAB00:
	cmp r0, #0
	bne _037FAAE0
	mov r0, r5
	bl FUN_037FAD38
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FAB18: .4byte 0x03806DE0
	arm_func_end FUN_037FAAA8

	arm_func_start FUN_037FAB1C
FUN_037FAB1C: @ 0x037FAB1C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #4
	bl FUN_037F894C
	ldr r2, _037FACBC @ =0x04000004
	ldr r1, _037FACC0 @ =0x0380FFF8
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
	bl FUN_037FACCC
	ldr sl, _037FACC4 @ =0x04000006
	mov r6, #0
	ldr r5, _037FACC8 @ =0x03806DE0
	sub r7, sl, #2
	mov fp, #1
	mov r8, r6
	b _037FACA8
_037FAB84:
	ldrh sb, [sl]
	mov r0, sb
	bl FUN_037FACCC
	ldrsh r1, [r4, #0x10]
	ldr r2, [r4, #0xc]
	sub r1, sb, r1
	mov sb, r0
	subs r0, sb, r2
	bmi _037FABB8
	cmp r0, #0
	bne _037FABC0
	cmp r1, #0
	bge _037FABC0
_037FABB8:
	mov r0, r8
	b _037FABDC
_037FABC0:
	cmp r1, #0
	addlt r0, r1, #7
	addlt r1, r0, #0x100
	ldrsh r0, [r4, #0x12]
	cmp r1, r0
	movle r0, fp
	movgt r0, #2
_037FABDC:
	cmp r0, #0
	beq _037FABF8
	cmp r0, #1
	beq _037FAC34
	cmp r0, #2
	beq _037FAC8C
	b _037FACA8
_037FABF8:
	mov r0, r4
	bl FUN_037FA9DC
	ldrh r1, [sl]
	ldrsh r0, [r4, #0x10]
	cmp r0, r1
	ldreq r0, [r4, #0xc]
	cmpeq r0, sb
	bne _037FACB4
	mov r0, #4
	bl FUN_037F894C
	ldrh r1, [r7]
	mov r0, #4
	bic r1, r1, #0x20
	strh r1, [r7]
	bl FUN_037F8988
_037FAC34:
	ldr sb, [r4]
	mov r0, r4
	bl FUN_037FA870
	str r6, [r4]
	cmp sb, #0
	beq _037FAC58
	ldr r0, [r4, #4]
	mov lr, pc
	bx sb
_037FAC58:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _037FACA8
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _037FACA8
	str sb, [r4]
	ldr r1, [r5, #8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r4, #0xc]
	bl FUN_037FA7CC
	b _037FACA8
_037FAC8C:
	mov r0, r4
	bl FUN_037FA870
	ldr r1, [r5, #8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r4, #0xc]
	bl FUN_037FA7CC
_037FACA8:
	ldr r4, [r5, #0xc]
	cmp r4, #0
	bne _037FAB84
_037FACB4:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FACBC: .4byte 0x04000004
_037FACC0: .4byte 0x0380FFF8
_037FACC4: .4byte 0x04000006
_037FACC8: .4byte 0x03806DE0
	arm_func_end FUN_037FAB1C

	arm_func_start FUN_037FACCC
FUN_037FACCC: @ 0x037FACCC
	push {r4, lr}
	mov r4, r0
	bl FUN_037FAD24
	ldr r1, _037FAD0C @ =0x03806DE0
	ldr r2, [r1, #4]
	cmp r4, r2
	ldrlt r2, [r1, #8]
	addlt r2, r2, #1
	strlt r2, [r1, #8]
	ldr r1, _037FAD0C @ =0x03806DE0
	str r4, [r1, #4]
	bl FUN_037FAD38
	ldr r0, _037FAD0C @ =0x03806DE0
	ldr r0, [r0, #8]
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FAD0C: .4byte 0x03806DE0
	arm_func_end FUN_037FACCC

	arm_func_start FUN_037FAD10
FUN_037FAD10: @ 0x037FAD10
	mrs r0, apsr
	bic r1, r0, #0x80
	msr cpsr_c, r1
	and r0, r0, #0x80
	bx lr
	arm_func_end FUN_037FAD10

	arm_func_start FUN_037FAD24
FUN_037FAD24: @ 0x037FAD24
	mrs r0, apsr
	orr r1, r0, #0x80
	msr cpsr_c, r1
	and r0, r0, #0x80
	bx lr
	arm_func_end FUN_037FAD24

	arm_func_start FUN_037FAD38
FUN_037FAD38: @ 0x037FAD38
	mrs r1, apsr
	bic r2, r1, #0x80
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #0x80
	bx lr
	arm_func_end FUN_037FAD38

	arm_func_start FUN_037FAD50
FUN_037FAD50: @ 0x037FAD50
	mrs r0, apsr
	orr r1, r0, #0xc0
	msr cpsr_c, r1
	and r0, r0, #0xc0
	bx lr
	arm_func_end FUN_037FAD50

	arm_func_start FUN_037FAD64
FUN_037FAD64: @ 0x037FAD64
	mrs r1, apsr
	bic r2, r1, #0xc0
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #0xc0
	bx lr
	arm_func_end FUN_037FAD64

	arm_func_start FUN_037FAD7C
FUN_037FAD7C: @ 0x037FAD7C
	mrs r0, apsr
	and r0, r0, #0x1f
	bx lr
	arm_func_end FUN_037FAD7C

	arm_func_start FUN_037FAD88
FUN_037FAD88: @ 0x037FAD88
	ldr ip, _037FAD9C @ =FUN_038008A8
	asr r1, r0, #1
	add r0, r0, r1, lsr #30
	asr r0, r0, #2
	bx ip
	.align 2, 0
_037FAD9C: .4byte FUN_038008A8
	arm_func_end FUN_037FAD88

	arm_func_start FUN_037FADA0
FUN_037FADA0: @ 0x037FADA0
	push {r3, lr}
	ldr r2, _037FADD0 @ =0x03806DF4
	ldrh r0, [r2]
	cmp r0, #0
	bne _037FADC8
	ldr r1, _037FADD4 @ =FUN_037FADE8
	mov r3, #1
	mov r0, #0xc
	strh r3, [r2]
	bl FUN_037FB330
_037FADC8:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FADD0: .4byte 0x03806DF4
_037FADD4: .4byte FUN_037FADE8
	arm_func_end FUN_037FADA0

	arm_func_start FUN_037FADD8
FUN_037FADD8: @ 0x037FADD8
	ldr r0, _037FADE4 @ =0x03806DF4
	ldrh r0, [r0, #2]
	bx lr
	.align 2, 0
_037FADE4: .4byte 0x03806DF4
	arm_func_end FUN_037FADD8

	arm_func_start FUN_037FADE8
FUN_037FADE8: @ 0x037FADE8
	push {r3, lr}
	and r0, r1, #0x7f00
	lsl r0, r0, #8
	lsr r0, r0, #0x10
	cmp r0, #0x10
	ldreq r0, _037FAE18 @ =0x03806DF4
	moveq r1, #1
	strheq r1, [r0, #2]
	beq _037FAE10
	bl FUN_037FAE94
_037FAE10:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FAE18: .4byte 0x03806DF4
	arm_func_end FUN_037FADE8

	arm_func_start FUN_037FAE1C
FUN_037FAE1C: @ 0x037FAE1C
	push {r4, r5, r6, lr}
	mov r0, #0
	bl FUN_037FAF18
	mov r0, #1
	bl FUN_037FAF18
	mov r0, #2
	bl FUN_037FAF18
	mov r0, #3
	bl FUN_037FAF18
	mov r0, #0x40000
	bl FUN_037F88C8
	mvn r0, #0
	bl FUN_037F8988
	bl FUN_037FB648
	mov r6, #0xc
	mov r5, #0x1000
	mov r4, #0
_037FAE60:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	bne _037FAE60
	ldr r0, _037FAE90 @ =0x04000208
	mov r1, #0
	strh r1, [r0]
	bl FUN_03806854
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FAE90: .4byte 0x04000208
	arm_func_end FUN_037FAE1C

	arm_func_start FUN_037FAE94
FUN_037FAE94: @ 0x037FAE94
	push {r3, lr}
	mov r0, #0
	bl FUN_038034B0
_037FAEA0:
	bl FUN_037FAD24
	bl FUN_037F847C
	b _037FAEA0
	arm_func_end FUN_037FAE94

	arm_func_start FUN_037FAEAC
FUN_037FAEAC: @ 0x037FAEAC
	push {r4, lr}
	mov r4, r0
	bl FUN_037FAD24
	add r1, r4, r4, lsl #1
	add r1, r1, #2
	lsl r1, r1, #2
	add r1, r1, #0xb0
	add r2, r1, #0x4000000
_037FAECC:
	ldr r1, [r2]
	tst r1, #-0x80000000
	bne _037FAECC
	cmp r4, #0
	bne _037FAF08
	mov r1, #0xc
	mul r1, r4, r1
	add r2, r1, #0x4000000
	mov r3, #0
	add r1, r1, #0xb0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _037FAF14 @ =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_037FAF08:
	bl FUN_037FAD38
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FAF14: .4byte 0x81400001
	arm_func_end FUN_037FAEAC

	arm_func_start FUN_037FAF18
FUN_037FAF18: @ 0x037FAF18
	push {r4, lr}
	mov r4, r0
	bl FUN_037FAD24
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
	bne _037FAF88
	mov r1, #0xc
	mul r1, r4, r1
	add r2, r1, #0x4000000
	mov r3, #0
	add r1, r1, #0xb0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _037FAF94 @ =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_037FAF88:
	bl FUN_037FAD38
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FAF94: .4byte 0x81400001
	arm_func_end FUN_037FAF18

	arm_func_start FUN_037FAF98
FUN_037FAF98: @ 0x037FAF98
	mov r3, #0
_037FAF9C:
	cmp r3, r2
	strhlt r0, [r1, r3]
	addlt r3, r3, #2
	blt _037FAF9C
	bx lr
	arm_func_end FUN_037FAF98

	arm_func_start FUN_037FAFB0
FUN_037FAFB0: @ 0x037FAFB0
	mov ip, #0
_037FAFB4:
	cmp ip, r2
	ldrhlt r3, [r0, ip]
	strhlt r3, [r1, ip]
	addlt ip, ip, #2
	blt _037FAFB4
	bx lr
	arm_func_end FUN_037FAFB0

	arm_func_start FUN_037FAFCC
FUN_037FAFCC: @ 0x037FAFCC
	add ip, r1, r2
_037FAFD0:
	cmp r1, ip
	stmlt r1!, {r0}
	blt _037FAFD0
	bx lr
	arm_func_end FUN_037FAFCC

	arm_func_start FUN_037FAFE0
FUN_037FAFE0: @ 0x037FAFE0
	add ip, r1, r2
_037FAFE4:
	cmp r1, ip
	ldmlt r0!, {r2}
	stmlt r1!, {r2}
	blt _037FAFE4
	bx lr
	arm_func_end FUN_037FAFE0

	arm_func_start FUN_037FAFF8
FUN_037FAFF8: @ 0x037FAFF8
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
_037FB024:
	cmp r1, ip
	stmlt r1!, {r0, r2, r3, r4, r5, r6, r7, r8}
	blt _037FB024
_037FB030:
	cmp r1, sb
	stmlt r1!, {r0}
	blt _037FB030
	pop {r4, r5, r6, r7, r8, sb}
	bx lr
	arm_func_end FUN_037FAFF8

	arm_func_start FUN_037FB044
FUN_037FB044: @ 0x037FB044
	push {r4, r5, r6, r7, r8, sb, sl}
	add sl, r1, r2
	lsr ip, r2, #5
	add ip, r1, ip, lsl #5
_037FB054:
	cmp r1, ip
	ldmlt r0!, {r2, r3, r4, r5, r6, r7, r8, sb}
	stmlt r1!, {r2, r3, r4, r5, r6, r7, r8, sb}
	blt _037FB054
_037FB064:
	cmp r1, sl
	ldmlt r0!, {r2}
	stmlt r1!, {r2}
	blt _037FB064
	pop {r4, r5, r6, r7, r8, sb, sl}
	bx lr
	arm_func_end FUN_037FB044

	arm_func_start FUN_037FB07C
FUN_037FB07C: @ 0x037FB07C
	cmp r2, #0
	bxeq lr
	tst r0, #1
	beq _037FB0A8
	ldrh ip, [r0, #-1]
	and ip, ip, #0xff
	orr r3, ip, r1, lsl #8
	strh r3, [r0, #-1]
	add r0, r0, #1
	subs r2, r2, #1
	bxeq lr
_037FB0A8:
	cmp r2, #2
	blo _037FB0F0
	orr r1, r1, r1, lsl #8
	tst r0, #2
	beq _037FB0C8
	strh r1, [r0], #2
	subs r2, r2, #2
	bxeq lr
_037FB0C8:
	orr r1, r1, r1, lsl #16
	bics r3, r2, #3
	beq _037FB0E8
	sub r2, r2, r3
	add ip, r3, r0
_037FB0DC:
	str r1, [r0], #4
	cmp r0, ip
	blo _037FB0DC
_037FB0E8:
	tst r2, #2
	strhne r1, [r0], #2
_037FB0F0:
	tst r2, #1
	bxeq lr
	ldrh r3, [r0]
	and r3, r3, #0xff00
	and r1, r1, #0xff
	orr r1, r1, r3
	strh r1, [r0]
	bx lr
	arm_func_end FUN_037FB07C

	arm_func_start FUN_037FB110
FUN_037FB110: @ 0x037FB110
	cmp r2, #0
	bxeq lr
	tst r1, #1
	beq _037FB150
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
_037FB150:
	eor ip, r1, r0
	tst ip, #1
	beq _037FB1A4
	bic r0, r0, #1
	ldrh ip, [r0], #2
	lsr r3, ip, #8
	subs r2, r2, #2
	blo _037FB188
_037FB170:
	ldrh ip, [r0], #2
	orr ip, r3, ip, lsl #8
	strh ip, [r1], #2
	lsr r3, ip, #0x10
	subs r2, r2, #2
	bhs _037FB170
_037FB188:
	tst r2, #1
	bxeq lr
	ldrh ip, [r1]
	and ip, ip, #0xff00
	orr ip, ip, r3
	strh ip, [r1]
	bx lr
_037FB1A4:
	tst ip, #2
	beq _037FB1D0
	bics r3, r2, #1
	beq _037FB21C
	sub r2, r2, r3
	add ip, r3, r1
_037FB1BC:
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	cmp r1, ip
	blo _037FB1BC
	b _037FB21C
_037FB1D0:
	cmp r2, #2
	blo _037FB21C
	tst r1, #2
	beq _037FB1F0
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	subs r2, r2, #2
	bxeq lr
_037FB1F0:
	bics r3, r2, #3
	beq _037FB210
	sub r2, r2, r3
	add ip, r3, r1
_037FB200:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, ip
	blo _037FB200
_037FB210:
	tst r2, #2
	ldrhne r3, [r0], #2
	strhne r3, [r1], #2
_037FB21C:
	tst r2, #1
	bxeq lr
	ldrh r2, [r1]
	ldrh r0, [r0]
	and r2, r2, #0xff00
	and r0, r0, #0xff
	orr r0, r2, r0
	strh r0, [r1]
	bx lr
	arm_func_end FUN_037FB110

	arm_func_start FUN_037FB240
FUN_037FB240: @ 0x037FB240
	.word 0xE1010090
	bx lr
	arm_func_end FUN_037FB240

	arm_func_start FUN_037FB248
FUN_037FB248: @ 0x037FB248
	ldr ip, _037FB250 @ =FUN_037FB254
	bx ip
	.align 2, 0
_037FB250: .4byte FUN_037FB254
	arm_func_end FUN_037FB248

	arm_func_start FUN_037FB254
FUN_037FB254: @ 0x037FB254
	push {r4, r5, r6, r7, r8, lr}
	bl FUN_037FAD24
	ldr r1, _037FB314 @ =0x03806DF8
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _037FB304
	ldr r0, _037FB318 @ =0x027FFC00
	mov r2, #1
	strh r2, [r1]
	mov r2, #0
	str r2, [r0, #0x38c]
	ldr r0, _037FB31C @ =0x03806DFC
	mov r1, r2
_037FB28C:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0x20
	blt _037FB28C
	ldr r2, _037FB320 @ =0x0000C408
	ldr r1, _037FB324 @ =0x04000184
	mov r0, #0x40000
	strh r2, [r1]
	bl FUN_037F8988
	ldr r1, _037FB328 @ =FUN_037FB43C
	mov r0, #0x40000
	bl FUN_037F87E0
	mov r0, #0x40000
	bl FUN_037F8914
	mov r5, #8
	ldr r8, _037FB32C @ =0x04000180
	mov r6, r5
	mov r7, #0x3e8
	b _037FB2FC
_037FB2D8:
	lsl r0, r5, #8
	strh r0, [r8]
	mov r0, r7
	bl FUN_037FAD88
	ldrh r0, [r8]
	and r0, r0, #0xf
	cmp r0, r5
	movne r5, r6
	sub r5, r5, #1
_037FB2FC:
	cmp r5, #0
	bge _037FB2D8
_037FB304:
	mov r0, r4
	bl FUN_037FAD38
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FB314: .4byte 0x03806DF8
_037FB318: .4byte 0x027FFC00
_037FB31C: .4byte 0x03806DFC
_037FB320: .4byte 0x0000C408
_037FB324: .4byte 0x04000184
_037FB328: .4byte FUN_037FB43C
_037FB32C: .4byte 0x04000180
	arm_func_end FUN_037FB254

	arm_func_start FUN_037FB330
FUN_037FB330: @ 0x037FB330
	push {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl FUN_037FAD24
	ldr r1, _037FB378 @ =0x03806DFC
	ldr r3, _037FB37C @ =0x027FFC00
	str r5, [r1, r4, lsl #2]
	cmp r5, #0
	ldrne r2, [r3, #0x38c]
	mov r1, #1
	orrne r1, r2, r1, lsl r4
	ldreq r2, [r3, #0x38c]
	mvneq r1, r1, lsl r4
	andeq r1, r2, r1
	str r1, [r3, #0x38c]
	bl FUN_037FAD38
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FB378: .4byte 0x03806DFC
_037FB37C: .4byte 0x027FFC00
	arm_func_end FUN_037FB330

	arm_func_start FUN_037FB380
FUN_037FB380: @ 0x037FB380
	ldr r2, _037FB3A0 @ =0x027FFC00
	mov r3, #1
	add r1, r2, r1, lsl #2
	ldr r1, [r1, #0x388]
	tst r1, r3, lsl r0
	moveq r3, #0
	mov r0, r3
	bx lr
	.align 2, 0
_037FB3A0: .4byte 0x027FFC00
	arm_func_end FUN_037FB380

	arm_func_start FUN_037FB3A4
FUN_037FB3A4: @ 0x037FB3A4
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
	bl FUN_037FB3DC
	pop {r3, lr}
	bx lr
	arm_func_end FUN_037FB3A4

	arm_func_start FUN_037FB3DC
FUN_037FB3DC: @ 0x037FB3DC
	push {r4, lr}
	ldr r2, _037FB438 @ =0x04000184
	mov r4, r0
	ldrh r0, [r2]
	tst r0, #0x4000
	ldrhne r1, [r2]
	mvnne r0, #0
	orrne r1, r1, #0xc000
	strhne r1, [r2]
	bne _037FB430
	bl FUN_037FAD24
	ldr r2, _037FB438 @ =0x04000184
	ldrh r1, [r2]
	tst r1, #2
	beq _037FB424
	bl FUN_037FAD38
	mvn r0, #1
	b _037FB430
_037FB424:
	str r4, [r2, #4]
	bl FUN_037FAD38
	mov r0, #0
_037FB430:
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FB438: .4byte 0x04000184
	arm_func_end FUN_037FB3DC

	arm_func_start FUN_037FB43C
FUN_037FB43C: @ 0x037FB43C
	push {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r6, [sp]
	mvn r8, #3
	ldr r4, _037FB514 @ =0x03806DFC
	ldr sb, _037FB518 @ =0x04000184
	add sl, r8, #1
	mov r7, #0x4100000
	mov r5, #0
_037FB460:
	ldrh r0, [sb]
	tst r0, #0x4000
	ldrhne r0, [sb]
	addne r1, r8, #1
	orrne r0, r0, #0xc000
	strhne r0, [sb]
	bne _037FB4A8
	bl FUN_037FAD24
	ldrh r1, [sb]
	tst r1, #0x100
	beq _037FB498
	bl FUN_037FAD38
	mov r1, r8
	b _037FB4A8
_037FB498:
	ldr r6, [r7]
	str r6, [sp]
	bl FUN_037FAD38
	mov r1, r5
_037FB4A8:
	cmp r1, r8
	beq _037FB508
	cmp r1, sl
	beq _037FB460
	lsl r0, r6, #0x1b
	lsrs r0, r0, #0x1b
	beq _037FB460
	ldr r3, [r4, r0, lsl #2]
	cmp r3, #0
	beq _037FB4E8
	lsl r2, r6, #0x1a
	lsr r1, r6, #6
	lsr r2, r2, #0x1f
	mov lr, pc
	bx r3
	arm_func_end FUN_037FB43C

	arm_func_start FUN_037FB4E4
FUN_037FB4E4: @ 0x037FB4E4
	b _037FB460
_037FB4E8:
	lsl r0, r6, #0x1a
	lsrs r0, r0, #0x1f
	bne _037FB460
	orr r6, r6, #0x20
	mov r0, r6
	str r6, [sp]
	bl FUN_037FB3DC
	b _037FB460
_037FB508:
	add sp, sp, #4
	pop {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037FB514: .4byte 0x03806DFC
_037FB518: .4byte 0x04000184
	arm_func_end FUN_037FB4E4

	arm_func_start FUN_037FB51C
FUN_037FB51C: @ 0x037FB51C
	ldr r2, _037FB538 @ =0x04000134
	mvn r3, r0
	ldrh r0, [r2]
	and r0, r3, r0
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_037FB538: .4byte 0x04000134
	arm_func_end FUN_037FB51C

	arm_func_start FUN_037FB53C
FUN_037FB53C: @ 0x037FB53C
	ldr ip, _037FB550 @ =FUN_037FB51C
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0xc000
	bx ip
	.align 2, 0
_037FB550: .4byte FUN_037FB51C
	arm_func_end FUN_037FB53C

	arm_func_start FUN_037FB554
FUN_037FB554: @ 0x037FB554
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl FUN_037FA1C8
	cmp r0, #0
	beq _037FB574
	bl FUN_037FA3B4
	cmp r0, #0
	bne _037FB57C
_037FB574:
	mov r0, #0
	b _037FB5D4
_037FB57C:
	ldr r0, _037FB5E0 @ =0x03806E7C
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #0
	bne _037FB5D4
	ldr r0, _037FB5E4 @ =0x03806E80
	bl FUN_037FA3C4
	bl FUN_037FA240
	ldr r2, _037FB5E8 @ =FUN_037FB5F0
	ldr r3, _037FB5EC @ =0x0000082E
	str r2, [sp, #4]
	adds ip, r0, r3
	mov lr, #0
	str lr, [sp, #8]
	adc r2, r1, #0
	ldr r0, _037FB5E4 @ =0x03806E80
	mov r1, ip
	str lr, [sp]
	bl FUN_037FA570
	ldr r1, _037FB5E0 @ =0x03806E7C
	mov r0, #1
	str r0, [r1]
_037FB5D4:
	add sp, sp, #0xc
	ldm sp!, {lr}
	bx lr
	.align 2, 0
_037FB5E0: .4byte 0x03806E7C
_037FB5E4: .4byte 0x03806E80
_037FB5E8: .4byte FUN_037FB5F0
_037FB5EC: .4byte 0x0000082E
	arm_func_end FUN_037FB554

	arm_func_start FUN_037FB5F0
FUN_037FB5F0: @ 0x037FB5F0
	push {r4, lr}
	mov r0, #0x8000
	mov r4, #0
	bl FUN_037FB53C
	ldr r0, _037FB628 @ =0x04000136
	ldrh r1, [r0]
	ldr r0, _037FB62C @ =0x027FFFA8
	tst r1, #0x80
	movne r4, #0x8000
	and r1, r1, #0xb
	orr r1, r4, r1, lsl #10
	strh r1, [r0]
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FB628: .4byte 0x04000136
_037FB62C: .4byte 0x027FFFA8
	arm_func_end FUN_037FB5F0

	arm_func_start FUN_037FB630
FUN_037FB630: @ 0x037FB630
	ldr r1, _037FB644 @ =0x04000501
	ldrb r0, [r1]
	orr r0, r0, #0x80
	strb r0, [r1]
	bx lr
	.align 2, 0
_037FB644: .4byte 0x04000501
	arm_func_end FUN_037FB630

	arm_func_start FUN_037FB648
FUN_037FB648: @ 0x037FB648
	push {r3, r4, r5, lr}
	ldr r1, _037FB694 @ =0x04000501
	mov r5, #0
	ldrb r0, [r1]
	bic r0, r0, #0x80
	strb r0, [r1]
	mov r4, #1
_037FB664:
	mov r0, r5
	mov r1, r4
	bl FUN_037FB9B4
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FB664
	ldr r0, _037FB698 @ =0x04000508
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FB694: .4byte 0x04000501
_037FB698: .4byte 0x04000508
	arm_func_end FUN_037FB648

	arm_func_start FUN_037FB69C
FUN_037FB69C: @ 0x037FB69C
	push {r3, lr}
	ldr r2, _037FB6E0 @ =0x04000501
	mov r0, #0x80
	ldrb r1, [r2]
	bic r1, r1, #0x80
	strb r1, [r2]
	bl FUN_037FB6E8
	mov r0, #0x40000
	bl FUN_037FAD88
	mov r0, #1
	bl FUN_03801E04
	ldr r1, _037FB6E4 @ =0x04000304
	ldrh r0, [r1]
	bic r0, r0, #1
	strh r0, [r1]
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FB6E0: .4byte 0x04000501
_037FB6E4: .4byte 0x04000304
	arm_func_end FUN_037FB69C

	arm_func_start FUN_037FB6E8
FUN_037FB6E8: @ 0x037FB6E8
	ldr ip, _037FB6F0 @ =FUN_038008D6
	bx ip
	.align 2, 0
_037FB6F0: .4byte FUN_038008D6
	arm_func_end FUN_037FB6E8

	arm_func_start FUN_037FB6F4
FUN_037FB6F4: @ 0x037FB6F4
	push {r3, lr}
	ldr r2, _037FB738 @ =0x04000304
	mov r0, #1
	ldrh r1, [r2]
	orr r1, r1, #1
	strh r1, [r2]
	bl FUN_03801DE0
	mov r0, #0x100
	bl FUN_037FB744
	ldr r0, _037FB73C @ =0x0007AB80
	bl FUN_037FAD88
	ldr r1, _037FB740 @ =0x04000501
	ldrb r0, [r1]
	orr r0, r0, #0x80
	strb r0, [r1]
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FB738: .4byte 0x04000304
_037FB73C: .4byte 0x0007AB80
_037FB740: .4byte 0x04000501
	arm_func_end FUN_037FB6F4

	arm_func_start FUN_037FB744
FUN_037FB744: @ 0x037FB744
	ldr ip, _037FB74C @ =FUN_038008CE
	bx ip
	.align 2, 0
_037FB74C: .4byte FUN_038008CE
	arm_func_end FUN_037FB744

	arm_func_start FUN_037FB750
FUN_037FB750: @ 0x037FB750
	ldr r1, _037FB75C @ =0x04000500
	strb r0, [r1]
	bx lr
	.align 2, 0
_037FB75C: .4byte 0x04000500
	arm_func_end FUN_037FB750

	arm_func_start FUN_037FB760
FUN_037FB760: @ 0x037FB760
	ldr ip, _037FB794 @ =0x04000501
	lsl r3, r3, #5
	ldrb ip, [ip]
	tst ip, #0x80
	movne ip, #1
	moveq ip, #0
	orr r3, r3, ip, lsl #7
	orr r2, r3, r2, lsl #4
	orr r2, r2, r1, lsl #2
	ldr r1, _037FB794 @ =0x04000501
	orr r0, r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_037FB794: .4byte 0x04000501
	arm_func_end FUN_037FB760

	arm_func_start FUN_037FB798
FUN_037FB798: @ 0x037FB798
	push {r4, r5, r6, r7, r8, lr}
	ldr r4, _037FB850 @ =0x03806AEC
	mov r8, r1
	ldr lr, [r4]
	ldr r1, _037FB854 @ =0x03806EAC
	mov r7, r2
	ldr r5, [sp, #0x2c]
	ldr r4, _037FB858 @ =0x03806EB0
	ldr ip, [sp, #0x20]
	ldr r2, _037FB85C @ =0x03806EC0
	strb r5, [r4, r0]
	cmp lr, #0
	ldr r1, [r1]
	movge r5, lr
	mov r6, r3
	lsl r4, r0, #4
	strb ip, [r2, r0]
	cmp r1, #0
	ble _037FB804
	ldr r1, _037FB860 @ =0x0000FFF5
	mov r2, #1
	tst r1, r2, lsl r0
	beq _037FB804
	mov r0, ip
	mov r1, r5
	bl FUN_037FBBD4
	mov ip, r0
_037FB804:
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
_037FB850: .4byte 0x03806AEC
_037FB854: .4byte 0x03806EAC
_037FB858: .4byte 0x03806EB0
_037FB85C: .4byte 0x03806EC0
_037FB860: .4byte 0x0000FFF5
	arm_func_end FUN_037FB798

	arm_func_start FUN_037FB864
FUN_037FB864: @ 0x037FB864
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _037FB8FC @ =0x03806AEC
	mov r7, r1
	ldr ip, [r4]
	ldr r1, _037FB900 @ =0x03806EAC
	mov r6, r3
	ldr r3, _037FB904 @ =0x03806EC0
	ldr r5, [sp, #0x1c]
	ldr r4, _037FB908 @ =0x03806EB0
	ldr r1, [r1]
	strb r5, [r4, r0]
	cmp ip, #0
	movge r5, ip
	lsl r4, r0, #4
	strb r2, [r3, r0]
	cmp r1, #0
	ble _037FB8C8
	ldr r1, _037FB90C @ =0x0000FFF5
	mov r3, #1
	tst r1, r3, lsl r0
	beq _037FB8C8
	mov r0, r2
	mov r1, r5
	bl FUN_037FBBD4
	mov r2, r0
_037FB8C8:
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
_037FB8FC: .4byte 0x03806AEC
_037FB900: .4byte 0x03806EAC
_037FB904: .4byte 0x03806EC0
_037FB908: .4byte 0x03806EB0
_037FB90C: .4byte 0x0000FFF5
	arm_func_end FUN_037FB864

	arm_func_start FUN_037FB910
FUN_037FB910: @ 0x037FB910
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _037FB9A0 @ =0x03806AEC
	mov r7, r2
	ldr ip, [r4]
	ldr r2, _037FB9A4 @ =0x03806EAC
	mov r6, r3
	ldr r3, _037FB9A8 @ =0x03806EC0
	ldr r5, [sp, #0x18]
	ldr r4, _037FB9AC @ =0x03806EB0
	ldr r2, [r2]
	strb r5, [r4, r0]
	cmp ip, #0
	movge r5, ip
	lsl r4, r0, #4
	strb r1, [r3, r0]
	cmp r2, #0
	ble _037FB974
	ldr r2, _037FB9B0 @ =0x0000FFF5
	mov r3, #1
	tst r2, r3, lsl r0
	beq _037FB974
	mov r0, r1
	mov r1, r5
	bl FUN_037FBBD4
	mov r1, r0
_037FB974:
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
_037FB9A0: .4byte 0x03806AEC
_037FB9A4: .4byte 0x03806EAC
_037FB9A8: .4byte 0x03806EC0
_037FB9AC: .4byte 0x03806EB0
_037FB9B0: .4byte 0x0000FFF5
	arm_func_end FUN_037FB910

	arm_func_start FUN_037FB9B4
FUN_037FB9B4: @ 0x037FB9B4
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
	arm_func_end FUN_037FB9B4

	arm_func_start FUN_037FB9DC
FUN_037FB9DC: @ 0x037FB9DC
	push {r3, r4, r5, lr}
	ldr r3, _037FBA48 @ =0x03806EAC
	ldr ip, _037FBA4C @ =0x03806EC0
	ldr r3, [r3]
	mov r5, r0
	mov r4, r2
	strb r1, [ip, r5]
	cmp r3, #0
	ble _037FBA2C
	ldr r0, _037FBA50 @ =0x0000FFF5
	mov r2, #1
	tst r0, r2, lsl r5
	beq _037FBA2C
	lsl r0, r5, #4
	add r0, r0, #0x4000000
	ldrb r2, [r0, #0x402]
	mov r0, r1
	mov r1, r2
	bl FUN_037FBBD4
	mov r1, r0
_037FBA2C:
	lsl r0, r5, #4
	add r0, r0, #0x4000000
	orr r1, r1, r4, lsl #8
	add r0, r0, #0x400
	strh r1, [r0]
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FBA48: .4byte 0x03806EAC
_037FBA4C: .4byte 0x03806EC0
_037FBA50: .4byte 0x0000FFF5
	arm_func_end FUN_037FB9DC

	arm_func_start FUN_037FBA54
FUN_037FBA54: @ 0x037FBA54
	lsl r0, r0, #4
	add r0, r0, #0x4000000
	rsb r1, r1, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	bx lr
	arm_func_end FUN_037FBA54

	arm_func_start FUN_037FBA6C
FUN_037FBA6C: @ 0x037FBA6C
	push {r4, lr}
	ldr r2, _037FBAD0 @ =0x03806AEC
	ldr r3, _037FBAD4 @ =0x03806EB0
	ldr r2, [r2]
	strb r1, [r3, r0]
	cmp r2, #0
	ldr r3, _037FBAD8 @ =0x03806EAC
	lsl r4, r0, #4
	movge r1, r2
	add r2, r4, #0x4000000
	strb r1, [r2, #0x402]
	ldr r2, [r3]
	cmp r2, #0
	ble _037FBAC8
	ldr r2, _037FBADC @ =0x0000FFF5
	mov r3, #1
	tst r2, r3, lsl r0
	beq _037FBAC8
	ldr r2, _037FBAE0 @ =0x03806EC0
	ldrb r0, [r2, r0]
	bl FUN_037FBBD4
	add r1, r4, #0x4000000
	strb r0, [r1, #0x400]
_037FBAC8:
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FBAD0: .4byte 0x03806AEC
_037FBAD4: .4byte 0x03806EB0
_037FBAD8: .4byte 0x03806EAC
_037FBADC: .4byte 0x0000FFF5
_037FBAE0: .4byte 0x03806EC0
	arm_func_end FUN_037FBA6C

	arm_func_start FUN_037FBAE4
FUN_037FBAE4: @ 0x037FBAE4
	lsl r0, r0, #4
	add r0, r0, #0x4000000
	ldrb r0, [r0, #0x403]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end FUN_037FBAE4

	arm_func_start FUN_037FBB00
FUN_037FBB00: @ 0x037FBB00
	ldr r1, _037FBB5C @ =0x03806AEC
	cmp r0, #0
	str r0, [r1]
	blt _037FBB34
	mov r2, #0
	and r1, r0, #0xff
_037FBB18:
	lsl r0, r2, #4
	add r0, r0, #0x4000000
	add r2, r2, #1
	strb r1, [r0, #0x402]
	cmp r2, #0x10
	blt _037FBB18
	bx lr
_037FBB34:
	ldr r2, _037FBB60 @ =0x03806EB0
	mov r3, #0
_037FBB3C:
	ldrb r1, [r2, r3]
	lsl r0, r3, #4
	add r0, r0, #0x4000000
	add r3, r3, #1
	strb r1, [r0, #0x402]
	cmp r3, #0x10
	blt _037FBB3C
	bx lr
	.align 2, 0
_037FBB5C: .4byte 0x03806AEC
_037FBB60: .4byte 0x03806EB0
	arm_func_end FUN_037FBB00

	arm_func_start FUN_037FBB64
FUN_037FBB64: @ 0x037FBB64
	lsl r0, r0, #4
	add r0, r0, #0x4000000
	ldr r0, [r0, #0x400]
	bx lr
	arm_func_end FUN_037FBB64

	arm_func_start FUN_037FBB74
FUN_037FBB74: @ 0x037FBB74
	push {r4, r5, r6, r7, r8, lr}
	ldr r1, _037FBBC8 @ =0x03806EAC
	ldr r5, _037FBBCC @ =0x03806EC0
	ldr r4, _037FBBD0 @ =0x0000FFF5
	str r0, [r1]
	mov r7, #0
	mov r6, #1
_037FBB90:
	tst r4, r6, lsl r7
	beq _037FBBB4
	lsl r8, r7, #4
	add r0, r8, #0x4000000
	ldrb r1, [r0, #0x402]
	ldrb r0, [r5, r7]
	bl FUN_037FBBD4
	add r1, r8, #0x4000000
	strb r0, [r1, #0x400]
_037FBBB4:
	add r7, r7, #1
	cmp r7, #0x10
	blt _037FBB90
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FBBC8: .4byte 0x03806EAC
_037FBBCC: .4byte 0x03806EC0
_037FBBD0: .4byte 0x0000FFF5
	arm_func_end FUN_037FBB74

	arm_func_start FUN_037FBBD4
FUN_037FBBD4: @ 0x037FBBD4
	cmp r1, #0x18
	bge _037FBC04
	ldr r2, _037FBC38 @ =0x03806EAC
	add r3, r1, #0x28
	ldr ip, [r2]
	ldr r1, _037FBC3C @ =0x00007FFF
	mul r2, ip, r3
	sub r1, r1, ip
	add r1, r2, r1, lsl #6
	mul r1, r0, r1
	asr r0, r1, #0x15
	bx lr
_037FBC04:
	cmp r1, #0x68
	bxle lr
	ldr r2, _037FBC38 @ =0x03806EAC
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
_037FBC38: .4byte 0x03806EAC
_037FBC3C: .4byte 0x00007FFF
	arm_func_end FUN_037FBBD4

	arm_func_start FUN_037FBC40
FUN_037FBC40: @ 0x037FBC40
	push {r4, r5, r6, lr}
	mov r5, r0
	rsb r0, r1, #0
	mov r4, #0
	b _037FBC5C
_037FBC54:
	sub r4, r4, #1
	add r0, r0, #0x300
_037FBC5C:
	cmp r0, #0
	blt _037FBC54
	b _037FBC70
_037FBC68:
	add r4, r4, #1
	sub r0, r0, #0x300
_037FBC70:
	cmp r0, #0x300
	bge _037FBC68
	bl FUN_037FBD60
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
	bgt _037FBCC8
	rsb r3, r0, #0
	lsr r4, r2, r3
	rsb r0, r3, #0x20
	orr r4, r4, r1, lsl r0
	sub r0, r3, #0x20
	lsr r3, r1, r3
	orr r4, r4, r1, lsr r0
	b _037FBD24
_037FBCC8:
	cmp r0, #0x20
	bge _037FBD1C
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
	bne _037FBD54
	lsl r3, r1, r0
	orr r3, r3, r2, lsr r5
	sub r1, r0, #0x20
	lsl r4, r2, r0
	orr r3, r3, r2, lsl r1
	b _037FBD24
_037FBD1C:
	sub r0, r4, #1
	b _037FBD54
_037FBD24:
	mov r0, #0x10
	cmp r3, #0
	cmpeq r4, #0x10
	mov r1, #0
	movlo r4, r0
	blo _037FBD4C
	ldr r0, _037FBD5C @ =0x0000FFFF
	cmp r3, r1
	cmpeq r4, r0
	movhi r4, r0
_037FBD4C:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
_037FBD54:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FBD5C: .4byte 0x0000FFFF
	arm_func_end FUN_037FBC40

	arm_func_start FUN_037FBD60
FUN_037FBD60: @ 0x037FBD60
	ldr ip, _037FBD68 @ =FUN_03800918
	bx ip
	.align 2, 0
_037FBD68: .4byte FUN_03800918
	arm_func_end FUN_037FBD60

	arm_func_start FUN_037FBD6C
FUN_037FBD6C: @ 0x037FBD6C
	push {r4, lr}
	ldr r1, _037FBDDC @ =0xFFFFFD2D
	mov r4, r0
	cmp r4, r1
	movlt r4, r1
	blt _037FBD8C
	cmp r4, #0
	movgt r4, #0
_037FBD8C:
	add r0, r4, #0xd3
	add r0, r0, #0x200
	bl FUN_037FBDE0
	mvn r2, #0xef
	cmp r4, r2
	movlt r1, #3
	blt _037FBDC8
	add r1, r2, #0x78
	cmp r4, r1
	movlt r1, #2
	blt _037FBDC8
	add r1, r2, #0xb4
	cmp r4, r1
	movlt r1, #1
	movge r1, #0
_037FBDC8:
	orr r0, r0, r1, lsl #8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FBDDC: .4byte 0xFFFFFD2D
	arm_func_end FUN_037FBD6C

	arm_func_start FUN_037FBDE0
FUN_037FBDE0: @ 0x037FBDE0
	ldr ip, _037FBDE8 @ =FUN_0380091C
	bx ip
	.align 2, 0
_037FBDE8: .4byte FUN_0380091C
	arm_func_end FUN_037FBDE0

	arm_func_start FUN_037FBDEC
FUN_037FBDEC: @ 0x037FBDEC
	cmp r0, #0x20
	ldrlt r1, _037FBE54 @ =_0380664C
	ldrsblt r0, [r1, r0]
	bxlt lr
	cmp r0, #0x40
	ldrlt r1, _037FBE54 @ =_0380664C
	rsblt r0, r0, #0x40
	ldrsblt r0, [r1, r0]
	bxlt lr
	cmp r0, #0x60
	bge _037FBE34
	ldr r1, _037FBE54 @ =_0380664C
	sub r0, r0, #0x40
	ldrsb r0, [r1, r0]
	rsb r0, r0, #0
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	bx lr
_037FBE34:
	ldr r1, _037FBE54 @ =_0380664C
	sub r0, r0, #0x60
	rsb r0, r0, #0x20
	ldrsb r0, [r1, r0]
	rsb r0, r0, #0
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	bx lr
	.align 2, 0
_037FBE54: .4byte _0380664C
	arm_func_end FUN_037FBDEC

	arm_func_start FUN_037FBE58
FUN_037FBE58: @ 0x037FBE58
	ldr r2, _037FBE80 @ =0x03806AF0
	ldr r0, _037FBE84 @ =0x0019660D
	ldr r3, [r2]
	ldr r1, _037FBE88 @ =0x3C6EF35F
	mla r1, r3, r0, r1
	lsr r0, r1, #0x10
	lsl r0, r0, #0x10
	str r1, [r2]
	lsr r0, r0, #0x10
	bx lr
	.align 2, 0
_037FBE80: .4byte 0x03806AF0
_037FBE84: .4byte 0x0019660D
_037FBE88: .4byte 0x3C6EF35F
	arm_func_end FUN_037FBE58

	arm_func_start FUN_037FBE8C
FUN_037FBE8C: @ 0x037FBE8C
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _037FBEE8 @ =0x03806ED0
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _037FBEDC
	mov r0, #1
	str r0, [r1]
	bl FUN_037FEE70
	mov r0, #0x400
	str r0, [sp]
	ldr r0, _037FBEEC @ =0x03806F40
	ldr r1, _037FBEF0 @ =FUN_037FBF9C
	ldr r3, _037FBEF4 @ =0x038073E4
	mov r2, #0
	str r4, [sp, #4]
	bl FUN_037F9054
	ldr r0, _037FBEEC @ =0x03806F40
	bl FUN_037F93B4
_037FBEDC:
	add sp, sp, #8
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FBEE8: .4byte 0x03806ED0
_037FBEEC: .4byte 0x03806F40
_037FBEF0: .4byte FUN_037FBF9C
_037FBEF4: .4byte 0x038073E4
	arm_func_end FUN_037FBE8C

	arm_func_start FUN_037FBEF8
FUN_037FBEF8: @ 0x037FBEF8
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl FUN_037FA240
	ldr r3, _037FBF3C @ =FUN_037FBF80
	adds ip, r0, #0x10000
	str r3, [sp, #4]
	mov lr, #0
	str lr, [sp, #8]
	adc r2, r1, #0
	ldr r3, _037FBF40 @ =0x00000AA8
	ldr r0, _037FBF44 @ =0x03806F14
	mov r1, ip
	str lr, [sp]
	bl FUN_037FA570
	add sp, sp, #0xc
	ldm sp!, {lr}
	bx lr
	.align 2, 0
_037FBF3C: .4byte FUN_037FBF80
_037FBF40: .4byte 0x00000AA8
_037FBF44: .4byte 0x03806F14
	arm_func_end FUN_037FBEF8

	arm_func_start FUN_037FBF48
FUN_037FBF48: @ 0x037FBF48
	ldr ip, _037FBF54 @ =FUN_037FA5E4
	ldr r0, _037FBF58 @ =0x03806F14
	bx ip
	.align 2, 0
_037FBF54: .4byte FUN_037FA5E4
_037FBF58: .4byte 0x03806F14
	arm_func_end FUN_037FBF48

	arm_func_start FUN_037FBF5C
FUN_037FBF5C: @ 0x037FBF5C
	ldr ip, _037FBF70 @ =FUN_037F96F8
	ldr r0, _037FBF74 @ =0x03806EF4
	mov r1, #2
	mov r2, #0
	bx ip
	.align 2, 0
_037FBF70: .4byte FUN_037F96F8
_037FBF74: .4byte 0x03806EF4
	arm_func_end FUN_037FBF5C

	arm_func_start FUN_037FBF78
FUN_037FBF78: @ 0x037FBF78
	bx lr
	arm_func_end FUN_037FBF78

	arm_func_start FUN_037FBF7C
FUN_037FBF7C: @ 0x037FBF7C
	bx lr
	arm_func_end FUN_037FBF7C

	arm_func_start FUN_037FBF80
FUN_037FBF80: @ 0x037FBF80
	ldr ip, _037FBF94 @ =FUN_037F96F8
	ldr r0, _037FBF98 @ =0x03806EF4
	mov r1, #1
	mov r2, #0
	bx ip
	.align 2, 0
_037FBF94: .4byte FUN_037F96F8
_037FBF98: .4byte 0x03806EF4
	arm_func_end FUN_037FBF80

	arm_func_start FUN_037FBF9C
FUN_037FBF9C: @ 0x037FBF9C
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	ldr r0, _037FC07C @ =0x03806EF4
	ldr r1, _037FC080 @ =0x03806ED4
	mov r2, #8
	bl FUN_037F96D0
	ldr r0, _037FC084 @ =0x03806F14
	bl FUN_037FA3C4
	bl FUN_037FC0F8
	bl FUN_037FCE88
	bl FUN_037FECBC
	bl FUN_037FB630
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl FUN_037FB760
	mov r0, #0x7f
	bl FUN_037FB750
	bl FUN_037FA240
	ldr r2, _037FC088 @ =FUN_037FBF80
	adds r4, r0, #0x10000
	str r2, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp]
	adc r2, r1, #0
	ldr r3, _037FC08C @ =0x00000AA8
	ldr r0, _037FC084 @ =0x03806F14
	mov r1, r4
	bl FUN_037FA570
	ldr r7, _037FC07C @ =0x03806EF4
	mov r4, #1
	add r6, sp, #0xc
	mov r8, #0
	mov r5, r4
_037FC02C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov sb, r8
	bl FUN_037F9784
	ldr r0, [sp, #0xc]
	cmp r0, #1
	beq _037FC054
	cmp r0, #2
	b _037FC058
_037FC054:
	mov sb, r4
_037FC058:
	bl FUN_037FC154
	bl FUN_037FEEB4
	mov r0, sb
	bl FUN_037FCEEC
	mov r0, sb
	bl FUN_037FC340
	bl FUN_037FEC24
	bl FUN_037FBE58
	b _037FC02C
	.align 2, 0
_037FC07C: .4byte 0x03806EF4
_037FC080: .4byte 0x03806ED4
_037FC084: .4byte 0x03806F14
_037FC088: .4byte FUN_037FBF80
_037FC08C: .4byte 0x00000AA8
	arm_func_end FUN_037FBF9C

	arm_func_start FUN_037FC090
FUN_037FC090: @ 0x037FC090
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
	arm_func_end FUN_037FC090

	arm_func_start FUN_037FC0E0
FUN_037FC0E0: @ 0x037FC0E0
	add r0, r0, #0x4000000
	ldrb r0, [r0, #0x508]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end FUN_037FC0E0

	arm_func_start FUN_037FC0F8
FUN_037FC0F8: @ 0x037FC0F8
	push {r3, lr}
	ldr r3, _037FC14C @ =0x0380740C
	mov lr, #0
	mov r0, #0x54
_037FC108:
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
	blt _037FC108
	ldr r0, _037FC150 @ =0x038073E4
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FC14C: .4byte 0x0380740C
_037FC150: .4byte 0x038073E4
	arm_func_end FUN_037FC0F8

	arm_func_start FUN_037FC154
FUN_037FC154: @ 0x037FC154
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18
	ldr r7, _037FC33C @ =0x0380740C
	mov sb, #0
	mov r4, #2
	mov r5, #1
	mov r6, sb
	mov sl, #0x54
_037FC174:
	mla r8, sb, sl, r7
	ldrb r0, [r8, #3]
	lsl r0, r0, #0x18
	lsrs r0, r0, #0x1b
	beq _037FC2D4
	tst r0, #2
	beq _037FC19C
	mov r0, sb
	mov r1, r6
	bl FUN_037FB9B4
_037FC19C:
	ldrb r0, [r8, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	tst r0, #1
	beq _037FC278
	ldrb r0, [r8, #1]
	cmp r0, #0
	beq _037FC1D0
	cmp r0, #1
	beq _037FC228
	cmp r0, #2
	beq _037FC254
	b _037FC2D4
_037FC1D0:
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
	bl FUN_037FB798
	b _037FC2D4
_037FC228:
	ldrh r3, [r8, #0x24]
	ldrh r1, [r8, #0x26]
	mov r0, sb
	str r1, [sp]
	ldrb r1, [r8, #0x23]
	and r2, r3, #0xff
	str r1, [sp, #4]
	ldr r1, [r8, #0x44]
	asr r3, r3, #8
	bl FUN_037FB864
	b _037FC2D4
_037FC254:
	ldrh r2, [r8, #0x24]
	ldrb r1, [r8, #0x23]
	mov r0, sb
	str r1, [sp]
	ldrh r3, [r8, #0x26]
	and r1, r2, #0xff
	asr r2, r2, #8
	bl FUN_037FB910
	b _037FC2D4
_037FC278:
	tst r0, #4
	beq _037FC28C
	ldrh r1, [r8, #0x26]
	mov r0, sb
	bl FUN_037FBA54
_037FC28C:
	ldrb r0, [r8, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	tst r0, #8
	beq _037FC2B4
	ldrh r2, [r8, #0x24]
	mov r0, sb
	and r1, r2, #0xff
	asr r2, r2, #8
	bl FUN_037FB9DC
_037FC2B4:
	ldrb r0, [r8, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	tst r0, #0x10
	beq _037FC2D4
	ldrb r1, [r8, #0x23]
	mov r0, sb
	bl FUN_037FBA6C
_037FC2D4:
	add sb, sb, #1
	cmp sb, #0x10
	blt _037FC174
	ldr r3, _037FC33C @ =0x0380740C
	mov r4, #0
	mov r1, #0x54
_037FC2EC:
	mla r5, r4, r1, r3
	ldrb r0, [r5, #3]
	lsl r0, r0, #0x18
	lsrs r0, r0, #0x1b
	beq _037FC324
	tst r0, #1
	lslne r0, r4, #4
	addne r0, r0, #0x4000000
	ldrbne r2, [r0, #0x403]
	orrne r2, r2, #0x80
	strbne r2, [r0, #0x403]
	ldrb r0, [r5, #3]
	bic r0, r0, #0xf8
	strb r0, [r5, #3]
_037FC324:
	add r4, r4, #1
	cmp r4, #0x10
	blt _037FC2EC
	add sp, sp, #0x18
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037FC33C: .4byte 0x0380740C
	arm_func_end FUN_037FC154

	arm_func_start FUN_037FC340
FUN_037FC340: @ 0x037FC340
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	mov r0, #0x8000
	rsb r0, r0, #0
	mov r6, #0
	str r0, [sp]
	mov r4, r6
_037FC35C:
	ldr r0, _037FC6E8 @ =0x0380740C
	mov r1, #0x54
	mla r5, r6, r1, r0
	ldrb r2, [r5, #3]
	mov r7, #0
	lsl r0, r2, #0x1f
	mov r8, r7
	mov sb, r7
	lsrs r0, r0, #0x1f
	beq _037FC6D4
	lsl r0, r2, #0x1e
	lsrs r0, r0, #0x1f
	beq _037FC3C0
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
	b _037FC410
_037FC3C0:
	mov r0, r6
	bl FUN_037FBAE4
	cmp r0, #0
	bne _037FC410
	ldr r3, [r5, #0x48]
	cmp r3, #0
	moveq r0, r7
	strbeq r0, [r5, #0x22]
	beq _037FC3F8
	ldr r2, [r5, #0x4c]
	mov r0, r5
	mov r1, #1
	mov lr, pc
	bx r3
_037FC3F8:
	mov r0, #0
	strh r0, [r5, #0x24]
	ldrb r0, [r5, #3]
	bic r0, r0, #1
	strb r0, [r5, #3]
	b _037FC6D4
_037FC410:
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #8]
	lsl r2, r0, #1
	ldr r0, _037FC6EC @ =0x03806670
	ldrsh r2, [r0, r2]
	ldrb r0, [r5, #5]
	add r7, r7, r2
	sub r0, r1, r0
	add r8, r8, r0, lsl #6
	mov r0, r5
	mov r1, fp
	bl FUN_037FC7C4
	ldrsh r3, [r5, #0x32]
	add r7, r7, r0
	cmp r3, #0
	moveq r0, #0
	beq _037FC498
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x18]
	cmp r0, r2
	movge r0, #0
	bge _037FC498
	sub r0, r2, r0
	smull r0, r1, r3, r0
	asr r3, r2, #0x1f
	bl FUN_03806064
	cmp fp, #0
	beq _037FC498
	ldrb r1, [r5, #3]
	lsl r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	ldrne r1, [r5, #0x14]
	addne r1, r1, #1
	strne r1, [r5, #0x14]
_037FC498:
	ldrsh r1, [r5, #0xc]
	add r2, r8, r0
	ldrsh r0, [r5, #6]
	add r1, r7, r1
	add r7, r1, r0
	ldrsh r1, [r5, #0xe]
	add r0, r5, #0x28
	add r8, r2, r1
	bl FUN_037FCDAC
	asr r1, r0, #0x1f
	cmp r1, #0
	mov sl, r0
	cmpeq r0, r4
	beq _037FC524
	ldrb r2, [r5, #0x28]
	cmp r2, #0
	beq _037FC510
	cmp r2, #1
	beq _037FC4F8
	cmp r2, #2
	lsleq r1, r1, #6
	orreq r1, r1, r0, lsr #26
	lsleq sl, r0, #6
	b _037FC51C
_037FC4F8:
	mov r2, #0x3c
	umull sl, r3, r0, r2
	mov r0, #0x3c
	mla r3, r1, r0, r3
	mov r1, r3
	b _037FC51C
_037FC510:
	lsl r1, r1, #6
	orr r1, r1, r0, lsr #26
	lsl sl, r0, #6
_037FC51C:
	lsr sl, sl, #0xe
	orr sl, sl, r1, lsl #18
_037FC524:
	cmp fp, #0
	beq _037FC534
	add r0, r5, #0x28
	bl FUN_037FCD4C
_037FC534:
	ldrb r0, [r5, #0x28]
	cmp r0, #0
	beq _037FC564
	cmp r0, #1
	beq _037FC554
	cmp r0, #2
	addeq sb, sb, sl
	b _037FC568
_037FC554:
	ldr r0, [sp]
	cmp r7, r0
	addgt r7, r7, sl
	b _037FC568
_037FC564:
	add r8, r8, sl
_037FC568:
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
	bne _037FC5F4
	ldr r0, _037FC6F0 @ =0xFFFFFD2D
	cmp r7, r0
	bgt _037FC5F4
	ldrb r0, [r5, #3]
	bic r0, r0, #0xf8
	orr r0, r0, #0x10
	strb r0, [r5, #3]
	ldr r3, [r5, #0x48]
	cmp r3, #0
	moveq r0, #0
	strbeq r0, [r5, #0x22]
	beq _037FC5DC
	ldr r2, [r5, #0x4c]
	mov r0, r5
	mov r1, #1
	mov lr, pc
	bx r3
_037FC5DC:
	mov r0, #0
	strh r0, [r5, #0x24]
	ldrb r0, [r5, #3]
	bic r0, r0, #1
	strb r0, [r5, #3]
	b _037FC6D4
_037FC5F4:
	mov r0, r7
	bl FUN_037FBD6C
	mov r7, r0
	ldrh r0, [r5, #0x3c]
	mov r1, r8
	bl FUN_037FBC40
	ldrb r1, [r5, #1]
	cmp r1, #1
	ldreq r1, _037FC6F4 @ =0x0000FFFC
	andeq r0, r0, r1
	lsleq r0, r0, #0x10
	lsreq r0, r0, #0x10
	adds sb, sb, #0x40
	movmi sb, #0
	bmi _037FC638
	cmp sb, #0x7f
	movgt sb, #0x7f
_037FC638:
	ldrh r1, [r5, #0x24]
	cmp r7, r1
	beq _037FC66C
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
_037FC66C:
	ldrh r1, [r5, #0x26]
	cmp r0, r1
	beq _037FC6A0
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
_037FC6A0:
	ldrb r0, [r5, #0x23]
	cmp sb, r0
	beq _037FC6D4
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
_037FC6D4:
	add r6, r6, #1
	cmp r6, #0x10
	blt _037FC35C
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FC6E8: .4byte 0x0380740C
_037FC6EC: .4byte 0x03806670
_037FC6F0: .4byte 0xFFFFFD2D
_037FC6F4: .4byte 0x0000FFFC
	arm_func_end FUN_037FC340

	arm_func_start FUN_037FC6F8
FUN_037FC6F8: @ 0x037FC6F8
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
	bl FUN_037FCE50
	mov r0, #1
	pop {r4, lr}
	bx lr
	arm_func_end FUN_037FC6F8

	arm_func_start FUN_037FC734
FUN_037FC734: @ 0x037FC734
	push {r3, lr}
	ldrb r3, [r0]
	cmp r3, #8
	movlo r0, #0
	blo _037FC774
	cmp r3, #0xd
	movhi r0, #0
	bhi _037FC774
	mov r3, #1
	strb r3, [r0, #1]
	str r1, [r0, #0x44]
	ldr r3, _037FC77C @ =0x00001F46
	mov r1, r2
	strh r3, [r0, #0x3c]
	bl FUN_037FCE50
	mov r0, #1
_037FC774:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FC77C: .4byte 0x00001F46
	arm_func_end FUN_037FC734

	arm_func_start FUN_037FC780
FUN_037FC780: @ 0x037FC780
	push {r3, lr}
	ldrb r2, [r0]
	cmp r2, #0xe
	movlo r0, #0
	blo _037FC7B8
	cmp r2, #0xf
	movhi r0, #0
	bhi _037FC7B8
	ldr r2, _037FC7C0 @ =0x00001F46
	mov r3, #2
	strb r3, [r0, #1]
	strh r2, [r0, #0x3c]
	bl FUN_037FCE50
	mov r0, #1
_037FC7B8:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FC7C0: .4byte 0x00001F46
	arm_func_end FUN_037FC780

	arm_func_start FUN_037FC7C4
FUN_037FC7C4: @ 0x037FC7C4
	cmp r1, #0
	beq _037FC85C
	ldrb r1, [r0, #2]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _037FC85C
_037FC7DC: @ jump table
	b _037FC7EC @ case 0
	b _037FC814 @ case 1
	b _037FC85C @ case 2
	b _037FC84C @ case 3
_037FC7EC:
	ldr r2, [r0, #0x10]
	ldrb r1, [r0, #0x1c]
	rsb r2, r2, #0
	mul r1, r2, r1
	asr r1, r1, #8
	rsbs r1, r1, #0
	str r1, [r0, #0x10]
	moveq r1, #1
	strbeq r1, [r0, #2]
	b _037FC85C
_037FC814:
	ldrb r2, [r0, #0x1d]
	ldr r1, _037FC868 @ =0x03806670
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
	b _037FC85C
_037FC84C:
	ldr r2, [r0, #0x10]
	ldrh r1, [r0, #0x20]
	sub r1, r2, r1
	str r1, [r0, #0x10]
_037FC85C:
	ldr r0, [r0, #0x10]
	asr r0, r0, #7
	bx lr
	.align 2, 0
_037FC868: .4byte 0x03806670
	arm_func_end FUN_037FC7C4

	arm_func_start FUN_037FC86C
FUN_037FC86C: @ 0x037FC86C
	cmp r1, #0x6d
	ldrge r2, _037FC888 @ =0x03806784
	rsblt r1, r1, #0xff
	rsbge r1, r1, #0x7f
	ldrbge r1, [r2, r1]
	strb r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_037FC888: .4byte 0x03806784
	arm_func_end FUN_037FC86C

	arm_func_start FUN_037FC88C
FUN_037FC88C: @ 0x037FC88C
	push {r4, lr}
	mov r4, r0
	mov r0, r1
	bl FUN_037FCDFC
	strh r0, [r4, #0x1e]
	pop {r4, lr}
	bx lr
	arm_func_end FUN_037FC88C

	arm_func_start FUN_037FC8A8
FUN_037FC8A8: @ 0x037FC8A8
	strb r1, [r0, #0x1d]
	bx lr
	arm_func_end FUN_037FC8A8

	arm_func_start FUN_037FC8B0
FUN_037FC8B0: @ 0x037FC8B0
	push {r4, lr}
	mov r4, r0
	mov r0, r1
	bl FUN_037FCDFC
	strh r0, [r4, #0x20]
	pop {r4, lr}
	bx lr
	arm_func_end FUN_037FC8B0

	arm_func_start FUN_037FC8CC
FUN_037FC8CC: @ 0x037FC8CC
	mov r1, #3
	strb r1, [r0, #2]
	bx lr
	arm_func_end FUN_037FC8CC

	arm_func_start FUN_037FC8D8
FUN_037FC8D8: @ 0x037FC8D8
	ldrb r0, [r0, #3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
	arm_func_end FUN_037FC8D8

	arm_func_start FUN_037FC8E8
FUN_037FC8E8: @ 0x037FC8E8
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _037FCAA0 @ =0x038073E4
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
	ldr r3, _037FCAA4 @ =0x03806770
	ldr r8, _037FCAA8 @ =0x03806774
	mov sb, r4
	mvn r1, #0
	mov fp, #1
_037FC92C:
	ldrb ip, [r8, sb]
	tst r0, fp, lsl ip
	beq _037FC9AC
	ldr r2, _037FCAAC @ =0x0380740C
	mov r7, #0x54
	mla sl, ip, r7, r2
	cmp r4, #0
	moveq r4, sl
	beq _037FC9AC
	ldrb r7, [r4, #0x22]
	ldrb r2, [sl, #0x22]
	cmp r2, r7
	bhi _037FC9AC
	bne _037FC9A8
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
	beq _037FC99C
	movlt r2, fp
	movge r2, r1
	b _037FC9A0
_037FC99C:
	mov r2, #0
_037FC9A0:
	cmp r2, #0
	bge _037FC9AC
_037FC9A8:
	mov r4, sl
_037FC9AC:
	add sb, sb, #1
	cmp sb, #0x10
	blt _037FC92C
	cmp r4, #0
	moveq r0, #0
	beq _037FCA98
	ldrb r0, [r4, #0x22]
	cmp r6, r0
	movlt r0, #0
	blt _037FCA98
	ldr r3, [r4, #0x48]
	cmp r3, #0
	beq _037FC9F4
	ldr r2, [r4, #0x4c]
	mov r0, r4
	mov r1, #0
	mov lr, pc
	bx r3
_037FC9F4:
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
	ldr r1, _037FCAB0 @ =0x0000FFFF
	strb r7, [r4, #0x1c]
	strh r1, [r4, #0x1e]
	strb r3, [r4, #0x1d]
	add r0, r4, #0x28
	strh r1, [r4, #0x20]
	bl FUN_037FCD28
	mov r0, r4
_037FCA98:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FCAA0: .4byte 0x038073E4
_037FCAA4: .4byte 0x03806770
_037FCAA8: .4byte 0x03806774
_037FCAAC: .4byte 0x0380740C
_037FCAB0: .4byte 0x0000FFFF
	arm_func_end FUN_037FC8E8

	arm_func_start FUN_037FCAB4
FUN_037FCAB4: @ 0x037FCAB4
	cmp r0, #0
	movne r1, #0
	strne r1, [r0, #0x48]
	strne r1, [r0, #0x4c]
	bx lr
	arm_func_end FUN_037FCAB4

	arm_func_start FUN_037FCAC8
FUN_037FCAC8: @ 0x037FCAC8
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	ldr r7, _037FCB70 @ =0x0380740C
	ldr r4, _037FCB74 @ =0x038073E4
	mov sl, r0
	mov r5, sb
	mov r6, #1
	mov fp, #0x54
	b _037FCB58
_037FCAEC:
	tst sl, #1
	beq _037FCB50
	ldr r0, [r4, #4]
	mla r8, sb, fp, r7
	tst r0, r6, lsl sb
	bne _037FCB50
	ldr r3, [r8, #0x48]
	cmp r3, #0
	beq _037FCB24
	ldr r2, [r8, #0x4c]
	mov r0, r8
	mov r1, #0
	mov lr, pc
	bx r3
_037FCB24:
	mov r0, sb
	mov r1, #0
	bl FUN_037FB9B4
	strb r5, [r8, #0x22]
	mov r0, r8
	bl FUN_037FCAB4
	ldrb r0, [r8, #3]
	bic r1, r0, #0xf8
	and r0, r1, #0xff
	bic r0, r0, #1
	strb r0, [r8, #3]
_037FCB50:
	add sb, sb, #1
	lsr sl, sl, #1
_037FCB58:
	cmp sb, #0x10
	bge _037FCB68
	cmp sl, #0
	bne _037FCAEC
_037FCB68:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FCB70: .4byte 0x0380740C
_037FCB74: .4byte 0x038073E4
	arm_func_end FUN_037FCAC8

	arm_func_start FUN_037FCB78
FUN_037FCB78: @ 0x037FCB78
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r8, #0
	ldr r5, _037FCC50 @ =0x0380740C
	mov sb, r1
	mov r7, sl
	mov fp, r8
	mov r4, #1
	b _037FCC14
_037FCB9C:
	tst r7, #1
	beq _037FCC0C
	ldr r0, _037FCC54 @ =0x038073E4
	ldr r1, [r0, #4]
	mov r0, #0x54
	mla r6, r8, r0, r5
	tst r1, r4, lsl r8
	bne _037FCC0C
	ldr r3, [r6, #0x48]
	cmp r3, #0
	beq _037FCBDC
	ldr r2, [r6, #0x4c]
	mov r0, r6
	mov r1, #0
	mov lr, pc
	bx r3
_037FCBDC:
	mov r0, r8
	mov r1, #0
	bl FUN_037FB9B4
	strb fp, [r6, #0x22]
	mov r0, r6
	bl FUN_037FCAB4
	ldrb r0, [r6, #3]
	bic r0, r0, #0xf8
	strb r0, [r6, #3]
	and r0, r0, #0xff
	bic r0, r0, #1
	strb r0, [r6, #3]
_037FCC0C:
	add r8, r8, #1
	lsr r7, r7, #1
_037FCC14:
	cmp r8, #0x10
	bge _037FCC24
	cmp r7, #0
	bne _037FCB9C
_037FCC24:
	tst sb, #1
	ldrne r0, _037FCC54 @ =0x038073E4
	ldrne r1, [r0]
	orrne r1, r1, sl
	strne r1, [r0]
	ldreq r0, _037FCC54 @ =0x038073E4
	ldreq r1, [r0, #4]
	orreq r1, r1, sl
	streq r1, [r0, #4]
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FCC50: .4byte 0x0380740C
_037FCC54: .4byte 0x038073E4
	arm_func_end FUN_037FCB78

	arm_func_start FUN_037FCC58
FUN_037FCC58: @ 0x037FCC58
	tst r1, #1
	ldreq r1, _037FCC8C @ =0x038073E4
	mvneq r0, r0
	ldreq r2, [r1, #4]
	andeq r0, r2, r0
	streq r0, [r1, #4]
	bxeq lr
	ldr r1, _037FCC8C @ =0x038073E4
	mvn r0, r0
	ldr r2, [r1]
	and r0, r2, r0
	str r0, [r1]
	bx lr
	.align 2, 0
_037FCC8C: .4byte 0x038073E4
	arm_func_end FUN_037FCC58

	arm_func_start FUN_037FCC90
FUN_037FCC90: @ 0x037FCC90
	tst r0, #1
	ldrne r0, _037FCCA8 @ =0x038073E4
	ldrne r0, [r0]
	ldreq r0, _037FCCA8 @ =0x038073E4
	ldreq r0, [r0, #4]
	bx lr
	.align 2, 0
_037FCCA8: .4byte 0x038073E4
	arm_func_end FUN_037FCC90

	arm_func_start FUN_037FCCAC
FUN_037FCCAC: @ 0x037FCCAC
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, _037FCD24 @ =0x0380740C
	mov r6, #0
	mov r8, r0
	mov r7, r1
	mov r4, r6
	mov sb, #0x54
_037FCCC8:
	mla r2, r6, sb, r5
	ldrb r1, [r2, #3]
	lsl r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	beq _037FCD0C
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _037FCD0C
	ldr r0, [r2, #0x44]
	cmp r8, r0
	cmpls r0, r7
	bhi _037FCD0C
	bic r3, r1, #2
	mov r0, r6
	mov r1, r4
	strb r3, [r2, #3]
	bl FUN_037FB9B4
_037FCD0C:
	add r0, r6, #1
	and r6, r0, #0xff
	cmp r6, #0x10
	blo _037FCCC8
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FCD24: .4byte 0x0380740C
	arm_func_end FUN_037FCCAC

	arm_func_start FUN_037FCD28
FUN_037FCD28: @ 0x037FCD28
	mov r2, #0
	strb r2, [r0]
	strb r2, [r0, #2]
	mov r1, #1
	strb r1, [r0, #3]
	mov r1, #0x10
	strb r1, [r0, #1]
	strh r2, [r0, #4]
	bx lr
	arm_func_end FUN_037FCD28

	arm_func_start FUN_037FCD4C
FUN_037FCD4C: @ 0x037FCD4C
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
	b _037FCD7C
_037FCD78:
	sub r3, r3, #0x80
_037FCD7C:
	cmp r3, #0x80
	bhs _037FCD78
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
	arm_func_end FUN_037FCD4C

	arm_func_start FUN_037FCDAC
FUN_037FCDAC: @ 0x037FCDAC
	push {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #2]
	cmp r0, #0
	moveq r0, #0
	beq _037FCDF4
	ldrh r1, [r4, #6]
	ldrh r0, [r4, #4]
	cmp r1, r0
	movlo r0, #0
	blo _037FCDF4
	ldrh r0, [r4, #8]
	lsr r0, r0, #8
	bl FUN_037FBDEC
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #3]
	mul r0, r1, r0
	mul r0, r2, r0
_037FCDF4:
	pop {r4, lr}
	bx lr
	arm_func_end FUN_037FCDAC

	arm_func_start FUN_037FCDFC
FUN_037FCDFC: @ 0x037FCDFC
	push {r3, lr}
	cmp r0, #0x7f
	ldreq r0, _037FCE4C @ =0x0000FFFF
	beq _037FCE44
	cmp r0, #0x7e
	moveq r0, #0x3c00
	beq _037FCE44
	cmp r0, #0x32
	lsllt r0, r0, #1
	addlt r0, r0, #1
	lsllt r0, r0, #0x10
	lsrlt r0, r0, #0x10
	blt _037FCE44
	rsb r1, r0, #0x7e
	mov r0, #0x1e00
	bl FUN_0380625C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
_037FCE44:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FCE4C: .4byte 0x0000FFFF
	arm_func_end FUN_037FCDFC

	arm_func_start FUN_037FCE50
FUN_037FCE50: @ 0x037FCE50
	ldr r3, _037FCE84 @ =0xFFFE9680
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
_037FCE84: .4byte 0xFFFE9680
	arm_func_end FUN_037FCE50

	arm_func_start FUN_037FCE88
FUN_037FCE88: @ 0x037FCE88
	push {r3, lr}
	ldr r3, _037FCEE4 @ =0x0380794C
	mov lr, #0
	mov r0, #0x24
_037FCE98:
	mul r2, lr, r0
	ldrb r1, [r3, r2]
	add ip, r3, r2
	bic r1, r1, #1
	strb r1, [r3, r2]
	strb lr, [ip, #1]
	add lr, lr, #1
	cmp lr, #0x10
	blt _037FCE98
	ldr r1, _037FCEE8 @ =0x03807B8C
	mov r2, #0
_037FCEC4:
	ldrb r0, [r1, r2, lsl #6]
	bic r0, r0, #1
	strb r0, [r1, r2, lsl #6]
	add r2, r2, #1
	cmp r2, #0x20
	blt _037FCEC4
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FCEE4: .4byte 0x0380794C
_037FCEE8: .4byte 0x03807B8C
	arm_func_end FUN_037FCE88

	arm_func_start FUN_037FCEEC
FUN_037FCEEC: @ 0x037FCEEC
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, #0
	mov sb, r0
	mov r5, r6
_037FCEFC:
	mov r0, #0x24
	mul r0, r5, r0
	ldr r2, _037FD044 @ =0x0380794C
	ldrb r1, [r2, r0]
	add r4, r2, r0
	lsl r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	beq _037FD020
	lsl r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	beq _037FD00C
	cmp sb, #0
	beq _037FCFD8
	lsl r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	bne _037FCFD8
	mov r8, #0
	b _037FCF54
_037FCF44:
	ldrh r0, [r4, #0x1c]
	add r8, r8, #1
	sub r0, r0, #0xf0
	strh r0, [r4, #0x1c]
_037FCF54:
	ldrh r0, [r4, #0x1c]
	cmp r0, #0xf0
	bhs _037FCF44
	mov r7, #0
	mov sl, #1
	b _037FCF90
_037FCF6C:
	mov r0, r4
	mov r1, sl
	bl FUN_037FDC88
	cmp r0, #0
	beq _037FCF8C
	mov r0, r4
	bl FUN_037FDA98
	b _037FCF98
_037FCF8C:
	add r7, r7, #1
_037FCF90:
	cmp r7, r8
	blt _037FCF6C
_037FCF98:
	ldr r0, _037FD048 @ =0x03807408
	ldr r2, [r0]
	cmp r2, #0
	beq _037FCFC0
	ldrb r1, [r4, #1]
	mov r0, #0x24
	mla r2, r1, r0, r2
	ldr r0, [r2, #0x40]
	add r0, r0, r7
	str r0, [r2, #0x40]
_037FCFC0:
	ldrh r2, [r4, #0x18]
	ldrh r1, [r4, #0x1a]
	ldrh r0, [r4, #0x1c]
	mul r1, r2, r1
	add r0, r0, r1, asr #8
	strh r0, [r4, #0x1c]
_037FCFD8:
	mov r8, #0
	mov r7, #1
_037FCFE0:
	mov r0, r4
	mov r1, r8
	bl FUN_037FDA14
	cmp r0, #0
	beq _037FD000
	mov r1, r4
	mov r2, r7
	bl FUN_037FDB30
_037FD000:
	add r8, r8, #1
	cmp r8, #0x10
	blt _037FCFE0
_037FD00C:
	ldrb r0, [r4]
	lsl r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	movne r0, #1
	orrne r6, r6, r0, lsl r5
_037FD020:
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FCEFC
	ldr r0, _037FD048 @ =0x03807408
	ldr r0, [r0]
	cmp r0, #0
	strne r6, [r0, #4]
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037FD044: .4byte 0x0380794C
_037FD048: .4byte 0x03807408
	arm_func_end FUN_037FCEEC

	arm_func_start FUN_037FD04C
FUN_037FD04C: @ 0x037FD04C
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0x24
	mul r5, sb, r0
	ldr r6, _037FD21C @ =0x0380794C
	mov r8, r1
	ldrb r0, [r6, r5]
	mov r7, r2
	lsl r0, r0, #0x1f
	mov r4, r3
	add r5, r6, r5
	lsrs r0, r0, #0x1f
	beq _037FD088
	mov r0, r5
	bl FUN_037FDA98
_037FD088:
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
_037FD0CC:
	add r0, r5, r2
	add r2, r2, #1
	strb r1, [r0, #8]
	cmp r2, #0x10
	blt _037FD0CC
	ldr r1, _037FD220 @ =0x03807408
	ldr r3, [r1]
	cmp r3, #0
	beq _037FD12C
	ldrb r2, [r5, #1]
	mov r0, #0x24
	mla r0, r2, r0, r3
	mov r6, #0
	str r6, [r0, #0x40]
	mvn r4, #0
	mov r0, #0x24
_037FD10C:
	ldr r2, [r1]
	ldrb r3, [r5, #1]
	mla r2, r3, r0, r2
	add r2, r2, r6, lsl #1
	add r6, r6, #1
	strh r4, [r2, #0x20]
	cmp r6, #0x10
	blt _037FD10C
_037FD12C:
	bl FUN_037FE81C
	movs r4, r0
	bmi _037FD214
	ldr r0, _037FD224 @ =0x03807B8C
	add r6, r0, r4, lsl #6
	mov r0, r6
	bl FUN_037FD888
	str r8, [r6, #0x24]
	add r0, r8, r7
	str r0, [r6, #0x28]
	strb r4, [r5, #8]
	ldr r0, [r6, #0x28]
	bl FUN_037FD71C
	mov r0, r6
	bl FUN_037FD228
	cmp r0, #0xfe
	ldrne r0, [r6, #0x28]
	subne r0, r0, #1
	strne r0, [r6, #0x28]
	bne _037FD1E0
	mov r0, r6
	bl FUN_037FD228
	mov r4, r0
	mov r0, r6
	bl FUN_037FD228
	orr r0, r4, r0, lsl #8
	lsl r0, r0, #0x10
	ldr r4, _037FD224 @ =0x03807B8C
	lsr r8, r0, #0x11
	mov r7, #1
	b _037FD1D8
_037FD1A8:
	tst r8, #1
	beq _037FD1CC
	bl FUN_037FE81C
	movs r6, r0
	bmi _037FD1E0
	add r0, r4, r6, lsl #6
	bl FUN_037FD888
	add r0, r5, r7
	strb r6, [r0, #8]
_037FD1CC:
	lsl r0, r8, #0xf
	add r7, r7, #1
	lsr r8, r0, #0x10
_037FD1D8:
	cmp r8, #0
	bne _037FD1A8
_037FD1E0:
	ldrb r1, [r5]
	ldr r0, _037FD220 @ =0x03807408
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
_037FD214:
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FD21C: .4byte 0x0380794C
_037FD220: .4byte 0x03807408
_037FD224: .4byte 0x03807B8C
	arm_func_end FUN_037FD04C

	arm_func_start FUN_037FD228
FUN_037FD228: @ 0x037FD228
	push {r3, r4, r5, lr}
	ldr r1, _037FD280 @ =0x038073EC
	mov r5, r0
	ldr r4, [r5, #0x28]
	ldr r0, [r1, #4]
	cmp r4, r0
	blo _037FD250
	ldr r0, [r1, #8]
	cmp r4, r0
	blo _037FD258
_037FD250:
	mov r0, r4
	bl FUN_037FD71C
_037FD258:
	ldr r0, _037FD280 @ =0x038073EC
	ldr r1, [r5, #0x28]
	ldr r2, [r0, #4]
	ldr r0, _037FD284 @ =0x038073F8
	sub r2, r4, r2
	ldrb r0, [r0, r2]
	add r1, r1, #1
	str r1, [r5, #0x28]
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FD280: .4byte 0x038073EC
_037FD284: .4byte 0x038073F8
	arm_func_end FUN_037FD228

	arm_func_start FUN_037FD288
FUN_037FD288: @ 0x037FD288
	mov r1, #0x24
	mul r1, r0, r1
	ldr r2, _037FD2A4 @ =0x0380794C
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	bx lr
	.align 2, 0
_037FD2A4: .4byte 0x0380794C
	arm_func_end FUN_037FD288

	arm_func_start FUN_037FD2A8
FUN_037FD2A8: @ 0x037FD2A8
	push {r4, lr}
	mov r4, r0
	bl FUN_037FD04C
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _037FD2D4 @ =0x0380794C
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FD2D4: .4byte 0x0380794C
	arm_func_end FUN_037FD2A8

	arm_func_start FUN_037FD2D8
FUN_037FD2D8: @ 0x037FD2D8
	push {r4, lr}
	mov r4, r0
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _037FD32C @ =0x0380794C
	ldrb r0, [r2, r1]
	lsl r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _037FD324
	add r0, r2, r1
	bl FUN_037FDA98
	ldr r0, _037FD330 @ =0x03807408
	ldr r2, [r0]
	cmp r2, #0
	movne r0, #1
	ldrne r1, [r2, #4]
	mvnne r0, r0, lsl r4
	andne r0, r1, r0
	strne r0, [r2, #4]
_037FD324:
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FD32C: .4byte 0x0380794C
_037FD330: .4byte 0x03807408
	arm_func_end FUN_037FD2D8

	arm_func_start FUN_037FD334
FUN_037FD334: @ 0x037FD334
	push {r4, r5, r6, r7, r8, lr}
	mov r2, #0x24
	mul r4, r0, r2
	ldr r5, _037FD3A8 @ =0x0380794C
	and r0, r1, #0xff
	ldrb r2, [r5, r4]
	lsl r0, r0, #0x1f
	bic r2, r2, #4
	orr r0, r2, r0, lsr #29
	strb r0, [r5, r4]
	cmp r1, #0
	beq _037FD3A0
	mov r8, #0
	mov r6, #0x7f
_037FD36C:
	mov r1, r8
	add r0, r5, r4
	bl FUN_037FDA14
	movs r7, r0
	beq _037FD394
	mov r2, r6
	add r1, r5, r4
	bl FUN_037FD978
	mov r0, r7
	bl FUN_037FD9E0
_037FD394:
	add r8, r8, #1
	cmp r8, #0x10
	blt _037FD36C
_037FD3A0:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD3A8: .4byte 0x0380794C
	arm_func_end FUN_037FD334

	arm_func_start FUN_037FD3AC
FUN_037FD3AC: @ 0x037FD3AC
	push {r4, r5, r6, r7, r8, lr}
	ldr r3, _037FD470 @ =0x0380794C
	mov r2, #0x24
	mla r6, r0, r2, r3
	mov r8, r1
	mov r7, #0
	mov r4, #0x7f
_037FD3C8:
	mov r0, r6
	mov r1, r7
	bl FUN_037FDA14
	movs r5, r0
	beq _037FD3F0
	mov r1, r6
	mov r2, r4
	bl FUN_037FD978
	mov r0, r5
	bl FUN_037FD9E0
_037FD3F0:
	add r7, r7, #1
	cmp r7, #0x10
	blt _037FD3C8
	bl FUN_037FBF48
	mov r4, #0
	mov r5, r4
	b _037FD430
_037FD40C:
	mov r0, r6
	mov r1, r5
	bl FUN_037FDC88
	cmp r0, #0
	beq _037FD42C
	mov r0, r6
	bl FUN_037FDA98
	b _037FD438
_037FD42C:
	add r4, r4, #1
_037FD430:
	cmp r4, r8
	blo _037FD40C
_037FD438:
	bl FUN_037FBEF8
	ldr r0, _037FD474 @ =0x03807408
	ldr r3, [r0]
	cmp r3, #0
	beq _037FD468
	ldrb r1, [r6, #1]
	mov r0, #0x24
	mul r2, r1, r0
	add r1, r3, #0x40
	ldr r0, [r1, r2]
	add r0, r0, r4
	str r0, [r1, r2]
_037FD468:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD470: .4byte 0x0380794C
_037FD474: .4byte 0x03807408
	arm_func_end FUN_037FD3AC

	arm_func_start FUN_037FD478
FUN_037FD478: @ 0x037FD478
	push {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	ldr r5, _037FD4E0 @ =0x0380794C
	mov r8, r1
	mov r7, r2
	mov r6, #0
	b _037FD4C8
_037FD498:
	tst r8, #1
	beq _037FD4C0
	mov r1, r6
	add r0, r5, r4
	bl FUN_037FDA14
	cmp r0, #0
	beq _037FD4C0
	mov r2, r7
	add r1, r5, r4
	bl FUN_037FE860
_037FD4C0:
	add r6, r6, #1
	lsr r8, r8, #1
_037FD4C8:
	cmp r6, #0x10
	bge _037FD4D8
	cmp r8, #0
	bne _037FD498
_037FD4D8:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD4E0: .4byte 0x0380794C
	arm_func_end FUN_037FD478

	arm_func_start FUN_037FD4E4
FUN_037FD4E4: @ 0x037FD4E4
	push {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	lsl r0, r2, #0x10
	ldr r5, _037FD550 @ =0x0380794C
	mov r7, r1
	mov r6, #0
	lsr r8, r0, #0x10
	b _037FD538
_037FD508:
	tst r7, #1
	beq _037FD530
	mov r1, r6
	add r0, r5, r4
	bl FUN_037FDA14
	cmp r0, #0
	strhne r8, [r0, #0x1e]
	ldrbne r1, [r0]
	orrne r1, r1, #0x80
	strbne r1, [r0]
_037FD530:
	add r6, r6, #1
	lsr r7, r7, #1
_037FD538:
	cmp r6, #0x10
	bge _037FD548
	cmp r7, #0
	bne _037FD508
_037FD548:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD550: .4byte 0x0380794C
	arm_func_end FUN_037FD4E4

	arm_func_start FUN_037FD554
FUN_037FD554: @ 0x037FD554
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r6, _037FD5DC @ =0x0380794C
	mov r7, #0
	mov sl, r0
	mov sb, r1
	mov fp, r7
	mov r4, #0x24
_037FD570:
	mul r5, r7, r4
	ldrb r0, [r6, r5]
	lsl r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _037FD5C8
	mov r8, fp
	b _037FD5C0
_037FD58C:
	mov r1, r8
	add r0, r6, r5
	bl FUN_037FDA14
	cmp r0, #0
	beq _037FD5BC
	ldr r0, [r0, #0x28]
	cmp sl, r0
	cmpls r0, sb
	bhi _037FD5BC
	add r0, r6, r5
	bl FUN_037FDA98
	b _037FD5C8
_037FD5BC:
	add r8, r8, #1
_037FD5C0:
	cmp r8, #0x10
	blt _037FD58C
_037FD5C8:
	add r7, r7, #1
	cmp r7, #0x10
	blt _037FD570
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FD5DC: .4byte 0x0380794C
	arm_func_end FUN_037FD554

	arm_func_start FUN_037FD5E0
FUN_037FD5E0: @ 0x037FD5E0
	push {r4, r5, r6, r7, r8, lr}
	ldr r4, _037FD638 @ =0x0380794C
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r8, #0x24
_037FD5F8:
	mul r0, r5, r8
	ldrb r1, [r4, r0]
	add r0, r4, r0
	lsl r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	beq _037FD624
	ldr r1, [r0, #0x20]
	cmp r7, r1
	cmpls r1, r6
	bhi _037FD624
	bl FUN_037FDA98
_037FD624:
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FD5F8
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD638: .4byte 0x0380794C
	arm_func_end FUN_037FD5E0

	arm_func_start FUN_037FD63C
FUN_037FD63C: @ 0x037FD63C
	push {r3, lr}
	ldr lr, _037FD67C @ =0x0380794C
	mov ip, #0x24
	mla ip, r0, ip, lr
	cmp r3, #1
	beq _037FD668
	cmp r3, #2
	beq _037FD670
	cmp r3, #4
	streq r2, [ip, r1]
	b _037FD674
_037FD668:
	strb r2, [ip, r1]
	b _037FD674
_037FD670:
	strh r2, [ip, r1]
_037FD674:
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FD67C: .4byte 0x0380794C
	arm_func_end FUN_037FD63C

	arm_func_start FUN_037FD680
FUN_037FD680: @ 0x037FD680
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
	b _037FD700
_037FD6B0:
	tst sl, #1
	beq _037FD6F8
	ldr r0, _037FD718 @ =0x0380794C
	mov r1, r6
	add r0, r0, r5
	bl FUN_037FDA14
	cmp r0, #0
	beq _037FD6F8
	cmp r7, #1
	beq _037FD6EC
	cmp r7, #2
	beq _037FD6F4
	cmp r7, #4
	streq r8, [r0, sb]
	b _037FD6F8
_037FD6EC:
	strb r4, [r0, sb]
	b _037FD6F8
_037FD6F4:
	strh fp, [r0, sb]
_037FD6F8:
	add r6, r6, #1
	lsr sl, sl, #1
_037FD700:
	cmp r6, #0x10
	bge _037FD710
	cmp sl, #0
	bne _037FD6B0
_037FD710:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FD718: .4byte 0x0380794C
	arm_func_end FUN_037FD680

	arm_func_start FUN_037FD71C
FUN_037FD71C: @ 0x037FD71C
	ldr r1, _037FD754 @ =0x038073EC
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
_037FD754: .4byte 0x038073EC
	arm_func_end FUN_037FD71C

	arm_func_start FUN_037FD758
FUN_037FD758: @ 0x037FD758
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_037FD228
	mov r4, r0
	mov r0, r5
	bl FUN_037FD228
	orr r4, r4, r0, lsl #8
	mov r0, r5
	bl FUN_037FD228
	orr r0, r4, r0, lsl #16
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_037FD758

	arm_func_start FUN_037FD788
FUN_037FD788: @ 0x037FD788
	push {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _037FD87C
_037FD7A0: @ jump table
	b _037FD7B4 @ case 0
	b _037FD7C0 @ case 1
	b _037FD7E0 @ case 2
	b _037FD81C @ case 3
	b _037FD800 @ case 4
_037FD7B4:
	bl FUN_037FD228
	mov r5, r0
	b _037FD87C
_037FD7C0:
	bl FUN_037FD228
	mov r5, r0
	mov r0, r4
	bl FUN_037FD228
	orr r0, r5, r0, lsl #8
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	b _037FD87C
_037FD7E0:
	mov r5, #0
_037FD7E4:
	mov r0, r4
	bl FUN_037FD228
	and r1, r0, #0x7f
	tst r0, #0x80
	orr r5, r1, r5, lsl #7
	bne _037FD7E4
	b _037FD87C
_037FD800:
	bl FUN_037FD228
	mov r1, r0
	mov r0, r6
	bl FUN_037FE7D8
	cmp r0, #0
	ldrshne r5, [r0]
	b _037FD87C
_037FD81C:
	bl FUN_037FD228
	mov r5, r0
	mov r0, r4
	bl FUN_037FD228
	orr r0, r5, r0, lsl #8
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, r4
	lsl r5, r1, #0x10
	bl FUN_037FD228
	mov r6, r0
	mov r0, r4
	bl FUN_037FD228
	orr r0, r6, r0, lsl #8
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	bl FUN_037FBE58
	lsl r1, r4, #0x10
	asr r1, r1, #0x10
	sub r1, r1, r5, asr #16
	add r1, r1, #1
	mul r1, r0, r1
	asr r0, r1, #0x10
	add r5, r0, r5, asr #16
_037FD87C:
	mov r0, r5
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end FUN_037FD788

	arm_func_start FUN_037FD888
FUN_037FD888: @ 0x037FD888
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
	bl FUN_037FCD28
	mov r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x3c]
	pop {r4, lr}
	bx lr
	arm_func_end FUN_037FD888

	arm_func_start FUN_037FD968
FUN_037FD968: @ 0x037FD968
	str r1, [r0, #0x24]
	add r1, r1, r2
	str r1, [r0, #0x28]
	bx lr
	arm_func_end FUN_037FD968

	arm_func_start FUN_037FD978
FUN_037FD978: @ 0x037FD978
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r4, r0
	mov r2, #0
	bl FUN_037FDB30
	ldr r5, [r4, #0x3c]
	and r6, r7, #0xff
	mov r4, #1
	b _037FD9D0
_037FD99C:
	mov r0, r5
	bl FUN_037FC8D8
	cmp r0, #0
	beq _037FD9CC
	cmp r7, #0
	blt _037FD9C0
	mov r0, r5
	mov r1, r6
	bl FUN_037FC8B0
_037FD9C0:
	mov r0, r5
	strb r4, [r5, #0x22]
	bl FUN_037FC8CC
_037FD9CC:
	ldr r5, [r5, #0x50]
_037FD9D0:
	cmp r5, #0
	bne _037FD99C
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_037FD978

	arm_func_start FUN_037FD9E0
FUN_037FD9E0: @ 0x037FD9E0
	push {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0x3c]
	b _037FD9FC
_037FD9F0:
	mov r0, r4
	bl FUN_037FCAB4
	ldr r4, [r4, #0x50]
_037FD9FC:
	cmp r4, #0
	bne _037FD9F0
	mov r0, #0
	str r0, [r5, #0x3c]
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_037FD9E0

	arm_func_start FUN_037FDA14
FUN_037FDA14: @ 0x037FDA14
	cmp r1, #0xf
	movgt r0, #0
	bxgt lr
	add r0, r0, r1
	ldrb r1, [r0, #8]
	cmp r1, #0xff
	moveq r0, #0
	ldrne r0, _037FDA3C @ =0x03807B8C
	addne r0, r0, r1, lsl #6
	bx lr
	.align 2, 0
_037FDA3C: .4byte 0x03807B8C
	arm_func_end FUN_037FDA14

	arm_func_start FUN_037FDA40
FUN_037FDA40: @ 0x037FDA40
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r1
	bl FUN_037FDA14
	movs r5, r0
	beq _037FDA8C
	mov r1, r6
	mvn r2, #0
	bl FUN_037FD978
	mov r0, r5
	bl FUN_037FD9E0
	add ip, r6, #8
	ldrb r2, [ip, r4]
	ldr r3, _037FDA94 @ =0x03807B8C
	mov r0, #0xff
	ldrb r1, [r3, r2, lsl #6]
	bic r1, r1, #1
	strb r1, [r3, r2, lsl #6]
	strb r0, [ip, r4]
_037FDA8C:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FDA94: .4byte 0x03807B8C
	arm_func_end FUN_037FDA40

	arm_func_start FUN_037FDA98
FUN_037FDA98: @ 0x037FDA98
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
_037FDAA4:
	mov r0, r5
	mov r1, r4
	bl FUN_037FDA40
	add r4, r4, #1
	cmp r4, #0x10
	blt _037FDAA4
	ldrb r0, [r5]
	bic r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_037FDA98

	arm_func_start FUN_037FDAD0
FUN_037FDAD0: @ 0x037FDAD0
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	cmp r1, #1
	bne _037FDAF0
	mov r1, #0
	strb r1, [r5, #0x22]
	bl FUN_037FCAB4
_037FDAF0:
	ldr r1, [r4, #0x3c]
	cmp r1, r5
	ldreq r0, [r5, #0x50]
	streq r0, [r4, #0x3c]
	beq _037FDB28
	b _037FDB1C
_037FDB08:
	cmp r0, r5
	ldreq r0, [r5, #0x50]
	streq r0, [r1, #0x50]
	beq _037FDB28
	mov r1, r0
_037FDB1C:
	ldr r0, [r1, #0x50]
	cmp r0, #0
	bne _037FDB08
_037FDB28:
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_037FDAD0

	arm_func_start FUN_037FDB30
FUN_037FDB30: @ 0x037FDB30
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
	ldr r0, _037FDC84 @ =0x03806670
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
	blt _037FDBE8
	cmp r3, #0x7f
	movgt r3, #0x7f
_037FDBE8:
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
	b _037FDC74
_037FDC14:
	strh r7, [r8, #6]
	ldrb r0, [r8, #2]
	cmp r0, #3
	beq _037FDC70
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
	bne _037FDC70
	cmp sb, #0
	beq _037FDC70
	mov r0, r8
	strb fp, [r8, #0x22]
	bl FUN_037FC8CC
_037FDC70:
	ldr r8, [r8, #0x50]
_037FDC74:
	cmp r8, #0
	bne _037FDC14
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FDC84: .4byte 0x03806670
	arm_func_end FUN_037FDB30

	arm_func_start FUN_037FDC88
FUN_037FDC88: @ 0x037FDC88
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r2, #0
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	mov r7, r0
	mov sl, r2
_037FDCA4:
	mov r0, r7
	mov r1, sl
	bl FUN_037FDA14
	movs r8, r0
	ldrne r0, [r8, #0x28]
	cmpne r0, #0
	beq _037FE7A4
	ldr r0, [r8, #0x3c]
	b _037FDD00
_037FDCC8:
	ldr r1, [r0, #0x34]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0x34]
	ldrb r1, [r0, #3]
	lsl r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	bne _037FDCFC
	ldr r2, [r0, #0x14]
	ldr r1, [r0, #0x18]
	cmp r2, r1
	addlt r1, r2, #1
	strlt r1, [r0, #0x14]
_037FDCFC:
	ldr r0, [r0, #0x50]
_037FDD00:
	cmp r0, #0
	bne _037FDCC8
	ldrb r1, [r8]
	lsl r0, r1, #0x1b
	lsrs r0, r0, #0x1f
	beq _037FDD30
	ldr r0, [r8, #0x3c]
	cmp r0, #0
	movne r0, #0
	bne _037FE788
	bic r0, r1, #0x10
	strb r0, [r8]
_037FDD30:
	ldr r0, [r8, #0x20]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r8, #0x20]
	cmpgt r0, #0
	movgt r0, #0
	bgt _037FE788
	ldr r0, [r8, #0x28]
	bl FUN_037FD71C
	ldr r0, _037FE7CC @ =0x0000FFFF
	sub fp, r0, #0x10000
	b _037FE768
_037FDD60:
	mov r0, r8
	mov sb, #0
	mov r4, #1
	bl FUN_037FD228
	mov r6, r0
	cmp r6, #0xa2
	bne _037FDD94
	mov r0, r8
	bl FUN_037FD228
	mov r6, r0
	ldrb r0, [r8]
	lsl r0, r0, #0x19
	lsr r4, r0, #0x1f
_037FDD94:
	cmp r6, #0xa0
	bne _037FDDB0
	mov r0, r8
	bl FUN_037FD228
	mov r6, r0
	mov r5, #3
	mov sb, #1
_037FDDB0:
	cmp r6, #0xa1
	bne _037FDDCC
	mov r0, r8
	bl FUN_037FD228
	mov r6, r0
	mov r5, #4
	mov sb, #1
_037FDDCC:
	tst r6, #0x80
	bne _037FE050
	mov r0, r8
	bl FUN_037FD228
	cmp sb, #0
	str r0, [sp, #0xc]
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl FUN_037FD788
	cmp r4, #0
	mov r4, r0
	ldrsb r0, [r8, #0x13]
	add sb, r6, r0
	beq _037FE768
	cmp sb, #0
	movlt sb, #0
	blt _037FDE20
	cmp sb, #0x7f
	movgt sb, #0x7f
_037FDE20:
	ldrb r1, [r8]
	lsl r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	bne _037FE024
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _037FE024
	lsl r0, r1, #0x1c
	mov r6, #0
	lsrs r0, r0, #0x1f
	ldrne r6, [r8, #0x3c]
	cmpne r6, #0
	strbne sb, [r6, #8]
	ldrne r0, [sp, #0xc]
	strbne r0, [r6, #9]
	cmp r6, #0
	bne _037FDF54
	ldr r0, [r7, #0x20]
	ldrh r1, [r8, #2]
	mov r2, sb
	add r3, sp, #0x16
	bl FUN_037FE8E0
	cmp r0, #0
	beq _037FE024
	ldrb r0, [sp, #0x16]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _037FE024
_037FDE90: @ jump table
	b _037FE024 @ case 0
	b _037FDEA4 @ case 1
	b _037FDEAC @ case 2
	b _037FDEB4 @ case 3
	b _037FDEA4 @ case 4
_037FDEA4:
	ldr r1, _037FE7CC @ =0x0000FFFF
	b _037FDEB8
_037FDEAC:
	mov r1, #0x3f00
	b _037FDEB8
_037FDEB4:
	mov r1, #0xc000
_037FDEB8:
	ldrh r0, [r8, #0x1e]
	ldr r3, _037FE7D0 @ =FUN_037FDAD0
	str r8, [sp]
	ldrb r2, [r8]
	and r0, r1, r0
	lsl r2, r2, #0x18
	ldrb r6, [r7, #4]
	ldrb r1, [r8, #0x12]
	lsr r2, r2, #0x1f
	add r1, r6, r1
	bl FUN_037FC8E8
	movs r6, r0
	beq _037FE024
	ldrb r0, [r8]
	lsl r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	movne r3, fp
	bne _037FDF0C
	cmp r4, #0
	movgt r3, r4
	movle r3, fp
_037FDF0C:
	ldr r2, [sp, #0xc]
	ldr r1, [r7, #0x20]
	mov r0, r6
	str r1, [sp]
	add r1, sp, #0x16
	str r1, [sp, #4]
	mov r1, sb
	bl FUN_037FEAA0
	cmp r0, #0
	bne _037FDF48
	mov r0, #0
	strb r0, [r6, #0x22]
	mov r0, r6
	bl FUN_037FCAB4
	b _037FE024
_037FDF48:
	ldr r0, [r8, #0x3c]
	str r0, [r6, #0x50]
	str r6, [r8, #0x3c]
_037FDF54:
	ldrb r1, [r8, #0xe]
	cmp r1, #0xff
	beq _037FDF68
	mov r0, r6
	bl FUN_037FC86C
_037FDF68:
	ldrb r1, [r8, #0xf]
	cmp r1, #0xff
	beq _037FDF7C
	mov r0, r6
	bl FUN_037FC88C
_037FDF7C:
	ldrb r1, [r8, #0x10]
	cmp r1, #0xff
	beq _037FDF90
	mov r0, r6
	bl FUN_037FC8A8
_037FDF90:
	ldrb r1, [r8, #0x11]
	cmp r1, #0xff
	beq _037FDFA4
	mov r0, r6
	bl FUN_037FC8B0
_037FDFA4:
	ldrsh r0, [r8, #0x16]
	strh r0, [r6, #0x32]
	ldrb r0, [r8]
	lsl r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	beq _037FDFD4
	ldrsh r1, [r6, #0x32]
	ldrb r0, [r8, #0x14]
	sub r0, r0, sb
	lsl r0, r0, #0x16
	add r0, r1, r0, asr #16
	strh r0, [r6, #0x32]
_037FDFD4:
	ldrb r0, [r8, #0x15]
	cmp r0, #0
	bne _037FE000
	cmp r4, #0
	movgt r0, r4
	movle r0, fp
	str r0, [r6, #0x18]
	ldrb r0, [r6, #3]
	bic r0, r0, #4
	strb r0, [r6, #3]
	b _037FE01C
_037FE000:
	mul r1, r0, r0
	ldrsh r0, [r6, #0x32]
	cmp r0, #0
	rsblt r0, r0, #0
	mul r0, r1, r0
	asr r0, r0, #0xb
	str r0, [r6, #0x18]
_037FE01C:
	mov r0, #0
	str r0, [r6, #0x14]
_037FE024:
	strb sb, [r8, #0x14]
	ldrb r0, [r8]
	lsl r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _037FE768
	str r4, [r8, #0x20]
	cmp r4, #0
	ldrbeq r0, [r8]
	orreq r0, r0, #0x10
	strbeq r0, [r8]
	b _037FE768
_037FE050:
	and r0, r6, #0xf0
	cmp r0, #0xc0
	bgt _037FE084
	bge _037FE1CC
	cmp r0, #0x90
	bgt _037FE078
	bge _037FE0F0
	cmp r0, #0x80
	beq _037FE0A8
	b _037FE768
_037FE078:
	cmp r0, #0xb0
	beq _037FE47C
	b _037FE768
_037FE084:
	cmp r0, #0xe0
	bgt _037FE09C
	bge _037FE428
	cmp r0, #0xd0
	beq _037FE1CC
	b _037FE768
_037FE09C:
	cmp r0, #0xf0
	beq _037FE6C4
	b _037FE768
_037FE0A8:
	cmp sb, #0
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl FUN_037FD788
	cmp r4, #0
	beq _037FE768
	cmp r6, #0x80
	beq _037FE0DC
	cmp r6, #0x81
	beq _037FE0E4
	b _037FE768
_037FE0DC:
	str r0, [r8, #0x20]
	b _037FE768
_037FE0E4:
	cmp r0, #0x10000
	strhlt r0, [r8, #2]
	b _037FE768
_037FE0F0:
	cmp r6, #0x93
	beq _037FE10C
	cmp r6, #0x94
	beq _037FE16C
	cmp r6, #0x95
	beq _037FE188
	b _037FE768
_037FE10C:
	mov r0, r8
	bl FUN_037FD228
	mov r6, r0
	mov r0, r8
	bl FUN_037FD758
	cmp r4, #0
	mov sb, r0
	beq _037FE768
	mov r1, r6
	mov r0, r7
	bl FUN_037FDA14
	movs r4, r0
	cmpne r4, r8
	beq _037FE768
	mov r1, r7
	mov r2, fp
	bl FUN_037FD978
	mov r0, r4
	bl FUN_037FD9E0
	mov r0, r4
	mov r2, sb
	ldr r1, [r8, #0x24]
	bl FUN_037FD968
	b _037FE768
_037FE16C:
	mov r0, r8
	bl FUN_037FD758
	cmp r4, #0
	ldrne r1, [r8, #0x24]
	addne r0, r1, r0
	strne r0, [r8, #0x28]
	b _037FE768
_037FE188:
	mov r0, r8
	bl FUN_037FD758
	cmp r4, #0
	beq _037FE768
	ldrb r1, [r8, #0x3b]
	cmp r1, #3
	bhs _037FE768
	add r1, r8, r1, lsl #2
	ldr r2, [r8, #0x28]
	str r2, [r1, #0x2c]
	ldrb r1, [r8, #0x3b]
	add r1, r1, #1
	strb r1, [r8, #0x3b]
	ldr r1, [r8, #0x24]
	add r0, r1, r0
	str r0, [r8, #0x28]
	b _037FE768
_037FE1CC:
	cmp sb, #0
	movne r2, r5
	moveq r2, #0
	mov r0, r8
	mov r1, r7
	bl FUN_037FD788
	cmp r4, #0
	strb r0, [sp, #0x14]
	beq _037FE768
	sub r1, r6, #0xc0
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _037FE768
_037FE200: @ jump table
	b _037FE3F8 @ case 0
	b _037FE260 @ case 1
	b _037FE278 @ case 2
	b _037FE3E0 @ case 3
	b _037FE3EC @ case 4
	b _037FE284 @ case 5
	b _037FE290 @ case 6
	b _037FE29C @ case 7
	b _037FE35C @ case 8
	b _037FE3A4 @ case 9
	b _037FE2C4 @ case 10
	b _037FE2D0 @ case 11
	b _037FE2DC @ case 12
	b _037FE2E8 @ case 13
	b _037FE3C4 @ case 14
	b _037FE2B8 @ case 15
	b _037FE2F4 @ case 16
	b _037FE300 @ case 17
	b _037FE30C @ case 18
	b _037FE318 @ case 19
	b _037FE324 @ case 20
	b _037FE26C @ case 21
	b _037FE408 @ case 22
	b _037FE390 @ case 23
_037FE260:
	and r0, r0, #0xff
	strb r0, [r8, #4]
	b _037FE768
_037FE26C:
	and r0, r0, #0xff
	strb r0, [r8, #5]
	b _037FE768
_037FE278:
	and r0, r0, #0xff
	strb r0, [r7, #5]
	b _037FE768
_037FE284:
	and r0, r0, #0xff
	strb r0, [r8, #7]
	b _037FE768
_037FE290:
	and r0, r0, #0xff
	strb r0, [r8, #0x12]
	b _037FE768
_037FE29C:
	and r0, r0, #0xff
	lsl r0, r0, #0x1f
	ldrb r1, [r8]
	bic r1, r1, #2
	orr r0, r1, r0, lsr #30
	strb r0, [r8]
	b _037FE768
_037FE2B8:
	and r0, r0, #0xff
	strb r0, [r8, #0x15]
	b _037FE768
_037FE2C4:
	and r0, r0, #0xff
	strb r0, [r8, #0x1a]
	b _037FE768
_037FE2D0:
	and r0, r0, #0xff
	strb r0, [r8, #0x19]
	b _037FE768
_037FE2DC:
	and r0, r0, #0xff
	strb r0, [r8, #0x18]
	b _037FE768
_037FE2E8:
	and r0, r0, #0xff
	strb r0, [r8, #0x1b]
	b _037FE768
_037FE2F4:
	and r0, r0, #0xff
	strb r0, [r8, #0xe]
	b _037FE768
_037FE300:
	and r0, r0, #0xff
	strb r0, [r8, #0xf]
	b _037FE768
_037FE30C:
	and r0, r0, #0xff
	strb r0, [r8, #0x10]
	b _037FE768
_037FE318:
	and r0, r0, #0xff
	strb r0, [r8, #0x11]
	b _037FE768
_037FE324:
	ldrb r1, [r8, #0x3b]
	cmp r1, #3
	bhs _037FE768
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
	b _037FE768
_037FE35C:
	and r0, r0, #0xff
	lsl r1, r0, #0x1f
	ldrb r2, [r8]
	mov r0, r8
	bic r2, r2, #8
	orr r1, r2, r1, lsr #28
	strb r1, [r8]
	mov r1, r7
	mov r2, fp
	bl FUN_037FD978
	mov r0, r8
	bl FUN_037FD9E0
	b _037FE768
_037FE390:
	and r2, r0, #0xff
	mov r0, r8
	mov r1, r7
	bl FUN_037FE860
	b _037FE768
_037FE3A4:
	and r1, r0, #0xff
	ldrsb r0, [r8, #0x13]
	add r0, r1, r0
	strb r0, [r8, #0x14]
	ldrb r0, [r8]
	orr r0, r0, #0x20
	strb r0, [r8]
	b _037FE768
_037FE3C4:
	and r0, r0, #0xff
	lsl r0, r0, #0x1f
	ldrb r1, [r8]
	bic r1, r1, #0x20
	orr r0, r1, r0, lsr #26
	strb r0, [r8]
	b _037FE768
_037FE3E0:
	ldrsb r0, [sp, #0x14]
	strb r0, [r8, #0x13]
	b _037FE768
_037FE3EC:
	ldrsb r0, [sp, #0x14]
	strb r0, [r8, #6]
	b _037FE768
_037FE3F8:
	and r0, r0, #0xff
	sub r0, r0, #0x40
	strb r0, [r8, #8]
	b _037FE768
_037FE408:
	ldr r1, _037FE7D4 @ =0x038073EC
	ldr r1, [r1]
	cmp r1, #0
	beq _037FE768
	and r1, r0, #0xff
	mov r0, r7
	bl FUN_037FE7D8
	b _037FE768
_037FE428:
	cmp sb, #0
	movne r2, r5
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl FUN_037FD788
	lsl r0, r0, #0x10
	cmp r4, #0
	asr r0, r0, #0x10
	beq _037FE768
	cmp r6, #0xe0
	beq _037FE474
	cmp r6, #0xe1
	beq _037FE46C
	cmp r6, #0xe3
	strheq r0, [r8, #0x16]
	b _037FE768
_037FE46C:
	strh r0, [r7, #0x18]
	b _037FE768
_037FE474:
	strh r0, [r8, #0x1c]
	b _037FE768
_037FE47C:
	mov r0, r8
	bl FUN_037FD228
	cmp sb, #0
	movne r2, r5
	mov sb, r0
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl FUN_037FD788
	lsl r0, r0, #0x10
	mov r1, sb
	asr sb, r0, #0x10
	mov r0, r7
	bl FUN_037FE7D8
	cmp r4, #0
	mov r4, r0
	cmpne r4, #0
	beq _037FE768
	sub r0, r6, #0xb0
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _037FE768
_037FE4D4: @ jump table
	b _037FE50C @ case 0
	b _037FE514 @ case 1
	b _037FE524 @ case 2
	b _037FE534 @ case 3
	b _037FE544 @ case 4
	b _037FE560 @ case 5
	b _037FE584 @ case 6
	b _037FE768 @ case 7
	b _037FE5BC @ case 8
	b _037FE5E8 @ case 9
	b _037FE614 @ case 10
	b _037FE640 @ case 11
	b _037FE66C @ case 12
	b _037FE698 @ case 13
_037FE50C:
	strh sb, [r4]
	b _037FE768
_037FE514:
	ldrsh r0, [r4]
	add r0, r0, sb
	strh r0, [r4]
	b _037FE768
_037FE524:
	ldrsh r0, [r4]
	sub r0, r0, sb
	strh r0, [r4]
	b _037FE768
_037FE534:
	ldrsh r0, [r4]
	mul r1, r0, sb
	strh r1, [r4]
	b _037FE768
_037FE544:
	cmp sb, #0
	beq _037FE768
	mov r1, sb
	ldrsh r0, [r4]
	bl FUN_0380625C
	strh r0, [r4]
	b _037FE768
_037FE560:
	cmp sb, #0
	ldrshge r0, [r4]
	lslge r0, r0, sb
	strhge r0, [r4]
	ldrshlt r1, [r4]
	rsblt r0, sb, #0
	asrlt r0, r1, r0
	strhlt r0, [r4]
	b _037FE768
_037FE584:
	cmp sb, #0
	rsblt r0, sb, #0
	lsllt r0, r0, #0x10
	mov r6, #0
	asrlt sb, r0, #0x10
	movlt r6, #1
	bl FUN_037FBE58
	add r1, sb, #1
	mul r1, r0, r1
	asr r0, r1, #0x10
	cmp r6, #0
	rsbne r0, r0, #0
	strh r0, [r4]
	b _037FE768
_037FE5BC:
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
	b _037FE768
_037FE5E8:
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
	b _037FE768
_037FE614:
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
	b _037FE768
_037FE640:
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
	b _037FE768
_037FE66C:
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
	b _037FE768
_037FE698:
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
	b _037FE768
_037FE6C4:
	cmp r4, #0
	beq _037FE768
	sub r0, r6, #0xfc
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _037FE768
_037FE6DC: @ jump table
	b _037FE714 @ case 0
	b _037FE6EC @ case 1
	b _037FE768 @ case 2
	b _037FE760 @ case 3
_037FE6EC:
	ldrb r0, [r8, #0x3b]
	cmp r0, #0
	beq _037FE768
	sub r0, r0, #1
	strb r0, [r8, #0x3b]
	and r0, r0, #0xff
	add r0, r8, r0, lsl #2
	ldr r0, [r0, #0x2c]
	str r0, [r8, #0x28]
	b _037FE768
_037FE714:
	ldrb r0, [r8, #0x3b]
	cmp r0, #0
	beq _037FE768
	add r1, r8, r0
	ldrb r0, [r1, #0x37]
	cmp r0, #0
	beq _037FE748
	sub r0, r0, #1
	ands r0, r0, #0xff
	ldrbeq r0, [r8, #0x3b]
	subeq r0, r0, #1
	strbeq r0, [r8, #0x3b]
	beq _037FE768
_037FE748:
	strb r0, [r1, #0x37]
	ldrb r0, [r8, #0x3b]
	add r0, r8, r0, lsl #2
	ldr r0, [r0, #0x28]
	str r0, [r8, #0x28]
	b _037FE768
_037FE760:
	mvn r0, #0
	b _037FE788
_037FE768:
	ldr r0, [r8, #0x20]
	cmp r0, #0
	bne _037FE784
	ldrb r0, [r8]
	lsl r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	beq _037FDD60
_037FE784:
	mov r0, #0
_037FE788:
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x10]
	beq _037FE7A4
	mov r0, r7
	mov r1, sl
	bl FUN_037FDA40
_037FE7A4:
	add sl, sl, #1
	cmp sl, #0x10
	blt _037FDCA4
	ldr r0, [sp, #0x10]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x24
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FE7CC: .4byte 0x0000FFFF
_037FE7D0: .4byte FUN_037FDAD0
_037FE7D4: .4byte 0x038073EC
	arm_func_end FUN_037FDC88

	arm_func_start FUN_037FE7D8
FUN_037FE7D8: @ 0x037FE7D8
	ldr r2, _037FE818 @ =0x03807408
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
_037FE818: .4byte 0x03807408
	arm_func_end FUN_037FE7D8

	arm_func_start FUN_037FE81C
FUN_037FE81C: @ 0x037FE81C
	ldr ip, _037FE85C @ =0x03807B8C
	mov r0, #0
	b _037FE84C
_037FE828:
	ldrb r1, [ip, r0, lsl #6]
	lsl r3, r0, #6
	lsl r2, r1, #0x1f
	lsrs r2, r2, #0x1f
	biceq r1, r1, #1
	orreq r1, r1, #1
	strbeq r1, [ip, r3]
	bxeq lr
	add r0, r0, #1
_037FE84C:
	cmp r0, #0x20
	blt _037FE828
	mvn r0, #0
	bx lr
	.align 2, 0
_037FE85C: .4byte 0x03807B8C
	arm_func_end FUN_037FE81C

	arm_func_start FUN_037FE860
FUN_037FE860: @ 0x037FE860
	push {r4, lr}
	mov r4, r0
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _037FE8D8
_037FE874: @ jump table
	b _037FE884 @ case 0
	b _037FE894 @ case 1
	b _037FE8A4 @ case 2
	b _037FE8BC @ case 3
_037FE884:
	ldrb r0, [r4]
	bic r0, r0, #4
	strb r0, [r4]
	b _037FE8D8
_037FE894:
	ldrb r0, [r4]
	orr r0, r0, #4
	strb r0, [r4]
	b _037FE8D8
_037FE8A4:
	ldrb r3, [r4]
	mvn r2, #0
	orr r3, r3, #4
	strb r3, [r4]
	bl FUN_037FD978
	b _037FE8D8
_037FE8BC:
	ldrb r3, [r4]
	mov r2, #0x7f
	orr r3, r3, #4
	strb r3, [r4]
	bl FUN_037FD978
	mov r0, r4
	bl FUN_037FD9E0
_037FE8D8:
	pop {r4, lr}
	bx lr
	arm_func_end FUN_037FE860

	arm_func_start FUN_037FE8E0
FUN_037FE8E0: @ 0x037FE8E0
	push {r3, r4, r5, r6, r7, lr}
	movs r7, r1
	mov r6, r0
	mov r5, r2
	mov r4, r3
	movmi r0, #0
	bmi _037FEA58
	bl FUN_037FBF78
	ldr r0, [r6, #0x38]
	cmp r7, r0
	blo _037FE918
	bl FUN_037FBF7C
	mov r0, #0
	b _037FEA58
_037FE918:
	add r0, r6, r7, lsl #2
	ldr r1, [r0, #0x3c]
	and r0, r1, #0xff
	strb r1, [r4]
	cmp r0, #0x11
	lsr r1, r1, #8
	addls pc, pc, r0, lsl #2
	b _037FEA44
_037FE938: @ jump table
	b _037FEA44 @ case 0
	b _037FE980 @ case 1
	b _037FE980 @ case 2
	b _037FE980 @ case 3
	b _037FE980 @ case 4
	b _037FE980 @ case 5
	b _037FEA44 @ case 6
	b _037FEA44 @ case 7
	b _037FEA44 @ case 8
	b _037FEA44 @ case 9
	b _037FEA44 @ case 10
	b _037FEA44 @ case 11
	b _037FEA44 @ case 12
	b _037FEA44 @ case 13
	b _037FEA44 @ case 14
	b _037FEA44 @ case 15
	b _037FE9A0 @ case 16
	b _037FE9F0 @ case 17
_037FE980:
	add r3, r6, r1
	add r2, r4, #2
	mov r1, #5
_037FE98C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _037FE98C
	b _037FEA50
_037FE9A0:
	ldrb r0, [r6, r1]
	add r2, r6, r1
	ldrb r1, [r2, #1]
	cmp r5, r0
	blt _037FE9BC
	cmp r5, r1
	ble _037FE9C8
_037FE9BC:
	bl FUN_037FBF7C
	mov r0, #0
	b _037FEA58
_037FE9C8:
	sub r1, r5, r0
	mov r0, #0xc
	mla r0, r1, r0, r2
	add r2, r0, #2
	mov r1, #6
_037FE9DC:
	ldrh r0, [r2], #2
	subs r1, r1, #1
	strh r0, [r4], #2
	bne _037FE9DC
	b _037FEA50
_037FE9F0:
	add r2, r6, r1
	mov r1, #0
	b _037FEA14
_037FE9FC:
	add r1, r1, #1
	cmp r1, #8
	blt _037FEA14
	bl FUN_037FBF7C
	mov r0, #0
	b _037FEA58
_037FEA14:
	ldrb r0, [r2, r1]
	cmp r5, r0
	bgt _037FE9FC
	mov r0, #0xc
	mla r0, r1, r0, r2
	add r2, r0, #8
	mov r1, #6
_037FEA30:
	ldrh r0, [r2], #2
	subs r1, r1, #1
	strh r0, [r4], #2
	bne _037FEA30
	b _037FEA50
_037FEA44:
	bl FUN_037FBF7C
	mov r0, #0
	b _037FEA58
_037FEA50:
	bl FUN_037FBF7C
	mov r0, #1
_037FEA58:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_037FE8E0

	arm_func_start FUN_037FEA60
FUN_037FEA60: @ 0x037FEA60
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl FUN_037FBF78
	add r0, r5, r4, lsl #2
	ldr r4, [r0, #0x3c]
	cmp r4, #0
	beq _037FEA8C
	cmp r4, #0x2000000
	addlo r4, r5, r4
	b _037FEA90
_037FEA8C:
	mov r4, #0
_037FEA90:
	bl FUN_037FBF7C
	mov r0, r4
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_037FEA60

	arm_func_start FUN_037FEAA0
FUN_037FEAA0: @ 0x037FEAA0
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
	b _037FEB80
_037FEAD8: @ jump table
	b _037FEB80 @ case 0
	b _037FEAEC @ case 1
	b _037FEB5C @ case 2
	b _037FEB70 @ case 3
	b _037FEAEC @ case 4
_037FEAEC:
	cmp r0, #1
	bne _037FEB30
	ldr r2, [sp, #0x20]
	ldrh r0, [r5, #4]
	ldrh r1, [r5, #2]
	add r0, r2, r0, lsl #3
	ldr r0, [r0, #0x18]
	cmp r0, #0
	moveq r1, #0
	beq _037FEB3C
	ldr r2, [r0, #0x38]
	cmp r1, r2
	movhs r1, #0
	bhs _037FEB3C
	bl FUN_037FEA60
	mov r1, r0
	b _037FEB3C
_037FEB30:
	ldrh r1, [r5, #4]
	ldrh r0, [r5, #2]
	orr r1, r0, r1, lsl #16
_037FEB3C:
	cmp r1, #0
	moveq r0, #0
	beq _037FEB84
	mov r0, sb
	mov r3, r6
	add r2, r1, #0xc
	bl FUN_037FC6F8
	b _037FEB84
_037FEB5C:
	ldrh r1, [r5, #2]
	mov r0, sb
	mov r2, r6
	bl FUN_037FC734
	b _037FEB84
_037FEB70:
	mov r0, sb
	mov r1, r6
	bl FUN_037FC780
	b _037FEB84
_037FEB80:
	mov r0, #0
_037FEB84:
	cmp r0, #0
	moveq r0, #0
	beq _037FEBE0
	strb r8, [sb, #8]
	ldrb r1, [r5, #6]
	mov r0, sb
	strb r1, [sb, #5]
	strb r7, [sb, #9]
	ldrb r1, [r5, #7]
	bl FUN_037FC86C
	ldrb r1, [r5, #8]
	mov r0, sb
	bl FUN_037FC88C
	ldrb r1, [r5, #9]
	mov r0, sb
	bl FUN_037FC8A8
	mov r0, sb
	mov r1, r4
	bl FUN_037FC8B0
	ldrb r1, [r5, #0xb]
	mov r0, #1
	sub r1, r1, #0x40
	strb r1, [sb, #0xa]
_037FEBE0:
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end FUN_037FEAA0

	arm_func_start FUN_037FEBE8
FUN_037FEBE8: @ 0x037FEBE8
	ldr ip, _037FEC04 @ =0x03807408
	mov r3, #0x24
	ldr ip, [ip]
	mla r3, r0, r3, ip
	add r0, r3, r1, lsl #1
	strh r2, [r0, #0x20]
	bx lr
	.align 2, 0
_037FEC04: .4byte 0x03807408
	arm_func_end FUN_037FEBE8

	arm_func_start FUN_037FEC08
FUN_037FEC08: @ 0x037FEC08
	ldr r2, _037FEC20 @ =0x03807408
	ldr r2, [r2]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x200
	strh r1, [r0, #0x60]
	bx lr
	.align 2, 0
_037FEC20: .4byte 0x03807408
	arm_func_end FUN_037FEC08

	arm_func_start FUN_037FEC24
FUN_037FEC24: @ 0x037FEC24
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _037FECB8 @ =0x03807408
	mov r4, #0
	ldr r0, [r0]
	mov r5, r4
	cmp r0, #0
	beq _037FECB0
	mov r7, r4
	mov r6, #1
_037FEC48:
	mov r0, r7
	bl FUN_037FBAE4
	cmp r0, #0
	orrne r0, r4, r6, lsl r7
	lslne r0, r0, #0x10
	add r7, r7, #1
	lsrne r4, r0, #0x10
	cmp r7, #0x10
	blt _037FEC48
	mov r0, #0
	bl FUN_037FC0E0
	cmp r0, #0
	orrne r0, r5, #1
	lslne r0, r0, #0x10
	lsrne r5, r0, #0x10
	mov r0, #1
	bl FUN_037FC0E0
	cmp r0, #0
	orrne r0, r5, #2
	lslne r0, r0, #0x10
	lsrne r5, r0, #0x10
	ldr r0, _037FECB8 @ =0x03807408
	ldr r1, [r0]
	strh r4, [r1, #8]
	ldr r0, [r0]
	strh r5, [r0, #0xa]
_037FECB0:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FECB8: .4byte 0x03807408
	arm_func_end FUN_037FEC24

	arm_func_start FUN_037FECBC
FUN_037FECBC: @ 0x037FECBC
	ldr r1, _037FECE4 @ =0x0380740C
	mov r3, #0
	mov r2, r3
_037FECC8:
	add r0, r1, r3, lsl #6
	strb r2, [r0, #0xf80]
	add r3, r3, #1
	strb r2, [r0, #0xf81]
	cmp r3, #8
	blt _037FECC8
	bx lr
	.align 2, 0
_037FECE4: .4byte 0x0380740C
	arm_func_end FUN_037FECBC

	arm_func_start FUN_037FECE8
FUN_037FECE8: @ 0x037FECE8
	push {r4, r5, r6, r7, r8, lr}
	ldr lr, _037FED40 @ =0x0380838C
	ldr r4, [sp, #0x18]
	ldrb ip, [lr, r0, lsl #6]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp ip, #0
	add r8, lr, r0, lsl #6
	beq _037FED20
	add r0, r8, #0x14
	bl FUN_037FA5E4
	mov r0, #0
	strb r0, [r8]
_037FED20:
	str r7, [r8, #4]
	str r6, [r8, #8]
	str r5, [r8, #0xc]
	ldr r0, [sp, #0x1c]
	str r4, [r8, #0x10]
	strb r0, [r8, #1]
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FED40: .4byte 0x0380838C
	arm_func_end FUN_037FECE8

	arm_func_start FUN_037FED44
FUN_037FED44: @ 0x037FED44
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	ldr r1, _037FEDF8 @ =0x0380838C
	mov sb, r0
	ldrb r0, [r1, sb, lsl #6]
	add r8, r1, sb, lsl #6
	cmp r0, #0
	beq _037FED74
	add r0, r8, #0x14
	bl FUN_037FA5E4
	mov r0, #0
	strb r0, [r8]
_037FED74:
	ldrb r1, [r8, #1]
	ldr r7, [r8, #0xc]
	ldr r6, [r8, #0x10]
	add r0, r8, #0x14
	ldr r5, [r8, #4]
	ldr r4, [r8, #8]
	orr sb, sb, r1, lsl #8
	bl FUN_037FA3C4
	cmp r6, #0
	cmpeq r7, #0
	bne _037FEDBC
	ldr r3, _037FEDFC @ =FUN_037FEE40
	mov r1, r5
	mov r2, r4
	add r0, r8, #0x14
	str sb, [sp]
	bl FUN_037FA500
	b _037FEDE4
_037FEDBC:
	bl FUN_037FA240
	ldr r2, _037FEDFC @ =FUN_037FEE40
	adds r0, r5, r0
	stmib sp, {r2, sb}
	adc r2, r4, r1
	mov r1, r0
	mov r3, r7
	add r0, r8, #0x14
	str r6, [sp]
	bl FUN_037FA570
_037FEDE4:
	mov r0, #1
	strb r0, [r8]
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FEDF8: .4byte 0x0380838C
_037FEDFC: .4byte FUN_037FEE40
	arm_func_end FUN_037FED44

	arm_func_start FUN_037FEE00
FUN_037FEE00: @ 0x037FEE00
	push {r4, lr}
	ldr r2, _037FEE3C @ =0x0380838C
	ldrb r1, [r2, r0, lsl #6]
	add r4, r2, r0, lsl #6
	cmp r1, #0
	beq _037FEE34
	add r0, r4, #0x14
	bl FUN_037FA5E4
	ldrb r1, [r4, #1]
	mov r0, #0
	add r1, r1, #1
	strb r1, [r4, #1]
	strb r0, [r4]
_037FEE34:
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FEE3C: .4byte 0x0380838C
	arm_func_end FUN_037FEE00

	arm_func_start FUN_037FEE40
FUN_037FEE40: @ 0x037FEE40
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #7
	mov r4, #0
_037FEE50:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	blt _037FEE50
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end FUN_037FEE40

	arm_func_start FUN_037FEE70
FUN_037FEE70: @ 0x037FEE70
	push {r3, lr}
	ldr r0, _037FEEA4 @ =0x0380858C
	ldr r1, _037FEEA8 @ =0x038085AC
	mov r2, #8
	bl FUN_037F96D0
	ldr r1, _037FEEAC @ =FUN_037FF564
	mov r0, #7
	bl FUN_037FB330
	ldr r0, _037FEEB0 @ =0x03807408
	mov r1, #0
	str r1, [r0]
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FEEA4: .4byte 0x0380858C
_037FEEA8: .4byte 0x038085AC
_037FEEAC: .4byte FUN_037FF564
_037FEEB0: .4byte 0x03807408
	arm_func_end FUN_037FEE70

	arm_func_start FUN_037FEEB4
FUN_037FEEB4: @ 0x037FEEB4
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	b _037FF52C
_037FEEC0:
	ldr sl, _037FF550 @ =0x04000509
	ldr r6, [sp, #0x18]
	sub r4, sl, #1
	b _037FF510
_037FEED0:
	add r5, sp, #0x1c
	ldm r6!, {r0, r1, r2, r3}
	stm r5!, {r0, r1, r2, r3}
	ldm r6, {r0, r1}
	stm r5, {r0, r1}
	ldr r0, [sp, #0x20]
	cmp r0, #0x21
	addls pc, pc, r0, lsl #2
	b _037FF50C
_037FEEF4: @ jump table
	b _037FEF7C @ case 0
	b _037FEF94 @ case 1
	b _037FEFA0 @ case 2
	b _037FEFB8 @ case 3
	b _037FEFC4 @ case 4
	b _037FEFD4 @ case 5
	b _037FEFE4 @ case 6
	b _037FEFFC @ case 7
	b _037FF024 @ case 8
	b _037FF038 @ case 9
	b _037FF04C @ case 10
	b _037FF068 @ case 11
	b _037FF080 @ case 12
	b _037FF148 @ case 13
	b _037FF324 @ case 14
	b _037FF3A4 @ case 15
	b _037FF3DC @ case 16
	b _037FF1EC @ case 17
	b _037FF234 @ case 18
	b _037FF25C @ case 19
	b _037FF29C @ case 20
	b _037FF2E4 @ case 21
	b _037FF40C @ case 22
	b _037FF418 @ case 23
	b _037FF424 @ case 24
	b _037FF430 @ case 25
	b _037FF448 @ case 26
	b _037FF458 @ case 27
	b _037FF468 @ case 28
	b _037FF4A8 @ case 29
	b _037FF478 @ case 30
	b _037FF488 @ case 31
	b _037FF498 @ case 32
	b _037FF4B8 @ case 33
_037FEF7C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl FUN_037FD2A8
	b _037FF50C
_037FEF94:
	ldr r0, [sp, #0x24]
	bl FUN_037FD2D8
	b _037FF50C
_037FEFA0:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl FUN_037FD04C
	b _037FF50C
_037FEFB8:
	ldr r0, [sp, #0x24]
	bl FUN_037FD288
	b _037FF50C
_037FEFC4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_037FD334
	b _037FF50C
_037FEFD4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_037FD3AC
	b _037FF50C
_037FEFE4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl FUN_037FD63C
	b _037FF50C
_037FEFFC:
	ldr r1, [sp, #0x24]
	lsr r0, r1, #0x18
	and r0, r0, #0xff
	str r0, [sp]
	bic r0, r1, #0xff000000
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl FUN_037FD680
	b _037FF50C
_037FF024:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl FUN_037FD478
	b _037FF50C
_037FF038:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl FUN_037FD4E4
	b _037FF50C
_037FF04C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl FUN_037FEBE8
	b _037FF50C
_037FF068:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl FUN_037FEC08
	b _037FF50C
_037FF080:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl FUN_037FAD24
	mov r8, r0
	mov r2, #0
	b _037FF0BC
_037FF09C:
	tst r5, #1
	lslne r0, r2, #4
	addne r0, r0, #0x4000000
	ldrbne r1, [r0, #0x403]
	add r2, r2, #1
	orrne r1, r1, #0x80
	strbne r1, [r0, #0x403]
	lsr r5, r5, #1
_037FF0BC:
	cmp r2, #0x10
	bge _037FF0CC
	cmp r5, #0
	bne _037FF09C
_037FF0CC:
	tst r6, #1
	beq _037FF0F8
	tst r6, #2
	ldrhne r1, [r4]
	orrne r0, r1, #0x80
	orrne r0, r0, #0x8000
	strhne r0, [r4]
	ldrbeq r0, [r4]
	orreq r0, r0, #0x80
	strbeq r0, [r4]
	b _037FF108
_037FF0F8:
	tst r6, #2
	ldrbne r0, [sl]
	orrne r0, r0, #0x80
	strbne r0, [sl]
_037FF108:
	mov r5, #0
	b _037FF128
_037FF110:
	tst r7, #1
	beq _037FF120
	mov r0, r5
	bl FUN_037FED44
_037FF120:
	add r5, r5, #1
	lsr r7, r7, #1
_037FF128:
	cmp r5, #8
	bge _037FF138
	cmp r7, #0
	bne _037FF110
_037FF138:
	mov r0, r8
	bl FUN_037FAD38
	bl FUN_037FEC24
	b _037FF50C
_037FF148:
	ldr sb, [sp, #0x30]
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl FUN_037FAD24
	mov fp, r0
	mov r8, #0
	b _037FF180
_037FF168:
	tst r7, #1
	beq _037FF178
	mov r0, r8
	bl FUN_037FEE00
_037FF178:
	add r8, r8, #1
	lsr r7, r7, #1
_037FF180:
	cmp r8, #8
	bge _037FF190
	cmp r7, #0
	bne _037FF168
_037FF190:
	mov r7, #0
	b _037FF1B4
_037FF198:
	tst r5, #1
	beq _037FF1AC
	mov r0, r7
	mov r1, sb
	bl FUN_037FB9B4
_037FF1AC:
	add r7, r7, #1
	lsr r5, r5, #1
_037FF1B4:
	cmp r7, #0x10
	bge _037FF1C4
	cmp r5, #0
	bne _037FF198
_037FF1C4:
	tst r6, #1
	movne r0, #0
	strbne r0, [r4]
	tst r6, #2
	movne r0, #0
	strbne r0, [sl]
	mov r0, fp
	bl FUN_037FAD38
	bl FUN_037FEC24
	b _037FF50C
_037FF1EC:
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
	bl FUN_037FC090
	b _037FF50C
_037FF234:
	ldr r0, [sp, #0x30]
	mov r2, #0
	str r0, [sp, #4]
	ldr r3, [sp, #0x2c]
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_037FECE8
	b _037FF50C
_037FF25C:
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r7, #0
	b _037FF288
_037FF26C:
	tst r5, #1
	beq _037FF280
	mov r0, r7
	mov r1, r6
	bl FUN_037FBA54
_037FF280:
	add r7, r7, #1
	lsr r5, r5, #1
_037FF288:
	cmp r7, #0x10
	bge _037FF50C
	cmp r5, #0
	bne _037FF26C
	b _037FF50C
_037FF29C:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r8, #0
	b _037FF2D0
_037FF2B0:
	tst r5, #1
	beq _037FF2C8
	mov r0, r8
	mov r1, r6
	mov r2, r7
	bl FUN_037FB9DC
_037FF2C8:
	add r8, r8, #1
	lsr r5, r5, #1
_037FF2D0:
	cmp r8, #0x10
	bge _037FF50C
	cmp r5, #0
	bne _037FF2B0
	b _037FF50C
_037FF2E4:
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r7, #0
	b _037FF310
_037FF2F4:
	tst r5, #1
	beq _037FF308
	mov r0, r7
	mov r1, r6
	bl FUN_037FBA6C
_037FF308:
	add r7, r7, #1
	lsr r5, r5, #1
_037FF310:
	cmp r7, #0x10
	bge _037FF50C
	cmp r5, #0
	bne _037FF2F4
	b _037FF50C
_037FF324:
	ldr r3, [sp, #0x30]
	ldr r0, [sp, #0x24]
	lsl r1, r3, #0x10
	ldr r2, [sp, #0x2c]
	lsr r1, r1, #0x10
	str r1, [sp]
	ldr r1, _037FF554 @ =0x003FFFFF
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
	bl FUN_037FB798
	b _037FF50C
_037FF3A4:
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
	bl FUN_037FB864
	b _037FF50C
_037FF3DC:
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
	bl FUN_037FB910
	b _037FF50C
_037FF40C:
	ldr r0, [sp, #0x24]
	bl FUN_037FBB74
	b _037FF50C
_037FF418:
	ldr r0, [sp, #0x24]
	bl FUN_037FB750
	b _037FF50C
_037FF424:
	ldr r0, [sp, #0x24]
	bl FUN_037FBB00
	b _037FF50C
_037FF430:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl FUN_037FB760
	b _037FF50C
_037FF448:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_037FCB78
	b _037FF50C
_037FF458:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_037FCC58
	b _037FF50C
_037FF468:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_037FCAC8
	b _037FF50C
_037FF478:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_037FD554
	b _037FF50C
_037FF488:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_037FD5E0
	b _037FF50C
_037FF498:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl FUN_037FCCAC
	b _037FF50C
_037FF4A8:
	ldr r1, [sp, #0x24]
	ldr r0, _037FF558 @ =0x03807408
	str r1, [r0]
	b _037FF50C
_037FF4B8:
	ldr r5, [sp, #0x24]
	ldr r0, _037FF55C @ =0x0380740C
	mov r1, r5
	mov r2, #0x1180
	bl FUN_037FAFE0
	ldr r0, _037FF55C @ =0x0380740C
	add r1, r5, #0x1000
	str r0, [r1, #0x1c0]
	mov r6, #0
_037FF4DC:
	mov r0, r6
	bl FUN_037FBB64
	add r1, r5, r6, lsl #2
	add r1, r1, #0x1000
	str r0, [r1, #0x180]
	add r6, r6, #1
	cmp r6, #0x10
	blt _037FF4DC
	mov r0, #0
	bl FUN_037FCC90
	add r1, r5, #0x1000
	str r0, [r1, #0x1c4]
_037FF50C:
	ldr r6, [sp, #0x1c]
_037FF510:
	cmp r6, #0
	bne _037FEED0
	ldr r0, _037FF558 @ =0x03807408
	ldr r1, [r0]
	ldr r0, [r1]
	add r0, r0, #1
	str r0, [r1]
_037FF52C:
	ldr r0, _037FF560 @ =0x0380858C
	add r1, sp, #0x18
	mov r2, #0
	bl FUN_037F9784
	cmp r0, #0
	bne _037FEEC0
	add sp, sp, #0x34
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FF550: .4byte 0x04000509
_037FF554: .4byte 0x003FFFFF
_037FF558: .4byte 0x03807408
_037FF55C: .4byte 0x0380740C
_037FF560: .4byte 0x0380858C
	arm_func_end FUN_037FEEB4

	arm_func_start FUN_037FF564
FUN_037FF564: @ 0x037FF564
	push {r3, r4, r5, lr}
	mov r5, r1
	bl FUN_037FAD24
	mov r4, r0
	cmp r5, #0x2000000
	blo _037FF590
	ldr r0, _037FF5AC @ =0x0380858C
	mov r1, r5
	mov r2, #0
	bl FUN_037F96F8
	b _037FF59C
_037FF590:
	cmp r5, #0
	bne _037FF59C
	bl FUN_037FBF5C
_037FF59C:
	mov r0, r4
	bl FUN_037FAD38
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FF5AC: .4byte 0x0380858C
	arm_func_end FUN_037FF564

	arm_func_start FUN_037FF5B0
FUN_037FF5B0: @ 0x037FF5B0
	ldr ip, _037FF5B8 @ =FUN_03800254
	bx ip
	.align 2, 0
_037FF5B8: .4byte FUN_03800254
	arm_func_end FUN_037FF5B0

	arm_func_start FUN_037FF5BC
FUN_037FF5BC: @ 0x037FF5BC
	push {r4, lr}
	sub sp, sp, #8
	ldr r4, _037FF660 @ =0x038085E0
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
	ldr r1, _037FF664 @ =FUN_038003A8
	ldr r3, _037FF668 @ =0x03808BE0
	add r0, r4, #0x48
	str ip, [sp, #4]
	bl FUN_037F9054
	add r0, r4, #0x48
	bl FUN_037F93B4
	ldr r1, _037FF66C @ =FUN_038002C4
	mov r0, #0xb
	bl FUN_037FB330
	ldr r0, _037FF670 @ =0x027FFC40
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _037FF674 @ =0x038085CC
	moveq r1, #1
	streq r1, [r0]
	add sp, sp, #8
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FF660: .4byte 0x038085E0
_037FF664: .4byte FUN_038003A8
_037FF668: .4byte 0x03808BE0
_037FF66C: .4byte FUN_038002C4
_037FF670: .4byte 0x027FFC40
_037FF674: .4byte 0x038085CC
	arm_func_end FUN_037FF5BC

	arm_func_start FUN_037FF678
FUN_037FF678: @ 0x037FF678
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _037FF6B4 @ =0x038085E0
	mov r7, r0
	bl FUN_037FAD24
	ldr r6, [r5, #0xf0]
	mov r4, r0
	mov r1, r7
	add r0, r5, #0x48
	str r7, [r5, #0xf0]
	bl FUN_037F9408
	mov r0, r4
	bl FUN_037FAD38
	mov r0, r6
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FF6B4: .4byte 0x038085E0
	arm_func_end FUN_037FF678

	arm_func_start FUN_037FF6B8
FUN_037FF6B8: @ 0x037FF6B8
	ldr r0, _037FF6C0 @ =0x027FFA80
	bx lr
	.align 2, 0
_037FF6C0: .4byte 0x027FFA80
	arm_func_end FUN_037FF6B8

	arm_func_start FUN_037FF6C4
FUN_037FF6C4: @ 0x037FF6C4
	push {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	mov r4, r1
	adds r1, r5, r4
	beq _037FF75C
	cmp r5, #0
	beq _037FF6E4
	bl FUN_037F94B0
_037FF6E4:
	cmp r4, #0
	beq _037FF738
	sub r7, r4, r5
	mov r4, #0
	mov r5, #1
	mov r6, #5
	b _037FF718
_037FF700:
	cmp r7, #5
	movlt r8, r7
	movge r8, r6
	mov r0, r8
	bl FUN_037F94B0
	sub r7, r7, r8
_037FF718:
	bl FUN_037FF768
	tst r0, #1
	moveq r0, r5
	movne r0, r4
	cmp r0, #0
	bne _037FF738
	cmp r7, #0
	bgt _037FF700
_037FF738:
	bl FUN_037FF768
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _037FF764 @ =0x038085E0
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0]
_037FF75C:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FF764: .4byte 0x038085E0
	arm_func_end FUN_037FF6C4

	arm_func_start FUN_037FF768
FUN_037FF768: @ 0x037FF768
	push {r3, lr}
	ldr ip, _037FF7AC @ =0x03808BE0
	mov lr, #2
	ldr r0, _037FF7B0 @ =0x0380679C
	ldr r3, _037FF7B4 @ =FUN_037FFA10
	mov r1, #0
	mov r2, #1
	str lr, [ip, #4]
	bl FUN_037FF7F8
	ldr r3, _037FF7B8 @ =FUN_037FF9D0
	add r1, sp, #0
	mov r0, #0
	mov r2, #1
	bl FUN_037FF7F8
	ldrb r0, [sp]
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FF7AC: .4byte 0x03808BE0
_037FF7B0: .4byte 0x0380679C
_037FF7B4: .4byte FUN_037FFA10
_037FF7B8: .4byte FUN_037FF9D0
	arm_func_end FUN_037FF768

	arm_func_start FUN_037FF7BC
FUN_037FF7BC: @ 0x037FF7BC
	push {r3, lr}
	mov r0, #0
	mov r1, #0x32
	bl FUN_037FF6C4
	ldr r0, _037FF7F4 @ =0x038085E0
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
_037FF7F4: .4byte 0x038085E0
	arm_func_end FUN_037FF7BC

	arm_func_start FUN_037FF7F8
FUN_037FF7F8: @ 0x037FF7F8
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _037FF9B0 @ =0x03808BE4
	ldr r6, _037FF9B4 @ =0x0000A040
	ldr r5, _037FF9B8 @ =0x040001A0
	stmib r4, {r0, r1}
	mov r8, r2
	mov r7, r3
	strh r6, [r5]
	b _037FF98C
_037FF81C:
	ldr r0, _037FF9BC @ =0x03806AF4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _037FF92C
	ldr r0, _037FF9C0 @ =0x038085E0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	asr r0, r0, #0x10
	and r0, r0, #0xff
	cmp r0, #0xff
	bne _037FF92C
	bl FUN_037FA240
	ldr fp, _037FF9BC @ =0x03806AF4
	mov r5, r0
	mov r6, r1
	mov sb, #0xfa00
_037FF85C:
	bl FUN_037FA240
	mov r3, #0
	subs sl, r0, r5
	sbc lr, r1, r6
	mov ip, r3
	umull r0, r1, sl, sb
	mla r1, sl, ip, r1
	mla r1, lr, sb, r1
	ldr r2, _037FF9C4 @ =0x000082EA
	bl FUN_03806214
	ldrb r2, [fp]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _037FF85C
	ldr r0, _037FF9C8 @ =0x0000A042
	ldr r1, _037FF9B8 @ =0x040001A0
	strh r0, [r1]
_037FF8A0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FF8A0
	ldr r0, _037FF9CC @ =0x040001A2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_037FF8BC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FF8BC
	ldr r1, _037FF9CC @ =0x040001A2
	ldr r0, _037FF9BC @ =0x03806AF4
	ldrh r2, [r1]
	mov r1, #0
	strh r2, [sp]
	str r1, [r0, #4]
	bl FUN_037FA240
	mov r6, r0
	mov sb, r1
	mov r5, #0xfa00
_037FF8F0:
	bl FUN_037FA240
	mov r3, #0
	subs ip, r0, r6
	sbc fp, r1, sb
	mov sl, r3
	umull r0, r1, ip, r5
	mla r1, ip, sl, r1
	mla r1, fp, r5, r1
	ldr r2, _037FF9C4 @ =0x000082EA
	bl FUN_03806214
	ldr r2, _037FF9BC @ =0x03806AF4
	ldrb r2, [r2]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _037FF8F0
_037FF92C:
	ldr r0, [r4]
	subs r0, r0, #1
	str r0, [r4]
	ldrne r1, _037FF9B4 @ =0x0000A040
	ldrne r0, _037FF9B8 @ =0x040001A0
	strhne r1, [r0]
	bne _037FF960
	ldr r1, _037FF9B8 @ =0x040001A0
	mov r2, #0xa000
	strh r2, [r1]
	ldr r0, _037FF9BC @ =0x03806AF4
	mov r1, #1
	str r1, [r0, #4]
_037FF960:
	ldr r1, _037FF9B8 @ =0x040001A0
_037FF964:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FF964
	mov r0, r4
	mov lr, pc
	bx r7
	arm_func_end FUN_037FF7F8

	arm_func_start FUN_037FF97C
FUN_037FF97C: @ 0x037FF97C
	ldr r0, [r4]
	cmp r0, #0
	beq _037FF994
	sub r8, r8, #1
_037FF98C:
	cmp r8, #0
	bne _037FF81C
_037FF994:
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, _037FF9B8 @ =0x040001A0
	moveq r1, #0
	strheq r1, [r0]
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FF9B0: .4byte 0x03808BE4
_037FF9B4: .4byte 0x0000A040
_037FF9B8: .4byte 0x040001A0
_037FF9BC: .4byte 0x03806AF4
_037FF9C0: .4byte 0x038085E0
_037FF9C4: .4byte 0x000082EA
_037FF9C8: .4byte 0x0000A042
_037FF9CC: .4byte 0x040001A2
	arm_func_end FUN_037FF97C

	arm_func_start FUN_037FF9D0
FUN_037FF9D0: @ 0x037FF9D0
	ldr r1, _037FFA0C @ =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_037FF9E0:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _037FF9E0
	ldr r2, _037FFA0C @ =0x040001A2
	ldr r1, [r0, #8]
	ldrh r2, [r2]
	strb r2, [r1]
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_037FFA0C: .4byte 0x040001A2
	arm_func_end FUN_037FF9D0

	arm_func_start FUN_037FFA10
FUN_037FFA10: @ 0x037FFA10
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r1, [r0, #4]
	ldr r2, _037FFA5C @ =0x040001A2
	ldrb r1, [r1]
	strh r1, [r2]
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	sub r1, r2, #2
_037FFA38:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FFA38
	ldr r0, _037FFA5C @ =0x040001A2
	ldrh r0, [r0]
	strh r0, [sp]
	add sp, sp, #4
	ldm sp!, {r3}
	bx lr
	.align 2, 0
_037FFA5C: .4byte 0x040001A2
	arm_func_end FUN_037FFA10

	arm_func_start FUN_037FFA60
FUN_037FFA60: @ 0x037FFA60
	ldr r1, _037FFAC0 @ =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_037FFA70:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _037FFA70
	ldr r2, _037FFAC0 @ =0x040001A2
	ldr r1, [r0, #4]
	ldrh r2, [r2]
	ldrb r1, [r1]
	and r2, r2, #0xff
	cmp r2, r1
	beq _037FFAB0
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0]
	cmp r1, #1
	movhi r1, #1
	strhi r1, [r0]
_037FFAB0:
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_037FFAC0: .4byte 0x040001A2
	arm_func_end FUN_037FFA60

	arm_func_start FUN_037FFAC4
FUN_037FFAC4: @ 0x037FFAC4
	push {r3, lr}
	ldr ip, _037FFAEC @ =0x03808BE0
	mov r2, #1
	ldr r0, _037FFAF0 @ =0x038067A0
	ldr r3, _037FFAF4 @ =FUN_037FFA10
	mov r1, #0
	str r2, [ip, #4]
	bl FUN_037FF7F8
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FFAEC: .4byte 0x03808BE0
_037FFAF0: .4byte 0x038067A0
_037FFAF4: .4byte FUN_037FFA10
	arm_func_end FUN_037FFAC4

	arm_func_start FUN_037FFAF8
FUN_037FFAF8: @ 0x037FFAF8
	push {r3, lr}
	ldr r2, _037FFB90 @ =0x038085E0
	ldr r2, [r2]
	ldr r2, [r2, #0x28]
	cmp r2, #1
	beq _037FFB24
	cmp r2, #2
	beq _037FFB40
	cmp r2, #3
	beq _037FFB58
	b _037FFB74
_037FFB24:
	lsr r3, r0, #5
	and r3, r3, #8
	lsl ip, r0, #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #16
	str r0, [sp]
	b _037FFB74
_037FFB40:
	and r3, r0, #0xff00
	lsl ip, r0, #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #8
	str r0, [sp]
	b _037FFB74
_037FFB58:
	lsr r3, r0, #8
	and r3, r3, #0xff00
	and ip, r0, #0xff00
	orr r1, r1, r3
	orr r1, r1, ip, lsl #8
	orr r0, r1, r0, lsl #24
	str r0, [sp]
_037FFB74:
	ldr r3, _037FFB94 @ =FUN_037FFA10
	add r0, sp, #0
	add r2, r2, #1
	mov r1, #0
	bl FUN_037FF7F8
	pop {r3, lr}
	bx lr
	.align 2, 0
_037FFB90: .4byte 0x038085E0
_037FFB94: .4byte FUN_037FFA10
	arm_func_end FUN_037FFAF8

	arm_func_start FUN_037FFB98
FUN_037FFB98: @ 0x037FFB98
	push {r4, lr}
	ldr r0, _037FFBE8 @ =0x038085E0
	ldr r0, [r0]
	ldrb r4, [r0, #0x54]
	cmp r4, #0xff
	beq _037FFBE0
	ldr r0, _037FFBEC @ =0x03808BE0
	ldr r0, [r0]
	cmp r0, #0
	bne _037FFBE0
	bl FUN_037FF768
	cmp r4, r0
	beq _037FFBD4
	mov r0, r4
	bl FUN_037FFFF0
_037FFBD4:
	ldr r0, _037FFBEC @ =0x03808BE0
	mov r1, #1
	str r1, [r0]
_037FFBE0:
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FFBE8: .4byte 0x038085E0
_037FFBEC: .4byte 0x03808BE0
	arm_func_end FUN_037FFB98

	arm_func_start FUN_037FFBF0
FUN_037FFBF0: @ 0x037FFBF0
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl FUN_037FF7BC
	cmp r0, #0
	beq _037FFC48
	ldr r0, _037FFC50 @ =0x038085E0
	ldr r2, _037FFC54 @ =0x03808BE0
	ldr r1, [r0]
	mov r0, r6
	ldr r3, [r1, #0x28]
	mov r1, #3
	add r3, r3, #1
	add r3, r3, r4
	str r3, [r2, #4]
	bl FUN_037FFAF8
	ldr r3, _037FFC58 @ =FUN_037FF9D0
	mov r1, r5
	mov r2, r4
	mov r0, #0
	bl FUN_037FF7F8
_037FFC48:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FFC50: .4byte 0x038085E0
_037FFC54: .4byte 0x03808BE0
_037FFC58: .4byte FUN_037FF9D0
	arm_func_end FUN_037FFBF0

	arm_func_start FUN_037FFC5C
FUN_037FFC5C: @ 0x037FFC5C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl FUN_037FF7BC
	cmp r0, #0
	beq _037FFD00
	ldr r0, _037FFD08 @ =0x038085E0
	ldr fp, _037FFD0C @ =0x03808BE0
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _037FFCF8
_037FFC90:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl FUN_037FFAC4
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #2
	bl FUN_037FFAF8
	ldr r3, _037FFD10 @ =FUN_037FFA10
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl FUN_037FF7F8
	ldr r0, [r5, #0x2c]
	mov r1, #0
	bl FUN_037FF6C4
	ldr r0, [r5]
	cmp r0, #0
	bne _037FFD00
	add sb, sb, r7
	add sl, sl, r7
	sub r8, r8, r7
_037FFCF8:
	cmp r8, #0
	bne _037FFC90
_037FFD00:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FFD08: .4byte 0x038085E0
_037FFD0C: .4byte 0x03808BE0
_037FFD10: .4byte FUN_037FFA10
	arm_func_end FUN_037FFC5C

	arm_func_start FUN_037FFD14
FUN_037FFD14: @ 0x037FFD14
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl FUN_037FF7BC
	cmp r0, #0
	beq _037FFDB8
	ldr r0, _037FFDC0 @ =0x038085E0
	ldr fp, _037FFDC4 @ =0x03808BE0
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _037FFDB0
_037FFD48:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl FUN_037FFAC4
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #0xa
	bl FUN_037FFAF8
	ldr r3, _037FFDC8 @ =FUN_037FFA10
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl FUN_037FF7F8
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	bl FUN_037FF6C4
	ldr r0, [r5]
	cmp r0, #0
	bne _037FFDB8
	add sb, sb, r7
	add sl, sl, r7
	sub r8, r8, r7
_037FFDB0:
	cmp r8, #0
	bne _037FFD48
_037FFDB8:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FFDC0: .4byte 0x038085E0
_037FFDC4: .4byte 0x03808BE0
_037FFDC8: .4byte FUN_037FFA10
	arm_func_end FUN_037FFD14

	arm_func_start FUN_037FFDCC
FUN_037FFDCC: @ 0x037FFDCC
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl FUN_037FF7BC
	cmp r0, #0
	beq _037FFE48
	ldr r0, _037FFE50 @ =0x038085E0
	ldr r2, _037FFE54 @ =0x03808BE0
	ldr r4, [r0]
	mov r0, #1
	str r0, [r2, #0x10]
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	add r3, r1, r5
	mov r1, #3
	str r3, [r2, #4]
	bl FUN_037FFAF8
	ldr r3, _037FFE58 @ =FUN_037FFA60
	mov r0, r6
	mov r2, r5
	mov r1, #0
	bl FUN_037FF7F8
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, _037FFE54 @ =0x03808BE0
	ldreq r0, [r0, #0x10]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [r4]
_037FFE48:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FFE50: .4byte 0x038085E0
_037FFE54: .4byte 0x03808BE0
_037FFE58: .4byte FUN_037FFA60
	arm_func_end FUN_037FFDCC

	arm_func_start FUN_037FFE5C
FUN_037FFE5C: @ 0x037FFE5C
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _037FFEF0 @ =0x038085E0
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	ldr r5, [r4, #0x1c]
	orr r0, r7, r6
	sub r1, r5, #1
	tst r1, r0
	movne r0, #2
	strne r0, [r4]
	bne _037FFEE8
	bl FUN_037FF7BC
	cmp r0, #0
	beq _037FFEE8
	ldr r8, _037FFEF4 @ =0x03808BE0
	mov sb, #0xd8
	b _037FFEE0
_037FFEA4:
	bl FUN_037FFAC4
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl FUN_037FFAF8
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x44]
	bl FUN_037FF6C4
	ldr r0, [r4]
	cmp r0, #0
	bne _037FFEE8
	add r7, r7, r5
	sub r6, r6, r5
_037FFEE0:
	cmp r6, #0
	bne _037FFEA4
_037FFEE8:
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FFEF0: .4byte 0x038085E0
_037FFEF4: .4byte 0x03808BE0
	arm_func_end FUN_037FFE5C

	arm_func_start FUN_037FFEF8
FUN_037FFEF8: @ 0x037FFEF8
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _037FFF8C @ =0x038085E0
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	ldr r5, [r4, #0x20]
	orr r0, r7, r6
	sub r1, r5, #1
	tst r1, r0
	movne r0, #2
	strne r0, [r4]
	bne _037FFF84
	bl FUN_037FF7BC
	cmp r0, #0
	beq _037FFF84
	ldr r8, _037FFF90 @ =0x03808BE0
	mov sb, #0x20
	b _037FFF7C
_037FFF40:
	bl FUN_037FFAC4
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl FUN_037FFAF8
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x4c]
	bl FUN_037FF6C4
	ldr r0, [r4]
	cmp r0, #0
	bne _037FFF84
	add r7, r7, r5
	sub r6, r6, r5
_037FFF7C:
	cmp r6, #0
	bne _037FFF40
_037FFF84:
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FFF8C: .4byte 0x038085E0
_037FFF90: .4byte 0x03808BE0
	arm_func_end FUN_037FFEF8

	arm_func_start FUN_037FFF94
FUN_037FFF94: @ 0x037FFF94
	push {r4, lr}
	bl FUN_037FF7BC
	cmp r0, #0
	beq _037FFFD8
	ldr r0, _037FFFE0 @ =0x038085E0
	ldr r4, [r0]
	bl FUN_037FFAC4
	ldr r1, _037FFFE4 @ =0x03808BE0
	mov r2, #1
	ldr r0, _037FFFE8 @ =0x03806798
	ldr r3, _037FFFEC @ =FUN_037FFA10
	str r2, [r1, #4]
	mov r1, #0
	bl FUN_037FF7F8
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x3c]
	bl FUN_037FF6C4
_037FFFD8:
	pop {r4, lr}
	bx lr
	.align 2, 0
_037FFFE0: .4byte 0x038085E0
_037FFFE4: .4byte 0x03808BE0
_037FFFE8: .4byte 0x03806798
_037FFFEC: .4byte FUN_037FFA10
	arm_func_end FUN_037FFF94

	arm_func_start FUN_037FFFF0
FUN_037FFFF0: @ 0x037FFFF0
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl FUN_037FF7BC
	cmp r0, #0
	beq _03800074
	ldr r0, _0380007C @ =0x038085E0
	strb r4, [sp, #1]
	mov r1, #1
	ldr sb, [r0]
	ldr r5, _03800080 @ =FUN_037FFA10
	ldr r4, _03800084 @ =0x03808BE0
	strb r1, [sp]
	mov sl, #0xa
	add r7, sp, #0
	mov r8, #2
	mov r6, #0
	mov fp, #5
_03800034:
	bl FUN_037FFAC4
	mov r0, r7
	str r8, [r4, #4]
	mov r1, r6
	mov r2, r8
	mov r3, r5
	bl FUN_037FF7F8
	mov r0, fp
	mov r1, #0
	bl FUN_037FF6C4
	ldr r0, [sb]
	cmp r0, #4
	bne _03800074
	sub sl, sl, #1
	cmp sl, #0
	bgt _03800034
_03800074:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0380007C: .4byte 0x038085E0
_03800080: .4byte FUN_037FFA10
_03800084: .4byte 0x03808BE0
	arm_func_end FUN_037FFFF0

	arm_func_start FUN_03800088
FUN_03800088: @ 0x03800088
	ldr r3, _038000E0 @ =0x040001A4
_0380008C:
	ldr r2, [r3]
	tst r2, #-0x80000000
	bne _0380008C
	ldr r3, _038000E4 @ =0x040001A1
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
_038000E0: .4byte 0x040001A4
_038000E4: .4byte 0x040001A1
	arm_func_end FUN_03800088

	arm_func_start FUN_038000E8
FUN_038000E8: @ 0x038000E8
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _03800158 @ =0x038085E0
	mov r1, #0
	ldr r0, [r4]
	str r1, [r0]
	ldr r7, [r4, #0x3c]
	ldr r6, [r4, #0x40]
	bl FUN_037FAD24
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl FUN_037F932C
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _03800134
	add r0, r4, #0x48
	bl FUN_037F93B4
_03800134:
	mov r0, r5
	bl FUN_037FAD38
	cmp r7, #0
	beq _03800150
	mov r0, r6
	mov lr, pc
	bx r7
_03800150:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03800158: .4byte 0x038085E0
	arm_func_end FUN_038000E8

	arm_func_start FUN_0380015C
FUN_0380015C: @ 0x0380015C
	ldr r1, _03800178 @ =0x03806AFC
	ldr r1, [r1]
	ldr r1, [r1, #0x60]
	bic r1, r1, #0x7000000
	orr r0, r1, r0
	orr r0, r0, #0xa0000000
	bx lr
	.align 2, 0
_03800178: .4byte 0x03806AFC
	arm_func_end FUN_0380015C

	arm_func_start FUN_0380017C
FUN_0380017C: @ 0x0380017C
	bx lr
	arm_func_end FUN_0380017C

	arm_func_start FUN_03800180
FUN_03800180: @ 0x03800180
	push {r3, lr}
	mov r0, #-0x48000000
	mov r1, #0
	bl FUN_03800088
	mov r0, #0x7000000
	bl FUN_0380015C
	mov r1, #0x2000
	rsb r1, r1, #0
	ldr r2, _038001C8 @ =0x040001A4
	and r0, r0, r1
	str r0, [r2]
_038001AC:
	ldr r0, [r2]
	tst r0, #0x800000
	beq _038001AC
	ldr r0, _038001CC @ =0x04100010
	ldr r0, [r0]
	pop {r3, lr}
	bx lr
	.align 2, 0
_038001C8: .4byte 0x040001A4
_038001CC: .4byte 0x04100010
	arm_func_end FUN_03800180

	arm_func_start FUN_038001D0
FUN_038001D0: @ 0x038001D0
	push {r4, lr}
	ldr r0, _038001FC @ =0x038085E0
	mov r1, #0
	mov r2, r1
	bl FUN_03800200
	bl FUN_03800180
	mov r4, r0
	bl FUN_038000E8
	mov r0, r4
	pop {r4, lr}
	bx lr
	.align 2, 0
_038001FC: .4byte 0x038085E0
	arm_func_end FUN_038001D0

	arm_func_start FUN_03800200
FUN_03800200: @ 0x03800200
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl FUN_037FAD24
	mov r4, r0
	b _03800224
_0380021C:
	add r0, r7, #0xf4
	bl FUN_037F92D8
_03800224:
	ldr r0, [r7, #0xfc]
	tst r0, #4
	bne _0380021C
	ldr r1, [r7, #0xfc]
	mov r0, r4
	orr r1, r1, #4
	str r1, [r7, #0xfc]
	str r6, [r7, #0x3c]
	str r5, [r7, #0x40]
	bl FUN_037FAD38
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_03800200

	arm_func_start FUN_03800254
FUN_03800254: @ 0x03800254
	push {r3, lr}
	ldr ip, _038002B4 @ =0x038085E0
	ldr r0, [ip, #0xfc]
	cmp r0, #0
	bne _038002AC
	ldr r0, _038002B8 @ =0x03808BF4
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
	bl FUN_037FF5BC
	ldr r1, _038002BC @ =FUN_0380017C
	ldr r0, _038002C0 @ =0x03808C00
	str r1, [r0]
	bl FUN_038005DC
_038002AC:
	pop {r3, lr}
	bx lr
	.align 2, 0
_038002B4: .4byte 0x038085E0
_038002B8: .4byte 0x03808BF4
_038002BC: .4byte FUN_0380017C
_038002C0: .4byte 0x03808C00
	arm_func_end FUN_03800254

	arm_func_start FUN_038002C4
FUN_038002C4: @ 0x038002C4
	push {r3, lr}
	cmp r0, #0xb
	bne _0380039C
	cmp r2, #0
	beq _0380039C
	ldr r0, _038003A4 @ =0x038085E0
	ldr r2, [r0, #8]
	cmp r2, #0
	streq r1, [r0, #4]
	ldr r2, [r0, #4]
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _03800368
_038002F8: @ jump table
	b _03800338 @ case 0
	b _03800368 @ case 1
	b _0380035C @ case 2
	b _0380035C @ case 3
	b _0380035C @ case 4
	b _0380035C @ case 5
	b _0380035C @ case 6
	b _0380035C @ case 7
	b _0380035C @ case 8
	b _0380035C @ case 9
	b _0380035C @ case 10
	b _0380035C @ case 11
	b _0380035C @ case 12
	b _0380035C @ case 13
	b _0380035C @ case 14
	b _0380035C @ case 15
_03800338:
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _03800368
	cmp r2, #1
	ldreq r2, [r0, #0xfc]
	streq r1, [r0]
	orreq r1, r2, #0x10
	streq r1, [r0, #0xfc]
	b _03800368
_0380035C:
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x10
	str r1, [r0, #0xfc]
_03800368:
	ldr r1, [r0, #0xfc]
	tst r1, #0x10
	ldreq r1, [r0, #8]
	addeq r1, r1, #1
	streq r1, [r0, #8]
	beq _0380039C
	ldr r1, [r0, #0xfc]
	mov r2, #0
	str r2, [r0, #8]
	tst r1, #4
	ldrne r0, [r0, #0xec]
	addeq r0, r0, #0x48
	bl FUN_037F93B4
_0380039C:
	pop {r3, lr}
	bx lr
	.align 2, 0
_038003A4: .4byte 0x038085E0
	arm_func_end FUN_038002C4

	arm_func_start FUN_038003A8
FUN_038003A8: @ 0x038003A8
	push {r4, r5, r6, r7, r8, lr}
	ldr r4, _038005D8 @ =0x038085E0
_038003B0:
	mov r5, #0
	bl FUN_037FAD24
	mov r6, r0
	add r8, r4, #0x48
	mov r7, r5
_038003C4:
	ldr r0, [r4, #0xfc]
	tst r0, #4
	bne _038003FC
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _03800408
	ldr r0, [r4, #0xfc]
	mov r5, #1
	orr r0, r0, #4
	str r0, [r4, #0xfc]
	ldr r0, [r4, #0xfc]
	bic r0, r0, #0x10
	str r0, [r4, #0xfc]
	b _03800418
_038003FC:
	ldr r0, [r4, #0xfc]
	tst r0, #8
	bne _03800418
_03800408:
	mov r0, r7
	str r8, [r4, #0xec]
	bl FUN_037F92D8
	b _038003C4
_03800418:
	mov r0, r6
	bl FUN_037FAD38
	cmp r5, #0
	beq _038005C4
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
	beq _03800568
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _03800560
_03800460: @ jump table
	b _03800568 @ case 0
	b _03800568 @ case 1
	b _038004A0 @ case 2
	b _038004A8 @ case 3
	b _038004B8 @ case 4
	b _03800560 @ case 5
	b _038004C4 @ case 6
	b _038004D8 @ case 7
	b _038004EC @ case 8
	b _03800500 @ case 9
	b _03800560 @ case 10
	b _03800514 @ case 11
	b _03800534 @ case 12
	b _0380053C @ case 13
	b _03800550 @ case 14
	b _03800524 @ case 15
_038004A0:
	bl FUN_037FFB98
	b _03800568
_038004A8:
	bl FUN_03800180
	ldr r1, [r4]
	str r0, [r1, #8]
	b _03800568
_038004B8:
	mov r0, #3
	str r0, [r3]
	b _03800568
_038004C4:
	ldr r0, [r3, #0xc]
	ldr r1, [r3, #0x10]
	ldr r2, [r3, #0x14]
	bl FUN_037FFBF0
	b _03800568
_038004D8:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl FUN_037FFD14
	b _03800568
_038004EC:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl FUN_037FFC5C
	b _03800568
_03800500:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl FUN_037FFDCC
	b _03800568
_03800514:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl FUN_037FFE5C
	b _03800568
_03800524:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl FUN_037FFEF8
	b _03800568
_03800534:
	bl FUN_037FFF94
	b _03800568
_0380053C:
	bl FUN_037FF768
	ldr r1, [r4]
	ldr r1, [r1, #0x10]
	strb r0, [r1]
	b _03800568
_03800550:
	ldr r0, [r3, #0xc]
	ldrb r0, [r0]
	bl FUN_037FFFF0
	b _03800568
_03800560:
	mov r0, #3
	str r0, [r3]
_03800568:
	mov r6, #0xb
	mov r5, #1
_03800570:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	bl FUN_037FB3A4
	cmp r0, #0
	blt _03800570
	bl FUN_037FAD24
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl FUN_037F932C
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _038005B8
	add r0, r4, #0x48
	bl FUN_037F93B4
_038005B8:
	mov r0, r5
	bl FUN_037FAD38
	b _038003B0
_038005C4:
	ldr r1, [r4, #0x44]
	mov r0, r4
	mov lr, pc
	bx r1
	arm_func_end FUN_038003A8

	arm_func_start FUN_038005D4
FUN_038005D4: @ 0x038005D4
	b _038003B0
	.align 2, 0
_038005D8: .4byte 0x038085E0
	arm_func_end FUN_038005D4

	arm_func_start FUN_038005DC
FUN_038005DC: @ 0x038005DC
	push {r3, r4, r5, lr}
	ldr r0, _0380062C @ =0x03808E20
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _03800624
	mov r1, #1
	str r1, [r0, #8]
	bl FUN_037FB248
	mov r5, #0xe
	mov r4, #0
_03800604:
	mov r0, r5
	mov r1, r4
	bl FUN_037FB380
	cmp r0, #0
	beq _03800604
	ldr r1, _03800630 @ =FUN_03800634
	mov r0, #0xe
	bl FUN_037FB330
_03800624:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380062C: .4byte 0x03808E20
_03800630: .4byte FUN_03800634
	arm_func_end FUN_038005DC

	arm_func_start FUN_03800634
FUN_03800634: @ 0x03800634
	push {r4, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	bne _0380068C
	mov r0, #0
	bl FUN_037FAF18
	mov r0, #1
	bl FUN_037FAF18
	mov r0, #2
	bl FUN_037FAF18
	mov r0, #3
	bl FUN_037FAF18
	mov r0, #0
	bl FUN_038034B0
	bl FUN_037FAD24
	mov r4, r0
	bl FUN_037FB69C
	bl FUN_03805A3C
	mov r0, r4
	bl FUN_037FAD38
	bl FUN_037FAE94
	b _03800690
_0380068C:
	bl FUN_037FAE94
_03800690:
	pop {r4, lr}
	bx lr
	arm_func_end FUN_03800634

	arm_func_start FUN_03800698
FUN_03800698: @ 0x03800698
	push {r3, lr}
	ldr r0, _038006D8 @ =0x03808E20
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _038006C8
	ldr r0, _038006DC @ =0x027FFE1F
	ldrb r0, [r0]
	tst r0, #0x80
	beq _038006C4
	bl FUN_038006E0
	b _038006C8
_038006C4:
	bl FUN_03800780
_038006C8:
	ldr r0, _038006D8 @ =0x03808E20
	ldr r0, [r0, #0xc]
	pop {r3, lr}
	bx lr
	.align 2, 0
_038006D8: .4byte 0x03808E20
_038006DC: .4byte 0x027FFE1F
	arm_func_end FUN_03800698

	arm_func_start FUN_038006E0
FUN_038006E0: @ 0x038006E0
	push {r3, r4, r5, lr}
	mov r5, #1
	bl FUN_037F8C20
	mov r4, r0
	mvn r0, #2
	cmp r4, r0
	beq _03800758
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl FUN_037F8BF0
	cmp r0, #0
	bne _0380074C
	ldr r1, _03800778 @ =0x027FFC10
	ldrh r0, [r1]
	cmp r0, #0
	subeq r0, r1, #0x410
	subne r0, r1, #0x10
	ldr r0, [r0]
	str r0, [sp]
	bl FUN_038001D0
	ldr r1, [sp]
	cmp r0, r1
	lsl r0, r4, #0x10
	moveq r5, #1
	lsr r0, r0, #0x10
	movne r5, #0
	bl FUN_037F8BD0
_0380074C:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl FUN_037F8CB8
_03800758:
	ldr r1, _0380077C @ =0x03808E20
	cmp r5, #0
	moveq r2, #1
	movne r2, #0
	str r2, [r1, #0xc]
	mov r0, r5
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03800778: .4byte 0x027FFC10
_0380077C: .4byte 0x03808E20
	arm_func_end FUN_038006E0

	arm_func_start FUN_03800780
FUN_03800780: @ 0x03800780
	ldr r0, _038007A4 @ =0x04000214
	mov r2, #1
	ldr r1, [r0]
	mov r0, r2
	tst r1, #0x100000
	ldrne r1, _038007A8 @ =0x03808E20
	movne r0, #0
	strne r2, [r1, #0xc]
	bx lr
	.align 2, 0
_038007A4: .4byte 0x04000214
_038007A8: .4byte 0x03808E20
	arm_func_end FUN_03800780

	arm_func_start FUN_038007AC
FUN_038007AC: @ 0x038007AC
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _03800898 @ =0x03808E20
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _03800890
	ldr r2, _0380089C @ =0x027FFC40
	ldrh r0, [r2]
	cmp r0, #2
	beq _03800890
	ldr r1, _038008A0 @ =0x03806B00
	mvn r0, #0
	ldr r3, [r1]
	cmp r3, r0
	ldreq r0, [r2, #-4]
	addeq r0, r0, #0xa
	streq r0, [r1]
	beq _03800890
	ldr r0, [r2, #-4]!
	cmp r0, r3
	blo _03800890
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1]
	bl FUN_03800698
	cmp r0, #0
	beq _03800840
	ldr r0, _03800898 @ =0x03808E20
	mov r1, #1
	str r1, [r0, #4]
	bl FUN_037FF6B8
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _03800840
	ldr r0, _038008A0 @ =0x03806B00
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _03800890
_03800840:
	ldr r0, _03800898 @ =0x03808E20
	ldr r1, _038008A0 @ =0x03806B00
	ldr r0, [r0, #4]
	mov r2, #0
	str r2, [r1, #4]
	cmp r0, #0
	beq _03800890
	mov r7, #0x64
	mov r6, #0xe
	mov r5, #0x11
	mov r4, r2
	b _03800878
_03800870:
	mov r0, r7
	bl FUN_037F8A30
_03800878:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	bne _03800870
_03800890:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03800898: .4byte 0x03808E20
_0380089C: .4byte 0x027FFC40
_038008A0: .4byte 0x03806B00
	arm_func_end FUN_038007AC

	thumb_func_start FUN_038008A4
FUN_038008A4: @ 0x038008A4
	svc #0
	bx lr
	thumb_func_end FUN_038008A4

	thumb_func_start FUN_038008A8
FUN_038008A8: @ 0x038008A8
	svc #3
	bx lr
	thumb_func_end FUN_038008A8

	thumb_func_start FUN_038008AC
FUN_038008AC: @ 0x038008AC
	ldr r2, _038008B8 @ =0x04000000
	mov ip, r2
	movs r2, #0
	svc #4
	bx lr
	.align 2, 0
_038008B8: .4byte 0x04000000
	thumb_func_end FUN_038008AC

	thumb_func_start FUN_038008BC
FUN_038008BC: @ 0x038008BC
	movs r2, #0
	svc #5
	bx lr
	thumb_func_end FUN_038008BC

	non_word_aligned_thumb_func_start FUN_038008C2
FUN_038008C2: @ 0x038008C2
	svc #6
	bx lr
	thumb_func_end FUN_038008C2

	non_word_aligned_thumb_func_start FUN_038008C6
FUN_038008C6: @ 0x038008C6
	svc #7
	bx lr
	thumb_func_end FUN_038008C6

	non_word_aligned_thumb_func_start FUN_038008CA
FUN_038008CA: @ 0x038008CA
	svc #8
	bx lr
	thumb_func_end FUN_038008CA

	non_word_aligned_thumb_func_start FUN_038008CE
FUN_038008CE: @ 0x038008CE
	adds r1, r0, #0
	movs r0, #1
	svc #8
	bx lr
	thumb_func_end FUN_038008CE

	non_word_aligned_thumb_func_start FUN_038008D6
FUN_038008D6: @ 0x038008D6
	adds r1, r0, #0
	movs r0, #0
	svc #8
	bx lr
	thumb_func_end FUN_038008D6

	non_word_aligned_thumb_func_start FUN_038008DE
FUN_038008DE: @ 0x038008DE
	svc #9
	bx lr
	thumb_func_end FUN_038008DE

	non_word_aligned_thumb_func_start FUN_038008E2
FUN_038008E2: @ 0x038008E2
	svc #9
	adds r0, r1, #0
	bx lr
	thumb_func_end FUN_038008E2

	thumb_func_start FUN_038008E8
FUN_038008E8: @ 0x038008E8
	svc #0xb
	bx lr
	thumb_func_end FUN_038008E8

	thumb_func_start FUN_038008EC
FUN_038008EC: @ 0x038008EC
	svc #0xc
	bx lr
	thumb_func_end FUN_038008EC

	thumb_func_start FUN_038008F0
FUN_038008F0: @ 0x038008F0
	svc #0xd
	bx lr
	thumb_func_end FUN_038008F0

	thumb_func_start FUN_038008F4
FUN_038008F4: @ 0x038008F4
	svc #0xe
	bx lr
	thumb_func_end FUN_038008F4

	thumb_func_start FUN_038008F8
FUN_038008F8: @ 0x038008F8
	svc #0xf
	bx lr
	thumb_func_end FUN_038008F8

	thumb_func_start FUN_038008FC
FUN_038008FC: @ 0x038008FC
	svc #0x10
	bx lr
	thumb_func_end FUN_038008FC

	thumb_func_start FUN_03800900
FUN_03800900: @ 0x03800900
	svc #0x11
	bx lr
	thumb_func_end FUN_03800900

	thumb_func_start FUN_03800904
FUN_03800904: @ 0x03800904
	svc #0x12
	bx lr
	thumb_func_end FUN_03800904

	thumb_func_start FUN_03800908
FUN_03800908: @ 0x03800908
	svc #0x13
	bx lr
	thumb_func_end FUN_03800908

	thumb_func_start FUN_0380090C
FUN_0380090C: @ 0x0380090C
	svc #0x14
	bx lr
	thumb_func_end FUN_0380090C

	thumb_func_start FUN_03800910
FUN_03800910: @ 0x03800910
	svc #0x15
	bx lr
	thumb_func_end FUN_03800910

	thumb_func_start FUN_03800914
FUN_03800914: @ 0x03800914
	svc #0x1a
	bx lr
	thumb_func_end FUN_03800914

	thumb_func_start FUN_03800918
FUN_03800918: @ 0x03800918
	svc #0x1b
	bx lr
	thumb_func_end FUN_03800918

	thumb_func_start FUN_0380091C
FUN_0380091C: @ 0x0380091C
	svc #0x1c
	bx lr
	thumb_func_end FUN_0380091C

	arm_func_start FUN_03800920
FUN_03800920: @ 0x03800920
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r1, _03800A20 @ =0x03808E30
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _03800A14
	ldr r0, _03800A24 @ =0x03808E34
	mov r2, #0
	str r2, [r0]
	mov r3, #1
	mov r2, #5
	strh r3, [r1]
	str r2, [r0, #4]
	bl FUN_03800DFC
	bl FUN_03803860
	bl FUN_038022E8
	bl FUN_03801944
	bl FUN_037FB248
	ldr r1, _03800A28 @ =FUN_03800D94
	mov r0, #6
	bl FUN_037FB330
	ldr r1, _03800A28 @ =FUN_03800D94
	mov r0, #9
	bl FUN_037FB330
	ldr r1, _03800A28 @ =FUN_03800D94
	mov r0, #8
	bl FUN_037FB330
	ldr r1, _03800A28 @ =FUN_03800D94
	mov r0, #4
	bl FUN_037FB330
	ldr r0, _03800A2C @ =0x038090E0
	ldr r1, _03800A30 @ =0x03809100
	mov r2, #0x10
	bl FUN_037F96D0
	mov sb, #0
	mov r6, #0x18
	ldr r8, _03800A34 @ =0x03809140
	mov r7, sb
	mov r5, r6
_038009C0:
	mla r0, sb, r5, r8
	mov r1, r7
	mov r2, r6
	bl FUN_037FB07C
	add sb, sb, #1
	cmp sb, #0x10
	blt _038009C0
	ldr r0, _03800A24 @ =0x03808E34
	mov r2, #0
	str r2, [r0, #0x48c]
	str r2, [r0, #0x494]
	str r2, [r0, #0x490]
	mov r0, #0x200
	str r0, [sp]
	ldr r0, _03800A38 @ =0x03808E3C
	ldr r1, _03800A3C @ =FUN_03800D28
	ldr r3, _03800A2C @ =0x038090E0
	str r4, [sp, #4]
	bl FUN_037F9054
	ldr r0, _03800A38 @ =0x03808E3C
	bl FUN_037F93B4
_03800A14:
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03800A20: .4byte 0x03808E30
_03800A24: .4byte 0x03808E34
_03800A28: .4byte FUN_03800D94
_03800A2C: .4byte 0x038090E0
_03800A30: .4byte 0x03809100
_03800A34: .4byte 0x03809140
_03800A38: .4byte 0x03808E3C
_03800A3C: .4byte FUN_03800D28
	arm_func_end FUN_03800920

	arm_func_start FUN_03800A40
FUN_03800A40: @ 0x03800A40
	push {r4, r5, r6, lr}
	ldr r5, _03800A94 @ =0x038092C4
	ldr r4, _03800A98 @ =0x03808E34
	mov r6, r0
_03800A50:
	bl FUN_037FAD24
	ldr r1, [r4]
	cmp r1, #0
	beq _03800A70
	bl FUN_037FAD38
	mov r0, r5
	bl FUN_037F92D8
	b _03800A50
_03800A70:
	ldr r1, _03800A98 @ =0x03808E34
	mov r2, #1
	str r2, [r1]
	mov r2, #4
	str r2, [r1, #4]
	str r6, [r1, #0x498]
	bl FUN_037FAD38
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03800A94: .4byte 0x038092C4
_03800A98: .4byte 0x03808E34
	arm_func_end FUN_03800A40

	arm_func_start FUN_03800A9C
FUN_03800A9C: @ 0x03800A9C
	push {r3, lr}
	ldr r1, _03800AF4 @ =0x03808E34
	ldr r2, [r1]
	cmp r2, #0
	beq _03800AEC
	ldr r2, [r1, #4]
	cmp r2, #4
	ldreq r1, [r1, #0x498]
	cmpeq r1, r0
	bne _03800AEC
	bl FUN_037FAD24
	ldr r1, _03800AF4 @ =0x03808E34
	mov r2, #5
	str r2, [r1, #4]
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #0x498]
	bl FUN_037FAD38
	ldr r0, _03800AF8 @ =0x038092C4
	bl FUN_037F932C
_03800AEC:
	pop {r3, lr}
	bx lr
	.align 2, 0
_03800AF4: .4byte 0x03808E34
_03800AF8: .4byte 0x038092C4
	arm_func_end FUN_03800A9C

	arm_func_start FUN_03800AFC
FUN_03800AFC: @ 0x03800AFC
	push {r4, r5, r6, lr}
	and r2, r0, #0x70
	cmp r2, #0x30
	bgt _03800B34
	bge _03800B80
	cmp r2, #0x10
	bgt _03800B28
	bge _03800B68
	cmp r2, #0
	beq _03800B68
	b _03800B84
_03800B28:
	cmp r2, #0x20
	beq _03800B80
	b _03800B84
_03800B34:
	cmp r2, #0x50
	bgt _03800B4C
	bge _03800B70
	cmp r2, #0x40
	beq _03800B70
	b _03800B84
_03800B4C:
	cmp r2, #0x60
	bgt _03800B5C
	beq _03800B78
	b _03800B84
_03800B5C:
	cmp r2, #0x70
	beq _03800B78
	b _03800B84
_03800B68:
	mov r4, #6
	b _03800B84
_03800B70:
	mov r4, #9
	b _03800B84
_03800B78:
	mov r4, #8
	b _03800B84
_03800B80:
	mov r4, #4
_03800B84:
	and r0, r0, #0xff
	orr r0, r0, #0x80
	lsl r0, r0, #8
	orr r2, r0, #0x3000000
	and r0, r1, #0xff
	orr r6, r2, r0
	mov r5, #0
_03800BA0:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl FUN_037FB3A4
	cmp r0, #0
	blt _03800BA0
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end FUN_03800AFC

	arm_func_start FUN_03800BC0
FUN_03800BC0: @ 0x03800BC0
	ldr r0, _03800BD8 @ =0x03808E34
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_03800BD8: .4byte 0x03808E34
	arm_func_end FUN_03800BC0

	arm_func_start FUN_03800BDC
FUN_03800BDC: @ 0x03800BDC
	ldr r1, _03800BF0 @ =0x03808E34
	mov r2, #1
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_03800BF0: .4byte 0x03808E34
	arm_func_end FUN_03800BDC

	arm_func_start FUN_03800BF4
FUN_03800BF4: @ 0x03800BF4
	push {r3, lr}
	ldr r1, _03800C28 @ =0x03808E34
	ldr r2, [r1, #4]
	cmp r2, r0
	bne _03800C20
	ldr r0, _03800C2C @ =0x038092C4
	mov r2, #5
	str r2, [r1, #4]
	mov r2, #0
	str r2, [r1]
	bl FUN_037F932C
_03800C20:
	pop {r3, lr}
	bx lr
	.align 2, 0
_03800C28: .4byte 0x03808E34
_03800C2C: .4byte 0x038092C4
	arm_func_end FUN_03800BF4

	arm_func_start FUN_03800C30
FUN_03800C30: @ 0x03800C30
	push {r0, r1, r2, r3}
	push {r4, r5, r6, lr}
	ldrh r2, [sp, #0x18]
	mov r5, r0
	cmp r2, #4
	mov r4, r1
	movhi r0, #0
	bhi _03800CEC
	bl FUN_037FAD24
	ldr ip, _03800CF8 @ =0x03808E34
	add r2, sp, #0x18
	ldr r3, [ip, #0x48c]
	mov r1, #0x18
	mul r6, r3, r1
	ldr lr, _03800CFC @ =0x03809140
	ldr r3, _03800D00 @ =0x03809144
	str r5, [lr, r6]
	ldr r5, [ip, #0x48c]
	bic r2, r2, #3
	mul lr, r5, r1
	add r5, r2, #4
	ldrh r1, [sp, #0x18]
	str r4, [r3, lr]
	mov r6, #0
	mov r2, #0x18
	b _03800CB4
_03800C98:
	ldr r4, [ip, #0x48c]
	add r5, r5, #4
	mla r3, r4, r2, ip
	add r3, r3, r6, lsl #2
	ldr r4, [r5, #-4]
	add r6, r6, #1
	str r4, [r3, #0x314]
_03800CB4:
	cmp r6, r1
	blt _03800C98
	ldr r1, _03800CF8 @ =0x03808E34
	ldr r4, [r1, #0x48c]
	add r2, r4, #1
	and r2, r2, #0xf
	str r2, [r1, #0x48c]
	bl FUN_037FAD38
	ldr r1, _03800CFC @ =0x03809140
	mov r0, #0x18
	mla r1, r4, r0, r1
	ldr r0, _03800D04 @ =0x038090E0
	mov r2, #0
	bl FUN_037F96F8
_03800CEC:
	pop {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_03800CF8: .4byte 0x03808E34
_03800CFC: .4byte 0x03809140
_03800D00: .4byte 0x03809144
_03800D04: .4byte 0x038090E0
	arm_func_end FUN_03800C30

	arm_func_start FUN_03800D08
FUN_03800D08: @ 0x03800D08
	push {r3, lr}
	ldr r0, _03800D24 @ =0x038090E0
	add r1, sp, #0
	mov r2, #0
	bl FUN_037F9820
	pop {r3, lr}
	bx lr
	.align 2, 0
_03800D24: .4byte 0x038090E0
	arm_func_end FUN_03800D08

	arm_func_start FUN_03800D28
FUN_03800D28: @ 0x03800D28
	push {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r6, _03800D90 @ =0x038090E0
	add r5, sp, #0
	mov r4, #1
_03800D3C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_037F9784
	ldr r0, [sp]
	ldr r1, [r0]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _03800D3C
_03800D60: @ jump table
	b _03800D70 @ case 0
	b _03800D88 @ case 1
	b _03800D78 @ case 2
	b _03800D80 @ case 3
_03800D70:
	bl FUN_038010E4
	b _03800D3C
_03800D78:
	bl FUN_0380269C
	b _03800D3C
_03800D80:
	bl FUN_03801B3C
	b _03800D3C
_03800D88:
	bl FUN_03803A30
	b _03800D3C
	.align 2, 0
_03800D90: .4byte 0x038090E0
	arm_func_end FUN_03800D28

	arm_func_start FUN_03800D94
FUN_03800D94: @ 0x03800D94
	push {r3, lr}
	cmp r2, #0
	bne _03800DF4
	sub r0, r0, #4
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _03800DF4
_03800DB0: @ jump table
	b _03800DEC @ case 0
	b _03800DF4 @ case 1
	b _03800DC8 @ case 2
	b _03800DF4 @ case 3
	b _03800DE0 @ case 4
	b _03800DD4 @ case 5
_03800DC8:
	mov r0, r1
	bl FUN_03800F04
	b _03800DF4
_03800DD4:
	mov r0, r1
	bl FUN_03802330
	b _03800DF4
_03800DE0:
	mov r0, r1
	bl FUN_03801980
	b _03800DF4
_03800DEC:
	mov r0, r1
	bl FUN_03803888
_03800DF4:
	pop {r3, lr}
	bx lr
	arm_func_end FUN_03800D94

	arm_func_start FUN_03800DFC
FUN_03800DFC: @ 0x03800DFC
	push {r4, r5, r6, r7, r8, lr}
	ldr r0, _03800EC4 @ =0x038092D4
	mov r3, #0
	str r3, [r0, #0x20]
	mov r1, #0x14
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	mov r2, r3
_03800E1C:
	lsl r1, r3, #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _03800E1C
	bl FUN_037FA7BC
	cmp r0, #0
	bne _03800E40
	bl FUN_037FA770
_03800E40:
	ldr r7, _03800EC8 @ =0x03809300
	ldr r5, _03800ECC @ =0x54505641
	mov r8, #0
	mov r4, #0x28
_03800E50:
	mul r6, r8, r4
	add r0, r7, r6
	bl FUN_037FA8A8
	mov r1, r5
	add r0, r7, r6
	bl FUN_037FAA38
	add r8, r8, #1
	cmp r8, #4
	blt _03800E50
	ldr r2, _03800ED0 @ =0x040001C0
_03800E78:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03800E78
	ldr r1, _03800ED4 @ =0x00008A01
	ldr r0, _03800ED8 @ =0x040001C2
	strh r1, [r2]
	mov r1, #0x84
	strh r1, [r0]
	sub r1, r0, #2
_03800E9C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03800E9C
	bl FUN_03800EE0
	ldr r1, _03800EDC @ =0x00008201
	ldr r0, _03800ED0 @ =0x040001C0
	strh r1, [r0]
	bl FUN_03800EE0
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_03800EC4: .4byte 0x038092D4
_03800EC8: .4byte 0x03809300
_03800ECC: .4byte 0x54505641
_03800ED0: .4byte 0x040001C0
_03800ED4: .4byte 0x00008A01
_03800ED8: .4byte 0x040001C2
_03800EDC: .4byte 0x00008201
	arm_func_end FUN_03800DFC

	arm_func_start FUN_03800EE0
FUN_03800EE0: @ 0x03800EE0
	ldr r0, _03800F00 @ =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03800EF0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03800EF0
	bx lr
	.align 2, 0
_03800F00: .4byte 0x040001C2
	arm_func_end FUN_03800EE0

	arm_func_start FUN_03800F04
FUN_03800F04: @ 0x03800F04
	push {r3, r4, lr}
	sub sp, sp, #4
	tst r0, #0x2000000
	beq _03800F34
	ldr r1, _038010DC @ =0x038092D4
	mov r4, #0
	mov r3, r4
_03800F20:
	lsl r2, r4, #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _03800F20
_03800F34:
	ldr r2, _038010DC @ =0x038092D4
	and r1, r0, #0xf0000
	lsr r1, r1, #0x10
	lsl r1, r1, #1
	strh r0, [r2, r1]
	tst r0, #0x1000000
	beq _038010D0
	ldrh r1, [r2]
	and r0, r1, #0xff00
	lsl r0, r0, #8
	lsr r4, r0, #0x10
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _038010C4
_03800F6C: @ jump table
	b _03800FB0 @ case 0
	b _03800FD8 @ case 1
	b _03801074 @ case 2
	b _03800F7C @ case 3
_03800F7C:
	and r0, r1, #0xff
	lsl r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r0, #3
	bne _03800F9C
	mov r1, #2
	bl FUN_03800AFC
	b _038010D0
_03800F9C:
	str r3, [r2, #0x24]
	mov r1, #0
	str r3, [r2, #0x28]
	bl FUN_03800AFC
	b _038010D0
_03800FB0:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl FUN_03800C30
	cmp r0, #0
	bne _038010D0
	mov r0, r4
	mov r1, #4
	bl FUN_03800AFC
	b _038010D0
_03800FD8:
	ldr r0, [r2, #0x20]
	cmp r0, #0
	beq _03800FF4
	mov r0, r4
	mov r1, #3
	bl FUN_03800AFC
	b _038010D0
_03800FF4:
	and r0, r1, #0xff
	lsl r0, r0, #0x10
	lsrs r3, r0, #0x10
	beq _0380100C
	cmp r3, #4
	bls _0380101C
_0380100C:
	mov r0, r4
	mov r1, #2
	bl FUN_03800AFC
	b _038010D0
_0380101C:
	ldrh ip, [r2, #2]
	ldr r0, _038010E0 @ =0x00000107
	cmp ip, r0
	blo _0380103C
	mov r0, r4
	mov r1, #2
	bl FUN_03800AFC
	b _038010D0
_0380103C:
	mov r1, r4
	mov r0, #0
	mov r2, #2
	str ip, [sp]
	bl FUN_03800C30
	cmp r0, #0
	ldrne r0, _038010DC @ =0x038092D4
	movne r1, #1
	strne r1, [r0, #0x20]
	bne _038010D0
	mov r0, r4
	mov r1, #4
	bl FUN_03800AFC
	b _038010D0
_03801074:
	ldr r0, [r2, #0x20]
	cmp r0, #2
	beq _03801090
	mov r0, r4
	mov r1, #3
	bl FUN_03800AFC
	b _038010D0
_03801090:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl FUN_03800C30
	cmp r0, #0
	ldrne r0, _038010DC @ =0x038092D4
	movne r1, #3
	strne r1, [r0, #0x20]
	bne _038010D0
	mov r0, r4
	mov r1, #4
	bl FUN_03800AFC
	b _038010D0
_038010C4:
	mov r0, r4
	mov r1, #1
	bl FUN_03800AFC
_038010D0:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	.align 2, 0
_038010DC: .4byte 0x038092D4
_038010E0: .4byte 0x00000107
	arm_func_end FUN_03800F04

	arm_func_start FUN_038010E4
FUN_038010E4: @ 0x038010E4
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldr r1, [sl, #4]
	cmp r1, #2
	bhi _03801118
	cmp r1, #0
	beq _03801130
	cmp r1, #1
	beq _038012A4
	cmp r1, #2
	beq _03801368
	b _038013B4
_03801118:
	cmp r1, #0x10
	bne _038013B4
	ldr r0, _038013C0 @ =0x038092D4
	ldr r0, [r0, #0x20]
	cmp r0, #2
	bne _038013B4
_03801130:
	bl FUN_037FAD24
	mov r4, r0
	mov r0, #0
	bl FUN_03800BC0
	cmp r0, #0
	bne _03801168
	mov r0, r4
	bl FUN_037FAD38
	ldr r0, [sl, #4]
	mov r1, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	b _038013B4
_03801168:
	mov r0, #0
	bl FUN_03800BDC
	mov r0, r4
	bl FUN_037FAD38
	ldr r1, _038013C0 @ =0x038092D4
	add r0, sp, #8
	ldr r1, [r1, #0x24]
	add r2, sp, #4
	bl FUN_0380174C
	ldr r0, [sp, #8]
	ldrh r2, [sp, #4]
	lsl r1, r0, #7
	lsrs r1, r1, #0x1f
	ldreq r0, _038013C4 @ =0x038092D0
	moveq r1, #0
	strbeq r1, [r0, #1]
	strbeq r1, [r0]
	beq _03801250
	lsl r0, r0, #5
	lsrs r0, r0, #0x1e
	beq _038011FC
	ldr r1, _038013C4 @ =0x038092D0
	mov r3, #0
	strb r3, [r1]
	ldrb r0, [r1, #1]
	add r2, r0, #1
	and r0, r2, #0xff
	strb r2, [r1, #1]
	cmp r0, #4
	blo _03801250
	ldr r0, _038013C0 @ =0x038092D4
	strb r3, [r1, #1]
	ldr r1, [r0, #0x24]
	cmp r1, #0x23
	addlt r1, r1, #1
	strlt r1, [r0, #0x24]
	b _03801250
_038011FC:
	ldr r0, _038013C0 @ =0x038092D4
	ldr r1, _038013C4 @ =0x038092D0
	ldr r4, [r0, #0x24]
	mov r5, #0
	strb r5, [r1, #1]
	cmp r2, r4, asr #1
	strbge r5, [r1]
	bge _03801250
	ldrb r2, [r1]
	add r3, r2, #1
	and r2, r3, #0xff
	strb r3, [r1]
	cmp r2, #4
	blo _03801250
	strb r5, [r1]
	ldr r2, [r0, #0x28]
	cmp r4, r2
	subgt r3, r4, #1
	movgt r2, #3
	strgt r3, [r0, #0x24]
	strbgt r2, [r1, #1]
_03801250:
	ldrh r0, [sp, #8]
	ldr r1, _038013C8 @ =0x027FFFAA
	strh r0, [r1]
	ldrh r0, [sp, #0xa]
	strh r0, [r1, #2]
	ldr r0, [sl, #4]
	cmp r0, #0
	bne _03801284
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #0
	bl FUN_03800AFC
	b _03801298
_03801284:
	ldr r1, [sl, #8]
	lsl r0, r0, #0x10
	and r1, r1, #0xff
	lsr r0, r0, #0x10
	bl FUN_03800AFC
_03801298:
	mov r0, #0
	bl FUN_03800BF4
	b _038013B4
_038012A4:
	ldr r6, _038013C0 @ =0x038092D4
	ldr r0, [r6, #0x20]
	cmp r0, #1
	bne _03801354
	ldr r8, _038013CC @ =0x00000107
	ldr r5, _038013D0 @ =0x03809300
	mov sb, #0
	mov r7, #0xd7
	mov fp, #0xa
	mov r4, #0x28
	b _03801324
_038012D0:
	mul r0, sb, r8
	bl FUN_03806468
	ldr r2, [sl, #0xc]
	mov r1, r8
	add r0, r2, r0
	bl FUN_03806468
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0xc8
	blo _03801300
	cmp r0, #0xd7
	movlo r0, r7
_03801300:
	add r1, r6, sb, lsl #1
	strh r0, [r1, #0xcc]
	str sb, [sp]
	mla r0, sb, r4, r5
	ldrsh r1, [r1, #0xcc]
	ldr r3, _038013D4 @ =FUN_038013DC
	mov r2, fp
	bl FUN_037FA94C
	add sb, sb, #1
_03801324:
	ldr r1, [sl, #8]
	cmp sb, r1
	blo _038012D0
	ldr r0, [sl, #4]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	ldr r0, _038013C0 @ =0x038092D4
	mov r1, #2
	str r1, [r0, #0x20]
	b _038013B4
_03801354:
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	mov r1, #3
	bl FUN_03800AFC
	b _038013B4
_03801368:
	ldr r0, _038013C0 @ =0x038092D4
	ldr r0, [r0, #0x20]
	cmp r0, #3
	bne _038013A4
	ldr r0, _038013D8 @ =0x54505641
	bl FUN_037FAAA8
	ldr r0, [sl, #4]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	ldr r0, _038013C0 @ =0x038092D4
	mov r1, #0
	str r1, [r0, #0x20]
	b _038013B4
_038013A4:
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	mov r1, #3
	bl FUN_03800AFC
_038013B4:
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_038013C0: .4byte 0x038092D4
_038013C4: .4byte 0x038092D0
_038013C8: .4byte 0x027FFFAA
_038013CC: .4byte 0x00000107
_038013D0: .4byte 0x03809300
_038013D4: .4byte FUN_038013DC
_038013D8: .4byte 0x54505641
	arm_func_end FUN_038010E4

	arm_func_start FUN_038013DC
FUN_038013DC: @ 0x038013DC
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r3, r4
	mov r0, #0
	mov r1, #0x10
	mov r2, #1
	bl FUN_03800C30
	cmp r0, #0
	bne _03801434
	ldr r0, [sp]
	ldr r3, _03801440 @ =0x027FFFAA
	bic r0, r0, #0x6000000
	orr r0, r0, #0x6000000
	str r0, [sp]
	ldrh r0, [sp]
	ldrh r2, [sp, #2]
	strh r0, [r3]
	and r1, r4, #0xff
	mov r0, #0x10
	strh r2, [r3, #2]
	bl FUN_03800AFC
_03801434:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	.align 2, 0
_03801440: .4byte 0x027FFFAA
	arm_func_end FUN_038013DC

	arm_func_start FUN_03801444
FUN_03801444: @ 0x03801444
	push {r3, lr}
	mov r0, #0x8000
	bl FUN_037FB53C
	ldr r2, _03801520 @ =0x040001C0
_03801454:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03801454
	ldr r1, _03801524 @ =0x00008A01
	ldr r0, _03801528 @ =0x040001C2
	strh r1, [r2]
	mov r1, #0x84
	strh r1, [r0]
	sub r1, r0, #2
_03801478:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03801478
	bl FUN_03801538
	ldr r1, _0380152C @ =0x00008201
	ldr r0, _03801520 @ =0x040001C0
	strh r1, [r0]
	bl FUN_03801538
	ldr r0, _03801530 @ =0x038093A8
	ldrh r0, [r0]
	cmp r0, #0
	bne _038014C0
	ldr r0, _03801534 @ =0x04000136
	ldrh r0, [r0]
	tst r0, #0x40
	moveq r0, #1
	movne r0, #0
	b _03801518
_038014C0:
	ldr r2, _03801534 @ =0x04000136
	ldrh r0, [r2]
	tst r0, #0x40
	moveq r0, #1
	beq _03801518
	ldr r1, _03801524 @ =0x00008A01
	mov r0, #0x84
	strh r1, [r2, #0x8a]
	strh r0, [r2, #0x8c]
_038014E4:
	ldrh r0, [r2, #0x8a]
	tst r0, #0x80
	bne _038014E4
	bl FUN_03801538
	ldr r1, _0380152C @ =0x00008201
	ldr r0, _03801520 @ =0x040001C0
	strh r1, [r0]
	bl FUN_03801538
	ldr r0, _03801534 @ =0x04000136
	ldrh r0, [r0]
	tst r0, #0x40
	movne r0, #0
	moveq r0, #2
_03801518:
	pop {r3, lr}
	bx lr
	.align 2, 0
_03801520: .4byte 0x040001C0
_03801524: .4byte 0x00008A01
_03801528: .4byte 0x040001C2
_0380152C: .4byte 0x00008201
_03801530: .4byte 0x038093A8
_03801534: .4byte 0x04000136
	arm_func_end FUN_03801444

	arm_func_start FUN_03801538
FUN_03801538: @ 0x03801538
	ldr r0, _03801558 @ =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03801548:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03801548
	bx lr
	.align 2, 0
_03801558: .4byte 0x040001C2
	arm_func_end FUN_03801538

	arm_func_start FUN_0380155C
FUN_0380155C: @ 0x0380155C
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	cmp r2, #0
	ldr r2, _03801738 @ =0x040001C0
	mov r5, r3
	moveq r3, #0xd1
	moveq r4, #1
	mov r7, r0
	mov r6, r1
	movne r3, #0x91
	movne r4, #2
_03801588:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03801588
	ldr r1, _0380173C @ =0x00008A01
	ldr r0, _03801740 @ =0x040001C2
	strh r1, [r2]
	and r2, r3, #0xff
	strh r2, [r0]
	sub r1, r0, #2
_038015AC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _038015AC
	lsl r0, r2, #0x10
	ldr r2, _03801738 @ =0x040001C0
	mov ip, #0
	ldr r8, _03801744 @ =0x00007FF8
	add r1, sp, #0
	lsr r0, r0, #0x10
	mov r3, ip
_038015D4:
	strh r3, [r2, #2]
_038015D8:
	ldrh sb, [r2]
	tst sb, #0x80
	bne _038015D8
	ldrh sb, [r2, #2]
	and sb, sb, #0xff
	lsl lr, sb, #0x10
	lsr sb, lr, #8
	str sb, [r1, ip, lsl #2]
	strh r0, [r2, #2]
_038015FC:
	ldrh sb, [r2]
	tst sb, #0x80
	bne _038015FC
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
	blt _038015D4
	ldr r0, _03801748 @ =0x00008201
	strh r0, [r2]
	bl FUN_03801538
	mov r8, #0
	mov sb, r8
	add r2, sp, #0
_0380164C:
	ldr r1, [r2, sb, lsl #2]
	add r3, sb, #1
	b _03801670
_03801658:
	ldr r0, [r2, r3, lsl #2]
	add r3, r3, #1
	subs r0, r1, r0
	rsbmi r0, r0, #0
	cmp r0, r8
	movgt r8, r0
_03801670:
	cmp r3, #5
	blt _03801658
	add sb, sb, #1
	cmp sb, #4
	blt _0380164C
	strh r8, [r5]
	mov r8, #0
	add r0, sp, #0
	b _03801708
_03801694:
	ldr r3, [r0, r8, lsl #2]
	add sb, r8, #1
	b _038016FC
_038016A0:
	ldr r2, [r0, sb, lsl #2]
	subs r1, r3, r2
	rsbmi r1, r1, #0
	cmp r1, r6
	bgt _038016F8
	add r1, sb, #1
	b _038016F0
_038016BC:
	ldr r5, [r0, r1, lsl #2]
	subs ip, r3, r5
	rsbmi ip, ip, #0
	cmp ip, r6
	bgt _038016EC
	add r0, r2, r3, lsl #1
	add r0, r5, r0
	asr r0, r0, #2
	bic r0, r0, #7
	strh r0, [r7]
	mov r0, #0
	b _0380172C
_038016EC:
	add r1, r1, #1
_038016F0:
	cmp r1, #5
	blt _038016BC
_038016F8:
	add sb, sb, #1
_038016FC:
	cmp sb, #4
	blt _038016A0
	add r8, r8, #1
_03801708:
	cmp r8, #3
	blt _03801694
	ldr r2, [sp]
	ldr r1, [sp, #0x10]
	mov r0, r4
	add r1, r2, r1
	asr r1, r1, #1
	bic r1, r1, #7
	strh r1, [r7]
_0380172C:
	add sp, sp, #0x14
	pop {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03801738: .4byte 0x040001C0
_0380173C: .4byte 0x00008A01
_03801740: .4byte 0x040001C2
_03801744: .4byte 0x00007FF8
_03801748: .4byte 0x00008201
	arm_func_end FUN_0380155C

	arm_func_start FUN_0380174C
FUN_0380174C: @ 0x0380174C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	movs r6, r1
	mov r5, r2
	mov r1, #0
	mov r7, r0
	strh r1, [r5]
	rsbmi r6, r6, #0
	bl FUN_03801444
	movs r4, r0
	bne _038017B4
	ldr r1, [r7]
	mov r0, #0x1000
	rsb r0, r0, #0
	and r1, r1, r0
	ldr r0, _03801930 @ =0xFF000FFF
	and r0, r1, r0
	bic r1, r0, #0x1000000
	bic r0, r1, #0x6000000
	str r1, [r7]
	orr r1, r0, #0x6000000
	str r1, [r7]
	ldr r0, _03801934 @ =0x038093A8
	mov r1, #0
	strh r1, [r0]
	b _03801924
_038017B4:
	add r0, sp, #4
	add r3, sp, #2
	mov r1, r6
	mov r2, #0
	bl FUN_0380155C
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
	bl FUN_0380155C
	cmp r0, #2
	bne _03801834
	ldr r1, [r7]
	lsl r0, r1, #5
	lsr r0, r0, #0x1e
	orr r0, r0, #2
	bic r1, r1, #0x6000000
	lsl r0, r0, #0x1e
	orr r0, r1, r0, lsr #5
	str r0, [r7]
_03801834:
	ldrh r1, [sp, #4]
	ldr r2, [r7]
	ldr r0, _03801930 @ =0xFF000FFF
	lsl r1, r1, #0x14
	and r0, r2, r0
	orr r2, r0, r1, lsr #8
	ldr r1, _03801938 @ =0x00008A01
	ldr r0, _0380193C @ =0x040001C0
	str r2, [r7]
	strh r1, [r0]
	mov r6, #0
_03801860:
	bl FUN_03801538
	add r6, r6, #1
	cmp r6, #0xc
	blt _03801860
	ldr r1, _03801940 @ =0x00008201
	ldr r0, _0380193C @ =0x040001C0
	strh r1, [r0]
	bl FUN_03801538
	cmp r4, #2
	ldreq r0, [r7]
	biceq r0, r0, #0x6000000
	orreq r0, r0, #0x6000000
	streq r0, [r7]
	bl FUN_03801444
	cmp r0, #0
	beq _03801904
	cmp r0, #1
	beq _038018D4
	cmp r0, #2
	bne _03801920
	ldr r1, [r7]
	ldr r0, _03801934 @ =0x038093A8
	orr r2, r1, #0x1000000
	bic r1, r2, #0x6000000
	orr r1, r1, #0x6000000
	str r1, [r7]
	mov r1, #0
	strh r1, [r0]
	b _03801924
_038018D4:
	ldr r1, [r7]
	ldr r0, _03801934 @ =0x038093A8
	orr r1, r1, #0x1000000
	str r1, [r7]
	mov r2, #1
	ldrh r1, [sp]
	ldrh r3, [sp, #2]
	strh r2, [r0]
	cmp r3, r1
	movlo r3, r1
	strh r3, [r5]
	b _03801924
_03801904:
	ldr r1, [r7]
	ldr r0, _03801934 @ =0x038093A8
	bic r1, r1, #0x1000000
	str r1, [r7]
	mov r1, #0
	strh r1, [r0]
	b _03801924
_03801920:
	bl FUN_037FAE94
_03801924:
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03801930: .4byte 0xFF000FFF
_03801934: .4byte 0x038093A8
_03801938: .4byte 0x00008A01
_0380193C: .4byte 0x040001C0
_03801940: .4byte 0x00008201
	arm_func_end FUN_0380174C

	arm_func_start FUN_03801944
FUN_03801944: @ 0x03801944
	ldr r0, _03801978 @ =0x038093AC
	mov r1, #1
	str r1, [r0, #4]
	mov r3, #0
	str r3, [r0, #0x28]
	ldr r0, _0380197C @ =0x038093B4
	mov r2, r3
_03801960:
	lsl r1, r3, #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _03801960
	bx lr
	.align 2, 0
_03801978: .4byte 0x038093AC
_0380197C: .4byte 0x038093B4
	arm_func_end FUN_03801944

	arm_func_start FUN_03801980
FUN_03801980: @ 0x03801980
	push {r3, r4, lr}
	sub sp, sp, #4
	tst r0, #0x2000000
	beq _038019B0
	ldr r1, _03801B34 @ =0x038093B4
	mov r4, #0
	mov r3, r4
_0380199C:
	lsl r2, r4, #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _0380199C
_038019B0:
	ldr r1, _03801B34 @ =0x038093B4
	and r2, r0, #0xf0000
	lsr r2, r2, #0x10
	lsl r2, r2, #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _03801B28
	ldr r1, _03801B38 @ =0x038093AC
	ldrh r2, [r1, #8]
	and r0, r2, #0xff00
	lsl r0, r0, #8
	lsr r4, r0, #0x10
	sub r0, r4, #0x60
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _03801B1C
_038019F0: @ jump table
	b _03801A10 @ case 0
	b _03801A20 @ case 1
	b _03801B1C @ case 2
	b _03801AB8 @ case 3
	b _03801A54 @ case 4
	b _03801A88 @ case 5
	b _03801AEC @ case 6
	b _03801B04 @ case 7
_03801A10:
	mov r0, #0x60
	mov r1, #0
	bl FUN_03800AFC
	b _03801B28
_03801A20:
	ldrh ip, [r1, #0xa]
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #3
	mov r2, #2
	str ip, [sp]
	bl FUN_03800C30
	cmp r0, #0
	bne _03801B28
	mov r0, r4
	mov r1, #4
	bl FUN_03800AFC
	b _03801B28
_03801A54:
	ldrh ip, [r1, #0xa]
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #3
	mov r2, #2
	str ip, [sp]
	bl FUN_03800C30
	cmp r0, #0
	bne _03801B28
	mov r0, r4
	mov r1, #4
	bl FUN_03800AFC
	b _03801B28
_03801A88:
	lsl r0, r2, #0x10
	mov r1, r4
	lsr r3, r0, #0x10
	mov r0, #3
	mov r2, #1
	bl FUN_03800C30
	cmp r0, #0
	bne _03801B28
	mov r0, r4
	mov r1, #4
	bl FUN_03800AFC
	b _03801B28
_03801AB8:
	ldrh r0, [r1, #0xa]
	lsl r2, r2, #0x18
	mov r1, r4
	orr r3, r0, r2, lsr #8
	mov r0, #3
	mov r2, #1
	bl FUN_03800C30
	cmp r0, #0
	bne _03801B28
	mov r0, r4
	mov r1, #4
	bl FUN_03800AFC
	b _03801B28
_03801AEC:
	and r0, r2, #0xff
	bl FUN_038022BC
	mov r0, #0x66
	mov r1, #0
	bl FUN_03800AFC
	b _03801B28
_03801B04:
	bl FUN_038022D8
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0x67
	bl FUN_03800AFC
	b _03801B28
_03801B1C:
	mov r0, r4
	mov r1, #1
	bl FUN_03800AFC
_03801B28:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	.align 2, 0
_03801B34: .4byte 0x038093B4
_03801B38: .4byte 0x038093AC
	arm_func_end FUN_03801980

	arm_func_start FUN_03801B3C
FUN_03801B3C: @ 0x03801B3C
	push {r3, r4, r5, lr}
	mov r4, r0
	bl FUN_037FAD24
	mov r5, r0
	mov r0, #3
	bl FUN_03800BC0
	cmp r0, #0
	bne _03801B7C
	mov r0, r5
	bl FUN_037FAD38
	ldr r0, [r4, #4]
	mov r1, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	b _03801CA0
_03801B7C:
	mov r0, #3
	bl FUN_03800BDC
	mov r0, r5
	bl FUN_037FAD38
	ldr r1, [r4, #4]
	sub r0, r1, #0x61
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _03801C88
_03801BA0: @ jump table
	b _03801BB8 @ case 0
	b _03801C88 @ case 1
	b _03801C54 @ case 2
	b _03801BDC @ case 3
	b _03801C18 @ case 4
	b _03801C7C @ case 5
_03801BB8:
	ldr r0, _03801CA8 @ =0x038093AC
	mov r1, #1
	str r1, [r0, #0x28]
	ldr r1, [r4, #8]
	strh r1, [r0, #2]
	ldr r1, [r4, #0xc]
	strh r1, [r0]
	bl FUN_03801FBC
	b _03801C98
_03801BDC:
	ldr r2, _03801CA8 @ =0x038093AC
	mov r0, #4
	str r0, [r2, #0x28]
	ldr r0, [r4, #8]
	str r0, [r2, #0x30]
	ldr r3, [r4, #0xc]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	and r1, r3, #0xff
	str r3, [r2, #0x2c]
	bl FUN_03801CF0
	mov r0, #0x64
	mov r1, #0
	bl FUN_03800AFC
	b _03801C98
_03801C18:
	ldr r1, _03801CA8 @ =0x038093AC
	mov r0, #3
	str r0, [r1, #0x28]
	ldr r2, [r4, #8]
	lsl r0, r2, #0x10
	lsr r4, r0, #0x10
	mov r0, r4
	str r2, [r1, #0x30]
	bl FUN_03801D6C
	add r1, r4, #0x70
	lsl r2, r1, #0x10
	mov r1, r0
	lsr r0, r2, #0x10
	bl FUN_03800AFC
	b _03801C98
_03801C54:
	ldr r1, _03801CA8 @ =0x038093AC
	mov r0, #2
	str r0, [r1, #0x28]
	ldr r0, [r4, #8]
	str r0, [r1, #0x2c]
	bl FUN_03801E30
	mov r0, #0x63
	mov r1, #0
	bl FUN_03800AFC
	b _03801C98
_03801C7C:
	ldr r0, [r4, #8]
	bl FUN_03801F54
	b _03801C98
_03801C88:
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	mov r1, #1
	bl FUN_03800AFC
_03801C98:
	mov r0, #3
	bl FUN_03800BF4
_03801CA0:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03801CA8: .4byte 0x038093AC
	arm_func_end FUN_03801B3C

	arm_func_start FUN_03801CAC
FUN_03801CAC: @ 0x03801CAC
	push {r4, r5, r6, lr}
	and r1, r1, #0x3f0000
	and r3, r0, #0x3c00000
	lsl r1, r1, #0x10
	lsl r0, r2, #0x10
	orr r1, r1, r3, lsl #22
	orr r6, r1, r0, lsr #16
	mov r5, #8
	mov r4, #0
_03801CD0:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	bne _03801CD0
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end FUN_03801CAC

	arm_func_start FUN_03801CF0
FUN_03801CF0: @ 0x03801CF0
	push {r4, lr}
	ldr r2, _03801D3C @ =0x040001C0
	mov r4, r1
_03801CFC:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03801CFC
	ldr r1, _03801D40 @ =0x00008202
	and r0, r0, #0xff
	strh r1, [r2]
	add r1, r1, #0x600
	strh r1, [r2]
	bl FUN_03801D48
	ldr r2, _03801D44 @ =0x00008002
	ldr r1, _03801D3C @ =0x040001C0
	and r0, r4, #0xff
	strh r2, [r1]
	strh r0, [r1, #2]
	pop {r4, lr}
	bx lr
	.align 2, 0
_03801D3C: .4byte 0x040001C0
_03801D40: .4byte 0x00008202
_03801D44: .4byte 0x00008002
	arm_func_end FUN_03801CF0

	arm_func_start FUN_03801D48
FUN_03801D48: @ 0x03801D48
	ldr r1, _03801D68 @ =0x040001C2
	and r0, r0, #0xff
	strh r0, [r1]
	sub r1, r1, #2
_03801D58:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03801D58
	bx lr
	.align 2, 0
_03801D68: .4byte 0x040001C2
	arm_func_end FUN_03801D48

	arm_func_start FUN_03801D6C
FUN_03801D6C: @ 0x03801D6C
	push {r3, lr}
	ldr r2, _03801DD0 @ =0x040001C0
_03801D74:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03801D74
	ldr r1, _03801DD4 @ =0x00008202
	orr r0, r0, #0x80
	strh r1, [r2]
	add r1, r1, #0x600
	and r0, r0, #0xff
	strh r1, [r2]
	bl FUN_03801D48
	ldr r2, _03801DD8 @ =0x00008002
	ldr r1, _03801DD0 @ =0x040001C0
	mov r0, #0
	strh r2, [r1]
	strh r0, [r1, #2]
_03801DB0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03801DB0
	ldr r0, _03801DDC @ =0x040001C2
	ldrh r0, [r0]
	and r0, r0, #0xff
	pop {r3, lr}
	bx lr
	.align 2, 0
_03801DD0: .4byte 0x040001C0
_03801DD4: .4byte 0x00008202
_03801DD8: .4byte 0x00008002
_03801DDC: .4byte 0x040001C2
	arm_func_end FUN_03801D6C

	arm_func_start FUN_03801DE0
FUN_03801DE0: @ 0x03801DE0
	push {r4, lr}
	mov r4, r0
	mov r0, #0
	bl FUN_03801D6C
	orr r1, r0, r4
	mov r0, #0
	bl FUN_03801CF0
	pop {r4, lr}
	bx lr
	arm_func_end FUN_03801DE0

	arm_func_start FUN_03801E04
FUN_03801E04: @ 0x03801E04
	push {r4, lr}
	mov r4, r0
	mov r0, #0
	bl FUN_03801D6C
	mvn r1, r4
	and r0, r0, r1
	and r1, r0, #0xff
	mov r0, #0
	bl FUN_03801CF0
	pop {r4, lr}
	bx lr
	arm_func_end FUN_03801E04

	arm_func_start FUN_03801E30
FUN_03801E30: @ 0x03801E30
	push {r3, lr}
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _03801F4C
_03801E40: @ jump table
	b _03801F4C @ case 0
	b _03801E80 @ case 1
	b _03801E94 @ case 2
	b _03801EA8 @ case 3
	b _03801EBC @ case 4
	b _03801EC8 @ case 5
	b _03801ED4 @ case 6
	b _03801EE0 @ case 7
	b _03801EEC @ case 8
	b _03801EF8 @ case 9
	b _03801F04 @ case 10
	b _03801F10 @ case 11
	b _03801F1C @ case 12
	b _03801F28 @ case 13
	b _03801F40 @ case 14
	b _03801F34 @ case 15
_03801E80:
	mov r0, #1
	bl FUN_038022BC
	mov r0, #1
	bl FUN_03801F54
	b _03801F4C
_03801E94:
	mov r0, #3
	bl FUN_038022BC
	mov r0, #3
	bl FUN_03801F54
	b _03801F4C
_03801EA8:
	mov r0, #2
	bl FUN_038022BC
	mov r0, #2
	bl FUN_03801F54
	b _03801F4C
_03801EBC:
	mov r0, #4
	bl FUN_03801DE0
	b _03801F4C
_03801EC8:
	mov r0, #4
	bl FUN_03801E04
	b _03801F4C
_03801ED4:
	mov r0, #8
	bl FUN_03801DE0
	b _03801F4C
_03801EE0:
	mov r0, #8
	bl FUN_03801E04
	b _03801F4C
_03801EEC:
	mov r0, #0xc
	bl FUN_03801DE0
	b _03801F4C
_03801EF8:
	mov r0, #0xc
	bl FUN_03801E04
	b _03801F4C
_03801F04:
	mov r0, #1
	bl FUN_03801DE0
	b _03801F4C
_03801F10:
	mov r0, #1
	bl FUN_03801E04
	b _03801F4C
_03801F1C:
	mov r0, #2
	bl FUN_03801E04
	b _03801F4C
_03801F28:
	mov r0, #2
	bl FUN_03801DE0
	b _03801F4C
_03801F34:
	mov r0, #0x40
	bl FUN_03801E04
	b _03801F4C
_03801F40:
	bl FUN_037FB69C
	mov r0, #0x40
	bl FUN_03801DE0
_03801F4C:
	pop {r3, lr}
	bx lr
	arm_func_end FUN_03801E30

	arm_func_start FUN_03801F54
FUN_03801F54: @ 0x03801F54
	push {r4, lr}
	mov r4, r0
	cmp r4, #1
	beq _03801F78
	cmp r4, #2
	beq _03801F90
	cmp r4, #3
	beq _03801F84
	b _03801FA4
_03801F78:
	mov r0, #0x10
	bl FUN_03801E04
	b _03801FA8
_03801F84:
	mov r0, #0x30
	bl FUN_03801DE0
	b _03801FA8
_03801F90:
	mov r0, #0x20
	bl FUN_03801E04
	mov r0, #0x10
	bl FUN_03801DE0
	b _03801FA8
_03801FA4:
	bl FUN_037FAE94
_03801FA8:
	ldr r0, _03801FB8 @ =0x03806B08
	str r4, [r0]
	pop {r4, lr}
	bx lr
	.align 2, 0
_03801FB8: .4byte 0x03806B08
	arm_func_end FUN_03801F54

	arm_func_start FUN_03801FBC
FUN_03801FBC: @ 0x03801FBC
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _03802178 @ =0x04000208
	mov r8, #0
	ldrh sb, [r0]
	strh r8, [r0]
	bl FUN_037FAD24
	mov r4, r0
	mvn r0, #0xfe000000
	bl FUN_037F894C
	mov r5, r0
	mov r0, r8
	bl FUN_03801D6C
	mov r6, r0
	mov r0, #2
	bl FUN_038022BC
	mov r0, #2
	bl FUN_03801F54
	mov r0, #2
	bl FUN_03801F54
	bl FUN_037FB69C
	mov r0, #1
	bl FUN_03801E04
	ldr r0, _0380217C @ =0x038093AE
	ldrh r0, [r0]
	tst r0, #1
	beq _03802040
	ldr r0, _03802180 @ =0x038093AC
	ldr r1, _03802184 @ =0x04000132
	ldrh r2, [r0]
	mov r0, #0x1000
	orr r2, r2, #0x4000
	strh r2, [r1]
	bl FUN_037F8914
_03802040:
	ldr r0, _0380217C @ =0x038093AE
	ldrh r0, [r0]
	tst r0, #4
	beq _03802058
	mov r0, #0x400000
	bl FUN_037F8914
_03802058:
	ldr r0, _0380217C @ =0x038093AE
	ldrh r0, [r0]
	tst r0, #2
	beq _0380209C
	ldr r1, _03802188 @ =0x04000134
	mov r0, #0x8000
	ldrh r7, [r1]
	mov r8, #1
	bl FUN_037FB53C
	mov r0, #0x40
	mov r1, #0
	bl FUN_037FB51C
	mov r0, #0x100
	mov r1, r0
	bl FUN_037FB51C
	mov r0, #0x80
	bl FUN_037F8914
_0380209C:
	ldr r0, _0380217C @ =0x038093AE
	ldrh r0, [r0]
	tst r0, #8
	beq _038020B4
	mov r0, #0x100000
	bl FUN_037F8914
_038020B4:
	ldr r0, _0380217C @ =0x038093AE
	ldrh r0, [r0]
	tst r0, #0x10
	beq _038020CC
	mov r0, #0x2000
	bl FUN_037F8914
_038020CC:
	mov r0, r4
	bl FUN_037FAD38
	ldr r2, _03802178 @ =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	bl FUN_03802190
	mov r1, r6
	mov r0, #0
	bl FUN_03801CF0
	ldr r0, _0380217C @ =0x038093AE
	ldrh r1, [r0]
	tst r1, #0x20
	movne r0, #6
	moveq r0, #7
	tst r1, #0x40
	movne r6, #4
	moveq r6, #5
	bl FUN_03801E30
	mov r0, r6
	bl FUN_03801E30
	cmp r8, #0
	ldrne r0, _03802188 @ =0x04000134
	strhne r7, [r0]
	mov r0, #1
	bl FUN_03801DE0
	bl FUN_037FB6F4
	mov r1, #0
	ldr r3, _0380218C @ =0x038093B4
	mov r2, r1
	mov r0, #0x62
	str r1, [r3, #0x20]
	bl FUN_03801CAC
	bl FUN_037FAD24
	mov r0, r5
	bl FUN_037F88C8
	mov r0, r4
	bl FUN_037FAD38
	ldr r1, _03802178 @ =0x04000208
	ldrh r0, [r1]
	strh sb, [r1]
	pop {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03802178: .4byte 0x04000208
_0380217C: .4byte 0x038093AE
_03802180: .4byte 0x038093AC
_03802184: .4byte 0x04000132
_03802188: .4byte 0x04000134
_0380218C: .4byte 0x038093B4
	arm_func_end FUN_03801FBC

	arm_func_start FUN_03802190
FUN_03802190: @ 0x03802190
	ldr ip, _03802198 @ =FUN_038008C6
	bx ip
	.align 2, 0
_03802198: .4byte FUN_038008C6
	arm_func_end FUN_03802190

	arm_func_start FUN_0380219C
FUN_0380219C: @ 0x0380219C
	push {r4, r5, r6, lr}
	ldr r1, _038022B0 @ =0x038093E0
	ldr r3, [r1, #4]
	cmp r3, #0
	bne _038021D8
	mov r2, #1
	mov r3, r2
	mov r0, #3
	mov r1, #0x66
	bl FUN_03800C30
	cmp r0, #0
	beq _038022A8
	mov r0, #1
	bl FUN_038022BC
	b _038022A8
_038021D8:
	cmp r3, #4
	bge _03802204
	ldr r0, _038022B4 @ =0x03806B08
	ldr r0, [r0]
	cmp r3, r0
	beq _038022A8
	mov r0, #3
	mov r1, #0x66
	mov r2, #1
	bl FUN_03800C30
	b _038022A8
_03802204:
	sub r2, r3, #4
	mov r0, #0xc
	mul r4, r2, r0
	ldr r5, _038022B8 @ =0x03806B0C
	ldr r0, [r1]
	add r6, r5, r4
	ldrh r1, [r6, #0xa]
	bl FUN_03806468
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
	ldr r0, _038022B0 @ =0x038093E0
	mul r1, r2, r1
	ldr r2, [r0]
	moveq r3, #2
	add r2, r2, #1
	cmp r2, r1
	str r2, [r0]
	movhs r1, #0
	strhs r1, [r0]
	ldr r0, _038022B4 @ =0x03806B08
	ldr r0, [r0]
	cmp r3, r0
	beq _038022A8
	mov r0, #3
	mov r1, #0x66
	mov r2, #1
	bl FUN_03800C30
_038022A8:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_038022B0: .4byte 0x038093E0
_038022B4: .4byte 0x03806B08
_038022B8: .4byte 0x03806B0C
	arm_func_end FUN_0380219C

	arm_func_start FUN_038022BC
FUN_038022BC: @ 0x038022BC
	cmp r0, #0xf
	ldrle r1, _038022D4 @ =0x038093E0
	movle r2, #0
	strle r0, [r1, #4]
	strle r2, [r1]
	bx lr
	.align 2, 0
_038022D4: .4byte 0x038093E0
	arm_func_end FUN_038022BC

	arm_func_start FUN_038022D8
FUN_038022D8: @ 0x038022D8
	ldr r0, _038022E4 @ =0x038093E0
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_038022E4: .4byte 0x038093E0
	arm_func_end FUN_038022D8

	arm_func_start FUN_038022E8
FUN_038022E8: @ 0x038022E8
	ldr r0, _03802324 @ =0x038093E8
	mov r3, #0
	str r3, [r0, #0x20]
	ldr r0, _03802328 @ =0x038093E8
	mov r2, r3
_038022FC:
	lsl r1, r3, #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _038022FC
	ldr r1, _0380232C @ =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bx lr
	.align 2, 0
_03802324: .4byte 0x038093E8
_03802328: .4byte 0x038093E8
_0380232C: .4byte 0x0400010E
	arm_func_end FUN_038022E8

	arm_func_start FUN_03802330
FUN_03802330: @ 0x03802330
	push {r4, lr}
	tst r0, #0x2000000
	beq _0380235C
	ldr r1, _038025E8 @ =0x038093E8
	mov r4, #0
	mov r3, r4
_03802348:
	lsl r2, r4, #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _03802348
_0380235C:
	ldr r1, _038025E8 @ =0x038093E8
	and r2, r0, #0xf0000
	lsr r2, r2, #0x10
	lsl r2, r2, #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _038025E0
	ldr r1, _038025EC @ =0x038093E8
	ldrh r2, [r1]
	and r0, r2, #0xff00
	lsl r0, r0, #8
	lsr r4, r0, #0x10
	sub r0, r4, #0x40
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _038025D4
_0380239C: @ jump table
	b _038023AC @ case 0
	b _038023E8 @ case 1
	b _038024EC @ case 2
	b _03802550 @ case 3
_038023AC:
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #2
	mov r2, #1
	bl FUN_03800C30
	cmp r0, #0
	bne _038023D4
	mov r0, r4
	mov r1, #4
	bl FUN_03800AFC
_038023D4:
	ldr r0, _038025F0 @ =0x027FFF94
	mov r1, #0
	strh r1, [r0]
	str r1, [r0, #-4]
	b _038025E0
_038023E8:
	ldr r0, [r1, #0x20]
	cmp r0, #0
	beq _03802404
	mov r0, r4
	mov r1, #3
	bl FUN_03800AFC
	b _038025E0
_03802404:
	and r0, r2, #0xff
	strh r0, [r1, #0x24]
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	orr r3, r0, r2, lsl #16
	cmp r3, #0x2000000
	blo _03802428
	cmp r3, #0x2400000
	blo _03802438
_03802428:
	mov r0, r4
	mov r1, #2
	bl FUN_03800AFC
	b _038025E0
_03802438:
	str r3, [r1, #0x28]
	ldrh r2, [r1, #6]
	ldrh r0, [r1, #8]
	orr r2, r0, r2, lsl #16
	add r0, r3, r2
	cmp r0, #0x2400000
	bls _03802464
	mov r0, r4
	mov r1, #2
	bl FUN_03800AFC
	b _038025E0
_03802464:
	str r2, [r1, #0x30]
	ldrh r2, [r1, #0xa]
	ldrh r0, [r1, #0xc]
	orr r0, r0, r2, lsl #16
	bl FUN_038025F8
	cmp r0, #0
	bne _03802490
	mov r0, r4
	mov r1, #2
	bl FUN_03800AFC
	b _038025E0
_03802490:
	ldr r3, _038025EC @ =0x038093E8
	mov r2, #0
	str r2, [r3, #0x2c]
	ldrh r0, [r3, #0x24]
	mov r1, r4
	and ip, r0, #7
	mov r0, #2
	strh ip, [r3, #0x26]
	bl FUN_03800C30
	cmp r0, #0
	bne _038024CC
	mov r0, r4
	mov r1, #4
	bl FUN_03800AFC
	b _038025E0
_038024CC:
	ldr r1, _038025F0 @ =0x027FFF94
	mov r2, #0
	strh r2, [r1]
	ldr r0, _038025EC @ =0x038093E8
	str r2, [r1, #-4]
	mov r1, #1
	str r1, [r0, #0x20]
	b _038025E0
_038024EC:
	ldr r0, [r1, #0x20]
	cmp r0, #2
	beq _03802508
	mov r0, r4
	mov r1, #3
	bl FUN_03800AFC
	b _038025E0
_03802508:
	mov r1, r4
	mov r0, #2
	mov r2, #0
	bl FUN_03800C30
	cmp r0, #0
	bne _03802530
	mov r0, r4
	mov r1, #4
	bl FUN_03800AFC
	b _038025E0
_03802530:
	ldr r0, _038025EC @ =0x038093E8
	mov r2, #3
	ldr r1, _038025F4 @ =0x0400010E
	str r2, [r0, #0x20]
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	b _038025E0
_03802550:
	ldr r0, [r1, #0x20]
	cmp r0, #2
	beq _0380256C
	mov r0, r4
	mov r1, #3
	bl FUN_03800AFC
	b _038025E0
_0380256C:
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	orr r0, r0, r2, lsl #16
	bl FUN_038025F8
	cmp r0, #0
	bne _03802594
	mov r0, r4
	mov r1, #2
	bl FUN_03800AFC
	b _038025E0
_03802594:
	bl FUN_037FAD24
	ldr r3, _038025F4 @ =0x0400010E
	ldr r1, _038025EC @ =0x038093E8
	ldrh r2, [r3]
	bic r2, r2, #0x80
	strh r2, [r3]
	ldrh r2, [r1, #0x34]
	strh r2, [r3, #-2]
	ldrh r1, [r1, #0x36]
	orr r1, r1, #0xc0
	strh r1, [r3]
	bl FUN_037FAD38
	mov r0, r4
	mov r1, #0
	bl FUN_03800AFC
	b _038025E0
_038025D4:
	mov r0, r4
	mov r1, #1
	bl FUN_03800AFC
_038025E0:
	pop {r4, lr}
	bx lr
	.align 2, 0
_038025E8: .4byte 0x038093E8
_038025EC: .4byte 0x038093E8
_038025F0: .4byte 0x027FFF94
_038025F4: .4byte 0x0400010E
	arm_func_end FUN_03802330

	arm_func_start FUN_038025F8
FUN_038025F8: @ 0x038025F8
	cmp r0, #0x10000
	bhs _0380261C
	ldr r1, _03802698 @ =0x038093E8
	mov r2, #0
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
_0380261C:
	cmp r0, #0x400000
	bhs _03802644
	ldr r1, _03802698 @ =0x038093E8
	mov r3, #1
	lsr r0, r0, #6
	rsb r2, r0, #0x10000
	strh r3, [r1, #0x36]
	mov r0, r3
	strh r2, [r1, #0x34]
	bx lr
_03802644:
	cmp r0, #0x1000000
	bhs _0380266C
	ldr r1, _03802698 @ =0x038093E8
	mov r2, #2
	lsr r0, r0, #8
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
_0380266C:
	cmp r0, #0x4000000
	movhs r0, #0
	bxhs lr
	ldr r1, _03802698 @ =0x038093E8
	mov r2, #3
	lsr r0, r0, #0xa
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
	.align 2, 0
_03802698: .4byte 0x038093E8
	arm_func_end FUN_038025F8

	arm_func_start FUN_0380269C
FUN_0380269C: @ 0x0380269C
	push {r3, r4, r5, lr}
	mov r4, r0
	ldr r2, [r4, #4]
	cmp r2, #0x40
	beq _038026C4
	cmp r2, #0x41
	beq _03802774
	cmp r2, #0x42
	beq _0380280C
	b _038028A8
_038026C4:
	bl FUN_037FAD24
	mov r5, r0
	mov r0, #2
	bl FUN_03800BC0
	cmp r0, #0
	bne _038026FC
	mov r0, r5
	bl FUN_037FAD38
	ldr r0, [r4, #4]
	mov r1, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	b _038028A8
_038026FC:
	mov r0, #2
	bl FUN_03800BDC
	mov r0, r5
	bl FUN_037FAD38
	ldr r0, [r4, #8]
	and r0, r0, #1
	cmp r0, #1
	bne _03802730
	bl FUN_03802BB4
	ldr r1, [r4, #8]
	tst r1, #2
	eorne r0, r0, #0x8000
	b _03802740
_03802730:
	bl FUN_03802A60
	ldr r1, [r4, #8]
	tst r1, #2
	eorne r0, r0, #0x80
_03802740:
	ldr r1, _038028B0 @ =0x027FFF94
	lslne r0, r0, #0x10
	lsrne r0, r0, #0x10
	strh r0, [r1]
	str r1, [r1, #-4]
	ldr r0, [r4, #4]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	mov r0, #2
	bl FUN_03800BF4
	b _038028A8
_03802774:
	ldr r0, _038028B4 @ =0x038093E8
	ldr r1, [r0, #0x20]
	cmp r1, #1
	bne _038027F8
	mov r1, #0
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x38]
	bl FUN_037FAD24
	mov r5, r0
	mov r0, #0x40
	bl FUN_037F8914
	ldr r1, _038028B8 @ =FUN_038028C4
	mov r0, #0x40
	bl FUN_03802CE8
	bl FUN_03802D10
	ldr r1, _038028B4 @ =0x038093E8
	ldr r2, _038028BC @ =0x0400010C
	ldrh r3, [r1, #0x34]
	mov r0, r5
	strh r3, [r2]
	ldrh r1, [r1, #0x36]
	orr r1, r1, #0xc0
	strh r1, [r2, #2]
	bl FUN_037FAD38
	ldr r0, [r4, #4]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	ldr r0, _038028B4 @ =0x038093E8
	mov r1, #2
	str r1, [r0, #0x20]
	b _038028A8
_038027F8:
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	mov r1, #3
	bl FUN_03800AFC
	b _038028A8
_0380280C:
	ldr r0, _038028B4 @ =0x038093E8
	ldr r1, [r0, #0x20]
	sub r0, r1, #3
	cmp r0, #1
	bhi _03802888
	ldr r1, _038028C0 @ =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bl FUN_037FAD24
	mov r4, r0
	mov r0, #0x40
	mov r1, #0
	bl FUN_03802CE8
	bl FUN_03802D70
	mov r0, r4
	bl FUN_037FAD38
	ldr r0, _038028B4 @ =0x038093E8
	mov r1, #0
	ldr r0, [r0, #0x20]
	cmp r0, #3
	bne _03802870
	mov r0, #0x42
	bl FUN_03800AFC
	b _03802878
_03802870:
	mov r0, #0x51
	bl FUN_03800AFC
_03802878:
	ldr r0, _038028B4 @ =0x038093E8
	mov r1, #0
	str r1, [r0, #0x20]
	b _038028A8
_03802888:
	cmp r1, #3
	mov r1, #3
	bne _038028A0
	mov r0, #0x42
	bl FUN_03800AFC
	b _038028A8
_038028A0:
	mov r0, #0x51
	bl FUN_03800AFC
_038028A8:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038028B0: .4byte 0x027FFF94
_038028B4: .4byte 0x038093E8
_038028B8: .4byte FUN_038028C4
_038028BC: .4byte 0x0400010C
_038028C0: .4byte 0x0400010E
	arm_func_end FUN_0380269C

	arm_func_start FUN_038028C4
FUN_038028C4: @ 0x038028C4
	push {r3, lr}
	bl FUN_038028F8
	ldr r3, _038028F0 @ =0x0380FFF8
	ldr r0, _038028F4 @ =0x04000214
	ldr r2, [r3]
	mov r1, #0x40
	orr r2, r2, #0x40
	str r2, [r3]
	str r1, [r0]
	pop {r3, lr}
	bx lr
	.align 2, 0
_038028F0: .4byte 0x0380FFF8
_038028F4: .4byte 0x04000214
	arm_func_end FUN_038028C4

	arm_func_start FUN_038028F8
FUN_038028F8: @ 0x038028F8
	push {r4, r5, r6, r7, lr}
	ldr r4, _03802A50 @ =0x038093E8
	ldrh r5, [r4, #0x26]
	and r0, r5, #4
	cmp r0, #4
	ldrh r6, [r4, #0x38]
	ldrhne r7, [r4, #0x3a]
	ldreq r7, _03802A54 @ =0x0000FFFF
	bl FUN_03800D08
	cmp r0, #0
	bne _03802964
	mov r0, #2
	bl FUN_03800BC0
	cmp r0, #0
	beq _03802964
	and r0, r5, #1
	cmp r0, #1
	bne _03802954
	bl FUN_03802BB4
	tst r5, #2
	moveq r7, r0
	eorne r7, r0, #0x8000
	b _03802964
_03802954:
	bl FUN_03802A60
	tst r5, #2
	moveq r7, r0
	eorne r7, r0, #0x80
_03802964:
	and r0, r5, #1
	ldr r3, _03802A58 @ =0x027FFC00
	ldr r1, [r4, #0x2c]
	cmp r0, #1
	bne _03802994
	ldr r2, [r4, #0x28]
	strh r7, [r2, r1]!
	str r2, [r3, #0x390]
	add r3, r3, #0x394
	strh r7, [r3]
	add r1, r1, #2
	b _038029CC
_03802994:
	and r7, r7, #0xff
	tst r1, #1
	bne _038029AC
	mov r6, r7
	add r1, r1, #1
	b _038029CC
_038029AC:
	orr r0, r6, r7, lsl #8
	ldr r2, [r4, #0x28]
	sub r1, r1, #1
	strh r0, [r2, r1]!
	str r2, [r3, #0x390]
	add r3, r3, #0x394
	strh r0, [r3]
	add r1, r1, #2
_038029CC:
	strh r6, [r4, #0x38]
	strh r7, [r4, #0x3a]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	movhs r1, #0
	str r1, [r4, #0x2c]
	blo _03802A48
	ldrh r0, [r4, #0x24]
	and r0, r0, #0x10
	cmp r0, #0x10
	bne _03802A08
	mov r0, #0x51
	mov r1, #0
	bl FUN_03800AFC
	b _03802A48
_03802A08:
	mov r0, #2
	mov r1, #0x42
	mov r2, #0
	bl FUN_03800C30
	cmp r0, #0
	bne _03802A30
	mov r0, #0x51
	mov r1, #4
	bl FUN_03800AFC
	b _03802A48
_03802A30:
	mov r0, #4
	str r0, [r4, #0x20]
	ldr r1, _03802A5C @ =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
_03802A48:
	pop {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03802A50: .4byte 0x038093E8
_03802A54: .4byte 0x0000FFFF
_03802A58: .4byte 0x027FFC00
_03802A5C: .4byte 0x0400010E
	arm_func_end FUN_038028F8

	arm_func_start FUN_03802A60
FUN_03802A60: @ 0x03802A60
	push {r4, lr}
	ldr r2, _03802B6C @ =0x040001C0
_03802A68:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03802A68
	ldr r1, _03802B70 @ =0x00008A01
	ldr r0, _03802B74 @ =0x040001C2
	strh r1, [r2]
	mov r1, #0xec
	strh r1, [r0]
	sub r1, r0, #2
_03802A8C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03802A8C
	bl FUN_03802B84
	ldr r2, _03802B78 @ =0x00008201
	ldr r1, _03802B6C @ =0x040001C0
	lsl r4, r0, #0x18
	strh r2, [r1]
	bl FUN_03802B84
	ldr r2, _03802B7C @ =0x03809424
	ldr r1, _03802B80 @ =0x00007F80
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
	blo _03802B3C
	ldrsb r4, [r2]
	lsr r0, r3, #0xc
	sub r0, r0, #0x80
	lsl r0, r0, #0x18
	cmp r4, r0, asr #24
	asr r0, r0, #0x18
	cmplt r4, #0xc
	addlt r0, r4, #1
	strblt r0, [r2]
	blt _03802B2C
	cmp r0, r4
	bge _03802B2C
	mvn r0, #0xb
	cmp r4, r0
	ldrgt r0, _03802B7C @ =0x03809424
	ldrsbgt r2, [r0]
	subgt r2, r2, #1
	strbgt r2, [r0]
_03802B2C:
	ldr r0, _03802B7C @ =0x03809424
	mov r2, #0
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
_03802B3C:
	ldr r0, _03802B7C @ =0x03809424
	ldrsb r0, [r0]
	rsb r0, r0, r1, lsr #16
	cmp r0, #0xff
	movgt r0, #0xff
	bgt _03802B5C
	cmp r0, #0
	movlt r0, #0
_03802B5C:
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, lr}
	bx lr
	.align 2, 0
_03802B6C: .4byte 0x040001C0
_03802B70: .4byte 0x00008A01
_03802B74: .4byte 0x040001C2
_03802B78: .4byte 0x00008201
_03802B7C: .4byte 0x03809424
_03802B80: .4byte 0x00007F80
	arm_func_end FUN_03802A60

	arm_func_start FUN_03802B84
FUN_03802B84: @ 0x03802B84
	ldr r0, _03802BB0 @ =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03802B94:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03802B94
	ldr r0, _03802BB0 @ =0x040001C2
	ldrh r0, [r0]
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_03802BB0: .4byte 0x040001C2
	arm_func_end FUN_03802B84

	arm_func_start FUN_03802BB4
FUN_03802BB4: @ 0x03802BB4
	push {r4, lr}
	ldr r2, _03802CCC @ =0x040001C0
_03802BBC:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03802BBC
	ldr r1, _03802CD0 @ =0x00008A01
	ldr r0, _03802CD4 @ =0x040001C2
	strh r1, [r2]
	mov r1, #0xe4
	strh r1, [r0]
	sub r1, r0, #2
_03802BE0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03802BE0
	bl FUN_03802B84
	ldr r2, _03802CD8 @ =0x00008201
	ldr r1, _03802CCC @ =0x040001C0
	lsl r4, r0, #0x18
	strh r2, [r1]
	bl FUN_03802B84
	ldr r3, _03802CDC @ =0x03809424
	ldr r1, _03802CE0 @ =0x00007FF8
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
	blo _03802C98
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
	blt _03802C88
	cmp r1, r4
	bge _03802C88
	mov r0, #0xc00
	rsb r0, r0, #0
	cmp r4, r0
	ldrgt r0, _03802CDC @ =0x03809424
	ldrshgt r1, [r0, #2]
	subgt r1, r1, #0x10
	strhgt r1, [r0, #2]
_03802C88:
	ldr r0, _03802CDC @ =0x03809424
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_03802C98:
	ldr r1, _03802CDC @ =0x03809424
	ldr r0, _03802CE4 @ =0x0000FFF0
	ldrsh r1, [r1, #2]
	rsb r1, r1, r2, lsr #16
	cmp r1, r0
	movgt r1, r0
	bgt _03802CBC
	cmp r1, #0
	movlt r1, #0
_03802CBC:
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r4, lr}
	bx lr
	.align 2, 0
_03802CCC: .4byte 0x040001C0
_03802CD0: .4byte 0x00008A01
_03802CD4: .4byte 0x040001C2
_03802CD8: .4byte 0x00008201
_03802CDC: .4byte 0x03809424
_03802CE0: .4byte 0x00007FF8
_03802CE4: .4byte 0x0000FFF0
	arm_func_end FUN_03802BB4

	arm_func_start FUN_03802CE8
FUN_03802CE8: @ 0x03802CE8
	ldr r2, _03802D0C @ =0x03806A88
	mov r3, #0
_03802CF0:
	tst r0, #1
	strne r1, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x19
	lsr r0, r0, #1
	blt _03802CF0
	bx lr
	.align 2, 0
_03802D0C: .4byte 0x03806A88
	arm_func_end FUN_03802CE8

	arm_func_start FUN_03802D10
FUN_03802D10: @ 0x03802D10
	push {r3, lr}
	ldr r3, _03802D64 @ =0x0380FFFC
	ldr r0, _03802D68 @ =FUN_03802DB4
	ldr r2, [r3]
	cmp r2, r0
	beq _03802D5C
	ldr r0, _03802D6C @ =0x03809438
	mov r1, #0
	str r1, [r0]
	sub r1, r3, #0x17c
	str r1, [r0, #4]
	mov r1, #0x40
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bl FUN_037FAD24
	ldr r2, _03802D68 @ =FUN_03802DB4
	ldr r1, _03802D64 @ =0x0380FFFC
	str r2, [r1]
	bl FUN_037FAD38
_03802D5C:
	pop {r3, lr}
	bx lr
	.align 2, 0
_03802D64: .4byte 0x0380FFFC
_03802D68: .4byte FUN_03802DB4
_03802D6C: .4byte 0x03809438
	arm_func_end FUN_03802D10

	arm_func_start FUN_03802D70
FUN_03802D70: @ 0x03802D70
	push {r3, lr}
	ldr r1, _03802DA8 @ =0x0380FFFC
	ldr r0, _03802DAC @ =FUN_03802DB4
	ldr r1, [r1]
	cmp r1, r0
	bne _03802DA0
	bl FUN_037FAD24
	ldr r1, _03802DB0 @ =0x03809438
	ldr r2, _03802DA8 @ =0x0380FFFC
	ldr r1, [r1, #0xc]
	str r1, [r2]
	bl FUN_037FAD38
_03802DA0:
	pop {r3, lr}
	bx lr
	.align 2, 0
_03802DA8: .4byte 0x0380FFFC
_03802DAC: .4byte FUN_03802DB4
_03802DB0: .4byte 0x03809438
	arm_func_end FUN_03802D70

	arm_func_start FUN_03802DB4
FUN_03802DB4: @ 0x03802DB4
	mov ip, #0x4000000
	add r1, ip, #0x208
	ldrh r0, [r1]
	tst r0, r0
	bxeq lr
	ldr r3, [ip, #0x210]
	ldr r1, [ip, #0x214]
	ands r2, r1, r3
	bxeq lr
	ldr r0, _03802F20 @ =0x01DF3FFF
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
	ldr r1, _03802F24 @ =0x03806C40
	ldrh r0, [r1, #2]
	add r0, r0, #1
	strh r0, [r1, #2]
	ldr r1, _03802F28 @ =0x03809438
	cmp r0, #1
	moveq r0, sp
	ldreq sp, [r1, #4]
	streq r0, [r1, #4]
	stmdb sp!, {r3}
	ldr r1, _03802F2C @ =0x038067A4
	ldr r0, [r1]
	tst r0, r2
	strne r0, [ip, #0x214]
	ldrne r0, [r1, #4]
	ldrne r3, _03802F30 @ =0x03806A88
	ldrne r0, [r3, r0, lsl #2]
	bne _03802E90
	mov r3, #1
_03802E50:
	ldr r0, [r1, r3, lsl #3]
	tst r0, r2
	addeq r3, r3, #1
	beq _03802E50
	str r0, [ip, #0x214]
	add r0, r1, r3, lsl #3
	ldr r2, [r0, #4]
	ldr r3, _03802F30 @ =0x03806A88
	ldr r0, [r3, r2, lsl #2]
	ldr r2, _03802F24 @ =0x03806C40
	ldrh r3, [r2, #2]
	cmp r3, #1
	ldreq r2, [r1]
	streq r2, [ip, #0x210]
	moveq r2, #0x1f
	msreq cpsr_c, r2
_03802E90:
	ldr r1, [ip, #0x210]
	stmdb sp!, {r1}
	add lr, pc, #0x0 @ =FUN_03802EA0
	bx r0
	arm_func_end FUN_03802DB4

	arm_func_start FUN_03802EA0
FUN_03802EA0: @ 0x03802EA0
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
	ldr r2, _03802F24 @ =0x03806C40
	ldr r3, _03802F28 @ =0x03809438
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
	ldreq r0, _03802F34 @ =FUN_037F8538
	add lr, pc, #0x0 @ =0x03802F1C
	bxeq r0
	ldm sp!, {pc}
	.align 2, 0
_03802F20: .4byte 0x01DF3FFF
_03802F24: .4byte 0x03806C40
_03802F28: .4byte 0x03809438
_03802F2C: .4byte 0x038067A4
_03802F30: .4byte 0x03806A88
	arm_func_end FUN_03802EA0
_03802F34: .4byte FUN_037F8538

	arm_func_start FUN_03802F38
FUN_03802F38: @ 0x03802F38
	push {r3, lr}
	ldr r1, _03802F68 @ =0x0380944C
	mov r3, #0
	ldr r2, _03802F6C @ =0x05000001
	add r0, sp, #0
	str r3, [sp]
	bl FUN_03802F74
	bl FUN_037F8C20
	ldr r1, _03802F70 @ =0x03809448
	strh r0, [r1, #6]
	pop {r3, lr}
	bx lr
	.align 2, 0
_03802F68: .4byte 0x0380944C
_03802F6C: .4byte 0x05000001
_03802F70: .4byte 0x03809448
	arm_func_end FUN_03802F38

	arm_func_start FUN_03802F74
FUN_03802F74: @ 0x03802F74
	ldr ip, _03802F7C @ =FUN_038008E8
	bx ip
	.align 2, 0
_03802F7C: .4byte FUN_038008E8
	arm_func_end FUN_03802F74

	arm_func_start FUN_03802F80
FUN_03802F80: @ 0x03802F80
	push {r3, lr}
	ldr r2, _03802FC8 @ =0x027FFC30
	ldr r0, _03802FCC @ =0x0000FFFF
	ldrh r1, [r2]
	cmp r1, r0
	moveq r0, #0
	beq _03802FC0
	ldrb r0, [r2, #5]
	lsl r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bne _03802FB0
	bl FUN_03802FD0
_03802FB0:
	ldr r0, _03802FC8 @ =0x027FFC30
	ldrb r0, [r0, #5]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
_03802FC0:
	pop {r3, lr}
	bx lr
	.align 2, 0
_03802FC8: .4byte 0x027FFC30
_03802FCC: .4byte 0x0000FFFF
	arm_func_end FUN_03802F80

	arm_func_start FUN_03802FD0
FUN_03802FD0: @ 0x03802FD0
	push {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _038030E8 @ =0x027FFC30
	mov r4, #1
	ldrh r1, [r2]
	rsb r0, r4, #0x10000
	cmp r1, r0
	moveq r0, #0
	beq _038030DC
	ldrb r0, [r2, #5]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	moveq r0, #0
	beq _038030DC
	ldr r0, _038030EC @ =0x03809448
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl FUN_03803170
	cmp r0, #0
	bne _03803034
	ldr r0, [sp, #0xc]
	bl FUN_037FAD38
	mov r0, r4
	b _038030DC
_03803034:
	add r0, sp, #0
	bl FUN_038030F4
	mov r0, #0x8000000
	ldrb r2, [r0, #0xb2]
	cmp r2, #0x96
	bne _03803060
	ldr r1, _038030E8 @ =0x027FFC30
	ldrh r0, [r0, #0xbe]
	ldrh r1, [r1]
	cmp r1, r0
	bne _038030A4
_03803060:
	cmp r2, #0x96
	ldrne r1, _038030E8 @ =0x027FFC30
	ldrne r0, _038030F0 @ =0x0801FFFE
	ldrhne r1, [r1]
	ldrhne r0, [r0]
	cmpne r1, r0
	bne _038030A4
	ldr r2, _038030E8 @ =0x027FFC30
	mov r0, #0x8000000
	ldr r1, [r2, #8]
	ldr r0, [r0, #0xac]
	cmp r1, r0
	beq _038030B8
	ldrb r0, [r2, #5]
	lsl r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _038030B8
_038030A4:
	ldr r1, _038030E8 @ =0x027FFC30
	mov r4, #0
	ldrb r0, [r1, #5]
	orr r0, r0, #2
	strb r0, [r1, #5]
_038030B8:
	ldr r0, [sp]
	bl FUN_03803138
	ldr r0, [sp, #4]
	bl FUN_03803154
	ldr r0, _038030EC @ =0x03809448
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl FUN_038031C0
	mov r0, r4
_038030DC:
	add sp, sp, #0x10
	pop {r4, lr}
	bx lr
	.align 2, 0
_038030E8: .4byte 0x027FFC30
_038030EC: .4byte 0x03809448
_038030F0: .4byte 0x0801FFFE
	arm_func_end FUN_03802FD0

	arm_func_start FUN_038030F4
FUN_038030F4: @ 0x038030F4
	push {r3, lr}
	ldr r2, _03803134 @ =0x04000204
	ldrh r1, [r2]
	and r1, r1, #0xc
	asr r1, r1, #2
	str r1, [r0]
	ldrh r1, [r2]
	and r1, r1, #0x10
	asr r1, r1, #4
	str r1, [r0, #4]
	mov r0, #3
	bl FUN_03803138
	mov r0, #0
	bl FUN_03803154
	pop {r3, lr}
	bx lr
	.align 2, 0
_03803134: .4byte 0x04000204
	arm_func_end FUN_038030F4

	arm_func_start FUN_03803138
FUN_03803138: @ 0x03803138
	ldr r2, _03803150 @ =0x04000204
	ldrh r1, [r2]
	bic r1, r1, #0xc
	orr r0, r1, r0, lsl #2
	strh r0, [r2]
	bx lr
	.align 2, 0
_03803150: .4byte 0x04000204
	arm_func_end FUN_03803138

	arm_func_start FUN_03803154
FUN_03803154: @ 0x03803154
	ldr r2, _0380316C @ =0x04000204
	ldrh r1, [r2]
	bic r1, r1, #0x10
	orr r0, r1, r0, lsl #4
	strh r0, [r2]
	bx lr
	.align 2, 0
_0380316C: .4byte 0x04000204
	arm_func_end FUN_03803154

	arm_func_start FUN_03803170
FUN_03803170: @ 0x03803170
	push {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	bl FUN_037FAD24
	str r0, [r4, #4]
	ldr r0, _038031BC @ =0x027FFFE8
	bl FUN_037F8C18
	ands r0, r0, #0x80
	str r0, [r4]
	bne _038031A8
	mov r0, r5
	bl FUN_037F8BA8
	cmp r0, #0
	bne _038031B0
_038031A8:
	mov r0, #1
	b _038031B4
_038031B0:
	mov r0, #0
_038031B4:
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038031BC: .4byte 0x027FFFE8
	arm_func_end FUN_03803170

	arm_func_start FUN_038031C0
FUN_038031C0: @ 0x038031C0
	push {r4, lr}
	mov r4, r1
	ldr r1, [r4]
	cmp r1, #0
	bne _038031D8
	bl FUN_037F8B9C
_038031D8:
	ldr r0, [r4, #4]
	bl FUN_037FAD38
	pop {r4, lr}
	bx lr
	arm_func_end FUN_038031C0

	arm_func_start FUN_038031E8
FUN_038031E8: @ 0x038031E8
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, #1
	mov r5, #0xd
	mov r4, #0
	b _03803208
_03803200:
	mov r0, r6
	bl FUN_037F8A30
_03803208:
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	bne _03803200
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_038031E8

	arm_func_start FUN_03803228
FUN_03803228: @ 0x03803228
	push {r3, lr}
	bl FUN_037FA14C
	bl FUN_037FA370
	ldr r0, _038032B0 @ =0x03809480
	bl FUN_037FA3C4
	ldr r0, _038032B4 @ =0x03809450
	ldr r1, [r0, #0x14]
	cmp r1, #0
	bne _038032A8
	mov r1, #1
	str r1, [r0, #0x14]
	bl FUN_03802F38
	bl FUN_037F8C20
	mvn r1, #2
	cmp r0, r1
	beq _038032A8
	ldr r1, _038032B4 @ =0x03809450
	strh r0, [r1]
	bl FUN_037FB248
	ldr r1, _038032B8 @ =FUN_0380343C
	mov r0, #0xd
	bl FUN_037FB330
	bl FUN_038032C8
	ldr r1, _038032BC @ =FUN_0380346C
	mov r0, #0xd
	bl FUN_037FB330
	ldr r1, _038032C0 @ =FUN_038034A0
	mov r0, #0x10
	bl FUN_037FB330
	ldr r1, _038032C4 @ =FUN_038037E4
	mov r0, #0x11
	bl FUN_037FB330
_038032A8:
	pop {r3, lr}
	bx lr
	.align 2, 0
_038032B0: .4byte 0x03809480
_038032B4: .4byte 0x03809450
_038032B8: .4byte FUN_0380343C
_038032BC: .4byte FUN_0380346C
_038032C0: .4byte FUN_038034A0
_038032C4: .4byte FUN_038037E4
	arm_func_end FUN_03803228

	arm_func_start FUN_038032C8
FUN_038032C8: @ 0x038032C8
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _03803424 @ =0x03809450
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _0380341C
	ldr r1, _03803428 @ =0x04000300
	mov r2, #1
	ldrh r1, [r1]
	str r2, [r0, #8]
	tst r1, #1
	beq _0380341C
	mov r0, #0x40000
	bl FUN_037F88C8
	ldr r2, _0380342C @ =0x04000208
	mov r1, #1
	ldrh sb, [r2]
	ldr r5, _03803424 @ =0x03809450
	mov r4, r0
	strh r1, [r2]
	mov r6, #0x100
	b _03803324
_0380331C:
	mov r0, r6
	bl FUN_037F8A30
_03803324:
	ldr r0, [r5, #0x28]
	cmp r0, #1
	bne _0380331C
	ldr r0, _03803424 @ =0x03809450
	mov r1, #0x8000000
	ldr r2, [r0, #0x18]
	ldr r0, _03803430 @ =0x01FFFFC0
	add r8, r1, #4
	and r0, r2, r0
	lsr r0, r0, #6
	lsl r0, r0, #5
	add r5, r0, #0x2000000
	mov r6, #1
	bl FUN_037F8C20
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	mov r0, r7
	bl FUN_037F8B2C
	ldr ip, _03803434 @ =0x0000FFFF
	mov sl, #0
	eor r0, ip, #3
	eor r1, ip, #0x84
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r2, r0, #0x10
	lsr r3, r1, #0x10
	b _038033CC
_03803390:
	mov lr, ip
	cmp sl, #0x4c
	moveq lr, r3
	beq _038033A8
	cmp sl, #0x4d
	moveq lr, r2
_038033A8:
	add r0, r5, sl, lsl #1
	lsl r1, sl, #1
	ldrh r0, [r0, #4]
	ldrh r1, [r8, r1]
	and r0, lr, r0
	cmp r0, r1
	movne r6, #0
	bne _038033D4
	add sl, sl, #1
_038033CC:
	cmp sl, #0x4e
	blt _03803390
_038033D4:
	mov r0, r7
	bl FUN_037F8B9C
	mov r0, r7
	bl FUN_037F8CB8
	ldr r2, _03803438 @ =0x027FFC30
	and r0, r6, #0xff
	ldrb r1, [r2, #5]
	and r0, r0, #1
	bic r1, r1, #1
	orr r1, r1, r0
	mov r0, #1
	strb r1, [r2, #5]
	bl FUN_038031E8
	ldr r2, _0380342C @ =0x04000208
	mov r0, r4
	ldrh r1, [r2]
	strh sb, [r2]
	bl FUN_037F88C8
_0380341C:
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_03803424: .4byte 0x03809450
_03803428: .4byte 0x04000300
_0380342C: .4byte 0x04000208
_03803430: .4byte 0x01FFFFC0
_03803434: .4byte 0x0000FFFF
_03803438: .4byte 0x027FFC30
	arm_func_end FUN_038032C8

	arm_func_start FUN_0380343C
FUN_0380343C: @ 0x0380343C
	push {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	ldreq r0, _03803468 @ =0x03809450
	moveq r2, #1
	streq r1, [r0, #0x18]
	streq r2, [r0, #0x28]
	beq _03803460
	bl FUN_037FAE94
_03803460:
	pop {r3, lr}
	bx lr
	.align 2, 0
_03803468: .4byte 0x03809450
	arm_func_end FUN_0380343C

	arm_func_start FUN_0380346C
FUN_0380346C: @ 0x0380346C
	push {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #2
	bne _03803494
	mov r0, #0
	bl FUN_038034B0
	bl FUN_037FB69C
	bl FUN_03805A3C
	bl FUN_037FAE94
	b _03803498
_03803494:
	bl FUN_037FAE94
_03803498:
	pop {r3, lr}
	bx lr
	arm_func_end FUN_0380346C

	arm_func_start FUN_038034A0
FUN_038034A0: @ 0x038034A0
	ldr ip, _038034AC @ =FUN_038034B0
	mov r0, r1
	bx ip
	.align 2, 0
_038034AC: .4byte FUN_038034B0
	arm_func_end FUN_038034A0

	arm_func_start FUN_038034B0
FUN_038034B0: @ 0x038034B0
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r5, r0
	beq _038034EC
	ldr r0, [r5]
	cmp r0, #0
	bne _038034EC
	ldr r0, [r5, #0x44]
	add r0, r0, #1
	str r0, [r5, #0x44]
	ldr r1, [r5, #0x40]
	cmp r1, #0
	beq _038034EC
	ldr r0, [r5, #0x44]
	cmp r0, r1
	movhi r5, #0
_038034EC:
	cmp r5, #0
	ldrne r0, [r5, #0x3c]
	cmpne r0, #0
	bne _03803590
	bl FUN_037FAD24
	ldr r4, _038036CC @ =0x03809450
	mov sb, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _0380357C
	mov sl, #0
	ldr r7, _038036D0 @ =0x027FFFE8
	ldr r5, _038036D4 @ =0x08001000
	mov r6, sl
	mov fp, #1
	b _03803574
_0380352C:
	mov r0, r7
	bl FUN_037F8C18
	ands r8, r0, #0x80
	bne _0380354C
	ldrh r0, [r4]
	bl FUN_037F8BA8
	cmp r0, #0
	bne _0380356C
_0380354C:
	str r6, [r4, #4]
	mov sl, fp
	strh r6, [r5]
	cmp r8, #0
	bne _03803574
	ldrh r0, [r4]
	bl FUN_037F8B7C
	b _03803574
_0380356C:
	ldr r0, _038036D8 @ =0x000080E8
	bl FUN_037FAD88
_03803574:
	cmp sl, #0
	beq _0380352C
_0380357C:
	ldr r0, _038036DC @ =0x03809480
	bl FUN_037FA5E4
	mov r0, sb
	bl FUN_037FAD38
	b _038036C4
_03803590:
	cmp r5, #0
	beq _038036C4
	ldr r0, _038036D0 @ =0x027FFFE8
	bl FUN_037F8C18
	ands r4, r0, #0x80
	bne _038035BC
	ldr r0, _038036CC @ =0x03809450
	ldrh r0, [r0]
	bl FUN_037F8BA8
	cmp r0, #0
	bne _038036AC
_038035BC:
	ldr r1, [r5]
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _03803604
	ldr r0, _038036CC @ =0x03809450
	mov r2, #0
	ldr r1, _038036D4 @ =0x08001000
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5, #8]
	ldr r0, _038036DC @ =0x03809480
	ldr r3, _038036E0 @ =FUN_038034B0
	mov r2, #0
	bl FUN_037FA500
	mov r0, #0
	str r0, [r5]
	b _03803694
_03803604:
	tst r1, #1
	ldr r1, _038036D4 @ =0x08001000
	beq _03803654
	ldr r0, _038036CC @ =0x03809450
	mov r2, #0
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5]
	ldr r0, _038036DC @ =0x03809480
	lsr r1, r1, #1
	add r1, r5, r1, lsl #2
	ldr r1, [r1, #0x24]
	ldr r3, _038036E0 @ =FUN_038034B0
	mov r2, #0
	bl FUN_037FA500
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _03803694
_03803654:
	ldr r0, _038036CC @ =0x03809450
	mov r2, #2
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5]
	ldr r0, _038036DC @ =0x03809480
	lsr r1, r1, #1
	add r1, r5, r1, lsl #2
	ldr r1, [r1, #0xc]
	ldr r3, _038036E0 @ =FUN_038034B0
	mov r2, #0
	bl FUN_037FA500
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_03803694:
	cmp r4, #0
	bne _038036C4
	ldr r0, _038036CC @ =0x03809450
	ldrh r0, [r0]
	bl FUN_037F8B7C
	b _038036C4
_038036AC:
	ldr r0, _038036DC @ =0x03809480
	ldr r1, _038036E4 @ =0x0000020B
	ldr r3, _038036E0 @ =FUN_038034B0
	mov r2, #0
	str r5, [sp]
	bl FUN_037FA500
_038036C4:
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_038036CC: .4byte 0x03809450
_038036D0: .4byte 0x027FFFE8
_038036D4: .4byte 0x08001000
_038036D8: .4byte 0x000080E8
_038036DC: .4byte 0x03809480
_038036E0: .4byte FUN_038034B0
_038036E4: .4byte 0x0000020B
	arm_func_end FUN_038034B0

	arm_func_start FUN_038036E8
FUN_038036E8: @ 0x038036E8
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _038037D8 @ =0x03806B9C
	mvn r0, #0
	ldr r3, [r1, #4]
	cmp r3, r0
	ldreq r0, _038037DC @ =0x027FFC3C
	ldreq r0, [r0]
	addeq r0, r0, #0xa
	streq r0, [r1, #4]
	beq _038037D0
	ldr r0, _038037E0 @ =0x03809450
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	bne _038037D0
	ldr r2, _038037DC @ =0x027FFC3C
	ldr r0, [r2]
	cmp r0, r3
	blo _038037D0
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1, #4]
	bl FUN_03802F80
	ldr r1, _038037E0 @ =0x03809450
	str r0, [r1, #0xc]
	bl FUN_03802FD0
	cmp r0, #0
	bne _03803780
	ldr r0, _038037D8 @ =0x03806B9C
	mov r1, #1
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, _038037E0 @ =0x03809450
	strne r1, [r0, #0x10]
	bne _038037D0
	ldr r0, _038037E0 @ =0x03809450
	str r1, [r0, #0xc]
_03803780:
	ldr r0, _038037E0 @ =0x03809450
	ldr r1, _038037D8 @ =0x03806B9C
	ldr r0, [r0, #0xc]
	mov r2, #0
	str r2, [r1]
	cmp r0, #0
	beq _038037D0
	mov r7, #0x64
	mov r6, #0xd
	mov r5, #0x11
	mov r4, r2
	b _038037B8
_038037B0:
	mov r0, r7
	bl FUN_037F94B0
_038037B8:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	bne _038037B0
_038037D0:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_038037D8: .4byte 0x03806B9C
_038037DC: .4byte 0x027FFC3C
_038037E0: .4byte 0x03809450
	arm_func_end FUN_038036E8

	arm_func_start FUN_038037E4
FUN_038037E4: @ 0x038037E4
	push {r3, r4, r5, r6, r7, lr}
	and r0, r1, #0x3f
	cmp r0, #3
	bne _0380384C
	ldr r3, _03803858 @ =0x04000204
	ldr r0, _0380385C @ =0x01FFFFC0
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
	b _03803830
_03803828:
	mov r0, r7
	bl FUN_037F8A30
_03803830:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	bne _03803828
	b _03803850
_0380384C:
	bl FUN_037FAE94
_03803850:
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03803858: .4byte 0x04000204
_0380385C: .4byte 0x01FFFFC0
	arm_func_end FUN_038037E4

	arm_func_start FUN_03803860
FUN_03803860: @ 0x03803860
	ldr r0, _03803884 @ =0x038094AC
	mov r3, #0
	mov r2, r3
_0380386C:
	lsl r1, r3, #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _0380386C
	bx lr
	.align 2, 0
_03803884: .4byte 0x038094AC
	arm_func_end FUN_03803860

	arm_func_start FUN_03803888
FUN_03803888: @ 0x03803888
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	tst r0, #0x2000000
	beq _038038B8
	ldr r2, _03803A28 @ =0x038094AC
	mov r5, #0
	mov lr, r5
_038038A4:
	lsl r4, r5, #1
	add r5, r5, #1
	strh lr, [r2, r4]
	cmp r5, #0x10
	blt _038038A4
_038038B8:
	ldr r2, _03803A28 @ =0x038094AC
	and r4, r0, #0xf0000
	lsr r4, r4, #0x10
	lsl r4, r4, #1
	strh r0, [r2, r4]
	tst r0, #0x1000000
	beq _03803A1C
	ldr lr, _03803A2C @ =0x038094AC
	ldrh r0, [lr]
	and r2, r0, #0xff00
	lsl r2, r2, #8
	lsr r4, r2, #0x10
	sub r2, r4, #0x22
	cmp r2, #0xa
	addls pc, pc, r2, lsl #2
	b _038039F0
_038038F8: @ jump table
	b _03803924 @ case 0
	b _0380395C @ case 1
	b _0380395C @ case 2
	b _038039A4 @ case 3
	b _038039A4 @ case 4
	b _038039E4 @ case 5
	b _038039E4 @ case 6
	b _038039F0 @ case 7
	b _038039F0 @ case 8
	b _038039F0 @ case 9
	b _03803924 @ case 10
_03803924:
	ldrh ip, [lr, #4]
	ldrh r2, [lr, #2]
	lsl r0, r0, #0x18
	and ip, ip, #0xff00
	orr r0, r0, r2, lsl #8
	orr ip, r0, ip, lsr #8
	cmp ip, #0x2000000
	blo _0380394C
	cmp ip, #0x2800000
	blo _038039F0
_0380394C:
	mov r0, r4
	mov r1, #2
	bl FUN_03800AFC
	b _03803A1C
_0380395C:
	ldrh r2, [lr, #8]
	ldrh r1, [lr, #0xa]
	orr ip, r1, r2, lsl #16
	cmp ip, #0x2000000
	blo _03803978
	cmp ip, #0x2800000
	blo _03803988
_03803978:
	mov r0, r4
	mov r1, #2
	bl FUN_03800AFC
	b _03803A1C
_03803988:
	ldrh r2, [lr, #2]
	lsl r3, r0, #0x18
	ldrh r1, [lr, #4]
	ldrh r0, [lr, #6]
	orr r3, r2, r3, lsr #8
	orr r1, r0, r1, lsl #16
	b _038039F0
_038039A4:
	ldrh r2, [lr, #6]
	ldrh r1, [lr, #8]
	orr ip, r1, r2, lsl #16
	cmp ip, #0x2000000
	blo _038039C0
	cmp ip, #0x2800000
	blo _038039D0
_038039C0:
	mov r0, r4
	mov r1, #2
	bl FUN_03800AFC
	b _03803A1C
_038039D0:
	ldrh r2, [lr, #2]
	lsl r0, r0, #0x18
	ldrh r1, [lr, #4]
	orr r3, r2, r0, lsr #8
	b _038039F0
_038039E4:
	ldrh r2, [lr, #2]
	lsl r0, r0, #0x18
	orr r3, r2, r0, lsr #8
_038039F0:
	str r1, [sp]
	mov r1, r4
	mov r0, #1
	mov r2, #3
	str ip, [sp, #4]
	bl FUN_03800C30
	cmp r0, #0
	bne _03803A1C
	mov r0, r4
	mov r1, #4
	bl FUN_03800AFC
_03803A1C:
	add sp, sp, #8
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03803A28: .4byte 0x038094AC
_03803A2C: .4byte 0x038094AC
	arm_func_end FUN_03803888

	arm_func_start FUN_03803A30
FUN_03803A30: @ 0x03803A30
	push {r3, r4, r5, lr}
	mov r4, r0
	bl FUN_037FAD24
	mov r5, r0
	mov r0, #1
	bl FUN_03800BC0
	cmp r0, #0
	bne _03803A70
	mov r0, r5
	bl FUN_037FAD38
	ldr r0, [r4, #4]
	mov r1, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	b _03803CFC
_03803A70:
	mov r0, #1
	bl FUN_03800BDC
	mov r0, r5
	bl FUN_037FAD38
	ldr r0, [r4, #4]
	sub r0, r0, #0x20
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _03803CC0
_03803A94: @ jump table
	b _03803ACC @ case 0
	b _03803AD4 @ case 1
	b _03803ADC @ case 2
	b _03803AE8 @ case 3
	b _03803B28 @ case 4
	b _03803B68 @ case 5
	b _03803BB0 @ case 6
	b _03803BF8 @ case 7
	b _03803C30 @ case 8
	b _03803C68 @ case 9
	b _03803C70 @ case 10
	b _03803C78 @ case 11
	b _03803CAC @ case 12
	b _03803CB8 @ case 13
_03803ACC:
	bl FUN_03803D58
	b _03803CE0
_03803AD4:
	bl FUN_03803DBC
	b _03803CE0
_03803ADC:
	ldr r0, [r4, #0x10]
	bl FUN_03803DFC
	b _03803CE0
_03803AE8:
	bl FUN_03803D04
	cmp r0, #0
	bne _03803B14
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	mov r0, #1
	bl FUN_03800BF4
	b _03803CFC
_03803B14:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	bl FUN_03803E6C
	b _03803CE0
_03803B28:
	bl FUN_03803D04
	cmp r0, #0
	bne _03803B54
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	mov r0, #1
	bl FUN_03800BF4
	b _03803CFC
_03803B54:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	bl FUN_03803F94
	b _03803CE0
_03803B68:
	bl FUN_03803D28
	cmp r0, #0
	bne _03803B94
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	mov r0, #1
	bl FUN_03800BF4
	b _03803CFC
_03803B94:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	lsl r1, r1, #0x10
	ldr r2, [r4, #0x10]
	lsr r1, r1, #0x10
	bl FUN_038040B4
	b _03803CE0
_03803BB0:
	bl FUN_03803D28
	cmp r0, #0
	bne _03803BDC
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	mov r0, #1
	bl FUN_03800BF4
	b _03803CFC
_03803BDC:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	lsl r1, r1, #0x10
	ldr r2, [r4, #0x10]
	lsr r1, r1, #0x10
	bl FUN_038041C0
	b _03803CE0
_03803BF8:
	bl FUN_03803D28
	cmp r0, #0
	bne _03803C24
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	mov r0, #1
	bl FUN_03800BF4
	b _03803CFC
_03803C24:
	ldr r0, [r4, #8]
	bl FUN_038042CC
	b _03803CE0
_03803C30:
	bl FUN_03803D28
	cmp r0, #0
	bne _03803C5C
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	mov r0, #1
	bl FUN_03800BF4
	b _03803CFC
_03803C5C:
	ldr r0, [r4, #8]
	bl FUN_03804354
	b _03803CE0
_03803C68:
	bl FUN_038043DC
	b _03803CE0
_03803C70:
	bl FUN_0380441C
	b _03803CE0
_03803C78:
	bl FUN_03803D28
	cmp r0, #0
	bne _03803CA4
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	mov r0, #1
	bl FUN_03800BF4
	b _03803CFC
_03803CA4:
	bl FUN_0380445C
	b _03803CE0
_03803CAC:
	ldr r0, [r4, #0x10]
	bl FUN_0380449C
	b _03803CE0
_03803CB8:
	bl FUN_03804538
	b _03803CE0
_03803CC0:
	mov r0, #1
	bl FUN_03800BF4
	ldr r0, [r4, #4]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	b _03803CFC
_03803CE0:
	ldr r0, [r4, #4]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl FUN_03800AFC
	mov r0, #1
	bl FUN_03800BF4
_03803CFC:
	pop {r3, r4, r5, lr}
	bx lr
	arm_func_end FUN_03803A30

	arm_func_start FUN_03803D04
FUN_03803D04: @ 0x03803D04
	push {r3, lr}
	add r0, sp, #0
	bl FUN_03803DFC
	ldrh r0, [sp]
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	pop {r3, lr}
	bx lr
	arm_func_end FUN_03803D04

	arm_func_start FUN_03803D28
FUN_03803D28: @ 0x03803D28
	push {r3, lr}
	add r0, sp, #0
	bl FUN_03803DFC
	ldrh r0, [sp]
	tst r0, #1
	movne r0, #0
	bne _03803D50
	tst r0, #2
	movne r0, #1
	moveq r0, #0
_03803D50:
	pop {r3, lr}
	bx lr
	arm_func_end FUN_03803D28

	arm_func_start FUN_03803D58
FUN_03803D58: @ 0x03803D58
	ldr r2, _03803D90 @ =0x040001C0
_03803D5C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803D5C
	ldr r0, _03803D94 @ =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #6
	strh r1, [r0]
	sub r1, r0, #2
_03803D80:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803D80
	bx lr
	.align 2, 0
_03803D90: .4byte 0x040001C0
_03803D94: .4byte 0x040001C2
	arm_func_end FUN_03803D58

	arm_func_start FUN_03803D98
FUN_03803D98: @ 0x03803D98
	ldr r1, _03803DB8 @ =0x040001C2
	and r0, r0, #0xff
	strh r0, [r1]
	sub r1, r1, #2
_03803DA8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803DA8
	bx lr
	.align 2, 0
_03803DB8: .4byte 0x040001C2
	arm_func_end FUN_03803D98

	arm_func_start FUN_03803DBC
FUN_03803DBC: @ 0x03803DBC
	ldr r2, _03803DF4 @ =0x040001C0
_03803DC0:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803DC0
	ldr r0, _03803DF8 @ =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #4
	strh r1, [r0]
	sub r1, r0, #2
_03803DE4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803DE4
	bx lr
	.align 2, 0
_03803DF4: .4byte 0x040001C0
_03803DF8: .4byte 0x040001C2
	arm_func_end FUN_03803DBC

	arm_func_start FUN_03803DFC
FUN_03803DFC: @ 0x03803DFC
	ldr r3, _03803E64 @ =0x040001C0
_03803E00:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _03803E00
	ldr r1, _03803E68 @ =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #5
	strh r2, [r1]
	sub r3, r1, #2
_03803E24:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _03803E24
	ldr r1, _03803E68 @ =0x040001C2
	mov r2, #0x8100
	strh r2, [r3]
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_03803E48:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03803E48
	ldr r1, _03803E68 @ =0x040001C2
	ldrh r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_03803E64: .4byte 0x040001C0
_03803E68: .4byte 0x040001C2
	arm_func_end FUN_03803DFC

	arm_func_start FUN_03803E6C
FUN_03803E6C: @ 0x03803E6C
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r2
	cmp r1, #1
	blo _03803F5C
	and r2, r0, #0xff00
	lsr r2, r2, #8
	and r3, r0, #0xff0000
	strh r2, [sp, #2]
	lsr r3, r3, #0x10
	and r0, r0, #0xff
	ldr r2, _03803F68 @ =0x040001C0
	strh r3, [sp]
	strh r0, [sp, #4]
_03803EA4:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803EA4
	ldr r4, _03803F6C @ =0x040001C2
	mov r0, #0x8900
	strh r0, [r2]
	mov r0, #3
	strh r0, [r4]
	mov ip, #0
	add r2, sp, #0
	sub r3, r4, #2
_03803ED0:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _03803ED0
	lsl r0, ip, #1
	ldrh r0, [r2, r0]
	add ip, ip, #1
	and r0, r0, #0xff
	strh r0, [r4]
	cmp ip, #3
	blt _03803ED0
	ldr r2, _03803F68 @ =0x040001C0
_03803EFC:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803EFC
	mov r4, #0
	ldr r2, _03803F68 @ =0x040001C0
	sub r0, r1, #1
	mov r3, r4
	b _03803F38
_03803F1C:
	strh r3, [r2, #2]
_03803F20:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03803F20
	ldrh r1, [r2, #2]
	strb r1, [r5, r4]
	add r4, r4, #1
_03803F38:
	cmp r4, r0
	blo _03803F1C
	ldr r0, _03803F68 @ =0x040001C0
	mov r1, #0x8100
	strh r1, [r0]
	bl FUN_03803F70
	ldr r0, _03803F6C @ =0x040001C2
	ldrh r0, [r0]
	strb r0, [r5, r4]
_03803F5C:
	add sp, sp, #8
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03803F68: .4byte 0x040001C0
_03803F6C: .4byte 0x040001C2
	arm_func_end FUN_03803E6C

	arm_func_start FUN_03803F70
FUN_03803F70: @ 0x03803F70
	ldr r0, _03803F90 @ =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03803F80:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803F80
	bx lr
	.align 2, 0
_03803F90: .4byte 0x040001C2
	arm_func_end FUN_03803F70

	arm_func_start FUN_03803F94
FUN_03803F94: @ 0x03803F94
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r2
	cmp r1, #1
	blo _038040A0
	and r2, r0, #0xff00
	lsr r2, r2, #8
	and r3, r0, #0xff0000
	strh r2, [sp, #2]
	lsr r3, r3, #0x10
	and r0, r0, #0xff
	ldr r2, _038040AC @ =0x040001C0
	strh r3, [sp]
	strh r0, [sp, #4]
_03803FCC:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803FCC
	ldr r4, _038040B0 @ =0x040001C2
	mov r0, #0x8900
	strh r0, [r2]
	mov r0, #0xb
	strh r0, [r4]
	mov ip, #0
	add r2, sp, #0
	sub r3, r4, #2
_03803FF8:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _03803FF8
	lsl r0, ip, #1
	ldrh r0, [r2, r0]
	add ip, ip, #1
	and r0, r0, #0xff
	strh r0, [r4]
	cmp ip, #3
	blt _03803FF8
	ldr r2, _038040AC @ =0x040001C0
_03804024:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03804024
	ldr r0, _038040B0 @ =0x040001C2
	mov r2, #0
	strh r2, [r0]
	sub r2, r0, #2
_03804040:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03804040
	mov r4, #0
	ldr r2, _038040AC @ =0x040001C0
	sub r0, r1, #1
	mov r3, r4
	b _0380407C
_03804060:
	strh r3, [r2, #2]
_03804064:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03804064
	ldrh r1, [r2, #2]
	strb r1, [r5, r4]
	add r4, r4, #1
_0380407C:
	cmp r4, r0
	blo _03804060
	ldr r0, _038040AC @ =0x040001C0
	mov r1, #0x8100
	strh r1, [r0]
	bl FUN_03803F70
	ldr r0, _038040B0 @ =0x040001C2
	ldrh r0, [r0]
	strb r0, [r5, r4]
_038040A0:
	add sp, sp, #8
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038040AC: .4byte 0x040001C0
_038040B0: .4byte 0x040001C2
	arm_func_end FUN_03803F94

	arm_func_start FUN_038040B4
FUN_038040B4: @ 0x038040B4
	push {r4, lr}
	sub sp, sp, #8
	cmp r1, #1
	blo _038041AC
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
	ldr r3, _038041B8 @ =0x040001C0
	strh ip, [sp]
	strh r0, [sp, #4]
	lsrhi r1, r1, #0x10
_03804108:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _03804108
	ldr lr, _038041BC @ =0x040001C2
	mov r0, #0x8900
	strh r0, [r3]
	mov r0, #0xa
	strh r0, [lr]
	mov r4, #0
	add r3, sp, #0
	sub ip, lr, #2
_03804134:
	ldrh r0, [ip]
	tst r0, #0x80
	bne _03804134
	lsl r0, r4, #1
	ldrh r0, [r3, r0]
	add r4, r4, #1
	and r0, r0, #0xff
	strh r0, [lr]
	cmp r4, #3
	blt _03804134
	sub r3, r1, #1
	ldr r1, _038041B8 @ =0x040001C0
	mov r4, #0
	b _03804184
_0380416C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0380416C
	ldrb r0, [r2, r4]
	add r4, r4, #1
	strh r0, [r1, #2]
_03804184:
	cmp r4, r3
	blt _0380416C
	ldr r1, _038041B8 @ =0x040001C0
_03804190:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804190
	mov r0, #0x8100
	strh r0, [r1]
	ldrb r0, [r2, r4]
	bl FUN_03803D98
_038041AC:
	add sp, sp, #8
	pop {r4, lr}
	bx lr
	.align 2, 0
_038041B8: .4byte 0x040001C0
_038041BC: .4byte 0x040001C2
	arm_func_end FUN_038040B4

	arm_func_start FUN_038041C0
FUN_038041C0: @ 0x038041C0
	push {r4, lr}
	sub sp, sp, #8
	cmp r1, #1
	blo _038042B8
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
	ldr r3, _038042C4 @ =0x040001C0
	strh ip, [sp]
	strh r0, [sp, #4]
	lsrhi r1, r1, #0x10
_03804214:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _03804214
	ldr lr, _038042C8 @ =0x040001C2
	mov r0, #0x8900
	strh r0, [r3]
	mov r0, #2
	strh r0, [lr]
	mov r4, #0
	add r3, sp, #0
	sub ip, lr, #2
_03804240:
	ldrh r0, [ip]
	tst r0, #0x80
	bne _03804240
	lsl r0, r4, #1
	ldrh r0, [r3, r0]
	add r4, r4, #1
	and r0, r0, #0xff
	strh r0, [lr]
	cmp r4, #3
	blt _03804240
	sub r3, r1, #1
	ldr r1, _038042C4 @ =0x040001C0
	mov r4, #0
	b _03804290
_03804278:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804278
	ldrb r0, [r2, r4]
	add r4, r4, #1
	strh r0, [r1, #2]
_03804290:
	cmp r4, r3
	blt _03804278
	ldr r1, _038042C4 @ =0x040001C0
_0380429C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0380429C
	mov r0, #0x8100
	strh r0, [r1]
	ldrb r0, [r2, r4]
	bl FUN_03803D98
_038042B8:
	add sp, sp, #8
	pop {r4, lr}
	bx lr
	.align 2, 0
_038042C4: .4byte 0x040001C0
_038042C8: .4byte 0x040001C2
	arm_func_end FUN_038041C0

	arm_func_start FUN_038042CC
FUN_038042CC: @ 0x038042CC
	push {r3, r4, r5, lr}
	and r1, r0, #0xff0000
	lsr r1, r1, #0x10
	and r2, r0, #0xff00
	lsl r2, r2, #8
	ldr r3, _0380434C @ =0x040001C0
	lsl r1, r1, #0x10
	and r5, r0, #0xff
	lsr r0, r1, #0x10
	lsr r4, r2, #0x10
_038042F4:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _038042F4
	ldr r1, _03804350 @ =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0xdb
	strh r2, [r1]
	sub r2, r1, #2
_03804318:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03804318
	bl FUN_03803D98
	mov r0, r4
	bl FUN_03803D98
	ldr r1, _0380434C @ =0x040001C0
	mov r2, #0x8100
	mov r0, r5
	strh r2, [r1]
	bl FUN_03803D98
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380434C: .4byte 0x040001C0
_03804350: .4byte 0x040001C2
	arm_func_end FUN_038042CC

	arm_func_start FUN_03804354
FUN_03804354: @ 0x03804354
	push {r3, r4, r5, lr}
	and r1, r0, #0xff0000
	lsr r1, r1, #0x10
	and r2, r0, #0xff00
	lsl r2, r2, #8
	ldr r3, _038043D4 @ =0x040001C0
	lsl r1, r1, #0x10
	and r5, r0, #0xff
	lsr r0, r1, #0x10
	lsr r4, r2, #0x10
_0380437C:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _0380437C
	ldr r1, _038043D8 @ =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0xd8
	strh r2, [r1]
	sub r2, r1, #2
_038043A0:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _038043A0
	bl FUN_03803D98
	mov r0, r4
	bl FUN_03803D98
	ldr r1, _038043D4 @ =0x040001C0
	mov r2, #0x8100
	mov r0, r5
	strh r2, [r1]
	bl FUN_03803D98
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038043D4: .4byte 0x040001C0
_038043D8: .4byte 0x040001C2
	arm_func_end FUN_03804354

	arm_func_start FUN_038043DC
FUN_038043DC: @ 0x038043DC
	ldr r2, _03804414 @ =0x040001C0
_038043E0:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _038043E0
	ldr r0, _03804418 @ =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xb9
	strh r1, [r0]
	sub r1, r0, #2
_03804404:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804404
	bx lr
	.align 2, 0
_03804414: .4byte 0x040001C0
_03804418: .4byte 0x040001C2
	arm_func_end FUN_038043DC

	arm_func_start FUN_0380441C
FUN_0380441C: @ 0x0380441C
	ldr r2, _03804454 @ =0x040001C0
_03804420:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03804420
	ldr r0, _03804458 @ =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xab
	strh r1, [r0]
	sub r1, r0, #2
_03804444:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804444
	bx lr
	.align 2, 0
_03804454: .4byte 0x040001C0
_03804458: .4byte 0x040001C2
	arm_func_end FUN_0380441C

	arm_func_start FUN_0380445C
FUN_0380445C: @ 0x0380445C
	ldr r2, _03804494 @ =0x040001C0
_03804460:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03804460
	ldr r0, _03804498 @ =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xc7
	strh r1, [r0]
	sub r1, r0, #2
_03804484:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804484
	bx lr
	.align 2, 0
_03804494: .4byte 0x040001C0
_03804498: .4byte 0x040001C2
	arm_func_end FUN_0380445C

	arm_func_start FUN_0380449C
FUN_0380449C: @ 0x0380449C
	push {r3, lr}
	ldr r3, _03804530 @ =0x040001C0
_038044A4:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _038044A4
	ldr r1, _03804534 @ =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0x9f
	strh r2, [r1]
	sub r2, r1, #2
_038044C8:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _038044C8
	ldr r1, _03804534 @ =0x040001C2
	mov r2, #0
	strh r2, [r1]
	sub lr, r1, #2
_038044E4:
	ldrh r1, [lr]
	tst r1, #0x80
	bne _038044E4
	ldr ip, _03804534 @ =0x040001C2
	mov r2, #0x8100
	ldrh r3, [ip]
	mov r1, #0
	strb r3, [r0]
	strh r2, [lr]
	strh r1, [ip]
	sub r2, ip, #2
_03804510:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03804510
	ldr r1, _03804534 @ =0x040001C2
	ldrh r1, [r1]
	strb r1, [r0, #1]
	pop {r3, lr}
	bx lr
	.align 2, 0
_03804530: .4byte 0x040001C0
_03804534: .4byte 0x040001C2
	arm_func_end FUN_0380449C

	arm_func_start FUN_03804538
FUN_03804538: @ 0x03804538
	ldr r2, _03804570 @ =0x040001C0
_0380453C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0380453C
	ldr r0, _03804574 @ =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xff
	strh r1, [r0]
	sub r1, r0, #2
_03804560:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804560
	bx lr
	.align 2, 0
_03804570: .4byte 0x040001C0
_03804574: .4byte 0x040001C2
	arm_func_end FUN_03804538

	arm_func_start FUN_03804578
FUN_03804578: @ 0x03804578
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	ldr r2, _038047B8 @ =0x038094CC
	mov r8, r0
	ldrh r0, [r2]
	cmp r0, #0
	bne _038047AC
	ldr r1, _038047BC @ =0x038094D0
	mov r3, #1
	add r0, sp, #8
	strh r3, [r2]
	str r3, [r1, #0x1d4]
	bl FUN_038053B0
	add r0, sp, #0xa
	bl FUN_03805414
	ldrh r0, [sp, #8]
	lsl r1, r0, #0x18
	lsrs r1, r1, #0x1f
	bne _038045E0
	lsl r0, r0, #0x19
	lsrs r0, r0, #0x1f
	bne _038045E0
	ldrh r0, [sp, #0xa]
	lsl r0, r0, #0x18
	lsrs r0, r0, #0x1f
	beq _038045F8
_038045E0:
	ldrh r1, [sp, #8]
	add r0, sp, #8
	bic r1, r1, #1
	orr r1, r1, #1
	strh r1, [sp, #8]
	bl FUN_038053DC
_038045F8:
	ldrh r0, [sp, #8]
	lsl r1, r0, #0x1b
	lsrs r1, r1, #0x1f
	bne _03804614
	lsl r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	beq _03804634
_03804614:
	ldrh r1, [sp, #0xa]
	add r0, sp, #0xa
	bic r1, r1, #0xf
	strh r1, [sp, #0xa]
	ldrh r1, [sp, #0xa]
	bic r1, r1, #0x40
	strh r1, [sp, #0xa]
	bl FUN_03805440
_03804634:
	ldr r0, _038047C0 @ =0x027FFDE8
	bl FUN_03805040
	ldr r0, _038047C0 @ =0x027FFDE8
	ldr r0, [r0]
	lsl r0, r0, #0xa
	lsr r0, r0, #0x1a
	bl FUN_03804E68
	ldr r1, _038047C0 @ =0x027FFDE8
	mov r5, r0
	ldr r0, [r1]
	lsl r0, r0, #0x13
	lsr r0, r0, #0x1b
	bl FUN_03804E68
	ldr r1, _038047C0 @ =0x027FFDE8
	mov r6, r0
	ldr r0, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl FUN_03804E68
	sub r1, r6, #1
	cmp r1, #1
	add r7, r0, #0x7d0
	subls r7, r7, #1
	mov r0, r7
	mov r1, #0x190
	addls r6, r6, #0xc
	bl FUN_03806468
	mov r4, r0
	mov r0, r7
	mov r1, #0x64
	bl FUN_03806468
	mov r1, #0xd
	mul r1, r6, r1
	mov r6, r0
	add r0, r1, #8
	mov r1, #5
	bl FUN_03806468
	add r1, r7, r7, lsr #2
	sub r1, r1, r6
	add r1, r4, r1
	add r0, r1, r0
	add r0, r5, r0
	mov r1, #7
	bl FUN_03806468
	ldr r0, _038047C0 @ =0x027FFDE8
	ldr r2, [r0]
	lsl r3, r2, #5
	lsr r3, r3, #0x1d
	cmp r3, r1
	beq _03804710
	bic r2, r2, #0x7000000
	lsl r1, r1, #0x1d
	orr r1, r2, r1, lsr #5
	str r1, [r0]
	bl FUN_0380506C
_03804710:
	mov r0, #1
	bl FUN_03804F1C
	ldr r0, _038047BC @ =0x038094D0
	mov r1, #0
	str r1, [r0, #0x1d4]
	bl FUN_037FB248
	ldr r1, _038047C4 @ =FUN_038047DC
	mov r0, #5
	bl FUN_037FB330
	ldr r0, _038047BC @ =0x038094D0
	ldr r1, _038047C8 @ =0x038094F0
	mov r2, #4
	bl FUN_037F96D0
	mov r0, #0x100
	stm sp, {r0, r8}
	ldr r0, _038047CC @ =0x03809500
	ldr r1, _038047D0 @ =FUN_03804958
	ldr r3, _038047D4 @ =0x038096A4
	mov r2, #0
	bl FUN_037F9054
	ldr r0, _038047CC @ =0x03809500
	bl FUN_037F93B4
	mov r0, #0x8000
	bl FUN_037FB53C
	mov r0, #0x40
	mov r1, #0
	bl FUN_037FB51C
	mov r0, #0x100
	mov r1, r0
	bl FUN_037FB51C
	bl FUN_037FAD24
	mov r4, r0
	ldr r1, _038047D8 @ =FUN_03804DD8
	mov r0, #0x80
	bl FUN_037F87E0
	mov r0, #0x80
	bl FUN_037F8914
	mov r0, r4
	bl FUN_037FAD38
_038047AC:
	add sp, sp, #0xc
	pop {r3, r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_038047B8: .4byte 0x038094CC
_038047BC: .4byte 0x038094D0
_038047C0: .4byte 0x027FFDE8
_038047C4: .4byte FUN_038047DC
_038047C8: .4byte 0x038094F0
_038047CC: .4byte 0x03809500
_038047D0: .4byte FUN_03804958
_038047D4: .4byte 0x038096A4
_038047D8: .4byte FUN_03804DD8
	arm_func_end FUN_03804578

	arm_func_start FUN_038047DC
FUN_038047DC: @ 0x038047DC
	push {r4, lr}
	cmp r2, #0
	bne _03804908
	and r0, r1, #0x7f00
	lsl r0, r0, #8
	lsr r4, r0, #0x10
	cmp r4, #0x29
	addls pc, pc, r4, lsl #2
	b _038048FC
_03804800: @ jump table
	b _038048A8 @ case 0
	b _038048A8 @ case 1
	b _038048FC @ case 2
	b _038048FC @ case 3
	b _038048FC @ case 4
	b _038048FC @ case 5
	b _038048FC @ case 6
	b _038048FC @ case 7
	b _038048FC @ case 8
	b _038048FC @ case 9
	b _038048FC @ case 10
	b _038048FC @ case 11
	b _038048FC @ case 12
	b _038048FC @ case 13
	b _038048FC @ case 14
	b _038048FC @ case 15
	b _038048A8 @ case 16
	b _038048A8 @ case 17
	b _038048A8 @ case 18
	b _038048A8 @ case 19
	b _038048A8 @ case 20
	b _038048A8 @ case 21
	b _038048A8 @ case 22
	b _038048A8 @ case 23
	b _038048A8 @ case 24
	b _038048A8 @ case 25
	b _038048FC @ case 26
	b _038048FC @ case 27
	b _038048FC @ case 28
	b _038048FC @ case 29
	b _038048FC @ case 30
	b _038048FC @ case 31
	b _038048FC @ case 32
	b _038048FC @ case 33
	b _038048FC @ case 34
	b _038048A8 @ case 35
	b _038048A8 @ case 36
	b _038048A8 @ case 37
	b _038048A8 @ case 38
	b _038048A8 @ case 39
	b _038048A8 @ case 40
	b _038048A8 @ case 41
_038048A8:
	ldr r0, _03804910 @ =0x038094D0
	ldr r1, [r0, #0x1d4]
	cmp r1, #0
	beq _038048C8
	mov r0, r4
	mov r1, #3
	bl FUN_03804918
	b _03804908
_038048C8:
	ldr r3, _03804914 @ =0x038095D0
	mov r1, #1
	str r1, [r0, #0x1d4]
	mov r1, #0
	mov r2, r1
	strh r4, [r3, #0xd8]
	bl FUN_037F96F8
	cmp r0, #0
	bne _03804908
	mov r0, r4
	mov r1, #4
	bl FUN_03804918
	b _03804908
_038048FC:
	mov r0, r4
	mov r1, #1
	bl FUN_03804918
_03804908:
	pop {r4, lr}
	bx lr
	.align 2, 0
_03804910: .4byte 0x038094D0
_03804914: .4byte 0x038095D0
	arm_func_end FUN_038047DC

	arm_func_start FUN_03804918
FUN_03804918: @ 0x03804918
	push {r4, r5, r6, lr}
	lsl r0, r0, #8
	and r0, r0, #0x7f00
	orr r2, r0, #0x8000
	and r0, r1, #0xff
	orr r6, r2, r0
	mov r5, #5
	mov r4, #0
_03804938:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	blt _03804938
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end FUN_03804918

	arm_func_start FUN_03804958
FUN_03804958: @ 0x03804958
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r8, _03804DCC @ =0x027FFDE8
	mov r7, #0
	ldr sb, _03804DD0 @ =0x038094D0
	mov r6, r7
	mov r5, r7
	mov r4, r7
	mov sl, r7
	mov fp, r7
_0380497C:
	mov r0, sb
	add r1, sp, #0
	mov r2, #1
	bl FUN_037F9784
	ldr r0, _03804DD4 @ =0x038095D0
	ldrh r0, [r0, #0xd8]
	cmp r0, #0x29
	addls pc, pc, r0, lsl #2
	b _03804DB8
_038049A0: @ jump table
	b _03804A48 @ case 0
	b _03804A60 @ case 1
	b _03804DB8 @ case 2
	b _03804DB8 @ case 3
	b _03804DB8 @ case 4
	b _03804DB8 @ case 5
	b _03804DB8 @ case 6
	b _03804DB8 @ case 7
	b _03804DB8 @ case 8
	b _03804DB8 @ case 9
	b _03804DB8 @ case 10
	b _03804DB8 @ case 11
	b _03804DB8 @ case 12
	b _03804DB8 @ case 13
	b _03804DB8 @ case 14
	b _03804DB8 @ case 15
	b _03804A88 @ case 16
	b _03804AA8 @ case 17
	b _03804AC8 @ case 18
	b _03804AE8 @ case 19
	b _03804B24 @ case 20
	b _03804B60 @ case 21
	b _03804B9C @ case 22
	b _03804BBC @ case 23
	b _03804BDC @ case 24
	b _03804BFC @ case 25
	b _03804DB8 @ case 26
	b _03804DB8 @ case 27
	b _03804DB8 @ case 28
	b _03804DB8 @ case 29
	b _03804DB8 @ case 30
	b _03804DB8 @ case 31
	b _03804C1C @ case 32
	b _03804C3C @ case 33
	b _03804C64 @ case 34
	b _03804C84 @ case 35
	b _03804CC0 @ case 36
	b _03804CFC @ case 37
	b _03804D38 @ case 38
	b _03804D58 @ case 39
	b _03804D78 @ case 40
	b _03804D98 @ case 41
_03804A48:
	bl FUN_03804ED8
	mov r0, #0
	mov r1, r0
	str r0, [sb, #0x1d4]
	bl FUN_03804918
	b _0380497C
_03804A60:
	ldrh r0, [r8]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bl FUN_03804F1C
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #1
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804A88:
	mov r0, r8
	bl FUN_03805040
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x10
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804AA8:
	mov r0, r8
	bl FUN_038050A4
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x11
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804AC8:
	add r0, r8, #4
	bl FUN_038050D0
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x12
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804AE8:
	add r0, r8, #4
	bl FUN_03805134
	cmp r0, #0
	bne _03804B0C
	mov r0, #0x13
	mov r1, #2
	str r7, [sb, #0x1d4]
	bl FUN_03804918
	b _0380497C
_03804B0C:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x13
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804B24:
	add r0, r8, #4
	bl FUN_03805210
	cmp r0, #0
	bne _03804B48
	mov r0, #0x14
	mov r1, #2
	str r6, [sb, #0x1d4]
	bl FUN_03804918
	b _0380497C
_03804B48:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x14
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804B60:
	add r0, r8, #4
	bl FUN_038052E4
	cmp r0, #0
	bne _03804B84
	mov r0, #0x15
	mov r1, #2
	str r5, [sb, #0x1d4]
	bl FUN_03804918
	b _0380497C
_03804B84:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x15
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804B9C:
	mov r0, r8
	bl FUN_038053B0
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x16
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804BBC:
	add r0, r8, #2
	bl FUN_03805414
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x17
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804BDC:
	add r0, r8, #4
	bl FUN_03805478
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x18
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804BFC:
	add r0, r8, #4
	bl FUN_038054DC
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x19
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804C1C:
	mov r0, r8
	bl FUN_0380506C
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x20
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804C3C:
	add r0, r8, #4
	bl FUN_038050D0
	mov r0, r8
	bl FUN_0380506C
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x21
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804C64:
	add r0, r8, #4
	bl FUN_038050FC
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x22
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804C84:
	add r0, r8, #4
	bl FUN_0380519C
	cmp r0, #0
	bne _03804CA8
	mov r0, #0x23
	mov r1, #2
	str r4, [sb, #0x1d4]
	bl FUN_03804918
	b _0380497C
_03804CA8:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x23
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804CC0:
	add r0, r8, #4
	bl FUN_03805274
	cmp r0, #0
	bne _03804CE4
	mov r0, #0x24
	mov r1, #2
	str sl, [sb, #0x1d4]
	bl FUN_03804918
	b _0380497C
_03804CE4:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x24
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804CFC:
	add r0, r8, #4
	bl FUN_03805344
	cmp r0, #0
	bne _03804D20
	mov r0, #0x25
	mov r1, #2
	str fp, [sb, #0x1d4]
	bl FUN_03804918
	b _0380497C
_03804D20:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x25
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804D38:
	mov r0, r8
	bl FUN_038053DC
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x26
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804D58:
	add r0, r8, #2
	bl FUN_03805440
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x27
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804D78:
	add r0, r8, #4
	bl FUN_038054A4
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x28
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804D98:
	add r0, r8, #4
	bl FUN_03805508
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x29
	mov r1, #0
	bl FUN_03804918
	b _0380497C
_03804DB8:
	mov r1, #0
	str r1, [sb, #0x1d4]
	mov r1, #1
	bl FUN_03804918
	b _0380497C
	.align 2, 0
_03804DCC: .4byte 0x027FFDE8
_03804DD0: .4byte 0x038094D0
_03804DD4: .4byte 0x038095D0
	arm_func_end FUN_03804958

	arm_func_start FUN_03804DD8
FUN_03804DD8: @ 0x03804DD8
	push {r3, r4, lr}
	sub sp, sp, #4
	add r0, sp, #2
	bl FUN_038053B0
	ldrh r0, [sp, #2]
	lsl r1, r0, #0x1b
	lsrs r1, r1, #0x1f
	bne _03804E04
	lsl r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	beq _03804E5C
_03804E04:
	add r0, sp, #0
	bl FUN_03805414
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
	bl FUN_03805440
	mov r1, r4
	mov r0, #0x30
	bl FUN_03804918
_03804E5C:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_03804DD8

	arm_func_start FUN_03804E68
FUN_03804E68: @ 0x03804E68
	push {r4, lr}
	mov ip, #0
	mov r2, ip
	b _03804E94
_03804E78:
	lsl r1, r2, #2
	lsr r1, r0, r1
	and r1, r1, #0xf
	cmp r1, #0xa
	movhs r0, #0
	bhs _03804ED0
	add r2, r2, #1
_03804E94:
	cmp r2, #8
	blt _03804E78
	mov r4, #0
	mov lr, #1
	mov r2, #0xa
_03804EA8:
	lsl r1, r4, #2
	lsr r1, r0, r1
	and r3, r1, #0xf
	mul r1, lr, r2
	mla ip, lr, r3, ip
	add r4, r4, #1
	mov lr, r1
	cmp r4, #8
	blt _03804EA8
	mov r0, ip
_03804ED0:
	pop {r4, lr}
	bx lr
	arm_func_end FUN_03804E68

	arm_func_start FUN_03804ED8
FUN_03804ED8: @ 0x03804ED8
	push {r3, lr}
	mov r0, #0x8000
	bl FUN_037FB53C
	ldrh r0, [sp]
	bic r0, r0, #1
	orr r0, r0, #1
	strh r0, [sp]
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0
	bl FUN_03805830
	add r0, sp, #0
	mov r1, #1
	bl FUN_038058A0
	bl FUN_038057FC
	pop {r3, lr}
	bx lr
	arm_func_end FUN_03804ED8

	arm_func_start FUN_03804F1C
FUN_03804F1C: @ 0x03804F1C
	push {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	and r4, r4, #1
	cmp r4, #1
	bne _03805034
	mov r0, #0x8000
	bl FUN_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0
	mov r3, #1
	bl FUN_03805760
	ldrh r0, [sp]
	lsl r1, r0, #0x1e
	lsr r1, r1, #0x1f
	cmp r1, r4
	beq _03805034
	bic r1, r0, #2
	lsl r0, r4, #0x1f
	orr r1, r1, r0, lsr #30
	mov r0, #0x8000
	strh r1, [sp]
	bl FUN_037FB53C
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0
	bl FUN_03805830
	add r0, sp, #0
	mov r1, #1
	bl FUN_038058A0
	bl FUN_038057FC
	mov r0, #0x86
	mov r1, #0x10
	add r2, sp, #4
	mov r3, #3
	bl FUN_03805760
	cmp r4, #0
	add r0, sp, #4
	bne _03804FC4
	bl FUN_03805540
	b _03804FC8
_03804FC4:
	bl FUN_03805650
_03804FC8:
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0x10
	bl FUN_03805830
	add r0, sp, #4
	mov r1, #3
	bl FUN_038058A0
	bl FUN_038057FC
	mov r0, #0x86
	mov r1, #0x50
	add r2, sp, #4
	mov r3, #3
	bl FUN_03805760
	cmp r4, #0
	add r0, sp, #4
	bne _03805010
	bl FUN_03805540
	b _03805014
_03805010:
	bl FUN_03805650
_03805014:
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0x50
	bl FUN_03805830
	add r0, sp, #4
	mov r1, #3
	bl FUN_038058A0
	bl FUN_038057FC
_03805034:
	add sp, sp, #8
	pop {r4, lr}
	bx lr
	arm_func_end FUN_03804F1C

	arm_func_start FUN_03805040
FUN_03805040: @ 0x03805040
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x20
	mov r3, #7
	bl FUN_03805760
	pop {r4, lr}
	bx lr
	arm_func_end FUN_03805040

	arm_func_start FUN_0380506C
FUN_0380506C: @ 0x0380506C
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0x20
	bl FUN_03805830
	mov r0, r4
	mov r1, #7
	bl FUN_038058A0
	bl FUN_038057FC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_0380506C

	arm_func_start FUN_038050A4
FUN_038050A4: @ 0x038050A4
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x20
	mov r3, #4
	bl FUN_03805760
	pop {r4, lr}
	bx lr
	arm_func_end FUN_038050A4

	arm_func_start FUN_038050D0
FUN_038050D0: @ 0x038050D0
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x60
	mov r3, #3
	bl FUN_03805760
	pop {r4, lr}
	bx lr
	arm_func_end FUN_038050D0

	arm_func_start FUN_038050FC
FUN_038050FC: @ 0x038050FC
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0x60
	bl FUN_03805830
	mov r0, r4
	mov r1, #3
	bl FUN_038058A0
	bl FUN_038057FC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_038050FC

	arm_func_start FUN_03805134
FUN_03805134: @ 0x03805134
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_03805760
	ldrh r0, [sp]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	and r0, r0, #0xb
	cmp r0, #1
	movne r0, #0
	bne _03805190
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x10
	mov r3, #1
	bl FUN_03805760
	mov r0, #1
_03805190:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_03805134

	arm_func_start FUN_0380519C
FUN_0380519C: @ 0x0380519C
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_03805760
	ldrh r0, [sp]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	and r0, r0, #0xb
	cmp r0, #1
	movne r0, #0
	bne _03805204
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0x10
	bl FUN_03805830
	mov r0, r4
	mov r1, #1
	bl FUN_038058A0
	bl FUN_038057FC
	mov r0, #1
_03805204:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_0380519C

	arm_func_start FUN_03805210
FUN_03805210: @ 0x03805210
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_03805760
	ldrh r0, [sp]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #4
	movne r0, #0
	bne _03805268
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x10
	mov r3, #3
	bl FUN_03805760
	mov r0, #1
_03805268:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_03805210

	arm_func_start FUN_03805274
FUN_03805274: @ 0x03805274
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_03805760
	ldrh r0, [sp]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #4
	movne r0, #0
	bne _038052D8
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0x10
	bl FUN_03805830
	mov r0, r4
	mov r1, #3
	bl FUN_038058A0
	bl FUN_038057FC
	mov r0, #1
_038052D8:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_03805274

	arm_func_start FUN_038052E4
FUN_038052E4: @ 0x038052E4
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_03805760
	ldrh r0, [sp]
	lsl r0, r0, #0x19
	lsrs r0, r0, #0x1f
	moveq r0, #0
	beq _03805338
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x50
	mov r3, #3
	bl FUN_03805760
	mov r0, #1
_03805338:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_038052E4

	arm_func_start FUN_03805344
FUN_03805344: @ 0x03805344
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_03805760
	ldrh r0, [sp]
	lsl r0, r0, #0x19
	lsrs r0, r0, #0x1f
	moveq r0, #0
	beq _038053A4
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0x50
	bl FUN_03805830
	mov r0, r4
	mov r1, #3
	bl FUN_038058A0
	bl FUN_038057FC
	mov r0, #1
_038053A4:
	add sp, sp, #4
	pop {r3, r4, lr}
	bx lr
	arm_func_end FUN_03805344

	arm_func_start FUN_038053B0
FUN_038053B0: @ 0x038053B0
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0
	mov r3, #1
	bl FUN_03805760
	pop {r4, lr}
	bx lr
	arm_func_end FUN_038053B0

	arm_func_start FUN_038053DC
FUN_038053DC: @ 0x038053DC
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0
	bl FUN_03805830
	mov r0, r4
	mov r1, #1
	bl FUN_038058A0
	bl FUN_038057FC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_038053DC

	arm_func_start FUN_03805414
FUN_03805414: @ 0x03805414
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl FUN_03805760
	pop {r4, lr}
	bx lr
	arm_func_end FUN_03805414

	arm_func_start FUN_03805440
FUN_03805440: @ 0x03805440
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0x40
	bl FUN_03805830
	mov r0, r4
	mov r1, #1
	bl FUN_038058A0
	bl FUN_038057FC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_03805440

	arm_func_start FUN_03805478
FUN_03805478: @ 0x03805478
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x30
	mov r3, #1
	bl FUN_03805760
	pop {r4, lr}
	bx lr
	arm_func_end FUN_03805478

	arm_func_start FUN_038054A4
FUN_038054A4: @ 0x038054A4
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0x30
	bl FUN_03805830
	mov r0, r4
	mov r1, #1
	bl FUN_038058A0
	bl FUN_038057FC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_038054A4

	arm_func_start FUN_038054DC
FUN_038054DC: @ 0x038054DC
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x70
	mov r3, #1
	bl FUN_03805760
	pop {r4, lr}
	bx lr
	arm_func_end FUN_038054DC

	arm_func_start FUN_03805508
FUN_03805508: @ 0x03805508
	push {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl FUN_037FB53C
	bl FUN_038057BC
	mov r0, #6
	mov r1, #0x70
	bl FUN_03805830
	mov r0, r4
	mov r1, #1
	bl FUN_038058A0
	bl FUN_038057FC
	pop {r4, lr}
	bx lr
	arm_func_end FUN_03805508

	arm_func_start FUN_03805540
FUN_03805540: @ 0x03805540
	ldr r1, [r0]
	lsl r2, r1, #0x12
	lsr r2, r2, #0x1a
	cmp r2, #0x23
	addls pc, pc, r2, lsl #2
	b _0380563C
_03805558: @ jump table
	b _038055E8 @ case 0
	b _038055E8 @ case 1
	b _038055E8 @ case 2
	b _038055E8 @ case 3
	b _038055E8 @ case 4
	b _038055E8 @ case 5
	b _038055E8 @ case 6
	b _038055E8 @ case 7
	b _038055E8 @ case 8
	b _038055E8 @ case 9
	b _0380563C @ case 10
	b _0380563C @ case 11
	b _0380563C @ case 12
	b _0380563C @ case 13
	b _0380563C @ case 14
	b _0380563C @ case 15
	b _038055E8 @ case 16
	b _038055E8 @ case 17
	b _038055F4 @ case 18
	b _038055F4 @ case 19
	b _038055F4 @ case 20
	b _038055F4 @ case 21
	b _038055F4 @ case 22
	b _038055F4 @ case 23
	b _038055F4 @ case 24
	b _038055F4 @ case 25
	b _0380563C @ case 26
	b _0380563C @ case 27
	b _0380563C @ case 28
	b _0380563C @ case 29
	b _0380563C @ case 30
	b _0380563C @ case 31
	b _03805618 @ case 32
	b _03805618 @ case 33
	b _038055F4 @ case 34
	b _038055F4 @ case 35
_038055E8:
	bic r1, r1, #0x4000
	str r1, [r0]
	bx lr
_038055F4:
	orr r2, r1, #0x4000
	lsl r1, r2, #0x12
	lsr r1, r1, #0x1a
	sub r1, r1, #0x12
	bic r2, r2, #0x3f00
	lsl r1, r1, #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_03805618:
	orr r2, r1, #0x4000
	lsl r1, r2, #0x12
	lsr r1, r1, #0x1a
	sub r1, r1, #0x18
	bic r2, r2, #0x3f00
	lsl r1, r1, #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_0380563C:
	ldr r1, [r0]
	bic r1, r1, #0x4000
	bic r1, r1, #0x3f00
	str r1, [r0]
	bx lr
	arm_func_end FUN_03805540

	arm_func_start FUN_03805650
FUN_03805650: @ 0x03805650
	ldr r2, [r0]
	lsl r1, r2, #0x12
	lsr r3, r1, #0x1a
	cmp r3, #0x23
	addls pc, pc, r3, lsl #2
	b _0380574C
_03805668: @ jump table
	b _038056F8 @ case 0
	b _038056F8 @ case 1
	b _038056F8 @ case 2
	b _038056F8 @ case 3
	b _038056F8 @ case 4
	b _038056F8 @ case 5
	b _038056F8 @ case 6
	b _038056F8 @ case 7
	b _0380571C @ case 8
	b _0380571C @ case 9
	b _0380574C @ case 10
	b _0380574C @ case 11
	b _0380574C @ case 12
	b _0380574C @ case 13
	b _0380574C @ case 14
	b _0380574C @ case 15
	b _038056F8 @ case 16
	b _038056F8 @ case 17
	b _03805740 @ case 18
	b _03805740 @ case 19
	b _03805740 @ case 20
	b _03805740 @ case 21
	b _03805740 @ case 22
	b _03805740 @ case 23
	b _03805740 @ case 24
	b _03805740 @ case 25
	b _0380574C @ case 26
	b _0380574C @ case 27
	b _0380574C @ case 28
	b _0380574C @ case 29
	b _0380574C @ case 30
	b _0380574C @ case 31
	b _03805740 @ case 32
	b _03805740 @ case 33
	b _03805740 @ case 34
	b _03805740 @ case 35
_038056F8:
	lsl r1, r2, #0x11
	lsrs r1, r1, #0x1f
	bxeq lr
	add r1, r3, #0x12
	bic r2, r2, #0x3f00
	lsl r1, r1, #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_0380571C:
	lsl r1, r2, #0x11
	lsrs r1, r1, #0x1f
	bxeq lr
	add r1, r3, #0x18
	bic r2, r2, #0x3f00
	lsl r1, r1, #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_03805740:
	orr r1, r2, #0x4000
	str r1, [r0]
	bx lr
_0380574C:
	ldr r1, [r0]
	bic r1, r1, #0x4000
	bic r1, r1, #0x3f00
	str r1, [r0]
	bx lr
	arm_func_end FUN_03805650

	arm_func_start FUN_03805760
FUN_03805760: @ 0x03805760
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl FUN_038057BC
	mov r0, r7
	mov r1, r6
	bl FUN_03805830
	cmp r7, #6
	beq _038057A4
	cmp r7, #0x86
	bne _038057B0
	mov r0, r5
	mov r1, r4
	bl FUN_03805930
	b _038057B0
_038057A4:
	mov r0, r5
	mov r1, r4
	bl FUN_038058A0
_038057B0:
	bl FUN_038057FC
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end FUN_03805760

	arm_func_start FUN_038057BC
FUN_038057BC: @ 0x038057BC
	mov ip, #0x4000000
	add ip, ip, #0x138
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x72
	strh r0, [ip]
	mov r3, #2
_038057D8:
	subs r3, r3, #1
	bne _038057D8
	bic r0, r0, #4
	orr r0, r0, #4
	strh r0, [ip]
	mov r3, #2
_038057F0:
	subs r3, r3, #1
	bne _038057F0
	bx lr
	arm_func_end FUN_038057BC

	arm_func_start FUN_038057FC
FUN_038057FC: @ 0x038057FC
	mov ip, #0x4000000
	add ip, ip, #0x138
	mov r3, #2
_03805808:
	subs r3, r3, #1
	bne _03805808
	ldrh r0, [ip]
	bic r0, r0, #4
	orr r0, r0, #0
	strh r0, [ip]
	mov r3, #2
_03805824:
	subs r3, r3, #1
	bne _03805824
	bx lr
	arm_func_end FUN_038057FC

	arm_func_start FUN_03805830
FUN_03805830: @ 0x03805830
	mov ip, #0x4000000
	add ip, ip, #0x138
	orr r1, r0, r1
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x74
	mov r2, #0
_0380584C:
	bic r0, r0, #3
	orr r0, r0, #0
	mov r3, #1
	tst r3, r1, lsr r2
	movne r3, #1
	moveq r3, #0
	orr r0, r0, r3
	strh r0, [ip]
	mov r3, #9
_03805870:
	subs r3, r3, #1
	bne _03805870
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_03805888:
	subs r3, r3, #1
	bne _03805888
	add r2, r2, #1
	cmp r2, #8
	bne _0380584C
	bx lr
	arm_func_end FUN_03805830

	arm_func_start FUN_038058A0
FUN_038058A0: @ 0x038058A0
	mov ip, #0x4000000
	add ip, ip, #0x138
_038058A8:
	push {r0, r1}
	tst r0, #1
	ldrheq r1, [r0]
	ldrhne r1, [r0, #-1]
	lsrne r1, r1, #8
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x74
	mov r2, #0
_038058CC:
	bic r0, r0, #3
	orr r0, r0, #0
	mov r3, #1
	tst r3, r1, lsr r2
	movne r3, #1
	moveq r3, #0
	orr r0, r0, r3
	strh r0, [ip]
	mov r3, #9
_038058F0:
	subs r3, r3, #1
	bne _038058F0
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_03805908:
	subs r3, r3, #1
	bne _03805908
	add r2, r2, #1
	cmp r2, #8
	bne _038058CC
	pop {r0, r1}
	add r0, r0, #1
	subs r1, r1, #1
	bne _038058A8
	bx lr
	arm_func_end FUN_038058A0

	arm_func_start FUN_03805930
FUN_03805930: @ 0x03805930
	mov ip, #0x4000000
	add ip, ip, #0x138
_03805938:
	push {r0, r1}
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x64
	mov r2, #0
	mov r1, #0
_03805950:
	bic r0, r0, #3
	orr r0, r0, #0
	strh r0, [ip]
	mov r3, #9
_03805960:
	subs r3, r3, #1
	bne _03805960
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
_03805990:
	subs r3, r3, #1
	bne _03805990
	add r1, r1, #1
	cmp r1, #8
	bne _03805950
	pop {r0, r1}
	tst r0, #1
	beq _038059C8
	ldrh r3, [r0, #-1]
	bic r3, r3, #0xff00
	lsl r2, r2, #8
	orr r3, r2, r3
	strh r3, [r0, #-1]
	b _038059D8
_038059C8:
	ldrh r3, [r0]
	bic r3, r3, #0xff
	orr r3, r3, r2
	strh r3, [r0]
_038059D8:
	add r0, r0, #1
	subs r1, r1, #1
	bne _03805938
	bx lr
	arm_func_end FUN_03805930

	arm_func_start FUN_038059E8
FUN_038059E8: @ 0x038059E8
	push {r3, lr}
	ldr r3, _03805A2C @ =0x03809884
	mov ip, #1
	str r0, [r3, #8]
	ldr r0, _03805A30 @ =0x03809894
	mov r1, #0
	mov r2, #0xa4
	strb ip, [r3]
	bl FUN_037FB07C
	ldr r1, _03805A34 @ =FUN_03805BC8
	mov r0, #0xf
	bl FUN_037FB330
	ldr r1, _03805A38 @ =FUN_03805B18
	mov r0, #0xa
	bl FUN_037FB330
	pop {r3, lr}
	bx lr
	.align 2, 0
_03805A2C: .4byte 0x03809884
_03805A30: .4byte 0x03809894
_03805A34: .4byte FUN_03805BC8
_03805A38: .4byte FUN_03805B18
	arm_func_end FUN_038059E8

	arm_func_start FUN_03805A3C
FUN_03805A3C: @ 0x03805A3C
	push {r3, lr}
	ldr r2, _03805A68 @ =0x04000304
	mov r0, #1
	ldrh r1, [r2]
	bic r1, r1, #2
	strh r1, [r2]
	bl FUN_038022BC
	mov r0, #1
	bl FUN_03801F54
	pop {r3, lr}
	bx lr
	.align 2, 0
_03805A68: .4byte 0x04000304
	arm_func_end FUN_03805A3C

	arm_func_start FUN_03805A6C
FUN_03805A6C: @ 0x03805A6C
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x50
	str r0, [sp, #0x44]
	ldr r0, _03805B04 @ =0x0380A4F8
	mov sb, #4
	mov r7, #8
	mov r4, #3
	ldr r1, _03805B08 @ =0x0380A4F8
	ldr r6, _03805B0C @ =0x03809938
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
	bl FUN_03805B10
	add sp, sp, #0x50
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_03805B04: .4byte 0x0380A4F8
_03805B08: .4byte 0x0380A4F8
_03805B0C: .4byte 0x03809938
	arm_func_end FUN_03805A6C

	arm_func_start FUN_03805B10
FUN_03805B10: @ 0x03805B10
	ldr pc, _03805B14 @ =0x06000000
	.align 2, 0
_03805B14: .4byte 0x06000000
	arm_func_end FUN_03805B10

	arm_func_start FUN_03805B18
FUN_03805B18: @ 0x03805B18
	push {r4, r5, r6, lr}
	movs r6, r1
	ldrh r4, [r6]
	beq _03805B60
	mov r0, #0
	mov r2, #0x100
	bl FUN_037FAFCC
	strh r4, [r6]
	mov r0, #4
	strh r0, [r6, #2]
	mov r5, #0xa
	mov r4, #0
_03805B48:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	blt _03805B48
_03805B60:
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end FUN_03805B18

	arm_func_start FUN_03805B68
FUN_03805B68: @ 0x03805B68
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r1, _03805BC4 @ =0x03806C40
	ldr r1, [r1, #8]
	b _03805BB4
_03805B80:
	cmp r1, r0
	bne _03805BB0
	ldr r0, [r0, #0x48]
	cmp r0, #0
	cmpne r0, #1
	beq _03805BA0
	cmp r0, #2
	b _03805BA8
_03805BA0:
	mov r0, #1
	bx lr
_03805BA8:
	mov r0, #0
	bx lr
_03805BB0:
	ldr r1, [r1, #0x4c]
_03805BB4:
	cmp r1, #0
	bne _03805B80
	mov r0, #0
	bx lr
	.align 2, 0
_03805BC4: .4byte 0x03806C40
	arm_func_end FUN_03805B68

	arm_func_start FUN_03805BC8
FUN_03805BC8: @ 0x03805BC8
	push {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r1
	cmp r4, #0x10000
	beq _03805BE8
	cmp r4, #0x20000
	beq _03805C80
	b _03805D24
_03805BE8:
	bl FUN_037FAD24
	mov r5, r0
	ldr r0, _03805D54 @ =0x03809894
	bl FUN_03805B68
	cmp r0, #0
	beq _03805C10
	mov r0, r5
	bl FUN_037FAD38
	mov r0, #0
	b _03805C70
_03805C10:
	ldr r1, _03805D58 @ =0x03809884
	ldrb r0, [r1]
	cmp r0, #1
	beq _03805C30
	mov r0, r5
	bl FUN_037FAD38
	mov r0, #0
	b _03805C70
_03805C30:
	mov r2, #2
	mov r0, r5
	strb r2, [r1]
	bl FUN_037FAD38
	mov r2, #0x400
	ldr r0, _03805D54 @ =0x03809894
	ldr r1, _03805D5C @ =FUN_03805D6C
	ldr r3, _03805D60 @ =0x03809EF8
	str r2, [sp]
	mov r5, #0xa
	mov r2, #0
	str r5, [sp, #4]
	bl FUN_037F9054
	ldr r0, _03805D54 @ =0x03809894
	bl FUN_037F93B4
	mov r0, #1
_03805C70:
	cmp r0, #0
	bne _03805D48
	orr r6, r4, #5
	b _03805D28
_03805C80:
	bl FUN_037FAD24
	mov r5, r0
	ldr r0, _03805D54 @ =0x03809894
	bl FUN_03805B68
	cmp r0, #0
	beq _03805CA8
	mov r0, r5
	bl FUN_037FAD38
	mov r0, #0
	b _03805D14
_03805CA8:
	ldr r1, _03805D58 @ =0x03809884
	ldrb r0, [r1]
	cmp r0, #3
	beq _03805CC8
	mov r0, r5
	bl FUN_037FAD38
	mov r0, #0
	b _03805D14
_03805CC8:
	mov r2, #4
	mov r0, r5
	strb r2, [r1]
	bl FUN_037FAD38
	ldr r1, _03805D64 @ =FUN_03805B18
	mov r0, #0xa
	bl FUN_037FB330
	mov r2, #0x400
	ldr r0, _03805D54 @ =0x03809894
	ldr r1, _03805D68 @ =FUN_03805DDC
	ldr r3, _03805D60 @ =0x03809EF8
	str r2, [sp]
	mov r5, #2
	mov r2, #0
	str r5, [sp, #4]
	bl FUN_037F9054
	ldr r0, _03805D54 @ =0x03809894
	bl FUN_037F93B4
	mov r0, #1
_03805D14:
	cmp r0, #0
	bne _03805D48
	orr r6, r4, #5
	b _03805D28
_03805D24:
	orr r6, r4, #7
_03805D28:
	mov r5, #0xf
	mov r4, #0
_03805D30:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	blt _03805D30
_03805D48:
	add sp, sp, #8
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03805D54: .4byte 0x03809894
_03805D58: .4byte 0x03809884
_03805D5C: .4byte FUN_03805D6C
_03805D60: .4byte 0x03809EF8
_03805D64: .4byte FUN_03805B18
_03805D68: .4byte FUN_03805DDC
	arm_func_end FUN_03805BC8

	arm_func_start FUN_03805D6C
FUN_03805D6C: @ 0x03805D6C
	push {r4, r5, r6, lr}
	ldr r1, _03805DD8 @ =0x03809884
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _03805D8C
	ldr r2, [r1, #0xc]
	mov r1, #0x6000000
	bl FUN_037FB044
_03805D8C:
	ldr r0, _03805DD8 @ =0x03809884
	ldr r0, [r0, #8]
	bl FUN_03805A6C
	mov r6, #0xf
	mov r5, #0x10000
	mov r4, #0
_03805DA4:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	blt _03805DA4
	bl FUN_037FAD24
	ldr r0, _03805DD8 @ =0x03809884
	mov r1, #3
	strb r1, [r0]
	bl FUN_037F915C
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03805DD8: .4byte 0x03809884
	arm_func_end FUN_03805D6C

	arm_func_start FUN_03805DDC
FUN_03805DDC: @ 0x03805DDC
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _03805FDC @ =0x060198A4
	ldr sl, _03805FE0 @ =0x060188A4
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	addne r0, sl, #0x1000
	ldrne r0, [r0, #0x54c]
	ldrne r0, [r0]
	ldrhne r0, [r0]
	cmpne r0, #0
	beq _03805E10
	bl FUN_03805FE8
	bl FUN_03805FF0
_03805E10:
	mov r6, #0
	add sb, sp, #0
	add r4, sl, #0x1000
	mov fp, #0x100
	mov r5, #4
	mov r8, r6
_03805E28:
	mov r1, sb
	mov r2, r8
	add r0, sl, #0x88
	bl FUN_037F9784
	cmp r0, #0
	beq _03805E90
	ldr r0, [r4, #0x54c]
	cmp r0, #0
	beq _03805E28
	bl FUN_03806914
	mov r7, r0
	mov r0, r6
	mov r1, r7
	mov r2, fp
	bl FUN_037FAFCC
	ldr r1, [sp]
	mov r0, r7
	ldrh r1, [r1]
	strh r1, [r7]
	strh r5, [r7, #2]
	bl FUN_038068C8
	ldr r1, [sp]
	ldrh r0, [r1]
	orr r0, r0, #0x8000
	strh r0, [r1]
	b _03805E28
_03805E90:
	bl FUN_03805FF8
	bl FUN_03805B68
	cmp r0, #0
	beq _03805EB8
	add r0, sl, #0x88
	mov r1, #0
	mov r2, #1
	bl FUN_037F96F8
	bl FUN_03805FF8
	bl FUN_037F9290
_03805EB8:
	add r1, sp, #0
	add r0, sl, #0x88
	mov r2, #0
	bl FUN_037F9784
	mov r5, r0
	add r1, sp, #0
	add r0, sl, #0x58
	mov r2, #0
	bl FUN_037F9784
	mov r4, r0
	add r1, sp, #0
	mov r0, sl
	mov r2, #0
	bl FUN_037F9784
	orr r1, r5, r4
	orrs r0, r0, r1
	beq _03805F00
	bl FUN_037FAE94
_03805F00:
	bl FUN_03806000
	add r5, sp, #0
	mov r4, #0
_03805F0C:
	mov r1, r5
	mov r2, r4
	add r0, sl, #0x28
	bl FUN_037F9784
	cmp r0, #0
	bne _03805F0C
	bl FUN_03806008
	bl FUN_03805B68
	cmp r0, #0
	beq _03805F4C
	add r0, sl, #0x28
	mov r1, #0
	mov r2, #1
	bl FUN_037F96F8
	bl FUN_03806008
	bl FUN_037F9290
_03805F4C:
	mov r0, #1
	bl FUN_038022BC
	mov r0, #1
	bl FUN_03801F54
	add r0, sl, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	ldrne r1, [r0]
	ldrhne r0, [r1]
	cmpne r0, #0
	movne r0, #0
	strhne r0, [r1]
	ldr r0, _03805FE4 @ =0x03809884
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _03805F9C
	ldr r2, [r0, #0xc]
	mov r0, #0
	mov r1, #0x6000000
	bl FUN_037FAFF8
_03805F9C:
	mov r6, #0xf
	mov r5, #0x20000
	mov r4, #0
_03805FA8:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	blt _03805FA8
	bl FUN_037FAD24
	ldr r0, _03805FE4 @ =0x03809884
	mov r1, #1
	strb r1, [r0]
	bl FUN_037F915C
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_03805FDC: .4byte 0x060198A4
_03805FE0: .4byte 0x060188A4
_03805FE4: .4byte 0x03809884
	arm_func_end FUN_03805DDC

	arm_func_start FUN_03805FE8
FUN_03805FE8: @ 0x03805FE8
	ldr pc, _03805FEC @ =0x06005CEC
	.align 2, 0
_03805FEC: .4byte 0x06005CEC
	arm_func_end FUN_03805FE8

	arm_func_start FUN_03805FF0
FUN_03805FF0: @ 0x03805FF0
	ldr pc, _03805FF4 @ =0x06001DEC
	.align 2, 0
_03805FF4: .4byte 0x06001DEC
	arm_func_end FUN_03805FF0

	arm_func_start FUN_03805FF8
FUN_03805FF8: @ 0x03805FF8
	ldr pc, _03805FFC @ =0x060007A8
	.align 2, 0
_03805FFC: .4byte 0x060007A8
	arm_func_end FUN_03805FF8

	arm_func_start FUN_03806000
FUN_03806000: @ 0x03806000
	ldr pc, _03806004 @ =0x06008D54
	.align 2, 0
_03806004: .4byte 0x06008D54
	arm_func_end FUN_03806000

	arm_func_start FUN_03806008
FUN_03806008: @ 0x03806008
	ldr pc, _0380600C @ =0x060007B4
	.align 2, 0
_0380600C: .4byte 0x060007B4
	arm_func_end FUN_03806008

	arm_func_start FUN_03806010
FUN_03806010: @ 0x03806010
	ldr r1, _03806048 @ =0x55555555
	ldr r2, _0380604C @ =0x33333333
	and r1, r1, r0, lsr #1
	sub r1, r0, r1
	ldr r0, _03806050 @ =0x0F0F0F0F
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
_03806048: .4byte 0x55555555
_0380604C: .4byte 0x33333333
_03806050: .4byte 0x0F0F0F0F
	arm_func_end FUN_03806010

	arm_func_start FUN_03806054
FUN_03806054: @ 0x03806054
	push {r4, r5, r6, r7, fp, ip, lr}
	mov r4, r1
	orr r4, r4, #1
	b _03806074
	arm_func_end FUN_03806054

	arm_func_start FUN_03806064
FUN_03806064: @ 0x03806064
	push {r4, r5, r6, r7, fp, ip, lr}
	eor r4, r1, r3
	asr r4, r4, #1
	lsl r4, r4, #1
_03806074:
	orrs r5, r3, r2
	bne _03806084
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_03806084:
	lsr r5, r0, #0x1f
	add r5, r5, r1
	lsr r6, r2, #0x1f
	add r6, r6, r3
	orrs r6, r5, r6
	bne _038060B8
	mov r1, r2
	bl FUN_0380625C
	ands r4, r4, #1
	movne r0, r1
	asr r1, r0, #0x1f
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_038060B8:
	cmp r1, #0
	bge _038060C8
	rsbs r0, r0, #0
	rsc r1, r1, #0
_038060C8:
	cmp r3, #0
	bge _038060D8
	rsbs r2, r2, #0
	rsc r3, r3, #0
_038060D8:
	orrs r5, r1, r0
	beq _038061FC
	mov r5, #0
	mov r6, #1
	cmp r3, #0
	bmi _03806104
_038060F0:
	add r5, r5, #1
	adds r2, r2, r2
	adcs r3, r3, r3
	bpl _038060F0
	add r6, r6, r5
_03806104:
	cmp r1, #0
	blt _03806124
_0380610C:
	cmp r6, #1
	beq _03806124
	sub r6, r6, #1
	adds r0, r0, r0
	adcs r1, r1, r1
	bpl _0380610C
_03806124:
	mov r7, #0
	mov ip, #0
	mov fp, #0
	b _0380614C
_03806134:
	orr ip, ip, #1
	subs r6, r6, #1
	beq _038061A4
	adds r0, r0, r0
	adcs r1, r1, r1
	adcs r7, r7, r7
_0380614C:
	subs r0, r0, r2
	sbcs r1, r1, r3
	sbcs r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _03806134
_03806168:
	subs r6, r6, #1
	beq _0380619C
	adds r0, r0, r0
	adcs r1, r1, r1
	adc r7, r7, r7
	adds r0, r0, r2
	adcs r1, r1, r3
	adc r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _03806134
	b _03806168
_0380619C:
	adds r0, r0, r2
	adc r1, r1, r3
_038061A4:
	ands r7, r4, #1
	moveq r0, ip
	moveq r1, fp
	beq _038061DC
	subs r7, r5, #0x20
	lsrge r0, r1, r7
	bge _03806200
	rsb r7, r5, #0x20
	lsr r0, r0, r5
	orr r0, r0, r1, lsl r7
	lsr r1, r1, r5
	b _038061DC
	arm_func_end FUN_03806064

	arm_func_start FUN_038061D4
FUN_038061D4: @ 0x038061D4
	lsr r0, r1, r7
	mov r1, #0
_038061DC:
	cmp r4, #0
	blt _038061EC
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_038061EC:
	rsbs r0, r0, #0
	rsc r1, r1, #0
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_038061FC:
	mov r0, #0
_03806200:
	mov r1, #0
	cmp r4, #0
	blt _038061EC
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
	arm_func_end FUN_038061D4

	arm_func_start FUN_03806214
FUN_03806214: @ 0x03806214
	push {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #0
	b _03806228
	arm_func_end FUN_03806214

	arm_func_start FUN_03806220
FUN_03806220: @ 0x03806220
	push {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #1
_03806228:
	orrs r5, r3, r2
	bne _03806238
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_03806238:
	orrs r5, r1, r3
	bne _038060D8
	mov r1, r2
	bl FUN_03806470
	cmp r4, #0
	movne r0, r1
	mov r1, #0
	pop {r4, r5, r6, r7, fp, ip, lr}
	bx lr
	arm_func_end FUN_03806220

	arm_func_start FUN_0380625C
FUN_0380625C: @ 0x0380625C
	eor ip, r0, r1
	and ip, ip, #0x80000000
	cmp r0, #0
	rsblt r0, r0, #0
	addlt ip, ip, #1
	cmp r1, #0
	rsblt r1, r1, #0
	beq _03806454
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	blo _03806454
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
_03806454:
	ands r3, ip, #0x80000000
	rsbne r0, r0, #0
	ands r3, ip, #1
	rsbne r1, r1, #0
	bx lr
	arm_func_end FUN_0380625C

	arm_func_start FUN_03806468
FUN_03806468: @ 0x03806468
	cmp r1, #0
	bxeq lr
	arm_func_end FUN_03806468

	arm_func_start FUN_03806470
FUN_03806470: @ 0x03806470
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
	arm_func_end FUN_03806470
_0380664C:
	.byte 0x00, 0x06, 0x0C, 0x13
	.byte 0x19, 0x1F, 0x25, 0x2B, 0x31, 0x36, 0x3C, 0x41, 0x47, 0x4C, 0x51, 0x55, 0x5A, 0x5E, 0x62, 0x66
	.byte 0x6A, 0x6D, 0x70, 0x73, 0x75, 0x78, 0x7A, 0x7B, 0x7D, 0x7E, 0x7E, 0x7F, 0x7F, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x2E, 0xFD, 0x2F, 0xFD, 0x75, 0xFD, 0xA7, 0xFD, 0xCE, 0xFD, 0xEE, 0xFD, 0x09, 0xFE
	.byte 0x20, 0xFE, 0x34, 0xFE, 0x46, 0xFE, 0x57, 0xFE, 0x66, 0xFE, 0x74, 0xFE, 0x81, 0xFE, 0x8D, 0xFE
	.byte 0x98, 0xFE, 0xA3, 0xFE, 0xAD, 0xFE, 0xB6, 0xFE, 0xBF, 0xFE, 0xC7, 0xFE, 0xCF, 0xFE, 0xD7, 0xFE
	.byte 0xDF, 0xFE, 0xE6, 0xFE, 0xEC, 0xFE, 0xF3, 0xFE, 0xF9, 0xFE, 0xFF, 0xFE, 0x05, 0xFF, 0x0B, 0xFF
	.byte 0x11, 0xFF, 0x16, 0xFF, 0x1B, 0xFF, 0x20, 0xFF, 0x25, 0xFF, 0x2A, 0xFF, 0x2E, 0xFF, 0x33, 0xFF
	.byte 0x37, 0xFF, 0x3C, 0xFF, 0x40, 0xFF, 0x44, 0xFF, 0x48, 0xFF, 0x4C, 0xFF, 0x50, 0xFF, 0x53, 0xFF
	.byte 0x57, 0xFF, 0x5B, 0xFF, 0x5E, 0xFF, 0x62, 0xFF, 0x65, 0xFF, 0x68, 0xFF, 0x6B, 0xFF, 0x6F, 0xFF
	.byte 0x72, 0xFF, 0x75, 0xFF, 0x78, 0xFF, 0x7B, 0xFF, 0x7E, 0xFF, 0x81, 0xFF, 0x83, 0xFF, 0x86, 0xFF
	.byte 0x89, 0xFF, 0x8C, 0xFF, 0x8E, 0xFF, 0x91, 0xFF, 0x93, 0xFF, 0x96, 0xFF, 0x99, 0xFF, 0x9B, 0xFF
	.byte 0x9D, 0xFF, 0xA0, 0xFF, 0xA2, 0xFF, 0xA5, 0xFF, 0xA7, 0xFF, 0xA9, 0xFF, 0xAB, 0xFF, 0xAE, 0xFF
	.byte 0xB0, 0xFF, 0xB2, 0xFF, 0xB4, 0xFF, 0xB6, 0xFF, 0xB8, 0xFF, 0xBA, 0xFF, 0xBC, 0xFF, 0xBE, 0xFF
	.byte 0xC0, 0xFF, 0xC2, 0xFF, 0xC4, 0xFF, 0xC6, 0xFF, 0xC8, 0xFF, 0xCA, 0xFF, 0xCC, 0xFF, 0xCE, 0xFF
	.byte 0xCF, 0xFF, 0xD1, 0xFF, 0xD3, 0xFF, 0xD5, 0xFF, 0xD6, 0xFF, 0xD8, 0xFF, 0xDA, 0xFF, 0xDC, 0xFF
	.byte 0xDD, 0xFF, 0xDF, 0xFF, 0xE1, 0xFF, 0xE2, 0xFF, 0xE4, 0xFF, 0xE5, 0xFF, 0xE7, 0xFF, 0xE9, 0xFF
	.byte 0xEA, 0xFF, 0xEC, 0xFF, 0xED, 0xFF, 0xEF, 0xFF, 0xF0, 0xFF, 0xF2, 0xFF, 0xF3, 0xFF, 0xF5, 0xFF
	.byte 0xF6, 0xFF, 0xF8, 0xFF, 0xF9, 0xFF, 0xFA, 0xFF, 0xFC, 0xFF, 0xFD, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x00, 0x01, 0x02, 0x04, 0x04, 0x05, 0x06, 0x07, 0x02, 0x00, 0x03, 0x01, 0x08, 0x09, 0x0A, 0x0B
	.byte 0x0E, 0x0C, 0x0F, 0x0D, 0x00, 0x01, 0x05, 0x0E, 0x1A, 0x26, 0x33, 0x3F, 0x49, 0x54, 0x5C, 0x64
	.byte 0x6D, 0x74, 0x7B, 0x7F, 0x84, 0x89, 0x8F, 0x00, 0xC7, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x12, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x16, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00
	.byte 0x17, 0x00, 0x00, 0x00

	arm_func_start FUN_03806854
FUN_03806854: @ 0x03806854
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _038068BC @ =0x0380FFFC
	mov r0, #0
	str r0, [r1]
	ldr r1, _038068C0 @ =0x04000180
	mov r0, #0x100
	strh r0, [r1]
_03806874:
	ldrh r0, [r1]
	and r0, r0, #0xf
	cmp r0, #1
	bne _03806874
	ldr r1, _038068C0 @ =0x04000180
	mov r0, #0
	strh r0, [r1]
_03806890:
	ldrh r0, [r1]
	cmp r0, #1
	beq _03806890
	ldr r3, _038068C4 @ =0x027FFE00
	ldr ip, [r3, #0x34]
	mov lr, ip
	mov r0, #0
	mov r1, #0
	mov r2, #0
	mov r3, #0
	bx ip
	.align 2, 0
_038068BC: .4byte 0x0380FFFC
_038068C0: .4byte 0x04000180
_038068C4: .4byte 0x027FFE00
	arm_func_end FUN_03806854

	arm_func_start FUN_038068C8
FUN_038068C8: @ 0x038068C8
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, #0x100
	mov r5, #0xa
	mov r4, #0
	b _038068E8
_038068E0:
	mov r0, r6
	bl FUN_037F8A30
_038068E8:
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl FUN_037FB3A4
	cmp r0, #0
	blt _038068E0
	ldr r0, _03806910 @ =0x06019DCC
	bl FUN_037F9930
	pop {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03806910: .4byte 0x06019DCC
	arm_func_end FUN_038068C8

	arm_func_start FUN_03806914
FUN_03806914: @ 0x03806914
	push {r3, r4, r5, lr}
	ldr r0, _0380695C @ =0x06019DCC
	bl FUN_037F98AC
	ldr r4, _03806960 @ =0x027FFF96
	mov r5, #0x100
	b _03806934
_0380692C:
	mov r0, r5
	bl FUN_037F8A30
_03806934:
	ldrh r1, [r4]
	tst r1, #1
	bne _0380692C
	ldr r0, _03806964 @ =0x060198A4
	orr r1, r1, #1
	strh r1, [r4]
	ldr r0, [r0, #0x54c]
	ldr r0, [r0, #8]
	pop {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380695C: .4byte 0x06019DCC
_03806960: .4byte 0x027FFF96
_03806964: .4byte 0x060198A4
	arm_func_end FUN_03806914

	arm_func_start FUN_03806968
FUN_03806968: @ 0x03806968
	push {r4, r5, r6, lr}
	ldr r1, _03806A70 @ =0x00001FFF
	and r0, r0, r1
	lsl r0, r0, #0x10
	lsrs r2, r0, #0x10
	moveq r0, #0
	beq _03806A68
	mov r1, #0
	mov r0, #1
	b _0380699C
_03806990:
	tst r2, r0, lsl r1
	bne _038069A4
	add r1, r1, #1
_0380699C:
	cmp r1, #0x10
	blt _03806990
_038069A4:
	mov r0, #0xf
	mov r3, #1
	b _038069BC
_038069B0:
	tst r2, r3, lsl r0
	bne _038069C4
	sub r0, r0, #1
_038069BC:
	cmp r0, #0
	bne _038069B0
_038069C4:
	sub r6, r0, r1
	cmp r6, #5
	movlt r0, #1
	lsllt r0, r0, r1
	lsllt r0, r0, #0x10
	lsrlt r0, r0, #0x10
	blt _03806A68
	add r3, r0, r1
	add r3, r3, r3, lsr #31
	asr r4, r3, #1
	mov r5, #0
	mov lr, #1
	b _03806A1C
_038069F8:
	lsr ip, r5, #0x1f
	rsb r3, ip, r5, lsl #31
	add r3, ip, r3, ror #31
	lsl r3, r3, #1
	sub r3, r3, #1
	mla r4, r5, r3, r4
	tst r2, lr, lsl r4
	bne _03806A24
	add r5, r5, #1
_03806A1C:
	cmp r5, r6
	blt _038069F8
_03806A24:
	sub r2, r0, r4
	cmp r2, #5
	subge r2, r4, r1
	cmpge r2, #5
	bge _03806A50
	mov r2, #1
	lsl r0, r2, r0
	orr r0, r0, r2, lsl r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	b _03806A68
_03806A50:
	mov r3, #1
	lsl r2, r3, r4
	orr r0, r2, r3, lsl r0
	orr r0, r0, r3, lsl r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
_03806A68:
	pop {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03806A70: .4byte 0x00001FFF
	arm_func_end FUN_03806968
_03806A74:
	.byte 0x08, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6C, 0x87, 0x7F, 0x03, 0x5C, 0x86, 0x7F, 0x03
	.byte 0x5C, 0x86, 0x7F, 0x03, 0x2C, 0x87, 0x7F, 0x03, 0x3C, 0x87, 0x7F, 0x03, 0x4C, 0x87, 0x7F, 0x03
	.byte 0x5C, 0x87, 0x7F, 0x03, 0x5C, 0x86, 0x7F, 0x03, 0xEC, 0x86, 0x7F, 0x03, 0xFC, 0x86, 0x7F, 0x03
	.byte 0x0C, 0x87, 0x7F, 0x03, 0x1C, 0x87, 0x7F, 0x03, 0x5C, 0x86, 0x7F, 0x03, 0x5C, 0x86, 0x7F, 0x03
	.byte 0x5C, 0x86, 0x7F, 0x03, 0x5C, 0x86, 0x7F, 0x03, 0x5C, 0x86, 0x7F, 0x03, 0x5C, 0x86, 0x7F, 0x03
	.byte 0x5C, 0x86, 0x7F, 0x03, 0x5C, 0x86, 0x7F, 0x03, 0x5C, 0x86, 0x7F, 0x03, 0x5C, 0x86, 0x7F, 0x03
	.byte 0x5C, 0x86, 0x7F, 0x03, 0x5C, 0x86, 0x7F, 0x03, 0x5C, 0x86, 0x7F, 0x03, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0xFE, 0x7F, 0x02
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0xAA, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCC
	.byte 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xE3, 0x0C, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xF0, 0x10, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x3E, 0xF8, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFC
	.byte 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x10, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xFF, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0xFF, 0x20, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF
	.byte 0x20, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x20, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC3, 0x28, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF
