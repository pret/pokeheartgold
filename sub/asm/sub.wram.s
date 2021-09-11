	.include "asm/macros.inc"
	.include "global.inc"

	.text
	.public _0380664C

	arm_func_start sub_037F8000
sub_037F8000: ; 0x037F8000
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x210
	bl sub_027E0000
	bl sub_037F9A10
	bl OS_InitThread
	add r2, sp, #4
	mov r0, #0x20
	mov r1, #2
	bl sub_03803E6C
	ldr r0, [sp, #4]
	add r2, sp, #0x10
	mov r0, r0, lsl #3
	str r0, [sp, #4]
	mov r1, #0x100
	bl sub_03803E6C
	ldr r0, [sp, #4]
	mov r1, #0x100
	add r0, r0, #0x100
	add r2, sp, #0x110
	bl sub_03803E6C
	mov r0, #0x1d
	mov r1, #1
	add r2, sp, #0
	mov r6, #0
	bl sub_03803E6C
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
	bl sub_037F8488
	mov r8, r0
	mov fp, #1
	and r7, r8, #0x40
	mov sl, #0
	add r5, sp, #0x10
	mov r4, fp
	b _037F8148
_037F80A8:
	ldr r0, _037F8458 ; =0x0000FFFF
	add sb, r5, sl, lsl #8
	mov r1, sb
	mov r2, #0x70
	bl sub_037F8470
	mov r2, sb
	ldrh r1, [r2, #0x72]
	cmp r0, r1
	bne _037F813C
	ldrh r0, [r2, #0x70]
	cmp r0, #0x80
	bhs _037F813C
	ldr r0, _037F8458 ; =0x0000FFFF
	mov r2, #0x8a
	add r1, sb, #0x74
	bl sub_037F8470
	mov r2, sb
	ldrh r1, [r2, #0xfe]
	cmp r0, r1
	bne _037F813C
	ldrh r1, [r2, #0x76]
	ldrb r0, [r2, #0x75]
	tst r1, r4, lsl r0
	beq _037F813C
	tst r8, r1
	ldrneh r1, [sb, #0x64]
	andne r0, r0, #7
	bicne r1, r1, #7
	orrne r0, r1, r0
	strneh r0, [sb, #0x64]
	add r0, r5, sl, lsl #8
	ldrh r0, [r0, #0x76]
	mvn r0, r0
	tst r7, r0
	movne r6, #3
	bne _037F81F4
	orr r6, r6, fp, lsl sl
_037F813C:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_037F8148:
	cmp sl, #2
	blo _037F80A8
	b _037F81B8
_037F8154:
	bl sub_037F8488
	tst r0, #0x40
	movne r6, #3
	bne _037F81F4
	ldr r8, _037F8458 ; =0x0000FFFF
	mov sb, #0
	add r7, sp, #0x10
	mov r4, #1
	mov r5, #0x70
_037F8178:
	mov r0, r8
	mov r2, r5
	add r1, r7, sb, lsl #8
	bl sub_037F8470
	add r2, r7, sb, lsl #8
	ldrh r1, [r2, #0x72]
	cmp r0, r1
	bne _037F81A4
	ldrh r0, [r2, #0x70]
	cmp r0, #0x80
	orrlo r6, r6, r4, lsl sb
_037F81A4:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
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
	ldr r1, _037F845C ; =0x027FFC80
	mvn r0, #0
	mov r2, #0x74
	bl MI_CpuClear32
	b _037F82CC
_037F8210:
	cmp r6, #0
	beq _037F82BC
	ldr r0, _037F8460 ; =0xFFFFFF2A
	mov r1, r6, lsl #8
	add r0, sp, r0
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
	ldr r0, _037F8464 ; =0xFFFFFF60
	mov r1, r6, lsl #8
	add r0, sp, r0
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
	ldr r1, _037F845C ; =0x027FFC80
	add r2, sp, #0x10
	sub r0, r6, #1
	add r0, r2, r0, lsl #8
	mov r2, #0x74
	bl sub_037FAFE0
	b _037F82CC
_037F82BC:
	ldr r1, _037F845C ; =0x027FFC80
	mov r0, #0
	mov r2, #0x74
	bl MI_CpuClear32
_037F82CC:
	add r2, sp, #8
	mov r0, #0x36
	mov r1, #6
	bl sub_03803E6C
	ldr r4, _037F845C ; =0x027FFC80
	add r0, sp, #8
	add r1, r4, #0x74
	mov r2, #6
	bl sub_037FB110
	add r2, sp, #2
	mov r0, #0x3c
	mov r1, #2
	bl sub_03803E6C
	ldrh r0, [sp, #2]
	mov r0, r0, lsl #0xf
	mov r0, r0, lsr #0x10
	bl sub_03806968
	strh r0, [r4, #0x7a]
	bl sub_037FB248
	mov r0, #8
	bl sub_037F9AB8
	mov r4, r0
	mov r0, #8
	bl sub_037F9ACC
	mov r1, r0
	mov r2, r4
	mov r0, #8
	mov r3, #1
	bl sub_037F9E48
	mov r4, r0
	mov r0, #8
	bl sub_037F9AB8
	sub r2, r0, r4
	mov r0, r4
	mov r1, #0
	bl sub_037FB07C
	mov r1, r4
	mov r0, #8
	bl sub_037F9BB4
	mov r0, #8
	bl sub_037F9AB8
	mov r4, r0
	mov r0, #8
	bl sub_037F9ACC
	mov r1, r0
	mov r2, r4
	mov r0, #8
	bl sub_037F9EF0
	movs r4, r0
	bpl _037F8398
	bl OS_Terminate
_037F8398:
	mov r1, r4
	mov r0, #8
	bl sub_037F9E14
	mov r1, r4
	mov r0, #8
	bl sub_037F9F90
	cmp r0, #0x2100
	bhs _037F83BC
	bl OS_Terminate
_037F83BC:
	mov r0, #6
	bl sub_037FBE8C
	bl sub_037FB554
	ldr r1, _037F8468 ; =sub_037F84C0
	mov r0, #1
	bl sub_037F87E0
	mov r0, #1
	bl sub_037F8914
	ldr r3, _037F846C ; =0x04000004
	mov r0, #1
	ldrh r1, [r3]
	ldrh r1, [r3]
	add r2, r3, #0x204
	orr r1, r1, #8
	strh r1, [r3]
	ldrh r1, [r2]
	strh r0, [r2]
	bl sub_037FAD10
	mvn r0, #0
	bl sub_037FF5B0
	mov r0, #0xf
	bl sub_037FF678
	mov r0, #0xc
	bl sub_03804578
	mov r0, r4
	bl sub_038059E8
	mov r0, #2
	bl sub_03800920
	mov r4, #0
_037F8430:
	bl sub_037F847C
	bl sub_037FADD8
	cmp r0, #0
	beq _037F844C
	mov r0, r4
	bl sub_038034B0
	bl sub_037FAE1C
_037F844C:
	bl sub_038036E8
	bl sub_038007AC
	b _037F8430
	.align 2, 0
_037F8458: .word 0x0000FFFF
_037F845C: .word 0x027FFC80
_037F8460: .word 0xFFFFFF2A
_037F8464: .word 0xFFFFFF60
_037F8468: .word sub_037F84C0
_037F846C: .word 0x04000004
	arm_func_end sub_037F8000

	arm_func_start sub_037F8470
sub_037F8470: ; 0x037F8470
	ldr ip, _037F8478 ; =sub_038008F4
	bx ip
	.align 2, 0
_037F8478: .word sub_038008F4
	arm_func_end sub_037F8470

	arm_func_start sub_037F847C
sub_037F847C: ; 0x037F847C
	ldr ip, _037F8484 ; =sub_038008C2
	bx ip
	.align 2, 0
_037F8484: .word sub_038008C2
	arm_func_end sub_037F847C

	arm_func_start sub_037F8488
sub_037F8488: ; 0x037F8488
	ldr r1, _037F84BC ; =0x027FFE1D
	mov r0, #0
	ldrb r1, [r1]
	cmp r1, #0x80
	orreq r0, r0, #0x40
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	bxeq lr
	cmp r1, #0x40
	orreq r0, r0, #0x80
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_037F84BC: .word 0x027FFE1D
	arm_func_end sub_037F8488

	arm_func_start sub_037F84C0
sub_037F84C0: ; 0x037F84C0
	stmdb sp!, {r3, lr}
	ldr r0, _037F84E0 ; =0x038093B0
	ldr r0, [r0]
	cmp r0, #0
	beq _037F84D8
	bl sub_0380219C
_037F84D8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F84E0: .word 0x038093B0
	arm_func_end sub_037F84C0

	arm_func_start sub_037F84E4
sub_037F84E4: ; 0x037F84E4
	stmdb sp!, {lr}
	mov ip, #0x4000000
	add ip, ip, #0x210
	ldr r1, [ip, #-8]
	cmp r1, #0
	ldmeqia sp!, {pc}
	ldmia ip, {r1, r2}
	ands r1, r1, r2
	ldmeqia sp!, {pc}
	mov r3, #1
	mov r0, #0
_037F8510:
	ands r2, r1, r3, lsl r0
	addeq r0, r0, #1
	beq _037F8510
	str r2, [ip, #4]
	ldr r1, _037F8530 ; =0x03806A88
	ldr r0, [r1, r0, lsl #2]
	ldr lr, _037F8534 ; =sub_037F8538
	bx r0
	.align 2, 0
_037F8530: .word 0x03806A88
_037F8534: .word sub_037F8538
	arm_func_end sub_037F84E4

	arm_func_start sub_037F8538
sub_037F8538: ; 0x037F8538
	ldr ip, _037F8654 ; =0x03806BA4
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
	ldr ip, _037F8654 ; =0x03806BA4
	str r3, [ip]
	str r3, [ip, #4]
	ldr ip, _037F8658 ; =OSi_ThreadInfo
	mov r1, #1
	strh r1, [ip]
_037F8588:
	ldr ip, _037F8658 ; =OSi_ThreadInfo
	ldrh r1, [ip]
	cmp r1, #0
	ldreq pc, [sp], #4
	mov r1, #0
	strh r1, [ip]
	mov r3, #0xd2
	msr cpsr_c, r3
	add r2, ip, #8
	ldr r1, [r2]
_037F85B0:
	cmp r1, #0
	ldrneh r0, [r1, #0x48]
	cmpne r0, #1
	ldrne r1, [r1, #0x4c]
	bne _037F85B0
	cmp r1, #0
	bne _037F85D8
_037F85CC:
	mov r3, #0x92
	msr cpsr_c, r3
	ldr pc, [sp], #4
_037F85D8:
	ldr r0, [ip, #4]
	cmp r1, r0
	beq _037F85CC
	ldr r3, [ip, #0xc]
	cmp r3, #0
	beq _037F8600
	stmdb sp!, {r0, r1, ip}
	mov lr, pc
	bx r3
	arm_func_end sub_037F8538

	arm_func_start sub_037F85FC
sub_037F85FC: ; 0x037F85FC
	ldmia sp!, {r0, r1, ip}
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
	ldmia sp!, {pc}
	.align 2, 0
_037F8654: .word 0x03806BA4
_037F8658: .word OSi_ThreadInfo
	arm_func_end sub_037F85FC

	arm_func_start sub_037F865C
sub_037F865C: ; 0x037F865C
	bx lr
	arm_func_end sub_037F865C

	arm_func_start sub_037F8660
sub_037F8660: ; 0x037F8660
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #0xc
	mul r5, r0, r1
	ldr r2, _037F86D8 ; =0x03806BAC
	ldr r3, _037F86DC ; =_03806A74
	mov r4, r0, lsl #1
	ldr r1, [r2, r5]
	mov r0, #0
	ldrh r3, [r3, r4]
	mov r4, #1
	str r0, [r2, r5]
	cmp r1, #0
	mov r4, r4, lsl r3
	beq _037F86A8
	ldr r0, _037F86E0 ; =0x03806BB4
	ldr r0, [r0, r5]
	mov lr, pc
	bx r1
_037F86A8:
	ldr r2, _037F86E4 ; =0x0380FFF8
	ldr r0, _037F86E8 ; =0x03806BB0
	ldr r1, [r2]
	orr r1, r1, r4
	str r1, [r2]
	ldr r0, [r0, r5]
	cmp r0, #0
	bne _037F86D0
	mov r0, r4
	bl sub_037F894C
_037F86D0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F86D8: .word 0x03806BAC
_037F86DC: .word _03806A74
_037F86E0: .word 0x03806BB4
_037F86E4: .word 0x0380FFF8
_037F86E8: .word 0x03806BB0
	arm_func_end sub_037F8660

	arm_func_start sub_037F86EC
sub_037F86EC: ; 0x037F86EC
	ldr ip, _037F86F8 ; =sub_037F8660
	mov r0, #0
	bx ip
	.align 2, 0
_037F86F8: .word sub_037F8660
	arm_func_end sub_037F86EC

	arm_func_start sub_037F86FC
sub_037F86FC: ; 0x037F86FC
	ldr ip, _037F8708 ; =sub_037F8660
	mov r0, #1
	bx ip
	.align 2, 0
_037F8708: .word sub_037F8660
	arm_func_end sub_037F86FC

	arm_func_start sub_037F870C
sub_037F870C: ; 0x037F870C
	ldr ip, _037F8718 ; =sub_037F8660
	mov r0, #2
	bx ip
	.align 2, 0
_037F8718: .word sub_037F8660
	arm_func_end sub_037F870C

	arm_func_start sub_037F871C
sub_037F871C: ; 0x037F871C
	ldr ip, _037F8728 ; =sub_037F8660
	mov r0, #3
	bx ip
	.align 2, 0
_037F8728: .word sub_037F8660
	arm_func_end sub_037F871C

	arm_func_start sub_037F872C
sub_037F872C: ; 0x037F872C
	ldr ip, _037F8738 ; =sub_037F8660
	mov r0, #4
	bx ip
	.align 2, 0
_037F8738: .word sub_037F8660
	arm_func_end sub_037F872C

	arm_func_start sub_037F873C
sub_037F873C: ; 0x037F873C
	ldr ip, _037F8748 ; =sub_037F8660
	mov r0, #5
	bx ip
	.align 2, 0
_037F8748: .word sub_037F8660
	arm_func_end sub_037F873C

	arm_func_start sub_037F874C
sub_037F874C: ; 0x037F874C
	ldr ip, _037F8758 ; =sub_037F8660
	mov r0, #6
	bx ip
	.align 2, 0
_037F8758: .word sub_037F8660
	arm_func_end sub_037F874C

	arm_func_start sub_037F875C
sub_037F875C: ; 0x037F875C
	ldr ip, _037F8768 ; =sub_037F8660
	mov r0, #7
	bx ip
	.align 2, 0
_037F8768: .word sub_037F8660
	arm_func_end sub_037F875C

	arm_func_start sub_037F876C
sub_037F876C: ; 0x037F876C
	stmdb sp!, {r3, lr}
	ldr r2, _037F87B0 ; =0x027FFC3C
	ldr r0, _037F87B4 ; =0x03806BAC
	ldr r1, [r2]
	ldr r3, [r0, #0x60]
	add r0, r1, #1
	str r0, [r2]
	cmp r3, #0
	beq _037F8798
	mov lr, pc
	bx r3
_037F8798:
	ldr r1, _037F87B8 ; =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #1
	str r0, [r1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F87B0: .word 0x027FFC3C
_037F87B4: .word 0x03806BAC
_037F87B8: .word 0x0380FFF8
	arm_func_end sub_037F876C

	arm_func_start sub_037F87BC
sub_037F87BC: ; 0x037F87BC
	ldr r0, _037F87D8 ; =0x03806BA4
	mov r2, #0
	str r2, [r0, #4]
	ldr r1, _037F87DC ; =0x027FFC3C
	str r2, [r0]
	str r2, [r1]
	bx lr
	.align 2, 0
_037F87D8: .word 0x03806BA4
_037F87DC: .word 0x027FFC3C
	arm_func_end sub_037F87BC

	arm_func_start sub_037F87E0
sub_037F87E0: ; 0x037F87E0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r4, _037F8870 ; =0x03806A88
	mov sb, #0
	mov r2, #0xc
	ldr r5, _037F8874 ; =0x03806C0C
	ldr r7, _037F8878 ; =0x03806BAC
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
	stmneia sl, {r1, ip, lr}
_037F8858:
	add sb, sb, #1
	cmp sb, #0x19
	mov r0, r0, lsr #1
	blt _037F8808
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037F8870: .word 0x03806A88
_037F8874: .word 0x03806C0C
_037F8878: .word 0x03806BAC
	arm_func_end sub_037F87E0

	arm_func_start sub_037F887C
sub_037F887C: ; 0x037F887C
	stmdb sp!, {r4, lr}
	mov r3, #0xc
	mul r4, r0, r3
	ldr ip, _037F88BC ; =0x03806BDC
	ldr r3, _037F88C0 ; =0x03806BE4
	str r1, [ip, r4]
	add r0, r0, #3
	mov r1, #1
	mov r0, r1, lsl r0
	str r2, [r3, r4]
	bl sub_037F8914
	ldr r0, _037F88C4 ; =0x03806BE0
	mov r1, #1
	str r1, [r0, r4]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F88BC: .word 0x03806BDC
_037F88C0: .word 0x03806BE4
_037F88C4: .word 0x03806BE0
	arm_func_end sub_037F887C

	arm_func_start sub_037F88C8
sub_037F88C8: ; 0x037F88C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_037F88FC
	ldr r1, _037F88F8 ; =0x04000210
	ldr r3, [r1]
	sub r2, r1, #8
	str r4, [r1]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F88F8: .word 0x04000210
	arm_func_end sub_037F88C8

	arm_func_start sub_037F88FC
sub_037F88FC: ; 0x037F88FC
	ldr r2, _037F8910 ; =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_037F8910: .word 0x04000208
	arm_func_end sub_037F88FC

	arm_func_start sub_037F8914
sub_037F8914: ; 0x037F8914
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_037F88FC
	ldr ip, _037F8948 ; =0x04000210
	ldr r3, [ip]
	sub r2, ip, #8
	orr r1, r3, r4
	str r1, [ip]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F8948: .word 0x04000210
	arm_func_end sub_037F8914

	arm_func_start sub_037F894C
sub_037F894C: ; 0x037F894C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_037F88FC
	ldr ip, _037F8984 ; =0x04000210
	mvn r1, r4
	ldr r3, [ip]
	sub r2, ip, #8
	and r1, r3, r1
	str r1, [ip]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F8984: .word 0x04000210
	arm_func_end sub_037F894C

	arm_func_start sub_037F8988
sub_037F8988: ; 0x037F8988
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_037F88FC
	ldr r1, _037F89B8 ; =0x04000214
	ldr r3, [r1]
	sub r2, r1, #0xc
	str r4, [r1]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F89B8: .word 0x04000214
	arm_func_end sub_037F8988

	arm_func_start sub_037F89BC
sub_037F89BC: ; 0x037F89BC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _037F8A24 ; =0x03806C18
	ldr r1, [r0]
	cmp r1, #0
	bne _037F8A1C
	ldr r4, _037F8A28 ; =0x027FFFF0
	mov r2, #1
	mov r1, #0
	str r2, [r0]
	strh r1, [r4, #6]
	mov r5, #0x400
	b _037F89F4
_037F89EC:
	mov r0, r5
	bl sub_037F8A30
_037F89F4:
	ldrh r0, [r4, #4]
	cmp r0, #0x7f
	bne _037F89EC
	ldr r1, _037F8A2C ; =0x027FFFB8
	mvn r0, #0
	str r0, [r1]
	mov r0, r0, lsl #0x10
	str r0, [r1, #4]
	mov r0, #0xbf
	strh r0, [r4, #6]
_037F8A1C:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F8A24: .word 0x03806C18
_037F8A28: .word 0x027FFFF0
_037F8A2C: .word 0x027FFFB8
	arm_func_end sub_037F89BC

	arm_func_start sub_037F8A30
sub_037F8A30: ; 0x037F8A30
	ldr ip, _037F8A38 ; =sub_038008A8
	bx ip
	.align 2, 0
_037F8A38: .word sub_038008A8
	arm_func_end sub_037F8A30

	arm_func_start sub_037F8A3C
sub_037F8A3C: ; 0x037F8A3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	ldrh r1, [r7, #4]
	mov r6, r2
	cmp r0, r1
	mov r5, r3
	mvnne r0, #1
	bne _037F8AB0
	cmp r5, #0
	beq _037F8A6C
	bl sub_037FAD50
	b _037F8A70
_037F8A6C:
	bl OS_DisableInterrupts
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
	bl sub_037FAD64
	b _037F8AAC
_037F8AA8:
	bl OS_RestoreInterrupts
_037F8AAC:
	mov r0, #0
_037F8AB0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_037F8A3C

	arm_func_start sub_037F8AB8
sub_037F8AB8: ; 0x037F8AB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r6, r3
	mov sb, r0
	mov r8, r1
	mov r7, r2
	beq _037F8AD8
	bl sub_037FAD50
	b _037F8ADC
_037F8AD8:
	bl OS_DisableInterrupts
_037F8ADC:
	mov r5, r0
	mov r0, sb
	mov r1, r8
	bl sub_037FB240
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
	bl sub_037FAD64
	b _037F8B20
_037F8B1C:
	bl OS_RestoreInterrupts
_037F8B20:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end sub_037F8AB8

	arm_func_start sub_037F8B2C
sub_037F8B2C: ; 0x037F8B2C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, _037F8B74 ; =0x027FFFE8
	ldr r5, _037F8B78 ; =sub_037F8BC8
	mov r8, r0
	mov r7, #0x400
	mov r4, #1
	b _037F8B50
_037F8B48:
	mov r0, r7
	bl sub_037F8A30
_037F8B50:
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl sub_037F8AB8
	cmp r0, #0
	bgt _037F8B48
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037F8B74: .word 0x027FFFE8
_037F8B78: .word sub_037F8BC8
	arm_func_end sub_037F8B2C

	arm_func_start sub_037F8B7C
sub_037F8B7C: ; 0x037F8B7C
	ldr ip, _037F8B90 ; =sub_037F8A3C
	ldr r1, _037F8B94 ; =0x027FFFE8
	ldr r2, _037F8B98 ; =sub_037F8BCC
	mov r3, #1
	bx ip
	.align 2, 0
_037F8B90: .word sub_037F8A3C
_037F8B94: .word 0x027FFFE8
_037F8B98: .word sub_037F8BCC
	arm_func_end sub_037F8B7C

	arm_func_start sub_037F8B9C
sub_037F8B9C: ; 0x037F8B9C
	ldr r1, _037F8BA4 ; =sub_037F8B7C
	bx r1
	.align 2, 0
_037F8BA4: .word sub_037F8B7C
	arm_func_end sub_037F8B9C

	arm_func_start sub_037F8BA8
sub_037F8BA8: ; 0x037F8BA8
	ldr ip, _037F8BBC ; =sub_037F8AB8
	ldr r1, _037F8BC0 ; =0x027FFFE8
	ldr r2, _037F8BC4 ; =sub_037F8BC8
	mov r3, #1
	bx ip
	.align 2, 0
_037F8BBC: .word sub_037F8AB8
_037F8BC0: .word 0x027FFFE8
_037F8BC4: .word sub_037F8BC8
	arm_func_end sub_037F8BA8

	arm_func_start sub_037F8BC8
sub_037F8BC8: ; 0x037F8BC8
	bx lr
	arm_func_end sub_037F8BC8

	arm_func_start sub_037F8BCC
sub_037F8BCC: ; 0x037F8BCC
	bx lr
	arm_func_end sub_037F8BCC

	arm_func_start sub_037F8BD0
sub_037F8BD0: ; 0x037F8BD0
	ldr ip, _037F8BE4 ; =sub_037F8A3C
	ldr r1, _037F8BE8 ; =0x027FFFE0
	ldr r2, _037F8BEC ; =sub_037F8C14
	mov r3, #0
	bx ip
	.align 2, 0
_037F8BE4: .word sub_037F8A3C
_037F8BE8: .word 0x027FFFE0
_037F8BEC: .word sub_037F8C14
	arm_func_end sub_037F8BD0

	arm_func_start sub_037F8BF0
sub_037F8BF0: ; 0x037F8BF0
	ldr ip, _037F8C04 ; =sub_037F8AB8
	ldr r1, _037F8C08 ; =0x027FFFE0
	ldr r2, _037F8C0C ; =sub_037F8C10
	mov r3, #0
	bx ip
	.align 2, 0
_037F8C04: .word sub_037F8AB8
_037F8C08: .word 0x027FFFE0
_037F8C0C: .word sub_037F8C10
	arm_func_end sub_037F8BF0

	arm_func_start sub_037F8C10
sub_037F8C10: ; 0x037F8C10
	bx lr
	arm_func_end sub_037F8C10

	arm_func_start sub_037F8C14
sub_037F8C14: ; 0x037F8C14
	bx lr
	arm_func_end sub_037F8C14

	arm_func_start sub_037F8C18
sub_037F8C18: ; 0x037F8C18
	ldrh r0, [r0, #4]
	bx lr
	arm_func_end sub_037F8C18

	arm_func_start sub_037F8C20
sub_037F8C20: ; 0x037F8C20
	ldr r3, _037F8CB0 ; =0x027FFFB8
	ldr r1, [r3]
	mov r2, #0
	mov r0, #-0x80000000
_037F8C30:
	tst r1, r0
	bne _037F8C4C
	add r2, r2, #1
	cmp r2, #0x20
	beq _037F8C4C
	mov r0, r0, lsr #1
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
	mov r0, r0, lsr #1
	b _037F8C68
_037F8C84:
	cmp r2, #0x20
	ldr r0, _037F8CB4 ; =0xFFFFFFFD
	bxeq lr
	mov r0, #0xa0
_037F8C94:
	add r0, r0, r2
	mov r1, #-0x80000000
	mov r1, r1, lsr r2
	ldr r2, [r3]
	bic r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_037F8CB0: .word 0x027FFFB8
_037F8CB4: .word 0xFFFFFFFD
	arm_func_end sub_037F8C20

	arm_func_start sub_037F8CB8
sub_037F8CB8: ; 0x037F8CB8
	ldr r3, _037F8CE4 ; =0x027FFFB8
	cmp r0, #0xa0
	addpl r3, r3, #4
	subpl r0, r0, #0xa0
	submi r0, r0, #0x80
	mov r1, #-0x80000000
	mov r1, r1, lsr r0
	ldr r2, [r3]
	orr r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_037F8CE4: .word 0x027FFFB8
	arm_func_end sub_037F8CB8

