	.include "asm/macros.inc"
	.include "global.inc"

	.text

	arm_func_start DLExtract
DLExtract: ; 0x037F9BC8
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
	arm_func_end DLExtract

	arm_func_start DLInsert
DLInsert: ; 0x037F9BF0
	stmdb sp!, {r3, lr}
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
	stmia r1, {ip, lr}
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
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end DLInsert

	arm_func_start sub_037F9C98
sub_037F9C98: ; 0x037F9C98
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, r1
	mov r7, r2
	bl OS_DisableInterrupts
	ldr r1, _037F9DA4 ; =0x03806D9C
	mov r6, r0
	ldr r1, [r1, r4, lsl #2]
	cmp r1, #0
	bne _037F9CCC
	bl OS_RestoreInterrupts
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
	bl OS_RestoreInterrupts
	mov r0, #0
	b _037F9D9C
_037F9D24:
	ldr r1, [r5, #8]
	sub r1, r1, r7
	cmp r1, #0x40
	bhs _037F9D44
	mov r1, r5
	bl DLExtract
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
	stmia r5, {r0, r1}
	cmp r1, #0
	strne r5, [r1]
	mov r0, r6
	str r5, [r4, #8]
	bl OS_RestoreInterrupts
	add r0, r5, #0x20
_037F9D9C:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F9DA4: .word 0x03806D9C
	arm_func_end sub_037F9C98

	arm_func_start sub_037F9DA8
sub_037F9DA8: ; 0x037F9DA8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl OS_DisableInterrupts
	ldr r1, _037F9E10 ; =0x03806D9C
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
	bl DLExtract
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	mov r1, r5
	bl DLInsert
	str r0, [r7, #4]
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F9E10: .word 0x03806D9C
	arm_func_end sub_037F9DA8

	arm_func_start sub_037F9E14
sub_037F9E14: ; 0x037F9E14
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl OS_DisableInterrupts
	ldr r1, _037F9E44 ; =0x03806D9C
	ldr r1, [r1, r4, lsl #2]
	ldr r4, [r1]
	str r5, [r1]
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F9E44: .word 0x03806D9C
	arm_func_end sub_037F9E14

	arm_func_start sub_037F9E48
sub_037F9E48: ; 0x037F9E48
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r5, r1
	mov r4, r2
	mov r6, r3
	bl OS_DisableInterrupts
	ldr r2, _037F9EEC ; =0x03806D9C
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
	bl OS_RestoreInterrupts
	ldr r0, [r5, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F9EEC: .word 0x03806D9C
	arm_func_end sub_037F9E48

	arm_func_start sub_037F9EF0
sub_037F9EF0: ; 0x037F9EF0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r6, r1
	mov r5, r2
	bl OS_DisableInterrupts
	ldr r2, _037F9F8C ; =0x03806D9C
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
	bl OS_RestoreInterrupts
	mov r0, r4
	b _037F9F84
_037F9F70:
	add r4, r4, #1
_037F9F74:
	cmp r4, r7
	blt _037F9F28
	bl OS_RestoreInterrupts
	mvn r0, #0
_037F9F84:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F9F8C: .word 0x03806D9C
	arm_func_end sub_037F9EF0

	arm_func_start sub_037F9F90
sub_037F9F90: ; 0x037F9F90
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, #0
	mov r8, r0
	mov r7, r1
	mov r5, r4
	sub r6, r4, #1
	bl OS_DisableInterrupts
	ldr r1, _037FA12C ; =0x03806D9C
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
	bl OS_RestoreInterrupts
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FA12C: .word 0x03806D9C
	arm_func_end sub_037F9F90

	arm_func_start sub_037FA130
sub_037FA130: ; 0x037FA130
	ldr r1, _037FA148 ; =0x03806DC0
	mov r2, #1
	ldrh r3, [r1]
	orr r0, r3, r2, lsl r0
	strh r0, [r1]
	bx lr
	.align 2, 0
_037FA148: .word 0x03806DC0
	arm_func_end sub_037FA130

	arm_func_start OS_InitTick
OS_InitTick: ; 0x037FA14C
	stmdb sp!, {r3, lr}
	ldr r1, _037FA1BC ; =0x03806DC4
	ldrh r0, [r1]
	cmp r0, #0
	bne _037FA1B4
	mov r2, #1
	mov r0, #0
	strh r2, [r1]
	bl sub_037FA130
	ldr r0, _037FA1BC ; =0x03806DC4
	mov r2, #0
	str r2, [r0, #8]
	ldr r3, _037FA1C0 ; =0x04000102
	str r2, [r0, #0xc]
	strh r2, [r3]
	ldr r1, _037FA1C4 ; =sub_037FA1D8
	strh r2, [r3, #-2]
	mov r2, #0xc1
	mov r0, #8
	strh r2, [r3]
	bl OS_SetIrqFunction
	mov r0, #8
	bl OS_EnableIrqMask
	ldr r0, _037FA1BC ; =0x03806DC4
	mov r1, #0
	str r1, [r0, #4]
_037FA1B4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FA1BC: .word 0x03806DC4
_037FA1C0: .word 0x04000102
_037FA1C4: .word sub_037FA1D8
	arm_func_end OS_InitTick

	arm_func_start sub_037FA1C8
sub_037FA1C8: ; 0x037FA1C8
	ldr r0, _037FA1D4 ; =0x03806DC4
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_037FA1D4: .word 0x03806DC4
	arm_func_end sub_037FA1C8

	arm_func_start sub_037FA1D8
sub_037FA1D8: ; 0x037FA1D8
	ldr r0, _037FA230 ; =0x03806DC4
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
	ldr r2, _037FA234 ; =0x04000102
	mov r1, #0xc1
	strh r3, [r2]
	strh r3, [r2, #-2]
	strh r1, [r2]
	str r3, [r0, #4]
_037FA21C:
	ldr ip, _037FA238 ; =OSi_EnterTimerCallback
	mov r0, #0
	ldr r1, _037FA23C ; =sub_037FA1D8
	mov r2, r0
	bx ip
	.align 2, 0
_037FA230: .word 0x03806DC4
_037FA234: .word 0x04000102
_037FA238: .word OSi_EnterTimerCallback
_037FA23C: .word sub_037FA1D8
	arm_func_end sub_037FA1D8

	arm_func_start sub_037FA240
sub_037FA240: ; 0x037FA240
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl OS_DisableInterrupts
	ldr lr, _037FA2D8 ; =0x04000100
	ldr r1, _037FA2DC ; =0x03806DC4
	ldrh r3, [lr]
	ldr r2, _037FA2E0 ; =0x0000FFFF
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
	bl OS_RestoreInterrupts
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	ldrh r0, [sp]
	mov r1, r1, lsl #0x10
	orr r1, r1, r2, lsr #16
	orr r1, r1, r0, asr #31
	orr r0, r0, r2, lsl #16
	add sp, sp, #0xc
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_037FA2D8: .word 0x04000100
_037FA2DC: .word 0x03806DC4
_037FA2E0: .word 0x0000FFFF
	arm_func_end sub_037FA240

	arm_func_start sub_037FA2E4
sub_037FA2E4: ; 0x037FA2E4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_037FA240
	ldr r3, _037FA360 ; =0x04000106
	mov r2, #0
	strh r2, [r3]
	ldr ip, [r4, #0xc]
	ldr r3, [r4, #0x10]
	subs r5, ip, r0
	sbc r4, r3, r1
	ldr r1, _037FA364 ; =sub_037FA66C
	mov r0, #1
	bl OSi_EnterTimerCallback
	subs r0, r5, #0
	mov r3, #0
	sbcs r0, r4, #0
	ldrlt r3, _037FA368 ; =0x0000FFFE
	blt _037FA340
	subs r0, r5, #0x10000
	sbcs r0, r4, r3
	mvnlt r0, r5
	movlt r0, r0, lsl #0x10
	movlt r3, r0, lsr #0x10
_037FA340:
	ldr r2, _037FA36C ; =0x04000104
	mov r1, #0xc1
	strh r3, [r2]
	mov r0, #0x10
	strh r1, [r2, #2]
	bl OS_EnableIrqMask
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FA360: .word 0x04000106
_037FA364: .word sub_037FA66C
_037FA368: .word 0x0000FFFE
_037FA36C: .word 0x04000104
	arm_func_end sub_037FA2E4

	arm_func_start OS_InitAlarm
OS_InitAlarm: ; 0x037FA370
	stmdb sp!, {r3, lr}
	ldr r1, _037FA3B0 ; =0x03806DD4
	ldrh r0, [r1]
	cmp r0, #0
	bne _037FA3A8
	mov r0, #1
	strh r0, [r1]
	bl sub_037FA130
	ldr r1, _037FA3B0 ; =0x03806DD4
	mov r2, #0
	str r2, [r1, #4]
	mov r0, #0x10
	str r2, [r1, #8]
	bl OS_DisableIrqMask
_037FA3A8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FA3B0: .word 0x03806DD4
	arm_func_end OS_InitAlarm

	arm_func_start sub_037FA3B4
sub_037FA3B4: ; 0x037FA3B4
	ldr r0, _037FA3C0 ; =0x03806DD4
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_037FA3C0: .word 0x03806DD4
	arm_func_end sub_037FA3B4

	arm_func_start OS_CreateAlarm
OS_CreateAlarm: ; 0x037FA3C4
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	bx lr
	arm_func_end OS_CreateAlarm

	arm_func_start sub_037FA3D4
sub_037FA3D4: ; 0x037FA3D4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0x20]
	ldr r3, [r8, #0x1c]
	cmp r0, #0
	mov r7, r1
	mov r6, r2
	cmpeq r3, #0
	beq _037FA448
	bl sub_037FA240
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
	bl sub_03806214
	adds r2, r0, #1
	adc r0, r1, #0
	umull r3, r1, r5, r2
	mla r1, r5, r0, r1
	mla r1, r4, r2, r1
	adds r7, r7, r3
	adc r6, r6, r1
_037FA448:
	str r7, [r8, #0xc]
	ldr r0, _037FA4FC ; =0x03806DD4
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
	ldr r1, _037FA4FC ; =0x03806DD4
	mov r0, r8
	str r8, [r1, #4]
	bl sub_037FA2E4
	b _037FA4F4
_037FA4B4:
	ldr r5, [r5, #0x18]
_037FA4B8:
	cmp r5, #0
	bne _037FA464
	ldr r1, _037FA4FC ; =0x03806DD4
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
	bl sub_037FA2E4
_037FA4F4:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FA4FC: .word 0x03806DD4
	arm_func_end sub_037FA3D4

	arm_func_start OS_SetAlarm
OS_SetAlarm: ; 0x037FA500
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	beq _037FA524
	ldr r0, [r6]
	cmp r0, #0
	beq _037FA528
_037FA524:
	bl OS_Terminate
_037FA528:
	bl OS_DisableInterrupts
	mov r1, #0
	str r1, [r6, #0x1c]
	str r1, [r6, #0x20]
	str r7, [r6]
	ldr r1, [sp, #0x18]
	mov r7, r0
	str r1, [r6, #4]
	bl sub_037FA240
	adds r3, r5, r0
	adc r2, r4, r1
	mov r0, r6
	mov r1, r3
	bl sub_037FA3D4
	mov r0, r7
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end OS_SetAlarm

	arm_func_start sub_037FA570
sub_037FA570: ; 0x037FA570
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
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
	bl OS_Terminate
_037FA59C:
	bl OS_DisableInterrupts
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
	bl sub_037FA3D4
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end sub_037FA570

	arm_func_start sub_037FA5E4
sub_037FA5E4: ; 0x037FA5E4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _037FA608
	bl OS_RestoreInterrupts
	b _037FA660
_037FA608:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	ldreq r2, [r5, #0x14]
	ldreq r1, _037FA668 ; =0x03806DD4
	streq r2, [r1, #8]
	ldrne r1, [r5, #0x14]
	strne r1, [r0, #0x14]
	ldr r1, [r5, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _037FA648
	ldr r1, _037FA668 ; =0x03806DD4
	cmp r0, #0
	str r0, [r1, #4]
	beq _037FA648
	bl sub_037FA2E4
_037FA648:
	mov r1, #0
	str r1, [r5]
	str r1, [r5, #0x1c]
	mov r0, r4
	str r1, [r5, #0x20]
	bl OS_RestoreInterrupts
_037FA660:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FA668: .word 0x03806DD4
	arm_func_end sub_037FA5E4

	arm_func_start sub_037FA66C
sub_037FA66C: ; 0x037FA66C
	stmdb sp!, {r0, lr}
	bl sub_037FA67C
	ldmia sp!, {r0, lr}
	bx lr
	arm_func_end sub_037FA66C

	arm_func_start sub_037FA67C
sub_037FA67C: ; 0x037FA67C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _037FA764 ; =0x04000106
	mov r2, #0
	mov r0, #0x10
	strh r2, [r1]
	bl OS_DisableIrqMask
	ldr r1, _037FA768 ; =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #0x10
	str r0, [r1]
	bl sub_037FA240
	ldr r2, _037FA76C ; =0x03806DD4
	ldr r4, [r2, #4]
	cmp r4, #0
	beq _037FA75C
	ldr r3, [r4, #0x10]
	ldr ip, [r4, #0xc]
	cmp r1, r3
	cmpeq r0, ip
	bhs _037FA6D8
	mov r0, r4
	bl sub_037FA2E4
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
	bl sub_037FA3D4
_037FA748:
	ldr r0, _037FA76C ; =0x03806DD4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _037FA75C
	bl sub_037FA2E4
_037FA75C:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FA764: .word 0x04000106
_037FA768: .word 0x0380FFF8
_037FA76C: .word 0x03806DD4
	arm_func_end sub_037FA67C

	arm_func_start sub_037FA770
sub_037FA770: ; 0x037FA770
	stmdb sp!, {r3, lr}
	ldr r1, _037FA7B8 ; =0x03806DE0
	ldrh r0, [r1]
	cmp r0, #0
	bne _037FA7B0
	mov r0, #1
	strh r0, [r1]
	mov r2, #0
	str r2, [r1, #0xc]
	mov r0, #4
	str r2, [r1, #0x10]
	bl OS_DisableIrqMask
	ldr r0, _037FA7B8 ; =0x03806DE0
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_037FA7B0:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FA7B8: .word 0x03806DE0
	arm_func_end sub_037FA770

	arm_func_start sub_037FA7BC
sub_037FA7BC: ; 0x037FA7BC
	ldr r0, _037FA7C8 ; =0x03806DE0
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_037FA7C8: .word 0x03806DE0
	arm_func_end sub_037FA7BC

	arm_func_start sub_037FA7CC
sub_037FA7CC: ; 0x037FA7CC
	stmdb sp!, {r3, lr}
	ldr r1, _037FA86C ; =0x03806DE0
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
	ldr r1, _037FA86C ; =0x03806DE0
	str r0, [r1, #0xc]
	bl sub_037FA9DC
	b _037FA864
_037FA82C:
	ldr r3, [r3, #0x18]
_037FA830:
	cmp r3, #0
	bne _037FA7DC
	ldr r1, _037FA86C ; =0x03806DE0
	mov r2, #0
	ldr r3, [r1, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r0, [r1, #0x10]
	cmp r3, #0
	strne r0, [r3, #0x18]
	bne _037FA864
	str r0, [r1, #0xc]
	bl sub_037FA9DC
_037FA864:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FA86C: .word 0x03806DE0
	arm_func_end sub_037FA7CC

	arm_func_start sub_037FA870
sub_037FA870: ; 0x037FA870
	cmp r0, #0
	bxeq lr
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x14]
	cmp r2, #0
	ldreq r0, _037FA8A4 ; =0x03806DE0
	strne r1, [r2, #0x14]
	streq r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, _037FA8A4 ; =0x03806DE0
	strne r2, [r1, #0x18]
	streq r2, [r0, #0xc]
	bx lr
	.align 2, 0
_037FA8A4: .word 0x03806DE0
	arm_func_end sub_037FA870

	arm_func_start sub_037FA8A8
sub_037FA8A8: ; 0x037FA8A8
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_037FA8A8

	arm_func_start sub_037FA8BC
sub_037FA8BC: ; 0x037FA8BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl OS_DisableInterrupts
	mov r4, r0
	cmp r8, #0
	beq _037FA8EC
	ldr r0, [r8]
	cmp r0, #0
	beq _037FA8F0
_037FA8EC:
	bl OS_Terminate
_037FA8F0:
	ldr r0, _037FA948 ; =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl sub_037FACCC
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
	bl sub_037FA7CC
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FA948: .word 0x04000006
	arm_func_end sub_037FA8BC

	arm_func_start sub_037FA94C
sub_037FA94C: ; 0x037FA94C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl OS_DisableInterrupts
	mov r4, r0
	cmp r8, #0
	beq _037FA97C
	ldr r0, [r8]
	cmp r0, #0
	beq _037FA980
_037FA97C:
	bl OS_Terminate
_037FA980:
	ldr r0, _037FA9D8 ; =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl sub_037FACCC
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
	bl sub_037FA7CC
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FA9D8: .word 0x04000006
	arm_func_end sub_037FA94C

	arm_func_start sub_037FA9DC
sub_037FA9DC: ; 0x037FA9DC
	stmdb sp!, {r4, lr}
	ldr r1, _037FAA30 ; =sub_037FAB1C
	mov r4, r0
	mov r0, #4
	bl OS_SetIrqFunction
	ldrsh r3, [r4, #0x10]
	ldr r2, _037FAA34 ; =0x04000004
	mov r0, r3, lsl #0x18
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
	bl OS_EnableIrqMask
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FAA30: .word sub_037FAB1C
_037FAA34: .word 0x04000004
	arm_func_end sub_037FA9DC

	arm_func_start sub_037FAA38
sub_037FAA38: ; 0x037FAA38
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	bne _037FAA4C
	bl OS_Terminate
_037FAA4C:
	cmp r5, #0
	strne r4, [r5, #8]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FAA38

	arm_func_start sub_037FAA5C
sub_037FAA5C: ; 0x037FAA5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	mov r1, #1
	str r1, [r5, #0x24]
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _037FAA88
	bl OS_RestoreInterrupts
	b _037FAAA0
_037FAA88:
	mov r0, r5
	bl sub_037FA870
	mov r1, #0
	mov r0, r4
	str r1, [r5]
	bl OS_RestoreInterrupts
_037FAAA0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FAA5C

	arm_func_start sub_037FAAA8
sub_037FAAA8: ; 0x037FAAA8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl OS_DisableInterrupts
	mov r5, r0
	cmp r7, #0
	bne _037FAAC4
	bl OS_Terminate
_037FAAC4:
	ldr r0, _037FAB18 ; =0x03806DE0
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
	bl sub_037FAA5C
_037FAAF0:
	mov r0, r6
	cmp r6, #0
	ldrne r6, [r6, #0x18]
	moveq r6, r4
_037FAB00:
	cmp r0, #0
	bne _037FAAE0
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FAB18: .word 0x03806DE0
	arm_func_end sub_037FAAA8

	arm_func_start sub_037FAB1C
sub_037FAB1C: ; 0x037FAB1C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #4
	bl OS_DisableIrqMask
	ldr r2, _037FACBC ; =0x04000004
	ldr r1, _037FACC0 ; =0x0380FFF8
	ldrh r0, [r2]
	bic r0, r0, #0x20
	strh r0, [r2]
	ldr r0, [r1]
	orr r0, r0, #4
	str r0, [r1]
	ldrh r0, [r2]
	mov r1, r0, asr #8
	mov r0, r0, lsl #1
	and r1, r1, #0xff
	and r0, r0, #0x100
	orr r0, r1, r0
	sub r0, r0, #1
	bl sub_037FACCC
	ldr sl, _037FACC4 ; =0x04000006
	mov r6, #0
	ldr r5, _037FACC8 ; =0x03806DE0
	sub r7, sl, #2
	mov fp, #1
	mov r8, r6
	b _037FACA8
_037FAB84:
	ldrh sb, [sl]
	mov r0, sb
	bl sub_037FACCC
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
	bl sub_037FA9DC
	ldrh r1, [sl]
	ldrsh r0, [r4, #0x10]
	cmp r0, r1
	ldreq r0, [r4, #0xc]
	cmpeq r0, sb
	bne _037FACB4
	mov r0, #4
	bl OS_DisableIrqMask
	ldrh r1, [r7]
	mov r0, #4
	bic r1, r1, #0x20
	strh r1, [r7]
	bl OS_ResetRequestIrqMask
_037FAC34:
	ldr sb, [r4]
	mov r0, r4
	bl sub_037FA870
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
	bl sub_037FA7CC
	b _037FACA8
_037FAC8C:
	mov r0, r4
	bl sub_037FA870
	ldr r1, [r5, #8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r4, #0xc]
	bl sub_037FA7CC
_037FACA8:
	ldr r4, [r5, #0xc]
	cmp r4, #0
	bne _037FAB84
_037FACB4:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FACBC: .word 0x04000004
_037FACC0: .word 0x0380FFF8
_037FACC4: .word 0x04000006
_037FACC8: .word 0x03806DE0
	arm_func_end sub_037FAB1C

	arm_func_start sub_037FACCC
sub_037FACCC: ; 0x037FACCC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r1, _037FAD0C ; =0x03806DE0
	ldr r2, [r1, #4]
	cmp r4, r2
	ldrlt r2, [r1, #8]
	addlt r2, r2, #1
	strlt r2, [r1, #8]
	ldr r1, _037FAD0C ; =0x03806DE0
	str r4, [r1, #4]
	bl OS_RestoreInterrupts
	ldr r0, _037FAD0C ; =0x03806DE0
	ldr r0, [r0, #8]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FAD0C: .word 0x03806DE0
	arm_func_end sub_037FACCC

	arm_func_start sub_037FAD10
sub_037FAD10: ; 0x037FAD10
	mrs r0, cpsr
	bic r1, r0, #0x80
	msr cpsr_c, r1
	and r0, r0, #0x80
	bx lr
	arm_func_end sub_037FAD10

	arm_func_start OS_DisableInterrupts
OS_DisableInterrupts: ; 0x037FAD24
	mrs r0, cpsr
	orr r1, r0, #0x80
	msr cpsr_c, r1
	and r0, r0, #0x80
	bx lr
	arm_func_end OS_DisableInterrupts

	arm_func_start OS_RestoreInterrupts
OS_RestoreInterrupts: ; 0x037FAD38
	mrs r1, cpsr
	bic r2, r1, #0x80
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #0x80
	bx lr
	arm_func_end OS_RestoreInterrupts

	arm_func_start OS_DisableInterrupts_IrqAndFiq
OS_DisableInterrupts_IrqAndFiq: ; 0x037FAD50
	mrs r0, cpsr
	orr r1, r0, #0xc0
	msr cpsr_c, r1
	and r0, r0, #0xc0
	bx lr
	arm_func_end OS_DisableInterrupts_IrqAndFiq

	arm_func_start OS_RestoreInterrupts_IrqAndFiq
OS_RestoreInterrupts_IrqAndFiq: ; 0x037FAD64
	mrs r1, cpsr
	bic r2, r1, #0xc0
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #0xc0
	bx lr
	arm_func_end OS_RestoreInterrupts_IrqAndFiq

	arm_func_start OS_GetProcMode
OS_GetProcMode: ; 0x037FAD7C
	mrs r0, cpsr
	and r0, r0, #0x1f
	bx lr
	arm_func_end OS_GetProcMode

	arm_func_start sub_037FAD88
sub_037FAD88: ; 0x037FAD88
	ldr ip, _037FAD9C ; =SVC_WaitByLoop
	mov r1, r0, asr #1
	add r0, r0, r1, lsr #30
	mov r0, r0, asr #2
	bx ip
	.align 2, 0
_037FAD9C: .word SVC_WaitByLoop
	arm_func_end sub_037FAD88

	arm_func_start OS_InitReset
OS_InitReset: ; 0x037FADA0
	stmdb sp!, {r3, lr}
	ldr r2, _037FADD0 ; =0x03806DF4
	ldrh r0, [r2]
	cmp r0, #0
	bne _037FADC8
	ldr r1, _037FADD4 ; =OSi_CommonCallback
	mov r3, #1
	mov r0, #0xc
	strh r3, [r2]
	bl PXI_SetFifoRecvCallback
_037FADC8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FADD0: .word 0x03806DF4
_037FADD4: .word OSi_CommonCallback
	arm_func_end OS_InitReset

	arm_func_start sub_037FADD8
sub_037FADD8: ; 0x037FADD8
	ldr r0, _037FADE4 ; =0x03806DF4
	ldrh r0, [r0, #2]
	bx lr
	.align 2, 0
_037FADE4: .word 0x03806DF4
	arm_func_end sub_037FADD8

	arm_func_start OSi_CommonCallback
OSi_CommonCallback: ; 0x037FADE8
	stmdb sp!, {r3, lr}
	and r0, r1, #0x7f00
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	cmp r0, #0x10
	ldreq r0, _037FAE18 ; =0x03806DF4
	moveq r1, #1
	streqh r1, [r0, #2]
	beq _037FAE10
	bl OS_Terminate
_037FAE10:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FAE18: .word 0x03806DF4
	arm_func_end OSi_CommonCallback

	arm_func_start sub_037FAE1C
sub_037FAE1C: ; 0x037FAE1C
	stmdb sp!, {r4, r5, r6, lr}
	mov r0, #0
	bl sub_037FAF18
	mov r0, #1
	bl sub_037FAF18
	mov r0, #2
	bl sub_037FAF18
	mov r0, #3
	bl sub_037FAF18
	mov r0, #0x40000
	bl OS_SetIrqMask
	mvn r0, #0
	bl OS_ResetRequestIrqMask
	bl sub_037FB648
	mov r6, #0xc
	mov r5, #0x1000
	mov r4, #0
_037FAE60:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	bne _037FAE60
	ldr r0, _037FAE90 ; =0x04000208
	mov r1, #0
	strh r1, [r0]
	bl OSi_DoBoot
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FAE90: .word 0x04000208
	arm_func_end sub_037FAE1C

	arm_func_start OS_Terminate
OS_Terminate: ; 0x037FAE94
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_038034B0
_037FAEA0:
	bl OS_DisableInterrupts
	bl sub_037F847C
	b _037FAEA0
	arm_func_end OS_Terminate

	arm_func_start sub_037FAEAC
sub_037FAEAC: ; 0x037FAEAC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	add r1, r4, r4, lsl #1
	add r1, r1, #2
	mov r1, r1, lsl #2
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
	ldr r1, _037FAF14 ; =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_037FAF08:
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FAF14: .word 0x81400001
	arm_func_end sub_037FAEAC

	arm_func_start sub_037FAF18
sub_037FAF18: ; 0x037FAF18
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	mov r1, #6
	mul r1, r4, r1
	add r1, r1, #5
	mov r1, r1, lsl #1
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
	ldr r1, _037FAF94 ; =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_037FAF88:
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FAF94: .word 0x81400001
	arm_func_end sub_037FAF18

	arm_func_start sub_037FAF98
sub_037FAF98: ; 0x037FAF98
	mov r3, #0
_037FAF9C:
	cmp r3, r2
	strlth r0, [r1, r3]
	addlt r3, r3, #2
	blt _037FAF9C
	bx lr
	arm_func_end sub_037FAF98

	arm_func_start sub_037FAFB0
sub_037FAFB0: ; 0x037FAFB0
	mov ip, #0
_037FAFB4:
	cmp ip, r2
	ldrlth r3, [r0, ip]
	strlth r3, [r1, ip]
	addlt ip, ip, #2
	blt _037FAFB4
	bx lr
	arm_func_end sub_037FAFB0

	arm_func_start MIi_CpuClear32
MIi_CpuClear32: ; 0x037FAFCC
	add ip, r1, r2
_037FAFD0:
	cmp r1, ip
	stmltia r1!, {r0}
	blt _037FAFD0
	bx lr
	arm_func_end MIi_CpuClear32

	arm_func_start sub_037FAFE0
sub_037FAFE0: ; 0x037FAFE0
	add ip, r1, r2
_037FAFE4:
	cmp r1, ip
	ldmltia r0!, {r2}
	stmltia r1!, {r2}
	blt _037FAFE4
	bx lr
	arm_func_end sub_037FAFE0

	arm_func_start sub_037FAFF8
sub_037FAFF8: ; 0x037FAFF8
	stmdb sp!, {r4, r5, r6, r7, r8, sb}
	add sb, r1, r2
	mov ip, r2, lsr #5
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
	stmltia r1!, {r0, r2, r3, r4, r5, r6, r7, r8}
	blt _037FB024
_037FB030:
	cmp r1, sb
	stmltia r1!, {r0}
	blt _037FB030
	ldmia sp!, {r4, r5, r6, r7, r8, sb}
	bx lr
	arm_func_end sub_037FAFF8

	arm_func_start sub_037FB044
sub_037FB044: ; 0x037FB044
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl}
	add sl, r1, r2
	mov ip, r2, lsr #5
	add ip, r1, ip, lsl #5
_037FB054:
	cmp r1, ip
	ldmltia r0!, {r2, r3, r4, r5, r6, r7, r8, sb}
	stmltia r1!, {r2, r3, r4, r5, r6, r7, r8, sb}
	blt _037FB054
_037FB064:
	cmp r1, sl
	ldmltia r0!, {r2}
	stmltia r1!, {r2}
	blt _037FB064
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl}
	bx lr
	arm_func_end sub_037FB044

	arm_func_start sub_037FB07C
sub_037FB07C: ; 0x037FB07C
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
	strneh r1, [r0], #2
_037FB0F0:
	tst r2, #1
	bxeq lr
	ldrh r3, [r0]
	and r3, r3, #0xff00
	and r1, r1, #0xff
	orr r1, r1, r3
	strh r1, [r0]
	bx lr
	arm_func_end sub_037FB07C

	arm_func_start sub_037FB110
sub_037FB110: ; 0x037FB110
	cmp r2, #0
	bxeq lr
	tst r1, #1
	beq _037FB150
	ldrh ip, [r1, #-1]
	and ip, ip, #0xff
	tst r0, #1
	ldrneh r3, [r0, #-1]
	movne r3, r3, lsr #8
	ldreqh r3, [r0]
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
	mov r3, ip, lsr #8
	subs r2, r2, #2
	blo _037FB188
_037FB170:
	ldrh ip, [r0], #2
	orr ip, r3, ip, lsl #8
	strh ip, [r1], #2
	mov r3, ip, lsr #0x10
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
	ldrneh r3, [r0], #2
	strneh r3, [r1], #2
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
	arm_func_end sub_037FB110

	arm_func_start MI_SwapWord
MI_SwapWord: ; 0x037FB240
	.word 0xE1010090
	bx lr
	arm_func_end MI_SwapWord

	arm_func_start PXI_Init
PXI_Init: ; 0x037FB248
	ldr ip, _037FB250 ; =sub_037FB254
	bx ip
	.align 2, 0
_037FB250: .word sub_037FB254
	arm_func_end PXI_Init

	arm_func_start sub_037FB254
sub_037FB254: ; 0x037FB254
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	bl OS_DisableInterrupts
	ldr r1, _037FB314 ; =0x03806DF8
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _037FB304
	ldr r0, _037FB318 ; =0x027FFC00
	mov r2, #1
	strh r2, [r1]
	mov r2, #0
	str r2, [r0, #0x38c]
	ldr r0, _037FB31C ; =0x03806DFC
	mov r1, r2
_037FB28C:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0x20
	blt _037FB28C
	ldr r2, _037FB320 ; =0x0000C408
	ldr r1, _037FB324 ; =0x04000184
	mov r0, #0x40000
	strh r2, [r1]
	bl OS_ResetRequestIrqMask
	ldr r1, _037FB328 ; =sub_037FB43C
	mov r0, #0x40000
	bl OS_SetIrqFunction
	mov r0, #0x40000
	bl OS_EnableIrqMask
	mov r5, #8
	ldr r8, _037FB32C ; =0x04000180
	mov r6, r5
	mov r7, #0x3e8
	b _037FB2FC
_037FB2D8:
	mov r0, r5, lsl #8
	strh r0, [r8]
	mov r0, r7
	bl sub_037FAD88
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
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FB314: .word 0x03806DF8
_037FB318: .word 0x027FFC00
_037FB31C: .word 0x03806DFC
_037FB320: .word 0x0000C408
_037FB324: .word 0x04000184
_037FB328: .word sub_037FB43C
_037FB32C: .word 0x04000180
	arm_func_end sub_037FB254

	arm_func_start PXI_SetFifoRecvCallback
PXI_SetFifoRecvCallback: ; 0x037FB330
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl OS_DisableInterrupts
	ldr r1, _037FB378 ; =0x03806DFC
	ldr r3, _037FB37C ; =0x027FFC00
	str r5, [r1, r4, lsl #2]
	cmp r5, #0
	ldrne r2, [r3, #0x38c]
	mov r1, #1
	orrne r1, r2, r1, lsl r4
	ldreq r2, [r3, #0x38c]
	mvneq r1, r1, lsl r4
	andeq r1, r2, r1
	str r1, [r3, #0x38c]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FB378: .word 0x03806DFC
_037FB37C: .word 0x027FFC00
	arm_func_end PXI_SetFifoRecvCallback

	arm_func_start sub_037FB380
sub_037FB380: ; 0x037FB380
	ldr r2, _037FB3A0 ; =0x027FFC00
	mov r3, #1
	add r1, r2, r1, lsl #2
	ldr r1, [r1, #0x388]
	tst r1, r3, lsl r0
	moveq r3, #0
	mov r0, r3
	bx lr
	.align 2, 0
_037FB3A0: .word 0x027FFC00
	arm_func_end sub_037FB380

	arm_func_start sub_037FB3A4
sub_037FB3A4: ; 0x037FB3A4
	stmdb sp!, {r3, lr}
	ldr r3, [sp]
	and r0, r0, #0x1f
	bic r3, r3, #0x1f
	orr r0, r3, r0
	bic r3, r0, #0x20
	mov r0, r2, lsl #0x1f
	orr r0, r3, r0, lsr #26
	and r0, r0, #0x3f
	orr r0, r0, r1, lsl #6
	str r0, [sp]
	bl sub_037FB3DC
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_037FB3A4

	arm_func_start sub_037FB3DC
sub_037FB3DC: ; 0x037FB3DC
	stmdb sp!, {r4, lr}
	ldr r2, _037FB438 ; =0x04000184
	mov r4, r0
	ldrh r0, [r2]
	tst r0, #0x4000
	ldrneh r1, [r2]
	mvnne r0, #0
	orrne r1, r1, #0xc000
	strneh r1, [r2]
	bne _037FB430
	bl OS_DisableInterrupts
	ldr r2, _037FB438 ; =0x04000184
	ldrh r1, [r2]
	tst r1, #2
	beq _037FB424
	bl OS_RestoreInterrupts
	mvn r0, #1
	b _037FB430
_037FB424:
	str r4, [r2, #4]
	bl OS_RestoreInterrupts
	mov r0, #0
_037FB430:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FB438: .word 0x04000184
	arm_func_end sub_037FB3DC

	arm_func_start sub_037FB43C
sub_037FB43C: ; 0x037FB43C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r6, [sp]
	mvn r8, #3
	ldr r4, _037FB514 ; =0x03806DFC
	ldr sb, _037FB518 ; =0x04000184
	add sl, r8, #1
	mov r7, #0x4100000
	mov r5, #0
_037FB460:
	ldrh r0, [sb]
	tst r0, #0x4000
	ldrneh r0, [sb]
	addne r1, r8, #1
	orrne r0, r0, #0xc000
	strneh r0, [sb]
	bne _037FB4A8
	bl OS_DisableInterrupts
	ldrh r1, [sb]
	tst r1, #0x100
	beq _037FB498
	bl OS_RestoreInterrupts
	mov r1, r8
	b _037FB4A8
_037FB498:
	ldr r6, [r7]
	str r6, [sp]
	bl OS_RestoreInterrupts
	mov r1, r5
_037FB4A8:
	cmp r1, r8
	beq _037FB508
	cmp r1, sl
	beq _037FB460
	mov r0, r6, lsl #0x1b
	movs r0, r0, lsr #0x1b
	beq _037FB460
	ldr r3, [r4, r0, lsl #2]
	cmp r3, #0
	beq _037FB4E8
	mov r2, r6, lsl #0x1a
	mov r1, r6, lsr #6
	mov r2, r2, lsr #0x1f
	mov lr, pc
	bx r3
	arm_func_end sub_037FB43C

	arm_func_start sub_037FB4E4
sub_037FB4E4: ; 0x037FB4E4
	b _037FB460
_037FB4E8:
	mov r0, r6, lsl #0x1a
	movs r0, r0, lsr #0x1f
	bne _037FB460
	orr r6, r6, #0x20
	mov r0, r6
	str r6, [sp]
	bl sub_037FB3DC
	b _037FB460
_037FB508:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037FB514: .word 0x03806DFC
_037FB518: .word 0x04000184
	arm_func_end sub_037FB4E4

	arm_func_start sub_037FB51C
sub_037FB51C: ; 0x037FB51C
	ldr r2, _037FB538 ; =0x04000134
	mvn r3, r0
	ldrh r0, [r2]
	and r0, r3, r0
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_037FB538: .word 0x04000134
	arm_func_end sub_037FB51C

	arm_func_start sub_037FB53C
sub_037FB53C: ; 0x037FB53C
	ldr ip, _037FB550 ; =sub_037FB51C
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0xc000
	bx ip
	.align 2, 0
_037FB550: .word sub_037FB51C
	arm_func_end sub_037FB53C

	arm_func_start sub_037FB554
sub_037FB554: ; 0x037FB554
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl sub_037FA1C8
	cmp r0, #0
	beq _037FB574
	bl sub_037FA3B4
	cmp r0, #0
	bne _037FB57C
_037FB574:
	mov r0, #0
	b _037FB5D4
_037FB57C:
	ldr r0, _037FB5E0 ; =0x03806E7C
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #0
	bne _037FB5D4
	ldr r0, _037FB5E4 ; =0x03806E80
	bl OS_CreateAlarm
	bl sub_037FA240
	ldr r2, _037FB5E8 ; =sub_037FB5F0
	ldr r3, _037FB5EC ; =0x0000082E
	str r2, [sp, #4]
	adds ip, r0, r3
	mov lr, #0
	str lr, [sp, #8]
	adc r2, r1, #0
	ldr r0, _037FB5E4 ; =0x03806E80
	mov r1, ip
	str lr, [sp]
	bl sub_037FA570
	ldr r1, _037FB5E0 ; =0x03806E7C
	mov r0, #1
	str r0, [r1]
_037FB5D4:
	add sp, sp, #0xc
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_037FB5E0: .word 0x03806E7C
_037FB5E4: .word 0x03806E80
_037FB5E8: .word sub_037FB5F0
_037FB5EC: .word 0x0000082E
	arm_func_end sub_037FB554

	arm_func_start sub_037FB5F0
sub_037FB5F0: ; 0x037FB5F0
	stmdb sp!, {r4, lr}
	mov r0, #0x8000
	mov r4, #0
	bl sub_037FB53C
	ldr r0, _037FB628 ; =0x04000136
	ldrh r1, [r0]
	ldr r0, _037FB62C ; =0x027FFFA8
	tst r1, #0x80
	movne r4, #0x8000
	and r1, r1, #0xb
	orr r1, r4, r1, lsl #10
	strh r1, [r0]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FB628: .word 0x04000136
_037FB62C: .word 0x027FFFA8
	arm_func_end sub_037FB5F0

	arm_func_start sub_037FB630
sub_037FB630: ; 0x037FB630
	ldr r1, _037FB644 ; =0x04000501
	ldrb r0, [r1]
	orr r0, r0, #0x80
	strb r0, [r1]
	bx lr
	.align 2, 0
_037FB644: .word 0x04000501
	arm_func_end sub_037FB630

	arm_func_start sub_037FB648
sub_037FB648: ; 0x037FB648
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _037FB694 ; =0x04000501
	mov r5, #0
	ldrb r0, [r1]
	bic r0, r0, #0x80
	strb r0, [r1]
	mov r4, #1
_037FB664:
	mov r0, r5
	mov r1, r4
	bl sub_037FB9B4
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FB664
	ldr r0, _037FB698 ; =0x04000508
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FB694: .word 0x04000501
_037FB698: .word 0x04000508
	arm_func_end sub_037FB648

	arm_func_start sub_037FB69C
sub_037FB69C: ; 0x037FB69C
	stmdb sp!, {r3, lr}
	ldr r2, _037FB6E0 ; =0x04000501
	mov r0, #0x80
	ldrb r1, [r2]
	bic r1, r1, #0x80
	strb r1, [r2]
	bl sub_037FB6E8
	mov r0, #0x40000
	bl sub_037FAD88
	mov r0, #1
	bl sub_03801E04
	ldr r1, _037FB6E4 ; =0x04000304
	ldrh r0, [r1]
	bic r0, r0, #1
	strh r0, [r1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FB6E0: .word 0x04000501
_037FB6E4: .word 0x04000304
	arm_func_end sub_037FB69C

	arm_func_start sub_037FB6E8
sub_037FB6E8: ; 0x037FB6E8
	ldr ip, _037FB6F0 ; =SVC_ResetSoundBias
	bx ip
	.align 2, 0
_037FB6F0: .word SVC_ResetSoundBias
	arm_func_end sub_037FB6E8

	arm_func_start sub_037FB6F4
sub_037FB6F4: ; 0x037FB6F4
	stmdb sp!, {r3, lr}
	ldr r2, _037FB738 ; =0x04000304
	mov r0, #1
	ldrh r1, [r2]
	orr r1, r1, #1
	strh r1, [r2]
	bl sub_03801DE0
	mov r0, #0x100
	bl sub_037FB744
	ldr r0, _037FB73C ; =0x0007AB80
	bl sub_037FAD88
	ldr r1, _037FB740 ; =0x04000501
	ldrb r0, [r1]
	orr r0, r0, #0x80
	strb r0, [r1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FB738: .word 0x04000304
_037FB73C: .word 0x0007AB80
_037FB740: .word 0x04000501
	arm_func_end sub_037FB6F4

	arm_func_start sub_037FB744
sub_037FB744: ; 0x037FB744
	ldr ip, _037FB74C ; =SVC_SetSoundBias
	bx ip
	.align 2, 0
_037FB74C: .word SVC_SetSoundBias
	arm_func_end sub_037FB744

	arm_func_start sub_037FB750
sub_037FB750: ; 0x037FB750
	ldr r1, _037FB75C ; =0x04000500
	strb r0, [r1]
	bx lr
	.align 2, 0
_037FB75C: .word 0x04000500
	arm_func_end sub_037FB750

	arm_func_start sub_037FB760
sub_037FB760: ; 0x037FB760
	ldr ip, _037FB794 ; =0x04000501
	mov r3, r3, lsl #5
	ldrb ip, [ip]
	tst ip, #0x80
	movne ip, #1
	moveq ip, #0
	orr r3, r3, ip, lsl #7
	orr r2, r3, r2, lsl #4
	orr r2, r2, r1, lsl #2
	ldr r1, _037FB794 ; =0x04000501
	orr r0, r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_037FB794: .word 0x04000501
	arm_func_end sub_037FB760

	arm_func_start sub_037FB798
sub_037FB798: ; 0x037FB798
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _037FB850 ; =0x03806AEC
	mov r8, r1
	ldr lr, [r4]
	ldr r1, _037FB854 ; =0x03806EAC
	mov r7, r2
	ldr r5, [sp, #0x2c]
	ldr r4, _037FB858 ; =0x03806EB0
	ldr ip, [sp, #0x20]
	ldr r2, _037FB85C ; =0x03806EC0
	strb r5, [r4, r0]
	cmp lr, #0
	ldr r1, [r1]
	movge r5, lr
	mov r6, r3
	mov r4, r0, lsl #4
	strb ip, [r2, r0]
	cmp r1, #0
	ble _037FB804
	ldr r1, _037FB860 ; =0x0000FFF5
	mov r2, #1
	tst r1, r2, lsl r0
	beq _037FB804
	mov r0, ip
	mov r1, r5
	bl sub_037FBBD4
	mov ip, r0
_037FB804:
	ldr r2, [sp, #0x24]
	mov r0, r6, lsl #0x1b
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
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FB850: .word 0x03806AEC
_037FB854: .word 0x03806EAC
_037FB858: .word 0x03806EB0
_037FB85C: .word 0x03806EC0
_037FB860: .word 0x0000FFF5
	arm_func_end sub_037FB798

	arm_func_start sub_037FB864
sub_037FB864: ; 0x037FB864
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _037FB8FC ; =0x03806AEC
	mov r7, r1
	ldr ip, [r4]
	ldr r1, _037FB900 ; =0x03806EAC
	mov r6, r3
	ldr r3, _037FB904 ; =0x03806EC0
	ldr r5, [sp, #0x1c]
	ldr r4, _037FB908 ; =0x03806EB0
	ldr r1, [r1]
	strb r5, [r4, r0]
	cmp ip, #0
	movge r5, ip
	mov r4, r0, lsl #4
	strb r2, [r3, r0]
	cmp r1, #0
	ble _037FB8C8
	ldr r1, _037FB90C ; =0x0000FFF5
	mov r3, #1
	tst r1, r3, lsl r0
	beq _037FB8C8
	mov r0, r2
	mov r1, r5
	bl sub_037FBBD4
	mov r2, r0
_037FB8C8:
	mov r0, r7, lsl #0x18
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
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FB8FC: .word 0x03806AEC
_037FB900: .word 0x03806EAC
_037FB904: .word 0x03806EC0
_037FB908: .word 0x03806EB0
_037FB90C: .word 0x0000FFF5
	arm_func_end sub_037FB864

	arm_func_start sub_037FB910
sub_037FB910: ; 0x037FB910
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _037FB9A0 ; =0x03806AEC
	mov r7, r2
	ldr ip, [r4]
	ldr r2, _037FB9A4 ; =0x03806EAC
	mov r6, r3
	ldr r3, _037FB9A8 ; =0x03806EC0
	ldr r5, [sp, #0x18]
	ldr r4, _037FB9AC ; =0x03806EB0
	ldr r2, [r2]
	strb r5, [r4, r0]
	cmp ip, #0
	movge r5, ip
	mov r4, r0, lsl #4
	strb r1, [r3, r0]
	cmp r2, #0
	ble _037FB974
	ldr r2, _037FB9B0 ; =0x0000FFF5
	mov r3, #1
	tst r2, r3, lsl r0
	beq _037FB974
	mov r0, r1
	mov r1, r5
	bl sub_037FBBD4
	mov r1, r0
_037FB974:
	mov r0, r5, lsl #0x10
	orr r0, r0, #0x60000000
	orr r2, r0, r7, lsl #8
	add r0, r4, #0x4000000
	orr r1, r1, r2
	str r1, [r0, #0x400]
	rsb r1, r6, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FB9A0: .word 0x03806AEC
_037FB9A4: .word 0x03806EAC
_037FB9A8: .word 0x03806EC0
_037FB9AC: .word 0x03806EB0
_037FB9B0: .word 0x0000FFF5
	arm_func_end sub_037FB910

	arm_func_start sub_037FB9B4
sub_037FB9B4: ; 0x037FB9B4
	mov r3, r0, lsl #4
	add r0, r3, #0x4000000
	ldr r2, [r0, #0x400]
	add r0, r3, #0x400
	tst r1, #1
	bic r1, r2, #0x80000000
	add r0, r0, #0x4000000
	orrne r1, r1, #0x8000
	str r1, [r0]
	bx lr
	arm_func_end sub_037FB9B4

	arm_func_start sub_037FB9DC
sub_037FB9DC: ; 0x037FB9DC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _037FBA48 ; =0x03806EAC
	ldr ip, _037FBA4C ; =0x03806EC0
	ldr r3, [r3]
	mov r5, r0
	mov r4, r2
	strb r1, [ip, r5]
	cmp r3, #0
	ble _037FBA2C
	ldr r0, _037FBA50 ; =0x0000FFF5
	mov r2, #1
	tst r0, r2, lsl r5
	beq _037FBA2C
	mov r0, r5, lsl #4
	add r0, r0, #0x4000000
	ldrb r2, [r0, #0x402]
	mov r0, r1
	mov r1, r2
	bl sub_037FBBD4
	mov r1, r0
_037FBA2C:
	mov r0, r5, lsl #4
	add r0, r0, #0x4000000
	orr r1, r1, r4, lsl #8
	add r0, r0, #0x400
	strh r1, [r0]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FBA48: .word 0x03806EAC
_037FBA4C: .word 0x03806EC0
_037FBA50: .word 0x0000FFF5
	arm_func_end sub_037FB9DC

	arm_func_start sub_037FBA54
sub_037FBA54: ; 0x037FBA54
	mov r0, r0, lsl #4
	add r0, r0, #0x4000000
	rsb r1, r1, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	bx lr
	arm_func_end sub_037FBA54

	arm_func_start sub_037FBA6C
sub_037FBA6C: ; 0x037FBA6C
	stmdb sp!, {r4, lr}
	ldr r2, _037FBAD0 ; =0x03806AEC
	ldr r3, _037FBAD4 ; =0x03806EB0
	ldr r2, [r2]
	strb r1, [r3, r0]
	cmp r2, #0
	ldr r3, _037FBAD8 ; =0x03806EAC
	mov r4, r0, lsl #4
	movge r1, r2
	add r2, r4, #0x4000000
	strb r1, [r2, #0x402]
	ldr r2, [r3]
	cmp r2, #0
	ble _037FBAC8
	ldr r2, _037FBADC ; =0x0000FFF5
	mov r3, #1
	tst r2, r3, lsl r0
	beq _037FBAC8
	ldr r2, _037FBAE0 ; =0x03806EC0
	ldrb r0, [r2, r0]
	bl sub_037FBBD4
	add r1, r4, #0x4000000
	strb r0, [r1, #0x400]
_037FBAC8:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FBAD0: .word 0x03806AEC
_037FBAD4: .word 0x03806EB0
_037FBAD8: .word 0x03806EAC
_037FBADC: .word 0x0000FFF5
_037FBAE0: .word 0x03806EC0
	arm_func_end sub_037FBA6C

	arm_func_start sub_037FBAE4
sub_037FBAE4: ; 0x037FBAE4
	mov r0, r0, lsl #4
	add r0, r0, #0x4000000
	ldrb r0, [r0, #0x403]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end sub_037FBAE4

	arm_func_start sub_037FBB00
sub_037FBB00: ; 0x037FBB00
	ldr r1, _037FBB5C ; =0x03806AEC
	cmp r0, #0
	str r0, [r1]
	blt _037FBB34
	mov r2, #0
	and r1, r0, #0xff
_037FBB18:
	mov r0, r2, lsl #4
	add r0, r0, #0x4000000
	add r2, r2, #1
	strb r1, [r0, #0x402]
	cmp r2, #0x10
	blt _037FBB18
	bx lr
_037FBB34:
	ldr r2, _037FBB60 ; =0x03806EB0
	mov r3, #0
_037FBB3C:
	ldrb r1, [r2, r3]
	mov r0, r3, lsl #4
	add r0, r0, #0x4000000
	add r3, r3, #1
	strb r1, [r0, #0x402]
	cmp r3, #0x10
	blt _037FBB3C
	bx lr
	.align 2, 0
_037FBB5C: .word 0x03806AEC
_037FBB60: .word 0x03806EB0
	arm_func_end sub_037FBB00

	arm_func_start sub_037FBB64
sub_037FBB64: ; 0x037FBB64
	mov r0, r0, lsl #4
	add r0, r0, #0x4000000
	ldr r0, [r0, #0x400]
	bx lr
	arm_func_end sub_037FBB64

	arm_func_start sub_037FBB74
sub_037FBB74: ; 0x037FBB74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _037FBBC8 ; =0x03806EAC
	ldr r5, _037FBBCC ; =0x03806EC0
	ldr r4, _037FBBD0 ; =0x0000FFF5
	str r0, [r1]
	mov r7, #0
	mov r6, #1
_037FBB90:
	tst r4, r6, lsl r7
	beq _037FBBB4
	mov r8, r7, lsl #4
	add r0, r8, #0x4000000
	ldrb r1, [r0, #0x402]
	ldrb r0, [r5, r7]
	bl sub_037FBBD4
	add r1, r8, #0x4000000
	strb r0, [r1, #0x400]
_037FBBB4:
	add r7, r7, #1
	cmp r7, #0x10
	blt _037FBB90
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FBBC8: .word 0x03806EAC
_037FBBCC: .word 0x03806EC0
_037FBBD0: .word 0x0000FFF5
	arm_func_end sub_037FBB74

	arm_func_start sub_037FBBD4
sub_037FBBD4: ; 0x037FBBD4
	cmp r1, #0x18
	bge _037FBC04
	ldr r2, _037FBC38 ; =0x03806EAC
	add r3, r1, #0x28
	ldr ip, [r2]
	ldr r1, _037FBC3C ; =0x00007FFF
	mul r2, ip, r3
	sub r1, r1, ip
	add r1, r2, r1, lsl #6
	mul r1, r0, r1
	mov r0, r1, asr #0x15
	bx lr
_037FBC04:
	cmp r1, #0x68
	bxle lr
	ldr r2, _037FBC38 ; =0x03806EAC
	sub r1, r1, #0x28
	ldr ip, [r2]
	rsb r2, ip, #0
	mul r3, r2, r1
	add r1, ip, #0xff
	add r1, r1, #0x7f00
	add r1, r3, r1, lsl #6
	mul r1, r0, r1
	mov r0, r1, asr #0x15
	bx lr
	.align 2, 0
_037FBC38: .word 0x03806EAC
_037FBC3C: .word 0x00007FFF
	arm_func_end sub_037FBBD4

	arm_func_start sub_037FBC40
sub_037FBC40: ; 0x037FBC40
	stmdb sp!, {r4, r5, r6, lr}
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
	bl sub_037FBD60
	adds r3, r0, #0x10000
	mov r0, r5, asr #0x1f
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
	mov r4, r2, lsr r3
	rsb r0, r3, #0x20
	orr r4, r4, r1, lsl r0
	sub r0, r3, #0x20
	mov r3, r1, lsr r3
	orr r4, r4, r1, lsr r0
	b _037FBD24
_037FBCC8:
	cmp r0, #0x20
	bge _037FBD1C
	rsb r5, r0, #0x20
	sub lr, ip, #1
	mov r6, lr, lsl r5
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
	mov r3, r1, lsl r0
	orr r3, r3, r2, lsr r5
	sub r1, r0, #0x20
	mov r4, r2, lsl r0
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
	ldr r0, _037FBD5C ; =0x0000FFFF
	cmp r3, r1
	cmpeq r4, r0
	movhi r4, r0
_037FBD4C:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
_037FBD54:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FBD5C: .word 0x0000FFFF
	arm_func_end sub_037FBC40

	arm_func_start sub_037FBD60
sub_037FBD60: ; 0x037FBD60
	ldr ip, _037FBD68 ; =SVC_GetPitchTable
	bx ip
	.align 2, 0
_037FBD68: .word SVC_GetPitchTable
	arm_func_end sub_037FBD60

	arm_func_start sub_037FBD6C
sub_037FBD6C: ; 0x037FBD6C
	stmdb sp!, {r4, lr}
	ldr r1, _037FBDDC ; =0xFFFFFD2D
	mov r4, r0
	cmp r4, r1
	movlt r4, r1
	blt _037FBD8C
	cmp r4, #0
	movgt r4, #0
_037FBD8C:
	add r0, r4, #0xd3
	add r0, r0, #0x200
	bl sub_037FBDE0
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
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FBDDC: .word 0xFFFFFD2D
	arm_func_end sub_037FBD6C

	arm_func_start sub_037FBDE0
sub_037FBDE0: ; 0x037FBDE0
	ldr ip, _037FBDE8 ; =SVC_GetVolumeTable
	bx ip
	.align 2, 0
_037FBDE8: .word SVC_GetVolumeTable
	arm_func_end sub_037FBDE0

	arm_func_start sub_037FBDEC
sub_037FBDEC: ; 0x037FBDEC
	cmp r0, #0x20
	ldrlt r1, _037FBE54 ; =_0380664C
	ldrltsb r0, [r1, r0]
	bxlt lr
	cmp r0, #0x40
	ldrlt r1, _037FBE54 ; =_0380664C
	rsblt r0, r0, #0x40
	ldrltsb r0, [r1, r0]
	bxlt lr
	cmp r0, #0x60
	bge _037FBE34
	ldr r1, _037FBE54 ; =_0380664C
	sub r0, r0, #0x40
	ldrsb r0, [r1, r0]
	rsb r0, r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bx lr
_037FBE34:
	ldr r1, _037FBE54 ; =_0380664C
	sub r0, r0, #0x60
	rsb r0, r0, #0x20
	ldrsb r0, [r1, r0]
	rsb r0, r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bx lr
	.align 2, 0
_037FBE54: .word _0380664C
	arm_func_end sub_037FBDEC

	arm_func_start sub_037FBE58
sub_037FBE58: ; 0x037FBE58
	ldr r2, _037FBE80 ; =0x03806AF0
	ldr r0, _037FBE84 ; =0x0019660D
	ldr r3, [r2]
	ldr r1, _037FBE88 ; =0x3C6EF35F
	mla r1, r3, r0, r1
	mov r0, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	str r1, [r2]
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_037FBE80: .word 0x03806AF0
_037FBE84: .word 0x0019660D
_037FBE88: .word 0x3C6EF35F
	arm_func_end sub_037FBE58

	arm_func_start sub_037FBE8C
sub_037FBE8C: ; 0x037FBE8C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _037FBEE8 ; =0x03806ED0
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _037FBEDC
	mov r0, #1
	str r0, [r1]
	bl sub_037FEE70
	mov r0, #0x400
	str r0, [sp]
	ldr r0, _037FBEEC ; =0x03806F40
	ldr r1, _037FBEF0 ; =sub_037FBF9C
	ldr r3, _037FBEF4 ; =0x038073E4
	mov r2, #0
	str r4, [sp, #4]
	bl OS_CreateThread
	ldr r0, _037FBEEC ; =0x03806F40
	bl OS_WakeupThreadDirect
_037FBEDC:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FBEE8: .word 0x03806ED0
_037FBEEC: .word 0x03806F40
_037FBEF0: .word sub_037FBF9C
_037FBEF4: .word 0x038073E4
	arm_func_end sub_037FBE8C

	arm_func_start sub_037FBEF8
sub_037FBEF8: ; 0x037FBEF8
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl sub_037FA240
	ldr r3, _037FBF3C ; =sub_037FBF80
	adds ip, r0, #0x10000
	str r3, [sp, #4]
	mov lr, #0
	str lr, [sp, #8]
	adc r2, r1, #0
	ldr r3, _037FBF40 ; =0x00000AA8
	ldr r0, _037FBF44 ; =0x03806F14
	mov r1, ip
	str lr, [sp]
	bl sub_037FA570
	add sp, sp, #0xc
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_037FBF3C: .word sub_037FBF80
_037FBF40: .word 0x00000AA8
_037FBF44: .word 0x03806F14
	arm_func_end sub_037FBEF8

	arm_func_start sub_037FBF48
sub_037FBF48: ; 0x037FBF48
	ldr ip, _037FBF54 ; =sub_037FA5E4
	ldr r0, _037FBF58 ; =0x03806F14
	bx ip
	.align 2, 0
_037FBF54: .word sub_037FA5E4
_037FBF58: .word 0x03806F14
	arm_func_end sub_037FBF48

	arm_func_start sub_037FBF5C
sub_037FBF5C: ; 0x037FBF5C
	ldr ip, _037FBF70 ; =OS_SendMessage
	ldr r0, _037FBF74 ; =0x03806EF4
	mov r1, #2
	mov r2, #0
	bx ip
	.align 2, 0
_037FBF70: .word OS_SendMessage
_037FBF74: .word 0x03806EF4
	arm_func_end sub_037FBF5C

	arm_func_start sub_037FBF78
sub_037FBF78: ; 0x037FBF78
	bx lr
	arm_func_end sub_037FBF78

	arm_func_start sub_037FBF7C
sub_037FBF7C: ; 0x037FBF7C
	bx lr
	arm_func_end sub_037FBF7C

	arm_func_start sub_037FBF80
sub_037FBF80: ; 0x037FBF80
	ldr ip, _037FBF94 ; =OS_SendMessage
	ldr r0, _037FBF98 ; =0x03806EF4
	mov r1, #1
	mov r2, #0
	bx ip
	.align 2, 0
_037FBF94: .word OS_SendMessage
_037FBF98: .word 0x03806EF4
	arm_func_end sub_037FBF80

	arm_func_start sub_037FBF9C
sub_037FBF9C: ; 0x037FBF9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	ldr r0, _037FC07C ; =0x03806EF4
	ldr r1, _037FC080 ; =0x03806ED4
	mov r2, #8
	bl OS_InitMessageQueue
	ldr r0, _037FC084 ; =0x03806F14
	bl OS_CreateAlarm
	bl sub_037FC0F8
	bl sub_037FCE88
	bl sub_037FECBC
	bl sub_037FB630
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_037FB760
	mov r0, #0x7f
	bl sub_037FB750
	bl sub_037FA240
	ldr r2, _037FC088 ; =sub_037FBF80
	adds r4, r0, #0x10000
	str r2, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp]
	adc r2, r1, #0
	ldr r3, _037FC08C ; =0x00000AA8
	ldr r0, _037FC084 ; =0x03806F14
	mov r1, r4
	bl sub_037FA570
	ldr r7, _037FC07C ; =0x03806EF4
	mov r4, #1
	add r6, sp, #0xc
	mov r8, #0
	mov r5, r4
_037FC02C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov sb, r8
	bl OS_ReceiveMessage
	ldr r0, [sp, #0xc]
	cmp r0, #1
	beq _037FC054
	cmp r0, #2
	b _037FC058
_037FC054:
	mov sb, r4
_037FC058:
	bl sub_037FC154
	bl sub_037FEEB4
	mov r0, sb
	bl sub_037FCEEC
	mov r0, sb
	bl sub_037FC340
	bl sub_037FEC24
	bl sub_037FBE58
	b _037FC02C
	.align 2, 0
_037FC07C: .word 0x03806EF4
_037FC080: .word 0x03806ED4
_037FC084: .word 0x03806F14
_037FC088: .word sub_037FBF80
_037FC08C: .word 0x00000AA8
	arm_func_end sub_037FBF9C

	arm_func_start sub_037FC090
sub_037FC090: ; 0x037FC090
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [sp, #0x10]
	mov r5, r0, lsl #3
	cmp r4, #0
	movne r4, #0
	moveq r4, #1
	mov ip, r4, lsl #2
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
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FC090

	arm_func_start sub_037FC0E0
sub_037FC0E0: ; 0x037FC0E0
	add r0, r0, #0x4000000
	ldrb r0, [r0, #0x508]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end sub_037FC0E0

	arm_func_start sub_037FC0F8
sub_037FC0F8: ; 0x037FC0F8
	stmdb sp!, {r3, lr}
	ldr r3, _037FC14C ; =0x0380740C
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
	ldr r0, _037FC150 ; =0x038073E4
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FC14C: .word 0x0380740C
_037FC150: .word 0x038073E4
	arm_func_end sub_037FC0F8

	arm_func_start sub_037FC154
sub_037FC154: ; 0x037FC154
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18
	ldr r7, _037FC33C ; =0x0380740C
	mov sb, #0
	mov r4, #2
	mov r5, #1
	mov r6, sb
	mov sl, #0x54
_037FC174:
	mla r8, sb, sl, r7
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1b
	beq _037FC2D4
	tst r0, #2
	beq _037FC19C
	mov r0, sb
	mov r1, r6
	bl sub_037FB9B4
_037FC19C:
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
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
	mov r0, ip, asr #8
	str r0, [sp, #0xc]
	ldrh r1, [r8, #0x26]
	moveq r3, r4
	str r1, [sp, #0x10]
	ldrb r1, [r8, #0x23]
	mov r0, sb
	str r1, [sp, #0x14]
	ldr r1, [r8, #0x44]
	ldrb r2, [r8, #0x38]
	bl sub_037FB798
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
	mov r3, r3, asr #8
	bl sub_037FB864
	b _037FC2D4
_037FC254:
	ldrh r2, [r8, #0x24]
	ldrb r1, [r8, #0x23]
	mov r0, sb
	str r1, [sp]
	ldrh r3, [r8, #0x26]
	and r1, r2, #0xff
	mov r2, r2, asr #8
	bl sub_037FB910
	b _037FC2D4
_037FC278:
	tst r0, #4
	beq _037FC28C
	ldrh r1, [r8, #0x26]
	mov r0, sb
	bl sub_037FBA54
_037FC28C:
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	tst r0, #8
	beq _037FC2B4
	ldrh r2, [r8, #0x24]
	mov r0, sb
	and r1, r2, #0xff
	mov r2, r2, asr #8
	bl sub_037FB9DC
_037FC2B4:
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	tst r0, #0x10
	beq _037FC2D4
	ldrb r1, [r8, #0x23]
	mov r0, sb
	bl sub_037FBA6C
_037FC2D4:
	add sb, sb, #1
	cmp sb, #0x10
	blt _037FC174
	ldr r3, _037FC33C ; =0x0380740C
	mov r4, #0
	mov r1, #0x54
_037FC2EC:
	mla r5, r4, r1, r3
	ldrb r0, [r5, #3]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1b
	beq _037FC324
	tst r0, #1
	movne r0, r4, lsl #4
	addne r0, r0, #0x4000000
	ldrneb r2, [r0, #0x403]
	orrne r2, r2, #0x80
	strneb r2, [r0, #0x403]
	ldrb r0, [r5, #3]
	bic r0, r0, #0xf8
	strb r0, [r5, #3]
_037FC324:
	add r4, r4, #1
	cmp r4, #0x10
	blt _037FC2EC
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037FC33C: .word 0x0380740C
	arm_func_end sub_037FC154

	arm_func_start sub_037FC340
sub_037FC340: ; 0x037FC340
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	mov r0, #0x8000
	rsb r0, r0, #0
	mov r6, #0
	str r0, [sp]
	mov r4, r6
_037FC35C:
	ldr r0, _037FC6E8 ; =0x0380740C
	mov r1, #0x54
	mla r5, r6, r1, r0
	ldrb r2, [r5, #3]
	mov r7, #0
	mov r0, r2, lsl #0x1f
	mov r8, r7
	mov sb, r7
	movs r0, r0, lsr #0x1f
	beq _037FC6D4
	mov r0, r2, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _037FC3C0
	bic r1, r2, #0xf8
	mov r0, r2, lsl #0x18
	mov r0, r0, lsr #0x1b
	orr r0, r0, #1
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1b
	orr r0, r1, r0, lsr #24
	strb r0, [r5, #3]
	and r0, r0, #0xff
	bic r0, r0, #2
	strb r0, [r5, #3]
	b _037FC410
_037FC3C0:
	mov r0, r6
	bl sub_037FBAE4
	cmp r0, #0
	bne _037FC410
	ldr r3, [r5, #0x48]
	cmp r3, #0
	moveq r0, r7
	streqb r0, [r5, #0x22]
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
	mov r2, r0, lsl #1
	ldr r0, _037FC6EC ; =0x03806670
	ldrsh r2, [r0, r2]
	ldrb r0, [r5, #5]
	add r7, r7, r2
	sub r0, r1, r0
	add r8, r8, r0, lsl #6
	mov r0, r5
	mov r1, fp
	bl sub_037FC7C4
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
	mov r3, r2, asr #0x1f
	bl sub_03806064
	cmp fp, #0
	beq _037FC498
	ldrb r1, [r5, #3]
	mov r1, r1, lsl #0x1d
	movs r1, r1, lsr #0x1f
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
	bl sub_037FCDAC
	mov r1, r0, asr #0x1f
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
	moveq r1, r1, lsl #6
	orreq r1, r1, r0, lsr #26
	moveq sl, r0, lsl #6
	b _037FC51C
_037FC4F8:
	mov r2, #0x3c
	umull sl, r3, r0, r2
	mov r0, #0x3c
	mla r3, r1, r0, r3
	mov r1, r3
	b _037FC51C
_037FC510:
	mov r1, r1, lsl #6
	orr r1, r1, r0, lsr #26
	mov sl, r0, lsl #6
_037FC51C:
	mov sl, sl, lsr #0xe
	orr sl, sl, r1, lsl #18
_037FC524:
	cmp fp, #0
	beq _037FC534
	add r0, r5, #0x28
	bl sub_037FCD4C
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
	movne sb, r0, asr #7
	ldrsb r1, [r5, #0xb]
	ldrb r0, [r5, #2]
	add sb, sb, r1
	cmp r0, #3
	bne _037FC5F4
	ldr r0, _037FC6F0 ; =0xFFFFFD2D
	cmp r7, r0
	bgt _037FC5F4
	ldrb r0, [r5, #3]
	bic r0, r0, #0xf8
	orr r0, r0, #0x10
	strb r0, [r5, #3]
	ldr r3, [r5, #0x48]
	cmp r3, #0
	moveq r0, #0
	streqb r0, [r5, #0x22]
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
	bl sub_037FBD6C
	mov r7, r0
	ldrh r0, [r5, #0x3c]
	mov r1, r8
	bl sub_037FBC40
	ldrb r1, [r5, #1]
	cmp r1, #1
	ldreq r1, _037FC6F4 ; =0x0000FFFC
	andeq r0, r0, r1
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
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
	mov r1, r1, lsl #0x18
	mov r1, r1, lsr #0x1b
	orr r1, r1, #8
	and r1, r1, #0xff
	mov r1, r1, lsl #0x1b
	orr r1, r2, r1, lsr #24
	strb r1, [r5, #3]
_037FC66C:
	ldrh r1, [r5, #0x26]
	cmp r0, r1
	beq _037FC6A0
	strh r0, [r5, #0x26]
	ldrb r0, [r5, #3]
	bic r1, r0, #0xf8
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	orr r0, r0, #4
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1b
	orr r0, r1, r0, lsr #24
	strb r0, [r5, #3]
_037FC6A0:
	ldrb r0, [r5, #0x23]
	cmp sb, r0
	beq _037FC6D4
	strb sb, [r5, #0x23]
	ldrb r0, [r5, #3]
	bic r1, r0, #0xf8
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	orr r0, r0, #0x10
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1b
	orr r0, r1, r0, lsr #24
	strb r0, [r5, #3]
_037FC6D4:
	add r6, r6, #1
	cmp r6, #0x10
	blt _037FC35C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FC6E8: .word 0x0380740C
_037FC6EC: .word 0x03806670
_037FC6F0: .word 0xFFFFFD2D
_037FC6F4: .word 0x0000FFFC
	arm_func_end sub_037FC340

	arm_func_start sub_037FC6F8
sub_037FC6F8: ; 0x037FC6F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	strb r0, [r4, #1]
	mov lr, r2
	add ip, r4, #0x38
	ldmia r1, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	mov r0, r4
	mov r1, r3
	str lr, [r4, #0x44]
	bl sub_037FCE50
	mov r0, #1
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_037FC6F8

	arm_func_start sub_037FC734
sub_037FC734: ; 0x037FC734
	stmdb sp!, {r3, lr}
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
	ldr r3, _037FC77C ; =0x00001F46
	mov r1, r2
	strh r3, [r0, #0x3c]
	bl sub_037FCE50
	mov r0, #1
_037FC774:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FC77C: .word 0x00001F46
	arm_func_end sub_037FC734

	arm_func_start sub_037FC780
sub_037FC780: ; 0x037FC780
	stmdb sp!, {r3, lr}
	ldrb r2, [r0]
	cmp r2, #0xe
	movlo r0, #0
	blo _037FC7B8
	cmp r2, #0xf
	movhi r0, #0
	bhi _037FC7B8
	ldr r2, _037FC7C0 ; =0x00001F46
	mov r3, #2
	strb r3, [r0, #1]
	strh r2, [r0, #0x3c]
	bl sub_037FCE50
	mov r0, #1
_037FC7B8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FC7C0: .word 0x00001F46
	arm_func_end sub_037FC780

	arm_func_start sub_037FC7C4
sub_037FC7C4: ; 0x037FC7C4
	cmp r1, #0
	beq _037FC85C
	ldrb r1, [r0, #2]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _037FC85C
_037FC7DC: ; jump table
	b _037FC7EC ; case 0
	b _037FC814 ; case 1
	b _037FC85C ; case 2
	b _037FC84C ; case 3
_037FC7EC:
	ldr r2, [r0, #0x10]
	ldrb r1, [r0, #0x1c]
	rsb r2, r2, #0
	mul r1, r2, r1
	mov r1, r1, asr #8
	rsbs r1, r1, #0
	str r1, [r0, #0x10]
	moveq r1, #1
	streqb r1, [r0, #2]
	b _037FC85C
_037FC814:
	ldrb r2, [r0, #0x1d]
	ldr r1, _037FC868 ; =0x03806670
	mov r2, r2, lsl #1
	ldrsh r3, [r1, r2]
	ldr r2, [r0, #0x10]
	ldrh r1, [r0, #0x1e]
	mov ip, r3, lsl #7
	sub r1, r2, r1
	str r1, [r0, #0x10]
	cmp r1, r3, lsl #7
	strle ip, [r0, #0x10]
	movle r1, #2
	strleb r1, [r0, #2]
	b _037FC85C
_037FC84C:
	ldr r2, [r0, #0x10]
	ldrh r1, [r0, #0x20]
	sub r1, r2, r1
	str r1, [r0, #0x10]
_037FC85C:
	ldr r0, [r0, #0x10]
	mov r0, r0, asr #7
	bx lr
	.align 2, 0
_037FC868: .word 0x03806670
	arm_func_end sub_037FC7C4

	arm_func_start sub_037FC86C
sub_037FC86C: ; 0x037FC86C
	cmp r1, #0x6d
	ldrge r2, _037FC888 ; =0x03806784
	rsblt r1, r1, #0xff
	rsbge r1, r1, #0x7f
	ldrgeb r1, [r2, r1]
	strb r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_037FC888: .word 0x03806784
	arm_func_end sub_037FC86C

	arm_func_start sub_037FC88C
sub_037FC88C: ; 0x037FC88C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl sub_037FCDFC
	strh r0, [r4, #0x1e]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_037FC88C

	arm_func_start sub_037FC8A8
sub_037FC8A8: ; 0x037FC8A8
	strb r1, [r0, #0x1d]
	bx lr
	arm_func_end sub_037FC8A8

	arm_func_start sub_037FC8B0
sub_037FC8B0: ; 0x037FC8B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl sub_037FCDFC
	strh r0, [r4, #0x20]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_037FC8B0

	arm_func_start sub_037FC8CC
sub_037FC8CC: ; 0x037FC8CC
	mov r1, #3
	strb r1, [r0, #2]
	bx lr
	arm_func_end sub_037FC8CC

	arm_func_start sub_037FC8D8
sub_037FC8D8: ; 0x037FC8D8
	ldrb r0, [r0, #3]
	mov r0, r0, lsl #0x1f
	mov r0, r0, lsr #0x1f
	bx lr
	arm_func_end sub_037FC8D8

	arm_func_start sub_037FC8E8
sub_037FC8E8: ; 0x037FC8E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _037FCAA0 ; =0x038073E4
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
	ldr r3, _037FCAA4 ; =0x03806770
	ldr r8, _037FCAA8 ; =0x03806774
	mov sb, r4
	mvn r1, #0
	mov fp, #1
_037FC92C:
	ldrb ip, [r8, sb]
	tst r0, fp, lsl ip
	beq _037FC9AC
	ldr r2, _037FCAAC ; =0x0380740C
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
	mov ip, r2, lsl #0x18
	mov ip, ip, lsr #0x14
	ldrb r2, [r3, r2, asr #8]
	mov lr, r7, lsl #0x18
	mov r2, ip, asr r2
	mov ip, lr, lsr #0x14
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
	ldr r1, _037FCAB0 ; =0x0000FFFF
	strb r7, [r4, #0x1c]
	strh r1, [r4, #0x1e]
	strb r3, [r4, #0x1d]
	add r0, r4, #0x28
	strh r1, [r4, #0x20]
	bl sub_037FCD28
	mov r0, r4
_037FCA98:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FCAA0: .word 0x038073E4
_037FCAA4: .word 0x03806770
_037FCAA8: .word 0x03806774
_037FCAAC: .word 0x0380740C
_037FCAB0: .word 0x0000FFFF
	arm_func_end sub_037FC8E8

	arm_func_start sub_037FCAB4
sub_037FCAB4: ; 0x037FCAB4
	cmp r0, #0
	movne r1, #0
	strne r1, [r0, #0x48]
	strne r1, [r0, #0x4c]
	bx lr
	arm_func_end sub_037FCAB4

	arm_func_start sub_037FCAC8
sub_037FCAC8: ; 0x037FCAC8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	ldr r7, _037FCB70 ; =0x0380740C
	ldr r4, _037FCB74 ; =0x038073E4
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
	bl sub_037FB9B4
	strb r5, [r8, #0x22]
	mov r0, r8
	bl sub_037FCAB4
	ldrb r0, [r8, #3]
	bic r1, r0, #0xf8
	and r0, r1, #0xff
	bic r0, r0, #1
	strb r0, [r8, #3]
_037FCB50:
	add sb, sb, #1
	mov sl, sl, lsr #1
_037FCB58:
	cmp sb, #0x10
	bge _037FCB68
	cmp sl, #0
	bne _037FCAEC
_037FCB68:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FCB70: .word 0x0380740C
_037FCB74: .word 0x038073E4
	arm_func_end sub_037FCAC8

	arm_func_start sub_037FCB78
sub_037FCB78: ; 0x037FCB78
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r8, #0
	ldr r5, _037FCC50 ; =0x0380740C
	mov sb, r1
	mov r7, sl
	mov fp, r8
	mov r4, #1
	b _037FCC14
_037FCB9C:
	tst r7, #1
	beq _037FCC0C
	ldr r0, _037FCC54 ; =0x038073E4
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
	bl sub_037FB9B4
	strb fp, [r6, #0x22]
	mov r0, r6
	bl sub_037FCAB4
	ldrb r0, [r6, #3]
	bic r0, r0, #0xf8
	strb r0, [r6, #3]
	and r0, r0, #0xff
	bic r0, r0, #1
	strb r0, [r6, #3]
_037FCC0C:
	add r8, r8, #1
	mov r7, r7, lsr #1
_037FCC14:
	cmp r8, #0x10
	bge _037FCC24
	cmp r7, #0
	bne _037FCB9C
_037FCC24:
	tst sb, #1
	ldrne r0, _037FCC54 ; =0x038073E4
	ldrne r1, [r0]
	orrne r1, r1, sl
	strne r1, [r0]
	ldreq r0, _037FCC54 ; =0x038073E4
	ldreq r1, [r0, #4]
	orreq r1, r1, sl
	streq r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FCC50: .word 0x0380740C
_037FCC54: .word 0x038073E4
	arm_func_end sub_037FCB78

	arm_func_start sub_037FCC58
sub_037FCC58: ; 0x037FCC58
	tst r1, #1
	ldreq r1, _037FCC8C ; =0x038073E4
	mvneq r0, r0
	ldreq r2, [r1, #4]
	andeq r0, r2, r0
	streq r0, [r1, #4]
	bxeq lr
	ldr r1, _037FCC8C ; =0x038073E4
	mvn r0, r0
	ldr r2, [r1]
	and r0, r2, r0
	str r0, [r1]
	bx lr
	.align 2, 0
_037FCC8C: .word 0x038073E4
	arm_func_end sub_037FCC58

	arm_func_start sub_037FCC90
sub_037FCC90: ; 0x037FCC90
	tst r0, #1
	ldrne r0, _037FCCA8 ; =0x038073E4
	ldrne r0, [r0]
	ldreq r0, _037FCCA8 ; =0x038073E4
	ldreq r0, [r0, #4]
	bx lr
	.align 2, 0
_037FCCA8: .word 0x038073E4
	arm_func_end sub_037FCC90

	arm_func_start sub_037FCCAC
sub_037FCCAC: ; 0x037FCCAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, _037FCD24 ; =0x0380740C
	mov r6, #0
	mov r8, r0
	mov r7, r1
	mov r4, r6
	mov sb, #0x54
_037FCCC8:
	mla r2, r6, sb, r5
	ldrb r1, [r2, #3]
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
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
	bl sub_037FB9B4
_037FCD0C:
	add r0, r6, #1
	and r6, r0, #0xff
	cmp r6, #0x10
	blo _037FCCC8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FCD24: .word 0x0380740C
	arm_func_end sub_037FCCAC

	arm_func_start sub_037FCD28
sub_037FCD28: ; 0x037FCD28
	mov r2, #0
	strb r2, [r0]
	strb r2, [r0, #2]
	mov r1, #1
	strb r1, [r0, #3]
	mov r1, #0x10
	strb r1, [r0, #1]
	strh r2, [r0, #4]
	bx lr
	arm_func_end sub_037FCD28

	arm_func_start sub_037FCD4C
sub_037FCD4C: ; 0x037FCD4C
	ldrh r2, [r0, #6]
	ldrh r1, [r0, #4]
	cmp r2, r1
	addlo r1, r2, #1
	strloh r1, [r0, #6]
	bxlo lr
	ldrh r1, [r0, #8]
	ldrb r2, [r0, #1]
	add r1, r1, r2, lsl #6
	mov r3, r1, lsr #8
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
	arm_func_end sub_037FCD4C

	arm_func_start sub_037FCDAC
sub_037FCDAC: ; 0x037FCDAC
	stmdb sp!, {r4, lr}
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
	mov r0, r0, lsr #8
	bl sub_037FBDEC
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #3]
	mul r0, r1, r0
	mul r0, r2, r0
_037FCDF4:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_037FCDAC

	arm_func_start sub_037FCDFC
sub_037FCDFC: ; 0x037FCDFC
	stmdb sp!, {r3, lr}
	cmp r0, #0x7f
	ldreq r0, _037FCE4C ; =0x0000FFFF
	beq _037FCE44
	cmp r0, #0x7e
	moveq r0, #0x3c00
	beq _037FCE44
	cmp r0, #0x32
	movlt r0, r0, lsl #1
	addlt r0, r0, #1
	movlt r0, r0, lsl #0x10
	movlt r0, r0, lsr #0x10
	blt _037FCE44
	rsb r1, r0, #0x7e
	mov r0, #0x1e00
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
_037FCE44:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FCE4C: .word 0x0000FFFF
	arm_func_end sub_037FCDFC

	arm_func_start sub_037FCE50
sub_037FCE50: ; 0x037FCE50
	ldr r3, _037FCE84 ; =0xFFFE9680
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
_037FCE84: .word 0xFFFE9680
	arm_func_end sub_037FCE50

	arm_func_start sub_037FCE88
sub_037FCE88: ; 0x037FCE88
	stmdb sp!, {r3, lr}
	ldr r3, _037FCEE4 ; =0x0380794C
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
	ldr r1, _037FCEE8 ; =0x03807B8C
	mov r2, #0
_037FCEC4:
	ldrb r0, [r1, r2, lsl #6]
	bic r0, r0, #1
	strb r0, [r1, r2, lsl #6]
	add r2, r2, #1
	cmp r2, #0x20
	blt _037FCEC4
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FCEE4: .word 0x0380794C
_037FCEE8: .word 0x03807B8C
	arm_func_end sub_037FCE88

	arm_func_start sub_037FCEEC
sub_037FCEEC: ; 0x037FCEEC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, #0
	mov sb, r0
	mov r5, r6
_037FCEFC:
	mov r0, #0x24
	mul r0, r5, r0
	ldr r2, _037FD044 ; =0x0380794C
	ldrb r1, [r2, r0]
	add r4, r2, r0
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _037FD020
	mov r0, r1, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _037FD00C
	cmp sb, #0
	beq _037FCFD8
	mov r0, r1, lsl #0x1d
	movs r0, r0, lsr #0x1f
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
	bl sub_037FDC88
	cmp r0, #0
	beq _037FCF8C
	mov r0, r4
	bl sub_037FDA98
	b _037FCF98
_037FCF8C:
	add r7, r7, #1
_037FCF90:
	cmp r7, r8
	blt _037FCF6C
_037FCF98:
	ldr r0, _037FD048 ; =0x03807408
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
	bl sub_037FDA14
	cmp r0, #0
	beq _037FD000
	mov r1, r4
	mov r2, r7
	bl sub_037FDB30
_037FD000:
	add r8, r8, #1
	cmp r8, #0x10
	blt _037FCFE0
_037FD00C:
	ldrb r0, [r4]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	movne r0, #1
	orrne r6, r6, r0, lsl r5
_037FD020:
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FCEFC
	ldr r0, _037FD048 ; =0x03807408
	ldr r0, [r0]
	cmp r0, #0
	strne r6, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037FD044: .word 0x0380794C
_037FD048: .word 0x03807408
	arm_func_end sub_037FCEEC

	arm_func_start sub_037FD04C
sub_037FD04C: ; 0x037FD04C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0x24
	mul r5, sb, r0
	ldr r6, _037FD21C ; =0x0380794C
	mov r8, r1
	ldrb r0, [r6, r5]
	mov r7, r2
	mov r0, r0, lsl #0x1f
	mov r4, r3
	add r5, r6, r5
	movs r0, r0, lsr #0x1f
	beq _037FD088
	mov r0, r5
	bl sub_037FDA98
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
	ldr r1, _037FD220 ; =0x03807408
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
	bl sub_037FE81C
	movs r4, r0
	bmi _037FD214
	ldr r0, _037FD224 ; =0x03807B8C
	add r6, r0, r4, lsl #6
	mov r0, r6
	bl sub_037FD888
	str r8, [r6, #0x24]
	add r0, r8, r7
	str r0, [r6, #0x28]
	strb r4, [r5, #8]
	ldr r0, [r6, #0x28]
	bl sub_037FD71C
	mov r0, r6
	bl sub_037FD228
	cmp r0, #0xfe
	ldrne r0, [r6, #0x28]
	subne r0, r0, #1
	strne r0, [r6, #0x28]
	bne _037FD1E0
	mov r0, r6
	bl sub_037FD228
	mov r4, r0
	mov r0, r6
	bl sub_037FD228
	orr r0, r4, r0, lsl #8
	mov r0, r0, lsl #0x10
	ldr r4, _037FD224 ; =0x03807B8C
	mov r8, r0, lsr #0x11
	mov r7, #1
	b _037FD1D8
_037FD1A8:
	tst r8, #1
	beq _037FD1CC
	bl sub_037FE81C
	movs r6, r0
	bmi _037FD1E0
	add r0, r4, r6, lsl #6
	bl sub_037FD888
	add r0, r5, r7
	strb r6, [r0, #8]
_037FD1CC:
	mov r0, r8, lsl #0xf
	add r7, r7, #1
	mov r8, r0, lsr #0x10
_037FD1D8:
	cmp r8, #0
	bne _037FD1A8
_037FD1E0:
	ldrb r1, [r5]
	ldr r0, _037FD220 ; =0x03807408
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
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FD21C: .word 0x0380794C
_037FD220: .word 0x03807408
_037FD224: .word 0x03807B8C
	arm_func_end sub_037FD04C

	arm_func_start sub_037FD228
sub_037FD228: ; 0x037FD228
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _037FD280 ; =0x038073EC
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
	bl sub_037FD71C
_037FD258:
	ldr r0, _037FD280 ; =0x038073EC
	ldr r1, [r5, #0x28]
	ldr r2, [r0, #4]
	ldr r0, _037FD284 ; =0x038073F8
	sub r2, r4, r2
	ldrb r0, [r0, r2]
	add r1, r1, #1
	str r1, [r5, #0x28]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FD280: .word 0x038073EC
_037FD284: .word 0x038073F8
	arm_func_end sub_037FD228

	arm_func_start sub_037FD288
sub_037FD288: ; 0x037FD288
	mov r1, #0x24
	mul r1, r0, r1
	ldr r2, _037FD2A4 ; =0x0380794C
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	bx lr
	.align 2, 0
_037FD2A4: .word 0x0380794C
	arm_func_end sub_037FD288

	arm_func_start sub_037FD2A8
sub_037FD2A8: ; 0x037FD2A8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_037FD04C
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _037FD2D4 ; =0x0380794C
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FD2D4: .word 0x0380794C
	arm_func_end sub_037FD2A8

	arm_func_start sub_037FD2D8
sub_037FD2D8: ; 0x037FD2D8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _037FD32C ; =0x0380794C
	ldrb r0, [r2, r1]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _037FD324
	add r0, r2, r1
	bl sub_037FDA98
	ldr r0, _037FD330 ; =0x03807408
	ldr r2, [r0]
	cmp r2, #0
	movne r0, #1
	ldrne r1, [r2, #4]
	mvnne r0, r0, lsl r4
	andne r0, r1, r0
	strne r0, [r2, #4]
_037FD324:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FD32C: .word 0x0380794C
_037FD330: .word 0x03807408
	arm_func_end sub_037FD2D8

	arm_func_start sub_037FD334
sub_037FD334: ; 0x037FD334
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r2, #0x24
	mul r4, r0, r2
	ldr r5, _037FD3A8 ; =0x0380794C
	and r0, r1, #0xff
	ldrb r2, [r5, r4]
	mov r0, r0, lsl #0x1f
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
	bl sub_037FDA14
	movs r7, r0
	beq _037FD394
	mov r2, r6
	add r1, r5, r4
	bl sub_037FD978
	mov r0, r7
	bl sub_037FD9E0
_037FD394:
	add r8, r8, #1
	cmp r8, #0x10
	blt _037FD36C
_037FD3A0:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD3A8: .word 0x0380794C
	arm_func_end sub_037FD334

	arm_func_start sub_037FD3AC
sub_037FD3AC: ; 0x037FD3AC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _037FD470 ; =0x0380794C
	mov r2, #0x24
	mla r6, r0, r2, r3
	mov r8, r1
	mov r7, #0
	mov r4, #0x7f
_037FD3C8:
	mov r0, r6
	mov r1, r7
	bl sub_037FDA14
	movs r5, r0
	beq _037FD3F0
	mov r1, r6
	mov r2, r4
	bl sub_037FD978
	mov r0, r5
	bl sub_037FD9E0
_037FD3F0:
	add r7, r7, #1
	cmp r7, #0x10
	blt _037FD3C8
	bl sub_037FBF48
	mov r4, #0
	mov r5, r4
	b _037FD430
_037FD40C:
	mov r0, r6
	mov r1, r5
	bl sub_037FDC88
	cmp r0, #0
	beq _037FD42C
	mov r0, r6
	bl sub_037FDA98
	b _037FD438
_037FD42C:
	add r4, r4, #1
_037FD430:
	cmp r4, r8
	blo _037FD40C
_037FD438:
	bl sub_037FBEF8
	ldr r0, _037FD474 ; =0x03807408
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
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD470: .word 0x0380794C
_037FD474: .word 0x03807408
	arm_func_end sub_037FD3AC

	arm_func_start sub_037FD478
sub_037FD478: ; 0x037FD478
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	ldr r5, _037FD4E0 ; =0x0380794C
	mov r8, r1
	mov r7, r2
	mov r6, #0
	b _037FD4C8
_037FD498:
	tst r8, #1
	beq _037FD4C0
	mov r1, r6
	add r0, r5, r4
	bl sub_037FDA14
	cmp r0, #0
	beq _037FD4C0
	mov r2, r7
	add r1, r5, r4
	bl sub_037FE860
_037FD4C0:
	add r6, r6, #1
	mov r8, r8, lsr #1
_037FD4C8:
	cmp r6, #0x10
	bge _037FD4D8
	cmp r8, #0
	bne _037FD498
_037FD4D8:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD4E0: .word 0x0380794C
	arm_func_end sub_037FD478

	arm_func_start sub_037FD4E4
sub_037FD4E4: ; 0x037FD4E4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	mov r0, r2, lsl #0x10
	ldr r5, _037FD550 ; =0x0380794C
	mov r7, r1
	mov r6, #0
	mov r8, r0, lsr #0x10
	b _037FD538
_037FD508:
	tst r7, #1
	beq _037FD530
	mov r1, r6
	add r0, r5, r4
	bl sub_037FDA14
	cmp r0, #0
	strneh r8, [r0, #0x1e]
	ldrneb r1, [r0]
	orrne r1, r1, #0x80
	strneb r1, [r0]
_037FD530:
	add r6, r6, #1
	mov r7, r7, lsr #1
_037FD538:
	cmp r6, #0x10
	bge _037FD548
	cmp r7, #0
	bne _037FD508
_037FD548:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD550: .word 0x0380794C
	arm_func_end sub_037FD4E4

	arm_func_start sub_037FD554
sub_037FD554: ; 0x037FD554
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r6, _037FD5DC ; =0x0380794C
	mov r7, #0
	mov sl, r0
	mov sb, r1
	mov fp, r7
	mov r4, #0x24
_037FD570:
	mul r5, r7, r4
	ldrb r0, [r6, r5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _037FD5C8
	mov r8, fp
	b _037FD5C0
_037FD58C:
	mov r1, r8
	add r0, r6, r5
	bl sub_037FDA14
	cmp r0, #0
	beq _037FD5BC
	ldr r0, [r0, #0x28]
	cmp sl, r0
	cmpls r0, sb
	bhi _037FD5BC
	add r0, r6, r5
	bl sub_037FDA98
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
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FD5DC: .word 0x0380794C
	arm_func_end sub_037FD554

	arm_func_start sub_037FD5E0
sub_037FD5E0: ; 0x037FD5E0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _037FD638 ; =0x0380794C
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r8, #0x24
_037FD5F8:
	mul r0, r5, r8
	ldrb r1, [r4, r0]
	add r0, r4, r0
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	beq _037FD624
	ldr r1, [r0, #0x20]
	cmp r7, r1
	cmpls r1, r6
	bhi _037FD624
	bl sub_037FDA98
_037FD624:
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FD5F8
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD638: .word 0x0380794C
	arm_func_end sub_037FD5E0

	arm_func_start sub_037FD63C
sub_037FD63C: ; 0x037FD63C
	stmdb sp!, {r3, lr}
	ldr lr, _037FD67C ; =0x0380794C
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
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FD67C: .word 0x0380794C
	arm_func_end sub_037FD63C

	arm_func_start sub_037FD680
sub_037FD680: ; 0x037FD680
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0x24
	mul r5, r0, r4
	mov r8, r3
	mov r0, r8, lsl #0x10
	ldr r7, [sp, #0x28]
	mov sl, r1
	mov sb, r2
	mov r6, #0
	mov fp, r0, lsr #0x10
	and r4, r8, #0xff
	b _037FD700
_037FD6B0:
	tst sl, #1
	beq _037FD6F8
	ldr r0, _037FD718 ; =0x0380794C
	mov r1, r6
	add r0, r0, r5
	bl sub_037FDA14
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
	mov sl, sl, lsr #1
_037FD700:
	cmp r6, #0x10
	bge _037FD710
	cmp sl, #0
	bne _037FD6B0
_037FD710:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FD718: .word 0x0380794C
	arm_func_end sub_037FD680

	arm_func_start sub_037FD71C
sub_037FD71C: ; 0x037FD71C
	ldr r1, _037FD754 ; =0x038073EC
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
_037FD754: .word 0x038073EC
	arm_func_end sub_037FD71C

	arm_func_start sub_037FD758
sub_037FD758: ; 0x037FD758
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_037FD228
	mov r4, r0
	mov r0, r5
	bl sub_037FD228
	orr r4, r4, r0, lsl #8
	mov r0, r5
	bl sub_037FD228
	orr r0, r4, r0, lsl #16
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FD758

	arm_func_start sub_037FD788
sub_037FD788: ; 0x037FD788
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _037FD87C
_037FD7A0: ; jump table
	b _037FD7B4 ; case 0
	b _037FD7C0 ; case 1
	b _037FD7E0 ; case 2
	b _037FD81C ; case 3
	b _037FD800 ; case 4
_037FD7B4:
	bl sub_037FD228
	mov r5, r0
	b _037FD87C
_037FD7C0:
	bl sub_037FD228
	mov r5, r0
	mov r0, r4
	bl sub_037FD228
	orr r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	b _037FD87C
_037FD7E0:
	mov r5, #0
_037FD7E4:
	mov r0, r4
	bl sub_037FD228
	and r1, r0, #0x7f
	tst r0, #0x80
	orr r5, r1, r5, lsl #7
	bne _037FD7E4
	b _037FD87C
_037FD800:
	bl sub_037FD228
	mov r1, r0
	mov r0, r6
	bl sub_037FE7D8
	cmp r0, #0
	ldrnesh r5, [r0]
	b _037FD87C
_037FD81C:
	bl sub_037FD228
	mov r5, r0
	mov r0, r4
	bl sub_037FD228
	orr r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r4
	mov r5, r1, lsl #0x10
	bl sub_037FD228
	mov r6, r0
	mov r0, r4
	bl sub_037FD228
	orr r0, r6, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	bl sub_037FBE58
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	sub r1, r1, r5, asr #16
	add r1, r1, #1
	mul r1, r0, r1
	mov r0, r1, asr #0x10
	add r5, r0, r5, asr #16
_037FD87C:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_037FD788

	arm_func_start sub_037FD888
sub_037FD888: ; 0x037FD888
	stmdb sp!, {r4, lr}
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
	bl sub_037FCD28
	mov r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x3c]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_037FD888

	arm_func_start sub_037FD968
sub_037FD968: ; 0x037FD968
	str r1, [r0, #0x24]
	add r1, r1, r2
	str r1, [r0, #0x28]
	bx lr
	arm_func_end sub_037FD968

	arm_func_start sub_037FD978
sub_037FD978: ; 0x037FD978
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r4, r0
	mov r2, #0
	bl sub_037FDB30
	ldr r5, [r4, #0x3c]
	and r6, r7, #0xff
	mov r4, #1
	b _037FD9D0
_037FD99C:
	mov r0, r5
	bl sub_037FC8D8
	cmp r0, #0
	beq _037FD9CC
	cmp r7, #0
	blt _037FD9C0
	mov r0, r5
	mov r1, r6
	bl sub_037FC8B0
_037FD9C0:
	mov r0, r5
	strb r4, [r5, #0x22]
	bl sub_037FC8CC
_037FD9CC:
	ldr r5, [r5, #0x50]
_037FD9D0:
	cmp r5, #0
	bne _037FD99C
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_037FD978

	arm_func_start sub_037FD9E0
sub_037FD9E0: ; 0x037FD9E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0x3c]
	b _037FD9FC
_037FD9F0:
	mov r0, r4
	bl sub_037FCAB4
	ldr r4, [r4, #0x50]
_037FD9FC:
	cmp r4, #0
	bne _037FD9F0
	mov r0, #0
	str r0, [r5, #0x3c]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FD9E0

	arm_func_start sub_037FDA14
sub_037FDA14: ; 0x037FDA14
	cmp r1, #0xf
	movgt r0, #0
	bxgt lr
	add r0, r0, r1
	ldrb r1, [r0, #8]
	cmp r1, #0xff
	moveq r0, #0
	ldrne r0, _037FDA3C ; =0x03807B8C
	addne r0, r0, r1, lsl #6
	bx lr
	.align 2, 0
_037FDA3C: .word 0x03807B8C
	arm_func_end sub_037FDA14

	arm_func_start sub_037FDA40
sub_037FDA40: ; 0x037FDA40
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r1
	bl sub_037FDA14
	movs r5, r0
	beq _037FDA8C
	mov r1, r6
	mvn r2, #0
	bl sub_037FD978
	mov r0, r5
	bl sub_037FD9E0
	add ip, r6, #8
	ldrb r2, [ip, r4]
	ldr r3, _037FDA94 ; =0x03807B8C
	mov r0, #0xff
	ldrb r1, [r3, r2, lsl #6]
	bic r1, r1, #1
	strb r1, [r3, r2, lsl #6]
	strb r0, [ip, r4]
_037FDA8C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FDA94: .word 0x03807B8C
	arm_func_end sub_037FDA40

	arm_func_start sub_037FDA98
sub_037FDA98: ; 0x037FDA98
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
_037FDAA4:
	mov r0, r5
	mov r1, r4
	bl sub_037FDA40
	add r4, r4, #1
	cmp r4, #0x10
	blt _037FDAA4
	ldrb r0, [r5]
	bic r0, r0, #1
	strb r0, [r5]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FDA98

	arm_func_start sub_037FDAD0
sub_037FDAD0: ; 0x037FDAD0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	cmp r1, #1
	bne _037FDAF0
	mov r1, #0
	strb r1, [r5, #0x22]
	bl sub_037FCAB4
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
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FDAD0

	arm_func_start sub_037FDB30
sub_037FDB30: ; 0x037FDB30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldrb r0, [sl, #7]
	ldrb r6, [sl, #4]
	ldrb r3, [sl, #5]
	ldrb fp, [r1, #5]
	mov r5, r0, lsl #6
	mov r8, r3, lsl #1
	ldrb r4, [sl, #1]
	ldrsb r7, [sl, #6]
	mov sb, r6, lsl #1
	ldr r0, _037FDC84 ; =0x03806670
	mul r6, r7, r5
	mov r3, fp, lsl #1
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
	movne r3, r3, asr #7
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
	mov r0, r0, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x18
	mov r1, r1, lsl #0x10
	ldr r8, [sl, #0x3c]
	mov r6, r0, asr #0x10
	mov r5, r2, asr #0x10
	mov r4, r3, asr #0x18
	mov r7, r1, asr #0x10
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
	bl sub_037FC8CC
_037FDC70:
	ldr r8, [r8, #0x50]
_037FDC74:
	cmp r8, #0
	bne _037FDC14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FDC84: .word 0x03806670
	arm_func_end sub_037FDB30

	arm_func_start sub_037FDC88
sub_037FDC88: ; 0x037FDC88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r2, #0
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	mov r7, r0
	mov sl, r2
_037FDCA4:
	mov r0, r7
	mov r1, sl
	bl sub_037FDA14
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
	mov r1, r1, lsl #0x1d
	movs r1, r1, lsr #0x1f
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
	mov r0, r1, lsl #0x1b
	movs r0, r0, lsr #0x1f
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
	bl sub_037FD71C
	ldr r0, _037FE7CC ; =0x0000FFFF
	sub fp, r0, #0x10000
	b _037FE768
_037FDD60:
	mov r0, r8
	mov sb, #0
	mov r4, #1
	bl sub_037FD228
	mov r6, r0
	cmp r6, #0xa2
	bne _037FDD94
	mov r0, r8
	bl sub_037FD228
	mov r6, r0
	ldrb r0, [r8]
	mov r0, r0, lsl #0x19
	mov r4, r0, lsr #0x1f
_037FDD94:
	cmp r6, #0xa0
	bne _037FDDB0
	mov r0, r8
	bl sub_037FD228
	mov r6, r0
	mov r5, #3
	mov sb, #1
_037FDDB0:
	cmp r6, #0xa1
	bne _037FDDCC
	mov r0, r8
	bl sub_037FD228
	mov r6, r0
	mov r5, #4
	mov sb, #1
_037FDDCC:
	tst r6, #0x80
	bne _037FE050
	mov r0, r8
	bl sub_037FD228
	cmp sb, #0
	str r0, [sp, #0xc]
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl sub_037FD788
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
	mov r0, r1, lsl #0x1d
	movs r0, r0, lsr #0x1f
	bne _037FE024
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _037FE024
	mov r0, r1, lsl #0x1c
	mov r6, #0
	movs r0, r0, lsr #0x1f
	ldrne r6, [r8, #0x3c]
	cmpne r6, #0
	strneb sb, [r6, #8]
	ldrne r0, [sp, #0xc]
	strneb r0, [r6, #9]
	cmp r6, #0
	bne _037FDF54
	ldr r0, [r7, #0x20]
	ldrh r1, [r8, #2]
	mov r2, sb
	add r3, sp, #0x16
	bl sub_037FE8E0
	cmp r0, #0
	beq _037FE024
	ldrb r0, [sp, #0x16]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _037FE024
_037FDE90: ; jump table
	b _037FE024 ; case 0
	b _037FDEA4 ; case 1
	b _037FDEAC ; case 2
	b _037FDEB4 ; case 3
	b _037FDEA4 ; case 4
_037FDEA4:
	ldr r1, _037FE7CC ; =0x0000FFFF
	b _037FDEB8
_037FDEAC:
	mov r1, #0x3f00
	b _037FDEB8
_037FDEB4:
	mov r1, #0xc000
_037FDEB8:
	ldrh r0, [r8, #0x1e]
	ldr r3, _037FE7D0 ; =sub_037FDAD0
	str r8, [sp]
	ldrb r2, [r8]
	and r0, r1, r0
	mov r2, r2, lsl #0x18
	ldrb r6, [r7, #4]
	ldrb r1, [r8, #0x12]
	mov r2, r2, lsr #0x1f
	add r1, r6, r1
	bl sub_037FC8E8
	movs r6, r0
	beq _037FE024
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
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
	bl sub_037FEAA0
	cmp r0, #0
	bne _037FDF48
	mov r0, #0
	strb r0, [r6, #0x22]
	mov r0, r6
	bl sub_037FCAB4
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
	bl sub_037FC86C
_037FDF68:
	ldrb r1, [r8, #0xf]
	cmp r1, #0xff
	beq _037FDF7C
	mov r0, r6
	bl sub_037FC88C
_037FDF7C:
	ldrb r1, [r8, #0x10]
	cmp r1, #0xff
	beq _037FDF90
	mov r0, r6
	bl sub_037FC8A8
_037FDF90:
	ldrb r1, [r8, #0x11]
	cmp r1, #0xff
	beq _037FDFA4
	mov r0, r6
	bl sub_037FC8B0
_037FDFA4:
	ldrsh r0, [r8, #0x16]
	strh r0, [r6, #0x32]
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _037FDFD4
	ldrsh r1, [r6, #0x32]
	ldrb r0, [r8, #0x14]
	sub r0, r0, sb
	mov r0, r0, lsl #0x16
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
	mov r0, r0, asr #0xb
	str r0, [r6, #0x18]
_037FE01C:
	mov r0, #0
	str r0, [r6, #0x14]
_037FE024:
	strb sb, [r8, #0x14]
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _037FE768
	str r4, [r8, #0x20]
	cmp r4, #0
	ldreqb r0, [r8]
	orreq r0, r0, #0x10
	streqb r0, [r8]
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
	bl sub_037FD788
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
	strlth r0, [r8, #2]
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
	bl sub_037FD228
	mov r6, r0
	mov r0, r8
	bl sub_037FD758
	cmp r4, #0
	mov sb, r0
	beq _037FE768
	mov r1, r6
	mov r0, r7
	bl sub_037FDA14
	movs r4, r0
	cmpne r4, r8
	beq _037FE768
	mov r1, r7
	mov r2, fp
	bl sub_037FD978
	mov r0, r4
	bl sub_037FD9E0
	mov r0, r4
	mov r2, sb
	ldr r1, [r8, #0x24]
	bl sub_037FD968
	b _037FE768
_037FE16C:
	mov r0, r8
	bl sub_037FD758
	cmp r4, #0
	ldrne r1, [r8, #0x24]
	addne r0, r1, r0
	strne r0, [r8, #0x28]
	b _037FE768
_037FE188:
	mov r0, r8
	bl sub_037FD758
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
	bl sub_037FD788
	cmp r4, #0
	strb r0, [sp, #0x14]
	beq _037FE768
	sub r1, r6, #0xc0
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _037FE768
_037FE200: ; jump table
	b _037FE3F8 ; case 0
	b _037FE260 ; case 1
	b _037FE278 ; case 2
	b _037FE3E0 ; case 3
	b _037FE3EC ; case 4
	b _037FE284 ; case 5
	b _037FE290 ; case 6
	b _037FE29C ; case 7
	b _037FE35C ; case 8
	b _037FE3A4 ; case 9
	b _037FE2C4 ; case 10
	b _037FE2D0 ; case 11
	b _037FE2DC ; case 12
	b _037FE2E8 ; case 13
	b _037FE3C4 ; case 14
	b _037FE2B8 ; case 15
	b _037FE2F4 ; case 16
	b _037FE300 ; case 17
	b _037FE30C ; case 18
	b _037FE318 ; case 19
	b _037FE324 ; case 20
	b _037FE26C ; case 21
	b _037FE408 ; case 22
	b _037FE390 ; case 23
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
	mov r0, r0, lsl #0x1f
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
	mov r1, r0, lsl #0x1f
	ldrb r2, [r8]
	mov r0, r8
	bic r2, r2, #8
	orr r1, r2, r1, lsr #28
	strb r1, [r8]
	mov r1, r7
	mov r2, fp
	bl sub_037FD978
	mov r0, r8
	bl sub_037FD9E0
	b _037FE768
_037FE390:
	and r2, r0, #0xff
	mov r0, r8
	mov r1, r7
	bl sub_037FE860
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
	mov r0, r0, lsl #0x1f
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
	ldr r1, _037FE7D4 ; =0x038073EC
	ldr r1, [r1]
	cmp r1, #0
	beq _037FE768
	and r1, r0, #0xff
	mov r0, r7
	bl sub_037FE7D8
	b _037FE768
_037FE428:
	cmp sb, #0
	movne r2, r5
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl sub_037FD788
	mov r0, r0, lsl #0x10
	cmp r4, #0
	mov r0, r0, asr #0x10
	beq _037FE768
	cmp r6, #0xe0
	beq _037FE474
	cmp r6, #0xe1
	beq _037FE46C
	cmp r6, #0xe3
	streqh r0, [r8, #0x16]
	b _037FE768
_037FE46C:
	strh r0, [r7, #0x18]
	b _037FE768
_037FE474:
	strh r0, [r8, #0x1c]
	b _037FE768
_037FE47C:
	mov r0, r8
	bl sub_037FD228
	cmp sb, #0
	movne r2, r5
	mov sb, r0
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl sub_037FD788
	mov r0, r0, lsl #0x10
	mov r1, sb
	mov sb, r0, asr #0x10
	mov r0, r7
	bl sub_037FE7D8
	cmp r4, #0
	mov r4, r0
	cmpne r4, #0
	beq _037FE768
	sub r0, r6, #0xb0
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _037FE768
_037FE4D4: ; jump table
	b _037FE50C ; case 0
	b _037FE514 ; case 1
	b _037FE524 ; case 2
	b _037FE534 ; case 3
	b _037FE544 ; case 4
	b _037FE560 ; case 5
	b _037FE584 ; case 6
	b _037FE768 ; case 7
	b _037FE5BC ; case 8
	b _037FE5E8 ; case 9
	b _037FE614 ; case 10
	b _037FE640 ; case 11
	b _037FE66C ; case 12
	b _037FE698 ; case 13
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
	bl _s32_div_f
	strh r0, [r4]
	b _037FE768
_037FE560:
	cmp sb, #0
	ldrgesh r0, [r4]
	movge r0, r0, lsl sb
	strgeh r0, [r4]
	ldrltsh r1, [r4]
	rsblt r0, sb, #0
	movlt r0, r1, asr r0
	strlth r0, [r4]
	b _037FE768
_037FE584:
	cmp sb, #0
	rsblt r0, sb, #0
	movlt r0, r0, lsl #0x10
	mov r6, #0
	movlt sb, r0, asr #0x10
	movlt r6, #1
	bl sub_037FBE58
	add r1, sb, #1
	mul r1, r0, r1
	mov r0, r1, asr #0x10
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
	mov r0, r0, lsl #0x1f
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
	mov r0, r0, lsl #0x1f
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
	mov r0, r0, lsl #0x1f
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
	mov r0, r0, lsl #0x1f
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
	mov r0, r0, lsl #0x1f
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
	mov r0, r0, lsl #0x1f
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
_037FE6DC: ; jump table
	b _037FE714 ; case 0
	b _037FE6EC ; case 1
	b _037FE768 ; case 2
	b _037FE760 ; case 3
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
	ldreqb r0, [r8, #0x3b]
	subeq r0, r0, #1
	streqb r0, [r8, #0x3b]
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
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
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
	bl sub_037FDA40
_037FE7A4:
	add sl, sl, #1
	cmp sl, #0x10
	blt _037FDCA4
	ldr r0, [sp, #0x10]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FE7CC: .word 0x0000FFFF
_037FE7D0: .word sub_037FDAD0
_037FE7D4: .word 0x038073EC
	arm_func_end sub_037FDC88

	arm_func_start sub_037FE7D8
sub_037FE7D8: ; 0x037FE7D8
	ldr r2, _037FE818 ; =0x03807408
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
_037FE818: .word 0x03807408
	arm_func_end sub_037FE7D8

	arm_func_start sub_037FE81C
sub_037FE81C: ; 0x037FE81C
	ldr ip, _037FE85C ; =0x03807B8C
	mov r0, #0
	b _037FE84C
_037FE828:
	ldrb r1, [ip, r0, lsl #6]
	mov r3, r0, lsl #6
	mov r2, r1, lsl #0x1f
	movs r2, r2, lsr #0x1f
	biceq r1, r1, #1
	orreq r1, r1, #1
	streqb r1, [ip, r3]
	bxeq lr
	add r0, r0, #1
_037FE84C:
	cmp r0, #0x20
	blt _037FE828
	mvn r0, #0
	bx lr
	.align 2, 0
_037FE85C: .word 0x03807B8C
	arm_func_end sub_037FE81C

	arm_func_start sub_037FE860
sub_037FE860: ; 0x037FE860
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _037FE8D8
_037FE874: ; jump table
	b _037FE884 ; case 0
	b _037FE894 ; case 1
	b _037FE8A4 ; case 2
	b _037FE8BC ; case 3
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
	bl sub_037FD978
	b _037FE8D8
_037FE8BC:
	ldrb r3, [r4]
	mov r2, #0x7f
	orr r3, r3, #4
	strb r3, [r4]
	bl sub_037FD978
	mov r0, r4
	bl sub_037FD9E0
_037FE8D8:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_037FE860

	arm_func_start sub_037FE8E0
sub_037FE8E0: ; 0x037FE8E0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r7, r1
	mov r6, r0
	mov r5, r2
	mov r4, r3
	movmi r0, #0
	bmi _037FEA58
	bl sub_037FBF78
	ldr r0, [r6, #0x38]
	cmp r7, r0
	blo _037FE918
	bl sub_037FBF7C
	mov r0, #0
	b _037FEA58
_037FE918:
	add r0, r6, r7, lsl #2
	ldr r1, [r0, #0x3c]
	and r0, r1, #0xff
	strb r1, [r4]
	cmp r0, #0x11
	mov r1, r1, lsr #8
	addls pc, pc, r0, lsl #2
	b _037FEA44
_037FE938: ; jump table
	b _037FEA44 ; case 0
	b _037FE980 ; case 1
	b _037FE980 ; case 2
	b _037FE980 ; case 3
	b _037FE980 ; case 4
	b _037FE980 ; case 5
	b _037FEA44 ; case 6
	b _037FEA44 ; case 7
	b _037FEA44 ; case 8
	b _037FEA44 ; case 9
	b _037FEA44 ; case 10
	b _037FEA44 ; case 11
	b _037FEA44 ; case 12
	b _037FEA44 ; case 13
	b _037FEA44 ; case 14
	b _037FEA44 ; case 15
	b _037FE9A0 ; case 16
	b _037FE9F0 ; case 17
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
	bl sub_037FBF7C
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
	bl sub_037FBF7C
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
	bl sub_037FBF7C
	mov r0, #0
	b _037FEA58
_037FEA50:
	bl sub_037FBF7C
	mov r0, #1
_037FEA58:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_037FE8E0

	arm_func_start sub_037FEA60
sub_037FEA60: ; 0x037FEA60
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_037FBF78
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
	bl sub_037FBF7C
	mov r0, r4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FEA60

	arm_func_start sub_037FEAA0
sub_037FEAA0: ; 0x037FEAA0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
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
_037FEAD8: ; jump table
	b _037FEB80 ; case 0
	b _037FEAEC ; case 1
	b _037FEB5C ; case 2
	b _037FEB70 ; case 3
	b _037FEAEC ; case 4
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
	bl sub_037FEA60
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
	bl sub_037FC6F8
	b _037FEB84
_037FEB5C:
	ldrh r1, [r5, #2]
	mov r0, sb
	mov r2, r6
	bl sub_037FC734
	b _037FEB84
_037FEB70:
	mov r0, sb
	mov r1, r6
	bl sub_037FC780
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
	bl sub_037FC86C
	ldrb r1, [r5, #8]
	mov r0, sb
	bl sub_037FC88C
	ldrb r1, [r5, #9]
	mov r0, sb
	bl sub_037FC8A8
	mov r0, sb
	mov r1, r4
	bl sub_037FC8B0
	ldrb r1, [r5, #0xb]
	mov r0, #1
	sub r1, r1, #0x40
	strb r1, [sb, #0xa]
_037FEBE0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end sub_037FEAA0

	arm_func_start sub_037FEBE8
sub_037FEBE8: ; 0x037FEBE8
	ldr ip, _037FEC04 ; =0x03807408
	mov r3, #0x24
	ldr ip, [ip]
	mla r3, r0, r3, ip
	add r0, r3, r1, lsl #1
	strh r2, [r0, #0x20]
	bx lr
	.align 2, 0
_037FEC04: .word 0x03807408
	arm_func_end sub_037FEBE8

	arm_func_start sub_037FEC08
sub_037FEC08: ; 0x037FEC08
	ldr r2, _037FEC20 ; =0x03807408
	ldr r2, [r2]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x200
	strh r1, [r0, #0x60]
	bx lr
	.align 2, 0
_037FEC20: .word 0x03807408
	arm_func_end sub_037FEC08

	arm_func_start sub_037FEC24
sub_037FEC24: ; 0x037FEC24
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _037FECB8 ; =0x03807408
	mov r4, #0
	ldr r0, [r0]
	mov r5, r4
	cmp r0, #0
	beq _037FECB0
	mov r7, r4
	mov r6, #1
_037FEC48:
	mov r0, r7
	bl sub_037FBAE4
	cmp r0, #0
	orrne r0, r4, r6, lsl r7
	movne r0, r0, lsl #0x10
	add r7, r7, #1
	movne r4, r0, lsr #0x10
	cmp r7, #0x10
	blt _037FEC48
	mov r0, #0
	bl sub_037FC0E0
	cmp r0, #0
	orrne r0, r5, #1
	movne r0, r0, lsl #0x10
	movne r5, r0, lsr #0x10
	mov r0, #1
	bl sub_037FC0E0
	cmp r0, #0
	orrne r0, r5, #2
	movne r0, r0, lsl #0x10
	movne r5, r0, lsr #0x10
	ldr r0, _037FECB8 ; =0x03807408
	ldr r1, [r0]
	strh r4, [r1, #8]
	ldr r0, [r0]
	strh r5, [r0, #0xa]
_037FECB0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FECB8: .word 0x03807408
	arm_func_end sub_037FEC24

	arm_func_start sub_037FECBC
sub_037FECBC: ; 0x037FECBC
	ldr r1, _037FECE4 ; =0x0380740C
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
_037FECE4: .word 0x0380740C
	arm_func_end sub_037FECBC

	arm_func_start sub_037FECE8
sub_037FECE8: ; 0x037FECE8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr lr, _037FED40 ; =0x0380838C
	ldr r4, [sp, #0x18]
	ldrb ip, [lr, r0, lsl #6]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp ip, #0
	add r8, lr, r0, lsl #6
	beq _037FED20
	add r0, r8, #0x14
	bl sub_037FA5E4
	mov r0, #0
	strb r0, [r8]
_037FED20:
	str r7, [r8, #4]
	str r6, [r8, #8]
	str r5, [r8, #0xc]
	ldr r0, [sp, #0x1c]
	str r4, [r8, #0x10]
	strb r0, [r8, #1]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FED40: .word 0x0380838C
	arm_func_end sub_037FECE8

	arm_func_start sub_037FED44
sub_037FED44: ; 0x037FED44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	ldr r1, _037FEDF8 ; =0x0380838C
	mov sb, r0
	ldrb r0, [r1, sb, lsl #6]
	add r8, r1, sb, lsl #6
	cmp r0, #0
	beq _037FED74
	add r0, r8, #0x14
	bl sub_037FA5E4
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
	bl OS_CreateAlarm
	cmp r6, #0
	cmpeq r7, #0
	bne _037FEDBC
	ldr r3, _037FEDFC ; =sub_037FEE40
	mov r1, r5
	mov r2, r4
	add r0, r8, #0x14
	str sb, [sp]
	bl OS_SetAlarm
	b _037FEDE4
_037FEDBC:
	bl sub_037FA240
	ldr r2, _037FEDFC ; =sub_037FEE40
	adds r0, r5, r0
	stmib sp, {r2, sb}
	adc r2, r4, r1
	mov r1, r0
	mov r3, r7
	add r0, r8, #0x14
	str r6, [sp]
	bl sub_037FA570
_037FEDE4:
	mov r0, #1
	strb r0, [r8]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FEDF8: .word 0x0380838C
_037FEDFC: .word sub_037FEE40
	arm_func_end sub_037FED44

	arm_func_start sub_037FEE00
sub_037FEE00: ; 0x037FEE00
	stmdb sp!, {r4, lr}
	ldr r2, _037FEE3C ; =0x0380838C
	ldrb r1, [r2, r0, lsl #6]
	add r4, r2, r0, lsl #6
	cmp r1, #0
	beq _037FEE34
	add r0, r4, #0x14
	bl sub_037FA5E4
	ldrb r1, [r4, #1]
	mov r0, #0
	add r1, r1, #1
	strb r1, [r4, #1]
	strb r0, [r4]
_037FEE34:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FEE3C: .word 0x0380838C
	arm_func_end sub_037FEE00

	arm_func_start sub_037FEE40
sub_037FEE40: ; 0x037FEE40
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #7
	mov r4, #0
_037FEE50:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	blt _037FEE50
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_037FEE40

	arm_func_start sub_037FEE70
sub_037FEE70: ; 0x037FEE70
	stmdb sp!, {r3, lr}
	ldr r0, _037FEEA4 ; =0x0380858C
	ldr r1, _037FEEA8 ; =0x038085AC
	mov r2, #8
	bl OS_InitMessageQueue
	ldr r1, _037FEEAC ; =sub_037FF564
	mov r0, #7
	bl PXI_SetFifoRecvCallback
	ldr r0, _037FEEB0 ; =0x03807408
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FEEA4: .word 0x0380858C
_037FEEA8: .word 0x038085AC
_037FEEAC: .word sub_037FF564
_037FEEB0: .word 0x03807408
	arm_func_end sub_037FEE70

	arm_func_start sub_037FEEB4
sub_037FEEB4: ; 0x037FEEB4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	b _037FF52C
_037FEEC0:
	ldr sl, _037FF550 ; =0x04000509
	ldr r6, [sp, #0x18]
	sub r4, sl, #1
	b _037FF510
_037FEED0:
	add r5, sp, #0x1c
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia r6, {r0, r1}
	stmia r5, {r0, r1}
	ldr r0, [sp, #0x20]
	cmp r0, #0x21
	addls pc, pc, r0, lsl #2
	b _037FF50C
_037FEEF4: ; jump table
	b _037FEF7C ; case 0
	b _037FEF94 ; case 1
	b _037FEFA0 ; case 2
	b _037FEFB8 ; case 3
	b _037FEFC4 ; case 4
	b _037FEFD4 ; case 5
	b _037FEFE4 ; case 6
	b _037FEFFC ; case 7
	b _037FF024 ; case 8
	b _037FF038 ; case 9
	b _037FF04C ; case 10
	b _037FF068 ; case 11
	b _037FF080 ; case 12
	b _037FF148 ; case 13
	b _037FF324 ; case 14
	b _037FF3A4 ; case 15
	b _037FF3DC ; case 16
	b _037FF1EC ; case 17
	b _037FF234 ; case 18
	b _037FF25C ; case 19
	b _037FF29C ; case 20
	b _037FF2E4 ; case 21
	b _037FF40C ; case 22
	b _037FF418 ; case 23
	b _037FF424 ; case 24
	b _037FF430 ; case 25
	b _037FF448 ; case 26
	b _037FF458 ; case 27
	b _037FF468 ; case 28
	b _037FF4A8 ; case 29
	b _037FF478 ; case 30
	b _037FF488 ; case 31
	b _037FF498 ; case 32
	b _037FF4B8 ; case 33
_037FEF7C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_037FD2A8
	b _037FF50C
_037FEF94:
	ldr r0, [sp, #0x24]
	bl sub_037FD2D8
	b _037FF50C
_037FEFA0:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_037FD04C
	b _037FF50C
_037FEFB8:
	ldr r0, [sp, #0x24]
	bl sub_037FD288
	b _037FF50C
_037FEFC4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_037FD334
	b _037FF50C
_037FEFD4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_037FD3AC
	b _037FF50C
_037FEFE4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_037FD63C
	b _037FF50C
_037FEFFC:
	ldr r1, [sp, #0x24]
	mov r0, r1, lsr #0x18
	and r0, r0, #0xff
	str r0, [sp]
	bic r0, r1, #0xff000000
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_037FD680
	b _037FF50C
_037FF024:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl sub_037FD478
	b _037FF50C
_037FF038:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl sub_037FD4E4
	b _037FF50C
_037FF04C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	bl sub_037FEBE8
	b _037FF50C
_037FF068:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_037FEC08
	b _037FF50C
_037FF080:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl OS_DisableInterrupts
	mov r8, r0
	mov r2, #0
	b _037FF0BC
_037FF09C:
	tst r5, #1
	movne r0, r2, lsl #4
	addne r0, r0, #0x4000000
	ldrneb r1, [r0, #0x403]
	add r2, r2, #1
	orrne r1, r1, #0x80
	strneb r1, [r0, #0x403]
	mov r5, r5, lsr #1
_037FF0BC:
	cmp r2, #0x10
	bge _037FF0CC
	cmp r5, #0
	bne _037FF09C
_037FF0CC:
	tst r6, #1
	beq _037FF0F8
	tst r6, #2
	ldrneh r1, [r4]
	orrne r0, r1, #0x80
	orrne r0, r0, #0x8000
	strneh r0, [r4]
	ldreqb r0, [r4]
	orreq r0, r0, #0x80
	streqb r0, [r4]
	b _037FF108
_037FF0F8:
	tst r6, #2
	ldrneb r0, [sl]
	orrne r0, r0, #0x80
	strneb r0, [sl]
_037FF108:
	mov r5, #0
	b _037FF128
_037FF110:
	tst r7, #1
	beq _037FF120
	mov r0, r5
	bl sub_037FED44
_037FF120:
	add r5, r5, #1
	mov r7, r7, lsr #1
_037FF128:
	cmp r5, #8
	bge _037FF138
	cmp r7, #0
	bne _037FF110
_037FF138:
	mov r0, r8
	bl OS_RestoreInterrupts
	bl sub_037FEC24
	b _037FF50C
_037FF148:
	ldr sb, [sp, #0x30]
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl OS_DisableInterrupts
	mov fp, r0
	mov r8, #0
	b _037FF180
_037FF168:
	tst r7, #1
	beq _037FF178
	mov r0, r8
	bl sub_037FEE00
_037FF178:
	add r8, r8, #1
	mov r7, r7, lsr #1
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
	bl sub_037FB9B4
_037FF1AC:
	add r7, r7, #1
	mov r5, r5, lsr #1
_037FF1B4:
	cmp r7, #0x10
	bge _037FF1C4
	cmp r5, #0
	bne _037FF198
_037FF1C4:
	tst r6, #1
	movne r0, #0
	strneb r0, [r4]
	tst r6, #2
	movne r0, #0
	strneb r0, [sl]
	mov r0, fp
	bl OS_RestoreInterrupts
	bl sub_037FEC24
	b _037FF50C
_037FF1EC:
	ldr r1, [sp, #0x2c]
	mov r0, r1, lsr #0x1d
	and r0, r0, #1
	str r0, [sp]
	mov r0, r1, lsr #0x1c
	and r0, r0, #1
	str r0, [sp, #4]
	mov r0, r1, lsr #0x1b
	and r0, r0, #1
	str r0, [sp, #8]
	mov r0, r1, lsr #0x1f
	and r0, r0, #1
	mov r1, r1, lsr #0x1e
	and r1, r1, #1
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl sub_037FC090
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
	bl sub_037FECE8
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
	bl sub_037FBA54
_037FF280:
	add r7, r7, #1
	mov r5, r5, lsr #1
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
	bl sub_037FB9DC
_037FF2C8:
	add r8, r8, #1
	mov r5, r5, lsr #1
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
	bl sub_037FBA6C
_037FF308:
	add r7, r7, #1
	mov r5, r5, lsr #1
_037FF310:
	cmp r7, #0x10
	bge _037FF50C
	cmp r5, #0
	bne _037FF2F4
	b _037FF50C
_037FF324:
	ldr r3, [sp, #0x30]
	ldr r0, [sp, #0x24]
	mov r1, r3, lsl #0x10
	ldr r2, [sp, #0x2c]
	mov r1, r1, lsr #0x10
	str r1, [sp]
	ldr r1, _037FF554 ; =0x003FFFFF
	and r1, r2, r1
	str r1, [sp, #4]
	mov r1, r2, lsr #0x18
	and r1, r1, #0x7f
	str r1, [sp, #8]
	mov r1, r2, lsr #0x16
	and r1, r1, #3
	str r1, [sp, #0xc]
	mov r1, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	str r1, [sp, #0x10]
	mov r1, r3, lsr #0x10
	mov r2, r3, lsr #0x18
	and r1, r1, #0x7f
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x28]
	mov r0, r0, lsl #0x10
	mov r3, r3, lsr #0x1a
	mov r0, r0, lsr #0x10
	bic r1, r1, #0xf8000000
	and r2, r2, #3
	and r3, r3, #3
	bl sub_037FB798
	b _037FF50C
_037FF3A4:
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x28]
	mov r0, r1, lsl #8
	mov r0, r0, lsr #0x10
	str r0, [sp]
	and r0, r1, #0x7f
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x30]
	and r2, r3, #0x7f
	mov r3, r3, lsr #8
	and r3, r3, #3
	bl sub_037FB864
	b _037FF50C
_037FF3DC:
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	and r0, r1, #0x7f
	str r0, [sp]
	mov r0, r1, lsl #8
	mov r3, r0, lsr #0x10
	ldr r0, [sp, #0x24]
	and r1, r2, #0x7f
	mov r2, r2, lsr #8
	and r2, r2, #3
	bl sub_037FB910
	b _037FF50C
_037FF40C:
	ldr r0, [sp, #0x24]
	bl sub_037FBB74
	b _037FF50C
_037FF418:
	ldr r0, [sp, #0x24]
	bl sub_037FB750
	b _037FF50C
_037FF424:
	ldr r0, [sp, #0x24]
	bl sub_037FBB00
	b _037FF50C
_037FF430:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_037FB760
	b _037FF50C
_037FF448:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_037FCB78
	b _037FF50C
_037FF458:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_037FCC58
	b _037FF50C
_037FF468:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_037FCAC8
	b _037FF50C
_037FF478:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_037FD554
	b _037FF50C
_037FF488:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_037FD5E0
	b _037FF50C
_037FF498:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_037FCCAC
	b _037FF50C
_037FF4A8:
	ldr r1, [sp, #0x24]
	ldr r0, _037FF558 ; =0x03807408
	str r1, [r0]
	b _037FF50C
_037FF4B8:
	ldr r5, [sp, #0x24]
	ldr r0, _037FF55C ; =0x0380740C
	mov r1, r5
	mov r2, #0x1180
	bl sub_037FAFE0
	ldr r0, _037FF55C ; =0x0380740C
	add r1, r5, #0x1000
	str r0, [r1, #0x1c0]
	mov r6, #0
_037FF4DC:
	mov r0, r6
	bl sub_037FBB64
	add r1, r5, r6, lsl #2
	add r1, r1, #0x1000
	str r0, [r1, #0x180]
	add r6, r6, #1
	cmp r6, #0x10
	blt _037FF4DC
	mov r0, #0
	bl sub_037FCC90
	add r1, r5, #0x1000
	str r0, [r1, #0x1c4]
_037FF50C:
	ldr r6, [sp, #0x1c]
_037FF510:
	cmp r6, #0
	bne _037FEED0
	ldr r0, _037FF558 ; =0x03807408
	ldr r1, [r0]
	ldr r0, [r1]
	add r0, r0, #1
	str r0, [r1]
_037FF52C:
	ldr r0, _037FF560 ; =0x0380858C
	add r1, sp, #0x18
	mov r2, #0
	bl OS_ReceiveMessage
	cmp r0, #0
	bne _037FEEC0
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FF550: .word 0x04000509
_037FF554: .word 0x003FFFFF
_037FF558: .word 0x03807408
_037FF55C: .word 0x0380740C
_037FF560: .word 0x0380858C
	arm_func_end sub_037FEEB4

	arm_func_start sub_037FF564
sub_037FF564: ; 0x037FF564
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl OS_DisableInterrupts
	mov r4, r0
	cmp r5, #0x2000000
	blo _037FF590
	ldr r0, _037FF5AC ; =0x0380858C
	mov r1, r5
	mov r2, #0
	bl OS_SendMessage
	b _037FF59C
_037FF590:
	cmp r5, #0
	bne _037FF59C
	bl sub_037FBF5C
_037FF59C:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FF5AC: .word 0x0380858C
	arm_func_end sub_037FF564

	arm_func_start sub_037FF5B0
sub_037FF5B0: ; 0x037FF5B0
	ldr ip, _037FF5B8 ; =sub_03800254
	bx ip
	.align 2, 0
_037FF5B8: .word sub_03800254
	arm_func_end sub_037FF5B0

	arm_func_start sub_037FF5BC
sub_037FF5BC: ; 0x037FF5BC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r4, _037FF660 ; =0x038085E0
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
	ldr r1, _037FF664 ; =sub_038003A8
	ldr r3, _037FF668 ; =0x03808BE0
	add r0, r4, #0x48
	str ip, [sp, #4]
	bl OS_CreateThread
	add r0, r4, #0x48
	bl OS_WakeupThreadDirect
	ldr r1, _037FF66C ; =sub_038002C4
	mov r0, #0xb
	bl PXI_SetFifoRecvCallback
	ldr r0, _037FF670 ; =0x027FFC40
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _037FF674 ; =0x038085CC
	moveq r1, #1
	streq r1, [r0]
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FF660: .word 0x038085E0
_037FF664: .word sub_038003A8
_037FF668: .word 0x03808BE0
_037FF66C: .word sub_038002C4
_037FF670: .word 0x027FFC40
_037FF674: .word 0x038085CC
	arm_func_end sub_037FF5BC

	arm_func_start sub_037FF678
sub_037FF678: ; 0x037FF678
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _037FF6B4 ; =0x038085E0
	mov r7, r0
	bl OS_DisableInterrupts
	ldr r6, [r5, #0xf0]
	mov r4, r0
	mov r1, r7
	add r0, r5, #0x48
	str r7, [r5, #0xf0]
	bl OS_SetThreadPriority
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FF6B4: .word 0x038085E0
	arm_func_end sub_037FF678

	arm_func_start sub_037FF6B8
sub_037FF6B8: ; 0x037FF6B8
	ldr r0, _037FF6C0 ; =0x027FFA80
	bx lr
	.align 2, 0
_037FF6C0: .word 0x027FFA80
	arm_func_end sub_037FF6B8

	arm_func_start sub_037FF6C4
sub_037FF6C4: ; 0x037FF6C4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	mov r4, r1
	adds r1, r5, r4
	beq _037FF75C
	cmp r5, #0
	beq _037FF6E4
	bl OS_Sleep
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
	bl OS_Sleep
	sub r7, r7, r8
_037FF718:
	bl sub_037FF768
	tst r0, #1
	moveq r0, r5
	movne r0, r4
	cmp r0, #0
	bne _037FF738
	cmp r7, #0
	bgt _037FF700
_037FF738:
	bl sub_037FF768
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _037FF764 ; =0x038085E0
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0]
_037FF75C:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FF764: .word 0x038085E0
	arm_func_end sub_037FF6C4

	arm_func_start sub_037FF768
sub_037FF768: ; 0x037FF768
	stmdb sp!, {r3, lr}
	ldr ip, _037FF7AC ; =0x03808BE0
	mov lr, #2
	ldr r0, _037FF7B0 ; =0x0380679C
	ldr r3, _037FF7B4 ; =sub_037FFA10
	mov r1, #0
	mov r2, #1
	str lr, [ip, #4]
	bl sub_037FF7F8
	ldr r3, _037FF7B8 ; =sub_037FF9D0
	add r1, sp, #0
	mov r0, #0
	mov r2, #1
	bl sub_037FF7F8
	ldrb r0, [sp]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FF7AC: .word 0x03808BE0
_037FF7B0: .word 0x0380679C
_037FF7B4: .word sub_037FFA10
_037FF7B8: .word sub_037FF9D0
	arm_func_end sub_037FF768

	arm_func_start sub_037FF7BC
sub_037FF7BC: ; 0x037FF7BC
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x32
	bl sub_037FF6C4
	ldr r0, _037FF7F4 ; =0x038085E0
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #4
	moveq r0, #6
	streq r0, [r1]
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FF7F4: .word 0x038085E0
	arm_func_end sub_037FF7BC

	arm_func_start sub_037FF7F8
sub_037FF7F8: ; 0x037FF7F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _037FF9B0 ; =0x03808BE4
	ldr r6, _037FF9B4 ; =0x0000A040
	ldr r5, _037FF9B8 ; =0x040001A0
	stmib r4, {r0, r1}
	mov r8, r2
	mov r7, r3
	strh r6, [r5]
	b _037FF98C
_037FF81C:
	ldr r0, _037FF9BC ; =0x03806AF4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _037FF92C
	ldr r0, _037FF9C0 ; =0x038085E0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	mov r0, r0, asr #0x10
	and r0, r0, #0xff
	cmp r0, #0xff
	bne _037FF92C
	bl sub_037FA240
	ldr fp, _037FF9BC ; =0x03806AF4
	mov r5, r0
	mov r6, r1
	mov sb, #0xfa00
_037FF85C:
	bl sub_037FA240
	mov r3, #0
	subs sl, r0, r5
	sbc lr, r1, r6
	mov ip, r3
	umull r0, r1, sl, sb
	mla r1, sl, ip, r1
	mla r1, lr, sb, r1
	ldr r2, _037FF9C4 ; =0x000082EA
	bl sub_03806214
	ldrb r2, [fp]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _037FF85C
	ldr r0, _037FF9C8 ; =0x0000A042
	ldr r1, _037FF9B8 ; =0x040001A0
	strh r0, [r1]
_037FF8A0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FF8A0
	ldr r0, _037FF9CC ; =0x040001A2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_037FF8BC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FF8BC
	ldr r1, _037FF9CC ; =0x040001A2
	ldr r0, _037FF9BC ; =0x03806AF4
	ldrh r2, [r1]
	mov r1, #0
	strh r2, [sp]
	str r1, [r0, #4]
	bl sub_037FA240
	mov r6, r0
	mov sb, r1
	mov r5, #0xfa00
_037FF8F0:
	bl sub_037FA240
	mov r3, #0
	subs ip, r0, r6
	sbc fp, r1, sb
	mov sl, r3
	umull r0, r1, ip, r5
	mla r1, ip, sl, r1
	mla r1, fp, r5, r1
	ldr r2, _037FF9C4 ; =0x000082EA
	bl sub_03806214
	ldr r2, _037FF9BC ; =0x03806AF4
	ldrb r2, [r2]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _037FF8F0
_037FF92C:
	ldr r0, [r4]
	subs r0, r0, #1
	str r0, [r4]
	ldrne r1, _037FF9B4 ; =0x0000A040
	ldrne r0, _037FF9B8 ; =0x040001A0
	strneh r1, [r0]
	bne _037FF960
	ldr r1, _037FF9B8 ; =0x040001A0
	mov r2, #0xa000
	strh r2, [r1]
	ldr r0, _037FF9BC ; =0x03806AF4
	mov r1, #1
	str r1, [r0, #4]
_037FF960:
	ldr r1, _037FF9B8 ; =0x040001A0
_037FF964:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FF964
	mov r0, r4
	mov lr, pc
	bx r7
	arm_func_end sub_037FF7F8

	arm_func_start sub_037FF97C
sub_037FF97C: ; 0x037FF97C
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
	ldreq r0, _037FF9B8 ; =0x040001A0
	moveq r1, #0
	streqh r1, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FF9B0: .word 0x03808BE4
_037FF9B4: .word 0x0000A040
_037FF9B8: .word 0x040001A0
_037FF9BC: .word 0x03806AF4
_037FF9C0: .word 0x038085E0
_037FF9C4: .word 0x000082EA
_037FF9C8: .word 0x0000A042
_037FF9CC: .word 0x040001A2
	arm_func_end sub_037FF97C

	arm_func_start sub_037FF9D0
sub_037FF9D0: ; 0x037FF9D0
	ldr r1, _037FFA0C ; =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_037FF9E0:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _037FF9E0
	ldr r2, _037FFA0C ; =0x040001A2
	ldr r1, [r0, #8]
	ldrh r2, [r2]
	strb r2, [r1]
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_037FFA0C: .word 0x040001A2
	arm_func_end sub_037FF9D0

	arm_func_start sub_037FFA10
sub_037FFA10: ; 0x037FFA10
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r1, [r0, #4]
	ldr r2, _037FFA5C ; =0x040001A2
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
	ldr r0, _037FFA5C ; =0x040001A2
	ldrh r0, [r0]
	strh r0, [sp]
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	.align 2, 0
_037FFA5C: .word 0x040001A2
	arm_func_end sub_037FFA10

	arm_func_start sub_037FFA60
sub_037FFA60: ; 0x037FFA60
	ldr r1, _037FFAC0 ; =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_037FFA70:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _037FFA70
	ldr r2, _037FFAC0 ; =0x040001A2
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
_037FFAC0: .word 0x040001A2
	arm_func_end sub_037FFA60

	arm_func_start sub_037FFAC4
sub_037FFAC4: ; 0x037FFAC4
	stmdb sp!, {r3, lr}
	ldr ip, _037FFAEC ; =0x03808BE0
	mov r2, #1
	ldr r0, _037FFAF0 ; =0x038067A0
	ldr r3, _037FFAF4 ; =sub_037FFA10
	mov r1, #0
	str r2, [ip, #4]
	bl sub_037FF7F8
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FFAEC: .word 0x03808BE0
_037FFAF0: .word 0x038067A0
_037FFAF4: .word sub_037FFA10
	arm_func_end sub_037FFAC4

	arm_func_start sub_037FFAF8
sub_037FFAF8: ; 0x037FFAF8
	stmdb sp!, {r3, lr}
	ldr r2, _037FFB90 ; =0x038085E0
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
	mov r3, r0, lsr #5
	and r3, r3, #8
	mov ip, r0, lsl #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #16
	str r0, [sp]
	b _037FFB74
_037FFB40:
	and r3, r0, #0xff00
	mov ip, r0, lsl #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #8
	str r0, [sp]
	b _037FFB74
_037FFB58:
	mov r3, r0, lsr #8
	and r3, r3, #0xff00
	and ip, r0, #0xff00
	orr r1, r1, r3
	orr r1, r1, ip, lsl #8
	orr r0, r1, r0, lsl #24
	str r0, [sp]
_037FFB74:
	ldr r3, _037FFB94 ; =sub_037FFA10
	add r0, sp, #0
	add r2, r2, #1
	mov r1, #0
	bl sub_037FF7F8
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FFB90: .word 0x038085E0
_037FFB94: .word sub_037FFA10
	arm_func_end sub_037FFAF8

	arm_func_start sub_037FFB98
sub_037FFB98: ; 0x037FFB98
	stmdb sp!, {r4, lr}
	ldr r0, _037FFBE8 ; =0x038085E0
	ldr r0, [r0]
	ldrb r4, [r0, #0x54]
	cmp r4, #0xff
	beq _037FFBE0
	ldr r0, _037FFBEC ; =0x03808BE0
	ldr r0, [r0]
	cmp r0, #0
	bne _037FFBE0
	bl sub_037FF768
	cmp r4, r0
	beq _037FFBD4
	mov r0, r4
	bl sub_037FFFF0
_037FFBD4:
	ldr r0, _037FFBEC ; =0x03808BE0
	mov r1, #1
	str r1, [r0]
_037FFBE0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FFBE8: .word 0x038085E0
_037FFBEC: .word 0x03808BE0
	arm_func_end sub_037FFB98

	arm_func_start sub_037FFBF0
sub_037FFBF0: ; 0x037FFBF0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_037FF7BC
	cmp r0, #0
	beq _037FFC48
	ldr r0, _037FFC50 ; =0x038085E0
	ldr r2, _037FFC54 ; =0x03808BE0
	ldr r1, [r0]
	mov r0, r6
	ldr r3, [r1, #0x28]
	mov r1, #3
	add r3, r3, #1
	add r3, r3, r4
	str r3, [r2, #4]
	bl sub_037FFAF8
	ldr r3, _037FFC58 ; =sub_037FF9D0
	mov r1, r5
	mov r2, r4
	mov r0, #0
	bl sub_037FF7F8
_037FFC48:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FFC50: .word 0x038085E0
_037FFC54: .word 0x03808BE0
_037FFC58: .word sub_037FF9D0
	arm_func_end sub_037FFBF0

	arm_func_start sub_037FFC5C
sub_037FFC5C: ; 0x037FFC5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl sub_037FF7BC
	cmp r0, #0
	beq _037FFD00
	ldr r0, _037FFD08 ; =0x038085E0
	ldr fp, _037FFD0C ; =0x03808BE0
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _037FFCF8
_037FFC90:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl sub_037FFAC4
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #2
	bl sub_037FFAF8
	ldr r3, _037FFD10 ; =sub_037FFA10
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl sub_037FF7F8
	ldr r0, [r5, #0x2c]
	mov r1, #0
	bl sub_037FF6C4
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
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FFD08: .word 0x038085E0
_037FFD0C: .word 0x03808BE0
_037FFD10: .word sub_037FFA10
	arm_func_end sub_037FFC5C

	arm_func_start sub_037FFD14
sub_037FFD14: ; 0x037FFD14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl sub_037FF7BC
	cmp r0, #0
	beq _037FFDB8
	ldr r0, _037FFDC0 ; =0x038085E0
	ldr fp, _037FFDC4 ; =0x03808BE0
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _037FFDB0
_037FFD48:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl sub_037FFAC4
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #0xa
	bl sub_037FFAF8
	ldr r3, _037FFDC8 ; =sub_037FFA10
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl sub_037FF7F8
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	bl sub_037FF6C4
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
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FFDC0: .word 0x038085E0
_037FFDC4: .word 0x03808BE0
_037FFDC8: .word sub_037FFA10
	arm_func_end sub_037FFD14

	arm_func_start sub_037FFDCC
sub_037FFDCC: ; 0x037FFDCC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_037FF7BC
	cmp r0, #0
	beq _037FFE48
	ldr r0, _037FFE50 ; =0x038085E0
	ldr r2, _037FFE54 ; =0x03808BE0
	ldr r4, [r0]
	mov r0, #1
	str r0, [r2, #0x10]
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	add r3, r1, r5
	mov r1, #3
	str r3, [r2, #4]
	bl sub_037FFAF8
	ldr r3, _037FFE58 ; =sub_037FFA60
	mov r0, r6
	mov r2, r5
	mov r1, #0
	bl sub_037FF7F8
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, _037FFE54 ; =0x03808BE0
	ldreq r0, [r0, #0x10]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [r4]
_037FFE48:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FFE50: .word 0x038085E0
_037FFE54: .word 0x03808BE0
_037FFE58: .word sub_037FFA60
	arm_func_end sub_037FFDCC

	arm_func_start sub_037FFE5C
sub_037FFE5C: ; 0x037FFE5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _037FFEF0 ; =0x038085E0
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
	bl sub_037FF7BC
	cmp r0, #0
	beq _037FFEE8
	ldr r8, _037FFEF4 ; =0x03808BE0
	mov sb, #0xd8
	b _037FFEE0
_037FFEA4:
	bl sub_037FFAC4
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl sub_037FFAF8
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x44]
	bl sub_037FF6C4
	ldr r0, [r4]
	cmp r0, #0
	bne _037FFEE8
	add r7, r7, r5
	sub r6, r6, r5
_037FFEE0:
	cmp r6, #0
	bne _037FFEA4
_037FFEE8:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FFEF0: .word 0x038085E0
_037FFEF4: .word 0x03808BE0
	arm_func_end sub_037FFE5C

	arm_func_start sub_037FFEF8
sub_037FFEF8: ; 0x037FFEF8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _037FFF8C ; =0x038085E0
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
	bl sub_037FF7BC
	cmp r0, #0
	beq _037FFF84
	ldr r8, _037FFF90 ; =0x03808BE0
	mov sb, #0x20
	b _037FFF7C
_037FFF40:
	bl sub_037FFAC4
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl sub_037FFAF8
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x4c]
	bl sub_037FF6C4
	ldr r0, [r4]
	cmp r0, #0
	bne _037FFF84
	add r7, r7, r5
	sub r6, r6, r5
_037FFF7C:
	cmp r6, #0
	bne _037FFF40
_037FFF84:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FFF8C: .word 0x038085E0
_037FFF90: .word 0x03808BE0
	arm_func_end sub_037FFEF8

	arm_func_start sub_037FFF94
sub_037FFF94: ; 0x037FFF94
	stmdb sp!, {r4, lr}
	bl sub_037FF7BC
	cmp r0, #0
	beq _037FFFD8
	ldr r0, _037FFFE0 ; =0x038085E0
	ldr r4, [r0]
	bl sub_037FFAC4
	ldr r1, _037FFFE4 ; =0x03808BE0
	mov r2, #1
	ldr r0, _037FFFE8 ; =0x03806798
	ldr r3, _037FFFEC ; =sub_037FFA10
	str r2, [r1, #4]
	mov r1, #0
	bl sub_037FF7F8
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x3c]
	bl sub_037FF6C4
_037FFFD8:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FFFE0: .word 0x038085E0
_037FFFE4: .word 0x03808BE0
_037FFFE8: .word 0x03806798
_037FFFEC: .word sub_037FFA10
	arm_func_end sub_037FFF94

	arm_func_start sub_037FFFF0
sub_037FFFF0: ; 0x037FFFF0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl sub_037FF7BC
	cmp r0, #0
	beq _03800074
	ldr r0, _0380007C ; =0x038085E0
	strb r4, [sp, #1]
	mov r1, #1
	ldr sb, [r0]
	ldr r5, _03800080 ; =sub_037FFA10
	ldr r4, _03800084 ; =0x03808BE0
	strb r1, [sp]
	mov sl, #0xa
	add r7, sp, #0
	mov r8, #2
	mov r6, #0
	mov fp, #5
_03800034:
	bl sub_037FFAC4
	mov r0, r7
	str r8, [r4, #4]
	mov r1, r6
	mov r2, r8
	mov r3, r5
	bl sub_037FF7F8
	mov r0, fp
	mov r1, #0
	bl sub_037FF6C4
	ldr r0, [sb]
	cmp r0, #4
	bne _03800074
	sub sl, sl, #1
	cmp sl, #0
	bgt _03800034
_03800074:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0380007C: .word 0x038085E0
_03800080: .word sub_037FFA10
_03800084: .word 0x03808BE0
	arm_func_end sub_037FFFF0

	arm_func_start sub_03800088
sub_03800088: ; 0x03800088
	ldr r3, _038000E0 ; =0x040001A4
_0380008C:
	ldr r2, [r3]
	tst r2, #-0x80000000
	bne _0380008C
	ldr r3, _038000E4 ; =0x040001A1
	mov r2, #0xc0
	strb r2, [r3]
	mov r2, r0, lsr #0x18
	strb r2, [r3, #7]
	mov r2, r0, lsr #0x10
	strb r2, [r3, #8]
	mov r2, r0, lsr #8
	strb r2, [r3, #9]
	strb r0, [r3, #0xa]
	mov r0, r1, lsr #0x18
	strb r0, [r3, #0xb]
	mov r0, r1, lsr #0x10
	strb r0, [r3, #0xc]
	mov r0, r1, lsr #8
	strb r0, [r3, #0xd]
	strb r1, [r3, #0xe]
	bx lr
	.align 2, 0
_038000E0: .word 0x040001A4
_038000E4: .word 0x040001A1
	arm_func_end sub_03800088

	arm_func_start sub_038000E8
sub_038000E8: ; 0x038000E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _03800158 ; =0x038085E0
	mov r1, #0
	ldr r0, [r4]
	str r1, [r0]
	ldr r7, [r4, #0x3c]
	ldr r6, [r4, #0x40]
	bl OS_DisableInterrupts
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl OS_WakeupThread
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _03800134
	add r0, r4, #0x48
	bl OS_WakeupThreadDirect
_03800134:
	mov r0, r5
	bl OS_RestoreInterrupts
	cmp r7, #0
	beq _03800150
	mov r0, r6
	mov lr, pc
	bx r7
_03800150:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03800158: .word 0x038085E0
	arm_func_end sub_038000E8

	arm_func_start sub_0380015C
sub_0380015C: ; 0x0380015C
	ldr r1, _03800178 ; =0x03806AFC
	ldr r1, [r1]
	ldr r1, [r1, #0x60]
	bic r1, r1, #0x7000000
	orr r0, r1, r0
	orr r0, r0, #0xa0000000
	bx lr
	.align 2, 0
_03800178: .word 0x03806AFC
	arm_func_end sub_0380015C

	arm_func_start sub_0380017C
sub_0380017C: ; 0x0380017C
	bx lr
	arm_func_end sub_0380017C

	arm_func_start sub_03800180
sub_03800180: ; 0x03800180
	stmdb sp!, {r3, lr}
	mov r0, #-0x48000000
	mov r1, #0
	bl sub_03800088
	mov r0, #0x7000000
	bl sub_0380015C
	mov r1, #0x2000
	rsb r1, r1, #0
	ldr r2, _038001C8 ; =0x040001A4
	and r0, r0, r1
	str r0, [r2]
_038001AC:
	ldr r0, [r2]
	tst r0, #0x800000
	beq _038001AC
	ldr r0, _038001CC ; =0x04100010
	ldr r0, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038001C8: .word 0x040001A4
_038001CC: .word 0x04100010
	arm_func_end sub_03800180

	arm_func_start sub_038001D0
sub_038001D0: ; 0x038001D0
	stmdb sp!, {r4, lr}
	ldr r0, _038001FC ; =0x038085E0
	mov r1, #0
	mov r2, r1
	bl sub_03800200
	bl sub_03800180
	mov r4, r0
	bl sub_038000E8
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038001FC: .word 0x038085E0
	arm_func_end sub_038001D0

	arm_func_start sub_03800200
sub_03800200: ; 0x03800200
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl OS_DisableInterrupts
	mov r4, r0
	b _03800224
_0380021C:
	add r0, r7, #0xf4
	bl OS_SleepThread
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
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_03800200

	arm_func_start sub_03800254
sub_03800254: ; 0x03800254
	stmdb sp!, {r3, lr}
	ldr ip, _038002B4 ; =0x038085E0
	ldr r0, [ip, #0xfc]
	cmp r0, #0
	bne _038002AC
	ldr r0, _038002B8 ; =0x03808BF4
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
	bl sub_037FF5BC
	ldr r1, _038002BC ; =sub_0380017C
	ldr r0, _038002C0 ; =0x03808C00
	str r1, [r0]
	bl sub_038005DC
_038002AC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038002B4: .word 0x038085E0
_038002B8: .word 0x03808BF4
_038002BC: .word sub_0380017C
_038002C0: .word 0x03808C00
	arm_func_end sub_03800254

	arm_func_start sub_038002C4
sub_038002C4: ; 0x038002C4
	stmdb sp!, {r3, lr}
	cmp r0, #0xb
	bne _0380039C
	cmp r2, #0
	beq _0380039C
	ldr r0, _038003A4 ; =0x038085E0
	ldr r2, [r0, #8]
	cmp r2, #0
	streq r1, [r0, #4]
	ldr r2, [r0, #4]
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _03800368
_038002F8: ; jump table
	b _03800338 ; case 0
	b _03800368 ; case 1
	b _0380035C ; case 2
	b _0380035C ; case 3
	b _0380035C ; case 4
	b _0380035C ; case 5
	b _0380035C ; case 6
	b _0380035C ; case 7
	b _0380035C ; case 8
	b _0380035C ; case 9
	b _0380035C ; case 10
	b _0380035C ; case 11
	b _0380035C ; case 12
	b _0380035C ; case 13
	b _0380035C ; case 14
	b _0380035C ; case 15
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
	bl OS_WakeupThreadDirect
_0380039C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038003A4: .word 0x038085E0
	arm_func_end sub_038002C4

	arm_func_start sub_038003A8
sub_038003A8: ; 0x038003A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _038005D8 ; =0x038085E0
_038003B0:
	mov r5, #0
	bl OS_DisableInterrupts
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
	bl OS_SleepThread
	b _038003C4
_03800418:
	mov r0, r6
	bl OS_RestoreInterrupts
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
_03800460: ; jump table
	b _03800568 ; case 0
	b _03800568 ; case 1
	b _038004A0 ; case 2
	b _038004A8 ; case 3
	b _038004B8 ; case 4
	b _03800560 ; case 5
	b _038004C4 ; case 6
	b _038004D8 ; case 7
	b _038004EC ; case 8
	b _03800500 ; case 9
	b _03800560 ; case 10
	b _03800514 ; case 11
	b _03800534 ; case 12
	b _0380053C ; case 13
	b _03800550 ; case 14
	b _03800524 ; case 15
_038004A0:
	bl sub_037FFB98
	b _03800568
_038004A8:
	bl sub_03800180
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
	bl sub_037FFBF0
	b _03800568
_038004D8:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl sub_037FFD14
	b _03800568
_038004EC:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl sub_037FFC5C
	b _03800568
_03800500:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl sub_037FFDCC
	b _03800568
_03800514:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl sub_037FFE5C
	b _03800568
_03800524:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl sub_037FFEF8
	b _03800568
_03800534:
	bl sub_037FFF94
	b _03800568
_0380053C:
	bl sub_037FF768
	ldr r1, [r4]
	ldr r1, [r1, #0x10]
	strb r0, [r1]
	b _03800568
_03800550:
	ldr r0, [r3, #0xc]
	ldrb r0, [r0]
	bl sub_037FFFF0
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
	bl sub_037FB3A4
	cmp r0, #0
	blt _03800570
	bl OS_DisableInterrupts
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl OS_WakeupThread
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _038005B8
	add r0, r4, #0x48
	bl OS_WakeupThreadDirect
_038005B8:
	mov r0, r5
	bl OS_RestoreInterrupts
	b _038003B0
_038005C4:
	ldr r1, [r4, #0x44]
	mov r0, r4
	mov lr, pc
	bx r1
	arm_func_end sub_038003A8

	arm_func_start sub_038005D4
sub_038005D4: ; 0x038005D4
	b _038003B0
	.align 2, 0
_038005D8: .word 0x038085E0
	arm_func_end sub_038005D4

	arm_func_start sub_038005DC
sub_038005DC: ; 0x038005DC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0380062C ; =0x03808E20
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _03800624
	mov r1, #1
	str r1, [r0, #8]
	bl PXI_Init
	mov r5, #0xe
	mov r4, #0
_03800604:
	mov r0, r5
	mov r1, r4
	bl sub_037FB380
	cmp r0, #0
	beq _03800604
	ldr r1, _03800630 ; =sub_03800634
	mov r0, #0xe
	bl PXI_SetFifoRecvCallback
_03800624:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380062C: .word 0x03808E20
_03800630: .word sub_03800634
	arm_func_end sub_038005DC

	arm_func_start sub_03800634
sub_03800634: ; 0x03800634
	stmdb sp!, {r4, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	bne _0380068C
	mov r0, #0
	bl sub_037FAF18
	mov r0, #1
	bl sub_037FAF18
	mov r0, #2
	bl sub_037FAF18
	mov r0, #3
	bl sub_037FAF18
	mov r0, #0
	bl sub_038034B0
	bl OS_DisableInterrupts
	mov r4, r0
	bl sub_037FB69C
	bl sub_03805A3C
	mov r0, r4
	bl OS_RestoreInterrupts
	bl OS_Terminate
	b _03800690
_0380068C:
	bl OS_Terminate
_03800690:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03800634

	arm_func_start sub_03800698
sub_03800698: ; 0x03800698
	stmdb sp!, {r3, lr}
	ldr r0, _038006D8 ; =0x03808E20
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _038006C8
	ldr r0, _038006DC ; =0x027FFE1F
	ldrb r0, [r0]
	tst r0, #0x80
	beq _038006C4
	bl sub_038006E0
	b _038006C8
_038006C4:
	bl sub_03800780
_038006C8:
	ldr r0, _038006D8 ; =0x03808E20
	ldr r0, [r0, #0xc]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038006D8: .word 0x03808E20
_038006DC: .word 0x027FFE1F
	arm_func_end sub_03800698

	arm_func_start sub_038006E0
sub_038006E0: ; 0x038006E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #1
	bl OS_GetLockID
	mov r4, r0
	mvn r0, #2
	cmp r4, r0
	beq _03800758
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_TryLockCard
	cmp r0, #0
	bne _0380074C
	ldr r1, _03800778 ; =0x027FFC10
	ldrh r0, [r1]
	cmp r0, #0
	subeq r0, r1, #0x410
	subne r0, r1, #0x10
	ldr r0, [r0]
	str r0, [sp]
	bl sub_038001D0
	ldr r1, [sp]
	cmp r0, r1
	mov r0, r4, lsl #0x10
	moveq r5, #1
	mov r0, r0, lsr #0x10
	movne r5, #0
	bl OS_UnlockCard
_0380074C:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_ReleaseLockID
_03800758:
	ldr r1, _0380077C ; =0x03808E20
	cmp r5, #0
	moveq r2, #1
	movne r2, #0
	str r2, [r1, #0xc]
	mov r0, r5
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03800778: .word 0x027FFC10
_0380077C: .word 0x03808E20
	arm_func_end sub_038006E0

	arm_func_start sub_03800780
sub_03800780: ; 0x03800780
	ldr r0, _038007A4 ; =0x04000214
	mov r2, #1
	ldr r1, [r0]
	mov r0, r2
	tst r1, #0x100000
	ldrne r1, _038007A8 ; =0x03808E20
	movne r0, #0
	strne r2, [r1, #0xc]
	bx lr
	.align 2, 0
_038007A4: .word 0x04000214
_038007A8: .word 0x03808E20
	arm_func_end sub_03800780

	arm_func_start sub_038007AC
sub_038007AC: ; 0x038007AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _03800898 ; =0x03808E20
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _03800890
	ldr r2, _0380089C ; =0x027FFC40
	ldrh r0, [r2]
	cmp r0, #2
	beq _03800890
	ldr r1, _038008A0 ; =0x03806B00
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
	bl sub_03800698
	cmp r0, #0
	beq _03800840
	ldr r0, _03800898 ; =0x03808E20
	mov r1, #1
	str r1, [r0, #4]
	bl sub_037FF6B8
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _03800840
	ldr r0, _038008A0 ; =0x03806B00
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _03800890
_03800840:
	ldr r0, _03800898 ; =0x03808E20
	ldr r1, _038008A0 ; =0x03806B00
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
	bl VENEER_SVC_WaitByLoop
_03800878:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	bne _03800870
_03800890:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03800898: .word 0x03808E20
_0380089C: .word 0x027FFC40
_038008A0: .word 0x03806B00
	arm_func_end sub_038007AC

	.rodata

_03806A74:
	.byte 0x08, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss
_sub_wram1_bss_start:
	.space 0x4024
