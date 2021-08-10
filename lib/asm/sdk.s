	.include "asm/macros.inc"
	.include "global.inc"

	.public _02110924
	.public _0211092C

	.text

	arm_func_start sub_02097FF4
sub_02097FF4: ; 0x02097FF4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r0
	ldr r1, [r5, #4]
	cmp r1, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
_02098014:
	ldr r4, [r1]
	mov r0, r5
	bl sub_02098038
	mov r1, r4
	cmp r4, #0
	bne _02098014
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end sub_02097FF4

	arm_func_start sub_02098038
sub_02098038: ; 0x02098038
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	mov r6, r1
	mov r7, r0
	add r0, r6, #8
	bl sub_0209DEAC
	movs r1, r0
	beq _02098078
	add r5, r7, #0x1c
	add r4, r6, #8
_02098060:
	mov r0, r5
	bl sub_0209DEF8
	mov r0, r4
	bl sub_0209DEAC
	movs r1, r0
	bne _02098060
_02098078:
	add r0, r6, #0x14
	bl sub_0209DEAC
	movs r1, r0
	beq _020980A8
	add r5, r7, #0x1c
	add r4, r6, #0x14
_02098090:
	mov r0, r5
	bl sub_0209DEF8
	mov r0, r4
	bl sub_0209DEAC
	movs r1, r0
	bne _02098090
_020980A8:
	mov r1, r6
	add r0, r7, #4
	bl sub_0209DE2C
	mov r1, r6
	add r0, r7, #0x10
	bl sub_0209DEF8
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_02098038

	arm_func_start sub_020980CC
sub_020980CC: ; 0x020980CC
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r7, r0
	ldr r0, [r7, #0x10]
	mov r6, r1
	mov r5, r2
	cmp r0, #0
	mov r4, #0
	beq _02098150
	add r1, sp, #0
	str r4, [r1]
	str r4, [r1, #4]
	add r0, r7, #0x10
	str r4, [r1, #8]
	bl sub_0209DEAC
	ldr r1, [r7, #0x28]
	add r2, sp, #0
	add r1, r1, r6, lsl #5
	mov r4, r0
	bl sub_0209958C
	cmp r5, #0
	beq _0209812C
	mov r0, r4
	blx r5
_0209812C:
	mov r1, r4
	add r0, r7, #4
	bl sub_0209DEF8
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x11
	movs r0, r0, lsr #0x1f
	movne r4, #0
_02098150:
	mov r0, r4
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_020980CC

	arm_func_start sub_02098160
sub_02098160: ; 0x02098160
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	mov r7, r0
	ldr r0, [r7, #0x10]
	mov r6, r1
	mov r5, r2
	cmp r0, #0
	mov r4, #0
	beq _020981C4
	add r0, r7, #0x10
	bl sub_0209DEAC
	ldr r1, [r7, #0x28]
	mov r4, r0
	mov r2, r5
	add r1, r1, r6, lsl #5
	bl sub_0209958C
	mov r1, r4
	add r0, r7, #4
	bl sub_0209DEF8
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x11
	movs r0, r0, lsr #0x1f
	movne r4, #0
_020981C4:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_02098160

	arm_func_start sub_020981D4
sub_020981D4: ; 0x020981D4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	ldr r2, _02098298 ; =0x04000060
	mov r4, r0
	ldrh r0, [r2]
	bic r0, r0, #0x3000
	orr r0, r0, #8
	strh r0, [r2]
	str r1, [r4, #0x44]
	ldr r0, [r4, #0x38]
	mov r0, r0, lsl #7
	movs r0, r0, lsr #0x1f
	bne _02098250
	ldr r5, [r4, #4]
	cmp r5, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
_0209821C:
	str r5, [r4, #0x40]
	ldr r0, [r5, #0x24]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	bne _02098238
	mov r0, r4
	bl sub_02098AF4
_02098238:
	ldr r5, [r5]
	cmp r5, #0
	bne _0209821C
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
_02098250:
	ldr r5, [r4, #0xc]
	cmp r5, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
_02098264:
	str r5, [r4, #0x40]
	ldr r0, [r5, #0x24]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	bne _02098280
	mov r0, r4
	bl sub_02098AF4
_02098280:
	ldr r5, [r5, #4]
	cmp r5, #0
	bne _02098264
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	.align 2, 0
_02098298: .word 0x04000060
	arm_func_end sub_020981D4

	arm_func_start sub_0209829C
sub_0209829C: ; 0x0209829C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r0
	ldr r7, [r8, #4]
	cmp r7, #0
	beq _020983B0
	add sl, r8, #4
	add sb, r8, #0x10
	mov r4, #0
_020982BC:
	ldr r2, [r7, #0x24]
	ldr r1, [r7, #0x20]
	mov r0, r2, lsl #0x1b
	movs r0, r0, lsr #0x1f
	ldr r5, [r1]
	ldr r6, [r7]
	bne _020982F0
	ldrh r1, [r7, #0x4c]
	ldrh r0, [r5, #0x32]
	cmp r1, r0
	orrhs r0, r2, #0x10
	strhs r0, [r7, #0x24]
	strhsh r4, [r7, #0x4c]
_020982F0:
	ldr r0, [r7, #0x24]
	mov r0, r0, lsl #0x1d
	movs r0, r0, lsr #0x1f
	bne _0209832C
	ldr r0, [r7, #0x80]
	mov r0, r0, lsl #0xd
	movs r0, r0, lsr #0x1d
	beq _02098320
	ldrh r1, [r8, #0x48]
	sub r0, r0, #1
	cmp r1, r0
	bne _0209832C
_02098320:
	mov r0, r8
	mov r1, r7
	bl sub_02098D44
_0209832C:
	ldr r0, [r5]
	mov r0, r0, lsl #0x11
	movs r0, r0, lsr #0x1f
	beq _02098364
	ldrh r1, [r5, #0x3c]
	cmp r1, #0
	beq _02098364
	ldr r0, [r7, #0x24]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _02098364
	ldrh r0, [r7, #0x4c]
	cmp r0, r1
	bhi _02098374
_02098364:
	ldr r0, [r7, #0x24]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _020983A4
_02098374:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _020983A4
	ldr r0, [r7, #0x18]
	cmp r0, #0
	bne _020983A4
	mov r0, sl
	mov r1, r7
	bl sub_0209DE2C
	mov r1, r0
	mov r0, sb
	bl sub_0209DEF8
_020983A4:
	mov r7, r6
	cmp r6, #0
	bne _020982BC
_020983B0:
	ldrh r0, [r8, #0x48]
	add r0, r0, #1
	strh r0, [r8, #0x48]
	ldrh r0, [r8, #0x48]
	cmp r0, #1
	movhi r0, #0
	strhih r0, [r8, #0x48]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	arm_func_end sub_0209829C

	arm_func_start sub_020983D4
sub_020983D4: ; 0x020983D4
	ldr ip, _020983E0 ; =sub_020983FC
	ldr r1, _020983E4 ; =sub_02098A84
	bx ip
	.align 2, 0
_020983E0: .word sub_020983FC
_020983E4: .word sub_02098A84
	arm_func_end sub_020983D4

	arm_func_start sub_020983E8
sub_020983E8: ; 0x020983E8
	ldr ip, _020983F4 ; =sub_020984B0
	ldr r1, _020983F8 ; =sub_02098ABC
	bx ip
	.align 2, 0
_020983F4: .word sub_020984B0
_020983F8: .word sub_02098ABC
	arm_func_end sub_020983E8

	arm_func_start sub_020983FC
sub_020983FC: ; 0x020983FC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #4
	mov sl, r0
	mov fp, r1
	bl sub_020D0AD4
	ldrh r0, [sl, #0x32]
	mov sb, #0
	cmp r0, #0
	ble _0209849C
	mov r0, #1
	mov r5, sb
	mov r4, sb
	str r0, [sp]
_02098430:
	ldr r0, [sl, #0x2c]
	mov r6, r4
	ldr r7, [r0, r5]
	add r8, r0, r5
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _02098484
	ldr r1, [r7, #4]
	mov r1, r1, lsl #0x1c
	mov r1, r1, lsr #0x1c
	cmp r1, #2
	ldreq r1, [sp]
	movne r1, r4
	blx fp
	mov r6, r0
	ldr r1, [r8]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #0x10]
	add r0, r1, r0
	mov r1, r6
	bl sub_020D0B08
_02098484:
	str r6, [r8, #8]
	ldrh r0, [sl, #0x32]
	add sb, sb, #1
	add r5, r5, #0x14
	cmp sb, r0
	blt _02098430
_0209849C:
	bl sub_020D0B74
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end sub_020983FC

	arm_func_start sub_020984B0
sub_020984B0: ; 0x020984B0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	mov fp, r1
	bl sub_020D08EC
	ldrh r0, [sl, #0x32]
	mov sb, #0
	cmp r0, #0
	ble _02098568
	mov r0, #1
	mov r6, sb
	str sb, [sp, #4]
	str r0, [sp]
	mov r4, #0x14
_020984E8:
	ldr r2, [sl, #0x2c]
	ldr r7, [r2, r6]
	add r8, r2, r6
	ldr r0, [r7, #4]
	mov r1, r0, lsl #0xe
	movs r1, r1, lsr #0x1f
	beq _0209851C
	mov r0, r0, lsl #6
	mov r1, r0, lsr #0x18
	mla r0, r1, r4, r2
	ldr r0, [r0, #4]
	str r0, [r8, #4]
	b _02098554
_0209851C:
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #5
	ldreq r1, [sp]
	ldr r0, [r7, #8]
	ldrne r1, [sp, #4]
	blx fp
	mov r5, r0
	ldr r0, [r8]
	ldr r2, [r7, #8]
	add r0, r0, #0x20
	mov r1, r5
	bl sub_020D0948
	str r5, [r8, #4]
_02098554:
	ldrh r0, [sl, #0x32]
	add sb, sb, #1
	add r6, r6, #0x14
	cmp sb, r0
	blt _020984E8
_02098568:
	bl sub_020D0A88
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end sub_020984B0

	arm_func_start sub_0209857C
sub_0209857C: ; 0x0209857C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov sb, r1
	ldrh r1, [sb, #8]
	mov sl, r0
	mov r8, #0x20
	strh r1, [sl, #0x30]
	ldrh r0, [sb, #0xa]
	strh r0, [sl, #0x32]
	ldrh r0, [sl, #0x30]
	ldr r1, [sl]
	mov r0, r0, lsl #5
	blx r1
	str r0, [sl, #0x28]
	ldrh r2, [sl, #0x30]
	ldr r0, [sl, #0x28]
	mov r1, #0
	mov r2, r2, lsl #5
	bl sub_020D4994
	ldrh r1, [sl, #0x30]
	mov r0, #0
	str r0, [sp]
	cmp r1, #0
	ble _0209881C
	mov r6, r0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
_020985F8:
	ldr r1, [sl, #0x28]
	add r0, sb, r8
	str r0, [r1, r6]
	ldr r0, [r1, r6]
	add r8, r8, #0x58
	ldr r0, [r0]
	add r7, r1, r6
	str r0, [sp, #0x28]
	mov r0, r0, lsl #0x17
	movs r0, r0, lsr #0x1f
	addne r0, sb, r8
	strne r0, [r7, #4]
	ldreq r0, [sp, #0x10]
	addne r8, r8, #0xc
	streq r0, [r7, #4]
	ldr r0, [sp, #0x28]
	mov r0, r0, lsl #0x16
	movs r0, r0, lsr #0x1f
	addne r0, sb, r8
	strne r0, [r7, #8]
	ldreq r0, [sp, #0x14]
	addne r8, r8, #0xc
	streq r0, [r7, #8]
	ldr r0, [sp, #0x28]
	mov r0, r0, lsl #0x15
	movs r0, r0, lsr #0x1f
	addne r0, sb, r8
	strne r0, [r7, #0xc]
	ldreq r0, [sp, #0x18]
	addne r8, r8, #8
	streq r0, [r7, #0xc]
	ldr r0, [sp, #0x28]
	mov r0, r0, lsl #0x14
	movs r0, r0, lsr #0x1f
	addne r0, sb, r8
	strne r0, [r7, #0x10]
	ldreq r0, [sp, #0x1c]
	addne r8, r8, #0xc
	streq r0, [r7, #0x10]
	ldr r0, [sp, #0x28]
	mov r0, r0, lsl #0xf
	movs r0, r0, lsr #0x1f
	addne r0, sb, r8
	strne r0, [r7, #0x14]
	ldreq r0, [sp, #0x20]
	addne r8, r8, #0x14
	streq r0, [r7, #0x14]
	ldr r0, [sp, #0x28]
	mov r1, r0, lsl #7
	mov r2, r0, lsl #6
	mov r5, r1, lsr #0x1f
	mov r4, r2, lsr #0x1f
	add r1, r5, r2, lsr #31
	mov r2, r0, lsl #5
	add r1, r1, r2, lsr #31
	mov r3, r0, lsl #4
	mov fp, r2, lsr #0x1f
	add r2, r1, r3, lsr #31
	mov r1, r3, lsr #0x1f
	mov ip, r0, lsl #3
	str r1, [sp, #4]
	mov r3, r0, lsl #2
	mov r0, ip, lsr #0x1f
	add r1, r2, ip, lsr #31
	str r0, [sp, #8]
	add r0, r1, r3, lsr #31
	strh r0, [r7, #0x1c]
	mov r0, r3, lsr #0x1f
	str r0, [sp, #0xc]
	ldrh r0, [r7, #0x1c]
	cmp r0, #0
	beq _020987F8
	mov r0, r0, lsl #3
	ldr r1, [sl]
	blx r1
	str r0, [r7, #0x18]
	cmp r5, #0
	ldr r0, [r7, #0x18]
	beq _0209874C
	add r1, sb, r8
	str r1, [r0, #4]
	ldr r1, _020988DC ; =sub_0209DDF8
	add r8, r8, #8
	str r1, [r0]
	add r0, r0, #8
_0209874C:
	cmp r4, #0
	beq _0209876C
	add r1, sb, r8
	str r1, [r0, #4]
	ldr r1, _020988E0 ; =sub_0209DD30
	add r8, r8, #8
	str r1, [r0]
	add r0, r0, #8
_0209876C:
	cmp fp, #0
	beq _0209878C
	add r1, sb, r8
	str r1, [r0, #4]
	ldr r1, _020988E4 ; =sub_0209DCAC
	add r8, r8, #0x10
	str r1, [r0]
	add r0, r0, #8
_0209878C:
	ldr r1, [sp, #4]
	cmp r1, #0
	beq _020987B0
	add r1, sb, r8
	str r1, [r0, #4]
	ldr r1, _020988E8 ; =sub_0209DBD4
	add r8, r8, #4
	str r1, [r0]
	add r0, r0, #8
_020987B0:
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _020987D4
	add r1, sb, r8
	str r1, [r0, #4]
	ldr r1, _020988EC ; =sub_0209DAB8
	add r8, r8, #8
	str r1, [r0]
	add r0, r0, #8
_020987D4:
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _02098800
	add r1, sb, r8
	str r1, [r0, #4]
	ldr r1, _020988F0 ; =sub_0209DA24
	add r8, r8, #0x10
	str r1, [r0]
	b _02098800
_020987F8:
	ldr r0, [sp, #0x24]
	str r0, [r7, #0x18]
_02098800:
	ldr r0, [sp]
	ldrh r1, [sl, #0x30]
	add r0, r0, #1
	add r6, r6, #0x20
	str r0, [sp]
	cmp r0, r1
	blt _020985F8
_0209881C:
	ldrh r2, [sl, #0x32]
	mov r0, #0x14
	ldr r1, [sl]
	mul r0, r2, r0
	blx r1
	str r0, [sl, #0x2c]
	ldrh r3, [sl, #0x32]
	mov r1, #0x14
	ldr r0, [sl, #0x2c]
	mul r2, r3, r1
	mov r1, #0
	bl sub_020D4994
	ldrh r0, [sl, #0x32]
	mov r3, #0
	cmp r0, #0
	addle sp, sp, #0x2c
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxle lr
	mov r4, r3
	mov r0, #1
_0209886C:
	ldr r2, [sl, #0x2c]
	add r1, sb, r8
	str r1, [r2, r4]
	ldr r5, [r1, #4]
	add r2, r2, r4
	mov r5, r5, lsl #0x18
	mov r5, r5, lsr #0x1c
	add r5, r5, #3
	mov r5, r0, lsl r5
	strh r5, [r2, #0x10]
	ldr r5, [r1, #4]
	add r3, r3, #1
	mov r5, r5, lsl #0x14
	mov r5, r5, lsr #0x1c
	add r5, r5, #3
	mov r5, r0, lsl r5
	strh r5, [r2, #0x12]
	ldr r5, [r1, #4]
	add r4, r4, #0x14
	str r5, [r2, #0xc]
	ldrh r2, [sl, #0x32]
	ldr r1, [r1, #0x1c]
	cmp r3, r2
	add r8, r8, r1
	blt _0209886C
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_020988DC: .word sub_0209DDF8
_020988E0: .word sub_0209DD30
_020988E4: .word sub_0209DCAC
_020988E8: .word sub_0209DBD4
_020988EC: .word sub_0209DAB8
_020988F0: .word sub_0209DA24
	arm_func_end sub_0209857C

	arm_func_start sub_020988F4
sub_020988F4: ; 0x020988F4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r0
	mov r0, #0x4c
	mov r7, r1
	mov r6, r2
	mov r4, r3
	blx r8
	mov r5, r0
	mov r1, #0
	mov r2, #0x4c
	bl sub_020D4994
	strh r7, [r5, #0x34]
	strh r6, [r5, #0x36]
	ldrh r0, [sp, #0x20]
	and r2, r4, #0x3f
	ldr r1, [r5, #0x38]
	and r0, r0, #0x3f
	bic r1, r1, #0x3f
	orr r0, r1, r0
	str r0, [r5, #0x38]
	ldrh r0, [sp, #0x24]
	ldr r3, [r5, #0x38]
	mov r1, #0
	bic r3, r3, #0xfc0
	and r0, r0, #0x3f
	orr r0, r3, r0, lsl #6
	str r0, [r5, #0x38]
	ldr r3, [r5, #0x38]
	mov r0, #0x9c
	mul r4, r7, r0
	bic ip, r3, #0x3f000
	mov r0, r3, lsl #0x1a
	mov r0, r0, lsr #0x1a
	and r0, r0, #0x3f
	orr r0, ip, r0, lsl #12
	str r0, [r5, #0x38]
	ldr r3, [r5, #0x38]
	mov r0, r4
	bic r3, r3, #0xfc0000
	orr r2, r3, r2, lsl #18
	str r2, [r5, #0x38]
	ldr r2, [r5, #0x38]
	bic r2, r2, #0x1000000
	str r2, [r5, #0x38]
	ldr r2, [r5, #0x38]
	bic r2, r2, #0xfe000000
	str r2, [r5, #0x38]
	str r8, [r5]
	str r1, [r5, #8]
	str r1, [r5, #0x14]
	str r1, [r5, #0x20]
	str r1, [r5, #4]
	str r1, [r5, #0x10]
	str r1, [r5, #0x1c]
	str r1, [r5, #0x3c]
	strh r1, [r5, #0x48]
	blx r8
	mov r2, r4
	mov sb, r0
	mov r1, #0
	bl sub_020D4994
	cmp r7, #0
	mov sl, #0
	ble _02098A14
	add r4, r5, #0x10
_020989F8:
	mov r0, r4
	mov r1, sb
	bl sub_0209DEF8
	add sl, sl, #1
	cmp sl, r7
	add sb, sb, #0x9c
	blt _020989F8
_02098A14:
	mov r0, #0x44
	mul r4, r6, r0
	mov r0, r4
	blx r8
	mov r2, r4
	mov r1, #0
	mov r8, r0
	bl sub_020D4994
	cmp r6, #0
	mov r7, #0
	ble _02098A60
	add r4, r5, #0x1c
_02098A44:
	mov r0, r4
	mov r1, r8
	bl sub_0209DEF8
	add r7, r7, #1
	cmp r7, r6
	add r8, r8, #0x44
	blt _02098A44
_02098A60:
	mov r0, #0
	str r0, [r5, #0x28]
	str r0, [r5, #0x2c]
	strh r0, [r5, #0x32]
	ldrh r1, [r5, #0x32]
	mov r0, r5
	strh r1, [r5, #0x30]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	arm_func_end sub_020988F4

	arm_func_start sub_02098A84
sub_02098A84: ; 0x02098A84
	stmdb sp!, {lr}
	sub sp, sp, #4
	ldr r3, _02098AB4 ; =_0211092C
	mov r2, #0
	ldr r3, [r3]
	blx r3
	ldr r1, _02098AB8 ; =0x0000FFFF
	and r0, r0, r1
	mov r0, r0, lsl #3
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_02098AB4: .word _0211092C
_02098AB8: .word 0x0000FFFF
	arm_func_end sub_02098A84

	arm_func_start sub_02098ABC
sub_02098ABC: ; 0x02098ABC
	stmdb sp!, {lr}
	sub sp, sp, #4
	ldr r3, _02098AEC ; =_02110924
	mov r2, #0
	ldr r3, [r3]
	blx r3
	ldr r1, _02098AF0 ; =0x0000FFFF
	and r0, r0, r1
	mov r0, r0, lsl #3
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_02098AEC: .word _02110924
_02098AF0: .word 0x0000FFFF
	arm_func_end sub_02098ABC

	arm_func_start sub_02098AF4
sub_02098AF4: ; 0x02098AF4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r1, [r4, #0x40]
	ldr r1, [r1, #0x20]
	ldr r5, [r1]
	ldr r1, [r5]
	mov r2, r1, lsl #0xa
	movs r2, r2, lsr #0x1f
	beq _02098B4C
	bl sub_02098B70
	ldr r0, [r5]
	mov r0, r0, lsl #9
	movs r0, r0, lsr #0x1f
	addne sp, sp, #4
	ldmneia sp!, {r4, r5, lr}
	bxne lr
	mov r0, r4
	bl sub_02098C58
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
_02098B4C:
	mov r1, r1, lsl #9
	movs r1, r1, lsr #0x1f
	bne _02098B5C
	bl sub_02098C58
_02098B5C:
	mov r0, r4
	bl sub_02098B70
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end sub_02098AF4

	arm_func_start sub_02098B70
sub_02098B70: ; 0x02098B70
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	mov r7, r0
	ldr r6, [r7, #0x40]
	mov r4, #0
	ldr r5, [r6, #0x20]
	ldr r0, [r5]
	ldr r0, [r0]
	mov r0, r0, lsl #0xf
	movs r0, r0, lsr #0x1f
	addeq sp, sp, #4
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	ldr r0, [r5, #0x14]
	ldr r2, [r7, #0x2c]
	ldrb r1, [r0, #0xf]
	mov r0, #0x14
	mla r0, r1, r0, r2
	bl sub_0209985C
	ldr r0, [r5, #0x14]
	ldrh r0, [r0]
	mov r0, r0, lsl #0x17
	mov r0, r0, lsr #0x1e
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02098C10
_02098BD8: ; jump table
	b _02098BEC ; case 0
	b _02098BF4 ; case 1
	b _02098BFC ; case 2
	b _02098C04 ; case 3
	b _02098C0C ; case 4
_02098BEC:
	ldr r4, _02098C48 ; =sub_0209B6AC
	b _02098C10
_02098BF4:
	ldr r4, _02098C4C ; =sub_0209A8E4
	b _02098C10
_02098BFC:
	ldr r4, _02098C50 ; =sub_0209A244
	b _02098C10
_02098C04:
	ldr r4, _02098C54 ; =sub_02099948
	b _02098C10
_02098C0C:
	ldr r4, _02098C54 ; =sub_02099948
_02098C10:
	ldr r5, [r6, #0x14]
	cmp r5, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
_02098C24:
	mov r0, r7
	mov r1, r5
	blx r4
	ldr r5, [r5]
	cmp r5, #0
	bne _02098C24
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02098C48: .word sub_0209B6AC
_02098C4C: .word sub_0209A8E4
_02098C50: .word sub_0209A244
_02098C54: .word sub_02099948
	arm_func_end sub_02098B70

	arm_func_start sub_02098C58
sub_02098C58: ; 0x02098C58
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	ldr r6, [r7, #0x40]
	ldr r2, [r7, #0x2c]
	ldr r1, [r6, #0x20]
	mov r0, #0x14
	ldr r5, [r1]
	mov r4, #0
	ldrb r1, [r5, #0x47]
	mla r0, r1, r0, r2
	bl sub_0209985C
	ldr r0, [r5]
	mov r0, r0, lsl #0x1a
	mov r0, r0, lsr #0x1e
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02098CD4
_02098C9C: ; jump table
	b _02098CB0 ; case 0
	b _02098CB8 ; case 1
	b _02098CC0 ; case 2
	b _02098CC8 ; case 3
	b _02098CD0 ; case 4
_02098CB0:
	ldr r4, _02098D2C ; =sub_0209BB00
	b _02098CD4
_02098CB8:
	ldr r4, _02098D30 ; =sub_0209AFC4
	b _02098CD4
_02098CC0:
	ldr r4, _02098D34 ; =sub_0209A594
	b _02098CD4
_02098CC8:
	ldr r4, _02098D38 ; =sub_02099DC8
	b _02098CD4
_02098CD0:
	ldr r4, _02098D38 ; =sub_02099DC8
_02098CD4:
	ldr r0, [r5]
	ldr r8, [r6, #8]
	mov r0, r0, lsl #0x14
	movs r0, r0, lsr #0x1f
	ldrne r5, _02098D3C ; =sub_0209985C
	ldreq r5, _02098D40 ; =sub_02099858
	cmp r8, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	mov r6, #0x14
_02098CFC:
	ldrb r1, [r8, #0x2c]
	ldr r0, [r7, #0x2c]
	mla r0, r1, r6, r0
	blx r5
	mov r0, r7
	mov r1, r8
	blx r4
	ldr r8, [r8]
	cmp r8, #0
	bne _02098CFC
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02098D2C: .word sub_0209BB00
_02098D30: .word sub_0209AFC4
_02098D34: .word sub_0209A594
_02098D38: .word sub_02099DC8
_02098D3C: .word sub_0209985C
_02098D40: .word sub_02099858
	arm_func_end sub_02098C58

	arm_func_start sub_02098D44
sub_02098D44: ; 0x02098D44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x74
	mov sb, r1
	ldr r8, [sb, #0x20]
	mov sl, r0
	ldr r0, [r8, #0x14]
	ldr r4, [r8]
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r6, #0
	str r0, [sp, #0x24]
	ldrb r0, [r4, #0x46]
	ldr r2, [sb, #0x90]
	ldrh r7, [r8, #0x1c]
	add r0, r0, #0x180
	cmp r2, #0
	str r0, [sp, #8]
	beq _02098D98
	mov r0, sb
	mov r1, r6
	blx r2
_02098D98:
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	beq _02098DB0
	ldrh r0, [sb, #0x4c]
	cmp r0, r1
	bhs _02098DF8
_02098DB0:
	ldrh r0, [sb, #0x4c]
	ldrb r1, [sb, #0x80]
	bl sub_020F2998
	cmp r1, #0
	bne _02098DF8
	ldr r1, [sb, #0x24]
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	bne _02098DF8
	mov r0, r1, lsl #0x1e
	movs r0, r0, lsr #0x1f
	bne _02098DF8
	mov r0, r1, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _02098DF8
	mov r0, sb
	add r1, sl, #0x1c
	bl sub_0209C4D0
_02098DF8:
	ldr r0, [sp, #0x24]
	mov r0, r0, lsl #0x17
	movs r0, r0, lsr #0x1f
	beq _02098E28
	ldr r0, _02099574 ; =sub_0209D994
	add r6, r6, #1
	str r0, [sp, #0x28]
	ldr r0, [r8, #4]
	ldrh r0, [r0, #8]
	mov r0, r0, lsl #0x1f
	mov r0, r0, lsr #0x1f
	str r0, [sp, #0x2c]
_02098E28:
	ldr r0, [sp, #0x24]
	mov r0, r0, lsl #0x16
	movs r0, r0, lsr #0x1f
	beq _02098E74
	ldr r3, [r8, #8]
	ldrh r0, [r3, #8]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	bne _02098E74
	ldr r2, _02099578 ; =sub_0209D7C8
	add r1, sp, #0x28
	str r2, [r1, r6, lsl #3]
	ldrh r1, [r3, #8]
	mov r2, r6, lsl #3
	add r0, sp, #0x2c
	mov r1, r1, lsl #0x1e
	mov r1, r1, lsr #0x1f
	add r6, r6, #1
	str r1, [r0, r2]
_02098E74:
	ldr r0, [sp, #0x24]
	mov r0, r0, lsl #0x15
	movs r0, r0, lsr #0x1f
	beq _02098EB0
	ldr r2, _0209957C ; =sub_0209D6EC
	add r1, sp, #0x28
	str r2, [r1, r6, lsl #3]
	ldr r1, [r8, #0xc]
	mov r2, r6, lsl #3
	ldrh r1, [r1, #2]
	add r0, sp, #0x2c
	add r6, r6, #1
	mov r1, r1, lsl #0x17
	mov r1, r1, lsr #0x1f
	str r1, [r0, r2]
_02098EB0:
	ldr r0, [sp, #0x24]
	mov r0, r0, lsl #0x14
	movs r0, r0, lsr #0x1f
	beq _02098EF8
	ldr r3, [r8, #0x10]
	ldr r0, [r3, #8]
	mov r0, r0, lsl #0xf
	movs r0, r0, lsr #0x1f
	bne _02098EF8
	ldr r2, _02099580 ; =sub_0209D688
	add r1, sp, #0x28
	str r2, [r1, r6, lsl #3]
	ldr r1, [r3, #8]
	add r0, sp, #0x2c
	mov r1, r1, lsl #0xe
	mov r1, r1, lsr #0x1f
	str r1, [r0, r6, lsl #3]
	add r6, r6, #1
_02098EF8:
	ldr r4, [sb, #8]
	cmp r4, #0
	beq _02099234
	ldr r0, [sp, #0x24]
	add fp, sp, #0x28
	mov r2, r0, lsl #0x10
	mov r1, r0, lsl #0xf
	mov r0, r2, lsr #0x1f
	str r0, [sp, #0xc]
	mov r0, r1, lsr #0x1f
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x18]
_02098F2C:
	ldr r0, [r4]
	ldrh r1, [r4, #0x2a]
	str r0, [sp]
	ldrh r0, [r4, #0x26]
	cmp r6, #0
	ldr r5, [sp, #0x18]
	mul r2, r1, r0
	mov r1, r2, asr #8
	strb r1, [sp, #0x20]
	ldrh r1, [r4, #0x28]
	ldrb r2, [r4, #0x2d]
	mul r0, r1, r0
	add r0, r2, r0, asr #8
	strb r0, [sp, #0x21]
	ble _02098F94
_02098F68:
	add r2, fp, r5, lsl #3
	ldr ip, [r2, #4]
	add r2, sp, #0x20
	ldrb r2, [r2, ip]
	ldr r3, [fp, r5, lsl #3]
	mov r0, r4
	mov r1, r8
	blx r3
	add r5, r5, #1
	cmp r5, r6
	blt _02098F68
_02098F94:
	ldr r0, [sp, #0x18]
	ldr r5, [sp, #0x18]
	str r0, [sp, #0x70]
	str r0, [sp, #0x6c]
	str r0, [sp, #0x68]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	addne r0, sb, #0x28
	addne r3, r4, #0x38
	ldmneia r0, {r0, r1, r2}
	stmneia r3, {r0, r1, r2}
	cmp r7, #0
	ble _02098FF4
_02098FC8:
	ldr r2, [r8, #0x18]
	mov r1, r4
	add r0, r2, r5, lsl #3
	ldr ip, [r2, r5, lsl #3]
	ldr r0, [r0, #4]
	add r2, sp, #0x68
	mov r3, sb
	blx ip
	add r5, r5, #1
	cmp r5, r7
	blt _02098FC8
_02098FF4:
	ldr r0, [sp, #0x10]
	ldrh r1, [r4, #0x20]
	cmp r0, #0
	ldrsh r0, [r4, #0x22]
	add r0, r1, r0
	strh r0, [r4, #0x20]
	ldr r1, [r4, #0x14]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	mov r0, r0, asr #9
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	mov r0, r0, asr #9
	str r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	mov r0, r0, asr #9
	str r0, [r4, #0x1c]
	ldr r1, [r4, #0x14]
	ldr r0, [sp, #0x68]
	add r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [sp, #0x6c]
	add r0, r1, r0
	str r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	ldr r0, [sp, #0x70]
	add r0, r1, r0
	str r0, [r4, #0x1c]
	ldr r1, [r4, #0x14]
	ldr r0, [sb, #0x34]
	ldr r2, [r4, #8]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r4, #8]
	ldr r1, [r4, #0x18]
	ldr r0, [sb, #0x38]
	ldr r2, [r4, #0xc]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	ldr r0, [sb, #0x3c]
	ldr r2, [r4, #0x10]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r4, #0x10]
	beq _0209912C
	ldr r0, [sp, #4]
	ldrh r2, [r4, #0x24]
	ldrb r1, [r0, #0xd]
	ldrh r3, [r4, #0x26]
	mov r2, r2, lsl #0xc
	mov r1, r1, lsl #0xc
	mov r0, r3, lsl #0xc
	smull r5, r3, r2, r1
	mov r1, #0x800
	adds r2, r5, r1
	adc r1, r3, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	mov r1, r2, asr #8
	subs r0, r0, r1
	bmi _0209912C
	ldr r1, [sp, #4]
	mov r0, r0, asr #0xc
	ldrb r1, [r1, #0xe]
	bl sub_020F2998
	cmp r1, #0
	bne _0209912C
	mov r0, r4
	mov r1, sb
	add r2, sl, #0x1c
	bl sub_0209C1B0
_0209912C:
	ldr r0, [sb, #0x20]
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #1
	movs r0, r0, lsr #0x1f
	beq _02099170
	ldrh r0, [r4, #0x2e]
	ldr r1, [sl, #0x38]
	bic r0, r0, #0xfc00
	mov r1, r1, lsl #8
	mov r1, r1, lsr #0x1a
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r1, r1, #0x3f
	orr r0, r0, r1, lsl #10
	strh r0, [r4, #0x2e]
	b _020991F0
_02099170:
	ldrh r0, [r4, #0x2e]
	ldr r2, [sl, #0x38]
	add r1, sl, #0x38
	bic r0, r0, #0xfc00
	mov r2, r2, lsl #0xe
	mov r2, r2, lsr #0x1a
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	and r2, r2, #0x3f
	orr r0, r0, r2, lsl #10
	strh r0, [r4, #0x2e]
	ldr r2, [sl, #0x38]
	bic r0, r2, #0x3f000
	mov r2, r2, lsl #0xe
	mov r2, r2, lsr #0x1a
	add r2, r2, #1
	and r2, r2, #0x3f
	orr r0, r0, r2, lsl #12
	str r0, [sl, #0x38]
	ldr r2, [sl, #0x38]
	mov r0, r2, lsl #0xe
	mov r3, r0, lsr #0x1a
	mov r0, r2, lsl #0x14
	cmp r3, r0, lsr #26
	bls _020991F0
	mov r0, r2, lsl #0x1a
	mov r0, r0, lsr #0x1a
	and r0, r0, #0x3f
	ldr r2, [r1]
	bic r2, r2, #0x3f000
	orr r0, r2, r0, lsl #12
	str r0, [r1]
_020991F0:
	ldrh r0, [r4, #0x26]
	add r0, r0, #1
	strh r0, [r4, #0x26]
	ldrh r1, [r4, #0x26]
	ldrh r0, [r4, #0x24]
	cmp r1, r0
	bls _02099224
	mov r1, r4
	add r0, sb, #8
	bl sub_0209DE2C
	mov r1, r0
	add r0, sl, #0x1c
	bl sub_0209DEF8
_02099224:
	ldr r0, [sp]
	cmp r0, #0
	mov r4, r0
	bne _02098F2C
_02099234:
	ldr r0, [sp, #0x24]
	mov r0, r0, lsl #0xf
	movs r0, r0, lsr #0x1f
	beq _0209953C
	ldr r0, [sp, #4]
	mov r6, #0
	ldrh r0, [r0]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	ldrne r0, _02099584 ; =sub_0209D63C
	strne r6, [sp, #0x4c]
	strne r0, [sp, #0x48]
	ldr r0, [sp, #4]
	addne r6, r6, #1
	ldrh r0, [r0]
	mov r0, r0, lsl #0x1d
	movs r0, r0, lsr #0x1f
	beq _02099298
	ldr r2, _02099588 ; =sub_0209D5E4
	add r1, sp, #0x48
	str r2, [r1, r6, lsl #3]
	add r0, sp, #0x4c
	mov r1, #0
	str r1, [r0, r6, lsl #3]
	add r6, r6, #1
_02099298:
	ldr r0, [sp, #4]
	ldr r5, [sb, #0x14]
	ldrh r0, [r0]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	moveq r7, #0
	cmp r5, #0
	beq _0209953C
	mov r0, #0
	str r0, [sp, #0x1c]
_020992C0:
	ldrh r2, [r5, #0x26]
	ldr r0, [r5]
	ldrh r1, [r5, #0x24]
	str r0, [sp, #0x14]
	mov r0, r2, lsl #8
	bl sub_020F2998
	ldr r4, [sp, #0x1c]
	strb r0, [sp, #0x20]
	cmp r6, #0
	ble _02099310
	ldrb fp, [sp, #0x20]
_020992EC:
	add r3, sp, #0x48
	ldr r3, [r3, r4, lsl #3]
	mov r0, r5
	mov r1, r8
	mov r2, fp
	blx r3
	add r4, r4, #1
	cmp r4, r6
	blt _020992EC
_02099310:
	ldr r0, [sp, #0x1c]
	ldr r4, [sp, #0x1c]
	str r0, [sp, #0x70]
	str r0, [sp, #0x6c]
	str r0, [sp, #0x68]
	ldr r0, [sp, #4]
	ldrh r0, [r0]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	addne r0, sb, #0x28
	addne r3, r5, #0x38
	ldmneia r0, {r0, r1, r2}
	stmneia r3, {r0, r1, r2}
	cmp r7, #0
	ble _02099378
_0209934C:
	ldr r2, [r8, #0x18]
	mov r1, r5
	add r0, r2, r4, lsl #3
	ldr fp, [r2, r4, lsl #3]
	ldr r0, [r0, #4]
	add r2, sp, #0x68
	mov r3, sb
	blx fp
	add r4, r4, #1
	cmp r4, r7
	blt _0209934C
_02099378:
	ldrh r1, [r5, #0x20]
	ldrsh r0, [r5, #0x22]
	add r0, r1, r0
	strh r0, [r5, #0x20]
	ldr r1, [r5, #0x14]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	mov r0, r0, asr #9
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	mov r0, r0, asr #9
	str r0, [r5, #0x18]
	ldr r1, [r5, #0x1c]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	mov r0, r0, asr #9
	str r0, [r5, #0x1c]
	ldr r1, [r5, #0x14]
	ldr r0, [sp, #0x68]
	add r0, r1, r0
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r0, [sp, #0x6c]
	add r0, r1, r0
	str r0, [r5, #0x18]
	ldr r1, [r5, #0x1c]
	ldr r0, [sp, #0x70]
	add r0, r1, r0
	str r0, [r5, #0x1c]
	ldr r1, [r5, #0x14]
	ldr r0, [sb, #0x34]
	ldr r2, [r5, #8]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r5, #8]
	ldr r1, [r5, #0x18]
	ldr r0, [sb, #0x38]
	ldr r2, [r5, #0xc]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r5, #0xc]
	ldr r1, [r5, #0x1c]
	ldr r0, [sb, #0x3c]
	ldr r2, [r5, #0x10]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r5, #0x10]
	ldr r0, [sb, #0x20]
	ldr r0, [r0]
	ldr r0, [r0]
	movs r0, r0, lsr #0x1f
	beq _0209947C
	ldr r0, [sl, #0x38]
	ldrh r1, [r5, #0x2e]
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x1a
	bic r1, r1, #0xfc00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	and r0, r0, #0x3f
	orr r0, r1, r0, lsl #10
	strh r0, [r5, #0x2e]
	b _020994FC
_0209947C:
	ldr r0, [sl, #0x38]
	ldrh r1, [r5, #0x2e]
	mov r0, r0, lsl #0xe
	mov r0, r0, lsr #0x1a
	bic r1, r1, #0xfc00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	and r0, r0, #0x3f
	orr r0, r1, r0, lsl #10
	strh r0, [r5, #0x2e]
	ldr r1, [sl, #0x38]
	add r0, sl, #0x38
	bic r2, r1, #0x3f000
	mov r1, r1, lsl #0xe
	mov r1, r1, lsr #0x1a
	add r1, r1, #1
	and r1, r1, #0x3f
	orr r1, r2, r1, lsl #12
	str r1, [sl, #0x38]
	ldr r2, [sl, #0x38]
	mov r1, r2, lsl #0xe
	mov r3, r1, lsr #0x1a
	mov r1, r2, lsl #0x14
	cmp r3, r1, lsr #26
	bls _020994FC
	mov r1, r2, lsl #0x1a
	mov r1, r1, lsr #0x1a
	and r1, r1, #0x3f
	ldr r2, [r0]
	bic r2, r2, #0x3f000
	orr r1, r2, r1, lsl #12
	str r1, [r0]
_020994FC:
	ldrh r0, [r5, #0x26]
	add r0, r0, #1
	strh r0, [r5, #0x26]
	ldrh r1, [r5, #0x26]
	ldrh r0, [r5, #0x24]
	cmp r1, r0
	bls _02099530
	mov r1, r5
	add r0, sb, #0x14
	bl sub_0209DE2C
	mov r1, r0
	add r0, sl, #0x1c
	bl sub_0209DEF8
_02099530:
	ldr r5, [sp, #0x14]
	movs r0, r5
	bne _020992C0
_0209953C:
	ldrh r0, [sb, #0x4c]
	add r0, r0, #1
	strh r0, [sb, #0x4c]
	ldr r2, [sb, #0x90]
	cmp r2, #0
	addeq sp, sp, #0x74
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	mov r0, sb
	mov r1, #1
	blx r2
	add sp, sp, #0x74
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02099574: .word sub_0209D994
_02099578: .word sub_0209D7C8
_0209957C: .word sub_0209D6EC
_02099580: .word sub_0209D688
_02099584: .word sub_0209D63C
_02099588: .word sub_0209D5E4
	arm_func_end sub_02098D44

	arm_func_start sub_0209958C
sub_0209958C: ; 0x0209958C
	stmdb sp!, {r4, r5, r6, lr}
	str r1, [r0, #0x20]
	mov r3, #0
	str r3, [r0, #0x24]
	ldr r1, [r0, #0x20]
	ldr r5, [r2]
	ldr r1, [r1]
	ldr r4, _02099850 ; =0x00007FFF
	ldr r1, [r1, #4]
	ldr ip, _02099854 ; =0x0007FFFF
	add r1, r5, r1
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x20]
	ldr r6, [r2, #4]
	ldr r1, [r1]
	mov lr, #0x80000000
	ldr r5, [r1, #8]
	mov r1, #0x1000
	add r5, r6, r5
	str r5, [r0, #0x2c]
	ldr r5, [r0, #0x20]
	ldr r6, [r2, #8]
	ldr r2, [r5]
	ldr r2, [r2, #0xc]
	add r2, r6, r2
	str r2, [r0, #0x30]
	str r3, [r0, #0x40]
	str r3, [r0, #0x44]
	str r3, [r0, #0x48]
	str r3, [r0, #0x3c]
	ldr r2, [r0, #0x3c]
	str r2, [r0, #0x38]
	ldr r2, [r0, #0x38]
	str r2, [r0, #0x34]
	strh r3, [r0, #0x4c]
	strh r3, [r0, #0x4e]
	ldr r2, [r0, #0x20]
	ldr r5, [r2]
	ldrh r3, [r5, #0x1c]
	ldrh r2, [r5, #0x1e]
	strh r3, [r0, #0x50]
	strh r2, [r0, #0x52]
	ldrh r2, [r5, #0x20]
	strh r2, [r0, #0x54]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldrh r2, [r2, #0x38]
	strh r2, [r0, #0x56]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x10]
	str r2, [r0, #0x58]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x14]
	str r2, [r0, #0x5c]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x18]
	str r2, [r0, #0x60]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x24]
	str r2, [r0, #0x64]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x28]
	str r2, [r0, #0x68]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x2c]
	str r2, [r0, #0x6c]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldrh r2, [r2, #0x3e]
	strh r2, [r0, #0x70]
	strh r4, [r0, #0x72]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldrb r2, [r2, #0x44]
	strb r2, [r0, #0x80]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldrb r2, [r2, #0x45]
	strb r2, [r0, #0x81]
	ldr r2, [r0, #0x80]
	bic r2, r2, #0x70000
	str r2, [r0, #0x80]
	ldr r2, [r0, #0x80]
	and r2, r2, ip
	str r2, [r0, #0x80]
	str lr, [r0, #0x74]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x48]
	mov r2, r2, lsl #6
	mov r2, r2, lsr #0x1e
	mov r2, r1, lsl r2
	strh r2, [r0, #0x78]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x48]
	mov r2, r2, lsl #4
	mov r2, r2, lsr #0x1e
	mov r1, r1, lsl r2
	strh r1, [r0, #0x7a]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #0x4c]
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	ldrnesh r2, [r0, #0x78]
	mvnne r1, #0
	smulbbne r1, r2, r1
	strneh r1, [r0, #0x78]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #0x4c]
	mov r1, r1, lsl #0x1e
	movs r1, r1, lsr #0x1f
	ldrnesh r2, [r0, #0x7a]
	mvnne r1, #0
	smulbbne r1, r2, r1
	strneh r1, [r0, #0x7a]
	ldr r2, [r0, #0x20]
	ldr r1, [r2]
	ldr r1, [r1]
	mov r1, r1, lsl #0xf
	movs r1, r1, lsr #0x1f
	beq _02099814
	ldr r1, [r2, #0x14]
	mov r2, #0x1000
	ldr r1, [r1, #0x10]
	mov r1, r1, lsl #0x1e
	mov r1, r1, lsr #0x1e
	mov r1, r2, lsl r1
	strh r1, [r0, #0x7c]
	ldr r1, [r0, #0x20]
	ldr r1, [r1, #0x14]
	ldr r1, [r1, #0x10]
	mov r1, r1, lsl #0x1c
	mov r1, r1, lsr #0x1e
	mov r1, r2, lsl r1
	strh r1, [r0, #0x7e]
	ldr r1, [r0, #0x20]
	ldr r1, [r1, #0x14]
	ldr r1, [r1, #0x10]
	mov r1, r1, lsl #0x1b
	movs r1, r1, lsr #0x1f
	ldrnesh r2, [r0, #0x7c]
	mvnne r1, #0
	smulbbne r1, r2, r1
	strneh r1, [r0, #0x7c]
	ldr r1, [r0, #0x20]
	ldr r1, [r1, #0x14]
	ldr r1, [r1, #0x10]
	mov r1, r1, lsl #0x1a
	movs r1, r1, lsr #0x1f
	ldrnesh r2, [r0, #0x7e]
	mvnne r1, #0
	smulbbne r1, r2, r1
	strneh r1, [r0, #0x7e]
_02099814:
	mov r2, #0
	str r2, [r0, #4]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #0x14]
	ldr r1, [r0, #0x14]
	str r1, [r0, #8]
	str r2, [r0, #0x18]
	ldr r1, [r0, #0x18]
	str r1, [r0, #0xc]
	str r2, [r0, #0x90]
	str r2, [r0, #0x94]
	str r2, [r0, #0x98]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02099850: .word 0x00007FFF
_02099854: .word 0x0007FFFF
	arm_func_end sub_0209958C

	arm_func_start sub_02099858
sub_02099858: ; 0x02099858
	bx lr
	arm_func_end sub_02099858

	arm_func_start sub_0209985C
sub_0209985C: ; 0x0209985C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	ldr r7, [r0, #0xc]
	ldr r3, _02099934 ; =0x040004A8
	str r7, [sp]
	ldr r1, [r0, #4]
	mov r2, r7, lsl #0x1c
	mov lr, r2, lsr #0x1c
	mov r1, r1, lsr #3
	orr ip, r1, lr, lsl #26
	mov r4, r7, lsl #0x18
	mov r5, r7, lsl #0x14
	mov r2, r7, lsl #0xf
	mov r4, r4, lsr #0x1c
	orr ip, ip, #0x40000000
	mov r6, r7, lsl #0x12
	orr ip, ip, r4, lsl #20
	mov r5, r5, lsr #0x1c
	mov r1, r7, lsl #0x10
	orr ip, ip, r5, lsl #23
	mov r4, r6, lsr #0x1e
	mov r5, r1, lsr #0x1e
	orr r1, ip, r4, lsl #16
	mov r2, r2, lsr #0x1f
	orr r1, r1, r5, lsl #18
	orr r1, r1, r2, lsl #29
	str r1, [r3]
	cmp lr, #2
	moveq r1, #1
	movne r1, #0
	ldr r2, [r0, #8]
	rsb r1, r1, #4
	mov r2, r2, lsr r1
	ldr r1, _02099938 ; =0x040004AC
	ldr ip, _0209993C ; =0x04000440
	str r2, [r1]
	mov r2, #3
	ldr r1, _02099940 ; =0x04000454
	str r2, [ip]
	mov r3, #0
	str r3, [r1]
	ldrh r1, [r0, #0x10]
	ldrh r2, [r0, #0x12]
	ldr r0, _02099944 ; =0x0400046C
	mov r1, r1, lsl #0xc
	str r1, [r0]
	mov r1, r2, lsl #0xc
	str r1, [r0]
	str r3, [r0]
	mov r0, #1
	str r0, [ip]
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02099934: .word 0x040004A8
_02099938: .word 0x040004AC
_0209993C: .word 0x04000440
_02099940: .word 0x04000454
_02099944: .word 0x0400046C
	arm_func_end sub_0209985C

	arm_func_start sub_02099948
sub_02099948: ; 0x02099948
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xf0
	mov r4, r1
	ldrh r2, [r4, #0x2e]
	mov r5, r0
	ldr r0, [r5, #0x3c]
	mov r1, r2, lsl #0x16
	mov r3, r2, lsl #0x1b
	mov r1, r1, lsr #0x1b
	mov r3, r3, lsr #0x1b
	add r1, r1, #1
	mul r6, r3, r1
	mov r1, r2, lsl #0x10
	movs r2, r6, asr #5
	mov r1, r1, lsr #0x1a
	orr r0, r0, #0xc0
	orr r1, r0, r1, lsl #24
	ldr r0, _02099DA4 ; =0x040004A4
	orr r1, r1, r2, lsl #16
	str r1, [r0]
	addeq sp, sp, #0xf0
	ldr r0, [r0]
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r0, [r5, #0x40]
	ldrh r1, [r4, #0x20]
	ldr r0, [r0, #0x20]
	ldr r6, _02099DA8 ; =0x021094DC
	ldr r0, [r0, #0x14]
	mov r1, r1, asr #4
	ldrh r0, [r0]
	mov r2, r1, lsl #1
	add r1, r2, #1
	mov r7, r2, lsl #1
	mov r1, r1, lsl #1
	mov r0, r0, lsl #0x15
	mov r3, r0, lsr #0x1e
	ldr r2, _02099DAC ; =_021105E4
	ldrsh r0, [r6, r7]
	ldr r3, [r2, r3, lsl #2]
	ldrsh r1, [r6, r1]
	add r2, sp, #0x30
	blx r3
	add r0, sp, #0xc0
	bl sub_020CB6AC
	ldr r0, [r5, #0x40]
	ldr r0, [r0, #0x20]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x10]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	bne _02099A28
	add r1, sp, #0x90
	add r0, r4, #0x14
	bl sub_020CCFE0
	b _02099A58
_02099A28:
	add r1, sp, #0x90
	add r0, r4, #8
	bl sub_020CCFE0
	ldr r2, [sp, #0x90]
	ldr r1, [sp, #0x94]
	ldr r0, [sp, #0x98]
	rsb r2, r2, #0
	rsb r1, r1, #0
	rsb r0, r0, #0
	str r2, [sp, #0x90]
	str r1, [sp, #0x94]
	str r0, [sp, #0x98]
_02099A58:
	mov r3, #0
	mov r2, #0x1000
	add r0, sp, #0x90
	add r1, sp, #0xb4
	str r3, [sp, #0xb4]
	str r2, [sp, #0xb8]
	str r3, [sp, #0xbc]
	bl sub_020CCE14
	ldr r1, _02099DB0 ; =0x00000CCD
	cmp r0, r1
	bgt _02099A90
	ldr r1, _02099DB4 ; =0xFFFFF333
	cmp r0, r1
	bge _02099AA4
_02099A90:
	mov r0, #0
	mov r1, #0x1000
	str r1, [sp, #0xb4]
	str r0, [sp, #0xb8]
	str r0, [sp, #0xbc]
_02099AA4:
	add r0, sp, #0x90
	add r1, sp, #0xb4
	add r2, sp, #0x9c
	bl sub_020CCE94
	add r0, sp, #0x90
	add r1, sp, #0x9c
	add r2, sp, #0xa8
	bl sub_020CCE94
	ldr r7, [sp, #0x9c]
	ldr r6, [sp, #0xa0]
	ldr r3, [sp, #0xa4]
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x94]
	ldr r2, [sp, #0x98]
	str r7, [sp, #0xc0]
	ldr r7, [sp, #0xa8]
	str r6, [sp, #0xc4]
	ldr r6, [sp, #0xac]
	str r3, [sp, #0xc8]
	ldr r3, [sp, #0xb0]
	str r0, [sp, #0xcc]
	str r1, [sp, #0xd0]
	add r0, sp, #0x30
	str r2, [sp, #0xd4]
	add r1, sp, #0xc0
	mov r2, r0
	str r7, [sp, #0xd8]
	str r6, [sp, #0xdc]
	str r3, [sp, #0xe0]
	bl sub_020CBBC8
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0x30]
	ldr r0, [r0, #0x20]
	mov ip, #0x800
	ldr r0, [r0]
	mov r3, r2, asr #0x1f
	ldrsh r1, [r0, #0x30]
	ldr r0, [r0, #0x48]
	mov lr, #0
	smull r6, r1, r2, r1
	adds r7, r6, ip
	adc r6, r1, #0
	mov r0, r0, lsl #1
	mov r1, r7, lsr #0xc
	orr r1, r1, r6, lsl #20
	movs r0, r0, lsr #0x1d
	beq _02099B74
	cmp r0, #1
	beq _02099BB0
	cmp r0, #2
	beq _02099BCC
	b _02099BF0
_02099B74:
	ldrsh r0, [r4, #0x34]
	mov r8, r0, asr #0x1f
	umull r7, r6, r2, r0
	mla r6, r2, r8, r6
	smull r8, r2, r1, r0
	adds r1, r8, ip
	adc r8, r2, lr
	adds r2, r7, ip
	mla r6, r3, r0, r6
	mov r1, r1, lsr #0xc
	adc r0, r6, lr
	mov r2, r2, lsr #0xc
	orr r1, r1, r8, lsl #20
	orr r2, r2, r0, lsl #20
	b _02099BF0
_02099BB0:
	ldrsh r0, [r4, #0x34]
	smull r3, r0, r1, r0
	adds r1, r3, ip
	adc r0, r0, lr
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	b _02099BF0
_02099BCC:
	ldrsh r6, [r4, #0x34]
	mov r0, r6, asr #0x1f
	umull r8, r7, r2, r6
	mla r7, r2, r0, r7
	adds r2, r8, ip
	mla r7, r3, r6, r7
	adc r0, r7, lr
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
_02099BF0:
	add r0, sp, #0x60
	mov r3, r2
	bl sub_020CB7B4
	add r0, sp, #0x30
	add r1, sp, #0x60
	add r2, sp, #0
	bl sub_020CBBC8
	ldr r0, [r5, #0x40]
	ldr r0, [r0, #0x20]
	ldr r3, [r0]
	ldr r0, [r3]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _02099C6C
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x38]
	add r0, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x44]
	bl sub_020CF510
	add r0, sp, #0
	bl sub_020CF52C
	b _02099D10
_02099C6C:
	ldr r2, [r4, #8]
	ldr r1, [r4, #0x38]
	ldr r0, [r3, #4]
	add r1, r2, r1
	sub r0, r1, r0
	str r0, [sp, #0x24]
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldr r1, [r4, #0x3c]
	ldr r0, [r0]
	add r2, r2, r1
	ldr r1, [r0, #8]
	ldr r0, _02099DB8 ; =0x04000454
	sub r1, r2, r1
	str r1, [sp, #0x28]
	ldr r1, [r5, #0x40]
	ldr r3, [r4, #0x10]
	ldr r1, [r1, #0x20]
	ldr r2, [r4, #0x40]
	ldr r1, [r1]
	add r3, r3, r2
	ldr r2, [r1, #0xc]
	mov r1, #0
	sub r2, r3, r2
	str r2, [sp, #0x2c]
	str r1, [r0]
	ldr r1, [r5, #0x40]
	ldr r0, _02099DBC ; =0x04000470
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #8]
	ldr r1, [r1, #4]
	str r1, [r0]
	str r2, [r0]
	str r3, [r0]
	ldr r0, [r5, #0x44]
	bl sub_020CF52C
	add r0, sp, #0
	bl sub_020CF52C
_02099D10:
	ldr r0, [r5, #0x40]
	ldrh r4, [r4, #0x36]
	ldrh ip, [r0, #0x72]
	mov r2, #0
	and r1, r4, #0x1f
	and r0, ip, #0x1f
	mul r3, r1, r0
	and r1, r4, #0x3e0
	and r0, ip, #0x3e0
	mul r0, r1, r0
	and r4, r4, #0x7c00
	and r1, ip, #0x7c00
	mul ip, r4, r1
	mov r1, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, ip, asr #0x19
	orr r0, r1, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	ldr r1, _02099DC0 ; =0x04000480
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r5, [r5, #0x40]
	ldr r4, _02099DC4 ; =_021105DC
	ldr r1, [r5, #0x20]
	ldrsh r0, [r5, #0x7c]
	ldr r3, [r1, #0x14]
	ldrsh r1, [r5, #0x7e]
	ldrh r5, [r3]
	mov r3, r2
	mov r5, r5, lsl #0x14
	mov r5, r5, lsr #0x1f
	ldr r4, [r4, r5, lsl #2]
	blx r4
	add sp, sp, #0xf0
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02099DA4: .word 0x040004A4
_02099DA8: .word 0x021094DC
_02099DAC: .word _021105E4
_02099DB0: .word 0x00000CCD
_02099DB4: .word 0xFFFFF333
_02099DB8: .word 0x04000454
_02099DBC: .word 0x04000470
_02099DC0: .word 0x04000480
_02099DC4: .word _021105DC
	arm_func_end sub_02099948

	arm_func_start sub_02099DC8
sub_02099DC8: ; 0x02099DC8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xf0
	mov r4, r1
	ldrh r2, [r4, #0x2e]
	mov r5, r0
	ldr r0, [r5, #0x3c]
	mov r1, r2, lsl #0x16
	mov r3, r2, lsl #0x1b
	mov r1, r1, lsr #0x1b
	mov r3, r3, lsr #0x1b
	add r1, r1, #1
	mul r6, r3, r1
	mov r1, r2, lsl #0x10
	movs r2, r6, asr #5
	mov r1, r1, lsr #0x1a
	orr r0, r0, #0xc0
	orr r1, r0, r1, lsl #24
	ldr r0, _0209A220 ; =0x040004A4
	orr r1, r1, r2, lsl #16
	str r1, [r0]
	addeq sp, sp, #0xf0
	ldr r0, [r0]
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r0, [r5, #0x40]
	ldrh r1, [r4, #0x20]
	ldr r0, [r0, #0x20]
	ldr r6, _0209A224 ; =0x021094DC
	ldr r0, [r0]
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	ldr r0, [r0]
	add r1, r2, #1
	mov r7, r2, lsl #1
	mov r1, r1, lsl #1
	mov r0, r0, lsl #0xd
	mov r3, r0, lsr #0x1e
	ldr r2, _0209A228 ; =_021105E4
	ldrsh r0, [r6, r7]
	ldr r3, [r2, r3, lsl #2]
	ldrsh r1, [r6, r1]
	add r2, sp, #0x30
	blx r3
	add r0, sp, #0xc0
	bl sub_020CB6AC
	ldr r0, [r5, #0x40]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #0x48]
	movs r0, r0, lsr #0x1f
	bne _02099EA4
	add r1, sp, #0x90
	add r0, r4, #0x14
	bl sub_020CCFE0
	b _02099ED4
_02099EA4:
	add r1, sp, #0x90
	add r0, r4, #8
	bl sub_020CCFE0
	ldr r2, [sp, #0x90]
	ldr r1, [sp, #0x94]
	ldr r0, [sp, #0x98]
	rsb r2, r2, #0
	rsb r1, r1, #0
	rsb r0, r0, #0
	str r2, [sp, #0x90]
	str r1, [sp, #0x94]
	str r0, [sp, #0x98]
_02099ED4:
	mov r3, #0
	mov r2, #0x1000
	add r0, sp, #0x90
	add r1, sp, #0xb4
	str r3, [sp, #0xb4]
	str r2, [sp, #0xb8]
	str r3, [sp, #0xbc]
	bl sub_020CCE14
	ldr r1, _0209A22C ; =0x00000CCD
	cmp r0, r1
	bgt _02099F0C
	ldr r1, _0209A230 ; =0xFFFFF333
	cmp r0, r1
	bge _02099F20
_02099F0C:
	mov r0, #0
	mov r1, #0x1000
	str r1, [sp, #0xb4]
	str r0, [sp, #0xb8]
	str r0, [sp, #0xbc]
_02099F20:
	add r0, sp, #0x90
	add r1, sp, #0xb4
	add r2, sp, #0x9c
	bl sub_020CCE94
	add r0, sp, #0x90
	add r1, sp, #0x9c
	add r2, sp, #0xa8
	bl sub_020CCE94
	ldr r7, [sp, #0x9c]
	ldr r6, [sp, #0xa0]
	ldr r3, [sp, #0xa4]
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x94]
	ldr r2, [sp, #0x98]
	str r7, [sp, #0xc0]
	ldr r7, [sp, #0xa8]
	str r6, [sp, #0xc4]
	ldr r6, [sp, #0xac]
	str r3, [sp, #0xc8]
	ldr r3, [sp, #0xb0]
	str r0, [sp, #0xcc]
	str r1, [sp, #0xd0]
	add r0, sp, #0x30
	str r2, [sp, #0xd4]
	add r1, sp, #0xc0
	mov r2, r0
	str r7, [sp, #0xd8]
	str r6, [sp, #0xdc]
	str r3, [sp, #0xe0]
	bl sub_020CBBC8
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0x30]
	ldr r0, [r0, #0x20]
	mov ip, #0x800
	ldr r0, [r0]
	mov r3, r2, asr #0x1f
	ldrsh r1, [r0, #0x30]
	ldr r0, [r0, #0x48]
	mov lr, #0
	smull r6, r1, r2, r1
	adds r7, r6, ip
	adc r6, r1, #0
	mov r0, r0, lsl #1
	mov r1, r7, lsr #0xc
	orr r1, r1, r6, lsl #20
	movs r0, r0, lsr #0x1d
	beq _02099FF0
	cmp r0, #1
	beq _0209A02C
	cmp r0, #2
	beq _0209A048
	b _0209A06C
_02099FF0:
	ldrsh r0, [r4, #0x34]
	mov r8, r0, asr #0x1f
	umull r7, r6, r2, r0
	mla r6, r2, r8, r6
	smull r8, r2, r1, r0
	adds r1, r8, ip
	adc r8, r2, lr
	adds r2, r7, ip
	mla r6, r3, r0, r6
	mov r1, r1, lsr #0xc
	adc r0, r6, lr
	mov r2, r2, lsr #0xc
	orr r1, r1, r8, lsl #20
	orr r2, r2, r0, lsl #20
	b _0209A06C
_0209A02C:
	ldrsh r0, [r4, #0x34]
	smull r3, r0, r1, r0
	adds r1, r3, ip
	adc r0, r0, lr
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	b _0209A06C
_0209A048:
	ldrsh r6, [r4, #0x34]
	mov r0, r6, asr #0x1f
	umull r8, r7, r2, r6
	mla r7, r2, r0, r7
	adds r2, r8, ip
	mla r7, r3, r6, r7
	adc r0, r7, lr
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
_0209A06C:
	add r0, sp, #0x60
	mov r3, r2
	bl sub_020CB7B4
	add r0, sp, #0x60
	add r1, sp, #0x30
	add r2, sp, #0
	bl sub_020CBBC8
	ldr r0, [r5, #0x40]
	ldr r0, [r0, #0x20]
	ldr r3, [r0]
	ldr r0, [r3]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209A0E8
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x38]
	add r0, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x44]
	bl sub_020CF510
	add r0, sp, #0
	bl sub_020CF52C
	b _0209A18C
_0209A0E8:
	ldr r2, [r4, #8]
	ldr r1, [r4, #0x38]
	ldr r0, [r3, #4]
	add r1, r2, r1
	sub r0, r1, r0
	str r0, [sp, #0x24]
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldr r1, [r4, #0x3c]
	ldr r0, [r0]
	add r2, r2, r1
	ldr r1, [r0, #8]
	ldr r0, _0209A234 ; =0x04000454
	sub r1, r2, r1
	str r1, [sp, #0x28]
	ldr r1, [r5, #0x40]
	ldr r3, [r4, #0x10]
	ldr r1, [r1, #0x20]
	ldr r2, [r4, #0x40]
	ldr r1, [r1]
	add r3, r3, r2
	ldr r2, [r1, #0xc]
	mov r1, #0
	sub r2, r3, r2
	str r2, [sp, #0x2c]
	str r1, [r0]
	ldr r1, [r5, #0x40]
	ldr r0, _0209A238 ; =0x04000470
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #8]
	ldr r1, [r1, #4]
	str r1, [r0]
	str r2, [r0]
	str r3, [r0]
	ldr r0, [r5, #0x44]
	bl sub_020CF52C
	add r0, sp, #0
	bl sub_020CF52C
_0209A18C:
	ldr r0, [r5, #0x40]
	ldrh r4, [r4, #0x36]
	ldrh ip, [r0, #0x72]
	ldr r1, _0209A23C ; =0x04000480
	and r2, r4, #0x1f
	and r0, ip, #0x1f
	mul r3, r2, r0
	and r2, r4, #0x3e0
	and r0, ip, #0x3e0
	mul r0, r2, r0
	and r4, r4, #0x7c00
	and r2, ip, #0x7c00
	mul ip, r4, r2
	mov r2, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, ip, asr #0x19
	orr r0, r2, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r2, [r5, #0x40]
	ldr r4, _0209A240 ; =_021105DC
	ldr r1, [r2, #0x20]
	ldrsh r0, [r2, #0x78]
	ldr ip, [r1]
	ldrsh r1, [r2, #0x7a]
	ldr r3, [ip]
	ldrsh r2, [ip, #0x50]
	mov r3, r3, lsl #0xc
	mov r5, r3, lsr #0x1f
	ldrsh r3, [ip, #0x52]
	ldr r4, [r4, r5, lsl #2]
	blx r4
	add sp, sp, #0xf0
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0209A220: .word 0x040004A4
_0209A224: .word 0x021094DC
_0209A228: .word _021105E4
_0209A22C: .word 0x00000CCD
_0209A230: .word 0xFFFFF333
_0209A234: .word 0x04000454
_0209A238: .word 0x04000470
_0209A23C: .word 0x04000480
_0209A240: .word _021105DC
	arm_func_end sub_02099DC8

	arm_func_start sub_0209A244
sub_0209A244: ; 0x0209A244
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x90
	mov r4, r1
	ldrh r2, [r4, #0x2e]
	mov r5, r0
	ldr r0, [r5, #0x3c]
	mov r1, r2, lsl #0x16
	mov r3, r2, lsl #0x1b
	mov r1, r1, lsr #0x1b
	mov r3, r3, lsr #0x1b
	add r1, r1, #1
	mul r6, r3, r1
	mov r1, r2, lsl #0x10
	movs r2, r6, asr #5
	mov r1, r1, lsr #0x1a
	orr r0, r0, #0xc0
	orr r1, r0, r1, lsl #24
	ldr r0, _0209A578 ; =0x040004A4
	orr r1, r1, r2, lsl #16
	str r1, [r0]
	addeq sp, sp, #0x90
	ldr r0, [r0]
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r0, [r5, #0x40]
	ldrh r1, [r4, #0x20]
	ldr r0, [r0, #0x20]
	ldr r6, _0209A57C ; =0x021094DC
	ldr r0, [r0, #0x14]
	mov r1, r1, asr #4
	ldrh r0, [r0]
	mov r2, r1, lsl #1
	add r1, r2, #1
	mov r7, r2, lsl #1
	mov r1, r1, lsl #1
	mov r0, r0, lsl #0x15
	mov r3, r0, lsr #0x1e
	ldr r2, _0209A580 ; =_021105E4
	ldrsh r0, [r6, r7]
	ldr r3, [r2, r3, lsl #2]
	ldrsh r1, [r6, r1]
	add r2, sp, #0x30
	blx r3
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0x30]
	ldr r0, [r0, #0x20]
	mov ip, #0x800
	ldr r0, [r0]
	mov r3, r2, asr #0x1f
	ldrsh r1, [r0, #0x30]
	ldr r0, [r0, #0x48]
	mov lr, #0
	smull r6, r1, r2, r1
	adds r7, r6, ip
	adc r6, r1, #0
	mov r1, r7, lsr #0xc
	mov r0, r0, lsl #1
	orr r1, r1, r6, lsl #20
	movs r0, r0, lsr #0x1d
	beq _0209A348
	cmp r0, #1
	beq _0209A384
	cmp r0, #2
	beq _0209A3A0
	b _0209A3C4
_0209A348:
	ldrsh r0, [r4, #0x34]
	mov r8, r0, asr #0x1f
	umull r7, r6, r2, r0
	mla r6, r2, r8, r6
	smull r8, r2, r1, r0
	adds r1, r8, ip
	adc r8, r2, lr
	adds r2, r7, ip
	mla r6, r3, r0, r6
	mov r1, r1, lsr #0xc
	adc r0, r6, lr
	mov r2, r2, lsr #0xc
	orr r1, r1, r8, lsl #20
	orr r2, r2, r0, lsl #20
	b _0209A3C4
_0209A384:
	ldrsh r0, [r4, #0x34]
	smull r3, r0, r1, r0
	adds r1, r3, ip
	adc r0, r0, lr
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	b _0209A3C4
_0209A3A0:
	ldrsh r6, [r4, #0x34]
	mov r0, r6, asr #0x1f
	umull r8, r7, r2, r6
	mla r7, r2, r0, r7
	adds r2, r8, ip
	mla r7, r3, r6, r7
	adc r0, r7, lr
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
_0209A3C4:
	add r0, sp, #0x60
	mov r3, r2
	bl sub_020CB7B4
	add r0, sp, #0x30
	add r1, sp, #0x60
	add r2, sp, #0
	bl sub_020CBBC8
	ldr r0, [r5, #0x40]
	ldr r0, [r0, #0x20]
	ldr r3, [r0]
	ldr r0, [r3]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209A440
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x38]
	add r0, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x44]
	bl sub_020CF510
	add r0, sp, #0
	bl sub_020CF52C
	b _0209A4E4
_0209A440:
	ldr r2, [r4, #8]
	ldr r1, [r4, #0x38]
	ldr r0, [r3, #4]
	add r1, r2, r1
	sub r0, r1, r0
	str r0, [sp, #0x24]
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldr r1, [r4, #0x3c]
	ldr r0, [r0]
	add r2, r2, r1
	ldr r1, [r0, #8]
	ldr r0, _0209A584 ; =0x04000454
	sub r1, r2, r1
	str r1, [sp, #0x28]
	ldr r1, [r5, #0x40]
	ldr r3, [r4, #0x10]
	ldr r1, [r1, #0x20]
	ldr r2, [r4, #0x40]
	ldr r1, [r1]
	add r3, r3, r2
	ldr r2, [r1, #0xc]
	mov r1, #0
	sub r2, r3, r2
	str r2, [sp, #0x2c]
	str r1, [r0]
	ldr r1, [r5, #0x40]
	ldr r0, _0209A588 ; =0x04000470
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #8]
	ldr r1, [r1, #4]
	str r1, [r0]
	str r2, [r0]
	str r3, [r0]
	ldr r0, [r5, #0x44]
	bl sub_020CF52C
	add r0, sp, #0
	bl sub_020CF52C
_0209A4E4:
	ldr r0, [r5, #0x40]
	ldrh r4, [r4, #0x36]
	ldrh ip, [r0, #0x72]
	mov r2, #0
	and r1, r4, #0x1f
	and r0, ip, #0x1f
	mul r3, r1, r0
	and r1, r4, #0x3e0
	and r0, ip, #0x3e0
	mul r0, r1, r0
	and r4, r4, #0x7c00
	and r1, ip, #0x7c00
	mul ip, r4, r1
	mov r1, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, ip, asr #0x19
	orr r0, r1, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	ldr r1, _0209A58C ; =0x04000480
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r5, [r5, #0x40]
	ldr r4, _0209A590 ; =_021105DC
	ldr r1, [r5, #0x20]
	ldrsh r0, [r5, #0x7c]
	ldr r3, [r1, #0x14]
	ldrsh r1, [r5, #0x7e]
	ldrh r5, [r3]
	mov r3, r2
	mov r5, r5, lsl #0x14
	mov r5, r5, lsr #0x1f
	ldr r4, [r4, r5, lsl #2]
	blx r4
	add sp, sp, #0x90
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0209A578: .word 0x040004A4
_0209A57C: .word 0x021094DC
_0209A580: .word _021105E4
_0209A584: .word 0x04000454
_0209A588: .word 0x04000470
_0209A58C: .word 0x04000480
_0209A590: .word _021105DC
	arm_func_end sub_0209A244

	arm_func_start sub_0209A594
sub_0209A594: ; 0x0209A594
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x90
	mov r4, r1
	ldrh r2, [r4, #0x2e]
	mov r5, r0
	ldr r0, [r5, #0x3c]
	mov r1, r2, lsl #0x16
	mov r3, r2, lsl #0x1b
	mov r1, r1, lsr #0x1b
	mov r3, r3, lsr #0x1b
	add r1, r1, #1
	mul r6, r3, r1
	mov r1, r2, lsl #0x10
	movs r2, r6, asr #5
	mov r1, r1, lsr #0x1a
	orr r0, r0, #0xc0
	orr r1, r0, r1, lsl #24
	ldr r0, _0209A8C8 ; =0x040004A4
	orr r1, r1, r2, lsl #16
	str r1, [r0]
	addeq sp, sp, #0x90
	ldr r0, [r0]
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r0, [r5, #0x40]
	ldrh r1, [r4, #0x20]
	ldr r0, [r0, #0x20]
	ldr r6, _0209A8CC ; =0x021094DC
	ldr r0, [r0]
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	ldr r0, [r0]
	add r1, r2, #1
	mov r7, r2, lsl #1
	mov r1, r1, lsl #1
	mov r0, r0, lsl #0xd
	mov r3, r0, lsr #0x1e
	ldr r2, _0209A8D0 ; =_021105E4
	ldrsh r0, [r6, r7]
	ldr r3, [r2, r3, lsl #2]
	ldrsh r1, [r6, r1]
	add r2, sp, #0x30
	blx r3
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0x30]
	ldr r0, [r0, #0x20]
	mov ip, #0x800
	ldr r0, [r0]
	mov r3, r2, asr #0x1f
	ldrsh r1, [r0, #0x30]
	ldr r0, [r0, #0x48]
	mov lr, #0
	smull r6, r1, r2, r1
	adds r7, r6, ip
	adc r6, r1, #0
	mov r1, r7, lsr #0xc
	mov r0, r0, lsl #1
	orr r1, r1, r6, lsl #20
	movs r0, r0, lsr #0x1d
	beq _0209A698
	cmp r0, #1
	beq _0209A6D4
	cmp r0, #2
	beq _0209A6F0
	b _0209A714
_0209A698:
	ldrsh r0, [r4, #0x34]
	mov r8, r0, asr #0x1f
	umull r7, r6, r2, r0
	mla r6, r2, r8, r6
	smull r8, r2, r1, r0
	adds r1, r8, ip
	adc r8, r2, lr
	adds r2, r7, ip
	mla r6, r3, r0, r6
	mov r1, r1, lsr #0xc
	adc r0, r6, lr
	mov r2, r2, lsr #0xc
	orr r1, r1, r8, lsl #20
	orr r2, r2, r0, lsl #20
	b _0209A714
_0209A6D4:
	ldrsh r0, [r4, #0x34]
	smull r3, r0, r1, r0
	adds r1, r3, ip
	adc r0, r0, lr
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	b _0209A714
_0209A6F0:
	ldrsh r6, [r4, #0x34]
	mov r0, r6, asr #0x1f
	umull r8, r7, r2, r6
	mla r7, r2, r0, r7
	adds r2, r8, ip
	mla r7, r3, r6, r7
	adc r0, r7, lr
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
_0209A714:
	add r0, sp, #0x60
	mov r3, r2
	bl sub_020CB7B4
	add r0, sp, #0x60
	add r1, sp, #0x30
	add r2, sp, #0
	bl sub_020CBBC8
	ldr r0, [r5, #0x40]
	ldr r0, [r0, #0x20]
	ldr r3, [r0]
	ldr r0, [r3]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209A790
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x38]
	add r0, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x44]
	bl sub_020CF510
	add r0, sp, #0
	bl sub_020CF52C
	b _0209A834
_0209A790:
	ldr r2, [r4, #8]
	ldr r1, [r4, #0x38]
	ldr r0, [r3, #4]
	add r1, r2, r1
	sub r0, r1, r0
	str r0, [sp, #0x24]
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldr r1, [r4, #0x3c]
	ldr r0, [r0]
	add r2, r2, r1
	ldr r1, [r0, #8]
	ldr r0, _0209A8D4 ; =0x04000454
	sub r1, r2, r1
	str r1, [sp, #0x28]
	ldr r1, [r5, #0x40]
	ldr r3, [r4, #0x10]
	ldr r1, [r1, #0x20]
	ldr r2, [r4, #0x40]
	ldr r1, [r1]
	add r3, r3, r2
	ldr r2, [r1, #0xc]
	mov r1, #0
	sub r2, r3, r2
	str r2, [sp, #0x2c]
	str r1, [r0]
	ldr r1, [r5, #0x40]
	ldr r0, _0209A8D8 ; =0x04000470
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #8]
	ldr r1, [r1, #4]
	str r1, [r0]
	str r2, [r0]
	str r3, [r0]
	ldr r0, [r5, #0x44]
	bl sub_020CF52C
	add r0, sp, #0
	bl sub_020CF52C
_0209A834:
	ldr r0, [r5, #0x40]
	ldrh r4, [r4, #0x36]
	ldrh ip, [r0, #0x72]
	ldr r1, _0209A8DC ; =0x04000480
	and r2, r4, #0x1f
	and r0, ip, #0x1f
	mul r3, r2, r0
	and r2, r4, #0x3e0
	and r0, ip, #0x3e0
	mul r0, r2, r0
	and r4, r4, #0x7c00
	and r2, ip, #0x7c00
	mul ip, r4, r2
	mov r2, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, ip, asr #0x19
	orr r0, r2, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r2, [r5, #0x40]
	ldr r4, _0209A8E0 ; =_021105DC
	ldr r1, [r2, #0x20]
	ldrsh r0, [r2, #0x78]
	ldr ip, [r1]
	ldrsh r1, [r2, #0x7a]
	ldr r3, [ip]
	ldrsh r2, [ip, #0x50]
	mov r3, r3, lsl #0xc
	mov r5, r3, lsr #0x1f
	ldrsh r3, [ip, #0x52]
	ldr r4, [r4, r5, lsl #2]
	blx r4
	add sp, sp, #0x90
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0209A8C8: .word 0x040004A4
_0209A8CC: .word 0x021094DC
_0209A8D0: .word _021105E4
_0209A8D4: .word 0x04000454
_0209A8D8: .word 0x04000470
_0209A8DC: .word 0x04000480
_0209A8E0: .word _021105DC
	arm_func_end sub_0209A594

	arm_func_start sub_0209A8E4
sub_0209A8E4: ; 0x0209A8E4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x88
	mov r6, r1
	ldrh r1, [r6, #0x2e]
	mov r7, r0
	ldr r4, [r7, #0x40]
	mov r0, r1, lsl #0x16
	mov r2, r1, lsl #0x1b
	mov r0, r0, lsr #0x1b
	mov r2, r2, lsr #0x1b
	add r0, r0, #1
	mul r3, r2, r0
	ldr r2, [r4, #0x20]
	movs r3, r3, asr #5
	ldr r0, [r7, #0x3c]
	ldr r4, [r2]
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x1a
	orr r1, r0, #0xc0
	orr r2, r1, r2, lsl #24
	ldrsh r0, [r4, #0x30]
	ldr r8, [r7, #0x44]
	ldr r1, _0209AFB4 ; =0x040004A4
	orr r2, r2, r3, lsl #16
	str r2, [r1]
	addeq sp, sp, #0x88
	ldr r1, [r1]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
	ldr r4, [r6, #0x30]
	ldr r1, [r7, #0x40]
	smull r2, r5, r4, r0
	ldr r0, [r1, #0x20]
	mov r3, #0x800
	adds r1, r2, r3
	ldr r2, [r0]
	adc sb, r5, #0
	ldr r0, [r2, #0x48]
	mov r5, r1, lsr #0xc
	mov r0, r0, lsl #1
	mov r1, r4, asr #0x1f
	orr r5, r5, sb, lsl #20
	movs r0, r0, lsr #0x1d
	mov sb, #0
	beq _0209A9AC
	cmp r0, #1
	beq _0209A9E8
	cmp r0, #2
	beq _0209AA04
	b _0209AA28
_0209A9AC:
	ldrsh r0, [r6, #0x34]
	mov lr, r0, asr #0x1f
	umull ip, sl, r4, r0
	mla sl, r4, lr, sl
	smull lr, r4, r5, r0
	mla sl, r1, r0, sl
	adds r0, lr, r3
	adc lr, r4, sb
	adds r1, ip, r3
	mov r5, r0, lsr #0xc
	adc r0, sl, sb
	mov r4, r1, lsr #0xc
	orr r5, r5, lr, lsl #20
	orr r4, r4, r0, lsl #20
	b _0209AA28
_0209A9E8:
	ldrsh r0, [r6, #0x34]
	smull r1, r0, r5, r0
	adds r1, r1, r3
	adc r0, r0, sb
	mov r5, r1, lsr #0xc
	orr r5, r5, r0, lsl #20
	b _0209AA28
_0209AA04:
	ldrsh sl, [r6, #0x34]
	mov r0, sl, asr #0x1f
	umull lr, ip, r4, sl
	mla ip, r4, r0, ip
	adds r3, lr, r3
	mla ip, r1, sl, ip
	adc r0, ip, sb
	mov r4, r3, lsr #0xc
	orr r4, r4, r0, lsl #20
_0209AA28:
	ldr r0, [r2]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209AC90
	ldr r1, [r6, #8]
	ldr r0, [r6, #0x38]
	add sb, sp, #0x18
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #0x3c]
	add r0, r6, #0x14
	add r1, r2, r1
	str r1, [sp, #0x10]
	ldr r2, [r6, #0x10]
	ldr r1, [r6, #0x40]
	add r1, r2, r1
	str r1, [sp, #0x14]
	ldmia r0, {r0, r1, r2}
	stmia sb, {r0, r1, r2}
	ldr r0, [r8, #8]
	add r1, sp, #0x24
	str r0, [sp, #0x24]
	ldr r2, [r8, #0x14]
	mov r0, sb
	str r2, [sp, #0x28]
	ldr r3, [r8, #0x20]
	mov r2, sb
	str r3, [sp, #0x2c]
	bl sub_020CCE94
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0209AACC
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0209AACC
	ldr r0, [sp, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x88
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
_0209AACC:
	add r0, sp, #0x18
	mov r1, r0
	bl sub_020CCFE0
	add r1, sp, #0x30
	mov r0, r8
	bl sub_020D4928
	add r0, sp, #0x18
	add r1, sp, #0x30
	mov r2, r0
	bl sub_020CB630
	add r0, sp, #0xc
	mov r1, r8
	mov r2, r0
	bl sub_020CBE9C
	add r0, r6, #0x14
	add r3, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, r3
	mov r1, r3
	bl sub_020CCFE0
	ldr r0, [r8, #0x20]
	ldr r1, [sp, #8]
	rsb r0, r0, #0
	smull r3, r0, r1, r0
	mov r2, #0x800
	adds r1, r3, r2
	ldr r3, [r8, #0x14]
	adc r0, r0, #0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	ldr r0, [r8, #8]
	ldr sb, [sp]
	rsb r0, r0, #0
	smull r8, r0, sb, r0
	adds sb, r8, r2
	adc r8, r0, #0
	mov r0, sb, lsr #0xc
	orr r0, r0, r8, lsl #20
	ldr r8, [sp, #4]
	rsb r3, r3, #0
	smull sb, r3, r8, r3
	adds r8, sb, r2
	adc r2, r3, #0
	mov r3, r8, lsr #0xc
	orr r3, r3, r2, lsl #20
	add r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r7, #0x40]
	rsbmi r1, r1, #0
	ldr r0, [r0, #0x20]
	rsb r2, r1, #0x1000
	ldr r0, [r0]
	mov sb, #0x800
	ldr r0, [r0, #0x48]
	ldr ip, [sp, #0x18]
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	smull r8, r0, r2, r0
	adds r2, r8, sb
	adc r0, r0, #0
	mov r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	add r0, r2, #0x1000
	smull r2, r0, r4, r0
	adds r2, r2, sb
	adc r0, r0, #0
	mov lr, r2, lsr #0xc
	orr lr, lr, r0, lsl #20
	smull r0, r4, ip, r5
	adds r8, r0, sb
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	rsb r2, r3, #0
	str r0, [sp, #0x78]
	ldr r0, [sp, #0x10]
	smull sl, r5, r3, r5
	str r0, [sp, #0x7c]
	smull r3, r0, r2, lr
	adc r4, r4, #0
	mov r8, r8, lsr #0xc
	orr r8, r8, r4, lsl #20
	adds r3, r3, sb
	smull lr, r2, ip, lr
	str r8, [sp, #0x54]
	adc r0, r0, #0
	adds r8, sl, sb
	adc r4, r5, #0
	adds r5, lr, sb
	mov sb, r3, lsr #0xc
	orr sb, sb, r0, lsl #20
	mov r8, r8, lsr #0xc
	orr r8, r8, r4, lsl #20
	ldr r3, [sp, #0x14]
	adc r0, r2, #0
	mov r5, r5, lsr #0xc
	orr r5, r5, r0, lsl #20
	mov r4, #0x1000
	ldr r2, _0209AFB8 ; =0x04000454
	str sb, [sp, #0x60]
	str r8, [sp, #0x58]
	add r0, sp, #0x54
	str r5, [sp, #0x64]
	str r1, [sp, #0x6c]
	str r1, [sp, #0x70]
	str r1, [sp, #0x5c]
	str r1, [sp, #0x68]
	str r4, [sp, #0x74]
	str r3, [sp, #0x80]
	str r1, [r2]
	bl sub_020CF52C
	b _0209AF3C
_0209AC90:
	ldr r3, [r6, #8]
	ldr r1, [r6, #0x38]
	ldr r0, [r2, #4]
	add r1, r3, r1
	sub r0, r1, r0
	str r0, [sp, #0xc]
	ldr r0, [r7, #0x40]
	ldr r2, [r6, #0xc]
	ldr r0, [r0, #0x20]
	ldr r1, [r6, #0x3c]
	ldr r0, [r0]
	add r1, r2, r1
	ldr r0, [r0, #8]
	add sb, sp, #0x18
	sub r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x40]
	ldr r2, [r6, #0x10]
	ldr r0, [r0, #0x20]
	ldr r1, [r6, #0x40]
	ldr r0, [r0]
	add r2, r2, r1
	ldr r1, [r0, #0xc]
	add r0, r6, #0x14
	sub r1, r2, r1
	str r1, [sp, #0x14]
	ldmia r0, {r0, r1, r2}
	stmia sb, {r0, r1, r2}
	ldr r0, [r8, #8]
	add r1, sp, #0x24
	str r0, [sp, #0x24]
	ldr r2, [r8, #0x14]
	mov r0, sb
	str r2, [sp, #0x28]
	ldr r3, [r8, #0x20]
	mov r2, sb
	str r3, [sp, #0x2c]
	bl sub_020CCE94
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0209AD54
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0209AD54
	ldr r0, [sp, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x88
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
_0209AD54:
	add r0, sp, #0x18
	mov r1, r0
	bl sub_020CCFE0
	add r1, sp, #0x30
	mov r0, r8
	bl sub_020D4928
	add r0, sp, #0x18
	add r1, sp, #0x30
	mov r2, r0
	bl sub_020CB630
	add r0, sp, #0xc
	mov r1, r8
	mov r2, r0
	bl sub_020CBE9C
	add r0, r6, #0x14
	add r3, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, r3
	mov r1, r3
	bl sub_020CCFE0
	ldr r0, [r8, #0x20]
	ldr r1, [sp, #8]
	rsb r0, r0, #0
	smull r3, r0, r1, r0
	mov r2, #0x800
	adds r1, r3, r2
	ldr r3, [r8, #0x14]
	adc r0, r0, #0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	ldr r0, [r8, #8]
	ldr sb, [sp]
	rsb r0, r0, #0
	smull r8, r0, sb, r0
	adds sb, r8, r2
	adc r8, r0, #0
	mov r0, sb, lsr #0xc
	orr r0, r0, r8, lsl #20
	ldr r8, [sp, #4]
	rsb r3, r3, #0
	smull sb, r3, r8, r3
	adds r8, sb, r2
	adc r2, r3, #0
	mov r3, r8, lsr #0xc
	orr r3, r3, r2, lsl #20
	add r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r7, #0x40]
	rsbmi r1, r1, #0
	ldr r0, [r0, #0x20]
	rsb r2, r1, #0x1000
	ldr r0, [r0]
	mov sb, #0x800
	ldr r0, [r0, #0x48]
	ldr lr, [sp, #0x18]
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	smull r8, r0, r2, r0
	adds r2, r8, sb
	adc r0, r0, #0
	mov r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	add r0, r2, #0x1000
	smull r2, r0, r4, r0
	adds r2, r2, sb
	adc r0, r0, #0
	mov r8, r2, lsr #0xc
	orr r8, r8, r0, lsl #20
	smull r0, r4, lr, r5
	adds ip, r0, sb
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	rsb r2, r3, #0
	str r0, [sp, #0x78]
	ldr r0, [sp, #0x10]
	smull sl, r5, r3, r5
	str r0, [sp, #0x7c]
	smull r3, r0, r2, r8
	adc r4, r4, #0
	mov ip, ip, lsr #0xc
	adds r3, r3, sb
	orr ip, ip, r4, lsl #20
	adc r0, r0, #0
	adds sl, sl, sb
	smull r8, r2, lr, r8
	adc r4, r5, #0
	adds r5, r8, sb
	mov sb, r3, lsr #0xc
	orr sb, sb, r0, lsl #20
	mov r8, sl, lsr #0xc
	orr r8, r8, r4, lsl #20
	ldr r3, [sp, #0x14]
	adc r0, r2, #0
	mov r2, r5, lsr #0xc
	orr r2, r2, r0, lsl #20
	mov r4, #0x1000
	ldr r0, _0209AFB8 ; =0x04000454
	str ip, [sp, #0x54]
	str sb, [sp, #0x60]
	str r8, [sp, #0x58]
	str r1, [sp, #0x6c]
	str r2, [sp, #0x64]
	str r1, [sp, #0x70]
	str r1, [sp, #0x5c]
	str r1, [sp, #0x68]
	str r4, [sp, #0x74]
	str r3, [sp, #0x80]
	str r1, [r0]
	ldr r0, [r7, #0x40]
	ldr r1, _0209AFBC ; =0x04000470
	ldr r2, [r0, #0x20]
	add r0, sp, #0x54
	ldr r2, [r2]
	ldr r4, [r2, #0xc]
	ldr r3, [r2, #8]
	ldr r2, [r2, #4]
	str r2, [r1]
	str r3, [r1]
	str r4, [r1]
	bl sub_020CF52C
_0209AF3C:
	ldr r0, [r7, #0x40]
	ldrh r4, [r6, #0x36]
	ldrh r5, [r0, #0x72]
	mov r2, #0
	and r1, r4, #0x1f
	and r0, r5, #0x1f
	mul r3, r1, r0
	and r1, r4, #0x3e0
	and r0, r5, #0x3e0
	mul r0, r1, r0
	and r4, r4, #0x7c00
	and r1, r5, #0x7c00
	mul r5, r4, r1
	mov r1, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, r5, asr #0x19
	orr r0, r1, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	ldr r1, _0209AFC0 ; =0x04000480
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r1, [r7, #0x40]
	mov r3, r2
	ldrsh r0, [r1, #0x7c]
	ldrsh r1, [r1, #0x7e]
	bl sub_0209C0F4
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0209AFB4: .word 0x040004A4
_0209AFB8: .word 0x04000454
_0209AFBC: .word 0x04000470
_0209AFC0: .word 0x04000480
	arm_func_end sub_0209A8E4

	arm_func_start sub_0209AFC4
sub_0209AFC4: ; 0x0209AFC4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x88
	mov r6, r1
	ldrh r1, [r6, #0x2e]
	mov r7, r0
	ldr r4, [r7, #0x40]
	mov r0, r1, lsl #0x16
	mov r2, r1, lsl #0x1b
	mov r0, r0, lsr #0x1b
	mov r2, r2, lsr #0x1b
	add r0, r0, #1
	mul r3, r2, r0
	ldr r2, [r4, #0x20]
	movs r3, r3, asr #5
	ldr r0, [r7, #0x3c]
	ldr r4, [r2]
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x1a
	orr r1, r0, #0xc0
	orr r2, r1, r2, lsl #24
	ldrsh r0, [r4, #0x30]
	ldr r8, [r7, #0x44]
	ldr r1, _0209B69C ; =0x040004A4
	orr r2, r2, r3, lsl #16
	str r2, [r1]
	addeq sp, sp, #0x88
	ldr r1, [r1]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
	ldr r4, [r6, #0x30]
	ldr r1, [r7, #0x40]
	smull r2, r5, r4, r0
	ldr r0, [r1, #0x20]
	mov r3, #0x800
	adds r1, r2, r3
	ldr r2, [r0]
	adc sb, r5, #0
	ldr r0, [r2, #0x48]
	mov r5, r1, lsr #0xc
	mov r0, r0, lsl #1
	mov r1, r4, asr #0x1f
	orr r5, r5, sb, lsl #20
	movs r0, r0, lsr #0x1d
	mov sb, #0
	beq _0209B08C
	cmp r0, #1
	beq _0209B0C8
	cmp r0, #2
	beq _0209B0E4
	b _0209B108
_0209B08C:
	ldrsh r0, [r6, #0x34]
	mov lr, r0, asr #0x1f
	umull ip, sl, r4, r0
	mla sl, r4, lr, sl
	smull lr, r4, r5, r0
	mla sl, r1, r0, sl
	adds r0, lr, r3
	adc lr, r4, sb
	adds r1, ip, r3
	mov r5, r0, lsr #0xc
	adc r0, sl, sb
	mov r4, r1, lsr #0xc
	orr r5, r5, lr, lsl #20
	orr r4, r4, r0, lsl #20
	b _0209B108
_0209B0C8:
	ldrsh r0, [r6, #0x34]
	smull r1, r0, r5, r0
	adds r1, r1, r3
	adc r0, r0, sb
	mov r5, r1, lsr #0xc
	orr r5, r5, r0, lsl #20
	b _0209B108
_0209B0E4:
	ldrsh sl, [r6, #0x34]
	mov r0, sl, asr #0x1f
	umull lr, ip, r4, sl
	mla ip, r4, r0, ip
	adds r3, lr, r3
	mla ip, r1, sl, ip
	adc r0, ip, sb
	mov r4, r3, lsr #0xc
	orr r4, r4, r0, lsl #20
_0209B108:
	ldr r0, [r2]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209B370
	ldr r1, [r6, #8]
	ldr r0, [r6, #0x38]
	add sb, sp, #0x18
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #0x3c]
	add r0, r6, #0x14
	add r1, r2, r1
	str r1, [sp, #0x10]
	ldr r2, [r6, #0x10]
	ldr r1, [r6, #0x40]
	add r1, r2, r1
	str r1, [sp, #0x14]
	ldmia r0, {r0, r1, r2}
	stmia sb, {r0, r1, r2}
	ldr r0, [r8, #8]
	add r1, sp, #0x24
	str r0, [sp, #0x24]
	ldr r2, [r8, #0x14]
	mov r0, sb
	str r2, [sp, #0x28]
	ldr r3, [r8, #0x20]
	mov r2, sb
	str r3, [sp, #0x2c]
	bl sub_020CCE94
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0209B1AC
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0209B1AC
	ldr r0, [sp, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x88
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
_0209B1AC:
	add r0, sp, #0x18
	mov r1, r0
	bl sub_020CCFE0
	add r1, sp, #0x30
	mov r0, r8
	bl sub_020D4928
	add r0, sp, #0x18
	add r1, sp, #0x30
	mov r2, r0
	bl sub_020CB630
	add r0, sp, #0xc
	mov r1, r8
	mov r2, r0
	bl sub_020CBE9C
	add r0, r6, #0x14
	add r3, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, r3
	mov r1, r3
	bl sub_020CCFE0
	ldr r0, [r8, #0x20]
	ldr r1, [sp, #8]
	rsb r0, r0, #0
	smull r3, r0, r1, r0
	mov r2, #0x800
	adds r1, r3, r2
	ldr r3, [r8, #0x14]
	adc r0, r0, #0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	ldr r0, [r8, #8]
	ldr sb, [sp]
	rsb r0, r0, #0
	smull r8, r0, sb, r0
	adds sb, r8, r2
	adc r8, r0, #0
	mov r0, sb, lsr #0xc
	orr r0, r0, r8, lsl #20
	ldr r8, [sp, #4]
	rsb r3, r3, #0
	smull sb, r3, r8, r3
	adds r8, sb, r2
	adc r2, r3, #0
	mov r3, r8, lsr #0xc
	orr r3, r3, r2, lsl #20
	add r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r7, #0x40]
	rsbmi r1, r1, #0
	ldr r0, [r0, #0x20]
	rsb r2, r1, #0x1000
	ldr r0, [r0]
	mov sb, #0x800
	ldr r0, [r0, #0x48]
	ldr ip, [sp, #0x18]
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	smull r8, r0, r2, r0
	adds r2, r8, sb
	adc r0, r0, #0
	mov r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	add r0, r2, #0x1000
	smull r2, r0, r4, r0
	adds r2, r2, sb
	adc r0, r0, #0
	mov lr, r2, lsr #0xc
	orr lr, lr, r0, lsl #20
	smull r0, r4, ip, r5
	adds r8, r0, sb
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	rsb r2, r3, #0
	str r0, [sp, #0x78]
	ldr r0, [sp, #0x10]
	smull sl, r5, r3, r5
	str r0, [sp, #0x7c]
	smull r3, r0, r2, lr
	adc r4, r4, #0
	mov r8, r8, lsr #0xc
	orr r8, r8, r4, lsl #20
	adds r3, r3, sb
	smull lr, r2, ip, lr
	str r8, [sp, #0x54]
	adc r0, r0, #0
	adds r8, sl, sb
	adc r4, r5, #0
	adds r5, lr, sb
	mov sb, r3, lsr #0xc
	orr sb, sb, r0, lsl #20
	mov r8, r8, lsr #0xc
	orr r8, r8, r4, lsl #20
	ldr r3, [sp, #0x14]
	adc r0, r2, #0
	mov r5, r5, lsr #0xc
	orr r5, r5, r0, lsl #20
	mov r4, #0x1000
	ldr r2, _0209B6A0 ; =0x04000454
	str sb, [sp, #0x60]
	str r8, [sp, #0x58]
	add r0, sp, #0x54
	str r5, [sp, #0x64]
	str r1, [sp, #0x6c]
	str r1, [sp, #0x70]
	str r1, [sp, #0x5c]
	str r1, [sp, #0x68]
	str r4, [sp, #0x74]
	str r3, [sp, #0x80]
	str r1, [r2]
	bl sub_020CF52C
	b _0209B61C
_0209B370:
	ldr r3, [r6, #8]
	ldr r1, [r6, #0x38]
	ldr r0, [r2, #4]
	add r1, r3, r1
	sub r0, r1, r0
	str r0, [sp, #0xc]
	ldr r0, [r7, #0x40]
	ldr r2, [r6, #0xc]
	ldr r0, [r0, #0x20]
	ldr r1, [r6, #0x3c]
	ldr r0, [r0]
	add r1, r2, r1
	ldr r0, [r0, #8]
	add sb, sp, #0x18
	sub r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x40]
	ldr r2, [r6, #0x10]
	ldr r0, [r0, #0x20]
	ldr r1, [r6, #0x40]
	ldr r0, [r0]
	add r2, r2, r1
	ldr r1, [r0, #0xc]
	add r0, r6, #0x14
	sub r1, r2, r1
	str r1, [sp, #0x14]
	ldmia r0, {r0, r1, r2}
	stmia sb, {r0, r1, r2}
	ldr r0, [r8, #8]
	add r1, sp, #0x24
	str r0, [sp, #0x24]
	ldr r2, [r8, #0x14]
	mov r0, sb
	str r2, [sp, #0x28]
	ldr r3, [r8, #0x20]
	mov r2, sb
	str r3, [sp, #0x2c]
	bl sub_020CCE94
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0209B434
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0209B434
	ldr r0, [sp, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x88
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
_0209B434:
	add r0, sp, #0x18
	mov r1, r0
	bl sub_020CCFE0
	add r1, sp, #0x30
	mov r0, r8
	bl sub_020D4928
	add r0, sp, #0x18
	add r1, sp, #0x30
	mov r2, r0
	bl sub_020CB630
	add r0, sp, #0xc
	mov r1, r8
	mov r2, r0
	bl sub_020CBE9C
	add r0, r6, #0x14
	add r3, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, r3
	mov r1, r3
	bl sub_020CCFE0
	ldr r0, [r8, #0x20]
	ldr r1, [sp, #8]
	rsb r0, r0, #0
	smull r3, r0, r1, r0
	mov r2, #0x800
	adds r1, r3, r2
	ldr r3, [r8, #0x14]
	adc r0, r0, #0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	ldr r0, [r8, #8]
	ldr sb, [sp]
	rsb r0, r0, #0
	smull r8, r0, sb, r0
	adds sb, r8, r2
	adc r8, r0, #0
	mov r0, sb, lsr #0xc
	orr r0, r0, r8, lsl #20
	ldr r8, [sp, #4]
	rsb r3, r3, #0
	smull sb, r3, r8, r3
	adds r8, sb, r2
	adc r2, r3, #0
	mov r3, r8, lsr #0xc
	orr r3, r3, r2, lsl #20
	add r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r7, #0x40]
	rsbmi r1, r1, #0
	ldr r0, [r0, #0x20]
	rsb r2, r1, #0x1000
	ldr r0, [r0]
	mov sb, #0x800
	ldr r0, [r0, #0x48]
	ldr lr, [sp, #0x18]
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	smull r8, r0, r2, r0
	adds r2, r8, sb
	adc r0, r0, #0
	mov r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	add r0, r2, #0x1000
	smull r2, r0, r4, r0
	adds r2, r2, sb
	adc r0, r0, #0
	mov r8, r2, lsr #0xc
	orr r8, r8, r0, lsl #20
	smull r0, r4, lr, r5
	adds ip, r0, sb
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	rsb r2, r3, #0
	str r0, [sp, #0x78]
	ldr r0, [sp, #0x10]
	smull sl, r5, r3, r5
	str r0, [sp, #0x7c]
	smull r3, r0, r2, r8
	adc r4, r4, #0
	mov ip, ip, lsr #0xc
	adds r3, r3, sb
	orr ip, ip, r4, lsl #20
	adc r0, r0, #0
	adds sl, sl, sb
	smull r8, r2, lr, r8
	adc r4, r5, #0
	adds r5, r8, sb
	mov sb, r3, lsr #0xc
	orr sb, sb, r0, lsl #20
	mov r8, sl, lsr #0xc
	orr r8, r8, r4, lsl #20
	ldr r3, [sp, #0x14]
	adc r0, r2, #0
	mov r2, r5, lsr #0xc
	orr r2, r2, r0, lsl #20
	mov r4, #0x1000
	ldr r0, _0209B6A0 ; =0x04000454
	str ip, [sp, #0x54]
	str sb, [sp, #0x60]
	str r8, [sp, #0x58]
	str r1, [sp, #0x6c]
	str r2, [sp, #0x64]
	str r1, [sp, #0x70]
	str r1, [sp, #0x5c]
	str r1, [sp, #0x68]
	str r4, [sp, #0x74]
	str r3, [sp, #0x80]
	str r1, [r0]
	ldr r0, [r7, #0x40]
	ldr r1, _0209B6A4 ; =0x04000470
	ldr r2, [r0, #0x20]
	add r0, sp, #0x54
	ldr r2, [r2]
	ldr r4, [r2, #0xc]
	ldr r3, [r2, #8]
	ldr r2, [r2, #4]
	str r2, [r1]
	str r3, [r1]
	str r4, [r1]
	bl sub_020CF52C
_0209B61C:
	ldr r0, [r7, #0x40]
	ldrh r4, [r6, #0x36]
	ldrh r5, [r0, #0x72]
	ldr r1, _0209B6A8 ; =0x04000480
	and r2, r4, #0x1f
	and r0, r5, #0x1f
	mul r3, r2, r0
	and r2, r4, #0x3e0
	and r0, r5, #0x3e0
	mul r0, r2, r0
	and r4, r4, #0x7c00
	and r2, r5, #0x7c00
	mul r5, r4, r2
	mov r2, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, r5, asr #0x19
	orr r0, r2, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r2, [r7, #0x40]
	ldr r1, [r2, #0x20]
	ldrsh r0, [r2, #0x78]
	ldr r3, [r1]
	ldrsh r1, [r2, #0x7a]
	ldrsh r2, [r3, #0x50]
	ldrsh r3, [r3, #0x52]
	bl sub_0209C0F4
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0209B69C: .word 0x040004A4
_0209B6A0: .word 0x04000454
_0209B6A4: .word 0x04000470
_0209B6A8: .word 0x04000480
	arm_func_end sub_0209AFC4

	arm_func_start sub_0209B6AC
sub_0209B6AC: ; 0x0209B6AC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x40
	mov r6, r1
	ldrh r1, [r6, #0x2e]
	mov r7, r0
	ldr r4, [r7, #0x40]
	mov r0, r1, lsl #0x16
	mov r2, r1, lsl #0x1b
	mov r0, r0, lsr #0x1b
	mov r2, r2, lsr #0x1b
	add r0, r0, #1
	mul r3, r2, r0
	ldr r2, [r4, #0x20]
	ldr r0, [r7, #0x3c]
	ldr r4, [r2]
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x1a
	orr r1, r0, #0xc0
	ldrsh r0, [r4, #0x30]
	movs r4, r3, asr #5
	orr r3, r1, r2, lsl #24
	ldr r1, [r7, #0x44]
	ldr r2, _0209BAEC ; =0x040004A4
	orr r3, r3, r4, lsl #16
	str r3, [r2]
	addeq sp, sp, #0x40
	ldr r2, [r2]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
	ldr r4, [r6, #0x30]
	ldr r2, [r7, #0x40]
	smull r3, r5, r4, r0
	ldr r0, [r2, #0x20]
	mov r8, #0x800
	adds r2, r3, r8
	ldr r3, [r0]
	adc sb, r5, #0
	ldr r0, [r3, #0x48]
	mov r5, r2, lsr #0xc
	mov r0, r0, lsl #1
	mov r2, r4, asr #0x1f
	orr r5, r5, sb, lsl #20
	movs r0, r0, lsr #0x1d
	mov sb, #0
	beq _0209B774
	cmp r0, #1
	beq _0209B7B0
	cmp r0, #2
	beq _0209B7CC
	b _0209B7F0
_0209B774:
	ldrsh r0, [r6, #0x34]
	mov lr, r0, asr #0x1f
	umull ip, sl, r4, r0
	mla sl, r4, lr, sl
	smull lr, r4, r5, r0
	mla sl, r2, r0, sl
	adds r0, lr, r8
	adc lr, r4, sb
	adds r2, ip, r8
	mov r5, r0, lsr #0xc
	adc r0, sl, sb
	mov r4, r2, lsr #0xc
	orr r5, r5, lr, lsl #20
	orr r4, r4, r0, lsl #20
	b _0209B7F0
_0209B7B0:
	ldrsh r0, [r6, #0x34]
	smull r2, r0, r5, r0
	adds r2, r2, r8
	adc r0, r0, sb
	mov r5, r2, lsr #0xc
	orr r5, r5, r0, lsl #20
	b _0209B7F0
_0209B7CC:
	ldrsh sl, [r6, #0x34]
	mov r0, sl, asr #0x1f
	umull lr, ip, r4, sl
	mla ip, r4, r0, ip
	adds r4, lr, r8
	mla ip, r2, sl, ip
	adc r0, ip, sb
	mov r4, r4, lsr #0xc
	orr r4, r4, r0, lsl #20
_0209B7F0:
	ldr r0, [r3]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209B910
	ldr r3, [r6, #8]
	ldr r2, [r6, #0x38]
	add r0, sp, #0
	add r2, r3, r2
	str r2, [sp]
	ldr r8, [r6, #0xc]
	ldr r3, [r6, #0x3c]
	mov r2, r0
	add r3, r8, r3
	str r3, [sp, #4]
	ldr r8, [r6, #0x10]
	ldr r3, [r6, #0x40]
	add r3, r8, r3
	str r3, [sp, #8]
	bl sub_020CBE9C
	ldrh r0, [r6, #0x20]
	ldr r2, _0209BAF0 ; =0x021094DC
	mov sb, #0
	mov r0, r0, asr #4
	mov r3, r0, lsl #1
	mov r0, r3, lsl #1
	ldrsh r1, [r2, r0]
	add r0, r3, #1
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	mov lr, #0x1000
	ldr r3, [sp]
	ldr r2, [sp, #4]
	str r3, [sp, #0x30]
	smull ip, sl, r1, r5
	str lr, [sp, #0x2c]
	rsb r8, r1, #0
	ldr r1, [sp, #8]
	smull lr, r5, r0, r5
	mov r3, #0x800
	str r2, [sp, #0x34]
	adds r2, lr, r3
	adc r5, r5, #0
	adds ip, ip, r3
	mov lr, r2, lsr #0xc
	orr lr, lr, r5, lsl #20
	smull r5, r2, r8, r4
	adc sl, sl, #0
	mov r8, ip, lsr #0xc
	orr r8, r8, sl, lsl #20
	adds r5, r5, r3
	smull sl, r4, r0, r4
	adc r0, r2, #0
	adds r2, sl, r3
	mov r5, r5, lsr #0xc
	orr r5, r5, r0, lsl #20
	mov r3, r2, lsr #0xc
	adc r0, r4, #0
	orr r3, r3, r0, lsl #20
	ldr r2, _0209BAF4 ; =0x04000454
	str lr, [sp, #0xc]
	add r0, sp, #0xc
	str r8, [sp, #0x10]
	str sb, [sp, #0x14]
	str r5, [sp, #0x18]
	str r3, [sp, #0x1c]
	str sb, [sp, #0x20]
	str sb, [sp, #0x24]
	str sb, [sp, #0x28]
	str r1, [sp, #0x38]
	str sb, [r2]
	bl sub_020CF52C
	b _0209BA74
_0209B910:
	ldr r8, [r6, #8]
	ldr r2, [r6, #0x38]
	ldr r0, [r3, #4]
	add r2, r8, r2
	sub r0, r2, r0
	str r0, [sp]
	ldr r2, [r7, #0x40]
	ldr r8, [r6, #0xc]
	ldr r2, [r2, #0x20]
	ldr r3, [r6, #0x3c]
	ldr r2, [r2]
	add r3, r8, r3
	ldr r2, [r2, #8]
	add r0, sp, #0
	sub r2, r3, r2
	str r2, [sp, #4]
	ldr r2, [r7, #0x40]
	ldr r8, [r6, #0x10]
	ldr r2, [r2, #0x20]
	ldr r3, [r6, #0x40]
	ldr r2, [r2]
	add r8, r8, r3
	ldr r3, [r2, #0xc]
	mov r2, r0
	sub r3, r8, r3
	str r3, [sp, #8]
	bl sub_020CBE9C
	ldrh r0, [r6, #0x20]
	ldr r2, _0209BAF0 ; =0x021094DC
	mov lr, #0
	mov r0, r0, asr #4
	mov r3, r0, lsl #1
	mov r0, r3, lsl #1
	ldrsh r1, [r2, r0]
	add r0, r3, #1
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	mov sl, #0x1000
	ldr r3, [sp]
	ldr r2, [sp, #4]
	str r3, [sp, #0x30]
	smull sb, r8, r1, r5
	str sl, [sp, #0x2c]
	rsb ip, r1, #0
	smull sl, r5, r0, r5
	ldr r1, [sp, #8]
	mov r3, #0x800
	str r2, [sp, #0x34]
	adds r2, sl, r3
	adc r5, r5, #0
	mov sl, r2, lsr #0xc
	orr sl, sl, r5, lsl #20
	str r1, [sp, #0x38]
	adds sb, sb, r3
	str sl, [sp, #0xc]
	adc sl, r8, #0
	smull r5, r2, ip, r4
	mov r8, sb, lsr #0xc
	orr r8, r8, sl, lsl #20
	smull sb, r4, r0, r4
	adds r5, r5, r3
	adc r0, r2, #0
	adds r2, sb, r3
	mov r3, r5, lsr #0xc
	orr r3, r3, r0, lsl #20
	adc r0, r4, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	ldr r0, _0209BAF4 ; =0x04000454
	str r8, [sp, #0x10]
	str lr, [sp, #0x14]
	str r3, [sp, #0x18]
	str r2, [sp, #0x1c]
	str lr, [sp, #0x20]
	str lr, [sp, #0x24]
	str lr, [sp, #0x28]
	str lr, [r0]
	ldr r0, [r7, #0x40]
	ldr r1, _0209BAF8 ; =0x04000470
	ldr r2, [r0, #0x20]
	add r0, sp, #0xc
	ldr r2, [r2]
	ldr r4, [r2, #0xc]
	ldr r3, [r2, #8]
	ldr r2, [r2, #4]
	str r2, [r1]
	str r3, [r1]
	str r4, [r1]
	bl sub_020CF52C
_0209BA74:
	ldr r0, [r7, #0x40]
	ldrh r4, [r6, #0x36]
	ldrh r5, [r0, #0x72]
	mov r2, #0
	and r1, r4, #0x1f
	and r0, r5, #0x1f
	mul r3, r1, r0
	and r1, r4, #0x3e0
	and r0, r5, #0x3e0
	mul r0, r1, r0
	and r4, r4, #0x7c00
	and r1, r5, #0x7c00
	mul r5, r4, r1
	mov r1, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, r5, asr #0x19
	orr r0, r1, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	ldr r1, _0209BAFC ; =0x04000480
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r1, [r7, #0x40]
	mov r3, r2
	ldrsh r0, [r1, #0x7c]
	ldrsh r1, [r1, #0x7e]
	bl sub_0209C0F4
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0209BAEC: .word 0x040004A4
_0209BAF0: .word 0x021094DC
_0209BAF4: .word 0x04000454
_0209BAF8: .word 0x04000470
_0209BAFC: .word 0x04000480
	arm_func_end sub_0209B6AC

	arm_func_start sub_0209BB00
sub_0209BB00: ; 0x0209BB00
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x3c
	mov r8, r1
	ldrh r3, [r8, #0x2e]
	mov sb, r0
	ldr r1, [sb, #0x40]
	mov r0, r3, lsl #0x16
	mov r2, r3, lsl #0x1b
	mov r0, r0, lsr #0x1b
	ldr r4, [r1, #0x20]
	mov r2, r2, lsr #0x1b
	ldr r5, [r4]
	add r0, r0, #1
	mul r0, r2, r0
	movs fp, r0, asr #5
	mov r3, r3, lsl #0x10
	ldr r2, [sb, #0x3c]
	mov r6, r3, lsr #0x1a
	orr r3, r2, #0xc0
	ldr r4, [r5, #0x48]
	ldrsh r7, [r5, #0x30]
	mov r2, r4, lsl #1
	ldrh r4, [r1, #0x72]
	orr r3, r3, r6, lsl #24
	ldrsh sl, [r8, #0x34]
	ldrh r5, [r8, #0x36]
	ldr r1, [sb, #0x44]
	ldr r0, _0209BF38 ; =0x040004A4
	orr r3, r3, fp, lsl #16
	str r3, [r0]
	mov r2, r2, lsr #0x1d
	addeq sp, sp, #0x3c
	and r3, r2, #0xff
	ldr r0, [r0]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	ldr r6, [r8, #0x30]
	mov r0, #0x800
	smull r7, r2, r6, r7
	adds r7, r7, r0
	adc r2, r2, #0
	mov r7, r7, lsr #0xc
	cmp r3, #0
	mov lr, r6, asr #0x1f
	orr r7, r7, r2, lsl #20
	mov r2, #0
	bne _0209BBF4
	mov ip, sl, asr #0x1f
	umull fp, r3, r6, sl
	mla r3, r6, ip, r3
	mla r3, lr, sl, r3
	smull r6, sl, r7, sl
	adds r6, r6, r0
	adc sl, sl, r2
	adds fp, fp, r0
	adc r0, r3, r2
	mov r7, r6, lsr #0xc
	mov r6, fp, lsr #0xc
	orr r7, r7, sl, lsl #20
	orr r6, r6, r0, lsl #20
	b _0209BC34
_0209BBF4:
	cmp r3, #1
	bne _0209BC14
	smull sl, r3, r7, sl
	adds r7, sl, r0
	adc r0, r3, r2
	mov r7, r7, lsr #0xc
	orr r7, r7, r0, lsl #20
	b _0209BC34
_0209BC14:
	mov ip, sl, asr #0x1f
	umull fp, r3, r6, sl
	adds r0, fp, r0
	mla r3, r6, ip, r3
	mla r3, lr, sl, r3
	adc r2, r3, r2
	mov r6, r0, lsr #0xc
	orr r6, r6, r2, lsl #20
_0209BC34:
	ldr r0, [sb, #0x40]
	ldr r0, [r0, #0x20]
	ldr sl, [r0]
	ldr r0, [sl]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209BD60
	ldr r3, [r8, #8]
	ldr r2, [r8, #0x38]
	add r0, sp, #0
	add r2, r3, r2
	str r2, [sp]
	ldr sl, [r8, #0xc]
	ldr r3, [r8, #0x3c]
	mov r2, r0
	add r3, sl, r3
	str r3, [sp, #4]
	ldr sl, [r8, #0x10]
	ldr r3, [r8, #0x40]
	add r3, sl, r3
	str r3, [sp, #8]
	bl sub_020CBE9C
	ldrh r0, [r8, #0x20]
	ldr r2, _0209BF3C ; =0x021094DC
	ldr ip, [sp]
	mov r0, r0, asr #4
	mov r3, r0, lsl #1
	mov r0, r3, lsl #1
	ldrsh r1, [r2, r0]
	add r0, r3, #1
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	str ip, [sp, #0x30]
	mov ip, #0x1000
	ldr r2, [sp, #4]
	smull fp, sl, r1, r7
	str ip, [sp, #0x2c]
	rsb r3, r1, #0
	ldr r1, [sp, #8]
	str r2, [sp, #0x34]
	mov r8, #0
	smull ip, r7, r0, r7
	mov r2, #0x800
	str r1, [sp, #0x38]
	adds r1, ip, r2
	adc ip, r7, #0
	adds r7, fp, r2
	mov fp, r1, lsr #0xc
	orr fp, fp, ip, lsl #20
	smull ip, r1, r3, r6
	adc sl, sl, #0
	mov r7, r7, lsr #0xc
	orr r7, r7, sl, lsl #20
	adds r3, ip, r2
	smull sl, r6, r0, r6
	adc r0, r1, #0
	adds r1, sl, r2
	mov r3, r3, lsr #0xc
	orr r3, r3, r0, lsl #20
	mov r2, r1, lsr #0xc
	adc r0, r6, #0
	orr r2, r2, r0, lsl #20
	ldr r1, _0209BF40 ; =0x04000454
	str fp, [sp, #0xc]
	add r0, sp, #0xc
	str r7, [sp, #0x10]
	str r8, [sp, #0x14]
	str r3, [sp, #0x18]
	str r2, [sp, #0x1c]
	str r8, [sp, #0x20]
	str r8, [sp, #0x24]
	str r8, [sp, #0x28]
	str r8, [r1]
	bl sub_020CF52C
	b _0209BEC4
_0209BD60:
	ldr r3, [r8, #8]
	ldr r2, [r8, #0x38]
	ldr r0, [sl, #4]
	add r2, r3, r2
	sub r0, r2, r0
	str r0, [sp]
	ldr r2, [sb, #0x40]
	ldr sl, [r8, #0xc]
	ldr r2, [r2, #0x20]
	ldr r3, [r8, #0x3c]
	ldr r2, [r2]
	add r3, sl, r3
	ldr r2, [r2, #8]
	add r0, sp, #0
	sub r2, r3, r2
	str r2, [sp, #4]
	ldr r2, [sb, #0x40]
	ldr sl, [r8, #0x10]
	ldr r2, [r2, #0x20]
	ldr r3, [r8, #0x40]
	ldr r2, [r2]
	add sl, sl, r3
	ldr r3, [r2, #0xc]
	mov r2, r0
	sub r3, sl, r3
	str r3, [sp, #8]
	bl sub_020CBE9C
	ldrh r0, [r8, #0x20]
	ldr r2, _0209BF3C ; =0x021094DC
	mov r8, #0
	mov r0, r0, asr #4
	mov r3, r0, lsl #1
	mov r0, r3, lsl #1
	ldrsh r1, [r2, r0]
	add r0, r3, #1
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	ldr ip, [sp]
	ldr r2, [sp, #4]
	str ip, [sp, #0x30]
	mov ip, #0x1000
	str r2, [sp, #0x34]
	smull fp, sl, r1, r7
	str ip, [sp, #0x2c]
	rsb r3, r1, #0
	ldr r1, [sp, #8]
	smull ip, r7, r0, r7
	mov r2, #0x800
	str r1, [sp, #0x38]
	adds r1, ip, r2
	adc ip, r7, #0
	adds r7, fp, r2
	mov fp, r1, lsr #0xc
	orr fp, fp, ip, lsl #20
	smull ip, r1, r3, r6
	adc sl, sl, #0
	mov r7, r7, lsr #0xc
	orr r7, r7, sl, lsl #20
	smull sl, r6, r0, r6
	adds r3, ip, r2
	adc r0, r1, #0
	adds r1, sl, r2
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	adc r0, r6, #0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x1c]
	ldr r0, _0209BF40 ; =0x04000454
	str fp, [sp, #0xc]
	str r7, [sp, #0x10]
	str r8, [sp, #0x14]
	str r2, [sp, #0x18]
	str r8, [sp, #0x20]
	str r8, [sp, #0x24]
	str r8, [sp, #0x28]
	str r8, [r0]
	ldr r0, [sb, #0x40]
	ldr r1, _0209BF44 ; =0x04000470
	ldr r2, [r0, #0x20]
	add r0, sp, #0xc
	ldr r2, [r2]
	ldr r6, [r2, #0xc]
	ldr r3, [r2, #8]
	ldr r2, [r2, #4]
	str r2, [r1]
	str r3, [r1]
	str r6, [r1]
	bl sub_020CF52C
_0209BEC4:
	and r1, r5, #0x1f
	and r0, r4, #0x1f
	mul r2, r1, r0
	and r1, r5, #0x3e0
	and r0, r4, #0x3e0
	mul r0, r1, r0
	and r3, r5, #0x7c00
	and r1, r4, #0x7c00
	mul r4, r3, r1
	mov r1, r2, asr #5
	mov r0, r0, asr #0xf
	mov r2, r4, asr #0x19
	orr r0, r1, r0, lsl #5
	orr r0, r0, r2, lsl #10
	mov r0, r0, lsl #0x10
	ldr r1, _0209BF48 ; =0x04000480
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r2, [sb, #0x40]
	ldr r1, [r2, #0x20]
	ldrsh r0, [r2, #0x78]
	ldr r3, [r1]
	ldrsh r1, [r2, #0x7a]
	ldrsh r2, [r3, #0x50]
	ldrsh r3, [r3, #0x52]
	bl sub_0209C0F4
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0209BF38: .word 0x040004A4
_0209BF3C: .word 0x021094DC
_0209BF40: .word 0x04000454
_0209BF44: .word 0x04000470
_0209BF48: .word 0x04000480
	arm_func_end sub_0209BB00

	arm_func_start sub_0209BF4C
sub_0209BF4C: ; 0x0209BF4C
	str r1, [r2]
	mov ip, #0
	str ip, [r2, #0xc]
	str r0, [r2, #0x18]
	str ip, [r2, #0x24]
	str ip, [r2, #4]
	mov r3, #0x1000
	str r3, [r2, #0x10]
	str ip, [r2, #0x1c]
	str ip, [r2, #0x28]
	rsb r0, r0, #0
	str r0, [r2, #8]
	str ip, [r2, #0x14]
	str r1, [r2, #0x20]
	str ip, [r2, #0x2c]
	bx lr
	arm_func_end sub_0209BF4C

	arm_func_start sub_0209BF8C
sub_0209BF8C: ; 0x0209BF8C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #4
	ldr r3, _0209C030 ; =0x00000555
	rsb r7, r1, #0x1000
	ldr ip, _0209C034 ; =0x0000093D
	mov r4, #0
	umull sb, r8, r7, r3
	umull r6, r5, r0, ip
	mov lr, #0x800
	adds sb, sb, lr
	mla r8, r7, r4, r8
	mov r7, r7, asr #0x1f
	mla r8, r7, r3, r8
	adc r7, r8, #0
	mov r3, sb, lsr #0xc
	adds r6, r6, lr
	orr r3, r3, r7, lsl #20
	add r1, r3, r1
	mla r5, r0, r4, r5
	mov r0, r0, asr #0x1f
	mla r5, r0, ip, r5
	adc r0, r5, #0
	mov r5, r6, lsr #0xc
	orr r5, r5, r0, lsl #20
	str r1, [r2]
	add ip, r3, r5
	str ip, [r2, #0xc]
	sub r0, r3, r5
	str r0, [r2, #0x18]
	str r4, [r2, #0x24]
	str r0, [r2, #4]
	str r1, [r2, #0x10]
	str ip, [r2, #0x1c]
	str r4, [r2, #0x28]
	str ip, [r2, #8]
	str r0, [r2, #0x14]
	str r1, [r2, #0x20]
	str r4, [r2, #0x2c]
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0209C030: .word 0x00000555
_0209C034: .word 0x0000093D
	arm_func_end sub_0209BF8C

	arm_func_start sub_0209C038
sub_0209C038: ; 0x0209C038
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub r7, r2, #0x1000
	add r5, r3, #0x1000
	add r4, r2, #0x1000
	mov r2, r0, lsl #8
	mov r0, r1, lsl #8
	sub r3, r3, #0x1000
	mov r0, r0, lsr #0x10
	mov r1, r2, lsr #0x10
	ldr ip, _0209C0E0 ; =0x04000500
	mov r8, #1
	ldr r6, _0209C0E4 ; =0x000003FF
	mov r2, r7, lsl #0x10
	mov lr, r5, lsl #0x10
	mov r4, r4, lsl #0x10
	mov r5, r3, lsl #0x10
	ldr r3, _0209C0E8 ; =0x04000488
	str r8, [ip]
	mov ip, #0
	and r2, r6, r2, asr #22
	and r7, r6, lr, asr #22
	and lr, r6, r4, asr #22
	and r4, r6, r5, asr #22
	ldr r6, _0209C0EC ; =0x04000490
	str ip, [r3]
	orr r5, r2, r7, lsl #20
	str r5, [r6]
	str r1, [r3]
	orr r5, lr, r7, lsl #20
	str r5, [r6]
	orr r1, r1, r0, lsl #16
	str r1, [r3]
	orr r1, lr, r4, lsl #20
	str r1, [r6]
	mov r0, r0, lsl #0x10
	str r0, [r3]
	orr r1, r2, r4, lsl #20
	ldr r0, _0209C0F0 ; =0x04000504
	str r1, [r6]
	str ip, [r0]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0209C0E0: .word 0x04000500
_0209C0E4: .word 0x000003FF
_0209C0E8: .word 0x04000488
_0209C0EC: .word 0x04000490
_0209C0F0: .word 0x04000504
	arm_func_end sub_0209C038

	arm_func_start sub_0209C0F4
sub_0209C0F4: ; 0x0209C0F4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	add ip, r3, #0x1000
	sub r5, r2, #0x1000
	add r4, r2, #0x1000
	mov r2, r0, lsl #8
	mov r0, r1, lsl #8
	sub r3, r3, #0x1000
	mov r0, r0, lsr #0x10
	mov r1, r2, lsr #0x10
	ldr r7, _0209C19C ; =0x04000500
	mov r8, #1
	ldr r6, _0209C1A0 ; =0x000003FF
	mov r2, ip, lsl #0x10
	mov lr, r5, lsl #0x10
	mov r4, r4, lsl #0x10
	mov r5, r3, lsl #0x10
	ldr r3, _0209C1A4 ; =0x04000488
	str r8, [r7]
	mov ip, #0
	and r7, r6, r2, asr #22
	and r2, r6, lr, asr #22
	and lr, r6, r4, asr #22
	and r4, r6, r5, asr #22
	ldr r6, _0209C1A8 ; =0x04000490
	str ip, [r3]
	orr r5, r2, r7, lsl #10
	str r5, [r6]
	str r1, [r3]
	orr r5, lr, r7, lsl #10
	str r5, [r6]
	orr r1, r1, r0, lsl #16
	str r1, [r3]
	orr r1, lr, r4, lsl #10
	str r1, [r6]
	mov r0, r0, lsl #0x10
	str r0, [r3]
	orr r1, r2, r4, lsl #10
	ldr r0, _0209C1AC ; =0x04000504
	str r1, [r6]
	str ip, [r0]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0209C19C: .word 0x04000500
_0209C1A0: .word 0x000003FF
_0209C1A4: .word 0x04000488
_0209C1A8: .word 0x04000490
_0209C1AC: .word 0x04000504
	arm_func_end sub_0209C0F4

	arm_func_start sub_0209C1B0
sub_0209C1B0: ; 0x0209C1B0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r3, [r1, #0x20]
	str r1, [sp]
	ldr r6, [r3, #0x14]
	mov r8, r0
	ldrb r3, [r6, #8]
	ldrb r0, [r6, #0xc]
	str r2, [sp, #4]
	mov r3, r3, lsl #0xc
	mov r2, r3, asr #0x1f
	mov r2, r2, lsl #4
	mov r1, #0x800
	mov r4, r3, lsl #4
	adds r4, r4, r1
	orr r2, r2, r3, lsr #28
	adc r1, r2, #0
	mov r5, r4, lsr #0xc
	cmp r0, #0
	mov r0, #0
	str r0, [sp, #8]
	orr r5, r5, r1, lsl #20
	addle sp, sp, #0x24
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxle lr
	ldr sb, _0209C4C0 ; =0x021D43B8
	str r0, [sp, #0x18]
	str r0, [sp, #0x14]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	mov r0, #0x1000
	mov r4, r5, asr #0x1f
	str r0, [sp, #0x10]
_0209C234:
	ldr r0, [sp, #4]
	bl sub_0209DEAC
	movs r7, r0
	addeq sp, sp, #0x24
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	ldr r0, [sp]
	mov r1, r7
	add r0, r0, #0x14
	bl sub_0209DEF8
	add r0, r7, #0x38
	add r1, r8, #8
	str r0, [sp, #0xc]
	add sl, r7, #8
	ldmia r1, {r0, r1, r2}
	stmia sl, {r0, r1, r2}
	ldr sl, [r8, #0x14]
	ldr ip, [sb]
	ldr r1, _0209C4C4 ; =0x5EEDF715
	ldr r0, _0209C4C8 ; =0x1B0CB173
	mov r2, sl, asr #0x1f
	mla r0, ip, r1, r0
	str r0, [sb]
	umull lr, ip, sl, r5
	mla ip, sl, r4, ip
	ldrsh r1, [r6, #2]
	mov r0, r0, lsr #0x17
	mla ip, r2, r5, ip
	mul r0, r1, r0
	mov r3, #0x800
	adds r2, lr, r3
	sub r0, r0, r1, lsl #8
	adc sl, ip, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, sl, lsl #20
	add r0, r2, r0, asr #8
	str r0, [r7, #0x14]
	ldr sl, [r8, #0x18]
	ldr ip, [sb]
	ldr r1, _0209C4C4 ; =0x5EEDF715
	ldr r0, _0209C4C8 ; =0x1B0CB173
	mov r2, sl, asr #0x1f
	mla r0, ip, r1, r0
	str r0, [sb]
	umull lr, ip, sl, r5
	mla ip, sl, r4, ip
	mla ip, r2, r5, ip
	adds r2, lr, r3
	ldrsh r1, [r6, #2]
	mov r0, r0, lsr #0x17
	adc sl, ip, #0
	mul r0, r1, r0
	mov r2, r2, lsr #0xc
	sub r0, r0, r1, lsl #8
	orr r2, r2, sl, lsl #20
	add r0, r2, r0, asr #8
	str r0, [r7, #0x18]
	ldr ip, [r8, #0x1c]
	ldr sl, [sb]
	ldr r1, _0209C4C4 ; =0x5EEDF715
	ldr r0, _0209C4C8 ; =0x1B0CB173
	mov r2, ip, asr #0x1f
	mla r0, sl, r1, r0
	umull sl, lr, ip, r5
	str r0, [sb]
	mla lr, ip, r4, lr
	adds r3, sl, r3
	mla lr, r2, r5, lr
	ldrsh r1, [r6, #2]
	mov r0, r0, lsr #0x17
	adc r2, lr, #0
	mul r0, r1, r0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	sub r0, r0, r1, lsl #8
	add r0, r3, r0, asr #8
	ldr r3, [sp, #0xc]
	add fp, r8, #0x38
	str r0, [r7, #0x1c]
	ldmia fp, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldrb r0, [r6, #9]
	ldrsh r1, [r8, #0x34]
	ldr r2, [r8, #0x30]
	add r0, r0, #1
	mul r1, r2, r1
	mov r1, r1, asr #0xc
	mul r0, r1, r0
	mov r0, r0, asr #6
	str r0, [r7, #0x30]
	ldr r0, [sp, #0x10]
	strh r0, [r7, #0x34]
	ldrh r0, [r6]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	ldrneh r0, [r6, #0xa]
	strneh r0, [r7, #0x36]
	ldreqh r0, [r8, #0x36]
	streqh r0, [r7, #0x36]
	ldrh r1, [r8, #0x2e]
	ldrh r0, [r7, #0x2e]
	mov r2, r1, lsl #0x1b
	mov r1, r1, lsl #0x16
	mov r1, r1, lsr #0x1b
	mov r2, r2, lsr #0x1b
	add r1, r1, #1
	mul r1, r2, r1
	mov r1, r1, lsl #0xb
	mov r1, r1, lsr #0x10
	bic r0, r0, #0x1f
	and r1, r1, #0x1f
	orr r0, r0, r1
	strh r0, [r7, #0x2e]
	ldrh r0, [r7, #0x2e]
	bic r0, r0, #0x3e0
	orr r0, r0, #0x3e0
	strh r0, [r7, #0x2e]
	ldrh r0, [r6]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1e
	beq _0209C438
	cmp r0, #1
	beq _0209C448
	cmp r0, #2
	ldreqh r0, [r8, #0x20]
	streqh r0, [r7, #0x20]
	ldreqsh r0, [r8, #0x22]
	streqh r0, [r7, #0x22]
	b _0209C458
_0209C438:
	ldr r0, [sp, #0x14]
	strh r0, [r7, #0x20]
	strh r0, [r7, #0x22]
	b _0209C458
_0209C448:
	ldrh r0, [r8, #0x20]
	strh r0, [r7, #0x20]
	ldr r0, [sp, #0x18]
	strh r0, [r7, #0x22]
_0209C458:
	ldrh r1, [r6, #6]
	ldr r0, _0209C4CC ; =0x0000FFFF
	strh r1, [r7, #0x24]
	ldr r1, [sp, #0x1c]
	strh r1, [r7, #0x26]
	ldrb r1, [r6, #0xf]
	strb r1, [r7, #0x2c]
	ldrh r1, [r8, #0x24]
	mov r1, r1, lsr #1
	bl sub_020F2998
	strh r0, [r7, #0x28]
	ldrh r1, [r8, #0x24]
	ldr r0, _0209C4CC ; =0x0000FFFF
	bl sub_020F2998
	strh r0, [r7, #0x2a]
	ldr r0, [sp, #0x20]
	strb r0, [r7, #0x2d]
	ldr r0, [sp, #8]
	ldrb r1, [r6, #0xc]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, r1
	blt _0209C234
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0209C4C0: .word 0x021D43B8
_0209C4C4: .word 0x5EEDF715
_0209C4C8: .word 0x1B0CB173
_0209C4CC: .word 0x0000FFFF
	arm_func_end sub_0209C1B0

	arm_func_start sub_0209C4D0
sub_0209C4D0: ; 0x0209C4D0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc4
	mov sb, r0
	ldr r0, [sb, #0x20]
	ldrsh r3, [sb, #0x4e]
	str r0, [sp, #4]
	ldr r0, [sb, #0x58]
	ldr r2, _0209D1DC ; =0x00000FFF
	add r3, r0, r3
	ldr r0, [sp, #4]
	str r1, [sp]
	ldr r8, [r0]
	and r0, r3, r2
	strh r0, [sb, #0x4e]
	ldr r0, [r8]
	mov r0, r0, lsl #0x1c
	mov r1, r0, lsr #0x1c
	mov r0, r3, asr #0xc
	cmp r1, #2
	str r0, [sp, #0xc]
	beq _0209C538
	cmp r1, #3
	beq _0209C538
	sub r0, r1, #5
	cmp r0, #4
	bhi _0209C540
_0209C538:
	mov r0, sb
	bl sub_0209D35C
_0209C540:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	mov r0, #0
	str r0, [sp, #8]
	addle sp, sp, #0xc4
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxle lr
	str r0, [sp, #0x18]
	str r0, [sp, #0x24]
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	mov r0, #0x1000
	str r0, [sp, #0x34]
	ldr r0, [sp, #8]
	ldr r6, _0209D1E0 ; =0x021D43B8
	ldr r4, _0209D1E4 ; =0x5EEDF715
	ldr r5, _0209D1E8 ; =0x1B0CB173
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	str r0, [sp, #0x40]
_0209C590:
	ldr r0, [sp]
	bl sub_0209DEAC
	movs r7, r0
	addeq sp, sp, #0xc4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	add r0, sb, #8
	mov r1, r7
	bl sub_0209DEF8
	ldr r0, [r8]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0209CCD0
_0209C5CC: ; jump table
	b _0209C5F4 ; case 0
	b _0209C610 ; case 1
	b _0209C680 ; case 2
	b _0209C6E8 ; case 3
	b _0209C77C ; case 4
	b _0209C87C ; case 5
	b _0209CB74 ; case 6
	b _0209CBF8 ; case 7
	b _0209C938 ; case 8
	b _0209CA08 ; case 9
_0209C5F4:
	ldr r0, [sp, #0x1c]
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	str r0, [r7, #8]
	b _0209CCD0
_0209C610:
	add r0, r7, #8
	bl sub_0209DFA4
	ldr r2, [r7, #8]
	ldr r1, [sb, #0x5c]
	mov r0, #0x800
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #8]
	ldr r2, [r7, #0xc]
	ldr r1, [sb, #0x5c]
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #0xc]
	ldr r2, [r7, #0x10]
	ldr r1, [sb, #0x5c]
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r0, r1, #0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [r7, #0x10]
	b _0209CCD0
_0209C680:
	add r0, sp, #0x58
	bl sub_0209DF48
	ldr r2, [sp, #0x58]
	ldr r0, [sb, #0x5c]
	mov r1, #0x800
	smull r3, r0, r2, r0
	adds r2, r3, r1
	adc r0, r0, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #0x58]
	ldr r3, [sp, #0x5c]
	ldr r2, [sb, #0x5c]
	add r0, r7, #8
	smull sl, r2, r3, r2
	adds r3, sl, r1
	adc r1, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	ldr r1, [sp, #0x20]
	str r2, [sp, #0x5c]
	str r1, [sp, #0x60]
	add r1, sp, #0x58
	mov r2, sb
	bl sub_0209D1FC
	b _0209CCD0
_0209C6E8:
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0xc]
	bl sub_020F2998
	ldr r1, [sp, #0x18]
	mov r0, r0, asr #4
	add r1, r1, #0x10000
	mov r2, r0, lsl #1
	str r1, [sp, #0x18]
	ldr r0, _0209D1EC ; =0x021094DC
	mov r1, r2, lsl #1
	ldrsh r0, [r0, r1]
	add r1, r2, #1
	mov r2, r1, lsl #1
	ldr r1, _0209D1EC ; =0x021094DC
	ldrsh r3, [r1, r2]
	ldr r2, [sb, #0x5c]
	mov r1, #0x800
	smull sl, r2, r0, r2
	adds sl, sl, r1
	adc r0, r2, #0
	mov r2, sl, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #0x64]
	ldr r2, [sb, #0x5c]
	add r0, r7, #8
	smull sl, r2, r3, r2
	adds r3, sl, r1
	adc r1, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	ldr r1, [sp, #0x24]
	str r2, [sp, #0x68]
	str r1, [sp, #0x6c]
	add r1, sp, #0x64
	mov r2, sb
	bl sub_0209D1FC
	b _0209CCD0
_0209C77C:
	add r0, r7, #8
	bl sub_0209DFA4
	ldr r1, [r6]
	mov r0, #0x800
	mla r2, r1, r4, r5
	str r2, [r6]
	mov r1, r2, lsr #0x17
	mov r1, r1, lsl #0xc
	sub r1, r1, #0x100000
	mov r1, r1, asr #8
	ldr r3, [r7, #8]
	ldr r2, [sb, #0x5c]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	smull r2, r1, r3, r1
	adds r2, r2, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #8]
	ldr r1, [r6]
	mla r2, r1, r4, r5
	str r2, [r6]
	mov r1, r2, lsr #0x17
	mov r1, r1, lsl #0xc
	sub r1, r1, #0x100000
	mov r1, r1, asr #8
	ldr r3, [r7, #0xc]
	ldr r2, [sb, #0x5c]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	smull r2, r1, r3, r1
	adds r2, r2, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #0xc]
	ldr r1, [r6]
	mla r2, r1, r4, r5
	str r2, [r6]
	mov r1, r2, lsr #0x17
	mov r1, r1, lsl #0xc
	sub r1, r1, #0x100000
	mov r1, r1, asr #8
	ldr r3, [r7, #0x10]
	ldr r2, [sb, #0x5c]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	smull r2, r1, r3, r1
	adds r2, r2, r0
	adc r0, r1, #0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [r7, #0x10]
	b _0209CCD0
_0209C87C:
	add r0, sp, #0x70
	bl sub_0209DF48
	ldr r0, [r6]
	ldr r3, [sp, #0x70]
	mla r1, r0, r4, r5
	str r1, [r6]
	ldr r0, [sb, #0x5c]
	mov r2, #0x800
	smull sl, r0, r3, r0
	adds sl, sl, r2
	adc r3, r0, #0
	mov r0, sl, lsr #0xc
	orr r0, r0, r3, lsl #20
	mov r3, r1, lsr #0x17
	mov r3, r3, lsl #0xc
	sub r3, r3, #0x100000
	mov r3, r3, asr #8
	smull sl, r3, r0, r3
	adds sl, sl, r2
	adc r0, r3, #0
	mov r3, sl, lsr #0xc
	orr r3, r3, r0, lsl #20
	mla r0, r1, r4, r5
	str r0, [r6]
	str r3, [sp, #0x70]
	mov r0, r0, lsr #0x17
	mov r0, r0, lsl #0xc
	sub r0, r0, #0x100000
	mov r1, r0, asr #8
	ldr sl, [sp, #0x74]
	ldr r3, [sb, #0x5c]
	add r0, r7, #8
	smull fp, r3, sl, r3
	adds sl, fp, r2
	adc r3, r3, #0
	mov sl, sl, lsr #0xc
	orr sl, sl, r3, lsl #20
	smull r3, r1, sl, r1
	adds r2, r3, r2
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0x74]
	add r1, sp, #0x70
	mov r2, sb
	bl sub_0209D1FC
	b _0209CCD0
_0209C938:
	add r0, r7, #8
	bl sub_0209DFA4
	add r0, sb, #0x84
	add r1, sb, #0x8a
	add r2, sp, #0x44
	bl sub_020CCF18
	ldrsh r1, [sp, #0x46]
	ldrsh r0, [sp, #0x48]
	ldrsh r2, [sp, #0x44]
	str r1, [sp, #0x80]
	str r0, [sp, #0x84]
	add r0, sp, #0x7c
	add r1, r7, #8
	str r2, [sp, #0x7c]
	bl sub_020CCE14
	cmp r0, #0
	bgt _0209C9A0
	ldr r0, [r7, #8]
	rsb r0, r0, #0
	str r0, [r7, #8]
	ldr r0, [r7, #0xc]
	rsb r0, r0, #0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0x10]
	rsb r0, r0, #0
	str r0, [r7, #0x10]
_0209C9A0:
	ldr r2, [r7, #8]
	ldr r1, [sb, #0x5c]
	mov r0, #0x800
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #8]
	ldr r2, [r7, #0xc]
	ldr r1, [sb, #0x5c]
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #0xc]
	ldr r2, [r7, #0x10]
	ldr r1, [sb, #0x5c]
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r0, r1, #0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [r7, #0x10]
	b _0209CCD0
_0209CA08:
	add r0, r7, #8
	bl sub_0209DFA4
	add r0, sb, #0x84
	add r1, sb, #0x8a
	add r2, sp, #0x4a
	bl sub_020CCF18
	ldrsh r1, [sp, #0x4c]
	ldrsh r0, [sp, #0x4e]
	ldrsh r2, [sp, #0x4a]
	str r1, [sp, #0x8c]
	str r0, [sp, #0x90]
	add r0, sp, #0x88
	add r1, r7, #8
	str r2, [sp, #0x88]
	bl sub_020CCE14
	cmp r0, #0
	bge _0209CA70
	ldr r0, [r7, #8]
	rsb r0, r0, #0
	str r0, [r7, #8]
	ldr r0, [r7, #0xc]
	rsb r0, r0, #0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0x10]
	rsb r0, r0, #0
	str r0, [r7, #0x10]
_0209CA70:
	ldr r1, [r6]
	mov r0, #0x800
	mla r2, r1, r4, r5
	str r2, [r6]
	mov r1, r2, lsr #0x17
	mov r1, r1, lsl #0xc
	sub r1, r1, #0x100000
	mov r1, r1, asr #9
	add r1, r1, #0x800
	ldr r3, [r7, #8]
	ldr r2, [sb, #0x5c]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	smull r2, r1, r3, r1
	adds r2, r2, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #8]
	ldr r1, [r6]
	mla r2, r1, r4, r5
	str r2, [r6]
	mov r1, r2, lsr #0x17
	mov r1, r1, lsl #0xc
	sub r1, r1, #0x100000
	mov r1, r1, asr #9
	add r1, r1, #0x800
	ldr r3, [r7, #0xc]
	ldr r2, [sb, #0x5c]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	smull r2, r1, r3, r1
	adds r2, r2, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #0xc]
	ldr r1, [r6]
	mla r2, r1, r4, r5
	str r2, [r6]
	mov r1, r2, lsr #0x17
	mov r1, r1, lsl #0xc
	sub r1, r1, #0x100000
	mov r1, r1, asr #9
	add r1, r1, #0x800
	ldr r3, [r7, #0x10]
	ldr r2, [sb, #0x5c]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	smull r2, r1, r3, r1
	adds r2, r2, r0
	adc r0, r1, #0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [r7, #0x10]
	b _0209CCD0
_0209CB74:
	add r0, r7, #0x14
	bl sub_0209DF48
	ldr r2, [r7, #0x14]
	ldr r1, [sb, #0x5c]
	mov r0, #0x800
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0x94]
	ldr r3, [r7, #0x18]
	ldr r2, [sb, #0x5c]
	ldr r1, [r6]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r0, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	mla r0, r1, r4, r5
	str r0, [r6]
	str r2, [sp, #0x98]
	mov r1, r0, lsr #0x17
	ldr r2, [sb, #0x60]
	add r0, r7, #8
	mul r1, r2, r1
	sub r1, r1, r2, lsl #8
	mov r1, r1, asr #8
	str r1, [sp, #0x9c]
	add r1, sp, #0x94
	mov r2, sb
	bl sub_0209D1FC
	b _0209CCD0
_0209CBF8:
	add r0, r7, #0x14
	bl sub_0209DF48
	ldr r0, [r6]
	mov r3, #0x800
	mla r2, r0, r4, r5
	str r2, [r6]
	ldr sl, [r7, #0x14]
	ldr r0, [sb, #0x5c]
	mov r1, r2, lsr #0x17
	smull fp, r0, sl, r0
	adds fp, fp, r3
	mov r1, r1, lsl #0xc
	adc sl, r0, #0
	mov r0, fp, lsr #0xc
	sub r1, r1, #0x100000
	orr r0, r0, sl, lsl #20
	mov r1, r1, asr #8
	smull sl, r1, r0, r1
	adds sl, sl, r3
	adc r0, r1, #0
	mov r1, sl, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0xa0]
	mla r1, r2, r4, r5
	str r1, [r6]
	mov r2, r1, lsr #0x17
	mov r2, r2, lsl #0xc
	sub r2, r2, #0x100000
	ldr sl, [r7, #0x18]
	ldr r0, [sb, #0x5c]
	mov r2, r2, asr #8
	smull fp, r0, sl, r0
	adds fp, fp, r3
	adc sl, r0, #0
	mov r0, fp, lsr #0xc
	orr r0, r0, sl, lsl #20
	smull sl, r2, r0, r2
	adds r3, sl, r3
	adc r0, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	mla r0, r1, r4, r5
	str r0, [r6]
	str r2, [sp, #0xa4]
	mov r1, r0, lsr #0x17
	ldr r2, [sb, #0x60]
	add r0, r7, #8
	mul r1, r2, r1
	sub r1, r1, r2, lsl #8
	mov r1, r1, asr #8
	str r1, [sp, #0xa8]
	add r1, sp, #0xa0
	mov r2, sb
	bl sub_0209D1FC
_0209CCD0:
	ldr r1, [r6]
	mla r0, r1, r4, r5
	str r0, [r6]
	ldrb r2, [r8, #0x42]
	mov r1, r0, lsr #0x18
	ldr r3, [sb, #0x64]
	mul r1, r2, r1
	add r2, r2, #0xff
	sub r1, r2, r1, asr #7
	mul r1, r3, r1
	mov r1, r1, asr #8
	str r1, [sp, #0x10]
	mla r1, r0, r4, r5
	str r1, [r6]
	mov r0, r1, lsr #0x18
	ldrb r2, [r8, #0x42]
	ldr r3, [sb, #0x68]
	ldr r1, [r8]
	mul r0, r2, r0
	add r2, r2, #0xff
	sub r0, r2, r0, asr #7
	mul r0, r3, r0
	mov r0, r0, asr #8
	str r0, [sp, #0x14]
	mov r0, r1, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #6
	bne _0209CE1C
	ldrsh r0, [sb, #0x84]
	ldr r1, [r7, #0x14]
	mov r2, #0x800
	smull r3, r0, r1, r0
	adds r1, r3, r2
	ldrsh r3, [sb, #0x8a]
	ldr lr, [r7, #0x18]
	mov ip, r1, lsr #0xc
	smull sl, r3, lr, r3
	adc r0, r0, #0
	adds sl, sl, r2
	orr ip, ip, r0, lsl #20
	adc r3, r3, #0
	mov sl, sl, lsr #0xc
	orr sl, sl, r3, lsl #20
	add r3, ip, sl
	str r3, [sp, #0xb8]
	ldrsh sl, [sb, #0x86]
	ldr r3, [r7, #0x14]
	ldrsh lr, [sb, #0x8c]
	smull ip, sl, r3, sl
	adds ip, ip, r2
	ldr fp, [r7, #0x18]
	adc sl, sl, #0
	smull r3, lr, fp, lr
	mov ip, ip, lsr #0xc
	adds r3, r3, r2
	orr ip, ip, sl, lsl #20
	adc sl, lr, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, sl, lsl #20
	add r3, ip, r3
	str r3, [sp, #0xbc]
	ldr sl, [r7, #0x18]
	ldrsh fp, [sb, #0x88]
	ldr r3, [r7, #0x14]
	str sl, [sp, #0x28]
	smull ip, fp, r3, fp
	ldrsh sl, [sb, #0x8e]
	ldr r3, [sp, #0x28]
	adds ip, ip, r2
	smull sl, lr, r3, sl
	adc r3, fp, #0
	adds r2, sl, r2
	mov sl, ip, lsr #0xc
	orr sl, sl, r3, lsl #20
	adc r3, lr, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r3, lsl #20
	add r2, sl, r2
	add r0, sp, #0xb8
	add r1, sp, #0xac
	str r2, [sp, #0xc0]
	bl sub_020CCFE0
	b _0209CE58
_0209CE1C:
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _0209CE4C
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0209CE4C
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _0209CE4C
	add r0, sp, #0xac
	bl sub_0209DFA4
	b _0209CE58
_0209CE4C:
	add r0, r7, #8
	add r1, sp, #0xac
	bl sub_020CCFE0
_0209CE58:
	ldr r2, [sp, #0xac]
	ldr r1, [sp, #0x10]
	mov r0, #0x800
	smull sl, r1, r2, r1
	adds r2, sl, r0
	add sl, sb, #0x28
	str sl, [sp, #0x2c]
	add sl, r7, #0x38
	str sl, [sp, #0x30]
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	ldrsh r1, [sb, #0x50]
	ldr sl, [sp, #0x14]
	ldr r3, [sb, #0x40]
	smull fp, sl, r1, sl
	adds fp, fp, r0
	adc r1, sl, #0
	mov sl, fp, lsr #0xc
	orr sl, sl, r1, lsl #20
	add r1, r2, sl
	add r1, r3, r1
	str r1, [r7, #0x14]
	ldr r3, [sp, #0xb0]
	ldr r1, [sp, #0x10]
	ldrsh sl, [sb, #0x52]
	smull fp, r1, r3, r1
	adds fp, fp, r0
	adc r3, r1, #0
	mov r1, fp, lsr #0xc
	orr r1, r1, r3, lsl #20
	ldr r3, [sp, #0x14]
	ldr r2, [sb, #0x44]
	smull fp, r3, sl, r3
	adds sl, fp, r0
	adc r3, r3, #0
	mov sl, sl, lsr #0xc
	orr sl, sl, r3, lsl #20
	add r1, r1, sl
	add r1, r2, r1
	str r1, [r7, #0x18]
	ldr r1, [sp, #0xb4]
	ldr r2, [sp, #0x10]
	ldrsh lr, [sb, #0x54]
	smull sl, r3, r1, r2
	ldr r1, [sp, #0x14]
	adds sl, sl, r0
	smull r2, r1, lr, r1
	adc r3, r3, #0
	adds r0, r2, r0
	mov r2, sl, lsr #0xc
	orr r2, r2, r3, lsl #20
	adc r1, r1, #0
	mov r0, r0, lsr #0xc
	orr r0, r0, r1, lsl #20
	ldr ip, [sb, #0x48]
	add r0, r2, r0
	add r0, ip, r0
	str r0, [r7, #0x1c]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r0, [r6]
	mla r1, r0, r4, r5
	str r1, [r6]
	mov r0, r1, lsr #0x18
	ldrb r1, [r8, #0x40]
	ldr r2, [sb, #0x6c]
	mul r0, r1, r0
	add r1, r1, #0xff
	sub r0, r1, r0, asr #7
	mul r0, r2, r0
	mov r0, r0, asr #8
	str r0, [r7, #0x30]
	ldr r0, [sp, #0x34]
	strh r0, [r7, #0x34]
	ldr r0, [r8]
	mov r0, r0, lsl #0x16
	movs r0, r0, lsr #0x1f
	beq _0209D010
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	ldrh r0, [r0, #8]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _0209D010
	ldr r0, [r6]
	ldr r3, _0209D1F0 ; =0x00000003
	mla r1, r0, r4, r5
	str r1, [r6]
	mov r0, r1, lsr #0x14
	ldr r1, [sp, #4]
	ldr r2, [r1, #8]
	ldr r1, _0209D1F4 ; =0xAAAAAAAB
	umull r1, sl, r0, r1
	mov sl, sl, lsr #1
	umull sl, fp, r3, sl
	ldrh r1, [r2]
	sub sl, r0, sl
	strh r1, [sp, #0x50]
	ldrh r0, [r8, #0x22]
	mov r1, sl, lsl #1
	strh r0, [sp, #0x52]
	ldrh r0, [r2, #2]
	strh r0, [sp, #0x54]
	add r0, sp, #0x50
	ldrh r0, [r0, r1]
	strh r0, [r7, #0x36]
	b _0209D018
_0209D010:
	ldrh r0, [r8, #0x22]
	strh r0, [r7, #0x36]
_0209D018:
	ldrh r1, [r7, #0x2e]
	ldrb r0, [sb, #0x81]
	bic r1, r1, #0x1f
	and r0, r0, #0x1f
	orr r0, r1, r0
	strh r0, [r7, #0x2e]
	ldrh r0, [r7, #0x2e]
	bic r0, r0, #0x3e0
	orr r0, r0, #0x3e0
	strh r0, [r7, #0x2e]
	ldr r0, [r8]
	mov r0, r0, lsl #0x12
	movs r0, r0, lsr #0x1f
	ldrne r0, [r6]
	mlane r1, r0, r4, r5
	strne r1, [r6]
	strneh r1, [r7, #0x20]
	ldreqh r0, [sb, #0x56]
	streqh r0, [r7, #0x20]
	ldr r0, [r8]
	mov r0, r0, lsl #0x13
	movs r0, r0, lsr #0x1f
	ldreq r0, [sp, #0x38]
	streqh r0, [r7, #0x22]
	beq _0209D0A8
	ldr r0, [r6]
	mla r1, r0, r4, r5
	str r1, [r6]
	mov r0, r1, lsr #0x14
	ldrsh r2, [r8, #0x34]
	ldrsh r1, [r8, #0x36]
	sub r1, r1, r2
	mul r0, r1, r0
	add r0, r0, r2, lsl #12
	mov r0, r0, lsr #0xc
	strh r0, [r7, #0x22]
_0209D0A8:
	ldr r0, [r6]
	mla r1, r0, r4, r5
	str r1, [r6]
	mov r0, r1, lsr #0x18
	ldrb r1, [r8, #0x41]
	ldrh r2, [sb, #0x70]
	mul r0, r1, r0
	mov r0, r0, asr #8
	rsb r0, r0, #0xff
	mul r0, r2, r0
	mov r0, r0, asr #8
	add r0, r0, #1
	strh r0, [r7, #0x24]
	ldr r0, [sp, #0x3c]
	strh r0, [r7, #0x26]
	ldr r0, [r8]
	mov r0, r0, lsl #0x14
	movs r1, r0, lsr #0x1f
	beq _0209D138
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #8]
	mov r0, r0, lsl #0xf
	movs r0, r0, lsr #0x1f
	beq _0209D138
	ldr r0, [r6]
	mla r1, r0, r4, r5
	str r1, [r6]
	mov r0, r1, lsr #0x14
	ldr r1, [sp, #4]
	ldr sl, [r1, #0x10]
	ldrb r1, [sl, #8]
	bl _u32_div_f
	ldrb r0, [sl, r1]
	strb r0, [r7, #0x2c]
	b _0209D168
_0209D138:
	cmp r1, #0
	beq _0209D160
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x10]
	ldr r0, [r1, #8]
	mov r0, r0, lsl #0xf
	movs r0, r0, lsr #0x1f
	ldreqb r0, [r1]
	streqb r0, [r7, #0x2c]
	beq _0209D168
_0209D160:
	ldrb r0, [r8, #0x47]
	strb r0, [r7, #0x2c]
_0209D168:
	ldr r1, [sp, #4]
	ldr r0, _0209D1F8 ; =0x0000FFFF
	ldr r1, [r1]
	ldrb r1, [r1, #0x48]
	bl sub_020F2998
	strh r0, [r7, #0x28]
	ldrh r1, [r7, #0x24]
	ldr r0, _0209D1F8 ; =0x0000FFFF
	bl sub_020F2998
	strh r0, [r7, #0x2a]
	ldr r0, [sp, #0x40]
	strb r0, [r7, #0x2d]
	ldr r0, [r8]
	mov r0, r0, lsl #0xb
	movs r0, r0, lsr #0x1f
	ldrne r0, [r6]
	mlane r1, r0, r4, r5
	strne r1, [r6]
	movne r0, r1, lsr #0x18
	strneb r0, [r7, #0x2d]
	ldr r0, [sp, #8]
	add r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	cmp r1, r0
	blt _0209C590
	add sp, sp, #0xc4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0209D1DC: .word 0x00000FFF
_0209D1E0: .word 0x021D43B8
_0209D1E4: .word 0x5EEDF715
_0209D1E8: .word 0x1B0CB173
_0209D1EC: .word 0x021094DC
_0209D1F0: .word 0x00000003
_0209D1F4: .word 0xAAAAAAAB
_0209D1F8: .word 0x0000FFFF
	arm_func_end sub_0209C4D0

	arm_func_start sub_0209D1FC
sub_0209D1FC: ; 0x0209D1FC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r4, r2
	mov r6, r0
	mov r5, r1
	add r2, sp, #0
	add r0, r4, #0x84
	add r1, r4, #0x8a
	bl sub_020CCF18
	add r0, sp, #0
	mov r1, r0
	bl sub_020CD0F8
	ldrsh r1, [sp]
	ldr lr, [r5, #8]
	ldrsh r0, [r4, #0x84]
	ldr ip, [r5]
	smull r3, r2, lr, r1
	smull r1, r0, ip, r0
	ldrsh r7, [r4, #0x8a]
	ldr r8, [r5, #4]
	mov ip, #0x800
	smull lr, r7, r8, r7
	adds r8, r3, ip
	adc r3, r2, #0
	mov r2, r8, lsr #0xc
	adds r1, r1, ip
	orr r2, r2, r3, lsl #20
	adc r0, r0, #0
	mov r3, r1, lsr #0xc
	adds r1, lr, ip
	orr r3, r3, r0, lsl #20
	adc r0, r7, #0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	add r0, r3, r1
	add r0, r2, r0
	str r0, [r6]
	ldrsh r0, [sp, #2]
	ldr r1, [r5, #8]
	ldrsh r3, [r4, #0x86]
	smull r2, r0, r1, r0
	adds r2, r2, ip
	ldr lr, [r5]
	adc r1, r0, #0
	mov r0, r2, lsr #0xc
	orr r0, r0, r1, lsl #20
	smull r8, r7, lr, r3
	ldrsh r1, [r4, #0x8c]
	ldr r2, [r5, #4]
	adds r8, r8, ip
	smull r3, r1, r2, r1
	adc r2, r7, #0
	mov r7, r8, lsr #0xc
	orr r7, r7, r2, lsl #20
	adds r2, r3, ip
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	add r1, r7, r2
	add r0, r0, r1
	str r0, [r6, #4]
	ldrsh r0, [sp, #4]
	ldr r1, [r5, #8]
	ldr lr, [r5]
	smull r3, r0, r1, r0
	adds r3, r3, ip
	adc r1, r0, #0
	mov r0, r3, lsr #0xc
	orr r0, r0, r1, lsl #20
	ldrsh r3, [r4, #0x88]
	ldrsh r1, [r4, #0x8e]
	ldr r2, [r5, #4]
	smull r5, r4, lr, r3
	adds r5, r5, ip
	smull r3, r1, r2, r1
	adc r4, r4, #0
	adds r2, r3, ip
	mov r3, r5, lsr #0xc
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r3, r3, r4, lsl #20
	orr r2, r2, r1, lsl #20
	add r1, r3, r2
	add r0, r0, r1
	str r0, [r6, #8]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end sub_0209D1FC

	arm_func_start sub_0209D35C
sub_0209D35C: ; 0x0209D35C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r1, _0209D5E0 ; =_021105EC
	mov r4, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	strh r3, [sp]
	strh r2, [sp, #2]
	strh r0, [sp, #4]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1e
	beq _0209D3DC
	cmp r0, #1
	beq _0209D3C4
	cmp r0, #2
	bne _0209D3F4
	mov r0, #0
	mov r1, #0x1000
	strh r1, [sp, #6]
	strh r0, [sp, #8]
	strh r0, [sp, #0xa]
	b _0209D400
_0209D3C4:
	mov r1, #0
	mov r0, #0x1000
	strh r1, [sp, #6]
	strh r0, [sp, #8]
	strh r1, [sp, #0xa]
	b _0209D400
_0209D3DC:
	mov r1, #0
	mov r0, #0x1000
	strh r1, [sp, #6]
	strh r1, [sp, #8]
	strh r0, [sp, #0xa]
	b _0209D400
_0209D3F4:
	add r1, sp, #6
	add r0, r4, #0x50
	bl sub_020CD0F8
_0209D400:
	add r0, sp, #0
	add r1, sp, #6
	bl sub_020CCE50
	cmp r0, #0x1000
	beq _0209D424
	mov r1, #0x1000
	rsb r1, r1, #0
	cmp r0, r1
	bne _0209D438
_0209D424:
	mov r0, #0
	mov r1, #0x1000
	strh r1, [sp]
	strh r0, [sp, #2]
	strh r0, [sp, #4]
_0209D438:
	ldrsh r3, [sp, #8]
	ldrsh r1, [sp, #4]
	ldrsh r2, [sp, #0xa]
	ldrsh r0, [sp, #2]
	smull r6, r5, r3, r1
	mov r1, #0x800
	adds r6, r6, r1
	smull r3, r0, r2, r0
	adc r5, r5, #0
	adds r2, r3, r1
	mov r3, r6, lsr #0xc
	adc r0, r0, #0
	mov r2, r2, lsr #0xc
	orr r3, r3, r5, lsl #20
	orr r2, r2, r0, lsl #20
	sub r0, r3, r2
	strh r0, [r4, #0x84]
	ldrsh r5, [sp, #0xa]
	ldrsh r3, [sp]
	ldrsh r2, [sp, #6]
	ldrsh r0, [sp, #4]
	smull r3, r6, r5, r3
	adds ip, r3, r1
	smull r3, r0, r2, r0
	adc r5, r6, #0
	adds r2, r3, r1
	mov r3, ip, lsr #0xc
	adc r0, r0, #0
	mov r2, r2, lsr #0xc
	orr r3, r3, r5, lsl #20
	orr r2, r2, r0, lsl #20
	sub r0, r3, r2
	strh r0, [r4, #0x86]
	ldrsh r5, [sp, #6]
	ldrsh r3, [sp, #2]
	ldrsh r2, [sp, #8]
	ldrsh r0, [sp]
	smull r3, r6, r5, r3
	adds ip, r3, r1
	smull r3, r0, r2, r0
	adc r5, r6, #0
	adds r2, r3, r1
	mov r3, ip, lsr #0xc
	adc r0, r0, #0
	mov r2, r2, lsr #0xc
	orr r3, r3, r5, lsl #20
	orr r2, r2, r0, lsl #20
	sub r0, r3, r2
	strh r0, [r4, #0x88]
	ldrsh r6, [sp, #8]
	ldrsh r5, [r4, #0x88]
	add r0, r4, #0x84
	ldrsh r3, [sp, #0xa]
	ldrsh r2, [r4, #0x86]
	smull r5, ip, r6, r5
	adds lr, r5, r1
	smull r5, r2, r3, r2
	adc r6, ip, #0
	adds r3, r5, r1
	mov r5, lr, lsr #0xc
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r5, r5, r6, lsl #20
	orr r3, r3, r2, lsl #20
	sub r2, r5, r3
	strh r2, [r4, #0x8a]
	ldrsh r6, [sp, #0xa]
	ldrsh r5, [r4, #0x84]
	ldrsh r3, [sp, #6]
	ldrsh r2, [r4, #0x88]
	smull lr, ip, r6, r5
	smull r5, r2, r3, r2
	adds r6, lr, r1
	adc r3, ip, #0
	mov r6, r6, lsr #0xc
	orr r6, r6, r3, lsl #20
	adds r3, r5, r1
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	sub r2, r6, r3
	strh r2, [r4, #0x8c]
	ldrsh lr, [sp, #6]
	ldrsh ip, [r4, #0x86]
	ldrsh r3, [sp, #8]
	ldrsh r2, [r4, #0x84]
	smull r6, r5, lr, ip
	smull ip, r2, r3, r2
	adds r6, r6, r1
	adc r5, r5, #0
	adds r3, ip, r1
	mov r6, r6, lsr #0xc
	orr r6, r6, r5, lsl #20
	adc r1, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	sub r1, r6, r2
	strh r1, [r4, #0x8e]
	mov r1, r0
	bl sub_020CD0F8
	add r0, r4, #0x8a
	mov r1, r0
	bl sub_020CD0F8
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0209D5E0: .word _021105EC
	arm_func_end sub_0209D35C

	arm_func_start sub_0209D5E4
sub_0209D5E4: ; 0x0209D5E4
	stmdb sp!, {lr}
	sub sp, sp, #4
	rsb r2, r2, #0xff
	mov r1, #0x1f
	mul r3, r2, r1
	ldr r2, _0209D638 ; =0x80808081
	ldrh lr, [r0, #0x2e]
	smull r1, ip, r2, r3
	add ip, r3, ip
	mov ip, ip, asr #7
	mov r1, r3, lsr #0x1f
	add ip, r1, ip
	mov r1, ip, lsl #0x10
	mov r1, r1, lsr #0x10
	bic r2, lr, #0x3e0
	and r1, r1, #0x1f
	orr r1, r2, r1, lsl #5
	strh r1, [r0, #0x2e]
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_0209D638: .word 0x80808081
	arm_func_end sub_0209D5E4

	arm_func_start sub_0209D63C
sub_0209D63C: ; 0x0209D63C
	stmdb sp!, {lr}
	sub sp, sp, #4
	ldr r3, [r1, #0x14]
	sub r1, r2, #0xff
	ldrsh lr, [r3, #4]
	ldr r2, _0209D684 ; =0x80808081
	sub r3, lr, #0x1000
	mul ip, r3, r1
	smull r1, r3, r2, ip
	add r3, ip, r3
	mov r3, r3, asr #7
	mov r1, ip, lsr #0x1f
	add r3, r1, r3
	add r1, lr, r3
	strh r1, [r0, #0x34]
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_0209D684: .word 0x80808081
	arm_func_end sub_0209D63C

	arm_func_start sub_0209D688
sub_0209D688: ; 0x0209D688
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	ldr r5, [r1, #0x10]
	mov r4, #0
	ldrb r3, [r5, #8]
	cmp r3, #0
	addle sp, sp, #4
	ldmleia sp!, {r4, r5, lr}
	bxle lr
	ldrb ip, [r5, #9]
	mov lr, r4
_0209D6B4:
	add r1, lr, ip
	cmp r2, r1
	ldrltb r1, [r5, r4]
	addlt sp, sp, #4
	strltb r1, [r0, #0x2c]
	ldmltia sp!, {r4, r5, lr}
	bxlt lr
	add r4, r4, #1
	cmp r4, r3
	add lr, lr, ip
	blt _0209D6B4
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end sub_0209D688

	arm_func_start sub_0209D6EC
sub_0209D6EC: ; 0x0209D6EC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, [r1, #0xc]
	mov r5, r0
	ldrb r1, [r4, #4]
	ldrb r3, [r4, #5]
	cmp r2, r1
	bge _0209D72C
	ldrh r3, [r4]
	mov r0, r3, lsl #0x16
	mov r6, r3, lsl #0x1b
	mov r0, r0, lsr #0x1b
	sub r0, r0, r6, lsr #27
	mul r0, r2, r0
	bl sub_020F2998
	add r0, r0, r6, lsr #27
	b _0209D768
_0209D72C:
	cmp r2, r3
	ldrlth r0, [r4]
	movlt r0, r0, lsl #0x16
	movlt r0, r0, lsr #0x1b
	blt _0209D768
	ldrh r0, [r4]
	sub r2, r2, #0xff
	rsb r1, r3, #0xff
	mov r6, r0, lsl #0x11
	mov r3, r6, lsr #0x1b
	mov r0, r0, lsl #0x16
	sub r0, r3, r0, lsr #27
	mul r0, r2, r0
	bl sub_020F2998
	add r0, r0, r6, lsr #27
_0209D768:
	ldr r3, _0209D7BC ; =0x021D43B8
	ldr r1, _0209D7C0 ; =0x5EEDF715
	ldr ip, [r3]
	ldr r2, _0209D7C4 ; =0x1B0CB173
	mla r1, ip, r1, r2
	str r1, [r3]
	ldrb r2, [r4, #2]
	mov r1, r1, lsr #0x18
	ldrh r3, [r5, #0x2e]
	mul r1, r2, r1
	mov r1, r1, asr #8
	rsb r1, r1, #0xff
	mul r1, r0, r1
	mov r0, r1, lsl #8
	mov r0, r0, lsr #0x10
	bic r1, r3, #0x3e0
	and r0, r0, #0x1f
	orr r0, r1, r0, lsl #5
	strh r0, [r5, #0x2e]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0209D7BC: .word 0x021D43B8
_0209D7C0: .word 0x5EEDF715
_0209D7C4: .word 0x1B0CB173
	arm_func_end sub_0209D6EC

	arm_func_start sub_0209D7C8
sub_0209D7C8: ; 0x0209D7C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #4
	ldr r4, [r1, #8]
	mov sl, r0
	ldrb r3, [r4, #4]
	ldr r0, [r1]
	ldrb r1, [r4, #5]
	cmp r2, r3
	ldrb fp, [r4, #6]
	ldrlth r0, [r4]
	addlt sp, sp, #4
	strlth r0, [sl, #0x36]
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxlt lr
	cmp r2, r1
	bge _0209D8C0
	ldrh sb, [r0, #0x22]
	ldrh r0, [r4, #8]
	ldrh r8, [r4]
	mov r7, sb, asr #5
	mov fp, sb, asr #0xa
	mov r4, r0, lsl #0x1d
	mov r6, r8, asr #5
	mov r5, r8, asr #0xa
	movs r4, r4, lsr #0x1f
	and sb, sb, #0x1f
	and r7, r7, #0x1f
	and r0, fp, #0x1f
	orreq r1, sb, r7, lsl #5
	orreq r0, r1, r0, lsl #10
	and r8, r8, #0x1f
	and r6, r6, #0x1f
	and r5, r5, #0x1f
	addeq sp, sp, #4
	streqh r0, [sl, #0x36]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	sub r4, r2, r3
	sub r0, r0, r5
	mul r0, r4, r0
	sub fp, r1, r3
	mov r1, fp
	bl sub_020F2998
	sub r1, sb, r8
	mov sb, r0
	mul r0, r4, r1
	mov r1, fp
	bl sub_020F2998
	sub r1, r7, r6
	mov r7, r0
	mul r0, r4, r1
	mov r1, fp
	bl sub_020F2998
	add r1, r8, r7
	add r0, r6, r0
	add r2, r5, sb
	orr r0, r1, r0, lsl #5
	orr r0, r0, r2, lsl #10
	add sp, sp, #4
	strh r0, [sl, #0x36]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_0209D8C0:
	cmp r2, fp
	bge _0209D980
	ldrh r7, [r4, #2]
	ldrh r8, [r0, #0x22]
	ldrh r0, [r4, #8]
	mov r5, r7, asr #5
	mov r4, r7, asr #0xa
	mov r3, r0, lsl #0x1d
	mov r6, r8, asr #5
	mov sb, r8, asr #0xa
	movs r3, r3, lsr #0x1f
	and r7, r7, #0x1f
	and r5, r5, #0x1f
	and r0, r4, #0x1f
	orreq r1, r7, r5, lsl #5
	orreq r0, r1, r0, lsl #10
	and r8, r8, #0x1f
	and r6, r6, #0x1f
	and sb, sb, #0x1f
	addeq sp, sp, #4
	streqh r0, [sl, #0x36]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	sub r4, r2, r1
	sub r0, r0, sb
	mul r0, r4, r0
	sub fp, fp, r1
	mov r1, fp
	bl sub_020F2998
	sub r1, r7, r8
	mov r7, r0
	mul r0, r4, r1
	mov r1, fp
	bl sub_020F2998
	sub r1, r5, r6
	mov r5, r0
	mul r0, r4, r1
	mov r1, fp
	bl sub_020F2998
	add r1, r8, r5
	add r0, r6, r0
	add r2, sb, r7
	orr r0, r1, r0, lsl #5
	orr r0, r0, r2, lsl #10
	add sp, sp, #4
	strh r0, [sl, #0x36]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_0209D980:
	ldrh r0, [r4, #2]
	strh r0, [sl, #0x36]
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end sub_0209D7C8

	arm_func_start sub_0209D994
sub_0209D994: ; 0x0209D994
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	ldr ip, [r1, #4]
	mov r4, r0
	ldrb r1, [ip, #6]
	ldrb r3, [ip, #7]
	cmp r2, r1
	bge _0209D9DC
	ldrsh r5, [ip]
	ldrsh r0, [ip, #2]
	sub r0, r0, r5
	mul r0, r2, r0
	bl sub_020F2998
	add r0, r5, r0
	add sp, sp, #4
	strh r0, [r4, #0x34]
	ldmia sp!, {r4, r5, lr}
	bx lr
_0209D9DC:
	cmp r2, r3
	ldrltsh r0, [ip, #2]
	addlt sp, sp, #4
	strlth r0, [r4, #0x34]
	ldmltia sp!, {r4, r5, lr}
	bxlt lr
	ldrsh r5, [ip, #4]
	ldrsh r0, [ip, #2]
	sub r2, r2, #0xff
	rsb r1, r3, #0xff
	sub r0, r5, r0
	mul r0, r2, r0
	bl sub_020F2998
	add r0, r5, r0
	strh r0, [r4, #0x34]
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end sub_0209D994

	arm_func_start sub_0209DA24
sub_0209DA24: ; 0x0209DA24
	stmdb sp!, {r4, lr}
	ldr lr, [r1, #8]
	ldr r2, [r0]
	ldrsh r4, [r0, #0xc]
	sub r3, r2, lr
	mov r2, #0x800
	smull ip, r3, r4, r3
	adds r4, ip, r2
	adc r3, r3, #0
	mov r4, r4, lsr #0xc
	orr r4, r4, r3, lsl #20
	add r3, lr, r4
	str r3, [r1, #8]
	ldr r4, [r1, #0xc]
	ldr r3, [r0, #4]
	ldrsh ip, [r0, #0xc]
	sub r3, r3, r4
	smull lr, r3, ip, r3
	adds ip, lr, r2
	adc r3, r3, #0
	mov ip, ip, lsr #0xc
	orr ip, ip, r3, lsl #20
	add r3, r4, ip
	str r3, [r1, #0xc]
	ldr lr, [r1, #0x10]
	ldr r3, [r0, #8]
	ldrsh ip, [r0, #0xc]
	sub r0, r3, lr
	smull r3, r0, ip, r0
	adds r2, r3, r2
	adc r0, r0, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	add r0, lr, r2
	str r0, [r1, #0x10]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_0209DA24

	arm_func_start sub_0209DAB8
sub_0209DAB8: ; 0x0209DAB8
	ldr r3, [r3, #0x74]
	ldr r2, [r0]
	cmp r3, #0x80000000
	movne r2, r3
	ldrh r3, [r0, #6]
	mov r3, r3, lsl #0x1e
	movs r3, r3, lsr #0x1e
	beq _0209DAE4
	cmp r3, #1
	beq _0209DB38
	bx lr
_0209DAE4:
	ldr r3, [r1, #0x3c]
	cmp r3, r2
	bge _0209DB10
	ldr r0, [r1, #0xc]
	add r0, r3, r0
	cmp r0, r2
	subgt r0, r2, r3
	strgt r0, [r1, #0xc]
	ldrgth r0, [r1, #0x24]
	strgth r0, [r1, #0x26]
	bxgt lr
_0209DB10:
	cmp r3, r2
	bxlt lr
	ldr r0, [r1, #0xc]
	add r0, r3, r0
	cmp r0, r2
	sublt r0, r2, r3
	strlt r0, [r1, #0xc]
	ldrlth r0, [r1, #0x24]
	strlth r0, [r1, #0x26]
	bx lr
_0209DB38:
	ldr ip, [r1, #0x3c]
	cmp ip, r2
	bge _0209DB88
	ldr r3, [r1, #0xc]
	add r3, ip, r3
	cmp r3, r2
	ble _0209DB88
	sub r2, r2, ip
	str r2, [r1, #0xc]
	ldrsh r2, [r0, #4]
	ldr r3, [r1, #0x18]
	mov r0, #0x800
	smull ip, r2, r3, r2
	adds r3, ip, r0
	adc r0, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	rsb r0, r2, #0
	str r0, [r1, #0x18]
	bx lr
_0209DB88:
	cmp ip, r2
	bxlt lr
	ldr r3, [r1, #0xc]
	add r3, ip, r3
	cmp r3, r2
	bxge lr
	sub r2, r2, ip
	str r2, [r1, #0xc]
	ldrsh r2, [r0, #4]
	ldr r3, [r1, #0x18]
	mov r0, #0x800
	smull ip, r2, r3, r2
	adds r3, ip, r0
	adc r0, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	rsb r0, r2, #0
	str r0, [r1, #0x18]
	bx lr
	arm_func_end sub_0209DAB8

	arm_func_start sub_0209DBD4
sub_0209DBD4: ; 0x0209DBD4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x28
	ldrh r2, [r0, #2]
	mov r4, r1
	cmp r2, #0
	beq _0209DC00
	cmp r2, #1
	beq _0209DC30
	cmp r2, #2
	beq _0209DC60
	b _0209DC8C
_0209DC00:
	ldrh r1, [r0]
	ldr r3, _0209DCA8 ; =0x021094DC
	add r0, sp, #0
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	add r1, r2, #1
	mov ip, r2, lsl #1
	mov r2, r1, lsl #1
	ldrsh r1, [r3, ip]
	ldrsh r2, [r3, r2]
	bl sub_020CB0D0
	b _0209DC8C
_0209DC30:
	ldrh r1, [r0]
	ldr r3, _0209DCA8 ; =0x021094DC
	add r0, sp, #0
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	add r1, r2, #1
	mov ip, r2, lsl #1
	mov r2, r1, lsl #1
	ldrsh r1, [r3, ip]
	ldrsh r2, [r3, r2]
	bl sub_020CB0EC
	b _0209DC8C
_0209DC60:
	ldrh r1, [r0]
	ldr r3, _0209DCA8 ; =0x021094DC
	add r0, sp, #0
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	add r1, r2, #1
	mov ip, r2, lsl #1
	mov r2, r1, lsl #1
	ldrsh r1, [r3, ip]
	ldrsh r2, [r3, r2]
	bl sub_020CB108
_0209DC8C:
	add r0, r4, #8
	add r1, sp, #0
	mov r2, r0
	bl sub_020CB630
	add sp, sp, #0x28
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0209DCA8: .word 0x021094DC
	arm_func_end sub_0209DBD4

	arm_func_start sub_0209DCAC
sub_0209DCAC: ; 0x0209DCAC
	stmdb sp!, {r4, lr}
	ldr ip, [r0]
	ldr r4, [r1, #8]
	ldrsh lr, [r0, #0xc]
	ldr r3, [r1, #0x14]
	sub r4, ip, r4
	sub r3, r4, r3
	mul r3, lr, r3
	ldr r4, [r2]
	add r3, r4, r3, asr #12
	str r3, [r2]
	ldr lr, [r0, #4]
	ldr ip, [r1, #0xc]
	ldrsh r4, [r0, #0xc]
	ldr r3, [r1, #0x18]
	sub ip, lr, ip
	sub r3, ip, r3
	mul r3, r4, r3
	ldr r4, [r2, #4]
	add r3, r4, r3, asr #12
	str r3, [r2, #4]
	ldr ip, [r0, #8]
	ldr r3, [r1, #0x10]
	ldrsh lr, [r0, #0xc]
	ldr r0, [r1, #0x1c]
	sub r1, ip, r3
	sub r0, r1, r0
	mul r0, lr, r0
	ldr r1, [r2, #8]
	add r0, r1, r0, asr #12
	str r0, [r2, #8]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_0209DCAC

	arm_func_start sub_0209DD30
sub_0209DD30: ; 0x0209DD30
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r0
	ldrh r0, [r1, #0x26]
	ldrh r1, [r5, #6]
	mov r4, r2
	bl sub_020F2998
	cmp r1, #0
	addne sp, sp, #4
	ldmneia sp!, {r4, r5, lr}
	bxne lr
	ldr r2, _0209DDEC ; =0x021D43B8
	ldr r0, _0209DDF0 ; =0x5EEDF715
	ldr r3, [r2]
	ldr r1, _0209DDF4 ; =0x1B0CB173
	mla ip, r3, r0, r1
	str ip, [r2]
	ldrsh lr, [r5]
	mov r3, ip, lsr #0x17
	ldr ip, [r4]
	mul r3, lr, r3
	sub r3, r3, lr, lsl #8
	add r3, ip, r3, asr #8
	str r3, [r4]
	ldr r3, [r2]
	mla ip, r3, r0, r1
	str ip, [r2]
	ldrsh lr, [r5, #2]
	mov r3, ip, lsr #0x17
	ldr ip, [r4, #4]
	mul r3, lr, r3
	sub r3, r3, lr, lsl #8
	add r3, ip, r3, asr #8
	str r3, [r4, #4]
	ldr r3, [r2]
	mla r0, r3, r0, r1
	str r0, [r2]
	ldrsh r2, [r5, #4]
	mov r0, r0, lsr #0x17
	ldr r1, [r4, #8]
	mul r0, r2, r0
	sub r0, r0, r2, lsl #8
	add r0, r1, r0, asr #8
	str r0, [r4, #8]
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	.align 2, 0
_0209DDEC: .word 0x021D43B8
_0209DDF0: .word 0x5EEDF715
_0209DDF4: .word 0x1B0CB173
	arm_func_end sub_0209DD30

	arm_func_start sub_0209DDF8
sub_0209DDF8: ; 0x0209DDF8
	ldrsh r1, [r0]
	ldr r3, [r2]
	add r1, r3, r1
	str r1, [r2]
	ldrsh r1, [r0, #2]
	ldr r3, [r2, #4]
	add r1, r3, r1
	str r1, [r2, #4]
	ldrsh r0, [r0, #4]
	ldr r1, [r2, #8]
	add r0, r1, r0
	str r0, [r2, #8]
	bx lr
	arm_func_end sub_0209DDF8

	arm_func_start sub_0209DE2C
sub_0209DE2C: ; 0x0209DE2C
	ldr r3, [r1]
	cmp r3, #0
	bne _0209DE6C
	ldr r2, [r0]
	cmp r2, r1
	moveq r2, #0
	streq r2, [r0]
	streq r2, [r0, #8]
	beq _0209DE98
	ldr r2, [r1, #4]
	mov r3, #0
	str r3, [r2]
	ldr r2, [r0, #8]
	ldr r2, [r2, #4]
	str r2, [r0, #8]
	b _0209DE98
_0209DE6C:
	ldr r2, [r0]
	cmp r2, r1
	streq r3, [r0]
	ldreq r2, [r0]
	moveq r3, #0
	streq r3, [r2, #4]
	ldrne r2, [r1, #4]
	strne r2, [r3, #4]
	ldrne r3, [r1]
	ldrne r2, [r1, #4]
	strne r3, [r2]
_0209DE98:
	ldr r2, [r0, #4]
	sub r2, r2, #1
	str r2, [r0, #4]
	mov r0, r1
	bx lr
	arm_func_end sub_0209DE2C

	arm_func_start sub_0209DEAC
sub_0209DEAC: ; 0x0209DEAC
	ldr r2, [r0]
	mov r3, #0
	mov ip, r3
	cmp r2, #0
	beq _0209DEF0
	ldr r1, [r2]
	mov ip, r2
	str r1, [r0]
	ldr r1, [r0]
	cmp r1, #0
	ldrne r1, [r2]
	strne r3, [r1, #4]
	streq r3, [r0]
	streq r3, [r0, #8]
	ldr r1, [r0, #4]
	sub r1, r1, #1
	str r1, [r0, #4]
_0209DEF0:
	mov r0, ip
	bx lr
	arm_func_end sub_0209DEAC

	arm_func_start sub_0209DEF8
sub_0209DEF8: ; 0x0209DEF8
	ldr r2, [r0]
	cmp r2, #0
	bne _0209DF20
	str r1, [r0]
	str r1, [r0, #8]
	mov r2, #0
	str r2, [r1]
	ldr r2, [r1]
	str r2, [r1, #4]
	b _0209DF38
_0209DF20:
	str r2, [r1]
	mov r2, #0
	str r2, [r1, #4]
	ldr r2, [r0]
	str r1, [r2, #4]
	str r1, [r0]
_0209DF38:
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_0209DEF8

	arm_func_start sub_0209DF48
sub_0209DF48: ; 0x0209DF48
	stmdb sp!, {r4, lr}
	ldr ip, _0209DF98 ; =0x021D43B8
	ldr r2, _0209DF9C ; =0x5EEDF715
	ldr r4, [ip]
	ldr r3, _0209DFA0 ; =0x1B0CB173
	mov r1, r0
	mla lr, r4, r2, r3
	str lr, [ip]
	mov r4, lr, asr #8
	str r4, [r0]
	ldr r4, [ip]
	mov lr, #0
	mla r2, r4, r2, r3
	str r2, [ip]
	mov r2, r2, asr #8
	str r2, [r0, #4]
	str lr, [r0, #8]
	bl sub_020CCFE0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0209DF98: .word 0x021D43B8
_0209DF9C: .word 0x5EEDF715
_0209DFA0: .word 0x1B0CB173
	arm_func_end sub_0209DF48

	arm_func_start sub_0209DFA4
sub_0209DFA4: ; 0x0209DFA4
	stmdb sp!, {r4, lr}
	ldr ip, _0209E000 ; =0x021D43B8
	ldr r2, _0209E004 ; =0x5EEDF715
	ldr r4, [ip]
	ldr r3, _0209E008 ; =0x1B0CB173
	mov r1, r0
	mla lr, r4, r2, r3
	str lr, [ip]
	mov r4, lr, asr #8
	str r4, [r0]
	ldr lr, [ip]
	mla r4, lr, r2, r3
	str r4, [ip]
	mov lr, r4, asr #8
	str lr, [r0, #4]
	ldr lr, [ip]
	mla r2, lr, r2, r3
	str r2, [ip]
	mov r2, r2, asr #8
	str r2, [r0, #8]
	bl sub_020CCFE0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0209E000: .word 0x021D43B8
_0209E004: .word 0x5EEDF715
_0209E008: .word 0x1B0CB173
	arm_func_end sub_0209DFA4

	arm_func_start sub_0209E00C
sub_0209E00C: ; 0x0209E00C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_020D6548
	mov r0, #0xf
	mov r1, #1
	bl sub_020D66A0
	cmp r0, #0
	moveq r0, #2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r8, _0209E234 ; =0x021D43BC
	ldrh r0, [r8]
	cmp r0, #0
	bne _0209E06C
	mvn r4, #2
_0209E04C:
	bl sub_020D15C4
	cmp r0, r4
	moveq r0, #7
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	strh r0, [r8]
	ldrh r0, [r8]
	cmp r0, #0
	beq _0209E04C
_0209E06C:
	bl sub_020D3A38
	ldr r1, _0209E234 ; =0x021D43BC
	mov r4, r0
	ldr r2, [r1, #8]
	cmp r2, #0
	beq _0209E090
	bl sub_020D3A4C
	mov r0, #5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E090:
	ldrh r2, [r1, #2]
	cmp r2, #0
	beq _0209E0A8
	bl sub_020D3A4C
	mov r0, #5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E0A8:
	cmp r7, #4
	beq _0209E0C4
	cmp r7, #8
	beq _0209E104
	cmp r7, #0xc
	beq _0209E144
	b _0209E18C
_0209E0C4:
	ldrh r1, [r1]
	mov r0, #4
	bl sub_020D3D30
	cmp r0, #0
	bne _0209E0E8
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E0E8:
	ldr r0, _0209E234 ; =0x021D43BC
	mov r2, #4
	ldr r1, _0209E238 ; =0x04000242
	strh r2, [r0, #2]
	mov r0, #0x82
	strb r0, [r1]
	b _0209E198
_0209E104:
	ldrh r1, [r1]
	mov r0, #8
	bl sub_020D3D30
	cmp r0, #0
	bne _0209E128
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E128:
	ldr r0, _0209E234 ; =0x021D43BC
	mov r2, #8
	ldr r1, _0209E23C ; =0x04000243
	strh r2, [r0, #2]
	mov r0, #0x82
	strb r0, [r1]
	b _0209E198
_0209E144:
	ldrh r1, [r1]
	mov r0, #0xc
	bl sub_020D3D30
	cmp r0, #0
	bne _0209E168
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E168:
	ldr r0, _0209E234 ; =0x021D43BC
	mov r2, #0xc
	ldr r1, _0209E238 ; =0x04000242
	strh r2, [r0, #2]
	mov r0, #0x82
	strb r0, [r1]
	mov r0, #0x8a
	strb r0, [r1, #1]
	b _0209E198
_0209E18C:
	bl sub_020D3A4C
	mov r0, #3
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E198:
	mov r0, #0xf
	mov r1, #0
	bl sub_020D66A0
	cmp r0, #0
	bne _0209E1B8
	ldr r1, _0209E240 ; =sub_0209E328
	mov r0, #0xf
	bl sub_020D6654
_0209E1B8:
	cmp r6, #0
	ldrne r0, _0209E234 ; =0x021D43BC
	strne r6, [r0, #8]
	bne _0209E1D4
	ldr r1, _0209E244 ; =sub_0209E400
	ldr r0, _0209E234 ; =0x021D43BC
	str r1, [r0, #8]
_0209E1D4:
	ldr r3, _0209E234 ; =0x021D43BC
	mov r0, #0xf
	mov r1, #0x10000
	mov r2, #0
	str r5, [r3, #4]
	bl sub_020D66C4
	cmp r0, #0
	bge _0209E224
	ldr r1, _0209E234 ; =0x021D43BC
	ldrh r0, [r1, #2]
	ldrh r1, [r1]
	bl sub_020D3DF0
	ldr r1, _0209E234 ; =0x021D43BC
	mov r2, #0
	strh r2, [r1, #2]
	mov r0, r4
	str r2, [r1, #8]
	bl sub_020D3A4C
	mov r0, #4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E224:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0209E234: .word 0x021D43BC
_0209E238: .word 0x04000242
_0209E23C: .word 0x04000243
_0209E240: .word sub_0209E328
_0209E244: .word sub_0209E400
	arm_func_end sub_0209E00C

	arm_func_start sub_0209E248
sub_0209E248: ; 0x0209E248
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl sub_020D6548
	mov r0, #0xf
	mov r1, #1
	bl sub_020D66A0
	cmp r0, #0
	moveq r0, #2
	ldmeqia sp!, {r4, r5, r6, pc}
	bl sub_020D3A38
	ldr r1, _0209E31C ; =0x021D43BC
	mov r4, r0
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _0209E294
	bl sub_020D3A4C
	mov r0, #5
	ldmia sp!, {r4, r5, r6, pc}
_0209E294:
	mov r0, #0xf
	mov r1, #0
	bl sub_020D66A0
	cmp r0, #0
	bne _0209E2B4
	ldr r1, _0209E320 ; =sub_0209E328
	mov r0, #0xf
	bl sub_020D6654
_0209E2B4:
	cmp r6, #0
	ldrne r0, _0209E31C ; =0x021D43BC
	strne r6, [r0, #8]
	bne _0209E2D0
	ldr r1, _0209E324 ; =sub_0209E400
	ldr r0, _0209E31C ; =0x021D43BC
	str r1, [r0, #8]
_0209E2D0:
	ldr r3, _0209E31C ; =0x021D43BC
	mov r0, #0xf
	mov r1, #0x20000
	mov r2, #0
	str r5, [r3, #4]
	bl sub_020D66C4
	cmp r0, #0
	bge _0209E30C
	ldr r1, _0209E31C ; =0x021D43BC
	mov r2, #0
	mov r0, r4
	str r2, [r1, #8]
	bl sub_020D3A4C
	mov r0, #4
	ldmia sp!, {r4, r5, r6, pc}
_0209E30C:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0209E31C: .word 0x021D43BC
_0209E320: .word sub_0209E328
_0209E324: .word sub_0209E400
	arm_func_end sub_0209E248

	arm_func_start sub_0209E328
sub_0209E328: ; 0x0209E328
	stmdb sp!, {r4, r5, r6, lr}
	mov r0, #0x10000
	ldr r2, _0209E3FC ; =0x021D43BC
	rsb r0, r0, #0
	and r0, r1, r0
	cmp r0, #0x10000
	and r6, r1, #0xff
	ldr r4, [r2, #8]
	ldr r5, [r2, #4]
	beq _0209E35C
	cmp r0, #0x20000
	beq _0209E394
	b _0209E3D4
_0209E35C:
	cmp r6, #7
	bne _0209E3D4
	ldrh r0, [r2, #2]
	cmp r0, #0
	ldrneh r0, [r2]
	cmpne r0, #0
	beq _0209E3D4
	ldrh r0, [r2, #2]
	ldrh r1, [r2]
	bl sub_020D3DF0
	ldr r0, _0209E3FC ; =0x021D43BC
	mov r1, #0
	strh r1, [r0, #2]
	b _0209E3D4
_0209E394:
	cmp r6, #0
	bne _0209E3C8
	ldrh r0, [r2, #2]
	cmp r0, #0
	ldrneh r0, [r2]
	cmpne r0, #0
	beq _0209E3C8
	ldrh r0, [r2, #2]
	ldrh r1, [r2]
	bl sub_020D3DF0
	ldr r0, _0209E3FC ; =0x021D43BC
	mov r1, #0
	strh r1, [r0, #2]
_0209E3C8:
	mov r0, #0xf
	mov r1, #0
	bl sub_020D6654
_0209E3D4:
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r2, _0209E3FC ; =0x021D43BC
	mov r3, #0
	str r3, [r2, #8]
	mov r0, r5
	mov r1, r6
	str r3, [r2, #4]
	blx r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0209E3FC: .word 0x021D43BC
	arm_func_end sub_0209E328

	arm_func_start sub_0209E400
sub_0209E400: ; 0x0209E400
	bx lr
	arm_func_end sub_0209E400

	arm_func_start sub_0209E404
sub_0209E404: ; 0x0209E404
	stmdb sp!, {r3, lr}
	ldr r1, _0209E42C ; =0x021D43C8
	mov r2, r0
	ldr r0, [r1, #8]
	mov r1, #0x300
	bl sub_0209ED38
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0209E42C: .word 0x021D43C8
	arm_func_end sub_0209E404

	arm_func_start sub_0209E430
sub_0209E430: ; 0x0209E430
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0209E4F0 ; =0x021D43D4
	mov r1, r4
	mov r2, #6
	bl sub_020D4A50
	ldr r1, _0209E4F4 ; =0x000007FF
	ldr r3, [r4]
	sub r0, r1, #0x800
	ldr r2, [r4, #4]
	and r0, r3, r0
	str r0, [r4]
	and r1, r2, r1
	str r1, [r4, #4]
	ldr r0, _0209E4F8 ; =0x021D43D9
	add r1, r4, #8
	mov r2, #6
	bl sub_020D4A50
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	mov r1, r1, lsr #3
	orr r1, r1, r0, lsl #29
	str r1, [r4, #8]
	mov r3, r0, lsr #3
	str r3, [r4, #0xc]
	ldr r1, _0209E4F4 ; =0x000007FF
	ldr r2, [r4, #8]
	sub r0, r1, #0x800
	and r0, r2, r0
	str r0, [r4, #8]
	and r1, r1, r3
	str r1, [r4, #0xc]
	ldr r0, _0209E4FC ; =0x021D43DE
	add r1, r4, #0x10
	mov r2, #2
	bl sub_020D4A50
	ldrh r1, [r4, #0x10]
	ldr r3, _0209E500 ; =0x000003FF
	ldr r0, _0209E504 ; =0x021D43E0
	mov r1, r1, asr #6
	strh r1, [r4, #0x10]
	ldrh ip, [r4, #0x10]
	add r1, r4, #0x12
	mov r2, #2
	and r3, ip, r3
	strh r3, [r4, #0x10]
	bl sub_020D4A50
	ldmia sp!, {r4, pc}
	.align 2, 0
_0209E4F0: .word 0x021D43D4
_0209E4F4: .word 0x000007FF
_0209E4F8: .word 0x021D43D9
_0209E4FC: .word 0x021D43DE
_0209E500: .word 0x000003FF
_0209E504: .word 0x021D43E0
	arm_func_end sub_0209E430

	arm_func_start sub_0209E508
sub_0209E508: ; 0x0209E508
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _0209E5D8 ; =0x021D43C8
	mov sl, r1
	ldr sb, [r2, #8]
	bl sub_0209EF2C
	ldr r1, _0209E5DC ; =0x0000A001
	add r0, sl, #0x200
	bl sub_020E389C
	mov r5, #0x100
	ldr r6, _0209E5E0 ; =0x021D43D4
	mov r8, #0
	mov r4, r5
	mov fp, #0xe
	mov r7, r5
_0209E540:
	mov r0, sb
	mov r1, r7
	mov r2, sl
	bl sub_0209ED38
	cmp r0, #0
	bne _0209E564
	bl sub_020D3F48
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0209E564:
	mov r0, r6
	mov r2, fp
	add r1, sl, #0xf0
	bl sub_020D4A50
	mov r1, sl
	mov r2, #0xfe
	add r0, sl, #0x200
	bl sub_020E3A04
	strh r0, [sl, #0xfe]
_0209E588:
	mov r0, sb
	mov r1, r5
	mov r2, sl
	bl sub_0209EDC8
	mov r0, sl
	mov r1, sb
	mov r2, r4
	add r3, sl, #0x100
	bl sub_0209EE44
	cmp r0, #0
	beq _0209E588
	add r8, r8, #1
	cmp r8, #2
	add sb, sb, #0x100
	blt _0209E540
	bl sub_0209EE90
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0209E5D8: .word 0x021D43C8
_0209E5DC: .word 0x0000A001
_0209E5E0: .word 0x021D43D4
	arm_func_end sub_0209E508

	arm_func_start sub_0209E5E4
sub_0209E5E4: ; 0x0209E5E4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x20
	mov r1, r0
	mov r2, r4
	bl sub_0209ED38
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldrh r2, [r4]
	ldr r1, _0209E624 ; =0x021D43C8
	mov r0, #1
	mov r2, r2, lsl #3
	sub r2, r2, #0x400
	str r2, [r1, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0209E624: .word 0x021D43C8
	arm_func_end sub_0209E5E4

	arm_func_start sub_0209E628
sub_0209E628: ; 0x0209E628
	stmdb sp!, {r3, lr}
	ldr r1, _0209E650 ; =0x021D43C8
	mov r2, r0
	ldr r0, [r1, #8]
	mov r1, #0x400
	bl sub_0209ED38
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0209E650: .word 0x021D43C8
	arm_func_end sub_0209E628

	arm_func_start sub_0209E654
sub_0209E654: ; 0x0209E654
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r3, _0209E6D8 ; =0x021D43C8
	mov sl, #0x100
	ldr r5, [r3, #8]
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r4, #0
	mov sb, sl
_0209E678:
	ldr r0, [r7, r4, lsl #2]
	cmp r0, #0
	beq _0209E6B0
_0209E684:
	mov r0, r5
	mov r1, sl
	mov r2, r8
	bl sub_0209EDC8
	mov r0, r8
	mov r1, r5
	mov r2, sb
	mov r3, r6
	bl sub_0209EE44
	cmp r0, #0
	beq _0209E684
_0209E6B0:
	add r4, r4, #1
	cmp r4, #4
	add r8, r8, #0x100
	add r5, r5, #0x100
	blt _0209E678
	bl sub_0209EE90
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0209E6D8: .word 0x021D43C8
	arm_func_end sub_0209E654

	arm_func_start sub_0209E6DC
sub_0209E6DC: ; 0x0209E6DC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _0209E76C ; =0x021D43C8
	mov r8, r0
	mov sl, #0x100
	ldr r6, [r1, #8]
	mov r7, r8
	mov r5, #0
	mov sb, sl
	mov r4, #0xfe
_0209E700:
	mov r1, r7
	mov r2, r4
	add r0, r8, #0x500
	bl sub_020E3A04
	add r1, r8, r5, lsl #8
	strh r0, [r1, #0xfe]
_0209E718:
	mov r0, r6
	mov r1, sl
	mov r2, r7
	bl sub_0209EDC8
	mov r0, r7
	mov r1, r6
	mov r2, sb
	add r3, r8, #0x400
	bl sub_0209EE44
	cmp r0, #0
	beq _0209E718
	add r5, r5, #1
	cmp r5, #4
	add r7, r7, #0x100
	add r6, r6, #0x100
	blt _0209E700
	bl sub_0209EE90
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0209E76C: .word 0x021D43C8
	arm_func_end sub_0209E6DC

	arm_func_start sub_0209E770
sub_0209E770: ; 0x0209E770
	ldr ip, _0209E780 ; =sub_020D4A50
	ldr r1, _0209E784 ; =0x021D43D4
	mov r2, #0xe
	bx ip
	.align 2, 0
_0209E780: .word sub_020D4A50
_0209E784: .word 0x021D43D4
	arm_func_end sub_0209E770

	arm_func_start sub_0209E788
sub_0209E788: ; 0x0209E788
	stmdb sp!, {r4, lr}
	mov ip, #0
	mov r3, ip
	mov r2, ip
_0209E798:
	ldrb r4, [r0, ip]
	mov lr, r2
_0209E7A0:
	mov r1, r4, asr lr
	tst r1, #1
	add lr, lr, #1
	addne r3, r3, #1
	cmp lr, #8
	blt _0209E7A0
	add ip, ip, #1
	cmp ip, #4
	blt _0209E798
	and r0, r3, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end sub_0209E788

	arm_func_start sub_0209E7CC
sub_0209E7CC: ; 0x0209E7CC
	mvn r2, #0
	mov r3, #0
	eor r2, r2, r2, lsr r0
	mov ip, r3
_0209E7DC:
	rsb r0, ip, #0x18
	mov r0, r2, lsr r0
	strb r0, [r1, r3]
	add r3, r3, #1
	cmp r3, #4
	add ip, ip, #8
	blt _0209E7DC
	bx lr
	arm_func_end sub_0209E7CC

	arm_func_start sub_0209E7FC
sub_0209E7FC: ; 0x0209E7FC
	mov r2, #0
_0209E800:
	ldrb r1, [r0, r2]
	cmp r1, #0
	movne r0, #1
	bxne lr
	add r2, r2, #1
	cmp r2, #0x20
	blt _0209E800
	mov r0, #0
	bx lr
	arm_func_end sub_0209E7FC

	arm_func_start sub_0209E824
sub_0209E824: ; 0x0209E824
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	bl sub_0209E8A0
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r1, sp, #4
	mov r0, r5
	mov r2, #4
	bl sub_020D4A50
	add r1, sp, #0
	mov r0, r4
	mov r2, #4
	bl sub_020D4A50
	ldr r3, [sp]
	ldr r2, [sp, #4]
	mvn r0, #1
	orr r1, r2, r3
	cmp r1, r0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mvn r0, r3
	tst r2, r0
	movne r0, #1
	moveq r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0209E824

	arm_func_start sub_0209E8A0
sub_0209E8A0: ; 0x0209E8A0
	ldrb r0, [r0]
	cmp r0, #0x7f
	moveq r0, #0
	bxeq lr
	cmp r0, #1
	movlo r0, #0
	bxlo lr
	cmp r0, #0xdf
	movls r0, #1
	movhi r0, #0
	bx lr
	arm_func_end sub_0209E8A0

	arm_func_start sub_0209E8CC
sub_0209E8CC: ; 0x0209E8CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x3c
	ldr sl, _0209ED20 ; =0x021D4400
	mov r8, r1, lsr #0x10
	mov r4, sl, lsl #8
	mov sb, r4
	and r4, r4, #0xff00
	mov r1, r1, lsl #0x10
	orr r4, r4, #0x20000
	mov r5, r3, lsr #0x10
	mov r7, r0
	ldr ip, _0209ED24 ; =0x01020000
	mov r1, r1, lsr #0x10
	str r4, [sp, #0x30]
	orr r4, r1, #0x10000
	mov r3, r3, lsl #0x10
	add r1, ip, #0x30000
	orr r1, r1, r3, lsr #16
	str r1, [sp, #0x10]
	mov r1, r3, lsr #0x10
	orr r1, r1, #0x1040000
	ldr r0, _0209ED28 ; =0x02002200
	str r1, [sp, #0x24]
	orr r1, r0, sl, lsr #24
	str r1, [sp, #0x28]
	ldr r1, [sp, #0x30]
	mov sb, sb, lsr #0x10
	orr r1, r1, #0x1000000
	str r1, [sp, #0x30]
	add r1, r0, #0x300
	and r8, r8, #0xff
	add r0, r0, #0x100
	orr r0, r8, r0
	orr r1, r8, r1
	str r0, [sp]
	orr r0, r2, #0x20000
	str r0, [sp, #0x1c]
	orr r0, r5, #0x30000
	str r0, [sp, #0x20]
	orr r0, r5, #0x40000
	str r0, [sp, #0xc]
	ldr r0, _0209ED2C ; =0x03002100
	mov r6, #0
	sub r0, r0, #0x100
	str r0, [sp, #0x14]
	mov r0, r2, lsr #0x10
	orr r0, r0, #0x20000
	str r0, [sp, #4]
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	orr sb, sb, #0x10000
	orr r0, r0, #0x30000
	str sb, [sp, #0x2c]
	str r1, [sp, #0x18]
	str r0, [sp, #8]
	mov r5, r6
	mov r8, #0xfa0
_0209E9B0:
	cmp r6, #0
	bne _0209EBF0
	ldr r0, _0209ED30 ; =0x021D43C8
	cmp r7, #7
	str r5, [r0, #4]
	addls pc, pc, r7, lsl #2
	b _0209E9B0
_0209E9CC: ; jump table
	b _0209E9B0 ; case 0
	b _0209E9EC ; case 1
	b _0209EA98 ; case 2
	b _0209EAB8 ; case 3
	b _0209EB54 ; case 4
	b _0209EB54 ; case 5
	b _0209EBAC ; case 6
	b _0209EBD0 ; case 7
_0209E9EC:
	ldr r1, [sp]
	mov r0, #4
	mov r2, r5
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	blt _0209E9B0
	mov r0, #4
	mov r1, r4
	mov r2, #0
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	blt _0209E9B0
	ldr r1, [sp, #4]
	mov r0, #4
	mov r2, #0
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	blt _0209E9B0
	ldr r1, [sp, #8]
	mov r0, #4
	mov r2, #0
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	blt _0209E9B0
	ldr r1, [sp, #0xc]
	mov r0, #4
	mov r2, #0
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	blt _0209E9B0
	ldr r1, [sp, #0x10]
	mov r0, #4
	mov r2, #0
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	movge r6, #1
	b _0209E9B0
_0209EA98:
	ldr r1, [sp, #0x14]
	mov r0, #4
	mov r2, r5
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	movge r6, #1
	b _0209E9B0
_0209EAB8:
	ldr r1, [sp, #0x18]
	mov r0, #4
	mov r2, r5
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	blt _0209EB44
	mov r0, #4
	mov r1, r4
	mov r2, #0
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	blt _0209EB44
	ldr r1, [sp, #0x1c]
	mov r0, #4
	mov r2, #0
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	blt _0209EB44
	ldr r1, [sp, #0x20]
	mov r0, #4
	mov r2, #0
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	blt _0209EB44
	ldr r1, [sp, #0x24]
	mov r0, #4
	mov r2, #0
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	movge r6, #1
_0209EB44:
	bl sub_020D34B0
	str r0, [sp, #0x34]
	mov fp, r1
	b _0209E9B0
_0209EB54:
	ldr r1, [sp, #0x28]
	mov r0, #4
	mov r2, r5
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	blt _0209E9B0
	ldr r1, [sp, #0x2c]
	mov r0, #4
	mov r2, #0
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	blt _0209E9B0
	ldr r1, [sp, #0x30]
	mov r0, #4
	mov r2, #0
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	movge r6, #1
	b _0209E9B0
_0209EBAC:
	ldr r1, _0209ED2C ; =0x03002100
	mov r0, #4
	add r1, r1, #0xc00
	mov r2, r5
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	movge r6, #1
	b _0209E9B0
_0209EBD0:
	ldr r1, _0209ED2C ; =0x03002100
	mov r0, #4
	mov r2, r5
	bl sub_020D66C4
	cmp r0, #0
	movlt r6, #0
	movge r6, #1
	b _0209E9B0
_0209EBF0:
	ldr r0, _0209ED30 ; =0x021D43C8
	ldr r0, [r0, #4]
	cmp r0, #1
	bne _0209E9B0
	ldr r0, _0209ED30 ; =0x021D43C8
	mov r6, #0
	ldrh r0, [r0]
	cmp r0, #0
	bne _0209ED14
	cmp r7, #7
	addls pc, pc, r7, lsl #2
	b _0209E9B0
_0209EC20: ; jump table
	b _0209E9B0 ; case 0
	b _0209EC40 ; case 1
	b _0209EC4C ; case 2
	b _0209EC54 ; case 3
	b _0209EC5C ; case 4
	b _0209EC5C ; case 5
	b _0209ECFC ; case 6
	b _0209ED08 ; case 7
_0209EC40:
	add sp, sp, #0x3c
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0209EC4C:
	mov r7, #4
	b _0209E9B0
_0209EC54:
	mov r7, #5
	b _0209E9B0
_0209EC5C:
	mov r0, sl
	mov r1, #1
	bl sub_020D285C
	cmp r7, #4
	ldrb r0, [sl]
	bne _0209EC8C
	tst r0, #2
	movne r7, #3
	bne _0209E9B0
	add sp, sp, #0x3c
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0209EC8C:
	tst r0, #1
	addeq sp, sp, #0x3c
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	tst r0, #0x20
	bne _0209ECE8
	bl sub_020D34B0
	ldr r2, [sp, #0x34]
	mov ip, r6
	subs sb, r0, r2
	mov r0, #0x40
	sbc lr, r1, fp
	umull r0, r1, sb, r0
	mla r1, sb, ip, r1
	mov sb, #0x40
	mla r1, lr, sb, r1
	ldr r2, _0209ED34 ; =0x000082EA
	mov r3, r6
	bl _ll_udiv
	mov r2, r6
	cmp r1, r2
	cmpeq r0, r8
	bls _0209ECF0
_0209ECE8:
	mov r7, #6
	b _0209E9B0
_0209ECF0:
	mov r0, #0x4000
	bl SVC_WaitByLoop
	b _0209E9B0
_0209ECFC:
	add sp, sp, #0x3c
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0209ED08:
	add sp, sp, #0x3c
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0209ED14:
	mov r0, r6
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0209ED20: .word 0x021D4400
_0209ED24: .word 0x01020000
_0209ED28: .word 0x02002200
_0209ED2C: .word 0x03002100
_0209ED30: .word 0x021D43C8
_0209ED34: .word 0x000082EA
	arm_func_end sub_0209E8CC

	arm_func_start sub_0209ED38
sub_0209ED38: ; 0x0209ED38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r2
	mov r6, r0
	mov r0, r4
	mov r5, r1
	bl sub_020D285C
	mov r8, #4
	mov r7, #1
_0209ED58:
	mov r0, r8
	mov r1, r7
	bl sub_020D66A0
	cmp r0, #0
	beq _0209ED58
	ldr r1, _0209EDC4 ; =sub_0209EEFC
	mov r0, #4
	bl sub_020D6654
	mov r0, r5, lsl #0x10
	mov r8, r0, lsr #0x10
	mov r7, #0x40000
	mov sb, #1
_0209ED88:
	mov r0, sb
	mov r1, r6
	mov r2, r8
	mov r3, r4
	bl sub_0209E8CC
	cmp r0, #1
	beq _0209EDB0
	mov r0, r7
	bl SVC_WaitByLoop
	b _0209ED88
_0209EDB0:
	mov r0, r4
	mov r1, r5
	bl sub_020D285C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0209EDC4: .word sub_0209EEFC
	arm_func_end sub_0209ED38

	arm_func_start sub_0209EDC8
sub_0209EDC8: ; 0x0209EDC8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #4
	mov r4, #1
_0209EDE0:
	mov r0, r5
	mov r1, r4
	bl sub_020D66A0
	cmp r0, #0
	beq _0209EDE0
	ldr r1, _0209EE40 ; =sub_0209EEFC
	mov r0, #4
	bl sub_020D6654
	mov r0, r6
	mov r1, r7
	bl sub_020D2878
	mov r4, #0x40000
	mov r5, #2
_0209EE14:
	mov r0, r5
	mov r1, r8
	mov r2, r7
	mov r3, r6
	bl sub_0209E8CC
	cmp r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	bl SVC_WaitByLoop
	b _0209EE14
	arm_func_end sub_0209EDC8

	arm_func_start sub_0209EE3C
sub_0209EE3C: ; 0x0209EE3C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0209EE40: .word sub_0209EEFC
	arm_func_end sub_0209EE3C

	arm_func_start sub_0209EE44
sub_0209EE44: ; 0x0209EE44
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r2
	mov r4, r3
	mov r6, r0
	mov r0, r1
	mov r1, r5
	mov r2, r4
	bl sub_0209ED38
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0209EE44

	arm_func_start sub_0209EE90
sub_0209EE90: ; 0x0209EE90
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, #4
	mov r4, #1
_0209EE9C:
	mov r0, r5
	mov r1, r4
	bl sub_020D66A0
	cmp r0, #0
	beq _0209EE9C
	ldr r1, _0209EEF8 ; =sub_0209EEFC
	mov r0, #4
	bl sub_020D6654
	mov r4, #0x40000
	mov r6, #7
	mov r5, #0
_0209EEC8:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	mov r3, r5
	bl sub_0209E8CC
	cmp r0, #1
	beq _0209EEF0
	mov r0, r4
	bl SVC_WaitByLoop
	b _0209EEC8
_0209EEF0:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0209EEF8: .word sub_0209EEFC
	arm_func_end sub_0209EE90

	arm_func_start sub_0209EEFC
sub_0209EEFC: ; 0x0209EEFC
	ldr r0, _0209EF28 ; =0x021D43C8
	and r1, r1, #0xff
	strh r1, [r0]
	mov r1, #1
	str r1, [r0, #4]
	cmp r2, #0
	movne r1, #0xff
	strneh r1, [r0]
	ldr r0, _0209EF28 ; =0x021D43C8
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0209EF28: .word 0x021D43C8
	arm_func_end sub_0209EEFC

	arm_func_start sub_0209EF2C
sub_0209EF2C: ; 0x0209EF2C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	ldr r3, [r4, #8]
	ldr r2, [r4, #0xc]
	ldr r1, _0209EFE0 ; =0x021D43D4
	str r2, [sp, #4]
	str r3, [sp]
	mov r2, #5
	bl sub_020D4A50
	ldr r2, [sp]
	ldr r1, [sp, #4]
	mov ip, r2, lsr #5
	ldr lr, [r4, #4]
	mov r3, r1, lsr #5
	orr ip, ip, r1, lsl #27
	mov r0, #7
	and r1, r0, lr, lsr #8
	and r0, r2, #0x1f
	orr lr, r1, r0, lsl #3
	ldr r2, _0209EFE0 ; =0x021D43D4
	ldr r1, _0209EFE4 ; =0x021D43DA
	strb lr, [r2, #5]
	add r0, sp, #0
	str ip, [sp]
	str r3, [sp, #4]
	mov r2, #4
	bl sub_020D4A50
	ldrh r0, [r4, #0x10]
	ldr r1, [sp, #4]
	ldr r3, _0209EFE0 ; =0x021D43D4
	and r1, r1, #0x3f
	mov r0, r0, lsl #0x1e
	orr r0, r1, r0, lsr #24
	strb r0, [r3, #0xa]
	ldrh r2, [r4, #0x10]
	add r0, r4, #0x12
	ldr r1, _0209EFE8 ; =0x021D43E0
	mov r4, r2, asr #2
	mov r2, #2
	strb r4, [r3, #0xb]
	bl sub_020D4A50
	ldr r0, _0209EFE0 ; =0x021D43D4
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0209EFE0: .word 0x021D43D4
_0209EFE4: .word 0x021D43DA
_0209EFE8: .word 0x021D43E0
	arm_func_end sub_0209EF2C

	arm_func_start sub_0209EFEC
sub_0209EFEC: ; 0x0209EFEC
	ldr r0, _0209EFF4 ; =0x021D43D4
	bx lr
	.align 2, 0
_0209EFF4: .word 0x021D43D4
	arm_func_end sub_0209EFEC

	arm_func_start sub_0209EFF8
sub_0209EFF8: ; 0x0209EFF8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov r8, r0
	mov r1, #0
	mov r2, #0x700
	bl sub_020D4994
	mov r0, r8
	bl sub_0209E5E4
	cmp r0, #0
	addeq sp, sp, #0x10
	ldreq r0, _0209F2EC ; =0xFFFFD8EF
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, _0209F2F0 ; =0x0000A001
	add r0, r8, #0x500
	bl sub_020E389C
	mov r0, r8
	bl sub_0209E628
	cmp r0, #0
	addeq sp, sp, #0x10
	ldreq r0, _0209F2EC ; =0xFFFFD8EF
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x10
	bl sub_020D4994
	mov r6, r8
	mov r7, r8
	mov r5, #0
	mov sl, #1
	add sb, sp, #0
	mov r4, #0xfe
_0209F074:
	mov r1, r6
	mov r2, r4
	add r0, r8, #0x500
	bl sub_020E3A04
	add r1, r8, r5, lsl #8
	ldrh r1, [r1, #0xfe]
	cmp r0, r1
	bne _0209F0A4
	mov r0, r7
	bl sub_0209F300
	cmp r0, #0
	strne sl, [sb, r5, lsl #2]
_0209F0A4:
	add r5, r5, #1
	cmp r5, #3
	add r6, r6, #0x100
	add r7, r7, #0x100
	blt _0209F074
	add r0, r8, #0x500
	add r1, r8, #0x300
	mov r2, #0xfe
	bl sub_020E3A04
	add r1, r8, #0x300
	ldrh r1, [r1, #0xfe]
	cmp r0, r1
	moveq r0, #1
	ldr r1, [sp]
	streq r0, [sp, #0xc]
	cmp r1, #0
	ldrne r0, [sp, #4]
	cmpne r0, #0
	ldrne r0, [sp, #8]
	cmpne r0, #0
	ldrne r0, [sp, #0xc]
	cmpne r0, #0
	beq _0209F114
	add r0, r8, #0xf0
	bl sub_0209E770
	add sp, sp, #0x10
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0209F114:
	cmp r1, #0
	ldreq r0, [sp, #4]
	cmpeq r0, #0
	ldreq r0, [sp, #8]
	cmpeq r0, #0
	ldreq r0, [sp, #0xc]
	cmpeq r0, #0
	bne _0209F158
	mov r0, r8
	bl sub_0209F400
	mov r0, r8
	bl sub_0209E6DC
	cmp r0, #0
	movne r0, #0
	add sp, sp, #0x10
	ldreq r0, _0209F2F4 ; =0xFFFFD8F0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0209F158:
	cmp r1, #0
	ldrne r0, [sp, #4]
	cmpne r0, #0
	bne _0209F1A0
	ldr r0, [sp, #8]
	cmp r0, #0
	ldrne r0, [sp, #0xc]
	cmpne r0, #0
	bne _0209F1A0
	mov r0, r8
	bl sub_0209F400
	mov r0, r8
	bl sub_0209E6DC
	cmp r0, #0
	movne r0, #0
	add sp, sp, #0x10
	ldreq r0, _0209F2F4 ; =0xFFFFD8F0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0209F1A0:
	cmp r1, #0
	ldreq r0, [sp, #4]
	cmpeq r0, #0
	bne _0209F1D4
	mov r0, r8
	bl sub_0209F400
	mov r0, r8
	bl sub_0209E6DC
	cmp r0, #0
	ldrne r0, _0209F2F8 ; =0xFFFFD8ED
	add sp, sp, #0x10
	ldreq r0, _0209F2F4 ; =0xFFFFD8F0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0209F1D4:
	cmp r1, #0
	bne _0209F204
	mov r0, r8
	mov r1, #0
	bl sub_0209F480
	add r0, r8, #0x1f0
	add r1, r8, #0xf0
	mov r2, #0xe
	bl sub_020D4A50
	ldrb r0, [r8, #0x1ef]
	strb r0, [r8, #0xef]
	b _0209F234
_0209F204:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0209F234
	mov r0, r8
	mov r1, #1
	bl sub_0209F480
	add r0, r8, #0xf0
	add r1, r8, #0x1f0
	mov r2, #0xe
	bl sub_020D4A50
	ldrb r0, [r8, #0xef]
	strb r0, [r8, #0x1ef]
_0209F234:
	add r0, r8, #0xf0
	bl sub_0209E770
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0209F254
	mov r0, r8
	mov r1, #2
	bl sub_0209F480
_0209F254:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0209F270
	add r1, r8, #0x300
	mov r0, #0
	mov r2, #0x100
	bl sub_020D4790
_0209F270:
	mov r4, #0
	mov r5, r4
	mov r2, #1
	add r3, sp, #0
_0209F280:
	ldr r0, [r3, r5, lsl #2]
	cmp r0, #0
	bne _0209F2B4
	ldrb r0, [r8, #0xef]
	tst r0, r2, lsl r5
	beq _0209F2B4
	mov r1, r0
	mvn r0, r2, lsl r5
	and r0, r1, r0
	strb r0, [r8, #0xef]
	and r0, r0, #0xff
	mov r4, r2
	strb r0, [r8, #0x1ef]
_0209F2B4:
	add r5, r5, #1
	cmp r5, #3
	blt _0209F280
	mov r0, r8
	bl sub_0209E6DC
	cmp r0, #0
	addeq sp, sp, #0x10
	ldreq r0, _0209F2F4 ; =0xFFFFD8F0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r4, #0
	ldrne r0, _0209F2FC ; =0xFFFFD8EE
	moveq r0, #0
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0209F2EC: .word 0xFFFFD8EF
_0209F2F0: .word 0x0000A001
_0209F2F4: .word 0xFFFFD8F0
_0209F2F8: .word 0xFFFFD8ED
_0209F2FC: .word 0xFFFFD8EE
	arm_func_end sub_0209EFF8

	arm_func_start sub_0209F300
sub_0209F300: ; 0x0209F300
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldrb r0, [r4, #0xe7]
	cmp r0, #0xff
	addeq sp, sp, #4
	moveq r0, #1
	ldmeqia sp!, {r3, r4, pc}
	cmp r0, #2
	addhi sp, sp, #4
	movhi r0, #0
	ldmhiia sp!, {r3, r4, pc}
	add r0, r4, #0x40
	bl sub_0209E7FC
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	ldr r1, _0209F3FC ; =0x02108F9C
	add r0, r4, #0xc0
	mov r2, #4
	bl memcmp
	cmp r0, #0
	beq _0209F3B0
	add r0, r4, #0xc4
	bl sub_0209E8A0
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	ldrb r0, [r4, #0xd0]
	cmp r0, #0x20
	addhi sp, sp, #4
	movhi r0, #0
	ldmhiia sp!, {r3, r4, pc}
	add r1, sp, #0
	bl sub_0209E7CC
	add r1, sp, #0
	add r0, r4, #0xc0
	bl sub_0209E824
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
_0209F3B0:
	ldr r1, _0209F3FC ; =0x02108F9C
	add r0, r4, #0xc8
	mov r2, #4
	bl memcmp
	cmp r0, #0
	beq _0209F3F0
	add r0, r4, #0xc8
	bl sub_0209E8A0
	cmp r0, #0
	bne _0209F3F0
	add r0, r4, #0xcc
	bl sub_0209E8A0
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
_0209F3F0:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0209F3FC: .word 0x02108F9C
	arm_func_end sub_0209F300

	arm_func_start sub_0209F400
sub_0209F400: ; 0x0209F400
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov r1, r7
	mov r0, #0
	mov r2, #0x400
	bl sub_020D4790
	mov r2, #0
	mov r1, #0xff
_0209F424:
	add r0, r7, r2, lsl #8
	add r2, r2, #1
	strb r1, [r0, #0xe7]
	cmp r2, #3
	blt _0209F424
	add r0, sp, #0
	bl sub_0209F630
	add r0, sp, #0
	bl sub_0209EF2C
	mov r5, r0
	mov r6, #0
	mov r4, #0xe
_0209F454:
	mov r0, r5
	mov r2, r4
	add r1, r7, #0xf0
	bl sub_020D4A50
	add r6, r6, #1
	cmp r6, #2
	add r7, r7, #0x100
	blt _0209F454
	mov r0, #0
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end sub_0209F400

	arm_func_start sub_0209F480
sub_0209F480: ; 0x0209F480
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	add r1, r5, r4, lsl #8
	mov r0, #0
	mov r2, #0x100
	bl sub_020D4790
	add r0, r5, r4, lsl #8
	mov r1, #0xff
	strb r1, [r0, #0xe7]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0209F480

	arm_func_start sub_0209F4AC
sub_0209F4AC: ; 0x0209F4AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r4, _0209F624 ; =0x0000FFFF
	mov lr, #0
	and ip, lr, #0
	add r5, r4, #0xff0000
	and r2, r2, #1
	mov r6, ip, lsl #2
	and r3, r3, #3
	and r5, r1, r5
	orr r1, r3, r2, lsl #2
	orr r6, r6, r2, lsr #30
	mov r7, ip, lsl #3
	and r2, r0, r4
	orr r0, r1, r5, lsl #3
	orr r1, r0, r2, lsl #27
	mov r3, ip, lsl #0x1b
	orr r3, r3, r2, lsr #5
	orr r7, r7, r5, lsr #29
	orr r0, ip, r6
	orr r0, r7, r0
	orr r0, r3, r0
	add r2, sp, #8
	str r1, [sp, #8]
	str r0, [sp, #0xc]
_0209F510:
	ldrb r0, [r2]
	add lr, lr, #1
	cmp lr, #6
	eor r0, r0, #0xd6
	strb r0, [r2], #1
	blt _0209F510
	ldr r2, _0209F628 ; =0x02108FA8
	add r4, sp, #8
	mov r5, #0
_0209F534:
	ldrb r3, [r4]
	add r5, r5, #1
	cmp r5, #5
	mov r0, r3, asr #4
	and r1, r0, #0xf
	and r0, r3, #0xf
	ldrb r1, [r2, r1]
	ldrb r0, [r2, r0]
	orr r0, r0, r1, lsl #4
	strb r0, [r4], #1
	blt _0209F534
	add r0, sp, #8
	add r1, sp, #0
	mov r2, #8
	bl sub_020D4A50
	ldr r4, _0209F62C ; =0x02108FA0
	add r3, sp, #0
	mov r5, #0
	add r0, sp, #8
_0209F580:
	ldrb r2, [r3], #1
	ldrb r1, [r4], #1
	add r5, r5, #1
	cmp r5, #5
	strb r2, [r0, r1]
	blt _0209F580
	ldrb r2, [sp, #0xd]
	mov r1, #0
	ldr r3, [sp, #8]
	and r2, r2, #7
	strb r1, [sp, #0xf]
	strb r1, [sp, #0xe]
	strb r2, [sp, #0xd]
	ldr r2, [sp, #0xc]
	mov r4, r3, lsl #1
	mov r2, r2, lsl #1
	orr r2, r2, r3, lsr #31
	str r2, [sp, #0xc]
	ldrb r2, [sp, #0xd]
	str r4, [sp, #8]
	ldrb r3, [sp, #8]
	mov r2, r2, asr #3
	and r2, r2, #1
	orr r2, r3, r2
	strb r2, [sp, #8]
_0209F5E4:
	ldrb r2, [r0]
	add r1, r1, #1
	cmp r1, #6
	eor r2, r2, #0x67
	strb r2, [r0], #1
	blt _0209F5E4
	ldrb r0, [sp, #0xd]
	mov r1, #0
	strb r1, [sp, #0xf]
	and r0, r0, #7
	strb r1, [sp, #0xe]
	strb r0, [sp, #0xd]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0209F624: .word 0x0000FFFF
_0209F628: .word 0x02108FA8
_0209F62C: .word 0x02108FA0
	arm_func_end sub_0209F4AC

	arm_func_start sub_0209F630
sub_0209F630: ; 0x0209F630
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov sl, r0
	bl sub_0209E430
	bl sub_020DB9C0
	add r0, sp, #0x14
	bl sub_020DBA9C
	cmp r0, #0
	addne sp, sp, #0x24
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, sp, #8
	bl sub_020DBB48
	cmp r0, #0
	addne sp, sp, #0x24
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, sp, #0x14
	add r1, sp, #8
	bl sub_020DC330
	mov r4, r0
	mov r0, #0
	subs r2, r4, r0
	sbcs r2, r1, r0
	addlt sp, sp, #0x24
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl sub_020D3438
	cmp r0, #0
	beq _0209F6AC
	ldr r0, _0209F7FC ; =sub_020D34B0
	adds r4, r4, r0
_0209F6AC:
	add r0, sp, #0
	bl sub_020D3C40
	ldrb r0, [sp, #1]
	ldr r5, _0209F800 ; =0x5D588B65
	ldr r6, _0209F804 ; =0x00269EC3
	ldrb r1, [sp]
	mla sb, r4, r5, r6
	mov r0, r0, lsl #8
	orr r1, r0, r1, lsl #16
	ldrb r2, [sp, #2]
	ldr r0, _0209F808 ; =0x000009BF
	ldrb r7, [sp, #4]
	orr r1, r2, r1
	cmp r1, r0
	mov r2, sb, lsr #0x10
	mov r0, #0x3e8
	mul r3, r2, r0
	mov r2, r3, lsr #0x10
	movne r1, #1
	ldrb r0, [sp, #5]
	ldrb r4, [sp, #3]
	mov r3, r7, lsl #8
	moveq r1, #0
	orr r4, r3, r4, lsl #16
	strh r2, [sl, #0x10]
	mov r3, #0
	str r3, [sl]
	str r3, [sl, #4]
	ldrh r2, [sl, #0x12]
	and r7, r1, #0xff
	orr r8, r0, r4
	str r3, [sl, #8]
	cmp r2, #0
	str r3, [sl, #0xc]
	bne _0209F79C
	ldr r0, [sl, #8]
	cmp r3, r3
	cmpeq r0, r3
	bne _0209F7F0
	mov fp, r3
	mov r4, r3
_0209F750:
	mul r0, sb, r5
	adds sb, r0, r6
	bne _0209F768
_0209F75C:
	mul r0, sb, r5
	adds sb, r0, r6
	beq _0209F75C
_0209F768:
	strh sb, [sl, #0x12]
	ldrh r0, [sl, #0x12]
	mov r1, r8
	mov r2, r7
	mov r3, #0
	bl sub_0209F4AC
	str r0, [sl, #8]
	str r1, [sl, #0xc]
	ldr r0, [sl, #8]
	cmp r1, fp
	cmpeq r0, r4
	beq _0209F750
	b _0209F7F0
_0209F79C:
	ldr r0, [sl, #8]
	cmp r3, r3
	cmpeq r0, r3
	bne _0209F7F0
	mov r6, r3
	mov r5, r3
	mov r4, r3
_0209F7B8:
	ldrh r0, [sl, #0x12]
	mov r1, r8
	mov r2, r7
	add r0, r0, #1
	strh r0, [sl, #0x12]
	ldrh r0, [sl, #0x12]
	mov r3, r6
	bl sub_0209F4AC
	str r0, [sl, #8]
	str r1, [sl, #0xc]
	ldr r0, [sl, #8]
	cmp r1, r5
	cmpeq r0, r4
	beq _0209F7B8
_0209F7F0:
	mov r0, #1
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0209F7FC: .word sub_020D34B0
_0209F800: .word 0x5D588B65
_0209F804: .word 0x00269EC3
_0209F808: .word 0x000009BF
	arm_func_end sub_0209F630

	arm_func_start sub_0209F80C
sub_0209F80C: ; 0x0209F80C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	add r0, sp, #0
	bl sub_0209F630
	cmp r0, #0
	addeq sp, sp, #0x14
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	add r0, sp, #0
	mov r1, r4
	bl sub_0209E508
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0209F80C

	arm_func_start sub_0209F850
sub_0209F850: ; 0x0209F850
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	add r0, sp, #0
	mov r4, r1
	bl sub_0209E430
	add ip, r5, #8
	ldmia ip, {r2, r3}
	stmia r5, {r2, r3}
	add r1, sp, #8
	ldmia r1, {r2, r3}
	mov r0, r5
	mov r1, r4
	stmia ip, {r2, r3}
	bl sub_0209E508
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	arm_func_end sub_0209F850

	arm_func_start sub_0209F8A0
sub_0209F8A0: ; 0x0209F8A0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	add r2, sp, #0
	mov r1, #0
	mov sl, r0
	strb r1, [r2]
	strb r1, [r2, #1]
	strb r1, [r2, #2]
	strb r1, [r2, #3]
	strb r1, [r2, #4]
	strb r1, [r2, #5]
	bl sub_0209E430
	bl sub_020DB9C0
	add r0, sp, #0x14
	bl sub_020DBA9C
	cmp r0, #0
	addne sp, sp, #0x24
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, sp, #8
	bl sub_020DBB48
	cmp r0, #0
	addne sp, sp, #0x24
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, sp, #0x14
	add r1, sp, #8
	bl sub_020DC330
	mov r4, r0
	mov r0, #0
	subs r2, r4, r0
	sbcs r2, r1, r0
	addlt sp, sp, #0x24
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl sub_020D3438
	cmp r0, #0
	beq _0209F93C
	ldr r0, _0209FA30 ; =sub_020D34B0
	adds r4, r4, r0
_0209F93C:
	add r0, sp, #0
	bl sub_020D3C40
	ldrb r0, [sp, #1]
	ldr r5, _0209FA34 ; =0x5D588B65
	ldr r6, _0209FA38 ; =0x00269EC3
	ldrb r1, [sp]
	mov r0, r0, lsl #8
	mla sb, r4, r5, r6
	orr r1, r0, r1, lsl #16
	ldrb r2, [sp, #2]
	ldr r0, _0209FA3C ; =0x000009BF
	ldrb r7, [sp, #4]
	orr r1, r2, r1
	cmp r1, r0
	movne r1, #1
	mov r2, sb, lsr #0x10
	mov r0, #0x3e8
	mul r4, r2, r0
	mov r2, r4, lsr #0x10
	ldrb r0, [sp, #5]
	ldrb r8, [sp, #3]
	mov r4, r7, lsl #8
	moveq r1, #0
	mov r3, #0
	strh r2, [sl, #0x10]
	str r3, [sl, #8]
	str r3, [sl, #0xc]
	orr r4, r4, r8, lsl #16
	ldr r2, [sl, #8]
	cmp r3, #0
	cmpeq r2, #0
	and r7, r1, #0xff
	orr r8, r0, r4
	bne _0209FA24
	mov fp, r3
	mov r4, r3
_0209F9CC:
	mla sb, r5, sb, r6
	b _0209F9D8
_0209F9D4:
	mla sb, r5, sb, r6
_0209F9D8:
	cmp sb, #0
	beq _0209F9D4
	ldrh r2, [sl, #0x12]
	mov r0, sb, lsl #0x10
	mov r1, r0, lsr #0x10
	cmp r2, r0, lsr #16
	beq _0209F9D4
	strh r1, [sl, #0x12]
	ldrh r0, [sl, #0x12]
	mov r1, r8
	mov r2, r7
	mov r3, #0
	bl sub_0209F4AC
	str r0, [sl, #8]
	str r1, [sl, #0xc]
	ldr r0, [sl, #8]
	cmp r1, fp
	cmpeq r0, r4
	beq _0209F9CC
_0209FA24:
	mov r0, #1
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0209FA30: .word sub_020D34B0
_0209FA34: .word 0x5D588B65
_0209FA38: .word 0x00269EC3
_0209FA3C: .word 0x000009BF
	arm_func_end sub_0209F8A0

	arm_func_start sub_0209FA40
sub_0209FA40: ; 0x0209FA40
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	add r0, sp, #0
	bl sub_0209E430
	add r0, sp, #0
	ldmia r0, {r2, r3}
	stmia r4, {r2, r3}
	add r1, sp, #8
	add r0, r4, #8
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldr r0, [sp, #4]
	ldr r1, [sp]
	cmp r0, #0
	mov r0, #0
	cmpeq r1, #0
	movne r0, #1
	str r0, [r4, #0x10]
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0209FA40

	arm_func_start sub_0209FA94
sub_0209FA94: ; 0x0209FA94
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	add r0, sp, #0
	bl sub_0209E430
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	cmp r0, #0
	cmpeq r1, #0
	mov r0, #0
	bne _0209FAD8
	ldr r1, [sp, #4]
	ldr r2, [sp]
	cmp r1, r0
	cmpeq r2, r0
	addeq sp, sp, #0x14
	moveq r0, #1
	ldmeqia sp!, {pc}
_0209FAD8:
	mov r0, #0
	add sp, sp, #0x14
	ldmia sp!, {pc}
	arm_func_end sub_0209FA94

	.section .version,4

	.balign 4, 0
	.public _version_NINTENDO_DWC
_version_NINTENDO_DWC: ; 0x02000BC4
	.asciz "[SDK+NINTENDO:DWC2.2.30008.080630.1906_DWC_2_2_PLUS8]"

	.previous

	arm_func_start sub_0209FAE4
sub_0209FAE4: ; 0x0209FAE4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, _0209FB44 ; =_version_NINTENDO_DWC
	mov r5, #0
	bl OSi_ReferSymbol
	mov r0, r6
	bl sub_0209EFF8
	mov r4, r0
	bl sub_0209FA94
	cmp r0, #0
	beq _0209FB1C
	mov r0, r6
	bl sub_0209F80C
	mov r5, #1
_0209FB1C:
	cmp r4, #0
	bge _0209FB34
	cmp r5, #0
	movne r0, #2
	moveq r0, #3
	ldmia sp!, {r4, r5, r6, pc}
_0209FB34:
	cmp r5, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0209FB44: .word _version_NINTENDO_DWC
	arm_func_end sub_0209FAE4

	arm_func_start sub_0209FB48
sub_0209FB48: ; 0x0209FB48
	mvn ip, r3
	tst r1, ip
	movne r0, #0
	bxne lr
	mvn r3, r3, lsl r2
	ldr ip, [r0]
	and r3, ip, r3
	orr r1, r3, r1, lsl r2
	str r1, [r0]
	mov r0, #1
	bx lr
	arm_func_end sub_0209FB48

	arm_func_start sub_0209FB74
sub_0209FB74: ; 0x0209FB74
	ldr r2, [r0]
	ldr r1, _0209FB90 ; =0x000007FF
	ldr r0, [r0, #4]
	and r1, r2, r1
	orr r1, r1, #0
	orr r0, r0, #0
	bx lr
	.align 2, 0
_0209FB90: .word 0x000007FF
	arm_func_end sub_0209FB74

	arm_func_start sub_0209FB94
sub_0209FB94: ; 0x0209FB94
	ldr r0, [r0, #8]
	bx lr
	arm_func_end sub_0209FB94

	arm_func_start sub_0209FB9C
sub_0209FB9C: ; 0x0209FB9C
	ldr r1, [r0, #8]
	ldr r0, [r0, #4]
	orr r1, r1, #0
	orr r0, r0, #0
	bx lr
	arm_func_end sub_0209FB9C

	arm_func_start sub_0209FBB0
sub_0209FBB0: ; 0x0209FBB0
	ldr r0, [r0, #4]
	bx lr
	arm_func_end sub_0209FBB0

	arm_func_start sub_0209FBB8
sub_0209FBB8: ; 0x0209FBB8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _0209FBDC ; =0x000007FF
	mov r4, r1
	mov r1, r2
	mov r2, #0
	mov r5, r0
	bl sub_0209FB48
	str r4, [r5, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0209FBDC: .word 0x000007FF
	arm_func_end sub_0209FBB8

	arm_func_start sub_0209FBE0
sub_0209FBE0: ; 0x0209FBE0
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_0209FBE0

	arm_func_start sub_0209FBE8
sub_0209FBE8: ; 0x0209FBE8
	stmib r0, {r1, r2}
	bx lr
	arm_func_end sub_0209FBE8

	arm_func_start sub_0209FBF0
sub_0209FBF0: ; 0x0209FBF0
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_0209FBF0

	arm_func_start sub_0209FBF8
sub_0209FBF8: ; 0x0209FBF8
	ldr r1, [r0]
	ldr r0, _0209FC08 ; =0x001FFFFF
	and r0, r0, r1, lsr #11
	bx lr
	.align 2, 0
_0209FC08: .word 0x001FFFFF
	arm_func_end sub_0209FBF8

	arm_func_start sub_0209FC0C
sub_0209FC0C: ; 0x0209FC0C
	stmdb sp!, {r3, lr}
	bl sub_0209FBF8
	and r0, r0, #3
	ldmia sp!, {r3, pc}
	arm_func_end sub_0209FC0C

	arm_func_start sub_0209FC1C
sub_0209FC1C: ; 0x0209FC1C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0209FC0C
	cmp r0, #3
	bne _0209FC4C
	mov r0, r4
	bl sub_0209FBF8
	and r0, r0, #4
	cmp r0, #4
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, pc}
_0209FC4C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0209FC1C

	arm_func_start sub_0209FC54
sub_0209FC54: ; 0x0209FC54
	ldr ip, _0209FC5C ; =sub_0209FC0C
	bx ip
	.align 2, 0
_0209FC5C: .word sub_0209FC0C
	arm_func_end sub_0209FC54

	arm_func_start sub_0209FC60
sub_0209FC60: ; 0x0209FC60
	ldr ip, _0209FC70 ; =sub_0209FB48
	ldr r3, _0209FC74 ; =0x001FFFFF
	mov r2, #0xb
	bx ip
	.align 2, 0
_0209FC70: .word sub_0209FB48
_0209FC74: .word 0x001FFFFF
	arm_func_end sub_0209FC60

	arm_func_start sub_0209FC78
sub_0209FC78: ; 0x0209FC78
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_0209FBF8
	bic r1, r0, #3
	mov r0, r5
	orr r1, r1, r4
	bl sub_0209FC60
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0209FC78

	arm_func_start sub_0209FC9C
sub_0209FC9C: ; 0x0209FC9C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0209FC0C
	cmp r0, #3
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl sub_0209FBF8
	orr r1, r0, #4
	mov r0, r4
	bl sub_0209FC60
	ldmia sp!, {r4, pc}
	arm_func_end sub_0209FC9C

	arm_func_start sub_0209FCC8
sub_0209FCC8: ; 0x0209FCC8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x108
	mov r4, r0
	str r1, [sp, #4]
	add r0, sp, #8
	mov r1, #7
	str r4, [sp]
	bl sub_020E37D8
	add r0, sp, #8
	add r1, sp, #0
	mov r2, #8
	bl sub_020E39DC
	and r0, r0, #0x7f
	orr r1, r0, #0
	orr r0, r4, #0
	add sp, sp, #0x108
	ldmia sp!, {r4, pc}
	arm_func_end sub_0209FCC8

	arm_func_start sub_0209FD0C
sub_0209FD0C: ; 0x0209FD0C
	ldr ip, _0209FD24 ; =sub_0209FD28
	mov r3, r0
	mov r0, r1
	mov r1, r2
	ldr r2, [r3, #0x24]
	bx ip
	.align 2, 0
_0209FD24: .word sub_0209FD28
	arm_func_end sub_0209FD0C

	arm_func_start sub_0209FD28
sub_0209FD28: ; 0x0209FD28
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x108
	mov r4, r1
	and r1, r4, #0
	cmp r1, #0
	and r3, r0, #0x80000000
	cmpeq r3, #0
	mov r1, #0
	addne sp, sp, #0x108
	movne r0, r1
	ldmneia sp!, {r4, pc}
	str r0, [sp]
	add r0, sp, #8
	mov r1, #7
	str r2, [sp, #4]
	bl sub_020E37D8
	add r0, sp, #8
	add r1, sp, #0
	mov r2, #8
	bl sub_020E39DC
	and r1, r0, #0x7f
	mov r0, r1, asr #0x1f
	cmp r0, #0
	cmpeq r1, r4
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x108
	ldmia sp!, {r4, pc}
	arm_func_end sub_0209FD28

	arm_func_start sub_0209FD98
sub_0209FD98: ; 0x0209FD98
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0209FD28
	cmp r0, #0
	mov r0, #0
	subne r0, r0, #1
	andne r0, r4, r0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0209FD98

	arm_func_start sub_0209FDB8
sub_0209FDB8: ; 0x0209FDB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr lr, _0209FE20 ; =0x66666667
	add r4, r2, #4
	smull ip, r2, lr, r4
	mov ip, r4, lsr #0x1f
	add r2, ip, r2, asr #1
	cmp r2, #0
	ldr r7, _0209FE24 ; =_021105F4
	mov r6, #0
	ble _0209FE14
	add r4, r3, r2
	sub r4, r4, #1
	mov ip, #0x1f
_0209FDEC:
	and r5, r0, ip
	ldrsb r5, [r7, r5]
	mov r0, r0, lsr #5
	mov lr, r1, lsr #5
	strb r5, [r4, -r6]
	add r6, r6, #1
	orr r0, r0, r1, lsl #27
	mov r1, lr
	cmp r6, r2
	blt _0209FDEC
_0209FE14:
	mov r0, #0
	strb r0, [r3, r2]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0209FE20: .word 0x66666667
_0209FE24: .word _021105F4
	arm_func_end sub_0209FDB8

	arm_func_start sub_0209FE28
sub_0209FE28: ; 0x0209FE28
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x40
	mov r6, r0
	mov r4, r1
	mov r5, r2
	bl sub_0209FB74
	add r3, sp, #0x29
	mov r2, #0x2b
	bl sub_0209FDB8
	mov r0, r6
	bl sub_0209FB94
	mov r1, #0
	mov r2, #0x20
	add r3, sp, #0x14
	bl sub_0209FDB8
	mov r1, r4, lsr #0x18
	and r1, r1, #0xff
	str r1, [sp]
	mov r1, r4, lsr #0x10
	and r1, r1, #0xff
	str r1, [sp, #4]
	mov r1, r4, lsr #8
	and r1, r1, #0xff
	str r1, [sp, #8]
	and r1, r4, #0xff
	str r1, [sp, #0xc]
	add r2, sp, #0x14
	str r2, [sp, #0x10]
	ldr r2, _0209FEB4 ; =_02110618
	mov r0, r5
	mov r1, #0x15
	add r3, sp, #0x29
	bl sub_020D168C
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0209FEB4: .word _02110618
	arm_func_end sub_0209FE28

	arm_func_start sub_0209FEB8
sub_0209FEB8: ; 0x0209FEB8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x400
	mov r4, r1
	mov r1, #0
	mov r2, #0x40
	mov r5, r0
	bl sub_020D4994
	mov r0, #0x40
	str r0, [r5]
	mov r0, #0
	str r0, [r5, #0x1c]
	add r0, r5, #4
	str r4, [r5, #0x24]
	bl sub_0209FF34
	add r0, r5, #0x10
	mov r1, #0
	bl sub_0209FC78
	ldr r1, _0209FF30 ; =0xEDB88320
	add r0, sp, #0
	bl sub_020E3960
	add r0, sp, #0
	mov r1, r5
	mov r2, #0x3c
	bl sub_020E3A58
	str r0, [r5, #0x3c]
	ldr r0, [r5, #0x20]
	orr r0, r0, #1
	str r0, [r5, #0x20]
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0209FF30: .word 0xEDB88320
	arm_func_end sub_0209FEB8

	arm_func_start sub_0209FF34
sub_0209FF34: ; 0x0209FF34
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x34
	mov r6, r0
	add r0, sp, #0
	bl sub_020D3E78
	mov r3, #1
	add r2, sp, #0
_0209FF50:
	add r0, r2, r3, lsl #2
	ldr r1, [r2, r3, lsl #2]
	ldr r0, [r0, #-4]
	eor r0, r1, r0
	str r0, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #8
	blo _0209FF50
	add r0, sp, #0x20
	ldr r5, [sp, #0x1c]
	mov r4, #0
	bl sub_0209FA40
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _0209FFA0
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	mov r0, r6
	bl sub_0209FBB8
	b _0209FFB0
_0209FFA0:
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov r0, r6
	bl sub_0209FBB8
_0209FFB0:
	ldr r0, _0209FFEC ; =0x6C078965
	ldr r1, _0209FFF0 ; =0x5D588B65
	umull r3, r2, r5, r0
	mla r2, r5, r1, r2
	ldr r1, _0209FFF4 ; =0x00269EC3
	mla r2, r4, r0, r2
	adds r0, r3, r1
	mov r0, r6
	adc r1, r2, #0
	bl sub_0209FBE0
	mov r0, r6
	mov r1, #1
	bl sub_0209FC78
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0209FFEC: .word 0x6C078965
_0209FFF0: .word 0x5D588B65
_0209FFF4: .word 0x00269EC3
	arm_func_end sub_0209FF34

	arm_func_start sub_0209FFF8
sub_0209FFF8: ; 0x0209FFF8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	add r0, sp, #0
	bl sub_0209FA40
	ldr r0, [sp, #0x10]
	cmp r0, #0
	mov r0, r4
	beq _020A0040
	bl sub_0209FB74
	ldr r2, [sp, #4]
	ldr r3, [sp]
	cmp r2, r1
	cmpeq r3, r0
	moveq r0, #1
	add sp, sp, #0x14
	movne r0, #0
	ldmia sp!, {r3, r4, pc}
_020A0040:
	bl sub_0209FB74
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	cmp r2, r1
	cmpeq r3, r0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0209FFF8

	arm_func_start sub_020A0064
sub_020A0064: ; 0x020A0064
	stmdb sp!, {r3, lr}
	bl sub_0209FC0C
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A0064

	arm_func_start sub_020A007C
sub_020A007C: ; 0x020A007C
	ldr ip, _020A0088 ; =sub_020A0064
	add r0, r0, #0x10
	bx ip
	.align 2, 0
_020A0088: .word sub_020A0064
	arm_func_end sub_020A007C

	arm_func_start sub_020A008C
sub_020A008C: ; 0x020A008C
	stmdb sp!, {r3, lr}
	bl sub_0209FC0C
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A008C

	arm_func_start sub_020A00A4
sub_020A00A4: ; 0x020A00A4
	ldr ip, _020A00AC ; =sub_020A008C
	bx ip
	.align 2, 0
_020A00AC: .word sub_020A008C
	arm_func_end sub_020A00A4

	arm_func_start sub_020A00B0
sub_020A00B0: ; 0x020A00B0
	ldr ip, _020A00B8 ; =sub_0209FEB8
	bx ip
	.align 2, 0
_020A00B8: .word sub_0209FEB8
	arm_func_end sub_020A00B0

	arm_func_start sub_020A00BC
sub_020A00BC: ; 0x020A00BC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x400
	ldr r1, _020A00FC ; =0xEDB88320
	mov r4, r0
	add r0, sp, #0
	bl sub_020E3960
	add r0, sp, #0
	mov r1, r4
	mov r2, #0x3c
	bl sub_020E3A58
	ldr r1, [r4, #0x3c]
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A00FC: .word 0xEDB88320
	arm_func_end sub_020A00BC

	arm_func_start sub_020A0100
sub_020A0100: ; 0x020A0100
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x10
	bl sub_020A0064
	cmp r0, #0
	beq _020A0128
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	movgt r0, #1
	ldmgtia sp!, {r4, pc}
_020A0128:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A0100

	arm_func_start sub_020A0130
sub_020A0130: ; 0x020A0130
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	add r0, r4, #0x10
	bl sub_0209FC0C
	cmp r0, #0
	addeq sp, sp, #0x14
	moveq r0, #1
	ldmeqia sp!, {r3, r4, pc}
	add r0, sp, #0
	bl sub_0209FA40
	ldr r0, [sp, #0x10]
	cmp r0, #0
	addeq sp, sp, #0x14
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	add r0, r4, #0x10
	bl sub_0209FB74
	ldr r2, [sp, #4]
	ldr r3, [sp]
	cmp r2, r1
	cmpeq r3, r0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_020A0130

	arm_func_start sub_020A0198
sub_020A0198: ; 0x020A0198
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x400
	mov r4, r0
	add r3, r4, #0x10
	mov ip, r2
	ldmia r1, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r1, _020A01EC ; =0xEDB88320
	add r0, sp, #0
	str ip, [r4, #0x1c]
	bl sub_020E3960
	add r0, sp, #0
	mov r1, r4
	mov r2, #0x3c
	bl sub_020E3A58
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x20]
	orr r0, r0, #1
	str r0, [r4, #0x20]
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A01EC: .word 0xEDB88320
	arm_func_end sub_020A0198

	arm_func_start sub_020A01F0
sub_020A01F0: ; 0x020A01F0
	ldr ip, _020A01F8 ; =sub_020A01FC
	bx ip
	.align 2, 0
_020A01F8: .word sub_020A01FC
	arm_func_end sub_020A01F0

	arm_func_start sub_020A01FC
sub_020A01FC: ; 0x020A01FC
	ldr r0, [r0, #0x20]
	and r0, r0, #1
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_020A01FC

	arm_func_start sub_020A0214
sub_020A0214: ; 0x020A0214
	ldr ip, _020A021C ; =sub_020A0220
	bx ip
	.align 2, 0
_020A021C: .word sub_020A0220
	arm_func_end sub_020A0214

	arm_func_start sub_020A0220
sub_020A0220: ; 0x020A0220
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x400
	mov r4, r0
	ldr r1, [r4, #0x20]
	add r0, sp, #0
	bic r2, r1, #1
	ldr r1, _020A0260 ; =0xEDB88320
	str r2, [r4, #0x20]
	bl sub_020E3960
	add r0, sp, #0
	mov r1, r4
	mov r2, #0x3c
	bl sub_020E3A58
	str r0, [r4, #0x3c]
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A0260: .word 0xEDB88320
	arm_func_end sub_020A0220

	arm_func_start sub_020A0264
sub_020A0264: ; 0x020A0264
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0209FC0C
	cmp r0, #2
	movne r0, #0
	movne r1, r0
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl sub_0209FB9C
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A0264

	arm_func_start sub_020A028C
sub_020A028C: ; 0x020A028C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	mov r6, r0
	mov r0, r4
	bl sub_0209FC0C
	cmp r0, #1
	beq _020A0300
	cmp r0, #2
	beq _020A02BC
	cmp r0, #3
	beq _020A02F4
	b _020A0308
_020A02BC:
	mov r0, r4
	bl sub_0209FB9C
	ldr r2, [r6, #0x24]
	mov r4, r0
	mov r5, r1
	bl sub_0209FD28
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r2, [r6, #0x24]
	mov r0, r4
	mov r1, r5
	bl sub_0209FD98
	ldmia sp!, {r4, r5, r6, pc}
_020A02F4:
	mov r0, r4
	bl sub_0209FBB0
	ldmia sp!, {r4, r5, r6, pc}
_020A0300:
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020A0308:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A028C

	arm_func_start sub_020A0310
sub_020A0310: ; 0x020A0310
	stmdb sp!, {r3, lr}
	mov r3, r0
	ldr r0, [r3, #0x1c]
	mov r2, #0
	mov r1, r2
	cmp r0, #0
	beq _020A0338
	ldr r1, [r3, #0x24]
	bl sub_0209FCC8
	mov r2, r0
_020A0338:
	mov r0, r2
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A0310

	arm_func_start sub_020A0340
sub_020A0340: ; 0x020A0340
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r1, #0
	mov r2, #0xc
	bl sub_020D4994
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_0209FBE8
	mov r0, r6
	mov r1, #2
	bl sub_0209FC78
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A0340

	arm_func_start sub_020A037C
sub_020A037C: ; 0x020A037C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0
	mov r2, #0xc
	bl sub_020D4994
	mov r0, r5
	bl sub_020A007C
	cmp r0, #0
	addeq r0, r5, #4
	ldmeqia r0, {r0, r1, r2}
	stmeqia r4, {r0, r1, r2}
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #0x1c]
	mov r0, r4
	bl sub_0209FBF0
	mov r0, r4
	mov r1, #3
	bl sub_0209FC78
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A037C

	arm_func_start sub_020A03D0
sub_020A03D0: ; 0x020A03D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r1, #0
	mov r2, #0xc
	bl sub_020D4994
	mov r0, r5
	mov r1, r4
	bl sub_0209FBF0
	mov r0, r5
	mov r1, #3
	bl sub_0209FC78
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A03D0

	arm_func_start sub_020A0404
sub_020A0404: ; 0x020A0404
	ldr ip, _020A0418 ; =sub_0209FE28
	mov r3, r0
	mov r0, r1
	ldr r1, [r3, #0x24]
	bx ip
	.align 2, 0
_020A0418: .word sub_0209FE28
	arm_func_end sub_020A0404

	arm_func_start sub_020A041C
sub_020A041C: ; 0x020A041C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r7, r0
	bl sub_0209FC0C
	mov r5, r0
	mov r0, r4
	bl sub_0209FC0C
	cmp r5, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #3
	bne _020A0470
	mov r0, r7
	bl sub_0209FBB0
	mov r5, r0
	mov r0, r4
	bl sub_0209FBB0
	cmp r5, r0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A0470:
	cmp r5, #1
	bne _020A04C4
	mov r0, r7
	bl sub_0209FB74
	mov r5, r0
	mov r6, r1
	mov r0, r4
	bl sub_0209FB74
	cmp r6, r1
	cmpeq r5, r0
	bne _020A04BC
	mov r0, r7
	bl sub_0209FB94
	mov r5, r0
	mov r0, r4
	bl sub_0209FB94
	cmp r5, r0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_020A04BC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A04C4:
	cmp r5, #2
	bne _020A04F8
	mov r0, r7
	bl sub_0209FB9C
	mov r5, r0
	mov r6, r1
	mov r0, r4
	bl sub_0209FB9C
	cmp r6, r1
	cmpeq r5, r0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A04F8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020A041C

	arm_func_start sub_020A0500
sub_020A0500: ; 0x020A0500
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0
	str r3, [r0]
	cmp r2, #0x10
	str r3, [r0, #4]
	movhi r2, #0x10
	add r0, r0, #8
_020A051C:
	str r3, [r0, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x100
	blt _020A051C
	mov r5, #0
	mov r6, r5
	mov lr, r5
	mov ip, r5
_020A053C:
	ldrb r3, [r1, r6]
	ldr r4, [r0, lr, lsl #2]
	add r6, r6, #1
	add r3, r4, r3
	add r3, r5, r3
	and r5, r3, #0xff
	ldr r3, [r0, r5, lsl #2]
	cmp r6, r2
	str r3, [r0, lr, lsl #2]
	add lr, lr, #1
	moveq r6, ip
	str r4, [r0, r5, lsl #2]
	cmp lr, #0x100
	blt _020A053C
	mov r2, #0
_020A0578:
	ldr r1, [r0, r2, lsl #2]
	mov r1, r1, lsl #0x18
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0x100
	blt _020A0578
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_020A0500

	arm_func_start sub_020A0598
sub_020A0598: ; 0x020A0598
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	mov r3, #0
	strb r3, [r0]
	cmp r2, #0x10
	strb r3, [r0, #1]
	movhi r2, #0x10
	add r0, r0, #4
_020A05B8:
	strb r3, [r0, r3]
	add r3, r3, #1
	cmp r3, #0x100
	blt _020A05B8
	mov r6, #0
	mov r7, r6
	mov r4, r6
	mov r3, r6
	and ip, r2, #0xff
_020A05DC:
	ldrb r5, [r0, r4]
	ldrb lr, [r1, r7]
	add r2, r7, #1
	and r7, r2, #0xff
	add r2, r5, lr
	add r2, r6, r2
	and r6, r2, #0xff
	ldrb r2, [r0, r6]
	add lr, r0, r4
	add r4, r4, #1
	strb r2, [lr]
	cmp r7, ip
	moveq r7, r3
	cmp r4, #0x100
	strb r5, [r0, r6]
	blt _020A05DC
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_020A0598

	arm_func_start sub_020A0628
sub_020A0628: ; 0x020A0628
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	ldr r7, [r0]
	ldr r6, [r0, #4]
	add r0, r0, #8
	mov lr, #0x1000000
	add r7, r7, lr
	subs r2, r2, #8
	ldr sb, [r0, r7, lsr #22]
	bmi _020A07B4
_020A064C:
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	subs r2, r2, #8
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	bpl _020A064C
_020A07B4:
	adds r2, r2, #8
	ble _020A07F0
_020A07BC:
	add r6, r6, sb
	subs r2, r2, #1
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	bgt _020A07BC
_020A07F0:
	sub r7, r7, lr
	and r7, r7, #0xff000000
	str r6, [r0, #-4]
	str r7, [r0, #-8]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020A0628

	.section .version,4

	.balign 4, 0
	.public _version_NINTENDO_WiFi
_version_NINTENDO_WiFi: ; 0x02000BFC
	.asciz "[SDK+NINTENDO:WiFi2.1.30003.0709200229]"

	.previous

	arm_func_start sub_020A0804
sub_020A0804: ; 0x020A0804
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _020A0838 ; =_version_NINTENDO_WiFi
	bl OSi_ReferSymbol
	ldr r0, _020A083C ; =_02110628
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	str r4, [r0]
	bl sub_020A0880
	bl sub_020A0840
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A0838: .word _version_NINTENDO_WiFi
_020A083C: .word _02110628
	arm_func_end sub_020A0804

	arm_func_start sub_020A0840
sub_020A0840: ; 0x020A0840
	stmdb sp!, {r4, lr}
	ldr r0, _020A0874 ; =_02110628
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	bl sub_020A0A78
	movs r4, r0
	bmi _020A086C
	ldr r0, _020A0878 ; =_02110660
	bl sub_020A0DAC
	ldr r1, _020A087C ; =0x021D4420
	str r0, [r1, #0xc]
_020A086C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A0874: .word _02110628
_020A0878: .word _02110660
_020A087C: .word 0x021D4420
	arm_func_end sub_020A0840

	arm_func_start sub_020A0880
sub_020A0880: ; 0x020A0880
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020A09B4 ; =_02110628
	ldr r4, _020A09B8 ; =0x021D4430
	ldr r5, [r0]
	mov r0, r4
	mov r1, #0
	mov r2, #0x30
	bl sub_020D4994
	ldr r1, [r5, #0x18]
	ldr r0, _020A09BC ; =0x021D4420
	ldr r2, _020A09C0 ; =sub_020A0A60
	str r1, [r0, #0x14]
	ldr r3, [r5, #0x1c]
	mov r1, #0
	str r3, [r0, #0x18]
	str r2, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	ldr r1, [r0]
	str r1, [r0, #0x3c]
	ldr r0, [r5, #0x24]
	cmp r0, #0
	moveq r0, #0x4000
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x28]
	cmp r0, #0
	bne _020A0900
	ldr r1, _020A09B4 ; =_02110628
	ldr r0, [r4, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	blx r1
_020A0900:
	str r0, [r4, #0x1c]
	ldr r1, [r5, #0x30]
	ldr lr, [r5, #0x34]
	cmp r1, #0
	moveq r1, #0x240
	sub ip, r1, #0x28
	cmp lr, #0
	moveq lr, #0x10c0
	ldr r2, _020A09C4 ; =_02110648
	add r0, lr, lr, lsr #31
	ldr r1, _020A09C8 ; =0x021D4670
	mov r3, #0
	strh lr, [r2, #2]
	mov r0, r0, asr #1
	strh r0, [r2, #4]
	str ip, [r4, #0x24]
	str r3, [r1]
	ldr r0, [r5]
	mov r2, #1
	cmp r0, #0
	beq _020A0974
	ldr r1, _020A09CC ; =sub_020A0A48
	ldr r0, _020A09BC ; =0x021D4420
	str r3, [r4]
	str r1, [r4, #0xc]
	str r2, [r0, #8]
	ldr r0, [r0, #4]
	str r0, [r4, #0x28]
	b _020A0988
_020A0974:
	ldr r0, _020A09BC ; =0x021D4420
	ldr r1, _020A09D0 ; =sub_020A09DC
	str r3, [r0, #8]
	str r2, [r4]
	str r1, [r4, #0xc]
_020A0988:
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	moveq r0, #0xb
	bl sub_020A3C90
	ldr r0, _020A09D4 ; =sub_020A41B4
	bl sub_020AFFC4
	ldr r0, _020A09D8 ; =sub_020A28DC
	bl sub_020A3C38
	mov r0, r4
	bl sub_020A39AC
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A09B4: .word _02110628
_020A09B8: .word 0x021D4430
_020A09BC: .word 0x021D4420
_020A09C0: .word sub_020A0A60
_020A09C4: .word _02110648
_020A09C8: .word 0x021D4670
_020A09CC: .word sub_020A0A48
_020A09D0: .word sub_020A09DC
_020A09D4: .word sub_020A41B4
_020A09D8: .word sub_020A28DC
	arm_func_end sub_020A0880

	arm_func_start sub_020A09DC
sub_020A09DC: ; 0x020A09DC
	ldr r0, _020A0A30 ; =_02110628
	ldr r1, _020A0A34 ; =0x021D4670
	ldr ip, [r0]
	ldr r0, _020A0A38 ; =0x021D463C
	ldr r3, [ip, #4]
	ldr r2, _020A0A3C ; =0x021D464C
	str r3, [r1]
	ldr r3, [ip, #8]
	ldr r1, _020A0A40 ; =0x021D4680
	str r3, [r0]
	ldr r3, [ip, #0xc]
	ldr r0, _020A0A44 ; =0x021D4420
	str r3, [r2]
	ldr r2, [ip, #0x10]
	str r2, [r1]
	ldr r2, [ip, #0x14]
	str r2, [r1, #4]
	ldr r1, [r0, #8]
	orr r1, r1, #2
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_020A0A30: .word _02110628
_020A0A34: .word 0x021D4670
_020A0A38: .word 0x021D463C
_020A0A3C: .word 0x021D464C
_020A0A40: .word 0x021D4680
_020A0A44: .word 0x021D4420
	arm_func_end sub_020A09DC

	arm_func_start sub_020A0A48
sub_020A0A48: ; 0x020A0A48
	ldr r0, _020A0A5C ; =0x021D4420
	ldr r1, [r0, #8]
	orr r1, r1, #2
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_020A0A5C: .word 0x021D4420
	arm_func_end sub_020A0A48

	arm_func_start sub_020A0A60
sub_020A0A60: ; 0x020A0A60
	stmdb sp!, {r3, lr}
	bl sub_020AFF20
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A0A60

	arm_func_start sub_020A0A78
sub_020A0A78: ; 0x020A0A78
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, #0x2c
	mul r1, r4, r0
	ldr r0, _020A0B00 ; =_02110628
	mov r2, r4, lsl #2
	add r2, r2, #3
	ldr r0, [r0]
	add r1, r1, #3
	bic r5, r2, #3
	bic r2, r1, #3
	ldr r1, [r0, #0x18]
	add r0, r2, r5
	blx r1
	movs r6, r0
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _020A0B04 ; =0x021D4464
	mov r1, r6
	mov r2, r4
	bl sub_020D2388
	cmp r4, #0
	add r5, r6, r5
	ble _020A0AF0
_020A0AD8:
	mov r0, r5
	bl sub_020A0BBC
	sub r4, r4, #1
	cmp r4, #0
	add r5, r5, #0x2c
	bgt _020A0AD8
_020A0AF0:
	ldr r1, _020A0B08 ; =0x021D4460
	mov r0, #0
	str r6, [r1]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A0B00: .word _02110628
_020A0B04: .word 0x021D4464
_020A0B08: .word 0x021D4460
	arm_func_end sub_020A0A78

	arm_func_start sub_020A0B0C
sub_020A0B0C: ; 0x020A0B0C
	stmdb sp!, {r3, lr}
	ldr r0, _020A0B4C ; =0x021D4460
	ldr r2, [r0, #0x20]
	ldr r1, [r0, #0x18]
	cmp r2, r1
	mvnlt r0, #0
	ldmltia sp!, {r3, pc}
	ldr r1, _020A0B50 ; =_02110628
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r1, [r1, #0x1c]
	blx r1
	ldr r1, _020A0B4C ; =0x021D4460
	mov r0, #0
	str r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A0B4C: .word 0x021D4460
_020A0B50: .word _02110628
	arm_func_end sub_020A0B0C

	arm_func_start sub_020A0B54
sub_020A0B54: ; 0x020A0B54
	stmdb sp!, {r3, lr}
	mov r2, r0
	ldr r0, _020A0B78 ; =0x021D4464
	add r1, sp, #0
	bl sub_020D2444
	cmp r0, #0
	ldrne r0, [sp]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A0B78: .word 0x021D4464
	arm_func_end sub_020A0B54

	arm_func_start sub_020A0B7C
sub_020A0B7C: ; 0x020A0B7C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r2
	mov r6, r0
	mov r0, r4
	mov r5, r1
	bl sub_020A0B54
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	str r6, [r0]
	str r5, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
	ldrsb r1, [r5, #0x73]
	strb r1, [r0, #0xc]
	strb r4, [r0, #0xd]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A0B7C

	arm_func_start sub_020A0BBC
sub_020A0BBC: ; 0x020A0BBC
	stmdb sp!, {r3, lr}
	movs r1, r0
	ldmeqia sp!, {r3, pc}
	ldr r0, _020A0BD8 ; =0x021D4464
	mov r2, #0
	bl sub_020D23B0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A0BD8: .word 0x021D4464
	arm_func_end sub_020A0BBC

	arm_func_start sub_020A0BDC
sub_020A0BDC: ; 0x020A0BDC
	ldr r1, [r0, #0x64]
	cmp r1, #0
	ldreq r1, [r0, #0x68]
	mov r0, r1
	bx lr
	arm_func_end sub_020A0BDC

	arm_func_start sub_020A0BF0
sub_020A0BF0: ; 0x020A0BF0
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r1
	beq _020A0C08
	ldrsb r1, [r5, #0xd]
	tst r1, #1
	beq _020A0C10
_020A0C08:
	mov r2, #1
	b _020A0C14
_020A0C10:
	mov r2, #0
_020A0C14:
	mov r1, r5
	bl sub_020D23B0
	movs r4, r0
	bne _020A0C2C
	mov r0, r5
	bl sub_020A0BBC
_020A0C2C:
	cmp r4, #0
	movne r0, #0
	mvneq r0, #0x29
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A0BF0

	arm_func_start sub_020A0C3C
sub_020A0C3C: ; 0x020A0C3C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_020A0BDC
	mov r1, r4
	bl sub_020A0BF0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A0C3C

	arm_func_start sub_020A0C54
sub_020A0C54: ; 0x020A0C54
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x28
	mov r4, r1
	ldrsb r2, [r4, #0xd]
	mov r5, r0
	cmp r2, #1
	bne _020A0CA8
	add r0, sp, #8
	add r1, sp, #0
	mov r2, #1
	bl sub_020D2388
	add r2, sp, #8
	mov r0, r5
	mov r1, r4
	str r2, [r4, #8]
	bl sub_020A0BF0
	add r0, sp, #8
	add r1, sp, #4
	mov r2, #1
	bl sub_020D2444
	b _020A0CB8
_020A0CA8:
	mov r2, #0
	str r2, [r4, #8]
	bl sub_020A0BF0
	str r0, [sp, #4]
_020A0CB8:
	ldr r0, [sp, #4]
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A0C54

	arm_func_start sub_020A0CC4
sub_020A0CC4: ; 0x020A0CC4
	ldr ip, _020A0CD0 ; =sub_020A0C54
	ldr r0, [r0, #0x64]
	bx ip
	.align 2, 0
_020A0CD0: .word sub_020A0C54
	arm_func_end sub_020A0CC4

	arm_func_start sub_020A0CD4
sub_020A0CD4: ; 0x020A0CD4
	ldr ip, _020A0CE0 ; =sub_020A0C54
	ldr r0, [r0, #0x68]
	bx ip
	.align 2, 0
_020A0CE0: .word sub_020A0C54
	arm_func_end sub_020A0CD4

	arm_func_start sub_020A0CE4
sub_020A0CE4: ; 0x020A0CE4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_020A0BDC
	mov r1, r4
	bl sub_020A0C54
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A0CE4

	arm_func_start sub_020A0CFC
sub_020A0CFC: ; 0x020A0CFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r4, #0
	mov sb, r0
	mov sl, r4
	add r6, sp, #0
	mov r5, #1
_020A0D18:
	mov r0, sb
	mov r1, r6
	mov r2, r5
	bl sub_020D2584
	ldr r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, [r0]
	blx r1
	mov r8, r0
	bl sub_020D3A38
	mov r7, r0
	bl sub_020D21FC
	mov r0, sb
	mov r1, r4
	mov r2, r4
	bl sub_020D2444
	ldr r0, [sp]
	ldr r0, [r0, #4]
	cmp r0, #0
	strne r8, [r0, #0x6c]
	ldr r0, [sp]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _020A0D8C
	mov r1, r8
	mov r2, sl
	bl sub_020D23B0
_020A0D8C:
	ldr r0, [sp]
	bl sub_020A0BBC
	bl sub_020D2230
	mov r0, r7
	bl sub_020D3A4C
	b _020A0D18
	arm_func_end sub_020A0CFC

	arm_func_start sub_020A0DA4
sub_020A0DA4: ; 0x020A0DA4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020A0DA4

	arm_func_start sub_020A0DAC
sub_020A0DAC: ; 0x020A0DAC
	stmdb sp!, {r4, lr}
	bl sub_020A0E5C
	movs r4, r0
	mvneq r0, #0x30
	ldmeqia sp!, {r4, pc}
	ldr r0, _020A0DE4 ; =sub_020A0DE8
	mov r1, r4
	mov r2, #1
	bl sub_020A0B7C
	mov r1, r0
	mov r0, r4
	bl sub_020A0CE4
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A0DE4: .word sub_020A0DE8
	arm_func_end sub_020A0DAC

	arm_func_start sub_020A0DE8
sub_020A0DE8: ; 0x020A0DE8
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #4]
	mov r0, r4
	bl sub_020A6878
	ldrsb r0, [r4, #0x73]
	ldr r1, [r4, #0x68]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020A0E48
_020A0E0C: ; jump table
	b _020A0E20 ; case 0
	b _020A0E30 ; case 1
	b _020A0E44 ; case 2
	b _020A0E48 ; case 3
	b _020A0E20 ; case 4
_020A0E20:
	add r0, r1, #0x20
	bl sub_020A6984
	bl sub_020A6930
	b _020A0E48
_020A0E30:
	bl sub_020A6930
	bl sub_020A68A4
	ldr r0, _020A0E58 ; =sub_020A1D10
	bl sub_020A69DC
	b _020A0E48
_020A0E44:
	bl sub_020A68A4
_020A0E48:
	mov r0, #1
	strh r0, [r4, #0x70]
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A0E58: .word sub_020A1D10
	arm_func_end sub_020A0DE8

	arm_func_start sub_020A0E5C
sub_020A0E5C: ; 0x020A0E5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl sub_020A0EC4
	mov r4, r0
	bl sub_020D3A38
	ldr r1, _020A0EC0 ; =_02110628
	mov r6, r0
	ldr r1, [r1]
	mov r0, r4
	ldr r1, [r1, #0x18]
	blx r1
	movs r5, r0
	beq _020A0EB0
	mov r2, r4
	mov r1, #0
	bl sub_020D4994
	mov r0, r5
	mov r1, r7
	bl sub_020A0F6C
	mov r0, r5
	bl sub_020A2D9C
_020A0EB0:
	mov r0, r6
	bl sub_020D3A4C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A0EC0: .word _02110628
	arm_func_end sub_020A0E5C

	arm_func_start sub_020A0EC4
sub_020A0EC4: ; 0x020A0EC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrh r0, [r5, #2]
	mov r4, #0x80
	cmp r0, #0
	beq _020A0F00
	add r4, r4, #0x114
	bl sub_020A2D90
	add r4, r4, r0
	ldrh r0, [r5, #8]
	bl sub_020A2D90
	add r4, r4, r0
	add r0, r5, #0x10
	bl sub_020A0F44
	add r4, r4, r0
_020A0F00:
	ldrh r0, [r5, #6]
	cmp r0, #0
	beq _020A0F3C
	add r4, r4, #0x110
	bl sub_020A2D90
	add r4, r4, r0
	ldrh r0, [r5, #0xa]
	bl sub_020A2D90
	add r4, r4, r0
	ldrh r0, [r5, #0xc]
	bl sub_020A2D90
	add r4, r4, r0
	add r0, r5, #0x14
	bl sub_020A0F44
	add r4, r4, r0
_020A0F3C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A0EC4

	arm_func_start sub_020A0F44
sub_020A0F44: ; 0x020A0F44
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #3]
	mov r0, r0, lsl #2
	bl sub_020A2D90
	mov r4, r0
	ldrh r0, [r5]
	bl sub_020A2D90
	add r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A0F44

	arm_func_start sub_020A0F6C
sub_020A0F6C: ; 0x020A0F6C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrsb r1, [r5]
	mov r6, r0
	add r4, r6, #0x80
	strb r1, [r6, #0x73]
	ldrsb r0, [r5, #1]
	strb r0, [r6, #0x72]
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _020A0FEC
	str r4, [r6, #0x64]
	ldrh r2, [r5, #4]
	mov r1, r4
	add r0, r4, #0x114
	strh r2, [r4, #0xfc]
	add r2, r5, #0x10
	mov r7, r4
	bl sub_020A1090
	ldrh r2, [r5, #2]
	add r1, r6, #0x3c
	bl sub_020A1068
	ldrh r2, [r5, #8]
	add r1, r6, #0x50
	bl sub_020A1068
	ldrh r3, [r5, #0xe]
	add r1, r7, #0x100
	mov r2, #0
	strh r3, [r1, #0xa]
	str r2, [r7, #0x110]
	mov r4, r0
	str r2, [r7, #0x10c]
_020A0FEC:
	ldrh r0, [r5, #6]
	cmp r0, #0
	beq _020A104C
	str r4, [r6, #0x68]
	mov r1, r4
	str r6, [r4, #0x10c]
	add r0, r4, #0x110
	add r2, r5, #0x14
	mov r7, r4
	bl sub_020A1090
	ldrh r2, [r5, #6]
	add r1, r6, #0x48
	bl sub_020A1068
	ldrh r2, [r5, #0xa]
	add r1, r6, #0x58
	bl sub_020A1068
	ldrh r2, [r5, #0xc]
	add r1, r4, #0xf8
	bl sub_020A1068
	mov r1, #0
	str r1, [r7, #0x108]
	mov r4, r0
	str r1, [r7, #0x104]
	b _020A105C
_020A104C:
	ldr r0, _020A1064 ; =0x021D442C
	ldr r0, [r0]
	ldr r0, [r0, #0x68]
	str r0, [r6, #0x68]
_020A105C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A1064: .word 0x021D442C
	arm_func_end sub_020A0F6C

	arm_func_start sub_020A1068
sub_020A1068: ; 0x020A1068
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r2, #0
	moveq r0, #0
	str r0, [r1, #4]
	mov r0, r2
	str r2, [r1]
	bl sub_020A2D90
	add r0, r4, r0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A1068

	arm_func_start sub_020A1090
sub_020A1090: ; 0x020A1090
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r2
	mov r7, r0
	mov r0, r5
	mov r6, r1
	bl sub_020A0F44
	mov r4, r0
	ldrb r2, [r5, #3]
	mov r0, r6
	mov r1, r7
	bl sub_020D2388
	add r0, r6, #0xe0
	bl sub_020D2600
	ldrh r2, [r5]
	add r0, r6, #0x20
	ldr r1, _020A1100 ; =sub_020A0CFC
	str r2, [sp]
	ldrb ip, [r5, #2]
	mov r2, r6
	add r3, r7, r4
	str ip, [sp, #4]
	bl sub_020D1AD4
	add r0, r6, #0x20
	bl sub_020D1F34
	add r0, r7, r4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A1100: .word sub_020A0CFC
	arm_func_end sub_020A1090

	arm_func_start sub_020A1104
sub_020A1104: ; 0x020A1104
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020A2E54
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r4, pc}
	cmp r4, #0
	mov r1, #0
	beq _020A1134
	ldrsh r0, [r4, #0x70]
	tst r0, #1
	movne r1, #1
_020A1134:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0x70]
	tst r0, #2
	mvnne r0, #0x1b
	ldmneia sp!, {r4, pc}
	ldrsb r0, [r4, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	mvneq r0, #0x1b
	ldmeqia sp!, {r4, pc}
	ldrsb r0, [r4, #0x72]
	cmp r0, #1
	moveq r0, #0
	mvnne r0, #5
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A1104

	arm_func_start sub_020A1184
sub_020A1184: ; 0x020A1184
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020A2E54
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	mov r1, #0
	beq _020A11BC
	ldrsh r0, [r6, #0x70]
	tst r0, #1
	movne r1, #1
_020A11BC:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r0, [r6, #0x70]
	tst r0, #2
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsb r0, [r6, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	mvneq r0, #0x1b
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsb r0, [r6, #0x72]
	cmp r0, #1
	mvnne r0, #5
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _020A1244 ; =_02110648
	bl sub_020A0DAC
	movs r7, r0
	ldmmiia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r1, [r6, #0x74]
	bl sub_020A1390
	cmp r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl sub_020A1248
	cmp r0, #0
	movge r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A1244: .word _02110648
	arm_func_end sub_020A1184

	arm_func_start sub_020A1248
sub_020A1248: ; 0x020A1248
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020A2E54
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r4, r5, r6, pc}
	cmp r6, #0
	mov r1, #0
	beq _020A1280
	ldrsh r0, [r6, #0x70]
	tst r0, #1
	movne r1, #1
_020A1280:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r0, [r6, #0x70]
	tst r0, #2
	mvnne r0, #0x1b
	ldmneia sp!, {r4, r5, r6, pc}
	ldrsb r0, [r6, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	mvneq r0, #0x1b
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsb r2, [r6, #0x72]
	cmp r2, #1
	mvnne r0, #5
	ldmneia sp!, {r4, r5, r6, pc}
	ldrh r0, [r6, #0x74]
	cmp r0, #0
	mvneq r0, #0x1b
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _020A1314 ; =sub_020A1318
	mov r1, r6
	bl sub_020A0B7C
	mov r1, r0
	ldrh r2, [r6, #0x74]
	mov r0, r6
	strh r2, [r1, #0x10]
	str r5, [r1, #0x14]
	str r4, [r1, #0x18]
	ldrsh r2, [r6, #0x70]
	orr r2, r2, #2
	strh r2, [r6, #0x70]
	bl sub_020A0CC4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A1314: .word sub_020A1318
	arm_func_end sub_020A1248

	arm_func_start sub_020A1318
sub_020A1318: ; 0x020A1318
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	ldr r4, [r6, #4]
	ldr r5, [r4, #0x64]
	add r0, r5, #0xe0
	bl OS_LockMutex
	mov r1, #0
	ldrh r0, [r6, #0x10]
	mov r2, r1
	bl sub_020A68D0
	bl sub_020A69F8
	mov r2, #0
	add r0, sp, #0
	add r1, sp, #4
	str r2, [r5, #0xf8]
	bl sub_020A6B24
	ldrh r2, [sp]
	ldr r1, [r6, #0x14]
	strh r2, [r1]
	ldr r1, [r6, #0x18]
	str r0, [r1]
	ldrsh r1, [r4, #0x70]
	add r0, r5, #0xe0
	orr r1, r1, #4
	strh r1, [r4, #0x70]
	bl OS_UnlockMutex
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A1318

	arm_func_start sub_020A1390
sub_020A1390: ; 0x020A1390
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020A2E54
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	mov r1, #0
	beq _020A13C4
	ldrsh r0, [r5, #0x70]
	tst r0, #1
	movne r1, #1
_020A13C4:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r5, #0x70]
	tst r0, #2
	mvnne r0, #6
	ldmneia sp!, {r3, r4, r5, pc}
	strh r4, [r5, #0x74]
	ldrsb r0, [r5, #0x73]
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl sub_020A14E8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A1390

	arm_func_start sub_020A1400
sub_020A1400: ; 0x020A1400
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020A2E54
	cmp r0, #0
	bne _020A1428
	ldrsh r0, [r6, #0x70]
	tst r0, #8
	beq _020A1430
_020A1428:
	mvn r0, #0x1b
	ldmia sp!, {r4, r5, r6, pc}
_020A1430:
	cmp r6, #0
	mov r1, #0
	beq _020A1448
	ldrsh r0, [r6, #0x70]
	tst r0, #1
	movne r1, #1
_020A1448:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsb r0, [r6, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A14D4
	ldrsh r0, [r6, #0x70]
	tst r0, #4
	beq _020A1490
	ldrsb r0, [r6, #0x72]
	cmp r0, #1
	mvneq r0, #0x1d
	movne r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020A1490:
	ldrsh r0, [r6, #0x70]
	tst r0, #2
	beq _020A14B4
	ldrsh r0, [r6, #0x70]
	tst r0, #0x40
	ldrne r0, [r6, #0x6c]
	ldreq r0, _020A14E4 ; =_0211062C
	ldreq r0, [r0]
	ldmia sp!, {r4, r5, r6, pc}
_020A14B4:
	strh r5, [r6, #0x76]
	mov r0, r6
	str r4, [r6, #0x78]
	bl sub_020A14E8
	ldrsb r1, [r6, #0x72]
	cmp r1, #1
	mvnne r0, #0x19
	ldmia sp!, {r4, r5, r6, pc}
_020A14D4:
	strh r5, [r6, #0x76]
	str r4, [r6, #0x78]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A14E4: .word _0211062C
	arm_func_end sub_020A1400

	arm_func_start sub_020A14E8
sub_020A14E8: ; 0x020A14E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsb r2, [r4, #0x72]
	ldr r0, _020A153C ; =sub_020A1540
	mov r1, r4
	bl sub_020A0B7C
	movs r1, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r4, pc}
	ldrh r2, [r4, #0x74]
	mov r0, r4
	strh r2, [r1, #0x10]
	ldrh r2, [r4, #0x76]
	strh r2, [r1, #0x12]
	ldr r2, [r4, #0x78]
	str r2, [r1, #0x14]
	ldrsh r2, [r4, #0x70]
	orr r2, r2, #2
	strh r2, [r4, #0x70]
	bl sub_020A0CC4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A153C: .word sub_020A1540
	arm_func_end sub_020A14E8

	arm_func_start sub_020A1540
sub_020A1540: ; 0x020A1540
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r4, [r7, #4]
	mov r6, #0
	ldr r5, [r4, #0x64]
	add r0, r5, #0xe0
	bl OS_LockMutex
	ldrh r0, [r7, #0x10]
	ldrh r1, [r7, #0x12]
	ldr r2, [r7, #0x14]
	bl sub_020A68D0
	mov r0, r6
	str r0, [r5, #0xf8]
	ldrsb r0, [r7, #0xc]
	cmp r0, #0
	cmpne r0, #4
	bne _020A158C
	bl sub_020A6AE4
	mov r6, r0
_020A158C:
	add r0, r5, #0xe0
	bl OS_UnlockMutex
	cmp r6, #0
	beq _020A15B0
	ldrsh r1, [r4, #0x70]
	mvn r0, #0x4b
	orr r1, r1, #0x40
	strh r1, [r4, #0x70]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A15B0:
	ldrsh r1, [r4, #0x70]
	mov r0, #0
	orr r1, r1, #4
	strh r1, [r4, #0x70]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020A1540

	arm_func_start sub_020A15C4
sub_020A15C4: ; 0x020A15C4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl sub_020A2E54
	cmp r0, #0
	addne sp, sp, #0xc
	mvnne r0, #0x1b
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [sp, #0x2c]
	tst r0, #4
	bne _020A1608
	ldrsb r0, [sb, #0x72]
	cmp r0, #0
	bne _020A1624
_020A1608:
	ldrsb r0, [sb, #0x73]
	cmp r0, #4
	addeq sp, sp, #0xc
	mvneq r0, #0x1b
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r5, #0
	b _020A163C
_020A1624:
	bl sub_020D3A9C
	cmp r0, #0x12
	addeq sp, sp, #0xc
	mvneq r0, #0x1b
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r5, #1
_020A163C:
	cmp sb, #0
	mov r1, #0
	beq _020A1654
	ldrsh r0, [sb, #0x70]
	tst r0, #1
	movne r1, #1
_020A1654:
	cmp r1, #0
	addeq sp, sp, #0xc
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldrsb r0, [sb, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A16A4
	ldrsh r0, [sb, #0x70]
	tst r0, #4
	beq _020A1698
	ldrsh r0, [sb, #0x70]
	tst r0, #8
	beq _020A16A4
_020A1698:
	add sp, sp, #0xc
	mvn r0, #0x37
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_020A16A4:
	ldr r4, [sb, #0x64]
	tst r5, #1
	add r0, r4, #0xe0
	bne _020A16CC
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020A16D0
	add sp, sp, #0xc
	mvn r0, #5
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_020A16CC:
	bl OS_LockMutex
_020A16D0:
	ldr r0, [sp, #0x28]
	ldr ip, [sp, #0x2c]
	str r0, [sp]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r6
	stmib sp, {r5, ip}
	bl sub_020A170C
	mov r5, r0
	add r0, r4, #0xe0
	bl OS_UnlockMutex
	mov r0, r5
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020A15C4

	arm_func_start sub_020A170C
sub_020A170C: ; 0x020A170C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r4, [sp, #0x28]
	mov r7, r0
	tst r4, #2
	ldr r4, [r7, #0x64]
	cmpne r4, #0
	movne r6, #1
	moveq r6, #0
	cmp r6, #0
	ldrnesb r5, [r4, #0xfe]
	movne r0, #1
	strneb r0, [r4, #0xfe]
	ldrsb r0, [r7, #0x73]
	cmp r0, #1
	bne _020A176C
	ldr r0, [sp, #0x20]
	ldr ip, [sp, #0x24]
	str r0, [sp]
	mov r0, r7
	str ip, [sp, #4]
	bl sub_020A1BCC
	mov r8, r0
	b _020A1794
_020A176C:
	ldr r0, [sp, #0x20]
	ldr ip, [sp, #0x24]
	str r0, [sp]
	mov r0, r7
	str ip, [sp, #4]
	bl sub_020A17A8
	movs r8, r0
	bmi _020A1794
	mov r0, r7
	bl sub_020A1B34
_020A1794:
	cmp r6, #0
	strneb r5, [r4, #0xfe]
	mov r0, r8
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020A170C

	arm_func_start sub_020A17A8
sub_020A17A8: ; 0x020A17A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrsb ip, [r7, #0x73]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp ip, #4
	bne _020A17D8
	ldr r4, [sp, #0x18]
	str r4, [sp]
	bl sub_020A1998
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A17D8:
	ldr ip, [sp, #0x18]
	str ip, [sp]
	bl sub_020A181C
	mvn r1, #5
	cmp r0, r1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [sp, #0x1c]
	tst r1, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr ip, [sp, #0x18]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp]
	bl sub_020A1998
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020A17A8

	arm_func_start sub_020A181C
sub_020A181C: ; 0x020A181C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl sub_020D3A38
	add r1, sp, #8
	mov r4, r0
	str r1, [sp]
	add r1, sp, #0xc
	mov r0, sb
	add r2, sp, #6
	add r3, sp, #4
	bl sub_020A1924
	cmp r0, #0
	beq _020A18BC
	ldr r5, [sp, #0xc]
	cmp r5, #0
	mvneq r5, #5
	beq _020A18D8
	ldrsb r1, [sb, #0x73]
	cmp r7, r5
	mov r2, #1
	movgt r7, r5
	cmp r1, #0
	cmpne r1, #4
	movne r2, #0
	cmp r2, #0
	mov r1, r8
	mov r2, r7
	movne r5, r7
	bl sub_020D4A50
	ldr r1, [sb, #0x64]
	ldrsb r0, [r1, #0xfe]
	cmp r0, #0
	ldreq r0, [r1, #0xf8]
	addeq r0, r0, r5
	streq r0, [r1, #0xf8]
	b _020A18D8
_020A18BC:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ldrsh r0, [sb, #0x70]
	moveq r5, #0
	mvnne r5, #0x1b
	bic r0, r0, #6
	strh r0, [sb, #0x70]
_020A18D8:
	cmp r5, #0
	blt _020A1910
	cmp r6, #0
	ldrne r1, [sp, #0x30]
	cmpne r1, #0
	beq _020A1900
	ldrh r0, [sp, #4]
	strh r0, [r6]
	ldr r0, [sp, #8]
	str r0, [r1]
_020A1900:
	ldrh r0, [sb, #0x74]
	cmp r0, #0
	ldreqh r0, [sp, #6]
	streqh r0, [sb, #0x74]
_020A1910:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, r5
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020A181C

	arm_func_start sub_020A1924
sub_020A1924: ; 0x020A1924
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, [r0, #0x64]
	ldr r4, [r0, #0xc4]
	ldr r5, [r0, #0xf8]
	ldr r0, [r4, #0x44]
	subs lr, r0, r5
	bmi _020A197C
	ldrh ip, [r4, #0xa]
	ldr r0, [sp, #0x10]
	cmp lr, #0
	strh ip, [r2]
	ldrh r2, [r4, #0x18]
	strh r2, [r3]
	ldr r2, [r4, #0x1c]
	str r2, [r0]
	str lr, [r1]
	bne _020A198C
	ldrb r0, [r4, #8]
	cmp r0, #4
	beq _020A198C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020A197C:
	mvn r0, #0
	str r0, [r1]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020A198C:
	ldr r0, [r4, #0x40]
	add r0, r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A1924

	arm_func_start sub_020A1998
sub_020A1998: ; 0x020A1998
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	ldr r0, _020A19E0 ; =sub_020A19E4
	mov r1, r7
	mov r2, #1
	mov r4, r3
	bl sub_020A0B7C
	mov r1, r0
	str r6, [r1, #0x10]
	str r5, [r1, #0x14]
	ldr r2, [sp, #0x18]
	str r4, [r1, #0x18]
	mov r0, r7
	str r2, [r1, #0x1c]
	bl sub_020A0CC4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A19E0: .word sub_020A19E4
	arm_func_end sub_020A1998

	arm_func_start sub_020A19E4
sub_020A19E4: ; 0x020A19E4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r7, [r0, #4]
	ldr r1, [r0, #0x10]
	ldr r8, [r7, #0x64]
	str r1, [sp, #0xc]
	ldr r1, [r0, #0x18]
	ldr sl, [r0, #0x14]
	ldr r0, [r0, #0x1c]
	ldr sb, [r8, #0xf8]
	str r1, [sp, #8]
	str r0, [sp, #4]
	mov r4, #0
	mov r5, #1
	mov fp, #0xa
	add r6, sp, #0x10
_020A1A24:
	mov r0, r6
	bl sub_020A6D58
	cmp r0, #0
	beq _020A1A78
	ldr r1, [sp, #0x10]
	sub r1, r1, sb
	cmp r1, #0
	bgt _020A1A78
	ldrsb r0, [r7, #0x73]
	mov r1, r5
	cmp r0, #0
	cmpne r0, #4
	movne r1, r4
	cmp r1, #0
	ldrneb r0, [r7, #8]
	cmpne r0, #4
	movne r0, #0
	bne _020A1A78
	mov r0, fp
	bl sub_020D2108
	b _020A1A24
_020A1A78:
	ldrsh r1, [r7, #0x70]
	tst r1, #0x80
	addne sp, sp, #0x14
	mvnne r0, #0xe
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrsb r1, [r7, #0x73]
	cmp r1, #4
	bne _020A1AD4
	cmp r0, #0
	addeq sp, sp, #0x14
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sp, #0x10]
	cmp sl, r1
	movhi sl, r1
	ldr r1, [sp, #0xc]
	mov r2, sl
	bl sub_020D4A50
	mov r0, sl
	bl sub_020A6E4C
	add sp, sp, #0x14
	mov r0, sl
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020A1AD4:
	cmp r0, #0
	moveq r4, #0
	beq _020A1B00
	ldr r4, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #8]
	mov r0, r7
	mov r2, sl
	str r4, [sp]
	bl sub_020A181C
	mov r4, r0
_020A1B00:
	cmp r4, #0
	addle sp, sp, #0x14
	movle r0, r4
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r0, [r8, #0xfc]
	ldr r1, [r8, #0xf8]
	cmp r1, r0
	blt _020A1B28
	mov r0, r7
	bl sub_020A1B90
_020A1B28:
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020A19E4

	arm_func_start sub_020A1B34
sub_020A1B34: ; 0x020A1B34
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x64]
	ldrh r0, [r1, #0xfc]
	ldr r1, [r1, #0xf8]
	cmp r1, r0
	movlt r0, #0
	ldmltia sp!, {r4, pc}
	ldr r0, _020A1B7C ; =sub_020A1B80
	mov r1, r4
	mov r2, #0
	bl sub_020A0B7C
	movs r1, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl sub_020A0CC4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A1B7C: .word sub_020A1B80
	arm_func_end sub_020A1B34

	arm_func_start sub_020A1B80
sub_020A1B80: ; 0x020A1B80
	ldr ip, _020A1B8C ; =sub_020A1B90
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_020A1B8C: .word sub_020A1B90
	arm_func_end sub_020A1B80

	arm_func_start sub_020A1B90
sub_020A1B90: ; 0x020A1B90
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, [r0, #0x64]
	bl sub_020D3A38
	ldr r6, [r4, #0xf8]
	mov r5, r0
	cmp r6, #0
	beq _020A1BBC
	mov r1, #0
	mov r0, r6
	str r1, [r4, #0xf8]
	bl sub_020A6E4C
_020A1BBC:
	mov r0, r5
	bl sub_020D3A4C
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A1B90

	arm_func_start sub_020A1BCC
sub_020A1BCC: ; 0x020A1BCC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldr r6, [sl, #0x64]
	str r1, [sp]
	ldr r0, [r6, #0x104]
	str r2, [sp, #4]
	mov fp, r3
	bl sub_020D3A38
	ldr r7, [r6, #0x104]
	str r0, [sp, #8]
	cmp r7, #0
	bne _020A1C68
	ldr r0, [sp, #0x34]
	mov r4, #1
	and sb, r0, #1
	mov r5, #0
_020A1C10:
	cmp sb, #0
	mvneq r8, #5
	beq _020A1C68
	add r0, r6, #0x10c
	bl sub_020D1E7C
	mov r0, sl
	bl sub_020A2E54
	cmp r0, #0
	bne _020A1C54
	mov r1, r5
	cmp sl, #0
	beq _020A1C4C
	ldrsh r0, [sl, #0x70]
	tst r0, #1
	movne r1, r4
_020A1C4C:
	cmp r1, #0
	bne _020A1C5C
_020A1C54:
	mvn r8, #0x37
	b _020A1C68
_020A1C5C:
	ldr r7, [r6, #0x104]
	cmp r7, #0
	beq _020A1C10
_020A1C68:
	cmp r7, #0
	beq _020A1CF8
	ldrh r1, [r7, #4]
	ldr r0, [sp, #4]
	cmp r0, r1
	strgt r1, [sp, #4]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, r7, #0xc
	bl sub_020D4A50
	cmp fp, #0
	ldrneh r0, [r7, #6]
	ldr r1, [sp, #0x30]
	strneh r0, [fp]
	cmp r1, #0
	ldrne r0, [r7, #8]
	strne r0, [r1]
	ldrsb r0, [r6, #0xfe]
	ldrh r8, [r7, #4]
	cmp r0, #0
	bne _020A1CF8
	ldr r0, [r7]
	ldr r1, _020A1D0C ; =_02110628
	str r0, [r6, #0x104]
	ldr r0, [r7]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r6, #0x100]
	ldr r1, [r1]
	mov r0, r7
	ldr r1, [r1, #0x1c]
	blx r1
	add r0, r6, #0x100
	ldrh r1, [r0, #8]
	sub r1, r1, r8
	strh r1, [r0, #8]
_020A1CF8:
	ldr r0, [sp, #8]
	bl sub_020D3A4C
	mov r0, r8
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A1D0C: .word _02110628
	arm_func_end sub_020A1BCC

	arm_func_start sub_020A1D10
sub_020A1D10: ; 0x020A1D10
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r2
	ldr r4, [r7, #0x64]
	mov sb, r0
	mov r8, r1
	bl sub_020D3A38
	add r1, r4, #0x100
	ldrh r2, [r1, #8]
	ldrh r1, [r1, #0xa]
	mov r6, r0
	add r0, r2, r8
	cmp r1, r0
	blo _020A1DD4
	ldr r1, _020A1E1C ; =_02110628
	add r0, r8, #0xc
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	blx r1
	movs r5, r0
	beq _020A1DC0
	add r1, r4, #0x100
	ldrh r3, [r1, #8]
	mov r2, #0
	mov r0, sb
	add r3, r3, r8
	strh r3, [r1, #8]
	str r2, [r5]
	strh r8, [r5, #4]
	ldrh r3, [r7, #0x18]
	mov r2, r8
	add r1, r5, #0xc
	strh r3, [r5, #6]
	ldr r3, [r7, #0x1c]
	str r3, [r5, #8]
	bl sub_020D4A50
	ldr r0, [r4, #0x100]
	cmp r0, #0
	ldrne r0, [r4, #0x100]
	strne r5, [r0]
	str r5, [r4, #0x100]
	ldr r0, [r4, #0x104]
	cmp r0, #0
	streq r5, [r4, #0x104]
	b _020A1DE4
_020A1DC0:
	ldr r0, _020A1E20 ; =0x021D4484
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	b _020A1DE4
_020A1DD4:
	ldr r0, _020A1E20 ; =0x021D4484
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
_020A1DE4:
	ldrh r0, [r7, #0x74]
	cmp r0, #0
	ldreqh r0, [r7, #0xa]
	streqh r0, [r7, #0x74]
	ldrh r1, [r7, #0x1a]
	add r0, r4, #0x10c
	strh r1, [r7, #0x18]
	ldr r1, [r7, #0x20]
	str r1, [r7, #0x1c]
	bl sub_020D1ECC
	mov r0, r6
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020A1E1C: .word _02110628
_020A1E20: .word 0x021D4484
	arm_func_end sub_020A1D10

	arm_func_start sub_020A1E24
sub_020A1E24: ; 0x020A1E24
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl sub_020A2E54
	cmp r0, #0
	addne sp, sp, #8
	mvnne r0, #0x1b
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r8, #0
	mov r1, #0
	beq _020A1E68
	ldrsh r0, [r8, #0x70]
	tst r0, #1
	movne r1, #1
_020A1E68:
	cmp r1, #0
	addeq sp, sp, #8
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrsb r0, [r8, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A1EB8
	ldrsh r0, [r8, #0x70]
	tst r0, #4
	beq _020A1EAC
	ldrsh r0, [r8, #0x70]
	tst r0, #8
	beq _020A1EB8
_020A1EAC:
	add sp, sp, #8
	mvn r0, #0x37
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A1EB8:
	ldr r0, [sp, #0x24]
	ldr r4, [r8, #0x68]
	tst r0, #4
	bne _020A1ED4
	ldrsb r0, [r8, #0x72]
	cmp r0, #0
	bne _020A1EF4
_020A1ED4:
	add r0, r4, #0xe0
	bl OS_TryLockMutex
	cmp r0, #0
	addeq sp, sp, #8
	mvneq r0, #5
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov ip, #0
	b _020A1F00
_020A1EF4:
	add r0, r4, #0xe0
	bl OS_LockMutex
	mov ip, #1
_020A1F00:
	ldr r1, [sp, #0x20]
	mov r0, r8
	str r1, [sp]
	mov r1, r7
	mov r2, r6
	mov r3, r5
	str ip, [sp, #4]
	bl sub_020A1F38
	mov r5, r0
	add r0, r4, #0xe0
	bl OS_UnlockMutex
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020A1E24

	arm_func_start sub_020A1F38
sub_020A1F38: ; 0x020A1F38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	ldr r4, [sl, #0x68]
	ldrsb r0, [sl, #0x73]
	ldr r4, [r4, #0x10c]
	mov sb, r1
	str r3, [sp, #0xc]
	cmp r0, #1
	mov r8, r2
	ldr r7, [sp, #0x40]
	ldr r6, [sp, #0x44]
	ldr r0, [r4, #0x48]
	mov r5, #0
	bne _020A1F90
	sub r0, r0, #0x2a
	cmp r8, r0
	addgt sp, sp, #0x18
	subgt r0, r5, #0x23
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str r8, [sp, #0x10]
	b _020A1FA0
_020A1F90:
	sub r0, r0, #0x36
	str r0, [sp, #0x10]
	cmp r8, r0
	strle r8, [sp, #0x10]
_020A1FA0:
	cmp r8, #0
	ble _020A2030
	and fp, r6, #1
_020A1FAC:
	ldr r2, [sp, #0x10]
	mov r0, sl
	mov r1, r8
	add r3, sp, #0x14
	str r6, [sp]
	bl sub_020A203C
	mov r4, r0
	cmp r4, #0
	ble _020A200C
	ldr r0, [sp, #0xc]
	mov r1, sb
	stmia sp, {r0, r7}
	str r6, [sp, #8]
	ldr r3, [sp, #0x14]
	mov r0, sl
	mov r2, r4
	bl sub_020A20E4
	cmp r0, #0
	addle sp, sp, #0x18
	mvnle r0, #5
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add sb, sb, r4
	sub r8, r8, r4
	add r5, r5, r4
_020A200C:
	cmp fp, #0
	bne _020A2028
	cmp r4, #0
	bgt _020A2030
	add sp, sp, #0x18
	mvn r0, #5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020A2028:
	cmp r8, #0
	bgt _020A1FAC
_020A2030:
	mov r0, r5
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020A1F38

	arm_func_start sub_020A203C
sub_020A203C: ; 0x020A203C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	cmp r8, sb
	mov r7, r3
	ldr r4, [sl, #0x68]
	movgt r8, sb
	bl sub_020D3A38
	ldr r1, [sp, #0x28]
	mov fp, r0
	and r6, r1, #1
_020A206C:
	mov r0, sl
	bl sub_020A20C0
	mov r5, r0
	cmp r5, r8
	blt _020A2098
	add r0, r4, #0x100
	ldrh r0, [r0]
	cmp r5, sb
	movge r5, sb
	str r0, [r7]
	b _020A20B0
_020A2098:
	cmp r6, #0
	moveq r5, #0
	beq _020A20B0
	add r0, r4, #0x104
	bl sub_020D1E7C
	b _020A206C
_020A20B0:
	mov r0, fp
	bl sub_020D3A4C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020A203C

	arm_func_start sub_020A20C0
sub_020A20C0: ; 0x020A20C0
	ldr r2, [r0, #0x68]
	add r0, r2, #0x100
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	ldr r2, [r2, #0xf8]
	sub r0, r0, r1
	subs r0, r0, #1
	addmi r0, r0, r2
	bx lr
	arm_func_end sub_020A20C0

	arm_func_start sub_020A20E4
sub_020A20E4: ; 0x020A20E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r4, [sb, #0x68]
	mov r6, r1
	mov r8, r2
	ldr r1, [r4, #0x10c]
	ldr r2, [sp, #0x28]
	ldr r0, _020A2254 ; =sub_020A2258
	mov r7, r3
	bl sub_020A0B7C
	movs r5, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [sp, #0x28]
	add r1, r7, r8
	tst r0, #1
	ldrnesb r0, [sb, #0x73]
	cmpne r0, #1
	movne r0, #3
	strneb r0, [r5, #0xd]
	moveq r0, #0
	streqb r0, [r5, #0xd]
	ldr r3, [r4, #0xfc]
	ldr r2, [r4, #0xf8]
	add r0, r3, r7
	cmp r1, r2
	str r0, [r5, #0x10]
	bge _020A216C
	str r8, [r5, #0x14]
	mov r0, #0
	str r0, [r5, #0x18]
	mov r7, r1
	str r0, [r5, #0x1c]
	b _020A2198
_020A216C:
	sub r0, r2, r7
	str r0, [r5, #0x14]
	str r3, [r5, #0x18]
	ldr r0, [r5, #0x14]
	sub r7, r8, r0
	str r7, [r5, #0x1c]
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	mov r2, r7
	add r0, r6, r0
	bl sub_020D4A50
_020A2198:
	ldr r1, [r5, #0x10]
	ldr r2, [r5, #0x14]
	mov r0, r6
	bl sub_020D4A50
	add r0, r4, #0x100
	ldrh r6, [r0]
	strh r7, [r5, #0x20]
	ldrh r1, [r5, #0x20]
	strh r1, [r0]
	ldrsb r0, [sb, #0x73]
	cmp r0, #1
	bne _020A2228
	ldrh r0, [sb, #0x74]
	cmp r0, #0
	bne _020A21E4
	bl sub_020A678C
	strh r0, [sb, #0x74]
	ldrh r0, [sb, #0x74]
	strh r0, [sb, #0xa]
_020A21E4:
	ldrh r0, [sb, #0x74]
	strh r0, [r5, #0x24]
	ldr r1, [sb, #0x78]
	cmp r1, #0
	beq _020A2204
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _020A2218
_020A2204:
	ldr r1, [sp, #0x24]
	ldrh r0, [sp, #0x20]
	str r1, [r5, #0x28]
	strh r0, [r5, #0x26]
	b _020A2230
_020A2218:
	str r1, [r5, #0x28]
	ldrh r0, [sb, #0x76]
	strh r0, [r5, #0x26]
	b _020A2230
_020A2228:
	mov r0, #0
	str r0, [r5, #0x28]
_020A2230:
	ldr r0, [r4, #0x10c]
	mov r1, r5
	bl sub_020A0CD4
	cmp r0, #0
	addne r0, r4, #0x100
	movne r8, #0
	strneh r6, [r0]
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020A2254: .word sub_020A2258
	arm_func_end sub_020A20E4

	arm_func_start sub_020A2258
sub_020A2258: ; 0x020A2258
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, r0
	ldr r5, [sb, #4]
	mov r7, #0
	ldrsb r0, [r5, #0x73]
	mov r1, #1
	ldr r6, [r5, #0x68]
	cmp r0, #0
	cmpne r0, #4
	movne r1, r7
	cmp r1, #0
	beq _020A2294
	ldrsh r0, [r5, #0x70]
	tst r0, #4
	beq _020A2368
_020A2294:
	ldr r2, [sb, #0x28]
	cmp r2, #0
	beq _020A22AC
	ldrh r0, [sb, #0x24]
	ldrh r1, [sb, #0x26]
	bl sub_020A68D0
_020A22AC:
	ldrsb r1, [r5, #0x73]
	mov r0, #1
	ldr r4, [r5, #0x4c]
	cmp r1, #0
	cmpne r1, #4
	movne r0, #0
	cmp r0, #0
	movne r8, #0x36
	moveq r8, #0x2a
	cmp r1, #0
	cmpne r1, #4
	ldrne r0, [r5, #0x48]
	subne sl, r0, r8
	bne _020A22F4
	ldr r0, [r5, #0x48]
	sub r0, r0, r8
	bl sub_020A2388
	mov sl, r0
_020A22F4:
	mov r1, sl
	mov r2, sb
	add r0, r4, r8
	bl sub_020A242C
	mov r1, r0
	cmp r1, #0
	ble _020A236C
	add r0, r4, r8
	bl sub_020A7260
	cmp r0, #0
	bgt _020A2360
	ldrsb r0, [r5, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A2358
	ldrsh r0, [r5, #0x70]
	bic r0, r0, #0xe
	strh r0, [r5, #0x70]
	ldrsh r0, [r5, #0x70]
	orr r0, r0, #0x80
	strh r0, [r5, #0x70]
	bl sub_020A6C00
_020A2358:
	mvn r7, #0x4b
	b _020A236C
_020A2360:
	add r7, r7, r0
	b _020A22F4
_020A2368:
	mvn r7, #0x4b
_020A236C:
	ldrh r2, [sb, #0x20]
	add r1, r6, #0x100
	add r0, r6, #0x104
	strh r2, [r1, #2]
	bl sub_020D1ECC
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020A2258

	arm_func_start sub_020A2388
sub_020A2388: ; 0x020A2388
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020A2424 ; =0x021E16A0
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r5, [r0, #0xa4]
	bl sub_020D3A38
	cmp r5, #0
	beq _020A23EC
	ldrh r3, [r5, #0x2e]
	cmp r3, #0
	ldrneh r2, [r5, #0x2c]
	cmpne r2, #0
	beq _020A23DC
	ldr r1, _020A2428 ; =0x021D4430
	cmp r3, r2
	ldr r1, [r1, #0x24]
	movgt r3, r2
	cmp r3, r1
	movgt r3, r1
	mov r5, r3, lsl #1
	b _020A23F8
_020A23DC:
	ldr r1, _020A2428 ; =0x021D4430
	ldr r1, [r1, #0x24]
	mov r5, r1, lsl #1
	b _020A23F8
_020A23EC:
	ldr r1, _020A2428 ; =0x021D4430
	ldr r1, [r1, #0x24]
	mov r5, r1, lsl #1
_020A23F8:
	bl sub_020D3A4C
	cmp r5, #0
	ble _020A241C
	mov r0, r4
	mov r1, r5
	bl sub_020F2998
	cmp r0, #0
	mulgt r0, r5, r0
	ldmgtia sp!, {r3, r4, r5, pc}
_020A241C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A2424: .word 0x021E16A0
_020A2428: .word 0x021D4430
	arm_func_end sub_020A2388

	arm_func_start sub_020A242C
sub_020A242C: ; 0x020A242C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	ldr r4, [r6, #0x14]
	ldr r5, [r6, #0x1c]
	cmp r4, r1
	mov r7, r0
	movgt r4, r1
	movgt r5, #0
	bgt _020A245C
	sub r0, r1, r4
	cmp r5, r0
	movgt r5, r0
_020A245C:
	cmp r4, #0
	ble _020A248C
	ldr r0, [r6, #0x10]
	mov r1, r7
	mov r2, r4
	bl sub_020D4A50
	ldr r0, [r6, #0x10]
	add r0, r0, r4
	str r0, [r6, #0x10]
	ldr r0, [r6, #0x14]
	sub r0, r0, r4
	str r0, [r6, #0x14]
_020A248C:
	cmp r5, #0
	ble _020A24BC
	ldr r0, [r6, #0x18]
	mov r2, r5
	add r1, r7, r4
	bl sub_020D4A50
	ldr r0, [r6, #0x18]
	add r0, r0, r5
	str r0, [r6, #0x18]
	ldr r0, [r6, #0x1c]
	sub r0, r0, r5
	str r0, [r6, #0x1c]
_020A24BC:
	add r0, r4, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020A242C

	arm_func_start sub_020A24C4
sub_020A24C4: ; 0x020A24C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_020A2E54
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	mov r1, #0
	beq _020A24F4
	ldrsh r0, [r4, #0x70]
	tst r0, #1
	movne r1, #1
_020A24F4:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r4, #0x70]
	tst r0, #4
	beq _020A2518
	ldrsh r0, [r4, #0x70]
	tst r0, #8
	beq _020A2520
_020A2518:
	mvn r0, #0x37
	ldmia sp!, {r3, r4, r5, pc}
_020A2520:
	ldrsh r0, [r4, #0x70]
	orr r0, r0, #8
	strh r0, [r4, #0x70]
	ldr r5, [r4, #0x68]
	cmp r5, #0
	ldrne r1, [r5, #0x10c]
	cmpne r1, #0
	beq _020A2564
	ldrsb r2, [r4, #0x72]
	ldr r0, _020A256C ; =sub_020A2570
	bl sub_020A0B7C
	movs r1, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x10c]
	bl sub_020A0CD4
	ldmia sp!, {r3, r4, r5, pc}
_020A2564:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A256C: .word sub_020A2570
	arm_func_end sub_020A24C4

	arm_func_start sub_020A2570
sub_020A2570: ; 0x020A2570
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #4]
	mov r1, #1
	ldrsb r0, [r0, #0x73]
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A2598
	bl sub_020A6BC4
_020A2598:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A2570

	arm_func_start sub_020A25A0
sub_020A25A0: ; 0x020A25A0
	stmdb sp!, {r4, lr}
	movs r4, r0
	bmi _020A25CC
	bl sub_020A2E54
	cmp r0, #0
	beq _020A25CC
	mov r0, r4
	bl sub_020A2E88
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_020A25CC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A25A0

	arm_func_start sub_020A25D4
sub_020A25D4: ; 0x020A25D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0
	mvnle r0, #0x1b
	ldmleia sp!, {r4, pc}
	bl sub_020A2E88
	cmp r0, #0
	mvnne r0, #0x19
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl sub_020A2E54
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	cmp r4, #0
	mov r1, #0
	beq _020A2624
	ldrsh r0, [r4, #0x70]
	tst r0, #1
	movne r1, #1
_020A2624:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0x70]
	tst r0, #0x10
	mvnne r0, #0x19
	ldmneia sp!, {r4, pc}
	ldrsh r0, [r4, #0x70]
	mov r1, #1
	orr r0, r0, #0x18
	strh r0, [r4, #0x70]
	ldrsb r0, [r4, #0x73]
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A2674
	ldr r0, [r4, #0x68]
	mov r1, #0
	bl sub_020A0BF0
_020A2674:
	ldr r0, _020A26A0 ; =sub_020A26A4
	mov r1, r4
	mov r2, #1
	bl sub_020A0B7C
	mov r1, r0
	mov r2, #0
	mov r0, r4
	str r2, [r1, #8]
	bl sub_020A0C3C
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A26A0: .word sub_020A26A4
	arm_func_end sub_020A25D4

	arm_func_start sub_020A26A4
sub_020A26A4: ; 0x020A26A4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r0, #4]
	mov r1, #1
	ldrsb r0, [r4, #0x73]
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A26E0
	ldr r0, [r4, #0x68]
	add r0, r0, #0x20
	bl sub_020D1E38
	bl sub_020A6BC4
	bl sub_020A6C00
	bl sub_020A6964
_020A26E0:
	bl sub_020A688C
	ldrsh r0, [r4, #0x70]
	mov r1, #0
	bic r0, r0, #6
	strh r0, [r4, #0x70]
	ldrsb r0, [r4, #0x73]
	cmp r0, #2
	ldreq r0, [r4, #0x68]
	ldrne r0, [r4, #0x64]
	bl sub_020A0BF0
	bl sub_020D3A38
	mov r5, r0
	mov r0, r4
	bl sub_020A2DDC
	mov r0, r4
	bl sub_020A2DC4
	mov r0, r5
	bl sub_020D3A4C
	ldrsh r1, [r4, #0x70]
	mov r0, #0
	orr r1, r1, #0x20
	strh r1, [r4, #0x70]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A26A4

	arm_func_start sub_020A273C
sub_020A273C: ; 0x020A273C
	stmdb sp!, {r4, r5, r6, lr}
	movs r4, r0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	strh r0, [r4, #0x70]
	ldrsb r2, [r4, #0x73]
	mov r1, #1
	cmp r2, #0
	cmpne r2, #4
	movne r1, r0
	cmp r1, #0
	beq _020A2780
	ldr r0, [r4, #0x68]
	bl sub_020A283C
	ldr r0, [r4, #0x64]
	bl sub_020A283C
	b _020A2800
_020A2780:
	cmp r2, #1
	bne _020A27F0
	ldr r0, [r4, #0x64]
	ldr r0, [r0, #0x104]
	cmp r0, #0
	beq _020A27B8
	ldr r5, _020A2838 ; =_02110628
_020A279C:
	ldr r1, [r5]
	ldr r6, [r0]
	ldr r1, [r1, #0x1c]
	blx r1
	mov r0, r6
	cmp r6, #0
	bne _020A279C
_020A27B8:
	ldr r0, [r4, #0x64]
	mov r1, #0
	add r0, r0, #0x100
	strh r1, [r0, #8]
	ldr r0, [r4, #0x64]
	str r1, [r0, #0x100]
	ldr r0, [r4, #0x64]
	str r1, [r0, #0x104]
	ldr r0, [r4, #0x64]
	add r0, r0, #0x10c
	bl sub_020D1ECC
	ldr r0, [r4, #0x64]
	bl sub_020A283C
	b _020A2800
_020A27F0:
	cmp r2, #2
	bne _020A2800
	ldr r0, [r4, #0x68]
	bl sub_020A283C
_020A2800:
	bl sub_020D3A38
	mov r5, r0
	mov r0, r4
	bl sub_020A2DDC
	mov r0, r4
	bl sub_020A2E3C
	ldr r1, _020A2838 ; =_02110628
	mov r0, r4
	ldr r1, [r1]
	ldr r1, [r1, #0x1c]
	blx r1
	mov r0, r5
	bl sub_020D3A4C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A2838: .word _02110628
	arm_func_end sub_020A273C

	arm_func_start sub_020A283C
sub_020A283C: ; 0x020A283C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs sb, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, sb, #0x20
	bl sub_020D1E38
	bl sub_020D3A38
	mov r8, r0
	bl sub_020D21FC
	add r1, sp, #0
	mov r0, sb
	mov r2, #0
	bl sub_020D2444
	cmp r0, #0
	beq _020A28C8
	mov r6, #0
	mvn r7, #0xa
	add r5, sp, #0
	mov r4, r6
_020A2884:
	ldr r0, [sp]
	cmp r0, #0
	beq _020A28B0
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _020A28A8
	mov r1, r7
	mov r2, r6
	bl sub_020D23B0
_020A28A8:
	ldr r0, [sp]
	bl sub_020A0BBC
_020A28B0:
	mov r0, sb
	mov r1, r5
	mov r2, r4
	bl sub_020D2444
	cmp r0, #0
	bne _020A2884
_020A28C8:
	bl sub_020D2230
	bl sub_020D1F84
	mov r0, r8
	bl sub_020D3A4C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020A283C

	arm_func_start sub_020A28DC
sub_020A28DC: ; 0x020A28DC
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_020D3A38
	ldr r4, _020A2914 ; =0x021D4490
	mov r5, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _020A2908
_020A28F8:
	bl sub_020A273C
	ldr r0, [r4]
	cmp r0, #0
	bne _020A28F8
_020A2908:
	mov r0, r5
	bl sub_020D3A4C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A2914: .word 0x021D4490
	arm_func_end sub_020A28DC

	arm_func_start sub_020A2918
sub_020A2918: ; 0x020A2918
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020A29AC ; =0x021D4424
	ldr r0, [r1]
	cmp r0, #0
	ldreq r0, _020A29B0 ; =0x021D4670
	ldreq r0, [r0]
	streq r0, [r1]
	bl sub_020A2A64
	mvn r4, #0x19
	cmp r0, r4
	bne _020A295C
	mov r5, #0x64
_020A2948:
	mov r0, r5
	bl sub_020D2108
	bl sub_020A2A64
	cmp r0, r4
	beq _020A2948
_020A295C:
	bl sub_020A0B0C
	movs r4, r0
	bmi _020A29A4
	bl sub_020A3C48
	mov r0, #0
	bl sub_020A3C38
	ldr r0, _020A29B4 ; =_02110628
	ldr r1, [r0]
	ldr r0, [r1, #0x28]
	cmp r0, #0
	bne _020A2998
	ldr r0, _020A29B8 ; =0x021D4430
	ldr r1, [r1, #0x1c]
	ldr r0, [r0, #0x1c]
	blx r1
_020A2998:
	ldr r0, _020A29B4 ; =_02110628
	mov r1, #0
	str r1, [r0]
_020A29A4:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A29AC: .word 0x021D4424
_020A29B0: .word 0x021D4670
_020A29B4: .word _02110628
_020A29B8: .word 0x021D4430
	arm_func_end sub_020A2918

	arm_func_start sub_020A29BC
sub_020A29BC: ; 0x020A29BC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _020A2A58 ; =0x021D442C
	ldr r5, _020A2A5C ; =0x021D448C
_020A29C8:
	bl sub_020D3A38
	ldr r6, [r5]
	cmp r6, #0
	beq _020A29FC
	ldr r2, [r4]
_020A29DC:
	cmp r6, r2
	beq _020A29F0
	ldrsh r1, [r6, #0x70]
	tst r1, #0x10
	beq _020A29FC
_020A29F0:
	ldr r6, [r6, #0x7c]
	cmp r6, #0
	bne _020A29DC
_020A29FC:
	bl sub_020D3A4C
	cmp r6, #0
	beq _020A2A14
	mov r0, r6
	bl sub_020A25D4
	b _020A29C8
_020A2A14:
	ldr r0, _020A2A5C ; =0x021D448C
	ldr r1, [r0]
	cmp r1, #0
	beq _020A2A3C
	ldr r0, _020A2A58 ; =0x021D442C
	ldr r0, [r0]
	cmp r1, r0
	ldreq r0, [r1, #0x7c]
	cmpeq r0, #0
	bne _020A2A50
_020A2A3C:
	ldr r0, _020A2A60 ; =0x021D4490
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
_020A2A50:
	mvn r0, #0x19
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A2A58: .word 0x021D442C
_020A2A5C: .word 0x021D448C
_020A2A60: .word 0x021D4490
	arm_func_end sub_020A29BC

	arm_func_start sub_020A2A64
sub_020A2A64: ; 0x020A2A64
	stmdb sp!, {r4, lr}
	ldr r0, _020A2ADC ; =0x021D442C
	ldr r0, [r0]
	cmp r0, #0
	beq _020A2AB8
	bl sub_020A29BC
	movs r4, r0
	bne _020A2AB0
	ldr r0, _020A2ADC ; =0x021D442C
	ldr r0, [r0]
	bl sub_020A25D4
	ldr r0, _020A2ADC ; =0x021D442C
	ldr r0, [r0]
	bl sub_020A25A0
	cmp r0, #0
	ldrne r0, _020A2ADC ; =0x021D442C
	movne r1, #0
	strne r1, [r0]
	mvn r4, #0x19
_020A2AB0:
	bl sub_020A28DC
	b _020A2AD4
_020A2AB8:
	bl sub_020A3BE8
	cmp r0, #0
	mvneq r4, #0x19
	beq _020A2AD4
	mov r0, #0
	bl sub_020AFFC4
	mov r4, #0
_020A2AD4:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A2ADC: .word 0x021D442C
	arm_func_end sub_020A2A64

	arm_func_start sub_020A2AE0
sub_020A2AE0: ; 0x020A2AE0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x64
	movs r5, r0
	addeq sp, sp, #0x64
	moveq r0, #0
	ldmeqia sp!, {r4, r5, pc}
	ldr r1, _020A2B84 ; =_02110628
	mov r0, #0xfd0
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	blx r1
	movs r4, r0
	addeq sp, sp, #0x64
	moveq r0, #0
	ldmeqia sp!, {r4, r5, pc}
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x64
	bl sub_020D4994
	add r0, r4, #0x368
	add r2, r0, #0x800
	ldr r3, _020A2B88 ; =0x00000B68
	ldr r1, _020A2B8C ; =0x00000466
	add r0, sp, #0
	str r4, [sp, #0x40]
	str r3, [sp, #0x3c]
	str r2, [sp, #0x4c]
	str r1, [sp, #0x48]
	bl sub_020A6878
	mov r0, r5
	bl sub_020A8460
	mov r5, r0
	bl sub_020A688C
	ldr r1, _020A2B84 ; =_02110628
	mov r0, r4
	ldr r1, [r1]
	ldr r1, [r1, #0x1c]
	blx r1
	mov r0, r5
	add sp, sp, #0x64
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020A2B84: .word _02110628
_020A2B88: .word 0x00000B68
_020A2B8C: .word 0x00000466
	arm_func_end sub_020A2AE0

	arm_func_start sub_020A2B90
sub_020A2B90: ; 0x020A2B90
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	bl sub_020D3A38
	ldr r1, _020A2BD8 ; =0x021D4680
	mov r5, r0
	ldmia r1, {r6, r7}
	mov r2, #0
	str r2, [r1]
	mov r0, r4
	str r2, [r1, #4]
	bl sub_020A8460
	ldr r1, _020A2BD8 ; =0x021D4680
	mov r4, r0
	mov r0, r5
	stmia r1, {r6, r7}
	bl sub_020D3A4C
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A2BD8: .word 0x021D4680
	arm_func_end sub_020A2B90

	arm_func_start sub_020A2BDC
sub_020A2BDC: ; 0x020A2BDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020A2C10
	cmp r0, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _020A2C0C ; =0x021D4680
	mov r0, #0
	str r5, [r1]
	str r4, [r1, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A2C0C: .word 0x021D4680
	arm_func_end sub_020A2BDC

	arm_func_start sub_020A2C10
sub_020A2C10: ; 0x020A2C10
	stmdb sp!, {r3, lr}
	ldr r0, _020A2C6C ; =0x021D4670
	ldr r2, [r0]
	cmp r2, #0
	bne _020A2C50
	ldr r0, _020A2C70 ; =0x021D4428
	ldr r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _020A2C60
	bl sub_020D3A9C
	cmp r0, #0x12
	beq _020A2C60
	mov r0, #0xa
	bl sub_020D2108
	b _020A2C60
_020A2C50:
	ldr r0, _020A2C74 ; =0x021D4424
	ldr r1, [r0]
	cmp r1, #0
	streq r2, [r0]
_020A2C60:
	ldr r0, _020A2C6C ; =0x021D4670
	ldr r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A2C6C: .word 0x021D4670
_020A2C70: .word 0x021D4428
_020A2C74: .word 0x021D4424
	arm_func_end sub_020A2C10

	arm_func_start sub_020A2C78
sub_020A2C78: ; 0x020A2C78
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r5, r0
	bl sub_020A2E54
	cmp r0, #0
	orrne r4, r4, #0x80
	bne _020A2D40
	ldrsh r0, [r5, #0x70]
	tst r0, #0x40
	ldrsb r0, [r5, #0x73]
	orrne r4, r4, #0x20
	cmp r0, #1
	beq _020A2CB8
	ldrsh r0, [r5, #0x70]
	tst r0, #4
	beq _020A2CE8
_020A2CB8:
	bl sub_020D3A38
	mov r6, r0
	mov r0, r5
	bl sub_020A2D48
	cmp r0, #0
	mov r0, r5
	orrgt r4, r4, #1
	bl sub_020A20C0
	cmp r0, #0
	mov r0, r6
	orrgt r4, r4, #8
	bl sub_020D3A4C
_020A2CE8:
	ldrsb r0, [r5, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A2D40
	ldrsh r0, [r5, #0x70]
	tst r0, #4
	ldrneb r0, [r5, #8]
	cmpne r0, #4
	beq _020A2D28
	tst r4, #1
	ldreqsh r0, [r5, #0x70]
	biceq r0, r0, #6
	streqh r0, [r5, #0x70]
_020A2D28:
	ldrsh r0, [r5, #0x70]
	tst r0, #2
	bne _020A2D40
	ldrsh r0, [r5, #0x70]
	tst r0, #4
	orreq r4, r4, #0x40
_020A2D40:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A2C78

	arm_func_start sub_020A2D48
sub_020A2D48: ; 0x020A2D48
	ldr r2, [r0, #0x64]
	mov r3, #0
	cmp r2, #0
	beq _020A2D88
	ldrsb r1, [r0, #0x73]
	cmp r1, #1
	bne _020A2D74
	ldr r0, [r2, #0x104]
	cmp r0, #0
	ldrneh r3, [r0, #4]
	b _020A2D88
_020A2D74:
	cmp r1, #0
	cmpne r1, #4
	ldreq r1, [r0, #0x44]
	ldreq r0, [r2, #0xf8]
	subeq r3, r1, r0
_020A2D88:
	mov r0, r3
	bx lr
	arm_func_end sub_020A2D48

	arm_func_start sub_020A2D90
sub_020A2D90: ; 0x020A2D90
	add r0, r0, #3
	bic r0, r0, #3
	bx lr
	arm_func_end sub_020A2D90

	arm_func_start sub_020A2D9C
sub_020A2D9C: ; 0x020A2D9C
	ldr ip, _020A2DAC ; =sub_020A2DB4
	mov r1, r0
	ldr r0, _020A2DB0 ; =0x021D448C
	bx ip
	.align 2, 0
_020A2DAC: .word sub_020A2DB4
_020A2DB0: .word 0x021D448C
	arm_func_end sub_020A2D9C

	arm_func_start sub_020A2DB4
sub_020A2DB4: ; 0x020A2DB4
	ldr r2, [r0]
	str r2, [r1, #0x7c]
	str r1, [r0]
	bx lr
	arm_func_end sub_020A2DB4

	arm_func_start sub_020A2DC4
sub_020A2DC4: ; 0x020A2DC4
	ldr ip, _020A2DD4 ; =sub_020A2DB4
	mov r1, r0
	ldr r0, _020A2DD8 ; =0x021D4490
	bx ip
	.align 2, 0
_020A2DD4: .word sub_020A2DB4
_020A2DD8: .word 0x021D4490
	arm_func_end sub_020A2DC4

	arm_func_start sub_020A2DDC
sub_020A2DDC: ; 0x020A2DDC
	ldr ip, _020A2DEC ; =sub_020A2DF4
	mov r1, r0
	ldr r0, _020A2DF0 ; =0x021D448C
	bx ip
	.align 2, 0
_020A2DEC: .word sub_020A2DF4
_020A2DF0: .word 0x021D448C
	arm_func_end sub_020A2DDC

	arm_func_start sub_020A2DF4
sub_020A2DF4: ; 0x020A2DF4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_020A2E10
	cmp r0, #0
	ldrne r1, [r4, #0x7c]
	strne r1, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A2DF4

	arm_func_start sub_020A2E10
sub_020A2E10: ; 0x020A2E10
	ldr r2, [r0]
	cmp r2, #0
	beq _020A2E34
_020A2E1C:
	cmp r2, r1
	bxeq lr
	add r0, r2, #0x7c
	ldr r2, [r2, #0x7c]
	cmp r2, #0
	bne _020A2E1C
_020A2E34:
	mov r0, #0
	bx lr
	arm_func_end sub_020A2E10

	arm_func_start sub_020A2E3C
sub_020A2E3C: ; 0x020A2E3C
	ldr ip, _020A2E4C ; =sub_020A2DF4
	mov r1, r0
	ldr r0, _020A2E50 ; =0x021D4490
	bx ip
	.align 2, 0
_020A2E4C: .word sub_020A2DF4
_020A2E50: .word 0x021D4490
	arm_func_end sub_020A2E3C

	arm_func_start sub_020A2E54
sub_020A2E54: ; 0x020A2E54
	stmdb sp!, {r3, lr}
	mov r1, r0
	cmp r1, #0
	ble _020A2E74
	ldr r0, _020A2E84 ; =0x021D448C
	bl sub_020A2E10
	cmp r0, #0
	bne _020A2E7C
_020A2E74:
	mov r0, #1
	ldmia sp!, {r3, pc}
_020A2E7C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A2E84: .word 0x021D448C
	arm_func_end sub_020A2E54

	arm_func_start sub_020A2E88
sub_020A2E88: ; 0x020A2E88
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _020A2EA8 ; =0x021D4490
	bl sub_020A2E10
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A2EA8: .word 0x021D4490
	arm_func_end sub_020A2E88

	arm_func_start sub_020A2EAC
sub_020A2EAC: ; 0x020A2EAC
	stmdb sp!, {r3, lr}
	cmp r1, #1
	bne _020A2EC4
	ldr r0, _020A2ED0 ; =_02110648
	bl sub_020A0DAC
	ldmia sp!, {r3, pc}
_020A2EC4:
	ldr r0, _020A2ED4 ; =_02110630
	bl sub_020A0DAC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A2ED0: .word _02110648
_020A2ED4: .word _02110630
	arm_func_end sub_020A2EAC

	arm_func_start sub_020A2ED8
sub_020A2ED8: ; 0x020A2ED8
	ldrh r1, [r1, #2]
	ldr ip, _020A2F00 ; =sub_020A1390
	mov r2, r1, asr #8
	mov r1, r1, lsl #8
	and r2, r2, #0xff
	and r1, r1, #0xff00
	orr r1, r2, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bx ip
	.align 2, 0
_020A2F00: .word sub_020A1390
	arm_func_end sub_020A2ED8

	arm_func_start sub_020A2F04
sub_020A2F04: ; 0x020A2F04
	stmdb sp!, {r4, lr}
	ldrh r2, [r1, #2]
	ldr lr, [r1, #4]
	mov r4, r2, asr #8
	mov r1, r2, lsl #8
	mov r3, lr, lsr #0x18
	mov r2, lr, lsr #8
	mov ip, lr, lsl #8
	mov lr, lr, lsl #0x18
	and r4, r4, #0xff
	and r1, r1, #0xff00
	orr r1, r4, r1
	mov r1, r1, lsl #0x10
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	mov r1, r1, lsr #0x10
	orr r2, r3, r2
	bl sub_020A1400
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A2F04

	arm_func_start sub_020A2F60
sub_020A2F60: ; 0x020A2F60
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov ip, #0
	str ip, [sp]
	str r3, [sp, #4]
	mov r3, ip
	bl sub_020A15C4
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A2F60

	arm_func_start sub_020A2F84
sub_020A2F84: ; 0x020A2F84
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	add ip, sp, #0xc
	str ip, [sp]
	str r3, [sp, #4]
	add r3, sp, #8
	bl sub_020A15C4
	cmp r0, #0
	addlt sp, sp, #0x10
	ldmltia sp!, {r3, pc}
	ldr r1, [sp, #0x18]
	cmp r1, #0
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, pc}
	ldrh r2, [sp, #8]
	mov r3, r2, asr #8
	mov r2, r2, lsl #8
	and r3, r3, #0xff
	and r2, r2, #0xff00
	orr r2, r3, r2
	strh r2, [r1, #2]
	ldr lr, [sp, #0xc]
	mov r3, lr, lsr #0x18
	mov r2, lr, lsr #8
	mov ip, lr, lsl #8
	mov lr, lr, lsl #0x18
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	orr r2, r3, r2
	str r2, [r1, #4]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A2F84

	arm_func_start sub_020A3014
sub_020A3014: ; 0x020A3014
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov ip, #0
	str ip, [sp]
	str r3, [sp, #4]
	mov r3, ip
	bl sub_020A1E24
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A3014

	arm_func_start sub_020A3038
sub_020A3038: ; 0x020A3038
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r5, [sp, #0x20]
	cmp r5, #0
	moveq r5, #0
	moveq r4, r5
	beq _020A30A4
	ldrh r4, [r5, #2]
	ldr r6, [r5, #4]
	mov r7, r4, asr #8
	mov ip, r4, lsl #8
	mov r4, r6, lsr #0x18
	mov lr, r6, lsr #8
	mov r5, r6, lsl #8
	mov r6, r6, lsl #0x18
	and r7, r7, #0xff
	and ip, ip, #0xff00
	orr r7, r7, ip
	and r4, r4, #0xff
	and lr, lr, #0xff00
	and r5, r5, #0xff0000
	orr r4, r4, lr
	mov ip, r7, lsl #0x10
	orr r4, r5, r4
	and r6, r6, #0xff000000
	mov r5, ip, lsr #0x10
	orr r4, r6, r4
_020A30A4:
	str r4, [sp]
	str r3, [sp, #4]
	mov r3, r5
	bl sub_020A1E24
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020A3038

	arm_func_start sub_020A30BC
sub_020A30BC: ; 0x020A30BC
	ldr ip, _020A30C4 ; =sub_020A24C4
	bx ip
	.align 2, 0
_020A30C4: .word sub_020A24C4
	arm_func_end sub_020A30BC

	arm_func_start sub_020A30C8
sub_020A30C8: ; 0x020A30C8
	ldr ip, _020A30D0 ; =sub_020A25D4
	bx ip
	.align 2, 0
_020A30D0: .word sub_020A25D4
	arm_func_end sub_020A30C8

	arm_func_start sub_020A30D4
sub_020A30D4: ; 0x020A30D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020A2AE0
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _020A317C ; =0x021D451C
	ldr r2, _020A3180 ; =0x00000101
	mov r1, #0
	bl sub_020D4994
	ldr r0, _020A317C ; =0x021D451C
	ldr r2, _020A3180 ; =0x00000101
	mov r1, r5
	bl sub_020E3D74
	mov r3, r4, lsr #0x18
	mov r2, r4, lsr #8
	mov ip, r4, lsl #8
	mov lr, r4, lsl #0x18
	ldr r4, _020A317C ; =0x021D451C
	ldr r1, _020A3184 ; =0x021D4494
	mov r0, #0
	str r4, [r1, #0x20]
	str r0, [r1, #0x24]
	mov r4, #2
	strh r4, [r1, #0x28]
	mov r4, #4
	ldr r5, _020A3188 ; =0x021D44AC
	strh r4, [r1, #0x2a]
	and r3, r3, #0xff
	and r2, r2, #0xff00
	ldr r4, _020A318C ; =0x021D4494
	str r5, [r1, #0x2c]
	str r4, [r1, #0x18]
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	str r0, [r1, #0x1c]
	orr r2, r3, r2
	ldr r0, _020A3190 ; =0x021D44B4
	str r2, [r1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A317C: .word 0x021D451C
_020A3180: .word 0x00000101
_020A3184: .word 0x021D4494
_020A3188: .word 0x021D44AC
_020A318C: .word 0x021D4494
_020A3190: .word 0x021D44B4
	arm_func_end sub_020A30D4

	arm_func_start sub_020A3194
sub_020A3194: ; 0x020A3194
	stmdb sp!, {r4, r5, r6, lr}
	movs r5, r0
	mov r4, r1
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, pc}
	bl sub_020A2C10
	cmp r5, #0
	ldrneh r1, [r5, #0x74]
	mov r2, r0, lsr #0x18
	mov r6, #8
	moveq r1, #0
	cmp r0, #0
	moveq r1, #0
	mov r1, r1, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r5, r3, asr #8
	mov lr, r3, lsl #8
	strb r6, [r4]
	mov r6, #2
	mov r1, r0, lsr #8
	mov r3, r0, lsl #8
	mov ip, r0, lsl #0x18
	and r0, r1, #0xff00
	and r2, r2, #0xff
	orr r0, r2, r0
	and r1, r3, #0xff0000
	and r5, r5, #0xff
	and lr, lr, #0xff00
	strb r6, [r4, #1]
	orr r3, r5, lr
	and r2, ip, #0xff000000
	orr r0, r1, r0
	strh r3, [r4, #2]
	orr r0, r2, r0
	str r0, [r4, #4]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A3194

	arm_func_start sub_020A3228
sub_020A3228: ; 0x020A3228
	stmdb sp!, {r3, lr}
	bl sub_020A2C10
	mov r2, r0, lsr #0x18
	mov r1, r0, lsr #8
	mov r3, r0, lsl #8
	mov ip, r0, lsl #0x18
	and r2, r2, #0xff
	and r0, r1, #0xff00
	and r1, r3, #0xff0000
	orr r0, r2, r0
	and r2, ip, #0xff000000
	orr r0, r1, r0
	orr r0, r2, r0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A3228

	arm_func_start sub_020A3260
sub_020A3260: ; 0x020A3260
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [r1]
	ldr r0, [r0]
	mov r2, ip, lsr #0x18
	mov r4, r0, lsr #0x18
	mov lr, r0, lsr #8
	mov r1, ip, lsr #8
	mov r5, r0, lsl #8
	mov r3, ip, lsl #8
	mov r0, r0, lsl #0x18
	mov ip, ip, lsl #0x18
	and r4, r4, #0xff
	and lr, lr, #0xff00
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r5, r5, #0xff0000
	orr r4, r4, lr
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and lr, r0, #0xff000000
	orr r0, r5, r4
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r0, lr, r0
	orr r1, r2, r1
	bl sub_020A2BDC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A3260

	arm_func_start sub_020A32CC
sub_020A32CC: ; 0x020A32CC
	ldr ip, _020A32D4 ; =sub_020A1104
	bx ip
	.align 2, 0
_020A32D4: .word sub_020A1104
	arm_func_end sub_020A32CC

	arm_func_start sub_020A32D8
sub_020A32D8: ; 0x020A32D8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r1
	add r1, sp, #0
	add r2, sp, #4
	bl sub_020A1184
	cmp r0, #0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldrh r1, [sp]
	mov r2, r1, asr #8
	mov r1, r1, lsl #8
	and r2, r2, #0xff
	and r1, r1, #0xff00
	orr r1, r2, r1
	strh r1, [r4, #2]
	ldr ip, [sp, #4]
	mov r2, ip, lsr #0x18
	mov r1, ip, lsr #8
	mov r3, ip, lsl #8
	mov ip, ip, lsl #0x18
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r1, r2, r1
	str r1, [r4, #4]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A32D8

	arm_func_start sub_020A3354
sub_020A3354: ; 0x020A3354
	cmp r0, #0
	mvneq r0, #0
	bxeq lr
	cmp r1, #3
	beq _020A3374
	cmp r1, #4
	beq _020A3388
	b _020A339C
_020A3374:
	ldrsb r0, [r0, #0x72]
	cmp r0, #1
	moveq r0, #0
	movne r0, #4
	bx lr
_020A3388:
	tst r2, #4
	movne r1, #0
	strneb r1, [r0, #0x72]
	moveq r1, #1
	streqb r1, [r0, #0x72]
_020A339C:
	mov r0, #0
	bx lr
	arm_func_end sub_020A3354

	arm_func_start sub_020A33A4
sub_020A33A4: ; 0x020A33A4
	stmdb sp!, {r4, lr}
	ldr r1, _020A33CC ; =0x021D4494
	add r4, r0, #4
	ldr r2, [r1, #0xc]
	mov r1, r4
	mov r0, #0
	blx r2
	cmp r0, #0
	strne r4, [r0], #4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A33CC: .word 0x021D4494
	arm_func_end sub_020A33A4

	arm_func_start sub_020A33D0
sub_020A33D0: ; 0x020A33D0
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _020A33F8 ; =0x021D4494
	ldr r2, [r0, #-4]
	ldr r3, [r1, #4]
	sub r1, r0, #4
	mov r0, #0
	blx r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A33F8: .word 0x021D4494
	arm_func_end sub_020A33D0

	arm_func_start sub_020A33FC
sub_020A33FC: ; 0x020A33FC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, [r0, #0xc]
	ldr ip, _020A3560 ; =sub_020A33A4
	cmp r1, #1
	moveq r2, #1
	ldr r1, _020A3564 ; =0x021D4494
	movne r2, #0
	str r2, [r1, #0x40]
	ldr r6, [r0, #0x10]
	ldr r3, _020A3568 ; =sub_020A33D0
	mov r4, r6, lsr #0x18
	mov r2, r6, lsr #8
	mov r5, r6, lsl #8
	and r4, r4, #0xff
	and r2, r2, #0xff00
	mov r6, r6, lsl #0x18
	orr r2, r4, r2
	and r5, r5, #0xff0000
	and r4, r6, #0xff000000
	orr r2, r5, r2
	orr r2, r4, r2
	str r2, [r1, #0x44]
	ldr lr, [r0, #0x14]
	mov r2, #0x40
	mov r5, lr, lsr #0x18
	mov r4, lr, lsr #8
	mov r6, lr, lsl #8
	and r5, r5, #0xff
	and r4, r4, #0xff00
	mov lr, lr, lsl #0x18
	orr r4, r5, r4
	and r6, r6, #0xff0000
	and r5, lr, #0xff000000
	orr r4, r6, r4
	orr r4, r5, r4
	str r4, [r1, #0x48]
	ldr lr, [r0, #0x18]
	mov r5, lr, lsr #0x18
	mov r4, lr, lsr #8
	mov r6, lr, lsl #8
	and r5, r5, #0xff
	and r4, r4, #0xff00
	mov lr, lr, lsl #0x18
	orr r4, r5, r4
	and r6, r6, #0xff0000
	and r5, lr, #0xff000000
	orr r4, r6, r4
	orr r4, r5, r4
	str r4, [r1, #0x4c]
	ldr lr, [r0, #0x1c]
	mov r5, lr, lsr #0x18
	mov r4, lr, lsr #8
	mov r6, lr, lsl #8
	and r5, r5, #0xff
	and r4, r4, #0xff00
	mov lr, lr, lsl #0x18
	orr r4, r5, r4
	and r6, r6, #0xff0000
	and r5, lr, #0xff000000
	orr r4, r6, r4
	orr r4, r5, r4
	str r4, [r1, #0x50]
	ldr r6, [r0, #0x20]
	mov r4, r6, lsr #0x18
	mov lr, r6, lsr #8
	mov r5, r6, lsl #8
	mov r6, r6, lsl #0x18
	and r4, r4, #0xff
	and lr, lr, #0xff00
	and r5, r5, #0xff0000
	orr r4, r4, lr
	and r6, r6, #0xff000000
	orr r4, r5, r4
	orr r4, r6, r4
	str r4, [r1, #0x54]
	str ip, [r1, #0x58]
	str r3, [r1, #0x5c]
	ldr r3, [r0, #4]
	str r3, [r1, #0xc]
	ldr r3, [r0, #8]
	str r3, [r1, #4]
	str r2, [r1, #0x60]
	ldr r2, [r0, #0x2c]
	str r2, [r1, #0x70]
	ldr r2, [r0, #0x30]
	ldr r0, _020A356C ; =0x021D44D4
	str r2, [r1, #0x74]
	bl sub_020A0804
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A3560: .word sub_020A33A4
_020A3564: .word 0x021D4494
_020A3568: .word sub_020A33D0
_020A356C: .word 0x021D44D4
	arm_func_end sub_020A33FC

	arm_func_start sub_020A3570
sub_020A3570: ; 0x020A3570
	ldr ip, _020A3578 ; =sub_020A2918
	bx ip
	.align 2, 0
_020A3578: .word sub_020A2918
	arm_func_end sub_020A3570

	arm_func_start sub_020A357C
sub_020A357C: ; 0x020A357C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	ldr r2, _020A35A8 ; =0x021D450C
	add r1, sp, #8
	mov r0, #2
	mov r3, #0x10
	bl sub_020A35FC
	ldr r0, _020A35A8 ; =0x021D450C
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020A35A8: .word 0x021D450C
	arm_func_end sub_020A357C

	arm_func_start sub_020A35AC
sub_020A35AC: ; 0x020A35AC
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_020A2B90
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r2, r0, lsr #0x18
	mov r1, r0, lsr #8
	mov r3, r0, lsl #8
	mov ip, r0, lsl #0x18
	and r2, r2, #0xff
	and r0, r1, #0xff00
	and r1, r3, #0xff0000
	orr r0, r2, r0
	and r2, ip, #0xff000000
	orr r0, r1, r0
	orr r0, r2, r0
	str r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A35AC

	arm_func_start sub_020A35FC
sub_020A35FC: ; 0x020A35FC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	cmp r0, #2
	mov r4, r2
	addne sp, sp, #0x14
	movne r0, #0
	ldmneia sp!, {r3, r4, pc}
	cmp r3, #0x10
	addlo sp, sp, #0x14
	movlo r0, #0
	ldmloia sp!, {r3, r4, pc}
	mov r0, r1
	add r1, sp, #0x10
	mov r2, #4
	bl sub_020D4A50
	ldr r0, [sp, #0x10]
	add r1, sp, #0xc
	bl sub_020A3680
	ldrb r1, [sp, #0xe]
	ldr r2, _020A367C ; =_02110678
	mov r0, r4
	str r1, [sp]
	ldrb r3, [sp, #0xd]
	mov r1, #0x10
	str r3, [sp, #4]
	ldrb r3, [sp, #0xc]
	str r3, [sp, #8]
	ldrb r3, [sp, #0xf]
	bl sub_020D168C
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020A367C: .word _02110678
	arm_func_end sub_020A35FC

	arm_func_start sub_020A3680
sub_020A3680: ; 0x020A3680
	mov r2, r0, lsr #0x18
	strb r2, [r1]
	mov r2, r0, lsr #0x10
	strb r2, [r1, #1]
	mov r2, r0, lsr #8
	strb r2, [r1, #2]
	strb r0, [r1, #3]
	bx lr
	arm_func_end sub_020A3680

	arm_func_start sub_020A36A0
sub_020A36A0: ; 0x020A36A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r2
	mov r8, r3
	mvn r2, #0
	cmp r8, r2
	cmpeq sb, r2
	movne fp, #1
	str r0, [sp]
	mov sl, r1
	moveq fp, #0
_020A36C8:
	mov r6, #0
	ldr r4, [sp]
	mov r5, r6
	cmp sl, #0
	bls _020A3708
_020A36DC:
	ldrsh r1, [r4, #4]
	ldr r0, [r4]
	orr r7, r1, #0xe0
	bl sub_020A2C78
	ands r0, r7, r0
	strh r0, [r4, #6]
	add r5, r5, #1
	addne r6, r6, #1
	add r4, r4, #8
	cmp r5, sl
	blo _020A36DC
_020A3708:
	cmp r6, #0
	bgt _020A3748
	cmp fp, #0
	beq _020A372C
	mov r0, #0
	subs r0, r0, sb
	mov r0, #0
	sbcs r0, r0, r8
	bge _020A3748
_020A372C:
	mov r0, #1
	bl sub_020D2108
	ldr r0, _020A3750 ; =0x0000020B
	subs sb, sb, r0
	mov r0, #0
	sbc r8, r8, r0
	b _020A36C8
_020A3748:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A3750: .word 0x0000020B
	arm_func_end sub_020A36A0

	arm_func_start sub_020A3754
sub_020A3754: ; 0x020A3754
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020A2E54
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsb r0, [r5, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	mvneq r0, #0x1b
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	mov r1, #0
	beq _020A37A8
	ldrsh r0, [r5, #0x70]
	tst r0, #1
	movne r1, #1
_020A37A8:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r5, #0x70]
	tst r0, #2
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl sub_020A37D4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A3754

	arm_func_start sub_020A37D4
sub_020A37D4: ; 0x020A37D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r0, _020A380C ; =sub_020A3810
	mov r1, r5
	mov r2, #1
	bl sub_020A0B7C
	movs r1, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	str r4, [r1, #0x10]
	bl sub_020A0CC4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A380C: .word sub_020A3810
	arm_func_end sub_020A37D4

	arm_func_start sub_020A3810
sub_020A3810: ; 0x020A3810
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r4, [r7, #4]
	ldr r5, [r4, #0x64]
	add r0, r5, #0xe0
	ldr r6, [r5, #0xc4]
	bl OS_LockMutex
	ldr r1, [r7, #0x10]
	cmp r1, #0
	beq _020A3850
	mov r0, #1
	str r1, [r6, #0xc]
	bl sub_020AB948
	mov r0, #4
	strb r0, [r4, #0x73]
	b _020A3864
_020A3850:
	mov r0, #0
	strb r0, [r4, #0x73]
	bl sub_020AB948
	mov r0, #0
	str r0, [r6, #0xc]
_020A3864:
	add r0, r5, #0xe0
	bl OS_UnlockMutex
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020A3810

	arm_func_start sub_020A3874
sub_020A3874: ; 0x020A3874
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _020A3968 ; =0x021D4620
	ldr r2, _020A3968 ; =0x021D4620
	ldr r1, [r1, #0x50]
	str r0, [r2, #0xc]
	cmp r1, #0
	mov r1, #0
	str r1, [r2, #0x50]
	str r1, [r2, #0x1c]
	str r1, [r2, #0x2c]
	str r1, [r2, #0x60]
	movne r3, #1
	str r1, [r2, #0x64]
	moveq r3, #0
	str r1, [r2, #0x20]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _020A396C ; =0x021D46A0
	mov r2, #0x60
	bl sub_020D4994
	ldr r0, _020A3970 ; =0x021E16A0
	ldr r6, [r0, #8]
	cmp r6, #0
	beq _020A3924
	mov r5, #0
	mov r4, r5
_020A38DC:
	ldr r1, [r6, #0xa4]
	cmp r1, #0
	ldrne r0, [r1]
	cmpne r0, #0
	beq _020A3918
	ldrb r0, [r1, #8]
	cmp r0, #0xa
	cmpne r0, #0xb
	strneb r5, [r1, #8]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _020A3918
	str r4, [r1, #4]
	ldr r0, [r1]
	bl sub_020D1F34
_020A3918:
	ldr r6, [r6, #0x68]
	cmp r6, #0
	bne _020A38DC
_020A3924:
	mov r6, #0
	ldr r7, _020A3974 ; =0x021D4948
	ldr r4, _020A3968 ; =0x021D4620
	mov r5, r6
_020A3934:
	ldrh r0, [r7, #4]
	cmp r0, #0
	beq _020A3950
	ldr r0, [r7, #0x34]
	ldr r1, [r4, #0x40]
	blx r1
	strh r5, [r7, #4]
_020A3950:
	add r6, r6, #1
	cmp r6, #8
	add r7, r7, #0x38
	blt _020A3934
	bl sub_020ABA58
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A3968: .word 0x021D4620
_020A396C: .word 0x021D46A0
_020A3970: .word 0x021E16A0
_020A3974: .word 0x021D4948
	arm_func_end sub_020A3874

	arm_func_start sub_020A3978
sub_020A3978: ; 0x020A3978
	stmdb sp!, {r3, lr}
	ldr r0, _020A399C ; =0x021D4620
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _020A3994
	bl sub_020D1FA0
	ldmia sp!, {r3, pc}
_020A3994:
	bl sub_020D2108
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A399C: .word 0x021D4620
	arm_func_end sub_020A3978

	arm_func_start sub_020A39A0
sub_020A39A0: ; 0x020A39A0
	bx lr
	arm_func_end sub_020A39A0

	arm_func_start sub_020A39A4
sub_020A39A4: ; 0x020A39A4
	mov r0, #1
	bx lr
	arm_func_end sub_020A39A4

	.section .version,4

	.balign 4, 0
	.public _version_UBIQUITOUS_CPS
_version_UBIQUITOUS_CPS: ; 0x02000C24
	.asciz "[SDK+UBIQUITOUS:CPS]"

	.previous

	arm_func_start sub_020A39AC
sub_020A39AC: ; 0x020A39AC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r0
	ldr r0, _020A3BA4 ; =_version_UBIQUITOUS_CPS
	bl OSi_ReferSymbol
	ldr r3, [r4, #0x18]
	ldr r5, [r4, #0x14]
	cmp r3, #0
	cmpeq r5, #0
	mov r1, #0
	beq _020A3A04
	ldr r0, _020A3BA8 ; =0x021D4620
	ldr r2, _020A3BAC ; =0x6C078965
	str r5, [r0, #0x68]
	str r3, [r0, #0x6c]
	ldr r3, _020A3BB0 ; =0x5D588B65
	str r2, [r0, #0x70]
	ldr r2, _020A3BB4 ; =0x00269EC3
	str r3, [r0, #0x74]
	str r2, [r0, #0x78]
	str r1, [r0, #0x7c]
	b _020A3A34
_020A3A04:
	bl sub_020D34B0
	ldr r2, _020A3BA8 ; =0x021D4620
	ldr r3, _020A3BAC ; =0x6C078965
	str r0, [r2, #0x68]
	str r1, [r2, #0x6c]
	ldr r1, _020A3BB0 ; =0x5D588B65
	str r3, [r2, #0x70]
	ldr r0, _020A3BB4 ; =0x00269EC3
	str r1, [r2, #0x74]
	str r0, [r2, #0x78]
	mov r0, #0
	str r0, [r2, #0x7c]
_020A3A34:
	ldr r1, [r4, #4]
	cmp r1, #0
	ldrne r0, [r4, #8]
	cmpne r0, #0
	beq _020A3A58
	ldr r0, _020A3BA8 ; =0x021D4620
	str r1, [r0, #0x14]
	ldr r1, [r4, #8]
	b _020A3A64
_020A3A58:
	ldr r1, _020A3BB8 ; =sub_020A39A0
	ldr r0, _020A3BA8 ; =0x021D4620
	str r1, [r0, #0x14]
_020A3A64:
	str r1, [r0, #0x40]
	ldr r1, [r4]
	ldr r0, _020A3BA8 ; =0x021D4620
	ldr r2, _020A3BA8 ; =0x021D4620
	str r1, [r0, #0x10]
	ldr r1, [r4, #0x24]
	cmp r1, #0
	ldreq r1, _020A3BBC ; =0x000005B4
	strh r1, [r0, #2]
	ldr r1, [r4, #0x28]
	ldr r0, _020A3BA8 ; =0x021D4620
	str r1, [r0, #0x34]
	ldr r1, [r4, #0x2c]
	str r1, [r0, #0x24]
	ldr r1, [r4, #0xc]
	cmp r1, #0
	ldreq r1, _020A3BB8 ; =sub_020A39A0
	str r1, [r0, #0x18]
	ldr r1, [r4, #0x10]
	cmp r1, #0
	ldrne r0, _020A3BA8 ; =0x021D4620
	ldreq r1, _020A3BC0 ; =sub_020A39A4
	ldreq r0, _020A3BA8 ; =0x021D4620
	str r1, [r0, #0x48]
	ldr r1, [r4, #0x1c]
	mov r0, #0
	str r1, [r2, #0x58]
	ldr r3, [r4, #0x20]
	ldr r1, _020A3BC4 ; =0x00000F88
	str r3, [r2, #0x5c]
	str r0, [r2, #0x30]
	str r0, [r2, #0x28]
	ldr ip, [r2, #0x70]
	ldr r4, [r2, #0x68]
	ldr r3, [r2, #0x6c]
	umull r5, lr, ip, r4
	mla lr, ip, r3, lr
	ldr r3, [r2, #0x74]
	ldr ip, [r2, #0x78]
	mla lr, r3, r4, lr
	ldr r3, [r2, #0x7c]
	adds ip, ip, r5
	adc r5, r3, lr
	umull r3, r4, r5, r1
	mla r4, r5, r0, r4
	mla r4, r0, r1, r4
	str ip, [r2, #0x68]
	ldr r0, _020A3BC8 ; =0x021D4B08
	str r5, [r2, #0x6c]
	add r1, r4, #0x400
	strh r1, [r2, #8]
	bl sub_020D3C40
	ldr r0, _020A3BA8 ; =0x021D4620
	mov r2, #0
	strb r2, [r0, #1]
	mov r1, #0x800
	str r1, [sp]
	ldr r0, _020A3BCC ; =_02110684
	ldr r1, _020A3BD0 ; =sub_020A671C
	ldr r4, [r0]
	ldr r0, _020A3BD4 ; =0x021D4888
	ldr r3, _020A3BD8 ; =0x021D5E60
	str r4, [sp, #4]
	bl sub_020D1AD4
	mov r1, #0x800
	ldr r0, _020A3BCC ; =_02110684
	str r1, [sp]
	ldr r1, [r0]
	ldr r0, _020A3BDC ; =0x021D47C8
	str r1, [sp, #4]
	ldr r1, _020A3BE0 ; =sub_020A7448
	ldr r3, _020A3BE4 ; =0x021D5660
	mov r2, #0
	bl sub_020D1AD4
	ldr r0, _020A3BD4 ; =0x021D4888
	bl sub_020D1F34
	ldr r0, _020A3BDC ; =0x021D47C8
	bl sub_020D1F34
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A3BA4: .word _version_UBIQUITOUS_CPS
_020A3BA8: .word 0x021D4620
_020A3BAC: .word 0x6C078965
_020A3BB0: .word 0x5D588B65
_020A3BB4: .word 0x00269EC3
_020A3BB8: .word sub_020A39A0
_020A3BBC: .word 0x000005B4
_020A3BC0: .word sub_020A39A4
_020A3BC4: .word 0x00000F88
_020A3BC8: .word 0x021D4B08
_020A3BCC: .word _02110684
_020A3BD0: .word sub_020A671C
_020A3BD4: .word 0x021D4888
_020A3BD8: .word 0x021D5E60
_020A3BDC: .word 0x021D47C8
_020A3BE0: .word sub_020A7448
_020A3BE4: .word 0x021D5660
	arm_func_end sub_020A39AC

	arm_func_start sub_020A3BE8
sub_020A3BE8: ; 0x020A3BE8
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_020D3A38
	mov r4, r0
	ldr r0, _020A3C30 ; =0x021D47C8
	bl sub_020D1E68
	movs r5, r0
	ldreq r1, _020A3C34 ; =0x021D4620
	ldreq r0, [r1, #0x44]
	cmpeq r0, #0
	bne _020A3C20
	ldr r0, _020A3C30 ; =0x021D47C8
	mov r2, #1
	str r2, [r1, #0x44]
	bl sub_020D1F34
_020A3C20:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A3C30: .word 0x021D47C8
_020A3C34: .word 0x021D4620
	arm_func_end sub_020A3BE8

	arm_func_start sub_020A3C38
sub_020A3C38: ; 0x020A3C38
	ldr r1, _020A3C44 ; =0x021D4620
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_020A3C44: .word 0x021D4620
	arm_func_end sub_020A3C38

	arm_func_start sub_020A3C48
sub_020A3C48: ; 0x020A3C48
	stmdb sp!, {r3, lr}
	bl sub_020A3BE8
	ldr r0, _020A3C84 ; =0x021D47C8
	bl sub_020D1E38
	ldr r0, _020A3C88 ; =0x021D4888
	bl sub_020D1CE0
	ldr r1, _020A3C8C ; =0x021D4620
	mov r0, #0
	str r0, [r1, #0x54]
	bl sub_020A3874
	ldr r0, _020A3C8C ; =0x021D4620
	mov r1, #0
	str r1, [r0, #0x58]
	str r1, [r0, #0x5c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A3C84: .word 0x021D47C8
_020A3C88: .word 0x021D4888
_020A3C8C: .word 0x021D4620
	arm_func_end sub_020A3C48

	arm_func_start sub_020A3C90
sub_020A3C90: ; 0x020A3C90
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r2, _020A3CBC ; =_02110684
	ldr r0, _020A3CC0 ; =0x021D4888
	mov r1, r4
	str r4, [r2]
	bl sub_020D2058
	ldr r0, _020A3CC4 ; =0x021D47C8
	mov r1, r4
	bl sub_020D2058
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A3CBC: .word _02110684
_020A3CC0: .word 0x021D4888
_020A3CC4: .word 0x021D47C8
	arm_func_end sub_020A3C90

	arm_func_start sub_020A3CC8
sub_020A3CC8: ; 0x020A3CC8
	tst r0, #1
	beq _020A3D00
	cmp r1, #1
	bls _020A3D50
_020A3CD8:
	ldrb ip, [r0]
	ldrb r3, [r0, #1]
	sub r1, r1, #2
	cmp r1, #1
	orr r3, r3, ip, lsl #8
	mov r3, r3, lsl #0x10
	add r2, r2, r3, lsr #16
	add r0, r0, #2
	bhi _020A3CD8
	b _020A3D50
_020A3D00:
	mov r2, r2, lsl #0x10
	mov r3, r2, lsr #0x10
	mov r2, r3, lsl #8
	orr r2, r2, r3, asr #8
	mov r2, r2, lsl #0x10
	cmp r1, #1
	mov r2, r2, lsr #0x10
	bls _020A3D34
_020A3D20:
	ldrh r3, [r0], #2
	sub r1, r1, #2
	cmp r1, #1
	add r2, r2, r3
	bhi _020A3D20
_020A3D34:
	ldr r3, _020A3D78 ; =0x00FF00FF
	mov ip, r3, lsl #8
	and r3, r3, r2, lsr #8
	and r2, ip, r2, lsl #8
	orr r3, r3, r2
	mov r2, r3, lsl #0x10
	orr r2, r2, r3, lsr #16
_020A3D50:
	cmp r1, #0
	ldrneb r0, [r0]
	addne r2, r2, r0, lsl #8
	mov r0, r2, lsl #0x10
	mov r1, r2, lsr #0x10
	add r0, r1, r0, lsr #16
	add r0, r0, r0, lsr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_020A3D78: .word 0x00FF00FF
	arm_func_end sub_020A3CC8

	arm_func_start sub_020A3D7C
sub_020A3D7C: ; 0x020A3D7C
	ldr r1, _020A3D94 ; =0x0000FFFF
	eor r0, r0, r1
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	moveq r0, r1
	bx lr
	.align 2, 0
_020A3D94: .word 0x0000FFFF
	arm_func_end sub_020A3D7C

	arm_func_start sub_020A3D98
sub_020A3D98: ; 0x020A3D98
	stmdb sp!, {r3, lr}
	mov r2, #0
	bl sub_020A3CC8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_020A3D7C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A3D98

	arm_func_start sub_020A3DB4
sub_020A3DB4: ; 0x020A3DB4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r2
	mov r2, r3
	mov r5, r1
	bl sub_020A3CC8
	mov r2, r0
	add r0, r4, #0xc
	mov r1, #8
	bl sub_020A3CC8
	add r1, r0, r5
	tst r1, #0x10000
	addne r0, r1, #1
	movne r0, r0, lsl #0x10
	movne r1, r0, lsr #0x10
	ldr r0, _020A3E00 ; =0x0000FFFF
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A3E00: .word 0x0000FFFF
	arm_func_end sub_020A3DB4

	arm_func_start sub_020A3E04
sub_020A3E04: ; 0x020A3E04
	mov ip, #1
	sub r1, ip, #2
	cmp r0, r1
	subne r1, ip, #0x81000000
	cmpne r0, r1
	beq _020A3E38
	ldr r1, _020A3E40 ; =0x021D4620
	ldr r3, [r1, #0x1c]
	ldr r1, [r1, #0x50]
	and r2, r0, r3
	and r0, r1, r3
	cmp r2, r0
	movne ip, #0
_020A3E38:
	mov r0, ip
	bx lr
	.align 2, 0
_020A3E40: .word 0x021D4620
	arm_func_end sub_020A3E04

	arm_func_start sub_020A3E44
sub_020A3E44: ; 0x020A3E44
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020A3E04
	cmp r0, #0
	ldreq r0, _020A3E64 ; =0x021D4620
	ldreq r4, [r0, #0x2c]
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A3E64: .word 0x021D4620
	arm_func_end sub_020A3E44

	arm_func_start sub_020A3E68
sub_020A3E68: ; 0x020A3E68
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl sub_020A3E04
	cmp r0, #0
	beq _020A3E98
	ldr r0, _020A3EA0 ; =0x021D4620
	ldr r0, [r0, #0x1c]
	mvn r1, r0
	and r0, r1, r5
	cmp r1, r0
	moveq r4, #1
_020A3E98:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A3EA0: .word 0x021D4620
	arm_func_end sub_020A3E68

	arm_func_start sub_020A3EA4
sub_020A3EA4: ; 0x020A3EA4
	and r0, r0, #0xf0000000
	cmp r0, #0xe0000000
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_020A3EA4

	arm_func_start sub_020A3EB8
sub_020A3EB8: ; 0x020A3EB8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _020A3F30 ; =0x021D4620
	mov r4, #1
	ldr r1, [r1, #0x50]
	mov r6, r0
	cmp r1, #0
	mov r0, r4
	cmpne r6, r1
	movne r0, #0
	mov r5, r4
	mov r2, r4
	cmp r0, #0
	bne _020A3EF8
	ldr r0, _020A3F34 ; =0x7F000001
	cmp r6, r0
	movne r2, #0
_020A3EF8:
	cmp r2, #0
	bne _020A3F10
	mov r0, r6
	bl sub_020A3E68
	cmp r0, #0
	moveq r5, #0
_020A3F10:
	cmp r5, #0
	bne _020A3F28
	mov r0, r6
	bl sub_020A3EA4
	cmp r0, #0
	moveq r4, #0
_020A3F28:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A3F30: .word 0x021D4620
_020A3F34: .word 0x7F000001
	arm_func_end sub_020A3EB8

	arm_func_start sub_020A3F38
sub_020A3F38: ; 0x020A3F38
	mov ip, #0
_020A3F3C:
	ldrh r3, [r0], #2
	ldrh r2, [r1], #2
	cmp r3, r2
	movne r0, #1
	bxne lr
	add ip, ip, #1
	cmp ip, #3
	blt _020A3F3C
	mov r0, #0
	bx lr
	arm_func_end sub_020A3F38

	arm_func_start sub_020A3F64
sub_020A3F64: ; 0x020A3F64
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	ldr r0, _020A3FB8 ; =_02110690
	add r1, r7, #6
	mov r2, #6
	mov r4, r3
	bl sub_020D4A50
	mov r0, r7
	mov r3, r5
	add r1, r7, #6
	sub r2, r6, #6
	str r4, [sp]
	bl sub_020AFFE4
	cmp r0, #0
	movlt r1, #1
	ldr r0, _020A3FBC ; =0x021D4620
	movge r1, #0
	strb r1, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A3FB8: .word _02110690
_020A3FBC: .word 0x021D4620
	arm_func_end sub_020A3F64

	arm_func_start sub_020A3FC0
sub_020A3FC0: ; 0x020A3FC0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _020A41A8 ; =0x021D4620
	mov r7, r0
	ldr ip, [r4, #0x58]
	mov r6, r2
	cmp ip, #0
	ldrne r0, [r4, #0x5c]
	mov r5, r3
	cmpne r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x1c]
	add r0, r5, r0
	cmp r0, #8
	ldmloia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, _020A41AC ; =0x000005E4
	cmp r0, r2
	ldmhiia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, _020A41B0 ; =_02110690
	ldrb r4, [r6]
	ldrb r3, [r2]
	cmp r4, r3
	ldreqb r4, [r6, #1]
	ldreqb r3, [r2, #1]
	cmpeq r4, r3
	ldreqb r3, [r6, #2]
	ldreqb r2, [r2, #2]
	cmpeq r3, r2
	ldreqb r2, [r6, #6]
	cmpeq r2, #8
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r2, [r6, #7]
	cmp r2, #0
	cmpne r2, #6
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, _020A41A8 ; =0x021D4620
	add r0, r0, #9
	bic r0, r0, #1
	ldr r8, [r2, #0x28]
	mov r0, r0, lsl #0x10
	ldr lr, [r2, #0x28]
	ldr r4, [r2, #0x30]
	mov r3, r0, lsr #0x10
	cmp lr, r4
	add r4, r8, r0, lsr #16
	bhs _020A4080
	ldr r0, [r2, #0x30]
	cmp r0, r4
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
_020A4080:
	ldr r0, _020A41A8 ; =0x021D4620
	ldr r2, [r0, #0x5c]
	cmp r4, r2
	bne _020A40A4
	ldr r0, [r0, #0x30]
	mov r4, #0
	cmp r0, #0
	bne _020A40C0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A40A4:
	ldr r2, [r0, #0x5c]
	cmp r4, r2
	bls _020A40C0
	ldr r0, [r0, #0x30]
	mov r4, r3
	cmp r0, r3
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
_020A40C0:
	ldr r0, _020A41A8 ; =0x021D4620
	ldr lr, [r0, #0x28]
	ldr r2, [r0, #0x5c]
	add lr, lr, r3
	cmp lr, r2
	bls _020A4100
	ldr lr, [r0, #0x5c]
	ldr r2, [r0, #0x28]
	sub r2, lr, r2
	cmp r2, #2
	ldrhs r0, [r0, #0x28]
	movhs r2, #0
	strhsh r2, [ip, r0]
	ldr r0, _020A41A8 ; =0x021D4620
	mov r2, #0
	str r2, [r0, #0x28]
_020A4100:
	ldr ip, _020A41A8 ; =0x021D4620
	mov r0, r1
	ldr lr, [ip, #0x58]
	ldr r1, [ip, #0x28]
	mov r2, #6
	strh r3, [lr, r1]
	ldr r3, [ip, #0x58]
	ldr r1, [ip, #0x28]
	add r1, r3, r1
	add r1, r1, #2
	bl sub_020D4A50
	ldr r1, _020A41A8 ; =0x021D4620
	mov r0, r7
	ldr r3, [r1, #0x58]
	ldr r1, [r1, #0x28]
	mov r2, #6
	add r1, r3, r1
	add r1, r1, #8
	bl sub_020D4A50
	ldr r1, _020A41A8 ; =0x021D4620
	add r0, r6, #6
	ldr r3, [r1, #0x58]
	ldr r1, [r1, #0x28]
	sub r2, r5, #6
	add r1, r3, r1
	add r1, r1, #0xe
	bl sub_020D4A50
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldrne r2, [sp, #0x1c]
	cmpne r2, #0
	beq _020A419C
	ldr r1, _020A41A8 ; =0x021D4620
	ldr r3, [r1, #0x58]
	ldr r1, [r1, #0x28]
	add r1, r3, r1
	add r1, r1, #8
	add r1, r1, r5
	bl sub_020D4A50
_020A419C:
	ldr r0, _020A41A8 ; =0x021D4620
	str r4, [r0, #0x28]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A41A8: .word 0x021D4620
_020A41AC: .word 0x000005E4
_020A41B0: .word _02110690
	arm_func_end sub_020A3FC0

	arm_func_start sub_020A41B4
sub_020A41B4: ; 0x020A41B4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov ip, #0
	str ip, [sp]
	str ip, [sp, #4]
	bl sub_020A3FC0
	ldr r0, _020A4208 ; =0x021D4620
	ldr r1, [r0, #0x54]
	cmp r1, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0, #0x54]
	bl sub_020D1E68
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, pc}
	ldr r0, _020A4208 ; =0x021D4620
	ldr r0, [r0, #0x54]
	bl sub_020D1F34
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A4208: .word 0x021D4620
	arm_func_end sub_020A41B4

	arm_func_start sub_020A420C
sub_020A420C: ; 0x020A420C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	bl sub_020D3A38
	ldr sb, _020A42C4 ; =0x021D4620
	mov r6, r0
	ldr r1, [sb, #0x30]
	ldr r0, [sb, #0x28]
	cmp r1, r0
	bne _020A4260
	mov r5, #0
	ldr r8, _020A42C8 ; =0x021E16A0
	mov r4, r5
_020A423C:
	ldr r1, [r8, #4]
	mov r0, r5
	str r1, [sb, #0x54]
	bl sub_020D1E7C
	str r4, [sb, #0x54]
	ldr r1, [sb, #0x30]
	ldr r0, [sb, #0x28]
	cmp r1, r0
	beq _020A423C
_020A4260:
	mov r0, r6
	bl sub_020D3A4C
	ldr r0, _020A42C4 ; =0x021D4620
	mov r3, #0
	ldr r5, [r0, #0x58]
	mov r1, r3
_020A4278:
	ldr r4, [r0, #0x5c]
	ldr r2, [r0, #0x30]
	sub r2, r4, r2
	cmp r2, #2
	strlo r3, [r0, #0x30]
	ldr r2, [r0, #0x30]
	ldrh r2, [r5, r2]
	cmp r2, #0
	streq r1, [r0, #0x30]
	cmp r2, #0
	beq _020A4278
	sub r1, r2, #2
	ldr r0, _020A42C4 ; =0x021D4620
	str r1, [r7]
	ldr r1, [r0, #0x58]
	ldr r0, [r0, #0x30]
	add r0, r1, r0
	add r0, r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020A42C4: .word 0x021D4620
_020A42C8: .word 0x021E16A0
	arm_func_end sub_020A420C

	arm_func_start sub_020A42CC
sub_020A42CC: ; 0x020A42CC
	stmdb sp!, {r3, lr}
	bl sub_020D3A38
	ldr r1, _020A430C ; =0x021D4620
	ldr ip, [r1, #0x30]
	ldr r3, [r1, #0x58]
	ldr r2, [r1, #0x30]
	ldrh r2, [r3, r2]
	add r2, ip, r2
	str r2, [r1, #0x30]
	ldr r3, [r1, #0x30]
	ldr r2, [r1, #0x5c]
	cmp r3, r2
	movhs r2, #0
	strhs r2, [r1, #0x30]
	bl sub_020D3A4C
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A430C: .word 0x021D4620
	arm_func_end sub_020A42CC

	arm_func_start sub_020A4310
sub_020A4310: ; 0x020A4310
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl sub_020D3A38
	ldr r1, _020A43C8 ; =0x7F000001
	mov r4, r0
	cmp r5, r1
	ldrne r0, _020A43CC ; =0x021D4620
	mov r7, #0
	ldrne r0, [r0, #0x50]
	cmpne r5, r0
	ldreq r7, _020A43D0 ; =0x021D4B08
	beq _020A43B8
	mov r0, r5
	bl sub_020A3E68
	cmp r0, #0
	bne _020A4360
	mov r0, r5
	bl sub_020A3EA4
	cmp r0, #0
	beq _020A4368
_020A4360:
	ldr r7, _020A43D4 ; =_02110688
	b _020A43B8
_020A4368:
	ldr r1, _020A43D8 ; =0x021D46A0
	mov r6, r7
_020A4370:
	ldr r0, [r1]
	cmp r5, r0
	bne _020A43A8
	bl sub_020D34B0
	mov r2, #0xc
	mul r3, r6, r2
	ldr r2, _020A43D8 ; =0x021D46A0
	mov r5, r0, lsr #0x10
	add r0, r2, r3
	ldr r2, _020A43DC ; =0x021D46AA
	orr r5, r5, r1, lsl #16
	strh r5, [r2, r3]
	add r7, r0, #4
	b _020A43B8
_020A43A8:
	add r6, r6, #1
	cmp r6, #8
	add r1, r1, #0xc
	blo _020A4370
_020A43B8:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A43C8: .word 0x7F000001
_020A43CC: .word 0x021D4620
_020A43D0: .word 0x021D4B08
_020A43D4: .word _02110688
_020A43D8: .word 0x021D46A0
_020A43DC: .word 0x021D46AA
	arm_func_end sub_020A4310

	arm_func_start sub_020A43E0
sub_020A43E0: ; 0x020A43E0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x2c
	mov r4, r0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x2a
	bl sub_020D4994
	add r0, sp, #0
	mov r1, #0xff
	mov r2, #6
	bl sub_020D4994
	ldr r0, _020A44CC ; =0x021D4B08
	add r1, sp, #6
	mov r2, #6
	bl sub_020D4A50
	mov r0, #1
	ldr r1, _020A44D0 ; =0x00000608
	strb r0, [sp, #0xf]
	strh r1, [sp, #0xc]
	strb r0, [sp, #0x15]
	mov r0, #8
	ldr r1, _020A44D4 ; =0x00000406
	strb r0, [sp, #0x10]
	strh r1, [sp, #0x12]
	ldr r0, _020A44CC ; =0x021D4B08
	add r1, sp, #0x16
	mov r2, #6
	bl sub_020D4A50
	ldr r0, _020A44D8 ; =0x021D4620
	mov r1, r4, lsr #0x10
	ldr r3, [r0, #0x50]
	mov r0, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r4, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r3, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r0, r3, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r4, lsl #8
	orr r0, r0, r4, asr #8
	strh r0, [sp, #0x1c]
	mov r0, r3, lsl #8
	orr r0, r0, r3, asr #8
	strh r0, [sp, #0x1e]
	mov r0, r2, lsl #8
	orr r0, r0, r2, asr #8
	strh r0, [sp, #0x26]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	mov r2, #0
	strh r0, [sp, #0x28]
	add r0, sp, #0
	mov r1, #0x2a
	mov r3, r2
	bl sub_020A3F64
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020A44CC: .word 0x021D4B08
_020A44D0: .word 0x00000608
_020A44D4: .word 0x00000406
_020A44D8: .word 0x021D4620
	arm_func_end sub_020A43E0

	arm_func_start sub_020A44DC
sub_020A44DC: ; 0x020A44DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, #0
	ldr r4, _020A4548 ; =0x021D4620
	mov sb, r0
	mov r5, #0x64
	mov r6, r7
_020A44F4:
	mov r0, sb
	bl sub_020A43E0
	mov r8, r6
_020A4500:
	ldr r0, [r4, #0x50]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r5
	bl sub_020D2108
	mov r0, sb
	bl sub_020A4310
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r8, r8, #1
	cmp r8, #0x14
	blo _020A4500
	add r7, r7, #1
	cmp r7, #8
	blo _020A44F4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020A4548: .word 0x021D4620
	arm_func_end sub_020A44DC

	arm_func_start sub_020A454C
sub_020A454C: ; 0x020A454C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _020A4678 ; =0x7F000001
	mov r6, r1
	mov r7, r0
	cmp r6, r3
	ldrne r0, _020A467C ; =0x021D4620
	mov r5, r2
	ldrne r0, [r0, #0x50]
	cmpne r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl sub_020A3E04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl sub_020A3EA4
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	mov r0, r0, lsl #0x10
	ldr r2, _020A4680 ; =0x021D46A0
	mov r4, r0, lsr #0x10
	mov r1, #0
_020A45B0:
	ldr r0, [r2]
	cmp r6, r0
	bne _020A45E8
	mov r0, #0xc
	mul r5, r1, r0
	ldr r0, _020A4680 ; =0x021D46A0
	ldr r3, _020A4684 ; =0x021D46AA
	add r1, r0, r5
	mov r0, r7
	add r1, r1, #4
	mov r2, #6
	strh r4, [r3, r5]
	bl sub_020D4A50
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A45E8:
	add r1, r1, #1
	cmp r1, #8
	add r2, r2, #0xc
	blo _020A45B0
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r2, #0
	ldr r3, _020A4680 ; =0x021D46A0
	mov r1, r2
	mov r5, r2
_020A4610:
	ldr r0, [r3]
	cmp r0, #0
	moveq r1, r5
	beq _020A4648
	ldrh r0, [r3, #0xa]
	add r3, r3, #0xc
	sub r0, r4, r0
	mov r0, r0, lsl #0x10
	cmp r2, r0, asr #16
	movlt r1, r5
	add r5, r5, #1
	movlt r2, r0, lsr #0x10
	cmp r5, #8
	blo _020A4610
_020A4648:
	mov r0, #0xc
	mul r5, r1, r0
	ldr r3, _020A4680 ; =0x021D46A0
	mov r0, r7
	add r1, r3, r5
	add r1, r1, #4
	mov r2, #6
	str r6, [r3, r5]
	bl sub_020D4A50
	ldr r0, _020A4684 ; =0x021D46AA
	strh r4, [r0, r5]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A4678: .word 0x7F000001
_020A467C: .word 0x021D4620
_020A4680: .word 0x021D46A0
_020A4684: .word 0x021D46AA
	arm_func_end sub_020A454C

	arm_func_start sub_020A4688
sub_020A4688: ; 0x020A4688
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrh r5, [sp, #0x1c]
	ldr r4, [sp, #0x18]
	mov r8, r0
	mov r0, r5, lsl #8
	orr ip, r0, r5, asr #8
	mov r0, r4
	mov r7, r1
	mov r6, r2
	mov r5, r3
	strh ip, [r8, #-2]
	bl sub_020A3EA4
	cmp r0, #0
	bne _020A46FC
	mov r0, r4
	bl sub_020A3E44
	movs r4, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	bl sub_020A4310
	cmp r0, #0
	bne _020A46E4
	mov r0, r4
	bl sub_020A44DC
_020A46E4:
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	sub r1, r8, #0xe
	mov r2, #6
	bl sub_020D4A50
	b _020A472C
_020A46FC:
	mov r0, #1
	strb r0, [r8, #-0xe]
	mov r1, #0
	mov r0, r4, lsr #0x10
	strb r1, [r8, #-0xd]
	mov r1, #0x5e
	strb r1, [r8, #-0xc]
	and r0, r0, #0x7f
	strb r0, [r8, #-0xb]
	mov r0, r4, lsr #8
	strb r0, [r8, #-0xa]
	strb r4, [r8, #-9]
_020A472C:
	ldr r0, _020A4754 ; =0x021D4B08
	sub r1, r8, #8
	mov r2, #6
	bl sub_020D4A50
	mov r2, r6
	mov r3, r5
	sub r0, r8, #0xe
	add r1, r7, #0xe
	bl sub_020A3F64
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A4754: .word 0x021D4B08
	arm_func_end sub_020A4688

	arm_func_start sub_020A4758
sub_020A4758: ; 0x020A4758
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r7, r1
	mov r5, r3
	add r1, r7, #0x14
	add r1, r1, r5
	mov r1, r1, lsl #0x10
	ldr r3, [sp, #0x24]
	mov r4, r1, lsr #0x10
	mov r1, r3, lsl #0x10
	mov r3, r4, lsl #8
	orr r3, r3, r4, asr #8
	mov r8, r0
	mov r1, r1, lsr #0x10
	mov r0, r1, lsl #8
	strh r3, [r8, #-0x12]
	orr r0, r0, r1, asr #8
	strh r0, [r8, #-0xe]
	mov r3, #0
	sub r0, r8, #0x14
	mov r1, #0x14
	mov r6, r2
	strh r3, [r8, #-0xa]
	ldr r4, [sp, #0x20]
	bl sub_020A3D98
	mov r2, r0, lsl #8
	ldr r1, _020A4870 ; =0x7F000001
	orr r0, r2, r0, asr #8
	strh r0, [r8, #-0xa]
	cmp r4, r1
	ldrne r0, _020A4874 ; =0x021D4620
	ldrne r0, [r0, #0x50]
	cmpne r4, r0
	beq _020A4800
	mov r2, r6
	mov r3, r5
	str r4, [sp]
	mov ip, #0x800
	sub r0, r8, #0x14
	add r1, r7, #0x14
	str ip, [sp, #4]
	bl sub_020A4688
_020A4800:
	ldr r0, _020A4870 ; =0x7F000001
	cmp r4, r0
	ldrne r0, _020A4874 ; =0x021D4620
	ldrne r0, [r0, #0x50]
	cmpne r4, r0
	beq _020A482C
	mov r0, r4
	bl sub_020A3EA4
	cmp r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_020A482C:
	ldr r0, _020A4878 ; =_02110690
	sub r1, r8, #0x1c
	mov r2, #8
	bl sub_020D4A50
	bl sub_020D3A38
	mov r4, r0
	ldr r0, _020A487C ; =0x021D4B08
	str r6, [sp]
	mov r1, r0
	str r5, [sp, #4]
	sub r2, r8, #0x1c
	add r3, r7, #0x1c
	bl sub_020A3FC0
	mov r0, r4
	bl sub_020D3A4C
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A4870: .word 0x7F000001
_020A4874: .word 0x021D4620
_020A4878: .word _02110690
_020A487C: .word 0x021D4B08
	arm_func_end sub_020A4758

	arm_func_start sub_020A4880
sub_020A4880: ; 0x020A4880
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov r0, #0x45
	strb r0, [sl, #-0x14]
	mov r4, #0
	ldr r7, _020A4A70 ; =0x021D4620
	strb r4, [sl, #-0x13]
	ldrh r0, [r7, #6]
	ldr r6, [sp, #0x30]
	ldrb r5, [sp, #0x34]
	add r0, r0, #1
	strh r0, [r7, #6]
	ldrh fp, [r7, #6]
	mov r0, r6, lsr #0x10
	mov r8, #0x80
	mov sb, fp, lsl #8
	orr sb, sb, fp, asr #8
	strh sb, [sl, #-0x10]
	strb r8, [sl, #-0xc]
	strb r5, [sl, #-0xb]
	ldr r8, [r7, #0x50]
	mov r5, r0, lsl #0x10
	mov r0, r8, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	mov r0, r8, lsl #8
	orr r0, r0, r8, asr #8
	strh r0, [sl, #-8]
	ldr r0, [r7, #0x50]
	mov r8, r5, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	mov r5, r7, lsl #8
	mov r0, r6, lsl #0x10
	orr sb, r5, r7, asr #8
	mov r7, r8, lsl #8
	mov r5, r0, lsr #0x10
	mov r0, r5, lsl #8
	strh sb, [sl, #-6]
	orr r7, r7, r8, asr #8
	ldr fp, _020A4A74 ; =0x000005C8
	mov sb, r1
	strh r7, [sl, #-4]
	orr r0, r0, r5, asr #8
	mov r8, r2
	mov r7, r3
	strh r0, [sl, #-2]
	cmp sb, fp
	bls _020A49EC
	mov r5, sl
	bls _020A4990
_020A4950:
	mov r0, sl
	mov r1, #0
	mov r2, r5
	mov r3, fp
	str r6, [sp]
	orr ip, r4, #0x2000
	str ip, [sp, #4]
	bl sub_020A4758
	add r1, r4, #0xb9
	add r0, r5, #0x1c8
	sub sb, sb, fp
	mov r1, r1, lsl #0x10
	cmp sb, fp
	add r5, r0, #0x400
	mov r4, r1, lsr #0x10
	bhi _020A4950
_020A4990:
	cmp sb, #0
	beq _020A49EC
	cmp r7, #0
	mov r1, #0
	beq _020A49C4
	mov r2, r5
	mov r0, sl
	mov r3, sb
	str r6, [sp]
	orr r5, r4, #0x2000
	str r5, [sp, #4]
	bl sub_020A4758
	b _020A49DC
_020A49C4:
	str r6, [sp]
	mov r0, sl
	mov r2, r5
	mov r3, sb
	str r4, [sp, #4]
	bl sub_020A4758
_020A49DC:
	add r0, r4, sb, lsr #3
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov sb, #0
_020A49EC:
	ldr fp, _020A4A74 ; =0x000005C8
	add r0, sb, r7
	cmp r0, fp
	bls _020A4A40
_020A49FC:
	sub r5, fp, sb
	mov r1, sb
	mov r0, sl
	mov r2, r8
	mov r3, r5
	str r6, [sp]
	orr sb, r4, #0x2000
	str sb, [sp, #4]
	bl sub_020A4758
	add r0, r4, #0xb9
	sub r7, r7, r5
	mov r0, r0, lsl #0x10
	mov sb, #0
	cmp r7, fp
	add r8, r8, r5
	mov r4, r0, lsr #0x10
	bhi _020A49FC
_020A4A40:
	adds r0, sb, r7
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str r6, [sp]
	mov r0, sl
	mov r1, sb
	mov r2, r8
	mov r3, r7
	str r4, [sp, #4]
	bl sub_020A4758
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A4A70: .word 0x021D4620
_020A4A74: .word 0x000005C8
	arm_func_end sub_020A4880

	arm_func_start sub_020A4A78
sub_020A4A78: ; 0x020A4A78
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r2
	ldr r4, [r5, #0x4c]
	mov r6, r1
	mov r1, #8
	ldr r3, _020A4B20 ; =0x021D4620
	ldr r2, _020A4B24 ; =0x021E16A0
	strh r1, [r4, #0x22]
	ldr r2, [r2, #4]
	ldrh lr, [r3, #4]
	mov r7, r0
	strh r2, [r4, #0x26]
	mov r2, #0
	strh r2, [r4, #0x24]
	strh lr, [r5, #0xa]
	add ip, lr, #1
	add r0, r4, #0x22
	strh ip, [r3, #4]
	strh lr, [r4, #0x28]
	bl sub_020A3CC8
	mov r2, r0
	mov r0, r7
	mov r1, r6
	bl sub_020A3CC8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_020A3D7C
	mov r2, r7
	mov r3, r6
	mov r1, r0, lsl #8
	orr r0, r1, r0, asr #8
	strh r0, [r4, #0x24]
	ldr r1, [r5, #0x1c]
	add r0, r4, #0x22
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #8
	bl sub_020A4880
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A4B20: .word 0x021D4620
_020A4B24: .word 0x021E16A0
	arm_func_end sub_020A4A78

	arm_func_start sub_020A4B28
sub_020A4B28: ; 0x020A4B28
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r7, _020A4C60 ; =0x021D4620
	mov r5, r2
	ldr r2, [r7, #0x50]
	mov r6, r1
	mov r1, r2, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	ldr r3, [r5, #0x4c]
	mov r1, r2, lsl #8
	add r4, r3, #0x22
	orr r1, r1, r2, asr #8
	strh r1, [r4, #-0xc]
	ldr r1, [r7, #0x50]
	add r2, r6, #8
	mov r1, r1, lsl #0x10
	mov r7, r1, lsr #0x10
	mov r1, r7, lsl #8
	orr r1, r1, r7, asr #8
	strh r1, [r4, #-0xa]
	ldr r1, [r5, #0x1c]
	mov r2, r2, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r7, r1, lsr #0x10
	mov r1, r7, lsl #8
	orr r1, r1, r7, asr #8
	strh r1, [r4, #-8]
	ldr r1, [r5, #0x1c]
	mov r2, r2, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r7, r1, lsr #0x10
	mov r1, r7, lsl #8
	orr r7, r1, r7, asr #8
	mov r1, r2, lsl #8
	strh r7, [r4, #-6]
	mov r7, #0x1100
	strh r7, [r4, #-4]
	orr r1, r1, r2, asr #8
	strh r1, [r4, #4]
	ldrh r1, [r4, #4]
	mov r7, r0
	sub r0, r4, #0xc
	strh r1, [r4, #-2]
	ldrh lr, [r5, #0x18]
	mov r2, #0
	mov r1, #0x14
	mov ip, lr, lsl #8
	orr ip, ip, lr, asr #8
	strh ip, [r4, #2]
	ldrh lr, [r5, #0xa]
	mov ip, lr, lsl #8
	orr ip, ip, lr, asr #8
	strh ip, [r3, #0x22]
	strh r2, [r4, #6]
	bl sub_020A3CC8
	mov r2, r0
	mov r0, r7
	mov r1, r6
	bl sub_020A3CC8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_020A3D7C
	mov r2, r7
	mov r3, r6
	mov r1, r0, lsl #8
	orr r0, r1, r0, asr #8
	strh r0, [r4, #6]
	ldr r1, [r5, #0x1c]
	mov r0, r4
	str r1, [sp]
	mov r1, #0x11
	str r1, [sp, #4]
	mov r1, #8
	bl sub_020A4880
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A4C60: .word 0x021D4620
	arm_func_end sub_020A4B28

	arm_func_start sub_020A4C64
sub_020A4C64: ; 0x020A4C64
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r7, r2
	ldrb r2, [r7, #8]
	mov sb, r0
	mov r8, r1
	cmp r2, #0
	mov r6, r3
	addeq sp, sp, #8
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, _020A4EC8 ; =0x021E16A0
	ldr r1, _020A4ECC ; =0x021D4888
	ldr r0, [r0, #4]
	cmp r0, r1
	ldreq r4, _020A4ED0 ; =0x021D4B32
	ldrne r0, [r7, #0x4c]
	addne r4, r0, #0x22
	ldr r0, _020A4ED4 ; =0x021D4620
	ands r2, r6, #2
	movne r5, #0x18
	moveq r5, #0x14
	add r1, r5, r8
	ldr sl, [r0, #0x50]
	mov r3, r1, lsl #0x10
	mov r1, sl, lsr #0x10
	mov r1, r1, lsl #0x10
	mov sl, r1, lsr #0x10
	mov r1, sl, lsl #8
	orr r1, r1, sl, asr #8
	strh r1, [r4, #-0xc]
	mov r1, r3, lsr #0x10
	ldr sl, [r0, #0x50]
	mov lr, r1, lsl #8
	mov r3, sl, lsl #0x10
	mov sl, r3, lsr #0x10
	mov r3, sl, lsl #8
	orr r3, r3, sl, asr #8
	strh r3, [r4, #-0xa]
	ldr r3, [r7, #0x1c]
	orr r1, lr, r1, asr #8
	mov r3, r3, lsr #0x10
	mov r3, r3, lsl #0x10
	mov sl, r3, lsr #0x10
	mov r3, sl, lsl #8
	orr r3, r3, sl, asr #8
	strh r3, [r4, #-8]
	ldr r3, [r7, #0x1c]
	mov ip, r5, lsr #2
	mov r3, r3, lsl #0x10
	mov sl, r3, lsr #0x10
	mov r3, sl, lsl #8
	orr r3, r3, sl, asr #8
	strh r3, [r4, #-6]
	mov r3, #0x600
	strh r3, [r4, #-4]
	strh r1, [r4, #-2]
	ldrh lr, [r7, #0xa]
	mov r3, ip, lsl #4
	cmp r2, #0
	mov r1, lr, lsl #8
	orr r1, r1, lr, asr #8
	strh r1, [r4]
	ldrh ip, [r7, #0x18]
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #2]
	ldr r1, [r7, #0x28]
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #4]
	ldr r1, [r7, #0x28]
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #6]
	ldr r1, [r7, #0x24]
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #8]
	ldr r1, [r7, #0x24]
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #0xa]
	strb r3, [r4, #0xc]
	strb r6, [r4, #0xd]
	ldr r3, [r7, #0x3c]
	ldr r1, [r7, #0x44]
	sub r1, r3, r1
	mov r1, r1, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	strh r1, [r4, #0xe]
	mov r1, #0
	strh r1, [r4, #0x10]
	strh r1, [r4, #0x12]
	beq _020A4E48
	ldrh r1, [r0, #2]
	add r1, r1, #0x2040000
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	mov r1, r2, lsl #8
	orr r1, r1, r2, asr #8
	strh r1, [r4, #0x14]
	ldrh r0, [r0, #2]
	add r0, r0, #0x2040000
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	strh r0, [r4, #0x16]
_020A4E48:
	sub r0, r4, #0xc
	add r1, r5, #0xc
	mov r2, #0
	bl sub_020A3CC8
	mov r2, r0
	mov r0, sb
	mov r1, r8
	bl sub_020A3CC8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_020A3D7C
	mov r3, r0, lsl #8
	orr r0, r3, r0, asr #8
	strh r0, [r4, #0x10]
	mov r0, r4
	ldr r4, [r7, #0x1c]
	mov r3, #6
	str r4, [sp]
	str r3, [sp, #4]
	mov r1, r5
	mov r2, sb
	mov r3, r8
	bl sub_020A4880
	ldr r0, [r7, #0x28]
	tst r6, #3
	add r0, r0, r8
	str r0, [r7, #0x28]
	ldrne r0, [r7, #0x28]
	addne r0, r0, #1
	strne r0, [r7, #0x28]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020A4EC8: .word 0x021E16A0
_020A4ECC: .word 0x021D4888
_020A4ED0: .word 0x021D4B32
_020A4ED4: .word 0x021D4620
	arm_func_end sub_020A4C64

	arm_func_start sub_020A4ED8
sub_020A4ED8: ; 0x020A4ED8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r3, #0x200
	add r0, r4, #8
	add r1, r4, #0x12
	mov r2, #0xa
	strh r3, [r4, #6]
	bl sub_020D4A50
	ldr r0, _020A4F78 ; =0x021D4B08
	add r1, r4, #8
	mov r2, #6
	bl sub_020D4A50
	ldr r3, _020A4F7C ; =0x021D4620
	add r0, r4, #0x12
	ldr r2, [r3, #0x50]
	sub r1, r4, #0xe
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #0x10
	mov ip, r2, lsr #0x10
	mov r2, ip, lsl #8
	orr r2, r2, ip, asr #8
	strh r2, [r4, #0xe]
	ldr r3, [r3, #0x50]
	mov r2, #6
	mov r3, r3, lsl #0x10
	mov ip, r3, lsr #0x10
	mov r3, ip, lsl #8
	orr r3, r3, ip, asr #8
	strh r3, [r4, #0x10]
	bl sub_020D4A50
	ldr r0, _020A4F78 ; =0x021D4B08
	sub r1, r4, #8
	mov r2, #6
	bl sub_020D4A50
	sub r0, r4, #0xe
	mov r1, #0x2a
	mov r2, #0
	mov r3, r2
	bl sub_020A3F64
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A4F78: .word 0x021D4B08
_020A4F7C: .word 0x021D4620
	arm_func_end sub_020A4ED8

	arm_func_start sub_020A4F80
sub_020A4F80: ; 0x020A4F80
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	cmp r1, #0x1c
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _020A50B8 ; =0x021D4B08
	add r0, r6, #8
	bl sub_020A3F38
	cmp r0, #0
	ldrne r0, _020A50BC ; =0x021D4620
	ldrne r0, [r0, #0x50]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r6]
	cmp r0, #0x100
	ldreqh r0, [r6, #2]
	cmpeq r0, #8
	ldreqh r1, [r6, #4]
	ldreq r0, _020A50C0 ; =0x00000406
	cmpeq r1, r0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r1, [r6, #6]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	cmp r4, #1
	cmpne r4, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r5, [r6, #0x10]
	ldrh r3, [r6, #0xe]
	ldrh lr, [r6, #0x1a]
	mov r0, r5, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, r5, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	ldrh ip, [r6, #0x18]
	ldr r2, _020A50BC ; =0x021D4620
	mov r3, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	ldr r0, [r2, #0x50]
	orr r1, r1, r3, lsl #16
	mov r3, ip, lsl #8
	cmp r1, r0
	moveq r5, #1
	mov r2, lr, lsl #8
	orr ip, r3, ip, asr #8
	orr r3, r2, lr, asr #8
	mov r2, ip, lsl #0x10
	mov r3, r3, lsl #0x10
	mov ip, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, ip, lsl #16
	movne r5, #0
	cmp r0, r2
	moveq r7, #1
	movne r7, #0
	cmp r5, #0
	bne _020A507C
	mov r2, r7
	add r0, r6, #8
	bl sub_020A454C
_020A507C:
	cmp r4, #1
	bne _020A5098
	cmp r7, #0
	beq _020A5098
	mov r0, r6
	bl sub_020A4ED8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A5098:
	cmp r4, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, #0
	cmpne r5, #0
	ldrne r0, _020A50BC ; =0x021D4620
	movne r1, #1
	strneb r1, [r0, #1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A50B8: .word 0x021D4B08
_020A50BC: .word 0x021D4620
_020A50C0: .word 0x00000406
	arm_func_end sub_020A4F80

	arm_func_start sub_020A50C4
sub_020A50C4: ; 0x020A50C4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r6, r0
	ldrh r4, [r6, #0xe]
	ldrh r3, [r6, #0xc]
	mov r5, r1
	mov r0, r4, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, r4, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r3, lsl #16
	mov r4, r2
	bl sub_020A3E44
	movs r7, r0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_020A4310
	cmp r0, #0
	bne _020A5130
	mov r0, r7
	bl sub_020A43E0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A5130:
	mov r2, #0
	strb r2, [r5]
	mov r0, r5
	mov r1, r4
	strh r2, [r5, #2]
	bl sub_020A3D98
	mov r1, r0, lsl #8
	orr r0, r1, r0, asr #8
	strh r0, [r5, #2]
	ldrh ip, [r6, #0xe]
	ldrh r3, [r6, #0xc]
	mov r2, #0
	mov r0, ip, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, ip, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r6, r0, r3, lsl #16
	mov r0, r5
	mov r1, r4
	mov r3, r2
	str r6, [sp]
	mov r4, #1
	str r4, [sp, #4]
	bl sub_020A4880
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020A50C4

	arm_func_start sub_020A51A8
sub_020A51A8: ; 0x020A51A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	bl sub_020D3A38
	ldr r1, _020A52A4 ; =0x021E16A0
	mov r5, r0
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _020A5298
_020A51D0:
	ldr r4, [r1, #0xa4]
	cmp r4, #0
	ldrne r3, [r4]
	cmpne r3, #0
	beq _020A528C
	ldrb r0, [r4, #8]
	cmp r0, #0xb
	ldreqh r2, [r7, #4]
	moveq r0, r3, lsl #0x10
	cmpeq r2, r0, lsr #16
	ldreqh r2, [r4, #0xa]
	ldreqh r0, [r7, #6]
	cmpeq r2, r0
	ldreq r0, [r4, #0x44]
	cmpeq r0, #0
	bne _020A528C
	ldrh lr, [r8, #0xe]
	ldrh ip, [r8, #0xc]
	ldr r0, [r4, #0x1c]
	mov r2, lr, lsl #8
	mov r3, ip, lsl #8
	orr ip, r3, ip, asr #8
	orr r3, r2, lr, asr #8
	mov r2, ip, lsl #0x10
	mov r3, r3, lsl #0x10
	mov ip, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, ip, lsl #16
	cmp r0, r2
	bne _020A528C
	ldr r1, [r4, #0x3c]
	sub r0, r6, #8
	cmp r0, r1
	strhi r1, [r4, #0x44]
	strls r0, [r4, #0x44]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	add r0, r7, #8
	bl sub_020D4A50
	ldr r0, [r4, #4]
	cmp r0, #3
	bne _020A5298
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	bl sub_020D1F34
	b _020A5298
_020A528C:
	ldr r1, [r1, #0x68]
	cmp r1, #0
	bne _020A51D0
_020A5298:
	mov r0, r5
	bl sub_020D3A4C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A52A4: .word 0x021E16A0
	arm_func_end sub_020A51A8

	arm_func_start sub_020A52A8
sub_020A52A8: ; 0x020A52A8
	cmp r0, #0
	mvnne r2, #0
	cmpne r0, r2
	cmpne r1, #0
	cmpne r1, r2
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end sub_020A52A8

	arm_func_start sub_020A52C8
sub_020A52C8: ; 0x020A52C8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r0, r5
	mov r1, r4
	bl sub_020A3D98
	ldr r1, _020A5394 ; =0x0000FFFF
	cmp r0, r1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrh r0, [r6, #0x12]
	ldrh r8, [r6, #0x10]
	ldrh r7, [r6, #0xe]
	ldrh lr, [r6, #0xc]
	mov r2, r8, lsl #8
	orr r2, r2, r8, asr #8
	mov ip, lr, lsl #8
	mov r2, r2, lsl #0x10
	mov r3, r7, lsl #8
	orr lr, ip, lr, asr #8
	mov r1, r0, lsl #8
	orr ip, r3, r7, asr #8
	orr r3, r1, r0, asr #8
	mov r0, lr, lsl #0x10
	mov r1, ip, lsl #0x10
	mov ip, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	mov r3, r3, lsl #0x10
	mov r2, r2, lsr #0x10
	mov r1, r3, lsr #0x10
	orr r0, r0, ip, lsl #16
	orr r1, r1, r2, lsl #16
	bl sub_020A52A8
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r5]
	cmp r0, #0
	beq _020A536C
	cmp r0, #8
	beq _020A5380
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A536C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020A51A8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A5380:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020A50C4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A5394: .word 0x0000FFFF
	arm_func_end sub_020A52C8

	arm_func_start sub_020A5398
sub_020A5398: ; 0x020A5398
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020A5468 ; =0x021E16A0
	ldr ip, [r2, #8]
	cmp ip, #0
	beq _020A5460
_020A53AC:
	ldr r3, [ip, #0xa4]
	cmp r3, #0
	ldrne r2, [r3]
	cmpne r2, #0
	beq _020A5454
	ldrb r2, [r3, #8]
	cmp r2, #1
	bne _020A5454
	ldrh r5, [r1, #2]
	ldrh r4, [r3, #0xa]
	mov r2, r5, lsl #8
	orr r2, r2, r5, asr #8
	mov r2, r2, lsl #0x10
	cmp r4, r2, lsr #16
	bne _020A5454
	ldrh r5, [r3, #0x18]
	cmp r5, #0
	beq _020A540C
	ldrh r4, [r1]
	mov r2, r4, lsl #8
	orr r2, r2, r4, asr #8
	mov r2, r2, lsl #0x10
	cmp r5, r2, lsr #16
	bne _020A5454
_020A540C:
	ldr r2, [r3, #0x1c]
	cmp r2, #0
	beq _020A544C
	ldrh r6, [r0, #0xe]
	ldrh r5, [r0, #0xc]
	mov r4, r6, lsl #8
	mov lr, r5, lsl #8
	orr lr, lr, r5, asr #8
	orr r4, r4, r6, asr #8
	mov lr, lr, lsl #0x10
	mov r4, r4, lsl #0x10
	mov lr, lr, lsr #0x10
	mov r4, r4, lsr #0x10
	orr r4, r4, lr, lsl #16
	cmp r2, r4
	bne _020A5454
_020A544C:
	mov r0, r3
	ldmia sp!, {r4, r5, r6, pc}
_020A5454:
	ldr ip, [ip, #0x68]
	cmp ip, #0
	bne _020A53AC
_020A5460:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A5468: .word 0x021E16A0
	arm_func_end sub_020A5398

	arm_func_start sub_020A546C
sub_020A546C: ; 0x020A546C
	stmdb sp!, {r4, r5, r6, lr}
	ldrb r4, [r2, #8]
	mov r3, #0
	mov r5, r3
	cmp r4, #0xa
	cmpne r4, #0xb
	movne r5, #1
	mov ip, r3
	mov r6, r3
	cmp r5, #0
	beq _020A54B4
	ldrh lr, [r1, #2]
	ldrh r5, [r2, #0xa]
	mov r4, lr, lsl #8
	orr r4, r4, lr, asr #8
	mov lr, r4, lsl #0x10
	cmp r5, lr, lsr #16
	moveq r6, #1
_020A54B4:
	cmp r6, #0
	beq _020A54D8
	ldrh lr, [r1]
	ldrh r4, [r2, #0x18]
	mov r1, lr, lsl #8
	orr r1, r1, lr, asr #8
	mov r1, r1, lsl #0x10
	cmp r4, r1, lsr #16
	moveq ip, #1
_020A54D8:
	cmp ip, #0
	beq _020A5518
	ldrh lr, [r0, #0xc]
	ldrh r4, [r0, #0xe]
	ldr ip, [r2, #0x1c]
	mov r1, lr, lsl #8
	mov r0, r4, lsl #8
	orr r2, r1, lr, asr #8
	orr r1, r0, r4, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	cmp ip, r0
	moveq r3, #1
_020A5518:
	mov r0, r3
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A546C

	arm_func_start sub_020A5520
sub_020A5520: ; 0x020A5520
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020A5580 ; =0x021E16A0
	mov r7, r0
	ldr r5, [r2, #8]
	mov r6, r1
	cmp r5, #0
	beq _020A5578
_020A553C:
	ldr r4, [r5, #0xa4]
	cmp r4, #0
	ldrne r0, [r4]
	cmpne r0, #0
	beq _020A556C
	mov r0, r7
	mov r1, r6
	mov r2, r4
	bl sub_020A546C
	cmp r0, #0
	movne r0, r4
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_020A556C:
	ldr r5, [r5, #0x68]
	cmp r5, #0
	bne _020A553C
_020A5578:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A5580: .word 0x021E16A0
	arm_func_end sub_020A5520

	arm_func_start sub_020A5584
sub_020A5584: ; 0x020A5584
	mov r2, #0x218
	strh r2, [r1, #0x2e]
	ldrb r2, [r0, #0xc]
	add r3, r0, #0x14
	and r2, r2, #0xf0
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	mov r0, r0, asr #2
	subs r0, r0, #0x14
	sub ip, r0, #1
	bxeq lr
_020A55B0:
	ldrb r0, [r3], #1
	cmp r0, #0
	bxeq lr
	cmp r0, #1
	beq _020A55F8
	cmp r0, #2
	bne _020A55E8
	ldrb r2, [r3, #1]
	ldrb r0, [r3, #2]
	add r3, r3, #3
	sub ip, ip, #3
	orr r0, r0, r2, lsl #8
	strh r0, [r1, #0x2e]
	b _020A55F8
_020A55E8:
	ldrb r0, [r3]
	sub r0, r0, #1
	sub ip, ip, r0
	add r3, r3, r0
_020A55F8:
	cmp ip, #0
	sub ip, ip, #1
	bne _020A55B0
	bx lr
	arm_func_end sub_020A5584

	arm_func_start sub_020A5608
sub_020A5608: ; 0x020A5608
	stmdb sp!, {r3, lr}
	bl sub_020A3E44
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl sub_020A4310
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A5608

	arm_func_start sub_020A5624
sub_020A5624: ; 0x020A5624
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r0, [r6, #0x1c]
	mov r5, r1
	mov r4, r2
	bl sub_020A5608
	cmp r0, #0
	bne _020A565C
	ldr r0, _020A5690 ; =0x021E16A0
	ldr r1, _020A5694 ; =0x021D4888
	ldr r0, [r0, #4]
	cmp r0, r1
	beq _020A567C
_020A565C:
	mov r0, #0
	mov r1, r0
	mov r2, r6
	mov r3, r5
	str r4, [sp]
	bl sub_020A4C64
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
_020A567C:
	ldr r0, [r6, #0x1c]
	bl sub_020A3E44
	bl sub_020A43E0
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020A5690: .word 0x021E16A0
_020A5694: .word 0x021D4888
	arm_func_end sub_020A5624

	arm_func_start sub_020A5698
sub_020A5698: ; 0x020A5698
	ldr ip, _020A56A8 ; =sub_020A5624
	mov r2, r1
	mov r1, #0x10
	bx ip
	.align 2, 0
_020A56A8: .word sub_020A5624
	arm_func_end sub_020A5698

	arm_func_start sub_020A56AC
sub_020A56AC: ; 0x020A56AC
	ldr ip, _020A56BC ; =sub_020A5624
	mov r2, r1
	mov r1, #0x11
	bx ip
	.align 2, 0
_020A56BC: .word sub_020A5624
	arm_func_end sub_020A56AC

	arm_func_start sub_020A56C0
sub_020A56C0: ; 0x020A56C0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _020A57F0 ; =0x021D4764
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r0, r4
	mov r1, #0
	mov r2, #0x64
	mov r5, r3
	bl sub_020D4994
	ldrh r3, [r7, #2]
	ldr r0, _020A57F4 ; =0x021D4720
	ldr r2, _020A57F8 ; =0x021D4620
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	strh r1, [r0, #0x4e]
	ldrh r3, [r7]
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	strh r1, [r0, #0x5c]
	ldrh ip, [r8, #0xe]
	ldrh r3, [r8, #0xc]
	mov r0, ip, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, ip, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r3, lsl #16
	str r0, [r2, #0x160]
	ldrb r0, [r7, #0xd]
	tst r0, #0x10
	beq _020A5790
	ldrh r6, [r7, #0xa]
	ldrh r3, [r7, #8]
	mov r0, r4
	mov r1, r6, lsl #8
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	orr r2, r1, r6, asr #8
	mov r1, r3, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	orr r3, r1, r3, lsl #16
	mov r2, r5
	mov r1, #4
	str r3, [r4, #0x28]
	bl sub_020A5624
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A5790:
	mov r0, #0
	str r0, [r4, #0x28]
	ldrh r3, [r7, #6]
	ldrh r2, [r7, #4]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	add r1, r6, r0
	str r1, [r4, #0x24]
	ldrb r0, [r7, #0xd]
	mov r2, r5
	tst r0, #3
	addne r0, r1, #1
	strne r0, [r4, #0x24]
	mov r0, r4
	mov r1, #0x14
	bl sub_020A5624
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A57F0: .word 0x021D4764
_020A57F4: .word 0x021D4720
_020A57F8: .word 0x021D4620
	arm_func_end sub_020A56C0

	arm_func_start sub_020A57FC
sub_020A57FC: ; 0x020A57FC
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r2
	mov r2, #3
	mov r6, r0
	mov r5, r1
	strb r2, [r4, #8]
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [r4, #0x10]
	ldrh r2, [r6, #0x12]
	ldrh r3, [r6, #0x10]
	mov r0, r5
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	orr r1, r1, r3, lsl #16
	str r1, [r4, #0x14]
	ldrh r3, [r5]
	mov r1, r4
	mov r2, r3, lsl #8
	orr r2, r2, r3, asr #8
	strh r2, [r4, #0x18]
	ldrh r3, [r6, #0xe]
	ldrh r6, [r6, #0xc]
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	mov r2, r6, lsl #8
	orr r2, r2, r6, asr #8
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x10
	mov r6, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, r6, lsl #16
	str r2, [r4, #0x1c]
	ldrh r6, [r5, #6]
	ldrh r5, [r5, #4]
	mov r2, r6, lsl #8
	mov r3, r5, lsl #8
	orr r5, r3, r5, asr #8
	orr r3, r2, r6, asr #8
	mov r2, r5, lsl #0x10
	mov r3, r3, lsl #0x10
	mov r5, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, r5, lsl #16
	add r2, r2, #1
	str r2, [r4, #0x24]
	bl sub_020A5584
	mov r0, r4
	mov r1, #0x12
	mov r2, #0
	bl sub_020A5624
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A57FC

	arm_func_start sub_020A58E8
sub_020A58E8: ; 0x020A58E8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020A5520
	movs r2, r0
	beq _020A5968
	ldrb r0, [r2, #8]
	cmp r0, #1
	bne _020A5920
	mov r0, r6
	mov r1, r5
	bl sub_020A57FC
	b _020A5960
_020A5920:
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _020A594C
	ldr r1, [r2, #0x28]
	mov r0, r6
	sub r3, r1, #1
	mov r1, r5
	str r3, [r2, #0x28]
	bl sub_020A57FC
	b _020A5960
_020A594C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl sub_020A56C0
_020A5960:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020A5968:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A58E8

	arm_func_start sub_020A5970
sub_020A5970: ; 0x020A5970
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	ldrh r0, [r4, #0x12]
	ldrh r8, [r4, #0x10]
	ldrh r7, [r4, #0xe]
	ldrh r6, [r4, #0xc]
	mov ip, r8, lsl #8
	orr ip, ip, r8, asr #8
	mov r5, r6, lsl #8
	mov ip, ip, lsl #0x10
	mov lr, r7, lsl #8
	orr r6, r5, r6, asr #8
	mov r3, r0, lsl #8
	orr r5, lr, r7, asr #8
	orr lr, r3, r0, asr #8
	mov r0, r6, lsl #0x10
	mov r3, r5, lsl #0x10
	mov r5, r0, lsr #0x10
	mov r0, r3, lsr #0x10
	mov lr, lr, lsl #0x10
	orr r0, r0, r5, lsl #16
	mov ip, ip, lsr #0x10
	mov r3, lr, lsr #0x10
	mov r6, r1
	orr r1, r3, ip, lsl #16
	mov r5, r2
	bl sub_020A52A8
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_020A58E8
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	mov r1, r6
	bl sub_020A5398
	movs r2, r0
	beq _020A5A20
	mov r0, r4
	mov r1, r6
	bl sub_020A57FC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A5A20:
	bl sub_020D1FA0
	mov r0, r4
	mov r1, r6
	bl sub_020A5398
	movs r2, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	mov r1, r6
	bl sub_020A57FC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020A5970

	arm_func_start sub_020A5A48
sub_020A5A48: ; 0x020A5A48
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r5, r1
	mov r6, r2
	bl sub_020A5520
	movs r4, r0
	beq _020A5A70
	ldrb r0, [r4, #8]
	cmp r0, #2
	beq _020A5A88
_020A5A70:
	mov r0, r7
	mov r1, r5
	mov r2, r6
	mov r3, #0
	bl sub_020A56C0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A5A88:
	bl sub_020D1FA0
	ldrh ip, [r5, #6]
	ldrh r3, [r5, #4]
	mov r0, r5
	mov r1, ip, lsl #8
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	orr r2, r1, ip, asr #8
	mov r1, r3, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	orr r1, r1, r3, lsl #16
	add r1, r1, #1
	str r1, [r4, #0x24]
	ldrh lr, [r5, #0xa]
	ldrh ip, [r5, #8]
	mov r1, r4
	mov r2, lr, lsl #8
	mov r3, ip, lsl #8
	orr ip, r3, ip, asr #8
	orr r3, r2, lr, asr #8
	mov r2, ip, lsl #0x10
	mov r3, r3, lsl #0x10
	mov ip, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, ip, lsl #16
	str r2, [r4, #0x30]
	ldrh r3, [r5, #0xe]
	mov r2, r3, lsl #8
	orr r2, r2, r3, asr #8
	strh r2, [r4, #0x2c]
	bl sub_020A5584
	mov r0, r4
	mov r1, #0
	bl sub_020A5698
	mov r0, #4
	strb r0, [r4, #8]
	ldr r0, [r4, #4]
	cmp r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	bl sub_020D1F34
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020A5A48

	arm_func_start sub_020A5B40
sub_020A5B40: ; 0x020A5B40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov sb, r1
	mov r8, r2
	bl sub_020A5520
	movs r5, r0
	bne _020A5B74
	mov r0, r4
	mov r1, sb
	mov r2, r8
	mov r3, #0
	bl sub_020A56C0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020A5B74:
	ldrh r6, [sb, #0xa]
	ldrh r3, [sb, #8]
	ldr r2, [r5, #0x30]
	mov r0, r6, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, r6, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r1, r0, r3, lsl #16
	sub r0, r1, r2
	ldrb r6, [sb, #0xd]
	cmp r0, #0
	strgt r1, [r5, #0x30]
	ldrh r7, [sb, #6]
	ldrh r3, [sb, #4]
	ldrb r2, [r5, #8]
	mov r0, r7, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, r7, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	cmp r2, #4
	orr r1, r0, r3, lsl #16
	bne _020A5C08
	ldr r0, [r5, #0x24]
	cmp r0, r1
	beq _020A5C08
	mov r0, r5
	mov r1, #0
	bl sub_020A5698
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020A5C08:
	ldrh r1, [sb, #0xe]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	strh r0, [r5, #0x2c]
	ldrb r0, [r5, #8]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _020A5E34
_020A5C28: ; jump table
	b _020A5C50 ; case 0
	b _020A5E34 ; case 1
	b _020A5C50 ; case 2
	b _020A5C68 ; case 3
	b _020A5C94 ; case 4
	b _020A5E34 ; case 5
	b _020A5E10 ; case 6
	b _020A5D9C ; case 7
	b _020A5D9C ; case 8
	b _020A5E10 ; case 9
_020A5C50:
	mov r0, r4
	mov r1, sb
	mov r2, r8
	mov r3, #0
	bl sub_020A56C0
	b _020A5E50
_020A5C68:
	mov r0, #4
	strb r0, [r5, #8]
	ldr r0, [r5, #4]
	cmp r0, #1
	bne _020A5C8C
	mov r0, #0
	str r0, [r5, #4]
	ldr r0, [r5]
	bl sub_020D1F34
_020A5C8C:
	cmp r8, #0
	beq _020A5E50
_020A5C94:
	ldr r0, [r5, #0x34]
	add r0, r0, #1
	str r0, [r5, #0x34]
	ldr r1, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	sub r0, r1, r0
	cmp r8, r0
	movhi r7, #0
	movhi r8, r0
	movls r7, #1
	cmp r8, #0
	beq _020A5D30
	bl sub_020D3A38
	ldrb r1, [sb, #0xc]
	ldr ip, [r5, #0x40]
	ldr r3, [r5, #0x44]
	and r2, r1, #0xf0
	mov r1, r2, asr #1
	add r1, r2, r1, lsr #30
	mov r4, r0
	mov r2, r8
	add r0, sb, r1, asr #2
	add r1, ip, r3
	bl sub_020D4A50
	ldr r1, [r5, #0x44]
	mov r0, r4
	add r1, r1, r8
	str r1, [r5, #0x44]
	ldr r1, [r5, #0x24]
	add r1, r1, r8
	str r1, [r5, #0x24]
	bl sub_020D3A4C
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _020A5D30
	mov r0, #0
	str r0, [r5, #4]
	ldr r0, [r5]
	bl sub_020D1F34
_020A5D30:
	cmp r7, #0
	beq _020A5D84
	tst r6, #1
	beq _020A5D84
	mov r0, #6
	strb r0, [r5, #8]
	ldr r1, [r5, #0x24]
	mov r0, r5
	add r2, r1, #1
	mov r1, #0
	str r2, [r5, #0x24]
	bl sub_020A56AC
	cmp r8, #0
	ldreq r0, [r5, #4]
	cmpeq r0, #2
	bne _020A5E50
	mov r0, #0
	str r0, [r5, #4]
	ldr r0, [r5]
	bl sub_020D1F34
	b _020A5E50
_020A5D84:
	cmp r8, #0
	beq _020A5E50
	mov r0, r5
	mov r1, #0
	bl sub_020A5698
	b _020A5E50
_020A5D9C:
	tst r6, #1
	beq _020A5DE4
	ldr r1, [r5, #0x24]
	add r0, r8, #1
	add r2, r1, r0
	mov r0, r5
	mov r1, #0
	str r2, [r5, #0x24]
	bl sub_020A5698
	mov r1, #0
	strb r1, [r5, #8]
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _020A5E50
	str r1, [r5, #4]
	ldr r0, [r5]
	bl sub_020D1F34
	b _020A5E50
_020A5DE4:
	cmp r8, #0
	beq _020A5E04
	ldr r1, [r5, #0x24]
	mov r0, r5
	add r2, r1, r8
	mov r1, #0
	str r2, [r5, #0x24]
	bl sub_020A5698
_020A5E04:
	mov r0, #8
	strb r0, [r5, #8]
	b _020A5E50
_020A5E10:
	mov r1, #0
	strb r1, [r5, #8]
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _020A5E50
	str r1, [r5, #4]
	ldr r0, [r5]
	bl sub_020D1F34
	b _020A5E50
_020A5E34:
	tst r6, #1
	ldrne r0, [r5, #0x24]
	mov r1, #0
	addne r0, r0, #1
	strne r0, [r5, #0x24]
	mov r0, r5
	bl sub_020A5698
_020A5E50:
	bl sub_020D1FA0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020A5B40

	arm_func_start sub_020A5E58
sub_020A5E58: ; 0x020A5E58
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_020A5520
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r4, #8]
	cmp r1, #4
	beq _020A5EEC
	cmp r1, #7
	beq _020A5E94
	cmp r1, #8
	beq _020A5EB4
	b _020A5F0C
_020A5E94:
	ldr r2, [r4, #0x24]
	mov r1, #0
	add r2, r2, #1
	str r2, [r4, #0x24]
	bl sub_020A5698
	mov r0, #9
	strb r0, [r4, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A5EB4:
	ldr r2, [r4, #0x24]
	mov r1, #0
	add r2, r2, #1
	str r2, [r4, #0x24]
	bl sub_020A5698
	mov r1, #0
	strb r1, [r4, #8]
	ldr r0, [r4, #4]
	cmp r0, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	str r1, [r4, #4]
	ldr r0, [r4]
	bl sub_020D1F34
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A5EEC:
	ldr r2, [r4, #0x24]
	mov r1, #0
	add r2, r2, #1
	str r2, [r4, #0x24]
	bl sub_020A56AC
	mov r0, #6
	strb r0, [r4, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A5F0C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, #0
	bl sub_020A56C0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020A5E58

	arm_func_start sub_020A5F24
sub_020A5F24: ; 0x020A5F24
	stmdb sp!, {r4, lr}
	bl sub_020A5520
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	bl sub_020D1FA0
	mov r1, #0
	strb r1, [r4, #8]
	ldr r0, [r4, #4]
	sub r0, r0, #1
	cmp r0, #1
	ldmhiia sp!, {r4, pc}
	str r1, [r4, #4]
	ldr r0, [r4]
	bl sub_020D1F34
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A5F24

	arm_func_start sub_020A5F60
sub_020A5F60: ; 0x020A5F60
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r0, r5
	mov r1, r4
	mov r2, r6
	mov r3, #6
	bl sub_020A3DB4
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldrb r0, [r5, #0xc]
	ldrb r2, [r5, #0xd]
	and r1, r0, #0xf0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	and r1, r2, #0x17
	cmp r1, #0x10
	sub r4, r4, r0, asr #2
	bgt _020A5FD8
	cmp r1, #0x10
	bge _020A6030
	cmp r1, #2
	bgt _020A6058
	cmp r1, #1
	blt _020A6058
	beq _020A6044
	cmp r1, #2
	beq _020A5FF8
	b _020A6058
_020A5FD8:
	cmp r1, #0x12
	bgt _020A6058
	cmp r1, #0x11
	blt _020A6058
	beq _020A6030
	cmp r1, #0x12
	beq _020A6014
	b _020A6058
_020A5FF8:
	tst r2, #0x28
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020A5970
	ldmia sp!, {r4, r5, r6, pc}
_020A6014:
	tst r2, #0x28
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020A5A48
	ldmia sp!, {r4, r5, r6, pc}
_020A6030:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020A5B40
	ldmia sp!, {r4, r5, r6, pc}
_020A6044:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020A5E58
	ldmia sp!, {r4, r5, r6, pc}
_020A6058:
	tst r2, #4
	mov r0, r6
	mov r1, r5
	beq _020A6070
	bl sub_020A5F24
	ldmia sp!, {r4, r5, r6, pc}
_020A6070:
	mov r2, r4
	mov r3, #0
	bl sub_020A56C0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A5F60

	arm_func_start sub_020A6080
sub_020A6080: ; 0x020A6080
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r1
	ldrh r1, [r7, #6]
	mov r8, r0
	mov r6, r2
	cmp r1, #0
	beq _020A60B8
	mov r0, r7
	mov r1, r6
	mov r2, r8
	mov r3, #0x11
	bl sub_020A3DB4
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020A60B8:
	bl sub_020D3A38
	ldr r1, _020A6288 ; =0x021E16A0
	mov r5, r0
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _020A627C
	mvn ip, #0
_020A60D4:
	ldr r4, [r1, #0xa4]
	cmp r4, #0
	ldrne r0, [r4]
	cmpne r0, #0
	beq _020A6270
	ldrb r0, [r4, #8]
	cmp r0, #0xa
	bne _020A6270
	ldrh r3, [r7, #2]
	ldrh r2, [r4, #0xa]
	mov r0, r3, lsl #8
	orr r0, r0, r3, asr #8
	mov r0, r0, lsl #0x10
	cmp r2, r0, lsr #16
	bne _020A6270
	ldrh r3, [r4, #0x18]
	cmp r3, #0
	beq _020A6134
	ldrh r2, [r7]
	mov r0, r2, lsl #8
	orr r0, r0, r2, asr #8
	mov r0, r0, lsl #0x10
	cmp r3, r0, lsr #16
	bne _020A6270
_020A6134:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	cmpne r0, ip
	beq _020A6178
	ldrh sb, [r8, #0xe]
	ldrh lr, [r8, #0xc]
	mov r2, sb, lsl #8
	mov r3, lr, lsl #8
	orr lr, r3, lr, asr #8
	orr r3, r2, sb, asr #8
	mov r2, lr, lsl #0x10
	mov r3, r3, lsl #0x10
	mov lr, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, lr, lsl #16
	cmp r0, r2
	bne _020A6270
_020A6178:
	ldrh r3, [r8, #0x12]
	ldrh r2, [r8, #0x10]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _020A61F4
	ldrh r3, [r8, #0xe]
	ldrh r2, [r8, #0xc]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	str r0, [r4, #0x1c]
	ldrh r1, [r7]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	strh r0, [r4, #0x18]
_020A61F4:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _020A627C
	ldr r1, [r4, #0x3c]
	sub r0, r6, #8
	cmp r0, r1
	strhi r1, [r4, #0x44]
	strls r0, [r4, #0x44]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	add r0, r7, #8
	bl sub_020D4A50
	ldr r0, [r4, #4]
	cmp r0, #3
	bne _020A6244
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	bl sub_020D1F34
	b _020A627C
_020A6244:
	ldr r3, [r4, #0x38]
	cmp r3, #0
	beq _020A627C
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x44]
	mov r2, r4
	blx r3
	cmp r0, #0
	movne r0, #0
	strne r0, [r4, #0x44]
	b _020A627C
_020A6270:
	ldr r1, [r1, #0x68]
	cmp r1, #0
	bne _020A60D4
_020A627C:
	mov r0, r5
	bl sub_020D3A4C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020A6288: .word 0x021E16A0
	arm_func_end sub_020A6080

	arm_func_start sub_020A628C
sub_020A628C: ; 0x020A628C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r6, #0
	mov sl, r0
	str r6, [r1]
	ldrh r3, [sl, #6]
	str r1, [sp]
	ldr r2, _020A6548 ; =0x00003FFF
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	str r1, [sp, #8]
	tst r1, r2
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r3, [sl, #0xe]
	ldrh r2, [sl, #0xc]
	ldrb r4, [sl]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r3, r4, lsl #0x1c
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	ldrh r4, [sl, #4]
	ldr r7, _020A654C ; =0x021D4948
	mov r0, r6
	mov r5, r3, lsr #0x1a
	orr sb, r1, r2, lsl #16
_020A6310:
	ldrh r2, [r7, #4]
	cmp r2, #0
	beq _020A6330
	ldr r1, [r7]
	cmp r1, sb
	ldreqh r1, [r7, #6]
	cmpeq r1, r4
	beq _020A634C
_020A6330:
	add r0, r0, #1
	cmp r2, #0
	cmpeq r6, #0
	moveq r6, r7
	cmp r0, #8
	add r7, r7, #0x38
	blo _020A6310
_020A634C:
	ldrh r2, [sl, #2]
	cmp r0, #8
	ldr r1, _020A6550 ; =0x00001FFF
	mov r0, r2, lsl #8
	orr r0, r0, r2, asr #8
	mov r0, r0, lsl #0x10
	rsb r0, r5, r0, lsr #16
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	and fp, r0, r1
	ldr r0, [sp, #4]
	add r8, r0, fp, lsl #3
	bne _020A6408
	cmp r6, #0
	beq _020A6390
	cmp r8, #0x1000
	bls _020A639C
_020A6390:
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020A639C:
	ldr r1, _020A6554 ; =0x021D4620
	add r0, r5, #0xe
	ldr r1, [r1, #0x14]
	add r0, r0, #0x1000
	mov r7, r6
	blx r1
	cmp r0, #0
	str r0, [r6, #0x34]
	addeq sp, sp, #0xc
	mov r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str sb, [r6]
	strh r4, [r6, #6]
	strh r0, [r6, #8]
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [r6, #0x2c]
	ldr r1, [r6, #0x34]
	mov r0, sl
	add r1, r1, #0xe
	add r1, r1, r5
	str r1, [r6, #0x30]
	ldr r1, [r6, #0x34]
	mov r2, r5
	add r1, r1, #0xe
	bl sub_020D4A50
_020A6408:
	ldrh r0, [r7, #4]
	cmp r0, #8
	beq _020A641C
	cmp r8, #0x1000
	bls _020A6440
_020A641C:
	ldr r1, _020A6554 ; =0x021D4620
	mov r0, #0
	strh r0, [r7, #4]
	ldr r0, [r7, #0x34]
	ldr r1, [r1, #0x40]
	blx r1
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020A6440:
	ldr r0, [sp, #4]
	ldr r2, [sp, #4]
	add r1, r0, #7
	ldr r0, [sp, #8]
	add r3, fp, r1, lsr #3
	tst r0, #0x2000
	streqh r8, [r7, #0xa]
	streqh r3, [r7, #8]
	ldrh r1, [r7, #4]
	add r0, sl, r5
	add r1, r7, r1, lsl #1
	strh fp, [r1, #0xc]
	ldrh r1, [r7, #4]
	add r1, r7, r1, lsl #1
	strh r3, [r1, #0x1c]
	ldrh r1, [r7, #4]
	add r1, r1, #1
	strh r1, [r7, #4]
	ldr r1, [r7, #0x30]
	add r1, r1, fp, lsl #3
	bl sub_020D4A50
	ldrh r4, [r7, #8]
	cmp r4, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r3, [r7, #4]
	mov r6, #0
	mov r5, r6
	cmp r3, #0
	bls _020A64F0
	mov r0, r6
_020A64C0:
	add r2, r7, r5, lsl #1
	ldrh r1, [r2, #0xc]
	cmp r1, r6
	bhi _020A64E4
	ldrh r1, [r2, #0x1c]
	cmp r6, r1
	movlo r6, r1
	movlo r5, r0
	blo _020A64E8
_020A64E4:
	add r5, r5, #1
_020A64E8:
	cmp r5, r3
	blo _020A64C0
_020A64F0:
	cmp r6, r4
	addlo sp, sp, #0xc
	movlo r0, #0
	ldmloia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, [r7, #0x34]
	ldrh r3, [r7, #0xa]
	ldrb r0, [r4, #0xe]
	mov r2, #0
	mov r1, #1
	mov r0, r0, lsl #0x1c
	add r0, r3, r0, lsr #26
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r3, lsl #8
	orr r0, r0, r3, asr #8
	strh r0, [r4, #0x10]
	ldr r0, [sp]
	strh r2, [r7, #4]
	str r1, [r0]
	add r0, r4, #0xe
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A6548: .word 0x00003FFF
_020A654C: .word 0x021D4948
_020A6550: .word 0x00001FFF
_020A6554: .word 0x021D4620
	arm_func_end sub_020A628C

	arm_func_start sub_020A6558
sub_020A6558: ; 0x020A6558
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldrh r7, [r4, #0xe]
	ldrh r6, [r4, #0xc]
	ldrh lr, [r4, #0x12]
	ldrh r5, [r4, #0x10]
	mov r2, r6, lsl #8
	mov r3, lr, lsl #8
	mov ip, r5, lsl #8
	mov r0, r7, lsl #8
	orr r5, ip, r5, asr #8
	orr lr, r3, lr, asr #8
	orr r3, r2, r6, asr #8
	orr ip, r0, r7, asr #8
	mov r0, r5, lsl #0x10
	mov r2, lr, lsl #0x10
	mov r3, r3, lsl #0x10
	mov ip, ip, lsl #0x10
	mov lr, r0, lsr #0x10
	mov r0, r2, lsr #0x10
	mov r3, r3, lsr #0x10
	mov r2, ip, lsr #0x10
	orr r0, r0, lr, lsl #16
	orr r2, r2, r3, lsl #16
	mov r5, r1
	cmp r0, r2
	beq _020A667C
	bl sub_020A3EB8
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r1, [r4, #2]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	mov r0, r0, lsl #0x10
	cmp r5, r0, lsr #16
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r4]
	mov r0, r4
	mov r1, r1, lsl #0x1c
	mov r1, r1, lsr #0x1a
	bl sub_020A3D98
	ldr r1, _020A6714 ; =0x0000FFFF
	cmp r0, r1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh ip, [r4, #0x12]
	ldrh r3, [r4, #0x10]
	ldr r2, _020A6718 ; =0x021D4620
	mov r0, ip, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, ip, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	ldr r1, [r2, #0x50]
	orr r0, r0, r3, lsl #16
	cmp r1, r0
	bne _020A667C
	ldrh ip, [r4, #0xe]
	ldrh r3, [r4, #0xc]
	sub r0, r4, #8
	mov r1, ip, lsl #8
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	orr r2, r1, ip, asr #8
	mov r1, r3, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	orr r1, r1, r3, lsl #16
	mov r2, #1
	bl sub_020A454C
_020A667C:
	add r1, sp, #0
	mov r0, r4
	bl sub_020A628C
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r2, [r4, #2]
	ldrb r3, [r4]
	ldrb ip, [r4, #9]
	mov r1, r2, lsl #8
	orr r1, r1, r2, asr #8
	mov r1, r1, lsl #0x10
	mov r3, r3, lsl #0x1c
	mov r2, r1, lsr #0x10
	cmp ip, #0x11
	add r1, r4, r3, lsr #26
	sub r2, r2, r3, lsr #26
	bne _020A66C8
	bl sub_020A6080
	b _020A66F4
_020A66C8:
	ldr r3, _020A6718 ; =0x021D4620
	ldr r3, [r3, #0x50]
	cmp r3, #0
	beq _020A66F4
	cmp ip, #1
	bne _020A66E8
	bl sub_020A52C8
	b _020A66F4
_020A66E8:
	cmp ip, #6
	bne _020A66F4
	bl sub_020A5F60
_020A66F4:
	ldr r0, [sp]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _020A6718 ; =0x021D4620
	sub r0, r4, #0xe
	ldr r1, [r1, #0x40]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A6714: .word 0x0000FFFF
_020A6718: .word 0x021D4620
	arm_func_end sub_020A6558

	arm_func_start sub_020A671C
sub_020A671C: ; 0x020A671C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, _020A6788 ; =0x00000806
	add r4, sp, #0
_020A6728:
	mov r0, r4
	bl sub_020A420C
	ldr r3, [sp]
	cmp r3, #0x22
	bls _020A6780
	ldrh r2, [r0, #0xc]
	mov r1, r2, lsl #8
	orr r1, r1, r2, asr #8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #0x800
	beq _020A6764
	cmp r1, r5
	beq _020A6774
	b _020A6780
_020A6764:
	add r0, r0, #0xe
	sub r1, r3, #0xe
	bl sub_020A6558
	b _020A6780
_020A6774:
	add r0, r0, #0xe
	sub r1, r3, #0xe
	bl sub_020A4F80
_020A6780:
	bl sub_020A42CC
	b _020A6728
	.align 2, 0
_020A6788: .word 0x00000806
	arm_func_end sub_020A671C

	arm_func_start sub_020A678C
sub_020A678C: ; 0x020A678C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _020A6828 ; =0x021E16A0
	ldr r2, _020A682C ; =0x021D4620
	ldr r0, [r0, #8]
	ldr r1, _020A6830 ; =0x00001388
	mov r4, #0x400
	mov r3, #1
	mov r5, #0
_020A67AC:
	ldrh ip, [r2, #8]
	mov r6, r5
	add ip, ip, #1
	strh ip, [r2, #8]
	ldrh ip, [r2, #8]
	cmp ip, #0x400
	blo _020A67D0
	cmp ip, r1
	blo _020A67D4
_020A67D0:
	strh r4, [r2, #8]
_020A67D4:
	mov r7, r0
	cmp r0, #0
	beq _020A6814
	ldrh r8, [r2, #8]
_020A67E4:
	ldr lr, [r7, #0xa4]
	cmp lr, #0
	ldrne ip, [lr]
	cmpne ip, #0
	beq _020A6808
	ldrh ip, [lr, #0xa]
	cmp ip, r8
	moveq r6, r3
	beq _020A6814
_020A6808:
	ldr r7, [r7, #0x68]
	cmp r7, #0
	bne _020A67E4
_020A6814:
	cmp r6, #0
	bne _020A67AC
	ldr r0, _020A682C ; =0x021D4620
	ldrh r0, [r0, #8]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A6828: .word 0x021E16A0
_020A682C: .word 0x021D4620
_020A6830: .word 0x00001388
	arm_func_end sub_020A678C

	arm_func_start sub_020A6834
sub_020A6834: ; 0x020A6834
	stmdb sp!, {r3, lr}
	ldr r1, _020A6874 ; =0x021D4620
	ldr r3, [r1, #0x70]
	ldr r2, [r1, #0x68]
	ldr r0, [r1, #0x6c]
	umull lr, ip, r3, r2
	mla ip, r3, r0, ip
	ldr r0, [r1, #0x74]
	ldr r3, [r1, #0x78]
	mla ip, r0, r2, ip
	ldr r0, [r1, #0x7c]
	adds r2, r3, lr
	str r2, [r1, #0x68]
	adc r0, r0, ip
	str r0, [r1, #0x6c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A6874: .word 0x021D4620
	arm_func_end sub_020A6834

	arm_func_start sub_020A6878
sub_020A6878: ; 0x020A6878
	ldr r1, _020A6888 ; =0x021E16A0
	ldr r1, [r1, #4]
	str r0, [r1, #0xa4]
	bx lr
	.align 2, 0
_020A6888: .word 0x021E16A0
	arm_func_end sub_020A6878

	arm_func_start sub_020A688C
sub_020A688C: ; 0x020A688C
	ldr r0, _020A68A0 ; =0x021E16A0
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0xa4]
	bx lr
	.align 2, 0
_020A68A0: .word 0x021E16A0
	arm_func_end sub_020A688C

	arm_func_start sub_020A68A4
sub_020A68A4: ; 0x020A68A4
	ldr r0, _020A68CC ; =0x021E16A0
	ldr r0, [r0, #4]
	ldr r1, [r0, #0xa4]
	cmp r1, #0
	bxeq lr
	mov r0, #0xa
	strb r0, [r1, #8]
	mov r0, #0
	str r0, [r1, #0x44]
	bx lr
	.align 2, 0
_020A68CC: .word 0x021E16A0
	arm_func_end sub_020A68A4

	arm_func_start sub_020A68D0
sub_020A68D0: ; 0x020A68D0
	stmdb sp!, {r4, lr}
	ldr r3, _020A6924 ; =0x021E16A0
	ldr r3, [r3, #4]
	ldr r4, [r3, #0xa4]
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, _020A6928 ; =0x7F000001
	cmp r2, r3
	ldreq r2, _020A692C ; =0x021D4620
	ldreq r2, [r2, #0x50]
	cmp r0, #0
	strh r1, [r4, #0x1a]
	ldrh r1, [r4, #0x1a]
	strh r1, [r4, #0x18]
	str r2, [r4, #0x20]
	str r2, [r4, #0x1c]
	strneh r0, [r4, #0xa]
	ldmneia sp!, {r4, pc}
	bl sub_020A678C
	strh r0, [r4, #0xa]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A6924: .word 0x021E16A0
_020A6928: .word 0x7F000001
_020A692C: .word 0x021D4620
	arm_func_end sub_020A68D0

	arm_func_start sub_020A6930
sub_020A6930: ; 0x020A6930
	ldr r0, _020A6960 ; =0x021E16A0
	ldr r0, [r0, #4]
	ldr r1, [r0, #0xa4]
	cmp r1, #0
	bxeq lr
	str r0, [r1]
	mov r0, #0
	strb r0, [r1, #8]
	str r0, [r1, #0x44]
	str r0, [r1, #0x60]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_020A6960: .word 0x021E16A0
	arm_func_end sub_020A6930

	arm_func_start sub_020A6964
sub_020A6964: ; 0x020A6964
	ldr r0, _020A6980 ; =0x021E16A0
	ldr r0, [r0, #4]
	ldr r1, [r0, #0xa4]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1]
	bx lr
	.align 2, 0
_020A6980: .word 0x021E16A0
	arm_func_end sub_020A6964

	arm_func_start sub_020A6984
sub_020A6984: ; 0x020A6984
	ldr r1, _020A6998 ; =0x021E16A0
	ldr r1, [r1, #4]
	ldr r1, [r1, #0xa4]
	str r1, [r0, #0xa4]
	bx lr
	.align 2, 0
_020A6998: .word 0x021E16A0
	arm_func_end sub_020A6984

	arm_func_start sub_020A699C
sub_020A699C: ; 0x020A699C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020A6834
	str r0, [r5, #0x28]
	str r0, [r5, #0x30]
	mov r0, #1
	strb r0, [r5, #8]
	bl sub_020D3A38
	mov r4, r0
	mov r1, #1
	mov r0, #0
	str r1, [r5, #4]
	bl sub_020D1E7C
	mov r0, r4
	bl sub_020D3A4C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A699C

	arm_func_start sub_020A69DC
sub_020A69DC: ; 0x020A69DC
	ldr r1, _020A69F4 ; =0x021E16A0
	ldr r1, [r1, #4]
	ldr r1, [r1, #0xa4]
	cmp r1, #0
	strne r0, [r1, #0x38]
	bx lr
	.align 2, 0
_020A69F4: .word 0x021E16A0
	arm_func_end sub_020A69DC

	arm_func_start sub_020A69F8
sub_020A69F8: ; 0x020A69F8
	stmdb sp!, {r3, lr}
	ldr r0, _020A6A2C ; =0x021E16A0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xa4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r1, [r0, #9]
	cmp r1, #0
	beq _020A6A24
	bl sub_020AB2E4
	ldmia sp!, {r3, pc}
_020A6A24:
	bl sub_020A699C
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A6A2C: .word 0x021E16A0
	arm_func_end sub_020A69F8

	arm_func_start sub_020A6A30
sub_020A6A30: ; 0x020A6A30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl sub_020A6834
	mov r6, #2
	ldr r4, _020A6AE0 ; =0x021D4620
	mov r8, r0
	mov r7, #0
	mov r5, #1
	mov fp, r6
_020A6A54:
	str r8, [sl, #0x28]
	strb r6, [sl, #8]
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [sl, #0x10]
	mov r0, sl
	mov r1, fp
	mov r2, #0x18
	bl sub_020A5624
	bl sub_020D3A38
	mov sb, r0
	ldrb r0, [sl, #8]
	cmp r0, #2
	bne _020A6AA8
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _020A6AA8
	mov r0, #0
	str r5, [sl, #4]
	bl sub_020D1E7C
_020A6AA8:
	mov r0, sb
	bl sub_020D3A4C
	ldrb r0, [sl, #8]
	cmp r0, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _020A6AD8
	add r7, r7, #1
	cmp r7, #3
	blo _020A6A54
_020A6AD8:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A6AE0: .word 0x021D4620
	arm_func_end sub_020A6A30

	arm_func_start sub_020A6AE4
sub_020A6AE4: ; 0x020A6AE4
	stmdb sp!, {r3, lr}
	ldr r0, _020A6B20 ; =0x021E16A0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xa4]
	cmp r0, #0
	beq _020A6B18
	ldrb r1, [r0, #9]
	cmp r1, #0
	beq _020A6B10
	bl sub_020AB420
	ldmia sp!, {r3, pc}
_020A6B10:
	bl sub_020A6A30
	ldmia sp!, {r3, pc}
_020A6B18:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A6B20: .word 0x021E16A0
	arm_func_end sub_020A6AE4

	arm_func_start sub_020A6B24
sub_020A6B24: ; 0x020A6B24
	ldr r2, _020A6B70 ; =0x021E16A0
	ldr r2, [r2, #4]
	ldr r3, [r2, #0xa4]
	cmp r3, #0
	beq _020A6B68
	ldrb r2, [r3, #8]
	cmp r2, #4
	cmpne r2, #0xa
	bne _020A6B68
	cmp r0, #0
	ldrneh r2, [r3, #0x18]
	strneh r2, [r0]
	cmp r1, #0
	ldrne r0, [r3, #0x14]
	strne r0, [r1]
	ldr r0, [r3, #0x1c]
	bx lr
_020A6B68:
	mov r0, #0
	bx lr
	.align 2, 0
_020A6B70: .word 0x021E16A0
	arm_func_end sub_020A6B24

	arm_func_start sub_020A6B74
sub_020A6B74: ; 0x020A6B74
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020D1FA0
	ldrb r1, [r4, #8]
	add r0, r1, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _020A6BAC
	mov r0, r4
	mov r1, #0x19
	bl sub_020A56AC
	mov r0, #7
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_020A6BAC:
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0x1a
	bl sub_020A5698
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A6B74

	arm_func_start sub_020A6BC4
sub_020A6BC4: ; 0x020A6BC4
	stmdb sp!, {r4, lr}
	ldr r0, _020A6BFC ; =0x021E16A0
	ldr r0, [r0, #4]
	ldr r4, [r0, #0xa4]
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _020A6BF0
	mov r0, r4
	bl sub_020AB890
_020A6BF0:
	mov r0, r4
	bl sub_020A6B74
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A6BFC: .word 0x021E16A0
	arm_func_end sub_020A6BC4

	arm_func_start sub_020A6C00
sub_020A6C00: ; 0x020A6C00
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _020A6C80 ; =0x021E16A0
	ldr r0, [r0, #4]
	ldr r4, [r0, #0xa4]
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _020A6C2C
	mov r0, r4
	bl sub_020AB910
_020A6C2C:
	bl sub_020D34B0
	mov r6, r0, lsr #0x10
	orr r6, r6, r1, lsl #16
	ldr r5, _020A6C84 ; =0x021D4620
	b _020A6C44
_020A6C40:
	bl sub_020A3978
_020A6C44:
	ldr r0, [r5, #0x48]
	blx r0
	cmp r0, #0
	ldrneb r0, [r4, #8]
	cmpne r0, #0
	beq _020A6C74
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r6
	cmp r0, #0x27
	blt _020A6C40
_020A6C74:
	mov r0, #0
	strb r0, [r4, #8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A6C80: .word 0x021E16A0
_020A6C84: .word 0x021D4620
	arm_func_end sub_020A6C00

	arm_func_start sub_020A6C88
sub_020A6C88: ; 0x020A6C88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov sb, r0
	bl sub_020D3A38
	ldr r6, [r8, #0x44]
	mov r7, r0
	cmp r6, #0
	bne _020A6CC8
	mov r5, #3
	mov r4, #0
_020A6CB0:
	mov r0, r4
	str r5, [r8, #4]
	bl sub_020D1E7C
	ldr r6, [r8, #0x44]
	cmp r6, #0
	beq _020A6CB0
_020A6CC8:
	mov r0, r7
	bl sub_020D3A4C
	str r6, [sb]
	ldr r0, [r8, #0x40]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020A6C88

	arm_func_start sub_020A6CDC
sub_020A6CDC: ; 0x020A6CDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r1
	ldr r1, [r4, #0x44]
	mov r5, r0
	cmp r1, #0
	ldreqb r0, [r4, #8]
	cmpeq r0, #4
	bne _020A6D3C
	bl sub_020D3A38
	mov r8, r0
	mov r7, #2
	mov r6, #0
	b _020A6D1C
_020A6D10:
	mov r0, r6
	str r7, [r4, #4]
	bl sub_020D1E7C
_020A6D1C:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ldreqb r0, [r4, #8]
	cmpeq r0, #4
	beq _020A6D10
	mov r0, r8
	bl sub_020D3A4C
	b _020A6D40
_020A6D3C:
	bl sub_020D1FA0
_020A6D40:
	ldr r0, [r4, #0x44]
	str r0, [r5]
	cmp r0, #0
	ldrne r0, [r4, #0x40]
	moveq r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020A6CDC

	arm_func_start sub_020A6D58
sub_020A6D58: ; 0x020A6D58
	stmdb sp!, {r3, lr}
	ldr r1, _020A6DB8 ; =0x021E16A0
	ldr r1, [r1, #4]
	ldr r1, [r1, #0xa4]
	cmp r1, #0
	beq _020A6DA8
	ldrb r2, [r1, #8]
	add r2, r2, #0xf6
	and r2, r2, #0xff
	cmp r2, #1
	bhi _020A6D8C
	bl sub_020A6C88
	ldmia sp!, {r3, pc}
_020A6D8C:
	ldrb r2, [r1, #9]
	cmp r2, #0
	beq _020A6DA0
	bl sub_020AB474
	ldmia sp!, {r3, pc}
_020A6DA0:
	bl sub_020A6CDC
	ldmia sp!, {r3, pc}
_020A6DA8:
	mov r1, #0
	str r1, [r0]
	mov r0, r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A6DB8: .word 0x021E16A0
	arm_func_end sub_020A6D58

	arm_func_start sub_020A6DBC
sub_020A6DBC: ; 0x020A6DBC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r7, r0
	bl sub_020D3A38
	ldr r2, [r4, #0x44]
	ldr r1, [r4, #0x3c]
	mov r5, r0
	cmp r2, r1
	mov r6, #0
	bne _020A6DEC
	cmp r7, #0
	movne r6, #1
_020A6DEC:
	cmp r7, r2
	movhs r0, #0
	strhs r0, [r4, #0x44]
	bhs _020A6E10
	ldr r0, [r4, #0x40]
	sub r2, r2, r7
	add r1, r0, r7
	str r2, [r4, #0x44]
	bl memmove
_020A6E10:
	mov r0, r5
	bl sub_020D3A4C
	ldrb r0, [r4, #8]
	cmp r0, #0xa
	cmpne r0, #0xb
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _020A6E3C
	cmp r6, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_020A6E3C:
	mov r0, r4
	mov r1, #0x1b
	bl sub_020A5698
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020A6DBC

	arm_func_start sub_020A6E4C
sub_020A6E4C: ; 0x020A6E4C
	stmdb sp!, {r3, lr}
	ldr r1, _020A6E80 ; =0x021E16A0
	ldr r1, [r1, #4]
	ldr r1, [r1, #0xa4]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r1, #9]
	cmp r2, #0
	beq _020A6E78
	bl sub_020AB54C
	ldmia sp!, {r3, pc}
_020A6E78:
	bl sub_020A6DBC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A6E80: .word 0x021E16A0
	arm_func_end sub_020A6E4C

	arm_func_start sub_020A6E84
sub_020A6E84: ; 0x020A6E84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, r2
	ldr r6, [r8, #0x34]
	movs fp, r3
	mov sl, r0
	movne r5, #1
	mov r0, r6, lsl #1
	mov sb, r1
	ldreqh r5, [r8, #0x2c]
	add r7, r0, #4
	b _020A6F28
_020A6EB0:
	ldr r0, _020A6F44 ; =0x021D4620
	ldrh r4, [r8, #0x2e]
	ldrh r0, [r0, #2]
	ldr r1, [r8, #0x34]
	cmp r4, r5
	movhs r4, r5
	cmp r0, r4
	movlo r4, r0
	cmp fp, #0
	biceq r4, r4, #1
	cmp sb, r4
	sub r0, r1, r6
	movlo r4, sb
	adds r0, r7, r0
	moveq r4, #0
	mov r6, r1
	sub r7, r0, #1
	cmp r4, #0
	beq _020A6F3C
	mov r2, #0
	str r2, [sp]
	mov r0, sl
	mov r1, r4
	mov r2, r8
	mov r3, #0x18
	sub r5, r5, r4
	bl sub_020A4C64
	bl sub_020D1FA0
	add sl, sl, r4
	sub sb, sb, r4
_020A6F28:
	cmp sb, #0
	beq _020A6F3C
	ldrb r0, [r8, #8]
	cmp r0, #4
	beq _020A6EB0
_020A6F3C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A6F44: .word 0x021D4620
	arm_func_end sub_020A6E84

	arm_func_start sub_020A6F48
sub_020A6F48: ; 0x020A6F48
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r2
	mov r4, r3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl sub_020A6E84
	cmp r0, #0
	cmpne r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, [sp, #0x10]
	mov r0, r5
	mov r1, r4
	mov r3, #0
	bl sub_020A6E84
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A6F48

	arm_func_start sub_020A6F84
sub_020A6F84: ; 0x020A6F84
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r4, #0
	mov fp, r0
	ldr r8, [sp, #0x38]
	mov r0, r4
	str r4, [sp, #0x10]
	mov sl, r1
	mov sb, r2
	str r3, [sp, #8]
	mov r6, r4
	str r0, [r8, #0x34]
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [sp, #0xc]
	b _020A713C
_020A6FC8:
	ldr r7, [r8, #0x28]
	ldr r3, [sp, #8]
	str r8, [sp]
	mov r0, fp
	mov r1, sl
	mov r2, sb
	str r6, [sp, #4]
	bl sub_020A6F48
	bl sub_020D34B0
	mov r5, r0, lsr #0x10
	ldr r4, _020A7188 ; =0x021D4620
	orr r5, r5, r1, lsl #16
_020A6FF8:
	bl sub_020A3978
	ldr r0, [r4, #0x48]
	blx r0
	cmp r0, #0
	beq _020A7050
	ldrb r0, [r8, #8]
	cmp r0, #4
	bne _020A7050
	ldr r1, [r8, #0x28]
	ldr r0, [r8, #0x30]
	cmp r1, r0
	beq _020A7050
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r5
	cmp r0, #0xf
	bge _020A7050
	cmp r6, #0
	ldrneh r0, [r8, #0x2c]
	cmpne r0, #0
	beq _020A6FF8
_020A7050:
	ldr r1, [r8, #0x30]
	ldr r0, [r8, #0x28]
	sub r5, r1, r7
	sub r0, r0, r7
	cmp r5, r0
	movhi r5, #0
	ldr r0, [sp, #0x10]
	cmp r5, #0
	add r0, r0, r5
	str r0, [sp, #0x10]
	beq _020A708C
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [sp, #0xc]
_020A708C:
	ldr r0, [r8, #0x30]
	str r0, [r8, #0x28]
	ldrb r0, [r8, #8]
	cmp r0, #4
	ldreqh r0, [r8, #0x2c]
	cmpeq r0, #0
	cmpeq r5, #0
	bne _020A7110
	cmp r6, #0
	bne _020A7114
	bl sub_020D34B0
	mov r7, r0, lsr #0x10
	orr r7, r7, r1, lsl #16
	ldr r4, _020A7188 ; =0x021D4620
	b _020A70D8
_020A70C8:
	bl sub_020A3978
	ldrh r0, [r8, #0x2c]
	cmp r0, #0
	bne _020A7100
_020A70D8:
	ldr r0, [r4, #0x48]
	blx r0
	cmp r0, #0
	beq _020A7100
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r7
	cmp r0, #0xf
	blt _020A70C8
_020A7100:
	ldrh r0, [r8, #0x2c]
	cmp r0, #0
	moveq r6, #1
	b _020A7114
_020A7110:
	mov r6, #0
_020A7114:
	cmp r5, sl
	addlo fp, fp, r5
	sublo sl, sl, r5
	blo _020A713C
	sub r1, r5, sl
	ldr r0, [sp, #8]
	add fp, sb, r1
	mov sb, #0
	sub sl, r0, r1
	str sb, [sp, #8]
_020A713C:
	ldr r0, _020A7188 ; =0x021D4620
	ldr r0, [r0, #0x48]
	blx r0
	cmp r0, #0
	cmpne sl, #0
	beq _020A717C
	ldrb r0, [r8, #8]
	cmp r0, #4
	bne _020A717C
	bl sub_020D34B0
	mov r2, r0, lsr #0x10
	ldr r0, [sp, #0xc]
	orr r2, r2, r1, lsl #16
	sub r0, r2, r0
	cmp r0, #0x9f
	blt _020A6FC8
_020A717C:
	ldr r0, [sp, #0x10]
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A7188: .word 0x021D4620
	arm_func_end sub_020A6F84

	arm_func_start sub_020A718C
sub_020A718C: ; 0x020A718C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, _020A7258 ; =0x021E16A0
	mov r7, r1
	ldr ip, [ip, #4]
	mov r6, r2
	ldr r4, [ip, #0xa4]
	mov r5, r3
	cmp r4, #0
	beq _020A7250
	ldrb ip, [r4, #8]
	cmp ip, #0xa
	bne _020A71EC
	cmp r7, #0
	beq _020A71CC
	mov r2, r4
	bl sub_020A4B28
_020A71CC:
	cmp r5, #0
	beq _020A71E4
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020A4B28
_020A71E4:
	add r0, r7, r5
	b _020A7240
_020A71EC:
	cmp ip, #0xb
	bne _020A7224
	cmp r7, #0
	beq _020A7204
	mov r2, r4
	bl sub_020A4A78
_020A7204:
	cmp r5, #0
	beq _020A721C
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020A4A78
_020A721C:
	add r0, r7, r5
	b _020A7240
_020A7224:
	ldrb ip, [r4, #9]
	cmp ip, #0
	str r4, [sp]
	beq _020A723C
	bl sub_020AB75C
	b _020A7240
_020A723C:
	bl sub_020A6F84
_020A7240:
	ldr r1, _020A725C ; =0x021D4620
	ldrb r1, [r1]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_020A7250:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A7258: .word 0x021E16A0
_020A725C: .word 0x021D4620
	arm_func_end sub_020A718C

	arm_func_start sub_020A7260
sub_020A7260: ; 0x020A7260
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _020A72F4 ; =0x021E16A0
	mov r2, r0
	ldr r4, [r3, #4]
	mov r3, r1
	ldr r5, [r4, #0xa4]
	cmp r5, #0
	beq _020A72EC
	ldr r4, [r5, #0x60]
	cmp r4, #0
	beq _020A72DC
	ldr r0, [r5, #0x5c]
	mov r1, r4
	bl sub_020A718C
	ldr r1, [r5, #0x60]
	mov r4, r0
	cmp r4, r1
	bhs _020A72CC
	ldr r0, [r5, #0x5c]
	sub r2, r1, r4
	add r1, r0, r4
	bl memmove
	ldr r1, [r5, #0x60]
	mov r0, #0
	sub r1, r1, r4
	str r1, [r5, #0x60]
	ldmia sp!, {r3, r4, r5, pc}
_020A72CC:
	mov r0, #0
	str r0, [r5, #0x60]
	sub r0, r4, r1
	ldmia sp!, {r3, r4, r5, pc}
_020A72DC:
	mov r2, #0
	mov r3, r2
	bl sub_020A718C
	ldmia sp!, {r3, r4, r5, pc}
_020A72EC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A72F4: .word 0x021E16A0
	arm_func_end sub_020A7260

	arm_func_start sub_020A72F8
sub_020A72F8: ; 0x020A72F8
	stmdb sp!, {r3, lr}
	ldr r0, _020A7364 ; =0x021E16A0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xa4]
	cmp r0, #0
	beq _020A735C
	ldrb r1, [r0, #9]
	cmp r1, #0
	beq _020A7324
	bl sub_020AB6E0
	ldmia sp!, {r3, pc}
_020A7324:
	ldr r1, [r0, #0x44]
	cmp r1, #0
	bne _020A734C
	ldrb r0, [r0, #8]
	cmp r0, #4
	beq _020A734C
	add r0, r0, #0xf6
	and r0, r0, #0xff
	cmp r0, #1
	bhi _020A7354
_020A734C:
	mov r0, r1
	ldmia sp!, {r3, pc}
_020A7354:
	mvn r0, #0
	ldmia sp!, {r3, pc}
_020A735C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A7364: .word 0x021E16A0
	arm_func_end sub_020A72F8

	arm_func_start sub_020A7368
sub_020A7368: ; 0x020A7368
	stmdb sp!, {r4, lr}
	ldr r0, _020A73A4 ; =0x021E16A0
	ldr r0, [r0, #4]
	ldr r4, [r0, #0xa4]
	cmp r4, #0
	ldrne r1, [r4, #0x60]
	cmpne r1, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #0
	ldr r0, [r4, #0x5c]
	mov r3, r2
	bl sub_020A718C
	mov r0, #0
	str r0, [r4, #0x60]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A73A4: .word 0x021E16A0
	arm_func_end sub_020A7368

	arm_func_start sub_020A73A8
sub_020A73A8: ; 0x020A73A8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _020A7444 ; =0x021D4620
	ldr r0, [r0, #0x18]
	blx r0
	ldr r0, _020A7444 ; =0x021D4620
	ldr r0, [r0, #0x50]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl sub_020A43E0
	mov r0, #0x64
	bl sub_020D2108
	ldr r0, _020A7444 ; =0x021D4620
	ldr r0, [r0, #0x50]
	bl sub_020A43E0
	bl sub_020D34B0
	mov r6, r0, lsr #0x10
	orr r6, r6, r1, lsl #16
	mov r5, #0x64
	ldr r4, _020A7444 ; =0x021D4620
	b _020A7418
_020A73F8:
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _020A7410
	mov r0, #4
	bl sub_020A3874
	ldmia sp!, {r4, r5, r6, pc}
_020A7410:
	mov r0, r5
	bl sub_020D2108
_020A7418:
	ldr r0, [r4, #0x48]
	blx r0
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r6
	cmp r0, #0x17
	blt _020A73F8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A7444: .word 0x021D4620
	arm_func_end sub_020A73A8

	arm_func_start sub_020A7448
sub_020A7448: ; 0x020A7448
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _020A7798 ; =0x021D4620
	mov r1, #0
	ldr r0, _020A779C ; =0x021D4700
	mov r2, #0x64
	str r1, [r3, #0x44]
	bl sub_020D4994
	ldr r1, _020A7798 ; =0x021D4620
	mov r3, #0x180
	ldr r0, _020A77A0 ; =0x021D4CCC
	str r3, [r1, #0x11c]
	str r0, [r1, #0x120]
	ldr r2, _020A77A4 ; =0x021D4B4C
	str r3, [r1, #0x128]
	ldr r0, _020A779C ; =0x021D4700
	str r2, [r1, #0x12c]
	bl sub_020A6878
	mov sl, #1
	ldr r0, _020A7798 ; =0x021D4620
	mov fp, sl
	str sl, [sp]
	str sl, [r0, #0xc]
	mov r4, #0
_020A74A4:
	mov r0, #0x3e8
	bl sub_020D2108
	ldr r0, _020A7798 ; =0x021D4620
	ldr r1, [r0, #0x44]
	cmp r1, #0
	bne _020A7778
	bl sub_020D34B0
	ldr r2, _020A7798 ; =0x021D4620
	mov r5, r0, lsr #0x10
	ldr r0, [r2, #0x48]
	orr r5, r5, r1, lsl #16
	blx r0
	cmp r0, #0
	beq _020A75D0
	ldr r0, [sp]
	subs r0, r0, #1
	str r0, [sp]
	bne _020A75E4
	ldr r0, _020A7798 ; =0x021D4620
	ldr r1, [r0, #0x10]
	tst r1, #1
	beq _020A7510
	cmp r4, #0
	bne _020A75E4
	bl sub_020A73A8
	mov r4, #1
	b _020A75E4
_020A7510:
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _020A75E4
_020A751C: ; jump table
	b _020A752C ; case 0
	b _020A7570 ; case 1
	b _020A7594 ; case 2
	b _020A75E4 ; case 3
_020A752C:
	cmp fp, #0
	movne r1, #2
	strne r1, [r0, #0xc]
	movne fp, #0
	bl sub_020A7E94
	cmp r0, #0
	beq _020A755C
	add r0, sp, #0
	mov r1, #0
	bl sub_020A7EEC
	cmp r0, #0
	bne _020A7568
_020A755C:
	bl sub_020A73A8
	mov r4, #3
	b _020A75E4
_020A7568:
	mov r4, #1
	b _020A75E4
_020A7570:
	add r0, sp, #0
	mov r1, #1
	bl sub_020A7EEC
	cmp r0, #0
	bne _020A75E4
	ldr r0, [sp]
	cmp r0, #0x3c
	movlo r4, #2
	b _020A75E4
_020A7594:
	add r0, sp, #0
	mov r1, #2
	bl sub_020A7EEC
	cmp r0, #0
	movne r4, #1
	bne _020A75E4
	ldr r0, [sp]
	cmp r0, #0x3c
	bhs _020A75E4
	mov r0, #3
	bl sub_020A3874
	mov sl, #1
	str sl, [sp]
	mov r4, #0
	b _020A75E4
_020A75D0:
	mov r0, #1
	bl sub_020A3874
	mov sl, #1
	str sl, [sp]
	mov r4, #0
_020A75E4:
	mov r3, #0
	ldr r6, _020A77A8 ; =0x021D46A0
	ldr r1, _020A77AC ; =0x000003BD
	mov r2, r3
_020A75F4:
	ldr r0, [r6]
	cmp r0, #0
	beq _020A7614
	ldrh r0, [r6, #0xa]
	sub r0, r5, r0
	mov r0, r0, lsl #0x10
	cmp r1, r0, asr #16
	strlt r2, [r6]
_020A7614:
	add r3, r3, #1
	cmp r3, #8
	add r6, r6, #0xc
	blt _020A75F4
	ldr r0, _020A7798 ; =0x021D4620
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _020A7644
	subs sl, sl, #1
	bne _020A7644
	bl sub_020A43E0
	mov sl, #0x69
_020A7644:
	ldr r0, _020A77B0 ; =0x021E16A0
	ldr sb, [r0, #8]
	cmp sb, #0
	beq _020A770C
	mov r6, #0
	mov r7, r6
	mov r8, #1
_020A7660:
	ldr r0, [sb, #0xa4]
	cmp r0, #0
	ldrne r1, [r0]
	cmpne r1, #0
	beq _020A7700
	ldrb r1, [r0, #8]
	cmp r1, #3
	bne _020A76A8
	ldr r2, [r0, #0x10]
	sub r2, r5, r2
	cmp r2, #0x27
	ble _020A76A8
	strb r8, [r0, #8]
	ldrh r1, [r0, #0x1a]
	strh r1, [r0, #0x18]
	ldr r1, [r0, #0x20]
	str r1, [r0, #0x1c]
	b _020A7700
_020A76A8:
	cmp r1, #2
	bne _020A76E0
	ldr r2, [r0, #0x10]
	sub r2, r5, r2
	cmp r2, #0x27
	ble _020A76E0
	ldr r1, [r0, #4]
	cmp r1, #1
	bne _020A7700
	strb r7, [r0, #8]
	str r7, [r0, #4]
	ldr r0, [r0]
	bl sub_020D1F34
	b _020A7700
_020A76E0:
	cmp r1, #4
	beq _020A7700
	ldr r1, [r0, #4]
	cmp r1, #2
	bne _020A7700
	str r6, [r0, #4]
	ldr r0, [r0]
	bl sub_020D1F34
_020A7700:
	ldr sb, [sb, #0x68]
	cmp sb, #0
	bne _020A7660
_020A770C:
	mov sb, #0
	ldr r8, _020A77B4 ; =0x021D4948
	ldr r6, _020A7798 ; =0x021D4620
	mov r7, sb
_020A771C:
	ldrh r0, [r8, #4]
	cmp r0, #0
	beq _020A7748
	ldr r0, [r8, #0x2c]
	sub r0, r5, r0
	cmp r0, #0xef
	ble _020A7748
	ldr r0, [r8, #0x34]
	ldr r1, [r6, #0x40]
	blx r1
	strh r7, [r8, #4]
_020A7748:
	add sb, sb, #1
	cmp sb, #8
	add r8, r8, #0x38
	blt _020A771C
	mov r0, r5
	bl sub_020AB978
	ldr r0, _020A7798 ; =0x021D4620
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	beq _020A74A4
	blx r0
	b _020A74A4
_020A7778:
	ldr r0, [r0, #0x10]
	tst r0, #1
	bne _020A7790
	cmp r4, #3
	beq _020A7790
	bl sub_020A7FE8
_020A7790:
	bl sub_020A688C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A7798: .word 0x021D4620
_020A779C: .word 0x021D4700
_020A77A0: .word 0x021D4CCC
_020A77A4: .word 0x021D4B4C
_020A77A8: .word 0x021D46A0
_020A77AC: .word 0x000003BD
_020A77B0: .word 0x021E16A0
_020A77B4: .word 0x021D4948
	arm_func_end sub_020A7448

	arm_func_start sub_020A77B8
sub_020A77B8: ; 0x020A77B8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	mov r4, r2
	mov r1, #0
	mov r2, #0xec
	mov r6, r0
	bl sub_020D4994
	ldr r0, _020A7928 ; =0x00000101
	mov r1, #6
	strh r0, [r6]
	ldr r0, _020A792C ; =0x021D4620
	strb r1, [r6, #2]
	ldr r3, [r0, #0x70]
	ldr r2, [r0, #0x68]
	ldr r1, [r0, #0x6c]
	umull lr, ip, r3, r2
	mla ip, r3, r1, ip
	ldr r1, [r0, #0x74]
	ldr r7, [r0, #0x78]
	mla ip, r1, r2, ip
	ldr r3, [r0, #0x7c]
	adds r7, r7, lr
	adc r1, r3, ip
	str r7, [r0, #0x68]
	str r1, [r0, #0x6c]
	mov r0, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	cmp r4, #0
	mov r2, r3, lsl #8
	mov r0, r1, lsl #0x10
	strne r1, [r4]
	mov r1, r0, lsr #0x10
	orr r2, r2, r3, asr #8
	mov r0, r1, lsl #8
	strh r2, [r6, #4]
	orr r0, r0, r1, asr #8
	strh r0, [r6, #6]
	ldr r2, _020A792C ; =0x021D4620
	ldr r0, _020A7930 ; =0x021D4B08
	ldr r1, [r2, #0x50]
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	strh r1, [r6, #0xc]
	ldr r2, [r2, #0x50]
	add r1, r6, #0x1c
	mov r2, r2, lsl #0x10
	mov r3, r2, lsr #0x10
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	mov r2, #6
	strh r3, [r6, #0xe]
	bl sub_020D4A50
	ldr r0, _020A7934 ; =0x00008263
	ldr r1, _020A7938 ; =0x00006353
	strh r0, [r6, #0xec]
	strh r1, [r6, #0xee]
	ldr r0, _020A793C ; =0x00000135
	mov r1, #7
	strh r0, [r6, #0xf0]
	strb r5, [r6, #0xf2]
	mov r0, #0x3d
	strb r0, [r6, #0xf3]
	strb r1, [r6, #0xf4]
	mov r3, #1
	ldr r0, _020A7930 ; =0x021D4B08
	add r1, r6, #0xf6
	mov r2, #6
	strb r3, [r6, #0xf5]
	bl sub_020D4A50
	mov r1, #0xc
	strb r1, [r6, #0xfc]
	mov r2, #0xa
	ldr r0, _020A7940 ; =_0211069C
	add r1, r6, #0xfe
	strb r2, [r6, #0xfd]
	bl sub_020D4A50
	mov r1, #0x37
	strb r1, [r6, #0x108]
	mov r2, #3
	add r0, r6, #0xd
	strb r2, [r6, #0x109]
	mov r1, #1
	strb r1, [r6, #0x10a]
	strb r2, [r6, #0x10b]
	mov r1, #6
	strb r1, [r6, #0x10c]
	add r0, r0, #0x100
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A7928: .word 0x00000101
_020A792C: .word 0x021D4620
_020A7930: .word 0x021D4B08
_020A7934: .word 0x00008263
_020A7938: .word 0x00006353
_020A793C: .word 0x00000135
_020A7940: .word _0211069C
	arm_func_end sub_020A77B8

	arm_func_start sub_020A7944
sub_020A7944: ; 0x020A7944
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, r0
	mov r5, r2
	cmp r3, r1
	bhs _020A7970
	sub r4, r1, r3
	mov r0, r5
	mov r1, ip
	mov r2, r4
	bl sub_020D4994
	add r5, r5, r4
_020A7970:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A7944

	arm_func_start sub_020A7978
sub_020A7978: ; 0x020A7978
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r4, _020A7A34 ; =0x021D4B76
	add r2, sp, #0
	mov r0, r4
	mov r1, #1
	bl sub_020A77B8
	ldr r1, _020A7A38 ; =0x021D4620
	mov ip, r0
	ldr r0, [r1, #0x34]
	cmp r0, #0
	beq _020A79FC
	mov r0, #0x32
	strb r0, [ip]
	mov r0, #4
	strb r0, [ip, #1]
	ldr r0, [r1, #0x34]
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, asr #8
	strb r0, [ip, #2]
	ldr r0, [r1, #0x34]
	mov r0, r0, lsr #0x10
	strb r0, [ip, #3]
	ldr r0, [r1, #0x34]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, asr #8
	strb r0, [ip, #4]
	ldr r0, [r1, #0x34]
	strb r0, [ip, #5]
	add ip, ip, #6
_020A79FC:
	add r2, ip, #1
	mov lr, #0xff
	sub r3, r2, r4
	mov r0, #0
	mov r1, #0x12c
	strb lr, [ip]
	bl sub_020A7944
	mov r1, r0
	mov r0, r4
	sub r1, r1, r4
	bl sub_020A7260
	ldr r0, [sp]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020A7A34: .word 0x021D4B76
_020A7A38: .word 0x021D4620
	arm_func_end sub_020A7978

	arm_func_start sub_020A7A3C
sub_020A7A3C: ; 0x020A7A3C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020A7B3C ; =0x021D4B76
	mov r5, r0
	add r2, sp, #0
	mov r0, r4
	mov r1, #3
	bl sub_020A77B8
	mov ip, r0
	cmp r5, #0
	bne _020A7B08
	mov r0, #0x32
	strb r0, [ip]
	mov r0, #4
	ldr r2, _020A7B40 ; =0x021D4620
	strb r0, [ip, #1]
	ldr r1, [r2, #0x34]
	mov r3, #0x36
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r1, r1, asr #8
	strb r1, [ip, #2]
	ldr r1, [r2, #0x34]
	mov r1, r1, lsr #0x10
	strb r1, [ip, #3]
	ldr r1, [r2, #0x34]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r1, r1, asr #8
	strb r1, [ip, #4]
	ldr r1, [r2, #0x34]
	strb r1, [ip, #5]
	strb r3, [ip, #6]
	strb r0, [ip, #7]
	ldr r0, [r2, #0x20]
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, asr #8
	strb r0, [ip, #8]
	ldr r0, [r2, #0x20]
	mov r0, r0, lsr #0x10
	strb r0, [ip, #9]
	ldr r0, [r2, #0x20]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, asr #8
	strb r0, [ip, #0xa]
	ldr r0, [r2, #0x20]
	strb r0, [ip, #0xb]
	add ip, ip, #0xc
_020A7B08:
	add r2, ip, #1
	mov lr, #0xff
	sub r3, r2, r4
	mov r0, #0
	mov r1, #0x12c
	strb lr, [ip]
	bl sub_020A7944
	mov r1, r0
	mov r0, r4
	sub r1, r1, r4
	bl sub_020A7260
	ldr r0, [sp]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A7B3C: .word 0x021D4B76
_020A7B40: .word 0x021D4620
	arm_func_end sub_020A7A3C

	arm_func_start sub_020A7B44
sub_020A7B44: ; 0x020A7B44
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	add r1, r1, #1
	str r0, [sp]
	rsb fp, r1, r1, lsl #4
	bl sub_020D34B0
	mov r4, r0, lsr #0x10
	orr r4, r4, r1, lsl #16
	mov r5, #0
	b _020A7E4C
_020A7B6C:
	bl sub_020A72F8
	cmp r0, #0
	bne _020A7B80
	bl sub_020A3978
	b _020A7E4C
_020A7B80:
	add r0, sp, #4
	bl sub_020A6D58
	ldr r1, [sp, #4]
	mov r6, r0
	cmp r1, #0xf0
	bls _020A7E44
	ldrb r0, [r6]
	cmp r0, #2
	bne _020A7E44
	ldrh r3, [r6, #6]
	ldrh r2, [r6, #4]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r1, r0, r2, lsl #16
	ldr r0, [sp]
	cmp r0, r1
	bne _020A7E44
	ldr r1, _020A7E8C ; =0x021D4B08
	add r0, r6, #0x1c
	bl sub_020A3F38
	cmp r0, #0
	bne _020A7E44
	ldrb r3, [r6, #0x10]
	ldrb r2, [r6, #0x11]
	ldrb r1, [r6, #0x12]
	ldrb r0, [r6, #0x13]
	orr r3, r2, r3, lsl #8
	ldrb r2, [r6, #0xec]
	orr r1, r0, r1, lsl #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r5, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	cmp r2, #0x63
	orr r2, r0, r5, lsl #16
	ldreqb r0, [r6, #0xed]
	ldr r3, [sp, #4]
	mov r5, #3
	cmpeq r0, #0x82
	ldreqb r0, [r6, #0xee]
	add r1, r6, r3
	cmpeq r0, #0x53
	ldreqb r0, [r6, #0xef]
	addeq r3, r6, #0xf0
	cmpeq r0, #0x63
	bne _020A7E44
	mov r0, #0
	mov sb, #2
	mov sl, #1
	ldr ip, _020A7E90 ; =0x021D4620
	b _020A7E30
_020A7C64:
	cmp r6, #0
	beq _020A7E30
	cmp r6, #0x33
	bgt _020A7CA0
	bge _020A7D98
	cmp r6, #6
	bgt _020A7E24
	cmp r6, #1
	blt _020A7E24
	beq _020A7CBC
	cmp r6, #3
	beq _020A7CF0
	cmp r6, #6
	beq _020A7D24
	b _020A7E24
_020A7CA0:
	cmp r6, #0x35
	bgt _020A7CB0
	beq _020A7DCC
	b _020A7E24
_020A7CB0:
	cmp r6, #0x36
	beq _020A7DF4
	b _020A7E24
_020A7CBC:
	ldrb lr, [r3, #1]
	ldrb r8, [r3, #2]
	ldrb r7, [r3, #3]
	ldrb r6, [r3, #4]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x1c]
	b _020A7E24
_020A7CF0:
	ldrb lr, [r3, #1]
	ldrb r8, [r3, #2]
	ldrb r7, [r3, #3]
	ldrb r6, [r3, #4]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x2c]
	b _020A7E24
_020A7D24:
	ldrb r6, [r3]
	cmp r6, #8
	strlo r0, [ip, #0x64]
	blo _020A7D64
	ldrb lr, [r3, #5]
	ldrb r8, [r3, #6]
	ldrb r7, [r3, #7]
	ldrb r6, [r3, #8]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x64]
_020A7D64:
	ldrb lr, [r3, #1]
	ldrb r8, [r3, #2]
	ldrb r7, [r3, #3]
	ldrb r6, [r3, #4]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x60]
	b _020A7E24
_020A7D98:
	ldrb lr, [r3, #1]
	ldrb r8, [r3, #2]
	ldrb r7, [r3, #3]
	ldrb r6, [r3, #4]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x4c]
	b _020A7E24
_020A7DCC:
	ldrb r6, [r3, #1]
	cmp r6, #2
	beq _020A7DE8
	cmp r6, #5
	moveq r5, sb
	streq r2, [ip, #0x50]
	b _020A7E24
_020A7DE8:
	mov r5, sl
	str r2, [ip, #0x34]
	b _020A7E24
_020A7DF4:
	ldrb r8, [r3, #1]
	ldrb r7, [r3, #2]
	ldrb r6, [r3, #3]
	ldrb lr, [r3, #4]
	orr r7, r7, r8, lsl #8
	mov r7, r7, lsl #0x10
	orr r6, lr, r6, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r7, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x20]
_020A7E24:
	ldrb r6, [r3]
	add r6, r6, #1
	add r3, r3, r6
_020A7E30:
	cmp r3, r1
	bhs _020A7E44
	ldrb r6, [r3], #1
	cmp r6, #0xff
	bne _020A7C64
_020A7E44:
	ldr r0, [sp, #4]
	bl sub_020A6E4C
_020A7E4C:
	ldr r0, _020A7E90 ; =0x021D4620
	ldr r0, [r0, #0x48]
	blx r0
	cmp r0, #0
	beq _020A7E80
	cmp r5, #0
	bne _020A7E80
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r4
	cmp r0, fp
	blt _020A7B6C
_020A7E80:
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A7E8C: .word 0x021D4B08
_020A7E90: .word 0x021D4620
	arm_func_end sub_020A7B44

	arm_func_start sub_020A7E94
sub_020A7E94: ; 0x020A7E94
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_020A6930
	bl sub_020A68A4
	mov r1, #0x43
	sub r2, r1, #0x44
	mov r0, #0x44
	bl sub_020A68D0
	mov r5, #0
_020A7EB4:
	bl sub_020A7978
	mov r1, r5
	bl sub_020A7B44
	mov r4, r0
	cmp r4, #1
	beq _020A7ED8
	add r5, r5, #1
	cmp r5, #4
	blt _020A7EB4
_020A7ED8:
	bl sub_020A6964
	cmp r4, #1
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A7E94

	arm_func_start sub_020A7EEC
sub_020A7EEC: ; 0x020A7EEC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r5, r0
	bl sub_020A6930
	bl sub_020A68A4
	cmp r4, #1
	mov r0, #0x44
	bne _020A7F20
	ldr r1, _020A7FE4 ; =0x021D4620
	ldr r2, [r1, #0x20]
	mov r1, #0x43
	bl sub_020A68D0
	b _020A7F2C
_020A7F20:
	mov r1, #0x43
	sub r2, r1, #0x44
	bl sub_020A68D0
_020A7F2C:
	mov r7, #0
_020A7F30:
	mov r0, r4
	bl sub_020A7A3C
	mov r1, r7
	bl sub_020A7B44
	movs r6, r0
	bne _020A7F54
	add r7, r7, #1
	cmp r7, #4
	blt _020A7F30
_020A7F54:
	bl sub_020A6964
	cmp r6, #2
	bne _020A7F88
	ldr r1, _020A7FE4 ; =0x021D4620
	mov r0, #1
	ldr r2, [r1, #0x4c]
	mov r2, r2, lsr #1
	str r2, [r5]
	ldr r2, [r1, #0x4c]
	add r2, r2, r2, lsl #1
	mov r2, r2, lsr #3
	str r2, [r1, #0x38]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A7F88:
	ldr r0, _020A7FE4 ; =0x021D4620
	cmp r4, #1
	ldr r1, [r0, #0x38]
	mov r1, r1, lsr #1
	str r1, [r0, #0x38]
	str r1, [r5]
	beq _020A7FB0
	cmp r4, #2
	beq _020A7FD0
	b _020A7FDC
_020A7FB0:
	cmp r1, #0x3c
	bhs _020A7FDC
	mov r1, #1
	str r1, [r5]
	ldr r1, [r0, #0x4c]
	mov r1, r1, lsr #3
	str r1, [r0, #0x38]
	b _020A7FDC
_020A7FD0:
	cmp r1, #0x3c
	movlo r0, #1
	strlo r0, [r5]
_020A7FDC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A7FE4: .word 0x021D4620
	arm_func_end sub_020A7EEC

	arm_func_start sub_020A7FE8
sub_020A7FE8: ; 0x020A7FE8
	stmdb sp!, {r4, lr}
	bl sub_020A6930
	bl sub_020A68A4
	ldr r1, _020A804C ; =0x021D4620
	mov r0, #0x44
	ldr r2, [r1, #0x20]
	mov r1, #0x43
	bl sub_020A68D0
	ldr r4, _020A8050 ; =0x021D4B76
	mov r1, #7
	mov r0, r4
	mov r2, #0
	bl sub_020A77B8
	mov r1, #0xff
	add r2, r0, #1
	strb r1, [r0]
	mov r0, #0
	mov r1, #0x12c
	sub r3, r2, r4
	bl sub_020A7944
	sub r1, r0, r4
	mov r0, r4
	bl sub_020A7260
	bl sub_020A6964
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A804C: .word 0x021D4620
_020A8050: .word 0x021D4B76
	arm_func_end sub_020A7FE8

	arm_func_start sub_020A8054
sub_020A8054: ; 0x020A8054
	ldrb r2, [r0], #1
	cmp r2, #0
	bxeq lr
_020A8060:
	and r1, r2, #0xc0
	cmp r1, #0xc0
	addeq r0, r0, #1
	bxeq lr
	add r0, r0, r2
	ldrb r2, [r0], #1
	cmp r2, #0
	bne _020A8060
	bx lr
	arm_func_end sub_020A8054

	arm_func_start sub_020A8084
sub_020A8084: ; 0x020A8084
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	mov sb, r2
	mov r2, sb, lsl #8
	mov sl, r1
	orr r1, r2, sb, asr #8
	strh r1, [sp, #4]
	cmp sl, #0x20
	mov r6, #0
	movne r1, #1
	strneh r1, [sp, #6]
	ldreq r1, _020A8324 ; =0x00001001
	strh r6, [sp, #0xa]
	streqh r1, [sp, #6]
	mov r1, #0x100
	strh r1, [sp, #8]
	add r1, sp, #0x10
	strh r6, [sp, #0xc]
	strh r6, [sp, #0xe]
	str r6, [sp]
	ldrb r7, [r0], #1
	mov fp, r3
	ldr r8, [sp, #0x68]
	add r2, r1, #1
	cmp r7, #0
	beq _020A814C
	mov r4, r6
	add r5, sp, #4
	mov r3, r6
_020A80F8:
	cmp r7, #0x2e
	beq _020A8128
	sub r6, r2, r5
	cmp r6, #0x3c
	addge sp, sp, #0x40
	mvnge r0, #0
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r6, r4, #1
	mov r4, r6
	str r6, [sp]
	strb r7, [r2], #1
	b _020A8140
_020A8128:
	strb r6, [r1]
	mov r1, r2
	mov r4, r3
	mov r6, r3
	str r3, [sp]
	add r2, r2, #1
_020A8140:
	ldrb r7, [r0], #1
	cmp r7, #0
	bne _020A80F8
_020A814C:
	ldr r0, [sp]
	mov r3, #0
	strb r0, [r1]
	strb r3, [r2]
	mov r0, sl, lsr #8
	strb r0, [r2, #1]
	strb sl, [r2, #2]
	strb r3, [r2, #3]
	mov r3, #1
	add r0, sp, #4
	add r1, r2, #5
	sub r1, r1, r0
	strb r3, [r2, #4]
	bl sub_020A7260
	mov r4, #0
	bl sub_020D34B0
	mov r5, r0, lsr #0x10
	orr r5, r5, r1, lsl #16
	b _020A82E4
_020A8198:
	bl sub_020A72F8
	cmp r0, #0
	bne _020A81AC
	bl sub_020A3978
	b _020A82E4
_020A81AC:
	add r0, sp, #0
	bl sub_020A6D58
	ldr r1, [sp]
	cmp r1, #0xc
	bls _020A82DC
	ldrh r3, [r0]
	mov r2, r3, lsl #8
	orr r2, r2, r3, asr #8
	mov r2, r2, lsl #0x10
	cmp sb, r2, lsr #16
	bne _020A82DC
	ldrb r2, [r0, #3]
	and r2, r2, #0xf
	cmp r2, #3
	mvneq r4, #0
	beq _020A82DC
	cmp r2, #0
	bne _020A82DC
	ldrb r3, [r0, #4]
	ldrb r2, [r0, #5]
	add r6, r0, r1
	add r0, r0, #0xc
	orr r1, r2, r3, lsl #8
	mov r1, r1, lsl #0x10
	movs r1, r1, lsr #0x10
	sub r7, r1, #1
	beq _020A822C
_020A8218:
	bl sub_020A8054
	cmp r7, #0
	add r0, r0, #4
	sub r7, r7, #1
	bne _020A8218
_020A822C:
	cmp r0, r6
	bhs _020A82DC
_020A8234:
	bl sub_020A8054
	ldrb r7, [r0, #8]
	ldrb r1, [r0, #9]
	ldrb r3, [r0]
	ldrb r2, [r0, #1]
	orr r1, r1, r7, lsl #8
	mov r1, r1, lsl #0x10
	orr r2, r2, r3, lsl #8
	mov r2, r2, lsl #0x10
	cmp sl, r2, lsr #16
	mov r2, r1, lsr #0x10
	bne _020A82CC
	cmp sl, #0xc
	beq _020A82AC
	add r4, r0, #8
	add r0, r0, #6
	add r6, r4, r2
	add r1, r0, r2
	ldrb r3, [r0, r2]
	ldrb r0, [r1, #1]
	ldrb r2, [r4, r2]
	ldrb r1, [r6, #1]
	orr r0, r0, r3, lsl #8
	mov r0, r0, lsl #0x10
	orr r1, r1, r2, lsl #8
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r4, r0, r2, lsl #16
	b _020A82DC
_020A82AC:
	cmp r2, r8
	movhi r4, #2
	bhi _020A82DC
	mov r1, fp
	add r0, r0, #0xa
	bl sub_020D4A50
	mov r4, #1
	b _020A82DC
_020A82CC:
	add r1, r2, #0xa
	add r0, r0, r1
	cmp r0, r6
	blo _020A8234
_020A82DC:
	ldr r0, [sp]
	bl sub_020A6E4C
_020A82E4:
	ldr r0, _020A8328 ; =0x021D4620
	ldr r0, [r0, #0x48]
	blx r0
	cmp r0, #0
	beq _020A8318
	cmp r4, #0
	bne _020A8318
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r5
	cmp r0, #0xf
	blt _020A8198
_020A8318:
	mov r0, r4
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A8324: .word 0x00001001
_020A8328: .word 0x021D4620
	arm_func_end sub_020A8084

	arm_func_start sub_020A832C
sub_020A832C: ; 0x020A832C
	str r0, [r1]
	mov ip, #0
	mov r2, #0xa
_020A8338:
	ldrb r3, [r0]
	sub r3, r3, #0x30
	and r3, r3, #0xff
	cmp r3, #9
	mlals ip, r2, ip, r3
	addls r0, r0, #1
	strls r0, [r1]
	bls _020A8338
	mov r0, ip
	bx lr
	arm_func_end sub_020A832C

	arm_func_start sub_020A8360
sub_020A8360: ; 0x020A8360
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r5, #0
	mov r8, r0
	mov r7, r1
	mov r6, r5
	add r4, sp, #0
_020A837C:
	mov r0, r8
	mov r1, r4
	bl sub_020A832C
	ldr r2, [sp]
	cmp r8, r2
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r8, r2
	cmp r0, #0xff
	bhi _020A83D0
	cmp r6, #3
	ldrneb r1, [r2]
	addne r8, r2, #1
	cmpne r1, #0x2e
	bne _020A83D0
	cmp r6, #3
	bne _020A83DC
	ldrb r1, [r8]
	cmp r1, #0
	beq _020A83DC
_020A83D0:
	add sp, sp, #4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020A83DC:
	add r6, r6, #1
	cmp r6, #4
	orr r5, r0, r5, lsl #8
	blt _020A837C
	str r5, [r7]
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020A8360

	arm_func_start sub_020A83FC
sub_020A83FC: ; 0x020A83FC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	movs r5, r1
	mov r6, r0
	mov r4, r2
	addeq sp, sp, #4
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	bl sub_020A6930
	bl sub_020A68A4
	mov r2, r5
	mov r0, #0
	mov r1, #0x35
	bl sub_020A68D0
	mov r0, r6
	mov r2, r4
	mov r3, #0
	str r3, [sp]
	mov r1, #1
	bl sub_020A8084
	mov r4, r0
	bl sub_020A6964
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_020A83FC

	arm_func_start sub_020A8460
sub_020A8460: ; 0x020A8460
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r2, _020A8590 ; =0x021D4620
	mov r6, #0
	ldr r5, [r2, #0x70]
	ldr r3, [r2, #0x68]
	ldr r1, [r2, #0x6c]
	umull r8, r7, r5, r3
	ldr sb, [r2, #0x78]
	mla r7, r5, r1, r7
	ldr r4, [r2, #0x74]
	adds fp, sb, r8
	mla r7, r4, r3, r7
	ldr r8, [r2, #0x7c]
	umull r3, r1, r5, fp
	adc sl, r8, r7
	mla r1, r5, sl, r1
	str fp, [r2, #0x68]
	mov r7, r6, lsl #0x10
	adds r5, sb, r3
	mla r1, r4, fp, r1
	str sl, [r2, #0x6c]
	orr r7, r7, sl, lsr #16
	adc r4, r8, r1
	mov r3, r6, lsl #0x10
	str r5, [r2, #0x68]
	orr r3, r3, r4, lsr #16
	add r1, sp, #8
	mov sl, r0
	strh r7, [sp, #2]
	str r4, [r2, #0x6c]
	strh r3, [sp, #4]
	bl sub_020A8360
	cmp r0, #0
	ldrne r0, [sp, #8]
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #1
	mov fp, r6
	ldr r7, _020A8594 ; =0x021D4680
	strb r0, [sp]
	strb r0, [sp, #1]
	add r6, sp, #2
	mov r5, fp
	mvn r4, #0
_020A8514:
	mov r8, #0
	add sb, sp, #0
_020A851C:
	ldrb r0, [sb]
	cmp r0, #0
	beq _020A8554
	mov r0, r8, lsl #1
	ldrh r2, [r6, r0]
	ldr r1, [r7, r8, lsl #2]
	mov r0, sl
	bl sub_020A83FC
	cmp r0, #0
	str r0, [sp, #8]
	cmpne r0, r4
	bne _020A8570
	cmp r0, r4
	streqb r5, [sb]
_020A8554:
	add r8, r8, #1
	cmp r8, #2
	add sb, sb, #1
	blt _020A851C
	add fp, fp, #1
	cmp fp, #3
	blt _020A8514
_020A8570:
	ldr r1, [sp, #8]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #0
	streq r0, [sp, #8]
	ldr r0, [sp, #8]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A8590: .word 0x021D4620
_020A8594: .word 0x021D4680
	arm_func_end sub_020A8460

	arm_func_start sub_020A8598
sub_020A8598: ; 0x020A8598
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	bl sub_020D3A38
	mov r4, #0
	ldr r6, _020A8628 ; =0x021D5E68
	mov r5, r0
	strb r4, [r7, #0x30]
	mov r8, #0x20
_020A85B8:
	ldrb r0, [r6, #0x5a]
	cmp r0, #0
	beq _020A860C
	ldr r0, [r6, #0x54]
	cmp r0, #0
	ldreqh r0, [r6, #0x58]
	cmpeq r0, #0
	bne _020A860C
	mov r0, r6
	mov r2, r8
	add r1, r7, #0x74
	bl memcmp
	cmp r0, #0
	bne _020A860C
	mov r1, r7
	add r0, r6, #0x20
	mov r2, #0x30
	bl sub_020D4A50
	mov r0, #1
	strb r0, [r7, #0x30]
	b _020A861C
_020A860C:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #0x5c
	blt _020A85B8
_020A861C:
	mov r0, r5
	bl sub_020D3A4C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A8628: .word 0x021D5E68
	arm_func_end sub_020A8598

	arm_func_start sub_020A862C
sub_020A862C: ; 0x020A862C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	bl sub_020D3A38
	mov r1, #0
	ldr r5, _020A86C8 ; =0x021D5E68
	mov r4, r0
	strb r1, [r8, #0x30]
_020A8650:
	ldrb r0, [r5, #0x5a]
	cmp r0, #0
	beq _020A86AC
	ldr r0, [r5, #0x54]
	cmp r0, r7
	ldreqh r0, [r5, #0x58]
	cmpeq r0, r6
	bne _020A86AC
	mov r0, r5
	add r1, r8, #0x74
	mov r2, #0x20
	bl sub_020D4A50
	mov r1, r8
	add r0, r5, #0x20
	mov r2, #0x30
	bl sub_020D4A50
	bl sub_020D34B0
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [r5, #0x50]
	mov r0, #1
	strb r0, [r8, #0x30]
	b _020A86BC
_020A86AC:
	add r1, r1, #1
	cmp r1, #4
	add r5, r5, #0x5c
	blt _020A8650
_020A86BC:
	mov r0, r4
	bl sub_020D3A4C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A86C8: .word 0x021D5E68
	arm_func_end sub_020A862C

	arm_func_start sub_020A86CC
sub_020A86CC: ; 0x020A86CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	bl sub_020D3A38
	mov r4, r0
	bl sub_020D34B0
	ldr sb, _020A87B4 ; =0x021D5E68
	mov r5, r0, lsr #0x10
	mov r2, #0
	mov r0, r2
	mov r3, sb
	orr r5, r5, r1, lsl #16
	mvn ip, #0
_020A8704:
	ldrb lr, [r3, #0x5a]
	cmp lr, #0
	cmpne r7, #0
	beq _020A8738
	ldr r1, [r3, #0x54]
	cmp r7, r1
	bne _020A8738
	cmp r6, #0
	beq _020A8738
	ldrh r1, [r3, #0x58]
	cmp r6, r1
	moveq sb, r3
	beq _020A8774
_020A8738:
	cmp r2, ip
	beq _020A8764
	cmp lr, #0
	moveq r2, ip
	moveq sb, r3
	beq _020A8764
	ldr r1, [r3, #0x50]
	sub r1, r5, r1
	cmp r1, r2
	movhi r2, r1
	movhi sb, r3
_020A8764:
	add r0, r0, #1
	cmp r0, #4
	add r3, r3, #0x5c
	blt _020A8704
_020A8774:
	mov r1, sb
	add r0, r8, #0x74
	mov r2, #0x20
	bl sub_020D4A50
	mov r0, r8
	add r1, sb, #0x20
	mov r2, #0x30
	bl sub_020D4A50
	str r5, [sb, #0x50]
	mov r0, #1
	strb r0, [sb, #0x5a]
	str r7, [sb, #0x54]
	mov r0, r4
	strh r6, [sb, #0x58]
	bl sub_020D3A4C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020A87B4: .word 0x021D5E68
	arm_func_end sub_020A86CC

	arm_func_start sub_020A87B8
sub_020A87B8: ; 0x020A87B8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	bl sub_020D3A38
	ldr r7, _020A881C ; =0x021D5E68
	mov r6, r0
	mov r5, #0
	mov r4, #0x20
_020A87D4:
	ldrb r0, [r7, #0x5a]
	cmp r0, #0
	beq _020A8800
	mov r0, r7
	mov r2, r4
	add r1, r8, #0x74
	bl memcmp
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r7, #0x5a]
	beq _020A8810
_020A8800:
	add r5, r5, #1
	cmp r5, #4
	add r7, r7, #0x5c
	blt _020A87D4
_020A8810:
	mov r0, r6
	bl sub_020D3A4C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A881C: .word 0x021D5E68
	arm_func_end sub_020A87B8

	arm_func_start sub_020A8820
sub_020A8820: ; 0x020A8820
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	add r0, sp, #0xc
	bl sub_020DBA9C
	add r0, sp, #0
	bl sub_020DBB48
	add r0, sp, #0xc
	add r1, sp, #0
	bl sub_020DC330
	ldr r1, _020A8854 ; =0x386D4380
	add r0, r0, r1
	add sp, sp, #0x1c
	ldmia sp!, {pc}
	.align 2, 0
_020A8854: .word 0x386D4380
	arm_func_end sub_020A8820

	arm_func_start sub_020A8858
sub_020A8858: ; 0x020A8858
	ldr r0, _020A8864 ; =_021106B0
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_020A8864: .word _021106B0
	arm_func_end sub_020A8858

	arm_func_start sub_020A8868
sub_020A8868: ; 0x020A8868
	ldr r1, _020A8874 ; =_021106B0
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_020A8874: .word _021106B0
	arm_func_end sub_020A8868

	arm_func_start sub_020A8878
sub_020A8878: ; 0x020A8878
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020A88BC ; =_021106B0
	ldr r0, [r0, #4]
	cmp r0, #0x20
	mvnhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	ldr r0, _020A88C0 ; =0x021E16A0
	ldr r5, [r0, #4]
	mov r0, r5
	bl sub_020D2100
	ldr r1, _020A88BC ; =_021106B0
	mov r4, r0
	ldr r1, [r1, #4]
	mov r0, r5
	bl sub_020D2058
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A88BC: .word _021106B0
_020A88C0: .word 0x021E16A0
	arm_func_end sub_020A8878

	arm_func_start sub_020A88C4
sub_020A88C4: ; 0x020A88C4
	stmdb sp!, {r3, lr}
	mov r1, r0
	cmp r1, #0x20
	ldmhsia sp!, {r3, pc}
	ldr r0, _020A88E4 ; =0x021E16A0
	ldr r0, [r0, #4]
	bl sub_020D2058
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A88E4: .word 0x021E16A0
	arm_func_end sub_020A88C4

	arm_func_start sub_020A88E8
sub_020A88E8: ; 0x020A88E8
	ldr r2, _020A890C ; =0x021E16A0
	ldr r2, [r2, #4]
	ldr r2, [r2, #0xa4]
	cmp r2, #0
	ldrne r2, [r2, #0xc]
	cmpne r2, #0
	strne r0, [r2, #0x814]
	strne r1, [r2, #0x818]
	bx lr
	.align 2, 0
_020A890C: .word 0x021E16A0
	arm_func_end sub_020A88E8

	arm_func_start sub_020A8910
sub_020A8910: ; 0x020A8910
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, [r0, #0x818]
	mov r8, r1
	cmp r6, #0
	mov r4, #0
	ble _020A8954
	ldr r5, [r0, #0x814]
_020A892C:
	ldr r7, [r5, r4, lsl #2]
	mov r1, r8
	ldr r0, [r7]
	bl strcmp
	cmp r0, #0
	moveq r0, r7
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r4, r4, #1
	cmp r4, r6
	blt _020A892C
_020A8954:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020A8910

	arm_func_start sub_020A895C
sub_020A895C: ; 0x020A895C
	ldr r1, [r0]
	ldrb r2, [r1]
	add r3, r1, #1
	tst r2, #0x80
	beq _020A89A0
	ands r1, r2, #0x7f
	sub ip, r1, #1
	mov r2, #0
	beq _020A89A0
_020A8980:
	tst r2, #0xff000000
	mvnne r0, #0
	bxne lr
	ldrb r1, [r3], #1
	cmp ip, #0
	sub ip, ip, #1
	add r2, r1, r2, lsl #8
	bne _020A8980
_020A89A0:
	str r3, [r0]
	mov r0, r2
	bx lr
	arm_func_end sub_020A895C

	arm_func_start sub_020A89AC
sub_020A89AC: ; 0x020A89AC
	ldrsb r3, [r0]
	mov ip, r0
	cmp r3, #0
	beq _020A89F4
_020A89BC:
	ldrsb r3, [r0, #1]!
	cmp r3, #0
	bne _020A89BC
	sub r3, r0, ip
	cmp r3, #0xff
	bxge lr
	mov r3, #0x2c
	strb r3, [r0]
	mov r3, #0x20
	strb r3, [r0, #1]
	add r0, r0, #2
	b _020A89F4
_020A89EC:
	ldrsb r3, [r1], #1
	strb r3, [r0], #1
_020A89F4:
	cmp r2, #0
	sub r2, r2, #1
	beq _020A8A0C
	sub r3, r0, ip
	cmp r3, #0xff
	blt _020A89EC
_020A8A0C:
	mov r1, #0
	strb r1, [r0]
	bx lr
	arm_func_end sub_020A89AC

	arm_func_start sub_020A8A18
sub_020A8A18: ; 0x020A8A18
	stmdb sp!, {r4, lr}
	ldrb ip, [r0, #1]
	ldrb r3, [r0], #2
	mov r2, #0xa
	cmp r1, #0x17
	mla r1, r3, r2, ip
	sub lr, r1, #0x210
	bne _020A8A4C
	cmp lr, #0x32
	addlo r4, lr, #0x7d0
	addhs r1, lr, #0x36c
	addhs r4, r1, #0x400
	b _020A8A64
_020A8A4C:
	ldrb ip, [r0, #1]
	ldrb r3, [r0], #2
	mov r1, #0x64
	mla r2, r3, r2, ip
	sub r2, r2, #0x210
	mla r4, lr, r1, r2
_020A8A64:
	ldrb ip, [r0, #1]
	ldrb r3, [r0]
	mov r1, #0xa
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #2]
	mla ip, r3, r1, ip
	mla r1, r0, r1, r2
	sub r0, ip, #0x210
	mov r0, r0, lsl #8
	add r2, r0, r4, lsl #16
	sub r0, r1, #0x210
	add r0, r2, r0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A8A18

	arm_func_start sub_020A8A98
sub_020A8A98: ; 0x020A8A98
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov fp, r1
	ldr r1, [fp]
	mov sb, r0
	add r0, r1, #1
	str r0, [sp, #4]
	add r0, sp, #4
	mov r7, r2
	mov r6, r3
	ldr r8, [sp, #0x30]
	ldrb r5, [r1]
	bl sub_020A895C
	movs r4, r0
	bmi _020A8ADC
	cmp r4, #0x7d0
	ble _020A8AE8
_020A8ADC:
	add sp, sp, #8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020A8AE8:
	and r1, r5, #0x1f
	cmp r1, #0x18
	addls pc, pc, r1, lsl #2
	b _020A8F0C
_020A8AF8: ; jump table
	b _020A8F0C ; case 0
	b _020A8F0C ; case 1
	b _020A8B5C ; case 2
	b _020A8C54 ; case 3
	b _020A8F0C ; case 4
	b _020A8F0C ; case 5
	b _020A8CD4 ; case 6
	b _020A8F0C ; case 7
	b _020A8F0C ; case 8
	b _020A8F0C ; case 9
	b _020A8F0C ; case 10
	b _020A8F0C ; case 11
	b _020A8D6C ; case 12
	b _020A8F0C ; case 13
	b _020A8F0C ; case 14
	b _020A8F0C ; case 15
	b _020A8E3C ; case 16
	b _020A8EBC ; case 17
	b _020A8F0C ; case 18
	b _020A8D6C ; case 19
	b _020A8D6C ; case 20
	b _020A8F0C ; case 21
	b _020A8D6C ; case 22
	b _020A8DEC ; case 23
	b _020A8DEC ; case 24
_020A8B5C:
	ldrb r0, [sb, #0x5ad]
	cmp r0, #0
	beq _020A8C44
	cmp r6, #0
	bne _020A8BDC
	ldr r0, [sp, #4]
	ldrb r1, [r0]
	cmp r1, #0
	bne _020A8B98
_020A8B80:
	add r0, r0, #1
	str r0, [sp, #4]
	ldrb r1, [r0]
	sub r4, r4, #1
	cmp r1, #0
	beq _020A8B80
_020A8B98:
	cmp r8, #0
	beq _020A8BAC
	cmp r8, #2
	beq _020A8BCC
	b _020A8C44
_020A8BAC:
	cmp r4, #0x100
	bgt _020A8C44
	add r1, sb, #0x94
	mov r2, r4
	add r1, r1, #0x400
	bl sub_020D4A50
	str r4, [sb, #0x594]
	b _020A8C44
_020A8BCC:
	str r4, [sb, #0x484]
	ldr r0, [sp, #4]
	str r0, [sb, #0x488]
	b _020A8C44
_020A8BDC:
	cmp r6, #1
	bne _020A8C44
	ldr r0, [sp, #4]
	ldrb r1, [r0]
	cmp r1, #0
	bne _020A8C0C
_020A8BF4:
	add r0, r0, #1
	str r0, [sp, #4]
	ldrb r1, [r0]
	sub r4, r4, #1
	cmp r1, #0
	beq _020A8BF4
_020A8C0C:
	cmp r8, #0
	beq _020A8C28
	cmp r8, #2
	streq r4, [sb, #0x48c]
	ldreq r0, [sp, #4]
	streq r0, [sb, #0x490]
	b _020A8C44
_020A8C28:
	cmp r4, #8
	bgt _020A8C44
	add r1, sb, #0x198
	mov r2, r4
	add r1, r1, #0x400
	bl sub_020D4A50
	str r4, [sb, #0x5a0]
_020A8C44:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	b _020A8F70
_020A8C54:
	cmp r7, #1
	bne _020A8C78
	cmp r8, #2
	beq _020A8C78
	ldr r1, [sp, #4]
	sub r0, r4, #1
	add r1, r1, #1
	str r1, [sb, #0x5a4]
	str r0, [sb, #0x5a8]
_020A8C78:
	ldrb r0, [sb, #0x5ad]
	cmp r0, #0
	beq _020A8CC4
	ldr r0, [sp, #4]
	add r1, sp, #4
	add r0, r0, #1
	str r0, [sp, #4]
	mov r0, sb
	mov r2, r7
	mov r3, #0
	str r8, [sp]
	bl sub_020A8A98
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	strb r0, [sb, #0x5ad]
	b _020A8F70
_020A8CC4:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	b _020A8F70
_020A8CD4:
	ldr r6, [sp, #4]
	ldr sl, _020A8F84 ; =_021106B8
	mov r5, #0
_020A8CE0:
	ldr r7, [sl, r5, lsl #2]
	mov r0, r7
	bl strlen
	mov r2, r0
	mov r0, r6
	mov r1, r7
	bl memcmp
	cmp r0, #0
	bne _020A8D50
	cmp r5, #5
	addls pc, pc, r5, lsl #2
	b _020A8D5C
_020A8D10: ; jump table
	b _020A8D5C ; case 0
	b _020A8D28 ; case 1
	b _020A8D28 ; case 2
	b _020A8D38 ; case 3
	b _020A8D38 ; case 4
	b _020A8D44 ; case 5
_020A8D28:
	cmp r8, #0
	streq r5, [sb, #0x45c]
	strb r5, [sb, #0x5ad]
	b _020A8D5C
_020A8D38:
	cmp r8, #2
	strne r5, [sb, #0x458]
	b _020A8D5C
_020A8D44:
	cmp r8, #2
	strneb r5, [sb, #0x5ae]
	b _020A8D5C
_020A8D50:
	add r5, r5, #1
	cmp r5, #6
	blt _020A8CE0
_020A8D5C:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	b _020A8F70
_020A8D6C:
	cmp r8, #2
	beq _020A8DD4
	ldrb r0, [sb, #0x5ac]
	cmp r0, #0
	beq _020A8DC4
	ldr r1, [sp, #4]
	mov r2, r4
	add r0, sb, #0x6b0
	bl sub_020A89AC
	ldrb r0, [sb, #0x5ae]
	cmp r0, #5
	bne _020A8DD4
	cmp r4, #0x4f
	bgt _020A8DD4
	ldr r0, [sp, #4]
	mov r2, r4
	add r1, sb, #0x7b0
	bl sub_020D4A50
	add r0, sb, r4
	mov r1, #0
	strb r1, [r0, #0x7b0]
	b _020A8DD4
_020A8DC4:
	ldr r1, [sp, #4]
	mov r2, r4
	add r0, sb, #0x5b0
	bl sub_020A89AC
_020A8DD4:
	mov r0, #0
	strb r0, [sb, #0x5ae]
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	b _020A8F70
_020A8DEC:
	cmp r8, #2
	beq _020A8E24
	ldr r0, [sp, #4]
	bl sub_020A8A18
	cmp r6, #0
	ldr r1, [sb, #0x80c]
	bne _020A8E18
	cmp r1, r0
	movhs r0, #1
	strhsb r0, [sb, #0x5af]
	b _020A8E24
_020A8E18:
	cmp r1, r0
	movhi r0, #0
	strhib r0, [sb, #0x5af]
_020A8E24:
	ldr r1, [sp, #4]
	mov r0, #1
	add r1, r1, r4
	str r1, [sp, #4]
	strb r0, [sb, #0x5ac]
	b _020A8F70
_020A8E3C:
	cmp r7, #0
	cmpeq r6, #0
	bne _020A8E54
	cmp r8, #2
	ldrne r0, [sp, #4]
	strne r0, [sb, #0x460]
_020A8E54:
	ldr r0, [sp, #4]
	mov r5, #0
	add sl, r0, r4
	cmp r0, sl
	bhs _020A8EA4
	add r4, sp, #4
_020A8E6C:
	mov r0, sb
	mov r1, r4
	mov r3, r5
	add r2, r7, #1
	str r8, [sp]
	bl sub_020A8A98
	cmp r0, #0
	add r5, r5, #1
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #4]
	cmp r0, sl
	blo _020A8E6C
_020A8EA4:
	cmp r7, #1
	cmpeq r6, #0
	bne _020A8F70
	cmp r8, #2
	strne r0, [sb, #0x464]
	b _020A8F70
_020A8EBC:
	ldr r0, [sp, #4]
	add r6, r0, r4
	cmp r0, r6
	bhs _020A8F70
	add r5, sp, #4
	mov r4, #0
_020A8ED4:
	mov r0, sb
	mov r1, r5
	mov r3, r4
	add r2, r7, #1
	str r8, [sp]
	bl sub_020A8A98
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #4]
	cmp r0, r6
	blo _020A8ED4
	b _020A8F70
_020A8F0C:
	cmp r5, #0xa0
	bne _020A8F64
	ldr r0, [sp, #4]
	add r6, r0, r4
	cmp r0, r6
	bhs _020A8F70
	add r5, sp, #4
	mov r4, #0
_020A8F2C:
	mov r0, sb
	mov r1, r5
	mov r3, r4
	add r2, r7, #1
	str r8, [sp]
	bl sub_020A8A98
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #4]
	cmp r0, r6
	blo _020A8F2C
	b _020A8F70
_020A8F64:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
_020A8F70:
	ldr r1, [sp, #4]
	mov r0, #0
	str r1, [fp]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A8F84: .word _021106B8
	arm_func_end sub_020A8A98

	arm_func_start sub_020A8F88
sub_020A8F88: ; 0x020A8F88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x5a4]
	mov r7, r1
	cmp r0, #0
	ldrne r0, [r8, #0x5a8]
	cmpne r0, #0
	ldrne r0, [r7, #0x10]
	cmpne r0, #0
	ldrne r0, [r7, #0xc]
	cmpne r0, #0
	ldrne r0, [r7, #8]
	cmpne r0, #0
	ldrne r0, [r7, #4]
	cmpne r0, #0
	addeq sp, sp, #4
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, r0, lsl #1
	ldr r1, _020A9128 ; =0x021D4634
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	ldr r1, [r1]
	mov r0, r5, lsl #3
	blx r1
	movs r4, r0
	addeq sp, sp, #4
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r6, r4, r5, lsl #1
	add sb, r6, r5, lsl #1
	ldr r1, [r8, #0x5a4]
	ldr r2, [r8, #0x5a8]
	mov r0, r6
	mov r3, r5
	add sl, sb, r5, lsl #1
	bl sub_020AD7B0
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0xc]
	mov r0, sb
	mov r3, r5
	bl sub_020AD7B0
	ldr r1, [r7, #8]
	ldr r2, [r7, #4]
	mov r0, sl
	mov r3, r5
	bl sub_020AD7B0
	bl sub_020A8878
	mov r2, sb
	mov sb, r0
	mov r0, r4
	mov r1, r6
	mov r3, r5
	str sl, [sp]
	bl sub_020AD19C
	mov r0, sb
	bl sub_020A88C4
	ldr r2, [r7, #4]
	mov r0, r6
	mov r1, r4
	mov r3, r5
	bl sub_020AD80C
	ldrb r0, [r4, r5, lsl #1]
	mov r5, #0
	cmp r0, #0
	ldreqb r0, [r6, #1]
	cmpeq r0, #1
	movne r5, #2
	bne _020A910C
	ldr r3, [r7, #4]
	mov r2, #2
	cmp r3, #2
	ble _020A90C8
_020A90B0:
	ldrb r0, [r6, r2]
	cmp r0, #0xff
	bne _020A90C8
	add r2, r2, #1
	cmp r2, r3
	blt _020A90B0
_020A90C8:
	add r1, r2, #1
	cmp r1, r3
	bge _020A9108
	ldrb r0, [r6, r2]
	cmp r0, #0
	ldreqb r0, [r6, r1]
	cmpeq r0, #0x30
	bne _020A9108
	ldr r2, [r8, #0x47c]
	add r0, r8, #0x68
	add r1, r6, r3
	add r0, r0, #0x400
	sub r1, r1, r2
	bl memcmp
	cmp r0, #0
	beq _020A910C
_020A9108:
	mov r5, #2
_020A910C:
	ldr r1, _020A912C ; =0x021D4660
	mov r0, r4
	ldr r1, [r1]
	blx r1
	mov r0, r5
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020A9128: .word 0x021D4634
_020A912C: .word 0x021D4660
	arm_func_end sub_020A8F88

	arm_func_start sub_020A9130
sub_020A9130: ; 0x020A9130
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #0x5af]
	ldr r1, [r5, #0x45c]
	cmp r0, #0
	movne r4, #0
	moveq r4, #0x8000
	mvn r0, #0
	cmp r1, r0
	orreq r0, r4, #4
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x458]
	cmp r0, #3
	beq _020A9174
	cmp r0, #4
	beq _020A91AC
	b _020A91E4
_020A9174:
	add r0, r5, #0x3fc
	bl sub_020ABEC0
	ldr r1, [r5, #0x460]
	ldr r2, [r5, #0x464]
	add r0, r5, #0x3fc
	sub r2, r2, r1
	bl sub_020ABF08
	add r1, r5, #0x68
	add r0, r5, #0x3fc
	add r1, r1, #0x400
	bl sub_020ABFC0
	mov r0, #0x10
	str r0, [r5, #0x47c]
	b _020A91EC
_020A91AC:
	add r0, r5, #0x348
	bl sub_020AC780
	ldr r1, [r5, #0x460]
	ldr r2, [r5, #0x464]
	add r0, r5, #0x348
	sub r2, r2, r1
	bl sub_020AC7D4
	add r1, r5, #0x68
	add r0, r5, #0x348
	add r1, r1, #0x400
	bl sub_020AC88C
	mov r0, #0x14
	str r0, [r5, #0x47c]
	b _020A91EC
_020A91E4:
	orr r0, r4, #3
	ldmia sp!, {r3, r4, r5, pc}
_020A91EC:
	mov r0, r5
	add r1, r5, #0x5b0
	bl sub_020A8910
	movs r1, r0
	orreq r0, r4, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl sub_020A8F88
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A9130

	arm_func_start sub_020A9214
sub_020A9214: ; 0x020A9214
	mov r2, r0
	b _020A9220
_020A921C:
	add r0, r0, #1
_020A9220:
	ldrsb r1, [r0]
	cmp r1, #0x2e
	cmpne r1, #0
	bne _020A921C
	sub r0, r0, r2
	bx lr
	arm_func_end sub_020A9214

	arm_func_start sub_020A9238
sub_020A9238: ; 0x020A9238
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	b _020A9254
_020A9248:
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
_020A9254:
	ldrsb r0, [r5], #1
	ldrsb r1, [r6], #1
	cmp r1, r0
	beq _020A9248
	cmp r0, #0x2a
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	sub r6, r6, #1
	mov r0, r6
	bl sub_020A9214
	mov r4, r0
	mov r0, r5
	bl sub_020A9214
	cmp r0, r4
	movgt r0, #1
	ldmgtia sp!, {r4, r5, r6, pc}
	sub r0, r4, r0
	add r6, r6, r0
	b _020A9254
	arm_func_end sub_020A9238

	arm_func_start sub_020A92A0
sub_020A92A0: ; 0x020A92A0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A92A0

	arm_func_start sub_020A92A4
sub_020A92A4: ; 0x020A92A4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r1, [sp, #0x44]
	mov sl, r0
	ldrb r4, [r1, #2]
	ldrb r3, [r1]
	ldrb r2, [r1, #1]
	add r0, r1, #3
	mvn r1, #0
	str r0, [sp, #0x44]
	add r2, r2, r3, lsl #8
	add r0, sp, #8
	str r1, [sl, #0x45c]
	add r8, r4, r2, lsl #8
	bl sub_020DBA9C
	mov r6, #0
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	add r1, r1, #0x7d0
	mov r0, r0, lsl #8
	ldr r2, [sp, #0x10]
	add r0, r0, r1, lsl #16
	add r0, r2, r0
	str r0, [sl, #0x80c]
	strb r6, [sl, #0x6b0]
	str r6, [sl, #0x5a0]
	mov sb, r6
	str r6, [sl, #0x594]
	mov fp, #2
	mvn r5, #0
	mov r4, r6
_020A9324:
	ldr r1, [sp, #0x44]
	mov r0, sl
	ldrb r2, [r1, #2]
	ldrb ip, [r1]
	ldrb r3, [r1, #1]
	add r7, r1, #3
	add r1, sp, #0x44
	str r7, [sp, #0x44]
	str r5, [sl, #0x458]
	strb r4, [sl, #0x5ad]
	strb r4, [sl, #0x5ac]
	strb r4, [sl, #0x5af]
	strb r4, [sl, #0x6b0]
	strb r4, [sl, #0x5b0]
	strb r4, [sl, #0x7b0]
	add r3, r3, ip, lsl #8
	ldr r7, [sp, #0x44]
	add r3, r2, r3, lsl #8
	add r2, r3, #3
	str r7, [sl, #0x804]
	str r3, [sl, #0x808]
	sub r8, r8, r2
	mov r2, r4
	mov r3, r4
	str r6, [sp]
	bl sub_020A8A98
	cmp r0, #0
	bne _020A93AC
	ldr r0, [sl, #0x594]
	cmp r0, #0x33
	blo _020A93AC
	ldr r0, [sl, #0x5a0]
	cmp r0, #0
	bne _020A93C4
_020A93AC:
	mov r0, #9
	add sp, sp, #0x18
	strb r0, [sl, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020A93C4:
	mov r0, sl
	bl sub_020A9130
	mov r7, r0
	cmp sb, #0
	bne _020A93F4
	ldr r0, [sl, #0x800]
	cmp r0, #0
	beq _020A93F4
	add r1, sl, #0x7b0
	bl sub_020A9238
	cmp r0, #0
	orrne r7, r7, #0x4000
_020A93F4:
	and r6, r7, #0xff
	cmp r6, #1
	bne _020A9464
	cmp r8, #0
	beq _020A9464
	ldr r1, [sp, #0x44]
	mov r2, #0
	add r1, r1, #3
	str r1, [sp, #4]
	mov r1, #0
	strb r1, [sl, #0x5ad]
	mov r0, sl
	add r1, sp, #4
	mov r3, r2
	str fp, [sp]
	bl sub_020A8A98
	cmp r0, #0
	movne r0, #9
	addne sp, sp, #0x18
	strneb r0, [sl, #0x455]
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addne sp, sp, #0x10
	bxne lr
	mov r0, sl
	add r1, sl, #0x480
	bl sub_020A8F88
	bic r1, r7, #0xff
	orr r7, r1, r0
_020A9464:
	ldr r3, [sl, #0x810]
	cmp r3, #0
	beq _020A9484
	mov r0, r7
	mov r1, sl
	mov r2, sb
	blx r3
	mov r7, r0
_020A9484:
	cmp r6, #0
	add sb, sb, #1
	beq _020A94A4
	cmp r7, #0
	bne _020A94A4
	cmp r8, #0
	movne r6, #1
	bne _020A9324
_020A94A4:
	cmp r7, #0
	moveq r0, #3
	streqb r0, [sl, #0x455]
	movne r0, #9
	strneb r0, [sl, #0x455]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_020A92A4

	arm_func_start sub_020A94C8
sub_020A94C8: ; 0x020A94C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	add r0, r5, #2
	add r1, r6, #0x54
	mov r2, #0x20
	bl sub_020D4A50
	ldrb r7, [r6, #0x30]
	ldrb r4, [r5, #0x22]
	add r5, r5, #0x23
	cmp r7, #0
	beq _020A9520
	cmp r4, #0x20
	bne _020A9520
	mov r1, r5
	add r0, r6, #0x74
	mov r2, #0x20
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r6, #0x31]
	beq _020A955C
_020A9520:
	cmp r7, #0
	beq _020A9530
	mov r0, r6
	bl sub_020A87B8
_020A9530:
	cmp r4, #0
	moveq r0, #0
	beq _020A9550
	mov r0, r5
	add r1, r6, #0x74
	mov r2, #0x20
	bl sub_020D4A50
	mov r0, #1
_020A9550:
	strb r0, [r6, #0x30]
	mov r0, #0
	strb r0, [r6, #0x31]
_020A955C:
	add r0, r5, r4
	ldrb r2, [r5, r4]
	ldrb r1, [r0, #1]
	mov r0, #2
	add r1, r1, r2, lsl #8
	strh r1, [r6, #0x32]
	strb r0, [r6, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020A94C8

	arm_func_start sub_020A957C
sub_020A957C: ; 0x020A957C
	stmdb sp!, {r4, lr}
	cmp r1, #0
	mov r4, #0
	ble _020A95C0
_020A958C:
	ldrb lr, [r0]
	ldrb ip, [r0, #1]
	cmp r2, #3
	add lr, ip, lr, lsl #8
	ldreqb ip, [r0, #2]
	addeq lr, ip, lr, lsl #8
	cmp lr, r3
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	add r4, r4, #1
	cmp r4, r1
	add r0, r0, r2
	blt _020A958C
_020A95C0:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A957C

	arm_func_start sub_020A95C8
sub_020A95C8: ; 0x020A95C8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _020A9624 ; =_021106B0
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #0
_020A95E0:
	mov r0, r5, lsl #1
	ldrh r3, [r4, r0]
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl sub_020A957C
	cmp r0, #0
	beq _020A9610
	ldr r0, _020A9624 ; =_021106B0
	mov r1, r5, lsl #1
	ldrh r0, [r0, r1]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A9610:
	add r5, r5, #1
	cmp r5, #2
	blo _020A95E0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A9624: .word _021106B0
	arm_func_end sub_020A95C8

	arm_func_start sub_020A9628
sub_020A9628: ; 0x020A9628
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_020A9628

	arm_func_start sub_020A9638
sub_020A9638: ; 0x020A9638
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	ldrb r0, [r6]
	ldrb r1, [r6, #1]
	bl sub_020A9628
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r2, [r6, #2]
	ldrb r1, [r6, #3]
	ldr r3, _020A96FC ; =0x55555556
	add r0, r6, #8
	add r4, r1, r2, lsl #8
	smull r2, r1, r3, r4
	add r1, r1, r4, lsr #31
	mov r2, #3
	bl sub_020A95C8
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	strh r0, [r7, #0x32]
	ldrb r5, [r6, #4]
	ldrb r3, [r6, #5]
	ldrb r2, [r6, #6]
	ldrb r0, [r6, #7]
	mov r1, #0
	add r3, r3, r5, lsl #8
	add r5, r0, r2, lsl #8
	add r0, r4, #8
	strb r1, [r7, #0x30]
	cmp r5, #0x20
	add r4, r0, r3
	blt _020A96D0
	add r0, r6, r4
	add r1, r7, #0x34
	mov r2, #0x20
	bl sub_020D4A50
	b _020A96F0
_020A96D0:
	add r0, r7, #0x34
	rsb r2, r5, #0x20
	bl sub_020D4994
	add r1, r7, #0x54
	mov r2, r5
	add r0, r6, r4
	sub r1, r1, r5
	bl sub_020D4A50
_020A96F0:
	mov r0, #1
	strb r0, [r7, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A96FC: .word 0x55555556
	arm_func_end sub_020A9638

	arm_func_start sub_020A9700
sub_020A9700: ; 0x020A9700
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r4, r0
	ldrb r0, [r6]
	ldrb r1, [r6, #1]
	bl sub_020A9628
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r6, #2
	add r1, r4, #0x34
	mov r2, #0x20
	bl sub_020D4A50
	ldrb r5, [r6, #0x22]
	add r6, r6, #0x23
	cmp r5, #0x20
	movne r0, #0
	strneb r0, [r4, #0x30]
	bne _020A9760
	mov r0, r6
	add r1, r4, #0x74
	mov r2, #0x20
	bl sub_020D4A50
	mov r0, r4
	bl sub_020A8598
_020A9760:
	add r0, r6, r5
	ldrb r1, [r0, #1]
	ldrb r3, [r6, r5]
	add r0, r0, #2
	mov r2, #2
	add r1, r1, r3, lsl #8
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	bl sub_020A95C8
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	strh r0, [r4, #0x32]
	movne r0, #1
	strneb r0, [r4, #0x455]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A9700

	arm_func_start sub_020A979C
sub_020A979C: ; 0x020A979C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	movs sl, r2
	str r0, [sp, #8]
	ldrne r0, [sl]
	mov fp, r1
	cmpne r0, #0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, r0, lsl #1
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	add r4, r0, #1
	mov r0, #0x14
	mul r0, r4, r0
	ldr r1, _020A99D4 ; =0x021D4634
	ldr r1, [r1]
	blx r1
	movs r5, r0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r6, r5, r4, lsl #1
	add r7, r6, r4, lsl #1
	add r1, r7, r4, lsl #1
	str r1, [sp, #0x10]
	add r1, r1, r4, lsl #1
	add r8, r1, r4, lsl #1
	str r1, [sp, #0xc]
	ldr r2, [sl]
	add sb, r8, r4, lsl #1
	mov r1, fp
	mov r3, r4
	add fp, sb, r4, lsl #1
	bl sub_020AD7B0
	ldr r1, [sl, #0x1c]
	ldr r2, [sl, #0x18]
	mov r0, r6
	mov r3, r4
	bl sub_020AD7B0
	ldr r1, [sl, #0xc]
	ldr r2, [sl, #8]
	mov r0, r8
	mov r3, r4
	bl sub_020AD7B0
	bl sub_020A8878
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	str r8, [sp]
	mov r1, r5
	mov r2, r6
	mov r3, r4
	bl sub_020AD5A4
	ldr r1, [sl, #0x24]
	ldr r2, [sl, #0x20]
	mov r0, r6
	mov r3, r4
	bl sub_020AD7B0
	ldr r1, [sl, #0x14]
	ldr r2, [sl, #0x10]
	mov r0, r8
	mov r3, r4
	bl sub_020AD7B0
	ldr r0, [sp, #0xc]
	mov r1, r5
	mov r2, r6
	mov r3, r4
	str r8, [sp]
	bl sub_020AD5A4
	ldr r0, [sp, #0x14]
	bl sub_020A88C4
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	mov r0, r5
	mov r3, r4
	bl sub_020ACB9C
	ldr r1, [sl, #0x2c]
	ldr r2, [sl, #0x28]
	mov r0, r6
	mov r3, r4
	bl sub_020AD7B0
	mov r0, r7
	mov r1, r5
	mov r2, r6
	mov r3, r4
	bl sub_020ACD18
	ldr r1, [sl, #0x14]
	ldr r2, [sl, #0x10]
	mov r0, r6
	mov r3, r4
	bl sub_020AD7B0
	mov r0, r5
	mov r1, r7
	mov r2, r6
	mov r3, r4
	bl sub_020ACD18
	ldr r2, [sp, #0xc]
	mov r0, r7
	mov r1, r5
	mov r3, r4
	bl sub_020ACA5C
	ldr r1, [sl, #4]
	ldr r2, [sl]
	mov r0, r6
	mov r3, r4
	bl sub_020AD7B0
	mov r0, r7
	mov r1, r4
	bl sub_020ACA2C
	cmp r0, #0
	bge _020A9990
	mov r0, r7
	mov r1, r4
	bl sub_020ACB5C
	mov r1, r7
	mov r2, r6
	mov r3, sb
	mov r0, #0
	stmia sp, {r4, fp}
	bl sub_020ACFBC
	mov r0, sb
	mov r1, r6
	mov r2, sb
	mov r3, r4
	bl sub_020ACB9C
	b _020A99A8
_020A9990:
	mov r1, r7
	mov r2, r6
	mov r3, sb
	mov r0, #0
	stmia sp, {r4, fp}
	bl sub_020ACFBC
_020A99A8:
	ldr r0, [sp, #8]
	mov r1, sb
	mov r3, r4
	mov r2, #0x30
	bl sub_020AD80C
	ldr r1, _020A99D8 ; =0x021D4660
	mov r0, r5
	ldr r1, [r1]
	blx r1
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A99D4: .word 0x021D4634
_020A99D8: .word 0x021D4660
	arm_func_end sub_020A979C

	arm_func_start sub_020A99DC
sub_020A99DC: ; 0x020A99DC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x14
	mov r4, r2
	mov r6, r0
	mov r5, r1
	add r0, r4, #0x348
	bl sub_020AC780
	mov r0, r5
	bl strlen
	mov r2, r0
	mov r1, r5
	add r0, r4, #0x348
	bl sub_020AC7D4
	add r0, r4, #0x348
	mov r1, r4
	mov r2, #0x30
	bl sub_020AC7D4
	add r0, r4, #0x348
	add r1, r4, #0x34
	mov r2, #0x40
	bl sub_020AC7D4
	add r0, r4, #0x348
	add r1, sp, #0
	bl sub_020AC88C
	add r0, r4, #0x3fc
	bl sub_020ABEC0
	add r0, r4, #0x3fc
	mov r1, r4
	mov r2, #0x30
	bl sub_020ABF08
	add r0, r4, #0x3fc
	add r1, sp, #0
	mov r2, #0x14
	bl sub_020ABF08
	add r0, r4, #0x3fc
	mov r1, r6
	bl sub_020ABFC0
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_020A99DC

	arm_func_start sub_020A9A78
sub_020A9A78: ; 0x020A9A78
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x30
	mov r4, r0
	ldr r1, _020A9ACC ; =_021106FC
	add r0, sp, #0
	mov r2, r4
	bl sub_020A99DC
	ldr r1, _020A9AD0 ; =_02110700
	add r0, sp, #0x10
	mov r2, r4
	bl sub_020A99DC
	ldr r1, _020A9AD4 ; =_02110704
	add r0, sp, #0x20
	mov r2, r4
	bl sub_020A99DC
	add r0, sp, #0
	mov r1, r4
	mov r2, #0x30
	bl sub_020D4A50
	add sp, sp, #0x30
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A9ACC: .word _021106FC
_020A9AD0: .word _02110700
_020A9AD4: .word _02110704
	arm_func_end sub_020A9A78

	arm_func_start sub_020A9AD8
sub_020A9AD8: ; 0x020A9AD8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov sl, r0
	ldrh r0, [sl, #0x32]
	cmp r0, #4
	beq _020A9AFC
	cmp r0, #5
	beq _020A9B10
	b _020A9B24
_020A9AFC:
	mov r0, #0x10
	str r0, [sp, #4]
	str r0, [sp]
	mov r2, #0
	b _020A9B24
_020A9B10:
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp]
	mov r2, #0
_020A9B24:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	mov r7, #0
	add r0, r1, r0
	add r0, r2, r0
	mov fp, r0, lsl #1
	cmp fp, #0
	ble _020A9C18
	add r0, sl, #0x74
	mov sb, r7
	str r0, [sp, #8]
	add r5, sp, #0xc
	mov r4, #1
_020A9B58:
	add r0, sl, #0x348
	bl sub_020AC780
	add r0, r7, #0x41
	add r6, r7, #1
	strb r0, [sp, #0xc]
	mov r8, #0
	cmp r6, #0
	ble _020A9B94
_020A9B78:
	add r0, sl, #0x348
	mov r1, r5
	mov r2, r4
	bl sub_020AC7D4
	add r8, r8, #1
	cmp r8, r6
	blt _020A9B78
_020A9B94:
	add r0, sl, #0x348
	mov r1, sl
	mov r2, #0x30
	bl sub_020AC7D4
	add r0, sl, #0x348
	add r1, sl, #0x54
	mov r2, #0x20
	bl sub_020AC7D4
	add r0, sl, #0x348
	add r1, sl, #0x34
	mov r2, #0x20
	bl sub_020AC7D4
	add r0, sl, #0x348
	add r1, sp, #0xd
	bl sub_020AC88C
	add r0, sl, #0x3fc
	bl sub_020ABEC0
	add r0, sl, #0x3fc
	mov r1, sl
	mov r2, #0x30
	bl sub_020ABF08
	add r0, sl, #0x3fc
	add r1, sp, #0xd
	mov r2, #0x14
	bl sub_020ABF08
	ldr r1, [sp, #8]
	add r0, sl, #0x3fc
	add r1, r1, sb
	bl sub_020ABFC0
	add sb, sb, #0x10
	cmp sb, fp
	add r7, r7, #1
	blt _020A9B58
_020A9C18:
	ldrb r0, [sl, #0x454]
	add r3, sl, #0x74
	cmp r0, #0
	beq _020A9C54
	ldr r0, [sp, #4]
	str r3, [sl, #0x1d4]
	add r2, r3, r0
	add r1, r2, r0
	add r0, r3, r0, lsl #1
	str r0, [sl, #0x1d8]
	ldr r0, [sp]
	str r2, [sl, #0xbc]
	add r0, r1, r0
	str r0, [sl, #0xc0]
	b _020A9C7C
_020A9C54:
	ldr r0, [sp, #4]
	str r3, [sl, #0xbc]
	add r2, r3, r0
	add r1, r2, r0
	add r0, r3, r0, lsl #1
	str r0, [sl, #0xc0]
	ldr r0, [sp]
	str r2, [sl, #0x1d4]
	add r0, r1, r0
	str r0, [sl, #0x1d8]
_020A9C7C:
	ldr r1, [sl, #0x1d8]
	add r0, sl, #0x1e0
	mov r2, #0x10
	bl sub_020AC924
	ldr r1, [sl, #0xc0]
	add r0, sl, #0xc8
	mov r2, #0x10
	bl sub_020AC924
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020A9AD8

	arm_func_start sub_020A9CA4
sub_020A9CA4: ; 0x020A9CA4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r2, [r4, #0x81c]
	bl sub_020A979C
	mov r0, r4
	bl sub_020A9A78
	mov r1, #0
	mov r0, r4
	mov r2, r1
	bl sub_020A86CC
	mov r0, r4
	bl sub_020A9AD8
	mov r0, #5
	strb r0, [r4, #0x455]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A9CA4

	arm_func_start sub_020A9CE0
sub_020A9CE0: ; 0x020A9CE0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x30
	mov r5, r0
	ldrb r0, [r5, #0x454]
	mov r4, r1
	teq r0, r2
	mov r2, #4
	beq _020A9D10
	ldr r1, _020A9DB4 ; =_02110708
	add r0, r5, #0x3a4
	bl sub_020ABF08
	b _020A9D1C
_020A9D10:
	ldr r1, _020A9DB8 ; =_02110710
	add r0, r5, #0x3a4
	bl sub_020ABF08
_020A9D1C:
	mov r1, r5
	add r0, r5, #0x3a4
	mov r2, #0x30
	bl sub_020ABF08
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x30
	bl sub_020D4994
	add r1, sp, #0
	add r0, r5, #0x3a4
	mov r2, #0x30
	bl sub_020ABF08
	mov r1, r4
	add r0, r5, #0x3a4
	bl sub_020ABFC0
	add r0, r5, #0x3a4
	bl sub_020ABEC0
	add r0, r5, #0x3a4
	mov r1, r5
	mov r2, #0x30
	bl sub_020ABF08
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x30
	bl sub_020D4994
	add r0, r5, #0x3a4
	add r1, sp, #0
	mov r2, #0x30
	bl sub_020ABF08
	add r0, r5, #0x3a4
	mov r1, r4
	mov r2, #0x10
	bl sub_020ABF08
	add r0, r5, #0x3a4
	mov r1, r4
	bl sub_020ABFC0
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A9DB4: .word _02110708
_020A9DB8: .word _02110710
	arm_func_end sub_020A9CE0

	arm_func_start sub_020A9DBC
sub_020A9DBC: ; 0x020A9DBC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x28
	mov r5, r0
	ldrb r0, [r5, #0x454]
	mov r4, r1
	teq r0, r2
	mov r2, #4
	beq _020A9DEC
	ldr r1, _020A9E90 ; =_02110708
	add r0, r5, #0x2ec
	bl sub_020AC7D4
	b _020A9DF8
_020A9DEC:
	ldr r1, _020A9E94 ; =_02110710
	add r0, r5, #0x2ec
	bl sub_020AC7D4
_020A9DF8:
	mov r1, r5
	add r0, r5, #0x2ec
	mov r2, #0x30
	bl sub_020AC7D4
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x28
	bl sub_020D4994
	add r1, sp, #0
	add r0, r5, #0x2ec
	mov r2, #0x28
	bl sub_020AC7D4
	mov r1, r4
	add r0, r5, #0x2ec
	bl sub_020AC88C
	add r0, r5, #0x2ec
	bl sub_020AC780
	add r0, r5, #0x2ec
	mov r1, r5
	mov r2, #0x30
	bl sub_020AC7D4
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x28
	bl sub_020D4994
	add r0, r5, #0x2ec
	add r1, sp, #0
	mov r2, #0x28
	bl sub_020AC7D4
	add r0, r5, #0x2ec
	mov r1, r4
	mov r2, #0x14
	bl sub_020AC7D4
	add r0, r5, #0x2ec
	mov r1, r4
	bl sub_020AC88C
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A9E90: .word _02110708
_020A9E94: .word _02110710
	arm_func_end sub_020A9DBC

	arm_func_start sub_020A9E98
sub_020A9E98: ; 0x020A9E98
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	mov r4, r1
	add r0, r5, #0x3a4
	add r1, r5, #0x3fc
	mov r2, #0x58
	bl sub_020D4A50
	add r1, sp, #0
	mov r0, r5
	mov r2, #1
	bl sub_020A9CE0
	add r0, r5, #0x3fc
	add r1, r5, #0x3a4
	mov r2, #0x58
	bl sub_020D4A50
	add r1, sp, #0
	mov r0, r4
	mov r2, #0x10
	bl memcmp
	cmp r0, #0
	movne r0, #9
	addne sp, sp, #0x14
	strneb r0, [r5, #0x455]
	ldmneia sp!, {r4, r5, pc}
	add r0, r5, #0x2ec
	add r1, r5, #0x348
	mov r2, #0x5c
	bl sub_020D4A50
	add r1, sp, #0
	mov r0, r5
	mov r2, #1
	bl sub_020A9DBC
	add r0, r5, #0x348
	add r1, r5, #0x2ec
	mov r2, #0x5c
	bl sub_020D4A50
	add r1, sp, #0
	add r0, r4, #0x10
	mov r2, #0x14
	bl memcmp
	cmp r0, #0
	movne r0, #9
	strneb r0, [r5, #0x455]
	moveq r0, #6
	streqb r0, [r5, #0x455]
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	arm_func_end sub_020A9E98

	arm_func_start sub_020A9F58
sub_020A9F58: ; 0x020A9F58
	mov r2, #8
_020A9F5C:
	ldrb r1, [r0, #-1]!
	add r1, r1, #1
	ands r1, r1, #0xff
	strb r1, [r0]
	bxne lr
	subs r2, r2, #1
	bne _020A9F5C
	bx lr
	arm_func_end sub_020A9F58

	arm_func_start sub_020A9F7C
sub_020A9F7C: ; 0x020A9F7C
	stmdb sp!, {r4, lr}
	add r0, r0, #0x1e0
	mov r4, r2
	bl sub_020AC998
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A9F7C

	arm_func_start sub_020A9F94
sub_020A9F94: ; 0x020A9F94
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x44
	mov r6, r1
	ldrb r3, [r6, #3]
	ldrb r2, [r6, #4]
	mov r7, r0
	add r1, r6, #5
	add r2, r2, r3, lsl #8
	bl sub_020A9F7C
	ldrh r1, [r7, #0x32]
	mov r4, r0
	cmp r1, #4
	beq _020A9FD4
	cmp r1, #5
	beq _020AA0B4
	b _020AA190
_020A9FD4:
	sub r4, r4, #0x10
	mov r0, r4, asr #8
	strb r0, [r6, #3]
	strb r4, [r6, #4]
	add r0, r7, #0x3fc
	bl sub_020ABEC0
	ldr r1, [r7, #0x1d4]
	add r0, r7, #0x3fc
	mov r2, #0x10
	bl sub_020ABF08
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x30
	bl sub_020D4994
	add r1, sp, #0
	add r0, r7, #0x3fc
	mov r2, #0x30
	bl sub_020ABF08
	add r0, r7, #0x3fc
	add r1, r7, #0x2e4
	mov r2, #8
	bl sub_020ABF08
	add r0, r7, #0x3fc
	mov r1, r6
	mov r2, #1
	bl sub_020ABF08
	add r0, r7, #0x3fc
	add r1, r6, #3
	add r2, r4, #2
	bl sub_020ABF08
	add r0, r7, #0x3fc
	add r1, sp, #0x30
	bl sub_020ABFC0
	add r0, r7, #0x3fc
	bl sub_020ABEC0
	ldr r1, [r7, #0x1d4]
	add r0, r7, #0x3fc
	mov r2, #0x10
	bl sub_020ABF08
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x30
	bl sub_020D4994
	add r0, r7, #0x3fc
	add r1, sp, #0
	mov r2, #0x30
	bl sub_020ABF08
	add r0, r7, #0x3fc
	add r1, sp, #0x30
	mov r2, #0x10
	bl sub_020ABF08
	add r0, r7, #0x3fc
	add r1, sp, #0x30
	bl sub_020ABFC0
	mov r5, #0x10
	b _020AA190
_020AA0B4:
	sub r4, r4, #0x14
	mov r0, r4, asr #8
	strb r0, [r6, #3]
	strb r4, [r6, #4]
	add r0, r7, #0x348
	bl sub_020AC780
	ldr r1, [r7, #0x1d4]
	add r0, r7, #0x348
	mov r2, #0x14
	bl sub_020AC7D4
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x28
	bl sub_020D4994
	add r1, sp, #0
	add r0, r7, #0x348
	mov r2, #0x28
	bl sub_020AC7D4
	add r0, r7, #0x348
	add r1, r7, #0x2e4
	mov r2, #8
	bl sub_020AC7D4
	add r0, r7, #0x348
	mov r1, r6
	mov r2, #1
	bl sub_020AC7D4
	add r0, r7, #0x348
	add r1, r6, #3
	add r2, r4, #2
	bl sub_020AC7D4
	add r0, r7, #0x348
	add r1, sp, #0x30
	bl sub_020AC88C
	add r0, r7, #0x348
	bl sub_020AC780
	ldr r1, [r7, #0x1d4]
	add r0, r7, #0x348
	mov r2, #0x14
	bl sub_020AC7D4
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x28
	bl sub_020D4994
	add r0, r7, #0x348
	add r1, sp, #0
	mov r2, #0x28
	bl sub_020AC7D4
	add r0, r7, #0x348
	add r1, sp, #0x30
	mov r2, #0x14
	bl sub_020AC7D4
	add r0, r7, #0x348
	add r1, sp, #0x30
	bl sub_020AC88C
	mov r5, #0x14
_020AA190:
	add r0, r6, #5
	add r1, sp, #0x30
	mov r2, r5
	add r0, r0, r4
	bl memcmp
	cmp r0, #0
	movne r0, #9
	strneb r0, [r7, #0x455]
	add r0, r7, #0x2ec
	bl sub_020A9F58
	add r0, r4, #5
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end sub_020A9F94

	arm_func_start sub_020AA1C4
sub_020AA1C4: ; 0x020AA1C4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r4, r1
	mov r5, r0
	ldrh r0, [r5, #0x32]
	ldrb r2, [r4, #3]
	ldrb r1, [r4, #4]
	cmp r0, #4
	add r6, r4, #5
	add r7, r1, r2, lsl #8
	beq _020AA1FC
	cmp r0, #5
	beq _020AA2CC
	b _020AA398
_020AA1FC:
	add r0, r5, #0x3fc
	bl sub_020ABEC0
	ldr r1, [r5, #0xbc]
	add r0, r5, #0x3fc
	mov r2, #0x10
	bl sub_020ABF08
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x30
	bl sub_020D4994
	add r1, sp, #0
	add r0, r5, #0x3fc
	mov r2, #0x30
	bl sub_020ABF08
	add r0, r5, #0x3fc
	add r1, r5, #0x1cc
	mov r2, #8
	bl sub_020ABF08
	add r0, r5, #0x3fc
	mov r1, r4
	mov r2, #1
	bl sub_020ABF08
	add r0, r5, #0x3fc
	add r1, r4, #3
	add r2, r7, #2
	bl sub_020ABF08
	add r0, r5, #0x3fc
	add r1, r6, r7
	bl sub_020ABFC0
	add r0, r5, #0x3fc
	bl sub_020ABEC0
	ldr r1, [r5, #0xbc]
	add r0, r5, #0x3fc
	mov r2, #0x10
	bl sub_020ABF08
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x30
	bl sub_020D4994
	add r0, r5, #0x3fc
	add r1, sp, #0
	mov r2, #0x30
	bl sub_020ABF08
	add r0, r5, #0x3fc
	add r1, r6, r7
	mov r2, #0x10
	bl sub_020ABF08
	add r1, r6, r7
	add r0, r5, #0x3fc
	bl sub_020ABFC0
	add r7, r7, #0x10
	b _020AA398
_020AA2CC:
	add r0, r5, #0x348
	bl sub_020AC780
	ldr r1, [r5, #0xbc]
	add r0, r5, #0x348
	mov r2, #0x14
	bl sub_020AC7D4
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x28
	bl sub_020D4994
	add r1, sp, #0
	add r0, r5, #0x348
	mov r2, #0x28
	bl sub_020AC7D4
	add r0, r5, #0x348
	add r1, r5, #0x1cc
	mov r2, #8
	bl sub_020AC7D4
	add r0, r5, #0x348
	mov r1, r4
	mov r2, #1
	bl sub_020AC7D4
	add r0, r5, #0x348
	add r1, r4, #3
	add r2, r7, #2
	bl sub_020AC7D4
	add r0, r5, #0x348
	add r1, r6, r7
	bl sub_020AC88C
	add r0, r5, #0x348
	bl sub_020AC780
	ldr r1, [r5, #0xbc]
	add r0, r5, #0x348
	mov r2, #0x14
	bl sub_020AC7D4
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x28
	bl sub_020D4994
	add r0, r5, #0x348
	add r1, sp, #0
	mov r2, #0x28
	bl sub_020AC7D4
	add r0, r5, #0x348
	add r1, r6, r7
	mov r2, #0x14
	bl sub_020AC7D4
	add r1, r6, r7
	add r0, r5, #0x348
	bl sub_020AC88C
	add r7, r7, #0x14
_020AA398:
	mov r0, r7, asr #8
	strb r0, [r4, #3]
	mov r2, r7
	add r0, r5, #0xc8
	add r1, r4, #5
	strb r7, [r4, #4]
	bl sub_020AC998
	add r0, r5, #0x1d4
	bl sub_020A9F58
	add r0, r7, #5
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020AA1C4

	arm_func_start sub_020AA3C8
sub_020AA3C8: ; 0x020AA3C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	add r4, sp, #0
_020AA3DC:
	mov r0, r4
	mov r1, r5
	bl sub_020A6CDC
	ldr r1, [sp]
	cmp r1, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, r6
	strhi r6, [sp]
	ldr r2, [sp]
	mov r1, r7
	bl sub_020D4A50
	ldr r0, [sp]
	mov r1, r5
	bl sub_020A6DBC
	ldr r0, [sp]
	sub r6, r6, r0
	cmp r6, #0
	add r7, r7, r0
	bgt _020AA3DC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020AA3C8

	arm_func_start sub_020AA434
sub_020AA434: ; 0x020AA434
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	add r0, r6, #0x2ec
	bl sub_020AC7D4
	mov r1, r5
	mov r2, r4
	add r0, r6, #0x3a4
	bl sub_020ABF08
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020AA434

	arm_func_start sub_020AA460
sub_020AA460: ; 0x020AA460
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r0
	ldrb r2, [sb, #0x455]
	mov r8, r1
	cmp r2, #9
	bne _020AA48C
	ldr r1, _020AA6DC ; =0x021D4660
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020AA48C:
	ldrb r3, [r8, #3]
	ldrb r1, [r8, #4]
	add r0, r2, #0xf9
	and r0, r0, #0xff
	add r1, r1, r3, lsl #8
	cmp r0, #1
	add r6, r1, #5
	ldrb r4, [r8]
	bhi _020AA4B8
	cmp r4, #0x15
	bne _020AA4C8
_020AA4B8:
	cmp r4, #0x15
	bne _020AA4F8
	cmp r6, #7
	bls _020AA4F8
_020AA4C8:
	mov r0, sb
	mov r1, r8
	bl sub_020A9F94
	ldrb r2, [sb, #0x455]
	mov r6, r0
	cmp r2, #9
	bne _020AA4F8
	ldr r1, _020AA6DC ; =0x021D4660
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020AA4F8:
	sub r0, r4, #0x14
	cmp r0, #3
	add r5, r8, #5
	sub r6, r6, #5
	addls pc, pc, r0, lsl #2
	b _020AA6C0
_020AA510: ; jump table
	b _020AA520 ; case 0
	b _020AA550 ; case 1
	b _020AA564 ; case 2
	b _020AA6A0 ; case 3
_020AA520:
	ldr r0, [sb, #0x1d4]
	cmp r0, #0
	moveq r0, #9
	streqb r0, [sb, #0x455]
	beq _020AA6C8
	add r0, sb, #0x2e4
	mov r1, #0
	mov r2, #8
	bl sub_020D4994
	mov r0, #7
	strb r0, [sb, #0x455]
	b _020AA6C8
_020AA550:
	ldrb r0, [r5]
	cmp r0, #2
	moveq r0, #9
	streqb r0, [sb, #0x455]
	b _020AA6C8
_020AA564:
	mov fp, #4
	mov sl, #1
	mov r4, #0
_020AA570:
	ldrb r7, [r5, #2]
	ldrb r0, [r5, #1]
	ldrb r3, [r5]
	ldrb r1, [r5, #3]
	mov r7, r7, lsl #8
	add r0, r7, r0, lsl #16
	cmp r3, #0xb
	add r7, r1, r0
	add r5, r5, #4
	bgt _020AA5C0
	cmp r3, #0xb
	bge _020AA634
	cmp r3, #2
	bgt _020AA668
	cmp r3, #1
	blt _020AA668
	beq _020AA5F0
	cmp r3, #2
	beq _020AA624
	b _020AA668
_020AA5C0:
	sub r0, r3, #0xd
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020AA668
_020AA5D0: ; jump table
	b _020AA648 ; case 0
	b _020AA650 ; case 1
	b _020AA668 ; case 2
	b _020AA614 ; case 3
	b _020AA668 ; case 4
	b _020AA668 ; case 5
	b _020AA668 ; case 6
	b _020AA658 ; case 7
_020AA5F0:
	ldrb r0, [sb, #0x454]
	cmp r0, #0
	beq _020AA670
	cmp r2, #0
	bne _020AA670
	mov r0, sb
	mov r1, r5
	bl sub_020A9700
	b _020AA670
_020AA614:
	mov r0, sb
	mov r1, r5
	bl sub_020A9CA4
	b _020AA670
_020AA624:
	mov r0, sb
	mov r1, r5
	bl sub_020A94C8
	b _020AA670
_020AA634:
	mov r0, sb
	mov r1, r5
	bl sub_020A92A4
	strb r4, [sb, #0x5ac]
	b _020AA670
_020AA648:
	strb sl, [sb, #0x5ac]
	b _020AA670
_020AA650:
	strb fp, [sb, #0x455]
	b _020AA670
_020AA658:
	mov r0, sb
	mov r1, r5
	bl sub_020A9E98
	b _020AA670
_020AA668:
	mov r0, #9
	strb r0, [sb, #0x455]
_020AA670:
	mov r0, sb
	sub r1, r5, #4
	add r2, r7, #4
	bl sub_020AA434
	add r0, r7, #4
	add r5, r5, r7
	subs r6, r6, r0
	beq _020AA6C8
	ldrb r2, [sb, #0x455]
	cmp r2, #9
	bne _020AA570
	b _020AA6C8
_020AA6A0:
	str r8, [sb, #0x824]
	mov r0, #5
	str r0, [sb, #0x82c]
	add r0, r6, #5
	str r0, [sb, #0x828]
	mov r0, #1
	strb r0, [sb, #0x456]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020AA6C0:
	mov r0, #9
	strb r0, [sb, #0x455]
_020AA6C8:
	ldr r1, _020AA6DC ; =0x021D4660
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AA6DC: .word 0x021D4660
	arm_func_end sub_020AA460

	arm_func_start sub_020AA6E0
sub_020AA6E0: ; 0x020AA6E0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r0
	ldr r4, [r5, #0xc]
	add r6, sp, #0
_020AA6F4:
	mov r0, r6
	mov r1, r5
	bl sub_020A6CDC
	ldr r1, [sp]
	cmp r1, #0
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	cmp r1, #5
	blo _020AA6F4
	ldrb r1, [r0]
	cmp r1, #0x80
	bne _020AA7DC
	ldrb r1, [r4, #0x454]
	cmp r1, #0
	beq _020AA7D0
	ldrb r1, [r4, #0x455]
	cmp r1, #0
	bne _020AA7D0
	ldrb r2, [r0, #1]
	mov r1, r5
	mov r0, #2
	str r2, [sp]
	bl sub_020A6DBC
	ldr r1, _020AA874 ; =0x021D4634
	ldr r0, [sp]
	ldr r1, [r1]
	blx r1
	movs r6, r0
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [sp]
	mov r2, r5
	bl sub_020AA3C8
	cmp r0, #0
	ldreqb r0, [r6]
	cmpeq r0, #1
	movne r0, #9
	strneb r0, [r4, #0x455]
	bne _020AA7AC
	mov r0, r4
	add r1, r6, #1
	bl sub_020A9638
_020AA7AC:
	ldr r2, [sp]
	mov r0, r4
	mov r1, r6
	bl sub_020AA434
	ldr r1, _020AA878 ; =0x021D4660
	mov r0, r6
	ldr r1, [r1]
	blx r1
	b _020AA868
_020AA7D0:
	mov r0, #9
	strb r0, [r4, #0x455]
	b _020AA868
_020AA7DC:
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #4]
	ldr r1, _020AA87C ; =0x00004805
	add r0, r0, r2, lsl #8
	add r0, r0, #5
	str r0, [sp]
	cmp r0, r1
	movhi r0, #9
	addhi sp, sp, #4
	strhib r0, [r4, #0x455]
	ldmhiia sp!, {r3, r4, r5, r6, pc}
	ldr r1, _020AA874 ; =0x021D4634
	ldr r1, [r1]
	blx r1
	movs r6, r0
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [sp]
	mov r2, r5
	bl sub_020AA3C8
	cmp r0, #0
	beq _020AA85C
	ldr r1, _020AA878 ; =0x021D4660
	mov r0, r6
	ldr r1, [r1]
	blx r1
	mov r0, #9
	add sp, sp, #4
	strb r0, [r4, #0x455]
	ldmia sp!, {r3, r4, r5, r6, pc}
_020AA85C:
	mov r0, r4
	mov r1, r6
	bl sub_020AA460
_020AA868:
	ldrb r0, [r4, #0x455]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020AA874: .word 0x021D4634
_020AA878: .word 0x021D4660
_020AA87C: .word 0x00004805
	arm_func_end sub_020AA6E0

	arm_func_start sub_020AA880
sub_020AA880: ; 0x020AA880
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x74
	ldr r2, _020AA9A0 ; =0x021D5E60
	mov sl, r0
	ldrb r0, [r2]
	mov sb, r1
	cmp r0, #0
	bne _020AA8E4
	ldr r2, _020AA9A4 ; =0x021D4688
	add r0, sp, #0
	ldr r3, [r2]
	ldmib r2, {r1, r4}
	umull r6, r5, r4, r3
	mla r5, r4, r1, r5
	ldr r1, [r2, #0xc]
	ldr r4, [r2, #0x10]
	mla r5, r1, r3, r5
	ldr r1, [r2, #0x14]
	adds r4, r4, r6
	adc r3, r1, r5
	str r4, [r2]
	mov r1, #4
	str r3, [r2, #4]
	str r3, [sp]
	bl sub_020AA9B0
_020AA8E4:
	cmp sb, #0
	mov r8, #0
	addle sp, sp, #0x74
	mov r1, #0x14
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, _020AA9A8 ; =0x021D5FD8
	add r6, sp, #0x18
	mov fp, r1
	add r4, sp, #4
_020AA908:
	cmp r1, #0x14
	bne _020AA97C
	mov r0, r6
	bl sub_020AC780
	bl sub_020D3A38
	mov r7, r0
	mov r0, r6
	mov r1, r5
	mov r2, fp
	bl sub_020AC7D4
	mov r0, r6
	mov r1, r4
	bl sub_020AC8F4
	ldr lr, _020AA9AC ; =0x021D5FEB
	mov r3, #1
	mov r2, #0x13
	add ip, sp, #0x17
_020AA94C:
	ldrb r1, [lr]
	ldrb r0, [ip], #-1
	subs r2, r2, #1
	add r0, r1, r0
	add r0, r3, r0
	strb r0, [lr], #-1
	mov r3, r0, lsr #8
	bpl _020AA94C
	str r0, [sp]
	mov r0, r7
	bl sub_020D3A4C
	mov r1, #0
_020AA97C:
	ldrb r0, [r4, r1]
	add r1, r1, #1
	cmp r0, #0
	strneb r0, [sl, r8]
	addne r8, r8, #1
	cmp r8, sb
	blt _020AA908
	add sp, sp, #0x74
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AA9A0: .word 0x021D5E60
_020AA9A4: .word 0x021D4688
_020AA9A8: .word 0x021D5FD8
_020AA9AC: .word 0x021D5FEB
	arm_func_end sub_020AA880

	arm_func_start sub_020AA9B0
sub_020AA9B0: ; 0x020AA9B0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x5c
	mov r6, r0
	add r0, sp, #0
	mov r5, r1
	bl sub_020AC780
	bl sub_020D3A38
	mov r4, r0
	ldr r1, _020AAA18 ; =0x021D5FD8
	add r0, sp, #0
	mov r2, #0x14
	bl sub_020AC7D4
	mov r1, r6
	mov r2, r5
	add r0, sp, #0
	bl sub_020AC7D4
	ldr r1, _020AAA18 ; =0x021D5FD8
	add r0, sp, #0
	bl sub_020AC88C
	mov r0, r4
	bl sub_020D3A4C
	ldr r0, _020AAA1C ; =0x021D5E60
	mov r1, #1
	strb r1, [r0]
	add sp, sp, #0x5c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020AAA18: .word 0x021D5FD8
_020AAA1C: .word 0x021D5E60
	arm_func_end sub_020AA9B0

	arm_func_start sub_020AAA20
sub_020AAA20: ; 0x020AAA20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r4, [sb, #0xc]
	ldr r7, [r4, #0x820]
	cmp r7, #0
	ldrne r8, [r7]
	moveq r8, #0
	bl sub_020A8820
	mov r1, r0, lsr #0x18
	strb r1, [r4, #0x54]
	mov r1, r0, lsr #0x10
	strb r1, [r4, #0x55]
	mov r1, r0, lsr #8
	strb r1, [r4, #0x56]
	strb r0, [r4, #0x57]
	add r0, r4, #0x58
	mov r1, #0x1c
	bl sub_020AA880
	ldr r1, _020AAC74 ; =0x021D4634
	add r0, r8, #0x9d
	ldr r1, [r1]
	blx r1
	movs r5, r0
	bne _020AAA90
	mov r0, #9
	strb r0, [r4, #0x455]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020AAA90:
	mov r0, #2
	strb r0, [r5, #5]
	mov r3, #0
	strb r3, [r5, #6]
	strb r3, [r5, #7]
	mov r0, #0x46
	strb r0, [r5, #8]
	mov r0, #3
	strb r0, [r5, #9]
	add r0, r4, #0x54
	add r1, r5, #0xb
	mov r2, #0x20
	strb r3, [r5, #0xa]
	bl sub_020D4A50
	mov r2, #0x20
	strb r2, [r5, #0x2b]
	ldrb r0, [r4, #0x30]
	cmp r0, #0
	beq _020AAAF8
	add r0, r4, #0x74
	add r1, r5, #0x2c
	bl sub_020D4A50
	mov r0, #1
	strb r0, [r4, #0x31]
	add r6, r5, #0x4c
	b _020AAB54
_020AAAF8:
	add r0, r5, #0x2c
	mov r1, #0x1c
	bl sub_020AA880
	ldr r0, _020AAC78 ; =0x021D5E60
	add r6, r5, #0x4c
	ldr r3, [r0, #4]
	sub r0, r6, #0x20
	mov r1, r3, lsr #0x18
	strb r1, [r5, #0x48]
	mov r1, r3, lsr #0x10
	strb r1, [r5, #0x49]
	mov r1, r3, lsr #8
	strb r1, [r5, #0x4a]
	add r1, r4, #0x74
	mov r2, #0x20
	strb r3, [r5, #0x4b]
	bl sub_020D4A50
	ldr r0, _020AAC78 ; =0x021D5E60
	mov r1, #0
	ldr r2, [r0, #4]
	strb r1, [r4, #0x31]
	add r1, r2, #1
	str r1, [r0, #4]
_020AAB54:
	ldrh r1, [r4, #0x32]
	mov r0, #0
	mov r1, r1, asr #8
	strb r1, [r6]
	ldrh r1, [r4, #0x32]
	strb r1, [r6, #1]
	strb r0, [r6, #2]
	ldrb r0, [r4, #0x31]
	add r6, r6, #3
	cmp r0, #0
	bne _020AAC08
	cmp r8, #0
	beq _020AABEC
	add r2, r8, #6
	mov r0, #0xb
	strb r0, [r6]
	add r1, r8, #3
	mov r0, r2, asr #0x10
	strb r0, [r6, #1]
	mov r0, r2, asr #8
	strb r0, [r6, #2]
	strb r2, [r6, #3]
	mov r0, r1, asr #0x10
	strb r0, [r6, #4]
	mov r0, r1, asr #8
	strb r0, [r6, #5]
	strb r1, [r6, #6]
	mov r0, r8, asr #0x10
	strb r0, [r6, #7]
	mov r0, r8, asr #8
	strb r0, [r6, #8]
	strb r8, [r6, #9]
	add r6, r6, #0xa
	ldr r0, [r7, #4]
	mov r1, r6
	mov r2, r8
	bl sub_020D4A50
	add r6, r6, r8
_020AABEC:
	mov r0, #0xe
	strb r0, [r6]
	mov r0, #0
	strb r0, [r6, #1]
	strb r0, [r6, #2]
	strb r0, [r6, #3]
	add r6, r6, #4
_020AAC08:
	mov r0, #0x16
	sub r1, r6, r5
	sub r6, r1, #5
	strb r0, [r5]
	mov r0, #3
	strb r0, [r5, #1]
	mov r0, #0
	strb r0, [r5, #2]
	mov r0, r6, asr #8
	strb r0, [r5, #3]
	mov r0, r4
	mov r2, r6
	add r1, r5, #5
	strb r6, [r5, #4]
	bl sub_020AA434
	mov r2, #0
	mov r0, r5
	mov r3, r2
	add r1, r6, #5
	str sb, [sp]
	bl sub_020A6F84
	ldr r1, _020AAC7C ; =0x021D4660
	mov r0, r5
	ldr r1, [r1]
	blx r1
	ldrb r0, [r4, #0x31]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020AAC74: .word 0x021D4634
_020AAC78: .word 0x021D5E60
_020AAC7C: .word 0x021D4660
	arm_func_end sub_020AAA20

	arm_func_start sub_020AAC80
sub_020AAC80: ; 0x020AAC80
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _020AADD0 ; =0x021D4634
	mov r6, r0
	ldr r1, [r1]
	mov r0, #0x83
	ldr r5, [r6, #0xc]
	blx r1
	movs r4, r0
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r5, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	mov r0, #0x14
	strb r0, [r4]
	mov r0, #3
	strb r0, [r4, #1]
	mov r1, #0
	strb r1, [r4, #2]
	strb r1, [r4, #3]
	mov r3, #1
	strb r3, [r4, #4]
	add r0, r5, #0x1cc
	mov r2, #8
	strb r3, [r4, #5]
	bl sub_020D4994
	mov r0, #0x16
	strb r0, [r4, #6]
	mov r0, #3
	strb r0, [r4, #7]
	mov r1, #0
	strb r1, [r4, #8]
	strb r1, [r4, #9]
	mov r0, #0x28
	strb r0, [r4, #0xa]
	mov r0, #0x14
	strb r0, [r4, #0xb]
	strb r1, [r4, #0xc]
	strb r1, [r4, #0xd]
	mov r3, #0x24
	add r0, r5, #0x3a4
	add r1, r5, #0x3fc
	mov r2, #0x58
	strb r3, [r4, #0xe]
	bl sub_020D4A50
	mov r0, r5
	add r1, r4, #0xf
	mov r2, #0
	bl sub_020A9CE0
	add r0, r5, #0x3fc
	add r1, r5, #0x3a4
	mov r2, #0x58
	bl sub_020D4A50
	add r0, r5, #0x2ec
	add r1, r5, #0x348
	mov r2, #0x5c
	bl sub_020D4A50
	mov r0, r5
	add r1, r4, #0x1f
	mov r2, #0
	bl sub_020A9DBC
	add r0, r5, #0x348
	add r1, r5, #0x2ec
	mov r2, #0x5c
	bl sub_020D4A50
	mov r0, r5
	add r1, r4, #0xb
	mov r2, #0x28
	bl sub_020AA434
	mov r0, r5
	add r1, r4, #6
	bl sub_020AA1C4
	mov r2, #0
	add r1, r0, #6
	mov r0, r4
	mov r3, r2
	str r6, [sp]
	bl sub_020A6F84
	ldr r1, _020AADD4 ; =0x021D4660
	mov r0, r4
	ldr r1, [r1]
	blx r1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020AADD0: .word 0x021D4634
_020AADD4: .word 0x021D4660
	arm_func_end sub_020AAC80

	arm_func_start sub_020AADD8
sub_020AADD8: ; 0x020AADD8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _020AAF60 ; =0x021D4634
	mov r7, r0
	ldr r1, [r1]
	mov r0, #0x98
	ldr r4, [r7, #0xc]
	blx r1
	movs r5, r0
	moveq r0, #9
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #3
	strb r0, [r5, #9]
	mov r0, #0
	strb r0, [r5, #0xa]
	bl sub_020A8820
	mov r1, r0, lsr #0x18
	strb r1, [r4, #0x34]
	mov r1, r0, lsr #0x10
	strb r1, [r4, #0x35]
	mov r1, r0, lsr #8
	strb r1, [r4, #0x36]
	strb r0, [r4, #0x37]
	add r0, r4, #0x38
	mov r1, #0x1c
	bl sub_020AA880
	add r0, r4, #0x34
	add r1, r5, #0xb
	mov r2, #0x20
	bl sub_020D4A50
	ldrh r2, [r7, #0x18]
	ldr r1, [r7, #0x1c]
	mov r0, r4
	bl sub_020A862C
	ldrb r0, [r4, #0x30]
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r5, #0x2b]
	addeq r0, r5, #0x2c
	beq _020AAE90
	mov r2, #0x20
	add r0, r4, #0x74
	add r1, r5, #0x2c
	strb r2, [r5, #0x2b]
	bl sub_020D4A50
	add r0, r5, #0x4c
_020AAE90:
	mov r6, #0
	strb r6, [r0]
	mov r1, #4
	strb r1, [r0, #1]
	ldr r2, _020AAF64 ; =_021106B0
	add r0, r0, #2
_020AAEA8:
	mov r3, r6, lsl #1
	ldrh r1, [r2, r3]
	add r6, r6, #1
	cmp r6, #2
	mov r1, r1, asr #8
	strb r1, [r0]
	ldrh r1, [r2, r3]
	strb r1, [r0, #1]
	add r0, r0, #2
	blo _020AAEA8
	mov r3, #1
	mov r2, #0
	strb r3, [r0]
	add r1, r0, #2
	sub r1, r1, r5
	sub r6, r1, #5
	strb r2, [r0, #1]
	sub r1, r6, #4
	mov r0, #0x16
	strb r0, [r5]
	mov r0, #3
	strb r0, [r5, #1]
	strb r2, [r5, #2]
	mov r0, r6, asr #8
	strb r0, [r5, #3]
	strb r6, [r5, #4]
	strb r3, [r5, #5]
	mov r0, r1, asr #0x10
	strb r0, [r5, #6]
	mov r0, r1, asr #8
	strb r0, [r5, #7]
	strb r1, [r5, #8]
	mov r0, r5
	mov r3, r2
	add r1, r6, #5
	str r7, [sp]
	bl sub_020A6F84
	mov r0, r4
	mov r2, r6
	add r1, r5, #5
	bl sub_020AA434
	ldr r1, _020AAF68 ; =0x021D4660
	mov r0, r5
	ldr r1, [r1]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020AAF60: .word 0x021D4634
_020AAF64: .word _021106B0
_020AAF68: .word 0x021D4660
	arm_func_end sub_020AADD8

	arm_func_start sub_020AAF6C
sub_020AAF6C: ; 0x020AAF6C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldr r4, [sl, #0xc]
	ldrb r0, [r4, #0x5ac]
	cmp r0, #0
	beq _020AAFA0
	mov r2, #0
	ldr r0, _020AB220 ; =0x02108FB8
	mov r3, r2
	mov r1, #7
	str sl, [sp]
	bl sub_020A6F84
_020AAFA0:
	mov r0, #3
	strb r0, [r4]
	mov r0, #0
	strb r0, [r4, #1]
	add r0, r4, #2
	mov r1, #0x2e
	bl sub_020AA880
	ldr sb, [r4, #0x594]
	ldr r0, _020AB224 ; =0x021D4634
	mov r1, sb, lsl #1
	ldr r2, [r0]
	add r1, r1, r1, lsr #31
	mov r0, sb
	mov r7, r1, asr #1
	blx r2
	movs r8, r0
	moveq r0, #9
	addeq sp, sp, #8
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	strb r0, [r8]
	mov r2, #2
	add r0, r8, #2
	sub r1, sb, #0x33
	strb r2, [r8, #1]
	bl sub_020AA880
	add r1, r8, sb
	mov r0, r4
	sub r3, sb, #0x31
	mov r5, #0
	sub r1, r1, #0x30
	mov r2, #0x30
	strb r5, [r8, r3]
	bl sub_020D4A50
	ldr r1, _020AB224 ; =0x021D4634
	mov r0, r7, lsl #3
	ldr r1, [r1]
	blx r1
	movs r5, r0
	bne _020AB064
	ldr r1, _020AB228 ; =0x021D4660
	mov r0, r8
	ldr r1, [r1]
	blx r1
	mov r0, #9
	add sp, sp, #8
	strb r0, [r4, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020AB064:
	add r0, r5, r7, lsl #1
	add fp, r0, r7, lsl #1
	mov r1, r8
	mov r2, sb
	mov r3, r7
	str r0, [sp, #4]
	add r6, fp, r7, lsl #1
	bl sub_020AD7B0
	add r0, r4, #0x198
	add r1, r0, #0x400
	ldr r2, [r4, #0x5a0]
	mov r0, fp
	mov r3, r7
	bl sub_020AD7B0
	add r1, r4, #0x94
	mov r0, r6
	add r1, r1, #0x400
	mov r2, sb
	mov r3, r7
	bl sub_020AD7B0
	bl sub_020A8878
	str r6, [sp]
	mov r6, r0
	ldr r1, [sp, #4]
	mov r2, fp
	mov r3, r7
	mov r0, r5
	bl sub_020AD19C
	mov r0, r6
	bl sub_020A88C4
	ldr r1, _020AB224 ; =0x021D4634
	add r0, sb, #0x49
	ldr r1, [r1]
	blx r1
	movs r6, r0
	bne _020AB124
	ldr r1, _020AB228 ; =0x021D4660
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldr r1, _020AB228 ; =0x021D4660
	mov r0, r5
	ldr r1, [r1]
	blx r1
	mov r0, #9
	add sp, sp, #8
	strb r0, [r4, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020AB124:
	mov r0, #0x16
	strb r0, [r6]
	mov r1, #3
	add r0, sb, #4
	strb r1, [r6, #1]
	mov r1, #0
	strb r1, [r6, #2]
	mov r1, r0, asr #8
	strb r1, [r6, #3]
	strb r0, [r6, #4]
	mov r0, #0x10
	strb r0, [r6, #5]
	mov r0, sb, asr #0x10
	strb r0, [r6, #6]
	mov r0, sb, asr #8
	strb r0, [r6, #7]
	strb sb, [r6, #8]
	tst sb, #1
	add r0, r6, #9
	beq _020AB18C
	add r0, sb, sb, lsr #31
	mov r0, r0, asr #1
	mov r0, r0, lsl #1
	ldrh r1, [r5, r0]
	add r0, r6, #0xa
	strb r1, [r6, #9]
_020AB18C:
	add r1, sb, sb, lsr #31
	mov r1, r1, asr #1
	subs r3, r1, #1
	bmi _020AB1C0
_020AB19C:
	mov r2, r3, lsl #1
	ldrh r1, [r5, r2]
	subs r3, r3, #1
	mov r1, r1, asr #8
	strb r1, [r0]
	ldrh r1, [r5, r2]
	strb r1, [r0, #1]
	add r0, r0, #2
	bpl _020AB19C
_020AB1C0:
	mov r2, #0
	mov r0, r6
	mov r3, r2
	add r1, sb, #9
	str sl, [sp]
	bl sub_020A6F84
	mov r0, r4
	add r1, r6, #5
	add r2, sb, #4
	bl sub_020AA434
	ldr r1, _020AB228 ; =0x021D4660
	mov r0, r6
	ldr r1, [r1]
	blx r1
	ldr r1, _020AB228 ; =0x021D4660
	mov r0, r5
	ldr r1, [r1]
	blx r1
	ldr r1, _020AB228 ; =0x021D4660
	mov r0, r8
	ldr r1, [r1]
	blx r1
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AB220: .word 0x02108FB8
_020AB224: .word 0x021D4634
_020AB228: .word 0x021D4660
	arm_func_end sub_020AAF6C

	arm_func_start sub_020AB22C
sub_020AB22C: ; 0x020AB22C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020AA6E0
	cmp r0, #7
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl sub_020AA6E0
	cmp r0, #6
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020AB22C

	arm_func_start sub_020AB25C
sub_020AB25C: ; 0x020AB25C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020AA6E0
	cmp r0, #1
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl sub_020AAA20
	cmp r0, #0
	beq _020AB2AC
	ldr r0, [r4, #0xc]
	bl sub_020A9AD8
	mov r0, r4
	bl sub_020AAC80
	mov r0, r4
	bl sub_020AB22C
	cmp r0, #0
	beq _020AB2DC
	mov r0, #1
	ldmia sp!, {r4, pc}
_020AB2AC:
	mov r0, r4
	bl sub_020AA6E0
	cmp r0, #5
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl sub_020AB22C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl sub_020AAC80
_020AB2DC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020AB25C

	arm_func_start sub_020AB2E4
sub_020AB2E4: ; 0x020AB2E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r6, [r7, #0xc]
	mov r5, #0
	mov r4, #1
_020AB2F8:
	mov r0, r7
	bl sub_020A699C
	strb r5, [r6, #0x455]
	str r5, [r6, #0x1d4]
	add r0, r6, #0x2ec
	strb r4, [r6, #0x454]
	bl sub_020AC780
	add r0, r6, #0x3a4
	bl sub_020ABEC0
	mov r0, r7
	bl sub_020AB25C
	cmp r0, #0
	moveq r0, #8
	streqb r0, [r6, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	bl sub_020A6B74
	ldrh r0, [r7, #0x1a]
	strh r0, [r7, #0x18]
	ldr r0, [r7, #0x20]
	str r0, [r7, #0x1c]
	b _020AB2F8
	arm_func_end sub_020AB2E4

	arm_func_start sub_020AB350
sub_020AB350: ; 0x020AB350
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020AB350

	arm_func_start sub_020AB354
sub_020AB354: ; 0x020AB354
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	bl sub_020AADD8
_020AB364:
	mov r0, r5
	bl sub_020AA6E0
	cmp r0, #9
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #4
	beq _020AB38C
	ldrb r0, [r4, #0x31]
	cmp r0, #0
	beq _020AB364
_020AB38C:
	ldrb r0, [r4, #0x31]
	cmp r0, #0
	beq _020AB3C0
	mov r0, r4
	bl sub_020A9AD8
	mov r0, r5
	bl sub_020AB22C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl sub_020AAC80
	b _020AB410
_020AB3C0:
	mov r0, r5
	bl sub_020AAF6C
	mov r0, r4
	bl sub_020A9A78
	ldrb r0, [r4, #0x30]
	cmp r0, #0
	beq _020AB3EC
	ldrh r2, [r5, #0x18]
	ldr r1, [r5, #0x1c]
	mov r0, r4
	bl sub_020A86CC
_020AB3EC:
	mov r0, r4
	bl sub_020A9AD8
	mov r0, r5
	bl sub_020AAC80
	mov r0, r5
	bl sub_020AB22C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_020AB410:
	mov r0, #8
	strb r0, [r4, #0x455]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020AB354

	arm_func_start sub_020AB420
sub_020AB420: ; 0x020AB420
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r1, [r5, #8]
	ldr r4, [r5, #0xc]
	cmp r1, #4
	beq _020AB448
	bl sub_020A6A30
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_020AB448:
	mov r1, #0
	strb r1, [r4, #0x455]
	str r1, [r4, #0x1d4]
	add r0, r4, #0x2ec
	strb r1, [r4, #0x454]
	bl sub_020AC780
	add r0, r4, #0x3a4
	bl sub_020ABEC0
	mov r0, r5
	bl sub_020AB354
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020AB420

	arm_func_start sub_020AB474
sub_020AB474: ; 0x020AB474
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [r5, #0xc]
	mov r6, r0
	ldr ip, [r4, #0x824]
	cmp ip, #0
	beq _020AB4F8
	ldrb r0, [r4, #0x456]
	cmp r0, #0
	bne _020AB4F8
	ldr r3, [r4, #0x82c]
	ldr r1, [r4, #0x828]
	mov r2, r5
	add r0, ip, r3
	sub r1, r1, r3
	bl sub_020AA3C8
	cmp r0, #0
	beq _020AB4DC
	ldr r1, _020AB548 ; =0x021D4660
	ldr r0, [r4, #0x824]
	ldr r1, [r1]
	blx r1
	mov r0, #0
	str r0, [r4, #0x824]
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
_020AB4DC:
	ldr r1, [r4, #0x824]
	mov r0, r4
	bl sub_020AA460
	ldrb r0, [r4, #0x456]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r4, #0x824]
_020AB4F8:
	ldr r0, [r4, #0x824]
	cmp r0, #0
	bne _020AB528
_020AB504:
	mov r0, r5
	bl sub_020AA6E0
	cmp r0, #9
	moveq r0, #0
	streq r0, [r6]
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r4, #0x824]
	cmp r0, #0
	beq _020AB504
_020AB528:
	ldr r1, [r4, #0x828]
	ldr r0, [r4, #0x82c]
	sub r0, r1, r0
	str r0, [r6]
	ldr r1, [r4, #0x824]
	ldr r0, [r4, #0x82c]
	add r0, r1, r0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020AB548: .word 0x021D4660
	arm_func_end sub_020AB474

	arm_func_start sub_020AB54C
sub_020AB54C: ; 0x020AB54C
	stmdb sp!, {r4, lr}
	ldr r4, [r1, #0xc]
	ldr r2, [r4, #0x828]
	ldr r1, [r4, #0x82c]
	sub r2, r2, r1
	cmp r0, r2
	blo _020AB58C
	ldr r0, [r4, #0x824]
	cmp r0, #0
	beq _020AB580
	ldr r1, _020AB598 ; =0x021D4660
	ldr r1, [r1]
	blx r1
_020AB580:
	mov r0, #0
	str r0, [r4, #0x824]
	ldmia sp!, {r4, pc}
_020AB58C:
	add r0, r1, r0
	str r0, [r4, #0x82c]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AB598: .word 0x021D4660
	arm_func_end sub_020AB54C

	arm_func_start sub_020AB59C
sub_020AB59C: ; 0x020AB59C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0x824]
	cmp r0, #0
	ldr r0, [r5, #0x44]
	bne _020AB63C
	cmp r0, #5
	addlo sp, sp, #4
	ldmloia sp!, {r3, r4, r5, r6, pc}
	add r0, sp, #0
	mov r1, r5
	bl sub_020A6CDC
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #4]
	ldr r1, _020AB6D8 ; =0x00004805
	add r0, r0, r2, lsl #8
	add r0, r0, #5
	str r0, [sp]
	cmp r0, r1
	movhi r0, #9
	addhi sp, sp, #4
	strhib r0, [r4, #0x455]
	ldmhiia sp!, {r3, r4, r5, r6, pc}
	ldr r1, _020AB6DC ; =0x021D4634
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	str r0, [r4, #0x824]
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [sp]
	mov r0, #0
	str r1, [r4, #0x828]
	str r0, [r4, #0x82c]
	strb r0, [r4, #0x456]
	b _020AB648
_020AB63C:
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, pc}
_020AB648:
	add r0, sp, #0
	mov r1, r5
	bl sub_020A6CDC
	ldr r3, [r4, #0x828]
	ldr r2, [r4, #0x82c]
	ldr r1, [sp]
	sub r2, r3, r2
	cmp r1, r2
	strhs r2, [sp]
	movhs r6, #1
	ldr r3, [r4, #0x824]
	ldr r1, [r4, #0x82c]
	ldr r2, [sp]
	add r1, r3, r1
	movlo r6, #0
	bl sub_020D4A50
	ldr r0, [sp]
	mov r1, r5
	bl sub_020A6DBC
	cmp r6, #0
	beq _020AB6C0
	ldr r1, [r4, #0x824]
	mov r0, r4
	bl sub_020AA460
	ldrb r0, [r4, #0x456]
	add sp, sp, #4
	cmp r0, #0
	moveq r0, #0
	streq r0, [r4, #0x824]
	ldmia sp!, {r3, r4, r5, r6, pc}
_020AB6C0:
	ldr r1, [r4, #0x82c]
	ldr r0, [sp]
	add r0, r1, r0
	str r0, [r4, #0x82c]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020AB6D8: .word 0x00004805
_020AB6DC: .word 0x021D4634
	arm_func_end sub_020AB59C

	arm_func_start sub_020AB6E0
sub_020AB6E0: ; 0x020AB6E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0x824]
	cmp r0, #0
	ldrneb r0, [r4, #0x456]
	cmpne r0, #0
	bne _020AB708
	mov r0, r5
	bl sub_020AB59C
_020AB708:
	ldr r1, [r4, #0x824]
	cmp r1, #0
	ldrneb r0, [r4, #0x456]
	cmpne r0, #0
	beq _020AB72C
	ldr r1, [r4, #0x828]
	ldr r0, [r4, #0x82c]
	sub r0, r1, r0
	ldmia sp!, {r3, r4, r5, pc}
_020AB72C:
	cmp r1, #0
	bne _020AB754
	ldrb r0, [r5, #8]
	cmp r0, #4
	bne _020AB74C
	ldrb r0, [r4, #0x455]
	cmp r0, #9
	bne _020AB754
_020AB74C:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AB754:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020AB6E0

	arm_func_start sub_020AB75C
sub_020AB75C: ; 0x020AB75C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, [sp, #0x30]
	mov sb, r1
	mov r1, r4
	ldr r1, [r1, #0xc]
	mov sl, r0
	mov r0, #0
	str r4, [sp, #0x30]
	str r1, [sp, #8]
	mov r8, r2
	add r5, sb, r3
	str r0, [sp, #4]
_020AB790:
	ldr r0, _020AB884 ; =0x00000B4F
	ldr r1, _020AB888 ; =0x021D4634
	cmp r5, r0
	movgt r6, r0
	movle r6, r5
	ldr r1, [r1]
	add r0, r6, #0x19
	blx r1
	movs r4, r0
	beq _020AB878
	cmp sb, r6
	movhs r7, r6
	movlo r7, sb
	mov r0, sl
	add r1, r4, #5
	mov r2, r7
	sub fp, r6, r7
	bl sub_020D4A50
	add r1, r4, #5
	mov r0, r8
	add r1, r1, r7
	mov r2, fp
	add sl, sl, r7
	sub sb, sb, r7
	bl sub_020D4A50
	mov r0, #0x17
	strb r0, [r4]
	mov r0, #3
	strb r0, [r4, #1]
	mov r0, #0
	strb r0, [r4, #2]
	mov r0, r6, asr #8
	strb r0, [r4, #3]
	ldr r0, [sp, #8]
	mov r1, r4
	add r8, r8, fp
	strb r6, [r4, #4]
	bl sub_020AA1C4
	ldr r1, [sp, #0x30]
	mov r7, r0
	mov r2, #0
	str r1, [sp]
	mov r0, r4
	mov r1, r7
	mov r3, r2
	bl sub_020A6F84
	cmp r0, r7
	ldr r1, _020AB88C ; =0x021D4660
	mov r0, r4
	ldr r1, [r1]
	movlo r6, #0
	blx r1
	ldr r0, [sp, #4]
	subs r5, r5, r6
	add r0, r0, r6
	str r0, [sp, #4]
	cmpne r6, #0
	bne _020AB790
_020AB878:
	ldr r0, [sp, #4]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AB884: .word 0x00000B4F
_020AB888: .word 0x021D4634
_020AB88C: .word 0x021D4660
	arm_func_end sub_020AB75C

	arm_func_start sub_020AB890
sub_020AB890: ; 0x020AB890
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x20
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldrb r0, [r4, #0x455]
	cmp r0, #8
	bne _020AB900
	mov ip, #0
	mov r6, #0x15
	mov lr, #3
	mov r3, #2
	mov r2, #1
	add r1, sp, #4
	mov r0, r4
	strb r6, [sp, #4]
	strb lr, [sp, #5]
	strb ip, [sp, #6]
	strb ip, [sp, #7]
	strb r3, [sp, #8]
	strb r2, [sp, #9]
	strb ip, [sp, #0xa]
	bl sub_020AA1C4
	mov r2, #0
	mov r1, r0
	add r0, sp, #4
	mov r3, r2
	str r5, [sp]
	bl sub_020A6F84
_020AB900:
	mov r0, #0
	strb r0, [r4, #0x455]
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020AB890

	arm_func_start sub_020AB910
sub_020AB910: ; 0x020AB910
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #0xc]
	mov r0, #0
	strb r0, [r4, #0x455]
	ldr r0, [r4, #0x824]
	cmp r0, #0
	beq _020AB938
	ldr r1, _020AB944 ; =0x021D4660
	ldr r1, [r1]
	blx r1
_020AB938:
	mov r0, #0
	str r0, [r4, #0x824]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AB944: .word 0x021D4660
	arm_func_end sub_020AB910

	arm_func_start sub_020AB948
sub_020AB948: ; 0x020AB948
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _020AB970 ; =_version_UBIQUITOUS_SSL
	bl OSi_ReferSymbol
	ldr r0, _020AB974 ; =0x021E16A0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xa4]
	cmp r0, #0
	strneb r4, [r0, #9]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AB970: .word _version_UBIQUITOUS_SSL
_020AB974: .word 0x021E16A0
	arm_func_end sub_020AB948

	arm_func_start sub_020AB978
sub_020AB978: ; 0x020AB978
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl sub_020D3A38
	mov r4, #0
	ldr r6, _020ABA4C ; =0x021D5E68
	ldr r1, _020ABA50 ; =0x000003BD
	mov r2, r4
_020AB994:
	ldrb r3, [r6, #0x5a]
	cmp r3, #0
	beq _020AB9B0
	ldr r3, [r6, #0x50]
	sub r3, r5, r3
	cmp r3, r1
	strgtb r2, [r6, #0x5a]
_020AB9B0:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #0x5c
	blt _020AB994
	bl sub_020D3A4C
	ldr r0, _020ABA54 ; =0x021E16A0
	ldr r4, [r0, #8]
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r6, #0
_020AB9D8:
	ldr r1, [r4, #0xa4]
	cmp r1, #0
	ldrne r0, [r1]
	cmpne r0, #0
	ldrneb r0, [r1, #9]
	cmpne r0, #0
	beq _020ABA3C
	ldrb r0, [r1, #8]
	cmp r0, #4
	bne _020ABA3C
	ldr r0, [r1, #0xc]
	ldrb r0, [r0, #0x455]
	cmp r0, #8
	bhs _020ABA3C
	ldr r0, [r1, #0x10]
	sub r0, r5, r0
	cmp r0, #0xef
	ble _020ABA3C
	ldr r0, [r1, #4]
	cmp r0, #2
	bne _020ABA3C
	strb r6, [r1, #8]
	str r6, [r1, #4]
	ldr r0, [r1]
	bl sub_020D1F34
_020ABA3C:
	ldr r4, [r4, #0x68]
	cmp r4, #0
	bne _020AB9D8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020ABA4C: .word 0x021D5E68
_020ABA50: .word 0x000003BD
_020ABA54: .word 0x021E16A0
	arm_func_end sub_020AB978

	arm_func_start sub_020ABA58
sub_020ABA58: ; 0x020ABA58
	ldr ip, _020ABA6C ; =sub_020D4994
	ldr r0, _020ABA70 ; =0x021D5E68
	mov r1, #0
	mov r2, #0x170
	bx ip
	.align 2, 0
_020ABA6C: .word sub_020D4994
_020ABA70: .word 0x021D5E68
	arm_func_end sub_020ABA58

	arm_func_start sub_020ABA74
sub_020ABA74: ; 0x020ABA74
	ldr ip, _020ABA88 ; =sub_020D4A50
	mov r3, r0
	mov r0, r1
	mov r1, r3
	bx ip
	.align 2, 0
_020ABA88: .word sub_020D4A50
	arm_func_end sub_020ABA74

	arm_func_start sub_020ABA8C
sub_020ABA8C: ; 0x020ABA8C
	ldr ip, _020ABAA0 ; =sub_020D4A50
	mov r3, r0
	mov r0, r1
	mov r1, r3
	bx ip
	.align 2, 0
_020ABAA0: .word sub_020D4A50
	arm_func_end sub_020ABA8C

	arm_func_start sub_020ABAA4
sub_020ABAA4: ; 0x020ABAA4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	str r0, [sp]
	ldr r3, [sp]
	add r0, sp, #4
	mov r2, #0x40
	ldmia r3, {r4, r5, r6, r7}
	bl sub_020ABA8C
	mov r3, #0
	ldr lr, _020ABEB8 ; =_02110718
	mov ip, r3
	add r2, sp, #4
_020ABAD4:
	ldr r1, _020ABEBC ; =_02110798
	ldrb r0, [lr]
	add sb, r1, r3, lsl #2
	eor r1, r6, r7
	and r8, r5, r1
	ldr r1, _020ABEBC ; =_02110798
	ldr r0, [r2, r0, lsl #2]
	ldr sl, [r1, r3, lsl #2]
	eor r1, r7, r8
	add r0, r1, r0
	add r0, sl, r0
	add r1, r4, r0
	mov r0, r1, lsr #0x19
	orr r0, r0, r1, lsl #7
	ldrb r1, [lr, #1]
	add r4, r5, r0
	eor r0, r5, r6
	and r0, r4, r0
	ldr sl, [r2, r1, lsl #2]
	eor r0, r6, r0
	add r0, r0, sl
	ldr r8, [sb, #4]
	ldrb sl, [lr, #2]
	add r0, r8, r0
	add r7, r7, r0
	mov r0, r7, lsr #0x14
	orr r0, r0, r7, lsl #12
	add r7, r4, r0
	eor r0, r4, r5
	and r0, r7, r0
	ldr r1, [sb, #8]
	ldrb fp, [lr, #3]
	ldr sl, [r2, sl, lsl #2]
	eor r0, r5, r0
	add r0, r0, sl
	add r0, r1, r0
	add r6, r6, r0
	mov r1, r6, lsr #0xf
	orr r1, r1, r6, lsl #17
	add ip, ip, #1
	eor r8, r7, r4
	add r6, r7, r1
	and r1, r6, r8
	ldr r0, [r2, fp, lsl #2]
	eor r1, r4, r1
	ldr sb, [sb, #0xc]
	add r0, r1, r0
	add r0, sb, r0
	add r1, r5, r0
	mov r0, r1, lsr #0xa
	orr r0, r0, r1, lsl #22
	add lr, lr, #4
	add r5, r6, r0
	add r3, r3, #4
	cmp ip, #4
	blt _020ABAD4
	ldr r0, _020ABEB8 ; =_02110718
	ldr lr, _020ABEBC ; =_02110798
	mov fp, #0
	add sl, r0, r3
	add sb, sp, #4
_020ABBC8:
	ldrb r0, [sl]
	add ip, lr, r3, lsl #2
	eor r1, r5, r6
	and r1, r7, r1
	ldr r8, [lr, r3, lsl #2]
	eor r1, r6, r1
	ldr r0, [sb, r0, lsl #2]
	ldr r2, [ip, #4]
	add r0, r1, r0
	add r0, r8, r0
	add r1, r4, r0
	mov r0, r1, lsr #0x1b
	orr r1, r0, r1, lsl #5
	ldrb r0, [sl, #1]
	add r4, r5, r1
	eor r1, r4, r5
	and r1, r6, r1
	eor r1, r5, r1
	ldr r0, [sb, r0, lsl #2]
	ldr r8, [ip, #8]
	add r0, r1, r0
	add r0, r2, r0
	add r2, r7, r0
	ldr r0, [ip, #0xc]
	mov r1, r2, lsr #0x17
	orr r1, r1, r2, lsl #9
	add r7, r4, r1
	eor r1, r7, r4
	and r1, r5, r1
	eor r2, r4, r1
	ldrb r1, [sl, #2]
	ldrb ip, [sl, #3]
	add sl, sl, #4
	ldr r1, [sb, r1, lsl #2]
	ldr ip, [sb, ip, lsl #2]
	add r1, r2, r1
	add r1, r8, r1
	add r2, r6, r1
	mov r1, r2, lsr #0x12
	orr r1, r1, r2, lsl #14
	add r6, r7, r1
	eor r1, r6, r7
	and r1, r4, r1
	eor r1, r7, r1
	add r1, r1, ip
	add r0, r0, r1
	add r1, r5, r0
	mov r0, r1, lsr #0xc
	orr r0, r0, r1, lsl #20
	add r5, r6, r0
	add r3, r3, #4
	add fp, fp, #1
	cmp fp, #4
	blt _020ABBC8
	ldr r0, _020ABEB8 ; =_02110718
	ldr r1, _020ABEBC ; =_02110798
	add r2, r0, r3
	mov r8, #0
	add r0, sp, #4
_020ABCB4:
	ldrb sb, [r2]
	add fp, r1, r3, lsl #2
	eor ip, r5, r6
	ldr sl, [r0, sb, lsl #2]
	eor ip, r7, ip
	ldr sb, [r1, r3, lsl #2]
	add sl, ip, sl
	add sb, sb, sl
	add sb, r4, sb
	mov r4, sb, lsr #0x1c
	ldrb sl, [r2, #1]
	orr r4, r4, sb, lsl #4
	add r4, r5, r4
	eor sb, r4, r5
	eor sb, r6, sb
	ldr ip, [r0, sl, lsl #2]
	ldr sl, [fp, #4]
	add sb, sb, ip
	add sb, sl, sb
	add sb, r7, sb
	mov r7, sb, lsr #0x15
	orr r7, r7, sb, lsl #11
	ldrb sb, [r2, #2]
	add r7, r4, r7
	ldr sl, [fp, #8]
	ldr ip, [r0, sb, lsl #2]
	ldr sb, [fp, #0xc]
	eor fp, r7, r4
	eor fp, r5, fp
	add fp, fp, ip
	add sl, sl, fp
	add sl, r6, sl
	mov r6, sl, lsr #0x10
	orr r6, r6, sl, lsl #16
	add r6, r7, r6
	eor sl, r6, r7
	eor fp, r4, sl
	ldrb sl, [r2, #3]
	add r2, r2, #4
	add r3, r3, #4
	ldr sl, [r0, sl, lsl #2]
	add r8, r8, #1
	add sl, fp, sl
	add sb, sb, sl
	add sb, r5, sb
	cmp r8, #4
	mov r5, sb, lsr #9
	orr r5, r5, sb, lsl #23
	add r5, r6, r5
	blt _020ABCB4
	ldr r0, _020ABEB8 ; =_02110718
	mov sb, #0
	add r8, r0, r3
	add r2, sp, #4
_020ABD8C:
	ldr r1, _020ABEBC ; =_02110798
	ldrb r0, [r8]
	add fp, r1, r3, lsl #2
	mvn r1, r7
	orr sl, r5, r1
	ldr r1, _020ABEBC ; =_02110798
	ldr r0, [r2, r0, lsl #2]
	ldr ip, [r1, r3, lsl #2]
	eor r1, r6, sl
	add r0, r1, r0
	add r0, ip, r0
	add r1, r4, r0
	mov r0, r1, lsr #0x1a
	orr r0, r0, r1, lsl #6
	ldrb r1, [r8, #1]
	add r4, r5, r0
	mvn r0, r6
	orr r0, r4, r0
	ldr ip, [r2, r1, lsl #2]
	eor r0, r5, r0
	add r0, r0, ip
	ldr sl, [fp, #4]
	ldrb ip, [r8, #2]
	add r0, sl, r0
	add r7, r7, r0
	mov r0, r7, lsr #0x16
	orr r0, r0, r7, lsl #10
	add r7, r4, r0
	mvn r0, r5
	orr r0, r7, r0
	ldr r1, [fp, #8]
	ldrb lr, [r8, #3]
	ldr ip, [r2, ip, lsl #2]
	eor r0, r4, r0
	add r0, r0, ip
	add r0, r1, r0
	add r6, r6, r0
	mov r1, r6, lsr #0x11
	orr r1, r1, r6, lsl #15
	add sb, sb, #1
	mvn sl, r4
	add r6, r7, r1
	orr r1, r6, sl
	ldr r0, [r2, lr, lsl #2]
	eor r1, r7, r1
	ldr fp, [fp, #0xc]
	add r0, r1, r0
	add r0, fp, r0
	add r1, r5, r0
	mov r0, r1, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r8, r8, #4
	add r5, r6, r0
	add r3, r3, #4
	cmp sb, #4
	blt _020ABD8C
	ldr r0, [sp]
	ldr r0, [r0]
	add r1, r0, r4
	ldr r0, [sp]
	str r1, [r0]
	ldr r0, [r0, #4]
	add r1, r0, r5
	ldr r0, [sp]
	str r1, [r0, #4]
	ldr r0, [r0, #8]
	add r1, r0, r6
	ldr r0, [sp]
	str r1, [r0, #8]
	ldr r0, [r0, #0xc]
	add r1, r0, r7
	ldr r0, [sp]
	str r1, [r0, #0xc]
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020ABEB8: .word _02110718
_020ABEBC: .word _02110798
	arm_func_end sub_020ABAA4

	arm_func_start sub_020ABEC0
sub_020ABEC0: ; 0x020ABEC0
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r2, #0x58
	mov r4, r0
	bl sub_020D4994
	ldr r1, _020ABEF8 ; =0x67452301
	ldr r0, _020ABEFC ; =0xEFCDAB89
	str r1, [r4]
	ldr r1, _020ABF00 ; =0x98BADCFE
	str r0, [r4, #4]
	ldr r0, _020ABF04 ; =0x10325476
	str r1, [r4, #8]
	str r0, [r4, #0xc]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020ABEF8: .word 0x67452301
_020ABEFC: .word 0xEFCDAB89
_020ABF00: .word 0x98BADCFE
_020ABF04: .word 0x10325476
	arm_func_end sub_020ABEC0

	arm_func_start sub_020ABF08
sub_020ABF08: ; 0x020ABF08
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r3, [r8, #0x10]
	mov r6, r2
	add r0, r3, r6, lsl #3
	str r0, [r8, #0x10]
	cmp r0, r6, lsl #3
	ldrlo r0, [r8, #0x14]
	mov r2, r3, lsr #3
	addlo r0, r0, #1
	strlo r0, [r8, #0x14]
	ldr r0, [r8, #0x14]
	and r4, r2, #0x3f
	rsb r5, r4, #0x40
	add r0, r0, r6, lsr #29
	mov r7, r1
	str r0, [r8, #0x14]
	cmp r6, r5
	blo _020ABFA4
	add r1, r8, #0x18
	mov r0, r7
	mov r2, r5
	add r1, r1, r4
	bl sub_020D4A50
	mov r0, r8
	add r1, r8, #0x18
	mov r4, #0
	bl sub_020ABAA4
	add r0, r5, #0x3f
	cmp r0, r6
	bhs _020ABFA8
_020ABF84:
	mov r0, r8
	add r1, r7, r5
	bl sub_020ABAA4
	add r5, r5, #0x40
	add r0, r5, #0x3f
	cmp r0, r6
	blo _020ABF84
	b _020ABFA8
_020ABFA4:
	mov r5, #0
_020ABFA8:
	add r1, r8, #0x18
	add r0, r7, r5
	add r1, r1, r4
	sub r2, r6, r5
	bl sub_020D4A50
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020ABF08

	arm_func_start sub_020ABFC0
sub_020ABFC0: ; 0x020ABFC0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	add r1, r5, #0x10
	mov r2, #8
	bl sub_020ABA74
	ldr r0, [r5, #0x10]
	ldr r1, _020AC024 ; =_02110758
	mov r0, r0, lsr #3
	and r0, r0, #0x3f
	cmp r0, #0x38
	rsblt r2, r0, #0x38
	rsbge r2, r0, #0x78
	mov r0, r5
	bl sub_020ABF08
	mov r0, r5
	mov r1, r4
	mov r2, #8
	bl sub_020ABF08
	mov r0, r4
	mov r1, r5
	mov r2, #0x10
	bl sub_020ABA74
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AC024: .word _02110758
	arm_func_end sub_020ABFC0

	arm_func_start sub_020AC028
sub_020AC028: ; 0x020AC028
	add r2, r0, #0xd
	add ip, r0, #2
	and r3, r2, #0xf
	eor r2, r0, #8
	and ip, ip, #0xf
	ldr r3, [r1, r3, lsl #2]
	ldr r2, [r1, r2, lsl #2]
	ldr ip, [r1, ip, lsl #2]
	eor r2, r3, r2
	ldr r3, [r1, r0, lsl #2]
	eor r2, ip, r2
	eor r3, r3, r2
	mov r2, r3, lsr #0x1f
	orr r2, r2, r3, lsl #1
	str r2, [r1, r0, lsl #2]
	mov r0, r2
	bx lr
	arm_func_end sub_020AC028

	arm_func_start sub_020AC06C
sub_020AC06C: ; 0x020AC06C
	stmdb sp!, {r3, lr}
	movs r2, r2, lsr #2
	mov lr, #0
	ldmeqia sp!, {r3, pc}
_020AC07C:
	ldr ip, [r1], #4
	add lr, lr, #1
	mov r3, ip, lsr #0x18
	strb r3, [r0]
	mov r3, ip, lsr #0x10
	strb r3, [r0, #1]
	mov r3, ip, lsr #8
	strb r3, [r0, #2]
	strb ip, [r0, #3]
	cmp lr, r2
	add r0, r0, #4
	blo _020AC07C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020AC06C

	arm_func_start sub_020AC0B0
sub_020AC0B0: ; 0x020AC0B0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	cmp r2, #0
	ldmlsia sp!, {r3, r4, r5, pc}
_020AC0C0:
	add r4, r1, r5
	ldrb r3, [r4, #1]
	ldrb ip, [r1, r5]
	ldrb lr, [r4, #2]
	mov r3, r3, lsl #0x10
	orr r3, r3, ip, lsl #24
	ldrb ip, [r4, #3]
	orr r3, r3, lr, lsl #8
	add r5, r5, #4
	orr r3, ip, r3
	cmp r5, r2
	str r3, [r0], #4
	blo _020AC0C0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020AC0B0

	arm_func_start sub_020AC0F8
sub_020AC0F8: ; 0x020AC0F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x50
	str r0, [sp]
	ldr r3, [sp]
	add r0, sp, #0x10
	ldmia r3, {r4, r5, r7, r8, sb}
	mov r2, #0x40
	bl sub_020AC0B0
	mov r0, #0
	ldr r3, _020AC770 ; =0x5A827999
	mov r2, r0
	add r1, sp, #0x10
_020AC128:
	eor r6, r7, r8
	mov sl, r4, lsr #0x1b
	and r6, r5, r6
	orr fp, sl, r4, lsl #5
	eor r6, r8, r6
	mov sl, r5, lsr #2
	orr sl, sl, r5, lsl #30
	add r5, r1, r0, lsl #2
	add r6, fp, r6
	ldr ip, [r1, r0, lsl #2]
	ldr fp, [r5, #4]
	add r6, ip, r6
	add r6, r6, r3
	add sb, sb, r6
	mov r6, sb, lsr #0x1b
	orr r6, r6, sb, lsl #5
	eor ip, sl, r7
	and ip, r4, ip
	eor ip, r7, ip
	add r6, r6, ip
	add r6, fp, r6
	add r6, r6, r3
	add r8, r8, r6
	mov r6, r4, lsr #2
	orr r4, r6, r4, lsl #30
	ldr fp, [r5, #8]
	mov r6, r8, lsr #0x1b
	orr r6, r6, r8, lsl #5
	eor ip, r4, sl
	and ip, sb, ip
	eor ip, sl, ip
	add r6, r6, ip
	add r6, fp, r6
	add r6, r6, r3
	add r6, r7, r6
	mov r7, sb, lsr #2
	orr sb, r7, sb, lsl #30
	ldr r7, [r5, #0xc]
	ldr fp, [r5, #0x10]
	mov r5, r6, lsr #0x1b
	orr r5, r5, r6, lsl #5
	eor ip, sb, r4
	and ip, r8, ip
	eor ip, r4, ip
	add r5, r5, ip
	add r5, r7, r5
	add r5, r5, r3
	add r5, sl, r5
	mov r7, r8, lsr #2
	orr r8, r7, r8, lsl #30
	mov r7, r5, lsr #0x1b
	orr r7, r7, r5, lsl #5
	eor sl, r8, sb
	and sl, r6, sl
	eor sl, sb, sl
	add r7, r7, sl
	add r7, fp, r7
	add r7, r7, r3
	add r4, r4, r7
	mov r7, r6, lsr #2
	orr r7, r7, r6, lsl #30
	add r0, r0, #5
	add r2, r2, #1
	cmp r2, #3
	blt _020AC128
	eor r0, r7, r8
	mov r2, r4, lsr #0x1b
	and r0, r5, r0
	orr r3, r2, r4, lsl #5
	eor r0, r8, r0
	add r3, r3, r0
	ldr r6, [sp, #0x4c]
	ldr r0, _020AC770 ; =0x5A827999
	add r3, r6, r3
	add r3, r3, r0
	mov r2, r5, lsr #2
	orr r6, r2, r5, lsl #30
	mov r0, #0
	add sb, sb, r3
	bl sub_020AC028
	eor r1, r6, r7
	mov r3, sb, lsr #0x1b
	and r1, r4, r1
	mov r2, r4, lsr #2
	orr r3, r3, sb, lsl #5
	eor r1, r7, r1
	add r1, r3, r1
	add r3, r1, r0
	ldr r0, _020AC770 ; =0x5A827999
	add r1, sp, #0x10
	add r3, r3, r0
	orr r5, r2, r4, lsl #30
	mov r0, #1
	add r8, r8, r3
	bl sub_020AC028
	eor r1, r5, r6
	mov r2, r8, lsr #0x1b
	and r1, sb, r1
	orr r2, r2, r8, lsl #5
	eor r1, r6, r1
	add r1, r2, r1
	add r2, r1, r0
	ldr r0, _020AC770 ; =0x5A827999
	mov r1, sb, lsr #2
	add r0, r2, r0
	orr sb, r1, sb, lsl #30
	add r7, r7, r0
	add r1, sp, #0x10
	mov r0, #2
	bl sub_020AC028
	mov r1, r7, lsr #0x1b
	orr r2, r1, r7, lsl #5
	eor r1, sb, r5
	and r1, r8, r1
	eor r1, r5, r1
	add r1, r2, r1
	add r2, r1, r0
	ldr r0, _020AC770 ; =0x5A827999
	mov r1, r8, lsr #2
	add r0, r2, r0
	orr r8, r1, r8, lsl #30
	add r6, r6, r0
	mov r0, #3
	add r1, sp, #0x10
	bl sub_020AC028
	mov r1, r6, lsr #0x1b
	orr r2, r1, r6, lsl #5
	eor r1, r8, sb
	and r1, r7, r1
	eor r1, sb, r1
	add r1, r2, r1
	add r2, r1, r0
	ldr r0, _020AC770 ; =0x5A827999
	mov r1, r7, lsr #2
	add r0, r2, r0
	add r5, r5, r0
	mov r0, #0
	ldr r4, _020AC774 ; =0x6ED9EBA1
	orr r7, r1, r7, lsl #30
	mov sl, #4
	str r0, [sp, #4]
	add fp, sp, #0x10
_020AC360:
	mov r0, sl
	mov r1, fp
	bl sub_020AC028
	mov r2, r5, lsr #0x1b
	eor r1, r6, r7
	orr r2, r2, r5, lsl #5
	eor r1, r8, r1
	add r1, r2, r1
	add r0, r1, r0
	add r1, r0, r4
	mov r0, r6, lsr #2
	add sb, sb, r1
	orr r6, r0, r6, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl sub_020AC028
	mov r1, sb, lsr #0x1b
	orr r2, r1, sb, lsl #5
	eor r1, r5, r6
	eor r1, r7, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r8, r8, r0
	mov r0, r5, lsr #2
	orr r5, r0, r5, lsl #30
	add r0, sl, #2
	and sl, r0, #0xf
	mov r0, sl
	mov r1, fp
	bl sub_020AC028
	mov r1, r8, lsr #0x1b
	orr r2, r1, r8, lsl #5
	eor r1, sb, r5
	eor r1, r6, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r7, r7, r0
	mov r0, sb, lsr #2
	orr sb, r0, sb, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl sub_020AC028
	mov r1, r7, lsr #0x1b
	orr r2, r1, r7, lsl #5
	eor r1, r8, sb
	eor r1, r5, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r6, r6, r0
	mov r0, r8, lsr #2
	orr r8, r0, r8, lsl #30
	add r0, sl, #2
	mov r1, fp
	bl sub_020AC028
	mov r1, r6, lsr #0x1b
	orr r2, r1, r6, lsl #5
	eor r1, r7, r8
	eor r1, sb, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r5, r5, r0
	mov r1, r7, lsr #2
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #4
	orr r7, r1, r7, lsl #30
	add sl, sl, #3
	blt _020AC360
	mov r0, #0
	ldr r4, _020AC778 ; =0x8F1BBCDC
	str r0, [sp, #8]
	add fp, sp, #0x10
_020AC494:
	mov r0, sl
	mov r1, fp
	bl sub_020AC028
	orr r2, r7, r8
	mov r1, r5, lsr #0x1b
	orr r1, r1, r5, lsl #5
	and r3, r6, r2
	and r2, r7, r8
	orr r2, r3, r2
	add r1, r1, r2
	add r1, r1, r0
	mov r0, r6, lsr #2
	add r1, r1, r4
	add sb, sb, r1
	orr r6, r0, r6, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl sub_020AC028
	mov r1, sb, lsr #0x1b
	orr r1, r1, sb, lsl #5
	orr r2, r6, r7
	and r3, r5, r2
	and r2, r6, r7
	orr r2, r3, r2
	add r1, r1, r2
	add r0, r1, r0
	add r0, r0, r4
	add r8, r8, r0
	mov r0, r5, lsr #2
	orr r5, r0, r5, lsl #30
	add r0, sl, #2
	mov r1, fp
	bl sub_020AC028
	mov r1, r8, lsr #0x1b
	orr r1, r1, r8, lsl #5
	orr r2, r5, r6
	and r3, sb, r2
	and r2, r5, r6
	orr r2, r3, r2
	add r1, r1, r2
	add r0, r1, r0
	add r0, r0, r4
	add r7, r7, r0
	mov r0, sb, lsr #2
	orr sb, r0, sb, lsl #30
	add r0, sl, #3
	and sl, r0, #0xf
	mov r0, sl
	mov r1, fp
	bl sub_020AC028
	mov r1, r7, lsr #0x1b
	orr r1, r1, r7, lsl #5
	orr r2, sb, r5
	and r3, r8, r2
	and r2, sb, r5
	orr r2, r3, r2
	add r1, r1, r2
	add r0, r1, r0
	add r0, r0, r4
	add r6, r6, r0
	mov r0, r8, lsr #2
	orr r8, r0, r8, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl sub_020AC028
	mov r1, r6, lsr #0x1b
	orr r1, r1, r6, lsl #5
	orr r2, r8, sb
	and r3, r7, r2
	and r2, r8, sb
	orr r2, r3, r2
	add r1, r1, r2
	add r0, r1, r0
	add r0, r0, r4
	add r5, r5, r0
	mov r1, r7, lsr #2
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #4
	orr r7, r1, r7, lsl #30
	add sl, sl, #2
	blt _020AC494
	mov r0, #0
	ldr r4, _020AC77C ; =0xCA62C1D6
	str r0, [sp, #0xc]
	add fp, sp, #0x10
_020AC5F0:
	mov r0, sl
	mov r1, fp
	bl sub_020AC028
	mov r2, r5, lsr #0x1b
	eor r1, r6, r7
	orr r2, r2, r5, lsl #5
	eor r1, r8, r1
	add r1, r2, r1
	add r0, r1, r0
	add r1, r0, r4
	mov r0, r6, lsr #2
	add sb, sb, r1
	orr r6, r0, r6, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl sub_020AC028
	mov r1, sb, lsr #0x1b
	orr r2, r1, sb, lsl #5
	eor r1, r5, r6
	eor r1, r7, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r8, r8, r0
	mov r0, r5, lsr #2
	orr r5, r0, r5, lsl #30
	add r0, sl, #2
	mov r1, fp
	bl sub_020AC028
	mov r1, r8, lsr #0x1b
	orr r2, r1, r8, lsl #5
	eor r1, sb, r5
	eor r1, r6, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r7, r7, r0
	mov r0, sb, lsr #2
	orr sb, r0, sb, lsl #30
	add r0, sl, #3
	mov r1, fp
	bl sub_020AC028
	mov r1, r7, lsr #0x1b
	orr r2, r1, r7, lsl #5
	eor r1, r8, sb
	eor r1, r5, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r6, r6, r0
	mov r0, r8, lsr #2
	orr r8, r0, r8, lsl #30
	add r0, sl, #4
	and sl, r0, #0xf
	mov r0, sl
	mov r1, fp
	bl sub_020AC028
	mov r1, r6, lsr #0x1b
	orr r2, r1, r6, lsl #5
	eor r1, r7, r8
	eor r1, sb, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r5, r5, r0
	mov r1, r7, lsr #2
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #4
	orr r7, r1, r7, lsl #30
	add sl, sl, #1
	blt _020AC5F0
	ldr r0, [sp]
	ldr r0, [r0]
	add r1, r0, r5
	ldr r0, [sp]
	str r1, [r0]
	ldr r0, [r0, #4]
	add r1, r0, r6
	ldr r0, [sp]
	str r1, [r0, #4]
	ldr r0, [r0, #8]
	add r1, r0, r7
	ldr r0, [sp]
	str r1, [r0, #8]
	ldr r0, [r0, #0xc]
	add r1, r0, r8
	ldr r0, [sp]
	str r1, [r0, #0xc]
	ldr r0, [r0, #0x10]
	add r1, r0, sb
	ldr r0, [sp]
	str r1, [r0, #0x10]
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AC770: .word 0x5A827999
_020AC774: .word 0x6ED9EBA1
_020AC778: .word 0x8F1BBCDC
_020AC77C: .word 0xCA62C1D6
	arm_func_end sub_020AC0F8

	arm_func_start sub_020AC780
sub_020AC780: ; 0x020AC780
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r2, #0x5c
	mov r4, r0
	bl sub_020D4994
	ldr r0, _020AC7C0 ; =0x67452301
	ldr r1, _020AC7C4 ; =0xEFCDAB89
	str r0, [r4]
	ldr r0, _020AC7C8 ; =0x98BADCFE
	str r1, [r4, #4]
	ldr r1, _020AC7CC ; =0x10325476
	str r0, [r4, #8]
	ldr r0, _020AC7D0 ; =0xC3D2E1F0
	str r1, [r4, #0xc]
	str r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AC7C0: .word 0x67452301
_020AC7C4: .word 0xEFCDAB89
_020AC7C8: .word 0x98BADCFE
_020AC7CC: .word 0x10325476
_020AC7D0: .word 0xC3D2E1F0
	arm_func_end sub_020AC780

	arm_func_start sub_020AC7D4
sub_020AC7D4: ; 0x020AC7D4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r3, [r8, #0x18]
	mov r6, r2
	add r0, r3, r6, lsl #3
	str r0, [r8, #0x18]
	cmp r0, r6, lsl #3
	ldrlo r0, [r8, #0x14]
	mov r2, r3, lsr #3
	addlo r0, r0, #1
	strlo r0, [r8, #0x14]
	ldr r0, [r8, #0x14]
	and r4, r2, #0x3f
	rsb r5, r4, #0x40
	add r0, r0, r6, lsr #29
	mov r7, r1
	str r0, [r8, #0x14]
	cmp r6, r5
	blo _020AC870
	add r1, r8, #0x1c
	mov r0, r7
	mov r2, r5
	add r1, r1, r4
	bl sub_020D4A50
	mov r0, r8
	add r1, r8, #0x1c
	mov r4, #0
	bl sub_020AC0F8
	add r0, r5, #0x3f
	cmp r0, r6
	bhs _020AC874
_020AC850:
	mov r0, r8
	add r1, r7, r5
	bl sub_020AC0F8
	add r5, r5, #0x40
	add r0, r5, #0x3f
	cmp r0, r6
	blo _020AC850
	b _020AC874
_020AC870:
	mov r5, #0
_020AC874:
	add r1, r8, #0x1c
	add r0, r7, r5
	add r1, r1, r4
	sub r2, r6, r5
	bl sub_020D4A50
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020AC7D4

	arm_func_start sub_020AC88C
sub_020AC88C: ; 0x020AC88C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	add r1, r5, #0x14
	mov r2, #8
	bl sub_020AC06C
	ldr r0, [r5, #0x18]
	ldr r1, _020AC8F0 ; =_02110898
	mov r0, r0, lsr #3
	and r0, r0, #0x3f
	cmp r0, #0x38
	rsblt r2, r0, #0x38
	rsbge r2, r0, #0x78
	mov r0, r5
	bl sub_020AC7D4
	mov r0, r5
	mov r1, r4
	mov r2, #8
	bl sub_020AC7D4
	mov r0, r4
	mov r1, r5
	mov r2, #0x14
	bl sub_020AC06C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AC8F0: .word _02110898
	arm_func_end sub_020AC88C

	arm_func_start sub_020AC8F4
sub_020AC8F4: ; 0x020AC8F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r1, _020AC920 ; =_02110899
	mov r5, r0
	mov r2, #0x2c
	bl sub_020AC7D4
	mov r0, r4
	mov r1, r5
	mov r2, #0x14
	bl sub_020AC06C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AC920: .word _02110899
	arm_func_end sub_020AC8F4

	arm_func_start sub_020AC924
sub_020AC924: ; 0x020AC924
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r3, #0
	strb r3, [r0]
	strb r3, [r0, #1]
	add r4, r0, #2
_020AC938:
	strb r3, [r4, r3]
	add r3, r3, #1
	cmp r3, #0x100
	blt _020AC938
	mov r6, #0
	mov r5, r6
	mov r7, r6
	mov r0, r6
_020AC958:
	ldrb lr, [r4, r7]
	ldrb ip, [r1, r6]
	add r3, r6, #1
	and r6, r3, #0xff
	add r3, lr, ip
	add r3, r5, r3
	and r5, r3, #0xff
	ldrb r3, [r4, r5]
	cmp r6, r2
	movge r6, r0
	strb r3, [r4, r7]
	add r7, r7, #1
	strb lr, [r4, r5]
	cmp r7, #0x100
	blt _020AC958
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020AC924

	arm_func_start sub_020AC998
sub_020AC998: ; 0x020AC998
	stmdb sp!, {r4, r5, r6, lr}
	cmp r2, #0
	add r4, r0, #2
	ldrb ip, [r0]
	ldrb lr, [r0, #1]
	mov r3, #0
	ble _020AC9F8
_020AC9B4:
	add r5, ip, #1
	and ip, r5, #0xff
	ldrb r6, [r4, ip]
	add r5, lr, r6
	and lr, r5, #0xff
	ldrb r5, [r4, lr]
	strb r5, [r4, ip]
	add r5, r6, r5
	strb r6, [r4, lr]
	and r5, r5, #0xff
	ldrb r6, [r1, r3]
	ldrb r5, [r4, r5]
	eor r5, r6, r5
	strb r5, [r1, r3]
	add r3, r3, #1
	cmp r3, r2
	blt _020AC9B4
_020AC9F8:
	strb ip, [r0]
	strb lr, [r0, #1]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020AC998

	arm_func_start sub_020ACA04
sub_020ACA04: ; 0x020ACA04
	b _020ACA0C
_020ACA08:
	sub r1, r1, #1
_020ACA0C:
	cmp r1, #0
	beq _020ACA24
	add r2, r0, r1, lsl #1
	ldrh r2, [r2, #-2]
	cmp r2, #0
	beq _020ACA08
_020ACA24:
	mov r0, r1
	bx lr
	arm_func_end sub_020ACA04

	arm_func_start sub_020ACA2C
sub_020ACA2C: ; 0x020ACA2C
	stmdb sp!, {r3, lr}
	sub r2, r1, #1
	mov r2, r2, lsl #1
	ldrh r2, [r0, r2]
	tst r2, #0x8000
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_020ACA04
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020ACA2C

	arm_func_start sub_020ACA5C
sub_020ACA5C: ; 0x020ACA5C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r5, r3
	mov r8, r0
	mov r6, r2
	mov r0, r7
	mov r1, r5
	bl sub_020ACA04
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl sub_020ACA04
	cmp r4, r0
	movlt r4, r0
	cmp r4, r5
	addne r4, r4, #1
	mov ip, #0
	mov r3, ip
	cmp r4, #0
	ble _020ACAD4
_020ACAAC:
	mov r2, r3, lsl #1
	ldrh r1, [r7, r2]
	ldrh r0, [r6, r2]
	add r3, r3, #1
	cmp r3, r4
	add r0, r1, r0
	add r0, ip, r0
	strh r0, [r8, r2]
	mov ip, r0, lsr #0x10
	blt _020ACAAC
_020ACAD4:
	cmp r8, r7
	cmpne r8, r6
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	sub r1, r5, r3
	add r0, r8, r3, lsl #1
	mov r2, r1, lsl #1
	mov r1, #0
	bl sub_020D4994
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020ACA5C

	arm_func_start sub_020ACAF8
sub_020ACAF8: ; 0x020ACAF8
	stmdb sp!, {r4, lr}
	cmp r3, #0
	mov r4, #0
	ble _020ACB2C
_020ACB08:
	mov lr, r4, lsl #1
	ldrh ip, [r1, lr]
	add r2, r2, ip
	strh r2, [r0, lr]
	movs r2, r2, lsr #0x10
	beq _020ACB2C
	add r4, r4, #1
	cmp r4, r3
	blt _020ACB08
_020ACB2C:
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	add r4, r4, #1
	cmp r4, r3
	ldmgeia sp!, {r4, pc}
_020ACB40:
	mov ip, r4, lsl #1
	ldrh r2, [r1, ip]
	add r4, r4, #1
	cmp r4, r3
	strh r2, [r0, ip]
	blt _020ACB40
	ldmia sp!, {r4, pc}
	arm_func_end sub_020ACAF8

	arm_func_start sub_020ACB5C
sub_020ACB5C: ; 0x020ACB5C
	stmdb sp!, {r3, lr}
	mov r3, r1
	cmp r3, #0
	mov ip, #0
	ble _020ACB8C
_020ACB70:
	mov r2, ip, lsl #1
	ldrh r1, [r0, r2]
	add ip, ip, #1
	cmp ip, r3
	mvn r1, r1
	strh r1, [r0, r2]
	blt _020ACB70
_020ACB8C:
	mov r1, r0
	mov r2, #1
	bl sub_020ACAF8
	ldmia sp!, {r3, pc}
	arm_func_end sub_020ACB5C

	arm_func_start sub_020ACB9C
sub_020ACB9C: ; 0x020ACB9C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r5, r3
	mov r8, r0
	mov r6, r2
	mov r0, r7
	mov r1, r5
	bl sub_020ACA04
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl sub_020ACA04
	cmp r4, r0
	movlt r4, r0
	mov ip, #0
	cmp r4, r5
	addne r4, r4, #1
	mov r3, ip
	b _020ACC08
_020ACBE8:
	mov r2, r3, lsl #1
	ldrh r1, [r7, r2]
	ldrh r0, [r6, r2]
	add r3, r3, #1
	sub r0, r1, r0
	add r0, ip, r0
	strh r0, [r8, r2]
	mov ip, r0, asr #0x10
_020ACC08:
	cmp r3, r4
	blt _020ACBE8
	cmp r3, r5
	bge _020ACC20
	cmp ip, #0
	bne _020ACBE8
_020ACC20:
	cmp r8, r7
	cmpne r8, r6
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	sub r1, r5, r3
	add r0, r8, r3, lsl #1
	mov r2, r1, lsl #1
	mov r1, #0
	bl sub_020D4994
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020ACB9C

	arm_func_start sub_020ACC44
sub_020ACC44: ; 0x020ACC44
	stmdb sp!, {r4, lr}
	cmp r3, #0
	mov r4, #0
	ble _020ACC7C
_020ACC54:
	mov lr, r4, lsl #1
	ldrh ip, [r1, lr]
	sub ip, ip, r2
	mov r2, ip, lsr #0x10
	strh ip, [r0, lr]
	ands r2, r2, #1
	beq _020ACC7C
	add r4, r4, #1
	cmp r4, r3
	blt _020ACC54
_020ACC7C:
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	add r4, r4, #1
	cmp r4, r3
	ldmgeia sp!, {r4, pc}
_020ACC90:
	mov ip, r4, lsl #1
	ldrh r2, [r1, ip]
	add r4, r4, #1
	cmp r4, r3
	strh r2, [r0, ip]
	blt _020ACC90
	ldmia sp!, {r4, pc}
	arm_func_end sub_020ACC44

	arm_func_start sub_020ACCAC
sub_020ACCAC: ; 0x020ACCAC
	subs ip, r2, #1
	bmi _020ACCDC
_020ACCB4:
	mov r2, ip, lsl #1
	ldrh r3, [r1, r2]
	ldrh r2, [r0, r2]
	cmp r2, r3
	movhi r0, #1
	bxhi lr
	mvnlo r0, #0
	bxlo lr
	subs ip, ip, #1
	bpl _020ACCB4
_020ACCDC:
	mov r0, #0
	bx lr
	arm_func_end sub_020ACCAC

	arm_func_start sub_020ACCE4
sub_020ACCE4: ; 0x020ACCE4
	stmdb sp!, {r3, lr}
	b _020ACD04
_020ACCEC:
	mov lr, r2, lsl #1
	ldrh ip, [r0, lr]
	add r2, r2, #1
	add r1, r1, ip
	strh r1, [r0, lr]
	mov r1, r1, lsr #0x10
_020ACD04:
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	cmp r2, r3
	blt _020ACCEC
	ldmia sp!, {r3, pc}
	arm_func_end sub_020ACCE4

	arm_func_start sub_020ACD18
sub_020ACD18: ; 0x020ACD18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r8, r3
	mov sl, r1
	mov sb, r2
	mov r2, r8, lsl #1
	mov r1, #0
	str r0, [sp]
	bl sub_020D4994
	mov r0, sl
	mov r1, r8
	bl sub_020ACA04
	mov fp, r0
	mov r0, sb
	mov r1, r8
	bl sub_020ACA04
	str r0, [sp, #4]
	cmp r0, #0
	mov r5, #0
	addle sp, sp, #8
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020ACD6C:
	mov r6, #0
	sub r7, r8, r5
	mov r4, r5, lsl #1
	b _020ACDA0
_020ACD7C:
	mov r0, r6, lsl #1
	ldrh r3, [sl, r0]
	ldrh r1, [sb, r4]
	ldr r0, [sp]
	add r2, r5, r6
	mul r1, r3, r1
	mov r3, r8
	bl sub_020ACCE4
	add r6, r6, #1
_020ACDA0:
	cmp r6, fp
	cmplt r6, r7
	blt _020ACD7C
	ldr r0, [sp, #4]
	add r5, r5, #1
	cmp r5, r0
	blt _020ACD6C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020ACD18

	arm_func_start sub_020ACDC4
sub_020ACDC4: ; 0x020ACDC4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, r3
	mov r7, r0
	mov r0, r6
	mov r1, r4
	mov r5, r2
	bl sub_020ACA04
	mov r3, #0
	mov ip, r3
	cmp r0, #0
	ble _020ACE14
_020ACDF4:
	mov r2, ip, lsl #1
	ldrh r1, [r6, r2]
	add ip, ip, #1
	cmp ip, r0
	mla r1, r5, r1, r3
	strh r1, [r7, r2]
	mov r3, r1, lsr #0x10
	blt _020ACDF4
_020ACE14:
	cmp ip, r4
	movlt r0, ip, lsl #1
	addlt ip, ip, #1
	sub r1, r4, ip
	strlth r3, [r7, r0]
	mov r2, r1, lsl #1
	add r0, r7, ip, lsl #1
	mov r1, #0
	bl sub_020D4994
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020ACDC4

	arm_func_start sub_020ACE3C
sub_020ACE3C: ; 0x020ACE3C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov r8, r2
	mov sl, r0
	mov r0, sb
	mov r1, r8
	bl sub_020ACA04
	mov fp, r0
	cmp r8, fp, lsl #1
	mov r0, fp, lsl #1
	ble _020ACE7C
	sub r1, r8, r0
	add r0, sl, r0, lsl #1
	mov r2, r1, lsl #1
	mov r1, #0
	bl sub_020D4994
_020ACE7C:
	cmp fp, #0
	mov r4, #0
	ble _020ACED0
	mov r5, r4
	sub r2, r8, #1
_020ACE90:
	cmp r5, r8
	bge _020ACED0
	mov r0, r4, lsl #1
	ldrh r3, [sb, r0]
	mov r0, r5, lsl #1
	cmp r5, r2
	mul r1, r3, r3
	strh r1, [sl, r0]
	beq _020ACED0
	add r4, r4, #1
	mov r1, r1, lsr #0x10
	add r0, sl, r0
	strh r1, [r0, #2]
	cmp r4, fp
	add r5, r5, #2
	blt _020ACE90
_020ACED0:
	mov r6, #0
	cmp fp, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020ACEDC:
	mov r0, r6, lsl #1
	add r4, r6, #1
	str r0, [sp]
	b _020ACF4C
_020ACEEC:
	mov r0, r4, lsl #1
	ldrh r1, [sb, r0]
	ldr r0, [sp]
	ldrh r0, [sb, r0]
	mul r7, r1, r0
	ldr r0, _020ACF6C ; =0x7FFF8000
	cmp r7, r0
	mov r0, sl
	bhi _020ACF24
	mov r2, r5
	mov r3, r8
	mov r1, r7, lsl #1
	bl sub_020ACCE4
	b _020ACF48
_020ACF24:
	mov r1, r7
	mov r2, r5
	mov r3, r8
	bl sub_020ACCE4
	mov r1, r7
	mov r2, r5
	mov r0, sl
	mov r3, r8
	bl sub_020ACCE4
_020ACF48:
	add r4, r4, #1
_020ACF4C:
	cmp r4, fp
	addlt r5, r6, r4
	cmplt r5, r8
	blt _020ACEEC
	add r6, r6, #1
	cmp r6, fp
	blt _020ACEDC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020ACF6C: .word 0x7FFF8000
	arm_func_end sub_020ACE3C

	arm_func_start sub_020ACF70
sub_020ACF70: ; 0x020ACF70
	ldrh r1, [r0]
	mov r0, #0
	bx lr
	arm_func_end sub_020ACF70

	arm_func_start sub_020ACF7C
sub_020ACF7C: ; 0x020ACF7C
	ldrh r1, [r0]
	ldrh r0, [r0, #-2]
	mov r0, r0, lsl #0x10
	bx lr
	arm_func_end sub_020ACF7C

	arm_func_start sub_020ACF8C
sub_020ACF8C: ; 0x020ACF8C
	ldrh r1, [r0]
	ldrh r2, [r0, #-2]
	ldrh r3, [r0, #-4]
	orr r0, r3, r2, lsl #16
	bx lr
	arm_func_end sub_020ACF8C

	arm_func_start sub_020ACFA0
sub_020ACFA0: ; 0x020ACFA0
	ldrh r2, [r0]
	ldrh r3, [r0, #-2]
	orr r1, r3, r2, lsl #16
	ldrh r2, [r0, #-4]
	ldrh r3, [r0, #-6]
	orr r0, r3, r2, lsl #16
	bx lr
	arm_func_end sub_020ACFA0

	arm_func_start sub_020ACFBC
sub_020ACFBC: ; 0x020ACFBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr sb, [sp, #0x48]
	ldr r8, [sp, #0x4c]
	str r1, [sp, #4]
	add r6, r8, sb, lsl #1
	str r0, [sp]
	mov sl, r2
	mov r0, r6
	mov r2, sb, lsl #2
	mov r1, #0
	str r3, [sp, #8]
	add r7, r6, sb, lsl #1
	bl sub_020D4994
	ldr r0, [sp, #4]
	mov r1, sb
	bl sub_020ACA04
	mov fp, r0
	mov r0, sl
	mov r1, sb
	bl sub_020ACA04
	mov r5, r0
	cmp fp, #0
	cmpgt r5, #0
	ble _020AD154
	sub r0, sb, fp
	add r0, r5, r0
	sub r4, r0, #1
	cmp r4, sb
	blt _020AD048
	ldr r0, [sp, #4]
	mov r1, r7
	mov r2, sb, lsl #1
	bl sub_020D4A50
	b _020AD154
_020AD048:
	ldr r0, [sp, #4]
	add r1, r6, r4, lsl #1
	mov r2, fp, lsl #1
	bl sub_020D4A50
	cmp r5, #2
	ble _020AD07C
	add r0, sl, r5, lsl #1
	sub r0, r0, #2
	mov fp, r5, lsl #1
	bl sub_020ACF8C
	str r0, [sp, #0x18]
	str r1, [sp, #0x10]
	b _020AD0B0
_020AD07C:
	add r0, sl, r5, lsl #1
	cmp r5, #1
	sub r0, r0, #2
	ble _020AD0A0
	mov fp, r5, lsl #1
	bl sub_020ACF7C
	str r0, [sp, #0x18]
	str r1, [sp, #0x10]
	b _020AD0B0
_020AD0A0:
	mov fp, r5, lsl #1
	bl sub_020ACF70
	str r0, [sp, #0x18]
	str r1, [sp, #0x10]
_020AD0B0:
	cmp r4, sb
	bge _020AD154
	mov r0, sb, lsl #1
	sub r0, r0, #1
	mov r0, r0, lsl #1
	str r0, [sp, #0x14]
_020AD0C8:
	ldr r2, [sp, #0x14]
	mov r1, r6
	add r0, r6, #2
	bl memmove
	add r0, r7, fp
	bl sub_020ACFA0
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x10]
	bl _ll_udiv
	mov r5, r0
	ldr r0, _020AD198 ; =0x0000FFFF
	cmp r5, r0
	movhi r5, r0
_020AD0FC:
	mov r2, r5, lsl #0x10
	mov r0, r8
	mov r1, sl
	mov r2, r2, lsr #0x10
	mov r3, sb
	bl sub_020ACDC4
	mov r0, r7
	mov r1, r8
	mov r2, sb
	bl sub_020ACCAC
	cmp r0, #0
	sublt r5, r5, #1
	blt _020AD0FC
	mov r0, r7
	mov r1, r7
	mov r2, r8
	mov r3, sb
	bl sub_020ACB9C
	strh r5, [r6]
	add r4, r4, #1
	cmp r4, sb
	blt _020AD0C8
_020AD154:
	ldr r0, [sp]
	cmp r0, #0
	beq _020AD170
	ldr r1, [sp]
	mov r0, r6
	mov r2, sb, lsl #1
	bl sub_020D4A50
_020AD170:
	ldr r0, [sp, #8]
	cmp r0, #0
	addeq sp, sp, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sp, #8]
	mov r0, r7
	mov r2, sb, lsl #1
	bl sub_020D4A50
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AD198: .word 0x0000FFFF
	arm_func_end sub_020ACFBC

	arm_func_start sub_020AD19C
sub_020AD19C: ; 0x020AD19C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, _020AD328 ; =0x021D4634
	mov r8, r3
	ldr r3, [r4]
	mov sl, r0
	mov r0, r8, lsl #3
	ldr r7, [sp, #0x30]
	str r1, [sp, #8]
	mov sb, r2
	blx r3
	movs r4, r0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	sub r1, r8, #1
	add r0, sl, #2
	mov r2, r1, lsl #1
	mov r1, #0
	add r5, r4, r8, lsl #1
	bl sub_020D4994
	mov r2, #1
	mov r0, sb
	mov r1, r8
	strh r2, [sl]
	bl sub_020ACA04
	sub r0, r8, r0
	mov r6, r0, lsl #4
	cmp r6, r8, lsl #4
	bhs _020AD250
	mov r2, #0x8000
_020AD214:
	sub r0, r8, r6, asr #4
	add r0, sb, r0, lsl #1
	ldrh r0, [r0, #-2]
	and r1, r6, #0xf
	tst r0, r2, lsr r1
	beq _020AD244
	ldr r0, [sp, #8]
	mov r1, sl
	mov r2, r8, lsl #1
	bl sub_020D4A50
	add r6, r6, #1
	b _020AD250
_020AD244:
	add r6, r6, #1
	cmp r6, r8, lsl #4
	blo _020AD214
_020AD250:
	cmp r6, r8, lsl #4
	bhs _020AD310
	mov fp, r8, lsl #1
_020AD25C:
	mov r0, r4
	mov r1, sl
	mov r2, r8
	bl sub_020ACE3C
	mov r0, r4
	mov r1, sl
	mov r2, fp
	bl sub_020D4A50
	cmp r7, #0
	beq _020AD2A0
	str r8, [sp]
	mov r0, #0
	mov r1, sl
	mov r2, r7
	mov r3, sl
	str r5, [sp, #4]
	bl sub_020ACFBC
_020AD2A0:
	sub r0, r8, r6, asr #4
	add r0, sb, r0, lsl #1
	ldrh r1, [r0, #-2]
	and r2, r6, #0xf
	mov r0, #0x8000
	tst r1, r0, lsr r2
	beq _020AD304
	ldr r2, [sp, #8]
	mov r0, r4
	mov r1, sl
	mov r3, r8
	bl sub_020ACD18
	mov r0, r4
	mov r1, sl
	mov r2, fp
	bl sub_020D4A50
	cmp r7, #0
	beq _020AD304
	str r8, [sp]
	mov r0, #0
	mov r1, sl
	mov r2, r7
	mov r3, sl
	str r5, [sp, #4]
	bl sub_020ACFBC
_020AD304:
	add r6, r6, #1
	cmp r6, r8, lsl #4
	blo _020AD25C
_020AD310:
	ldr r1, _020AD32C ; =0x021D4660
	mov r0, r4
	ldr r1, [r1]
	blx r1
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AD328: .word 0x021D4634
_020AD32C: .word 0x021D4660
	arm_func_end sub_020AD19C

	arm_func_start sub_020AD330
sub_020AD330: ; 0x020AD330
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr sb, [sp, #0x38]
	mov sl, r3
	add fp, sb, sl, lsl #1
	add r4, fp, sl, lsl #1
	add r5, r4, sl, lsl #1
	add r6, r5, sl, lsl #1
	add r7, r6, sl, lsl #1
	str r0, [sp, #8]
	mov r0, r1
	add r1, r7, sl, lsl #1
	str r1, [sp, #0x10]
	mov r8, sl, lsl #1
	str r2, [sp, #0xc]
	mov r1, sb
	mov r2, r8
	bl sub_020D4A50
	ldr r0, [sp, #0xc]
	mov r1, r4
	mov r2, r8
	bl sub_020D4A50
	mov r0, #1
	strh r0, [r4, r8]
	mov r0, sb
	mov r1, sl
	bl sub_020ACA2C
	cmp r0, #0
	ble _020AD440
_020AD3A4:
	ldr r3, [sp, #0x10]
	str sl, [sp]
	str r3, [sp, #4]
	mov r0, fp
	mov r1, r4
	mov r2, sb
	mov r3, r7
	bl sub_020ACFBC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl sub_020D4A50
	mov r0, r7
	mov r1, sb
	mov r2, r8
	bl sub_020D4A50
	mov r0, r7
	mov r1, fp
	mov r2, r5
	mov r3, sl
	bl sub_020ACD18
	mov r0, r7
	mov r1, r6
	mov r2, r7
	mov r3, sl
	bl sub_020ACB9C
	mov r0, r5
	mov r1, r6
	mov r2, r8
	bl sub_020D4A50
	mov r0, r7
	mov r1, r5
	mov r2, r8
	bl sub_020D4A50
	mov r0, sb
	mov r1, sl
	bl sub_020ACA2C
	cmp r0, #0
	bgt _020AD3A4
_020AD440:
	ldr r2, [sp, #0xc]
	mov r0, r6
	mov r1, r6
	mov r3, sl
	bl sub_020ACA5C
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	ldr r4, [sp, #0x10]
	str sl, [sp]
	mov r1, r6
	mov r0, #0
	str r4, [sp, #4]
	bl sub_020ACFBC
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020AD330

	arm_func_start sub_020AD47C
sub_020AD47C: ; 0x020AD47C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r3
	mov r4, r6, lsl #1
	mov r8, r2
	mov r2, r4
	mov r7, r0
	mov sb, r1
	ldr r5, [sp, #0x20]
	bl sub_020D4A50
	cmp r8, #1
	bne _020AD4BC
	mov r0, r7
	mov r1, sb
	mov r2, r6
	bl sub_020ACE3C
	b _020AD4D8
_020AD4BC:
	cmp r8, #0
	beq _020AD4D8
	mov r0, r7
	mov r1, sb
	mov r2, r8
	mov r3, r6
	bl sub_020ACD18
_020AD4D8:
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	mov r1, r7
	mov r3, r5
	bl sub_020ACD18
	sub r1, r6, r5
	ldr r0, [sp, #0x2c]
	mov r8, r1, lsl #1
	mov r2, r8
	add r0, r0, r5, lsl #1
	mov r1, #0
	bl sub_020D4994
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x24]
	mov r3, r6
	bl sub_020ACD18
	mov r0, r7
	mov r1, r7
	ldr r2, [sp, #0x30]
	mov r3, r6
	bl sub_020ACA5C
	mov r2, r8
	mov r0, r7
	add r1, r7, r5, lsl #1
	bl memmove
	add r0, r7, r6, lsl #1
	sub r0, r0, r5, lsl #1
	mov r2, r5, lsl #1
	mov r1, #0
	bl sub_020D4994
	mov r0, r7
	ldr r1, [sp, #0x24]
	mov r2, r6
	bl sub_020ACCAC
	cmp r0, #0
	beq _020AD578
	cmp r0, #1
	beq _020AD58C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020AD578:
	mov r0, r7
	mov r2, r4
	mov r1, #0
	bl sub_020D4994
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020AD58C:
	ldr r2, [sp, #0x24]
	mov r0, r7
	mov r1, r7
	mov r3, r6
	bl sub_020ACB9C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020AD47C

	arm_func_start sub_020AD5A4
sub_020AD5A4: ; 0x020AD5A4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov sl, r3
	mov r3, #0x16
	mul r4, sl, r3
	ldr r3, _020AD7A8 ; =0x021D4634
	mov fp, r0
	ldr r3, [r3]
	mov r0, r4
	ldr sb, [sp, #0x50]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	blx r3
	str r0, [sp, #0x28]
	cmp r0, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r2, r4
	mov r1, #0
	bl sub_020D4994
	ldr r0, [sp, #0x28]
	mov r1, sl
	add r6, r0, sl, lsl #1
	add r0, r6, sl, lsl #1
	add r7, r0, sl, lsl #1
	add r8, r7, sl, lsl #1
	str r0, [sp, #0x24]
	add r0, r8, sl, lsl #1
	str r0, [sp, #0x20]
	add r5, r0, sl, lsl #1
	mov r0, sb
	bl sub_020ACA04
	mov r4, r0
	ldr r0, [sp, #0x28]
	mov r2, #1
	mov r1, r4, lsl #1
	strh r2, [r0, r1]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	str r0, [sp]
	mov r0, r6
	mov r2, sb
	mov r3, sl
	bl sub_020AD330
	ldr r1, [sp, #0x28]
	mov r0, r7
	mov r2, r6
	mov r3, sl
	bl sub_020ACD18
	mov r0, r6
	mov r1, r7
	mov r2, #1
	mov r3, sl
	bl sub_020ACC44
	str sl, [sp]
	mov r0, r6
	mov r1, r6
	mov r2, sb
	mov r3, #0
	str r5, [sp, #4]
	bl sub_020ACFBC
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x28]
	mov r3, sl
	bl sub_020ACD18
	ldr r1, [sp, #0x24]
	str sl, [sp]
	mov r0, #0
	mov r2, sb
	mov r3, r1
	str r5, [sp, #4]
	bl sub_020ACFBC
	str sl, [sp]
	ldr r1, [sp, #0x28]
	mov r0, #0
	mov r2, sb
	mov r3, fp
	str r5, [sp, #4]
	bl sub_020ACFBC
	movs r0, r4, lsl #4
	mov r5, #0
	str r0, [sp, #0x1c]
	beq _020AD76C
_020AD6F4:
	stmia sp, {r4, sb}
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	ldr r1, [sp, #0x20]
	mov r0, fp
	mov r2, #1
	mov r3, sl
	str r8, [sp, #0x10]
	bl sub_020AD47C
	ldr r1, [sp, #0x18]
	sub r2, r4, r5, asr #4
	add r1, r1, r2, lsl #1
	ldrh r2, [r1, #-2]
	and r0, r5, #0xf
	mov r1, #0x8000
	tst r2, r1, lsr r0
	beq _020AD75C
	stmia sp, {r4, sb}
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	mov r0, fp
	mov r3, sl
	str r8, [sp, #0x10]
	bl sub_020AD47C
_020AD75C:
	ldr r0, [sp, #0x1c]
	add r5, r5, #1
	cmp r5, r0
	blo _020AD6F4
_020AD76C:
	stmia sp, {r4, sb}
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	ldr r1, [sp, #0x20]
	mov r0, fp
	mov r3, sl
	mov r2, #0
	str r8, [sp, #0x10]
	bl sub_020AD47C
	ldr r1, _020AD7AC ; =0x021D4660
	ldr r0, [sp, #0x28]
	ldr r1, [r1]
	blx r1
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AD7A8: .word 0x021D4634
_020AD7AC: .word 0x021D4660
	arm_func_end sub_020AD5A4

	arm_func_start sub_020AD7B0
sub_020AD7B0: ; 0x020AD7B0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	mov r2, r3, lsl #1
	mov r1, #0
	mov r4, r0
	bl sub_020D4994
	sub r0, r5, #1
	cmp r5, #1
	add r6, r6, r0
	ble _020AD7FC
_020AD7DC:
	ldrb r1, [r6]
	ldrb r0, [r6, #-1]
	sub r5, r5, #2
	cmp r5, #1
	add r0, r1, r0, lsl #8
	strh r0, [r4], #2
	sub r6, r6, #2
	bgt _020AD7DC
_020AD7FC:
	cmp r5, #0
	ldrgtb r0, [r6]
	strgth r0, [r4]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020AD7B0

	arm_func_start sub_020AD80C
sub_020AD80C: ; 0x020AD80C
	sub r3, r2, #1
	cmp r2, #1
	add r0, r0, r3
	ble _020AD840
_020AD81C:
	ldrh r3, [r1]
	sub ip, r0, #1
	sub r2, r2, #2
	strb r3, [r0], #-2
	ldrh r3, [r1], #2
	cmp r2, #1
	mov r3, r3, asr #8
	strb r3, [ip]
	bgt _020AD81C
_020AD840:
	cmp r2, #0
	ldrgth r1, [r1]
	strgtb r1, [r0]
	bx lr
	arm_func_end sub_020AD80C

	arm_func_start sub_020AD850
sub_020AD850: ; 0x020AD850
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl sub_020D3A38
	ldr r2, _020AD964 ; =0x021D5FEC
	mov r4, r0
	ldr r1, [r2]
	cmp r1, #0
	beq _020AD880
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020AD880:
	cmp r6, #0
	bne _020AD894
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020AD894:
	tst r6, #0x1f
	beq _020AD8A8
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020AD8A8:
	cmp r5, #0x2300
	bhs _020AD8BC
	bl sub_020D3A4C
	mov r0, #6
	ldmia sp!, {r4, r5, r6, pc}
_020AD8BC:
	str r6, [r2]
	add r0, r6, #0x2000
	mov r1, #1
	str r1, [r0, #0x260]
	ldr r1, [r2]
	mov r0, #0
	add r1, r1, #0x2200
	strh r0, [r1, #0x80]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0x68]
	ldr r1, [r2]
	add r1, r1, #0x2000
	strb r0, [r1, #0x26a]
	ldr r1, [r2]
	add r1, r1, #0x2000
	strb r0, [r1, #0x26b]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0x82]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0xf8]
	bl sub_020AE7B4
	bl sub_020AFE3C
	bl sub_020D3438
	cmp r0, #0
	bne _020AD930
	bl sub_020D33C0
_020AD930:
	bl sub_020D369C
	cmp r0, #0
	bne _020AD940
	bl sub_020D365C
_020AD940:
	ldr r0, _020AD964 ; =0x021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2cc
	add r0, r0, #0x2000
	bl sub_020D36AC
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020AD964: .word 0x021D5FEC
	arm_func_end sub_020AD850

	arm_func_start sub_020AD968
sub_020AD968: ; 0x020AD968
	stmdb sp!, {r3, lr}
	bl sub_020D3A38
	ldr r2, _020AD9BC ; =0x021D5FEC
	ldr r1, [r2]
	cmp r1, #0
	bne _020AD98C
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r3, pc}
_020AD98C:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #1
	beq _020AD9A8
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r3, pc}
_020AD9A8:
	mov r1, #0
	str r1, [r2]
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AD9BC: .word 0x021D5FEC
	arm_func_end sub_020AD968

	arm_func_start sub_020AD9C0
sub_020AD9C0: ; 0x020AD9C0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl sub_020D3A38
	ldr r1, _020ADBB8 ; =0x021D5FEC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _020AD9F0
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020AD9F0:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #1
	beq _020ADA14
	cmp r1, #2
	beq _020ADA24
	cmp r1, #3
	beq _020ADA30
	b _020ADA3C
_020ADA14:
	mov r0, r6
	mov r1, r5
	bl sub_020AE4FC
	b _020ADA48
_020ADA24:
	bl sub_020D3A4C
	mov r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_020ADA30:
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020ADA3C:
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020ADA48:
	ldr r0, _020ADBB8 ; =0x021D5FEC
	ldr r0, [r0]
	add r1, r0, #0x2000
	ldr r1, [r1, #0x26c]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_020DE248
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _020ADAB4
_020ADA70: ; jump table
	b _020ADACC ; case 0
	b _020ADAB4 ; case 1
	b _020ADAB4 ; case 2
	b _020ADA8C ; case 3
	b _020ADAA4 ; case 4
	b _020ADAB4 ; case 5
	b _020ADAB4 ; case 6
_020ADA8C:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020ADAA4:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #5
	ldmia sp!, {r4, r5, r6, pc}
_020ADAB4:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020ADACC:
	bl sub_020DEF24
	cmp r0, #0
	bne _020ADB0C
	bl sub_020DE458
	cmp r0, #0
	beq _020ADAFC
	mov r0, #0xb
	bl sub_020AE8FC
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020ADAFC:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #5
	ldmia sp!, {r4, r5, r6, pc}
_020ADB0C:
	ldr r0, _020ADBBC ; =sub_020AEAA8
	bl sub_020DEBA8
	cmp r0, #0
	beq _020ADB34
	mov r0, #0xb
	bl sub_020AE8FC
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020ADB34:
	ldr r0, _020ADBC0 ; =sub_020AEB20
	bl sub_020DF2C4
	cmp r0, #2
	beq _020ADB58
	cmp r0, #3
	beq _020ADB90
	cmp r0, #8
	beq _020ADB78
	b _020ADB90
_020ADB58:
	mov r0, #2
	bl sub_020AE8FC
	ldr r0, _020ADBB8 ; =0x021D5FEC
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020ADBA8
_020ADB78:
	mov r0, #0xc
	bl sub_020AE8FC
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020ADB90:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020ADBA8:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #3
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020ADBB8: .word 0x021D5FEC
_020ADBBC: .word sub_020AEAA8
_020ADBC0: .word sub_020AEB20
	arm_func_end sub_020AD9C0

	arm_func_start sub_020ADBC4
sub_020ADBC4: ; 0x020ADBC4
	stmdb sp!, {r4, lr}
	bl sub_020D3A38
	ldr r1, _020ADCAC ; =0x021D5FEC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _020ADBEC
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, pc}
_020ADBEC:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #1
	beq _020ADC18
	cmp r1, #3
	beq _020ADC30
	cmp r1, #4
	bne _020ADC24
	bl sub_020D3A4C
	mov r0, #2
	ldmia sp!, {r4, pc}
_020ADC18:
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r4, pc}
_020ADC24:
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, pc}
_020ADC30:
	ldr r0, _020ADCB0 ; =sub_020AEB20
	bl sub_020DF3B8
	cmp r0, #2
	beq _020ADC54
	cmp r0, #3
	beq _020ADC84
	cmp r0, #8
	beq _020ADC74
	b _020ADC84
_020ADC54:
	mov r0, #4
	bl sub_020AE8FC
	ldr r0, _020ADCAC ; =0x021D5FEC
	mov r1, #2
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020ADC9C
_020ADC74:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #4
	ldmia sp!, {r4, pc}
_020ADC84:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #7
	ldmia sp!, {r4, pc}
_020ADC9C:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #3
	ldmia sp!, {r4, pc}
	.align 2, 0
_020ADCAC: .word 0x021D5FEC
_020ADCB0: .word sub_020AEB20
	arm_func_end sub_020ADBC4

	arm_func_start sub_020ADCB4
sub_020ADCB4: ; 0x020ADCB4
	stmdb sp!, {r3, lr}
	cmp r0, #0
	cmpne r1, #0
	bne _020ADCCC
	bl sub_020ADE4C
	ldmia sp!, {r3, pc}
_020ADCCC:
	bl sub_020ADCD4
	ldmia sp!, {r3, pc}
	arm_func_end sub_020ADCB4

	arm_func_start sub_020ADCD4
sub_020ADCD4: ; 0x020ADCD4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_020D3A38
	ldr r1, _020ADE44 ; =0x021D5FEC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _020ADD08
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADD08:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #3
	beq _020ADD78
	cmp r1, #5
	beq _020ADD2C
	cmp r1, #6
	beq _020ADD4C
	b _020ADD6C
_020ADD2C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_020AE61C
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADD4C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_020AE61C
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADD6C:
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADD78:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_020AE61C
	ldr r0, _020ADE44 ; =0x021D5FEC
	ldr r0, [r0]
	add r1, r0, #0x2200
	add r0, r0, #0x2000
	ldrh r1, [r1, #0x8c]
	ldr r0, [r0, #0x288]
	bl sub_020D285C
	ldr r2, _020ADE44 ; =0x021D5FEC
	ldr r0, _020ADE48 ; =sub_020AEDDC
	ldr r1, [r2]
	add r1, r1, #0x2000
	ldr r3, [r1, #0x284]
	add r3, r3, #1
	str r3, [r1, #0x284]
	ldr r1, [r2]
	add r1, r1, #0x288
	add r1, r1, #0x2000
	bl sub_020DF7BC
	cmp r0, #2
	beq _020ADDEC
	cmp r0, #3
	beq _020ADE1C
	cmp r0, #8
	beq _020ADE0C
	b _020ADE1C
_020ADDEC:
	mov r0, #5
	bl sub_020AE8FC
	ldr r0, _020ADE44 ; =0x021D5FEC
	mov r1, #3
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020ADE34
_020ADE0C:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADE1C:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADE34:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020ADE44: .word 0x021D5FEC
_020ADE48: .word sub_020AEDDC
	arm_func_end sub_020ADCD4

	arm_func_start sub_020ADE4C
sub_020ADE4C: ; 0x020ADE4C
	stmdb sp!, {r4, lr}
	bl sub_020D3A38
	ldr r1, _020ADEEC ; =0x021D5FEC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _020ADE74
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, pc}
_020ADE74:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #3
	beq _020ADEC4
	cmp r1, #6
	beq _020ADE98
	cmp r1, #7
	beq _020ADEB8
	b _020ADED0
_020ADE98:
	mov r0, #7
	bl sub_020AE8FC
	ldr r0, _020ADEEC ; =0x021D5FEC
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020ADEDC
_020ADEB8:
	bl sub_020D3A4C
	mov r0, #2
	ldmia sp!, {r4, pc}
_020ADEC4:
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r4, pc}
_020ADED0:
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, pc}
_020ADEDC:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #3
	ldmia sp!, {r4, pc}
	.align 2, 0
_020ADEEC: .word 0x021D5FEC
	arm_func_end sub_020ADE4C

	arm_func_start sub_020ADEF0
sub_020ADEF0: ; 0x020ADEF0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_020D3A38
	ldr r2, _020AE0E8 ; =0x021D5FEC
	mov r4, r0
	ldr ip, [r2]
	cmp ip, #0
	bne _020ADF24
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADF24:
	add r1, ip, #0x2000
	ldr r3, [r1, #0x260]
	cmp r3, #3
	beq _020ADF48
	cmp r3, #8
	beq _020AE038
	cmp r3, #9
	beq _020AE044
	b _020AE050
_020ADF48:
	cmp r7, #0
	bne _020ADF5C
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADF5C:
	ldrh r3, [r7, #0x3c]
	cmp r3, #0
	beq _020ADF74
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADF74:
	cmp r6, #0
	beq _020ADFEC
	ldrb r3, [r6]
	cmp r3, #4
	ldrlob r0, [r6, #1]
	cmplo r0, #4
	blo _020ADFA0
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADFA0:
	strb r3, [r1, #0x250]
	ldr r0, [r2]
	ldrb r1, [r6, #1]
	add r0, r0, #0x2000
	strb r1, [r0, #0x251]
	ldr r1, [r2]
	mov r2, #0x50
	add r0, r1, #0x2000
	ldrb r0, [r0, #0x250]
	cmp r0, #0
	bne _020ADFDC
	add r0, r1, #0x2200
	mov r1, #0
	bl sub_020D4994
	b _020ADFFC
_020ADFDC:
	add r0, r6, #2
	add r1, r1, #0x2200
	bl sub_020D4A50
	b _020ADFFC
_020ADFEC:
	add r0, ip, #0x2200
	mov r1, #0
	mov r2, #0x52
	bl sub_020D4994
_020ADFFC:
	ldr r1, _020AE0E8 ; =0x021D5FEC
	mov r0, r7
	ldr r1, [r1]
	mov r2, #0xc0
	add r1, r1, #0x2140
	bl sub_020D4A50
	ldr r1, _020AE0E8 ; =0x021D5FEC
	mov r0, r5
	ldr r1, [r1]
	add r1, r1, #0x2100
	ldrh r2, [r1, #0x6e]
	orr r2, r2, #3
	strh r2, [r1, #0x70]
	bl sub_020AE450
	b _020AE05C
_020AE038:
	bl sub_020D3A4C
	mov r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020AE044:
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020AE050:
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020AE05C:
	ldr r1, _020AE0EC ; =0x0000FFFF
	ldr r0, _020AE0F0 ; =sub_020AEB20
	mov r3, r1
	mov r2, #0x50
	str r1, [sp]
	bl sub_020E0E94
	cmp r0, #2
	beq _020AE090
	cmp r0, #3
	beq _020AE0C0
	cmp r0, #8
	beq _020AE0B0
	b _020AE0C0
_020AE090:
	mov r0, #8
	bl sub_020AE8FC
	ldr r0, _020AE0E8 ; =0x021D5FEC
	mov r1, #5
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020AE0D8
_020AE0B0:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020AE0C0:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020AE0D8:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020AE0E8: .word 0x021D5FEC
_020AE0EC: .word 0x0000FFFF
_020AE0F0: .word sub_020AEB20
	arm_func_end sub_020ADEF0

	arm_func_start sub_020AE0F4
sub_020AE0F4: ; 0x020AE0F4
	stmdb sp!, {r4, lr}
	bl sub_020D3A38
	ldr r1, _020AE208 ; =0x021D5FEC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _020AE11C
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, pc}
_020AE11C:
	add r1, r1, #0x2000
	ldr r2, [r1, #0x260]
	cmp r2, #3
	beq _020AE148
	cmp r2, #9
	beq _020AE160
	cmp r2, #0xa
	bne _020AE154
	bl sub_020D3A4C
	mov r0, #2
	ldmia sp!, {r4, pc}
_020AE148:
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r4, pc}
_020AE154:
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r4, pc}
_020AE160:
	ldrb r0, [r1, #0x26b]
	cmp r0, #1
	bne _020AE18C
	mov r0, #0xa
	bl sub_020AE8FC
	ldr r0, _020AE208 ; =0x021D5FEC
	mov r1, #6
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020AE1F8
_020AE18C:
	ldr r0, _020AE20C ; =sub_020AF574
	bl sub_020E0088
	cmp r0, #2
	beq _020AE1B0
	cmp r0, #3
	beq _020AE1E0
	cmp r0, #8
	beq _020AE1D0
	b _020AE1E0
_020AE1B0:
	mov r0, #0xa
	bl sub_020AE8FC
	ldr r0, _020AE208 ; =0x021D5FEC
	mov r1, #6
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020AE1F8
_020AE1D0:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #4
	ldmia sp!, {r4, pc}
_020AE1E0:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #7
	ldmia sp!, {r4, pc}
_020AE1F8:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #3
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AE208: .word 0x021D5FEC
_020AE20C: .word sub_020AF574
	arm_func_end sub_020AE0F4

	arm_func_start sub_020AE210
sub_020AE210: ; 0x020AE210
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_020D3A38
	ldr r1, _020AE414 ; =0x021D5FEC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _020AE238
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_020AE238:
	add r1, r1, #0x2000
	ldr r2, [r1, #0x260]
	cmp r2, #0xd
	addls pc, pc, r2, lsl #2
	b _020AE2C8
_020AE24C: ; jump table
	b _020AE2C8 ; case 0
	b _020AE290 ; case 1
	b _020AE2C8 ; case 2
	b _020AE2D8 ; case 3
	b _020AE2C8 ; case 4
	b _020AE2C8 ; case 5
	b _020AE29C ; case 6
	b _020AE2C8 ; case 7
	b _020AE2C8 ; case 8
	b _020AE2D8 ; case 9
	b _020AE2C8 ; case 10
	b _020AE2C8 ; case 11
	b _020AE2D8 ; case 12
	b _020AE284 ; case 13
_020AE284:
	bl sub_020D3A4C
	mov r0, #2
	ldmia sp!, {r3, r4, r5, pc}
_020AE290:
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AE29C:
	mov r0, #0xd
	bl sub_020AE8FC
	ldr r1, _020AE414 ; =0x021D5FEC
	mov r2, #9
	ldr r1, [r1]
	mov r0, r4
	add r1, r1, #0x2200
	strh r2, [r1, #0x80]
	bl sub_020D3A4C
	mov r0, #3
	ldmia sp!, {r3, r4, r5, pc}
_020AE2C8:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_020AE2D8:
	ldrb r0, [r1, #0x26b]
	cmp r0, #1
	bne _020AE304
	mov r0, #0xd
	bl sub_020AE8FC
	ldr r0, _020AE414 ; =0x021D5FEC
	mov r1, #9
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020AE404
_020AE304:
	bl sub_020DEB24
	mov r5, r0
	mov r1, #2
	bl sub_020D285C
	ldrh r0, [r5]
	cmp r0, #0
	beq _020AE334
	cmp r0, #1
	beq _020AE36C
	cmp r0, #2
	beq _020AE378
	b _020AE384
_020AE334:
	bl sub_020DE458
	cmp r0, #0
	bne _020AE3A0
	mov r0, #1
	bl sub_020AE8FC
	ldr r1, _020AE414 ; =0x021D5FEC
	mov r2, #0
	ldr r1, [r1]
	mov r0, r4
	add r1, r1, #0x2200
	strh r2, [r1, #0x80]
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AE36C:
	ldr r0, _020AE418 ; =sub_020AEB20
	bl sub_020DF338
	b _020AE3A0
_020AE378:
	ldr r0, _020AE418 ; =sub_020AEB20
	bl sub_020DF3B8
	b _020AE3A0
_020AE384:
	ldr r1, _020AE414 ; =0x021D5FEC
	ldr r0, _020AE41C ; =sub_020AF690
	ldr r1, [r1]
	mov r2, #1
	add r1, r1, #0x2000
	strb r2, [r1, #0x26b]
	bl sub_020DF480
_020AE3A0:
	cmp r0, #2
	beq _020AE3BC
	cmp r0, #3
	beq _020AE3EC
	cmp r0, #8
	beq _020AE3DC
	b _020AE3EC
_020AE3BC:
	mov r0, #0xd
	bl sub_020AE8FC
	ldr r0, _020AE414 ; =0x021D5FEC
	mov r1, #9
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020AE404
_020AE3DC:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #4
	ldmia sp!, {r3, r4, r5, pc}
_020AE3EC:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #7
	ldmia sp!, {r3, r4, r5, pc}
_020AE404:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #3
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AE414: .word 0x021D5FEC
_020AE418: .word sub_020AEB20
_020AE41C: .word sub_020AF690
	arm_func_end sub_020AE210

	arm_func_start sub_020AE420
sub_020AE420: ; 0x020AE420
	stmdb sp!, {r4, lr}
	bl sub_020D3A38
	ldr r1, _020AE44C ; =0x021D5FEC
	mov r4, #0
	ldr r1, [r1]
	cmp r1, #0
	addne r1, r1, #0x2000
	ldrne r4, [r1, #0x260]
	bl sub_020D3A4C
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AE44C: .word 0x021D5FEC
	arm_func_end sub_020AE420

	arm_func_start sub_020AE450
sub_020AE450: ; 0x020AE450
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020D3A38
	ldr r1, _020AE4E4 ; =0x021D5FEC
	mov r2, #0
	ldr r3, [r1]
	add r1, r3, #0x2000
	cmp r3, #0
	ldr r4, [r1, #0x264]
	bne _020AE484
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AE484:
	tst r5, #0x8000
	beq _020AE4A4
	ldr r1, _020AE4E8 ; =0x00003FFE
	orr r2, r2, #0xfe
	tst r5, r1
	orreq r5, r5, #0x82
	orr r2, r2, #0x3f00
	orreq r5, r5, #0xa000
_020AE4A4:
	tst r5, #0x20000
	orrne r2, r2, #0x10000
	tst r5, #0x80000
	orrne r2, r2, #0x40000
	tst r5, #0x200000
	orrne r2, r2, #0x100000
	tst r5, #0x800000
	orrne r2, r2, #0x400000
	mvn r1, r2
	and r1, r4, r1
	orr r2, r5, r1
	add r1, r3, #0x2000
	str r2, [r1, #0x264]
	bl sub_020D3A4C
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AE4E4: .word 0x021D5FEC
_020AE4E8: .word 0x00003FFE
	arm_func_end sub_020AE450

	arm_func_start sub_020AE4EC
sub_020AE4EC: ; 0x020AE4EC
	ldr r0, _020AE4F8 ; =0x021D5FEC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020AE4F8: .word 0x021D5FEC
	arm_func_end sub_020AE4EC

	arm_func_start sub_020AE4FC
sub_020AE4FC: ; 0x020AE4FC
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _020AE54C
	ldr r1, _020AE618 ; =0x021D5FEC
	mov r3, #3
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, #0x2000
	str r3, [r0, #0x26c]
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r2, [r0, #0x270]
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r2, [r0, #0x274]
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r2, [r0, #0x278]
	b _020AE604
_020AE54C:
	ldr r1, _020AE618 ; =0x021D5FEC
	ldr r2, [r5]
	ldr r0, [r1]
	and r2, r2, #3
	add r0, r0, #0x2000
	str r2, [r0, #0x26c]
	ldr r3, [r5, #4]
	ldr r0, [r5, #8]
	and r2, r3, #3
	rsb r2, r2, #4
	and r2, r2, #3
	add r2, r2, #0xc
	cmp r2, r0
	ldr r0, [r1]
	bls _020AE5A4
	mov r2, #0
	add r0, r0, #0x2000
	str r2, [r0, #0x270]
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r2, [r0, #0x274]
	b _020AE5F0
_020AE5A4:
	add r2, r3, #3
	bic r2, r2, #3
	add r0, r0, #0x2000
	str r2, [r0, #0x270]
	ldr r2, [r5, #4]
	ldr r0, [r1]
	and r2, r2, #3
	rsb r2, r2, #4
	ldr r3, [r5, #8]
	and r2, r2, #3
	sub r2, r3, r2
	add r0, r0, #0x2000
	str r2, [r0, #0x274]
	ldr r0, [r1]
	mov r1, #0
	add r2, r0, #0x2000
	ldr r0, [r2, #0x270]
	ldr r2, [r2, #0x274]
	bl sub_020D4994
_020AE5F0:
	ldr r0, _020AE618 ; =0x021D5FEC
	ldr r1, [r5, #0xc]
	ldr r0, [r0]
	add r0, r0, #0x2000
	str r1, [r0, #0x278]
_020AE604:
	ldr r0, _020AE618 ; =0x021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	str r4, [r0, #0x27c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AE618: .word 0x021D5FEC
	arm_func_end sub_020AE4FC

	arm_func_start sub_020AE61C
sub_020AE61C: ; 0x020AE61C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r2
	mov r4, r1
	bl sub_020AE450
	ldr r2, _020AE7A8 ; =0x021D5FEC
	mov r3, #0x400
	ldr r1, [r2]
	mov r0, #0
	add ip, r1, #0x1500
	add r1, r1, #0x2000
	str ip, [r1, #0x288]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r3, [r1, #0x8c]
	bl sub_020AE7D4
	ldr r1, _020AE7A8 ; =0x021D5FEC
	mov r2, #1
	mov r2, r2, lsl r0
	ldr r0, [r1]
	mov r2, r2, asr #1
	add r0, r0, #0x2200
	strh r2, [r0, #0x8e]
	ldr r0, [r1]
	add r0, r0, #0x2200
	ldrh r0, [r0, #0x68]
	cmp r0, #0
	bne _020AE690
	bl sub_020DF064
_020AE690:
	ldr r2, _020AE7A8 ; =0x021D5FEC
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0x90]
	ldr r1, [r2]
	add r0, r1, #0x2000
	ldr r0, [r0, #0x264]
	and r0, r0, #0x300000
	cmp r0, #0x300000
	movne r2, #1
	moveq r2, #0
	add r0, r1, #0x2200
	strh r2, [r0, #0x98]
	cmp r5, #0
	mov r2, #6
	bne _020AE6EC
	ldr r1, _020AE7A8 ; =0x021D5FEC
	ldr r0, _020AE7AC ; =0x02108FC0
	ldr r1, [r1]
	add r1, r1, #0x92
	add r1, r1, #0x2200
	bl sub_020D4A50
	b _020AE704
_020AE6EC:
	ldr r1, _020AE7A8 ; =0x021D5FEC
	mov r0, r5
	ldr r1, [r1]
	add r1, r1, #0x92
	add r1, r1, #0x2200
	bl sub_020D4A50
_020AE704:
	cmp r4, #0
	ldrne r0, _020AE7B0 ; =0x02108FC8
	mov r2, #0x20
	cmpne r4, r0
	bne _020AE748
	ldr r1, _020AE7A8 ; =0x021D5FEC
	ldr r0, _020AE7B0 ; =0x02108FC8
	ldr r1, [r1]
	add r1, r1, #0x29c
	add r1, r1, #0x2000
	bl sub_020D4A50
	ldr r0, _020AE7A8 ; =0x021D5FEC
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x9a]
	b _020AE790
_020AE748:
	ldr r1, _020AE7A8 ; =0x021D5FEC
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x29c
	add r1, r1, #0x2000
	bl sub_020D4A50
	mov r1, #0
_020AE764:
	ldrb r0, [r4]
	cmp r0, #0
	beq _020AE780
	add r1, r1, #1
	cmp r1, #0x20
	add r4, r4, #1
	blt _020AE764
_020AE780:
	ldr r0, _020AE7A8 ; =0x021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x9a]
_020AE790:
	ldr r0, _020AE7A8 ; =0x021D5FEC
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x2000
	str r1, [r0, #0x284]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AE7A8: .word 0x021D5FEC
_020AE7AC: .word 0x02108FC0
_020AE7B0: .word 0x02108FC8
	arm_func_end sub_020AE61C

	arm_func_start sub_020AE7B4
sub_020AE7B4: ; 0x020AE7B4
	ldr r0, _020AE7CC ; =0x021D5FEC
	ldr r1, _020AE7D0 ; =0x00AAA082
	ldr r0, [r0]
	add r0, r0, #0x2000
	str r1, [r0, #0x264]
	bx lr
	.align 2, 0
_020AE7CC: .word 0x021D5FEC
_020AE7D0: .word 0x00AAA082
	arm_func_end sub_020AE7B4

	arm_func_start sub_020AE7D4
sub_020AE7D4: ; 0x020AE7D4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020AE85C ; =0x021D5FEC
	ldr lr, _020AE860 ; =0x4EC4EC4F
	ldr r2, [r2]
	mov r1, r0
	add r2, r2, #0x2000
	ldr r7, [r2, #0x264]
	mov r6, #0
	mov r5, #1
	mov ip, #0xd
_020AE7FC:
	mov r2, r1, lsr #0x1f
	smull r3, r4, lr, r1
	add r4, r2, r4, asr #2
	smull r2, r3, ip, r4
	sub r4, r1, r2
	add r2, r4, #1
	tst r7, r5, lsl r2
	bne _020AE82C
	add r6, r6, #1
	cmp r6, #0xd
	add r1, r1, #1
	blt _020AE7FC
_020AE82C:
	add r3, r0, r6
	ldr r2, _020AE860 ; =0x4EC4EC4F
	mov r0, r3, lsr #0x1f
	smull r1, ip, r2, r3
	add ip, r0, ip, asr #2
	mov r2, #0xd
	smull r0, r1, r2, ip
	sub ip, r3, r0
	add r0, ip, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020AE85C: .word 0x021D5FEC
_020AE860: .word 0x4EC4EC4F
	arm_func_end sub_020AE7D4

	arm_func_start sub_020AE864
sub_020AE864: ; 0x020AE864
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _020AE8A4 ; =0x021D5FEC
	mov r5, r0
	ldr r0, [ip]
	mov r4, r1
	add r1, r0, #0x2200
	ldrsh r0, [r1, #0x80]
	mov ip, #0
	mov lr, r2
	strh ip, [r1, #0x80]
	str r3, [sp]
	mov r1, r5
	mov r2, r4
	mov r3, lr
	bl sub_020AE8A8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AE8A4: .word 0x021D5FEC
	arm_func_end sub_020AE864

	arm_func_start sub_020AE8A8
sub_020AE8A8: ; 0x020AE8A8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr ip, _020AE8F8 ; =0x021D5FEC
	ldr ip, [ip]
	add ip, ip, #0x2000
	ldr lr, [ip, #0x27c]
	cmp lr, #0
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, pc}
	ldr lr, [sp, #0x18]
	strh r0, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	str lr, [sp, #0xc]
	strh r1, [sp, #2]
	ldr r1, [ip, #0x27c]
	add r0, sp, #0
	blx r1
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AE8F8: .word 0x021D5FEC
	arm_func_end sub_020AE8A8

	arm_func_start sub_020AE8FC
sub_020AE8FC: ; 0x020AE8FC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020D3A38
	ldr r1, _020AE988 ; =0x021D5FEC
	mov r4, r0
	ldr r1, [r1]
	add r0, r1, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #9
	bne _020AE938
	cmp r5, #9
	beq _020AE938
	add r0, r1, #0x2cc
	add r0, r0, #0x2000
	bl sub_020D3854
_020AE938:
	ldr r0, _020AE988 ; =0x021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r1, [r0, #0x260]
	cmp r1, #0xb
	strne r5, [r0, #0x260]
	cmp r5, #9
	bne _020AE97C
	mov r2, #0
	ldr r0, _020AE988 ; =0x021D5FEC
	str r2, [sp]
	ldr r0, [r0]
	ldr r1, _020AE98C ; =0x022F5341
	add r0, r0, #0x2cc
	ldr r3, _020AE990 ; =sub_020AEA08
	add r0, r0, #0x2000
	bl sub_020D37E8
_020AE97C:
	mov r0, r4
	bl sub_020D3A4C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AE988: .word 0x021D5FEC
_020AE98C: .word 0x022F5341
_020AE990: .word sub_020AEA08
	arm_func_end sub_020AE8FC

	arm_func_start sub_020AE994
sub_020AE994: ; 0x020AE994
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	bl sub_020D3A38
	ldr r1, _020AE9FC ; =0x021D5FEC
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x2cc
	add r0, r0, #0x2000
	bl sub_020D3854
	ldr r0, _020AE9FC ; =0x021D5FEC
	ldr r1, [r0]
	add r0, r1, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #9
	bne _020AE9EC
	add r0, r1, #0x2cc
	mov r2, #0
	ldr r1, _020AEA00 ; =0x022F5341
	ldr r3, _020AEA04 ; =sub_020AEA08
	add r0, r0, #0x2000
	str r2, [sp]
	bl sub_020D37E8
_020AE9EC:
	mov r0, r4
	bl sub_020D3A4C
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020AE9FC: .word 0x021D5FEC
_020AEA00: .word 0x022F5341
_020AEA04: .word sub_020AEA08
	arm_func_end sub_020AE994

	arm_func_start sub_020AEA08
sub_020AEA08: ; 0x020AEA08
	stmdb sp!, {r3, lr}
	bl sub_020AFEB0
	bl sub_020AE994
	ldmia sp!, {r3, pc}
	arm_func_end sub_020AEA08

	arm_func_start sub_020AEA18
sub_020AEA18: ; 0x020AEA18
	mov r1, r0
	mov r0, #0
	mov r3, #1
_020AEA24:
	clz r2, r1
	rsbs r2, r2, #0x1f
	blo _020AEA34
	b _020AEA38
_020AEA34:
	bx lr
_020AEA38:
	bic r1, r1, r3, lsl r2
	add r0, r0, #1
	b _020AEA24
	arm_func_end sub_020AEA18

	arm_func_start sub_020AEA44
sub_020AEA44: ; 0x020AEA44
	clz r0, r0
	bx lr
	arm_func_end sub_020AEA44

	arm_func_start sub_020AEA4C
sub_020AEA4C: ; 0x020AEA4C
	stmdb sp!, {r3, lr}
	ldr r0, _020AEAA0 ; =0x021D5FEC
	ldr r0, [r0]
	add r1, r0, #0x2000
	ldrb r0, [r1, #0x26b]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	ldr r0, _020AEAA4 ; =sub_020AF690
	strb r2, [r1, #0x26b]
	bl sub_020DF480
	cmp r0, #2
	ldmeqia sp!, {r3, pc}
	mov r0, #0xb
	bl sub_020AE8FC
	mov r1, #0
	mov r2, r1
	mov r0, #7
	mov r3, #0x610
	bl sub_020AE864
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AEAA0: .word 0x021D5FEC
_020AEAA4: .word sub_020AF690
	arm_func_end sub_020AEA4C

	arm_func_start sub_020AEAA8
sub_020AEAA8: ; 0x020AEAA8
	stmdb sp!, {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #8
	ldreqh r1, [r0, #4]
	cmpeq r1, #0x16
	ldreqh r0, [r0, #6]
	cmpeq r0, #0x25
	ldmneia sp!, {r3, pc}
	ldr r0, _020AEB1C ; =0x021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	sub r0, r0, #8
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_020AEAE8: ; jump table
	b _020AEAFC ; case 0
	b _020AEB08 ; case 1
	b _020AEB10 ; case 2
	ldmia sp!, {r3, pc} ; case 3
	b _020AEB08 ; case 4
_020AEAFC:
	mov r0, #0xc
	bl sub_020AE8FC
	ldmia sp!, {r3, pc}
_020AEB08:
	bl sub_020AEA4C
	ldmia sp!, {r3, pc}
_020AEB10:
	mov r0, #0xc
	bl sub_020AE8FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AEB1C: .word 0x021D5FEC
	arm_func_end sub_020AEAA8

	arm_func_start sub_020AEB20
sub_020AEB20: ; 0x020AEB20
	stmdb sp!, {r3, lr}
	ldrh r1, [r0, #2]
	mov r2, #0x14
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _020AED80
_020AEB38: ; jump table
	b _020AEB4C ; case 0
	b _020AED48 ; case 1
	b _020AED80 ; case 2
	b _020AED80 ; case 3
	b _020AED80 ; case 4
_020AEB4C:
	ldrh r0, [r0]
	cmp r0, #0x19
	bgt _020AEB84
	bge _020AEC48
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _020AECC0
_020AEB68: ; jump table
	b _020AECC0 ; case 0
	b _020AECC0 ; case 1
	b _020AECC0 ; case 2
	b _020AEBA0 ; case 3
	b _020AEBB0 ; case 4
	b _020AEC04 ; case 5
	b _020AEC24 ; case 6
_020AEB84:
	cmp r0, #0x1d
	bgt _020AEB94
	beq _020AEC34
	b _020AECC0
_020AEB94:
	cmp r0, #0x27
	beq _020AEC70
	b _020AECC0
_020AEBA0:
	ldr r0, _020AEDB8 ; =sub_020AEB20
	bl sub_020DF378
	mov r2, r0
	b _020AECC0
_020AEBB0:
	bl sub_020DE458
	cmp r0, #0
	beq _020AEBC4
	cmp r0, #4
	b _020AEBE4
_020AEBC4:
	mov r0, #1
	bl sub_020AE8FC
	mov r0, #0
	ldr r3, _020AEDBC ; =0x00000663
	mov r1, r0
	mov r2, r0
	bl sub_020AE864
	ldmia sp!, {r3, pc}
_020AEBE4:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r1, #0
	ldr r3, _020AEDC0 ; =0x0000066C
	mov r2, r1
	mov r0, #7
	bl sub_020AE864
	ldmia sp!, {r3, pc}
_020AEC04:
	mov r0, #3
	bl sub_020AE8FC
	mov r0, #0
	ldr r3, _020AEDC4 ; =0x00000673
	mov r1, r0
	mov r2, r0
	bl sub_020AE864
	ldmia sp!, {r3, pc}
_020AEC24:
	ldr r0, _020AEDB8 ; =sub_020AEB20
	bl sub_020DF338
	mov r2, r0
	b _020AECC0
_020AEC34:
	ldr r0, _020AEDB8 ; =sub_020AEB20
	mov r1, #0
	bl sub_020E0E44
	mov r2, r0
	b _020AECC0
_020AEC48:
	ldr r1, _020AEDC8 ; =0x021D5FEC
	ldr r0, _020AEDB8 ; =sub_020AEB20
	ldr r3, [r1]
	add r2, r3, #0x2000
	ldrb r1, [r2, #0x250]
	ldrb r2, [r2, #0x251]
	add r3, r3, #0x2200
	bl sub_020E0D10
	mov r2, r0
	b _020AECC0
_020AEC70:
	ldr r0, _020AEDC8 ; =0x021D5FEC
	ldr r2, [r0]
	add r0, r2, #0x2000
	ldr r1, [r0, #0x264]
	and r0, r1, #0xc0000
	cmp r0, #0xc0000
	moveq r0, #1
	movne r0, #0
	mov r0, r0, lsl #0x10
	mov ip, r0, lsr #0x10
	and r1, r1, #0x30000
	cmp r1, #0x30000
	movne r3, #1
	add r1, r2, #0x2140
	ldr r0, _020AEDCC ; =sub_020AF138
	moveq r3, #0
	mov r2, #0
	str ip, [sp]
	bl sub_020DF94C
	mov r2, r0
_020AECC0:
	cmp r2, #2
	ldmeqia sp!, {r3, pc}
	cmp r2, #3
	beq _020AED10
	cmp r2, #8
	bne _020AED10
	mov r0, #0xc
	bl sub_020AE8FC
	ldr r0, _020AEDC8 ; =0x021D5FEC
	mov r2, #0
	ldr r1, [r0]
	add r0, r1, #0x2200
	ldrsh r0, [r0, #0x80]
	cmp r0, #5
	addeq r1, r1, #0x2140
	mov r0, #1
	movne r1, #0
	rsb r3, r0, #0x6b0
	bl sub_020AE864
	ldmia sp!, {r3, pc}
_020AED10:
	mov r0, #0xb
	bl sub_020AE8FC
	ldr r0, _020AEDC8 ; =0x021D5FEC
	ldr r3, _020AEDD0 ; =0x000006B8
	ldr r1, [r0]
	mov r2, #0
	add r0, r1, #0x2200
	ldrsh r0, [r0, #0x80]
	cmp r0, #5
	addeq r1, r1, #0x2140
	movne r1, #0
	mov r0, #7
	bl sub_020AE864
	ldmia sp!, {r3, pc}
_020AED48:
	mov r0, #0xc
	bl sub_020AE8FC
	ldr r0, _020AEDC8 ; =0x021D5FEC
	ldr r3, _020AEDD4 ; =0x000006DE
	ldr r1, [r0]
	mov r2, #0
	add r0, r1, #0x2200
	ldrsh r0, [r0, #0x80]
	cmp r0, #5
	addeq r1, r1, #0x2140
	movne r1, #0
	mov r0, #1
	bl sub_020AE864
	ldmia sp!, {r3, pc}
_020AED80:
	mov r0, #0xb
	bl sub_020AE8FC
	ldr r0, _020AEDC8 ; =0x021D5FEC
	ldr r3, _020AEDD8 ; =0x000006E8
	ldr r1, [r0]
	mov r2, #0
	add r0, r1, #0x2200
	ldrsh r0, [r0, #0x80]
	cmp r0, #5
	addeq r1, r1, #0x2140
	movne r1, #0
	mov r0, #7
	bl sub_020AE864
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AEDB8: .word sub_020AEB20
_020AEDBC: .word 0x00000663
_020AEDC0: .word 0x0000066C
_020AEDC4: .word 0x00000673
_020AEDC8: .word 0x021D5FEC
_020AEDCC: .word sub_020AF138
_020AEDD0: .word 0x000006B8
_020AEDD4: .word 0x000006DE
_020AEDD8: .word 0x000006E8
	arm_func_end sub_020AEB20

	arm_func_start sub_020AEDDC
sub_020AEDDC: ; 0x020AEDDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r5, r0
	ldrh r0, [r5, #2]
	mov r4, #0x14
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020AF074
_020AEDFC: ; jump table
	b _020AEE10 ; case 0
	b _020AF068 ; case 1
	b _020AF074 ; case 2
	b _020AF074 ; case 3
	b _020AF074 ; case 4
_020AEE10:
	ldr r0, _020AF098 ; =0x021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #5
	bne _020AEE44
	mov r0, #6
	bl sub_020AE8FC
	mov r0, #0
	ldr r3, _020AF09C ; =0x00000704
	mov r1, r0
	mov r2, r0
	bl sub_020AE864
_020AEE44:
	ldr r1, _020AF098 ; =0x021D5FEC
	ldr r2, [r1]
	add r0, r2, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #6
	beq _020AEE70
	cmp r0, #7
	beq _020AEFE8
	cmp r0, #0xd
	beq _020AEFF8
	b _020AF004
_020AEE70:
	add r0, r2, #0x2200
	mov r2, #7
	strh r2, [r0, #0x80]
	ldrh r0, [r5, #8]
	cmp r0, #5
	bne _020AEEFC
	ldr r0, [r1]
	add r1, r0, #0x2200
	add r0, r0, #0x2000
	ldrh r1, [r1, #0x8c]
	ldr r0, [r0, #0x288]
	bl sub_020D285C
	ldrh r0, [r5, #0xe]
	mov r4, #0
	cmp r0, #0
	ble _020AEEFC
	ldr r8, _020AF0A0 ; =0x0000071A
	mov r7, #7
	mov r6, r4
_020AEEBC:
	add r0, r5, r4, lsl #1
	add r2, r5, r4, lsl #2
	ldrh r1, [r0, #0x50]
	ldr r0, [r2, #0x10]
	bl sub_020AFB3C
	str r8, [sp]
	add r0, r5, r4, lsl #2
	ldr r2, [r0, #0x10]
	mov r0, r7
	mov r1, r6
	mov r3, r5
	bl sub_020AE8A8
	ldrh r0, [r5, #0xe]
	add r4, r4, #1
	cmp r4, r0
	blt _020AEEBC
_020AEEFC:
	ldr r0, _020AF098 ; =0x021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r1, [r0, #0x264]
	and r0, r1, #0xc00000
	cmp r0, #0xc00000
	bne _020AEF68
	ldr r0, _020AF0A4 ; =0x00003FFE
	and r0, r1, r0
	bl sub_020AEA18
	movs r1, r0
	beq _020AEF68
	ldr r0, _020AF098 ; =0x021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r6, [r0, #0x284]
	mov r0, r6
	bl _u32_div_f
	cmp r1, #0
	bne _020AEF68
	ldr r4, _020AF0A8 ; =0x00000728
	mov r1, #0
	mov r2, r6
	mov r3, r1
	mov r0, #8
	str r4, [sp]
	bl sub_020AE8A8
_020AEF68:
	ldrh r0, [r5, #0xa]
	bl sub_020AEA44
	rsb r0, r0, #0x20
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_020AE7D4
	ldr r1, _020AF098 ; =0x021D5FEC
	mov r2, #1
	mov r2, r2, lsl r0
	ldr r0, [r1]
	mov r2, r2, asr #1
	add r0, r0, #0x2200
	strh r2, [r0, #0x8e]
	ldr r0, [r1]
	add r1, r0, #0x2200
	add r0, r0, #0x2000
	ldrh r1, [r1, #0x8c]
	ldr r0, [r0, #0x288]
	bl sub_020D285C
	ldr r2, _020AF098 ; =0x021D5FEC
	ldr r0, _020AF0AC ; =sub_020AEDDC
	ldr r1, [r2]
	add r1, r1, #0x2000
	ldr r3, [r1, #0x284]
	add r3, r3, #1
	str r3, [r1, #0x284]
	ldr r1, [r2]
	add r1, r1, #0x288
	add r1, r1, #0x2000
	bl sub_020DF7BC
	mov r4, r0
	b _020AF004
_020AEFE8:
	ldr r0, _020AF0B0 ; =sub_020AF0C0
	bl sub_020DF90C
	mov r4, r0
	b _020AF004
_020AEFF8:
	bl sub_020AEA4C
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020AF004:
	cmp r4, #2
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	cmp r4, #3
	beq _020AF044
	cmp r4, #8
	bne _020AF044
	mov r0, #0xc
	bl sub_020AE8FC
	mov r1, #0
	ldr r3, _020AF0B4 ; =0x00000753
	mov r2, r1
	mov r0, #1
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020AF044:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r1, #0
	ldr r3, _020AF0B8 ; =0x0000075C
	mov r2, r1
	mov r0, #7
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020AF068:
	bl sub_020AEA4C
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020AF074:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r1, #0
	ldr r3, _020AF0BC ; =0x0000076D
	mov r2, r1
	mov r0, #7
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020AF098: .word 0x021D5FEC
_020AF09C: .word 0x00000704
_020AF0A0: .word 0x0000071A
_020AF0A4: .word 0x00003FFE
_020AF0A8: .word 0x00000728
_020AF0AC: .word sub_020AEDDC
_020AF0B0: .word sub_020AF0C0
_020AF0B4: .word 0x00000753
_020AF0B8: .word 0x0000075C
_020AF0BC: .word 0x0000076D
	arm_func_end sub_020AEDDC

	arm_func_start sub_020AF0C0
sub_020AF0C0: ; 0x020AF0C0
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020AF110
_020AF0D4: ; jump table
	b _020AF0E8 ; case 0
	b _020AF108 ; case 1
	b _020AF110 ; case 2
	b _020AF110 ; case 3
	b _020AF110 ; case 4
_020AF0E8:
	mov r0, #3
	bl sub_020AE8FC
	mov r0, #0
	ldr r3, _020AF130 ; =0x00000783
	mov r1, r0
	mov r2, r0
	bl sub_020AE864
	ldmia sp!, {r3, pc}
_020AF108:
	bl sub_020AEA4C
	ldmia sp!, {r3, pc}
_020AF110:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r1, #0
	ldr r3, _020AF134 ; =0x00000793
	mov r2, r1
	mov r0, #7
	bl sub_020AE864
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AF130: .word 0x00000783
_020AF134: .word 0x00000793
	arm_func_end sub_020AF0C0

	arm_func_start sub_020AF138
sub_020AF138: ; 0x020AF138
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _020AF358
_020AF150: ; jump table
	b _020AF184 ; case 0
	b _020AF334 ; case 1
	b _020AF358 ; case 2
	b _020AF358 ; case 3
	b _020AF358 ; case 4
	b _020AF358 ; case 5
	b _020AF348 ; case 6
	b _020AF358 ; case 7
	b _020AF358 ; case 8
	b _020AF358 ; case 9
	b _020AF358 ; case 10
	b _020AF348 ; case 11
	b _020AF348 ; case 12
_020AF184:
	ldrh r0, [r4, #8]
	cmp r0, #9
	bgt _020AF1C4
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _020AF30C
_020AF19C: ; jump table
	b _020AF30C ; case 0
	b _020AF30C ; case 1
	b _020AF30C ; case 2
	b _020AF30C ; case 3
	b _020AF30C ; case 4
	b _020AF30C ; case 5
	ldmia sp!, {r4, pc} ; case 6
	b _020AF240 ; case 7
	b _020AF1D0 ; case 8
	b _020AF1D0 ; case 9
_020AF1C4:
	cmp r0, #0x1a
	ldmeqia sp!, {r4, pc}
	b _020AF30C
_020AF1D0:
	ldr r1, _020AF380 ; =0x021D5FEC
	ldr r2, [r1]
	add r0, r2, #0x2000
	ldr r0, [r0, #0x260]
	sub r0, r0, #8
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, pc}
_020AF1F0: ; jump table
	b _020AF210 ; case 0
	b _020AF21C ; case 1
	b _020AF204 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	b _020AF238 ; case 4
_020AF204:
	add r0, r2, #0x2200
	mov r1, #0
	strh r1, [r0, #0x82]
_020AF210:
	mov r0, #0xc
	bl sub_020AE8FC
	ldmia sp!, {r4, pc}
_020AF21C:
	add r0, r2, #0x2200
	mov r2, #0
	strh r2, [r0, #0x82]
	ldr r0, [r1]
	mov r1, #6
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
_020AF238:
	bl sub_020AEA4C
	ldmia sp!, {r4, pc}
_020AF240:
	ldr r1, _020AF380 ; =0x021D5FEC
	ldr r3, [r1]
	add r0, r3, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #0xc
	bne _020AF268
	mov r0, #8
	bl sub_020AE8FC
	bl sub_020AEA4C
	ldmia sp!, {r4, pc}
_020AF268:
	ldrh r2, [r4, #0xa]
	cmp r2, #1
	blo _020AF304
	ldr r0, _020AF384 ; =0x000007D7
	cmp r2, r0
	bhi _020AF304
	add r0, r3, #0x2200
	strh r2, [r0, #0x82]
	ldr r1, [r1]
	ldr r0, _020AF388 ; =sub_020AF464
	add r1, r1, #0x1500
	mov r2, #0x620
	bl sub_020DFF1C
	cmp r0, #2
	ldmeqia sp!, {r4, pc}
	cmp r0, #3
	beq _020AF2DC
	cmp r0, #8
	bne _020AF2DC
	mov r0, #0xc
	bl sub_020AE8FC
	ldr r0, _020AF380 ; =0x021D5FEC
	ldr r3, _020AF38C ; =0x000007ED
	ldr r1, [r0]
	mov r0, #1
	add r1, r1, #0x2140
	mov r2, #0
	bl sub_020AE864
	ldmia sp!, {r4, pc}
_020AF2DC:
	mov r0, #0xb
	bl sub_020AE8FC
	ldr r0, _020AF380 ; =0x021D5FEC
	ldr r3, _020AF390 ; =0x000007F6
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl sub_020AE864
	ldmia sp!, {r4, pc}
_020AF304:
	bl sub_020AEA4C
	ldmia sp!, {r4, pc}
_020AF30C:
	mov r0, #0xb
	bl sub_020AE8FC
	ldr r0, _020AF380 ; =0x021D5FEC
	ldrh r2, [r4, #8]
	ldr r0, [r0]
	ldr r3, _020AF394 ; =0x00000804
	add r1, r0, #0x2140
	mov r0, #7
	bl sub_020AE864
	ldmia sp!, {r4, pc}
_020AF334:
	ldr r0, _020AF380 ; =0x021D5FEC
	ldrh r1, [r4, #0xe]
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0xf8]
_020AF348:
	mov r0, #8
	bl sub_020AE8FC
	bl sub_020AEA4C
	ldmia sp!, {r4, pc}
_020AF358:
	mov r0, #0xb
	bl sub_020AE8FC
	ldr r0, _020AF380 ; =0x021D5FEC
	ldr r3, _020AF398 ; =0x0000081B
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl sub_020AE864
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AF380: .word 0x021D5FEC
_020AF384: .word 0x000007D7
_020AF388: .word sub_020AF464
_020AF38C: .word 0x000007ED
_020AF390: .word 0x000007F6
_020AF394: .word 0x00000804
_020AF398: .word 0x0000081B
	arm_func_end sub_020AF138

	arm_func_start sub_020AF39C
sub_020AF39C: ; 0x020AF39C
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020AF430
_020AF3B0: ; jump table
	b _020AF3C4 ; case 0
	b _020AF420 ; case 1
	b _020AF430 ; case 2
	b _020AF420 ; case 3
	b _020AF430 ; case 4
_020AF3C4:
	ldr r0, _020AF458 ; =0x021D5FEC
	ldr r1, [r0]
	add r0, r1, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #0xc
	bne _020AF3EC
	mov r0, #0xa
	bl sub_020AE8FC
	bl sub_020AEA4C
	ldmia sp!, {r3, pc}
_020AF3EC:
	add r1, r1, #0x2200
	mov r2, #0
	mov r0, #3
	strh r2, [r1, #0x82]
	bl sub_020AE8FC
	ldr r1, _020AF458 ; =0x021D5FEC
	mov r0, #0
	ldr r1, [r1]
	ldr r3, _020AF45C ; =0x0000083D
	mov r2, r0
	add r1, r1, #0x2140
	bl sub_020AE864
	ldmia sp!, {r3, pc}
_020AF420:
	mov r0, #0xa
	bl sub_020AE8FC
	bl sub_020AEA4C
	ldmia sp!, {r3, pc}
_020AF430:
	mov r0, #0xb
	bl sub_020AE8FC
	ldr r0, _020AF458 ; =0x021D5FEC
	ldr r3, _020AF460 ; =0x0000084F
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl sub_020AE864
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AF458: .word 0x021D5FEC
_020AF45C: .word 0x0000083D
_020AF460: .word 0x0000084F
	arm_func_end sub_020AF39C

	arm_func_start sub_020AF464
sub_020AF464: ; 0x020AF464
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _020AF480
	cmp r0, #4
	b _020AF53C
_020AF480:
	ldrh r0, [r4, #4]
	cmp r0, #0xe
	beq _020AF498
	cmp r0, #0xf
	beq _020AF4E8
	b _020AF514
_020AF498:
	ldr r0, _020AF564 ; =0x021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #0xc
	bne _020AF4C0
	mov r0, #8
	bl sub_020AE8FC
	bl sub_020AEA4C
	ldmia sp!, {r4, pc}
_020AF4C0:
	mov r0, #9
	bl sub_020AE8FC
	ldr r1, _020AF564 ; =0x021D5FEC
	mov r0, #0
	ldr r1, [r1]
	ldr r3, _020AF568 ; =0x00000872
	mov r2, r0
	add r1, r1, #0x2140
	bl sub_020AE864
	ldmia sp!, {r4, pc}
_020AF4E8:
	ldr r0, [r4, #8]
	ldrh r0, [r0, #0xe]
	mov r0, r0, asr #8
	and r0, r0, #0xff
	bl sub_020B036C
	ldr r0, [r4, #8]
	mov r1, #0x620
	bl sub_020D285C
	ldr r0, [r4, #8]
	bl sub_020AFE7C
	ldmia sp!, {r4, pc}
_020AF514:
	mov r0, #0xb
	bl sub_020AE8FC
	ldr r0, _020AF564 ; =0x021D5FEC
	ldrh r2, [r4, #4]
	ldr r0, [r0]
	ldr r3, _020AF56C ; =0x00000881
	add r1, r0, #0x2140
	mov r0, #7
	bl sub_020AE864
	ldmia sp!, {r4, pc}
_020AF53C:
	mov r0, #0xb
	bl sub_020AE8FC
	ldr r0, _020AF564 ; =0x021D5FEC
	ldr r3, _020AF570 ; =0x0000088C
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl sub_020AE864
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AF564: .word 0x021D5FEC
_020AF568: .word 0x00000872
_020AF56C: .word 0x00000881
_020AF570: .word 0x0000088C
	arm_func_end sub_020AF464

	arm_func_start sub_020AF574
sub_020AF574: ; 0x020AF574
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020AF658
_020AF588: ; jump table
	b _020AF59C ; case 0
	b _020AF648 ; case 1
	b _020AF658 ; case 2
	b _020AF648 ; case 3
	b _020AF658 ; case 4
_020AF59C:
	ldr r0, _020AF680 ; =0x021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #0xc
	bne _020AF5C4
	mov r0, #0xa
	bl sub_020AE8FC
	bl sub_020AEA4C
	ldmia sp!, {r3, pc}
_020AF5C4:
	ldr r0, _020AF684 ; =sub_020AF39C
	mov r1, #0
	bl sub_020DFA18
	cmp r0, #2
	ldmeqia sp!, {r3, pc}
	cmp r0, #3
	beq _020AF610
	cmp r0, #8
	bne _020AF620
	mov r0, #0xc
	bl sub_020AE8FC
	ldr r0, _020AF680 ; =0x021D5FEC
	ldr r3, _020AF688 ; =0x000008B4
	ldr r1, [r0]
	mov r0, #1
	add r1, r1, #0x2140
	mov r2, #0
	bl sub_020AE864
	ldmia sp!, {r3, pc}
_020AF610:
	mov r0, #0xa
	bl sub_020AE8FC
	bl sub_020AEA4C
	ldmia sp!, {r3, pc}
_020AF620:
	mov r0, #0xb
	bl sub_020AE8FC
	ldr r1, _020AF680 ; =0x021D5FEC
	mov r0, #7
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x2140
	mov r3, #0x8c0
	bl sub_020AE864
	ldmia sp!, {r3, pc}
_020AF648:
	mov r0, #0xa
	bl sub_020AE8FC
	bl sub_020AEA4C
	ldmia sp!, {r3, pc}
_020AF658:
	mov r0, #0xb
	bl sub_020AE8FC
	ldr r0, _020AF680 ; =0x021D5FEC
	ldr r3, _020AF68C ; =0x000008D3
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl sub_020AE864
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AF680: .word 0x021D5FEC
_020AF684: .word sub_020AF39C
_020AF688: .word 0x000008B4
_020AF68C: .word 0x000008D3
	arm_func_end sub_020AF574

	arm_func_start sub_020AF690
sub_020AF690: ; 0x020AF690
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _020AF968
	ldr r2, _020AF98C ; =0x021D5FEC
	mov r0, #0
	ldr r1, [r2]
	add r1, r1, #0x2000
	strb r0, [r1, #0x26b]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0x82]
	ldr r3, [r2]
	add r1, r3, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #0xd
	addls pc, pc, r1, lsl #2
	b _020AF938
_020AF6DC: ; jump table
	b _020AF938 ; case 0
	b _020AF938 ; case 1
	b _020AF938 ; case 2
	b _020AF938 ; case 3
	b _020AF938 ; case 4
	b _020AF714 ; case 5
	b _020AF714 ; case 6
	b _020AF738 ; case 7
	b _020AF75C ; case 8
	b _020AF874 ; case 9
	b _020AF8A0 ; case 10
	b _020AF938 ; case 11
	b _020AF874 ; case 12
	b _020AF8CC ; case 13
_020AF714:
	mov r0, #3
	bl sub_020AE8FC
	mov r1, #0
	ldr r3, _020AF990 ; =0x000008F5
	mov r2, r1
	mov r0, #1
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF738:
	mov r0, #3
	bl sub_020AE8FC
	mov r0, #0
	ldr r3, _020AF994 ; =0x000008FB
	mov r1, r0
	mov r2, r0
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF75C:
	add r1, r3, #0x2200
	ldrh r4, [r1, #0xf8]
	strh r0, [r1, #0xf8]
	cmp r4, #0x12
	bne _020AF848
	ldr r1, [r2]
	add r1, r1, #0x2100
	ldrh r3, [r1, #0x70]
	and ip, r3, #0x24
	cmp ip, #0x24
	beq _020AF848
	orr r3, r3, #0x24
	strh r3, [r1, #0x70]
	ldr lr, [r2]
	add r1, lr, #0x2000
	ldr r2, [r1, #0x264]
	and r1, r2, #0xc0000
	cmp r1, #0xc0000
	moveq r0, #1
	and r1, r2, #0x30000
	cmp r1, #0x30000
	mov r0, r0, lsl #0x10
	mov ip, r0, lsr #0x10
	movne r3, #1
	ldr r0, _020AF998 ; =sub_020AF138
	moveq r3, #0
	add r1, lr, #0x2140
	mov r2, #0
	str ip, [sp]
	bl sub_020DF94C
	cmp r0, #2
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	cmp r0, #3
	beq _020AF81C
	cmp r0, #8
	bne _020AF81C
	mov r0, #0xc
	bl sub_020AE8FC
	ldr r0, _020AF98C ; =0x021D5FEC
	ldr r3, _020AF99C ; =0x0000091C
	ldr r0, [r0]
	mov r2, r4
	add r1, r0, #0x2140
	mov r0, #1
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF81C:
	mov r0, #0xb
	bl sub_020AE8FC
	ldr r0, _020AF98C ; =0x021D5FEC
	ldr r3, _020AF9A0 ; =0x00000925
	ldr r0, [r0]
	mov r2, r4
	add r1, r0, #0x2140
	mov r0, #7
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF848:
	mov r0, #3
	bl sub_020AE8FC
	ldr r0, _020AF98C ; =0x021D5FEC
	ldr r3, _020AF9A4 ; =0x0000092D
	ldr r0, [r0]
	mov r2, r4
	add r1, r0, #0x2140
	mov r0, #1
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF874:
	mov r0, #3
	bl sub_020AE8FC
	ldr r0, _020AF98C ; =0x021D5FEC
	ldr r3, _020AF9A8 ; =0x00000935
	ldr r1, [r0]
	mov r0, #0
	add r1, r1, #0x2140
	mov r2, #1
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF8A0:
	mov r0, #3
	bl sub_020AE8FC
	ldr r1, _020AF98C ; =0x021D5FEC
	mov r0, #0
	ldr r1, [r1]
	ldr r3, _020AF9AC ; =0x0000093C
	mov r2, r0
	add r1, r1, #0x2140
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF8CC:
	ldr r0, _020AF9B0 ; =sub_020AEB20
	bl sub_020DF3B8
	cmp r0, #2
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	cmp r0, #3
	beq _020AF914
	cmp r0, #8
	bne _020AF914
	mov r0, #0xc
	bl sub_020AE8FC
	mov r1, #0
	ldr r3, _020AF9B4 ; =0x0000094A
	mov r2, r1
	mov r0, #1
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF914:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r1, #0
	ldr r3, _020AF9B8 ; =0x00000953
	mov r2, r1
	mov r0, #7
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF938:
	mov r0, #0xb
	bl sub_020AE8FC
	ldr r1, _020AF98C ; =0x021D5FEC
	mov r0, #7
	ldr r1, [r1]
	rsb r3, r0, #0x960
	add r1, r1, #0x2000
	ldr r2, [r1, #0x260]
	mov r1, #0
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF968:
	mov r0, #0xb
	bl sub_020AE8FC
	mov r1, #0
	mov r2, r1
	mov r0, #7
	mov r3, #0x960
	bl sub_020AE864
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020AF98C: .word 0x021D5FEC
_020AF990: .word 0x000008F5
_020AF994: .word 0x000008FB
_020AF998: .word sub_020AF138
_020AF99C: .word 0x0000091C
_020AF9A0: .word 0x00000925
_020AF9A4: .word 0x0000092D
_020AF9A8: .word 0x00000935
_020AF9AC: .word 0x0000093C
_020AF9B0: .word sub_020AEB20
_020AF9B4: .word 0x0000094A
_020AF9B8: .word 0x00000953
	arm_func_end sub_020AF690

	arm_func_start sub_020AF9BC
sub_020AF9BC: ; 0x020AF9BC
	stmdb sp!, {r4, lr}
	bl sub_020D3A38
	mov r4, r0
	bl sub_020AE4EC
	cmp r0, #0
	bne _020AF9E0
	mov r0, r4
	bl sub_020D3A4C
	ldmia sp!, {r4, pc}
_020AF9E0:
	add r1, r0, #0x2000
	ldr r0, [r1, #0x270]
	cmp r0, #0
	beq _020AFA04
	ldr r2, [r1, #0x274]
	cmp r2, #0
	ble _020AFA04
	mov r1, #0
	bl sub_020D4994
_020AFA04:
	mov r0, r4
	bl sub_020D3A4C
	ldmia sp!, {r4, pc}
	arm_func_end sub_020AF9BC

	arm_func_start sub_020AFA10
sub_020AFA10: ; 0x020AFA10
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_020D3A38
	mov r4, r0
	bl sub_020AE4EC
	cmp r0, #0
	mov r5, #0
	bne _020AFA3C
	mov r0, r4
	bl sub_020D3A4C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_020AFA3C:
	add r0, r0, #0x2000
	ldr r1, [r0, #0x270]
	cmp r1, #0
	beq _020AFA58
	ldr r0, [r0, #0x274]
	cmp r0, #0xc
	ldrhi r5, [r1]
_020AFA58:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020AFA10

	arm_func_start sub_020AFA68
sub_020AFA68: ; 0x020AFA68
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020D3A38
	mov r4, r0
	bl sub_020AE4EC
	cmp r0, #0
	bne _020AFA94
	mov r0, r4
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AFA94:
	add r1, r0, #0x2000
	cmp r5, #0
	ldrb r1, [r1, #0x26a]
	beq _020AFABC
	cmp r1, #0
	movne r5, #1
	moveq r5, #0
	add r0, r0, #0x2000
	mov r1, #1
	b _020AFAD0
_020AFABC:
	cmp r1, #0
	movne r5, #1
	moveq r5, #0
	add r0, r0, #0x2000
	mov r1, #0
_020AFAD0:
	strb r1, [r0, #0x26a]
	mov r0, r4
	bl sub_020D3A4C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020AFA68

	arm_func_start sub_020AFAE4
sub_020AFAE4: ; 0x020AFAE4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_020D3A38
	mov r5, r0
	bl sub_020AE4EC
	cmp r0, #0
	bne _020AFB10
	mov r0, r5
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AFB10:
	mov r0, r4
	bl sub_020AFD30
	movs r4, r0
	mov r0, r5
	bne _020AFB30
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AFB30:
	bl sub_020D3A4C
	add r0, r4, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020AFAE4

	arm_func_start sub_020AFB3C
sub_020AFB3C: ; 0x020AFB3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020AE4EC
	movs r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r6, #0x2000
	ldrb r0, [r0, #0x26a]
	cmp r0, #0
	ldreqh r0, [r5, #0x3c]
	cmpeq r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r5, #4
	bl sub_020AFCC4
	movs r7, r0
	bne _020AFB84
	bl sub_020AFBC8
	mov r7, r0
_020AFB84:
	cmp r7, #0
	addeq r0, r6, #0x2000
	ldreq r0, [r0, #0x278]
	cmpeq r0, #1
	bne _020AFBA0
	bl sub_020AFC94
	mov r7, r0
_020AFBA0:
	cmp r7, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	add r1, r7, #0x10
	mov r2, #0xc0
	strh r4, [r7, #2]
	bl sub_020D48B4
	mov r0, r7
	bl sub_020AFD80
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020AFB3C

	arm_func_start sub_020AFBC8
sub_020AFBC8: ; 0x020AFBC8
	stmdb sp!, {r4, lr}
	bl sub_020AE4EC
	add r2, r0, #0x2000
	ldr r1, [r2, #0x270]
	mov r0, #0
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, [r2, #0x274]
	cmp r3, #0xc
	ldmlsia sp!, {r4, pc}
	ldr r2, _020AFC90 ; =0x4EC4EC4F
	sub r3, r3, #0xc
	umull r2, ip, r3, r2
	movs ip, ip, lsr #6
	ldmeqia sp!, {r4, pc}
	ldr r2, [r1]
	cmp ip, r2
	ldmlsia sp!, {r4, pc}
	mov lr, r0
	cmp ip, #0
	bls _020AFC44
	add r4, r1, #0xc
	mov r2, #0xd0
_020AFC24:
	mul r0, lr, r2
	ldrb r3, [r4, r0]
	add r0, r4, r0
	cmp r3, #0
	beq _020AFC44
	add lr, lr, #1
	cmp lr, ip
	blo _020AFC24
_020AFC44:
	cmp lr, ip
	ldmhsia sp!, {r4, pc}
	mov r2, #1
	strb r2, [r0]
	ldr r3, [r1]
	mov r2, #0
	str r3, [r0, #4]
	str r2, [r0, #0xc]
	ldr r2, [r1, #8]
	str r2, [r0, #8]
	str r0, [r1, #8]
	ldr r2, [r0, #8]
	cmp r2, #0
	strne r0, [r2, #0xc]
	streq r0, [r1, #4]
	ldr r2, [r1]
	add r2, r2, #1
	str r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AFC90: .word 0x4EC4EC4F
	arm_func_end sub_020AFBC8

	arm_func_start sub_020AFC94
sub_020AFC94: ; 0x020AFC94
	stmdb sp!, {r3, lr}
	bl sub_020AE4EC
	add r0, r0, #0x2000
	ldr r1, [r0, #0x270]
	cmp r1, #0
	beq _020AFCBC
	ldr r0, [r0, #0x274]
	cmp r0, #0xc
	ldrhi r0, [r1, #4]
	ldmhiia sp!, {r3, pc}
_020AFCBC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020AFC94

	arm_func_start sub_020AFCC4
sub_020AFCC4: ; 0x020AFCC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020AE4EC
	add r0, r0, #0x2000
	mov r4, #0
	cmp r5, #0
	ldr r1, [r0, #0x270]
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r1, #0
	beq _020AFD28
	ldr r0, [r0, #0x274]
	cmp r0, #0xc
	bls _020AFD28
	ldr r4, [r1, #4]
	cmp r4, #0
	beq _020AFD28
_020AFD08:
	mov r1, r5
	add r0, r4, #0x14
	bl sub_020B0248
	cmp r0, #0
	bne _020AFD28
	ldr r4, [r4, #0xc]
	cmp r4, #0
	bne _020AFD08
_020AFD28:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020AFCC4

	arm_func_start sub_020AFD30
sub_020AFD30: ; 0x020AFD30
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020AE4EC
	add r1, r0, #0x2000
	ldr r2, [r1, #0x270]
	mov r0, #0
	cmp r2, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r1, #0x274]
	cmp r1, #0xc
	ldmlsia sp!, {r4, pc}
	ldr r0, [r2, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
_020AFD68:
	ldr r1, [r0, #4]
	cmp r1, r4
	ldrne r0, [r0, #0xc]
	cmpne r0, #0
	bne _020AFD68
	ldmia sp!, {r4, pc}
	arm_func_end sub_020AFD30

	arm_func_start sub_020AFD80
sub_020AFD80: ; 0x020AFD80
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020AE4EC
	add r1, r0, #0x2000
	ldr r0, [r1, #0x270]
	cmp r4, #0
	cmpne r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r1, #0x274]
	cmp r1, #0xc
	ldmlsia sp!, {r4, pc}
	ldr r3, [r0, #4]
	cmp r3, #0
	beq _020AFDF8
_020AFDB8:
	cmp r3, r4
	bne _020AFDEC
	ldr r2, [r3, #8]
	ldr r1, [r3, #0xc]
	cmp r2, #0
	strne r1, [r2, #0xc]
	streq r1, [r0, #4]
	ldr r2, [r3, #0xc]
	ldr r1, [r3, #8]
	cmp r2, #0
	strne r1, [r2, #8]
	streq r1, [r0, #8]
	b _020AFDF8
_020AFDEC:
	ldr r3, [r3, #0xc]
	cmp r3, #0
	bne _020AFDB8
_020AFDF8:
	mov r1, #0
	str r1, [r4, #0xc]
	ldr r1, [r0, #8]
	str r1, [r4, #8]
	str r4, [r0, #8]
	ldr r1, [r4, #8]
	cmp r1, #0
	strne r4, [r1, #0xc]
	streq r4, [r0, #4]
	cmp r3, #0
	ldmneia sp!, {r4, pc}
	ldr r1, [r0]
	str r1, [r4, #4]
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020AFD80

	arm_func_start sub_020AFE3C
sub_020AFE3C: ; 0x020AFE3C
	stmdb sp!, {r3, lr}
	ldr r1, _020AFE74 ; =0x021D5FF0
	ldrb r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strb r0, [r1]
	mov r2, #0
	str r2, [r1, #0x24]
	str r2, [r1, #8]
	ldr r0, _020AFE78 ; =0x021D5FFC
	str r2, [r1, #4]
	bl sub_020D2600
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AFE74: .word 0x021D5FF0
_020AFE78: .word 0x021D5FFC
	arm_func_end sub_020AFE3C

	arm_func_start sub_020AFE7C
sub_020AFE7C: ; 0x020AFE7C
	stmdb sp!, {r3, lr}
	ldr r1, _020AFEAC ; =0x021D5FF0
	mov r2, r0
	ldr ip, [r1, #0x28]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	ldrh r3, [r2, #6]
	add r0, r2, #0x1e
	add r1, r2, #0x18
	add r2, r2, #0x2c
	blx ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AFEAC: .word 0x021D5FF0
	arm_func_end sub_020AFE7C

	arm_func_start sub_020AFEB0
sub_020AFEB0: ; 0x020AFEB0
	stmdb sp!, {r4, lr}
	bl sub_020AE4EC
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x2000
	ldr r1, [r0, #0x260]
	cmp r1, #9
	ldmneia sp!, {r4, pc}
	ldrb r0, [r0, #0x26b]
	cmp r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r0, _020AFF18 ; =0x021D5FFC
	bl sub_020B01C0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r1, r4, #0x144
	ldr r0, _020AFF1C ; =sub_020B01AC
	add r1, r1, #0x2000
	add r2, r4, #0xf00
	mov r3, #0
	bl sub_020DFFBC
	cmp r0, #2
	ldmeqia sp!, {r4, pc}
	ldr r0, _020AFF18 ; =0x021D5FFC
	bl sub_020B0210
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AFF18: .word 0x021D5FFC
_020AFF1C: .word sub_020B01AC
	arm_func_end sub_020AFEB0

	arm_func_start sub_020AFF20
sub_020AFF20: ; 0x020AFF20
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	bl sub_020AE4EC
	mov r4, r0
	bl sub_020D3A38
	cmp r4, #0
	beq _020AFF58
	add r1, r4, #0x2000
	ldr r2, [r1, #0x260]
	cmp r2, #9
	ldreqb r1, [r1, #0x26b]
	cmpeq r1, #0
	addeq r1, r4, #0x144
	addeq r5, r1, #0x2000
_020AFF58:
	bl sub_020D3A4C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020AFF20

	arm_func_start sub_020AFF64
sub_020AFF64: ; 0x020AFF64
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	mov r5, r0
	mov r4, r7
	bl sub_020AE4EC
	mov r6, r0
	bl sub_020D3A38
	cmp r6, #0
	beq _020AFFB0
	add r1, r6, #0x2000
	ldr r2, [r1, #0x260]
	cmp r2, #9
	ldreqb r1, [r1, #0x26b]
	cmpeq r1, #0
	bne _020AFFB0
	add r1, r6, #0x2100
	ldrh r4, [r1, #0x4a]
	add r1, r6, #0x14c
	add r7, r1, #0x2000
_020AFFB0:
	bl sub_020D3A4C
	cmp r5, #0
	strneh r4, [r5]
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020AFF64

	arm_func_start sub_020AFFC4
sub_020AFFC4: ; 0x020AFFC4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020D3A38
	ldr r1, _020AFFE0 ; =0x021D5FF0
	str r4, [r1, #0x28]
	bl sub_020D3A4C
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AFFE0: .word 0x021D5FF0
	arm_func_end sub_020AFFC4

	arm_func_start sub_020AFFE4
sub_020AFFE4: ; 0x020AFFE4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov sb, r1
	mov r8, r2
	mov r6, r3
	bl sub_020D3A38
	mov r5, r0
	bl sub_020AE4EC
	cmp r0, #0
	bne _020B001C
	mov r0, r5
	bl sub_020D3A4C
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020B001C:
	ldr r0, _020B015C ; =0x021D5FFC
	bl OS_LockMutex
	bl sub_020AE4EC
	movs r7, r0
	bne _020B0048
	ldr r0, _020B015C ; =0x021D5FFC
	bl OS_UnlockMutex
	mov r0, r5
	bl sub_020D3A4C
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020B0048:
	add r0, r7, #0x2000
	ldr r1, [r0, #0x260]
	cmp r1, #9
	bne _020B0064
	ldrb r0, [r0, #0x26b]
	cmp r0, #1
	bne _020B007C
_020B0064:
	ldr r0, _020B015C ; =0x021D5FFC
	bl OS_UnlockMutex
	mov r0, r5
	bl sub_020D3A4C
	mvn r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020B007C:
	mov r0, sb
	mov r2, r8
	add r1, r7, #0xf00
	bl sub_020D4A50
	ldr r2, [sp, #0x20]
	cmp r2, #0
	ble _020B00A8
	add r1, r7, #0xf00
	mov r0, r6
	add r1, r1, r8
	bl sub_020D4A50
_020B00A8:
	ldr r1, [sp, #0x20]
	ldr r0, _020B0160 ; =sub_020B016C
	add r6, r8, r1
	mov r3, r6, lsl #0x10
	mov r1, r4
	add r2, r7, #0xf00
	mov r3, r3, lsr #0x10
	bl sub_020DFFBC
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B00F8
_020B00D4: ; jump table
	b _020B00F8 ; case 0
	b _020B00F8 ; case 1
	b _020B0110 ; case 2
	b _020B00F8 ; case 3
	b _020B00F8 ; case 4
	b _020B00F8 ; case 5
	b _020B00F8 ; case 6
	b _020B00F8 ; case 7
	b _020B00F8 ; case 8
_020B00F8:
	ldr r0, _020B015C ; =0x021D5FFC
	bl OS_UnlockMutex
	mov r0, r5
	bl sub_020D3A4C
	mvn r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020B0110:
	ldr r0, _020B0164 ; =0x021D5FF4
	bl sub_020D1E7C
	ldr r0, _020B0168 ; =0x021D5FF0
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _020B0144
	cmp r0, #1
	ldr r0, _020B015C ; =0x021D5FFC
	bl OS_UnlockMutex
	mov r0, r5
	bl sub_020D3A4C
	mvn r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020B0144:
	ldr r0, _020B015C ; =0x021D5FFC
	bl OS_UnlockMutex
	mov r0, r5
	bl sub_020D3A4C
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020B015C: .word 0x021D5FFC
_020B0160: .word sub_020B016C
_020B0164: .word 0x021D5FF4
_020B0168: .word 0x021D5FF0
	arm_func_end sub_020AFFE4

	arm_func_start sub_020B016C
sub_020B016C: ; 0x020B016C
	stmdb sp!, {r3, lr}
	ldrh r1, [r0]
	cmp r1, #0x12
	ldmneia sp!, {r3, pc}
	ldrh r2, [r0, #2]
	ldr r1, _020B01A4 ; =0x021D5FF0
	str r2, [r1, #0x24]
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _020B0198
	bl sub_020AE994
_020B0198:
	ldr r0, _020B01A8 ; =0x021D5FF4
	bl sub_020D1ECC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B01A4: .word 0x021D5FF0
_020B01A8: .word 0x021D5FF4
	arm_func_end sub_020B016C

	arm_func_start sub_020B01AC
sub_020B01AC: ; 0x020B01AC
	ldr ip, _020B01B8 ; =sub_020B0210
	ldr r0, _020B01BC ; =0x021D5FFC
	bx ip
	.align 2, 0
_020B01B8: .word sub_020B0210
_020B01BC: .word 0x021D5FFC
	arm_func_end sub_020B01AC

	arm_func_start sub_020B01C0
sub_020B01C0: ; 0x020B01C0
	ldr r2, [r0, #8]
	cmp r2, #0
	bne _020B01E8
	ldr r1, _020B020C ; =sub_01FF8000
	str r1, [r0, #8]
	ldr r1, [r0, #0xc]
	add r1, r1, #1
	str r1, [r0, #0xc]
	mov r0, #1
	bx lr
_020B01E8:
	ldr r1, _020B020C ; =sub_01FF8000
	cmp r2, r1
	movne r0, #0
	bxne lr
	ldr r1, [r0, #0xc]
	add r1, r1, #1
	str r1, [r0, #0xc]
	mov r0, #1
	bx lr
	.align 2, 0
_020B020C: .word sub_01FF8000
	arm_func_end sub_020B01C0

	arm_func_start sub_020B0210
sub_020B0210: ; 0x020B0210
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #8]
	ldr r1, _020B0244 ; =sub_01FF8000
	cmp r2, r1
	ldmneia sp!, {r3, pc}
	ldr r1, [r0, #0xc]
	subs r1, r1, #1
	str r1, [r0, #0xc]
	ldmneia sp!, {r3, pc}
	mov r1, #0
	str r1, [r0, #8]
	bl sub_020D1ECC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B0244: .word sub_01FF8000
	arm_func_end sub_020B0210

	arm_func_start sub_020B0248
sub_020B0248: ; 0x020B0248
	mov ip, #0
_020B024C:
	ldrb r3, [r0, ip]
	ldrb r2, [r1, ip]
	cmp r3, r2
	movne r0, #0
	bxne lr
	add ip, ip, #1
	cmp ip, #6
	blt _020B024C
	mov r0, #1
	bx lr
	arm_func_end sub_020B0248

	arm_func_start sub_020B0274
sub_020B0274: ; 0x020B0274
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_020D3A38
	mov r4, r0
	bl sub_020AE4EC
	cmp r0, #0
	mov r5, #0
	beq _020B02A8
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #9
	bne _020B02A8
	bl sub_020B0338
	mov r5, r0
_020B02A8:
	mov r0, r4
	bl sub_020D3A4C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020B0274

	arm_func_start sub_020B02B8
sub_020B02B8: ; 0x020B02B8
	stmdb sp!, {r3, lr}
	ldr r1, _020B0330 ; =0x021D601C
	mov r0, #0
	ldrb r1, [r1]
	cmp r1, #0x10
	bls _020B02FC
	ldr r3, _020B0334 ; =0x021D6020
	mov r2, r0
_020B02D8:
	ldrb r1, [r3], #1
	add r2, r2, #1
	cmp r2, #0x10
	add r0, r0, r1
	blt _020B02D8
	mov r1, r0, asr #3
	add r0, r0, r1, lsr #28
	mov r0, r0, asr #4
	b _020B0328
_020B02FC:
	cmp r1, #0
	beq _020B0328
	mov ip, r0
	ble _020B0324
	ldr r3, _020B0334 ; =0x021D6020
_020B0310:
	ldrb r2, [r3], #1
	add ip, ip, #1
	cmp ip, r1
	add r0, r0, r2
	blt _020B0310
_020B0324:
	bl sub_020F2998
_020B0328:
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B0330: .word 0x021D601C
_020B0334: .word 0x021D6020
	arm_func_end sub_020B02B8

	arm_func_start sub_020B0338
sub_020B0338: ; 0x020B0338
	stmdb sp!, {r3, lr}
	bl sub_020B02B8
	mov r1, #0
	cmp r0, #0x1c
	movhs r1, #3
	bhs _020B0364
	cmp r0, #0x16
	movhs r1, #2
	bhs _020B0364
	cmp r0, #0x10
	movhs r1, #1
_020B0364:
	mov r0, r1
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B0338

	arm_func_start sub_020B036C
sub_020B036C: ; 0x020B036C
	stmdb sp!, {r3, lr}
	ldr r2, _020B03C4 ; =0x021D601C
	tst r0, #2
	ldrb ip, [r2]
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	mov r1, ip, lsr #0x1f
	and lr, r0, #0xff
	rsb r0, r1, ip, lsl #28
	ldr r3, _020B03C8 ; =0x021D6020
	add r0, r1, r0, ror #28
	strb lr, [r3, r0]
	add r0, ip, #1
	cmp ip, #0x10
	strlob r0, [r2]
	ldmloia sp!, {r3, pc}
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #28
	add r0, r1, r0, ror #28
	add r0, r0, #0x10
	strb r0, [r2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B03C4: .word 0x021D601C
_020B03C8: .word 0x021D6020
	arm_func_end sub_020B036C

	arm_func_start sub_020B03CC
sub_020B03CC: ; 0x020B03CC
	ldr ip, _020B03D4 ; =sub_020D8E00
	bx ip
	.align 2, 0
_020B03D4: .word sub_020D8E00
	arm_func_end sub_020B03CC

	arm_func_start sub_020B03D8
sub_020B03D8: ; 0x020B03D8
	ldr ip, _020B03E0 ; =sub_020D8E40
	bx ip
	.align 2, 0
_020B03E0: .word sub_020D8E40
	arm_func_end sub_020B03D8

	arm_func_start sub_020B03E4
sub_020B03E4: ; 0x020B03E4
	ldr ip, _020B03EC ; =sub_020D8F08
	bx ip
	.align 2, 0
_020B03EC: .word sub_020D8F08
	arm_func_end sub_020B03E4

	arm_func_start sub_020B03F0
sub_020B03F0: ; 0x020B03F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, #0
	cmp r2, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r4, #0x8000
	ldr lr, _020B0538 ; =0x00007FFF
	ldr ip, _020B053C ; =0x02108FF4
	ldr r5, _020B0540 ; =0x02109004
	rsb r4, r4, #0
_020B0414:
	ldrb r7, [r3, #2]
	ldrb sl, [r0]
	ldrsh r8, [r3]
	mov sb, r7, lsl #1
	ldrsh fp, [r5, sb]
	and sl, sl, #0xf
	tst sl, #4
	mov sb, fp, asr #3
	addne sb, sb, fp
	tst sl, #2
	addne sb, sb, fp, asr #1
	tst sl, #1
	addne sb, sb, fp, asr #2
	tst sl, #8
	beq _020B0460
	sub r8, r8, sb
	cmp r8, r4
	movlt r8, r4
	b _020B046C
_020B0460:
	add r8, r8, sb
	cmp r8, lr
	movgt r8, lr
_020B046C:
	ldrsb sb, [ip, sl]
	adds r7, r7, sb
	movmi r7, #0
	bmi _020B0484
	cmp r7, #0x58
	movgt r7, #0x58
_020B0484:
	mov r8, r8, lsl #0x10
	mov r8, r8, asr #0x10
	strh r8, [r3]
	strb r7, [r3, #2]
	strh r8, [r1]
	ldrb r7, [r3, #2]
	ldrb sl, [r0]
	ldrsh r8, [r3]
	mov sb, r7, lsl #1
	ldrsh fp, [r5, sb]
	mov sl, sl, asr #4
	and sl, sl, #0xf
	mov sb, fp, asr #3
	tst sl, #4
	addne sb, sb, fp
	tst sl, #2
	addne sb, sb, fp, asr #1
	tst sl, #1
	addne sb, sb, fp, asr #2
	tst sl, #8
	beq _020B04E8
	sub r8, r8, sb
	cmp r8, r4
	movlt r8, r4
	b _020B04F4
_020B04E8:
	add r8, r8, sb
	cmp r8, lr
	movgt r8, lr
_020B04F4:
	ldrsb sb, [ip, sl]
	adds r7, r7, sb
	movmi r7, #0
	bmi _020B050C
	cmp r7, #0x58
	movgt r7, #0x58
_020B050C:
	mov r8, r8, lsl #0x10
	mov r8, r8, asr #0x10
	strh r8, [r3]
	strb r7, [r3, #2]
	add r6, r6, #1
	strh r8, [r1, #2]
	cmp r6, r2
	add r1, r1, #4
	add r0, r0, #1
	blo _020B0414
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B0538: .word 0x00007FFF
_020B053C: .word 0x02108FF4
_020B0540: .word 0x02109004
	arm_func_end sub_020B03F0

	arm_func_start sub_020B0544
sub_020B0544: ; 0x020B0544
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r8, r2, lsr #1
	mov r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov ip, #0x8000
	rsb ip, ip, #0
	ldr lr, _020B06C8 ; =0x02109004
	mov r2, ip, lsr #0x11
_020B0564:
	ldrb r6, [r3, #2]
	ldrsh r7, [r3]
	ldrsh r5, [r1]
	mov sb, r6, lsl #1
	ldrsh sb, [lr, sb]
	subs sl, r5, r7
	movmi r5, #8
	rsbmi sl, sl, #0
	movpl r5, #0
	cmp sl, sb
	orrge r5, r5, #4
	subge sl, sl, sb
	cmp sl, sb, asr #1
	orrge r5, r5, #2
	subge sl, sl, sb, asr #1
	cmp sl, sb, asr #2
	orrge r5, r5, #1
	mov sl, sb, asr #3
	tst r5, #4
	addne sl, sl, sb
	tst r5, #2
	addne sl, sl, sb, asr #1
	tst r5, #1
	addne sl, sl, sb, asr #2
	tst r5, #8
	rsbne sl, sl, #0
	add sb, r7, sl
	ldr r7, _020B06CC ; =0x02108FF4
	cmp sb, ip
	movlt sb, ip
	cmp sb, ip, lsr #17
	ldrsb r7, [r7, r5]
	movgt sb, r2
	adds r6, r6, r7
	movmi r6, #0
	bmi _020B05FC
	cmp r6, #0x58
	movgt r6, #0x58
_020B05FC:
	strh sb, [r3]
	strb r6, [r3, #2]
	and r7, r6, #0xff
	ldrsh r6, [r1, #2]
	ldrsh sb, [r3]
	mov sl, r7, lsl #1
	ldrsh sl, [lr, sl]
	subs fp, r6, sb
	movmi r6, #8
	rsbmi fp, fp, #0
	movpl r6, #0
	cmp fp, sl
	orrge r6, r6, #4
	subge fp, fp, sl
	cmp fp, sl, asr #1
	orrge r6, r6, #2
	subge fp, fp, sl, asr #1
	cmp fp, sl, asr #2
	orrge r6, r6, #1
	mov fp, sl, asr #3
	tst r6, #4
	addne fp, fp, sl
	tst r6, #2
	addne fp, fp, sl, asr #1
	tst r6, #1
	addne fp, fp, sl, asr #2
	tst r6, #8
	rsbne fp, fp, #0
	add sl, sb, fp
	ldr sb, _020B06CC ; =0x02108FF4
	cmp sl, ip
	movlt sl, ip
	cmp sl, ip, lsr #17
	ldrsb sb, [sb, r6]
	movgt sl, r2
	and r5, r5, #0xff
	adds r7, r7, sb
	add r1, r1, #4
	movmi r7, #0
	bmi _020B06A4
	cmp r7, #0x58
	movgt r7, #0x58
_020B06A4:
	strh sl, [r3]
	strb r7, [r3, #2]
	and r6, r6, #0xff
	orr r5, r5, r6, lsl #4
	strb r5, [r0], #1
	add r4, r4, #1
	cmp r4, r8
	blo _020B0564
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B06C8: .word 0x02109004
_020B06CC: .word 0x02108FF4
	arm_func_end sub_020B0544

	arm_func_start sub_020B06D0
sub_020B06D0: ; 0x020B06D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r5, _020B0B54 ; =0xAAAAAAAB
	mov r4, #0
	str r4, [sp, #0xc]
	umull r5, r4, r2, r5
	movs r2, r4, lsr #1
	str r2, [sp]
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r4, #0x8000
	ldr lr, _020B0B58 ; =0x00007FFF
	ldr r5, _020B0B5C ; =0x02109004
	rsb r4, r4, #0
_020B0708:
	ldrb r7, [r3, #2]
	ldrb fp, [r0]
	ldrb r2, [r0, #1]
	mov r6, r7, lsl #1
	ldrsh r6, [r5, r6]
	mov sb, fp, asr #5
	tst sb, #2
	str r6, [sp, #8]
	ldrne sl, [sp, #8]
	mov r6, r6, asr #2
	addne r6, r6, sl
	tst sb, #1
	ldrne sl, [sp, #8]
	ldrb ip, [r0, #2]
	addne r6, r6, sl, asr #1
	ldrsh r8, [r3]
	tst sb, #4
	beq _020B0760
	sub r8, r8, r6
	cmp r8, r4
	movlt r8, r4
	b _020B076C
_020B0760:
	add r8, r8, r6
	cmp r8, lr
	movgt r8, lr
_020B076C:
	ldr r6, _020B0B60 ; =0x02108FEC
	ldrsb r6, [r6, sb]
	adds r7, r7, r6
	movmi r7, #0
	bmi _020B0788
	cmp r7, #0x58
	movgt r7, #0x58
_020B0788:
	mov r6, r8, lsl #0x10
	mov r6, r6, asr #0x10
	strh r6, [r3]
	strb r7, [r3, #2]
	strh r6, [r1]
	ldrb r7, [r3, #2]
	mov sb, fp, asr #2
	tst sb, #2
	mov r6, r7, lsl #1
	ldrsh r6, [r5, r6]
	ldrsh r8, [r3]
	str r6, [sp, #4]
	ldrne sl, [sp, #4]
	mov r6, r6, asr #2
	addne r6, r6, sl
	tst sb, #1
	ldrne sl, [sp, #4]
	addne r6, r6, sl, asr #1
	tst sb, #4
	beq _020B07E8
	sub r8, r8, r6
	cmp r8, r4
	movlt r8, r4
	b _020B07F4
_020B07E8:
	add r8, r8, r6
	cmp r8, lr
	movgt r8, lr
_020B07F4:
	ldr r6, _020B0B60 ; =0x02108FEC
	and sb, sb, #7
	ldrsb r6, [r6, sb]
	adds r7, r7, r6
	movmi r7, #0
	bmi _020B0814
	cmp r7, #0x58
	movgt r7, #0x58
_020B0814:
	mov r6, r8, lsl #0x10
	mov r6, r6, asr #0x10
	strh r6, [r3]
	strb r7, [r3, #2]
	strh r6, [r1, #2]
	ldrb r6, [r3, #2]
	mov r8, fp, lsl #1
	and r8, r8, #7
	mov sb, r6, lsl #1
	ldrsh sl, [r5, sb]
	orr r8, r8, r2, asr #7
	tst r8, #2
	mov sb, sl, asr #2
	addne sb, sb, sl
	tst r8, #1
	addne sb, sb, sl, asr #1
	ldrsh r7, [r3]
	tst r8, #4
	beq _020B0870
	sub r7, r7, sb
	cmp r7, r4
	movlt r7, r4
	b _020B087C
_020B0870:
	add r7, r7, sb
	cmp r7, lr
	movgt r7, lr
_020B087C:
	ldr sb, _020B0B60 ; =0x02108FEC
	ldrsb r8, [sb, r8]
	adds r6, r6, r8
	movmi r6, #0
	bmi _020B0898
	cmp r6, #0x58
	movgt r6, #0x58
_020B0898:
	mov r7, r7, lsl #0x10
	mov r7, r7, asr #0x10
	strh r7, [r3]
	strb r6, [r3, #2]
	strh r7, [r1, #4]
	ldrb r6, [r3, #2]
	mov r8, r2, asr #4
	tst r8, #2
	mov sb, r6, lsl #1
	ldrsh sl, [r5, sb]
	ldrsh r7, [r3]
	mov sb, sl, asr #2
	addne sb, sb, sl
	tst r8, #1
	addne sb, sb, sl, asr #1
	tst r8, #4
	beq _020B08EC
	sub r7, r7, sb
	cmp r7, r4
	movlt r7, r4
	b _020B08F8
_020B08EC:
	add r7, r7, sb
	cmp r7, lr
	movgt r7, lr
_020B08F8:
	and sb, r8, #7
	ldr r8, _020B0B60 ; =0x02108FEC
	ldrsb r8, [r8, sb]
	adds r6, r6, r8
	movmi r6, #0
	bmi _020B0918
	cmp r6, #0x58
	movgt r6, #0x58
_020B0918:
	mov r7, r7, lsl #0x10
	mov r7, r7, asr #0x10
	strh r7, [r3]
	strb r6, [r3, #2]
	strh r7, [r1, #6]
	ldrb r6, [r3, #2]
	mov r8, r2, asr #1
	tst r8, #2
	mov sb, r6, lsl #1
	ldrsh sl, [r5, sb]
	ldrsh r7, [r3]
	mov sb, sl, asr #2
	addne sb, sb, sl
	tst r8, #1
	addne sb, sb, sl, asr #1
	tst r8, #4
	beq _020B096C
	sub r7, r7, sb
	cmp r7, r4
	movlt r7, r4
	b _020B0978
_020B096C:
	add r7, r7, sb
	cmp r7, lr
	movgt r7, lr
_020B0978:
	and sb, r8, #7
	ldr r8, _020B0B60 ; =0x02108FEC
	ldrsb r8, [r8, sb]
	adds r6, r6, r8
	movmi r6, #0
	bmi _020B0998
	cmp r6, #0x58
	movgt r6, #0x58
_020B0998:
	mov r7, r7, lsl #0x10
	mov r8, r7, asr #0x10
	strh r8, [r3]
	mov r2, r2, lsl #2
	strb r6, [r3, #2]
	and r2, r2, #7
	strh r8, [r1, #8]
	orr r7, r2, ip, asr #6
	ldrb r2, [r3, #2]
	tst r7, #2
	ldrsh r6, [r3]
	mov r8, r2, lsl #1
	ldrsh sb, [r5, r8]
	mov r8, sb, asr #2
	addne r8, r8, sb
	tst r7, #1
	addne r8, r8, sb, asr #1
	tst r7, #4
	beq _020B09F4
	sub r6, r6, r8
	cmp r6, r4
	movlt r6, r4
	b _020B0A00
_020B09F4:
	add r6, r6, r8
	cmp r6, lr
	movgt r6, lr
_020B0A00:
	ldr r8, _020B0B60 ; =0x02108FEC
	ldrsb r7, [r8, r7]
	adds r2, r2, r7
	movmi r2, #0
	bmi _020B0A1C
	cmp r2, #0x58
	movgt r2, #0x58
_020B0A1C:
	mov r6, r6, lsl #0x10
	mov r6, r6, asr #0x10
	strh r6, [r3]
	strb r2, [r3, #2]
	strh r6, [r1, #0xa]
	ldrb r2, [r3, #2]
	mov sb, ip, asr #3
	tst sb, #2
	mov r7, r2, lsl #1
	ldrsh r8, [r5, r7]
	ldrsh r6, [r3]
	mov r7, r8, asr #2
	addne r7, r7, r8
	tst sb, #1
	addne r7, r7, r8, asr #1
	tst sb, #4
	beq _020B0A70
	sub r6, r6, r7
	cmp r6, r4
	movlt r6, r4
	b _020B0A7C
_020B0A70:
	add r6, r6, r7
	cmp r6, lr
	movgt r6, lr
_020B0A7C:
	ldr r7, _020B0B60 ; =0x02108FEC
	and r8, sb, #7
	ldrsb r7, [r7, r8]
	adds r2, r2, r7
	movmi r2, #0
	bmi _020B0A9C
	cmp r2, #0x58
	movgt r2, #0x58
_020B0A9C:
	mov r6, r6, lsl #0x10
	mov r6, r6, asr #0x10
	strh r6, [r3]
	strb r2, [r3, #2]
	strh r6, [r1, #0xc]
	ldrb r2, [r3, #2]
	tst ip, #2
	ldrsh r6, [r3]
	mov r7, r2, lsl #1
	ldrsh r8, [r5, r7]
	mov r7, r8, asr #2
	addne r7, r7, r8
	tst ip, #1
	addne r7, r7, r8, asr #1
	tst ip, #4
	beq _020B0AEC
	sub r6, r6, r7
	cmp r6, r4
	movlt r6, r4
	b _020B0AF8
_020B0AEC:
	add r6, r6, r7
	cmp r6, lr
	movgt r6, lr
_020B0AF8:
	ldr r7, _020B0B60 ; =0x02108FEC
	and r8, ip, #7
	ldrsb r7, [r7, r8]
	adds r2, r2, r7
	movmi r2, #0
	bmi _020B0B18
	cmp r2, #0x58
	movgt r2, #0x58
_020B0B18:
	mov r6, r6, lsl #0x10
	mov r6, r6, asr #0x10
	strh r6, [r3]
	strb r2, [r3, #2]
	ldr r2, [sp, #0xc]
	strh r6, [r1, #0xe]
	add r6, r2, #1
	ldr r2, [sp]
	add r0, r0, #3
	add r1, r1, #0x10
	str r6, [sp, #0xc]
	cmp r6, r2
	blo _020B0708
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B0B54: .word 0xAAAAAAAB
_020B0B58: .word 0x00007FFF
_020B0B5C: .word 0x02109004
_020B0B60: .word 0x02108FEC
	arm_func_end sub_020B06D0

	arm_func_start sub_020B0B64
sub_020B0B64: ; 0x020B0B64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	movs r2, r2, lsr #3
	str r2, [sp]
	mov r2, #0
	str r2, [sp, #4]
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r6, #0x8000
	rsb r6, r6, #0
	ldr r7, _020B1068 ; =0x02109004
	ldr r4, _020B106C ; =0x02108FEC
	mov r5, r6, lsr #0x11
_020B0B98:
	ldrsh r2, [r3]
	ldrsh sb, [r1]
	ldrb r8, [r3, #2]
	subs fp, sb, r2
	mov sb, r8, lsl #1
	movmi sl, #4
	ldrsh sb, [r7, sb]
	rsbmi fp, fp, #0
	movpl sl, #0
	cmp fp, sb
	orrge sl, sl, #2
	subge fp, fp, sb
	cmp fp, sb, asr #1
	orrge sl, sl, #1
	mov fp, sb, asr #2
	tst sl, #2
	addne fp, fp, sb
	tst sl, #1
	addne fp, fp, sb, asr #1
	tst sl, #4
	rsbne fp, fp, #0
	add sb, r2, fp
	cmp sb, r6
	movlt sb, r6
	cmp sb, r6, lsr #17
	ldrsb r2, [r4, sl]
	movgt sb, r5
	adds r8, r8, r2
	movmi r8, #0
	bmi _020B0C18
	cmp r8, #0x58
	movgt r8, #0x58
_020B0C18:
	strh sb, [r3]
	strb r8, [r3, #2]
	and r2, sl, #0xff
	and sb, r8, #0xff
	mov fp, sb, lsl #1
	ldrsh sl, [r3]
	ldrsh r8, [r1, #2]
	ldrsh fp, [r7, fp]
	mov r2, r2, lsl #5
	subs ip, r8, sl
	movmi r8, #4
	rsbmi ip, ip, #0
	movpl r8, #0
	cmp ip, fp
	orrge r8, r8, #2
	subge ip, ip, fp
	cmp ip, fp, asr #1
	orrge r8, r8, #1
	mov ip, fp, asr #2
	tst r8, #2
	addne ip, ip, fp
	tst r8, #1
	addne ip, ip, fp, asr #1
	tst r8, #4
	rsbne ip, ip, #0
	add fp, sl, ip
	cmp fp, r6
	movlt fp, r6
	cmp fp, r6, lsr #17
	ldrsb sl, [r4, r8]
	movgt fp, r5
	and r2, r2, #0xff
	adds sb, sb, sl
	movmi sb, #0
	bmi _020B0CAC
	cmp sb, #0x58
	movgt sb, #0x58
_020B0CAC:
	strh fp, [r3]
	strb sb, [r3, #2]
	and r8, r8, #0xff
	orr r2, r2, r8, lsl #2
	and sb, sb, #0xff
	mov fp, sb, lsl #1
	ldrsh sl, [r3]
	ldrsh r8, [r1, #4]
	ldrsh fp, [r7, fp]
	and r2, r2, #0xff
	subs ip, r8, sl
	movmi r8, #4
	rsbmi ip, ip, #0
	movpl r8, #0
	cmp ip, fp
	orrge r8, r8, #2
	subge ip, ip, fp
	cmp ip, fp, asr #1
	orrge r8, r8, #1
	mov ip, fp, asr #2
	tst r8, #2
	addne ip, ip, fp
	tst r8, #1
	addne ip, ip, fp, asr #1
	tst r8, #4
	rsbne ip, ip, #0
	add fp, sl, ip
	cmp fp, r6
	movlt fp, r6
	cmp fp, r6, lsr #17
	ldrsb sl, [r4, r8]
	movgt fp, r5
	adds sb, sb, sl
	movmi sb, #0
	bmi _020B0D40
	cmp sb, #0x58
	movgt sb, #0x58
_020B0D40:
	strh fp, [r3]
	and lr, r8, #0xff
	strb sb, [r3, #2]
	orr r2, r2, lr, asr #1
	strb r2, [r0]
	ldrb sb, [r3, #2]
	ldrsh r8, [r3]
	ldrsh r2, [r1, #6]
	mov sl, sb, lsl #1
	ldrsh sl, [r7, sl]
	subs fp, r2, r8
	movmi r2, #4
	rsbmi fp, fp, #0
	movpl r2, #0
	cmp fp, sl
	orrge r2, r2, #2
	subge fp, fp, sl
	cmp fp, sl, asr #1
	orrge r2, r2, #1
	mov fp, sl, asr #2
	tst r2, #2
	addne fp, fp, sl
	tst r2, #1
	addne fp, fp, sl, asr #1
	tst r2, #4
	rsbne fp, fp, #0
	add sl, r8, fp
	cmp sl, r6
	movlt sl, r6
	cmp sl, r6, lsr #17
	ldrsb r8, [r4, r2]
	movgt sl, r5
	adds sb, sb, r8
	movmi sb, #0
	bmi _020B0DD4
	cmp sb, #0x58
	movgt sb, #0x58
_020B0DD4:
	strh sl, [r3]
	and r2, r2, #0xff
	mov r2, r2, lsl #4
	strb sb, [r3, #2]
	and r8, r2, #0xff
	and ip, sb, #0xff
	ldrsh r2, [r3]
	ldrsh sb, [r1, #8]
	subs fp, sb, r2
	mov sb, ip, lsl #1
	movmi sl, #4
	ldrsh sb, [r7, sb]
	rsbmi fp, fp, #0
	movpl sl, #0
	cmp fp, sb
	orrge sl, sl, #2
	subge fp, fp, sb
	cmp fp, sb, asr #1
	orrge sl, sl, #1
	mov fp, sb, asr #2
	tst sl, #2
	addne fp, fp, sb
	tst sl, #1
	addne fp, fp, sb, asr #1
	tst sl, #4
	rsbne fp, fp, #0
	add sb, r2, fp
	cmp sb, r6
	movlt sb, r6
	cmp sb, r6, lsr #17
	ldrsb r2, [r4, sl]
	movgt sb, r5
	adds ip, ip, r2
	movmi ip, #0
	bmi _020B0E68
	cmp ip, #0x58
	movgt ip, #0x58
_020B0E68:
	strh sb, [r3]
	strb ip, [r3, #2]
	and r2, sl, #0xff
	orr r2, r8, r2, lsl #1
	and r8, r2, #0xff
	ldrsh r2, [r3]
	ldrsh sb, [r1, #0xa]
	and ip, ip, #0xff
	subs fp, sb, r2
	mov sb, ip, lsl #1
	movmi sl, #4
	ldrsh sb, [r7, sb]
	rsbmi fp, fp, #0
	movpl sl, #0
	cmp fp, sb
	orrge sl, sl, #2
	subge fp, fp, sb
	cmp fp, sb, asr #1
	orrge sl, sl, #1
	mov fp, sb, asr #2
	tst sl, #2
	addne fp, fp, sb
	tst sl, #1
	addne fp, fp, sb, asr #1
	tst sl, #4
	rsbne fp, fp, #0
	add r2, r2, fp
	cmp r2, r6
	movlt r2, r6
	cmp r2, r6, lsr #17
	ldrsb sb, [r4, sl]
	movgt r2, r5
	adds ip, ip, sb
	movmi ip, #0
	bmi _020B0EFC
	cmp ip, #0x58
	movgt ip, #0x58
_020B0EFC:
	strh r2, [r3]
	orr r8, r8, lr, lsl #7
	and r2, sl, #0xff
	strb ip, [r3, #2]
	orr r8, r8, r2, asr #2
	strb r8, [r0, #1]
	ldrb sb, [r3, #2]
	ldrsh sl, [r3]
	ldrsh r8, [r1, #0xc]
	mov fp, sb, lsl #1
	ldrsh fp, [r7, fp]
	subs ip, r8, sl
	movmi r8, #4
	rsbmi ip, ip, #0
	movpl r8, #0
	cmp ip, fp
	orrge r8, r8, #2
	subge ip, ip, fp
	cmp ip, fp, asr #1
	orrge r8, r8, #1
	mov ip, fp, asr #2
	tst r8, #2
	addne ip, ip, fp
	tst r8, #1
	addne ip, ip, fp, asr #1
	tst r8, #4
	rsbne ip, ip, #0
	add fp, sl, ip
	cmp fp, r6
	movlt fp, r6
	cmp fp, r6, lsr #17
	ldrsb sl, [r4, r8]
	movgt fp, r5
	adds sb, sb, sl
	movmi sb, #0
	bmi _020B0F94
	cmp sb, #0x58
	movgt sb, #0x58
_020B0F94:
	strh fp, [r3]
	and r8, r8, #0xff
	mov r8, r8, lsl #3
	strb sb, [r3, #2]
	and ip, r8, #0xff
	and sl, sb, #0xff
	ldrsh r8, [r1, #0xe]
	ldrsh fp, [r3]
	mov lr, sl, lsl #1
	ldrsh lr, [r7, lr]
	subs sb, r8, fp
	movmi r8, #4
	rsbmi sb, sb, #0
	movpl r8, #0
	cmp sb, lr
	orrge r8, r8, #2
	subge sb, sb, lr
	cmp sb, lr, asr #1
	orrge r8, r8, #1
	mov sb, lr, asr #2
	tst r8, #2
	addne sb, sb, lr
	tst r8, #1
	addne sb, sb, lr, asr #1
	tst r8, #4
	rsbne sb, sb, #0
	add fp, fp, sb
	cmp fp, r6
	movlt fp, r6
	cmp fp, r6, lsr #17
	ldrsb sb, [r4, r8]
	movgt fp, r5
	add r1, r1, #0x10
	adds sl, sl, sb
	movmi sl, #0
	bmi _020B102C
	cmp sl, #0x58
	movgt sl, #0x58
_020B102C:
	and r8, r8, #0xff
	strh fp, [r3]
	orr r8, ip, r8
	strb sl, [r3, #2]
	orr r2, r8, r2, lsl #6
	strb r2, [r0, #2]
	ldr r2, [sp, #4]
	add r0, r0, #3
	add r8, r2, #1
	ldr r2, [sp]
	str r8, [sp, #4]
	cmp r8, r2
	blo _020B0B98
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B1068: .word 0x02109004
_020B106C: .word 0x02108FEC
	arm_func_end sub_020B0B64

	arm_func_start sub_020B1070
sub_020B1070: ; 0x020B1070
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	cmp r2, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r4, #0x8000
	ldr lr, _020B127C ; =0x00007FFF
	ldr ip, _020B1280 ; =0x02108FE8
	ldr r6, _020B1284 ; =0x02109004
	rsb r4, r4, #0
	mov r5, r7
_020B1098:
	ldrb sl, [r0]
	ldrb r8, [r3, #2]
	ldrsh sb, [r3]
	and fp, sl, #3
	mov sl, r8, lsl #1
	ldrsh sl, [r6, sl]
	tst fp, #1
	moveq sl, r5
	tst fp, #2
	beq _020B10D0
	sub sb, sb, sl
	cmp sb, r4
	movlt sb, r4
	b _020B10DC
_020B10D0:
	add sb, sb, sl
	cmp sb, lr
	movgt sb, lr
_020B10DC:
	ldrsb sl, [ip, fp]
	adds r8, r8, sl
	movmi r8, #0
	bmi _020B10F4
	cmp r8, #0x58
	movgt r8, #0x58
_020B10F4:
	mov sb, sb, lsl #0x10
	mov sb, sb, asr #0x10
	strh sb, [r3]
	strb r8, [r3, #2]
	strh sb, [r1]
	ldrb sl, [r0]
	ldrb r8, [r3, #2]
	ldrsh sb, [r3]
	mov sl, sl, asr #2
	and fp, sl, #3
	mov sl, r8, lsl #1
	ldrsh sl, [r6, sl]
	tst fp, #1
	moveq sl, #0
	tst fp, #2
	beq _020B1144
	sub sb, sb, sl
	cmp sb, r4
	movlt sb, r4
	b _020B1150
_020B1144:
	add sb, sb, sl
	cmp sb, lr
	movgt sb, lr
_020B1150:
	ldrsb sl, [ip, fp]
	adds r8, r8, sl
	movmi r8, #0
	bmi _020B1168
	cmp r8, #0x58
	movgt r8, #0x58
_020B1168:
	mov sb, sb, lsl #0x10
	mov sb, sb, asr #0x10
	strh sb, [r3]
	strb r8, [r3, #2]
	strh sb, [r1, #2]
	ldrb sl, [r0]
	ldrb r8, [r3, #2]
	ldrsh sb, [r3]
	mov sl, sl, asr #4
	and fp, sl, #3
	mov sl, r8, lsl #1
	ldrsh sl, [r6, sl]
	tst fp, #1
	moveq sl, #0
	tst fp, #2
	beq _020B11B8
	sub sb, sb, sl
	cmp sb, r4
	movlt sb, r4
	b _020B11C4
_020B11B8:
	add sb, sb, sl
	cmp sb, lr
	movgt sb, lr
_020B11C4:
	ldrsb sl, [ip, fp]
	adds r8, r8, sl
	movmi r8, #0
	bmi _020B11DC
	cmp r8, #0x58
	movgt r8, #0x58
_020B11DC:
	mov sb, sb, lsl #0x10
	mov sb, sb, asr #0x10
	strh sb, [r3]
	strb r8, [r3, #2]
	strh sb, [r1, #4]
	ldrb sl, [r0]
	ldrb r8, [r3, #2]
	ldrsh sb, [r3]
	mov sl, sl, asr #6
	and fp, sl, #3
	mov sl, r8, lsl #1
	ldrsh sl, [r6, sl]
	tst fp, #1
	moveq sl, #0
	tst fp, #2
	beq _020B122C
	sub sb, sb, sl
	cmp sb, r4
	movlt sb, r4
	b _020B1238
_020B122C:
	add sb, sb, sl
	cmp sb, lr
	movgt sb, lr
_020B1238:
	ldrsb sl, [ip, fp]
	adds r8, r8, sl
	movmi r8, #0
	bmi _020B1250
	cmp r8, #0x58
	movgt r8, #0x58
_020B1250:
	mov sb, sb, lsl #0x10
	mov sb, sb, asr #0x10
	strh sb, [r3]
	strb r8, [r3, #2]
	add r7, r7, #1
	strh sb, [r1, #6]
	add r1, r1, #8
	add r0, r0, #1
	cmp r7, r2
	blo _020B1098
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B127C: .word 0x00007FFF
_020B1280: .word 0x02108FE8
_020B1284: .word 0x02109004
	arm_func_end sub_020B1070

	arm_func_start sub_020B1288
sub_020B1288: ; 0x020B1288
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r2, r2, lsr #2
	mov fp, #0
	str r2, [sp]
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r4, #0x8000
	rsb r4, r4, #0
	ldr r5, _020B14B0 ; =0x02109004
	ldr ip, _020B14B4 ; =0x02108FE8
	mov lr, r4, lsr #0x11
_020B12B0:
	ldrb r7, [r3, #2]
	ldrsh r6, [r3]
	ldrsh r2, [r1]
	mov r8, r7, lsl #1
	ldrsh r8, [r5, r8]
	subs sb, r2, r6
	movmi r2, #2
	rsbmi sb, sb, #0
	movpl r2, #0
	cmp sb, r8
	orrge r2, r2, #1
	tst r2, #1
	moveq r8, #0
	tst r2, #2
	rsbne r8, r8, #0
	add r8, r6, r8
	cmp r8, r4
	movlt r8, r4
	cmp r8, r4, lsr #17
	ldrsb r6, [ip, r2]
	movgt r8, lr
	adds r7, r7, r6
	movmi r7, #0
	bmi _020B1318
	cmp r7, #0x58
	movgt r7, #0x58
_020B1318:
	strh r8, [r3]
	strb r7, [r3, #2]
	and r6, r2, #0xff
	ldrsh sl, [r3]
	ldrsh r2, [r1, #2]
	and sb, r7, #0xff
	subs r8, r2, sl
	mov r2, sb, lsl #1
	movmi r7, #2
	ldrsh r2, [r5, r2]
	rsbmi r8, r8, #0
	movpl r7, #0
	cmp r8, r2
	orrge r7, r7, #1
	tst r7, #1
	moveq r2, #0
	tst r7, #2
	rsbne r2, r2, #0
	add r8, sl, r2
	cmp r8, r4
	movlt r8, r4
	cmp r8, r4, lsr #17
	ldrsb r2, [ip, r7]
	movgt r8, lr
	adds sb, sb, r2
	movmi sb, #0
	bmi _020B138C
	cmp sb, #0x58
	movgt sb, #0x58
_020B138C:
	strh r8, [r3]
	strb sb, [r3, #2]
	and r2, r7, #0xff
	orr r2, r6, r2, lsl #2
	and r6, r2, #0xff
	ldrsh sl, [r3]
	ldrsh r2, [r1, #4]
	and sb, sb, #0xff
	subs r8, r2, sl
	mov r2, sb, lsl #1
	movmi r7, #2
	ldrsh r2, [r5, r2]
	rsbmi r8, r8, #0
	movpl r7, #0
	cmp r8, r2
	orrge r7, r7, #1
	tst r7, #1
	moveq r2, #0
	tst r7, #2
	rsbne r2, r2, #0
	add r8, sl, r2
	cmp r8, r4
	movlt r8, r4
	cmp r8, r4, lsr #17
	ldrsb r2, [ip, r7]
	movgt r8, lr
	adds sb, sb, r2
	movmi sb, #0
	bmi _020B1408
	cmp sb, #0x58
	movgt sb, #0x58
_020B1408:
	strh r8, [r3]
	strb sb, [r3, #2]
	and r2, r7, #0xff
	orr r2, r6, r2, lsl #4
	and r6, r2, #0xff
	ldrsh r2, [r1, #6]
	ldrsh sl, [r3]
	and sb, sb, #0xff
	add r1, r1, #8
	subs r8, r2, sl
	mov r2, sb, lsl #1
	movmi r7, #2
	ldrsh r2, [r5, r2]
	rsbmi r8, r8, #0
	movpl r7, #0
	cmp r8, r2
	orrge r7, r7, #1
	tst r7, #1
	moveq r2, #0
	tst r7, #2
	rsbne r2, r2, #0
	add r8, sl, r2
	cmp r8, r4
	movlt r8, r4
	cmp r8, r4, lsr #17
	ldrsb r2, [ip, r7]
	movgt r8, lr
	adds sb, sb, r2
	movmi sb, #0
	bmi _020B1488
	cmp sb, #0x58
	movgt sb, #0x58
_020B1488:
	strh r8, [r3]
	and r2, r7, #0xff
	strb sb, [r3, #2]
	orr r2, r6, r2, lsl #6
	strb r2, [r0], #1
	ldr r2, [sp]
	add fp, fp, #1
	cmp fp, r2
	blo _020B12B0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B14B0: .word 0x02109004
_020B14B4: .word 0x02108FE8
	arm_func_end sub_020B1288

	arm_func_start sub_020B14B8
sub_020B14B8: ; 0x020B14B8
	stmdb sp!, {r3, lr}
	ldrsh ip, [r0]
	cmp r3, #2
	strh ip, [sp]
	ldrb ip, [r0, #2]
	strb ip, [sp, #2]
	beq _020B14E8
	cmp r3, #3
	beq _020B14FC
	cmp r3, #4
	beq _020B1510
	ldmia sp!, {r3, pc}
_020B14E8:
	add r3, sp, #0
	add r0, r0, #4
	sub r2, r2, #4
	bl sub_020B1070
	ldmia sp!, {r3, pc}
_020B14FC:
	add r3, sp, #0
	add r0, r0, #4
	sub r2, r2, #4
	bl sub_020B06D0
	ldmia sp!, {r3, pc}
_020B1510:
	add r3, sp, #0
	add r0, r0, #4
	sub r2, r2, #4
	bl sub_020B03F0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B14B8

	arm_func_start sub_020B1524
sub_020B1524: ; 0x020B1524
	stmdb sp!, {r4, lr}
	ldrsh r4, [r3]
	ldr ip, [sp, #8]
	mov lr, #0
	strh r4, [r0]
	ldrb r4, [r3, #2]
	cmp ip, #2
	strb r4, [r0, #2]
	strb lr, [r0, #3]
	beq _020B1560
	cmp ip, #3
	beq _020B156C
	cmp ip, #4
	beq _020B1578
	ldmia sp!, {r4, pc}
_020B1560:
	add r0, r0, #4
	bl sub_020B1288
	ldmia sp!, {r4, pc}
_020B156C:
	add r0, r0, #4
	bl sub_020B0B64
	ldmia sp!, {r4, pc}
_020B1578:
	add r0, r0, #4
	bl sub_020B0544
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B1524

	arm_func_start sub_020B1584
sub_020B1584: ; 0x020B1584
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bl sub_020D3550
	ldr r2, _020B1668 ; =0x021D6040
	ldr r1, _020B166C ; =_021108D8
	mov r3, #1
	str r3, [r1]
	strh r0, [r2]
	mov r1, #0
	str r1, [r2, #0x20]
	ldr r0, _020B1670 ; =0x021D8498
	str r1, [r2, #4]
	ldr r0, [r0, #0x10]
	ldr r3, _020B1674 ; =0x021090B8
	cmp r0, #1
	streq r1, [r2, #0x1c]
	movne r0, #4
	strne r0, [r2, #0x1c]
	ldr r1, _020B1668 ; =0x021D6040
	mov r0, #0x440
	str r0, [r1, #0x24]
	ldr r5, [r1, #0x1c]
	mov r0, #0x44
	add r2, r3, r5, lsl #1
	ldrb r4, [r2, #1]
	ldrb r3, [r3, r5, lsl #1]
	mov r2, #0
	mla r0, r3, r0, r4
	add r0, r0, #0xc
	str r0, [r1, #0xc]
	str r2, [r1, #0xf00]
	str r2, [r1, #0xf04]
	str r2, [r1, #0xf0c]
	str r2, [r1, #0xf08]
	str r2, [r1, #0xf10]
	str r2, [r1, #0xf14]
	bl sub_020B43A8
	mov sb, #0
	mov r8, sb
	ldr r7, _020B1678 ; =0x021D606C
	ldr r6, _020B167C ; =0x021D6078
	mvn r5, #0
	mov r4, #0x94
	b _020B1650
_020B1630:
	mov r0, sb
	str r8, [r7, sb, lsl #2]
	bl sub_020B27E0
	mla r0, sb, r4, r6
	mov r1, sb
	mov r2, r5
	bl sub_020B2AC0
	add sb, sb, #1
_020B1650:
	cmp sb, #3
	blo _020B1630
	bl sub_020B23F0
	bl sub_020B44BC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020B1668: .word 0x021D6040
_020B166C: .word _021108D8
_020B1670: .word 0x021D8498
_020B1674: .word 0x021090B8
_020B1678: .word 0x021D606C
_020B167C: .word 0x021D6078
	arm_func_end sub_020B1584

	arm_func_start sub_020B1680
sub_020B1680: ; 0x020B1680
	ldr r0, _020B1690 ; =0x021D6040
	mov r1, #0
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_020B1690: .word 0x021D6040
	arm_func_end sub_020B1680

	arm_func_start sub_020B1694
sub_020B1694: ; 0x020B1694
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _020B17C0 ; =0x021D6040
	ldr r0, [r0, #0x20]
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0xc]
	cmp r0, #2
	cmpne r0, #3
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r4, #0
	ldr r1, _020B17C4 ; =0x021D606C
	b _020B16EC
_020B16D8:
	ldr r0, [r1, r4, lsl #2]
	cmp r0, r5
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	add r4, r4, #1
_020B16EC:
	cmp r4, #3
	blo _020B16D8
	mov r4, #0
	ldr r1, _020B17C4 ; =0x021D606C
	b _020B1714
_020B1700:
	ldr r0, [r1, r4, lsl #2]
	cmp r0, #0
	streq r5, [r1, r4, lsl #2]
	beq _020B171C
	add r4, r4, #1
_020B1714:
	cmp r4, #3
	blo _020B1700
_020B171C:
	ldr r1, _020B17C0 ; =0x021D6040
	ldr r2, _020B17C8 ; =0x021D6078
	ldr r3, [r1, #0x20]
	mov r0, #0x94
	add r3, r3, #1
	str r3, [r1, #0x20]
	ldr ip, [r1, #4]
	ldr r3, [r5, #8]
	mla r0, r4, r0, r2
	orr r2, ip, r3
	str r2, [r1, #4]
	ldrb r2, [r5, #5]
	mov r1, r4
	bl sub_020B2AC0
	mov r0, r4
	bl sub_020B27E0
	ldr r0, [r5, #0xc]
	cmp r0, #2
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _020B17C0 ; =0x021D6040
	ldr r0, [r0, #0x20]
	cmp r0, #1
	bne _020B17B8
	bl sub_020B415C
	bl sub_020D3550
	ldr r1, _020B17C0 ; =0x021D6040
	mov r2, #0
	strh r0, [r1]
	strh r2, [r1, #0x10]
	strb r2, [r1, #0x12]
	mov r0, #1
	str r0, [r1, #0x14]
	str r2, [r1, #0xf00]
	str r2, [r1, #0xf04]
	str r2, [r1, #0xf0c]
	str r2, [r1, #0xf08]
	str r2, [r1, #0xf10]
	str r2, [r1, #0xf14]
_020B17B8:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B17C0: .word 0x021D6040
_020B17C4: .word 0x021D606C
_020B17C8: .word 0x021D6078
	arm_func_end sub_020B1694

	arm_func_start sub_020B17CC
sub_020B17CC: ; 0x020B17CC
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _020B1874 ; =0x021D606C
	mov r5, r0
	mov r4, #0
_020B17DC:
	ldr r0, [ip, r4, lsl #2]
	cmp r0, r5
	bne _020B183C
	ldr r1, _020B1878 ; =0x021D6078
	mov r0, #0x94
	mla r0, r4, r0, r1
	ldr r1, _020B187C ; =0x021D6040
	mov r3, #0
	ldr r2, [r1, #0x20]
	str r3, [ip, r4, lsl #2]
	sub r2, r2, #1
	str r2, [r1, #0x20]
	bl sub_020B2B4C
	mov r0, r4
	bl sub_020B281C
	mov r0, r4
	bl sub_020B2430
	ldr r0, _020B187C ; =0x021D6040
	ldr r1, [r5, #8]
	ldr r2, [r0, #4]
	mvn r1, r1
	and r1, r2, r1
	str r1, [r0, #4]
	b _020B1848
_020B183C:
	add r4, r4, #1
	cmp r4, #3
	blo _020B17DC
_020B1848:
	ldr r0, _020B187C ; =0x021D6040
	ldr r1, [r0, #0x20]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	str r1, [r0, #0x14]
	bl sub_020B415C
	ldr r0, _020B187C ; =0x021D6040
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B1874: .word 0x021D606C
_020B1878: .word 0x021D6078
_020B187C: .word 0x021D6040
	arm_func_end sub_020B17CC

	arm_func_start sub_020B1880
sub_020B1880: ; 0x020B1880
	stmdb sp!, {r4, lr}
	ldr r3, _020B1980 ; =0x021D6040
	mov r2, r1
	ldr r1, [r3, #0x24]
	mov ip, #0
	cmp r2, r1
	movne r0, ip
	ldmneia sp!, {r4, pc}
	ldr r1, [r3, #0x20]
	cmp r1, #0
	moveq r0, ip
	ldmeqia sp!, {r4, pc}
	mov r4, ip
	ldr r3, _020B1984 ; =0x021D606C
	b _020B18DC
_020B18BC:
	ldr r1, [r3, r4, lsl #2]
	cmp r1, #0
	beq _020B18D8
	ldr r1, [r1, #0xc]
	cmp r1, #2
	moveq ip, #1
	beq _020B18E4
_020B18D8:
	add r4, r4, #1
_020B18DC:
	cmp r4, #3
	blo _020B18BC
_020B18E4:
	cmp ip, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, _020B1980 ; =0x021D6040
	ldr ip, _020B1988 ; =0x021D6680
	ldr r1, [r1, #0xf04]
	ldr r3, _020B198C ; =0x5F564354
	tst r1, #1
	ldr r1, _020B1980 ; =0x021D6040
	movne r4, #0
	moveq r4, #0x460
	ldr r1, [r1, #0x1c]
	str r3, [ip, r4]
	cmp r1, #2
	add r4, ip, r4
	blt _020B1930
	add r1, r4, #0x10
	bl sub_020D48B4
	b _020B1938
_020B1930:
	add r1, r4, #0xc
	bl sub_020D48B4
_020B1938:
	ldr r0, _020B1980 ; =0x021D6040
	mov r1, #0x40
	ldrh r2, [r0]
	strb r1, [r4, #4]
	add r1, r2, #1
	strh r1, [r0]
	strh r2, [r4, #6]
	bl sub_020D34B0
	mov r2, #0x40
	mov r3, #0
	bl _ll_udiv
	str r0, [r4, #8]
	ldr r1, _020B1980 ; =0x021D6040
	mov r0, #1
	ldr r2, [r1, #0xf04]
	add r2, r2, #1
	str r2, [r1, #0xf04]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B1980: .word 0x021D6040
_020B1984: .word 0x021D606C
_020B1988: .word 0x021D6680
_020B198C: .word 0x5F564354
	arm_func_end sub_020B1880

	arm_func_start sub_020B1990
sub_020B1990: ; 0x020B1990
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r4, _020B1BD4 ; =0x021D6078
	mov sl, r2
	mov r2, #0x94
	mla r6, sl, r2, r4
	str r0, [sp]
	mov r0, sl
	str r1, [sp, #4]
	mov fp, r3
	mov r7, #1
	bl sub_020B2AB0
	movs r4, r0
	beq _020B1BB0
_020B19C8:
	bl sub_020D34B0
	mov r8, r0
	mov r0, sl
	mov sb, r1
	bl sub_020B2A0C
	movs r5, r0
	beq _020B1B98
	ldr r1, [r5, #0x46c]
	adds r3, r8, #0x34
	ldr r0, [r5, #0x470]
	adc r2, sb, #0
	cmp r0, r2
	cmpeq r1, r3
	bls _020B1A7C
	ldr r0, [r5, #0x45c]
	cmp r0, #0
	bne _020B1A70
	ldr r0, [r6, #0x3c]
	cmp r0, #0
	beq _020B1A70
	ldr r0, [r6, #0x20]
	ldr r1, [sp]
	add r0, r0, #1
	str r0, [r6, #0x20]
	ldr r0, [r6, #0x3c]
	ldr r2, [sp, #4]
	ldr r0, [r0, #0x474]
	bl sub_020D48B4
	ldr r0, [r6, #0x3c]
	bl sub_020B4128
	mov r0, #0
	str r0, [r6, #0x3c]
	cmp fp, #0
	beq _020B1A64
	ldrb r0, [r5, #0x10]
	ldr r2, [fp]
	mov r1, #1
	orr r0, r2, r1, lsl r0
	str r0, [fp]
_020B1A64:
	add sp, sp, #8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B1A70:
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B1A7C:
	ldr r2, _020B1BD8 ; =0x00008B4C
	adds r2, r1, r2
	adc r0, r0, #0
	cmp sb, r0
	cmpeq r8, r2
	bls _020B1ABC
	ldr r2, [r5, #0x18]
	mov r0, r6
	mov r1, r5
	str r2, [r6, #0x58]
	bl sub_020B2B78
	mov r4, r0
	mov r0, sl
	bl sub_020B2A0C
	mov r7, #0
	b _020B1BA8
_020B1ABC:
	ldr r1, [r6, #0x58]
	ldr r2, [r5, #0x18]
	add r0, r1, #1
	cmp r0, r2
	cmpne r1, #0
	beq _020B1AF0
	cmp r1, r2
	bhi _020B1AF0
	ldr r0, [r5, #0x45c]
	cmp r0, #0
	ldreq r0, [r6, #0x14]
	addeq r0, r0, #1
	streq r0, [r6, #0x14]
_020B1AF0:
	ldr r0, [r5, #0x18]
	cmp r7, #0
	str r0, [r6, #0x58]
	ldrne r0, [r6, #0x70]
	cmpne r0, #0
	beq _020B1B30
	mov r0, r6
	mov r1, r5
	bl sub_020B2B78
	mov r4, r0
	mov r0, sl
	bl sub_020B2A0C
	ldr r0, [r6, #0x70]
	sub r0, r0, #1
	str r0, [r6, #0x70]
	b _020B1BA8
_020B1B30:
	ldr r1, [r5, #0x464]
	ldr r0, [r6, #0x28]
	subs r1, r8, r1
	sub r0, r1, r0
	sub r0, r0, r1
	str r1, [r6, #0x28]
	add r0, r1, r0, lsr #4
	str r0, [r6, #0x2c]
	str r0, [r6]
	ldr r0, [r5, #0x474]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_020D48B4
	mov r0, r6
	mov r1, r5
	bl sub_020B2B78
	cmp fp, #0
	beq _020B1B8C
	ldrb r0, [r5, #0x10]
	ldr r2, [fp]
	mov r1, #1
	orr r0, r2, r1, lsl r0
	str r0, [fp]
_020B1B8C:
	add sp, sp, #8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B1B98:
	add sp, sp, #8
	str r4, [r6, #8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B1BA8:
	cmp r4, #0
	bne _020B19C8
_020B1BB0:
	ldr r0, [r6, #0x3c]
	cmp r0, #0
	beq _020B1BC8
	bl sub_020B4128
	mov r0, #0
	str r0, [r6, #0x3c]
_020B1BC8:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B1BD4: .word 0x021D6078
_020B1BD8: .word 0x00008B4C
	arm_func_end sub_020B1990

	arm_func_start sub_020B1BDC
sub_020B1BDC: ; 0x020B1BDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r5, r2
	mov r7, r0
	movne r0, #0
	strne r0, [r5]
	ldr r0, _020B1CF0 ; =0x021D6040
	mov r6, r1
	ldr r1, [r0, #0x24]
	mov r4, #0
	cmp r6, r1
	bne _020B1CB8
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _020B1CB8
	mov r8, r4
_020B1C18:
	mov r0, r7
	mov r1, r6
	mov r2, r8
	mov r3, r5
	bl sub_020B1990
	cmp r0, #1
	moveq r4, #1
	beq _020B1C44
	add r8, r8, #1
	cmp r8, #3
	blo _020B1C18
_020B1C44:
	cmp r4, #0
	beq _020B1CA4
	add sb, r8, #1
	cmp sb, #3
	moveq r4, #1
	beq _020B1CCC
	bhs _020B1CCC
	ldr r8, _020B1CF4 ; =0x021D6234
_020B1C64:
	mov r0, r8
	mov r1, r6
	mov r2, sb
	mov r3, r5
	bl sub_020B1990
	cmp r0, #1
	bne _020B1C94
	mov r0, r7
	mov r1, r8
	mov r2, r7
	mov r3, r6
	bl sub_020B478C
_020B1C94:
	add sb, sb, #1
	cmp sb, #3
	blo _020B1C64
	b _020B1CCC
_020B1CA4:
	mov r1, r7
	mov r2, r6
	mov r0, #0
	bl sub_020D4858
	b _020B1CCC
_020B1CB8:
	mov r1, r7
	mov r2, r6
	mov r0, #0
	bl sub_020D4858
	mov r4, #0
_020B1CCC:
	ldr r0, _020B1CF0 ; =0x021D6040
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _020B1CE8
	mov r0, r7
	mov r1, r6
	bl sub_020B4538
_020B1CE8:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020B1CF0: .word 0x021D6040
_020B1CF4: .word 0x021D6234
	arm_func_end sub_020B1BDC

	arm_func_start sub_020B1CF8
sub_020B1CF8: ; 0x020B1CF8
	cmp r0, #5
	movge r0, #0
	bxge lr
	ldr r1, _020B1D5C ; =0x021D8498
	ldr r1, [r1, #0x10]
	cmp r1, #1
	beq _020B1D20
	cmp r0, #1
	movls r0, #0
	bxls lr
_020B1D20:
	ldr r2, _020B1D60 ; =0x021090B9
	ldr r1, _020B1D64 ; =0x021090B8
	ldrb ip, [r2, r0, lsl #1]
	ldrb r3, [r1, r0, lsl #1]
	mov r1, #0x44
	ldr r2, _020B1D68 ; =0x021D6040
	mla r1, r3, r1, ip
	add r1, r1, #0xc
	str r1, [r2, #0xc]
	str r0, [r2, #0x1c]
	mov r0, #0
	strh r0, [r2, #0x10]
	strb r0, [r2, #0x12]
	mov r0, #1
	bx lr
	.align 2, 0
_020B1D5C: .word 0x021D8498
_020B1D60: .word 0x021090B9
_020B1D64: .word 0x021090B8
_020B1D68: .word 0x021D6040
	arm_func_end sub_020B1CF8

	arm_func_start sub_020B1D6C
sub_020B1D6C: ; 0x020B1D6C
	stmdb sp!, {r4, lr}
	ldr r1, _020B1D94 ; =_021108D8
	mov r4, r0
	str r4, [r1]
	bl sub_020B415C
	cmp r4, #0
	ldreq r0, _020B1D98 ; =0x021D6040
	moveq r1, #1
	streq r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B1D94: .word _021108D8
_020B1D98: .word 0x021D6040
	arm_func_end sub_020B1D6C

	arm_func_start sub_020B1D9C
sub_020B1D9C: ; 0x020B1D9C
	ldr r1, _020B1DA8 ; =0x021D6040
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_020B1DA8: .word 0x021D6040
	arm_func_end sub_020B1D9C

	arm_func_start sub_020B1DAC
sub_020B1DAC: ; 0x020B1DAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r0, _020B200C ; =0x021D6040
	ldr r2, [r0, #0xf04]
	ldr r1, [r0, #0xf00]
	ldr r8, [r0, #0x1c]
	sub r1, r2, r1
	cmp r1, #1
	subhi r1, r2, #1
	strhi r1, [r0, #0xf00]
	movhi r1, #1
	cmp r1, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r0, _020B200C ; =0x021D6040
	ldr r0, [r0, #0xf00]
	tst r0, #1
	movne r1, #0
	moveq r1, #0x460
	ldr r0, _020B2010 ; =0x021D6680
	cmp r8, #2
	add r5, r0, r1
	ldr r1, _020B200C ; =0x021D6040
	add r4, r5, #0xc
	addge r4, r4, #4
	ldr r1, [r1, #0x24]
	mov r0, r4
	bl sub_020B43D0
	ldr r1, _020B2014 ; =0x040002B0
	mov r2, #0
	mov r6, r0
	strh r2, [r1]
	str r6, [r1, #8]
_020B1E34:
	ldrh r0, [r1]
	tst r0, #0x8000
	bne _020B1E34
	ldr r0, _020B200C ; =0x021D6040
	ldr r2, _020B2018 ; =0x040002B4
	ldr r1, [r0, #0x18]
	ldr r7, [r2]
	cmp r1, #0
	beq _020B1E68
	ldr r1, [r0, #0x24]
	mov r0, r4
	mov r2, r7
	bl sub_020B476C
_020B1E68:
	ldr r0, _020B201C ; =_021108D8
	strb r8, [r5, #5]
	ldr r0, [r0]
	cmp r0, #0
	beq _020B1ED8
	mov r0, r6
	mov r1, r7
	mov r2, #0
	bl sub_020B41C8
	ldr r1, _020B200C ; =0x021D6040
	cmp r0, #0
	str r0, [r1, #0x28]
	beq _020B1EB4
	cmp r0, #1
	beq _020B1ECC
	cmp r0, #3
	moveq r0, #0x41
	streqb r0, [r5, #4]
	b _020B1ED8
_020B1EB4:
	ldr r2, [r1, #0xf00]
	add sp, sp, #4
	add r2, r2, #1
	str r2, [r1, #0xf00]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020B1ECC:
	ldrb r0, [r5, #5]
	orr r0, r0, #0x80
	strb r0, [r5, #5]
_020B1ED8:
	ldr r0, _020B201C ; =_021108D8
	ldr r0, [r0]
	cmp r0, #0
	bne _020B1F0C
	ldr r0, _020B200C ; =0x021D6040
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _020B1F0C
	ldrb r2, [r5, #5]
	mov r1, #0
	str r1, [r0, #8]
	orr r0, r2, #0x80
	strb r0, [r5, #5]
_020B1F0C:
	ldr r0, _020B200C ; =0x021D6040
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _020B1F30
	ldrb r2, [r5, #5]
	mov r1, #0
	str r1, [r0, #0x14]
	orr r0, r2, #0x80
	strb r0, [r5, #5]
_020B1F30:
	cmp r8, #2
	blt _020B1F78
	ldrb r0, [r5, #5]
	tst r0, #0x80
	beq _020B1F54
	ldr r0, _020B200C ; =0x021D6040
	mov r1, #0
	strh r1, [r0, #0x10]
	strb r1, [r0, #0x12]
_020B1F54:
	ldr r0, _020B200C ; =0x021D6040
	str r8, [sp]
	ldr r2, [r0, #0x24]
	ldr r3, _020B2020 ; =0x021D6050
	mov r1, r4
	sub r0, r4, #4
	mov r2, r2, lsr #1
	bl sub_020B1524
	b _020B1FBC
_020B1F78:
	cmp r8, #1
	bne _020B1F9C
	ldr r1, _020B200C ; =0x021D6040
	mov r0, r4
	ldr r2, [r1, #0x24]
	mov r1, r4
	mov r2, r2, lsr #1
	bl sub_020B2684
	b _020B1FBC
_020B1F9C:
	cmp r8, #0
	bne _020B1FBC
	ldr r1, _020B200C ; =0x021D6040
	mov r0, r4
	ldr r2, [r1, #0x24]
	mov r1, r4
	mov r2, r2, lsr #1
	bl sub_020B2784
_020B1FBC:
	ldr r1, _020B200C ; =0x021D6040
	ldr r0, _020B2024 ; =0x021D8498
	ldr r3, [r1, #4]
	mov r2, #1
	str r3, [r1, #0xf0c]
	ldrb r0, [r0]
	mvn r0, r2, lsl r0
	and r0, r3, r0
	str r0, [r1, #0xf0c]
	bl sub_020E3714
	sub r0, r0, #1
	ldr r1, _020B200C ; =0x021D6040
	cmp r0, #7
	str r0, [r1, #0xf14]
	movgt r0, #0
	movle r2, #0
	movle r0, r5
	strle r2, [r1, #0xf10]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020B200C: .word 0x021D6040
_020B2010: .word 0x021D6680
_020B2014: .word 0x040002B0
_020B2018: .word 0x040002B4
_020B201C: .word _021108D8
_020B2020: .word 0x021D6050
_020B2024: .word 0x021D8498
	arm_func_end sub_020B1DAC

	arm_func_start sub_020B2028
sub_020B2028: ; 0x020B2028
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _020B2204 ; =0x021D6040
	mov sl, r0
	ldr r0, [r4, #0x20]
	ldr r7, [sp, #0x28]
	mov sb, r1
	mov r8, r2
	mov fp, r3
	mov r5, #0
	cmp r0, #0
	moveq r0, r5
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, _020B2208 ; =0x021D6078
	mov r2, r5
_020B2060:
	ldr r0, [r1, #0x38]
	cmp sl, r0
	bne _020B207C
	ldr r1, _020B2208 ; =0x021D6078
	mov r0, #0x94
	mla r5, r2, r0, r1
	b _020B208C
_020B207C:
	add r2, r2, #1
	cmp r2, #3
	add r1, r1, #0x94
	blo _020B2060
_020B208C:
	cmp r5, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [sb, #4]
	cmp r0, #0x41
	bne _020B20C0
	ldrh r2, [sb, #6]
	mov r0, #0
	mov r1, #1
	str r2, [r5, #0x30]
	str r0, [r5, #0x4c]
	str r1, [r5, #0x6c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B20C0:
	cmp r0, #0x40
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [sb, #5]
	and r6, r0, #0x7f
	cmp r6, #5
	str r6, [r5, #0x24]
	movge r0, #0
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, _020B220C ; =0x021090B9
	ldr r0, _020B2210 ; =0x021090B8
	ldrb r2, [r1, r6, lsl #1]
	ldrb r1, [r0, r6, lsl #1]
	mov r0, #0x44
	mla r0, r1, r0, r2
	add r0, r0, #0xc
	cmp r8, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	movne r0, #1
	movne r1, r0, lsl sl
	ldr r0, _020B2204 ; =0x021D6040
	moveq r1, #1
	ldr r0, [r0, #4]
	tst r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl sub_020B40F4
	movs r4, r0
	bne _020B2174
	ldr r0, [r5, #0x34]
	bl sub_020B281C
	ldr r0, [r5, #0x34]
	bl sub_020B2430
	bl sub_020B40F4
	movs r4, r0
	bne _020B2168
	bl sub_020B288C
	bl sub_020B248C
	bl sub_020B40F4
	mov r4, r0
_020B2168:
	cmp r4, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B2174:
	add r0, r4, #0x5c
	add r0, r0, #0x400
	sub r2, r8, #0xc
	sub r1, r0, r2
	add r0, sb, #0xc
	str r1, [sp]
	bl sub_020D4A50
	ldr r0, [r5, #0x34]
	sub r1, r8, #0xc
	strb r0, [r4, #0x11]
	ldr r0, [sp]
	str r6, [r4, #0xc]
	str r0, [r4, #0x474]
	str r1, [r4, #0x14]
	str fp, [r4, #0x464]
	str r7, [r4, #0x468]
	strb sl, [r4, #0x10]
	ldrb r2, [sb, #5]
	mov r0, r5
	mov r1, r4
	and r2, r2, #0x80
	str r2, [r4, #0x45c]
	ldr r2, [sb, #8]
	str r2, [r4, #0x460]
	ldrh r2, [sb, #6]
	str r2, [r4, #0x18]
	bl sub_020B2C9C
	cmp r0, #0
	mov r0, r4
	bne _020B21F8
	bl sub_020B4128
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B21F8:
	bl sub_020B24F8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B2204: .word 0x021D6040
_020B2208: .word 0x021D6078
_020B220C: .word 0x021090B9
_020B2210: .word 0x021090B8
	arm_func_end sub_020B2028

	arm_func_start sub_020B2214
sub_020B2214: ; 0x020B2214
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	bl sub_020B2580
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	bl sub_020D3A38
	ldrb r6, [r4, #0x11]
	mov r7, r0
	mov r0, r6
	bl sub_020B2590
	mov r5, r0
	cmp r5, #0
	mov r4, #0
	ble _020B22D4
_020B224C:
	mov r0, r6
	bl sub_020B25A0
	mov r8, r0
	ldr r3, [r8, #0xc]
	cmp r3, #2
	blt _020B2278
	ldr r0, [r8, #0x474]
	ldr r2, [r8, #0x14]
	add r1, r8, #0x1c
	bl sub_020B14B8
	b _020B229C
_020B2278:
	cmp r3, #1
	ldr r0, [r8, #0x474]
	ldr r2, [r8, #0x14]
	bne _020B2294
	add r1, r8, #0x1c
	bl sub_020B2730
	b _020B229C
_020B2294:
	add r1, r8, #0x1c
	bl sub_020B27B0
_020B229C:
	add r1, r8, #0x1c
	mov r0, r8
	str r1, [r8, #0x474]
	bl sub_020B25F0
	ldrb r1, [r8, #0x11]
	mov r0, r8
	bl sub_020B290C
	cmp r0, #0
	bge _020B22C8
	mov r0, r8
	bl sub_020B4128
_020B22C8:
	add r4, r4, #1
	cmp r4, r5
	blt _020B224C
_020B22D4:
	mov r0, r7
	bl sub_020D3A4C
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020B2214

	arm_func_start sub_020B22E4
sub_020B22E4: ; 0x020B22E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _020B23E4 ; =0x021D6040
	ldr r0, [r1, #0x20]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r1, #0xf08]
	cmp r0, #0
	bne _020B232C
	bl sub_020B1DAC
	ldr r1, _020B23E4 ; =0x021D6040
	cmp r0, #0
	str r0, [r1, #0xf08]
	ldrne r0, [r1, #0x18]
	cmpne r0, #0
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B232C:
	ldr r0, _020B23E8 ; =0x021D8498
	mov r5, #1
	ldr r0, [r0, #0x10]
	cmp r0, #2
	bne _020B2360
	ldr r3, [r1, #0xf10]
	ldr r0, _020B23EC ; =0x021090C2
	add r2, r3, #1
	str r2, [r1, #0xf10]
	ldr r1, [r1, #0xf14]
	add r1, r1, r1, lsl #1
	add r0, r0, r1
	ldrb r5, [r3, r0]
_020B2360:
	mov r4, #0
	mov r7, #0x80000000
	ldr r6, _020B23E4 ; =0x021D6040
	b _020B23D4
_020B2370:
	ldr r1, [r6, #0xf0c]
	mov r2, r1
	clz r2, r2
	cmp r2, #0x20
	beq _020B23DC
	mvn r0, r7, lsr r2
	and r0, r1, r0
	str r0, [r6, #0xf0c]
	rsb r0, r2, #0x1f
	ldr r1, [r6, #0xf08]
	ldr r2, [r6, #0xc]
	and r0, r0, #0xff
	bl ov00_021F97C0
	ldr r0, [r6, #0xf0c]
	cmp r0, #0
	bne _020B23D0
	ldr r0, _020B23E4 ; =0x021D6040
	mov r1, #0
	ldr r2, [r0, #0xf00]
	add r2, r2, #1
	str r2, [r0, #0xf00]
	str r1, [r0, #0xf08]
	str r1, [r0, #0xf0c]
	b _020B23DC
_020B23D0:
	add r4, r4, #1
_020B23D4:
	cmp r4, r5
	blt _020B2370
_020B23DC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B23E4: .word 0x021D6040
_020B23E8: .word 0x021D8498
_020B23EC: .word 0x021090C2
	arm_func_end sub_020B22E4

	arm_func_start sub_020B23F0
sub_020B23F0: ; 0x020B23F0
	stmdb sp!, {r3, lr}
	bl sub_020D3A38
	mov r3, #0
	ldr r1, _020B2428 ; =0x021D6F58
	mov r2, r3
	str r3, [r1, #4]
	str r3, [r1]
	ldr r1, _020B242C ; =0x021D6F60
_020B2410:
	str r2, [r1, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #3
	blt _020B2410
	bl sub_020D3A4C
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B2428: .word 0x021D6F58
_020B242C: .word 0x021D6F60
	arm_func_end sub_020B23F0

	arm_func_start sub_020B2430
sub_020B2430: ; 0x020B2430
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl sub_020D3A38
	mov r4, r0
	mov r0, r6
	bl sub_020B25A0
	movs r5, r0
	beq _020B2470
_020B2450:
	mov r0, r5
	bl sub_020B25F0
	mov r0, r5
	bl sub_020B4128
	mov r0, r6
	bl sub_020B25A0
	movs r5, r0
	bne _020B2450
_020B2470:
	ldr r1, _020B2488 ; =0x021D6F60
	mov r2, #0
	mov r0, r4
	str r2, [r1, r6, lsl #2]
	bl sub_020D3A4C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B2488: .word 0x021D6F60
	arm_func_end sub_020B2430

	arm_func_start sub_020B248C
sub_020B248C: ; 0x020B248C
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_020D3A38
	ldr r1, _020B24F0 ; =0x021D6F58
	mov r4, r0
	ldr r5, [r1]
	cmp r5, #0
	beq _020B24BC
_020B24A8:
	mov r0, r5
	ldr r5, [r5, #8]
	bl sub_020B4128
	cmp r5, #0
	bne _020B24A8
_020B24BC:
	ldr r0, _020B24F0 ; =0x021D6F58
	mov r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	ldr r0, _020B24F4 ; =0x021D6F60
	mov r1, r2
_020B24D4:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #3
	blt _020B24D4
	mov r0, r4
	bl sub_020D3A4C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B24F0: .word 0x021D6F58
_020B24F4: .word 0x021D6F60
	arm_func_end sub_020B248C

	arm_func_start sub_020B24F8
sub_020B24F8: ; 0x020B24F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020D3A38
	ldr r1, _020B2578 ; =0x021D6F58
	ldr r2, [r1]
	cmp r2, #0
	bne _020B2534
	str r4, [r1]
	mov r3, #0
	str r3, [r4, #4]
	ldr r2, [r1]
	str r3, [r2, #8]
	ldr r2, [r1]
	str r2, [r1, #4]
	b _020B2550
_020B2534:
	ldr r3, [r1, #4]
	mov r2, #0
	str r3, [r4, #4]
	str r2, [r4, #8]
	ldr r2, [r1, #4]
	str r4, [r2, #8]
	str r4, [r1, #4]
_020B2550:
	ldrb r2, [r4, #0x11]
	ldr r3, _020B257C ; =0x021D6F60
	ldr r1, [r3, r2, lsl #2]
	add r1, r1, #1
	str r1, [r3, r2, lsl #2]
	bl sub_020D3A4C
	ldrb r1, [r4, #0x11]
	ldr r0, _020B257C ; =0x021D6F60
	ldr r0, [r0, r1, lsl #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B2578: .word 0x021D6F58
_020B257C: .word 0x021D6F60
	arm_func_end sub_020B24F8

	arm_func_start sub_020B2580
sub_020B2580: ; 0x020B2580
	ldr r0, _020B258C ; =0x021D6F58
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020B258C: .word 0x021D6F58
	arm_func_end sub_020B2580

	arm_func_start sub_020B2590
sub_020B2590: ; 0x020B2590
	ldr r1, _020B259C ; =0x021D6F60
	ldr r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_020B259C: .word 0x021D6F60
	arm_func_end sub_020B2590

	arm_func_start sub_020B25A0
sub_020B25A0: ; 0x020B25A0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020B25EC ; =0x021D6F58
	mov r5, r0
	ldr r4, [r1]
	bl sub_020D3A38
	cmp r4, #0
	beq _020B25E0
_020B25BC:
	ldrb r1, [r4, #0x11]
	cmp r1, r5
	bne _020B25D4
	bl sub_020D3A4C
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_020B25D4:
	ldr r4, [r4, #8]
	cmp r4, #0
	bne _020B25BC
_020B25E0:
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B25EC: .word 0x021D6F58
	arm_func_end sub_020B25A0

	arm_func_start sub_020B25F0
sub_020B25F0: ; 0x020B25F0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020D3A38
	ldr r2, [r4, #4]
	cmp r2, #0
	ldrne r1, [r4, #8]
	strne r1, [r2, #8]
	bne _020B2628
	ldr r2, [r4, #8]
	ldr r1, _020B267C ; =0x021D6F58
	cmp r2, #0
	str r2, [r1]
	movne r1, #0
	strne r1, [r2, #4]
_020B2628:
	ldr r2, [r4, #8]
	cmp r2, #0
	ldrne r1, [r4, #4]
	strne r1, [r2, #4]
	bne _020B2654
	ldr r2, [r4, #4]
	ldr r1, _020B267C ; =0x021D6F58
	cmp r2, #0
	str r2, [r1, #4]
	movne r1, #0
	strne r1, [r2, #8]
_020B2654:
	ldrb r2, [r4, #0x11]
	ldr r3, _020B2680 ; =0x021D6F60
	ldr r1, [r3, r2, lsl #2]
	sub r1, r1, #1
	str r1, [r3, r2, lsl #2]
	bl sub_020D3A4C
	ldrb r1, [r4, #0x11]
	ldr r0, _020B2680 ; =0x021D6F60
	ldr r0, [r0, r1, lsl #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B267C: .word 0x021D6F58
_020B2680: .word 0x021D6F60
	arm_func_end sub_020B25F0

	arm_func_start sub_020B2684
sub_020B2684: ; 0x020B2684
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	cmp r2, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr ip, _020B2728 ; =0x00001FDF
	ldr r3, _020B272C ; =_021108DC
	mov lr, #0xff
	mov r4, #0x7f
_020B26A4:
	mov r5, r7, lsl #1
	ldrsh r5, [r1, r5]
	mov fp, r3
	movs sl, r5, asr #2
	movmi r6, r4
	ldr r5, _020B2728 ; =0x00001FDF
	rsbmi sl, sl, #0
	movpl r6, lr
	cmp sl, r5
	movgt sl, ip
	mov r5, #0
	add sb, sl, #0x21
_020B26D4:
	ldr r8, [fp], #4
	cmp sb, r8
	ble _020B26F0
	add r5, r5, #1
	cmp r5, #8
	blt _020B26D4
	mov r5, #8
_020B26F0:
	cmp r5, #8
	eorge r5, r6, #0x7f
	bge _020B2714
	add sb, sl, #0x21
	add r8, r5, #1
	mov r8, sb, asr r8
	and r8, r8, #0xf
	orr r5, r8, r5, lsl #4
	eor r5, r5, r6
_020B2714:
	strb r5, [r0, r7]
	add r7, r7, #1
	cmp r7, r2
	blo _020B26A4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B2728: .word 0x00001FDF
_020B272C: .word _021108DC
	arm_func_end sub_020B2684

	arm_func_start sub_020B2730
sub_020B2730: ; 0x020B2730
	stmdb sp!, {r4, lr}
	mov r4, #0
	cmp r2, #0
	ldmlsia sp!, {r4, pc}
_020B2740:
	ldrb r3, [r0, r4]
	mvn lr, r3
	mov r3, lr, lsl #0x1c
	mov ip, r3, lsr #0x19
	and r3, lr, #0x70
	add ip, ip, #0x84
	mov r3, r3, asr #4
	mov r3, ip, lsl r3
	tst lr, #0x80
	rsbne ip, r3, #0x84
	subeq ip, r3, #0x84
	mov r3, r4, lsl #1
	add r4, r4, #1
	strh ip, [r1, r3]
	cmp r4, r2
	blo _020B2740
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B2730

	arm_func_start sub_020B2784
sub_020B2784: ; 0x020B2784
	cmp r2, #0
	mov ip, #0
	bxls lr
_020B2790:
	mov r3, ip, lsl #1
	ldrsh r3, [r1, r3]
	mov r3, r3, asr #8
	strb r3, [r0, ip]
	add ip, ip, #1
	cmp ip, r2
	blo _020B2790
	bx lr
	arm_func_end sub_020B2784

	arm_func_start sub_020B27B0
sub_020B27B0: ; 0x020B27B0
	stmdb sp!, {r3, lr}
	cmp r2, #0
	mov lr, #0
	ldmlsia sp!, {r3, pc}
_020B27C0:
	ldrsb ip, [r0, lr]
	mov r3, lr, lsl #1
	add lr, lr, #1
	mov ip, ip, lsl #8
	strh ip, [r1, r3]
	cmp lr, r2
	blo _020B27C0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B27B0

	arm_func_start sub_020B27E0
sub_020B27E0: ; 0x020B27E0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020D3A38
	ldr r3, _020B2810 ; =0x021D6F84
	mov ip, #0
	ldr r1, _020B2814 ; =0x021D6F78
	ldr r2, _020B2818 ; =0x021D6F6C
	str ip, [r3, r4, lsl #2]
	str ip, [r2, r4, lsl #2]
	str ip, [r1, r4, lsl #2]
	bl sub_020D3A4C
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B2810: .word 0x021D6F84
_020B2814: .word 0x021D6F78
_020B2818: .word 0x021D6F6C
	arm_func_end sub_020B27E0

	arm_func_start sub_020B281C
sub_020B281C: ; 0x020B281C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl sub_020D3A38
	ldr r7, _020B2880 ; =0x021D6F6C
	mov r4, r0
	ldr r0, [r7, r5, lsl #2]
	cmp r0, #0
	beq _020B2860
	mov r6, #0
_020B2840:
	ldr r1, [r0, #8]
	str r1, [r7, r5, lsl #2]
	cmp r1, #0
	strne r6, [r1, #4]
	bl sub_020B4128
	ldr r0, [r7, r5, lsl #2]
	cmp r0, #0
	bne _020B2840
_020B2860:
	ldr r2, _020B2884 ; =0x021D6F84
	mov r3, #0
	ldr r1, _020B2888 ; =0x021D6F78
	mov r0, r4
	str r3, [r2, r5, lsl #2]
	str r3, [r1, r5, lsl #2]
	bl sub_020D3A4C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B2880: .word 0x021D6F6C
_020B2884: .word 0x021D6F84
_020B2888: .word 0x021D6F78
	arm_func_end sub_020B281C

	arm_func_start sub_020B288C
sub_020B288C: ; 0x020B288C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bl sub_020D3A38
	mov r6, #0
	mov r5, r0
	mov sl, r6
	ldr r4, _020B2900 ; =0x021D6F6C
	mov sb, r6
	ldr r8, _020B2904 ; =0x021D6F84
	ldr r7, _020B2908 ; =0x021D6F78
	b _020B28EC
_020B28B4:
	ldr r0, [r4, r6, lsl #2]
	cmp r0, #0
	beq _020B28E0
_020B28C0:
	ldr r1, [r0, #8]
	str r1, [r4, r6, lsl #2]
	cmp r1, #0
	strne sl, [r1, #4]
	bl sub_020B4128
	ldr r0, [r4, r6, lsl #2]
	cmp r0, #0
	bne _020B28C0
_020B28E0:
	str sb, [r8, r6, lsl #2]
	str sb, [r7, r6, lsl #2]
	add r6, r6, #1
_020B28EC:
	cmp r6, #3
	blt _020B28B4
	mov r0, r5
	bl sub_020D3A4C
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020B2900: .word 0x021D6F6C
_020B2904: .word 0x021D6F84
_020B2908: .word 0x021D6F78
	arm_func_end sub_020B288C

	arm_func_start sub_020B290C
sub_020B290C: ; 0x020B290C
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #3
	mvnhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	bl sub_020D3A38
	ldr ip, _020B2A00 ; =0x021D6F6C
	ldr r1, [ip, r4, lsl #2]
	cmp r1, #0
	bne _020B2964
	str r5, [ip, r4, lsl #2]
	mov r3, #0
	str r3, [r5, #4]
	ldr r2, [ip, r4, lsl #2]
	ldr r1, _020B2A04 ; =0x021D6F84
	str r3, [r2, #8]
	ldr r2, [ip, r4, lsl #2]
	str r2, [r1, r4, lsl #2]
	b _020B29E0
_020B2964:
	ldr r1, _020B2A04 ; =0x021D6F84
	ldr r3, [r1, r4, lsl #2]
	cmp r3, #0
	beq _020B29C0
	ldr r2, [r5, #0x18]
_020B2978:
	ldr r1, [r3, #0x18]
	cmp r1, r2
	bhs _020B29B4
	str r3, [r5, #4]
	ldr r1, [r3, #8]
	ldr r2, _020B2A04 ; =0x021D6F84
	str r1, [r5, #8]
	str r5, [r3, #8]
	ldr r1, [r5, #8]
	cmp r1, #0
	strne r5, [r1, #4]
	ldr r1, [r2, r4, lsl #2]
	cmp r3, r1
	streq r5, [r2, r4, lsl #2]
	b _020B29E0
_020B29B4:
	ldr r3, [r3, #4]
	cmp r3, #0
	bne _020B2978
_020B29C0:
	mov r1, #0
	ldr r2, _020B2A00 ; =0x021D6F6C
	str r1, [r5, #4]
	ldr r1, [r2, r4, lsl #2]
	str r1, [r5, #8]
	ldr r1, [r2, r4, lsl #2]
	str r5, [r1, #4]
	str r5, [r2, r4, lsl #2]
_020B29E0:
	ldr r2, _020B2A08 ; =0x021D6F78
	ldr r1, [r2, r4, lsl #2]
	add r1, r1, #1
	str r1, [r2, r4, lsl #2]
	bl sub_020D3A4C
	ldr r0, _020B2A08 ; =0x021D6F78
	ldr r0, [r0, r4, lsl #2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B2A00: .word 0x021D6F6C
_020B2A04: .word 0x021D6F84
_020B2A08: .word 0x021D6F78
	arm_func_end sub_020B290C

	arm_func_start sub_020B2A0C
sub_020B2A0C: ; 0x020B2A0C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020D3A38
	ldr r1, _020B2A44 ; =0x021D6F6C
	ldr r1, [r1, r4, lsl #2]
	cmp r1, #0
	beq _020B2A38
	bl sub_020D3A4C
	ldr r0, _020B2A44 ; =0x021D6F6C
	ldr r0, [r0, r4, lsl #2]
	ldmia sp!, {r4, pc}
_020B2A38:
	bl sub_020D3A4C
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B2A44: .word 0x021D6F6C
	arm_func_end sub_020B2A0C

	arm_func_start sub_020B2A48
sub_020B2A48: ; 0x020B2A48
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020D3A38
	ldr ip, _020B2AA4 ; =0x021D6F6C
	ldr r1, [ip, r4, lsl #2]
	cmp r1, #0
	beq _020B2A94
	ldr r2, _020B2AA8 ; =0x021D6F78
	ldr r3, [r1, #8]
	ldr r1, [r2, r4, lsl #2]
	str r3, [ip, r4, lsl #2]
	sub r1, r1, #1
	str r1, [r2, r4, lsl #2]
	cmp r3, #0
	movne r1, #0
	strne r1, [r3, #4]
	ldreq r1, _020B2AAC ; =0x021D6F84
	moveq r2, #0
	streq r2, [r1, r4, lsl #2]
_020B2A94:
	bl sub_020D3A4C
	ldr r0, _020B2AA8 ; =0x021D6F78
	ldr r0, [r0, r4, lsl #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B2AA4: .word 0x021D6F6C
_020B2AA8: .word 0x021D6F78
_020B2AAC: .word 0x021D6F84
	arm_func_end sub_020B2A48

	arm_func_start sub_020B2AB0
sub_020B2AB0: ; 0x020B2AB0
	ldr r1, _020B2ABC ; =0x021D6F78
	ldr r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_020B2ABC: .word 0x021D6F78
	arm_func_end sub_020B2AB0

	arm_func_start sub_020B2AC0
sub_020B2AC0: ; 0x020B2AC0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r1, #0
	mov r2, #0x28
	mov r6, r0
	bl sub_020D4994
	ldr r0, _020B2B48 ; =0x000134DF
	mov r1, #0
	str r0, [r6, #4]
	str r1, [r6, #0x28]
	str r1, [r6, #0x2c]
	str r5, [r6, #0x34]
	str r4, [r6, #0x38]
	str r1, [r6, #0x7c]
	str r1, [r6, #0x80]
	str r1, [r6, #0x84]
	str r1, [r6, #0x88]
	str r0, [r6, #0x8c]
	str r1, [r6, #0x90]
	str r1, [r6, #0x4c]
	str r1, [r6, #0x44]
	str r1, [r6, #0x48]
	str r1, [r6, #0x6c]
	str r1, [r6, #0x70]
	str r1, [r6, #0x50]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	mov r0, #1
	str r0, [r6, #0x5c]
	str r1, [r6, #0x3c]
	str r1, [r6, #0x40]
	str r1, [r6, #0x30]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B2B48: .word 0x000134DF
	arm_func_end sub_020B2AC0

	arm_func_start sub_020B2B4C
sub_020B2B4C: ; 0x020B2B4C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _020B2B6C
	bl sub_020B4128
	mov r0, #0
	str r0, [r4, #0x3c]
_020B2B6C:
	mvn r0, #0
	str r0, [r4, #0x38]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B2B4C

	arm_func_start sub_020B2B78
sub_020B2B78: ; 0x020B2B78
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0x3c]
	mov r4, r1
	cmp r0, #0
	beq _020B2B94
	bl sub_020B4128
_020B2B94:
	str r4, [r5, #0x3c]
	ldr r0, [r5, #0x34]
	bl sub_020B2A48
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020B2B78

	arm_func_start sub_020B2BA4
sub_020B2BA4: ; 0x020B2BA4
	ldr r2, _020B2BC0 ; =0x00010001
	strh r1, [r0, #0x68]
	str r2, [r0, #0x64]
	mov r1, #0
	str r1, [r0, #0x60]
	str r1, [r0, #0x5c]
	bx lr
	.align 2, 0
_020B2BC0: .word 0x00010001
	arm_func_end sub_020B2BA4

	arm_func_start sub_020B2BC4
sub_020B2BC4: ; 0x020B2BC4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrh ip, [r6, #0x68]
	mov r4, r2
	ldr r3, _020B2C94 ; =0x00000BB8
	sub r2, r4, ip
	mov r2, r2, lsl #0x10
	mov r5, r1
	cmp r3, r2, lsr #16
	mov r2, r2, lsr #0x10
	bls _020B2C08
	cmp r4, ip
	ldrlo r0, [r6, #0x60]
	addlo r0, r0, #0x10000
	strlo r0, [r6, #0x60]
	strh r4, [r6, #0x68]
	b _020B2C80
_020B2C08:
	ldr r1, _020B2C98 ; =0x0000FF9C
	cmp r2, r1
	bhi _020B2C54
	ldr r1, [r6, #0x64]
	cmp r4, r1
	bne _020B2C3C
	mov r1, r4
	bl sub_020B2BA4
	sub r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r6, #0x54]
	b _020B2C80
_020B2C3C:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r6, #0x64]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020B2C54:
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x60]
	add r0, r0, #0x39c
	add r1, r4, r1
	add r0, r0, #0xfc00
	cmp r1, r0
	bls _020B2C80
	sub r0, r1, #0x10000
	str r0, [r5, #0x18]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020B2C80:
	ldr r1, [r6, #0x60]
	mov r0, #1
	add r1, r4, r1
	str r1, [r5, #0x18]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B2C94: .word 0x00000BB8
_020B2C98: .word 0x0000FF9C
	arm_func_end sub_020B2BC4

	arm_func_start sub_020B2C9C
sub_020B2C9C: ; 0x020B2C9C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r2, [r7, #0x5c]
	mov r6, r1
	cmp r2, #0
	mov r5, #0
	beq _020B2CCC
	ldr r1, [r6, #0x18]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_020B2BA4
	b _020B2D64
_020B2CCC:
	ldr r2, [r6, #0x18]
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bl sub_020B2BC4
	cmp r0, #0
	bne _020B2CF8
	ldr r1, [r7, #0x14]
	mov r0, r5
	add r1, r1, #1
	str r1, [r7, #0x14]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B2CF8:
	ldr r0, [r6, #0x18]
	str r0, [r7, #0x10]
	ldr r1, [r6, #0x18]
	ldr r2, [r7, #0x54]
	cmp r2, r1
	bne _020B2D24
	ldr r1, [r7, #0x14]
	mov r0, r5
	add r1, r1, #1
	str r1, [r7, #0x14]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B2D24:
	add r0, r2, #1
	cmp r0, r1
	beq _020B2D64
	ldr r0, [r6, #0x45c]
	cmp r0, #0
	bne _020B2D64
	subs r0, r1, r2
	rsbmi r0, r0, #0
	cmp r0, #0x64
	strgt r1, [r7, #0x54]
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r2, r1
	ldrhi r0, [r7, #0x1c]
	addhi r0, r0, #1
	strhi r0, [r7, #0x1c]
_020B2D64:
	ldr r0, [r6, #0x18]
	str r0, [r7, #0x54]
	ldr r0, [r7, #0x4c]
	cmp r0, #0
	bne _020B2D9C
	ldr r1, [r6, #0x460]
	add r0, r6, #0x64
	str r1, [r7, #0x4c]
	add r1, r0, #0x400
	add r0, r7, #0x44
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	mov r0, #0
	str r0, [r7, #0x6c]
_020B2D9C:
	ldr r2, [r6, #0x460]
	ldr r0, [r7, #0x4c]
	ldr r3, [r6, #0x464]
	ldr r1, [r7, #0x44]
	sub r0, r2, r0
	ldr r2, [r7, #0x80]
	mov r0, r0, lsl #6
	subs r1, r3, r1
	subs r4, r0, r1
	cmp r2, #0
	beq _020B2DD4
	ldr r1, [r6, #0x45c]
	cmp r1, #0
	beq _020B2DDC
_020B2DD4:
	str r4, [r7, #0x80]
	b _020B2E50
_020B2DDC:
	str r4, [r7, #0x80]
	subs r1, r4, r2
	ldr r2, [r7, #0x7c]
	rsbmi r1, r1, #0
	add r2, r2, #0x318
	add r2, r2, #0x8800
	mov ip, r2, lsl #1
	ldr r3, _020B302C ; =0x0000CC8D
	mov r2, #0
	adds r3, ip, r3
	mov lr, r1, asr #0x1f
	adc r2, r2, ip, asr #31
	cmp lr, r2
	cmpeq r1, r3
	bls _020B2E30
	ldr ip, _020B3030 ; =0x75CA82CB
	mov r2, r1, lsr #0x1f
	smull r3, lr, ip, r1
	add lr, r2, lr, asr #14
	add r2, lr, #2
	str r2, [r7, #0x84]
_020B2E30:
	ldr r2, [r7, #0x84]
	cmp r2, #0
	bgt _020B2E50
	ldr r2, [r7, #0x7c]
	sub r1, r1, r2
	add r1, r2, r1, asr #4
	str r1, [r7, #0x7c]
	str r1, [r7, #0x18]
_020B2E50:
	ldr r2, [r7, #0x44]
	ldr r3, [r7, #4]
	ldr r1, [r7, #0x48]
	adds r2, r0, r2
	adc r0, r1, #0
	adds r1, r3, r2
	str r1, [r6, #0x46c]
	adc r0, r0, #0
	str r0, [r6, #0x470]
	bl sub_020D34B0
	ldr ip, [r6, #0x46c]
	ldr r2, _020B3034 ; =0x00008B18
	ldr lr, [r6, #0x470]
	adds r6, ip, r2
	adc r3, lr, #0
	cmp r3, r1
	mov r3, #0
	cmpeq r6, r0
	movlo r0, r3
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r6, _020B3038 ; =0x0007FD88
	adds r6, r0, r6
	adc r0, r1, r3
	cmp lr, r0
	cmpeq ip, r6
	movhi r0, r3
	ldmhiia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r7, #0x84]
	cmp r0, #0
	bgt _020B3018
	ldr r0, [r7, #0x7c]
	ldr r6, _020B3030 ; =0x75CA82CB
	add ip, r0, r0, lsl #1
	smull r1, r0, r6, ip
	ldr r6, [r7, #0x8c]
	mov r1, ip, lsr #0x1f
	cmp ip, r6
	add r0, r1, r0, asr #14
	bls _020B2F24
	add r1, r0, #1
	mul r6, r1, r2
	mul r1, r0, r2
	add r0, r6, #0xdf
	add r2, r0, #0x13400
	ldr r0, _020B303C ; =0xFFFF2F5C
	add r1, r1, #0xdf
	str r2, [r7, #0x8c]
	add r0, r2, r0
	str r0, [r7, #0x88]
	add r0, r1, #0x13400
	str r0, [r7, #4]
	str r3, [r7, #0x90]
	b _020B2F84
_020B2F24:
	ldr r1, [r7, #0x88]
	cmp ip, r1
	bge _020B2F84
	ldr r1, [r7, #0x90]
	add r1, r1, #1
	str r1, [r7, #0x90]
	cmp r1, #0x46
	bls _020B2F84
	add r1, r0, #1
	mul ip, r1, r2
	add r1, ip, #0xdf
	add r1, r1, #0x13400
	ldr r6, _020B3040 ; =0xFFFFBA74
	str r1, [r7, #0x8c]
	ldr r1, _020B3034 ; =0x00008B18
	mlas r2, r0, r2, r6
	str r2, [r7, #0x88]
	mul r1, r0, r1
	add r0, r1, #0xdf
	strmi r3, [r7, #0x88]
	add r0, r0, #0x13400
	mov r2, #0
	str r0, [r7, #4]
	str r2, [r7, #0x90]
_020B2F84:
	ldr r1, [r7, #4]
	ldr r0, _020B3044 ; =0x00068520
	cmp r1, r0
	strhi r0, [r7, #4]
	ldr r0, [r7, #0x6c]
	cmp r0, #0x10
	bhs _020B2FB4
	add r0, r0, #1
	str r0, [r7, #0x6c]
	str r4, [r7, #0x74]
	str r4, [r7, #0x78]
	b _020B2FD0
_020B2FB4:
	ldr r0, [r7, #0x74]
	rsb r0, r0, r0, lsl #5
	add r1, r4, r0
	mov r0, r1, asr #4
	add r0, r1, r0, lsr #27
	mov r0, r0, asr #5
	str r0, [r7, #0x74]
_020B2FD0:
	ldr r2, [r7, #0x78]
	ldr r1, [r7, #0x74]
	ldr r0, _020B3048 ; =0x00008701
	sub r1, r2, r1
	cmp r1, r0
	mvn r0, #0x8700
	movgt r5, #1
	str r1, [r7, #0xc]
	cmp r1, r0
	bge _020B3008
	ldr r1, [r7, #0x70]
	add r5, r0, #0x8700
	add r0, r1, #1
	str r0, [r7, #0x70]
_020B3008:
	cmp r5, #0
	movne r0, #0
	strne r0, [r7, #0x6c]
	strne r0, [r7, #0x4c]
_020B3018:
	ldr r1, [r7, #0x84]
	mov r0, #1
	sub r1, r1, #1
	str r1, [r7, #0x84]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B302C: .word 0x0000CC8D
_020B3030: .word 0x75CA82CB
_020B3034: .word 0x00008B18
_020B3038: .word 0x0007FD88
_020B303C: .word 0xFFFF2F5C
_020B3040: .word 0xFFFFBA74
_020B3044: .word 0x00068520
_020B3048: .word 0x00008701
	arm_func_end sub_020B2C9C

	arm_func_start sub_020B304C
sub_020B304C: ; 0x020B304C
	stmdb sp!, {r3, lr}
	ldr r1, _020B3070 ; =0x021D8498
	ldr r1, [r1, #0x10]
	cmp r1, #0
	cmpne r1, #2
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_020B35EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B3070: .word 0x021D8498
	arm_func_end sub_020B304C

	arm_func_start sub_020B3074
sub_020B3074: ; 0x020B3074
	stmdb sp!, {r3, lr}
	ldr r2, _020B3124 ; =0x021D6F90
	mov ip, #0
	cmp r0, #0
	ldr lr, [r2, #0x14]
	moveq r0, ip
	ldmeqia sp!, {r3, pc}
	ldr r1, _020B3128 ; =0x021D8498
	ldr r1, [r1, #0x10]
	cmp r1, #2
	bne _020B30B4
	ldr r1, _020B312C ; =0x021D6FCC
	cmp r0, r1
	streq ip, [r2, #0x3c]
	mov r0, #1
	ldmia sp!, {r3, pc}
_020B30B4:
	cmp lr, #0
	beq _020B311C
_020B30BC:
	cmp lr, r0
	bne _020B310C
	mov r3, #0
	str r3, [r0]
	cmp ip, #0
	ldrne r1, [r0, #0x14]
	strne r1, [ip, #0x14]
	bne _020B30F4
	ldr r2, [lr, #0x14]
	cmp r2, #0
	ldrne r1, _020B3124 ; =0x021D6F90
	strne r2, [r1, #0x14]
	ldreq r1, _020B3124 ; =0x021D6F90
	streq r3, [r1, #0x14]
_020B30F4:
	ldr r1, _020B3124 ; =0x021D6F90
	ldr r2, [r1, #0x10]
	str r2, [r0, #0x14]
	str r0, [r1, #0x10]
	mov r0, #1
	ldmia sp!, {r3, pc}
_020B310C:
	mov ip, lr
	ldr lr, [lr, #0x14]
	cmp lr, #0
	bne _020B30BC
_020B311C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B3124: .word 0x021D6F90
_020B3128: .word 0x021D8498
_020B312C: .word 0x021D6FCC
	arm_func_end sub_020B3074

	arm_func_start sub_020B3130
sub_020B3130: ; 0x020B3130
	stmdb sp!, {r4, r5, r6, lr}
	movs r5, r0
	mov r4, r1
	mov r6, r2
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r3, #0x10
	mvnlo r0, #0
	ldmloia sp!, {r4, r5, r6, pc}
	ldr r1, _020B31DC ; =0x021D8498
	ldr r1, [r1, #0xc]
	cmp r1, #1
	mvneq r0, #2
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r4, #0
	blt _020B3178
	cmp r4, #5
	blt _020B3180
_020B3178:
	mvn r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_020B3180:
	mov r3, #0xff
	mov r1, r6
	and r2, r4, #0xff
	strb r3, [r6, #4]
	bl sub_020B393C
	mov r0, r5
	mov r1, r6
	bl sub_020B3AA8
	cmp r0, #0
	mvneq r0, #2
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _020B31DC ; =0x021D8498
	ldr r0, [r0, #0x10]
	cmp r0, #1
	cmpeq r4, #0
	bne _020B31D4
	mov r0, r5
	bl sub_020B3A5C
	cmp r0, #0
	mvneq r0, #2
	ldmeqia sp!, {r4, r5, r6, pc}
_020B31D4:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B31DC: .word 0x021D8498
	arm_func_end sub_020B3130

	arm_func_start sub_020B31E0
sub_020B31E0: ; 0x020B31E0
	stmdb sp!, {r3, lr}
	ldr r2, _020B3200 ; =0x021D8498
	ldr r2, [r2, #0x10]
	cmp r2, #2
	mvneq r0, #2
	ldmeqia sp!, {r3, pc}
	bl sub_020B3658
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B3200: .word 0x021D8498
	arm_func_end sub_020B31E0

	arm_func_start sub_020B3204
sub_020B3204: ; 0x020B3204
	stmdb sp!, {r4, r5, r6, lr}
	movs r5, r0
	mov r6, r1
	mov r4, r2
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r3, #0x10
	mvnlo r0, #0
	ldmloia sp!, {r4, r5, r6, pc}
	cmp r6, #0
	blt _020B3238
	cmp r6, #6
	blt _020B3240
_020B3238:
	mvn r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_020B3240:
	mov r3, #0
	mov r1, r4
	and r2, r6, #0xff
	strb r3, [r4, #4]
	bl sub_020B393C
	cmp r6, #0
	bne _020B329C
	ldr r0, _020B32B8 ; =0x021D8498
	ldr r0, [r0, #0x10]
	cmp r0, #1
	ldreq r0, [r5, #0xc]
	cmpeq r0, #4
	bne _020B3288
	mov r0, r5
	bl sub_020B3A5C
	cmp r0, #0
	mvneq r0, #2
	ldmeqia sp!, {r4, r5, r6, pc}
_020B3288:
	ldrb r1, [r5, #4]
	mov r0, #1
	cmp r1, #0
	movne r0, r0, lsl r1
	str r0, [r5, #8]
_020B329C:
	mov r0, r5
	mov r1, r4
	bl sub_020B3AA8
	cmp r0, #0
	mvneq r0, #2
	movne r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B32B8: .word 0x021D8498
	arm_func_end sub_020B3204

	arm_func_start sub_020B32BC
sub_020B32BC: ; 0x020B32BC
	stmdb sp!, {r3, lr}
	ldr r2, _020B32DC ; =0x021D8498
	ldr r2, [r2, #0x10]
	cmp r2, #2
	mvneq r0, #2
	ldmeqia sp!, {r3, pc}
	bl sub_020B369C
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B32DC: .word 0x021D8498
	arm_func_end sub_020B32BC

	arm_func_start sub_020B32E0
sub_020B32E0: ; 0x020B32E0
	stmdb sp!, {r4, lr}
	ldr r2, _020B3390 ; =0x021D8498
	mov r4, r0
	ldr r1, [r2, #0x10]
	cmp r1, #3
	mvnne r0, #1
	ldmneia sp!, {r4, pc}
	ldr r1, _020B3394 ; =0x021D6F90
	ldr r1, [r1]
	cmp r1, #3
	mvneq r0, #5
	ldmeqia sp!, {r4, pc}
	ldrb r1, [r2]
	cmp r4, r1
	mvneq r0, #0
	ldmeqia sp!, {r4, pc}
	bl sub_020B3B30
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl sub_020B304C
	movs r2, r0
	mvneq r0, #0
	ldmeqia sp!, {r4, pc}
	strb r4, [r2, #4]
	mov r0, #1
	strb r4, [r2, #5]
	mov r3, #2
	mov r1, r0, lsl r4
	str r3, [r2, #0xc]
	ldr r0, _020B3390 ; =0x021D8498
	str r1, [r2, #8]
	ldr r3, [r0, #8]
	ldr ip, [r0, #4]
	mov r0, r4
	mov r1, #7
	blx ip
	ldr r1, _020B3394 ; =0x021D6F90
	mov r0, #0
	ldr r2, [r1]
	add r2, r2, #1
	str r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B3390: .word 0x021D8498
_020B3394: .word 0x021D6F90
	arm_func_end sub_020B32E0

	arm_func_start sub_020B3398
sub_020B3398: ; 0x020B3398
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldrne r1, [r4, #4]
	cmpne r1, #0
	beq _020B33BC
	cmp r1, #8
	bls _020B33C4
_020B33BC:
	mov r0, #0
	ldmia sp!, {r4, pc}
_020B33C4:
	ldr r1, _020B3490 ; =0x021D6F90
	mov r2, #0x18
	str r0, [r1, #0x10]
	ldr r3, [r4, #4]
	mov r1, #0
	mul r2, r3, r2
	bl sub_020D4994
	ldr r0, _020B3494 ; =0x021D6FCC
	mov r1, #0
	mov r2, #0x18
	bl sub_020D4994
	ldr r0, _020B3498 ; =0x021D6FB4
	mov r1, #0
	mov r2, #0x18
	bl sub_020D4994
	ldr r3, [r4, #4]
	mov ip, #0
	subs r0, r3, #1
	beq _020B3444
	ldr r1, _020B3490 ; =0x021D6F90
	mov lr, ip
	mov r0, #0x18
_020B341C:
	ldr r2, [r1, #0x10]
	add ip, ip, #1
	mla r3, ip, r0, r2
	add r2, r2, lr
	str r3, [r2, #0x14]
	ldr r3, [r4, #4]
	add lr, lr, #0x18
	sub r2, r3, #1
	cmp ip, r2
	blo _020B341C
_020B3444:
	ldr r1, _020B3490 ; =0x021D6F90
	mov r0, #0x18
	ldr r2, [r1, #0x10]
	mov r4, #0
	mla r0, r3, r0, r2
	str r4, [r0, #-4]
	str r4, [r1, #0x14]
	str r4, [r1, #4]
	ldr r0, _020B349C ; =0x021D8498
	str r4, [r1]
	ldr r3, _020B34A0 ; =sub_020D34B0
	str r4, [r0, #0x14]
	ldr r2, _020B34A4 ; =0x5D588B65
	str r3, [r1, #0x18]
	ldr r0, _020B34A8 ; =0x00269EC3
	str r2, [r1, #0x1c]
	str r0, [r1, #0x20]
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B3490: .word 0x021D6F90
_020B3494: .word 0x021D6FCC
_020B3498: .word 0x021D6FB4
_020B349C: .word 0x021D8498
_020B34A0: .word sub_020D34B0
_020B34A4: .word 0x5D588B65
_020B34A8: .word 0x00269EC3
	arm_func_end sub_020B3398

	arm_func_start sub_020B34AC
sub_020B34AC: ; 0x020B34AC
	ldr r0, _020B34C0 ; =0x021D6F90
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x10]
	bx lr
	.align 2, 0
_020B34C0: .word 0x021D6F90
	arm_func_end sub_020B34AC

	arm_func_start sub_020B34C4
sub_020B34C4: ; 0x020B34C4
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_020D34B0
	ldr r2, _020B3560 ; =0x021D8498
	ldr r3, [r2, #0x10]
	cmp r3, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r2, [r2, #0xc]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, _020B3564 ; =0x021D6F90
	mov ip, #0
	ldr r5, [r3, #0xc]
	ldr r4, [r3, #8]
	cmp r5, #0
	cmpeq r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, _020B3568 ; =_021108FC
	subs r4, r0, r4
	ldr lr, [r2]
	ldr r0, [r2, #4]
	sbc r1, r1, r5
	cmp r1, r0
	cmpeq r4, lr
	ldmlsia sp!, {r3, r4, r5, pc}
	str ip, [r3, #8]
	str ip, [r3, #0xc]
	str ip, [r3, #0x3c]
	mov r0, ip
	str ip, [r3, #0x48]
	bl sub_020B37C8
	ldr r1, _020B3560 ; =0x021D8498
	ldr r0, _020B3564 ; =0x021D6F90
	ldr r3, [r1, #8]
	ldrb r0, [r0, #0x40]
	ldr ip, [r1, #4]
	ldr r2, _020B356C ; =0x021D6FCC
	mov r1, #9
	blx ip
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B3560: .word 0x021D8498
_020B3564: .word 0x021D6F90
_020B3568: .word _021108FC
_020B356C: .word 0x021D6FCC
	arm_func_end sub_020B34C4

	arm_func_start sub_020B3570
sub_020B3570: ; 0x020B3570
	stmdb sp!, {r3, lr}
	cmp r2, #0x10
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrb r2, [r1, #8]
	cmp r2, r0
	bne _020B35A0
	ldr r0, _020B35E8 ; =0x021D8498
	ldrb ip, [r1, #9]
	ldrb r2, [r0]
	cmp ip, r2
	beq _020B35A8
_020B35A0:
	mov r0, #0
	ldmia sp!, {r3, pc}
_020B35A8:
	ldrb r2, [r1, #5]
	cmp r2, #0x10
	beq _020B35C4
	mov r0, r1
	mov r1, r3
	bl sub_020B3E7C
	ldmia sp!, {r3, pc}
_020B35C4:
	ldr r0, [r0, #0xc]
	cmp r0, #0
	mov r0, r1
	mov r1, r3
	bne _020B35E0
	bl sub_020B3BB0
	ldmia sp!, {r3, pc}
_020B35E0:
	bl sub_020B3CEC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B35E8: .word 0x021D8498
	arm_func_end sub_020B3570

	arm_func_start sub_020B35EC
sub_020B35EC: ; 0x020B35EC
	stmdb sp!, {r4, lr}
	mov r1, r0
	cmp r1, #0x20
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	ldr r0, _020B3650 ; =0x021D8498
	ldrb r0, [r0]
	cmp r1, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r2, _020B3654 ; =0x021D6F90
	ldr r4, [r2, #0x10]
	cmp r4, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, [r4, #0x14]
	mov r0, r4
	str r3, [r2, #0x10]
	bl sub_020B3808
	ldr r1, _020B3654 ; =0x021D6F90
	mov r0, r4
	ldr r2, [r1, #0x14]
	str r2, [r4, #0x14]
	str r4, [r1, #0x14]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B3650: .word 0x021D8498
_020B3654: .word 0x021D6F90
	arm_func_end sub_020B35EC

	arm_func_start sub_020B3658
sub_020B3658: ; 0x020B3658
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	add r2, sp, #0
	mov r3, #0x10
	mov r4, r0
	bl sub_020B3130
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r4, pc}
	add r1, sp, #0
	mov r0, r4
	bl sub_020B3850
	cmp r0, #0
	movne r0, #0
	mvneq r0, #3
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B3658

	arm_func_start sub_020B369C
sub_020B369C: ; 0x020B369C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	add r2, sp, #0
	mov r3, #0x10
	mov r4, r0
	bl sub_020B3204
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r4, pc}
	add r1, sp, #0
	mov r0, r4
	bl sub_020B3850
	cmp r0, #0
	movne r0, #0
	mvneq r0, #3
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B369C

	arm_func_start sub_020B36E0
sub_020B36E0: ; 0x020B36E0
	ldrb r2, [r1, #0xa]
	cmp r2, #1
	bxne lr
	ldrb r2, [r0, #4]
	ldr r0, _020B3704 ; =0x021D6F90
	strb r2, [r1, #0xb]
	ldr r0, [r0, #4]
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_020B3704: .word 0x021D6F90
	arm_func_end sub_020B36E0

	arm_func_start sub_020B3708
sub_020B3708: ; 0x020B3708
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r0, [sp]
	mov sl, r1
	mov r8, #0
	bl sub_020B36E0
	mov r6, #1
	ldr r4, _020B37C0 ; =0x021D8498
	ldr r5, _020B37C4 ; =0x021D6F90
	mov sb, r8
	mov r7, r6
	mov fp, #0x10
_020B3734:
	cmp sb, #0
	movne r1, r7, lsl sb
	ldr r0, [r5, #4]
	moveq r1, r6
	tst r0, r1
	ldrneb r0, [r4]
	cmpne sb, r0
	beq _020B3770
	mov r0, sb
	mov r1, sl
	mov r2, fp
	strb sb, [sl, #9]
	bl ov00_021F9610
	cmp r0, #0
	addne r8, r8, #1
_020B3770:
	add r0, sb, #1
	and sb, r0, #0xff
	cmp sb, #0x20
	blo _020B3734
	ldrb r0, [sl, #0xa]
	cmp r0, #1
	bne _020B37A0
	ldr r0, _020B37C4 ; =0x021D6F90
	ldr r1, [r0, #4]
	ldr r0, [sp]
	str r1, [r0, #8]
	b _020B37B0
_020B37A0:
	cmp r0, #0
	ldreq r0, [sp]
	moveq r1, #0
	streq r1, [r0, #8]
_020B37B0:
	cmp r8, #0
	mvneq r0, #3
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B37C0: .word 0x021D8498
_020B37C4: .word 0x021D6F90
	arm_func_end sub_020B3708

	arm_func_start sub_020B37C8
sub_020B37C8: ; 0x020B37C8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r3, #0xff
	ldr r0, _020B3804 ; =0x021D6FCC
	add r1, sp, #0
	mov r2, #4
	strb r3, [sp, #4]
	bl sub_020B393C
	ldr r0, _020B3804 ; =0x021D6FCC
	add r1, sp, #0
	strb r4, [sp, #0xa]
	bl sub_020B3708
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B3804: .word 0x021D6FCC
	arm_func_end sub_020B37C8

	arm_func_start sub_020B3808
sub_020B3808: ; 0x020B3808
	mov ip, r0
	mov r3, #6
	mov r2, #0
_020B3814:
	strb r2, [ip]
	strb r2, [ip, #1]
	strb r2, [ip, #2]
	strb r2, [ip, #3]
	add ip, ip, #4
	subs r3, r3, #1
	bne _020B3814
	ldr r2, _020B384C ; =0x021D8498
	mov r3, #0
	ldr r2, [r2, #0x10]
	str r2, [r0]
	str r3, [r0, #0xc]
	strb r1, [r0, #4]
	bx lr
	.align 2, 0
_020B384C: .word 0x021D8498
	arm_func_end sub_020B3808

	arm_func_start sub_020B3850
sub_020B3850: ; 0x020B3850
	stmdb sp!, {r3, lr}
	ldrb r2, [r1, #4]
	cmp r2, #0xff
	ldreqb r2, [r1, #6]
	cmpeq r2, #4
	bne _020B3870
	bl sub_020B3708
	b _020B3888
_020B3870:
	ldrb r0, [r0, #4]
	mov r2, #0x10
	bl ov00_021F9610
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_020B3888:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B3850

	arm_func_start sub_020B3890
sub_020B3890: ; 0x020B3890
	ldrb r2, [r0, #0xb]
	strb r2, [r1, #5]
	ldrb r2, [r0, #4]
	cmp r2, #0xff
	bne _020B38D4
	ldrb r2, [r0, #6]
	cmp r2, #0
	bne _020B38C4
	ldrb r3, [r1, #4]
	mov r2, #1
	cmp r3, #0
	movne r2, r2, lsl r3
	str r2, [r1, #8]
_020B38C4:
	ldrb r1, [r0, #6]
	ldr r0, _020B3934 ; =0x021090D8
	ldrb r0, [r0, r1]
	bx lr
_020B38D4:
	cmp r2, #0
	bne _020B392C
	ldrb r2, [r0, #6]
	cmp r2, #0
	bne _020B3920
	ldr r0, [r1, #0xc]
	cmp r0, #1
	bne _020B3910
	ldrb r2, [r1, #4]
	mov r0, #1
	cmp r2, #0
	movne r0, r0, lsl r2
	str r0, [r1, #8]
	mov r0, #7
	bx lr
_020B3910:
	cmp r0, #5
	moveq r0, #9
	movne r0, #0xc
	bx lr
_020B3920:
	ldr r0, _020B3938 ; =0x021090E0
	ldrb r0, [r0, r2]
	bx lr
_020B392C:
	mov r0, #0xc
	bx lr
	.align 2, 0
_020B3934: .word 0x021090D8
_020B3938: .word 0x021090E0
	arm_func_end sub_020B3890

	arm_func_start sub_020B393C
sub_020B393C: ; 0x020B393C
	ldr ip, _020B397C ; =0x5F564354
	mov r3, #0x10
	str ip, [r1]
	strb r3, [r1, #5]
	ldr r3, _020B3980 ; =0x021D8498
	strb r2, [r1, #6]
	ldrb r2, [r3]
	strb r2, [r1, #8]
	ldrb r2, [r0, #4]
	mov r0, #0
	strb r2, [r1, #9]
	strb r0, [r1, #0xa]
	ldrb r2, [r3]
	strb r2, [r1, #0xb]
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_020B397C: .word 0x5F564354
_020B3980: .word 0x021D8498
	arm_func_end sub_020B393C

	arm_func_start sub_020B3984
sub_020B3984: ; 0x020B3984
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r2, [r1, #4]
	ldrb r3, [r1, #6]
	mov r4, r0
	cmp r2, #0
	addeq r3, r3, #5
	cmp r3, #0
	blt _020B39AC
	cmp r3, #0xb
	blt _020B39B0
_020B39AC:
	mvn r3, #0
_020B39B0:
	cmp r3, #0
	mvnlt r0, #0
	ldmltia sp!, {r3, r4, r5, pc}
	ldr r0, _020B3A50 ; =0x021D8498
	ldr r2, [r4, #0xc]
	ldr r0, [r0, #0x10]
	cmp r0, #1
	ldreq r1, _020B3A54 ; =0x021091AE
	mov r0, #0xb
	ldrne r1, _020B3A58 ; =0x021090E8
	mla r0, r2, r0, r1
	ldrsb r5, [r3, r0]
	mvn r1, #2
	cmp r5, r1
	beq _020B3A2C
	add r0, r1, #1
	cmp r5, r0
	beq _020B3A0C
	add r0, r1, #2
	cmp r5, r0
	mov r0, r5
	bne _020B3A4C
	ldmia sp!, {r3, r4, r5, pc}
_020B3A0C:
	mov r0, r4
	mov r1, #1
	bl sub_020B369C
	mov r1, #0
	str r1, [r4, #0xc]
	mov r0, r5
	str r1, [r4]
	ldmia sp!, {r3, r4, r5, pc}
_020B3A2C:
	mov r0, r4
	mov r1, #3
	bl sub_020B369C
	mov r1, #0
	str r1, [r4, #0xc]
	mov r0, r5
	str r1, [r4]
	ldmia sp!, {r3, r4, r5, pc}
_020B3A4C:
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B3A50: .word 0x021D8498
_020B3A54: .word 0x021091AE
_020B3A58: .word 0x021090E8
	arm_func_end sub_020B3984

	arm_func_start sub_020B3A5C
sub_020B3A5C: ; 0x020B3A5C
	ldr r1, _020B3AA4 ; =0x021D6F90
	ldr r2, [r1, #0x14]
	cmp r2, #0
	beq _020B3A9C
_020B3A6C:
	ldr r1, [r2]
	cmp r1, #0
	beq _020B3A90
	ldr r1, [r2, #0xc]
	cmp r1, #2
	bne _020B3A90
	cmp r0, r2
	movne r0, #0
	bxne lr
_020B3A90:
	ldr r2, [r2, #0x14]
	cmp r2, #0
	bne _020B3A6C
_020B3A9C:
	mov r0, #1
	bx lr
	.align 2, 0
_020B3AA4: .word 0x021D6F90
	arm_func_end sub_020B3A5C

	arm_func_start sub_020B3AA8
sub_020B3AA8: ; 0x020B3AA8
	ldrb r2, [r1, #4]
	ldrb ip, [r1, #6]
	cmp r2, #0
	addeq ip, ip, #5
	cmp ip, #0
	blt _020B3AC8
	cmp ip, #0xb
	blt _020B3ACC
_020B3AC8:
	mvn ip, #0
_020B3ACC:
	cmp ip, #0
	mvnlt r0, #0
	bxlt lr
	ldr r1, _020B3B24 ; =0x021D8498
	ldr r3, [r0, #0xc]
	ldr r1, [r1, #0x10]
	cmp r1, #1
	ldreq r2, _020B3B28 ; =0x0210912A
	mov r1, #0xb
	ldrne r2, _020B3B2C ; =0x0210916C
	mla r1, r3, r1, r2
	ldrsb r2, [ip, r1]
	mvn r1, #0
	cmp r2, r1
	moveq r0, #1
	bxeq lr
	sub r1, r1, #1
	cmp r2, r1
	moveq r0, #0
	strne r2, [r0, #0xc]
	movne r0, #1
	bx lr
	.align 2, 0
_020B3B24: .word 0x021D8498
_020B3B28: .word 0x0210912A
_020B3B2C: .word 0x0210916C
	arm_func_end sub_020B3AA8

	arm_func_start sub_020B3B30
sub_020B3B30: ; 0x020B3B30
	ldr r1, _020B3BA4 ; =0x021D8498
	ldr r2, _020B3BA8 ; =0x021D6F90
	ldr r1, [r1, #0x10]
	ldr r3, [r2, #0x14]
	cmp r1, #2
	bne _020B3B6C
	ldr r1, [r2, #0x3c]
	cmp r1, #0
	beq _020B3B64
	ldrb r1, [r2, #0x40]
	cmp r1, r0
	ldreq r0, _020B3BAC ; =0x021D6FCC
	bxeq lr
_020B3B64:
	mov r0, #0
	bx lr
_020B3B6C:
	cmp r3, #0
	beq _020B3B9C
_020B3B74:
	ldr r1, [r3]
	cmp r1, #0
	beq _020B3B90
	ldrb r1, [r3, #4]
	cmp r1, r0
	moveq r0, r3
	bxeq lr
_020B3B90:
	ldr r3, [r3, #0x14]
	cmp r3, #0
	bne _020B3B74
_020B3B9C:
	mov r0, #0
	bx lr
	.align 2, 0
_020B3BA4: .word 0x021D8498
_020B3BA8: .word 0x021D6F90
_020B3BAC: .word 0x021D6FCC
	arm_func_end sub_020B3B30

	arm_func_start sub_020B3BB0
sub_020B3BB0: ; 0x020B3BB0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldrb r2, [r6, #4]
	mov r5, r1
	cmp r2, #0xff
	bne _020B3BE8
	ldrb r2, [r6, #6]
	cmp r2, #4
	bne _020B3BDC
	bl sub_020B3EF4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B3BDC:
	cmp r2, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_020B3BE8:
	ldrb r0, [r6, #8]
	bl sub_020B3B30
	movs r4, r0
	beq _020B3C68
	mov r1, r6
	bl sub_020B3984
	mov r7, r0
	mvn r0, #1
	cmp r7, r0
	beq _020B3C24
	add r0, r0, #1
	cmp r7, r0
	bne _020B3C40
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B3C24:
	mov r0, #0xc
	str r0, [r5]
	mov r0, #0
	str r0, [r4]
	str r4, [r5, #4]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B3C40:
	mov r0, r6
	mov r1, r4
	bl sub_020B3890
	stmia r5, {r0, r4}
	str r7, [r4, #0xc]
	ldr r0, [r5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B3C68:
	ldrb r0, [r6, #8]
	bl sub_020B35EC
	movs r7, r0
	bne _020B3C98
	ldrb r1, [r6, #8]
	ldr r0, _020B3CE8 ; =0x021D6FB4
	bl sub_020B3808
	ldr r0, _020B3CE8 ; =0x021D6FB4
	mov r1, #3
	bl sub_020B369C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B3C98:
	mov r1, r6
	bl sub_020B3984
	mov r4, r0
	add r0, r4, #2
	cmp r0, #1
	bhi _020B3CC0
	mov r0, r7
	bl sub_020B3074
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B3CC0:
	mov r0, r6
	mov r1, r7
	bl sub_020B3890
	stmia r5, {r0, r7}
	str r4, [r7, #0xc]
	ldr r0, [r5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B3CE8: .word 0x021D6FB4
	arm_func_end sub_020B3BB0

	arm_func_start sub_020B3CEC
sub_020B3CEC: ; 0x020B3CEC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020B3E74 ; =0x021D6F90
	mov r5, r0
	ldr r0, [r2, #0x3c]
	mov r4, r1
	cmp r0, #2
	bne _020B3D9C
	ldrb r1, [r2, #0x40]
	ldrb r0, [r5, #8]
	cmp r1, r0
	bne _020B3D8C
	ldr r0, _020B3E78 ; =0x021D6FCC
	mov r1, r5
	bl sub_020B3984
	mov r6, r0
	mvn r1, #2
	cmp r6, r1
	beq _020B3D68
	add r0, r1, #1
	cmp r6, r0
	beq _020B3D50
	add r0, r1, #2
	cmp r6, r0
	beq _020B3D68
	b _020B3D70
_020B3D50:
	mov r0, #0xc
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020B3D68:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020B3D70:
	ldr r1, _020B3E78 ; =0x021D6FCC
	mov r0, r5
	bl sub_020B3890
	ldr r1, _020B3E78 ; =0x021D6FCC
	stmia r4, {r0, r1}
	str r6, [r1, #0xc]
	b _020B3E2C
_020B3D8C:
	mov r0, #1
	bl sub_020B37C8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020B3D9C:
	ldrb r1, [r5, #8]
	ldr r2, _020B3E74 ; =0x021D6F90
	cmp r1, #0
	movne r0, #1
	movne r3, r0, lsl r1
	ldr r0, [r2, #4]
	moveq r3, #1
	tst r0, r3
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	strb r1, [r2, #0x40]
	mov r3, #2
	str r3, [r2, #0x3c]
	mov r3, #0
	ldr r0, _020B3E78 ; =0x021D6FCC
	mov r1, r5
	str r3, [r2, #0x48]
	bl sub_020B3984
	mov r6, r0
	mvn r1, #2
	cmp r6, r1
	addne r0, r1, #1
	cmpne r6, r0
	addne r0, r1, #2
	cmpne r6, r0
	bne _020B3E14
	ldr r1, _020B3E74 ; =0x021D6F90
	mov r0, #0
	str r0, [r1, #0x3c]
	ldmia sp!, {r4, r5, r6, pc}
_020B3E14:
	ldr r1, _020B3E78 ; =0x021D6FCC
	mov r0, r5
	bl sub_020B3890
	ldr r1, _020B3E78 ; =0x021D6FCC
	stmia r4, {r0, r1}
	str r6, [r1, #0xc]
_020B3E2C:
	ldr r0, [r4]
	cmp r0, #0xa
	bne _020B3E54
	mov r0, #1
	bl sub_020B37C8
	bl sub_020D34B0
	ldr r2, _020B3E74 ; =0x021D6F90
	str r0, [r2, #8]
	str r1, [r2, #0xc]
	b _020B3E6C
_020B3E54:
	mov r0, #0
	bl sub_020B37C8
	ldr r0, _020B3E74 ; =0x021D6F90
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
_020B3E6C:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B3E74: .word 0x021D6F90
_020B3E78: .word 0x021D6FCC
	arm_func_end sub_020B3CEC

	arm_func_start sub_020B3E7C
sub_020B3E7C: ; 0x020B3E7C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #4]
	mov r4, r1
	cmp r0, #0xff
	ldreqb r0, [r5, #6]
	cmpeq r0, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #8]
	bl sub_020B3B30
	cmp r0, #0
	beq _020B3ED0
	mov r1, #2
	str r1, [r4]
	str r0, [r4, #4]
	mov r2, #0
	str r2, [r0]
	bl sub_020B369C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_020B3ED0:
	ldrb r1, [r5, #8]
	ldr r0, _020B3EF0 ; =0x021D6FB4
	bl sub_020B3808
	ldr r0, _020B3EF0 ; =0x021D6FB4
	mov r1, #2
	bl sub_020B369C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B3EF0: .word 0x021D6FB4
	arm_func_end sub_020B3E7C

	arm_func_start sub_020B3EF4
sub_020B3EF4: ; 0x020B3EF4
	stmdb sp!, {r3, lr}
	ldr r3, _020B4008 ; =0x021D8498
	ldr r2, [r3, #0x10]
	cmp r2, #2
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrb ip, [r3, #1]
	ldrb r2, [r0, #8]
	cmp ip, r2
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrb r2, [r0, #0xa]
	cmp r2, #0
	beq _020B3F38
	cmp r2, #1
	beq _020B3F84
	b _020B3FF8
_020B3F38:
	ldr r0, _020B400C ; =0x021D6F90
	ldr r2, [r0, #0x3c]
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0, #0x48]
	mov r3, #0
	cmp r0, #5
	cmpne r0, #2
	moveq r0, #9
	streq r0, [r1]
	movne r0, #5
	strne r0, [r1]
	ldr r0, _020B400C ; =0x021D6F90
	ldr r2, _020B4010 ; =0x021D6FCC
	str r3, [r0, #0x3c]
	str r3, [r0, #0x48]
	str r2, [r1, #4]
	b _020B4000
_020B3F84:
	ldr r2, _020B400C ; =0x021D6F90
	mov lr, #2
	str lr, [r2, #0x3c]
	ldrb ip, [r0, #0xb]
	ldrb r3, [r3]
	cmp ip, r3
	bne _020B3FB4
	str lr, [r2, #0x48]
	mov r3, #7
	str r3, [r1]
	ldr r3, [r0, #0xc]
	b _020B3FDC
_020B3FB4:
	mov r3, #3
	str r3, [r2, #0x48]
	mov r2, #6
	str r2, [r1]
	ldrb r3, [r0, #0xb]
	cmp r3, #0
	movne r2, #1
	movne r3, r2, lsl r3
	ldr r2, _020B400C ; =0x021D6F90
	moveq r3, #1
_020B3FDC:
	str r3, [r2, #0x44]
	ldrb r3, [r0, #0xb]
	ldr r0, _020B400C ; =0x021D6F90
	ldr r2, _020B4010 ; =0x021D6FCC
	strb r3, [r0, #0x41]
	str r2, [r1, #4]
	b _020B4000
_020B3FF8:
	mov r0, #0
	ldmia sp!, {r3, pc}
_020B4000:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B4008: .word 0x021D8498
_020B400C: .word 0x021D6F90
_020B4010: .word 0x021D6FCC
	arm_func_end sub_020B3EF4

	arm_func_start sub_020B4014
sub_020B4014: ; 0x020B4014
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _020B40D0 ; =0xE525982B
	mov r2, r1
	umull r1, r4, r2, r3
	ldr r1, _020B40D4 ; =0x021D6FE4
	mov r4, r4, lsr #0xa
	str r0, [r1, #4]
	cmp r4, #4
	blo _020B4040
	cmp r4, #0x48
	bls _020B4048
_020B4040:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020B4048:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	tst r0, #0x1f
	movne r0, #0
	strne r0, [r1, #4]
	ldmneia sp!, {r4, r5, r6, pc}
	mov r1, r0
	mov r0, #0
	bl sub_020D4858
	subs lr, r4, #1
	mov r5, #0
	beq _020B40A8
	ldr r2, _020B40D4 ; =0x021D6FE4
	ldr r0, _020B40D8 ; =0x00000478
	mov r6, r5
_020B4088:
	ldr ip, [r2, #4]
	add r5, r5, #1
	mla r3, r5, r0, ip
	add r1, r6, #0x78
	str r3, [ip, r6]
	cmp r5, lr
	add r6, r1, #0x400
	blo _020B4088
_020B40A8:
	ldr r1, _020B40D4 ; =0x021D6FE4
	ldr r0, _020B40D8 ; =0x00000478
	ldr r2, [r1, #4]
	mov r3, #0
	mla r0, r4, r0, r2
	str r3, [r0, #-0x478]
	ldr r2, [r1, #4]
	mov r0, #1
	str r2, [r1]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B40D0: .word 0xE525982B
_020B40D4: .word 0x021D6FE4
_020B40D8: .word 0x00000478
	arm_func_end sub_020B4014

	arm_func_start sub_020B40DC
sub_020B40DC: ; 0x020B40DC
	ldr r0, _020B40F0 ; =0x021D6FE4
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_020B40F0: .word 0x021D6FE4
	arm_func_end sub_020B40DC

	arm_func_start sub_020B40F4
sub_020B40F4: ; 0x020B40F4
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl sub_020D3A38
	ldr r1, _020B4124 ; =0x021D6FE4
	ldr r3, [r1]
	cmp r3, #0
	ldrne r2, [r3]
	movne r4, r3
	strne r2, [r1]
	bl sub_020D3A4C
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B4124: .word 0x021D6FE4
	arm_func_end sub_020B40F4

	arm_func_start sub_020B4128
sub_020B4128: ; 0x020B4128
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020D3A38
	ldr r1, _020B4158 ; =0x021D6FE4
	mov r2, #0
	ldr r3, [r1]
	str r3, [r4]
	str r4, [r1]
	str r2, [r4, #4]
	str r2, [r4, #8]
	bl sub_020D3A4C
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B4158: .word 0x021D6FE4
	arm_func_end sub_020B4128

	arm_func_start sub_020B415C
sub_020B415C: ; 0x020B415C
	ldr r0, _020B419C ; =0x021D6FF8
	mov r2, #0
	mov r1, #0x1000000
_020B4168:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #4
	blt _020B4168
	ldr r1, _020B41A0 ; =0x021D6FEC
	mov r2, #0
	str r2, [r1, #4]
	ldr r0, _020B41A4 ; =_02110904
	str r2, [r1]
	str r2, [r0]
	str r2, [r0, #4]
	str r2, [r1, #8]
	bx lr
	.align 2, 0
_020B419C: .word 0x021D6FF8
_020B41A0: .word 0x021D6FEC
_020B41A4: .word _02110904
	arm_func_end sub_020B415C

	arm_func_start sub_020B41A8
sub_020B41A8: ; 0x020B41A8
	stmdb sp!, {r3, lr}
	movs r1, r0
	ldmeqia sp!, {r3, pc}
	ldr r0, _020B41C4 ; =_02110904
	mov r2, #0x10
	bl sub_020D4A50
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B41C4: .word _02110904
	arm_func_end sub_020B41A8

	arm_func_start sub_020B41C8
sub_020B41C8: ; 0x020B41C8
	stmdb sp!, {r4, lr}
	ldr r3, _020B4394 ; =_02110904
	mov ip, r1, lsr #8
	str ip, [r3, #4]
	cmp r2, #0
	strneb ip, [r2]
	ldr r2, _020B4394 ; =_02110904
	ldr r2, [r2]
	cmp r2, #0
	bne _020B42DC
	mov ip, #0
	ldr r3, _020B4398 ; =0x021D6FF8
	mov lr, ip
_020B41FC:
	ldr r2, [r3, lr, lsl #2]
	add lr, lr, #1
	cmp lr, #4
	add ip, ip, r2
	blt _020B41FC
	ldr r3, _020B439C ; =0x040002B0
	mov r2, #0
	strh r2, [r3]
	mov r2, ip, lsr #2
	str r2, [r3, #8]
_020B4224:
	ldrh r2, [r3]
	tst r2, #0x8000
	bne _020B4224
	ldr r2, _020B43A0 ; =0x040002B4
	cmp r1, #0
	ldr r2, [r2]
	beq _020B42B8
	cmp r1, r2, lsl #1
	blo _020B42B8
	mov r3, #0
	ldr r2, _020B4398 ; =0x021D6FF8
	mov ip, r3
_020B4254:
	ldr r1, [r2, ip, lsl #2]
	add ip, ip, #1
	cmp ip, #4
	add r3, r3, r1
	blo _020B4254
	ldr r2, _020B439C ; =0x040002B0
	mov r1, #0
	strh r1, [r2]
	mov r1, r3, lsr #2
	str r1, [r2, #8]
_020B427C:
	ldrh r1, [r2]
	tst r1, #0x8000
	bne _020B427C
	ldr r1, _020B43A0 ; =0x040002B4
	ldr r2, _020B43A4 ; =0x021D6FEC
	ldr r1, [r1]
	mov r3, #0
	add r1, r1, r1, lsl #1
	mov r1, r1, lsr #1
	str r1, [r2]
	ldr r1, _020B4394 ; =_02110904
	str r3, [r2, #4]
	mov lr, #1
	str lr, [r1]
	b _020B42BC
_020B42B8:
	mov lr, #0
_020B42BC:
	ldr r1, _020B43A4 ; =0x021D6FEC
	ldr r3, _020B4398 ; =0x021D6FF8
	ldr ip, [r1, #4]
	add r2, ip, #1
	and r2, r2, #3
	str r0, [r3, ip, lsl #2]
	str r2, [r1, #4]
	b _020B438C
_020B42DC:
	ldr r1, _020B43A4 ; =0x021D6FEC
	mov lr, #0
	ldr ip, [r1, #4]
	ldr r3, _020B4398 ; =0x021D6FF8
	add r2, ip, #1
	and r2, r2, #3
	mov r4, lr
	str r0, [r3, ip, lsl #2]
	str r2, [r1, #4]
_020B4300:
	ldr r0, [r3, r4, lsl #2]
	add r4, r4, #1
	cmp r4, #4
	add lr, lr, r0
	blt _020B4300
	ldr r1, _020B439C ; =0x040002B0
	mov r0, #0
	strh r0, [r1]
	mov r0, lr, lsr #2
	str r0, [r1, #8]
_020B4328:
	ldrh r0, [r1]
	tst r0, #0x8000
	bne _020B4328
	ldr r0, _020B43A0 ; =0x040002B4
	ldr r1, _020B43A4 ; =0x021D6FEC
	ldr r2, [r0]
	ldr r0, [r1]
	cmp r2, r0
	bhi _020B4380
	ldr r2, [r1, #8]
	ldr r0, _020B4394 ; =_02110904
	add r3, r2, #1
	str r3, [r1, #8]
	ldr r2, [r0, #8]
	cmp r3, r2
	ble _020B4388
	mov r2, #0
	str r2, [r0]
	str r2, [r1, #8]
	str r2, [r1, #4]
	mov r0, #3
	ldmia sp!, {r4, pc}
_020B4380:
	mov r0, #0
	str r0, [r1, #8]
_020B4388:
	mov lr, #2
_020B438C:
	mov r0, lr
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B4394: .word _02110904
_020B4398: .word 0x021D6FF8
_020B439C: .word 0x040002B0
_020B43A0: .word 0x040002B4
_020B43A4: .word 0x021D6FEC
	arm_func_end sub_020B41C8

	arm_func_start sub_020B43A8
sub_020B43A8: ; 0x020B43A8
	mov r2, #0xf
	ldr r1, _020B43C8 ; =_02110904
	mov r0, #0x44
	smulbb r0, r2, r0
	str r2, [r1, #8]
	ldr ip, _020B43CC ; =sub_020B415C
	str r0, [r1, #0xc]
	bx ip
	.align 2, 0
_020B43C8: .word _02110904
_020B43CC: .word sub_020B415C
	arm_func_end sub_020B43A8

	arm_func_start sub_020B43D0
sub_020B43D0: ; 0x020B43D0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrsh r2, [r0]
	ldr r3, _020B44A8 ; =0x021D7008
	ldr r5, _020B44AC ; =0x00000E9F
	ldr r4, [r3, #4]
	smulbb r7, r2, r5
	ldr r2, [r3, #0x10]
	ldr r6, _020B44B0 ; =0x00000D3E
	add r4, r7, r4
	mla r4, r2, r6, r4
	mov r4, r4, asr #0xc
	mul lr, r4, r4
	mov r1, r1, lsr #1
	str r4, [r3, #0x10]
	rsb r2, r7, #0
	str r2, [r3, #4]
	cmp r1, #1
	mov ip, lr, asr #0x1f
	mov r3, #1
	bls _020B4468
_020B4420:
	mov r7, r3, lsl #1
	ldrsh r8, [r0, r7]
	add r7, r0, r3, lsl #1
	add r3, r3, #1
	smulbb r8, r8, r5
	add r2, r8, r2
	mla r2, r4, r6, r2
	strh r4, [r7, #-2]
	mov r4, r2, asr #0xc
	mul r2, r4, r4
	adds lr, lr, r2
	adc ip, ip, r2, asr #31
	rsb r2, r8, #0
	cmp r3, r1
	blo _020B4420
	ldr r3, _020B44A8 ; =0x021D7008
	str r2, [r3, #4]
	str r4, [r3, #0x10]
_020B4468:
	add r0, r0, r1, lsl #1
	strh r4, [r0, #-2]
	ldr r2, _020B44B4 ; =0x04000280
	mov r0, #1
	strh r0, [r2]
	str lr, [r2, #0x10]
	str ip, [r2, #0x14]
	str r1, [r2, #0x18]
	mov r0, #0
	str r0, [r2, #0x1c]
_020B4490:
	ldrh r0, [r2]
	tst r0, #0x8000
	bne _020B4490
	ldr r0, _020B44B8 ; =0x040002A0
	ldr r0, [r0]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020B44A8: .word 0x021D7008
_020B44AC: .word 0x00000E9F
_020B44B0: .word 0x00000D3E
_020B44B4: .word 0x04000280
_020B44B8: .word 0x040002A0
	arm_func_end sub_020B43D0

	arm_func_start sub_020B44BC
sub_020B44BC: ; 0x020B44BC
	stmdb sp!, {r3, lr}
	ldr r0, _020B4520 ; =0x021D7008
	mov r2, #0
	ldr r1, _020B4524 ; =0x0000019D
	str r2, [r0, #0xc]
	str r1, [r0, #8]
	ldr ip, _020B4528 ; =_02110914
	ldr r0, _020B452C ; =0x021D748C
	mov lr, r2
_020B44E0:
	mov r1, r2, lsl #1
	add r2, r2, #1
	strh lr, [r0, r1]
	cmp r2, #0x800
	blt _020B44E0
	ldr r2, _020B4530 ; =0x021D7034
	ldr r0, _020B4534 ; =0x021D701C
	mov r3, #0
_020B4500:
	mov r1, lr, lsl #1
	ldrsh r1, [ip, r1]
	str r3, [r2, lr, lsl #2]
	str r1, [r0, lr, lsl #2]
	add lr, lr, #1
	cmp lr, #6
	blt _020B4500
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B4520: .word 0x021D7008
_020B4524: .word 0x0000019D
_020B4528: .word _02110914
_020B452C: .word 0x021D748C
_020B4530: .word 0x021D7034
_020B4534: .word 0x021D701C
	arm_func_end sub_020B44BC

	arm_func_start sub_020B4538
sub_020B4538: ; 0x020B4538
	ldr ip, _020B4548 ; =sub_020D48B4
	mov r2, r1
	ldr r1, _020B454C ; =0x021D704C
	bx ip
	.align 2, 0
_020B4548: .word sub_020D48B4
_020B454C: .word 0x021D704C
	arm_func_end sub_020B4538

	arm_func_start sub_020B4550
sub_020B4550: ; 0x020B4550
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov r4, #0
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	mov r8, r4
	movs r2, r2, lsr #1
	beq _020B4678
	ldr lr, _020B4754 ; =0x3FFF8000
	ldr ip, _020B4758 ; =0x021D7008
_020B4578:
	mov r4, r8, lsl #1
	ldr r7, [ip, #0xc]
	ldrsh r6, [r1, r4]
	ldr r4, _020B475C ; =0x021D748C
	mov r5, r7, lsl #1
	strh r6, [r4, r5]
	ldr r4, [ip, #8]
	str r4, [sp]
	mov r5, r4, lsl #1
	ldr r4, _020B475C ; =0x021D748C
	ldrsh r6, [r4, r5]
	str r6, [ip, #0x2c]
	ldr sb, [ip, #0x3c]
	ldr sl, [ip, #0x24]
	ldr r5, [ip, #0x40]
	mul sl, sb, sl
	ldr r4, [ip, #0x28]
	str sb, [sp, #4]
	mla r4, r5, r4, sl
	mov r5, sb
	str r5, [ip, #0x40]
	ldr sb, [ip, #0x38]
	ldr r5, [ip, #0x20]
	mla r5, sb, r5, r4
	str sb, [ip, #0x3c]
	ldr sb, [ip, #0x34]
	ldr r4, [ip, #0x1c]
	mla r5, sb, r4, r5
	str sb, [ip, #0x38]
	ldr sb, [ip, #0x30]
	ldr r4, [ip, #0x18]
	mla r5, sb, r4, r5
	str sb, [ip, #0x34]
	ldr r4, [ip, #0x14]
	mla r4, r6, r4, r5
	cmp r4, lr
	str r6, [ip, #0x30]
	movgt r4, lr
	bgt _020B461C
	cmp r4, #0xc0000000
	movlt r4, #0xc0000000
_020B461C:
	add r5, r7, #1
	and r5, r5, lr, lsr #19
	str r5, [ip, #0xc]
	ldr r5, [sp]
	mov r6, r8, lsl #1
	add r5, r5, #1
	and r5, r5, lr, lsr #19
	str r5, [ip, #8]
	mov r4, r4, asr #0xf
	strh r4, [r1, r6]
	ldrsh r5, [r1, r6]
	ldrsh r4, [r0, r6]
	add r8, r8, #1
	smulbb r5, r5, r5
	strh r4, [r1, r6]
	ldr r4, [sp, #8]
	adds r4, r4, r5
	str r4, [sp, #8]
	ldr r4, [sp, #0xc]
	adc r4, r4, r5, asr #31
	str r4, [sp, #0xc]
	cmp r8, r2
	blo _020B4578
_020B4678:
	ldr r4, _020B4760 ; =0x04000280
	mov r1, #1
	strh r1, [r4]
	ldr r1, [sp, #8]
	str r1, [r4, #0x10]
	ldr r1, [sp, #0xc]
	str r1, [r4, #0x14]
	str r2, [r4, #0x18]
	mov r1, #0
	str r1, [r4, #0x1c]
_020B46A0:
	ldrh r1, [r4]
	tst r1, #0x8000
	bne _020B46A0
	ldr r5, _020B4764 ; =0x040002A0
	mov r1, #0
	ldr r4, [r5]
	strh r1, [r5, #0x10]
	str r4, [r5, #0x18]
_020B46C0:
	ldrh r1, [r5, #0x10]
	tst r1, #0x8000
	bne _020B46C0
	ldr r1, _020B4768 ; =0x040002B4
	ldr r4, [r1]
	add r1, r4, r4, lsl #1
	cmp r1, r3, lsl #1
	bhs _020B46F4
	ldr r0, _020B4758 ; =0x021D7008
	mov r1, #0
	add sp, sp, #0x10
	strh r1, [r0]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020B46F4:
	cmp r3, r4
	ldrlo r1, _020B4758 ; =0x021D7008
	movlo r3, #4
	strloh r3, [r1]
	ldr r1, _020B4758 ; =0x021D7008
	mov r5, #0
	ldrsh r3, [r1]
	cmp r3, #4
	addlt r3, r3, #1
	strlth r3, [r1]
	cmp r2, #0
	addls sp, sp, #0x10
	ldmlsia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, _020B4758 ; =0x021D7008
	ldrsh r4, [r1]
_020B4730:
	mov r3, r5, lsl #1
	ldrsh r1, [r0, r3]
	add r5, r5, #1
	cmp r5, r2
	mov r1, r1, asr r4
	strh r1, [r0, r3]
	blo _020B4730
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020B4754: .word 0x3FFF8000
_020B4758: .word 0x021D7008
_020B475C: .word 0x021D748C
_020B4760: .word 0x04000280
_020B4764: .word 0x040002A0
_020B4768: .word 0x040002B4
	arm_func_end sub_020B4550

	arm_func_start sub_020B476C
sub_020B476C: ; 0x020B476C
	stmdb sp!, {r3, lr}
	mov ip, r1
	mov r3, r2
	ldr r1, _020B4788 ; =0x021D704C
	mov r2, ip
	bl sub_020B4550
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B4788: .word 0x021D704C
	arm_func_end sub_020B476C

	arm_func_start sub_020B478C
sub_020B478C: ; 0x020B478C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	movs lr, r3, lsr #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r3, #0x8000
	rsb r3, r3, #0
	mov ip, r3, lsr #0x11
_020B47A8:
	mov r5, r4, lsl #1
	ldrsh r6, [r0, r5]
	ldrsh r5, [r1, r5]
	add r6, r6, r5
	cmp r6, r3, lsr #17
	movgt r6, ip
	bgt _020B47CC
	cmp r6, r3
	movlt r6, r3
_020B47CC:
	mov r5, r4, lsl #1
	strh r6, [r2, r5]
	add r6, r0, r4, lsl #1
	add r5, r1, r4, lsl #1
	ldrsh r6, [r6, #2]
	ldrsh r5, [r5, #2]
	add r6, r6, r5
	cmp r6, r3, lsr #17
	movgt r6, ip
	bgt _020B47FC
	cmp r6, r3
	movlt r6, r3
_020B47FC:
	add r5, r2, r4, lsl #1
	strh r6, [r5, #2]
	add r6, r0, r4, lsl #1
	add r5, r1, r4, lsl #1
	ldrsh r6, [r6, #4]
	ldrsh r5, [r5, #4]
	add r6, r6, r5
	cmp r6, r3, lsr #17
	movgt r6, ip
	bgt _020B482C
	cmp r6, r3
	movlt r6, r3
_020B482C:
	add r5, r2, r4, lsl #1
	strh r6, [r5, #4]
	add r6, r0, r4, lsl #1
	add r5, r1, r4, lsl #1
	ldrsh r6, [r6, #6]
	ldrsh r5, [r5, #6]
	add r6, r6, r5
	cmp r6, r3, lsr #17
	movgt r6, ip
	bgt _020B485C
	cmp r6, r3
	movlt r6, r3
_020B485C:
	add r5, r2, r4, lsl #1
	add r4, r4, #4
	strh r6, [r5, #6]
	cmp r4, lr
	blo _020B47A8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B478C

	.section .version,4

	.balign 4, 0
	.public _version_Abiosso_libVCT
_version_Abiosso_libVCT: ; 0x02000C54
	.asciz "[SDK+Abiosso:libVCT 1.3.1]"

	.previous

	arm_func_start sub_020B4874
sub_020B4874: ; 0x020B4874
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _020B49A0 ; =_version_Abiosso_libVCT
	bl OSi_ReferSymbol
	cmp r4, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _020B49A4 ; =0x021D848C
	ldr r0, [r0, #8]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #8]
	cmp r0, #1
	cmpne r0, #2
	cmpne r0, #3
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #0x18]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r2, [r4, #0x10]
	cmp r2, #0
	ldrne r0, [r4, #0x14]
	cmpne r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, r2, lsr #0x1f
	rsb r0, r1, r2, lsl #27
	adds r0, r1, r0, ror #27
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, _020B49A8 ; =0x021D8498
	mov r1, #0
	mov r2, #0x18
	bl sub_020D4994
	ldr r2, [r4, #0x18]
	ldr r1, _020B49A4 ; =0x021D848C
	mov r0, #0
	str r2, [r1, #0x10]
	ldr r2, [r4, #0x1c]
	str r2, [r1, #0x14]
	ldr r2, [r4, #8]
	str r2, [r1, #0x1c]
	str r0, [r1, #0x18]
	ldrb r2, [r4, #0xc]
	cmp r2, #0x20
	ldmhsia sp!, {r4, pc}
	strb r2, [r1, #0xc]
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	bl sub_020B4014
	cmp r0, #0
	bne _020B495C
	bl sub_020B40DC
	mov r0, #0
	ldmia sp!, {r4, pc}
_020B495C:
	mov r0, r4
	bl sub_020B3398
	cmp r0, #0
	bne _020B4978
	bl sub_020B40DC
	mov r0, #0
	ldmia sp!, {r4, pc}
_020B4978:
	bl sub_020B1584
	cmp r0, #0
	ldrne r1, _020B49A4 ; =0x021D848C
	movne r0, #1
	strne r0, [r1, #8]
	ldmneia sp!, {r4, pc}
	bl sub_020B34AC
	bl sub_020B40DC
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B49A0: .word _version_Abiosso_libVCT
_020B49A4: .word 0x021D848C
_020B49A8: .word 0x021D8498
	arm_func_end sub_020B4874

	arm_func_start sub_020B49AC
sub_020B49AC: ; 0x020B49AC
	stmdb sp!, {r3, lr}
	bl sub_020B1680
	bl sub_020B34AC
	bl sub_020B40DC
	ldr r0, _020B49D0 ; =0x021D848C
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B49D0: .word 0x021D848C
	arm_func_end sub_020B49AC

	arm_func_start sub_020B49D4
sub_020B49D4: ; 0x020B49D4
	stmdb sp!, {r3, lr}
	ldr r0, _020B4A14 ; =0x021D848C
	ldr r1, [r0, #8]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	tst r1, #0xf
	bne _020B4A00
	bl sub_020B34C4
_020B4A00:
	bl sub_020B22E4
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_020B2214
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B4A14: .word 0x021D848C
	arm_func_end sub_020B49D4

	arm_func_start sub_020B4A18
sub_020B4A18: ; 0x020B4A18
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	add r3, sp, #0
	mov r4, r0
	bl sub_020B4A8C
	cmp r0, #0
	beq _020B4A7C
	cmp r0, #1
	beq _020B4A48
	cmp r0, #2
	beq _020B4A70
	b _020B4A7C
_020B4A48:
	ldr r0, _020B4A88 ; =0x021D848C
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [r0, #0x14]
	ldr ip, [r0, #0x10]
	mov r0, r4
	blx ip
	add sp, sp, #8
	mov r0, #1
	ldmia sp!, {r4, pc}
_020B4A70:
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r4, pc}
_020B4A7C:
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B4A88: .word 0x021D848C
	arm_func_end sub_020B4A18

	arm_func_start sub_020B4A8C
sub_020B4A8C: ; 0x020B4A8C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r6, r1
	mov r7, r0
	mov r5, r2
	mov r4, r3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r6]
	ldr r0, _020B4B60 ; =0x5F564354
	cmp r1, r0
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _020B4B64 ; =0x021D848C
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	ldrne r0, [r0, #8]
	cmpne r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	bl sub_020D34B0
	ldrb r2, [r6, #4]
	and r3, r2, #0xf0
	cmp r3, #0x40
	bne _020B4B28
	ldr r2, _020B4B64 ; =0x021D848C
	mov r3, r0
	ldr r4, [r2, #4]
	mov r0, r7
	add r4, r4, #1
	str r4, [r2, #4]
	str r1, [sp]
	mov r1, r6
	mov r2, r5
	bl sub_020B2028
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B4B28:
	cmp r2, #0
	cmpne r2, #0xff
	bne _020B4B58
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl sub_020B3570
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B4B58:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B4B60: .word 0x5F564354
_020B4B64: .word 0x021D848C
	arm_func_end sub_020B4A8C

	arm_func_start sub_020B4B68
sub_020B4B68: ; 0x020B4B68
	mov r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end sub_020B4B68

	arm_func_start sub_020B4B80
sub_020B4B80: ; 0x020B4B80
	ldrh r3, [r0, #0xa]
	mov r2, #0
	add ip, r1, r3
	str r2, [ip, #4]
	str r2, [r1, r3]
	str r1, [r0]
	str r1, [r0, #4]
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	bx lr
	arm_func_end sub_020B4B80

	arm_func_start sub_020B4BAC
sub_020B4BAC: ; 0x020B4BAC
	stmdb sp!, {r3, lr}
	ldr r2, [r0]
	cmp r2, #0
	bne _020B4BC4
	bl sub_020B4B80
	ldmia sp!, {r3, pc}
_020B4BC4:
	ldrh ip, [r0, #0xa]
	ldr r3, [r0, #4]
	mov r2, #0
	str r3, [r1, ip]
	add r3, r1, ip
	str r2, [r3, #4]
	ldrh r2, [r0, #0xa]
	ldr r3, [r0, #4]
	add r2, r3, r2
	str r1, [r2, #4]
	str r1, [r0, #4]
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B4BAC

	arm_func_start sub_020B4C00
sub_020B4C00: ; 0x020B4C00
	stmdb sp!, {r3, lr}
	ldr r2, [r0]
	cmp r2, #0
	bne _020B4C18
	bl sub_020B4B80
	ldmia sp!, {r3, pc}
_020B4C18:
	ldrh r3, [r0, #0xa]
	mov r2, #0
	str r2, [r1, r3]
	ldr r2, [r0]
	add r3, r1, r3
	str r2, [r3, #4]
	ldrh r2, [r0, #0xa]
	ldr r3, [r0]
	str r1, [r3, r2]
	str r1, [r0]
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B4C00

	arm_func_start sub_020B4C50
sub_020B4C50: ; 0x020B4C50
	stmdb sp!, {r3, lr}
	cmp r1, #0
	bne _020B4C68
	mov r1, r2
	bl sub_020B4BAC
	ldmia sp!, {r3, pc}
_020B4C68:
	ldr r3, [r0]
	cmp r1, r3
	bne _020B4C80
	mov r1, r2
	bl sub_020B4C00
	ldmia sp!, {r3, pc}
_020B4C80:
	ldrh lr, [r0, #0xa]
	ldr r3, [r1, lr]
	add ip, r2, lr
	str r3, [r2, lr]
	str r1, [ip, #4]
	add r3, r3, lr
	str r2, [r3, #4]
	ldrh r3, [r0, #0xa]
	str r2, [r1, r3]
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B4C50

	arm_func_start sub_020B4CB4
sub_020B4CB4: ; 0x020B4CB4
	stmdb sp!, {r3, lr}
	ldrh ip, [r0, #0xa]
	ldr r3, [r1, ip]
	add lr, r1, ip
	cmp r3, #0
	ldreq r1, [lr, #4]
	streq r1, [r0]
	ldrne r2, [lr, #4]
	addne r1, r3, ip
	strne r2, [r1, #4]
	ldr r3, [lr, #4]
	cmp r3, #0
	ldreq r1, [lr]
	streq r1, [r0, #4]
	ldrneh r1, [r0, #0xa]
	ldrne r2, [lr]
	strne r2, [r3, r1]
	mov r1, #0
	str r1, [lr]
	str r1, [lr, #4]
	ldrh r1, [r0, #8]
	sub r1, r1, #1
	strh r1, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B4CB4

	.rodata

_02018F9C:
	.byte 0x00, 0x00, 0x00, 0x00
_02108FA0:
	.byte 0x01, 0x02, 0x00, 0x04, 0x03, 0x05, 0x06, 0x07, 0x05, 0x09, 0x01, 0x0E, 0x0C, 0x02, 0x0A, 0x00
	.byte 0x0B, 0x0D, 0x03, 0x04, 0x08, 0x06, 0x0F, 0x07, 0x15, 0x03, 0x00, 0x00, 0x02, 0x01, 0x29, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0xFF, 0x01, 0xFF, 0xFF, 0x01, 0x02
	.byte 0xFF, 0xFF, 0x01, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x04, 0x06, 0x08, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x02, 0x04, 0x06, 0x08, 0x07, 0x00, 0x08, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0C, 0x00
	.byte 0x0D, 0x00, 0x0E, 0x00, 0x10, 0x00, 0x11, 0x00, 0x13, 0x00, 0x15, 0x00, 0x17, 0x00, 0x19, 0x00
	.byte 0x1C, 0x00, 0x1F, 0x00, 0x22, 0x00, 0x25, 0x00, 0x29, 0x00, 0x2D, 0x00, 0x32, 0x00, 0x37, 0x00
	.byte 0x3C, 0x00, 0x42, 0x00, 0x49, 0x00, 0x50, 0x00, 0x58, 0x00, 0x61, 0x00, 0x6B, 0x00, 0x76, 0x00
	.byte 0x82, 0x00, 0x8F, 0x00, 0x9D, 0x00, 0xAD, 0x00, 0xBE, 0x00, 0xD1, 0x00, 0xE6, 0x00, 0xFD, 0x00
	.byte 0x17, 0x01, 0x33, 0x01, 0x51, 0x01, 0x73, 0x01, 0x98, 0x01, 0xC1, 0x01, 0xEE, 0x01, 0x20, 0x02
	.byte 0x56, 0x02, 0x92, 0x02, 0xD4, 0x02, 0x1C, 0x03, 0x6C, 0x03, 0xC3, 0x03, 0x24, 0x04, 0x8E, 0x04
	.byte 0x02, 0x05, 0x83, 0x05, 0x10, 0x06, 0xAB, 0x06, 0x56, 0x07, 0x12, 0x08, 0xE0, 0x08, 0xC3, 0x09
	.byte 0xBD, 0x0A, 0xD0, 0x0B, 0xFF, 0x0C, 0x4C, 0x0E, 0xBA, 0x0F, 0x4C, 0x11, 0x07, 0x13, 0xEE, 0x14
	.byte 0x06, 0x17, 0x54, 0x19, 0xDC, 0x1B, 0xA5, 0x1E, 0xB6, 0x21, 0x15, 0x25, 0xCA, 0x28, 0xDF, 0x2C
	.byte 0x5B, 0x31, 0x4B, 0x36, 0xB9, 0x3B, 0xB2, 0x41, 0x44, 0x48, 0x7E, 0x4F, 0x71, 0x57, 0x2F, 0x60
	.byte 0xCE, 0x69, 0x62, 0x74, 0xFF, 0x7F, 0x00, 0x00, 0x08, 0x00, 0x08, 0x00, 0x02, 0x04, 0x03, 0x04
	.byte 0x04, 0x04, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x01, 0x02
	.byte 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x03, 0x00, 0x01, 0x08, 0x04, 0x0A, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x0C, 0x02, 0x03, 0x09, 0x02, 0x00, 0x00, 0xFE, 0xFE, 0xFE, 0x03, 0xFF, 0xFF, 0x00, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFE, 0xFE, 0xFE, 0xFD, 0xFF, 0x02, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFE, 0xFE
	.byte 0xFE, 0xFD, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0x00, 0xFE, 0xFD, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFE, 0xFE, 0xFD, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE
	.byte 0xFE, 0xFE, 0xFD, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0xFF, 0x01, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE
	.byte 0x00, 0x00, 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0x05, 0xFE, 0xFE, 0xFE, 0x00, 0xFE, 0xFE, 0xFE, 0xFE
	.byte 0xFE, 0x05, 0xFE, 0xFE, 0xFE, 0xFE, 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE
	.byte 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0x02, 0x00, 0x00, 0x00, 0xFE
	.byte 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0x00, 0x00, 0xFE, 0xFE, 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0x01
	.byte 0xFF, 0xFE, 0x00, 0x00, 0x00, 0xFE, 0xFE, 0xFE, 0x05, 0x05, 0xFE, 0xFF, 0xFE, 0x00, 0xFE, 0xFE
	.byte 0xFE, 0xFE, 0xFE, 0x05, 0xFE, 0xFE, 0xFF, 0xFE, 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE
	.byte 0xFE, 0xFF, 0xFE, 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFF, 0x03, 0x00, 0x00
	.byte 0x00, 0xFE, 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0xFF, 0x00, 0x00, 0xFE, 0xFE, 0x00, 0xFE, 0x04, 0xFE
	.byte 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFE, 0xFE, 0xFE, 0xFF, 0x02, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0xFE, 0x05, 0x05, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE
	.byte 0xFE, 0xFE, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFE, 0x05, 0xFE, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFE, 0xFE, 0xFE, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0xFF
	.byte 0x14, 0x59, 0x0B, 0x02, 0x34, 0x59, 0x0B, 0x02, 0xFC, 0x58, 0x0B, 0x02, 0x10, 0x59, 0x0B, 0x02

	.data

_021105DC:
	.byte 0xF4, 0xC0, 0x09, 0x02
	.byte 0x38, 0xC0, 0x09, 0x02
_021105E4:
	.byte 0x4C, 0xBF, 0x09, 0x02, 0x8C, 0xBF, 0x09, 0x02
_021105EC:
	.byte 0x00, 0x00, 0x00, 0x10
	.byte 0x00, 0x00, 0x00, 0x00
_021105F4:
	.byte 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x61, 0x62
	.byte 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6A, 0x6B, 0x6C, 0x6D, 0x6E, 0x6F, 0x70, 0x71, 0x72
	.byte 0x73, 0x74, 0x75, 0x76, 0x00, 0x00, 0x00, 0x00
_02110618:
	.byte 0x25, 0x73, 0x25, 0x63, 0x25, 0x63, 0x25, 0x63
	.byte 0x25, 0x63, 0x25, 0x73, 0x00, 0x00, 0x00, 0x00
_02110628:
	.byte 0x00, 0x00, 0x00, 0x00
_0211062C:
	.byte 0xE6, 0xFF, 0xFF, 0xFF
_02110630:
	.byte 0x01, 0x01, 0xC0, 0x05, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08
	.byte 0x00, 0x08, 0x0C, 0x20, 0x00, 0x00, 0x00, 0x00
_02110648:
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x66, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x61, 0x08, 0x00, 0x00, 0x00, 0x08, 0x0C, 0x20, 0x00, 0x08, 0x0D, 0x20
_02110660:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEA, 0x05, 0x00, 0x00, 0x00, 0x00, 0xEB, 0x06, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x0D, 0x20
_02110678:
	.byte 0x25, 0x64, 0x2E, 0x25, 0x64, 0x2E, 0x25, 0x64
	.byte 0x2E, 0x25, 0x64, 0x00
_02110684:
	.byte 0x10, 0x00, 0x00, 0x00
_02110688:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
_02110690:
	.byte 0xAA, 0xAA, 0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00
_0211069C:
	.byte 0x4E, 0x69, 0x6E, 0x74
	.byte 0x65, 0x6E, 0x64, 0x6F, 0x44, 0x53, 0x00, 0x00, 0x55, 0x04, 0x03, 0x00, 0xFF, 0xFF, 0xFF, 0x00
_021106B0:
	.byte 0x04, 0x00, 0x05, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_021106B8:
	.byte 0xAC, 0x06, 0x11, 0x02, 0xD8, 0x06, 0x11, 0x02
	.byte 0xD0, 0x06, 0x11, 0x02, 0xE4, 0x06, 0x11, 0x02, 0xF0, 0x06, 0x11, 0x02, 0xA8, 0x06, 0x11, 0x02
	.byte 0x55, 0x08, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01
	.byte 0x01, 0x00, 0x00, 0x00, 0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01, 0x04, 0x00, 0x00, 0x00
	.byte 0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01, 0x05, 0x00, 0x00, 0x00
_021106FC:
	.byte 0x41, 0x00, 0x00, 0x00
_02110700:
	.byte 0x42, 0x42, 0x00, 0x00
_02110704:
	.byte 0x43, 0x43, 0x43, 0x00
_02110708:
	.byte 0x53, 0x52, 0x56, 0x52, 0x00, 0x00, 0x00, 0x00
_02110710:
	.byte 0x43, 0x4C, 0x4E, 0x54, 0x00, 0x00, 0x00, 0x00
_02110718:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
	.byte 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x01, 0x06, 0x0B, 0x00, 0x05, 0x0A, 0x0F, 0x04
	.byte 0x09, 0x0E, 0x03, 0x08, 0x0D, 0x02, 0x07, 0x0C, 0x05, 0x08, 0x0B, 0x0E, 0x01, 0x04, 0x07, 0x0A
	.byte 0x0D, 0x00, 0x03, 0x06, 0x09, 0x0C, 0x0F, 0x02, 0x00, 0x07, 0x0E, 0x05, 0x0C, 0x03, 0x0A, 0x01
	.byte 0x08, 0x0F, 0x06, 0x0D, 0x04, 0x0B, 0x02, 0x09
_02110758:
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110798:
	.byte 0x78, 0xA4, 0x6A, 0xD7, 0x56, 0xB7, 0xC7, 0xE8
	.byte 0xDB, 0x70, 0x20, 0x24, 0xEE, 0xCE, 0xBD, 0xC1, 0xAF, 0x0F, 0x7C, 0xF5, 0x2A, 0xC6, 0x87, 0x47
	.byte 0x13, 0x46, 0x30, 0xA8, 0x01, 0x95, 0x46, 0xFD, 0xD8, 0x98, 0x80, 0x69, 0xAF, 0xF7, 0x44, 0x8B
	.byte 0xB1, 0x5B, 0xFF, 0xFF, 0xBE, 0xD7, 0x5C, 0x89, 0x22, 0x11, 0x90, 0x6B, 0x93, 0x71, 0x98, 0xFD
	.byte 0x8E, 0x43, 0x79, 0xA6, 0x21, 0x08, 0xB4, 0x49, 0x62, 0x25, 0x1E, 0xF6, 0x40, 0xB3, 0x40, 0xC0
	.byte 0x51, 0x5A, 0x5E, 0x26, 0xAA, 0xC7, 0xB6, 0xE9, 0x5D, 0x10, 0x2F, 0xD6, 0x53, 0x14, 0x44, 0x02
	.byte 0x81, 0xE6, 0xA1, 0xD8, 0xC8, 0xFB, 0xD3, 0xE7, 0xE6, 0xCD, 0xE1, 0x21, 0xD6, 0x07, 0x37, 0xC3
	.byte 0x87, 0x0D, 0xD5, 0xF4, 0xED, 0x14, 0x5A, 0x45, 0x05, 0xE9, 0xE3, 0xA9, 0xF8, 0xA3, 0xEF, 0xFC
	.byte 0xD9, 0x02, 0x6F, 0x67, 0x8A, 0x4C, 0x2A, 0x8D, 0x42, 0x39, 0xFA, 0xFF, 0x81, 0xF6, 0x71, 0x87
	.byte 0x22, 0x61, 0x9D, 0x6D, 0x0C, 0x38, 0xE5, 0xFD, 0x44, 0xEA, 0xBE, 0xA4, 0xA9, 0xCF, 0xDE, 0x4B
	.byte 0x60, 0x4B, 0xBB, 0xF6, 0x70, 0xBC, 0xBF, 0xBE, 0xC6, 0x7E, 0x9B, 0x28, 0xFA, 0x27, 0xA1, 0xEA
	.byte 0x85, 0x30, 0xEF, 0xD4, 0x05, 0x1D, 0x88, 0x04, 0x39, 0xD0, 0xD4, 0xD9, 0xE5, 0x99, 0xDB, 0xE6
	.byte 0xF8, 0x7C, 0xA2, 0x1F, 0x65, 0x56, 0xAC, 0xC4, 0x44, 0x22, 0x29, 0xF4, 0x97, 0xFF, 0x2A, 0x43
	.byte 0xA7, 0x23, 0x94, 0xAB, 0x39, 0xA0, 0x93, 0xFC, 0xC3, 0x59, 0x5B, 0x65, 0x92, 0xCC, 0x0C, 0x8F
	.byte 0x7D, 0xF4, 0xEF, 0xFF, 0xD1, 0x5D, 0x84, 0x85, 0x4F, 0x7E, 0xA8, 0x6F, 0xE0, 0xE6, 0x2C, 0xFE
	.byte 0x14, 0x43, 0x01, 0xA3, 0xA1, 0x11, 0x08, 0x4E, 0x82, 0x7E, 0x53, 0xF7, 0x35, 0xF2, 0x3A, 0xBD
	.byte 0xBB, 0xD2, 0xD7, 0x2A, 0x91, 0xD3, 0x86, 0xEB
_02110898:
	.byte 0x80
_02110899:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021108D8:
	.byte 0x01, 0x00, 0x00, 0x00
_021108DC:
	.byte 0x3F, 0x00, 0x00, 0x00
	.byte 0x7F, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x01, 0x00, 0x00, 0xFF, 0x03, 0x00, 0x00
	.byte 0xFF, 0x07, 0x00, 0x00, 0xFF, 0x0F, 0x00, 0x00, 0xFF, 0x1F, 0x00, 0x00
_021108FC:
	.byte 0xF7, 0xB5, 0xEF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02110904:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0xFC, 0x03, 0x00, 0x00
_02110914:
	.byte 0xFB, 0xE9, 0x3D, 0x40, 0xBC, 0xC7, 0xD1, 0x2C, 0x2A, 0xD0, 0x7C, 0x03
	.byte 0xF0, 0x08, 0x93, 0xF5
